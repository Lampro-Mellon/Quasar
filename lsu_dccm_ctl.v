module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
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
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 338:18]
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire [63:0] picm_rd_data_m = {io_lsu_pic_picm_rd_data,io_lsu_pic_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_load; // @[lsu_dccm_ctl.scala 145:63]
  wire [7:0] _T_5 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_8 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [1:0] _T_13 = io_addr_in_dccm_m ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_0 = {{6'd0}, _T_13}; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_15 = _GEN_0 & dccm_rdata_corr_m[7:0]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_16 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_15; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_17 = _T_5[0] ? _T_8[7:0] : _T_16; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_21 = {{4'd0}, _T_17[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_23 = {_T_17[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_25 = _T_23 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_26 = _T_21 | _T_25; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_1 = {{2'd0}, _T_26[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_31 = _GEN_1 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_33 = {_T_26[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_35 = _T_33 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_36 = _T_31 | _T_35; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_2 = {{1'd0}, _T_36[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_41 = _GEN_2 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_43 = {_T_36[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_45 = _T_43 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_46 = _T_41 | _T_45; // @[Bitwise.scala 103:39]
  wire [7:0] _T_57 = _GEN_0 & dccm_rdata_corr_m[15:8]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_58 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_57; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_59 = _T_5[1] ? _T_8[15:8] : _T_58; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_63 = {{4'd0}, _T_59[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_65 = {_T_59[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_67 = _T_65 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_68 = _T_63 | _T_67; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_4 = {{2'd0}, _T_68[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_73 = _GEN_4 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_75 = {_T_68[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_77 = _T_75 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_78 = _T_73 | _T_77; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_5 = {{1'd0}, _T_78[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_83 = _GEN_5 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_85 = {_T_78[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_87 = _T_85 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_88 = _T_83 | _T_87; // @[Bitwise.scala 103:39]
  wire [7:0] _T_99 = _GEN_0 & dccm_rdata_corr_m[23:16]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_100 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_99; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_101 = _T_5[2] ? _T_8[23:16] : _T_100; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_105 = {{4'd0}, _T_101[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_107 = {_T_101[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_109 = _T_107 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_110 = _T_105 | _T_109; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{2'd0}, _T_110[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_115 = _GEN_7 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_117 = {_T_110[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_119 = _T_117 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_120 = _T_115 | _T_119; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{1'd0}, _T_120[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_125 = _GEN_8 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_127 = {_T_120[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_129 = _T_127 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_130 = _T_125 | _T_129; // @[Bitwise.scala 103:39]
  wire [7:0] _T_141 = _GEN_0 & dccm_rdata_corr_m[31:24]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_142 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_141; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_143 = _T_5[3] ? _T_8[31:24] : _T_142; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_147 = {{4'd0}, _T_143[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_149 = {_T_143[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_151 = _T_149 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_152 = _T_147 | _T_151; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_10 = {{2'd0}, _T_152[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_157 = _GEN_10 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_159 = {_T_152[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_161 = _T_159 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_162 = _T_157 | _T_161; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_11 = {{1'd0}, _T_162[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_167 = _GEN_11 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_169 = {_T_162[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_171 = _T_169 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_172 = _T_167 | _T_171; // @[Bitwise.scala 103:39]
  wire [7:0] _T_183 = _GEN_0 & dccm_rdata_corr_m[39:32]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_184 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_183; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_185 = _T_5[4] ? _T_8[39:32] : _T_184; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_189 = {{4'd0}, _T_185[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_191 = {_T_185[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_193 = _T_191 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_194 = _T_189 | _T_193; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_13 = {{2'd0}, _T_194[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_199 = _GEN_13 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_201 = {_T_194[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_203 = _T_201 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_204 = _T_199 | _T_203; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_14 = {{1'd0}, _T_204[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_209 = _GEN_14 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_211 = {_T_204[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_213 = _T_211 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_214 = _T_209 | _T_213; // @[Bitwise.scala 103:39]
  wire [7:0] _T_225 = _GEN_0 & dccm_rdata_corr_m[47:40]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_226 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_225; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_227 = _T_5[5] ? _T_8[47:40] : _T_226; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_231 = {{4'd0}, _T_227[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_233 = {_T_227[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_235 = _T_233 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_236 = _T_231 | _T_235; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_16 = {{2'd0}, _T_236[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_241 = _GEN_16 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_243 = {_T_236[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_245 = _T_243 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_246 = _T_241 | _T_245; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_17 = {{1'd0}, _T_246[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_251 = _GEN_17 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_253 = {_T_246[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_255 = _T_253 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_256 = _T_251 | _T_255; // @[Bitwise.scala 103:39]
  wire [7:0] _T_267 = _GEN_0 & dccm_rdata_corr_m[55:48]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_268 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_267; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_269 = _T_5[6] ? _T_8[55:48] : _T_268; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_273 = {{4'd0}, _T_269[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_275 = {_T_269[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_277 = _T_275 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_278 = _T_273 | _T_277; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_19 = {{2'd0}, _T_278[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_283 = _GEN_19 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_285 = {_T_278[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_287 = _T_285 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_288 = _T_283 | _T_287; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_20 = {{1'd0}, _T_288[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_293 = _GEN_20 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_295 = {_T_288[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_297 = _T_295 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_298 = _T_293 | _T_297; // @[Bitwise.scala 103:39]
  wire [7:0] _T_309 = _GEN_0 & dccm_rdata_corr_m[63:56]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_310 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_309; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_311 = _T_5[7] ? _T_8[63:56] : _T_310; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_315 = {{4'd0}, _T_311[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_317 = {_T_311[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_319 = _T_317 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_320 = _T_315 | _T_319; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_22 = {{2'd0}, _T_320[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_325 = _GEN_22 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_327 = {_T_320[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_329 = _T_327 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_330 = _T_325 | _T_329; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_23 = {{1'd0}, _T_330[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_335 = _GEN_23 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_337 = {_T_330[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_339 = _T_337 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_340 = _T_335 | _T_339; // @[Bitwise.scala 103:39]
  wire [63:0] _T_348 = {_T_46,_T_88,_T_130,_T_172,_T_214,_T_256,_T_298,_T_340}; // @[Cat.scala 29:58]
  wire [63:0] _T_352 = {{32'd0}, _T_348[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_354 = {_T_348[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_356 = _T_354 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_357 = _T_352 | _T_356; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_24 = {{16'd0}, _T_357[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_362 = _GEN_24 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_364 = {_T_357[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_366 = _T_364 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_367 = _T_362 | _T_366; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_25 = {{8'd0}, _T_367[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_372 = _GEN_25 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_374 = {_T_367[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_376 = _T_374 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_377 = _T_372 | _T_376; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_26 = {{4'd0}, _T_377[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_382 = _GEN_26 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_384 = {_T_377[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_386 = _T_384 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_387 = _T_382 | _T_386; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_27 = {{2'd0}, _T_387[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_392 = _GEN_27 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_394 = {_T_387[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_396 = _T_394 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_397 = _T_392 | _T_396; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_28 = {{1'd0}, _T_397[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_402 = _GEN_28 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_404 = {_T_397[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_406 = _T_404 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_corr_m = _T_402 | _T_406; // @[Bitwise.scala 103:39]
  wire [127:0] _T_3 = {lsu_rdata_corr_m,lsu_rdata_corr_m}; // @[Cat.scala 29:58]
  wire [127:0] _T_4 = io_ldst_dual_m ? {{64'd0}, lsu_rdata_corr_m} : _T_3; // @[lsu_dccm_ctl.scala 147:47]
  wire [7:0] _T_418 = _GEN_0 & dccm_rdata_m[7:0]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_419 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_418; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_420 = _T_5[0] ? _T_8[7:0] : _T_419; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_424 = {{4'd0}, _T_420[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_426 = {_T_420[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_428 = _T_426 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_429 = _T_424 | _T_428; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_30 = {{2'd0}, _T_429[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_434 = _GEN_30 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_436 = {_T_429[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_438 = _T_436 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_439 = _T_434 | _T_438; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_31 = {{1'd0}, _T_439[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_444 = _GEN_31 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_446 = {_T_439[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_448 = _T_446 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_449 = _T_444 | _T_448; // @[Bitwise.scala 103:39]
  wire [7:0] _T_460 = _GEN_0 & dccm_rdata_m[15:8]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_461 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_460; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_462 = _T_5[1] ? _T_8[15:8] : _T_461; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_466 = {{4'd0}, _T_462[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_468 = {_T_462[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_470 = _T_468 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_471 = _T_466 | _T_470; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_33 = {{2'd0}, _T_471[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_476 = _GEN_33 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_478 = {_T_471[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_480 = _T_478 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_481 = _T_476 | _T_480; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_34 = {{1'd0}, _T_481[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_486 = _GEN_34 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_488 = {_T_481[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_490 = _T_488 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_491 = _T_486 | _T_490; // @[Bitwise.scala 103:39]
  wire [7:0] _T_502 = _GEN_0 & dccm_rdata_m[23:16]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_503 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_502; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_504 = _T_5[2] ? _T_8[23:16] : _T_503; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_508 = {{4'd0}, _T_504[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_510 = {_T_504[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_512 = _T_510 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_513 = _T_508 | _T_512; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_36 = {{2'd0}, _T_513[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_518 = _GEN_36 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_520 = {_T_513[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_522 = _T_520 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_523 = _T_518 | _T_522; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_37 = {{1'd0}, _T_523[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_528 = _GEN_37 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_530 = {_T_523[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_532 = _T_530 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_533 = _T_528 | _T_532; // @[Bitwise.scala 103:39]
  wire [7:0] _T_544 = _GEN_0 & dccm_rdata_m[31:24]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_545 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_544; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_546 = _T_5[3] ? _T_8[31:24] : _T_545; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_550 = {{4'd0}, _T_546[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_552 = {_T_546[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_554 = _T_552 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_555 = _T_550 | _T_554; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_39 = {{2'd0}, _T_555[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_560 = _GEN_39 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_562 = {_T_555[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_564 = _T_562 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_565 = _T_560 | _T_564; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_40 = {{1'd0}, _T_565[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_570 = _GEN_40 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_572 = {_T_565[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_574 = _T_572 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_575 = _T_570 | _T_574; // @[Bitwise.scala 103:39]
  wire [7:0] _T_586 = _GEN_0 & dccm_rdata_m[39:32]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_587 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_586; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_588 = _T_5[4] ? _T_8[39:32] : _T_587; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_592 = {{4'd0}, _T_588[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_594 = {_T_588[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_596 = _T_594 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_597 = _T_592 | _T_596; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_42 = {{2'd0}, _T_597[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_602 = _GEN_42 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_604 = {_T_597[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_606 = _T_604 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_607 = _T_602 | _T_606; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_43 = {{1'd0}, _T_607[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_612 = _GEN_43 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_614 = {_T_607[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_616 = _T_614 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_617 = _T_612 | _T_616; // @[Bitwise.scala 103:39]
  wire [7:0] _T_628 = _GEN_0 & dccm_rdata_m[47:40]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_629 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_628; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_630 = _T_5[5] ? _T_8[47:40] : _T_629; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_634 = {{4'd0}, _T_630[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_636 = {_T_630[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_638 = _T_636 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_639 = _T_634 | _T_638; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_45 = {{2'd0}, _T_639[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_644 = _GEN_45 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_646 = {_T_639[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_648 = _T_646 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_649 = _T_644 | _T_648; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_46 = {{1'd0}, _T_649[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_654 = _GEN_46 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_656 = {_T_649[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_658 = _T_656 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_659 = _T_654 | _T_658; // @[Bitwise.scala 103:39]
  wire [7:0] _T_670 = _GEN_0 & dccm_rdata_m[55:48]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_671 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_670; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_672 = _T_5[6] ? _T_8[55:48] : _T_671; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_676 = {{4'd0}, _T_672[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_678 = {_T_672[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_680 = _T_678 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_681 = _T_676 | _T_680; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_48 = {{2'd0}, _T_681[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_686 = _GEN_48 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_688 = {_T_681[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_690 = _T_688 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_691 = _T_686 | _T_690; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_49 = {{1'd0}, _T_691[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_696 = _GEN_49 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_698 = {_T_691[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_700 = _T_698 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_701 = _T_696 | _T_700; // @[Bitwise.scala 103:39]
  wire [7:0] _T_712 = _GEN_0 & dccm_rdata_m[63:56]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_713 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_712; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_714 = _T_5[7] ? _T_8[63:56] : _T_713; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_718 = {{4'd0}, _T_714[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_720 = {_T_714[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_722 = _T_720 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_723 = _T_718 | _T_722; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_51 = {{2'd0}, _T_723[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_728 = _GEN_51 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_730 = {_T_723[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_732 = _T_730 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_733 = _T_728 | _T_732; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_52 = {{1'd0}, _T_733[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_738 = _GEN_52 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_740 = {_T_733[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_742 = _T_740 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_743 = _T_738 | _T_742; // @[Bitwise.scala 103:39]
  wire [63:0] _T_751 = {_T_449,_T_491,_T_533,_T_575,_T_617,_T_659,_T_701,_T_743}; // @[Cat.scala 29:58]
  wire [63:0] _T_755 = {{32'd0}, _T_751[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_757 = {_T_751[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_759 = _T_757 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_760 = _T_755 | _T_759; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_53 = {{16'd0}, _T_760[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_765 = _GEN_53 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_767 = {_T_760[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_769 = _T_767 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_770 = _T_765 | _T_769; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_54 = {{8'd0}, _T_770[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_775 = _GEN_54 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_777 = {_T_770[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_779 = _T_777 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_780 = _T_775 | _T_779; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_55 = {{4'd0}, _T_780[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_785 = _GEN_55 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_787 = {_T_780[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_789 = _T_787 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_790 = _T_785 | _T_789; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_56 = {{2'd0}, _T_790[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_795 = _GEN_56 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_797 = {_T_790[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_799 = _T_797 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_800 = _T_795 | _T_799; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_57 = {{1'd0}, _T_800[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_805 = _GEN_57 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_807 = {_T_800[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_809 = _T_807 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_m = _T_805 | _T_809; // @[Bitwise.scala 103:39]
  wire  _T_812 = io_addr_in_pic_m | io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 157:123]
  wire  _T_813 = _T & _T_812; // @[lsu_dccm_ctl.scala 157:103]
  reg [63:0] _T_817; // @[lib.scala 374:16]
  wire [3:0] _GEN_58 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_dccm_ctl.scala 158:49]
  wire [5:0] _T_819 = 4'h8 * _GEN_58; // @[lsu_dccm_ctl.scala 158:49]
  wire [63:0] _T_820 = lsu_rdata_m >> _T_819; // @[lsu_dccm_ctl.scala 158:43]
  wire  _T_826 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:60]
  wire  _T_829 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:133]
  wire  _T_830 = _T_826 | _T_829; // @[lsu_dccm_ctl.scala 163:101]
  wire  _T_831 = _T_830 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 163:175]
  wire  _T_832 = _T_831 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 163:196]
  wire  _T_833 = _T_832 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 163:222]
  wire  _T_834 = _T_833 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 163:246]
  wire  _T_837 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:37]
  wire  _T_840 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:110]
  wire  _T_841 = _T_837 | _T_840; // @[lsu_dccm_ctl.scala 164:78]
  wire  _T_842 = _T_841 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 164:152]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 164:173]
  wire  _T_844 = _T_843 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 164:199]
  wire  _T_845 = _T_844 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 164:223]
  wire  kill_ecc_corr_lo_r = _T_834 | _T_845; // @[lsu_dccm_ctl.scala 163:267]
  wire  _T_848 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:60]
  wire  _T_851 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:133]
  wire  _T_852 = _T_848 | _T_851; // @[lsu_dccm_ctl.scala 166:101]
  wire  _T_853 = _T_852 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 166:175]
  wire  _T_854 = _T_853 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 166:196]
  wire  _T_855 = _T_854 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 166:222]
  wire  _T_856 = _T_855 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 166:246]
  wire  _T_859 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:37]
  wire  _T_862 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:110]
  wire  _T_863 = _T_859 | _T_862; // @[lsu_dccm_ctl.scala 167:78]
  wire  _T_864 = _T_863 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 167:152]
  wire  _T_865 = _T_864 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 167:173]
  wire  _T_866 = _T_865 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 167:199]
  wire  _T_867 = _T_866 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 167:223]
  wire  kill_ecc_corr_hi_r = _T_856 | _T_867; // @[lsu_dccm_ctl.scala 166:267]
  wire  _T_868 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[lsu_dccm_ctl.scala 169:60]
  wire  _T_869 = ~io_lsu_raw_fwd_lo_r; // @[lsu_dccm_ctl.scala 169:89]
  wire  ld_single_ecc_error_lo_r = _T_868 & _T_869; // @[lsu_dccm_ctl.scala 169:87]
  wire  _T_870 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 170:60]
  wire  _T_871 = ~io_lsu_raw_fwd_hi_r; // @[lsu_dccm_ctl.scala 170:89]
  wire  ld_single_ecc_error_hi_r = _T_870 & _T_871; // @[lsu_dccm_ctl.scala 170:87]
  wire  _T_872 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 171:63]
  wire  _T_873 = ~io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 171:93]
  wire  _T_875 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 172:81]
  wire  _T_876 = ld_single_ecc_error_lo_r & _T_875; // @[lsu_dccm_ctl.scala 172:62]
  wire  _T_877 = ~kill_ecc_corr_lo_r; // @[lsu_dccm_ctl.scala 172:108]
  wire  _T_879 = ld_single_ecc_error_hi_r & _T_875; // @[lsu_dccm_ctl.scala 173:62]
  wire  _T_880 = ~kill_ecc_corr_hi_r; // @[lsu_dccm_ctl.scala 173:108]
  wire  _T_881 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[lsu_dccm_ctl.scala 175:125]
  wire  _T_882 = ~_T_881; // @[lsu_dccm_ctl.scala 175:100]
  wire  _T_884 = io_lsu_addr_d[1:0] != 2'h0; // @[lsu_dccm_ctl.scala 175:174]
  wire  _T_885 = _T_882 | _T_884; // @[lsu_dccm_ctl.scala 175:152]
  wire  _T_886 = io_lsu_pkt_d_bits_store & _T_885; // @[lsu_dccm_ctl.scala 175:97]
  wire  _T_887 = io_lsu_pkt_d_bits_load | _T_886; // @[lsu_dccm_ctl.scala 175:70]
  wire  _T_888 = io_lsu_pkt_d_valid & _T_887; // @[lsu_dccm_ctl.scala 175:44]
  wire  lsu_dccm_rden_d = _T_888 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 175:191]
  reg  ld_single_ecc_error_lo_r_ff; // @[lsu_dccm_ctl.scala 284:73]
  reg  ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 283:73]
  wire  _T_889 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 178:63]
  reg  lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 282:73]
  wire  _T_890 = ~lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 178:96]
  wire  _T_892 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[lsu_dccm_ctl.scala 179:75]
  wire  _T_893 = _T_892 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 179:93]
  wire  _T_894 = ~_T_893; // @[lsu_dccm_ctl.scala 179:57]
  wire  _T_897 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[lsu_dccm_ctl.scala 180:95]
  wire  _T_900 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[lsu_dccm_ctl.scala 181:76]
  wire  _T_901 = _T_897 | _T_900; // @[lsu_dccm_ctl.scala 180:171]
  wire  _T_902 = ~_T_901; // @[lsu_dccm_ctl.scala 180:24]
  wire  _T_903 = lsu_dccm_rden_d & _T_902; // @[lsu_dccm_ctl.scala 180:22]
  wire  _T_904 = _T_894 | _T_903; // @[lsu_dccm_ctl.scala 179:124]
  wire  _T_906 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[lsu_dccm_ctl.scala 185:41]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[lib.scala 374:16]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[lib.scala 374:16]
  wire [15:0] _T_913 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[lsu_dccm_ctl.scala 189:8]
  wire [15:0] _T_917 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 190:8]
  wire [15:0] _T_923 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[lsu_dccm_ctl.scala 193:8]
  wire [15:0] _T_927 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 194:8]
  wire [38:0] _T_935 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_938 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_939 = ld_single_ecc_error_lo_r_ff ? _T_935 : _T_938; // @[lsu_dccm_ctl.scala 200:8]
  wire [38:0] _T_943 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_946 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_947 = io_dma_dccm_wen ? _T_943 : _T_946; // @[lsu_dccm_ctl.scala 202:8]
  wire [38:0] _T_957 = ld_single_ecc_error_hi_r_ff ? _T_938 : _T_935; // @[lsu_dccm_ctl.scala 206:8]
  wire [38:0] _T_961 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_965 = io_dma_dccm_wen ? _T_961 : _T_946; // @[lsu_dccm_ctl.scala 208:8]
  wire [3:0] _T_968 = io_lsu_pkt_m_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_970 = io_lsu_pkt_m_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_971 = _T_970 & 4'h1; // @[lsu_dccm_ctl.scala 212:94]
  wire [3:0] _T_973 = io_lsu_pkt_m_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_974 = _T_973 & 4'h3; // @[lsu_dccm_ctl.scala 213:38]
  wire [3:0] _T_975 = _T_971 | _T_974; // @[lsu_dccm_ctl.scala 212:107]
  wire [3:0] _T_977 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_979 = _T_975 | _T_977; // @[lsu_dccm_ctl.scala 213:51]
  wire [3:0] store_byteen_m = _T_968 & _T_979; // @[lsu_dccm_ctl.scala 212:58]
  wire [3:0] _T_981 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_983 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_984 = _T_983 & 4'h1; // @[lsu_dccm_ctl.scala 216:94]
  wire [3:0] _T_986 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_987 = _T_986 & 4'h3; // @[lsu_dccm_ctl.scala 217:38]
  wire [3:0] _T_988 = _T_984 | _T_987; // @[lsu_dccm_ctl.scala 216:107]
  wire [3:0] _T_990 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_992 = _T_988 | _T_990; // @[lsu_dccm_ctl.scala 217:51]
  wire [3:0] store_byteen_r = _T_981 & _T_992; // @[lsu_dccm_ctl.scala 216:58]
  wire [6:0] _GEN_60 = {{3'd0}, store_byteen_m}; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _T_995 = _GEN_60 << io_lsu_addr_m[1:0]; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _GEN_61 = {{3'd0}, store_byteen_r}; // @[lsu_dccm_ctl.scala 222:45]
  wire [6:0] _T_998 = _GEN_61 << io_lsu_addr_r[1:0]; // @[lsu_dccm_ctl.scala 222:45]
  wire  _T_1001 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[lsu_dccm_ctl.scala 225:67]
  wire  dccm_wr_bypass_d_m_lo = _T_1001 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 225:101]
  wire  _T_1004 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[lsu_dccm_ctl.scala 226:67]
  wire  dccm_wr_bypass_d_m_hi = _T_1004 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 226:101]
  wire  _T_1007 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 228:67]
  wire  dccm_wr_bypass_d_r_lo = _T_1007 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 228:101]
  wire  _T_1010 = io_stbuf_addr_any[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 229:67]
  wire  dccm_wr_bypass_d_r_hi = _T_1010 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 229:101]
  wire [63:0] _T_1013 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_63 = {{63'd0}, _T_1013}; // @[lsu_dccm_ctl.scala 258:72]
  wire [126:0] _T_1016 = _GEN_63 << _T_819; // @[lsu_dccm_ctl.scala 258:72]
  wire [63:0] store_data_pre_m = _T_1016[63:0]; // @[lsu_dccm_ctl.scala 258:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[lsu_dccm_ctl.scala 259:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[lsu_dccm_ctl.scala 260:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_995}; // @[lsu_dccm_ctl.scala 220:22]
  wire  _T_1022 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[lsu_dccm_ctl.scala 261:211]
  wire [7:0] _T_1026 = _T_1022 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1027 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_1026; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1031 = {{4'd0}, _T_1027[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1033 = {_T_1027[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1035 = _T_1033 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1036 = _T_1031 | _T_1035; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_64 = {{2'd0}, _T_1036[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1041 = _GEN_64 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1043 = {_T_1036[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1045 = _T_1043 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1046 = _T_1041 | _T_1045; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_65 = {{1'd0}, _T_1046[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1051 = _GEN_65 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1053 = {_T_1046[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1055 = _T_1053 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1056 = _T_1051 | _T_1055; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1064 = _T_1022 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1065 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1064; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1069 = {{4'd0}, _T_1065[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1071 = {_T_1065[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1073 = _T_1071 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1074 = _T_1069 | _T_1073; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_66 = {{2'd0}, _T_1074[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1079 = _GEN_66 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1081 = {_T_1074[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1083 = _T_1081 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1084 = _T_1079 | _T_1083; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_67 = {{1'd0}, _T_1084[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1089 = _GEN_67 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1091 = {_T_1084[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1093 = _T_1091 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1094 = _T_1089 | _T_1093; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1102 = _T_1022 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1103 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1102; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1107 = {{4'd0}, _T_1103[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1109 = {_T_1103[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1111 = _T_1109 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1112 = _T_1107 | _T_1111; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_68 = {{2'd0}, _T_1112[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1117 = _GEN_68 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1119 = {_T_1112[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1121 = _T_1119 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1122 = _T_1117 | _T_1121; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_69 = {{1'd0}, _T_1122[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1127 = _GEN_69 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1129 = {_T_1122[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1131 = _T_1129 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1132 = _T_1127 | _T_1131; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1140 = _T_1022 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1141 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1140; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1145 = {{4'd0}, _T_1141[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1147 = {_T_1141[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1149 = _T_1147 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1150 = _T_1145 | _T_1149; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_70 = {{2'd0}, _T_1150[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1155 = _GEN_70 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1157 = {_T_1150[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1159 = _T_1157 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1160 = _T_1155 | _T_1159; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_71 = {{1'd0}, _T_1160[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1165 = _GEN_71 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1167 = {_T_1160[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1169 = _T_1167 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1170 = _T_1165 | _T_1169; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1174 = {_T_1056,_T_1094,_T_1132,_T_1170}; // @[Cat.scala 29:58]
  wire [31:0] _T_1178 = {{16'd0}, _T_1174[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1180 = {_T_1174[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1182 = _T_1180 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1183 = _T_1178 | _T_1182; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_72 = {{8'd0}, _T_1183[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1188 = _GEN_72 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1190 = {_T_1183[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1192 = _T_1190 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1193 = _T_1188 | _T_1192; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_73 = {{4'd0}, _T_1193[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1198 = _GEN_73 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1200 = {_T_1193[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1202 = _T_1200 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1203 = _T_1198 | _T_1202; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_74 = {{2'd0}, _T_1203[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1208 = _GEN_74 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1210 = {_T_1203[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1212 = _T_1210 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1213 = _T_1208 | _T_1212; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_75 = {{1'd0}, _T_1213[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1218 = _GEN_75 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1220 = {_T_1213[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1222 = _T_1220 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg [31:0] _T_1224; // @[lsu_dccm_ctl.scala 261:72]
  wire  _T_1228 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[lsu_dccm_ctl.scala 262:177]
  wire [7:0] _T_1232 = _T_1228 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1233 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1232; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1237 = {{4'd0}, _T_1233[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1239 = {_T_1233[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1241 = _T_1239 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1242 = _T_1237 | _T_1241; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_76 = {{2'd0}, _T_1242[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1247 = _GEN_76 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1249 = {_T_1242[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1251 = _T_1249 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1252 = _T_1247 | _T_1251; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_77 = {{1'd0}, _T_1252[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1257 = _GEN_77 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1259 = {_T_1252[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1261 = _T_1259 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1262 = _T_1257 | _T_1261; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1270 = _T_1228 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1271 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1270; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1275 = {{4'd0}, _T_1271[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1277 = {_T_1271[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1279 = _T_1277 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1280 = _T_1275 | _T_1279; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_78 = {{2'd0}, _T_1280[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1285 = _GEN_78 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1287 = {_T_1280[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1289 = _T_1287 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1290 = _T_1285 | _T_1289; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_79 = {{1'd0}, _T_1290[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1295 = _GEN_79 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1297 = {_T_1290[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1299 = _T_1297 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1300 = _T_1295 | _T_1299; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1308 = _T_1228 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1309 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1308; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1313 = {{4'd0}, _T_1309[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1315 = {_T_1309[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1317 = _T_1315 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1318 = _T_1313 | _T_1317; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_80 = {{2'd0}, _T_1318[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1323 = _GEN_80 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1325 = {_T_1318[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1327 = _T_1325 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1328 = _T_1323 | _T_1327; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_81 = {{1'd0}, _T_1328[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1333 = _GEN_81 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1335 = {_T_1328[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1337 = _T_1335 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1338 = _T_1333 | _T_1337; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1346 = _T_1228 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1347 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1346; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1351 = {{4'd0}, _T_1347[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1353 = {_T_1347[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1355 = _T_1353 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1356 = _T_1351 | _T_1355; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_82 = {{2'd0}, _T_1356[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1361 = _GEN_82 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1363 = {_T_1356[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1365 = _T_1363 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1366 = _T_1361 | _T_1365; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_83 = {{1'd0}, _T_1366[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1371 = _GEN_83 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1373 = {_T_1366[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1375 = _T_1373 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1376 = _T_1371 | _T_1375; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1380 = {_T_1262,_T_1300,_T_1338,_T_1376}; // @[Cat.scala 29:58]
  wire [31:0] _T_1384 = {{16'd0}, _T_1380[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1386 = {_T_1380[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1388 = _T_1386 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1389 = _T_1384 | _T_1388; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_84 = {{8'd0}, _T_1389[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1394 = _GEN_84 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1396 = {_T_1389[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1398 = _T_1396 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1399 = _T_1394 | _T_1398; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_85 = {{4'd0}, _T_1399[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1404 = _GEN_85 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1406 = {_T_1399[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1408 = _T_1406 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1409 = _T_1404 | _T_1408; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_86 = {{2'd0}, _T_1409[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1414 = _GEN_86 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1416 = {_T_1409[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1418 = _T_1416 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1419 = _T_1414 | _T_1418; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_87 = {{1'd0}, _T_1419[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1424 = _GEN_87 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1426 = {_T_1419[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1428 = _T_1426 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1430 = io_ldst_dual_m & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 262:295]
  wire  _T_1431 = _T_1430 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 262:316]
  reg [31:0] _T_1435; // @[lib.scala 374:16]
  wire  _T_1436 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[lsu_dccm_ctl.scala 263:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_998}; // @[lsu_dccm_ctl.scala 222:22]
  wire  _T_1438 = ~store_byteen_ext_r[0]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1439 = _T_1436 & _T_1438; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1443 = _T_1439 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1447 = {{4'd0}, _T_1443[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1449 = {_T_1443[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1451 = _T_1449 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1452 = _T_1447 | _T_1451; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_88 = {{2'd0}, _T_1452[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1457 = _GEN_88 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1459 = {_T_1452[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1461 = _T_1459 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1462 = _T_1457 | _T_1461; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_89 = {{1'd0}, _T_1462[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1467 = _GEN_89 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1469 = {_T_1462[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1471 = _T_1469 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1472 = _T_1467 | _T_1471; // @[Bitwise.scala 103:39]
  wire  _T_1475 = ~store_byteen_ext_r[1]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1476 = _T_1436 & _T_1475; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1480 = _T_1476 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1484 = {{4'd0}, _T_1480[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1486 = {_T_1480[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1488 = _T_1486 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1489 = _T_1484 | _T_1488; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_90 = {{2'd0}, _T_1489[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1494 = _GEN_90 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1496 = {_T_1489[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1498 = _T_1496 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1499 = _T_1494 | _T_1498; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_91 = {{1'd0}, _T_1499[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1504 = _GEN_91 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1506 = {_T_1499[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1508 = _T_1506 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1509 = _T_1504 | _T_1508; // @[Bitwise.scala 103:39]
  wire  _T_1512 = ~store_byteen_ext_r[2]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1513 = _T_1436 & _T_1512; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1517 = _T_1513 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1521 = {{4'd0}, _T_1517[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1523 = {_T_1517[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1525 = _T_1523 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1526 = _T_1521 | _T_1525; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_92 = {{2'd0}, _T_1526[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1531 = _GEN_92 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1533 = {_T_1526[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1535 = _T_1533 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1536 = _T_1531 | _T_1535; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_93 = {{1'd0}, _T_1536[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1541 = _GEN_93 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1543 = {_T_1536[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1545 = _T_1543 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1546 = _T_1541 | _T_1545; // @[Bitwise.scala 103:39]
  wire  _T_1549 = ~store_byteen_ext_r[3]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1550 = _T_1436 & _T_1549; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1554 = _T_1550 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1558 = {{4'd0}, _T_1554[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1560 = {_T_1554[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1562 = _T_1560 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1563 = _T_1558 | _T_1562; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_94 = {{2'd0}, _T_1563[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1568 = _GEN_94 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1570 = {_T_1563[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1572 = _T_1570 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1573 = _T_1568 | _T_1572; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_95 = {{1'd0}, _T_1573[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1578 = _GEN_95 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1580 = {_T_1573[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1582 = _T_1580 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1583 = _T_1578 | _T_1582; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1587 = {_T_1472,_T_1509,_T_1546,_T_1583}; // @[Cat.scala 29:58]
  wire [31:0] _T_1591 = {{16'd0}, _T_1587[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1593 = {_T_1587[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1595 = _T_1593 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1596 = _T_1591 | _T_1595; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_96 = {{8'd0}, _T_1596[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1601 = _GEN_96 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1603 = {_T_1596[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1605 = _T_1603 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1606 = _T_1601 | _T_1605; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_97 = {{4'd0}, _T_1606[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1611 = _GEN_97 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1613 = {_T_1606[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1615 = _T_1613 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1616 = _T_1611 | _T_1615; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_98 = {{2'd0}, _T_1616[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1621 = _GEN_98 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1623 = {_T_1616[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1625 = _T_1623 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1626 = _T_1621 | _T_1625; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_99 = {{1'd0}, _T_1626[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1631 = _GEN_99 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1633 = {_T_1626[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1635 = _T_1633 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1637 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi; // @[lsu_dccm_ctl.scala 264:105]
  wire  _T_1639 = ~store_byteen_ext_r[4]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1640 = _T_1637 & _T_1639; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1644 = _T_1640 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1648 = {{4'd0}, _T_1644[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1650 = {_T_1644[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1652 = _T_1650 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1653 = _T_1648 | _T_1652; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_100 = {{2'd0}, _T_1653[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1658 = _GEN_100 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1660 = {_T_1653[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1662 = _T_1660 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1663 = _T_1658 | _T_1662; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_101 = {{1'd0}, _T_1663[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1668 = _GEN_101 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1670 = {_T_1663[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1672 = _T_1670 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1673 = _T_1668 | _T_1672; // @[Bitwise.scala 103:39]
  wire  _T_1676 = ~store_byteen_ext_r[5]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1677 = _T_1637 & _T_1676; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1681 = _T_1677 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1685 = {{4'd0}, _T_1681[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1687 = {_T_1681[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1689 = _T_1687 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1690 = _T_1685 | _T_1689; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_102 = {{2'd0}, _T_1690[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1695 = _GEN_102 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1697 = {_T_1690[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1699 = _T_1697 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1700 = _T_1695 | _T_1699; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_103 = {{1'd0}, _T_1700[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1705 = _GEN_103 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1707 = {_T_1700[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1709 = _T_1707 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1710 = _T_1705 | _T_1709; // @[Bitwise.scala 103:39]
  wire  _T_1713 = ~store_byteen_ext_r[6]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1714 = _T_1637 & _T_1713; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1718 = _T_1714 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1722 = {{4'd0}, _T_1718[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1724 = {_T_1718[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1726 = _T_1724 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1727 = _T_1722 | _T_1726; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_104 = {{2'd0}, _T_1727[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1732 = _GEN_104 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1734 = {_T_1727[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1736 = _T_1734 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1737 = _T_1732 | _T_1736; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_105 = {{1'd0}, _T_1737[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1742 = _GEN_105 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1744 = {_T_1737[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1746 = _T_1744 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1747 = _T_1742 | _T_1746; // @[Bitwise.scala 103:39]
  wire  _T_1750 = ~store_byteen_ext_r[7]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1751 = _T_1637 & _T_1750; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1755 = _T_1751 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1759 = {{4'd0}, _T_1755[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1761 = {_T_1755[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1763 = _T_1761 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1764 = _T_1759 | _T_1763; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_106 = {{2'd0}, _T_1764[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1769 = _GEN_106 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1771 = {_T_1764[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1773 = _T_1771 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1774 = _T_1769 | _T_1773; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_107 = {{1'd0}, _T_1774[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1779 = _GEN_107 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1781 = {_T_1774[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1783 = _T_1781 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1784 = _T_1779 | _T_1783; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1788 = {_T_1673,_T_1710,_T_1747,_T_1784}; // @[Cat.scala 29:58]
  wire [31:0] _T_1792 = {{16'd0}, _T_1788[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1794 = {_T_1788[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1796 = _T_1794 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1797 = _T_1792 | _T_1796; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_108 = {{8'd0}, _T_1797[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1802 = _GEN_108 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1804 = {_T_1797[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1806 = _T_1804 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1807 = _T_1802 | _T_1806; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_109 = {{4'd0}, _T_1807[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1812 = _GEN_109 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1814 = {_T_1807[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1816 = _T_1814 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1817 = _T_1812 | _T_1816; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_110 = {{2'd0}, _T_1817[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1822 = _GEN_110 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1824 = {_T_1817[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1826 = _T_1824 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1827 = _T_1822 | _T_1826; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_111 = {{1'd0}, _T_1827[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1832 = _GEN_111 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1834 = {_T_1827[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1836 = _T_1834 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] _T_1840 = {io_store_data_hi_r,io_store_data_lo_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_112 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[lsu_dccm_ctl.scala 265:94]
  wire [5:0] _T_1842 = 4'h8 * _GEN_112; // @[lsu_dccm_ctl.scala 265:94]
  wire [63:0] _T_1843 = _T_1840 >> _T_1842; // @[lsu_dccm_ctl.scala 265:88]
  wire [7:0] _T_1846 = store_byteen_r[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1849 = store_byteen_r[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1852 = store_byteen_r[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1855 = store_byteen_r[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1859 = {_T_1846,_T_1849,_T_1852,_T_1855}; // @[Cat.scala 29:58]
  wire [31:0] _T_1863 = {{16'd0}, _T_1859[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1865 = {_T_1859[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1867 = _T_1865 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1868 = _T_1863 | _T_1867; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_113 = {{8'd0}, _T_1868[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1873 = _GEN_113 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1875 = {_T_1868[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1877 = _T_1875 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1878 = _T_1873 | _T_1877; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_114 = {{4'd0}, _T_1878[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1883 = _GEN_114 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1885 = {_T_1878[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1887 = _T_1885 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1888 = _T_1883 | _T_1887; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_115 = {{2'd0}, _T_1888[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1893 = _GEN_115 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1895 = {_T_1888[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1897 = _T_1895 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1898 = _T_1893 | _T_1897; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_116 = {{1'd0}, _T_1898[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1903 = _GEN_116 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1905 = {_T_1898[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1907 = _T_1905 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1908 = _T_1903 | _T_1907; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_117 = {{32'd0}, _T_1908}; // @[lsu_dccm_ctl.scala 265:115]
  wire [63:0] _T_1909 = _T_1843 & _GEN_117; // @[lsu_dccm_ctl.scala 265:115]
  wire  _T_1914 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_dccm_ctl.scala 272:58]
  wire  _T_1915 = _T_1914 & io_addr_in_pic_r; // @[lsu_dccm_ctl.scala 272:84]
  wire  _T_1916 = _T_1915 & io_lsu_commit_r; // @[lsu_dccm_ctl.scala 272:103]
  wire  _T_1918 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[lsu_dccm_ctl.scala 273:58]
  wire  _T_1920 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 274:58]
  wire [31:0] _T_1924 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1930 = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[lsu_dccm_ctl.scala 276:93]
  wire [31:0] _T_1931 = {17'h0,_T_1930}; // @[Cat.scala 29:58]
  reg  _T_1938; // @[lsu_dccm_ctl.scala 280:61]
  reg  _T_1939; // @[lsu_dccm_ctl.scala 281:61]
  rvclkhdr rvclkhdr ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_dccm_rdata_hi_r = 32'h0; // @[lsu_dccm_ctl.scala 150:28]
  assign io_dccm_rdata_lo_r = 32'h0; // @[lsu_dccm_ctl.scala 149:28]
  assign io_dccm_data_ecc_hi_r = 7'h0; // @[lsu_dccm_ctl.scala 151:28]
  assign io_dccm_data_ecc_lo_r = 7'h0; // @[lsu_dccm_ctl.scala 152:28]
  assign io_lsu_ld_data_r = 32'h0; // @[lsu_dccm_ctl.scala 153:28]
  assign io_lsu_ld_data_corr_r = _T_817[31:0]; // @[lsu_dccm_ctl.scala 157:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[lsu_dccm_ctl.scala 268:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[lsu_dccm_ctl.scala 267:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[lsu_dccm_ctl.scala 270:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[lsu_dccm_ctl.scala 269:27]
  assign io_lsu_ld_data_m = _T_820[31:0]; // @[lsu_dccm_ctl.scala 158:28]
  assign io_store_data_hi_r = _T_1435; // @[lsu_dccm_ctl.scala 262:29]
  assign io_store_data_lo_r = _T_1224; // @[lsu_dccm_ctl.scala 261:29]
  assign io_store_datafn_hi_r = _T_1832 | _T_1836; // @[lsu_dccm_ctl.scala 264:29]
  assign io_store_datafn_lo_r = _T_1631 | _T_1635; // @[lsu_dccm_ctl.scala 263:29]
  assign io_store_data_r = _T_1909[31:0]; // @[lsu_dccm_ctl.scala 265:29]
  assign io_ld_single_ecc_error_r = _T_872 & _T_873; // @[lsu_dccm_ctl.scala 171:34]
  assign io_ld_single_ecc_error_r_ff = _T_889 & _T_890; // @[lsu_dccm_ctl.scala 178:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[lsu_dccm_ctl.scala 277:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_904; // @[lsu_dccm_ctl.scala 179:31]
  assign io_lsu_dccm_rden_m = _T_1938; // @[lsu_dccm_ctl.scala 280:24]
  assign io_lsu_dccm_rden_r = _T_1939; // @[lsu_dccm_ctl.scala 281:24]
  assign io_dma_dccm_ctl_dccm_dma_rvalid = _T & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 145:41]
  assign io_dma_dccm_ctl_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[lsu_dccm_ctl.scala 146:41]
  assign io_dma_dccm_ctl_dccm_dma_rtag = io_dma_mem_tag_m; // @[lsu_dccm_ctl.scala 148:41]
  assign io_dma_dccm_ctl_dccm_dma_rdata = _T_4[63:0]; // @[lsu_dccm_ctl.scala 147:41]
  assign io_dccm_wren = _T_906 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 185:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 186:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_913 : _T_917; // @[lsu_dccm_ctl.scala 188:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_923 : _T_927; // @[lsu_dccm_ctl.scala 192:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[lsu_dccm_ctl.scala 196:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[lsu_dccm_ctl.scala 197:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_939 : _T_947; // @[lsu_dccm_ctl.scala 199:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_957 : _T_965; // @[lsu_dccm_ctl.scala 205:22]
  assign io_lsu_pic_picm_wren = _T_1916 | io_dma_pic_wen; // @[lsu_dccm_ctl.scala 272:35]
  assign io_lsu_pic_picm_rden = _T_1918 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 273:35]
  assign io_lsu_pic_picm_mken = _T_1920 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 274:35]
  assign io_lsu_pic_picm_rdaddr = 32'hf00c0000 | _T_1924; // @[lsu_dccm_ctl.scala 275:35]
  assign io_lsu_pic_picm_wraddr = 32'hf00c0000 | _T_1931; // @[lsu_dccm_ctl.scala 276:35]
  assign io_lsu_pic_picm_wr_data = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[lsu_dccm_ctl.scala 278:35]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_io_en = _T_813 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = _T_1431 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  _T_817 = _RAND_0[63:0];
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
  _T_1224 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1435 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1938 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_1939 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_817 = 64'h0;
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
    _T_1224 = 32'h0;
  end
  if (reset) begin
    _T_1435 = 32'h0;
  end
  if (reset) begin
    _T_1938 = 1'h0;
  end
  if (reset) begin
    _T_1939 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_817 <= 64'h0;
    end else begin
      _T_817 <= lsu_rdata_corr_m >> _T_819;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_876 & _T_877;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_hi_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_hi_r_ff <= _T_879 & _T_880;
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
      _T_1224 <= 32'h0;
    end else begin
      _T_1224 <= _T_1218 | _T_1222;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1435 <= 32'h0;
    end else begin
      _T_1435 <= _T_1424 | _T_1428;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_1938 <= 1'h0;
    end else begin
      _T_1938 <= _T_888 & io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1939 <= 1'h0;
    end else begin
      _T_1939 <= io_lsu_dccm_rden_m;
    end
  end
endmodule
