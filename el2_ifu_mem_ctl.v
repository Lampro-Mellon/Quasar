module rvclkhdr(
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 403:26]
  wire  clkhdr_CK; // @[el2_lib.scala 403:26]
  wire  clkhdr_EN; // @[el2_lib.scala 403:26]
  wire  clkhdr_SE; // @[el2_lib.scala 403:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 403:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 405:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 406:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 407:18]
endmodule
module el2_ifu_mem_ctl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_exu_flush_final,
  input         io_dec_tlu_flush_lower_wb,
  input         io_dec_tlu_flush_err_wb,
  input         io_dec_tlu_i0_commit_cmt,
  input         io_dec_tlu_force_halt,
  input  [30:0] io_ifc_fetch_addr_bf,
  input         io_ifc_fetch_uncacheable_bf,
  input         io_ifc_fetch_req_bf,
  input         io_ifc_fetch_req_bf_raw,
  input         io_ifc_iccm_access_bf,
  input         io_ifc_region_acc_fault_bf,
  input         io_ifc_dma_access_ok,
  input         io_dec_tlu_fence_i_wb,
  input         io_ifu_bp_hit_taken_f,
  input         io_ifu_bp_inst_mask_f,
  output        io_ifu_miss_state_idle,
  output        io_ifu_ic_mb_empty,
  output        io_ic_dma_active,
  output        io_ic_write_stall,
  output        io_ifu_pmu_ic_miss,
  output        io_ifu_pmu_ic_hit,
  output        io_ifu_pmu_bus_error,
  output        io_ifu_pmu_bus_busy,
  output        io_ifu_pmu_bus_trxn,
  output        io_ifu_axi_awvalid,
  output [2:0]  io_ifu_axi_awid,
  output [31:0] io_ifu_axi_awaddr,
  output [3:0]  io_ifu_axi_awregion,
  output [7:0]  io_ifu_axi_awlen,
  output [2:0]  io_ifu_axi_awsize,
  output [1:0]  io_ifu_axi_awburst,
  output        io_ifu_axi_awlock,
  output [3:0]  io_ifu_axi_awcache,
  output [2:0]  io_ifu_axi_awprot,
  output [3:0]  io_ifu_axi_awqos,
  output        io_ifu_axi_wvalid,
  output [63:0] io_ifu_axi_wdata,
  output [7:0]  io_ifu_axi_wstrb,
  output        io_ifu_axi_wlast,
  output        io_ifu_axi_bready,
  output        io_ifu_axi_arvalid,
  input         io_ifu_axi_arready,
  output [2:0]  io_ifu_axi_arid,
  output [31:0] io_ifu_axi_araddr,
  output [3:0]  io_ifu_axi_arregion,
  output [7:0]  io_ifu_axi_arlen,
  output [2:0]  io_ifu_axi_arsize,
  output [1:0]  io_ifu_axi_arburst,
  output        io_ifu_axi_arlock,
  output [3:0]  io_ifu_axi_arcache,
  output [2:0]  io_ifu_axi_arprot,
  output [3:0]  io_ifu_axi_arqos,
  input         io_ifu_axi_rvalid,
  output        io_ifu_axi_rready,
  input  [2:0]  io_ifu_axi_rid,
  input  [63:0] io_ifu_axi_rdata,
  input  [1:0]  io_ifu_axi_rresp,
  input         io_ifu_bus_clk_en,
  input         io_dma_iccm_req,
  input  [31:0] io_dma_mem_addr,
  input  [2:0]  io_dma_mem_sz,
  input         io_dma_mem_write,
  input  [63:0] io_dma_mem_wdata,
  input  [2:0]  io_dma_mem_tag,
  output        io_iccm_dma_ecc_error,
  output        io_iccm_dma_rvalid,
  output [63:0] io_iccm_dma_rdata,
  output [2:0]  io_iccm_dma_rtag,
  output        io_iccm_ready,
  output [30:0] io_ic_rw_addr,
  output [1:0]  io_ic_wr_en,
  output        io_ic_rd_en,
  output [70:0] io_ic_wr_data_0,
  output [70:0] io_ic_wr_data_1,
  input  [63:0] io_ic_rd_data,
  input  [70:0] io_ic_debug_rd_data,
  input  [25:0] io_ictag_debug_rd_data,
  output [70:0] io_ic_debug_wr_data,
  output [70:0] io_ifu_ic_debug_rd_data,
  input  [1:0]  io_ic_eccerr,
  input  [1:0]  io_ic_parerr,
  output [9:0]  io_ic_debug_addr,
  output        io_ic_debug_rd_en,
  output        io_ic_debug_wr_en,
  output        io_ic_debug_tag_array,
  output [1:0]  io_ic_debug_way,
  output [1:0]  io_ic_tag_valid,
  input  [1:0]  io_ic_rd_hit,
  input         io_ic_tag_perr,
  output [14:0] io_iccm_rw_addr,
  output        io_iccm_wren,
  output        io_iccm_rden,
  output [77:0] io_iccm_wr_data,
  output [2:0]  io_iccm_wr_size,
  input  [63:0] io_iccm_rd_data,
  input  [77:0] io_iccm_rd_data_ecc,
  input  [1:0]  io_ifu_fetch_val,
  output        io_ic_hit_f,
  output        io_ic_access_fault_f,
  output [1:0]  io_ic_access_fault_type_f,
  output        io_iccm_rd_ecc_single_err,
  output        io_iccm_rd_ecc_double_err,
  output        io_ic_error_start,
  output        io_ifu_async_error_start,
  output        io_iccm_dma_sb_error,
  output [1:0]  io_ic_fetch_val_f,
  output [31:0] io_ic_data_f,
  output [63:0] io_ic_premux_data,
  output        io_ic_sel_premux_data,
  input  [70:0] io_dec_tlu_ic_diag_pkt_icache_wrdata,
  input  [16:0] io_dec_tlu_ic_diag_pkt_icache_dicawics,
  input         io_dec_tlu_ic_diag_pkt_icache_rd_valid,
  input         io_dec_tlu_ic_diag_pkt_icache_wr_valid,
  input         io_dec_tlu_core_ecc_disable,
  output        io_ifu_ic_debug_rd_data_valid,
  output        io_iccm_buf_correct_ecc,
  output        io_iccm_correction_state,
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
  reg [95:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 412:22]
  reg  flush_final_f; // @[el2_ifu_mem_ctl.scala 234:30]
  reg  ifc_fetch_req_f_raw; // @[el2_ifu_mem_ctl.scala 367:36]
  wire  _T_308 = ~io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 368:44]
  wire  ifc_fetch_req_f = ifc_fetch_req_f_raw & _T_308; // @[el2_ifu_mem_ctl.scala 368:42]
  wire  _T = io_ifc_fetch_req_bf_raw | ifc_fetch_req_f; // @[el2_ifu_mem_ctl.scala 235:53]
  reg [2:0] miss_state; // @[Reg.scala 27:20]
  wire  miss_pending = miss_state != 3'h0; // @[el2_ifu_mem_ctl.scala 300:30]
  wire  _T_1 = _T | miss_pending; // @[el2_ifu_mem_ctl.scala 235:71]
  wire  _T_26 = 3'h0 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_219 = |io_ic_rd_hit; // @[el2_ifu_mem_ctl.scala 330:37]
  wire  _T_220 = ~_T_219; // @[el2_ifu_mem_ctl.scala 330:23]
  reg  ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 369:31]
  wire  _T_199 = ~ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 321:48]
  wire  fetch_req_icache_f = ifc_fetch_req_f & _T_199; // @[el2_ifu_mem_ctl.scala 321:46]
  wire  _T_222 = _T_220 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 330:59]
  wire  _T_223 = ~miss_pending; // @[el2_ifu_mem_ctl.scala 330:82]
  wire  ic_act_miss_f = _T_222 & _T_223; // @[el2_ifu_mem_ctl.scala 330:80]
  wire  _T_28 = ic_act_miss_f & _T_308; // @[el2_ifu_mem_ctl.scala 249:43]
  wire [2:0] _T_30 = _T_28 ? 3'h1 : 3'h2; // @[el2_ifu_mem_ctl.scala 249:27]
  wire  _T_33 = 3'h1 == miss_state; // @[Conditional.scala 37:30]
  reg  uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 357:33]
  wire  _T_52 = ~uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 255:51]
  wire  ifu_bp_hit_taken_q_f = io_ifu_bp_hit_taken_f & io_ic_hit_f; // @[el2_ifu_mem_ctl.scala 245:52]
  wire  _T_74 = io_exu_flush_final | ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 258:44]
  wire [2:0] _T_79 = _T_74 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 258:22]
  wire [2:0] _T_85 = io_dec_tlu_force_halt ? 3'h0 : _T_79; // @[el2_ifu_mem_ctl.scala 252:27]
  wire  _T_94 = 3'h4 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_98 = 3'h6 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_104 = ~io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 266:124]
  wire  _T_105 = _T_74 & _T_104; // @[el2_ifu_mem_ctl.scala 266:122]
  wire [2:0] _T_107 = _T_105 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 266:27]
  wire  _T_113 = 3'h3 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_118 = io_exu_flush_final & _T_104; // @[el2_ifu_mem_ctl.scala 270:82]
  wire [2:0] _T_120 = _T_118 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 270:27]
  wire  _T_124 = 3'h2 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_228 = io_ic_rd_hit == 2'h0; // @[el2_ifu_mem_ctl.scala 331:28]
  wire  _T_230 = _T_228 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 331:60]
  wire  _T_231 = miss_state == 3'h2; // @[el2_ifu_mem_ctl.scala 331:94]
  wire  _T_232 = _T_230 & _T_231; // @[el2_ifu_mem_ctl.scala 331:81]
  reg [30:0] imb_ff; // @[el2_ifu_mem_ctl.scala 358:20]
  reg [30:0] ifu_fetch_addr_int_f; // @[el2_ifu_mem_ctl.scala 355:34]
  wire  _T_235 = imb_ff[30:5] != ifu_fetch_addr_int_f[30:5]; // @[el2_ifu_mem_ctl.scala 332:39]
  wire  _T_236 = _T_232 & _T_235; // @[el2_ifu_mem_ctl.scala 331:111]
  wire  ic_miss_under_miss_f = _T_236 & _T_52; // @[el2_ifu_mem_ctl.scala 332:91]
  wire  _T_129 = ic_miss_under_miss_f & _T_104; // @[el2_ifu_mem_ctl.scala 274:84]
  wire  _T_248 = _T_222 & _T_231; // @[el2_ifu_mem_ctl.scala 333:85]
  wire  _T_251 = imb_ff[30:5] == ifu_fetch_addr_int_f[30:5]; // @[el2_ifu_mem_ctl.scala 334:39]
  wire  _T_252 = _T_251 | uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 334:91]
  wire  ic_ignore_2nd_miss_f = _T_248 & _T_252; // @[el2_ifu_mem_ctl.scala 333:117]
  wire  _T_135 = ic_ignore_2nd_miss_f & _T_104; // @[el2_ifu_mem_ctl.scala 275:69]
  wire [2:0] _T_137 = _T_135 ? 3'h7 : 3'h0; // @[el2_ifu_mem_ctl.scala 275:12]
  wire [2:0] _T_138 = _T_129 ? 3'h5 : _T_137; // @[el2_ifu_mem_ctl.scala 274:27]
  wire  _T_143 = 3'h5 == miss_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_147 = io_exu_flush_final ? 3'h2 : 3'h1; // @[el2_ifu_mem_ctl.scala 279:62]
  wire [2:0] _T_148 = io_dec_tlu_force_halt ? 3'h0 : _T_147; // @[el2_ifu_mem_ctl.scala 279:27]
  wire  _T_152 = 3'h7 == miss_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_156 = io_exu_flush_final ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 284:62]
  wire [2:0] _T_157 = io_dec_tlu_force_halt ? 3'h0 : _T_156; // @[el2_ifu_mem_ctl.scala 284:27]
  wire [2:0] _GEN_0 = _T_152 ? _T_157 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2 = _T_143 ? _T_148 : _GEN_0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_4 = _T_124 ? _T_138 : _GEN_2; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_6 = _T_113 ? _T_120 : _GEN_4; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_8 = _T_98 ? _T_107 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_10 = _T_94 ? 3'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_12 = _T_33 ? _T_85 : _GEN_10; // @[Conditional.scala 39:67]
  wire [2:0] miss_nxtstate = _T_26 ? _T_30 : _GEN_12; // @[Conditional.scala 40:58]
  wire  _T_32 = ic_act_miss_f & _T_104; // @[el2_ifu_mem_ctl.scala 250:38]
  wire  _T_86 = io_dec_tlu_force_halt | io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 259:46]
  wire  _T_88 = _T_86 | ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 259:82]
  wire  _T_95 = io_exu_flush_final | flush_final_f; // @[el2_ifu_mem_ctl.scala 263:43]
  wire  _T_97 = _T_95 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 263:74]
  wire  _T_112 = _T_74 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 267:118]
  wire  _T_123 = io_exu_flush_final | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 271:76]
  wire  _T_141 = ic_miss_under_miss_f | ic_ignore_2nd_miss_f; // @[el2_ifu_mem_ctl.scala 276:78]
  wire  _T_142 = _T_141 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 276:101]
  wire  _GEN_1 = _T_152 & _T_123; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_143 ? _T_123 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_124 ? _T_142 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_113 ? _T_123 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_98 ? _T_112 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_94 ? _T_97 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_33 ? _T_88 : _GEN_11; // @[Conditional.scala 39:67]
  wire  miss_state_en = _T_26 ? _T_32 : _GEN_13; // @[Conditional.scala 40:58]
  wire  _T_165 = miss_state == 3'h4; // @[el2_ifu_mem_ctl.scala 301:73]
  wire  _T_172 = _T_165 & io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 302:106]
  wire  _T_173 = ~_T_172; // @[el2_ifu_mem_ctl.scala 302:72]
  wire  _T_174 = miss_pending & _T_173; // @[el2_ifu_mem_ctl.scala 302:70]
  wire  _T_179 = _T_174 | ic_act_miss_f; // @[el2_ifu_mem_ctl.scala 303:77]
  wire  _T_180 = miss_nxtstate == 3'h4; // @[el2_ifu_mem_ctl.scala 304:36]
  wire  _T_181 = miss_pending & _T_180; // @[el2_ifu_mem_ctl.scala 304:19]
  wire  sel_hold_imb = _T_179 | _T_181; // @[el2_ifu_mem_ctl.scala 303:93]
  wire  fetch_req_iccm_f = ifc_fetch_req_f & ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 322:46]
  wire  _T_204 = _T_223 | _T_231; // @[el2_ifu_mem_ctl.scala 323:59]
  wire  _T_205 = miss_state == 3'h6; // @[el2_ifu_mem_ctl.scala 323:105]
  wire  _T_206 = _T_204 | _T_205; // @[el2_ifu_mem_ctl.scala 323:91]
  wire  ic_iccm_hit_f = fetch_req_iccm_f & _T_206; // @[el2_ifu_mem_ctl.scala 323:41]
  wire  _T_211 = _T_219 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 329:39]
  wire  ic_act_hit_f = _T_211 & _T_204; // @[el2_ifu_mem_ctl.scala 329:78]
  wire  _T_304 = _T_165 & flush_final_f; // @[el2_ifu_mem_ctl.scala 366:87]
  wire  _T_305 = ~_T_304; // @[el2_ifu_mem_ctl.scala 366:55]
  wire  ifc_fetch_req_qual_bf = io_ifc_fetch_req_bf & _T_305; // @[el2_ifu_mem_ctl.scala 366:53]
  reg  ifc_region_acc_fault_f; // @[el2_ifu_mem_ctl.scala 372:39]
  wire  _T_1179 = |io_ic_eccerr; // @[el2_ifu_mem_ctl.scala 391:56]
  reg [70:0] _T_1192; // @[el2_ifu_mem_ctl.scala 397:37]
  wire [1:0] _T_1256 = ifc_region_acc_fault_f ? 2'h2 : 2'h0; // @[el2_ifu_mem_ctl.scala 429:8]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_ifu_miss_state_idle = 1'h0; // @[el2_ifu_mem_ctl.scala 131:25]
  assign io_ifu_ic_mb_empty = 1'h0; // @[el2_ifu_mem_ctl.scala 132:21]
  assign io_ic_dma_active = io_dec_tlu_flush_err_wb; // @[el2_ifu_mem_ctl.scala 133:19 el2_ifu_mem_ctl.scala 241:20]
  assign io_ic_write_stall = 1'h0; // @[el2_ifu_mem_ctl.scala 134:20]
  assign io_ifu_pmu_ic_miss = 1'h0; // @[el2_ifu_mem_ctl.scala 135:21]
  assign io_ifu_pmu_ic_hit = 1'h0; // @[el2_ifu_mem_ctl.scala 136:20]
  assign io_ifu_pmu_bus_error = 1'h0; // @[el2_ifu_mem_ctl.scala 137:23]
  assign io_ifu_pmu_bus_busy = 1'h0; // @[el2_ifu_mem_ctl.scala 138:22]
  assign io_ifu_pmu_bus_trxn = 1'h0; // @[el2_ifu_mem_ctl.scala 139:22]
  assign io_ifu_axi_awvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 140:21]
  assign io_ifu_axi_awid = 3'h0; // @[el2_ifu_mem_ctl.scala 141:18]
  assign io_ifu_axi_awaddr = 32'h0; // @[el2_ifu_mem_ctl.scala 142:20]
  assign io_ifu_axi_awregion = 4'h0; // @[el2_ifu_mem_ctl.scala 201:22]
  assign io_ifu_axi_awlen = 8'h0; // @[el2_ifu_mem_ctl.scala 143:19]
  assign io_ifu_axi_awsize = 3'h0; // @[el2_ifu_mem_ctl.scala 144:20]
  assign io_ifu_axi_awburst = 2'h0; // @[el2_ifu_mem_ctl.scala 145:21]
  assign io_ifu_axi_awlock = 1'h0; // @[el2_ifu_mem_ctl.scala 146:20]
  assign io_ifu_axi_awcache = 4'h0; // @[el2_ifu_mem_ctl.scala 147:21]
  assign io_ifu_axi_awprot = 3'h0; // @[el2_ifu_mem_ctl.scala 148:20]
  assign io_ifu_axi_awqos = 4'h0; // @[el2_ifu_mem_ctl.scala 149:19]
  assign io_ifu_axi_wvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 150:20]
  assign io_ifu_axi_wdata = 64'h0; // @[el2_ifu_mem_ctl.scala 151:19]
  assign io_ifu_axi_wstrb = 8'h0; // @[el2_ifu_mem_ctl.scala 152:19]
  assign io_ifu_axi_wlast = 1'h0; // @[el2_ifu_mem_ctl.scala 153:19]
  assign io_ifu_axi_bready = 1'h0; // @[el2_ifu_mem_ctl.scala 154:20]
  assign io_ifu_axi_arvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 155:21]
  assign io_ifu_axi_arid = 3'h0; // @[el2_ifu_mem_ctl.scala 157:18]
  assign io_ifu_axi_araddr = 32'h0; // @[el2_ifu_mem_ctl.scala 158:20]
  assign io_ifu_axi_arregion = 4'h0; // @[el2_ifu_mem_ctl.scala 159:22]
  assign io_ifu_axi_arlen = 8'h0; // @[el2_ifu_mem_ctl.scala 160:19]
  assign io_ifu_axi_arsize = 3'h0; // @[el2_ifu_mem_ctl.scala 161:20]
  assign io_ifu_axi_arburst = 2'h0; // @[el2_ifu_mem_ctl.scala 162:21]
  assign io_ifu_axi_arlock = 1'h0; // @[el2_ifu_mem_ctl.scala 163:20]
  assign io_ifu_axi_arcache = 4'h0; // @[el2_ifu_mem_ctl.scala 164:21]
  assign io_ifu_axi_arprot = 3'h0; // @[el2_ifu_mem_ctl.scala 165:20]
  assign io_ifu_axi_arqos = 4'h0; // @[el2_ifu_mem_ctl.scala 166:19]
  assign io_ifu_axi_rready = 1'h0; // @[el2_ifu_mem_ctl.scala 167:20]
  assign io_iccm_dma_ecc_error = 1'h0; // @[el2_ifu_mem_ctl.scala 168:24]
  assign io_iccm_dma_rvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 169:21]
  assign io_iccm_dma_rdata = 64'h0; // @[el2_ifu_mem_ctl.scala 170:20]
  assign io_iccm_dma_rtag = 3'h0; // @[el2_ifu_mem_ctl.scala 171:19]
  assign io_iccm_ready = 1'h0; // @[el2_ifu_mem_ctl.scala 172:16]
  assign io_ic_rw_addr = 31'h0; // @[el2_ifu_mem_ctl.scala 173:16]
  assign io_ic_wr_en = 2'h0; // @[el2_ifu_mem_ctl.scala 174:14]
  assign io_ic_rd_en = 1'h0; // @[el2_ifu_mem_ctl.scala 175:14]
  assign io_ic_wr_data_0 = 71'h0; // @[el2_ifu_mem_ctl.scala 176:16 el2_ifu_mem_ctl.scala 388:17]
  assign io_ic_wr_data_1 = 71'h0; // @[el2_ifu_mem_ctl.scala 176:16 el2_ifu_mem_ctl.scala 388:17]
  assign io_ic_debug_wr_data = io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_ifu_mem_ctl.scala 177:22 el2_ifu_mem_ctl.scala 389:23]
  assign io_ifu_ic_debug_rd_data = _T_1192; // @[el2_ifu_mem_ctl.scala 178:26 el2_ifu_mem_ctl.scala 397:27]
  assign io_ic_debug_addr = 10'h0; // @[el2_ifu_mem_ctl.scala 156:19]
  assign io_ic_debug_rd_en = 1'h0; // @[el2_ifu_mem_ctl.scala 128:20]
  assign io_ic_debug_wr_en = 1'h0; // @[el2_ifu_mem_ctl.scala 129:20]
  assign io_ic_debug_tag_array = 1'h0; // @[el2_ifu_mem_ctl.scala 130:24]
  assign io_ic_debug_way = 2'h0; // @[el2_ifu_mem_ctl.scala 200:18]
  assign io_ic_tag_valid = 2'h0; // @[el2_ifu_mem_ctl.scala 179:18]
  assign io_iccm_rw_addr = 15'h0; // @[el2_ifu_mem_ctl.scala 180:18]
  assign io_iccm_wren = 1'h0; // @[el2_ifu_mem_ctl.scala 181:15]
  assign io_iccm_rden = 1'h0; // @[el2_ifu_mem_ctl.scala 182:15]
  assign io_iccm_wr_data = 78'h0; // @[el2_ifu_mem_ctl.scala 183:18]
  assign io_iccm_wr_size = 3'h0; // @[el2_ifu_mem_ctl.scala 184:18]
  assign io_ic_hit_f = ic_act_hit_f | ic_iccm_hit_f; // @[el2_ifu_mem_ctl.scala 185:14 el2_ifu_mem_ctl.scala 336:15]
  assign io_ic_access_fault_f = 1'h0; // @[el2_ifu_mem_ctl.scala 186:23 el2_ifu_mem_ctl.scala 427:24]
  assign io_ic_access_fault_type_f = io_iccm_rd_ecc_double_err ? 2'h1 : _T_1256; // @[el2_ifu_mem_ctl.scala 187:28 el2_ifu_mem_ctl.scala 428:29]
  assign io_iccm_rd_ecc_single_err = 1'h0; // @[el2_ifu_mem_ctl.scala 188:28]
  assign io_iccm_rd_ecc_double_err = 1'h0; // @[el2_ifu_mem_ctl.scala 189:28]
  assign io_ic_error_start = _T_1179 & ic_act_hit_f; // @[el2_ifu_mem_ctl.scala 190:20 el2_ifu_mem_ctl.scala 391:21]
  assign io_ifu_async_error_start = io_iccm_rd_ecc_single_err | io_ic_error_start; // @[el2_ifu_mem_ctl.scala 191:27 el2_ifu_mem_ctl.scala 240:28]
  assign io_iccm_dma_sb_error = 1'h0; // @[el2_ifu_mem_ctl.scala 192:23 el2_ifu_mem_ctl.scala 239:24]
  assign io_ic_fetch_val_f = 2'h0; // @[el2_ifu_mem_ctl.scala 193:20]
  assign io_ic_data_f = 32'h0; // @[el2_ifu_mem_ctl.scala 194:15]
  assign io_ic_premux_data = 64'h0; // @[el2_ifu_mem_ctl.scala 195:20]
  assign io_ic_sel_premux_data = 1'h0; // @[el2_ifu_mem_ctl.scala 196:24]
  assign io_ifu_ic_debug_rd_data_valid = 1'h0; // @[el2_ifu_mem_ctl.scala 197:32]
  assign io_iccm_buf_correct_ecc = 1'h0; // @[el2_ifu_mem_ctl.scala 198:26]
  assign io_iccm_correction_state = 1'h0; // @[el2_ifu_mem_ctl.scala 199:27]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_io_en = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_lib.scala 414:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_1_io_en = _T_1 | io_exu_flush_final; // @[el2_lib.scala 414:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
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
  flush_final_f = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ifc_fetch_req_f_raw = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  miss_state = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  ifc_iccm_access_f = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  uncacheable_miss_ff = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  imb_ff = _RAND_5[30:0];
  _RAND_6 = {1{`RANDOM}};
  ifu_fetch_addr_int_f = _RAND_6[30:0];
  _RAND_7 = {1{`RANDOM}};
  ifc_region_acc_fault_f = _RAND_7[0:0];
  _RAND_8 = {3{`RANDOM}};
  _T_1192 = _RAND_8[70:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      flush_final_f <= 1'h0;
    end else begin
      flush_final_f <= io_exu_flush_final;
    end
    if (reset) begin
      ifc_fetch_req_f_raw <= 1'h0;
    end else begin
      ifc_fetch_req_f_raw <= ifc_fetch_req_qual_bf;
    end
    if (reset) begin
      miss_state <= 3'h0;
    end else if (miss_state_en) begin
      if (_T_26) begin
        if (_T_28) begin
          miss_state <= 3'h1;
        end else begin
          miss_state <= 3'h2;
        end
      end else if (_T_33) begin
        if (io_dec_tlu_force_halt) begin
          miss_state <= 3'h0;
        end else if (_T_74) begin
          miss_state <= 3'h2;
        end else begin
          miss_state <= 3'h0;
        end
      end else if (_T_94) begin
        miss_state <= 3'h0;
      end else if (_T_98) begin
        if (_T_105) begin
          miss_state <= 3'h2;
        end else begin
          miss_state <= 3'h0;
        end
      end else if (_T_113) begin
        if (_T_118) begin
          miss_state <= 3'h2;
        end else begin
          miss_state <= 3'h0;
        end
      end else if (_T_124) begin
        if (_T_129) begin
          miss_state <= 3'h5;
        end else if (_T_135) begin
          miss_state <= 3'h7;
        end else begin
          miss_state <= 3'h0;
        end
      end else if (_T_143) begin
        if (io_dec_tlu_force_halt) begin
          miss_state <= 3'h0;
        end else if (io_exu_flush_final) begin
          miss_state <= 3'h2;
        end else begin
          miss_state <= 3'h1;
        end
      end else if (_T_152) begin
        if (io_dec_tlu_force_halt) begin
          miss_state <= 3'h0;
        end else if (io_exu_flush_final) begin
          miss_state <= 3'h2;
        end else begin
          miss_state <= 3'h0;
        end
      end else begin
        miss_state <= 3'h0;
      end
    end
    if (reset) begin
      ifc_iccm_access_f <= 1'h0;
    end else begin
      ifc_iccm_access_f <= io_ifc_iccm_access_bf;
    end
    if (reset) begin
      uncacheable_miss_ff <= 1'h0;
    end else if (!(sel_hold_imb)) begin
      uncacheable_miss_ff <= io_ifc_fetch_uncacheable_bf;
    end
    if (!(sel_hold_imb)) begin
      imb_ff <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      ifu_fetch_addr_int_f <= 31'h0;
    end else begin
      ifu_fetch_addr_int_f <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      ifc_region_acc_fault_f <= 1'h0;
    end else begin
      ifc_region_acc_fault_f <= io_ifc_region_acc_fault_bf;
    end
    if (reset) begin
      _T_1192 <= 71'h0;
    end else begin
      _T_1192 <= io_ic_debug_rd_data;
    end
  end
endmodule
