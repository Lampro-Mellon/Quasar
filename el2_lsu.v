module el2_lsu_addrcheck(
  input         reset,
  input         io_lsu_c2_m_clk,
  input  [31:0] io_start_addr_d,
  input  [31:0] io_end_addr_d,
  input         io_lsu_pkt_d_fast_int,
  input         io_lsu_pkt_d_by,
  input         io_lsu_pkt_d_half,
  input         io_lsu_pkt_d_word,
  input         io_lsu_pkt_d_load,
  input         io_lsu_pkt_d_store,
  input         io_lsu_pkt_d_dma,
  input         io_lsu_pkt_d_valid,
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
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[el2_lib.scala 494:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 499:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[el2_lib.scala 494:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 499:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[el2_lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 499:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 499:39]
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
  wire [31:0] _T_50 = io_start_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 67:56]
  wire  _T_52 = _T_50 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 67:80]
  wire [31:0] _T_55 = io_start_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 68:56]
  wire  _T_57 = _T_55 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 68:80]
  wire  _T_59 = _T_52 | _T_57; // @[el2_lsu_addrcheck.scala 67:129]
  wire [31:0] _T_61 = io_start_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 69:56]
  wire  _T_63 = _T_61 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 69:80]
  wire  _T_65 = _T_59 | _T_63; // @[el2_lsu_addrcheck.scala 68:129]
  wire [31:0] _T_67 = io_start_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 70:56]
  wire  _T_69 = _T_67 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 70:80]
  wire  _T_71 = _T_65 | _T_69; // @[el2_lsu_addrcheck.scala 69:129]
  wire [31:0] _T_97 = io_end_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:57]
  wire  _T_99 = _T_97 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:81]
  wire [31:0] _T_102 = io_end_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 77:58]
  wire  _T_104 = _T_102 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 77:82]
  wire  _T_106 = _T_99 | _T_104; // @[el2_lsu_addrcheck.scala 76:130]
  wire [31:0] _T_108 = io_end_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 78:58]
  wire  _T_110 = _T_108 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 78:82]
  wire  _T_112 = _T_106 | _T_110; // @[el2_lsu_addrcheck.scala 77:131]
  wire [31:0] _T_114 = io_end_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 79:58]
  wire  _T_116 = _T_114 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 79:82]
  wire  _T_118 = _T_112 | _T_116; // @[el2_lsu_addrcheck.scala 78:131]
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
module el2_lsu_lsc_ctl(
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
  input  [31:0] io_exu_lsu_rs1_d,
  input  [31:0] io_exu_lsu_rs2_d,
  input         io_lsu_p_fast_int,
  input         io_lsu_p_by,
  input         io_lsu_p_half,
  input         io_lsu_p_word,
  input         io_lsu_p_dword,
  input         io_lsu_p_load,
  input         io_lsu_p_store,
  input         io_lsu_p_unsign,
  input         io_lsu_p_dma,
  input         io_lsu_p_store_data_bypass_d,
  input         io_lsu_p_load_ldst_bypass_d,
  input         io_lsu_p_store_data_bypass_m,
  input         io_lsu_p_valid,
  input         io_dec_lsu_valid_raw_d,
  input  [11:0] io_dec_lsu_offset_d,
  input  [31:0] io_picm_mask_data_m,
  input  [31:0] io_bus_read_data_m,
  output [31:0] io_lsu_result_m,
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
  output        io_lsu_error_pkt_r_exc_valid,
  output        io_lsu_error_pkt_r_single_ecc_error,
  output        io_lsu_error_pkt_r_inst_type,
  output        io_lsu_error_pkt_r_exc_type,
  output        io_lsu_error_pkt_r_mscause,
  output        io_lsu_error_pkt_r_addr,
  output [30:0] io_lsu_fir_addr,
  output [1:0]  io_lsu_fir_error,
  output        io_addr_in_dccm_d,
  output        io_addr_in_dccm_m,
  output        io_addr_in_dccm_r,
  output        io_addr_in_pic_d,
  output        io_addr_in_pic_m,
  output        io_addr_in_pic_r,
  output        io_addr_external_m,
  input         io_dma_dccm_req,
  input  [31:0] io_dma_mem_addr,
  input  [2:0]  io_dma_mem_sz,
  input         io_dma_mem_write,
  input  [63:0] io_dma_mem_wdata,
  output        io_lsu_pkt_d_fast_int,
  output        io_lsu_pkt_d_by,
  output        io_lsu_pkt_d_half,
  output        io_lsu_pkt_d_word,
  output        io_lsu_pkt_d_dword,
  output        io_lsu_pkt_d_load,
  output        io_lsu_pkt_d_store,
  output        io_lsu_pkt_d_unsign,
  output        io_lsu_pkt_d_dma,
  output        io_lsu_pkt_d_store_data_bypass_d,
  output        io_lsu_pkt_d_load_ldst_bypass_d,
  output        io_lsu_pkt_d_store_data_bypass_m,
  output        io_lsu_pkt_d_valid,
  output        io_lsu_pkt_m_fast_int,
  output        io_lsu_pkt_m_by,
  output        io_lsu_pkt_m_half,
  output        io_lsu_pkt_m_word,
  output        io_lsu_pkt_m_dword,
  output        io_lsu_pkt_m_load,
  output        io_lsu_pkt_m_store,
  output        io_lsu_pkt_m_unsign,
  output        io_lsu_pkt_m_dma,
  output        io_lsu_pkt_m_store_data_bypass_m,
  output        io_lsu_pkt_m_valid,
  output        io_lsu_pkt_r_by,
  output        io_lsu_pkt_r_half,
  output        io_lsu_pkt_r_word,
  output        io_lsu_pkt_r_dword,
  output        io_lsu_pkt_r_load,
  output        io_lsu_pkt_r_store,
  output        io_lsu_pkt_r_unsign,
  output        io_lsu_pkt_r_dma,
  output        io_lsu_pkt_r_valid
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
`endif // RANDOMIZE_REG_INIT
  wire  addrcheck_reset; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_c2_m_clk; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [31:0] addrcheck_io_start_addr_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [31:0] addrcheck_io_end_addr_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_fast_int; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_store; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_lsu_pkt_d_valid; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [31:0] addrcheck_io_dec_tlu_mrac_ff; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [3:0] addrcheck_io_rs1_region_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_is_sideeffects_m; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_addr_in_dccm_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_addr_in_pic_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_addr_external_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_access_fault_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_misaligned_fault_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [3:0] addrcheck_io_exc_mscause_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_fir_dccm_access_error_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire  addrcheck_io_fir_nondccm_access_error_d; // @[el2_lsu_lsc_ctl.scala 119:25]
  wire [31:0] lsu_rs1_d = io_dec_lsu_valid_raw_d ? io_exu_lsu_rs1_d : io_dma_mem_addr; // @[el2_lsu_lsc_ctl.scala 101:28]
  wire [11:0] _T_3 = io_dec_lsu_valid_raw_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [11:0] lsu_offset_d = io_dec_lsu_offset_d & _T_3; // @[el2_lsu_lsc_ctl.scala 102:51]
  wire [31:0] rs1_d = io_lsu_pkt_d_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[el2_lsu_lsc_ctl.scala 105:28]
  wire [12:0] _T_6 = {1'h0,rs1_d[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_8 = {1'h0,lsu_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _T_10 = _T_6 + _T_8; // @[el2_lib.scala 230:39]
  wire  _T_13 = lsu_offset_d[11] ^ _T_10[12]; // @[el2_lib.scala 231:46]
  wire  _T_14 = ~_T_13; // @[el2_lib.scala 231:33]
  wire [19:0] _T_16 = _T_14 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_18 = _T_16 & rs1_d[31:12]; // @[el2_lib.scala 231:58]
  wire  _T_20 = ~lsu_offset_d[11]; // @[el2_lib.scala 232:18]
  wire  _T_22 = _T_20 & _T_10[12]; // @[el2_lib.scala 232:30]
  wire [19:0] _T_24 = _T_22 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_27 = rs1_d[31:12] + 20'h1; // @[el2_lib.scala 232:54]
  wire [19:0] _T_28 = _T_24 & _T_27; // @[el2_lib.scala 232:41]
  wire [19:0] _T_29 = _T_18 | _T_28; // @[el2_lib.scala 231:72]
  wire  _T_32 = ~_T_10[12]; // @[el2_lib.scala 233:31]
  wire  _T_33 = lsu_offset_d[11] & _T_32; // @[el2_lib.scala 233:29]
  wire [19:0] _T_35 = _T_33 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_38 = rs1_d[31:12] - 20'h1; // @[el2_lib.scala 233:54]
  wire [19:0] _T_39 = _T_35 & _T_38; // @[el2_lib.scala 233:41]
  wire [19:0] _T_40 = _T_29 | _T_39; // @[el2_lib.scala 232:61]
  wire [2:0] _T_43 = io_lsu_pkt_d_half ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_44 = _T_43 & 3'h1; // @[el2_lsu_lsc_ctl.scala 110:53]
  wire [2:0] _T_46 = io_lsu_pkt_d_word ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_47 = _T_46 & 3'h3; // @[el2_lsu_lsc_ctl.scala 111:35]
  wire [2:0] _T_48 = _T_44 | _T_47; // @[el2_lsu_lsc_ctl.scala 110:65]
  wire [2:0] _T_50 = io_lsu_pkt_d_dword ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] addr_offset_d = _T_48 | _T_50; // @[el2_lsu_lsc_ctl.scala 111:47]
  wire [12:0] _T_54 = {lsu_offset_d[11],lsu_offset_d}; // @[Cat.scala 29:58]
  wire [11:0] _T_57 = {9'h0,addr_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _GEN_0 = {{1'd0}, _T_57}; // @[el2_lsu_lsc_ctl.scala 114:60]
  wire [12:0] end_addr_offset_d = _T_54 + _GEN_0; // @[el2_lsu_lsc_ctl.scala 114:60]
  wire [18:0] _T_62 = end_addr_offset_d[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_64 = {_T_62,end_addr_offset_d}; // @[Cat.scala 29:58]
  reg  access_fault_m; // @[el2_lsu_lsc_ctl.scala 150:75]
  reg  misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 151:75]
  reg [3:0] exc_mscause_m; // @[el2_lsu_lsc_ctl.scala 152:75]
  reg  fir_dccm_access_error_m; // @[el2_lsu_lsc_ctl.scala 153:75]
  reg  fir_nondccm_access_error_m; // @[el2_lsu_lsc_ctl.scala 154:75]
  wire  _T_69 = access_fault_m | misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 156:34]
  wire  _T_70 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_lsc_ctl.scala 157:64]
  wire  _T_71 = io_lsu_single_ecc_error_r & _T_70; // @[el2_lsu_lsc_ctl.scala 157:62]
  wire  _T_72 = io_lsu_commit_r | io_lsu_pkt_r_dma; // @[el2_lsu_lsc_ctl.scala 157:111]
  wire  _T_73 = _T_71 & _T_72; // @[el2_lsu_lsc_ctl.scala 157:92]
  wire  _T_76 = _T_69 | io_lsu_double_ecc_error_m; // @[el2_lsu_lsc_ctl.scala 179:71]
  wire  _T_77 = _T_76 & io_lsu_pkt_m_valid; // @[el2_lsu_lsc_ctl.scala 179:100]
  wire  _T_78 = ~io_lsu_pkt_m_dma; // @[el2_lsu_lsc_ctl.scala 179:123]
  wire  _T_79 = _T_77 & _T_78; // @[el2_lsu_lsc_ctl.scala 179:121]
  wire  _T_80 = ~io_lsu_pkt_m_fast_int; // @[el2_lsu_lsc_ctl.scala 179:143]
  wire  _T_81 = _T_79 & _T_80; // @[el2_lsu_lsc_ctl.scala 179:141]
  wire  _T_82 = ~io_flush_m_up; // @[el2_lsu_lsc_ctl.scala 179:168]
  wire  lsu_error_pkt_m_exc_valid = _T_81 & _T_82; // @[el2_lsu_lsc_ctl.scala 179:166]
  wire  _T_84 = ~lsu_error_pkt_m_exc_valid; // @[el2_lsu_lsc_ctl.scala 180:70]
  wire  _T_85 = io_lsu_single_ecc_error_m & _T_84; // @[el2_lsu_lsc_ctl.scala 180:68]
  wire  lsu_error_pkt_m_exc_type = ~misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 182:41]
  wire  _T_90 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_exc_type; // @[el2_lsu_lsc_ctl.scala 183:73]
  wire  _T_91 = ~access_fault_m; // @[el2_lsu_lsc_ctl.scala 183:97]
  wire  _T_92 = _T_90 & _T_91; // @[el2_lsu_lsc_ctl.scala 183:95]
  wire [3:0] _T_95 = _T_92 ? 4'h1 : exc_mscause_m; // @[el2_lsu_lsc_ctl.scala 183:44]
  wire  _T_99 = io_lsu_pkt_m_fast_int & io_lsu_double_ecc_error_m; // @[el2_lsu_lsc_ctl.scala 185:161]
  reg  _T_105_exc_valid; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_inst_type; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_exc_type; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_mscause; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_addr; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg [1:0] _T_106; // @[el2_lsu_lsc_ctl.scala 187:75]
  wire  dma_pkt_d_load = ~io_dma_mem_write; // @[el2_lsu_lsc_ctl.scala 194:25]
  wire  dma_pkt_d_by = io_dma_mem_sz == 3'h0; // @[el2_lsu_lsc_ctl.scala 195:45]
  wire  dma_pkt_d_half = io_dma_mem_sz == 3'h1; // @[el2_lsu_lsc_ctl.scala 196:45]
  wire  dma_pkt_d_word = io_dma_mem_sz == 3'h2; // @[el2_lsu_lsc_ctl.scala 197:45]
  wire  dma_pkt_d_dword = io_dma_mem_sz == 3'h3; // @[el2_lsu_lsc_ctl.scala 198:45]
  wire  _T_118 = ~io_lsu_p_fast_int; // @[el2_lsu_lsc_ctl.scala 211:64]
  wire  _T_119 = io_flush_m_up & _T_118; // @[el2_lsu_lsc_ctl.scala 211:61]
  wire  _T_120 = ~_T_119; // @[el2_lsu_lsc_ctl.scala 211:45]
  wire  _T_121 = io_lsu_p_valid & _T_120; // @[el2_lsu_lsc_ctl.scala 211:43]
  wire  _T_123 = ~io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 212:68]
  wire  _T_124 = io_flush_m_up & _T_123; // @[el2_lsu_lsc_ctl.scala 212:65]
  wire  _T_125 = ~_T_124; // @[el2_lsu_lsc_ctl.scala 212:49]
  wire  _T_128 = io_flush_m_up & _T_78; // @[el2_lsu_lsc_ctl.scala 213:65]
  wire  _T_129 = ~_T_128; // @[el2_lsu_lsc_ctl.scala 213:49]
  reg  _T_132_fast_int; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_by; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_half; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_word; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_dword; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_load; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_store; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_unsign; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_dma; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_134_by; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_half; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_word; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_dword; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_load; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_store; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_unsign; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_dma; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_135; // @[el2_lsu_lsc_ctl.scala 217:65]
  reg  _T_136; // @[el2_lsu_lsc_ctl.scala 218:65]
  wire [5:0] _T_139 = {io_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_mem_wdata_shifted = io_dma_mem_wdata >> _T_139; // @[el2_lsu_lsc_ctl.scala 220:54]
  reg [31:0] store_data_pre_m; // @[el2_lsu_lsc_ctl.scala 224:72]
  reg [31:0] _T_146; // @[el2_lsu_lsc_ctl.scala 225:62]
  reg [31:0] _T_147; // @[el2_lsu_lsc_ctl.scala 226:62]
  reg [31:0] _T_148; // @[el2_lsu_lsc_ctl.scala 227:62]
  reg [31:0] _T_149; // @[el2_lsu_lsc_ctl.scala 228:62]
  reg  _T_150; // @[el2_lsu_lsc_ctl.scala 229:62]
  reg  _T_151; // @[el2_lsu_lsc_ctl.scala 230:62]
  reg  _T_152; // @[el2_lsu_lsc_ctl.scala 231:62]
  reg  _T_153; // @[el2_lsu_lsc_ctl.scala 232:62]
  reg  _T_154; // @[el2_lsu_lsc_ctl.scala 233:62]
  wire  _T_156 = io_lsu_pkt_r_store | io_lsu_pkt_r_load; // @[el2_lsu_lsc_ctl.scala 241:63]
  wire  _T_157 = io_lsu_pkt_r_valid & _T_156; // @[el2_lsu_lsc_ctl.scala 241:41]
  wire  _T_158 = ~io_flush_r; // @[el2_lsu_lsc_ctl.scala 241:86]
  wire  _T_159 = _T_157 & _T_158; // @[el2_lsu_lsc_ctl.scala 241:84]
  wire  _T_160 = ~io_lsu_pkt_r_dma; // @[el2_lsu_lsc_ctl.scala 241:100]
  wire  _T_163 = ~io_addr_in_pic_m; // @[el2_lsu_lsc_ctl.scala 242:69]
  wire [31:0] _T_165 = _T_163 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_166 = io_picm_mask_data_m | _T_165; // @[el2_lsu_lsc_ctl.scala 242:59]
  wire [31:0] _T_168 = io_lsu_pkt_m_store_data_bypass_m ? io_lsu_result_m : store_data_pre_m; // @[el2_lsu_lsc_ctl.scala 242:94]
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? io_bus_read_data_m : io_lsu_ld_data_m; // @[el2_lsu_lsc_ctl.scala 263:33]
  wire  _T_174 = io_lsu_pkt_m_unsign & io_lsu_pkt_m_by; // @[el2_lsu_lsc_ctl.scala 265:61]
  wire [31:0] _T_176 = _T_174 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_178 = {24'h0,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_179 = _T_176 & _T_178; // @[el2_lsu_lsc_ctl.scala 265:84]
  wire  _T_180 = io_lsu_pkt_m_unsign & io_lsu_pkt_m_half; // @[el2_lsu_lsc_ctl.scala 266:38]
  wire [31:0] _T_182 = _T_180 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_184 = {16'h0,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_185 = _T_182 & _T_184; // @[el2_lsu_lsc_ctl.scala 266:61]
  wire [31:0] _T_186 = _T_179 | _T_185; // @[el2_lsu_lsc_ctl.scala 265:123]
  wire  _T_187 = ~io_lsu_pkt_m_unsign; // @[el2_lsu_lsc_ctl.scala 267:17]
  wire  _T_188 = _T_187 & io_lsu_pkt_m_by; // @[el2_lsu_lsc_ctl.scala 267:38]
  wire [31:0] _T_190 = _T_188 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_193 = lsu_ld_datafn_m[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_195 = {_T_193,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_196 = _T_190 & _T_195; // @[el2_lsu_lsc_ctl.scala 267:61]
  wire [31:0] _T_197 = _T_186 | _T_196; // @[el2_lsu_lsc_ctl.scala 266:104]
  wire  _T_199 = _T_187 & io_lsu_pkt_m_half; // @[el2_lsu_lsc_ctl.scala 268:38]
  wire [31:0] _T_201 = _T_199 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_204 = lsu_ld_datafn_m[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_206 = {_T_204,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_207 = _T_201 & _T_206; // @[el2_lsu_lsc_ctl.scala 268:61]
  wire [31:0] _T_208 = _T_197 | _T_207; // @[el2_lsu_lsc_ctl.scala 267:124]
  wire [31:0] _T_210 = io_lsu_pkt_m_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = _T_210 & lsu_ld_datafn_m; // @[el2_lsu_lsc_ctl.scala 269:38]
  el2_lsu_addrcheck addrcheck ( // @[el2_lsu_lsc_ctl.scala 119:25]
    .reset(addrcheck_reset),
    .io_lsu_c2_m_clk(addrcheck_io_lsu_c2_m_clk),
    .io_start_addr_d(addrcheck_io_start_addr_d),
    .io_end_addr_d(addrcheck_io_end_addr_d),
    .io_lsu_pkt_d_fast_int(addrcheck_io_lsu_pkt_d_fast_int),
    .io_lsu_pkt_d_by(addrcheck_io_lsu_pkt_d_by),
    .io_lsu_pkt_d_half(addrcheck_io_lsu_pkt_d_half),
    .io_lsu_pkt_d_word(addrcheck_io_lsu_pkt_d_word),
    .io_lsu_pkt_d_load(addrcheck_io_lsu_pkt_d_load),
    .io_lsu_pkt_d_store(addrcheck_io_lsu_pkt_d_store),
    .io_lsu_pkt_d_dma(addrcheck_io_lsu_pkt_d_dma),
    .io_lsu_pkt_d_valid(addrcheck_io_lsu_pkt_d_valid),
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
  assign io_lsu_result_m = _T_208 | _T_212; // @[el2_lsu_lsc_ctl.scala 265:27]
  assign io_lsu_addr_d = {_T_40,_T_10[11:0]}; // @[el2_lsu_lsc_ctl.scala 239:28]
  assign io_lsu_addr_m = _T_146; // @[el2_lsu_lsc_ctl.scala 225:24]
  assign io_lsu_addr_r = _T_147; // @[el2_lsu_lsc_ctl.scala 226:24]
  assign io_end_addr_d = rs1_d + _T_64; // @[el2_lsu_lsc_ctl.scala 116:24]
  assign io_end_addr_m = _T_148; // @[el2_lsu_lsc_ctl.scala 227:24]
  assign io_end_addr_r = _T_149; // @[el2_lsu_lsc_ctl.scala 228:24]
  assign io_store_data_m = _T_166 & _T_168; // @[el2_lsu_lsc_ctl.scala 242:29]
  assign io_lsu_exc_m = access_fault_m | misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 156:16]
  assign io_is_sideeffects_m = addrcheck_io_is_sideeffects_m; // @[el2_lsu_lsc_ctl.scala 129:42]
  assign io_lsu_commit_r = _T_159 & _T_160; // @[el2_lsu_lsc_ctl.scala 241:19]
  assign io_lsu_single_ecc_error_incr = _T_73 & io_lsu_pkt_r_valid; // @[el2_lsu_lsc_ctl.scala 157:32]
  assign io_lsu_error_pkt_r_exc_valid = _T_105_exc_valid; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_single_ecc_error = _T_105_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_inst_type = _T_105_inst_type; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_exc_type = _T_105_exc_type; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_mscause = _T_105_mscause; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_addr = _T_105_addr; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r[31:1]; // @[el2_lsu_lsc_ctl.scala 237:28]
  assign io_lsu_fir_error = _T_106; // @[el2_lsu_lsc_ctl.scala 187:38]
  assign io_addr_in_dccm_d = addrcheck_io_addr_in_dccm_d; // @[el2_lsu_lsc_ctl.scala 130:42]
  assign io_addr_in_dccm_m = _T_150; // @[el2_lsu_lsc_ctl.scala 229:24]
  assign io_addr_in_dccm_r = _T_151; // @[el2_lsu_lsc_ctl.scala 230:24]
  assign io_addr_in_pic_d = addrcheck_io_addr_in_pic_d; // @[el2_lsu_lsc_ctl.scala 131:42]
  assign io_addr_in_pic_m = _T_152; // @[el2_lsu_lsc_ctl.scala 231:24]
  assign io_addr_in_pic_r = _T_153; // @[el2_lsu_lsc_ctl.scala 232:24]
  assign io_addr_external_m = _T_154; // @[el2_lsu_lsc_ctl.scala 233:24]
  assign io_lsu_pkt_d_fast_int = io_dec_lsu_valid_raw_d & io_lsu_p_fast_int; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_by = io_dec_lsu_valid_raw_d ? io_lsu_p_by : dma_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_half = io_dec_lsu_valid_raw_d ? io_lsu_p_half : dma_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_word = io_dec_lsu_valid_raw_d ? io_lsu_p_word : dma_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_dword = io_dec_lsu_valid_raw_d ? io_lsu_p_dword : dma_pkt_d_dword; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_load = io_dec_lsu_valid_raw_d ? io_lsu_p_load : dma_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_store = io_dec_lsu_valid_raw_d ? io_lsu_p_store : io_dma_mem_write; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_unsign = io_dec_lsu_valid_raw_d & io_lsu_p_unsign; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_dma = io_dec_lsu_valid_raw_d ? io_lsu_p_dma : 1'h1; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_store_data_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_load_ldst_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_store_data_bypass_m = io_dec_lsu_valid_raw_d & io_lsu_p_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 207:20]
  assign io_lsu_pkt_d_valid = _T_121 | io_dma_dccm_req; // @[el2_lsu_lsc_ctl.scala 207:20 el2_lsu_lsc_ctl.scala 211:24]
  assign io_lsu_pkt_m_fast_int = _T_132_fast_int; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_by = _T_132_by; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_half = _T_132_half; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_word = _T_132_word; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_dword = _T_132_dword; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_load = _T_132_load; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_store = _T_132_store; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_unsign = _T_132_unsign; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_dma = _T_132_dma; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_store_data_bypass_m = _T_132_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_valid = _T_135; // @[el2_lsu_lsc_ctl.scala 215:28 el2_lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_by = _T_134_by; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_half = _T_134_half; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_word = _T_134_word; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_dword = _T_134_dword; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_load = _T_134_load; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_store = _T_134_store; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_unsign = _T_134_unsign; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_dma = _T_134_dma; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_valid = _T_136; // @[el2_lsu_lsc_ctl.scala 216:28 el2_lsu_lsc_ctl.scala 218:28]
  assign addrcheck_reset = reset;
  assign addrcheck_io_lsu_c2_m_clk = io_lsu_c2_m_clk; // @[el2_lsu_lsc_ctl.scala 121:42]
  assign addrcheck_io_start_addr_d = {_T_40,_T_10[11:0]}; // @[el2_lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_end_addr_d = rs1_d + _T_64; // @[el2_lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_fast_int = io_lsu_pkt_d_fast_int; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_by = io_lsu_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_half = io_lsu_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_word = io_lsu_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_load = io_lsu_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_store = io_lsu_pkt_d_store; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_dma = io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_lsu_pkt_d_valid = io_lsu_pkt_d_valid; // @[el2_lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[el2_lsu_lsc_ctl.scala 126:42]
  assign addrcheck_io_rs1_region_d = rs1_d[31:28]; // @[el2_lsu_lsc_ctl.scala 127:42]
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
  _T_105_exc_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_105_single_ecc_error = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_105_inst_type = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_105_exc_type = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_105_mscause = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_105_addr = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_106 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  _T_132_fast_int = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_132_by = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_132_half = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_132_word = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_132_dword = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_132_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_132_store = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_132_unsign = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_132_dma = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_132_store_data_bypass_m = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_134_by = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_134_half = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_134_word = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_134_dword = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_134_load = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_134_store = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_134_unsign = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_134_dma = _RAND_29[0:0];
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
    _T_105_exc_valid = 1'h0;
  end
  if (reset) begin
    _T_105_single_ecc_error = 1'h0;
  end
  if (reset) begin
    _T_105_inst_type = 1'h0;
  end
  if (reset) begin
    _T_105_exc_type = 1'h0;
  end
  if (reset) begin
    _T_105_mscause = 1'h0;
  end
  if (reset) begin
    _T_105_addr = 1'h0;
  end
  if (reset) begin
    _T_106 = 2'h0;
  end
  if (reset) begin
    _T_132_fast_int = 1'h0;
  end
  if (reset) begin
    _T_132_by = 1'h0;
  end
  if (reset) begin
    _T_132_half = 1'h0;
  end
  if (reset) begin
    _T_132_word = 1'h0;
  end
  if (reset) begin
    _T_132_dword = 1'h0;
  end
  if (reset) begin
    _T_132_load = 1'h0;
  end
  if (reset) begin
    _T_132_store = 1'h0;
  end
  if (reset) begin
    _T_132_unsign = 1'h0;
  end
  if (reset) begin
    _T_132_dma = 1'h0;
  end
  if (reset) begin
    _T_132_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_134_by = 1'h0;
  end
  if (reset) begin
    _T_134_half = 1'h0;
  end
  if (reset) begin
    _T_134_word = 1'h0;
  end
  if (reset) begin
    _T_134_dword = 1'h0;
  end
  if (reset) begin
    _T_134_load = 1'h0;
  end
  if (reset) begin
    _T_134_store = 1'h0;
  end
  if (reset) begin
    _T_134_unsign = 1'h0;
  end
  if (reset) begin
    _T_134_dma = 1'h0;
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
      _T_105_exc_valid <= 1'h0;
    end else begin
      _T_105_exc_valid <= _T_81 & _T_82;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_single_ecc_error <= 1'h0;
    end else begin
      _T_105_single_ecc_error <= _T_85 & _T_78;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_inst_type <= 1'h0;
    end else begin
      _T_105_inst_type <= io_lsu_pkt_m_store;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_exc_type <= 1'h0;
    end else begin
      _T_105_exc_type <= ~misaligned_fault_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_mscause <= 1'h0;
    end else begin
      _T_105_mscause <= _T_95[0];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_addr <= 1'h0;
    end else begin
      _T_105_addr <= io_lsu_addr_m[0];
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
      _T_132_fast_int <= 1'h0;
    end else begin
      _T_132_fast_int <= io_lsu_pkt_d_fast_int;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_by <= 1'h0;
    end else begin
      _T_132_by <= io_lsu_pkt_d_by;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_half <= 1'h0;
    end else begin
      _T_132_half <= io_lsu_pkt_d_half;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_word <= 1'h0;
    end else begin
      _T_132_word <= io_lsu_pkt_d_word;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_dword <= 1'h0;
    end else begin
      _T_132_dword <= io_lsu_pkt_d_dword;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_load <= 1'h0;
    end else begin
      _T_132_load <= io_lsu_pkt_d_load;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_store <= 1'h0;
    end else begin
      _T_132_store <= io_lsu_pkt_d_store;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_unsign <= 1'h0;
    end else begin
      _T_132_unsign <= io_lsu_pkt_d_unsign;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_dma <= 1'h0;
    end else begin
      _T_132_dma <= io_lsu_pkt_d_dma;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_store_data_bypass_m <= 1'h0;
    end else begin
      _T_132_store_data_bypass_m <= io_lsu_pkt_d_store_data_bypass_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_by <= 1'h0;
    end else begin
      _T_134_by <= io_lsu_pkt_m_by;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_half <= 1'h0;
    end else begin
      _T_134_half <= io_lsu_pkt_m_half;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_word <= 1'h0;
    end else begin
      _T_134_word <= io_lsu_pkt_m_word;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_dword <= 1'h0;
    end else begin
      _T_134_dword <= io_lsu_pkt_m_dword;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_load <= 1'h0;
    end else begin
      _T_134_load <= io_lsu_pkt_m_load;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_store <= 1'h0;
    end else begin
      _T_134_store <= io_lsu_pkt_m_store;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_unsign <= 1'h0;
    end else begin
      _T_134_unsign <= io_lsu_pkt_m_unsign;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_dma <= 1'h0;
    end else begin
      _T_134_dma <= io_lsu_pkt_m_dma;
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
    end else if (io_lsu_pkt_d_store_data_bypass_d) begin
      store_data_pre_m <= io_lsu_result_m;
    end else if (io_dma_dccm_req) begin
      store_data_pre_m <= dma_mem_wdata_shifted[31:0];
    end else begin
      store_data_pre_m <= io_exu_lsu_rs2_d;
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
endmodule
module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 472:26]
  wire  clkhdr_CK; // @[el2_lib.scala 472:26]
  wire  clkhdr_EN; // @[el2_lib.scala 472:26]
  wire  clkhdr_SE; // @[el2_lib.scala 472:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 472:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 473:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 474:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 475:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 476:18]
endmodule
module el2_lsu_dccm_ctl(
  input         clock,
  input         reset,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_store_c1_r_clk,
  input         io_lsu_pkt_d_word,
  input         io_lsu_pkt_d_dword,
  input         io_lsu_pkt_d_load,
  input         io_lsu_pkt_d_store,
  input         io_lsu_pkt_d_dma,
  input         io_lsu_pkt_d_valid,
  input         io_lsu_pkt_m_by,
  input         io_lsu_pkt_m_half,
  input         io_lsu_pkt_m_word,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_dma,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 506:23]
  wire [63:0] picm_rd_data_m = {io_picm_rd_data,io_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_load; // @[el2_lsu_dccm_ctl.scala 161:50]
  reg [63:0] _T_2; // @[el2_lsu_dccm_ctl.scala 171:65]
  wire [7:0] _T_3 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_6 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [7:0] _T_11 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_corr_m[7:0]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_12 = _T_3[0] ? _T_6[7:0] : _T_11; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_50 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_corr_m[15:8]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_51 = _T_3[1] ? _T_6[15:8] : _T_50; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_89 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_corr_m[23:16]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_90 = _T_3[2] ? _T_6[23:16] : _T_89; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_128 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_corr_m[31:24]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_129 = _T_3[3] ? _T_6[31:24] : _T_128; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_167 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_corr_m[39:32]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_168 = _T_3[4] ? _T_6[39:32] : _T_167; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_206 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_corr_m[47:40]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_207 = _T_3[5] ? _T_6[47:40] : _T_206; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_245 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_corr_m[55:48]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_246 = _T_3[6] ? _T_6[55:48] : _T_245; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_284 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_corr_m[63:56]; // @[el2_lsu_dccm_ctl.scala 172:213]
  wire [7:0] _T_285 = _T_3[7] ? _T_6[63:56] : _T_284; // @[el2_lsu_dccm_ctl.scala 172:78]
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
  wire [7:0] _T_390 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_m[7:0]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_391 = _T_3[0] ? _T_6[7:0] : _T_390; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_429 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_m[15:8]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_430 = _T_3[1] ? _T_6[15:8] : _T_429; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_468 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_m[23:16]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_469 = _T_3[2] ? _T_6[23:16] : _T_468; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_507 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_m[31:24]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_508 = _T_3[3] ? _T_6[31:24] : _T_507; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_546 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_m[39:32]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_547 = _T_3[4] ? _T_6[39:32] : _T_546; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_585 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_m[47:40]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_586 = _T_3[5] ? _T_6[47:40] : _T_585; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_624 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_m[55:48]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_625 = _T_3[6] ? _T_6[55:48] : _T_624; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [7:0] _T_663 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_m[63:56]; // @[el2_lsu_dccm_ctl.scala 173:213]
  wire [7:0] _T_664 = _T_3[7] ? _T_6[63:56] : _T_663; // @[el2_lsu_dccm_ctl.scala 173:78]
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
  wire [3:0] _GEN_42 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_dccm_ctl.scala 174:49]
  wire [5:0] _T_762 = 4'h8 * _GEN_42; // @[el2_lsu_dccm_ctl.scala 174:49]
  wire [63:0] _T_763 = lsu_rdata_m >> _T_762; // @[el2_lsu_dccm_ctl.scala 174:43]
  wire  _T_769 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 179:60]
  wire  _T_772 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 179:133]
  wire  _T_773 = _T_769 | _T_772; // @[el2_lsu_dccm_ctl.scala 179:101]
  wire  _T_774 = _T_773 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 179:175]
  wire  _T_775 = _T_774 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 179:196]
  wire  _T_776 = _T_775 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 179:217]
  wire  _T_777 = _T_776 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 179:236]
  wire  _T_780 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 180:37]
  wire  _T_783 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 180:110]
  wire  _T_784 = _T_780 | _T_783; // @[el2_lsu_dccm_ctl.scala 180:78]
  wire  _T_785 = _T_784 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 180:152]
  wire  _T_786 = _T_785 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 180:173]
  wire  _T_787 = _T_786 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 180:194]
  wire  _T_788 = _T_787 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 180:213]
  wire  kill_ecc_corr_lo_r = _T_777 | _T_788; // @[el2_lsu_dccm_ctl.scala 179:257]
  wire  _T_791 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 182:60]
  wire  _T_794 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 182:133]
  wire  _T_795 = _T_791 | _T_794; // @[el2_lsu_dccm_ctl.scala 182:101]
  wire  _T_796 = _T_795 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 182:175]
  wire  _T_797 = _T_796 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 182:196]
  wire  _T_798 = _T_797 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 182:217]
  wire  _T_799 = _T_798 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 182:236]
  wire  _T_802 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 183:37]
  wire  _T_805 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 183:110]
  wire  _T_806 = _T_802 | _T_805; // @[el2_lsu_dccm_ctl.scala 183:78]
  wire  _T_807 = _T_806 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 183:152]
  wire  _T_808 = _T_807 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 183:173]
  wire  _T_809 = _T_808 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 183:194]
  wire  _T_810 = _T_809 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 183:213]
  wire  kill_ecc_corr_hi_r = _T_799 | _T_810; // @[el2_lsu_dccm_ctl.scala 182:257]
  wire  _T_811 = io_lsu_pkt_r_load & io_single_ecc_error_lo_r; // @[el2_lsu_dccm_ctl.scala 185:55]
  wire  _T_812 = ~io_lsu_raw_fwd_lo_r; // @[el2_lsu_dccm_ctl.scala 185:84]
  wire  ld_single_ecc_error_lo_r = _T_811 & _T_812; // @[el2_lsu_dccm_ctl.scala 185:82]
  wire  _T_813 = io_lsu_pkt_r_load & io_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 186:55]
  wire  _T_814 = ~io_lsu_raw_fwd_hi_r; // @[el2_lsu_dccm_ctl.scala 186:84]
  wire  ld_single_ecc_error_hi_r = _T_813 & _T_814; // @[el2_lsu_dccm_ctl.scala 186:82]
  wire  _T_815 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 187:63]
  wire  _T_816 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_dccm_ctl.scala 187:93]
  wire  _T_818 = io_lsu_commit_r | io_lsu_pkt_r_dma; // @[el2_lsu_dccm_ctl.scala 188:81]
  wire  _T_819 = ld_single_ecc_error_lo_r & _T_818; // @[el2_lsu_dccm_ctl.scala 188:62]
  wire  _T_820 = ~kill_ecc_corr_lo_r; // @[el2_lsu_dccm_ctl.scala 188:103]
  wire  _T_822 = ld_single_ecc_error_hi_r & _T_818; // @[el2_lsu_dccm_ctl.scala 189:62]
  wire  _T_823 = ~kill_ecc_corr_hi_r; // @[el2_lsu_dccm_ctl.scala 189:103]
  reg  lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 191:74]
  reg  ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 192:74]
  reg  ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 193:74]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[el2_lib.scala 512:16]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[el2_lib.scala 512:16]
  wire  _T_830 = io_lsu_pkt_d_word | io_lsu_pkt_d_dword; // @[el2_lsu_dccm_ctl.scala 197:110]
  wire  _T_831 = ~_T_830; // @[el2_lsu_dccm_ctl.scala 197:90]
  wire  _T_833 = io_lsu_addr_d[1:0] != 2'h0; // @[el2_lsu_dccm_ctl.scala 197:154]
  wire  _T_834 = _T_831 | _T_833; // @[el2_lsu_dccm_ctl.scala 197:132]
  wire  _T_835 = io_lsu_pkt_d_store & _T_834; // @[el2_lsu_dccm_ctl.scala 197:87]
  wire  _T_836 = io_lsu_pkt_d_load | _T_835; // @[el2_lsu_dccm_ctl.scala 197:65]
  wire  _T_837 = io_lsu_pkt_d_valid & _T_836; // @[el2_lsu_dccm_ctl.scala 197:44]
  wire  lsu_dccm_rden_d = _T_837 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 197:171]
  wire  _T_838 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 200:63]
  wire  _T_839 = ~lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 200:96]
  wire  _T_841 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[el2_lsu_dccm_ctl.scala 201:75]
  wire  _T_842 = _T_841 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 201:93]
  wire  _T_843 = ~_T_842; // @[el2_lsu_dccm_ctl.scala 201:57]
  wire  _T_846 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 202:95]
  wire  _T_849 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 203:76]
  wire  _T_850 = _T_846 | _T_849; // @[el2_lsu_dccm_ctl.scala 202:171]
  wire  _T_851 = ~_T_850; // @[el2_lsu_dccm_ctl.scala 202:24]
  wire  _T_852 = lsu_dccm_rden_d & _T_851; // @[el2_lsu_dccm_ctl.scala 202:22]
  wire  _T_853 = _T_843 | _T_852; // @[el2_lsu_dccm_ctl.scala 201:124]
  wire  _T_855 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[el2_lsu_dccm_ctl.scala 207:41]
  wire [15:0] _T_862 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 211:8]
  wire [15:0] _T_866 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 212:8]
  wire [15:0] _T_872 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 215:8]
  wire [15:0] _T_876 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 216:8]
  wire  _T_881 = ~ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 222:36]
  wire [38:0] _T_884 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_887 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_888 = _T_881 ? _T_884 : _T_887; // @[el2_lsu_dccm_ctl.scala 222:8]
  wire [38:0] _T_892 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_895 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_896 = io_dma_dccm_wen ? _T_892 : _T_895; // @[el2_lsu_dccm_ctl.scala 224:8]
  wire  _T_899 = ~ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 228:36]
  wire [38:0] _T_906 = _T_899 ? _T_887 : _T_884; // @[el2_lsu_dccm_ctl.scala 228:8]
  wire [38:0] _T_910 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_914 = io_dma_dccm_wen ? _T_910 : _T_895; // @[el2_lsu_dccm_ctl.scala 230:8]
  wire [3:0] _T_917 = io_lsu_pkt_m_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_919 = io_lsu_pkt_m_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_920 = _T_919 & 4'h1; // @[el2_lsu_dccm_ctl.scala 234:84]
  wire [3:0] _T_922 = io_lsu_pkt_m_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_923 = _T_922 & 4'h3; // @[el2_lsu_dccm_ctl.scala 235:33]
  wire [3:0] _T_924 = _T_920 | _T_923; // @[el2_lsu_dccm_ctl.scala 234:97]
  wire [3:0] _T_926 = io_lsu_pkt_m_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_928 = _T_924 | _T_926; // @[el2_lsu_dccm_ctl.scala 235:46]
  wire [3:0] store_byteen_m = _T_917 & _T_928; // @[el2_lsu_dccm_ctl.scala 234:53]
  wire [3:0] _T_930 = io_lsu_pkt_r_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_932 = io_lsu_pkt_r_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_933 = _T_932 & 4'h1; // @[el2_lsu_dccm_ctl.scala 238:84]
  wire [3:0] _T_935 = io_lsu_pkt_r_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_936 = _T_935 & 4'h3; // @[el2_lsu_dccm_ctl.scala 239:33]
  wire [3:0] _T_937 = _T_933 | _T_936; // @[el2_lsu_dccm_ctl.scala 238:97]
  wire [3:0] _T_939 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_941 = _T_937 | _T_939; // @[el2_lsu_dccm_ctl.scala 239:46]
  wire [3:0] store_byteen_r = _T_930 & _T_941; // @[el2_lsu_dccm_ctl.scala 238:53]
  wire [6:0] _GEN_44 = {{3'd0}, store_byteen_m}; // @[el2_lsu_dccm_ctl.scala 242:45]
  wire [6:0] _T_944 = _GEN_44 << io_lsu_addr_m[1:0]; // @[el2_lsu_dccm_ctl.scala 242:45]
  wire [6:0] _GEN_45 = {{3'd0}, store_byteen_r}; // @[el2_lsu_dccm_ctl.scala 244:45]
  wire [6:0] _T_947 = _GEN_45 << io_lsu_addr_r[1:0]; // @[el2_lsu_dccm_ctl.scala 244:45]
  wire  _T_950 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 247:67]
  wire  dccm_wr_bypass_d_m_lo = _T_950 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 247:101]
  wire  _T_953 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 248:67]
  wire  dccm_wr_bypass_d_m_hi = _T_953 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 248:101]
  wire  _T_956 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 250:67]
  wire  dccm_wr_bypass_d_r_lo = _T_956 & io_addr_in_dccm_r; // @[el2_lsu_dccm_ctl.scala 250:101]
  wire [63:0] _T_962 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_47 = {{63'd0}, _T_962}; // @[el2_lsu_dccm_ctl.scala 280:72]
  wire [126:0] _T_965 = _GEN_47 << _T_762; // @[el2_lsu_dccm_ctl.scala 280:72]
  wire [63:0] store_data_pre_m = _T_965[63:0]; // @[el2_lsu_dccm_ctl.scala 280:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[el2_lsu_dccm_ctl.scala 281:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[el2_lsu_dccm_ctl.scala 282:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_944}; // @[el2_lsu_dccm_ctl.scala 242:22]
  wire  _T_971 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[el2_lsu_dccm_ctl.scala 283:211]
  wire [7:0] _T_975 = _T_971 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_976 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_975; // @[el2_lsu_dccm_ctl.scala 283:120]
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
  wire [7:0] _T_1013 = _T_971 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1014 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1013; // @[el2_lsu_dccm_ctl.scala 283:120]
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
  wire [7:0] _T_1051 = _T_971 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1052 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1051; // @[el2_lsu_dccm_ctl.scala 283:120]
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
  wire [7:0] _T_1089 = _T_971 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[el2_lsu_dccm_ctl.scala 283:185]
  wire [7:0] _T_1090 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1089; // @[el2_lsu_dccm_ctl.scala 283:120]
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
  reg [31:0] _T_1173; // @[el2_lsu_dccm_ctl.scala 283:72]
  wire  _T_1177 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[el2_lsu_dccm_ctl.scala 284:211]
  wire [7:0] _T_1181 = _T_1177 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1182 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1181; // @[el2_lsu_dccm_ctl.scala 284:120]
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
  wire [7:0] _T_1219 = _T_1177 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1220 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1219; // @[el2_lsu_dccm_ctl.scala 284:120]
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
  wire [7:0] _T_1257 = _T_1177 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1258 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1257; // @[el2_lsu_dccm_ctl.scala 284:120]
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
  wire [7:0] _T_1295 = _T_1177 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[el2_lsu_dccm_ctl.scala 284:185]
  wire [7:0] _T_1296 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1295; // @[el2_lsu_dccm_ctl.scala 284:120]
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
  reg [31:0] _T_1379; // @[el2_lsu_dccm_ctl.scala 284:72]
  wire  _T_1380 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[el2_lsu_dccm_ctl.scala 285:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_947}; // @[el2_lsu_dccm_ctl.scala 244:22]
  wire  _T_1382 = ~store_byteen_ext_r[0]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1383 = _T_1380 & _T_1382; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1387 = _T_1383 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[el2_lsu_dccm_ctl.scala 285:79]
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
  wire  _T_1419 = ~store_byteen_ext_r[1]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1420 = _T_1380 & _T_1419; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1424 = _T_1420 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[el2_lsu_dccm_ctl.scala 285:79]
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
  wire  _T_1456 = ~store_byteen_ext_r[2]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1457 = _T_1380 & _T_1456; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1461 = _T_1457 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[el2_lsu_dccm_ctl.scala 285:79]
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
  wire  _T_1493 = ~store_byteen_ext_r[3]; // @[el2_lsu_dccm_ctl.scala 285:131]
  wire  _T_1494 = _T_1380 & _T_1493; // @[el2_lsu_dccm_ctl.scala 285:129]
  wire [7:0] _T_1498 = _T_1494 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[el2_lsu_dccm_ctl.scala 285:79]
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
  wire [7:0] _T_1588 = _T_1383 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[el2_lsu_dccm_ctl.scala 286:79]
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
  wire [7:0] _T_1625 = _T_1420 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[el2_lsu_dccm_ctl.scala 286:79]
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
  wire [7:0] _T_1662 = _T_1457 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[el2_lsu_dccm_ctl.scala 286:79]
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
  wire [7:0] _T_1699 = _T_1494 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[el2_lsu_dccm_ctl.scala 286:79]
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
  wire [3:0] _GEN_96 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[el2_lsu_dccm_ctl.scala 287:94]
  wire [5:0] _T_1786 = 4'h8 * _GEN_96; // @[el2_lsu_dccm_ctl.scala 287:94]
  wire [63:0] _T_1787 = _T_1784 >> _T_1786; // @[el2_lsu_dccm_ctl.scala 287:88]
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
  wire [63:0] _GEN_101 = {{32'd0}, _T_1852}; // @[el2_lsu_dccm_ctl.scala 287:115]
  wire [63:0] _T_1853 = _T_1787 & _GEN_101; // @[el2_lsu_dccm_ctl.scala 287:115]
  wire  _T_1858 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_dccm_ctl.scala 294:50]
  wire  _T_1859 = _T_1858 & io_addr_in_pic_r; // @[el2_lsu_dccm_ctl.scala 294:71]
  wire  _T_1860 = _T_1859 & io_lsu_commit_r; // @[el2_lsu_dccm_ctl.scala 294:90]
  wire  _T_1862 = io_lsu_pkt_d_valid & io_lsu_pkt_d_load; // @[el2_lsu_dccm_ctl.scala 295:50]
  wire  _T_1864 = io_lsu_pkt_d_valid & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 296:50]
  wire [31:0] _T_1868 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1874 = io_dma_pic_wen ? io_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[el2_lsu_dccm_ctl.scala 298:77]
  wire [31:0] _T_1875 = {17'h0,_T_1874}; // @[Cat.scala 29:58]
  reg  _T_1882; // @[el2_lsu_dccm_ctl.scala 303:61]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_lsu_ld_data_corr_r = _T_2[31:0]; // @[el2_lsu_dccm_ctl.scala 171:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[el2_lsu_dccm_ctl.scala 290:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[el2_lsu_dccm_ctl.scala 289:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[el2_lsu_dccm_ctl.scala 292:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[el2_lsu_dccm_ctl.scala 291:27]
  assign io_lsu_ld_data_m = _T_763[31:0]; // @[el2_lsu_dccm_ctl.scala 174:28]
  assign io_store_data_hi_r = _T_1379; // @[el2_lsu_dccm_ctl.scala 284:29]
  assign io_store_data_lo_r = _T_1173; // @[el2_lsu_dccm_ctl.scala 283:29]
  assign io_store_datafn_hi_r = _T_1776 | _T_1780; // @[el2_lsu_dccm_ctl.scala 286:29]
  assign io_store_datafn_lo_r = _T_1575 | _T_1579; // @[el2_lsu_dccm_ctl.scala 285:29]
  assign io_store_data_r = _T_1853[31:0]; // @[el2_lsu_dccm_ctl.scala 287:29]
  assign io_ld_single_ecc_error_r = _T_815 & _T_816; // @[el2_lsu_dccm_ctl.scala 187:34]
  assign io_ld_single_ecc_error_r_ff = _T_838 & _T_839; // @[el2_lsu_dccm_ctl.scala 200:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[el2_lsu_dccm_ctl.scala 299:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_853; // @[el2_lsu_dccm_ctl.scala 201:31]
  assign io_lsu_dccm_rden_m = _T_1882; // @[el2_lsu_dccm_ctl.scala 303:24]
  assign io_dccm_dma_rvalid = _T & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 161:28]
  assign io_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[el2_lsu_dccm_ctl.scala 162:28]
  assign io_dccm_dma_rtag = io_dma_mem_tag_m; // @[el2_lsu_dccm_ctl.scala 164:28]
  assign io_dccm_dma_rdata = _T_376 | _T_380; // @[el2_lsu_dccm_ctl.scala 163:28]
  assign io_dccm_wren = _T_855 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 207:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 208:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_862 : _T_866; // @[el2_lsu_dccm_ctl.scala 210:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_888 : _T_896; // @[el2_lsu_dccm_ctl.scala 221:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[el2_lsu_dccm_ctl.scala 218:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_872 : _T_876; // @[el2_lsu_dccm_ctl.scala 214:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_906 : _T_914; // @[el2_lsu_dccm_ctl.scala 227:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[el2_lsu_dccm_ctl.scala 219:22]
  assign io_picm_wren = _T_1860 | io_dma_pic_wen; // @[el2_lsu_dccm_ctl.scala 294:27]
  assign io_picm_rden = _T_1862 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 295:27]
  assign io_picm_mken = _T_1864 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 296:27]
  assign io_picm_rdaddr = 32'hf00c0000 | _T_1868; // @[el2_lsu_dccm_ctl.scala 297:27]
  assign io_picm_wraddr = 32'hf00c0000 | _T_1875; // @[el2_lsu_dccm_ctl.scala 298:27]
  assign io_picm_wr_data = io_dma_pic_wen ? io_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[el2_lsu_dccm_ctl.scala 300:27]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 509:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 509:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
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
module el2_lsu_stbuf(
  input         clock,
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_stbuf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_dword,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_dma,
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 506:23]
  wire [1:0] _T_5 = io_lsu_pkt_r_half ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_7 = io_lsu_pkt_r_dword ? 8'hff : 8'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_10 = {{1'd0}, io_lsu_pkt_r_by}; // @[Mux.scala 27:72]
  wire [1:0] _T_8 = _GEN_10 | _T_5; // @[Mux.scala 27:72]
  wire [3:0] _GEN_11 = {{2'd0}, _T_8}; // @[Mux.scala 27:72]
  wire [3:0] _T_9 = _GEN_11 | _T_6; // @[Mux.scala 27:72]
  wire [7:0] _GEN_12 = {{4'd0}, _T_9}; // @[Mux.scala 27:72]
  wire [7:0] ldst_byteen_r = _GEN_12 | _T_7; // @[Mux.scala 27:72]
  wire  ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_stbuf.scala 118:39]
  reg  ldst_dual_r; // @[el2_lsu_stbuf.scala 177:52]
  wire  dual_stbuf_write_r = ldst_dual_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 119:40]
  wire [10:0] _GEN_13 = {{3'd0}, ldst_byteen_r}; // @[el2_lsu_stbuf.scala 121:39]
  wire [10:0] _T_14 = _GEN_13 << io_lsu_addr_r[1:0]; // @[el2_lsu_stbuf.scala 121:39]
  wire [7:0] store_byteen_ext_r = _T_14[7:0]; // @[el2_lsu_stbuf.scala 121:22]
  wire [3:0] _T_17 = io_lsu_pkt_r_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_17; // @[el2_lsu_stbuf.scala 122:52]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_17; // @[el2_lsu_stbuf.scala 123:52]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] RdPtrPlus1 = RdPtr + 2'h1; // @[el2_lsu_stbuf.scala 125:26]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[el2_lsu_stbuf.scala 126:26]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[el2_lsu_stbuf.scala 127:26]
  reg [15:0] stbuf_addr_0; // @[el2_lib.scala 512:16]
  wire  _T_27 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  reg  _T_588; // @[el2_lsu_stbuf.scala 164:88]
  reg  _T_580; // @[el2_lsu_stbuf.scala 164:88]
  reg  _T_572; // @[el2_lsu_stbuf.scala 164:88]
  reg  _T_564; // @[el2_lsu_stbuf.scala 164:88]
  wire [3:0] stbuf_vld = {_T_588,_T_580,_T_572,_T_564}; // @[Cat.scala 29:58]
  wire  _T_29 = _T_27 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 131:179]
  reg  _T_623; // @[el2_lsu_stbuf.scala 166:92]
  reg  _T_615; // @[el2_lsu_stbuf.scala 166:92]
  reg  _T_607; // @[el2_lsu_stbuf.scala 166:92]
  reg  _T_599; // @[el2_lsu_stbuf.scala 166:92]
  wire [3:0] stbuf_dma_kill = {_T_623,_T_615,_T_607,_T_599}; // @[Cat.scala 29:58]
  wire  _T_31 = ~stbuf_dma_kill[0]; // @[el2_lsu_stbuf.scala 131:197]
  wire  _T_32 = _T_29 & _T_31; // @[el2_lsu_stbuf.scala 131:195]
  wire  _T_212 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[el2_lsu_stbuf.scala 142:78]
  wire  _T_213 = 2'h3 == RdPtr; // @[el2_lsu_stbuf.scala 142:121]
  wire  _T_215 = _T_212 & _T_213; // @[el2_lsu_stbuf.scala 142:109]
  wire  _T_209 = 2'h2 == RdPtr; // @[el2_lsu_stbuf.scala 142:121]
  wire  _T_211 = _T_212 & _T_209; // @[el2_lsu_stbuf.scala 142:109]
  wire  _T_205 = 2'h1 == RdPtr; // @[el2_lsu_stbuf.scala 142:121]
  wire  _T_207 = _T_212 & _T_205; // @[el2_lsu_stbuf.scala 142:109]
  wire  _T_201 = 2'h0 == RdPtr; // @[el2_lsu_stbuf.scala 142:121]
  wire  _T_203 = _T_212 & _T_201; // @[el2_lsu_stbuf.scala 142:109]
  wire [3:0] stbuf_reset = {_T_215,_T_211,_T_207,_T_203}; // @[Cat.scala 29:58]
  wire  _T_34 = ~stbuf_reset[0]; // @[el2_lsu_stbuf.scala 131:218]
  wire  _T_35 = _T_32 & _T_34; // @[el2_lsu_stbuf.scala 131:216]
  reg [15:0] stbuf_addr_1; // @[el2_lib.scala 512:16]
  wire  _T_38 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_40 = _T_38 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_42 = ~stbuf_dma_kill[1]; // @[el2_lsu_stbuf.scala 131:197]
  wire  _T_43 = _T_40 & _T_42; // @[el2_lsu_stbuf.scala 131:195]
  wire  _T_45 = ~stbuf_reset[1]; // @[el2_lsu_stbuf.scala 131:218]
  wire  _T_46 = _T_43 & _T_45; // @[el2_lsu_stbuf.scala 131:216]
  reg [15:0] stbuf_addr_2; // @[el2_lib.scala 512:16]
  wire  _T_49 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_51 = _T_49 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_53 = ~stbuf_dma_kill[2]; // @[el2_lsu_stbuf.scala 131:197]
  wire  _T_54 = _T_51 & _T_53; // @[el2_lsu_stbuf.scala 131:195]
  wire  _T_56 = ~stbuf_reset[2]; // @[el2_lsu_stbuf.scala 131:218]
  wire  _T_57 = _T_54 & _T_56; // @[el2_lsu_stbuf.scala 131:216]
  reg [15:0] stbuf_addr_3; // @[el2_lib.scala 512:16]
  wire  _T_60 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 131:120]
  wire  _T_62 = _T_60 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 131:179]
  wire  _T_64 = ~stbuf_dma_kill[3]; // @[el2_lsu_stbuf.scala 131:197]
  wire  _T_65 = _T_62 & _T_64; // @[el2_lsu_stbuf.scala 131:195]
  wire  _T_67 = ~stbuf_reset[3]; // @[el2_lsu_stbuf.scala 131:218]
  wire  _T_68 = _T_65 & _T_67; // @[el2_lsu_stbuf.scala 131:216]
  wire [3:0] store_matchvec_lo_r = {_T_68,_T_57,_T_46,_T_35}; // @[Cat.scala 29:58]
  wire  _T_73 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 132:120]
  wire  _T_75 = _T_73 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 132:179]
  wire  _T_78 = _T_75 & _T_31; // @[el2_lsu_stbuf.scala 132:194]
  wire  _T_79 = _T_78 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 132:215]
  wire  _T_82 = _T_79 & _T_34; // @[el2_lsu_stbuf.scala 132:236]
  wire  _T_85 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 132:120]
  wire  _T_87 = _T_85 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 132:179]
  wire  _T_90 = _T_87 & _T_42; // @[el2_lsu_stbuf.scala 132:194]
  wire  _T_91 = _T_90 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 132:215]
  wire  _T_94 = _T_91 & _T_45; // @[el2_lsu_stbuf.scala 132:236]
  wire  _T_97 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 132:120]
  wire  _T_99 = _T_97 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 132:179]
  wire  _T_102 = _T_99 & _T_53; // @[el2_lsu_stbuf.scala 132:194]
  wire  _T_103 = _T_102 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 132:215]
  wire  _T_106 = _T_103 & _T_56; // @[el2_lsu_stbuf.scala 132:236]
  wire  _T_109 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 132:120]
  wire  _T_111 = _T_109 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 132:179]
  wire  _T_114 = _T_111 & _T_64; // @[el2_lsu_stbuf.scala 132:194]
  wire  _T_115 = _T_114 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 132:215]
  wire  _T_118 = _T_115 & _T_67; // @[el2_lsu_stbuf.scala 132:236]
  wire [3:0] store_matchvec_hi_r = {_T_118,_T_106,_T_94,_T_82}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[el2_lsu_stbuf.scala 134:49]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[el2_lsu_stbuf.scala 135:49]
  wire  _T_121 = 2'h0 == WrPtr; // @[el2_lsu_stbuf.scala 138:16]
  wire  _T_122 = ~store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 138:29]
  wire  _T_123 = _T_121 & _T_122; // @[el2_lsu_stbuf.scala 138:27]
  wire  _T_125 = _T_121 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:29]
  wire  _T_126 = ~store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 139:52]
  wire  _T_127 = _T_125 & _T_126; // @[el2_lsu_stbuf.scala 139:50]
  wire  _T_128 = _T_123 | _T_127; // @[el2_lsu_stbuf.scala 138:51]
  wire  _T_129 = 2'h0 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 140:18]
  wire  _T_130 = _T_129 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 140:34]
  wire  _T_131 = store_coalesce_lo_r | store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 140:79]
  wire  _T_132 = ~_T_131; // @[el2_lsu_stbuf.scala 140:57]
  wire  _T_133 = _T_130 & _T_132; // @[el2_lsu_stbuf.scala 140:55]
  wire  _T_134 = _T_128 | _T_133; // @[el2_lsu_stbuf.scala 139:74]
  wire  _T_136 = _T_134 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 140:103]
  wire  _T_138 = _T_136 | store_matchvec_hi_r[0]; // @[el2_lsu_stbuf.scala 141:30]
  wire  _T_139 = io_ldst_stbuf_reqvld_r & _T_138; // @[el2_lsu_stbuf.scala 137:76]
  wire  _T_140 = 2'h1 == WrPtr; // @[el2_lsu_stbuf.scala 138:16]
  wire  _T_142 = _T_140 & _T_122; // @[el2_lsu_stbuf.scala 138:27]
  wire  _T_144 = _T_140 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:29]
  wire  _T_146 = _T_144 & _T_126; // @[el2_lsu_stbuf.scala 139:50]
  wire  _T_147 = _T_142 | _T_146; // @[el2_lsu_stbuf.scala 138:51]
  wire  _T_148 = 2'h1 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 140:18]
  wire  _T_149 = _T_148 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 140:34]
  wire  _T_152 = _T_149 & _T_132; // @[el2_lsu_stbuf.scala 140:55]
  wire  _T_153 = _T_147 | _T_152; // @[el2_lsu_stbuf.scala 139:74]
  wire  _T_155 = _T_153 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 140:103]
  wire  _T_157 = _T_155 | store_matchvec_hi_r[1]; // @[el2_lsu_stbuf.scala 141:30]
  wire  _T_158 = io_ldst_stbuf_reqvld_r & _T_157; // @[el2_lsu_stbuf.scala 137:76]
  wire  _T_159 = 2'h2 == WrPtr; // @[el2_lsu_stbuf.scala 138:16]
  wire  _T_161 = _T_159 & _T_122; // @[el2_lsu_stbuf.scala 138:27]
  wire  _T_163 = _T_159 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:29]
  wire  _T_165 = _T_163 & _T_126; // @[el2_lsu_stbuf.scala 139:50]
  wire  _T_166 = _T_161 | _T_165; // @[el2_lsu_stbuf.scala 138:51]
  wire  _T_167 = 2'h2 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 140:18]
  wire  _T_168 = _T_167 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 140:34]
  wire  _T_171 = _T_168 & _T_132; // @[el2_lsu_stbuf.scala 140:55]
  wire  _T_172 = _T_166 | _T_171; // @[el2_lsu_stbuf.scala 139:74]
  wire  _T_174 = _T_172 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 140:103]
  wire  _T_176 = _T_174 | store_matchvec_hi_r[2]; // @[el2_lsu_stbuf.scala 141:30]
  wire  _T_177 = io_ldst_stbuf_reqvld_r & _T_176; // @[el2_lsu_stbuf.scala 137:76]
  wire  _T_178 = 2'h3 == WrPtr; // @[el2_lsu_stbuf.scala 138:16]
  wire  _T_180 = _T_178 & _T_122; // @[el2_lsu_stbuf.scala 138:27]
  wire  _T_182 = _T_178 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 139:29]
  wire  _T_184 = _T_182 & _T_126; // @[el2_lsu_stbuf.scala 139:50]
  wire  _T_185 = _T_180 | _T_184; // @[el2_lsu_stbuf.scala 138:51]
  wire  _T_186 = 2'h3 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 140:18]
  wire  _T_187 = _T_186 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 140:34]
  wire  _T_190 = _T_187 & _T_132; // @[el2_lsu_stbuf.scala 140:55]
  wire  _T_191 = _T_185 | _T_190; // @[el2_lsu_stbuf.scala 139:74]
  wire  _T_193 = _T_191 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 140:103]
  wire  _T_195 = _T_193 | store_matchvec_hi_r[3]; // @[el2_lsu_stbuf.scala 141:30]
  wire  _T_196 = io_ldst_stbuf_reqvld_r & _T_195; // @[el2_lsu_stbuf.scala 137:76]
  wire [3:0] stbuf_wr_en = {_T_196,_T_177,_T_158,_T_139}; // @[Cat.scala 29:58]
  wire  _T_219 = ~ldst_dual_r; // @[el2_lsu_stbuf.scala 143:53]
  wire  _T_220 = _T_219 | io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 143:66]
  wire  _T_223 = _T_220 & _T_121; // @[el2_lsu_stbuf.scala 143:93]
  wire  _T_225 = _T_223 & _T_122; // @[el2_lsu_stbuf.scala 143:123]
  wire  _T_227 = _T_225 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 143:147]
  wire  _T_232 = _T_220 & _T_140; // @[el2_lsu_stbuf.scala 143:93]
  wire  _T_234 = _T_232 & _T_122; // @[el2_lsu_stbuf.scala 143:123]
  wire  _T_236 = _T_234 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 143:147]
  wire  _T_241 = _T_220 & _T_159; // @[el2_lsu_stbuf.scala 143:93]
  wire  _T_243 = _T_241 & _T_122; // @[el2_lsu_stbuf.scala 143:123]
  wire  _T_245 = _T_243 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 143:147]
  wire  _T_250 = _T_220 & _T_178; // @[el2_lsu_stbuf.scala 143:93]
  wire  _T_252 = _T_250 & _T_122; // @[el2_lsu_stbuf.scala 143:123]
  wire  _T_254 = _T_252 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 143:147]
  wire [3:0] sel_lo = {_T_254,_T_245,_T_236,_T_227}; // @[Cat.scala 29:58]
  reg [3:0] stbuf_byteen_0; // @[el2_lsu_stbuf.scala 167:92]
  wire [3:0] _T_274 = stbuf_byteen_0 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 146:86]
  wire [3:0] _T_275 = stbuf_byteen_0 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 146:123]
  wire [3:0] stbuf_byteenin_0 = sel_lo[0] ? _T_274 : _T_275; // @[el2_lsu_stbuf.scala 146:58]
  reg [3:0] stbuf_byteen_1; // @[el2_lsu_stbuf.scala 167:92]
  wire [3:0] _T_278 = stbuf_byteen_1 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 146:86]
  wire [3:0] _T_279 = stbuf_byteen_1 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 146:123]
  wire [3:0] stbuf_byteenin_1 = sel_lo[1] ? _T_278 : _T_279; // @[el2_lsu_stbuf.scala 146:58]
  reg [3:0] stbuf_byteen_2; // @[el2_lsu_stbuf.scala 167:92]
  wire [3:0] _T_282 = stbuf_byteen_2 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 146:86]
  wire [3:0] _T_283 = stbuf_byteen_2 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 146:123]
  wire [3:0] stbuf_byteenin_2 = sel_lo[2] ? _T_282 : _T_283; // @[el2_lsu_stbuf.scala 146:58]
  reg [3:0] stbuf_byteen_3; // @[el2_lsu_stbuf.scala 167:92]
  wire [3:0] _T_286 = stbuf_byteen_3 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 146:86]
  wire [3:0] _T_287 = stbuf_byteen_3 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 146:123]
  wire [3:0] stbuf_byteenin_3 = sel_lo[3] ? _T_286 : _T_287; // @[el2_lsu_stbuf.scala 146:58]
  wire  _T_291 = ~stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 148:67]
  wire  _T_293 = _T_291 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 148:87]
  reg [31:0] stbuf_data_0; // @[el2_lib.scala 512:16]
  wire [7:0] _T_296 = _T_293 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 148:66]
  wire  _T_300 = _T_291 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 149:29]
  wire [7:0] _T_303 = _T_300 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 149:8]
  wire [7:0] datain1_0 = sel_lo[0] ? _T_296 : _T_303; // @[el2_lsu_stbuf.scala 148:51]
  wire  _T_307 = ~stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 148:67]
  wire  _T_309 = _T_307 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 148:87]
  reg [31:0] stbuf_data_1; // @[el2_lib.scala 512:16]
  wire [7:0] _T_312 = _T_309 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 148:66]
  wire  _T_316 = _T_307 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 149:29]
  wire [7:0] _T_319 = _T_316 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 149:8]
  wire [7:0] datain1_1 = sel_lo[1] ? _T_312 : _T_319; // @[el2_lsu_stbuf.scala 148:51]
  wire  _T_323 = ~stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 148:67]
  wire  _T_325 = _T_323 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 148:87]
  reg [31:0] stbuf_data_2; // @[el2_lib.scala 512:16]
  wire [7:0] _T_328 = _T_325 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 148:66]
  wire  _T_332 = _T_323 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 149:29]
  wire [7:0] _T_335 = _T_332 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 149:8]
  wire [7:0] datain1_2 = sel_lo[2] ? _T_328 : _T_335; // @[el2_lsu_stbuf.scala 148:51]
  wire  _T_339 = ~stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 148:67]
  wire  _T_341 = _T_339 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 148:87]
  reg [31:0] stbuf_data_3; // @[el2_lib.scala 512:16]
  wire [7:0] _T_344 = _T_341 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 148:66]
  wire  _T_348 = _T_339 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 149:29]
  wire [7:0] _T_351 = _T_348 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 149:8]
  wire [7:0] datain1_3 = sel_lo[3] ? _T_344 : _T_351; // @[el2_lsu_stbuf.scala 148:51]
  wire  _T_355 = ~stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 151:68]
  wire  _T_357 = _T_355 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 151:88]
  wire [7:0] _T_360 = _T_357 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 151:67]
  wire  _T_364 = _T_355 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 152:29]
  wire [7:0] _T_367 = _T_364 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 152:8]
  wire [7:0] datain2_0 = sel_lo[0] ? _T_360 : _T_367; // @[el2_lsu_stbuf.scala 151:52]
  wire  _T_371 = ~stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 151:68]
  wire  _T_373 = _T_371 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 151:88]
  wire [7:0] _T_376 = _T_373 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 151:67]
  wire  _T_380 = _T_371 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 152:29]
  wire [7:0] _T_383 = _T_380 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 152:8]
  wire [7:0] datain2_1 = sel_lo[1] ? _T_376 : _T_383; // @[el2_lsu_stbuf.scala 151:52]
  wire  _T_387 = ~stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 151:68]
  wire  _T_389 = _T_387 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 151:88]
  wire [7:0] _T_392 = _T_389 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 151:67]
  wire  _T_396 = _T_387 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 152:29]
  wire [7:0] _T_399 = _T_396 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 152:8]
  wire [7:0] datain2_2 = sel_lo[2] ? _T_392 : _T_399; // @[el2_lsu_stbuf.scala 151:52]
  wire  _T_403 = ~stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 151:68]
  wire  _T_405 = _T_403 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 151:88]
  wire [7:0] _T_408 = _T_405 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 151:67]
  wire  _T_412 = _T_403 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 152:29]
  wire [7:0] _T_415 = _T_412 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 152:8]
  wire [7:0] datain2_3 = sel_lo[3] ? _T_408 : _T_415; // @[el2_lsu_stbuf.scala 151:52]
  wire  _T_419 = ~stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 154:68]
  wire  _T_421 = _T_419 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 154:88]
  wire [7:0] _T_424 = _T_421 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 154:67]
  wire  _T_428 = _T_419 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 155:29]
  wire [7:0] _T_431 = _T_428 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 155:8]
  wire [7:0] datain3_0 = sel_lo[0] ? _T_424 : _T_431; // @[el2_lsu_stbuf.scala 154:52]
  wire  _T_435 = ~stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 154:68]
  wire  _T_437 = _T_435 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 154:88]
  wire [7:0] _T_440 = _T_437 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 154:67]
  wire  _T_444 = _T_435 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 155:29]
  wire [7:0] _T_447 = _T_444 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 155:8]
  wire [7:0] datain3_1 = sel_lo[1] ? _T_440 : _T_447; // @[el2_lsu_stbuf.scala 154:52]
  wire  _T_451 = ~stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 154:68]
  wire  _T_453 = _T_451 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 154:88]
  wire [7:0] _T_456 = _T_453 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 154:67]
  wire  _T_460 = _T_451 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 155:29]
  wire [7:0] _T_463 = _T_460 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 155:8]
  wire [7:0] datain3_2 = sel_lo[2] ? _T_456 : _T_463; // @[el2_lsu_stbuf.scala 154:52]
  wire  _T_467 = ~stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 154:68]
  wire  _T_469 = _T_467 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 154:88]
  wire [7:0] _T_472 = _T_469 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 154:67]
  wire  _T_476 = _T_467 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 155:29]
  wire [7:0] _T_479 = _T_476 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 155:8]
  wire [7:0] datain3_3 = sel_lo[3] ? _T_472 : _T_479; // @[el2_lsu_stbuf.scala 154:52]
  wire  _T_483 = ~stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 157:68]
  wire  _T_485 = _T_483 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 157:88]
  wire [7:0] _T_488 = _T_485 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 157:67]
  wire  _T_492 = _T_483 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 158:29]
  wire [7:0] _T_495 = _T_492 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 158:8]
  wire [7:0] datain4_0 = sel_lo[0] ? _T_488 : _T_495; // @[el2_lsu_stbuf.scala 157:52]
  wire  _T_499 = ~stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 157:68]
  wire  _T_501 = _T_499 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 157:88]
  wire [7:0] _T_504 = _T_501 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 157:67]
  wire  _T_508 = _T_499 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 158:29]
  wire [7:0] _T_511 = _T_508 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 158:8]
  wire [7:0] datain4_1 = sel_lo[1] ? _T_504 : _T_511; // @[el2_lsu_stbuf.scala 157:52]
  wire  _T_515 = ~stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 157:68]
  wire  _T_517 = _T_515 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 157:88]
  wire [7:0] _T_520 = _T_517 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 157:67]
  wire  _T_524 = _T_515 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 158:29]
  wire [7:0] _T_527 = _T_524 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 158:8]
  wire [7:0] datain4_2 = sel_lo[2] ? _T_520 : _T_527; // @[el2_lsu_stbuf.scala 157:52]
  wire  _T_531 = ~stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 157:68]
  wire  _T_533 = _T_531 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 157:88]
  wire [7:0] _T_536 = _T_533 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 157:67]
  wire  _T_540 = _T_531 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 158:29]
  wire [7:0] _T_543 = _T_540 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 158:8]
  wire [7:0] datain4_3 = sel_lo[3] ? _T_536 : _T_543; // @[el2_lsu_stbuf.scala 157:52]
  wire [15:0] _T_545 = {datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_546 = {datain4_0,datain3_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_548 = {datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_549 = {datain4_1,datain3_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_551 = {datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_552 = {datain4_2,datain3_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_554 = {datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] _T_555 = {datain4_3,datain3_3}; // @[Cat.scala 29:58]
  wire  _T_560 = stbuf_wr_en[0] | stbuf_vld[0]; // @[el2_lsu_stbuf.scala 164:92]
  wire  _T_568 = stbuf_wr_en[1] | stbuf_vld[1]; // @[el2_lsu_stbuf.scala 164:92]
  wire  _T_576 = stbuf_wr_en[2] | stbuf_vld[2]; // @[el2_lsu_stbuf.scala 164:92]
  wire  _T_584 = stbuf_wr_en[3] | stbuf_vld[3]; // @[el2_lsu_stbuf.scala 164:92]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 206:16]
  wire  _T_789 = stbuf_addr_3[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 212:115]
  wire  _T_791 = _T_789 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 212:139]
  wire  _T_794 = _T_791 & _T_64; // @[el2_lsu_stbuf.scala 212:154]
  wire  _T_795 = _T_794 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 212:175]
  wire  _T_780 = stbuf_addr_2[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 212:115]
  wire  _T_782 = _T_780 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 212:139]
  wire  _T_785 = _T_782 & _T_53; // @[el2_lsu_stbuf.scala 212:154]
  wire  _T_786 = _T_785 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 212:175]
  wire  _T_771 = stbuf_addr_1[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 212:115]
  wire  _T_773 = _T_771 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 212:139]
  wire  _T_776 = _T_773 & _T_42; // @[el2_lsu_stbuf.scala 212:154]
  wire  _T_777 = _T_776 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 212:175]
  wire  _T_762 = stbuf_addr_0[15:2] == cmpaddr_hi_m[13:0]; // @[el2_lsu_stbuf.scala 212:115]
  wire  _T_764 = _T_762 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 212:139]
  wire  _T_767 = _T_764 & _T_31; // @[el2_lsu_stbuf.scala 212:154]
  wire  _T_768 = _T_767 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 212:175]
  wire [3:0] stbuf_match_hi = {_T_795,_T_786,_T_777,_T_768}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 209:17]
  wire  _T_827 = stbuf_addr_3[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 213:115]
  wire  _T_829 = _T_827 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 213:139]
  wire  _T_832 = _T_829 & _T_64; // @[el2_lsu_stbuf.scala 213:154]
  wire  _T_833 = _T_832 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 213:175]
  wire  _T_818 = stbuf_addr_2[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 213:115]
  wire  _T_820 = _T_818 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 213:139]
  wire  _T_823 = _T_820 & _T_53; // @[el2_lsu_stbuf.scala 213:154]
  wire  _T_824 = _T_823 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 213:175]
  wire  _T_809 = stbuf_addr_1[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 213:115]
  wire  _T_811 = _T_809 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 213:139]
  wire  _T_814 = _T_811 & _T_42; // @[el2_lsu_stbuf.scala 213:154]
  wire  _T_815 = _T_814 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 213:175]
  wire  _T_800 = stbuf_addr_0[15:2] == cmpaddr_lo_m[13:0]; // @[el2_lsu_stbuf.scala 213:115]
  wire  _T_802 = _T_800 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 213:139]
  wire  _T_805 = _T_802 & _T_31; // @[el2_lsu_stbuf.scala 213:154]
  wire  _T_806 = _T_805 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 213:175]
  wire [3:0] stbuf_match_lo = {_T_833,_T_824,_T_815,_T_806}; // @[Cat.scala 29:58]
  wire  _T_856 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[el2_lsu_stbuf.scala 214:78]
  wire  _T_857 = _T_856 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 214:99]
  wire  _T_858 = _T_857 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 214:120]
  wire  _T_859 = _T_858 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 214:139]
  wire  _T_850 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[el2_lsu_stbuf.scala 214:78]
  wire  _T_851 = _T_850 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 214:99]
  wire  _T_852 = _T_851 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 214:120]
  wire  _T_853 = _T_852 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 214:139]
  wire  _T_844 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[el2_lsu_stbuf.scala 214:78]
  wire  _T_845 = _T_844 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 214:99]
  wire  _T_846 = _T_845 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 214:120]
  wire  _T_847 = _T_846 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 214:139]
  wire  _T_838 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[el2_lsu_stbuf.scala 214:78]
  wire  _T_839 = _T_838 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 214:99]
  wire  _T_840 = _T_839 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 214:120]
  wire  _T_841 = _T_840 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 214:139]
  wire [3:0] stbuf_dma_kill_en = {_T_859,_T_853,_T_847,_T_841}; // @[Cat.scala 29:58]
  wire  _T_595 = stbuf_dma_kill_en[0] | stbuf_dma_kill[0]; // @[el2_lsu_stbuf.scala 166:96]
  wire  _T_603 = stbuf_dma_kill_en[1] | stbuf_dma_kill[1]; // @[el2_lsu_stbuf.scala 166:96]
  wire  _T_611 = stbuf_dma_kill_en[2] | stbuf_dma_kill[2]; // @[el2_lsu_stbuf.scala 166:96]
  wire  _T_619 = stbuf_dma_kill_en[3] | stbuf_dma_kill[3]; // @[el2_lsu_stbuf.scala 166:96]
  wire [3:0] _T_629 = stbuf_wr_en[0] ? stbuf_byteenin_0 : stbuf_byteen_0; // @[el2_lsu_stbuf.scala 167:96]
  wire [3:0] _T_633 = _T_34 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_638 = stbuf_wr_en[1] ? stbuf_byteenin_1 : stbuf_byteen_1; // @[el2_lsu_stbuf.scala 167:96]
  wire [3:0] _T_642 = _T_45 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_647 = stbuf_wr_en[2] ? stbuf_byteenin_2 : stbuf_byteen_2; // @[el2_lsu_stbuf.scala 167:96]
  wire [3:0] _T_651 = _T_56 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_656 = stbuf_wr_en[3] ? stbuf_byteenin_3 : stbuf_byteen_3; // @[el2_lsu_stbuf.scala 167:96]
  wire [3:0] _T_660 = _T_67 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg  ldst_dual_m; // @[el2_lsu_stbuf.scala 176:52]
  wire [3:0] _T_689 = stbuf_vld >> RdPtr; // @[el2_lsu_stbuf.scala 180:43]
  wire [3:0] _T_691 = stbuf_dma_kill >> RdPtr; // @[el2_lsu_stbuf.scala 180:67]
  wire  _T_698 = ~_T_691[0]; // @[el2_lsu_stbuf.scala 181:46]
  wire  _T_699 = _T_689[0] & _T_698; // @[el2_lsu_stbuf.scala 181:44]
  wire  _T_700 = |stbuf_dma_kill_en; // @[el2_lsu_stbuf.scala 181:91]
  wire  _T_701 = ~_T_700; // @[el2_lsu_stbuf.scala 181:71]
  wire [15:0] _GEN_1 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[el2_lsu_stbuf.scala 182:22]
  wire [15:0] _GEN_2 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_1; // @[el2_lsu_stbuf.scala 182:22]
  wire [31:0] _GEN_5 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[el2_lsu_stbuf.scala 183:22]
  wire [31:0] _GEN_6 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_5; // @[el2_lsu_stbuf.scala 183:22]
  wire  _T_703 = ~dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 185:44]
  wire  _T_704 = io_ldst_stbuf_reqvld_r & _T_703; // @[el2_lsu_stbuf.scala 185:42]
  wire  _T_705 = store_coalesce_hi_r | store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 185:88]
  wire  _T_706 = ~_T_705; // @[el2_lsu_stbuf.scala 185:66]
  wire  _T_707 = _T_704 & _T_706; // @[el2_lsu_stbuf.scala 185:64]
  wire  _T_708 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 186:30]
  wire  _T_709 = store_coalesce_hi_r & store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 186:76]
  wire  _T_710 = ~_T_709; // @[el2_lsu_stbuf.scala 186:54]
  wire  _T_711 = _T_708 & _T_710; // @[el2_lsu_stbuf.scala 186:52]
  wire  WrPtrEn = _T_707 | _T_711; // @[el2_lsu_stbuf.scala 185:113]
  wire  _T_716 = _T_708 & _T_706; // @[el2_lsu_stbuf.scala 187:67]
  wire [3:0] _T_721 = {3'h0,stbuf_vld[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_723 = {3'h0,stbuf_vld[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_725 = {3'h0,stbuf_vld[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_727 = {3'h0,stbuf_vld[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_730 = _T_721 + _T_723; // @[el2_lsu_stbuf.scala 194:101]
  wire [3:0] _T_732 = _T_730 + _T_725; // @[el2_lsu_stbuf.scala 194:101]
  wire [3:0] stbuf_numvld_any = _T_732 + _T_727; // @[el2_lsu_stbuf.scala 194:101]
  wire  _T_734 = io_lsu_pkt_m_valid & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:39]
  wire  _T_735 = _T_734 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 195:60]
  wire  _T_736 = ~io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:82]
  wire  isdccmst_m = _T_735 & _T_736; // @[el2_lsu_stbuf.scala 195:80]
  wire  _T_737 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 196:39]
  wire  _T_738 = _T_737 & io_addr_in_dccm_r; // @[el2_lsu_stbuf.scala 196:60]
  wire  _T_739 = ~io_lsu_pkt_r_dma; // @[el2_lsu_stbuf.scala 196:82]
  wire  isdccmst_r = _T_738 & _T_739; // @[el2_lsu_stbuf.scala 196:80]
  wire [1:0] _T_740 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_741 = isdccmst_m & ldst_dual_m; // @[el2_lsu_stbuf.scala 198:62]
  wire [2:0] _GEN_14 = {{1'd0}, _T_740}; // @[el2_lsu_stbuf.scala 198:47]
  wire [2:0] _T_742 = _GEN_14 << _T_741; // @[el2_lsu_stbuf.scala 198:47]
  wire [1:0] _T_743 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_744 = isdccmst_r & ldst_dual_r; // @[el2_lsu_stbuf.scala 199:62]
  wire [2:0] _GEN_15 = {{1'd0}, _T_743}; // @[el2_lsu_stbuf.scala 199:47]
  wire [2:0] _T_745 = _GEN_15 << _T_744; // @[el2_lsu_stbuf.scala 199:47]
  wire [1:0] stbuf_specvld_m = _T_742[1:0]; // @[el2_lsu_stbuf.scala 198:19]
  wire [3:0] _T_746 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_748 = stbuf_numvld_any + _T_746; // @[el2_lsu_stbuf.scala 200:44]
  wire [1:0] stbuf_specvld_r = _T_745[1:0]; // @[el2_lsu_stbuf.scala 199:19]
  wire [3:0] _T_749 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_748 + _T_749; // @[el2_lsu_stbuf.scala 200:78]
  wire  _T_751 = ~ldst_dual_d; // @[el2_lsu_stbuf.scala 202:34]
  wire  _T_752 = _T_751 & io_dec_lsu_valid_raw_d; // @[el2_lsu_stbuf.scala 202:47]
  wire  _T_754 = stbuf_specvld_any >= 4'h4; // @[el2_lsu_stbuf.scala 202:99]
  wire  _T_755 = stbuf_specvld_any >= 4'h3; // @[el2_lsu_stbuf.scala 202:140]
  wire  _T_865 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_0 = _T_865 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_869 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_1 = _T_869 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_873 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_2 = _T_873 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_877 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_3 = _T_877 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_881 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_0 = _T_881 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_885 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_1 = _T_885 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_889 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_2 = _T_889 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_893 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_3 = _T_893 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_897 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_0 = _T_897 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_901 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_1 = _T_901 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_905 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_2 = _T_905 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_909 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_3 = _T_909 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_913 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_0 = _T_913 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_917 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_1 = _T_917 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_921 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_2 = _T_921 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_925 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_3 = _T_925 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 217:137]
  wire  _T_929 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_0 = _T_929 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_933 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_1 = _T_933 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_937 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_2 = _T_937 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_941 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_3 = _T_941 & stbuf_vld[0]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_945 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_0 = _T_945 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_949 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_1 = _T_949 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_953 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_2 = _T_953 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_957 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_3 = _T_957 & stbuf_vld[1]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_961 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_0 = _T_961 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_965 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_1 = _T_965 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_969 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_2 = _T_969 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_973 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_3 = _T_973 & stbuf_vld[2]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_977 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_0 = _T_977 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_981 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_1 = _T_981 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_985 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_2 = _T_985 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_989 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_3 = _T_989 & stbuf_vld[3]; // @[el2_lsu_stbuf.scala 218:137]
  wire  _T_991 = stbuf_fwdbyteenvec_hi_0_0 | stbuf_fwdbyteenvec_hi_1_0; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_992 = _T_991 | stbuf_fwdbyteenvec_hi_2_0; // @[el2_lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_992 | stbuf_fwdbyteenvec_hi_3_0; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_993 = stbuf_fwdbyteenvec_hi_0_1 | stbuf_fwdbyteenvec_hi_1_1; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_994 = _T_993 | stbuf_fwdbyteenvec_hi_2_1; // @[el2_lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_994 | stbuf_fwdbyteenvec_hi_3_1; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_995 = stbuf_fwdbyteenvec_hi_0_2 | stbuf_fwdbyteenvec_hi_1_2; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_996 = _T_995 | stbuf_fwdbyteenvec_hi_2_2; // @[el2_lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_996 | stbuf_fwdbyteenvec_hi_3_2; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_997 = stbuf_fwdbyteenvec_hi_0_3 | stbuf_fwdbyteenvec_hi_1_3; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_998 = _T_997 | stbuf_fwdbyteenvec_hi_2_3; // @[el2_lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_998 | stbuf_fwdbyteenvec_hi_3_3; // @[el2_lsu_stbuf.scala 219:147]
  wire  _T_999 = stbuf_fwdbyteenvec_lo_0_0 | stbuf_fwdbyteenvec_lo_1_0; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1000 = _T_999 | stbuf_fwdbyteenvec_lo_2_0; // @[el2_lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_1000 | stbuf_fwdbyteenvec_lo_3_0; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1001 = stbuf_fwdbyteenvec_lo_0_1 | stbuf_fwdbyteenvec_lo_1_1; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1002 = _T_1001 | stbuf_fwdbyteenvec_lo_2_1; // @[el2_lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_1002 | stbuf_fwdbyteenvec_lo_3_1; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1003 = stbuf_fwdbyteenvec_lo_0_2 | stbuf_fwdbyteenvec_lo_1_2; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1004 = _T_1003 | stbuf_fwdbyteenvec_lo_2_2; // @[el2_lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_1004 | stbuf_fwdbyteenvec_lo_3_2; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1005 = stbuf_fwdbyteenvec_lo_0_3 | stbuf_fwdbyteenvec_lo_1_3; // @[el2_lsu_stbuf.scala 220:147]
  wire  _T_1006 = _T_1005 | stbuf_fwdbyteenvec_lo_2_3; // @[el2_lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_1006 | stbuf_fwdbyteenvec_lo_3_3; // @[el2_lsu_stbuf.scala 220:147]
  wire [31:0] _T_1009 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1010 = _T_1009 & stbuf_data_0; // @[el2_lsu_stbuf.scala 222:97]
  wire [31:0] _T_1013 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1014 = _T_1013 & stbuf_data_1; // @[el2_lsu_stbuf.scala 222:97]
  wire [31:0] _T_1017 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1018 = _T_1017 & stbuf_data_2; // @[el2_lsu_stbuf.scala 222:97]
  wire [31:0] _T_1021 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1022 = _T_1021 & stbuf_data_3; // @[el2_lsu_stbuf.scala 222:97]
  wire [31:0] _T_1024 = _T_1022 | _T_1018; // @[el2_lsu_stbuf.scala 222:130]
  wire [31:0] _T_1025 = _T_1024 | _T_1014; // @[el2_lsu_stbuf.scala 222:130]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_1025 | _T_1010; // @[el2_lsu_stbuf.scala 222:130]
  wire [31:0] _T_1028 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1029 = _T_1028 & stbuf_data_0; // @[el2_lsu_stbuf.scala 223:97]
  wire [31:0] _T_1032 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1033 = _T_1032 & stbuf_data_1; // @[el2_lsu_stbuf.scala 223:97]
  wire [31:0] _T_1036 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1037 = _T_1036 & stbuf_data_2; // @[el2_lsu_stbuf.scala 223:97]
  wire [31:0] _T_1040 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1041 = _T_1040 & stbuf_data_3; // @[el2_lsu_stbuf.scala 223:97]
  wire [31:0] _T_1043 = _T_1041 | _T_1037; // @[el2_lsu_stbuf.scala 223:130]
  wire [31:0] _T_1044 = _T_1043 | _T_1033; // @[el2_lsu_stbuf.scala 223:130]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1044 | _T_1029; // @[el2_lsu_stbuf.scala 223:130]
  wire  _T_1049 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 230:49]
  wire  _T_1050 = _T_1049 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 230:74]
  wire  _T_1051 = _T_1050 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 230:95]
  wire  ld_addr_rhit_lo_lo = _T_1051 & _T_739; // @[el2_lsu_stbuf.scala 230:116]
  wire  _T_1055 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 231:49]
  wire  _T_1056 = _T_1055 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 231:74]
  wire  _T_1057 = _T_1056 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 231:95]
  wire  ld_addr_rhit_lo_hi = _T_1057 & _T_739; // @[el2_lsu_stbuf.scala 231:116]
  wire  _T_1061 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 232:49]
  wire  _T_1062 = _T_1061 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 232:74]
  wire  _T_1063 = _T_1062 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 232:95]
  wire  _T_1065 = _T_1063 & _T_739; // @[el2_lsu_stbuf.scala 232:116]
  wire  ld_addr_rhit_hi_lo = _T_1065 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 232:136]
  wire  _T_1068 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 233:49]
  wire  _T_1069 = _T_1068 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 233:74]
  wire  _T_1070 = _T_1069 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 233:95]
  wire  _T_1072 = _T_1070 & _T_739; // @[el2_lsu_stbuf.scala 233:116]
  wire  ld_addr_rhit_hi_hi = _T_1072 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 233:136]
  wire  _T_1074 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1076 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1078 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 235:79]
  wire  _T_1080 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 235:79]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_1080,_T_1078,_T_1076,_T_1074}; // @[Cat.scala 29:58]
  wire  _T_1085 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 236:79]
  wire  _T_1087 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 236:79]
  wire  _T_1089 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 236:79]
  wire  _T_1091 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 236:79]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_1091,_T_1089,_T_1087,_T_1085}; // @[Cat.scala 29:58]
  wire  _T_1096 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 237:79]
  wire  _T_1098 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 237:79]
  wire  _T_1100 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 237:79]
  wire  _T_1102 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 237:79]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_1102,_T_1100,_T_1098,_T_1096}; // @[Cat.scala 29:58]
  wire  _T_1107 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 238:79]
  wire  _T_1109 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 238:79]
  wire  _T_1111 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 238:79]
  wire  _T_1113 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 238:79]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_1113,_T_1111,_T_1109,_T_1107}; // @[Cat.scala 29:58]
  wire  _T_1119 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[el2_lsu_stbuf.scala 240:79]
  wire  _T_1122 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[el2_lsu_stbuf.scala 240:79]
  wire  _T_1125 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[el2_lsu_stbuf.scala 240:79]
  wire  _T_1128 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[el2_lsu_stbuf.scala 240:79]
  wire [3:0] ld_byte_rhit_lo = {_T_1128,_T_1125,_T_1122,_T_1119}; // @[Cat.scala 29:58]
  wire  _T_1134 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[el2_lsu_stbuf.scala 241:79]
  wire  _T_1137 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[el2_lsu_stbuf.scala 241:79]
  wire  _T_1140 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[el2_lsu_stbuf.scala 241:79]
  wire  _T_1143 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[el2_lsu_stbuf.scala 241:79]
  wire [3:0] ld_byte_rhit_hi = {_T_1143,_T_1140,_T_1137,_T_1134}; // @[Cat.scala 29:58]
  wire [7:0] _T_1149 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1151 = _T_1149 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 243:53]
  wire [7:0] _T_1154 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1156 = _T_1154 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 243:114]
  wire [7:0] fwdpipe1_lo = _T_1151 | _T_1156; // @[el2_lsu_stbuf.scala 243:80]
  wire [7:0] _T_1159 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1161 = _T_1159 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 244:53]
  wire [7:0] _T_1164 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1166 = _T_1164 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 244:115]
  wire [7:0] fwdpipe2_lo = _T_1161 | _T_1166; // @[el2_lsu_stbuf.scala 244:81]
  wire [7:0] _T_1169 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1171 = _T_1169 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 245:53]
  wire [7:0] _T_1174 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1176 = _T_1174 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 245:116]
  wire [7:0] fwdpipe3_lo = _T_1171 | _T_1176; // @[el2_lsu_stbuf.scala 245:82]
  wire [7:0] _T_1179 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1181 = _T_1179 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 246:53]
  wire [7:0] _T_1184 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1186 = _T_1184 & io_store_data_hi_r[31:24]; // @[el2_lsu_stbuf.scala 246:116]
  wire [7:0] fwdpipe4_lo = _T_1181 | _T_1186; // @[el2_lsu_stbuf.scala 246:82]
  wire [31:0] ld_fwddata_rpipe_lo = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1192 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1194 = _T_1192 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 249:53]
  wire [7:0] _T_1197 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1199 = _T_1197 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 249:114]
  wire [7:0] fwdpipe1_hi = _T_1194 | _T_1199; // @[el2_lsu_stbuf.scala 249:80]
  wire [7:0] _T_1202 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1204 = _T_1202 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 250:53]
  wire [7:0] _T_1207 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1209 = _T_1207 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 250:115]
  wire [7:0] fwdpipe2_hi = _T_1204 | _T_1209; // @[el2_lsu_stbuf.scala 250:81]
  wire [7:0] _T_1212 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1214 = _T_1212 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 251:53]
  wire [7:0] _T_1217 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1219 = _T_1217 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 251:116]
  wire [7:0] fwdpipe3_hi = _T_1214 | _T_1219; // @[el2_lsu_stbuf.scala 251:82]
  wire [7:0] _T_1222 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1224 = _T_1222 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 252:53]
  wire [7:0] _T_1227 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1229 = _T_1227 & io_store_data_hi_r[31:24]; // @[el2_lsu_stbuf.scala 252:116]
  wire [7:0] fwdpipe4_hi = _T_1224 | _T_1229; // @[el2_lsu_stbuf.scala 252:82]
  wire [31:0] ld_fwddata_rpipe_hi = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire  _T_1264 = ld_byte_rhit_hi[0] | stbuf_fwdbyteen_hi_pre_m_0; // @[el2_lsu_stbuf.scala 258:83]
  wire  _T_1266 = ld_byte_rhit_hi[1] | stbuf_fwdbyteen_hi_pre_m_1; // @[el2_lsu_stbuf.scala 258:83]
  wire  _T_1268 = ld_byte_rhit_hi[2] | stbuf_fwdbyteen_hi_pre_m_2; // @[el2_lsu_stbuf.scala 258:83]
  wire  _T_1270 = ld_byte_rhit_hi[3] | stbuf_fwdbyteen_hi_pre_m_3; // @[el2_lsu_stbuf.scala 258:83]
  wire [2:0] _T_1272 = {_T_1270,_T_1268,_T_1266}; // @[Cat.scala 29:58]
  wire  _T_1275 = ld_byte_rhit_lo[0] | stbuf_fwdbyteen_lo_pre_m_0; // @[el2_lsu_stbuf.scala 259:83]
  wire  _T_1277 = ld_byte_rhit_lo[1] | stbuf_fwdbyteen_lo_pre_m_1; // @[el2_lsu_stbuf.scala 259:83]
  wire  _T_1279 = ld_byte_rhit_lo[2] | stbuf_fwdbyteen_lo_pre_m_2; // @[el2_lsu_stbuf.scala 259:83]
  wire  _T_1281 = ld_byte_rhit_lo[3] | stbuf_fwdbyteen_lo_pre_m_3; // @[el2_lsu_stbuf.scala 259:83]
  wire [2:0] _T_1283 = {_T_1281,_T_1279,_T_1277}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[el2_lsu_stbuf.scala 262:30]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[el2_lsu_stbuf.scala 263:30]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[el2_lsu_stbuf.scala 264:30]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[el2_lsu_stbuf.scala 265:30]
  wire [15:0] _T_1297 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1298 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[el2_lsu_stbuf.scala 268:30]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[el2_lsu_stbuf.scala 269:30]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[el2_lsu_stbuf.scala 270:30]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[el2_lsu_stbuf.scala 271:30]
  wire [15:0] _T_1312 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1313 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  assign io_stbuf_reqvld_any = _T_699 & _T_701; // @[el2_lsu_stbuf.scala 52:47 el2_lsu_stbuf.scala 181:24]
  assign io_stbuf_reqvld_flushed_any = _T_689[0] & _T_691[0]; // @[el2_lsu_stbuf.scala 53:35 el2_lsu_stbuf.scala 180:31]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_2; // @[el2_lsu_stbuf.scala 54:35 el2_lsu_stbuf.scala 182:22]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_6; // @[el2_lsu_stbuf.scala 55:35 el2_lsu_stbuf.scala 183:22]
  assign io_lsu_stbuf_full_any = _T_752 ? _T_754 : _T_755; // @[el2_lsu_stbuf.scala 56:43 el2_lsu_stbuf.scala 202:26]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[el2_lsu_stbuf.scala 57:43 el2_lsu_stbuf.scala 203:26]
  assign io_ldst_stbuf_reqvld_r = io_lsu_commit_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 58:43 el2_lsu_stbuf.scala 129:26]
  assign io_stbuf_fwddata_hi_m = {_T_1313,_T_1312}; // @[el2_lsu_stbuf.scala 59:43 el2_lsu_stbuf.scala 272:25]
  assign io_stbuf_fwddata_lo_m = {_T_1298,_T_1297}; // @[el2_lsu_stbuf.scala 60:43 el2_lsu_stbuf.scala 266:25]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1272,_T_1264}; // @[el2_lsu_stbuf.scala 61:37 el2_lsu_stbuf.scala 258:27]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1283,_T_1275}; // @[el2_lsu_stbuf.scala 62:37 el2_lsu_stbuf.scala 259:27]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_io_en = stbuf_wr_en[0]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_1_io_en = stbuf_wr_en[0]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_2_io_en = stbuf_wr_en[1]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_3_io_en = stbuf_wr_en[1]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_4_io_en = stbuf_wr_en[2]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_5_io_en = stbuf_wr_en[2]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_6_io_en = stbuf_wr_en[3]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_7_io_en = stbuf_wr_en[3]; // @[el2_lib.scala 509:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
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
module el2_lsu_ecc(
  input         clock,
  input         reset,
  input         io_lsu_c2_r_clk,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_valid,
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  _T_96 = ^io_dccm_rdata_hi_m; // @[el2_lib.scala 331:30]
  wire  _T_97 = ^io_dccm_data_ecc_hi_m; // @[el2_lib.scala 331:44]
  wire  _T_98 = _T_96 ^ _T_97; // @[el2_lib.scala 331:35]
  wire [5:0] _T_106 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[26]}; // @[el2_lib.scala 331:76]
  wire  _T_107 = ^_T_106; // @[el2_lib.scala 331:83]
  wire  _T_108 = io_dccm_data_ecc_hi_m[5] ^ _T_107; // @[el2_lib.scala 331:71]
  wire [6:0] _T_115 = {io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[11]}; // @[el2_lib.scala 331:103]
  wire [14:0] _T_123 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_115}; // @[el2_lib.scala 331:103]
  wire  _T_124 = ^_T_123; // @[el2_lib.scala 331:110]
  wire  _T_125 = io_dccm_data_ecc_hi_m[4] ^ _T_124; // @[el2_lib.scala 331:98]
  wire [6:0] _T_132 = {io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[4]}; // @[el2_lib.scala 331:130]
  wire [14:0] _T_140 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_132}; // @[el2_lib.scala 331:130]
  wire  _T_141 = ^_T_140; // @[el2_lib.scala 331:137]
  wire  _T_142 = io_dccm_data_ecc_hi_m[3] ^ _T_141; // @[el2_lib.scala 331:125]
  wire [8:0] _T_151 = {io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[1]}; // @[el2_lib.scala 331:157]
  wire [17:0] _T_160 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_151}; // @[el2_lib.scala 331:157]
  wire  _T_161 = ^_T_160; // @[el2_lib.scala 331:164]
  wire  _T_162 = io_dccm_data_ecc_hi_m[2] ^ _T_161; // @[el2_lib.scala 331:152]
  wire [8:0] _T_171 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 331:184]
  wire [17:0] _T_180 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_171}; // @[el2_lib.scala 331:184]
  wire  _T_181 = ^_T_180; // @[el2_lib.scala 331:191]
  wire  _T_182 = io_dccm_data_ecc_hi_m[1] ^ _T_181; // @[el2_lib.scala 331:179]
  wire [8:0] _T_191 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[11],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[4],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[1],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 331:211]
  wire [17:0] _T_200 = {io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[26],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[15],_T_191}; // @[el2_lib.scala 331:211]
  wire  _T_201 = ^_T_200; // @[el2_lib.scala 331:218]
  wire  _T_202 = io_dccm_data_ecc_hi_m[0] ^ _T_201; // @[el2_lib.scala 331:206]
  wire [6:0] _T_208 = {_T_98,_T_108,_T_125,_T_142,_T_162,_T_182,_T_202}; // @[Cat.scala 29:58]
  wire  _T_209 = _T_208 != 7'h0; // @[el2_lib.scala 332:44]
  wire  _T_1131 = ~io_dec_tlu_core_ecc_disable; // @[el2_lsu_ecc.scala 107:68]
  wire  _T_1138 = io_lsu_pkt_m_load | io_lsu_pkt_m_store; // @[el2_lsu_ecc.scala 125:60]
  wire  _T_1139 = io_lsu_pkt_m_valid & _T_1138; // @[el2_lsu_ecc.scala 125:39]
  wire  _T_1140 = _T_1139 & io_addr_in_dccm_m; // @[el2_lsu_ecc.scala 125:82]
  wire  is_ldst_m = _T_1140 & io_lsu_dccm_rden_m; // @[el2_lsu_ecc.scala 125:102]
  wire  ldst_dual_m = io_lsu_addr_m[2] != io_end_addr_m[2]; // @[el2_lsu_ecc.scala 124:39]
  wire  _T_1144 = ldst_dual_m | io_lsu_pkt_m_dma; // @[el2_lsu_ecc.scala 127:48]
  wire  _T_1145 = is_ldst_m & _T_1144; // @[el2_lsu_ecc.scala 127:33]
  wire  is_ldst_hi_m = _T_1145 & _T_1131; // @[el2_lsu_ecc.scala 127:68]
  wire  _T_210 = is_ldst_hi_m & _T_209; // @[el2_lib.scala 332:32]
  wire  single_ecc_error_hi_any = _T_210 & _T_208[6]; // @[el2_lib.scala 332:53]
  wire  _T_215 = ~_T_208[6]; // @[el2_lib.scala 333:55]
  wire  double_ecc_error_hi_any = _T_210 & _T_215; // @[el2_lib.scala 333:53]
  wire  _T_218 = _T_208[5:0] == 6'h1; // @[el2_lib.scala 337:41]
  wire  _T_220 = _T_208[5:0] == 6'h2; // @[el2_lib.scala 337:41]
  wire  _T_222 = _T_208[5:0] == 6'h3; // @[el2_lib.scala 337:41]
  wire  _T_224 = _T_208[5:0] == 6'h4; // @[el2_lib.scala 337:41]
  wire  _T_226 = _T_208[5:0] == 6'h5; // @[el2_lib.scala 337:41]
  wire  _T_228 = _T_208[5:0] == 6'h6; // @[el2_lib.scala 337:41]
  wire  _T_230 = _T_208[5:0] == 6'h7; // @[el2_lib.scala 337:41]
  wire  _T_232 = _T_208[5:0] == 6'h8; // @[el2_lib.scala 337:41]
  wire  _T_234 = _T_208[5:0] == 6'h9; // @[el2_lib.scala 337:41]
  wire  _T_236 = _T_208[5:0] == 6'ha; // @[el2_lib.scala 337:41]
  wire  _T_238 = _T_208[5:0] == 6'hb; // @[el2_lib.scala 337:41]
  wire  _T_240 = _T_208[5:0] == 6'hc; // @[el2_lib.scala 337:41]
  wire  _T_242 = _T_208[5:0] == 6'hd; // @[el2_lib.scala 337:41]
  wire  _T_244 = _T_208[5:0] == 6'he; // @[el2_lib.scala 337:41]
  wire  _T_246 = _T_208[5:0] == 6'hf; // @[el2_lib.scala 337:41]
  wire  _T_248 = _T_208[5:0] == 6'h10; // @[el2_lib.scala 337:41]
  wire  _T_250 = _T_208[5:0] == 6'h11; // @[el2_lib.scala 337:41]
  wire  _T_252 = _T_208[5:0] == 6'h12; // @[el2_lib.scala 337:41]
  wire  _T_254 = _T_208[5:0] == 6'h13; // @[el2_lib.scala 337:41]
  wire  _T_256 = _T_208[5:0] == 6'h14; // @[el2_lib.scala 337:41]
  wire  _T_258 = _T_208[5:0] == 6'h15; // @[el2_lib.scala 337:41]
  wire  _T_260 = _T_208[5:0] == 6'h16; // @[el2_lib.scala 337:41]
  wire  _T_262 = _T_208[5:0] == 6'h17; // @[el2_lib.scala 337:41]
  wire  _T_264 = _T_208[5:0] == 6'h18; // @[el2_lib.scala 337:41]
  wire  _T_266 = _T_208[5:0] == 6'h19; // @[el2_lib.scala 337:41]
  wire  _T_268 = _T_208[5:0] == 6'h1a; // @[el2_lib.scala 337:41]
  wire  _T_270 = _T_208[5:0] == 6'h1b; // @[el2_lib.scala 337:41]
  wire  _T_272 = _T_208[5:0] == 6'h1c; // @[el2_lib.scala 337:41]
  wire  _T_274 = _T_208[5:0] == 6'h1d; // @[el2_lib.scala 337:41]
  wire  _T_276 = _T_208[5:0] == 6'h1e; // @[el2_lib.scala 337:41]
  wire  _T_278 = _T_208[5:0] == 6'h1f; // @[el2_lib.scala 337:41]
  wire  _T_280 = _T_208[5:0] == 6'h20; // @[el2_lib.scala 337:41]
  wire  _T_282 = _T_208[5:0] == 6'h21; // @[el2_lib.scala 337:41]
  wire  _T_284 = _T_208[5:0] == 6'h22; // @[el2_lib.scala 337:41]
  wire  _T_286 = _T_208[5:0] == 6'h23; // @[el2_lib.scala 337:41]
  wire  _T_288 = _T_208[5:0] == 6'h24; // @[el2_lib.scala 337:41]
  wire  _T_290 = _T_208[5:0] == 6'h25; // @[el2_lib.scala 337:41]
  wire  _T_292 = _T_208[5:0] == 6'h26; // @[el2_lib.scala 337:41]
  wire  _T_294 = _T_208[5:0] == 6'h27; // @[el2_lib.scala 337:41]
  wire [7:0] _T_309 = {io_dccm_data_ecc_hi_m[3],io_dccm_rdata_hi_m[3:1],io_dccm_data_ecc_hi_m[2],io_dccm_rdata_hi_m[0],io_dccm_data_ecc_hi_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_315 = {io_dccm_data_ecc_hi_m[6],io_dccm_rdata_hi_m[31:26],io_dccm_data_ecc_hi_m[5],io_dccm_rdata_hi_m[25:11],io_dccm_data_ecc_hi_m[4],io_dccm_rdata_hi_m[10:4],_T_309}; // @[Cat.scala 29:58]
  wire [9:0] _T_333 = {_T_254,_T_252,_T_250,_T_248,_T_246,_T_244,_T_242,_T_240,_T_238,_T_236}; // @[el2_lib.scala 340:69]
  wire [18:0] _T_334 = {_T_333,_T_234,_T_232,_T_230,_T_228,_T_226,_T_224,_T_222,_T_220,_T_218}; // @[el2_lib.scala 340:69]
  wire [9:0] _T_343 = {_T_274,_T_272,_T_270,_T_268,_T_266,_T_264,_T_262,_T_260,_T_258,_T_256}; // @[el2_lib.scala 340:69]
  wire [9:0] _T_352 = {_T_294,_T_292,_T_290,_T_288,_T_286,_T_284,_T_282,_T_280,_T_278,_T_276}; // @[el2_lib.scala 340:69]
  wire [38:0] _T_354 = {_T_352,_T_343,_T_334}; // @[el2_lib.scala 340:69]
  wire [38:0] _T_355 = _T_354 ^ _T_315; // @[el2_lib.scala 340:76]
  wire [38:0] _T_356 = single_ecc_error_hi_any ? _T_355 : _T_315; // @[el2_lib.scala 340:31]
  wire [3:0] _T_362 = {_T_356[6:4],_T_356[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_364 = {_T_356[37:32],_T_356[30:16],_T_356[14:8]}; // @[Cat.scala 29:58]
  wire  _T_474 = ^io_dccm_rdata_lo_m; // @[el2_lib.scala 331:30]
  wire  _T_475 = ^io_dccm_data_ecc_lo_m; // @[el2_lib.scala 331:44]
  wire  _T_476 = _T_474 ^ _T_475; // @[el2_lib.scala 331:35]
  wire [5:0] _T_484 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[26]}; // @[el2_lib.scala 331:76]
  wire  _T_485 = ^_T_484; // @[el2_lib.scala 331:83]
  wire  _T_486 = io_dccm_data_ecc_lo_m[5] ^ _T_485; // @[el2_lib.scala 331:71]
  wire [6:0] _T_493 = {io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[11]}; // @[el2_lib.scala 331:103]
  wire [14:0] _T_501 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_493}; // @[el2_lib.scala 331:103]
  wire  _T_502 = ^_T_501; // @[el2_lib.scala 331:110]
  wire  _T_503 = io_dccm_data_ecc_lo_m[4] ^ _T_502; // @[el2_lib.scala 331:98]
  wire [6:0] _T_510 = {io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[4]}; // @[el2_lib.scala 331:130]
  wire [14:0] _T_518 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_510}; // @[el2_lib.scala 331:130]
  wire  _T_519 = ^_T_518; // @[el2_lib.scala 331:137]
  wire  _T_520 = io_dccm_data_ecc_lo_m[3] ^ _T_519; // @[el2_lib.scala 331:125]
  wire [8:0] _T_529 = {io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[1]}; // @[el2_lib.scala 331:157]
  wire [17:0] _T_538 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_529}; // @[el2_lib.scala 331:157]
  wire  _T_539 = ^_T_538; // @[el2_lib.scala 331:164]
  wire  _T_540 = io_dccm_data_ecc_lo_m[2] ^ _T_539; // @[el2_lib.scala 331:152]
  wire [8:0] _T_549 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 331:184]
  wire [17:0] _T_558 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_549}; // @[el2_lib.scala 331:184]
  wire  _T_559 = ^_T_558; // @[el2_lib.scala 331:191]
  wire  _T_560 = io_dccm_data_ecc_lo_m[1] ^ _T_559; // @[el2_lib.scala 331:179]
  wire [8:0] _T_569 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[11],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[4],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[1],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 331:211]
  wire [17:0] _T_578 = {io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[26],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[15],_T_569}; // @[el2_lib.scala 331:211]
  wire  _T_579 = ^_T_578; // @[el2_lib.scala 331:218]
  wire  _T_580 = io_dccm_data_ecc_lo_m[0] ^ _T_579; // @[el2_lib.scala 331:206]
  wire [6:0] _T_586 = {_T_476,_T_486,_T_503,_T_520,_T_540,_T_560,_T_580}; // @[Cat.scala 29:58]
  wire  _T_587 = _T_586 != 7'h0; // @[el2_lib.scala 332:44]
  wire  is_ldst_lo_m = is_ldst_m & _T_1131; // @[el2_lsu_ecc.scala 126:33]
  wire  _T_588 = is_ldst_lo_m & _T_587; // @[el2_lib.scala 332:32]
  wire  single_ecc_error_lo_any = _T_588 & _T_586[6]; // @[el2_lib.scala 332:53]
  wire  _T_593 = ~_T_586[6]; // @[el2_lib.scala 333:55]
  wire  double_ecc_error_lo_any = _T_588 & _T_593; // @[el2_lib.scala 333:53]
  wire  _T_596 = _T_586[5:0] == 6'h1; // @[el2_lib.scala 337:41]
  wire  _T_598 = _T_586[5:0] == 6'h2; // @[el2_lib.scala 337:41]
  wire  _T_600 = _T_586[5:0] == 6'h3; // @[el2_lib.scala 337:41]
  wire  _T_602 = _T_586[5:0] == 6'h4; // @[el2_lib.scala 337:41]
  wire  _T_604 = _T_586[5:0] == 6'h5; // @[el2_lib.scala 337:41]
  wire  _T_606 = _T_586[5:0] == 6'h6; // @[el2_lib.scala 337:41]
  wire  _T_608 = _T_586[5:0] == 6'h7; // @[el2_lib.scala 337:41]
  wire  _T_610 = _T_586[5:0] == 6'h8; // @[el2_lib.scala 337:41]
  wire  _T_612 = _T_586[5:0] == 6'h9; // @[el2_lib.scala 337:41]
  wire  _T_614 = _T_586[5:0] == 6'ha; // @[el2_lib.scala 337:41]
  wire  _T_616 = _T_586[5:0] == 6'hb; // @[el2_lib.scala 337:41]
  wire  _T_618 = _T_586[5:0] == 6'hc; // @[el2_lib.scala 337:41]
  wire  _T_620 = _T_586[5:0] == 6'hd; // @[el2_lib.scala 337:41]
  wire  _T_622 = _T_586[5:0] == 6'he; // @[el2_lib.scala 337:41]
  wire  _T_624 = _T_586[5:0] == 6'hf; // @[el2_lib.scala 337:41]
  wire  _T_626 = _T_586[5:0] == 6'h10; // @[el2_lib.scala 337:41]
  wire  _T_628 = _T_586[5:0] == 6'h11; // @[el2_lib.scala 337:41]
  wire  _T_630 = _T_586[5:0] == 6'h12; // @[el2_lib.scala 337:41]
  wire  _T_632 = _T_586[5:0] == 6'h13; // @[el2_lib.scala 337:41]
  wire  _T_634 = _T_586[5:0] == 6'h14; // @[el2_lib.scala 337:41]
  wire  _T_636 = _T_586[5:0] == 6'h15; // @[el2_lib.scala 337:41]
  wire  _T_638 = _T_586[5:0] == 6'h16; // @[el2_lib.scala 337:41]
  wire  _T_640 = _T_586[5:0] == 6'h17; // @[el2_lib.scala 337:41]
  wire  _T_642 = _T_586[5:0] == 6'h18; // @[el2_lib.scala 337:41]
  wire  _T_644 = _T_586[5:0] == 6'h19; // @[el2_lib.scala 337:41]
  wire  _T_646 = _T_586[5:0] == 6'h1a; // @[el2_lib.scala 337:41]
  wire  _T_648 = _T_586[5:0] == 6'h1b; // @[el2_lib.scala 337:41]
  wire  _T_650 = _T_586[5:0] == 6'h1c; // @[el2_lib.scala 337:41]
  wire  _T_652 = _T_586[5:0] == 6'h1d; // @[el2_lib.scala 337:41]
  wire  _T_654 = _T_586[5:0] == 6'h1e; // @[el2_lib.scala 337:41]
  wire  _T_656 = _T_586[5:0] == 6'h1f; // @[el2_lib.scala 337:41]
  wire  _T_658 = _T_586[5:0] == 6'h20; // @[el2_lib.scala 337:41]
  wire  _T_660 = _T_586[5:0] == 6'h21; // @[el2_lib.scala 337:41]
  wire  _T_662 = _T_586[5:0] == 6'h22; // @[el2_lib.scala 337:41]
  wire  _T_664 = _T_586[5:0] == 6'h23; // @[el2_lib.scala 337:41]
  wire  _T_666 = _T_586[5:0] == 6'h24; // @[el2_lib.scala 337:41]
  wire  _T_668 = _T_586[5:0] == 6'h25; // @[el2_lib.scala 337:41]
  wire  _T_670 = _T_586[5:0] == 6'h26; // @[el2_lib.scala 337:41]
  wire  _T_672 = _T_586[5:0] == 6'h27; // @[el2_lib.scala 337:41]
  wire [7:0] _T_687 = {io_dccm_data_ecc_lo_m[3],io_dccm_rdata_lo_m[3:1],io_dccm_data_ecc_lo_m[2],io_dccm_rdata_lo_m[0],io_dccm_data_ecc_lo_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_693 = {io_dccm_data_ecc_lo_m[6],io_dccm_rdata_lo_m[31:26],io_dccm_data_ecc_lo_m[5],io_dccm_rdata_lo_m[25:11],io_dccm_data_ecc_lo_m[4],io_dccm_rdata_lo_m[10:4],_T_687}; // @[Cat.scala 29:58]
  wire [9:0] _T_711 = {_T_632,_T_630,_T_628,_T_626,_T_624,_T_622,_T_620,_T_618,_T_616,_T_614}; // @[el2_lib.scala 340:69]
  wire [18:0] _T_712 = {_T_711,_T_612,_T_610,_T_608,_T_606,_T_604,_T_602,_T_600,_T_598,_T_596}; // @[el2_lib.scala 340:69]
  wire [9:0] _T_721 = {_T_652,_T_650,_T_648,_T_646,_T_644,_T_642,_T_640,_T_638,_T_636,_T_634}; // @[el2_lib.scala 340:69]
  wire [9:0] _T_730 = {_T_672,_T_670,_T_668,_T_666,_T_664,_T_662,_T_660,_T_658,_T_656,_T_654}; // @[el2_lib.scala 340:69]
  wire [38:0] _T_732 = {_T_730,_T_721,_T_712}; // @[el2_lib.scala 340:69]
  wire [38:0] _T_733 = _T_732 ^ _T_693; // @[el2_lib.scala 340:76]
  wire [38:0] _T_734 = single_ecc_error_lo_any ? _T_733 : _T_693; // @[el2_lib.scala 340:31]
  wire [3:0] _T_740 = {_T_734[6:4],_T_734[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_742 = {_T_734[37:32],_T_734[30:16],_T_734[14:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1158 = io_dma_dccm_wen ? io_dma_dccm_wdata_lo : io_stbuf_data_any; // @[el2_lsu_ecc.scala 149:87]
  wire [31:0] dccm_wdata_lo_any = io_ld_single_ecc_error_r_ff ? io_sec_data_lo_r_ff : _T_1158; // @[el2_lsu_ecc.scala 149:27]
  wire  _T_774 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[1]; // @[el2_lib.scala 257:74]
  wire  _T_775 = _T_774 ^ dccm_wdata_lo_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_776 = _T_775 ^ dccm_wdata_lo_any[4]; // @[el2_lib.scala 257:74]
  wire  _T_777 = _T_776 ^ dccm_wdata_lo_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_778 = _T_777 ^ dccm_wdata_lo_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_779 = _T_778 ^ dccm_wdata_lo_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_780 = _T_779 ^ dccm_wdata_lo_any[11]; // @[el2_lib.scala 257:74]
  wire  _T_781 = _T_780 ^ dccm_wdata_lo_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_782 = _T_781 ^ dccm_wdata_lo_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_783 = _T_782 ^ dccm_wdata_lo_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_784 = _T_783 ^ dccm_wdata_lo_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_785 = _T_784 ^ dccm_wdata_lo_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_786 = _T_785 ^ dccm_wdata_lo_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_787 = _T_786 ^ dccm_wdata_lo_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_788 = _T_787 ^ dccm_wdata_lo_any[26]; // @[el2_lib.scala 257:74]
  wire  _T_789 = _T_788 ^ dccm_wdata_lo_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_790 = _T_789 ^ dccm_wdata_lo_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_809 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[2]; // @[el2_lib.scala 257:74]
  wire  _T_810 = _T_809 ^ dccm_wdata_lo_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_811 = _T_810 ^ dccm_wdata_lo_any[5]; // @[el2_lib.scala 257:74]
  wire  _T_812 = _T_811 ^ dccm_wdata_lo_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_813 = _T_812 ^ dccm_wdata_lo_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_814 = _T_813 ^ dccm_wdata_lo_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_815 = _T_814 ^ dccm_wdata_lo_any[12]; // @[el2_lib.scala 257:74]
  wire  _T_816 = _T_815 ^ dccm_wdata_lo_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_817 = _T_816 ^ dccm_wdata_lo_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_818 = _T_817 ^ dccm_wdata_lo_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_819 = _T_818 ^ dccm_wdata_lo_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_820 = _T_819 ^ dccm_wdata_lo_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_821 = _T_820 ^ dccm_wdata_lo_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_822 = _T_821 ^ dccm_wdata_lo_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_823 = _T_822 ^ dccm_wdata_lo_any[27]; // @[el2_lib.scala 257:74]
  wire  _T_824 = _T_823 ^ dccm_wdata_lo_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_825 = _T_824 ^ dccm_wdata_lo_any[31]; // @[el2_lib.scala 257:74]
  wire  _T_844 = dccm_wdata_lo_any[1] ^ dccm_wdata_lo_any[2]; // @[el2_lib.scala 257:74]
  wire  _T_845 = _T_844 ^ dccm_wdata_lo_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_846 = _T_845 ^ dccm_wdata_lo_any[7]; // @[el2_lib.scala 257:74]
  wire  _T_847 = _T_846 ^ dccm_wdata_lo_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_848 = _T_847 ^ dccm_wdata_lo_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_849 = _T_848 ^ dccm_wdata_lo_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_850 = _T_849 ^ dccm_wdata_lo_any[14]; // @[el2_lib.scala 257:74]
  wire  _T_851 = _T_850 ^ dccm_wdata_lo_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_852 = _T_851 ^ dccm_wdata_lo_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_853 = _T_852 ^ dccm_wdata_lo_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_854 = _T_853 ^ dccm_wdata_lo_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_855 = _T_854 ^ dccm_wdata_lo_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_856 = _T_855 ^ dccm_wdata_lo_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_857 = _T_856 ^ dccm_wdata_lo_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_858 = _T_857 ^ dccm_wdata_lo_any[29]; // @[el2_lib.scala 257:74]
  wire  _T_859 = _T_858 ^ dccm_wdata_lo_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_860 = _T_859 ^ dccm_wdata_lo_any[31]; // @[el2_lib.scala 257:74]
  wire  _T_876 = dccm_wdata_lo_any[4] ^ dccm_wdata_lo_any[5]; // @[el2_lib.scala 257:74]
  wire  _T_877 = _T_876 ^ dccm_wdata_lo_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_878 = _T_877 ^ dccm_wdata_lo_any[7]; // @[el2_lib.scala 257:74]
  wire  _T_879 = _T_878 ^ dccm_wdata_lo_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_880 = _T_879 ^ dccm_wdata_lo_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_881 = _T_880 ^ dccm_wdata_lo_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_882 = _T_881 ^ dccm_wdata_lo_any[18]; // @[el2_lib.scala 257:74]
  wire  _T_883 = _T_882 ^ dccm_wdata_lo_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_884 = _T_883 ^ dccm_wdata_lo_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_885 = _T_884 ^ dccm_wdata_lo_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_886 = _T_885 ^ dccm_wdata_lo_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_887 = _T_886 ^ dccm_wdata_lo_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_888 = _T_887 ^ dccm_wdata_lo_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_889 = _T_888 ^ dccm_wdata_lo_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_905 = dccm_wdata_lo_any[11] ^ dccm_wdata_lo_any[12]; // @[el2_lib.scala 257:74]
  wire  _T_906 = _T_905 ^ dccm_wdata_lo_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_907 = _T_906 ^ dccm_wdata_lo_any[14]; // @[el2_lib.scala 257:74]
  wire  _T_908 = _T_907 ^ dccm_wdata_lo_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_909 = _T_908 ^ dccm_wdata_lo_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_910 = _T_909 ^ dccm_wdata_lo_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_911 = _T_910 ^ dccm_wdata_lo_any[18]; // @[el2_lib.scala 257:74]
  wire  _T_912 = _T_911 ^ dccm_wdata_lo_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_913 = _T_912 ^ dccm_wdata_lo_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_914 = _T_913 ^ dccm_wdata_lo_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_915 = _T_914 ^ dccm_wdata_lo_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_916 = _T_915 ^ dccm_wdata_lo_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_917 = _T_916 ^ dccm_wdata_lo_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_918 = _T_917 ^ dccm_wdata_lo_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_925 = dccm_wdata_lo_any[26] ^ dccm_wdata_lo_any[27]; // @[el2_lib.scala 257:74]
  wire  _T_926 = _T_925 ^ dccm_wdata_lo_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_927 = _T_926 ^ dccm_wdata_lo_any[29]; // @[el2_lib.scala 257:74]
  wire  _T_928 = _T_927 ^ dccm_wdata_lo_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_929 = _T_928 ^ dccm_wdata_lo_any[31]; // @[el2_lib.scala 257:74]
  wire [5:0] _T_934 = {_T_929,_T_918,_T_889,_T_860,_T_825,_T_790}; // @[Cat.scala 29:58]
  wire  _T_935 = ^dccm_wdata_lo_any; // @[el2_lib.scala 265:13]
  wire  _T_936 = ^_T_934; // @[el2_lib.scala 265:23]
  wire  _T_937 = _T_935 ^ _T_936; // @[el2_lib.scala 265:18]
  wire [31:0] _T_1162 = io_dma_dccm_wen ? io_dma_dccm_wdata_hi : io_stbuf_data_any; // @[el2_lsu_ecc.scala 150:87]
  wire [31:0] dccm_wdata_hi_any = io_ld_single_ecc_error_r_ff ? io_sec_data_hi_r_ff : _T_1162; // @[el2_lsu_ecc.scala 150:27]
  wire  _T_956 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[1]; // @[el2_lib.scala 257:74]
  wire  _T_957 = _T_956 ^ dccm_wdata_hi_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_958 = _T_957 ^ dccm_wdata_hi_any[4]; // @[el2_lib.scala 257:74]
  wire  _T_959 = _T_958 ^ dccm_wdata_hi_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_960 = _T_959 ^ dccm_wdata_hi_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_961 = _T_960 ^ dccm_wdata_hi_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_962 = _T_961 ^ dccm_wdata_hi_any[11]; // @[el2_lib.scala 257:74]
  wire  _T_963 = _T_962 ^ dccm_wdata_hi_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_964 = _T_963 ^ dccm_wdata_hi_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_965 = _T_964 ^ dccm_wdata_hi_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_966 = _T_965 ^ dccm_wdata_hi_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_967 = _T_966 ^ dccm_wdata_hi_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_968 = _T_967 ^ dccm_wdata_hi_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_969 = _T_968 ^ dccm_wdata_hi_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_970 = _T_969 ^ dccm_wdata_hi_any[26]; // @[el2_lib.scala 257:74]
  wire  _T_971 = _T_970 ^ dccm_wdata_hi_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_972 = _T_971 ^ dccm_wdata_hi_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_991 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[2]; // @[el2_lib.scala 257:74]
  wire  _T_992 = _T_991 ^ dccm_wdata_hi_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_993 = _T_992 ^ dccm_wdata_hi_any[5]; // @[el2_lib.scala 257:74]
  wire  _T_994 = _T_993 ^ dccm_wdata_hi_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_995 = _T_994 ^ dccm_wdata_hi_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_996 = _T_995 ^ dccm_wdata_hi_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_997 = _T_996 ^ dccm_wdata_hi_any[12]; // @[el2_lib.scala 257:74]
  wire  _T_998 = _T_997 ^ dccm_wdata_hi_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_999 = _T_998 ^ dccm_wdata_hi_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_1000 = _T_999 ^ dccm_wdata_hi_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_1001 = _T_1000 ^ dccm_wdata_hi_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_1002 = _T_1001 ^ dccm_wdata_hi_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_1003 = _T_1002 ^ dccm_wdata_hi_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_1004 = _T_1003 ^ dccm_wdata_hi_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_1005 = _T_1004 ^ dccm_wdata_hi_any[27]; // @[el2_lib.scala 257:74]
  wire  _T_1006 = _T_1005 ^ dccm_wdata_hi_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_1007 = _T_1006 ^ dccm_wdata_hi_any[31]; // @[el2_lib.scala 257:74]
  wire  _T_1026 = dccm_wdata_hi_any[1] ^ dccm_wdata_hi_any[2]; // @[el2_lib.scala 257:74]
  wire  _T_1027 = _T_1026 ^ dccm_wdata_hi_any[3]; // @[el2_lib.scala 257:74]
  wire  _T_1028 = _T_1027 ^ dccm_wdata_hi_any[7]; // @[el2_lib.scala 257:74]
  wire  _T_1029 = _T_1028 ^ dccm_wdata_hi_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_1030 = _T_1029 ^ dccm_wdata_hi_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_1031 = _T_1030 ^ dccm_wdata_hi_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_1032 = _T_1031 ^ dccm_wdata_hi_any[14]; // @[el2_lib.scala 257:74]
  wire  _T_1033 = _T_1032 ^ dccm_wdata_hi_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_1034 = _T_1033 ^ dccm_wdata_hi_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_1035 = _T_1034 ^ dccm_wdata_hi_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_1036 = _T_1035 ^ dccm_wdata_hi_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_1037 = _T_1036 ^ dccm_wdata_hi_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_1038 = _T_1037 ^ dccm_wdata_hi_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_1039 = _T_1038 ^ dccm_wdata_hi_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_1040 = _T_1039 ^ dccm_wdata_hi_any[29]; // @[el2_lib.scala 257:74]
  wire  _T_1041 = _T_1040 ^ dccm_wdata_hi_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_1042 = _T_1041 ^ dccm_wdata_hi_any[31]; // @[el2_lib.scala 257:74]
  wire  _T_1058 = dccm_wdata_hi_any[4] ^ dccm_wdata_hi_any[5]; // @[el2_lib.scala 257:74]
  wire  _T_1059 = _T_1058 ^ dccm_wdata_hi_any[6]; // @[el2_lib.scala 257:74]
  wire  _T_1060 = _T_1059 ^ dccm_wdata_hi_any[7]; // @[el2_lib.scala 257:74]
  wire  _T_1061 = _T_1060 ^ dccm_wdata_hi_any[8]; // @[el2_lib.scala 257:74]
  wire  _T_1062 = _T_1061 ^ dccm_wdata_hi_any[9]; // @[el2_lib.scala 257:74]
  wire  _T_1063 = _T_1062 ^ dccm_wdata_hi_any[10]; // @[el2_lib.scala 257:74]
  wire  _T_1064 = _T_1063 ^ dccm_wdata_hi_any[18]; // @[el2_lib.scala 257:74]
  wire  _T_1065 = _T_1064 ^ dccm_wdata_hi_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_1066 = _T_1065 ^ dccm_wdata_hi_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_1067 = _T_1066 ^ dccm_wdata_hi_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_1068 = _T_1067 ^ dccm_wdata_hi_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_1069 = _T_1068 ^ dccm_wdata_hi_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_1070 = _T_1069 ^ dccm_wdata_hi_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_1071 = _T_1070 ^ dccm_wdata_hi_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_1087 = dccm_wdata_hi_any[11] ^ dccm_wdata_hi_any[12]; // @[el2_lib.scala 257:74]
  wire  _T_1088 = _T_1087 ^ dccm_wdata_hi_any[13]; // @[el2_lib.scala 257:74]
  wire  _T_1089 = _T_1088 ^ dccm_wdata_hi_any[14]; // @[el2_lib.scala 257:74]
  wire  _T_1090 = _T_1089 ^ dccm_wdata_hi_any[15]; // @[el2_lib.scala 257:74]
  wire  _T_1091 = _T_1090 ^ dccm_wdata_hi_any[16]; // @[el2_lib.scala 257:74]
  wire  _T_1092 = _T_1091 ^ dccm_wdata_hi_any[17]; // @[el2_lib.scala 257:74]
  wire  _T_1093 = _T_1092 ^ dccm_wdata_hi_any[18]; // @[el2_lib.scala 257:74]
  wire  _T_1094 = _T_1093 ^ dccm_wdata_hi_any[19]; // @[el2_lib.scala 257:74]
  wire  _T_1095 = _T_1094 ^ dccm_wdata_hi_any[20]; // @[el2_lib.scala 257:74]
  wire  _T_1096 = _T_1095 ^ dccm_wdata_hi_any[21]; // @[el2_lib.scala 257:74]
  wire  _T_1097 = _T_1096 ^ dccm_wdata_hi_any[22]; // @[el2_lib.scala 257:74]
  wire  _T_1098 = _T_1097 ^ dccm_wdata_hi_any[23]; // @[el2_lib.scala 257:74]
  wire  _T_1099 = _T_1098 ^ dccm_wdata_hi_any[24]; // @[el2_lib.scala 257:74]
  wire  _T_1100 = _T_1099 ^ dccm_wdata_hi_any[25]; // @[el2_lib.scala 257:74]
  wire  _T_1107 = dccm_wdata_hi_any[26] ^ dccm_wdata_hi_any[27]; // @[el2_lib.scala 257:74]
  wire  _T_1108 = _T_1107 ^ dccm_wdata_hi_any[28]; // @[el2_lib.scala 257:74]
  wire  _T_1109 = _T_1108 ^ dccm_wdata_hi_any[29]; // @[el2_lib.scala 257:74]
  wire  _T_1110 = _T_1109 ^ dccm_wdata_hi_any[30]; // @[el2_lib.scala 257:74]
  wire  _T_1111 = _T_1110 ^ dccm_wdata_hi_any[31]; // @[el2_lib.scala 257:74]
  wire [5:0] _T_1116 = {_T_1111,_T_1100,_T_1071,_T_1042,_T_1007,_T_972}; // @[Cat.scala 29:58]
  wire  _T_1117 = ^dccm_wdata_hi_any; // @[el2_lib.scala 265:13]
  wire  _T_1118 = ^_T_1116; // @[el2_lib.scala 265:23]
  wire  _T_1119 = _T_1117 ^ _T_1118; // @[el2_lib.scala 265:18]
  reg  _T_1150; // @[el2_lsu_ecc.scala 141:72]
  reg  _T_1151; // @[el2_lsu_ecc.scala 142:72]
  reg  _T_1152; // @[el2_lsu_ecc.scala 143:72]
  reg  _T_1153; // @[el2_lsu_ecc.scala 144:72]
  reg [31:0] _T_1154; // @[el2_lsu_ecc.scala 145:72]
  reg [31:0] _T_1155; // @[el2_lsu_ecc.scala 146:72]
  reg [31:0] _T_1164; // @[el2_lib.scala 512:16]
  reg [31:0] _T_1165; // @[el2_lib.scala 512:16]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_sec_data_hi_r = _T_1154; // @[el2_lsu_ecc.scala 114:22 el2_lsu_ecc.scala 145:62]
  assign io_sec_data_lo_r = _T_1155; // @[el2_lsu_ecc.scala 117:25 el2_lsu_ecc.scala 146:62]
  assign io_sec_data_hi_m = {_T_364,_T_362}; // @[el2_lsu_ecc.scala 90:32 el2_lsu_ecc.scala 134:27]
  assign io_sec_data_lo_m = {_T_742,_T_740}; // @[el2_lsu_ecc.scala 91:32 el2_lsu_ecc.scala 136:27]
  assign io_sec_data_hi_r_ff = _T_1164; // @[el2_lsu_ecc.scala 157:23]
  assign io_sec_data_lo_r_ff = _T_1165; // @[el2_lsu_ecc.scala 158:23]
  assign io_dma_dccm_wdata_ecc_hi = {_T_1119,_T_1116}; // @[el2_lsu_ecc.scala 154:28]
  assign io_dma_dccm_wdata_ecc_lo = {_T_937,_T_934}; // @[el2_lsu_ecc.scala 155:28]
  assign io_stbuf_ecc_any = {_T_937,_T_934}; // @[el2_lsu_ecc.scala 153:28]
  assign io_sec_data_ecc_hi_r_ff = {_T_1119,_T_1116}; // @[el2_lsu_ecc.scala 151:28]
  assign io_sec_data_ecc_lo_r_ff = {_T_937,_T_934}; // @[el2_lsu_ecc.scala 152:28]
  assign io_single_ecc_error_hi_r = _T_1153; // @[el2_lsu_ecc.scala 115:31 el2_lsu_ecc.scala 144:62]
  assign io_single_ecc_error_lo_r = _T_1152; // @[el2_lsu_ecc.scala 118:31 el2_lsu_ecc.scala 143:62]
  assign io_lsu_single_ecc_error_r = _T_1150; // @[el2_lsu_ecc.scala 120:31 el2_lsu_ecc.scala 141:62]
  assign io_lsu_double_ecc_error_r = _T_1151; // @[el2_lsu_ecc.scala 121:31 el2_lsu_ecc.scala 142:62]
  assign io_lsu_single_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[el2_lsu_ecc.scala 92:30 el2_lsu_ecc.scala 138:33]
  assign io_lsu_double_ecc_error_m = double_ecc_error_hi_any | double_ecc_error_lo_any; // @[el2_lsu_ecc.scala 93:30 el2_lsu_ecc.scala 139:33]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 509:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[el2_lib.scala 509:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
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
module el2_lsu_trigger(
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_,
  input         io_trigger_pkt_any_0_store,
  input         io_trigger_pkt_any_0_load,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_,
  input         io_trigger_pkt_any_1_store,
  input         io_trigger_pkt_any_1_load,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_,
  input         io_trigger_pkt_any_2_store,
  input         io_trigger_pkt_any_2_load,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_,
  input         io_trigger_pkt_any_3_store,
  input         io_trigger_pkt_any_3_load,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_lsu_pkt_m_half,
  input         io_lsu_pkt_m_word,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_store,
  input         io_lsu_pkt_m_dma,
  input         io_lsu_pkt_m_valid,
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_store_data_m,
  output [3:0]  io_lsu_trigger_match_m
);
  wire [15:0] _T_1 = io_lsu_pkt_m_word ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_3 = _T_1 & io_store_data_m[31:16]; // @[el2_lsu_trigger.scala 16:61]
  wire  _T_4 = io_lsu_pkt_m_half | io_lsu_pkt_m_word; // @[el2_lsu_trigger.scala 16:114]
  wire [7:0] _T_6 = _T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_8 = _T_6 & io_store_data_m[15:8]; // @[el2_lsu_trigger.scala 16:136]
  wire [31:0] store_data_trigger_m = {_T_3,_T_8,io_store_data_m[7:0]}; // @[Cat.scala 29:58]
  wire  _T_12 = ~io_trigger_pkt_any_0_select; // @[el2_lsu_trigger.scala 17:53]
  wire  _T_13 = io_trigger_pkt_any_0_select & io_trigger_pkt_any_0_store; // @[el2_lsu_trigger.scala 17:136]
  wire [31:0] _T_15 = _T_12 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_16 = _T_13 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_0 = _T_15 | _T_16; // @[Mux.scala 27:72]
  wire  _T_19 = ~io_trigger_pkt_any_1_select; // @[el2_lsu_trigger.scala 17:53]
  wire  _T_20 = io_trigger_pkt_any_1_select & io_trigger_pkt_any_1_store; // @[el2_lsu_trigger.scala 17:136]
  wire [31:0] _T_22 = _T_19 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_23 = _T_20 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_1 = _T_22 | _T_23; // @[Mux.scala 27:72]
  wire  _T_26 = ~io_trigger_pkt_any_2_select; // @[el2_lsu_trigger.scala 17:53]
  wire  _T_27 = io_trigger_pkt_any_2_select & io_trigger_pkt_any_2_store; // @[el2_lsu_trigger.scala 17:136]
  wire [31:0] _T_29 = _T_26 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_30 = _T_27 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_2 = _T_29 | _T_30; // @[Mux.scala 27:72]
  wire  _T_33 = ~io_trigger_pkt_any_3_select; // @[el2_lsu_trigger.scala 17:53]
  wire  _T_34 = io_trigger_pkt_any_3_select & io_trigger_pkt_any_3_store; // @[el2_lsu_trigger.scala 17:136]
  wire [31:0] _T_36 = _T_33 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_37 = _T_34 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_3 = _T_36 | _T_37; // @[Mux.scala 27:72]
  wire  _T_39 = ~io_lsu_pkt_m_dma; // @[el2_lsu_trigger.scala 18:71]
  wire  _T_40 = io_lsu_pkt_m_valid & _T_39; // @[el2_lsu_trigger.scala 18:69]
  wire  _T_41 = io_trigger_pkt_any_0_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 18:121]
  wire  _T_42 = io_trigger_pkt_any_0_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 19:33]
  wire  _T_44 = _T_42 & _T_12; // @[el2_lsu_trigger.scala 19:53]
  wire  _T_45 = _T_41 | _T_44; // @[el2_lsu_trigger.scala 18:142]
  wire  _T_46 = _T_40 & _T_45; // @[el2_lsu_trigger.scala 18:89]
  wire  _T_49 = &io_trigger_pkt_any_0_tdata2; // @[el2_lib.scala 239:45]
  wire  _T_50 = ~_T_49; // @[el2_lib.scala 239:39]
  wire  _T_51 = io_trigger_pkt_any_0_match_ & _T_50; // @[el2_lib.scala 239:37]
  wire  _T_54 = io_trigger_pkt_any_0_tdata2[0] == lsu_match_data_0[0]; // @[el2_lib.scala 240:52]
  wire  _T_55 = _T_51 | _T_54; // @[el2_lib.scala 240:41]
  wire  _T_57 = &io_trigger_pkt_any_0_tdata2[0]; // @[el2_lib.scala 242:36]
  wire  _T_58 = _T_57 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_61 = io_trigger_pkt_any_0_tdata2[1] == lsu_match_data_0[1]; // @[el2_lib.scala 242:78]
  wire  _T_62 = _T_58 | _T_61; // @[el2_lib.scala 242:23]
  wire  _T_64 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[el2_lib.scala 242:36]
  wire  _T_65 = _T_64 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_68 = io_trigger_pkt_any_0_tdata2[2] == lsu_match_data_0[2]; // @[el2_lib.scala 242:78]
  wire  _T_69 = _T_65 | _T_68; // @[el2_lib.scala 242:23]
  wire  _T_71 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[el2_lib.scala 242:36]
  wire  _T_72 = _T_71 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_75 = io_trigger_pkt_any_0_tdata2[3] == lsu_match_data_0[3]; // @[el2_lib.scala 242:78]
  wire  _T_76 = _T_72 | _T_75; // @[el2_lib.scala 242:23]
  wire  _T_78 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[el2_lib.scala 242:36]
  wire  _T_79 = _T_78 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_82 = io_trigger_pkt_any_0_tdata2[4] == lsu_match_data_0[4]; // @[el2_lib.scala 242:78]
  wire  _T_83 = _T_79 | _T_82; // @[el2_lib.scala 242:23]
  wire  _T_85 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[el2_lib.scala 242:36]
  wire  _T_86 = _T_85 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_89 = io_trigger_pkt_any_0_tdata2[5] == lsu_match_data_0[5]; // @[el2_lib.scala 242:78]
  wire  _T_90 = _T_86 | _T_89; // @[el2_lib.scala 242:23]
  wire  _T_92 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[el2_lib.scala 242:36]
  wire  _T_93 = _T_92 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_96 = io_trigger_pkt_any_0_tdata2[6] == lsu_match_data_0[6]; // @[el2_lib.scala 242:78]
  wire  _T_97 = _T_93 | _T_96; // @[el2_lib.scala 242:23]
  wire  _T_99 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[el2_lib.scala 242:36]
  wire  _T_100 = _T_99 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_103 = io_trigger_pkt_any_0_tdata2[7] == lsu_match_data_0[7]; // @[el2_lib.scala 242:78]
  wire  _T_104 = _T_100 | _T_103; // @[el2_lib.scala 242:23]
  wire  _T_106 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[el2_lib.scala 242:36]
  wire  _T_107 = _T_106 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_110 = io_trigger_pkt_any_0_tdata2[8] == lsu_match_data_0[8]; // @[el2_lib.scala 242:78]
  wire  _T_111 = _T_107 | _T_110; // @[el2_lib.scala 242:23]
  wire  _T_113 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[el2_lib.scala 242:36]
  wire  _T_114 = _T_113 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_117 = io_trigger_pkt_any_0_tdata2[9] == lsu_match_data_0[9]; // @[el2_lib.scala 242:78]
  wire  _T_118 = _T_114 | _T_117; // @[el2_lib.scala 242:23]
  wire  _T_120 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[el2_lib.scala 242:36]
  wire  _T_121 = _T_120 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_124 = io_trigger_pkt_any_0_tdata2[10] == lsu_match_data_0[10]; // @[el2_lib.scala 242:78]
  wire  _T_125 = _T_121 | _T_124; // @[el2_lib.scala 242:23]
  wire  _T_127 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[el2_lib.scala 242:36]
  wire  _T_128 = _T_127 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_131 = io_trigger_pkt_any_0_tdata2[11] == lsu_match_data_0[11]; // @[el2_lib.scala 242:78]
  wire  _T_132 = _T_128 | _T_131; // @[el2_lib.scala 242:23]
  wire  _T_134 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[el2_lib.scala 242:36]
  wire  _T_135 = _T_134 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_138 = io_trigger_pkt_any_0_tdata2[12] == lsu_match_data_0[12]; // @[el2_lib.scala 242:78]
  wire  _T_139 = _T_135 | _T_138; // @[el2_lib.scala 242:23]
  wire  _T_141 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[el2_lib.scala 242:36]
  wire  _T_142 = _T_141 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_145 = io_trigger_pkt_any_0_tdata2[13] == lsu_match_data_0[13]; // @[el2_lib.scala 242:78]
  wire  _T_146 = _T_142 | _T_145; // @[el2_lib.scala 242:23]
  wire  _T_148 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[el2_lib.scala 242:36]
  wire  _T_149 = _T_148 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_152 = io_trigger_pkt_any_0_tdata2[14] == lsu_match_data_0[14]; // @[el2_lib.scala 242:78]
  wire  _T_153 = _T_149 | _T_152; // @[el2_lib.scala 242:23]
  wire  _T_155 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[el2_lib.scala 242:36]
  wire  _T_156 = _T_155 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_159 = io_trigger_pkt_any_0_tdata2[15] == lsu_match_data_0[15]; // @[el2_lib.scala 242:78]
  wire  _T_160 = _T_156 | _T_159; // @[el2_lib.scala 242:23]
  wire  _T_162 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[el2_lib.scala 242:36]
  wire  _T_163 = _T_162 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_166 = io_trigger_pkt_any_0_tdata2[16] == lsu_match_data_0[16]; // @[el2_lib.scala 242:78]
  wire  _T_167 = _T_163 | _T_166; // @[el2_lib.scala 242:23]
  wire  _T_169 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[el2_lib.scala 242:36]
  wire  _T_170 = _T_169 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_173 = io_trigger_pkt_any_0_tdata2[17] == lsu_match_data_0[17]; // @[el2_lib.scala 242:78]
  wire  _T_174 = _T_170 | _T_173; // @[el2_lib.scala 242:23]
  wire  _T_176 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[el2_lib.scala 242:36]
  wire  _T_177 = _T_176 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_180 = io_trigger_pkt_any_0_tdata2[18] == lsu_match_data_0[18]; // @[el2_lib.scala 242:78]
  wire  _T_181 = _T_177 | _T_180; // @[el2_lib.scala 242:23]
  wire  _T_183 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[el2_lib.scala 242:36]
  wire  _T_184 = _T_183 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_187 = io_trigger_pkt_any_0_tdata2[19] == lsu_match_data_0[19]; // @[el2_lib.scala 242:78]
  wire  _T_188 = _T_184 | _T_187; // @[el2_lib.scala 242:23]
  wire  _T_190 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[el2_lib.scala 242:36]
  wire  _T_191 = _T_190 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_194 = io_trigger_pkt_any_0_tdata2[20] == lsu_match_data_0[20]; // @[el2_lib.scala 242:78]
  wire  _T_195 = _T_191 | _T_194; // @[el2_lib.scala 242:23]
  wire  _T_197 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[el2_lib.scala 242:36]
  wire  _T_198 = _T_197 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_201 = io_trigger_pkt_any_0_tdata2[21] == lsu_match_data_0[21]; // @[el2_lib.scala 242:78]
  wire  _T_202 = _T_198 | _T_201; // @[el2_lib.scala 242:23]
  wire  _T_204 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[el2_lib.scala 242:36]
  wire  _T_205 = _T_204 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_208 = io_trigger_pkt_any_0_tdata2[22] == lsu_match_data_0[22]; // @[el2_lib.scala 242:78]
  wire  _T_209 = _T_205 | _T_208; // @[el2_lib.scala 242:23]
  wire  _T_211 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[el2_lib.scala 242:36]
  wire  _T_212 = _T_211 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_215 = io_trigger_pkt_any_0_tdata2[23] == lsu_match_data_0[23]; // @[el2_lib.scala 242:78]
  wire  _T_216 = _T_212 | _T_215; // @[el2_lib.scala 242:23]
  wire  _T_218 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[el2_lib.scala 242:36]
  wire  _T_219 = _T_218 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_222 = io_trigger_pkt_any_0_tdata2[24] == lsu_match_data_0[24]; // @[el2_lib.scala 242:78]
  wire  _T_223 = _T_219 | _T_222; // @[el2_lib.scala 242:23]
  wire  _T_225 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[el2_lib.scala 242:36]
  wire  _T_226 = _T_225 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_229 = io_trigger_pkt_any_0_tdata2[25] == lsu_match_data_0[25]; // @[el2_lib.scala 242:78]
  wire  _T_230 = _T_226 | _T_229; // @[el2_lib.scala 242:23]
  wire  _T_232 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[el2_lib.scala 242:36]
  wire  _T_233 = _T_232 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_236 = io_trigger_pkt_any_0_tdata2[26] == lsu_match_data_0[26]; // @[el2_lib.scala 242:78]
  wire  _T_237 = _T_233 | _T_236; // @[el2_lib.scala 242:23]
  wire  _T_239 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[el2_lib.scala 242:36]
  wire  _T_240 = _T_239 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_243 = io_trigger_pkt_any_0_tdata2[27] == lsu_match_data_0[27]; // @[el2_lib.scala 242:78]
  wire  _T_244 = _T_240 | _T_243; // @[el2_lib.scala 242:23]
  wire  _T_246 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[el2_lib.scala 242:36]
  wire  _T_247 = _T_246 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_250 = io_trigger_pkt_any_0_tdata2[28] == lsu_match_data_0[28]; // @[el2_lib.scala 242:78]
  wire  _T_251 = _T_247 | _T_250; // @[el2_lib.scala 242:23]
  wire  _T_253 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[el2_lib.scala 242:36]
  wire  _T_254 = _T_253 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_257 = io_trigger_pkt_any_0_tdata2[29] == lsu_match_data_0[29]; // @[el2_lib.scala 242:78]
  wire  _T_258 = _T_254 | _T_257; // @[el2_lib.scala 242:23]
  wire  _T_260 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[el2_lib.scala 242:36]
  wire  _T_261 = _T_260 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_264 = io_trigger_pkt_any_0_tdata2[30] == lsu_match_data_0[30]; // @[el2_lib.scala 242:78]
  wire  _T_265 = _T_261 | _T_264; // @[el2_lib.scala 242:23]
  wire  _T_267 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[el2_lib.scala 242:36]
  wire  _T_268 = _T_267 & _T_51; // @[el2_lib.scala 242:41]
  wire  _T_271 = io_trigger_pkt_any_0_tdata2[31] == lsu_match_data_0[31]; // @[el2_lib.scala 242:78]
  wire  _T_272 = _T_268 | _T_271; // @[el2_lib.scala 242:23]
  wire [7:0] _T_279 = {_T_104,_T_97,_T_90,_T_83,_T_76,_T_69,_T_62,_T_55}; // @[el2_lib.scala 243:14]
  wire [15:0] _T_287 = {_T_160,_T_153,_T_146,_T_139,_T_132,_T_125,_T_118,_T_111,_T_279}; // @[el2_lib.scala 243:14]
  wire [7:0] _T_294 = {_T_216,_T_209,_T_202,_T_195,_T_188,_T_181,_T_174,_T_167}; // @[el2_lib.scala 243:14]
  wire [31:0] _T_303 = {_T_272,_T_265,_T_258,_T_251,_T_244,_T_237,_T_230,_T_223,_T_294,_T_287}; // @[el2_lib.scala 243:14]
  wire [31:0] _GEN_0 = {{31'd0}, _T_46}; // @[el2_lsu_trigger.scala 19:87]
  wire [31:0] _T_304 = _GEN_0 & _T_303; // @[el2_lsu_trigger.scala 19:87]
  wire  _T_307 = io_trigger_pkt_any_1_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 18:121]
  wire  _T_308 = io_trigger_pkt_any_1_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 19:33]
  wire  _T_310 = _T_308 & _T_19; // @[el2_lsu_trigger.scala 19:53]
  wire  _T_311 = _T_307 | _T_310; // @[el2_lsu_trigger.scala 18:142]
  wire  _T_312 = _T_40 & _T_311; // @[el2_lsu_trigger.scala 18:89]
  wire  _T_315 = &io_trigger_pkt_any_1_tdata2; // @[el2_lib.scala 239:45]
  wire  _T_316 = ~_T_315; // @[el2_lib.scala 239:39]
  wire  _T_317 = io_trigger_pkt_any_1_match_ & _T_316; // @[el2_lib.scala 239:37]
  wire  _T_320 = io_trigger_pkt_any_1_tdata2[0] == lsu_match_data_1[0]; // @[el2_lib.scala 240:52]
  wire  _T_321 = _T_317 | _T_320; // @[el2_lib.scala 240:41]
  wire  _T_323 = &io_trigger_pkt_any_1_tdata2[0]; // @[el2_lib.scala 242:36]
  wire  _T_324 = _T_323 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_327 = io_trigger_pkt_any_1_tdata2[1] == lsu_match_data_1[1]; // @[el2_lib.scala 242:78]
  wire  _T_328 = _T_324 | _T_327; // @[el2_lib.scala 242:23]
  wire  _T_330 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[el2_lib.scala 242:36]
  wire  _T_331 = _T_330 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_334 = io_trigger_pkt_any_1_tdata2[2] == lsu_match_data_1[2]; // @[el2_lib.scala 242:78]
  wire  _T_335 = _T_331 | _T_334; // @[el2_lib.scala 242:23]
  wire  _T_337 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[el2_lib.scala 242:36]
  wire  _T_338 = _T_337 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_341 = io_trigger_pkt_any_1_tdata2[3] == lsu_match_data_1[3]; // @[el2_lib.scala 242:78]
  wire  _T_342 = _T_338 | _T_341; // @[el2_lib.scala 242:23]
  wire  _T_344 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[el2_lib.scala 242:36]
  wire  _T_345 = _T_344 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_348 = io_trigger_pkt_any_1_tdata2[4] == lsu_match_data_1[4]; // @[el2_lib.scala 242:78]
  wire  _T_349 = _T_345 | _T_348; // @[el2_lib.scala 242:23]
  wire  _T_351 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[el2_lib.scala 242:36]
  wire  _T_352 = _T_351 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_355 = io_trigger_pkt_any_1_tdata2[5] == lsu_match_data_1[5]; // @[el2_lib.scala 242:78]
  wire  _T_356 = _T_352 | _T_355; // @[el2_lib.scala 242:23]
  wire  _T_358 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[el2_lib.scala 242:36]
  wire  _T_359 = _T_358 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_362 = io_trigger_pkt_any_1_tdata2[6] == lsu_match_data_1[6]; // @[el2_lib.scala 242:78]
  wire  _T_363 = _T_359 | _T_362; // @[el2_lib.scala 242:23]
  wire  _T_365 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[el2_lib.scala 242:36]
  wire  _T_366 = _T_365 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_369 = io_trigger_pkt_any_1_tdata2[7] == lsu_match_data_1[7]; // @[el2_lib.scala 242:78]
  wire  _T_370 = _T_366 | _T_369; // @[el2_lib.scala 242:23]
  wire  _T_372 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[el2_lib.scala 242:36]
  wire  _T_373 = _T_372 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_376 = io_trigger_pkt_any_1_tdata2[8] == lsu_match_data_1[8]; // @[el2_lib.scala 242:78]
  wire  _T_377 = _T_373 | _T_376; // @[el2_lib.scala 242:23]
  wire  _T_379 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[el2_lib.scala 242:36]
  wire  _T_380 = _T_379 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_383 = io_trigger_pkt_any_1_tdata2[9] == lsu_match_data_1[9]; // @[el2_lib.scala 242:78]
  wire  _T_384 = _T_380 | _T_383; // @[el2_lib.scala 242:23]
  wire  _T_386 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[el2_lib.scala 242:36]
  wire  _T_387 = _T_386 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_390 = io_trigger_pkt_any_1_tdata2[10] == lsu_match_data_1[10]; // @[el2_lib.scala 242:78]
  wire  _T_391 = _T_387 | _T_390; // @[el2_lib.scala 242:23]
  wire  _T_393 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[el2_lib.scala 242:36]
  wire  _T_394 = _T_393 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_397 = io_trigger_pkt_any_1_tdata2[11] == lsu_match_data_1[11]; // @[el2_lib.scala 242:78]
  wire  _T_398 = _T_394 | _T_397; // @[el2_lib.scala 242:23]
  wire  _T_400 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[el2_lib.scala 242:36]
  wire  _T_401 = _T_400 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_404 = io_trigger_pkt_any_1_tdata2[12] == lsu_match_data_1[12]; // @[el2_lib.scala 242:78]
  wire  _T_405 = _T_401 | _T_404; // @[el2_lib.scala 242:23]
  wire  _T_407 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[el2_lib.scala 242:36]
  wire  _T_408 = _T_407 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_411 = io_trigger_pkt_any_1_tdata2[13] == lsu_match_data_1[13]; // @[el2_lib.scala 242:78]
  wire  _T_412 = _T_408 | _T_411; // @[el2_lib.scala 242:23]
  wire  _T_414 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[el2_lib.scala 242:36]
  wire  _T_415 = _T_414 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_418 = io_trigger_pkt_any_1_tdata2[14] == lsu_match_data_1[14]; // @[el2_lib.scala 242:78]
  wire  _T_419 = _T_415 | _T_418; // @[el2_lib.scala 242:23]
  wire  _T_421 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[el2_lib.scala 242:36]
  wire  _T_422 = _T_421 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_425 = io_trigger_pkt_any_1_tdata2[15] == lsu_match_data_1[15]; // @[el2_lib.scala 242:78]
  wire  _T_426 = _T_422 | _T_425; // @[el2_lib.scala 242:23]
  wire  _T_428 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[el2_lib.scala 242:36]
  wire  _T_429 = _T_428 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_432 = io_trigger_pkt_any_1_tdata2[16] == lsu_match_data_1[16]; // @[el2_lib.scala 242:78]
  wire  _T_433 = _T_429 | _T_432; // @[el2_lib.scala 242:23]
  wire  _T_435 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[el2_lib.scala 242:36]
  wire  _T_436 = _T_435 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_439 = io_trigger_pkt_any_1_tdata2[17] == lsu_match_data_1[17]; // @[el2_lib.scala 242:78]
  wire  _T_440 = _T_436 | _T_439; // @[el2_lib.scala 242:23]
  wire  _T_442 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[el2_lib.scala 242:36]
  wire  _T_443 = _T_442 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_446 = io_trigger_pkt_any_1_tdata2[18] == lsu_match_data_1[18]; // @[el2_lib.scala 242:78]
  wire  _T_447 = _T_443 | _T_446; // @[el2_lib.scala 242:23]
  wire  _T_449 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[el2_lib.scala 242:36]
  wire  _T_450 = _T_449 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_453 = io_trigger_pkt_any_1_tdata2[19] == lsu_match_data_1[19]; // @[el2_lib.scala 242:78]
  wire  _T_454 = _T_450 | _T_453; // @[el2_lib.scala 242:23]
  wire  _T_456 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[el2_lib.scala 242:36]
  wire  _T_457 = _T_456 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_460 = io_trigger_pkt_any_1_tdata2[20] == lsu_match_data_1[20]; // @[el2_lib.scala 242:78]
  wire  _T_461 = _T_457 | _T_460; // @[el2_lib.scala 242:23]
  wire  _T_463 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[el2_lib.scala 242:36]
  wire  _T_464 = _T_463 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_467 = io_trigger_pkt_any_1_tdata2[21] == lsu_match_data_1[21]; // @[el2_lib.scala 242:78]
  wire  _T_468 = _T_464 | _T_467; // @[el2_lib.scala 242:23]
  wire  _T_470 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[el2_lib.scala 242:36]
  wire  _T_471 = _T_470 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_474 = io_trigger_pkt_any_1_tdata2[22] == lsu_match_data_1[22]; // @[el2_lib.scala 242:78]
  wire  _T_475 = _T_471 | _T_474; // @[el2_lib.scala 242:23]
  wire  _T_477 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[el2_lib.scala 242:36]
  wire  _T_478 = _T_477 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_481 = io_trigger_pkt_any_1_tdata2[23] == lsu_match_data_1[23]; // @[el2_lib.scala 242:78]
  wire  _T_482 = _T_478 | _T_481; // @[el2_lib.scala 242:23]
  wire  _T_484 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[el2_lib.scala 242:36]
  wire  _T_485 = _T_484 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_488 = io_trigger_pkt_any_1_tdata2[24] == lsu_match_data_1[24]; // @[el2_lib.scala 242:78]
  wire  _T_489 = _T_485 | _T_488; // @[el2_lib.scala 242:23]
  wire  _T_491 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[el2_lib.scala 242:36]
  wire  _T_492 = _T_491 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_495 = io_trigger_pkt_any_1_tdata2[25] == lsu_match_data_1[25]; // @[el2_lib.scala 242:78]
  wire  _T_496 = _T_492 | _T_495; // @[el2_lib.scala 242:23]
  wire  _T_498 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[el2_lib.scala 242:36]
  wire  _T_499 = _T_498 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_502 = io_trigger_pkt_any_1_tdata2[26] == lsu_match_data_1[26]; // @[el2_lib.scala 242:78]
  wire  _T_503 = _T_499 | _T_502; // @[el2_lib.scala 242:23]
  wire  _T_505 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[el2_lib.scala 242:36]
  wire  _T_506 = _T_505 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_509 = io_trigger_pkt_any_1_tdata2[27] == lsu_match_data_1[27]; // @[el2_lib.scala 242:78]
  wire  _T_510 = _T_506 | _T_509; // @[el2_lib.scala 242:23]
  wire  _T_512 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[el2_lib.scala 242:36]
  wire  _T_513 = _T_512 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_516 = io_trigger_pkt_any_1_tdata2[28] == lsu_match_data_1[28]; // @[el2_lib.scala 242:78]
  wire  _T_517 = _T_513 | _T_516; // @[el2_lib.scala 242:23]
  wire  _T_519 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[el2_lib.scala 242:36]
  wire  _T_520 = _T_519 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_523 = io_trigger_pkt_any_1_tdata2[29] == lsu_match_data_1[29]; // @[el2_lib.scala 242:78]
  wire  _T_524 = _T_520 | _T_523; // @[el2_lib.scala 242:23]
  wire  _T_526 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[el2_lib.scala 242:36]
  wire  _T_527 = _T_526 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_530 = io_trigger_pkt_any_1_tdata2[30] == lsu_match_data_1[30]; // @[el2_lib.scala 242:78]
  wire  _T_531 = _T_527 | _T_530; // @[el2_lib.scala 242:23]
  wire  _T_533 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[el2_lib.scala 242:36]
  wire  _T_534 = _T_533 & _T_317; // @[el2_lib.scala 242:41]
  wire  _T_537 = io_trigger_pkt_any_1_tdata2[31] == lsu_match_data_1[31]; // @[el2_lib.scala 242:78]
  wire  _T_538 = _T_534 | _T_537; // @[el2_lib.scala 242:23]
  wire [7:0] _T_545 = {_T_370,_T_363,_T_356,_T_349,_T_342,_T_335,_T_328,_T_321}; // @[el2_lib.scala 243:14]
  wire [15:0] _T_553 = {_T_426,_T_419,_T_412,_T_405,_T_398,_T_391,_T_384,_T_377,_T_545}; // @[el2_lib.scala 243:14]
  wire [7:0] _T_560 = {_T_482,_T_475,_T_468,_T_461,_T_454,_T_447,_T_440,_T_433}; // @[el2_lib.scala 243:14]
  wire [31:0] _T_569 = {_T_538,_T_531,_T_524,_T_517,_T_510,_T_503,_T_496,_T_489,_T_560,_T_553}; // @[el2_lib.scala 243:14]
  wire [31:0] _GEN_1 = {{31'd0}, _T_312}; // @[el2_lsu_trigger.scala 19:87]
  wire [31:0] _T_570 = _GEN_1 & _T_569; // @[el2_lsu_trigger.scala 19:87]
  wire  _T_573 = io_trigger_pkt_any_2_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 18:121]
  wire  _T_574 = io_trigger_pkt_any_2_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 19:33]
  wire  _T_576 = _T_574 & _T_26; // @[el2_lsu_trigger.scala 19:53]
  wire  _T_577 = _T_573 | _T_576; // @[el2_lsu_trigger.scala 18:142]
  wire  _T_578 = _T_40 & _T_577; // @[el2_lsu_trigger.scala 18:89]
  wire  _T_581 = &io_trigger_pkt_any_2_tdata2; // @[el2_lib.scala 239:45]
  wire  _T_582 = ~_T_581; // @[el2_lib.scala 239:39]
  wire  _T_583 = io_trigger_pkt_any_2_match_ & _T_582; // @[el2_lib.scala 239:37]
  wire  _T_586 = io_trigger_pkt_any_2_tdata2[0] == lsu_match_data_2[0]; // @[el2_lib.scala 240:52]
  wire  _T_587 = _T_583 | _T_586; // @[el2_lib.scala 240:41]
  wire  _T_589 = &io_trigger_pkt_any_2_tdata2[0]; // @[el2_lib.scala 242:36]
  wire  _T_590 = _T_589 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_593 = io_trigger_pkt_any_2_tdata2[1] == lsu_match_data_2[1]; // @[el2_lib.scala 242:78]
  wire  _T_594 = _T_590 | _T_593; // @[el2_lib.scala 242:23]
  wire  _T_596 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[el2_lib.scala 242:36]
  wire  _T_597 = _T_596 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_600 = io_trigger_pkt_any_2_tdata2[2] == lsu_match_data_2[2]; // @[el2_lib.scala 242:78]
  wire  _T_601 = _T_597 | _T_600; // @[el2_lib.scala 242:23]
  wire  _T_603 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[el2_lib.scala 242:36]
  wire  _T_604 = _T_603 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_607 = io_trigger_pkt_any_2_tdata2[3] == lsu_match_data_2[3]; // @[el2_lib.scala 242:78]
  wire  _T_608 = _T_604 | _T_607; // @[el2_lib.scala 242:23]
  wire  _T_610 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[el2_lib.scala 242:36]
  wire  _T_611 = _T_610 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_614 = io_trigger_pkt_any_2_tdata2[4] == lsu_match_data_2[4]; // @[el2_lib.scala 242:78]
  wire  _T_615 = _T_611 | _T_614; // @[el2_lib.scala 242:23]
  wire  _T_617 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[el2_lib.scala 242:36]
  wire  _T_618 = _T_617 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_621 = io_trigger_pkt_any_2_tdata2[5] == lsu_match_data_2[5]; // @[el2_lib.scala 242:78]
  wire  _T_622 = _T_618 | _T_621; // @[el2_lib.scala 242:23]
  wire  _T_624 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[el2_lib.scala 242:36]
  wire  _T_625 = _T_624 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_628 = io_trigger_pkt_any_2_tdata2[6] == lsu_match_data_2[6]; // @[el2_lib.scala 242:78]
  wire  _T_629 = _T_625 | _T_628; // @[el2_lib.scala 242:23]
  wire  _T_631 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[el2_lib.scala 242:36]
  wire  _T_632 = _T_631 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_635 = io_trigger_pkt_any_2_tdata2[7] == lsu_match_data_2[7]; // @[el2_lib.scala 242:78]
  wire  _T_636 = _T_632 | _T_635; // @[el2_lib.scala 242:23]
  wire  _T_638 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[el2_lib.scala 242:36]
  wire  _T_639 = _T_638 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_642 = io_trigger_pkt_any_2_tdata2[8] == lsu_match_data_2[8]; // @[el2_lib.scala 242:78]
  wire  _T_643 = _T_639 | _T_642; // @[el2_lib.scala 242:23]
  wire  _T_645 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[el2_lib.scala 242:36]
  wire  _T_646 = _T_645 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_649 = io_trigger_pkt_any_2_tdata2[9] == lsu_match_data_2[9]; // @[el2_lib.scala 242:78]
  wire  _T_650 = _T_646 | _T_649; // @[el2_lib.scala 242:23]
  wire  _T_652 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[el2_lib.scala 242:36]
  wire  _T_653 = _T_652 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_656 = io_trigger_pkt_any_2_tdata2[10] == lsu_match_data_2[10]; // @[el2_lib.scala 242:78]
  wire  _T_657 = _T_653 | _T_656; // @[el2_lib.scala 242:23]
  wire  _T_659 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[el2_lib.scala 242:36]
  wire  _T_660 = _T_659 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_663 = io_trigger_pkt_any_2_tdata2[11] == lsu_match_data_2[11]; // @[el2_lib.scala 242:78]
  wire  _T_664 = _T_660 | _T_663; // @[el2_lib.scala 242:23]
  wire  _T_666 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[el2_lib.scala 242:36]
  wire  _T_667 = _T_666 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_670 = io_trigger_pkt_any_2_tdata2[12] == lsu_match_data_2[12]; // @[el2_lib.scala 242:78]
  wire  _T_671 = _T_667 | _T_670; // @[el2_lib.scala 242:23]
  wire  _T_673 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[el2_lib.scala 242:36]
  wire  _T_674 = _T_673 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_677 = io_trigger_pkt_any_2_tdata2[13] == lsu_match_data_2[13]; // @[el2_lib.scala 242:78]
  wire  _T_678 = _T_674 | _T_677; // @[el2_lib.scala 242:23]
  wire  _T_680 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[el2_lib.scala 242:36]
  wire  _T_681 = _T_680 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_684 = io_trigger_pkt_any_2_tdata2[14] == lsu_match_data_2[14]; // @[el2_lib.scala 242:78]
  wire  _T_685 = _T_681 | _T_684; // @[el2_lib.scala 242:23]
  wire  _T_687 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[el2_lib.scala 242:36]
  wire  _T_688 = _T_687 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_691 = io_trigger_pkt_any_2_tdata2[15] == lsu_match_data_2[15]; // @[el2_lib.scala 242:78]
  wire  _T_692 = _T_688 | _T_691; // @[el2_lib.scala 242:23]
  wire  _T_694 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[el2_lib.scala 242:36]
  wire  _T_695 = _T_694 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_698 = io_trigger_pkt_any_2_tdata2[16] == lsu_match_data_2[16]; // @[el2_lib.scala 242:78]
  wire  _T_699 = _T_695 | _T_698; // @[el2_lib.scala 242:23]
  wire  _T_701 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[el2_lib.scala 242:36]
  wire  _T_702 = _T_701 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_705 = io_trigger_pkt_any_2_tdata2[17] == lsu_match_data_2[17]; // @[el2_lib.scala 242:78]
  wire  _T_706 = _T_702 | _T_705; // @[el2_lib.scala 242:23]
  wire  _T_708 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[el2_lib.scala 242:36]
  wire  _T_709 = _T_708 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_712 = io_trigger_pkt_any_2_tdata2[18] == lsu_match_data_2[18]; // @[el2_lib.scala 242:78]
  wire  _T_713 = _T_709 | _T_712; // @[el2_lib.scala 242:23]
  wire  _T_715 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[el2_lib.scala 242:36]
  wire  _T_716 = _T_715 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_719 = io_trigger_pkt_any_2_tdata2[19] == lsu_match_data_2[19]; // @[el2_lib.scala 242:78]
  wire  _T_720 = _T_716 | _T_719; // @[el2_lib.scala 242:23]
  wire  _T_722 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[el2_lib.scala 242:36]
  wire  _T_723 = _T_722 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_726 = io_trigger_pkt_any_2_tdata2[20] == lsu_match_data_2[20]; // @[el2_lib.scala 242:78]
  wire  _T_727 = _T_723 | _T_726; // @[el2_lib.scala 242:23]
  wire  _T_729 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[el2_lib.scala 242:36]
  wire  _T_730 = _T_729 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_733 = io_trigger_pkt_any_2_tdata2[21] == lsu_match_data_2[21]; // @[el2_lib.scala 242:78]
  wire  _T_734 = _T_730 | _T_733; // @[el2_lib.scala 242:23]
  wire  _T_736 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[el2_lib.scala 242:36]
  wire  _T_737 = _T_736 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_740 = io_trigger_pkt_any_2_tdata2[22] == lsu_match_data_2[22]; // @[el2_lib.scala 242:78]
  wire  _T_741 = _T_737 | _T_740; // @[el2_lib.scala 242:23]
  wire  _T_743 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[el2_lib.scala 242:36]
  wire  _T_744 = _T_743 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_747 = io_trigger_pkt_any_2_tdata2[23] == lsu_match_data_2[23]; // @[el2_lib.scala 242:78]
  wire  _T_748 = _T_744 | _T_747; // @[el2_lib.scala 242:23]
  wire  _T_750 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[el2_lib.scala 242:36]
  wire  _T_751 = _T_750 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_754 = io_trigger_pkt_any_2_tdata2[24] == lsu_match_data_2[24]; // @[el2_lib.scala 242:78]
  wire  _T_755 = _T_751 | _T_754; // @[el2_lib.scala 242:23]
  wire  _T_757 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[el2_lib.scala 242:36]
  wire  _T_758 = _T_757 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_761 = io_trigger_pkt_any_2_tdata2[25] == lsu_match_data_2[25]; // @[el2_lib.scala 242:78]
  wire  _T_762 = _T_758 | _T_761; // @[el2_lib.scala 242:23]
  wire  _T_764 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[el2_lib.scala 242:36]
  wire  _T_765 = _T_764 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_768 = io_trigger_pkt_any_2_tdata2[26] == lsu_match_data_2[26]; // @[el2_lib.scala 242:78]
  wire  _T_769 = _T_765 | _T_768; // @[el2_lib.scala 242:23]
  wire  _T_771 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[el2_lib.scala 242:36]
  wire  _T_772 = _T_771 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_775 = io_trigger_pkt_any_2_tdata2[27] == lsu_match_data_2[27]; // @[el2_lib.scala 242:78]
  wire  _T_776 = _T_772 | _T_775; // @[el2_lib.scala 242:23]
  wire  _T_778 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[el2_lib.scala 242:36]
  wire  _T_779 = _T_778 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_782 = io_trigger_pkt_any_2_tdata2[28] == lsu_match_data_2[28]; // @[el2_lib.scala 242:78]
  wire  _T_783 = _T_779 | _T_782; // @[el2_lib.scala 242:23]
  wire  _T_785 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[el2_lib.scala 242:36]
  wire  _T_786 = _T_785 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_789 = io_trigger_pkt_any_2_tdata2[29] == lsu_match_data_2[29]; // @[el2_lib.scala 242:78]
  wire  _T_790 = _T_786 | _T_789; // @[el2_lib.scala 242:23]
  wire  _T_792 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[el2_lib.scala 242:36]
  wire  _T_793 = _T_792 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_796 = io_trigger_pkt_any_2_tdata2[30] == lsu_match_data_2[30]; // @[el2_lib.scala 242:78]
  wire  _T_797 = _T_793 | _T_796; // @[el2_lib.scala 242:23]
  wire  _T_799 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[el2_lib.scala 242:36]
  wire  _T_800 = _T_799 & _T_583; // @[el2_lib.scala 242:41]
  wire  _T_803 = io_trigger_pkt_any_2_tdata2[31] == lsu_match_data_2[31]; // @[el2_lib.scala 242:78]
  wire  _T_804 = _T_800 | _T_803; // @[el2_lib.scala 242:23]
  wire [7:0] _T_811 = {_T_636,_T_629,_T_622,_T_615,_T_608,_T_601,_T_594,_T_587}; // @[el2_lib.scala 243:14]
  wire [15:0] _T_819 = {_T_692,_T_685,_T_678,_T_671,_T_664,_T_657,_T_650,_T_643,_T_811}; // @[el2_lib.scala 243:14]
  wire [7:0] _T_826 = {_T_748,_T_741,_T_734,_T_727,_T_720,_T_713,_T_706,_T_699}; // @[el2_lib.scala 243:14]
  wire [31:0] _T_835 = {_T_804,_T_797,_T_790,_T_783,_T_776,_T_769,_T_762,_T_755,_T_826,_T_819}; // @[el2_lib.scala 243:14]
  wire [31:0] _GEN_2 = {{31'd0}, _T_578}; // @[el2_lsu_trigger.scala 19:87]
  wire [31:0] _T_836 = _GEN_2 & _T_835; // @[el2_lsu_trigger.scala 19:87]
  wire  _T_839 = io_trigger_pkt_any_3_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 18:121]
  wire  _T_840 = io_trigger_pkt_any_3_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 19:33]
  wire  _T_842 = _T_840 & _T_33; // @[el2_lsu_trigger.scala 19:53]
  wire  _T_843 = _T_839 | _T_842; // @[el2_lsu_trigger.scala 18:142]
  wire  _T_844 = _T_40 & _T_843; // @[el2_lsu_trigger.scala 18:89]
  wire  _T_847 = &io_trigger_pkt_any_3_tdata2; // @[el2_lib.scala 239:45]
  wire  _T_848 = ~_T_847; // @[el2_lib.scala 239:39]
  wire  _T_849 = io_trigger_pkt_any_3_match_ & _T_848; // @[el2_lib.scala 239:37]
  wire  _T_852 = io_trigger_pkt_any_3_tdata2[0] == lsu_match_data_3[0]; // @[el2_lib.scala 240:52]
  wire  _T_853 = _T_849 | _T_852; // @[el2_lib.scala 240:41]
  wire  _T_855 = &io_trigger_pkt_any_3_tdata2[0]; // @[el2_lib.scala 242:36]
  wire  _T_856 = _T_855 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_859 = io_trigger_pkt_any_3_tdata2[1] == lsu_match_data_3[1]; // @[el2_lib.scala 242:78]
  wire  _T_860 = _T_856 | _T_859; // @[el2_lib.scala 242:23]
  wire  _T_862 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[el2_lib.scala 242:36]
  wire  _T_863 = _T_862 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_866 = io_trigger_pkt_any_3_tdata2[2] == lsu_match_data_3[2]; // @[el2_lib.scala 242:78]
  wire  _T_867 = _T_863 | _T_866; // @[el2_lib.scala 242:23]
  wire  _T_869 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[el2_lib.scala 242:36]
  wire  _T_870 = _T_869 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_873 = io_trigger_pkt_any_3_tdata2[3] == lsu_match_data_3[3]; // @[el2_lib.scala 242:78]
  wire  _T_874 = _T_870 | _T_873; // @[el2_lib.scala 242:23]
  wire  _T_876 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[el2_lib.scala 242:36]
  wire  _T_877 = _T_876 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_880 = io_trigger_pkt_any_3_tdata2[4] == lsu_match_data_3[4]; // @[el2_lib.scala 242:78]
  wire  _T_881 = _T_877 | _T_880; // @[el2_lib.scala 242:23]
  wire  _T_883 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[el2_lib.scala 242:36]
  wire  _T_884 = _T_883 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_887 = io_trigger_pkt_any_3_tdata2[5] == lsu_match_data_3[5]; // @[el2_lib.scala 242:78]
  wire  _T_888 = _T_884 | _T_887; // @[el2_lib.scala 242:23]
  wire  _T_890 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[el2_lib.scala 242:36]
  wire  _T_891 = _T_890 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_894 = io_trigger_pkt_any_3_tdata2[6] == lsu_match_data_3[6]; // @[el2_lib.scala 242:78]
  wire  _T_895 = _T_891 | _T_894; // @[el2_lib.scala 242:23]
  wire  _T_897 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[el2_lib.scala 242:36]
  wire  _T_898 = _T_897 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_901 = io_trigger_pkt_any_3_tdata2[7] == lsu_match_data_3[7]; // @[el2_lib.scala 242:78]
  wire  _T_902 = _T_898 | _T_901; // @[el2_lib.scala 242:23]
  wire  _T_904 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[el2_lib.scala 242:36]
  wire  _T_905 = _T_904 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_908 = io_trigger_pkt_any_3_tdata2[8] == lsu_match_data_3[8]; // @[el2_lib.scala 242:78]
  wire  _T_909 = _T_905 | _T_908; // @[el2_lib.scala 242:23]
  wire  _T_911 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[el2_lib.scala 242:36]
  wire  _T_912 = _T_911 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_915 = io_trigger_pkt_any_3_tdata2[9] == lsu_match_data_3[9]; // @[el2_lib.scala 242:78]
  wire  _T_916 = _T_912 | _T_915; // @[el2_lib.scala 242:23]
  wire  _T_918 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[el2_lib.scala 242:36]
  wire  _T_919 = _T_918 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_922 = io_trigger_pkt_any_3_tdata2[10] == lsu_match_data_3[10]; // @[el2_lib.scala 242:78]
  wire  _T_923 = _T_919 | _T_922; // @[el2_lib.scala 242:23]
  wire  _T_925 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[el2_lib.scala 242:36]
  wire  _T_926 = _T_925 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_929 = io_trigger_pkt_any_3_tdata2[11] == lsu_match_data_3[11]; // @[el2_lib.scala 242:78]
  wire  _T_930 = _T_926 | _T_929; // @[el2_lib.scala 242:23]
  wire  _T_932 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[el2_lib.scala 242:36]
  wire  _T_933 = _T_932 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_936 = io_trigger_pkt_any_3_tdata2[12] == lsu_match_data_3[12]; // @[el2_lib.scala 242:78]
  wire  _T_937 = _T_933 | _T_936; // @[el2_lib.scala 242:23]
  wire  _T_939 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[el2_lib.scala 242:36]
  wire  _T_940 = _T_939 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_943 = io_trigger_pkt_any_3_tdata2[13] == lsu_match_data_3[13]; // @[el2_lib.scala 242:78]
  wire  _T_944 = _T_940 | _T_943; // @[el2_lib.scala 242:23]
  wire  _T_946 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[el2_lib.scala 242:36]
  wire  _T_947 = _T_946 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_950 = io_trigger_pkt_any_3_tdata2[14] == lsu_match_data_3[14]; // @[el2_lib.scala 242:78]
  wire  _T_951 = _T_947 | _T_950; // @[el2_lib.scala 242:23]
  wire  _T_953 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[el2_lib.scala 242:36]
  wire  _T_954 = _T_953 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_957 = io_trigger_pkt_any_3_tdata2[15] == lsu_match_data_3[15]; // @[el2_lib.scala 242:78]
  wire  _T_958 = _T_954 | _T_957; // @[el2_lib.scala 242:23]
  wire  _T_960 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[el2_lib.scala 242:36]
  wire  _T_961 = _T_960 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_964 = io_trigger_pkt_any_3_tdata2[16] == lsu_match_data_3[16]; // @[el2_lib.scala 242:78]
  wire  _T_965 = _T_961 | _T_964; // @[el2_lib.scala 242:23]
  wire  _T_967 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[el2_lib.scala 242:36]
  wire  _T_968 = _T_967 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_971 = io_trigger_pkt_any_3_tdata2[17] == lsu_match_data_3[17]; // @[el2_lib.scala 242:78]
  wire  _T_972 = _T_968 | _T_971; // @[el2_lib.scala 242:23]
  wire  _T_974 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[el2_lib.scala 242:36]
  wire  _T_975 = _T_974 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_978 = io_trigger_pkt_any_3_tdata2[18] == lsu_match_data_3[18]; // @[el2_lib.scala 242:78]
  wire  _T_979 = _T_975 | _T_978; // @[el2_lib.scala 242:23]
  wire  _T_981 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[el2_lib.scala 242:36]
  wire  _T_982 = _T_981 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_985 = io_trigger_pkt_any_3_tdata2[19] == lsu_match_data_3[19]; // @[el2_lib.scala 242:78]
  wire  _T_986 = _T_982 | _T_985; // @[el2_lib.scala 242:23]
  wire  _T_988 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[el2_lib.scala 242:36]
  wire  _T_989 = _T_988 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_992 = io_trigger_pkt_any_3_tdata2[20] == lsu_match_data_3[20]; // @[el2_lib.scala 242:78]
  wire  _T_993 = _T_989 | _T_992; // @[el2_lib.scala 242:23]
  wire  _T_995 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[el2_lib.scala 242:36]
  wire  _T_996 = _T_995 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_999 = io_trigger_pkt_any_3_tdata2[21] == lsu_match_data_3[21]; // @[el2_lib.scala 242:78]
  wire  _T_1000 = _T_996 | _T_999; // @[el2_lib.scala 242:23]
  wire  _T_1002 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[el2_lib.scala 242:36]
  wire  _T_1003 = _T_1002 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1006 = io_trigger_pkt_any_3_tdata2[22] == lsu_match_data_3[22]; // @[el2_lib.scala 242:78]
  wire  _T_1007 = _T_1003 | _T_1006; // @[el2_lib.scala 242:23]
  wire  _T_1009 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[el2_lib.scala 242:36]
  wire  _T_1010 = _T_1009 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1013 = io_trigger_pkt_any_3_tdata2[23] == lsu_match_data_3[23]; // @[el2_lib.scala 242:78]
  wire  _T_1014 = _T_1010 | _T_1013; // @[el2_lib.scala 242:23]
  wire  _T_1016 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[el2_lib.scala 242:36]
  wire  _T_1017 = _T_1016 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1020 = io_trigger_pkt_any_3_tdata2[24] == lsu_match_data_3[24]; // @[el2_lib.scala 242:78]
  wire  _T_1021 = _T_1017 | _T_1020; // @[el2_lib.scala 242:23]
  wire  _T_1023 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[el2_lib.scala 242:36]
  wire  _T_1024 = _T_1023 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1027 = io_trigger_pkt_any_3_tdata2[25] == lsu_match_data_3[25]; // @[el2_lib.scala 242:78]
  wire  _T_1028 = _T_1024 | _T_1027; // @[el2_lib.scala 242:23]
  wire  _T_1030 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[el2_lib.scala 242:36]
  wire  _T_1031 = _T_1030 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1034 = io_trigger_pkt_any_3_tdata2[26] == lsu_match_data_3[26]; // @[el2_lib.scala 242:78]
  wire  _T_1035 = _T_1031 | _T_1034; // @[el2_lib.scala 242:23]
  wire  _T_1037 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[el2_lib.scala 242:36]
  wire  _T_1038 = _T_1037 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1041 = io_trigger_pkt_any_3_tdata2[27] == lsu_match_data_3[27]; // @[el2_lib.scala 242:78]
  wire  _T_1042 = _T_1038 | _T_1041; // @[el2_lib.scala 242:23]
  wire  _T_1044 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[el2_lib.scala 242:36]
  wire  _T_1045 = _T_1044 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1048 = io_trigger_pkt_any_3_tdata2[28] == lsu_match_data_3[28]; // @[el2_lib.scala 242:78]
  wire  _T_1049 = _T_1045 | _T_1048; // @[el2_lib.scala 242:23]
  wire  _T_1051 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[el2_lib.scala 242:36]
  wire  _T_1052 = _T_1051 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1055 = io_trigger_pkt_any_3_tdata2[29] == lsu_match_data_3[29]; // @[el2_lib.scala 242:78]
  wire  _T_1056 = _T_1052 | _T_1055; // @[el2_lib.scala 242:23]
  wire  _T_1058 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[el2_lib.scala 242:36]
  wire  _T_1059 = _T_1058 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1062 = io_trigger_pkt_any_3_tdata2[30] == lsu_match_data_3[30]; // @[el2_lib.scala 242:78]
  wire  _T_1063 = _T_1059 | _T_1062; // @[el2_lib.scala 242:23]
  wire  _T_1065 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[el2_lib.scala 242:36]
  wire  _T_1066 = _T_1065 & _T_849; // @[el2_lib.scala 242:41]
  wire  _T_1069 = io_trigger_pkt_any_3_tdata2[31] == lsu_match_data_3[31]; // @[el2_lib.scala 242:78]
  wire  _T_1070 = _T_1066 | _T_1069; // @[el2_lib.scala 242:23]
  wire [7:0] _T_1077 = {_T_902,_T_895,_T_888,_T_881,_T_874,_T_867,_T_860,_T_853}; // @[el2_lib.scala 243:14]
  wire [15:0] _T_1085 = {_T_958,_T_951,_T_944,_T_937,_T_930,_T_923,_T_916,_T_909,_T_1077}; // @[el2_lib.scala 243:14]
  wire [7:0] _T_1092 = {_T_1014,_T_1007,_T_1000,_T_993,_T_986,_T_979,_T_972,_T_965}; // @[el2_lib.scala 243:14]
  wire [31:0] _T_1101 = {_T_1070,_T_1063,_T_1056,_T_1049,_T_1042,_T_1035,_T_1028,_T_1021,_T_1092,_T_1085}; // @[el2_lib.scala 243:14]
  wire [31:0] _GEN_3 = {{31'd0}, _T_844}; // @[el2_lsu_trigger.scala 19:87]
  wire [31:0] _T_1102 = _GEN_3 & _T_1101; // @[el2_lsu_trigger.scala 19:87]
  wire [127:0] _T_1105 = {_T_1102,_T_836,_T_570,_T_304}; // @[Cat.scala 29:58]
  assign io_lsu_trigger_match_m = _T_1105[3:0]; // @[el2_lsu_trigger.scala 18:26]
endmodule
module el2_lsu_clkdomain(
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
  input   io_lsu_pkt_d_store,
  input   io_lsu_pkt_d_valid,
  input   io_lsu_pkt_m_store,
  input   io_lsu_pkt_m_valid,
  input   io_lsu_pkt_r_valid,
  output  io_lsu_c1_m_clk,
  output  io_lsu_c1_r_clk,
  output  io_lsu_c2_m_clk,
  output  io_lsu_c2_r_clk,
  output  io_lsu_store_c1_m_clk,
  output  io_lsu_stbuf_c1_clk,
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 481:22]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 481:22]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[el2_lsu_clkdomain.scala 63:51]
  reg  lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 82:67]
  wire  _T_1 = io_lsu_pkt_d_valid | lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 64:51]
  wire  lsu_c1_m_clken = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 64:70]
  reg  lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 83:67]
  wire  _T_2 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 65:51]
  wire  lsu_c1_r_clken = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 65:70]
  wire  _T_3 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 67:47]
  reg  lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 84:67]
  wire  _T_4 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 68:47]
  wire  _T_5 = lsu_c1_m_clken & io_lsu_pkt_d_store; // @[el2_lsu_clkdomain.scala 70:49]
  wire  _T_6 = lsu_c1_r_clken & io_lsu_pkt_m_store; // @[el2_lsu_clkdomain.scala 71:49]
  wire  _T_7 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[el2_lsu_clkdomain.scala 72:55]
  wire  _T_8 = _T_7 | io_stbuf_reqvld_flushed_any; // @[el2_lsu_clkdomain.scala 72:77]
  wire  _T_9 = io_lsu_bus_buffer_pend_any | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 74:61]
  wire  _T_10 = _T_9 | io_clk_override; // @[el2_lsu_clkdomain.scala 74:79]
  wire  _T_11 = ~io_lsu_bus_buffer_empty_any; // @[el2_lsu_clkdomain.scala 75:33]
  wire  _T_12 = _T_11 | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 75:62]
  wire  _T_14 = io_lsu_p_valid | io_lsu_pkt_d_valid; // @[el2_lsu_clkdomain.scala 77:48]
  wire  _T_15 = _T_14 | io_lsu_pkt_m_valid; // @[el2_lsu_clkdomain.scala 77:69]
  wire  _T_16 = _T_15 | io_lsu_pkt_r_valid; // @[el2_lsu_clkdomain.scala 77:90]
  wire  _T_18 = _T_16 | _T_11; // @[el2_lsu_clkdomain.scala 77:112]
  wire  _T_19 = ~io_lsu_stbuf_empty_any; // @[el2_lsu_clkdomain.scala 77:145]
  wire  _T_20 = _T_18 | _T_19; // @[el2_lsu_clkdomain.scala 77:143]
  wire  lsu_free_c1_clken = _T_20 | io_clk_override; // @[el2_lsu_clkdomain.scala 77:169]
  reg  lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 81:60]
  wire  _T_21 = lsu_free_c1_clken | lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 78:50]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 481:22]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_c1_m_clk = rvclkhdr_io_l1clk; // @[el2_lsu_clkdomain.scala 86:26]
  assign io_lsu_c1_r_clk = rvclkhdr_1_io_l1clk; // @[el2_lsu_clkdomain.scala 87:26]
  assign io_lsu_c2_m_clk = rvclkhdr_2_io_l1clk; // @[el2_lsu_clkdomain.scala 88:26]
  assign io_lsu_c2_r_clk = rvclkhdr_3_io_l1clk; // @[el2_lsu_clkdomain.scala 89:26]
  assign io_lsu_store_c1_m_clk = rvclkhdr_4_io_l1clk; // @[el2_lsu_clkdomain.scala 90:26]
  assign io_lsu_stbuf_c1_clk = rvclkhdr_6_io_l1clk; // @[el2_lsu_clkdomain.scala 92:26]
  assign io_lsu_bus_ibuf_c1_clk = rvclkhdr_7_io_l1clk; // @[el2_lsu_clkdomain.scala 93:26]
  assign io_lsu_bus_buf_c1_clk = rvclkhdr_9_io_l1clk; // @[el2_lsu_clkdomain.scala 95:26]
  assign io_lsu_busm_clk = rvclkhdr_10_io_l1clk; // @[el2_lsu_clkdomain.scala 96:26]
  assign io_lsu_free_c2_clk = rvclkhdr_11_io_l1clk; // @[el2_lsu_clkdomain.scala 97:26]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_io_en = _T_1 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_1_io_en = _T_2 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_2_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_3_io_en = _T_4 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_4_io_en = _T_5 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_5_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_6_io_en = _T_8 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_7_io_en = io_lsu_busreq_r | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_8_io_en = _T_10 & io_lsu_bus_clk_en; // @[el2_lib.scala 483:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_9_io_en = _T_12 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_10_io_en = io_lsu_bus_clk_en; // @[el2_lib.scala 483:16]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 482:17]
  assign rvclkhdr_11_io_en = _T_21 | io_clk_override; // @[el2_lib.scala 483:16]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 484:23]
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
      lsu_free_c1_clken_q <= _T_20 | io_clk_override;
    end
  end
endmodule
module el2_lsu_bus_buffer(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dec_tlu_external_ldfwd_disable,
  input         io_dec_tlu_wb_coalescing_disable,
  input         io_dec_tlu_sideeffect_posted_disable,
  input         io_dec_tlu_force_halt,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
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
  input         io_lsu_axi_awready,
  input         io_lsu_axi_wready,
  input         io_lsu_axi_bvalid,
  input  [1:0]  io_lsu_axi_bresp,
  input  [2:0]  io_lsu_axi_bid,
  input         io_lsu_axi_arready,
  input         io_lsu_axi_rvalid,
  input  [2:0]  io_lsu_axi_rid,
  input  [63:0] io_lsu_axi_rdata,
  input         io_lsu_bus_clk_en,
  input         io_lsu_bus_clk_en_q,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [3:0]  io_ld_byte_hit_buf_lo,
  output [3:0]  io_ld_byte_hit_buf_hi,
  output [31:0] io_ld_fwddata_buf_lo,
  output [31:0] io_ld_fwddata_buf_hi,
  output        io_lsu_imprecise_error_load_any,
  output        io_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_imprecise_error_addr_any,
  output        io_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_nonblock_load_tag_m,
  output        io_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_nonblock_load_data_valid,
  output        io_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_nonblock_load_data,
  output        io_lsu_pmu_bus_trxn,
  output        io_lsu_pmu_bus_misaligned,
  output        io_lsu_pmu_bus_error,
  output        io_lsu_pmu_bus_busy,
  output        io_lsu_axi_awvalid,
  output [2:0]  io_lsu_axi_awid,
  output [31:0] io_lsu_axi_awaddr,
  output [3:0]  io_lsu_axi_awregion,
  output [2:0]  io_lsu_axi_awsize,
  output [3:0]  io_lsu_axi_awcache,
  output        io_lsu_axi_wvalid,
  output [63:0] io_lsu_axi_wdata,
  output [7:0]  io_lsu_axi_wstrb,
  output        io_lsu_axi_bready,
  output        io_lsu_axi_arvalid,
  output [2:0]  io_lsu_axi_arid,
  output [31:0] io_lsu_axi_araddr,
  output [3:0]  io_lsu_axi_arregion,
  output [2:0]  io_lsu_axi_arsize,
  output [3:0]  io_lsu_axi_arcache,
  output        io_lsu_axi_rready
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 506:23]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 506:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_buffer.scala 125:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_buffer.scala 126:46]
  reg [31:0] buf_addr_0; // @[el2_lib.scala 512:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  reg  _T_4381; // @[Reg.scala 27:20]
  reg  _T_4378; // @[Reg.scala 27:20]
  reg  _T_4375; // @[Reg.scala 27:20]
  reg  _T_4372; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4381,_T_4378,_T_4375,_T_4372}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_1; // @[el2_lib.scala 512:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_13 = _T_11 & _T_12; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_2; // @[el2_lib.scala 512:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_20 = _T_18 & _T_19; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  reg [31:0] buf_addr_3; // @[el2_lib.scala 512:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 128:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 128:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[el2_lsu_bus_buffer.scala 128:129]
  wire  _T_27 = _T_25 & _T_26; // @[el2_lsu_bus_buffer.scala 128:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 128:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_34 = _T_32 & _T_5; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_41 = _T_39 & _T_12; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_48 = _T_46 & _T_19; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[el2_lsu_bus_buffer.scala 129:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 129:98]
  wire  _T_55 = _T_53 & _T_26; // @[el2_lsu_bus_buffer.scala 129:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 129:141]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2642 = buf_state_3 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:95]
  wire  _T_4128 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4151 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4155 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1869; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 403:13]
  wire  _T_4162 = obuf_tag0 == 3'h3; // @[el2_lsu_bus_buffer.scala 506:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_350 = {{1'd0}, obuf_tag1}; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_4163 = _GEN_350 == 3'h3; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_4164 = obuf_merge & _T_4163; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_4165 = _T_4162 | _T_4164; // @[el2_lsu_bus_buffer.scala 506:77]
  reg  obuf_valid; // @[el2_lsu_bus_buffer.scala 397:54]
  wire  _T_4166 = _T_4165 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  reg  obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 396:55]
  wire  _T_4167 = _T_4166 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_280 = _T_4155 & _T_4167; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4151 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_293; // @[Conditional.scala 40:58]
  wire  _T_2643 = _T_2642 & buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 463:105]
  wire  _T_2644 = ~_T_2643; // @[el2_lsu_bus_buffer.scala 463:80]
  wire  _T_2645 = buf_ageQ_3[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2637 = buf_state_2 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:95]
  wire  _T_3935 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3958 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3962 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3969 = obuf_tag0 == 3'h2; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3970 = _GEN_350 == 3'h2; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3971 = obuf_merge & _T_3970; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3972 = _T_3969 | _T_3971; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3973 = _T_3972 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3974 = _T_3973 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_204 = _T_3962 & _T_3974; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3958 ? 1'h0 : _GEN_204; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58]
  wire  _T_2638 = _T_2637 & buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 463:105]
  wire  _T_2639 = ~_T_2638; // @[el2_lsu_bus_buffer.scala 463:80]
  wire  _T_2640 = buf_ageQ_3[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2632 = buf_state_1 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:95]
  wire  _T_3742 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3765 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3769 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3776 = obuf_tag0 == 3'h1; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3777 = _GEN_350 == 3'h1; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3778 = obuf_merge & _T_3777; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3779 = _T_3776 | _T_3778; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3780 = _T_3779 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3781 = _T_3780 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_128 = _T_3769 & _T_3781; // @[Conditional.scala 39:67]
  wire  _GEN_141 = _T_3765 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_141; // @[Conditional.scala 40:58]
  wire  _T_2633 = _T_2632 & buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 463:105]
  wire  _T_2634 = ~_T_2633; // @[el2_lsu_bus_buffer.scala 463:80]
  wire  _T_2635 = buf_ageQ_3[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2627 = buf_state_0 == 3'h2; // @[el2_lsu_bus_buffer.scala 463:95]
  wire  _T_3549 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3572 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3576 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3583 = obuf_tag0 == 3'h0; // @[el2_lsu_bus_buffer.scala 506:48]
  wire  _T_3584 = _GEN_350 == 3'h0; // @[el2_lsu_bus_buffer.scala 506:104]
  wire  _T_3585 = obuf_merge & _T_3584; // @[el2_lsu_bus_buffer.scala 506:91]
  wire  _T_3586 = _T_3583 | _T_3585; // @[el2_lsu_bus_buffer.scala 506:77]
  wire  _T_3587 = _T_3586 & obuf_valid; // @[el2_lsu_bus_buffer.scala 506:135]
  wire  _T_3588 = _T_3587 & obuf_wr_enQ; // @[el2_lsu_bus_buffer.scala 506:148]
  wire  _GEN_52 = _T_3576 & _T_3588; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3572 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2628 = _T_2627 & buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 463:105]
  wire  _T_2629 = ~_T_2628; // @[el2_lsu_bus_buffer.scala 463:80]
  wire  _T_2630 = buf_ageQ_3[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_3 = {_T_2645,_T_2640,_T_2635,_T_2630}; // @[Cat.scala 29:58]
  wire  _T_2744 = ~buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2746 = _T_2744 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2738 = ~buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2740 = _T_2738 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2732 = ~buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2734 = _T_2732 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2746,_T_2740,_T_2734}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_256 = |_T_255; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_257 = ~_T_256; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[el2_lsu_bus_buffer.scala 197:97]
  reg [31:0] ibuf_addr; // @[el2_lib.scala 512:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 203:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[el2_lsu_bus_buffer.scala 203:73]
  reg  ibuf_valid; // @[el2_lsu_bus_buffer.scala 290:24]
  wire  _T_514 = _T_513 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 203:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 203:99]
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 208:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[el2_lsu_bus_buffer.scala 208:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_261 = _T_258 & _T_260; // @[el2_lsu_bus_buffer.scala 197:148]
  reg [3:0] buf_ageQ_2; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2622 = buf_ageQ_2[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2617 = buf_ageQ_2[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2612 = buf_ageQ_2[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2607 = buf_ageQ_2[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_2 = {_T_2622,_T_2617,_T_2612,_T_2607}; // @[Cat.scala 29:58]
  wire  _T_2723 = ~buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2725 = _T_2723 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2711 = ~buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2713 = _T_2711 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2705 = ~buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2707 = _T_2705 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_2 = {_T_2725,1'h0,_T_2713,_T_2707}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_248 = |_T_247; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_249 = ~_T_248; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_253 = _T_250 & _T_260; // @[el2_lsu_bus_buffer.scala 197:148]
  reg [3:0] buf_ageQ_1; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2599 = buf_ageQ_1[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2594 = buf_ageQ_1[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2589 = buf_ageQ_1[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2584 = buf_ageQ_1[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_1 = {_T_2599,_T_2594,_T_2589,_T_2584}; // @[Cat.scala 29:58]
  wire  _T_2696 = ~buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2698 = _T_2696 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2690 = ~buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2692 = _T_2690 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2678 = ~buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2680 = _T_2678 & _T_5; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_1 = {_T_2698,_T_2692,1'h0,_T_2680}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_240 = |_T_239; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_241 = ~_T_240; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_245 = _T_242 & _T_260; // @[el2_lsu_bus_buffer.scala 197:148]
  reg [3:0] buf_ageQ_0; // @[el2_lsu_bus_buffer.scala 551:60]
  wire  _T_2576 = buf_ageQ_0[3] & _T_2644; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2571 = buf_ageQ_0[2] & _T_2639; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2566 = buf_ageQ_0[1] & _T_2634; // @[el2_lsu_bus_buffer.scala 463:78]
  wire  _T_2561 = buf_ageQ_0[0] & _T_2629; // @[el2_lsu_bus_buffer.scala 463:78]
  wire [3:0] buf_age_0 = {_T_2576,_T_2571,_T_2566,_T_2561}; // @[Cat.scala 29:58]
  wire  _T_2669 = ~buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2671 = _T_2669 & _T_26; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2663 = ~buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2665 = _T_2663 & _T_19; // @[el2_lsu_bus_buffer.scala 464:106]
  wire  _T_2657 = ~buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 464:91]
  wire  _T_2659 = _T_2657 & _T_12; // @[el2_lsu_bus_buffer.scala 464:106]
  wire [3:0] buf_age_younger_0 = {_T_2671,_T_2665,_T_2659,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_232 = |_T_231; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_233 = ~_T_232; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_237 = _T_234 & _T_260; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_291 = |_T_290; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_292 = ~_T_291; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_296 = _T_293 & _T_295; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_283 = |_T_282; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_284 = ~_T_283; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_288 = _T_285 & _T_295; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_275 = |_T_274; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_276 = ~_T_275; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_280 = _T_277 & _T_295; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_267 = |_T_266; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_268 = ~_T_267; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_272 = _T_269 & _T_295; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_326 = |_T_325; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_327 = ~_T_326; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_331 = _T_328 & _T_330; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_318 = |_T_317; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_319 = ~_T_318; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_323 = _T_320 & _T_330; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_310 = |_T_309; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_311 = ~_T_310; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_315 = _T_312 & _T_330; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_302 = |_T_301; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_303 = ~_T_302; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_307 = _T_304 & _T_330; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 192:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_buffer.scala 192:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_361 = |_T_360; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_362 = ~_T_361; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 197:150]
  wire  _T_366 = _T_363 & _T_365; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_353 = |_T_352; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_354 = ~_T_353; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_358 = _T_355 & _T_365; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_345 = |_T_344; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_346 = ~_T_345; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_350 = _T_347 & _T_365; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 197:122]
  wire  _T_337 = |_T_336; // @[el2_lsu_bus_buffer.scala 197:144]
  wire  _T_338 = ~_T_337; // @[el2_lsu_bus_buffer.scala 197:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[el2_lsu_bus_buffer.scala 197:97]
  wire  _T_342 = _T_339 & _T_365; // @[el2_lsu_bus_buffer.scala 197:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[el2_lsu_bus_buffer.scala 189:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[el2_lsu_bus_buffer.scala 189:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_396 = |_T_395; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_397 = ~_T_396; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 204:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[el2_lsu_bus_buffer.scala 204:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 204:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[el2_lsu_bus_buffer.scala 204:99]
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[el2_lsu_bus_buffer.scala 209:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[el2_lsu_bus_buffer.scala 209:69]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 198:150]
  wire  _T_401 = _T_398 & _T_400; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_388 = |_T_387; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_389 = ~_T_388; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_393 = _T_390 & _T_400; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_380 = |_T_379; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_381 = ~_T_380; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_385 = _T_382 & _T_400; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_372 = |_T_371; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_373 = ~_T_372; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_377 = _T_374 & _T_400; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[el2_lsu_bus_buffer.scala 190:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[el2_lsu_bus_buffer.scala 190:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_431 = |_T_430; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_432 = ~_T_431; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 198:150]
  wire  _T_436 = _T_433 & _T_435; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_423 = |_T_422; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_424 = ~_T_423; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_428 = _T_425 & _T_435; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_415 = |_T_414; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_416 = ~_T_415; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_420 = _T_417 & _T_435; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_407 = |_T_406; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_408 = ~_T_407; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_412 = _T_409 & _T_435; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[el2_lsu_bus_buffer.scala 190:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[el2_lsu_bus_buffer.scala 190:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_466 = |_T_465; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_467 = ~_T_466; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 198:150]
  wire  _T_471 = _T_468 & _T_470; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_458 = |_T_457; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_459 = ~_T_458; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_463 = _T_460 & _T_470; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_450 = |_T_449; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_451 = ~_T_450; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_455 = _T_452 & _T_470; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_442 = |_T_441; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_443 = ~_T_442; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_447 = _T_444 & _T_470; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[el2_lsu_bus_buffer.scala 190:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[el2_lsu_bus_buffer.scala 190:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[el2_lsu_bus_buffer.scala 193:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_buffer.scala 193:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_501 = |_T_500; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_502 = ~_T_501; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 198:150]
  wire  _T_506 = _T_503 & _T_505; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_493 = |_T_492; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_494 = ~_T_493; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_498 = _T_495 & _T_505; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_485 = |_T_484; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_486 = ~_T_485; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_490 = _T_487 & _T_505; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[el2_lsu_bus_buffer.scala 198:122]
  wire  _T_477 = |_T_476; // @[el2_lsu_bus_buffer.scala 198:144]
  wire  _T_478 = ~_T_477; // @[el2_lsu_bus_buffer.scala 198:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[el2_lsu_bus_buffer.scala 198:97]
  wire  _T_482 = _T_479 & _T_505; // @[el2_lsu_bus_buffer.scala 198:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[el2_lsu_bus_buffer.scala 190:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[el2_lsu_bus_buffer.scala 190:77]
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
  reg [31:0] buf_data_0; // @[el2_lib.scala 512:16]
  wire [7:0] _T_560 = _T_558 & buf_data_0[31:24]; // @[el2_lsu_bus_buffer.scala 216:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[el2_lib.scala 512:16]
  wire [7:0] _T_565 = _T_563 & buf_data_1[31:24]; // @[el2_lsu_bus_buffer.scala 216:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[el2_lib.scala 512:16]
  wire [7:0] _T_570 = _T_568 & buf_data_2[31:24]; // @[el2_lsu_bus_buffer.scala 216:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[el2_lib.scala 512:16]
  wire [7:0] _T_575 = _T_573 & buf_data_3[31:24]; // @[el2_lsu_bus_buffer.scala 216:91]
  wire [7:0] _T_576 = _T_560 | _T_565; // @[el2_lsu_bus_buffer.scala 216:123]
  wire [7:0] _T_577 = _T_576 | _T_570; // @[el2_lsu_bus_buffer.scala 216:123]
  wire [7:0] _T_578 = _T_577 | _T_575; // @[el2_lsu_bus_buffer.scala 216:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 217:91]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 217:91]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 217:91]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 217:91]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[el2_lsu_bus_buffer.scala 217:123]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[el2_lsu_bus_buffer.scala 217:123]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[el2_lsu_bus_buffer.scala 217:123]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 218:91]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 218:91]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 218:91]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 218:91]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[el2_lsu_bus_buffer.scala 218:123]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[el2_lsu_bus_buffer.scala 218:123]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[el2_lsu_bus_buffer.scala 218:123]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 219:91]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[el2_lsu_bus_buffer.scala 219:123]
  wire [31:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[el2_lib.scala 512:16]
  wire [31:0] _T_651 = ld_fwddata_buf_lo_initial & ibuf_data; // @[el2_lsu_bus_buffer.scala 220:32]
  wire [7:0] _T_655 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_657 = _T_655 & buf_data_0[31:24]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_660 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_662 = _T_660 & buf_data_1[31:24]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_665 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_667 = _T_665 & buf_data_2[31:24]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_670 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_672 = _T_670 & buf_data_3[31:24]; // @[el2_lsu_bus_buffer.scala 222:91]
  wire [7:0] _T_673 = _T_657 | _T_662; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [7:0] _T_674 = _T_673 | _T_667; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [7:0] _T_675 = _T_674 | _T_672; // @[el2_lsu_bus_buffer.scala 222:123]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_680 = _T_678 & buf_data_0[23:16]; // @[el2_lsu_bus_buffer.scala 223:91]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_685 = _T_683 & buf_data_1[23:16]; // @[el2_lsu_bus_buffer.scala 223:91]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_690 = _T_688 & buf_data_2[23:16]; // @[el2_lsu_bus_buffer.scala 223:91]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_695 = _T_693 & buf_data_3[23:16]; // @[el2_lsu_bus_buffer.scala 223:91]
  wire [7:0] _T_696 = _T_680 | _T_685; // @[el2_lsu_bus_buffer.scala 223:123]
  wire [7:0] _T_697 = _T_696 | _T_690; // @[el2_lsu_bus_buffer.scala 223:123]
  wire [7:0] _T_698 = _T_697 | _T_695; // @[el2_lsu_bus_buffer.scala 223:123]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[15:8]; // @[el2_lsu_bus_buffer.scala 224:91]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[15:8]; // @[el2_lsu_bus_buffer.scala 224:91]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[15:8]; // @[el2_lsu_bus_buffer.scala 224:91]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[15:8]; // @[el2_lsu_bus_buffer.scala 224:91]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[el2_lsu_bus_buffer.scala 224:123]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[el2_lsu_bus_buffer.scala 224:123]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[el2_lsu_bus_buffer.scala 224:123]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[7:0]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[7:0]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[7:0]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[7:0]; // @[el2_lsu_bus_buffer.scala 225:91]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[el2_lsu_bus_buffer.scala 225:123]
  wire [31:0] _T_747 = {_T_675,_T_698,_T_721,_T_744}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = ld_fwddata_buf_hi_initial & ibuf_data; // @[el2_lsu_bus_buffer.scala 226:32]
  wire [3:0] _T_750 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_752 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_753 = _T_750 | _T_751; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_753 | _T_752; // @[Mux.scala 27:72]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h0; // @[el2_lsu_bus_buffer.scala 233:55]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h1; // @[el2_lsu_bus_buffer.scala 234:55]
  wire [3:0] _T_760 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_762 = io_lsu_addr_r[1:0] == 2'h2; // @[el2_lsu_bus_buffer.scala 235:55]
  wire [3:0] _T_764 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_766 = io_lsu_addr_r[1:0] == 2'h3; // @[el2_lsu_bus_buffer.scala 236:55]
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
  wire [31:0] _T_802 = {8'h0,io_store_data_r[31:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_806 = {16'h0,io_store_data_r[31:16]}; // @[Cat.scala 29:58]
  wire [31:0] _T_810 = {24'h0,io_store_data_r[31:24]}; // @[Cat.scala 29:58]
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
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[el2_lsu_bus_buffer.scala 253:40]
  wire  _T_844 = ~io_lsu_addr_r[0]; // @[el2_lsu_bus_buffer.scala 255:26]
  wire  _T_845 = io_lsu_pkt_r_word & _T_756; // @[Mux.scala 27:72]
  wire  _T_846 = io_lsu_pkt_r_half & _T_844; // @[Mux.scala 27:72]
  wire  _T_848 = _T_845 | _T_846; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_848 | io_lsu_pkt_r_by; // @[Mux.scala 27:72]
  wire  _T_850 = io_lsu_pkt_r_load | io_no_word_merge_r; // @[el2_lsu_bus_buffer.scala 257:55]
  wire  _T_851 = io_lsu_busreq_r & _T_850; // @[el2_lsu_bus_buffer.scala 257:34]
  wire  _T_852 = ~ibuf_valid; // @[el2_lsu_bus_buffer.scala 257:79]
  wire  ibuf_byp = _T_851 & _T_852; // @[el2_lsu_bus_buffer.scala 257:77]
  wire  _T_853 = io_lsu_busreq_r & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 258:36]
  wire  _T_854 = ~ibuf_byp; // @[el2_lsu_bus_buffer.scala 258:56]
  wire  ibuf_wr_en = _T_853 & _T_854; // @[el2_lsu_bus_buffer.scala 258:54]
  wire  _T_855 = ~ibuf_wr_en; // @[el2_lsu_bus_buffer.scala 260:36]
  reg [2:0] ibuf_timer; // @[el2_lsu_bus_buffer.scala 303:59]
  wire  _T_864 = ibuf_timer == 3'h7; // @[el2_lsu_bus_buffer.scala 266:62]
  wire  _T_865 = ibuf_wr_en | _T_864; // @[el2_lsu_bus_buffer.scala 266:48]
  wire  _T_929 = _T_853 & io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 285:54]
  wire  _T_930 = _T_929 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 285:75]
  wire  _T_931 = _T_930 & ibuf_write; // @[el2_lsu_bus_buffer.scala 285:88]
  wire  _T_934 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[el2_lsu_bus_buffer.scala 285:124]
  wire  _T_935 = _T_931 & _T_934; // @[el2_lsu_bus_buffer.scala 285:101]
  wire  _T_936 = ~io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 285:147]
  wire  _T_937 = _T_935 & _T_936; // @[el2_lsu_bus_buffer.scala 285:145]
  wire  _T_938 = ~io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 285:170]
  wire  ibuf_merge_en = _T_937 & _T_938; // @[el2_lsu_bus_buffer.scala 285:168]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 286:20]
  wire  _T_866 = ibuf_merge_en & ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 266:98]
  wire  _T_867 = ~_T_866; // @[el2_lsu_bus_buffer.scala 266:82]
  wire  _T_868 = _T_865 & _T_867; // @[el2_lsu_bus_buffer.scala 266:80]
  wire  _T_869 = _T_868 | ibuf_byp; // @[el2_lsu_bus_buffer.scala 267:5]
  wire  _T_857 = ~io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 261:44]
  wire  _T_858 = io_lsu_busreq_m & _T_857; // @[el2_lsu_bus_buffer.scala 261:42]
  wire  _T_859 = _T_858 & ibuf_valid; // @[el2_lsu_bus_buffer.scala 261:61]
  wire  _T_862 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[el2_lsu_bus_buffer.scala 261:115]
  wire  _T_863 = io_lsu_pkt_m_load | _T_862; // @[el2_lsu_bus_buffer.scala 261:95]
  wire  ibuf_force_drain = _T_859 & _T_863; // @[el2_lsu_bus_buffer.scala 261:74]
  wire  _T_870 = _T_869 | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 267:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_871 = _T_870 | ibuf_sideeffect; // @[el2_lsu_bus_buffer.scala 267:35]
  wire  _T_872 = ~ibuf_write; // @[el2_lsu_bus_buffer.scala 267:55]
  wire  _T_873 = _T_871 | _T_872; // @[el2_lsu_bus_buffer.scala 267:53]
  wire  _T_874 = _T_873 | io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_buffer.scala 267:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_874; // @[el2_lsu_bus_buffer.scala 266:32]
  wire  _T_856 = ibuf_drain_vld & _T_855; // @[el2_lsu_bus_buffer.scala 260:34]
  wire  ibuf_rst = _T_856 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 260:49]
  reg [1:0] WrPtr1_r; // @[el2_lsu_bus_buffer.scala 667:49]
  reg [1:0] WrPtr0_r; // @[el2_lsu_bus_buffer.scala 666:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_word,io_lsu_pkt_r_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_881 = ibuf_byteen | ldst_byteen_lo_r; // @[el2_lsu_bus_buffer.scala 276:77]
  wire [7:0] _T_889 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 281:8]
  wire [7:0] _T_892 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[el2_lsu_bus_buffer.scala 282:8]
  wire [7:0] _T_893 = _T_866 ? _T_889 : _T_892; // @[el2_lsu_bus_buffer.scala 280:46]
  wire [7:0] _T_898 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 281:8]
  wire [7:0] _T_901 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[el2_lsu_bus_buffer.scala 282:8]
  wire [7:0] _T_902 = _T_866 ? _T_898 : _T_901; // @[el2_lsu_bus_buffer.scala 280:46]
  wire [7:0] _T_907 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 281:8]
  wire [7:0] _T_910 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[el2_lsu_bus_buffer.scala 282:8]
  wire [7:0] _T_911 = _T_866 ? _T_907 : _T_910; // @[el2_lsu_bus_buffer.scala 280:46]
  wire [7:0] _T_916 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 281:8]
  wire [7:0] _T_919 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[el2_lsu_bus_buffer.scala 282:8]
  wire [7:0] _T_920 = _T_866 ? _T_916 : _T_919; // @[el2_lsu_bus_buffer.scala 280:46]
  wire [23:0] _T_922 = {_T_920,_T_911,_T_902}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 283:59]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 283:93]
  wire  _T_941 = ~ibuf_merge_in; // @[el2_lsu_bus_buffer.scala 287:65]
  wire  _T_942 = ibuf_merge_en & _T_941; // @[el2_lsu_bus_buffer.scala 287:63]
  wire  _T_945 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[el2_lsu_bus_buffer.scala 287:96]
  wire  _T_947 = _T_942 ? _T_945 : ibuf_byteen[0]; // @[el2_lsu_bus_buffer.scala 287:48]
  wire  _T_952 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[el2_lsu_bus_buffer.scala 287:96]
  wire  _T_954 = _T_942 ? _T_952 : ibuf_byteen[1]; // @[el2_lsu_bus_buffer.scala 287:48]
  wire  _T_959 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[el2_lsu_bus_buffer.scala 287:96]
  wire  _T_961 = _T_942 ? _T_959 : ibuf_byteen[2]; // @[el2_lsu_bus_buffer.scala 287:48]
  wire  _T_966 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[el2_lsu_bus_buffer.scala 287:96]
  wire  _T_968 = _T_942 ? _T_966 : ibuf_byteen[3]; // @[el2_lsu_bus_buffer.scala 287:48]
  wire [3:0] ibuf_byteen_out = {_T_968,_T_961,_T_954,_T_947}; // @[Cat.scala 29:58]
  wire [7:0] _T_978 = _T_942 ? _T_889 : ibuf_data[7:0]; // @[el2_lsu_bus_buffer.scala 288:45]
  wire [7:0] _T_986 = _T_942 ? _T_898 : ibuf_data[15:8]; // @[el2_lsu_bus_buffer.scala 288:45]
  wire [7:0] _T_994 = _T_942 ? _T_907 : ibuf_data[23:16]; // @[el2_lsu_bus_buffer.scala 288:45]
  wire [7:0] _T_1002 = _T_942 ? _T_916 : ibuf_data[31:24]; // @[el2_lsu_bus_buffer.scala 288:45]
  wire [31:0] ibuf_data_out = {_T_1002,_T_994,_T_986,_T_978}; // @[Cat.scala 29:58]
  wire  _T_1005 = ibuf_wr_en | ibuf_valid; // @[el2_lsu_bus_buffer.scala 290:28]
  wire  _T_1006 = ~ibuf_rst; // @[el2_lsu_bus_buffer.scala 290:63]
  wire  _T_1011 = ibuf_wr_en & io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_buffer.scala 291:89]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4467 = buf_write[3] & _T_2642; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4468 = ~buf_cmd_state_bus_en_3; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4469 = _T_4467 & _T_4468; // @[el2_lsu_bus_buffer.scala 573:89]
  wire  _T_4462 = buf_write[2] & _T_2637; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4463 = ~buf_cmd_state_bus_en_2; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4464 = _T_4462 & _T_4463; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [1:0] _T_4470 = _T_4469 + _T_4464; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_4457 = buf_write[1] & _T_2632; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4458 = ~buf_cmd_state_bus_en_1; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4459 = _T_4457 & _T_4458; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [1:0] _GEN_354 = {{1'd0}, _T_4459}; // @[el2_lsu_bus_buffer.scala 573:142]
  wire [2:0] _T_4471 = _T_4470 + _GEN_354; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_4452 = buf_write[0] & _T_2627; // @[el2_lsu_bus_buffer.scala 573:64]
  wire  _T_4453 = ~buf_cmd_state_bus_en_0; // @[el2_lsu_bus_buffer.scala 573:91]
  wire  _T_4454 = _T_4452 & _T_4453; // @[el2_lsu_bus_buffer.scala 573:89]
  wire [2:0] _GEN_355 = {{2'd0}, _T_4454}; // @[el2_lsu_bus_buffer.scala 573:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4471 + _GEN_355; // @[el2_lsu_bus_buffer.scala 573:142]
  wire  _T_1037 = buf_numvld_wrcmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 313:43]
  wire  _T_4484 = _T_2642 & _T_4468; // @[el2_lsu_bus_buffer.scala 574:73]
  wire  _T_4481 = _T_2637 & _T_4463; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [1:0] _T_4485 = _T_4484 + _T_4481; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4478 = _T_2632 & _T_4458; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [1:0] _GEN_356 = {{1'd0}, _T_4478}; // @[el2_lsu_bus_buffer.scala 574:126]
  wire [2:0] _T_4486 = _T_4485 + _GEN_356; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_4475 = _T_2627 & _T_4453; // @[el2_lsu_bus_buffer.scala 574:73]
  wire [2:0] _GEN_357 = {{2'd0}, _T_4475}; // @[el2_lsu_bus_buffer.scala 574:126]
  wire [3:0] buf_numvld_cmd_any = _T_4486 + _GEN_357; // @[el2_lsu_bus_buffer.scala 574:126]
  wire  _T_1038 = buf_numvld_cmd_any == 4'h1; // @[el2_lsu_bus_buffer.scala 313:72]
  wire  _T_1039 = _T_1037 & _T_1038; // @[el2_lsu_bus_buffer.scala 313:51]
  reg [2:0] obuf_wr_timer; // @[el2_lsu_bus_buffer.scala 412:54]
  wire  _T_1040 = obuf_wr_timer != 3'h7; // @[el2_lsu_bus_buffer.scala 313:97]
  wire  _T_1041 = _T_1039 & _T_1040; // @[el2_lsu_bus_buffer.scala 313:80]
  wire  _T_1043 = _T_1041 & _T_938; // @[el2_lsu_bus_buffer.scala 313:114]
  wire  _T_2000 = |buf_age_3; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_2001 = ~_T_2000; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_2003 = _T_2001 & _T_2642; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_2005 = _T_2003 & _T_4468; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1994 = |buf_age_2; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1995 = ~_T_1994; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1997 = _T_1995 & _T_2637; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1999 = _T_1997 & _T_4463; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1988 = |buf_age_1; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1989 = ~_T_1988; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1991 = _T_1989 & _T_2632; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1993 = _T_1991 & _T_4458; // @[el2_lsu_bus_buffer.scala 429:88]
  wire  _T_1982 = |buf_age_0; // @[el2_lsu_bus_buffer.scala 429:58]
  wire  _T_1983 = ~_T_1982; // @[el2_lsu_bus_buffer.scala 429:45]
  wire  _T_1985 = _T_1983 & _T_2627; // @[el2_lsu_bus_buffer.scala 429:63]
  wire  _T_1987 = _T_1985 & _T_4453; // @[el2_lsu_bus_buffer.scala 429:88]
  wire [3:0] CmdPtr0Dec = {_T_2005,_T_1999,_T_1993,_T_1987}; // @[Cat.scala 29:58]
  wire [7:0] _T_2075 = {4'h0,_T_2005,_T_1999,_T_1993,_T_1987}; // @[Cat.scala 29:58]
  wire  _T_2078 = _T_2075[4] | _T_2075[5]; // @[el2_lsu_bus_buffer.scala 437:42]
  wire  _T_2080 = _T_2078 | _T_2075[6]; // @[el2_lsu_bus_buffer.scala 437:48]
  wire  _T_2082 = _T_2080 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 437:54]
  wire  _T_2085 = _T_2075[2] | _T_2075[3]; // @[el2_lsu_bus_buffer.scala 437:67]
  wire  _T_2087 = _T_2085 | _T_2075[6]; // @[el2_lsu_bus_buffer.scala 437:73]
  wire  _T_2089 = _T_2087 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 437:79]
  wire  _T_2092 = _T_2075[1] | _T_2075[3]; // @[el2_lsu_bus_buffer.scala 437:92]
  wire  _T_2094 = _T_2092 | _T_2075[5]; // @[el2_lsu_bus_buffer.scala 437:98]
  wire  _T_2096 = _T_2094 | _T_2075[7]; // @[el2_lsu_bus_buffer.scala 437:104]
  wire [2:0] _T_2098 = {_T_2082,_T_2089,_T_2096}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2098[1:0]; // @[el2_lsu_bus_buffer.scala 442:11]
  wire  _T_1044 = CmdPtr0 == 2'h0; // @[el2_lsu_bus_buffer.scala 314:114]
  wire  _T_1045 = CmdPtr0 == 2'h1; // @[el2_lsu_bus_buffer.scala 314:114]
  wire  _T_1046 = CmdPtr0 == 2'h2; // @[el2_lsu_bus_buffer.scala 314:114]
  wire  _T_1047 = CmdPtr0 == 2'h3; // @[el2_lsu_bus_buffer.scala 314:114]
  reg  buf_nomerge_0; // @[Reg.scala 27:20]
  wire  _T_1048 = _T_1044 & buf_nomerge_0; // @[Mux.scala 27:72]
  reg  buf_nomerge_1; // @[Reg.scala 27:20]
  wire  _T_1049 = _T_1045 & buf_nomerge_1; // @[Mux.scala 27:72]
  reg  buf_nomerge_2; // @[Reg.scala 27:20]
  wire  _T_1050 = _T_1046 & buf_nomerge_2; // @[Mux.scala 27:72]
  reg  buf_nomerge_3; // @[Reg.scala 27:20]
  wire  _T_1051 = _T_1047 & buf_nomerge_3; // @[Mux.scala 27:72]
  wire  _T_1052 = _T_1048 | _T_1049; // @[Mux.scala 27:72]
  wire  _T_1053 = _T_1052 | _T_1050; // @[Mux.scala 27:72]
  wire  _T_1054 = _T_1053 | _T_1051; // @[Mux.scala 27:72]
  wire  _T_1056 = ~_T_1054; // @[el2_lsu_bus_buffer.scala 314:31]
  wire  _T_1057 = _T_1043 & _T_1056; // @[el2_lsu_bus_buffer.scala 314:29]
  reg  _T_4351; // @[Reg.scala 27:20]
  reg  _T_4348; // @[Reg.scala 27:20]
  reg  _T_4345; // @[Reg.scala 27:20]
  reg  _T_4342; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4351,_T_4348,_T_4345,_T_4342}; // @[Cat.scala 29:58]
  wire  _T_1066 = _T_1044 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1067 = _T_1045 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1068 = _T_1046 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1069 = _T_1047 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1070 = _T_1066 | _T_1067; // @[Mux.scala 27:72]
  wire  _T_1071 = _T_1070 | _T_1068; // @[Mux.scala 27:72]
  wire  _T_1072 = _T_1071 | _T_1069; // @[Mux.scala 27:72]
  wire  _T_1074 = ~_T_1072; // @[el2_lsu_bus_buffer.scala 315:5]
  wire  _T_1075 = _T_1057 & _T_1074; // @[el2_lsu_bus_buffer.scala 314:140]
  wire  _T_1086 = _T_858 & _T_852; // @[el2_lsu_bus_buffer.scala 317:58]
  wire  _T_1088 = _T_1086 & _T_1038; // @[el2_lsu_bus_buffer.scala 317:72]
  wire [29:0] _T_1098 = _T_1044 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1099 = _T_1045 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1102 = _T_1098 | _T_1099; // @[Mux.scala 27:72]
  wire [29:0] _T_1100 = _T_1046 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1103 = _T_1102 | _T_1100; // @[Mux.scala 27:72]
  wire [29:0] _T_1101 = _T_1047 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire  _T_1106 = io_lsu_addr_m[31:2] != _T_1104; // @[el2_lsu_bus_buffer.scala 317:123]
  wire  obuf_force_wr_en = _T_1088 & _T_1106; // @[el2_lsu_bus_buffer.scala 317:101]
  wire  _T_1076 = ~obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 315:119]
  wire  obuf_wr_wait = _T_1075 & _T_1076; // @[el2_lsu_bus_buffer.scala 315:117]
  wire  _T_1077 = |buf_numvld_cmd_any; // @[el2_lsu_bus_buffer.scala 316:75]
  wire  _T_1078 = obuf_wr_timer < 3'h7; // @[el2_lsu_bus_buffer.scala 316:95]
  wire  _T_1079 = _T_1077 & _T_1078; // @[el2_lsu_bus_buffer.scala 316:79]
  wire [2:0] _T_1081 = obuf_wr_timer + 3'h1; // @[el2_lsu_bus_buffer.scala 316:121]
  wire  _T_4503 = buf_state_3 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4507 = _T_4503 | _T_4484; // @[el2_lsu_bus_buffer.scala 575:74]
  wire  _T_4498 = buf_state_2 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4502 = _T_4498 | _T_4481; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [1:0] _T_4508 = _T_4507 + _T_4502; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_4493 = buf_state_1 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4497 = _T_4493 | _T_4478; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [1:0] _GEN_358 = {{1'd0}, _T_4497}; // @[el2_lsu_bus_buffer.scala 575:154]
  wire [2:0] _T_4509 = _T_4508 + _GEN_358; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_4488 = buf_state_0 == 3'h1; // @[el2_lsu_bus_buffer.scala 575:63]
  wire  _T_4492 = _T_4488 | _T_4475; // @[el2_lsu_bus_buffer.scala 575:74]
  wire [2:0] _GEN_359 = {{2'd0}, _T_4492}; // @[el2_lsu_bus_buffer.scala 575:154]
  wire [3:0] buf_numvld_pend_any = _T_4509 + _GEN_359; // @[el2_lsu_bus_buffer.scala 575:154]
  wire  _T_1108 = buf_numvld_pend_any == 4'h0; // @[el2_lsu_bus_buffer.scala 319:53]
  wire  _T_1109 = ibuf_byp & _T_1108; // @[el2_lsu_bus_buffer.scala 319:31]
  wire  _T_1110 = ~io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 319:64]
  wire  _T_1111 = _T_1110 | io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 319:84]
  wire  ibuf_buf_byp = _T_1109 & _T_1111; // @[el2_lsu_bus_buffer.scala 319:61]
  wire  _T_1112 = ibuf_buf_byp & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 334:32]
  wire  _T_4799 = buf_state_0 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4801 = _T_4799 & buf_sideeffect[0]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4802 = _T_4801 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4803 = buf_state_1 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4805 = _T_4803 & buf_sideeffect[1]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4806 = _T_4805 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4815 = _T_4802 | _T_4806; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_4807 = buf_state_2 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4809 = _T_4807 & buf_sideeffect[2]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4810 = _T_4809 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  _T_4816 = _T_4815 | _T_4810; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_4811 = buf_state_3 == 3'h3; // @[el2_lsu_bus_buffer.scala 603:62]
  wire  _T_4813 = _T_4811 & buf_sideeffect[3]; // @[el2_lsu_bus_buffer.scala 603:73]
  wire  _T_4814 = _T_4813 & io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_buffer.scala 603:93]
  wire  bus_sideeffect_pend = _T_4816 | _T_4814; // @[el2_lsu_bus_buffer.scala 603:141]
  wire  _T_1113 = io_is_sideeffects_r & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 334:74]
  wire  _T_1114 = ~_T_1113; // @[el2_lsu_bus_buffer.scala 334:52]
  wire  _T_1115 = _T_1112 & _T_1114; // @[el2_lsu_bus_buffer.scala 334:50]
  wire [2:0] _T_1120 = _T_1044 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1121 = _T_1045 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire [2:0] _T_1122 = _T_1046 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire [2:0] _T_1123 = _T_1047 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = _T_1126 == 3'h2; // @[el2_lsu_bus_buffer.scala 335:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 434:31]
  wire  _T_1129 = _T_1128 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 335:47]
  wire [3:0] _T_1132 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1141 = _T_1044 & _T_1132[0]; // @[Mux.scala 27:72]
  wire  _T_1142 = _T_1045 & _T_1132[1]; // @[Mux.scala 27:72]
  wire  _T_1145 = _T_1141 | _T_1142; // @[Mux.scala 27:72]
  wire  _T_1143 = _T_1046 & _T_1132[2]; // @[Mux.scala 27:72]
  wire  _T_1146 = _T_1145 | _T_1143; // @[Mux.scala 27:72]
  wire  _T_1144 = _T_1047 & _T_1132[3]; // @[Mux.scala 27:72]
  wire  _T_1147 = _T_1146 | _T_1144; // @[Mux.scala 27:72]
  wire  _T_1149 = ~_T_1147; // @[el2_lsu_bus_buffer.scala 336:23]
  wire  _T_1150 = _T_1129 & _T_1149; // @[el2_lsu_bus_buffer.scala 336:21]
  wire  _T_1167 = _T_1072 & bus_sideeffect_pend; // @[el2_lsu_bus_buffer.scala 336:141]
  wire  _T_1168 = ~_T_1167; // @[el2_lsu_bus_buffer.scala 336:105]
  wire  _T_1169 = _T_1150 & _T_1168; // @[el2_lsu_bus_buffer.scala 336:103]
  reg  buf_dual_3; // @[Reg.scala 27:20]
  reg  buf_dual_2; // @[Reg.scala 27:20]
  reg  buf_dual_1; // @[Reg.scala 27:20]
  reg  buf_dual_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1172 = {buf_dual_3,buf_dual_2,buf_dual_1,buf_dual_0}; // @[Cat.scala 29:58]
  wire  _T_1181 = _T_1044 & _T_1172[0]; // @[Mux.scala 27:72]
  wire  _T_1182 = _T_1045 & _T_1172[1]; // @[Mux.scala 27:72]
  wire  _T_1185 = _T_1181 | _T_1182; // @[Mux.scala 27:72]
  wire  _T_1183 = _T_1046 & _T_1172[2]; // @[Mux.scala 27:72]
  wire  _T_1186 = _T_1185 | _T_1183; // @[Mux.scala 27:72]
  wire  _T_1184 = _T_1047 & _T_1172[3]; // @[Mux.scala 27:72]
  wire  _T_1187 = _T_1186 | _T_1184; // @[Mux.scala 27:72]
  reg  buf_samedw_3; // @[Reg.scala 27:20]
  reg  buf_samedw_2; // @[Reg.scala 27:20]
  reg  buf_samedw_1; // @[Reg.scala 27:20]
  reg  buf_samedw_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1191 = {buf_samedw_3,buf_samedw_2,buf_samedw_1,buf_samedw_0}; // @[Cat.scala 29:58]
  wire  _T_1200 = _T_1044 & _T_1191[0]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1045 & _T_1191[1]; // @[Mux.scala 27:72]
  wire  _T_1204 = _T_1200 | _T_1201; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1046 & _T_1191[2]; // @[Mux.scala 27:72]
  wire  _T_1205 = _T_1204 | _T_1202; // @[Mux.scala 27:72]
  wire  _T_1203 = _T_1047 & _T_1191[3]; // @[Mux.scala 27:72]
  wire  _T_1206 = _T_1205 | _T_1203; // @[Mux.scala 27:72]
  wire  _T_1208 = _T_1187 & _T_1206; // @[el2_lsu_bus_buffer.scala 337:77]
  wire  _T_1217 = _T_1044 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1218 = _T_1045 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1217 | _T_1218; // @[Mux.scala 27:72]
  wire  _T_1219 = _T_1046 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1221 | _T_1219; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1047 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1222 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1225 = ~_T_1223; // @[el2_lsu_bus_buffer.scala 337:150]
  wire  _T_1226 = _T_1208 & _T_1225; // @[el2_lsu_bus_buffer.scala 337:148]
  wire  _T_1227 = ~_T_1226; // @[el2_lsu_bus_buffer.scala 337:8]
  wire [3:0] _T_2041 = ~CmdPtr0Dec; // @[el2_lsu_bus_buffer.scala 430:62]
  wire [3:0] _T_2042 = buf_age_3 & _T_2041; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2043 = |_T_2042; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2044 = ~_T_2043; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2046 = ~CmdPtr0Dec[3]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2047 = _T_2044 & _T_2046; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2049 = _T_2047 & _T_2642; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2051 = _T_2049 & _T_4468; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_2031 = buf_age_2 & _T_2041; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2032 = |_T_2031; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2033 = ~_T_2032; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2035 = ~CmdPtr0Dec[2]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2036 = _T_2033 & _T_2035; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2038 = _T_2036 & _T_2637; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2040 = _T_2038 & _T_4463; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_2020 = buf_age_1 & _T_2041; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2021 = |_T_2020; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2022 = ~_T_2021; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2024 = ~CmdPtr0Dec[1]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2025 = _T_2022 & _T_2024; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2027 = _T_2025 & _T_2632; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2029 = _T_2027 & _T_4458; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] _T_2009 = buf_age_0 & _T_2041; // @[el2_lsu_bus_buffer.scala 430:59]
  wire  _T_2010 = |_T_2009; // @[el2_lsu_bus_buffer.scala 430:76]
  wire  _T_2011 = ~_T_2010; // @[el2_lsu_bus_buffer.scala 430:45]
  wire  _T_2013 = ~CmdPtr0Dec[0]; // @[el2_lsu_bus_buffer.scala 430:83]
  wire  _T_2014 = _T_2011 & _T_2013; // @[el2_lsu_bus_buffer.scala 430:81]
  wire  _T_2016 = _T_2014 & _T_2627; // @[el2_lsu_bus_buffer.scala 430:98]
  wire  _T_2018 = _T_2016 & _T_4453; // @[el2_lsu_bus_buffer.scala 430:123]
  wire [3:0] CmdPtr1Dec = {_T_2051,_T_2040,_T_2029,_T_2018}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[el2_lsu_bus_buffer.scala 435:31]
  wire  _T_1228 = _T_1227 | found_cmdptr1; // @[el2_lsu_bus_buffer.scala 337:181]
  wire [3:0] _T_1231 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1240 = _T_1044 & _T_1231[0]; // @[Mux.scala 27:72]
  wire  _T_1241 = _T_1045 & _T_1231[1]; // @[Mux.scala 27:72]
  wire  _T_1244 = _T_1240 | _T_1241; // @[Mux.scala 27:72]
  wire  _T_1242 = _T_1046 & _T_1231[2]; // @[Mux.scala 27:72]
  wire  _T_1245 = _T_1244 | _T_1242; // @[Mux.scala 27:72]
  wire  _T_1243 = _T_1047 & _T_1231[3]; // @[Mux.scala 27:72]
  wire  _T_1246 = _T_1245 | _T_1243; // @[Mux.scala 27:72]
  wire  _T_1248 = _T_1228 | _T_1246; // @[el2_lsu_bus_buffer.scala 337:197]
  wire  _T_1249 = _T_1248 | obuf_force_wr_en; // @[el2_lsu_bus_buffer.scala 337:269]
  wire  _T_1250 = _T_1169 & _T_1249; // @[el2_lsu_bus_buffer.scala 336:164]
  wire  _T_1251 = _T_1115 | _T_1250; // @[el2_lsu_bus_buffer.scala 334:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 399:54]
  reg  obuf_data_done; // @[el2_lsu_bus_buffer.scala 400:55]
  wire  _T_4874 = obuf_cmd_done | obuf_data_done; // @[el2_lsu_bus_buffer.scala 607:54]
  wire  _T_4875 = obuf_cmd_done ? io_lsu_axi_wready : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 607:75]
  wire  _T_4877 = _T_4874 ? _T_4875 : io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 607:39]
  wire  bus_cmd_ready = obuf_write ? _T_4877 : io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 607:23]
  wire  _T_1252 = ~obuf_valid; // @[el2_lsu_bus_buffer.scala 338:48]
  wire  _T_1253 = bus_cmd_ready | _T_1252; // @[el2_lsu_bus_buffer.scala 338:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1254 = _T_1253 | obuf_nosend; // @[el2_lsu_bus_buffer.scala 338:60]
  wire  _T_1255 = _T_1251 & _T_1254; // @[el2_lsu_bus_buffer.scala 338:29]
  wire  _T_1256 = ~obuf_wr_wait; // @[el2_lsu_bus_buffer.scala 338:77]
  wire  _T_1257 = _T_1255 & _T_1256; // @[el2_lsu_bus_buffer.scala 338:75]
  reg [31:0] obuf_addr; // @[el2_lib.scala 512:16]
  wire  _T_4822 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4823 = obuf_valid & _T_4822; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4825 = obuf_tag1 == 2'h0; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4826 = obuf_merge & _T_4825; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4827 = _T_3583 | _T_4826; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4828 = ~_T_4827; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4829 = _T_4823 & _T_4828; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4866 = _T_4799 & _T_4829; // @[Mux.scala 27:72]
  wire  _T_4834 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4835 = obuf_valid & _T_4834; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4837 = obuf_tag1 == 2'h1; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4838 = obuf_merge & _T_4837; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4839 = _T_3776 | _T_4838; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4840 = ~_T_4839; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4841 = _T_4835 & _T_4840; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4867 = _T_4803 & _T_4841; // @[Mux.scala 27:72]
  wire  _T_4870 = _T_4866 | _T_4867; // @[Mux.scala 27:72]
  wire  _T_4846 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4847 = obuf_valid & _T_4846; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4849 = obuf_tag1 == 2'h2; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4850 = obuf_merge & _T_4849; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4851 = _T_3969 | _T_4850; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4852 = ~_T_4851; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4853 = _T_4847 & _T_4852; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4868 = _T_4807 & _T_4853; // @[Mux.scala 27:72]
  wire  _T_4871 = _T_4870 | _T_4868; // @[Mux.scala 27:72]
  wire  _T_4858 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[el2_lsu_bus_buffer.scala 605:56]
  wire  _T_4859 = obuf_valid & _T_4858; // @[el2_lsu_bus_buffer.scala 605:38]
  wire  _T_4861 = obuf_tag1 == 2'h3; // @[el2_lsu_bus_buffer.scala 605:126]
  wire  _T_4862 = obuf_merge & _T_4861; // @[el2_lsu_bus_buffer.scala 605:114]
  wire  _T_4863 = _T_4162 | _T_4862; // @[el2_lsu_bus_buffer.scala 605:100]
  wire  _T_4864 = ~_T_4863; // @[el2_lsu_bus_buffer.scala 605:80]
  wire  _T_4865 = _T_4859 & _T_4864; // @[el2_lsu_bus_buffer.scala 605:78]
  wire  _T_4869 = _T_4811 & _T_4865; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4871 | _T_4869; // @[Mux.scala 27:72]
  wire  _T_1260 = ~bus_addr_match_pending; // @[el2_lsu_bus_buffer.scala 338:118]
  wire  _T_1261 = _T_1257 & _T_1260; // @[el2_lsu_bus_buffer.scala 338:116]
  wire  obuf_wr_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 338:142]
  wire  _T_1263 = obuf_valid & obuf_nosend; // @[el2_lsu_bus_buffer.scala 340:47]
  wire  bus_wcmd_sent = io_lsu_axi_awvalid & io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 608:39]
  wire  _T_4881 = obuf_cmd_done | bus_wcmd_sent; // @[el2_lsu_bus_buffer.scala 610:35]
  wire  bus_wdata_sent = io_lsu_axi_wvalid & io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 609:39]
  wire  _T_4882 = obuf_data_done | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 610:70]
  wire  _T_4883 = _T_4881 & _T_4882; // @[el2_lsu_bus_buffer.scala 610:52]
  wire  _T_4884 = io_lsu_axi_arvalid & io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 610:111]
  wire  bus_cmd_sent = _T_4883 | _T_4884; // @[el2_lsu_bus_buffer.scala 610:89]
  wire  _T_1264 = bus_cmd_sent | _T_1263; // @[el2_lsu_bus_buffer.scala 340:33]
  wire  _T_1265 = ~obuf_wr_en; // @[el2_lsu_bus_buffer.scala 340:65]
  wire  _T_1266 = _T_1264 & _T_1265; // @[el2_lsu_bus_buffer.scala 340:63]
  wire  _T_1267 = _T_1266 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 340:77]
  wire  obuf_rst = _T_1267 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 340:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_store : _T_1223; // @[el2_lsu_bus_buffer.scala 341:26]
  wire [31:0] _T_1304 = _T_1044 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1305 = _T_1045 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1306 = _T_1046 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1307 = _T_1047 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1308 = _T_1304 | _T_1305; // @[Mux.scala 27:72]
  wire [31:0] _T_1309 = _T_1308 | _T_1306; // @[Mux.scala 27:72]
  wire [31:0] _T_1310 = _T_1309 | _T_1307; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1310; // @[el2_lsu_bus_buffer.scala 343:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1317 = _T_1044 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1318 = _T_1045 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1319 = _T_1046 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1320 = _T_1047 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1321 = _T_1317 | _T_1318; // @[Mux.scala 27:72]
  wire [1:0] _T_1322 = _T_1321 | _T_1319; // @[Mux.scala 27:72]
  wire [1:0] _T_1323 = _T_1322 | _T_1320; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1323; // @[el2_lsu_bus_buffer.scala 346:23]
  wire  _T_1325 = obuf_wr_en | obuf_rst; // @[el2_lsu_bus_buffer.scala 355:39]
  wire  _T_1326 = ~_T_1325; // @[el2_lsu_bus_buffer.scala 355:26]
  wire  _T_1332 = obuf_sz_in == 2'h0; // @[el2_lsu_bus_buffer.scala 359:72]
  wire  _T_1335 = ~obuf_addr_in[0]; // @[el2_lsu_bus_buffer.scala 359:98]
  wire  _T_1336 = obuf_sz_in[0] & _T_1335; // @[el2_lsu_bus_buffer.scala 359:96]
  wire  _T_1337 = _T_1332 | _T_1336; // @[el2_lsu_bus_buffer.scala 359:79]
  wire  _T_1340 = |obuf_addr_in[1:0]; // @[el2_lsu_bus_buffer.scala 359:153]
  wire  _T_1341 = ~_T_1340; // @[el2_lsu_bus_buffer.scala 359:134]
  wire  _T_1342 = obuf_sz_in[1] & _T_1341; // @[el2_lsu_bus_buffer.scala 359:132]
  wire  _T_1343 = _T_1337 | _T_1342; // @[el2_lsu_bus_buffer.scala 359:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1343; // @[el2_lsu_bus_buffer.scala 359:28]
  wire  _T_1360 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[el2_lsu_bus_buffer.scala 373:40]
  wire  _T_1361 = _T_1360 & obuf_aligned_in; // @[el2_lsu_bus_buffer.scala 373:60]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_1362 = ~obuf_sideeffect; // @[el2_lsu_bus_buffer.scala 373:80]
  wire  _T_1363 = _T_1361 & _T_1362; // @[el2_lsu_bus_buffer.scala 373:78]
  wire  _T_1364 = ~obuf_write; // @[el2_lsu_bus_buffer.scala 373:99]
  wire  _T_1365 = _T_1363 & _T_1364; // @[el2_lsu_bus_buffer.scala 373:97]
  wire  _T_1366 = ~obuf_write_in; // @[el2_lsu_bus_buffer.scala 373:113]
  wire  _T_1367 = _T_1365 & _T_1366; // @[el2_lsu_bus_buffer.scala 373:111]
  wire  _T_1368 = ~io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_buffer.scala 373:130]
  wire  _T_1369 = _T_1367 & _T_1368; // @[el2_lsu_bus_buffer.scala 373:128]
  wire  _T_1370 = ~obuf_nosend; // @[el2_lsu_bus_buffer.scala 374:20]
  wire  _T_1371 = obuf_valid & _T_1370; // @[el2_lsu_bus_buffer.scala 374:18]
  reg  obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 401:56]
  wire  bus_rsp_read = io_lsu_axi_rvalid & io_lsu_axi_rready; // @[el2_lsu_bus_buffer.scala 611:37]
  reg [2:0] obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 402:55]
  wire  _T_1372 = io_lsu_axi_rid == obuf_rdrsp_tag; // @[el2_lsu_bus_buffer.scala 374:90]
  wire  _T_1373 = bus_rsp_read & _T_1372; // @[el2_lsu_bus_buffer.scala 374:70]
  wire  _T_1374 = ~_T_1373; // @[el2_lsu_bus_buffer.scala 374:55]
  wire  _T_1375 = obuf_rdrsp_pend & _T_1374; // @[el2_lsu_bus_buffer.scala 374:53]
  wire  _T_1376 = _T_1371 | _T_1375; // @[el2_lsu_bus_buffer.scala 374:34]
  wire  obuf_nosend_in = _T_1369 & _T_1376; // @[el2_lsu_bus_buffer.scala 373:165]
  wire  _T_1344 = ~obuf_nosend_in; // @[el2_lsu_bus_buffer.scala 367:44]
  wire  _T_1345 = obuf_wr_en & _T_1344; // @[el2_lsu_bus_buffer.scala 367:42]
  wire  _T_1346 = ~_T_1345; // @[el2_lsu_bus_buffer.scala 367:29]
  wire  _T_1347 = _T_1346 & obuf_rdrsp_pend; // @[el2_lsu_bus_buffer.scala 367:61]
  wire  _T_1351 = _T_1347 & _T_1374; // @[el2_lsu_bus_buffer.scala 367:79]
  wire  _T_1353 = bus_cmd_sent & _T_1364; // @[el2_lsu_bus_buffer.scala 368:20]
  wire  _T_1354 = ~io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 368:37]
  wire  _T_1355 = _T_1353 & _T_1354; // @[el2_lsu_bus_buffer.scala 368:35]
  wire  _T_1357 = bus_cmd_sent | _T_1364; // @[el2_lsu_bus_buffer.scala 370:44]
  wire [7:0] _T_1379 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1380 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1381 = io_lsu_addr_r[2] ? _T_1379 : _T_1380; // @[el2_lsu_bus_buffer.scala 375:46]
  wire [3:0] _T_1400 = _T_1044 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1401 = _T_1045 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1402 = _T_1046 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1403 = _T_1047 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1404 = _T_1400 | _T_1401; // @[Mux.scala 27:72]
  wire [3:0] _T_1405 = _T_1404 | _T_1402; // @[Mux.scala 27:72]
  wire [3:0] _T_1406 = _T_1405 | _T_1403; // @[Mux.scala 27:72]
  wire [7:0] _T_1408 = {_T_1406,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1421 = {4'h0,_T_1406}; // @[Cat.scala 29:58]
  wire [7:0] _T_1422 = _T_1310[2] ? _T_1408 : _T_1421; // @[el2_lsu_bus_buffer.scala 376:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1381 : _T_1422; // @[el2_lsu_bus_buffer.scala 375:28]
  wire [7:0] _T_1424 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1425 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1426 = io_end_addr_r[2] ? _T_1424 : _T_1425; // @[el2_lsu_bus_buffer.scala 377:46]
  wire [7:0] _T_1453 = {buf_byteen_0,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1466 = {4'h0,buf_byteen_0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1467 = buf_addr_0[2] ? _T_1453 : _T_1466; // @[el2_lsu_bus_buffer.scala 378:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1426 : _T_1467; // @[el2_lsu_bus_buffer.scala 377:28]
  wire [63:0] _T_1469 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1470 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1471 = io_lsu_addr_r[2] ? _T_1469 : _T_1470; // @[el2_lsu_bus_buffer.scala 380:44]
  wire [31:0] _T_1490 = _T_1044 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1491 = _T_1045 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1492 = _T_1046 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1493 = _T_1047 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1494 = _T_1490 | _T_1491; // @[Mux.scala 27:72]
  wire [31:0] _T_1495 = _T_1494 | _T_1492; // @[Mux.scala 27:72]
  wire [31:0] _T_1496 = _T_1495 | _T_1493; // @[Mux.scala 27:72]
  wire [63:0] _T_1498 = {_T_1496,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1511 = {32'h0,_T_1496}; // @[Cat.scala 29:58]
  wire [63:0] _T_1512 = _T_1310[2] ? _T_1498 : _T_1511; // @[el2_lsu_bus_buffer.scala 381:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1471 : _T_1512; // @[el2_lsu_bus_buffer.scala 380:26]
  wire [63:0] _T_1514 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1515 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1516 = io_lsu_addr_r[2] ? _T_1514 : _T_1515; // @[el2_lsu_bus_buffer.scala 382:44]
  wire [63:0] _T_1543 = {buf_data_0,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1556 = {32'h0,buf_data_0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1557 = buf_addr_0[2] ? _T_1543 : _T_1556; // @[el2_lsu_bus_buffer.scala 383:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1516 : _T_1557; // @[el2_lsu_bus_buffer.scala 382:26]
  wire  _T_1642 = CmdPtr0 != 2'h0; // @[el2_lsu_bus_buffer.scala 389:30]
  wire  _T_1643 = _T_1642 & found_cmdptr0; // @[el2_lsu_bus_buffer.scala 389:43]
  wire  _T_1644 = _T_1643 & found_cmdptr1; // @[el2_lsu_bus_buffer.scala 389:59]
  wire  _T_1658 = _T_1644 & _T_1128; // @[el2_lsu_bus_buffer.scala 389:75]
  wire  _T_1672 = _T_1658 & _T_2627; // @[el2_lsu_bus_buffer.scala 389:118]
  wire  _T_1693 = _T_1672 & _T_1149; // @[el2_lsu_bus_buffer.scala 389:161]
  wire  _T_1711 = _T_1693 & _T_1074; // @[el2_lsu_bus_buffer.scala 390:83]
  wire  _T_1813 = _T_1225 & _T_1187; // @[el2_lsu_bus_buffer.scala 393:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1816 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1825 = _T_1044 & _T_1816[0]; // @[Mux.scala 27:72]
  wire  _T_1826 = _T_1045 & _T_1816[1]; // @[Mux.scala 27:72]
  wire  _T_1829 = _T_1825 | _T_1826; // @[Mux.scala 27:72]
  wire  _T_1827 = _T_1046 & _T_1816[2]; // @[Mux.scala 27:72]
  wire  _T_1830 = _T_1829 | _T_1827; // @[Mux.scala 27:72]
  wire  _T_1828 = _T_1047 & _T_1816[3]; // @[Mux.scala 27:72]
  wire  _T_1831 = _T_1830 | _T_1828; // @[Mux.scala 27:72]
  wire  _T_1833 = ~_T_1831; // @[el2_lsu_bus_buffer.scala 393:107]
  wire  _T_1834 = _T_1813 & _T_1833; // @[el2_lsu_bus_buffer.scala 393:105]
  wire  _T_1854 = _T_1834 & _T_1206; // @[el2_lsu_bus_buffer.scala 393:177]
  wire  _T_1856 = _T_1711 & _T_1854; // @[el2_lsu_bus_buffer.scala 390:120]
  wire  _T_1857 = ibuf_buf_byp & ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 394:19]
  wire  _T_1858 = _T_1857 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 394:35]
  wire  obuf_merge_en = _T_1856 | _T_1858; // @[el2_lsu_bus_buffer.scala 393:251]
  wire  _T_1560 = obuf_merge_en & obuf_byteen1_in[0]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1561 = obuf_byteen0_in[0] | _T_1560; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1564 = obuf_merge_en & obuf_byteen1_in[1]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1565 = obuf_byteen0_in[1] | _T_1564; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1568 = obuf_merge_en & obuf_byteen1_in[2]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1569 = obuf_byteen0_in[2] | _T_1568; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1572 = obuf_merge_en & obuf_byteen1_in[3]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1573 = obuf_byteen0_in[3] | _T_1572; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1576 = obuf_merge_en & obuf_byteen1_in[4]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1577 = obuf_byteen0_in[4] | _T_1576; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1580 = obuf_merge_en & obuf_byteen1_in[5]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1581 = obuf_byteen0_in[5] | _T_1580; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1584 = obuf_merge_en & obuf_byteen1_in[6]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1585 = obuf_byteen0_in[6] | _T_1584; // @[el2_lsu_bus_buffer.scala 384:63]
  wire  _T_1588 = obuf_merge_en & obuf_byteen1_in[7]; // @[el2_lsu_bus_buffer.scala 384:80]
  wire  _T_1589 = obuf_byteen0_in[7] | _T_1588; // @[el2_lsu_bus_buffer.scala 384:63]
  wire [7:0] obuf_byteen_in = {_T_1589,_T_1585,_T_1581,_T_1577,_T_1573,_T_1569,_T_1565,_T_1561}; // @[Cat.scala 29:58]
  wire [7:0] _T_1600 = _T_1560 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1605 = _T_1564 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1610 = _T_1568 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1615 = _T_1572 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1620 = _T_1576 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1625 = _T_1580 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1630 = _T_1584 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [7:0] _T_1635 = _T_1588 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[el2_lsu_bus_buffer.scala 385:44]
  wire [55:0] _T_1641 = {_T_1635,_T_1630,_T_1625,_T_1620,_T_1615,_T_1610,_T_1605}; // @[Cat.scala 29:58]
  wire  _T_1860 = obuf_wr_en | obuf_valid; // @[el2_lsu_bus_buffer.scala 397:58]
  wire  _T_1861 = ~obuf_rst; // @[el2_lsu_bus_buffer.scala 397:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[el2_lib.scala 512:16]
  wire  _T_1874 = buf_state_0 == 3'h0; // @[el2_lsu_bus_buffer.scala 415:65]
  wire  _T_1875 = ibuf_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 416:30]
  wire  _T_1876 = ibuf_valid & _T_1875; // @[el2_lsu_bus_buffer.scala 416:19]
  wire  _T_1877 = WrPtr0_r == 2'h0; // @[el2_lsu_bus_buffer.scala 417:18]
  wire  _T_1878 = WrPtr1_r == 2'h0; // @[el2_lsu_bus_buffer.scala 417:57]
  wire  _T_1879 = io_ldst_dual_r & _T_1878; // @[el2_lsu_bus_buffer.scala 417:45]
  wire  _T_1880 = _T_1877 | _T_1879; // @[el2_lsu_bus_buffer.scala 417:27]
  wire  _T_1881 = io_lsu_busreq_r & _T_1880; // @[el2_lsu_bus_buffer.scala 416:58]
  wire  _T_1882 = _T_1876 | _T_1881; // @[el2_lsu_bus_buffer.scala 416:39]
  wire  _T_1883 = ~_T_1882; // @[el2_lsu_bus_buffer.scala 416:5]
  wire  _T_1884 = _T_1874 & _T_1883; // @[el2_lsu_bus_buffer.scala 415:76]
  wire  _T_1885 = buf_state_1 == 3'h0; // @[el2_lsu_bus_buffer.scala 415:65]
  wire  _T_1886 = ibuf_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 416:30]
  wire  _T_1887 = ibuf_valid & _T_1886; // @[el2_lsu_bus_buffer.scala 416:19]
  wire  _T_1888 = WrPtr0_r == 2'h1; // @[el2_lsu_bus_buffer.scala 417:18]
  wire  _T_1889 = WrPtr1_r == 2'h1; // @[el2_lsu_bus_buffer.scala 417:57]
  wire  _T_1890 = io_ldst_dual_r & _T_1889; // @[el2_lsu_bus_buffer.scala 417:45]
  wire  _T_1891 = _T_1888 | _T_1890; // @[el2_lsu_bus_buffer.scala 417:27]
  wire  _T_1892 = io_lsu_busreq_r & _T_1891; // @[el2_lsu_bus_buffer.scala 416:58]
  wire  _T_1893 = _T_1887 | _T_1892; // @[el2_lsu_bus_buffer.scala 416:39]
  wire  _T_1894 = ~_T_1893; // @[el2_lsu_bus_buffer.scala 416:5]
  wire  _T_1895 = _T_1885 & _T_1894; // @[el2_lsu_bus_buffer.scala 415:76]
  wire  _T_1896 = buf_state_2 == 3'h0; // @[el2_lsu_bus_buffer.scala 415:65]
  wire  _T_1897 = ibuf_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 416:30]
  wire  _T_1898 = ibuf_valid & _T_1897; // @[el2_lsu_bus_buffer.scala 416:19]
  wire  _T_1899 = WrPtr0_r == 2'h2; // @[el2_lsu_bus_buffer.scala 417:18]
  wire  _T_1900 = WrPtr1_r == 2'h2; // @[el2_lsu_bus_buffer.scala 417:57]
  wire  _T_1901 = io_ldst_dual_r & _T_1900; // @[el2_lsu_bus_buffer.scala 417:45]
  wire  _T_1902 = _T_1899 | _T_1901; // @[el2_lsu_bus_buffer.scala 417:27]
  wire  _T_1903 = io_lsu_busreq_r & _T_1902; // @[el2_lsu_bus_buffer.scala 416:58]
  wire  _T_1904 = _T_1898 | _T_1903; // @[el2_lsu_bus_buffer.scala 416:39]
  wire  _T_1905 = ~_T_1904; // @[el2_lsu_bus_buffer.scala 416:5]
  wire  _T_1906 = _T_1896 & _T_1905; // @[el2_lsu_bus_buffer.scala 415:76]
  wire  _T_1907 = buf_state_3 == 3'h0; // @[el2_lsu_bus_buffer.scala 415:65]
  wire  _T_1908 = ibuf_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 416:30]
  wire  _T_1910 = WrPtr0_r == 2'h3; // @[el2_lsu_bus_buffer.scala 417:18]
  wire  _T_1911 = WrPtr1_r == 2'h3; // @[el2_lsu_bus_buffer.scala 417:57]
  wire [1:0] _T_1919 = _T_1906 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_1920 = _T_1895 ? 2'h1 : _T_1919; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1884 ? 2'h0 : _T_1920; // @[Mux.scala 98:16]
  wire  _T_1925 = WrPtr0_m == 2'h0; // @[el2_lsu_bus_buffer.scala 422:33]
  wire  _T_1926 = io_lsu_busreq_m & _T_1925; // @[el2_lsu_bus_buffer.scala 422:22]
  wire  _T_1927 = _T_1876 | _T_1926; // @[el2_lsu_bus_buffer.scala 421:112]
  wire  _T_1933 = _T_1927 | _T_1881; // @[el2_lsu_bus_buffer.scala 422:42]
  wire  _T_1934 = ~_T_1933; // @[el2_lsu_bus_buffer.scala 421:78]
  wire  _T_1935 = _T_1874 & _T_1934; // @[el2_lsu_bus_buffer.scala 421:76]
  wire  _T_1939 = WrPtr0_m == 2'h1; // @[el2_lsu_bus_buffer.scala 422:33]
  wire  _T_1940 = io_lsu_busreq_m & _T_1939; // @[el2_lsu_bus_buffer.scala 422:22]
  wire  _T_1941 = _T_1887 | _T_1940; // @[el2_lsu_bus_buffer.scala 421:112]
  wire  _T_1947 = _T_1941 | _T_1892; // @[el2_lsu_bus_buffer.scala 422:42]
  wire  _T_1948 = ~_T_1947; // @[el2_lsu_bus_buffer.scala 421:78]
  wire  _T_1949 = _T_1885 & _T_1948; // @[el2_lsu_bus_buffer.scala 421:76]
  wire  _T_1953 = WrPtr0_m == 2'h2; // @[el2_lsu_bus_buffer.scala 422:33]
  wire  _T_1954 = io_lsu_busreq_m & _T_1953; // @[el2_lsu_bus_buffer.scala 422:22]
  wire  _T_1955 = _T_1898 | _T_1954; // @[el2_lsu_bus_buffer.scala 421:112]
  wire  _T_1961 = _T_1955 | _T_1903; // @[el2_lsu_bus_buffer.scala 422:42]
  wire  _T_1962 = ~_T_1961; // @[el2_lsu_bus_buffer.scala 421:78]
  wire  _T_1963 = _T_1896 & _T_1962; // @[el2_lsu_bus_buffer.scala 421:76]
  reg [3:0] buf_rspageQ_0; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2767 = buf_state_3 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2768 = buf_rspageQ_0[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2764 = buf_state_2 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2765 = buf_rspageQ_0[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2761 = buf_state_1 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2762 = buf_rspageQ_0[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2758 = buf_state_0 == 3'h5; // @[el2_lsu_bus_buffer.scala 465:104]
  wire  _T_2759 = buf_rspageQ_0[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_0 = {_T_2768,_T_2765,_T_2762,_T_2759}; // @[Cat.scala 29:58]
  wire  _T_2054 = |buf_rsp_pickage_0; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2055 = ~_T_2054; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2057 = _T_2055 & _T_2758; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_1; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2783 = buf_rspageQ_1[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2780 = buf_rspageQ_1[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2777 = buf_rspageQ_1[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2774 = buf_rspageQ_1[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_1 = {_T_2783,_T_2780,_T_2777,_T_2774}; // @[Cat.scala 29:58]
  wire  _T_2058 = |buf_rsp_pickage_1; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2059 = ~_T_2058; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2061 = _T_2059 & _T_2761; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_2; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2798 = buf_rspageQ_2[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2795 = buf_rspageQ_2[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2792 = buf_rspageQ_2[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2789 = buf_rspageQ_2[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_2 = {_T_2798,_T_2795,_T_2792,_T_2789}; // @[Cat.scala 29:58]
  wire  _T_2062 = |buf_rsp_pickage_2; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2063 = ~_T_2062; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2065 = _T_2063 & _T_2764; // @[el2_lsu_bus_buffer.scala 433:70]
  reg [3:0] buf_rspageQ_3; // @[el2_lsu_bus_buffer.scala 552:63]
  wire  _T_2813 = buf_rspageQ_3[3] & _T_2767; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2810 = buf_rspageQ_3[2] & _T_2764; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2807 = buf_rspageQ_3[1] & _T_2761; // @[el2_lsu_bus_buffer.scala 465:89]
  wire  _T_2804 = buf_rspageQ_3[0] & _T_2758; // @[el2_lsu_bus_buffer.scala 465:89]
  wire [3:0] buf_rsp_pickage_3 = {_T_2813,_T_2810,_T_2807,_T_2804}; // @[Cat.scala 29:58]
  wire  _T_2066 = |buf_rsp_pickage_3; // @[el2_lsu_bus_buffer.scala 433:65]
  wire  _T_2067 = ~_T_2066; // @[el2_lsu_bus_buffer.scala 433:44]
  wire  _T_2069 = _T_2067 & _T_2767; // @[el2_lsu_bus_buffer.scala 433:70]
  wire [7:0] _T_2125 = {4'h0,_T_2069,_T_2065,_T_2061,_T_2057}; // @[Cat.scala 29:58]
  wire  _T_2128 = _T_2125[4] | _T_2125[5]; // @[el2_lsu_bus_buffer.scala 437:42]
  wire  _T_2130 = _T_2128 | _T_2125[6]; // @[el2_lsu_bus_buffer.scala 437:48]
  wire  _T_2132 = _T_2130 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 437:54]
  wire  _T_2135 = _T_2125[2] | _T_2125[3]; // @[el2_lsu_bus_buffer.scala 437:67]
  wire  _T_2137 = _T_2135 | _T_2125[6]; // @[el2_lsu_bus_buffer.scala 437:73]
  wire  _T_2139 = _T_2137 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 437:79]
  wire  _T_2142 = _T_2125[1] | _T_2125[3]; // @[el2_lsu_bus_buffer.scala 437:92]
  wire  _T_2144 = _T_2142 | _T_2125[5]; // @[el2_lsu_bus_buffer.scala 437:98]
  wire  _T_2146 = _T_2144 | _T_2125[7]; // @[el2_lsu_bus_buffer.scala 437:104]
  wire [2:0] _T_2148 = {_T_2132,_T_2139,_T_2146}; // @[Cat.scala 29:58]
  wire  _T_3553 = ibuf_byp | io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 495:77]
  wire  _T_3554 = ~ibuf_merge_en; // @[el2_lsu_bus_buffer.scala 495:97]
  wire  _T_3555 = _T_3553 & _T_3554; // @[el2_lsu_bus_buffer.scala 495:95]
  wire  _T_3556 = 2'h0 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3557 = _T_3555 & _T_3556; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3558 = ibuf_byp & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 495:144]
  wire  _T_3559 = 2'h0 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3560 = _T_3558 & _T_3559; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3561 = _T_3557 | _T_3560; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3562 = _T_853 & _T_3561; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3563 = 2'h0 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3564 = ibuf_drain_vld & _T_3563; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3565 = _T_3562 | _T_3564; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3575 = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 502:46]
  wire  _T_3610 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  bus_rsp_write = io_lsu_axi_bvalid & io_lsu_axi_bready; // @[el2_lsu_bus_buffer.scala 612:38]
  wire  _T_3655 = io_lsu_axi_bid == 3'h0; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_3656 = bus_rsp_write & _T_3655; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_3657 = io_lsu_axi_rid == 3'h0; // @[el2_lsu_bus_buffer.scala 521:46]
  reg  _T_4328; // @[Reg.scala 27:20]
  reg  _T_4326; // @[Reg.scala 27:20]
  reg  _T_4324; // @[Reg.scala 27:20]
  reg  _T_4322; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4328,_T_4326,_T_4324,_T_4322}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_360 = {{1'd0}, buf_ldfwdtag_0}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3659 = io_lsu_axi_rid == _GEN_360; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3660 = buf_ldfwd[0] & _T_3659; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_3661 = _T_3657 | _T_3660; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_3662 = buf_dual_0 & buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_3664 = ~buf_write[0]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_3665 = _T_3662 & _T_3664; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_3666 = _T_3665 & buf_samedw_0; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_361 = {{1'd0}, buf_dualtag_0}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3667 = io_lsu_axi_rid == _GEN_361; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3668 = _T_3666 & _T_3667; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_3669 = _T_3661 | _T_3668; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_3670 = bus_rsp_read & _T_3669; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_3671 = _T_3656 | _T_3670; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_42 = _T_3610 & _T_3671; // @[Conditional.scala 39:67]
  wire  _GEN_61 = _T_3576 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_3572 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_73; // @[Conditional.scala 40:58]
  wire  _T_3697 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire [3:0] _T_3707 = buf_ldfwd >> buf_dualtag_0; // @[el2_lsu_bus_buffer.scala 535:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_363 = {{1'd0}, _GEN_25}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3709 = io_lsu_axi_rid == _GEN_363; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3710 = _T_3707[0] & _T_3709; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_3711 = _T_3667 | _T_3710; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_3712 = bus_rsp_read & _T_3711; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_36 = _T_3697 & _T_3712; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_3610 ? buf_resp_state_bus_en_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_3576 ? buf_cmd_state_bus_en_0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3572 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3549 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_3589 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3590 = _T_3589 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_3715 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire [1:0] RspPtr = _T_2148[1:0]; // @[el2_lsu_bus_buffer.scala 445:10]
  wire  _T_3718 = RspPtr == 2'h0; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_3719 = buf_dualtag_0 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_3720 = buf_dual_0 & _T_3719; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_3721 = _T_3718 | _T_3720; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_3722 = _T_3721 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_3723 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_31 = _T_3715 ? _T_3722 : _T_3723; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_3697 ? _T_3590 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3610 ? _T_3590 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3576 ? _T_3590 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_3572 ? _T_3575 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3549 ? _T_3565 : _GEN_64; // @[Conditional.scala 40:58]
  wire  _T_2150 = _T_1874 & buf_state_en_0; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2156 = ibuf_drain_vld & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 459:23]
  wire  _T_2158 = _T_2156 & _T_3553; // @[el2_lsu_bus_buffer.scala 459:41]
  wire  _T_2160 = _T_2158 & _T_1877; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2162 = _T_2160 & _T_1875; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2163 = _T_4492 | _T_2162; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2164 = ibuf_byp & io_lsu_busreq_r; // @[el2_lsu_bus_buffer.scala 460:17]
  wire  _T_2165 = _T_2164 & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 460:35]
  wire  _T_2167 = _T_2165 & _T_1878; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2169 = _T_2167 & _T_1877; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2170 = _T_2163 | _T_2169; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2171 = _T_2150 & _T_2170; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2173 = _T_2171 | buf_age_0[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2187 = _T_2160 & _T_1886; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2188 = _T_4497 | _T_2187; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2194 = _T_2167 & _T_1888; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2195 = _T_2188 | _T_2194; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2196 = _T_2150 & _T_2195; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2198 = _T_2196 | buf_age_0[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2212 = _T_2160 & _T_1897; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2213 = _T_4502 | _T_2212; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2219 = _T_2167 & _T_1899; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2220 = _T_2213 | _T_2219; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2221 = _T_2150 & _T_2220; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2223 = _T_2221 | buf_age_0[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2237 = _T_2160 & _T_1908; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2238 = _T_4507 | _T_2237; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2244 = _T_2167 & _T_1910; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2245 = _T_2238 | _T_2244; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2246 = _T_2150 & _T_2245; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2248 = _T_2246 | buf_age_0[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2250 = {_T_2248,_T_2223,_T_2198}; // @[Cat.scala 29:58]
  wire  _T_3749 = 2'h1 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3750 = _T_3555 & _T_3749; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3752 = 2'h1 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3753 = _T_3558 & _T_3752; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3754 = _T_3750 | _T_3753; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3755 = _T_853 & _T_3754; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3756 = 2'h1 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3757 = ibuf_drain_vld & _T_3756; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3758 = _T_3755 | _T_3757; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3803 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3848 = io_lsu_axi_bid == 3'h1; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_3849 = bus_rsp_write & _T_3848; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_3850 = io_lsu_axi_rid == 3'h1; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_364 = {{1'd0}, buf_ldfwdtag_1}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3852 = io_lsu_axi_rid == _GEN_364; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_3853 = buf_ldfwd[1] & _T_3852; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_3854 = _T_3850 | _T_3853; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_3855 = buf_dual_1 & buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_3857 = ~buf_write[1]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_3858 = _T_3855 & _T_3857; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_3859 = _T_3858 & buf_samedw_1; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_365 = {{1'd0}, buf_dualtag_1}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3860 = io_lsu_axi_rid == _GEN_365; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_3861 = _T_3859 & _T_3860; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_3862 = _T_3854 | _T_3861; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_3863 = bus_rsp_read & _T_3862; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_3864 = _T_3849 | _T_3863; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_118 = _T_3803 & _T_3864; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3769 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3765 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3890 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire [3:0] _T_3900 = buf_ldfwd >> buf_dualtag_1; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_99 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_100 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_99; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_101 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_100; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_367 = {{1'd0}, _GEN_101}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3902 = io_lsu_axi_rid == _GEN_367; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_3903 = _T_3900[0] & _T_3902; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_3904 = _T_3860 | _T_3903; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_3905 = bus_rsp_read & _T_3904; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_112 = _T_3890 & _T_3905; // @[Conditional.scala 39:67]
  wire  _GEN_119 = _T_3803 ? buf_resp_state_bus_en_1 : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_129 = _T_3769 ? buf_cmd_state_bus_en_1 : _GEN_119; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3765 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3742 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_3782 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3783 = _T_3782 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_3908 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3911 = RspPtr == 2'h1; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_3912 = buf_dualtag_1 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_3913 = buf_dual_1 & _T_3912; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_3914 = _T_3911 | _T_3913; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_3915 = _T_3914 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_3916 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_107 = _T_3908 ? _T_3915 : _T_3916; // @[Conditional.scala 39:67]
  wire  _GEN_113 = _T_3890 ? _T_3783 : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_120 = _T_3803 ? _T_3783 : _GEN_113; // @[Conditional.scala 39:67]
  wire  _GEN_130 = _T_3769 ? _T_3783 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3765 ? _T_3575 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3742 ? _T_3758 : _GEN_140; // @[Conditional.scala 40:58]
  wire  _T_2252 = _T_1885 & buf_state_en_1; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2262 = _T_2158 & _T_1888; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2264 = _T_2262 & _T_1875; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2265 = _T_4492 | _T_2264; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2269 = _T_2165 & _T_1889; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2271 = _T_2269 & _T_1877; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2272 = _T_2265 | _T_2271; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2273 = _T_2252 & _T_2272; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2275 = _T_2273 | buf_age_1[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2289 = _T_2262 & _T_1886; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2290 = _T_4497 | _T_2289; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2296 = _T_2269 & _T_1888; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2297 = _T_2290 | _T_2296; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2298 = _T_2252 & _T_2297; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2300 = _T_2298 | buf_age_1[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2314 = _T_2262 & _T_1897; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2315 = _T_4502 | _T_2314; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2321 = _T_2269 & _T_1899; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2322 = _T_2315 | _T_2321; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2323 = _T_2252 & _T_2322; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2325 = _T_2323 | buf_age_1[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2339 = _T_2262 & _T_1908; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2340 = _T_4507 | _T_2339; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2346 = _T_2269 & _T_1910; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2347 = _T_2340 | _T_2346; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2348 = _T_2252 & _T_2347; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2350 = _T_2348 | buf_age_1[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2352 = {_T_2350,_T_2325,_T_2300}; // @[Cat.scala 29:58]
  wire  _T_3942 = 2'h2 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_3943 = _T_3555 & _T_3942; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_3945 = 2'h2 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_3946 = _T_3558 & _T_3945; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_3947 = _T_3943 | _T_3946; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_3948 = _T_853 & _T_3947; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_3949 = 2'h2 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_3950 = ibuf_drain_vld & _T_3949; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_3951 = _T_3948 | _T_3950; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_3996 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4041 = io_lsu_axi_bid == 3'h2; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_4042 = bus_rsp_write & _T_4041; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_4043 = io_lsu_axi_rid == 3'h2; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_368 = {{1'd0}, buf_ldfwdtag_2}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4045 = io_lsu_axi_rid == _GEN_368; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4046 = buf_ldfwd[2] & _T_4045; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_4047 = _T_4043 | _T_4046; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_4048 = buf_dual_2 & buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_4050 = ~buf_write[2]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_4051 = _T_4048 & _T_4050; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_4052 = _T_4051 & buf_samedw_2; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_369 = {{1'd0}, buf_dualtag_2}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4053 = io_lsu_axi_rid == _GEN_369; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4054 = _T_4052 & _T_4053; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_4055 = _T_4047 | _T_4054; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_4056 = bus_rsp_read & _T_4055; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_4057 = _T_4042 | _T_4056; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_194 = _T_3996 & _T_4057; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3962 ? 1'h0 : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3958 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_225; // @[Conditional.scala 40:58]
  wire  _T_4083 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire [3:0] _T_4093 = buf_ldfwd >> buf_dualtag_2; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_175 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_176 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_175; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_177 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_176; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_371 = {{1'd0}, _GEN_177}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4095 = io_lsu_axi_rid == _GEN_371; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4096 = _T_4093[0] & _T_4095; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_4097 = _T_4053 | _T_4096; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_4098 = bus_rsp_read & _T_4097; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_188 = _T_4083 & _T_4098; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_3996 ? buf_resp_state_bus_en_2 : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3962 ? buf_cmd_state_bus_en_2 : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_3958 ? 1'h0 : _GEN_205; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3935 ? 1'h0 : _GEN_218; // @[Conditional.scala 40:58]
  wire  _T_3975 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_3976 = _T_3975 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_4101 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4104 = RspPtr == 2'h2; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_4105 = buf_dualtag_2 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_4106 = buf_dual_2 & _T_4105; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_4107 = _T_4104 | _T_4106; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_4108 = _T_4107 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_4109 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_183 = _T_4101 ? _T_4108 : _T_4109; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4083 ? _T_3976 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_196 = _T_3996 ? _T_3976 : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_206 = _T_3962 ? _T_3976 : _GEN_196; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3958 ? _T_3575 : _GEN_206; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3935 ? _T_3951 : _GEN_216; // @[Conditional.scala 40:58]
  wire  _T_2354 = _T_1896 & buf_state_en_2; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2364 = _T_2158 & _T_1899; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2366 = _T_2364 & _T_1875; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2367 = _T_4492 | _T_2366; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2371 = _T_2165 & _T_1900; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2373 = _T_2371 & _T_1877; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2374 = _T_2367 | _T_2373; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2375 = _T_2354 & _T_2374; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2377 = _T_2375 | buf_age_2[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2391 = _T_2364 & _T_1886; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2392 = _T_4497 | _T_2391; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2398 = _T_2371 & _T_1888; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2399 = _T_2392 | _T_2398; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2400 = _T_2354 & _T_2399; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2402 = _T_2400 | buf_age_2[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2416 = _T_2364 & _T_1897; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2417 = _T_4502 | _T_2416; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2423 = _T_2371 & _T_1899; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2424 = _T_2417 | _T_2423; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2425 = _T_2354 & _T_2424; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2427 = _T_2425 | buf_age_2[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2441 = _T_2364 & _T_1908; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2442 = _T_4507 | _T_2441; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2448 = _T_2371 & _T_1910; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2449 = _T_2442 | _T_2448; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2450 = _T_2354 & _T_2449; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2452 = _T_2450 | buf_age_2[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2454 = {_T_2452,_T_2427,_T_2402}; // @[Cat.scala 29:58]
  wire  _T_4135 = 2'h3 == WrPtr0_r; // @[el2_lsu_bus_buffer.scala 495:117]
  wire  _T_4136 = _T_3555 & _T_4135; // @[el2_lsu_bus_buffer.scala 495:112]
  wire  _T_4138 = 2'h3 == WrPtr1_r; // @[el2_lsu_bus_buffer.scala 495:166]
  wire  _T_4139 = _T_3558 & _T_4138; // @[el2_lsu_bus_buffer.scala 495:161]
  wire  _T_4140 = _T_4136 | _T_4139; // @[el2_lsu_bus_buffer.scala 495:132]
  wire  _T_4141 = _T_853 & _T_4140; // @[el2_lsu_bus_buffer.scala 495:63]
  wire  _T_4142 = 2'h3 == ibuf_tag; // @[el2_lsu_bus_buffer.scala 495:206]
  wire  _T_4143 = ibuf_drain_vld & _T_4142; // @[el2_lsu_bus_buffer.scala 495:201]
  wire  _T_4144 = _T_4141 | _T_4143; // @[el2_lsu_bus_buffer.scala 495:183]
  wire  _T_4189 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4234 = io_lsu_axi_bid == 3'h3; // @[el2_lsu_bus_buffer.scala 520:73]
  wire  _T_4235 = bus_rsp_write & _T_4234; // @[el2_lsu_bus_buffer.scala 520:52]
  wire  _T_4236 = io_lsu_axi_rid == 3'h3; // @[el2_lsu_bus_buffer.scala 521:46]
  wire [2:0] _GEN_372 = {{1'd0}, buf_ldfwdtag_3}; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4238 = io_lsu_axi_rid == _GEN_372; // @[el2_lsu_bus_buffer.scala 522:47]
  wire  _T_4239 = buf_ldfwd[3] & _T_4238; // @[el2_lsu_bus_buffer.scala 522:27]
  wire  _T_4240 = _T_4236 | _T_4239; // @[el2_lsu_bus_buffer.scala 521:77]
  wire  _T_4241 = buf_dual_3 & buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 523:26]
  wire  _T_4243 = ~buf_write[3]; // @[el2_lsu_bus_buffer.scala 523:44]
  wire  _T_4244 = _T_4241 & _T_4243; // @[el2_lsu_bus_buffer.scala 523:42]
  wire  _T_4245 = _T_4244 & buf_samedw_3; // @[el2_lsu_bus_buffer.scala 523:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_dualtag_3}; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4246 = io_lsu_axi_rid == _GEN_373; // @[el2_lsu_bus_buffer.scala 523:94]
  wire  _T_4247 = _T_4245 & _T_4246; // @[el2_lsu_bus_buffer.scala 523:74]
  wire  _T_4248 = _T_4240 | _T_4247; // @[el2_lsu_bus_buffer.scala 522:71]
  wire  _T_4249 = bus_rsp_read & _T_4248; // @[el2_lsu_bus_buffer.scala 521:25]
  wire  _T_4250 = _T_4235 | _T_4249; // @[el2_lsu_bus_buffer.scala 520:105]
  wire  _GEN_270 = _T_4189 & _T_4250; // @[Conditional.scala 39:67]
  wire  _GEN_289 = _T_4155 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67]
  wire  _GEN_301 = _T_4151 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_301; // @[Conditional.scala 40:58]
  wire  _T_4276 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire [3:0] _T_4286 = buf_ldfwd >> buf_dualtag_3; // @[el2_lsu_bus_buffer.scala 535:21]
  wire [1:0] _GEN_251 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_252 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_251; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [1:0] _GEN_253 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_252; // @[el2_lsu_bus_buffer.scala 535:58]
  wire [2:0] _GEN_375 = {{1'd0}, _GEN_253}; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4288 = io_lsu_axi_rid == _GEN_375; // @[el2_lsu_bus_buffer.scala 535:58]
  wire  _T_4289 = _T_4286[0] & _T_4288; // @[el2_lsu_bus_buffer.scala 535:38]
  wire  _T_4290 = _T_4246 | _T_4289; // @[el2_lsu_bus_buffer.scala 534:95]
  wire  _T_4291 = bus_rsp_read & _T_4290; // @[el2_lsu_bus_buffer.scala 534:45]
  wire  _GEN_264 = _T_4276 & _T_4291; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4189 ? buf_resp_state_bus_en_3 : _GEN_264; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4155 ? buf_cmd_state_bus_en_3 : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4151 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4128 ? 1'h0 : _GEN_294; // @[Conditional.scala 40:58]
  wire  _T_4168 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 508:49]
  wire  _T_4169 = _T_4168 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 508:70]
  wire  _T_4294 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4297 = RspPtr == 2'h3; // @[el2_lsu_bus_buffer.scala 540:37]
  wire  _T_4298 = buf_dualtag_3 == RspPtr; // @[el2_lsu_bus_buffer.scala 540:98]
  wire  _T_4299 = buf_dual_3 & _T_4298; // @[el2_lsu_bus_buffer.scala 540:80]
  wire  _T_4300 = _T_4297 | _T_4299; // @[el2_lsu_bus_buffer.scala 540:65]
  wire  _T_4301 = _T_4300 | io_dec_tlu_force_halt; // @[el2_lsu_bus_buffer.scala 540:112]
  wire  _T_4302 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_259 = _T_4294 ? _T_4301 : _T_4302; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4276 ? _T_4169 : _GEN_259; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4189 ? _T_4169 : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4155 ? _T_4169 : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_4151 ? _T_3575 : _GEN_282; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4128 ? _T_4144 : _GEN_292; // @[Conditional.scala 40:58]
  wire  _T_2456 = _T_1907 & buf_state_en_3; // @[el2_lsu_bus_buffer.scala 457:94]
  wire  _T_2466 = _T_2158 & _T_1910; // @[el2_lsu_bus_buffer.scala 459:71]
  wire  _T_2468 = _T_2466 & _T_1875; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2469 = _T_4492 | _T_2468; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2473 = _T_2165 & _T_1911; // @[el2_lsu_bus_buffer.scala 460:52]
  wire  _T_2475 = _T_2473 & _T_1877; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2476 = _T_2469 | _T_2475; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2477 = _T_2456 & _T_2476; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2479 = _T_2477 | buf_age_3[0]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2493 = _T_2466 & _T_1886; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2494 = _T_4497 | _T_2493; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2500 = _T_2473 & _T_1888; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2501 = _T_2494 | _T_2500; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2502 = _T_2456 & _T_2501; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2504 = _T_2502 | buf_age_3[1]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2518 = _T_2466 & _T_1897; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2519 = _T_4502 | _T_2518; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2525 = _T_2473 & _T_1899; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2526 = _T_2519 | _T_2525; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2527 = _T_2456 & _T_2526; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2529 = _T_2527 | buf_age_3[2]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire  _T_2543 = _T_2466 & _T_1908; // @[el2_lsu_bus_buffer.scala 459:92]
  wire  _T_2544 = _T_4507 | _T_2543; // @[el2_lsu_bus_buffer.scala 458:86]
  wire  _T_2550 = _T_2473 & _T_1910; // @[el2_lsu_bus_buffer.scala 460:73]
  wire  _T_2551 = _T_2544 | _T_2550; // @[el2_lsu_bus_buffer.scala 459:114]
  wire  _T_2552 = _T_2456 & _T_2551; // @[el2_lsu_bus_buffer.scala 457:113]
  wire  _T_2554 = _T_2552 | buf_age_3[3]; // @[el2_lsu_bus_buffer.scala 460:97]
  wire [2:0] _T_2556 = {_T_2554,_T_2529,_T_2504}; // @[Cat.scala 29:58]
  wire  _T_2820 = buf_state_0 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2821 = _T_1874 | _T_2820; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2822 = ~_T_2821; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2830 = _T_2822 | _T_2162; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2837 = _T_2830 | _T_2169; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2838 = _T_2150 & _T_2837; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2842 = buf_state_1 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2843 = _T_1885 | _T_2842; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2844 = ~_T_2843; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2852 = _T_2844 | _T_2187; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2859 = _T_2852 | _T_2194; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2860 = _T_2150 & _T_2859; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2864 = buf_state_2 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2865 = _T_1896 | _T_2864; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2866 = ~_T_2865; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2874 = _T_2866 | _T_2212; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2881 = _T_2874 | _T_2219; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2882 = _T_2150 & _T_2881; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2886 = buf_state_3 == 3'h6; // @[el2_lsu_bus_buffer.scala 468:49]
  wire  _T_2887 = _T_1907 | _T_2886; // @[el2_lsu_bus_buffer.scala 468:34]
  wire  _T_2888 = ~_T_2887; // @[el2_lsu_bus_buffer.scala 468:8]
  wire  _T_2896 = _T_2888 | _T_2237; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2903 = _T_2896 | _T_2244; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2904 = _T_2150 & _T_2903; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_0 = {_T_2904,_T_2882,_T_2860,_T_2838}; // @[Cat.scala 29:58]
  wire  _T_2921 = _T_2822 | _T_2264; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2928 = _T_2921 | _T_2271; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2929 = _T_2252 & _T_2928; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2943 = _T_2844 | _T_2289; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2950 = _T_2943 | _T_2296; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2951 = _T_2252 & _T_2950; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2965 = _T_2866 | _T_2314; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2972 = _T_2965 | _T_2321; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2973 = _T_2252 & _T_2972; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_2987 = _T_2888 | _T_2339; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_2994 = _T_2987 | _T_2346; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_2995 = _T_2252 & _T_2994; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_1 = {_T_2995,_T_2973,_T_2951,_T_2929}; // @[Cat.scala 29:58]
  wire  _T_3012 = _T_2822 | _T_2366; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3019 = _T_3012 | _T_2373; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3020 = _T_2354 & _T_3019; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3034 = _T_2844 | _T_2391; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3041 = _T_3034 | _T_2398; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3042 = _T_2354 & _T_3041; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3056 = _T_2866 | _T_2416; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3063 = _T_3056 | _T_2423; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3064 = _T_2354 & _T_3063; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3078 = _T_2888 | _T_2441; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3085 = _T_3078 | _T_2448; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3086 = _T_2354 & _T_3085; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_2 = {_T_3086,_T_3064,_T_3042,_T_3020}; // @[Cat.scala 29:58]
  wire  _T_3103 = _T_2822 | _T_2468; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3110 = _T_3103 | _T_2475; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3111 = _T_2456 & _T_3110; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3125 = _T_2844 | _T_2493; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3132 = _T_3125 | _T_2500; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3133 = _T_2456 & _T_3132; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3147 = _T_2866 | _T_2518; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3154 = _T_3147 | _T_2525; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3155 = _T_2456 & _T_3154; // @[el2_lsu_bus_buffer.scala 467:114]
  wire  _T_3169 = _T_2888 | _T_2543; // @[el2_lsu_bus_buffer.scala 468:61]
  wire  _T_3176 = _T_3169 | _T_2550; // @[el2_lsu_bus_buffer.scala 469:112]
  wire  _T_3177 = _T_2456 & _T_3176; // @[el2_lsu_bus_buffer.scala 467:114]
  wire [3:0] buf_rspage_set_3 = {_T_3177,_T_3155,_T_3133,_T_3111}; // @[Cat.scala 29:58]
  wire  _T_3262 = _T_2886 | _T_1907; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3263 = ~_T_3262; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3264 = buf_rspageQ_0[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3256 = _T_2864 | _T_1896; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3257 = ~_T_3256; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3258 = buf_rspageQ_0[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3250 = _T_2842 | _T_1885; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3251 = ~_T_3250; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3252 = buf_rspageQ_0[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3244 = _T_2820 | _T_1874; // @[el2_lsu_bus_buffer.scala 472:112]
  wire  _T_3245 = ~_T_3244; // @[el2_lsu_bus_buffer.scala 472:86]
  wire  _T_3246 = buf_rspageQ_0[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_0 = {_T_3264,_T_3258,_T_3252,_T_3246}; // @[Cat.scala 29:58]
  wire  _T_3183 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3186 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3189 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3192 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3194 = {_T_3192,_T_3189,_T_3186}; // @[Cat.scala 29:58]
  wire  _T_3291 = buf_rspageQ_1[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3285 = buf_rspageQ_1[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3279 = buf_rspageQ_1[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3273 = buf_rspageQ_1[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_1 = {_T_3291,_T_3285,_T_3279,_T_3273}; // @[Cat.scala 29:58]
  wire  _T_3198 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3201 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3204 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3207 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3209 = {_T_3207,_T_3204,_T_3201}; // @[Cat.scala 29:58]
  wire  _T_3318 = buf_rspageQ_2[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3312 = buf_rspageQ_2[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3306 = buf_rspageQ_2[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3300 = buf_rspageQ_2[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_2 = {_T_3318,_T_3312,_T_3306,_T_3300}; // @[Cat.scala 29:58]
  wire  _T_3213 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3216 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3219 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3222 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3224 = {_T_3222,_T_3219,_T_3216}; // @[Cat.scala 29:58]
  wire  _T_3345 = buf_rspageQ_3[3] & _T_3263; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3339 = buf_rspageQ_3[2] & _T_3257; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3333 = buf_rspageQ_3[1] & _T_3251; // @[el2_lsu_bus_buffer.scala 472:84]
  wire  _T_3327 = buf_rspageQ_3[0] & _T_3245; // @[el2_lsu_bus_buffer.scala 472:84]
  wire [3:0] buf_rspage_3 = {_T_3345,_T_3339,_T_3333,_T_3327}; // @[Cat.scala 29:58]
  wire  _T_3228 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3231 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3234 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire  _T_3237 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[el2_lsu_bus_buffer.scala 471:90]
  wire [2:0] _T_3239 = {_T_3237,_T_3234,_T_3231}; // @[Cat.scala 29:58]
  wire  _T_3350 = ibuf_drain_vld & _T_1875; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3352 = ibuf_drain_vld & _T_1886; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3354 = ibuf_drain_vld & _T_1897; // @[el2_lsu_bus_buffer.scala 477:65]
  wire  _T_3356 = ibuf_drain_vld & _T_1908; // @[el2_lsu_bus_buffer.scala 477:65]
  wire [3:0] ibuf_drainvec_vld = {_T_3356,_T_3354,_T_3352,_T_3350}; // @[Cat.scala 29:58]
  wire  _T_3364 = _T_3558 & _T_1878; // @[el2_lsu_bus_buffer.scala 479:37]
  wire  _T_3373 = _T_3558 & _T_1889; // @[el2_lsu_bus_buffer.scala 479:37]
  wire  _T_3382 = _T_3558 & _T_1900; // @[el2_lsu_bus_buffer.scala 479:37]
  wire  _T_3391 = _T_3558 & _T_1911; // @[el2_lsu_bus_buffer.scala 479:37]
  wire  _T_3421 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3423 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire  _T_3427 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 481:47]
  wire [3:0] buf_dual_in = {_T_3427,_T_3425,_T_3423,_T_3421}; // @[Cat.scala 29:58]
  wire  _T_3432 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3434 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3436 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire  _T_3438 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[el2_lsu_bus_buffer.scala 482:49]
  wire [3:0] buf_samedw_in = {_T_3438,_T_3436,_T_3434,_T_3432}; // @[Cat.scala 29:58]
  wire  _T_3443 = ibuf_nomerge | ibuf_force_drain; // @[el2_lsu_bus_buffer.scala 483:86]
  wire  _T_3444 = ibuf_drainvec_vld[0] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3447 = ibuf_drainvec_vld[1] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3450 = ibuf_drainvec_vld[2] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire  _T_3453 = ibuf_drainvec_vld[3] ? _T_3443 : io_no_dword_merge_r; // @[el2_lsu_bus_buffer.scala 483:50]
  wire [3:0] buf_nomerge_in = {_T_3453,_T_3450,_T_3447,_T_3444}; // @[Cat.scala 29:58]
  wire  _T_3461 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3364; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3466 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3373; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3471 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3382; // @[el2_lsu_bus_buffer.scala 484:49]
  wire  _T_3476 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3391; // @[el2_lsu_bus_buffer.scala 484:49]
  wire [3:0] buf_dualhi_in = {_T_3476,_T_3471,_T_3466,_T_3461}; // @[Cat.scala 29:58]
  wire  _T_3505 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3507 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3509 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire  _T_3511 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[el2_lsu_bus_buffer.scala 486:53]
  wire [3:0] buf_sideeffect_in = {_T_3511,_T_3509,_T_3507,_T_3505}; // @[Cat.scala 29:58]
  wire  _T_3516 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3518 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3520 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire  _T_3522 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_unsign; // @[el2_lsu_bus_buffer.scala 487:49]
  wire [3:0] buf_unsign_in = {_T_3522,_T_3520,_T_3518,_T_3516}; // @[Cat.scala 29:58]
  wire  _T_3539 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3541 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3543 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire  _T_3545 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_store; // @[el2_lsu_bus_buffer.scala 489:48]
  wire [3:0] buf_write_in = {_T_3545,_T_3543,_T_3541,_T_3539}; // @[Cat.scala 29:58]
  wire  _T_3578 = obuf_nosend & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 505:89]
  wire  _T_3580 = _T_3578 & _T_1372; // @[el2_lsu_bus_buffer.scala 505:104]
  wire  _T_3593 = buf_state_en_0 & _T_3664; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3594 = _T_3593 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3596 = _T_3594 & _T_1354; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3599 = _T_3589 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3600 = _T_3599 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_4890 = io_lsu_axi_bresp != 2'h0; // @[el2_lsu_bus_buffer.scala 616:58]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4890; // @[el2_lsu_bus_buffer.scala 616:38]
  wire  _T_3603 = _T_3599 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_3678 = bus_rsp_read_error & _T_3657; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_3680 = bus_rsp_read_error & buf_ldfwd[0]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3682 = _T_3680 & _T_3659; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_3683 = _T_3678 | _T_3682; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4890; // @[el2_lsu_bus_buffer.scala 615:40]
  wire  _T_3686 = bus_rsp_write_error & _T_3655; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_3687 = _T_3683 | _T_3686; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_3688 = _T_3589 & _T_3687; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_46 = _T_3610 & _T_3688; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3576 ? _T_3603 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3572 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3549 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58]
  wire  _T_3613 = ~bus_rsp_write_error; // @[el2_lsu_bus_buffer.scala 517:73]
  wire  _T_3614 = buf_write[0] & _T_3613; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_3615 = io_dec_tlu_force_halt | _T_3614; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_3617 = ~buf_samedw_0; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_3618 = buf_dual_0 & _T_3617; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_3621 = _T_3618 & _T_3664; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3622 = _GEN_21 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3623 = _T_3621 & _T_3622; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_4515 = _T_2767 | _T_2764; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  _T_4516 = _T_4515 | _T_2761; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  any_done_wait_state = _T_4516 | _T_2758; // @[el2_lsu_bus_buffer.scala 576:93]
  wire  _T_3625 = buf_ldfwd[0] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_3631 = buf_dualtag_0 == 2'h0; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3633 = buf_dualtag_0 == 2'h1; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3635 = buf_dualtag_0 == 2'h2; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3637 = buf_dualtag_0 == 2'h3; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3639 = _T_3631 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3640 = _T_3633 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3641 = _T_3635 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3642 = _T_3637 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3643 = _T_3639 | _T_3640; // @[Mux.scala 27:72]
  wire  _T_3644 = _T_3643 | _T_3641; // @[Mux.scala 27:72]
  wire  _T_3645 = _T_3644 | _T_3642; // @[Mux.scala 27:72]
  wire  _T_3647 = _T_3621 & _T_3645; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_3648 = _GEN_21 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_3649 = _T_3647 & _T_3648; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_3650 = _T_3649 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_3651 = _T_3625 | _T_3650; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_3674 = buf_state_bus_en_0 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_3675 = _T_3674 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_3689 = ~buf_error_en_0; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_3690 = buf_state_en_0 & _T_3689; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_3702 = buf_ldfwd[0] | _T_3707[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_3703 = _T_3702 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_29 = _T_3723 & buf_state_en_0; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3715 ? 1'h0 : _T_3723; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3715 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3697 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3697 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3610 & _T_3675; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_3610 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3610 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_3576 ? _T_3596 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_3576 ? _T_3600 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3576 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_3572 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_3572 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3572 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3549 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3549 ? 1'h0 : _GEN_68; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3549 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire  _T_3786 = buf_state_en_1 & _T_3857; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3787 = _T_3786 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3789 = _T_3787 & _T_1354; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3792 = _T_3782 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3793 = _T_3792 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_3796 = _T_3792 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_3871 = bus_rsp_read_error & _T_3850; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_3873 = bus_rsp_read_error & buf_ldfwd[1]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_3875 = _T_3873 & _T_3852; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_3876 = _T_3871 | _T_3875; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_3879 = bus_rsp_write_error & _T_3848; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_3880 = _T_3876 | _T_3879; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_3881 = _T_3782 & _T_3880; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_122 = _T_3803 & _T_3881; // @[Conditional.scala 39:67]
  wire  _GEN_135 = _T_3769 ? _T_3796 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_147 = _T_3765 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3742 ? 1'h0 : _GEN_147; // @[Conditional.scala 40:58]
  wire  _T_3807 = buf_write[1] & _T_3613; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_3808 = io_dec_tlu_force_halt | _T_3807; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_3810 = ~buf_samedw_1; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_3811 = buf_dual_1 & _T_3810; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_3814 = _T_3811 & _T_3857; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_95 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_96 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_95; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_97 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_96; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3815 = _GEN_97 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_3816 = _T_3814 & _T_3815; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_3818 = buf_ldfwd[1] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_3824 = buf_dualtag_1 == 2'h0; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3826 = buf_dualtag_1 == 2'h1; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3828 = buf_dualtag_1 == 2'h2; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3830 = buf_dualtag_1 == 2'h3; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_3832 = _T_3824 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3833 = _T_3826 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3834 = _T_3828 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3835 = _T_3830 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3836 = _T_3832 | _T_3833; // @[Mux.scala 27:72]
  wire  _T_3837 = _T_3836 | _T_3834; // @[Mux.scala 27:72]
  wire  _T_3838 = _T_3837 | _T_3835; // @[Mux.scala 27:72]
  wire  _T_3840 = _T_3814 & _T_3838; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_3841 = _GEN_97 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_3842 = _T_3840 & _T_3841; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_3843 = _T_3842 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_3844 = _T_3818 | _T_3843; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_3867 = buf_state_bus_en_1 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_3868 = _T_3867 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_3882 = ~buf_error_en_1; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_3883 = buf_state_en_1 & _T_3882; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_3895 = buf_ldfwd[1] | _T_3900[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_3896 = _T_3895 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_105 = _T_3916 & buf_state_en_1; // @[Conditional.scala 39:67]
  wire  _GEN_108 = _T_3908 ? 1'h0 : _T_3916; // @[Conditional.scala 39:67]
  wire  _GEN_110 = _T_3908 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67]
  wire  _GEN_114 = _T_3890 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67]
  wire  _GEN_116 = _T_3890 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3803 & _T_3868; // @[Conditional.scala 39:67]
  wire  _GEN_124 = _T_3803 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_126 = _T_3803 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3769 ? _T_3789 : _GEN_126; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3769 ? _T_3793 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_138 = _T_3769 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3765 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3765 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_150 = _T_3765 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3742 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3742 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3742 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire  _T_3979 = buf_state_en_2 & _T_4050; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_3980 = _T_3979 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_3982 = _T_3980 & _T_1354; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_3985 = _T_3975 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_3986 = _T_3985 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_3989 = _T_3985 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_4064 = bus_rsp_read_error & _T_4043; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_4066 = bus_rsp_read_error & buf_ldfwd[2]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4068 = _T_4066 & _T_4045; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_4069 = _T_4064 | _T_4068; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_4072 = bus_rsp_write_error & _T_4041; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_4073 = _T_4069 | _T_4072; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_4074 = _T_3975 & _T_4073; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_198 = _T_3996 & _T_4074; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3962 ? _T_3989 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3958 ? 1'h0 : _GEN_211; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3935 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58]
  wire  _T_4000 = buf_write[2] & _T_3613; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_4001 = io_dec_tlu_force_halt | _T_4000; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_4003 = ~buf_samedw_2; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_4004 = buf_dual_2 & _T_4003; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_4007 = _T_4004 & _T_4050; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_171 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_172 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_171; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_173 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_172; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4008 = _GEN_173 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4009 = _T_4007 & _T_4008; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_4011 = buf_ldfwd[2] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_4017 = buf_dualtag_2 == 2'h0; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4019 = buf_dualtag_2 == 2'h1; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4021 = buf_dualtag_2 == 2'h2; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4023 = buf_dualtag_2 == 2'h3; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4025 = _T_4017 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4026 = _T_4019 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4027 = _T_4021 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4028 = _T_4023 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4029 = _T_4025 | _T_4026; // @[Mux.scala 27:72]
  wire  _T_4030 = _T_4029 | _T_4027; // @[Mux.scala 27:72]
  wire  _T_4031 = _T_4030 | _T_4028; // @[Mux.scala 27:72]
  wire  _T_4033 = _T_4007 & _T_4031; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_4034 = _GEN_173 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_4035 = _T_4033 & _T_4034; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_4036 = _T_4035 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_4037 = _T_4011 | _T_4036; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_4060 = buf_state_bus_en_2 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_4061 = _T_4060 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_4075 = ~buf_error_en_2; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_4076 = buf_state_en_2 & _T_4075; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_4088 = buf_ldfwd[2] | _T_4093[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_4089 = _T_4088 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_181 = _T_4109 & buf_state_en_2; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4101 ? 1'h0 : _T_4109; // @[Conditional.scala 39:67]
  wire  _GEN_186 = _T_4101 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_190 = _T_4083 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4083 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_197 = _T_3996 & _T_4061; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3996 ? 1'h0 : _GEN_190; // @[Conditional.scala 39:67]
  wire  _GEN_202 = _T_3996 ? 1'h0 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3962 ? _T_3982 : _GEN_202; // @[Conditional.scala 39:67]
  wire  _GEN_210 = _T_3962 ? _T_3986 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3962 ? 1'h0 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3958 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  _GEN_222 = _T_3958 ? 1'h0 : _GEN_210; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3958 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3935 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3935 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3935 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_4172 = buf_state_en_3 & _T_4243; // @[el2_lsu_bus_buffer.scala 510:44]
  wire  _T_4173 = _T_4172 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 510:60]
  wire  _T_4175 = _T_4173 & _T_1354; // @[el2_lsu_bus_buffer.scala 510:74]
  wire  _T_4178 = _T_4168 & obuf_nosend; // @[el2_lsu_bus_buffer.scala 512:67]
  wire  _T_4179 = _T_4178 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 512:81]
  wire  _T_4182 = _T_4178 & bus_rsp_read_error; // @[el2_lsu_bus_buffer.scala 513:82]
  wire  _T_4257 = bus_rsp_read_error & _T_4236; // @[el2_lsu_bus_buffer.scala 527:91]
  wire  _T_4259 = bus_rsp_read_error & buf_ldfwd[3]; // @[el2_lsu_bus_buffer.scala 528:31]
  wire  _T_4261 = _T_4259 & _T_4238; // @[el2_lsu_bus_buffer.scala 528:46]
  wire  _T_4262 = _T_4257 | _T_4261; // @[el2_lsu_bus_buffer.scala 527:143]
  wire  _T_4265 = bus_rsp_write_error & _T_4234; // @[el2_lsu_bus_buffer.scala 529:53]
  wire  _T_4266 = _T_4262 | _T_4265; // @[el2_lsu_bus_buffer.scala 528:88]
  wire  _T_4267 = _T_4168 & _T_4266; // @[el2_lsu_bus_buffer.scala 527:68]
  wire  _GEN_274 = _T_4189 & _T_4267; // @[Conditional.scala 39:67]
  wire  _GEN_287 = _T_4155 ? _T_4182 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_299 = _T_4151 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4128 ? 1'h0 : _GEN_299; // @[Conditional.scala 40:58]
  wire  _T_4193 = buf_write[3] & _T_3613; // @[el2_lsu_bus_buffer.scala 517:71]
  wire  _T_4194 = io_dec_tlu_force_halt | _T_4193; // @[el2_lsu_bus_buffer.scala 517:55]
  wire  _T_4196 = ~buf_samedw_3; // @[el2_lsu_bus_buffer.scala 518:30]
  wire  _T_4197 = buf_dual_3 & _T_4196; // @[el2_lsu_bus_buffer.scala 518:28]
  wire  _T_4200 = _T_4197 & _T_4243; // @[el2_lsu_bus_buffer.scala 518:45]
  wire [2:0] _GEN_247 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_248 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_247; // @[el2_lsu_bus_buffer.scala 518:90]
  wire [2:0] _GEN_249 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_248; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4201 = _GEN_249 != 3'h4; // @[el2_lsu_bus_buffer.scala 518:90]
  wire  _T_4202 = _T_4200 & _T_4201; // @[el2_lsu_bus_buffer.scala 518:61]
  wire  _T_4204 = buf_ldfwd[3] | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:31]
  wire  _T_4210 = buf_dualtag_3 == 2'h0; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4212 = buf_dualtag_3 == 2'h1; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4214 = buf_dualtag_3 == 2'h2; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4216 = buf_dualtag_3 == 2'h3; // @[el2_lsu_bus_buffer.scala 109:118]
  wire  _T_4218 = _T_4210 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4219 = _T_4212 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4220 = _T_4214 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4221 = _T_4216 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4222 = _T_4218 | _T_4219; // @[Mux.scala 27:72]
  wire  _T_4223 = _T_4222 | _T_4220; // @[Mux.scala 27:72]
  wire  _T_4224 = _T_4223 | _T_4221; // @[Mux.scala 27:72]
  wire  _T_4226 = _T_4200 & _T_4224; // @[el2_lsu_bus_buffer.scala 519:101]
  wire  _T_4227 = _GEN_249 == 3'h4; // @[el2_lsu_bus_buffer.scala 519:167]
  wire  _T_4228 = _T_4226 & _T_4227; // @[el2_lsu_bus_buffer.scala 519:138]
  wire  _T_4229 = _T_4228 & any_done_wait_state; // @[el2_lsu_bus_buffer.scala 519:187]
  wire  _T_4230 = _T_4204 | _T_4229; // @[el2_lsu_bus_buffer.scala 519:53]
  wire  _T_4253 = buf_state_bus_en_3 & bus_rsp_read; // @[el2_lsu_bus_buffer.scala 526:47]
  wire  _T_4254 = _T_4253 & io_lsu_bus_clk_en; // @[el2_lsu_bus_buffer.scala 526:62]
  wire  _T_4268 = ~buf_error_en_3; // @[el2_lsu_bus_buffer.scala 530:50]
  wire  _T_4269 = buf_state_en_3 & _T_4268; // @[el2_lsu_bus_buffer.scala 530:48]
  wire  _T_4281 = buf_ldfwd[3] | _T_4286[0]; // @[el2_lsu_bus_buffer.scala 533:90]
  wire  _T_4282 = _T_4281 | any_done_wait_state; // @[el2_lsu_bus_buffer.scala 533:118]
  wire  _GEN_257 = _T_4302 & buf_state_en_3; // @[Conditional.scala 39:67]
  wire  _GEN_260 = _T_4294 ? 1'h0 : _T_4302; // @[Conditional.scala 39:67]
  wire  _GEN_262 = _T_4294 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4276 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67]
  wire  _GEN_268 = _T_4276 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67]
  wire  _GEN_273 = _T_4189 & _T_4254; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4189 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_278 = _T_4189 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_284 = _T_4155 ? _T_4175 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4155 ? _T_4179 : _GEN_273; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4155 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4151 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4151 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4151 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4128 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4128 ? 1'h0 : _GEN_296; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4128 ? 1'h0 : _GEN_302; // @[Conditional.scala 40:58]
  reg  _T_4357; // @[Reg.scala 27:20]
  reg  _T_4360; // @[Reg.scala 27:20]
  reg  _T_4363; // @[Reg.scala 27:20]
  reg  _T_4366; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4366,_T_4363,_T_4360,_T_4357}; // @[Cat.scala 29:58]
  reg  _T_4432; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4427; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4422; // @[el2_lsu_bus_buffer.scala 569:82]
  reg  _T_4417; // @[el2_lsu_bus_buffer.scala 569:82]
  wire [3:0] buf_error = {_T_4432,_T_4427,_T_4422,_T_4417}; // @[Cat.scala 29:58]
  wire  _T_4414 = buf_error_en_0 | buf_error[0]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4415 = ~buf_rst_0; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4419 = buf_error_en_1 | buf_error[1]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4420 = ~buf_rst_1; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4424 = buf_error_en_2 | buf_error[2]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4425 = ~buf_rst_2; // @[el2_lsu_bus_buffer.scala 569:128]
  wire  _T_4429 = buf_error_en_3 | buf_error[3]; // @[el2_lsu_bus_buffer.scala 569:86]
  wire  _T_4430 = ~buf_rst_3; // @[el2_lsu_bus_buffer.scala 569:128]
  wire [1:0] _T_4436 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4437 = io_ldst_dual_m ? _T_4436 : {{1'd0}, io_lsu_busreq_m}; // @[el2_lsu_bus_buffer.scala 572:28]
  wire [1:0] _T_4438 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4439 = io_ldst_dual_r ? _T_4438 : {{1'd0}, io_lsu_busreq_r}; // @[el2_lsu_bus_buffer.scala 572:94]
  wire [2:0] _T_4440 = _T_4437 + _T_4439; // @[el2_lsu_bus_buffer.scala 572:88]
  wire [2:0] _GEN_380 = {{2'd0}, ibuf_valid}; // @[el2_lsu_bus_buffer.scala 572:154]
  wire [3:0] _T_4441 = _T_4440 + _GEN_380; // @[el2_lsu_bus_buffer.scala 572:154]
  wire [1:0] _T_4446 = _T_5 + _T_12; // @[el2_lsu_bus_buffer.scala 572:217]
  wire [1:0] _GEN_381 = {{1'd0}, _T_19}; // @[el2_lsu_bus_buffer.scala 572:217]
  wire [2:0] _T_4447 = _T_4446 + _GEN_381; // @[el2_lsu_bus_buffer.scala 572:217]
  wire [2:0] _GEN_382 = {{2'd0}, _T_26}; // @[el2_lsu_bus_buffer.scala 572:217]
  wire [3:0] _T_4448 = _T_4447 + _GEN_382; // @[el2_lsu_bus_buffer.scala 572:217]
  wire [3:0] buf_numvld_any = _T_4441 + _T_4448; // @[el2_lsu_bus_buffer.scala 572:169]
  wire  _T_4519 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_buffer.scala 578:52]
  wire  _T_4520 = buf_numvld_any >= 4'h3; // @[el2_lsu_bus_buffer.scala 578:92]
  wire  _T_4521 = buf_numvld_any == 4'h4; // @[el2_lsu_bus_buffer.scala 578:121]
  wire  _T_4523 = |buf_state_0; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4524 = |buf_state_1; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4525 = |buf_state_2; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4526 = |buf_state_3; // @[el2_lsu_bus_buffer.scala 579:52]
  wire  _T_4527 = _T_4523 | _T_4524; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4528 = _T_4527 | _T_4525; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4529 = _T_4528 | _T_4526; // @[el2_lsu_bus_buffer.scala 579:65]
  wire  _T_4530 = ~_T_4529; // @[el2_lsu_bus_buffer.scala 579:34]
  wire  _T_4532 = _T_4530 & _T_852; // @[el2_lsu_bus_buffer.scala 579:70]
  wire  _T_4535 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[el2_lsu_bus_buffer.scala 581:51]
  wire  _T_4536 = _T_4535 & io_lsu_pkt_m_load; // @[el2_lsu_bus_buffer.scala 581:72]
  wire  _T_4537 = ~io_flush_m_up; // @[el2_lsu_bus_buffer.scala 581:94]
  wire  _T_4538 = _T_4536 & _T_4537; // @[el2_lsu_bus_buffer.scala 581:92]
  wire  _T_4539 = ~io_ld_full_hit_m; // @[el2_lsu_bus_buffer.scala 581:111]
  wire  _T_4541 = ~io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 584:61]
  reg  lsu_nonblock_load_valid_r; // @[el2_lsu_bus_buffer.scala 669:66]
  wire  _T_4559 = _T_2820 & _T_3664; // @[Mux.scala 27:72]
  wire  _T_4560 = _T_2842 & _T_3857; // @[Mux.scala 27:72]
  wire  _T_4561 = _T_2864 & _T_4050; // @[Mux.scala 27:72]
  wire  _T_4562 = _T_2886 & _T_4243; // @[Mux.scala 27:72]
  wire  _T_4563 = _T_4559 | _T_4560; // @[Mux.scala 27:72]
  wire  _T_4564 = _T_4563 | _T_4561; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4564 | _T_4562; // @[Mux.scala 27:72]
  wire  _T_4570 = buf_error[0] & _T_3664; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4575 = buf_error[1] & _T_3857; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4580 = buf_error[2] & _T_4050; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4585 = buf_error[3] & _T_4243; // @[el2_lsu_bus_buffer.scala 587:108]
  wire  _T_4586 = _T_2820 & _T_4570; // @[Mux.scala 27:72]
  wire  _T_4587 = _T_2842 & _T_4575; // @[Mux.scala 27:72]
  wire  _T_4588 = _T_2864 & _T_4580; // @[Mux.scala 27:72]
  wire  _T_4589 = _T_2886 & _T_4585; // @[Mux.scala 27:72]
  wire  _T_4590 = _T_4586 | _T_4587; // @[Mux.scala 27:72]
  wire  _T_4591 = _T_4590 | _T_4588; // @[Mux.scala 27:72]
  wire  _T_4598 = ~buf_dual_0; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4599 = ~buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4600 = _T_4598 | _T_4599; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4601 = _T_4559 & _T_4600; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4606 = ~buf_dual_1; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4607 = ~buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4608 = _T_4606 | _T_4607; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4609 = _T_4560 & _T_4608; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4614 = ~buf_dual_2; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4615 = ~buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4616 = _T_4614 | _T_4615; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4617 = _T_4561 & _T_4616; // @[el2_lsu_bus_buffer.scala 588:106]
  wire  _T_4622 = ~buf_dual_3; // @[el2_lsu_bus_buffer.scala 588:109]
  wire  _T_4623 = ~buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 588:124]
  wire  _T_4624 = _T_4622 | _T_4623; // @[el2_lsu_bus_buffer.scala 588:122]
  wire  _T_4625 = _T_4562 & _T_4624; // @[el2_lsu_bus_buffer.scala 588:106]
  wire [1:0] _T_4628 = _T_4617 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4629 = _T_4625 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_383 = {{1'd0}, _T_4609}; // @[Mux.scala 27:72]
  wire [1:0] _T_4631 = _GEN_383 | _T_4628; // @[Mux.scala 27:72]
  wire [31:0] _T_4666 = _T_4601 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4667 = _T_4609 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4668 = _T_4617 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4625 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4666 | _T_4667; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4670 | _T_4668; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire  _T_4677 = buf_dual_0 | buf_dualhi_0; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4678 = _T_4559 & _T_4677; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4683 = buf_dual_1 | buf_dualhi_1; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4684 = _T_4560 & _T_4683; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4689 = buf_dual_2 | buf_dualhi_2; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4690 = _T_4561 & _T_4689; // @[el2_lsu_bus_buffer.scala 590:105]
  wire  _T_4695 = buf_dual_3 | buf_dualhi_3; // @[el2_lsu_bus_buffer.scala 590:120]
  wire  _T_4696 = _T_4562 & _T_4695; // @[el2_lsu_bus_buffer.scala 590:105]
  wire [31:0] _T_4697 = _T_4678 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4698 = _T_4684 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4699 = _T_4690 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4700 = _T_4696 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4701 = _T_4697 | _T_4698; // @[Mux.scala 27:72]
  wire [31:0] _T_4702 = _T_4701 | _T_4699; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4702 | _T_4700; // @[Mux.scala 27:72]
  wire  _T_4704 = io_lsu_nonblock_load_data_tag == 2'h0; // @[el2_lsu_bus_buffer.scala 110:123]
  wire  _T_4705 = io_lsu_nonblock_load_data_tag == 2'h1; // @[el2_lsu_bus_buffer.scala 110:123]
  wire  _T_4706 = io_lsu_nonblock_load_data_tag == 2'h2; // @[el2_lsu_bus_buffer.scala 110:123]
  wire  _T_4707 = io_lsu_nonblock_load_data_tag == 2'h3; // @[el2_lsu_bus_buffer.scala 110:123]
  wire [31:0] _T_4708 = _T_4704 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4709 = _T_4705 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4710 = _T_4706 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4711 = _T_4707 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4712 = _T_4708 | _T_4709; // @[Mux.scala 27:72]
  wire [31:0] _T_4713 = _T_4712 | _T_4710; // @[Mux.scala 27:72]
  wire [31:0] _T_4714 = _T_4713 | _T_4711; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4714[1:0]; // @[el2_lsu_bus_buffer.scala 591:83]
  wire [1:0] _T_4720 = _T_4704 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4721 = _T_4705 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4722 = _T_4706 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4723 = _T_4707 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4724 = _T_4720 | _T_4721; // @[Mux.scala 27:72]
  wire [1:0] _T_4725 = _T_4724 | _T_4722; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4725 | _T_4723; // @[Mux.scala 27:72]
  wire  _T_4735 = _T_4704 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4736 = _T_4705 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4737 = _T_4706 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4738 = _T_4707 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4739 = _T_4735 | _T_4736; // @[Mux.scala 27:72]
  wire  _T_4740 = _T_4739 | _T_4737; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4740 | _T_4738; // @[Mux.scala 27:72]
  wire [63:0] _T_4760 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_384 = {{2'd0}, lsu_nonblock_addr_offset}; // @[el2_lsu_bus_buffer.scala 595:121]
  wire [5:0] _T_4761 = _GEN_384 * 4'h8; // @[el2_lsu_bus_buffer.scala 595:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4760 >> _T_4761; // @[el2_lsu_bus_buffer.scala 595:92]
  wire  _T_4762 = ~io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_buffer.scala 597:69]
  wire  _T_4764 = lsu_nonblock_sz == 2'h0; // @[el2_lsu_bus_buffer.scala 598:81]
  wire  _T_4765 = lsu_nonblock_unsign & _T_4764; // @[el2_lsu_bus_buffer.scala 598:63]
  wire [31:0] _T_4767 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4768 = lsu_nonblock_sz == 2'h1; // @[el2_lsu_bus_buffer.scala 599:45]
  wire  _T_4769 = lsu_nonblock_unsign & _T_4768; // @[el2_lsu_bus_buffer.scala 599:26]
  wire [31:0] _T_4771 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4772 = ~lsu_nonblock_unsign; // @[el2_lsu_bus_buffer.scala 600:6]
  wire  _T_4774 = _T_4772 & _T_4764; // @[el2_lsu_bus_buffer.scala 600:27]
  wire [23:0] _T_4777 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4779 = {_T_4777,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4782 = _T_4772 & _T_4768; // @[el2_lsu_bus_buffer.scala 601:27]
  wire [15:0] _T_4785 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4787 = {_T_4785,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4788 = lsu_nonblock_sz == 2'h2; // @[el2_lsu_bus_buffer.scala 602:21]
  wire [31:0] _T_4789 = _T_4765 ? _T_4767 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4790 = _T_4769 ? _T_4771 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4791 = _T_4774 ? _T_4779 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4792 = _T_4782 ? _T_4787 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4793 = _T_4788 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4794 = _T_4789 | _T_4790; // @[Mux.scala 27:72]
  wire [31:0] _T_4795 = _T_4794 | _T_4791; // @[Mux.scala 27:72]
  wire [31:0] _T_4796 = _T_4795 | _T_4792; // @[Mux.scala 27:72]
  wire [63:0] _GEN_385 = {{32'd0}, _T_4796}; // @[Mux.scala 27:72]
  wire [63:0] _T_4797 = _GEN_385 | _T_4793; // @[Mux.scala 27:72]
  wire  _T_4892 = obuf_valid & obuf_write; // @[el2_lsu_bus_buffer.scala 620:36]
  wire  _T_4893 = ~obuf_cmd_done; // @[el2_lsu_bus_buffer.scala 620:51]
  wire  _T_4894 = _T_4892 & _T_4893; // @[el2_lsu_bus_buffer.scala 620:49]
  wire [31:0] _T_4898 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4900 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4905 = ~obuf_data_done; // @[el2_lsu_bus_buffer.scala 632:50]
  wire  _T_4906 = _T_4892 & _T_4905; // @[el2_lsu_bus_buffer.scala 632:48]
  wire [7:0] _T_4910 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4913 = obuf_valid & _T_1364; // @[el2_lsu_bus_buffer.scala 637:36]
  wire  _T_4915 = _T_4913 & _T_1370; // @[el2_lsu_bus_buffer.scala 637:50]
  wire  _T_4927 = io_lsu_bus_clk_en_q & buf_error[0]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4929 = _T_4927 & buf_write[0]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4932 = io_lsu_bus_clk_en_q & buf_error[1]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4934 = _T_4932 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4937 = io_lsu_bus_clk_en_q & buf_error[2]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4939 = _T_4937 & buf_write[2]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4942 = io_lsu_bus_clk_en_q & buf_error[3]; // @[el2_lsu_bus_buffer.scala 650:114]
  wire  _T_4944 = _T_4942 & buf_write[3]; // @[el2_lsu_bus_buffer.scala 650:129]
  wire  _T_4945 = _T_2820 & _T_4929; // @[Mux.scala 27:72]
  wire  _T_4946 = _T_2842 & _T_4934; // @[Mux.scala 27:72]
  wire  _T_4947 = _T_2864 & _T_4939; // @[Mux.scala 27:72]
  wire  _T_4948 = _T_2886 & _T_4944; // @[Mux.scala 27:72]
  wire  _T_4949 = _T_4945 | _T_4946; // @[Mux.scala 27:72]
  wire  _T_4950 = _T_4949 | _T_4947; // @[Mux.scala 27:72]
  wire  _T_4960 = _T_2842 & buf_error[1]; // @[el2_lsu_bus_buffer.scala 651:98]
  wire  lsu_imprecise_error_store_tag = _T_4960 & buf_write[1]; // @[el2_lsu_bus_buffer.scala 651:113]
  wire  _T_4966 = ~io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 653:72]
  wire  _T_4968 = ~lsu_imprecise_error_store_tag; // @[el2_lsu_bus_buffer.scala 110:123]
  wire [31:0] _T_4970 = _T_4968 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4971 = lsu_imprecise_error_store_tag ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4972 = _T_4970 | _T_4971; // @[Mux.scala 27:72]
  wire  _T_4989 = bus_wcmd_sent | bus_wdata_sent; // @[el2_lsu_bus_buffer.scala 660:68]
  wire  _T_4992 = io_lsu_busreq_r & io_ldst_dual_r; // @[el2_lsu_bus_buffer.scala 661:48]
  wire  _T_4995 = ~io_lsu_axi_awready; // @[el2_lsu_bus_buffer.scala 664:48]
  wire  _T_4996 = io_lsu_axi_awvalid & _T_4995; // @[el2_lsu_bus_buffer.scala 664:46]
  wire  _T_4997 = ~io_lsu_axi_wready; // @[el2_lsu_bus_buffer.scala 664:92]
  wire  _T_4998 = io_lsu_axi_wvalid & _T_4997; // @[el2_lsu_bus_buffer.scala 664:90]
  wire  _T_4999 = _T_4996 | _T_4998; // @[el2_lsu_bus_buffer.scala 664:69]
  wire  _T_5000 = ~io_lsu_axi_arready; // @[el2_lsu_bus_buffer.scala 664:136]
  wire  _T_5001 = io_lsu_axi_arvalid & _T_5000; // @[el2_lsu_bus_buffer.scala 664:134]
  wire  _T_5005 = ~io_flush_r; // @[el2_lsu_bus_buffer.scala 668:75]
  wire  _T_5006 = io_lsu_busreq_m & _T_5005; // @[el2_lsu_bus_buffer.scala 668:73]
  reg  _T_5009; // @[el2_lsu_bus_buffer.scala 668:56]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 506:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_busreq_r = _T_5009; // @[el2_lsu_bus_buffer.scala 668:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[el2_lsu_bus_buffer.scala 577:30]
  assign io_lsu_bus_buffer_full_any = _T_4519 ? _T_4520 : _T_4521; // @[el2_lsu_bus_buffer.scala 578:30]
  assign io_lsu_bus_buffer_empty_any = _T_4532 & _T_1252; // @[el2_lsu_bus_buffer.scala 579:31]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[el2_lsu_bus_buffer.scala 189:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[el2_lsu_bus_buffer.scala 190:25]
  assign io_ld_fwddata_buf_lo = _T_650 | _T_651; // @[el2_lsu_bus_buffer.scala 216:24]
  assign io_ld_fwddata_buf_hi = _T_747 | _T_748; // @[el2_lsu_bus_buffer.scala 222:24]
  assign io_lsu_imprecise_error_load_any = io_lsu_nonblock_load_data_error & _T_4966; // @[el2_lsu_bus_buffer.scala 653:35]
  assign io_lsu_imprecise_error_store_any = _T_4950 | _T_4948; // @[el2_lsu_bus_buffer.scala 650:36]
  assign io_lsu_imprecise_error_addr_any = io_lsu_imprecise_error_store_any ? _T_4972 : _T_4714; // @[el2_lsu_bus_buffer.scala 654:35]
  assign io_lsu_nonblock_load_valid_m = _T_4538 & _T_4539; // @[el2_lsu_bus_buffer.scala 581:32]
  assign io_lsu_nonblock_load_tag_m = _T_1884 ? 2'h0 : _T_1920; // @[el2_lsu_bus_buffer.scala 582:30]
  assign io_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4541; // @[el2_lsu_bus_buffer.scala 584:30]
  assign io_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[el2_lsu_bus_buffer.scala 585:34]
  assign io_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4762; // @[el2_lsu_bus_buffer.scala 597:35]
  assign io_lsu_nonblock_load_data_error = _T_4591 | _T_4589; // @[el2_lsu_bus_buffer.scala 587:35]
  assign io_lsu_nonblock_load_data_tag = _T_4631 | _T_4629; // @[el2_lsu_bus_buffer.scala 588:33]
  assign io_lsu_nonblock_load_data = _T_4797[31:0]; // @[el2_lsu_bus_buffer.scala 598:29]
  assign io_lsu_pmu_bus_trxn = _T_4989 | _T_4884; // @[el2_lsu_bus_buffer.scala 660:23]
  assign io_lsu_pmu_bus_misaligned = _T_4992 & io_lsu_commit_r; // @[el2_lsu_bus_buffer.scala 661:29]
  assign io_lsu_pmu_bus_error = io_lsu_imprecise_error_load_any | io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_buffer.scala 662:24]
  assign io_lsu_pmu_bus_busy = _T_4999 | _T_5001; // @[el2_lsu_bus_buffer.scala 664:23]
  assign io_lsu_axi_awvalid = _T_4894 & _T_1260; // @[el2_lsu_bus_buffer.scala 620:22]
  assign io_lsu_axi_awid = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 621:19]
  assign io_lsu_axi_awaddr = obuf_sideeffect ? obuf_addr : _T_4898; // @[el2_lsu_bus_buffer.scala 622:21]
  assign io_lsu_axi_awregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 626:23]
  assign io_lsu_axi_awsize = obuf_sideeffect ? _T_4900 : 3'h3; // @[el2_lsu_bus_buffer.scala 623:21]
  assign io_lsu_axi_awcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 625:22]
  assign io_lsu_axi_wvalid = _T_4906 & _T_1260; // @[el2_lsu_bus_buffer.scala 632:21]
  assign io_lsu_axi_wdata = obuf_data; // @[el2_lsu_bus_buffer.scala 634:20]
  assign io_lsu_axi_wstrb = obuf_byteen & _T_4910; // @[el2_lsu_bus_buffer.scala 633:20]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu_bus_buffer.scala 648:21]
  assign io_lsu_axi_arvalid = _T_4915 & _T_1260; // @[el2_lsu_bus_buffer.scala 637:22]
  assign io_lsu_axi_arid = {{1'd0}, _T_1869}; // @[el2_lsu_bus_buffer.scala 638:19]
  assign io_lsu_axi_araddr = obuf_sideeffect ? obuf_addr : _T_4898; // @[el2_lsu_bus_buffer.scala 639:21]
  assign io_lsu_axi_arregion = obuf_addr[31:28]; // @[el2_lsu_bus_buffer.scala 643:23]
  assign io_lsu_axi_arsize = obuf_sideeffect ? _T_4900 : 3'h3; // @[el2_lsu_bus_buffer.scala 640:21]
  assign io_lsu_axi_arcache = obuf_sideeffect ? 4'h0 : 4'hf; // @[el2_lsu_bus_buffer.scala 642:22]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu_bus_buffer.scala 649:21]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_io_en = _T_853 & _T_854; // @[el2_lib.scala 509:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_1_io_en = _T_853 & _T_854; // @[el2_lib.scala 509:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_2_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 508:18]
  assign rvclkhdr_2_io_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lib.scala 509:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_3_io_clk = io_lsu_busm_clk; // @[el2_lib.scala 508:18]
  assign rvclkhdr_3_io_en = _T_1261 & io_lsu_bus_clk_en; // @[el2_lib.scala 509:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_4_io_en = _T_3549 & buf_state_en_0; // @[el2_lib.scala 509:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_5_io_en = _T_3742 & buf_state_en_1; // @[el2_lib.scala 509:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_6_io_en = _T_3935 & buf_state_en_2; // @[el2_lib.scala 509:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_7_io_en = _T_4128 & buf_state_en_3; // @[el2_lib.scala 509:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_8_io_en = _T_3549 ? buf_state_en_0 : _GEN_70; // @[el2_lib.scala 509:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_9_io_en = _T_3742 ? buf_state_en_1 : _GEN_146; // @[el2_lib.scala 509:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_10_io_en = _T_3935 ? buf_state_en_2 : _GEN_222; // @[el2_lib.scala 509:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 508:18]
  assign rvclkhdr_11_io_en = _T_4128 ? buf_state_en_3 : _GEN_298; // @[el2_lib.scala 509:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 510:24]
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
  _T_4381 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4378 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4375 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4372 = _RAND_4[0:0];
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
  _T_1869 = _RAND_17[1:0];
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
  _T_4351 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4348 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4345 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4342 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  buf_dual_3 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  buf_dual_2 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  buf_dual_1 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  buf_dual_0 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf_samedw_3 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  buf_samedw_2 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf_samedw_1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  buf_samedw_0 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  obuf_write = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  obuf_cmd_done = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  obuf_data_done = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  obuf_nosend = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  obuf_addr = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  buf_sz_0 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  buf_sz_1 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  buf_sz_2 = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  buf_sz_3 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  obuf_sideeffect = _RAND_71[0:0];
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
  _T_4328 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4326 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4324 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4322 = _RAND_88[0:0];
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
  _T_4357 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4360 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4363 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4366 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4432 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4427 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4422 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4417 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_5009 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4381 = 1'h0;
  end
  if (reset) begin
    _T_4378 = 1'h0;
  end
  if (reset) begin
    _T_4375 = 1'h0;
  end
  if (reset) begin
    _T_4372 = 1'h0;
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
    _T_1869 = 2'h0;
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
    _T_4351 = 1'h0;
  end
  if (reset) begin
    _T_4348 = 1'h0;
  end
  if (reset) begin
    _T_4345 = 1'h0;
  end
  if (reset) begin
    _T_4342 = 1'h0;
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
    obuf_sideeffect = 1'h0;
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
    _T_4328 = 1'h0;
  end
  if (reset) begin
    _T_4326 = 1'h0;
  end
  if (reset) begin
    _T_4324 = 1'h0;
  end
  if (reset) begin
    _T_4322 = 1'h0;
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
    _T_4357 = 1'h0;
  end
  if (reset) begin
    _T_4360 = 1'h0;
  end
  if (reset) begin
    _T_4363 = 1'h0;
  end
  if (reset) begin
    _T_4366 = 1'h0;
  end
  if (reset) begin
    _T_4432 = 1'h0;
  end
  if (reset) begin
    _T_4427 = 1'h0;
  end
  if (reset) begin
    _T_4422 = 1'h0;
  end
  if (reset) begin
    _T_4417 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_5009 = 1'h0;
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
    end else if (_T_3364) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4381 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4381 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4378 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4378 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4375 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4375 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4372 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4372 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3549) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3572) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3576) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3610) begin
        if (_T_3615) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3623) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3651) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3697) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3703) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3715) begin
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
    end else if (_T_3373) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3742) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3765) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3769) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3803) begin
        if (_T_3808) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3816) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3844) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3890) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3896) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3908) begin
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
    end else if (_T_3382) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3935) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3958) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3962) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3996) begin
        if (_T_4001) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4009) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4037) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4083) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4089) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4101) begin
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
    end else if (_T_3391) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4128) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4151) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4155) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3580) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4189) begin
        if (_T_4194) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4202) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4230) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4276) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4282) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4294) begin
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
      end else if (_T_3391) begin
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
      end else if (_T_3382) begin
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
      end else if (_T_3373) begin
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
      end else if (_T_3364) begin
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
      buf_ageQ_3 <= {_T_2556,_T_2479};
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      _T_1869 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1869 <= WrPtr0_r;
      end else begin
        _T_1869 <= CmdPtr0;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_merge <= 1'h0;
    end else if (obuf_wr_en) begin
      obuf_merge <= obuf_merge_en;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_tag1 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_tag1 <= WrPtr1_r;
      end else begin
        obuf_tag1 <= 2'h0;
      end
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      obuf_valid <= 1'h0;
    end else begin
      obuf_valid <= _T_1860 & _T_1861;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1261 & io_lsu_bus_clk_en;
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
      ibuf_write <= io_lsu_pkt_r_store;
    end
  end
  always @(posedge clock or posedge reset) begin
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
      buf_ageQ_2 <= {_T_2454,_T_2377};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2352,_T_2275};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2250,_T_2173};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3549) begin
      if (_T_3564) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3572) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3576) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3610) begin
      if (_T_3690) begin
        if (buf_addr_0[2]) begin
          buf_data_0 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_0 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_0 <= io_lsu_axi_rdata[31:0];
      end
    end else begin
      buf_data_0 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_9_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3742) begin
      if (_T_3757) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3765) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3769) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3803) begin
      if (_T_3883) begin
        if (buf_addr_1[2]) begin
          buf_data_1 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_1 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_1 <= io_lsu_axi_rdata[31:0];
      end
    end else begin
      buf_data_1 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_10_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3935) begin
      if (_T_3950) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3958) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3962) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_3996) begin
      if (_T_4076) begin
        if (buf_addr_2[2]) begin
          buf_data_2 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_2 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_2 <= io_lsu_axi_rdata[31:0];
      end
    end else begin
      buf_data_2 <= 32'h0;
    end
  end
  always @(posedge rvclkhdr_11_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4128) begin
      if (_T_4143) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4151) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4155) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_rdata[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
      end
    end else if (_T_4189) begin
      if (_T_4269) begin
        if (buf_addr_3[2]) begin
          buf_data_3 <= io_lsu_axi_rdata[63:32];
        end else begin
          buf_data_3 <= io_lsu_axi_rdata[31:0];
        end
      end else begin
        buf_data_3 <= io_lsu_axi_rdata[31:0];
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
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
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
    end else if (_T_1011) begin
      ibuf_sideeffect <= io_is_sideeffects_r;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1935) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1949) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1963) begin
      WrPtr1_r <= 2'h2;
    end else begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1884) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1895) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1906) begin
      WrPtr0_r <= 2'h2;
    end else begin
      WrPtr0_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_tag <= 2'h0;
    end else if (_T_1011) begin
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
    end else if (_T_1011) begin
      ibuf_dualtag <= WrPtr0_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_dual <= 1'h0;
    end else if (_T_1011) begin
      ibuf_dual <= io_ldst_dual_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_samedw <= 1'h0;
    end else if (_T_1011) begin
      ibuf_samedw <= ldst_samedw_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_nomerge <= 1'h0;
    end else if (_T_1011) begin
      ibuf_nomerge <= io_no_dword_merge_r;
    end
  end
  always @(posedge io_lsu_bus_ibuf_c1_clk or posedge reset) begin
    if (reset) begin
      ibuf_unsign <= 1'h0;
    end else if (_T_1011) begin
      ibuf_unsign <= io_lsu_pkt_r_unsign;
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
    end else if (_T_1079) begin
      obuf_wr_timer <= _T_1081;
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
      _T_4351 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4351 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4348 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4348 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4345 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4345 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4342 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4342 <= buf_sideeffect_in[0];
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_write <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_write <= io_lsu_pkt_r_store;
      end else begin
        obuf_write <= _T_1223;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_cmd_done <= 1'h0;
    end else begin
      obuf_cmd_done <= _T_1326 & _T_4881;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1326 & _T_4882;
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
      obuf_addr <= _T_1310;
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
      obuf_sideeffect <= 1'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sideeffect <= io_is_sideeffects_r;
      end else begin
        obuf_sideeffect <= _T_1072;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_pend <= 1'h0;
    end else begin
      obuf_rdrsp_pend <= _T_1351 | _T_1355;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1357) begin
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
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_sz <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        obuf_sz <= ibuf_sz_in;
      end else begin
        obuf_sz <= _T_1323;
      end
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
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
      obuf_data <= {_T_1641,_T_1600};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3194,_T_3183};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3209,_T_3198};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3224,_T_3213};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3239,_T_3228};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4328 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4128) begin
        _T_4328 <= 1'h0;
      end else if (_T_4151) begin
        _T_4328 <= 1'h0;
      end else begin
        _T_4328 <= _T_4155;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4326 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3935) begin
        _T_4326 <= 1'h0;
      end else if (_T_3958) begin
        _T_4326 <= 1'h0;
      end else begin
        _T_4326 <= _T_3962;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4324 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3742) begin
        _T_4324 <= 1'h0;
      end else if (_T_3765) begin
        _T_4324 <= 1'h0;
      end else begin
        _T_4324 <= _T_3769;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4322 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3549) begin
        _T_4322 <= 1'h0;
      end else if (_T_3572) begin
        _T_4322 <= 1'h0;
      end else begin
        _T_4322 <= _T_3576;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3549) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3572) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3576) begin
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
      end else if (_T_3364) begin
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
      if (_T_4128) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4151) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4155) begin
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
      if (_T_3935) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3958) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3962) begin
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
      if (_T_3742) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3765) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3769) begin
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
      end else if (_T_3373) begin
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
      end else if (_T_3382) begin
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
      end else if (_T_3391) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4357 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4357 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4360 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4360 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4363 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4363 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4366 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4366 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4432 <= 1'h0;
    end else begin
      _T_4432 <= _T_4429 & _T_4430;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4427 <= 1'h0;
    end else begin
      _T_4427 <= _T_4424 & _T_4425;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4422 <= 1'h0;
    end else begin
      _T_4422 <= _T_4419 & _T_4420;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4417 <= 1'h0;
    end else begin
      _T_4417 <= _T_4414 & _T_4415;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      lsu_nonblock_load_valid_r <= 1'h0;
    end else begin
      lsu_nonblock_load_valid_r <= io_lsu_nonblock_load_valid_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_5009 <= 1'h0;
    end else begin
      _T_5009 <= _T_5006 & _T_4539;
    end
  end
endmodule
module el2_lsu_bus_intf(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_dec_tlu_external_ldfwd_disable,
  input         io_dec_tlu_wb_coalescing_disable,
  input         io_dec_tlu_sideeffect_posted_disable,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_free_clk,
  input         io_lsu_busm_clk,
  input         io_dec_lsu_valid_raw_d,
  input         io_lsu_busreq_m,
  input         io_lsu_pkt_m_load,
  input         io_lsu_pkt_m_valid,
  input         io_lsu_pkt_r_by,
  input         io_lsu_pkt_r_half,
  input         io_lsu_pkt_r_word,
  input         io_lsu_pkt_r_load,
  input         io_lsu_pkt_r_store,
  input         io_lsu_pkt_r_unsign,
  input         io_lsu_pkt_r_valid,
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
  input         io_lsu_axi_awready,
  input         io_lsu_axi_wready,
  input         io_lsu_axi_bvalid,
  input  [1:0]  io_lsu_axi_bresp,
  input  [2:0]  io_lsu_axi_bid,
  input         io_lsu_axi_arready,
  input         io_lsu_axi_rvalid,
  input  [2:0]  io_lsu_axi_rid,
  input  [63:0] io_lsu_axi_rdata,
  input         io_lsu_bus_clk_en,
  output        io_lsu_busreq_r,
  output        io_lsu_bus_buffer_pend_any,
  output        io_lsu_bus_buffer_full_any,
  output        io_lsu_bus_buffer_empty_any,
  output [31:0] io_bus_read_data_m,
  output        io_lsu_imprecise_error_load_any,
  output        io_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_imprecise_error_addr_any,
  output        io_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_nonblock_load_tag_m,
  output        io_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_nonblock_load_data_valid,
  output        io_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_nonblock_load_data,
  output        io_lsu_pmu_bus_trxn,
  output        io_lsu_pmu_bus_misaligned,
  output        io_lsu_pmu_bus_error,
  output        io_lsu_pmu_bus_busy,
  output        io_lsu_axi_awvalid,
  output [2:0]  io_lsu_axi_awid,
  output [31:0] io_lsu_axi_awaddr,
  output [3:0]  io_lsu_axi_awregion,
  output [2:0]  io_lsu_axi_awsize,
  output [3:0]  io_lsu_axi_awcache,
  output        io_lsu_axi_wvalid,
  output [63:0] io_lsu_axi_wdata,
  output [7:0]  io_lsu_axi_wstrb,
  output        io_lsu_axi_arvalid,
  output [2:0]  io_lsu_axi_arid,
  output [31:0] io_lsu_axi_araddr,
  output [3:0]  io_lsu_axi_arregion,
  output [2:0]  io_lsu_axi_arsize,
  output [3:0]  io_lsu_axi_arcache
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  bus_buffer_clock; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_reset; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_scan_mode; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_dec_tlu_force_halt; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_c2_r_clk; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_buf_c1_clk; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_free_c2_clk; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_busm_clk; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_m_valid; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_by; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_half; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_word; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_load; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pkt_r_unsign; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_addr_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_end_addr_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_addr_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_end_addr_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_store_data_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_no_word_merge_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_no_dword_merge_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_ld_full_hit_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_flush_m_up; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_flush_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_commit_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_is_sideeffects_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_ldst_dual_d; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_ldst_dual_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_ldst_dual_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire [7:0] bus_buffer_io_ldst_byteen_ext_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_awready; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_wready; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_bvalid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [1:0] bus_buffer_io_lsu_axi_bresp; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_bid; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_arready; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_rvalid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_rid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [63:0] bus_buffer_io_lsu_axi_rdata; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_clk_en; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_busreq_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_buffer_pend_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_buffer_full_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_bus_buffer_empty_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_lo; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_hi; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_lo; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_hi; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_imprecise_error_load_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_imprecise_error_addr_any; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_nonblock_load_valid_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_tag_m; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_nonblock_load_inv_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_nonblock_load_data_valid; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_intf.scala 148:39]
  wire [1:0] bus_buffer_io_lsu_nonblock_load_data_tag; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_nonblock_load_data; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pmu_bus_trxn; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pmu_bus_misaligned; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pmu_bus_error; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_pmu_bus_busy; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_awvalid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_awid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_axi_awaddr; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_lsu_axi_awregion; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_awsize; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_lsu_axi_awcache; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_wvalid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [63:0] bus_buffer_io_lsu_axi_wdata; // @[el2_lsu_bus_intf.scala 148:39]
  wire [7:0] bus_buffer_io_lsu_axi_wstrb; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_bready; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_arvalid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_arid; // @[el2_lsu_bus_intf.scala 148:39]
  wire [31:0] bus_buffer_io_lsu_axi_araddr; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_lsu_axi_arregion; // @[el2_lsu_bus_intf.scala 148:39]
  wire [2:0] bus_buffer_io_lsu_axi_arsize; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] bus_buffer_io_lsu_axi_arcache; // @[el2_lsu_bus_intf.scala 148:39]
  wire  bus_buffer_io_lsu_axi_rready; // @[el2_lsu_bus_intf.scala 148:39]
  wire [3:0] _T_3 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_4 = io_lsu_pkt_r_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_5 = io_lsu_pkt_r_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = _T_3 | _T_4; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_m = _T_6 | _T_5; // @[Mux.scala 27:72]
  wire  addr_match_dw_lo_r_m = io_lsu_addr_r[31:3] == io_lsu_addr_m[31:3]; // @[el2_lsu_bus_intf.scala 248:51]
  wire  _T_17 = io_lsu_addr_r[2] ^ io_lsu_addr_m[2]; // @[el2_lsu_bus_intf.scala 249:71]
  wire  _T_18 = ~_T_17; // @[el2_lsu_bus_intf.scala 249:53]
  wire  addr_match_word_lo_r_m = addr_match_dw_lo_r_m & _T_18; // @[el2_lsu_bus_intf.scala 249:51]
  reg  ldst_dual_r; // @[el2_lsu_bus_intf.scala 290:33]
  wire  _T_20 = ~ldst_dual_r; // @[el2_lsu_bus_intf.scala 250:48]
  wire  _T_21 = io_lsu_busreq_r & _T_20; // @[el2_lsu_bus_intf.scala 250:46]
  wire  _T_22 = _T_21 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 250:61]
  wire  _T_23 = ~addr_match_word_lo_r_m; // @[el2_lsu_bus_intf.scala 250:102]
  wire  _T_24 = io_lsu_pkt_m_load | _T_23; // @[el2_lsu_bus_intf.scala 250:100]
  wire  _T_29 = ~addr_match_dw_lo_r_m; // @[el2_lsu_bus_intf.scala 251:102]
  wire  _T_30 = io_lsu_pkt_m_load | _T_29; // @[el2_lsu_bus_intf.scala 251:100]
  wire [7:0] _T_33 = {4'h0,ldst_byteen_m}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_0 = {{3'd0}, _T_33}; // @[el2_lsu_bus_intf.scala 252:63]
  wire [10:0] _T_35 = _GEN_0 << io_lsu_addr_m[1:0]; // @[el2_lsu_bus_intf.scala 252:63]
  reg  _T_389; // @[el2_lsu_bus_intf.scala 292:33]
  wire [3:0] ldst_byteen_r = {{3'd0}, _T_389}; // @[el2_lsu_bus_intf.scala 292:23]
  wire [7:0] _T_37 = {4'h0,ldst_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_1 = {{3'd0}, _T_37}; // @[el2_lsu_bus_intf.scala 253:63]
  wire [10:0] _T_39 = _GEN_1 << io_lsu_addr_r[1:0]; // @[el2_lsu_bus_intf.scala 253:63]
  wire [63:0] _T_41 = {32'h0,io_store_data_r}; // @[Cat.scala 29:58]
  wire [4:0] _T_43 = {io_lsu_addr_r[1:0],3'h0}; // @[Cat.scala 29:58]
  wire [94:0] _GEN_2 = {{31'd0}, _T_41}; // @[el2_lsu_bus_intf.scala 254:67]
  wire [94:0] _T_44 = _GEN_2 << _T_43; // @[el2_lsu_bus_intf.scala 254:67]
  wire [7:0] ldst_byteen_ext_m = _T_35[7:0]; // @[el2_lsu_bus_intf.scala 252:27]
  wire [3:0] ldst_byteen_hi_m = ldst_byteen_ext_m[7:4]; // @[el2_lsu_bus_intf.scala 255:47]
  wire [3:0] ldst_byteen_lo_m = ldst_byteen_ext_m[3:0]; // @[el2_lsu_bus_intf.scala 256:47]
  wire [7:0] ldst_byteen_ext_r = _T_39[7:0]; // @[el2_lsu_bus_intf.scala 253:27]
  wire [3:0] ldst_byteen_hi_r = ldst_byteen_ext_r[7:4]; // @[el2_lsu_bus_intf.scala 257:47]
  wire [3:0] ldst_byteen_lo_r = ldst_byteen_ext_r[3:0]; // @[el2_lsu_bus_intf.scala 258:47]
  wire [63:0] store_data_ext_r = _T_44[63:0]; // @[el2_lsu_bus_intf.scala 254:27]
  wire [31:0] store_data_hi_r = store_data_ext_r[63:32]; // @[el2_lsu_bus_intf.scala 259:46]
  wire [31:0] store_data_lo_r = store_data_ext_r[31:0]; // @[el2_lsu_bus_intf.scala 260:46]
  wire  _T_53 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 261:51]
  wire  _T_54 = _T_53 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 261:76]
  wire  _T_55 = _T_54 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 261:97]
  wire  ld_addr_rhit_lo_lo = _T_55 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 261:118]
  wire  _T_59 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 262:51]
  wire  _T_60 = _T_59 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 262:76]
  wire  _T_61 = _T_60 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 262:97]
  wire  ld_addr_rhit_lo_hi = _T_61 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 262:118]
  wire  _T_65 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 263:51]
  wire  _T_66 = _T_65 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 263:76]
  wire  _T_67 = _T_66 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 263:97]
  wire  ld_addr_rhit_hi_lo = _T_67 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 263:118]
  wire  _T_71 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_bus_intf.scala 264:51]
  wire  _T_72 = _T_71 & io_lsu_pkt_r_valid; // @[el2_lsu_bus_intf.scala 264:76]
  wire  _T_73 = _T_72 & io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 264:97]
  wire  ld_addr_rhit_hi_hi = _T_73 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 264:118]
  wire  _T_76 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[0]; // @[el2_lsu_bus_intf.scala 265:70]
  wire  _T_78 = _T_76 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 265:92]
  wire  _T_80 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[1]; // @[el2_lsu_bus_intf.scala 265:70]
  wire  _T_82 = _T_80 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 265:92]
  wire  _T_84 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[2]; // @[el2_lsu_bus_intf.scala 265:70]
  wire  _T_86 = _T_84 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 265:92]
  wire  _T_88 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[3]; // @[el2_lsu_bus_intf.scala 265:70]
  wire  _T_90 = _T_88 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 265:92]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_90,_T_86,_T_82,_T_78}; // @[Cat.scala 29:58]
  wire  _T_95 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[0]; // @[el2_lsu_bus_intf.scala 266:70]
  wire  _T_97 = _T_95 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 266:92]
  wire  _T_99 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[1]; // @[el2_lsu_bus_intf.scala 266:70]
  wire  _T_101 = _T_99 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 266:92]
  wire  _T_103 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[2]; // @[el2_lsu_bus_intf.scala 266:70]
  wire  _T_105 = _T_103 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 266:92]
  wire  _T_107 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[3]; // @[el2_lsu_bus_intf.scala 266:70]
  wire  _T_109 = _T_107 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 266:92]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_109,_T_105,_T_101,_T_97}; // @[Cat.scala 29:58]
  wire  _T_114 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[0]; // @[el2_lsu_bus_intf.scala 267:70]
  wire  _T_116 = _T_114 & ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 267:92]
  wire  _T_118 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[1]; // @[el2_lsu_bus_intf.scala 267:70]
  wire  _T_120 = _T_118 & ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 267:92]
  wire  _T_122 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[2]; // @[el2_lsu_bus_intf.scala 267:70]
  wire  _T_124 = _T_122 & ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 267:92]
  wire  _T_126 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[3]; // @[el2_lsu_bus_intf.scala 267:70]
  wire  _T_128 = _T_126 & ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 267:92]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_128,_T_124,_T_120,_T_116}; // @[Cat.scala 29:58]
  wire  _T_133 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[0]; // @[el2_lsu_bus_intf.scala 268:70]
  wire  _T_135 = _T_133 & ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 268:92]
  wire  _T_137 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[1]; // @[el2_lsu_bus_intf.scala 268:70]
  wire  _T_139 = _T_137 & ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 268:92]
  wire  _T_141 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[2]; // @[el2_lsu_bus_intf.scala 268:70]
  wire  _T_143 = _T_141 & ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 268:92]
  wire  _T_145 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[3]; // @[el2_lsu_bus_intf.scala 268:70]
  wire  _T_147 = _T_145 & ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 268:92]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_147,_T_143,_T_139,_T_135}; // @[Cat.scala 29:58]
  wire  _T_153 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[el2_lsu_bus_intf.scala 269:73]
  wire [3:0] ld_byte_hit_buf_lo = bus_buffer_io_ld_byte_hit_buf_lo; // @[el2_lsu_bus_intf.scala 198:38]
  wire  _T_155 = _T_153 | ld_byte_hit_buf_lo[0]; // @[el2_lsu_bus_intf.scala 269:97]
  wire  _T_158 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[el2_lsu_bus_intf.scala 269:73]
  wire  _T_160 = _T_158 | ld_byte_hit_buf_lo[1]; // @[el2_lsu_bus_intf.scala 269:97]
  wire  _T_163 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[el2_lsu_bus_intf.scala 269:73]
  wire  _T_165 = _T_163 | ld_byte_hit_buf_lo[2]; // @[el2_lsu_bus_intf.scala 269:97]
  wire  _T_168 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[el2_lsu_bus_intf.scala 269:73]
  wire  _T_170 = _T_168 | ld_byte_hit_buf_lo[3]; // @[el2_lsu_bus_intf.scala 269:97]
  wire [3:0] ld_byte_hit_lo = {_T_170,_T_165,_T_160,_T_155}; // @[Cat.scala 29:58]
  wire  _T_176 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[el2_lsu_bus_intf.scala 270:73]
  wire [3:0] ld_byte_hit_buf_hi = bus_buffer_io_ld_byte_hit_buf_hi; // @[el2_lsu_bus_intf.scala 199:38]
  wire  _T_178 = _T_176 | ld_byte_hit_buf_hi[0]; // @[el2_lsu_bus_intf.scala 270:97]
  wire  _T_181 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[el2_lsu_bus_intf.scala 270:73]
  wire  _T_183 = _T_181 | ld_byte_hit_buf_hi[1]; // @[el2_lsu_bus_intf.scala 270:97]
  wire  _T_186 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[el2_lsu_bus_intf.scala 270:73]
  wire  _T_188 = _T_186 | ld_byte_hit_buf_hi[2]; // @[el2_lsu_bus_intf.scala 270:97]
  wire  _T_191 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[el2_lsu_bus_intf.scala 270:73]
  wire  _T_193 = _T_191 | ld_byte_hit_buf_hi[3]; // @[el2_lsu_bus_intf.scala 270:97]
  wire [3:0] ld_byte_hit_hi = {_T_193,_T_188,_T_183,_T_178}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = {_T_168,_T_163,_T_158,_T_153}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = {_T_191,_T_186,_T_181,_T_176}; // @[Cat.scala 29:58]
  wire [7:0] _T_231 = ld_byte_rhit_lo_lo[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_232 = ld_byte_rhit_hi_lo[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_233 = _T_231 | _T_232; // @[Mux.scala 27:72]
  wire [7:0] _T_239 = ld_byte_rhit_lo_lo[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_240 = ld_byte_rhit_hi_lo[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_241 = _T_239 | _T_240; // @[Mux.scala 27:72]
  wire [7:0] _T_247 = ld_byte_rhit_lo_lo[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_248 = ld_byte_rhit_hi_lo[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_249 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire [7:0] _T_255 = ld_byte_rhit_lo_lo[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_256 = ld_byte_rhit_hi_lo[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_257 = _T_255 | _T_256; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_lo = {_T_257,_T_249,_T_241,_T_233}; // @[Cat.scala 29:58]
  wire [7:0] _T_266 = ld_byte_rhit_lo_hi[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_267 = ld_byte_rhit_hi_hi[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_268 = _T_266 | _T_267; // @[Mux.scala 27:72]
  wire [7:0] _T_274 = ld_byte_rhit_lo_hi[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_275 = ld_byte_rhit_hi_hi[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_276 = _T_274 | _T_275; // @[Mux.scala 27:72]
  wire [7:0] _T_282 = ld_byte_rhit_lo_hi[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_283 = ld_byte_rhit_hi_hi[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_284 = _T_282 | _T_283; // @[Mux.scala 27:72]
  wire [7:0] _T_290 = ld_byte_rhit_lo_hi[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_291 = ld_byte_rhit_hi_hi[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_292 = _T_290 | _T_291; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_hi = {_T_292,_T_284,_T_276,_T_268}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_lo = bus_buffer_io_ld_fwddata_buf_lo; // @[el2_lsu_bus_intf.scala 200:38]
  wire [7:0] _T_300 = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : ld_fwddata_buf_lo[7:0]; // @[el2_lsu_bus_intf.scala 275:54]
  wire [7:0] _T_304 = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : ld_fwddata_buf_lo[15:8]; // @[el2_lsu_bus_intf.scala 275:54]
  wire [7:0] _T_308 = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : ld_fwddata_buf_lo[23:16]; // @[el2_lsu_bus_intf.scala 275:54]
  wire [7:0] _T_312 = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : ld_fwddata_buf_lo[31:24]; // @[el2_lsu_bus_intf.scala 275:54]
  wire [31:0] _T_315 = {_T_312,_T_308,_T_304,_T_300}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_hi = bus_buffer_io_ld_fwddata_buf_hi; // @[el2_lsu_bus_intf.scala 201:38]
  wire [7:0] _T_319 = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : ld_fwddata_buf_hi[7:0]; // @[el2_lsu_bus_intf.scala 276:54]
  wire [7:0] _T_323 = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : ld_fwddata_buf_hi[15:8]; // @[el2_lsu_bus_intf.scala 276:54]
  wire [7:0] _T_327 = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : ld_fwddata_buf_hi[23:16]; // @[el2_lsu_bus_intf.scala 276:54]
  wire [7:0] _T_331 = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : ld_fwddata_buf_hi[31:24]; // @[el2_lsu_bus_intf.scala 276:54]
  wire [31:0] _T_334 = {_T_331,_T_327,_T_323,_T_319}; // @[Cat.scala 29:58]
  wire  _T_337 = ~ldst_byteen_lo_m[0]; // @[el2_lsu_bus_intf.scala 277:72]
  wire  _T_338 = ld_byte_hit_lo[0] | _T_337; // @[el2_lsu_bus_intf.scala 277:70]
  wire  _T_341 = ~ldst_byteen_lo_m[1]; // @[el2_lsu_bus_intf.scala 277:72]
  wire  _T_342 = ld_byte_hit_lo[1] | _T_341; // @[el2_lsu_bus_intf.scala 277:70]
  wire  _T_345 = ~ldst_byteen_lo_m[2]; // @[el2_lsu_bus_intf.scala 277:72]
  wire  _T_346 = ld_byte_hit_lo[2] | _T_345; // @[el2_lsu_bus_intf.scala 277:70]
  wire  _T_349 = ~ldst_byteen_lo_m[3]; // @[el2_lsu_bus_intf.scala 277:72]
  wire  _T_350 = ld_byte_hit_lo[3] | _T_349; // @[el2_lsu_bus_intf.scala 277:70]
  wire  _T_351 = _T_338 & _T_342; // @[el2_lsu_bus_intf.scala 277:111]
  wire  _T_352 = _T_351 & _T_346; // @[el2_lsu_bus_intf.scala 277:111]
  wire  ld_full_hit_lo_m = _T_352 & _T_350; // @[el2_lsu_bus_intf.scala 277:111]
  wire  _T_356 = ~ldst_byteen_hi_m[0]; // @[el2_lsu_bus_intf.scala 278:72]
  wire  _T_357 = ld_byte_hit_hi[0] | _T_356; // @[el2_lsu_bus_intf.scala 278:70]
  wire  _T_360 = ~ldst_byteen_hi_m[1]; // @[el2_lsu_bus_intf.scala 278:72]
  wire  _T_361 = ld_byte_hit_hi[1] | _T_360; // @[el2_lsu_bus_intf.scala 278:70]
  wire  _T_364 = ~ldst_byteen_hi_m[2]; // @[el2_lsu_bus_intf.scala 278:72]
  wire  _T_365 = ld_byte_hit_hi[2] | _T_364; // @[el2_lsu_bus_intf.scala 278:70]
  wire  _T_368 = ~ldst_byteen_hi_m[3]; // @[el2_lsu_bus_intf.scala 278:72]
  wire  _T_369 = ld_byte_hit_hi[3] | _T_368; // @[el2_lsu_bus_intf.scala 278:70]
  wire  _T_370 = _T_357 & _T_361; // @[el2_lsu_bus_intf.scala 278:111]
  wire  _T_371 = _T_370 & _T_365; // @[el2_lsu_bus_intf.scala 278:111]
  wire  ld_full_hit_hi_m = _T_371 & _T_369; // @[el2_lsu_bus_intf.scala 278:111]
  wire  _T_373 = ld_full_hit_lo_m & ld_full_hit_hi_m; // @[el2_lsu_bus_intf.scala 279:47]
  wire  _T_374 = _T_373 & io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 279:66]
  wire  _T_375 = _T_374 & io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 279:84]
  wire  _T_376 = ~io_is_sideeffects_m; // @[el2_lsu_bus_intf.scala 279:106]
  wire [63:0] ld_fwddata_hi = {{32'd0}, _T_334}; // @[el2_lsu_bus_intf.scala 276:27]
  wire [63:0] ld_fwddata_lo = {{32'd0}, _T_315}; // @[el2_lsu_bus_intf.scala 275:27]
  wire [63:0] _T_380 = {ld_fwddata_hi[31:0],ld_fwddata_lo[31:0]}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_3 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_bus_intf.scala 280:83]
  wire [5:0] _T_382 = 4'h8 * _GEN_3; // @[el2_lsu_bus_intf.scala 280:83]
  wire [63:0] ld_fwddata_m = _T_380 >> _T_382; // @[el2_lsu_bus_intf.scala 280:76]
  reg  lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 284:32]
  reg  ldst_dual_m; // @[el2_lsu_bus_intf.scala 287:27]
  reg  is_sideeffects_r; // @[el2_lsu_bus_intf.scala 291:33]
  el2_lsu_bus_buffer bus_buffer ( // @[el2_lsu_bus_intf.scala 148:39]
    .clock(bus_buffer_clock),
    .reset(bus_buffer_reset),
    .io_scan_mode(bus_buffer_io_scan_mode),
    .io_dec_tlu_external_ldfwd_disable(bus_buffer_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_wb_coalescing_disable(bus_buffer_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_sideeffect_posted_disable(bus_buffer_io_dec_tlu_sideeffect_posted_disable),
    .io_dec_tlu_force_halt(bus_buffer_io_dec_tlu_force_halt),
    .io_lsu_c2_r_clk(bus_buffer_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_buffer_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_buffer_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_buffer_io_lsu_free_c2_clk),
    .io_lsu_busm_clk(bus_buffer_io_lsu_busm_clk),
    .io_dec_lsu_valid_raw_d(bus_buffer_io_dec_lsu_valid_raw_d),
    .io_lsu_pkt_m_load(bus_buffer_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_valid(bus_buffer_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(bus_buffer_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(bus_buffer_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(bus_buffer_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_load(bus_buffer_io_lsu_pkt_r_load),
    .io_lsu_pkt_r_store(bus_buffer_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_unsign(bus_buffer_io_lsu_pkt_r_unsign),
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
    .io_lsu_axi_awready(bus_buffer_io_lsu_axi_awready),
    .io_lsu_axi_wready(bus_buffer_io_lsu_axi_wready),
    .io_lsu_axi_bvalid(bus_buffer_io_lsu_axi_bvalid),
    .io_lsu_axi_bresp(bus_buffer_io_lsu_axi_bresp),
    .io_lsu_axi_bid(bus_buffer_io_lsu_axi_bid),
    .io_lsu_axi_arready(bus_buffer_io_lsu_axi_arready),
    .io_lsu_axi_rvalid(bus_buffer_io_lsu_axi_rvalid),
    .io_lsu_axi_rid(bus_buffer_io_lsu_axi_rid),
    .io_lsu_axi_rdata(bus_buffer_io_lsu_axi_rdata),
    .io_lsu_bus_clk_en(bus_buffer_io_lsu_bus_clk_en),
    .io_lsu_bus_clk_en_q(bus_buffer_io_lsu_bus_clk_en_q),
    .io_lsu_busreq_r(bus_buffer_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(bus_buffer_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_full_any(bus_buffer_io_lsu_bus_buffer_full_any),
    .io_lsu_bus_buffer_empty_any(bus_buffer_io_lsu_bus_buffer_empty_any),
    .io_ld_byte_hit_buf_lo(bus_buffer_io_ld_byte_hit_buf_lo),
    .io_ld_byte_hit_buf_hi(bus_buffer_io_ld_byte_hit_buf_hi),
    .io_ld_fwddata_buf_lo(bus_buffer_io_ld_fwddata_buf_lo),
    .io_ld_fwddata_buf_hi(bus_buffer_io_ld_fwddata_buf_hi),
    .io_lsu_imprecise_error_load_any(bus_buffer_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_store_any(bus_buffer_io_lsu_imprecise_error_store_any),
    .io_lsu_imprecise_error_addr_any(bus_buffer_io_lsu_imprecise_error_addr_any),
    .io_lsu_nonblock_load_valid_m(bus_buffer_io_lsu_nonblock_load_valid_m),
    .io_lsu_nonblock_load_tag_m(bus_buffer_io_lsu_nonblock_load_tag_m),
    .io_lsu_nonblock_load_inv_r(bus_buffer_io_lsu_nonblock_load_inv_r),
    .io_lsu_nonblock_load_inv_tag_r(bus_buffer_io_lsu_nonblock_load_inv_tag_r),
    .io_lsu_nonblock_load_data_valid(bus_buffer_io_lsu_nonblock_load_data_valid),
    .io_lsu_nonblock_load_data_error(bus_buffer_io_lsu_nonblock_load_data_error),
    .io_lsu_nonblock_load_data_tag(bus_buffer_io_lsu_nonblock_load_data_tag),
    .io_lsu_nonblock_load_data(bus_buffer_io_lsu_nonblock_load_data),
    .io_lsu_pmu_bus_trxn(bus_buffer_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(bus_buffer_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_error(bus_buffer_io_lsu_pmu_bus_error),
    .io_lsu_pmu_bus_busy(bus_buffer_io_lsu_pmu_bus_busy),
    .io_lsu_axi_awvalid(bus_buffer_io_lsu_axi_awvalid),
    .io_lsu_axi_awid(bus_buffer_io_lsu_axi_awid),
    .io_lsu_axi_awaddr(bus_buffer_io_lsu_axi_awaddr),
    .io_lsu_axi_awregion(bus_buffer_io_lsu_axi_awregion),
    .io_lsu_axi_awsize(bus_buffer_io_lsu_axi_awsize),
    .io_lsu_axi_awcache(bus_buffer_io_lsu_axi_awcache),
    .io_lsu_axi_wvalid(bus_buffer_io_lsu_axi_wvalid),
    .io_lsu_axi_wdata(bus_buffer_io_lsu_axi_wdata),
    .io_lsu_axi_wstrb(bus_buffer_io_lsu_axi_wstrb),
    .io_lsu_axi_bready(bus_buffer_io_lsu_axi_bready),
    .io_lsu_axi_arvalid(bus_buffer_io_lsu_axi_arvalid),
    .io_lsu_axi_arid(bus_buffer_io_lsu_axi_arid),
    .io_lsu_axi_araddr(bus_buffer_io_lsu_axi_araddr),
    .io_lsu_axi_arregion(bus_buffer_io_lsu_axi_arregion),
    .io_lsu_axi_arsize(bus_buffer_io_lsu_axi_arsize),
    .io_lsu_axi_arcache(bus_buffer_io_lsu_axi_arcache),
    .io_lsu_axi_rready(bus_buffer_io_lsu_axi_rready)
  );
  assign io_lsu_busreq_r = bus_buffer_io_lsu_busreq_r; // @[el2_lsu_bus_intf.scala 193:38]
  assign io_lsu_bus_buffer_pend_any = bus_buffer_io_lsu_bus_buffer_pend_any; // @[el2_lsu_bus_intf.scala 194:38]
  assign io_lsu_bus_buffer_full_any = bus_buffer_io_lsu_bus_buffer_full_any; // @[el2_lsu_bus_intf.scala 195:38]
  assign io_lsu_bus_buffer_empty_any = bus_buffer_io_lsu_bus_buffer_empty_any; // @[el2_lsu_bus_intf.scala 196:38]
  assign io_bus_read_data_m = ld_fwddata_m[31:0]; // @[el2_lsu_bus_intf.scala 281:27]
  assign io_lsu_imprecise_error_load_any = bus_buffer_io_lsu_imprecise_error_load_any; // @[el2_lsu_bus_intf.scala 202:38]
  assign io_lsu_imprecise_error_store_any = bus_buffer_io_lsu_imprecise_error_store_any; // @[el2_lsu_bus_intf.scala 203:38]
  assign io_lsu_imprecise_error_addr_any = bus_buffer_io_lsu_imprecise_error_addr_any; // @[el2_lsu_bus_intf.scala 204:38]
  assign io_lsu_nonblock_load_valid_m = bus_buffer_io_lsu_nonblock_load_valid_m; // @[el2_lsu_bus_intf.scala 205:38]
  assign io_lsu_nonblock_load_tag_m = bus_buffer_io_lsu_nonblock_load_tag_m; // @[el2_lsu_bus_intf.scala 206:38]
  assign io_lsu_nonblock_load_inv_r = bus_buffer_io_lsu_nonblock_load_inv_r; // @[el2_lsu_bus_intf.scala 207:38]
  assign io_lsu_nonblock_load_inv_tag_r = bus_buffer_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu_bus_intf.scala 208:38]
  assign io_lsu_nonblock_load_data_valid = bus_buffer_io_lsu_nonblock_load_data_valid; // @[el2_lsu_bus_intf.scala 209:38]
  assign io_lsu_nonblock_load_data_error = bus_buffer_io_lsu_nonblock_load_data_error; // @[el2_lsu_bus_intf.scala 210:38]
  assign io_lsu_nonblock_load_data_tag = bus_buffer_io_lsu_nonblock_load_data_tag; // @[el2_lsu_bus_intf.scala 211:38]
  assign io_lsu_nonblock_load_data = bus_buffer_io_lsu_nonblock_load_data; // @[el2_lsu_bus_intf.scala 212:38]
  assign io_lsu_pmu_bus_trxn = bus_buffer_io_lsu_pmu_bus_trxn; // @[el2_lsu_bus_intf.scala 213:38]
  assign io_lsu_pmu_bus_misaligned = bus_buffer_io_lsu_pmu_bus_misaligned; // @[el2_lsu_bus_intf.scala 214:38]
  assign io_lsu_pmu_bus_error = bus_buffer_io_lsu_pmu_bus_error; // @[el2_lsu_bus_intf.scala 215:38]
  assign io_lsu_pmu_bus_busy = bus_buffer_io_lsu_pmu_bus_busy; // @[el2_lsu_bus_intf.scala 216:38]
  assign io_lsu_axi_awvalid = bus_buffer_io_lsu_axi_awvalid; // @[el2_lsu_bus_intf.scala 217:38]
  assign io_lsu_axi_awid = bus_buffer_io_lsu_axi_awid; // @[el2_lsu_bus_intf.scala 218:38]
  assign io_lsu_axi_awaddr = bus_buffer_io_lsu_axi_awaddr; // @[el2_lsu_bus_intf.scala 219:38]
  assign io_lsu_axi_awregion = bus_buffer_io_lsu_axi_awregion; // @[el2_lsu_bus_intf.scala 220:38]
  assign io_lsu_axi_awsize = bus_buffer_io_lsu_axi_awsize; // @[el2_lsu_bus_intf.scala 222:38]
  assign io_lsu_axi_awcache = bus_buffer_io_lsu_axi_awcache; // @[el2_lsu_bus_intf.scala 225:38]
  assign io_lsu_axi_wvalid = bus_buffer_io_lsu_axi_wvalid; // @[el2_lsu_bus_intf.scala 228:38]
  assign io_lsu_axi_wdata = bus_buffer_io_lsu_axi_wdata; // @[el2_lsu_bus_intf.scala 229:38]
  assign io_lsu_axi_wstrb = bus_buffer_io_lsu_axi_wstrb; // @[el2_lsu_bus_intf.scala 230:38]
  assign io_lsu_axi_arvalid = bus_buffer_io_lsu_axi_arvalid; // @[el2_lsu_bus_intf.scala 233:38]
  assign io_lsu_axi_arid = bus_buffer_io_lsu_axi_arid; // @[el2_lsu_bus_intf.scala 234:38]
  assign io_lsu_axi_araddr = bus_buffer_io_lsu_axi_araddr; // @[el2_lsu_bus_intf.scala 235:38]
  assign io_lsu_axi_arregion = bus_buffer_io_lsu_axi_arregion; // @[el2_lsu_bus_intf.scala 236:38]
  assign io_lsu_axi_arsize = bus_buffer_io_lsu_axi_arsize; // @[el2_lsu_bus_intf.scala 238:38]
  assign io_lsu_axi_arcache = bus_buffer_io_lsu_axi_arcache; // @[el2_lsu_bus_intf.scala 241:38]
  assign bus_buffer_clock = clock;
  assign bus_buffer_reset = reset;
  assign bus_buffer_io_scan_mode = io_scan_mode; // @[el2_lsu_bus_intf.scala 149:51]
  assign bus_buffer_io_dec_tlu_external_ldfwd_disable = io_dec_tlu_external_ldfwd_disable; // @[el2_lsu_bus_intf.scala 150:51]
  assign bus_buffer_io_dec_tlu_wb_coalescing_disable = io_dec_tlu_wb_coalescing_disable; // @[el2_lsu_bus_intf.scala 151:51]
  assign bus_buffer_io_dec_tlu_sideeffect_posted_disable = io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu_bus_intf.scala 152:51]
  assign bus_buffer_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[el2_lsu_bus_intf.scala 153:51]
  assign bus_buffer_io_lsu_c2_r_clk = io_lsu_c2_r_clk; // @[el2_lsu_bus_intf.scala 154:51]
  assign bus_buffer_io_lsu_bus_ibuf_c1_clk = io_lsu_bus_ibuf_c1_clk; // @[el2_lsu_bus_intf.scala 155:51]
  assign bus_buffer_io_lsu_bus_buf_c1_clk = io_lsu_bus_buf_c1_clk; // @[el2_lsu_bus_intf.scala 157:51]
  assign bus_buffer_io_lsu_free_c2_clk = io_lsu_free_c2_clk; // @[el2_lsu_bus_intf.scala 158:51]
  assign bus_buffer_io_lsu_busm_clk = io_lsu_busm_clk; // @[el2_lsu_bus_intf.scala 159:51]
  assign bus_buffer_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu_bus_intf.scala 160:51]
  assign bus_buffer_io_lsu_pkt_m_load = io_lsu_pkt_m_load; // @[el2_lsu_bus_intf.scala 161:51]
  assign bus_buffer_io_lsu_pkt_m_valid = io_lsu_pkt_m_valid; // @[el2_lsu_bus_intf.scala 161:51]
  assign bus_buffer_io_lsu_pkt_r_by = io_lsu_pkt_r_by; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_pkt_r_half = io_lsu_pkt_r_half; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_pkt_r_word = io_lsu_pkt_r_word; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_pkt_r_load = io_lsu_pkt_r_load; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_pkt_r_store = io_lsu_pkt_r_store; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_pkt_r_unsign = io_lsu_pkt_r_unsign; // @[el2_lsu_bus_intf.scala 162:51]
  assign bus_buffer_io_lsu_addr_m = io_lsu_addr_m; // @[el2_lsu_bus_intf.scala 163:51]
  assign bus_buffer_io_end_addr_m = io_end_addr_m; // @[el2_lsu_bus_intf.scala 164:51]
  assign bus_buffer_io_lsu_addr_r = io_lsu_addr_r; // @[el2_lsu_bus_intf.scala 165:51]
  assign bus_buffer_io_end_addr_r = io_end_addr_r; // @[el2_lsu_bus_intf.scala 166:51]
  assign bus_buffer_io_store_data_r = io_store_data_r; // @[el2_lsu_bus_intf.scala 167:51]
  assign bus_buffer_io_no_word_merge_r = _T_22 & _T_24; // @[el2_lsu_bus_intf.scala 168:51]
  assign bus_buffer_io_no_dword_merge_r = _T_22 & _T_30; // @[el2_lsu_bus_intf.scala 169:51]
  assign bus_buffer_io_lsu_busreq_m = io_lsu_busreq_m; // @[el2_lsu_bus_intf.scala 170:51]
  assign bus_buffer_io_ld_full_hit_m = _T_375 & _T_376; // @[el2_lsu_bus_intf.scala 171:51]
  assign bus_buffer_io_flush_m_up = io_flush_m_up; // @[el2_lsu_bus_intf.scala 172:51]
  assign bus_buffer_io_flush_r = io_flush_r; // @[el2_lsu_bus_intf.scala 173:51]
  assign bus_buffer_io_lsu_commit_r = io_lsu_commit_r; // @[el2_lsu_bus_intf.scala 174:51]
  assign bus_buffer_io_is_sideeffects_r = is_sideeffects_r; // @[el2_lsu_bus_intf.scala 175:51]
  assign bus_buffer_io_ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_bus_intf.scala 176:51]
  assign bus_buffer_io_ldst_dual_m = ldst_dual_m; // @[el2_lsu_bus_intf.scala 177:51]
  assign bus_buffer_io_ldst_dual_r = ldst_dual_r; // @[el2_lsu_bus_intf.scala 178:51]
  assign bus_buffer_io_ldst_byteen_ext_m = _T_35[7:0]; // @[el2_lsu_bus_intf.scala 179:51]
  assign bus_buffer_io_lsu_axi_awready = io_lsu_axi_awready; // @[el2_lsu_bus_intf.scala 180:51]
  assign bus_buffer_io_lsu_axi_wready = io_lsu_axi_wready; // @[el2_lsu_bus_intf.scala 181:51]
  assign bus_buffer_io_lsu_axi_bvalid = io_lsu_axi_bvalid; // @[el2_lsu_bus_intf.scala 182:51]
  assign bus_buffer_io_lsu_axi_bresp = io_lsu_axi_bresp; // @[el2_lsu_bus_intf.scala 183:51]
  assign bus_buffer_io_lsu_axi_bid = io_lsu_axi_bid; // @[el2_lsu_bus_intf.scala 184:51]
  assign bus_buffer_io_lsu_axi_arready = io_lsu_axi_arready; // @[el2_lsu_bus_intf.scala 185:51]
  assign bus_buffer_io_lsu_axi_rvalid = io_lsu_axi_rvalid; // @[el2_lsu_bus_intf.scala 186:51]
  assign bus_buffer_io_lsu_axi_rid = io_lsu_axi_rid; // @[el2_lsu_bus_intf.scala 187:51]
  assign bus_buffer_io_lsu_axi_rdata = io_lsu_axi_rdata; // @[el2_lsu_bus_intf.scala 188:51]
  assign bus_buffer_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[el2_lsu_bus_intf.scala 190:51]
  assign bus_buffer_io_lsu_bus_clk_en_q = lsu_bus_clk_en_q; // @[el2_lsu_bus_intf.scala 191:51]
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
  _T_389 = _RAND_1[0:0];
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
    _T_389 = 1'h0;
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
      ldst_dual_r <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_389 <= 1'h0;
    end else begin
      _T_389 <= io_lsu_bus_clk_en;
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
      ldst_dual_m <= io_lsu_bus_clk_en;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      is_sideeffects_r <= 1'h0;
    end else begin
      is_sideeffects_r <= io_lsu_bus_clk_en;
    end
  end
endmodule
module el2_lsu(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_dec_tlu_flush_lower_r,
  input         io_dec_tlu_i0_kill_writeb_r,
  input         io_dec_tlu_force_halt,
  input         io_dec_tlu_external_ldfwd_disable,
  input         io_dec_tlu_wb_coalescing_disable,
  input         io_dec_tlu_sideeffect_posted_disable,
  input         io_dec_tlu_core_ecc_disable,
  input  [31:0] io_exu_lsu_rs1_d,
  input  [31:0] io_exu_lsu_rs2_d,
  input  [11:0] io_dec_lsu_offset_d,
  input         io_lsu_p_fast_int,
  input         io_lsu_p_by,
  input         io_lsu_p_half,
  input         io_lsu_p_word,
  input         io_lsu_p_dword,
  input         io_lsu_p_load,
  input         io_lsu_p_store,
  input         io_lsu_p_unsign,
  input         io_lsu_p_dma,
  input         io_lsu_p_store_data_bypass_d,
  input         io_lsu_p_load_ldst_bypass_d,
  input         io_lsu_p_store_data_bypass_m,
  input         io_lsu_p_valid,
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_,
  input         io_trigger_pkt_any_0_store,
  input         io_trigger_pkt_any_0_load,
  input         io_trigger_pkt_any_0_execute,
  input         io_trigger_pkt_any_0_m,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_,
  input         io_trigger_pkt_any_1_store,
  input         io_trigger_pkt_any_1_load,
  input         io_trigger_pkt_any_1_execute,
  input         io_trigger_pkt_any_1_m,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_,
  input         io_trigger_pkt_any_2_store,
  input         io_trigger_pkt_any_2_load,
  input         io_trigger_pkt_any_2_execute,
  input         io_trigger_pkt_any_2_m,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_,
  input         io_trigger_pkt_any_3_store,
  input         io_trigger_pkt_any_3_load,
  input         io_trigger_pkt_any_3_execute,
  input         io_trigger_pkt_any_3_m,
  input  [31:0] io_trigger_pkt_any_3_tdata2,
  input         io_dec_lsu_valid_raw_d,
  input  [31:0] io_dec_tlu_mrac_ff,
  output        io_lsu_load_stall_any,
  output        io_lsu_store_stall_any,
  output        io_lsu_fastint_stall_any,
  output        io_lsu_idle_any,
  output [31:0] io_lsu_fir_addr,
  output [1:0]  io_lsu_fir_error,
  output        io_lsu_single_ecc_error_incr,
  output        io_lsu_error_pkt_r_exc_valid,
  output        io_lsu_error_pkt_r_single_ecc_error,
  output        io_lsu_error_pkt_r_inst_type,
  output        io_lsu_error_pkt_r_exc_type,
  output        io_lsu_error_pkt_r_mscause,
  output        io_lsu_error_pkt_r_addr,
  output        io_lsu_imprecise_error_load_any,
  output        io_lsu_imprecise_error_store_any,
  output [31:0] io_lsu_imprecise_error_addr_any,
  output        io_lsu_nonblock_load_valid_m,
  output [1:0]  io_lsu_nonblock_load_tag_m,
  output        io_lsu_nonblock_load_inv_r,
  output [1:0]  io_lsu_nonblock_load_inv_tag_r,
  output        io_lsu_nonblock_load_data_valid,
  output        io_lsu_nonblock_load_data_error,
  output [1:0]  io_lsu_nonblock_load_data_tag,
  output [31:0] io_lsu_nonblock_load_data,
  output        io_lsu_pmu_load_external_m,
  output        io_lsu_pmu_store_external_m,
  output        io_lsu_pmu_misaligned_m,
  output        io_lsu_pmu_bus_trxn,
  output        io_lsu_pmu_bus_misaligned,
  output        io_lsu_pmu_bus_error,
  output        io_lsu_pmu_bus_busy,
  output [3:0]  io_lsu_trigger_match_m,
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
  output        io_picm_wren,
  output        io_picm_rden,
  output        io_picm_mken,
  output [31:0] io_picm_rdaddr,
  output [31:0] io_picm_wraddr,
  output [31:0] io_picm_wr_data,
  input  [31:0] io_picm_rd_data,
  output        io_lsu_axi_awvalid,
  output        io_lsu_axi_awlock,
  input         io_lsu_axi_awready,
  output [2:0]  io_lsu_axi_awid,
  output [31:0] io_lsu_axi_awaddr,
  output [3:0]  io_lsu_axi_awregion,
  output [7:0]  io_lsu_axi_awlen,
  output [2:0]  io_lsu_axi_awsize,
  output [1:0]  io_lsu_axi_awburst,
  output [3:0]  io_lsu_axi_awcache,
  output [2:0]  io_lsu_axi_awprot,
  output [3:0]  io_lsu_axi_awqos,
  output        io_lsu_axi_wvalid,
  input         io_lsu_axi_wready,
  output [63:0] io_lsu_axi_wdata,
  output [7:0]  io_lsu_axi_wstrb,
  output        io_lsu_axi_wlast,
  input         io_lsu_axi_bvalid,
  output        io_lsu_axi_bready,
  input  [1:0]  io_lsu_axi_bresp,
  input  [2:0]  io_lsu_axi_bid,
  output        io_lsu_axi_arvalid,
  output        io_lsu_axi_arlock,
  input         io_lsu_axi_arready,
  output [2:0]  io_lsu_axi_arid,
  output [31:0] io_lsu_axi_araddr,
  output [3:0]  io_lsu_axi_arregion,
  output [7:0]  io_lsu_axi_arlen,
  output [2:0]  io_lsu_axi_arsize,
  output [1:0]  io_lsu_axi_arburst,
  output [3:0]  io_lsu_axi_arcache,
  output [2:0]  io_lsu_axi_arprot,
  output [3:0]  io_lsu_axi_arqos,
  input         io_lsu_axi_rvalid,
  output        io_lsu_axi_rready,
  input  [63:0] io_lsu_axi_rdata,
  input         io_lsu_axi_rlast,
  input  [1:0]  io_lsu_axi_rresp,
  input  [2:0]  io_lsu_axi_rid,
  input         io_lsu_bus_clk_en,
  input         io_dma_dccm_req,
  input         io_dma_mem_write,
  output        io_dccm_dma_rvalid,
  output        io_dccm_dma_ecc_error,
  input  [2:0]  io_dma_mem_tag,
  input  [31:0] io_dma_mem_addr,
  input  [2:0]  io_dma_mem_sz,
  input  [63:0] io_dma_mem_wdata,
  output [2:0]  io_dccm_dma_rtag,
  output [63:0] io_dccm_dma_rdata,
  output        io_dccm_ready,
  input         io_scan_mode,
  input         io_free_clk
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_lsc_ctl_reset; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_c1_m_clk; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_c1_r_clk; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_c2_m_clk; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_c2_r_clk; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_store_c1_m_clk; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_flush_m_up; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_flush_r; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_exu_lsu_rs1_d; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_exu_lsu_rs2_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_fast_int; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_by; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_half; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_word; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_dword; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_load; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_store; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_unsign; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_dma; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_store_data_bypass_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_load_ldst_bypass_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_store_data_bypass_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_p_valid; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 154:30]
  wire [11:0] lsu_lsc_ctl_io_dec_lsu_offset_d; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_bus_read_data_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_d; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_d; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_r; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_dec_tlu_mrac_ff; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_exc_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_is_sideeffects_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_mscause; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_addr; // @[el2_lsu.scala 154:30]
  wire [30:0] lsu_lsc_ctl_io_lsu_fir_addr; // @[el2_lsu.scala 154:30]
  wire [1:0] lsu_lsc_ctl_io_lsu_fir_error; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_dma_dccm_req; // @[el2_lsu.scala 154:30]
  wire [31:0] lsu_lsc_ctl_io_dma_mem_addr; // @[el2_lsu.scala 154:30]
  wire [2:0] lsu_lsc_ctl_io_dma_mem_sz; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_dma_mem_write; // @[el2_lsu.scala 154:30]
  wire [63:0] lsu_lsc_ctl_io_dma_mem_wdata; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_fast_int; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_by; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_half; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_unsign; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_load_ldst_bypass_d; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_fast_int; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_dword; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_unsign; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_store_data_bypass_m; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_dword; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_unsign; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 154:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_clock; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_reset; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_c2_m_clk; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_c2_r_clk; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_free_c2_clk; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_store_c1_r_clk; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_raw_fwd_lo_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_raw_fwd_hi_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_commit_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_lsu_addr_d; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_lsu_addr_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_lsu_addr_r; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_end_addr_d; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_end_addr_m; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_end_addr_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_stbuf_reqvld_any; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_stbuf_addr_any; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_stbuf_data_any; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_stbuf_ecc_any; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 155:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 155:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_single_ecc_error_hi_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_single_ecc_error_lo_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_r_ff; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_r_ff; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_hi_r_ff; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_lo_r_ff; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_hi_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_lo_m; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_data_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dma_dccm_wen; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dma_pic_wen; // @[el2_lsu.scala 155:30]
  wire [2:0] dccm_ctl_io_dma_mem_tag_m; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_dma_mem_addr; // @[el2_lsu.scala 155:30]
  wire [63:0] dccm_ctl_io_dma_mem_wdata; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_lo; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_hi; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_hi; // @[el2_lsu.scala 155:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_lo; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_data_hi_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_data_lo_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_datafn_hi_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_datafn_lo_r; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_store_data_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_lsu_dccm_rden_m; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dccm_dma_rvalid; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dccm_dma_ecc_error; // @[el2_lsu.scala 155:30]
  wire [2:0] dccm_ctl_io_dccm_dma_rtag; // @[el2_lsu.scala 155:30]
  wire [63:0] dccm_ctl_io_dccm_dma_rdata; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dccm_wren; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_dccm_rden; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_lo; // @[el2_lsu.scala 155:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_lo; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_lo; // @[el2_lsu.scala 155:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_lo; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_hi; // @[el2_lsu.scala 155:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_hi; // @[el2_lsu.scala 155:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_hi; // @[el2_lsu.scala 155:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_hi; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_picm_wren; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_picm_rden; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_picm_mken; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_picm_rdaddr; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_picm_wraddr; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_picm_wr_data; // @[el2_lsu.scala 155:30]
  wire [31:0] dccm_ctl_io_picm_rd_data; // @[el2_lsu.scala 155:30]
  wire  dccm_ctl_io_scan_mode; // @[el2_lsu.scala 155:30]
  wire  stbuf_clock; // @[el2_lsu.scala 156:30]
  wire  stbuf_reset; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_c1_m_clk; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_c1_r_clk; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_free_c2_clk; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_m_store; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_m_dma; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_m_valid; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_by; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_half; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_word; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_dword; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_store; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_dma; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_pkt_r_valid; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_store_stbuf_reqvld_r; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_commit_r; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_store_data_hi_r; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_store_data_lo_r; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_store_datafn_hi_r; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_store_datafn_lo_r; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 156:30]
  wire [15:0] stbuf_io_lsu_addr_d; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_lsu_addr_m; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_lsu_addr_r; // @[el2_lsu.scala 156:30]
  wire [15:0] stbuf_io_end_addr_d; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_end_addr_m; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_end_addr_r; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_addr_in_dccm_m; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_addr_in_dccm_r; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_scan_mode; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 156:30]
  wire [15:0] stbuf_io_stbuf_addr_any; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_stbuf_data_any; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_stbuf_full_any; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_lsu_stbuf_empty_any; // @[el2_lsu.scala 156:30]
  wire  stbuf_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 156:30]
  wire [31:0] stbuf_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 156:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 156:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 156:30]
  wire  ecc_clock; // @[el2_lsu.scala 157:30]
  wire  ecc_reset; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_c2_r_clk; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_pkt_m_load; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_pkt_m_store; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_pkt_m_dma; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_pkt_m_valid; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_stbuf_data_any; // @[el2_lsu.scala 157:30]
  wire  ecc_io_dec_tlu_core_ecc_disable; // @[el2_lsu.scala 157:30]
  wire [15:0] ecc_io_lsu_addr_m; // @[el2_lsu.scala 157:30]
  wire [15:0] ecc_io_end_addr_m; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_dccm_rdata_hi_m; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_dccm_rdata_lo_m; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 157:30]
  wire  ecc_io_ld_single_ecc_error_r; // @[el2_lsu.scala 157:30]
  wire  ecc_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_dccm_rden_m; // @[el2_lsu.scala 157:30]
  wire  ecc_io_addr_in_dccm_m; // @[el2_lsu.scala 157:30]
  wire  ecc_io_dma_dccm_wen; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_dma_dccm_wdata_lo; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_dma_dccm_wdata_hi; // @[el2_lsu.scala 157:30]
  wire  ecc_io_scan_mode; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_hi_r; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_lo_r; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_hi_m; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_lo_m; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_hi_r_ff; // @[el2_lsu.scala 157:30]
  wire [31:0] ecc_io_sec_data_lo_r_ff; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_hi; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_lo; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_stbuf_ecc_any; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_sec_data_ecc_hi_r_ff; // @[el2_lsu.scala 157:30]
  wire [6:0] ecc_io_sec_data_ecc_lo_r_ff; // @[el2_lsu.scala 157:30]
  wire  ecc_io_single_ecc_error_hi_r; // @[el2_lsu.scala 157:30]
  wire  ecc_io_single_ecc_error_lo_r; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 157:30]
  wire  ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_0_select; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_0_match_; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_0_store; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_0_load; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_trigger_pkt_any_0_tdata2; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_1_select; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_1_match_; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_1_store; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_1_load; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_trigger_pkt_any_1_tdata2; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_2_select; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_2_match_; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_2_store; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_2_load; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_trigger_pkt_any_2_tdata2; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_3_select; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_3_match_; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_3_store; // @[el2_lsu.scala 158:30]
  wire  trigger_io_trigger_pkt_any_3_load; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_trigger_pkt_any_3_tdata2; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_half; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_word; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_load; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_store; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_dma; // @[el2_lsu.scala 158:30]
  wire  trigger_io_lsu_pkt_m_valid; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_lsu_addr_m; // @[el2_lsu.scala 158:30]
  wire [31:0] trigger_io_store_data_m; // @[el2_lsu.scala 158:30]
  wire [3:0] trigger_io_lsu_trigger_match_m; // @[el2_lsu.scala 158:30]
  wire  clkdomain_clock; // @[el2_lsu.scala 159:30]
  wire  clkdomain_reset; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_free_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_clk_override; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_dma_dccm_req; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_stbuf_reqvld_any; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_busreq_r; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_bus_buffer_pend_any; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_bus_buffer_empty_any; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_stbuf_empty_any; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_bus_clk_en; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_p_valid; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_pkt_d_store; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_pkt_d_valid; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_pkt_m_store; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_pkt_m_valid; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_pkt_r_valid; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_store_c1_m_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_bus_ibuf_c1_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_bus_buf_c1_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_busm_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_lsu_free_c2_clk; // @[el2_lsu.scala 159:30]
  wire  clkdomain_io_scan_mode; // @[el2_lsu.scala 159:30]
  wire  bus_intf_clock; // @[el2_lsu.scala 160:30]
  wire  bus_intf_reset; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_scan_mode; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_dec_tlu_external_ldfwd_disable; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_dec_tlu_wb_coalescing_disable; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_c1_m_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_c1_r_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_c2_r_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_ibuf_c1_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_buf_c1_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_free_c2_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_free_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_busm_clk; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_busreq_m; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_m_load; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_m_valid; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_by; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_half; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_word; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_load; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_store; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_unsign; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pkt_r_valid; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_addr_d; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_addr_m; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_addr_r; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_end_addr_d; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_end_addr_m; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_end_addr_r; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_store_data_r; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_dec_tlu_force_halt; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_commit_r; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_is_sideeffects_m; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_flush_m_up; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_flush_r; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_awready; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_wready; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_bvalid; // @[el2_lsu.scala 160:30]
  wire [1:0] bus_intf_io_lsu_axi_bresp; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_bid; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_arready; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_rvalid; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_rid; // @[el2_lsu.scala 160:30]
  wire [63:0] bus_intf_io_lsu_axi_rdata; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_clk_en; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_busreq_r; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_buffer_pend_any; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_buffer_full_any; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_bus_buffer_empty_any; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_bus_read_data_m; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_imprecise_error_load_any; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_imprecise_error_store_any; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_imprecise_error_addr_any; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_nonblock_load_valid_m; // @[el2_lsu.scala 160:30]
  wire [1:0] bus_intf_io_lsu_nonblock_load_tag_m; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_nonblock_load_inv_r; // @[el2_lsu.scala 160:30]
  wire [1:0] bus_intf_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_nonblock_load_data_valid; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_nonblock_load_data_error; // @[el2_lsu.scala 160:30]
  wire [1:0] bus_intf_io_lsu_nonblock_load_data_tag; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_nonblock_load_data; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pmu_bus_trxn; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pmu_bus_misaligned; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pmu_bus_error; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_pmu_bus_busy; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_awvalid; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_awid; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_axi_awaddr; // @[el2_lsu.scala 160:30]
  wire [3:0] bus_intf_io_lsu_axi_awregion; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_awsize; // @[el2_lsu.scala 160:30]
  wire [3:0] bus_intf_io_lsu_axi_awcache; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_wvalid; // @[el2_lsu.scala 160:30]
  wire [63:0] bus_intf_io_lsu_axi_wdata; // @[el2_lsu.scala 160:30]
  wire [7:0] bus_intf_io_lsu_axi_wstrb; // @[el2_lsu.scala 160:30]
  wire  bus_intf_io_lsu_axi_arvalid; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_arid; // @[el2_lsu.scala 160:30]
  wire [31:0] bus_intf_io_lsu_axi_araddr; // @[el2_lsu.scala 160:30]
  wire [3:0] bus_intf_io_lsu_axi_arregion; // @[el2_lsu.scala 160:30]
  wire [2:0] bus_intf_io_lsu_axi_arsize; // @[el2_lsu.scala 160:30]
  wire [3:0] bus_intf_io_lsu_axi_arcache; // @[el2_lsu.scala 160:30]
  wire  _T = stbuf_io_lsu_stbuf_full_any | bus_intf_io_lsu_bus_buffer_full_any; // @[el2_lsu.scala 166:57]
  wire  _T_3 = ~lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 173:58]
  wire  _T_4 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_3; // @[el2_lsu.scala 173:56]
  wire  _T_5 = lsu_lsc_ctl_io_addr_in_dccm_m | lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 173:121]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu.scala 173:88]
  wire  ldst_nodma_mtor = _T_6 & lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 173:153]
  wire  _T_7 = io_dec_lsu_valid_raw_d | ldst_nodma_mtor; // @[el2_lsu.scala 174:45]
  wire  _T_8 = _T_7 | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 174:63]
  wire  _T_10 = io_dma_dccm_req & io_dma_mem_write; // @[el2_lsu.scala 175:38]
  wire [5:0] _T_13 = {io_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_dccm_wdata = io_dma_mem_wdata >> _T_13; // @[el2_lsu.scala 177:38]
  wire  _T_19 = ~lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 188:125]
  wire  _T_20 = lsu_lsc_ctl_io_lsu_pkt_r_valid & _T_19; // @[el2_lsu.scala 188:123]
  wire  _T_21 = _T_4 | _T_20; // @[el2_lsu.scala 188:89]
  wire  _T_22 = ~_T_21; // @[el2_lsu.scala 188:22]
  wire  _T_25 = lsu_lsc_ctl_io_lsu_pkt_r_valid & lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 190:61]
  wire  _T_26 = _T_25 & lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 190:94]
  wire  _T_27 = ~io_dec_tlu_i0_kill_writeb_r; // @[el2_lsu.scala 190:128]
  wire  _T_28 = _T_26 & _T_27; // @[el2_lsu.scala 190:126]
  wire  _T_30 = lsu_lsc_ctl_io_lsu_pkt_m_load | lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 192:85]
  wire  _T_34 = _T_30 & lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 194:121]
  wire  _T_35 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_34; // @[el2_lsu.scala 194:53]
  wire  _T_36 = ~io_dec_tlu_flush_lower_r; // @[el2_lsu.scala 194:157]
  wire  _T_37 = _T_35 & _T_36; // @[el2_lsu.scala 194:155]
  wire  _T_38 = ~lsu_lsc_ctl_io_lsu_exc_m; // @[el2_lsu.scala 194:171]
  wire  _T_39 = _T_37 & _T_38; // @[el2_lsu.scala 194:169]
  wire  _T_40 = ~lsu_lsc_ctl_io_lsu_pkt_m_fast_int; // @[el2_lsu.scala 194:199]
  wire  _T_42 = lsu_lsc_ctl_io_lsu_pkt_m_half & lsu_lsc_ctl_io_lsu_addr_m[0]; // @[el2_lsu.scala 196:95]
  wire  _T_44 = |lsu_lsc_ctl_io_lsu_addr_m[1:0]; // @[el2_lsu.scala 196:193]
  wire  _T_45 = lsu_lsc_ctl_io_lsu_pkt_m_word & _T_44; // @[el2_lsu.scala 196:160]
  wire  _T_46 = _T_42 | _T_45; // @[el2_lsu.scala 196:127]
  wire  _T_48 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 197:65]
  wire  _T_50 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 198:65]
  reg [2:0] _T_52; // @[el2_lsu.scala 490:67]
  reg  lsu_raw_fwd_hi_r; // @[el2_lsu.scala 491:67]
  reg  lsu_raw_fwd_lo_r; // @[el2_lsu.scala 492:67]
  wire [31:0] dma_mem_tag_m = {{29'd0}, _T_52}; // @[el2_lsu.scala 490:57]
  el2_lsu_lsc_ctl lsu_lsc_ctl ( // @[el2_lsu.scala 154:30]
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
    .io_exu_lsu_rs1_d(lsu_lsc_ctl_io_exu_lsu_rs1_d),
    .io_exu_lsu_rs2_d(lsu_lsc_ctl_io_exu_lsu_rs2_d),
    .io_lsu_p_fast_int(lsu_lsc_ctl_io_lsu_p_fast_int),
    .io_lsu_p_by(lsu_lsc_ctl_io_lsu_p_by),
    .io_lsu_p_half(lsu_lsc_ctl_io_lsu_p_half),
    .io_lsu_p_word(lsu_lsc_ctl_io_lsu_p_word),
    .io_lsu_p_dword(lsu_lsc_ctl_io_lsu_p_dword),
    .io_lsu_p_load(lsu_lsc_ctl_io_lsu_p_load),
    .io_lsu_p_store(lsu_lsc_ctl_io_lsu_p_store),
    .io_lsu_p_unsign(lsu_lsc_ctl_io_lsu_p_unsign),
    .io_lsu_p_dma(lsu_lsc_ctl_io_lsu_p_dma),
    .io_lsu_p_store_data_bypass_d(lsu_lsc_ctl_io_lsu_p_store_data_bypass_d),
    .io_lsu_p_load_ldst_bypass_d(lsu_lsc_ctl_io_lsu_p_load_ldst_bypass_d),
    .io_lsu_p_store_data_bypass_m(lsu_lsc_ctl_io_lsu_p_store_data_bypass_m),
    .io_lsu_p_valid(lsu_lsc_ctl_io_lsu_p_valid),
    .io_dec_lsu_valid_raw_d(lsu_lsc_ctl_io_dec_lsu_valid_raw_d),
    .io_dec_lsu_offset_d(lsu_lsc_ctl_io_dec_lsu_offset_d),
    .io_picm_mask_data_m(lsu_lsc_ctl_io_picm_mask_data_m),
    .io_bus_read_data_m(lsu_lsc_ctl_io_bus_read_data_m),
    .io_lsu_result_m(lsu_lsc_ctl_io_lsu_result_m),
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
    .io_lsu_error_pkt_r_exc_valid(lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid),
    .io_lsu_error_pkt_r_single_ecc_error(lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error),
    .io_lsu_error_pkt_r_inst_type(lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type),
    .io_lsu_error_pkt_r_exc_type(lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type),
    .io_lsu_error_pkt_r_mscause(lsu_lsc_ctl_io_lsu_error_pkt_r_mscause),
    .io_lsu_error_pkt_r_addr(lsu_lsc_ctl_io_lsu_error_pkt_r_addr),
    .io_lsu_fir_addr(lsu_lsc_ctl_io_lsu_fir_addr),
    .io_lsu_fir_error(lsu_lsc_ctl_io_lsu_fir_error),
    .io_addr_in_dccm_d(lsu_lsc_ctl_io_addr_in_dccm_d),
    .io_addr_in_dccm_m(lsu_lsc_ctl_io_addr_in_dccm_m),
    .io_addr_in_dccm_r(lsu_lsc_ctl_io_addr_in_dccm_r),
    .io_addr_in_pic_d(lsu_lsc_ctl_io_addr_in_pic_d),
    .io_addr_in_pic_m(lsu_lsc_ctl_io_addr_in_pic_m),
    .io_addr_in_pic_r(lsu_lsc_ctl_io_addr_in_pic_r),
    .io_addr_external_m(lsu_lsc_ctl_io_addr_external_m),
    .io_dma_dccm_req(lsu_lsc_ctl_io_dma_dccm_req),
    .io_dma_mem_addr(lsu_lsc_ctl_io_dma_mem_addr),
    .io_dma_mem_sz(lsu_lsc_ctl_io_dma_mem_sz),
    .io_dma_mem_write(lsu_lsc_ctl_io_dma_mem_write),
    .io_dma_mem_wdata(lsu_lsc_ctl_io_dma_mem_wdata),
    .io_lsu_pkt_d_fast_int(lsu_lsc_ctl_io_lsu_pkt_d_fast_int),
    .io_lsu_pkt_d_by(lsu_lsc_ctl_io_lsu_pkt_d_by),
    .io_lsu_pkt_d_half(lsu_lsc_ctl_io_lsu_pkt_d_half),
    .io_lsu_pkt_d_word(lsu_lsc_ctl_io_lsu_pkt_d_word),
    .io_lsu_pkt_d_dword(lsu_lsc_ctl_io_lsu_pkt_d_dword),
    .io_lsu_pkt_d_load(lsu_lsc_ctl_io_lsu_pkt_d_load),
    .io_lsu_pkt_d_store(lsu_lsc_ctl_io_lsu_pkt_d_store),
    .io_lsu_pkt_d_unsign(lsu_lsc_ctl_io_lsu_pkt_d_unsign),
    .io_lsu_pkt_d_dma(lsu_lsc_ctl_io_lsu_pkt_d_dma),
    .io_lsu_pkt_d_store_data_bypass_d(lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_d),
    .io_lsu_pkt_d_load_ldst_bypass_d(lsu_lsc_ctl_io_lsu_pkt_d_load_ldst_bypass_d),
    .io_lsu_pkt_d_store_data_bypass_m(lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_m),
    .io_lsu_pkt_d_valid(lsu_lsc_ctl_io_lsu_pkt_d_valid),
    .io_lsu_pkt_m_fast_int(lsu_lsc_ctl_io_lsu_pkt_m_fast_int),
    .io_lsu_pkt_m_by(lsu_lsc_ctl_io_lsu_pkt_m_by),
    .io_lsu_pkt_m_half(lsu_lsc_ctl_io_lsu_pkt_m_half),
    .io_lsu_pkt_m_word(lsu_lsc_ctl_io_lsu_pkt_m_word),
    .io_lsu_pkt_m_dword(lsu_lsc_ctl_io_lsu_pkt_m_dword),
    .io_lsu_pkt_m_load(lsu_lsc_ctl_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_store(lsu_lsc_ctl_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_unsign(lsu_lsc_ctl_io_lsu_pkt_m_unsign),
    .io_lsu_pkt_m_dma(lsu_lsc_ctl_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_store_data_bypass_m(lsu_lsc_ctl_io_lsu_pkt_m_store_data_bypass_m),
    .io_lsu_pkt_m_valid(lsu_lsc_ctl_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(lsu_lsc_ctl_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(lsu_lsc_ctl_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(lsu_lsc_ctl_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_dword(lsu_lsc_ctl_io_lsu_pkt_r_dword),
    .io_lsu_pkt_r_load(lsu_lsc_ctl_io_lsu_pkt_r_load),
    .io_lsu_pkt_r_store(lsu_lsc_ctl_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_unsign(lsu_lsc_ctl_io_lsu_pkt_r_unsign),
    .io_lsu_pkt_r_dma(lsu_lsc_ctl_io_lsu_pkt_r_dma),
    .io_lsu_pkt_r_valid(lsu_lsc_ctl_io_lsu_pkt_r_valid)
  );
  el2_lsu_dccm_ctl dccm_ctl ( // @[el2_lsu.scala 155:30]
    .clock(dccm_ctl_clock),
    .reset(dccm_ctl_reset),
    .io_lsu_c2_m_clk(dccm_ctl_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(dccm_ctl_io_lsu_c2_r_clk),
    .io_lsu_free_c2_clk(dccm_ctl_io_lsu_free_c2_clk),
    .io_lsu_store_c1_r_clk(dccm_ctl_io_lsu_store_c1_r_clk),
    .io_lsu_pkt_d_word(dccm_ctl_io_lsu_pkt_d_word),
    .io_lsu_pkt_d_dword(dccm_ctl_io_lsu_pkt_d_dword),
    .io_lsu_pkt_d_load(dccm_ctl_io_lsu_pkt_d_load),
    .io_lsu_pkt_d_store(dccm_ctl_io_lsu_pkt_d_store),
    .io_lsu_pkt_d_dma(dccm_ctl_io_lsu_pkt_d_dma),
    .io_lsu_pkt_d_valid(dccm_ctl_io_lsu_pkt_d_valid),
    .io_lsu_pkt_m_by(dccm_ctl_io_lsu_pkt_m_by),
    .io_lsu_pkt_m_half(dccm_ctl_io_lsu_pkt_m_half),
    .io_lsu_pkt_m_word(dccm_ctl_io_lsu_pkt_m_word),
    .io_lsu_pkt_m_load(dccm_ctl_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_store(dccm_ctl_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_dma(dccm_ctl_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_valid(dccm_ctl_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(dccm_ctl_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(dccm_ctl_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(dccm_ctl_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_load(dccm_ctl_io_lsu_pkt_r_load),
    .io_lsu_pkt_r_store(dccm_ctl_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_dma(dccm_ctl_io_lsu_pkt_r_dma),
    .io_lsu_pkt_r_valid(dccm_ctl_io_lsu_pkt_r_valid),
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
    .io_dma_mem_addr(dccm_ctl_io_dma_mem_addr),
    .io_dma_mem_wdata(dccm_ctl_io_dma_mem_wdata),
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
    .io_dccm_dma_rvalid(dccm_ctl_io_dccm_dma_rvalid),
    .io_dccm_dma_ecc_error(dccm_ctl_io_dccm_dma_ecc_error),
    .io_dccm_dma_rtag(dccm_ctl_io_dccm_dma_rtag),
    .io_dccm_dma_rdata(dccm_ctl_io_dccm_dma_rdata),
    .io_dccm_wren(dccm_ctl_io_dccm_wren),
    .io_dccm_rden(dccm_ctl_io_dccm_rden),
    .io_dccm_wr_addr_lo(dccm_ctl_io_dccm_wr_addr_lo),
    .io_dccm_wr_data_lo(dccm_ctl_io_dccm_wr_data_lo),
    .io_dccm_rd_addr_lo(dccm_ctl_io_dccm_rd_addr_lo),
    .io_dccm_rd_data_lo(dccm_ctl_io_dccm_rd_data_lo),
    .io_dccm_wr_addr_hi(dccm_ctl_io_dccm_wr_addr_hi),
    .io_dccm_wr_data_hi(dccm_ctl_io_dccm_wr_data_hi),
    .io_dccm_rd_addr_hi(dccm_ctl_io_dccm_rd_addr_hi),
    .io_dccm_rd_data_hi(dccm_ctl_io_dccm_rd_data_hi),
    .io_picm_wren(dccm_ctl_io_picm_wren),
    .io_picm_rden(dccm_ctl_io_picm_rden),
    .io_picm_mken(dccm_ctl_io_picm_mken),
    .io_picm_rdaddr(dccm_ctl_io_picm_rdaddr),
    .io_picm_wraddr(dccm_ctl_io_picm_wraddr),
    .io_picm_wr_data(dccm_ctl_io_picm_wr_data),
    .io_picm_rd_data(dccm_ctl_io_picm_rd_data),
    .io_scan_mode(dccm_ctl_io_scan_mode)
  );
  el2_lsu_stbuf stbuf ( // @[el2_lsu.scala 156:30]
    .clock(stbuf_clock),
    .reset(stbuf_reset),
    .io_lsu_c1_m_clk(stbuf_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(stbuf_io_lsu_c1_r_clk),
    .io_lsu_stbuf_c1_clk(stbuf_io_lsu_stbuf_c1_clk),
    .io_lsu_free_c2_clk(stbuf_io_lsu_free_c2_clk),
    .io_lsu_pkt_m_store(stbuf_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_dma(stbuf_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_valid(stbuf_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(stbuf_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(stbuf_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(stbuf_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_dword(stbuf_io_lsu_pkt_r_dword),
    .io_lsu_pkt_r_store(stbuf_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_dma(stbuf_io_lsu_pkt_r_dma),
    .io_lsu_pkt_r_valid(stbuf_io_lsu_pkt_r_valid),
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
  el2_lsu_ecc ecc ( // @[el2_lsu.scala 157:30]
    .clock(ecc_clock),
    .reset(ecc_reset),
    .io_lsu_c2_r_clk(ecc_io_lsu_c2_r_clk),
    .io_lsu_pkt_m_load(ecc_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_store(ecc_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_dma(ecc_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_valid(ecc_io_lsu_pkt_m_valid),
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
  el2_lsu_trigger trigger ( // @[el2_lsu.scala 158:30]
    .io_trigger_pkt_any_0_select(trigger_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_(trigger_io_trigger_pkt_any_0_match_),
    .io_trigger_pkt_any_0_store(trigger_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(trigger_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_tdata2(trigger_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(trigger_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_(trigger_io_trigger_pkt_any_1_match_),
    .io_trigger_pkt_any_1_store(trigger_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(trigger_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_tdata2(trigger_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(trigger_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_(trigger_io_trigger_pkt_any_2_match_),
    .io_trigger_pkt_any_2_store(trigger_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(trigger_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_tdata2(trigger_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(trigger_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_(trigger_io_trigger_pkt_any_3_match_),
    .io_trigger_pkt_any_3_store(trigger_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(trigger_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_tdata2(trigger_io_trigger_pkt_any_3_tdata2),
    .io_lsu_pkt_m_half(trigger_io_lsu_pkt_m_half),
    .io_lsu_pkt_m_word(trigger_io_lsu_pkt_m_word),
    .io_lsu_pkt_m_load(trigger_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_store(trigger_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_dma(trigger_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_valid(trigger_io_lsu_pkt_m_valid),
    .io_lsu_addr_m(trigger_io_lsu_addr_m),
    .io_store_data_m(trigger_io_store_data_m),
    .io_lsu_trigger_match_m(trigger_io_lsu_trigger_match_m)
  );
  el2_lsu_clkdomain clkdomain ( // @[el2_lsu.scala 159:30]
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
    .io_lsu_pkt_d_store(clkdomain_io_lsu_pkt_d_store),
    .io_lsu_pkt_d_valid(clkdomain_io_lsu_pkt_d_valid),
    .io_lsu_pkt_m_store(clkdomain_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_valid(clkdomain_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_valid(clkdomain_io_lsu_pkt_r_valid),
    .io_lsu_c1_m_clk(clkdomain_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(clkdomain_io_lsu_c1_r_clk),
    .io_lsu_c2_m_clk(clkdomain_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(clkdomain_io_lsu_c2_r_clk),
    .io_lsu_store_c1_m_clk(clkdomain_io_lsu_store_c1_m_clk),
    .io_lsu_stbuf_c1_clk(clkdomain_io_lsu_stbuf_c1_clk),
    .io_lsu_bus_ibuf_c1_clk(clkdomain_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(clkdomain_io_lsu_bus_buf_c1_clk),
    .io_lsu_busm_clk(clkdomain_io_lsu_busm_clk),
    .io_lsu_free_c2_clk(clkdomain_io_lsu_free_c2_clk),
    .io_scan_mode(clkdomain_io_scan_mode)
  );
  el2_lsu_bus_intf bus_intf ( // @[el2_lsu.scala 160:30]
    .clock(bus_intf_clock),
    .reset(bus_intf_reset),
    .io_scan_mode(bus_intf_io_scan_mode),
    .io_dec_tlu_external_ldfwd_disable(bus_intf_io_dec_tlu_external_ldfwd_disable),
    .io_dec_tlu_wb_coalescing_disable(bus_intf_io_dec_tlu_wb_coalescing_disable),
    .io_dec_tlu_sideeffect_posted_disable(bus_intf_io_dec_tlu_sideeffect_posted_disable),
    .io_lsu_c1_m_clk(bus_intf_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(bus_intf_io_lsu_c1_r_clk),
    .io_lsu_c2_r_clk(bus_intf_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_intf_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_intf_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_intf_io_lsu_free_c2_clk),
    .io_free_clk(bus_intf_io_free_clk),
    .io_lsu_busm_clk(bus_intf_io_lsu_busm_clk),
    .io_dec_lsu_valid_raw_d(bus_intf_io_dec_lsu_valid_raw_d),
    .io_lsu_busreq_m(bus_intf_io_lsu_busreq_m),
    .io_lsu_pkt_m_load(bus_intf_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_valid(bus_intf_io_lsu_pkt_m_valid),
    .io_lsu_pkt_r_by(bus_intf_io_lsu_pkt_r_by),
    .io_lsu_pkt_r_half(bus_intf_io_lsu_pkt_r_half),
    .io_lsu_pkt_r_word(bus_intf_io_lsu_pkt_r_word),
    .io_lsu_pkt_r_load(bus_intf_io_lsu_pkt_r_load),
    .io_lsu_pkt_r_store(bus_intf_io_lsu_pkt_r_store),
    .io_lsu_pkt_r_unsign(bus_intf_io_lsu_pkt_r_unsign),
    .io_lsu_pkt_r_valid(bus_intf_io_lsu_pkt_r_valid),
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
    .io_lsu_axi_awready(bus_intf_io_lsu_axi_awready),
    .io_lsu_axi_wready(bus_intf_io_lsu_axi_wready),
    .io_lsu_axi_bvalid(bus_intf_io_lsu_axi_bvalid),
    .io_lsu_axi_bresp(bus_intf_io_lsu_axi_bresp),
    .io_lsu_axi_bid(bus_intf_io_lsu_axi_bid),
    .io_lsu_axi_arready(bus_intf_io_lsu_axi_arready),
    .io_lsu_axi_rvalid(bus_intf_io_lsu_axi_rvalid),
    .io_lsu_axi_rid(bus_intf_io_lsu_axi_rid),
    .io_lsu_axi_rdata(bus_intf_io_lsu_axi_rdata),
    .io_lsu_bus_clk_en(bus_intf_io_lsu_bus_clk_en),
    .io_lsu_busreq_r(bus_intf_io_lsu_busreq_r),
    .io_lsu_bus_buffer_pend_any(bus_intf_io_lsu_bus_buffer_pend_any),
    .io_lsu_bus_buffer_full_any(bus_intf_io_lsu_bus_buffer_full_any),
    .io_lsu_bus_buffer_empty_any(bus_intf_io_lsu_bus_buffer_empty_any),
    .io_bus_read_data_m(bus_intf_io_bus_read_data_m),
    .io_lsu_imprecise_error_load_any(bus_intf_io_lsu_imprecise_error_load_any),
    .io_lsu_imprecise_error_store_any(bus_intf_io_lsu_imprecise_error_store_any),
    .io_lsu_imprecise_error_addr_any(bus_intf_io_lsu_imprecise_error_addr_any),
    .io_lsu_nonblock_load_valid_m(bus_intf_io_lsu_nonblock_load_valid_m),
    .io_lsu_nonblock_load_tag_m(bus_intf_io_lsu_nonblock_load_tag_m),
    .io_lsu_nonblock_load_inv_r(bus_intf_io_lsu_nonblock_load_inv_r),
    .io_lsu_nonblock_load_inv_tag_r(bus_intf_io_lsu_nonblock_load_inv_tag_r),
    .io_lsu_nonblock_load_data_valid(bus_intf_io_lsu_nonblock_load_data_valid),
    .io_lsu_nonblock_load_data_error(bus_intf_io_lsu_nonblock_load_data_error),
    .io_lsu_nonblock_load_data_tag(bus_intf_io_lsu_nonblock_load_data_tag),
    .io_lsu_nonblock_load_data(bus_intf_io_lsu_nonblock_load_data),
    .io_lsu_pmu_bus_trxn(bus_intf_io_lsu_pmu_bus_trxn),
    .io_lsu_pmu_bus_misaligned(bus_intf_io_lsu_pmu_bus_misaligned),
    .io_lsu_pmu_bus_error(bus_intf_io_lsu_pmu_bus_error),
    .io_lsu_pmu_bus_busy(bus_intf_io_lsu_pmu_bus_busy),
    .io_lsu_axi_awvalid(bus_intf_io_lsu_axi_awvalid),
    .io_lsu_axi_awid(bus_intf_io_lsu_axi_awid),
    .io_lsu_axi_awaddr(bus_intf_io_lsu_axi_awaddr),
    .io_lsu_axi_awregion(bus_intf_io_lsu_axi_awregion),
    .io_lsu_axi_awsize(bus_intf_io_lsu_axi_awsize),
    .io_lsu_axi_awcache(bus_intf_io_lsu_axi_awcache),
    .io_lsu_axi_wvalid(bus_intf_io_lsu_axi_wvalid),
    .io_lsu_axi_wdata(bus_intf_io_lsu_axi_wdata),
    .io_lsu_axi_wstrb(bus_intf_io_lsu_axi_wstrb),
    .io_lsu_axi_arvalid(bus_intf_io_lsu_axi_arvalid),
    .io_lsu_axi_arid(bus_intf_io_lsu_axi_arid),
    .io_lsu_axi_araddr(bus_intf_io_lsu_axi_araddr),
    .io_lsu_axi_arregion(bus_intf_io_lsu_axi_arregion),
    .io_lsu_axi_arsize(bus_intf_io_lsu_axi_arsize),
    .io_lsu_axi_arcache(bus_intf_io_lsu_axi_arcache)
  );
  assign io_lsu_load_stall_any = bus_intf_io_lsu_bus_buffer_full_any | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 167:25]
  assign io_lsu_store_stall_any = _T | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 166:26]
  assign io_lsu_fastint_stall_any = dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 168:28]
  assign io_lsu_idle_any = _T_22 & bus_intf_io_lsu_bus_buffer_empty_any; // @[el2_lsu.scala 188:19]
  assign io_lsu_fir_addr = {{1'd0}, lsu_lsc_ctl_io_lsu_fir_addr}; // @[el2_lsu.scala 234:49]
  assign io_lsu_fir_error = lsu_lsc_ctl_io_lsu_fir_error; // @[el2_lsu.scala 235:49]
  assign io_lsu_single_ecc_error_incr = lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[el2_lsu.scala 232:49]
  assign io_lsu_error_pkt_r_exc_valid = lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid; // @[el2_lsu.scala 233:49]
  assign io_lsu_error_pkt_r_single_ecc_error = lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error; // @[el2_lsu.scala 233:49]
  assign io_lsu_error_pkt_r_inst_type = lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type; // @[el2_lsu.scala 233:49]
  assign io_lsu_error_pkt_r_exc_type = lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type; // @[el2_lsu.scala 233:49]
  assign io_lsu_error_pkt_r_mscause = lsu_lsc_ctl_io_lsu_error_pkt_r_mscause; // @[el2_lsu.scala 233:49]
  assign io_lsu_error_pkt_r_addr = lsu_lsc_ctl_io_lsu_error_pkt_r_addr; // @[el2_lsu.scala 233:49]
  assign io_lsu_imprecise_error_load_any = bus_intf_io_lsu_imprecise_error_load_any; // @[el2_lsu.scala 434:49]
  assign io_lsu_imprecise_error_store_any = bus_intf_io_lsu_imprecise_error_store_any; // @[el2_lsu.scala 435:49]
  assign io_lsu_imprecise_error_addr_any = bus_intf_io_lsu_imprecise_error_addr_any; // @[el2_lsu.scala 436:49]
  assign io_lsu_nonblock_load_valid_m = bus_intf_io_lsu_nonblock_load_valid_m; // @[el2_lsu.scala 437:49]
  assign io_lsu_nonblock_load_tag_m = bus_intf_io_lsu_nonblock_load_tag_m; // @[el2_lsu.scala 438:49]
  assign io_lsu_nonblock_load_inv_r = bus_intf_io_lsu_nonblock_load_inv_r; // @[el2_lsu.scala 439:49]
  assign io_lsu_nonblock_load_inv_tag_r = bus_intf_io_lsu_nonblock_load_inv_tag_r; // @[el2_lsu.scala 440:49]
  assign io_lsu_nonblock_load_data_valid = bus_intf_io_lsu_nonblock_load_data_valid; // @[el2_lsu.scala 441:49]
  assign io_lsu_nonblock_load_data_error = bus_intf_io_lsu_nonblock_load_data_error; // @[el2_lsu.scala 442:49]
  assign io_lsu_nonblock_load_data_tag = bus_intf_io_lsu_nonblock_load_data_tag; // @[el2_lsu.scala 443:49]
  assign io_lsu_nonblock_load_data = bus_intf_io_lsu_nonblock_load_data; // @[el2_lsu.scala 444:49]
  assign io_lsu_pmu_load_external_m = _T_48 & lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 197:31]
  assign io_lsu_pmu_store_external_m = _T_50 & lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 198:31]
  assign io_lsu_pmu_misaligned_m = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_46; // @[el2_lsu.scala 196:27]
  assign io_lsu_pmu_bus_trxn = bus_intf_io_lsu_pmu_bus_trxn; // @[el2_lsu.scala 445:49]
  assign io_lsu_pmu_bus_misaligned = bus_intf_io_lsu_pmu_bus_misaligned; // @[el2_lsu.scala 446:49]
  assign io_lsu_pmu_bus_error = bus_intf_io_lsu_pmu_bus_error; // @[el2_lsu.scala 447:49]
  assign io_lsu_pmu_bus_busy = bus_intf_io_lsu_pmu_bus_busy; // @[el2_lsu.scala 448:49]
  assign io_lsu_trigger_match_m = trigger_io_lsu_trigger_match_m; // @[el2_lsu.scala 379:50]
  assign io_dccm_wren = dccm_ctl_io_dccm_wren; // @[el2_lsu.scala 301:49]
  assign io_dccm_rden = dccm_ctl_io_dccm_rden; // @[el2_lsu.scala 302:49]
  assign io_dccm_wr_addr_lo = dccm_ctl_io_dccm_wr_addr_lo; // @[el2_lsu.scala 303:49]
  assign io_dccm_wr_addr_hi = dccm_ctl_io_dccm_wr_addr_hi; // @[el2_lsu.scala 306:49]
  assign io_dccm_rd_addr_lo = dccm_ctl_io_dccm_rd_addr_lo; // @[el2_lsu.scala 305:49]
  assign io_dccm_rd_addr_hi = dccm_ctl_io_dccm_rd_addr_hi; // @[el2_lsu.scala 308:49]
  assign io_dccm_wr_data_lo = dccm_ctl_io_dccm_wr_data_lo; // @[el2_lsu.scala 304:49]
  assign io_dccm_wr_data_hi = dccm_ctl_io_dccm_wr_data_hi; // @[el2_lsu.scala 307:49]
  assign io_picm_wren = dccm_ctl_io_picm_wren; // @[el2_lsu.scala 309:49]
  assign io_picm_rden = dccm_ctl_io_picm_rden; // @[el2_lsu.scala 310:49]
  assign io_picm_mken = dccm_ctl_io_picm_mken; // @[el2_lsu.scala 311:49]
  assign io_picm_rdaddr = dccm_ctl_io_picm_rdaddr; // @[el2_lsu.scala 312:49]
  assign io_picm_wraddr = dccm_ctl_io_picm_wraddr; // @[el2_lsu.scala 313:49]
  assign io_picm_wr_data = dccm_ctl_io_picm_wr_data; // @[el2_lsu.scala 314:49]
  assign io_lsu_axi_awvalid = bus_intf_io_lsu_axi_awvalid; // @[el2_lsu.scala 449:49]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu.scala 457:49]
  assign io_lsu_axi_awid = bus_intf_io_lsu_axi_awid; // @[el2_lsu.scala 451:49]
  assign io_lsu_axi_awaddr = bus_intf_io_lsu_axi_awaddr; // @[el2_lsu.scala 452:49]
  assign io_lsu_axi_awregion = bus_intf_io_lsu_axi_awregion; // @[el2_lsu.scala 453:49]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu.scala 454:49]
  assign io_lsu_axi_awsize = bus_intf_io_lsu_axi_awsize; // @[el2_lsu.scala 455:49]
  assign io_lsu_axi_awburst = 2'h1; // @[el2_lsu.scala 456:49]
  assign io_lsu_axi_awcache = bus_intf_io_lsu_axi_awcache; // @[el2_lsu.scala 458:49]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu.scala 459:49]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu.scala 460:49]
  assign io_lsu_axi_wvalid = bus_intf_io_lsu_axi_wvalid; // @[el2_lsu.scala 461:49]
  assign io_lsu_axi_wdata = bus_intf_io_lsu_axi_wdata; // @[el2_lsu.scala 463:49]
  assign io_lsu_axi_wstrb = bus_intf_io_lsu_axi_wstrb; // @[el2_lsu.scala 464:49]
  assign io_lsu_axi_wlast = 1'h1; // @[el2_lsu.scala 465:49]
  assign io_lsu_axi_bready = 1'h1; // @[el2_lsu.scala 467:49]
  assign io_lsu_axi_arvalid = bus_intf_io_lsu_axi_arvalid; // @[el2_lsu.scala 470:49]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu.scala 478:49]
  assign io_lsu_axi_arid = bus_intf_io_lsu_axi_arid; // @[el2_lsu.scala 472:49]
  assign io_lsu_axi_araddr = bus_intf_io_lsu_axi_araddr; // @[el2_lsu.scala 473:49]
  assign io_lsu_axi_arregion = bus_intf_io_lsu_axi_arregion; // @[el2_lsu.scala 474:49]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu.scala 475:49]
  assign io_lsu_axi_arsize = bus_intf_io_lsu_axi_arsize; // @[el2_lsu.scala 476:49]
  assign io_lsu_axi_arburst = 2'h1; // @[el2_lsu.scala 477:49]
  assign io_lsu_axi_arcache = bus_intf_io_lsu_axi_arcache; // @[el2_lsu.scala 479:49]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu.scala 480:49]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu.scala 481:49]
  assign io_lsu_axi_rready = 1'h1; // @[el2_lsu.scala 483:49]
  assign io_dccm_dma_rvalid = dccm_ctl_io_dccm_dma_rvalid; // @[el2_lsu.scala 297:49]
  assign io_dccm_dma_ecc_error = dccm_ctl_io_dccm_dma_ecc_error; // @[el2_lsu.scala 298:49]
  assign io_dccm_dma_rtag = dccm_ctl_io_dccm_dma_rtag; // @[el2_lsu.scala 299:49]
  assign io_dccm_dma_rdata = dccm_ctl_io_dccm_dma_rdata; // @[el2_lsu.scala 300:49]
  assign io_dccm_ready = ~_T_8; // @[el2_lsu.scala 174:17]
  assign lsu_lsc_ctl_reset = reset;
  assign lsu_lsc_ctl_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 202:46]
  assign lsu_lsc_ctl_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 203:46]
  assign lsu_lsc_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 204:46]
  assign lsu_lsc_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 205:46]
  assign lsu_lsc_ctl_io_lsu_store_c1_m_clk = clkdomain_io_lsu_store_c1_m_clk; // @[el2_lsu.scala 206:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_corr_r = dccm_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 208:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_r = ecc_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 209:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 210:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_m = dccm_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 211:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_m = ecc_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 212:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 213:46]
  assign lsu_lsc_ctl_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[el2_lsu.scala 214:46]
  assign lsu_lsc_ctl_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[el2_lsu.scala 215:46]
  assign lsu_lsc_ctl_io_exu_lsu_rs1_d = io_exu_lsu_rs1_d; // @[el2_lsu.scala 216:46]
  assign lsu_lsc_ctl_io_exu_lsu_rs2_d = io_exu_lsu_rs2_d; // @[el2_lsu.scala 217:46]
  assign lsu_lsc_ctl_io_lsu_p_fast_int = io_lsu_p_fast_int; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_by = io_lsu_p_by; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_half = io_lsu_p_half; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_word = io_lsu_p_word; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_dword = io_lsu_p_dword; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_load = io_lsu_p_load; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_store = io_lsu_p_store; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_unsign = io_lsu_p_unsign; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_dma = io_lsu_p_dma; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_store_data_bypass_d = io_lsu_p_store_data_bypass_d; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_load_ldst_bypass_d = io_lsu_p_load_ldst_bypass_d; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_store_data_bypass_m = io_lsu_p_store_data_bypass_m; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_lsu_p_valid = io_lsu_p_valid; // @[el2_lsu.scala 218:46]
  assign lsu_lsc_ctl_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 219:46]
  assign lsu_lsc_ctl_io_dec_lsu_offset_d = io_dec_lsu_offset_d; // @[el2_lsu.scala 220:46]
  assign lsu_lsc_ctl_io_picm_mask_data_m = dccm_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 221:46]
  assign lsu_lsc_ctl_io_bus_read_data_m = bus_intf_io_bus_read_data_m; // @[el2_lsu.scala 222:46]
  assign lsu_lsc_ctl_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[el2_lsu.scala 228:46]
  assign lsu_lsc_ctl_io_dma_dccm_req = io_dma_dccm_req; // @[el2_lsu.scala 223:46]
  assign lsu_lsc_ctl_io_dma_mem_addr = io_dma_mem_addr; // @[el2_lsu.scala 224:46]
  assign lsu_lsc_ctl_io_dma_mem_sz = io_dma_mem_sz; // @[el2_lsu.scala 225:46]
  assign lsu_lsc_ctl_io_dma_mem_write = io_dma_mem_write; // @[el2_lsu.scala 226:46]
  assign lsu_lsc_ctl_io_dma_mem_wdata = io_dma_mem_wdata; // @[el2_lsu.scala 227:46]
  assign dccm_ctl_clock = clock;
  assign dccm_ctl_reset = reset;
  assign dccm_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 238:46]
  assign dccm_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 239:46]
  assign dccm_ctl_io_lsu_free_c2_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 240:46]
  assign dccm_ctl_io_lsu_store_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 242:46]
  assign dccm_ctl_io_lsu_pkt_d_word = lsu_lsc_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_d_dword = lsu_lsc_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_d_load = lsu_lsc_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_d_store = lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_d_dma = lsu_lsc_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 244:46]
  assign dccm_ctl_io_lsu_pkt_m_by = lsu_lsc_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_half = lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_word = lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 245:46]
  assign dccm_ctl_io_lsu_pkt_r_by = lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_half = lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_word = lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_load = lsu_lsc_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_store = lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_dma = lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 246:46]
  assign dccm_ctl_io_addr_in_dccm_d = lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 247:46]
  assign dccm_ctl_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 248:46]
  assign dccm_ctl_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 249:46]
  assign dccm_ctl_io_addr_in_pic_d = lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 250:46]
  assign dccm_ctl_io_addr_in_pic_m = lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 251:46]
  assign dccm_ctl_io_addr_in_pic_r = lsu_lsc_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 252:46]
  assign dccm_ctl_io_lsu_raw_fwd_lo_r = lsu_raw_fwd_lo_r; // @[el2_lsu.scala 253:46]
  assign dccm_ctl_io_lsu_raw_fwd_hi_r = lsu_raw_fwd_hi_r; // @[el2_lsu.scala 254:46]
  assign dccm_ctl_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 255:46]
  assign dccm_ctl_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d; // @[el2_lsu.scala 256:46]
  assign dccm_ctl_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[el2_lsu.scala 257:46]
  assign dccm_ctl_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 258:46]
  assign dccm_ctl_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[el2_lsu.scala 259:46]
  assign dccm_ctl_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[el2_lsu.scala 260:46]
  assign dccm_ctl_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r[15:0]; // @[el2_lsu.scala 261:46]
  assign dccm_ctl_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 262:46]
  assign dccm_ctl_io_stbuf_addr_any = stbuf_io_stbuf_addr_any; // @[el2_lsu.scala 263:46]
  assign dccm_ctl_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[el2_lsu.scala 264:46]
  assign dccm_ctl_io_stbuf_ecc_any = ecc_io_stbuf_ecc_any; // @[el2_lsu.scala 265:46]
  assign dccm_ctl_io_stbuf_fwddata_hi_m = stbuf_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 266:46]
  assign dccm_ctl_io_stbuf_fwddata_lo_m = stbuf_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 267:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_lo_m = stbuf_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 268:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_hi_m = stbuf_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 269:46]
  assign dccm_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 270:46]
  assign dccm_ctl_io_single_ecc_error_hi_r = ecc_io_single_ecc_error_hi_r; // @[el2_lsu.scala 271:46]
  assign dccm_ctl_io_single_ecc_error_lo_r = ecc_io_single_ecc_error_lo_r; // @[el2_lsu.scala 272:46]
  assign dccm_ctl_io_sec_data_hi_r_ff = ecc_io_sec_data_hi_r_ff; // @[el2_lsu.scala 275:46]
  assign dccm_ctl_io_sec_data_lo_r_ff = ecc_io_sec_data_lo_r_ff; // @[el2_lsu.scala 276:46]
  assign dccm_ctl_io_sec_data_ecc_hi_r_ff = ecc_io_sec_data_ecc_hi_r_ff; // @[el2_lsu.scala 277:46]
  assign dccm_ctl_io_sec_data_ecc_lo_r_ff = ecc_io_sec_data_ecc_lo_r_ff; // @[el2_lsu.scala 278:46]
  assign dccm_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 279:46]
  assign dccm_ctl_io_sec_data_hi_m = ecc_io_sec_data_hi_m; // @[el2_lsu.scala 280:46]
  assign dccm_ctl_io_sec_data_lo_m = ecc_io_sec_data_lo_m; // @[el2_lsu.scala 281:46]
  assign dccm_ctl_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 282:46]
  assign dccm_ctl_io_dma_dccm_wen = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 283:46]
  assign dccm_ctl_io_dma_pic_wen = _T_10 & lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 284:46]
  assign dccm_ctl_io_dma_mem_tag_m = dma_mem_tag_m[2:0]; // @[el2_lsu.scala 285:46]
  assign dccm_ctl_io_dma_mem_addr = io_dma_mem_addr; // @[el2_lsu.scala 286:46]
  assign dccm_ctl_io_dma_mem_wdata = io_dma_mem_wdata; // @[el2_lsu.scala 287:46]
  assign dccm_ctl_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[el2_lsu.scala 288:46]
  assign dccm_ctl_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[el2_lsu.scala 289:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_hi = ecc_io_dma_dccm_wdata_ecc_hi; // @[el2_lsu.scala 290:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_lo = ecc_io_dma_dccm_wdata_ecc_lo; // @[el2_lsu.scala 291:46]
  assign dccm_ctl_io_dccm_rd_data_lo = io_dccm_rd_data_lo; // @[el2_lsu.scala 292:46]
  assign dccm_ctl_io_dccm_rd_data_hi = io_dccm_rd_data_hi; // @[el2_lsu.scala 293:46]
  assign dccm_ctl_io_picm_rd_data = io_picm_rd_data; // @[el2_lsu.scala 294:46]
  assign dccm_ctl_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 295:46]
  assign stbuf_clock = clock;
  assign stbuf_reset = reset;
  assign stbuf_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 317:49]
  assign stbuf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 318:48]
  assign stbuf_io_lsu_stbuf_c1_clk = clkdomain_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 319:54]
  assign stbuf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[el2_lsu.scala 320:54]
  assign stbuf_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 321:48]
  assign stbuf_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 321:48]
  assign stbuf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 321:48]
  assign stbuf_io_lsu_pkt_r_by = lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_half = lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_word = lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_dword = lsu_lsc_ctl_io_lsu_pkt_r_dword; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_store = lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_dma = lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 322:48]
  assign stbuf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 322:48]
  assign stbuf_io_store_stbuf_reqvld_r = _T_28 & _T_19; // @[el2_lsu.scala 323:48]
  assign stbuf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 324:49]
  assign stbuf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 325:49]
  assign stbuf_io_store_data_hi_r = dccm_ctl_io_store_data_hi_r; // @[el2_lsu.scala 326:62]
  assign stbuf_io_store_data_lo_r = dccm_ctl_io_store_data_lo_r; // @[el2_lsu.scala 327:62]
  assign stbuf_io_store_datafn_hi_r = dccm_ctl_io_store_datafn_hi_r; // @[el2_lsu.scala 328:49]
  assign stbuf_io_store_datafn_lo_r = dccm_ctl_io_store_datafn_lo_r; // @[el2_lsu.scala 329:56]
  assign stbuf_io_lsu_stbuf_commit_any = dccm_ctl_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 330:52]
  assign stbuf_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d[15:0]; // @[el2_lsu.scala 331:64]
  assign stbuf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 332:64]
  assign stbuf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 333:64]
  assign stbuf_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[el2_lsu.scala 334:64]
  assign stbuf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[el2_lsu.scala 335:64]
  assign stbuf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[el2_lsu.scala 336:64]
  assign stbuf_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 337:49]
  assign stbuf_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 338:56]
  assign stbuf_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 340:49]
  assign ecc_clock = clock;
  assign ecc_reset = reset;
  assign ecc_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 344:52]
  assign ecc_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 345:52]
  assign ecc_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 345:52]
  assign ecc_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 345:52]
  assign ecc_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 345:52]
  assign ecc_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[el2_lsu.scala 347:54]
  assign ecc_io_dec_tlu_core_ecc_disable = io_dec_tlu_core_ecc_disable; // @[el2_lsu.scala 348:50]
  assign ecc_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[el2_lsu.scala 353:58]
  assign ecc_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[el2_lsu.scala 354:58]
  assign ecc_io_dccm_rdata_hi_m = dccm_ctl_io_dccm_rdata_hi_m; // @[el2_lsu.scala 357:54]
  assign ecc_io_dccm_rdata_lo_m = dccm_ctl_io_dccm_rdata_lo_m; // @[el2_lsu.scala 358:54]
  assign ecc_io_dccm_data_ecc_hi_m = dccm_ctl_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 361:50]
  assign ecc_io_dccm_data_ecc_lo_m = dccm_ctl_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 362:50]
  assign ecc_io_ld_single_ecc_error_r = dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 363:50]
  assign ecc_io_ld_single_ecc_error_r_ff = dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 364:50]
  assign ecc_io_lsu_dccm_rden_m = dccm_ctl_io_lsu_dccm_rden_m; // @[el2_lsu.scala 365:50]
  assign ecc_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 366:50]
  assign ecc_io_dma_dccm_wen = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 367:50]
  assign ecc_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[el2_lsu.scala 368:50]
  assign ecc_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[el2_lsu.scala 369:50]
  assign ecc_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 370:50]
  assign trigger_io_trigger_pkt_any_0_select = io_trigger_pkt_any_0_select; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_0_match_ = io_trigger_pkt_any_0_match_; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_0_store = io_trigger_pkt_any_0_store; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_0_load = io_trigger_pkt_any_0_load; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_0_tdata2 = io_trigger_pkt_any_0_tdata2; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_1_select = io_trigger_pkt_any_1_select; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_1_match_ = io_trigger_pkt_any_1_match_; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_1_store = io_trigger_pkt_any_1_store; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_1_load = io_trigger_pkt_any_1_load; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_1_tdata2 = io_trigger_pkt_any_1_tdata2; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_2_select = io_trigger_pkt_any_2_select; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_2_match_ = io_trigger_pkt_any_2_match_; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_2_store = io_trigger_pkt_any_2_store; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_2_load = io_trigger_pkt_any_2_load; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_2_tdata2 = io_trigger_pkt_any_2_tdata2; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_3_select = io_trigger_pkt_any_3_select; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_3_match_ = io_trigger_pkt_any_3_match_; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_3_store = io_trigger_pkt_any_3_store; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_3_load = io_trigger_pkt_any_3_load; // @[el2_lsu.scala 374:50]
  assign trigger_io_trigger_pkt_any_3_tdata2 = io_trigger_pkt_any_3_tdata2; // @[el2_lsu.scala 374:50]
  assign trigger_io_lsu_pkt_m_half = lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_pkt_m_word = lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 375:50]
  assign trigger_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 376:50]
  assign trigger_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 377:50]
  assign clkdomain_clock = clock;
  assign clkdomain_reset = reset;
  assign clkdomain_io_free_clk = io_free_clk; // @[el2_lsu.scala 383:50]
  assign clkdomain_io_clk_override = io_clk_override; // @[el2_lsu.scala 384:50]
  assign clkdomain_io_dma_dccm_req = io_dma_dccm_req; // @[el2_lsu.scala 386:50]
  assign clkdomain_io_ldst_stbuf_reqvld_r = stbuf_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 387:50]
  assign clkdomain_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 388:50]
  assign clkdomain_io_stbuf_reqvld_flushed_any = stbuf_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 389:50]
  assign clkdomain_io_lsu_busreq_r = bus_intf_io_lsu_busreq_r; // @[el2_lsu.scala 390:50]
  assign clkdomain_io_lsu_bus_buffer_pend_any = bus_intf_io_lsu_bus_buffer_pend_any; // @[el2_lsu.scala 391:50]
  assign clkdomain_io_lsu_bus_buffer_empty_any = bus_intf_io_lsu_bus_buffer_empty_any; // @[el2_lsu.scala 392:50]
  assign clkdomain_io_lsu_stbuf_empty_any = stbuf_io_lsu_stbuf_empty_any; // @[el2_lsu.scala 393:50]
  assign clkdomain_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[el2_lsu.scala 394:50]
  assign clkdomain_io_lsu_p_valid = io_lsu_p_valid; // @[el2_lsu.scala 395:50]
  assign clkdomain_io_lsu_pkt_d_store = lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 396:50]
  assign clkdomain_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 396:50]
  assign clkdomain_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 397:50]
  assign clkdomain_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 397:50]
  assign clkdomain_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 398:50]
  assign clkdomain_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 399:50]
  assign bus_intf_clock = clock;
  assign bus_intf_reset = reset;
  assign bus_intf_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 403:49]
  assign bus_intf_io_dec_tlu_external_ldfwd_disable = io_dec_tlu_external_ldfwd_disable; // @[el2_lsu.scala 404:49]
  assign bus_intf_io_dec_tlu_wb_coalescing_disable = io_dec_tlu_wb_coalescing_disable; // @[el2_lsu.scala 405:49]
  assign bus_intf_io_dec_tlu_sideeffect_posted_disable = io_dec_tlu_sideeffect_posted_disable; // @[el2_lsu.scala 406:49]
  assign bus_intf_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 407:49]
  assign bus_intf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 408:49]
  assign bus_intf_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 409:49]
  assign bus_intf_io_lsu_bus_ibuf_c1_clk = clkdomain_io_lsu_bus_ibuf_c1_clk; // @[el2_lsu.scala 410:49]
  assign bus_intf_io_lsu_bus_buf_c1_clk = clkdomain_io_lsu_bus_buf_c1_clk; // @[el2_lsu.scala 412:49]
  assign bus_intf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[el2_lsu.scala 413:49]
  assign bus_intf_io_free_clk = io_free_clk; // @[el2_lsu.scala 414:49]
  assign bus_intf_io_lsu_busm_clk = clkdomain_io_lsu_busm_clk; // @[el2_lsu.scala 415:49]
  assign bus_intf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 416:49]
  assign bus_intf_io_lsu_busreq_m = _T_39 & _T_40; // @[el2_lsu.scala 417:49]
  assign bus_intf_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 425:50]
  assign bus_intf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 425:50]
  assign bus_intf_io_lsu_pkt_r_by = lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_half = lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_word = lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_load = lsu_lsc_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_store = lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_unsign = lsu_lsc_ctl_io_lsu_pkt_r_unsign; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 426:50]
  assign bus_intf_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d; // @[el2_lsu.scala 418:49]
  assign bus_intf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 419:49]
  assign bus_intf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 420:49]
  assign bus_intf_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d; // @[el2_lsu.scala 421:49]
  assign bus_intf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[el2_lsu.scala 422:49]
  assign bus_intf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[el2_lsu.scala 423:49]
  assign bus_intf_io_store_data_r = dccm_ctl_io_store_data_r; // @[el2_lsu.scala 424:52]
  assign bus_intf_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[el2_lsu.scala 427:49]
  assign bus_intf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 428:49]
  assign bus_intf_io_is_sideeffects_m = lsu_lsc_ctl_io_is_sideeffects_m; // @[el2_lsu.scala 429:49]
  assign bus_intf_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[el2_lsu.scala 430:49]
  assign bus_intf_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[el2_lsu.scala 431:49]
  assign bus_intf_io_lsu_axi_awready = io_lsu_axi_awready; // @[el2_lsu.scala 450:49]
  assign bus_intf_io_lsu_axi_wready = io_lsu_axi_wready; // @[el2_lsu.scala 462:49]
  assign bus_intf_io_lsu_axi_bvalid = io_lsu_axi_bvalid; // @[el2_lsu.scala 466:49]
  assign bus_intf_io_lsu_axi_bresp = io_lsu_axi_bresp; // @[el2_lsu.scala 468:49]
  assign bus_intf_io_lsu_axi_bid = io_lsu_axi_bid; // @[el2_lsu.scala 469:49]
  assign bus_intf_io_lsu_axi_arready = io_lsu_axi_arready; // @[el2_lsu.scala 471:49]
  assign bus_intf_io_lsu_axi_rvalid = io_lsu_axi_rvalid; // @[el2_lsu.scala 482:49]
  assign bus_intf_io_lsu_axi_rid = io_lsu_axi_rid; // @[el2_lsu.scala 484:49]
  assign bus_intf_io_lsu_axi_rdata = io_lsu_axi_rdata; // @[el2_lsu.scala 485:49]
  assign bus_intf_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[el2_lsu.scala 488:49]
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
  _T_52 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_raw_fwd_hi_r = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_raw_fwd_lo_r = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_52 = 3'h0;
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
      _T_52 <= 3'h0;
    end else begin
      _T_52 <= io_dma_mem_tag;
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
