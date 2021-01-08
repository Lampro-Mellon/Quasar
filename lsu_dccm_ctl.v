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
  input         io_lsu_pkt_d_bits_stack,
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
  input         io_lsu_pkt_m_bits_stack,
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
  input         io_lsu_pkt_r_bits_stack,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 390:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 390:23]
  wire [63:0] picm_rd_data_m = {io_lsu_pic_picm_rd_data,io_lsu_pic_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_r = {io_sec_data_hi_r,io_sec_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_r = {io_dccm_rdata_hi_r,io_dccm_rdata_lo_r}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_load; // @[lsu_dccm_ctl.scala 124:62]
  reg [7:0] _T_28; // @[lsu_dccm_ctl.scala 133:64]
  wire [63:0] stbuf_fwdbyteen_r = {{56'd0}, _T_28}; // @[lsu_dccm_ctl.scala 133:27]
  reg [31:0] _T_31; // @[Reg.scala 27:20]
  reg [31:0] _T_34; // @[Reg.scala 27:20]
  wire [63:0] stbuf_fwddata_r = {_T_31,_T_34}; // @[Cat.scala 29:58]
  reg [31:0] picm_rd_data_r_32; // @[Reg.scala 27:20]
  wire [63:0] picm_rd_data_r = {picm_rd_data_r_32,picm_rd_data_r_32}; // @[Cat.scala 29:58]
  wire [7:0] _T_49 = io_addr_in_dccm_r ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_51 = _T_49 & dccm_rdata_corr_r[7:0]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_52 = io_addr_in_pic_r ? picm_rd_data_r[7:0] : _T_51; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_53 = stbuf_fwdbyteen_r[0] ? stbuf_fwddata_r[7:0] : _T_52; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_57 = {{4'd0}, _T_53[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_59 = {_T_53[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_61 = _T_59 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_62 = _T_57 | _T_61; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_10 = {{2'd0}, _T_62[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_67 = _GEN_10 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_69 = {_T_62[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_71 = _T_69 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_72 = _T_67 | _T_71; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_11 = {{1'd0}, _T_72[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_77 = _GEN_11 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_79 = {_T_72[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_81 = _T_79 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_82 = _T_77 | _T_81; // @[Bitwise.scala 103:39]
  wire [7:0] _T_91 = _T_49 & dccm_rdata_corr_r[15:8]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_92 = io_addr_in_pic_r ? picm_rd_data_r[15:8] : _T_91; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_93 = stbuf_fwdbyteen_r[1] ? stbuf_fwddata_r[15:8] : _T_92; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_97 = {{4'd0}, _T_93[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_99 = {_T_93[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_101 = _T_99 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_102 = _T_97 | _T_101; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_12 = {{2'd0}, _T_102[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_107 = _GEN_12 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_109 = {_T_102[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_111 = _T_109 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_112 = _T_107 | _T_111; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_13 = {{1'd0}, _T_112[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_117 = _GEN_13 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_119 = {_T_112[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_121 = _T_119 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_122 = _T_117 | _T_121; // @[Bitwise.scala 103:39]
  wire [7:0] _T_131 = _T_49 & dccm_rdata_corr_r[23:16]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_132 = io_addr_in_pic_r ? picm_rd_data_r[23:16] : _T_131; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_133 = stbuf_fwdbyteen_r[2] ? stbuf_fwddata_r[23:16] : _T_132; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_137 = {{4'd0}, _T_133[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_139 = {_T_133[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_141 = _T_139 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_142 = _T_137 | _T_141; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_14 = {{2'd0}, _T_142[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_147 = _GEN_14 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_149 = {_T_142[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_151 = _T_149 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_152 = _T_147 | _T_151; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_15 = {{1'd0}, _T_152[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_157 = _GEN_15 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_159 = {_T_152[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_161 = _T_159 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_162 = _T_157 | _T_161; // @[Bitwise.scala 103:39]
  wire [7:0] _T_171 = _T_49 & dccm_rdata_corr_r[31:24]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_172 = io_addr_in_pic_r ? picm_rd_data_r[31:24] : _T_171; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_173 = stbuf_fwdbyteen_r[3] ? stbuf_fwddata_r[31:24] : _T_172; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_177 = {{4'd0}, _T_173[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_179 = {_T_173[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_181 = _T_179 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_182 = _T_177 | _T_181; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_16 = {{2'd0}, _T_182[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_187 = _GEN_16 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_189 = {_T_182[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_191 = _T_189 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_192 = _T_187 | _T_191; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_17 = {{1'd0}, _T_192[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_197 = _GEN_17 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_199 = {_T_192[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_201 = _T_199 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_202 = _T_197 | _T_201; // @[Bitwise.scala 103:39]
  wire [7:0] _T_211 = _T_49 & dccm_rdata_corr_r[39:32]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_212 = io_addr_in_pic_r ? picm_rd_data_r[39:32] : _T_211; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_213 = stbuf_fwdbyteen_r[4] ? stbuf_fwddata_r[39:32] : _T_212; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_217 = {{4'd0}, _T_213[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_219 = {_T_213[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_221 = _T_219 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_222 = _T_217 | _T_221; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_18 = {{2'd0}, _T_222[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_227 = _GEN_18 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_229 = {_T_222[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_231 = _T_229 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_232 = _T_227 | _T_231; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_19 = {{1'd0}, _T_232[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_237 = _GEN_19 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_239 = {_T_232[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_241 = _T_239 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_242 = _T_237 | _T_241; // @[Bitwise.scala 103:39]
  wire [7:0] _T_251 = _T_49 & dccm_rdata_corr_r[47:40]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_252 = io_addr_in_pic_r ? picm_rd_data_r[47:40] : _T_251; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_253 = stbuf_fwdbyteen_r[5] ? stbuf_fwddata_r[47:40] : _T_252; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_257 = {{4'd0}, _T_253[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_259 = {_T_253[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_261 = _T_259 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_262 = _T_257 | _T_261; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_20 = {{2'd0}, _T_262[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_267 = _GEN_20 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_269 = {_T_262[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_271 = _T_269 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_272 = _T_267 | _T_271; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_21 = {{1'd0}, _T_272[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_277 = _GEN_21 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_279 = {_T_272[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_281 = _T_279 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_282 = _T_277 | _T_281; // @[Bitwise.scala 103:39]
  wire [7:0] _T_291 = _T_49 & dccm_rdata_corr_r[55:48]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_292 = io_addr_in_pic_r ? picm_rd_data_r[55:48] : _T_291; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_293 = stbuf_fwdbyteen_r[6] ? stbuf_fwddata_r[55:48] : _T_292; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_297 = {{4'd0}, _T_293[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_299 = {_T_293[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_301 = _T_299 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_302 = _T_297 | _T_301; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_22 = {{2'd0}, _T_302[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_307 = _GEN_22 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_309 = {_T_302[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_311 = _T_309 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_312 = _T_307 | _T_311; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_23 = {{1'd0}, _T_312[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_317 = _GEN_23 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_319 = {_T_312[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_321 = _T_319 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_322 = _T_317 | _T_321; // @[Bitwise.scala 103:39]
  wire [7:0] _T_331 = _T_49 & dccm_rdata_corr_r[63:56]; // @[lsu_dccm_ctl.scala 138:219]
  wire [7:0] _T_332 = io_addr_in_pic_r ? picm_rd_data_r[63:56] : _T_331; // @[lsu_dccm_ctl.scala 138:139]
  wire [7:0] _T_333 = stbuf_fwdbyteen_r[7] ? stbuf_fwddata_r[63:56] : _T_332; // @[lsu_dccm_ctl.scala 138:77]
  wire [7:0] _T_337 = {{4'd0}, _T_333[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_339 = {_T_333[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_341 = _T_339 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_342 = _T_337 | _T_341; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_24 = {{2'd0}, _T_342[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_347 = _GEN_24 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_349 = {_T_342[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_351 = _T_349 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_352 = _T_347 | _T_351; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_25 = {{1'd0}, _T_352[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_357 = _GEN_25 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_359 = {_T_352[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_361 = _T_359 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_362 = _T_357 | _T_361; // @[Bitwise.scala 103:39]
  wire [63:0] _T_370 = {_T_82,_T_122,_T_162,_T_202,_T_242,_T_282,_T_322,_T_362}; // @[Cat.scala 29:58]
  wire [63:0] _T_374 = {{32'd0}, _T_370[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_376 = {_T_370[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_378 = _T_376 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_379 = _T_374 | _T_378; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_26 = {{16'd0}, _T_379[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_384 = _GEN_26 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_386 = {_T_379[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_388 = _T_386 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_389 = _T_384 | _T_388; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_27 = {{8'd0}, _T_389[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_394 = _GEN_27 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_396 = {_T_389[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_398 = _T_396 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_399 = _T_394 | _T_398; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_28 = {{4'd0}, _T_399[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_404 = _GEN_28 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_406 = {_T_399[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_408 = _T_406 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_409 = _T_404 | _T_408; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_29 = {{2'd0}, _T_409[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_414 = _GEN_29 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_416 = {_T_409[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_418 = _T_416 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_419 = _T_414 | _T_418; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_30 = {{1'd0}, _T_419[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_424 = _GEN_30 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_426 = {_T_419[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_428 = _T_426 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_corr_r = _T_424 | _T_428; // @[Bitwise.scala 103:39]
  wire [63:0] _T_4 = {lsu_rdata_corr_r[31:0],lsu_rdata_corr_r[31:0]}; // @[Cat.scala 29:58]
  wire  _T_6 = |io_stbuf_fwdbyteen_hi_m; // @[lsu_dccm_ctl.scala 127:49]
  wire  _T_7 = |io_stbuf_fwdbyteen_lo_m; // @[lsu_dccm_ctl.scala 127:79]
  wire  _T_8 = _T_6 | _T_7; // @[lsu_dccm_ctl.scala 127:53]
  wire  stbuf_fwddata_en = _T_8 | io_clk_override; // @[lsu_dccm_ctl.scala 127:83]
  wire  _T_10 = io_lsu_dccm_rden_m & io_ldst_dual_m; // @[lsu_dccm_ctl.scala 129:77]
  wire  _T_11 = _T_10 | io_clk_override; // @[lsu_dccm_ctl.scala 129:95]
  reg [31:0] _T_14; // @[Reg.scala 27:20]
  wire  _T_15 = io_lsu_dccm_rden_m | io_clk_override; // @[lsu_dccm_ctl.scala 130:75]
  reg [31:0] _T_18; // @[Reg.scala 27:20]
  reg [6:0] _T_22; // @[Reg.scala 27:20]
  reg [6:0] _T_26; // @[Reg.scala 27:20]
  wire  _T_37 = io_addr_in_pic_m | io_clk_override; // @[lsu_dccm_ctl.scala 135:76]
  reg [2:0] _T_42; // @[lsu_dccm_ctl.scala 137:77]
  wire [7:0] _T_438 = _T_49 & dccm_rdata_r[7:0]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_439 = io_addr_in_pic_r ? picm_rd_data_r[7:0] : _T_438; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_440 = stbuf_fwdbyteen_r[0] ? stbuf_fwddata_r[7:0] : _T_439; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_444 = {{4'd0}, _T_440[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_446 = {_T_440[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_448 = _T_446 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_449 = _T_444 | _T_448; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_31 = {{2'd0}, _T_449[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_454 = _GEN_31 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_456 = {_T_449[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_458 = _T_456 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_459 = _T_454 | _T_458; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_32 = {{1'd0}, _T_459[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_464 = _GEN_32 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_466 = {_T_459[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_468 = _T_466 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_469 = _T_464 | _T_468; // @[Bitwise.scala 103:39]
  wire [7:0] _T_478 = _T_49 & dccm_rdata_r[15:8]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_479 = io_addr_in_pic_r ? picm_rd_data_r[15:8] : _T_478; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_480 = stbuf_fwdbyteen_r[1] ? stbuf_fwddata_r[15:8] : _T_479; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_484 = {{4'd0}, _T_480[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_486 = {_T_480[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_488 = _T_486 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_489 = _T_484 | _T_488; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_33 = {{2'd0}, _T_489[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_494 = _GEN_33 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_496 = {_T_489[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_498 = _T_496 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_499 = _T_494 | _T_498; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_34 = {{1'd0}, _T_499[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_504 = _GEN_34 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_506 = {_T_499[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_508 = _T_506 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_509 = _T_504 | _T_508; // @[Bitwise.scala 103:39]
  wire [7:0] _T_518 = _T_49 & dccm_rdata_r[23:16]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_519 = io_addr_in_pic_r ? picm_rd_data_r[23:16] : _T_518; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_520 = stbuf_fwdbyteen_r[2] ? stbuf_fwddata_r[23:16] : _T_519; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_524 = {{4'd0}, _T_520[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_526 = {_T_520[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_528 = _T_526 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_529 = _T_524 | _T_528; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_35 = {{2'd0}, _T_529[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_534 = _GEN_35 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_536 = {_T_529[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_538 = _T_536 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_539 = _T_534 | _T_538; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_36 = {{1'd0}, _T_539[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_544 = _GEN_36 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_546 = {_T_539[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_548 = _T_546 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_549 = _T_544 | _T_548; // @[Bitwise.scala 103:39]
  wire [7:0] _T_558 = _T_49 & dccm_rdata_r[31:24]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_559 = io_addr_in_pic_r ? picm_rd_data_r[31:24] : _T_558; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_560 = stbuf_fwdbyteen_r[3] ? stbuf_fwddata_r[31:24] : _T_559; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_564 = {{4'd0}, _T_560[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_566 = {_T_560[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_568 = _T_566 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_569 = _T_564 | _T_568; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_37 = {{2'd0}, _T_569[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_574 = _GEN_37 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_576 = {_T_569[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_578 = _T_576 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_579 = _T_574 | _T_578; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_38 = {{1'd0}, _T_579[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_584 = _GEN_38 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_586 = {_T_579[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_588 = _T_586 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_589 = _T_584 | _T_588; // @[Bitwise.scala 103:39]
  wire [7:0] _T_598 = _T_49 & dccm_rdata_r[39:32]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_599 = io_addr_in_pic_r ? picm_rd_data_r[39:32] : _T_598; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_600 = stbuf_fwdbyteen_r[4] ? stbuf_fwddata_r[39:32] : _T_599; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_604 = {{4'd0}, _T_600[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_606 = {_T_600[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_608 = _T_606 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_609 = _T_604 | _T_608; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_39 = {{2'd0}, _T_609[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_614 = _GEN_39 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_616 = {_T_609[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_618 = _T_616 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_619 = _T_614 | _T_618; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_40 = {{1'd0}, _T_619[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_624 = _GEN_40 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_626 = {_T_619[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_628 = _T_626 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_629 = _T_624 | _T_628; // @[Bitwise.scala 103:39]
  wire [7:0] _T_638 = _T_49 & dccm_rdata_r[47:40]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_639 = io_addr_in_pic_r ? picm_rd_data_r[47:40] : _T_638; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_640 = stbuf_fwdbyteen_r[5] ? stbuf_fwddata_r[47:40] : _T_639; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_644 = {{4'd0}, _T_640[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_646 = {_T_640[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_648 = _T_646 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_649 = _T_644 | _T_648; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_41 = {{2'd0}, _T_649[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_654 = _GEN_41 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_656 = {_T_649[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_658 = _T_656 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_659 = _T_654 | _T_658; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_42 = {{1'd0}, _T_659[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_664 = _GEN_42 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_666 = {_T_659[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_668 = _T_666 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_669 = _T_664 | _T_668; // @[Bitwise.scala 103:39]
  wire [7:0] _T_678 = _T_49 & dccm_rdata_r[55:48]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_679 = io_addr_in_pic_r ? picm_rd_data_r[55:48] : _T_678; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_680 = stbuf_fwdbyteen_r[6] ? stbuf_fwddata_r[55:48] : _T_679; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_684 = {{4'd0}, _T_680[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_686 = {_T_680[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_688 = _T_686 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_689 = _T_684 | _T_688; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_43 = {{2'd0}, _T_689[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_694 = _GEN_43 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_696 = {_T_689[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_698 = _T_696 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_699 = _T_694 | _T_698; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_44 = {{1'd0}, _T_699[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_704 = _GEN_44 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_706 = {_T_699[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_708 = _T_706 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_709 = _T_704 | _T_708; // @[Bitwise.scala 103:39]
  wire [7:0] _T_718 = _T_49 & dccm_rdata_r[63:56]; // @[lsu_dccm_ctl.scala 139:219]
  wire [7:0] _T_719 = io_addr_in_pic_r ? picm_rd_data_r[63:56] : _T_718; // @[lsu_dccm_ctl.scala 139:139]
  wire [7:0] _T_720 = stbuf_fwdbyteen_r[7] ? stbuf_fwddata_r[63:56] : _T_719; // @[lsu_dccm_ctl.scala 139:77]
  wire [7:0] _T_724 = {{4'd0}, _T_720[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_726 = {_T_720[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_728 = _T_726 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_729 = _T_724 | _T_728; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_45 = {{2'd0}, _T_729[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_734 = _GEN_45 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_736 = {_T_729[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_738 = _T_736 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_739 = _T_734 | _T_738; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_46 = {{1'd0}, _T_739[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_744 = _GEN_46 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_746 = {_T_739[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_748 = _T_746 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_749 = _T_744 | _T_748; // @[Bitwise.scala 103:39]
  wire [63:0] _T_757 = {_T_469,_T_509,_T_549,_T_589,_T_629,_T_669,_T_709,_T_749}; // @[Cat.scala 29:58]
  wire [63:0] _T_761 = {{32'd0}, _T_757[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_763 = {_T_757[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_765 = _T_763 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_766 = _T_761 | _T_765; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_47 = {{16'd0}, _T_766[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_771 = _GEN_47 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_773 = {_T_766[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_775 = _T_773 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_776 = _T_771 | _T_775; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_48 = {{8'd0}, _T_776[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_781 = _GEN_48 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_783 = {_T_776[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_785 = _T_783 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_786 = _T_781 | _T_785; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_49 = {{4'd0}, _T_786[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_791 = _GEN_49 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_793 = {_T_786[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_795 = _T_793 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_796 = _T_791 | _T_795; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_50 = {{2'd0}, _T_796[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_801 = _GEN_50 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_803 = {_T_796[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_805 = _T_803 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_806 = _T_801 | _T_805; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_51 = {{1'd0}, _T_806[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_811 = _GEN_51 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_813 = {_T_806[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_815 = _T_813 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_r = _T_811 | _T_815; // @[Bitwise.scala 103:39]
  wire [3:0] _GEN_52 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[lsu_dccm_ctl.scala 140:47]
  wire [5:0] _T_818 = 4'h8 * _GEN_52; // @[lsu_dccm_ctl.scala 140:47]
  wire [63:0] _T_819 = lsu_rdata_r >> _T_818; // @[lsu_dccm_ctl.scala 140:41]
  wire [63:0] _T_822 = lsu_rdata_corr_r >> _T_818; // @[lsu_dccm_ctl.scala 141:47]
  wire  _T_825 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:60]
  wire  _T_828 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:133]
  wire  _T_829 = _T_825 | _T_828; // @[lsu_dccm_ctl.scala 163:101]
  wire  _T_830 = _T_829 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 163:175]
  wire  _T_831 = _T_830 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 163:196]
  wire  _T_832 = _T_831 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 163:222]
  wire  _T_833 = _T_832 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 163:246]
  wire  _T_836 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:37]
  wire  _T_839 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:110]
  wire  _T_840 = _T_836 | _T_839; // @[lsu_dccm_ctl.scala 164:78]
  wire  _T_841 = _T_840 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 164:152]
  wire  _T_842 = _T_841 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 164:173]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 164:199]
  wire  _T_844 = _T_843 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 164:223]
  wire  kill_ecc_corr_lo_r = _T_833 | _T_844; // @[lsu_dccm_ctl.scala 163:267]
  wire  _T_847 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:60]
  wire  _T_850 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:133]
  wire  _T_851 = _T_847 | _T_850; // @[lsu_dccm_ctl.scala 166:101]
  wire  _T_852 = _T_851 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 166:175]
  wire  _T_853 = _T_852 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 166:196]
  wire  _T_854 = _T_853 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 166:222]
  wire  _T_855 = _T_854 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 166:246]
  wire  _T_858 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:37]
  wire  _T_861 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:110]
  wire  _T_862 = _T_858 | _T_861; // @[lsu_dccm_ctl.scala 167:78]
  wire  _T_863 = _T_862 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 167:152]
  wire  _T_864 = _T_863 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 167:173]
  wire  _T_865 = _T_864 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 167:199]
  wire  _T_866 = _T_865 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 167:223]
  wire  kill_ecc_corr_hi_r = _T_855 | _T_866; // @[lsu_dccm_ctl.scala 166:267]
  wire  _T_867 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[lsu_dccm_ctl.scala 169:60]
  wire  _T_868 = ~io_lsu_raw_fwd_lo_r; // @[lsu_dccm_ctl.scala 169:89]
  wire  ld_single_ecc_error_lo_r = _T_867 & _T_868; // @[lsu_dccm_ctl.scala 169:87]
  wire  _T_869 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 170:60]
  wire  _T_870 = ~io_lsu_raw_fwd_hi_r; // @[lsu_dccm_ctl.scala 170:89]
  wire  ld_single_ecc_error_hi_r = _T_869 & _T_870; // @[lsu_dccm_ctl.scala 170:87]
  wire  _T_871 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 171:63]
  wire  _T_872 = ~io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 171:93]
  wire  _T_874 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 172:81]
  wire  _T_875 = ld_single_ecc_error_lo_r & _T_874; // @[lsu_dccm_ctl.scala 172:62]
  wire  _T_876 = ~kill_ecc_corr_lo_r; // @[lsu_dccm_ctl.scala 172:108]
  wire  _T_878 = ld_single_ecc_error_hi_r & _T_874; // @[lsu_dccm_ctl.scala 173:62]
  wire  _T_879 = ~kill_ecc_corr_hi_r; // @[lsu_dccm_ctl.scala 173:108]
  wire  _T_880 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[lsu_dccm_ctl.scala 175:125]
  wire  _T_881 = ~_T_880; // @[lsu_dccm_ctl.scala 175:100]
  wire  _T_883 = io_lsu_addr_d[1:0] != 2'h0; // @[lsu_dccm_ctl.scala 175:174]
  wire  _T_884 = _T_881 | _T_883; // @[lsu_dccm_ctl.scala 175:152]
  wire  _T_885 = io_lsu_pkt_d_bits_store & _T_884; // @[lsu_dccm_ctl.scala 175:97]
  wire  _T_886 = io_lsu_pkt_d_bits_load | _T_885; // @[lsu_dccm_ctl.scala 175:70]
  wire  _T_887 = io_lsu_pkt_d_valid & _T_886; // @[lsu_dccm_ctl.scala 175:44]
  wire  lsu_dccm_rden_d = _T_887 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 175:191]
  reg  ld_single_ecc_error_lo_r_ff; // @[lsu_dccm_ctl.scala 284:73]
  reg  ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 283:73]
  wire  _T_888 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 178:63]
  reg  lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 282:73]
  wire  _T_889 = ~lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 178:96]
  wire  _T_891 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[lsu_dccm_ctl.scala 179:75]
  wire  _T_892 = _T_891 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 179:93]
  wire  _T_893 = ~_T_892; // @[lsu_dccm_ctl.scala 179:57]
  wire  _T_896 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[lsu_dccm_ctl.scala 180:95]
  wire  _T_899 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[lsu_dccm_ctl.scala 181:76]
  wire  _T_900 = _T_896 | _T_899; // @[lsu_dccm_ctl.scala 180:171]
  wire  _T_901 = ~_T_900; // @[lsu_dccm_ctl.scala 180:24]
  wire  _T_902 = lsu_dccm_rden_d & _T_901; // @[lsu_dccm_ctl.scala 180:22]
  wire  _T_903 = _T_893 | _T_902; // @[lsu_dccm_ctl.scala 179:124]
  wire  _T_905 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[lsu_dccm_ctl.scala 185:41]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[Reg.scala 27:20]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[Reg.scala 27:20]
  wire [15:0] _T_912 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[lsu_dccm_ctl.scala 189:8]
  wire [15:0] _T_916 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 190:8]
  wire [15:0] _T_922 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[lsu_dccm_ctl.scala 193:8]
  wire [15:0] _T_926 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 194:8]
  wire [38:0] _T_934 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_937 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_938 = ld_single_ecc_error_lo_r_ff ? _T_934 : _T_937; // @[lsu_dccm_ctl.scala 200:8]
  wire [38:0] _T_942 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_945 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_946 = io_dma_dccm_wen ? _T_942 : _T_945; // @[lsu_dccm_ctl.scala 202:8]
  wire [38:0] _T_956 = ld_single_ecc_error_hi_r_ff ? _T_937 : _T_934; // @[lsu_dccm_ctl.scala 206:8]
  wire [38:0] _T_960 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_964 = io_dma_dccm_wen ? _T_960 : _T_945; // @[lsu_dccm_ctl.scala 208:8]
  wire [3:0] _T_980 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_982 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_983 = _T_982 & 4'h1; // @[lsu_dccm_ctl.scala 216:94]
  wire [3:0] _T_985 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_986 = _T_985 & 4'h3; // @[lsu_dccm_ctl.scala 217:38]
  wire [3:0] _T_987 = _T_983 | _T_986; // @[lsu_dccm_ctl.scala 216:107]
  wire [3:0] _T_989 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_991 = _T_987 | _T_989; // @[lsu_dccm_ctl.scala 217:51]
  wire [3:0] store_byteen_r = _T_980 & _T_991; // @[lsu_dccm_ctl.scala 216:58]
  wire [6:0] _GEN_55 = {{3'd0}, store_byteen_r}; // @[lsu_dccm_ctl.scala 222:45]
  wire [6:0] _T_997 = _GEN_55 << io_lsu_addr_r[1:0]; // @[lsu_dccm_ctl.scala 222:45]
  wire  _T_1000 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[lsu_dccm_ctl.scala 225:67]
  wire  _T_1003 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[lsu_dccm_ctl.scala 226:67]
  wire  _T_1006 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 228:67]
  wire  dccm_wr_bypass_d_r_lo = _T_1006 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 228:101]
  wire [63:0] _T_1012 = {32'h0,io_store_data_r}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_57 = {{63'd0}, _T_1012}; // @[lsu_dccm_ctl.scala 243:72]
  wire [126:0] _T_1015 = _GEN_57 << _T_818; // @[lsu_dccm_ctl.scala 243:72]
  wire [63:0] store_data_pre_r = _T_1015[63:0]; // @[lsu_dccm_ctl.scala 243:29]
  wire [31:0] store_data_pre_hi_r = store_data_pre_r[63:32]; // @[lsu_dccm_ctl.scala 244:48]
  wire [31:0] store_data_pre_lo_r = store_data_pre_r[31:0]; // @[lsu_dccm_ctl.scala 245:48]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_997}; // @[lsu_dccm_ctl.scala 222:22]
  reg  dccm_wren_Q; // @[lsu_dccm_ctl.scala 250:69]
  reg  dccm_wr_bypass_d_m_lo_Q; // @[lsu_dccm_ctl.scala 252:69]
  wire  _T_1021 = dccm_wren_Q & dccm_wr_bypass_d_m_lo_Q; // @[lsu_dccm_ctl.scala 246:162]
  reg [31:0] dccm_wr_data_Q; // @[Reg.scala 27:20]
  wire [7:0] _T_1025 = _T_1021 ? dccm_wr_data_Q[7:0] : io_sec_data_lo_r[7:0]; // @[lsu_dccm_ctl.scala 246:148]
  wire [7:0] _T_1026 = store_byteen_ext_r[0] ? store_data_pre_lo_r[7:0] : _T_1025; // @[lsu_dccm_ctl.scala 246:79]
  wire [7:0] _T_1030 = {{4'd0}, _T_1026[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1032 = {_T_1026[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1034 = _T_1032 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1035 = _T_1030 | _T_1034; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_58 = {{2'd0}, _T_1035[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1040 = _GEN_58 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1042 = {_T_1035[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1044 = _T_1042 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1045 = _T_1040 | _T_1044; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_59 = {{1'd0}, _T_1045[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1050 = _GEN_59 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1052 = {_T_1045[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1054 = _T_1052 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1055 = _T_1050 | _T_1054; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1063 = _T_1021 ? dccm_wr_data_Q[15:8] : io_sec_data_lo_r[15:8]; // @[lsu_dccm_ctl.scala 246:148]
  wire [7:0] _T_1064 = store_byteen_ext_r[1] ? store_data_pre_lo_r[15:8] : _T_1063; // @[lsu_dccm_ctl.scala 246:79]
  wire [7:0] _T_1068 = {{4'd0}, _T_1064[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1070 = {_T_1064[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1072 = _T_1070 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1073 = _T_1068 | _T_1072; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_60 = {{2'd0}, _T_1073[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1078 = _GEN_60 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1080 = {_T_1073[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1082 = _T_1080 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1083 = _T_1078 | _T_1082; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_61 = {{1'd0}, _T_1083[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1088 = _GEN_61 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1090 = {_T_1083[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1092 = _T_1090 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1093 = _T_1088 | _T_1092; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1101 = _T_1021 ? dccm_wr_data_Q[23:16] : io_sec_data_lo_r[23:16]; // @[lsu_dccm_ctl.scala 246:148]
  wire [7:0] _T_1102 = store_byteen_ext_r[2] ? store_data_pre_lo_r[23:16] : _T_1101; // @[lsu_dccm_ctl.scala 246:79]
  wire [7:0] _T_1106 = {{4'd0}, _T_1102[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1108 = {_T_1102[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1110 = _T_1108 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1111 = _T_1106 | _T_1110; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_62 = {{2'd0}, _T_1111[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1116 = _GEN_62 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1118 = {_T_1111[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1120 = _T_1118 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1121 = _T_1116 | _T_1120; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_63 = {{1'd0}, _T_1121[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1126 = _GEN_63 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1128 = {_T_1121[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1130 = _T_1128 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1131 = _T_1126 | _T_1130; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1139 = _T_1021 ? dccm_wr_data_Q[31:24] : io_sec_data_lo_r[31:24]; // @[lsu_dccm_ctl.scala 246:148]
  wire [7:0] _T_1140 = store_byteen_ext_r[3] ? store_data_pre_lo_r[31:24] : _T_1139; // @[lsu_dccm_ctl.scala 246:79]
  wire [7:0] _T_1144 = {{4'd0}, _T_1140[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1146 = {_T_1140[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1148 = _T_1146 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1149 = _T_1144 | _T_1148; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_64 = {{2'd0}, _T_1149[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1154 = _GEN_64 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1156 = {_T_1149[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1158 = _T_1156 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1159 = _T_1154 | _T_1158; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_65 = {{1'd0}, _T_1159[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1164 = _GEN_65 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1166 = {_T_1159[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1168 = _T_1166 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1169 = _T_1164 | _T_1168; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1173 = {_T_1055,_T_1093,_T_1131,_T_1169}; // @[Cat.scala 29:58]
  wire [31:0] _T_1177 = {{16'd0}, _T_1173[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1179 = {_T_1173[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1181 = _T_1179 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1182 = _T_1177 | _T_1181; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_66 = {{8'd0}, _T_1182[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1187 = _GEN_66 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1189 = {_T_1182[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1191 = _T_1189 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1192 = _T_1187 | _T_1191; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_67 = {{4'd0}, _T_1192[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1197 = _GEN_67 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1199 = {_T_1192[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1201 = _T_1199 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1202 = _T_1197 | _T_1201; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_68 = {{2'd0}, _T_1202[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1207 = _GEN_68 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1209 = {_T_1202[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1211 = _T_1209 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1212 = _T_1207 | _T_1211; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_69 = {{1'd0}, _T_1212[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1217 = _GEN_69 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1219 = {_T_1212[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1221 = _T_1219 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg  dccm_wr_bypass_d_m_hi_Q; // @[lsu_dccm_ctl.scala 253:69]
  wire  _T_1226 = dccm_wren_Q & dccm_wr_bypass_d_m_hi_Q; // @[lsu_dccm_ctl.scala 247:162]
  wire [7:0] _T_1230 = _T_1226 ? dccm_wr_data_Q[7:0] : io_sec_data_hi_r[7:0]; // @[lsu_dccm_ctl.scala 247:148]
  wire [7:0] _T_1231 = store_byteen_ext_r[4] ? store_data_pre_hi_r[7:0] : _T_1230; // @[lsu_dccm_ctl.scala 247:79]
  wire [7:0] _T_1235 = {{4'd0}, _T_1231[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1237 = {_T_1231[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1239 = _T_1237 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1240 = _T_1235 | _T_1239; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_70 = {{2'd0}, _T_1240[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1245 = _GEN_70 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1247 = {_T_1240[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1249 = _T_1247 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1250 = _T_1245 | _T_1249; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_71 = {{1'd0}, _T_1250[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1255 = _GEN_71 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1257 = {_T_1250[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1259 = _T_1257 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1260 = _T_1255 | _T_1259; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1268 = _T_1226 ? dccm_wr_data_Q[15:8] : io_sec_data_hi_r[15:8]; // @[lsu_dccm_ctl.scala 247:148]
  wire [7:0] _T_1269 = store_byteen_ext_r[5] ? store_data_pre_hi_r[15:8] : _T_1268; // @[lsu_dccm_ctl.scala 247:79]
  wire [7:0] _T_1273 = {{4'd0}, _T_1269[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1275 = {_T_1269[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1277 = _T_1275 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1278 = _T_1273 | _T_1277; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_72 = {{2'd0}, _T_1278[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1283 = _GEN_72 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1285 = {_T_1278[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1287 = _T_1285 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1288 = _T_1283 | _T_1287; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_73 = {{1'd0}, _T_1288[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1293 = _GEN_73 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1295 = {_T_1288[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1297 = _T_1295 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1298 = _T_1293 | _T_1297; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1306 = _T_1226 ? dccm_wr_data_Q[23:16] : io_sec_data_hi_r[23:16]; // @[lsu_dccm_ctl.scala 247:148]
  wire [7:0] _T_1307 = store_byteen_ext_r[6] ? store_data_pre_hi_r[23:16] : _T_1306; // @[lsu_dccm_ctl.scala 247:79]
  wire [7:0] _T_1311 = {{4'd0}, _T_1307[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1313 = {_T_1307[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1315 = _T_1313 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1316 = _T_1311 | _T_1315; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_74 = {{2'd0}, _T_1316[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1321 = _GEN_74 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1323 = {_T_1316[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1325 = _T_1323 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1326 = _T_1321 | _T_1325; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_75 = {{1'd0}, _T_1326[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1331 = _GEN_75 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1333 = {_T_1326[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1335 = _T_1333 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1336 = _T_1331 | _T_1335; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1344 = _T_1226 ? dccm_wr_data_Q[31:24] : io_sec_data_hi_r[31:24]; // @[lsu_dccm_ctl.scala 247:148]
  wire [7:0] _T_1345 = store_byteen_ext_r[7] ? store_data_pre_hi_r[31:24] : _T_1344; // @[lsu_dccm_ctl.scala 247:79]
  wire [7:0] _T_1349 = {{4'd0}, _T_1345[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1351 = {_T_1345[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1353 = _T_1351 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1354 = _T_1349 | _T_1353; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_76 = {{2'd0}, _T_1354[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1359 = _GEN_76 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1361 = {_T_1354[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1363 = _T_1361 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1364 = _T_1359 | _T_1363; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_77 = {{1'd0}, _T_1364[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1369 = _GEN_77 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1371 = {_T_1364[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1373 = _T_1371 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1374 = _T_1369 | _T_1373; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1378 = {_T_1260,_T_1298,_T_1336,_T_1374}; // @[Cat.scala 29:58]
  wire [31:0] _T_1382 = {{16'd0}, _T_1378[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1384 = {_T_1378[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1386 = _T_1384 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1387 = _T_1382 | _T_1386; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_78 = {{8'd0}, _T_1387[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1392 = _GEN_78 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1394 = {_T_1387[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1396 = _T_1394 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1397 = _T_1392 | _T_1396; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_79 = {{4'd0}, _T_1397[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1402 = _GEN_79 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1404 = {_T_1397[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1406 = _T_1404 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1407 = _T_1402 | _T_1406; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_80 = {{2'd0}, _T_1407[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1412 = _GEN_80 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1414 = {_T_1407[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1416 = _T_1414 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1417 = _T_1412 | _T_1416; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_81 = {{1'd0}, _T_1417[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1422 = _GEN_81 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1424 = {_T_1417[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1426 = _T_1424 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1431 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[lsu_dccm_ctl.scala 248:174]
  wire [7:0] _T_1439 = _T_1431 ? io_stbuf_data_any[7:0] : _T_1025; // @[lsu_dccm_ctl.scala 248:148]
  wire [7:0] _T_1440 = store_byteen_ext_r[0] ? store_data_pre_lo_r[7:0] : _T_1439; // @[lsu_dccm_ctl.scala 248:79]
  wire [7:0] _T_1444 = {{4'd0}, _T_1440[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1446 = {_T_1440[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1448 = _T_1446 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1449 = _T_1444 | _T_1448; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_82 = {{2'd0}, _T_1449[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1454 = _GEN_82 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1456 = {_T_1449[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1458 = _T_1456 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1459 = _T_1454 | _T_1458; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_83 = {{1'd0}, _T_1459[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1464 = _GEN_83 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1466 = {_T_1459[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1468 = _T_1466 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1469 = _T_1464 | _T_1468; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1481 = _T_1431 ? io_stbuf_data_any[15:8] : _T_1063; // @[lsu_dccm_ctl.scala 248:148]
  wire [7:0] _T_1482 = store_byteen_ext_r[1] ? store_data_pre_lo_r[15:8] : _T_1481; // @[lsu_dccm_ctl.scala 248:79]
  wire [7:0] _T_1486 = {{4'd0}, _T_1482[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1488 = {_T_1482[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1490 = _T_1488 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1491 = _T_1486 | _T_1490; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_84 = {{2'd0}, _T_1491[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1496 = _GEN_84 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1498 = {_T_1491[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1500 = _T_1498 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1501 = _T_1496 | _T_1500; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_85 = {{1'd0}, _T_1501[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1506 = _GEN_85 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1508 = {_T_1501[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1510 = _T_1508 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1511 = _T_1506 | _T_1510; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1523 = _T_1431 ? io_stbuf_data_any[23:16] : _T_1101; // @[lsu_dccm_ctl.scala 248:148]
  wire [7:0] _T_1524 = store_byteen_ext_r[2] ? store_data_pre_lo_r[23:16] : _T_1523; // @[lsu_dccm_ctl.scala 248:79]
  wire [7:0] _T_1528 = {{4'd0}, _T_1524[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1530 = {_T_1524[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1532 = _T_1530 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1533 = _T_1528 | _T_1532; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_86 = {{2'd0}, _T_1533[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1538 = _GEN_86 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1540 = {_T_1533[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1542 = _T_1540 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1543 = _T_1538 | _T_1542; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_87 = {{1'd0}, _T_1543[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1548 = _GEN_87 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1550 = {_T_1543[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1552 = _T_1550 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1553 = _T_1548 | _T_1552; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1565 = _T_1431 ? io_stbuf_data_any[31:24] : _T_1139; // @[lsu_dccm_ctl.scala 248:148]
  wire [7:0] _T_1566 = store_byteen_ext_r[3] ? store_data_pre_lo_r[31:24] : _T_1565; // @[lsu_dccm_ctl.scala 248:79]
  wire [7:0] _T_1570 = {{4'd0}, _T_1566[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1572 = {_T_1566[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1574 = _T_1572 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1575 = _T_1570 | _T_1574; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_88 = {{2'd0}, _T_1575[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1580 = _GEN_88 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1582 = {_T_1575[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1584 = _T_1582 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1585 = _T_1580 | _T_1584; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_89 = {{1'd0}, _T_1585[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1590 = _GEN_89 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1592 = {_T_1585[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1594 = _T_1592 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1595 = _T_1590 | _T_1594; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1599 = {_T_1469,_T_1511,_T_1553,_T_1595}; // @[Cat.scala 29:58]
  wire [31:0] _T_1603 = {{16'd0}, _T_1599[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1605 = {_T_1599[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1607 = _T_1605 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1608 = _T_1603 | _T_1607; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_90 = {{8'd0}, _T_1608[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1613 = _GEN_90 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1615 = {_T_1608[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1617 = _T_1615 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1618 = _T_1613 | _T_1617; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_91 = {{4'd0}, _T_1618[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1623 = _GEN_91 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1625 = {_T_1618[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1627 = _T_1625 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1628 = _T_1623 | _T_1627; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_92 = {{2'd0}, _T_1628[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1633 = _GEN_92 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1635 = {_T_1628[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1637 = _T_1635 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1638 = _T_1633 | _T_1637; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_93 = {{1'd0}, _T_1638[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1643 = _GEN_93 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1645 = {_T_1638[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1647 = _T_1645 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1660 = _T_1431 ? io_stbuf_data_any[7:0] : _T_1230; // @[lsu_dccm_ctl.scala 249:148]
  wire [7:0] _T_1661 = store_byteen_ext_r[4] ? store_data_pre_hi_r[7:0] : _T_1660; // @[lsu_dccm_ctl.scala 249:79]
  wire [7:0] _T_1665 = {{4'd0}, _T_1661[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1667 = {_T_1661[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1669 = _T_1667 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1670 = _T_1665 | _T_1669; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_94 = {{2'd0}, _T_1670[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1675 = _GEN_94 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1677 = {_T_1670[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1679 = _T_1677 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1680 = _T_1675 | _T_1679; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_95 = {{1'd0}, _T_1680[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1685 = _GEN_95 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1687 = {_T_1680[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1689 = _T_1687 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1690 = _T_1685 | _T_1689; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1702 = _T_1431 ? io_stbuf_data_any[15:8] : _T_1268; // @[lsu_dccm_ctl.scala 249:148]
  wire [7:0] _T_1703 = store_byteen_ext_r[5] ? store_data_pre_hi_r[15:8] : _T_1702; // @[lsu_dccm_ctl.scala 249:79]
  wire [7:0] _T_1707 = {{4'd0}, _T_1703[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1709 = {_T_1703[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1711 = _T_1709 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1712 = _T_1707 | _T_1711; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_96 = {{2'd0}, _T_1712[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1717 = _GEN_96 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1719 = {_T_1712[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1721 = _T_1719 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1722 = _T_1717 | _T_1721; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_97 = {{1'd0}, _T_1722[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1727 = _GEN_97 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1729 = {_T_1722[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1731 = _T_1729 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1732 = _T_1727 | _T_1731; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1744 = _T_1431 ? io_stbuf_data_any[23:16] : _T_1306; // @[lsu_dccm_ctl.scala 249:148]
  wire [7:0] _T_1745 = store_byteen_ext_r[6] ? store_data_pre_hi_r[23:16] : _T_1744; // @[lsu_dccm_ctl.scala 249:79]
  wire [7:0] _T_1749 = {{4'd0}, _T_1745[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1751 = {_T_1745[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1753 = _T_1751 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1754 = _T_1749 | _T_1753; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_98 = {{2'd0}, _T_1754[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1759 = _GEN_98 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1761 = {_T_1754[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1763 = _T_1761 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1764 = _T_1759 | _T_1763; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_99 = {{1'd0}, _T_1764[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1769 = _GEN_99 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1771 = {_T_1764[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1773 = _T_1771 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1774 = _T_1769 | _T_1773; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1786 = _T_1431 ? io_stbuf_data_any[31:24] : _T_1344; // @[lsu_dccm_ctl.scala 249:148]
  wire [7:0] _T_1787 = store_byteen_ext_r[7] ? store_data_pre_hi_r[31:24] : _T_1786; // @[lsu_dccm_ctl.scala 249:79]
  wire [7:0] _T_1791 = {{4'd0}, _T_1787[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1793 = {_T_1787[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1795 = _T_1793 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1796 = _T_1791 | _T_1795; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_100 = {{2'd0}, _T_1796[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1801 = _GEN_100 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1803 = {_T_1796[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1805 = _T_1803 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1806 = _T_1801 | _T_1805; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_101 = {{1'd0}, _T_1806[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1811 = _GEN_101 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1813 = {_T_1806[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1815 = _T_1813 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1816 = _T_1811 | _T_1815; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1820 = {_T_1690,_T_1732,_T_1774,_T_1816}; // @[Cat.scala 29:58]
  wire [31:0] _T_1824 = {{16'd0}, _T_1820[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1826 = {_T_1820[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1828 = _T_1826 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1829 = _T_1824 | _T_1828; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_102 = {{8'd0}, _T_1829[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1834 = _GEN_102 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1836 = {_T_1829[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1838 = _T_1836 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1839 = _T_1834 | _T_1838; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_103 = {{4'd0}, _T_1839[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1844 = _GEN_103 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1846 = {_T_1839[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1848 = _T_1846 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1849 = _T_1844 | _T_1848; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_104 = {{2'd0}, _T_1849[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1854 = _GEN_104 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1856 = {_T_1849[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1858 = _T_1856 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1859 = _T_1854 | _T_1858; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_105 = {{1'd0}, _T_1859[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1864 = _GEN_105 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1866 = {_T_1859[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1868 = _T_1866 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1871 = io_lsu_stbuf_commit_any | io_clk_override; // @[lsu_dccm_ctl.scala 251:82]
  reg [31:0] _T_1877; // @[lsu_dccm_ctl.scala 254:72]
  wire  _T_1882 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_dccm_ctl.scala 272:58]
  wire  _T_1883 = _T_1882 & io_addr_in_pic_r; // @[lsu_dccm_ctl.scala 272:84]
  wire  _T_1884 = _T_1883 & io_lsu_commit_r; // @[lsu_dccm_ctl.scala 272:103]
  wire  _T_1886 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[lsu_dccm_ctl.scala 273:58]
  wire  _T_1888 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 274:58]
  wire [31:0] _T_1892 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1898 = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[lsu_dccm_ctl.scala 276:93]
  wire [31:0] _T_1899 = {17'h0,_T_1898}; // @[Cat.scala 29:58]
  reg  _T_1906; // @[lsu_dccm_ctl.scala 280:61]
  reg  _T_1907; // @[lsu_dccm_ctl.scala 281:61]
  wire  _T_1912 = io_ld_single_ecc_error_r | io_clk_override; // @[lsu_dccm_ctl.scala 285:90]
  rvclkhdr rvclkhdr ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 390:23]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en)
  );
  assign io_dccm_rdata_hi_r = _T_14; // @[lsu_dccm_ctl.scala 129:27]
  assign io_dccm_rdata_lo_r = _T_18; // @[lsu_dccm_ctl.scala 130:27]
  assign io_dccm_data_ecc_hi_r = _T_22; // @[lsu_dccm_ctl.scala 131:27]
  assign io_dccm_data_ecc_lo_r = _T_26; // @[lsu_dccm_ctl.scala 132:27]
  assign io_lsu_ld_data_r = _T_819[31:0]; // @[lsu_dccm_ctl.scala 140:27]
  assign io_lsu_ld_data_corr_r = _T_822[31:0]; // @[lsu_dccm_ctl.scala 141:27]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[lsu_dccm_ctl.scala 268:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[lsu_dccm_ctl.scala 267:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[lsu_dccm_ctl.scala 270:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[lsu_dccm_ctl.scala 269:27]
  assign io_lsu_ld_data_m = 32'h0; // @[lsu_dccm_ctl.scala 121:20]
  assign io_store_data_hi_r = _T_1422 | _T_1426; // @[lsu_dccm_ctl.scala 247:29]
  assign io_store_data_lo_r = _T_1217 | _T_1221; // @[lsu_dccm_ctl.scala 246:29]
  assign io_store_datafn_hi_r = _T_1864 | _T_1868; // @[lsu_dccm_ctl.scala 249:29]
  assign io_store_datafn_lo_r = _T_1643 | _T_1647; // @[lsu_dccm_ctl.scala 248:29]
  assign io_store_data_r = _T_1877; // @[lsu_dccm_ctl.scala 254:29]
  assign io_ld_single_ecc_error_r = _T_871 & _T_872; // @[lsu_dccm_ctl.scala 171:34]
  assign io_ld_single_ecc_error_r_ff = _T_888 & _T_889; // @[lsu_dccm_ctl.scala 178:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[lsu_dccm_ctl.scala 277:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_903; // @[lsu_dccm_ctl.scala 179:31]
  assign io_lsu_dccm_rden_m = _T_1906; // @[lsu_dccm_ctl.scala 280:24]
  assign io_lsu_dccm_rden_r = _T_1907; // @[lsu_dccm_ctl.scala 281:24]
  assign io_dma_dccm_ctl_dccm_dma_rvalid = _T & io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 124:40]
  assign io_dma_dccm_ctl_dccm_dma_ecc_error = io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 125:40]
  assign io_dma_dccm_ctl_dccm_dma_rtag = _T_42; // @[lsu_dccm_ctl.scala 137:40]
  assign io_dma_dccm_ctl_dccm_dma_rdata = io_ldst_dual_r ? lsu_rdata_corr_r : _T_4; // @[lsu_dccm_ctl.scala 126:40]
  assign io_dccm_wren = _T_905 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 185:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 186:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_912 : _T_916; // @[lsu_dccm_ctl.scala 188:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_922 : _T_926; // @[lsu_dccm_ctl.scala 192:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[lsu_dccm_ctl.scala 196:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[lsu_dccm_ctl.scala 197:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_938 : _T_946; // @[lsu_dccm_ctl.scala 199:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_956 : _T_964; // @[lsu_dccm_ctl.scala 205:22]
  assign io_lsu_pic_picm_wren = _T_1884 | io_dma_pic_wen; // @[lsu_dccm_ctl.scala 272:35]
  assign io_lsu_pic_picm_rden = _T_1886 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 273:35]
  assign io_lsu_pic_picm_mken = _T_1888 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 274:35]
  assign io_lsu_pic_picm_rdaddr = 32'hf00c0000 | _T_1892; // @[lsu_dccm_ctl.scala 275:35]
  assign io_lsu_pic_picm_wraddr = 32'hf00c0000 | _T_1899; // @[lsu_dccm_ctl.scala 276:35]
  assign io_lsu_pic_picm_wr_data = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[lsu_dccm_ctl.scala 278:35]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_io_en = _T_10 | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_1_io_en = io_lsu_dccm_rden_m | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_2_io_en = io_lsu_dccm_rden_m | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_3_io_en = io_lsu_dccm_rden_m | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_4_io_en = _T_8 | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_5_io_en = _T_8 | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_6_io_en = io_addr_in_pic_m | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_7_io_en = io_lsu_stbuf_commit_any | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_8_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 393:17]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 392:18]
  assign rvclkhdr_9_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 393:17]
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
  _T_28 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  _T_31 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  _T_34 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  picm_rd_data_r_32 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  _T_14 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_18 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_22 = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  _T_26 = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  _T_42 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  ld_single_ecc_error_lo_r_ff = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ld_single_ecc_error_hi_r_ff = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  lsu_double_ecc_error_r_ff = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ld_sec_addr_lo_r_ff = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  ld_sec_addr_hi_r_ff = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  dccm_wren_Q = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  dccm_wr_bypass_d_m_lo_Q = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  dccm_wr_data_Q = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  dccm_wr_bypass_d_m_hi_Q = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_1877 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  _T_1906 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_1907 = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_28 = 8'h0;
  end
  if (reset) begin
    _T_31 = 32'h0;
  end
  if (reset) begin
    _T_34 = 32'h0;
  end
  if (reset) begin
    picm_rd_data_r_32 = 32'h0;
  end
  if (reset) begin
    _T_14 = 32'h0;
  end
  if (reset) begin
    _T_18 = 32'h0;
  end
  if (reset) begin
    _T_22 = 7'h0;
  end
  if (reset) begin
    _T_26 = 7'h0;
  end
  if (reset) begin
    _T_42 = 3'h0;
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
    dccm_wren_Q = 1'h0;
  end
  if (reset) begin
    dccm_wr_bypass_d_m_lo_Q = 1'h0;
  end
  if (reset) begin
    dccm_wr_data_Q = 32'h0;
  end
  if (reset) begin
    dccm_wr_bypass_d_m_hi_Q = 1'h0;
  end
  if (reset) begin
    _T_1877 = 32'h0;
  end
  if (reset) begin
    _T_1906 = 1'h0;
  end
  if (reset) begin
    _T_1907 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_28 <= 8'h0;
    end else begin
      _T_28 <= {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m};
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_31 <= 32'h0;
    end else if (stbuf_fwddata_en) begin
      _T_31 <= io_stbuf_fwddata_hi_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_34 <= 32'h0;
    end else if (stbuf_fwddata_en) begin
      _T_34 <= io_stbuf_fwddata_lo_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      picm_rd_data_r_32 <= 32'h0;
    end else if (_T_37) begin
      picm_rd_data_r_32 <= picm_rd_data_m[31:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_14 <= 32'h0;
    end else if (_T_11) begin
      _T_14 <= io_dccm_rdata_hi_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_18 <= 32'h0;
    end else if (_T_15) begin
      _T_18 <= io_dccm_rdata_lo_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_22 <= 7'h0;
    end else if (_T_15) begin
      _T_22 <= io_dccm_data_ecc_hi_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_26 <= 7'h0;
    end else if (_T_15) begin
      _T_26 <= io_dccm_data_ecc_lo_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_42 <= 3'h0;
    end else begin
      _T_42 <= io_dma_mem_tag_m;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_875 & _T_876;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_hi_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_hi_r_ff <= _T_878 & _T_879;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_double_ecc_error_r_ff <= 1'h0;
    end else begin
      lsu_double_ecc_error_r_ff <= io_lsu_double_ecc_error_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ld_sec_addr_lo_r_ff <= 16'h0;
    end else if (_T_1912) begin
      ld_sec_addr_lo_r_ff <= io_lsu_addr_r[15:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ld_sec_addr_hi_r_ff <= 16'h0;
    end else if (_T_1912) begin
      ld_sec_addr_hi_r_ff <= io_end_addr_r;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      dccm_wren_Q <= 1'h0;
    end else begin
      dccm_wren_Q <= io_lsu_stbuf_commit_any;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      dccm_wr_bypass_d_m_lo_Q <= 1'h0;
    end else begin
      dccm_wr_bypass_d_m_lo_Q <= _T_1000 & io_addr_in_dccm_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      dccm_wr_data_Q <= 32'h0;
    end else if (_T_1871) begin
      dccm_wr_data_Q <= io_stbuf_data_any;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      dccm_wr_bypass_d_m_hi_Q <= 1'h0;
    end else begin
      dccm_wr_bypass_d_m_hi_Q <= _T_1003 & io_addr_in_dccm_m;
    end
  end
  always @(posedge io_lsu_store_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_1877 <= 32'h0;
    end else begin
      _T_1877 <= io_store_data_m;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_1906 <= 1'h0;
    end else begin
      _T_1906 <= _T_887 & io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1907 <= 1'h0;
    end else begin
      _T_1907 <= io_lsu_dccm_rden_m;
    end
  end
endmodule
