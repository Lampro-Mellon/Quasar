module lsu_addrcheck(
  input         reset,
  input         io_lsu_c2_m_clk,
  input  [31:0] io_start_addr_d,
  input  [31:0] io_end_addr_d,
  input         io_lsu_pkt_d_valid,
  input         io_lsu_pkt_d_bits_fast_int,
  input         io_lsu_pkt_d_bits_by,
  input         io_lsu_pkt_d_bits_half,
  input         io_lsu_pkt_d_bits_word,
  input         io_lsu_pkt_d_bits_load,
  input         io_lsu_pkt_d_bits_store,
  input         io_lsu_pkt_d_bits_dma,
  input  [31:0] io_dec_tlu_mrac_ff,
  input  [3:0]  io_rs1_region_d,
  output        io_is_sideeffects_m,
  output        io_addr_in_dccm_d,
  output        io_addr_in_pic_d,
  output        io_addr_external_d,
  output        io_access_fault_d,
  output        io_misaligned_fault_d,
  output [3:0]  io_exc_mscause_d,
  output        io_fir_dccm_access_error_d,
  output        io_fir_nondccm_access_error_d
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[lib.scala 340:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[lib.scala 345:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[lib.scala 340:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[lib.scala 345:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[lib.scala 345:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[lib.scala 345:39]
  wire  start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 54:60]
  wire  _T_17 = io_rs1_region_d == 4'hf; // @[lsu_addrcheck.scala 55:54]
  wire  base_reg_dccm_or_pic = _T_17 | _T_17; // @[lsu_addrcheck.scala 55:73]
  wire [4:0] csr_idx = {io_start_addr_d[31:28],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_25 = io_dec_tlu_mrac_ff >> csr_idx; // @[lsu_addrcheck.scala 61:50]
  wire  _T_28 = start_addr_dccm_or_pic | addr_in_iccm; // @[lsu_addrcheck.scala 61:121]
  wire  _T_29 = ~_T_28; // @[lsu_addrcheck.scala 61:62]
  wire  _T_30 = _T_25[0] & _T_29; // @[lsu_addrcheck.scala 61:60]
  wire  _T_31 = _T_30 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 61:137]
  wire  _T_32 = io_lsu_pkt_d_bits_store | io_lsu_pkt_d_bits_load; // @[lsu_addrcheck.scala 61:185]
  wire  is_sideeffects_d = _T_31 & _T_32; // @[lsu_addrcheck.scala 61:158]
  wire  _T_34 = io_start_addr_d[1:0] == 2'h0; // @[lsu_addrcheck.scala 62:80]
  wire  _T_35 = io_lsu_pkt_d_bits_word & _T_34; // @[lsu_addrcheck.scala 62:56]
  wire  _T_37 = ~io_start_addr_d[0]; // @[lsu_addrcheck.scala 62:138]
  wire  _T_38 = io_lsu_pkt_d_bits_half & _T_37; // @[lsu_addrcheck.scala 62:116]
  wire  _T_39 = _T_35 | _T_38; // @[lsu_addrcheck.scala 62:90]
  wire  is_aligned_d = _T_39 | io_lsu_pkt_d_bits_by; // @[lsu_addrcheck.scala 62:148]
  wire [31:0] _T_50 = io_start_addr_d | 32'h7fffffff; // @[lsu_addrcheck.scala 67:56]
  wire  _T_52 = _T_50 == 32'h7fffffff; // @[lsu_addrcheck.scala 67:88]
  wire [31:0] _T_55 = io_start_addr_d | 32'h3fffffff; // @[lsu_addrcheck.scala 68:56]
  wire  _T_57 = _T_55 == 32'hffffffff; // @[lsu_addrcheck.scala 68:88]
  wire  _T_59 = _T_52 | _T_57; // @[lsu_addrcheck.scala 67:153]
  wire [31:0] _T_61 = io_start_addr_d | 32'h1fffffff; // @[lsu_addrcheck.scala 69:56]
  wire  _T_63 = _T_61 == 32'hbfffffff; // @[lsu_addrcheck.scala 69:88]
  wire  _T_65 = _T_59 | _T_63; // @[lsu_addrcheck.scala 68:153]
  wire [31:0] _T_67 = io_start_addr_d | 32'hfffffff; // @[lsu_addrcheck.scala 70:56]
  wire  _T_69 = _T_67 == 32'h8fffffff; // @[lsu_addrcheck.scala 70:88]
  wire  _T_71 = _T_65 | _T_69; // @[lsu_addrcheck.scala 69:153]
  wire [31:0] _T_97 = io_end_addr_d | 32'h7fffffff; // @[lsu_addrcheck.scala 76:57]
  wire  _T_99 = _T_97 == 32'h7fffffff; // @[lsu_addrcheck.scala 76:89]
  wire [31:0] _T_102 = io_end_addr_d | 32'h3fffffff; // @[lsu_addrcheck.scala 77:58]
  wire  _T_104 = _T_102 == 32'hffffffff; // @[lsu_addrcheck.scala 77:90]
  wire  _T_106 = _T_99 | _T_104; // @[lsu_addrcheck.scala 76:154]
  wire [31:0] _T_108 = io_end_addr_d | 32'h1fffffff; // @[lsu_addrcheck.scala 78:58]
  wire  _T_110 = _T_108 == 32'hbfffffff; // @[lsu_addrcheck.scala 78:90]
  wire  _T_112 = _T_106 | _T_110; // @[lsu_addrcheck.scala 77:155]
  wire [31:0] _T_114 = io_end_addr_d | 32'hfffffff; // @[lsu_addrcheck.scala 79:58]
  wire  _T_116 = _T_114 == 32'h8fffffff; // @[lsu_addrcheck.scala 79:90]
  wire  _T_118 = _T_112 | _T_116; // @[lsu_addrcheck.scala 78:155]
  wire  non_dccm_access_ok = _T_71 & _T_118; // @[lsu_addrcheck.scala 75:7]
  wire  regpred_access_fault_d = start_addr_dccm_or_pic ^ base_reg_dccm_or_pic; // @[lsu_addrcheck.scala 85:57]
  wire  _T_145 = io_start_addr_d[1:0] != 2'h0; // @[lsu_addrcheck.scala 86:76]
  wire  _T_146 = ~io_lsu_pkt_d_bits_word; // @[lsu_addrcheck.scala 86:92]
  wire  _T_147 = _T_145 | _T_146; // @[lsu_addrcheck.scala 86:90]
  wire  picm_access_fault_d = io_addr_in_pic_d & _T_147; // @[lsu_addrcheck.scala 86:51]
  wire  _T_148 = start_addr_in_dccm_d | start_addr_in_pic_d; // @[lsu_addrcheck.scala 91:87]
  wire  _T_149 = ~_T_148; // @[lsu_addrcheck.scala 91:64]
  wire  _T_150 = start_addr_in_dccm_region_d & _T_149; // @[lsu_addrcheck.scala 91:62]
  wire  _T_151 = end_addr_in_dccm_d | end_addr_in_pic_d; // @[lsu_addrcheck.scala 93:57]
  wire  _T_152 = ~_T_151; // @[lsu_addrcheck.scala 93:36]
  wire  _T_153 = end_addr_in_dccm_region_d & _T_152; // @[lsu_addrcheck.scala 93:34]
  wire  _T_154 = _T_150 | _T_153; // @[lsu_addrcheck.scala 91:112]
  wire  _T_155 = start_addr_in_dccm_d & end_addr_in_pic_d; // @[lsu_addrcheck.scala 95:29]
  wire  _T_156 = _T_154 | _T_155; // @[lsu_addrcheck.scala 93:85]
  wire  _T_157 = start_addr_in_pic_d & end_addr_in_dccm_d; // @[lsu_addrcheck.scala 97:29]
  wire  unmapped_access_fault_d = _T_156 | _T_157; // @[lsu_addrcheck.scala 95:85]
  wire  _T_159 = ~start_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 99:33]
  wire  _T_160 = ~non_dccm_access_ok; // @[lsu_addrcheck.scala 99:64]
  wire  mpu_access_fault_d = _T_159 & _T_160; // @[lsu_addrcheck.scala 99:62]
  wire  _T_162 = unmapped_access_fault_d | mpu_access_fault_d; // @[lsu_addrcheck.scala 111:49]
  wire  _T_163 = _T_162 | picm_access_fault_d; // @[lsu_addrcheck.scala 111:70]
  wire  _T_164 = _T_163 | regpred_access_fault_d; // @[lsu_addrcheck.scala 111:92]
  wire  _T_165 = _T_164 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 111:118]
  wire  _T_166 = ~io_lsu_pkt_d_bits_dma; // @[lsu_addrcheck.scala 111:141]
  wire [3:0] _T_172 = picm_access_fault_d ? 4'h6 : 4'h0; // @[lsu_addrcheck.scala 112:164]
  wire [3:0] _T_173 = regpred_access_fault_d ? 4'h5 : _T_172; // @[lsu_addrcheck.scala 112:120]
  wire [3:0] _T_174 = mpu_access_fault_d ? 4'h3 : _T_173; // @[lsu_addrcheck.scala 112:80]
  wire [3:0] access_fault_mscause_d = unmapped_access_fault_d ? 4'h2 : _T_174; // @[lsu_addrcheck.scala 112:35]
  wire  regcross_misaligned_fault_d = io_start_addr_d[31:28] != io_end_addr_d[31:28]; // @[lsu_addrcheck.scala 113:61]
  wire  _T_177 = ~is_aligned_d; // @[lsu_addrcheck.scala 114:59]
  wire  sideeffect_misaligned_fault_d = is_sideeffects_d & _T_177; // @[lsu_addrcheck.scala 114:57]
  wire  _T_178 = sideeffect_misaligned_fault_d & io_addr_external_d; // @[lsu_addrcheck.scala 115:90]
  wire  _T_179 = regcross_misaligned_fault_d | _T_178; // @[lsu_addrcheck.scala 115:57]
  wire  _T_180 = _T_179 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 115:113]
  wire [3:0] _T_184 = sideeffect_misaligned_fault_d ? 4'h1 : 4'h0; // @[lsu_addrcheck.scala 116:80]
  wire [3:0] misaligned_fault_mscause_d = regcross_misaligned_fault_d ? 4'h2 : _T_184; // @[lsu_addrcheck.scala 116:39]
  wire  _T_189 = ~start_addr_in_dccm_d; // @[lsu_addrcheck.scala 118:66]
  wire  _T_190 = start_addr_in_dccm_region_d & _T_189; // @[lsu_addrcheck.scala 118:64]
  wire  _T_191 = ~end_addr_in_dccm_d; // @[lsu_addrcheck.scala 118:120]
  wire  _T_192 = end_addr_in_dccm_region_d & _T_191; // @[lsu_addrcheck.scala 118:118]
  wire  _T_193 = _T_190 | _T_192; // @[lsu_addrcheck.scala 118:88]
  wire  _T_194 = _T_193 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 118:142]
  wire  _T_196 = start_addr_in_dccm_region_d & end_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 119:66]
  wire  _T_197 = ~_T_196; // @[lsu_addrcheck.scala 119:36]
  wire  _T_198 = _T_197 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 119:95]
  reg  _T_200; // @[lsu_addrcheck.scala 121:60]
  assign io_is_sideeffects_m = _T_200; // @[lsu_addrcheck.scala 121:50]
  assign io_addr_in_dccm_d = start_addr_in_dccm_d & end_addr_in_dccm_d; // @[lsu_addrcheck.scala 56:32]
  assign io_addr_in_pic_d = start_addr_in_pic_d & end_addr_in_pic_d; // @[lsu_addrcheck.scala 57:32]
  assign io_addr_external_d = ~start_addr_dccm_or_pic; // @[lsu_addrcheck.scala 59:30]
  assign io_access_fault_d = _T_165 & _T_166; // @[lsu_addrcheck.scala 111:21]
  assign io_misaligned_fault_d = _T_180 & _T_166; // @[lsu_addrcheck.scala 115:25]
  assign io_exc_mscause_d = io_misaligned_fault_d ? misaligned_fault_mscause_d : access_fault_mscause_d; // @[lsu_addrcheck.scala 117:21]
  assign io_fir_dccm_access_error_d = _T_194 & io_lsu_pkt_d_bits_fast_int; // @[lsu_addrcheck.scala 118:31]
  assign io_fir_nondccm_access_error_d = _T_198 & io_lsu_pkt_d_bits_fast_int; // @[lsu_addrcheck.scala 119:33]
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
module lsu_lsc_ctl(
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_store_c1_m_clk,
  input  [31:0] io_lsu_ld_data_corr_r,
  input         io_lsu_single_ecc_error_r,
  input         io_lsu_double_ecc_error_r,
  input  [31:0] io_lsu_ld_data_m,
  input         io_lsu_single_ecc_error_m,
  input         io_lsu_double_ecc_error_m,
  input         io_flush_m_up,
  input         io_flush_r,
  input  [31:0] io_lsu_exu_exu_lsu_rs1_d,
  input  [31:0] io_lsu_exu_exu_lsu_rs2_d,
  input         io_lsu_p_valid,
  input         io_lsu_p_bits_fast_int,
  input         io_lsu_p_bits_by,
  input         io_lsu_p_bits_half,
  input         io_lsu_p_bits_word,
  input         io_lsu_p_bits_dword,
  input         io_lsu_p_bits_load,
  input         io_lsu_p_bits_store,
  input         io_lsu_p_bits_unsign,
  input         io_lsu_p_bits_dma,
  input         io_lsu_p_bits_store_data_bypass_d,
  input         io_lsu_p_bits_load_ldst_bypass_d,
  input         io_lsu_p_bits_store_data_bypass_m,
  input         io_dec_lsu_valid_raw_d,
  input  [11:0] io_dec_lsu_offset_d,
  input  [31:0] io_picm_mask_data_m,
  input  [31:0] io_bus_read_data_m,
  output [31:0] io_lsu_result_m,
  output [31:0] io_lsu_result_corr_r,
  output [31:0] io_lsu_addr_d,
  output [31:0] io_lsu_addr_m,
  output [31:0] io_lsu_addr_r,
  output [31:0] io_end_addr_d,
  output [31:0] io_end_addr_m,
  output [31:0] io_end_addr_r,
  output [31:0] io_store_data_m,
  input  [31:0] io_dec_tlu_mrac_ff,
  output        io_lsu_exc_m,
  output        io_is_sideeffects_m,
  output        io_lsu_commit_r,
  output        io_lsu_single_ecc_error_incr,
  output        io_lsu_error_pkt_r_valid,
  output        io_lsu_error_pkt_r_bits_single_ecc_error,
  output        io_lsu_error_pkt_r_bits_inst_type,
  output        io_lsu_error_pkt_r_bits_exc_type,
  output [3:0]  io_lsu_error_pkt_r_bits_mscause,
  output [31:0] io_lsu_error_pkt_r_bits_addr,
  output [30:0] io_lsu_fir_addr,
  output [1:0]  io_lsu_fir_error,
  output        io_addr_in_dccm_d,
  output        io_addr_in_dccm_m,
  output        io_addr_in_dccm_r,
  output        io_addr_in_pic_d,
  output        io_addr_in_pic_m,
  output        io_addr_in_pic_r,
  output        io_addr_external_m,
  input         io_dma_lsc_ctl_dma_dccm_req,
  input  [31:0] io_dma_lsc_ctl_dma_mem_addr,
  input  [2:0]  io_dma_lsc_ctl_dma_mem_sz,
  input         io_dma_lsc_ctl_dma_mem_write,
  input  [63:0] io_dma_lsc_ctl_dma_mem_wdata,
  output        io_lsu_pkt_d_valid,
  output        io_lsu_pkt_d_bits_fast_int,
  output        io_lsu_pkt_d_bits_by,
  output        io_lsu_pkt_d_bits_half,
  output        io_lsu_pkt_d_bits_word,
  output        io_lsu_pkt_d_bits_dword,
  output        io_lsu_pkt_d_bits_load,
  output        io_lsu_pkt_d_bits_store,
  output        io_lsu_pkt_d_bits_unsign,
  output        io_lsu_pkt_d_bits_dma,
  output        io_lsu_pkt_d_bits_store_data_bypass_d,
  output        io_lsu_pkt_d_bits_load_ldst_bypass_d,
  output        io_lsu_pkt_d_bits_store_data_bypass_m,
  output        io_lsu_pkt_m_valid,
  output        io_lsu_pkt_m_bits_fast_int,
  output        io_lsu_pkt_m_bits_by,
  output        io_lsu_pkt_m_bits_half,
  output        io_lsu_pkt_m_bits_word,
  output        io_lsu_pkt_m_bits_dword,
  output        io_lsu_pkt_m_bits_load,
  output        io_lsu_pkt_m_bits_store,
  output        io_lsu_pkt_m_bits_unsign,
  output        io_lsu_pkt_m_bits_dma,
  output        io_lsu_pkt_m_bits_store_data_bypass_m,
  output        io_lsu_pkt_r_valid,
  output        io_lsu_pkt_r_bits_by,
  output        io_lsu_pkt_r_bits_half,
  output        io_lsu_pkt_r_bits_word,
  output        io_lsu_pkt_r_bits_dword,
  output        io_lsu_pkt_r_bits_load,
  output        io_lsu_pkt_r_bits_store,
  output        io_lsu_pkt_r_bits_unsign,
  output        io_lsu_pkt_r_bits_dma
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
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
`endif // RANDOMIZE_REG_INIT
  wire  addrcheck_reset; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 113:25]
  wire [31:0] addrcheck_io_start_addr_d; // @[lsu_lsc_ctl.scala 113:25]
  wire [31:0] addrcheck_io_end_addr_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 113:25]
  wire [31:0] addrcheck_io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 113:25]
  wire [3:0] addrcheck_io_rs1_region_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_addr_external_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_access_fault_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_misaligned_fault_d; // @[lsu_lsc_ctl.scala 113:25]
  wire [3:0] addrcheck_io_exc_mscause_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_fir_dccm_access_error_d; // @[lsu_lsc_ctl.scala 113:25]
  wire  addrcheck_io_fir_nondccm_access_error_d; // @[lsu_lsc_ctl.scala 113:25]
  wire [31:0] lsu_rs1_d = io_dec_lsu_valid_raw_d ? io_lsu_exu_exu_lsu_rs1_d : io_dma_lsc_ctl_dma_mem_addr; // @[lsu_lsc_ctl.scala 95:28]
  wire [11:0] _T_3 = io_dec_lsu_valid_raw_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [11:0] lsu_offset_d = io_dec_lsu_offset_d & _T_3; // @[lsu_lsc_ctl.scala 96:51]
  wire [31:0] rs1_d = io_lsu_pkt_d_bits_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[lsu_lsc_ctl.scala 99:28]
  wire [12:0] _T_6 = {1'h0,rs1_d[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_8 = {1'h0,lsu_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _T_10 = _T_6 + _T_8; // @[lib.scala 76:39]
  wire  _T_13 = lsu_offset_d[11] ^ _T_10[12]; // @[lib.scala 77:46]
  wire  _T_14 = ~_T_13; // @[lib.scala 77:33]
  wire [19:0] _T_16 = _T_14 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_18 = _T_16 & rs1_d[31:12]; // @[lib.scala 77:58]
  wire  _T_20 = ~lsu_offset_d[11]; // @[lib.scala 78:18]
  wire  _T_22 = _T_20 & _T_10[12]; // @[lib.scala 78:30]
  wire [19:0] _T_24 = _T_22 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_27 = rs1_d[31:12] + 20'h1; // @[lib.scala 78:54]
  wire [19:0] _T_28 = _T_24 & _T_27; // @[lib.scala 78:41]
  wire [19:0] _T_29 = _T_18 | _T_28; // @[lib.scala 77:72]
  wire  _T_32 = ~_T_10[12]; // @[lib.scala 79:31]
  wire  _T_33 = lsu_offset_d[11] & _T_32; // @[lib.scala 79:29]
  wire [19:0] _T_35 = _T_33 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_38 = rs1_d[31:12] - 20'h1; // @[lib.scala 79:54]
  wire [19:0] _T_39 = _T_35 & _T_38; // @[lib.scala 79:41]
  wire [19:0] _T_40 = _T_29 | _T_39; // @[lib.scala 78:61]
  wire [2:0] _T_43 = io_lsu_pkt_d_bits_half ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_44 = _T_43 & 3'h1; // @[lsu_lsc_ctl.scala 104:58]
  wire [2:0] _T_46 = io_lsu_pkt_d_bits_word ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_47 = _T_46 & 3'h3; // @[lsu_lsc_ctl.scala 105:40]
  wire [2:0] _T_48 = _T_44 | _T_47; // @[lsu_lsc_ctl.scala 104:70]
  wire [2:0] _T_50 = io_lsu_pkt_d_bits_dword ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] addr_offset_d = _T_48 | _T_50; // @[lsu_lsc_ctl.scala 105:52]
  wire [12:0] _T_54 = {lsu_offset_d[11],lsu_offset_d}; // @[Cat.scala 29:58]
  wire [11:0] _T_57 = {9'h0,addr_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _GEN_0 = {{1'd0}, _T_57}; // @[lsu_lsc_ctl.scala 108:60]
  wire [12:0] end_addr_offset_d = _T_54 + _GEN_0; // @[lsu_lsc_ctl.scala 108:60]
  wire [18:0] _T_62 = end_addr_offset_d[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_64 = {_T_62,end_addr_offset_d}; // @[Cat.scala 29:58]
  reg  access_fault_m; // @[lsu_lsc_ctl.scala 144:75]
  reg  misaligned_fault_m; // @[lsu_lsc_ctl.scala 145:75]
  reg [3:0] exc_mscause_m; // @[lsu_lsc_ctl.scala 146:75]
  reg  fir_dccm_access_error_m; // @[lsu_lsc_ctl.scala 147:75]
  reg  fir_nondccm_access_error_m; // @[lsu_lsc_ctl.scala 148:75]
  wire  _T_69 = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 150:34]
  wire  _T_70 = ~io_lsu_double_ecc_error_r; // @[lsu_lsc_ctl.scala 151:64]
  wire  _T_71 = io_lsu_single_ecc_error_r & _T_70; // @[lsu_lsc_ctl.scala 151:62]
  wire  _T_72 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 151:111]
  wire  _T_73 = _T_71 & _T_72; // @[lsu_lsc_ctl.scala 151:92]
  wire  _T_76 = _T_69 | io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 173:67]
  wire  _T_77 = _T_76 & io_lsu_pkt_m_valid; // @[lsu_lsc_ctl.scala 173:96]
  wire  _T_78 = ~io_lsu_pkt_m_bits_dma; // @[lsu_lsc_ctl.scala 173:119]
  wire  _T_79 = _T_77 & _T_78; // @[lsu_lsc_ctl.scala 173:117]
  wire  _T_80 = ~io_lsu_pkt_m_bits_fast_int; // @[lsu_lsc_ctl.scala 173:144]
  wire  _T_81 = _T_79 & _T_80; // @[lsu_lsc_ctl.scala 173:142]
  wire  _T_82 = ~io_flush_m_up; // @[lsu_lsc_ctl.scala 173:174]
  wire  lsu_error_pkt_m_valid = _T_81 & _T_82; // @[lsu_lsc_ctl.scala 173:172]
  wire  _T_84 = ~lsu_error_pkt_m_valid; // @[lsu_lsc_ctl.scala 174:75]
  wire  _T_85 = io_lsu_single_ecc_error_m & _T_84; // @[lsu_lsc_ctl.scala 174:73]
  wire  lsu_error_pkt_m_bits_exc_type = ~misaligned_fault_m; // @[lsu_lsc_ctl.scala 176:46]
  wire  _T_90 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_bits_exc_type; // @[lsu_lsc_ctl.scala 177:78]
  wire  _T_91 = ~access_fault_m; // @[lsu_lsc_ctl.scala 177:102]
  wire  _T_92 = _T_90 & _T_91; // @[lsu_lsc_ctl.scala 177:100]
  wire  _T_99 = io_lsu_pkt_m_bits_fast_int & io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 179:166]
  reg  _T_105_valid; // @[lsu_lsc_ctl.scala 180:75]
  reg  _T_105_bits_single_ecc_error; // @[lsu_lsc_ctl.scala 180:75]
  reg  _T_105_bits_inst_type; // @[lsu_lsc_ctl.scala 180:75]
  reg  _T_105_bits_exc_type; // @[lsu_lsc_ctl.scala 180:75]
  reg [3:0] _T_105_bits_mscause; // @[lsu_lsc_ctl.scala 180:75]
  reg [31:0] _T_105_bits_addr; // @[lsu_lsc_ctl.scala 180:75]
  reg [1:0] _T_106; // @[lsu_lsc_ctl.scala 181:75]
  wire  dma_pkt_d_bits_load = ~io_dma_lsc_ctl_dma_mem_write; // @[lsu_lsc_ctl.scala 188:30]
  wire  dma_pkt_d_bits_by = io_dma_lsc_ctl_dma_mem_sz == 3'h0; // @[lsu_lsc_ctl.scala 189:62]
  wire  dma_pkt_d_bits_half = io_dma_lsc_ctl_dma_mem_sz == 3'h1; // @[lsu_lsc_ctl.scala 190:62]
  wire  dma_pkt_d_bits_word = io_dma_lsc_ctl_dma_mem_sz == 3'h2; // @[lsu_lsc_ctl.scala 191:62]
  wire  dma_pkt_d_bits_dword = io_dma_lsc_ctl_dma_mem_sz == 3'h3; // @[lsu_lsc_ctl.scala 192:62]
  wire  _T_118 = ~io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 205:64]
  wire  _T_119 = io_flush_m_up & _T_118; // @[lsu_lsc_ctl.scala 205:61]
  wire  _T_120 = ~_T_119; // @[lsu_lsc_ctl.scala 205:45]
  wire  _T_121 = io_lsu_p_valid & _T_120; // @[lsu_lsc_ctl.scala 205:43]
  wire  _T_123 = ~io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 206:68]
  wire  _T_124 = io_flush_m_up & _T_123; // @[lsu_lsc_ctl.scala 206:65]
  wire  _T_125 = ~_T_124; // @[lsu_lsc_ctl.scala 206:49]
  wire  _T_128 = io_flush_m_up & _T_78; // @[lsu_lsc_ctl.scala 207:65]
  wire  _T_129 = ~_T_128; // @[lsu_lsc_ctl.scala 207:49]
  reg  _T_132_bits_fast_int; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_by; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_half; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_word; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_dword; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_load; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_store; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_unsign; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_dma; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_132_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 209:65]
  reg  _T_134_bits_by; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_half; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_word; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_dword; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_load; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_store; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_unsign; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_134_bits_dma; // @[lsu_lsc_ctl.scala 210:65]
  reg  _T_135; // @[lsu_lsc_ctl.scala 211:65]
  reg  _T_136; // @[lsu_lsc_ctl.scala 212:65]
  wire [5:0] _T_139 = {io_dma_lsc_ctl_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_mem_wdata_shifted = io_dma_lsc_ctl_dma_mem_wdata >> _T_139; // @[lsu_lsc_ctl.scala 214:66]
  reg [31:0] store_data_pre_m; // @[lsu_lsc_ctl.scala 218:72]
  reg [31:0] _T_146; // @[lsu_lsc_ctl.scala 219:62]
  reg [31:0] _T_147; // @[lsu_lsc_ctl.scala 220:62]
  reg [31:0] _T_148; // @[lsu_lsc_ctl.scala 221:62]
  reg [31:0] _T_149; // @[lsu_lsc_ctl.scala 222:62]
  reg  _T_150; // @[lsu_lsc_ctl.scala 223:62]
  reg  _T_151; // @[lsu_lsc_ctl.scala 224:62]
  reg  _T_152; // @[lsu_lsc_ctl.scala 225:62]
  reg  _T_153; // @[lsu_lsc_ctl.scala 226:62]
  reg  _T_154; // @[lsu_lsc_ctl.scala 227:62]
  reg  addr_external_r; // @[lsu_lsc_ctl.scala 228:66]
  reg [31:0] bus_read_data_r; // @[lsu_lsc_ctl.scala 229:66]
  wire  _T_156 = io_lsu_pkt_r_bits_store | io_lsu_pkt_r_bits_load; // @[lsu_lsc_ctl.scala 235:68]
  wire  _T_157 = io_lsu_pkt_r_valid & _T_156; // @[lsu_lsc_ctl.scala 235:41]
  wire  _T_158 = ~io_flush_r; // @[lsu_lsc_ctl.scala 235:96]
  wire  _T_159 = _T_157 & _T_158; // @[lsu_lsc_ctl.scala 235:94]
  wire  _T_160 = ~io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 235:110]
  wire  _T_163 = ~io_addr_in_pic_m; // @[lsu_lsc_ctl.scala 236:69]
  wire [31:0] _T_165 = _T_163 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_166 = io_picm_mask_data_m | _T_165; // @[lsu_lsc_ctl.scala 236:59]
  wire [31:0] _T_168 = io_lsu_pkt_m_bits_store_data_bypass_m ? io_lsu_result_m : store_data_pre_m; // @[lsu_lsc_ctl.scala 236:94]
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? io_bus_read_data_m : io_lsu_ld_data_m; // @[lsu_lsc_ctl.scala 257:33]
  wire [31:0] lsu_ld_datafn_corr_r = addr_external_r ? bus_read_data_r : io_lsu_ld_data_corr_r; // @[lsu_lsc_ctl.scala 258:33]
  wire  _T_174 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 259:66]
  wire [31:0] _T_176 = _T_174 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_178 = {24'h0,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_179 = _T_176 & _T_178; // @[lsu_lsc_ctl.scala 259:94]
  wire  _T_180 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 260:43]
  wire [31:0] _T_182 = _T_180 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_184 = {16'h0,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_185 = _T_182 & _T_184; // @[lsu_lsc_ctl.scala 260:71]
  wire [31:0] _T_186 = _T_179 | _T_185; // @[lsu_lsc_ctl.scala 259:133]
  wire  _T_187 = ~io_lsu_pkt_m_bits_unsign; // @[lsu_lsc_ctl.scala 261:17]
  wire  _T_188 = _T_187 & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 261:43]
  wire [31:0] _T_190 = _T_188 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_193 = lsu_ld_datafn_m[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_195 = {_T_193,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_196 = _T_190 & _T_195; // @[lsu_lsc_ctl.scala 261:71]
  wire [31:0] _T_197 = _T_186 | _T_196; // @[lsu_lsc_ctl.scala 260:114]
  wire  _T_199 = _T_187 & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 262:43]
  wire [31:0] _T_201 = _T_199 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_204 = lsu_ld_datafn_m[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_206 = {_T_204,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_207 = _T_201 & _T_206; // @[lsu_lsc_ctl.scala 262:71]
  wire [31:0] _T_208 = _T_197 | _T_207; // @[lsu_lsc_ctl.scala 261:134]
  wire [31:0] _T_210 = io_lsu_pkt_m_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = _T_210 & lsu_ld_datafn_m; // @[lsu_lsc_ctl.scala 263:43]
  wire  _T_214 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 264:66]
  wire [31:0] _T_216 = _T_214 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_218 = {24'h0,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_219 = _T_216 & _T_218; // @[lsu_lsc_ctl.scala 264:94]
  wire  _T_220 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 265:43]
  wire [31:0] _T_222 = _T_220 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_224 = {16'h0,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_225 = _T_222 & _T_224; // @[lsu_lsc_ctl.scala 265:71]
  wire [31:0] _T_226 = _T_219 | _T_225; // @[lsu_lsc_ctl.scala 264:138]
  wire  _T_227 = ~io_lsu_pkt_r_bits_unsign; // @[lsu_lsc_ctl.scala 266:17]
  wire  _T_228 = _T_227 & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 266:43]
  wire [31:0] _T_230 = _T_228 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_233 = lsu_ld_datafn_corr_r[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_235 = {_T_233,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_236 = _T_230 & _T_235; // @[lsu_lsc_ctl.scala 266:71]
  wire [31:0] _T_237 = _T_226 | _T_236; // @[lsu_lsc_ctl.scala 265:119]
  wire  _T_239 = _T_227 & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 267:43]
  wire [31:0] _T_241 = _T_239 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_244 = lsu_ld_datafn_corr_r[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = {_T_244,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_247 = _T_241 & _T_246; // @[lsu_lsc_ctl.scala 267:71]
  wire [31:0] _T_248 = _T_237 | _T_247; // @[lsu_lsc_ctl.scala 266:144]
  wire [31:0] _T_250 = io_lsu_pkt_r_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_252 = _T_250 & lsu_ld_datafn_corr_r; // @[lsu_lsc_ctl.scala 268:43]
  lsu_addrcheck addrcheck ( // @[lsu_lsc_ctl.scala 113:25]
    .reset(addrcheck_reset),
    .io_lsu_c2_m_clk(addrcheck_io_lsu_c2_m_clk),
    .io_start_addr_d(addrcheck_io_start_addr_d),
    .io_end_addr_d(addrcheck_io_end_addr_d),
    .io_lsu_pkt_d_valid(addrcheck_io_lsu_pkt_d_valid),
    .io_lsu_pkt_d_bits_fast_int(addrcheck_io_lsu_pkt_d_bits_fast_int),
    .io_lsu_pkt_d_bits_by(addrcheck_io_lsu_pkt_d_bits_by),
    .io_lsu_pkt_d_bits_half(addrcheck_io_lsu_pkt_d_bits_half),
    .io_lsu_pkt_d_bits_word(addrcheck_io_lsu_pkt_d_bits_word),
    .io_lsu_pkt_d_bits_load(addrcheck_io_lsu_pkt_d_bits_load),
    .io_lsu_pkt_d_bits_store(addrcheck_io_lsu_pkt_d_bits_store),
    .io_lsu_pkt_d_bits_dma(addrcheck_io_lsu_pkt_d_bits_dma),
    .io_dec_tlu_mrac_ff(addrcheck_io_dec_tlu_mrac_ff),
    .io_rs1_region_d(addrcheck_io_rs1_region_d),
    .io_is_sideeffects_m(addrcheck_io_is_sideeffects_m),
    .io_addr_in_dccm_d(addrcheck_io_addr_in_dccm_d),
    .io_addr_in_pic_d(addrcheck_io_addr_in_pic_d),
    .io_addr_external_d(addrcheck_io_addr_external_d),
    .io_access_fault_d(addrcheck_io_access_fault_d),
    .io_misaligned_fault_d(addrcheck_io_misaligned_fault_d),
    .io_exc_mscause_d(addrcheck_io_exc_mscause_d),
    .io_fir_dccm_access_error_d(addrcheck_io_fir_dccm_access_error_d),
    .io_fir_nondccm_access_error_d(addrcheck_io_fir_nondccm_access_error_d)
  );
  assign io_lsu_result_m = _T_208 | _T_212; // @[lsu_lsc_ctl.scala 259:27]
  assign io_lsu_result_corr_r = _T_248 | _T_252; // @[lsu_lsc_ctl.scala 264:27]
  assign io_lsu_addr_d = {_T_40,_T_10[11:0]}; // @[lsu_lsc_ctl.scala 233:28]
  assign io_lsu_addr_m = _T_146; // @[lsu_lsc_ctl.scala 219:24]
  assign io_lsu_addr_r = _T_147; // @[lsu_lsc_ctl.scala 220:24]
  assign io_end_addr_d = rs1_d + _T_64; // @[lsu_lsc_ctl.scala 110:24]
  assign io_end_addr_m = _T_148; // @[lsu_lsc_ctl.scala 221:24]
  assign io_end_addr_r = _T_149; // @[lsu_lsc_ctl.scala 222:24]
  assign io_store_data_m = _T_166 & _T_168; // @[lsu_lsc_ctl.scala 236:29]
  assign io_lsu_exc_m = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 150:16]
  assign io_is_sideeffects_m = addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 123:42]
  assign io_lsu_commit_r = _T_159 & _T_160; // @[lsu_lsc_ctl.scala 235:19]
  assign io_lsu_single_ecc_error_incr = _T_73 & io_lsu_pkt_r_valid; // @[lsu_lsc_ctl.scala 151:32]
  assign io_lsu_error_pkt_r_valid = _T_105_valid; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = _T_105_bits_single_ecc_error; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_error_pkt_r_bits_inst_type = _T_105_bits_inst_type; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_error_pkt_r_bits_exc_type = _T_105_bits_exc_type; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_error_pkt_r_bits_mscause = _T_105_bits_mscause; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_error_pkt_r_bits_addr = _T_105_bits_addr; // @[lsu_lsc_ctl.scala 180:38]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r[31:1]; // @[lsu_lsc_ctl.scala 231:28]
  assign io_lsu_fir_error = _T_106; // @[lsu_lsc_ctl.scala 181:38]
  assign io_addr_in_dccm_d = addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 124:42]
  assign io_addr_in_dccm_m = _T_150; // @[lsu_lsc_ctl.scala 223:24]
  assign io_addr_in_dccm_r = _T_151; // @[lsu_lsc_ctl.scala 224:24]
  assign io_addr_in_pic_d = addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 125:42]
  assign io_addr_in_pic_m = _T_152; // @[lsu_lsc_ctl.scala 225:24]
  assign io_addr_in_pic_r = _T_153; // @[lsu_lsc_ctl.scala 226:24]
  assign io_addr_external_m = _T_154; // @[lsu_lsc_ctl.scala 227:24]
  assign io_lsu_pkt_d_valid = _T_121 | io_dma_lsc_ctl_dma_dccm_req; // @[lsu_lsc_ctl.scala 201:20 lsu_lsc_ctl.scala 205:24]
  assign io_lsu_pkt_d_bits_fast_int = io_dec_lsu_valid_raw_d & io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_by = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_by : dma_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_half = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_half : dma_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_word = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_word : dma_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_dword = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_dword : dma_pkt_d_bits_dword; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_load = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_load : dma_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_store = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_store : io_dma_lsc_ctl_dma_mem_write; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_unsign = io_dec_lsu_valid_raw_d & io_lsu_p_bits_unsign; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_dma = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_dma : 1'h1; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_store_data_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_load_ldst_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_d_bits_store_data_bypass_m = io_dec_lsu_valid_raw_d & io_lsu_p_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 201:20]
  assign io_lsu_pkt_m_valid = _T_135; // @[lsu_lsc_ctl.scala 209:28 lsu_lsc_ctl.scala 211:28]
  assign io_lsu_pkt_m_bits_fast_int = _T_132_bits_fast_int; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_by = _T_132_bits_by; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_half = _T_132_bits_half; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_word = _T_132_bits_word; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_dword = _T_132_bits_dword; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_load = _T_132_bits_load; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_store = _T_132_bits_store; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_unsign = _T_132_bits_unsign; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_dma = _T_132_bits_dma; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_m_bits_store_data_bypass_m = _T_132_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 209:28]
  assign io_lsu_pkt_r_valid = _T_136; // @[lsu_lsc_ctl.scala 210:28 lsu_lsc_ctl.scala 212:28]
  assign io_lsu_pkt_r_bits_by = _T_134_bits_by; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_half = _T_134_bits_half; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_word = _T_134_bits_word; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_dword = _T_134_bits_dword; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_load = _T_134_bits_load; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_store = _T_134_bits_store; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_unsign = _T_134_bits_unsign; // @[lsu_lsc_ctl.scala 210:28]
  assign io_lsu_pkt_r_bits_dma = _T_134_bits_dma; // @[lsu_lsc_ctl.scala 210:28]
  assign addrcheck_reset = reset;
  assign addrcheck_io_lsu_c2_m_clk = io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 115:42]
  assign addrcheck_io_start_addr_d = {_T_40,_T_10[11:0]}; // @[lsu_lsc_ctl.scala 117:42]
  assign addrcheck_io_end_addr_d = rs1_d + _T_64; // @[lsu_lsc_ctl.scala 118:42]
  assign addrcheck_io_lsu_pkt_d_valid = io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_fast_int = io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_by = io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_half = io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_word = io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_load = io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_store = io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_lsu_pkt_d_bits_dma = io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 120:42]
  assign addrcheck_io_rs1_region_d = rs1_d[31:28]; // @[lsu_lsc_ctl.scala 121:42]
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
  access_fault_m = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  misaligned_fault_m = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  exc_mscause_m = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  fir_dccm_access_error_m = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  fir_nondccm_access_error_m = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_105_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_105_bits_single_ecc_error = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_105_bits_inst_type = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_105_bits_exc_type = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_105_bits_mscause = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  _T_105_bits_addr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  _T_106 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  _T_132_bits_fast_int = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_132_bits_by = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_132_bits_half = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_132_bits_word = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_132_bits_dword = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_132_bits_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_132_bits_store = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_132_bits_unsign = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_132_bits_dma = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_132_bits_store_data_bypass_m = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_134_bits_by = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_134_bits_half = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_134_bits_word = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_134_bits_dword = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_134_bits_load = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_134_bits_store = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_134_bits_unsign = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_134_bits_dma = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_135 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_136 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  store_data_pre_m = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  _T_146 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  _T_147 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  _T_148 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  _T_149 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  _T_150 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  _T_151 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  _T_152 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  _T_153 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  _T_154 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  addr_external_r = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  bus_read_data_r = _RAND_43[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    access_fault_m = 1'h0;
  end
  if (reset) begin
    misaligned_fault_m = 1'h0;
  end
  if (reset) begin
    exc_mscause_m = 4'h0;
  end
  if (reset) begin
    fir_dccm_access_error_m = 1'h0;
  end
  if (reset) begin
    fir_nondccm_access_error_m = 1'h0;
  end
  if (reset) begin
    _T_105_valid = 1'h0;
  end
  if (reset) begin
    _T_105_bits_single_ecc_error = 1'h0;
  end
  if (reset) begin
    _T_105_bits_inst_type = 1'h0;
  end
  if (reset) begin
    _T_105_bits_exc_type = 1'h0;
  end
  if (reset) begin
    _T_105_bits_mscause = 4'h0;
  end
  if (reset) begin
    _T_105_bits_addr = 32'h0;
  end
  if (reset) begin
    _T_106 = 2'h0;
  end
  if (reset) begin
    _T_132_bits_fast_int = 1'h0;
  end
  if (reset) begin
    _T_132_bits_by = 1'h0;
  end
  if (reset) begin
    _T_132_bits_half = 1'h0;
  end
  if (reset) begin
    _T_132_bits_word = 1'h0;
  end
  if (reset) begin
    _T_132_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_132_bits_load = 1'h0;
  end
  if (reset) begin
    _T_132_bits_store = 1'h0;
  end
  if (reset) begin
    _T_132_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_132_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_132_bits_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_134_bits_by = 1'h0;
  end
  if (reset) begin
    _T_134_bits_half = 1'h0;
  end
  if (reset) begin
    _T_134_bits_word = 1'h0;
  end
  if (reset) begin
    _T_134_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_134_bits_load = 1'h0;
  end
  if (reset) begin
    _T_134_bits_store = 1'h0;
  end
  if (reset) begin
    _T_134_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_134_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_135 = 1'h0;
  end
  if (reset) begin
    _T_136 = 1'h0;
  end
  if (reset) begin
    store_data_pre_m = 32'h0;
  end
  if (reset) begin
    _T_146 = 32'h0;
  end
  if (reset) begin
    _T_147 = 32'h0;
  end
  if (reset) begin
    _T_148 = 32'h0;
  end
  if (reset) begin
    _T_149 = 32'h0;
  end
  if (reset) begin
    _T_150 = 1'h0;
  end
  if (reset) begin
    _T_151 = 1'h0;
  end
  if (reset) begin
    _T_152 = 1'h0;
  end
  if (reset) begin
    _T_153 = 1'h0;
  end
  if (reset) begin
    _T_154 = 1'h0;
  end
  if (reset) begin
    addr_external_r = 1'h0;
  end
  if (reset) begin
    bus_read_data_r = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      access_fault_m <= 1'h0;
    end else begin
      access_fault_m <= addrcheck_io_access_fault_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      misaligned_fault_m <= 1'h0;
    end else begin
      misaligned_fault_m <= addrcheck_io_misaligned_fault_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      exc_mscause_m <= 4'h0;
    end else begin
      exc_mscause_m <= addrcheck_io_exc_mscause_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      fir_dccm_access_error_m <= 1'h0;
    end else begin
      fir_dccm_access_error_m <= addrcheck_io_fir_dccm_access_error_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      fir_nondccm_access_error_m <= 1'h0;
    end else begin
      fir_nondccm_access_error_m <= addrcheck_io_fir_nondccm_access_error_d;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_valid <= 1'h0;
    end else begin
      _T_105_valid <= _T_81 & _T_82;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_single_ecc_error <= 1'h0;
    end else begin
      _T_105_bits_single_ecc_error <= _T_85 & _T_78;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_inst_type <= 1'h0;
    end else begin
      _T_105_bits_inst_type <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_exc_type <= 1'h0;
    end else begin
      _T_105_bits_exc_type <= ~misaligned_fault_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_mscause <= 4'h0;
    end else if (_T_92) begin
      _T_105_bits_mscause <= 4'h1;
    end else begin
      _T_105_bits_mscause <= exc_mscause_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_addr <= 32'h0;
    end else begin
      _T_105_bits_addr <= io_lsu_addr_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_106 <= 2'h0;
    end else if (fir_nondccm_access_error_m) begin
      _T_106 <= 2'h3;
    end else if (fir_dccm_access_error_m) begin
      _T_106 <= 2'h2;
    end else if (_T_99) begin
      _T_106 <= 2'h1;
    end else begin
      _T_106 <= 2'h0;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_fast_int <= 1'h0;
    end else begin
      _T_132_bits_fast_int <= io_lsu_pkt_d_bits_fast_int;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_by <= 1'h0;
    end else begin
      _T_132_bits_by <= io_lsu_pkt_d_bits_by;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_half <= 1'h0;
    end else begin
      _T_132_bits_half <= io_lsu_pkt_d_bits_half;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_word <= 1'h0;
    end else begin
      _T_132_bits_word <= io_lsu_pkt_d_bits_word;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_dword <= 1'h0;
    end else begin
      _T_132_bits_dword <= io_lsu_pkt_d_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_load <= 1'h0;
    end else begin
      _T_132_bits_load <= io_lsu_pkt_d_bits_load;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_store <= 1'h0;
    end else begin
      _T_132_bits_store <= io_lsu_pkt_d_bits_store;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_unsign <= 1'h0;
    end else begin
      _T_132_bits_unsign <= io_lsu_pkt_d_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_dma <= 1'h0;
    end else begin
      _T_132_bits_dma <= io_lsu_pkt_d_bits_dma;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_bits_store_data_bypass_m <= 1'h0;
    end else begin
      _T_132_bits_store_data_bypass_m <= io_lsu_pkt_d_bits_store_data_bypass_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_by <= 1'h0;
    end else begin
      _T_134_bits_by <= io_lsu_pkt_m_bits_by;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_half <= 1'h0;
    end else begin
      _T_134_bits_half <= io_lsu_pkt_m_bits_half;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_word <= 1'h0;
    end else begin
      _T_134_bits_word <= io_lsu_pkt_m_bits_word;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_dword <= 1'h0;
    end else begin
      _T_134_bits_dword <= io_lsu_pkt_m_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_load <= 1'h0;
    end else begin
      _T_134_bits_load <= io_lsu_pkt_m_bits_load;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_store <= 1'h0;
    end else begin
      _T_134_bits_store <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_unsign <= 1'h0;
    end else begin
      _T_134_bits_unsign <= io_lsu_pkt_m_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_bits_dma <= 1'h0;
    end else begin
      _T_134_bits_dma <= io_lsu_pkt_m_bits_dma;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_135 <= 1'h0;
    end else begin
      _T_135 <= io_lsu_pkt_d_valid & _T_125;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_136 <= 1'h0;
    end else begin
      _T_136 <= io_lsu_pkt_m_valid & _T_129;
    end
  end
  always @(posedge io_lsu_store_c1_m_clk or posedge reset) begin
    if (reset) begin
      store_data_pre_m <= 32'h0;
    end else if (io_lsu_pkt_d_bits_store_data_bypass_d) begin
      store_data_pre_m <= io_lsu_result_m;
    end else if (io_dma_lsc_ctl_dma_dccm_req) begin
      store_data_pre_m <= dma_mem_wdata_shifted[31:0];
    end else begin
      store_data_pre_m <= io_lsu_exu_exu_lsu_rs2_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_146 <= 32'h0;
    end else begin
      _T_146 <= io_lsu_addr_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_147 <= 32'h0;
    end else begin
      _T_147 <= io_lsu_addr_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_148 <= 32'h0;
    end else begin
      _T_148 <= io_end_addr_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_149 <= 32'h0;
    end else begin
      _T_149 <= io_end_addr_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_150 <= 1'h0;
    end else begin
      _T_150 <= io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_151 <= 1'h0;
    end else begin
      _T_151 <= io_addr_in_dccm_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_152 <= 1'h0;
    end else begin
      _T_152 <= io_addr_in_pic_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_153 <= 1'h0;
    end else begin
      _T_153 <= io_addr_in_pic_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_154 <= 1'h0;
    end else begin
      _T_154 <= addrcheck_io_addr_external_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      addr_external_r <= 1'h0;
    end else begin
      addr_external_r <= io_addr_external_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      bus_read_data_r <= 32'h0;
    end else begin
      bus_read_data_r <= io_bus_read_data_m;
    end
  end
endmodule
module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[lib.scala 318:26]
  wire  clkhdr_CK; // @[lib.scala 318:26]
  wire  clkhdr_EN; // @[lib.scala 318:26]
  wire  clkhdr_SE; // @[lib.scala 318:26]
  gated_latch clkhdr ( // @[lib.scala 318:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[lib.scala 319:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 320:18]
  assign clkhdr_EN = io_en; // @[lib.scala 321:18]
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 322:18]
endmodule
module lsu_dccm_ctl(
  input         clock,
  input         reset,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_store_c1_r_clk,
  input         io_lsu_pkt_d_valid,
  input         io_lsu_pkt_d_bits_word,
  input         io_lsu_pkt_d_bits_dword,
  input         io_lsu_pkt_d_bits_load,
  input         io_lsu_pkt_d_bits_store,
  input         io_lsu_pkt_d_bits_dma,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_by,
  input         io_lsu_pkt_m_bits_half,
  input         io_lsu_pkt_m_bits_word,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_dma,
  input         io_lsu_pkt_r_valid,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_load,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_dma,
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
  output [31:0] io_lsu_ld_data_corr_r,
  input         io_lsu_double_ecc_error_r,
  input         io_single_ecc_error_hi_r,
  input         io_single_ecc_error_lo_r,
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
  input  [31:0] io_dma_dccm_ctl_dma_mem_addr,
  input  [63:0] io_dma_dccm_ctl_dma_mem_wdata,
  output        io_dma_dccm_ctl_dccm_dma_rvalid,
  output        io_dma_dccm_ctl_dccm_dma_ecc_error,
  output [2:0]  io_dma_dccm_ctl_dccm_dma_rtag,
  output [63:0] io_dma_dccm_ctl_dccm_dma_rdata,
  output        io_dccm_wren,
  output        io_dccm_rden,
  output [15:0] io_dccm_wr_addr_lo,
  output [15:0] io_dccm_wr_addr_hi,
  output [15:0] io_dccm_rd_addr_lo,
  output [15:0] io_dccm_rd_addr_hi,
  output [38:0] io_dccm_wr_data_lo,
  output [38:0] io_dccm_wr_data_hi,
  input  [38:0] io_dccm_rd_data_lo,
  input  [38:0] io_dccm_rd_data_hi,
  output        io_lsu_pic_picm_wren,
  output        io_lsu_pic_picm_rden,
  output        io_lsu_pic_picm_mken,
  output [31:0] io_lsu_pic_picm_rdaddr,
  output [31:0] io_lsu_pic_picm_wraddr,
  output [31:0] io_lsu_pic_picm_wr_data,
  input  [31:0] io_lsu_pic_picm_rd_data,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 352:23]
  wire [63:0] picm_rd_data_m = {io_lsu_pic_picm_rd_data,io_lsu_pic_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_load; // @[lsu_dccm_ctl.scala 137:63]
  reg [63:0] _T_2; // @[lsu_dccm_ctl.scala 147:65]
  wire [7:0] _T_3 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_6 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [7:0] _T_11 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_corr_m[7:0]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_12 = _T_3[0] ? _T_6[7:0] : _T_11; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_50 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_corr_m[15:8]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_51 = _T_3[1] ? _T_6[15:8] : _T_50; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_89 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_corr_m[23:16]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_90 = _T_3[2] ? _T_6[23:16] : _T_89; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_128 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_corr_m[31:24]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_129 = _T_3[3] ? _T_6[31:24] : _T_128; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_167 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_corr_m[39:32]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_168 = _T_3[4] ? _T_6[39:32] : _T_167; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_206 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_corr_m[47:40]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_207 = _T_3[5] ? _T_6[47:40] : _T_206; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_245 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_corr_m[55:48]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_246 = _T_3[6] ? _T_6[55:48] : _T_245; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_284 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_corr_m[63:56]; // @[lsu_dccm_ctl.scala 148:213]
  wire [7:0] _T_285 = _T_3[7] ? _T_6[63:56] : _T_284; // @[lsu_dccm_ctl.scala 148:78]
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
  wire [7:0] _T_390 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_m[7:0]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_391 = _T_3[0] ? _T_6[7:0] : _T_390; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_429 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_m[15:8]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_430 = _T_3[1] ? _T_6[15:8] : _T_429; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_468 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_m[23:16]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_469 = _T_3[2] ? _T_6[23:16] : _T_468; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_507 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_m[31:24]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_508 = _T_3[3] ? _T_6[31:24] : _T_507; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_546 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_m[39:32]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_547 = _T_3[4] ? _T_6[39:32] : _T_546; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_585 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_m[47:40]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_586 = _T_3[5] ? _T_6[47:40] : _T_585; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_624 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_m[55:48]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_625 = _T_3[6] ? _T_6[55:48] : _T_624; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [7:0] _T_663 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_m[63:56]; // @[lsu_dccm_ctl.scala 149:213]
  wire [7:0] _T_664 = _T_3[7] ? _T_6[63:56] : _T_663; // @[lsu_dccm_ctl.scala 149:78]
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
  wire [3:0] _GEN_42 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_dccm_ctl.scala 150:49]
  wire [5:0] _T_762 = 4'h8 * _GEN_42; // @[lsu_dccm_ctl.scala 150:49]
  wire [63:0] _T_763 = lsu_rdata_m >> _T_762; // @[lsu_dccm_ctl.scala 150:43]
  wire  _T_769 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 155:60]
  wire  _T_772 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 155:133]
  wire  _T_773 = _T_769 | _T_772; // @[lsu_dccm_ctl.scala 155:101]
  wire  _T_774 = _T_773 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 155:175]
  wire  _T_775 = _T_774 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 155:196]
  wire  _T_776 = _T_775 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 155:222]
  wire  _T_777 = _T_776 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 155:246]
  wire  _T_780 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 156:37]
  wire  _T_783 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 156:110]
  wire  _T_784 = _T_780 | _T_783; // @[lsu_dccm_ctl.scala 156:78]
  wire  _T_785 = _T_784 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 156:152]
  wire  _T_786 = _T_785 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 156:173]
  wire  _T_787 = _T_786 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 156:199]
  wire  _T_788 = _T_787 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 156:223]
  wire  kill_ecc_corr_lo_r = _T_777 | _T_788; // @[lsu_dccm_ctl.scala 155:267]
  wire  _T_791 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 158:60]
  wire  _T_794 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 158:133]
  wire  _T_795 = _T_791 | _T_794; // @[lsu_dccm_ctl.scala 158:101]
  wire  _T_796 = _T_795 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 158:175]
  wire  _T_797 = _T_796 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 158:196]
  wire  _T_798 = _T_797 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 158:222]
  wire  _T_799 = _T_798 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 158:246]
  wire  _T_802 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 159:37]
  wire  _T_805 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 159:110]
  wire  _T_806 = _T_802 | _T_805; // @[lsu_dccm_ctl.scala 159:78]
  wire  _T_807 = _T_806 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 159:152]
  wire  _T_808 = _T_807 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 159:173]
  wire  _T_809 = _T_808 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 159:199]
  wire  _T_810 = _T_809 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 159:223]
  wire  kill_ecc_corr_hi_r = _T_799 | _T_810; // @[lsu_dccm_ctl.scala 158:267]
  wire  _T_811 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[lsu_dccm_ctl.scala 161:60]
  wire  _T_812 = ~io_lsu_raw_fwd_lo_r; // @[lsu_dccm_ctl.scala 161:89]
  wire  ld_single_ecc_error_lo_r = _T_811 & _T_812; // @[lsu_dccm_ctl.scala 161:87]
  wire  _T_813 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 162:60]
  wire  _T_814 = ~io_lsu_raw_fwd_hi_r; // @[lsu_dccm_ctl.scala 162:89]
  wire  ld_single_ecc_error_hi_r = _T_813 & _T_814; // @[lsu_dccm_ctl.scala 162:87]
  wire  _T_815 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 163:63]
  wire  _T_816 = ~io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 163:93]
  wire  _T_818 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 164:81]
  wire  _T_819 = ld_single_ecc_error_lo_r & _T_818; // @[lsu_dccm_ctl.scala 164:62]
  wire  _T_820 = ~kill_ecc_corr_lo_r; // @[lsu_dccm_ctl.scala 164:108]
  wire  _T_822 = ld_single_ecc_error_hi_r & _T_818; // @[lsu_dccm_ctl.scala 165:62]
  wire  _T_823 = ~kill_ecc_corr_hi_r; // @[lsu_dccm_ctl.scala 165:108]
  reg  lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 167:74]
  reg  ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 168:74]
  reg  ld_single_ecc_error_lo_r_ff; // @[lsu_dccm_ctl.scala 169:74]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[lib.scala 358:16]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[lib.scala 358:16]
  wire  _T_830 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[lsu_dccm_ctl.scala 173:125]
  wire  _T_831 = ~_T_830; // @[lsu_dccm_ctl.scala 173:100]
  wire  _T_833 = io_lsu_addr_d[1:0] != 2'h0; // @[lsu_dccm_ctl.scala 173:174]
  wire  _T_834 = _T_831 | _T_833; // @[lsu_dccm_ctl.scala 173:152]
  wire  _T_835 = io_lsu_pkt_d_bits_store & _T_834; // @[lsu_dccm_ctl.scala 173:97]
  wire  _T_836 = io_lsu_pkt_d_bits_load | _T_835; // @[lsu_dccm_ctl.scala 173:70]
  wire  _T_837 = io_lsu_pkt_d_valid & _T_836; // @[lsu_dccm_ctl.scala 173:44]
  wire  lsu_dccm_rden_d = _T_837 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 173:191]
  wire  _T_838 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 176:63]
  wire  _T_839 = ~lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 176:96]
  wire  _T_841 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[lsu_dccm_ctl.scala 177:75]
  wire  _T_842 = _T_841 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 177:93]
  wire  _T_843 = ~_T_842; // @[lsu_dccm_ctl.scala 177:57]
  wire  _T_846 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[lsu_dccm_ctl.scala 178:95]
  wire  _T_849 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[lsu_dccm_ctl.scala 179:76]
  wire  _T_850 = _T_846 | _T_849; // @[lsu_dccm_ctl.scala 178:171]
  wire  _T_851 = ~_T_850; // @[lsu_dccm_ctl.scala 178:24]
  wire  _T_852 = lsu_dccm_rden_d & _T_851; // @[lsu_dccm_ctl.scala 178:22]
  wire  _T_853 = _T_843 | _T_852; // @[lsu_dccm_ctl.scala 177:124]
  wire  _T_855 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[lsu_dccm_ctl.scala 183:41]
  wire [15:0] _T_862 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[lsu_dccm_ctl.scala 187:8]
  wire [15:0] _T_866 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 188:8]
  wire [15:0] _T_872 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[lsu_dccm_ctl.scala 191:8]
  wire [15:0] _T_876 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 192:8]
  wire [38:0] _T_884 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_887 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_888 = ld_single_ecc_error_lo_r_ff ? _T_884 : _T_887; // @[lsu_dccm_ctl.scala 198:8]
  wire [38:0] _T_892 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_895 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_896 = io_dma_dccm_wen ? _T_892 : _T_895; // @[lsu_dccm_ctl.scala 200:8]
  wire [38:0] _T_906 = ld_single_ecc_error_hi_r_ff ? _T_887 : _T_884; // @[lsu_dccm_ctl.scala 204:8]
  wire [38:0] _T_910 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_914 = io_dma_dccm_wen ? _T_910 : _T_895; // @[lsu_dccm_ctl.scala 206:8]
  wire [3:0] _T_917 = io_lsu_pkt_m_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_919 = io_lsu_pkt_m_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_920 = _T_919 & 4'h1; // @[lsu_dccm_ctl.scala 210:94]
  wire [3:0] _T_922 = io_lsu_pkt_m_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_923 = _T_922 & 4'h3; // @[lsu_dccm_ctl.scala 211:38]
  wire [3:0] _T_924 = _T_920 | _T_923; // @[lsu_dccm_ctl.scala 210:107]
  wire [3:0] _T_926 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_928 = _T_924 | _T_926; // @[lsu_dccm_ctl.scala 211:51]
  wire [3:0] store_byteen_m = _T_917 & _T_928; // @[lsu_dccm_ctl.scala 210:58]
  wire [3:0] _T_930 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_932 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_933 = _T_932 & 4'h1; // @[lsu_dccm_ctl.scala 214:94]
  wire [3:0] _T_935 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_936 = _T_935 & 4'h3; // @[lsu_dccm_ctl.scala 215:38]
  wire [3:0] _T_937 = _T_933 | _T_936; // @[lsu_dccm_ctl.scala 214:107]
  wire [3:0] _T_939 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_941 = _T_937 | _T_939; // @[lsu_dccm_ctl.scala 215:51]
  wire [3:0] store_byteen_r = _T_930 & _T_941; // @[lsu_dccm_ctl.scala 214:58]
  wire [6:0] _GEN_44 = {{3'd0}, store_byteen_m}; // @[lsu_dccm_ctl.scala 218:45]
  wire [6:0] _T_944 = _GEN_44 << io_lsu_addr_m[1:0]; // @[lsu_dccm_ctl.scala 218:45]
  wire [6:0] _GEN_45 = {{3'd0}, store_byteen_r}; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _T_947 = _GEN_45 << io_lsu_addr_r[1:0]; // @[lsu_dccm_ctl.scala 220:45]
  wire  _T_950 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[lsu_dccm_ctl.scala 223:67]
  wire  dccm_wr_bypass_d_m_lo = _T_950 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 223:101]
  wire  _T_953 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[lsu_dccm_ctl.scala 224:67]
  wire  dccm_wr_bypass_d_m_hi = _T_953 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 224:101]
  wire  _T_956 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 226:67]
  wire  dccm_wr_bypass_d_r_lo = _T_956 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 226:101]
  wire  _T_959 = io_stbuf_addr_any[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 227:67]
  wire  dccm_wr_bypass_d_r_hi = _T_959 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 227:101]
  wire [63:0] _T_962 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_47 = {{63'd0}, _T_962}; // @[lsu_dccm_ctl.scala 256:72]
  wire [126:0] _T_965 = _GEN_47 << _T_762; // @[lsu_dccm_ctl.scala 256:72]
  wire [63:0] store_data_pre_m = _T_965[63:0]; // @[lsu_dccm_ctl.scala 256:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[lsu_dccm_ctl.scala 257:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[lsu_dccm_ctl.scala 258:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_944}; // @[lsu_dccm_ctl.scala 218:22]
  wire  _T_971 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[lsu_dccm_ctl.scala 259:211]
  wire [7:0] _T_975 = _T_971 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[lsu_dccm_ctl.scala 259:185]
  wire [7:0] _T_976 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_975; // @[lsu_dccm_ctl.scala 259:120]
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
  wire [7:0] _T_1013 = _T_971 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[lsu_dccm_ctl.scala 259:185]
  wire [7:0] _T_1014 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1013; // @[lsu_dccm_ctl.scala 259:120]
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
  wire [7:0] _T_1051 = _T_971 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[lsu_dccm_ctl.scala 259:185]
  wire [7:0] _T_1052 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1051; // @[lsu_dccm_ctl.scala 259:120]
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
  wire [7:0] _T_1089 = _T_971 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[lsu_dccm_ctl.scala 259:185]
  wire [7:0] _T_1090 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1089; // @[lsu_dccm_ctl.scala 259:120]
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
  reg [31:0] _T_1173; // @[lsu_dccm_ctl.scala 259:72]
  wire  _T_1177 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[lsu_dccm_ctl.scala 260:211]
  wire [7:0] _T_1181 = _T_1177 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[lsu_dccm_ctl.scala 260:185]
  wire [7:0] _T_1182 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1181; // @[lsu_dccm_ctl.scala 260:120]
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
  wire [7:0] _T_1219 = _T_1177 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[lsu_dccm_ctl.scala 260:185]
  wire [7:0] _T_1220 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1219; // @[lsu_dccm_ctl.scala 260:120]
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
  wire [7:0] _T_1257 = _T_1177 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[lsu_dccm_ctl.scala 260:185]
  wire [7:0] _T_1258 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1257; // @[lsu_dccm_ctl.scala 260:120]
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
  wire [7:0] _T_1295 = _T_1177 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[lsu_dccm_ctl.scala 260:185]
  wire [7:0] _T_1296 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1295; // @[lsu_dccm_ctl.scala 260:120]
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
  reg [31:0] _T_1379; // @[lsu_dccm_ctl.scala 260:72]
  wire  _T_1380 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[lsu_dccm_ctl.scala 261:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_947}; // @[lsu_dccm_ctl.scala 220:22]
  wire  _T_1382 = ~store_byteen_ext_r[0]; // @[lsu_dccm_ctl.scala 261:131]
  wire  _T_1383 = _T_1380 & _T_1382; // @[lsu_dccm_ctl.scala 261:129]
  wire [7:0] _T_1387 = _T_1383 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[lsu_dccm_ctl.scala 261:79]
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
  wire  _T_1419 = ~store_byteen_ext_r[1]; // @[lsu_dccm_ctl.scala 261:131]
  wire  _T_1420 = _T_1380 & _T_1419; // @[lsu_dccm_ctl.scala 261:129]
  wire [7:0] _T_1424 = _T_1420 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[lsu_dccm_ctl.scala 261:79]
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
  wire  _T_1456 = ~store_byteen_ext_r[2]; // @[lsu_dccm_ctl.scala 261:131]
  wire  _T_1457 = _T_1380 & _T_1456; // @[lsu_dccm_ctl.scala 261:129]
  wire [7:0] _T_1461 = _T_1457 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[lsu_dccm_ctl.scala 261:79]
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
  wire  _T_1493 = ~store_byteen_ext_r[3]; // @[lsu_dccm_ctl.scala 261:131]
  wire  _T_1494 = _T_1380 & _T_1493; // @[lsu_dccm_ctl.scala 261:129]
  wire [7:0] _T_1498 = _T_1494 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[lsu_dccm_ctl.scala 261:79]
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
  wire  _T_1581 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi; // @[lsu_dccm_ctl.scala 262:105]
  wire  _T_1583 = ~store_byteen_ext_r[4]; // @[lsu_dccm_ctl.scala 262:131]
  wire  _T_1584 = _T_1581 & _T_1583; // @[lsu_dccm_ctl.scala 262:129]
  wire [7:0] _T_1588 = _T_1584 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[lsu_dccm_ctl.scala 262:79]
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
  wire  _T_1620 = ~store_byteen_ext_r[5]; // @[lsu_dccm_ctl.scala 262:131]
  wire  _T_1621 = _T_1581 & _T_1620; // @[lsu_dccm_ctl.scala 262:129]
  wire [7:0] _T_1625 = _T_1621 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[lsu_dccm_ctl.scala 262:79]
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
  wire  _T_1657 = ~store_byteen_ext_r[6]; // @[lsu_dccm_ctl.scala 262:131]
  wire  _T_1658 = _T_1581 & _T_1657; // @[lsu_dccm_ctl.scala 262:129]
  wire [7:0] _T_1662 = _T_1658 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[lsu_dccm_ctl.scala 262:79]
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
  wire  _T_1694 = ~store_byteen_ext_r[7]; // @[lsu_dccm_ctl.scala 262:131]
  wire  _T_1695 = _T_1581 & _T_1694; // @[lsu_dccm_ctl.scala 262:129]
  wire [7:0] _T_1699 = _T_1695 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[lsu_dccm_ctl.scala 262:79]
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
  wire [3:0] _GEN_96 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[lsu_dccm_ctl.scala 263:94]
  wire [5:0] _T_1786 = 4'h8 * _GEN_96; // @[lsu_dccm_ctl.scala 263:94]
  wire [63:0] _T_1787 = _T_1784 >> _T_1786; // @[lsu_dccm_ctl.scala 263:88]
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
  wire [63:0] _GEN_101 = {{32'd0}, _T_1852}; // @[lsu_dccm_ctl.scala 263:115]
  wire [63:0] _T_1853 = _T_1787 & _GEN_101; // @[lsu_dccm_ctl.scala 263:115]
  wire  _T_1858 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_dccm_ctl.scala 270:58]
  wire  _T_1859 = _T_1858 & io_addr_in_pic_r; // @[lsu_dccm_ctl.scala 270:84]
  wire  _T_1860 = _T_1859 & io_lsu_commit_r; // @[lsu_dccm_ctl.scala 270:103]
  wire  _T_1862 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[lsu_dccm_ctl.scala 271:58]
  wire  _T_1864 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 272:58]
  wire [31:0] _T_1868 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1874 = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[lsu_dccm_ctl.scala 274:93]
  wire [31:0] _T_1875 = {17'h0,_T_1874}; // @[Cat.scala 29:58]
  reg  _T_1882; // @[lsu_dccm_ctl.scala 279:61]
  rvclkhdr rvclkhdr ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_lsu_ld_data_corr_r = _T_2[31:0]; // @[lsu_dccm_ctl.scala 147:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[lsu_dccm_ctl.scala 266:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[lsu_dccm_ctl.scala 265:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[lsu_dccm_ctl.scala 268:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[lsu_dccm_ctl.scala 267:27]
  assign io_lsu_ld_data_m = _T_763[31:0]; // @[lsu_dccm_ctl.scala 150:28]
  assign io_store_data_hi_r = _T_1379; // @[lsu_dccm_ctl.scala 260:29]
  assign io_store_data_lo_r = _T_1173; // @[lsu_dccm_ctl.scala 259:29]
  assign io_store_datafn_hi_r = _T_1776 | _T_1780; // @[lsu_dccm_ctl.scala 262:29]
  assign io_store_datafn_lo_r = _T_1575 | _T_1579; // @[lsu_dccm_ctl.scala 261:29]
  assign io_store_data_r = _T_1853[31:0]; // @[lsu_dccm_ctl.scala 263:29]
  assign io_ld_single_ecc_error_r = _T_815 & _T_816; // @[lsu_dccm_ctl.scala 163:34]
  assign io_ld_single_ecc_error_r_ff = _T_838 & _T_839; // @[lsu_dccm_ctl.scala 176:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[lsu_dccm_ctl.scala 275:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_853; // @[lsu_dccm_ctl.scala 177:31]
  assign io_lsu_dccm_rden_m = _T_1882; // @[lsu_dccm_ctl.scala 279:24]
  assign io_dma_dccm_ctl_dccm_dma_rvalid = _T & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 137:41]
  assign io_dma_dccm_ctl_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[lsu_dccm_ctl.scala 138:41]
  assign io_dma_dccm_ctl_dccm_dma_rtag = io_dma_mem_tag_m; // @[lsu_dccm_ctl.scala 140:41]
  assign io_dma_dccm_ctl_dccm_dma_rdata = _T_376 | _T_380; // @[lsu_dccm_ctl.scala 139:41]
  assign io_dccm_wren = _T_855 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 183:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 184:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_862 : _T_866; // @[lsu_dccm_ctl.scala 186:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_872 : _T_876; // @[lsu_dccm_ctl.scala 190:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[lsu_dccm_ctl.scala 194:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[lsu_dccm_ctl.scala 195:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_888 : _T_896; // @[lsu_dccm_ctl.scala 197:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_906 : _T_914; // @[lsu_dccm_ctl.scala 203:22]
  assign io_lsu_pic_picm_wren = _T_1860 | io_dma_pic_wen; // @[lsu_dccm_ctl.scala 270:35]
  assign io_lsu_pic_picm_rden = _T_1862 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 271:35]
  assign io_lsu_pic_picm_mken = _T_1864 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 272:35]
  assign io_lsu_pic_picm_rdaddr = 32'hf00c0000 | _T_1868; // @[lsu_dccm_ctl.scala 273:35]
  assign io_lsu_pic_picm_wraddr = 32'hf00c0000 | _T_1875; // @[lsu_dccm_ctl.scala 274:35]
  assign io_lsu_pic_picm_wr_data = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[lsu_dccm_ctl.scala 276:35]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[lib.scala 355:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[lib.scala 355:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
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
endmodule
module lsu_stbuf(
  input         clock,
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_stbuf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_dma,
  input         io_lsu_pkt_r_valid,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_dword,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_dma,
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
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 352:23]
  wire [1:0] _T_5 = io_lsu_pkt_r_bits_half ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_7 = io_lsu_pkt_r_bits_dword ? 8'hff : 8'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_10 = {{1'd0}, io_lsu_pkt_r_bits_by}; // @[Mux.scala 27:72]
  wire [1:0] _T_8 = _GEN_10 | _T_5; // @[Mux.scala 27:72]
  wire [3:0] _GEN_11 = {{2'd0}, _T_8}; // @[Mux.scala 27:72]
  wire [3:0] _T_9 = _GEN_11 | _T_6; // @[Mux.scala 27:72]
  wire [7:0] _GEN_12 = {{4'd0}, _T_9}; // @[Mux.scala 27:72]
  wire [7:0] ldst_byteen_r = _GEN_12 | _T_7; // @[Mux.scala 27:72]
  wire  ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[lsu_stbuf.scala 117:39]
  reg  ldst_dual_r; // @[lsu_stbuf.scala 171:52]
  wire  dual_stbuf_write_r = ldst_dual_r & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 118:40]
  wire [10:0] _GEN_13 = {{3'd0}, ldst_byteen_r}; // @[lsu_stbuf.scala 120:39]
  wire [10:0] _T_14 = _GEN_13 << io_lsu_addr_r[1:0]; // @[lsu_stbuf.scala 120:39]
  wire [7:0] store_byteen_ext_r = _T_14[7:0]; // @[lsu_stbuf.scala 120:22]
  wire [3:0] _T_17 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_17; // @[lsu_stbuf.scala 121:52]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_17; // @[lsu_stbuf.scala 122:52]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] RdPtrPlus1 = RdPtr + 2'h1; // @[lsu_stbuf.scala 124:26]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[lsu_stbuf.scala 125:26]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[lsu_stbuf.scala 126:26]
  reg [15:0] stbuf_addr_0; // @[lib.scala 358:16]
  wire  _T_27 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 130:120]
  reg  _T_588; // @[lsu_stbuf.scala 163:88]
  reg  _T_580; // @[lsu_stbuf.scala 163:88]
  reg  _T_572; // @[lsu_stbuf.scala 163:88]
  reg  _T_564; // @[lsu_stbuf.scala 163:88]
  wire [3:0] stbuf_vld = {_T_588,_T_580,_T_572,_T_564}; // @[Cat.scala 29:58]
  wire  _T_29 = _T_27 & stbuf_vld[0]; // @[lsu_stbuf.scala 130:179]
  reg  _T_623; // @[lsu_stbuf.scala 164:92]
  reg  _T_615; // @[lsu_stbuf.scala 164:92]
  reg  _T_607; // @[lsu_stbuf.scala 164:92]
  reg  _T_599; // @[lsu_stbuf.scala 164:92]
  wire [3:0] stbuf_dma_kill = {_T_623,_T_615,_T_607,_T_599}; // @[Cat.scala 29:58]
  wire  _T_31 = ~stbuf_dma_kill[0]; // @[lsu_stbuf.scala 130:197]
  wire  _T_32 = _T_29 & _T_31; // @[lsu_stbuf.scala 130:195]
  wire  _T_212 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[lsu_stbuf.scala 141:78]
  wire  _T_213 = 2'h3 == RdPtr; // @[lsu_stbuf.scala 141:121]
  wire  _T_215 = _T_212 & _T_213; // @[lsu_stbuf.scala 141:109]
  wire  _T_209 = 2'h2 == RdPtr; // @[lsu_stbuf.scala 141:121]
  wire  _T_211 = _T_212 & _T_209; // @[lsu_stbuf.scala 141:109]
  wire  _T_205 = 2'h1 == RdPtr; // @[lsu_stbuf.scala 141:121]
  wire  _T_207 = _T_212 & _T_205; // @[lsu_stbuf.scala 141:109]
  wire  _T_201 = 2'h0 == RdPtr; // @[lsu_stbuf.scala 141:121]
  wire  _T_203 = _T_212 & _T_201; // @[lsu_stbuf.scala 141:109]
  wire [3:0] stbuf_reset = {_T_215,_T_211,_T_207,_T_203}; // @[Cat.scala 29:58]
  wire  _T_34 = ~stbuf_reset[0]; // @[lsu_stbuf.scala 130:218]
  wire  _T_35 = _T_32 & _T_34; // @[lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_1; // @[lib.scala 358:16]
  wire  _T_38 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 130:120]
  wire  _T_40 = _T_38 & stbuf_vld[1]; // @[lsu_stbuf.scala 130:179]
  wire  _T_42 = ~stbuf_dma_kill[1]; // @[lsu_stbuf.scala 130:197]
  wire  _T_43 = _T_40 & _T_42; // @[lsu_stbuf.scala 130:195]
  wire  _T_45 = ~stbuf_reset[1]; // @[lsu_stbuf.scala 130:218]
  wire  _T_46 = _T_43 & _T_45; // @[lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_2; // @[lib.scala 358:16]
  wire  _T_49 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 130:120]
  wire  _T_51 = _T_49 & stbuf_vld[2]; // @[lsu_stbuf.scala 130:179]
  wire  _T_53 = ~stbuf_dma_kill[2]; // @[lsu_stbuf.scala 130:197]
  wire  _T_54 = _T_51 & _T_53; // @[lsu_stbuf.scala 130:195]
  wire  _T_56 = ~stbuf_reset[2]; // @[lsu_stbuf.scala 130:218]
  wire  _T_57 = _T_54 & _T_56; // @[lsu_stbuf.scala 130:216]
  reg [15:0] stbuf_addr_3; // @[lib.scala 358:16]
  wire  _T_60 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 130:120]
  wire  _T_62 = _T_60 & stbuf_vld[3]; // @[lsu_stbuf.scala 130:179]
  wire  _T_64 = ~stbuf_dma_kill[3]; // @[lsu_stbuf.scala 130:197]
  wire  _T_65 = _T_62 & _T_64; // @[lsu_stbuf.scala 130:195]
  wire  _T_67 = ~stbuf_reset[3]; // @[lsu_stbuf.scala 130:218]
  wire  _T_68 = _T_65 & _T_67; // @[lsu_stbuf.scala 130:216]
  wire [3:0] store_matchvec_lo_r = {_T_68,_T_57,_T_46,_T_35}; // @[Cat.scala 29:58]
  wire  _T_73 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 131:120]
  wire  _T_75 = _T_73 & stbuf_vld[0]; // @[lsu_stbuf.scala 131:179]
  wire  _T_78 = _T_75 & _T_31; // @[lsu_stbuf.scala 131:194]
  wire  _T_79 = _T_78 & dual_stbuf_write_r; // @[lsu_stbuf.scala 131:215]
  wire  _T_82 = _T_79 & _T_34; // @[lsu_stbuf.scala 131:236]
  wire  _T_85 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 131:120]
  wire  _T_87 = _T_85 & stbuf_vld[1]; // @[lsu_stbuf.scala 131:179]
  wire  _T_90 = _T_87 & _T_42; // @[lsu_stbuf.scala 131:194]
  wire  _T_91 = _T_90 & dual_stbuf_write_r; // @[lsu_stbuf.scala 131:215]
  wire  _T_94 = _T_91 & _T_45; // @[lsu_stbuf.scala 131:236]
  wire  _T_97 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 131:120]
  wire  _T_99 = _T_97 & stbuf_vld[2]; // @[lsu_stbuf.scala 131:179]
  wire  _T_102 = _T_99 & _T_53; // @[lsu_stbuf.scala 131:194]
  wire  _T_103 = _T_102 & dual_stbuf_write_r; // @[lsu_stbuf.scala 131:215]
  wire  _T_106 = _T_103 & _T_56; // @[lsu_stbuf.scala 131:236]
  wire  _T_109 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 131:120]
  wire  _T_111 = _T_109 & stbuf_vld[3]; // @[lsu_stbuf.scala 131:179]
  wire  _T_114 = _T_111 & _T_64; // @[lsu_stbuf.scala 131:194]
  wire  _T_115 = _T_114 & dual_stbuf_write_r; // @[lsu_stbuf.scala 131:215]
  wire  _T_118 = _T_115 & _T_67; // @[lsu_stbuf.scala 131:236]
  wire [3:0] store_matchvec_hi_r = {_T_118,_T_106,_T_94,_T_82}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[lsu_stbuf.scala 133:49]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[lsu_stbuf.scala 134:49]
  wire  _T_121 = 2'h0 == WrPtr; // @[lsu_stbuf.scala 137:16]
  wire  _T_122 = ~store_coalesce_lo_r; // @[lsu_stbuf.scala 137:29]
  wire  _T_123 = _T_121 & _T_122; // @[lsu_stbuf.scala 137:27]
  wire  _T_125 = _T_121 & dual_stbuf_write_r; // @[lsu_stbuf.scala 138:29]
  wire  _T_126 = ~store_coalesce_hi_r; // @[lsu_stbuf.scala 138:52]
  wire  _T_127 = _T_125 & _T_126; // @[lsu_stbuf.scala 138:50]
  wire  _T_128 = _T_123 | _T_127; // @[lsu_stbuf.scala 137:51]
  wire  _T_129 = 2'h0 == WrPtrPlus1; // @[lsu_stbuf.scala 139:18]
  wire  _T_130 = _T_129 & dual_stbuf_write_r; // @[lsu_stbuf.scala 139:34]
  wire  _T_131 = store_coalesce_lo_r | store_coalesce_hi_r; // @[lsu_stbuf.scala 139:79]
  wire  _T_132 = ~_T_131; // @[lsu_stbuf.scala 139:57]
  wire  _T_133 = _T_130 & _T_132; // @[lsu_stbuf.scala 139:55]
  wire  _T_134 = _T_128 | _T_133; // @[lsu_stbuf.scala 138:74]
  wire  _T_136 = _T_134 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 139:103]
  wire  _T_138 = _T_136 | store_matchvec_hi_r[0]; // @[lsu_stbuf.scala 140:30]
  wire  _T_139 = io_ldst_stbuf_reqvld_r & _T_138; // @[lsu_stbuf.scala 136:76]
  wire  _T_140 = 2'h1 == WrPtr; // @[lsu_stbuf.scala 137:16]
  wire  _T_142 = _T_140 & _T_122; // @[lsu_stbuf.scala 137:27]
  wire  _T_144 = _T_140 & dual_stbuf_write_r; // @[lsu_stbuf.scala 138:29]
  wire  _T_146 = _T_144 & _T_126; // @[lsu_stbuf.scala 138:50]
  wire  _T_147 = _T_142 | _T_146; // @[lsu_stbuf.scala 137:51]
  wire  _T_148 = 2'h1 == WrPtrPlus1; // @[lsu_stbuf.scala 139:18]
  wire  _T_149 = _T_148 & dual_stbuf_write_r; // @[lsu_stbuf.scala 139:34]
  wire  _T_152 = _T_149 & _T_132; // @[lsu_stbuf.scala 139:55]
  wire  _T_153 = _T_147 | _T_152; // @[lsu_stbuf.scala 138:74]
  wire  _T_155 = _T_153 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 139:103]
  wire  _T_157 = _T_155 | store_matchvec_hi_r[1]; // @[lsu_stbuf.scala 140:30]
  wire  _T_158 = io_ldst_stbuf_reqvld_r & _T_157; // @[lsu_stbuf.scala 136:76]
  wire  _T_159 = 2'h2 == WrPtr; // @[lsu_stbuf.scala 137:16]
  wire  _T_161 = _T_159 & _T_122; // @[lsu_stbuf.scala 137:27]
  wire  _T_163 = _T_159 & dual_stbuf_write_r; // @[lsu_stbuf.scala 138:29]
  wire  _T_165 = _T_163 & _T_126; // @[lsu_stbuf.scala 138:50]
  wire  _T_166 = _T_161 | _T_165; // @[lsu_stbuf.scala 137:51]
  wire  _T_167 = 2'h2 == WrPtrPlus1; // @[lsu_stbuf.scala 139:18]
  wire  _T_168 = _T_167 & dual_stbuf_write_r; // @[lsu_stbuf.scala 139:34]
  wire  _T_171 = _T_168 & _T_132; // @[lsu_stbuf.scala 139:55]
  wire  _T_172 = _T_166 | _T_171; // @[lsu_stbuf.scala 138:74]
  wire  _T_174 = _T_172 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 139:103]
  wire  _T_176 = _T_174 | store_matchvec_hi_r[2]; // @[lsu_stbuf.scala 140:30]
  wire  _T_177 = io_ldst_stbuf_reqvld_r & _T_176; // @[lsu_stbuf.scala 136:76]
  wire  _T_178 = 2'h3 == WrPtr; // @[lsu_stbuf.scala 137:16]
  wire  _T_180 = _T_178 & _T_122; // @[lsu_stbuf.scala 137:27]
  wire  _T_182 = _T_178 & dual_stbuf_write_r; // @[lsu_stbuf.scala 138:29]
  wire  _T_184 = _T_182 & _T_126; // @[lsu_stbuf.scala 138:50]
  wire  _T_185 = _T_180 | _T_184; // @[lsu_stbuf.scala 137:51]
  wire  _T_186 = 2'h3 == WrPtrPlus1; // @[lsu_stbuf.scala 139:18]
  wire  _T_187 = _T_186 & dual_stbuf_write_r; // @[lsu_stbuf.scala 139:34]
  wire  _T_190 = _T_187 & _T_132; // @[lsu_stbuf.scala 139:55]
  wire  _T_191 = _T_185 | _T_190; // @[lsu_stbuf.scala 138:74]
  wire  _T_193 = _T_191 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 139:103]
  wire  _T_195 = _T_193 | store_matchvec_hi_r[3]; // @[lsu_stbuf.scala 140:30]
  wire  _T_196 = io_ldst_stbuf_reqvld_r & _T_195; // @[lsu_stbuf.scala 136:76]
  wire [3:0] stbuf_wr_en = {_T_196,_T_177,_T_158,_T_139}; // @[Cat.scala 29:58]
  wire  _T_219 = ~ldst_dual_r; // @[lsu_stbuf.scala 142:53]
  wire  _T_220 = _T_219 | io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 142:66]
  wire  _T_223 = _T_220 & _T_121; // @[lsu_stbuf.scala 142:93]
  wire  _T_225 = _T_223 & _T_122; // @[lsu_stbuf.scala 142:123]
  wire  _T_227 = _T_225 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 142:147]
  wire  _T_232 = _T_220 & _T_140; // @[lsu_stbuf.scala 142:93]
  wire  _T_234 = _T_232 & _T_122; // @[lsu_stbuf.scala 142:123]
  wire  _T_236 = _T_234 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 142:147]
  wire  _T_241 = _T_220 & _T_159; // @[lsu_stbuf.scala 142:93]
  wire  _T_243 = _T_241 & _T_122; // @[lsu_stbuf.scala 142:123]
  wire  _T_245 = _T_243 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 142:147]
  wire  _T_250 = _T_220 & _T_178; // @[lsu_stbuf.scala 142:93]
  wire  _T_252 = _T_250 & _T_122; // @[lsu_stbuf.scala 142:123]
  wire  _T_254 = _T_252 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 142:147]
  wire [3:0] sel_lo = {_T_254,_T_245,_T_236,_T_227}; // @[Cat.scala 29:58]
  reg [3:0] stbuf_byteen_0; // @[lsu_stbuf.scala 165:92]
  wire [3:0] _T_274 = stbuf_byteen_0 | store_byteen_lo_r; // @[lsu_stbuf.scala 145:86]
  wire [3:0] _T_275 = stbuf_byteen_0 | store_byteen_hi_r; // @[lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_0 = sel_lo[0] ? _T_274 : _T_275; // @[lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_1; // @[lsu_stbuf.scala 165:92]
  wire [3:0] _T_278 = stbuf_byteen_1 | store_byteen_lo_r; // @[lsu_stbuf.scala 145:86]
  wire [3:0] _T_279 = stbuf_byteen_1 | store_byteen_hi_r; // @[lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_1 = sel_lo[1] ? _T_278 : _T_279; // @[lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_2; // @[lsu_stbuf.scala 165:92]
  wire [3:0] _T_282 = stbuf_byteen_2 | store_byteen_lo_r; // @[lsu_stbuf.scala 145:86]
  wire [3:0] _T_283 = stbuf_byteen_2 | store_byteen_hi_r; // @[lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_2 = sel_lo[2] ? _T_282 : _T_283; // @[lsu_stbuf.scala 145:58]
  reg [3:0] stbuf_byteen_3; // @[lsu_stbuf.scala 165:92]
  wire [3:0] _T_286 = stbuf_byteen_3 | store_byteen_lo_r; // @[lsu_stbuf.scala 145:86]
  wire [3:0] _T_287 = stbuf_byteen_3 | store_byteen_hi_r; // @[lsu_stbuf.scala 145:123]
  wire [3:0] stbuf_byteenin_3 = sel_lo[3] ? _T_286 : _T_287; // @[lsu_stbuf.scala 145:58]
  wire  _T_291 = ~stbuf_byteen_0[0]; // @[lsu_stbuf.scala 147:67]
  wire  _T_293 = _T_291 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_0; // @[lib.scala 358:16]
  wire [7:0] _T_296 = _T_293 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 147:66]
  wire  _T_300 = _T_291 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 148:29]
  wire [7:0] _T_303 = _T_300 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 148:8]
  wire [7:0] datain1_0 = sel_lo[0] ? _T_296 : _T_303; // @[lsu_stbuf.scala 147:51]
  wire  _T_307 = ~stbuf_byteen_1[0]; // @[lsu_stbuf.scala 147:67]
  wire  _T_309 = _T_307 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_1; // @[lib.scala 358:16]
  wire [7:0] _T_312 = _T_309 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 147:66]
  wire  _T_316 = _T_307 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 148:29]
  wire [7:0] _T_319 = _T_316 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 148:8]
  wire [7:0] datain1_1 = sel_lo[1] ? _T_312 : _T_319; // @[lsu_stbuf.scala 147:51]
  wire  _T_323 = ~stbuf_byteen_2[0]; // @[lsu_stbuf.scala 147:67]
  wire  _T_325 = _T_323 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_2; // @[lib.scala 358:16]
  wire [7:0] _T_328 = _T_325 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 147:66]
  wire  _T_332 = _T_323 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 148:29]
  wire [7:0] _T_335 = _T_332 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 148:8]
  wire [7:0] datain1_2 = sel_lo[2] ? _T_328 : _T_335; // @[lsu_stbuf.scala 147:51]
  wire  _T_339 = ~stbuf_byteen_3[0]; // @[lsu_stbuf.scala 147:67]
  wire  _T_341 = _T_339 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 147:87]
  reg [31:0] stbuf_data_3; // @[lib.scala 358:16]
  wire [7:0] _T_344 = _T_341 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 147:66]
  wire  _T_348 = _T_339 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 148:29]
  wire [7:0] _T_351 = _T_348 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 148:8]
  wire [7:0] datain1_3 = sel_lo[3] ? _T_344 : _T_351; // @[lsu_stbuf.scala 147:51]
  wire  _T_355 = ~stbuf_byteen_0[1]; // @[lsu_stbuf.scala 150:68]
  wire  _T_357 = _T_355 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 150:88]
  wire [7:0] _T_360 = _T_357 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 150:67]
  wire  _T_364 = _T_355 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 151:29]
  wire [7:0] _T_367 = _T_364 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 151:8]
  wire [7:0] datain2_0 = sel_lo[0] ? _T_360 : _T_367; // @[lsu_stbuf.scala 150:52]
  wire  _T_371 = ~stbuf_byteen_1[1]; // @[lsu_stbuf.scala 150:68]
  wire  _T_373 = _T_371 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 150:88]
  wire [7:0] _T_376 = _T_373 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 150:67]
  wire  _T_380 = _T_371 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 151:29]
  wire [7:0] _T_383 = _T_380 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 151:8]
  wire [7:0] datain2_1 = sel_lo[1] ? _T_376 : _T_383; // @[lsu_stbuf.scala 150:52]
  wire  _T_387 = ~stbuf_byteen_2[1]; // @[lsu_stbuf.scala 150:68]
  wire  _T_389 = _T_387 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 150:88]
  wire [7:0] _T_392 = _T_389 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 150:67]
  wire  _T_396 = _T_387 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 151:29]
  wire [7:0] _T_399 = _T_396 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 151:8]
  wire [7:0] datain2_2 = sel_lo[2] ? _T_392 : _T_399; // @[lsu_stbuf.scala 150:52]
  wire  _T_403 = ~stbuf_byteen_3[1]; // @[lsu_stbuf.scala 150:68]
  wire  _T_405 = _T_403 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 150:88]
  wire [7:0] _T_408 = _T_405 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 150:67]
  wire  _T_412 = _T_403 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 151:29]
  wire [7:0] _T_415 = _T_412 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 151:8]
  wire [7:0] datain2_3 = sel_lo[3] ? _T_408 : _T_415; // @[lsu_stbuf.scala 150:52]
  wire  _T_419 = ~stbuf_byteen_0[2]; // @[lsu_stbuf.scala 153:68]
  wire  _T_421 = _T_419 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 153:88]
  wire [7:0] _T_424 = _T_421 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 153:67]
  wire  _T_428 = _T_419 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 154:29]
  wire [7:0] _T_431 = _T_428 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 154:8]
  wire [7:0] datain3_0 = sel_lo[0] ? _T_424 : _T_431; // @[lsu_stbuf.scala 153:52]
  wire  _T_435 = ~stbuf_byteen_1[2]; // @[lsu_stbuf.scala 153:68]
  wire  _T_437 = _T_435 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 153:88]
  wire [7:0] _T_440 = _T_437 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 153:67]
  wire  _T_444 = _T_435 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 154:29]
  wire [7:0] _T_447 = _T_444 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 154:8]
  wire [7:0] datain3_1 = sel_lo[1] ? _T_440 : _T_447; // @[lsu_stbuf.scala 153:52]
  wire  _T_451 = ~stbuf_byteen_2[2]; // @[lsu_stbuf.scala 153:68]
  wire  _T_453 = _T_451 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 153:88]
  wire [7:0] _T_456 = _T_453 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 153:67]
  wire  _T_460 = _T_451 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 154:29]
  wire [7:0] _T_463 = _T_460 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 154:8]
  wire [7:0] datain3_2 = sel_lo[2] ? _T_456 : _T_463; // @[lsu_stbuf.scala 153:52]
  wire  _T_467 = ~stbuf_byteen_3[2]; // @[lsu_stbuf.scala 153:68]
  wire  _T_469 = _T_467 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 153:88]
  wire [7:0] _T_472 = _T_469 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 153:67]
  wire  _T_476 = _T_467 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 154:29]
  wire [7:0] _T_479 = _T_476 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 154:8]
  wire [7:0] datain3_3 = sel_lo[3] ? _T_472 : _T_479; // @[lsu_stbuf.scala 153:52]
  wire  _T_483 = ~stbuf_byteen_0[3]; // @[lsu_stbuf.scala 156:68]
  wire  _T_485 = _T_483 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 156:88]
  wire [7:0] _T_488 = _T_485 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 156:67]
  wire  _T_492 = _T_483 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 157:29]
  wire [7:0] _T_495 = _T_492 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 157:8]
  wire [7:0] datain4_0 = sel_lo[0] ? _T_488 : _T_495; // @[lsu_stbuf.scala 156:52]
  wire  _T_499 = ~stbuf_byteen_1[3]; // @[lsu_stbuf.scala 156:68]
  wire  _T_501 = _T_499 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 156:88]
  wire [7:0] _T_504 = _T_501 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 156:67]
  wire  _T_508 = _T_499 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 157:29]
  wire [7:0] _T_511 = _T_508 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 157:8]
  wire [7:0] datain4_1 = sel_lo[1] ? _T_504 : _T_511; // @[lsu_stbuf.scala 156:52]
  wire  _T_515 = ~stbuf_byteen_2[3]; // @[lsu_stbuf.scala 156:68]
  wire  _T_517 = _T_515 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 156:88]
  wire [7:0] _T_520 = _T_517 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 156:67]
  wire  _T_524 = _T_515 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 157:29]
  wire [7:0] _T_527 = _T_524 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 157:8]
  wire [7:0] datain4_2 = sel_lo[2] ? _T_520 : _T_527; // @[lsu_stbuf.scala 156:52]
  wire  _T_531 = ~stbuf_byteen_3[3]; // @[lsu_stbuf.scala 156:68]
  wire  _T_533 = _T_531 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 156:88]
  wire [7:0] _T_536 = _T_533 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 156:67]
  wire  _T_540 = _T_531 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 157:29]
  wire [7:0] _T_543 = _T_540 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 157:8]
  wire [7:0] datain4_3 = sel_lo[3] ? _T_536 : _T_543; // @[lsu_stbuf.scala 156:52]
  wire [15:0] _T_545 = {datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_546 = {datain4_0,datain3_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_548 = {datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_549 = {datain4_1,datain3_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_551 = {datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_552 = {datain4_2,datain3_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_554 = {datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] _T_555 = {datain4_3,datain3_3}; // @[Cat.scala 29:58]
  wire  _T_560 = stbuf_wr_en[0] | stbuf_vld[0]; // @[lsu_stbuf.scala 163:92]
  wire  _T_568 = stbuf_wr_en[1] | stbuf_vld[1]; // @[lsu_stbuf.scala 163:92]
  wire  _T_576 = stbuf_wr_en[2] | stbuf_vld[2]; // @[lsu_stbuf.scala 163:92]
  wire  _T_584 = stbuf_wr_en[3] | stbuf_vld[3]; // @[lsu_stbuf.scala 163:92]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[lsu_stbuf.scala 200:16]
  wire  _T_789 = stbuf_addr_3[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 206:115]
  wire  _T_791 = _T_789 & stbuf_vld[3]; // @[lsu_stbuf.scala 206:139]
  wire  _T_794 = _T_791 & _T_64; // @[lsu_stbuf.scala 206:154]
  wire  _T_795 = _T_794 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 206:175]
  wire  _T_780 = stbuf_addr_2[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 206:115]
  wire  _T_782 = _T_780 & stbuf_vld[2]; // @[lsu_stbuf.scala 206:139]
  wire  _T_785 = _T_782 & _T_53; // @[lsu_stbuf.scala 206:154]
  wire  _T_786 = _T_785 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 206:175]
  wire  _T_771 = stbuf_addr_1[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 206:115]
  wire  _T_773 = _T_771 & stbuf_vld[1]; // @[lsu_stbuf.scala 206:139]
  wire  _T_776 = _T_773 & _T_42; // @[lsu_stbuf.scala 206:154]
  wire  _T_777 = _T_776 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 206:175]
  wire  _T_762 = stbuf_addr_0[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 206:115]
  wire  _T_764 = _T_762 & stbuf_vld[0]; // @[lsu_stbuf.scala 206:139]
  wire  _T_767 = _T_764 & _T_31; // @[lsu_stbuf.scala 206:154]
  wire  _T_768 = _T_767 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 206:175]
  wire [3:0] stbuf_match_hi = {_T_795,_T_786,_T_777,_T_768}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[lsu_stbuf.scala 203:17]
  wire  _T_827 = stbuf_addr_3[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 207:115]
  wire  _T_829 = _T_827 & stbuf_vld[3]; // @[lsu_stbuf.scala 207:139]
  wire  _T_832 = _T_829 & _T_64; // @[lsu_stbuf.scala 207:154]
  wire  _T_833 = _T_832 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 207:175]
  wire  _T_818 = stbuf_addr_2[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 207:115]
  wire  _T_820 = _T_818 & stbuf_vld[2]; // @[lsu_stbuf.scala 207:139]
  wire  _T_823 = _T_820 & _T_53; // @[lsu_stbuf.scala 207:154]
  wire  _T_824 = _T_823 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 207:175]
  wire  _T_809 = stbuf_addr_1[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 207:115]
  wire  _T_811 = _T_809 & stbuf_vld[1]; // @[lsu_stbuf.scala 207:139]
  wire  _T_814 = _T_811 & _T_42; // @[lsu_stbuf.scala 207:154]
  wire  _T_815 = _T_814 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 207:175]
  wire  _T_800 = stbuf_addr_0[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 207:115]
  wire  _T_802 = _T_800 & stbuf_vld[0]; // @[lsu_stbuf.scala 207:139]
  wire  _T_805 = _T_802 & _T_31; // @[lsu_stbuf.scala 207:154]
  wire  _T_806 = _T_805 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 207:175]
  wire [3:0] stbuf_match_lo = {_T_833,_T_824,_T_815,_T_806}; // @[Cat.scala 29:58]
  wire  _T_856 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[lsu_stbuf.scala 208:78]
  wire  _T_857 = _T_856 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 208:99]
  wire  _T_858 = _T_857 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 208:120]
  wire  _T_859 = _T_858 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 208:144]
  wire  _T_850 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[lsu_stbuf.scala 208:78]
  wire  _T_851 = _T_850 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 208:99]
  wire  _T_852 = _T_851 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 208:120]
  wire  _T_853 = _T_852 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 208:144]
  wire  _T_844 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[lsu_stbuf.scala 208:78]
  wire  _T_845 = _T_844 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 208:99]
  wire  _T_846 = _T_845 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 208:120]
  wire  _T_847 = _T_846 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 208:144]
  wire  _T_838 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[lsu_stbuf.scala 208:78]
  wire  _T_839 = _T_838 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 208:99]
  wire  _T_840 = _T_839 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 208:120]
  wire  _T_841 = _T_840 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 208:144]
  wire [3:0] stbuf_dma_kill_en = {_T_859,_T_853,_T_847,_T_841}; // @[Cat.scala 29:58]
  wire  _T_595 = stbuf_dma_kill_en[0] | stbuf_dma_kill[0]; // @[lsu_stbuf.scala 164:96]
  wire  _T_603 = stbuf_dma_kill_en[1] | stbuf_dma_kill[1]; // @[lsu_stbuf.scala 164:96]
  wire  _T_611 = stbuf_dma_kill_en[2] | stbuf_dma_kill[2]; // @[lsu_stbuf.scala 164:96]
  wire  _T_619 = stbuf_dma_kill_en[3] | stbuf_dma_kill[3]; // @[lsu_stbuf.scala 164:96]
  wire [3:0] _T_629 = stbuf_wr_en[0] ? stbuf_byteenin_0 : stbuf_byteen_0; // @[lsu_stbuf.scala 165:96]
  wire [3:0] _T_633 = _T_34 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_638 = stbuf_wr_en[1] ? stbuf_byteenin_1 : stbuf_byteen_1; // @[lsu_stbuf.scala 165:96]
  wire [3:0] _T_642 = _T_45 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_647 = stbuf_wr_en[2] ? stbuf_byteenin_2 : stbuf_byteen_2; // @[lsu_stbuf.scala 165:96]
  wire [3:0] _T_651 = _T_56 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_656 = stbuf_wr_en[3] ? stbuf_byteenin_3 : stbuf_byteen_3; // @[lsu_stbuf.scala 165:96]
  wire [3:0] _T_660 = _T_67 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg  ldst_dual_m; // @[lsu_stbuf.scala 170:52]
  wire [3:0] _T_689 = stbuf_vld >> RdPtr; // @[lsu_stbuf.scala 174:43]
  wire [3:0] _T_691 = stbuf_dma_kill >> RdPtr; // @[lsu_stbuf.scala 174:67]
  wire  _T_698 = ~_T_691[0]; // @[lsu_stbuf.scala 175:46]
  wire  _T_699 = _T_689[0] & _T_698; // @[lsu_stbuf.scala 175:44]
  wire  _T_700 = |stbuf_dma_kill_en; // @[lsu_stbuf.scala 175:91]
  wire  _T_701 = ~_T_700; // @[lsu_stbuf.scala 175:71]
  wire [15:0] _GEN_1 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[lsu_stbuf.scala 176:22]
  wire [15:0] _GEN_2 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_1; // @[lsu_stbuf.scala 176:22]
  wire [31:0] _GEN_5 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[lsu_stbuf.scala 177:22]
  wire [31:0] _GEN_6 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_5; // @[lsu_stbuf.scala 177:22]
  wire  _T_703 = ~dual_stbuf_write_r; // @[lsu_stbuf.scala 179:44]
  wire  _T_704 = io_ldst_stbuf_reqvld_r & _T_703; // @[lsu_stbuf.scala 179:42]
  wire  _T_705 = store_coalesce_hi_r | store_coalesce_lo_r; // @[lsu_stbuf.scala 179:88]
  wire  _T_706 = ~_T_705; // @[lsu_stbuf.scala 179:66]
  wire  _T_707 = _T_704 & _T_706; // @[lsu_stbuf.scala 179:64]
  wire  _T_708 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[lsu_stbuf.scala 180:30]
  wire  _T_709 = store_coalesce_hi_r & store_coalesce_lo_r; // @[lsu_stbuf.scala 180:76]
  wire  _T_710 = ~_T_709; // @[lsu_stbuf.scala 180:54]
  wire  _T_711 = _T_708 & _T_710; // @[lsu_stbuf.scala 180:52]
  wire  WrPtrEn = _T_707 | _T_711; // @[lsu_stbuf.scala 179:113]
  wire  _T_716 = _T_708 & _T_706; // @[lsu_stbuf.scala 181:67]
  wire [3:0] _T_721 = {3'h0,stbuf_vld[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_723 = {3'h0,stbuf_vld[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_725 = {3'h0,stbuf_vld[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_727 = {3'h0,stbuf_vld[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_730 = _T_721 + _T_723; // @[lsu_stbuf.scala 188:101]
  wire [3:0] _T_732 = _T_730 + _T_725; // @[lsu_stbuf.scala 188:101]
  wire [3:0] stbuf_numvld_any = _T_732 + _T_727; // @[lsu_stbuf.scala 188:101]
  wire  _T_734 = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 189:39]
  wire  _T_735 = _T_734 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 189:65]
  wire  _T_736 = ~io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 189:87]
  wire  isdccmst_m = _T_735 & _T_736; // @[lsu_stbuf.scala 189:85]
  wire  _T_737 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 190:39]
  wire  _T_738 = _T_737 & io_addr_in_dccm_r; // @[lsu_stbuf.scala 190:65]
  wire  _T_739 = ~io_lsu_pkt_r_bits_dma; // @[lsu_stbuf.scala 190:87]
  wire  isdccmst_r = _T_738 & _T_739; // @[lsu_stbuf.scala 190:85]
  wire [1:0] _T_740 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_741 = isdccmst_m & ldst_dual_m; // @[lsu_stbuf.scala 192:62]
  wire [2:0] _GEN_14 = {{1'd0}, _T_740}; // @[lsu_stbuf.scala 192:47]
  wire [2:0] _T_742 = _GEN_14 << _T_741; // @[lsu_stbuf.scala 192:47]
  wire [1:0] _T_743 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_744 = isdccmst_r & ldst_dual_r; // @[lsu_stbuf.scala 193:62]
  wire [2:0] _GEN_15 = {{1'd0}, _T_743}; // @[lsu_stbuf.scala 193:47]
  wire [2:0] _T_745 = _GEN_15 << _T_744; // @[lsu_stbuf.scala 193:47]
  wire [1:0] stbuf_specvld_m = _T_742[1:0]; // @[lsu_stbuf.scala 192:19]
  wire [3:0] _T_746 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_748 = stbuf_numvld_any + _T_746; // @[lsu_stbuf.scala 194:44]
  wire [1:0] stbuf_specvld_r = _T_745[1:0]; // @[lsu_stbuf.scala 193:19]
  wire [3:0] _T_749 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_748 + _T_749; // @[lsu_stbuf.scala 194:78]
  wire  _T_751 = ~ldst_dual_d; // @[lsu_stbuf.scala 196:34]
  wire  _T_752 = _T_751 & io_dec_lsu_valid_raw_d; // @[lsu_stbuf.scala 196:47]
  wire  _T_754 = stbuf_specvld_any >= 4'h4; // @[lsu_stbuf.scala 196:99]
  wire  _T_755 = stbuf_specvld_any >= 4'h3; // @[lsu_stbuf.scala 196:140]
  wire  _T_865 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_0 = _T_865 & stbuf_vld[0]; // @[lsu_stbuf.scala 211:137]
  wire  _T_869 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_1 = _T_869 & stbuf_vld[0]; // @[lsu_stbuf.scala 211:137]
  wire  _T_873 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_2 = _T_873 & stbuf_vld[0]; // @[lsu_stbuf.scala 211:137]
  wire  _T_877 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_0_3 = _T_877 & stbuf_vld[0]; // @[lsu_stbuf.scala 211:137]
  wire  _T_881 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_0 = _T_881 & stbuf_vld[1]; // @[lsu_stbuf.scala 211:137]
  wire  _T_885 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_1 = _T_885 & stbuf_vld[1]; // @[lsu_stbuf.scala 211:137]
  wire  _T_889 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_2 = _T_889 & stbuf_vld[1]; // @[lsu_stbuf.scala 211:137]
  wire  _T_893 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_1_3 = _T_893 & stbuf_vld[1]; // @[lsu_stbuf.scala 211:137]
  wire  _T_897 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_0 = _T_897 & stbuf_vld[2]; // @[lsu_stbuf.scala 211:137]
  wire  _T_901 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_1 = _T_901 & stbuf_vld[2]; // @[lsu_stbuf.scala 211:137]
  wire  _T_905 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_2 = _T_905 & stbuf_vld[2]; // @[lsu_stbuf.scala 211:137]
  wire  _T_909 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_2_3 = _T_909 & stbuf_vld[2]; // @[lsu_stbuf.scala 211:137]
  wire  _T_913 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_0 = _T_913 & stbuf_vld[3]; // @[lsu_stbuf.scala 211:137]
  wire  _T_917 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_1 = _T_917 & stbuf_vld[3]; // @[lsu_stbuf.scala 211:137]
  wire  _T_921 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_2 = _T_921 & stbuf_vld[3]; // @[lsu_stbuf.scala 211:137]
  wire  _T_925 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 211:116]
  wire  stbuf_fwdbyteenvec_hi_3_3 = _T_925 & stbuf_vld[3]; // @[lsu_stbuf.scala 211:137]
  wire  _T_929 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_0 = _T_929 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:137]
  wire  _T_933 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_1 = _T_933 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:137]
  wire  _T_937 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_2 = _T_937 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:137]
  wire  _T_941 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_0_3 = _T_941 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:137]
  wire  _T_945 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_0 = _T_945 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:137]
  wire  _T_949 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_1 = _T_949 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:137]
  wire  _T_953 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_2 = _T_953 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:137]
  wire  _T_957 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_1_3 = _T_957 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:137]
  wire  _T_961 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_0 = _T_961 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:137]
  wire  _T_965 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_1 = _T_965 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:137]
  wire  _T_969 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_2 = _T_969 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:137]
  wire  _T_973 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_2_3 = _T_973 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:137]
  wire  _T_977 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_0 = _T_977 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:137]
  wire  _T_981 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_1 = _T_981 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:137]
  wire  _T_985 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_2 = _T_985 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:137]
  wire  _T_989 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 212:116]
  wire  stbuf_fwdbyteenvec_lo_3_3 = _T_989 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:137]
  wire  _T_991 = stbuf_fwdbyteenvec_hi_0_0 | stbuf_fwdbyteenvec_hi_1_0; // @[lsu_stbuf.scala 213:147]
  wire  _T_992 = _T_991 | stbuf_fwdbyteenvec_hi_2_0; // @[lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_992 | stbuf_fwdbyteenvec_hi_3_0; // @[lsu_stbuf.scala 213:147]
  wire  _T_993 = stbuf_fwdbyteenvec_hi_0_1 | stbuf_fwdbyteenvec_hi_1_1; // @[lsu_stbuf.scala 213:147]
  wire  _T_994 = _T_993 | stbuf_fwdbyteenvec_hi_2_1; // @[lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_994 | stbuf_fwdbyteenvec_hi_3_1; // @[lsu_stbuf.scala 213:147]
  wire  _T_995 = stbuf_fwdbyteenvec_hi_0_2 | stbuf_fwdbyteenvec_hi_1_2; // @[lsu_stbuf.scala 213:147]
  wire  _T_996 = _T_995 | stbuf_fwdbyteenvec_hi_2_2; // @[lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_996 | stbuf_fwdbyteenvec_hi_3_2; // @[lsu_stbuf.scala 213:147]
  wire  _T_997 = stbuf_fwdbyteenvec_hi_0_3 | stbuf_fwdbyteenvec_hi_1_3; // @[lsu_stbuf.scala 213:147]
  wire  _T_998 = _T_997 | stbuf_fwdbyteenvec_hi_2_3; // @[lsu_stbuf.scala 213:147]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_998 | stbuf_fwdbyteenvec_hi_3_3; // @[lsu_stbuf.scala 213:147]
  wire  _T_999 = stbuf_fwdbyteenvec_lo_0_0 | stbuf_fwdbyteenvec_lo_1_0; // @[lsu_stbuf.scala 214:147]
  wire  _T_1000 = _T_999 | stbuf_fwdbyteenvec_lo_2_0; // @[lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_1000 | stbuf_fwdbyteenvec_lo_3_0; // @[lsu_stbuf.scala 214:147]
  wire  _T_1001 = stbuf_fwdbyteenvec_lo_0_1 | stbuf_fwdbyteenvec_lo_1_1; // @[lsu_stbuf.scala 214:147]
  wire  _T_1002 = _T_1001 | stbuf_fwdbyteenvec_lo_2_1; // @[lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_1002 | stbuf_fwdbyteenvec_lo_3_1; // @[lsu_stbuf.scala 214:147]
  wire  _T_1003 = stbuf_fwdbyteenvec_lo_0_2 | stbuf_fwdbyteenvec_lo_1_2; // @[lsu_stbuf.scala 214:147]
  wire  _T_1004 = _T_1003 | stbuf_fwdbyteenvec_lo_2_2; // @[lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_1004 | stbuf_fwdbyteenvec_lo_3_2; // @[lsu_stbuf.scala 214:147]
  wire  _T_1005 = stbuf_fwdbyteenvec_lo_0_3 | stbuf_fwdbyteenvec_lo_1_3; // @[lsu_stbuf.scala 214:147]
  wire  _T_1006 = _T_1005 | stbuf_fwdbyteenvec_lo_2_3; // @[lsu_stbuf.scala 214:147]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_1006 | stbuf_fwdbyteenvec_lo_3_3; // @[lsu_stbuf.scala 214:147]
  wire [31:0] _T_1009 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1010 = _T_1009 & stbuf_data_0; // @[lsu_stbuf.scala 216:97]
  wire [31:0] _T_1013 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1014 = _T_1013 & stbuf_data_1; // @[lsu_stbuf.scala 216:97]
  wire [31:0] _T_1017 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1018 = _T_1017 & stbuf_data_2; // @[lsu_stbuf.scala 216:97]
  wire [31:0] _T_1021 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1022 = _T_1021 & stbuf_data_3; // @[lsu_stbuf.scala 216:97]
  wire [31:0] _T_1024 = _T_1022 | _T_1018; // @[lsu_stbuf.scala 216:130]
  wire [31:0] _T_1025 = _T_1024 | _T_1014; // @[lsu_stbuf.scala 216:130]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_1025 | _T_1010; // @[lsu_stbuf.scala 216:130]
  wire [31:0] _T_1028 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1029 = _T_1028 & stbuf_data_0; // @[lsu_stbuf.scala 217:97]
  wire [31:0] _T_1032 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1033 = _T_1032 & stbuf_data_1; // @[lsu_stbuf.scala 217:97]
  wire [31:0] _T_1036 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1037 = _T_1036 & stbuf_data_2; // @[lsu_stbuf.scala 217:97]
  wire [31:0] _T_1040 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1041 = _T_1040 & stbuf_data_3; // @[lsu_stbuf.scala 217:97]
  wire [31:0] _T_1043 = _T_1041 | _T_1037; // @[lsu_stbuf.scala 217:130]
  wire [31:0] _T_1044 = _T_1043 | _T_1033; // @[lsu_stbuf.scala 217:130]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1044 | _T_1029; // @[lsu_stbuf.scala 217:130]
  wire  _T_1049 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 224:49]
  wire  _T_1050 = _T_1049 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 224:74]
  wire  _T_1051 = _T_1050 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 224:95]
  wire  ld_addr_rhit_lo_lo = _T_1051 & _T_739; // @[lsu_stbuf.scala 224:121]
  wire  _T_1055 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 225:49]
  wire  _T_1056 = _T_1055 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 225:74]
  wire  _T_1057 = _T_1056 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 225:95]
  wire  ld_addr_rhit_lo_hi = _T_1057 & _T_739; // @[lsu_stbuf.scala 225:121]
  wire  _T_1061 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 226:49]
  wire  _T_1062 = _T_1061 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 226:74]
  wire  _T_1063 = _T_1062 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 226:95]
  wire  _T_1065 = _T_1063 & _T_739; // @[lsu_stbuf.scala 226:121]
  wire  ld_addr_rhit_hi_lo = _T_1065 & dual_stbuf_write_r; // @[lsu_stbuf.scala 226:146]
  wire  _T_1068 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 227:49]
  wire  _T_1069 = _T_1068 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 227:74]
  wire  _T_1070 = _T_1069 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 227:95]
  wire  _T_1072 = _T_1070 & _T_739; // @[lsu_stbuf.scala 227:121]
  wire  ld_addr_rhit_hi_hi = _T_1072 & dual_stbuf_write_r; // @[lsu_stbuf.scala 227:146]
  wire  _T_1074 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 229:79]
  wire  _T_1076 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 229:79]
  wire  _T_1078 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 229:79]
  wire  _T_1080 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 229:79]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_1080,_T_1078,_T_1076,_T_1074}; // @[Cat.scala 29:58]
  wire  _T_1085 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 230:79]
  wire  _T_1087 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 230:79]
  wire  _T_1089 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 230:79]
  wire  _T_1091 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 230:79]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_1091,_T_1089,_T_1087,_T_1085}; // @[Cat.scala 29:58]
  wire  _T_1096 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 231:79]
  wire  _T_1098 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 231:79]
  wire  _T_1100 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 231:79]
  wire  _T_1102 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 231:79]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_1102,_T_1100,_T_1098,_T_1096}; // @[Cat.scala 29:58]
  wire  _T_1107 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 232:79]
  wire  _T_1109 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 232:79]
  wire  _T_1111 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 232:79]
  wire  _T_1113 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 232:79]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_1113,_T_1111,_T_1109,_T_1107}; // @[Cat.scala 29:58]
  wire  _T_1119 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[lsu_stbuf.scala 234:79]
  wire  _T_1122 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[lsu_stbuf.scala 234:79]
  wire  _T_1125 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[lsu_stbuf.scala 234:79]
  wire  _T_1128 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[lsu_stbuf.scala 234:79]
  wire [3:0] ld_byte_rhit_lo = {_T_1128,_T_1125,_T_1122,_T_1119}; // @[Cat.scala 29:58]
  wire  _T_1134 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1137 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1140 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1143 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[lsu_stbuf.scala 235:79]
  wire [3:0] ld_byte_rhit_hi = {_T_1143,_T_1140,_T_1137,_T_1134}; // @[Cat.scala 29:58]
  wire [7:0] _T_1149 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1151 = _T_1149 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 237:53]
  wire [7:0] _T_1154 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1156 = _T_1154 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 237:114]
  wire [7:0] fwdpipe1_lo = _T_1151 | _T_1156; // @[lsu_stbuf.scala 237:80]
  wire [7:0] _T_1159 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1161 = _T_1159 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 238:53]
  wire [7:0] _T_1164 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1166 = _T_1164 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 238:115]
  wire [7:0] fwdpipe2_lo = _T_1161 | _T_1166; // @[lsu_stbuf.scala 238:81]
  wire [7:0] _T_1169 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1171 = _T_1169 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 239:53]
  wire [7:0] _T_1174 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1176 = _T_1174 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 239:116]
  wire [7:0] fwdpipe3_lo = _T_1171 | _T_1176; // @[lsu_stbuf.scala 239:82]
  wire [7:0] _T_1179 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1181 = _T_1179 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 240:53]
  wire [7:0] _T_1184 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1186 = _T_1184 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 240:116]
  wire [7:0] fwdpipe4_lo = _T_1181 | _T_1186; // @[lsu_stbuf.scala 240:82]
  wire [31:0] ld_fwddata_rpipe_lo = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1192 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1194 = _T_1192 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 243:53]
  wire [7:0] _T_1197 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1199 = _T_1197 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 243:114]
  wire [7:0] fwdpipe1_hi = _T_1194 | _T_1199; // @[lsu_stbuf.scala 243:80]
  wire [7:0] _T_1202 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1204 = _T_1202 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 244:53]
  wire [7:0] _T_1207 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1209 = _T_1207 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 244:115]
  wire [7:0] fwdpipe2_hi = _T_1204 | _T_1209; // @[lsu_stbuf.scala 244:81]
  wire [7:0] _T_1212 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1214 = _T_1212 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 245:53]
  wire [7:0] _T_1217 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1219 = _T_1217 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 245:116]
  wire [7:0] fwdpipe3_hi = _T_1214 | _T_1219; // @[lsu_stbuf.scala 245:82]
  wire [7:0] _T_1222 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1224 = _T_1222 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 246:53]
  wire [7:0] _T_1227 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1229 = _T_1227 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 246:116]
  wire [7:0] fwdpipe4_hi = _T_1224 | _T_1229; // @[lsu_stbuf.scala 246:82]
  wire [31:0] ld_fwddata_rpipe_hi = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire  _T_1264 = ld_byte_rhit_hi[0] | stbuf_fwdbyteen_hi_pre_m_0; // @[lsu_stbuf.scala 252:83]
  wire  _T_1266 = ld_byte_rhit_hi[1] | stbuf_fwdbyteen_hi_pre_m_1; // @[lsu_stbuf.scala 252:83]
  wire  _T_1268 = ld_byte_rhit_hi[2] | stbuf_fwdbyteen_hi_pre_m_2; // @[lsu_stbuf.scala 252:83]
  wire  _T_1270 = ld_byte_rhit_hi[3] | stbuf_fwdbyteen_hi_pre_m_3; // @[lsu_stbuf.scala 252:83]
  wire [2:0] _T_1272 = {_T_1270,_T_1268,_T_1266}; // @[Cat.scala 29:58]
  wire  _T_1275 = ld_byte_rhit_lo[0] | stbuf_fwdbyteen_lo_pre_m_0; // @[lsu_stbuf.scala 253:83]
  wire  _T_1277 = ld_byte_rhit_lo[1] | stbuf_fwdbyteen_lo_pre_m_1; // @[lsu_stbuf.scala 253:83]
  wire  _T_1279 = ld_byte_rhit_lo[2] | stbuf_fwdbyteen_lo_pre_m_2; // @[lsu_stbuf.scala 253:83]
  wire  _T_1281 = ld_byte_rhit_lo[3] | stbuf_fwdbyteen_lo_pre_m_3; // @[lsu_stbuf.scala 253:83]
  wire [2:0] _T_1283 = {_T_1281,_T_1279,_T_1277}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[lsu_stbuf.scala 256:30]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[lsu_stbuf.scala 257:30]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[lsu_stbuf.scala 258:30]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[lsu_stbuf.scala 259:30]
  wire [15:0] _T_1297 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1298 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[lsu_stbuf.scala 262:30]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[lsu_stbuf.scala 263:30]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[lsu_stbuf.scala 264:30]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[lsu_stbuf.scala 265:30]
  wire [15:0] _T_1312 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1313 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  rvclkhdr rvclkhdr ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  assign io_stbuf_reqvld_any = _T_699 & _T_701; // @[lsu_stbuf.scala 51:47 lsu_stbuf.scala 175:24]
  assign io_stbuf_reqvld_flushed_any = _T_689[0] & _T_691[0]; // @[lsu_stbuf.scala 52:35 lsu_stbuf.scala 174:31]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_2; // @[lsu_stbuf.scala 53:35 lsu_stbuf.scala 176:22]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_6; // @[lsu_stbuf.scala 54:35 lsu_stbuf.scala 177:22]
  assign io_lsu_stbuf_full_any = _T_752 ? _T_754 : _T_755; // @[lsu_stbuf.scala 55:43 lsu_stbuf.scala 196:26]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[lsu_stbuf.scala 56:43 lsu_stbuf.scala 197:26]
  assign io_ldst_stbuf_reqvld_r = io_lsu_commit_r & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 57:43 lsu_stbuf.scala 128:26]
  assign io_stbuf_fwddata_hi_m = {_T_1313,_T_1312}; // @[lsu_stbuf.scala 58:43 lsu_stbuf.scala 266:25]
  assign io_stbuf_fwddata_lo_m = {_T_1298,_T_1297}; // @[lsu_stbuf.scala 59:43 lsu_stbuf.scala 260:25]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1272,_T_1264}; // @[lsu_stbuf.scala 60:37 lsu_stbuf.scala 252:27]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1283,_T_1275}; // @[lsu_stbuf.scala 61:37 lsu_stbuf.scala 253:27]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_io_en = stbuf_wr_en[0]; // @[lib.scala 355:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_1_io_en = stbuf_wr_en[0]; // @[lib.scala 355:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_2_io_en = stbuf_wr_en[1]; // @[lib.scala 355:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_3_io_en = stbuf_wr_en[1]; // @[lib.scala 355:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_4_io_en = stbuf_wr_en[2]; // @[lib.scala 355:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_5_io_en = stbuf_wr_en[2]; // @[lib.scala 355:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_6_io_en = stbuf_wr_en[3]; // @[lib.scala 355:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_7_io_en = stbuf_wr_en[3]; // @[lib.scala 355:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
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
  WrPtr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stbuf_addr_0 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  _T_588 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_580 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_572 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_564 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_623 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_615 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_607 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_599 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  stbuf_byteen_0 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stbuf_byteen_1 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stbuf_byteen_2 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stbuf_byteen_3 = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  stbuf_data_0 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  stbuf_data_1 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stbuf_data_2 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stbuf_data_3 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  ldst_dual_m = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ldst_dual_r = 1'h0;
  end
  if (reset) begin
    RdPtr = 2'h0;
  end
  if (reset) begin
    WrPtr = 2'h0;
  end
  if (reset) begin
    stbuf_addr_0 = 16'h0;
  end
  if (reset) begin
    _T_588 = 1'h0;
  end
  if (reset) begin
    _T_580 = 1'h0;
  end
  if (reset) begin
    _T_572 = 1'h0;
  end
  if (reset) begin
    _T_564 = 1'h0;
  end
  if (reset) begin
    _T_623 = 1'h0;
  end
  if (reset) begin
    _T_615 = 1'h0;
  end
  if (reset) begin
    _T_607 = 1'h0;
  end
  if (reset) begin
    _T_599 = 1'h0;
  end
  if (reset) begin
    stbuf_addr_1 = 16'h0;
  end
  if (reset) begin
    stbuf_addr_2 = 16'h0;
  end
  if (reset) begin
    stbuf_addr_3 = 16'h0;
  end
  if (reset) begin
    stbuf_byteen_0 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_1 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_2 = 4'h0;
  end
  if (reset) begin
    stbuf_byteen_3 = 4'h0;
  end
  if (reset) begin
    stbuf_data_0 = 32'h0;
  end
  if (reset) begin
    stbuf_data_1 = 32'h0;
  end
  if (reset) begin
    stbuf_data_2 = 32'h0;
  end
  if (reset) begin
    stbuf_data_3 = 32'h0;
  end
  if (reset) begin
    ldst_dual_m = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_r <= 1'h0;
    end else begin
      ldst_dual_r <= ldst_dual_m;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      RdPtr <= 2'h0;
    end else if (_T_212) begin
      RdPtr <= RdPtrPlus1;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 2'h0;
    end else if (WrPtrEn) begin
      if (_T_716) begin
        WrPtr <= WrPtrPlus2;
      end else begin
        WrPtr <= WrPtrPlus1;
      end
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_0 <= 16'h0;
    end else if (sel_lo[0]) begin
      stbuf_addr_0 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_0 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_588 <= 1'h0;
    end else begin
      _T_588 <= _T_584 & _T_67;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_580 <= 1'h0;
    end else begin
      _T_580 <= _T_576 & _T_56;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_572 <= 1'h0;
    end else begin
      _T_572 <= _T_568 & _T_45;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_564 <= 1'h0;
    end else begin
      _T_564 <= _T_560 & _T_34;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_623 <= 1'h0;
    end else begin
      _T_623 <= _T_619 & _T_67;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_615 <= 1'h0;
    end else begin
      _T_615 <= _T_611 & _T_56;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_607 <= 1'h0;
    end else begin
      _T_607 <= _T_603 & _T_45;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_599 <= 1'h0;
    end else begin
      _T_599 <= _T_595 & _T_34;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_1 <= 16'h0;
    end else if (sel_lo[1]) begin
      stbuf_addr_1 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_1 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_2 <= 16'h0;
    end else if (sel_lo[2]) begin
      stbuf_addr_2 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_2 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_addr_3 <= 16'h0;
    end else if (sel_lo[3]) begin
      stbuf_addr_3 <= io_lsu_addr_r[15:0];
    end else begin
      stbuf_addr_3 <= io_end_addr_r[15:0];
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_0 <= 4'h0;
    end else begin
      stbuf_byteen_0 <= _T_629 & _T_633;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else begin
      stbuf_byteen_1 <= _T_638 & _T_642;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else begin
      stbuf_byteen_2 <= _T_647 & _T_651;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else begin
      stbuf_byteen_3 <= _T_656 & _T_660;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else begin
      stbuf_data_0 <= {_T_546,_T_545};
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else begin
      stbuf_data_1 <= {_T_549,_T_548};
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else begin
      stbuf_data_2 <= {_T_552,_T_551};
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else begin
      stbuf_data_3 <= {_T_555,_T_554};
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_m <= 1'h0;
    end else begin
      ldst_dual_m <= io_lsu_addr_d[2] != io_end_addr_d[2];
    end
  end
endmodule
module lsu_ecc(
  input         clock,
  input         reset,
  input         io_lsu_c2_r_clk,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_dma,
  input  [31:0] io_stbuf_data_any,
  input         io_dec_tlu_core_ecc_disable,
  input  [15:0] io_lsu_addr_m,
  input  [15:0] io_end_addr_m,
  input  [31:0] io_dccm_rdata_hi_m,
  input  [31:0] io_dccm_rdata_lo_m,
  input  [6:0]  io_dccm_data_ecc_hi_m,
  input  [6:0]  io_dccm_data_ecc_lo_m,
  input         io_ld_single_ecc_error_r,
  input         io_ld_single_ecc_error_r_ff,
  input         io_lsu_dccm_rden_m,
  input         io_addr_in_dccm_m,
  input         io_dma_dccm_wen,
  input  [31:0] io_dma_dccm_wdata_lo,
  input  [31:0] io_dma_dccm_wdata_hi,
  input         io_scan_mode,
  output [31:0] io_sec_data_hi_r,
  output [31:0] io_sec_data_lo_r,
  output [31:0] io_sec_data_hi_m,
  output [31:0] io_sec_data_lo_m,
  output [31:0] io_sec_data_hi_r_ff,
  output [31:0] io_sec_data_lo_r_ff,
  output [6:0]  io_dma_dccm_wdata_ecc_hi,
  output [6:0]  io_dma_dccm_wdata_ecc_lo,
  output [6:0]  io_stbuf_ecc_any,
  output [6:0]  io_sec_data_ecc_hi_r_ff,
  output [6:0]  io_sec_data_ecc_lo_r_ff,
  output        io_single_ecc_error_hi_r,
  output        io_single_ecc_error_lo_r,
  output        io_lsu_single_ecc_error_r,
  output        io_lsu_double_ecc_error_r,
  output        io_lsu_single_ecc_error_m,
  output        io_lsu_double_ecc_error_m
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 352:23]
  wire  _T_96 = ^io_dccm_rdata_hi_m; // @[lib.scala 177:30]
  wire  _T_97 = ^io_dccm_data_ecc_hi_m; // @[lib.scala 177:44]
  wire  _T_98 = _T_96 ^ _T_97; // @[lib.scala 177:35]
  wire [5:0] _T_106 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[26]}; // @[lib.scala 177:76]
  wire  _T_107 = ^_T_106; // @[lib.scala 177:83]
  wire  _T_108 = io_dccm_data_ecc_hi_m[5] ^ _T_107; // @[lib.scala 177:71]
  wire [6:0] _T_115 = {io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[11]}; // @[lib.scala 177:103]
  wire [14:0] _T_123 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_115}; // @[lib.scala 177:103]
  wire  _T_124 = ^_T_123; // @[lib.scala 177:110]
  wire  _T_125 = io_dccm_data_ecc_hi_m[4] ^ _T_124; // @[lib.scala 177:98]
  wire [6:0] _T_132 = {io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[4]}; // @[lib.scala 177:130]
  wire [14:0] _T_140 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_132}; // @[lib.scala 177:130]
  wire  _T_141 = ^_T_140; // @[lib.scala 177:137]
  wire  _T_142 = io_dccm_data_ecc_hi_m[3] ^ _T_141; // @[lib.scala 177:125]
  wire [8:0] _T_151 = {io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[1]}; // @[lib.scala 177:157]
  wire [17:0] _T_160 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_151}; // @[lib.scala 177:157]
  wire  _T_161 = ^_T_160; // @[lib.scala 177:164]
  wire  _T_162 = io_dccm_data_ecc_hi_m[2] ^ _T_161; // @[lib.scala 177:152]
  wire [8:0] _T_171 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[0]}; // @[lib.scala 177:184]
  wire [17:0] _T_180 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_171}; // @[lib.scala 177:184]
  wire  _T_181 = ^_T_180; // @[lib.scala 177:191]
  wire  _T_182 = io_dccm_data_ecc_hi_m[1] ^ _T_181; // @[lib.scala 177:179]
  wire [8:0] _T_191 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[11],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[4],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[1],io_dccm_rdata_hi_m[0]}; // @[lib.scala 177:211]
  wire [17:0] _T_200 = {io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[26],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[15],_T_191}; // @[lib.scala 177:211]
  wire  _T_201 = ^_T_200; // @[lib.scala 177:218]
  wire  _T_202 = io_dccm_data_ecc_hi_m[0] ^ _T_201; // @[lib.scala 177:206]
  wire [6:0] _T_208 = {_T_98,_T_108,_T_125,_T_142,_T_162,_T_182,_T_202}; // @[Cat.scala 29:58]
  wire  _T_209 = _T_208 != 7'h0; // @[lib.scala 178:44]
  wire  _T_1131 = ~io_dec_tlu_core_ecc_disable; // @[lsu_ecc.scala 107:73]
  wire  _T_1138 = io_lsu_pkt_m_bits_load | io_lsu_pkt_m_bits_store; // @[lsu_ecc.scala 125:65]
  wire  _T_1139 = io_lsu_pkt_m_valid & _T_1138; // @[lsu_ecc.scala 125:39]
  wire  _T_1140 = _T_1139 & io_addr_in_dccm_m; // @[lsu_ecc.scala 125:92]
  wire  is_ldst_m = _T_1140 & io_lsu_dccm_rden_m; // @[lsu_ecc.scala 125:112]
  wire  ldst_dual_m = io_lsu_addr_m[2] != io_end_addr_m[2]; // @[lsu_ecc.scala 124:39]
  wire  _T_1144 = ldst_dual_m | io_lsu_pkt_m_bits_dma; // @[lsu_ecc.scala 127:48]
  wire  _T_1145 = is_ldst_m & _T_1144; // @[lsu_ecc.scala 127:33]
  wire  is_ldst_hi_m = _T_1145 & _T_1131; // @[lsu_ecc.scala 127:73]
  wire  _T_210 = is_ldst_hi_m & _T_209; // @[lib.scala 178:32]
  wire  single_ecc_error_hi_any = _T_210 & _T_208[6]; // @[lib.scala 178:53]
  wire  _T_215 = ~_T_208[6]; // @[lib.scala 179:55]
  wire  double_ecc_error_hi_any = _T_210 & _T_215; // @[lib.scala 179:53]
  wire  _T_218 = _T_208[5:0] == 6'h1; // @[lib.scala 183:41]
  wire  _T_220 = _T_208[5:0] == 6'h2; // @[lib.scala 183:41]
  wire  _T_222 = _T_208[5:0] == 6'h3; // @[lib.scala 183:41]
  wire  _T_224 = _T_208[5:0] == 6'h4; // @[lib.scala 183:41]
  wire  _T_226 = _T_208[5:0] == 6'h5; // @[lib.scala 183:41]
  wire  _T_228 = _T_208[5:0] == 6'h6; // @[lib.scala 183:41]
  wire  _T_230 = _T_208[5:0] == 6'h7; // @[lib.scala 183:41]
  wire  _T_232 = _T_208[5:0] == 6'h8; // @[lib.scala 183:41]
  wire  _T_234 = _T_208[5:0] == 6'h9; // @[lib.scala 183:41]
  wire  _T_236 = _T_208[5:0] == 6'ha; // @[lib.scala 183:41]
  wire  _T_238 = _T_208[5:0] == 6'hb; // @[lib.scala 183:41]
  wire  _T_240 = _T_208[5:0] == 6'hc; // @[lib.scala 183:41]
  wire  _T_242 = _T_208[5:0] == 6'hd; // @[lib.scala 183:41]
  wire  _T_244 = _T_208[5:0] == 6'he; // @[lib.scala 183:41]
  wire  _T_246 = _T_208[5:0] == 6'hf; // @[lib.scala 183:41]
  wire  _T_248 = _T_208[5:0] == 6'h10; // @[lib.scala 183:41]
  wire  _T_250 = _T_208[5:0] == 6'h11; // @[lib.scala 183:41]
  wire  _T_252 = _T_208[5:0] == 6'h12; // @[lib.scala 183:41]
  wire  _T_254 = _T_208[5:0] == 6'h13; // @[lib.scala 183:41]
  wire  _T_256 = _T_208[5:0] == 6'h14; // @[lib.scala 183:41]
  wire  _T_258 = _T_208[5:0] == 6'h15; // @[lib.scala 183:41]
  wire  _T_260 = _T_208[5:0] == 6'h16; // @[lib.scala 183:41]
  wire  _T_262 = _T_208[5:0] == 6'h17; // @[lib.scala 183:41]
  wire  _T_264 = _T_208[5:0] == 6'h18; // @[lib.scala 183:41]
  wire  _T_266 = _T_208[5:0] == 6'h19; // @[lib.scala 183:41]
  wire  _T_268 = _T_208[5:0] == 6'h1a; // @[lib.scala 183:41]
  wire  _T_270 = _T_208[5:0] == 6'h1b; // @[lib.scala 183:41]
  wire  _T_272 = _T_208[5:0] == 6'h1c; // @[lib.scala 183:41]
  wire  _T_274 = _T_208[5:0] == 6'h1d; // @[lib.scala 183:41]
  wire  _T_276 = _T_208[5:0] == 6'h1e; // @[lib.scala 183:41]
  wire  _T_278 = _T_208[5:0] == 6'h1f; // @[lib.scala 183:41]
  wire  _T_280 = _T_208[5:0] == 6'h20; // @[lib.scala 183:41]
  wire  _T_282 = _T_208[5:0] == 6'h21; // @[lib.scala 183:41]
  wire  _T_284 = _T_208[5:0] == 6'h22; // @[lib.scala 183:41]
  wire  _T_286 = _T_208[5:0] == 6'h23; // @[lib.scala 183:41]
  wire  _T_288 = _T_208[5:0] == 6'h24; // @[lib.scala 183:41]
  wire  _T_290 = _T_208[5:0] == 6'h25; // @[lib.scala 183:41]
  wire  _T_292 = _T_208[5:0] == 6'h26; // @[lib.scala 183:41]
  wire  _T_294 = _T_208[5:0] == 6'h27; // @[lib.scala 183:41]
  wire [7:0] _T_309 = {io_dccm_data_ecc_hi_m[3],io_dccm_rdata_hi_m[3:1],io_dccm_data_ecc_hi_m[2],io_dccm_rdata_hi_m[0],io_dccm_data_ecc_hi_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_315 = {io_dccm_data_ecc_hi_m[6],io_dccm_rdata_hi_m[31:26],io_dccm_data_ecc_hi_m[5],io_dccm_rdata_hi_m[25:11],io_dccm_data_ecc_hi_m[4],io_dccm_rdata_hi_m[10:4],_T_309}; // @[Cat.scala 29:58]
  wire [9:0] _T_333 = {_T_254,_T_252,_T_250,_T_248,_T_246,_T_244,_T_242,_T_240,_T_238,_T_236}; // @[lib.scala 186:69]
  wire [18:0] _T_334 = {_T_333,_T_234,_T_232,_T_230,_T_228,_T_226,_T_224,_T_222,_T_220,_T_218}; // @[lib.scala 186:69]
  wire [9:0] _T_343 = {_T_274,_T_272,_T_270,_T_268,_T_266,_T_264,_T_262,_T_260,_T_258,_T_256}; // @[lib.scala 186:69]
  wire [9:0] _T_352 = {_T_294,_T_292,_T_290,_T_288,_T_286,_T_284,_T_282,_T_280,_T_278,_T_276}; // @[lib.scala 186:69]
  wire [38:0] _T_354 = {_T_352,_T_343,_T_334}; // @[lib.scala 186:69]
  wire [38:0] _T_355 = _T_354 ^ _T_315; // @[lib.scala 186:76]
  wire [38:0] _T_356 = single_ecc_error_hi_any ? _T_355 : _T_315; // @[lib.scala 186:31]
  wire [3:0] _T_362 = {_T_356[6:4],_T_356[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_364 = {_T_356[37:32],_T_356[30:16],_T_356[14:8]}; // @[Cat.scala 29:58]
  wire  _T_474 = ^io_dccm_rdata_lo_m; // @[lib.scala 177:30]
  wire  _T_475 = ^io_dccm_data_ecc_lo_m; // @[lib.scala 177:44]
  wire  _T_476 = _T_474 ^ _T_475; // @[lib.scala 177:35]
  wire [5:0] _T_484 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[26]}; // @[lib.scala 177:76]
  wire  _T_485 = ^_T_484; // @[lib.scala 177:83]
  wire  _T_486 = io_dccm_data_ecc_lo_m[5] ^ _T_485; // @[lib.scala 177:71]
  wire [6:0] _T_493 = {io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[11]}; // @[lib.scala 177:103]
  wire [14:0] _T_501 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_493}; // @[lib.scala 177:103]
  wire  _T_502 = ^_T_501; // @[lib.scala 177:110]
  wire  _T_503 = io_dccm_data_ecc_lo_m[4] ^ _T_502; // @[lib.scala 177:98]
  wire [6:0] _T_510 = {io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[4]}; // @[lib.scala 177:130]
  wire [14:0] _T_518 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_510}; // @[lib.scala 177:130]
  wire  _T_519 = ^_T_518; // @[lib.scala 177:137]
  wire  _T_520 = io_dccm_data_ecc_lo_m[3] ^ _T_519; // @[lib.scala 177:125]
  wire [8:0] _T_529 = {io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[1]}; // @[lib.scala 177:157]
  wire [17:0] _T_538 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_529}; // @[lib.scala 177:157]
  wire  _T_539 = ^_T_538; // @[lib.scala 177:164]
  wire  _T_540 = io_dccm_data_ecc_lo_m[2] ^ _T_539; // @[lib.scala 177:152]
  wire [8:0] _T_549 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[0]}; // @[lib.scala 177:184]
  wire [17:0] _T_558 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_549}; // @[lib.scala 177:184]
  wire  _T_559 = ^_T_558; // @[lib.scala 177:191]
  wire  _T_560 = io_dccm_data_ecc_lo_m[1] ^ _T_559; // @[lib.scala 177:179]
  wire [8:0] _T_569 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[11],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[4],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[1],io_dccm_rdata_lo_m[0]}; // @[lib.scala 177:211]
  wire [17:0] _T_578 = {io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[26],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[15],_T_569}; // @[lib.scala 177:211]
  wire  _T_579 = ^_T_578; // @[lib.scala 177:218]
  wire  _T_580 = io_dccm_data_ecc_lo_m[0] ^ _T_579; // @[lib.scala 177:206]
  wire [6:0] _T_586 = {_T_476,_T_486,_T_503,_T_520,_T_540,_T_560,_T_580}; // @[Cat.scala 29:58]
  wire  _T_587 = _T_586 != 7'h0; // @[lib.scala 178:44]
  wire  is_ldst_lo_m = is_ldst_m & _T_1131; // @[lsu_ecc.scala 126:33]
  wire  _T_588 = is_ldst_lo_m & _T_587; // @[lib.scala 178:32]
  wire  single_ecc_error_lo_any = _T_588 & _T_586[6]; // @[lib.scala 178:53]
  wire  _T_593 = ~_T_586[6]; // @[lib.scala 179:55]
  wire  double_ecc_error_lo_any = _T_588 & _T_593; // @[lib.scala 179:53]
  wire  _T_596 = _T_586[5:0] == 6'h1; // @[lib.scala 183:41]
  wire  _T_598 = _T_586[5:0] == 6'h2; // @[lib.scala 183:41]
  wire  _T_600 = _T_586[5:0] == 6'h3; // @[lib.scala 183:41]
  wire  _T_602 = _T_586[5:0] == 6'h4; // @[lib.scala 183:41]
  wire  _T_604 = _T_586[5:0] == 6'h5; // @[lib.scala 183:41]
  wire  _T_606 = _T_586[5:0] == 6'h6; // @[lib.scala 183:41]
  wire  _T_608 = _T_586[5:0] == 6'h7; // @[lib.scala 183:41]
  wire  _T_610 = _T_586[5:0] == 6'h8; // @[lib.scala 183:41]
  wire  _T_612 = _T_586[5:0] == 6'h9; // @[lib.scala 183:41]
  wire  _T_614 = _T_586[5:0] == 6'ha; // @[lib.scala 183:41]
  wire  _T_616 = _T_586[5:0] == 6'hb; // @[lib.scala 183:41]
  wire  _T_618 = _T_586[5:0] == 6'hc; // @[lib.scala 183:41]
  wire  _T_620 = _T_586[5:0] == 6'hd; // @[lib.scala 183:41]
  wire  _T_622 = _T_586[5:0] == 6'he; // @[lib.scala 183:41]
  wire  _T_624 = _T_586[5:0] == 6'hf; // @[lib.scala 183:41]
  wire  _T_626 = _T_586[5:0] == 6'h10; // @[lib.scala 183:41]
  wire  _T_628 = _T_586[5:0] == 6'h11; // @[lib.scala 183:41]
  wire  _T_630 = _T_586[5:0] == 6'h12; // @[lib.scala 183:41]
  wire  _T_632 = _T_586[5:0] == 6'h13; // @[lib.scala 183:41]
  wire  _T_634 = _T_586[5:0] == 6'h14; // @[lib.scala 183:41]
  wire  _T_636 = _T_586[5:0] == 6'h15; // @[lib.scala 183:41]
  wire  _T_638 = _T_586[5:0] == 6'h16; // @[lib.scala 183:41]
  wire  _T_640 = _T_586[5:0] == 6'h17; // @[lib.scala 183:41]
  wire  _T_642 = _T_586[5:0] == 6'h18; // @[lib.scala 183:41]
  wire  _T_644 = _T_586[5:0] == 6'h19; // @[lib.scala 183:41]
  wire  _T_646 = _T_586[5:0] == 6'h1a; // @[lib.scala 183:41]
  wire  _T_648 = _T_586[5:0] == 6'h1b; // @[lib.scala 183:41]
  wire  _T_650 = _T_586[5:0] == 6'h1c; // @[lib.scala 183:41]
  wire  _T_652 = _T_586[5:0] == 6'h1d; // @[lib.scala 183:41]
  wire  _T_654 = _T_586[5:0] == 6'h1e; // @[lib.scala 183:41]
  wire  _T_656 = _T_586[5:0] == 6'h1f; // @[lib.scala 183:41]
  wire  _T_658 = _T_586[5:0] == 6'h20; // @[lib.scala 183:41]
  wire  _T_660 = _T_586[5:0] == 6'h21; // @[lib.scala 183:41]
  wire  _T_662 = _T_586[5:0] == 6'h22; // @[lib.scala 183:41]
  wire  _T_664 = _T_586[5:0] == 6'h23; // @[lib.scala 183:41]
  wire  _T_666 = _T_586[5:0] == 6'h24; // @[lib.scala 183:41]
  wire  _T_668 = _T_586[5:0] == 6'h25; // @[lib.scala 183:41]
  wire  _T_670 = _T_586[5:0] == 6'h26; // @[lib.scala 183:41]
  wire  _T_672 = _T_586[5:0] == 6'h27; // @[lib.scala 183:41]
  wire [7:0] _T_687 = {io_dccm_data_ecc_lo_m[3],io_dccm_rdata_lo_m[3:1],io_dccm_data_ecc_lo_m[2],io_dccm_rdata_lo_m[0],io_dccm_data_ecc_lo_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_693 = {io_dccm_data_ecc_lo_m[6],io_dccm_rdata_lo_m[31:26],io_dccm_data_ecc_lo_m[5],io_dccm_rdata_lo_m[25:11],io_dccm_data_ecc_lo_m[4],io_dccm_rdata_lo_m[10:4],_T_687}; // @[Cat.scala 29:58]
  wire [9:0] _T_711 = {_T_632,_T_630,_T_628,_T_626,_T_624,_T_622,_T_620,_T_618,_T_616,_T_614}; // @[lib.scala 186:69]
  wire [18:0] _T_712 = {_T_711,_T_612,_T_610,_T_608,_T_606,_T_604,_T_602,_T_600,_T_598,_T_596}; // @[lib.scala 186:69]
  wire [9:0] _T_721 = {_T_652,_T_650,_T_648,_T_646,_T_644,_T_642,_T_640,_T_638,_T_636,_T_634}; // @[lib.scala 186:69]
  wire [9:0] _T_730 = {_T_672,_T_670,_T_668,_T_666,_T_664,_T_662,_T_660,_T_658,_T_656,_T_654}; // @[lib.scala 186:69]
  wire [38:0] _T_732 = {_T_730,_T_721,_T_712}; // @[lib.scala 186:69]
  wire [38:0] _T_733 = _T_732 ^ _T_693; // @[lib.scala 186:76]
  wire [38:0] _T_734 = single_ecc_error_lo_any ? _T_733 : _T_693; // @[lib.scala 186:31]
  wire [3:0] _T_740 = {_T_734[6:4],_T_734[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_742 = {_T_734[37:32],_T_734[30:16],_T_734[14:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1158 = io_dma_dccm_wen ? io_dma_dccm_wdata_lo : io_stbuf_data_any; // @[lsu_ecc.scala 149:87]
  wire [31:0] dccm_wdata_lo_any = io_ld_single_ecc_error_r_ff ? io_sec_data_lo_r_ff : _T_1158; // @[lsu_ecc.scala 149:27]
  wire  _T_774 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[1]; // @[lib.scala 103:74]
  wire  _T_775 = _T_774 ^ dccm_wdata_lo_any[3]; // @[lib.scala 103:74]
  wire  _T_776 = _T_775 ^ dccm_wdata_lo_any[4]; // @[lib.scala 103:74]
  wire  _T_777 = _T_776 ^ dccm_wdata_lo_any[6]; // @[lib.scala 103:74]
  wire  _T_778 = _T_777 ^ dccm_wdata_lo_any[8]; // @[lib.scala 103:74]
  wire  _T_779 = _T_778 ^ dccm_wdata_lo_any[10]; // @[lib.scala 103:74]
  wire  _T_780 = _T_779 ^ dccm_wdata_lo_any[11]; // @[lib.scala 103:74]
  wire  _T_781 = _T_780 ^ dccm_wdata_lo_any[13]; // @[lib.scala 103:74]
  wire  _T_782 = _T_781 ^ dccm_wdata_lo_any[15]; // @[lib.scala 103:74]
  wire  _T_783 = _T_782 ^ dccm_wdata_lo_any[17]; // @[lib.scala 103:74]
  wire  _T_784 = _T_783 ^ dccm_wdata_lo_any[19]; // @[lib.scala 103:74]
  wire  _T_785 = _T_784 ^ dccm_wdata_lo_any[21]; // @[lib.scala 103:74]
  wire  _T_786 = _T_785 ^ dccm_wdata_lo_any[23]; // @[lib.scala 103:74]
  wire  _T_787 = _T_786 ^ dccm_wdata_lo_any[25]; // @[lib.scala 103:74]
  wire  _T_788 = _T_787 ^ dccm_wdata_lo_any[26]; // @[lib.scala 103:74]
  wire  _T_789 = _T_788 ^ dccm_wdata_lo_any[28]; // @[lib.scala 103:74]
  wire  _T_790 = _T_789 ^ dccm_wdata_lo_any[30]; // @[lib.scala 103:74]
  wire  _T_809 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[2]; // @[lib.scala 103:74]
  wire  _T_810 = _T_809 ^ dccm_wdata_lo_any[3]; // @[lib.scala 103:74]
  wire  _T_811 = _T_810 ^ dccm_wdata_lo_any[5]; // @[lib.scala 103:74]
  wire  _T_812 = _T_811 ^ dccm_wdata_lo_any[6]; // @[lib.scala 103:74]
  wire  _T_813 = _T_812 ^ dccm_wdata_lo_any[9]; // @[lib.scala 103:74]
  wire  _T_814 = _T_813 ^ dccm_wdata_lo_any[10]; // @[lib.scala 103:74]
  wire  _T_815 = _T_814 ^ dccm_wdata_lo_any[12]; // @[lib.scala 103:74]
  wire  _T_816 = _T_815 ^ dccm_wdata_lo_any[13]; // @[lib.scala 103:74]
  wire  _T_817 = _T_816 ^ dccm_wdata_lo_any[16]; // @[lib.scala 103:74]
  wire  _T_818 = _T_817 ^ dccm_wdata_lo_any[17]; // @[lib.scala 103:74]
  wire  _T_819 = _T_818 ^ dccm_wdata_lo_any[20]; // @[lib.scala 103:74]
  wire  _T_820 = _T_819 ^ dccm_wdata_lo_any[21]; // @[lib.scala 103:74]
  wire  _T_821 = _T_820 ^ dccm_wdata_lo_any[24]; // @[lib.scala 103:74]
  wire  _T_822 = _T_821 ^ dccm_wdata_lo_any[25]; // @[lib.scala 103:74]
  wire  _T_823 = _T_822 ^ dccm_wdata_lo_any[27]; // @[lib.scala 103:74]
  wire  _T_824 = _T_823 ^ dccm_wdata_lo_any[28]; // @[lib.scala 103:74]
  wire  _T_825 = _T_824 ^ dccm_wdata_lo_any[31]; // @[lib.scala 103:74]
  wire  _T_844 = dccm_wdata_lo_any[1] ^ dccm_wdata_lo_any[2]; // @[lib.scala 103:74]
  wire  _T_845 = _T_844 ^ dccm_wdata_lo_any[3]; // @[lib.scala 103:74]
  wire  _T_846 = _T_845 ^ dccm_wdata_lo_any[7]; // @[lib.scala 103:74]
  wire  _T_847 = _T_846 ^ dccm_wdata_lo_any[8]; // @[lib.scala 103:74]
  wire  _T_848 = _T_847 ^ dccm_wdata_lo_any[9]; // @[lib.scala 103:74]
  wire  _T_849 = _T_848 ^ dccm_wdata_lo_any[10]; // @[lib.scala 103:74]
  wire  _T_850 = _T_849 ^ dccm_wdata_lo_any[14]; // @[lib.scala 103:74]
  wire  _T_851 = _T_850 ^ dccm_wdata_lo_any[15]; // @[lib.scala 103:74]
  wire  _T_852 = _T_851 ^ dccm_wdata_lo_any[16]; // @[lib.scala 103:74]
  wire  _T_853 = _T_852 ^ dccm_wdata_lo_any[17]; // @[lib.scala 103:74]
  wire  _T_854 = _T_853 ^ dccm_wdata_lo_any[22]; // @[lib.scala 103:74]
  wire  _T_855 = _T_854 ^ dccm_wdata_lo_any[23]; // @[lib.scala 103:74]
  wire  _T_856 = _T_855 ^ dccm_wdata_lo_any[24]; // @[lib.scala 103:74]
  wire  _T_857 = _T_856 ^ dccm_wdata_lo_any[25]; // @[lib.scala 103:74]
  wire  _T_858 = _T_857 ^ dccm_wdata_lo_any[29]; // @[lib.scala 103:74]
  wire  _T_859 = _T_858 ^ dccm_wdata_lo_any[30]; // @[lib.scala 103:74]
  wire  _T_860 = _T_859 ^ dccm_wdata_lo_any[31]; // @[lib.scala 103:74]
  wire  _T_876 = dccm_wdata_lo_any[4] ^ dccm_wdata_lo_any[5]; // @[lib.scala 103:74]
  wire  _T_877 = _T_876 ^ dccm_wdata_lo_any[6]; // @[lib.scala 103:74]
  wire  _T_878 = _T_877 ^ dccm_wdata_lo_any[7]; // @[lib.scala 103:74]
  wire  _T_879 = _T_878 ^ dccm_wdata_lo_any[8]; // @[lib.scala 103:74]
  wire  _T_880 = _T_879 ^ dccm_wdata_lo_any[9]; // @[lib.scala 103:74]
  wire  _T_881 = _T_880 ^ dccm_wdata_lo_any[10]; // @[lib.scala 103:74]
  wire  _T_882 = _T_881 ^ dccm_wdata_lo_any[18]; // @[lib.scala 103:74]
  wire  _T_883 = _T_882 ^ dccm_wdata_lo_any[19]; // @[lib.scala 103:74]
  wire  _T_884 = _T_883 ^ dccm_wdata_lo_any[20]; // @[lib.scala 103:74]
  wire  _T_885 = _T_884 ^ dccm_wdata_lo_any[21]; // @[lib.scala 103:74]
  wire  _T_886 = _T_885 ^ dccm_wdata_lo_any[22]; // @[lib.scala 103:74]
  wire  _T_887 = _T_886 ^ dccm_wdata_lo_any[23]; // @[lib.scala 103:74]
  wire  _T_888 = _T_887 ^ dccm_wdata_lo_any[24]; // @[lib.scala 103:74]
  wire  _T_889 = _T_888 ^ dccm_wdata_lo_any[25]; // @[lib.scala 103:74]
  wire  _T_905 = dccm_wdata_lo_any[11] ^ dccm_wdata_lo_any[12]; // @[lib.scala 103:74]
  wire  _T_906 = _T_905 ^ dccm_wdata_lo_any[13]; // @[lib.scala 103:74]
  wire  _T_907 = _T_906 ^ dccm_wdata_lo_any[14]; // @[lib.scala 103:74]
  wire  _T_908 = _T_907 ^ dccm_wdata_lo_any[15]; // @[lib.scala 103:74]
  wire  _T_909 = _T_908 ^ dccm_wdata_lo_any[16]; // @[lib.scala 103:74]
  wire  _T_910 = _T_909 ^ dccm_wdata_lo_any[17]; // @[lib.scala 103:74]
  wire  _T_911 = _T_910 ^ dccm_wdata_lo_any[18]; // @[lib.scala 103:74]
  wire  _T_912 = _T_911 ^ dccm_wdata_lo_any[19]; // @[lib.scala 103:74]
  wire  _T_913 = _T_912 ^ dccm_wdata_lo_any[20]; // @[lib.scala 103:74]
  wire  _T_914 = _T_913 ^ dccm_wdata_lo_any[21]; // @[lib.scala 103:74]
  wire  _T_915 = _T_914 ^ dccm_wdata_lo_any[22]; // @[lib.scala 103:74]
  wire  _T_916 = _T_915 ^ dccm_wdata_lo_any[23]; // @[lib.scala 103:74]
  wire  _T_917 = _T_916 ^ dccm_wdata_lo_any[24]; // @[lib.scala 103:74]
  wire  _T_918 = _T_917 ^ dccm_wdata_lo_any[25]; // @[lib.scala 103:74]
  wire  _T_925 = dccm_wdata_lo_any[26] ^ dccm_wdata_lo_any[27]; // @[lib.scala 103:74]
  wire  _T_926 = _T_925 ^ dccm_wdata_lo_any[28]; // @[lib.scala 103:74]
  wire  _T_927 = _T_926 ^ dccm_wdata_lo_any[29]; // @[lib.scala 103:74]
  wire  _T_928 = _T_927 ^ dccm_wdata_lo_any[30]; // @[lib.scala 103:74]
  wire  _T_929 = _T_928 ^ dccm_wdata_lo_any[31]; // @[lib.scala 103:74]
  wire [5:0] _T_934 = {_T_929,_T_918,_T_889,_T_860,_T_825,_T_790}; // @[Cat.scala 29:58]
  wire  _T_935 = ^dccm_wdata_lo_any; // @[lib.scala 111:13]
  wire  _T_936 = ^_T_934; // @[lib.scala 111:23]
  wire  _T_937 = _T_935 ^ _T_936; // @[lib.scala 111:18]
  wire [31:0] _T_1162 = io_dma_dccm_wen ? io_dma_dccm_wdata_hi : io_stbuf_data_any; // @[lsu_ecc.scala 150:87]
  wire [31:0] dccm_wdata_hi_any = io_ld_single_ecc_error_r_ff ? io_sec_data_hi_r_ff : _T_1162; // @[lsu_ecc.scala 150:27]
  wire  _T_956 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[1]; // @[lib.scala 103:74]
  wire  _T_957 = _T_956 ^ dccm_wdata_hi_any[3]; // @[lib.scala 103:74]
  wire  _T_958 = _T_957 ^ dccm_wdata_hi_any[4]; // @[lib.scala 103:74]
  wire  _T_959 = _T_958 ^ dccm_wdata_hi_any[6]; // @[lib.scala 103:74]
  wire  _T_960 = _T_959 ^ dccm_wdata_hi_any[8]; // @[lib.scala 103:74]
  wire  _T_961 = _T_960 ^ dccm_wdata_hi_any[10]; // @[lib.scala 103:74]
  wire  _T_962 = _T_961 ^ dccm_wdata_hi_any[11]; // @[lib.scala 103:74]
  wire  _T_963 = _T_962 ^ dccm_wdata_hi_any[13]; // @[lib.scala 103:74]
  wire  _T_964 = _T_963 ^ dccm_wdata_hi_any[15]; // @[lib.scala 103:74]
  wire  _T_965 = _T_964 ^ dccm_wdata_hi_any[17]; // @[lib.scala 103:74]
  wire  _T_966 = _T_965 ^ dccm_wdata_hi_any[19]; // @[lib.scala 103:74]
  wire  _T_967 = _T_966 ^ dccm_wdata_hi_any[21]; // @[lib.scala 103:74]
  wire  _T_968 = _T_967 ^ dccm_wdata_hi_any[23]; // @[lib.scala 103:74]
  wire  _T_969 = _T_968 ^ dccm_wdata_hi_any[25]; // @[lib.scala 103:74]
  wire  _T_970 = _T_969 ^ dccm_wdata_hi_any[26]; // @[lib.scala 103:74]
  wire  _T_971 = _T_970 ^ dccm_wdata_hi_any[28]; // @[lib.scala 103:74]
  wire  _T_972 = _T_971 ^ dccm_wdata_hi_any[30]; // @[lib.scala 103:74]
  wire  _T_991 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[2]; // @[lib.scala 103:74]
  wire  _T_992 = _T_991 ^ dccm_wdata_hi_any[3]; // @[lib.scala 103:74]
  wire  _T_993 = _T_992 ^ dccm_wdata_hi_any[5]; // @[lib.scala 103:74]
  wire  _T_994 = _T_993 ^ dccm_wdata_hi_any[6]; // @[lib.scala 103:74]
  wire  _T_995 = _T_994 ^ dccm_wdata_hi_any[9]; // @[lib.scala 103:74]
  wire  _T_996 = _T_995 ^ dccm_wdata_hi_any[10]; // @[lib.scala 103:74]
  wire  _T_997 = _T_996 ^ dccm_wdata_hi_any[12]; // @[lib.scala 103:74]
  wire  _T_998 = _T_997 ^ dccm_wdata_hi_any[13]; // @[lib.scala 103:74]
  wire  _T_999 = _T_998 ^ dccm_wdata_hi_any[16]; // @[lib.scala 103:74]
  wire  _T_1000 = _T_999 ^ dccm_wdata_hi_any[17]; // @[lib.scala 103:74]
  wire  _T_1001 = _T_1000 ^ dccm_wdata_hi_any[20]; // @[lib.scala 103:74]
  wire  _T_1002 = _T_1001 ^ dccm_wdata_hi_any[21]; // @[lib.scala 103:74]
  wire  _T_1003 = _T_1002 ^ dccm_wdata_hi_any[24]; // @[lib.scala 103:74]
  wire  _T_1004 = _T_1003 ^ dccm_wdata_hi_any[25]; // @[lib.scala 103:74]
  wire  _T_1005 = _T_1004 ^ dccm_wdata_hi_any[27]; // @[lib.scala 103:74]
  wire  _T_1006 = _T_1005 ^ dccm_wdata_hi_any[28]; // @[lib.scala 103:74]
  wire  _T_1007 = _T_1006 ^ dccm_wdata_hi_any[31]; // @[lib.scala 103:74]
  wire  _T_1026 = dccm_wdata_hi_any[1] ^ dccm_wdata_hi_any[2]; // @[lib.scala 103:74]
  wire  _T_1027 = _T_1026 ^ dccm_wdata_hi_any[3]; // @[lib.scala 103:74]
  wire  _T_1028 = _T_1027 ^ dccm_wdata_hi_any[7]; // @[lib.scala 103:74]
  wire  _T_1029 = _T_1028 ^ dccm_wdata_hi_any[8]; // @[lib.scala 103:74]
  wire  _T_1030 = _T_1029 ^ dccm_wdata_hi_any[9]; // @[lib.scala 103:74]
  wire  _T_1031 = _T_1030 ^ dccm_wdata_hi_any[10]; // @[lib.scala 103:74]
  wire  _T_1032 = _T_1031 ^ dccm_wdata_hi_any[14]; // @[lib.scala 103:74]
  wire  _T_1033 = _T_1032 ^ dccm_wdata_hi_any[15]; // @[lib.scala 103:74]
  wire  _T_1034 = _T_1033 ^ dccm_wdata_hi_any[16]; // @[lib.scala 103:74]
  wire  _T_1035 = _T_1034 ^ dccm_wdata_hi_any[17]; // @[lib.scala 103:74]
  wire  _T_1036 = _T_1035 ^ dccm_wdata_hi_any[22]; // @[lib.scala 103:74]
  wire  _T_1037 = _T_1036 ^ dccm_wdata_hi_any[23]; // @[lib.scala 103:74]
  wire  _T_1038 = _T_1037 ^ dccm_wdata_hi_any[24]; // @[lib.scala 103:74]
  wire  _T_1039 = _T_1038 ^ dccm_wdata_hi_any[25]; // @[lib.scala 103:74]
  wire  _T_1040 = _T_1039 ^ dccm_wdata_hi_any[29]; // @[lib.scala 103:74]
  wire  _T_1041 = _T_1040 ^ dccm_wdata_hi_any[30]; // @[lib.scala 103:74]
  wire  _T_1042 = _T_1041 ^ dccm_wdata_hi_any[31]; // @[lib.scala 103:74]
  wire  _T_1058 = dccm_wdata_hi_any[4] ^ dccm_wdata_hi_any[5]; // @[lib.scala 103:74]
  wire  _T_1059 = _T_1058 ^ dccm_wdata_hi_any[6]; // @[lib.scala 103:74]
  wire  _T_1060 = _T_1059 ^ dccm_wdata_hi_any[7]; // @[lib.scala 103:74]
  wire  _T_1061 = _T_1060 ^ dccm_wdata_hi_any[8]; // @[lib.scala 103:74]
  wire  _T_1062 = _T_1061 ^ dccm_wdata_hi_any[9]; // @[lib.scala 103:74]
  wire  _T_1063 = _T_1062 ^ dccm_wdata_hi_any[10]; // @[lib.scala 103:74]
  wire  _T_1064 = _T_1063 ^ dccm_wdata_hi_any[18]; // @[lib.scala 103:74]
  wire  _T_1065 = _T_1064 ^ dccm_wdata_hi_any[19]; // @[lib.scala 103:74]
  wire  _T_1066 = _T_1065 ^ dccm_wdata_hi_any[20]; // @[lib.scala 103:74]
  wire  _T_1067 = _T_1066 ^ dccm_wdata_hi_any[21]; // @[lib.scala 103:74]
  wire  _T_1068 = _T_1067 ^ dccm_wdata_hi_any[22]; // @[lib.scala 103:74]
  wire  _T_1069 = _T_1068 ^ dccm_wdata_hi_any[23]; // @[lib.scala 103:74]
  wire  _T_1070 = _T_1069 ^ dccm_wdata_hi_any[24]; // @[lib.scala 103:74]
  wire  _T_1071 = _T_1070 ^ dccm_wdata_hi_any[25]; // @[lib.scala 103:74]
  wire  _T_1087 = dccm_wdata_hi_any[11] ^ dccm_wdata_hi_any[12]; // @[lib.scala 103:74]
  wire  _T_1088 = _T_1087 ^ dccm_wdata_hi_any[13]; // @[lib.scala 103:74]
  wire  _T_1089 = _T_1088 ^ dccm_wdata_hi_any[14]; // @[lib.scala 103:74]
  wire  _T_1090 = _T_1089 ^ dccm_wdata_hi_any[15]; // @[lib.scala 103:74]
  wire  _T_1091 = _T_1090 ^ dccm_wdata_hi_any[16]; // @[lib.scala 103:74]
  wire  _T_1092 = _T_1091 ^ dccm_wdata_hi_any[17]; // @[lib.scala 103:74]
  wire  _T_1093 = _T_1092 ^ dccm_wdata_hi_any[18]; // @[lib.scala 103:74]
  wire  _T_1094 = _T_1093 ^ dccm_wdata_hi_any[19]; // @[lib.scala 103:74]
  wire  _T_1095 = _T_1094 ^ dccm_wdata_hi_any[20]; // @[lib.scala 103:74]
  wire  _T_1096 = _T_1095 ^ dccm_wdata_hi_any[21]; // @[lib.scala 103:74]
  wire  _T_1097 = _T_1096 ^ dccm_wdata_hi_any[22]; // @[lib.scala 103:74]
  wire  _T_1098 = _T_1097 ^ dccm_wdata_hi_any[23]; // @[lib.scala 103:74]
  wire  _T_1099 = _T_1098 ^ dccm_wdata_hi_any[24]; // @[lib.scala 103:74]
  wire  _T_1100 = _T_1099 ^ dccm_wdata_hi_any[25]; // @[lib.scala 103:74]
  wire  _T_1107 = dccm_wdata_hi_any[26] ^ dccm_wdata_hi_any[27]; // @[lib.scala 103:74]
  wire  _T_1108 = _T_1107 ^ dccm_wdata_hi_any[28]; // @[lib.scala 103:74]
  wire  _T_1109 = _T_1108 ^ dccm_wdata_hi_any[29]; // @[lib.scala 103:74]
  wire  _T_1110 = _T_1109 ^ dccm_wdata_hi_any[30]; // @[lib.scala 103:74]
  wire  _T_1111 = _T_1110 ^ dccm_wdata_hi_any[31]; // @[lib.scala 103:74]
  wire [5:0] _T_1116 = {_T_1111,_T_1100,_T_1071,_T_1042,_T_1007,_T_972}; // @[Cat.scala 29:58]
  wire  _T_1117 = ^dccm_wdata_hi_any; // @[lib.scala 111:13]
  wire  _T_1118 = ^_T_1116; // @[lib.scala 111:23]
  wire  _T_1119 = _T_1117 ^ _T_1118; // @[lib.scala 111:18]
  reg  _T_1150; // @[lsu_ecc.scala 141:72]
  reg  _T_1151; // @[lsu_ecc.scala 142:72]
  reg  _T_1152; // @[lsu_ecc.scala 143:72]
  reg  _T_1153; // @[lsu_ecc.scala 144:72]
  reg [31:0] _T_1154; // @[lsu_ecc.scala 145:72]
  reg [31:0] _T_1155; // @[lsu_ecc.scala 146:72]
  reg [31:0] _T_1164; // @[lib.scala 358:16]
  reg [31:0] _T_1165; // @[lib.scala 358:16]
  rvclkhdr rvclkhdr ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_sec_data_hi_r = _T_1154; // @[lsu_ecc.scala 114:22 lsu_ecc.scala 145:62]
  assign io_sec_data_lo_r = _T_1155; // @[lsu_ecc.scala 117:25 lsu_ecc.scala 146:62]
  assign io_sec_data_hi_m = {_T_364,_T_362}; // @[lsu_ecc.scala 90:32 lsu_ecc.scala 134:27]
  assign io_sec_data_lo_m = {_T_742,_T_740}; // @[lsu_ecc.scala 91:32 lsu_ecc.scala 136:27]
  assign io_sec_data_hi_r_ff = _T_1164; // @[lsu_ecc.scala 157:23]
  assign io_sec_data_lo_r_ff = _T_1165; // @[lsu_ecc.scala 158:23]
  assign io_dma_dccm_wdata_ecc_hi = {_T_1119,_T_1116}; // @[lsu_ecc.scala 154:28]
  assign io_dma_dccm_wdata_ecc_lo = {_T_937,_T_934}; // @[lsu_ecc.scala 155:28]
  assign io_stbuf_ecc_any = {_T_937,_T_934}; // @[lsu_ecc.scala 153:28]
  assign io_sec_data_ecc_hi_r_ff = {_T_1119,_T_1116}; // @[lsu_ecc.scala 151:28]
  assign io_sec_data_ecc_lo_r_ff = {_T_937,_T_934}; // @[lsu_ecc.scala 152:28]
  assign io_single_ecc_error_hi_r = _T_1153; // @[lsu_ecc.scala 115:31 lsu_ecc.scala 144:62]
  assign io_single_ecc_error_lo_r = _T_1152; // @[lsu_ecc.scala 118:31 lsu_ecc.scala 143:62]
  assign io_lsu_single_ecc_error_r = _T_1150; // @[lsu_ecc.scala 120:31 lsu_ecc.scala 141:62]
  assign io_lsu_double_ecc_error_r = _T_1151; // @[lsu_ecc.scala 121:31 lsu_ecc.scala 142:62]
  assign io_lsu_single_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[lsu_ecc.scala 92:30 lsu_ecc.scala 138:33]
  assign io_lsu_double_ecc_error_m = double_ecc_error_hi_any | double_ecc_error_lo_any; // @[lsu_ecc.scala 93:30 lsu_ecc.scala 139:33]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[lib.scala 355:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[lib.scala 355:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
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
  _T_1150 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1151 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1152 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1153 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1154 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1155 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1164 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1165 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1150 = 1'h0;
  end
  if (reset) begin
    _T_1151 = 1'h0;
  end
  if (reset) begin
    _T_1152 = 1'h0;
  end
  if (reset) begin
    _T_1153 = 1'h0;
  end
  if (reset) begin
    _T_1154 = 32'h0;
  end
  if (reset) begin
    _T_1155 = 32'h0;
  end
  if (reset) begin
    _T_1164 = 32'h0;
  end
  if (reset) begin
    _T_1165 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1150 <= 1'h0;
    end else begin
      _T_1150 <= io_lsu_single_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1151 <= 1'h0;
    end else begin
      _T_1151 <= io_lsu_double_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1152 <= 1'h0;
    end else begin
      _T_1152 <= _T_588 & _T_586[6];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1153 <= 1'h0;
    end else begin
      _T_1153 <= _T_210 & _T_208[6];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1154 <= 32'h0;
    end else begin
      _T_1154 <= io_sec_data_hi_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1155 <= 32'h0;
    end else begin
      _T_1155 <= io_sec_data_lo_m;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1164 <= 32'h0;
    end else begin
      _T_1164 <= io_sec_data_hi_r;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1165 <= 32'h0;
    end else begin
      _T_1165 <= io_sec_data_lo_r;
    end
  end
endmodule
module lsu_trigger(
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_pkt,
  input         io_trigger_pkt_any_0_store,
  input         io_trigger_pkt_any_0_load,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_pkt,
  input         io_trigger_pkt_any_1_store,
  input         io_trigger_pkt_any_1_load,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_pkt,
  input         io_trigger_pkt_any_2_store,
  input         io_trigger_pkt_any_2_load,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_pkt,
  input         io_trigger_pkt_any_3_store,
  input         io_trigger_pkt_any_3_load,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_half,
  input         io_lsu_pkt_m_bits_word,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_m_bits_store,
  input         io_lsu_pkt_m_bits_dma,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_store_data_m,
  output [3:0]  io_lsu_trigger_match_m
);
  wire [15:0] _T_1 = io_lsu_pkt_m_bits_word ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_3 = _T_1 & io_store_data_m[31:16]; // @[lsu_trigger.scala 16:66]
  wire  _T_4 = io_lsu_pkt_m_bits_half | io_lsu_pkt_m_bits_word; // @[lsu_trigger.scala 16:124]
  wire [7:0] _T_6 = _T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_8 = _T_6 & io_store_data_m[15:8]; // @[lsu_trigger.scala 16:151]
  wire [31:0] store_data_trigger_m = {_T_3,_T_8,io_store_data_m[7:0]}; // @[Cat.scala 29:58]
  wire  _T_12 = ~io_trigger_pkt_any_0_select; // @[lsu_trigger.scala 17:53]
  wire  _T_13 = io_trigger_pkt_any_0_select & io_trigger_pkt_any_0_store; // @[lsu_trigger.scala 17:136]
  wire [31:0] _T_15 = _T_12 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_16 = _T_13 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_0 = _T_15 | _T_16; // @[Mux.scala 27:72]
  wire  _T_19 = ~io_trigger_pkt_any_1_select; // @[lsu_trigger.scala 17:53]
  wire  _T_20 = io_trigger_pkt_any_1_select & io_trigger_pkt_any_1_store; // @[lsu_trigger.scala 17:136]
  wire [31:0] _T_22 = _T_19 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_23 = _T_20 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_1 = _T_22 | _T_23; // @[Mux.scala 27:72]
  wire  _T_26 = ~io_trigger_pkt_any_2_select; // @[lsu_trigger.scala 17:53]
  wire  _T_27 = io_trigger_pkt_any_2_select & io_trigger_pkt_any_2_store; // @[lsu_trigger.scala 17:136]
  wire [31:0] _T_29 = _T_26 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_30 = _T_27 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_2 = _T_29 | _T_30; // @[Mux.scala 27:72]
  wire  _T_33 = ~io_trigger_pkt_any_3_select; // @[lsu_trigger.scala 17:53]
  wire  _T_34 = io_trigger_pkt_any_3_select & io_trigger_pkt_any_3_store; // @[lsu_trigger.scala 17:136]
  wire [31:0] _T_36 = _T_33 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_37 = _T_34 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_3 = _T_36 | _T_37; // @[Mux.scala 27:72]
  wire  _T_39 = ~io_lsu_pkt_m_bits_dma; // @[lsu_trigger.scala 18:71]
  wire  _T_40 = io_lsu_pkt_m_valid & _T_39; // @[lsu_trigger.scala 18:69]
  wire  _T_41 = io_trigger_pkt_any_0_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 18:126]
  wire  _T_42 = io_trigger_pkt_any_0_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 19:33]
  wire  _T_44 = _T_42 & _T_12; // @[lsu_trigger.scala 19:58]
  wire  _T_45 = _T_41 | _T_44; // @[lsu_trigger.scala 18:152]
  wire  _T_46 = _T_40 & _T_45; // @[lsu_trigger.scala 18:94]
  wire  _T_49 = &io_trigger_pkt_any_0_tdata2; // @[lib.scala 85:45]
  wire  _T_50 = ~_T_49; // @[lib.scala 85:39]
  wire  _T_51 = io_trigger_pkt_any_0_match_pkt & _T_50; // @[lib.scala 85:37]
  wire  _T_54 = io_trigger_pkt_any_0_tdata2[0] == lsu_match_data_0[0]; // @[lib.scala 86:52]
  wire  _T_55 = _T_51 | _T_54; // @[lib.scala 86:41]
  wire  _T_57 = &io_trigger_pkt_any_0_tdata2[0]; // @[lib.scala 88:36]
  wire  _T_58 = _T_57 & _T_51; // @[lib.scala 88:41]
  wire  _T_61 = io_trigger_pkt_any_0_tdata2[1] == lsu_match_data_0[1]; // @[lib.scala 88:78]
  wire  _T_62 = _T_58 | _T_61; // @[lib.scala 88:23]
  wire  _T_64 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[lib.scala 88:36]
  wire  _T_65 = _T_64 & _T_51; // @[lib.scala 88:41]
  wire  _T_68 = io_trigger_pkt_any_0_tdata2[2] == lsu_match_data_0[2]; // @[lib.scala 88:78]
  wire  _T_69 = _T_65 | _T_68; // @[lib.scala 88:23]
  wire  _T_71 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[lib.scala 88:36]
  wire  _T_72 = _T_71 & _T_51; // @[lib.scala 88:41]
  wire  _T_75 = io_trigger_pkt_any_0_tdata2[3] == lsu_match_data_0[3]; // @[lib.scala 88:78]
  wire  _T_76 = _T_72 | _T_75; // @[lib.scala 88:23]
  wire  _T_78 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[lib.scala 88:36]
  wire  _T_79 = _T_78 & _T_51; // @[lib.scala 88:41]
  wire  _T_82 = io_trigger_pkt_any_0_tdata2[4] == lsu_match_data_0[4]; // @[lib.scala 88:78]
  wire  _T_83 = _T_79 | _T_82; // @[lib.scala 88:23]
  wire  _T_85 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[lib.scala 88:36]
  wire  _T_86 = _T_85 & _T_51; // @[lib.scala 88:41]
  wire  _T_89 = io_trigger_pkt_any_0_tdata2[5] == lsu_match_data_0[5]; // @[lib.scala 88:78]
  wire  _T_90 = _T_86 | _T_89; // @[lib.scala 88:23]
  wire  _T_92 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[lib.scala 88:36]
  wire  _T_93 = _T_92 & _T_51; // @[lib.scala 88:41]
  wire  _T_96 = io_trigger_pkt_any_0_tdata2[6] == lsu_match_data_0[6]; // @[lib.scala 88:78]
  wire  _T_97 = _T_93 | _T_96; // @[lib.scala 88:23]
  wire  _T_99 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[lib.scala 88:36]
  wire  _T_100 = _T_99 & _T_51; // @[lib.scala 88:41]
  wire  _T_103 = io_trigger_pkt_any_0_tdata2[7] == lsu_match_data_0[7]; // @[lib.scala 88:78]
  wire  _T_104 = _T_100 | _T_103; // @[lib.scala 88:23]
  wire  _T_106 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[lib.scala 88:36]
  wire  _T_107 = _T_106 & _T_51; // @[lib.scala 88:41]
  wire  _T_110 = io_trigger_pkt_any_0_tdata2[8] == lsu_match_data_0[8]; // @[lib.scala 88:78]
  wire  _T_111 = _T_107 | _T_110; // @[lib.scala 88:23]
  wire  _T_113 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[lib.scala 88:36]
  wire  _T_114 = _T_113 & _T_51; // @[lib.scala 88:41]
  wire  _T_117 = io_trigger_pkt_any_0_tdata2[9] == lsu_match_data_0[9]; // @[lib.scala 88:78]
  wire  _T_118 = _T_114 | _T_117; // @[lib.scala 88:23]
  wire  _T_120 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[lib.scala 88:36]
  wire  _T_121 = _T_120 & _T_51; // @[lib.scala 88:41]
  wire  _T_124 = io_trigger_pkt_any_0_tdata2[10] == lsu_match_data_0[10]; // @[lib.scala 88:78]
  wire  _T_125 = _T_121 | _T_124; // @[lib.scala 88:23]
  wire  _T_127 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[lib.scala 88:36]
  wire  _T_128 = _T_127 & _T_51; // @[lib.scala 88:41]
  wire  _T_131 = io_trigger_pkt_any_0_tdata2[11] == lsu_match_data_0[11]; // @[lib.scala 88:78]
  wire  _T_132 = _T_128 | _T_131; // @[lib.scala 88:23]
  wire  _T_134 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[lib.scala 88:36]
  wire  _T_135 = _T_134 & _T_51; // @[lib.scala 88:41]
  wire  _T_138 = io_trigger_pkt_any_0_tdata2[12] == lsu_match_data_0[12]; // @[lib.scala 88:78]
  wire  _T_139 = _T_135 | _T_138; // @[lib.scala 88:23]
  wire  _T_141 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[lib.scala 88:36]
  wire  _T_142 = _T_141 & _T_51; // @[lib.scala 88:41]
  wire  _T_145 = io_trigger_pkt_any_0_tdata2[13] == lsu_match_data_0[13]; // @[lib.scala 88:78]
  wire  _T_146 = _T_142 | _T_145; // @[lib.scala 88:23]
  wire  _T_148 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[lib.scala 88:36]
  wire  _T_149 = _T_148 & _T_51; // @[lib.scala 88:41]
  wire  _T_152 = io_trigger_pkt_any_0_tdata2[14] == lsu_match_data_0[14]; // @[lib.scala 88:78]
  wire  _T_153 = _T_149 | _T_152; // @[lib.scala 88:23]
  wire  _T_155 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[lib.scala 88:36]
  wire  _T_156 = _T_155 & _T_51; // @[lib.scala 88:41]
  wire  _T_159 = io_trigger_pkt_any_0_tdata2[15] == lsu_match_data_0[15]; // @[lib.scala 88:78]
  wire  _T_160 = _T_156 | _T_159; // @[lib.scala 88:23]
  wire  _T_162 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[lib.scala 88:36]
  wire  _T_163 = _T_162 & _T_51; // @[lib.scala 88:41]
  wire  _T_166 = io_trigger_pkt_any_0_tdata2[16] == lsu_match_data_0[16]; // @[lib.scala 88:78]
  wire  _T_167 = _T_163 | _T_166; // @[lib.scala 88:23]
  wire  _T_169 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[lib.scala 88:36]
  wire  _T_170 = _T_169 & _T_51; // @[lib.scala 88:41]
  wire  _T_173 = io_trigger_pkt_any_0_tdata2[17] == lsu_match_data_0[17]; // @[lib.scala 88:78]
  wire  _T_174 = _T_170 | _T_173; // @[lib.scala 88:23]
  wire  _T_176 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[lib.scala 88:36]
  wire  _T_177 = _T_176 & _T_51; // @[lib.scala 88:41]
  wire  _T_180 = io_trigger_pkt_any_0_tdata2[18] == lsu_match_data_0[18]; // @[lib.scala 88:78]
  wire  _T_181 = _T_177 | _T_180; // @[lib.scala 88:23]
  wire  _T_183 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[lib.scala 88:36]
  wire  _T_184 = _T_183 & _T_51; // @[lib.scala 88:41]
  wire  _T_187 = io_trigger_pkt_any_0_tdata2[19] == lsu_match_data_0[19]; // @[lib.scala 88:78]
  wire  _T_188 = _T_184 | _T_187; // @[lib.scala 88:23]
  wire  _T_190 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[lib.scala 88:36]
  wire  _T_191 = _T_190 & _T_51; // @[lib.scala 88:41]
  wire  _T_194 = io_trigger_pkt_any_0_tdata2[20] == lsu_match_data_0[20]; // @[lib.scala 88:78]
  wire  _T_195 = _T_191 | _T_194; // @[lib.scala 88:23]
  wire  _T_197 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[lib.scala 88:36]
  wire  _T_198 = _T_197 & _T_51; // @[lib.scala 88:41]
  wire  _T_201 = io_trigger_pkt_any_0_tdata2[21] == lsu_match_data_0[21]; // @[lib.scala 88:78]
  wire  _T_202 = _T_198 | _T_201; // @[lib.scala 88:23]
  wire  _T_204 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[lib.scala 88:36]
  wire  _T_205 = _T_204 & _T_51; // @[lib.scala 88:41]
  wire  _T_208 = io_trigger_pkt_any_0_tdata2[22] == lsu_match_data_0[22]; // @[lib.scala 88:78]
  wire  _T_209 = _T_205 | _T_208; // @[lib.scala 88:23]
  wire  _T_211 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[lib.scala 88:36]
  wire  _T_212 = _T_211 & _T_51; // @[lib.scala 88:41]
  wire  _T_215 = io_trigger_pkt_any_0_tdata2[23] == lsu_match_data_0[23]; // @[lib.scala 88:78]
  wire  _T_216 = _T_212 | _T_215; // @[lib.scala 88:23]
  wire  _T_218 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[lib.scala 88:36]
  wire  _T_219 = _T_218 & _T_51; // @[lib.scala 88:41]
  wire  _T_222 = io_trigger_pkt_any_0_tdata2[24] == lsu_match_data_0[24]; // @[lib.scala 88:78]
  wire  _T_223 = _T_219 | _T_222; // @[lib.scala 88:23]
  wire  _T_225 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[lib.scala 88:36]
  wire  _T_226 = _T_225 & _T_51; // @[lib.scala 88:41]
  wire  _T_229 = io_trigger_pkt_any_0_tdata2[25] == lsu_match_data_0[25]; // @[lib.scala 88:78]
  wire  _T_230 = _T_226 | _T_229; // @[lib.scala 88:23]
  wire  _T_232 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[lib.scala 88:36]
  wire  _T_233 = _T_232 & _T_51; // @[lib.scala 88:41]
  wire  _T_236 = io_trigger_pkt_any_0_tdata2[26] == lsu_match_data_0[26]; // @[lib.scala 88:78]
  wire  _T_237 = _T_233 | _T_236; // @[lib.scala 88:23]
  wire  _T_239 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[lib.scala 88:36]
  wire  _T_240 = _T_239 & _T_51; // @[lib.scala 88:41]
  wire  _T_243 = io_trigger_pkt_any_0_tdata2[27] == lsu_match_data_0[27]; // @[lib.scala 88:78]
  wire  _T_244 = _T_240 | _T_243; // @[lib.scala 88:23]
  wire  _T_246 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[lib.scala 88:36]
  wire  _T_247 = _T_246 & _T_51; // @[lib.scala 88:41]
  wire  _T_250 = io_trigger_pkt_any_0_tdata2[28] == lsu_match_data_0[28]; // @[lib.scala 88:78]
  wire  _T_251 = _T_247 | _T_250; // @[lib.scala 88:23]
  wire  _T_253 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[lib.scala 88:36]
  wire  _T_254 = _T_253 & _T_51; // @[lib.scala 88:41]
  wire  _T_257 = io_trigger_pkt_any_0_tdata2[29] == lsu_match_data_0[29]; // @[lib.scala 88:78]
  wire  _T_258 = _T_254 | _T_257; // @[lib.scala 88:23]
  wire  _T_260 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[lib.scala 88:36]
  wire  _T_261 = _T_260 & _T_51; // @[lib.scala 88:41]
  wire  _T_264 = io_trigger_pkt_any_0_tdata2[30] == lsu_match_data_0[30]; // @[lib.scala 88:78]
  wire  _T_265 = _T_261 | _T_264; // @[lib.scala 88:23]
  wire  _T_267 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[lib.scala 88:36]
  wire  _T_268 = _T_267 & _T_51; // @[lib.scala 88:41]
  wire  _T_271 = io_trigger_pkt_any_0_tdata2[31] == lsu_match_data_0[31]; // @[lib.scala 88:78]
  wire  _T_272 = _T_268 | _T_271; // @[lib.scala 88:23]
  wire [7:0] _T_279 = {_T_104,_T_97,_T_90,_T_83,_T_76,_T_69,_T_62,_T_55}; // @[lib.scala 89:14]
  wire [15:0] _T_287 = {_T_160,_T_153,_T_146,_T_139,_T_132,_T_125,_T_118,_T_111,_T_279}; // @[lib.scala 89:14]
  wire [7:0] _T_294 = {_T_216,_T_209,_T_202,_T_195,_T_188,_T_181,_T_174,_T_167}; // @[lib.scala 89:14]
  wire [31:0] _T_303 = {_T_272,_T_265,_T_258,_T_251,_T_244,_T_237,_T_230,_T_223,_T_294,_T_287}; // @[lib.scala 89:14]
  wire  _T_304 = &_T_303; // @[lib.scala 89:25]
  wire  _T_305 = _T_46 & _T_304; // @[lsu_trigger.scala 19:92]
  wire  _T_308 = io_trigger_pkt_any_1_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 18:126]
  wire  _T_309 = io_trigger_pkt_any_1_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 19:33]
  wire  _T_311 = _T_309 & _T_19; // @[lsu_trigger.scala 19:58]
  wire  _T_312 = _T_308 | _T_311; // @[lsu_trigger.scala 18:152]
  wire  _T_313 = _T_40 & _T_312; // @[lsu_trigger.scala 18:94]
  wire  _T_316 = &io_trigger_pkt_any_1_tdata2; // @[lib.scala 85:45]
  wire  _T_317 = ~_T_316; // @[lib.scala 85:39]
  wire  _T_318 = io_trigger_pkt_any_1_match_pkt & _T_317; // @[lib.scala 85:37]
  wire  _T_321 = io_trigger_pkt_any_1_tdata2[0] == lsu_match_data_1[0]; // @[lib.scala 86:52]
  wire  _T_322 = _T_318 | _T_321; // @[lib.scala 86:41]
  wire  _T_324 = &io_trigger_pkt_any_1_tdata2[0]; // @[lib.scala 88:36]
  wire  _T_325 = _T_324 & _T_318; // @[lib.scala 88:41]
  wire  _T_328 = io_trigger_pkt_any_1_tdata2[1] == lsu_match_data_1[1]; // @[lib.scala 88:78]
  wire  _T_329 = _T_325 | _T_328; // @[lib.scala 88:23]
  wire  _T_331 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[lib.scala 88:36]
  wire  _T_332 = _T_331 & _T_318; // @[lib.scala 88:41]
  wire  _T_335 = io_trigger_pkt_any_1_tdata2[2] == lsu_match_data_1[2]; // @[lib.scala 88:78]
  wire  _T_336 = _T_332 | _T_335; // @[lib.scala 88:23]
  wire  _T_338 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[lib.scala 88:36]
  wire  _T_339 = _T_338 & _T_318; // @[lib.scala 88:41]
  wire  _T_342 = io_trigger_pkt_any_1_tdata2[3] == lsu_match_data_1[3]; // @[lib.scala 88:78]
  wire  _T_343 = _T_339 | _T_342; // @[lib.scala 88:23]
  wire  _T_345 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[lib.scala 88:36]
  wire  _T_346 = _T_345 & _T_318; // @[lib.scala 88:41]
  wire  _T_349 = io_trigger_pkt_any_1_tdata2[4] == lsu_match_data_1[4]; // @[lib.scala 88:78]
  wire  _T_350 = _T_346 | _T_349; // @[lib.scala 88:23]
  wire  _T_352 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[lib.scala 88:36]
  wire  _T_353 = _T_352 & _T_318; // @[lib.scala 88:41]
  wire  _T_356 = io_trigger_pkt_any_1_tdata2[5] == lsu_match_data_1[5]; // @[lib.scala 88:78]
  wire  _T_357 = _T_353 | _T_356; // @[lib.scala 88:23]
  wire  _T_359 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[lib.scala 88:36]
  wire  _T_360 = _T_359 & _T_318; // @[lib.scala 88:41]
  wire  _T_363 = io_trigger_pkt_any_1_tdata2[6] == lsu_match_data_1[6]; // @[lib.scala 88:78]
  wire  _T_364 = _T_360 | _T_363; // @[lib.scala 88:23]
  wire  _T_366 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[lib.scala 88:36]
  wire  _T_367 = _T_366 & _T_318; // @[lib.scala 88:41]
  wire  _T_370 = io_trigger_pkt_any_1_tdata2[7] == lsu_match_data_1[7]; // @[lib.scala 88:78]
  wire  _T_371 = _T_367 | _T_370; // @[lib.scala 88:23]
  wire  _T_373 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[lib.scala 88:36]
  wire  _T_374 = _T_373 & _T_318; // @[lib.scala 88:41]
  wire  _T_377 = io_trigger_pkt_any_1_tdata2[8] == lsu_match_data_1[8]; // @[lib.scala 88:78]
  wire  _T_378 = _T_374 | _T_377; // @[lib.scala 88:23]
  wire  _T_380 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[lib.scala 88:36]
  wire  _T_381 = _T_380 & _T_318; // @[lib.scala 88:41]
  wire  _T_384 = io_trigger_pkt_any_1_tdata2[9] == lsu_match_data_1[9]; // @[lib.scala 88:78]
  wire  _T_385 = _T_381 | _T_384; // @[lib.scala 88:23]
  wire  _T_387 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[lib.scala 88:36]
  wire  _T_388 = _T_387 & _T_318; // @[lib.scala 88:41]
  wire  _T_391 = io_trigger_pkt_any_1_tdata2[10] == lsu_match_data_1[10]; // @[lib.scala 88:78]
  wire  _T_392 = _T_388 | _T_391; // @[lib.scala 88:23]
  wire  _T_394 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[lib.scala 88:36]
  wire  _T_395 = _T_394 & _T_318; // @[lib.scala 88:41]
  wire  _T_398 = io_trigger_pkt_any_1_tdata2[11] == lsu_match_data_1[11]; // @[lib.scala 88:78]
  wire  _T_399 = _T_395 | _T_398; // @[lib.scala 88:23]
  wire  _T_401 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[lib.scala 88:36]
  wire  _T_402 = _T_401 & _T_318; // @[lib.scala 88:41]
  wire  _T_405 = io_trigger_pkt_any_1_tdata2[12] == lsu_match_data_1[12]; // @[lib.scala 88:78]
  wire  _T_406 = _T_402 | _T_405; // @[lib.scala 88:23]
  wire  _T_408 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[lib.scala 88:36]
  wire  _T_409 = _T_408 & _T_318; // @[lib.scala 88:41]
  wire  _T_412 = io_trigger_pkt_any_1_tdata2[13] == lsu_match_data_1[13]; // @[lib.scala 88:78]
  wire  _T_413 = _T_409 | _T_412; // @[lib.scala 88:23]
  wire  _T_415 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[lib.scala 88:36]
  wire  _T_416 = _T_415 & _T_318; // @[lib.scala 88:41]
  wire  _T_419 = io_trigger_pkt_any_1_tdata2[14] == lsu_match_data_1[14]; // @[lib.scala 88:78]
  wire  _T_420 = _T_416 | _T_419; // @[lib.scala 88:23]
  wire  _T_422 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[lib.scala 88:36]
  wire  _T_423 = _T_422 & _T_318; // @[lib.scala 88:41]
  wire  _T_426 = io_trigger_pkt_any_1_tdata2[15] == lsu_match_data_1[15]; // @[lib.scala 88:78]
  wire  _T_427 = _T_423 | _T_426; // @[lib.scala 88:23]
  wire  _T_429 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[lib.scala 88:36]
  wire  _T_430 = _T_429 & _T_318; // @[lib.scala 88:41]
  wire  _T_433 = io_trigger_pkt_any_1_tdata2[16] == lsu_match_data_1[16]; // @[lib.scala 88:78]
  wire  _T_434 = _T_430 | _T_433; // @[lib.scala 88:23]
  wire  _T_436 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[lib.scala 88:36]
  wire  _T_437 = _T_436 & _T_318; // @[lib.scala 88:41]
  wire  _T_440 = io_trigger_pkt_any_1_tdata2[17] == lsu_match_data_1[17]; // @[lib.scala 88:78]
  wire  _T_441 = _T_437 | _T_440; // @[lib.scala 88:23]
  wire  _T_443 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[lib.scala 88:36]
  wire  _T_444 = _T_443 & _T_318; // @[lib.scala 88:41]
  wire  _T_447 = io_trigger_pkt_any_1_tdata2[18] == lsu_match_data_1[18]; // @[lib.scala 88:78]
  wire  _T_448 = _T_444 | _T_447; // @[lib.scala 88:23]
  wire  _T_450 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[lib.scala 88:36]
  wire  _T_451 = _T_450 & _T_318; // @[lib.scala 88:41]
  wire  _T_454 = io_trigger_pkt_any_1_tdata2[19] == lsu_match_data_1[19]; // @[lib.scala 88:78]
  wire  _T_455 = _T_451 | _T_454; // @[lib.scala 88:23]
  wire  _T_457 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[lib.scala 88:36]
  wire  _T_458 = _T_457 & _T_318; // @[lib.scala 88:41]
  wire  _T_461 = io_trigger_pkt_any_1_tdata2[20] == lsu_match_data_1[20]; // @[lib.scala 88:78]
  wire  _T_462 = _T_458 | _T_461; // @[lib.scala 88:23]
  wire  _T_464 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[lib.scala 88:36]
  wire  _T_465 = _T_464 & _T_318; // @[lib.scala 88:41]
  wire  _T_468 = io_trigger_pkt_any_1_tdata2[21] == lsu_match_data_1[21]; // @[lib.scala 88:78]
  wire  _T_469 = _T_465 | _T_468; // @[lib.scala 88:23]
  wire  _T_471 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[lib.scala 88:36]
  wire  _T_472 = _T_471 & _T_318; // @[lib.scala 88:41]
  wire  _T_475 = io_trigger_pkt_any_1_tdata2[22] == lsu_match_data_1[22]; // @[lib.scala 88:78]
  wire  _T_476 = _T_472 | _T_475; // @[lib.scala 88:23]
  wire  _T_478 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[lib.scala 88:36]
  wire  _T_479 = _T_478 & _T_318; // @[lib.scala 88:41]
  wire  _T_482 = io_trigger_pkt_any_1_tdata2[23] == lsu_match_data_1[23]; // @[lib.scala 88:78]
  wire  _T_483 = _T_479 | _T_482; // @[lib.scala 88:23]
  wire  _T_485 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[lib.scala 88:36]
  wire  _T_486 = _T_485 & _T_318; // @[lib.scala 88:41]
  wire  _T_489 = io_trigger_pkt_any_1_tdata2[24] == lsu_match_data_1[24]; // @[lib.scala 88:78]
  wire  _T_490 = _T_486 | _T_489; // @[lib.scala 88:23]
  wire  _T_492 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[lib.scala 88:36]
  wire  _T_493 = _T_492 & _T_318; // @[lib.scala 88:41]
  wire  _T_496 = io_trigger_pkt_any_1_tdata2[25] == lsu_match_data_1[25]; // @[lib.scala 88:78]
  wire  _T_497 = _T_493 | _T_496; // @[lib.scala 88:23]
  wire  _T_499 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[lib.scala 88:36]
  wire  _T_500 = _T_499 & _T_318; // @[lib.scala 88:41]
  wire  _T_503 = io_trigger_pkt_any_1_tdata2[26] == lsu_match_data_1[26]; // @[lib.scala 88:78]
  wire  _T_504 = _T_500 | _T_503; // @[lib.scala 88:23]
  wire  _T_506 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[lib.scala 88:36]
  wire  _T_507 = _T_506 & _T_318; // @[lib.scala 88:41]
  wire  _T_510 = io_trigger_pkt_any_1_tdata2[27] == lsu_match_data_1[27]; // @[lib.scala 88:78]
  wire  _T_511 = _T_507 | _T_510; // @[lib.scala 88:23]
  wire  _T_513 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[lib.scala 88:36]
  wire  _T_514 = _T_513 & _T_318; // @[lib.scala 88:41]
  wire  _T_517 = io_trigger_pkt_any_1_tdata2[28] == lsu_match_data_1[28]; // @[lib.scala 88:78]
  wire  _T_518 = _T_514 | _T_517; // @[lib.scala 88:23]
  wire  _T_520 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[lib.scala 88:36]
  wire  _T_521 = _T_520 & _T_318; // @[lib.scala 88:41]
  wire  _T_524 = io_trigger_pkt_any_1_tdata2[29] == lsu_match_data_1[29]; // @[lib.scala 88:78]
  wire  _T_525 = _T_521 | _T_524; // @[lib.scala 88:23]
  wire  _T_527 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[lib.scala 88:36]
  wire  _T_528 = _T_527 & _T_318; // @[lib.scala 88:41]
  wire  _T_531 = io_trigger_pkt_any_1_tdata2[30] == lsu_match_data_1[30]; // @[lib.scala 88:78]
  wire  _T_532 = _T_528 | _T_531; // @[lib.scala 88:23]
  wire  _T_534 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[lib.scala 88:36]
  wire  _T_535 = _T_534 & _T_318; // @[lib.scala 88:41]
  wire  _T_538 = io_trigger_pkt_any_1_tdata2[31] == lsu_match_data_1[31]; // @[lib.scala 88:78]
  wire  _T_539 = _T_535 | _T_538; // @[lib.scala 88:23]
  wire [7:0] _T_546 = {_T_371,_T_364,_T_357,_T_350,_T_343,_T_336,_T_329,_T_322}; // @[lib.scala 89:14]
  wire [15:0] _T_554 = {_T_427,_T_420,_T_413,_T_406,_T_399,_T_392,_T_385,_T_378,_T_546}; // @[lib.scala 89:14]
  wire [7:0] _T_561 = {_T_483,_T_476,_T_469,_T_462,_T_455,_T_448,_T_441,_T_434}; // @[lib.scala 89:14]
  wire [31:0] _T_570 = {_T_539,_T_532,_T_525,_T_518,_T_511,_T_504,_T_497,_T_490,_T_561,_T_554}; // @[lib.scala 89:14]
  wire  _T_571 = &_T_570; // @[lib.scala 89:25]
  wire  _T_572 = _T_313 & _T_571; // @[lsu_trigger.scala 19:92]
  wire  _T_575 = io_trigger_pkt_any_2_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 18:126]
  wire  _T_576 = io_trigger_pkt_any_2_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 19:33]
  wire  _T_578 = _T_576 & _T_26; // @[lsu_trigger.scala 19:58]
  wire  _T_579 = _T_575 | _T_578; // @[lsu_trigger.scala 18:152]
  wire  _T_580 = _T_40 & _T_579; // @[lsu_trigger.scala 18:94]
  wire  _T_583 = &io_trigger_pkt_any_2_tdata2; // @[lib.scala 85:45]
  wire  _T_584 = ~_T_583; // @[lib.scala 85:39]
  wire  _T_585 = io_trigger_pkt_any_2_match_pkt & _T_584; // @[lib.scala 85:37]
  wire  _T_588 = io_trigger_pkt_any_2_tdata2[0] == lsu_match_data_2[0]; // @[lib.scala 86:52]
  wire  _T_589 = _T_585 | _T_588; // @[lib.scala 86:41]
  wire  _T_591 = &io_trigger_pkt_any_2_tdata2[0]; // @[lib.scala 88:36]
  wire  _T_592 = _T_591 & _T_585; // @[lib.scala 88:41]
  wire  _T_595 = io_trigger_pkt_any_2_tdata2[1] == lsu_match_data_2[1]; // @[lib.scala 88:78]
  wire  _T_596 = _T_592 | _T_595; // @[lib.scala 88:23]
  wire  _T_598 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[lib.scala 88:36]
  wire  _T_599 = _T_598 & _T_585; // @[lib.scala 88:41]
  wire  _T_602 = io_trigger_pkt_any_2_tdata2[2] == lsu_match_data_2[2]; // @[lib.scala 88:78]
  wire  _T_603 = _T_599 | _T_602; // @[lib.scala 88:23]
  wire  _T_605 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[lib.scala 88:36]
  wire  _T_606 = _T_605 & _T_585; // @[lib.scala 88:41]
  wire  _T_609 = io_trigger_pkt_any_2_tdata2[3] == lsu_match_data_2[3]; // @[lib.scala 88:78]
  wire  _T_610 = _T_606 | _T_609; // @[lib.scala 88:23]
  wire  _T_612 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[lib.scala 88:36]
  wire  _T_613 = _T_612 & _T_585; // @[lib.scala 88:41]
  wire  _T_616 = io_trigger_pkt_any_2_tdata2[4] == lsu_match_data_2[4]; // @[lib.scala 88:78]
  wire  _T_617 = _T_613 | _T_616; // @[lib.scala 88:23]
  wire  _T_619 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[lib.scala 88:36]
  wire  _T_620 = _T_619 & _T_585; // @[lib.scala 88:41]
  wire  _T_623 = io_trigger_pkt_any_2_tdata2[5] == lsu_match_data_2[5]; // @[lib.scala 88:78]
  wire  _T_624 = _T_620 | _T_623; // @[lib.scala 88:23]
  wire  _T_626 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[lib.scala 88:36]
  wire  _T_627 = _T_626 & _T_585; // @[lib.scala 88:41]
  wire  _T_630 = io_trigger_pkt_any_2_tdata2[6] == lsu_match_data_2[6]; // @[lib.scala 88:78]
  wire  _T_631 = _T_627 | _T_630; // @[lib.scala 88:23]
  wire  _T_633 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[lib.scala 88:36]
  wire  _T_634 = _T_633 & _T_585; // @[lib.scala 88:41]
  wire  _T_637 = io_trigger_pkt_any_2_tdata2[7] == lsu_match_data_2[7]; // @[lib.scala 88:78]
  wire  _T_638 = _T_634 | _T_637; // @[lib.scala 88:23]
  wire  _T_640 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[lib.scala 88:36]
  wire  _T_641 = _T_640 & _T_585; // @[lib.scala 88:41]
  wire  _T_644 = io_trigger_pkt_any_2_tdata2[8] == lsu_match_data_2[8]; // @[lib.scala 88:78]
  wire  _T_645 = _T_641 | _T_644; // @[lib.scala 88:23]
  wire  _T_647 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[lib.scala 88:36]
  wire  _T_648 = _T_647 & _T_585; // @[lib.scala 88:41]
  wire  _T_651 = io_trigger_pkt_any_2_tdata2[9] == lsu_match_data_2[9]; // @[lib.scala 88:78]
  wire  _T_652 = _T_648 | _T_651; // @[lib.scala 88:23]
  wire  _T_654 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[lib.scala 88:36]
  wire  _T_655 = _T_654 & _T_585; // @[lib.scala 88:41]
  wire  _T_658 = io_trigger_pkt_any_2_tdata2[10] == lsu_match_data_2[10]; // @[lib.scala 88:78]
  wire  _T_659 = _T_655 | _T_658; // @[lib.scala 88:23]
  wire  _T_661 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[lib.scala 88:36]
  wire  _T_662 = _T_661 & _T_585; // @[lib.scala 88:41]
  wire  _T_665 = io_trigger_pkt_any_2_tdata2[11] == lsu_match_data_2[11]; // @[lib.scala 88:78]
  wire  _T_666 = _T_662 | _T_665; // @[lib.scala 88:23]
  wire  _T_668 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[lib.scala 88:36]
  wire  _T_669 = _T_668 & _T_585; // @[lib.scala 88:41]
  wire  _T_672 = io_trigger_pkt_any_2_tdata2[12] == lsu_match_data_2[12]; // @[lib.scala 88:78]
  wire  _T_673 = _T_669 | _T_672; // @[lib.scala 88:23]
  wire  _T_675 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[lib.scala 88:36]
  wire  _T_676 = _T_675 & _T_585; // @[lib.scala 88:41]
  wire  _T_679 = io_trigger_pkt_any_2_tdata2[13] == lsu_match_data_2[13]; // @[lib.scala 88:78]
  wire  _T_680 = _T_676 | _T_679; // @[lib.scala 88:23]
  wire  _T_682 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[lib.scala 88:36]
  wire  _T_683 = _T_682 & _T_585; // @[lib.scala 88:41]
  wire  _T_686 = io_trigger_pkt_any_2_tdata2[14] == lsu_match_data_2[14]; // @[lib.scala 88:78]
  wire  _T_687 = _T_683 | _T_686; // @[lib.scala 88:23]
  wire  _T_689 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[lib.scala 88:36]
  wire  _T_690 = _T_689 & _T_585; // @[lib.scala 88:41]
  wire  _T_693 = io_trigger_pkt_any_2_tdata2[15] == lsu_match_data_2[15]; // @[lib.scala 88:78]
  wire  _T_694 = _T_690 | _T_693; // @[lib.scala 88:23]
  wire  _T_696 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[lib.scala 88:36]
  wire  _T_697 = _T_696 & _T_585; // @[lib.scala 88:41]
  wire  _T_700 = io_trigger_pkt_any_2_tdata2[16] == lsu_match_data_2[16]; // @[lib.scala 88:78]
  wire  _T_701 = _T_697 | _T_700; // @[lib.scala 88:23]
  wire  _T_703 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[lib.scala 88:36]
  wire  _T_704 = _T_703 & _T_585; // @[lib.scala 88:41]
  wire  _T_707 = io_trigger_pkt_any_2_tdata2[17] == lsu_match_data_2[17]; // @[lib.scala 88:78]
  wire  _T_708 = _T_704 | _T_707; // @[lib.scala 88:23]
  wire  _T_710 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[lib.scala 88:36]
  wire  _T_711 = _T_710 & _T_585; // @[lib.scala 88:41]
  wire  _T_714 = io_trigger_pkt_any_2_tdata2[18] == lsu_match_data_2[18]; // @[lib.scala 88:78]
  wire  _T_715 = _T_711 | _T_714; // @[lib.scala 88:23]
  wire  _T_717 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[lib.scala 88:36]
  wire  _T_718 = _T_717 & _T_585; // @[lib.scala 88:41]
  wire  _T_721 = io_trigger_pkt_any_2_tdata2[19] == lsu_match_data_2[19]; // @[lib.scala 88:78]
  wire  _T_722 = _T_718 | _T_721; // @[lib.scala 88:23]
  wire  _T_724 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[lib.scala 88:36]
  wire  _T_725 = _T_724 & _T_585; // @[lib.scala 88:41]
  wire  _T_728 = io_trigger_pkt_any_2_tdata2[20] == lsu_match_data_2[20]; // @[lib.scala 88:78]
  wire  _T_729 = _T_725 | _T_728; // @[lib.scala 88:23]
  wire  _T_731 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[lib.scala 88:36]
  wire  _T_732 = _T_731 & _T_585; // @[lib.scala 88:41]
  wire  _T_735 = io_trigger_pkt_any_2_tdata2[21] == lsu_match_data_2[21]; // @[lib.scala 88:78]
  wire  _T_736 = _T_732 | _T_735; // @[lib.scala 88:23]
  wire  _T_738 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[lib.scala 88:36]
  wire  _T_739 = _T_738 & _T_585; // @[lib.scala 88:41]
  wire  _T_742 = io_trigger_pkt_any_2_tdata2[22] == lsu_match_data_2[22]; // @[lib.scala 88:78]
  wire  _T_743 = _T_739 | _T_742; // @[lib.scala 88:23]
  wire  _T_745 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[lib.scala 88:36]
  wire  _T_746 = _T_745 & _T_585; // @[lib.scala 88:41]
  wire  _T_749 = io_trigger_pkt_any_2_tdata2[23] == lsu_match_data_2[23]; // @[lib.scala 88:78]
  wire  _T_750 = _T_746 | _T_749; // @[lib.scala 88:23]
  wire  _T_752 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[lib.scala 88:36]
  wire  _T_753 = _T_752 & _T_585; // @[lib.scala 88:41]
  wire  _T_756 = io_trigger_pkt_any_2_tdata2[24] == lsu_match_data_2[24]; // @[lib.scala 88:78]
  wire  _T_757 = _T_753 | _T_756; // @[lib.scala 88:23]
  wire  _T_759 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[lib.scala 88:36]
  wire  _T_760 = _T_759 & _T_585; // @[lib.scala 88:41]
  wire  _T_763 = io_trigger_pkt_any_2_tdata2[25] == lsu_match_data_2[25]; // @[lib.scala 88:78]
  wire  _T_764 = _T_760 | _T_763; // @[lib.scala 88:23]
  wire  _T_766 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[lib.scala 88:36]
  wire  _T_767 = _T_766 & _T_585; // @[lib.scala 88:41]
  wire  _T_770 = io_trigger_pkt_any_2_tdata2[26] == lsu_match_data_2[26]; // @[lib.scala 88:78]
  wire  _T_771 = _T_767 | _T_770; // @[lib.scala 88:23]
  wire  _T_773 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[lib.scala 88:36]
  wire  _T_774 = _T_773 & _T_585; // @[lib.scala 88:41]
  wire  _T_777 = io_trigger_pkt_any_2_tdata2[27] == lsu_match_data_2[27]; // @[lib.scala 88:78]
  wire  _T_778 = _T_774 | _T_777; // @[lib.scala 88:23]
  wire  _T_780 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[lib.scala 88:36]
  wire  _T_781 = _T_780 & _T_585; // @[lib.scala 88:41]
  wire  _T_784 = io_trigger_pkt_any_2_tdata2[28] == lsu_match_data_2[28]; // @[lib.scala 88:78]
  wire  _T_785 = _T_781 | _T_784; // @[lib.scala 88:23]
  wire  _T_787 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[lib.scala 88:36]
  wire  _T_788 = _T_787 & _T_585; // @[lib.scala 88:41]
  wire  _T_791 = io_trigger_pkt_any_2_tdata2[29] == lsu_match_data_2[29]; // @[lib.scala 88:78]
  wire  _T_792 = _T_788 | _T_791; // @[lib.scala 88:23]
  wire  _T_794 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[lib.scala 88:36]
  wire  _T_795 = _T_794 & _T_585; // @[lib.scala 88:41]
  wire  _T_798 = io_trigger_pkt_any_2_tdata2[30] == lsu_match_data_2[30]; // @[lib.scala 88:78]
  wire  _T_799 = _T_795 | _T_798; // @[lib.scala 88:23]
  wire  _T_801 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[lib.scala 88:36]
  wire  _T_802 = _T_801 & _T_585; // @[lib.scala 88:41]
  wire  _T_805 = io_trigger_pkt_any_2_tdata2[31] == lsu_match_data_2[31]; // @[lib.scala 88:78]
  wire  _T_806 = _T_802 | _T_805; // @[lib.scala 88:23]
  wire [7:0] _T_813 = {_T_638,_T_631,_T_624,_T_617,_T_610,_T_603,_T_596,_T_589}; // @[lib.scala 89:14]
  wire [15:0] _T_821 = {_T_694,_T_687,_T_680,_T_673,_T_666,_T_659,_T_652,_T_645,_T_813}; // @[lib.scala 89:14]
  wire [7:0] _T_828 = {_T_750,_T_743,_T_736,_T_729,_T_722,_T_715,_T_708,_T_701}; // @[lib.scala 89:14]
  wire [31:0] _T_837 = {_T_806,_T_799,_T_792,_T_785,_T_778,_T_771,_T_764,_T_757,_T_828,_T_821}; // @[lib.scala 89:14]
  wire  _T_838 = &_T_837; // @[lib.scala 89:25]
  wire  _T_839 = _T_580 & _T_838; // @[lsu_trigger.scala 19:92]
  wire  _T_842 = io_trigger_pkt_any_3_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 18:126]
  wire  _T_843 = io_trigger_pkt_any_3_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 19:33]
  wire  _T_845 = _T_843 & _T_33; // @[lsu_trigger.scala 19:58]
  wire  _T_846 = _T_842 | _T_845; // @[lsu_trigger.scala 18:152]
  wire  _T_847 = _T_40 & _T_846; // @[lsu_trigger.scala 18:94]
  wire  _T_850 = &io_trigger_pkt_any_3_tdata2; // @[lib.scala 85:45]
  wire  _T_851 = ~_T_850; // @[lib.scala 85:39]
  wire  _T_852 = io_trigger_pkt_any_3_match_pkt & _T_851; // @[lib.scala 85:37]
  wire  _T_855 = io_trigger_pkt_any_3_tdata2[0] == lsu_match_data_3[0]; // @[lib.scala 86:52]
  wire  _T_856 = _T_852 | _T_855; // @[lib.scala 86:41]
  wire  _T_858 = &io_trigger_pkt_any_3_tdata2[0]; // @[lib.scala 88:36]
  wire  _T_859 = _T_858 & _T_852; // @[lib.scala 88:41]
  wire  _T_862 = io_trigger_pkt_any_3_tdata2[1] == lsu_match_data_3[1]; // @[lib.scala 88:78]
  wire  _T_863 = _T_859 | _T_862; // @[lib.scala 88:23]
  wire  _T_865 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[lib.scala 88:36]
  wire  _T_866 = _T_865 & _T_852; // @[lib.scala 88:41]
  wire  _T_869 = io_trigger_pkt_any_3_tdata2[2] == lsu_match_data_3[2]; // @[lib.scala 88:78]
  wire  _T_870 = _T_866 | _T_869; // @[lib.scala 88:23]
  wire  _T_872 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[lib.scala 88:36]
  wire  _T_873 = _T_872 & _T_852; // @[lib.scala 88:41]
  wire  _T_876 = io_trigger_pkt_any_3_tdata2[3] == lsu_match_data_3[3]; // @[lib.scala 88:78]
  wire  _T_877 = _T_873 | _T_876; // @[lib.scala 88:23]
  wire  _T_879 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[lib.scala 88:36]
  wire  _T_880 = _T_879 & _T_852; // @[lib.scala 88:41]
  wire  _T_883 = io_trigger_pkt_any_3_tdata2[4] == lsu_match_data_3[4]; // @[lib.scala 88:78]
  wire  _T_884 = _T_880 | _T_883; // @[lib.scala 88:23]
  wire  _T_886 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[lib.scala 88:36]
  wire  _T_887 = _T_886 & _T_852; // @[lib.scala 88:41]
  wire  _T_890 = io_trigger_pkt_any_3_tdata2[5] == lsu_match_data_3[5]; // @[lib.scala 88:78]
  wire  _T_891 = _T_887 | _T_890; // @[lib.scala 88:23]
  wire  _T_893 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[lib.scala 88:36]
  wire  _T_894 = _T_893 & _T_852; // @[lib.scala 88:41]
  wire  _T_897 = io_trigger_pkt_any_3_tdata2[6] == lsu_match_data_3[6]; // @[lib.scala 88:78]
  wire  _T_898 = _T_894 | _T_897; // @[lib.scala 88:23]
  wire  _T_900 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[lib.scala 88:36]
  wire  _T_901 = _T_900 & _T_852; // @[lib.scala 88:41]
  wire  _T_904 = io_trigger_pkt_any_3_tdata2[7] == lsu_match_data_3[7]; // @[lib.scala 88:78]
  wire  _T_905 = _T_901 | _T_904; // @[lib.scala 88:23]
  wire  _T_907 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[lib.scala 88:36]
  wire  _T_908 = _T_907 & _T_852; // @[lib.scala 88:41]
  wire  _T_911 = io_trigger_pkt_any_3_tdata2[8] == lsu_match_data_3[8]; // @[lib.scala 88:78]
  wire  _T_912 = _T_908 | _T_911; // @[lib.scala 88:23]
  wire  _T_914 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[lib.scala 88:36]
  wire  _T_915 = _T_914 & _T_852; // @[lib.scala 88:41]
  wire  _T_918 = io_trigger_pkt_any_3_tdata2[9] == lsu_match_data_3[9]; // @[lib.scala 88:78]
  wire  _T_919 = _T_915 | _T_918; // @[lib.scala 88:23]
  wire  _T_921 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[lib.scala 88:36]
  wire  _T_922 = _T_921 & _T_852; // @[lib.scala 88:41]
  wire  _T_925 = io_trigger_pkt_any_3_tdata2[10] == lsu_match_data_3[10]; // @[lib.scala 88:78]
  wire  _T_926 = _T_922 | _T_925; // @[lib.scala 88:23]
  wire  _T_928 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[lib.scala 88:36]
  wire  _T_929 = _T_928 & _T_852; // @[lib.scala 88:41]
  wire  _T_932 = io_trigger_pkt_any_3_tdata2[11] == lsu_match_data_3[11]; // @[lib.scala 88:78]
  wire  _T_933 = _T_929 | _T_932; // @[lib.scala 88:23]
  wire  _T_935 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[lib.scala 88:36]
  wire  _T_936 = _T_935 & _T_852; // @[lib.scala 88:41]
  wire  _T_939 = io_trigger_pkt_any_3_tdata2[12] == lsu_match_data_3[12]; // @[lib.scala 88:78]
  wire  _T_940 = _T_936 | _T_939; // @[lib.scala 88:23]
  wire  _T_942 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[lib.scala 88:36]
  wire  _T_943 = _T_942 & _T_852; // @[lib.scala 88:41]
  wire  _T_946 = io_trigger_pkt_any_3_tdata2[13] == lsu_match_data_3[13]; // @[lib.scala 88:78]
  wire  _T_947 = _T_943 | _T_946; // @[lib.scala 88:23]
  wire  _T_949 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[lib.scala 88:36]
  wire  _T_950 = _T_949 & _T_852; // @[lib.scala 88:41]
  wire  _T_953 = io_trigger_pkt_any_3_tdata2[14] == lsu_match_data_3[14]; // @[lib.scala 88:78]
  wire  _T_954 = _T_950 | _T_953; // @[lib.scala 88:23]
  wire  _T_956 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[lib.scala 88:36]
  wire  _T_957 = _T_956 & _T_852; // @[lib.scala 88:41]
  wire  _T_960 = io_trigger_pkt_any_3_tdata2[15] == lsu_match_data_3[15]; // @[lib.scala 88:78]
  wire  _T_961 = _T_957 | _T_960; // @[lib.scala 88:23]
  wire  _T_963 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[lib.scala 88:36]
  wire  _T_964 = _T_963 & _T_852; // @[lib.scala 88:41]
  wire  _T_967 = io_trigger_pkt_any_3_tdata2[16] == lsu_match_data_3[16]; // @[lib.scala 88:78]
  wire  _T_968 = _T_964 | _T_967; // @[lib.scala 88:23]
  wire  _T_970 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[lib.scala 88:36]
  wire  _T_971 = _T_970 & _T_852; // @[lib.scala 88:41]
  wire  _T_974 = io_trigger_pkt_any_3_tdata2[17] == lsu_match_data_3[17]; // @[lib.scala 88:78]
  wire  _T_975 = _T_971 | _T_974; // @[lib.scala 88:23]
  wire  _T_977 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[lib.scala 88:36]
  wire  _T_978 = _T_977 & _T_852; // @[lib.scala 88:41]
  wire  _T_981 = io_trigger_pkt_any_3_tdata2[18] == lsu_match_data_3[18]; // @[lib.scala 88:78]
  wire  _T_982 = _T_978 | _T_981; // @[lib.scala 88:23]
  wire  _T_984 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[lib.scala 88:36]
  wire  _T_985 = _T_984 & _T_852; // @[lib.scala 88:41]
  wire  _T_988 = io_trigger_pkt_any_3_tdata2[19] == lsu_match_data_3[19]; // @[lib.scala 88:78]
  wire  _T_989 = _T_985 | _T_988; // @[lib.scala 88:23]
  wire  _T_991 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[lib.scala 88:36]
  wire  _T_992 = _T_991 & _T_852; // @[lib.scala 88:41]
  wire  _T_995 = io_trigger_pkt_any_3_tdata2[20] == lsu_match_data_3[20]; // @[lib.scala 88:78]
  wire  _T_996 = _T_992 | _T_995; // @[lib.scala 88:23]
  wire  _T_998 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[lib.scala 88:36]
  wire  _T_999 = _T_998 & _T_852; // @[lib.scala 88:41]
  wire  _T_1002 = io_trigger_pkt_any_3_tdata2[21] == lsu_match_data_3[21]; // @[lib.scala 88:78]
  wire  _T_1003 = _T_999 | _T_1002; // @[lib.scala 88:23]
  wire  _T_1005 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[lib.scala 88:36]
  wire  _T_1006 = _T_1005 & _T_852; // @[lib.scala 88:41]
  wire  _T_1009 = io_trigger_pkt_any_3_tdata2[22] == lsu_match_data_3[22]; // @[lib.scala 88:78]
  wire  _T_1010 = _T_1006 | _T_1009; // @[lib.scala 88:23]
  wire  _T_1012 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[lib.scala 88:36]
  wire  _T_1013 = _T_1012 & _T_852; // @[lib.scala 88:41]
  wire  _T_1016 = io_trigger_pkt_any_3_tdata2[23] == lsu_match_data_3[23]; // @[lib.scala 88:78]
  wire  _T_1017 = _T_1013 | _T_1016; // @[lib.scala 88:23]
  wire  _T_1019 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[lib.scala 88:36]
  wire  _T_1020 = _T_1019 & _T_852; // @[lib.scala 88:41]
  wire  _T_1023 = io_trigger_pkt_any_3_tdata2[24] == lsu_match_data_3[24]; // @[lib.scala 88:78]
  wire  _T_1024 = _T_1020 | _T_1023; // @[lib.scala 88:23]
  wire  _T_1026 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[lib.scala 88:36]
  wire  _T_1027 = _T_1026 & _T_852; // @[lib.scala 88:41]
  wire  _T_1030 = io_trigger_pkt_any_3_tdata2[25] == lsu_match_data_3[25]; // @[lib.scala 88:78]
  wire  _T_1031 = _T_1027 | _T_1030; // @[lib.scala 88:23]
  wire  _T_1033 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[lib.scala 88:36]
  wire  _T_1034 = _T_1033 & _T_852; // @[lib.scala 88:41]
  wire  _T_1037 = io_trigger_pkt_any_3_tdata2[26] == lsu_match_data_3[26]; // @[lib.scala 88:78]
  wire  _T_1038 = _T_1034 | _T_1037; // @[lib.scala 88:23]
  wire  _T_1040 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[lib.scala 88:36]
  wire  _T_1041 = _T_1040 & _T_852; // @[lib.scala 88:41]
  wire  _T_1044 = io_trigger_pkt_any_3_tdata2[27] == lsu_match_data_3[27]; // @[lib.scala 88:78]
  wire  _T_1045 = _T_1041 | _T_1044; // @[lib.scala 88:23]
  wire  _T_1047 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[lib.scala 88:36]
  wire  _T_1048 = _T_1047 & _T_852; // @[lib.scala 88:41]
  wire  _T_1051 = io_trigger_pkt_any_3_tdata2[28] == lsu_match_data_3[28]; // @[lib.scala 88:78]
  wire  _T_1052 = _T_1048 | _T_1051; // @[lib.scala 88:23]
  wire  _T_1054 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[lib.scala 88:36]
  wire  _T_1055 = _T_1054 & _T_852; // @[lib.scala 88:41]
  wire  _T_1058 = io_trigger_pkt_any_3_tdata2[29] == lsu_match_data_3[29]; // @[lib.scala 88:78]
  wire  _T_1059 = _T_1055 | _T_1058; // @[lib.scala 88:23]
  wire  _T_1061 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[lib.scala 88:36]
  wire  _T_1062 = _T_1061 & _T_852; // @[lib.scala 88:41]
  wire  _T_1065 = io_trigger_pkt_any_3_tdata2[30] == lsu_match_data_3[30]; // @[lib.scala 88:78]
  wire  _T_1066 = _T_1062 | _T_1065; // @[lib.scala 88:23]
  wire  _T_1068 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[lib.scala 88:36]
  wire  _T_1069 = _T_1068 & _T_852; // @[lib.scala 88:41]
  wire  _T_1072 = io_trigger_pkt_any_3_tdata2[31] == lsu_match_data_3[31]; // @[lib.scala 88:78]
  wire  _T_1073 = _T_1069 | _T_1072; // @[lib.scala 88:23]
  wire [7:0] _T_1080 = {_T_905,_T_898,_T_891,_T_884,_T_877,_T_870,_T_863,_T_856}; // @[lib.scala 89:14]
  wire [15:0] _T_1088 = {_T_961,_T_954,_T_947,_T_940,_T_933,_T_926,_T_919,_T_912,_T_1080}; // @[lib.scala 89:14]
  wire [7:0] _T_1095 = {_T_1017,_T_1010,_T_1003,_T_996,_T_989,_T_982,_T_975,_T_968}; // @[lib.scala 89:14]
  wire [31:0] _T_1104 = {_T_1073,_T_1066,_T_1059,_T_1052,_T_1045,_T_1038,_T_1031,_T_1024,_T_1095,_T_1088}; // @[lib.scala 89:14]
  wire  _T_1105 = &_T_1104; // @[lib.scala 89:25]
  wire  _T_1106 = _T_847 & _T_1105; // @[lsu_trigger.scala 19:92]
  wire [2:0] _T_1108 = {_T_1106,_T_839,_T_572}; // @[Cat.scala 29:58]
  assign io_lsu_trigger_match_m = {_T_1108,_T_305}; // @[lsu_trigger.scala 18:26]
endmodule
module lsu_clkdomain(
  input   clock,
  input   reset,
  input   io_free_clk,
  input   io_clk_override,
  input   io_dma_dccm_req,
  input   io_ldst_stbuf_reqvld_r,
  input   io_stbuf_reqvld_any,
  input   io_stbuf_reqvld_flushed_any,
  input   io_lsu_busreq_r,
  input   io_lsu_bus_buffer_pend_any,
  input   io_lsu_bus_buffer_empty_any,
  input   io_lsu_stbuf_empty_any,
  input   io_lsu_bus_clk_en,
  input   io_lsu_p_valid,
  input   io_lsu_pkt_d_valid,
  input   io_lsu_pkt_d_bits_store,
  input   io_lsu_pkt_m_valid,
  input   io_lsu_pkt_m_bits_store,
  input   io_lsu_pkt_r_valid,
  output  io_lsu_c1_m_clk,
  output  io_lsu_c1_r_clk,
  output  io_lsu_c2_m_clk,
  output  io_lsu_c2_r_clk,
  output  io_lsu_store_c1_m_clk,
  output  io_lsu_store_c1_r_clk,
  output  io_lsu_stbuf_c1_clk,
  output  io_lsu_bus_obuf_c1_clk,
  output  io_lsu_bus_ibuf_c1_clk,
  output  io_lsu_bus_buf_c1_clk,
  output  io_lsu_busm_clk,
  output  io_lsu_free_c2_clk,
  input   io_scan_mode
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_2_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_3_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_4_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_5_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_6_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_7_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_8_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_8_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_9_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_9_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_10_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_10_io_scan_mode; // @[lib.scala 327:22]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 327:22]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 327:22]
  wire  rvclkhdr_11_io_en; // @[lib.scala 327:22]
  wire  rvclkhdr_11_io_scan_mode; // @[lib.scala 327:22]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[lsu_clkdomain.scala 63:51]
  reg  lsu_c1_d_clken_q; // @[lsu_clkdomain.scala 82:67]
  wire  _T_1 = io_lsu_pkt_d_valid | lsu_c1_d_clken_q; // @[lsu_clkdomain.scala 64:51]
  wire  lsu_c1_m_clken = _T_1 | io_clk_override; // @[lsu_clkdomain.scala 64:70]
  reg  lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 83:67]
  wire  _T_2 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 65:51]
  wire  lsu_c1_r_clken = _T_2 | io_clk_override; // @[lsu_clkdomain.scala 65:70]
  wire  _T_3 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 67:47]
  reg  lsu_c1_r_clken_q; // @[lsu_clkdomain.scala 84:67]
  wire  _T_4 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[lsu_clkdomain.scala 68:47]
  wire  _T_5 = lsu_c1_m_clken & io_lsu_pkt_d_bits_store; // @[lsu_clkdomain.scala 70:49]
  wire  _T_6 = lsu_c1_r_clken & io_lsu_pkt_m_bits_store; // @[lsu_clkdomain.scala 71:49]
  wire  _T_7 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[lsu_clkdomain.scala 72:55]
  wire  _T_8 = _T_7 | io_stbuf_reqvld_flushed_any; // @[lsu_clkdomain.scala 72:77]
  wire  _T_9 = io_lsu_bus_buffer_pend_any | io_lsu_busreq_r; // @[lsu_clkdomain.scala 74:61]
  wire  _T_10 = _T_9 | io_clk_override; // @[lsu_clkdomain.scala 74:79]
  wire  _T_11 = ~io_lsu_bus_buffer_empty_any; // @[lsu_clkdomain.scala 75:32]
  wire  _T_12 = _T_11 | io_lsu_busreq_r; // @[lsu_clkdomain.scala 75:61]
  wire  _T_13 = io_lsu_p_valid | io_lsu_pkt_d_valid; // @[lsu_clkdomain.scala 77:48]
  wire  _T_14 = _T_13 | io_lsu_pkt_m_valid; // @[lsu_clkdomain.scala 77:69]
  wire  _T_15 = _T_14 | io_lsu_pkt_r_valid; // @[lsu_clkdomain.scala 77:90]
  wire  _T_17 = _T_15 | _T_11; // @[lsu_clkdomain.scala 77:112]
  wire  _T_18 = ~io_lsu_stbuf_empty_any; // @[lsu_clkdomain.scala 77:145]
  wire  _T_19 = _T_17 | _T_18; // @[lsu_clkdomain.scala 77:143]
  wire  lsu_free_c1_clken = _T_19 | io_clk_override; // @[lsu_clkdomain.scala 77:169]
  reg  lsu_free_c1_clken_q; // @[lsu_clkdomain.scala 81:60]
  wire  _T_20 = lsu_free_c1_clken | lsu_free_c1_clken_q; // @[lsu_clkdomain.scala 78:50]
  rvclkhdr rvclkhdr ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 327:22]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_c1_m_clk = rvclkhdr_io_l1clk; // @[lsu_clkdomain.scala 86:26]
  assign io_lsu_c1_r_clk = rvclkhdr_1_io_l1clk; // @[lsu_clkdomain.scala 87:26]
  assign io_lsu_c2_m_clk = rvclkhdr_2_io_l1clk; // @[lsu_clkdomain.scala 88:26]
  assign io_lsu_c2_r_clk = rvclkhdr_3_io_l1clk; // @[lsu_clkdomain.scala 89:26]
  assign io_lsu_store_c1_m_clk = rvclkhdr_4_io_l1clk; // @[lsu_clkdomain.scala 90:26]
  assign io_lsu_store_c1_r_clk = rvclkhdr_5_io_l1clk; // @[lsu_clkdomain.scala 91:26]
  assign io_lsu_stbuf_c1_clk = rvclkhdr_6_io_l1clk; // @[lsu_clkdomain.scala 92:26]
  assign io_lsu_bus_obuf_c1_clk = rvclkhdr_8_io_l1clk; // @[lsu_clkdomain.scala 94:26]
  assign io_lsu_bus_ibuf_c1_clk = rvclkhdr_7_io_l1clk; // @[lsu_clkdomain.scala 93:26]
  assign io_lsu_bus_buf_c1_clk = rvclkhdr_9_io_l1clk; // @[lsu_clkdomain.scala 95:26]
  assign io_lsu_busm_clk = rvclkhdr_10_io_l1clk; // @[lsu_clkdomain.scala 96:26]
  assign io_lsu_free_c2_clk = rvclkhdr_11_io_l1clk; // @[lsu_clkdomain.scala 97:26]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_io_en = _T_1 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_1_io_en = _T_2 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_2_io_en = _T_3 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_3_io_en = _T_4 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_4_io_en = _T_5 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_5_io_en = _T_6 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_6_io_en = _T_8 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_7_io_en = io_lsu_busreq_r | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_8_io_en = _T_10 & io_lsu_bus_clk_en; // @[lib.scala 329:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_9_io_en = _T_12 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_10_io_en = io_lsu_bus_clk_en; // @[lib.scala 329:16]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 328:17]
  assign rvclkhdr_11_io_en = _T_20 | io_clk_override; // @[lib.scala 329:16]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[lib.scala 330:23]
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
  lsu_c1_d_clken_q = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_c1_m_clken_q = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_c1_r_clken_q = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsu_free_c1_clken_q = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    lsu_c1_d_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_c1_m_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_c1_r_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_free_c1_clken_q = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_d_clken_q <= 1'h0;
    end else begin
      lsu_c1_d_clken_q <= _T | io_clk_override;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_m_clken_q <= 1'h0;
    end else begin
      lsu_c1_m_clken_q <= _T_1 | io_clk_override;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_r_clken_q <= 1'h0;
    end else begin
      lsu_c1_r_clken_q <= _T_2 | io_clk_override;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_free_c1_clken_q <= 1'h0;
    end else begin
      lsu_free_c1_clken_q <= _T_19 | io_clk_override;
    end
  end
endmodule
module lsu_bus_buffer(
  input         clock,
  input         reset,
  input         io_scan_mode,
  output        io_tlu_busbuff_lsu_pmu_bus_trxn,
  output        io_tlu_busbuff_lsu_pmu_bus_misaligned,
  output        io_tlu_busbuff_lsu_pmu_bus_error,
  output        io_tlu_busbuff_lsu_pmu_bus_busy,
  input         io_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  input         io_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  input         io_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  output        io_tlu_busbuff_lsu_imprecise_error_load_any,
  output        io_tlu_busbuff_lsu_imprecise_error_store_any,
  output [31:0] io_tlu_busbuff_lsu_imprecise_error_addr_any,
  output        io_dctl_busbuff_lsu_nonblock_load_valid_m,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_tag_m,
  output        io_dctl_busbuff_lsu_nonblock_load_inv_r,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  output        io_dctl_busbuff_lsu_nonblock_load_data_valid,
  output        io_dctl_busbuff_lsu_nonblock_load_data_error,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_data_tag,
  output [31:0] io_dctl_busbuff_lsu_nonblock_load_data,
  input         io_dec_tlu_force_halt,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_load,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_unsign,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_r,
  input  [31:0] io_store_data_r,
  input         io_no_word_merge_r,
  input         io_no_dword_merge_r,
  input         io_lsu_busreq_m,
  input         io_ld_full_hit_m,
  input         io_flush_m_up,
  input         io_flush_r,
  input         io_lsu_commit_r,
  input         io_is_sideeffects_r,
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
  input  [7:0]  io_ldst_byteen_ext_m,
  input         io_lsu_axi_aw_ready,
  output        io_lsu_axi_aw_valid,
  output [2:0]  io_lsu_axi_aw_bits_id,
  output [31:0] io_lsu_axi_aw_bits_addr,
  output [3:0]  io_lsu_axi_aw_bits_region,
  output [2:0]  io_lsu_axi_aw_bits_size,
  output [3:0]  io_lsu_axi_aw_bits_cache,
  input         io_lsu_axi_w_ready,
  output        io_lsu_axi_w_valid,
  output [63:0] io_lsu_axi_w_bits_data,
  output [7:0]  io_lsu_axi_w_bits_strb,
  output        io_lsu_axi_b_ready,
  input         io_lsu_axi_b_valid,
  input  [1:0]  io_lsu_axi_b_bits_resp,
  input  [2:0]  io_lsu_axi_b_bits_id,
  input         io_lsu_axi_ar_ready,
  output        io_lsu_axi_ar_valid,
  output [2:0]  io_lsu_axi_ar_bits_id,
  output [31:0] io_lsu_axi_ar_bits_addr,
  output [3:0]  io_lsu_axi_ar_bits_region,
  output [2:0]  io_lsu_axi_ar_bits_size,
  output [3:0]  io_lsu_axi_ar_bits_cache,
  output        io_lsu_axi_r_ready,
  input         io_lsu_axi_r_valid,
  input  [2:0]  io_lsu_axi_r_bits_id,
  input  [63:0] io_lsu_axi_r_bits_data,
  input  [1:0]  io_lsu_axi_r_bits_resp,
  input         io_lsu_bus_clk_en,
  input         io_lsu_bus_clk_en_q,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [3:0]  io_ld_byte_hit_buf_lo,
  output [3:0]  io_ld_byte_hit_buf_hi,
  output [31:0] io_ld_fwddata_buf_lo,
  output [31:0] io_ld_fwddata_buf_hi
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
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_8_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_9_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_10_io_scan_mode; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 352:23]
  wire  rvclkhdr_11_io_scan_mode; // @[lib.scala 352:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[lsu_bus_buffer.scala 72:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[lsu_bus_buffer.scala 73:46]
  reg [31:0] buf_addr_0; // @[lib.scala 358:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 75:74]
  reg  _T_4360; // @[Reg.scala 27:20]
  reg  _T_4357; // @[Reg.scala 27:20]
  reg  _T_4354; // @[Reg.scala 27:20]
  reg  _T_4351; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4360,_T_4357,_T_4354,_T_4351}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[lsu_bus_buffer.scala 75:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[lsu_bus_buffer.scala 75:129]
  wire  _T_6 = _T_4 & _T_5; // @[lsu_bus_buffer.scala 75:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 75:141]
  reg [31:0] buf_addr_1; // @[lib.scala 358:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 75:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[lsu_bus_buffer.scala 75:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[lsu_bus_buffer.scala 75:129]
  wire  _T_13 = _T_11 & _T_12; // @[lsu_bus_buffer.scala 75:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 75:141]
  reg [31:0] buf_addr_2; // @[lib.scala 358:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 75:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[lsu_bus_buffer.scala 75:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[lsu_bus_buffer.scala 75:129]
  wire  _T_20 = _T_18 & _T_19; // @[lsu_bus_buffer.scala 75:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 75:141]
  reg [31:0] buf_addr_3; // @[lib.scala 358:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 75:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[lsu_bus_buffer.scala 75:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[lsu_bus_buffer.scala 75:129]
  wire  _T_27 = _T_25 & _T_26; // @[lsu_bus_buffer.scala 75:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 75:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 76:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[lsu_bus_buffer.scala 76:98]
  wire  _T_34 = _T_32 & _T_5; // @[lsu_bus_buffer.scala 76:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 76:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 76:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[lsu_bus_buffer.scala 76:98]
  wire  _T_41 = _T_39 & _T_12; // @[lsu_bus_buffer.scala 76:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 76:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 76:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[lsu_bus_buffer.scala 76:98]
  wire  _T_48 = _T_46 & _T_19; // @[lsu_bus_buffer.scala 76:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 76:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 76:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[lsu_bus_buffer.scala 76:98]
  wire  _T_55 = _T_53 & _T_26; // @[lsu_bus_buffer.scala 76:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 76:141]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 140:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 140:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 140:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 140:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[lsu_bus_buffer.scala 499:60]
  wire  _T_2621 = buf_state_3 == 3'h2; // @[lsu_bus_buffer.scala 411:93]
  wire  _T_4107 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4130 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4134 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1848; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1848}; // @[lsu_bus_buffer.scala 351:13]
  wire  _T_4141 = obuf_tag0 == 3'h3; // @[lsu_bus_buffer.scala 454:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_358 = {{1'd0}, obuf_tag1}; // @[lsu_bus_buffer.scala 454:104]
  wire  _T_4142 = _GEN_358 == 3'h3; // @[lsu_bus_buffer.scala 454:104]
  wire  _T_4143 = obuf_merge & _T_4142; // @[lsu_bus_buffer.scala 454:91]
  wire  _T_4144 = _T_4141 | _T_4143; // @[lsu_bus_buffer.scala 454:77]
  reg  obuf_valid; // @[lsu_bus_buffer.scala 345:54]
  wire  _T_4145 = _T_4144 & obuf_valid; // @[lsu_bus_buffer.scala 454:135]
  reg  obuf_wr_enQ; // @[lsu_bus_buffer.scala 344:55]
  wire  _T_4146 = _T_4145 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 454:148]
  wire  _GEN_280 = _T_4134 & _T_4146; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4130 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4107 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2622 = _T_2621 & buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 411:103]
  wire  _T_2623 = ~_T_2622; // @[lsu_bus_buffer.scala 411:78]
  wire  _T_2624 = buf_ageQ_3[3] & _T_2623; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2616 = buf_state_2 == 3'h2; // @[lsu_bus_buffer.scala 411:93]
  wire  _T_3914 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3937 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3941 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3948 = obuf_tag0 == 3'h2; // @[lsu_bus_buffer.scala 454:48]
  wire  _T_3949 = _GEN_358 == 3'h2; // @[lsu_bus_buffer.scala 454:104]
  wire  _T_3950 = obuf_merge & _T_3949; // @[lsu_bus_buffer.scala 454:91]
  wire  _T_3951 = _T_3948 | _T_3950; // @[lsu_bus_buffer.scala 454:77]
  wire  _T_3952 = _T_3951 & obuf_valid; // @[lsu_bus_buffer.scala 454:135]
  wire  _T_3953 = _T_3952 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 454:148]
  wire  _GEN_204 = _T_3941 & _T_3953; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3937 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3914 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2617 = _T_2616 & buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 411:103]
  wire  _T_2618 = ~_T_2617; // @[lsu_bus_buffer.scala 411:78]
  wire  _T_2619 = buf_ageQ_3[2] & _T_2618; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2611 = buf_state_1 == 3'h2; // @[lsu_bus_buffer.scala 411:93]
  wire  _T_3721 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3744 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3748 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3755 = obuf_tag0 == 3'h1; // @[lsu_bus_buffer.scala 454:48]
  wire  _T_3756 = _GEN_358 == 3'h1; // @[lsu_bus_buffer.scala 454:104]
  wire  _T_3757 = obuf_merge & _T_3756; // @[lsu_bus_buffer.scala 454:91]
  wire  _T_3758 = _T_3755 | _T_3757; // @[lsu_bus_buffer.scala 454:77]
  wire  _T_3759 = _T_3758 & obuf_valid; // @[lsu_bus_buffer.scala 454:135]
  wire  _T_3760 = _T_3759 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 454:148]
  wire  _GEN_128 = _T_3748 & _T_3760; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3744 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3721 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2612 = _T_2611 & buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 411:103]
  wire  _T_2613 = ~_T_2612; // @[lsu_bus_buffer.scala 411:78]
  wire  _T_2614 = buf_ageQ_3[1] & _T_2613; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2606 = buf_state_0 == 3'h2; // @[lsu_bus_buffer.scala 411:93]
  wire  _T_3528 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3551 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3555 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3562 = obuf_tag0 == 3'h0; // @[lsu_bus_buffer.scala 454:48]
  wire  _T_3563 = _GEN_358 == 3'h0; // @[lsu_bus_buffer.scala 454:104]
  wire  _T_3564 = obuf_merge & _T_3563; // @[lsu_bus_buffer.scala 454:91]
  wire  _T_3565 = _T_3562 | _T_3564; // @[lsu_bus_buffer.scala 454:77]
  wire  _T_3566 = _T_3565 & obuf_valid; // @[lsu_bus_buffer.scala 454:135]
  wire  _T_3567 = _T_3566 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 454:148]
  wire  _GEN_52 = _T_3555 & _T_3567; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3551 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3528 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2607 = _T_2606 & buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 411:103]
  wire  _T_2608 = ~_T_2607; // @[lsu_bus_buffer.scala 411:78]
  wire  _T_2609 = buf_ageQ_3[0] & _T_2608; // @[lsu_bus_buffer.scala 411:76]
  wire [3:0] buf_age_3 = {_T_2624,_T_2619,_T_2614,_T_2609}; // @[Cat.scala 29:58]
  wire  _T_2723 = ~buf_age_3[2]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2725 = _T_2723 & _T_19; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2717 = ~buf_age_3[1]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2719 = _T_2717 & _T_12; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2711 = ~buf_age_3[0]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2713 = _T_2711 & _T_5; // @[lsu_bus_buffer.scala 412:104]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2725,_T_2719,_T_2713}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_256 = |_T_255; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_257 = ~_T_256; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[lsu_bus_buffer.scala 145:97]
  reg [31:0] ibuf_addr; // @[lib.scala 358:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 151:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[lsu_bus_buffer.scala 151:73]
  reg  ibuf_valid; // @[lsu_bus_buffer.scala 238:54]
  wire  _T_514 = _T_513 & ibuf_valid; // @[lsu_bus_buffer.scala 151:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 151:99]
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[lsu_bus_buffer.scala 156:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[lsu_bus_buffer.scala 156:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 145:150]
  wire  _T_261 = _T_258 & _T_260; // @[lsu_bus_buffer.scala 145:148]
  reg [3:0] buf_ageQ_2; // @[lsu_bus_buffer.scala 499:60]
  wire  _T_2601 = buf_ageQ_2[3] & _T_2623; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2596 = buf_ageQ_2[2] & _T_2618; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2591 = buf_ageQ_2[1] & _T_2613; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2586 = buf_ageQ_2[0] & _T_2608; // @[lsu_bus_buffer.scala 411:76]
  wire [3:0] buf_age_2 = {_T_2601,_T_2596,_T_2591,_T_2586}; // @[Cat.scala 29:58]
  wire  _T_2702 = ~buf_age_2[3]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2704 = _T_2702 & _T_26; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2690 = ~buf_age_2[1]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2692 = _T_2690 & _T_12; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2684 = ~buf_age_2[0]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2686 = _T_2684 & _T_5; // @[lsu_bus_buffer.scala 412:104]
  wire [3:0] buf_age_younger_2 = {_T_2704,1'h0,_T_2692,_T_2686}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_248 = |_T_247; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_249 = ~_T_248; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_253 = _T_250 & _T_260; // @[lsu_bus_buffer.scala 145:148]
  reg [3:0] buf_ageQ_1; // @[lsu_bus_buffer.scala 499:60]
  wire  _T_2578 = buf_ageQ_1[3] & _T_2623; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2573 = buf_ageQ_1[2] & _T_2618; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2568 = buf_ageQ_1[1] & _T_2613; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2563 = buf_ageQ_1[0] & _T_2608; // @[lsu_bus_buffer.scala 411:76]
  wire [3:0] buf_age_1 = {_T_2578,_T_2573,_T_2568,_T_2563}; // @[Cat.scala 29:58]
  wire  _T_2675 = ~buf_age_1[3]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2677 = _T_2675 & _T_26; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2669 = ~buf_age_1[2]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2671 = _T_2669 & _T_19; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2657 = ~buf_age_1[0]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2659 = _T_2657 & _T_5; // @[lsu_bus_buffer.scala 412:104]
  wire [3:0] buf_age_younger_1 = {_T_2677,_T_2671,1'h0,_T_2659}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_240 = |_T_239; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_241 = ~_T_240; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_245 = _T_242 & _T_260; // @[lsu_bus_buffer.scala 145:148]
  reg [3:0] buf_ageQ_0; // @[lsu_bus_buffer.scala 499:60]
  wire  _T_2555 = buf_ageQ_0[3] & _T_2623; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2550 = buf_ageQ_0[2] & _T_2618; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2545 = buf_ageQ_0[1] & _T_2613; // @[lsu_bus_buffer.scala 411:76]
  wire  _T_2540 = buf_ageQ_0[0] & _T_2608; // @[lsu_bus_buffer.scala 411:76]
  wire [3:0] buf_age_0 = {_T_2555,_T_2550,_T_2545,_T_2540}; // @[Cat.scala 29:58]
  wire  _T_2648 = ~buf_age_0[3]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2650 = _T_2648 & _T_26; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2642 = ~buf_age_0[2]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2644 = _T_2642 & _T_19; // @[lsu_bus_buffer.scala 412:104]
  wire  _T_2636 = ~buf_age_0[1]; // @[lsu_bus_buffer.scala 412:89]
  wire  _T_2638 = _T_2636 & _T_12; // @[lsu_bus_buffer.scala 412:104]
  wire [3:0] buf_age_younger_0 = {_T_2650,_T_2644,_T_2638,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_232 = |_T_231; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_233 = ~_T_232; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_237 = _T_234 & _T_260; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[lsu_bus_buffer.scala 137:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 137:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 140:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_291 = |_T_290; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_292 = ~_T_291; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 145:150]
  wire  _T_296 = _T_293 & _T_295; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_283 = |_T_282; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_284 = ~_T_283; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_288 = _T_285 & _T_295; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_275 = |_T_274; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_276 = ~_T_275; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_280 = _T_277 & _T_295; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_267 = |_T_266; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_268 = ~_T_267; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_272 = _T_269 & _T_295; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[lsu_bus_buffer.scala 137:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 137:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 140:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_326 = |_T_325; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_327 = ~_T_326; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 145:150]
  wire  _T_331 = _T_328 & _T_330; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_318 = |_T_317; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_319 = ~_T_318; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_323 = _T_320 & _T_330; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_310 = |_T_309; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_311 = ~_T_310; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_315 = _T_312 & _T_330; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_302 = |_T_301; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_303 = ~_T_302; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_307 = _T_304 & _T_330; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[lsu_bus_buffer.scala 137:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 137:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 140:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 140:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 140:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_361 = |_T_360; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_362 = ~_T_361; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 145:150]
  wire  _T_366 = _T_363 & _T_365; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_353 = |_T_352; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_354 = ~_T_353; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_358 = _T_355 & _T_365; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_345 = |_T_344; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_346 = ~_T_345; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_350 = _T_347 & _T_365; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 145:122]
  wire  _T_337 = |_T_336; // @[lsu_bus_buffer.scala 145:144]
  wire  _T_338 = ~_T_337; // @[lsu_bus_buffer.scala 145:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[lsu_bus_buffer.scala 145:97]
  wire  _T_342 = _T_339 & _T_365; // @[lsu_bus_buffer.scala 145:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[lsu_bus_buffer.scala 137:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 137:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 141:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_396 = |_T_395; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_397 = ~_T_396; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 152:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[lsu_bus_buffer.scala 152:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[lsu_bus_buffer.scala 152:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 152:99]
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[lsu_bus_buffer.scala 157:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[lsu_bus_buffer.scala 157:69]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 146:150]
  wire  _T_401 = _T_398 & _T_400; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_388 = |_T_387; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_389 = ~_T_388; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_393 = _T_390 & _T_400; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_380 = |_T_379; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_381 = ~_T_380; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_385 = _T_382 & _T_400; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_372 = |_T_371; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_373 = ~_T_372; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_377 = _T_374 & _T_400; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[lsu_bus_buffer.scala 138:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 138:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 141:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_431 = |_T_430; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_432 = ~_T_431; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 146:150]
  wire  _T_436 = _T_433 & _T_435; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_423 = |_T_422; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_424 = ~_T_423; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_428 = _T_425 & _T_435; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_415 = |_T_414; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_416 = ~_T_415; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_420 = _T_417 & _T_435; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_407 = |_T_406; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_408 = ~_T_407; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_412 = _T_409 & _T_435; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[lsu_bus_buffer.scala 138:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 138:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 141:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_466 = |_T_465; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_467 = ~_T_466; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 146:150]
  wire  _T_471 = _T_468 & _T_470; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_458 = |_T_457; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_459 = ~_T_458; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_463 = _T_460 & _T_470; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_450 = |_T_449; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_451 = ~_T_450; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_455 = _T_452 & _T_470; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_442 = |_T_441; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_443 = ~_T_442; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_447 = _T_444 & _T_470; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[lsu_bus_buffer.scala 138:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 138:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 141:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 141:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 141:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_501 = |_T_500; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_502 = ~_T_501; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 146:150]
  wire  _T_506 = _T_503 & _T_505; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_493 = |_T_492; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_494 = ~_T_493; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_498 = _T_495 & _T_505; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_485 = |_T_484; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_486 = ~_T_485; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_490 = _T_487 & _T_505; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 146:122]
  wire  _T_477 = |_T_476; // @[lsu_bus_buffer.scala 146:144]
  wire  _T_478 = ~_T_477; // @[lsu_bus_buffer.scala 146:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[lsu_bus_buffer.scala 146:97]
  wire  _T_482 = _T_479 & _T_505; // @[lsu_bus_buffer.scala 146:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[lsu_bus_buffer.scala 138:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 138:77]
  wire [2:0] _T_84 = {_T_82,_T_79,_T_76}; // @[Cat.scala 29:58]
  wire [7:0] _T_530 = ld_byte_ibuf_hit_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_533 = ld_byte_ibuf_hit_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_536 = ld_byte_ibuf_hit_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_539 = ld_byte_ibuf_hit_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_lo_initial = {_T_539,_T_536,_T_533,_T_530}; // @[Cat.scala 29:58]
  wire [7:0] _T_544 = ld_byte_ibuf_hit_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_547 = ld_byte_ibuf_hit_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_550 = ld_byte_ibuf_hit_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_553 = ld_byte_ibuf_hit_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ld_fwddata_buf_hi_initial = {_T_553,_T_550,_T_547,_T_544}; // @[Cat.scala 29:58]
  wire [7:0] _T_558 = ld_byte_hitvecfn_lo_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_0; // @[lib.scala 358:16]
  wire [7:0] _T_560 = _T_558 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 164:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[lib.scala 358:16]
  wire [7:0] _T_565 = _T_563 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 164:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[lib.scala 358:16]
  wire [7:0] _T_570 = _T_568 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 164:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[lib.scala 358:16]
  wire [7:0] _T_575 = _T_573 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 164:91]
  wire [7:0] _T_576 = _T_560 | _T_565; // @[lsu_bus_buffer.scala 164:123]
  wire [7:0] _T_577 = _T_576 | _T_570; // @[lsu_bus_buffer.scala 164:123]
  wire [7:0] _T_578 = _T_577 | _T_575; // @[lsu_bus_buffer.scala 164:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 165:65]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 165:65]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 165:65]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 165:65]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[lsu_bus_buffer.scala 165:97]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[lsu_bus_buffer.scala 165:97]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[lsu_bus_buffer.scala 165:97]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 166:65]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 166:65]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 166:65]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 166:65]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[lsu_bus_buffer.scala 166:97]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[lsu_bus_buffer.scala 166:97]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[lsu_bus_buffer.scala 166:97]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 167:65]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 167:65]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 167:65]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 167:65]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[lsu_bus_buffer.scala 167:97]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[lsu_bus_buffer.scala 167:97]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[lsu_bus_buffer.scala 167:97]
  wire [31:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[lib.scala 358:16]
  wire [31:0] _T_651 = ld_fwddata_buf_lo_initial & ibuf_data; // @[lsu_bus_buffer.scala 168:32]
  wire [7:0] _T_655 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_657 = _T_655 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 170:91]
  wire [7:0] _T_660 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_662 = _T_660 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 170:91]
  wire [7:0] _T_665 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_667 = _T_665 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 170:91]
  wire [7:0] _T_670 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_672 = _T_670 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 170:91]
  wire [7:0] _T_673 = _T_657 | _T_662; // @[lsu_bus_buffer.scala 170:123]
  wire [7:0] _T_674 = _T_673 | _T_667; // @[lsu_bus_buffer.scala 170:123]
  wire [7:0] _T_675 = _T_674 | _T_672; // @[lsu_bus_buffer.scala 170:123]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_680 = _T_678 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_685 = _T_683 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_690 = _T_688 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_695 = _T_693 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_696 = _T_680 | _T_685; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_697 = _T_696 | _T_690; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_698 = _T_697 | _T_695; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 172:65]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 172:65]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 172:65]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 172:65]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[lsu_bus_buffer.scala 172:97]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[lsu_bus_buffer.scala 172:97]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[lsu_bus_buffer.scala 172:97]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 173:65]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 173:65]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 173:65]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 173:65]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[lsu_bus_buffer.scala 173:97]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[lsu_bus_buffer.scala 173:97]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[lsu_bus_buffer.scala 173:97]
  wire [31:0] _T_747 = {_T_675,_T_698,_T_721,_T_744}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = ld_fwddata_buf_hi_initial & ibuf_data; // @[lsu_bus_buffer.scala 174:32]
  wire [3:0] _T_750 = io_lsu_pkt_r_bits_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = io_lsu_pkt_r_bits_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_752 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_753 = _T_750 | _T_751; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_753 | _T_752; // @[Mux.scala 27:72]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h0; // @[lsu_bus_buffer.scala 181:55]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h1; // @[lsu_bus_buffer.scala 182:24]
  wire [3:0] _T_760 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_762 = io_lsu_addr_r[1:0] == 2'h2; // @[lsu_bus_buffer.scala 183:24]
  wire [3:0] _T_764 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_766 = io_lsu_addr_r[1:0] == 2'h3; // @[lsu_bus_buffer.scala 184:24]
  wire [3:0] _T_768 = {1'h0,ldst_byteen_r[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_770 = _T_758 ? _T_760 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_771 = _T_762 ? _T_764 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_772 = _T_766 ? _T_768 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_774 = _T_770 | _T_771; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_hi_r = _T_774 | _T_772; // @[Mux.scala 27:72]
  wire [3:0] _T_781 = {ldst_byteen_r[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_785 = {ldst_byteen_r[1:0],2'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_789 = {ldst_byteen_r[0],3'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_790 = _T_756 ? ldst_byteen_r : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_791 = _T_758 ? _T_781 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_792 = _T_762 ? _T_785 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_793 = _T_766 ? _T_789 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_794 = _T_790 | _T_791; // @[Mux.scala 27:72]
  wire [3:0] _T_795 = _T_794 | _T_792; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_lo_r = _T_795 | _T_793; // @[Mux.scala 27:72]
  wire [31:0] _T_802 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
  wire [31:0] _T_806 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_810 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_812 = _T_758 ? _T_802 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_813 = _T_762 ? _T_806 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_814 = _T_766 ? _T_810 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_816 = _T_812 | _T_813; // @[Mux.scala 27:72]
  wire [31:0] store_data_hi_r = _T_816 | _T_814; // @[Mux.scala 27:72]
  wire [31:0] _T_823 = {io_store_data_r[23:0],8'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_827 = {io_store_data_r[15:0],16'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_831 = {io_store_data_r[7:0],24'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_832 = _T_756 ? io_store_data_r : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_833 = _T_758 ? _T_823 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_834 = _T_762 ? _T_827 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_835 = _T_766 ? _T_831 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_836 = _T_832 | _T_833; // @[Mux.scala 27:72]
  wire [31:0] _T_837 = _T_836 | _T_834; // @[Mux.scala 27:72]
  wire [31:0] store_data_lo_r = _T_837 | _T_835; // @[Mux.scala 27:72]
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[lsu_bus_buffer.scala 201:40]
  wire  _T_844 = ~io_lsu_addr_r[0]; // @[lsu_bus_buffer.scala 203:31]
  wire  _T_845 = io_lsu_pkt_r_bits_word & _T_756; // @[Mux.scala 27:72]
  wire  _T_846 = io_lsu_pkt_r_bits_half & _T_844; // @[Mux.scala 27:72]
  wire  _T_848 = _T_845 | _T_846; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_848 | io_lsu_pkt_r_bits_by; // @[Mux.scala 27:72]
  wire  _T_850 = io_lsu_pkt_r_bits_load | io_no_word_merge_r; // @[lsu_bus_buffer.scala 205:60]
  wire  _T_851 = io_lsu_busreq_r & _T_850; // @[lsu_bus_buffer.scala 205:34]
  wire  _T_852 = ~ibuf_valid; // @[lsu_bus_buffer.scala 205:84]
  wire  ibuf_byp = _T_851 & _T_852; // @[lsu_bus_buffer.scala 205:82]
  wire  _T_853 = io_lsu_busreq_r & io_lsu_commit_r; // @[lsu_bus_buffer.scala 206:36]
  wire  _T_854 = ~ibuf_byp; // @[lsu_bus_buffer.scala 206:56]
  wire  ibuf_wr_en = _T_853 & _T_854; // @[lsu_bus_buffer.scala 206:54]
  wire  _T_855 = ~ibuf_wr_en; // @[lsu_bus_buffer.scala 208:36]
  reg [2:0] ibuf_timer; // @[lsu_bus_buffer.scala 251:55]
  wire  _T_864 = ibuf_timer == 3'h7; // @[lsu_bus_buffer.scala 214:62]
  wire  _T_865 = ibuf_wr_en | _T_864; // @[lsu_bus_buffer.scala 214:48]
  wire  _T_929 = _T_853 & io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 233:54]
  wire  _T_930 = _T_929 & ibuf_valid; // @[lsu_bus_buffer.scala 233:80]
  wire  _T_931 = _T_930 & ibuf_write; // @[lsu_bus_buffer.scala 233:93]
  wire  _T_934 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 233:129]
  wire  _T_935 = _T_931 & _T_934; // @[lsu_bus_buffer.scala 233:106]
  wire  _T_936 = ~io_is_sideeffects_r; // @[lsu_bus_buffer.scala 233:152]
  wire  _T_937 = _T_935 & _T_936; // @[lsu_bus_buffer.scala 233:150]
  wire  _T_938 = ~io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 233:175]
  wire  ibuf_merge_en = _T_937 & _T_938; // @[lsu_bus_buffer.scala 233:173]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[lsu_bus_buffer.scala 234:20]
  wire  _T_866 = ibuf_merge_en & ibuf_merge_in; // @[lsu_bus_buffer.scala 214:98]
  wire  _T_867 = ~_T_866; // @[lsu_bus_buffer.scala 214:82]
  wire  _T_868 = _T_865 & _T_867; // @[lsu_bus_buffer.scala 214:80]
  wire  _T_869 = _T_868 | ibuf_byp; // @[lsu_bus_buffer.scala 215:5]
  wire  _T_857 = ~io_lsu_busreq_r; // @[lsu_bus_buffer.scala 209:44]
  wire  _T_858 = io_lsu_busreq_m & _T_857; // @[lsu_bus_buffer.scala 209:42]
  wire  _T_859 = _T_858 & ibuf_valid; // @[lsu_bus_buffer.scala 209:61]
  wire  _T_862 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[lsu_bus_buffer.scala 209:120]
  wire  _T_863 = io_lsu_pkt_m_bits_load | _T_862; // @[lsu_bus_buffer.scala 209:100]
  wire  ibuf_force_drain = _T_859 & _T_863; // @[lsu_bus_buffer.scala 209:74]
  wire  _T_870 = _T_869 | ibuf_force_drain; // @[lsu_bus_buffer.scala 215:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_871 = _T_870 | ibuf_sideeffect; // @[lsu_bus_buffer.scala 215:35]
  wire  _T_872 = ~ibuf_write; // @[lsu_bus_buffer.scala 215:55]
  wire  _T_873 = _T_871 | _T_872; // @[lsu_bus_buffer.scala 215:53]
  wire  _T_874 = _T_873 | io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 215:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_874; // @[lsu_bus_buffer.scala 214:32]
  wire  _T_856 = ibuf_drain_vld & _T_855; // @[lsu_bus_buffer.scala 208:34]
  wire  ibuf_rst = _T_856 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 208:49]
  reg [1:0] WrPtr1_r; // @[lsu_bus_buffer.scala 615:49]
  reg [1:0] WrPtr0_r; // @[lsu_bus_buffer.scala 614:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_bits_word,io_lsu_pkt_r_bits_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_881 = ibuf_byteen | ldst_byteen_lo_r; // @[lsu_bus_buffer.scala 224:77]
  wire [7:0] _T_889 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 229:8]
  wire [7:0] _T_892 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[lsu_bus_buffer.scala 230:8]
  wire [7:0] _T_893 = _T_866 ? _T_889 : _T_892; // @[lsu_bus_buffer.scala 228:46]
  wire [7:0] _T_898 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 229:8]
  wire [7:0] _T_901 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[lsu_bus_buffer.scala 230:8]
  wire [7:0] _T_902 = _T_866 ? _T_898 : _T_901; // @[lsu_bus_buffer.scala 228:46]
  wire [7:0] _T_907 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 229:8]
  wire [7:0] _T_910 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[lsu_bus_buffer.scala 230:8]
  wire [7:0] _T_911 = _T_866 ? _T_907 : _T_910; // @[lsu_bus_buffer.scala 228:46]
  wire [7:0] _T_916 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 229:8]
  wire [7:0] _T_919 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[lsu_bus_buffer.scala 230:8]
  wire [7:0] _T_920 = _T_866 ? _T_916 : _T_919; // @[lsu_bus_buffer.scala 228:46]
  wire [23:0] _T_922 = {_T_920,_T_911,_T_902}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[lsu_bus_buffer.scala 231:59]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[lsu_bus_buffer.scala 231:93]
  wire  _T_941 = ~ibuf_merge_in; // @[lsu_bus_buffer.scala 235:65]
  wire  _T_942 = ibuf_merge_en & _T_941; // @[lsu_bus_buffer.scala 235:63]
  wire  _T_945 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[lsu_bus_buffer.scala 235:96]
  wire  _T_947 = _T_942 ? _T_945 : ibuf_byteen[0]; // @[lsu_bus_buffer.scala 235:48]
  wire  _T_952 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[lsu_bus_buffer.scala 235:96]
  wire  _T_954 = _T_942 ? _T_952 : ibuf_byteen[1]; // @[lsu_bus_buffer.scala 235:48]
  wire  _T_959 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[lsu_bus_buffer.scala 235:96]
  wire  _T_961 = _T_942 ? _T_959 : ibuf_byteen[2]; // @[lsu_bus_buffer.scala 235:48]
  wire  _T_966 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[lsu_bus_buffer.scala 235:96]
  wire  _T_968 = _T_942 ? _T_966 : ibuf_byteen[3]; // @[lsu_bus_buffer.scala 235:48]
  wire [3:0] ibuf_byteen_out = {_T_968,_T_961,_T_954,_T_947}; // @[Cat.scala 29:58]
  wire [7:0] _T_978 = _T_942 ? _T_889 : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 236:45]
  wire [7:0] _T_986 = _T_942 ? _T_898 : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 236:45]
  wire [7:0] _T_994 = _T_942 ? _T_907 : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 236:45]
  wire [7:0] _T_1002 = _T_942 ? _T_916 : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 236:45]
  wire [31:0] ibuf_data_out = {_T_1002,_T_994,_T_986,_T_978}; // @[Cat.scala 29:58]
  wire  _T_1005 = ibuf_wr_en | ibuf_valid; // @[lsu_bus_buffer.scala 238:58]
  wire  _T_1006 = ~ibuf_rst; // @[lsu_bus_buffer.scala 238:93]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4446 = buf_write[3] & _T_2621; // @[lsu_bus_buffer.scala 521:64]
  wire  _T_4447 = ~buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 521:91]
  wire  _T_4448 = _T_4446 & _T_4447; // @[lsu_bus_buffer.scala 521:89]
  wire  _T_4441 = buf_write[2] & _T_2616; // @[lsu_bus_buffer.scala 521:64]
  wire  _T_4442 = ~buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 521:91]
  wire  _T_4443 = _T_4441 & _T_4442; // @[lsu_bus_buffer.scala 521:89]
  wire [1:0] _T_4449 = _T_4448 + _T_4443; // @[lsu_bus_buffer.scala 521:142]
  wire  _T_4436 = buf_write[1] & _T_2611; // @[lsu_bus_buffer.scala 521:64]
  wire  _T_4437 = ~buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 521:91]
  wire  _T_4438 = _T_4436 & _T_4437; // @[lsu_bus_buffer.scala 521:89]
  wire [1:0] _GEN_362 = {{1'd0}, _T_4438}; // @[lsu_bus_buffer.scala 521:142]
  wire [2:0] _T_4450 = _T_4449 + _GEN_362; // @[lsu_bus_buffer.scala 521:142]
  wire  _T_4431 = buf_write[0] & _T_2606; // @[lsu_bus_buffer.scala 521:64]
  wire  _T_4432 = ~buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 521:91]
  wire  _T_4433 = _T_4431 & _T_4432; // @[lsu_bus_buffer.scala 521:89]
  wire [2:0] _GEN_363 = {{2'd0}, _T_4433}; // @[lsu_bus_buffer.scala 521:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4450 + _GEN_363; // @[lsu_bus_buffer.scala 521:142]
  wire  _T_1016 = buf_numvld_wrcmd_any == 4'h1; // @[lsu_bus_buffer.scala 261:43]
  wire  _T_4463 = _T_2621 & _T_4447; // @[lsu_bus_buffer.scala 522:73]
  wire  _T_4460 = _T_2616 & _T_4442; // @[lsu_bus_buffer.scala 522:73]
  wire [1:0] _T_4464 = _T_4463 + _T_4460; // @[lsu_bus_buffer.scala 522:126]
  wire  _T_4457 = _T_2611 & _T_4437; // @[lsu_bus_buffer.scala 522:73]
  wire [1:0] _GEN_364 = {{1'd0}, _T_4457}; // @[lsu_bus_buffer.scala 522:126]
  wire [2:0] _T_4465 = _T_4464 + _GEN_364; // @[lsu_bus_buffer.scala 522:126]
  wire  _T_4454 = _T_2606 & _T_4432; // @[lsu_bus_buffer.scala 522:73]
  wire [2:0] _GEN_365 = {{2'd0}, _T_4454}; // @[lsu_bus_buffer.scala 522:126]
  wire [3:0] buf_numvld_cmd_any = _T_4465 + _GEN_365; // @[lsu_bus_buffer.scala 522:126]
  wire  _T_1017 = buf_numvld_cmd_any == 4'h1; // @[lsu_bus_buffer.scala 261:72]
  wire  _T_1018 = _T_1016 & _T_1017; // @[lsu_bus_buffer.scala 261:51]
  reg [2:0] obuf_wr_timer; // @[lsu_bus_buffer.scala 360:54]
  wire  _T_1019 = obuf_wr_timer != 3'h7; // @[lsu_bus_buffer.scala 261:97]
  wire  _T_1020 = _T_1018 & _T_1019; // @[lsu_bus_buffer.scala 261:80]
  wire  _T_1022 = _T_1020 & _T_938; // @[lsu_bus_buffer.scala 261:114]
  wire  _T_1979 = |buf_age_3; // @[lsu_bus_buffer.scala 377:58]
  wire  _T_1980 = ~_T_1979; // @[lsu_bus_buffer.scala 377:45]
  wire  _T_1982 = _T_1980 & _T_2621; // @[lsu_bus_buffer.scala 377:63]
  wire  _T_1984 = _T_1982 & _T_4447; // @[lsu_bus_buffer.scala 377:88]
  wire  _T_1973 = |buf_age_2; // @[lsu_bus_buffer.scala 377:58]
  wire  _T_1974 = ~_T_1973; // @[lsu_bus_buffer.scala 377:45]
  wire  _T_1976 = _T_1974 & _T_2616; // @[lsu_bus_buffer.scala 377:63]
  wire  _T_1978 = _T_1976 & _T_4442; // @[lsu_bus_buffer.scala 377:88]
  wire  _T_1967 = |buf_age_1; // @[lsu_bus_buffer.scala 377:58]
  wire  _T_1968 = ~_T_1967; // @[lsu_bus_buffer.scala 377:45]
  wire  _T_1970 = _T_1968 & _T_2611; // @[lsu_bus_buffer.scala 377:63]
  wire  _T_1972 = _T_1970 & _T_4437; // @[lsu_bus_buffer.scala 377:88]
  wire  _T_1961 = |buf_age_0; // @[lsu_bus_buffer.scala 377:58]
  wire  _T_1962 = ~_T_1961; // @[lsu_bus_buffer.scala 377:45]
  wire  _T_1964 = _T_1962 & _T_2606; // @[lsu_bus_buffer.scala 377:63]
  wire  _T_1966 = _T_1964 & _T_4432; // @[lsu_bus_buffer.scala 377:88]
  wire [3:0] CmdPtr0Dec = {_T_1984,_T_1978,_T_1972,_T_1966}; // @[Cat.scala 29:58]
  wire [7:0] _T_2054 = {4'h0,_T_1984,_T_1978,_T_1972,_T_1966}; // @[Cat.scala 29:58]
  wire  _T_2057 = _T_2054[4] | _T_2054[5]; // @[lsu_bus_buffer.scala 385:42]
  wire  _T_2059 = _T_2057 | _T_2054[6]; // @[lsu_bus_buffer.scala 385:48]
  wire  _T_2061 = _T_2059 | _T_2054[7]; // @[lsu_bus_buffer.scala 385:54]
  wire  _T_2064 = _T_2054[2] | _T_2054[3]; // @[lsu_bus_buffer.scala 385:67]
  wire  _T_2066 = _T_2064 | _T_2054[6]; // @[lsu_bus_buffer.scala 385:73]
  wire  _T_2068 = _T_2066 | _T_2054[7]; // @[lsu_bus_buffer.scala 385:79]
  wire  _T_2071 = _T_2054[1] | _T_2054[3]; // @[lsu_bus_buffer.scala 385:92]
  wire  _T_2073 = _T_2071 | _T_2054[5]; // @[lsu_bus_buffer.scala 385:98]
  wire  _T_2075 = _T_2073 | _T_2054[7]; // @[lsu_bus_buffer.scala 385:104]
  wire [2:0] _T_2077 = {_T_2061,_T_2068,_T_2075}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2077[1:0]; // @[lsu_bus_buffer.scala 390:11]
  wire  _T_1023 = CmdPtr0 == 2'h0; // @[lsu_bus_buffer.scala 262:114]
  wire  _T_1024 = CmdPtr0 == 2'h1; // @[lsu_bus_buffer.scala 262:114]
  wire  _T_1025 = CmdPtr0 == 2'h2; // @[lsu_bus_buffer.scala 262:114]
  wire  _T_1026 = CmdPtr0 == 2'h3; // @[lsu_bus_buffer.scala 262:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1027 = _T_1023 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1028 = _T_1024 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1029 = _T_1025 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1030 = _T_1026 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1031 = _T_1027 | _T_1028; // @[Mux.scala 27:72]
  wire  _T_1032 = _T_1031 | _T_1029; // @[Mux.scala 27:72]
  wire  _T_1033 = _T_1032 | _T_1030; // @[Mux.scala 27:72]
  wire  _T_1035 = ~_T_1033; // @[lsu_bus_buffer.scala 262:31]
  wire  _T_1036 = _T_1022 & _T_1035; // @[lsu_bus_buffer.scala 262:29]
  reg  _T_4330; // @[Reg.scala 27:20]
  reg  _T_4327; // @[Reg.scala 27:20]
  reg  _T_4324; // @[Reg.scala 27:20]
  reg  _T_4321; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4330,_T_4327,_T_4324,_T_4321}; // @[Cat.scala 29:58]
  wire  _T_1045 = _T_1023 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1046 = _T_1024 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1047 = _T_1025 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1048 = _T_1026 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1049 = _T_1045 | _T_1046; // @[Mux.scala 27:72]
  wire  _T_1050 = _T_1049 | _T_1047; // @[Mux.scala 27:72]
  wire  _T_1051 = _T_1050 | _T_1048; // @[Mux.scala 27:72]
  wire  _T_1053 = ~_T_1051; // @[lsu_bus_buffer.scala 263:5]
  wire  _T_1054 = _T_1036 & _T_1053; // @[lsu_bus_buffer.scala 262:140]
  wire  _T_1065 = _T_858 & _T_852; // @[lsu_bus_buffer.scala 265:58]
  wire  _T_1067 = _T_1065 & _T_1017; // @[lsu_bus_buffer.scala 265:72]
  wire [29:0] _T_1077 = _T_1023 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1078 = _T_1024 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1081 = _T_1077 | _T_1078; // @[Mux.scala 27:72]
  wire [29:0] _T_1079 = _T_1025 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1082 = _T_1081 | _T_1079; // @[Mux.scala 27:72]
  wire [29:0] _T_1080 = _T_1026 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1083 = _T_1082 | _T_1080; // @[Mux.scala 27:72]
  wire  _T_1085 = io_lsu_addr_m[31:2] != _T_1083; // @[lsu_bus_buffer.scala 265:123]
  wire  obuf_force_wr_en = _T_1067 & _T_1085; // @[lsu_bus_buffer.scala 265:101]
  wire  _T_1055 = ~obuf_force_wr_en; // @[lsu_bus_buffer.scala 263:119]
  wire  obuf_wr_wait = _T_1054 & _T_1055; // @[lsu_bus_buffer.scala 263:117]
  wire  _T_1056 = |buf_numvld_cmd_any; // @[lsu_bus_buffer.scala 264:75]
  wire  _T_1057 = obuf_wr_timer < 3'h7; // @[lsu_bus_buffer.scala 264:95]
  wire  _T_1058 = _T_1056 & _T_1057; // @[lsu_bus_buffer.scala 264:79]
  wire [2:0] _T_1060 = obuf_wr_timer + 3'h1; // @[lsu_bus_buffer.scala 264:123]
  wire  _T_4482 = buf_state_3 == 3'h1; // @[lsu_bus_buffer.scala 523:63]
  wire  _T_4486 = _T_4482 | _T_4463; // @[lsu_bus_buffer.scala 523:74]
  wire  _T_4477 = buf_state_2 == 3'h1; // @[lsu_bus_buffer.scala 523:63]
  wire  _T_4481 = _T_4477 | _T_4460; // @[lsu_bus_buffer.scala 523:74]
  wire [1:0] _T_4487 = _T_4486 + _T_4481; // @[lsu_bus_buffer.scala 523:154]
  wire  _T_4472 = buf_state_1 == 3'h1; // @[lsu_bus_buffer.scala 523:63]
  wire  _T_4476 = _T_4472 | _T_4457; // @[lsu_bus_buffer.scala 523:74]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4476}; // @[lsu_bus_buffer.scala 523:154]
  wire [2:0] _T_4488 = _T_4487 + _GEN_366; // @[lsu_bus_buffer.scala 523:154]
  wire  _T_4467 = buf_state_0 == 3'h1; // @[lsu_bus_buffer.scala 523:63]
  wire  _T_4471 = _T_4467 | _T_4454; // @[lsu_bus_buffer.scala 523:74]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4471}; // @[lsu_bus_buffer.scala 523:154]
  wire [3:0] buf_numvld_pend_any = _T_4488 + _GEN_367; // @[lsu_bus_buffer.scala 523:154]
  wire  _T_1087 = buf_numvld_pend_any == 4'h0; // @[lsu_bus_buffer.scala 267:53]
  wire  _T_1088 = ibuf_byp & _T_1087; // @[lsu_bus_buffer.scala 267:31]
  wire  _T_1089 = ~io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 267:64]
  wire  _T_1090 = _T_1089 | io_no_dword_merge_r; // @[lsu_bus_buffer.scala 267:89]
  wire  ibuf_buf_byp = _T_1088 & _T_1090; // @[lsu_bus_buffer.scala 267:61]
  wire  _T_1091 = ibuf_buf_byp & io_lsu_commit_r; // @[lsu_bus_buffer.scala 282:32]
  wire  _T_4778 = buf_state_0 == 3'h3; // @[lsu_bus_buffer.scala 551:62]
  wire  _T_4780 = _T_4778 & buf_sideeffect[0]; // @[lsu_bus_buffer.scala 551:73]
  wire  _T_4781 = _T_4780 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 551:93]
  wire  _T_4782 = buf_state_1 == 3'h3; // @[lsu_bus_buffer.scala 551:62]
  wire  _T_4784 = _T_4782 & buf_sideeffect[1]; // @[lsu_bus_buffer.scala 551:73]
  wire  _T_4785 = _T_4784 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 551:93]
  wire  _T_4794 = _T_4781 | _T_4785; // @[lsu_bus_buffer.scala 551:153]
  wire  _T_4786 = buf_state_2 == 3'h3; // @[lsu_bus_buffer.scala 551:62]
  wire  _T_4788 = _T_4786 & buf_sideeffect[2]; // @[lsu_bus_buffer.scala 551:73]
  wire  _T_4789 = _T_4788 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 551:93]
  wire  _T_4795 = _T_4794 | _T_4789; // @[lsu_bus_buffer.scala 551:153]
  wire  _T_4790 = buf_state_3 == 3'h3; // @[lsu_bus_buffer.scala 551:62]
  wire  _T_4792 = _T_4790 & buf_sideeffect[3]; // @[lsu_bus_buffer.scala 551:73]
  wire  _T_4793 = _T_4792 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 551:93]
  wire  _T_4796 = _T_4795 | _T_4793; // @[lsu_bus_buffer.scala 551:153]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_4797 = obuf_valid & obuf_sideeffect; // @[lsu_bus_buffer.scala 551:171]
  wire  _T_4798 = _T_4797 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 551:189]
  wire  bus_sideeffect_pend = _T_4796 | _T_4798; // @[lsu_bus_buffer.scala 551:157]
  wire  _T_1092 = io_is_sideeffects_r & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 282:74]
  wire  _T_1093 = ~_T_1092; // @[lsu_bus_buffer.scala 282:52]
  wire  _T_1094 = _T_1091 & _T_1093; // @[lsu_bus_buffer.scala 282:50]
  wire [2:0] _T_1099 = _T_1023 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1100 = _T_1024 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1103 = _T_1099 | _T_1100; // @[Mux.scala 27:72]
  wire [2:0] _T_1101 = _T_1025 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire [2:0] _T_1102 = _T_1026 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1105 = _T_1104 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1105 == 3'h2; // @[lsu_bus_buffer.scala 283:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[lsu_bus_buffer.scala 382:31]
  wire  _T_1108 = _T_1107 & found_cmdptr0; // @[lsu_bus_buffer.scala 283:47]
  wire [3:0] _T_1111 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1120 = _T_1023 & _T_1111[0]; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1024 & _T_1111[1]; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1025 & _T_1111[2]; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1026 & _T_1111[3]; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = ~_T_1126; // @[lsu_bus_buffer.scala 284:23]
  wire  _T_1129 = _T_1108 & _T_1128; // @[lsu_bus_buffer.scala 284:21]
  wire  _T_1146 = _T_1051 & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 284:141]
  wire  _T_1147 = ~_T_1146; // @[lsu_bus_buffer.scala 284:105]
  wire  _T_1148 = _T_1129 & _T_1147; // @[lsu_bus_buffer.scala 284:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1151 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1160 = _T_1023 & _T_1151[0]; // @[Mux.scala 27:72]
  wire  _T_1161 = _T_1024 & _T_1151[1]; // @[Mux.scala 27:72]
  wire  _T_1164 = _T_1160 | _T_1161; // @[Mux.scala 27:72]
  wire  _T_1162 = _T_1025 & _T_1151[2]; // @[Mux.scala 27:72]
  wire  _T_1165 = _T_1164 | _T_1162; // @[Mux.scala 27:72]
  wire  _T_1163 = _T_1026 & _T_1151[3]; // @[Mux.scala 27:72]
  wire  _T_1166 = _T_1165 | _T_1163; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1170 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1179 = _T_1023 & _T_1170[0]; // @[Mux.scala 27:72]
  wire  _T_1180 = _T_1024 & _T_1170[1]; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1179 | _T_1180; // @[Mux.scala 27:72]
  wire  _T_1181 = _T_1025 & _T_1170[2]; // @[Mux.scala 27:72]
  wire  _T_1184 = _T_1183 | _T_1181; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1026 & _T_1170[3]; // @[Mux.scala 27:72]
  wire  _T_1185 = _T_1184 | _T_1182; // @[Mux.scala 27:72]
  wire  _T_1187 = _T_1166 & _T_1185; // @[lsu_bus_buffer.scala 285:77]
  wire  _T_1196 = _T_1023 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1197 = _T_1024 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1196 | _T_1197; // @[Mux.scala 27:72]
  wire  _T_1198 = _T_1025 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1200 | _T_1198; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1026 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1201 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1204 = ~_T_1202; // @[lsu_bus_buffer.scala 285:150]
  wire  _T_1205 = _T_1187 & _T_1204; // @[lsu_bus_buffer.scala 285:148]
  wire  _T_1206 = ~_T_1205; // @[lsu_bus_buffer.scala 285:8]
  wire [3:0] _T_2020 = ~CmdPtr0Dec; // @[lsu_bus_buffer.scala 378:62]
  wire [3:0] _T_2021 = buf_age_3 & _T_2020; // @[lsu_bus_buffer.scala 378:59]
  wire  _T_2022 = |_T_2021; // @[lsu_bus_buffer.scala 378:76]
  wire  _T_2023 = ~_T_2022; // @[lsu_bus_buffer.scala 378:45]
  wire  _T_2025 = ~CmdPtr0Dec[3]; // @[lsu_bus_buffer.scala 378:83]
  wire  _T_2026 = _T_2023 & _T_2025; // @[lsu_bus_buffer.scala 378:81]
  wire  _T_2028 = _T_2026 & _T_2621; // @[lsu_bus_buffer.scala 378:98]
  wire  _T_2030 = _T_2028 & _T_4447; // @[lsu_bus_buffer.scala 378:123]
  wire [3:0] _T_2010 = buf_age_2 & _T_2020; // @[lsu_bus_buffer.scala 378:59]
  wire  _T_2011 = |_T_2010; // @[lsu_bus_buffer.scala 378:76]
  wire  _T_2012 = ~_T_2011; // @[lsu_bus_buffer.scala 378:45]
  wire  _T_2014 = ~CmdPtr0Dec[2]; // @[lsu_bus_buffer.scala 378:83]
  wire  _T_2015 = _T_2012 & _T_2014; // @[lsu_bus_buffer.scala 378:81]
  wire  _T_2017 = _T_2015 & _T_2616; // @[lsu_bus_buffer.scala 378:98]
  wire  _T_2019 = _T_2017 & _T_4442; // @[lsu_bus_buffer.scala 378:123]
  wire [3:0] _T_1999 = buf_age_1 & _T_2020; // @[lsu_bus_buffer.scala 378:59]
  wire  _T_2000 = |_T_1999; // @[lsu_bus_buffer.scala 378:76]
  wire  _T_2001 = ~_T_2000; // @[lsu_bus_buffer.scala 378:45]
  wire  _T_2003 = ~CmdPtr0Dec[1]; // @[lsu_bus_buffer.scala 378:83]
  wire  _T_2004 = _T_2001 & _T_2003; // @[lsu_bus_buffer.scala 378:81]
  wire  _T_2006 = _T_2004 & _T_2611; // @[lsu_bus_buffer.scala 378:98]
  wire  _T_2008 = _T_2006 & _T_4437; // @[lsu_bus_buffer.scala 378:123]
  wire [3:0] _T_1988 = buf_age_0 & _T_2020; // @[lsu_bus_buffer.scala 378:59]
  wire  _T_1989 = |_T_1988; // @[lsu_bus_buffer.scala 378:76]
  wire  _T_1990 = ~_T_1989; // @[lsu_bus_buffer.scala 378:45]
  wire  _T_1992 = ~CmdPtr0Dec[0]; // @[lsu_bus_buffer.scala 378:83]
  wire  _T_1993 = _T_1990 & _T_1992; // @[lsu_bus_buffer.scala 378:81]
  wire  _T_1995 = _T_1993 & _T_2606; // @[lsu_bus_buffer.scala 378:98]
  wire  _T_1997 = _T_1995 & _T_4432; // @[lsu_bus_buffer.scala 378:123]
  wire [3:0] CmdPtr1Dec = {_T_2030,_T_2019,_T_2008,_T_1997}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[lsu_bus_buffer.scala 383:31]
  wire  _T_1207 = _T_1206 | found_cmdptr1; // @[lsu_bus_buffer.scala 285:181]
  wire [3:0] _T_1210 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1219 = _T_1023 & _T_1210[0]; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1024 & _T_1210[1]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1219 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1025 & _T_1210[2]; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1223 | _T_1221; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1026 & _T_1210[3]; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1224 | _T_1222; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1207 | _T_1225; // @[lsu_bus_buffer.scala 285:197]
  wire  _T_1228 = _T_1227 | obuf_force_wr_en; // @[lsu_bus_buffer.scala 285:269]
  wire  _T_1229 = _T_1148 & _T_1228; // @[lsu_bus_buffer.scala 284:164]
  wire  _T_1230 = _T_1094 | _T_1229; // @[lsu_bus_buffer.scala 282:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[lsu_bus_buffer.scala 347:54]
  reg  obuf_data_done; // @[lsu_bus_buffer.scala 348:55]
  wire  _T_4856 = obuf_cmd_done | obuf_data_done; // @[lsu_bus_buffer.scala 555:54]
  wire  _T_4857 = obuf_cmd_done ? io_lsu_axi_w_ready : io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 555:75]
  wire  _T_4858 = io_lsu_axi_aw_ready & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 555:153]
  wire  _T_4859 = _T_4856 ? _T_4857 : _T_4858; // @[lsu_bus_buffer.scala 555:39]
  wire  bus_cmd_ready = obuf_write ? _T_4859 : io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 555:23]
  wire  _T_1231 = ~obuf_valid; // @[lsu_bus_buffer.scala 286:48]
  wire  _T_1232 = bus_cmd_ready | _T_1231; // @[lsu_bus_buffer.scala 286:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1233 = _T_1232 | obuf_nosend; // @[lsu_bus_buffer.scala 286:60]
  wire  _T_1234 = _T_1230 & _T_1233; // @[lsu_bus_buffer.scala 286:29]
  wire  _T_1235 = ~obuf_wr_wait; // @[lsu_bus_buffer.scala 286:77]
  wire  _T_1236 = _T_1234 & _T_1235; // @[lsu_bus_buffer.scala 286:75]
  reg [31:0] obuf_addr; // @[lib.scala 358:16]
  wire  _T_4804 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[lsu_bus_buffer.scala 553:56]
  wire  _T_4805 = obuf_valid & _T_4804; // @[lsu_bus_buffer.scala 553:38]
  wire  _T_4807 = obuf_tag1 == 2'h0; // @[lsu_bus_buffer.scala 553:126]
  wire  _T_4808 = obuf_merge & _T_4807; // @[lsu_bus_buffer.scala 553:114]
  wire  _T_4809 = _T_3562 | _T_4808; // @[lsu_bus_buffer.scala 553:100]
  wire  _T_4810 = ~_T_4809; // @[lsu_bus_buffer.scala 553:80]
  wire  _T_4811 = _T_4805 & _T_4810; // @[lsu_bus_buffer.scala 553:78]
  wire  _T_4848 = _T_4778 & _T_4811; // @[Mux.scala 27:72]
  wire  _T_4816 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[lsu_bus_buffer.scala 553:56]
  wire  _T_4817 = obuf_valid & _T_4816; // @[lsu_bus_buffer.scala 553:38]
  wire  _T_4819 = obuf_tag1 == 2'h1; // @[lsu_bus_buffer.scala 553:126]
  wire  _T_4820 = obuf_merge & _T_4819; // @[lsu_bus_buffer.scala 553:114]
  wire  _T_4821 = _T_3755 | _T_4820; // @[lsu_bus_buffer.scala 553:100]
  wire  _T_4822 = ~_T_4821; // @[lsu_bus_buffer.scala 553:80]
  wire  _T_4823 = _T_4817 & _T_4822; // @[lsu_bus_buffer.scala 553:78]
  wire  _T_4849 = _T_4782 & _T_4823; // @[Mux.scala 27:72]
  wire  _T_4852 = _T_4848 | _T_4849; // @[Mux.scala 27:72]
  wire  _T_4828 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[lsu_bus_buffer.scala 553:56]
  wire  _T_4829 = obuf_valid & _T_4828; // @[lsu_bus_buffer.scala 553:38]
  wire  _T_4831 = obuf_tag1 == 2'h2; // @[lsu_bus_buffer.scala 553:126]
  wire  _T_4832 = obuf_merge & _T_4831; // @[lsu_bus_buffer.scala 553:114]
  wire  _T_4833 = _T_3948 | _T_4832; // @[lsu_bus_buffer.scala 553:100]
  wire  _T_4834 = ~_T_4833; // @[lsu_bus_buffer.scala 553:80]
  wire  _T_4835 = _T_4829 & _T_4834; // @[lsu_bus_buffer.scala 553:78]
  wire  _T_4850 = _T_4786 & _T_4835; // @[Mux.scala 27:72]
  wire  _T_4853 = _T_4852 | _T_4850; // @[Mux.scala 27:72]
  wire  _T_4840 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[lsu_bus_buffer.scala 553:56]
  wire  _T_4841 = obuf_valid & _T_4840; // @[lsu_bus_buffer.scala 553:38]
  wire  _T_4843 = obuf_tag1 == 2'h3; // @[lsu_bus_buffer.scala 553:126]
  wire  _T_4844 = obuf_merge & _T_4843; // @[lsu_bus_buffer.scala 553:114]
  wire  _T_4845 = _T_4141 | _T_4844; // @[lsu_bus_buffer.scala 553:100]
  wire  _T_4846 = ~_T_4845; // @[lsu_bus_buffer.scala 553:80]
  wire  _T_4847 = _T_4841 & _T_4846; // @[lsu_bus_buffer.scala 553:78]
  wire  _T_4851 = _T_4790 & _T_4847; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4853 | _T_4851; // @[Mux.scala 27:72]
  wire  _T_1239 = ~bus_addr_match_pending; // @[lsu_bus_buffer.scala 286:118]
  wire  _T_1240 = _T_1236 & _T_1239; // @[lsu_bus_buffer.scala 286:116]
  wire  obuf_wr_en = _T_1240 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 286:142]
  wire  _T_1242 = obuf_valid & obuf_nosend; // @[lsu_bus_buffer.scala 288:47]
  wire  bus_wcmd_sent = io_lsu_axi_aw_valid & io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 556:40]
  wire  _T_4863 = obuf_cmd_done | bus_wcmd_sent; // @[lsu_bus_buffer.scala 558:35]
  wire  bus_wdata_sent = io_lsu_axi_w_valid & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 557:40]
  wire  _T_4864 = obuf_data_done | bus_wdata_sent; // @[lsu_bus_buffer.scala 558:70]
  wire  _T_4865 = _T_4863 & _T_4864; // @[lsu_bus_buffer.scala 558:52]
  wire  _T_4866 = io_lsu_axi_ar_valid & io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 558:112]
  wire  bus_cmd_sent = _T_4865 | _T_4866; // @[lsu_bus_buffer.scala 558:89]
  wire  _T_1243 = bus_cmd_sent | _T_1242; // @[lsu_bus_buffer.scala 288:33]
  wire  _T_1244 = ~obuf_wr_en; // @[lsu_bus_buffer.scala 288:65]
  wire  _T_1245 = _T_1243 & _T_1244; // @[lsu_bus_buffer.scala 288:63]
  wire  _T_1246 = _T_1245 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 288:77]
  wire  obuf_rst = _T_1246 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 288:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_bits_store : _T_1202; // @[lsu_bus_buffer.scala 289:26]
  wire [31:0] _T_1283 = _T_1023 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1284 = _T_1024 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1285 = _T_1025 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1286 = _T_1026 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1287 = _T_1283 | _T_1284; // @[Mux.scala 27:72]
  wire [31:0] _T_1288 = _T_1287 | _T_1285; // @[Mux.scala 27:72]
  wire [31:0] _T_1289 = _T_1288 | _T_1286; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1289; // @[lsu_bus_buffer.scala 291:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1296 = _T_1023 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1297 = _T_1024 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1298 = _T_1025 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1299 = _T_1026 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1300 = _T_1296 | _T_1297; // @[Mux.scala 27:72]
  wire [1:0] _T_1301 = _T_1300 | _T_1298; // @[Mux.scala 27:72]
  wire [1:0] _T_1302 = _T_1301 | _T_1299; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1302; // @[lsu_bus_buffer.scala 294:23]
  wire [7:0] _T_2079 = {4'h0,_T_2030,_T_2019,_T_2008,_T_1997}; // @[Cat.scala 29:58]
  wire  _T_2082 = _T_2079[4] | _T_2079[5]; // @[lsu_bus_buffer.scala 385:42]
  wire  _T_2084 = _T_2082 | _T_2079[6]; // @[lsu_bus_buffer.scala 385:48]
  wire  _T_2086 = _T_2084 | _T_2079[7]; // @[lsu_bus_buffer.scala 385:54]
  wire  _T_2089 = _T_2079[2] | _T_2079[3]; // @[lsu_bus_buffer.scala 385:67]
  wire  _T_2091 = _T_2089 | _T_2079[6]; // @[lsu_bus_buffer.scala 385:73]
  wire  _T_2093 = _T_2091 | _T_2079[7]; // @[lsu_bus_buffer.scala 385:79]
  wire  _T_2096 = _T_2079[1] | _T_2079[3]; // @[lsu_bus_buffer.scala 385:92]
  wire  _T_2098 = _T_2096 | _T_2079[5]; // @[lsu_bus_buffer.scala 385:98]
  wire  _T_2100 = _T_2098 | _T_2079[7]; // @[lsu_bus_buffer.scala 385:104]
  wire [2:0] _T_2102 = {_T_2086,_T_2093,_T_2100}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr1 = _T_2102[1:0]; // @[lsu_bus_buffer.scala 392:11]
  wire  _T_1304 = obuf_wr_en | obuf_rst; // @[lsu_bus_buffer.scala 303:39]
  wire  _T_1305 = ~_T_1304; // @[lsu_bus_buffer.scala 303:26]
  wire  _T_1311 = obuf_sz_in == 2'h0; // @[lsu_bus_buffer.scala 307:72]
  wire  _T_1314 = ~obuf_addr_in[0]; // @[lsu_bus_buffer.scala 307:98]
  wire  _T_1315 = obuf_sz_in[0] & _T_1314; // @[lsu_bus_buffer.scala 307:96]
  wire  _T_1316 = _T_1311 | _T_1315; // @[lsu_bus_buffer.scala 307:79]
  wire  _T_1319 = |obuf_addr_in[1:0]; // @[lsu_bus_buffer.scala 307:153]
  wire  _T_1320 = ~_T_1319; // @[lsu_bus_buffer.scala 307:134]
  wire  _T_1321 = obuf_sz_in[1] & _T_1320; // @[lsu_bus_buffer.scala 307:132]
  wire  _T_1322 = _T_1316 | _T_1321; // @[lsu_bus_buffer.scala 307:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1322; // @[lsu_bus_buffer.scala 307:28]
  wire  _T_1339 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[lsu_bus_buffer.scala 321:40]
  wire  _T_1340 = _T_1339 & obuf_aligned_in; // @[lsu_bus_buffer.scala 321:60]
  wire  _T_1341 = ~obuf_sideeffect; // @[lsu_bus_buffer.scala 321:80]
  wire  _T_1342 = _T_1340 & _T_1341; // @[lsu_bus_buffer.scala 321:78]
  wire  _T_1343 = ~obuf_write; // @[lsu_bus_buffer.scala 321:99]
  wire  _T_1344 = _T_1342 & _T_1343; // @[lsu_bus_buffer.scala 321:97]
  wire  _T_1345 = ~obuf_write_in; // @[lsu_bus_buffer.scala 321:113]
  wire  _T_1346 = _T_1344 & _T_1345; // @[lsu_bus_buffer.scala 321:111]
  wire  _T_1347 = ~io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_buffer.scala 321:130]
  wire  _T_1348 = _T_1346 & _T_1347; // @[lsu_bus_buffer.scala 321:128]
  wire  _T_1349 = ~obuf_nosend; // @[lsu_bus_buffer.scala 322:20]
  wire  _T_1350 = obuf_valid & _T_1349; // @[lsu_bus_buffer.scala 322:18]
  reg  obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 349:56]
  wire  bus_rsp_read = io_lsu_axi_r_valid & io_lsu_axi_r_ready; // @[lsu_bus_buffer.scala 559:38]
  reg [2:0] obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 350:55]
  wire  _T_1351 = io_lsu_axi_r_bits_id == obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 322:90]
  wire  _T_1352 = bus_rsp_read & _T_1351; // @[lsu_bus_buffer.scala 322:70]
  wire  _T_1353 = ~_T_1352; // @[lsu_bus_buffer.scala 322:55]
  wire  _T_1354 = obuf_rdrsp_pend & _T_1353; // @[lsu_bus_buffer.scala 322:53]
  wire  _T_1355 = _T_1350 | _T_1354; // @[lsu_bus_buffer.scala 322:34]
  wire  obuf_nosend_in = _T_1348 & _T_1355; // @[lsu_bus_buffer.scala 321:177]
  wire  _T_1323 = ~obuf_nosend_in; // @[lsu_bus_buffer.scala 315:44]
  wire  _T_1324 = obuf_wr_en & _T_1323; // @[lsu_bus_buffer.scala 315:42]
  wire  _T_1325 = ~_T_1324; // @[lsu_bus_buffer.scala 315:29]
  wire  _T_1326 = _T_1325 & obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 315:61]
  wire  _T_1330 = _T_1326 & _T_1353; // @[lsu_bus_buffer.scala 315:79]
  wire  _T_1332 = bus_cmd_sent & _T_1343; // @[lsu_bus_buffer.scala 316:20]
  wire  _T_1333 = ~io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 316:37]
  wire  _T_1334 = _T_1332 & _T_1333; // @[lsu_bus_buffer.scala 316:35]
  wire [7:0] _T_1358 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1359 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1360 = io_lsu_addr_r[2] ? _T_1358 : _T_1359; // @[lsu_bus_buffer.scala 323:46]
  wire [3:0] _T_1379 = _T_1023 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1380 = _T_1024 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1381 = _T_1025 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1382 = _T_1026 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1383 = _T_1379 | _T_1380; // @[Mux.scala 27:72]
  wire [3:0] _T_1384 = _T_1383 | _T_1381; // @[Mux.scala 27:72]
  wire [3:0] _T_1385 = _T_1384 | _T_1382; // @[Mux.scala 27:72]
  wire [7:0] _T_1387 = {_T_1385,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1400 = {4'h0,_T_1385}; // @[Cat.scala 29:58]
  wire [7:0] _T_1401 = _T_1289[2] ? _T_1387 : _T_1400; // @[lsu_bus_buffer.scala 324:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1360 : _T_1401; // @[lsu_bus_buffer.scala 323:28]
  wire [7:0] _T_1403 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1404 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1405 = io_end_addr_r[2] ? _T_1403 : _T_1404; // @[lsu_bus_buffer.scala 325:46]
  wire  _T_1406 = CmdPtr1 == 2'h0; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_1407 = CmdPtr1 == 2'h1; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_1408 = CmdPtr1 == 2'h2; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_1409 = CmdPtr1 == 2'h3; // @[lsu_bus_buffer.scala 57:123]
  wire [31:0] _T_1410 = _T_1406 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1411 = _T_1407 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1412 = _T_1408 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1413 = _T_1409 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1414 = _T_1410 | _T_1411; // @[Mux.scala 27:72]
  wire [31:0] _T_1415 = _T_1414 | _T_1412; // @[Mux.scala 27:72]
  wire [31:0] _T_1416 = _T_1415 | _T_1413; // @[Mux.scala 27:72]
  wire [3:0] _T_1424 = _T_1406 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1425 = _T_1407 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1426 = _T_1408 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1427 = _T_1409 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1428 = _T_1424 | _T_1425; // @[Mux.scala 27:72]
  wire [3:0] _T_1429 = _T_1428 | _T_1426; // @[Mux.scala 27:72]
  wire [3:0] _T_1430 = _T_1429 | _T_1427; // @[Mux.scala 27:72]
  wire [7:0] _T_1432 = {_T_1430,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1445 = {4'h0,_T_1430}; // @[Cat.scala 29:58]
  wire [7:0] _T_1446 = _T_1416[2] ? _T_1432 : _T_1445; // @[lsu_bus_buffer.scala 326:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1405 : _T_1446; // @[lsu_bus_buffer.scala 325:28]
  wire [63:0] _T_1448 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1449 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1450 = io_lsu_addr_r[2] ? _T_1448 : _T_1449; // @[lsu_bus_buffer.scala 328:44]
  wire [31:0] _T_1469 = _T_1023 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1470 = _T_1024 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1471 = _T_1025 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1472 = _T_1026 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1473 = _T_1469 | _T_1470; // @[Mux.scala 27:72]
  wire [31:0] _T_1474 = _T_1473 | _T_1471; // @[Mux.scala 27:72]
  wire [31:0] _T_1475 = _T_1474 | _T_1472; // @[Mux.scala 27:72]
  wire [63:0] _T_1477 = {_T_1475,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1490 = {32'h0,_T_1475}; // @[Cat.scala 29:58]
  wire [63:0] _T_1491 = _T_1289[2] ? _T_1477 : _T_1490; // @[lsu_bus_buffer.scala 329:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1450 : _T_1491; // @[lsu_bus_buffer.scala 328:26]
  wire [63:0] _T_1493 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1494 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1495 = io_lsu_addr_r[2] ? _T_1493 : _T_1494; // @[lsu_bus_buffer.scala 330:44]
  wire [31:0] _T_1514 = _T_1406 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1515 = _T_1407 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1516 = _T_1408 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1517 = _T_1409 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1518 = _T_1514 | _T_1515; // @[Mux.scala 27:72]
  wire [31:0] _T_1519 = _T_1518 | _T_1516; // @[Mux.scala 27:72]
  wire [31:0] _T_1520 = _T_1519 | _T_1517; // @[Mux.scala 27:72]
  wire [63:0] _T_1522 = {_T_1520,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1535 = {32'h0,_T_1520}; // @[Cat.scala 29:58]
  wire [63:0] _T_1536 = _T_1416[2] ? _T_1522 : _T_1535; // @[lsu_bus_buffer.scala 331:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1495 : _T_1536; // @[lsu_bus_buffer.scala 330:26]
  wire  _T_1621 = CmdPtr0 != CmdPtr1; // @[lsu_bus_buffer.scala 337:30]
  wire  _T_1622 = _T_1621 & found_cmdptr0; // @[lsu_bus_buffer.scala 337:43]
  wire  _T_1623 = _T_1622 & found_cmdptr1; // @[lsu_bus_buffer.scala 337:59]
  wire  _T_1637 = _T_1623 & _T_1107; // @[lsu_bus_buffer.scala 337:75]
  wire [2:0] _T_1642 = _T_1406 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1643 = _T_1407 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1646 = _T_1642 | _T_1643; // @[Mux.scala 27:72]
  wire [2:0] _T_1644 = _T_1408 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1647 = _T_1646 | _T_1644; // @[Mux.scala 27:72]
  wire [2:0] _T_1645 = _T_1409 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1648 = _T_1647 | _T_1645; // @[Mux.scala 27:72]
  wire  _T_1650 = _T_1648 == 3'h2; // @[lsu_bus_buffer.scala 337:150]
  wire  _T_1651 = _T_1637 & _T_1650; // @[lsu_bus_buffer.scala 337:118]
  wire  _T_1672 = _T_1651 & _T_1128; // @[lsu_bus_buffer.scala 337:161]
  wire  _T_1690 = _T_1672 & _T_1053; // @[lsu_bus_buffer.scala 338:85]
  wire  _T_1792 = _T_1204 & _T_1166; // @[lsu_bus_buffer.scala 341:38]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1795 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1804 = _T_1023 & _T_1795[0]; // @[Mux.scala 27:72]
  wire  _T_1805 = _T_1024 & _T_1795[1]; // @[Mux.scala 27:72]
  wire  _T_1808 = _T_1804 | _T_1805; // @[Mux.scala 27:72]
  wire  _T_1806 = _T_1025 & _T_1795[2]; // @[Mux.scala 27:72]
  wire  _T_1809 = _T_1808 | _T_1806; // @[Mux.scala 27:72]
  wire  _T_1807 = _T_1026 & _T_1795[3]; // @[Mux.scala 27:72]
  wire  _T_1810 = _T_1809 | _T_1807; // @[Mux.scala 27:72]
  wire  _T_1812 = ~_T_1810; // @[lsu_bus_buffer.scala 341:109]
  wire  _T_1813 = _T_1792 & _T_1812; // @[lsu_bus_buffer.scala 341:107]
  wire  _T_1833 = _T_1813 & _T_1185; // @[lsu_bus_buffer.scala 341:179]
  wire  _T_1835 = _T_1690 & _T_1833; // @[lsu_bus_buffer.scala 338:122]
  wire  _T_1836 = ibuf_buf_byp & ldst_samedw_r; // @[lsu_bus_buffer.scala 342:19]
  wire  _T_1837 = _T_1836 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 342:35]
  wire  obuf_merge_en = _T_1835 | _T_1837; // @[lsu_bus_buffer.scala 341:253]
  wire  _T_1539 = obuf_merge_en & obuf_byteen1_in[0]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1540 = obuf_byteen0_in[0] | _T_1539; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1543 = obuf_merge_en & obuf_byteen1_in[1]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1544 = obuf_byteen0_in[1] | _T_1543; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1547 = obuf_merge_en & obuf_byteen1_in[2]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1548 = obuf_byteen0_in[2] | _T_1547; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1551 = obuf_merge_en & obuf_byteen1_in[3]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1552 = obuf_byteen0_in[3] | _T_1551; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1555 = obuf_merge_en & obuf_byteen1_in[4]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1556 = obuf_byteen0_in[4] | _T_1555; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1559 = obuf_merge_en & obuf_byteen1_in[5]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1560 = obuf_byteen0_in[5] | _T_1559; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1563 = obuf_merge_en & obuf_byteen1_in[6]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1564 = obuf_byteen0_in[6] | _T_1563; // @[lsu_bus_buffer.scala 332:63]
  wire  _T_1567 = obuf_merge_en & obuf_byteen1_in[7]; // @[lsu_bus_buffer.scala 332:80]
  wire  _T_1568 = obuf_byteen0_in[7] | _T_1567; // @[lsu_bus_buffer.scala 332:63]
  wire [7:0] obuf_byteen_in = {_T_1568,_T_1564,_T_1560,_T_1556,_T_1552,_T_1548,_T_1544,_T_1540}; // @[Cat.scala 29:58]
  wire [7:0] _T_1579 = _T_1539 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1584 = _T_1543 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1589 = _T_1547 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1594 = _T_1551 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1599 = _T_1555 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1604 = _T_1559 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1609 = _T_1563 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[lsu_bus_buffer.scala 333:44]
  wire [7:0] _T_1614 = _T_1567 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[lsu_bus_buffer.scala 333:44]
  wire [55:0] _T_1620 = {_T_1614,_T_1609,_T_1604,_T_1599,_T_1594,_T_1589,_T_1584}; // @[Cat.scala 29:58]
  wire  _T_1839 = obuf_wr_en | obuf_valid; // @[lsu_bus_buffer.scala 345:58]
  wire  _T_1840 = ~obuf_rst; // @[lsu_bus_buffer.scala 345:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[lib.scala 358:16]
  wire  _T_1853 = buf_state_0 == 3'h0; // @[lsu_bus_buffer.scala 363:65]
  wire  _T_1854 = ibuf_tag == 2'h0; // @[lsu_bus_buffer.scala 364:30]
  wire  _T_1855 = ibuf_valid & _T_1854; // @[lsu_bus_buffer.scala 364:19]
  wire  _T_1856 = WrPtr0_r == 2'h0; // @[lsu_bus_buffer.scala 365:18]
  wire  _T_1857 = WrPtr1_r == 2'h0; // @[lsu_bus_buffer.scala 365:57]
  wire  _T_1858 = io_ldst_dual_r & _T_1857; // @[lsu_bus_buffer.scala 365:45]
  wire  _T_1859 = _T_1856 | _T_1858; // @[lsu_bus_buffer.scala 365:27]
  wire  _T_1860 = io_lsu_busreq_r & _T_1859; // @[lsu_bus_buffer.scala 364:58]
  wire  _T_1861 = _T_1855 | _T_1860; // @[lsu_bus_buffer.scala 364:39]
  wire  _T_1862 = ~_T_1861; // @[lsu_bus_buffer.scala 364:5]
  wire  _T_1863 = _T_1853 & _T_1862; // @[lsu_bus_buffer.scala 363:76]
  wire  _T_1864 = buf_state_1 == 3'h0; // @[lsu_bus_buffer.scala 363:65]
  wire  _T_1865 = ibuf_tag == 2'h1; // @[lsu_bus_buffer.scala 364:30]
  wire  _T_1866 = ibuf_valid & _T_1865; // @[lsu_bus_buffer.scala 364:19]
  wire  _T_1867 = WrPtr0_r == 2'h1; // @[lsu_bus_buffer.scala 365:18]
  wire  _T_1868 = WrPtr1_r == 2'h1; // @[lsu_bus_buffer.scala 365:57]
  wire  _T_1869 = io_ldst_dual_r & _T_1868; // @[lsu_bus_buffer.scala 365:45]
  wire  _T_1870 = _T_1867 | _T_1869; // @[lsu_bus_buffer.scala 365:27]
  wire  _T_1871 = io_lsu_busreq_r & _T_1870; // @[lsu_bus_buffer.scala 364:58]
  wire  _T_1872 = _T_1866 | _T_1871; // @[lsu_bus_buffer.scala 364:39]
  wire  _T_1873 = ~_T_1872; // @[lsu_bus_buffer.scala 364:5]
  wire  _T_1874 = _T_1864 & _T_1873; // @[lsu_bus_buffer.scala 363:76]
  wire  _T_1875 = buf_state_2 == 3'h0; // @[lsu_bus_buffer.scala 363:65]
  wire  _T_1876 = ibuf_tag == 2'h2; // @[lsu_bus_buffer.scala 364:30]
  wire  _T_1877 = ibuf_valid & _T_1876; // @[lsu_bus_buffer.scala 364:19]
  wire  _T_1878 = WrPtr0_r == 2'h2; // @[lsu_bus_buffer.scala 365:18]
  wire  _T_1879 = WrPtr1_r == 2'h2; // @[lsu_bus_buffer.scala 365:57]
  wire  _T_1880 = io_ldst_dual_r & _T_1879; // @[lsu_bus_buffer.scala 365:45]
  wire  _T_1881 = _T_1878 | _T_1880; // @[lsu_bus_buffer.scala 365:27]
  wire  _T_1882 = io_lsu_busreq_r & _T_1881; // @[lsu_bus_buffer.scala 364:58]
  wire  _T_1883 = _T_1877 | _T_1882; // @[lsu_bus_buffer.scala 364:39]
  wire  _T_1884 = ~_T_1883; // @[lsu_bus_buffer.scala 364:5]
  wire  _T_1885 = _T_1875 & _T_1884; // @[lsu_bus_buffer.scala 363:76]
  wire  _T_1886 = buf_state_3 == 3'h0; // @[lsu_bus_buffer.scala 363:65]
  wire  _T_1887 = ibuf_tag == 2'h3; // @[lsu_bus_buffer.scala 364:30]
  wire  _T_1889 = WrPtr0_r == 2'h3; // @[lsu_bus_buffer.scala 365:18]
  wire  _T_1890 = WrPtr1_r == 2'h3; // @[lsu_bus_buffer.scala 365:57]
  wire [1:0] _T_1898 = _T_1885 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_1899 = _T_1874 ? 2'h1 : _T_1898; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1863 ? 2'h0 : _T_1899; // @[Mux.scala 98:16]
  wire  _T_1904 = WrPtr0_m == 2'h0; // @[lsu_bus_buffer.scala 370:33]
  wire  _T_1905 = io_lsu_busreq_m & _T_1904; // @[lsu_bus_buffer.scala 370:22]
  wire  _T_1906 = _T_1855 | _T_1905; // @[lsu_bus_buffer.scala 369:112]
  wire  _T_1912 = _T_1906 | _T_1860; // @[lsu_bus_buffer.scala 370:42]
  wire  _T_1913 = ~_T_1912; // @[lsu_bus_buffer.scala 369:78]
  wire  _T_1914 = _T_1853 & _T_1913; // @[lsu_bus_buffer.scala 369:76]
  wire  _T_1918 = WrPtr0_m == 2'h1; // @[lsu_bus_buffer.scala 370:33]
  wire  _T_1919 = io_lsu_busreq_m & _T_1918; // @[lsu_bus_buffer.scala 370:22]
  wire  _T_1920 = _T_1866 | _T_1919; // @[lsu_bus_buffer.scala 369:112]
  wire  _T_1926 = _T_1920 | _T_1871; // @[lsu_bus_buffer.scala 370:42]
  wire  _T_1927 = ~_T_1926; // @[lsu_bus_buffer.scala 369:78]
  wire  _T_1928 = _T_1864 & _T_1927; // @[lsu_bus_buffer.scala 369:76]
  wire  _T_1932 = WrPtr0_m == 2'h2; // @[lsu_bus_buffer.scala 370:33]
  wire  _T_1933 = io_lsu_busreq_m & _T_1932; // @[lsu_bus_buffer.scala 370:22]
  wire  _T_1934 = _T_1877 | _T_1933; // @[lsu_bus_buffer.scala 369:112]
  wire  _T_1940 = _T_1934 | _T_1882; // @[lsu_bus_buffer.scala 370:42]
  wire  _T_1941 = ~_T_1940; // @[lsu_bus_buffer.scala 369:78]
  wire  _T_1942 = _T_1875 & _T_1941; // @[lsu_bus_buffer.scala 369:76]
  reg [3:0] buf_rspageQ_0; // @[lsu_bus_buffer.scala 500:63]
  wire  _T_2746 = buf_state_3 == 3'h5; // @[lsu_bus_buffer.scala 413:102]
  wire  _T_2747 = buf_rspageQ_0[3] & _T_2746; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2743 = buf_state_2 == 3'h5; // @[lsu_bus_buffer.scala 413:102]
  wire  _T_2744 = buf_rspageQ_0[2] & _T_2743; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2740 = buf_state_1 == 3'h5; // @[lsu_bus_buffer.scala 413:102]
  wire  _T_2741 = buf_rspageQ_0[1] & _T_2740; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2737 = buf_state_0 == 3'h5; // @[lsu_bus_buffer.scala 413:102]
  wire  _T_2738 = buf_rspageQ_0[0] & _T_2737; // @[lsu_bus_buffer.scala 413:87]
  wire [3:0] buf_rsp_pickage_0 = {_T_2747,_T_2744,_T_2741,_T_2738}; // @[Cat.scala 29:58]
  wire  _T_2033 = |buf_rsp_pickage_0; // @[lsu_bus_buffer.scala 381:65]
  wire  _T_2034 = ~_T_2033; // @[lsu_bus_buffer.scala 381:44]
  wire  _T_2036 = _T_2034 & _T_2737; // @[lsu_bus_buffer.scala 381:70]
  reg [3:0] buf_rspageQ_1; // @[lsu_bus_buffer.scala 500:63]
  wire  _T_2762 = buf_rspageQ_1[3] & _T_2746; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2759 = buf_rspageQ_1[2] & _T_2743; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2756 = buf_rspageQ_1[1] & _T_2740; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2753 = buf_rspageQ_1[0] & _T_2737; // @[lsu_bus_buffer.scala 413:87]
  wire [3:0] buf_rsp_pickage_1 = {_T_2762,_T_2759,_T_2756,_T_2753}; // @[Cat.scala 29:58]
  wire  _T_2037 = |buf_rsp_pickage_1; // @[lsu_bus_buffer.scala 381:65]
  wire  _T_2038 = ~_T_2037; // @[lsu_bus_buffer.scala 381:44]
  wire  _T_2040 = _T_2038 & _T_2740; // @[lsu_bus_buffer.scala 381:70]
  reg [3:0] buf_rspageQ_2; // @[lsu_bus_buffer.scala 500:63]
  wire  _T_2777 = buf_rspageQ_2[3] & _T_2746; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2774 = buf_rspageQ_2[2] & _T_2743; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2771 = buf_rspageQ_2[1] & _T_2740; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2768 = buf_rspageQ_2[0] & _T_2737; // @[lsu_bus_buffer.scala 413:87]
  wire [3:0] buf_rsp_pickage_2 = {_T_2777,_T_2774,_T_2771,_T_2768}; // @[Cat.scala 29:58]
  wire  _T_2041 = |buf_rsp_pickage_2; // @[lsu_bus_buffer.scala 381:65]
  wire  _T_2042 = ~_T_2041; // @[lsu_bus_buffer.scala 381:44]
  wire  _T_2044 = _T_2042 & _T_2743; // @[lsu_bus_buffer.scala 381:70]
  reg [3:0] buf_rspageQ_3; // @[lsu_bus_buffer.scala 500:63]
  wire  _T_2792 = buf_rspageQ_3[3] & _T_2746; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2789 = buf_rspageQ_3[2] & _T_2743; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2786 = buf_rspageQ_3[1] & _T_2740; // @[lsu_bus_buffer.scala 413:87]
  wire  _T_2783 = buf_rspageQ_3[0] & _T_2737; // @[lsu_bus_buffer.scala 413:87]
  wire [3:0] buf_rsp_pickage_3 = {_T_2792,_T_2789,_T_2786,_T_2783}; // @[Cat.scala 29:58]
  wire  _T_2045 = |buf_rsp_pickage_3; // @[lsu_bus_buffer.scala 381:65]
  wire  _T_2046 = ~_T_2045; // @[lsu_bus_buffer.scala 381:44]
  wire  _T_2048 = _T_2046 & _T_2746; // @[lsu_bus_buffer.scala 381:70]
  wire [7:0] _T_2104 = {4'h0,_T_2048,_T_2044,_T_2040,_T_2036}; // @[Cat.scala 29:58]
  wire  _T_2107 = _T_2104[4] | _T_2104[5]; // @[lsu_bus_buffer.scala 385:42]
  wire  _T_2109 = _T_2107 | _T_2104[6]; // @[lsu_bus_buffer.scala 385:48]
  wire  _T_2111 = _T_2109 | _T_2104[7]; // @[lsu_bus_buffer.scala 385:54]
  wire  _T_2114 = _T_2104[2] | _T_2104[3]; // @[lsu_bus_buffer.scala 385:67]
  wire  _T_2116 = _T_2114 | _T_2104[6]; // @[lsu_bus_buffer.scala 385:73]
  wire  _T_2118 = _T_2116 | _T_2104[7]; // @[lsu_bus_buffer.scala 385:79]
  wire  _T_2121 = _T_2104[1] | _T_2104[3]; // @[lsu_bus_buffer.scala 385:92]
  wire  _T_2123 = _T_2121 | _T_2104[5]; // @[lsu_bus_buffer.scala 385:98]
  wire  _T_2125 = _T_2123 | _T_2104[7]; // @[lsu_bus_buffer.scala 385:104]
  wire [2:0] _T_2127 = {_T_2111,_T_2118,_T_2125}; // @[Cat.scala 29:58]
  wire  _T_3532 = ibuf_byp | io_ldst_dual_r; // @[lsu_bus_buffer.scala 443:77]
  wire  _T_3533 = ~ibuf_merge_en; // @[lsu_bus_buffer.scala 443:97]
  wire  _T_3534 = _T_3532 & _T_3533; // @[lsu_bus_buffer.scala 443:95]
  wire  _T_3535 = 2'h0 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3536 = _T_3534 & _T_3535; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3537 = ibuf_byp & io_ldst_dual_r; // @[lsu_bus_buffer.scala 443:144]
  wire  _T_3538 = 2'h0 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3539 = _T_3537 & _T_3538; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3540 = _T_3536 | _T_3539; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3541 = _T_853 & _T_3540; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3542 = 2'h0 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3543 = ibuf_drain_vld & _T_3542; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3544 = _T_3541 | _T_3543; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_3554 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 450:46]
  wire  _T_3589 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_b_valid & io_lsu_axi_b_ready; // @[lsu_bus_buffer.scala 560:39]
  wire  _T_3634 = io_lsu_axi_b_bits_id == 3'h0; // @[lsu_bus_buffer.scala 468:73]
  wire  _T_3635 = bus_rsp_write & _T_3634; // @[lsu_bus_buffer.scala 468:52]
  wire  _T_3636 = io_lsu_axi_r_bits_id == 3'h0; // @[lsu_bus_buffer.scala 469:46]
  reg  _T_4307; // @[Reg.scala 27:20]
  reg  _T_4305; // @[Reg.scala 27:20]
  reg  _T_4303; // @[Reg.scala 27:20]
  reg  _T_4301; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4307,_T_4305,_T_4303,_T_4301}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_368 = {{1'd0}, buf_ldfwdtag_0}; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_3638 = io_lsu_axi_r_bits_id == _GEN_368; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_3639 = buf_ldfwd[0] & _T_3638; // @[lsu_bus_buffer.scala 470:27]
  wire  _T_3640 = _T_3636 | _T_3639; // @[lsu_bus_buffer.scala 469:77]
  wire  _T_3641 = buf_dual_0 & buf_dualhi_0; // @[lsu_bus_buffer.scala 471:26]
  wire  _T_3643 = ~buf_write[0]; // @[lsu_bus_buffer.scala 471:44]
  wire  _T_3644 = _T_3641 & _T_3643; // @[lsu_bus_buffer.scala 471:42]
  wire  _T_3645 = _T_3644 & buf_samedw_0; // @[lsu_bus_buffer.scala 471:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_369 = {{1'd0}, buf_dualtag_0}; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_3646 = io_lsu_axi_r_bits_id == _GEN_369; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_3647 = _T_3645 & _T_3646; // @[lsu_bus_buffer.scala 471:74]
  wire  _T_3648 = _T_3640 | _T_3647; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3649 = bus_rsp_read & _T_3648; // @[lsu_bus_buffer.scala 469:25]
  wire  _T_3650 = _T_3635 | _T_3649; // @[lsu_bus_buffer.scala 468:105]
  wire  _GEN_42 = _T_3589 & _T_3650; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3555 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3551 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3528 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3676 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3686 = buf_ldfwd >> buf_dualtag_0; // @[lsu_bus_buffer.scala 483:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[lsu_bus_buffer.scala 483:58]
  wire [2:0] _GEN_371 = {{1'd0}, _GEN_25}; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_3688 = io_lsu_axi_r_bits_id == _GEN_371; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_3689 = _T_3686[0] & _T_3688; // @[lsu_bus_buffer.scala 483:38]
  wire  _T_3690 = _T_3646 | _T_3689; // @[lsu_bus_buffer.scala 482:95]
  wire  _T_3691 = bus_rsp_read & _T_3690; // @[lsu_bus_buffer.scala 482:45]
  wire  _GEN_36 = _T_3676 & _T_3691; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3589 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3555 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3551 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3528 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3568 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 456:49]
  wire  _T_3569 = _T_3568 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 456:70]
  wire  _T_3694 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2127[1:0]; // @[lsu_bus_buffer.scala 393:10]
  wire  _T_3697 = RspPtr == 2'h0; // @[lsu_bus_buffer.scala 488:37]
  wire  _T_3698 = buf_dualtag_0 == RspPtr; // @[lsu_bus_buffer.scala 488:98]
  wire  _T_3699 = buf_dual_0 & _T_3698; // @[lsu_bus_buffer.scala 488:80]
  wire  _T_3700 = _T_3697 | _T_3699; // @[lsu_bus_buffer.scala 488:65]
  wire  _T_3701 = _T_3700 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 488:112]
  wire  _T_3702 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3694 ? _T_3701 : _T_3702; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3676 ? _T_3569 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3589 ? _T_3569 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3555 ? _T_3569 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3551 ? _T_3554 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3528 ? _T_3544 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2129 = _T_1853 & buf_state_en_0; // @[lsu_bus_buffer.scala 405:94]
  wire  _T_2135 = ibuf_drain_vld & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 407:23]
  wire  _T_2137 = _T_2135 & _T_3532; // @[lsu_bus_buffer.scala 407:41]
  wire  _T_2139 = _T_2137 & _T_1856; // @[lsu_bus_buffer.scala 407:71]
  wire  _T_2141 = _T_2139 & _T_1854; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2142 = _T_4471 | _T_2141; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2143 = ibuf_byp & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 408:17]
  wire  _T_2144 = _T_2143 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 408:35]
  wire  _T_2146 = _T_2144 & _T_1857; // @[lsu_bus_buffer.scala 408:52]
  wire  _T_2148 = _T_2146 & _T_1856; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2149 = _T_2142 | _T_2148; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2150 = _T_2129 & _T_2149; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2152 = _T_2150 | buf_age_0[0]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2166 = _T_2139 & _T_1865; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2167 = _T_4476 | _T_2166; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2173 = _T_2146 & _T_1867; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2174 = _T_2167 | _T_2173; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2175 = _T_2129 & _T_2174; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2177 = _T_2175 | buf_age_0[1]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2191 = _T_2139 & _T_1876; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2192 = _T_4481 | _T_2191; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2198 = _T_2146 & _T_1878; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2199 = _T_2192 | _T_2198; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2200 = _T_2129 & _T_2199; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2202 = _T_2200 | buf_age_0[2]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2216 = _T_2139 & _T_1887; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2217 = _T_4486 | _T_2216; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2223 = _T_2146 & _T_1889; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2224 = _T_2217 | _T_2223; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2225 = _T_2129 & _T_2224; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2227 = _T_2225 | buf_age_0[3]; // @[lsu_bus_buffer.scala 408:97]
  wire [2:0] _T_2229 = {_T_2227,_T_2202,_T_2177}; // @[Cat.scala 29:58]
  wire  _T_3728 = 2'h1 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3729 = _T_3534 & _T_3728; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3731 = 2'h1 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3732 = _T_3537 & _T_3731; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3733 = _T_3729 | _T_3732; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3734 = _T_853 & _T_3733; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3735 = 2'h1 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3736 = ibuf_drain_vld & _T_3735; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3737 = _T_3734 | _T_3736; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_3782 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3827 = io_lsu_axi_b_bits_id == 3'h1; // @[lsu_bus_buffer.scala 468:73]
  wire  _T_3828 = bus_rsp_write & _T_3827; // @[lsu_bus_buffer.scala 468:52]
  wire  _T_3829 = io_lsu_axi_r_bits_id == 3'h1; // @[lsu_bus_buffer.scala 469:46]
  wire [2:0] _GEN_372 = {{1'd0}, buf_ldfwdtag_1}; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_3831 = io_lsu_axi_r_bits_id == _GEN_372; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_3832 = buf_ldfwd[1] & _T_3831; // @[lsu_bus_buffer.scala 470:27]
  wire  _T_3833 = _T_3829 | _T_3832; // @[lsu_bus_buffer.scala 469:77]
  wire  _T_3834 = buf_dual_1 & buf_dualhi_1; // @[lsu_bus_buffer.scala 471:26]
  wire  _T_3836 = ~buf_write[1]; // @[lsu_bus_buffer.scala 471:44]
  wire  _T_3837 = _T_3834 & _T_3836; // @[lsu_bus_buffer.scala 471:42]
  wire  _T_3838 = _T_3837 & buf_samedw_1; // @[lsu_bus_buffer.scala 471:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_dualtag_1}; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_3839 = io_lsu_axi_r_bits_id == _GEN_373; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_3840 = _T_3838 & _T_3839; // @[lsu_bus_buffer.scala 471:74]
  wire  _T_3841 = _T_3833 | _T_3840; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3842 = bus_rsp_read & _T_3841; // @[lsu_bus_buffer.scala 469:25]
  wire  _T_3843 = _T_3828 | _T_3842; // @[lsu_bus_buffer.scala 468:105]
  wire  _GEN_118 = _T_3782 & _T_3843; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3748 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3744 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3721 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3869 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3879 = buf_ldfwd >> buf_dualtag_1; // @[lsu_bus_buffer.scala 483:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[lsu_bus_buffer.scala 483:58]
  wire [2:0] _GEN_375 = {{1'd0}, _GEN_101}; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_3881 = io_lsu_axi_r_bits_id == _GEN_375; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_3882 = _T_3879[0] & _T_3881; // @[lsu_bus_buffer.scala 483:38]
  wire  _T_3883 = _T_3839 | _T_3882; // @[lsu_bus_buffer.scala 482:95]
  wire  _T_3884 = bus_rsp_read & _T_3883; // @[lsu_bus_buffer.scala 482:45]
  wire  _GEN_112 = _T_3869 & _T_3884; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3782 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3748 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3744 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3721 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3761 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 456:49]
  wire  _T_3762 = _T_3761 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 456:70]
  wire  _T_3887 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3890 = RspPtr == 2'h1; // @[lsu_bus_buffer.scala 488:37]
  wire  _T_3891 = buf_dualtag_1 == RspPtr; // @[lsu_bus_buffer.scala 488:98]
  wire  _T_3892 = buf_dual_1 & _T_3891; // @[lsu_bus_buffer.scala 488:80]
  wire  _T_3893 = _T_3890 | _T_3892; // @[lsu_bus_buffer.scala 488:65]
  wire  _T_3894 = _T_3893 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 488:112]
  wire  _T_3895 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3887 ? _T_3894 : _T_3895; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3869 ? _T_3762 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3782 ? _T_3762 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3748 ? _T_3762 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3744 ? _T_3554 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3721 ? _T_3737 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2231 = _T_1864 & buf_state_en_1; // @[lsu_bus_buffer.scala 405:94]
  wire  _T_2241 = _T_2137 & _T_1867; // @[lsu_bus_buffer.scala 407:71]
  wire  _T_2243 = _T_2241 & _T_1854; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2244 = _T_4471 | _T_2243; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2248 = _T_2144 & _T_1868; // @[lsu_bus_buffer.scala 408:52]
  wire  _T_2250 = _T_2248 & _T_1856; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2251 = _T_2244 | _T_2250; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2252 = _T_2231 & _T_2251; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2254 = _T_2252 | buf_age_1[0]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2268 = _T_2241 & _T_1865; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2269 = _T_4476 | _T_2268; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2275 = _T_2248 & _T_1867; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2276 = _T_2269 | _T_2275; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2277 = _T_2231 & _T_2276; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2279 = _T_2277 | buf_age_1[1]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2293 = _T_2241 & _T_1876; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2294 = _T_4481 | _T_2293; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2300 = _T_2248 & _T_1878; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2301 = _T_2294 | _T_2300; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2302 = _T_2231 & _T_2301; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2304 = _T_2302 | buf_age_1[2]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2318 = _T_2241 & _T_1887; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2319 = _T_4486 | _T_2318; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2325 = _T_2248 & _T_1889; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2326 = _T_2319 | _T_2325; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2327 = _T_2231 & _T_2326; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2329 = _T_2327 | buf_age_1[3]; // @[lsu_bus_buffer.scala 408:97]
  wire [2:0] _T_2331 = {_T_2329,_T_2304,_T_2279}; // @[Cat.scala 29:58]
  wire  _T_3921 = 2'h2 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_3922 = _T_3534 & _T_3921; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_3924 = 2'h2 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_3925 = _T_3537 & _T_3924; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_3926 = _T_3922 | _T_3925; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_3927 = _T_853 & _T_3926; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_3928 = 2'h2 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_3929 = ibuf_drain_vld & _T_3928; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_3930 = _T_3927 | _T_3929; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_3975 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4020 = io_lsu_axi_b_bits_id == 3'h2; // @[lsu_bus_buffer.scala 468:73]
  wire  _T_4021 = bus_rsp_write & _T_4020; // @[lsu_bus_buffer.scala 468:52]
  wire  _T_4022 = io_lsu_axi_r_bits_id == 3'h2; // @[lsu_bus_buffer.scala 469:46]
  wire [2:0] _GEN_376 = {{1'd0}, buf_ldfwdtag_2}; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_4024 = io_lsu_axi_r_bits_id == _GEN_376; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_4025 = buf_ldfwd[2] & _T_4024; // @[lsu_bus_buffer.scala 470:27]
  wire  _T_4026 = _T_4022 | _T_4025; // @[lsu_bus_buffer.scala 469:77]
  wire  _T_4027 = buf_dual_2 & buf_dualhi_2; // @[lsu_bus_buffer.scala 471:26]
  wire  _T_4029 = ~buf_write[2]; // @[lsu_bus_buffer.scala 471:44]
  wire  _T_4030 = _T_4027 & _T_4029; // @[lsu_bus_buffer.scala 471:42]
  wire  _T_4031 = _T_4030 & buf_samedw_2; // @[lsu_bus_buffer.scala 471:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_377 = {{1'd0}, buf_dualtag_2}; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_4032 = io_lsu_axi_r_bits_id == _GEN_377; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_4033 = _T_4031 & _T_4032; // @[lsu_bus_buffer.scala 471:74]
  wire  _T_4034 = _T_4026 | _T_4033; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_4035 = bus_rsp_read & _T_4034; // @[lsu_bus_buffer.scala 469:25]
  wire  _T_4036 = _T_4021 | _T_4035; // @[lsu_bus_buffer.scala 468:105]
  wire  _GEN_194 = _T_3975 & _T_4036; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3941 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3937 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3914 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4062 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4072 = buf_ldfwd >> buf_dualtag_2; // @[lsu_bus_buffer.scala 483:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[lsu_bus_buffer.scala 483:58]
  wire [2:0] _GEN_379 = {{1'd0}, _GEN_177}; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_4074 = io_lsu_axi_r_bits_id == _GEN_379; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_4075 = _T_4072[0] & _T_4074; // @[lsu_bus_buffer.scala 483:38]
  wire  _T_4076 = _T_4032 | _T_4075; // @[lsu_bus_buffer.scala 482:95]
  wire  _T_4077 = bus_rsp_read & _T_4076; // @[lsu_bus_buffer.scala 482:45]
  wire  _GEN_188 = _T_4062 & _T_4077; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3975 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3941 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3937 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3914 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3954 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 456:49]
  wire  _T_3955 = _T_3954 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 456:70]
  wire  _T_4080 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4083 = RspPtr == 2'h2; // @[lsu_bus_buffer.scala 488:37]
  wire  _T_4084 = buf_dualtag_2 == RspPtr; // @[lsu_bus_buffer.scala 488:98]
  wire  _T_4085 = buf_dual_2 & _T_4084; // @[lsu_bus_buffer.scala 488:80]
  wire  _T_4086 = _T_4083 | _T_4085; // @[lsu_bus_buffer.scala 488:65]
  wire  _T_4087 = _T_4086 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 488:112]
  wire  _T_4088 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4080 ? _T_4087 : _T_4088; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4062 ? _T_3955 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3975 ? _T_3955 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3941 ? _T_3955 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3937 ? _T_3554 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3914 ? _T_3930 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2333 = _T_1875 & buf_state_en_2; // @[lsu_bus_buffer.scala 405:94]
  wire  _T_2343 = _T_2137 & _T_1878; // @[lsu_bus_buffer.scala 407:71]
  wire  _T_2345 = _T_2343 & _T_1854; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2346 = _T_4471 | _T_2345; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2350 = _T_2144 & _T_1879; // @[lsu_bus_buffer.scala 408:52]
  wire  _T_2352 = _T_2350 & _T_1856; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2353 = _T_2346 | _T_2352; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2354 = _T_2333 & _T_2353; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2356 = _T_2354 | buf_age_2[0]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2370 = _T_2343 & _T_1865; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2371 = _T_4476 | _T_2370; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2377 = _T_2350 & _T_1867; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2378 = _T_2371 | _T_2377; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2379 = _T_2333 & _T_2378; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2381 = _T_2379 | buf_age_2[1]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2395 = _T_2343 & _T_1876; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2396 = _T_4481 | _T_2395; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2402 = _T_2350 & _T_1878; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2403 = _T_2396 | _T_2402; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2404 = _T_2333 & _T_2403; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2406 = _T_2404 | buf_age_2[2]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2420 = _T_2343 & _T_1887; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2421 = _T_4486 | _T_2420; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2427 = _T_2350 & _T_1889; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2428 = _T_2421 | _T_2427; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2429 = _T_2333 & _T_2428; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2431 = _T_2429 | buf_age_2[3]; // @[lsu_bus_buffer.scala 408:97]
  wire [2:0] _T_2433 = {_T_2431,_T_2406,_T_2381}; // @[Cat.scala 29:58]
  wire  _T_4114 = 2'h3 == WrPtr0_r; // @[lsu_bus_buffer.scala 443:117]
  wire  _T_4115 = _T_3534 & _T_4114; // @[lsu_bus_buffer.scala 443:112]
  wire  _T_4117 = 2'h3 == WrPtr1_r; // @[lsu_bus_buffer.scala 443:166]
  wire  _T_4118 = _T_3537 & _T_4117; // @[lsu_bus_buffer.scala 443:161]
  wire  _T_4119 = _T_4115 | _T_4118; // @[lsu_bus_buffer.scala 443:132]
  wire  _T_4120 = _T_853 & _T_4119; // @[lsu_bus_buffer.scala 443:63]
  wire  _T_4121 = 2'h3 == ibuf_tag; // @[lsu_bus_buffer.scala 443:206]
  wire  _T_4122 = ibuf_drain_vld & _T_4121; // @[lsu_bus_buffer.scala 443:201]
  wire  _T_4123 = _T_4120 | _T_4122; // @[lsu_bus_buffer.scala 443:183]
  wire  _T_4168 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4213 = io_lsu_axi_b_bits_id == 3'h3; // @[lsu_bus_buffer.scala 468:73]
  wire  _T_4214 = bus_rsp_write & _T_4213; // @[lsu_bus_buffer.scala 468:52]
  wire  _T_4215 = io_lsu_axi_r_bits_id == 3'h3; // @[lsu_bus_buffer.scala 469:46]
  wire [2:0] _GEN_380 = {{1'd0}, buf_ldfwdtag_3}; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_4217 = io_lsu_axi_r_bits_id == _GEN_380; // @[lsu_bus_buffer.scala 470:47]
  wire  _T_4218 = buf_ldfwd[3] & _T_4217; // @[lsu_bus_buffer.scala 470:27]
  wire  _T_4219 = _T_4215 | _T_4218; // @[lsu_bus_buffer.scala 469:77]
  wire  _T_4220 = buf_dual_3 & buf_dualhi_3; // @[lsu_bus_buffer.scala 471:26]
  wire  _T_4222 = ~buf_write[3]; // @[lsu_bus_buffer.scala 471:44]
  wire  _T_4223 = _T_4220 & _T_4222; // @[lsu_bus_buffer.scala 471:42]
  wire  _T_4224 = _T_4223 & buf_samedw_3; // @[lsu_bus_buffer.scala 471:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_381 = {{1'd0}, buf_dualtag_3}; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_4225 = io_lsu_axi_r_bits_id == _GEN_381; // @[lsu_bus_buffer.scala 471:94]
  wire  _T_4226 = _T_4224 & _T_4225; // @[lsu_bus_buffer.scala 471:74]
  wire  _T_4227 = _T_4219 | _T_4226; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_4228 = bus_rsp_read & _T_4227; // @[lsu_bus_buffer.scala 469:25]
  wire  _T_4229 = _T_4214 | _T_4228; // @[lsu_bus_buffer.scala 468:105]
  wire  _GEN_270 = _T_4168 & _T_4229; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4134 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4130 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4107 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4255 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4265 = buf_ldfwd >> buf_dualtag_3; // @[lsu_bus_buffer.scala 483:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[lsu_bus_buffer.scala 483:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[lsu_bus_buffer.scala 483:58]
  wire [2:0] _GEN_383 = {{1'd0}, _GEN_253}; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_4267 = io_lsu_axi_r_bits_id == _GEN_383; // @[lsu_bus_buffer.scala 483:58]
  wire  _T_4268 = _T_4265[0] & _T_4267; // @[lsu_bus_buffer.scala 483:38]
  wire  _T_4269 = _T_4225 | _T_4268; // @[lsu_bus_buffer.scala 482:95]
  wire  _T_4270 = bus_rsp_read & _T_4269; // @[lsu_bus_buffer.scala 482:45]
  wire  _GEN_264 = _T_4255 & _T_4270; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4168 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4134 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4130 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4107 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4147 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 456:49]
  wire  _T_4148 = _T_4147 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 456:70]
  wire  _T_4273 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4276 = RspPtr == 2'h3; // @[lsu_bus_buffer.scala 488:37]
  wire  _T_4277 = buf_dualtag_3 == RspPtr; // @[lsu_bus_buffer.scala 488:98]
  wire  _T_4278 = buf_dual_3 & _T_4277; // @[lsu_bus_buffer.scala 488:80]
  wire  _T_4279 = _T_4276 | _T_4278; // @[lsu_bus_buffer.scala 488:65]
  wire  _T_4280 = _T_4279 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 488:112]
  wire  _T_4281 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4273 ? _T_4280 : _T_4281; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4255 ? _T_4148 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4168 ? _T_4148 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4134 ? _T_4148 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4130 ? _T_3554 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4107 ? _T_4123 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2435 = _T_1886 & buf_state_en_3; // @[lsu_bus_buffer.scala 405:94]
  wire  _T_2445 = _T_2137 & _T_1889; // @[lsu_bus_buffer.scala 407:71]
  wire  _T_2447 = _T_2445 & _T_1854; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2448 = _T_4471 | _T_2447; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2452 = _T_2144 & _T_1890; // @[lsu_bus_buffer.scala 408:52]
  wire  _T_2454 = _T_2452 & _T_1856; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2455 = _T_2448 | _T_2454; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2456 = _T_2435 & _T_2455; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2458 = _T_2456 | buf_age_3[0]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2472 = _T_2445 & _T_1865; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2473 = _T_4476 | _T_2472; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2479 = _T_2452 & _T_1867; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2480 = _T_2473 | _T_2479; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2481 = _T_2435 & _T_2480; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2483 = _T_2481 | buf_age_3[1]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2497 = _T_2445 & _T_1876; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2498 = _T_4481 | _T_2497; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2504 = _T_2452 & _T_1878; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2505 = _T_2498 | _T_2504; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2506 = _T_2435 & _T_2505; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2508 = _T_2506 | buf_age_3[2]; // @[lsu_bus_buffer.scala 408:97]
  wire  _T_2522 = _T_2445 & _T_1887; // @[lsu_bus_buffer.scala 407:92]
  wire  _T_2523 = _T_4486 | _T_2522; // @[lsu_bus_buffer.scala 406:86]
  wire  _T_2529 = _T_2452 & _T_1889; // @[lsu_bus_buffer.scala 408:73]
  wire  _T_2530 = _T_2523 | _T_2529; // @[lsu_bus_buffer.scala 407:114]
  wire  _T_2531 = _T_2435 & _T_2530; // @[lsu_bus_buffer.scala 405:113]
  wire  _T_2533 = _T_2531 | buf_age_3[3]; // @[lsu_bus_buffer.scala 408:97]
  wire [2:0] _T_2535 = {_T_2533,_T_2508,_T_2483}; // @[Cat.scala 29:58]
  wire  _T_2799 = buf_state_0 == 3'h6; // @[lsu_bus_buffer.scala 416:47]
  wire  _T_2800 = _T_1853 | _T_2799; // @[lsu_bus_buffer.scala 416:32]
  wire  _T_2801 = ~_T_2800; // @[lsu_bus_buffer.scala 416:6]
  wire  _T_2809 = _T_2801 | _T_2141; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2816 = _T_2809 | _T_2148; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2817 = _T_2129 & _T_2816; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2821 = buf_state_1 == 3'h6; // @[lsu_bus_buffer.scala 416:47]
  wire  _T_2822 = _T_1864 | _T_2821; // @[lsu_bus_buffer.scala 416:32]
  wire  _T_2823 = ~_T_2822; // @[lsu_bus_buffer.scala 416:6]
  wire  _T_2831 = _T_2823 | _T_2166; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2838 = _T_2831 | _T_2173; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2839 = _T_2129 & _T_2838; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2843 = buf_state_2 == 3'h6; // @[lsu_bus_buffer.scala 416:47]
  wire  _T_2844 = _T_1875 | _T_2843; // @[lsu_bus_buffer.scala 416:32]
  wire  _T_2845 = ~_T_2844; // @[lsu_bus_buffer.scala 416:6]
  wire  _T_2853 = _T_2845 | _T_2191; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2860 = _T_2853 | _T_2198; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2861 = _T_2129 & _T_2860; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2865 = buf_state_3 == 3'h6; // @[lsu_bus_buffer.scala 416:47]
  wire  _T_2866 = _T_1886 | _T_2865; // @[lsu_bus_buffer.scala 416:32]
  wire  _T_2867 = ~_T_2866; // @[lsu_bus_buffer.scala 416:6]
  wire  _T_2875 = _T_2867 | _T_2216; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2882 = _T_2875 | _T_2223; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2883 = _T_2129 & _T_2882; // @[lsu_bus_buffer.scala 415:112]
  wire [3:0] buf_rspage_set_0 = {_T_2883,_T_2861,_T_2839,_T_2817}; // @[Cat.scala 29:58]
  wire  _T_2900 = _T_2801 | _T_2243; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2907 = _T_2900 | _T_2250; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2908 = _T_2231 & _T_2907; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2922 = _T_2823 | _T_2268; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2929 = _T_2922 | _T_2275; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2930 = _T_2231 & _T_2929; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2944 = _T_2845 | _T_2293; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2951 = _T_2944 | _T_2300; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2952 = _T_2231 & _T_2951; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_2966 = _T_2867 | _T_2318; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2973 = _T_2966 | _T_2325; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2974 = _T_2231 & _T_2973; // @[lsu_bus_buffer.scala 415:112]
  wire [3:0] buf_rspage_set_1 = {_T_2974,_T_2952,_T_2930,_T_2908}; // @[Cat.scala 29:58]
  wire  _T_2991 = _T_2801 | _T_2345; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_2998 = _T_2991 | _T_2352; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_2999 = _T_2333 & _T_2998; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3013 = _T_2823 | _T_2370; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3020 = _T_3013 | _T_2377; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3021 = _T_2333 & _T_3020; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3035 = _T_2845 | _T_2395; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3042 = _T_3035 | _T_2402; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3043 = _T_2333 & _T_3042; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3057 = _T_2867 | _T_2420; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3064 = _T_3057 | _T_2427; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3065 = _T_2333 & _T_3064; // @[lsu_bus_buffer.scala 415:112]
  wire [3:0] buf_rspage_set_2 = {_T_3065,_T_3043,_T_3021,_T_2999}; // @[Cat.scala 29:58]
  wire  _T_3082 = _T_2801 | _T_2447; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3089 = _T_3082 | _T_2454; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3090 = _T_2435 & _T_3089; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3104 = _T_2823 | _T_2472; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3111 = _T_3104 | _T_2479; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3112 = _T_2435 & _T_3111; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3126 = _T_2845 | _T_2497; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3133 = _T_3126 | _T_2504; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3134 = _T_2435 & _T_3133; // @[lsu_bus_buffer.scala 415:112]
  wire  _T_3148 = _T_2867 | _T_2522; // @[lsu_bus_buffer.scala 416:59]
  wire  _T_3155 = _T_3148 | _T_2529; // @[lsu_bus_buffer.scala 417:110]
  wire  _T_3156 = _T_2435 & _T_3155; // @[lsu_bus_buffer.scala 415:112]
  wire [3:0] buf_rspage_set_3 = {_T_3156,_T_3134,_T_3112,_T_3090}; // @[Cat.scala 29:58]
  wire  _T_3241 = _T_2865 | _T_1886; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3242 = ~_T_3241; // @[lsu_bus_buffer.scala 420:84]
  wire  _T_3243 = buf_rspageQ_0[3] & _T_3242; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3235 = _T_2843 | _T_1875; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3236 = ~_T_3235; // @[lsu_bus_buffer.scala 420:84]
  wire  _T_3237 = buf_rspageQ_0[2] & _T_3236; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3229 = _T_2821 | _T_1864; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3230 = ~_T_3229; // @[lsu_bus_buffer.scala 420:84]
  wire  _T_3231 = buf_rspageQ_0[1] & _T_3230; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3223 = _T_2799 | _T_1853; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3224 = ~_T_3223; // @[lsu_bus_buffer.scala 420:84]
  wire  _T_3225 = buf_rspageQ_0[0] & _T_3224; // @[lsu_bus_buffer.scala 420:82]
  wire [3:0] buf_rspage_0 = {_T_3243,_T_3237,_T_3231,_T_3225}; // @[Cat.scala 29:58]
  wire  _T_3162 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3165 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3168 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3171 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[lsu_bus_buffer.scala 419:88]
  wire [2:0] _T_3173 = {_T_3171,_T_3168,_T_3165}; // @[Cat.scala 29:58]
  wire  _T_3270 = buf_rspageQ_1[3] & _T_3242; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3264 = buf_rspageQ_1[2] & _T_3236; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3258 = buf_rspageQ_1[1] & _T_3230; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3252 = buf_rspageQ_1[0] & _T_3224; // @[lsu_bus_buffer.scala 420:82]
  wire [3:0] buf_rspage_1 = {_T_3270,_T_3264,_T_3258,_T_3252}; // @[Cat.scala 29:58]
  wire  _T_3177 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3180 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3183 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3186 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[lsu_bus_buffer.scala 419:88]
  wire [2:0] _T_3188 = {_T_3186,_T_3183,_T_3180}; // @[Cat.scala 29:58]
  wire  _T_3297 = buf_rspageQ_2[3] & _T_3242; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3291 = buf_rspageQ_2[2] & _T_3236; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3285 = buf_rspageQ_2[1] & _T_3230; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3279 = buf_rspageQ_2[0] & _T_3224; // @[lsu_bus_buffer.scala 420:82]
  wire [3:0] buf_rspage_2 = {_T_3297,_T_3291,_T_3285,_T_3279}; // @[Cat.scala 29:58]
  wire  _T_3192 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3195 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3198 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3201 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[lsu_bus_buffer.scala 419:88]
  wire [2:0] _T_3203 = {_T_3201,_T_3198,_T_3195}; // @[Cat.scala 29:58]
  wire  _T_3324 = buf_rspageQ_3[3] & _T_3242; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3318 = buf_rspageQ_3[2] & _T_3236; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3312 = buf_rspageQ_3[1] & _T_3230; // @[lsu_bus_buffer.scala 420:82]
  wire  _T_3306 = buf_rspageQ_3[0] & _T_3224; // @[lsu_bus_buffer.scala 420:82]
  wire [3:0] buf_rspage_3 = {_T_3324,_T_3318,_T_3312,_T_3306}; // @[Cat.scala 29:58]
  wire  _T_3207 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3210 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3213 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[lsu_bus_buffer.scala 419:88]
  wire  _T_3216 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[lsu_bus_buffer.scala 419:88]
  wire [2:0] _T_3218 = {_T_3216,_T_3213,_T_3210}; // @[Cat.scala 29:58]
  wire  _T_3329 = ibuf_drain_vld & _T_1854; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3331 = ibuf_drain_vld & _T_1865; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3333 = ibuf_drain_vld & _T_1876; // @[lsu_bus_buffer.scala 425:63]
  wire  _T_3335 = ibuf_drain_vld & _T_1887; // @[lsu_bus_buffer.scala 425:63]
  wire [3:0] ibuf_drainvec_vld = {_T_3335,_T_3333,_T_3331,_T_3329}; // @[Cat.scala 29:58]
  wire  _T_3343 = _T_3537 & _T_1857; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3352 = _T_3537 & _T_1868; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3361 = _T_3537 & _T_1879; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3370 = _T_3537 & _T_1890; // @[lsu_bus_buffer.scala 427:35]
  wire  _T_3400 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3402 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3404 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire  _T_3406 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 429:45]
  wire [3:0] buf_dual_in = {_T_3406,_T_3404,_T_3402,_T_3400}; // @[Cat.scala 29:58]
  wire  _T_3411 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3413 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3415 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire  _T_3417 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 430:47]
  wire [3:0] buf_samedw_in = {_T_3417,_T_3415,_T_3413,_T_3411}; // @[Cat.scala 29:58]
  wire  _T_3422 = ibuf_nomerge | ibuf_force_drain; // @[lsu_bus_buffer.scala 431:84]
  wire  _T_3423 = ibuf_drainvec_vld[0] ? _T_3422 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3426 = ibuf_drainvec_vld[1] ? _T_3422 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3429 = ibuf_drainvec_vld[2] ? _T_3422 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire  _T_3432 = ibuf_drainvec_vld[3] ? _T_3422 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 431:48]
  wire [3:0] buf_nomerge_in = {_T_3432,_T_3429,_T_3426,_T_3423}; // @[Cat.scala 29:58]
  wire  _T_3440 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3343; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3445 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3352; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3450 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3361; // @[lsu_bus_buffer.scala 432:47]
  wire  _T_3455 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3370; // @[lsu_bus_buffer.scala 432:47]
  wire [3:0] buf_dualhi_in = {_T_3455,_T_3450,_T_3445,_T_3440}; // @[Cat.scala 29:58]
  wire  _T_3484 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3486 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3488 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire  _T_3490 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 434:51]
  wire [3:0] buf_sideeffect_in = {_T_3490,_T_3488,_T_3486,_T_3484}; // @[Cat.scala 29:58]
  wire  _T_3495 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3497 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3499 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3501 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 435:47]
  wire [3:0] buf_unsign_in = {_T_3501,_T_3499,_T_3497,_T_3495}; // @[Cat.scala 29:58]
  wire  _T_3518 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3520 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3522 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire  _T_3524 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 437:46]
  wire [3:0] buf_write_in = {_T_3524,_T_3522,_T_3520,_T_3518}; // @[Cat.scala 29:58]
  wire  _T_3557 = obuf_nosend & bus_rsp_read; // @[lsu_bus_buffer.scala 453:89]
  wire  _T_3559 = _T_3557 & _T_1351; // @[lsu_bus_buffer.scala 453:104]
  wire  _T_3572 = buf_state_en_0 & _T_3643; // @[lsu_bus_buffer.scala 458:44]
  wire  _T_3573 = _T_3572 & obuf_nosend; // @[lsu_bus_buffer.scala 458:60]
  wire  _T_3575 = _T_3573 & _T_1333; // @[lsu_bus_buffer.scala 458:74]
  wire  _T_3578 = _T_3568 & obuf_nosend; // @[lsu_bus_buffer.scala 460:67]
  wire  _T_3579 = _T_3578 & bus_rsp_read; // @[lsu_bus_buffer.scala 460:81]
  wire  _T_4872 = io_lsu_axi_r_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 564:64]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4872; // @[lsu_bus_buffer.scala 564:38]
  wire  _T_3582 = _T_3578 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 461:82]
  wire  _T_3657 = bus_rsp_read_error & _T_3636; // @[lsu_bus_buffer.scala 475:91]
  wire  _T_3659 = bus_rsp_read_error & buf_ldfwd[0]; // @[lsu_bus_buffer.scala 476:31]
  wire  _T_3661 = _T_3659 & _T_3638; // @[lsu_bus_buffer.scala 476:46]
  wire  _T_3662 = _T_3657 | _T_3661; // @[lsu_bus_buffer.scala 475:143]
  wire  _T_4870 = io_lsu_axi_b_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 563:66]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4870; // @[lsu_bus_buffer.scala 563:40]
  wire  _T_3665 = bus_rsp_write_error & _T_3634; // @[lsu_bus_buffer.scala 477:53]
  wire  _T_3666 = _T_3662 | _T_3665; // @[lsu_bus_buffer.scala 476:88]
  wire  _T_3667 = _T_3568 & _T_3666; // @[lsu_bus_buffer.scala 475:68]
  wire  _GEN_46 = _T_3589 & _T_3667; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3555 ? _T_3582 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3551 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3528 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3592 = ~bus_rsp_write_error; // @[lsu_bus_buffer.scala 465:73]
  wire  _T_3593 = buf_write[0] & _T_3592; // @[lsu_bus_buffer.scala 465:71]
  wire  _T_3594 = io_dec_tlu_force_halt | _T_3593; // @[lsu_bus_buffer.scala 465:55]
  wire  _T_3596 = ~buf_samedw_0; // @[lsu_bus_buffer.scala 466:30]
  wire  _T_3597 = buf_dual_0 & _T_3596; // @[lsu_bus_buffer.scala 466:28]
  wire  _T_3600 = _T_3597 & _T_3643; // @[lsu_bus_buffer.scala 466:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3601 = _GEN_21 != 3'h4; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3602 = _T_3600 & _T_3601; // @[lsu_bus_buffer.scala 466:61]
  wire  _T_4494 = _T_2746 | _T_2743; // @[lsu_bus_buffer.scala 524:93]
  wire  _T_4495 = _T_4494 | _T_2740; // @[lsu_bus_buffer.scala 524:93]
  wire  any_done_wait_state = _T_4495 | _T_2737; // @[lsu_bus_buffer.scala 524:93]
  wire  _T_3604 = buf_ldfwd[0] | any_done_wait_state; // @[lsu_bus_buffer.scala 467:31]
  wire  _T_3610 = buf_dualtag_0 == 2'h0; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3612 = buf_dualtag_0 == 2'h1; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3614 = buf_dualtag_0 == 2'h2; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3616 = buf_dualtag_0 == 2'h3; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3618 = _T_3610 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3619 = _T_3612 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3620 = _T_3614 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3621 = _T_3616 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3622 = _T_3618 | _T_3619; // @[Mux.scala 27:72]
  wire  _T_3623 = _T_3622 | _T_3620; // @[Mux.scala 27:72]
  wire  _T_3624 = _T_3623 | _T_3621; // @[Mux.scala 27:72]
  wire  _T_3626 = _T_3600 & _T_3624; // @[lsu_bus_buffer.scala 467:101]
  wire  _T_3627 = _GEN_21 == 3'h4; // @[lsu_bus_buffer.scala 467:167]
  wire  _T_3628 = _T_3626 & _T_3627; // @[lsu_bus_buffer.scala 467:138]
  wire  _T_3629 = _T_3628 & any_done_wait_state; // @[lsu_bus_buffer.scala 467:187]
  wire  _T_3630 = _T_3604 | _T_3629; // @[lsu_bus_buffer.scala 467:53]
  wire  _T_3653 = buf_state_bus_en_0 & bus_rsp_read; // @[lsu_bus_buffer.scala 474:47]
  wire  _T_3654 = _T_3653 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 474:62]
  wire  _T_3668 = ~buf_error_en_0; // @[lsu_bus_buffer.scala 478:50]
  wire  _T_3669 = buf_state_en_0 & _T_3668; // @[lsu_bus_buffer.scala 478:48]
  wire  _T_3681 = buf_ldfwd[0] | _T_3686[0]; // @[lsu_bus_buffer.scala 481:90]
  wire  _T_3682 = _T_3681 | any_done_wait_state; // @[lsu_bus_buffer.scala 481:118]
  wire  _GEN_29 = _T_3702 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3694 ? 1'h0 : _T_3702; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3694 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3676 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3676 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3589 & _T_3654; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3589 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3589 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3555 ? _T_3575 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3555 ? _T_3579 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3555 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3551 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3551 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3551 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3528 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3528 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3528 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3765 = buf_state_en_1 & _T_3836; // @[lsu_bus_buffer.scala 458:44]
  wire  _T_3766 = _T_3765 & obuf_nosend; // @[lsu_bus_buffer.scala 458:60]
  wire  _T_3768 = _T_3766 & _T_1333; // @[lsu_bus_buffer.scala 458:74]
  wire  _T_3771 = _T_3761 & obuf_nosend; // @[lsu_bus_buffer.scala 460:67]
  wire  _T_3772 = _T_3771 & bus_rsp_read; // @[lsu_bus_buffer.scala 460:81]
  wire  _T_3775 = _T_3771 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 461:82]
  wire  _T_3850 = bus_rsp_read_error & _T_3829; // @[lsu_bus_buffer.scala 475:91]
  wire  _T_3852 = bus_rsp_read_error & buf_ldfwd[1]; // @[lsu_bus_buffer.scala 476:31]
  wire  _T_3854 = _T_3852 & _T_3831; // @[lsu_bus_buffer.scala 476:46]
  wire  _T_3855 = _T_3850 | _T_3854; // @[lsu_bus_buffer.scala 475:143]
  wire  _T_3858 = bus_rsp_write_error & _T_3827; // @[lsu_bus_buffer.scala 477:53]
  wire  _T_3859 = _T_3855 | _T_3858; // @[lsu_bus_buffer.scala 476:88]
  wire  _T_3860 = _T_3761 & _T_3859; // @[lsu_bus_buffer.scala 475:68]
  wire  _GEN_122 = _T_3782 & _T_3860; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3748 ? _T_3775 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3744 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3721 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3786 = buf_write[1] & _T_3592; // @[lsu_bus_buffer.scala 465:71]
  wire  _T_3787 = io_dec_tlu_force_halt | _T_3786; // @[lsu_bus_buffer.scala 465:55]
  wire  _T_3789 = ~buf_samedw_1; // @[lsu_bus_buffer.scala 466:30]
  wire  _T_3790 = buf_dual_1 & _T_3789; // @[lsu_bus_buffer.scala 466:28]
  wire  _T_3793 = _T_3790 & _T_3836; // @[lsu_bus_buffer.scala 466:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3794 = _GEN_97 != 3'h4; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3795 = _T_3793 & _T_3794; // @[lsu_bus_buffer.scala 466:61]
  wire  _T_3797 = buf_ldfwd[1] | any_done_wait_state; // @[lsu_bus_buffer.scala 467:31]
  wire  _T_3803 = buf_dualtag_1 == 2'h0; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3805 = buf_dualtag_1 == 2'h1; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3807 = buf_dualtag_1 == 2'h2; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3809 = buf_dualtag_1 == 2'h3; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3811 = _T_3803 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3812 = _T_3805 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3813 = _T_3807 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3814 = _T_3809 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3815 = _T_3811 | _T_3812; // @[Mux.scala 27:72]
  wire  _T_3816 = _T_3815 | _T_3813; // @[Mux.scala 27:72]
  wire  _T_3817 = _T_3816 | _T_3814; // @[Mux.scala 27:72]
  wire  _T_3819 = _T_3793 & _T_3817; // @[lsu_bus_buffer.scala 467:101]
  wire  _T_3820 = _GEN_97 == 3'h4; // @[lsu_bus_buffer.scala 467:167]
  wire  _T_3821 = _T_3819 & _T_3820; // @[lsu_bus_buffer.scala 467:138]
  wire  _T_3822 = _T_3821 & any_done_wait_state; // @[lsu_bus_buffer.scala 467:187]
  wire  _T_3823 = _T_3797 | _T_3822; // @[lsu_bus_buffer.scala 467:53]
  wire  _T_3846 = buf_state_bus_en_1 & bus_rsp_read; // @[lsu_bus_buffer.scala 474:47]
  wire  _T_3847 = _T_3846 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 474:62]
  wire  _T_3861 = ~buf_error_en_1; // @[lsu_bus_buffer.scala 478:50]
  wire  _T_3862 = buf_state_en_1 & _T_3861; // @[lsu_bus_buffer.scala 478:48]
  wire  _T_3874 = buf_ldfwd[1] | _T_3879[0]; // @[lsu_bus_buffer.scala 481:90]
  wire  _T_3875 = _T_3874 | any_done_wait_state; // @[lsu_bus_buffer.scala 481:118]
  wire  _GEN_105 = _T_3895 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3887 ? 1'h0 : _T_3895; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3887 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3869 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3869 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3782 & _T_3847; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3782 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3782 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3748 ? _T_3768 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3748 ? _T_3772 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3748 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3744 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3744 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3744 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3721 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3721 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3721 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3958 = buf_state_en_2 & _T_4029; // @[lsu_bus_buffer.scala 458:44]
  wire  _T_3959 = _T_3958 & obuf_nosend; // @[lsu_bus_buffer.scala 458:60]
  wire  _T_3961 = _T_3959 & _T_1333; // @[lsu_bus_buffer.scala 458:74]
  wire  _T_3964 = _T_3954 & obuf_nosend; // @[lsu_bus_buffer.scala 460:67]
  wire  _T_3965 = _T_3964 & bus_rsp_read; // @[lsu_bus_buffer.scala 460:81]
  wire  _T_3968 = _T_3964 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 461:82]
  wire  _T_4043 = bus_rsp_read_error & _T_4022; // @[lsu_bus_buffer.scala 475:91]
  wire  _T_4045 = bus_rsp_read_error & buf_ldfwd[2]; // @[lsu_bus_buffer.scala 476:31]
  wire  _T_4047 = _T_4045 & _T_4024; // @[lsu_bus_buffer.scala 476:46]
  wire  _T_4048 = _T_4043 | _T_4047; // @[lsu_bus_buffer.scala 475:143]
  wire  _T_4051 = bus_rsp_write_error & _T_4020; // @[lsu_bus_buffer.scala 477:53]
  wire  _T_4052 = _T_4048 | _T_4051; // @[lsu_bus_buffer.scala 476:88]
  wire  _T_4053 = _T_3954 & _T_4052; // @[lsu_bus_buffer.scala 475:68]
  wire  _GEN_198 = _T_3975 & _T_4053; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3941 ? _T_3968 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3937 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3914 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_3979 = buf_write[2] & _T_3592; // @[lsu_bus_buffer.scala 465:71]
  wire  _T_3980 = io_dec_tlu_force_halt | _T_3979; // @[lsu_bus_buffer.scala 465:55]
  wire  _T_3982 = ~buf_samedw_2; // @[lsu_bus_buffer.scala 466:30]
  wire  _T_3983 = buf_dual_2 & _T_3982; // @[lsu_bus_buffer.scala 466:28]
  wire  _T_3986 = _T_3983 & _T_4029; // @[lsu_bus_buffer.scala 466:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3987 = _GEN_173 != 3'h4; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_3988 = _T_3986 & _T_3987; // @[lsu_bus_buffer.scala 466:61]
  wire  _T_3990 = buf_ldfwd[2] | any_done_wait_state; // @[lsu_bus_buffer.scala 467:31]
  wire  _T_3996 = buf_dualtag_2 == 2'h0; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_3998 = buf_dualtag_2 == 2'h1; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4000 = buf_dualtag_2 == 2'h2; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4002 = buf_dualtag_2 == 2'h3; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4004 = _T_3996 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4005 = _T_3998 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4006 = _T_4000 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4007 = _T_4002 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4008 = _T_4004 | _T_4005; // @[Mux.scala 27:72]
  wire  _T_4009 = _T_4008 | _T_4006; // @[Mux.scala 27:72]
  wire  _T_4010 = _T_4009 | _T_4007; // @[Mux.scala 27:72]
  wire  _T_4012 = _T_3986 & _T_4010; // @[lsu_bus_buffer.scala 467:101]
  wire  _T_4013 = _GEN_173 == 3'h4; // @[lsu_bus_buffer.scala 467:167]
  wire  _T_4014 = _T_4012 & _T_4013; // @[lsu_bus_buffer.scala 467:138]
  wire  _T_4015 = _T_4014 & any_done_wait_state; // @[lsu_bus_buffer.scala 467:187]
  wire  _T_4016 = _T_3990 | _T_4015; // @[lsu_bus_buffer.scala 467:53]
  wire  _T_4039 = buf_state_bus_en_2 & bus_rsp_read; // @[lsu_bus_buffer.scala 474:47]
  wire  _T_4040 = _T_4039 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 474:62]
  wire  _T_4054 = ~buf_error_en_2; // @[lsu_bus_buffer.scala 478:50]
  wire  _T_4055 = buf_state_en_2 & _T_4054; // @[lsu_bus_buffer.scala 478:48]
  wire  _T_4067 = buf_ldfwd[2] | _T_4072[0]; // @[lsu_bus_buffer.scala 481:90]
  wire  _T_4068 = _T_4067 | any_done_wait_state; // @[lsu_bus_buffer.scala 481:118]
  wire  _GEN_181 = _T_4088 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4080 ? 1'h0 : _T_4088; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4080 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4062 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4062 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3975 & _T_4040; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3975 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3975 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3941 ? _T_3961 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3941 ? _T_3965 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3941 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3937 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3937 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3937 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3914 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3914 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3914 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4151 = buf_state_en_3 & _T_4222; // @[lsu_bus_buffer.scala 458:44]
  wire  _T_4152 = _T_4151 & obuf_nosend; // @[lsu_bus_buffer.scala 458:60]
  wire  _T_4154 = _T_4152 & _T_1333; // @[lsu_bus_buffer.scala 458:74]
  wire  _T_4157 = _T_4147 & obuf_nosend; // @[lsu_bus_buffer.scala 460:67]
  wire  _T_4158 = _T_4157 & bus_rsp_read; // @[lsu_bus_buffer.scala 460:81]
  wire  _T_4161 = _T_4157 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 461:82]
  wire  _T_4236 = bus_rsp_read_error & _T_4215; // @[lsu_bus_buffer.scala 475:91]
  wire  _T_4238 = bus_rsp_read_error & buf_ldfwd[3]; // @[lsu_bus_buffer.scala 476:31]
  wire  _T_4240 = _T_4238 & _T_4217; // @[lsu_bus_buffer.scala 476:46]
  wire  _T_4241 = _T_4236 | _T_4240; // @[lsu_bus_buffer.scala 475:143]
  wire  _T_4244 = bus_rsp_write_error & _T_4213; // @[lsu_bus_buffer.scala 477:53]
  wire  _T_4245 = _T_4241 | _T_4244; // @[lsu_bus_buffer.scala 476:88]
  wire  _T_4246 = _T_4147 & _T_4245; // @[lsu_bus_buffer.scala 475:68]
  wire  _GEN_274 = _T_4168 & _T_4246; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4134 ? _T_4161 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4130 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4107 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4172 = buf_write[3] & _T_3592; // @[lsu_bus_buffer.scala 465:71]
  wire  _T_4173 = io_dec_tlu_force_halt | _T_4172; // @[lsu_bus_buffer.scala 465:55]
  wire  _T_4175 = ~buf_samedw_3; // @[lsu_bus_buffer.scala 466:30]
  wire  _T_4176 = buf_dual_3 & _T_4175; // @[lsu_bus_buffer.scala 466:28]
  wire  _T_4179 = _T_4176 & _T_4222; // @[lsu_bus_buffer.scala 466:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[lsu_bus_buffer.scala 466:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_4180 = _GEN_249 != 3'h4; // @[lsu_bus_buffer.scala 466:90]
  wire  _T_4181 = _T_4179 & _T_4180; // @[lsu_bus_buffer.scala 466:61]
  wire  _T_4183 = buf_ldfwd[3] | any_done_wait_state; // @[lsu_bus_buffer.scala 467:31]
  wire  _T_4189 = buf_dualtag_3 == 2'h0; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4191 = buf_dualtag_3 == 2'h1; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4193 = buf_dualtag_3 == 2'h2; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4195 = buf_dualtag_3 == 2'h3; // @[lsu_bus_buffer.scala 56:118]
  wire  _T_4197 = _T_4189 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4198 = _T_4191 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4199 = _T_4193 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4200 = _T_4195 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4201 = _T_4197 | _T_4198; // @[Mux.scala 27:72]
  wire  _T_4202 = _T_4201 | _T_4199; // @[Mux.scala 27:72]
  wire  _T_4203 = _T_4202 | _T_4200; // @[Mux.scala 27:72]
  wire  _T_4205 = _T_4179 & _T_4203; // @[lsu_bus_buffer.scala 467:101]
  wire  _T_4206 = _GEN_249 == 3'h4; // @[lsu_bus_buffer.scala 467:167]
  wire  _T_4207 = _T_4205 & _T_4206; // @[lsu_bus_buffer.scala 467:138]
  wire  _T_4208 = _T_4207 & any_done_wait_state; // @[lsu_bus_buffer.scala 467:187]
  wire  _T_4209 = _T_4183 | _T_4208; // @[lsu_bus_buffer.scala 467:53]
  wire  _T_4232 = buf_state_bus_en_3 & bus_rsp_read; // @[lsu_bus_buffer.scala 474:47]
  wire  _T_4233 = _T_4232 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 474:62]
  wire  _T_4247 = ~buf_error_en_3; // @[lsu_bus_buffer.scala 478:50]
  wire  _T_4248 = buf_state_en_3 & _T_4247; // @[lsu_bus_buffer.scala 478:48]
  wire  _T_4260 = buf_ldfwd[3] | _T_4265[0]; // @[lsu_bus_buffer.scala 481:90]
  wire  _T_4261 = _T_4260 | any_done_wait_state; // @[lsu_bus_buffer.scala 481:118]
  wire  _GEN_257 = _T_4281 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4273 ? 1'h0 : _T_4281; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4273 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4255 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4255 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4168 & _T_4233; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4168 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4168 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4134 ? _T_4154 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4134 ? _T_4158 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4134 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4130 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4130 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4130 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4107 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4107 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4107 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4336; // @[Reg.scala 27:20]
  reg  _T_4339; // @[Reg.scala 27:20]
  reg  _T_4342; // @[Reg.scala 27:20]
  reg  _T_4345; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4345,_T_4342,_T_4339,_T_4336}; // @[Cat.scala 29:58]
  reg  _T_4411; // @[lsu_bus_buffer.scala 517:80]
  reg  _T_4406; // @[lsu_bus_buffer.scala 517:80]
  reg  _T_4401; // @[lsu_bus_buffer.scala 517:80]
  reg  _T_4396; // @[lsu_bus_buffer.scala 517:80]
  wire [3:0] buf_error = {_T_4411,_T_4406,_T_4401,_T_4396}; // @[Cat.scala 29:58]
  wire  _T_4393 = buf_error_en_0 | buf_error[0]; // @[lsu_bus_buffer.scala 517:84]
  wire  _T_4394 = ~buf_rst_0; // @[lsu_bus_buffer.scala 517:126]
  wire  _T_4398 = buf_error_en_1 | buf_error[1]; // @[lsu_bus_buffer.scala 517:84]
  wire  _T_4399 = ~buf_rst_1; // @[lsu_bus_buffer.scala 517:126]
  wire  _T_4403 = buf_error_en_2 | buf_error[2]; // @[lsu_bus_buffer.scala 517:84]
  wire  _T_4404 = ~buf_rst_2; // @[lsu_bus_buffer.scala 517:126]
  wire  _T_4408 = buf_error_en_3 | buf_error[3]; // @[lsu_bus_buffer.scala 517:84]
  wire  _T_4409 = ~buf_rst_3; // @[lsu_bus_buffer.scala 517:126]
  wire [1:0] _T_4415 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4416 = io_ldst_dual_m ? _T_4415 : {{1'd0}, io_lsu_busreq_m}; // @[lsu_bus_buffer.scala 520:28]
  wire [1:0] _T_4417 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4418 = io_ldst_dual_r ? _T_4417 : {{1'd0}, io_lsu_busreq_r}; // @[lsu_bus_buffer.scala 520:94]
  wire [2:0] _T_4419 = _T_4416 + _T_4418; // @[lsu_bus_buffer.scala 520:88]
  wire [2:0] _GEN_388 = {{2'd0}, ibuf_valid}; // @[lsu_bus_buffer.scala 520:154]
  wire [3:0] _T_4420 = _T_4419 + _GEN_388; // @[lsu_bus_buffer.scala 520:154]
  wire [1:0] _T_4425 = _T_5 + _T_12; // @[lsu_bus_buffer.scala 520:217]
  wire [1:0] _GEN_389 = {{1'd0}, _T_19}; // @[lsu_bus_buffer.scala 520:217]
  wire [2:0] _T_4426 = _T_4425 + _GEN_389; // @[lsu_bus_buffer.scala 520:217]
  wire [2:0] _GEN_390 = {{2'd0}, _T_26}; // @[lsu_bus_buffer.scala 520:217]
  wire [3:0] _T_4427 = _T_4426 + _GEN_390; // @[lsu_bus_buffer.scala 520:217]
  wire [3:0] buf_numvld_any = _T_4420 + _T_4427; // @[lsu_bus_buffer.scala 520:169]
  wire  _T_4498 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[lsu_bus_buffer.scala 526:52]
  wire  _T_4499 = buf_numvld_any >= 4'h3; // @[lsu_bus_buffer.scala 526:92]
  wire  _T_4500 = buf_numvld_any == 4'h4; // @[lsu_bus_buffer.scala 526:121]
  wire  _T_4502 = |buf_state_0; // @[lsu_bus_buffer.scala 527:52]
  wire  _T_4503 = |buf_state_1; // @[lsu_bus_buffer.scala 527:52]
  wire  _T_4504 = |buf_state_2; // @[lsu_bus_buffer.scala 527:52]
  wire  _T_4505 = |buf_state_3; // @[lsu_bus_buffer.scala 527:52]
  wire  _T_4506 = _T_4502 | _T_4503; // @[lsu_bus_buffer.scala 527:65]
  wire  _T_4507 = _T_4506 | _T_4504; // @[lsu_bus_buffer.scala 527:65]
  wire  _T_4508 = _T_4507 | _T_4505; // @[lsu_bus_buffer.scala 527:65]
  wire  _T_4509 = ~_T_4508; // @[lsu_bus_buffer.scala 527:34]
  wire  _T_4511 = _T_4509 & _T_852; // @[lsu_bus_buffer.scala 527:70]
  wire  _T_4514 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4515 = _T_4514 & io_lsu_pkt_m_bits_load; // @[lsu_bus_buffer.scala 529:85]
  wire  _T_4516 = ~io_flush_m_up; // @[lsu_bus_buffer.scala 529:112]
  wire  _T_4517 = _T_4515 & _T_4516; // @[lsu_bus_buffer.scala 529:110]
  wire  _T_4518 = ~io_ld_full_hit_m; // @[lsu_bus_buffer.scala 529:129]
  wire  _T_4520 = ~io_lsu_commit_r; // @[lsu_bus_buffer.scala 532:74]
  reg  lsu_nonblock_load_valid_r; // @[lsu_bus_buffer.scala 617:66]
  wire  _T_4538 = _T_2799 & _T_3643; // @[Mux.scala 27:72]
  wire  _T_4539 = _T_2821 & _T_3836; // @[Mux.scala 27:72]
  wire  _T_4540 = _T_2843 & _T_4029; // @[Mux.scala 27:72]
  wire  _T_4541 = _T_2865 & _T_4222; // @[Mux.scala 27:72]
  wire  _T_4542 = _T_4538 | _T_4539; // @[Mux.scala 27:72]
  wire  _T_4543 = _T_4542 | _T_4540; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4543 | _T_4541; // @[Mux.scala 27:72]
  wire  _T_4549 = buf_error[0] & _T_3643; // @[lsu_bus_buffer.scala 535:121]
  wire  _T_4554 = buf_error[1] & _T_3836; // @[lsu_bus_buffer.scala 535:121]
  wire  _T_4559 = buf_error[2] & _T_4029; // @[lsu_bus_buffer.scala 535:121]
  wire  _T_4564 = buf_error[3] & _T_4222; // @[lsu_bus_buffer.scala 535:121]
  wire  _T_4565 = _T_2799 & _T_4549; // @[Mux.scala 27:72]
  wire  _T_4566 = _T_2821 & _T_4554; // @[Mux.scala 27:72]
  wire  _T_4567 = _T_2843 & _T_4559; // @[Mux.scala 27:72]
  wire  _T_4568 = _T_2865 & _T_4564; // @[Mux.scala 27:72]
  wire  _T_4569 = _T_4565 | _T_4566; // @[Mux.scala 27:72]
  wire  _T_4570 = _T_4569 | _T_4567; // @[Mux.scala 27:72]
  wire  _T_4577 = ~buf_dual_0; // @[lsu_bus_buffer.scala 536:122]
  wire  _T_4578 = ~buf_dualhi_0; // @[lsu_bus_buffer.scala 536:137]
  wire  _T_4579 = _T_4577 | _T_4578; // @[lsu_bus_buffer.scala 536:135]
  wire  _T_4580 = _T_4538 & _T_4579; // @[lsu_bus_buffer.scala 536:119]
  wire  _T_4585 = ~buf_dual_1; // @[lsu_bus_buffer.scala 536:122]
  wire  _T_4586 = ~buf_dualhi_1; // @[lsu_bus_buffer.scala 536:137]
  wire  _T_4587 = _T_4585 | _T_4586; // @[lsu_bus_buffer.scala 536:135]
  wire  _T_4588 = _T_4539 & _T_4587; // @[lsu_bus_buffer.scala 536:119]
  wire  _T_4593 = ~buf_dual_2; // @[lsu_bus_buffer.scala 536:122]
  wire  _T_4594 = ~buf_dualhi_2; // @[lsu_bus_buffer.scala 536:137]
  wire  _T_4595 = _T_4593 | _T_4594; // @[lsu_bus_buffer.scala 536:135]
  wire  _T_4596 = _T_4540 & _T_4595; // @[lsu_bus_buffer.scala 536:119]
  wire  _T_4601 = ~buf_dual_3; // @[lsu_bus_buffer.scala 536:122]
  wire  _T_4602 = ~buf_dualhi_3; // @[lsu_bus_buffer.scala 536:137]
  wire  _T_4603 = _T_4601 | _T_4602; // @[lsu_bus_buffer.scala 536:135]
  wire  _T_4604 = _T_4541 & _T_4603; // @[lsu_bus_buffer.scala 536:119]
  wire [1:0] _T_4607 = _T_4596 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4608 = _T_4604 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_391 = {{1'd0}, _T_4588}; // @[Mux.scala 27:72]
  wire [1:0] _T_4610 = _GEN_391 | _T_4607; // @[Mux.scala 27:72]
  wire [31:0] _T_4645 = _T_4580 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4646 = _T_4588 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4647 = _T_4596 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4648 = _T_4604 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4649 = _T_4645 | _T_4646; // @[Mux.scala 27:72]
  wire [31:0] _T_4650 = _T_4649 | _T_4647; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4650 | _T_4648; // @[Mux.scala 27:72]
  wire  _T_4657 = _T_4538 & _T_3641; // @[lsu_bus_buffer.scala 538:105]
  wire  _T_4663 = _T_4539 & _T_3834; // @[lsu_bus_buffer.scala 538:105]
  wire  _T_4669 = _T_4540 & _T_4027; // @[lsu_bus_buffer.scala 538:105]
  wire  _T_4675 = _T_4541 & _T_4220; // @[lsu_bus_buffer.scala 538:105]
  wire [31:0] _T_4676 = _T_4657 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4677 = _T_4663 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4678 = _T_4669 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4679 = _T_4675 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4680 = _T_4676 | _T_4677; // @[Mux.scala 27:72]
  wire [31:0] _T_4681 = _T_4680 | _T_4678; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4681 | _T_4679; // @[Mux.scala 27:72]
  wire  _T_4683 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h0; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_4684 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h1; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_4685 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h2; // @[lsu_bus_buffer.scala 57:123]
  wire  _T_4686 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h3; // @[lsu_bus_buffer.scala 57:123]
  wire [31:0] _T_4687 = _T_4683 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4688 = _T_4684 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4689 = _T_4685 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4690 = _T_4686 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4691 = _T_4687 | _T_4688; // @[Mux.scala 27:72]
  wire [31:0] _T_4692 = _T_4691 | _T_4689; // @[Mux.scala 27:72]
  wire [31:0] _T_4693 = _T_4692 | _T_4690; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4693[1:0]; // @[lsu_bus_buffer.scala 539:96]
  wire [1:0] _T_4699 = _T_4683 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4700 = _T_4684 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4701 = _T_4685 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4702 = _T_4686 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4703 = _T_4699 | _T_4700; // @[Mux.scala 27:72]
  wire [1:0] _T_4704 = _T_4703 | _T_4701; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4704 | _T_4702; // @[Mux.scala 27:72]
  wire  _T_4714 = _T_4683 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4715 = _T_4684 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4716 = _T_4685 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4717 = _T_4686 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4718 = _T_4714 | _T_4715; // @[Mux.scala 27:72]
  wire  _T_4719 = _T_4718 | _T_4716; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4719 | _T_4717; // @[Mux.scala 27:72]
  wire [63:0] _T_4739 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_392 = {{2'd0}, lsu_nonblock_addr_offset}; // @[lsu_bus_buffer.scala 543:121]
  wire [5:0] _T_4740 = _GEN_392 * 4'h8; // @[lsu_bus_buffer.scala 543:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4739 >> _T_4740; // @[lsu_bus_buffer.scala 543:92]
  wire  _T_4741 = ~io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_buffer.scala 545:82]
  wire  _T_4743 = lsu_nonblock_sz == 2'h0; // @[lsu_bus_buffer.scala 546:94]
  wire  _T_4744 = lsu_nonblock_unsign & _T_4743; // @[lsu_bus_buffer.scala 546:76]
  wire [31:0] _T_4746 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4747 = lsu_nonblock_sz == 2'h1; // @[lsu_bus_buffer.scala 547:45]
  wire  _T_4748 = lsu_nonblock_unsign & _T_4747; // @[lsu_bus_buffer.scala 547:26]
  wire [31:0] _T_4750 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4751 = ~lsu_nonblock_unsign; // @[lsu_bus_buffer.scala 548:6]
  wire  _T_4753 = _T_4751 & _T_4743; // @[lsu_bus_buffer.scala 548:27]
  wire [23:0] _T_4756 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4758 = {_T_4756,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4761 = _T_4751 & _T_4747; // @[lsu_bus_buffer.scala 549:27]
  wire [15:0] _T_4764 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4766 = {_T_4764,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4767 = lsu_nonblock_sz == 2'h2; // @[lsu_bus_buffer.scala 550:21]
  wire [31:0] _T_4768 = _T_4744 ? _T_4746 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4769 = _T_4748 ? _T_4750 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4770 = _T_4753 ? _T_4758 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4771 = _T_4761 ? _T_4766 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4772 = _T_4767 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4773 = _T_4768 | _T_4769; // @[Mux.scala 27:72]
  wire [31:0] _T_4774 = _T_4773 | _T_4770; // @[Mux.scala 27:72]
  wire [31:0] _T_4775 = _T_4774 | _T_4771; // @[Mux.scala 27:72]
  wire [63:0] _GEN_393 = {{32'd0}, _T_4775}; // @[Mux.scala 27:72]
  wire [63:0] _T_4776 = _GEN_393 | _T_4772; // @[Mux.scala 27:72]
  wire  _T_4874 = obuf_valid & obuf_write; // @[lsu_bus_buffer.scala 568:37]
  wire  _T_4875 = ~obuf_cmd_done; // @[lsu_bus_buffer.scala 568:52]
  wire  _T_4876 = _T_4874 & _T_4875; // @[lsu_bus_buffer.scala 568:50]
  wire [31:0] _T_4880 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4882 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4887 = ~obuf_data_done; // @[lsu_bus_buffer.scala 580:51]
  wire  _T_4888 = _T_4874 & _T_4887; // @[lsu_bus_buffer.scala 580:49]
  wire [7:0] _T_4892 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4895 = obuf_valid & _T_1343; // @[lsu_bus_buffer.scala 585:37]
  wire  _T_4897 = _T_4895 & _T_1349; // @[lsu_bus_buffer.scala 585:51]
  wire  _T_4909 = io_lsu_bus_clk_en_q & buf_error[0]; // @[lsu_bus_buffer.scala 598:126]
  wire  _T_4911 = _T_4909 & buf_write[0]; // @[lsu_bus_buffer.scala 598:141]
  wire  _T_4914 = io_lsu_bus_clk_en_q & buf_error[1]; // @[lsu_bus_buffer.scala 598:126]
  wire  _T_4916 = _T_4914 & buf_write[1]; // @[lsu_bus_buffer.scala 598:141]
  wire  _T_4919 = io_lsu_bus_clk_en_q & buf_error[2]; // @[lsu_bus_buffer.scala 598:126]
  wire  _T_4921 = _T_4919 & buf_write[2]; // @[lsu_bus_buffer.scala 598:141]
  wire  _T_4924 = io_lsu_bus_clk_en_q & buf_error[3]; // @[lsu_bus_buffer.scala 598:126]
  wire  _T_4926 = _T_4924 & buf_write[3]; // @[lsu_bus_buffer.scala 598:141]
  wire  _T_4927 = _T_2799 & _T_4911; // @[Mux.scala 27:72]
  wire  _T_4928 = _T_2821 & _T_4916; // @[Mux.scala 27:72]
  wire  _T_4929 = _T_2843 & _T_4921; // @[Mux.scala 27:72]
  wire  _T_4930 = _T_2865 & _T_4926; // @[Mux.scala 27:72]
  wire  _T_4931 = _T_4927 | _T_4928; // @[Mux.scala 27:72]
  wire  _T_4932 = _T_4931 | _T_4929; // @[Mux.scala 27:72]
  wire  _T_4942 = _T_2821 & buf_error[1]; // @[lsu_bus_buffer.scala 599:93]
  wire  _T_4944 = _T_4942 & buf_write[1]; // @[lsu_bus_buffer.scala 599:108]
  wire  _T_4947 = _T_2843 & buf_error[2]; // @[lsu_bus_buffer.scala 599:93]
  wire  _T_4949 = _T_4947 & buf_write[2]; // @[lsu_bus_buffer.scala 599:108]
  wire  _T_4952 = _T_2865 & buf_error[3]; // @[lsu_bus_buffer.scala 599:93]
  wire  _T_4954 = _T_4952 & buf_write[3]; // @[lsu_bus_buffer.scala 599:108]
  wire [1:0] _T_4957 = _T_4949 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4958 = _T_4954 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_394 = {{1'd0}, _T_4944}; // @[Mux.scala 27:72]
  wire [1:0] _T_4960 = _GEN_394 | _T_4957; // @[Mux.scala 27:72]
  wire [1:0] lsu_imprecise_error_store_tag = _T_4960 | _T_4958; // @[Mux.scala 27:72]
  wire  _T_4962 = ~io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 601:97]
  wire [31:0] _GEN_351 = 2'h1 == lsu_imprecise_error_store_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 602:53]
  wire [31:0] _GEN_352 = 2'h2 == lsu_imprecise_error_store_tag ? buf_addr_2 : _GEN_351; // @[lsu_bus_buffer.scala 602:53]
  wire [31:0] _GEN_353 = 2'h3 == lsu_imprecise_error_store_tag ? buf_addr_3 : _GEN_352; // @[lsu_bus_buffer.scala 602:53]
  wire [31:0] _GEN_355 = 2'h1 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 602:53]
  wire [31:0] _GEN_356 = 2'h2 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_2 : _GEN_355; // @[lsu_bus_buffer.scala 602:53]
  wire [31:0] _GEN_357 = 2'h3 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_3 : _GEN_356; // @[lsu_bus_buffer.scala 602:53]
  wire  _T_4967 = bus_wcmd_sent | bus_wdata_sent; // @[lsu_bus_buffer.scala 608:82]
  wire  _T_4970 = io_lsu_busreq_r & io_ldst_dual_r; // @[lsu_bus_buffer.scala 609:60]
  wire  _T_4973 = ~io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 612:61]
  wire  _T_4974 = io_lsu_axi_aw_valid & _T_4973; // @[lsu_bus_buffer.scala 612:59]
  wire  _T_4975 = ~io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 612:107]
  wire  _T_4976 = io_lsu_axi_w_valid & _T_4975; // @[lsu_bus_buffer.scala 612:105]
  wire  _T_4977 = _T_4974 | _T_4976; // @[lsu_bus_buffer.scala 612:83]
  wire  _T_4978 = ~io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 612:153]
  wire  _T_4979 = io_lsu_axi_ar_valid & _T_4978; // @[lsu_bus_buffer.scala 612:151]
  wire  _T_4983 = ~io_flush_r; // @[lsu_bus_buffer.scala 616:75]
  wire  _T_4984 = io_lsu_busreq_m & _T_4983; // @[lsu_bus_buffer.scala 616:73]
  reg  _T_4987; // @[lsu_bus_buffer.scala 616:56]
  rvclkhdr rvclkhdr ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 352:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = _T_4967 | _T_4866; // @[lsu_bus_buffer.scala 608:35]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = _T_4970 & io_lsu_commit_r; // @[lsu_bus_buffer.scala 609:41]
  assign io_tlu_busbuff_lsu_pmu_bus_error = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 610:36]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = _T_4977 | _T_4979; // @[lsu_bus_buffer.scala 612:35]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = io_dctl_busbuff_lsu_nonblock_load_data_error & _T_4962; // @[lsu_bus_buffer.scala 601:47]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = _T_4932 | _T_4930; // @[lsu_bus_buffer.scala 598:48]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_store_any ? _GEN_353 : _GEN_357; // @[lsu_bus_buffer.scala 602:47]
  assign io_dctl_busbuff_lsu_nonblock_load_valid_m = _T_4517 & _T_4518; // @[lsu_bus_buffer.scala 529:45]
  assign io_dctl_busbuff_lsu_nonblock_load_tag_m = _T_1863 ? 2'h0 : _T_1899; // @[lsu_bus_buffer.scala 530:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4520; // @[lsu_bus_buffer.scala 532:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[lsu_bus_buffer.scala 533:47]
  assign io_dctl_busbuff_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4741; // @[lsu_bus_buffer.scala 545:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_error = _T_4570 | _T_4568; // @[lsu_bus_buffer.scala 535:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_tag = _T_4610 | _T_4608; // @[lsu_bus_buffer.scala 536:46]
  assign io_dctl_busbuff_lsu_nonblock_load_data = _T_4776[31:0]; // @[lsu_bus_buffer.scala 546:42]
  assign io_lsu_axi_aw_valid = _T_4876 & _T_1239; // @[lsu_bus_buffer.scala 568:23]
  assign io_lsu_axi_aw_bits_id = {{1'd0}, _T_1848}; // @[lsu_bus_buffer.scala 569:25]
  assign io_lsu_axi_aw_bits_addr = obuf_sideeffect ? obuf_addr : _T_4880; // @[lsu_bus_buffer.scala 570:27]
  assign io_lsu_axi_aw_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 574:29]
  assign io_lsu_axi_aw_bits_size = obuf_sideeffect ? _T_4882 : 3'h3; // @[lsu_bus_buffer.scala 571:27]
  assign io_lsu_axi_aw_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 573:28]
  assign io_lsu_axi_w_valid = _T_4888 & _T_1239; // @[lsu_bus_buffer.scala 580:22]
  assign io_lsu_axi_w_bits_data = obuf_data; // @[lsu_bus_buffer.scala 582:26]
  assign io_lsu_axi_w_bits_strb = obuf_byteen & _T_4892; // @[lsu_bus_buffer.scala 581:26]
  assign io_lsu_axi_b_ready = 1'h1; // @[lsu_bus_buffer.scala 596:22]
  assign io_lsu_axi_ar_valid = _T_4897 & _T_1239; // @[lsu_bus_buffer.scala 585:23]
  assign io_lsu_axi_ar_bits_id = {{1'd0}, _T_1848}; // @[lsu_bus_buffer.scala 586:25]
  assign io_lsu_axi_ar_bits_addr = obuf_sideeffect ? obuf_addr : _T_4880; // @[lsu_bus_buffer.scala 587:27]
  assign io_lsu_axi_ar_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 591:29]
  assign io_lsu_axi_ar_bits_size = obuf_sideeffect ? _T_4882 : 3'h3; // @[lsu_bus_buffer.scala 588:27]
  assign io_lsu_axi_ar_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 590:28]
  assign io_lsu_axi_r_ready = 1'h1; // @[lsu_bus_buffer.scala 597:22]
  assign io_lsu_busreq_r = _T_4987; // @[lsu_bus_buffer.scala 616:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[lsu_bus_buffer.scala 525:30]
  assign io_lsu_bus_buffer_full_any = _T_4498 ? _T_4499 : _T_4500; // @[lsu_bus_buffer.scala 526:30]
  assign io_lsu_bus_buffer_empty_any = _T_4511 & _T_1231; // @[lsu_bus_buffer.scala 527:31]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[lsu_bus_buffer.scala 137:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[lsu_bus_buffer.scala 138:25]
  assign io_ld_fwddata_buf_lo = _T_650 | _T_651; // @[lsu_bus_buffer.scala 164:24]
  assign io_ld_fwddata_buf_hi = _T_747 | _T_748; // @[lsu_bus_buffer.scala 170:24]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_io_en = _T_853 & _T_854; // @[lib.scala 355:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_1_io_en = _T_853 & _T_854; // @[lib.scala 355:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_2_io_en = _T_1240 & io_lsu_bus_clk_en; // @[lib.scala 355:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_3_io_en = _T_1240 & io_lsu_bus_clk_en; // @[lib.scala 355:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_4_io_en = _T_3528 & buf_state_en_0; // @[lib.scala 355:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_5_io_en = _T_3721 & buf_state_en_1; // @[lib.scala 355:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_6_io_en = _T_3914 & buf_state_en_2; // @[lib.scala 355:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_7_io_en = _T_4107 & buf_state_en_3; // @[lib.scala 355:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_8_io_en = _T_3528 ? buf_state_en_0 : _GEN_70; // @[lib.scala 355:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_9_io_en = _T_3721 ? buf_state_en_1 : _GEN_146; // @[lib.scala 355:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_10_io_en = _T_3914 ? buf_state_en_2 : _GEN_222; // @[lib.scala 355:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 354:18]
  assign rvclkhdr_11_io_en = _T_4107 ? buf_state_en_3 : _GEN_298; // @[lib.scala 355:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[lib.scala 356:24]
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
  buf_addr_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  _T_4360 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4357 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4354 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4351 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  buf_state_0 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  buf_addr_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buf_state_1 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  buf_addr_2 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buf_state_2 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  buf_addr_3 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buf_state_3 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  buf_byteen_3 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  buf_byteen_2 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  buf_byteen_1 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  buf_byteen_0 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  buf_ageQ_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  _T_1848 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  obuf_merge = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  obuf_tag1 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  obuf_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  obuf_wr_enQ = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ibuf_addr = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  ibuf_write = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ibuf_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ibuf_byteen = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  buf_ageQ_2 = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  buf_ageQ_1 = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  buf_ageQ_0 = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  buf_data_0 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  buf_data_1 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  buf_data_2 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  buf_data_3 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  ibuf_data = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  ibuf_timer = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  ibuf_sideeffect = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  WrPtr1_r = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  WrPtr0_r = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  ibuf_tag = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  ibuf_dualtag = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  ibuf_dual = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ibuf_samedw = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  ibuf_nomerge = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  ibuf_unsign = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  ibuf_sz = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  obuf_wr_timer = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  buf_nomerge_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  buf_nomerge_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  buf_nomerge_2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  buf_nomerge_3 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  _T_4330 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4327 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4324 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4321 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  buf_dual_3 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  buf_dual_2 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  buf_dual_1 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf_dual_0 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  obuf_write = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  obuf_data_done = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  obuf_nosend = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  obuf_addr = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  buf_sz_0 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  buf_sz_1 = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  buf_sz_2 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  buf_sz_3 = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  obuf_rdrsp_pend = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  obuf_rdrsp_tag = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  buf_dualhi_3 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  buf_dualhi_2 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  buf_dualhi_1 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  buf_dualhi_0 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  obuf_sz = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  obuf_byteen = _RAND_79[7:0];
  _RAND_80 = {2{`RANDOM}};
  obuf_data = _RAND_80[63:0];
  _RAND_81 = {1{`RANDOM}};
  buf_rspageQ_0 = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  buf_rspageQ_1 = _RAND_82[3:0];
  _RAND_83 = {1{`RANDOM}};
  buf_rspageQ_2 = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  buf_rspageQ_3 = _RAND_84[3:0];
  _RAND_85 = {1{`RANDOM}};
  _T_4307 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4305 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4303 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4301 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  buf_ldfwdtag_0 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  buf_dualtag_0 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  buf_ldfwdtag_3 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  buf_ldfwdtag_2 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  buf_ldfwdtag_1 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  buf_dualtag_1 = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  buf_dualtag_2 = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  buf_dualtag_3 = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  _T_4336 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4339 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4342 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4345 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4411 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4406 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4401 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4396 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4987 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4360 = 1'h0;
  end
  if (reset) begin
    _T_4357 = 1'h0;
  end
  if (reset) begin
    _T_4354 = 1'h0;
  end
  if (reset) begin
    _T_4351 = 1'h0;
  end
  if (reset) begin
    buf_state_0 = 3'h0;
  end
  if (reset) begin
    buf_addr_1 = 32'h0;
  end
  if (reset) begin
    buf_state_1 = 3'h0;
  end
  if (reset) begin
    buf_addr_2 = 32'h0;
  end
  if (reset) begin
    buf_state_2 = 3'h0;
  end
  if (reset) begin
    buf_addr_3 = 32'h0;
  end
  if (reset) begin
    buf_state_3 = 3'h0;
  end
  if (reset) begin
    buf_byteen_3 = 4'h0;
  end
  if (reset) begin
    buf_byteen_2 = 4'h0;
  end
  if (reset) begin
    buf_byteen_1 = 4'h0;
  end
  if (reset) begin
    buf_byteen_0 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_1848 = 2'h0;
  end
  if (reset) begin
    obuf_merge = 1'h0;
  end
  if (reset) begin
    obuf_tag1 = 2'h0;
  end
  if (reset) begin
    obuf_valid = 1'h0;
  end
  if (reset) begin
    obuf_wr_enQ = 1'h0;
  end
  if (reset) begin
    ibuf_addr = 32'h0;
  end
  if (reset) begin
    ibuf_write = 1'h0;
  end
  if (reset) begin
    ibuf_valid = 1'h0;
  end
  if (reset) begin
    ibuf_byteen = 4'h0;
  end
  if (reset) begin
    buf_ageQ_2 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_1 = 4'h0;
  end
  if (reset) begin
    buf_ageQ_0 = 4'h0;
  end
  if (reset) begin
    buf_data_0 = 32'h0;
  end
  if (reset) begin
    buf_data_1 = 32'h0;
  end
  if (reset) begin
    buf_data_2 = 32'h0;
  end
  if (reset) begin
    buf_data_3 = 32'h0;
  end
  if (reset) begin
    ibuf_data = 32'h0;
  end
  if (reset) begin
    ibuf_timer = 3'h0;
  end
  if (reset) begin
    ibuf_sideeffect = 1'h0;
  end
  if (reset) begin
    WrPtr1_r = 2'h0;
  end
  if (reset) begin
    WrPtr0_r = 2'h0;
  end
  if (reset) begin
    ibuf_tag = 2'h0;
  end
  if (reset) begin
    ibuf_dualtag = 2'h0;
  end
  if (reset) begin
    ibuf_dual = 1'h0;
  end
  if (reset) begin
    ibuf_samedw = 1'h0;
  end
  if (reset) begin
    ibuf_nomerge = 1'h0;
  end
  if (reset) begin
    ibuf_unsign = 1'h0;
  end
  if (reset) begin
    ibuf_sz = 2'h0;
  end
  if (reset) begin
    obuf_wr_timer = 3'h0;
  end
  if (reset) begin
    buf_nomerge_0 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_1 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_2 = 1'h0;
  end
  if (reset) begin
    buf_nomerge_3 = 1'h0;
  end
  if (reset) begin
    _T_4330 = 1'h0;
  end
  if (reset) begin
    _T_4327 = 1'h0;
  end
  if (reset) begin
    _T_4324 = 1'h0;
  end
  if (reset) begin
    _T_4321 = 1'h0;
  end
  if (reset) begin
    obuf_sideeffect = 1'h0;
  end
  if (reset) begin
    buf_dual_3 = 1'h0;
  end
  if (reset) begin
    buf_dual_2 = 1'h0;
  end
  if (reset) begin
    buf_dual_1 = 1'h0;
  end
  if (reset) begin
    buf_dual_0 = 1'h0;
  end
  if (reset) begin
    buf_samedw_3 = 1'h0;
  end
  if (reset) begin
    buf_samedw_2 = 1'h0;
  end
  if (reset) begin
    buf_samedw_1 = 1'h0;
  end
  if (reset) begin
    buf_samedw_0 = 1'h0;
  end
  if (reset) begin
    obuf_write = 1'h0;
  end
  if (reset) begin
    obuf_cmd_done = 1'h0;
  end
  if (reset) begin
    obuf_data_done = 1'h0;
  end
  if (reset) begin
    obuf_nosend = 1'h0;
  end
  if (reset) begin
    obuf_addr = 32'h0;
  end
  if (reset) begin
    buf_sz_0 = 2'h0;
  end
  if (reset) begin
    buf_sz_1 = 2'h0;
  end
  if (reset) begin
    buf_sz_2 = 2'h0;
  end
  if (reset) begin
    buf_sz_3 = 2'h0;
  end
  if (reset) begin
    obuf_rdrsp_pend = 1'h0;
  end
  if (reset) begin
    obuf_rdrsp_tag = 3'h0;
  end
  if (reset) begin
    buf_dualhi_3 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_2 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_1 = 1'h0;
  end
  if (reset) begin
    buf_dualhi_0 = 1'h0;
  end
  if (reset) begin
    obuf_sz = 2'h0;
  end
  if (reset) begin
    obuf_byteen = 8'h0;
  end
  if (reset) begin
    obuf_data = 64'h0;
  end
  if (reset) begin
    buf_rspageQ_0 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_1 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_2 = 4'h0;
  end
  if (reset) begin
    buf_rspageQ_3 = 4'h0;
  end
  if (reset) begin
    _T_4307 = 1'h0;
  end
  if (reset) begin
    _T_4305 = 1'h0;
  end
  if (reset) begin
    _T_4303 = 1'h0;
  end
  if (reset) begin
    _T_4301 = 1'h0;
  end
  if (reset) begin
    buf_ldfwdtag_0 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_0 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_3 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_2 = 2'h0;
  end
  if (reset) begin
    buf_ldfwdtag_1 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_1 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_2 = 2'h0;
  end
  if (reset) begin
    buf_dualtag_3 = 2'h0;
  end
  if (reset) begin
    _T_4336 = 1'h0;
  end
  if (reset) begin
    _T_4339 = 1'h0;
  end
  if (reset) begin
    _T_4342 = 1'h0;
  end
  if (reset) begin
    _T_4345 = 1'h0;
  end
  if (reset) begin
    _T_4411 = 1'h0;
  end
  if (reset) begin
    _T_4406 = 1'h0;
  end
  if (reset) begin
    _T_4401 = 1'h0;
  end
  if (reset) begin
    _T_4396 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4987 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_4_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_0 <= 32'h0;
    end else if (ibuf_drainvec_vld[0]) begin
      buf_addr_0 <= ibuf_addr;
    end else if (_T_3343) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4360 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4360 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4357 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4357 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4354 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4354 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4351 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4351 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3528) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3551) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3555) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3559) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3589) begin
        if (_T_3594) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3602) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3630) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3676) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3682) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3694) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else begin
        buf_state_0 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_1 <= 32'h0;
    end else if (ibuf_drainvec_vld[1]) begin
      buf_addr_1 <= ibuf_addr;
    end else if (_T_3352) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3721) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3744) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3748) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3559) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3782) begin
        if (_T_3787) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3795) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3823) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3869) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3875) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3887) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else begin
        buf_state_1 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_6_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_2 <= 32'h0;
    end else if (ibuf_drainvec_vld[2]) begin
      buf_addr_2 <= ibuf_addr;
    end else if (_T_3361) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3914) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3937) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3941) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3559) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3975) begin
        if (_T_3980) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3988) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4016) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4062) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4068) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4080) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else begin
        buf_state_2 <= 3'h0;
      end
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_addr_3 <= 32'h0;
    end else if (ibuf_drainvec_vld[3]) begin
      buf_addr_3 <= ibuf_addr;
    end else if (_T_3370) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4107) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4130) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4134) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3559) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4168) begin
        if (_T_4173) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4181) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4209) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4255) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4261) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4273) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else begin
        buf_state_3 <= 3'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_3 <= 4'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_byteen_3 <= ibuf_byteen_out;
      end else if (_T_3370) begin
        buf_byteen_3 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_3 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_2 <= 4'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_byteen_2 <= ibuf_byteen_out;
      end else if (_T_3361) begin
        buf_byteen_2 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_2 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_1 <= 4'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_byteen_1 <= ibuf_byteen_out;
      end else if (_T_3352) begin
        buf_byteen_1 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_1 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_byteen_0 <= 4'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_byteen_0 <= ibuf_byteen_out;
      end else if (_T_3343) begin
        buf_byteen_0 <= ldst_byteen_hi_r;
      end else begin
        buf_byteen_0 <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_3 <= 4'h0;
    end else begin
      buf_ageQ_3 <= {_T_2535,_T_2458};
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_1848 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1848 <= WrPtr0_r;
      end else begin
        _T_1848 <= CmdPtr0;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_merge <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_merge <= obuf_merge_en;
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_tag1 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_tag1 <= WrPtr1_r;
      end else begin
        obuf_tag1 <= CmdPtr1;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1839 & _T_1840;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1240 & io_lsu_bus_clk_en;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_addr <= 32'h0;
    end else if (io_ldst_dual_r) begin
      ibuf_addr <= io_end_addr_r;
    end else begin
      ibuf_addr <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_write <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_write <= io_lsu_pkt_r_bits_store;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_valid <= 1'h0;
    end else begin
      ibuf_valid <= _T_1005 & _T_1006;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_byteen <= 4'h0;
    end else if (ibuf_wr_en) begin
      if (_T_866) begin
        ibuf_byteen <= _T_881;
      end else if (io_ldst_dual_r) begin
        ibuf_byteen <= ldst_byteen_hi_r;
      end else begin
        ibuf_byteen <= ldst_byteen_lo_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_2 <= 4'h0;
    end else begin
      buf_ageQ_2 <= {_T_2433,_T_2356};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2331,_T_2254};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2229,_T_2152};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3528) begin
      if (_T_3543) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3551) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3555) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3589) begin
      if (_T_3669) begin
        if (buf_addr_0[2]) begin
          buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_0 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3721) begin
      if (_T_3736) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3744) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3748) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3782) begin
      if (_T_3862) begin
        if (buf_addr_1[2]) begin
          buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_1 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3914) begin
      if (_T_3929) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3937) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3941) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3975) begin
      if (_T_4055) begin
        if (buf_addr_2[2]) begin
          buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_2 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4107) begin
      if (_T_4122) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4130) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4134) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_4168) begin
      if (_T_4248) begin
        if (buf_addr_3[2]) begin
          buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
        end else begin
          buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
        end
      end else begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else begin
      buf_data_3 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      ibuf_data <= 32'h0;
    end else begin
      ibuf_data <= {_T_922,_T_893};
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ibuf_timer <= 3'h0;
    end else if (ibuf_wr_en) begin
      ibuf_timer <= 3'h0;
    end else if (_T_923) begin
      ibuf_timer <= _T_926;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sideeffect <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1914) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1928) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1942) begin
      WrPtr1_r <= 2'h2;
    end else begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1863) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1874) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1885) begin
      WrPtr0_r <= 2'h2;
    end else begin
      WrPtr0_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (ibuf_wr_en) begin
      if (!(_T_866)) begin
        if (io_ldst_dual_r) begin
          ibuf_tag <= WrPtr1_r;
        end else begin
          ibuf_tag <= WrPtr0_r;
        end
      end
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dualtag <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (ibuf_wr_en) begin
      ibuf_unsign <= io_lsu_pkt_r_bits_unsign;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_sz <= 2'h0;
    end else if (ibuf_wr_en) begin
      ibuf_sz <= ibuf_sz_in;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_timer <= 3'h0;
    end else if (obuf_wr_en) begin
      obuf_wr_timer <= 3'h0;
    end else if (_T_1058) begin
      obuf_wr_timer <= _T_1060;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_nomerge_0 <= buf_nomerge_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_nomerge_1 <= buf_nomerge_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_nomerge_2 <= buf_nomerge_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_nomerge_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_nomerge_3 <= buf_nomerge_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4330 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4330 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4327 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4327 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4324 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4324 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4321 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4321 <= buf_sideeffect_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sideeffect <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else begin
        obuf_sideeffect <= _T_1051;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dual_3 <= buf_dual_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dual_2 <= buf_dual_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dual_1 <= buf_dual_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dual_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dual_0 <= buf_dual_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_samedw_3 <= buf_samedw_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_samedw_2 <= buf_samedw_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_samedw_1 <= buf_samedw_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_samedw_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_samedw_0 <= buf_samedw_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_write <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_bits_store;
      end else begin
        obuf_write <= _T_1202;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1305 & _T_4863;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1305 & _T_4864;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_nosend <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_nosend <= obuf_nosend_in;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      obuf_addr <= 32'h0;
    end else if (ibuf_buf_byp) begin
      obuf_addr <= io_lsu_addr_r;
    end else begin
      obuf_addr <= _T_1289;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_sz_0 <= ibuf_sz;
      end else begin
        buf_sz_0 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_sz_1 <= ibuf_sz;
      end else begin
        buf_sz_1 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_sz_2 <= ibuf_sz;
      end else begin
        buf_sz_2 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_sz_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_sz_3 <= ibuf_sz;
      end else begin
        buf_sz_3 <= ibuf_sz_in;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1330 | _T_1334;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1332) begin
      obuf_rdrsp_tag <= obuf_tag0;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_3 <= 1'h0;
    end else if (buf_wr_en_3) begin
      buf_dualhi_3 <= buf_dualhi_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_2 <= 1'h0;
    end else if (buf_wr_en_2) begin
      buf_dualhi_2 <= buf_dualhi_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_1 <= 1'h0;
    end else if (buf_wr_en_1) begin
      buf_dualhi_1 <= buf_dualhi_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualhi_0 <= 1'h0;
    end else if (buf_wr_en_0) begin
      buf_dualhi_0 <= buf_dualhi_in[0];
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_sz <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else begin
        obuf_sz <= _T_1302;
      end
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      obuf_byteen <= 8'h0;
    end else if (obuf_wr_en) begin
      obuf_byteen <= obuf_byteen_in;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      obuf_data <= 64'h0;
    end else begin
      obuf_data <= {_T_1620,_T_1579};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3173,_T_3162};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3188,_T_3177};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3203,_T_3192};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3218,_T_3207};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4307 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4107) begin
        _T_4307 <= 1'h0;
      end else if (_T_4130) begin
        _T_4307 <= 1'h0;
      end else begin
        _T_4307 <= _T_4134;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4305 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3914) begin
        _T_4305 <= 1'h0;
      end else if (_T_3937) begin
        _T_4305 <= 1'h0;
      end else begin
        _T_4305 <= _T_3941;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4303 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3721) begin
        _T_4303 <= 1'h0;
      end else if (_T_3744) begin
        _T_4303 <= 1'h0;
      end else begin
        _T_4303 <= _T_3748;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4301 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3528) begin
        _T_4301 <= 1'h0;
      end else if (_T_3551) begin
        _T_4301 <= 1'h0;
      end else begin
        _T_4301 <= _T_3555;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3528) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3551) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3555) begin
        buf_ldfwdtag_0 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_0 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_0 <= 2'h0;
    end else if (buf_wr_en_0) begin
      if (ibuf_drainvec_vld[0]) begin
        buf_dualtag_0 <= ibuf_dualtag;
      end else if (_T_3343) begin
        buf_dualtag_0 <= WrPtr0_r;
      end else begin
        buf_dualtag_0 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_3 <= 2'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4107) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4130) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4134) begin
        buf_ldfwdtag_3 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_3 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_2 <= 2'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3914) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3937) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3941) begin
        buf_ldfwdtag_2 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_2 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_1 <= 2'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3721) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3744) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3748) begin
        buf_ldfwdtag_1 <= obuf_rdrsp_tag[1:0];
      end else begin
        buf_ldfwdtag_1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_1 <= 2'h0;
    end else if (buf_wr_en_1) begin
      if (ibuf_drainvec_vld[1]) begin
        buf_dualtag_1 <= ibuf_dualtag;
      end else if (_T_3352) begin
        buf_dualtag_1 <= WrPtr0_r;
      end else begin
        buf_dualtag_1 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_2 <= 2'h0;
    end else if (buf_wr_en_2) begin
      if (ibuf_drainvec_vld[2]) begin
        buf_dualtag_2 <= ibuf_dualtag;
      end else if (_T_3361) begin
        buf_dualtag_2 <= WrPtr0_r;
      end else begin
        buf_dualtag_2 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_dualtag_3 <= 2'h0;
    end else if (buf_wr_en_3) begin
      if (ibuf_drainvec_vld[3]) begin
        buf_dualtag_3 <= ibuf_dualtag;
      end else if (_T_3370) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4336 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4336 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4339 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4339 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4342 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4342 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4345 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4345 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4411 <= 1'h0;
    end else begin
      _T_4411 <= _T_4408 & _T_4409;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4406 <= 1'h0;
    end else begin
      _T_4406 <= _T_4403 & _T_4404;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4401 <= 1'h0;
    end else begin
      _T_4401 <= _T_4398 & _T_4399;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4396 <= 1'h0;
    end else begin
      _T_4396 <= _T_4393 & _T_4394;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_nonblock_load_valid_r <= 1'h0;
    end else begin
      lsu_nonblock_load_valid_r <= io_dctl_busbuff_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_4987 <= 1'h0;
    end else begin
      _T_4987 <= _T_4984 & _T_4518;
    end
  end
endmodule
module lsu_bus_intf(
  input         clock,
  input         reset,
  input         io_scan_mode,
  output        io_tlu_busbuff_lsu_pmu_bus_trxn,
  output        io_tlu_busbuff_lsu_pmu_bus_misaligned,
  output        io_tlu_busbuff_lsu_pmu_bus_error,
  output        io_tlu_busbuff_lsu_pmu_bus_busy,
  input         io_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  input         io_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  input         io_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  output        io_tlu_busbuff_lsu_imprecise_error_load_any,
  output        io_tlu_busbuff_lsu_imprecise_error_store_any,
  output [31:0] io_tlu_busbuff_lsu_imprecise_error_addr_any,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_free_clk,
  input         io_lsu_busm_clk,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output [2:0]  io_axi_aw_bits_id,
  output [31:0] io_axi_aw_bits_addr,
  output [3:0]  io_axi_aw_bits_region,
  output [2:0]  io_axi_aw_bits_size,
  output [3:0]  io_axi_aw_bits_cache,
  input         io_axi_w_ready,
  output        io_axi_w_valid,
  output [63:0] io_axi_w_bits_data,
  output [7:0]  io_axi_w_bits_strb,
  input         io_axi_b_valid,
  input  [1:0]  io_axi_b_bits_resp,
  input  [2:0]  io_axi_b_bits_id,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [2:0]  io_axi_ar_bits_id,
  output [31:0] io_axi_ar_bits_addr,
  output [3:0]  io_axi_ar_bits_region,
  output [2:0]  io_axi_ar_bits_size,
  output [3:0]  io_axi_ar_bits_cache,
  input         io_axi_r_valid,
  input  [2:0]  io_axi_r_bits_id,
  input  [63:0] io_axi_r_bits_data,
  input  [1:0]  io_axi_r_bits_resp,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_busreq_m,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_m_bits_by,
  input         io_lsu_pkt_m_bits_half,
  input         io_lsu_pkt_m_bits_word,
  input         io_lsu_pkt_m_bits_load,
  input         io_lsu_pkt_r_valid,
  input         io_lsu_pkt_r_bits_by,
  input         io_lsu_pkt_r_bits_half,
  input         io_lsu_pkt_r_bits_word,
  input         io_lsu_pkt_r_bits_load,
  input         io_lsu_pkt_r_bits_store,
  input         io_lsu_pkt_r_bits_unsign,
  input  [31:0] io_lsu_addr_d,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_d,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_end_addr_r,
  input  [31:0] io_store_data_r,
  input         io_dec_tlu_force_halt,
  input         io_lsu_commit_r,
  input         io_is_sideeffects_m,
  input         io_flush_m_up,
  input         io_flush_r,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [31:0] io_bus_read_data_m,
  output        io_dctl_busbuff_lsu_nonblock_load_valid_m,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_tag_m,
  output        io_dctl_busbuff_lsu_nonblock_load_inv_r,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  output        io_dctl_busbuff_lsu_nonblock_load_data_valid,
  output        io_dctl_busbuff_lsu_nonblock_load_data_error,
  output [1:0]  io_dctl_busbuff_lsu_nonblock_load_data_tag,
  output [31:0] io_dctl_busbuff_lsu_nonblock_load_data,
  input         io_lsu_bus_clk_en
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  bus_buffer_clock; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_reset; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_scan_mode; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu_bus_intf.scala 102:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu_bus_intf.scala 102:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_intf.scala 102:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dec_tlu_force_halt; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_c2_r_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_ibuf_c1_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_obuf_c1_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_buf_c1_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_free_c2_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_busm_clk; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_dec_lsu_valid_raw_d; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_m_valid; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_m_bits_load; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_by; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_half; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_word; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_load; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_unsign; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_lsu_addr_m; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_end_addr_m; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_lsu_addr_r; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_end_addr_r; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_store_data_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_no_word_merge_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_no_dword_merge_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_busreq_m; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_ld_full_hit_m; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_flush_m_up; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_flush_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_commit_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_is_sideeffects_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_ldst_dual_d; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_ldst_dual_m; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_ldst_dual_r; // @[lsu_bus_intf.scala 102:39]
  wire [7:0] bus_buffer_io_ldst_byteen_ext_m; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_aw_ready; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_aw_valid; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_aw_bits_id; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_lsu_axi_aw_bits_addr; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_lsu_axi_aw_bits_region; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_aw_bits_size; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_lsu_axi_aw_bits_cache; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_w_ready; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_w_valid; // @[lsu_bus_intf.scala 102:39]
  wire [63:0] bus_buffer_io_lsu_axi_w_bits_data; // @[lsu_bus_intf.scala 102:39]
  wire [7:0] bus_buffer_io_lsu_axi_w_bits_strb; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_b_ready; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_b_valid; // @[lsu_bus_intf.scala 102:39]
  wire [1:0] bus_buffer_io_lsu_axi_b_bits_resp; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_b_bits_id; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_ar_ready; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_ar_valid; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_ar_bits_id; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_lsu_axi_ar_bits_addr; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_lsu_axi_ar_bits_region; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_ar_bits_size; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_lsu_axi_ar_bits_cache; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_r_ready; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_axi_r_valid; // @[lsu_bus_intf.scala 102:39]
  wire [2:0] bus_buffer_io_lsu_axi_r_bits_id; // @[lsu_bus_intf.scala 102:39]
  wire [63:0] bus_buffer_io_lsu_axi_r_bits_data; // @[lsu_bus_intf.scala 102:39]
  wire [1:0] bus_buffer_io_lsu_axi_r_bits_resp; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_clk_en; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_clk_en_q; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_busreq_r; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_buffer_pend_any; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_buffer_full_any; // @[lsu_bus_intf.scala 102:39]
  wire  bus_buffer_io_lsu_bus_buffer_empty_any; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_lo; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_hi; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_lo; // @[lsu_bus_intf.scala 102:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_hi; // @[lsu_bus_intf.scala 102:39]
  wire [3:0] _T_3 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_4 = io_lsu_pkt_m_bits_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_5 = io_lsu_pkt_m_bits_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = _T_3 | _T_4; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_m = _T_6 | _T_5; // @[Mux.scala 27:72]
  wire  addr_match_dw_lo_r_m = io_lsu_addr_r[31:3] == io_lsu_addr_m[31:3]; // @[lsu_bus_intf.scala 156:51]
  wire  _T_17 = io_lsu_addr_r[2] ^ io_lsu_addr_m[2]; // @[lsu_bus_intf.scala 157:71]
  wire  _T_18 = ~_T_17; // @[lsu_bus_intf.scala 157:53]
  wire  addr_match_word_lo_r_m = addr_match_dw_lo_r_m & _T_18; // @[lsu_bus_intf.scala 157:51]
  reg  ldst_dual_r; // @[lsu_bus_intf.scala 202:33]
  wire  _T_20 = ~ldst_dual_r; // @[lsu_bus_intf.scala 158:48]
  wire  _T_21 = io_lsu_busreq_r & _T_20; // @[lsu_bus_intf.scala 158:46]
  wire  _T_22 = _T_21 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 158:61]
  wire  _T_23 = ~addr_match_word_lo_r_m; // @[lsu_bus_intf.scala 158:107]
  wire  _T_24 = io_lsu_pkt_m_bits_load | _T_23; // @[lsu_bus_intf.scala 158:105]
  wire  _T_29 = ~addr_match_dw_lo_r_m; // @[lsu_bus_intf.scala 159:107]
  wire  _T_30 = io_lsu_pkt_m_bits_load | _T_29; // @[lsu_bus_intf.scala 159:105]
  wire [6:0] _GEN_0 = {{3'd0}, ldst_byteen_m}; // @[lsu_bus_intf.scala 161:49]
  wire [6:0] _T_34 = _GEN_0 << io_lsu_addr_m[1:0]; // @[lsu_bus_intf.scala 161:49]
  reg [3:0] ldst_byteen_r; // @[lsu_bus_intf.scala 204:33]
  wire [6:0] _GEN_1 = {{3'd0}, ldst_byteen_r}; // @[lsu_bus_intf.scala 162:49]
  wire [6:0] _T_37 = _GEN_1 << io_lsu_addr_r[1:0]; // @[lsu_bus_intf.scala 162:49]
  wire [4:0] _T_40 = {io_lsu_addr_r[1:0],3'h0}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_2 = {{31'd0}, io_store_data_r}; // @[lsu_bus_intf.scala 163:52]
  wire [62:0] _T_41 = _GEN_2 << _T_40; // @[lsu_bus_intf.scala 163:52]
  wire [7:0] ldst_byteen_ext_m = {{1'd0}, _T_34}; // @[lsu_bus_intf.scala 161:27]
  wire [3:0] ldst_byteen_hi_m = ldst_byteen_ext_m[7:4]; // @[lsu_bus_intf.scala 164:47]
  wire [3:0] ldst_byteen_lo_m = ldst_byteen_ext_m[3:0]; // @[lsu_bus_intf.scala 165:47]
  wire [7:0] ldst_byteen_ext_r = {{1'd0}, _T_37}; // @[lsu_bus_intf.scala 162:27]
  wire [3:0] ldst_byteen_hi_r = ldst_byteen_ext_r[7:4]; // @[lsu_bus_intf.scala 166:47]
  wire [3:0] ldst_byteen_lo_r = ldst_byteen_ext_r[3:0]; // @[lsu_bus_intf.scala 167:47]
  wire [63:0] store_data_ext_r = {{1'd0}, _T_41}; // @[lsu_bus_intf.scala 163:27]
  wire [31:0] store_data_hi_r = store_data_ext_r[63:32]; // @[lsu_bus_intf.scala 169:46]
  wire [31:0] store_data_lo_r = store_data_ext_r[31:0]; // @[lsu_bus_intf.scala 170:46]
  wire  _T_50 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_bus_intf.scala 171:51]
  wire  _T_51 = _T_50 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 171:76]
  wire  _T_52 = _T_51 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 171:97]
  wire  ld_addr_rhit_lo_lo = _T_52 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 171:123]
  wire  _T_56 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_bus_intf.scala 172:51]
  wire  _T_57 = _T_56 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 172:76]
  wire  _T_58 = _T_57 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 172:97]
  wire  ld_addr_rhit_lo_hi = _T_58 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 172:123]
  wire  _T_62 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_bus_intf.scala 173:51]
  wire  _T_63 = _T_62 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 173:76]
  wire  _T_64 = _T_63 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 173:97]
  wire  ld_addr_rhit_hi_lo = _T_64 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 173:123]
  wire  _T_68 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_bus_intf.scala 174:51]
  wire  _T_69 = _T_68 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 174:76]
  wire  _T_70 = _T_69 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 174:97]
  wire  ld_addr_rhit_hi_hi = _T_70 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 174:123]
  wire  _T_73 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[0]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_75 = _T_73 & ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_77 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[1]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_79 = _T_77 & ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_81 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[2]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_83 = _T_81 & ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_85 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[3]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_87 = _T_85 & ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 176:92]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_87,_T_83,_T_79,_T_75}; // @[Cat.scala 29:58]
  wire  _T_92 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[0]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_94 = _T_92 & ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_96 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[1]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_98 = _T_96 & ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_100 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[2]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_102 = _T_100 & ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_104 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[3]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_106 = _T_104 & ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 177:92]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_106,_T_102,_T_98,_T_94}; // @[Cat.scala 29:58]
  wire  _T_111 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[0]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_113 = _T_111 & ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_115 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[1]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_117 = _T_115 & ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_119 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[2]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_121 = _T_119 & ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_123 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[3]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 178:92]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_125,_T_121,_T_117,_T_113}; // @[Cat.scala 29:58]
  wire  _T_130 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[0]; // @[lsu_bus_intf.scala 179:70]
  wire  _T_132 = _T_130 & ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 179:92]
  wire  _T_134 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[1]; // @[lsu_bus_intf.scala 179:70]
  wire  _T_136 = _T_134 & ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 179:92]
  wire  _T_138 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[2]; // @[lsu_bus_intf.scala 179:70]
  wire  _T_140 = _T_138 & ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 179:92]
  wire  _T_142 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[3]; // @[lsu_bus_intf.scala 179:70]
  wire  _T_144 = _T_142 & ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 179:92]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_144,_T_140,_T_136,_T_132}; // @[Cat.scala 29:58]
  wire  _T_150 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[lsu_bus_intf.scala 181:73]
  wire [3:0] ld_byte_hit_buf_lo = bus_buffer_io_ld_byte_hit_buf_lo; // @[lsu_bus_intf.scala 139:38]
  wire  _T_152 = _T_150 | ld_byte_hit_buf_lo[0]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_155 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_157 = _T_155 | ld_byte_hit_buf_lo[1]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_160 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_162 = _T_160 | ld_byte_hit_buf_lo[2]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_165 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_167 = _T_165 | ld_byte_hit_buf_lo[3]; // @[lsu_bus_intf.scala 181:97]
  wire [3:0] ld_byte_hit_lo = {_T_167,_T_162,_T_157,_T_152}; // @[Cat.scala 29:58]
  wire  _T_173 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[lsu_bus_intf.scala 182:73]
  wire [3:0] ld_byte_hit_buf_hi = bus_buffer_io_ld_byte_hit_buf_hi; // @[lsu_bus_intf.scala 140:38]
  wire  _T_175 = _T_173 | ld_byte_hit_buf_hi[0]; // @[lsu_bus_intf.scala 182:97]
  wire  _T_178 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[lsu_bus_intf.scala 182:73]
  wire  _T_180 = _T_178 | ld_byte_hit_buf_hi[1]; // @[lsu_bus_intf.scala 182:97]
  wire  _T_183 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[lsu_bus_intf.scala 182:73]
  wire  _T_185 = _T_183 | ld_byte_hit_buf_hi[2]; // @[lsu_bus_intf.scala 182:97]
  wire  _T_188 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[lsu_bus_intf.scala 182:73]
  wire  _T_190 = _T_188 | ld_byte_hit_buf_hi[3]; // @[lsu_bus_intf.scala 182:97]
  wire [3:0] ld_byte_hit_hi = {_T_190,_T_185,_T_180,_T_175}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = {_T_165,_T_160,_T_155,_T_150}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = {_T_188,_T_183,_T_178,_T_173}; // @[Cat.scala 29:58]
  wire [7:0] _T_228 = ld_byte_rhit_lo_lo[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_229 = ld_byte_rhit_hi_lo[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_230 = _T_228 | _T_229; // @[Mux.scala 27:72]
  wire [7:0] _T_236 = ld_byte_rhit_lo_lo[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_237 = ld_byte_rhit_hi_lo[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_238 = _T_236 | _T_237; // @[Mux.scala 27:72]
  wire [7:0] _T_244 = ld_byte_rhit_lo_lo[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_245 = ld_byte_rhit_hi_lo[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_246 = _T_244 | _T_245; // @[Mux.scala 27:72]
  wire [7:0] _T_252 = ld_byte_rhit_lo_lo[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_253 = ld_byte_rhit_hi_lo[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_254 = _T_252 | _T_253; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_lo = {_T_254,_T_246,_T_238,_T_230}; // @[Cat.scala 29:58]
  wire [7:0] _T_263 = ld_byte_rhit_lo_hi[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_264 = ld_byte_rhit_hi_hi[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_265 = _T_263 | _T_264; // @[Mux.scala 27:72]
  wire [7:0] _T_271 = ld_byte_rhit_lo_hi[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_272 = ld_byte_rhit_hi_hi[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_273 = _T_271 | _T_272; // @[Mux.scala 27:72]
  wire [7:0] _T_279 = ld_byte_rhit_lo_hi[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_280 = ld_byte_rhit_hi_hi[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_281 = _T_279 | _T_280; // @[Mux.scala 27:72]
  wire [7:0] _T_287 = ld_byte_rhit_lo_hi[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_288 = ld_byte_rhit_hi_hi[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_289 = _T_287 | _T_288; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_hi = {_T_289,_T_281,_T_273,_T_265}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_lo = bus_buffer_io_ld_fwddata_buf_lo; // @[lsu_bus_intf.scala 141:38]
  wire [7:0] _T_297 = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : ld_fwddata_buf_lo[7:0]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_301 = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : ld_fwddata_buf_lo[15:8]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_305 = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : ld_fwddata_buf_lo[23:16]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_309 = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : ld_fwddata_buf_lo[31:24]; // @[lsu_bus_intf.scala 187:54]
  wire [31:0] _T_312 = {_T_309,_T_305,_T_301,_T_297}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_hi = bus_buffer_io_ld_fwddata_buf_hi; // @[lsu_bus_intf.scala 142:38]
  wire [7:0] _T_316 = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : ld_fwddata_buf_hi[7:0]; // @[lsu_bus_intf.scala 188:54]
  wire [7:0] _T_320 = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : ld_fwddata_buf_hi[15:8]; // @[lsu_bus_intf.scala 188:54]
  wire [7:0] _T_324 = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : ld_fwddata_buf_hi[23:16]; // @[lsu_bus_intf.scala 188:54]
  wire [7:0] _T_328 = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : ld_fwddata_buf_hi[31:24]; // @[lsu_bus_intf.scala 188:54]
  wire [31:0] _T_331 = {_T_328,_T_324,_T_320,_T_316}; // @[Cat.scala 29:58]
  wire  _T_334 = ~ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_335 = ld_byte_hit_lo[0] | _T_334; // @[lsu_bus_intf.scala 189:70]
  wire  _T_338 = ~ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_339 = ld_byte_hit_lo[1] | _T_338; // @[lsu_bus_intf.scala 189:70]
  wire  _T_342 = ~ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_343 = ld_byte_hit_lo[2] | _T_342; // @[lsu_bus_intf.scala 189:70]
  wire  _T_346 = ~ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_347 = ld_byte_hit_lo[3] | _T_346; // @[lsu_bus_intf.scala 189:70]
  wire  _T_348 = _T_335 & _T_339; // @[lsu_bus_intf.scala 189:111]
  wire  _T_349 = _T_348 & _T_343; // @[lsu_bus_intf.scala 189:111]
  wire  ld_full_hit_lo_m = _T_349 & _T_347; // @[lsu_bus_intf.scala 189:111]
  wire  _T_353 = ~ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 190:72]
  wire  _T_354 = ld_byte_hit_hi[0] | _T_353; // @[lsu_bus_intf.scala 190:70]
  wire  _T_357 = ~ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 190:72]
  wire  _T_358 = ld_byte_hit_hi[1] | _T_357; // @[lsu_bus_intf.scala 190:70]
  wire  _T_361 = ~ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 190:72]
  wire  _T_362 = ld_byte_hit_hi[2] | _T_361; // @[lsu_bus_intf.scala 190:70]
  wire  _T_365 = ~ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 190:72]
  wire  _T_366 = ld_byte_hit_hi[3] | _T_365; // @[lsu_bus_intf.scala 190:70]
  wire  _T_367 = _T_354 & _T_358; // @[lsu_bus_intf.scala 190:111]
  wire  _T_368 = _T_367 & _T_362; // @[lsu_bus_intf.scala 190:111]
  wire  ld_full_hit_hi_m = _T_368 & _T_366; // @[lsu_bus_intf.scala 190:111]
  wire  _T_370 = ld_full_hit_lo_m & ld_full_hit_hi_m; // @[lsu_bus_intf.scala 191:47]
  wire  _T_371 = _T_370 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 191:66]
  wire  _T_372 = _T_371 & io_lsu_pkt_m_bits_load; // @[lsu_bus_intf.scala 191:84]
  wire  _T_373 = ~io_is_sideeffects_m; // @[lsu_bus_intf.scala 191:111]
  wire [63:0] ld_fwddata_hi = {{32'd0}, _T_331}; // @[lsu_bus_intf.scala 188:27]
  wire [63:0] ld_fwddata_lo = {{32'd0}, _T_312}; // @[lsu_bus_intf.scala 187:27]
  wire [63:0] _T_377 = {ld_fwddata_hi[31:0],ld_fwddata_lo[31:0]}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_3 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_bus_intf.scala 192:83]
  wire [5:0] _T_379 = 4'h8 * _GEN_3; // @[lsu_bus_intf.scala 192:83]
  wire [63:0] ld_fwddata_m = _T_377 >> _T_379; // @[lsu_bus_intf.scala 192:76]
  reg  lsu_bus_clk_en_q; // @[lsu_bus_intf.scala 196:32]
  reg  ldst_dual_m; // @[lsu_bus_intf.scala 199:27]
  reg  is_sideeffects_r; // @[lsu_bus_intf.scala 203:33]
  lsu_bus_buffer bus_buffer ( // @[lsu_bus_intf.scala 102:39]
    .clock(bus_buffer_clock),
    .reset(bus_buffer_reset),
    .io_scan_mode(bus_buffer_io_scan_mode),
    .io_tlu_busbuff_lsu_pmu_bus_trxn(bus_buffer_io_tlu_busbuff_lsu_pmu_bus_trxn),
    .io_tlu_busbuff_lsu_pmu_bus_misaligned(bus_buffer_io_tlu_busbuff_lsu_pmu_bus_misaligned),
    .io_tlu_busbuff_lsu_pmu_bus_error(bus_buffer_io_tlu_busbuff_lsu_pmu_bus_error),
    .io_tlu_busbuff_lsu_pmu_bus_busy(bus_buffer_io_tlu_busbuff_lsu_pmu_bus_busy),
    .io_tlu_busbuff_dec_tlu_external_ldfwd_disable(bus_buffer_io_tlu_busbuff_dec_tlu_external_ldfwd_disable),
    .io_tlu_busbuff_dec_tlu_wb_coalescing_disable(bus_buffer_io_tlu_busbuff_dec_tlu_wb_coalescing_disable),
    .io_tlu_busbuff_dec_tlu_sideeffect_posted_disable(bus_buffer_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable),
    .io_tlu_busbuff_lsu_imprecise_error_load_any(bus_buffer_io_tlu_busbuff_lsu_imprecise_error_load_any),
    .io_tlu_busbuff_lsu_imprecise_error_store_any(bus_buffer_io_tlu_busbuff_lsu_imprecise_error_store_any),
    .io_tlu_busbuff_lsu_imprecise_error_addr_any(bus_buffer_io_tlu_busbuff_lsu_imprecise_error_addr_any),
    .io_dctl_busbuff_lsu_nonblock_load_valid_m(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_valid_m),
    .io_dctl_busbuff_lsu_nonblock_load_tag_m(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_tag_m),
    .io_dctl_busbuff_lsu_nonblock_load_inv_r(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_r),
    .io_dctl_busbuff_lsu_nonblock_load_inv_tag_r(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r),
    .io_dctl_busbuff_lsu_nonblock_load_data_valid(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_valid),
    .io_dctl_busbuff_lsu_nonblock_load_data_error(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_error),
    .io_dctl_busbuff_lsu_nonblock_load_data_tag(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_tag),
    .io_dctl_busbuff_lsu_nonblock_load_data(bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data),
    .io_dec_tlu_force_halt(bus_buffer_io_dec_tlu_force_halt),
    .io_lsu_c2_r_clk(bus_buffer_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_buffer_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_obuf_c1_clk(bus_buffer_io_lsu_bus_obuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_buffer_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_buffer_io_lsu_free_c2_clk),
    .io_lsu_busm_clk(bus_buffer_io_lsu_busm_clk),
    .io_dec_lsu_valid_raw_d(bus_buffer_io_dec_lsu_valid_raw_d),
    .io_lsu_pkt_m_valid(bus_buffer_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_load(bus_buffer_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_r_bits_by(bus_buffer_io_lsu_pkt_r_bits_by),
    .io_lsu_pkt_r_bits_half(bus_buffer_io_lsu_pkt_r_bits_half),
    .io_lsu_pkt_r_bits_word(bus_buffer_io_lsu_pkt_r_bits_word),
    .io_lsu_pkt_r_bits_load(bus_buffer_io_lsu_pkt_r_bits_load),
    .io_lsu_pkt_r_bits_store(bus_buffer_io_lsu_pkt_r_bits_store),
    .io_lsu_pkt_r_bits_unsign(bus_buffer_io_lsu_pkt_r_bits_unsign),
    .io_lsu_addr_m(bus_buffer_io_lsu_addr_m),
    .io_end_addr_m(bus_buffer_io_end_addr_m),
    .io_lsu_addr_r(bus_buffer_io_lsu_addr_r),
    .io_end_addr_r(bus_buffer_io_end_addr_r),
    .io_store_data_r(bus_buffer_io_store_data_r),
    .io_no_word_merge_r(bus_buffer_io_no_word_merge_r),
    .io_no_dword_merge_r(bus_buffer_io_no_dword_merge_r),
    .io_lsu_busreq_m(bus_buffer_io_lsu_busreq_m),
    .io_ld_full_hit_m(bus_buffer_io_ld_full_hit_m),
    .io_flush_m_up(bus_buffer_io_flush_m_up),
    .io_flush_r(bus_buffer_io_flush_r),
    .io_lsu_commit_r(bus_buffer_io_lsu_commit_r),
    .io_is_sideeffects_r(bus_buffer_io_is_sideeffects_r),
    .io_ldst_dual_d(bus_buffer_io_ldst_dual_d),
    .io_ldst_dual_m(bus_buffer_io_ldst_dual_m),
    .io_ldst_dual_r(bus_buffer_io_ldst_dual_r),
    .io_ldst_byteen_ext_m(bus_buffer_io_ldst_byteen_ext_m),
    .io_lsu_axi_aw_ready(bus_buffer_io_lsu_axi_aw_ready),
    .io_lsu_axi_aw_valid(bus_buffer_io_lsu_axi_aw_valid),
    .io_lsu_axi_aw_bits_id(bus_buffer_io_lsu_axi_aw_bits_id),
    .io_lsu_axi_aw_bits_addr(bus_buffer_io_lsu_axi_aw_bits_addr),
    .io_lsu_axi_aw_bits_region(bus_buffer_io_lsu_axi_aw_bits_region),
    .io_lsu_axi_aw_bits_size(bus_buffer_io_lsu_axi_aw_bits_size),
    .io_lsu_axi_aw_bits_cache(bus_buffer_io_lsu_axi_aw_bits_cache),
    .io_lsu_axi_w_ready(bus_buffer_io_lsu_axi_w_ready),
    .io_lsu_axi_w_valid(bus_buffer_io_lsu_axi_w_valid),
    .io_lsu_axi_w_bits_data(bus_buffer_io_lsu_axi_w_bits_data),
    .io_lsu_axi_w_bits_strb(bus_buffer_io_lsu_axi_w_bits_strb),
    .io_lsu_axi_b_ready(bus_buffer_io_lsu_axi_b_ready),
    .io_lsu_axi_b_valid(bus_buffer_io_lsu_axi_b_valid),
    .io_lsu_axi_b_bits_resp(bus_buffer_io_lsu_axi_b_bits_resp),
    .io_lsu_axi_b_bits_id(bus_buffer_io_lsu_axi_b_bits_id),
    .io_lsu_axi_ar_ready(bus_buffer_io_lsu_axi_ar_ready),
    .io_lsu_axi_ar_valid(bus_buffer_io_lsu_axi_ar_valid),
    .io_lsu_axi_ar_bits_id(bus_buffer_io_lsu_axi_ar_bits_id),
    .io_lsu_axi_ar_bits_addr(bus_buffer_io_lsu_axi_ar_bits_addr),
    .io_lsu_axi_ar_bits_region(bus_buffer_io_lsu_axi_ar_bits_region),
    .io_lsu_axi_ar_bits_size(bus_buffer_io_lsu_axi_ar_bits_size),
    .io_lsu_axi_ar_bits_cache(bus_buffer_io_lsu_axi_ar_bits_cache),
    .io_lsu_axi_r_ready(bus_buffer_io_lsu_axi_r_ready),
    .io_lsu_axi_r_valid(bus_buffer_io_lsu_axi_r_valid),
    .io_lsu_axi_r_bits_id(bus_buffer_io_lsu_axi_r_bits_id),
    .io_lsu_axi_r_bits_data(bus_buffer_io_lsu_axi_r_bits_data),
    .io_lsu_axi_r_bits_resp(bus_buffer_io_lsu_axi_r_bits_resp),
    .io_lsu_bus_clk_en(bus_buffer_io_lsu_bus_clk_en),
    .io_lsu_bus_clk_en_q(bus_buffer_io_lsu_bus_clk_en_q),
    .io_lsu_busreq_r(bus_buffer_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(bus_buffer_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_full_any(bus_buffer_io_lsu_bus_buffer_full_any),
    .io_lsu_bus_buffer_empty_any(bus_buffer_io_lsu_bus_buffer_empty_any),
    .io_ld_byte_hit_buf_lo(bus_buffer_io_ld_byte_hit_buf_lo),
    .io_ld_byte_hit_buf_hi(bus_buffer_io_ld_byte_hit_buf_hi),
    .io_ld_fwddata_buf_lo(bus_buffer_io_ld_fwddata_buf_lo),
    .io_ld_fwddata_buf_hi(bus_buffer_io_ld_fwddata_buf_hi)
  );
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_pmu_bus_error = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_intf.scala 105:18]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu_bus_intf.scala 105:18]
  assign io_axi_aw_valid = bus_buffer_io_lsu_axi_aw_valid; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_aw_bits_id = bus_buffer_io_lsu_axi_aw_bits_id; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_aw_bits_addr = bus_buffer_io_lsu_axi_aw_bits_addr; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_aw_bits_region = bus_buffer_io_lsu_axi_aw_bits_region; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_aw_bits_size = bus_buffer_io_lsu_axi_aw_bits_size; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_aw_bits_cache = bus_buffer_io_lsu_axi_aw_bits_cache; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_w_valid = bus_buffer_io_lsu_axi_w_valid; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_w_bits_data = bus_buffer_io_lsu_axi_w_bits_data; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_w_bits_strb = bus_buffer_io_lsu_axi_w_bits_strb; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_valid = bus_buffer_io_lsu_axi_ar_valid; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_bits_id = bus_buffer_io_lsu_axi_ar_bits_id; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_bits_addr = bus_buffer_io_lsu_axi_ar_bits_addr; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_bits_region = bus_buffer_io_lsu_axi_ar_bits_region; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_bits_size = bus_buffer_io_lsu_axi_ar_bits_size; // @[lsu_bus_intf.scala 131:43]
  assign io_axi_ar_bits_cache = bus_buffer_io_lsu_axi_ar_bits_cache; // @[lsu_bus_intf.scala 131:43]
  assign io_lsu_busreq_r = bus_buffer_io_lsu_busreq_r; // @[lsu_bus_intf.scala 134:38]
  assign io_lsu_bus_buffer_pend_any = bus_buffer_io_lsu_bus_buffer_pend_any; // @[lsu_bus_intf.scala 135:38]
  assign io_lsu_bus_buffer_full_any = bus_buffer_io_lsu_bus_buffer_full_any; // @[lsu_bus_intf.scala 136:38]
  assign io_lsu_bus_buffer_empty_any = bus_buffer_io_lsu_bus_buffer_empty_any; // @[lsu_bus_intf.scala 137:38]
  assign io_bus_read_data_m = ld_fwddata_m[31:0]; // @[lsu_bus_intf.scala 193:27]
  assign io_dctl_busbuff_lsu_nonblock_load_valid_m = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_tag_m = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_r = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_data_valid = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_data_error = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_data_tag = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu_bus_intf.scala 143:19]
  assign io_dctl_busbuff_lsu_nonblock_load_data = bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu_bus_intf.scala 143:19]
  assign bus_buffer_clock = clock;
  assign bus_buffer_reset = reset;
  assign bus_buffer_io_scan_mode = io_scan_mode; // @[lsu_bus_intf.scala 104:29]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_external_ldfwd_disable = io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_intf.scala 105:18]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_wb_coalescing_disable = io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_intf.scala 105:18]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_intf.scala 105:18]
  assign bus_buffer_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[lsu_bus_intf.scala 107:51]
  assign bus_buffer_io_lsu_c2_r_clk = io_lsu_c2_r_clk; // @[lsu_bus_intf.scala 108:51]
  assign bus_buffer_io_lsu_bus_ibuf_c1_clk = io_lsu_bus_ibuf_c1_clk; // @[lsu_bus_intf.scala 109:51]
  assign bus_buffer_io_lsu_bus_obuf_c1_clk = io_lsu_bus_obuf_c1_clk; // @[lsu_bus_intf.scala 110:51]
  assign bus_buffer_io_lsu_bus_buf_c1_clk = io_lsu_bus_buf_c1_clk; // @[lsu_bus_intf.scala 111:51]
  assign bus_buffer_io_lsu_free_c2_clk = io_lsu_free_c2_clk; // @[lsu_bus_intf.scala 112:51]
  assign bus_buffer_io_lsu_busm_clk = io_lsu_busm_clk; // @[lsu_bus_intf.scala 113:51]
  assign bus_buffer_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu_bus_intf.scala 114:51]
  assign bus_buffer_io_lsu_pkt_m_valid = io_lsu_pkt_m_valid; // @[lsu_bus_intf.scala 117:27]
  assign bus_buffer_io_lsu_pkt_m_bits_load = io_lsu_pkt_m_bits_load; // @[lsu_bus_intf.scala 117:27]
  assign bus_buffer_io_lsu_pkt_r_bits_by = io_lsu_pkt_r_bits_by; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_pkt_r_bits_half = io_lsu_pkt_r_bits_half; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_pkt_r_bits_word = io_lsu_pkt_r_bits_word; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_pkt_r_bits_load = io_lsu_pkt_r_bits_load; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_pkt_r_bits_store = io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_pkt_r_bits_unsign = io_lsu_pkt_r_bits_unsign; // @[lsu_bus_intf.scala 118:27]
  assign bus_buffer_io_lsu_addr_m = io_lsu_addr_m; // @[lsu_bus_intf.scala 121:51]
  assign bus_buffer_io_end_addr_m = io_end_addr_m; // @[lsu_bus_intf.scala 122:51]
  assign bus_buffer_io_lsu_addr_r = io_lsu_addr_r; // @[lsu_bus_intf.scala 123:51]
  assign bus_buffer_io_end_addr_r = io_end_addr_r; // @[lsu_bus_intf.scala 124:51]
  assign bus_buffer_io_store_data_r = io_store_data_r; // @[lsu_bus_intf.scala 125:51]
  assign bus_buffer_io_no_word_merge_r = _T_22 & _T_24; // @[lsu_bus_intf.scala 144:51]
  assign bus_buffer_io_no_dword_merge_r = _T_22 & _T_30; // @[lsu_bus_intf.scala 145:51]
  assign bus_buffer_io_lsu_busreq_m = io_lsu_busreq_m; // @[lsu_bus_intf.scala 127:51]
  assign bus_buffer_io_ld_full_hit_m = _T_372 & _T_373; // @[lsu_bus_intf.scala 151:51]
  assign bus_buffer_io_flush_m_up = io_flush_m_up; // @[lsu_bus_intf.scala 128:51]
  assign bus_buffer_io_flush_r = io_flush_r; // @[lsu_bus_intf.scala 129:51]
  assign bus_buffer_io_lsu_commit_r = io_lsu_commit_r; // @[lsu_bus_intf.scala 130:51]
  assign bus_buffer_io_is_sideeffects_r = is_sideeffects_r; // @[lsu_bus_intf.scala 146:51]
  assign bus_buffer_io_ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[lsu_bus_intf.scala 147:51]
  assign bus_buffer_io_ldst_dual_m = ldst_dual_m; // @[lsu_bus_intf.scala 148:51]
  assign bus_buffer_io_ldst_dual_r = ldst_dual_r; // @[lsu_bus_intf.scala 149:51]
  assign bus_buffer_io_ldst_byteen_ext_m = {{1'd0}, _T_34}; // @[lsu_bus_intf.scala 150:51]
  assign bus_buffer_io_lsu_axi_aw_ready = io_axi_aw_ready; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_w_ready = io_axi_w_ready; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_b_valid = io_axi_b_valid; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_b_bits_resp = io_axi_b_bits_resp; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_b_bits_id = io_axi_b_bits_id; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_ar_ready = io_axi_ar_ready; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_r_valid = io_axi_r_valid; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_r_bits_id = io_axi_r_bits_id; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_r_bits_data = io_axi_r_bits_data; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_axi_r_bits_resp = io_axi_r_bits_resp; // @[lsu_bus_intf.scala 131:43]
  assign bus_buffer_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[lsu_bus_intf.scala 132:51]
  assign bus_buffer_io_lsu_bus_clk_en_q = lsu_bus_clk_en_q; // @[lsu_bus_intf.scala 152:51]
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
  ldst_byteen_r = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_bus_clk_en_q = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ldst_dual_m = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  is_sideeffects_r = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ldst_dual_r = 1'h0;
  end
  if (reset) begin
    ldst_byteen_r = 4'h0;
  end
  if (reset) begin
    lsu_bus_clk_en_q = 1'h0;
  end
  if (reset) begin
    ldst_dual_m = 1'h0;
  end
  if (reset) begin
    is_sideeffects_r = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_r <= 1'h0;
    end else begin
      ldst_dual_r <= ldst_dual_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      ldst_byteen_r <= 4'h0;
    end else begin
      ldst_byteen_r <= _T_6 | _T_5;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_bus_clk_en_q <= 1'h0;
    end else begin
      lsu_bus_clk_en_q <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      ldst_dual_m <= 1'h0;
    end else begin
      ldst_dual_m <= io_lsu_addr_d[2] != io_end_addr_d[2];
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      is_sideeffects_r <= 1'h0;
    end else begin
      is_sideeffects_r <= io_is_sideeffects_m;
    end
  end
endmodule
module lsu(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_lsu_dma_dma_lsc_ctl_dma_dccm_req,
  input  [31:0] io_lsu_dma_dma_lsc_ctl_dma_mem_addr,
  input  [2:0]  io_lsu_dma_dma_lsc_ctl_dma_mem_sz,
  input         io_lsu_dma_dma_lsc_ctl_dma_mem_write,
  input  [63:0] io_lsu_dma_dma_lsc_ctl_dma_mem_wdata,
  input  [31:0] io_lsu_dma_dma_dccm_ctl_dma_mem_addr,
  input  [63:0] io_lsu_dma_dma_dccm_ctl_dma_mem_wdata,
  output        io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid,
  output        io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error,
  output [2:0]  io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag,
  output [63:0] io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata,
  output        io_lsu_dma_dccm_ready,
  input  [2:0]  io_lsu_dma_dma_mem_tag,
  output        io_lsu_pic_picm_wren,
  output        io_lsu_pic_picm_rden,
  output        io_lsu_pic_picm_mken,
  output [31:0] io_lsu_pic_picm_rdaddr,
  output [31:0] io_lsu_pic_picm_wraddr,
  output [31:0] io_lsu_pic_picm_wr_data,
  input  [31:0] io_lsu_pic_picm_rd_data,
  input  [31:0] io_lsu_exu_exu_lsu_rs1_d,
  input  [31:0] io_lsu_exu_exu_lsu_rs2_d,
  output        io_lsu_dec_tlu_busbuff_lsu_pmu_bus_trxn,
  output        io_lsu_dec_tlu_busbuff_lsu_pmu_bus_misaligned,
  output        io_lsu_dec_tlu_busbuff_lsu_pmu_bus_error,
  output        io_lsu_dec_tlu_busbuff_lsu_pmu_bus_busy,
  input         io_lsu_dec_tlu_busbuff_dec_tlu_external_ldfwd_disable,
  input         io_lsu_dec_tlu_busbuff_dec_tlu_wb_coalescing_disable,
  input         io_lsu_dec_tlu_busbuff_dec_tlu_sideeffect_posted_disable,
  output        io_lsu_dec_tlu_busbuff_lsu_imprecise_error_load_any,
  output        io_lsu_dec_tlu_busbuff_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_dec_tlu_busbuff_lsu_imprecise_error_addr_any,
  output        io_lsu_dec_dctl_busbuff_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_tag_m,
  output        io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_valid,
  output        io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data,
  output        io_dccm_wren,
  output        io_dccm_rden,
  output [15:0] io_dccm_wr_addr_lo,
  output [15:0] io_dccm_wr_addr_hi,
  output [15:0] io_dccm_rd_addr_lo,
  output [15:0] io_dccm_rd_addr_hi,
  output [38:0] io_dccm_wr_data_lo,
  output [38:0] io_dccm_wr_data_hi,
  input  [38:0] io_dccm_rd_data_lo,
  input  [38:0] io_dccm_rd_data_hi,
  output        io_lsu_tlu_lsu_pmu_load_external_m,
  output        io_lsu_tlu_lsu_pmu_store_external_m,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output [2:0]  io_axi_aw_bits_id,
  output [31:0] io_axi_aw_bits_addr,
  output [3:0]  io_axi_aw_bits_region,
  output [7:0]  io_axi_aw_bits_len,
  output [2:0]  io_axi_aw_bits_size,
  output [1:0]  io_axi_aw_bits_burst,
  output        io_axi_aw_bits_lock,
  output [3:0]  io_axi_aw_bits_cache,
  output [2:0]  io_axi_aw_bits_prot,
  output [3:0]  io_axi_aw_bits_qos,
  input         io_axi_w_ready,
  output        io_axi_w_valid,
  output [63:0] io_axi_w_bits_data,
  output [7:0]  io_axi_w_bits_strb,
  output        io_axi_w_bits_last,
  output        io_axi_b_ready,
  input         io_axi_b_valid,
  input  [1:0]  io_axi_b_bits_resp,
  input  [2:0]  io_axi_b_bits_id,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [2:0]  io_axi_ar_bits_id,
  output [31:0] io_axi_ar_bits_addr,
  output [3:0]  io_axi_ar_bits_region,
  output [7:0]  io_axi_ar_bits_len,
  output [2:0]  io_axi_ar_bits_size,
  output [1:0]  io_axi_ar_bits_burst,
  output        io_axi_ar_bits_lock,
  output [3:0]  io_axi_ar_bits_cache,
  output [2:0]  io_axi_ar_bits_prot,
  output [3:0]  io_axi_ar_bits_qos,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [2:0]  io_axi_r_bits_id,
  input  [63:0] io_axi_r_bits_data,
  input  [1:0]  io_axi_r_bits_resp,
  input         io_axi_r_bits_last,
  input         io_dec_tlu_flush_lower_r,
  input         io_dec_tlu_i0_kill_writeb_r,
  input         io_dec_tlu_force_halt,
  input         io_dec_tlu_core_ecc_disable,
  input  [11:0] io_dec_lsu_offset_d,
  input         io_lsu_p_valid,
  input         io_lsu_p_bits_fast_int,
  input         io_lsu_p_bits_by,
  input         io_lsu_p_bits_half,
  input         io_lsu_p_bits_word,
  input         io_lsu_p_bits_dword,
  input         io_lsu_p_bits_load,
  input         io_lsu_p_bits_store,
  input         io_lsu_p_bits_unsign,
  input         io_lsu_p_bits_dma,
  input         io_lsu_p_bits_store_data_bypass_d,
  input         io_lsu_p_bits_load_ldst_bypass_d,
  input         io_lsu_p_bits_store_data_bypass_m,
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_pkt,
  input         io_trigger_pkt_any_0_store,
  input         io_trigger_pkt_any_0_load,
  input         io_trigger_pkt_any_0_execute,
  input         io_trigger_pkt_any_0_m,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_pkt,
  input         io_trigger_pkt_any_1_store,
  input         io_trigger_pkt_any_1_load,
  input         io_trigger_pkt_any_1_execute,
  input         io_trigger_pkt_any_1_m,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_pkt,
  input         io_trigger_pkt_any_2_store,
  input         io_trigger_pkt_any_2_load,
  input         io_trigger_pkt_any_2_execute,
  input         io_trigger_pkt_any_2_m,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_pkt,
  input         io_trigger_pkt_any_3_store,
  input         io_trigger_pkt_any_3_load,
  input         io_trigger_pkt_any_3_execute,
  input         io_trigger_pkt_any_3_m,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_dec_lsu_valid_raw_d,
  input  [31:0] io_dec_tlu_mrac_ff,
  output [31:0] io_lsu_result_m,
  output [31:0] io_lsu_result_corr_r,
  output        io_lsu_load_stall_any,
  output        io_lsu_store_stall_any,
  output        io_lsu_fastint_stall_any,
  output        io_lsu_idle_any,
  output [30:0] io_lsu_fir_addr,
  output [1:0]  io_lsu_fir_error,
  output        io_lsu_single_ecc_error_incr,
  output        io_lsu_error_pkt_r_valid,
  output        io_lsu_error_pkt_r_bits_single_ecc_error,
  output        io_lsu_error_pkt_r_bits_inst_type,
  output        io_lsu_error_pkt_r_bits_exc_type,
  output [3:0]  io_lsu_error_pkt_r_bits_mscause,
  output [31:0] io_lsu_error_pkt_r_bits_addr,
  output        io_lsu_pmu_misaligned_m,
  output [3:0]  io_lsu_trigger_match_m,
  input         io_lsu_bus_clk_en,
  input         io_scan_mode,
  input         io_free_clk
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_lsc_ctl_reset; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_c1_m_clk; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_c1_r_clk; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_c2_m_clk; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_c2_r_clk; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_store_c1_m_clk; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_r; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_r; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_flush_m_up; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_flush_r; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs1_d; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs2_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_valid; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_fast_int; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_by; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_half; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_word; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_dword; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_load; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_unsign; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_dma; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_load_ldst_bypass_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_dec_lsu_valid_raw_d; // @[lsu.scala 60:30]
  wire [11:0] lsu_lsc_ctl_io_dec_lsu_offset_d; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_picm_mask_data_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_bus_read_data_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_corr_r; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_d; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_d; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_dec_tlu_mrac_ff; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_exc_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_is_sideeffects_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_valid; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_single_ecc_error; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_inst_type; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_exc_type; // @[lsu.scala 60:30]
  wire [3:0] lsu_lsc_ctl_io_lsu_error_pkt_r_bits_mscause; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_error_pkt_r_bits_addr; // @[lsu.scala 60:30]
  wire [30:0] lsu_lsc_ctl_io_lsu_fir_addr; // @[lsu.scala 60:30]
  wire [1:0] lsu_lsc_ctl_io_lsu_fir_error; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_r; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 60:30]
  wire [31:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_addr; // @[lsu.scala 60:30]
  wire [2:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_sz; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 60:30]
  wire [63:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_wdata; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_fast_int; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_by; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_half; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_unsign; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_load_ldst_bypass_d; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_fast_int; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_dword; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_unsign; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_store_data_bypass_m; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_dword; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 60:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 60:30]
  wire  dccm_ctl_clock; // @[lsu.scala 63:30]
  wire  dccm_ctl_reset; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_c2_m_clk; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_c2_r_clk; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_free_c2_clk; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_store_c1_r_clk; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_dccm_d; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_dccm_m; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_dccm_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_pic_d; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_pic_m; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_addr_in_pic_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_raw_fwd_lo_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_raw_fwd_hi_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_commit_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_addr_d; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_lsu_addr_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_addr_r; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_end_addr_d; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_end_addr_m; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_end_addr_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_stbuf_reqvld_any; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_stbuf_addr_any; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_stbuf_data_any; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_stbuf_ecc_any; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_hi_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_lo_m; // @[lsu.scala 63:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 63:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_single_ecc_error_hi_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_single_ecc_error_lo_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_r_ff; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_r_ff; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_hi_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_lo_m; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_hi_m; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_lo_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_m; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_data_m; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dma_dccm_wen; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dma_pic_wen; // @[lsu.scala 63:30]
  wire [2:0] dccm_ctl_io_dma_mem_tag_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_lo; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_hi; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 63:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_data_hi_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_data_lo_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_datafn_hi_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_datafn_lo_r; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_store_data_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_picm_mask_data_m; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_stbuf_commit_any; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_dccm_rden_m; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_dma_dccm_ctl_dma_mem_addr; // @[lsu.scala 63:30]
  wire [63:0] dccm_ctl_io_dma_dccm_ctl_dma_mem_wdata; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dma_dccm_ctl_dccm_dma_rvalid; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dma_dccm_ctl_dccm_dma_ecc_error; // @[lsu.scala 63:30]
  wire [2:0] dccm_ctl_io_dma_dccm_ctl_dccm_dma_rtag; // @[lsu.scala 63:30]
  wire [63:0] dccm_ctl_io_dma_dccm_ctl_dccm_dma_rdata; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dccm_wren; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_dccm_rden; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_lo; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_hi; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_lo; // @[lsu.scala 63:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_hi; // @[lsu.scala 63:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_lo; // @[lsu.scala 63:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_hi; // @[lsu.scala 63:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_lo; // @[lsu.scala 63:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_hi; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pic_picm_wren; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pic_picm_rden; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_lsu_pic_picm_mken; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_rdaddr; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_wraddr; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_wr_data; // @[lsu.scala 63:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_rd_data; // @[lsu.scala 63:30]
  wire  dccm_ctl_io_scan_mode; // @[lsu.scala 63:30]
  wire  stbuf_clock; // @[lsu.scala 64:30]
  wire  stbuf_reset; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_c1_m_clk; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_c1_r_clk; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_stbuf_c1_clk; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_free_c2_clk; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_m_valid; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_m_bits_store; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_m_bits_dma; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_valid; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_by; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_half; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_word; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_dword; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_store; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_pkt_r_bits_dma; // @[lsu.scala 64:30]
  wire  stbuf_io_store_stbuf_reqvld_r; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_commit_r; // @[lsu.scala 64:30]
  wire  stbuf_io_dec_lsu_valid_raw_d; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_store_data_hi_r; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_store_data_lo_r; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_store_datafn_hi_r; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_store_datafn_lo_r; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_stbuf_commit_any; // @[lsu.scala 64:30]
  wire [15:0] stbuf_io_lsu_addr_d; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_lsu_addr_m; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_lsu_addr_r; // @[lsu.scala 64:30]
  wire [15:0] stbuf_io_end_addr_d; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_end_addr_m; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_end_addr_r; // @[lsu.scala 64:30]
  wire  stbuf_io_addr_in_dccm_m; // @[lsu.scala 64:30]
  wire  stbuf_io_addr_in_dccm_r; // @[lsu.scala 64:30]
  wire  stbuf_io_scan_mode; // @[lsu.scala 64:30]
  wire  stbuf_io_stbuf_reqvld_any; // @[lsu.scala 64:30]
  wire  stbuf_io_stbuf_reqvld_flushed_any; // @[lsu.scala 64:30]
  wire [15:0] stbuf_io_stbuf_addr_any; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_stbuf_data_any; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_stbuf_full_any; // @[lsu.scala 64:30]
  wire  stbuf_io_lsu_stbuf_empty_any; // @[lsu.scala 64:30]
  wire  stbuf_io_ldst_stbuf_reqvld_r; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_stbuf_fwddata_hi_m; // @[lsu.scala 64:30]
  wire [31:0] stbuf_io_stbuf_fwddata_lo_m; // @[lsu.scala 64:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 64:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 64:30]
  wire  ecc_clock; // @[lsu.scala 65:30]
  wire  ecc_reset; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_c2_r_clk; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_pkt_m_valid; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_pkt_m_bits_load; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_pkt_m_bits_store; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_pkt_m_bits_dma; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_stbuf_data_any; // @[lsu.scala 65:30]
  wire  ecc_io_dec_tlu_core_ecc_disable; // @[lsu.scala 65:30]
  wire [15:0] ecc_io_lsu_addr_m; // @[lsu.scala 65:30]
  wire [15:0] ecc_io_end_addr_m; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_dccm_rdata_hi_m; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_dccm_rdata_lo_m; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_dccm_data_ecc_hi_m; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_dccm_data_ecc_lo_m; // @[lsu.scala 65:30]
  wire  ecc_io_ld_single_ecc_error_r; // @[lsu.scala 65:30]
  wire  ecc_io_ld_single_ecc_error_r_ff; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_dccm_rden_m; // @[lsu.scala 65:30]
  wire  ecc_io_addr_in_dccm_m; // @[lsu.scala 65:30]
  wire  ecc_io_dma_dccm_wen; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_dma_dccm_wdata_lo; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_dma_dccm_wdata_hi; // @[lsu.scala 65:30]
  wire  ecc_io_scan_mode; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_hi_r; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_lo_r; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_hi_m; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_lo_m; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_hi_r_ff; // @[lsu.scala 65:30]
  wire [31:0] ecc_io_sec_data_lo_r_ff; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_stbuf_ecc_any; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 65:30]
  wire [6:0] ecc_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 65:30]
  wire  ecc_io_single_ecc_error_hi_r; // @[lsu.scala 65:30]
  wire  ecc_io_single_ecc_error_lo_r; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_single_ecc_error_r; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_single_ecc_error_m; // @[lsu.scala 65:30]
  wire  ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 65:30]
  wire  trigger_io_trigger_pkt_any_0_select; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_0_match_pkt; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_0_store; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_0_load; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_trigger_pkt_any_0_tdata2; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_1_select; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_1_match_pkt; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_1_store; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_1_load; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_trigger_pkt_any_1_tdata2; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_2_select; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_2_match_pkt; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_2_store; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_2_load; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_trigger_pkt_any_2_tdata2; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_3_select; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_3_match_pkt; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_3_store; // @[lsu.scala 66:30]
  wire  trigger_io_trigger_pkt_any_3_load; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_trigger_pkt_any_3_tdata2; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_valid; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_bits_half; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_bits_word; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_bits_load; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_bits_store; // @[lsu.scala 66:30]
  wire  trigger_io_lsu_pkt_m_bits_dma; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_lsu_addr_m; // @[lsu.scala 66:30]
  wire [31:0] trigger_io_store_data_m; // @[lsu.scala 66:30]
  wire [3:0] trigger_io_lsu_trigger_match_m; // @[lsu.scala 66:30]
  wire  clkdomain_clock; // @[lsu.scala 67:30]
  wire  clkdomain_reset; // @[lsu.scala 67:30]
  wire  clkdomain_io_free_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_clk_override; // @[lsu.scala 67:30]
  wire  clkdomain_io_dma_dccm_req; // @[lsu.scala 67:30]
  wire  clkdomain_io_ldst_stbuf_reqvld_r; // @[lsu.scala 67:30]
  wire  clkdomain_io_stbuf_reqvld_any; // @[lsu.scala 67:30]
  wire  clkdomain_io_stbuf_reqvld_flushed_any; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_busreq_r; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_buffer_pend_any; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_buffer_empty_any; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_stbuf_empty_any; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_clk_en; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_p_valid; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_pkt_d_valid; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_pkt_d_bits_store; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_pkt_m_valid; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_pkt_m_bits_store; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_pkt_r_valid; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_store_c1_m_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_store_c1_r_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_stbuf_c1_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_bus_buf_c1_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_busm_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 67:30]
  wire  clkdomain_io_scan_mode; // @[lsu.scala 67:30]
  wire  bus_intf_clock; // @[lsu.scala 68:30]
  wire  bus_intf_reset; // @[lsu.scala 68:30]
  wire  bus_intf_io_scan_mode; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu.scala 68:30]
  wire  bus_intf_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_c1_m_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_c1_r_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_c2_r_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_buf_c1_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_free_c2_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_free_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_busm_clk; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_aw_ready; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_aw_valid; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_aw_bits_id; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_axi_aw_bits_addr; // @[lsu.scala 68:30]
  wire [3:0] bus_intf_io_axi_aw_bits_region; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_aw_bits_size; // @[lsu.scala 68:30]
  wire [3:0] bus_intf_io_axi_aw_bits_cache; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_w_ready; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_w_valid; // @[lsu.scala 68:30]
  wire [63:0] bus_intf_io_axi_w_bits_data; // @[lsu.scala 68:30]
  wire [7:0] bus_intf_io_axi_w_bits_strb; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_b_valid; // @[lsu.scala 68:30]
  wire [1:0] bus_intf_io_axi_b_bits_resp; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_b_bits_id; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_ar_ready; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_ar_valid; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_ar_bits_id; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_axi_ar_bits_addr; // @[lsu.scala 68:30]
  wire [3:0] bus_intf_io_axi_ar_bits_region; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_ar_bits_size; // @[lsu.scala 68:30]
  wire [3:0] bus_intf_io_axi_ar_bits_cache; // @[lsu.scala 68:30]
  wire  bus_intf_io_axi_r_valid; // @[lsu.scala 68:30]
  wire [2:0] bus_intf_io_axi_r_bits_id; // @[lsu.scala 68:30]
  wire [63:0] bus_intf_io_axi_r_bits_data; // @[lsu.scala 68:30]
  wire [1:0] bus_intf_io_axi_r_bits_resp; // @[lsu.scala 68:30]
  wire  bus_intf_io_dec_lsu_valid_raw_d; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_busreq_m; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_m_valid; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_m_bits_by; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_m_bits_half; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_m_bits_word; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_m_bits_load; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_valid; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_by; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_half; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_word; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_load; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_store; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_lsu_addr_d; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_lsu_addr_m; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_lsu_addr_r; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_end_addr_d; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_end_addr_m; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_end_addr_r; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_store_data_r; // @[lsu.scala 68:30]
  wire  bus_intf_io_dec_tlu_force_halt; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_commit_r; // @[lsu.scala 68:30]
  wire  bus_intf_io_is_sideeffects_m; // @[lsu.scala 68:30]
  wire  bus_intf_io_flush_m_up; // @[lsu.scala 68:30]
  wire  bus_intf_io_flush_r; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_busreq_r; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_buffer_pend_any; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_buffer_full_any; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_bus_read_data_m; // @[lsu.scala 68:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu.scala 68:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu.scala 68:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu.scala 68:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu.scala 68:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu.scala 68:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu.scala 68:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu.scala 68:30]
  wire [31:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu.scala 68:30]
  wire  bus_intf_io_lsu_bus_clk_en; // @[lsu.scala 68:30]
  wire  _T = stbuf_io_lsu_stbuf_full_any | bus_intf_io_lsu_bus_buffer_full_any; // @[lsu.scala 74:57]
  wire  _T_3 = ~lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 81:58]
  wire  _T_4 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_3; // @[lsu.scala 81:56]
  wire  _T_5 = lsu_lsc_ctl_io_addr_in_dccm_m | lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 81:126]
  wire  _T_6 = _T_4 & _T_5; // @[lsu.scala 81:93]
  wire  ldst_nodma_mtor = _T_6 & lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 81:158]
  wire  _T_7 = io_dec_lsu_valid_raw_d | ldst_nodma_mtor; // @[lsu.scala 82:53]
  wire  _T_8 = _T_7 | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 82:71]
  wire  _T_10 = io_lsu_dma_dma_lsc_ctl_dma_dccm_req & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 83:58]
  wire [5:0] _T_13 = {io_lsu_dma_dma_lsc_ctl_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_dccm_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata >> _T_13; // @[lsu.scala 85:58]
  wire  _T_19 = ~lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 96:130]
  wire  _T_20 = lsu_lsc_ctl_io_lsu_pkt_r_valid & _T_19; // @[lsu.scala 96:128]
  wire  _T_21 = _T_4 | _T_20; // @[lsu.scala 96:94]
  wire  _T_22 = ~_T_21; // @[lsu.scala 96:22]
  wire  _T_25 = lsu_lsc_ctl_io_lsu_pkt_r_valid & lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 98:61]
  wire  _T_26 = _T_25 & lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 98:99]
  wire  _T_27 = ~io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 98:133]
  wire  _T_28 = _T_26 & _T_27; // @[lsu.scala 98:131]
  wire  _T_30 = lsu_lsc_ctl_io_lsu_pkt_m_bits_load | lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 100:90]
  wire  _T_34 = _T_30 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 102:131]
  wire  _T_35 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_34; // @[lsu.scala 102:53]
  wire  _T_36 = ~io_dec_tlu_flush_lower_r; // @[lsu.scala 102:167]
  wire  _T_37 = _T_35 & _T_36; // @[lsu.scala 102:165]
  wire  _T_38 = ~lsu_lsc_ctl_io_lsu_exc_m; // @[lsu.scala 102:181]
  wire  _T_39 = _T_37 & _T_38; // @[lsu.scala 102:179]
  wire  _T_40 = ~lsu_lsc_ctl_io_lsu_pkt_m_bits_fast_int; // @[lsu.scala 102:209]
  wire  _T_42 = lsu_lsc_ctl_io_lsu_pkt_m_bits_half & lsu_lsc_ctl_io_lsu_addr_m[0]; // @[lsu.scala 104:100]
  wire  _T_44 = |lsu_lsc_ctl_io_lsu_addr_m[1:0]; // @[lsu.scala 104:203]
  wire  _T_45 = lsu_lsc_ctl_io_lsu_pkt_m_bits_word & _T_44; // @[lsu.scala 104:170]
  wire  _T_46 = _T_42 | _T_45; // @[lsu.scala 104:132]
  wire  _T_48 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 105:73]
  wire  _T_50 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 106:73]
  reg [2:0] dma_mem_tag_m; // @[lsu.scala 317:67]
  reg  lsu_raw_fwd_hi_r; // @[lsu.scala 318:67]
  reg  lsu_raw_fwd_lo_r; // @[lsu.scala 319:67]
  lsu_lsc_ctl lsu_lsc_ctl ( // @[lsu.scala 60:30]
    .reset(lsu_lsc_ctl_reset),
    .io_lsu_c1_m_clk(lsu_lsc_ctl_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(lsu_lsc_ctl_io_lsu_c1_r_clk),
    .io_lsu_c2_m_clk(lsu_lsc_ctl_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(lsu_lsc_ctl_io_lsu_c2_r_clk),
    .io_lsu_store_c1_m_clk(lsu_lsc_ctl_io_lsu_store_c1_m_clk),
    .io_lsu_ld_data_corr_r(lsu_lsc_ctl_io_lsu_ld_data_corr_r),
    .io_lsu_single_ecc_error_r(lsu_lsc_ctl_io_lsu_single_ecc_error_r),
    .io_lsu_double_ecc_error_r(lsu_lsc_ctl_io_lsu_double_ecc_error_r),
    .io_lsu_ld_data_m(lsu_lsc_ctl_io_lsu_ld_data_m),
    .io_lsu_single_ecc_error_m(lsu_lsc_ctl_io_lsu_single_ecc_error_m),
    .io_lsu_double_ecc_error_m(lsu_lsc_ctl_io_lsu_double_ecc_error_m),
    .io_flush_m_up(lsu_lsc_ctl_io_flush_m_up),
    .io_flush_r(lsu_lsc_ctl_io_flush_r),
    .io_lsu_exu_exu_lsu_rs1_d(lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs1_d),
    .io_lsu_exu_exu_lsu_rs2_d(lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs2_d),
    .io_lsu_p_valid(lsu_lsc_ctl_io_lsu_p_valid),
    .io_lsu_p_bits_fast_int(lsu_lsc_ctl_io_lsu_p_bits_fast_int),
    .io_lsu_p_bits_by(lsu_lsc_ctl_io_lsu_p_bits_by),
    .io_lsu_p_bits_half(lsu_lsc_ctl_io_lsu_p_bits_half),
    .io_lsu_p_bits_word(lsu_lsc_ctl_io_lsu_p_bits_word),
    .io_lsu_p_bits_dword(lsu_lsc_ctl_io_lsu_p_bits_dword),
    .io_lsu_p_bits_load(lsu_lsc_ctl_io_lsu_p_bits_load),
    .io_lsu_p_bits_store(lsu_lsc_ctl_io_lsu_p_bits_store),
    .io_lsu_p_bits_unsign(lsu_lsc_ctl_io_lsu_p_bits_unsign),
    .io_lsu_p_bits_dma(lsu_lsc_ctl_io_lsu_p_bits_dma),
    .io_lsu_p_bits_store_data_bypass_d(lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_d),
    .io_lsu_p_bits_load_ldst_bypass_d(lsu_lsc_ctl_io_lsu_p_bits_load_ldst_bypass_d),
    .io_lsu_p_bits_store_data_bypass_m(lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_m),
    .io_dec_lsu_valid_raw_d(lsu_lsc_ctl_io_dec_lsu_valid_raw_d),
    .io_dec_lsu_offset_d(lsu_lsc_ctl_io_dec_lsu_offset_d),
    .io_picm_mask_data_m(lsu_lsc_ctl_io_picm_mask_data_m),
    .io_bus_read_data_m(lsu_lsc_ctl_io_bus_read_data_m),
    .io_lsu_result_m(lsu_lsc_ctl_io_lsu_result_m),
    .io_lsu_result_corr_r(lsu_lsc_ctl_io_lsu_result_corr_r),
    .io_lsu_addr_d(lsu_lsc_ctl_io_lsu_addr_d),
    .io_lsu_addr_m(lsu_lsc_ctl_io_lsu_addr_m),
    .io_lsu_addr_r(lsu_lsc_ctl_io_lsu_addr_r),
    .io_end_addr_d(lsu_lsc_ctl_io_end_addr_d),
    .io_end_addr_m(lsu_lsc_ctl_io_end_addr_m),
    .io_end_addr_r(lsu_lsc_ctl_io_end_addr_r),
    .io_store_data_m(lsu_lsc_ctl_io_store_data_m),
    .io_dec_tlu_mrac_ff(lsu_lsc_ctl_io_dec_tlu_mrac_ff),
    .io_lsu_exc_m(lsu_lsc_ctl_io_lsu_exc_m),
    .io_is_sideeffects_m(lsu_lsc_ctl_io_is_sideeffects_m),
    .io_lsu_commit_r(lsu_lsc_ctl_io_lsu_commit_r),
    .io_lsu_single_ecc_error_incr(lsu_lsc_ctl_io_lsu_single_ecc_error_incr),
    .io_lsu_error_pkt_r_valid(lsu_lsc_ctl_io_lsu_error_pkt_r_valid),
    .io_lsu_error_pkt_r_bits_single_ecc_error(lsu_lsc_ctl_io_lsu_error_pkt_r_bits_single_ecc_error),
    .io_lsu_error_pkt_r_bits_inst_type(lsu_lsc_ctl_io_lsu_error_pkt_r_bits_inst_type),
    .io_lsu_error_pkt_r_bits_exc_type(lsu_lsc_ctl_io_lsu_error_pkt_r_bits_exc_type),
    .io_lsu_error_pkt_r_bits_mscause(lsu_lsc_ctl_io_lsu_error_pkt_r_bits_mscause),
    .io_lsu_error_pkt_r_bits_addr(lsu_lsc_ctl_io_lsu_error_pkt_r_bits_addr),
    .io_lsu_fir_addr(lsu_lsc_ctl_io_lsu_fir_addr),
    .io_lsu_fir_error(lsu_lsc_ctl_io_lsu_fir_error),
    .io_addr_in_dccm_d(lsu_lsc_ctl_io_addr_in_dccm_d),
    .io_addr_in_dccm_m(lsu_lsc_ctl_io_addr_in_dccm_m),
    .io_addr_in_dccm_r(lsu_lsc_ctl_io_addr_in_dccm_r),
    .io_addr_in_pic_d(lsu_lsc_ctl_io_addr_in_pic_d),
    .io_addr_in_pic_m(lsu_lsc_ctl_io_addr_in_pic_m),
    .io_addr_in_pic_r(lsu_lsc_ctl_io_addr_in_pic_r),
    .io_addr_external_m(lsu_lsc_ctl_io_addr_external_m),
    .io_dma_lsc_ctl_dma_dccm_req(lsu_lsc_ctl_io_dma_lsc_ctl_dma_dccm_req),
    .io_dma_lsc_ctl_dma_mem_addr(lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_addr),
    .io_dma_lsc_ctl_dma_mem_sz(lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_sz),
    .io_dma_lsc_ctl_dma_mem_write(lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_write),
    .io_dma_lsc_ctl_dma_mem_wdata(lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_wdata),
    .io_lsu_pkt_d_valid(lsu_lsc_ctl_io_lsu_pkt_d_valid),
    .io_lsu_pkt_d_bits_fast_int(lsu_lsc_ctl_io_lsu_pkt_d_bits_fast_int),
    .io_lsu_pkt_d_bits_by(lsu_lsc_ctl_io_lsu_pkt_d_bits_by),
    .io_lsu_pkt_d_bits_half(lsu_lsc_ctl_io_lsu_pkt_d_bits_half),
    .io_lsu_pkt_d_bits_word(lsu_lsc_ctl_io_lsu_pkt_d_bits_word),
    .io_lsu_pkt_d_bits_dword(lsu_lsc_ctl_io_lsu_pkt_d_bits_dword),
    .io_lsu_pkt_d_bits_load(lsu_lsc_ctl_io_lsu_pkt_d_bits_load),
    .io_lsu_pkt_d_bits_store(lsu_lsc_ctl_io_lsu_pkt_d_bits_store),
    .io_lsu_pkt_d_bits_unsign(lsu_lsc_ctl_io_lsu_pkt_d_bits_unsign),
    .io_lsu_pkt_d_bits_dma(lsu_lsc_ctl_io_lsu_pkt_d_bits_dma),
    .io_lsu_pkt_d_bits_store_data_bypass_d(lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_d),
    .io_lsu_pkt_d_bits_load_ldst_bypass_d(lsu_lsc_ctl_io_lsu_pkt_d_bits_load_ldst_bypass_d),
    .io_lsu_pkt_d_bits_store_data_bypass_m(lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_m),
    .io_lsu_pkt_m_valid(lsu_lsc_ctl_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_fast_int(lsu_lsc_ctl_io_lsu_pkt_m_bits_fast_int),
    .io_lsu_pkt_m_bits_by(lsu_lsc_ctl_io_lsu_pkt_m_bits_by),
    .io_lsu_pkt_m_bits_half(lsu_lsc_ctl_io_lsu_pkt_m_bits_half),
    .io_lsu_pkt_m_bits_word(lsu_lsc_ctl_io_lsu_pkt_m_bits_word),
    .io_lsu_pkt_m_bits_dword(lsu_lsc_ctl_io_lsu_pkt_m_bits_dword),
    .io_lsu_pkt_m_bits_load(lsu_lsc_ctl_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_m_bits_store(lsu_lsc_ctl_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_m_bits_unsign(lsu_lsc_ctl_io_lsu_pkt_m_bits_unsign),
    .io_lsu_pkt_m_bits_dma(lsu_lsc_ctl_io_lsu_pkt_m_bits_dma),
    .io_lsu_pkt_m_bits_store_data_bypass_m(lsu_lsc_ctl_io_lsu_pkt_m_bits_store_data_bypass_m),
    .io_lsu_pkt_r_valid(lsu_lsc_ctl_io_lsu_pkt_r_valid),
    .io_lsu_pkt_r_bits_by(lsu_lsc_ctl_io_lsu_pkt_r_bits_by),
    .io_lsu_pkt_r_bits_half(lsu_lsc_ctl_io_lsu_pkt_r_bits_half),
    .io_lsu_pkt_r_bits_word(lsu_lsc_ctl_io_lsu_pkt_r_bits_word),
    .io_lsu_pkt_r_bits_dword(lsu_lsc_ctl_io_lsu_pkt_r_bits_dword),
    .io_lsu_pkt_r_bits_load(lsu_lsc_ctl_io_lsu_pkt_r_bits_load),
    .io_lsu_pkt_r_bits_store(lsu_lsc_ctl_io_lsu_pkt_r_bits_store),
    .io_lsu_pkt_r_bits_unsign(lsu_lsc_ctl_io_lsu_pkt_r_bits_unsign),
    .io_lsu_pkt_r_bits_dma(lsu_lsc_ctl_io_lsu_pkt_r_bits_dma)
  );
  lsu_dccm_ctl dccm_ctl ( // @[lsu.scala 63:30]
    .clock(dccm_ctl_clock),
    .reset(dccm_ctl_reset),
    .io_lsu_c2_m_clk(dccm_ctl_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(dccm_ctl_io_lsu_c2_r_clk),
    .io_lsu_free_c2_clk(dccm_ctl_io_lsu_free_c2_clk),
    .io_lsu_store_c1_r_clk(dccm_ctl_io_lsu_store_c1_r_clk),
    .io_lsu_pkt_d_valid(dccm_ctl_io_lsu_pkt_d_valid),
    .io_lsu_pkt_d_bits_word(dccm_ctl_io_lsu_pkt_d_bits_word),
    .io_lsu_pkt_d_bits_dword(dccm_ctl_io_lsu_pkt_d_bits_dword),
    .io_lsu_pkt_d_bits_load(dccm_ctl_io_lsu_pkt_d_bits_load),
    .io_lsu_pkt_d_bits_store(dccm_ctl_io_lsu_pkt_d_bits_store),
    .io_lsu_pkt_d_bits_dma(dccm_ctl_io_lsu_pkt_d_bits_dma),
    .io_lsu_pkt_m_valid(dccm_ctl_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_by(dccm_ctl_io_lsu_pkt_m_bits_by),
    .io_lsu_pkt_m_bits_half(dccm_ctl_io_lsu_pkt_m_bits_half),
    .io_lsu_pkt_m_bits_word(dccm_ctl_io_lsu_pkt_m_bits_word),
    .io_lsu_pkt_m_bits_load(dccm_ctl_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_m_bits_store(dccm_ctl_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_m_bits_dma(dccm_ctl_io_lsu_pkt_m_bits_dma),
    .io_lsu_pkt_r_valid(dccm_ctl_io_lsu_pkt_r_valid),
    .io_lsu_pkt_r_bits_by(dccm_ctl_io_lsu_pkt_r_bits_by),
    .io_lsu_pkt_r_bits_half(dccm_ctl_io_lsu_pkt_r_bits_half),
    .io_lsu_pkt_r_bits_word(dccm_ctl_io_lsu_pkt_r_bits_word),
    .io_lsu_pkt_r_bits_load(dccm_ctl_io_lsu_pkt_r_bits_load),
    .io_lsu_pkt_r_bits_store(dccm_ctl_io_lsu_pkt_r_bits_store),
    .io_lsu_pkt_r_bits_dma(dccm_ctl_io_lsu_pkt_r_bits_dma),
    .io_addr_in_dccm_d(dccm_ctl_io_addr_in_dccm_d),
    .io_addr_in_dccm_m(dccm_ctl_io_addr_in_dccm_m),
    .io_addr_in_dccm_r(dccm_ctl_io_addr_in_dccm_r),
    .io_addr_in_pic_d(dccm_ctl_io_addr_in_pic_d),
    .io_addr_in_pic_m(dccm_ctl_io_addr_in_pic_m),
    .io_addr_in_pic_r(dccm_ctl_io_addr_in_pic_r),
    .io_lsu_raw_fwd_lo_r(dccm_ctl_io_lsu_raw_fwd_lo_r),
    .io_lsu_raw_fwd_hi_r(dccm_ctl_io_lsu_raw_fwd_hi_r),
    .io_lsu_commit_r(dccm_ctl_io_lsu_commit_r),
    .io_lsu_addr_d(dccm_ctl_io_lsu_addr_d),
    .io_lsu_addr_m(dccm_ctl_io_lsu_addr_m),
    .io_lsu_addr_r(dccm_ctl_io_lsu_addr_r),
    .io_end_addr_d(dccm_ctl_io_end_addr_d),
    .io_end_addr_m(dccm_ctl_io_end_addr_m),
    .io_end_addr_r(dccm_ctl_io_end_addr_r),
    .io_stbuf_reqvld_any(dccm_ctl_io_stbuf_reqvld_any),
    .io_stbuf_addr_any(dccm_ctl_io_stbuf_addr_any),
    .io_stbuf_data_any(dccm_ctl_io_stbuf_data_any),
    .io_stbuf_ecc_any(dccm_ctl_io_stbuf_ecc_any),
    .io_stbuf_fwddata_hi_m(dccm_ctl_io_stbuf_fwddata_hi_m),
    .io_stbuf_fwddata_lo_m(dccm_ctl_io_stbuf_fwddata_lo_m),
    .io_stbuf_fwdbyteen_lo_m(dccm_ctl_io_stbuf_fwdbyteen_lo_m),
    .io_stbuf_fwdbyteen_hi_m(dccm_ctl_io_stbuf_fwdbyteen_hi_m),
    .io_lsu_ld_data_corr_r(dccm_ctl_io_lsu_ld_data_corr_r),
    .io_lsu_double_ecc_error_r(dccm_ctl_io_lsu_double_ecc_error_r),
    .io_single_ecc_error_hi_r(dccm_ctl_io_single_ecc_error_hi_r),
    .io_single_ecc_error_lo_r(dccm_ctl_io_single_ecc_error_lo_r),
    .io_sec_data_hi_r_ff(dccm_ctl_io_sec_data_hi_r_ff),
    .io_sec_data_lo_r_ff(dccm_ctl_io_sec_data_lo_r_ff),
    .io_sec_data_ecc_hi_r_ff(dccm_ctl_io_sec_data_ecc_hi_r_ff),
    .io_sec_data_ecc_lo_r_ff(dccm_ctl_io_sec_data_ecc_lo_r_ff),
    .io_dccm_rdata_hi_m(dccm_ctl_io_dccm_rdata_hi_m),
    .io_dccm_rdata_lo_m(dccm_ctl_io_dccm_rdata_lo_m),
    .io_dccm_data_ecc_hi_m(dccm_ctl_io_dccm_data_ecc_hi_m),
    .io_dccm_data_ecc_lo_m(dccm_ctl_io_dccm_data_ecc_lo_m),
    .io_lsu_ld_data_m(dccm_ctl_io_lsu_ld_data_m),
    .io_lsu_double_ecc_error_m(dccm_ctl_io_lsu_double_ecc_error_m),
    .io_sec_data_hi_m(dccm_ctl_io_sec_data_hi_m),
    .io_sec_data_lo_m(dccm_ctl_io_sec_data_lo_m),
    .io_store_data_m(dccm_ctl_io_store_data_m),
    .io_dma_dccm_wen(dccm_ctl_io_dma_dccm_wen),
    .io_dma_pic_wen(dccm_ctl_io_dma_pic_wen),
    .io_dma_mem_tag_m(dccm_ctl_io_dma_mem_tag_m),
    .io_dma_dccm_wdata_lo(dccm_ctl_io_dma_dccm_wdata_lo),
    .io_dma_dccm_wdata_hi(dccm_ctl_io_dma_dccm_wdata_hi),
    .io_dma_dccm_wdata_ecc_hi(dccm_ctl_io_dma_dccm_wdata_ecc_hi),
    .io_dma_dccm_wdata_ecc_lo(dccm_ctl_io_dma_dccm_wdata_ecc_lo),
    .io_store_data_hi_r(dccm_ctl_io_store_data_hi_r),
    .io_store_data_lo_r(dccm_ctl_io_store_data_lo_r),
    .io_store_datafn_hi_r(dccm_ctl_io_store_datafn_hi_r),
    .io_store_datafn_lo_r(dccm_ctl_io_store_datafn_lo_r),
    .io_store_data_r(dccm_ctl_io_store_data_r),
    .io_ld_single_ecc_error_r(dccm_ctl_io_ld_single_ecc_error_r),
    .io_ld_single_ecc_error_r_ff(dccm_ctl_io_ld_single_ecc_error_r_ff),
    .io_picm_mask_data_m(dccm_ctl_io_picm_mask_data_m),
    .io_lsu_stbuf_commit_any(dccm_ctl_io_lsu_stbuf_commit_any),
    .io_lsu_dccm_rden_m(dccm_ctl_io_lsu_dccm_rden_m),
    .io_dma_dccm_ctl_dma_mem_addr(dccm_ctl_io_dma_dccm_ctl_dma_mem_addr),
    .io_dma_dccm_ctl_dma_mem_wdata(dccm_ctl_io_dma_dccm_ctl_dma_mem_wdata),
    .io_dma_dccm_ctl_dccm_dma_rvalid(dccm_ctl_io_dma_dccm_ctl_dccm_dma_rvalid),
    .io_dma_dccm_ctl_dccm_dma_ecc_error(dccm_ctl_io_dma_dccm_ctl_dccm_dma_ecc_error),
    .io_dma_dccm_ctl_dccm_dma_rtag(dccm_ctl_io_dma_dccm_ctl_dccm_dma_rtag),
    .io_dma_dccm_ctl_dccm_dma_rdata(dccm_ctl_io_dma_dccm_ctl_dccm_dma_rdata),
    .io_dccm_wren(dccm_ctl_io_dccm_wren),
    .io_dccm_rden(dccm_ctl_io_dccm_rden),
    .io_dccm_wr_addr_lo(dccm_ctl_io_dccm_wr_addr_lo),
    .io_dccm_wr_addr_hi(dccm_ctl_io_dccm_wr_addr_hi),
    .io_dccm_rd_addr_lo(dccm_ctl_io_dccm_rd_addr_lo),
    .io_dccm_rd_addr_hi(dccm_ctl_io_dccm_rd_addr_hi),
    .io_dccm_wr_data_lo(dccm_ctl_io_dccm_wr_data_lo),
    .io_dccm_wr_data_hi(dccm_ctl_io_dccm_wr_data_hi),
    .io_dccm_rd_data_lo(dccm_ctl_io_dccm_rd_data_lo),
    .io_dccm_rd_data_hi(dccm_ctl_io_dccm_rd_data_hi),
    .io_lsu_pic_picm_wren(dccm_ctl_io_lsu_pic_picm_wren),
    .io_lsu_pic_picm_rden(dccm_ctl_io_lsu_pic_picm_rden),
    .io_lsu_pic_picm_mken(dccm_ctl_io_lsu_pic_picm_mken),
    .io_lsu_pic_picm_rdaddr(dccm_ctl_io_lsu_pic_picm_rdaddr),
    .io_lsu_pic_picm_wraddr(dccm_ctl_io_lsu_pic_picm_wraddr),
    .io_lsu_pic_picm_wr_data(dccm_ctl_io_lsu_pic_picm_wr_data),
    .io_lsu_pic_picm_rd_data(dccm_ctl_io_lsu_pic_picm_rd_data),
    .io_scan_mode(dccm_ctl_io_scan_mode)
  );
  lsu_stbuf stbuf ( // @[lsu.scala 64:30]
    .clock(stbuf_clock),
    .reset(stbuf_reset),
    .io_lsu_c1_m_clk(stbuf_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(stbuf_io_lsu_c1_r_clk),
    .io_lsu_stbuf_c1_clk(stbuf_io_lsu_stbuf_c1_clk),
    .io_lsu_free_c2_clk(stbuf_io_lsu_free_c2_clk),
    .io_lsu_pkt_m_valid(stbuf_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_store(stbuf_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_m_bits_dma(stbuf_io_lsu_pkt_m_bits_dma),
    .io_lsu_pkt_r_valid(stbuf_io_lsu_pkt_r_valid),
    .io_lsu_pkt_r_bits_by(stbuf_io_lsu_pkt_r_bits_by),
    .io_lsu_pkt_r_bits_half(stbuf_io_lsu_pkt_r_bits_half),
    .io_lsu_pkt_r_bits_word(stbuf_io_lsu_pkt_r_bits_word),
    .io_lsu_pkt_r_bits_dword(stbuf_io_lsu_pkt_r_bits_dword),
    .io_lsu_pkt_r_bits_store(stbuf_io_lsu_pkt_r_bits_store),
    .io_lsu_pkt_r_bits_dma(stbuf_io_lsu_pkt_r_bits_dma),
    .io_store_stbuf_reqvld_r(stbuf_io_store_stbuf_reqvld_r),
    .io_lsu_commit_r(stbuf_io_lsu_commit_r),
    .io_dec_lsu_valid_raw_d(stbuf_io_dec_lsu_valid_raw_d),
    .io_store_data_hi_r(stbuf_io_store_data_hi_r),
    .io_store_data_lo_r(stbuf_io_store_data_lo_r),
    .io_store_datafn_hi_r(stbuf_io_store_datafn_hi_r),
    .io_store_datafn_lo_r(stbuf_io_store_datafn_lo_r),
    .io_lsu_stbuf_commit_any(stbuf_io_lsu_stbuf_commit_any),
    .io_lsu_addr_d(stbuf_io_lsu_addr_d),
    .io_lsu_addr_m(stbuf_io_lsu_addr_m),
    .io_lsu_addr_r(stbuf_io_lsu_addr_r),
    .io_end_addr_d(stbuf_io_end_addr_d),
    .io_end_addr_m(stbuf_io_end_addr_m),
    .io_end_addr_r(stbuf_io_end_addr_r),
    .io_addr_in_dccm_m(stbuf_io_addr_in_dccm_m),
    .io_addr_in_dccm_r(stbuf_io_addr_in_dccm_r),
    .io_scan_mode(stbuf_io_scan_mode),
    .io_stbuf_reqvld_any(stbuf_io_stbuf_reqvld_any),
    .io_stbuf_reqvld_flushed_any(stbuf_io_stbuf_reqvld_flushed_any),
    .io_stbuf_addr_any(stbuf_io_stbuf_addr_any),
    .io_stbuf_data_any(stbuf_io_stbuf_data_any),
    .io_lsu_stbuf_full_any(stbuf_io_lsu_stbuf_full_any),
    .io_lsu_stbuf_empty_any(stbuf_io_lsu_stbuf_empty_any),
    .io_ldst_stbuf_reqvld_r(stbuf_io_ldst_stbuf_reqvld_r),
    .io_stbuf_fwddata_hi_m(stbuf_io_stbuf_fwddata_hi_m),
    .io_stbuf_fwddata_lo_m(stbuf_io_stbuf_fwddata_lo_m),
    .io_stbuf_fwdbyteen_hi_m(stbuf_io_stbuf_fwdbyteen_hi_m),
    .io_stbuf_fwdbyteen_lo_m(stbuf_io_stbuf_fwdbyteen_lo_m)
  );
  lsu_ecc ecc ( // @[lsu.scala 65:30]
    .clock(ecc_clock),
    .reset(ecc_reset),
    .io_lsu_c2_r_clk(ecc_io_lsu_c2_r_clk),
    .io_lsu_pkt_m_valid(ecc_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_load(ecc_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_m_bits_store(ecc_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_m_bits_dma(ecc_io_lsu_pkt_m_bits_dma),
    .io_stbuf_data_any(ecc_io_stbuf_data_any),
    .io_dec_tlu_core_ecc_disable(ecc_io_dec_tlu_core_ecc_disable),
    .io_lsu_addr_m(ecc_io_lsu_addr_m),
    .io_end_addr_m(ecc_io_end_addr_m),
    .io_dccm_rdata_hi_m(ecc_io_dccm_rdata_hi_m),
    .io_dccm_rdata_lo_m(ecc_io_dccm_rdata_lo_m),
    .io_dccm_data_ecc_hi_m(ecc_io_dccm_data_ecc_hi_m),
    .io_dccm_data_ecc_lo_m(ecc_io_dccm_data_ecc_lo_m),
    .io_ld_single_ecc_error_r(ecc_io_ld_single_ecc_error_r),
    .io_ld_single_ecc_error_r_ff(ecc_io_ld_single_ecc_error_r_ff),
    .io_lsu_dccm_rden_m(ecc_io_lsu_dccm_rden_m),
    .io_addr_in_dccm_m(ecc_io_addr_in_dccm_m),
    .io_dma_dccm_wen(ecc_io_dma_dccm_wen),
    .io_dma_dccm_wdata_lo(ecc_io_dma_dccm_wdata_lo),
    .io_dma_dccm_wdata_hi(ecc_io_dma_dccm_wdata_hi),
    .io_scan_mode(ecc_io_scan_mode),
    .io_sec_data_hi_r(ecc_io_sec_data_hi_r),
    .io_sec_data_lo_r(ecc_io_sec_data_lo_r),
    .io_sec_data_hi_m(ecc_io_sec_data_hi_m),
    .io_sec_data_lo_m(ecc_io_sec_data_lo_m),
    .io_sec_data_hi_r_ff(ecc_io_sec_data_hi_r_ff),
    .io_sec_data_lo_r_ff(ecc_io_sec_data_lo_r_ff),
    .io_dma_dccm_wdata_ecc_hi(ecc_io_dma_dccm_wdata_ecc_hi),
    .io_dma_dccm_wdata_ecc_lo(ecc_io_dma_dccm_wdata_ecc_lo),
    .io_stbuf_ecc_any(ecc_io_stbuf_ecc_any),
    .io_sec_data_ecc_hi_r_ff(ecc_io_sec_data_ecc_hi_r_ff),
    .io_sec_data_ecc_lo_r_ff(ecc_io_sec_data_ecc_lo_r_ff),
    .io_single_ecc_error_hi_r(ecc_io_single_ecc_error_hi_r),
    .io_single_ecc_error_lo_r(ecc_io_single_ecc_error_lo_r),
    .io_lsu_single_ecc_error_r(ecc_io_lsu_single_ecc_error_r),
    .io_lsu_double_ecc_error_r(ecc_io_lsu_double_ecc_error_r),
    .io_lsu_single_ecc_error_m(ecc_io_lsu_single_ecc_error_m),
    .io_lsu_double_ecc_error_m(ecc_io_lsu_double_ecc_error_m)
  );
  lsu_trigger trigger ( // @[lsu.scala 66:30]
    .io_trigger_pkt_any_0_select(trigger_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_pkt(trigger_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_store(trigger_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(trigger_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_tdata2(trigger_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(trigger_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(trigger_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_store(trigger_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(trigger_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_tdata2(trigger_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(trigger_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(trigger_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_store(trigger_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(trigger_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_tdata2(trigger_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(trigger_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(trigger_io_trigger_pkt_any_3_match_pkt),
    .io_trigger_pkt_any_3_store(trigger_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(trigger_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_tdata2(trigger_io_trigger_pkt_any_3_tdata2),
    .io_lsu_pkt_m_valid(trigger_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_half(trigger_io_lsu_pkt_m_bits_half),
    .io_lsu_pkt_m_bits_word(trigger_io_lsu_pkt_m_bits_word),
    .io_lsu_pkt_m_bits_load(trigger_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_m_bits_store(trigger_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_m_bits_dma(trigger_io_lsu_pkt_m_bits_dma),
    .io_lsu_addr_m(trigger_io_lsu_addr_m),
    .io_store_data_m(trigger_io_store_data_m),
    .io_lsu_trigger_match_m(trigger_io_lsu_trigger_match_m)
  );
  lsu_clkdomain clkdomain ( // @[lsu.scala 67:30]
    .clock(clkdomain_clock),
    .reset(clkdomain_reset),
    .io_free_clk(clkdomain_io_free_clk),
    .io_clk_override(clkdomain_io_clk_override),
    .io_dma_dccm_req(clkdomain_io_dma_dccm_req),
    .io_ldst_stbuf_reqvld_r(clkdomain_io_ldst_stbuf_reqvld_r),
    .io_stbuf_reqvld_any(clkdomain_io_stbuf_reqvld_any),
    .io_stbuf_reqvld_flushed_any(clkdomain_io_stbuf_reqvld_flushed_any),
    .io_lsu_busreq_r(clkdomain_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(clkdomain_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_empty_any(clkdomain_io_lsu_bus_buffer_empty_any),
    .io_lsu_stbuf_empty_any(clkdomain_io_lsu_stbuf_empty_any),
    .io_lsu_bus_clk_en(clkdomain_io_lsu_bus_clk_en),
    .io_lsu_p_valid(clkdomain_io_lsu_p_valid),
    .io_lsu_pkt_d_valid(clkdomain_io_lsu_pkt_d_valid),
    .io_lsu_pkt_d_bits_store(clkdomain_io_lsu_pkt_d_bits_store),
    .io_lsu_pkt_m_valid(clkdomain_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_store(clkdomain_io_lsu_pkt_m_bits_store),
    .io_lsu_pkt_r_valid(clkdomain_io_lsu_pkt_r_valid),
    .io_lsu_c1_m_clk(clkdomain_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(clkdomain_io_lsu_c1_r_clk),
    .io_lsu_c2_m_clk(clkdomain_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(clkdomain_io_lsu_c2_r_clk),
    .io_lsu_store_c1_m_clk(clkdomain_io_lsu_store_c1_m_clk),
    .io_lsu_store_c1_r_clk(clkdomain_io_lsu_store_c1_r_clk),
    .io_lsu_stbuf_c1_clk(clkdomain_io_lsu_stbuf_c1_clk),
    .io_lsu_bus_obuf_c1_clk(clkdomain_io_lsu_bus_obuf_c1_clk),
    .io_lsu_bus_ibuf_c1_clk(clkdomain_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(clkdomain_io_lsu_bus_buf_c1_clk),
    .io_lsu_busm_clk(clkdomain_io_lsu_busm_clk),
    .io_lsu_free_c2_clk(clkdomain_io_lsu_free_c2_clk),
    .io_scan_mode(clkdomain_io_scan_mode)
  );
  lsu_bus_intf bus_intf ( // @[lsu.scala 68:30]
    .clock(bus_intf_clock),
    .reset(bus_intf_reset),
    .io_scan_mode(bus_intf_io_scan_mode),
    .io_tlu_busbuff_lsu_pmu_bus_trxn(bus_intf_io_tlu_busbuff_lsu_pmu_bus_trxn),
    .io_tlu_busbuff_lsu_pmu_bus_misaligned(bus_intf_io_tlu_busbuff_lsu_pmu_bus_misaligned),
    .io_tlu_busbuff_lsu_pmu_bus_error(bus_intf_io_tlu_busbuff_lsu_pmu_bus_error),
    .io_tlu_busbuff_lsu_pmu_bus_busy(bus_intf_io_tlu_busbuff_lsu_pmu_bus_busy),
    .io_tlu_busbuff_dec_tlu_external_ldfwd_disable(bus_intf_io_tlu_busbuff_dec_tlu_external_ldfwd_disable),
    .io_tlu_busbuff_dec_tlu_wb_coalescing_disable(bus_intf_io_tlu_busbuff_dec_tlu_wb_coalescing_disable),
    .io_tlu_busbuff_dec_tlu_sideeffect_posted_disable(bus_intf_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable),
    .io_tlu_busbuff_lsu_imprecise_error_load_any(bus_intf_io_tlu_busbuff_lsu_imprecise_error_load_any),
    .io_tlu_busbuff_lsu_imprecise_error_store_any(bus_intf_io_tlu_busbuff_lsu_imprecise_error_store_any),
    .io_tlu_busbuff_lsu_imprecise_error_addr_any(bus_intf_io_tlu_busbuff_lsu_imprecise_error_addr_any),
    .io_lsu_c1_m_clk(bus_intf_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(bus_intf_io_lsu_c1_r_clk),
    .io_lsu_c2_r_clk(bus_intf_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_intf_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_obuf_c1_clk(bus_intf_io_lsu_bus_obuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_intf_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_intf_io_lsu_free_c2_clk),
    .io_free_clk(bus_intf_io_free_clk),
    .io_lsu_busm_clk(bus_intf_io_lsu_busm_clk),
    .io_axi_aw_ready(bus_intf_io_axi_aw_ready),
    .io_axi_aw_valid(bus_intf_io_axi_aw_valid),
    .io_axi_aw_bits_id(bus_intf_io_axi_aw_bits_id),
    .io_axi_aw_bits_addr(bus_intf_io_axi_aw_bits_addr),
    .io_axi_aw_bits_region(bus_intf_io_axi_aw_bits_region),
    .io_axi_aw_bits_size(bus_intf_io_axi_aw_bits_size),
    .io_axi_aw_bits_cache(bus_intf_io_axi_aw_bits_cache),
    .io_axi_w_ready(bus_intf_io_axi_w_ready),
    .io_axi_w_valid(bus_intf_io_axi_w_valid),
    .io_axi_w_bits_data(bus_intf_io_axi_w_bits_data),
    .io_axi_w_bits_strb(bus_intf_io_axi_w_bits_strb),
    .io_axi_b_valid(bus_intf_io_axi_b_valid),
    .io_axi_b_bits_resp(bus_intf_io_axi_b_bits_resp),
    .io_axi_b_bits_id(bus_intf_io_axi_b_bits_id),
    .io_axi_ar_ready(bus_intf_io_axi_ar_ready),
    .io_axi_ar_valid(bus_intf_io_axi_ar_valid),
    .io_axi_ar_bits_id(bus_intf_io_axi_ar_bits_id),
    .io_axi_ar_bits_addr(bus_intf_io_axi_ar_bits_addr),
    .io_axi_ar_bits_region(bus_intf_io_axi_ar_bits_region),
    .io_axi_ar_bits_size(bus_intf_io_axi_ar_bits_size),
    .io_axi_ar_bits_cache(bus_intf_io_axi_ar_bits_cache),
    .io_axi_r_valid(bus_intf_io_axi_r_valid),
    .io_axi_r_bits_id(bus_intf_io_axi_r_bits_id),
    .io_axi_r_bits_data(bus_intf_io_axi_r_bits_data),
    .io_axi_r_bits_resp(bus_intf_io_axi_r_bits_resp),
    .io_dec_lsu_valid_raw_d(bus_intf_io_dec_lsu_valid_raw_d),
    .io_lsu_busreq_m(bus_intf_io_lsu_busreq_m),
    .io_lsu_pkt_m_valid(bus_intf_io_lsu_pkt_m_valid),
    .io_lsu_pkt_m_bits_by(bus_intf_io_lsu_pkt_m_bits_by),
    .io_lsu_pkt_m_bits_half(bus_intf_io_lsu_pkt_m_bits_half),
    .io_lsu_pkt_m_bits_word(bus_intf_io_lsu_pkt_m_bits_word),
    .io_lsu_pkt_m_bits_load(bus_intf_io_lsu_pkt_m_bits_load),
    .io_lsu_pkt_r_valid(bus_intf_io_lsu_pkt_r_valid),
    .io_lsu_pkt_r_bits_by(bus_intf_io_lsu_pkt_r_bits_by),
    .io_lsu_pkt_r_bits_half(bus_intf_io_lsu_pkt_r_bits_half),
    .io_lsu_pkt_r_bits_word(bus_intf_io_lsu_pkt_r_bits_word),
    .io_lsu_pkt_r_bits_load(bus_intf_io_lsu_pkt_r_bits_load),
    .io_lsu_pkt_r_bits_store(bus_intf_io_lsu_pkt_r_bits_store),
    .io_lsu_pkt_r_bits_unsign(bus_intf_io_lsu_pkt_r_bits_unsign),
    .io_lsu_addr_d(bus_intf_io_lsu_addr_d),
    .io_lsu_addr_m(bus_intf_io_lsu_addr_m),
    .io_lsu_addr_r(bus_intf_io_lsu_addr_r),
    .io_end_addr_d(bus_intf_io_end_addr_d),
    .io_end_addr_m(bus_intf_io_end_addr_m),
    .io_end_addr_r(bus_intf_io_end_addr_r),
    .io_store_data_r(bus_intf_io_store_data_r),
    .io_dec_tlu_force_halt(bus_intf_io_dec_tlu_force_halt),
    .io_lsu_commit_r(bus_intf_io_lsu_commit_r),
    .io_is_sideeffects_m(bus_intf_io_is_sideeffects_m),
    .io_flush_m_up(bus_intf_io_flush_m_up),
    .io_flush_r(bus_intf_io_flush_r),
    .io_lsu_busreq_r(bus_intf_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(bus_intf_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_full_any(bus_intf_io_lsu_bus_buffer_full_any),
    .io_lsu_bus_buffer_empty_any(bus_intf_io_lsu_bus_buffer_empty_any),
    .io_bus_read_data_m(bus_intf_io_bus_read_data_m),
    .io_dctl_busbuff_lsu_nonblock_load_valid_m(bus_intf_io_dctl_busbuff_lsu_nonblock_load_valid_m),
    .io_dctl_busbuff_lsu_nonblock_load_tag_m(bus_intf_io_dctl_busbuff_lsu_nonblock_load_tag_m),
    .io_dctl_busbuff_lsu_nonblock_load_inv_r(bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_r),
    .io_dctl_busbuff_lsu_nonblock_load_inv_tag_r(bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r),
    .io_dctl_busbuff_lsu_nonblock_load_data_valid(bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_valid),
    .io_dctl_busbuff_lsu_nonblock_load_data_error(bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_error),
    .io_dctl_busbuff_lsu_nonblock_load_data_tag(bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_tag),
    .io_dctl_busbuff_lsu_nonblock_load_data(bus_intf_io_dctl_busbuff_lsu_nonblock_load_data),
    .io_lsu_bus_clk_en(bus_intf_io_lsu_bus_clk_en)
  );
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rvalid; // @[lsu.scala 194:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error = dccm_ctl_io_dma_dccm_ctl_dccm_dma_ecc_error; // @[lsu.scala 194:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rtag; // @[lsu.scala 194:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rdata; // @[lsu.scala 194:27]
  assign io_lsu_dma_dccm_ready = ~_T_8; // @[lsu.scala 82:25]
  assign io_lsu_pic_picm_wren = dccm_ctl_io_lsu_pic_picm_wren; // @[lsu.scala 196:14]
  assign io_lsu_pic_picm_rden = dccm_ctl_io_lsu_pic_picm_rden; // @[lsu.scala 196:14]
  assign io_lsu_pic_picm_mken = dccm_ctl_io_lsu_pic_picm_mken; // @[lsu.scala 196:14]
  assign io_lsu_pic_picm_rdaddr = dccm_ctl_io_lsu_pic_picm_rdaddr; // @[lsu.scala 196:14]
  assign io_lsu_pic_picm_wraddr = dccm_ctl_io_lsu_pic_picm_wraddr; // @[lsu.scala 196:14]
  assign io_lsu_pic_picm_wr_data = dccm_ctl_io_lsu_pic_picm_wr_data; // @[lsu.scala 196:14]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_trxn = bus_intf_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_misaligned = bus_intf_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_error = bus_intf_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_busy = bus_intf_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_load_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_store_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu.scala 286:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_addr_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu.scala 286:26]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_valid_m = bus_intf_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_tag_m = bus_intf_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_r = bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_tag_r = bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_valid = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_error = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_tag = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu.scala 313:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu.scala 313:27]
  assign io_dccm_wren = dccm_ctl_io_dccm_wren; // @[lsu.scala 195:11]
  assign io_dccm_rden = dccm_ctl_io_dccm_rden; // @[lsu.scala 195:11]
  assign io_dccm_wr_addr_lo = dccm_ctl_io_dccm_wr_addr_lo; // @[lsu.scala 195:11]
  assign io_dccm_wr_addr_hi = dccm_ctl_io_dccm_wr_addr_hi; // @[lsu.scala 195:11]
  assign io_dccm_rd_addr_lo = dccm_ctl_io_dccm_rd_addr_lo; // @[lsu.scala 195:11]
  assign io_dccm_rd_addr_hi = dccm_ctl_io_dccm_rd_addr_hi; // @[lsu.scala 195:11]
  assign io_dccm_wr_data_lo = dccm_ctl_io_dccm_wr_data_lo; // @[lsu.scala 195:11]
  assign io_dccm_wr_data_hi = dccm_ctl_io_dccm_wr_data_hi; // @[lsu.scala 195:11]
  assign io_lsu_tlu_lsu_pmu_load_external_m = _T_48 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 105:39]
  assign io_lsu_tlu_lsu_pmu_store_external_m = _T_50 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 106:39]
  assign io_axi_aw_valid = bus_intf_io_axi_aw_valid; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_id = bus_intf_io_axi_aw_bits_id; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_addr = bus_intf_io_axi_aw_bits_addr; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_region = bus_intf_io_axi_aw_bits_region; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_len = 8'h0; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_size = bus_intf_io_axi_aw_bits_size; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_burst = 2'h1; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_lock = 1'h0; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_cache = bus_intf_io_axi_aw_bits_cache; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_prot = 3'h0; // @[lsu.scala 314:49]
  assign io_axi_aw_bits_qos = 4'h0; // @[lsu.scala 314:49]
  assign io_axi_w_valid = bus_intf_io_axi_w_valid; // @[lsu.scala 314:49]
  assign io_axi_w_bits_data = bus_intf_io_axi_w_bits_data; // @[lsu.scala 314:49]
  assign io_axi_w_bits_strb = bus_intf_io_axi_w_bits_strb; // @[lsu.scala 314:49]
  assign io_axi_w_bits_last = 1'h1; // @[lsu.scala 314:49]
  assign io_axi_b_ready = 1'h1; // @[lsu.scala 314:49]
  assign io_axi_ar_valid = bus_intf_io_axi_ar_valid; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_id = bus_intf_io_axi_ar_bits_id; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_addr = bus_intf_io_axi_ar_bits_addr; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_region = bus_intf_io_axi_ar_bits_region; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_len = 8'h0; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_size = bus_intf_io_axi_ar_bits_size; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_burst = 2'h1; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_lock = 1'h0; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_cache = bus_intf_io_axi_ar_bits_cache; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_prot = 3'h0; // @[lsu.scala 314:49]
  assign io_axi_ar_bits_qos = 4'h0; // @[lsu.scala 314:49]
  assign io_axi_r_ready = 1'h1; // @[lsu.scala 314:49]
  assign io_lsu_result_m = lsu_lsc_ctl_io_lsu_result_m; // @[lsu.scala 61:19]
  assign io_lsu_result_corr_r = lsu_lsc_ctl_io_lsu_result_corr_r; // @[lsu.scala 62:24]
  assign io_lsu_load_stall_any = bus_intf_io_lsu_bus_buffer_full_any | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 75:25]
  assign io_lsu_store_stall_any = _T | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 74:26]
  assign io_lsu_fastint_stall_any = dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 76:28]
  assign io_lsu_idle_any = _T_22 & bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 96:19]
  assign io_lsu_fir_addr = lsu_lsc_ctl_io_lsu_fir_addr; // @[lsu.scala 137:49]
  assign io_lsu_fir_error = lsu_lsc_ctl_io_lsu_fir_error; // @[lsu.scala 138:49]
  assign io_lsu_single_ecc_error_incr = lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[lsu.scala 135:49]
  assign io_lsu_error_pkt_r_valid = lsu_lsc_ctl_io_lsu_error_pkt_r_valid; // @[lsu.scala 136:49]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_single_ecc_error; // @[lsu.scala 136:49]
  assign io_lsu_error_pkt_r_bits_inst_type = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_inst_type; // @[lsu.scala 136:49]
  assign io_lsu_error_pkt_r_bits_exc_type = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_exc_type; // @[lsu.scala 136:49]
  assign io_lsu_error_pkt_r_bits_mscause = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_mscause; // @[lsu.scala 136:49]
  assign io_lsu_error_pkt_r_bits_addr = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_addr; // @[lsu.scala 136:49]
  assign io_lsu_pmu_misaligned_m = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_46; // @[lsu.scala 104:27]
  assign io_lsu_trigger_match_m = trigger_io_lsu_trigger_match_m; // @[lsu.scala 261:50]
  assign lsu_lsc_ctl_reset = reset;
  assign lsu_lsc_ctl_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 110:46]
  assign lsu_lsc_ctl_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 111:46]
  assign lsu_lsc_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 112:46]
  assign lsu_lsc_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 113:46]
  assign lsu_lsc_ctl_io_lsu_store_c1_m_clk = clkdomain_io_lsu_store_c1_m_clk; // @[lsu.scala 114:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_corr_r = dccm_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 116:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_r = ecc_io_lsu_single_ecc_error_r; // @[lsu.scala 117:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 118:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_m = dccm_ctl_io_lsu_ld_data_m; // @[lsu.scala 119:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_m = ecc_io_lsu_single_ecc_error_m; // @[lsu.scala 120:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 121:46]
  assign lsu_lsc_ctl_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[lsu.scala 122:46]
  assign lsu_lsc_ctl_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 123:46]
  assign lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs1_d = io_lsu_exu_exu_lsu_rs1_d; // @[lsu.scala 124:46]
  assign lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs2_d = io_lsu_exu_exu_lsu_rs2_d; // @[lsu.scala 124:46]
  assign lsu_lsc_ctl_io_lsu_p_valid = io_lsu_p_valid; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_fast_int = io_lsu_p_bits_fast_int; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_by = io_lsu_p_bits_by; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_half = io_lsu_p_bits_half; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_word = io_lsu_p_bits_word; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_dword = io_lsu_p_bits_dword; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_load = io_lsu_p_bits_load; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store = io_lsu_p_bits_store; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_unsign = io_lsu_p_bits_unsign; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_dma = io_lsu_p_bits_dma; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_d = io_lsu_p_bits_store_data_bypass_d; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_load_ldst_bypass_d = io_lsu_p_bits_load_ldst_bypass_d; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_m = io_lsu_p_bits_store_data_bypass_m; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 126:46]
  assign lsu_lsc_ctl_io_dec_lsu_offset_d = io_dec_lsu_offset_d; // @[lsu.scala 127:46]
  assign lsu_lsc_ctl_io_picm_mask_data_m = dccm_ctl_io_picm_mask_data_m; // @[lsu.scala 128:46]
  assign lsu_lsc_ctl_io_bus_read_data_m = bus_intf_io_bus_read_data_m; // @[lsu.scala 129:46]
  assign lsu_lsc_ctl_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[lsu.scala 131:46]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_dccm_req = io_lsu_dma_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 130:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_addr = io_lsu_dma_dma_lsc_ctl_dma_mem_addr; // @[lsu.scala 130:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_sz = io_lsu_dma_dma_lsc_ctl_dma_mem_sz; // @[lsu.scala 130:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_write = io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 130:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata; // @[lsu.scala 130:38]
  assign dccm_ctl_clock = clock;
  assign dccm_ctl_reset = reset;
  assign dccm_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 141:46]
  assign dccm_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 142:46]
  assign dccm_ctl_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 143:46]
  assign dccm_ctl_io_lsu_store_c1_r_clk = clkdomain_io_lsu_store_c1_r_clk; // @[lsu.scala 145:46]
  assign dccm_ctl_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_word = lsu_lsc_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_dword = lsu_lsc_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_load = lsu_lsc_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_store = lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_dma = lsu_lsc_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 146:46]
  assign dccm_ctl_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_by = lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 147:46]
  assign dccm_ctl_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_load = lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 148:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_dma = lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 148:46]
  assign dccm_ctl_io_addr_in_dccm_d = lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 149:46]
  assign dccm_ctl_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 150:46]
  assign dccm_ctl_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 151:46]
  assign dccm_ctl_io_addr_in_pic_d = lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 152:46]
  assign dccm_ctl_io_addr_in_pic_m = lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 153:46]
  assign dccm_ctl_io_addr_in_pic_r = lsu_lsc_ctl_io_addr_in_pic_r; // @[lsu.scala 154:46]
  assign dccm_ctl_io_lsu_raw_fwd_lo_r = lsu_raw_fwd_lo_r; // @[lsu.scala 155:46]
  assign dccm_ctl_io_lsu_raw_fwd_hi_r = lsu_raw_fwd_hi_r; // @[lsu.scala 156:46]
  assign dccm_ctl_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 157:46]
  assign dccm_ctl_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d; // @[lsu.scala 158:46]
  assign dccm_ctl_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[lsu.scala 159:46]
  assign dccm_ctl_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 160:46]
  assign dccm_ctl_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[lsu.scala 161:46]
  assign dccm_ctl_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[lsu.scala 162:46]
  assign dccm_ctl_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r[15:0]; // @[lsu.scala 163:46]
  assign dccm_ctl_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[lsu.scala 164:46]
  assign dccm_ctl_io_stbuf_addr_any = stbuf_io_stbuf_addr_any; // @[lsu.scala 165:46]
  assign dccm_ctl_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[lsu.scala 166:46]
  assign dccm_ctl_io_stbuf_ecc_any = ecc_io_stbuf_ecc_any; // @[lsu.scala 167:46]
  assign dccm_ctl_io_stbuf_fwddata_hi_m = stbuf_io_stbuf_fwddata_hi_m; // @[lsu.scala 168:46]
  assign dccm_ctl_io_stbuf_fwddata_lo_m = stbuf_io_stbuf_fwddata_lo_m; // @[lsu.scala 169:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_lo_m = stbuf_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 170:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_hi_m = stbuf_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 171:46]
  assign dccm_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 172:46]
  assign dccm_ctl_io_single_ecc_error_hi_r = ecc_io_single_ecc_error_hi_r; // @[lsu.scala 173:46]
  assign dccm_ctl_io_single_ecc_error_lo_r = ecc_io_single_ecc_error_lo_r; // @[lsu.scala 174:46]
  assign dccm_ctl_io_sec_data_hi_r_ff = ecc_io_sec_data_hi_r_ff; // @[lsu.scala 177:46]
  assign dccm_ctl_io_sec_data_lo_r_ff = ecc_io_sec_data_lo_r_ff; // @[lsu.scala 178:46]
  assign dccm_ctl_io_sec_data_ecc_hi_r_ff = ecc_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 179:46]
  assign dccm_ctl_io_sec_data_ecc_lo_r_ff = ecc_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 180:46]
  assign dccm_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 181:46]
  assign dccm_ctl_io_sec_data_hi_m = ecc_io_sec_data_hi_m; // @[lsu.scala 182:46]
  assign dccm_ctl_io_sec_data_lo_m = ecc_io_sec_data_lo_m; // @[lsu.scala 183:46]
  assign dccm_ctl_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 184:46]
  assign dccm_ctl_io_dma_dccm_wen = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 185:46]
  assign dccm_ctl_io_dma_pic_wen = _T_10 & lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 186:46]
  assign dccm_ctl_io_dma_mem_tag_m = dma_mem_tag_m; // @[lsu.scala 187:46]
  assign dccm_ctl_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[lsu.scala 188:46]
  assign dccm_ctl_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[lsu.scala 189:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_hi = ecc_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 190:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_lo = ecc_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 191:46]
  assign dccm_ctl_io_dma_dccm_ctl_dma_mem_addr = io_lsu_dma_dma_dccm_ctl_dma_mem_addr; // @[lsu.scala 194:27]
  assign dccm_ctl_io_dma_dccm_ctl_dma_mem_wdata = io_lsu_dma_dma_dccm_ctl_dma_mem_wdata; // @[lsu.scala 194:27]
  assign dccm_ctl_io_dccm_rd_data_lo = io_dccm_rd_data_lo; // @[lsu.scala 195:11]
  assign dccm_ctl_io_dccm_rd_data_hi = io_dccm_rd_data_hi; // @[lsu.scala 195:11]
  assign dccm_ctl_io_lsu_pic_picm_rd_data = io_lsu_pic_picm_rd_data; // @[lsu.scala 196:14]
  assign dccm_ctl_io_scan_mode = io_scan_mode; // @[lsu.scala 192:46]
  assign stbuf_clock = clock;
  assign stbuf_reset = reset;
  assign stbuf_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 199:49]
  assign stbuf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 200:48]
  assign stbuf_io_lsu_stbuf_c1_clk = clkdomain_io_lsu_stbuf_c1_clk; // @[lsu.scala 201:54]
  assign stbuf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 202:54]
  assign stbuf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 203:48]
  assign stbuf_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 203:48]
  assign stbuf_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 203:48]
  assign stbuf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_dword = lsu_lsc_ctl_io_lsu_pkt_r_bits_dword; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 204:48]
  assign stbuf_io_lsu_pkt_r_bits_dma = lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 204:48]
  assign stbuf_io_store_stbuf_reqvld_r = _T_28 & _T_19; // @[lsu.scala 205:48]
  assign stbuf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 206:49]
  assign stbuf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 207:49]
  assign stbuf_io_store_data_hi_r = dccm_ctl_io_store_data_hi_r; // @[lsu.scala 208:62]
  assign stbuf_io_store_data_lo_r = dccm_ctl_io_store_data_lo_r; // @[lsu.scala 209:62]
  assign stbuf_io_store_datafn_hi_r = dccm_ctl_io_store_datafn_hi_r; // @[lsu.scala 210:49]
  assign stbuf_io_store_datafn_lo_r = dccm_ctl_io_store_datafn_lo_r; // @[lsu.scala 211:56]
  assign stbuf_io_lsu_stbuf_commit_any = dccm_ctl_io_lsu_stbuf_commit_any; // @[lsu.scala 212:52]
  assign stbuf_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d[15:0]; // @[lsu.scala 213:64]
  assign stbuf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 214:64]
  assign stbuf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 215:64]
  assign stbuf_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[lsu.scala 216:64]
  assign stbuf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 217:64]
  assign stbuf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 218:64]
  assign stbuf_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 219:49]
  assign stbuf_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 220:56]
  assign stbuf_io_scan_mode = io_scan_mode; // @[lsu.scala 222:49]
  assign ecc_clock = clock;
  assign ecc_reset = reset;
  assign ecc_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 226:52]
  assign ecc_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 227:52]
  assign ecc_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 227:52]
  assign ecc_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 227:52]
  assign ecc_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 227:52]
  assign ecc_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[lsu.scala 229:54]
  assign ecc_io_dec_tlu_core_ecc_disable = io_dec_tlu_core_ecc_disable; // @[lsu.scala 230:50]
  assign ecc_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[lsu.scala 235:58]
  assign ecc_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[lsu.scala 236:58]
  assign ecc_io_dccm_rdata_hi_m = dccm_ctl_io_dccm_rdata_hi_m; // @[lsu.scala 239:54]
  assign ecc_io_dccm_rdata_lo_m = dccm_ctl_io_dccm_rdata_lo_m; // @[lsu.scala 240:54]
  assign ecc_io_dccm_data_ecc_hi_m = dccm_ctl_io_dccm_data_ecc_hi_m; // @[lsu.scala 243:50]
  assign ecc_io_dccm_data_ecc_lo_m = dccm_ctl_io_dccm_data_ecc_lo_m; // @[lsu.scala 244:50]
  assign ecc_io_ld_single_ecc_error_r = dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 245:50]
  assign ecc_io_ld_single_ecc_error_r_ff = dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 246:50]
  assign ecc_io_lsu_dccm_rden_m = dccm_ctl_io_lsu_dccm_rden_m; // @[lsu.scala 247:50]
  assign ecc_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 248:50]
  assign ecc_io_dma_dccm_wen = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 249:50]
  assign ecc_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[lsu.scala 250:50]
  assign ecc_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[lsu.scala 251:50]
  assign ecc_io_scan_mode = io_scan_mode; // @[lsu.scala 252:50]
  assign trigger_io_trigger_pkt_any_0_select = io_trigger_pkt_any_0_select; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_0_match_pkt = io_trigger_pkt_any_0_match_pkt; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_0_store = io_trigger_pkt_any_0_store; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_0_load = io_trigger_pkt_any_0_load; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_0_tdata2 = io_trigger_pkt_any_0_tdata2; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_1_select = io_trigger_pkt_any_1_select; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_1_match_pkt = io_trigger_pkt_any_1_match_pkt; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_1_store = io_trigger_pkt_any_1_store; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_1_load = io_trigger_pkt_any_1_load; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_1_tdata2 = io_trigger_pkt_any_1_tdata2; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_2_select = io_trigger_pkt_any_2_select; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_2_match_pkt = io_trigger_pkt_any_2_match_pkt; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_2_store = io_trigger_pkt_any_2_store; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_2_load = io_trigger_pkt_any_2_load; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_2_tdata2 = io_trigger_pkt_any_2_tdata2; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_3_select = io_trigger_pkt_any_3_select; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_3_match_pkt = io_trigger_pkt_any_3_match_pkt; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_3_store = io_trigger_pkt_any_3_store; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_3_load = io_trigger_pkt_any_3_load; // @[lsu.scala 256:50]
  assign trigger_io_trigger_pkt_any_3_tdata2 = io_trigger_pkt_any_3_tdata2; // @[lsu.scala 256:50]
  assign trigger_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 257:50]
  assign trigger_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 257:50]
  assign trigger_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 257:50]
  assign trigger_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 257:50]
  assign trigger_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 257:50]
  assign trigger_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 257:50]
  assign trigger_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 258:50]
  assign trigger_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 259:50]
  assign clkdomain_clock = clock;
  assign clkdomain_reset = reset;
  assign clkdomain_io_free_clk = io_free_clk; // @[lsu.scala 265:50]
  assign clkdomain_io_clk_override = io_clk_override; // @[lsu.scala 266:50]
  assign clkdomain_io_dma_dccm_req = io_lsu_dma_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 268:50]
  assign clkdomain_io_ldst_stbuf_reqvld_r = stbuf_io_ldst_stbuf_reqvld_r; // @[lsu.scala 269:50]
  assign clkdomain_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[lsu.scala 270:50]
  assign clkdomain_io_stbuf_reqvld_flushed_any = stbuf_io_stbuf_reqvld_flushed_any; // @[lsu.scala 271:50]
  assign clkdomain_io_lsu_busreq_r = bus_intf_io_lsu_busreq_r; // @[lsu.scala 272:50]
  assign clkdomain_io_lsu_bus_buffer_pend_any = bus_intf_io_lsu_bus_buffer_pend_any; // @[lsu.scala 273:50]
  assign clkdomain_io_lsu_bus_buffer_empty_any = bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 274:50]
  assign clkdomain_io_lsu_stbuf_empty_any = stbuf_io_lsu_stbuf_empty_any; // @[lsu.scala 275:50]
  assign clkdomain_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[lsu.scala 276:50]
  assign clkdomain_io_lsu_p_valid = io_lsu_p_valid; // @[lsu.scala 277:50]
  assign clkdomain_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 278:50]
  assign clkdomain_io_lsu_pkt_d_bits_store = lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 278:50]
  assign clkdomain_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 279:50]
  assign clkdomain_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 279:50]
  assign clkdomain_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 280:50]
  assign clkdomain_io_scan_mode = io_scan_mode; // @[lsu.scala 281:50]
  assign bus_intf_clock = clock;
  assign bus_intf_reset = reset;
  assign bus_intf_io_scan_mode = io_scan_mode; // @[lsu.scala 285:49]
  assign bus_intf_io_tlu_busbuff_dec_tlu_external_ldfwd_disable = io_lsu_dec_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu.scala 286:26]
  assign bus_intf_io_tlu_busbuff_dec_tlu_wb_coalescing_disable = io_lsu_dec_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu.scala 286:26]
  assign bus_intf_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = io_lsu_dec_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu.scala 286:26]
  assign bus_intf_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 287:49]
  assign bus_intf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 288:49]
  assign bus_intf_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 289:49]
  assign bus_intf_io_lsu_bus_ibuf_c1_clk = clkdomain_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 290:49]
  assign bus_intf_io_lsu_bus_obuf_c1_clk = clkdomain_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 291:49]
  assign bus_intf_io_lsu_bus_buf_c1_clk = clkdomain_io_lsu_bus_buf_c1_clk; // @[lsu.scala 292:49]
  assign bus_intf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 293:49]
  assign bus_intf_io_free_clk = io_free_clk; // @[lsu.scala 294:49]
  assign bus_intf_io_lsu_busm_clk = clkdomain_io_lsu_busm_clk; // @[lsu.scala 295:49]
  assign bus_intf_io_axi_aw_ready = io_axi_aw_ready; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_w_ready = io_axi_w_ready; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_b_valid = io_axi_b_valid; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_b_bits_resp = io_axi_b_bits_resp; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_b_bits_id = io_axi_b_bits_id; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_ar_ready = io_axi_ar_ready; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_r_valid = io_axi_r_valid; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_r_bits_id = io_axi_r_bits_id; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_r_bits_data = io_axi_r_bits_data; // @[lsu.scala 314:49]
  assign bus_intf_io_axi_r_bits_resp = io_axi_r_bits_resp; // @[lsu.scala 314:49]
  assign bus_intf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 296:49]
  assign bus_intf_io_lsu_busreq_m = _T_39 & _T_40; // @[lsu.scala 297:49]
  assign bus_intf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 305:49]
  assign bus_intf_io_lsu_pkt_m_bits_by = lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 305:49]
  assign bus_intf_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 305:49]
  assign bus_intf_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 305:49]
  assign bus_intf_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 305:49]
  assign bus_intf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_load = lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_pkt_r_bits_unsign = lsu_lsc_ctl_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 306:49]
  assign bus_intf_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d; // @[lsu.scala 298:49]
  assign bus_intf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 299:49]
  assign bus_intf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 300:49]
  assign bus_intf_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d; // @[lsu.scala 301:49]
  assign bus_intf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 302:49]
  assign bus_intf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 303:49]
  assign bus_intf_io_store_data_r = dccm_ctl_io_store_data_r; // @[lsu.scala 304:49]
  assign bus_intf_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[lsu.scala 307:49]
  assign bus_intf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 308:49]
  assign bus_intf_io_is_sideeffects_m = lsu_lsc_ctl_io_is_sideeffects_m; // @[lsu.scala 309:49]
  assign bus_intf_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[lsu.scala 310:49]
  assign bus_intf_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 311:49]
  assign bus_intf_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[lsu.scala 315:49]
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
  dma_mem_tag_m = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_raw_fwd_hi_r = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_raw_fwd_lo_r = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    dma_mem_tag_m = 3'h0;
  end
  if (reset) begin
    lsu_raw_fwd_hi_r = 1'h0;
  end
  if (reset) begin
    lsu_raw_fwd_lo_r = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clkdomain_io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      dma_mem_tag_m <= 3'h0;
    end else begin
      dma_mem_tag_m <= io_lsu_dma_dma_mem_tag;
    end
  end
  always @(posedge clkdomain_io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_raw_fwd_hi_r <= 1'h0;
    end else begin
      lsu_raw_fwd_hi_r <= |stbuf_io_stbuf_fwdbyteen_hi_m;
    end
  end
  always @(posedge clkdomain_io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_raw_fwd_lo_r <= 1'h0;
    end else begin
      lsu_raw_fwd_lo_r <= |stbuf_io_stbuf_fwdbyteen_lo_m;
    end
  end
endmodule
