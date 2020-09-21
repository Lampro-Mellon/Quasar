module el2_ifu_ifc_ctrl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_rst_l,
  input         io_scan_mode,
  input         io_ic_hit_f,
  input         io_ifu_ic_mb_empty,
  input         io_ifu_fb_consume1,
  input         io_ifu_fb_consume2,
  input         io_dec_tlu_flush_noredir_wb,
  input         io_exu_flush_final,
  input  [31:0] io_exu_flush_path_final,
  input         io_ifu_bp_hit_taken_f,
  input  [31:0] io_ifu_bp_btb_target_f,
  input         io_ic_dma_active,
  input         io_ic_write_stall,
  input         io_dma_iccm_stall_any,
  input  [31:0] io_dec_tlu_mrac_ff,
  output [31:0] io_ifc_fetch_addr_f,
  output [31:0] io_ifc_fetch_addr_bf,
  output        io_ifc_fetch_req_f,
  output        io_ifu_pmu_fetch_stall,
  output        io_ifc_fetch_uncacheable_bf,
  output        io_ifc_fetch_req_bf,
  output        io_ifc_fetch_req_bf_raw,
  output        io_ifc_iccm_access_bf,
  output        io_ifc_region_acc_fault_bf,
  output        io_ifc_dma_access_ok,
  input         io_testin,
  output [31:0] io_test1
);
  wire [29:0] _T_35 = io_ifc_fetch_addr_f[31:2] + 30'h1; // @[el2_ifu_ifc_ctrl.scala 88:53]
  wire [30:0] _T_36 = {_T_35,1'h0}; // @[Cat.scala 29:58]
  assign io_ifc_fetch_addr_f = 32'h0; // @[el2_ifu_ifc_ctrl.scala 39:23]
  assign io_ifc_fetch_addr_bf = 32'h0; // @[el2_ifu_ifc_ctrl.scala 40:24]
  assign io_ifc_fetch_req_f = 1'h0; // @[el2_ifu_ifc_ctrl.scala 41:22]
  assign io_ifu_pmu_fetch_stall = 1'h0; // @[el2_ifu_ifc_ctrl.scala 42:26]
  assign io_ifc_fetch_uncacheable_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 43:31]
  assign io_ifc_fetch_req_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 44:23]
  assign io_ifc_fetch_req_bf_raw = 1'h0; // @[el2_ifu_ifc_ctrl.scala 45:27]
  assign io_ifc_iccm_access_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 46:25]
  assign io_ifc_region_acc_fault_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 47:30]
  assign io_ifc_dma_access_ok = 1'h0; // @[el2_ifu_ifc_ctrl.scala 48:24]
  assign io_test1 = {{1'd0}, _T_36}; // @[el2_ifu_ifc_ctrl.scala 89:12]
endmodule
