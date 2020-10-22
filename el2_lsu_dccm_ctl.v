module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 330:26]
  wire  clkhdr_CK; // @[beh_lib.scala 330:26]
  wire  clkhdr_EN; // @[beh_lib.scala 330:26]
  wire  clkhdr_SE; // @[beh_lib.scala 330:26]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 330:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 331:14]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 332:18]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 333:18]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 334:18]
endmodule
module el2_lsu_dccm_ctl(
  input         clock,
  input         reset,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_store_c1_r_clk,
  input         io_clk,
  input         io_lsu_pkt_d_fast_int,
  input         io_lsu_pkt_d_by,
  input         io_lsu_pkt_d_half,
  input         io_lsu_pkt_d_word,
  input         io_lsu_pkt_d_dword,
  input         io_lsu_pkt_d_load,
  input         io_lsu_pkt_d_store,
  input         io_lsu_pkt_d_unsign,
  input         io_lsu_pkt_d_dma,
  input         io_lsu_pkt_d_store_data_bypass_d,
  input         io_lsu_pkt_d_load_ldst_bypass_d,
  input         io_lsu_pkt_d_store_data_bypass_m,
  input         io_lsu_pkt_d_valid,
  input         io_lsu_pkt_m_fast_int,
  input         io_lsu_pkt_m_by,
  input         io_lsu_pkt_m_half,
  input         io_lsu_pkt_m_word,
  input         io_lsu_pkt_m_dword,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_unsign,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_store_data_bypass_d,
  input         io_lsu_pkt_m_load_ldst_bypass_d,
  input         io_lsu_pkt_m_store_data_bypass_m,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_fast_int,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_dword,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
  input         io_lsu_pkt_r_dma,
  input         io_lsu_pkt_r_store_data_bypass_d,
  input         io_lsu_pkt_r_load_ldst_bypass_d,
  input         io_lsu_pkt_r_store_data_bypass_m,
  input         io_lsu_pkt_r_valid,
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
  wire  rvclkhdr_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_io_scan_mode; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_l1clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_clk; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_en; // @[beh_lib.scala 350:21]
  wire  rvclkhdr_1_io_scan_mode; // @[beh_lib.scala 350:21]
  wire [63:0] picm_rd_data_m = {io_picm_rd_data,io_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_load; // @[el2_lsu_dccm_ctl.scala 168:50]
  wire [7:0] _T_30 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_33 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [7:0] _T_38 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_corr_m[15:8]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_1 = _T_30[1] ? _T_33[15:8] : _T_38; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_18 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_corr_m[7:0]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_0 = _T_30[0] ? _T_33[7:0] : _T_18; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_78 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_corr_m[31:24]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_3 = _T_30[3] ? _T_33[31:24] : _T_78; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_58 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_corr_m[23:16]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_2 = _T_30[2] ? _T_33[23:16] : _T_58; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [31:0] _T_4 = {lsu_rdata_corr_m_3,lsu_rdata_corr_m_2,lsu_rdata_corr_m_1,lsu_rdata_corr_m_0}; // @[el2_lsu_dccm_ctl.scala 170:48]
  wire [7:0] _T_118 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_corr_m[47:40]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_5 = _T_30[5] ? _T_33[47:40] : _T_118; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_98 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_corr_m[39:32]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_4 = _T_30[4] ? _T_33[39:32] : _T_98; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_158 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_corr_m[63:56]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_7 = _T_30[7] ? _T_33[63:56] : _T_158; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_138 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_corr_m[55:48]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_6 = _T_30[6] ? _T_33[55:48] : _T_138; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [31:0] _T_7 = {lsu_rdata_corr_m_7,lsu_rdata_corr_m_6,lsu_rdata_corr_m_5,lsu_rdata_corr_m_4}; // @[el2_lsu_dccm_ctl.scala 170:48]
  wire [63:0] _T_8 = {lsu_rdata_corr_m_7,lsu_rdata_corr_m_6,lsu_rdata_corr_m_5,lsu_rdata_corr_m_4,lsu_rdata_corr_m_3,lsu_rdata_corr_m_2,lsu_rdata_corr_m_1,lsu_rdata_corr_m_0}; // @[el2_lsu_dccm_ctl.scala 170:48]
  reg [63:0] _T_9; // @[el2_lsu_dccm_ctl.scala 178:65]
  wire [7:0] _T_28 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_m[7:0]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_0 = _T_30[0] ? _T_33[7:0] : _T_28; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_48 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_m[15:8]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_1 = _T_30[1] ? _T_33[15:8] : _T_48; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_68 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_m[23:16]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_2 = _T_30[2] ? _T_33[23:16] : _T_68; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_88 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_m[31:24]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_3 = _T_30[3] ? _T_33[31:24] : _T_88; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_108 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_m[39:32]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_4 = _T_30[4] ? _T_33[39:32] : _T_108; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_128 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_m[47:40]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_5 = _T_30[5] ? _T_33[47:40] : _T_128; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_148 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_m[55:48]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_6 = _T_30[6] ? _T_33[55:48] : _T_148; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_168 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_m[63:56]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_7 = _T_30[7] ? _T_33[63:56] : _T_168; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [63:0] _T_176 = {lsu_rdata_m_7,lsu_rdata_m_6,lsu_rdata_m_5,lsu_rdata_m_4,lsu_rdata_m_3,lsu_rdata_m_2,lsu_rdata_m_1,lsu_rdata_m_0}; // @[el2_lsu_dccm_ctl.scala 186:43]
  wire [3:0] _GEN_0 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_dccm_ctl.scala 186:56]
  wire [5:0] _T_178 = 4'h8 * _GEN_0; // @[el2_lsu_dccm_ctl.scala 186:56]
  wire [63:0] _T_179 = _T_176 >> _T_178; // @[el2_lsu_dccm_ctl.scala 186:50]
  wire  _T_192 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 190:64]
  wire  _T_195 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 190:145]
  wire  _T_196 = _T_192 | _T_195; // @[el2_lsu_dccm_ctl.scala 190:109]
  wire  _T_197 = _T_196 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 190:191]
  wire  _T_198 = _T_197 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 190:212]
  wire  _T_199 = _T_198 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 190:233]
  wire  _T_200 = _T_199 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 190:252]
  wire  _T_203 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 191:41]
  wire  _T_206 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 191:122]
  wire  _T_207 = _T_203 | _T_206; // @[el2_lsu_dccm_ctl.scala 191:86]
  wire  _T_208 = _T_207 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 191:168]
  wire  _T_209 = _T_208 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 191:189]
  wire  _T_210 = _T_209 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 191:210]
  wire  _T_211 = _T_210 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 191:229]
  wire  kill_ecc_corr_lo_r = _T_200 | _T_211; // @[el2_lsu_dccm_ctl.scala 190:273]
  wire  _T_214 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 192:64]
  wire  _T_217 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 192:145]
  wire  _T_218 = _T_214 | _T_217; // @[el2_lsu_dccm_ctl.scala 192:109]
  wire  _T_219 = _T_218 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 192:191]
  wire  _T_220 = _T_219 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 192:212]
  wire  _T_221 = _T_220 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 192:233]
  wire  _T_222 = _T_221 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 192:252]
  wire  _T_225 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 193:41]
  wire  _T_228 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 193:122]
  wire  _T_229 = _T_225 | _T_228; // @[el2_lsu_dccm_ctl.scala 193:86]
  wire  _T_230 = _T_229 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 193:168]
  wire  _T_231 = _T_230 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 193:189]
  wire  _T_232 = _T_231 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 193:210]
  wire  _T_233 = _T_232 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 193:229]
  wire  kill_ecc_corr_hi_r = _T_222 | _T_233; // @[el2_lsu_dccm_ctl.scala 192:273]
  wire  _T_234 = io_lsu_pkt_r_load & io_single_ecc_error_lo_r; // @[el2_lsu_dccm_ctl.scala 194:55]
  wire  _T_235 = ~io_lsu_raw_fwd_lo_r; // @[el2_lsu_dccm_ctl.scala 194:84]
  wire  ld_single_ecc_error_lo_r = _T_234 & _T_235; // @[el2_lsu_dccm_ctl.scala 194:82]
  wire  _T_236 = io_lsu_pkt_r_load & io_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 195:55]
  wire  _T_237 = ~io_lsu_raw_fwd_hi_r; // @[el2_lsu_dccm_ctl.scala 195:84]
  wire  ld_single_ecc_error_hi_r = _T_236 & _T_237; // @[el2_lsu_dccm_ctl.scala 195:82]
  wire  _T_238 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 196:62]
  wire  _T_239 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_dccm_ctl.scala 196:92]
  wire  _T_241 = io_lsu_commit_r | io_lsu_pkt_r_dma; // @[el2_lsu_dccm_ctl.scala 197:81]
  wire  _T_242 = ld_single_ecc_error_lo_r & _T_241; // @[el2_lsu_dccm_ctl.scala 197:62]
  wire  _T_243 = ~kill_ecc_corr_lo_r; // @[el2_lsu_dccm_ctl.scala 197:103]
  wire  _T_245 = ld_single_ecc_error_hi_r & _T_241; // @[el2_lsu_dccm_ctl.scala 198:62]
  wire  _T_246 = ~kill_ecc_corr_hi_r; // @[el2_lsu_dccm_ctl.scala 198:103]
  reg  lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 200:74]
  reg  ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 201:74]
  reg  ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 202:74]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[beh_lib.scala 356:14]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[beh_lib.scala 356:14]
  wire  _T_253 = io_lsu_pkt_d_word | io_lsu_pkt_d_dword; // @[el2_lsu_dccm_ctl.scala 208:110]
  wire  _T_254 = ~_T_253; // @[el2_lsu_dccm_ctl.scala 208:90]
  wire  _T_256 = io_lsu_addr_d[1:0] != 2'h0; // @[el2_lsu_dccm_ctl.scala 208:154]
  wire  _T_257 = _T_254 | _T_256; // @[el2_lsu_dccm_ctl.scala 208:132]
  wire  _T_258 = io_lsu_pkt_d_store & _T_257; // @[el2_lsu_dccm_ctl.scala 208:87]
  wire  _T_259 = io_lsu_pkt_d_load | _T_258; // @[el2_lsu_dccm_ctl.scala 208:65]
  wire  _T_260 = io_lsu_pkt_d_valid & _T_259; // @[el2_lsu_dccm_ctl.scala 208:44]
  wire  lsu_dccm_rden_d = _T_260 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 208:171]
  wire  _T_261 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 211:63]
  wire  _T_262 = ~lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 211:96]
  wire  _T_264 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[el2_lsu_dccm_ctl.scala 212:71]
  wire  _T_265 = _T_264 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 212:89]
  wire  _T_266 = ~_T_265; // @[el2_lsu_dccm_ctl.scala 212:53]
  wire  _T_269 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 213:107]
  wire  _T_272 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 214:88]
  wire  _T_273 = _T_269 | _T_272; // @[el2_lsu_dccm_ctl.scala 213:195]
  wire  _T_274 = ~_T_273; // @[el2_lsu_dccm_ctl.scala 213:24]
  wire  _T_275 = lsu_dccm_rden_d & _T_274; // @[el2_lsu_dccm_ctl.scala 213:22]
  wire  _T_276 = _T_266 | _T_275; // @[el2_lsu_dccm_ctl.scala 212:120]
  wire  _T_278 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[el2_lsu_dccm_ctl.scala 217:41]
  wire [15:0] _T_285 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 220:8]
  wire [15:0] _T_289 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 221:8]
  wire [15:0] _T_295 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 223:8]
  wire [15:0] _T_299 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 224:8]
  wire  _T_304 = ~ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 228:36]
  wire [38:0] _T_307 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_310 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_311 = _T_304 ? _T_307 : _T_310; // @[el2_lsu_dccm_ctl.scala 228:8]
  wire [38:0] _T_315 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_318 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_319 = io_dma_dccm_wen ? _T_315 : _T_318; // @[el2_lsu_dccm_ctl.scala 230:8]
  wire  _T_322 = ~ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 234:36]
  wire [38:0] _T_329 = _T_322 ? _T_310 : _T_307; // @[el2_lsu_dccm_ctl.scala 234:8]
  wire [38:0] _T_333 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_337 = io_dma_dccm_wen ? _T_333 : _T_318; // @[el2_lsu_dccm_ctl.scala 236:8]
  wire [3:0] _T_340 = io_lsu_pkt_m_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_342 = io_lsu_pkt_m_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_343 = _T_342 & 4'h1; // @[el2_lsu_dccm_ctl.scala 240:84]
  wire [3:0] _T_345 = io_lsu_pkt_m_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_346 = _T_345 & 4'h3; // @[el2_lsu_dccm_ctl.scala 241:33]
  wire [3:0] _T_347 = _T_343 | _T_346; // @[el2_lsu_dccm_ctl.scala 240:97]
  wire [3:0] _T_349 = io_lsu_pkt_m_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_351 = _T_347 | _T_349; // @[el2_lsu_dccm_ctl.scala 241:46]
  wire [3:0] store_byteen_m = _T_340 & _T_351; // @[el2_lsu_dccm_ctl.scala 240:53]
  wire [3:0] _T_353 = io_lsu_pkt_r_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_355 = io_lsu_pkt_r_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_356 = _T_355 & 4'h1; // @[el2_lsu_dccm_ctl.scala 243:84]
  wire [3:0] _T_358 = io_lsu_pkt_r_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_359 = _T_358 & 4'h3; // @[el2_lsu_dccm_ctl.scala 244:33]
  wire [3:0] _T_360 = _T_356 | _T_359; // @[el2_lsu_dccm_ctl.scala 243:97]
  wire [3:0] _T_362 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_364 = _T_360 | _T_362; // @[el2_lsu_dccm_ctl.scala 244:46]
  wire [3:0] store_byteen_r = _T_353 & _T_364; // @[el2_lsu_dccm_ctl.scala 243:53]
  wire [7:0] _T_366 = {4'h0,store_byteen_m}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_2 = {{3'd0}, _T_366}; // @[el2_lsu_dccm_ctl.scala 246:62]
  wire [10:0] store_byteen_ext_m = _GEN_2 << io_lsu_addr_m[1:0]; // @[el2_lsu_dccm_ctl.scala 246:62]
  wire [7:0] _T_369 = {4'h0,store_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_3 = {{3'd0}, _T_369}; // @[el2_lsu_dccm_ctl.scala 247:62]
  wire [10:0] store_byteen_ext_r = _GEN_3 << io_lsu_addr_r[1:0]; // @[el2_lsu_dccm_ctl.scala 247:62]
  wire  _T_373 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 250:71]
  wire  dccm_wr_bypass_d_m_lo = _T_373 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 250:109]
  wire  _T_376 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 251:71]
  wire  dccm_wr_bypass_d_m_hi = _T_376 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 251:109]
  wire  _T_379 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 253:71]
  wire  dccm_wr_bypass_d_r_lo = _T_379 & io_addr_in_dccm_r; // @[el2_lsu_dccm_ctl.scala 253:109]
  wire [63:0] _T_385 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_5 = {{63'd0}, _T_385}; // @[el2_lsu_dccm_ctl.scala 287:72]
  wire [126:0] _T_388 = _GEN_5 << _T_178; // @[el2_lsu_dccm_ctl.scala 287:72]
  wire [63:0] store_data_pre_m = _T_388[63:0]; // @[el2_lsu_dccm_ctl.scala 287:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[el2_lsu_dccm_ctl.scala 288:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[el2_lsu_dccm_ctl.scala 289:48]
  wire  _T_394 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[el2_lsu_dccm_ctl.scala 290:195]
  wire [7:0] _T_398 = _T_394 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_399 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_398; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_407 = _T_394 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_408 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_407; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_416 = _T_394 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_417 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_416; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_425 = _T_394 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_426 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_425; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [15:0] _T_428 = {_T_417,_T_426}; // @[Cat.scala 29:58]
  wire [15:0] _T_429 = {_T_399,_T_408}; // @[Cat.scala 29:58]
  reg [31:0] _T_431; // @[el2_lsu_dccm_ctl.scala 290:72]
  wire  _T_435 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[el2_lsu_dccm_ctl.scala 291:195]
  wire [7:0] _T_439 = _T_435 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_440 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_439; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_448 = _T_435 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_449 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_448; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_457 = _T_435 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_458 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_457; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_466 = _T_435 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_467 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_466; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [15:0] _T_469 = {_T_458,_T_467}; // @[Cat.scala 29:58]
  wire [15:0] _T_470 = {_T_440,_T_449}; // @[Cat.scala 29:58]
  reg [31:0] _T_472; // @[el2_lsu_dccm_ctl.scala 291:72]
  wire  _T_473 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[el2_lsu_dccm_ctl.scala 292:89]
  wire  _T_475 = ~store_byteen_ext_r[0]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_476 = _T_473 & _T_475; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_480 = _T_476 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_483 = ~store_byteen_ext_r[1]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_484 = _T_473 & _T_483; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_488 = _T_484 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_491 = ~store_byteen_ext_r[2]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_492 = _T_473 & _T_491; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_496 = _T_492 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_499 = ~store_byteen_ext_r[3]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_500 = _T_473 & _T_499; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_504 = _T_500 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire [15:0] _T_506 = {_T_496,_T_504}; // @[Cat.scala 29:58]
  wire [15:0] _T_507 = {_T_480,_T_488}; // @[Cat.scala 29:58]
  wire [7:0] _T_516 = _T_476 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_524 = _T_484 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_532 = _T_492 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_540 = _T_500 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [15:0] _T_542 = {_T_532,_T_540}; // @[Cat.scala 29:58]
  wire [15:0] _T_543 = {_T_516,_T_524}; // @[Cat.scala 29:58]
  wire [63:0] _T_547 = {io_store_data_hi_r,io_store_data_lo_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_6 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[el2_lsu_dccm_ctl.scala 294:102]
  wire [5:0] _T_549 = 4'h8 * _GEN_6; // @[el2_lsu_dccm_ctl.scala 294:102]
  wire [63:0] _T_550 = _T_547 >> _T_549; // @[el2_lsu_dccm_ctl.scala 294:96]
  wire [511:0] _T_553 = {_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550}; // @[Cat.scala 29:58]
  wire [1023:0] _T_554 = {_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_553}; // @[Cat.scala 29:58]
  wire [2047:0] _T_555 = {_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_550,_T_553,_T_554}; // @[Cat.scala 29:58]
  wire [7:0] _T_558 = store_byteen_r[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_561 = store_byteen_r[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_564 = store_byteen_r[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_567 = store_byteen_r[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_571 = {_T_558,_T_561,_T_564,_T_567}; // @[Cat.scala 29:58]
  wire [2047:0] _GEN_7 = {{2016'd0}, _T_571}; // @[el2_lsu_dccm_ctl.scala 294:123]
  wire [2047:0] _T_572 = _T_555 & _GEN_7; // @[el2_lsu_dccm_ctl.scala 294:123]
  wire  _T_577 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_dccm_ctl.scala 302:50]
  wire  _T_578 = _T_577 & io_addr_in_pic_r; // @[el2_lsu_dccm_ctl.scala 302:71]
  wire  _T_579 = _T_578 & io_lsu_commit_r; // @[el2_lsu_dccm_ctl.scala 302:90]
  wire  _T_581 = io_lsu_pkt_d_valid & io_lsu_pkt_d_load; // @[el2_lsu_dccm_ctl.scala 303:50]
  wire  _T_583 = io_lsu_pkt_d_valid & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 304:50]
  wire [5:0] _T_586 = 6'h20 - 6'h1; // @[el2_lsu_dccm_ctl.scala 306:58]
  wire [20:0] _T_588 = {_T_586,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_8 = {{11'd0}, _T_588}; // @[el2_lsu_dccm_ctl.scala 306:47]
  wire [14:0] _T_595 = io_dma_pic_wen ? io_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[el2_lsu_dccm_ctl.scala 307:78]
  wire [20:0] _T_596 = {_T_586,_T_595}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_9 = {{11'd0}, _T_596}; // @[el2_lsu_dccm_ctl.scala 307:47]
  reg  _T_603; // @[el2_lsu_dccm_ctl.scala 312:61]
  reg  _T_604; // @[el2_lsu_dccm_ctl.scala 313:61]
  rvclkhdr rvclkhdr ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[beh_lib.scala 350:21]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_dccm_rdata_hi_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 173:28]
  assign io_dccm_rdata_lo_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 172:28]
  assign io_dccm_data_ecc_hi_r = 7'h0; // @[el2_lsu_dccm_ctl.scala 174:28]
  assign io_dccm_data_ecc_lo_r = 7'h0; // @[el2_lsu_dccm_ctl.scala 175:28]
  assign io_lsu_ld_data_r = 32'h0; // @[el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27 el2_lsu_dccm_ctl.scala 181:27]
  assign io_lsu_ld_data_corr_r = _T_9[31:0]; // @[el2_lsu_dccm_ctl.scala 178:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[el2_lsu_dccm_ctl.scala 298:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[el2_lsu_dccm_ctl.scala 297:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[el2_lsu_dccm_ctl.scala 300:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[el2_lsu_dccm_ctl.scala 299:27]
  assign io_lsu_ld_data_m = _T_179[31:0]; // @[el2_lsu_dccm_ctl.scala 186:28]
  assign io_store_data_hi_r = _T_472; // @[el2_lsu_dccm_ctl.scala 291:29]
  assign io_store_data_lo_r = _T_431; // @[el2_lsu_dccm_ctl.scala 290:29]
  assign io_store_datafn_hi_r = {_T_543,_T_542}; // @[el2_lsu_dccm_ctl.scala 293:29]
  assign io_store_datafn_lo_r = {_T_507,_T_506}; // @[el2_lsu_dccm_ctl.scala 292:29]
  assign io_store_data_r = _T_572[31:0]; // @[el2_lsu_dccm_ctl.scala 294:29]
  assign io_ld_single_ecc_error_r = _T_238 & _T_239; // @[el2_lsu_dccm_ctl.scala 196:33]
  assign io_ld_single_ecc_error_r_ff = _T_261 & _T_262; // @[el2_lsu_dccm_ctl.scala 211:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[el2_lsu_dccm_ctl.scala 308:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_276; // @[el2_lsu_dccm_ctl.scala 212:27]
  assign io_lsu_dccm_rden_m = _T_603; // @[el2_lsu_dccm_ctl.scala 312:24]
  assign io_lsu_dccm_rden_r = _T_604; // @[el2_lsu_dccm_ctl.scala 313:24]
  assign io_dccm_dma_rvalid = _T & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 168:28]
  assign io_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[el2_lsu_dccm_ctl.scala 169:28]
  assign io_dccm_dma_rtag = io_dma_mem_tag_m; // @[el2_lsu_dccm_ctl.scala 171:28]
  assign io_dccm_dma_rdata = {_T_7,_T_4}; // @[el2_lsu_dccm_ctl.scala 170:28]
  assign io_dccm_wren = _T_278 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 217:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 218:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_285 : _T_289; // @[el2_lsu_dccm_ctl.scala 219:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_311 : _T_319; // @[el2_lsu_dccm_ctl.scala 227:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[el2_lsu_dccm_ctl.scala 225:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_295 : _T_299; // @[el2_lsu_dccm_ctl.scala 222:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_329 : _T_337; // @[el2_lsu_dccm_ctl.scala 233:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[el2_lsu_dccm_ctl.scala 226:22]
  assign io_picm_wren = _T_579 | io_dma_pic_wen; // @[el2_lsu_dccm_ctl.scala 302:27]
  assign io_picm_rden = _T_581 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 303:27]
  assign io_picm_mken = _T_583 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 304:27]
  assign io_picm_rdaddr = 32'hf00c0000 | _GEN_8; // @[el2_lsu_dccm_ctl.scala 306:27]
  assign io_picm_wraddr = 32'hf00c0000 | _GEN_9; // @[el2_lsu_dccm_ctl.scala 307:27]
  assign io_picm_wr_data = io_dma_pic_wen ? io_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[el2_lsu_dccm_ctl.scala 309:27]
  assign rvclkhdr_io_clk = io_clk; // @[beh_lib.scala 352:16]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[beh_lib.scala 353:15]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
  assign rvclkhdr_1_io_clk = io_clk; // @[beh_lib.scala 352:16]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[beh_lib.scala 353:15]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[beh_lib.scala 354:22]
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
  _T_9 = _RAND_0[63:0];
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
  _T_431 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_472 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_603 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_604 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_9 = 64'h0;
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
    _T_603 = 1'h0;
  end
  if (reset) begin
    _T_604 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_store_c1_r_clk) begin
    _T_431 <= {_T_429,_T_428};
    _T_472 <= {_T_470,_T_469};
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_9 <= 64'h0;
    end else begin
      _T_9 <= _T_8 >> _T_178;
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
      ld_single_ecc_error_hi_r_ff <= _T_245 & _T_246;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_242 & _T_243;
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
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_603 <= 1'h0;
    end else begin
      _T_603 <= _T_260 & io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_604 <= 1'h0;
    end else begin
      _T_604 <= io_lsu_dccm_rden_m;
    end
  end
endmodule
