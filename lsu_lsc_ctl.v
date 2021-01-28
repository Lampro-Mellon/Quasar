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
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[lib.scala 370:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[lib.scala 375:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[lib.scala 370:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[lib.scala 375:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[lib.scala 375:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[lib.scala 375:39]
  wire  start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 54:60]
  wire  _T_17 = io_rs1_region_d == 4'hf; // @[lsu_addrcheck.scala 55:55]
  wire  base_reg_dccm_or_pic = _T_17 | _T_17; // @[lsu_addrcheck.scala 55:91]
  wire [4:0] csr_idx = {io_start_addr_d[31:28],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_26 = io_dec_tlu_mrac_ff >> csr_idx; // @[lsu_addrcheck.scala 61:50]
  wire  _T_29 = start_addr_dccm_or_pic | addr_in_iccm; // @[lsu_addrcheck.scala 61:121]
  wire  _T_30 = ~_T_29; // @[lsu_addrcheck.scala 61:62]
  wire  _T_31 = _T_26[0] & _T_30; // @[lsu_addrcheck.scala 61:60]
  wire  _T_32 = _T_31 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 61:137]
  wire  _T_33 = io_lsu_pkt_d_bits_store | io_lsu_pkt_d_bits_load; // @[lsu_addrcheck.scala 61:185]
  wire  is_sideeffects_d = _T_32 & _T_33; // @[lsu_addrcheck.scala 61:158]
  wire  _T_35 = io_start_addr_d[1:0] == 2'h0; // @[lsu_addrcheck.scala 62:80]
  wire  _T_36 = io_lsu_pkt_d_bits_word & _T_35; // @[lsu_addrcheck.scala 62:56]
  wire  _T_38 = ~io_start_addr_d[0]; // @[lsu_addrcheck.scala 62:138]
  wire  _T_39 = io_lsu_pkt_d_bits_half & _T_38; // @[lsu_addrcheck.scala 62:116]
  wire  _T_40 = _T_36 | _T_39; // @[lsu_addrcheck.scala 62:90]
  wire  is_aligned_d = _T_40 | io_lsu_pkt_d_bits_by; // @[lsu_addrcheck.scala 62:148]
  wire [31:0] _T_51 = io_start_addr_d | 32'h7fffffff; // @[lsu_addrcheck.scala 67:56]
  wire  _T_53 = _T_51 == 32'h7fffffff; // @[lsu_addrcheck.scala 67:88]
  wire [31:0] _T_56 = io_start_addr_d | 32'h3fffffff; // @[lsu_addrcheck.scala 68:56]
  wire  _T_58 = _T_56 == 32'hffffffff; // @[lsu_addrcheck.scala 68:88]
  wire  _T_60 = _T_53 | _T_58; // @[lsu_addrcheck.scala 67:153]
  wire [31:0] _T_62 = io_start_addr_d | 32'h1fffffff; // @[lsu_addrcheck.scala 69:56]
  wire  _T_64 = _T_62 == 32'hbfffffff; // @[lsu_addrcheck.scala 69:88]
  wire  _T_66 = _T_60 | _T_64; // @[lsu_addrcheck.scala 68:153]
  wire [31:0] _T_68 = io_start_addr_d | 32'hfffffff; // @[lsu_addrcheck.scala 70:56]
  wire  _T_70 = _T_68 == 32'h8fffffff; // @[lsu_addrcheck.scala 70:88]
  wire  _T_72 = _T_66 | _T_70; // @[lsu_addrcheck.scala 69:153]
  wire [31:0] _T_98 = io_end_addr_d | 32'h7fffffff; // @[lsu_addrcheck.scala 76:57]
  wire  _T_100 = _T_98 == 32'h7fffffff; // @[lsu_addrcheck.scala 76:89]
  wire [31:0] _T_103 = io_end_addr_d | 32'h3fffffff; // @[lsu_addrcheck.scala 77:58]
  wire  _T_105 = _T_103 == 32'hffffffff; // @[lsu_addrcheck.scala 77:90]
  wire  _T_107 = _T_100 | _T_105; // @[lsu_addrcheck.scala 76:154]
  wire [31:0] _T_109 = io_end_addr_d | 32'h1fffffff; // @[lsu_addrcheck.scala 78:58]
  wire  _T_111 = _T_109 == 32'hbfffffff; // @[lsu_addrcheck.scala 78:90]
  wire  _T_113 = _T_107 | _T_111; // @[lsu_addrcheck.scala 77:155]
  wire [31:0] _T_115 = io_end_addr_d | 32'hfffffff; // @[lsu_addrcheck.scala 79:58]
  wire  _T_117 = _T_115 == 32'h8fffffff; // @[lsu_addrcheck.scala 79:90]
  wire  _T_119 = _T_113 | _T_117; // @[lsu_addrcheck.scala 78:155]
  wire  non_dccm_access_ok = _T_72 & _T_119; // @[lsu_addrcheck.scala 75:7]
  wire  regpred_access_fault_d = start_addr_dccm_or_pic ^ base_reg_dccm_or_pic; // @[lsu_addrcheck.scala 85:57]
  wire  _T_146 = io_start_addr_d[1:0] != 2'h0; // @[lsu_addrcheck.scala 86:76]
  wire  _T_147 = ~io_lsu_pkt_d_bits_word; // @[lsu_addrcheck.scala 86:92]
  wire  _T_148 = _T_146 | _T_147; // @[lsu_addrcheck.scala 86:90]
  wire  picm_access_fault_d = io_addr_in_pic_d & _T_148; // @[lsu_addrcheck.scala 86:51]
  wire  _T_149 = start_addr_in_dccm_d | start_addr_in_pic_d; // @[lsu_addrcheck.scala 91:87]
  wire  _T_150 = ~_T_149; // @[lsu_addrcheck.scala 91:64]
  wire  _T_151 = start_addr_in_dccm_region_d & _T_150; // @[lsu_addrcheck.scala 91:62]
  wire  _T_152 = end_addr_in_dccm_d | end_addr_in_pic_d; // @[lsu_addrcheck.scala 93:57]
  wire  _T_153 = ~_T_152; // @[lsu_addrcheck.scala 93:36]
  wire  _T_154 = end_addr_in_dccm_region_d & _T_153; // @[lsu_addrcheck.scala 93:34]
  wire  _T_155 = _T_151 | _T_154; // @[lsu_addrcheck.scala 91:112]
  wire  _T_156 = start_addr_in_dccm_d & end_addr_in_pic_d; // @[lsu_addrcheck.scala 95:29]
  wire  _T_157 = _T_155 | _T_156; // @[lsu_addrcheck.scala 93:85]
  wire  _T_158 = start_addr_in_pic_d & end_addr_in_dccm_d; // @[lsu_addrcheck.scala 97:29]
  wire  unmapped_access_fault_d = _T_157 | _T_158; // @[lsu_addrcheck.scala 95:85]
  wire  _T_160 = ~start_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 99:33]
  wire  _T_161 = ~non_dccm_access_ok; // @[lsu_addrcheck.scala 99:64]
  wire  mpu_access_fault_d = _T_160 & _T_161; // @[lsu_addrcheck.scala 99:62]
  wire  _T_163 = unmapped_access_fault_d | mpu_access_fault_d; // @[lsu_addrcheck.scala 111:49]
  wire  _T_164 = _T_163 | picm_access_fault_d; // @[lsu_addrcheck.scala 111:70]
  wire  _T_165 = _T_164 | regpred_access_fault_d; // @[lsu_addrcheck.scala 111:92]
  wire  _T_166 = _T_165 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 111:118]
  wire  _T_167 = ~io_lsu_pkt_d_bits_dma; // @[lsu_addrcheck.scala 111:141]
  wire [3:0] _T_173 = picm_access_fault_d ? 4'h6 : 4'h0; // @[lsu_addrcheck.scala 112:164]
  wire [3:0] _T_174 = regpred_access_fault_d ? 4'h5 : _T_173; // @[lsu_addrcheck.scala 112:120]
  wire [3:0] _T_175 = mpu_access_fault_d ? 4'h3 : _T_174; // @[lsu_addrcheck.scala 112:80]
  wire [3:0] access_fault_mscause_d = unmapped_access_fault_d ? 4'h2 : _T_175; // @[lsu_addrcheck.scala 112:35]
  wire  regcross_misaligned_fault_d = io_start_addr_d[31:28] != io_end_addr_d[31:28]; // @[lsu_addrcheck.scala 113:61]
  wire  _T_178 = ~is_aligned_d; // @[lsu_addrcheck.scala 114:59]
  wire  sideeffect_misaligned_fault_d = is_sideeffects_d & _T_178; // @[lsu_addrcheck.scala 114:57]
  wire  _T_179 = sideeffect_misaligned_fault_d & io_addr_external_d; // @[lsu_addrcheck.scala 115:90]
  wire  _T_180 = regcross_misaligned_fault_d | _T_179; // @[lsu_addrcheck.scala 115:57]
  wire  _T_181 = _T_180 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 115:113]
  wire [3:0] _T_185 = sideeffect_misaligned_fault_d ? 4'h1 : 4'h0; // @[lsu_addrcheck.scala 116:80]
  wire [3:0] misaligned_fault_mscause_d = regcross_misaligned_fault_d ? 4'h2 : _T_185; // @[lsu_addrcheck.scala 116:39]
  wire  _T_190 = ~start_addr_in_dccm_d; // @[lsu_addrcheck.scala 118:66]
  wire  _T_191 = start_addr_in_dccm_region_d & _T_190; // @[lsu_addrcheck.scala 118:64]
  wire  _T_192 = ~end_addr_in_dccm_d; // @[lsu_addrcheck.scala 118:120]
  wire  _T_193 = end_addr_in_dccm_region_d & _T_192; // @[lsu_addrcheck.scala 118:118]
  wire  _T_194 = _T_191 | _T_193; // @[lsu_addrcheck.scala 118:88]
  wire  _T_195 = _T_194 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 118:142]
  wire  _T_197 = start_addr_in_dccm_region_d & end_addr_in_dccm_region_d; // @[lsu_addrcheck.scala 119:66]
  wire  _T_198 = ~_T_197; // @[lsu_addrcheck.scala 119:36]
  wire  _T_199 = _T_198 & io_lsu_pkt_d_valid; // @[lsu_addrcheck.scala 119:95]
  reg  _T_201; // @[lsu_addrcheck.scala 121:60]
  assign io_is_sideeffects_m = _T_201; // @[lsu_addrcheck.scala 121:50]
  assign io_addr_in_dccm_d = start_addr_in_dccm_d & end_addr_in_dccm_d; // @[lsu_addrcheck.scala 56:32]
  assign io_addr_in_pic_d = start_addr_in_pic_d & end_addr_in_pic_d; // @[lsu_addrcheck.scala 57:32]
  assign io_addr_external_d = ~start_addr_dccm_or_pic; // @[lsu_addrcheck.scala 59:30]
  assign io_access_fault_d = _T_166 & _T_167; // @[lsu_addrcheck.scala 111:21]
  assign io_misaligned_fault_d = _T_181 & _T_167; // @[lsu_addrcheck.scala 115:25]
  assign io_exc_mscause_d = io_misaligned_fault_d ? misaligned_fault_mscause_d : access_fault_mscause_d; // @[lsu_addrcheck.scala 117:21]
  assign io_fir_dccm_access_error_d = _T_195 & io_lsu_pkt_d_bits_fast_int; // @[lsu_addrcheck.scala 118:31]
  assign io_fir_nondccm_access_error_d = _T_199 & io_lsu_pkt_d_bits_fast_int; // @[lsu_addrcheck.scala 119:33]
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
  _T_201 = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_201 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_201 <= 1'h0;
    end else begin
      _T_201 <= _T_32 & _T_33;
    end
  end
