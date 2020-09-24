module el2_lsu_stbuf(
  input         clock,
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_stbuf_c1_clk,
  input         io_lsu_free_c2_clk,
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
`endif // RANDOMIZE_REG_INIT
  wire [7:0] _T_1 = io_lsu_pkt_r_by ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_2 = _T_1 & 8'h1; // @[el2_lsu_stbuf.scala 108:49]
  wire [7:0] _T_4 = io_lsu_pkt_r_half ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_5 = _T_4 & 8'h3; // @[el2_lsu_stbuf.scala 109:32]
  wire [7:0] _T_6 = _T_2 | _T_5; // @[el2_lsu_stbuf.scala 108:65]
  wire [7:0] _T_8 = io_lsu_pkt_r_word ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_9 = _T_8 & 8'hf; // @[el2_lsu_stbuf.scala 110:32]
  wire [7:0] _T_10 = _T_6 | _T_9; // @[el2_lsu_stbuf.scala 109:48]
  wire [7:0] _T_12 = io_lsu_pkt_r_dword ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] ldst_byteen_r = _T_10 | _T_12; // @[el2_lsu_stbuf.scala 110:48]
  wire  ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_stbuf.scala 112:40]
  reg  ldst_dual_r; // @[el2_lsu_stbuf.scala 161:53]
  wire  dual_stbuf_write_r = ldst_dual_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 113:41]
  wire [10:0] _GEN_38 = {{3'd0}, ldst_byteen_r}; // @[el2_lsu_stbuf.scala 115:40]
  wire [10:0] _T_17 = _GEN_38 << io_lsu_addr_r[1:0]; // @[el2_lsu_stbuf.scala 115:40]
  wire [7:0] store_byteen_ext_r = _T_17[7:0]; // @[el2_lsu_stbuf.scala 115:23]
  wire [3:0] _T_20 = io_lsu_pkt_m_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_20; // @[el2_lsu_stbuf.scala 116:53]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_20; // @[el2_lsu_stbuf.scala 117:53]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] NxtRdPtr = RdPtr + 2'h1; // @[el2_lsu_stbuf.scala 118:27]
  reg [15:0] stbuf_addr_0; // @[Reg.scala 27:20]
  wire  _T_30 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_0; // @[Reg.scala 27:20]
  wire  _T_31 = _T_30 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_0; // @[Reg.scala 27:20]
  wire  _T_32 = ~stbuf_dma_kill_0; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_33 = _T_31 & _T_32; // @[el2_lsu_stbuf.scala 124:196]
  wire  _T_184 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[el2_lsu_stbuf.scala 132:78]
  reg [15:0] stbuf_addr_1; // @[Reg.scala 27:20]
  wire  _T_39 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_1; // @[Reg.scala 27:20]
  wire  _T_40 = _T_39 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_1; // @[Reg.scala 27:20]
  wire  _T_41 = ~stbuf_dma_kill_1; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_42 = _T_40 & _T_41; // @[el2_lsu_stbuf.scala 124:196]
  reg [15:0] stbuf_addr_2; // @[Reg.scala 27:20]
  wire  _T_48 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_2; // @[Reg.scala 27:20]
  wire  _T_49 = _T_48 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_2; // @[Reg.scala 27:20]
  wire  _T_50 = ~stbuf_dma_kill_2; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_51 = _T_49 & _T_50; // @[el2_lsu_stbuf.scala 124:196]
  reg [15:0] stbuf_addr_3; // @[Reg.scala 27:20]
  wire  _T_57 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_3; // @[Reg.scala 27:20]
  wire  _T_58 = _T_57 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_3; // @[Reg.scala 27:20]
  wire  _T_59 = ~stbuf_dma_kill_3; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_60 = _T_58 & _T_59; // @[el2_lsu_stbuf.scala 124:196]
  wire [3:0] store_matchvec_lo_r = {_T_60,_T_51,_T_42,_T_33}; // @[Cat.scala 29:58]
  wire  _T_68 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_69 = _T_68 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_71 = _T_69 & _T_32; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_72 = _T_71 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_78 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_79 = _T_78 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_81 = _T_79 & _T_41; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_82 = _T_81 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_88 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_89 = _T_88 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_91 = _T_89 & _T_50; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_92 = _T_91 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_98 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_99 = _T_98 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_101 = _T_99 & _T_59; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_102 = _T_101 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire [3:0] store_matchvec_hi_r = {_T_102,_T_92,_T_82,_T_72}; // @[Cat.scala 29:58]
  wire  _T_124 = store_matchvec_lo_r[0] | store_matchvec_hi_r[0]; // @[el2_lsu_stbuf.scala 131:126]
  wire  _T_141 = store_matchvec_lo_r[1] | store_matchvec_hi_r[1]; // @[el2_lsu_stbuf.scala 131:126]
  wire  _T_158 = store_matchvec_lo_r[2] | store_matchvec_hi_r[2]; // @[el2_lsu_stbuf.scala 131:126]
  wire  _T_175 = store_matchvec_lo_r[3] | store_matchvec_hi_r[3]; // @[el2_lsu_stbuf.scala 131:126]
  wire [3:0] stbuf_wr_en = {_T_175,_T_158,_T_141,_T_124}; // @[Cat.scala 29:58]
  wire [3:0] sel_lo = {store_matchvec_lo_r[3],store_matchvec_lo_r[2],store_matchvec_lo_r[1],store_matchvec_lo_r[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_220 = sel_lo[0] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_222 = sel_lo[1] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_224 = sel_lo[2] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_226 = sel_lo[3] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  reg [3:0] stbuf_byteen_0; // @[Reg.scala 27:20]
  wire [3:0] _T_228 = stbuf_byteen_0 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_229 = stbuf_byteen_0 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  reg [3:0] stbuf_byteen_1; // @[Reg.scala 27:20]
  wire [3:0] _T_232 = stbuf_byteen_1 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_233 = stbuf_byteen_1 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  reg [3:0] stbuf_byteen_2; // @[Reg.scala 27:20]
  wire [3:0] _T_236 = stbuf_byteen_2 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_237 = stbuf_byteen_2 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  reg [3:0] stbuf_byteen_3; // @[Reg.scala 27:20]
  wire [3:0] _T_240 = stbuf_byteen_3 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_241 = stbuf_byteen_3 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  wire  _T_245 = ~stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_247 = _T_245 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_0; // @[Reg.scala 27:20]
  wire [7:0] _T_250 = _T_247 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_254 = _T_245 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_257 = _T_254 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_3 = sel_lo[0] ? _T_250 : _T_257; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_261 = ~stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_263 = _T_261 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_1; // @[Reg.scala 27:20]
  wire [7:0] _T_266 = _T_263 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_270 = _T_261 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_273 = _T_270 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_2 = sel_lo[1] ? _T_266 : _T_273; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_277 = ~stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_279 = _T_277 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_2; // @[Reg.scala 27:20]
  wire [7:0] _T_282 = _T_279 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_286 = _T_277 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_289 = _T_286 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_1 = sel_lo[2] ? _T_282 : _T_289; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_293 = ~stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_295 = _T_293 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_3; // @[Reg.scala 27:20]
  wire [7:0] _T_298 = _T_295 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_302 = _T_293 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_305 = _T_302 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_0 = sel_lo[3] ? _T_298 : _T_305; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_309 = ~stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_311 = _T_309 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_314 = _T_311 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_318 = _T_309 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_321 = _T_318 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_3 = sel_lo[0] ? _T_314 : _T_321; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_325 = ~stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_327 = _T_325 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_330 = _T_327 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_334 = _T_325 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_337 = _T_334 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_2 = sel_lo[1] ? _T_330 : _T_337; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_341 = ~stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_343 = _T_341 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_346 = _T_343 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_350 = _T_341 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_353 = _T_350 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_1 = sel_lo[2] ? _T_346 : _T_353; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_357 = ~stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_359 = _T_357 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_362 = _T_359 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_366 = _T_357 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_369 = _T_366 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_0 = sel_lo[3] ? _T_362 : _T_369; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_373 = ~stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_375 = _T_373 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_378 = _T_375 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_382 = _T_373 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_385 = _T_382 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_3 = sel_lo[0] ? _T_378 : _T_385; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_389 = ~stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_391 = _T_389 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_394 = _T_391 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_398 = _T_389 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_401 = _T_398 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_2 = sel_lo[1] ? _T_394 : _T_401; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_405 = ~stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_407 = _T_405 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_410 = _T_407 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_414 = _T_405 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_417 = _T_414 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_1 = sel_lo[2] ? _T_410 : _T_417; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_421 = ~stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_423 = _T_421 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_426 = _T_423 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_430 = _T_421 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_433 = _T_430 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_0 = sel_lo[3] ? _T_426 : _T_433; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_437 = ~stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_439 = _T_437 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_442 = _T_439 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_446 = _T_437 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_449 = _T_446 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_3 = sel_lo[0] ? _T_442 : _T_449; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_453 = ~stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_455 = _T_453 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_458 = _T_455 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_462 = _T_453 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_465 = _T_462 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_2 = sel_lo[1] ? _T_458 : _T_465; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_469 = ~stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_471 = _T_469 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_474 = _T_471 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_478 = _T_469 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_481 = _T_478 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_1 = sel_lo[2] ? _T_474 : _T_481; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_485 = ~stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_487 = _T_485 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_490 = _T_487 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_494 = _T_485 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_497 = _T_494 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_0 = sel_lo[3] ? _T_490 : _T_497; // @[el2_lsu_stbuf.scala 147:53]
  wire [31:0] stbuf_datain_0 = {datain4_0,datain3_0,datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_1 = {datain4_1,datain3_1,datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_2 = {datain4_2,datain3_2,datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_3 = {datain4_3,datain3_3,datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire  _GEN_0 = stbuf_wr_en[0] | stbuf_vld_0; // @[Reg.scala 28:19]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 187:17]
  wire  _T_681 = stbuf_addr_3[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_682 = _T_681 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_684 = _T_682 & _T_59; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_685 = _T_684 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_674 = stbuf_addr_2[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_675 = _T_674 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_677 = _T_675 & _T_50; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_678 = _T_677 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_667 = stbuf_addr_1[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_668 = _T_667 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_670 = _T_668 & _T_41; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_671 = _T_670 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_660 = stbuf_addr_0[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_661 = _T_660 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_663 = _T_661 & _T_32; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_664 = _T_663 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire [3:0] stbuf_match_hi = {_T_685,_T_678,_T_671,_T_664}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 190:18]
  wire  _T_711 = stbuf_addr_3[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_712 = _T_711 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_714 = _T_712 & _T_59; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_715 = _T_714 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_704 = stbuf_addr_2[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_705 = _T_704 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_707 = _T_705 & _T_50; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_708 = _T_707 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_697 = stbuf_addr_1[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_698 = _T_697 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_700 = _T_698 & _T_41; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_701 = _T_700 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_690 = stbuf_addr_0[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_691 = _T_690 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_693 = _T_691 & _T_32; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_694 = _T_693 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire [3:0] stbuf_match_lo = {_T_715,_T_708,_T_701,_T_694}; // @[Cat.scala 29:58]
  wire  _T_738 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_739 = _T_738 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_740 = _T_739 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_741 = _T_740 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_732 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_733 = _T_732 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_734 = _T_733 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_735 = _T_734 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_726 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_727 = _T_726 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_728 = _T_727 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_729 = _T_728 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_720 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_721 = _T_720 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_722 = _T_721 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_723 = _T_722 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire [3:0] stbuf_dma_kill_en = {_T_741,_T_735,_T_729,_T_723}; // @[Cat.scala 29:58]
  wire  _GEN_1 = stbuf_dma_kill_en[0] | stbuf_dma_kill_0; // @[Reg.scala 28:19]
  wire [15:0] stbuf_addrin_0 = _T_226[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire  _GEN_5 = stbuf_wr_en[1] | stbuf_vld_1; // @[Reg.scala 28:19]
  wire  _GEN_6 = stbuf_dma_kill_en[1] | stbuf_dma_kill_1; // @[Reg.scala 28:19]
  wire [15:0] stbuf_addrin_1 = _T_224[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire  _GEN_10 = stbuf_wr_en[2] | stbuf_vld_2; // @[Reg.scala 28:19]
  wire  _GEN_11 = stbuf_dma_kill_en[2] | stbuf_dma_kill_2; // @[Reg.scala 28:19]
  wire [15:0] stbuf_addrin_2 = _T_222[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire  _GEN_15 = stbuf_wr_en[3] | stbuf_vld_3; // @[Reg.scala 28:19]
  wire  _GEN_16 = stbuf_dma_kill_en[3] | stbuf_dma_kill_3; // @[Reg.scala 28:19]
  wire [15:0] stbuf_addrin_3 = _T_220[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  reg  ldst_dual_m; // @[el2_lsu_stbuf.scala 160:53]
  wire  _GEN_21 = 2'h1 == RdPtr ? stbuf_vld_1 : stbuf_vld_0; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_22 = 2'h2 == RdPtr ? stbuf_vld_2 : _GEN_21; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_23 = 2'h3 == RdPtr ? stbuf_vld_3 : _GEN_22; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_25 = 2'h1 == RdPtr ? stbuf_dma_kill_1 : stbuf_dma_kill_0; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_26 = 2'h2 == RdPtr ? stbuf_dma_kill_2 : _GEN_25; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_27 = 2'h3 == RdPtr ? stbuf_dma_kill_3 : _GEN_26; // @[el2_lsu_stbuf.scala 164:52]
  wire  _T_602 = ~_GEN_27; // @[el2_lsu_stbuf.scala 165:47]
  wire  _T_603 = _GEN_23 & _T_602; // @[el2_lsu_stbuf.scala 165:45]
  wire  _T_604 = |stbuf_dma_kill_en; // @[el2_lsu_stbuf.scala 165:91]
  wire  _T_605 = ~_T_604; // @[el2_lsu_stbuf.scala 165:72]
  wire [15:0] _GEN_29 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[el2_lsu_stbuf.scala 166:23]
  wire [15:0] _GEN_30 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_29; // @[el2_lsu_stbuf.scala 166:23]
  wire [31:0] _GEN_33 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[el2_lsu_stbuf.scala 167:23]
  wire [31:0] _GEN_34 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_33; // @[el2_lsu_stbuf.scala 167:23]
  wire [3:0] _T_622 = {3'h0,stbuf_vld_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_623 = {3'h0,stbuf_vld_1}; // @[Cat.scala 29:58]
  wire [3:0] _T_624 = {3'h0,stbuf_vld_2}; // @[Cat.scala 29:58]
  wire [3:0] _T_625 = {3'h0,stbuf_vld_3}; // @[Cat.scala 29:58]
  wire [3:0] _T_628 = _T_622 + _T_623; // @[el2_lsu_stbuf.scala 175:102]
  wire [3:0] _T_630 = _T_628 + _T_624; // @[el2_lsu_stbuf.scala 175:102]
  wire [3:0] stbuf_numvld_any = _T_630 + _T_625; // @[el2_lsu_stbuf.scala 175:102]
  wire  _T_632 = io_lsu_pkt_m_valid & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 176:40]
  wire  _T_633 = _T_632 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 176:61]
  wire  _T_634 = ~io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 176:83]
  wire  isdccmst_m = _T_633 & _T_634; // @[el2_lsu_stbuf.scala 176:81]
  wire  _T_635 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 177:40]
  wire  _T_636 = _T_635 & io_addr_in_dccm_r; // @[el2_lsu_stbuf.scala 177:61]
  wire  _T_637 = ~io_lsu_pkt_r_dma; // @[el2_lsu_stbuf.scala 177:83]
  wire  isdccmst_r = _T_636 & _T_637; // @[el2_lsu_stbuf.scala 177:81]
  wire [1:0] _T_638 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_639 = isdccmst_m & ldst_dual_m; // @[el2_lsu_stbuf.scala 179:63]
  wire [2:0] _GEN_39 = {{1'd0}, _T_638}; // @[el2_lsu_stbuf.scala 179:48]
  wire [2:0] _T_640 = _GEN_39 << _T_639; // @[el2_lsu_stbuf.scala 179:48]
  wire [1:0] _T_641 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_642 = isdccmst_r & ldst_dual_r; // @[el2_lsu_stbuf.scala 180:63]
  wire [2:0] _GEN_40 = {{1'd0}, _T_641}; // @[el2_lsu_stbuf.scala 180:48]
  wire [2:0] _T_643 = _GEN_40 << _T_642; // @[el2_lsu_stbuf.scala 180:48]
  wire [1:0] stbuf_specvld_m = _T_640[1:0]; // @[el2_lsu_stbuf.scala 179:20]
  wire [3:0] _T_644 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_646 = stbuf_numvld_any + _T_644; // @[el2_lsu_stbuf.scala 181:45]
  wire [1:0] stbuf_specvld_r = _T_643[1:0]; // @[el2_lsu_stbuf.scala 180:20]
  wire [3:0] _T_647 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_646 + _T_647; // @[el2_lsu_stbuf.scala 181:79]
  wire  _T_649 = ~ldst_dual_d; // @[el2_lsu_stbuf.scala 183:35]
  wire  _T_650 = _T_649 & io_dec_lsu_valid_raw_d; // @[el2_lsu_stbuf.scala 183:48]
  wire  _T_652 = stbuf_specvld_any >= 4'h4; // @[el2_lsu_stbuf.scala 183:99]
  wire  _T_653 = stbuf_specvld_any >= 4'h3; // @[el2_lsu_stbuf.scala 183:138]
  wire  _T_747 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_748 = _T_747 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_751 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_752 = _T_751 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_755 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_756 = _T_755 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_759 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_760 = _T_759 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_0 = {_T_760,_T_756,_T_752,_T_748}; // @[Cat.scala 29:58]
  wire  _T_765 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_766 = _T_765 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_769 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_770 = _T_769 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_773 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_774 = _T_773 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_777 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_778 = _T_777 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_1 = {_T_778,_T_774,_T_770,_T_766}; // @[Cat.scala 29:58]
  wire  _T_783 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_784 = _T_783 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_787 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_788 = _T_787 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_791 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_792 = _T_791 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_795 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_796 = _T_795 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_2 = {_T_796,_T_792,_T_788,_T_784}; // @[Cat.scala 29:58]
  wire  _T_801 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_802 = _T_801 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_805 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_806 = _T_805 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_809 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_810 = _T_809 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_813 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_814 = _T_813 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_3 = {_T_814,_T_810,_T_806,_T_802}; // @[Cat.scala 29:58]
  wire  _T_819 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_820 = _T_819 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_823 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_824 = _T_823 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_827 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_828 = _T_827 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_831 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_832 = _T_831 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_0 = {_T_832,_T_828,_T_824,_T_820}; // @[Cat.scala 29:58]
  wire  _T_837 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_838 = _T_837 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_841 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_842 = _T_841 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_845 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_846 = _T_845 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_849 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_850 = _T_849 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_1 = {_T_850,_T_846,_T_842,_T_838}; // @[Cat.scala 29:58]
  wire  _T_855 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_856 = _T_855 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_859 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_860 = _T_859 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_863 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_864 = _T_863 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_867 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_868 = _T_867 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_2 = {_T_868,_T_864,_T_860,_T_856}; // @[Cat.scala 29:58]
  wire  _T_873 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_874 = _T_873 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_877 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_878 = _T_877 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_881 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_882 = _T_881 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_885 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_886 = _T_885 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_3 = {_T_886,_T_882,_T_878,_T_874}; // @[Cat.scala 29:58]
  wire  _T_893 = stbuf_fwdbyteenvec_hi_0[3] | stbuf_fwdbyteenvec_hi_0[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_894 = _T_893 | stbuf_fwdbyteenvec_hi_0[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_894 | stbuf_fwdbyteenvec_hi_0[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_899 = stbuf_fwdbyteenvec_hi_1[3] | stbuf_fwdbyteenvec_hi_1[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_900 = _T_899 | stbuf_fwdbyteenvec_hi_1[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_900 | stbuf_fwdbyteenvec_hi_1[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_905 = stbuf_fwdbyteenvec_hi_2[3] | stbuf_fwdbyteenvec_hi_2[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_906 = _T_905 | stbuf_fwdbyteenvec_hi_2[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_906 | stbuf_fwdbyteenvec_hi_2[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_911 = stbuf_fwdbyteenvec_hi_3[3] | stbuf_fwdbyteenvec_hi_3[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_912 = _T_911 | stbuf_fwdbyteenvec_hi_3[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_912 | stbuf_fwdbyteenvec_hi_3[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_917 = stbuf_fwdbyteenvec_lo_0[3] | stbuf_fwdbyteenvec_lo_0[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_918 = _T_917 | stbuf_fwdbyteenvec_lo_0[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_918 | stbuf_fwdbyteenvec_lo_0[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_923 = stbuf_fwdbyteenvec_lo_1[3] | stbuf_fwdbyteenvec_lo_1[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_924 = _T_923 | stbuf_fwdbyteenvec_lo_1[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_924 | stbuf_fwdbyteenvec_lo_1[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_929 = stbuf_fwdbyteenvec_lo_2[3] | stbuf_fwdbyteenvec_lo_2[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_930 = _T_929 | stbuf_fwdbyteenvec_lo_2[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_930 | stbuf_fwdbyteenvec_lo_2[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_935 = stbuf_fwdbyteenvec_lo_3[3] | stbuf_fwdbyteenvec_lo_3[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_936 = _T_935 | stbuf_fwdbyteenvec_lo_3[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_936 | stbuf_fwdbyteenvec_lo_3[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire [31:0] _T_939 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_940 = _T_939 & stbuf_data_0; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_943 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_944 = _T_943 & stbuf_data_1; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_947 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_948 = _T_947 & stbuf_data_2; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_951 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_952 = _T_951 & stbuf_data_3; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_954 = _T_940 | _T_944; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] _T_955 = _T_954 | _T_948; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_955 | _T_952; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] _T_958 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_959 = _T_958 & stbuf_data_0; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_962 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_963 = _T_962 & stbuf_data_1; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_966 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_967 = _T_966 & stbuf_data_2; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_970 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_971 = _T_970 & stbuf_data_3; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_973 = _T_959 | _T_963; // @[el2_lsu_stbuf.scala 204:123]
  wire [31:0] _T_974 = _T_973 | _T_967; // @[el2_lsu_stbuf.scala 204:123]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_974 | _T_971; // @[el2_lsu_stbuf.scala 204:123]
  wire  _T_979 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 210:50]
  wire  _T_980 = _T_979 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 210:75]
  wire  _T_981 = _T_980 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 210:96]
  wire  ld_addr_rhit_lo_lo = _T_981 & _T_637; // @[el2_lsu_stbuf.scala 210:117]
  wire  _T_985 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 211:50]
  wire  _T_986 = _T_985 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 211:75]
  wire  _T_987 = _T_986 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 211:96]
  wire  ld_addr_rhit_lo_hi = _T_987 & _T_637; // @[el2_lsu_stbuf.scala 211:117]
  wire  _T_991 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 212:50]
  wire  _T_992 = _T_991 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 212:75]
  wire  _T_993 = _T_992 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 212:96]
  wire  _T_995 = _T_993 & _T_637; // @[el2_lsu_stbuf.scala 212:117]
  wire  ld_addr_rhit_hi_lo = _T_995 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_998 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 213:50]
  wire  _T_999 = _T_998 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 213:75]
  wire  _T_1000 = _T_999 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 213:96]
  wire  _T_1002 = _T_1000 & _T_637; // @[el2_lsu_stbuf.scala 213:117]
  wire  ld_addr_rhit_hi_hi = _T_1002 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 213:137]
  wire  _T_1004 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1006 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1008 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1010 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 215:80]
  wire [3:0] _T_1013 = {_T_1010,_T_1008,_T_1006,_T_1004}; // @[Cat.scala 29:58]
  wire  _T_1015 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1017 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1019 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1021 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 216:80]
  wire [3:0] _T_1024 = {_T_1021,_T_1019,_T_1017,_T_1015}; // @[Cat.scala 29:58]
  wire  _T_1026 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1028 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1030 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1032 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 217:80]
  wire [3:0] _T_1035 = {_T_1032,_T_1030,_T_1028,_T_1026}; // @[Cat.scala 29:58]
  wire  _T_1037 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1039 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1041 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1043 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 218:80]
  wire [3:0] _T_1046 = {_T_1043,_T_1041,_T_1039,_T_1037}; // @[Cat.scala 29:58]
  wire [31:0] ld_byte_rhit_hi_lo = {{28'd0}, _T_1035}; // @[el2_lsu_stbuf.scala 217:23]
  wire [31:0] ld_byte_rhit_lo_lo = {{28'd0}, _T_1013}; // @[el2_lsu_stbuf.scala 215:23]
  wire [31:0] _GEN_42 = {{31'd0}, ld_byte_rhit_hi_lo[0]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1048 = ld_byte_rhit_lo_lo | _GEN_42; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_43 = {{31'd0}, ld_byte_rhit_hi_lo[1]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1050 = ld_byte_rhit_lo_lo | _GEN_43; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_44 = {{31'd0}, ld_byte_rhit_hi_lo[2]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1052 = ld_byte_rhit_lo_lo | _GEN_44; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_45 = {{31'd0}, ld_byte_rhit_hi_lo[3]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1054 = ld_byte_rhit_lo_lo | _GEN_45; // @[el2_lsu_stbuf.scala 220:77]
  wire [127:0] _T_1057 = {_T_1054,_T_1052,_T_1050,_T_1048}; // @[Cat.scala 29:58]
  wire [31:0] ld_byte_rhit_hi_hi = {{28'd0}, _T_1046}; // @[el2_lsu_stbuf.scala 218:23]
  wire [31:0] ld_byte_rhit_lo_hi = {{28'd0}, _T_1024}; // @[el2_lsu_stbuf.scala 216:23]
  wire [31:0] _GEN_46 = {{31'd0}, ld_byte_rhit_hi_hi[0]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1059 = ld_byte_rhit_lo_hi | _GEN_46; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_47 = {{31'd0}, ld_byte_rhit_hi_hi[1]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1061 = ld_byte_rhit_lo_hi | _GEN_47; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_48 = {{31'd0}, ld_byte_rhit_hi_hi[2]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1063 = ld_byte_rhit_lo_hi | _GEN_48; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_49 = {{31'd0}, ld_byte_rhit_hi_hi[3]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1065 = ld_byte_rhit_lo_hi | _GEN_49; // @[el2_lsu_stbuf.scala 221:77]
  wire [127:0] _T_1068 = {_T_1065,_T_1063,_T_1061,_T_1059}; // @[Cat.scala 29:58]
  wire [7:0] _T_1071 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1073 = _T_1071 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 223:54]
  wire [7:0] _T_1076 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1078 = _T_1076 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 223:115]
  wire [7:0] fwdpipe1_lo = _T_1073 | _T_1078; // @[el2_lsu_stbuf.scala 223:81]
  wire [7:0] _T_1081 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1083 = _T_1081 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 224:54]
  wire [7:0] _T_1086 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1088 = _T_1086 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 224:116]
  wire [7:0] fwdpipe2_lo = _T_1083 | _T_1088; // @[el2_lsu_stbuf.scala 224:82]
  wire [7:0] _T_1091 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1093 = _T_1091 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 225:54]
  wire [7:0] _T_1096 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1098 = _T_1096 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 225:117]
  wire [7:0] fwdpipe3_lo = _T_1093 | _T_1098; // @[el2_lsu_stbuf.scala 225:83]
  wire [7:0] _T_1101 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1103 = _T_1101 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 226:54]
  wire [7:0] _T_1106 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _GEN_50 = {{16'd0}, _T_1106}; // @[el2_lsu_stbuf.scala 226:117]
  wire [23:0] _T_1108 = _GEN_50 & io_store_data_hi_r[31:8]; // @[el2_lsu_stbuf.scala 226:117]
  wire [23:0] _GEN_51 = {{16'd0}, _T_1103}; // @[el2_lsu_stbuf.scala 226:83]
  wire [23:0] fwdpipe4_lo = _GEN_51 | _T_1108; // @[el2_lsu_stbuf.scala 226:83]
  wire [47:0] _T_1111 = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1114 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1116 = _T_1114 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 229:54]
  wire [7:0] _T_1119 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1121 = _T_1119 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 229:115]
  wire [7:0] fwdpipe1_hi = _T_1116 | _T_1121; // @[el2_lsu_stbuf.scala 229:81]
  wire [7:0] _T_1124 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1126 = _T_1124 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 230:54]
  wire [7:0] _T_1129 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1131 = _T_1129 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 230:116]
  wire [7:0] fwdpipe2_hi = _T_1126 | _T_1131; // @[el2_lsu_stbuf.scala 230:82]
  wire [7:0] _T_1134 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1136 = _T_1134 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 231:54]
  wire [7:0] _T_1139 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1141 = _T_1139 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 231:117]
  wire [7:0] fwdpipe3_hi = _T_1136 | _T_1141; // @[el2_lsu_stbuf.scala 231:83]
  wire [7:0] _T_1144 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1146 = _T_1144 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 232:54]
  wire [7:0] _T_1149 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _GEN_52 = {{16'd0}, _T_1149}; // @[el2_lsu_stbuf.scala 232:117]
  wire [23:0] _T_1151 = _GEN_52 & io_store_data_hi_r[31:8]; // @[el2_lsu_stbuf.scala 232:117]
  wire [23:0] _GEN_53 = {{16'd0}, _T_1146}; // @[el2_lsu_stbuf.scala 232:83]
  wire [23:0] fwdpipe4_hi = _GEN_53 | _T_1151; // @[el2_lsu_stbuf.scala 232:83]
  wire [47:0] _T_1154 = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [2:0] _T_1164 = {stbuf_fwdbyteen_hi_pre_m_3,stbuf_fwdbyteen_hi_pre_m_2,stbuf_fwdbyteen_hi_pre_m_1}; // @[Cat.scala 29:58]
  wire [2:0] _T_1175 = {stbuf_fwdbyteen_lo_pre_m_3,stbuf_fwdbyteen_lo_pre_m_2,stbuf_fwdbyteen_lo_pre_m_1}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = _T_1057[3:0]; // @[el2_lsu_stbuf.scala 220:20]
  wire [31:0] ld_fwddata_rpipe_lo = _T_1111[31:0]; // @[el2_lsu_stbuf.scala 227:24]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[el2_lsu_stbuf.scala 239:31]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[el2_lsu_stbuf.scala 240:31]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[el2_lsu_stbuf.scala 241:31]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[el2_lsu_stbuf.scala 242:31]
  wire [15:0] _T_1189 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1190 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = _T_1068[3:0]; // @[el2_lsu_stbuf.scala 221:20]
  wire [31:0] ld_fwddata_rpipe_hi = _T_1154[31:0]; // @[el2_lsu_stbuf.scala 233:24]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[el2_lsu_stbuf.scala 245:31]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[el2_lsu_stbuf.scala 246:31]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[el2_lsu_stbuf.scala 247:31]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[el2_lsu_stbuf.scala 248:31]
  wire [15:0] _T_1204 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1205 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  assign io_stbuf_reqvld_any = _T_603 & _T_605; // @[el2_lsu_stbuf.scala 50:47 el2_lsu_stbuf.scala 165:25]
  assign io_stbuf_reqvld_flushed_any = _GEN_23 & _GEN_27; // @[el2_lsu_stbuf.scala 51:36 el2_lsu_stbuf.scala 164:32]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_30; // @[el2_lsu_stbuf.scala 52:35 el2_lsu_stbuf.scala 166:23]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_34; // @[el2_lsu_stbuf.scala 53:35 el2_lsu_stbuf.scala 167:23]
  assign io_lsu_stbuf_full_any = _T_650 ? _T_652 : _T_653; // @[el2_lsu_stbuf.scala 54:43 el2_lsu_stbuf.scala 183:27]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[el2_lsu_stbuf.scala 55:43 el2_lsu_stbuf.scala 184:27]
  assign io_ldst_stbuf_reqvld_r = io_lsu_commit_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 56:43 el2_lsu_stbuf.scala 122:27]
  assign io_stbuf_fwddata_hi_m = {_T_1205,_T_1204}; // @[el2_lsu_stbuf.scala 57:43 el2_lsu_stbuf.scala 249:26]
  assign io_stbuf_fwddata_lo_m = {_T_1190,_T_1189}; // @[el2_lsu_stbuf.scala 58:43 el2_lsu_stbuf.scala 243:26]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1164,stbuf_fwdbyteen_hi_pre_m_0}; // @[el2_lsu_stbuf.scala 59:37 el2_lsu_stbuf.scala 235:28]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1175,stbuf_fwdbyteen_lo_pre_m_0}; // @[el2_lsu_stbuf.scala 60:37 el2_lsu_stbuf.scala 236:28]
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
  stbuf_addr_0 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  stbuf_vld_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stbuf_dma_kill_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  stbuf_vld_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stbuf_dma_kill_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  stbuf_vld_2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stbuf_dma_kill_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_vld_3 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_dma_kill_3 = _RAND_13[0:0];
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
  _RAND_22 = {1{`RANDOM}};
  ldst_dual_m = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_r_clk) begin
    if (reset) begin
      ldst_dual_r <= 1'h0;
    end else begin
      ldst_dual_r <= ldst_dual_m;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk) begin
    if (reset) begin
      RdPtr <= 2'h0;
    end else if (_T_184) begin
      RdPtr <= NxtRdPtr;
    end
    if (reset) begin
      stbuf_byteen_0 <= 4'h0;
    end else if (stbuf_wr_en[0]) begin
      if (sel_lo[3]) begin
        stbuf_byteen_0 <= _T_240;
      end else begin
        stbuf_byteen_0 <= _T_241;
      end
    end
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else if (stbuf_wr_en[1]) begin
      if (sel_lo[2]) begin
        stbuf_byteen_1 <= _T_236;
      end else begin
        stbuf_byteen_1 <= _T_237;
      end
    end
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else if (stbuf_wr_en[2]) begin
      if (sel_lo[1]) begin
        stbuf_byteen_2 <= _T_232;
      end else begin
        stbuf_byteen_2 <= _T_233;
      end
    end
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else if (stbuf_wr_en[3]) begin
      if (sel_lo[0]) begin
        stbuf_byteen_3 <= _T_228;
      end else begin
        stbuf_byteen_3 <= _T_229;
      end
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      stbuf_addr_0 <= 16'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_addr_0 <= stbuf_addrin_0;
    end
    if (reset) begin
      stbuf_addr_1 <= 16'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_addr_1 <= stbuf_addrin_1;
    end
    if (reset) begin
      stbuf_addr_2 <= 16'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_addr_2 <= stbuf_addrin_2;
    end
    if (reset) begin
      stbuf_addr_3 <= 16'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_addr_3 <= stbuf_addrin_3;
    end
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_data_0 <= stbuf_datain_0;
    end
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_data_1 <= stbuf_datain_1;
    end
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_data_2 <= stbuf_datain_2;
    end
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_data_3 <= stbuf_datain_3;
    end
  end
  always @(posedge io_lsu_free_c2_clk) begin
    if (reset) begin
      stbuf_vld_0 <= 1'h0;
    end else begin
      stbuf_vld_0 <= _GEN_0;
    end
    if (reset) begin
      stbuf_dma_kill_0 <= 1'h0;
    end else begin
      stbuf_dma_kill_0 <= _GEN_1;
    end
    if (reset) begin
      stbuf_vld_1 <= 1'h0;
    end else begin
      stbuf_vld_1 <= _GEN_5;
    end
    if (reset) begin
      stbuf_dma_kill_1 <= 1'h0;
    end else begin
      stbuf_dma_kill_1 <= _GEN_6;
    end
    if (reset) begin
      stbuf_vld_2 <= 1'h0;
    end else begin
      stbuf_vld_2 <= _GEN_10;
    end
    if (reset) begin
      stbuf_dma_kill_2 <= 1'h0;
    end else begin
      stbuf_dma_kill_2 <= _GEN_11;
    end
    if (reset) begin
      stbuf_vld_3 <= 1'h0;
    end else begin
      stbuf_vld_3 <= _GEN_15;
    end
    if (reset) begin
      stbuf_dma_kill_3 <= 1'h0;
    end else begin
      stbuf_dma_kill_3 <= _GEN_16;
    end
  end
  always @(posedge io_lsu_c1_m_clk) begin
    if (reset) begin
      ldst_dual_m <= 1'h0;
    end else begin
      ldst_dual_m <= ldst_dual_d;
    end
  end
endmodule
