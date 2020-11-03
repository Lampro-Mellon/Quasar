module rvrangecheck(
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:15] == 17'h0; // @[beh_lib.scala 147:17]
  assign io_in_region = io_addr[31:28] == 4'h0; // @[beh_lib.scala 143:17]
endmodule
module el2_lsu_addrcheck(
  input         clock,
  input         reset,
  input         io_lsu_c2_m_clk,
  input  [31:0] io_start_addr_d,
  input  [31:0] io_end_addr_d,
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
  input  [31:0] io_dec_tlu_mrac_ff,
  input  [3:0]  io_rs1_region_d,
  input  [31:0] io_rs1_d,
  output        io_is_sideeffects_m,
  output        io_addr_in_dccm_d,
  output        io_addr_in_pic_d,
  output        io_addr_external_d,
  output        io_access_fault_d,
  output        io_misaligned_fault_d,
  output [3:0]  io_exc_mscause_d,
  output        io_fir_dccm_access_error_d,
  output        io_fir_nondccm_access_error_d,
  input         io_scan_mode
);
  wire [31:0] start_addr_pic_rangecheck_io_addr; // @[w.scala 78:41]
  wire  start_addr_pic_rangecheck_io_in_range; // @[w.scala 78:41]
  wire  start_addr_pic_rangecheck_io_in_region; // @[w.scala 78:41]
  wire [31:0] end_addr_pic_rangecheck_io_addr; // @[w.scala 84:39]
  wire  end_addr_pic_rangecheck_io_in_range; // @[w.scala 84:39]
  wire  end_addr_pic_rangecheck_io_in_region; // @[w.scala 84:39]
  wire  start_addr_dccm_or_pic = start_addr_pic_rangecheck_io_in_region; // @[w.scala 89:60]
  wire  _T_3 = io_rs1_region_d == 4'hf; // @[w.scala 90:54]
  wire  base_reg_dccm_or_pic = _T_3 | _T_3; // @[w.scala 90:73]
  wire [31:0] _T_36 = io_start_addr_d | 32'h7fffffff; // @[w.scala 102:56]
  wire  _T_38 = _T_36 == 32'h7fffffff; // @[w.scala 102:80]
  wire [31:0] _T_41 = io_start_addr_d | 32'h3fffffff; // @[w.scala 103:56]
  wire  _T_43 = _T_41 == 32'hffffffff; // @[w.scala 103:80]
  wire  _T_45 = _T_38 | _T_43; // @[w.scala 102:129]
  wire [31:0] _T_47 = io_start_addr_d | 32'h1fffffff; // @[w.scala 104:56]
  wire  _T_49 = _T_47 == 32'hbfffffff; // @[w.scala 104:80]
  wire  _T_51 = _T_45 | _T_49; // @[w.scala 103:129]
  wire [31:0] _T_53 = io_start_addr_d | 32'hfffffff; // @[w.scala 105:56]
  wire  _T_55 = _T_53 == 32'h8fffffff; // @[w.scala 105:80]
  wire  _T_57 = _T_51 | _T_55; // @[w.scala 104:129]
  wire [31:0] _T_83 = io_end_addr_d | 32'h7fffffff; // @[w.scala 111:57]
  wire  _T_85 = _T_83 == 32'h7fffffff; // @[w.scala 111:81]
  wire [31:0] _T_88 = io_end_addr_d | 32'h3fffffff; // @[w.scala 112:58]
  wire  _T_90 = _T_88 == 32'hffffffff; // @[w.scala 112:82]
  wire  _T_92 = _T_85 | _T_90; // @[w.scala 111:130]
  wire [31:0] _T_94 = io_end_addr_d | 32'h1fffffff; // @[w.scala 113:58]
  wire  _T_96 = _T_94 == 32'hbfffffff; // @[w.scala 113:82]
  wire  _T_98 = _T_92 | _T_96; // @[w.scala 112:131]
  wire [31:0] _T_100 = io_end_addr_d | 32'hfffffff; // @[w.scala 114:58]
  wire  _T_102 = _T_100 == 32'h8fffffff; // @[w.scala 114:82]
  wire  _T_104 = _T_98 | _T_102; // @[w.scala 113:131]
  wire  non_dccm_access_ok = _T_57 & _T_104; // @[w.scala 110:7]
  wire  regpred_access_fault_d = start_addr_dccm_or_pic ^ base_reg_dccm_or_pic; // @[w.scala 120:57]
  wire  _T_131 = io_start_addr_d[1:0] != 2'h0; // @[w.scala 121:76]
  wire  _T_132 = ~io_lsu_pkt_d_word; // @[w.scala 121:92]
  wire  _T_133 = _T_131 | _T_132; // @[w.scala 121:90]
  wire  picm_access_fault_d = io_addr_in_pic_d & _T_133; // @[w.scala 121:51]
  wire  mpu_access_fault_d = ~non_dccm_access_ok; // @[w.scala 134:64]
  wire  _T_149 = mpu_access_fault_d | picm_access_fault_d; // @[w.scala 146:70]
  wire  _T_150 = _T_149 | regpred_access_fault_d; // @[w.scala 146:92]
  wire  _T_151 = _T_150 & io_lsu_pkt_d_valid; // @[w.scala 146:118]
  wire  _T_152 = ~io_lsu_pkt_d_dma; // @[w.scala 146:141]
  wire [3:0] _T_158 = picm_access_fault_d ? 4'h6 : 4'h0; // @[w.scala 147:164]
  wire [3:0] _T_159 = regpred_access_fault_d ? 4'h5 : _T_158; // @[w.scala 147:120]
  wire [3:0] access_fault_mscause_d = mpu_access_fault_d ? 4'h3 : _T_159; // @[w.scala 147:80]
  wire  regcross_misaligned_fault_d = io_start_addr_d[31:28] != io_end_addr_d[31:28]; // @[w.scala 148:61]
  wire  _T_166 = regcross_misaligned_fault_d & io_lsu_pkt_d_valid; // @[w.scala 150:113]
  wire [3:0] misaligned_fault_mscause_d = regcross_misaligned_fault_d ? 4'h2 : 4'h0; // @[w.scala 151:39]
  rvrangecheck start_addr_pic_rangecheck ( // @[w.scala 78:41]
    .io_addr(start_addr_pic_rangecheck_io_addr),
    .io_in_range(start_addr_pic_rangecheck_io_in_range),
    .io_in_region(start_addr_pic_rangecheck_io_in_region)
  );
  rvrangecheck end_addr_pic_rangecheck ( // @[w.scala 84:39]
    .io_addr(end_addr_pic_rangecheck_io_addr),
    .io_in_range(end_addr_pic_rangecheck_io_in_range),
    .io_in_region(end_addr_pic_rangecheck_io_in_region)
  );
  assign io_is_sideeffects_m = 1'h0; // @[w.scala 156:50]
  assign io_addr_in_dccm_d = 1'h0; // @[w.scala 91:32]
  assign io_addr_in_pic_d = start_addr_pic_rangecheck_io_in_range & end_addr_pic_rangecheck_io_in_range; // @[w.scala 92:32]
  assign io_addr_external_d = ~start_addr_dccm_or_pic; // @[w.scala 94:30]
  assign io_access_fault_d = _T_151 & _T_152; // @[w.scala 146:21]
  assign io_misaligned_fault_d = _T_166 & _T_152; // @[w.scala 150:25]
  assign io_exc_mscause_d = io_misaligned_fault_d ? misaligned_fault_mscause_d : access_fault_mscause_d; // @[w.scala 152:21]
  assign io_fir_dccm_access_error_d = 1'h0; // @[w.scala 153:31]
  assign io_fir_nondccm_access_error_d = io_lsu_pkt_d_valid & io_lsu_pkt_d_fast_int; // @[w.scala 154:33]
  assign start_addr_pic_rangecheck_io_addr = io_start_addr_d; // @[w.scala 79:37]
  assign end_addr_pic_rangecheck_io_addr = io_end_addr_d; // @[w.scala 85:35]
endmodule
