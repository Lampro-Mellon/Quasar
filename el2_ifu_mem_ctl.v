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
  output        io_iccm_correction_state
);
  assign io_ifu_miss_state_idle = 1'h0; // @[el2_ifu_mem_ctl.scala 129:25]
  assign io_ifu_ic_mb_empty = 1'h0; // @[el2_ifu_mem_ctl.scala 130:21]
  assign io_ic_dma_active = 1'h0; // @[el2_ifu_mem_ctl.scala 131:19]
  assign io_ic_write_stall = 1'h0; // @[el2_ifu_mem_ctl.scala 132:20]
  assign io_ifu_pmu_ic_miss = 1'h0; // @[el2_ifu_mem_ctl.scala 133:21]
  assign io_ifu_pmu_ic_hit = 1'h0; // @[el2_ifu_mem_ctl.scala 134:20]
  assign io_ifu_pmu_bus_error = 1'h0; // @[el2_ifu_mem_ctl.scala 135:23]
  assign io_ifu_pmu_bus_busy = 1'h0; // @[el2_ifu_mem_ctl.scala 136:22]
  assign io_ifu_pmu_bus_trxn = 1'h0; // @[el2_ifu_mem_ctl.scala 137:22]
  assign io_ifu_axi_awvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 138:21]
  assign io_ifu_axi_awid = 3'h0; // @[el2_ifu_mem_ctl.scala 139:18]
  assign io_ifu_axi_awaddr = 32'h0; // @[el2_ifu_mem_ctl.scala 140:20]
  assign io_ifu_axi_awregion = 4'h0; // @[el2_ifu_mem_ctl.scala 199:22]
  assign io_ifu_axi_awlen = 8'h0; // @[el2_ifu_mem_ctl.scala 141:19]
  assign io_ifu_axi_awsize = 3'h0; // @[el2_ifu_mem_ctl.scala 142:20]
  assign io_ifu_axi_awburst = 2'h0; // @[el2_ifu_mem_ctl.scala 143:21]
  assign io_ifu_axi_awlock = 1'h0; // @[el2_ifu_mem_ctl.scala 144:20]
  assign io_ifu_axi_awcache = 4'h0; // @[el2_ifu_mem_ctl.scala 145:21]
  assign io_ifu_axi_awprot = 3'h0; // @[el2_ifu_mem_ctl.scala 146:20]
  assign io_ifu_axi_awqos = 4'h0; // @[el2_ifu_mem_ctl.scala 147:19]
  assign io_ifu_axi_wvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 148:20]
  assign io_ifu_axi_wdata = 64'h0; // @[el2_ifu_mem_ctl.scala 149:19]
  assign io_ifu_axi_wstrb = 8'h0; // @[el2_ifu_mem_ctl.scala 150:19]
  assign io_ifu_axi_wlast = 1'h0; // @[el2_ifu_mem_ctl.scala 151:19]
  assign io_ifu_axi_bready = 1'h0; // @[el2_ifu_mem_ctl.scala 152:20]
  assign io_ifu_axi_arvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 153:21]
  assign io_ifu_axi_arid = 3'h0; // @[el2_ifu_mem_ctl.scala 155:18]
  assign io_ifu_axi_araddr = 32'h0; // @[el2_ifu_mem_ctl.scala 156:20]
  assign io_ifu_axi_arregion = 4'h0; // @[el2_ifu_mem_ctl.scala 157:22]
  assign io_ifu_axi_arlen = 8'h0; // @[el2_ifu_mem_ctl.scala 158:19]
  assign io_ifu_axi_arsize = 3'h0; // @[el2_ifu_mem_ctl.scala 159:20]
  assign io_ifu_axi_arburst = 2'h0; // @[el2_ifu_mem_ctl.scala 160:21]
  assign io_ifu_axi_arlock = 1'h0; // @[el2_ifu_mem_ctl.scala 161:20]
  assign io_ifu_axi_arcache = 4'h0; // @[el2_ifu_mem_ctl.scala 162:21]
  assign io_ifu_axi_arprot = 3'h0; // @[el2_ifu_mem_ctl.scala 163:20]
  assign io_ifu_axi_arqos = 4'h0; // @[el2_ifu_mem_ctl.scala 164:19]
  assign io_ifu_axi_rready = 1'h0; // @[el2_ifu_mem_ctl.scala 165:20]
  assign io_iccm_dma_ecc_error = 1'h0; // @[el2_ifu_mem_ctl.scala 166:24]
  assign io_iccm_dma_rvalid = 1'h0; // @[el2_ifu_mem_ctl.scala 167:21]
  assign io_iccm_dma_rdata = 64'h0; // @[el2_ifu_mem_ctl.scala 168:20]
  assign io_iccm_dma_rtag = 3'h0; // @[el2_ifu_mem_ctl.scala 169:19]
  assign io_iccm_ready = 1'h0; // @[el2_ifu_mem_ctl.scala 170:16]
  assign io_ic_rw_addr = 31'h0; // @[el2_ifu_mem_ctl.scala 171:16]
  assign io_ic_wr_en = 2'h0; // @[el2_ifu_mem_ctl.scala 172:14]
  assign io_ic_rd_en = 1'h0; // @[el2_ifu_mem_ctl.scala 173:14]
  assign io_ic_wr_data_0 = 71'h0; // @[el2_ifu_mem_ctl.scala 174:16]
  assign io_ic_wr_data_1 = 71'h0; // @[el2_ifu_mem_ctl.scala 174:16]
  assign io_ic_debug_wr_data = 71'h0; // @[el2_ifu_mem_ctl.scala 175:22]
  assign io_ifu_ic_debug_rd_data = 71'h0; // @[el2_ifu_mem_ctl.scala 176:26]
  assign io_ic_debug_addr = 10'h0; // @[el2_ifu_mem_ctl.scala 154:19]
  assign io_ic_debug_rd_en = 1'h0; // @[el2_ifu_mem_ctl.scala 126:20]
  assign io_ic_debug_wr_en = 1'h0; // @[el2_ifu_mem_ctl.scala 127:20]
  assign io_ic_debug_tag_array = 1'h0; // @[el2_ifu_mem_ctl.scala 128:24]
  assign io_ic_debug_way = 2'h0; // @[el2_ifu_mem_ctl.scala 198:18]
  assign io_ic_tag_valid = 2'h0; // @[el2_ifu_mem_ctl.scala 177:18]
  assign io_iccm_rw_addr = 15'h0; // @[el2_ifu_mem_ctl.scala 178:18]
  assign io_iccm_wren = 1'h0; // @[el2_ifu_mem_ctl.scala 179:15]
  assign io_iccm_rden = 1'h0; // @[el2_ifu_mem_ctl.scala 180:15]
  assign io_iccm_wr_data = 78'h0; // @[el2_ifu_mem_ctl.scala 181:18]
  assign io_iccm_wr_size = 3'h0; // @[el2_ifu_mem_ctl.scala 182:18]
  assign io_ic_hit_f = 1'h0; // @[el2_ifu_mem_ctl.scala 183:14]
  assign io_ic_access_fault_f = 1'h0; // @[el2_ifu_mem_ctl.scala 184:23]
  assign io_ic_access_fault_type_f = 2'h0; // @[el2_ifu_mem_ctl.scala 185:28]
  assign io_iccm_rd_ecc_single_err = 1'h0; // @[el2_ifu_mem_ctl.scala 186:28]
  assign io_iccm_rd_ecc_double_err = 1'h0; // @[el2_ifu_mem_ctl.scala 187:28]
  assign io_ic_error_start = 1'h0; // @[el2_ifu_mem_ctl.scala 188:20]
  assign io_ifu_async_error_start = 1'h0; // @[el2_ifu_mem_ctl.scala 189:27]
  assign io_iccm_dma_sb_error = 1'h0; // @[el2_ifu_mem_ctl.scala 190:23]
  assign io_ic_fetch_val_f = 2'h0; // @[el2_ifu_mem_ctl.scala 191:20]
  assign io_ic_data_f = 32'h0; // @[el2_ifu_mem_ctl.scala 192:15]
  assign io_ic_premux_data = 64'h0; // @[el2_ifu_mem_ctl.scala 193:20]
  assign io_ic_sel_premux_data = 1'h0; // @[el2_ifu_mem_ctl.scala 194:24]
  assign io_ifu_ic_debug_rd_data_valid = 1'h0; // @[el2_ifu_mem_ctl.scala 195:32]
  assign io_iccm_buf_correct_ecc = 1'h0; // @[el2_ifu_mem_ctl.scala 196:26]
  assign io_iccm_correction_state = 1'h0; // @[el2_ifu_mem_ctl.scala 197:27]
endmodule
