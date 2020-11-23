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
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[el2_lib.scala 496:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 501:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[el2_lib.scala 496:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[el2_lib.scala 501:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[el2_lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 501:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[el2_lib.scala 501:39]
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
  wire  _T_52 = _T_50 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 67:88]
  wire [31:0] _T_55 = io_start_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 68:56]
  wire  _T_57 = _T_55 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 68:88]
  wire  _T_59 = _T_52 | _T_57; // @[el2_lsu_addrcheck.scala 67:153]
  wire [31:0] _T_61 = io_start_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 69:56]
  wire  _T_63 = _T_61 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 69:88]
  wire  _T_65 = _T_59 | _T_63; // @[el2_lsu_addrcheck.scala 68:153]
  wire [31:0] _T_67 = io_start_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 70:56]
  wire  _T_69 = _T_67 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 70:88]
  wire  _T_71 = _T_65 | _T_69; // @[el2_lsu_addrcheck.scala 69:153]
  wire [31:0] _T_97 = io_end_addr_d | 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:57]
  wire  _T_99 = _T_97 == 32'h7fffffff; // @[el2_lsu_addrcheck.scala 76:89]
  wire [31:0] _T_102 = io_end_addr_d | 32'h3fffffff; // @[el2_lsu_addrcheck.scala 77:58]
  wire  _T_104 = _T_102 == 32'hffffffff; // @[el2_lsu_addrcheck.scala 77:90]
  wire  _T_106 = _T_99 | _T_104; // @[el2_lsu_addrcheck.scala 76:154]
  wire [31:0] _T_108 = io_end_addr_d | 32'h1fffffff; // @[el2_lsu_addrcheck.scala 78:58]
  wire  _T_110 = _T_108 == 32'hbfffffff; // @[el2_lsu_addrcheck.scala 78:90]
  wire  _T_112 = _T_106 | _T_110; // @[el2_lsu_addrcheck.scala 77:155]
  wire [31:0] _T_114 = io_end_addr_d | 32'hfffffff; // @[el2_lsu_addrcheck.scala 79:58]
  wire  _T_116 = _T_114 == 32'h8fffffff; // @[el2_lsu_addrcheck.scala 79:90]
  wire  _T_118 = _T_112 | _T_116; // @[el2_lsu_addrcheck.scala 78:155]
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
  input         clock,
  input         reset,
  input         io_lsu_c1_m_clk,
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_store_c1_m_clk,
  input  [31:0] io_lsu_ld_data_r,
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
  output        io_lsu_error_pkt_r_bits_mscause,
  output        io_lsu_error_pkt_r_bits_addr,
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
  output        io_lsu_pkt_m_store_data_bypass_d,
  output        io_lsu_pkt_m_load_ldst_bypass_d,
  output        io_lsu_pkt_m_store_data_bypass_m,
  output        io_lsu_pkt_m_valid,
  output        io_lsu_pkt_r_fast_int,
  output        io_lsu_pkt_r_by,
  output        io_lsu_pkt_r_half,
  output        io_lsu_pkt_r_word,
  output        io_lsu_pkt_r_dword,
  output        io_lsu_pkt_r_load,
  output        io_lsu_pkt_r_store,
  output        io_lsu_pkt_r_unsign,
  output        io_lsu_pkt_r_dma,
  output        io_lsu_pkt_r_store_data_bypass_d,
  output        io_lsu_pkt_r_load_ldst_bypass_d,
  output        io_lsu_pkt_r_store_data_bypass_m,
  output        io_lsu_pkt_r_valid,
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
  wire [12:0] _T_10 = _T_6 + _T_8; // @[el2_lib.scala 232:39]
  wire  _T_13 = lsu_offset_d[11] ^ _T_10[12]; // @[el2_lib.scala 233:46]
  wire  _T_14 = ~_T_13; // @[el2_lib.scala 233:33]
  wire [19:0] _T_16 = _T_14 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_18 = _T_16 & rs1_d[31:12]; // @[el2_lib.scala 233:58]
  wire  _T_20 = ~lsu_offset_d[11]; // @[el2_lib.scala 234:18]
  wire  _T_22 = _T_20 & _T_10[12]; // @[el2_lib.scala 234:30]
  wire [19:0] _T_24 = _T_22 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_27 = rs1_d[31:12] + 20'h1; // @[el2_lib.scala 234:54]
  wire [19:0] _T_28 = _T_24 & _T_27; // @[el2_lib.scala 234:41]
  wire [19:0] _T_29 = _T_18 | _T_28; // @[el2_lib.scala 233:72]
  wire  _T_32 = ~_T_10[12]; // @[el2_lib.scala 235:31]
  wire  _T_33 = lsu_offset_d[11] & _T_32; // @[el2_lib.scala 235:29]
  wire [19:0] _T_35 = _T_33 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_38 = rs1_d[31:12] - 20'h1; // @[el2_lib.scala 235:54]
  wire [19:0] _T_39 = _T_35 & _T_38; // @[el2_lib.scala 235:41]
  wire [19:0] _T_40 = _T_29 | _T_39; // @[el2_lib.scala 234:61]
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
  wire  _T_76 = _T_69 | io_lsu_double_ecc_error_m; // @[el2_lsu_lsc_ctl.scala 179:67]
  wire  _T_77 = _T_76 & io_lsu_pkt_m_valid; // @[el2_lsu_lsc_ctl.scala 179:96]
  wire  _T_78 = ~io_lsu_pkt_m_dma; // @[el2_lsu_lsc_ctl.scala 179:119]
  wire  _T_79 = _T_77 & _T_78; // @[el2_lsu_lsc_ctl.scala 179:117]
  wire  _T_80 = ~io_lsu_pkt_m_fast_int; // @[el2_lsu_lsc_ctl.scala 179:139]
  wire  _T_81 = _T_79 & _T_80; // @[el2_lsu_lsc_ctl.scala 179:137]
  wire  _T_82 = ~io_flush_m_up; // @[el2_lsu_lsc_ctl.scala 179:164]
  wire  lsu_error_pkt_m_valid = _T_81 & _T_82; // @[el2_lsu_lsc_ctl.scala 179:162]
  wire  _T_84 = ~lsu_error_pkt_m_valid; // @[el2_lsu_lsc_ctl.scala 180:75]
  wire  _T_85 = io_lsu_single_ecc_error_m & _T_84; // @[el2_lsu_lsc_ctl.scala 180:73]
  wire  lsu_error_pkt_m_bits_exc_type = ~misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 182:46]
  wire  _T_90 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_bits_exc_type; // @[el2_lsu_lsc_ctl.scala 183:78]
  wire  _T_91 = ~access_fault_m; // @[el2_lsu_lsc_ctl.scala 183:102]
  wire  _T_92 = _T_90 & _T_91; // @[el2_lsu_lsc_ctl.scala 183:100]
  wire [3:0] _T_95 = _T_92 ? 4'h1 : exc_mscause_m; // @[el2_lsu_lsc_ctl.scala 183:49]
  wire  _T_99 = io_lsu_pkt_m_fast_int & io_lsu_double_ecc_error_m; // @[el2_lsu_lsc_ctl.scala 185:161]
  reg  _T_105_valid; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_bits_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_bits_inst_type; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_bits_exc_type; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_bits_mscause; // @[el2_lsu_lsc_ctl.scala 186:75]
  reg  _T_105_bits_addr; // @[el2_lsu_lsc_ctl.scala 186:75]
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
  reg  _T_132_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_132_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 215:65]
  reg  _T_134_fast_int; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_by; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_half; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_word; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_dword; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_load; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_store; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_unsign; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_dma; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 216:65]
  reg  _T_134_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 216:65]
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
  reg  addr_external_r; // @[el2_lsu_lsc_ctl.scala 234:66]
  reg [31:0] bus_read_data_r; // @[el2_lsu_lsc_ctl.scala 235:66]
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
  wire [31:0] lsu_ld_datafn_corr_r = addr_external_r ? bus_read_data_r : io_lsu_ld_data_corr_r; // @[el2_lsu_lsc_ctl.scala 264:33]
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
  wire  _T_214 = io_lsu_pkt_r_unsign & io_lsu_pkt_r_by; // @[el2_lsu_lsc_ctl.scala 270:61]
  wire [31:0] _T_216 = _T_214 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_218 = {24'h0,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_219 = _T_216 & _T_218; // @[el2_lsu_lsc_ctl.scala 270:84]
  wire  _T_220 = io_lsu_pkt_r_unsign & io_lsu_pkt_r_half; // @[el2_lsu_lsc_ctl.scala 271:38]
  wire [31:0] _T_222 = _T_220 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_224 = {16'h0,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_225 = _T_222 & _T_224; // @[el2_lsu_lsc_ctl.scala 271:61]
  wire [31:0] _T_226 = _T_219 | _T_225; // @[el2_lsu_lsc_ctl.scala 270:128]
  wire  _T_227 = ~io_lsu_pkt_r_unsign; // @[el2_lsu_lsc_ctl.scala 272:17]
  wire  _T_228 = _T_227 & io_lsu_pkt_r_by; // @[el2_lsu_lsc_ctl.scala 272:38]
  wire [31:0] _T_230 = _T_228 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_233 = lsu_ld_datafn_corr_r[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_235 = {_T_233,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_236 = _T_230 & _T_235; // @[el2_lsu_lsc_ctl.scala 272:61]
  wire [31:0] _T_237 = _T_226 | _T_236; // @[el2_lsu_lsc_ctl.scala 271:109]
  wire  _T_239 = _T_227 & io_lsu_pkt_r_half; // @[el2_lsu_lsc_ctl.scala 273:38]
  wire [31:0] _T_241 = _T_239 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_244 = lsu_ld_datafn_corr_r[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = {_T_244,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_247 = _T_241 & _T_246; // @[el2_lsu_lsc_ctl.scala 273:61]
  wire [31:0] _T_248 = _T_237 | _T_247; // @[el2_lsu_lsc_ctl.scala 272:134]
  wire [31:0] _T_250 = io_lsu_pkt_r_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_252 = _T_250 & lsu_ld_datafn_corr_r; // @[el2_lsu_lsc_ctl.scala 274:38]
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
  assign io_lsu_result_corr_r = _T_248 | _T_252; // @[el2_lsu_lsc_ctl.scala 270:27]
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
  assign io_lsu_error_pkt_r_valid = _T_105_valid; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = _T_105_bits_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_bits_inst_type = _T_105_bits_inst_type; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_bits_exc_type = _T_105_bits_exc_type; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_bits_mscause = _T_105_bits_mscause; // @[el2_lsu_lsc_ctl.scala 186:38]
  assign io_lsu_error_pkt_r_bits_addr = _T_105_bits_addr; // @[el2_lsu_lsc_ctl.scala 186:38]
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
  assign io_lsu_pkt_m_store_data_bypass_d = _T_132_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_load_ldst_bypass_d = _T_132_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_store_data_bypass_m = _T_132_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 215:28]
  assign io_lsu_pkt_m_valid = _T_135; // @[el2_lsu_lsc_ctl.scala 215:28 el2_lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_fast_int = _T_134_fast_int; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_by = _T_134_by; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_half = _T_134_half; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_word = _T_134_word; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_dword = _T_134_dword; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_load = _T_134_load; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_store = _T_134_store; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_unsign = _T_134_unsign; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_dma = _T_134_dma; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_store_data_bypass_d = _T_134_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_load_ldst_bypass_d = _T_134_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_store_data_bypass_m = _T_134_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 216:28]
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
  _T_105_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_105_bits_single_ecc_error = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_105_bits_inst_type = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_105_bits_exc_type = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_105_bits_mscause = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_105_bits_addr = _RAND_10[0:0];
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
  _T_132_store_data_bypass_d = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_132_load_ldst_bypass_d = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_132_store_data_bypass_m = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_134_fast_int = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_134_by = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_134_half = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_134_word = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_134_dword = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_134_load = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_134_store = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_134_unsign = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  _T_134_dma = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  _T_134_store_data_bypass_d = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  _T_134_load_ldst_bypass_d = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  _T_134_store_data_bypass_m = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  _T_135 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  _T_136 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  store_data_pre_m = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  _T_146 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  _T_147 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  _T_148 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  _T_149 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  _T_150 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  _T_151 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  _T_152 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  _T_153 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  _T_154 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  addr_external_r = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  bus_read_data_r = _RAND_49[31:0];
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
    _T_105_bits_mscause = 1'h0;
  end
  if (reset) begin
    _T_105_bits_addr = 1'h0;
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
    _T_132_store_data_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_132_load_ldst_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_132_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_134_fast_int = 1'h0;
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
    _T_134_store_data_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_134_load_ldst_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_134_store_data_bypass_m = 1'h0;
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
      _T_105_bits_inst_type <= io_lsu_pkt_m_store;
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
      _T_105_bits_mscause <= 1'h0;
    end else begin
      _T_105_bits_mscause <= _T_95[0];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_105_bits_addr <= 1'h0;
    end else begin
      _T_105_bits_addr <= io_lsu_addr_m[0];
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
      _T_132_store_data_bypass_d <= 1'h0;
    end else begin
      _T_132_store_data_bypass_d <= io_lsu_pkt_d_store_data_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_132_load_ldst_bypass_d <= 1'h0;
    end else begin
      _T_132_load_ldst_bypass_d <= io_lsu_pkt_d_load_ldst_bypass_d;
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
      _T_134_fast_int <= 1'h0;
    end else begin
      _T_134_fast_int <= io_lsu_pkt_m_fast_int;
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
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_store_data_bypass_d <= 1'h0;
    end else begin
      _T_134_store_data_bypass_d <= io_lsu_pkt_m_store_data_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_load_ldst_bypass_d <= 1'h0;
    end else begin
      _T_134_load_ldst_bypass_d <= io_lsu_pkt_m_load_ldst_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_134_store_data_bypass_m <= 1'h0;
    end else begin
      _T_134_store_data_bypass_m <= io_lsu_pkt_m_store_data_bypass_m;
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