endmodule
module rvclkhdr(
  input   io_clk,
  input   io_en
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module lsu_lsc_ctl(
  input         clock,
  input         reset,
  input         io_clk_override,
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
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
  input  [31:0] io_lsu_exu_exu_lsu_rs1_d,
  input  [31:0] io_lsu_exu_exu_lsu_rs2_d,
  output [31:0] io_lsu_exu_lsu_result_m,
  input         io_lsu_p_valid,
  input         io_lsu_p_bits_fast_int,
  input         io_lsu_p_bits_stack,
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
  output        io_lsu_pkt_d_bits_stack,
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
  output        io_lsu_pkt_m_bits_stack,
  output        io_lsu_pkt_m_bits_by,
  output        io_lsu_pkt_m_bits_half,
  output        io_lsu_pkt_m_bits_word,
  output        io_lsu_pkt_m_bits_dword,
  output        io_lsu_pkt_m_bits_load,
  output        io_lsu_pkt_m_bits_store,
  output        io_lsu_pkt_m_bits_unsign,
  output        io_lsu_pkt_m_bits_dma,
  output        io_lsu_pkt_m_bits_store_data_bypass_d,
  output        io_lsu_pkt_m_bits_load_ldst_bypass_d,
  output        io_lsu_pkt_m_bits_store_data_bypass_m,
  output        io_lsu_pkt_r_valid,
  output        io_lsu_pkt_r_bits_fast_int,
  output        io_lsu_pkt_r_bits_stack,
  output        io_lsu_pkt_r_bits_by,
  output        io_lsu_pkt_r_bits_half,
  output        io_lsu_pkt_r_bits_word,
  output        io_lsu_pkt_r_bits_dword,
  output        io_lsu_pkt_r_bits_load,
  output        io_lsu_pkt_r_bits_store,
  output        io_lsu_pkt_r_bits_unsign,
  output        io_lsu_pkt_r_bits_dma,
  output        io_lsu_pkt_r_bits_store_data_bypass_d,
  output        io_lsu_pkt_r_bits_load_ldst_bypass_d,
  output        io_lsu_pkt_r_bits_store_data_bypass_m,
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
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
`endif // RANDOMIZE_REG_INIT
  wire  addrcheck_reset; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 117:25]
  wire [31:0] addrcheck_io_start_addr_d; // @[lsu_lsc_ctl.scala 117:25]
  wire [31:0] addrcheck_io_end_addr_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 117:25]
  wire [31:0] addrcheck_io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 117:25]
  wire [3:0] addrcheck_io_rs1_region_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_addr_external_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_access_fault_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_misaligned_fault_d; // @[lsu_lsc_ctl.scala 117:25]
  wire [3:0] addrcheck_io_exc_mscause_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_fir_dccm_access_error_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  addrcheck_io_fir_nondccm_access_error_d; // @[lsu_lsc_ctl.scala 117:25]
  wire  rvclkhdr_io_clk; // @[lib.scala 417:23]
  wire  rvclkhdr_io_en; // @[lib.scala 417:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 404:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 404:23]
  wire [31:0] lsu_rs1_d = io_dec_lsu_valid_raw_d ? io_lsu_exu_exu_lsu_rs1_d : io_dma_lsc_ctl_dma_mem_addr; // @[lsu_lsc_ctl.scala 99:28]
  wire [11:0] _T_4 = io_dec_lsu_valid_raw_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [11:0] lsu_offset_d = io_dec_lsu_offset_d & _T_4; // @[lsu_lsc_ctl.scala 100:51]
  wire [31:0] rs1_d = io_lsu_pkt_d_bits_load_ldst_bypass_d ? io_lsu_exu_lsu_result_m : lsu_rs1_d; // @[lsu_lsc_ctl.scala 103:28]
  wire [12:0] _T_7 = {1'h0,rs1_d[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_9 = {1'h0,lsu_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _T_11 = _T_7 + _T_9; // @[lib.scala 92:39]
  wire  _T_14 = lsu_offset_d[11] ^ _T_11[12]; // @[lib.scala 93:46]
  wire  _T_15 = ~_T_14; // @[lib.scala 93:33]
  wire [19:0] _T_17 = _T_15 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_19 = _T_17 & rs1_d[31:12]; // @[lib.scala 93:58]
  wire  _T_21 = ~lsu_offset_d[11]; // @[lib.scala 94:18]
  wire  _T_23 = _T_21 & _T_11[12]; // @[lib.scala 94:30]
  wire [19:0] _T_25 = _T_23 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_28 = rs1_d[31:12] + 20'h1; // @[lib.scala 94:54]
  wire [19:0] _T_29 = _T_25 & _T_28; // @[lib.scala 94:41]
  wire [19:0] _T_30 = _T_19 | _T_29; // @[lib.scala 93:72]
  wire  _T_33 = ~_T_11[12]; // @[lib.scala 95:31]
  wire  _T_34 = lsu_offset_d[11] & _T_33; // @[lib.scala 95:29]
  wire [19:0] _T_36 = _T_34 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_39 = rs1_d[31:12] - 20'h1; // @[lib.scala 95:54]
  wire [19:0] _T_40 = _T_36 & _T_39; // @[lib.scala 95:41]
  wire [19:0] _T_41 = _T_30 | _T_40; // @[lib.scala 94:61]
  wire [2:0] _T_44 = io_lsu_pkt_d_bits_half ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_45 = _T_44 & 3'h1; // @[lsu_lsc_ctl.scala 108:58]
  wire [2:0] _T_47 = io_lsu_pkt_d_bits_word ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_48 = _T_47 & 3'h3; // @[lsu_lsc_ctl.scala 109:40]
  wire [2:0] _T_49 = _T_45 | _T_48; // @[lsu_lsc_ctl.scala 108:70]
  wire [2:0] _T_51 = io_lsu_pkt_d_bits_dword ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] addr_offset_d = _T_49 | _T_51; // @[lsu_lsc_ctl.scala 109:52]
  wire [12:0] _T_55 = {lsu_offset_d[11],lsu_offset_d}; // @[Cat.scala 29:58]
  wire [11:0] _T_58 = {9'h0,addr_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _GEN_9 = {{1'd0}, _T_58}; // @[lsu_lsc_ctl.scala 112:60]
  wire [12:0] end_addr_offset_d = _T_55 + _GEN_9; // @[lsu_lsc_ctl.scala 112:60]
  wire [18:0] _T_63 = end_addr_offset_d[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_65 = {_T_63,end_addr_offset_d}; // @[Cat.scala 29:58]
  reg  access_fault_m; // @[lsu_lsc_ctl.scala 148:75]
  reg  misaligned_fault_m; // @[lsu_lsc_ctl.scala 149:75]
  reg [3:0] exc_mscause_m; // @[lsu_lsc_ctl.scala 150:75]
  reg  fir_dccm_access_error_m; // @[lsu_lsc_ctl.scala 151:75]
  reg  fir_nondccm_access_error_m; // @[lsu_lsc_ctl.scala 152:75]
  wire  _T_70 = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 154:34]
  wire  _T_71 = ~io_lsu_double_ecc_error_r; // @[lsu_lsc_ctl.scala 155:64]
  wire  _T_72 = io_lsu_single_ecc_error_r & _T_71; // @[lsu_lsc_ctl.scala 155:62]
  wire  _T_73 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 155:111]
  wire  _T_74 = _T_72 & _T_73; // @[lsu_lsc_ctl.scala 155:92]
  wire  _T_77 = _T_70 | io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 177:67]
  wire  _T_78 = _T_77 & io_lsu_pkt_m_valid; // @[lsu_lsc_ctl.scala 177:96]
  wire  _T_79 = ~io_lsu_pkt_m_bits_dma; // @[lsu_lsc_ctl.scala 177:119]
  wire  _T_80 = _T_78 & _T_79; // @[lsu_lsc_ctl.scala 177:117]
  wire  _T_81 = ~io_lsu_pkt_m_bits_fast_int; // @[lsu_lsc_ctl.scala 177:144]
  wire  _T_82 = _T_80 & _T_81; // @[lsu_lsc_ctl.scala 177:142]
  wire  _T_83 = ~io_flush_m_up; // @[lsu_lsc_ctl.scala 177:174]
  wire  lsu_error_pkt_m_valid = _T_82 & _T_83; // @[lsu_lsc_ctl.scala 177:172]
  wire  _T_85 = ~lsu_error_pkt_m_valid; // @[lsu_lsc_ctl.scala 178:75]
  wire  _T_86 = io_lsu_single_ecc_error_m & _T_85; // @[lsu_lsc_ctl.scala 178:73]
  wire  lsu_error_pkt_m_bits_single_ecc_error = _T_86 & _T_79; // @[lsu_lsc_ctl.scala 178:99]
  wire  lsu_error_pkt_m_bits_exc_type = ~misaligned_fault_m; // @[lsu_lsc_ctl.scala 180:46]
  wire  _T_91 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_bits_exc_type; // @[lsu_lsc_ctl.scala 181:78]
  wire  _T_92 = ~access_fault_m; // @[lsu_lsc_ctl.scala 181:102]
  wire  _T_93 = _T_91 & _T_92; // @[lsu_lsc_ctl.scala 181:100]
  wire  _T_100 = io_lsu_pkt_m_bits_fast_int & io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 183:166]
  wire  _T_105 = lsu_error_pkt_m_valid | lsu_error_pkt_m_bits_single_ecc_error; // @[lsu_lsc_ctl.scala 184:73]
  wire  _T_106 = _T_105 | io_clk_override; // @[lsu_lsc_ctl.scala 184:113]
  reg  _T_110_bits_inst_type; // @[Reg.scala 27:20]
  reg  _T_110_bits_exc_type; // @[Reg.scala 27:20]
  reg [3:0] _T_110_bits_mscause; // @[Reg.scala 27:20]
  reg [31:0] _T_110_bits_addr; // @[Reg.scala 27:20]
  reg  _T_111; // @[lsu_lsc_ctl.scala 185:83]
  reg  _T_112; // @[lsu_lsc_ctl.scala 186:67]
  reg [1:0] _T_113; // @[lsu_lsc_ctl.scala 187:75]
  wire  dma_pkt_d_bits_load = ~io_dma_lsc_ctl_dma_mem_write; // @[lsu_lsc_ctl.scala 195:30]
  wire  dma_pkt_d_bits_by = io_dma_lsc_ctl_dma_mem_sz == 3'h0; // @[lsu_lsc_ctl.scala 196:62]
  wire  dma_pkt_d_bits_half = io_dma_lsc_ctl_dma_mem_sz == 3'h1; // @[lsu_lsc_ctl.scala 197:62]
  wire  dma_pkt_d_bits_word = io_dma_lsc_ctl_dma_mem_sz == 3'h2; // @[lsu_lsc_ctl.scala 198:62]
  wire  dma_pkt_d_bits_dword = io_dma_lsc_ctl_dma_mem_sz == 3'h3; // @[lsu_lsc_ctl.scala 199:62]
  wire  _T_125 = ~io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 212:64]
  wire  _T_126 = io_flush_m_up & _T_125; // @[lsu_lsc_ctl.scala 212:61]
  wire  _T_127 = ~_T_126; // @[lsu_lsc_ctl.scala 212:45]
  wire  _T_128 = io_lsu_p_valid & _T_127; // @[lsu_lsc_ctl.scala 212:43]
  wire  _T_130 = ~io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 213:68]
  wire  _T_131 = io_flush_m_up & _T_130; // @[lsu_lsc_ctl.scala 213:65]
  wire  _T_132 = ~_T_131; // @[lsu_lsc_ctl.scala 213:49]
  wire  _T_135 = io_flush_m_up & _T_79; // @[lsu_lsc_ctl.scala 214:65]
  wire  _T_136 = ~_T_135; // @[lsu_lsc_ctl.scala 214:49]
  reg  _T_139_bits_fast_int; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_stack; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_by; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_half; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_word; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_dword; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_load; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_store; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_unsign; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_dma; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_139_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_141_bits_fast_int; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_stack; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_by; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_half; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_word; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_dword; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_load; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_store; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_unsign; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_dma; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_142; // @[lsu_lsc_ctl.scala 218:65]
  reg  _T_143; // @[lsu_lsc_ctl.scala 219:65]
  wire [5:0] _T_146 = {io_dma_lsc_ctl_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_mem_wdata_shifted = io_dma_lsc_ctl_dma_mem_wdata >> _T_146; // @[lsu_lsc_ctl.scala 221:66]
  reg  _T_154; // @[lsu_lsc_ctl.scala 225:47]
  reg  _T_156; // @[lsu_lsc_ctl.scala 225:109]
  wire  int_ = _T_154 != _T_156; // @[lsu_lsc_ctl.scala 225:71]
  reg  _T_158; // @[lsu_lsc_ctl.scala 226:48]
  reg  _T_160; // @[lsu_lsc_ctl.scala 226:110]
  wire  int1 = _T_158 != _T_160; // @[lsu_lsc_ctl.scala 226:72]
  reg [31:0] store_data_pre_m; // @[lsu_lsc_ctl.scala 229:72]
  reg [31:0] _T_161; // @[lsu_lsc_ctl.scala 230:62]
  reg [31:0] _T_162; // @[lsu_lsc_ctl.scala 231:62]
  reg [28:0] end_addr_pre_m; // @[Reg.scala 27:20]
  wire [28:0] _T_164 = int_ ? end_addr_pre_m : io_lsu_addr_m[31:3]; // @[lsu_lsc_ctl.scala 232:27]
  reg [2:0] _T_166; // @[lsu_lsc_ctl.scala 232:103]
  reg [28:0] end_addr_pre_r; // @[Reg.scala 27:20]
  wire [28:0] _T_169 = int1 ? end_addr_pre_r : io_lsu_addr_r[31:3]; // @[lsu_lsc_ctl.scala 233:27]
  reg [2:0] _T_171; // @[lsu_lsc_ctl.scala 233:104]
  wire  _T_174 = io_lsu_pkt_d_valid & io_ldst_dual_d; // @[lsu_lsc_ctl.scala 234:69]
  wire  _T_175 = _T_174 | io_clk_override; // @[lsu_lsc_ctl.scala 234:87]
  wire  _T_179 = io_lsu_pkt_m_valid & int_; // @[lsu_lsc_ctl.scala 235:69]
  wire  _T_180 = _T_179 | io_clk_override; // @[lsu_lsc_ctl.scala 235:76]
  reg  _T_183; // @[lsu_lsc_ctl.scala 236:62]
  reg  _T_184; // @[lsu_lsc_ctl.scala 237:62]
  reg  _T_185; // @[lsu_lsc_ctl.scala 238:62]
  reg  _T_186; // @[lsu_lsc_ctl.scala 239:62]
  reg  _T_187; // @[lsu_lsc_ctl.scala 240:62]
  reg  addr_external_r; // @[lsu_lsc_ctl.scala 241:66]
  wire  _T_188 = io_addr_external_m | io_clk_override; // @[lsu_lsc_ctl.scala 242:77]
  reg [31:0] bus_read_data_r; // @[Reg.scala 27:20]
  wire  _T_191 = io_lsu_pkt_r_bits_store | io_lsu_pkt_r_bits_load; // @[lsu_lsc_ctl.scala 249:68]
  wire  _T_192 = io_lsu_pkt_r_valid & _T_191; // @[lsu_lsc_ctl.scala 249:41]
  wire  _T_193 = ~io_flush_r; // @[lsu_lsc_ctl.scala 249:96]
  wire  _T_194 = _T_192 & _T_193; // @[lsu_lsc_ctl.scala 249:94]
  wire  _T_195 = ~io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 249:110]
  wire  _T_198 = ~io_addr_in_pic_m; // @[lsu_lsc_ctl.scala 250:69]
  wire [31:0] _T_200 = _T_198 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_201 = io_picm_mask_data_m | _T_200; // @[lsu_lsc_ctl.scala 250:59]
  wire [31:0] _T_203 = io_lsu_pkt_m_bits_store_data_bypass_m ? io_lsu_exu_lsu_result_m : store_data_pre_m; // @[lsu_lsc_ctl.scala 250:94]
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? io_bus_read_data_m : io_lsu_ld_data_m; // @[lsu_lsc_ctl.scala 271:33]
  wire [31:0] lsu_ld_datafn_corr_r = addr_external_r ? bus_read_data_r : io_lsu_ld_data_corr_r; // @[lsu_lsc_ctl.scala 272:33]
  wire  _T_208 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 273:74]
  wire [31:0] _T_210 = _T_208 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_212 = {24'h0,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_213 = _T_210 & _T_212; // @[lsu_lsc_ctl.scala 273:102]
  wire  _T_214 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 274:43]
  wire [31:0] _T_216 = _T_214 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_218 = {16'h0,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_219 = _T_216 & _T_218; // @[lsu_lsc_ctl.scala 274:71]
  wire [31:0] _T_220 = _T_213 | _T_219; // @[lsu_lsc_ctl.scala 273:141]
  wire  _T_221 = ~io_lsu_pkt_m_bits_unsign; // @[lsu_lsc_ctl.scala 275:17]
  wire  _T_222 = _T_221 & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 275:43]
  wire [31:0] _T_224 = _T_222 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_227 = lsu_ld_datafn_m[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_229 = {_T_227,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_230 = _T_224 & _T_229; // @[lsu_lsc_ctl.scala 275:71]
  wire [31:0] _T_231 = _T_220 | _T_230; // @[lsu_lsc_ctl.scala 274:114]
  wire  _T_233 = _T_221 & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 276:43]
  wire [31:0] _T_235 = _T_233 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_238 = lsu_ld_datafn_m[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_240 = {_T_238,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_241 = _T_235 & _T_240; // @[lsu_lsc_ctl.scala 276:71]
  wire [31:0] _T_242 = _T_231 | _T_241; // @[lsu_lsc_ctl.scala 275:134]
  wire [31:0] _T_244 = io_lsu_pkt_m_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_246 = _T_244 & lsu_ld_datafn_m; // @[lsu_lsc_ctl.scala 277:43]
  wire  _T_248 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 278:66]
  wire [31:0] _T_250 = _T_248 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_252 = {24'h0,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_253 = _T_250 & _T_252; // @[lsu_lsc_ctl.scala 278:94]
  wire  _T_254 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 279:43]
  wire [31:0] _T_256 = _T_254 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_258 = {16'h0,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_259 = _T_256 & _T_258; // @[lsu_lsc_ctl.scala 279:71]
  wire [31:0] _T_260 = _T_253 | _T_259; // @[lsu_lsc_ctl.scala 278:138]
  wire  _T_261 = ~io_lsu_pkt_r_bits_unsign; // @[lsu_lsc_ctl.scala 280:17]
  wire  _T_262 = _T_261 & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 280:43]
  wire [31:0] _T_264 = _T_262 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_267 = lsu_ld_datafn_corr_r[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_269 = {_T_267,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_270 = _T_264 & _T_269; // @[lsu_lsc_ctl.scala 280:71]
  wire [31:0] _T_271 = _T_260 | _T_270; // @[lsu_lsc_ctl.scala 279:119]
  wire  _T_273 = _T_261 & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 281:43]
  wire [31:0] _T_275 = _T_273 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_278 = lsu_ld_datafn_corr_r[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_280 = {_T_278,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_281 = _T_275 & _T_280; // @[lsu_lsc_ctl.scala 281:71]
  wire [31:0] _T_282 = _T_271 | _T_281; // @[lsu_lsc_ctl.scala 280:144]
  wire [31:0] _T_284 = io_lsu_pkt_r_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_286 = _T_284 & lsu_ld_datafn_corr_r; // @[lsu_lsc_ctl.scala 282:43]
  lsu_addrcheck addrcheck ( // @[lsu_lsc_ctl.scala 117:25]
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
  rvclkhdr rvclkhdr ( // @[lib.scala 417:23]
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 404:23]
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  assign io_lsu_exu_lsu_result_m = _T_242 | _T_246; // @[lsu_lsc_ctl.scala 273:35]
  assign io_lsu_result_corr_r = _T_282 | _T_286; // @[lsu_lsc_ctl.scala 278:27]
  assign io_lsu_addr_d = {_T_41,_T_11[11:0]}; // @[lsu_lsc_ctl.scala 247:28]
  assign io_lsu_addr_m = _T_161; // @[lsu_lsc_ctl.scala 230:24]
  assign io_lsu_addr_r = _T_162; // @[lsu_lsc_ctl.scala 231:24]
  assign io_end_addr_d = rs1_d + _T_65; // @[lsu_lsc_ctl.scala 114:24]
  assign io_end_addr_m = {_T_164,_T_166}; // @[lsu_lsc_ctl.scala 232:17]
  assign io_end_addr_r = {_T_169,_T_171}; // @[lsu_lsc_ctl.scala 233:17]
  assign io_store_data_m = _T_201 & _T_203; // @[lsu_lsc_ctl.scala 250:29]
  assign io_lsu_exc_m = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 154:16]
  assign io_is_sideeffects_m = addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 127:42]
  assign io_lsu_commit_r = _T_194 & _T_195; // @[lsu_lsc_ctl.scala 249:19]
  assign io_lsu_single_ecc_error_incr = _T_74 & io_lsu_pkt_r_valid; // @[lsu_lsc_ctl.scala 155:32]
  assign io_lsu_error_pkt_r_valid = _T_112; // @[lsu_lsc_ctl.scala 184:24 lsu_lsc_ctl.scala 186:30]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = _T_111; // @[lsu_lsc_ctl.scala 184:24 lsu_lsc_ctl.scala 185:46]
  assign io_lsu_error_pkt_r_bits_inst_type = _T_110_bits_inst_type; // @[lsu_lsc_ctl.scala 184:24]
  assign io_lsu_error_pkt_r_bits_exc_type = _T_110_bits_exc_type; // @[lsu_lsc_ctl.scala 184:24]
  assign io_lsu_error_pkt_r_bits_mscause = _T_110_bits_mscause; // @[lsu_lsc_ctl.scala 184:24]
  assign io_lsu_error_pkt_r_bits_addr = _T_110_bits_addr; // @[lsu_lsc_ctl.scala 184:24]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r[31:1]; // @[lsu_lsc_ctl.scala 245:28]
  assign io_lsu_fir_error = _T_113; // @[lsu_lsc_ctl.scala 187:38]
  assign io_addr_in_dccm_d = addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 128:42]
  assign io_addr_in_dccm_m = _T_183; // @[lsu_lsc_ctl.scala 236:24]
  assign io_addr_in_dccm_r = _T_184; // @[lsu_lsc_ctl.scala 237:24]
  assign io_addr_in_pic_d = addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 129:42]
  assign io_addr_in_pic_m = _T_185; // @[lsu_lsc_ctl.scala 238:24]
  assign io_addr_in_pic_r = _T_186; // @[lsu_lsc_ctl.scala 239:24]
  assign io_addr_external_m = _T_187; // @[lsu_lsc_ctl.scala 240:24]
  assign io_lsu_pkt_d_valid = _T_128 | io_dma_lsc_ctl_dma_dccm_req; // @[lsu_lsc_ctl.scala 208:20 lsu_lsc_ctl.scala 212:24]
  assign io_lsu_pkt_d_bits_fast_int = io_dec_lsu_valid_raw_d & io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_stack = io_dec_lsu_valid_raw_d & io_lsu_p_bits_stack; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_by = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_by : dma_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_half = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_half : dma_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_word = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_word : dma_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_dword = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_dword : dma_pkt_d_bits_dword; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_load = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_load : dma_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_store = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_store : io_dma_lsc_ctl_dma_mem_write; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_unsign = io_dec_lsu_valid_raw_d & io_lsu_p_bits_unsign; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_dma = io_dec_lsu_valid_raw_d ? io_lsu_p_bits_dma : 1'h1; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_store_data_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_load_ldst_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_d_bits_store_data_bypass_m = io_dec_lsu_valid_raw_d & io_lsu_p_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 208:20]
  assign io_lsu_pkt_m_valid = _T_142; // @[lsu_lsc_ctl.scala 216:28 lsu_lsc_ctl.scala 218:28]
  assign io_lsu_pkt_m_bits_fast_int = _T_139_bits_fast_int; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_stack = _T_139_bits_stack; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_by = _T_139_bits_by; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_half = _T_139_bits_half; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_word = _T_139_bits_word; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_dword = _T_139_bits_dword; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_load = _T_139_bits_load; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_store = _T_139_bits_store; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_unsign = _T_139_bits_unsign; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_dma = _T_139_bits_dma; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_store_data_bypass_d = _T_139_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_load_ldst_bypass_d = _T_139_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_store_data_bypass_m = _T_139_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_valid = _T_143; // @[lsu_lsc_ctl.scala 217:28 lsu_lsc_ctl.scala 219:28]
  assign io_lsu_pkt_r_bits_fast_int = _T_141_bits_fast_int; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_stack = _T_141_bits_stack; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_by = _T_141_bits_by; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_half = _T_141_bits_half; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_word = _T_141_bits_word; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_dword = _T_141_bits_dword; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_load = _T_141_bits_load; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_store = _T_141_bits_store; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_unsign = _T_141_bits_unsign; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_dma = _T_141_bits_dma; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_store_data_bypass_d = _T_141_bits_store_data_bypass_d; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_load_ldst_bypass_d = _T_141_bits_load_ldst_bypass_d; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_store_data_bypass_m = _T_141_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 217:28]
  assign addrcheck_reset = reset;
  assign addrcheck_io_lsu_c2_m_clk = io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 119:42]
  assign addrcheck_io_start_addr_d = {_T_41,_T_11[11:0]}; // @[lsu_lsc_ctl.scala 121:42]
  assign addrcheck_io_end_addr_d = rs1_d + _T_65; // @[lsu_lsc_ctl.scala 122:42]
  assign addrcheck_io_lsu_pkt_d_valid = io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_fast_int = io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_by = io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_half = io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_word = io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_load = io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_store = io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_bits_dma = io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_rs1_region_d = rs1_d[31:28]; // @[lsu_lsc_ctl.scala 125:42]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 419:18]
  assign rvclkhdr_io_en = _T_105 | io_clk_override; // @[lib.scala 420:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_1_io_en = _T_174 | io_clk_override; // @[lib.scala 407:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_2_io_en = _T_179 | io_clk_override; // @[lib.scala 407:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 406:18]
  assign rvclkhdr_3_io_en = io_addr_external_m | io_clk_override; // @[lib.scala 407:17]
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
  _T_110_bits_inst_type = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_110_bits_exc_type = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_110_bits_mscause = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  _T_110_bits_addr = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  _T_111 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_112 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_113 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  _T_139_bits_fast_int = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_139_bits_stack = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_139_bits_by = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_139_bits_half = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_139_bits_word = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_139_bits_dword = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_139_bits_load = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_139_bits_store = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_139_bits_unsign = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_139_bits_dma = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_139_bits_store_data_bypass_d = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_139_bits_load_ldst_bypass_d = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_139_bits_store_data_bypass_m = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_141_bits_fast_int = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_141_bits_stack = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_141_bits_by = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_141_bits_half = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_141_bits_word = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_141_bits_dword = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_141_bits_load = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  _T_141_bits_store = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  _T_141_bits_unsign = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  _T_141_bits_dma = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  _T_141_bits_store_data_bypass_d = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  _T_141_bits_load_ldst_bypass_d = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  _T_141_bits_store_data_bypass_m = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  _T_142 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  _T_143 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  _T_154 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  _T_156 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  _T_158 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  _T_160 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  store_data_pre_m = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  _T_161 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  _T_162 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  end_addr_pre_m = _RAND_47[28:0];
  _RAND_48 = {1{`RANDOM}};
  _T_166 = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  end_addr_pre_r = _RAND_49[28:0];
  _RAND_50 = {1{`RANDOM}};
  _T_171 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  _T_183 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_184 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_185 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  _T_186 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  _T_187 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  addr_external_r = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  bus_read_data_r = _RAND_57[31:0];
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
    _T_110_bits_inst_type = 1'h0;
  end
  if (reset) begin
    _T_110_bits_exc_type = 1'h0;
  end
  if (reset) begin
    _T_110_bits_mscause = 4'h0;
  end
  if (reset) begin
    _T_110_bits_addr = 32'h0;
  end
  if (reset) begin
    _T_111 = 1'h0;
  end
  if (reset) begin
    _T_112 = 1'h0;
  end
  if (reset) begin
    _T_113 = 2'h0;
  end
  if (reset) begin
    _T_139_bits_fast_int = 1'h0;
  end
  if (reset) begin
    _T_139_bits_stack = 1'h0;
  end
  if (reset) begin
    _T_139_bits_by = 1'h0;
  end
  if (reset) begin
    _T_139_bits_half = 1'h0;
  end
  if (reset) begin
    _T_139_bits_word = 1'h0;
  end
  if (reset) begin
    _T_139_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_139_bits_load = 1'h0;
  end
  if (reset) begin
    _T_139_bits_store = 1'h0;
  end
  if (reset) begin
    _T_139_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_139_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_139_bits_store_data_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_139_bits_load_ldst_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_139_bits_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_141_bits_fast_int = 1'h0;
  end
  if (reset) begin
    _T_141_bits_stack = 1'h0;
  end
  if (reset) begin
    _T_141_bits_by = 1'h0;
  end
  if (reset) begin
    _T_141_bits_half = 1'h0;
  end
  if (reset) begin
    _T_141_bits_word = 1'h0;
  end
  if (reset) begin
    _T_141_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_141_bits_load = 1'h0;
  end
  if (reset) begin
    _T_141_bits_store = 1'h0;
  end
  if (reset) begin
    _T_141_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_141_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_141_bits_store_data_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_141_bits_load_ldst_bypass_d = 1'h0;
  end
  if (reset) begin
    _T_141_bits_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_142 = 1'h0;
  end
  if (reset) begin
    _T_143 = 1'h0;
  end
  if (reset) begin
    _T_154 = 1'h0;
  end
  if (reset) begin
    _T_156 = 1'h0;
  end
  if (reset) begin
    _T_158 = 1'h0;
  end
  if (reset) begin
    _T_160 = 1'h0;
  end
  if (reset) begin
    store_data_pre_m = 32'h0;
  end
  if (reset) begin
    _T_161 = 32'h0;
  end
  if (reset) begin
    _T_162 = 32'h0;
  end
  if (reset) begin
    end_addr_pre_m = 29'h0;
  end
  if (reset) begin
    _T_166 = 3'h0;
  end
  if (reset) begin
    end_addr_pre_r = 29'h0;
  end
  if (reset) begin
    _T_171 = 3'h0;
  end
  if (reset) begin
    _T_183 = 1'h0;
  end
  if (reset) begin
    _T_184 = 1'h0;
  end
  if (reset) begin
    _T_185 = 1'h0;
  end
  if (reset) begin
    _T_186 = 1'h0;
  end
  if (reset) begin
    _T_187 = 1'h0;
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_110_bits_inst_type <= 1'h0;
    end else if (_T_106) begin
      _T_110_bits_inst_type <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_110_bits_exc_type <= 1'h0;
    end else if (_T_106) begin
      _T_110_bits_exc_type <= lsu_error_pkt_m_bits_exc_type;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_110_bits_mscause <= 4'h0;
    end else if (_T_106) begin
      if (_T_93) begin
        _T_110_bits_mscause <= 4'h1;
      end else begin
        _T_110_bits_mscause <= exc_mscause_m;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_110_bits_addr <= 32'h0;
    end else if (_T_106) begin
      _T_110_bits_addr <= io_lsu_addr_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_111 <= 1'h0;
    end else begin
      _T_111 <= _T_86 & _T_79;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_112 <= 1'h0;
    end else begin
      _T_112 <= _T_82 & _T_83;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_113 <= 2'h0;
    end else if (fir_nondccm_access_error_m) begin
      _T_113 <= 2'h3;
    end else if (fir_dccm_access_error_m) begin
      _T_113 <= 2'h2;
    end else if (_T_100) begin
      _T_113 <= 2'h1;
    end else begin
      _T_113 <= 2'h0;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_fast_int <= 1'h0;
    end else begin
      _T_139_bits_fast_int <= io_lsu_pkt_d_bits_fast_int;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_stack <= 1'h0;
    end else begin
      _T_139_bits_stack <= io_lsu_pkt_d_bits_stack;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_by <= 1'h0;
    end else begin
      _T_139_bits_by <= io_lsu_pkt_d_bits_by;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_half <= 1'h0;
    end else begin
      _T_139_bits_half <= io_lsu_pkt_d_bits_half;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_word <= 1'h0;
    end else begin
      _T_139_bits_word <= io_lsu_pkt_d_bits_word;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_dword <= 1'h0;
    end else begin
      _T_139_bits_dword <= io_lsu_pkt_d_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_load <= 1'h0;
    end else begin
      _T_139_bits_load <= io_lsu_pkt_d_bits_load;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_store <= 1'h0;
    end else begin
      _T_139_bits_store <= io_lsu_pkt_d_bits_store;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_unsign <= 1'h0;
    end else begin
      _T_139_bits_unsign <= io_lsu_pkt_d_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_dma <= 1'h0;
    end else begin
      _T_139_bits_dma <= io_lsu_pkt_d_bits_dma;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_store_data_bypass_d <= 1'h0;
    end else begin
      _T_139_bits_store_data_bypass_d <= io_lsu_pkt_d_bits_store_data_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_load_ldst_bypass_d <= 1'h0;
    end else begin
      _T_139_bits_load_ldst_bypass_d <= io_lsu_pkt_d_bits_load_ldst_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_139_bits_store_data_bypass_m <= 1'h0;
    end else begin
      _T_139_bits_store_data_bypass_m <= io_lsu_pkt_d_bits_store_data_bypass_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_fast_int <= 1'h0;
    end else begin
      _T_141_bits_fast_int <= io_lsu_pkt_m_bits_fast_int;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_stack <= 1'h0;
    end else begin
      _T_141_bits_stack <= io_lsu_pkt_m_bits_stack;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_by <= 1'h0;
    end else begin
      _T_141_bits_by <= io_lsu_pkt_m_bits_by;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_half <= 1'h0;
    end else begin
      _T_141_bits_half <= io_lsu_pkt_m_bits_half;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_word <= 1'h0;
    end else begin
      _T_141_bits_word <= io_lsu_pkt_m_bits_word;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_dword <= 1'h0;
    end else begin
      _T_141_bits_dword <= io_lsu_pkt_m_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_load <= 1'h0;
    end else begin
      _T_141_bits_load <= io_lsu_pkt_m_bits_load;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_store <= 1'h0;
    end else begin
      _T_141_bits_store <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_unsign <= 1'h0;
    end else begin
      _T_141_bits_unsign <= io_lsu_pkt_m_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_dma <= 1'h0;
    end else begin
      _T_141_bits_dma <= io_lsu_pkt_m_bits_dma;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_store_data_bypass_d <= 1'h0;
    end else begin
      _T_141_bits_store_data_bypass_d <= io_lsu_pkt_m_bits_store_data_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_load_ldst_bypass_d <= 1'h0;
    end else begin
      _T_141_bits_load_ldst_bypass_d <= io_lsu_pkt_m_bits_load_ldst_bypass_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_141_bits_store_data_bypass_m <= 1'h0;
    end else begin
      _T_141_bits_store_data_bypass_m <= io_lsu_pkt_m_bits_store_data_bypass_m;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_142 <= 1'h0;
    end else begin
      _T_142 <= io_lsu_pkt_d_valid & _T_132;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_143 <= 1'h0;
    end else begin
      _T_143 <= io_lsu_pkt_m_valid & _T_136;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_154 <= 1'h0;
    end else begin
      _T_154 <= io_lsu_addr_d[2];
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_156 <= 1'h0;
    end else begin
      _T_156 <= io_end_addr_d[2];
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_158 <= 1'h0;
    end else begin
      _T_158 <= io_lsu_addr_m[2];
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_160 <= 1'h0;
    end else begin
      _T_160 <= io_end_addr_m[2];
    end
  end
  always @(posedge io_lsu_store_c1_m_clk or posedge reset) begin
    if (reset) begin
      store_data_pre_m <= 32'h0;
    end else if (io_lsu_pkt_d_bits_store_data_bypass_d) begin
      store_data_pre_m <= io_lsu_exu_lsu_result_m;
    end else if (io_dma_lsc_ctl_dma_dccm_req) begin
      store_data_pre_m <= dma_mem_wdata_shifted[31:0];
    end else begin
      store_data_pre_m <= io_lsu_exu_exu_lsu_rs2_d;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_161 <= 32'h0;
    end else begin
      _T_161 <= io_lsu_addr_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_162 <= 32'h0;
    end else begin
      _T_162 <= io_lsu_addr_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      end_addr_pre_m <= 29'h0;
    end else if (_T_175) begin
      end_addr_pre_m <= io_end_addr_d[31:3];
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_166 <= 3'h0;
    end else begin
      _T_166 <= io_end_addr_d[2:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      end_addr_pre_r <= 29'h0;
    end else if (_T_180) begin
      end_addr_pre_r <= io_end_addr_m[31:3];
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_171 <= 3'h0;
    end else begin
      _T_171 <= io_end_addr_m[2:0];
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_183 <= 1'h0;
    end else begin
      _T_183 <= io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_184 <= 1'h0;
    end else begin
      _T_184 <= io_addr_in_dccm_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_185 <= 1'h0;
    end else begin
      _T_185 <= io_addr_in_pic_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_186 <= 1'h0;
    end else begin
      _T_186 <= io_addr_in_pic_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_187 <= 1'h0;
    end else begin
      _T_187 <= addrcheck_io_addr_external_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      addr_external_r <= 1'h0;
    end else begin
      addr_external_r <= io_addr_external_m;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      bus_read_data_r <= 32'h0;
    end else if (_T_188) begin
      bus_read_data_r <= io_bus_read_data_m;
    end
  end
endmodule
