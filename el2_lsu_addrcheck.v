module rvrangecheck(
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:16] == 16'hf004; // @[beh_lib.scala 117:19]
  assign io_in_region = io_addr[31:28] == 4'hf; // @[beh_lib.scala 113:19]
endmodule
module rvrangecheck_2(
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:15] == 17'h1e018; // @[beh_lib.scala 117:19]
  assign io_in_region = io_addr[31:28] == 4'hf; // @[beh_lib.scala 113:19]
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
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] rvrangecheck_io_addr; // @[el2_lsu_addrcheck.scala 45:44]
  wire  rvrangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 45:44]
  wire  rvrangecheck_io_in_region; // @[el2_lsu_addrcheck.scala 45:44]
  wire [31:0] rvrangecheck_1_io_addr; // @[el2_lsu_addrcheck.scala 51:44]
  wire  rvrangecheck_1_io_in_range; // @[el2_lsu_addrcheck.scala 51:44]
  wire  rvrangecheck_1_io_in_region; // @[el2_lsu_addrcheck.scala 51:44]
  wire [31:0] start_addr_pic_rangecheck_io_addr; // @[el2_lsu_addrcheck.scala 74:41]
  wire  start_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 74:41]
  wire  start_addr_pic_rangecheck_io_in_region; // @[el2_lsu_addrcheck.scala 74:41]
  wire [31:0] end_addr_pic_rangecheck_io_addr; // @[el2_lsu_addrcheck.scala 80:39]
  wire  end_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 80:39]
  wire  end_addr_pic_rangecheck_io_in_region; // @[el2_lsu_addrcheck.scala 80:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[el2_lsu_addrcheck.scala 65:45]
  wire  start_addr_in_dccm_region_d = rvrangecheck_io_in_region; // @[el2_lsu_addrcheck.scala 48:41]
  wire  start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_pic_rangecheck_io_in_region; // @[el2_lsu_addrcheck.scala 85:60]
  wire  _T_5 = io_rs1_region_d == 4'hf; // @[el2_lsu_addrcheck.scala 86:54]
  wire  base_reg_dccm_or_pic = _T_5 | _T_5; // @[el2_lsu_addrcheck.scala 86:74]
  wire  start_addr_in_dccm_d = rvrangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 47:41]
  wire  end_addr_in_dccm_d = rvrangecheck_1_io_in_range; // @[el2_lsu_addrcheck.scala 53:41]
  wire [4:0] csr_idx = {io_start_addr_d[31:28],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_13 = io_dec_tlu_mrac_ff >> csr_idx; // @[el2_lsu_addrcheck.scala 92:50]
  wire  _T_16 = start_addr_dccm_or_pic | addr_in_iccm; // @[el2_lsu_addrcheck.scala 92:121]
  wire  _T_17 = ~_T_16; // @[el2_lsu_addrcheck.scala 92:62]
  wire  _T_18 = _T_13[0] & _T_17; // @[el2_lsu_addrcheck.scala 92:60]
  wire  _T_19 = _T_18 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 92:137]
  wire  _T_20 = io_lsu_pkt_d_store | io_lsu_pkt_d_load; // @[el2_lsu_addrcheck.scala 92:180]
  wire  is_sideeffects_d = _T_19 & _T_20; // @[el2_lsu_addrcheck.scala 92:158]
  wire  _T_22 = io_start_addr_d[1:0] == 2'h0; // @[el2_lsu_addrcheck.scala 93:75]
  wire  _T_23 = io_lsu_pkt_d_word & _T_22; // @[el2_lsu_addrcheck.scala 93:51]
  wire  _T_25 = ~io_start_addr_d[0]; // @[el2_lsu_addrcheck.scala 93:128]
  wire  _T_26 = io_lsu_pkt_d_half & _T_25; // @[el2_lsu_addrcheck.scala 93:106]
  wire  _T_27 = _T_23 | _T_26; // @[el2_lsu_addrcheck.scala 93:85]
  wire  is_aligned_d = _T_27 | io_lsu_pkt_d_by; // @[el2_lsu_addrcheck.scala 93:138]
  wire [31:0] _T_38 = io_start_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 98:57]
  wire  _T_40 = _T_38 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 98:82]
  wire [31:0] _T_43 = io_start_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 99:57]
  wire  _T_45 = _T_43 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 99:82]
  wire  _T_47 = _T_40 | _T_45; // @[el2_lsu_addrcheck.scala 98:133]
  wire [31:0] _T_49 = io_start_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 100:57]
  wire  _T_51 = _T_49 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 100:82]
  wire  _T_53 = _T_47 | _T_51; // @[el2_lsu_addrcheck.scala 99:133]
  wire [31:0] _T_55 = io_start_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 101:57]
  wire  _T_57 = _T_55 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 101:82]
  wire  _T_59 = _T_53 | _T_57; // @[el2_lsu_addrcheck.scala 100:133]
  wire [31:0] _T_85 = io_end_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 107:58]
  wire  _T_87 = _T_85 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 107:83]
  wire [31:0] _T_90 = io_end_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 108:59]
  wire  _T_92 = _T_90 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 108:84]
  wire  _T_94 = _T_87 | _T_92; // @[el2_lsu_addrcheck.scala 107:134]
  wire [31:0] _T_96 = io_end_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 109:59]
  wire  _T_98 = _T_96 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 109:84]
  wire  _T_100 = _T_94 | _T_98; // @[el2_lsu_addrcheck.scala 108:135]
  wire [31:0] _T_102 = io_end_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 110:59]
  wire  _T_104 = _T_102 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 110:84]
  wire  _T_106 = _T_100 | _T_104; // @[el2_lsu_addrcheck.scala 109:135]
  wire  non_dccm_access_ok = _T_59 & _T_106; // @[el2_lsu_addrcheck.scala 106:7]
  wire  regpred_access_fault_d = start_addr_dccm_or_pic ^ base_reg_dccm_or_pic; // @[el2_lsu_addrcheck.scala 116:57]
  wire  _T_133 = io_start_addr_d[1:0] != 2'h0; // @[el2_lsu_addrcheck.scala 117:76]
  wire  _T_134 = ~io_lsu_pkt_d_word; // @[el2_lsu_addrcheck.scala 117:92]
  wire  _T_135 = _T_133 | _T_134; // @[el2_lsu_addrcheck.scala 117:90]
  wire  picm_access_fault_d = io_addr_in_pic_d & _T_135; // @[el2_lsu_addrcheck.scala 117:51]
  wire  _T_136 = start_addr_in_dccm_d | start_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 122:87]
  wire  _T_137 = ~_T_136; // @[el2_lsu_addrcheck.scala 122:64]
  wire  _T_138 = start_addr_in_dccm_region_d & _T_137; // @[el2_lsu_addrcheck.scala 122:62]
  wire  _T_139 = end_addr_in_dccm_d | end_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 124:57]
  wire  _T_140 = ~_T_139; // @[el2_lsu_addrcheck.scala 124:36]
  wire  end_addr_in_dccm_region_d = rvrangecheck_1_io_in_region; // @[el2_lsu_addrcheck.scala 54:41]
  wire  _T_141 = end_addr_in_dccm_region_d & _T_140; // @[el2_lsu_addrcheck.scala 124:34]
  wire  _T_142 = _T_138 | _T_141; // @[el2_lsu_addrcheck.scala 122:112]
  wire  _T_143 = start_addr_in_dccm_d & end_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 126:29]
  wire  _T_144 = _T_142 | _T_143; // @[el2_lsu_addrcheck.scala 124:85]
  wire  _T_145 = start_addr_pic_rangecheck_io_in_range & end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 128:29]
  wire  unmapped_access_fault_d = _T_144 | _T_145; // @[el2_lsu_addrcheck.scala 126:85]
  wire  _T_147 = ~start_addr_in_dccm_region_d; // @[el2_lsu_addrcheck.scala 130:33]
  wire  _T_148 = ~non_dccm_access_ok; // @[el2_lsu_addrcheck.scala 130:64]
  wire  mpu_access_fault_d = _T_147 & _T_148; // @[el2_lsu_addrcheck.scala 130:62]
  wire  _T_150 = unmapped_access_fault_d | mpu_access_fault_d; // @[el2_lsu_addrcheck.scala 142:49]
  wire  _T_151 = _T_150 | picm_access_fault_d; // @[el2_lsu_addrcheck.scala 142:70]
  wire  _T_152 = _T_151 | regpred_access_fault_d; // @[el2_lsu_addrcheck.scala 142:92]
  wire  _T_153 = _T_152 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 142:118]
  wire  _T_154 = ~io_lsu_pkt_d_dma; // @[el2_lsu_addrcheck.scala 142:141]
  wire [3:0] _T_160 = picm_access_fault_d ? 4'h6 : 4'h0; // @[el2_lsu_addrcheck.scala 143:164]
  wire [3:0] _T_161 = regpred_access_fault_d ? 4'h5 : _T_160; // @[el2_lsu_addrcheck.scala 143:120]
  wire [3:0] _T_162 = mpu_access_fault_d ? 4'h3 : _T_161; // @[el2_lsu_addrcheck.scala 143:80]
  wire [3:0] access_fault_mscause_d = unmapped_access_fault_d ? 4'h2 : _T_162; // @[el2_lsu_addrcheck.scala 143:35]
  wire  regcross_misaligned_fault_d = io_start_addr_d[31:28] != io_end_addr_d[31:28]; // @[el2_lsu_addrcheck.scala 144:61]
  wire  _T_165 = ~is_aligned_d; // @[el2_lsu_addrcheck.scala 145:59]
  wire  sideeffect_misaligned_fault_d = is_sideeffects_d & _T_165; // @[el2_lsu_addrcheck.scala 145:57]
  wire  _T_166 = sideeffect_misaligned_fault_d & io_addr_external_d; // @[el2_lsu_addrcheck.scala 146:90]
  wire  _T_167 = regcross_misaligned_fault_d | _T_166; // @[el2_lsu_addrcheck.scala 146:57]
  wire  _T_168 = _T_167 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 146:113]
  wire [3:0] _T_172 = sideeffect_misaligned_fault_d ? 4'h1 : 4'h0; // @[el2_lsu_addrcheck.scala 147:80]
  wire [3:0] misaligned_fault_mscause_d = regcross_misaligned_fault_d ? 4'h2 : _T_172; // @[el2_lsu_addrcheck.scala 147:39]
  wire  _T_177 = ~start_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 149:66]
  wire  _T_178 = start_addr_in_dccm_region_d & _T_177; // @[el2_lsu_addrcheck.scala 149:64]
  wire  _T_179 = ~end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 149:120]
  wire  _T_180 = end_addr_in_dccm_region_d & _T_179; // @[el2_lsu_addrcheck.scala 149:118]
  wire  _T_181 = _T_178 | _T_180; // @[el2_lsu_addrcheck.scala 149:88]
  wire  _T_182 = _T_181 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 149:142]
  wire  _T_184 = start_addr_in_dccm_region_d & end_addr_in_dccm_region_d; // @[el2_lsu_addrcheck.scala 150:66]
  wire  _T_185 = ~_T_184; // @[el2_lsu_addrcheck.scala 150:36]
  wire  _T_186 = _T_185 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 150:95]
  reg  _T_188; // @[el2_lsu_addrcheck.scala 152:60]
  rvrangecheck rvrangecheck ( // @[el2_lsu_addrcheck.scala 45:44]
    .io_addr(rvrangecheck_io_addr),
    .io_in_range(rvrangecheck_io_in_range),
    .io_in_region(rvrangecheck_io_in_region)
  );
  rvrangecheck rvrangecheck_1 ( // @[el2_lsu_addrcheck.scala 51:44]
    .io_addr(rvrangecheck_1_io_addr),
    .io_in_range(rvrangecheck_1_io_in_range),
    .io_in_region(rvrangecheck_1_io_in_region)
  );
  rvrangecheck_2 start_addr_pic_rangecheck ( // @[el2_lsu_addrcheck.scala 74:41]
    .io_addr(start_addr_pic_rangecheck_io_addr),
    .io_in_range(start_addr_pic_rangecheck_io_in_range),
    .io_in_region(start_addr_pic_rangecheck_io_in_region)
  );
  rvrangecheck_2 end_addr_pic_rangecheck ( // @[el2_lsu_addrcheck.scala 80:39]
    .io_addr(end_addr_pic_rangecheck_io_addr),
    .io_in_range(end_addr_pic_rangecheck_io_in_range),
    .io_in_region(end_addr_pic_rangecheck_io_in_region)
  );
  assign io_is_sideeffects_m = _T_188; // @[el2_lsu_addrcheck.scala 152:50]
  assign io_addr_in_dccm_d = start_addr_in_dccm_d & end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 87:32]
  assign io_addr_in_pic_d = start_addr_pic_rangecheck_io_in_range & end_addr_pic_rangecheck_io_in_range; // @[el2_lsu_addrcheck.scala 88:32]
  assign io_addr_external_d = ~start_addr_dccm_or_pic; // @[el2_lsu_addrcheck.scala 90:30]
  assign io_access_fault_d = _T_153 & _T_154; // @[el2_lsu_addrcheck.scala 142:21]
  assign io_misaligned_fault_d = _T_168 & _T_154; // @[el2_lsu_addrcheck.scala 146:25]
  assign io_exc_mscause_d = io_misaligned_fault_d ? misaligned_fault_mscause_d : access_fault_mscause_d; // @[el2_lsu_addrcheck.scala 148:21]
  assign io_fir_dccm_access_error_d = _T_182 & io_lsu_pkt_d_fast_int; // @[el2_lsu_addrcheck.scala 149:31]
  assign io_fir_nondccm_access_error_d = _T_186 & io_lsu_pkt_d_fast_int; // @[el2_lsu_addrcheck.scala 150:33]
  assign rvrangecheck_io_addr = io_start_addr_d; // @[el2_lsu_addrcheck.scala 46:41]
  assign rvrangecheck_1_io_addr = io_end_addr_d; // @[el2_lsu_addrcheck.scala 52:41]
  assign start_addr_pic_rangecheck_io_addr = io_start_addr_d; // @[el2_lsu_addrcheck.scala 75:37]
  assign end_addr_pic_rangecheck_io_addr = io_end_addr_d; // @[el2_lsu_addrcheck.scala 81:35]
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
  _T_188 = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_188 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_188 <= 1'h0;
    end else begin
      _T_188 <= _T_19 & _T_20;
    end
  end
endmodule
