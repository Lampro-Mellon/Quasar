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
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[el2_lib.scala 253:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 258:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[el2_lib.scala 253:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 258:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[el2_lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 258:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 258:39]
  wire  start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_dccm_region_d; // @[el2_lsu_addrcheck.scala 54:60]
  wire  _T_17 = io_rs1_region_d == 4'hf; // @[el2_lsu_addrcheck.scala 55:54]
  wire  base_reg_dccm_or_pic = _T_17 | _T_17; // @[el2_lsu_addrcheck.scala 55:73]
  wire [4:0] csr_idx = {io_start_addr_d[31:28],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_25 = io_dec_tlu_mrac_ff >> csr_idx; // @[el2_lsu_addrcheck.scala 61:50]
  wire  _T_28 = start_addr_dccm_or_pic | addr_in_iccm; // @[el2_lsu_addrcheck.scala 61:121]
  wire  _T_29 = ~_T_28; // @[el2_lsu_addrcheck.scala 61:62]
  wire  _T_30 = _T_25[0] & _T_29; // @[el2_lsu_addrcheck.scala 61:60]
  wire  _T_31 = _T_30 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 61:137]
  wire  _T_32 = io_lsu_pkt_d_store | io_lsu_pkt_d_load; // @[el2_lsu_addrcheck.scala 61:180]
  wire  is_sideeffects_d = _T_31 & _T_32; // @[el2_lsu_addrcheck.scala 61:158]
  wire  _T_34 = io_start_addr_d[1:0] == 2'h0; // @[el2_lsu_addrcheck.scala 62:75]
  wire  _T_35 = io_lsu_pkt_d_word & _T_34; // @[el2_lsu_addrcheck.scala 62:51]
  wire  _T_37 = ~io_start_addr_d[0]; // @[el2_lsu_addrcheck.scala 62:128]
  wire  _T_38 = io_lsu_pkt_d_half & _T_37; // @[el2_lsu_addrcheck.scala 62:106]
  wire  _T_39 = _T_35 | _T_38; // @[el2_lsu_addrcheck.scala 62:85]
  wire  is_aligned_d = _T_39 | io_lsu_pkt_d_by; // @[el2_lsu_addrcheck.scala 62:138]
  wire [31:0] _T_50 = io_start_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 67:54]
  wire  _T_52 = _T_50 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 67:76]
  wire [31:0] _T_55 = io_start_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 68:54]
  wire  _T_57 = _T_55 == 32'h3fffffff; // @[el2_lsu_addrcheck.scala 68:76]
  wire  _T_59 = _T_52 | _T_57; // @[el2_lsu_addrcheck.scala 67:121]
  wire [31:0] _T_61 = io_start_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 69:54]
  wire  _T_63 = _T_61 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 69:76]
  wire  _T_65 = _T_59 | _T_63; // @[el2_lsu_addrcheck.scala 68:121]
  wire [31:0] _T_67 = io_start_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 70:54]
  wire  _T_69 = _T_67 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 70:76]
  wire  _T_71 = _T_65 | _T_69; // @[el2_lsu_addrcheck.scala 69:121]
  wire [31:0] _T_97 = io_end_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:55]
  wire  _T_99 = _T_97 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:77]
  wire [31:0] _T_102 = io_end_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 77:56]
  wire  _T_104 = _T_102 == 32'h3fffffff; // @[el2_lsu_addrcheck.scala 77:78]
  wire  _T_106 = _T_99 | _T_104; // @[el2_lsu_addrcheck.scala 76:122]
  wire [31:0] _T_108 = io_end_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 78:56]
  wire  _T_110 = _T_108 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 78:78]
  wire  _T_112 = _T_106 | _T_110; // @[el2_lsu_addrcheck.scala 77:123]
  wire [31:0] _T_114 = io_end_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 79:56]
  wire  _T_116 = _T_114 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 79:78]
  wire  _T_118 = _T_112 | _T_116; // @[el2_lsu_addrcheck.scala 78:123]
  wire  non_dccm_access_ok = _T_71 & _T_118; // @[el2_lsu_addrcheck.scala 75:7]
  wire  regpred_access_fault_d = start_addr_dccm_or_pic ^ base_reg_dccm_or_pic; // @[el2_lsu_addrcheck.scala 85:57]
  wire  _T_145 = io_start_addr_d[1:0] != 2'h0; // @[el2_lsu_addrcheck.scala 86:76]
  wire  _T_146 = ~io_lsu_pkt_d_word; // @[el2_lsu_addrcheck.scala 86:92]
  wire  _T_147 = _T_145 | _T_146; // @[el2_lsu_addrcheck.scala 86:90]
  wire  picm_access_fault_d = io_addr_in_pic_d & _T_147; // @[el2_lsu_addrcheck.scala 86:51]
  wire  _T_148 = start_addr_in_dccm_d | start_addr_in_pic_d; // @[el2_lsu_addrcheck.scala 91:87]
  wire  _T_149 = ~_T_148; // @[el2_lsu_addrcheck.scala 91:64]
  wire  _T_150 = start_addr_in_dccm_region_d & _T_149; // @[el2_lsu_addrcheck.scala 91:62]
  wire  _T_151 = end_addr_in_dccm_d | end_addr_in_pic_d; // @[el2_lsu_addrcheck.scala 93:57]
  wire  _T_152 = ~_T_151; // @[el2_lsu_addrcheck.scala 93:36]
  wire  _T_153 = end_addr_in_dccm_region_d & _T_152; // @[el2_lsu_addrcheck.scala 93:34]
  wire  _T_154 = _T_150 | _T_153; // @[el2_lsu_addrcheck.scala 91:112]
  wire  _T_155 = start_addr_in_dccm_d & end_addr_in_pic_d; // @[el2_lsu_addrcheck.scala 95:29]
  wire  _T_156 = _T_154 | _T_155; // @[el2_lsu_addrcheck.scala 93:85]
  wire  _T_157 = start_addr_in_pic_d & end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 97:29]
  wire  unmapped_access_fault_d = _T_156 | _T_157; // @[el2_lsu_addrcheck.scala 95:85]
  wire  _T_159 = ~start_addr_in_dccm_region_d; // @[el2_lsu_addrcheck.scala 99:33]
  wire  _T_160 = ~non_dccm_access_ok; // @[el2_lsu_addrcheck.scala 99:64]
  wire  mpu_access_fault_d = _T_159 & _T_160; // @[el2_lsu_addrcheck.scala 99:62]
  wire  _T_162 = unmapped_access_fault_d | mpu_access_fault_d; // @[el2_lsu_addrcheck.scala 111:49]
  wire  _T_163 = _T_162 | picm_access_fault_d; // @[el2_lsu_addrcheck.scala 111:70]
  wire  _T_164 = _T_163 | regpred_access_fault_d; // @[el2_lsu_addrcheck.scala 111:92]
  wire  _T_165 = _T_164 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 111:118]
  wire  _T_166 = ~io_lsu_pkt_d_dma; // @[el2_lsu_addrcheck.scala 111:141]
  wire [3:0] _T_172 = picm_access_fault_d ? 4'h6 : 4'h0; // @[el2_lsu_addrcheck.scala 112:164]
  wire [3:0] _T_173 = regpred_access_fault_d ? 4'h5 : _T_172; // @[el2_lsu_addrcheck.scala 112:120]
  wire [3:0] _T_174 = mpu_access_fault_d ? 4'h3 : _T_173; // @[el2_lsu_addrcheck.scala 112:80]
  wire [3:0] access_fault_mscause_d = unmapped_access_fault_d ? 4'h2 : _T_174; // @[el2_lsu_addrcheck.scala 112:35]
  wire  regcross_misaligned_fault_d = io_start_addr_d[31:28] != io_end_addr_d[31:28]; // @[el2_lsu_addrcheck.scala 113:61]
  wire  _T_177 = ~is_aligned_d; // @[el2_lsu_addrcheck.scala 114:59]
  wire  sideeffect_misaligned_fault_d = is_sideeffects_d & _T_177; // @[el2_lsu_addrcheck.scala 114:57]
  wire  _T_178 = sideeffect_misaligned_fault_d & io_addr_external_d; // @[el2_lsu_addrcheck.scala 115:90]
  wire  _T_179 = regcross_misaligned_fault_d | _T_178; // @[el2_lsu_addrcheck.scala 115:57]
  wire  _T_180 = _T_179 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 115:113]
  wire [3:0] _T_184 = sideeffect_misaligned_fault_d ? 4'h1 : 4'h0; // @[el2_lsu_addrcheck.scala 116:80]
  wire [3:0] misaligned_fault_mscause_d = regcross_misaligned_fault_d ? 4'h2 : _T_184; // @[el2_lsu_addrcheck.scala 116:39]
  wire  _T_189 = ~start_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 118:66]
  wire  _T_190 = start_addr_in_dccm_region_d & _T_189; // @[el2_lsu_addrcheck.scala 118:64]
  wire  _T_191 = ~end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 118:120]
  wire  _T_192 = end_addr_in_dccm_region_d & _T_191; // @[el2_lsu_addrcheck.scala 118:118]
  wire  _T_193 = _T_190 | _T_192; // @[el2_lsu_addrcheck.scala 118:88]
  wire  _T_194 = _T_193 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 118:142]
  wire  _T_196 = start_addr_in_dccm_region_d & end_addr_in_dccm_region_d; // @[el2_lsu_addrcheck.scala 119:66]
  wire  _T_197 = ~_T_196; // @[el2_lsu_addrcheck.scala 119:36]
  wire  _T_198 = _T_197 & io_lsu_pkt_d_valid; // @[el2_lsu_addrcheck.scala 119:95]
  reg  _T_200; // @[el2_lsu_addrcheck.scala 121:60]
  assign io_is_sideeffects_m = _T_200; // @[el2_lsu_addrcheck.scala 121:50]
  assign io_addr_in_dccm_d = start_addr_in_dccm_d & end_addr_in_dccm_d; // @[el2_lsu_addrcheck.scala 56:32]
  assign io_addr_in_pic_d = start_addr_in_pic_d & end_addr_in_pic_d; // @[el2_lsu_addrcheck.scala 57:32]
  assign io_addr_external_d = ~start_addr_dccm_or_pic; // @[el2_lsu_addrcheck.scala 59:30]
  assign io_access_fault_d = _T_165 & _T_166; // @[el2_lsu_addrcheck.scala 111:21]
  assign io_misaligned_fault_d = _T_180 & _T_166; // @[el2_lsu_addrcheck.scala 115:25]
  assign io_exc_mscause_d = io_misaligned_fault_d ? misaligned_fault_mscause_d : access_fault_mscause_d; // @[el2_lsu_addrcheck.scala 117:21]
  assign io_fir_dccm_access_error_d = _T_194 & io_lsu_pkt_d_fast_int; // @[el2_lsu_addrcheck.scala 118:31]
  assign io_fir_nondccm_access_error_d = _T_198 & io_lsu_pkt_d_fast_int; // @[el2_lsu_addrcheck.scala 119:33]
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
  _T_200 = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_200 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_200 <= 1'h0;
    end else begin
      _T_200 <= _T_31 & _T_32;
    end
  end
endmodule
