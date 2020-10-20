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
  output        io_test,
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
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [95:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_12_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_12_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_12_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_13_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_13_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_13_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_14_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_14_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_14_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_15_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_15_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_15_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_16_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_16_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_16_io_scan_mode; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_17_io_clk; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_17_io_en; // @[el2_lib.scala 412:22]
  wire  rvclkhdr_17_io_scan_mode; // @[el2_lib.scala 412:22]
  reg  flush_final_f; // @[el2_ifu_mem_ctl.scala 234:30]
  reg  ifc_fetch_req_f_raw; // @[el2_ifu_mem_ctl.scala 367:36]
  wire  _T_308 = ~io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 368:44]
  wire  ifc_fetch_req_f = ifc_fetch_req_f_raw & _T_308; // @[el2_ifu_mem_ctl.scala 368:42]
  wire  _T = io_ifc_fetch_req_bf_raw | ifc_fetch_req_f; // @[el2_ifu_mem_ctl.scala 235:53]
  reg [2:0] miss_state; // @[Reg.scala 27:20]
  wire  miss_pending = miss_state != 3'h0; // @[el2_ifu_mem_ctl.scala 300:30]
  wire  _T_1 = _T | miss_pending; // @[el2_ifu_mem_ctl.scala 235:71]
  wire  debug_c1_clken = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_ifu_mem_ctl.scala 236:42]
  wire [3:0] ic_fetch_val_int_f = {2'h0,io_ic_fetch_val_f}; // @[Cat.scala 29:58]
  reg [30:0] ifu_fetch_addr_int_f; // @[el2_ifu_mem_ctl.scala 355:34]
  wire [4:0] _GEN_204 = {{1'd0}, ic_fetch_val_int_f}; // @[el2_ifu_mem_ctl.scala 705:53]
  wire [4:0] ic_fetch_val_shift_right = _GEN_204 << ifu_fetch_addr_int_f[0]; // @[el2_ifu_mem_ctl.scala 705:53]
  wire [1:0] _GEN_205 = {{1'd0}, _T_308}; // @[el2_ifu_mem_ctl.scala 708:91]
  wire [1:0] _T_3058 = ic_fetch_val_shift_right[3:2] & _GEN_205; // @[el2_ifu_mem_ctl.scala 708:91]
  reg  ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 369:31]
  wire  fetch_req_iccm_f = ifc_fetch_req_f & ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 322:46]
  wire [1:0] _GEN_206 = {{1'd0}, fetch_req_iccm_f}; // @[el2_ifu_mem_ctl.scala 708:113]
  wire [1:0] _T_3059 = _T_3058 & _GEN_206; // @[el2_ifu_mem_ctl.scala 708:113]
  reg  iccm_dma_rvalid_in; // @[el2_ifu_mem_ctl.scala 694:59]
  wire [1:0] _GEN_207 = {{1'd0}, iccm_dma_rvalid_in}; // @[el2_ifu_mem_ctl.scala 708:130]
  wire [1:0] _T_3060 = _T_3059 | _GEN_207; // @[el2_ifu_mem_ctl.scala 708:130]
  wire  _T_3061 = ~io_dec_tlu_core_ecc_disable; // @[el2_ifu_mem_ctl.scala 708:154]
  wire [1:0] _GEN_208 = {{1'd0}, _T_3061}; // @[el2_ifu_mem_ctl.scala 708:152]
  wire [1:0] _T_3062 = _T_3060 & _GEN_208; // @[el2_ifu_mem_ctl.scala 708:152]
  wire [1:0] _T_3051 = ic_fetch_val_shift_right[1:0] & _GEN_205; // @[el2_ifu_mem_ctl.scala 708:91]
  wire [1:0] _T_3052 = _T_3051 & _GEN_206; // @[el2_ifu_mem_ctl.scala 708:113]
  wire [1:0] _T_3053 = _T_3052 | _GEN_207; // @[el2_ifu_mem_ctl.scala 708:130]
  wire [1:0] _T_3055 = _T_3053 & _GEN_208; // @[el2_ifu_mem_ctl.scala 708:152]
  wire [3:0] iccm_ecc_word_enable = {_T_3062,_T_3055}; // @[Cat.scala 29:58]
  wire  _T_3162 = ^io_iccm_rd_data_ecc[31:0]; // @[el2_lib.scala 296:30]
  wire  _T_3163 = ^io_iccm_rd_data_ecc[38:32]; // @[el2_lib.scala 296:44]
  wire  _T_3164 = _T_3162 ^ _T_3163; // @[el2_lib.scala 296:35]
  wire [5:0] _T_3172 = {io_iccm_rd_data_ecc[31],io_iccm_rd_data_ecc[30],io_iccm_rd_data_ecc[29],io_iccm_rd_data_ecc[28],io_iccm_rd_data_ecc[27],io_iccm_rd_data_ecc[26]}; // @[el2_lib.scala 296:76]
  wire  _T_3173 = ^_T_3172; // @[el2_lib.scala 296:83]
  wire  _T_3174 = io_iccm_rd_data_ecc[37] ^ _T_3173; // @[el2_lib.scala 296:71]
  wire [6:0] _T_3181 = {io_iccm_rd_data_ecc[17],io_iccm_rd_data_ecc[16],io_iccm_rd_data_ecc[15],io_iccm_rd_data_ecc[14],io_iccm_rd_data_ecc[13],io_iccm_rd_data_ecc[12],io_iccm_rd_data_ecc[11]}; // @[el2_lib.scala 296:103]
  wire [14:0] _T_3189 = {io_iccm_rd_data_ecc[25],io_iccm_rd_data_ecc[24],io_iccm_rd_data_ecc[23],io_iccm_rd_data_ecc[22],io_iccm_rd_data_ecc[21],io_iccm_rd_data_ecc[20],io_iccm_rd_data_ecc[19],io_iccm_rd_data_ecc[18],_T_3181}; // @[el2_lib.scala 296:103]
  wire  _T_3190 = ^_T_3189; // @[el2_lib.scala 296:110]
  wire  _T_3191 = io_iccm_rd_data_ecc[36] ^ _T_3190; // @[el2_lib.scala 296:98]
  wire [6:0] _T_3198 = {io_iccm_rd_data_ecc[10],io_iccm_rd_data_ecc[9],io_iccm_rd_data_ecc[8],io_iccm_rd_data_ecc[7],io_iccm_rd_data_ecc[6],io_iccm_rd_data_ecc[5],io_iccm_rd_data_ecc[4]}; // @[el2_lib.scala 296:130]
  wire [14:0] _T_3206 = {io_iccm_rd_data_ecc[25],io_iccm_rd_data_ecc[24],io_iccm_rd_data_ecc[23],io_iccm_rd_data_ecc[22],io_iccm_rd_data_ecc[21],io_iccm_rd_data_ecc[20],io_iccm_rd_data_ecc[19],io_iccm_rd_data_ecc[18],_T_3198}; // @[el2_lib.scala 296:130]
  wire  _T_3207 = ^_T_3206; // @[el2_lib.scala 296:137]
  wire  _T_3208 = io_iccm_rd_data_ecc[35] ^ _T_3207; // @[el2_lib.scala 296:125]
  wire [8:0] _T_3217 = {io_iccm_rd_data_ecc[15],io_iccm_rd_data_ecc[14],io_iccm_rd_data_ecc[10],io_iccm_rd_data_ecc[9],io_iccm_rd_data_ecc[8],io_iccm_rd_data_ecc[7],io_iccm_rd_data_ecc[3],io_iccm_rd_data_ecc[2],io_iccm_rd_data_ecc[1]}; // @[el2_lib.scala 296:157]
  wire [17:0] _T_3226 = {io_iccm_rd_data_ecc[31],io_iccm_rd_data_ecc[30],io_iccm_rd_data_ecc[29],io_iccm_rd_data_ecc[25],io_iccm_rd_data_ecc[24],io_iccm_rd_data_ecc[23],io_iccm_rd_data_ecc[22],io_iccm_rd_data_ecc[17],io_iccm_rd_data_ecc[16],_T_3217}; // @[el2_lib.scala 296:157]
  wire  _T_3227 = ^_T_3226; // @[el2_lib.scala 296:164]
  wire  _T_3228 = io_iccm_rd_data_ecc[34] ^ _T_3227; // @[el2_lib.scala 296:152]
  wire [8:0] _T_3237 = {io_iccm_rd_data_ecc[13],io_iccm_rd_data_ecc[12],io_iccm_rd_data_ecc[10],io_iccm_rd_data_ecc[9],io_iccm_rd_data_ecc[6],io_iccm_rd_data_ecc[5],io_iccm_rd_data_ecc[3],io_iccm_rd_data_ecc[2],io_iccm_rd_data_ecc[0]}; // @[el2_lib.scala 296:184]
  wire [17:0] _T_3246 = {io_iccm_rd_data_ecc[31],io_iccm_rd_data_ecc[28],io_iccm_rd_data_ecc[27],io_iccm_rd_data_ecc[25],io_iccm_rd_data_ecc[24],io_iccm_rd_data_ecc[21],io_iccm_rd_data_ecc[20],io_iccm_rd_data_ecc[17],io_iccm_rd_data_ecc[16],_T_3237}; // @[el2_lib.scala 296:184]
  wire  _T_3247 = ^_T_3246; // @[el2_lib.scala 296:191]
  wire  _T_3248 = io_iccm_rd_data_ecc[33] ^ _T_3247; // @[el2_lib.scala 296:179]
  wire [8:0] _T_3257 = {io_iccm_rd_data_ecc[13],io_iccm_rd_data_ecc[11],io_iccm_rd_data_ecc[10],io_iccm_rd_data_ecc[8],io_iccm_rd_data_ecc[6],io_iccm_rd_data_ecc[4],io_iccm_rd_data_ecc[3],io_iccm_rd_data_ecc[1],io_iccm_rd_data_ecc[0]}; // @[el2_lib.scala 296:211]
  wire [17:0] _T_3266 = {io_iccm_rd_data_ecc[30],io_iccm_rd_data_ecc[28],io_iccm_rd_data_ecc[26],io_iccm_rd_data_ecc[25],io_iccm_rd_data_ecc[23],io_iccm_rd_data_ecc[21],io_iccm_rd_data_ecc[19],io_iccm_rd_data_ecc[17],io_iccm_rd_data_ecc[15],_T_3257}; // @[el2_lib.scala 296:211]
  wire  _T_3267 = ^_T_3266; // @[el2_lib.scala 296:218]
  wire  _T_3268 = io_iccm_rd_data_ecc[32] ^ _T_3267; // @[el2_lib.scala 296:206]
  wire [6:0] _T_3274 = {_T_3164,_T_3174,_T_3191,_T_3208,_T_3228,_T_3248,_T_3268}; // @[Cat.scala 29:58]
  wire  _T_3275 = _T_3274 != 7'h0; // @[el2_lib.scala 297:44]
  wire  _T_3276 = iccm_ecc_word_enable[0] & _T_3275; // @[el2_lib.scala 297:32]
  wire  _T_3278 = _T_3276 & _T_3274[6]; // @[el2_lib.scala 297:53]
  wire  _T_3547 = ^io_iccm_rd_data_ecc[70:39]; // @[el2_lib.scala 296:30]
  wire  _T_3548 = ^io_iccm_rd_data_ecc[77:71]; // @[el2_lib.scala 296:44]
  wire  _T_3549 = _T_3547 ^ _T_3548; // @[el2_lib.scala 296:35]
  wire [5:0] _T_3557 = {io_iccm_rd_data_ecc[70],io_iccm_rd_data_ecc[69],io_iccm_rd_data_ecc[68],io_iccm_rd_data_ecc[67],io_iccm_rd_data_ecc[66],io_iccm_rd_data_ecc[65]}; // @[el2_lib.scala 296:76]
  wire  _T_3558 = ^_T_3557; // @[el2_lib.scala 296:83]
  wire  _T_3559 = io_iccm_rd_data_ecc[76] ^ _T_3558; // @[el2_lib.scala 296:71]
  wire [6:0] _T_3566 = {io_iccm_rd_data_ecc[56],io_iccm_rd_data_ecc[55],io_iccm_rd_data_ecc[54],io_iccm_rd_data_ecc[53],io_iccm_rd_data_ecc[52],io_iccm_rd_data_ecc[51],io_iccm_rd_data_ecc[50]}; // @[el2_lib.scala 296:103]
  wire [14:0] _T_3574 = {io_iccm_rd_data_ecc[64],io_iccm_rd_data_ecc[63],io_iccm_rd_data_ecc[62],io_iccm_rd_data_ecc[61],io_iccm_rd_data_ecc[60],io_iccm_rd_data_ecc[59],io_iccm_rd_data_ecc[58],io_iccm_rd_data_ecc[57],_T_3566}; // @[el2_lib.scala 296:103]
  wire  _T_3575 = ^_T_3574; // @[el2_lib.scala 296:110]
  wire  _T_3576 = io_iccm_rd_data_ecc[75] ^ _T_3575; // @[el2_lib.scala 296:98]
  wire [6:0] _T_3583 = {io_iccm_rd_data_ecc[49],io_iccm_rd_data_ecc[48],io_iccm_rd_data_ecc[47],io_iccm_rd_data_ecc[46],io_iccm_rd_data_ecc[45],io_iccm_rd_data_ecc[44],io_iccm_rd_data_ecc[43]}; // @[el2_lib.scala 296:130]
  wire [14:0] _T_3591 = {io_iccm_rd_data_ecc[64],io_iccm_rd_data_ecc[63],io_iccm_rd_data_ecc[62],io_iccm_rd_data_ecc[61],io_iccm_rd_data_ecc[60],io_iccm_rd_data_ecc[59],io_iccm_rd_data_ecc[58],io_iccm_rd_data_ecc[57],_T_3583}; // @[el2_lib.scala 296:130]
  wire  _T_3592 = ^_T_3591; // @[el2_lib.scala 296:137]
  wire  _T_3593 = io_iccm_rd_data_ecc[74] ^ _T_3592; // @[el2_lib.scala 296:125]
  wire [8:0] _T_3602 = {io_iccm_rd_data_ecc[54],io_iccm_rd_data_ecc[53],io_iccm_rd_data_ecc[49],io_iccm_rd_data_ecc[48],io_iccm_rd_data_ecc[47],io_iccm_rd_data_ecc[46],io_iccm_rd_data_ecc[42],io_iccm_rd_data_ecc[41],io_iccm_rd_data_ecc[40]}; // @[el2_lib.scala 296:157]
  wire [17:0] _T_3611 = {io_iccm_rd_data_ecc[70],io_iccm_rd_data_ecc[69],io_iccm_rd_data_ecc[68],io_iccm_rd_data_ecc[64],io_iccm_rd_data_ecc[63],io_iccm_rd_data_ecc[62],io_iccm_rd_data_ecc[61],io_iccm_rd_data_ecc[56],io_iccm_rd_data_ecc[55],_T_3602}; // @[el2_lib.scala 296:157]
  wire  _T_3612 = ^_T_3611; // @[el2_lib.scala 296:164]
  wire  _T_3613 = io_iccm_rd_data_ecc[73] ^ _T_3612; // @[el2_lib.scala 296:152]
  wire [8:0] _T_3622 = {io_iccm_rd_data_ecc[52],io_iccm_rd_data_ecc[51],io_iccm_rd_data_ecc[49],io_iccm_rd_data_ecc[48],io_iccm_rd_data_ecc[45],io_iccm_rd_data_ecc[44],io_iccm_rd_data_ecc[42],io_iccm_rd_data_ecc[41],io_iccm_rd_data_ecc[39]}; // @[el2_lib.scala 296:184]
  wire [17:0] _T_3631 = {io_iccm_rd_data_ecc[70],io_iccm_rd_data_ecc[67],io_iccm_rd_data_ecc[66],io_iccm_rd_data_ecc[64],io_iccm_rd_data_ecc[63],io_iccm_rd_data_ecc[60],io_iccm_rd_data_ecc[59],io_iccm_rd_data_ecc[56],io_iccm_rd_data_ecc[55],_T_3622}; // @[el2_lib.scala 296:184]
  wire  _T_3632 = ^_T_3631; // @[el2_lib.scala 296:191]
  wire  _T_3633 = io_iccm_rd_data_ecc[72] ^ _T_3632; // @[el2_lib.scala 296:179]
  wire [8:0] _T_3642 = {io_iccm_rd_data_ecc[52],io_iccm_rd_data_ecc[50],io_iccm_rd_data_ecc[49],io_iccm_rd_data_ecc[47],io_iccm_rd_data_ecc[45],io_iccm_rd_data_ecc[43],io_iccm_rd_data_ecc[42],io_iccm_rd_data_ecc[40],io_iccm_rd_data_ecc[39]}; // @[el2_lib.scala 296:211]
  wire [17:0] _T_3651 = {io_iccm_rd_data_ecc[69],io_iccm_rd_data_ecc[67],io_iccm_rd_data_ecc[65],io_iccm_rd_data_ecc[64],io_iccm_rd_data_ecc[62],io_iccm_rd_data_ecc[60],io_iccm_rd_data_ecc[58],io_iccm_rd_data_ecc[56],io_iccm_rd_data_ecc[54],_T_3642}; // @[el2_lib.scala 296:211]
  wire  _T_3652 = ^_T_3651; // @[el2_lib.scala 296:218]
  wire  _T_3653 = io_iccm_rd_data_ecc[71] ^ _T_3652; // @[el2_lib.scala 296:206]
  wire [6:0] _T_3659 = {_T_3549,_T_3559,_T_3576,_T_3593,_T_3613,_T_3633,_T_3653}; // @[Cat.scala 29:58]
  wire  _T_3660 = _T_3659 != 7'h0; // @[el2_lib.scala 297:44]
  wire  _T_3661 = iccm_ecc_word_enable[1] & _T_3660; // @[el2_lib.scala 297:32]
  wire  _T_3663 = _T_3661 & _T_3659[6]; // @[el2_lib.scala 297:53]
  wire [1:0] iccm_single_ecc_error = {_T_3278,_T_3663}; // @[Cat.scala 29:58]
  wire  _T_4 = |iccm_single_ecc_error; // @[el2_ifu_mem_ctl.scala 239:52]
  reg  dma_iccm_req_f; // @[el2_ifu_mem_ctl.scala 672:51]
  wire  _T_7 = io_iccm_rd_ecc_single_err | io_ic_error_start; // @[el2_ifu_mem_ctl.scala 240:57]
  reg [2:0] perr_state; // @[Reg.scala 27:20]
  wire  _T_8 = perr_state == 3'h4; // @[el2_ifu_mem_ctl.scala 241:54]
  wire  iccm_correct_ecc = perr_state == 3'h3; // @[el2_ifu_mem_ctl.scala 520:34]
  wire  _T_9 = iccm_correct_ecc | _T_8; // @[el2_ifu_mem_ctl.scala 241:40]
  reg [1:0] err_stop_state; // @[Reg.scala 27:20]
  wire  _T_10 = err_stop_state == 2'h3; // @[el2_ifu_mem_ctl.scala 241:90]
  wire  _T_11 = _T_9 | _T_10; // @[el2_ifu_mem_ctl.scala 241:72]
  wire  _T_2429 = 2'h0 == err_stop_state; // @[Conditional.scala 37:30]
  wire  _T_2434 = 2'h1 == err_stop_state; // @[Conditional.scala 37:30]
  wire  _T_2454 = io_ifu_fetch_val == 2'h3; // @[el2_ifu_mem_ctl.scala 568:48]
  wire  two_byte_instr = io_ic_rd_data[1:0] != 2'h3; // @[el2_ifu_mem_ctl.scala 436:39]
  wire  _T_2456 = io_ifu_fetch_val[0] & two_byte_instr; // @[el2_ifu_mem_ctl.scala 568:79]
  wire  _T_2457 = _T_2454 | _T_2456; // @[el2_ifu_mem_ctl.scala 568:56]
  wire  _T_2458 = io_exu_flush_final | io_dec_tlu_i0_commit_cmt; // @[el2_ifu_mem_ctl.scala 568:122]
  wire  _T_2459 = ~_T_2458; // @[el2_ifu_mem_ctl.scala 568:101]
  wire  _T_2460 = _T_2457 & _T_2459; // @[el2_ifu_mem_ctl.scala 568:99]
  wire  _T_2461 = 2'h2 == err_stop_state; // @[Conditional.scala 37:30]
  wire  _T_2475 = io_ifu_fetch_val[0] & _T_308; // @[el2_ifu_mem_ctl.scala 575:45]
  wire  _T_2476 = ~io_dec_tlu_i0_commit_cmt; // @[el2_ifu_mem_ctl.scala 575:69]
  wire  _T_2477 = _T_2475 & _T_2476; // @[el2_ifu_mem_ctl.scala 575:67]
  wire  _T_2478 = 2'h3 == err_stop_state; // @[Conditional.scala 37:30]
  wire  _GEN_54 = _T_2461 ? _T_2477 : _T_2478; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_2434 ? _T_2460 : _GEN_54; // @[Conditional.scala 39:67]
  wire  err_stop_fetch = _T_2429 ? 1'h0 : _GEN_58; // @[Conditional.scala 40:58]
  wire  _T_12 = _T_11 | err_stop_fetch; // @[el2_ifu_mem_ctl.scala 241:112]
  wire  _T_14 = io_ifu_axi_rvalid & io_ifu_bus_clk_en; // @[el2_ifu_mem_ctl.scala 242:44]
  wire  _T_15 = _T_14 & io_ifu_axi_rready; // @[el2_ifu_mem_ctl.scala 242:65]
  wire  _T_219 = |io_ic_rd_hit; // @[el2_ifu_mem_ctl.scala 330:37]
  wire  _T_220 = ~_T_219; // @[el2_ifu_mem_ctl.scala 330:23]
  reg  reset_all_tags; // @[el2_ifu_mem_ctl.scala 740:53]
  wire  _T_221 = _T_220 | reset_all_tags; // @[el2_ifu_mem_ctl.scala 330:41]
  wire  _T_199 = ~ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 321:48]
  wire  fetch_req_icache_f = ifc_fetch_req_f & _T_199; // @[el2_ifu_mem_ctl.scala 321:46]
  wire  _T_222 = _T_221 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 330:59]
  wire  _T_223 = ~miss_pending; // @[el2_ifu_mem_ctl.scala 330:82]
  wire  ic_act_miss_f = _T_222 & _T_223; // @[el2_ifu_mem_ctl.scala 330:80]
  reg  ifu_bus_rvalid_unq_ff; // @[Reg.scala 27:20]
  reg  bus_ifu_bus_clk_en_ff; // @[el2_ifu_mem_ctl.scala 588:61]
  wire  ifu_bus_rvalid_ff = ifu_bus_rvalid_unq_ff & bus_ifu_bus_clk_en_ff; // @[el2_ifu_mem_ctl.scala 629:49]
  wire  bus_ifu_wr_en_ff = ifu_bus_rvalid_ff & miss_pending; // @[el2_ifu_mem_ctl.scala 656:41]
  reg  uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 357:33]
  reg [2:0] bus_data_beat_count; // @[el2_ifu_mem_ctl.scala 637:56]
  wire  _T_2578 = bus_data_beat_count == 3'h1; // @[el2_ifu_mem_ctl.scala 654:69]
  wire  _T_2579 = &bus_data_beat_count; // @[el2_ifu_mem_ctl.scala 654:101]
  wire  bus_last_data_beat = uncacheable_miss_ff ? _T_2578 : _T_2579; // @[el2_ifu_mem_ctl.scala 654:28]
  wire  _T_2525 = bus_ifu_wr_en_ff & bus_last_data_beat; // @[el2_ifu_mem_ctl.scala 633:68]
  wire  _T_2526 = ic_act_miss_f | _T_2525; // @[el2_ifu_mem_ctl.scala 633:48]
  wire  bus_reset_data_beat_cnt = _T_2526 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 633:91]
  wire  _T_2522 = ~bus_last_data_beat; // @[el2_ifu_mem_ctl.scala 632:50]
  wire  _T_2523 = bus_ifu_wr_en_ff & _T_2522; // @[el2_ifu_mem_ctl.scala 632:48]
  wire  _T_2524 = ~io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 632:72]
  wire  bus_inc_data_beat_cnt = _T_2523 & _T_2524; // @[el2_ifu_mem_ctl.scala 632:70]
  wire [2:0] _T_2530 = bus_data_beat_count + 3'h1; // @[el2_ifu_mem_ctl.scala 636:115]
  wire [2:0] _T_2532 = bus_inc_data_beat_cnt ? _T_2530 : 3'h0; // @[Mux.scala 27:72]
  wire  _T_2527 = ~bus_inc_data_beat_cnt; // @[el2_ifu_mem_ctl.scala 634:32]
  wire  _T_2528 = ~bus_reset_data_beat_cnt; // @[el2_ifu_mem_ctl.scala 634:57]
  wire  bus_hold_data_beat_cnt = _T_2527 & _T_2528; // @[el2_ifu_mem_ctl.scala 634:55]
  wire [2:0] _T_2533 = bus_hold_data_beat_cnt ? bus_data_beat_count : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] bus_new_data_beat_count = _T_2532 | _T_2533; // @[Mux.scala 27:72]
  wire  _T_16 = &bus_new_data_beat_count; // @[el2_ifu_mem_ctl.scala 242:111]
  wire  _T_17 = _T_15 & _T_16; // @[el2_ifu_mem_ctl.scala 242:85]
  wire  _T_18 = miss_state == 3'h5; // @[el2_ifu_mem_ctl.scala 243:39]
  wire  _T_26 = 3'h0 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_28 = ic_act_miss_f & _T_308; // @[el2_ifu_mem_ctl.scala 249:43]
  wire [2:0] _T_30 = _T_28 ? 3'h1 : 3'h2; // @[el2_ifu_mem_ctl.scala 249:27]
  wire  _T_33 = 3'h1 == miss_state; // @[Conditional.scala 37:30]
  wire [4:0] byp_fetch_index = ifu_fetch_addr_int_f[4:0]; // @[el2_ifu_mem_ctl.scala 472:45]
  wire  _T_2097 = byp_fetch_index[4:2] == 3'h0; // @[el2_ifu_mem_ctl.scala 493:127]
  reg [7:0] ic_miss_buff_data_valid; // @[el2_ifu_mem_ctl.scala 449:60]
  wire  _T_2128 = _T_2097 & ic_miss_buff_data_valid[0]; // @[Mux.scala 27:72]
  wire  _T_2101 = byp_fetch_index[4:2] == 3'h1; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2129 = _T_2101 & ic_miss_buff_data_valid[1]; // @[Mux.scala 27:72]
  wire  _T_2136 = _T_2128 | _T_2129; // @[Mux.scala 27:72]
  wire  _T_2105 = byp_fetch_index[4:2] == 3'h2; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2130 = _T_2105 & ic_miss_buff_data_valid[2]; // @[Mux.scala 27:72]
  wire  _T_2137 = _T_2136 | _T_2130; // @[Mux.scala 27:72]
  wire  _T_2109 = byp_fetch_index[4:2] == 3'h3; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2131 = _T_2109 & ic_miss_buff_data_valid[3]; // @[Mux.scala 27:72]
  wire  _T_2138 = _T_2137 | _T_2131; // @[Mux.scala 27:72]
  wire  _T_2113 = byp_fetch_index[4:2] == 3'h4; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2132 = _T_2113 & ic_miss_buff_data_valid[4]; // @[Mux.scala 27:72]
  wire  _T_2139 = _T_2138 | _T_2132; // @[Mux.scala 27:72]
  wire  _T_2117 = byp_fetch_index[4:2] == 3'h5; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2133 = _T_2117 & ic_miss_buff_data_valid[5]; // @[Mux.scala 27:72]
  wire  _T_2140 = _T_2139 | _T_2133; // @[Mux.scala 27:72]
  wire  _T_2121 = byp_fetch_index[4:2] == 3'h6; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2134 = _T_2121 & ic_miss_buff_data_valid[6]; // @[Mux.scala 27:72]
  wire  _T_2141 = _T_2140 | _T_2134; // @[Mux.scala 27:72]
  wire  _T_2125 = byp_fetch_index[4:2] == 3'h7; // @[el2_ifu_mem_ctl.scala 493:127]
  wire  _T_2135 = _T_2125 & ic_miss_buff_data_valid[7]; // @[Mux.scala 27:72]
  wire  ic_miss_buff_data_valid_bypass_index = _T_2141 | _T_2135; // @[Mux.scala 27:72]
  wire  _T_2183 = ~byp_fetch_index[1]; // @[el2_ifu_mem_ctl.scala 495:69]
  wire  _T_2184 = ic_miss_buff_data_valid_bypass_index & _T_2183; // @[el2_ifu_mem_ctl.scala 495:67]
  wire  _T_2186 = ~byp_fetch_index[0]; // @[el2_ifu_mem_ctl.scala 495:91]
  wire  _T_2187 = _T_2184 & _T_2186; // @[el2_ifu_mem_ctl.scala 495:89]
  wire  _T_2192 = _T_2184 & byp_fetch_index[0]; // @[el2_ifu_mem_ctl.scala 496:65]
  wire  _T_2193 = _T_2187 | _T_2192; // @[el2_ifu_mem_ctl.scala 495:112]
  wire  _T_2195 = ic_miss_buff_data_valid_bypass_index & byp_fetch_index[1]; // @[el2_ifu_mem_ctl.scala 497:43]
  wire  _T_2198 = _T_2195 & _T_2186; // @[el2_ifu_mem_ctl.scala 497:65]
  wire  _T_2199 = _T_2193 | _T_2198; // @[el2_ifu_mem_ctl.scala 496:88]
  wire  _T_2203 = _T_2195 & byp_fetch_index[0]; // @[el2_ifu_mem_ctl.scala 498:65]
  wire [2:0] byp_fetch_index_inc = ifu_fetch_addr_int_f[4:2] + 3'h1; // @[el2_ifu_mem_ctl.scala 475:75]
  wire  _T_2143 = byp_fetch_index_inc == 3'h0; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2167 = _T_2143 & ic_miss_buff_data_valid[0]; // @[Mux.scala 27:72]
  wire  _T_2146 = byp_fetch_index_inc == 3'h1; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2168 = _T_2146 & ic_miss_buff_data_valid[1]; // @[Mux.scala 27:72]
  wire  _T_2175 = _T_2167 | _T_2168; // @[Mux.scala 27:72]
  wire  _T_2149 = byp_fetch_index_inc == 3'h2; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2169 = _T_2149 & ic_miss_buff_data_valid[2]; // @[Mux.scala 27:72]
  wire  _T_2176 = _T_2175 | _T_2169; // @[Mux.scala 27:72]
  wire  _T_2152 = byp_fetch_index_inc == 3'h3; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2170 = _T_2152 & ic_miss_buff_data_valid[3]; // @[Mux.scala 27:72]
  wire  _T_2177 = _T_2176 | _T_2170; // @[Mux.scala 27:72]
  wire  _T_2155 = byp_fetch_index_inc == 3'h4; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2171 = _T_2155 & ic_miss_buff_data_valid[4]; // @[Mux.scala 27:72]
  wire  _T_2178 = _T_2177 | _T_2171; // @[Mux.scala 27:72]
  wire  _T_2158 = byp_fetch_index_inc == 3'h5; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2172 = _T_2158 & ic_miss_buff_data_valid[5]; // @[Mux.scala 27:72]
  wire  _T_2179 = _T_2178 | _T_2172; // @[Mux.scala 27:72]
  wire  _T_2161 = byp_fetch_index_inc == 3'h6; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2173 = _T_2161 & ic_miss_buff_data_valid[6]; // @[Mux.scala 27:72]
  wire  _T_2180 = _T_2179 | _T_2173; // @[Mux.scala 27:72]
  wire  _T_2164 = byp_fetch_index_inc == 3'h7; // @[el2_ifu_mem_ctl.scala 494:110]
  wire  _T_2174 = _T_2164 & ic_miss_buff_data_valid[7]; // @[Mux.scala 27:72]
  wire  ic_miss_buff_data_valid_inc_bypass_index = _T_2180 | _T_2174; // @[Mux.scala 27:72]
  wire  _T_2204 = _T_2203 & ic_miss_buff_data_valid_inc_bypass_index; // @[el2_ifu_mem_ctl.scala 498:87]
  wire  _T_2205 = _T_2199 | _T_2204; // @[el2_ifu_mem_ctl.scala 497:88]
  wire  _T_2215 = _T_2187 & _T_2125; // @[el2_ifu_mem_ctl.scala 499:87]
  wire  miss_buff_hit_unq_f = _T_2205 | _T_2215; // @[el2_ifu_mem_ctl.scala 498:131]
  wire  _T_2230 = miss_state == 3'h4; // @[el2_ifu_mem_ctl.scala 504:55]
  wire  _T_2231 = miss_state == 3'h1; // @[el2_ifu_mem_ctl.scala 504:87]
  wire  _T_2232 = _T_2230 | _T_2231; // @[el2_ifu_mem_ctl.scala 504:74]
  wire  crit_byp_hit_f = miss_buff_hit_unq_f & _T_2232; // @[el2_ifu_mem_ctl.scala 504:41]
  wire  _T_2216 = miss_state == 3'h6; // @[el2_ifu_mem_ctl.scala 501:30]
  reg [30:0] imb_ff; // @[el2_ifu_mem_ctl.scala 358:20]
  wire  miss_wrap_f = imb_ff[5] != ifu_fetch_addr_int_f[6]; // @[el2_ifu_mem_ctl.scala 492:51]
  wire  _T_2217 = ~miss_wrap_f; // @[el2_ifu_mem_ctl.scala 501:68]
  wire  _T_2218 = miss_buff_hit_unq_f & _T_2217; // @[el2_ifu_mem_ctl.scala 501:66]
  wire  stream_hit_f = _T_2216 & _T_2218; // @[el2_ifu_mem_ctl.scala 501:43]
  wire  _T_207 = crit_byp_hit_f | stream_hit_f; // @[el2_ifu_mem_ctl.scala 325:35]
  wire  _T_208 = _T_207 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 325:52]
  wire  ic_byp_hit_f = _T_208 & miss_pending; // @[el2_ifu_mem_ctl.scala 325:73]
  reg  last_data_recieved_ff; // @[el2_ifu_mem_ctl.scala 639:58]
  wire  last_beat = bus_last_data_beat & bus_ifu_wr_en_ff; // @[el2_ifu_mem_ctl.scala 666:35]
  wire  _T_34 = bus_ifu_wr_en_ff & last_beat; // @[el2_ifu_mem_ctl.scala 252:112]
  wire  _T_35 = last_data_recieved_ff | _T_34; // @[el2_ifu_mem_ctl.scala 252:92]
  wire  _T_36 = ic_byp_hit_f & _T_35; // @[el2_ifu_mem_ctl.scala 252:66]
  wire  _T_37 = _T_36 & uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 252:126]
  wire  _T_38 = io_dec_tlu_force_halt | _T_37; // @[el2_ifu_mem_ctl.scala 252:51]
  wire  _T_40 = ~last_data_recieved_ff; // @[el2_ifu_mem_ctl.scala 253:30]
  wire  _T_41 = ic_byp_hit_f & _T_40; // @[el2_ifu_mem_ctl.scala 253:27]
  wire  _T_42 = _T_41 & uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 253:53]
  wire  _T_44 = ~ic_byp_hit_f; // @[el2_ifu_mem_ctl.scala 254:16]
  wire  _T_46 = _T_44 & _T_308; // @[el2_ifu_mem_ctl.scala 254:30]
  wire  _T_48 = _T_46 & _T_34; // @[el2_ifu_mem_ctl.scala 254:52]
  wire  _T_49 = _T_48 & uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 254:85]
  wire  _T_52 = ~uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 255:51]
  wire  _T_53 = _T_34 & _T_52; // @[el2_ifu_mem_ctl.scala 255:49]
  wire  _T_55 = ic_byp_hit_f | bus_ifu_wr_en_ff; // @[el2_ifu_mem_ctl.scala 256:34]
  wire  _T_57 = _T_55 & _T_308; // @[el2_ifu_mem_ctl.scala 256:54]
  wire  _T_59 = ~_T_34; // @[el2_ifu_mem_ctl.scala 256:78]
  wire  _T_60 = _T_57 & _T_59; // @[el2_ifu_mem_ctl.scala 256:76]
  wire  ifu_bp_hit_taken_q_f = io_ifu_bp_hit_taken_f & io_ic_hit_f; // @[el2_ifu_mem_ctl.scala 245:52]
  wire  _T_61 = ~ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 256:112]
  wire  _T_62 = _T_60 & _T_61; // @[el2_ifu_mem_ctl.scala 256:110]
  wire  _T_64 = _T_62 & _T_52; // @[el2_ifu_mem_ctl.scala 256:134]
  wire  _T_72 = _T_48 & _T_52; // @[el2_ifu_mem_ctl.scala 257:100]
  wire  _T_74 = io_exu_flush_final | ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 258:44]
  wire  _T_77 = _T_74 & _T_59; // @[el2_ifu_mem_ctl.scala 258:68]
  wire [2:0] _T_79 = _T_77 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 258:22]
  wire [2:0] _T_80 = _T_72 ? 3'h0 : _T_79; // @[el2_ifu_mem_ctl.scala 257:20]
  wire [2:0] _T_81 = _T_64 ? 3'h6 : _T_80; // @[el2_ifu_mem_ctl.scala 256:18]
  wire [2:0] _T_82 = _T_53 ? 3'h0 : _T_81; // @[el2_ifu_mem_ctl.scala 255:16]
  wire [2:0] _T_83 = _T_49 ? 3'h1 : _T_82; // @[el2_ifu_mem_ctl.scala 254:14]
  wire [2:0] _T_84 = _T_42 ? 3'h3 : _T_83; // @[el2_ifu_mem_ctl.scala 253:12]
  wire [2:0] _T_85 = _T_38 ? 3'h0 : _T_84; // @[el2_ifu_mem_ctl.scala 252:27]
  wire  _T_94 = 3'h4 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_98 = 3'h6 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_2227 = byp_fetch_index[4:1] == 4'h7; // @[el2_ifu_mem_ctl.scala 503:60]
  wire  _T_2228 = _T_2227 & ifc_fetch_req_f; // @[el2_ifu_mem_ctl.scala 503:92]
  wire  stream_eol_f = _T_2228 & stream_hit_f; // @[el2_ifu_mem_ctl.scala 503:110]
  wire  _T_100 = _T_74 | stream_eol_f; // @[el2_ifu_mem_ctl.scala 266:72]
  wire  _T_103 = _T_100 & _T_59; // @[el2_ifu_mem_ctl.scala 266:87]
  wire  _T_105 = _T_103 & _T_2524; // @[el2_ifu_mem_ctl.scala 266:122]
  wire [2:0] _T_107 = _T_105 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 266:27]
  wire  _T_113 = 3'h3 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_116 = io_exu_flush_final & _T_59; // @[el2_ifu_mem_ctl.scala 270:48]
  wire  _T_118 = _T_116 & _T_2524; // @[el2_ifu_mem_ctl.scala 270:82]
  wire [2:0] _T_120 = _T_118 ? 3'h2 : 3'h0; // @[el2_ifu_mem_ctl.scala 270:27]
  wire  _T_124 = 3'h2 == miss_state; // @[Conditional.scala 37:30]
  wire  _T_228 = io_ic_rd_hit == 2'h0; // @[el2_ifu_mem_ctl.scala 331:28]
  wire  _T_229 = _T_228 | reset_all_tags; // @[el2_ifu_mem_ctl.scala 331:42]
  wire  _T_230 = _T_229 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 331:60]
  wire  _T_231 = miss_state == 3'h2; // @[el2_ifu_mem_ctl.scala 331:94]
  wire  _T_232 = _T_230 & _T_231; // @[el2_ifu_mem_ctl.scala 331:81]
  wire  _T_235 = imb_ff[30:5] != ifu_fetch_addr_int_f[30:5]; // @[el2_ifu_mem_ctl.scala 332:39]
  wire  _T_236 = _T_232 & _T_235; // @[el2_ifu_mem_ctl.scala 331:111]
  wire  _T_238 = _T_236 & _T_52; // @[el2_ifu_mem_ctl.scala 332:91]
  reg  sel_mb_addr_ff; // @[el2_ifu_mem_ctl.scala 385:51]
  wire  _T_239 = ~sel_mb_addr_ff; // @[el2_ifu_mem_ctl.scala 332:116]
  wire  ic_miss_under_miss_f = _T_238 & _T_239; // @[el2_ifu_mem_ctl.scala 332:114]
  wire  _T_127 = ic_miss_under_miss_f & _T_59; // @[el2_ifu_mem_ctl.scala 274:50]
  wire  _T_129 = _T_127 & _T_2524; // @[el2_ifu_mem_ctl.scala 274:84]
  wire  _T_248 = _T_222 & _T_231; // @[el2_ifu_mem_ctl.scala 333:85]
  wire  _T_251 = imb_ff[30:5] == ifu_fetch_addr_int_f[30:5]; // @[el2_ifu_mem_ctl.scala 334:39]
  wire  _T_252 = _T_251 | uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 334:91]
  wire  ic_ignore_2nd_miss_f = _T_248 & _T_252; // @[el2_ifu_mem_ctl.scala 333:117]
  wire  _T_133 = ic_ignore_2nd_miss_f & _T_59; // @[el2_ifu_mem_ctl.scala 275:35]
  wire  _T_135 = _T_133 & _T_2524; // @[el2_ifu_mem_ctl.scala 275:69]
  wire [2:0] _T_137 = _T_135 ? 3'h7 : 3'h0; // @[el2_ifu_mem_ctl.scala 275:12]
  wire [2:0] _T_138 = _T_129 ? 3'h5 : _T_137; // @[el2_ifu_mem_ctl.scala 274:27]
  wire  _T_143 = 3'h5 == miss_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_146 = _T_34 ? 3'h0 : 3'h2; // @[el2_ifu_mem_ctl.scala 280:12]
  wire [2:0] _T_147 = io_exu_flush_final ? _T_146 : 3'h1; // @[el2_ifu_mem_ctl.scala 279:62]
  wire [2:0] _T_148 = io_dec_tlu_force_halt ? 3'h0 : _T_147; // @[el2_ifu_mem_ctl.scala 279:27]
  wire  _T_152 = 3'h7 == miss_state; // @[Conditional.scala 37:30]
  wire [2:0] _T_156 = io_exu_flush_final ? _T_146 : 3'h0; // @[el2_ifu_mem_ctl.scala 284:62]
  wire [2:0] _T_157 = io_dec_tlu_force_halt ? 3'h0 : _T_156; // @[el2_ifu_mem_ctl.scala 284:27]
  wire [2:0] _GEN_0 = _T_152 ? _T_157 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2 = _T_143 ? _T_148 : _GEN_0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_4 = _T_124 ? _T_138 : _GEN_2; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_6 = _T_113 ? _T_120 : _GEN_4; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_8 = _T_98 ? _T_107 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_10 = _T_94 ? 3'h0 : _GEN_8; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_12 = _T_33 ? _T_85 : _GEN_10; // @[Conditional.scala 39:67]
  wire [2:0] miss_nxtstate = _T_26 ? _T_30 : _GEN_12; // @[Conditional.scala 40:58]
  wire  _T_19 = miss_nxtstate == 3'h5; // @[el2_ifu_mem_ctl.scala 243:71]
  wire  _T_20 = _T_18 | _T_19; // @[el2_ifu_mem_ctl.scala 243:55]
  wire  _T_21 = uncacheable_miss_ff >> _T_20; // @[el2_ifu_mem_ctl.scala 243:26]
  wire  _T_23 = ~_T_21; // @[el2_ifu_mem_ctl.scala 243:5]
  wire  _T_24 = _T_17 & _T_23; // @[el2_ifu_mem_ctl.scala 242:116]
  wire  scnd_miss_req_in = _T_24 & _T_308; // @[el2_ifu_mem_ctl.scala 243:89]
  wire  _T_32 = ic_act_miss_f & _T_2524; // @[el2_ifu_mem_ctl.scala 250:38]
  wire  _T_86 = io_dec_tlu_force_halt | io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 259:46]
  wire  _T_87 = _T_86 | ic_byp_hit_f; // @[el2_ifu_mem_ctl.scala 259:67]
  wire  _T_88 = _T_87 | ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 259:82]
  wire  _T_90 = _T_88 | _T_34; // @[el2_ifu_mem_ctl.scala 259:105]
  wire  _T_92 = bus_ifu_wr_en_ff & _T_52; // @[el2_ifu_mem_ctl.scala 259:158]
  wire  _T_93 = _T_90 | _T_92; // @[el2_ifu_mem_ctl.scala 259:138]
  wire  _T_95 = io_exu_flush_final | flush_final_f; // @[el2_ifu_mem_ctl.scala 263:43]
  wire  _T_96 = _T_95 | ic_byp_hit_f; // @[el2_ifu_mem_ctl.scala 263:59]
  wire  _T_97 = _T_96 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 263:74]
  wire  _T_111 = _T_100 | _T_34; // @[el2_ifu_mem_ctl.scala 267:84]
  wire  _T_112 = _T_111 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 267:118]
  wire  _T_122 = io_exu_flush_final | _T_34; // @[el2_ifu_mem_ctl.scala 271:43]
  wire  _T_123 = _T_122 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 271:76]
  wire  _T_140 = _T_34 | ic_miss_under_miss_f; // @[el2_ifu_mem_ctl.scala 276:55]
  wire  _T_141 = _T_140 | ic_ignore_2nd_miss_f; // @[el2_ifu_mem_ctl.scala 276:78]
  wire  _T_142 = _T_141 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 276:101]
  wire  _T_150 = _T_34 | io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 281:55]
  wire  _T_151 = _T_150 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 281:76]
  wire  _GEN_1 = _T_152 & _T_151; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_143 ? _T_151 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_124 ? _T_142 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_113 ? _T_123 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_98 ? _T_112 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_94 ? _T_97 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_33 ? _T_93 : _GEN_11; // @[Conditional.scala 39:67]
  wire  miss_state_en = _T_26 ? _T_32 : _GEN_13; // @[Conditional.scala 40:58]
  wire  _T_166 = ~flush_final_f; // @[el2_ifu_mem_ctl.scala 301:95]
  wire  _T_167 = _T_2230 & _T_166; // @[el2_ifu_mem_ctl.scala 301:93]
  wire  crit_wd_byp_ok_ff = _T_2231 | _T_167; // @[el2_ifu_mem_ctl.scala 301:58]
  wire  _T_170 = miss_pending & _T_59; // @[el2_ifu_mem_ctl.scala 302:36]
  wire  _T_172 = _T_2230 & io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 302:106]
  wire  _T_173 = ~_T_172; // @[el2_ifu_mem_ctl.scala 302:72]
  wire  _T_174 = _T_170 & _T_173; // @[el2_ifu_mem_ctl.scala 302:70]
  wire  _T_176 = _T_2230 & crit_byp_hit_f; // @[el2_ifu_mem_ctl.scala 303:57]
  wire  _T_177 = ~_T_176; // @[el2_ifu_mem_ctl.scala 303:23]
  wire  _T_178 = _T_174 & _T_177; // @[el2_ifu_mem_ctl.scala 302:128]
  wire  _T_179 = _T_178 | ic_act_miss_f; // @[el2_ifu_mem_ctl.scala 303:77]
  wire  _T_180 = miss_nxtstate == 3'h4; // @[el2_ifu_mem_ctl.scala 304:36]
  wire  _T_181 = miss_pending & _T_180; // @[el2_ifu_mem_ctl.scala 304:19]
  wire  sel_hold_imb = _T_179 | _T_181; // @[el2_ifu_mem_ctl.scala 303:93]
  wire  _T_183 = _T_18 | ic_miss_under_miss_f; // @[el2_ifu_mem_ctl.scala 306:57]
  wire  sel_hold_imb_scnd = _T_183 & _T_166; // @[el2_ifu_mem_ctl.scala 306:81]
  wire  _T_187 = ~reset_all_tags; // @[el2_ifu_mem_ctl.scala 309:96]
  reg [30:0] imb_scnd_ff; // @[el2_ifu_mem_ctl.scala 313:25]
  wire [2:0] _T_198 = bus_ifu_wr_en_ff ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  reg [2:0] ifu_bus_rid_ff; // @[Reg.scala 27:20]
  wire [2:0] ic_wr_addr_bits_hi_3 = ifu_bus_rid_ff & _T_198; // @[el2_ifu_mem_ctl.scala 318:45]
  wire  _T_204 = _T_223 | _T_231; // @[el2_ifu_mem_ctl.scala 323:59]
  wire  _T_206 = _T_204 | _T_2216; // @[el2_ifu_mem_ctl.scala 323:91]
  wire  ic_iccm_hit_f = fetch_req_iccm_f & _T_206; // @[el2_ifu_mem_ctl.scala 323:41]
  wire  _T_211 = _T_219 & fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 329:39]
  wire  _T_213 = _T_211 & _T_187; // @[el2_ifu_mem_ctl.scala 329:60]
  wire  _T_217 = _T_213 & _T_204; // @[el2_ifu_mem_ctl.scala 329:78]
  wire  ic_act_hit_f = _T_217 & _T_239; // @[el2_ifu_mem_ctl.scala 329:126]
  wire  _T_254 = ic_act_hit_f | ic_byp_hit_f; // @[el2_ifu_mem_ctl.scala 336:31]
  wire  uncacheable_miss_in = sel_hold_imb ? uncacheable_miss_ff : io_ifc_fetch_uncacheable_bf; // @[el2_ifu_mem_ctl.scala 337:84]
  reg [1:0] ifu_bus_rresp_ff; // @[Reg.scala 27:20]
  wire  _T_2599 = |ifu_bus_rresp_ff; // @[el2_ifu_mem_ctl.scala 662:48]
  wire  _T_2600 = _T_2599 & ifu_bus_rvalid_ff; // @[el2_ifu_mem_ctl.scala 662:52]
  wire  bus_ifu_wr_data_error_ff = _T_2600 & miss_pending; // @[el2_ifu_mem_ctl.scala 662:73]
  reg  ifu_wr_data_comb_err_ff; // @[el2_ifu_mem_ctl.scala 412:61]
  wire  ifu_wr_cumulative_err_data = bus_ifu_wr_data_error_ff | ifu_wr_data_comb_err_ff; // @[el2_ifu_mem_ctl.scala 411:55]
  wire  _T_268 = ~ifu_wr_cumulative_err_data; // @[el2_ifu_mem_ctl.scala 340:145]
  reg  scnd_miss_req_q; // @[el2_ifu_mem_ctl.scala 589:52]
  wire  _T_288 = ~scnd_miss_req_q; // @[el2_ifu_mem_ctl.scala 352:36]
  wire  _T_289 = miss_pending & _T_288; // @[el2_ifu_mem_ctl.scala 352:34]
  reg  reset_ic_ff; // @[el2_ifu_mem_ctl.scala 353:25]
  wire  _T_290 = reset_all_tags | reset_ic_ff; // @[el2_ifu_mem_ctl.scala 352:72]
  wire  reset_ic_in = _T_289 & _T_290; // @[el2_ifu_mem_ctl.scala 352:53]
  reg [25:0] miss_addr; // @[el2_ifu_mem_ctl.scala 362:23]
  wire  _T_304 = _T_2230 & flush_final_f; // @[el2_ifu_mem_ctl.scala 366:87]
  wire  _T_305 = ~_T_304; // @[el2_ifu_mem_ctl.scala 366:55]
  wire  _T_306 = io_ifc_fetch_req_bf & _T_305; // @[el2_ifu_mem_ctl.scala 366:53]
  wire  stream_miss_f = stream_hit_f & ifc_fetch_req_f; // @[el2_ifu_mem_ctl.scala 502:83]
  wire  _T_307 = ~stream_miss_f; // @[el2_ifu_mem_ctl.scala 366:106]
  wire  ifc_fetch_req_qual_bf = _T_306 & _T_307; // @[el2_ifu_mem_ctl.scala 366:104]
  reg  ifc_region_acc_fault_f; // @[el2_ifu_mem_ctl.scala 372:39]
  reg [2:0] bus_rd_addr_count; // @[Reg.scala 27:20]
  wire [28:0] ifu_ic_req_addr_f = {miss_addr,bus_rd_addr_count}; // @[Cat.scala 29:58]
  wire  _T_2236 = ~ifu_bus_rid_ff[0]; // @[el2_ifu_mem_ctl.scala 507:55]
  wire [2:0] other_tag = {ifu_bus_rid_ff[2:1],_T_2236}; // @[Cat.scala 29:58]
  wire  _T_2237 = other_tag == 3'h0; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2261 = _T_2237 & ic_miss_buff_data_valid[0]; // @[Mux.scala 27:72]
  wire  _T_2240 = other_tag == 3'h1; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2262 = _T_2240 & ic_miss_buff_data_valid[1]; // @[Mux.scala 27:72]
  wire  _T_2269 = _T_2261 | _T_2262; // @[Mux.scala 27:72]
  wire  _T_2243 = other_tag == 3'h2; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2263 = _T_2243 & ic_miss_buff_data_valid[2]; // @[Mux.scala 27:72]
  wire  _T_2270 = _T_2269 | _T_2263; // @[Mux.scala 27:72]
  wire  _T_2246 = other_tag == 3'h3; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2264 = _T_2246 & ic_miss_buff_data_valid[3]; // @[Mux.scala 27:72]
  wire  _T_2271 = _T_2270 | _T_2264; // @[Mux.scala 27:72]
  wire  _T_2249 = other_tag == 3'h4; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2265 = _T_2249 & ic_miss_buff_data_valid[4]; // @[Mux.scala 27:72]
  wire  _T_2272 = _T_2271 | _T_2265; // @[Mux.scala 27:72]
  wire  _T_2252 = other_tag == 3'h5; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2266 = _T_2252 & ic_miss_buff_data_valid[5]; // @[Mux.scala 27:72]
  wire  _T_2273 = _T_2272 | _T_2266; // @[Mux.scala 27:72]
  wire  _T_2255 = other_tag == 3'h6; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2267 = _T_2255 & ic_miss_buff_data_valid[6]; // @[Mux.scala 27:72]
  wire  _T_2274 = _T_2273 | _T_2267; // @[Mux.scala 27:72]
  wire  _T_2258 = other_tag == 3'h7; // @[el2_ifu_mem_ctl.scala 508:81]
  wire  _T_2268 = _T_2258 & ic_miss_buff_data_valid[7]; // @[Mux.scala 27:72]
  wire  second_half_available = _T_2274 | _T_2268; // @[Mux.scala 27:72]
  wire  write_ic_16_bytes = second_half_available & bus_ifu_wr_en_ff; // @[el2_ifu_mem_ctl.scala 509:46]
  wire  _T_319 = miss_pending & write_ic_16_bytes; // @[el2_ifu_mem_ctl.scala 378:35]
  wire  _T_321 = _T_319 & _T_52; // @[el2_ifu_mem_ctl.scala 378:55]
  reg  ic_act_miss_f_delayed; // @[el2_ifu_mem_ctl.scala 659:61]
  wire  _T_2593 = ic_act_miss_f_delayed & _T_2231; // @[el2_ifu_mem_ctl.scala 660:53]
  wire  reset_tag_valid_for_miss = _T_2593 & _T_52; // @[el2_ifu_mem_ctl.scala 660:84]
  wire  sel_mb_addr = _T_321 | reset_tag_valid_for_miss; // @[el2_ifu_mem_ctl.scala 378:79]
  wire [30:0] _T_326 = {imb_ff[30:5],ic_wr_addr_bits_hi_3,imb_ff[1:0]}; // @[Cat.scala 29:58]
  wire  _T_335 = _T_321 & last_beat; // @[el2_ifu_mem_ctl.scala 382:84]
  wire  _T_2587 = ~_T_2599; // @[el2_ifu_mem_ctl.scala 657:84]
  wire  _T_2588 = _T_92 & _T_2587; // @[el2_ifu_mem_ctl.scala 657:82]
  wire  bus_ifu_wr_en_ff_q = _T_2588 & write_ic_16_bytes; // @[el2_ifu_mem_ctl.scala 657:108]
  wire  sel_mb_status_addr = _T_335 & bus_ifu_wr_en_ff_q; // @[el2_ifu_mem_ctl.scala 382:96]
  wire [30:0] ifu_status_wr_addr = sel_mb_status_addr ? _T_326 : ifu_fetch_addr_int_f; // @[el2_ifu_mem_ctl.scala 383:31]
  reg [63:0] ifu_bus_rdata_ff; // @[Reg.scala 27:20]
  wire [7:0] _T_559 = {ifu_bus_rdata_ff[11],ifu_bus_rdata_ff[10],ifu_bus_rdata_ff[8],ifu_bus_rdata_ff[6],ifu_bus_rdata_ff[4],ifu_bus_rdata_ff[3],ifu_bus_rdata_ff[1],ifu_bus_rdata_ff[0]}; // @[el2_lib.scala 343:27]
  wire [16:0] _T_568 = {ifu_bus_rdata_ff[28],ifu_bus_rdata_ff[26],ifu_bus_rdata_ff[25],ifu_bus_rdata_ff[23],ifu_bus_rdata_ff[21],ifu_bus_rdata_ff[19],ifu_bus_rdata_ff[17],ifu_bus_rdata_ff[15],ifu_bus_rdata_ff[13],_T_559}; // @[el2_lib.scala 343:27]
  wire [8:0] _T_576 = {ifu_bus_rdata_ff[46],ifu_bus_rdata_ff[44],ifu_bus_rdata_ff[42],ifu_bus_rdata_ff[40],ifu_bus_rdata_ff[38],ifu_bus_rdata_ff[36],ifu_bus_rdata_ff[34],ifu_bus_rdata_ff[32],ifu_bus_rdata_ff[30]}; // @[el2_lib.scala 343:27]
  wire [17:0] _T_585 = {ifu_bus_rdata_ff[63],ifu_bus_rdata_ff[61],ifu_bus_rdata_ff[59],ifu_bus_rdata_ff[57],ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[54],ifu_bus_rdata_ff[52],ifu_bus_rdata_ff[50],ifu_bus_rdata_ff[48],_T_576}; // @[el2_lib.scala 343:27]
  wire [34:0] _T_586 = {_T_585,_T_568}; // @[el2_lib.scala 343:27]
  wire  _T_587 = ^_T_586; // @[el2_lib.scala 343:34]
  wire [7:0] _T_594 = {ifu_bus_rdata_ff[12],ifu_bus_rdata_ff[10],ifu_bus_rdata_ff[9],ifu_bus_rdata_ff[6],ifu_bus_rdata_ff[5],ifu_bus_rdata_ff[3],ifu_bus_rdata_ff[2],ifu_bus_rdata_ff[0]}; // @[el2_lib.scala 343:44]
  wire [16:0] _T_603 = {ifu_bus_rdata_ff[28],ifu_bus_rdata_ff[27],ifu_bus_rdata_ff[25],ifu_bus_rdata_ff[24],ifu_bus_rdata_ff[21],ifu_bus_rdata_ff[20],ifu_bus_rdata_ff[17],ifu_bus_rdata_ff[16],ifu_bus_rdata_ff[13],_T_594}; // @[el2_lib.scala 343:44]
  wire [8:0] _T_611 = {ifu_bus_rdata_ff[47],ifu_bus_rdata_ff[44],ifu_bus_rdata_ff[43],ifu_bus_rdata_ff[40],ifu_bus_rdata_ff[39],ifu_bus_rdata_ff[36],ifu_bus_rdata_ff[35],ifu_bus_rdata_ff[32],ifu_bus_rdata_ff[31]}; // @[el2_lib.scala 343:44]
  wire [17:0] _T_620 = {ifu_bus_rdata_ff[63],ifu_bus_rdata_ff[62],ifu_bus_rdata_ff[59],ifu_bus_rdata_ff[58],ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[55],ifu_bus_rdata_ff[52],ifu_bus_rdata_ff[51],ifu_bus_rdata_ff[48],_T_611}; // @[el2_lib.scala 343:44]
  wire [34:0] _T_621 = {_T_620,_T_603}; // @[el2_lib.scala 343:44]
  wire  _T_622 = ^_T_621; // @[el2_lib.scala 343:51]
  wire [7:0] _T_629 = {ifu_bus_rdata_ff[14],ifu_bus_rdata_ff[10],ifu_bus_rdata_ff[9],ifu_bus_rdata_ff[8],ifu_bus_rdata_ff[7],ifu_bus_rdata_ff[3],ifu_bus_rdata_ff[2],ifu_bus_rdata_ff[1]}; // @[el2_lib.scala 343:61]
  wire [16:0] _T_638 = {ifu_bus_rdata_ff[30],ifu_bus_rdata_ff[29],ifu_bus_rdata_ff[25],ifu_bus_rdata_ff[24],ifu_bus_rdata_ff[23],ifu_bus_rdata_ff[22],ifu_bus_rdata_ff[17],ifu_bus_rdata_ff[16],ifu_bus_rdata_ff[15],_T_629}; // @[el2_lib.scala 343:61]
  wire [8:0] _T_646 = {ifu_bus_rdata_ff[47],ifu_bus_rdata_ff[46],ifu_bus_rdata_ff[45],ifu_bus_rdata_ff[40],ifu_bus_rdata_ff[39],ifu_bus_rdata_ff[38],ifu_bus_rdata_ff[37],ifu_bus_rdata_ff[32],ifu_bus_rdata_ff[31]}; // @[el2_lib.scala 343:61]
  wire [17:0] _T_655 = {ifu_bus_rdata_ff[63],ifu_bus_rdata_ff[62],ifu_bus_rdata_ff[61],ifu_bus_rdata_ff[60],ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[55],ifu_bus_rdata_ff[54],ifu_bus_rdata_ff[53],ifu_bus_rdata_ff[48],_T_646}; // @[el2_lib.scala 343:61]
  wire [34:0] _T_656 = {_T_655,_T_638}; // @[el2_lib.scala 343:61]
  wire  _T_657 = ^_T_656; // @[el2_lib.scala 343:68]
  wire [6:0] _T_663 = {ifu_bus_rdata_ff[10],ifu_bus_rdata_ff[9],ifu_bus_rdata_ff[8],ifu_bus_rdata_ff[7],ifu_bus_rdata_ff[6],ifu_bus_rdata_ff[5],ifu_bus_rdata_ff[4]}; // @[el2_lib.scala 343:78]
  wire [14:0] _T_671 = {ifu_bus_rdata_ff[25],ifu_bus_rdata_ff[24],ifu_bus_rdata_ff[23],ifu_bus_rdata_ff[22],ifu_bus_rdata_ff[21],ifu_bus_rdata_ff[20],ifu_bus_rdata_ff[19],ifu_bus_rdata_ff[18],_T_663}; // @[el2_lib.scala 343:78]
  wire [7:0] _T_678 = {ifu_bus_rdata_ff[40],ifu_bus_rdata_ff[39],ifu_bus_rdata_ff[38],ifu_bus_rdata_ff[37],ifu_bus_rdata_ff[36],ifu_bus_rdata_ff[35],ifu_bus_rdata_ff[34],ifu_bus_rdata_ff[33]}; // @[el2_lib.scala 343:78]
  wire [30:0] _T_687 = {ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[55],ifu_bus_rdata_ff[54],ifu_bus_rdata_ff[53],ifu_bus_rdata_ff[52],ifu_bus_rdata_ff[51],ifu_bus_rdata_ff[50],ifu_bus_rdata_ff[49],_T_678,_T_671}; // @[el2_lib.scala 343:78]
  wire  _T_688 = ^_T_687; // @[el2_lib.scala 343:85]
  wire [6:0] _T_694 = {ifu_bus_rdata_ff[17],ifu_bus_rdata_ff[16],ifu_bus_rdata_ff[15],ifu_bus_rdata_ff[14],ifu_bus_rdata_ff[13],ifu_bus_rdata_ff[12],ifu_bus_rdata_ff[11]}; // @[el2_lib.scala 343:95]
  wire [14:0] _T_702 = {ifu_bus_rdata_ff[25],ifu_bus_rdata_ff[24],ifu_bus_rdata_ff[23],ifu_bus_rdata_ff[22],ifu_bus_rdata_ff[21],ifu_bus_rdata_ff[20],ifu_bus_rdata_ff[19],ifu_bus_rdata_ff[18],_T_694}; // @[el2_lib.scala 343:95]
  wire [7:0] _T_709 = {ifu_bus_rdata_ff[48],ifu_bus_rdata_ff[47],ifu_bus_rdata_ff[46],ifu_bus_rdata_ff[45],ifu_bus_rdata_ff[44],ifu_bus_rdata_ff[43],ifu_bus_rdata_ff[42],ifu_bus_rdata_ff[41]}; // @[el2_lib.scala 343:95]
  wire [30:0] _T_718 = {ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[55],ifu_bus_rdata_ff[54],ifu_bus_rdata_ff[53],ifu_bus_rdata_ff[52],ifu_bus_rdata_ff[51],ifu_bus_rdata_ff[50],ifu_bus_rdata_ff[49],_T_709,_T_702}; // @[el2_lib.scala 343:95]
  wire  _T_719 = ^_T_718; // @[el2_lib.scala 343:102]
  wire [6:0] _T_725 = {ifu_bus_rdata_ff[32],ifu_bus_rdata_ff[31],ifu_bus_rdata_ff[30],ifu_bus_rdata_ff[29],ifu_bus_rdata_ff[28],ifu_bus_rdata_ff[27],ifu_bus_rdata_ff[26]}; // @[el2_lib.scala 343:112]
  wire [14:0] _T_733 = {ifu_bus_rdata_ff[40],ifu_bus_rdata_ff[39],ifu_bus_rdata_ff[38],ifu_bus_rdata_ff[37],ifu_bus_rdata_ff[36],ifu_bus_rdata_ff[35],ifu_bus_rdata_ff[34],ifu_bus_rdata_ff[33],_T_725}; // @[el2_lib.scala 343:112]
  wire [30:0] _T_749 = {ifu_bus_rdata_ff[56],ifu_bus_rdata_ff[55],ifu_bus_rdata_ff[54],ifu_bus_rdata_ff[53],ifu_bus_rdata_ff[52],ifu_bus_rdata_ff[51],ifu_bus_rdata_ff[50],ifu_bus_rdata_ff[49],_T_709,_T_733}; // @[el2_lib.scala 343:112]
  wire  _T_750 = ^_T_749; // @[el2_lib.scala 343:119]
  wire [6:0] _T_756 = {ifu_bus_rdata_ff[63],ifu_bus_rdata_ff[62],ifu_bus_rdata_ff[61],ifu_bus_rdata_ff[60],ifu_bus_rdata_ff[59],ifu_bus_rdata_ff[58],ifu_bus_rdata_ff[57]}; // @[el2_lib.scala 343:129]
  wire  _T_757 = ^_T_756; // @[el2_lib.scala 343:136]
  wire [3:0] _T_2277 = {ifu_bus_rid_ff[2:1],_T_2236,1'h1}; // @[Cat.scala 29:58]
  wire  _T_2278 = _T_2277 == 4'h0; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1284; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_0 = _T_1284[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2325 = _T_2278 ? ic_miss_buff_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire  _T_2281 = _T_2277 == 4'h1; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1286; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_1 = _T_1286[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2326 = _T_2281 ? ic_miss_buff_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2341 = _T_2325 | _T_2326; // @[Mux.scala 27:72]
  wire  _T_2284 = _T_2277 == 4'h2; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1288; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_2 = _T_1288[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2327 = _T_2284 ? ic_miss_buff_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2342 = _T_2341 | _T_2327; // @[Mux.scala 27:72]
  wire  _T_2287 = _T_2277 == 4'h3; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1290; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_3 = _T_1290[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2328 = _T_2287 ? ic_miss_buff_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2343 = _T_2342 | _T_2328; // @[Mux.scala 27:72]
  wire  _T_2290 = _T_2277 == 4'h4; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1292; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_4 = _T_1292[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2329 = _T_2290 ? ic_miss_buff_data_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2344 = _T_2343 | _T_2329; // @[Mux.scala 27:72]
  wire  _T_2293 = _T_2277 == 4'h5; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1294; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_5 = _T_1294[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2330 = _T_2293 ? ic_miss_buff_data_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2345 = _T_2344 | _T_2330; // @[Mux.scala 27:72]
  wire  _T_2296 = _T_2277 == 4'h6; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1296; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_6 = _T_1296[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2331 = _T_2296 ? ic_miss_buff_data_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2346 = _T_2345 | _T_2331; // @[Mux.scala 27:72]
  wire  _T_2299 = _T_2277 == 4'h7; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1298; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_7 = _T_1298[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2332 = _T_2299 ? ic_miss_buff_data_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2347 = _T_2346 | _T_2332; // @[Mux.scala 27:72]
  wire  _T_2302 = _T_2277 == 4'h8; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1300; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_8 = _T_1300[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2333 = _T_2302 ? ic_miss_buff_data_8 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2348 = _T_2347 | _T_2333; // @[Mux.scala 27:72]
  wire  _T_2305 = _T_2277 == 4'h9; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1302; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_9 = _T_1302[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2334 = _T_2305 ? ic_miss_buff_data_9 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2349 = _T_2348 | _T_2334; // @[Mux.scala 27:72]
  wire  _T_2308 = _T_2277 == 4'ha; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1304; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_10 = _T_1304[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2335 = _T_2308 ? ic_miss_buff_data_10 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2350 = _T_2349 | _T_2335; // @[Mux.scala 27:72]
  wire  _T_2311 = _T_2277 == 4'hb; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1306; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_11 = _T_1306[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2336 = _T_2311 ? ic_miss_buff_data_11 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2351 = _T_2350 | _T_2336; // @[Mux.scala 27:72]
  wire  _T_2314 = _T_2277 == 4'hc; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1308; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_12 = _T_1308[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2337 = _T_2314 ? ic_miss_buff_data_12 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2352 = _T_2351 | _T_2337; // @[Mux.scala 27:72]
  wire  _T_2317 = _T_2277 == 4'hd; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1310; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_13 = _T_1310[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2338 = _T_2317 ? ic_miss_buff_data_13 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2353 = _T_2352 | _T_2338; // @[Mux.scala 27:72]
  wire  _T_2320 = _T_2277 == 4'he; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1312; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_14 = _T_1312[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 445:26]
  wire [31:0] _T_2339 = _T_2320 ? ic_miss_buff_data_14 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2354 = _T_2353 | _T_2339; // @[Mux.scala 27:72]
  wire  _T_2323 = _T_2277 == 4'hf; // @[el2_ifu_mem_ctl.scala 510:89]
  reg [63:0] _T_1314; // @[Reg.scala 27:20]
  wire [31:0] ic_miss_buff_data_15 = _T_1314[31:0]; // @[el2_ifu_mem_ctl.scala 443:31 el2_ifu_mem_ctl.scala 446:28]
  wire [31:0] _T_2340 = _T_2323 ? ic_miss_buff_data_15 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2355 = _T_2354 | _T_2340; // @[Mux.scala 27:72]
  wire [3:0] _T_2357 = {ifu_bus_rid_ff[2:1],_T_2236,1'h0}; // @[Cat.scala 29:58]
  wire  _T_2358 = _T_2357 == 4'h0; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2381 = _T_2358 ? ic_miss_buff_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire  _T_2361 = _T_2357 == 4'h1; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2382 = _T_2361 ? ic_miss_buff_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2389 = _T_2381 | _T_2382; // @[Mux.scala 27:72]
  wire  _T_2364 = _T_2357 == 4'h2; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2383 = _T_2364 ? ic_miss_buff_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2390 = _T_2389 | _T_2383; // @[Mux.scala 27:72]
  wire  _T_2367 = _T_2357 == 4'h3; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2384 = _T_2367 ? ic_miss_buff_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2391 = _T_2390 | _T_2384; // @[Mux.scala 27:72]
  wire  _T_2370 = _T_2357 == 4'h4; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2385 = _T_2370 ? ic_miss_buff_data_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2392 = _T_2391 | _T_2385; // @[Mux.scala 27:72]
  wire  _T_2373 = _T_2357 == 4'h5; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2386 = _T_2373 ? ic_miss_buff_data_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2393 = _T_2392 | _T_2386; // @[Mux.scala 27:72]
  wire  _T_2376 = _T_2357 == 4'h6; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2387 = _T_2376 ? ic_miss_buff_data_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2394 = _T_2393 | _T_2387; // @[Mux.scala 27:72]
  wire  _T_2379 = _T_2357 == 4'h7; // @[el2_ifu_mem_ctl.scala 511:64]
  wire [31:0] _T_2388 = _T_2379 ? ic_miss_buff_data_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2395 = _T_2394 | _T_2388; // @[Mux.scala 27:72]
  wire [63:0] ic_miss_buff_half = {_T_2355,_T_2395}; // @[Cat.scala 29:58]
  wire [7:0] _T_981 = {ic_miss_buff_half[11],ic_miss_buff_half[10],ic_miss_buff_half[8],ic_miss_buff_half[6],ic_miss_buff_half[4],ic_miss_buff_half[3],ic_miss_buff_half[1],ic_miss_buff_half[0]}; // @[el2_lib.scala 343:27]
  wire [16:0] _T_990 = {ic_miss_buff_half[28],ic_miss_buff_half[26],ic_miss_buff_half[25],ic_miss_buff_half[23],ic_miss_buff_half[21],ic_miss_buff_half[19],ic_miss_buff_half[17],ic_miss_buff_half[15],ic_miss_buff_half[13],_T_981}; // @[el2_lib.scala 343:27]
  wire [8:0] _T_998 = {ic_miss_buff_half[46],ic_miss_buff_half[44],ic_miss_buff_half[42],ic_miss_buff_half[40],ic_miss_buff_half[38],ic_miss_buff_half[36],ic_miss_buff_half[34],ic_miss_buff_half[32],ic_miss_buff_half[30]}; // @[el2_lib.scala 343:27]
  wire [17:0] _T_1007 = {ic_miss_buff_half[63],ic_miss_buff_half[61],ic_miss_buff_half[59],ic_miss_buff_half[57],ic_miss_buff_half[56],ic_miss_buff_half[54],ic_miss_buff_half[52],ic_miss_buff_half[50],ic_miss_buff_half[48],_T_998}; // @[el2_lib.scala 343:27]
  wire [34:0] _T_1008 = {_T_1007,_T_990}; // @[el2_lib.scala 343:27]
  wire  _T_1009 = ^_T_1008; // @[el2_lib.scala 343:34]
  wire [7:0] _T_1016 = {ic_miss_buff_half[12],ic_miss_buff_half[10],ic_miss_buff_half[9],ic_miss_buff_half[6],ic_miss_buff_half[5],ic_miss_buff_half[3],ic_miss_buff_half[2],ic_miss_buff_half[0]}; // @[el2_lib.scala 343:44]
  wire [16:0] _T_1025 = {ic_miss_buff_half[28],ic_miss_buff_half[27],ic_miss_buff_half[25],ic_miss_buff_half[24],ic_miss_buff_half[21],ic_miss_buff_half[20],ic_miss_buff_half[17],ic_miss_buff_half[16],ic_miss_buff_half[13],_T_1016}; // @[el2_lib.scala 343:44]
  wire [8:0] _T_1033 = {ic_miss_buff_half[47],ic_miss_buff_half[44],ic_miss_buff_half[43],ic_miss_buff_half[40],ic_miss_buff_half[39],ic_miss_buff_half[36],ic_miss_buff_half[35],ic_miss_buff_half[32],ic_miss_buff_half[31]}; // @[el2_lib.scala 343:44]
  wire [17:0] _T_1042 = {ic_miss_buff_half[63],ic_miss_buff_half[62],ic_miss_buff_half[59],ic_miss_buff_half[58],ic_miss_buff_half[56],ic_miss_buff_half[55],ic_miss_buff_half[52],ic_miss_buff_half[51],ic_miss_buff_half[48],_T_1033}; // @[el2_lib.scala 343:44]
  wire [34:0] _T_1043 = {_T_1042,_T_1025}; // @[el2_lib.scala 343:44]
  wire  _T_1044 = ^_T_1043; // @[el2_lib.scala 343:51]
  wire [7:0] _T_1051 = {ic_miss_buff_half[14],ic_miss_buff_half[10],ic_miss_buff_half[9],ic_miss_buff_half[8],ic_miss_buff_half[7],ic_miss_buff_half[3],ic_miss_buff_half[2],ic_miss_buff_half[1]}; // @[el2_lib.scala 343:61]
  wire [16:0] _T_1060 = {ic_miss_buff_half[30],ic_miss_buff_half[29],ic_miss_buff_half[25],ic_miss_buff_half[24],ic_miss_buff_half[23],ic_miss_buff_half[22],ic_miss_buff_half[17],ic_miss_buff_half[16],ic_miss_buff_half[15],_T_1051}; // @[el2_lib.scala 343:61]
  wire [8:0] _T_1068 = {ic_miss_buff_half[47],ic_miss_buff_half[46],ic_miss_buff_half[45],ic_miss_buff_half[40],ic_miss_buff_half[39],ic_miss_buff_half[38],ic_miss_buff_half[37],ic_miss_buff_half[32],ic_miss_buff_half[31]}; // @[el2_lib.scala 343:61]
  wire [17:0] _T_1077 = {ic_miss_buff_half[63],ic_miss_buff_half[62],ic_miss_buff_half[61],ic_miss_buff_half[60],ic_miss_buff_half[56],ic_miss_buff_half[55],ic_miss_buff_half[54],ic_miss_buff_half[53],ic_miss_buff_half[48],_T_1068}; // @[el2_lib.scala 343:61]
  wire [34:0] _T_1078 = {_T_1077,_T_1060}; // @[el2_lib.scala 343:61]
  wire  _T_1079 = ^_T_1078; // @[el2_lib.scala 343:68]
  wire [6:0] _T_1085 = {ic_miss_buff_half[10],ic_miss_buff_half[9],ic_miss_buff_half[8],ic_miss_buff_half[7],ic_miss_buff_half[6],ic_miss_buff_half[5],ic_miss_buff_half[4]}; // @[el2_lib.scala 343:78]
  wire [14:0] _T_1093 = {ic_miss_buff_half[25],ic_miss_buff_half[24],ic_miss_buff_half[23],ic_miss_buff_half[22],ic_miss_buff_half[21],ic_miss_buff_half[20],ic_miss_buff_half[19],ic_miss_buff_half[18],_T_1085}; // @[el2_lib.scala 343:78]
  wire [7:0] _T_1100 = {ic_miss_buff_half[40],ic_miss_buff_half[39],ic_miss_buff_half[38],ic_miss_buff_half[37],ic_miss_buff_half[36],ic_miss_buff_half[35],ic_miss_buff_half[34],ic_miss_buff_half[33]}; // @[el2_lib.scala 343:78]
  wire [30:0] _T_1109 = {ic_miss_buff_half[56],ic_miss_buff_half[55],ic_miss_buff_half[54],ic_miss_buff_half[53],ic_miss_buff_half[52],ic_miss_buff_half[51],ic_miss_buff_half[50],ic_miss_buff_half[49],_T_1100,_T_1093}; // @[el2_lib.scala 343:78]
  wire  _T_1110 = ^_T_1109; // @[el2_lib.scala 343:85]
  wire [6:0] _T_1116 = {ic_miss_buff_half[17],ic_miss_buff_half[16],ic_miss_buff_half[15],ic_miss_buff_half[14],ic_miss_buff_half[13],ic_miss_buff_half[12],ic_miss_buff_half[11]}; // @[el2_lib.scala 343:95]
  wire [14:0] _T_1124 = {ic_miss_buff_half[25],ic_miss_buff_half[24],ic_miss_buff_half[23],ic_miss_buff_half[22],ic_miss_buff_half[21],ic_miss_buff_half[20],ic_miss_buff_half[19],ic_miss_buff_half[18],_T_1116}; // @[el2_lib.scala 343:95]
  wire [7:0] _T_1131 = {ic_miss_buff_half[48],ic_miss_buff_half[47],ic_miss_buff_half[46],ic_miss_buff_half[45],ic_miss_buff_half[44],ic_miss_buff_half[43],ic_miss_buff_half[42],ic_miss_buff_half[41]}; // @[el2_lib.scala 343:95]
  wire [30:0] _T_1140 = {ic_miss_buff_half[56],ic_miss_buff_half[55],ic_miss_buff_half[54],ic_miss_buff_half[53],ic_miss_buff_half[52],ic_miss_buff_half[51],ic_miss_buff_half[50],ic_miss_buff_half[49],_T_1131,_T_1124}; // @[el2_lib.scala 343:95]
  wire  _T_1141 = ^_T_1140; // @[el2_lib.scala 343:102]
  wire [6:0] _T_1147 = {ic_miss_buff_half[32],ic_miss_buff_half[31],ic_miss_buff_half[30],ic_miss_buff_half[29],ic_miss_buff_half[28],ic_miss_buff_half[27],ic_miss_buff_half[26]}; // @[el2_lib.scala 343:112]
  wire [14:0] _T_1155 = {ic_miss_buff_half[40],ic_miss_buff_half[39],ic_miss_buff_half[38],ic_miss_buff_half[37],ic_miss_buff_half[36],ic_miss_buff_half[35],ic_miss_buff_half[34],ic_miss_buff_half[33],_T_1147}; // @[el2_lib.scala 343:112]
  wire [30:0] _T_1171 = {ic_miss_buff_half[56],ic_miss_buff_half[55],ic_miss_buff_half[54],ic_miss_buff_half[53],ic_miss_buff_half[52],ic_miss_buff_half[51],ic_miss_buff_half[50],ic_miss_buff_half[49],_T_1131,_T_1155}; // @[el2_lib.scala 343:112]
  wire  _T_1172 = ^_T_1171; // @[el2_lib.scala 343:119]
  wire [6:0] _T_1178 = {ic_miss_buff_half[63],ic_miss_buff_half[62],ic_miss_buff_half[61],ic_miss_buff_half[60],ic_miss_buff_half[59],ic_miss_buff_half[58],ic_miss_buff_half[57]}; // @[el2_lib.scala 343:129]
  wire  _T_1179 = ^_T_1178; // @[el2_lib.scala 343:136]
  wire [70:0] _T_1226 = {_T_587,_T_622,_T_657,_T_688,_T_719,_T_750,_T_757,ifu_bus_rdata_ff}; // @[Cat.scala 29:58]
  wire [70:0] _T_1225 = {_T_1009,_T_1044,_T_1079,_T_1110,_T_1141,_T_1172,_T_1179,_T_2355,_T_2395}; // @[Cat.scala 29:58]
  wire [141:0] _T_1227 = {_T_587,_T_622,_T_657,_T_688,_T_719,_T_750,_T_757,ifu_bus_rdata_ff,_T_1225}; // @[Cat.scala 29:58]
  wire [141:0] _T_1230 = {_T_1009,_T_1044,_T_1079,_T_1110,_T_1141,_T_1172,_T_1179,_T_2355,_T_2395,_T_1226}; // @[Cat.scala 29:58]
  wire [141:0] ic_wr_16bytes_data = ifu_bus_rid_ff[0] ? _T_1227 : _T_1230; // @[el2_ifu_mem_ctl.scala 404:28]
  wire  _T_1187 = |io_ic_eccerr; // @[el2_ifu_mem_ctl.scala 394:56]
  wire  _T_1188 = _T_1187 & ic_act_hit_f; // @[el2_ifu_mem_ctl.scala 394:83]
  wire [4:0] bypass_index = imb_ff[4:0]; // @[el2_ifu_mem_ctl.scala 457:28]
  wire  _T_1390 = bypass_index[4:2] == 3'h0; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  bus_ifu_wr_en = _T_14 & miss_pending; // @[el2_ifu_mem_ctl.scala 655:35]
  wire  _T_1275 = io_ifu_axi_rid == 3'h0; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_0 = bus_ifu_wr_en & _T_1275; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1316 = ~ic_act_miss_f; // @[el2_ifu_mem_ctl.scala 448:118]
  wire  _T_1317 = ic_miss_buff_data_valid[0] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_0 = write_fill_data_0 | _T_1317; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1413 = _T_1390 & ic_miss_buff_data_valid_in_0; // @[Mux.scala 27:72]
  wire  _T_1393 = bypass_index[4:2] == 3'h1; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1276 = io_ifu_axi_rid == 3'h1; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_1 = bus_ifu_wr_en & _T_1276; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1320 = ic_miss_buff_data_valid[1] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_1 = write_fill_data_1 | _T_1320; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1414 = _T_1393 & ic_miss_buff_data_valid_in_1; // @[Mux.scala 27:72]
  wire  _T_1421 = _T_1413 | _T_1414; // @[Mux.scala 27:72]
  wire  _T_1396 = bypass_index[4:2] == 3'h2; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1277 = io_ifu_axi_rid == 3'h2; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_2 = bus_ifu_wr_en & _T_1277; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1323 = ic_miss_buff_data_valid[2] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_2 = write_fill_data_2 | _T_1323; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1415 = _T_1396 & ic_miss_buff_data_valid_in_2; // @[Mux.scala 27:72]
  wire  _T_1422 = _T_1421 | _T_1415; // @[Mux.scala 27:72]
  wire  _T_1399 = bypass_index[4:2] == 3'h3; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1278 = io_ifu_axi_rid == 3'h3; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_3 = bus_ifu_wr_en & _T_1278; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1326 = ic_miss_buff_data_valid[3] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_3 = write_fill_data_3 | _T_1326; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1416 = _T_1399 & ic_miss_buff_data_valid_in_3; // @[Mux.scala 27:72]
  wire  _T_1423 = _T_1422 | _T_1416; // @[Mux.scala 27:72]
  wire  _T_1402 = bypass_index[4:2] == 3'h4; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1279 = io_ifu_axi_rid == 3'h4; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_4 = bus_ifu_wr_en & _T_1279; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1329 = ic_miss_buff_data_valid[4] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_4 = write_fill_data_4 | _T_1329; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1417 = _T_1402 & ic_miss_buff_data_valid_in_4; // @[Mux.scala 27:72]
  wire  _T_1424 = _T_1423 | _T_1417; // @[Mux.scala 27:72]
  wire  _T_1405 = bypass_index[4:2] == 3'h5; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1280 = io_ifu_axi_rid == 3'h5; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_5 = bus_ifu_wr_en & _T_1280; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1332 = ic_miss_buff_data_valid[5] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_5 = write_fill_data_5 | _T_1332; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1418 = _T_1405 & ic_miss_buff_data_valid_in_5; // @[Mux.scala 27:72]
  wire  _T_1425 = _T_1424 | _T_1418; // @[Mux.scala 27:72]
  wire  _T_1408 = bypass_index[4:2] == 3'h6; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1281 = io_ifu_axi_rid == 3'h6; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_6 = bus_ifu_wr_en & _T_1281; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1335 = ic_miss_buff_data_valid[6] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_6 = write_fill_data_6 | _T_1335; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1419 = _T_1408 & ic_miss_buff_data_valid_in_6; // @[Mux.scala 27:72]
  wire  _T_1426 = _T_1425 | _T_1419; // @[Mux.scala 27:72]
  wire  _T_1411 = bypass_index[4:2] == 3'h7; // @[el2_ifu_mem_ctl.scala 459:114]
  wire  _T_1282 = io_ifu_axi_rid == 3'h7; // @[el2_ifu_mem_ctl.scala 442:91]
  wire  write_fill_data_7 = bus_ifu_wr_en & _T_1282; // @[el2_ifu_mem_ctl.scala 442:73]
  wire  _T_1338 = ic_miss_buff_data_valid[7] & _T_1316; // @[el2_ifu_mem_ctl.scala 448:116]
  wire  ic_miss_buff_data_valid_in_7 = write_fill_data_7 | _T_1338; // @[el2_ifu_mem_ctl.scala 448:88]
  wire  _T_1420 = _T_1411 & ic_miss_buff_data_valid_in_7; // @[Mux.scala 27:72]
  wire  bypass_valid_value_check = _T_1426 | _T_1420; // @[Mux.scala 27:72]
  wire  _T_1429 = ~bypass_index[1]; // @[el2_ifu_mem_ctl.scala 460:58]
  wire  _T_1430 = bypass_valid_value_check & _T_1429; // @[el2_ifu_mem_ctl.scala 460:56]
  wire  _T_1432 = ~bypass_index[0]; // @[el2_ifu_mem_ctl.scala 460:77]
  wire  _T_1433 = _T_1430 & _T_1432; // @[el2_ifu_mem_ctl.scala 460:75]
  wire  _T_1438 = _T_1430 & bypass_index[0]; // @[el2_ifu_mem_ctl.scala 461:75]
  wire  _T_1439 = _T_1433 | _T_1438; // @[el2_ifu_mem_ctl.scala 460:95]
  wire  _T_1441 = bypass_valid_value_check & bypass_index[1]; // @[el2_ifu_mem_ctl.scala 462:56]
  wire  _T_1444 = _T_1441 & _T_1432; // @[el2_ifu_mem_ctl.scala 462:74]
  wire  _T_1445 = _T_1439 | _T_1444; // @[el2_ifu_mem_ctl.scala 461:94]
  wire  _T_1449 = _T_1441 & bypass_index[0]; // @[el2_ifu_mem_ctl.scala 463:51]
  wire [2:0] bypass_index_5_3_inc = bypass_index[4:2] + 3'h1; // @[el2_ifu_mem_ctl.scala 458:70]
  wire  _T_1450 = bypass_index_5_3_inc == 3'h0; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1466 = _T_1450 & ic_miss_buff_data_valid_in_0; // @[Mux.scala 27:72]
  wire  _T_1452 = bypass_index_5_3_inc == 3'h1; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1467 = _T_1452 & ic_miss_buff_data_valid_in_1; // @[Mux.scala 27:72]
  wire  _T_1474 = _T_1466 | _T_1467; // @[Mux.scala 27:72]
  wire  _T_1454 = bypass_index_5_3_inc == 3'h2; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1468 = _T_1454 & ic_miss_buff_data_valid_in_2; // @[Mux.scala 27:72]
  wire  _T_1475 = _T_1474 | _T_1468; // @[Mux.scala 27:72]
  wire  _T_1456 = bypass_index_5_3_inc == 3'h3; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1469 = _T_1456 & ic_miss_buff_data_valid_in_3; // @[Mux.scala 27:72]
  wire  _T_1476 = _T_1475 | _T_1469; // @[Mux.scala 27:72]
  wire  _T_1458 = bypass_index_5_3_inc == 3'h4; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1470 = _T_1458 & ic_miss_buff_data_valid_in_4; // @[Mux.scala 27:72]
  wire  _T_1477 = _T_1476 | _T_1470; // @[Mux.scala 27:72]
  wire  _T_1460 = bypass_index_5_3_inc == 3'h5; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1471 = _T_1460 & ic_miss_buff_data_valid_in_5; // @[Mux.scala 27:72]
  wire  _T_1478 = _T_1477 | _T_1471; // @[Mux.scala 27:72]
  wire  _T_1462 = bypass_index_5_3_inc == 3'h6; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1472 = _T_1462 & ic_miss_buff_data_valid_in_6; // @[Mux.scala 27:72]
  wire  _T_1479 = _T_1478 | _T_1472; // @[Mux.scala 27:72]
  wire  _T_1464 = bypass_index_5_3_inc == 3'h7; // @[el2_ifu_mem_ctl.scala 463:132]
  wire  _T_1473 = _T_1464 & ic_miss_buff_data_valid_in_7; // @[Mux.scala 27:72]
  wire  _T_1480 = _T_1479 | _T_1473; // @[Mux.scala 27:72]
  wire  _T_1482 = _T_1449 & _T_1480; // @[el2_ifu_mem_ctl.scala 463:69]
  wire  _T_1483 = _T_1445 | _T_1482; // @[el2_ifu_mem_ctl.scala 462:94]
  wire [4:0] _GEN_437 = {{2'd0}, bypass_index[4:2]}; // @[el2_ifu_mem_ctl.scala 464:95]
  wire  _T_1486 = _GEN_437 == 5'h1f; // @[el2_ifu_mem_ctl.scala 464:95]
  wire  _T_1487 = bypass_valid_value_check & _T_1486; // @[el2_ifu_mem_ctl.scala 464:56]
  wire  bypass_data_ready_in = _T_1483 | _T_1487; // @[el2_ifu_mem_ctl.scala 463:181]
  wire  _T_1488 = bypass_data_ready_in & crit_wd_byp_ok_ff; // @[el2_ifu_mem_ctl.scala 468:53]
  wire  _T_1489 = _T_1488 & uncacheable_miss_ff; // @[el2_ifu_mem_ctl.scala 468:73]
  wire  _T_1491 = _T_1489 & _T_308; // @[el2_ifu_mem_ctl.scala 468:96]
  wire  _T_1493 = _T_1491 & _T_61; // @[el2_ifu_mem_ctl.scala 468:118]
  wire  _T_1495 = crit_wd_byp_ok_ff & _T_52; // @[el2_ifu_mem_ctl.scala 469:73]
  wire  _T_1497 = _T_1495 & _T_308; // @[el2_ifu_mem_ctl.scala 469:96]
  wire  _T_1499 = _T_1497 & _T_61; // @[el2_ifu_mem_ctl.scala 469:118]
  wire  _T_1500 = _T_1493 | _T_1499; // @[el2_ifu_mem_ctl.scala 468:143]
  reg  ic_crit_wd_rdy_new_ff; // @[el2_ifu_mem_ctl.scala 471:58]
  wire  _T_1501 = ic_crit_wd_rdy_new_ff & crit_wd_byp_ok_ff; // @[el2_ifu_mem_ctl.scala 470:54]
  wire  _T_1502 = ~fetch_req_icache_f; // @[el2_ifu_mem_ctl.scala 470:76]
  wire  _T_1503 = _T_1501 & _T_1502; // @[el2_ifu_mem_ctl.scala 470:74]
  wire  _T_1505 = _T_1503 & _T_308; // @[el2_ifu_mem_ctl.scala 470:96]
  wire  ic_crit_wd_rdy_new_in = _T_1500 | _T_1505; // @[el2_ifu_mem_ctl.scala 469:143]
  wire  ic_crit_wd_rdy = ic_crit_wd_rdy_new_in | ic_crit_wd_rdy_new_ff; // @[el2_ifu_mem_ctl.scala 665:43]
  wire  _T_1242 = ic_crit_wd_rdy | _T_2216; // @[el2_ifu_mem_ctl.scala 416:38]
  wire  _T_1244 = _T_1242 | _T_2231; // @[el2_ifu_mem_ctl.scala 416:64]
  wire  _T_1245 = ~_T_1244; // @[el2_ifu_mem_ctl.scala 416:21]
  wire  _T_1246 = ~fetch_req_iccm_f; // @[el2_ifu_mem_ctl.scala 416:98]
  wire  sel_ic_data = _T_1245 & _T_1246; // @[el2_ifu_mem_ctl.scala 416:96]
  wire  _T_2398 = io_ic_tag_perr & sel_ic_data; // @[el2_ifu_mem_ctl.scala 513:44]
  wire  _T_1599 = ifu_fetch_addr_int_f[1] & ifu_fetch_addr_int_f[0]; // @[el2_ifu_mem_ctl.scala 482:31]
  reg [7:0] ic_miss_buff_data_error; // @[el2_ifu_mem_ctl.scala 454:60]
  wire  _T_1543 = _T_1390 & ic_miss_buff_data_error[0]; // @[Mux.scala 27:72]
  wire  _T_1544 = _T_1393 & ic_miss_buff_data_error[1]; // @[Mux.scala 27:72]
  wire  _T_1551 = _T_1543 | _T_1544; // @[Mux.scala 27:72]
  wire  _T_1545 = _T_1396 & ic_miss_buff_data_error[2]; // @[Mux.scala 27:72]
  wire  _T_1552 = _T_1551 | _T_1545; // @[Mux.scala 27:72]
  wire  _T_1546 = _T_1399 & ic_miss_buff_data_error[3]; // @[Mux.scala 27:72]
  wire  _T_1553 = _T_1552 | _T_1546; // @[Mux.scala 27:72]
  wire  _T_1547 = _T_1402 & ic_miss_buff_data_error[4]; // @[Mux.scala 27:72]
  wire  _T_1554 = _T_1553 | _T_1547; // @[Mux.scala 27:72]
  wire  _T_1548 = _T_1405 & ic_miss_buff_data_error[5]; // @[Mux.scala 27:72]
  wire  _T_1555 = _T_1554 | _T_1548; // @[Mux.scala 27:72]
  wire  _T_1549 = _T_1408 & ic_miss_buff_data_error[6]; // @[Mux.scala 27:72]
  wire  _T_1556 = _T_1555 | _T_1549; // @[Mux.scala 27:72]
  wire  _T_1550 = _T_1411 & ic_miss_buff_data_error[7]; // @[Mux.scala 27:72]
  wire  ic_miss_buff_data_error_bypass = _T_1556 | _T_1550; // @[Mux.scala 27:72]
  wire  _T_1582 = _T_2143 & ic_miss_buff_data_error[0]; // @[Mux.scala 27:72]
  wire  _T_1583 = _T_2146 & ic_miss_buff_data_error[1]; // @[Mux.scala 27:72]
  wire  _T_1590 = _T_1582 | _T_1583; // @[Mux.scala 27:72]
  wire  _T_1584 = _T_2149 & ic_miss_buff_data_error[2]; // @[Mux.scala 27:72]
  wire  _T_1591 = _T_1590 | _T_1584; // @[Mux.scala 27:72]
  wire  _T_1585 = _T_2152 & ic_miss_buff_data_error[3]; // @[Mux.scala 27:72]
  wire  _T_1592 = _T_1591 | _T_1585; // @[Mux.scala 27:72]
  wire  _T_1586 = _T_2155 & ic_miss_buff_data_error[4]; // @[Mux.scala 27:72]
  wire  _T_1593 = _T_1592 | _T_1586; // @[Mux.scala 27:72]
  wire  _T_1587 = _T_2158 & ic_miss_buff_data_error[5]; // @[Mux.scala 27:72]
  wire  _T_1594 = _T_1593 | _T_1587; // @[Mux.scala 27:72]
  wire  _T_1588 = _T_2161 & ic_miss_buff_data_error[6]; // @[Mux.scala 27:72]
  wire  _T_1595 = _T_1594 | _T_1588; // @[Mux.scala 27:72]
  wire  _T_1589 = _T_2164 & ic_miss_buff_data_error[7]; // @[Mux.scala 27:72]
  wire  ic_miss_buff_data_error_bypass_inc = _T_1595 | _T_1589; // @[Mux.scala 27:72]
  wire  _T_1600 = ic_miss_buff_data_error_bypass | ic_miss_buff_data_error_bypass_inc; // @[el2_ifu_mem_ctl.scala 484:70]
  wire  ifu_byp_data_err_new = _T_1599 ? ic_miss_buff_data_error_bypass : _T_1600; // @[el2_ifu_mem_ctl.scala 482:56]
  wire  ifc_bus_acc_fault_f = ic_byp_hit_f & ifu_byp_data_err_new; // @[el2_ifu_mem_ctl.scala 426:42]
  wire  _T_2400 = ~ifc_bus_acc_fault_f; // @[el2_ifu_mem_ctl.scala 513:60]
  wire  ic_rd_parity_final_err = _T_2398 & _T_2400; // @[el2_ifu_mem_ctl.scala 513:58]
  reg [70:0] _T_1200; // @[el2_ifu_mem_ctl.scala 400:37]
  wire  ifu_wr_cumulative_err = ifu_wr_cumulative_err_data & _T_2528; // @[el2_ifu_mem_ctl.scala 410:80]
  wire  fetch_req_f_qual = io_ic_hit_f & _T_308; // @[el2_ifu_mem_ctl.scala 428:38]
  wire [1:0] _T_1264 = ifc_region_acc_fault_f ? 2'h2 : 2'h0; // @[el2_ifu_mem_ctl.scala 432:8]
  wire [7:0] _T_1345 = {ic_miss_buff_data_valid_in_7,ic_miss_buff_data_valid_in_6,ic_miss_buff_data_valid_in_5,ic_miss_buff_data_valid_in_4,ic_miss_buff_data_valid_in_3,ic_miss_buff_data_valid_in_2,ic_miss_buff_data_valid_in_1,ic_miss_buff_data_valid_in_0}; // @[Cat.scala 29:58]
  wire  _T_1350 = ic_miss_buff_data_error[0] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  _T_2596 = |io_ifu_axi_rresp; // @[el2_ifu_mem_ctl.scala 661:47]
  wire  _T_2597 = _T_2596 & _T_14; // @[el2_ifu_mem_ctl.scala 661:50]
  wire  bus_ifu_wr_data_error = _T_2597 & miss_pending; // @[el2_ifu_mem_ctl.scala 661:68]
  wire  ic_miss_buff_data_error_in_0 = write_fill_data_0 ? bus_ifu_wr_data_error : _T_1350; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1354 = ic_miss_buff_data_error[1] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_1 = write_fill_data_1 ? bus_ifu_wr_data_error : _T_1354; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1358 = ic_miss_buff_data_error[2] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_2 = write_fill_data_2 ? bus_ifu_wr_data_error : _T_1358; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1362 = ic_miss_buff_data_error[3] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_3 = write_fill_data_3 ? bus_ifu_wr_data_error : _T_1362; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1366 = ic_miss_buff_data_error[4] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_4 = write_fill_data_4 ? bus_ifu_wr_data_error : _T_1366; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1370 = ic_miss_buff_data_error[5] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_5 = write_fill_data_5 ? bus_ifu_wr_data_error : _T_1370; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1374 = ic_miss_buff_data_error[6] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_6 = write_fill_data_6 ? bus_ifu_wr_data_error : _T_1374; // @[el2_ifu_mem_ctl.scala 452:72]
  wire  _T_1378 = ic_miss_buff_data_error[7] & _T_1316; // @[el2_ifu_mem_ctl.scala 453:32]
  wire  ic_miss_buff_data_error_in_7 = write_fill_data_7 ? bus_ifu_wr_data_error : _T_1378; // @[el2_ifu_mem_ctl.scala 452:72]
  wire [7:0] _T_1385 = {ic_miss_buff_data_error_in_7,ic_miss_buff_data_error_in_6,ic_miss_buff_data_error_in_5,ic_miss_buff_data_error_in_4,ic_miss_buff_data_error_in_3,ic_miss_buff_data_error_in_2,ic_miss_buff_data_error_in_1,ic_miss_buff_data_error_in_0}; // @[Cat.scala 29:58]
  wire  _T_2404 = 3'h0 == perr_state; // @[Conditional.scala 37:30]
  wire  _T_2412 = _T_7 & _T_308; // @[el2_ifu_mem_ctl.scala 531:65]
  wire  _T_2413 = _T_2412 | io_iccm_dma_sb_error; // @[el2_ifu_mem_ctl.scala 531:88]
  wire  _T_2415 = _T_2413 & _T_2524; // @[el2_ifu_mem_ctl.scala 531:112]
  wire  _T_2416 = 3'h1 == perr_state; // @[Conditional.scala 37:30]
  wire  _T_2417 = io_dec_tlu_flush_lower_wb | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 536:50]
  wire  _T_2419 = 3'h2 == perr_state; // @[Conditional.scala 37:30]
  wire  _T_2425 = 3'h4 == perr_state; // @[Conditional.scala 37:30]
  wire  _T_2427 = 3'h3 == perr_state; // @[Conditional.scala 37:30]
  wire  _GEN_38 = _T_2425 | _T_2427; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_2419 ? _T_2417 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_2416 ? _T_2417 : _GEN_40; // @[Conditional.scala 39:67]
  wire  perr_state_en = _T_2404 ? _T_2415 : _GEN_42; // @[Conditional.scala 40:58]
  wire  _T_2406 = io_ic_error_start & _T_308; // @[el2_ifu_mem_ctl.scala 530:87]
  wire  _T_2420 = io_dec_tlu_flush_err_wb & io_dec_tlu_flush_lower_wb; // @[el2_ifu_mem_ctl.scala 540:54]
  wire  _T_2421 = _T_2420 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 540:84]
  wire  _T_2430 = perr_state == 3'h2; // @[el2_ifu_mem_ctl.scala 561:66]
  wire  _T_2431 = io_dec_tlu_flush_err_wb & _T_2430; // @[el2_ifu_mem_ctl.scala 561:52]
  wire  _T_2433 = _T_2431 & _T_2524; // @[el2_ifu_mem_ctl.scala 561:81]
  wire  _T_2435 = io_dec_tlu_flush_lower_wb | io_dec_tlu_i0_commit_cmt; // @[el2_ifu_mem_ctl.scala 564:59]
  wire  _T_2436 = _T_2435 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 564:86]
  wire  _T_2450 = _T_2435 | io_ifu_fetch_val[0]; // @[el2_ifu_mem_ctl.scala 567:81]
  wire  _T_2451 = _T_2450 | ifu_bp_hit_taken_q_f; // @[el2_ifu_mem_ctl.scala 567:103]
  wire  _T_2452 = _T_2451 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 567:126]
  wire  _T_2472 = _T_2450 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 574:103]
  wire  _T_2479 = ~io_dec_tlu_flush_err_wb; // @[el2_ifu_mem_ctl.scala 579:62]
  wire  _T_2480 = io_dec_tlu_flush_lower_wb & _T_2479; // @[el2_ifu_mem_ctl.scala 579:60]
  wire  _T_2481 = _T_2480 | io_dec_tlu_i0_commit_cmt; // @[el2_ifu_mem_ctl.scala 579:88]
  wire  _T_2482 = _T_2481 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 579:115]
  wire  _GEN_50 = _T_2478 & _T_2436; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_2461 ? _T_2472 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_2434 ? _T_2452 : _GEN_53; // @[Conditional.scala 39:67]
  wire  err_stop_state_en = _T_2429 ? _T_2433 : _GEN_57; // @[Conditional.scala 40:58]
  reg  ifu_bus_cmd_valid; // @[Reg.scala 27:20]
  wire  _T_2492 = ic_act_miss_f | ifu_bus_cmd_valid; // @[el2_ifu_mem_ctl.scala 595:64]
  wire  _T_2494 = _T_2492 & _T_2524; // @[el2_ifu_mem_ctl.scala 595:85]
  reg [2:0] bus_cmd_beat_count; // @[Reg.scala 27:20]
  wire  _T_2496 = bus_cmd_beat_count == 3'h7; // @[el2_ifu_mem_ctl.scala 595:133]
  wire  _T_2497 = _T_2496 & ifu_bus_cmd_valid; // @[el2_ifu_mem_ctl.scala 595:164]
  wire  _T_2498 = _T_2497 & io_ifu_axi_arready; // @[el2_ifu_mem_ctl.scala 595:184]
  wire  _T_2499 = _T_2498 & miss_pending; // @[el2_ifu_mem_ctl.scala 595:204]
  wire  _T_2500 = ~_T_2499; // @[el2_ifu_mem_ctl.scala 595:112]
  wire  ifc_bus_ic_req_ff_in = _T_2494 & _T_2500; // @[el2_ifu_mem_ctl.scala 595:110]
  wire  _T_2501 = io_ifu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 596:80]
  wire  ifu_bus_arready = io_ifu_axi_arready & io_ifu_bus_clk_en; // @[el2_ifu_mem_ctl.scala 627:45]
  wire  _T_2518 = io_ifu_axi_arvalid & ifu_bus_arready; // @[el2_ifu_mem_ctl.scala 630:35]
  wire  _T_2519 = _T_2518 & miss_pending; // @[el2_ifu_mem_ctl.scala 630:53]
  wire  bus_cmd_sent = _T_2519 & _T_2524; // @[el2_ifu_mem_ctl.scala 630:68]
  wire [2:0] _T_2509 = ifu_bus_cmd_valid ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_2511 = {miss_addr,bus_rd_addr_count,3'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_2513 = ifu_bus_cmd_valid ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  _T_2542 = last_data_recieved_ff & _T_1316; // @[el2_ifu_mem_ctl.scala 638:114]
  wire  last_data_recieved_in = _T_2525 | _T_2542; // @[el2_ifu_mem_ctl.scala 638:89]
  wire [2:0] _T_2548 = bus_rd_addr_count + 3'h1; // @[el2_ifu_mem_ctl.scala 643:45]
  wire  _T_2551 = io_ifu_bus_clk_en | ic_act_miss_f; // @[el2_ifu_mem_ctl.scala 644:81]
  wire  _T_2552 = _T_2551 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 644:97]
  wire  _T_2554 = ifu_bus_cmd_valid & io_ifu_axi_arready; // @[el2_ifu_mem_ctl.scala 646:48]
  wire  _T_2555 = _T_2554 & miss_pending; // @[el2_ifu_mem_ctl.scala 646:68]
  wire  bus_inc_cmd_beat_cnt = _T_2555 & _T_2524; // @[el2_ifu_mem_ctl.scala 646:83]
  wire  bus_reset_cmd_beat_cnt_secondlast = ic_act_miss_f & uncacheable_miss_in; // @[el2_ifu_mem_ctl.scala 648:57]
  wire  _T_2559 = ~bus_inc_cmd_beat_cnt; // @[el2_ifu_mem_ctl.scala 649:31]
  wire  _T_2561 = ic_act_miss_f | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 649:87]
  wire  _T_2562 = ~_T_2561; // @[el2_ifu_mem_ctl.scala 649:55]
  wire  bus_hold_cmd_beat_cnt = _T_2559 & _T_2562; // @[el2_ifu_mem_ctl.scala 649:53]
  wire  _T_2563 = bus_inc_cmd_beat_cnt | ic_act_miss_f; // @[el2_ifu_mem_ctl.scala 650:46]
  wire  bus_cmd_beat_en = _T_2563 | io_dec_tlu_force_halt; // @[el2_ifu_mem_ctl.scala 650:62]
  wire [2:0] _T_2566 = bus_cmd_beat_count + 3'h1; // @[el2_ifu_mem_ctl.scala 652:46]
  wire [2:0] _T_2568 = bus_reset_cmd_beat_cnt_secondlast ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2569 = bus_inc_cmd_beat_cnt ? _T_2566 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2570 = bus_hold_cmd_beat_cnt ? bus_cmd_beat_count : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2572 = _T_2568 | _T_2569; // @[Mux.scala 27:72]
  wire [2:0] bus_new_cmd_beat_count = _T_2572 | _T_2570; // @[Mux.scala 27:72]
  wire  _T_2576 = _T_2552 & bus_cmd_beat_en; // @[el2_ifu_mem_ctl.scala 653:125]
  reg  ifc_dma_access_ok_prev; // @[el2_ifu_mem_ctl.scala 664:62]
  wire  _T_2604 = ~iccm_correct_ecc; // @[el2_ifu_mem_ctl.scala 669:50]
  wire  _T_2605 = io_ifc_dma_access_ok & _T_2604; // @[el2_ifu_mem_ctl.scala 669:47]
  wire  _T_2606 = ~io_iccm_dma_sb_error; // @[el2_ifu_mem_ctl.scala 669:70]
  wire  ifc_dma_access_ok_d = _T_2605 & _T_2606; // @[el2_ifu_mem_ctl.scala 669:68]
  wire  _T_2610 = _T_2605 & ifc_dma_access_ok_prev; // @[el2_ifu_mem_ctl.scala 670:72]
  wire  _T_2611 = perr_state == 3'h0; // @[el2_ifu_mem_ctl.scala 670:111]
  wire  _T_2612 = _T_2610 & _T_2611; // @[el2_ifu_mem_ctl.scala 670:97]
  wire  iccm_ready = _T_2612 & _T_2606; // @[el2_ifu_mem_ctl.scala 670:127]
  wire  _T_2615 = iccm_ready & io_dma_iccm_req; // @[el2_ifu_mem_ctl.scala 673:40]
  wire  _T_2616 = _T_2615 & io_dma_mem_write; // @[el2_ifu_mem_ctl.scala 673:58]
  wire  _T_2619 = ~io_dma_mem_write; // @[el2_ifu_mem_ctl.scala 674:60]
  wire  _T_2620 = _T_2615 & _T_2619; // @[el2_ifu_mem_ctl.scala 674:58]
  wire  _T_2621 = io_ifc_iccm_access_bf & io_ifc_fetch_req_bf; // @[el2_ifu_mem_ctl.scala 674:104]
  wire [2:0] _T_2626 = io_dma_iccm_req ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_2732 = {io_dma_mem_wdata[48],io_dma_mem_wdata[46],io_dma_mem_wdata[44],io_dma_mem_wdata[42],io_dma_mem_wdata[40],io_dma_mem_wdata[38],io_dma_mem_wdata[37],io_dma_mem_wdata[35],io_dma_mem_wdata[33]}; // @[el2_lib.scala 263:22]
  wire [17:0] _T_2741 = {io_dma_mem_wdata[63],io_dma_mem_wdata[62],io_dma_mem_wdata[60],io_dma_mem_wdata[59],io_dma_mem_wdata[57],io_dma_mem_wdata[55],io_dma_mem_wdata[53],io_dma_mem_wdata[52],io_dma_mem_wdata[50],_T_2732}; // @[el2_lib.scala 263:22]
  wire  _T_2742 = ^_T_2741; // @[el2_lib.scala 263:29]
  wire [8:0] _T_2750 = {io_dma_mem_wdata[47],io_dma_mem_wdata[46],io_dma_mem_wdata[43],io_dma_mem_wdata[42],io_dma_mem_wdata[39],io_dma_mem_wdata[38],io_dma_mem_wdata[36],io_dma_mem_wdata[35],io_dma_mem_wdata[32]}; // @[el2_lib.scala 263:39]
  wire [17:0] _T_2759 = {io_dma_mem_wdata[63],io_dma_mem_wdata[61],io_dma_mem_wdata[60],io_dma_mem_wdata[58],io_dma_mem_wdata[57],io_dma_mem_wdata[54],io_dma_mem_wdata[53],io_dma_mem_wdata[51],io_dma_mem_wdata[50],_T_2750}; // @[el2_lib.scala 263:39]
  wire  _T_2760 = ^_T_2759; // @[el2_lib.scala 263:46]
  wire [8:0] _T_2768 = {io_dma_mem_wdata[47],io_dma_mem_wdata[46],io_dma_mem_wdata[41],io_dma_mem_wdata[40],io_dma_mem_wdata[39],io_dma_mem_wdata[38],io_dma_mem_wdata[34],io_dma_mem_wdata[33],io_dma_mem_wdata[32]}; // @[el2_lib.scala 263:56]
  wire [17:0] _T_2777 = {io_dma_mem_wdata[62],io_dma_mem_wdata[61],io_dma_mem_wdata[60],io_dma_mem_wdata[56],io_dma_mem_wdata[55],io_dma_mem_wdata[54],io_dma_mem_wdata[53],io_dma_mem_wdata[49],io_dma_mem_wdata[48],_T_2768}; // @[el2_lib.scala 263:56]
  wire  _T_2778 = ^_T_2777; // @[el2_lib.scala 263:63]
  wire [6:0] _T_2784 = {io_dma_mem_wdata[44],io_dma_mem_wdata[43],io_dma_mem_wdata[42],io_dma_mem_wdata[41],io_dma_mem_wdata[40],io_dma_mem_wdata[39],io_dma_mem_wdata[38]}; // @[el2_lib.scala 263:73]
  wire [14:0] _T_2792 = {io_dma_mem_wdata[59],io_dma_mem_wdata[58],io_dma_mem_wdata[57],io_dma_mem_wdata[56],io_dma_mem_wdata[55],io_dma_mem_wdata[54],io_dma_mem_wdata[53],io_dma_mem_wdata[45],_T_2784}; // @[el2_lib.scala 263:73]
  wire  _T_2793 = ^_T_2792; // @[el2_lib.scala 263:80]
  wire [14:0] _T_2807 = {io_dma_mem_wdata[52],io_dma_mem_wdata[51],io_dma_mem_wdata[50],io_dma_mem_wdata[49],io_dma_mem_wdata[48],io_dma_mem_wdata[47],io_dma_mem_wdata[46],io_dma_mem_wdata[45],_T_2784}; // @[el2_lib.scala 263:90]
  wire  _T_2808 = ^_T_2807; // @[el2_lib.scala 263:97]
  wire [5:0] _T_2813 = {io_dma_mem_wdata[37],io_dma_mem_wdata[36],io_dma_mem_wdata[35],io_dma_mem_wdata[34],io_dma_mem_wdata[33],io_dma_mem_wdata[32]}; // @[el2_lib.scala 263:107]
  wire  _T_2814 = ^_T_2813; // @[el2_lib.scala 263:114]
  wire [5:0] _T_2819 = {_T_2742,_T_2760,_T_2778,_T_2793,_T_2808,_T_2814}; // @[Cat.scala 29:58]
  wire  _T_2820 = ^io_dma_mem_wdata[63:32]; // @[el2_lib.scala 264:13]
  wire  _T_2821 = ^_T_2819; // @[el2_lib.scala 264:23]
  wire  _T_2822 = _T_2820 ^ _T_2821; // @[el2_lib.scala 264:18]
  wire [8:0] _T_2928 = {io_dma_mem_wdata[16],io_dma_mem_wdata[14],io_dma_mem_wdata[12],io_dma_mem_wdata[10],io_dma_mem_wdata[8],io_dma_mem_wdata[6],io_dma_mem_wdata[5],io_dma_mem_wdata[3],io_dma_mem_wdata[1]}; // @[el2_lib.scala 263:22]
  wire [17:0] _T_2937 = {io_dma_mem_wdata[31],io_dma_mem_wdata[30],io_dma_mem_wdata[28],io_dma_mem_wdata[27],io_dma_mem_wdata[25],io_dma_mem_wdata[23],io_dma_mem_wdata[21],io_dma_mem_wdata[20],io_dma_mem_wdata[18],_T_2928}; // @[el2_lib.scala 263:22]
  wire  _T_2938 = ^_T_2937; // @[el2_lib.scala 263:29]
  wire [8:0] _T_2946 = {io_dma_mem_wdata[15],io_dma_mem_wdata[14],io_dma_mem_wdata[11],io_dma_mem_wdata[10],io_dma_mem_wdata[7],io_dma_mem_wdata[6],io_dma_mem_wdata[4],io_dma_mem_wdata[3],io_dma_mem_wdata[0]}; // @[el2_lib.scala 263:39]
  wire [17:0] _T_2955 = {io_dma_mem_wdata[31],io_dma_mem_wdata[29],io_dma_mem_wdata[28],io_dma_mem_wdata[26],io_dma_mem_wdata[25],io_dma_mem_wdata[22],io_dma_mem_wdata[21],io_dma_mem_wdata[19],io_dma_mem_wdata[18],_T_2946}; // @[el2_lib.scala 263:39]
  wire  _T_2956 = ^_T_2955; // @[el2_lib.scala 263:46]
  wire [8:0] _T_2964 = {io_dma_mem_wdata[15],io_dma_mem_wdata[14],io_dma_mem_wdata[9],io_dma_mem_wdata[8],io_dma_mem_wdata[7],io_dma_mem_wdata[6],io_dma_mem_wdata[2],io_dma_mem_wdata[1],io_dma_mem_wdata[0]}; // @[el2_lib.scala 263:56]
  wire [17:0] _T_2973 = {io_dma_mem_wdata[30],io_dma_mem_wdata[29],io_dma_mem_wdata[28],io_dma_mem_wdata[24],io_dma_mem_wdata[23],io_dma_mem_wdata[22],io_dma_mem_wdata[21],io_dma_mem_wdata[17],io_dma_mem_wdata[16],_T_2964}; // @[el2_lib.scala 263:56]
  wire  _T_2974 = ^_T_2973; // @[el2_lib.scala 263:63]
  wire [6:0] _T_2980 = {io_dma_mem_wdata[12],io_dma_mem_wdata[11],io_dma_mem_wdata[10],io_dma_mem_wdata[9],io_dma_mem_wdata[8],io_dma_mem_wdata[7],io_dma_mem_wdata[6]}; // @[el2_lib.scala 263:73]
  wire [14:0] _T_2988 = {io_dma_mem_wdata[27],io_dma_mem_wdata[26],io_dma_mem_wdata[25],io_dma_mem_wdata[24],io_dma_mem_wdata[23],io_dma_mem_wdata[22],io_dma_mem_wdata[21],io_dma_mem_wdata[13],_T_2980}; // @[el2_lib.scala 263:73]
  wire  _T_2989 = ^_T_2988; // @[el2_lib.scala 263:80]
  wire [14:0] _T_3003 = {io_dma_mem_wdata[20],io_dma_mem_wdata[19],io_dma_mem_wdata[18],io_dma_mem_wdata[17],io_dma_mem_wdata[16],io_dma_mem_wdata[15],io_dma_mem_wdata[14],io_dma_mem_wdata[13],_T_2980}; // @[el2_lib.scala 263:90]
  wire  _T_3004 = ^_T_3003; // @[el2_lib.scala 263:97]
  wire [5:0] _T_3009 = {io_dma_mem_wdata[5],io_dma_mem_wdata[4],io_dma_mem_wdata[3],io_dma_mem_wdata[2],io_dma_mem_wdata[1],io_dma_mem_wdata[0]}; // @[el2_lib.scala 263:107]
  wire  _T_3010 = ^_T_3009; // @[el2_lib.scala 263:114]
  wire [5:0] _T_3015 = {_T_2938,_T_2956,_T_2974,_T_2989,_T_3004,_T_3010}; // @[Cat.scala 29:58]
  wire  _T_3016 = ^io_dma_mem_wdata[31:0]; // @[el2_lib.scala 264:13]
  wire  _T_3017 = ^_T_3015; // @[el2_lib.scala 264:23]
  wire  _T_3018 = _T_3016 ^ _T_3017; // @[el2_lib.scala 264:18]
  wire [6:0] _T_3019 = {_T_3018,_T_2938,_T_2956,_T_2974,_T_2989,_T_3004,_T_3010}; // @[Cat.scala 29:58]
  wire [13:0] dma_mem_ecc = {_T_2822,_T_2742,_T_2760,_T_2778,_T_2793,_T_2808,_T_2814,_T_3019}; // @[Cat.scala 29:58]
  wire  _T_3021 = ~_T_2615; // @[el2_ifu_mem_ctl.scala 679:45]
  wire  _T_3022 = iccm_correct_ecc & _T_3021; // @[el2_ifu_mem_ctl.scala 679:43]
  reg [38:0] iccm_ecc_corr_data_ff; // @[Reg.scala 27:20]
  wire [77:0] _T_3023 = {iccm_ecc_corr_data_ff,iccm_ecc_corr_data_ff}; // @[Cat.scala 29:58]
  wire [77:0] _T_3030 = {dma_mem_ecc[13:7],io_dma_mem_wdata[63:32],dma_mem_ecc[6:0],io_dma_mem_wdata[31:0]}; // @[Cat.scala 29:58]
  reg [1:0] dma_mem_addr_ff; // @[el2_ifu_mem_ctl.scala 693:53]
  wire  _T_3362 = _T_3274[5:0] == 6'h27; // @[el2_lib.scala 302:41]
  wire  _T_3360 = _T_3274[5:0] == 6'h26; // @[el2_lib.scala 302:41]
  wire  _T_3358 = _T_3274[5:0] == 6'h25; // @[el2_lib.scala 302:41]
  wire  _T_3356 = _T_3274[5:0] == 6'h24; // @[el2_lib.scala 302:41]
  wire  _T_3354 = _T_3274[5:0] == 6'h23; // @[el2_lib.scala 302:41]
  wire  _T_3352 = _T_3274[5:0] == 6'h22; // @[el2_lib.scala 302:41]
  wire  _T_3350 = _T_3274[5:0] == 6'h21; // @[el2_lib.scala 302:41]
  wire  _T_3348 = _T_3274[5:0] == 6'h20; // @[el2_lib.scala 302:41]
  wire  _T_3346 = _T_3274[5:0] == 6'h1f; // @[el2_lib.scala 302:41]
  wire  _T_3344 = _T_3274[5:0] == 6'h1e; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3420 = {_T_3362,_T_3360,_T_3358,_T_3356,_T_3354,_T_3352,_T_3350,_T_3348,_T_3346,_T_3344}; // @[el2_lib.scala 305:69]
  wire  _T_3342 = _T_3274[5:0] == 6'h1d; // @[el2_lib.scala 302:41]
  wire  _T_3340 = _T_3274[5:0] == 6'h1c; // @[el2_lib.scala 302:41]
  wire  _T_3338 = _T_3274[5:0] == 6'h1b; // @[el2_lib.scala 302:41]
  wire  _T_3336 = _T_3274[5:0] == 6'h1a; // @[el2_lib.scala 302:41]
  wire  _T_3334 = _T_3274[5:0] == 6'h19; // @[el2_lib.scala 302:41]
  wire  _T_3332 = _T_3274[5:0] == 6'h18; // @[el2_lib.scala 302:41]
  wire  _T_3330 = _T_3274[5:0] == 6'h17; // @[el2_lib.scala 302:41]
  wire  _T_3328 = _T_3274[5:0] == 6'h16; // @[el2_lib.scala 302:41]
  wire  _T_3326 = _T_3274[5:0] == 6'h15; // @[el2_lib.scala 302:41]
  wire  _T_3324 = _T_3274[5:0] == 6'h14; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3411 = {_T_3342,_T_3340,_T_3338,_T_3336,_T_3334,_T_3332,_T_3330,_T_3328,_T_3326,_T_3324}; // @[el2_lib.scala 305:69]
  wire  _T_3322 = _T_3274[5:0] == 6'h13; // @[el2_lib.scala 302:41]
  wire  _T_3320 = _T_3274[5:0] == 6'h12; // @[el2_lib.scala 302:41]
  wire  _T_3318 = _T_3274[5:0] == 6'h11; // @[el2_lib.scala 302:41]
  wire  _T_3316 = _T_3274[5:0] == 6'h10; // @[el2_lib.scala 302:41]
  wire  _T_3314 = _T_3274[5:0] == 6'hf; // @[el2_lib.scala 302:41]
  wire  _T_3312 = _T_3274[5:0] == 6'he; // @[el2_lib.scala 302:41]
  wire  _T_3310 = _T_3274[5:0] == 6'hd; // @[el2_lib.scala 302:41]
  wire  _T_3308 = _T_3274[5:0] == 6'hc; // @[el2_lib.scala 302:41]
  wire  _T_3306 = _T_3274[5:0] == 6'hb; // @[el2_lib.scala 302:41]
  wire  _T_3304 = _T_3274[5:0] == 6'ha; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3401 = {_T_3322,_T_3320,_T_3318,_T_3316,_T_3314,_T_3312,_T_3310,_T_3308,_T_3306,_T_3304}; // @[el2_lib.scala 305:69]
  wire  _T_3302 = _T_3274[5:0] == 6'h9; // @[el2_lib.scala 302:41]
  wire  _T_3300 = _T_3274[5:0] == 6'h8; // @[el2_lib.scala 302:41]
  wire  _T_3298 = _T_3274[5:0] == 6'h7; // @[el2_lib.scala 302:41]
  wire  _T_3296 = _T_3274[5:0] == 6'h6; // @[el2_lib.scala 302:41]
  wire  _T_3294 = _T_3274[5:0] == 6'h5; // @[el2_lib.scala 302:41]
  wire  _T_3292 = _T_3274[5:0] == 6'h4; // @[el2_lib.scala 302:41]
  wire  _T_3290 = _T_3274[5:0] == 6'h3; // @[el2_lib.scala 302:41]
  wire  _T_3288 = _T_3274[5:0] == 6'h2; // @[el2_lib.scala 302:41]
  wire  _T_3286 = _T_3274[5:0] == 6'h1; // @[el2_lib.scala 302:41]
  wire [18:0] _T_3402 = {_T_3401,_T_3302,_T_3300,_T_3298,_T_3296,_T_3294,_T_3292,_T_3290,_T_3288,_T_3286}; // @[el2_lib.scala 305:69]
  wire [38:0] _T_3422 = {_T_3420,_T_3411,_T_3402}; // @[el2_lib.scala 305:69]
  wire [7:0] _T_3377 = {io_iccm_rd_data_ecc[35],io_iccm_rd_data_ecc[3:1],io_iccm_rd_data_ecc[34],io_iccm_rd_data_ecc[0],io_iccm_rd_data_ecc[33:32]}; // @[Cat.scala 29:58]
  wire [38:0] _T_3383 = {io_iccm_rd_data_ecc[38],io_iccm_rd_data_ecc[31:26],io_iccm_rd_data_ecc[37],io_iccm_rd_data_ecc[25:11],io_iccm_rd_data_ecc[36],io_iccm_rd_data_ecc[10:4],_T_3377}; // @[Cat.scala 29:58]
  wire [38:0] _T_3423 = _T_3422 ^ _T_3383; // @[el2_lib.scala 305:76]
  wire [38:0] _T_3424 = _T_3278 ? _T_3423 : _T_3383; // @[el2_lib.scala 305:31]
  wire [31:0] iccm_corrected_data_0 = {_T_3424[37:32],_T_3424[30:16],_T_3424[14:8],_T_3424[6:4],_T_3424[2]}; // @[Cat.scala 29:58]
  wire  _T_3747 = _T_3659[5:0] == 6'h27; // @[el2_lib.scala 302:41]
  wire  _T_3745 = _T_3659[5:0] == 6'h26; // @[el2_lib.scala 302:41]
  wire  _T_3743 = _T_3659[5:0] == 6'h25; // @[el2_lib.scala 302:41]
  wire  _T_3741 = _T_3659[5:0] == 6'h24; // @[el2_lib.scala 302:41]
  wire  _T_3739 = _T_3659[5:0] == 6'h23; // @[el2_lib.scala 302:41]
  wire  _T_3737 = _T_3659[5:0] == 6'h22; // @[el2_lib.scala 302:41]
  wire  _T_3735 = _T_3659[5:0] == 6'h21; // @[el2_lib.scala 302:41]
  wire  _T_3733 = _T_3659[5:0] == 6'h20; // @[el2_lib.scala 302:41]
  wire  _T_3731 = _T_3659[5:0] == 6'h1f; // @[el2_lib.scala 302:41]
  wire  _T_3729 = _T_3659[5:0] == 6'h1e; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3805 = {_T_3747,_T_3745,_T_3743,_T_3741,_T_3739,_T_3737,_T_3735,_T_3733,_T_3731,_T_3729}; // @[el2_lib.scala 305:69]
  wire  _T_3727 = _T_3659[5:0] == 6'h1d; // @[el2_lib.scala 302:41]
  wire  _T_3725 = _T_3659[5:0] == 6'h1c; // @[el2_lib.scala 302:41]
  wire  _T_3723 = _T_3659[5:0] == 6'h1b; // @[el2_lib.scala 302:41]
  wire  _T_3721 = _T_3659[5:0] == 6'h1a; // @[el2_lib.scala 302:41]
  wire  _T_3719 = _T_3659[5:0] == 6'h19; // @[el2_lib.scala 302:41]
  wire  _T_3717 = _T_3659[5:0] == 6'h18; // @[el2_lib.scala 302:41]
  wire  _T_3715 = _T_3659[5:0] == 6'h17; // @[el2_lib.scala 302:41]
  wire  _T_3713 = _T_3659[5:0] == 6'h16; // @[el2_lib.scala 302:41]
  wire  _T_3711 = _T_3659[5:0] == 6'h15; // @[el2_lib.scala 302:41]
  wire  _T_3709 = _T_3659[5:0] == 6'h14; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3796 = {_T_3727,_T_3725,_T_3723,_T_3721,_T_3719,_T_3717,_T_3715,_T_3713,_T_3711,_T_3709}; // @[el2_lib.scala 305:69]
  wire  _T_3707 = _T_3659[5:0] == 6'h13; // @[el2_lib.scala 302:41]
  wire  _T_3705 = _T_3659[5:0] == 6'h12; // @[el2_lib.scala 302:41]
  wire  _T_3703 = _T_3659[5:0] == 6'h11; // @[el2_lib.scala 302:41]
  wire  _T_3701 = _T_3659[5:0] == 6'h10; // @[el2_lib.scala 302:41]
  wire  _T_3699 = _T_3659[5:0] == 6'hf; // @[el2_lib.scala 302:41]
  wire  _T_3697 = _T_3659[5:0] == 6'he; // @[el2_lib.scala 302:41]
  wire  _T_3695 = _T_3659[5:0] == 6'hd; // @[el2_lib.scala 302:41]
  wire  _T_3693 = _T_3659[5:0] == 6'hc; // @[el2_lib.scala 302:41]
  wire  _T_3691 = _T_3659[5:0] == 6'hb; // @[el2_lib.scala 302:41]
  wire  _T_3689 = _T_3659[5:0] == 6'ha; // @[el2_lib.scala 302:41]
  wire [9:0] _T_3786 = {_T_3707,_T_3705,_T_3703,_T_3701,_T_3699,_T_3697,_T_3695,_T_3693,_T_3691,_T_3689}; // @[el2_lib.scala 305:69]
  wire  _T_3687 = _T_3659[5:0] == 6'h9; // @[el2_lib.scala 302:41]
  wire  _T_3685 = _T_3659[5:0] == 6'h8; // @[el2_lib.scala 302:41]
  wire  _T_3683 = _T_3659[5:0] == 6'h7; // @[el2_lib.scala 302:41]
  wire  _T_3681 = _T_3659[5:0] == 6'h6; // @[el2_lib.scala 302:41]
  wire  _T_3679 = _T_3659[5:0] == 6'h5; // @[el2_lib.scala 302:41]
  wire  _T_3677 = _T_3659[5:0] == 6'h4; // @[el2_lib.scala 302:41]
  wire  _T_3675 = _T_3659[5:0] == 6'h3; // @[el2_lib.scala 302:41]
  wire  _T_3673 = _T_3659[5:0] == 6'h2; // @[el2_lib.scala 302:41]
  wire  _T_3671 = _T_3659[5:0] == 6'h1; // @[el2_lib.scala 302:41]
  wire [18:0] _T_3787 = {_T_3786,_T_3687,_T_3685,_T_3683,_T_3681,_T_3679,_T_3677,_T_3675,_T_3673,_T_3671}; // @[el2_lib.scala 305:69]
  wire [38:0] _T_3807 = {_T_3805,_T_3796,_T_3787}; // @[el2_lib.scala 305:69]
  wire [7:0] _T_3762 = {io_iccm_rd_data_ecc[74],io_iccm_rd_data_ecc[42:40],io_iccm_rd_data_ecc[73],io_iccm_rd_data_ecc[39],io_iccm_rd_data_ecc[72:71]}; // @[Cat.scala 29:58]
  wire [38:0] _T_3768 = {io_iccm_rd_data_ecc[77],io_iccm_rd_data_ecc[70:65],io_iccm_rd_data_ecc[76],io_iccm_rd_data_ecc[64:50],io_iccm_rd_data_ecc[75],io_iccm_rd_data_ecc[49:43],_T_3762}; // @[Cat.scala 29:58]
  wire [38:0] _T_3808 = _T_3807 ^ _T_3768; // @[el2_lib.scala 305:76]
  wire [38:0] _T_3809 = _T_3663 ? _T_3808 : _T_3768; // @[el2_lib.scala 305:31]
  wire [31:0] iccm_corrected_data_1 = {_T_3809[37:32],_T_3809[30:16],_T_3809[14:8],_T_3809[6:4],_T_3809[2]}; // @[Cat.scala 29:58]
  wire [31:0] iccm_dma_rdata_1_muxed = dma_mem_addr_ff[0] ? iccm_corrected_data_0 : iccm_corrected_data_1; // @[el2_ifu_mem_ctl.scala 685:35]
  wire  _T_3282 = ~_T_3274[6]; // @[el2_lib.scala 298:55]
  wire  _T_3283 = _T_3276 & _T_3282; // @[el2_lib.scala 298:53]
  wire  _T_3667 = ~_T_3659[6]; // @[el2_lib.scala 298:55]
  wire  _T_3668 = _T_3661 & _T_3667; // @[el2_lib.scala 298:53]
  wire [1:0] iccm_double_ecc_error = {_T_3283,_T_3668}; // @[Cat.scala 29:58]
  wire  iccm_dma_ecc_error_in = |iccm_double_ecc_error; // @[el2_ifu_mem_ctl.scala 687:53]
  wire [63:0] _T_3034 = {io_dma_mem_addr,io_dma_mem_addr}; // @[Cat.scala 29:58]
  wire [63:0] _T_3035 = {iccm_dma_rdata_1_muxed,_T_3424[37:32],_T_3424[30:16],_T_3424[14:8],_T_3424[6:4],_T_3424[2]}; // @[Cat.scala 29:58]
  reg [2:0] dma_mem_tag_ff; // @[el2_ifu_mem_ctl.scala 689:54]
  reg [2:0] iccm_dma_rtag; // @[el2_ifu_mem_ctl.scala 690:69]
  reg  iccm_dma_rvalid; // @[el2_ifu_mem_ctl.scala 695:71]
  reg [63:0] iccm_dma_rdata; // @[el2_ifu_mem_ctl.scala 699:70]
  wire  _T_3040 = _T_2615 & _T_2604; // @[el2_ifu_mem_ctl.scala 702:65]
  wire  _T_3043 = _T_3021 & iccm_correct_ecc; // @[el2_ifu_mem_ctl.scala 703:50]
  reg [13:0] iccm_ecc_corr_index_ff; // @[Reg.scala 27:20]
  wire [14:0] _T_3044 = {iccm_ecc_corr_index_ff,1'h0}; // @[Cat.scala 29:58]
  wire [15:0] _T_3046 = _T_3043 ? {{1'd0}, _T_3044} : io_ifc_fetch_addr_bf[15:0]; // @[el2_ifu_mem_ctl.scala 703:8]
  wire [31:0] _T_3047 = _T_3040 ? io_dma_mem_addr : {{16'd0}, _T_3046}; // @[el2_ifu_mem_ctl.scala 702:25]
  wire  _T_3436 = _T_3274 == 7'h40; // @[el2_lib.scala 308:62]
  wire  _T_3437 = _T_3424[38] ^ _T_3436; // @[el2_lib.scala 308:44]
  wire [6:0] iccm_corrected_ecc_0 = {_T_3437,_T_3424[31],_T_3424[15],_T_3424[7],_T_3424[3],_T_3424[1:0]}; // @[Cat.scala 29:58]
  wire  _T_3821 = _T_3659 == 7'h40; // @[el2_lib.scala 308:62]
  wire  _T_3822 = _T_3809[38] ^ _T_3821; // @[el2_lib.scala 308:44]
  wire [6:0] iccm_corrected_ecc_1 = {_T_3822,_T_3809[31],_T_3809[15],_T_3809[7],_T_3809[3],_T_3809[1:0]}; // @[Cat.scala 29:58]
  wire  _T_3838 = _T_4 & ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 715:58]
  wire [31:0] iccm_corrected_data_f_mux = iccm_single_ecc_error[0] ? iccm_corrected_data_0 : iccm_corrected_data_1; // @[el2_ifu_mem_ctl.scala 717:38]
  wire [6:0] iccm_corrected_ecc_f_mux = iccm_single_ecc_error[0] ? iccm_corrected_ecc_0 : iccm_corrected_ecc_1; // @[el2_ifu_mem_ctl.scala 718:37]
  reg  iccm_rd_ecc_single_err_ff; // @[el2_ifu_mem_ctl.scala 726:62]
  wire  _T_3846 = ~iccm_rd_ecc_single_err_ff; // @[el2_ifu_mem_ctl.scala 720:76]
  wire  _T_3847 = io_iccm_rd_ecc_single_err & _T_3846; // @[el2_ifu_mem_ctl.scala 720:74]
  wire  _T_3849 = _T_3847 & _T_308; // @[el2_ifu_mem_ctl.scala 720:104]
  wire  iccm_ecc_write_status = _T_3849 | io_iccm_dma_sb_error; // @[el2_ifu_mem_ctl.scala 720:127]
  wire  _T_3850 = io_iccm_rd_ecc_single_err | iccm_rd_ecc_single_err_ff; // @[el2_ifu_mem_ctl.scala 721:67]
  wire  iccm_rd_ecc_single_err_hold_in = _T_3850 & _T_308; // @[el2_ifu_mem_ctl.scala 721:96]
  reg [13:0] iccm_rw_addr_f; // @[el2_ifu_mem_ctl.scala 725:51]
  wire [13:0] _T_3855 = iccm_rw_addr_f + 14'h1; // @[el2_ifu_mem_ctl.scala 724:102]
  wire [38:0] _T_3859 = {iccm_corrected_ecc_f_mux,iccm_corrected_data_f_mux}; // @[Cat.scala 29:58]
  wire  _T_3864 = ~io_ifc_fetch_uncacheable_bf; // @[el2_ifu_mem_ctl.scala 729:41]
  wire  _T_3865 = io_ifc_fetch_req_bf & _T_3864; // @[el2_ifu_mem_ctl.scala 729:39]
  wire  _T_3866 = ~io_ifc_iccm_access_bf; // @[el2_ifu_mem_ctl.scala 729:72]
  wire  _T_3867 = _T_3865 & _T_3866; // @[el2_ifu_mem_ctl.scala 729:70]
  wire  _T_3869 = ~miss_state_en; // @[el2_ifu_mem_ctl.scala 730:34]
  wire  _T_3870 = _T_2216 & _T_3869; // @[el2_ifu_mem_ctl.scala 730:32]
  wire  _T_3873 = _T_2231 & _T_3869; // @[el2_ifu_mem_ctl.scala 731:37]
  wire  _T_3874 = _T_3870 | _T_3873; // @[el2_ifu_mem_ctl.scala 730:88]
  wire  _T_3875 = miss_state == 3'h7; // @[el2_ifu_mem_ctl.scala 732:19]
  wire  _T_3877 = _T_3875 & _T_3869; // @[el2_ifu_mem_ctl.scala 732:41]
  wire  _T_3878 = _T_3874 | _T_3877; // @[el2_ifu_mem_ctl.scala 731:88]
  wire  _T_3879 = miss_state == 3'h3; // @[el2_ifu_mem_ctl.scala 733:19]
  wire  _T_3881 = _T_3879 & _T_3869; // @[el2_ifu_mem_ctl.scala 733:35]
  wire  _T_3882 = _T_3878 | _T_3881; // @[el2_ifu_mem_ctl.scala 732:88]
  wire  _T_3885 = _T_2230 & _T_3869; // @[el2_ifu_mem_ctl.scala 734:38]
  wire  _T_3886 = _T_3882 | _T_3885; // @[el2_ifu_mem_ctl.scala 733:88]
  wire  _T_3888 = _T_2231 & miss_state_en; // @[el2_ifu_mem_ctl.scala 735:37]
  wire  _T_3889 = miss_nxtstate == 3'h3; // @[el2_ifu_mem_ctl.scala 735:71]
  wire  _T_3890 = _T_3888 & _T_3889; // @[el2_ifu_mem_ctl.scala 735:54]
  wire  _T_3891 = _T_3886 | _T_3890; // @[el2_ifu_mem_ctl.scala 734:57]
  wire  _T_3892 = ~_T_3891; // @[el2_ifu_mem_ctl.scala 730:5]
  wire  _T_3893 = _T_3867 & _T_3892; // @[el2_ifu_mem_ctl.scala 729:96]
  wire  _T_3894 = io_ifc_fetch_req_bf & io_exu_flush_final; // @[el2_ifu_mem_ctl.scala 736:28]
  wire  _T_3896 = _T_3894 & _T_3864; // @[el2_ifu_mem_ctl.scala 736:50]
  wire  _T_3898 = _T_3896 & _T_3866; // @[el2_ifu_mem_ctl.scala 736:81]
  wire  _T_3907 = ~_T_100; // @[el2_ifu_mem_ctl.scala 739:106]
  wire  _T_3908 = _T_2216 & _T_3907; // @[el2_ifu_mem_ctl.scala 739:104]
  wire  _T_3909 = _T_2231 | _T_3908; // @[el2_ifu_mem_ctl.scala 739:77]
  wire  _T_3913 = ~_T_53; // @[el2_ifu_mem_ctl.scala 739:172]
  wire  _T_3914 = _T_3909 & _T_3913; // @[el2_ifu_mem_ctl.scala 739:170]
  wire  _T_3915 = ~_T_3914; // @[el2_ifu_mem_ctl.scala 739:44]
  wire  _T_3919 = reset_ic_in | reset_ic_ff; // @[el2_ifu_mem_ctl.scala 741:62]
  wire  _T_3920 = ~_T_3919; // @[el2_ifu_mem_ctl.scala 741:48]
  wire  _T_3921 = _T_268 & _T_3920; // @[el2_ifu_mem_ctl.scala 741:46]
  wire  _T_3922 = ~reset_tag_valid_for_miss; // @[el2_ifu_mem_ctl.scala 741:79]
  wire  ic_valid = _T_3921 & _T_3922; // @[el2_ifu_mem_ctl.scala 741:77]
  wire  _T_3924 = debug_c1_clken & io_ic_debug_tag_array; // @[el2_ifu_mem_ctl.scala 742:81]
  reg [6:0] ifu_status_wr_addr_ff; // @[el2_ifu_mem_ctl.scala 744:61]
  wire  way_status_wr_en_w_debug = io_ic_debug_wr_en & io_ic_debug_tag_array; // @[el2_ifu_mem_ctl.scala 746:73]
  reg  ic_valid_ff; // @[el2_ifu_mem_ctl.scala 766:51]
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
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  rvclkhdr rvclkhdr_12 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_12_io_clk),
    .io_en(rvclkhdr_12_io_en),
    .io_scan_mode(rvclkhdr_12_io_scan_mode)
  );
  rvclkhdr rvclkhdr_13 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_13_io_clk),
    .io_en(rvclkhdr_13_io_en),
    .io_scan_mode(rvclkhdr_13_io_scan_mode)
  );
  rvclkhdr rvclkhdr_14 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_14_io_clk),
    .io_en(rvclkhdr_14_io_en),
    .io_scan_mode(rvclkhdr_14_io_scan_mode)
  );
  rvclkhdr rvclkhdr_15 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_15_io_clk),
    .io_en(rvclkhdr_15_io_en),
    .io_scan_mode(rvclkhdr_15_io_scan_mode)
  );
  rvclkhdr rvclkhdr_16 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_16_io_clk),
    .io_en(rvclkhdr_16_io_en),
    .io_scan_mode(rvclkhdr_16_io_scan_mode)
  );
  rvclkhdr rvclkhdr_17 ( // @[el2_lib.scala 412:22]
    .io_clk(rvclkhdr_17_io_clk),
    .io_en(rvclkhdr_17_io_en),
    .io_scan_mode(rvclkhdr_17_io_scan_mode)
  );
  assign io_ifu_miss_state_idle = 1'h0; // @[el2_ifu_mem_ctl.scala 131:25]
  assign io_ifu_ic_mb_empty = 1'h0; // @[el2_ifu_mem_ctl.scala 132:21]
  assign io_ic_dma_active = _T_12 | io_dec_tlu_flush_err_wb; // @[el2_ifu_mem_ctl.scala 133:19 el2_ifu_mem_ctl.scala 241:20]
  assign io_ic_write_stall = write_ic_16_bytes & _T_3915; // @[el2_ifu_mem_ctl.scala 134:20 el2_ifu_mem_ctl.scala 739:21]
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
  assign io_ifu_axi_arvalid = ifu_bus_cmd_valid; // @[el2_ifu_mem_ctl.scala 155:21 el2_ifu_mem_ctl.scala 601:22]
  assign io_ifu_axi_arid = bus_rd_addr_count & _T_2509; // @[el2_ifu_mem_ctl.scala 157:18 el2_ifu_mem_ctl.scala 602:19]
  assign io_ifu_axi_araddr = _T_2511 & _T_2513; // @[el2_ifu_mem_ctl.scala 158:20 el2_ifu_mem_ctl.scala 603:21]
  assign io_ifu_axi_arregion = ifu_ic_req_addr_f[28:25]; // @[el2_ifu_mem_ctl.scala 159:22 el2_ifu_mem_ctl.scala 606:23]
  assign io_ifu_axi_arlen = 8'h0; // @[el2_ifu_mem_ctl.scala 160:19]
  assign io_ifu_axi_arsize = 3'h3; // @[el2_ifu_mem_ctl.scala 161:20 el2_ifu_mem_ctl.scala 604:21]
  assign io_ifu_axi_arburst = 2'h1; // @[el2_ifu_mem_ctl.scala 162:21 el2_ifu_mem_ctl.scala 607:22]
  assign io_ifu_axi_arlock = 1'h0; // @[el2_ifu_mem_ctl.scala 163:20]
  assign io_ifu_axi_arcache = 4'hf; // @[el2_ifu_mem_ctl.scala 164:21 el2_ifu_mem_ctl.scala 605:22]
  assign io_ifu_axi_arprot = 3'h0; // @[el2_ifu_mem_ctl.scala 165:20]
  assign io_ifu_axi_arqos = 4'h0; // @[el2_ifu_mem_ctl.scala 166:19]
  assign io_ifu_axi_rready = 1'h1; // @[el2_ifu_mem_ctl.scala 167:20 el2_ifu_mem_ctl.scala 608:21]
  assign io_iccm_dma_ecc_error = |iccm_double_ecc_error; // @[el2_ifu_mem_ctl.scala 168:24 el2_ifu_mem_ctl.scala 698:25]
  assign io_iccm_dma_rvalid = iccm_dma_rvalid; // @[el2_ifu_mem_ctl.scala 169:21 el2_ifu_mem_ctl.scala 696:22]
  assign io_iccm_dma_rdata = iccm_dma_rdata; // @[el2_ifu_mem_ctl.scala 170:20 el2_ifu_mem_ctl.scala 700:21]
  assign io_iccm_dma_rtag = iccm_dma_rtag; // @[el2_ifu_mem_ctl.scala 171:19 el2_ifu_mem_ctl.scala 691:20]
  assign io_iccm_ready = 1'h0; // @[el2_ifu_mem_ctl.scala 172:16]
  assign io_ic_rw_addr = 31'h0; // @[el2_ifu_mem_ctl.scala 173:16]
  assign io_ic_wr_en = 2'h0; // @[el2_ifu_mem_ctl.scala 174:14 el2_ifu_mem_ctl.scala 738:15]
  assign io_ic_rd_en = _T_3893 | _T_3898; // @[el2_ifu_mem_ctl.scala 175:14 el2_ifu_mem_ctl.scala 729:15]
  assign io_ic_wr_data_0 = ic_wr_16bytes_data[70:0]; // @[el2_ifu_mem_ctl.scala 176:16 el2_ifu_mem_ctl.scala 391:17]
  assign io_ic_wr_data_1 = ic_wr_16bytes_data[141:71]; // @[el2_ifu_mem_ctl.scala 176:16 el2_ifu_mem_ctl.scala 391:17]
  assign io_ic_debug_wr_data = io_dec_tlu_ic_diag_pkt_icache_wrdata; // @[el2_ifu_mem_ctl.scala 177:22 el2_ifu_mem_ctl.scala 392:23]
  assign io_ifu_ic_debug_rd_data = _T_1200; // @[el2_ifu_mem_ctl.scala 178:26 el2_ifu_mem_ctl.scala 400:27]
  assign io_ic_debug_addr = 10'h0; // @[el2_ifu_mem_ctl.scala 156:19]
  assign io_ic_debug_rd_en = 1'h0; // @[el2_ifu_mem_ctl.scala 128:20]
  assign io_ic_debug_wr_en = 1'h0; // @[el2_ifu_mem_ctl.scala 129:20]
  assign io_ic_debug_tag_array = 1'h0; // @[el2_ifu_mem_ctl.scala 130:24]
  assign io_ic_debug_way = 2'h0; // @[el2_ifu_mem_ctl.scala 200:18]
  assign io_ic_tag_valid = 2'h0; // @[el2_ifu_mem_ctl.scala 179:18]
  assign io_iccm_rw_addr = _T_3047[14:0]; // @[el2_ifu_mem_ctl.scala 180:18 el2_ifu_mem_ctl.scala 702:19]
  assign io_iccm_wren = _T_2616 | iccm_correct_ecc; // @[el2_ifu_mem_ctl.scala 181:15 el2_ifu_mem_ctl.scala 673:16]
  assign io_iccm_rden = _T_2620 | _T_2621; // @[el2_ifu_mem_ctl.scala 182:15 el2_ifu_mem_ctl.scala 674:16]
  assign io_iccm_wr_data = _T_3022 ? _T_3023 : _T_3030; // @[el2_ifu_mem_ctl.scala 183:18 el2_ifu_mem_ctl.scala 679:19]
  assign io_iccm_wr_size = _T_2626 & io_dma_mem_sz; // @[el2_ifu_mem_ctl.scala 184:18 el2_ifu_mem_ctl.scala 676:19]
  assign io_ic_hit_f = _T_254 | ic_iccm_hit_f; // @[el2_ifu_mem_ctl.scala 185:14 el2_ifu_mem_ctl.scala 336:15]
  assign io_ic_access_fault_f = ifc_bus_acc_fault_f & _T_308; // @[el2_ifu_mem_ctl.scala 186:23 el2_ifu_mem_ctl.scala 430:24]
  assign io_ic_access_fault_type_f = io_iccm_rd_ecc_double_err ? 2'h1 : _T_1264; // @[el2_ifu_mem_ctl.scala 187:28 el2_ifu_mem_ctl.scala 431:29]
  assign io_iccm_rd_ecc_single_err = _T_3838 & ifc_fetch_req_f; // @[el2_ifu_mem_ctl.scala 188:28 el2_ifu_mem_ctl.scala 715:29]
  assign io_iccm_rd_ecc_double_err = iccm_dma_ecc_error_in & ifc_iccm_access_f; // @[el2_ifu_mem_ctl.scala 189:28 el2_ifu_mem_ctl.scala 716:29]
  assign io_ic_error_start = _T_1188 | ic_rd_parity_final_err; // @[el2_ifu_mem_ctl.scala 190:20 el2_ifu_mem_ctl.scala 394:21]
  assign io_ifu_async_error_start = io_iccm_rd_ecc_single_err | io_ic_error_start; // @[el2_ifu_mem_ctl.scala 191:27 el2_ifu_mem_ctl.scala 240:28]
  assign io_iccm_dma_sb_error = _T_4 & dma_iccm_req_f; // @[el2_ifu_mem_ctl.scala 192:23 el2_ifu_mem_ctl.scala 239:24]
  assign io_ic_fetch_val_f = {1'h0,fetch_req_f_qual}; // @[el2_ifu_mem_ctl.scala 193:20 el2_ifu_mem_ctl.scala 435:21]
  assign io_ic_data_f = 32'h0; // @[el2_ifu_mem_ctl.scala 194:15]
  assign io_ic_premux_data = 64'h0; // @[el2_ifu_mem_ctl.scala 195:20]
  assign io_ic_sel_premux_data = 1'h0; // @[el2_ifu_mem_ctl.scala 196:24]
  assign io_ifu_ic_debug_rd_data_valid = 1'h0; // @[el2_ifu_mem_ctl.scala 197:32]
  assign io_iccm_buf_correct_ecc = 1'h0; // @[el2_ifu_mem_ctl.scala 198:26]
  assign io_iccm_correction_state = 1'h0; // @[el2_ifu_mem_ctl.scala 199:27]
  assign io_test = ic_valid_ff; // @[el2_ifu_mem_ctl.scala 466:11 el2_ifu_mem_ctl.scala 767:11]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_io_en = io_ic_debug_rd_en | io_ic_debug_wr_en; // @[el2_lib.scala 414:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_1_io_en = _T_1 | io_exu_flush_final; // @[el2_lib.scala 414:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_2_io_en = ifu_status_wr_addr_ff[6:3] == 4'h0; // @[el2_lib.scala 414:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_3_io_en = ifu_status_wr_addr_ff[6:3] == 4'h1; // @[el2_lib.scala 414:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_4_io_en = ifu_status_wr_addr_ff[6:3] == 4'h2; // @[el2_lib.scala 414:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_5_io_en = ifu_status_wr_addr_ff[6:3] == 4'h3; // @[el2_lib.scala 414:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_6_io_en = ifu_status_wr_addr_ff[6:3] == 4'h4; // @[el2_lib.scala 414:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_7_io_en = ifu_status_wr_addr_ff[6:3] == 4'h5; // @[el2_lib.scala 414:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_8_io_en = ifu_status_wr_addr_ff[6:3] == 4'h6; // @[el2_lib.scala 414:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_9_io_en = ifu_status_wr_addr_ff[6:3] == 4'h7; // @[el2_lib.scala 414:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_10_io_en = ifu_status_wr_addr_ff[6:3] == 4'h8; // @[el2_lib.scala 414:16]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_11_io_en = ifu_status_wr_addr_ff[6:3] == 4'h9; // @[el2_lib.scala 414:16]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_12_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_12_io_en = ifu_status_wr_addr_ff[6:3] == 4'ha; // @[el2_lib.scala 414:16]
  assign rvclkhdr_12_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_13_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_13_io_en = ifu_status_wr_addr_ff[6:3] == 4'hb; // @[el2_lib.scala 414:16]
  assign rvclkhdr_13_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_14_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_14_io_en = ifu_status_wr_addr_ff[6:3] == 4'hc; // @[el2_lib.scala 414:16]
  assign rvclkhdr_14_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_15_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_15_io_en = ifu_status_wr_addr_ff[6:3] == 4'hd; // @[el2_lib.scala 414:16]
  assign rvclkhdr_15_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_16_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_16_io_en = ifu_status_wr_addr_ff[6:3] == 4'he; // @[el2_lib.scala 414:16]
  assign rvclkhdr_16_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
  assign rvclkhdr_17_io_clk = clock; // @[el2_lib.scala 413:17]
  assign rvclkhdr_17_io_en = ifu_status_wr_addr_ff[6:3] == 4'hf; // @[el2_lib.scala 414:16]
  assign rvclkhdr_17_io_scan_mode = io_scan_mode; // @[el2_lib.scala 415:23]
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
  ifu_fetch_addr_int_f = _RAND_3[30:0];
  _RAND_4 = {1{`RANDOM}};
  ifc_iccm_access_f = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  iccm_dma_rvalid_in = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  dma_iccm_req_f = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  perr_state = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  err_stop_state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reset_all_tags = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ifu_bus_rvalid_unq_ff = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  bus_ifu_bus_clk_en_ff = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  uncacheable_miss_ff = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  bus_data_beat_count = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  ic_miss_buff_data_valid = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  imb_ff = _RAND_15[30:0];
  _RAND_16 = {1{`RANDOM}};
  last_data_recieved_ff = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  sel_mb_addr_ff = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  imb_scnd_ff = _RAND_18[30:0];
  _RAND_19 = {1{`RANDOM}};
  ifu_bus_rid_ff = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  ifu_bus_rresp_ff = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  ifu_wr_data_comb_err_ff = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  scnd_miss_req_q = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  reset_ic_ff = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  miss_addr = _RAND_24[25:0];
  _RAND_25 = {1{`RANDOM}};
  ifc_region_acc_fault_f = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  bus_rd_addr_count = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  ic_act_miss_f_delayed = _RAND_27[0:0];
  _RAND_28 = {2{`RANDOM}};
  ifu_bus_rdata_ff = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  _T_1284 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  _T_1286 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  _T_1288 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  _T_1290 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  _T_1292 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  _T_1294 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  _T_1296 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  _T_1298 = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  _T_1300 = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  _T_1302 = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  _T_1304 = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  _T_1306 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  _T_1308 = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  _T_1310 = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  _T_1312 = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  _T_1314 = _RAND_44[63:0];
  _RAND_45 = {1{`RANDOM}};
  ic_crit_wd_rdy_new_ff = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  ic_miss_buff_data_error = _RAND_46[7:0];
  _RAND_47 = {3{`RANDOM}};
  _T_1200 = _RAND_47[70:0];
  _RAND_48 = {1{`RANDOM}};
  ifu_bus_cmd_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  bus_cmd_beat_count = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  ifc_dma_access_ok_prev = _RAND_50[0:0];
  _RAND_51 = {2{`RANDOM}};
  iccm_ecc_corr_data_ff = _RAND_51[38:0];
  _RAND_52 = {1{`RANDOM}};
  dma_mem_addr_ff = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  dma_mem_tag_ff = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  iccm_dma_rtag = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  iccm_dma_rvalid = _RAND_55[0:0];
  _RAND_56 = {2{`RANDOM}};
  iccm_dma_rdata = _RAND_56[63:0];
  _RAND_57 = {1{`RANDOM}};
  iccm_ecc_corr_index_ff = _RAND_57[13:0];
  _RAND_58 = {1{`RANDOM}};
  iccm_rd_ecc_single_err_ff = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  iccm_rw_addr_f = _RAND_59[13:0];
  _RAND_60 = {1{`RANDOM}};
  ifu_status_wr_addr_ff = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  ic_valid_ff = _RAND_61[0:0];
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
        if (_T_38) begin
          miss_state <= 3'h0;
        end else if (_T_42) begin
          miss_state <= 3'h3;
        end else if (_T_49) begin
          miss_state <= 3'h1;
        end else if (_T_53) begin
          miss_state <= 3'h0;
        end else if (_T_64) begin
          miss_state <= 3'h6;
        end else if (_T_72) begin
          miss_state <= 3'h0;
        end else if (_T_77) begin
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
          if (_T_34) begin
            miss_state <= 3'h0;
          end else begin
            miss_state <= 3'h2;
          end
        end else begin
          miss_state <= 3'h1;
        end
      end else if (_T_152) begin
        if (io_dec_tlu_force_halt) begin
          miss_state <= 3'h0;
        end else if (io_exu_flush_final) begin
          if (_T_34) begin
            miss_state <= 3'h0;
          end else begin
            miss_state <= 3'h2;
          end
        end else begin
          miss_state <= 3'h0;
        end
      end else begin
        miss_state <= 3'h0;
      end
    end
    if (reset) begin
      ifu_fetch_addr_int_f <= 31'h0;
    end else begin
      ifu_fetch_addr_int_f <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      ifc_iccm_access_f <= 1'h0;
    end else begin
      ifc_iccm_access_f <= io_ifc_iccm_access_bf;
    end
    if (reset) begin
      ifu_bus_rvalid_unq_ff <= 1'h0;
    end else if (io_ifu_bus_clk_en) begin
      ifu_bus_rvalid_unq_ff <= io_ifu_axi_rvalid;
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
      imb_scnd_ff <= 31'h0;
    end else if (!(sel_hold_imb_scnd)) begin
      imb_scnd_ff <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      ifu_bus_rid_ff <= 3'h0;
    end else if (io_ifu_bus_clk_en) begin
      ifu_bus_rid_ff <= io_ifu_axi_rid;
    end
    if (reset) begin
      ifu_bus_rresp_ff <= 2'h0;
    end else if (io_ifu_bus_clk_en) begin
      ifu_bus_rresp_ff <= io_ifu_axi_rresp;
    end
    reset_ic_ff <= _T_289 & _T_290;
    if (reset) begin
      miss_addr <= 26'h0;
    end else if (_T_223) begin
      miss_addr <= imb_ff[30:5];
    end else if (scnd_miss_req_q) begin
      miss_addr <= imb_scnd_ff[30:5];
    end
    if (reset) begin
      ifc_region_acc_fault_f <= 1'h0;
    end else begin
      ifc_region_acc_fault_f <= io_ifc_region_acc_fault_bf;
    end
    if (reset) begin
      bus_rd_addr_count <= 3'h0;
    end else if (_T_2552) begin
      if (_T_223) begin
        bus_rd_addr_count <= imb_ff[4:2];
      end else if (scnd_miss_req_q) begin
        bus_rd_addr_count <= imb_scnd_ff[4:2];
      end else if (bus_cmd_sent) begin
        bus_rd_addr_count <= _T_2548;
      end
    end
    if (reset) begin
      ifu_bus_rdata_ff <= 64'h0;
    end else if (io_ifu_bus_clk_en) begin
      ifu_bus_rdata_ff <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1284 <= 64'h0;
    end else if (write_fill_data_0) begin
      _T_1284 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1286 <= 64'h0;
    end else if (write_fill_data_0) begin
      _T_1286 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1288 <= 64'h0;
    end else if (write_fill_data_1) begin
      _T_1288 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1290 <= 64'h0;
    end else if (write_fill_data_1) begin
      _T_1290 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1292 <= 64'h0;
    end else if (write_fill_data_2) begin
      _T_1292 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1294 <= 64'h0;
    end else if (write_fill_data_2) begin
      _T_1294 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1296 <= 64'h0;
    end else if (write_fill_data_3) begin
      _T_1296 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1298 <= 64'h0;
    end else if (write_fill_data_3) begin
      _T_1298 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1300 <= 64'h0;
    end else if (write_fill_data_4) begin
      _T_1300 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1302 <= 64'h0;
    end else if (write_fill_data_4) begin
      _T_1302 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1304 <= 64'h0;
    end else if (write_fill_data_5) begin
      _T_1304 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1306 <= 64'h0;
    end else if (write_fill_data_5) begin
      _T_1306 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1308 <= 64'h0;
    end else if (write_fill_data_6) begin
      _T_1308 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1310 <= 64'h0;
    end else if (write_fill_data_6) begin
      _T_1310 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1312 <= 64'h0;
    end else if (write_fill_data_7) begin
      _T_1312 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1314 <= 64'h0;
    end else if (write_fill_data_7) begin
      _T_1314 <= io_ifu_axi_rdata;
    end
    if (reset) begin
      _T_1200 <= 71'h0;
    end else begin
      _T_1200 <= io_ic_debug_rd_data;
    end
    if (reset) begin
      ifu_bus_cmd_valid <= 1'h0;
    end else if (_T_2501) begin
      ifu_bus_cmd_valid <= ifc_bus_ic_req_ff_in;
    end
    if (reset) begin
      bus_cmd_beat_count <= 3'h0;
    end else if (_T_2576) begin
      bus_cmd_beat_count <= bus_new_cmd_beat_count;
    end
  end
  always @(posedge io_free_clk) begin
    if (reset) begin
      iccm_dma_rvalid_in <= 1'h0;
    end else begin
      iccm_dma_rvalid_in <= _T_2620;
    end
    if (reset) begin
      dma_iccm_req_f <= 1'h0;
    end else begin
      dma_iccm_req_f <= io_dma_iccm_req;
    end
    if (reset) begin
      perr_state <= 3'h0;
    end else if (perr_state_en) begin
      if (_T_2404) begin
        if (io_iccm_dma_sb_error) begin
          perr_state <= 3'h4;
        end else if (_T_2406) begin
          perr_state <= 3'h1;
        end else begin
          perr_state <= 3'h2;
        end
      end else if (_T_2416) begin
        perr_state <= 3'h0;
      end else if (_T_2419) begin
        if (_T_2421) begin
          perr_state <= 3'h0;
        end else begin
          perr_state <= 3'h3;
        end
      end else if (_T_2425) begin
        if (io_dec_tlu_force_halt) begin
          perr_state <= 3'h0;
        end else begin
          perr_state <= 3'h3;
        end
      end else begin
        perr_state <= 3'h0;
      end
    end
    if (reset) begin
      err_stop_state <= 2'h0;
    end else if (err_stop_state_en) begin
      if (_T_2429) begin
        err_stop_state <= 2'h1;
      end else if (_T_2434) begin
        if (_T_2436) begin
          err_stop_state <= 2'h0;
        end else if (_T_2457) begin
          err_stop_state <= 2'h3;
        end else if (io_ifu_fetch_val[0]) begin
          err_stop_state <= 2'h2;
        end else begin
          err_stop_state <= 2'h1;
        end
      end else if (_T_2461) begin
        if (_T_2436) begin
          err_stop_state <= 2'h0;
        end else if (io_ifu_fetch_val[0]) begin
          err_stop_state <= 2'h3;
        end else begin
          err_stop_state <= 2'h2;
        end
      end else if (_T_2478) begin
        if (_T_2482) begin
          err_stop_state <= 2'h0;
        end else if (io_dec_tlu_flush_err_wb) begin
          err_stop_state <= 2'h1;
        end else begin
          err_stop_state <= 2'h3;
        end
      end else begin
        err_stop_state <= 2'h0;
      end
    end
    if (reset) begin
      bus_ifu_bus_clk_en_ff <= 1'h0;
    end else begin
      bus_ifu_bus_clk_en_ff <= io_ifu_bus_clk_en;
    end
    if (reset) begin
      bus_data_beat_count <= 3'h0;
    end else begin
      bus_data_beat_count <= bus_new_data_beat_count;
    end
    if (reset) begin
      ic_miss_buff_data_valid <= 8'h0;
    end else begin
      ic_miss_buff_data_valid <= _T_1345;
    end
    if (reset) begin
      last_data_recieved_ff <= 1'h0;
    end else begin
      last_data_recieved_ff <= last_data_recieved_in;
    end
    if (reset) begin
      sel_mb_addr_ff <= 1'h0;
    end else begin
      sel_mb_addr_ff <= sel_mb_addr;
    end
    if (reset) begin
      ifu_wr_data_comb_err_ff <= 1'h0;
    end else begin
      ifu_wr_data_comb_err_ff <= ifu_wr_cumulative_err;
    end
    if (reset) begin
      scnd_miss_req_q <= 1'h0;
    end else begin
      scnd_miss_req_q <= scnd_miss_req_in;
    end
    if (reset) begin
      ic_act_miss_f_delayed <= 1'h0;
    end else begin
      ic_act_miss_f_delayed <= ic_act_miss_f;
    end
    if (reset) begin
      ic_crit_wd_rdy_new_ff <= 1'h0;
    end else begin
      ic_crit_wd_rdy_new_ff <= ic_crit_wd_rdy_new_in;
    end
    if (reset) begin
      ic_miss_buff_data_error <= 8'h0;
    end else begin
      ic_miss_buff_data_error <= _T_1385;
    end
    if (reset) begin
      ifc_dma_access_ok_prev <= 1'h0;
    end else begin
      ifc_dma_access_ok_prev <= ifc_dma_access_ok_d;
    end
    if (reset) begin
      iccm_ecc_corr_data_ff <= 39'h0;
    end else if (iccm_ecc_write_status) begin
      iccm_ecc_corr_data_ff <= _T_3859;
    end
    if (reset) begin
      dma_mem_addr_ff <= 2'h0;
    end else begin
      dma_mem_addr_ff <= io_dma_mem_addr[3:2];
    end
    if (reset) begin
      dma_mem_tag_ff <= 3'h0;
    end else begin
      dma_mem_tag_ff <= io_dma_mem_tag;
    end
    if (reset) begin
      iccm_dma_rtag <= 3'h0;
    end else begin
      iccm_dma_rtag <= dma_mem_tag_ff;
    end
    if (reset) begin
      iccm_dma_rvalid <= 1'h0;
    end else begin
      iccm_dma_rvalid <= iccm_dma_rvalid_in;
    end
    if (reset) begin
      iccm_dma_rdata <= 64'h0;
    end else if (iccm_dma_ecc_error_in) begin
      iccm_dma_rdata <= _T_3034;
    end else begin
      iccm_dma_rdata <= _T_3035;
    end
    if (reset) begin
      iccm_ecc_corr_index_ff <= 14'h0;
    end else if (iccm_ecc_write_status) begin
      if (iccm_single_ecc_error[0]) begin
        iccm_ecc_corr_index_ff <= iccm_rw_addr_f;
      end else begin
        iccm_ecc_corr_index_ff <= _T_3855;
      end
    end
    if (reset) begin
      iccm_rd_ecc_single_err_ff <= 1'h0;
    end else begin
      iccm_rd_ecc_single_err_ff <= iccm_rd_ecc_single_err_hold_in;
    end
    if (reset) begin
      iccm_rw_addr_f <= 14'h0;
    end else begin
      iccm_rw_addr_f <= io_iccm_rw_addr[14:1];
    end
    if (reset) begin
      ifu_status_wr_addr_ff <= 7'h0;
    end else if (_T_3924) begin
      ifu_status_wr_addr_ff <= io_ic_debug_addr[9:3];
    end else begin
      ifu_status_wr_addr_ff <= ifu_status_wr_addr[11:5];
    end
    if (reset) begin
      ic_valid_ff <= 1'h0;
    end else if (way_status_wr_en_w_debug) begin
      ic_valid_ff <= io_ic_debug_wr_data[0];
    end else begin
      ic_valid_ff <= ic_valid;
    end
  end
  always @(posedge io_active_clk) begin
    if (reset) begin
      reset_all_tags <= 1'h0;
    end else begin
      reset_all_tags <= io_dec_tlu_fence_i_wb;
    end
  end
endmodule
