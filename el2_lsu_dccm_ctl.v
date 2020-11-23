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
module el2_lsu_dccm_ctl(
  input         clock,
  input         reset,
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
  input  [31:0] io_dma_mem_addr,
  input  [63:0] io_dma_mem_wdata,
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
  output        io_dccm_dma_rvalid,
  output        io_dccm_dma_ecc_error,
  output [2:0]  io_dccm_dma_rtag,
  output [63:0] io_dccm_dma_rdata,
  output        io_dccm_wren,
  output        io_dccm_rden,
  output [15:0] io_dccm_wr_addr_lo,
  output [38:0] io_dccm_wr_data_lo,
  output [15:0] io_dccm_rd_addr_lo,
  input  [38:0] io_dccm_rd_data_lo,
  output [15:0] io_dccm_wr_addr_hi,
  output [38:0] io_dccm_wr_data_hi,
  output [15:0] io_dccm_rd_addr_hi,
  input  [38:0] io_dccm_rd_data_hi,
  output        io_picm_wren,
  output        io_picm_rden,
  output        io_picm_mken,
  output [31:0] io_picm_rdaddr,
  output [31:0] io_picm_wraddr,
  output [31:0] io_picm_wr_data,
  input  [31:0] io_picm_rd_data,
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 508:23]
  wire [63:0] picm_rd_data_m = {io_picm_rd_data,io_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_load; // @[el2_lsu_dccm_ctl.scala 161:50]
  reg [63:0] _T_2; // @[el2_lsu_dccm_ctl.scala 171:65]
  wire [7:0] _T_3 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_6 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [7:0] _T_11 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_corr_m[7:0]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_12 = _T_3[0] ? _T_6[7:0] : _T_11; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_16 = {{4'd0}, _T_12[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_18 = {_T_12[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_20 = _T_18 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_21 = _T_16 | _T_20; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_0 = {{2'd0}, _T_21[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_26 = _GEN_0 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_28 = {_T_21[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_30 = _T_28 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_31 = _T_26 | _T_30; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_1 = {{1'd0}, _T_31[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_36 = _GEN_1 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_38 = {_T_31[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_40 = _T_38 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_41 = _T_36 | _T_40; // @[Bitwise.scala 103:39]
  wire [7:0] _T_50 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_corr_m[15:8]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_51 = _T_3[1] ? _T_6[15:8] : _T_50; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_55 = {{4'd0}, _T_51[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_57 = {_T_51[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_59 = _T_57 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_60 = _T_55 | _T_59; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_2 = {{2'd0}, _T_60[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_65 = _GEN_2 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_67 = {_T_60[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_69 = _T_67 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_70 = _T_65 | _T_69; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_3 = {{1'd0}, _T_70[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_75 = _GEN_3 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_77 = {_T_70[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_79 = _T_77 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_80 = _T_75 | _T_79; // @[Bitwise.scala 103:39]
  wire [7:0] _T_89 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_corr_m[23:16]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_90 = _T_3[2] ? _T_6[23:16] : _T_89; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_94 = {{4'd0}, _T_90[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_96 = {_T_90[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_98 = _T_96 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_99 = _T_94 | _T_98; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_4 = {{2'd0}, _T_99[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_104 = _GEN_4 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_106 = {_T_99[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_108 = _T_106 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_109 = _T_104 | _T_108; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_5 = {{1'd0}, _T_109[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_114 = _GEN_5 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_116 = {_T_109[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_118 = _T_116 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_119 = _T_114 | _T_118; // @[Bitwise.scala 103:39]
  wire [7:0] _T_128 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_corr_m[31:24]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_129 = _T_3[3] ? _T_6[31:24] : _T_128; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_133 = {{4'd0}, _T_129[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_135 = {_T_129[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_137 = _T_135 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_138 = _T_133 | _T_137; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_6 = {{2'd0}, _T_138[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_143 = _GEN_6 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_145 = {_T_138[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_147 = _T_145 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_148 = _T_143 | _T_147; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{1'd0}, _T_148[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_153 = _GEN_7 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_155 = {_T_148[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_157 = _T_155 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_158 = _T_153 | _T_157; // @[Bitwise.scala 103:39]
  wire [7:0] _T_167 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_corr_m[39:32]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_168 = _T_3[4] ? _T_6[39:32] : _T_167; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_172 = {{4'd0}, _T_168[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_174 = {_T_168[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_176 = _T_174 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_177 = _T_172 | _T_176; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{2'd0}, _T_177[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_182 = _GEN_8 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_184 = {_T_177[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_186 = _T_184 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_187 = _T_182 | _T_186; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_9 = {{1'd0}, _T_187[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_192 = _GEN_9 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_194 = {_T_187[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_196 = _T_194 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_197 = _T_192 | _T_196; // @[Bitwise.scala 103:39]
  wire [7:0] _T_206 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_corr_m[47:40]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_207 = _T_3[5] ? _T_6[47:40] : _T_206; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_211 = {{4'd0}, _T_207[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_213 = {_T_207[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_215 = _T_213 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_216 = _T_211 | _T_215; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_10 = {{2'd0}, _T_216[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_221 = _GEN_10 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_223 = {_T_216[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_225 = _T_223 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_226 = _T_221 | _T_225; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_11 = {{1'd0}, _T_226[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_231 = _GEN_11 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_233 = {_T_226[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_235 = _T_233 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_236 = _T_231 | _T_235; // @[Bitwise.scala 103:39]
  wire [7:0] _T_245 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_corr_m[55:48]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_246 = _T_3[6] ? _T_6[55:48] : _T_245; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_250 = {{4'd0}, _T_246[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_252 = {_T_246[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_254 = _T_252 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_255 = _T_250 | _T_254; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_12 = {{2'd0}, _T_255[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_260 = _GEN_12 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_262 = {_T_255[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_264 = _T_262 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_265 = _T_260 | _T_264; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_13 = {{1'd0}, _T_265[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_270 = _GEN_13 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_272 = {_T_265[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_274 = _T_272 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_275 = _T_270 | _T_274; // @[Bitwise.scala 103:39]
  wire [7:0] _T_284 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_corr_m[63:56]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_285 = _T_3[7] ? _T_6[63:56] : _T_284; // @[el2_lsu_dccm_ctl.scala 172:78]
  wire [7:0] _T_289 = {{4'd0}, _T_285[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_291 = {_T_285[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_293 = _T_291 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_294 = _T_289 | _T_293; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_14 = {{2'd0}, _T_294[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_299 = _GEN_14 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_301 = {_T_294[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_303 = _T_301 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_304 = _T_299 | _T_303; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_15 = {{1'd0}, _T_304[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_309 = _GEN_15 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_311 = {_T_304[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_313 = _T_311 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_314 = _T_309 | _T_313; // @[Bitwise.scala 103:39]
  wire [63:0] _T_322 = {_T_41,_T_80,_T_119,_T_158,_T_197,_T_236,_T_275,_T_314}; // @[Cat.scala 29:58]
  wire [63:0] _T_326 = {{32'd0}, _T_322[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_328 = {_T_322[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_330 = _T_328 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_331 = _T_326 | _T_330; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_16 = {{16'd0}, _T_331[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_336 = _GEN_16 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_338 = {_T_331[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_340 = _T_338 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_341 = _T_336 | _T_340; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_17 = {{8'd0}, _T_341[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_346 = _GEN_17 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_348 = {_T_341[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_350 = _T_348 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_351 = _T_346 | _T_350; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_18 = {{4'd0}, _T_351[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_356 = _GEN_18 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_358 = {_T_351[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_360 = _T_358 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_361 = _T_356 | _T_360; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_19 = {{2'd0}, _T_361[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_366 = _GEN_19 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_368 = {_T_361[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_370 = _T_368 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_371 = _T_366 | _T_370; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_20 = {{1'd0}, _T_371[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_376 = _GEN_20 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_378 = {_T_371[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_380 = _T_378 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_corr_m = _T_376 | _T_380; // @[Bitwise.scala 103:39]
  wire [7:0] _T_390 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_m[7:0]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_391 = _T_3[0] ? _T_6[7:0] : _T_390; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_395 = {{4'd0}, _T_391[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_397 = {_T_391[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_399 = _T_397 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_400 = _T_395 | _T_399; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_21 = {{2'd0}, _T_400[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_405 = _GEN_21 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_407 = {_T_400[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_409 = _T_407 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_410 = _T_405 | _T_409; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_22 = {{1'd0}, _T_410[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_415 = _GEN_22 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_417 = {_T_410[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_419 = _T_417 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_420 = _T_415 | _T_419; // @[Bitwise.scala 103:39]
  wire [7:0] _T_429 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_m[15:8]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_430 = _T_3[1] ? _T_6[15:8] : _T_429; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_434 = {{4'd0}, _T_430[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_436 = {_T_430[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_438 = _T_436 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_439 = _T_434 | _T_438; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_23 = {{2'd0}, _T_439[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_444 = _GEN_23 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_446 = {_T_439[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_448 = _T_446 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_449 = _T_444 | _T_448; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_24 = {{1'd0}, _T_449[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_454 = _GEN_24 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_456 = {_T_449[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_458 = _T_456 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_459 = _T_454 | _T_458; // @[Bitwise.scala 103:39]
  wire [7:0] _T_468 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_m[23:16]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_469 = _T_3[2] ? _T_6[23:16] : _T_468; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_473 = {{4'd0}, _T_469[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_475 = {_T_469[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_477 = _T_475 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_478 = _T_473 | _T_477; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_25 = {{2'd0}, _T_478[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_483 = _GEN_25 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_485 = {_T_478[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_487 = _T_485 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_488 = _T_483 | _T_487; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_26 = {{1'd0}, _T_488[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_493 = _GEN_26 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_495 = {_T_488[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_497 = _T_495 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_498 = _T_493 | _T_497; // @[Bitwise.scala 103:39]
  wire [7:0] _T_507 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_m[31:24]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_508 = _T_3[3] ? _T_6[31:24] : _T_507; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_512 = {{4'd0}, _T_508[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_514 = {_T_508[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_516 = _T_514 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_517 = _T_512 | _T_516; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_27 = {{2'd0}, _T_517[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_522 = _GEN_27 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_524 = {_T_517[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_526 = _T_524 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_527 = _T_522 | _T_526; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_28 = {{1'd0}, _T_527[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_532 = _GEN_28 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_534 = {_T_527[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_536 = _T_534 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_537 = _T_532 | _T_536; // @[Bitwise.scala 103:39]
  wire [7:0] _T_546 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_m[39:32]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_547 = _T_3[4] ? _T_6[39:32] : _T_546; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_551 = {{4'd0}, _T_547[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_553 = {_T_547[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_555 = _T_553 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_556 = _T_551 | _T_555; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_29 = {{2'd0}, _T_556[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_561 = _GEN_29 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_563 = {_T_556[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_565 = _T_563 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_566 = _T_561 | _T_565; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_30 = {{1'd0}, _T_566[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_571 = _GEN_30 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_573 = {_T_566[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_575 = _T_573 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_576 = _T_571 | _T_575; // @[Bitwise.scala 103:39]
  wire [7:0] _T_585 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_m[47:40]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_586 = _T_3[5] ? _T_6[47:40] : _T_585; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_590 = {{4'd0}, _T_586[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_592 = {_T_586[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_594 = _T_592 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_595 = _T_590 | _T_594; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_31 = {{2'd0}, _T_595[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_600 = _GEN_31 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_602 = {_T_595[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_604 = _T_602 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_605 = _T_600 | _T_604; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_32 = {{1'd0}, _T_605[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_610 = _GEN_32 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_612 = {_T_605[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_614 = _T_612 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_615 = _T_610 | _T_614; // @[Bitwise.scala 103:39]
  wire [7:0] _T_624 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_m[55:48]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_625 = _T_3[6] ? _T_6[55:48] : _T_624; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_629 = {{4'd0}, _T_625[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_631 = {_T_625[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_633 = _T_631 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_634 = _T_629 | _T_633; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_33 = {{2'd0}, _T_634[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_639 = _GEN_33 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_641 = {_T_634[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_643 = _T_641 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_644 = _T_639 | _T_643; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_34 = {{1'd0}, _T_644[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_649 = _GEN_34 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_651 = {_T_644[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_653 = _T_651 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_654 = _T_649 | _T_653; // @[Bitwise.scala 103:39]
  wire [7:0] _T_663 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_m[63:56]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_664 = _T_3[7] ? _T_6[63:56] : _T_663; // @[el2_lsu_dccm_ctl.scala 173:78]
  wire [7:0] _T_668 = {{4'd0}, _T_664[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_670 = {_T_664[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_672 = _T_670 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_673 = _T_668 | _T_672; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_35 = {{2'd0}, _T_673[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_678 = _GEN_35 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_680 = {_T_673[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_682 = _T_680 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_683 = _T_678 | _T_682; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_36 = {{1'd0}, _T_683[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_688 = _GEN_36 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_690 = {_T_683[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_692 = _T_690 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_693 = _T_688 | _T_692; // @[Bitwise.scala 103:39]
  wire [63:0] _T_701 = {_T_420,_T_459,_T_498,_T_537,_T_576,_T_615,_T_654,_T_693}; // @[Cat.scala 29:58]
  wire [63:0] _T_705 = {{32'd0}, _T_701[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_707 = {_T_701[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_709 = _T_707 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_710 = _T_705 | _T_709; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_37 = {{16'd0}, _T_710[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_715 = _GEN_37 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_717 = {_T_710[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_719 = _T_717 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_720 = _T_715 | _T_719; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_38 = {{8'd0}, _T_720[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_725 = _GEN_38 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_727 = {_T_720[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_729 = _T_727 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_730 = _T_725 | _T_729; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_39 = {{4'd0}, _T_730[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_735 = _GEN_39 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_737 = {_T_730[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_739 = _T_737 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_740 = _T_735 | _T_739; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_40 = {{2'd0}, _T_740[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_745 = _GEN_40 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_747 = {_T_740[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_749 = _T_747 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_750 = _T_745 | _T_749; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_41 = {{1'd0}, _T_750[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_755 = _GEN_41 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_757 = {_T_750[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_759 = _T_757 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_m = _T_755 | _T_759; // @[Bitwise.scala 103:39]
  wire [3:0] _GEN_42 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_dccm_ctl.scala 174:49]
  wire [5:0] _T_762 = 4'h8 * _GEN_42; // @[el2_lsu_dccm_ctl.scala 174:49]
  wire [63:0] _T_763 = lsu_rdata_m >> _T_762; // @[el2_lsu_dccm_ctl.scala 174:43]
  wire  _T_769 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 179:60]
  wire  _T_772 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 179:133]
  wire  _T_773 = _T_769 | _T_772; // @[el2_lsu_dccm_ctl.scala 179:101]
  wire  _T_774 = _T_773 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 179:175]
  wire  _T_775 = _T_774 & io_lsu_pkt_d_bits_store; // @[el2_lsu_dccm_ctl.scala 179:196]
  wire  _T_776 = _T_775 & io_lsu_pkt_d_bits_dma; // @[el2_lsu_dccm_ctl.scala 179:222]
  wire  _T_777 = _T_776 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 179:246]
  wire  _T_780 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 180:37]
  wire  _T_783 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 180:110]
  wire  _T_784 = _T_780 | _T_783; // @[el2_lsu_dccm_ctl.scala 180:78]
  wire  _T_785 = _T_784 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 180:152]
  wire  _T_786 = _T_785 & io_lsu_pkt_m_bits_store; // @[el2_lsu_dccm_ctl.scala 180:173]
  wire  _T_787 = _T_786 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_dccm_ctl.scala 180:199]
  wire  _T_788 = _T_787 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 180:223]
  wire  kill_ecc_corr_lo_r = _T_777 | _T_788; // @[el2_lsu_dccm_ctl.scala 179:267]
  wire  _T_791 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 182:60]
  wire  _T_794 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 182:133]
  wire  _T_795 = _T_791 | _T_794; // @[el2_lsu_dccm_ctl.scala 182:101]
  wire  _T_796 = _T_795 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 182:175]
  wire  _T_797 = _T_796 & io_lsu_pkt_d_bits_store; // @[el2_lsu_dccm_ctl.scala 182:196]
  wire  _T_798 = _T_797 & io_lsu_pkt_d_bits_dma; // @[el2_lsu_dccm_ctl.scala 182:222]
  wire  _T_799 = _T_798 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 182:246]
  wire  _T_802 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 183:37]
  wire  _T_805 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 183:110]
  wire  _T_806 = _T_802 | _T_805; // @[el2_lsu_dccm_ctl.scala 183:78]
  wire  _T_807 = _T_806 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 183:152]
  wire  _T_808 = _T_807 & io_lsu_pkt_m_bits_store; // @[el2_lsu_dccm_ctl.scala 183:173]
  wire  _T_809 = _T_808 & io_lsu_pkt_m_bits_dma; // @[el2_lsu_dccm_ctl.scala 183:199]
  wire  _T_810 = _T_809 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 183:223]
  wire  kill_ecc_corr_hi_r = _T_799 | _T_810; // @[el2_lsu_dccm_ctl.scala 182:267]
  wire  _T_811 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[el2_lsu_dccm_ctl.scala 185:60]
  wire  _T_812 = ~io_lsu_raw_fwd_lo_r; // @[el2_lsu_dccm_ctl.scala 185:89]
  wire  ld_single_ecc_error_lo_r = _T_811 & _T_812; // @[el2_lsu_dccm_ctl.scala 185:87]
  wire  _T_813 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 186:60]
  wire  _T_814 = ~io_lsu_raw_fwd_hi_r; // @[el2_lsu_dccm_ctl.scala 186:89]
  wire  ld_single_ecc_error_hi_r = _T_813 & _T_814; // @[el2_lsu_dccm_ctl.scala 186:87]
  wire  _T_815 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 187:63]
  wire  _T_816 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_dccm_ctl.scala 187:93]
  wire  _T_818 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[el2_lsu_dccm_ctl.scala 188:81]
  wire  _T_819 = ld_single_ecc_error_lo_r & _T_818; // @[el2_lsu_dccm_ctl.scala 188:62]
  wire  _T_820 = ~kill_ecc_corr_lo_r; // @[el2_lsu_dccm_ctl.scala 188:108]
  wire  _T_822 = ld_single_ecc_error_hi_r & _T_818; // @[el2_lsu_dccm_ctl.scala 189:62]
  wire  _T_823 = ~kill_ecc_corr_hi_r; // @[el2_lsu_dccm_ctl.scala 189:108]
  reg  lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 191:74]
  reg  ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 192:74]
  reg  ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 193:74]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[el2_lib.scala 514:16]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[el2_lib.scala 514:16]
  wire  _T_830 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[el2_lsu_dccm_ctl.scala 197:125]
  wire  _T_831 = ~_T_830; // @[el2_lsu_dccm_ctl.scala 197:100]
  wire  _T_833 = io_lsu_addr_d[1:0] != 2'h0; // @[el2_lsu_dccm_ctl.scala 197:174]
  wire  _T_834 = _T_831 | _T_833; // @[el2_lsu_dccm_ctl.scala 197:152]
  wire  _T_835 = io_lsu_pkt_d_bits_store & _T_834; // @[el2_lsu_dccm_ctl.scala 197:97]
  wire  _T_836 = io_lsu_pkt_d_bits_load | _T_835; // @[el2_lsu_dccm_ctl.scala 197:70]
  wire  _T_837 = io_lsu_pkt_d_valid & _T_836; // @[el2_lsu_dccm_ctl.scala 197:44]
  wire  lsu_dccm_rden_d = _T_837 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 197:191]
  wire  _T_838 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 200:63]
  wire  _T_839 = ~lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 200:96]
  wire  _T_841 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[el2_lsu_dccm_ctl.scala 201:75]
  wire  _T_842 = _T_841 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 201:93]
  wire  _T_843 = ~_T_842; // @[el2_lsu_dccm_ctl.scala 201:57]
  wire  _T_846 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 202:95]
  wire  _T_849 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 203:76]
  wire  _T_850 = _T_846 | _T_849; // @[el2_lsu_dccm_ctl.scala 202:171]
  wire  _T_851 = ~_T_850; // @[el2_lsu_dccm_ctl.scala 202:24]
  wire  _T_852 = lsu_dccm_rden_d & _T_851; // @[el2_lsu_dccm_ctl.scala 202:22]
  wire  _T_853 = _T_843 | _T_852; // @[el2_lsu_dccm_ctl.scala 201:124]
  wire  _T_855 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[el2_lsu_dccm_ctl.scala 207:41]
  wire [15:0] _T_862 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 211:8]
  wire [15:0] _T_866 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 212:8]
  wire [15:0] _T_872 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 215:8]
  wire [15:0] _T_876 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 216:8]
  wire [38:0] _T_884 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_887 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_888 = ld_single_ecc_error_lo_r_ff ? _T_884 : _T_887; // @[el2_lsu_dccm_ctl.scala 222:8]
  wire [38:0] _T_892 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_895 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_896 = io_dma_dccm_wen ? _T_892 : _T_895; // @[el2_lsu_dccm_ctl.scala 224:8]
  wire [38:0] _T_906 = ld_single_ecc_error_hi_r_ff ? _T_887 : _T_884; // @[el2_lsu_dccm_ctl.scala 228:8]
  wire [38:0] _T_910 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_914 = io_dma_dccm_wen ? _T_910 : _T_895; // @[el2_lsu_dccm_ctl.scala 230:8]
  wire [3:0] _T_917 = io_lsu_pkt_m_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_919 = io_lsu_pkt_m_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_920 = _T_919 & 4'h1; // @[el2_lsu_dccm_ctl.scala 234:94]
  wire [3:0] _T_922 = io_lsu_pkt_m_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_923 = _T_922 & 4'h3; // @[el2_lsu_dccm_ctl.scala 235:38]
  wire [3:0] _T_924 = _T_920 | _T_923; // @[el2_lsu_dccm_ctl.scala 234:107]
  wire [3:0] _T_926 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_928 = _T_924 | _T_926; // @[el2_lsu_dccm_ctl.scala 235:51]
  wire [3:0] store_byteen_m = _T_917 & _T_928; // @[el2_lsu_dccm_ctl.scala 234:58]
  wire [3:0] _T_930 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_932 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_933 = _T_932 & 4'h1; // @[el2_lsu_dccm_ctl.scala 238:94]
  wire [3:0] _T_935 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_936 = _T_935 & 4'h3; // @[el2_lsu_dccm_ctl.scala 239:38]
  wire [3:0] _T_937 = _T_933 | _T_936; // @[el2_lsu_dccm_ctl.scala 238:107]
  wire [3:0] _T_939 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_941 = _T_937 | _T_939; // @[el2_lsu_dccm_ctl.scala 239:51]
  wire [3:0] store_byteen_r = _T_930 & _T_941; // @[el2_lsu_dccm_ctl.scala 238:58]
  wire [6:0] _GEN_44 = {{3'd0}, store_byteen_m}; // @[el2_lsu_dccm_ctl.scala 242:45]
  wire [6:0] _T_944 = _GEN_44 << io_lsu_addr_m[1:0]; // @[el2_lsu_dccm_ctl.scala 242:45]
  wire [6:0] _GEN_45 = {{3'd0}, store_byteen_r}; // @[el2_lsu_dccm_ctl.scala 244:45]
  wire [6:0] _T_947 = _GEN_45 << io_lsu_addr_r[1:0]; // @[el2_lsu_dccm_ctl.scala 244:45]
  wire  _T_950 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 247:67]
  wire  dccm_wr_bypass_d_m_lo = _T_950 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 247:101]
  wire  _T_953 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 248:67]
  wire  dccm_wr_bypass_d_m_hi = _T_953 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 248:101]
  wire  _T_956 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 250:67]
  wire  dccm_wr_bypass_d_r_lo = _T_956 & io_addr_in_dccm_r; // @[el2_lsu_dccm_ctl.scala 250:101]
  wire  _T_959 = io_stbuf_addr_any[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 251:67]
  wire  dccm_wr_bypass_d_r_hi = _T_959 & io_addr_in_dccm_r; // @[el2_lsu_dccm_ctl.scala 251:101]
  wire [63:0] _T_962 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_47 = {{63'd0}, _T_962}; // @[el2_lsu_dccm_ctl.scala 280:72]
  wire [126:0] _T_965 = _GEN_47 << _T_762; // @[el2_lsu_dccm_ctl.scala 280:72]
  wire [63:0] store_data_pre_m = _T_965[63:0]; // @[el2_lsu_dccm_ctl.scala 280:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[el2_lsu_dccm_ctl.scala 281:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[el2_lsu_dccm_ctl.scala 282:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_944}; // @[el2_lsu_dccm_ctl.scala 242:22]
  wire  _T_971 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[el2_lsu_dccm_ctl.scala 283:211]
  wire [7:0] _T_975 = _T_971 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_976 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_975; // @[el2_lsu_dccm_ctl.scala 283:120]
  wire [7:0] _T_980 = {{4'd0}, _T_976[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_982 = {_T_976[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_984 = _T_982 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_985 = _T_980 | _T_984; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_48 = {{2'd0}, _T_985[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_990 = _GEN_48 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_992 = {_T_985[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_994 = _T_992 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_995 = _T_990 | _T_994; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_49 = {{1'd0}, _T_995[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1000 = _GEN_49 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1002 = {_T_995[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1004 = _T_1002 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1005 = _T_1000 | _T_1004; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1013 = _T_971 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1014 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1013; // @[el2_lsu_dccm_ctl.scala 283:120]
  wire [7:0] _T_1018 = {{4'd0}, _T_1014[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1020 = {_T_1014[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1022 = _T_1020 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1023 = _T_1018 | _T_1022; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_50 = {{2'd0}, _T_1023[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1028 = _GEN_50 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1030 = {_T_1023[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1032 = _T_1030 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1033 = _T_1028 | _T_1032; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_51 = {{1'd0}, _T_1033[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1038 = _GEN_51 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1040 = {_T_1033[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1042 = _T_1040 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1043 = _T_1038 | _T_1042; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1051 = _T_971 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1052 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1051; // @[el2_lsu_dccm_ctl.scala 283:120]
  wire [7:0] _T_1056 = {{4'd0}, _T_1052[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1058 = {_T_1052[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1060 = _T_1058 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1061 = _T_1056 | _T_1060; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_52 = {{2'd0}, _T_1061[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1066 = _GEN_52 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1068 = {_T_1061[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1070 = _T_1068 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1071 = _T_1066 | _T_1070; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_53 = {{1'd0}, _T_1071[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1076 = _GEN_53 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1078 = {_T_1071[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1080 = _T_1078 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1081 = _T_1076 | _T_1080; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1089 = _T_971 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1090 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1089; // @[el2_lsu_dccm_ctl.scala 283:120]
  wire [7:0] _T_1094 = {{4'd0}, _T_1090[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1096 = {_T_1090[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1098 = _T_1096 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1099 = _T_1094 | _T_1098; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_54 = {{2'd0}, _T_1099[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1104 = _GEN_54 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1106 = {_T_1099[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1108 = _T_1106 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1109 = _T_1104 | _T_1108; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_55 = {{1'd0}, _T_1109[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1114 = _GEN_55 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1116 = {_T_1109[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1118 = _T_1116 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1119 = _T_1114 | _T_1118; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1123 = {_T_1005,_T_1043,_T_1081,_T_1119}; // @[Cat.scala 29:58]
  wire [31:0] _T_1127 = {{16'd0}, _T_1123[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1129 = {_T_1123[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1131 = _T_1129 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1132 = _T_1127 | _T_1131; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_56 = {{8'd0}, _T_1132[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1137 = _GEN_56 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1139 = {_T_1132[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1141 = _T_1139 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1142 = _T_1137 | _T_1141; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_57 = {{4'd0}, _T_1142[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1147 = _GEN_57 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1149 = {_T_1142[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1151 = _T_1149 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1152 = _T_1147 | _T_1151; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_58 = {{2'd0}, _T_1152[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1157 = _GEN_58 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1159 = {_T_1152[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1161 = _T_1159 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1162 = _T_1157 | _T_1161; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_59 = {{1'd0}, _T_1162[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1167 = _GEN_59 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1169 = {_T_1162[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1171 = _T_1169 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg [31:0] _T_1173; // @[el2_lsu_dccm_ctl.scala 283:72]
  wire  _T_1177 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[el2_lsu_dccm_ctl.scala 284:211]
  wire [7:0] _T_1181 = _T_1177 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1182 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1181; // @[el2_lsu_dccm_ctl.scala 284:120]
  wire [7:0] _T_1186 = {{4'd0}, _T_1182[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1188 = {_T_1182[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1190 = _T_1188 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1191 = _T_1186 | _T_1190; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_60 = {{2'd0}, _T_1191[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1196 = _GEN_60 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1198 = {_T_1191[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1200 = _T_1198 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1201 = _T_1196 | _T_1200; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_61 = {{1'd0}, _T_1201[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1206 = _GEN_61 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1208 = {_T_1201[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1210 = _T_1208 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1211 = _T_1206 | _T_1210; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1219 = _T_1177 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1220 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1219; // @[el2_lsu_dccm_ctl.scala 284:120]
  wire [7:0] _T_1224 = {{4'd0}, _T_1220[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1226 = {_T_1220[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1228 = _T_1226 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1229 = _T_1224 | _T_1228; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_62 = {{2'd0}, _T_1229[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1234 = _GEN_62 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1236 = {_T_1229[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1238 = _T_1236 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1239 = _T_1234 | _T_1238; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_63 = {{1'd0}, _T_1239[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1244 = _GEN_63 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1246 = {_T_1239[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1248 = _T_1246 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1249 = _T_1244 | _T_1248; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1257 = _T_1177 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1258 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1257; // @[el2_lsu_dccm_ctl.scala 284:120]
  wire [7:0] _T_1262 = {{4'd0}, _T_1258[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1264 = {_T_1258[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1266 = _T_1264 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1267 = _T_1262 | _T_1266; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_64 = {{2'd0}, _T_1267[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1272 = _GEN_64 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1274 = {_T_1267[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1276 = _T_1274 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1277 = _T_1272 | _T_1276; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_65 = {{1'd0}, _T_1277[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1282 = _GEN_65 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1284 = {_T_1277[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1286 = _T_1284 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1287 = _T_1282 | _T_1286; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1295 = _T_1177 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1296 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1295; // @[el2_lsu_dccm_ctl.scala 284:120]
  wire [7:0] _T_1300 = {{4'd0}, _T_1296[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1302 = {_T_1296[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1304 = _T_1302 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1305 = _T_1300 | _T_1304; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_66 = {{2'd0}, _T_1305[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1310 = _GEN_66 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1312 = {_T_1305[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1314 = _T_1312 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1315 = _T_1310 | _T_1314; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_67 = {{1'd0}, _T_1315[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1320 = _GEN_67 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1322 = {_T_1315[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1324 = _T_1322 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1325 = _T_1320 | _T_1324; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1329 = {_T_1211,_T_1249,_T_1287,_T_1325}; // @[Cat.scala 29:58]
  wire [31:0] _T_1333 = {{16'd0}, _T_1329[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1335 = {_T_1329[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1337 = _T_1335 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1338 = _T_1333 | _T_1337; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_68 = {{8'd0}, _T_1338[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1343 = _GEN_68 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1345 = {_T_1338[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1347 = _T_1345 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1348 = _T_1343 | _T_1347; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_69 = {{4'd0}, _T_1348[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1353 = _GEN_69 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1355 = {_T_1348[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1357 = _T_1355 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1358 = _T_1353 | _T_1357; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_70 = {{2'd0}, _T_1358[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1363 = _GEN_70 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1365 = {_T_1358[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1367 = _T_1365 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1368 = _T_1363 | _T_1367; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_71 = {{1'd0}, _T_1368[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1373 = _GEN_71 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1375 = {_T_1368[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1377 = _T_1375 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg [31:0] _T_1379; // @[el2_lsu_dccm_ctl.scala 284:72]
  wire  _T_1380 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[el2_lsu_dccm_ctl.scala 285:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_947}; // @[el2_lsu_dccm_ctl.scala 244:22]
  wire  _T_1382 = ~store_byteen_ext_r[0]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1383 = _T_1380 & _T_1382; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1387 = _T_1383 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[el2_lsu_dccm_ctl.scala 285:79]
  wire [7:0] _T_1391 = {{4'd0}, _T_1387[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1393 = {_T_1387[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1395 = _T_1393 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1396 = _T_1391 | _T_1395; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_72 = {{2'd0}, _T_1396[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1401 = _GEN_72 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1403 = {_T_1396[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1405 = _T_1403 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1406 = _T_1401 | _T_1405; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_73 = {{1'd0}, _T_1406[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1411 = _GEN_73 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1413 = {_T_1406[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1415 = _T_1413 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1416 = _T_1411 | _T_1415; // @[Bitwise.scala 103:39]
  wire  _T_1419 = ~store_byteen_ext_r[1]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1420 = _T_1380 & _T_1419; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1424 = _T_1420 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[el2_lsu_dccm_ctl.scala 285:79]
  wire [7:0] _T_1428 = {{4'd0}, _T_1424[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1430 = {_T_1424[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1432 = _T_1430 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1433 = _T_1428 | _T_1432; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_74 = {{2'd0}, _T_1433[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1438 = _GEN_74 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1440 = {_T_1433[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1442 = _T_1440 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1443 = _T_1438 | _T_1442; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_75 = {{1'd0}, _T_1443[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1448 = _GEN_75 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1450 = {_T_1443[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1452 = _T_1450 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1453 = _T_1448 | _T_1452; // @[Bitwise.scala 103:39]
  wire  _T_1456 = ~store_byteen_ext_r[2]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1457 = _T_1380 & _T_1456; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1461 = _T_1457 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[el2_lsu_dccm_ctl.scala 285:79]
  wire [7:0] _T_1465 = {{4'd0}, _T_1461[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1467 = {_T_1461[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1469 = _T_1467 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1470 = _T_1465 | _T_1469; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_76 = {{2'd0}, _T_1470[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1475 = _GEN_76 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1477 = {_T_1470[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1479 = _T_1477 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1480 = _T_1475 | _T_1479; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_77 = {{1'd0}, _T_1480[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1485 = _GEN_77 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1487 = {_T_1480[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1489 = _T_1487 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1490 = _T_1485 | _T_1489; // @[Bitwise.scala 103:39]
  wire  _T_1493 = ~store_byteen_ext_r[3]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1494 = _T_1380 & _T_1493; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1498 = _T_1494 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[el2_lsu_dccm_ctl.scala 285:79]
  wire [7:0] _T_1502 = {{4'd0}, _T_1498[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1504 = {_T_1498[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1506 = _T_1504 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1507 = _T_1502 | _T_1506; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_78 = {{2'd0}, _T_1507[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1512 = _GEN_78 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1514 = {_T_1507[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1516 = _T_1514 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1517 = _T_1512 | _T_1516; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_79 = {{1'd0}, _T_1517[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1522 = _GEN_79 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1524 = {_T_1517[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1526 = _T_1524 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1527 = _T_1522 | _T_1526; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1531 = {_T_1416,_T_1453,_T_1490,_T_1527}; // @[Cat.scala 29:58]
  wire [31:0] _T_1535 = {{16'd0}, _T_1531[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1537 = {_T_1531[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1539 = _T_1537 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1540 = _T_1535 | _T_1539; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_80 = {{8'd0}, _T_1540[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1545 = _GEN_80 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1547 = {_T_1540[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1549 = _T_1547 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1550 = _T_1545 | _T_1549; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_81 = {{4'd0}, _T_1550[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1555 = _GEN_81 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1557 = {_T_1550[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1559 = _T_1557 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1560 = _T_1555 | _T_1559; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_82 = {{2'd0}, _T_1560[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1565 = _GEN_82 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1567 = {_T_1560[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1569 = _T_1567 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1570 = _T_1565 | _T_1569; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_83 = {{1'd0}, _T_1570[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1575 = _GEN_83 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1577 = {_T_1570[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1579 = _T_1577 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1581 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi; // @[el2_lsu_dccm_ctl.scala 286:105]
  wire  _T_1583 = ~store_byteen_ext_r[4]; // @[el2_lsu_dccm_ctl.scala 286:131]
  wire  _T_1584 = _T_1581 & _T_1583; // @[el2_lsu_dccm_ctl.scala 286:129]
  wire [7:0] _T_1588 = _T_1584 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[el2_lsu_dccm_ctl.scala 286:79]
  wire [7:0] _T_1592 = {{4'd0}, _T_1588[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1594 = {_T_1588[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1596 = _T_1594 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1597 = _T_1592 | _T_1596; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_84 = {{2'd0}, _T_1597[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1602 = _GEN_84 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1604 = {_T_1597[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1606 = _T_1604 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1607 = _T_1602 | _T_1606; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_85 = {{1'd0}, _T_1607[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1612 = _GEN_85 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1614 = {_T_1607[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1616 = _T_1614 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1617 = _T_1612 | _T_1616; // @[Bitwise.scala 103:39]
  wire  _T_1620 = ~store_byteen_ext_r[5]; // @[el2_lsu_dccm_ctl.scala 286:131]
  wire  _T_1621 = _T_1581 & _T_1620; // @[el2_lsu_dccm_ctl.scala 286:129]
  wire [7:0] _T_1625 = _T_1621 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[el2_lsu_dccm_ctl.scala 286:79]
  wire [7:0] _T_1629 = {{4'd0}, _T_1625[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1631 = {_T_1625[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1633 = _T_1631 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1634 = _T_1629 | _T_1633; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_86 = {{2'd0}, _T_1634[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1639 = _GEN_86 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1641 = {_T_1634[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1643 = _T_1641 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1644 = _T_1639 | _T_1643; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_87 = {{1'd0}, _T_1644[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1649 = _GEN_87 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1651 = {_T_1644[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1653 = _T_1651 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1654 = _T_1649 | _T_1653; // @[Bitwise.scala 103:39]
  wire  _T_1657 = ~store_byteen_ext_r[6]; // @[el2_lsu_dccm_ctl.scala 286:131]
  wire  _T_1658 = _T_1581 & _T_1657; // @[el2_lsu_dccm_ctl.scala 286:129]
  wire [7:0] _T_1662 = _T_1658 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[el2_lsu_dccm_ctl.scala 286:79]
  wire [7:0] _T_1666 = {{4'd0}, _T_1662[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1668 = {_T_1662[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1670 = _T_1668 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1671 = _T_1666 | _T_1670; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_88 = {{2'd0}, _T_1671[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1676 = _GEN_88 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1678 = {_T_1671[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1680 = _T_1678 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1681 = _T_1676 | _T_1680; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_89 = {{1'd0}, _T_1681[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1686 = _GEN_89 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1688 = {_T_1681[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1690 = _T_1688 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1691 = _T_1686 | _T_1690; // @[Bitwise.scala 103:39]
  wire  _T_1694 = ~store_byteen_ext_r[7]; // @[el2_lsu_dccm_ctl.scala 286:131]
  wire  _T_1695 = _T_1581 & _T_1694; // @[el2_lsu_dccm_ctl.scala 286:129]
  wire [7:0] _T_1699 = _T_1695 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[el2_lsu_dccm_ctl.scala 286:79]
  wire [7:0] _T_1703 = {{4'd0}, _T_1699[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1705 = {_T_1699[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1707 = _T_1705 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1708 = _T_1703 | _T_1707; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_90 = {{2'd0}, _T_1708[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1713 = _GEN_90 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1715 = {_T_1708[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1717 = _T_1715 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1718 = _T_1713 | _T_1717; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_91 = {{1'd0}, _T_1718[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1723 = _GEN_91 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1725 = {_T_1718[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1727 = _T_1725 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1728 = _T_1723 | _T_1727; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1732 = {_T_1617,_T_1654,_T_1691,_T_1728}; // @[Cat.scala 29:58]
  wire [31:0] _T_1736 = {{16'd0}, _T_1732[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1738 = {_T_1732[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1740 = _T_1738 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1741 = _T_1736 | _T_1740; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_92 = {{8'd0}, _T_1741[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1746 = _GEN_92 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1748 = {_T_1741[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1750 = _T_1748 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1751 = _T_1746 | _T_1750; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_93 = {{4'd0}, _T_1751[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1756 = _GEN_93 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1758 = {_T_1751[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1760 = _T_1758 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1761 = _T_1756 | _T_1760; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_94 = {{2'd0}, _T_1761[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1766 = _GEN_94 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1768 = {_T_1761[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1770 = _T_1768 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1771 = _T_1766 | _T_1770; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_95 = {{1'd0}, _T_1771[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1776 = _GEN_95 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1778 = {_T_1771[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1780 = _T_1778 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] _T_1784 = {io_store_data_hi_r,io_store_data_lo_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_96 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[el2_lsu_dccm_ctl.scala 287:94]
  wire [5:0] _T_1786 = 4'h8 * _GEN_96; // @[el2_lsu_dccm_ctl.scala 287:94]
  wire [63:0] _T_1787 = _T_1784 >> _T_1786; // @[el2_lsu_dccm_ctl.scala 287:88]
  wire [7:0] _T_1790 = store_byteen_r[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1793 = store_byteen_r[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1796 = store_byteen_r[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1799 = store_byteen_r[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1803 = {_T_1790,_T_1793,_T_1796,_T_1799}; // @[Cat.scala 29:58]
  wire [31:0] _T_1807 = {{16'd0}, _T_1803[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1809 = {_T_1803[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1811 = _T_1809 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1812 = _T_1807 | _T_1811; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_97 = {{8'd0}, _T_1812[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1817 = _GEN_97 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1819 = {_T_1812[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1821 = _T_1819 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1822 = _T_1817 | _T_1821; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_98 = {{4'd0}, _T_1822[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1827 = _GEN_98 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1829 = {_T_1822[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1831 = _T_1829 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1832 = _T_1827 | _T_1831; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_99 = {{2'd0}, _T_1832[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1837 = _GEN_99 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1839 = {_T_1832[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1841 = _T_1839 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1842 = _T_1837 | _T_1841; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_100 = {{1'd0}, _T_1842[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1847 = _GEN_100 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1849 = {_T_1842[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1851 = _T_1849 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1852 = _T_1847 | _T_1851; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_101 = {{32'd0}, _T_1852}; // @[el2_lsu_dccm_ctl.scala 287:115]
  wire [63:0] _T_1853 = _T_1787 & _GEN_101; // @[el2_lsu_dccm_ctl.scala 287:115]
  wire  _T_1858 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[el2_lsu_dccm_ctl.scala 294:50]
  wire  _T_1859 = _T_1858 & io_addr_in_pic_r; // @[el2_lsu_dccm_ctl.scala 294:76]
  wire  _T_1860 = _T_1859 & io_lsu_commit_r; // @[el2_lsu_dccm_ctl.scala 294:95]
  wire  _T_1862 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[el2_lsu_dccm_ctl.scala 295:50]
  wire  _T_1864 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[el2_lsu_dccm_ctl.scala 296:50]
  wire [31:0] _T_1868 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1874 = io_dma_pic_wen ? io_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[el2_lsu_dccm_ctl.scala 298:85]
  wire [31:0] _T_1875 = {17'h0,_T_1874}; // @[Cat.scala 29:58]
  reg  _T_1882; // @[el2_lsu_dccm_ctl.scala 303:61]
  reg  _T_1883; // @[el2_lsu_dccm_ctl.scala 304:61]
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
  assign io_dccm_rdata_hi_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 166:28]
  assign io_dccm_rdata_lo_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 165:28]
  assign io_dccm_data_ecc_hi_r = 7'h0; // @[el2_lsu_dccm_ctl.scala 167:28]
  assign io_dccm_data_ecc_lo_r = 7'h0; // @[el2_lsu_dccm_ctl.scala 168:28]
  assign io_lsu_ld_data_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 169:28]
  assign io_lsu_ld_data_corr_r = _T_2[31:0]; // @[el2_lsu_dccm_ctl.scala 171:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[el2_lsu_dccm_ctl.scala 290:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[el2_lsu_dccm_ctl.scala 289:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[el2_lsu_dccm_ctl.scala 292:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[el2_lsu_dccm_ctl.scala 291:27]
  assign io_lsu_ld_data_m = _T_763[31:0]; // @[el2_lsu_dccm_ctl.scala 174:28]
  assign io_store_data_hi_r = _T_1379; // @[el2_lsu_dccm_ctl.scala 284:29]
  assign io_store_data_lo_r = _T_1173; // @[el2_lsu_dccm_ctl.scala 283:29]
  assign io_store_datafn_hi_r = _T_1776 | _T_1780; // @[el2_lsu_dccm_ctl.scala 286:29]
  assign io_store_datafn_lo_r = _T_1575 | _T_1579; // @[el2_lsu_dccm_ctl.scala 285:29]
  assign io_store_data_r = _T_1853[31:0]; // @[el2_lsu_dccm_ctl.scala 287:29]
  assign io_ld_single_ecc_error_r = _T_815 & _T_816; // @[el2_lsu_dccm_ctl.scala 187:34]
  assign io_ld_single_ecc_error_r_ff = _T_838 & _T_839; // @[el2_lsu_dccm_ctl.scala 200:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[el2_lsu_dccm_ctl.scala 299:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_853; // @[el2_lsu_dccm_ctl.scala 201:31]
  assign io_lsu_dccm_rden_m = _T_1882; // @[el2_lsu_dccm_ctl.scala 303:24]
  assign io_lsu_dccm_rden_r = _T_1883; // @[el2_lsu_dccm_ctl.scala 304:24]
  assign io_dccm_dma_rvalid = _T & io_lsu_pkt_m_bits_dma; // @[el2_lsu_dccm_ctl.scala 161:28]
  assign io_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[el2_lsu_dccm_ctl.scala 162:28]
  assign io_dccm_dma_rtag = io_dma_mem_tag_m; // @[el2_lsu_dccm_ctl.scala 164:28]
  assign io_dccm_dma_rdata = _T_376 | _T_380; // @[el2_lsu_dccm_ctl.scala 163:28]
  assign io_dccm_wren = _T_855 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 207:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 208:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_862 : _T_866; // @[el2_lsu_dccm_ctl.scala 210:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_888 : _T_896; // @[el2_lsu_dccm_ctl.scala 221:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[el2_lsu_dccm_ctl.scala 218:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_872 : _T_876; // @[el2_lsu_dccm_ctl.scala 214:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_906 : _T_914; // @[el2_lsu_dccm_ctl.scala 227:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[el2_lsu_dccm_ctl.scala 219:22]
  assign io_picm_wren = _T_1860 | io_dma_pic_wen; // @[el2_lsu_dccm_ctl.scala 294:27]
  assign io_picm_rden = _T_1862 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 295:27]
  assign io_picm_mken = _T_1864 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 296:27]
  assign io_picm_rdaddr = 32'hf00c0000 | _T_1868; // @[el2_lsu_dccm_ctl.scala 297:27]
  assign io_picm_wraddr = 32'hf00c0000 | _T_1875; // @[el2_lsu_dccm_ctl.scala 298:27]
  assign io_picm_wr_data = io_dma_pic_wen ? io_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[el2_lsu_dccm_ctl.scala 300:27]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 511:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  _T_2 = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_double_ecc_error_r_ff = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ld_single_ecc_error_hi_r_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ld_single_ecc_error_lo_r_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ld_sec_addr_hi_r_ff = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  ld_sec_addr_lo_r_ff = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1173 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1379 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1882 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_1883 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_2 = 64'h0;
  end
  if (reset) begin
    lsu_double_ecc_error_r_ff = 1'h0;
  end
  if (reset) begin
    ld_single_ecc_error_hi_r_ff = 1'h0;
  end
  if (reset) begin
    ld_single_ecc_error_lo_r_ff = 1'h0;
  end
  if (reset) begin
    ld_sec_addr_hi_r_ff = 16'h0;
  end
  if (reset) begin
    ld_sec_addr_lo_r_ff = 16'h0;
  end
  if (reset) begin
    _T_1173 = 32'h0;
  end
  if (reset) begin
    _T_1379 = 32'h0;
  end
  if (reset) begin
    _T_1882 = 1'h0;
  end
  if (reset) begin
    _T_1883 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_2 <= 64'h0;
    end else begin
      _T_2 <= lsu_rdata_corr_m >> _T_762;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_double_ecc_error_r_ff <= 1'h0;
    end else begin
      lsu_double_ecc_error_r_ff <= io_lsu_double_ecc_error_r;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_hi_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_hi_r_ff <= _T_822 & _T_823;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_819 & _T_820;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_hi_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_hi_r_ff <= io_end_addr_r;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_lo_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_lo_r_ff <= io_lsu_addr_r[15:0];
    end
  end
  always @(posedge io_lsu_store_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_1173 <= 32'h0;
    end else begin
      _T_1173 <= _T_1167 | _T_1171;
    end
  end
  always @(posedge io_lsu_store_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_1379 <= 32'h0;
    end else begin
      _T_1379 <= _T_1373 | _T_1377;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_1882 <= 1'h0;
    end else begin
      _T_1882 <= _T_837 & io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1883 <= 1'h0;
    end else begin
      _T_1883 <= io_lsu_dccm_rden_m;
    end
  end
endmodule
