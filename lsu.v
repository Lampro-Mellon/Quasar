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
  wire  start_addr_in_dccm_region_d = io_start_addr_d[31:28] == 4'hf; // @[lib.scala 356:49]
  wire  start_addr_in_dccm_d = io_start_addr_d[31:16] == 16'hf004; // @[lib.scala 361:39]
  wire  end_addr_in_dccm_region_d = io_end_addr_d[31:28] == 4'hf; // @[lib.scala 356:49]
  wire  end_addr_in_dccm_d = io_end_addr_d[31:16] == 16'hf004; // @[lib.scala 361:39]
  wire  addr_in_iccm = io_start_addr_d[31:28] == 4'he; // @[lsu_addrcheck.scala 42:45]
  wire  start_addr_in_pic_d = io_start_addr_d[31:15] == 17'h1e018; // @[lib.scala 361:39]
  wire  end_addr_in_pic_d = io_end_addr_d[31:15] == 17'h1e018; // @[lib.scala 361:39]
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
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
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
  assign io_l1clk = clkhdr_Q; // @[lib.scala 335:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = io_scan_mode; // @[lib.scala 338:18]
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
  output        io_lsu_pkt_r_bits_dma,
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
`endif // RANDOMIZE_REG_INIT
  wire  addrcheck_reset; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 118:25]
  wire [31:0] addrcheck_io_start_addr_d; // @[lsu_lsc_ctl.scala 118:25]
  wire [31:0] addrcheck_io_end_addr_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 118:25]
  wire [31:0] addrcheck_io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 118:25]
  wire [3:0] addrcheck_io_rs1_region_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_addr_external_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_access_fault_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_misaligned_fault_d; // @[lsu_lsc_ctl.scala 118:25]
  wire [3:0] addrcheck_io_exc_mscause_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_fir_dccm_access_error_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  addrcheck_io_fir_nondccm_access_error_d; // @[lsu_lsc_ctl.scala 118:25]
  wire  rvclkhdr_io_l1clk; // @[lib.scala 378:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 378:23]
  wire  rvclkhdr_io_en; // @[lib.scala 378:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 378:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire [31:0] lsu_rs1_d = io_dec_lsu_valid_raw_d ? io_lsu_exu_exu_lsu_rs1_d : io_dma_lsc_ctl_dma_mem_addr; // @[lsu_lsc_ctl.scala 100:28]
  wire [11:0] _T_3 = io_dec_lsu_valid_raw_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [11:0] lsu_offset_d = io_dec_lsu_offset_d & _T_3; // @[lsu_lsc_ctl.scala 101:51]
  wire [31:0] rs1_d = io_lsu_pkt_d_bits_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[lsu_lsc_ctl.scala 104:28]
  wire [12:0] _T_6 = {1'h0,rs1_d[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_8 = {1'h0,lsu_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _T_10 = _T_6 + _T_8; // @[lib.scala 92:39]
  wire  _T_13 = lsu_offset_d[11] ^ _T_10[12]; // @[lib.scala 93:46]
  wire  _T_14 = ~_T_13; // @[lib.scala 93:33]
  wire [19:0] _T_16 = _T_14 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_18 = _T_16 & rs1_d[31:12]; // @[lib.scala 93:58]
  wire  _T_20 = ~lsu_offset_d[11]; // @[lib.scala 94:18]
  wire  _T_22 = _T_20 & _T_10[12]; // @[lib.scala 94:30]
  wire [19:0] _T_24 = _T_22 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_27 = rs1_d[31:12] + 20'h1; // @[lib.scala 94:54]
  wire [19:0] _T_28 = _T_24 & _T_27; // @[lib.scala 94:41]
  wire [19:0] _T_29 = _T_18 | _T_28; // @[lib.scala 93:72]
  wire  _T_32 = ~_T_10[12]; // @[lib.scala 95:31]
  wire  _T_33 = lsu_offset_d[11] & _T_32; // @[lib.scala 95:29]
  wire [19:0] _T_35 = _T_33 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_38 = rs1_d[31:12] - 20'h1; // @[lib.scala 95:54]
  wire [19:0] _T_39 = _T_35 & _T_38; // @[lib.scala 95:41]
  wire [19:0] _T_40 = _T_29 | _T_39; // @[lib.scala 94:61]
  wire [2:0] _T_43 = io_lsu_pkt_d_bits_half ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_44 = _T_43 & 3'h1; // @[lsu_lsc_ctl.scala 109:58]
  wire [2:0] _T_46 = io_lsu_pkt_d_bits_word ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_47 = _T_46 & 3'h3; // @[lsu_lsc_ctl.scala 110:40]
  wire [2:0] _T_48 = _T_44 | _T_47; // @[lsu_lsc_ctl.scala 109:70]
  wire [2:0] _T_50 = io_lsu_pkt_d_bits_dword ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] addr_offset_d = _T_48 | _T_50; // @[lsu_lsc_ctl.scala 110:52]
  wire [12:0] _T_54 = {lsu_offset_d[11],lsu_offset_d}; // @[Cat.scala 29:58]
  wire [11:0] _T_57 = {9'h0,addr_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _GEN_0 = {{1'd0}, _T_57}; // @[lsu_lsc_ctl.scala 113:60]
  wire [12:0] end_addr_offset_d = _T_54 + _GEN_0; // @[lsu_lsc_ctl.scala 113:60]
  wire [18:0] _T_62 = end_addr_offset_d[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_64 = {_T_62,end_addr_offset_d}; // @[Cat.scala 29:58]
  reg  access_fault_m; // @[lsu_lsc_ctl.scala 149:75]
  reg  misaligned_fault_m; // @[lsu_lsc_ctl.scala 150:75]
  reg [3:0] exc_mscause_m; // @[lsu_lsc_ctl.scala 151:75]
  reg  fir_dccm_access_error_m; // @[lsu_lsc_ctl.scala 152:75]
  reg  fir_nondccm_access_error_m; // @[lsu_lsc_ctl.scala 153:75]
  wire  _T_69 = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 155:34]
  wire  _T_70 = ~io_lsu_double_ecc_error_r; // @[lsu_lsc_ctl.scala 156:64]
  wire  _T_71 = io_lsu_single_ecc_error_r & _T_70; // @[lsu_lsc_ctl.scala 156:62]
  wire  _T_72 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 156:111]
  wire  _T_73 = _T_71 & _T_72; // @[lsu_lsc_ctl.scala 156:92]
  wire  _T_76 = _T_69 | io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 178:67]
  wire  _T_77 = _T_76 & io_lsu_pkt_m_valid; // @[lsu_lsc_ctl.scala 178:96]
  wire  _T_78 = ~io_lsu_pkt_m_bits_dma; // @[lsu_lsc_ctl.scala 178:119]
  wire  _T_79 = _T_77 & _T_78; // @[lsu_lsc_ctl.scala 178:117]
  wire  _T_80 = ~io_lsu_pkt_m_bits_fast_int; // @[lsu_lsc_ctl.scala 178:144]
  wire  _T_81 = _T_79 & _T_80; // @[lsu_lsc_ctl.scala 178:142]
  wire  _T_82 = ~io_flush_m_up; // @[lsu_lsc_ctl.scala 178:174]
  wire  lsu_error_pkt_m_valid = _T_81 & _T_82; // @[lsu_lsc_ctl.scala 178:172]
  wire  _T_84 = ~lsu_error_pkt_m_valid; // @[lsu_lsc_ctl.scala 179:75]
  wire  _T_85 = io_lsu_single_ecc_error_m & _T_84; // @[lsu_lsc_ctl.scala 179:73]
  wire  lsu_error_pkt_m_bits_single_ecc_error = _T_85 & _T_78; // @[lsu_lsc_ctl.scala 179:99]
  wire  lsu_error_pkt_m_bits_exc_type = ~misaligned_fault_m; // @[lsu_lsc_ctl.scala 181:46]
  wire  _T_90 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_bits_exc_type; // @[lsu_lsc_ctl.scala 182:78]
  wire  _T_91 = ~access_fault_m; // @[lsu_lsc_ctl.scala 182:102]
  wire  _T_92 = _T_90 & _T_91; // @[lsu_lsc_ctl.scala 182:100]
  wire  _T_99 = io_lsu_pkt_m_bits_fast_int & io_lsu_double_ecc_error_m; // @[lsu_lsc_ctl.scala 184:166]
  wire  _T_104 = lsu_error_pkt_m_valid | lsu_error_pkt_m_bits_single_ecc_error; // @[lsu_lsc_ctl.scala 185:73]
  reg  _T_109_bits_inst_type; // @[lib.scala 384:16]
  reg  _T_109_bits_exc_type; // @[lib.scala 384:16]
  reg [3:0] _T_109_bits_mscause; // @[lib.scala 384:16]
  reg [31:0] _T_109_bits_addr; // @[lib.scala 384:16]
  reg  _T_110; // @[lsu_lsc_ctl.scala 186:83]
  reg  _T_111; // @[lsu_lsc_ctl.scala 187:67]
  reg [1:0] _T_112; // @[lsu_lsc_ctl.scala 188:48]
  wire  dma_pkt_d_bits_load = ~io_dma_lsc_ctl_dma_mem_write; // @[lsu_lsc_ctl.scala 195:30]
  wire  dma_pkt_d_bits_by = io_dma_lsc_ctl_dma_mem_sz == 3'h0; // @[lsu_lsc_ctl.scala 196:62]
  wire  dma_pkt_d_bits_half = io_dma_lsc_ctl_dma_mem_sz == 3'h1; // @[lsu_lsc_ctl.scala 197:62]
  wire  dma_pkt_d_bits_word = io_dma_lsc_ctl_dma_mem_sz == 3'h2; // @[lsu_lsc_ctl.scala 198:62]
  wire  dma_pkt_d_bits_dword = io_dma_lsc_ctl_dma_mem_sz == 3'h3; // @[lsu_lsc_ctl.scala 199:62]
  wire  _T_124 = ~io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 212:64]
  wire  _T_125 = io_flush_m_up & _T_124; // @[lsu_lsc_ctl.scala 212:61]
  wire  _T_126 = ~_T_125; // @[lsu_lsc_ctl.scala 212:45]
  wire  _T_127 = io_lsu_p_valid & _T_126; // @[lsu_lsc_ctl.scala 212:43]
  wire  _T_129 = ~io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 213:68]
  wire  _T_130 = io_flush_m_up & _T_129; // @[lsu_lsc_ctl.scala 213:65]
  wire  _T_131 = ~_T_130; // @[lsu_lsc_ctl.scala 213:49]
  wire  _T_134 = io_flush_m_up & _T_78; // @[lsu_lsc_ctl.scala 214:65]
  wire  _T_135 = ~_T_134; // @[lsu_lsc_ctl.scala 214:49]
  reg  _T_138_bits_fast_int; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_by; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_half; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_word; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_dword; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_load; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_store; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_unsign; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_dma; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_138_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 216:65]
  reg  _T_140_bits_by; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_half; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_word; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_dword; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_load; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_store; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_unsign; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_140_bits_dma; // @[lsu_lsc_ctl.scala 217:65]
  reg  _T_141; // @[lsu_lsc_ctl.scala 218:65]
  reg  _T_142; // @[lsu_lsc_ctl.scala 219:65]
  wire [5:0] _T_145 = {io_dma_lsc_ctl_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_mem_wdata_shifted = io_dma_lsc_ctl_dma_mem_wdata >> _T_145; // @[lsu_lsc_ctl.scala 221:66]
  reg [31:0] store_data_pre_m; // @[lsu_lsc_ctl.scala 225:72]
  reg [31:0] _T_152; // @[lsu_lsc_ctl.scala 226:62]
  reg [31:0] _T_153; // @[lsu_lsc_ctl.scala 227:62]
  wire  _T_167 = io_lsu_pkt_d_valid & io_ldst_dual_d; // @[lsu_lsc_ctl.scala 232:69]
  wire  _T_173 = io_lsu_pkt_m_valid & io_ldst_dual_m; // @[lsu_lsc_ctl.scala 233:69]
  reg [31:0] _T_178; // @[lsu_lsc_ctl.scala 236:62]
  reg [31:0] _T_179; // @[lsu_lsc_ctl.scala 237:62]
  reg  _T_180; // @[lsu_lsc_ctl.scala 238:62]
  reg  _T_181; // @[lsu_lsc_ctl.scala 239:62]
  reg  _T_182; // @[lsu_lsc_ctl.scala 240:62]
  reg  _T_183; // @[lsu_lsc_ctl.scala 241:62]
  reg  _T_184; // @[lsu_lsc_ctl.scala 242:62]
  reg  addr_external_r; // @[lsu_lsc_ctl.scala 243:66]
  reg [31:0] bus_read_data_r; // @[lib.scala 374:16]
  wire  _T_189 = io_lsu_pkt_r_bits_store | io_lsu_pkt_r_bits_load; // @[lsu_lsc_ctl.scala 251:68]
  wire  _T_190 = io_lsu_pkt_r_valid & _T_189; // @[lsu_lsc_ctl.scala 251:41]
  wire  _T_191 = ~io_flush_r; // @[lsu_lsc_ctl.scala 251:96]
  wire  _T_192 = _T_190 & _T_191; // @[lsu_lsc_ctl.scala 251:94]
  wire  _T_193 = ~io_lsu_pkt_r_bits_dma; // @[lsu_lsc_ctl.scala 251:110]
  wire  _T_196 = ~io_addr_in_pic_m; // @[lsu_lsc_ctl.scala 252:69]
  wire [31:0] _T_198 = _T_196 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_199 = io_picm_mask_data_m | _T_198; // @[lsu_lsc_ctl.scala 252:59]
  wire [31:0] _T_201 = io_lsu_pkt_m_bits_store_data_bypass_m ? io_lsu_result_m : store_data_pre_m; // @[lsu_lsc_ctl.scala 252:94]
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? io_bus_read_data_m : io_lsu_ld_data_m; // @[lsu_lsc_ctl.scala 273:33]
  wire [31:0] lsu_ld_datafn_corr_r = addr_external_r ? bus_read_data_r : io_lsu_ld_data_corr_r; // @[lsu_lsc_ctl.scala 274:33]
  wire  _T_207 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 275:66]
  wire [31:0] _T_209 = _T_207 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_211 = {24'h0,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_212 = _T_209 & _T_211; // @[lsu_lsc_ctl.scala 275:94]
  wire  _T_213 = io_lsu_pkt_m_bits_unsign & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 276:43]
  wire [31:0] _T_215 = _T_213 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_217 = {16'h0,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_218 = _T_215 & _T_217; // @[lsu_lsc_ctl.scala 276:71]
  wire [31:0] _T_219 = _T_212 | _T_218; // @[lsu_lsc_ctl.scala 275:133]
  wire  _T_220 = ~io_lsu_pkt_m_bits_unsign; // @[lsu_lsc_ctl.scala 277:17]
  wire  _T_221 = _T_220 & io_lsu_pkt_m_bits_by; // @[lsu_lsc_ctl.scala 277:43]
  wire [31:0] _T_223 = _T_221 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_226 = lsu_ld_datafn_m[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_228 = {_T_226,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_229 = _T_223 & _T_228; // @[lsu_lsc_ctl.scala 277:71]
  wire [31:0] _T_230 = _T_219 | _T_229; // @[lsu_lsc_ctl.scala 276:114]
  wire  _T_232 = _T_220 & io_lsu_pkt_m_bits_half; // @[lsu_lsc_ctl.scala 278:43]
  wire [31:0] _T_234 = _T_232 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_237 = lsu_ld_datafn_m[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_239 = {_T_237,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_240 = _T_234 & _T_239; // @[lsu_lsc_ctl.scala 278:71]
  wire [31:0] _T_241 = _T_230 | _T_240; // @[lsu_lsc_ctl.scala 277:134]
  wire [31:0] _T_243 = io_lsu_pkt_m_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_245 = _T_243 & lsu_ld_datafn_m; // @[lsu_lsc_ctl.scala 279:43]
  wire  _T_247 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 280:66]
  wire [31:0] _T_249 = _T_247 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_251 = {24'h0,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_252 = _T_249 & _T_251; // @[lsu_lsc_ctl.scala 280:94]
  wire  _T_253 = io_lsu_pkt_r_bits_unsign & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 281:43]
  wire [31:0] _T_255 = _T_253 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_257 = {16'h0,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_258 = _T_255 & _T_257; // @[lsu_lsc_ctl.scala 281:71]
  wire [31:0] _T_259 = _T_252 | _T_258; // @[lsu_lsc_ctl.scala 280:138]
  wire  _T_260 = ~io_lsu_pkt_r_bits_unsign; // @[lsu_lsc_ctl.scala 282:17]
  wire  _T_261 = _T_260 & io_lsu_pkt_r_bits_by; // @[lsu_lsc_ctl.scala 282:43]
  wire [31:0] _T_263 = _T_261 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_266 = lsu_ld_datafn_corr_r[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_268 = {_T_266,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_269 = _T_263 & _T_268; // @[lsu_lsc_ctl.scala 282:71]
  wire [31:0] _T_270 = _T_259 | _T_269; // @[lsu_lsc_ctl.scala 281:119]
  wire  _T_272 = _T_260 & io_lsu_pkt_r_bits_half; // @[lsu_lsc_ctl.scala 283:43]
  wire [31:0] _T_274 = _T_272 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_277 = lsu_ld_datafn_corr_r[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_279 = {_T_277,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_280 = _T_274 & _T_279; // @[lsu_lsc_ctl.scala 283:71]
  wire [31:0] _T_281 = _T_270 | _T_280; // @[lsu_lsc_ctl.scala 282:144]
  wire [31:0] _T_283 = io_lsu_pkt_r_bits_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_285 = _T_283 & lsu_ld_datafn_corr_r; // @[lsu_lsc_ctl.scala 284:43]
  lsu_addrcheck addrcheck ( // @[lsu_lsc_ctl.scala 118:25]
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
  rvclkhdr rvclkhdr ( // @[lib.scala 378:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_lsu_result_m = _T_241 | _T_245; // @[lsu_lsc_ctl.scala 275:27]
  assign io_lsu_result_corr_r = _T_281 | _T_285; // @[lsu_lsc_ctl.scala 280:27]
  assign io_lsu_addr_d = {_T_40,_T_10[11:0]}; // @[lsu_lsc_ctl.scala 249:28]
  assign io_lsu_addr_m = _T_152; // @[lsu_lsc_ctl.scala 226:24]
  assign io_lsu_addr_r = _T_153; // @[lsu_lsc_ctl.scala 227:24]
  assign io_end_addr_d = rs1_d + _T_64; // @[lsu_lsc_ctl.scala 115:24]
  assign io_end_addr_m = _T_178; // @[lsu_lsc_ctl.scala 229:17 lsu_lsc_ctl.scala 236:24]
  assign io_end_addr_r = _T_179; // @[lsu_lsc_ctl.scala 230:17 lsu_lsc_ctl.scala 237:24]
  assign io_store_data_m = _T_199 & _T_201; // @[lsu_lsc_ctl.scala 252:29]
  assign io_lsu_exc_m = access_fault_m | misaligned_fault_m; // @[lsu_lsc_ctl.scala 155:16]
  assign io_is_sideeffects_m = addrcheck_io_is_sideeffects_m; // @[lsu_lsc_ctl.scala 128:42]
  assign io_lsu_commit_r = _T_192 & _T_193; // @[lsu_lsc_ctl.scala 251:19]
  assign io_lsu_single_ecc_error_incr = _T_73 & io_lsu_pkt_r_valid; // @[lsu_lsc_ctl.scala 156:32]
  assign io_lsu_error_pkt_r_valid = _T_111; // @[lsu_lsc_ctl.scala 185:24 lsu_lsc_ctl.scala 187:30]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = _T_110; // @[lsu_lsc_ctl.scala 185:24 lsu_lsc_ctl.scala 186:46]
  assign io_lsu_error_pkt_r_bits_inst_type = _T_109_bits_inst_type; // @[lsu_lsc_ctl.scala 185:24]
  assign io_lsu_error_pkt_r_bits_exc_type = _T_109_bits_exc_type; // @[lsu_lsc_ctl.scala 185:24]
  assign io_lsu_error_pkt_r_bits_mscause = _T_109_bits_mscause; // @[lsu_lsc_ctl.scala 185:24]
  assign io_lsu_error_pkt_r_bits_addr = _T_109_bits_addr; // @[lsu_lsc_ctl.scala 185:24]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r[31:1]; // @[lsu_lsc_ctl.scala 247:28]
  assign io_lsu_fir_error = _T_112; // @[lsu_lsc_ctl.scala 188:38]
  assign io_addr_in_dccm_d = addrcheck_io_addr_in_dccm_d; // @[lsu_lsc_ctl.scala 129:42]
  assign io_addr_in_dccm_m = _T_180; // @[lsu_lsc_ctl.scala 238:24]
  assign io_addr_in_dccm_r = _T_181; // @[lsu_lsc_ctl.scala 239:24]
  assign io_addr_in_pic_d = addrcheck_io_addr_in_pic_d; // @[lsu_lsc_ctl.scala 130:42]
  assign io_addr_in_pic_m = _T_182; // @[lsu_lsc_ctl.scala 240:24]
  assign io_addr_in_pic_r = _T_183; // @[lsu_lsc_ctl.scala 241:24]
  assign io_addr_external_m = _T_184; // @[lsu_lsc_ctl.scala 242:24]
  assign io_lsu_pkt_d_valid = _T_127 | io_dma_lsc_ctl_dma_dccm_req; // @[lsu_lsc_ctl.scala 208:20 lsu_lsc_ctl.scala 212:24]
  assign io_lsu_pkt_d_bits_fast_int = io_dec_lsu_valid_raw_d & io_lsu_p_bits_fast_int; // @[lsu_lsc_ctl.scala 208:20]
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
  assign io_lsu_pkt_m_valid = _T_141; // @[lsu_lsc_ctl.scala 216:28 lsu_lsc_ctl.scala 218:28]
  assign io_lsu_pkt_m_bits_fast_int = _T_138_bits_fast_int; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_by = _T_138_bits_by; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_half = _T_138_bits_half; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_word = _T_138_bits_word; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_dword = _T_138_bits_dword; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_load = _T_138_bits_load; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_store = _T_138_bits_store; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_unsign = _T_138_bits_unsign; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_dma = _T_138_bits_dma; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_m_bits_store_data_bypass_m = _T_138_bits_store_data_bypass_m; // @[lsu_lsc_ctl.scala 216:28]
  assign io_lsu_pkt_r_valid = _T_142; // @[lsu_lsc_ctl.scala 217:28 lsu_lsc_ctl.scala 219:28]
  assign io_lsu_pkt_r_bits_by = _T_140_bits_by; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_half = _T_140_bits_half; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_word = _T_140_bits_word; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_dword = _T_140_bits_dword; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_load = _T_140_bits_load; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_store = _T_140_bits_store; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_unsign = _T_140_bits_unsign; // @[lsu_lsc_ctl.scala 217:28]
  assign io_lsu_pkt_r_bits_dma = _T_140_bits_dma; // @[lsu_lsc_ctl.scala 217:28]
  assign addrcheck_reset = reset;
  assign addrcheck_io_lsu_c2_m_clk = io_lsu_c2_m_clk; // @[lsu_lsc_ctl.scala 120:42]
  assign addrcheck_io_start_addr_d = {_T_40,_T_10[11:0]}; // @[lsu_lsc_ctl.scala 122:42]
  assign addrcheck_io_end_addr_d = rs1_d + _T_64; // @[lsu_lsc_ctl.scala 123:42]
  assign addrcheck_io_lsu_pkt_d_valid = io_lsu_pkt_d_valid; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_fast_int = io_lsu_pkt_d_bits_fast_int; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_by = io_lsu_pkt_d_bits_by; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_half = io_lsu_pkt_d_bits_half; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_word = io_lsu_pkt_d_bits_word; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_load = io_lsu_pkt_d_bits_load; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_store = io_lsu_pkt_d_bits_store; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_lsu_pkt_d_bits_dma = io_lsu_pkt_d_bits_dma; // @[lsu_lsc_ctl.scala 124:42]
  assign addrcheck_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[lsu_lsc_ctl.scala 125:42]
  assign addrcheck_io_rs1_region_d = rs1_d[31:28]; // @[lsu_lsc_ctl.scala 126:42]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 380:18]
  assign rvclkhdr_io_en = _T_104 | io_clk_override; // @[lib.scala 381:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 382:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = _T_167 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = _T_173 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = io_addr_external_m | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  _T_109_bits_inst_type = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_109_bits_exc_type = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_109_bits_mscause = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  _T_109_bits_addr = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  _T_110 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_111 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_112 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  _T_138_bits_fast_int = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_138_bits_by = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_138_bits_half = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_138_bits_word = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_138_bits_dword = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_138_bits_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_138_bits_store = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_138_bits_unsign = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_138_bits_dma = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_138_bits_store_data_bypass_m = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_140_bits_by = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_140_bits_half = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_140_bits_word = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_140_bits_dword = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_140_bits_load = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_140_bits_store = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_140_bits_unsign = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_140_bits_dma = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_141 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_142 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  store_data_pre_m = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  _T_152 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  _T_153 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  _T_178 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  _T_179 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  _T_180 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  _T_181 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  _T_182 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  _T_183 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  _T_184 = _RAND_41[0:0];
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
    _T_109_bits_inst_type = 1'h0;
  end
  if (reset) begin
    _T_109_bits_exc_type = 1'h0;
  end
  if (reset) begin
    _T_109_bits_mscause = 4'h0;
  end
  if (reset) begin
    _T_109_bits_addr = 32'h0;
  end
  if (reset) begin
    _T_110 = 1'h0;
  end
  if (reset) begin
    _T_111 = 1'h0;
  end
  if (reset) begin
    _T_112 = 2'h0;
  end
  if (reset) begin
    _T_138_bits_fast_int = 1'h0;
  end
  if (reset) begin
    _T_138_bits_by = 1'h0;
  end
  if (reset) begin
    _T_138_bits_half = 1'h0;
  end
  if (reset) begin
    _T_138_bits_word = 1'h0;
  end
  if (reset) begin
    _T_138_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_138_bits_load = 1'h0;
  end
  if (reset) begin
    _T_138_bits_store = 1'h0;
  end
  if (reset) begin
    _T_138_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_138_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_138_bits_store_data_bypass_m = 1'h0;
  end
  if (reset) begin
    _T_140_bits_by = 1'h0;
  end
  if (reset) begin
    _T_140_bits_half = 1'h0;
  end
  if (reset) begin
    _T_140_bits_word = 1'h0;
  end
  if (reset) begin
    _T_140_bits_dword = 1'h0;
  end
  if (reset) begin
    _T_140_bits_load = 1'h0;
  end
  if (reset) begin
    _T_140_bits_store = 1'h0;
  end
  if (reset) begin
    _T_140_bits_unsign = 1'h0;
  end
  if (reset) begin
    _T_140_bits_dma = 1'h0;
  end
  if (reset) begin
    _T_141 = 1'h0;
  end
  if (reset) begin
    _T_142 = 1'h0;
  end
  if (reset) begin
    store_data_pre_m = 32'h0;
  end
  if (reset) begin
    _T_152 = 32'h0;
  end
  if (reset) begin
    _T_153 = 32'h0;
  end
  if (reset) begin
    _T_178 = 32'h0;
  end
  if (reset) begin
    _T_179 = 32'h0;
  end
  if (reset) begin
    _T_180 = 1'h0;
  end
  if (reset) begin
    _T_181 = 1'h0;
  end
  if (reset) begin
    _T_182 = 1'h0;
  end
  if (reset) begin
    _T_183 = 1'h0;
  end
  if (reset) begin
    _T_184 = 1'h0;
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
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_109_bits_inst_type <= 1'h0;
    end else begin
      _T_109_bits_inst_type <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_109_bits_exc_type <= 1'h0;
    end else begin
      _T_109_bits_exc_type <= ~misaligned_fault_m;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_109_bits_mscause <= 4'h0;
    end else if (_T_92) begin
      _T_109_bits_mscause <= 4'h1;
    end else begin
      _T_109_bits_mscause <= exc_mscause_m;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_109_bits_addr <= 32'h0;
    end else begin
      _T_109_bits_addr <= io_lsu_addr_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_110 <= 1'h0;
    end else begin
      _T_110 <= _T_85 & _T_78;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_111 <= 1'h0;
    end else begin
      _T_111 <= _T_81 & _T_82;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_112 <= 2'h0;
    end else if (fir_nondccm_access_error_m) begin
      _T_112 <= 2'h3;
    end else if (fir_dccm_access_error_m) begin
      _T_112 <= 2'h2;
    end else if (_T_99) begin
      _T_112 <= 2'h1;
    end else begin
      _T_112 <= 2'h0;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_fast_int <= 1'h0;
    end else begin
      _T_138_bits_fast_int <= io_lsu_pkt_d_bits_fast_int;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_by <= 1'h0;
    end else begin
      _T_138_bits_by <= io_lsu_pkt_d_bits_by;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_half <= 1'h0;
    end else begin
      _T_138_bits_half <= io_lsu_pkt_d_bits_half;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_word <= 1'h0;
    end else begin
      _T_138_bits_word <= io_lsu_pkt_d_bits_word;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_dword <= 1'h0;
    end else begin
      _T_138_bits_dword <= io_lsu_pkt_d_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_load <= 1'h0;
    end else begin
      _T_138_bits_load <= io_lsu_pkt_d_bits_load;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_store <= 1'h0;
    end else begin
      _T_138_bits_store <= io_lsu_pkt_d_bits_store;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_unsign <= 1'h0;
    end else begin
      _T_138_bits_unsign <= io_lsu_pkt_d_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_dma <= 1'h0;
    end else begin
      _T_138_bits_dma <= io_lsu_pkt_d_bits_dma;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_138_bits_store_data_bypass_m <= 1'h0;
    end else begin
      _T_138_bits_store_data_bypass_m <= io_lsu_pkt_d_bits_store_data_bypass_m;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_by <= 1'h0;
    end else begin
      _T_140_bits_by <= io_lsu_pkt_m_bits_by;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_half <= 1'h0;
    end else begin
      _T_140_bits_half <= io_lsu_pkt_m_bits_half;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_word <= 1'h0;
    end else begin
      _T_140_bits_word <= io_lsu_pkt_m_bits_word;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_dword <= 1'h0;
    end else begin
      _T_140_bits_dword <= io_lsu_pkt_m_bits_dword;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_load <= 1'h0;
    end else begin
      _T_140_bits_load <= io_lsu_pkt_m_bits_load;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_store <= 1'h0;
    end else begin
      _T_140_bits_store <= io_lsu_pkt_m_bits_store;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_unsign <= 1'h0;
    end else begin
      _T_140_bits_unsign <= io_lsu_pkt_m_bits_unsign;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_140_bits_dma <= 1'h0;
    end else begin
      _T_140_bits_dma <= io_lsu_pkt_m_bits_dma;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_141 <= 1'h0;
    end else begin
      _T_141 <= io_lsu_pkt_d_valid & _T_131;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_142 <= 1'h0;
    end else begin
      _T_142 <= io_lsu_pkt_m_valid & _T_135;
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
      _T_152 <= 32'h0;
    end else begin
      _T_152 <= io_lsu_addr_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_153 <= 32'h0;
    end else begin
      _T_153 <= io_lsu_addr_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_178 <= 32'h0;
    end else begin
      _T_178 <= io_end_addr_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_179 <= 32'h0;
    end else begin
      _T_179 <= io_end_addr_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_180 <= 1'h0;
    end else begin
      _T_180 <= io_addr_in_dccm_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_181 <= 1'h0;
    end else begin
      _T_181 <= io_addr_in_dccm_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_182 <= 1'h0;
    end else begin
      _T_182 <= io_addr_in_pic_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_183 <= 1'h0;
    end else begin
      _T_183 <= io_addr_in_pic_m;
    end
  end
  always @(posedge io_lsu_c1_m_clk or posedge reset) begin
    if (reset) begin
      _T_184 <= 1'h0;
    end else begin
      _T_184 <= addrcheck_io_addr_external_d;
    end
  end
  always @(posedge io_lsu_c1_r_clk or posedge reset) begin
    if (reset) begin
      addr_external_r <= 1'h0;
    end else begin
      addr_external_r <= io_addr_external_m;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      bus_read_data_r <= 32'h0;
    end else begin
      bus_read_data_r <= io_bus_read_data_m;
    end
  end
endmodule
module lsu_dccm_ctl(
  input         clock,
  input         reset,
  input         io_clk_override,
  input         io_lsu_c2_m_clk,
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
  input         io_ldst_dual_m,
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire [63:0] picm_rd_data_m = {io_lsu_pic_picm_rd_data,io_lsu_pic_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_load; // @[lsu_dccm_ctl.scala 145:63]
  wire [7:0] _T_5 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_8 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [1:0] _T_13 = io_addr_in_dccm_m ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_0 = {{6'd0}, _T_13}; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_15 = _GEN_0 & dccm_rdata_corr_m[7:0]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_16 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_15; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_17 = _T_5[0] ? _T_8[7:0] : _T_16; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_21 = {{4'd0}, _T_17[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_23 = {_T_17[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_25 = _T_23 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_26 = _T_21 | _T_25; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_1 = {{2'd0}, _T_26[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_31 = _GEN_1 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_33 = {_T_26[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_35 = _T_33 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_36 = _T_31 | _T_35; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_2 = {{1'd0}, _T_36[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_41 = _GEN_2 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_43 = {_T_36[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_45 = _T_43 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_46 = _T_41 | _T_45; // @[Bitwise.scala 103:39]
  wire [7:0] _T_57 = _GEN_0 & dccm_rdata_corr_m[15:8]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_58 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_57; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_59 = _T_5[1] ? _T_8[15:8] : _T_58; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_63 = {{4'd0}, _T_59[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_65 = {_T_59[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_67 = _T_65 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_68 = _T_63 | _T_67; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_4 = {{2'd0}, _T_68[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_73 = _GEN_4 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_75 = {_T_68[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_77 = _T_75 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_78 = _T_73 | _T_77; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_5 = {{1'd0}, _T_78[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_83 = _GEN_5 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_85 = {_T_78[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_87 = _T_85 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_88 = _T_83 | _T_87; // @[Bitwise.scala 103:39]
  wire [7:0] _T_99 = _GEN_0 & dccm_rdata_corr_m[23:16]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_100 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_99; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_101 = _T_5[2] ? _T_8[23:16] : _T_100; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_105 = {{4'd0}, _T_101[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_107 = {_T_101[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_109 = _T_107 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_110 = _T_105 | _T_109; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_7 = {{2'd0}, _T_110[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_115 = _GEN_7 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_117 = {_T_110[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_119 = _T_117 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_120 = _T_115 | _T_119; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{1'd0}, _T_120[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_125 = _GEN_8 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_127 = {_T_120[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_129 = _T_127 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_130 = _T_125 | _T_129; // @[Bitwise.scala 103:39]
  wire [7:0] _T_141 = _GEN_0 & dccm_rdata_corr_m[31:24]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_142 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_141; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_143 = _T_5[3] ? _T_8[31:24] : _T_142; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_147 = {{4'd0}, _T_143[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_149 = {_T_143[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_151 = _T_149 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_152 = _T_147 | _T_151; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_10 = {{2'd0}, _T_152[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_157 = _GEN_10 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_159 = {_T_152[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_161 = _T_159 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_162 = _T_157 | _T_161; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_11 = {{1'd0}, _T_162[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_167 = _GEN_11 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_169 = {_T_162[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_171 = _T_169 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_172 = _T_167 | _T_171; // @[Bitwise.scala 103:39]
  wire [7:0] _T_183 = _GEN_0 & dccm_rdata_corr_m[39:32]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_184 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_183; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_185 = _T_5[4] ? _T_8[39:32] : _T_184; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_189 = {{4'd0}, _T_185[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_191 = {_T_185[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_193 = _T_191 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_194 = _T_189 | _T_193; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_13 = {{2'd0}, _T_194[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_199 = _GEN_13 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_201 = {_T_194[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_203 = _T_201 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_204 = _T_199 | _T_203; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_14 = {{1'd0}, _T_204[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_209 = _GEN_14 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_211 = {_T_204[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_213 = _T_211 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_214 = _T_209 | _T_213; // @[Bitwise.scala 103:39]
  wire [7:0] _T_225 = _GEN_0 & dccm_rdata_corr_m[47:40]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_226 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_225; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_227 = _T_5[5] ? _T_8[47:40] : _T_226; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_231 = {{4'd0}, _T_227[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_233 = {_T_227[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_235 = _T_233 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_236 = _T_231 | _T_235; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_16 = {{2'd0}, _T_236[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_241 = _GEN_16 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_243 = {_T_236[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_245 = _T_243 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_246 = _T_241 | _T_245; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_17 = {{1'd0}, _T_246[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_251 = _GEN_17 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_253 = {_T_246[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_255 = _T_253 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_256 = _T_251 | _T_255; // @[Bitwise.scala 103:39]
  wire [7:0] _T_267 = _GEN_0 & dccm_rdata_corr_m[55:48]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_268 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_267; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_269 = _T_5[6] ? _T_8[55:48] : _T_268; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_273 = {{4'd0}, _T_269[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_275 = {_T_269[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_277 = _T_275 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_278 = _T_273 | _T_277; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_19 = {{2'd0}, _T_278[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_283 = _GEN_19 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_285 = {_T_278[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_287 = _T_285 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_288 = _T_283 | _T_287; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_20 = {{1'd0}, _T_288[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_293 = _GEN_20 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_295 = {_T_288[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_297 = _T_295 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_298 = _T_293 | _T_297; // @[Bitwise.scala 103:39]
  wire [7:0] _T_309 = _GEN_0 & dccm_rdata_corr_m[63:56]; // @[lsu_dccm_ctl.scala 155:294]
  wire [7:0] _T_310 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_309; // @[lsu_dccm_ctl.scala 155:214]
  wire [7:0] _T_311 = _T_5[7] ? _T_8[63:56] : _T_310; // @[lsu_dccm_ctl.scala 155:78]
  wire [7:0] _T_315 = {{4'd0}, _T_311[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_317 = {_T_311[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_319 = _T_317 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_320 = _T_315 | _T_319; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_22 = {{2'd0}, _T_320[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_325 = _GEN_22 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_327 = {_T_320[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_329 = _T_327 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_330 = _T_325 | _T_329; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_23 = {{1'd0}, _T_330[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_335 = _GEN_23 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_337 = {_T_330[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_339 = _T_337 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_340 = _T_335 | _T_339; // @[Bitwise.scala 103:39]
  wire [63:0] _T_348 = {_T_46,_T_88,_T_130,_T_172,_T_214,_T_256,_T_298,_T_340}; // @[Cat.scala 29:58]
  wire [63:0] _T_352 = {{32'd0}, _T_348[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_354 = {_T_348[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_356 = _T_354 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_357 = _T_352 | _T_356; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_24 = {{16'd0}, _T_357[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_362 = _GEN_24 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_364 = {_T_357[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_366 = _T_364 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_367 = _T_362 | _T_366; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_25 = {{8'd0}, _T_367[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_372 = _GEN_25 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_374 = {_T_367[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_376 = _T_374 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_377 = _T_372 | _T_376; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_26 = {{4'd0}, _T_377[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_382 = _GEN_26 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_384 = {_T_377[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_386 = _T_384 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_387 = _T_382 | _T_386; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_27 = {{2'd0}, _T_387[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_392 = _GEN_27 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_394 = {_T_387[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_396 = _T_394 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_397 = _T_392 | _T_396; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_28 = {{1'd0}, _T_397[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_402 = _GEN_28 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_404 = {_T_397[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_406 = _T_404 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_corr_m = _T_402 | _T_406; // @[Bitwise.scala 103:39]
  wire [127:0] _T_3 = {lsu_rdata_corr_m,lsu_rdata_corr_m}; // @[Cat.scala 29:58]
  wire [127:0] _T_4 = io_ldst_dual_m ? {{64'd0}, lsu_rdata_corr_m} : _T_3; // @[lsu_dccm_ctl.scala 147:47]
  wire [7:0] _T_418 = _GEN_0 & dccm_rdata_m[7:0]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_419 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : _T_418; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_420 = _T_5[0] ? _T_8[7:0] : _T_419; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_424 = {{4'd0}, _T_420[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_426 = {_T_420[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_428 = _T_426 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_429 = _T_424 | _T_428; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_30 = {{2'd0}, _T_429[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_434 = _GEN_30 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_436 = {_T_429[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_438 = _T_436 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_439 = _T_434 | _T_438; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_31 = {{1'd0}, _T_439[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_444 = _GEN_31 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_446 = {_T_439[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_448 = _T_446 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_449 = _T_444 | _T_448; // @[Bitwise.scala 103:39]
  wire [7:0] _T_460 = _GEN_0 & dccm_rdata_m[15:8]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_461 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : _T_460; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_462 = _T_5[1] ? _T_8[15:8] : _T_461; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_466 = {{4'd0}, _T_462[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_468 = {_T_462[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_470 = _T_468 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_471 = _T_466 | _T_470; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_33 = {{2'd0}, _T_471[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_476 = _GEN_33 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_478 = {_T_471[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_480 = _T_478 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_481 = _T_476 | _T_480; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_34 = {{1'd0}, _T_481[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_486 = _GEN_34 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_488 = {_T_481[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_490 = _T_488 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_491 = _T_486 | _T_490; // @[Bitwise.scala 103:39]
  wire [7:0] _T_502 = _GEN_0 & dccm_rdata_m[23:16]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_503 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : _T_502; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_504 = _T_5[2] ? _T_8[23:16] : _T_503; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_508 = {{4'd0}, _T_504[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_510 = {_T_504[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_512 = _T_510 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_513 = _T_508 | _T_512; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_36 = {{2'd0}, _T_513[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_518 = _GEN_36 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_520 = {_T_513[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_522 = _T_520 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_523 = _T_518 | _T_522; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_37 = {{1'd0}, _T_523[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_528 = _GEN_37 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_530 = {_T_523[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_532 = _T_530 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_533 = _T_528 | _T_532; // @[Bitwise.scala 103:39]
  wire [7:0] _T_544 = _GEN_0 & dccm_rdata_m[31:24]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_545 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : _T_544; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_546 = _T_5[3] ? _T_8[31:24] : _T_545; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_550 = {{4'd0}, _T_546[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_552 = {_T_546[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_554 = _T_552 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_555 = _T_550 | _T_554; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_39 = {{2'd0}, _T_555[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_560 = _GEN_39 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_562 = {_T_555[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_564 = _T_562 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_565 = _T_560 | _T_564; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_40 = {{1'd0}, _T_565[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_570 = _GEN_40 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_572 = {_T_565[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_574 = _T_572 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_575 = _T_570 | _T_574; // @[Bitwise.scala 103:39]
  wire [7:0] _T_586 = _GEN_0 & dccm_rdata_m[39:32]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_587 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : _T_586; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_588 = _T_5[4] ? _T_8[39:32] : _T_587; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_592 = {{4'd0}, _T_588[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_594 = {_T_588[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_596 = _T_594 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_597 = _T_592 | _T_596; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_42 = {{2'd0}, _T_597[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_602 = _GEN_42 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_604 = {_T_597[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_606 = _T_604 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_607 = _T_602 | _T_606; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_43 = {{1'd0}, _T_607[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_612 = _GEN_43 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_614 = {_T_607[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_616 = _T_614 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_617 = _T_612 | _T_616; // @[Bitwise.scala 103:39]
  wire [7:0] _T_628 = _GEN_0 & dccm_rdata_m[47:40]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_629 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : _T_628; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_630 = _T_5[5] ? _T_8[47:40] : _T_629; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_634 = {{4'd0}, _T_630[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_636 = {_T_630[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_638 = _T_636 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_639 = _T_634 | _T_638; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_45 = {{2'd0}, _T_639[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_644 = _GEN_45 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_646 = {_T_639[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_648 = _T_646 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_649 = _T_644 | _T_648; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_46 = {{1'd0}, _T_649[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_654 = _GEN_46 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_656 = {_T_649[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_658 = _T_656 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_659 = _T_654 | _T_658; // @[Bitwise.scala 103:39]
  wire [7:0] _T_670 = _GEN_0 & dccm_rdata_m[55:48]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_671 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : _T_670; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_672 = _T_5[6] ? _T_8[55:48] : _T_671; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_676 = {{4'd0}, _T_672[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_678 = {_T_672[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_680 = _T_678 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_681 = _T_676 | _T_680; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_48 = {{2'd0}, _T_681[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_686 = _GEN_48 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_688 = {_T_681[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_690 = _T_688 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_691 = _T_686 | _T_690; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_49 = {{1'd0}, _T_691[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_696 = _GEN_49 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_698 = {_T_691[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_700 = _T_698 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_701 = _T_696 | _T_700; // @[Bitwise.scala 103:39]
  wire [7:0] _T_712 = _GEN_0 & dccm_rdata_m[63:56]; // @[lsu_dccm_ctl.scala 156:294]
  wire [7:0] _T_713 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : _T_712; // @[lsu_dccm_ctl.scala 156:214]
  wire [7:0] _T_714 = _T_5[7] ? _T_8[63:56] : _T_713; // @[lsu_dccm_ctl.scala 156:78]
  wire [7:0] _T_718 = {{4'd0}, _T_714[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_720 = {_T_714[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_722 = _T_720 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_723 = _T_718 | _T_722; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_51 = {{2'd0}, _T_723[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_728 = _GEN_51 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_730 = {_T_723[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_732 = _T_730 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_733 = _T_728 | _T_732; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_52 = {{1'd0}, _T_733[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_738 = _GEN_52 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_740 = {_T_733[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_742 = _T_740 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_743 = _T_738 | _T_742; // @[Bitwise.scala 103:39]
  wire [63:0] _T_751 = {_T_449,_T_491,_T_533,_T_575,_T_617,_T_659,_T_701,_T_743}; // @[Cat.scala 29:58]
  wire [63:0] _T_755 = {{32'd0}, _T_751[63:32]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_757 = {_T_751[31:0], 32'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_759 = _T_757 & 64'hffffffff00000000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_760 = _T_755 | _T_759; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_53 = {{16'd0}, _T_760[63:16]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_765 = _GEN_53 & 64'hffff0000ffff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_767 = {_T_760[47:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_769 = _T_767 & 64'hffff0000ffff0000; // @[Bitwise.scala 103:75]
  wire [63:0] _T_770 = _T_765 | _T_769; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_54 = {{8'd0}, _T_770[63:8]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_775 = _GEN_54 & 64'hff00ff00ff00ff; // @[Bitwise.scala 103:31]
  wire [63:0] _T_777 = {_T_770[55:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_779 = _T_777 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 103:75]
  wire [63:0] _T_780 = _T_775 | _T_779; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_55 = {{4'd0}, _T_780[63:4]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_785 = _GEN_55 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 103:31]
  wire [63:0] _T_787 = {_T_780[59:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_789 = _T_787 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 103:75]
  wire [63:0] _T_790 = _T_785 | _T_789; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_56 = {{2'd0}, _T_790[63:2]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_795 = _GEN_56 & 64'h3333333333333333; // @[Bitwise.scala 103:31]
  wire [63:0] _T_797 = {_T_790[61:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_799 = _T_797 & 64'hcccccccccccccccc; // @[Bitwise.scala 103:75]
  wire [63:0] _T_800 = _T_795 | _T_799; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_57 = {{1'd0}, _T_800[63:1]}; // @[Bitwise.scala 103:31]
  wire [63:0] _T_805 = _GEN_57 & 64'h5555555555555555; // @[Bitwise.scala 103:31]
  wire [63:0] _T_807 = {_T_800[62:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [63:0] _T_809 = _T_807 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] lsu_rdata_m = _T_805 | _T_809; // @[Bitwise.scala 103:39]
  wire  _T_812 = io_addr_in_pic_m | io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 157:123]
  wire  _T_813 = _T & _T_812; // @[lsu_dccm_ctl.scala 157:103]
  reg [63:0] _T_817; // @[lib.scala 374:16]
  wire [3:0] _GEN_58 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_dccm_ctl.scala 158:49]
  wire [5:0] _T_819 = 4'h8 * _GEN_58; // @[lsu_dccm_ctl.scala 158:49]
  wire [63:0] _T_820 = lsu_rdata_m >> _T_819; // @[lsu_dccm_ctl.scala 158:43]
  wire  _T_826 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:60]
  wire  _T_829 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 163:133]
  wire  _T_830 = _T_826 | _T_829; // @[lsu_dccm_ctl.scala 163:101]
  wire  _T_831 = _T_830 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 163:175]
  wire  _T_832 = _T_831 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 163:196]
  wire  _T_833 = _T_832 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 163:222]
  wire  _T_834 = _T_833 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 163:246]
  wire  _T_837 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:37]
  wire  _T_840 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 164:110]
  wire  _T_841 = _T_837 | _T_840; // @[lsu_dccm_ctl.scala 164:78]
  wire  _T_842 = _T_841 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 164:152]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 164:173]
  wire  _T_844 = _T_843 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 164:199]
  wire  _T_845 = _T_844 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 164:223]
  wire  kill_ecc_corr_lo_r = _T_834 | _T_845; // @[lsu_dccm_ctl.scala 163:267]
  wire  _T_848 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:60]
  wire  _T_851 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 166:133]
  wire  _T_852 = _T_848 | _T_851; // @[lsu_dccm_ctl.scala 166:101]
  wire  _T_853 = _T_852 & io_lsu_pkt_d_valid; // @[lsu_dccm_ctl.scala 166:175]
  wire  _T_854 = _T_853 & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 166:196]
  wire  _T_855 = _T_854 & io_lsu_pkt_d_bits_dma; // @[lsu_dccm_ctl.scala 166:222]
  wire  _T_856 = _T_855 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 166:246]
  wire  _T_859 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:37]
  wire  _T_862 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 167:110]
  wire  _T_863 = _T_859 | _T_862; // @[lsu_dccm_ctl.scala 167:78]
  wire  _T_864 = _T_863 & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 167:152]
  wire  _T_865 = _T_864 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 167:173]
  wire  _T_866 = _T_865 & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 167:199]
  wire  _T_867 = _T_866 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 167:223]
  wire  kill_ecc_corr_hi_r = _T_856 | _T_867; // @[lsu_dccm_ctl.scala 166:267]
  wire  _T_868 = io_lsu_pkt_r_bits_load & io_single_ecc_error_lo_r; // @[lsu_dccm_ctl.scala 169:60]
  wire  _T_869 = ~io_lsu_raw_fwd_lo_r; // @[lsu_dccm_ctl.scala 169:89]
  wire  ld_single_ecc_error_lo_r = _T_868 & _T_869; // @[lsu_dccm_ctl.scala 169:87]
  wire  _T_870 = io_lsu_pkt_r_bits_load & io_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 170:60]
  wire  _T_871 = ~io_lsu_raw_fwd_hi_r; // @[lsu_dccm_ctl.scala 170:89]
  wire  ld_single_ecc_error_hi_r = _T_870 & _T_871; // @[lsu_dccm_ctl.scala 170:87]
  wire  _T_872 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[lsu_dccm_ctl.scala 171:63]
  wire  _T_873 = ~io_lsu_double_ecc_error_r; // @[lsu_dccm_ctl.scala 171:93]
  wire  _T_875 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_dccm_ctl.scala 172:81]
  wire  _T_876 = ld_single_ecc_error_lo_r & _T_875; // @[lsu_dccm_ctl.scala 172:62]
  wire  _T_877 = ~kill_ecc_corr_lo_r; // @[lsu_dccm_ctl.scala 172:108]
  wire  _T_879 = ld_single_ecc_error_hi_r & _T_875; // @[lsu_dccm_ctl.scala 173:62]
  wire  _T_880 = ~kill_ecc_corr_hi_r; // @[lsu_dccm_ctl.scala 173:108]
  wire  _T_881 = io_lsu_pkt_d_bits_word | io_lsu_pkt_d_bits_dword; // @[lsu_dccm_ctl.scala 175:125]
  wire  _T_882 = ~_T_881; // @[lsu_dccm_ctl.scala 175:100]
  wire  _T_884 = io_lsu_addr_d[1:0] != 2'h0; // @[lsu_dccm_ctl.scala 175:174]
  wire  _T_885 = _T_882 | _T_884; // @[lsu_dccm_ctl.scala 175:152]
  wire  _T_886 = io_lsu_pkt_d_bits_store & _T_885; // @[lsu_dccm_ctl.scala 175:97]
  wire  _T_887 = io_lsu_pkt_d_bits_load | _T_886; // @[lsu_dccm_ctl.scala 175:70]
  wire  _T_888 = io_lsu_pkt_d_valid & _T_887; // @[lsu_dccm_ctl.scala 175:44]
  wire  lsu_dccm_rden_d = _T_888 & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 175:191]
  reg  ld_single_ecc_error_lo_r_ff; // @[lsu_dccm_ctl.scala 284:73]
  reg  ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 283:73]
  wire  _T_889 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[lsu_dccm_ctl.scala 178:63]
  reg  lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 282:73]
  wire  _T_890 = ~lsu_double_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 178:96]
  wire  _T_892 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[lsu_dccm_ctl.scala 179:75]
  wire  _T_893 = _T_892 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 179:93]
  wire  _T_894 = ~_T_893; // @[lsu_dccm_ctl.scala 179:57]
  wire  _T_897 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[lsu_dccm_ctl.scala 180:95]
  wire  _T_900 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[lsu_dccm_ctl.scala 181:76]
  wire  _T_901 = _T_897 | _T_900; // @[lsu_dccm_ctl.scala 180:171]
  wire  _T_902 = ~_T_901; // @[lsu_dccm_ctl.scala 180:24]
  wire  _T_903 = lsu_dccm_rden_d & _T_902; // @[lsu_dccm_ctl.scala 180:22]
  wire  _T_904 = _T_894 | _T_903; // @[lsu_dccm_ctl.scala 179:124]
  wire  _T_906 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[lsu_dccm_ctl.scala 185:41]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[lib.scala 374:16]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[lib.scala 374:16]
  wire [15:0] _T_913 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[lsu_dccm_ctl.scala 189:8]
  wire [15:0] _T_917 = io_dma_dccm_wen ? io_lsu_addr_d[15:0] : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 190:8]
  wire [15:0] _T_923 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[lsu_dccm_ctl.scala 193:8]
  wire [15:0] _T_927 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[lsu_dccm_ctl.scala 194:8]
  wire [38:0] _T_935 = {io_sec_data_ecc_lo_r_ff,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_938 = {io_sec_data_ecc_hi_r_ff,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_939 = ld_single_ecc_error_lo_r_ff ? _T_935 : _T_938; // @[lsu_dccm_ctl.scala 200:8]
  wire [38:0] _T_943 = {io_dma_dccm_wdata_ecc_lo,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_946 = {io_stbuf_ecc_any,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_947 = io_dma_dccm_wen ? _T_943 : _T_946; // @[lsu_dccm_ctl.scala 202:8]
  wire [38:0] _T_957 = ld_single_ecc_error_hi_r_ff ? _T_938 : _T_935; // @[lsu_dccm_ctl.scala 206:8]
  wire [38:0] _T_961 = {io_dma_dccm_wdata_ecc_hi,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_965 = io_dma_dccm_wen ? _T_961 : _T_946; // @[lsu_dccm_ctl.scala 208:8]
  wire [3:0] _T_968 = io_lsu_pkt_m_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_970 = io_lsu_pkt_m_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_971 = _T_970 & 4'h1; // @[lsu_dccm_ctl.scala 212:94]
  wire [3:0] _T_973 = io_lsu_pkt_m_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_974 = _T_973 & 4'h3; // @[lsu_dccm_ctl.scala 213:38]
  wire [3:0] _T_975 = _T_971 | _T_974; // @[lsu_dccm_ctl.scala 212:107]
  wire [3:0] _T_977 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_979 = _T_975 | _T_977; // @[lsu_dccm_ctl.scala 213:51]
  wire [3:0] store_byteen_m = _T_968 & _T_979; // @[lsu_dccm_ctl.scala 212:58]
  wire [3:0] _T_981 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_983 = io_lsu_pkt_r_bits_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_984 = _T_983 & 4'h1; // @[lsu_dccm_ctl.scala 216:94]
  wire [3:0] _T_986 = io_lsu_pkt_r_bits_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_987 = _T_986 & 4'h3; // @[lsu_dccm_ctl.scala 217:38]
  wire [3:0] _T_988 = _T_984 | _T_987; // @[lsu_dccm_ctl.scala 216:107]
  wire [3:0] _T_990 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_992 = _T_988 | _T_990; // @[lsu_dccm_ctl.scala 217:51]
  wire [3:0] store_byteen_r = _T_981 & _T_992; // @[lsu_dccm_ctl.scala 216:58]
  wire [6:0] _GEN_60 = {{3'd0}, store_byteen_m}; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _T_995 = _GEN_60 << io_lsu_addr_m[1:0]; // @[lsu_dccm_ctl.scala 220:45]
  wire [6:0] _GEN_61 = {{3'd0}, store_byteen_r}; // @[lsu_dccm_ctl.scala 222:45]
  wire [6:0] _T_998 = _GEN_61 << io_lsu_addr_r[1:0]; // @[lsu_dccm_ctl.scala 222:45]
  wire  _T_1001 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[lsu_dccm_ctl.scala 225:67]
  wire  dccm_wr_bypass_d_m_lo = _T_1001 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 225:101]
  wire  _T_1004 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[lsu_dccm_ctl.scala 226:67]
  wire  dccm_wr_bypass_d_m_hi = _T_1004 & io_addr_in_dccm_m; // @[lsu_dccm_ctl.scala 226:101]
  wire  _T_1007 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[lsu_dccm_ctl.scala 228:67]
  wire  dccm_wr_bypass_d_r_lo = _T_1007 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 228:101]
  wire  _T_1010 = io_stbuf_addr_any[15:2] == io_end_addr_r[15:2]; // @[lsu_dccm_ctl.scala 229:67]
  wire  dccm_wr_bypass_d_r_hi = _T_1010 & io_addr_in_dccm_r; // @[lsu_dccm_ctl.scala 229:101]
  wire [63:0] _T_1013 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_63 = {{63'd0}, _T_1013}; // @[lsu_dccm_ctl.scala 258:72]
  wire [126:0] _T_1016 = _GEN_63 << _T_819; // @[lsu_dccm_ctl.scala 258:72]
  wire [63:0] store_data_pre_m = _T_1016[63:0]; // @[lsu_dccm_ctl.scala 258:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[lsu_dccm_ctl.scala 259:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[lsu_dccm_ctl.scala 260:48]
  wire [7:0] store_byteen_ext_m = {{1'd0}, _T_995}; // @[lsu_dccm_ctl.scala 220:22]
  wire  _T_1022 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[lsu_dccm_ctl.scala 261:211]
  wire [7:0] _T_1026 = _T_1022 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1027 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_1026; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1031 = {{4'd0}, _T_1027[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1033 = {_T_1027[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1035 = _T_1033 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1036 = _T_1031 | _T_1035; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_64 = {{2'd0}, _T_1036[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1041 = _GEN_64 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1043 = {_T_1036[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1045 = _T_1043 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1046 = _T_1041 | _T_1045; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_65 = {{1'd0}, _T_1046[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1051 = _GEN_65 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1053 = {_T_1046[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1055 = _T_1053 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1056 = _T_1051 | _T_1055; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1064 = _T_1022 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1065 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_1064; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1069 = {{4'd0}, _T_1065[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1071 = {_T_1065[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1073 = _T_1071 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1074 = _T_1069 | _T_1073; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_66 = {{2'd0}, _T_1074[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1079 = _GEN_66 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1081 = {_T_1074[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1083 = _T_1081 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1084 = _T_1079 | _T_1083; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_67 = {{1'd0}, _T_1084[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1089 = _GEN_67 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1091 = {_T_1084[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1093 = _T_1091 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1094 = _T_1089 | _T_1093; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1102 = _T_1022 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1103 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_1102; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1107 = {{4'd0}, _T_1103[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1109 = {_T_1103[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1111 = _T_1109 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1112 = _T_1107 | _T_1111; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_68 = {{2'd0}, _T_1112[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1117 = _GEN_68 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1119 = {_T_1112[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1121 = _T_1119 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1122 = _T_1117 | _T_1121; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_69 = {{1'd0}, _T_1122[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1127 = _GEN_69 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1129 = {_T_1122[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1131 = _T_1129 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1132 = _T_1127 | _T_1131; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1140 = _T_1022 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[lsu_dccm_ctl.scala 261:185]
  wire [7:0] _T_1141 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_1140; // @[lsu_dccm_ctl.scala 261:120]
  wire [7:0] _T_1145 = {{4'd0}, _T_1141[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1147 = {_T_1141[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1149 = _T_1147 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1150 = _T_1145 | _T_1149; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_70 = {{2'd0}, _T_1150[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1155 = _GEN_70 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1157 = {_T_1150[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1159 = _T_1157 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1160 = _T_1155 | _T_1159; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_71 = {{1'd0}, _T_1160[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1165 = _GEN_71 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1167 = {_T_1160[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1169 = _T_1167 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1170 = _T_1165 | _T_1169; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1174 = {_T_1056,_T_1094,_T_1132,_T_1170}; // @[Cat.scala 29:58]
  wire [31:0] _T_1178 = {{16'd0}, _T_1174[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1180 = {_T_1174[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1182 = _T_1180 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1183 = _T_1178 | _T_1182; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_72 = {{8'd0}, _T_1183[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1188 = _GEN_72 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1190 = {_T_1183[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1192 = _T_1190 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1193 = _T_1188 | _T_1192; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_73 = {{4'd0}, _T_1193[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1198 = _GEN_73 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1200 = {_T_1193[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1202 = _T_1200 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1203 = _T_1198 | _T_1202; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_74 = {{2'd0}, _T_1203[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1208 = _GEN_74 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1210 = {_T_1203[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1212 = _T_1210 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1213 = _T_1208 | _T_1212; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_75 = {{1'd0}, _T_1213[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1218 = _GEN_75 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1220 = {_T_1213[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1222 = _T_1220 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  reg [31:0] _T_1224; // @[lsu_dccm_ctl.scala 261:72]
  wire  _T_1228 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[lsu_dccm_ctl.scala 262:177]
  wire [7:0] _T_1232 = _T_1228 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1233 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_1232; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1237 = {{4'd0}, _T_1233[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1239 = {_T_1233[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1241 = _T_1239 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1242 = _T_1237 | _T_1241; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_76 = {{2'd0}, _T_1242[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1247 = _GEN_76 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1249 = {_T_1242[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1251 = _T_1249 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1252 = _T_1247 | _T_1251; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_77 = {{1'd0}, _T_1252[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1257 = _GEN_77 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1259 = {_T_1252[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1261 = _T_1259 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1262 = _T_1257 | _T_1261; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1270 = _T_1228 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1271 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_1270; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1275 = {{4'd0}, _T_1271[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1277 = {_T_1271[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1279 = _T_1277 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1280 = _T_1275 | _T_1279; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_78 = {{2'd0}, _T_1280[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1285 = _GEN_78 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1287 = {_T_1280[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1289 = _T_1287 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1290 = _T_1285 | _T_1289; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_79 = {{1'd0}, _T_1290[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1295 = _GEN_79 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1297 = {_T_1290[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1299 = _T_1297 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1300 = _T_1295 | _T_1299; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1308 = _T_1228 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1309 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_1308; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1313 = {{4'd0}, _T_1309[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1315 = {_T_1309[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1317 = _T_1315 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1318 = _T_1313 | _T_1317; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_80 = {{2'd0}, _T_1318[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1323 = _GEN_80 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1325 = {_T_1318[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1327 = _T_1325 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1328 = _T_1323 | _T_1327; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_81 = {{1'd0}, _T_1328[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1333 = _GEN_81 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1335 = {_T_1328[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1337 = _T_1335 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1338 = _T_1333 | _T_1337; // @[Bitwise.scala 103:39]
  wire [7:0] _T_1346 = _T_1228 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[lsu_dccm_ctl.scala 262:151]
  wire [7:0] _T_1347 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_1346; // @[lsu_dccm_ctl.scala 262:86]
  wire [7:0] _T_1351 = {{4'd0}, _T_1347[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1353 = {_T_1347[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1355 = _T_1353 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1356 = _T_1351 | _T_1355; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_82 = {{2'd0}, _T_1356[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1361 = _GEN_82 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1363 = {_T_1356[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1365 = _T_1363 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1366 = _T_1361 | _T_1365; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_83 = {{1'd0}, _T_1366[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1371 = _GEN_83 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1373 = {_T_1366[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1375 = _T_1373 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1376 = _T_1371 | _T_1375; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1380 = {_T_1262,_T_1300,_T_1338,_T_1376}; // @[Cat.scala 29:58]
  wire [31:0] _T_1384 = {{16'd0}, _T_1380[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1386 = {_T_1380[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1388 = _T_1386 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1389 = _T_1384 | _T_1388; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_84 = {{8'd0}, _T_1389[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1394 = _GEN_84 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1396 = {_T_1389[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1398 = _T_1396 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1399 = _T_1394 | _T_1398; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_85 = {{4'd0}, _T_1399[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1404 = _GEN_85 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1406 = {_T_1399[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1408 = _T_1406 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1409 = _T_1404 | _T_1408; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_86 = {{2'd0}, _T_1409[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1414 = _GEN_86 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1416 = {_T_1409[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1418 = _T_1416 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1419 = _T_1414 | _T_1418; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_87 = {{1'd0}, _T_1419[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1424 = _GEN_87 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1426 = {_T_1419[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1428 = _T_1426 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1430 = io_ldst_dual_m & io_lsu_pkt_m_valid; // @[lsu_dccm_ctl.scala 262:295]
  wire  _T_1431 = _T_1430 & io_lsu_pkt_m_bits_store; // @[lsu_dccm_ctl.scala 262:316]
  reg [31:0] _T_1435; // @[lib.scala 374:16]
  wire  _T_1436 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[lsu_dccm_ctl.scala 263:105]
  wire [7:0] store_byteen_ext_r = {{1'd0}, _T_998}; // @[lsu_dccm_ctl.scala 222:22]
  wire  _T_1438 = ~store_byteen_ext_r[0]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1439 = _T_1436 & _T_1438; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1443 = _T_1439 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1447 = {{4'd0}, _T_1443[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1449 = {_T_1443[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1451 = _T_1449 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1452 = _T_1447 | _T_1451; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_88 = {{2'd0}, _T_1452[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1457 = _GEN_88 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1459 = {_T_1452[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1461 = _T_1459 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1462 = _T_1457 | _T_1461; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_89 = {{1'd0}, _T_1462[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1467 = _GEN_89 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1469 = {_T_1462[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1471 = _T_1469 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1472 = _T_1467 | _T_1471; // @[Bitwise.scala 103:39]
  wire  _T_1475 = ~store_byteen_ext_r[1]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1476 = _T_1436 & _T_1475; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1480 = _T_1476 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1484 = {{4'd0}, _T_1480[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1486 = {_T_1480[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1488 = _T_1486 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1489 = _T_1484 | _T_1488; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_90 = {{2'd0}, _T_1489[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1494 = _GEN_90 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1496 = {_T_1489[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1498 = _T_1496 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1499 = _T_1494 | _T_1498; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_91 = {{1'd0}, _T_1499[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1504 = _GEN_91 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1506 = {_T_1499[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1508 = _T_1506 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1509 = _T_1504 | _T_1508; // @[Bitwise.scala 103:39]
  wire  _T_1512 = ~store_byteen_ext_r[2]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1513 = _T_1436 & _T_1512; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1517 = _T_1513 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1521 = {{4'd0}, _T_1517[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1523 = {_T_1517[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1525 = _T_1523 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1526 = _T_1521 | _T_1525; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_92 = {{2'd0}, _T_1526[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1531 = _GEN_92 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1533 = {_T_1526[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1535 = _T_1533 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1536 = _T_1531 | _T_1535; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_93 = {{1'd0}, _T_1536[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1541 = _GEN_93 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1543 = {_T_1536[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1545 = _T_1543 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1546 = _T_1541 | _T_1545; // @[Bitwise.scala 103:39]
  wire  _T_1549 = ~store_byteen_ext_r[3]; // @[lsu_dccm_ctl.scala 263:131]
  wire  _T_1550 = _T_1436 & _T_1549; // @[lsu_dccm_ctl.scala 263:129]
  wire [7:0] _T_1554 = _T_1550 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[lsu_dccm_ctl.scala 263:79]
  wire [7:0] _T_1558 = {{4'd0}, _T_1554[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1560 = {_T_1554[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1562 = _T_1560 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1563 = _T_1558 | _T_1562; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_94 = {{2'd0}, _T_1563[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1568 = _GEN_94 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1570 = {_T_1563[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1572 = _T_1570 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1573 = _T_1568 | _T_1572; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_95 = {{1'd0}, _T_1573[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1578 = _GEN_95 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1580 = {_T_1573[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1582 = _T_1580 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1583 = _T_1578 | _T_1582; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1587 = {_T_1472,_T_1509,_T_1546,_T_1583}; // @[Cat.scala 29:58]
  wire [31:0] _T_1591 = {{16'd0}, _T_1587[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1593 = {_T_1587[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1595 = _T_1593 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1596 = _T_1591 | _T_1595; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_96 = {{8'd0}, _T_1596[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1601 = _GEN_96 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1603 = {_T_1596[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1605 = _T_1603 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1606 = _T_1601 | _T_1605; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_97 = {{4'd0}, _T_1606[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1611 = _GEN_97 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1613 = {_T_1606[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1615 = _T_1613 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1616 = _T_1611 | _T_1615; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_98 = {{2'd0}, _T_1616[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1621 = _GEN_98 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1623 = {_T_1616[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1625 = _T_1623 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1626 = _T_1621 | _T_1625; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_99 = {{1'd0}, _T_1626[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1631 = _GEN_99 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1633 = {_T_1626[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1635 = _T_1633 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire  _T_1637 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_hi; // @[lsu_dccm_ctl.scala 264:105]
  wire  _T_1639 = ~store_byteen_ext_r[4]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1640 = _T_1637 & _T_1639; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1644 = _T_1640 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1648 = {{4'd0}, _T_1644[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1650 = {_T_1644[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1652 = _T_1650 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1653 = _T_1648 | _T_1652; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_100 = {{2'd0}, _T_1653[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1658 = _GEN_100 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1660 = {_T_1653[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1662 = _T_1660 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1663 = _T_1658 | _T_1662; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_101 = {{1'd0}, _T_1663[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1668 = _GEN_101 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1670 = {_T_1663[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1672 = _T_1670 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1673 = _T_1668 | _T_1672; // @[Bitwise.scala 103:39]
  wire  _T_1676 = ~store_byteen_ext_r[5]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1677 = _T_1637 & _T_1676; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1681 = _T_1677 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1685 = {{4'd0}, _T_1681[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1687 = {_T_1681[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1689 = _T_1687 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1690 = _T_1685 | _T_1689; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_102 = {{2'd0}, _T_1690[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1695 = _GEN_102 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1697 = {_T_1690[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1699 = _T_1697 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1700 = _T_1695 | _T_1699; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_103 = {{1'd0}, _T_1700[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1705 = _GEN_103 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1707 = {_T_1700[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1709 = _T_1707 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1710 = _T_1705 | _T_1709; // @[Bitwise.scala 103:39]
  wire  _T_1713 = ~store_byteen_ext_r[6]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1714 = _T_1637 & _T_1713; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1718 = _T_1714 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1722 = {{4'd0}, _T_1718[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1724 = {_T_1718[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1726 = _T_1724 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1727 = _T_1722 | _T_1726; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_104 = {{2'd0}, _T_1727[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1732 = _GEN_104 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1734 = {_T_1727[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1736 = _T_1734 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1737 = _T_1732 | _T_1736; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_105 = {{1'd0}, _T_1737[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1742 = _GEN_105 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1744 = {_T_1737[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1746 = _T_1744 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1747 = _T_1742 | _T_1746; // @[Bitwise.scala 103:39]
  wire  _T_1750 = ~store_byteen_ext_r[7]; // @[lsu_dccm_ctl.scala 264:131]
  wire  _T_1751 = _T_1637 & _T_1750; // @[lsu_dccm_ctl.scala 264:129]
  wire [7:0] _T_1755 = _T_1751 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[lsu_dccm_ctl.scala 264:79]
  wire [7:0] _T_1759 = {{4'd0}, _T_1755[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1761 = {_T_1755[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1763 = _T_1761 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1764 = _T_1759 | _T_1763; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_106 = {{2'd0}, _T_1764[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1769 = _GEN_106 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1771 = {_T_1764[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1773 = _T_1771 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1774 = _T_1769 | _T_1773; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_107 = {{1'd0}, _T_1774[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1779 = _GEN_107 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_1781 = {_T_1774[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_1783 = _T_1781 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_1784 = _T_1779 | _T_1783; // @[Bitwise.scala 103:39]
  wire [31:0] _T_1788 = {_T_1673,_T_1710,_T_1747,_T_1784}; // @[Cat.scala 29:58]
  wire [31:0] _T_1792 = {{16'd0}, _T_1788[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1794 = {_T_1788[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1796 = _T_1794 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1797 = _T_1792 | _T_1796; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_108 = {{8'd0}, _T_1797[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1802 = _GEN_108 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1804 = {_T_1797[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1806 = _T_1804 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1807 = _T_1802 | _T_1806; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_109 = {{4'd0}, _T_1807[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1812 = _GEN_109 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1814 = {_T_1807[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1816 = _T_1814 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1817 = _T_1812 | _T_1816; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_110 = {{2'd0}, _T_1817[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1822 = _GEN_110 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1824 = {_T_1817[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1826 = _T_1824 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1827 = _T_1822 | _T_1826; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_111 = {{1'd0}, _T_1827[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1832 = _GEN_111 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1834 = {_T_1827[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1836 = _T_1834 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [63:0] _T_1840 = {io_store_data_hi_r,io_store_data_lo_r}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_112 = {{2'd0}, io_lsu_addr_r[1:0]}; // @[lsu_dccm_ctl.scala 265:94]
  wire [5:0] _T_1842 = 4'h8 * _GEN_112; // @[lsu_dccm_ctl.scala 265:94]
  wire [63:0] _T_1843 = _T_1840 >> _T_1842; // @[lsu_dccm_ctl.scala 265:88]
  wire [7:0] _T_1846 = store_byteen_r[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1849 = store_byteen_r[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1852 = store_byteen_r[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1855 = store_byteen_r[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1859 = {_T_1846,_T_1849,_T_1852,_T_1855}; // @[Cat.scala 29:58]
  wire [31:0] _T_1863 = {{16'd0}, _T_1859[31:16]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1865 = {_T_1859[15:0], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1867 = _T_1865 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1868 = _T_1863 | _T_1867; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_113 = {{8'd0}, _T_1868[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1873 = _GEN_113 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1875 = {_T_1868[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1877 = _T_1875 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1878 = _T_1873 | _T_1877; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_114 = {{4'd0}, _T_1878[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1883 = _GEN_114 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1885 = {_T_1878[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1887 = _T_1885 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1888 = _T_1883 | _T_1887; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_115 = {{2'd0}, _T_1888[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1893 = _GEN_115 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1895 = {_T_1888[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1897 = _T_1895 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1898 = _T_1893 | _T_1897; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_116 = {{1'd0}, _T_1898[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1903 = _GEN_116 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_1905 = {_T_1898[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_1907 = _T_1905 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] _T_1908 = _T_1903 | _T_1907; // @[Bitwise.scala 103:39]
  wire [63:0] _GEN_117 = {{32'd0}, _T_1908}; // @[lsu_dccm_ctl.scala 265:115]
  wire [63:0] _T_1909 = _T_1843 & _GEN_117; // @[lsu_dccm_ctl.scala 265:115]
  wire  _T_1914 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_dccm_ctl.scala 272:58]
  wire  _T_1915 = _T_1914 & io_addr_in_pic_r; // @[lsu_dccm_ctl.scala 272:84]
  wire  _T_1916 = _T_1915 & io_lsu_commit_r; // @[lsu_dccm_ctl.scala 272:103]
  wire  _T_1918 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_load; // @[lsu_dccm_ctl.scala 273:58]
  wire  _T_1920 = io_lsu_pkt_d_valid & io_lsu_pkt_d_bits_store; // @[lsu_dccm_ctl.scala 274:58]
  wire [31:0] _T_1924 = {17'h0,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [14:0] _T_1930 = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[lsu_dccm_ctl.scala 276:93]
  wire [31:0] _T_1931 = {17'h0,_T_1930}; // @[Cat.scala 29:58]
  reg  _T_1938; // @[lsu_dccm_ctl.scala 280:61]
  rvclkhdr rvclkhdr ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_lsu_ld_data_corr_r = _T_817[31:0]; // @[lsu_dccm_ctl.scala 157:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[lsu_dccm_ctl.scala 268:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[lsu_dccm_ctl.scala 267:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[lsu_dccm_ctl.scala 270:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[lsu_dccm_ctl.scala 269:27]
  assign io_lsu_ld_data_m = _T_820[31:0]; // @[lsu_dccm_ctl.scala 158:28]
  assign io_store_data_hi_r = _T_1435; // @[lsu_dccm_ctl.scala 262:29]
  assign io_store_data_lo_r = _T_1224; // @[lsu_dccm_ctl.scala 261:29]
  assign io_store_datafn_hi_r = _T_1832 | _T_1836; // @[lsu_dccm_ctl.scala 264:29]
  assign io_store_datafn_lo_r = _T_1631 | _T_1635; // @[lsu_dccm_ctl.scala 263:29]
  assign io_store_data_r = _T_1909[31:0]; // @[lsu_dccm_ctl.scala 265:29]
  assign io_ld_single_ecc_error_r = _T_872 & _T_873; // @[lsu_dccm_ctl.scala 171:34]
  assign io_ld_single_ecc_error_r_ff = _T_889 & _T_890; // @[lsu_dccm_ctl.scala 178:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[lsu_dccm_ctl.scala 277:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_904; // @[lsu_dccm_ctl.scala 179:31]
  assign io_lsu_dccm_rden_m = _T_1938; // @[lsu_dccm_ctl.scala 280:24]
  assign io_dma_dccm_ctl_dccm_dma_rvalid = _T & io_lsu_pkt_m_bits_dma; // @[lsu_dccm_ctl.scala 145:41]
  assign io_dma_dccm_ctl_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[lsu_dccm_ctl.scala 146:41]
  assign io_dma_dccm_ctl_dccm_dma_rtag = io_dma_mem_tag_m; // @[lsu_dccm_ctl.scala 148:41]
  assign io_dma_dccm_ctl_dccm_dma_rdata = _T_4[63:0]; // @[lsu_dccm_ctl.scala 147:41]
  assign io_dccm_wren = _T_906 | io_ld_single_ecc_error_r_ff; // @[lsu_dccm_ctl.scala 185:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[lsu_dccm_ctl.scala 186:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_913 : _T_917; // @[lsu_dccm_ctl.scala 188:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_923 : _T_927; // @[lsu_dccm_ctl.scala 192:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d[15:0]; // @[lsu_dccm_ctl.scala 196:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[lsu_dccm_ctl.scala 197:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_939 : _T_947; // @[lsu_dccm_ctl.scala 199:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_957 : _T_965; // @[lsu_dccm_ctl.scala 205:22]
  assign io_lsu_pic_picm_wren = _T_1916 | io_dma_pic_wen; // @[lsu_dccm_ctl.scala 272:35]
  assign io_lsu_pic_picm_rden = _T_1918 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 273:35]
  assign io_lsu_pic_picm_mken = _T_1920 & io_addr_in_pic_d; // @[lsu_dccm_ctl.scala 274:35]
  assign io_lsu_pic_picm_rdaddr = 32'hf00c0000 | _T_1924; // @[lsu_dccm_ctl.scala 275:35]
  assign io_lsu_pic_picm_wraddr = 32'hf00c0000 | _T_1931; // @[lsu_dccm_ctl.scala 276:35]
  assign io_lsu_pic_picm_wr_data = io_dma_pic_wen ? io_dma_dccm_ctl_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[lsu_dccm_ctl.scala 278:35]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_io_en = _T_813 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = _T_1431 | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  _T_817 = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  ld_single_ecc_error_lo_r_ff = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ld_single_ecc_error_hi_r_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsu_double_ecc_error_r_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ld_sec_addr_lo_r_ff = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  ld_sec_addr_hi_r_ff = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1224 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1435 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_1938 = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_817 = 64'h0;
  end
  if (reset) begin
    ld_single_ecc_error_lo_r_ff = 1'h0;
  end
  if (reset) begin
    ld_single_ecc_error_hi_r_ff = 1'h0;
  end
  if (reset) begin
    lsu_double_ecc_error_r_ff = 1'h0;
  end
  if (reset) begin
    ld_sec_addr_lo_r_ff = 16'h0;
  end
  if (reset) begin
    ld_sec_addr_hi_r_ff = 16'h0;
  end
  if (reset) begin
    _T_1224 = 32'h0;
  end
  if (reset) begin
    _T_1435 = 32'h0;
  end
  if (reset) begin
    _T_1938 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_817 <= 64'h0;
    end else begin
      _T_817 <= lsu_rdata_corr_m >> _T_819;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_876 & _T_877;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_hi_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_hi_r_ff <= _T_879 & _T_880;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_double_ecc_error_r_ff <= 1'h0;
    end else begin
      lsu_double_ecc_error_r_ff <= io_lsu_double_ecc_error_r;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_lo_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_lo_r_ff <= io_lsu_addr_r[15:0];
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      ld_sec_addr_hi_r_ff <= 16'h0;
    end else begin
      ld_sec_addr_hi_r_ff <= io_end_addr_r;
    end
  end
  always @(posedge io_lsu_store_c1_r_clk or posedge reset) begin
    if (reset) begin
      _T_1224 <= 32'h0;
    end else begin
      _T_1224 <= _T_1218 | _T_1222;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1435 <= 32'h0;
    end else begin
      _T_1435 <= _T_1424 | _T_1428;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_1938 <= 1'h0;
    end else begin
      _T_1938 <= _T_888 & io_addr_in_dccm_d;
    end
  end
endmodule
module lsu_stbuf(
  input         clock,
  input         reset,
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
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_end_addr_r,
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 368:23]
  wire [1:0] _T_5 = io_lsu_pkt_r_bits_half ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_7 = io_lsu_pkt_r_bits_dword ? 8'hff : 8'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_10 = {{1'd0}, io_lsu_pkt_r_bits_by}; // @[Mux.scala 27:72]
  wire [1:0] _T_8 = _GEN_10 | _T_5; // @[Mux.scala 27:72]
  wire [3:0] _GEN_11 = {{2'd0}, _T_8}; // @[Mux.scala 27:72]
  wire [3:0] _T_9 = _GEN_11 | _T_6; // @[Mux.scala 27:72]
  wire [7:0] _GEN_12 = {{4'd0}, _T_9}; // @[Mux.scala 27:72]
  wire [7:0] ldst_byteen_r = _GEN_12 | _T_7; // @[Mux.scala 27:72]
  wire  dual_stbuf_write_r = io_ldst_dual_r & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 115:43]
  wire [10:0] _GEN_13 = {{3'd0}, ldst_byteen_r}; // @[lsu_stbuf.scala 117:39]
  wire [10:0] _T_12 = _GEN_13 << io_lsu_addr_r[1:0]; // @[lsu_stbuf.scala 117:39]
  wire [7:0] store_byteen_ext_r = _T_12[7:0]; // @[lsu_stbuf.scala 117:22]
  wire [3:0] _T_15 = io_lsu_pkt_r_bits_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_15; // @[lsu_stbuf.scala 118:52]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_15; // @[lsu_stbuf.scala 119:52]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] RdPtrPlus1 = RdPtr + 2'h1; // @[lsu_stbuf.scala 121:26]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[lsu_stbuf.scala 122:26]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[lsu_stbuf.scala 123:26]
  wire  _T_22 = io_lsu_commit_r | io_lsu_pkt_r_bits_dma; // @[lsu_stbuf.scala 125:46]
  reg [15:0] stbuf_addr_0; // @[lib.scala 374:16]
  wire  _T_26 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  reg  _T_587; // @[lsu_stbuf.scala 160:14]
  reg  _T_579; // @[lsu_stbuf.scala 160:14]
  reg  _T_571; // @[lsu_stbuf.scala 160:14]
  reg  _T_563; // @[lsu_stbuf.scala 160:14]
  wire [3:0] stbuf_vld = {_T_587,_T_579,_T_571,_T_563}; // @[Cat.scala 29:58]
  wire  _T_28 = _T_26 & stbuf_vld[0]; // @[lsu_stbuf.scala 127:179]
  reg  _T_622; // @[lsu_stbuf.scala 163:14]
  reg  _T_614; // @[lsu_stbuf.scala 163:14]
  reg  _T_606; // @[lsu_stbuf.scala 163:14]
  reg  _T_598; // @[lsu_stbuf.scala 163:14]
  wire [3:0] stbuf_dma_kill = {_T_622,_T_614,_T_606,_T_598}; // @[Cat.scala 29:58]
  wire  _T_30 = ~stbuf_dma_kill[0]; // @[lsu_stbuf.scala 127:197]
  wire  _T_31 = _T_28 & _T_30; // @[lsu_stbuf.scala 127:195]
  wire  _T_211 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[lsu_stbuf.scala 138:81]
  wire  _T_212 = 2'h3 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_214 = _T_211 & _T_212; // @[lsu_stbuf.scala 138:112]
  wire  _T_208 = 2'h2 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_210 = _T_211 & _T_208; // @[lsu_stbuf.scala 138:112]
  wire  _T_204 = 2'h1 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_206 = _T_211 & _T_204; // @[lsu_stbuf.scala 138:112]
  wire  _T_200 = 2'h0 == RdPtr; // @[lsu_stbuf.scala 138:124]
  wire  _T_202 = _T_211 & _T_200; // @[lsu_stbuf.scala 138:112]
  wire [3:0] stbuf_reset = {_T_214,_T_210,_T_206,_T_202}; // @[Cat.scala 29:58]
  wire  _T_33 = ~stbuf_reset[0]; // @[lsu_stbuf.scala 127:218]
  wire  _T_34 = _T_31 & _T_33; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_1; // @[lib.scala 374:16]
  wire  _T_37 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_39 = _T_37 & stbuf_vld[1]; // @[lsu_stbuf.scala 127:179]
  wire  _T_41 = ~stbuf_dma_kill[1]; // @[lsu_stbuf.scala 127:197]
  wire  _T_42 = _T_39 & _T_41; // @[lsu_stbuf.scala 127:195]
  wire  _T_44 = ~stbuf_reset[1]; // @[lsu_stbuf.scala 127:218]
  wire  _T_45 = _T_42 & _T_44; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_2; // @[lib.scala 374:16]
  wire  _T_48 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_50 = _T_48 & stbuf_vld[2]; // @[lsu_stbuf.scala 127:179]
  wire  _T_52 = ~stbuf_dma_kill[2]; // @[lsu_stbuf.scala 127:197]
  wire  _T_53 = _T_50 & _T_52; // @[lsu_stbuf.scala 127:195]
  wire  _T_55 = ~stbuf_reset[2]; // @[lsu_stbuf.scala 127:218]
  wire  _T_56 = _T_53 & _T_55; // @[lsu_stbuf.scala 127:216]
  reg [15:0] stbuf_addr_3; // @[lib.scala 374:16]
  wire  _T_59 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[lsu_stbuf.scala 127:120]
  wire  _T_61 = _T_59 & stbuf_vld[3]; // @[lsu_stbuf.scala 127:179]
  wire  _T_63 = ~stbuf_dma_kill[3]; // @[lsu_stbuf.scala 127:197]
  wire  _T_64 = _T_61 & _T_63; // @[lsu_stbuf.scala 127:195]
  wire  _T_66 = ~stbuf_reset[3]; // @[lsu_stbuf.scala 127:218]
  wire  _T_67 = _T_64 & _T_66; // @[lsu_stbuf.scala 127:216]
  wire [3:0] store_matchvec_lo_r = {_T_67,_T_56,_T_45,_T_34}; // @[Cat.scala 29:58]
  wire  _T_72 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_74 = _T_72 & stbuf_vld[0]; // @[lsu_stbuf.scala 128:179]
  wire  _T_77 = _T_74 & _T_30; // @[lsu_stbuf.scala 128:194]
  wire  _T_78 = _T_77 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_81 = _T_78 & _T_33; // @[lsu_stbuf.scala 128:236]
  wire  _T_84 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_86 = _T_84 & stbuf_vld[1]; // @[lsu_stbuf.scala 128:179]
  wire  _T_89 = _T_86 & _T_41; // @[lsu_stbuf.scala 128:194]
  wire  _T_90 = _T_89 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_93 = _T_90 & _T_44; // @[lsu_stbuf.scala 128:236]
  wire  _T_96 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_98 = _T_96 & stbuf_vld[2]; // @[lsu_stbuf.scala 128:179]
  wire  _T_101 = _T_98 & _T_52; // @[lsu_stbuf.scala 128:194]
  wire  _T_102 = _T_101 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_105 = _T_102 & _T_55; // @[lsu_stbuf.scala 128:236]
  wire  _T_108 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[lsu_stbuf.scala 128:120]
  wire  _T_110 = _T_108 & stbuf_vld[3]; // @[lsu_stbuf.scala 128:179]
  wire  _T_113 = _T_110 & _T_63; // @[lsu_stbuf.scala 128:194]
  wire  _T_114 = _T_113 & dual_stbuf_write_r; // @[lsu_stbuf.scala 128:215]
  wire  _T_117 = _T_114 & _T_66; // @[lsu_stbuf.scala 128:236]
  wire [3:0] store_matchvec_hi_r = {_T_117,_T_105,_T_93,_T_81}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[lsu_stbuf.scala 130:49]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[lsu_stbuf.scala 131:49]
  wire  _T_120 = 2'h0 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_121 = ~store_coalesce_lo_r; // @[lsu_stbuf.scala 134:31]
  wire  _T_122 = _T_120 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_124 = _T_120 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_125 = ~store_coalesce_hi_r; // @[lsu_stbuf.scala 135:54]
  wire  _T_126 = _T_124 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_127 = _T_122 | _T_126; // @[lsu_stbuf.scala 134:53]
  wire  _T_128 = 2'h0 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_129 = _T_128 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_130 = store_coalesce_lo_r | store_coalesce_hi_r; // @[lsu_stbuf.scala 136:81]
  wire  _T_131 = ~_T_130; // @[lsu_stbuf.scala 136:59]
  wire  _T_132 = _T_129 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_133 = _T_127 | _T_132; // @[lsu_stbuf.scala 135:76]
  wire  _T_135 = _T_133 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 136:105]
  wire  _T_137 = _T_135 | store_matchvec_hi_r[0]; // @[lsu_stbuf.scala 137:32]
  wire  _T_138 = io_ldst_stbuf_reqvld_r & _T_137; // @[lsu_stbuf.scala 133:79]
  wire  _T_139 = 2'h1 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_141 = _T_139 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_143 = _T_139 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_145 = _T_143 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_146 = _T_141 | _T_145; // @[lsu_stbuf.scala 134:53]
  wire  _T_147 = 2'h1 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_148 = _T_147 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_151 = _T_148 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_152 = _T_146 | _T_151; // @[lsu_stbuf.scala 135:76]
  wire  _T_154 = _T_152 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 136:105]
  wire  _T_156 = _T_154 | store_matchvec_hi_r[1]; // @[lsu_stbuf.scala 137:32]
  wire  _T_157 = io_ldst_stbuf_reqvld_r & _T_156; // @[lsu_stbuf.scala 133:79]
  wire  _T_158 = 2'h2 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_160 = _T_158 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_162 = _T_158 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_164 = _T_162 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_165 = _T_160 | _T_164; // @[lsu_stbuf.scala 134:53]
  wire  _T_166 = 2'h2 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_167 = _T_166 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_170 = _T_167 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_171 = _T_165 | _T_170; // @[lsu_stbuf.scala 135:76]
  wire  _T_173 = _T_171 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 136:105]
  wire  _T_175 = _T_173 | store_matchvec_hi_r[2]; // @[lsu_stbuf.scala 137:32]
  wire  _T_176 = io_ldst_stbuf_reqvld_r & _T_175; // @[lsu_stbuf.scala 133:79]
  wire  _T_177 = 2'h3 == WrPtr; // @[lsu_stbuf.scala 134:18]
  wire  _T_179 = _T_177 & _T_121; // @[lsu_stbuf.scala 134:29]
  wire  _T_181 = _T_177 & dual_stbuf_write_r; // @[lsu_stbuf.scala 135:31]
  wire  _T_183 = _T_181 & _T_125; // @[lsu_stbuf.scala 135:52]
  wire  _T_184 = _T_179 | _T_183; // @[lsu_stbuf.scala 134:53]
  wire  _T_185 = 2'h3 == WrPtrPlus1; // @[lsu_stbuf.scala 136:20]
  wire  _T_186 = _T_185 & dual_stbuf_write_r; // @[lsu_stbuf.scala 136:36]
  wire  _T_189 = _T_186 & _T_131; // @[lsu_stbuf.scala 136:57]
  wire  _T_190 = _T_184 | _T_189; // @[lsu_stbuf.scala 135:76]
  wire  _T_192 = _T_190 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 136:105]
  wire  _T_194 = _T_192 | store_matchvec_hi_r[3]; // @[lsu_stbuf.scala 137:32]
  wire  _T_195 = io_ldst_stbuf_reqvld_r & _T_194; // @[lsu_stbuf.scala 133:79]
  wire [3:0] stbuf_wr_en = {_T_195,_T_176,_T_157,_T_138}; // @[Cat.scala 29:58]
  wire  _T_218 = ~io_ldst_dual_r; // @[lsu_stbuf.scala 139:56]
  wire  _T_219 = _T_218 | io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 139:72]
  wire  _T_222 = _T_219 & _T_120; // @[lsu_stbuf.scala 139:99]
  wire  _T_224 = _T_222 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_226 = _T_224 | store_matchvec_lo_r[0]; // @[lsu_stbuf.scala 139:153]
  wire  _T_231 = _T_219 & _T_139; // @[lsu_stbuf.scala 139:99]
  wire  _T_233 = _T_231 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_235 = _T_233 | store_matchvec_lo_r[1]; // @[lsu_stbuf.scala 139:153]
  wire  _T_240 = _T_219 & _T_158; // @[lsu_stbuf.scala 139:99]
  wire  _T_242 = _T_240 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_244 = _T_242 | store_matchvec_lo_r[2]; // @[lsu_stbuf.scala 139:153]
  wire  _T_249 = _T_219 & _T_177; // @[lsu_stbuf.scala 139:99]
  wire  _T_251 = _T_249 & _T_121; // @[lsu_stbuf.scala 139:129]
  wire  _T_253 = _T_251 | store_matchvec_lo_r[3]; // @[lsu_stbuf.scala 139:153]
  wire [3:0] sel_lo = {_T_253,_T_244,_T_235,_T_226}; // @[Cat.scala 29:58]
  reg [3:0] stbuf_byteen_0; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_273 = stbuf_byteen_0 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_274 = stbuf_byteen_0 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_0 = sel_lo[0] ? _T_273 : _T_274; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_1; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_277 = stbuf_byteen_1 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_278 = stbuf_byteen_1 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_1 = sel_lo[1] ? _T_277 : _T_278; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_2; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_281 = stbuf_byteen_2 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_282 = stbuf_byteen_2 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_2 = sel_lo[2] ? _T_281 : _T_282; // @[lsu_stbuf.scala 142:61]
  reg [3:0] stbuf_byteen_3; // @[lsu_stbuf.scala 166:14]
  wire [3:0] _T_285 = stbuf_byteen_3 | store_byteen_lo_r; // @[lsu_stbuf.scala 142:89]
  wire [3:0] _T_286 = stbuf_byteen_3 | store_byteen_hi_r; // @[lsu_stbuf.scala 142:126]
  wire [3:0] stbuf_byteenin_3 = sel_lo[3] ? _T_285 : _T_286; // @[lsu_stbuf.scala 142:61]
  wire  _T_290 = ~stbuf_byteen_0[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_292 = _T_290 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_0; // @[lib.scala 374:16]
  wire [7:0] _T_295 = _T_292 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_299 = _T_290 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_302 = _T_299 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_0 = sel_lo[0] ? _T_295 : _T_302; // @[lsu_stbuf.scala 144:54]
  wire  _T_306 = ~stbuf_byteen_1[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_308 = _T_306 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_1; // @[lib.scala 374:16]
  wire [7:0] _T_311 = _T_308 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_315 = _T_306 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_318 = _T_315 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_1 = sel_lo[1] ? _T_311 : _T_318; // @[lsu_stbuf.scala 144:54]
  wire  _T_322 = ~stbuf_byteen_2[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_324 = _T_322 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_2; // @[lib.scala 374:16]
  wire [7:0] _T_327 = _T_324 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_331 = _T_322 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_334 = _T_331 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_2 = sel_lo[2] ? _T_327 : _T_334; // @[lsu_stbuf.scala 144:54]
  wire  _T_338 = ~stbuf_byteen_3[0]; // @[lsu_stbuf.scala 144:70]
  wire  _T_340 = _T_338 | store_byteen_lo_r[0]; // @[lsu_stbuf.scala 144:90]
  reg [31:0] stbuf_data_3; // @[lib.scala 374:16]
  wire [7:0] _T_343 = _T_340 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 144:69]
  wire  _T_347 = _T_338 | store_byteen_hi_r[0]; // @[lsu_stbuf.scala 145:31]
  wire [7:0] _T_350 = _T_347 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[lsu_stbuf.scala 145:10]
  wire [7:0] datain1_3 = sel_lo[3] ? _T_343 : _T_350; // @[lsu_stbuf.scala 144:54]
  wire  _T_354 = ~stbuf_byteen_0[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_356 = _T_354 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_359 = _T_356 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_363 = _T_354 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_366 = _T_363 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_0 = sel_lo[0] ? _T_359 : _T_366; // @[lsu_stbuf.scala 147:54]
  wire  _T_370 = ~stbuf_byteen_1[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_372 = _T_370 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_375 = _T_372 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_379 = _T_370 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_382 = _T_379 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_1 = sel_lo[1] ? _T_375 : _T_382; // @[lsu_stbuf.scala 147:54]
  wire  _T_386 = ~stbuf_byteen_2[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_388 = _T_386 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_391 = _T_388 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_395 = _T_386 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_398 = _T_395 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_2 = sel_lo[2] ? _T_391 : _T_398; // @[lsu_stbuf.scala 147:54]
  wire  _T_402 = ~stbuf_byteen_3[1]; // @[lsu_stbuf.scala 147:70]
  wire  _T_404 = _T_402 | store_byteen_lo_r[1]; // @[lsu_stbuf.scala 147:90]
  wire [7:0] _T_407 = _T_404 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 147:69]
  wire  _T_411 = _T_402 | store_byteen_hi_r[1]; // @[lsu_stbuf.scala 148:31]
  wire [7:0] _T_414 = _T_411 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[lsu_stbuf.scala 148:10]
  wire [7:0] datain2_3 = sel_lo[3] ? _T_407 : _T_414; // @[lsu_stbuf.scala 147:54]
  wire  _T_418 = ~stbuf_byteen_0[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_420 = _T_418 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_423 = _T_420 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_427 = _T_418 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_430 = _T_427 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_0 = sel_lo[0] ? _T_423 : _T_430; // @[lsu_stbuf.scala 150:54]
  wire  _T_434 = ~stbuf_byteen_1[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_436 = _T_434 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_439 = _T_436 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_443 = _T_434 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_446 = _T_443 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_1 = sel_lo[1] ? _T_439 : _T_446; // @[lsu_stbuf.scala 150:54]
  wire  _T_450 = ~stbuf_byteen_2[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_452 = _T_450 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_455 = _T_452 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_459 = _T_450 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_462 = _T_459 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_2 = sel_lo[2] ? _T_455 : _T_462; // @[lsu_stbuf.scala 150:54]
  wire  _T_466 = ~stbuf_byteen_3[2]; // @[lsu_stbuf.scala 150:70]
  wire  _T_468 = _T_466 | store_byteen_lo_r[2]; // @[lsu_stbuf.scala 150:90]
  wire [7:0] _T_471 = _T_468 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 150:69]
  wire  _T_475 = _T_466 | store_byteen_hi_r[2]; // @[lsu_stbuf.scala 151:31]
  wire [7:0] _T_478 = _T_475 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[lsu_stbuf.scala 151:10]
  wire [7:0] datain3_3 = sel_lo[3] ? _T_471 : _T_478; // @[lsu_stbuf.scala 150:54]
  wire  _T_482 = ~stbuf_byteen_0[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_484 = _T_482 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_487 = _T_484 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_491 = _T_482 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_494 = _T_491 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_0 = sel_lo[0] ? _T_487 : _T_494; // @[lsu_stbuf.scala 153:54]
  wire  _T_498 = ~stbuf_byteen_1[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_500 = _T_498 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_503 = _T_500 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_507 = _T_498 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_510 = _T_507 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_1 = sel_lo[1] ? _T_503 : _T_510; // @[lsu_stbuf.scala 153:54]
  wire  _T_514 = ~stbuf_byteen_2[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_516 = _T_514 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_519 = _T_516 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_523 = _T_514 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_526 = _T_523 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_2 = sel_lo[2] ? _T_519 : _T_526; // @[lsu_stbuf.scala 153:54]
  wire  _T_530 = ~stbuf_byteen_3[3]; // @[lsu_stbuf.scala 153:70]
  wire  _T_532 = _T_530 | store_byteen_lo_r[3]; // @[lsu_stbuf.scala 153:90]
  wire [7:0] _T_535 = _T_532 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 153:69]
  wire  _T_539 = _T_530 | store_byteen_hi_r[3]; // @[lsu_stbuf.scala 154:31]
  wire [7:0] _T_542 = _T_539 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[lsu_stbuf.scala 154:10]
  wire [7:0] datain4_3 = sel_lo[3] ? _T_535 : _T_542; // @[lsu_stbuf.scala 153:54]
  wire [15:0] _T_544 = {datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_545 = {datain4_0,datain3_0}; // @[Cat.scala 29:58]
  wire [15:0] _T_547 = {datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_548 = {datain4_1,datain3_1}; // @[Cat.scala 29:58]
  wire [15:0] _T_550 = {datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_551 = {datain4_2,datain3_2}; // @[Cat.scala 29:58]
  wire [15:0] _T_553 = {datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] _T_554 = {datain4_3,datain3_3}; // @[Cat.scala 29:58]
  wire  _T_559 = stbuf_wr_en[0] | stbuf_vld[0]; // @[lsu_stbuf.scala 160:18]
  wire  _T_567 = stbuf_wr_en[1] | stbuf_vld[1]; // @[lsu_stbuf.scala 160:18]
  wire  _T_575 = stbuf_wr_en[2] | stbuf_vld[2]; // @[lsu_stbuf.scala 160:18]
  wire  _T_583 = stbuf_wr_en[3] | stbuf_vld[3]; // @[lsu_stbuf.scala 160:18]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[lsu_stbuf.scala 208:16]
  wire  _T_786 = stbuf_addr_3[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_788 = _T_786 & stbuf_vld[3]; // @[lsu_stbuf.scala 212:139]
  wire  _T_791 = _T_788 & _T_63; // @[lsu_stbuf.scala 212:154]
  wire  _T_792 = _T_791 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_777 = stbuf_addr_2[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_779 = _T_777 & stbuf_vld[2]; // @[lsu_stbuf.scala 212:139]
  wire  _T_782 = _T_779 & _T_52; // @[lsu_stbuf.scala 212:154]
  wire  _T_783 = _T_782 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_768 = stbuf_addr_1[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_770 = _T_768 & stbuf_vld[1]; // @[lsu_stbuf.scala 212:139]
  wire  _T_773 = _T_770 & _T_41; // @[lsu_stbuf.scala 212:154]
  wire  _T_774 = _T_773 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire  _T_759 = stbuf_addr_0[15:2] == cmpaddr_hi_m[13:0]; // @[lsu_stbuf.scala 212:115]
  wire  _T_761 = _T_759 & stbuf_vld[0]; // @[lsu_stbuf.scala 212:139]
  wire  _T_764 = _T_761 & _T_30; // @[lsu_stbuf.scala 212:154]
  wire  _T_765 = _T_764 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 212:175]
  wire [3:0] stbuf_match_hi = {_T_792,_T_783,_T_774,_T_765}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[lsu_stbuf.scala 209:17]
  wire  _T_824 = stbuf_addr_3[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_826 = _T_824 & stbuf_vld[3]; // @[lsu_stbuf.scala 213:139]
  wire  _T_829 = _T_826 & _T_63; // @[lsu_stbuf.scala 213:154]
  wire  _T_830 = _T_829 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_815 = stbuf_addr_2[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_817 = _T_815 & stbuf_vld[2]; // @[lsu_stbuf.scala 213:139]
  wire  _T_820 = _T_817 & _T_52; // @[lsu_stbuf.scala 213:154]
  wire  _T_821 = _T_820 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_806 = stbuf_addr_1[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_808 = _T_806 & stbuf_vld[1]; // @[lsu_stbuf.scala 213:139]
  wire  _T_811 = _T_808 & _T_41; // @[lsu_stbuf.scala 213:154]
  wire  _T_812 = _T_811 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire  _T_797 = stbuf_addr_0[15:2] == cmpaddr_lo_m[13:0]; // @[lsu_stbuf.scala 213:115]
  wire  _T_799 = _T_797 & stbuf_vld[0]; // @[lsu_stbuf.scala 213:139]
  wire  _T_802 = _T_799 & _T_30; // @[lsu_stbuf.scala 213:154]
  wire  _T_803 = _T_802 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 213:175]
  wire [3:0] stbuf_match_lo = {_T_830,_T_821,_T_812,_T_803}; // @[Cat.scala 29:58]
  wire  _T_853 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[lsu_stbuf.scala 214:78]
  wire  _T_854 = _T_853 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_855 = _T_854 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_856 = _T_855 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_847 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[lsu_stbuf.scala 214:78]
  wire  _T_848 = _T_847 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_849 = _T_848 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_850 = _T_849 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_841 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[lsu_stbuf.scala 214:78]
  wire  _T_842 = _T_841 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_843 = _T_842 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_844 = _T_843 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire  _T_835 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[lsu_stbuf.scala 214:78]
  wire  _T_836 = _T_835 & io_lsu_pkt_m_valid; // @[lsu_stbuf.scala 214:99]
  wire  _T_837 = _T_836 & io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 214:120]
  wire  _T_838 = _T_837 & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 214:144]
  wire [3:0] stbuf_dma_kill_en = {_T_856,_T_850,_T_844,_T_838}; // @[Cat.scala 29:58]
  wire  _T_594 = stbuf_dma_kill_en[0] | stbuf_dma_kill[0]; // @[lsu_stbuf.scala 163:18]
  wire  _T_602 = stbuf_dma_kill_en[1] | stbuf_dma_kill[1]; // @[lsu_stbuf.scala 163:18]
  wire  _T_610 = stbuf_dma_kill_en[2] | stbuf_dma_kill[2]; // @[lsu_stbuf.scala 163:18]
  wire  _T_618 = stbuf_dma_kill_en[3] | stbuf_dma_kill[3]; // @[lsu_stbuf.scala 163:18]
  wire [3:0] _T_628 = stbuf_wr_en[0] ? stbuf_byteenin_0 : stbuf_byteen_0; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_632 = _T_33 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_637 = stbuf_wr_en[1] ? stbuf_byteenin_1 : stbuf_byteen_1; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_641 = _T_44 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_646 = stbuf_wr_en[2] ? stbuf_byteenin_2 : stbuf_byteen_2; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_650 = _T_55 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_655 = stbuf_wr_en[3] ? stbuf_byteenin_3 : stbuf_byteen_3; // @[lsu_stbuf.scala 166:18]
  wire [3:0] _T_659 = _T_66 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_686 = stbuf_vld >> RdPtr; // @[lsu_stbuf.scala 183:43]
  wire [3:0] _T_688 = stbuf_dma_kill >> RdPtr; // @[lsu_stbuf.scala 183:67]
  wire  _T_695 = ~_T_688[0]; // @[lsu_stbuf.scala 184:46]
  wire  _T_696 = _T_686[0] & _T_695; // @[lsu_stbuf.scala 184:44]
  wire  _T_697 = |stbuf_dma_kill_en; // @[lsu_stbuf.scala 184:91]
  wire  _T_698 = ~_T_697; // @[lsu_stbuf.scala 184:71]
  wire [15:0] _GEN_1 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[lsu_stbuf.scala 185:22]
  wire [15:0] _GEN_2 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_1; // @[lsu_stbuf.scala 185:22]
  wire [31:0] _GEN_5 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[lsu_stbuf.scala 186:22]
  wire [31:0] _GEN_6 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_5; // @[lsu_stbuf.scala 186:22]
  wire  _T_700 = ~dual_stbuf_write_r; // @[lsu_stbuf.scala 188:44]
  wire  _T_701 = io_ldst_stbuf_reqvld_r & _T_700; // @[lsu_stbuf.scala 188:42]
  wire  _T_702 = store_coalesce_hi_r | store_coalesce_lo_r; // @[lsu_stbuf.scala 188:88]
  wire  _T_703 = ~_T_702; // @[lsu_stbuf.scala 188:66]
  wire  _T_704 = _T_701 & _T_703; // @[lsu_stbuf.scala 188:64]
  wire  _T_705 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[lsu_stbuf.scala 189:30]
  wire  _T_706 = store_coalesce_hi_r & store_coalesce_lo_r; // @[lsu_stbuf.scala 189:76]
  wire  _T_707 = ~_T_706; // @[lsu_stbuf.scala 189:54]
  wire  _T_708 = _T_705 & _T_707; // @[lsu_stbuf.scala 189:52]
  wire  WrPtrEn = _T_704 | _T_708; // @[lsu_stbuf.scala 188:113]
  wire  _T_713 = _T_705 & _T_703; // @[lsu_stbuf.scala 190:67]
  wire [3:0] _T_718 = {3'h0,stbuf_vld[0]}; // @[Cat.scala 29:58]
  wire [3:0] _T_720 = {3'h0,stbuf_vld[1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_722 = {3'h0,stbuf_vld[2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_724 = {3'h0,stbuf_vld[3]}; // @[Cat.scala 29:58]
  wire [3:0] _T_727 = _T_718 + _T_720; // @[lsu_stbuf.scala 197:101]
  wire [3:0] _T_729 = _T_727 + _T_722; // @[lsu_stbuf.scala 197:101]
  wire [3:0] stbuf_numvld_any = _T_729 + _T_724; // @[lsu_stbuf.scala 197:101]
  wire  _T_731 = io_lsu_pkt_m_valid & io_lsu_pkt_m_bits_store; // @[lsu_stbuf.scala 198:39]
  wire  _T_732 = _T_731 & io_addr_in_dccm_m; // @[lsu_stbuf.scala 198:65]
  wire  _T_733 = ~io_lsu_pkt_m_bits_dma; // @[lsu_stbuf.scala 198:87]
  wire  isdccmst_m = _T_732 & _T_733; // @[lsu_stbuf.scala 198:85]
  wire  _T_734 = io_lsu_pkt_r_valid & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 199:39]
  wire  _T_735 = _T_734 & io_addr_in_dccm_r; // @[lsu_stbuf.scala 199:65]
  wire  _T_736 = ~io_lsu_pkt_r_bits_dma; // @[lsu_stbuf.scala 199:87]
  wire  isdccmst_r = _T_735 & _T_736; // @[lsu_stbuf.scala 199:85]
  wire [1:0] _T_737 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_738 = isdccmst_m & io_ldst_dual_m; // @[lsu_stbuf.scala 201:62]
  wire [2:0] _GEN_14 = {{1'd0}, _T_737}; // @[lsu_stbuf.scala 201:47]
  wire [2:0] _T_739 = _GEN_14 << _T_738; // @[lsu_stbuf.scala 201:47]
  wire [1:0] _T_740 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_741 = isdccmst_r & io_ldst_dual_r; // @[lsu_stbuf.scala 202:62]
  wire [2:0] _GEN_15 = {{1'd0}, _T_740}; // @[lsu_stbuf.scala 202:47]
  wire [2:0] _T_742 = _GEN_15 << _T_741; // @[lsu_stbuf.scala 202:47]
  wire [1:0] stbuf_specvld_m = _T_739[1:0]; // @[lsu_stbuf.scala 201:19]
  wire [3:0] _T_743 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_745 = stbuf_numvld_any + _T_743; // @[lsu_stbuf.scala 203:44]
  wire [1:0] stbuf_specvld_r = _T_742[1:0]; // @[lsu_stbuf.scala 202:19]
  wire [3:0] _T_746 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_745 + _T_746; // @[lsu_stbuf.scala 203:78]
  wire  _T_748 = ~io_ldst_dual_d; // @[lsu_stbuf.scala 205:34]
  wire  _T_749 = _T_748 & io_dec_lsu_valid_raw_d; // @[lsu_stbuf.scala 205:50]
  wire  _T_751 = stbuf_specvld_any >= 4'h4; // @[lsu_stbuf.scala 205:102]
  wire  _T_752 = stbuf_specvld_any >= 4'h3; // @[lsu_stbuf.scala 205:143]
  wire  _T_862 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_0 = _T_862 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_866 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_1 = _T_866 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_870 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_2 = _T_870 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_874 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_0_3 = _T_874 & stbuf_vld[0]; // @[lsu_stbuf.scala 217:137]
  wire  _T_878 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_0 = _T_878 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_882 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_1 = _T_882 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_886 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_2 = _T_886 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_890 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_1_3 = _T_890 & stbuf_vld[1]; // @[lsu_stbuf.scala 217:137]
  wire  _T_894 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_0 = _T_894 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_898 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_1 = _T_898 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_902 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_2 = _T_902 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_906 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_2_3 = _T_906 & stbuf_vld[2]; // @[lsu_stbuf.scala 217:137]
  wire  _T_910 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_0 = _T_910 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_914 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_1 = _T_914 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_918 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_2 = _T_918 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_922 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 217:116]
  wire  stbuf_fwdbyteenvec_hi_3_3 = _T_922 & stbuf_vld[3]; // @[lsu_stbuf.scala 217:137]
  wire  _T_926 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_0 = _T_926 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_930 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_1 = _T_930 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_934 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_2 = _T_934 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_938 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_0_3 = _T_938 & stbuf_vld[0]; // @[lsu_stbuf.scala 218:137]
  wire  _T_942 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_0 = _T_942 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_946 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_1 = _T_946 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_950 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_2 = _T_950 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_954 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_1_3 = _T_954 & stbuf_vld[1]; // @[lsu_stbuf.scala 218:137]
  wire  _T_958 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_0 = _T_958 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_962 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_1 = _T_962 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_966 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_2 = _T_966 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_970 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_2_3 = _T_970 & stbuf_vld[2]; // @[lsu_stbuf.scala 218:137]
  wire  _T_974 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_0 = _T_974 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_978 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_1 = _T_978 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_982 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_2 = _T_982 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_986 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[lsu_stbuf.scala 218:116]
  wire  stbuf_fwdbyteenvec_lo_3_3 = _T_986 & stbuf_vld[3]; // @[lsu_stbuf.scala 218:137]
  wire  _T_988 = stbuf_fwdbyteenvec_hi_0_0 | stbuf_fwdbyteenvec_hi_1_0; // @[lsu_stbuf.scala 219:147]
  wire  _T_989 = _T_988 | stbuf_fwdbyteenvec_hi_2_0; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_989 | stbuf_fwdbyteenvec_hi_3_0; // @[lsu_stbuf.scala 219:147]
  wire  _T_990 = stbuf_fwdbyteenvec_hi_0_1 | stbuf_fwdbyteenvec_hi_1_1; // @[lsu_stbuf.scala 219:147]
  wire  _T_991 = _T_990 | stbuf_fwdbyteenvec_hi_2_1; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_991 | stbuf_fwdbyteenvec_hi_3_1; // @[lsu_stbuf.scala 219:147]
  wire  _T_992 = stbuf_fwdbyteenvec_hi_0_2 | stbuf_fwdbyteenvec_hi_1_2; // @[lsu_stbuf.scala 219:147]
  wire  _T_993 = _T_992 | stbuf_fwdbyteenvec_hi_2_2; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_993 | stbuf_fwdbyteenvec_hi_3_2; // @[lsu_stbuf.scala 219:147]
  wire  _T_994 = stbuf_fwdbyteenvec_hi_0_3 | stbuf_fwdbyteenvec_hi_1_3; // @[lsu_stbuf.scala 219:147]
  wire  _T_995 = _T_994 | stbuf_fwdbyteenvec_hi_2_3; // @[lsu_stbuf.scala 219:147]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_995 | stbuf_fwdbyteenvec_hi_3_3; // @[lsu_stbuf.scala 219:147]
  wire  _T_996 = stbuf_fwdbyteenvec_lo_0_0 | stbuf_fwdbyteenvec_lo_1_0; // @[lsu_stbuf.scala 220:147]
  wire  _T_997 = _T_996 | stbuf_fwdbyteenvec_lo_2_0; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_997 | stbuf_fwdbyteenvec_lo_3_0; // @[lsu_stbuf.scala 220:147]
  wire  _T_998 = stbuf_fwdbyteenvec_lo_0_1 | stbuf_fwdbyteenvec_lo_1_1; // @[lsu_stbuf.scala 220:147]
  wire  _T_999 = _T_998 | stbuf_fwdbyteenvec_lo_2_1; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_999 | stbuf_fwdbyteenvec_lo_3_1; // @[lsu_stbuf.scala 220:147]
  wire  _T_1000 = stbuf_fwdbyteenvec_lo_0_2 | stbuf_fwdbyteenvec_lo_1_2; // @[lsu_stbuf.scala 220:147]
  wire  _T_1001 = _T_1000 | stbuf_fwdbyteenvec_lo_2_2; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_1001 | stbuf_fwdbyteenvec_lo_3_2; // @[lsu_stbuf.scala 220:147]
  wire  _T_1002 = stbuf_fwdbyteenvec_lo_0_3 | stbuf_fwdbyteenvec_lo_1_3; // @[lsu_stbuf.scala 220:147]
  wire  _T_1003 = _T_1002 | stbuf_fwdbyteenvec_lo_2_3; // @[lsu_stbuf.scala 220:147]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_1003 | stbuf_fwdbyteenvec_lo_3_3; // @[lsu_stbuf.scala 220:147]
  wire [31:0] _T_1006 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1007 = _T_1006 & stbuf_data_0; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1010 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1011 = _T_1010 & stbuf_data_1; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1014 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1015 = _T_1014 & stbuf_data_2; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1018 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1019 = _T_1018 & stbuf_data_3; // @[lsu_stbuf.scala 222:97]
  wire [31:0] _T_1021 = _T_1019 | _T_1015; // @[lsu_stbuf.scala 222:130]
  wire [31:0] _T_1022 = _T_1021 | _T_1011; // @[lsu_stbuf.scala 222:130]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_1022 | _T_1007; // @[lsu_stbuf.scala 222:130]
  wire [31:0] _T_1025 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1026 = _T_1025 & stbuf_data_0; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1029 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1030 = _T_1029 & stbuf_data_1; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1033 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1034 = _T_1033 & stbuf_data_2; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1037 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1038 = _T_1037 & stbuf_data_3; // @[lsu_stbuf.scala 223:97]
  wire [31:0] _T_1040 = _T_1038 | _T_1034; // @[lsu_stbuf.scala 223:130]
  wire [31:0] _T_1041 = _T_1040 | _T_1030; // @[lsu_stbuf.scala 223:130]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1041 | _T_1026; // @[lsu_stbuf.scala 223:130]
  wire  _T_1046 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 230:49]
  wire  _T_1047 = _T_1046 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 230:74]
  wire  _T_1048 = _T_1047 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 230:95]
  wire  ld_addr_rhit_lo_lo = _T_1048 & _T_736; // @[lsu_stbuf.scala 230:121]
  wire  _T_1052 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_stbuf.scala 231:49]
  wire  _T_1053 = _T_1052 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 231:74]
  wire  _T_1054 = _T_1053 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 231:95]
  wire  ld_addr_rhit_lo_hi = _T_1054 & _T_736; // @[lsu_stbuf.scala 231:121]
  wire  _T_1058 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 232:49]
  wire  _T_1059 = _T_1058 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 232:74]
  wire  _T_1060 = _T_1059 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 232:95]
  wire  _T_1062 = _T_1060 & _T_736; // @[lsu_stbuf.scala 232:121]
  wire  ld_addr_rhit_hi_lo = _T_1062 & dual_stbuf_write_r; // @[lsu_stbuf.scala 232:146]
  wire  _T_1065 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_stbuf.scala 233:49]
  wire  _T_1066 = _T_1065 & io_lsu_pkt_r_valid; // @[lsu_stbuf.scala 233:74]
  wire  _T_1067 = _T_1066 & io_lsu_pkt_r_bits_store; // @[lsu_stbuf.scala 233:95]
  wire  _T_1069 = _T_1067 & _T_736; // @[lsu_stbuf.scala 233:121]
  wire  ld_addr_rhit_hi_hi = _T_1069 & dual_stbuf_write_r; // @[lsu_stbuf.scala 233:146]
  wire  _T_1071 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1073 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1075 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 235:79]
  wire  _T_1077 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 235:79]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_1077,_T_1075,_T_1073,_T_1071}; // @[Cat.scala 29:58]
  wire  _T_1082 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1084 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1086 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[lsu_stbuf.scala 236:79]
  wire  _T_1088 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[lsu_stbuf.scala 236:79]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_1088,_T_1086,_T_1084,_T_1082}; // @[Cat.scala 29:58]
  wire  _T_1093 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1095 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1097 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 237:79]
  wire  _T_1099 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 237:79]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_1099,_T_1097,_T_1095,_T_1093}; // @[Cat.scala 29:58]
  wire  _T_1104 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1106 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1108 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[lsu_stbuf.scala 238:79]
  wire  _T_1110 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[lsu_stbuf.scala 238:79]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_1110,_T_1108,_T_1106,_T_1104}; // @[Cat.scala 29:58]
  wire  _T_1116 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1119 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1122 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[lsu_stbuf.scala 240:79]
  wire  _T_1125 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[lsu_stbuf.scala 240:79]
  wire [3:0] ld_byte_rhit_lo = {_T_1125,_T_1122,_T_1119,_T_1116}; // @[Cat.scala 29:58]
  wire  _T_1131 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1134 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1137 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[lsu_stbuf.scala 241:79]
  wire  _T_1140 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[lsu_stbuf.scala 241:79]
  wire [3:0] ld_byte_rhit_hi = {_T_1140,_T_1137,_T_1134,_T_1131}; // @[Cat.scala 29:58]
  wire [7:0] _T_1146 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1148 = _T_1146 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 243:53]
  wire [7:0] _T_1151 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1153 = _T_1151 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 243:114]
  wire [7:0] fwdpipe1_lo = _T_1148 | _T_1153; // @[lsu_stbuf.scala 243:80]
  wire [7:0] _T_1156 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1158 = _T_1156 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 244:53]
  wire [7:0] _T_1161 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1163 = _T_1161 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 244:115]
  wire [7:0] fwdpipe2_lo = _T_1158 | _T_1163; // @[lsu_stbuf.scala 244:81]
  wire [7:0] _T_1166 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1168 = _T_1166 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 245:53]
  wire [7:0] _T_1171 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1173 = _T_1171 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 245:116]
  wire [7:0] fwdpipe3_lo = _T_1168 | _T_1173; // @[lsu_stbuf.scala 245:82]
  wire [7:0] _T_1176 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1178 = _T_1176 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 246:53]
  wire [7:0] _T_1181 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1183 = _T_1181 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 246:116]
  wire [7:0] fwdpipe4_lo = _T_1178 | _T_1183; // @[lsu_stbuf.scala 246:82]
  wire [31:0] ld_fwddata_rpipe_lo = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1189 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1191 = _T_1189 & io_store_data_lo_r[7:0]; // @[lsu_stbuf.scala 249:53]
  wire [7:0] _T_1194 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1196 = _T_1194 & io_store_data_hi_r[7:0]; // @[lsu_stbuf.scala 249:114]
  wire [7:0] fwdpipe1_hi = _T_1191 | _T_1196; // @[lsu_stbuf.scala 249:80]
  wire [7:0] _T_1199 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1201 = _T_1199 & io_store_data_lo_r[15:8]; // @[lsu_stbuf.scala 250:53]
  wire [7:0] _T_1204 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1206 = _T_1204 & io_store_data_hi_r[15:8]; // @[lsu_stbuf.scala 250:115]
  wire [7:0] fwdpipe2_hi = _T_1201 | _T_1206; // @[lsu_stbuf.scala 250:81]
  wire [7:0] _T_1209 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1211 = _T_1209 & io_store_data_lo_r[23:16]; // @[lsu_stbuf.scala 251:53]
  wire [7:0] _T_1214 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1216 = _T_1214 & io_store_data_hi_r[23:16]; // @[lsu_stbuf.scala 251:116]
  wire [7:0] fwdpipe3_hi = _T_1211 | _T_1216; // @[lsu_stbuf.scala 251:82]
  wire [7:0] _T_1219 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1221 = _T_1219 & io_store_data_lo_r[31:24]; // @[lsu_stbuf.scala 252:53]
  wire [7:0] _T_1224 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1226 = _T_1224 & io_store_data_hi_r[31:24]; // @[lsu_stbuf.scala 252:116]
  wire [7:0] fwdpipe4_hi = _T_1221 | _T_1226; // @[lsu_stbuf.scala 252:82]
  wire [31:0] ld_fwddata_rpipe_hi = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire  _T_1261 = ld_byte_rhit_hi[0] | stbuf_fwdbyteen_hi_pre_m_0; // @[lsu_stbuf.scala 258:83]
  wire  _T_1263 = ld_byte_rhit_hi[1] | stbuf_fwdbyteen_hi_pre_m_1; // @[lsu_stbuf.scala 258:83]
  wire  _T_1265 = ld_byte_rhit_hi[2] | stbuf_fwdbyteen_hi_pre_m_2; // @[lsu_stbuf.scala 258:83]
  wire  _T_1267 = ld_byte_rhit_hi[3] | stbuf_fwdbyteen_hi_pre_m_3; // @[lsu_stbuf.scala 258:83]
  wire [2:0] _T_1269 = {_T_1267,_T_1265,_T_1263}; // @[Cat.scala 29:58]
  wire  _T_1272 = ld_byte_rhit_lo[0] | stbuf_fwdbyteen_lo_pre_m_0; // @[lsu_stbuf.scala 259:83]
  wire  _T_1274 = ld_byte_rhit_lo[1] | stbuf_fwdbyteen_lo_pre_m_1; // @[lsu_stbuf.scala 259:83]
  wire  _T_1276 = ld_byte_rhit_lo[2] | stbuf_fwdbyteen_lo_pre_m_2; // @[lsu_stbuf.scala 259:83]
  wire  _T_1278 = ld_byte_rhit_lo[3] | stbuf_fwdbyteen_lo_pre_m_3; // @[lsu_stbuf.scala 259:83]
  wire [2:0] _T_1280 = {_T_1278,_T_1276,_T_1274}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[lsu_stbuf.scala 262:30]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[lsu_stbuf.scala 263:30]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[lsu_stbuf.scala 264:30]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[lsu_stbuf.scala 265:30]
  wire [15:0] _T_1294 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1295 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[lsu_stbuf.scala 268:30]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[lsu_stbuf.scala 269:30]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[lsu_stbuf.scala 270:30]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[lsu_stbuf.scala 271:30]
  wire [15:0] _T_1309 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1310 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  rvclkhdr rvclkhdr ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  assign io_stbuf_reqvld_any = _T_696 & _T_698; // @[lsu_stbuf.scala 51:47 lsu_stbuf.scala 184:24]
  assign io_stbuf_reqvld_flushed_any = _T_686[0] & _T_688[0]; // @[lsu_stbuf.scala 52:35 lsu_stbuf.scala 183:31]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_2; // @[lsu_stbuf.scala 53:35 lsu_stbuf.scala 185:22]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_6; // @[lsu_stbuf.scala 54:35 lsu_stbuf.scala 186:22]
  assign io_lsu_stbuf_full_any = _T_749 ? _T_751 : _T_752; // @[lsu_stbuf.scala 55:43 lsu_stbuf.scala 205:26]
  assign io_lsu_stbuf_empty_any = stbuf_numvld_any == 4'h0; // @[lsu_stbuf.scala 56:43 lsu_stbuf.scala 206:26]
  assign io_ldst_stbuf_reqvld_r = _T_22 & io_store_stbuf_reqvld_r; // @[lsu_stbuf.scala 57:43 lsu_stbuf.scala 125:26]
  assign io_stbuf_fwddata_hi_m = {_T_1310,_T_1309}; // @[lsu_stbuf.scala 58:43 lsu_stbuf.scala 272:25]
  assign io_stbuf_fwddata_lo_m = {_T_1295,_T_1294}; // @[lsu_stbuf.scala 59:43 lsu_stbuf.scala 266:25]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1269,_T_1261}; // @[lsu_stbuf.scala 60:37 lsu_stbuf.scala 258:27]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1280,_T_1272}; // @[lsu_stbuf.scala 61:37 lsu_stbuf.scala 259:27]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_io_en = stbuf_wr_en[0]; // @[lib.scala 371:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = stbuf_wr_en[0]; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = stbuf_wr_en[1]; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = stbuf_wr_en[1]; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_4_io_en = stbuf_wr_en[2]; // @[lib.scala 371:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_5_io_en = stbuf_wr_en[2]; // @[lib.scala 371:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_6_io_en = stbuf_wr_en[3]; // @[lib.scala 371:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_7_io_en = stbuf_wr_en[3]; // @[lib.scala 371:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  RdPtr = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  WrPtr = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  stbuf_addr_0 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  _T_587 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_579 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_571 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_563 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_622 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_614 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_606 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_598 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  stbuf_byteen_0 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  stbuf_byteen_1 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stbuf_byteen_2 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  stbuf_byteen_3 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  stbuf_data_0 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stbuf_data_1 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  stbuf_data_2 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stbuf_data_3 = _RAND_21[31:0];
`endif // RANDOMIZE_REG_INIT
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
    _T_587 = 1'h0;
  end
  if (reset) begin
    _T_579 = 1'h0;
  end
  if (reset) begin
    _T_571 = 1'h0;
  end
  if (reset) begin
    _T_563 = 1'h0;
  end
  if (reset) begin
    _T_622 = 1'h0;
  end
  if (reset) begin
    _T_614 = 1'h0;
  end
  if (reset) begin
    _T_606 = 1'h0;
  end
  if (reset) begin
    _T_598 = 1'h0;
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      RdPtr <= 2'h0;
    end else if (_T_211) begin
      RdPtr <= RdPtrPlus1;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 2'h0;
    end else if (WrPtrEn) begin
      if (_T_713) begin
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
      _T_587 <= 1'h0;
    end else begin
      _T_587 <= _T_583 & _T_66;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_579 <= 1'h0;
    end else begin
      _T_579 <= _T_575 & _T_55;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_571 <= 1'h0;
    end else begin
      _T_571 <= _T_567 & _T_44;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_563 <= 1'h0;
    end else begin
      _T_563 <= _T_559 & _T_33;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_622 <= 1'h0;
    end else begin
      _T_622 <= _T_618 & _T_66;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_614 <= 1'h0;
    end else begin
      _T_614 <= _T_610 & _T_55;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_606 <= 1'h0;
    end else begin
      _T_606 <= _T_602 & _T_44;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      _T_598 <= 1'h0;
    end else begin
      _T_598 <= _T_594 & _T_33;
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
      stbuf_byteen_0 <= _T_628 & _T_632;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else begin
      stbuf_byteen_1 <= _T_637 & _T_641;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else begin
      stbuf_byteen_2 <= _T_646 & _T_650;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else begin
      stbuf_byteen_3 <= _T_655 & _T_659;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else begin
      stbuf_data_0 <= {_T_545,_T_544};
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else begin
      stbuf_data_1 <= {_T_548,_T_547};
    end
  end
  always @(posedge rvclkhdr_5_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else begin
      stbuf_data_2 <= {_T_551,_T_550};
    end
  end
  always @(posedge rvclkhdr_7_io_l1clk or posedge reset) begin
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else begin
      stbuf_data_3 <= {_T_554,_T_553};
    end
  end
endmodule
module lsu_ecc(
  input         clock,
  input         reset,
  input         io_lsu_c2_r_clk,
  input         io_clk_override,
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire  _T_96 = ^io_dccm_rdata_hi_m; // @[lib.scala 193:30]
  wire  _T_97 = ^io_dccm_data_ecc_hi_m; // @[lib.scala 193:44]
  wire  _T_98 = _T_96 ^ _T_97; // @[lib.scala 193:35]
  wire [5:0] _T_106 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[26]}; // @[lib.scala 193:76]
  wire  _T_107 = ^_T_106; // @[lib.scala 193:83]
  wire  _T_108 = io_dccm_data_ecc_hi_m[5] ^ _T_107; // @[lib.scala 193:71]
  wire [6:0] _T_115 = {io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[11]}; // @[lib.scala 193:103]
  wire [14:0] _T_123 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_115}; // @[lib.scala 193:103]
  wire  _T_124 = ^_T_123; // @[lib.scala 193:110]
  wire  _T_125 = io_dccm_data_ecc_hi_m[4] ^ _T_124; // @[lib.scala 193:98]
  wire [6:0] _T_132 = {io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[4]}; // @[lib.scala 193:130]
  wire [14:0] _T_140 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_132}; // @[lib.scala 193:130]
  wire  _T_141 = ^_T_140; // @[lib.scala 193:137]
  wire  _T_142 = io_dccm_data_ecc_hi_m[3] ^ _T_141; // @[lib.scala 193:125]
  wire [8:0] _T_151 = {io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[1]}; // @[lib.scala 193:157]
  wire [17:0] _T_160 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_151}; // @[lib.scala 193:157]
  wire  _T_161 = ^_T_160; // @[lib.scala 193:164]
  wire  _T_162 = io_dccm_data_ecc_hi_m[2] ^ _T_161; // @[lib.scala 193:152]
  wire [8:0] _T_171 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[0]}; // @[lib.scala 193:184]
  wire [17:0] _T_180 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_171}; // @[lib.scala 193:184]
  wire  _T_181 = ^_T_180; // @[lib.scala 193:191]
  wire  _T_182 = io_dccm_data_ecc_hi_m[1] ^ _T_181; // @[lib.scala 193:179]
  wire [8:0] _T_191 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[11],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[4],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[1],io_dccm_rdata_hi_m[0]}; // @[lib.scala 193:211]
  wire [17:0] _T_200 = {io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[26],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[15],_T_191}; // @[lib.scala 193:211]
  wire  _T_201 = ^_T_200; // @[lib.scala 193:218]
  wire  _T_202 = io_dccm_data_ecc_hi_m[0] ^ _T_201; // @[lib.scala 193:206]
  wire [6:0] _T_208 = {_T_98,_T_108,_T_125,_T_142,_T_162,_T_182,_T_202}; // @[Cat.scala 29:58]
  wire  _T_209 = _T_208 != 7'h0; // @[lib.scala 194:44]
  wire  _T_1130 = ~io_dec_tlu_core_ecc_disable; // @[lsu_ecc.scala 106:48]
  wire  _T_1137 = io_lsu_pkt_m_bits_load | io_lsu_pkt_m_bits_store; // @[lsu_ecc.scala 124:65]
  wire  _T_1138 = io_lsu_pkt_m_valid & _T_1137; // @[lsu_ecc.scala 124:39]
  wire  _T_1139 = _T_1138 & io_addr_in_dccm_m; // @[lsu_ecc.scala 124:92]
  wire  is_ldst_m = _T_1139 & io_lsu_dccm_rden_m; // @[lsu_ecc.scala 124:112]
  wire  ldst_dual_m = io_lsu_addr_m[2] != io_end_addr_m[2]; // @[lsu_ecc.scala 123:39]
  wire  _T_1143 = ldst_dual_m | io_lsu_pkt_m_bits_dma; // @[lsu_ecc.scala 126:48]
  wire  _T_1144 = is_ldst_m & _T_1143; // @[lsu_ecc.scala 126:33]
  wire  is_ldst_hi_m = _T_1144 & _T_1130; // @[lsu_ecc.scala 126:73]
  wire  _T_210 = is_ldst_hi_m & _T_209; // @[lib.scala 194:32]
  wire  single_ecc_error_hi_any = _T_210 & _T_208[6]; // @[lib.scala 194:53]
  wire  _T_215 = ~_T_208[6]; // @[lib.scala 195:55]
  wire  double_ecc_error_hi_any = _T_210 & _T_215; // @[lib.scala 195:53]
  wire  _T_218 = _T_208[5:0] == 6'h1; // @[lib.scala 199:41]
  wire  _T_220 = _T_208[5:0] == 6'h2; // @[lib.scala 199:41]
  wire  _T_222 = _T_208[5:0] == 6'h3; // @[lib.scala 199:41]
  wire  _T_224 = _T_208[5:0] == 6'h4; // @[lib.scala 199:41]
  wire  _T_226 = _T_208[5:0] == 6'h5; // @[lib.scala 199:41]
  wire  _T_228 = _T_208[5:0] == 6'h6; // @[lib.scala 199:41]
  wire  _T_230 = _T_208[5:0] == 6'h7; // @[lib.scala 199:41]
  wire  _T_232 = _T_208[5:0] == 6'h8; // @[lib.scala 199:41]
  wire  _T_234 = _T_208[5:0] == 6'h9; // @[lib.scala 199:41]
  wire  _T_236 = _T_208[5:0] == 6'ha; // @[lib.scala 199:41]
  wire  _T_238 = _T_208[5:0] == 6'hb; // @[lib.scala 199:41]
  wire  _T_240 = _T_208[5:0] == 6'hc; // @[lib.scala 199:41]
  wire  _T_242 = _T_208[5:0] == 6'hd; // @[lib.scala 199:41]
  wire  _T_244 = _T_208[5:0] == 6'he; // @[lib.scala 199:41]
  wire  _T_246 = _T_208[5:0] == 6'hf; // @[lib.scala 199:41]
  wire  _T_248 = _T_208[5:0] == 6'h10; // @[lib.scala 199:41]
  wire  _T_250 = _T_208[5:0] == 6'h11; // @[lib.scala 199:41]
  wire  _T_252 = _T_208[5:0] == 6'h12; // @[lib.scala 199:41]
  wire  _T_254 = _T_208[5:0] == 6'h13; // @[lib.scala 199:41]
  wire  _T_256 = _T_208[5:0] == 6'h14; // @[lib.scala 199:41]
  wire  _T_258 = _T_208[5:0] == 6'h15; // @[lib.scala 199:41]
  wire  _T_260 = _T_208[5:0] == 6'h16; // @[lib.scala 199:41]
  wire  _T_262 = _T_208[5:0] == 6'h17; // @[lib.scala 199:41]
  wire  _T_264 = _T_208[5:0] == 6'h18; // @[lib.scala 199:41]
  wire  _T_266 = _T_208[5:0] == 6'h19; // @[lib.scala 199:41]
  wire  _T_268 = _T_208[5:0] == 6'h1a; // @[lib.scala 199:41]
  wire  _T_270 = _T_208[5:0] == 6'h1b; // @[lib.scala 199:41]
  wire  _T_272 = _T_208[5:0] == 6'h1c; // @[lib.scala 199:41]
  wire  _T_274 = _T_208[5:0] == 6'h1d; // @[lib.scala 199:41]
  wire  _T_276 = _T_208[5:0] == 6'h1e; // @[lib.scala 199:41]
  wire  _T_278 = _T_208[5:0] == 6'h1f; // @[lib.scala 199:41]
  wire  _T_280 = _T_208[5:0] == 6'h20; // @[lib.scala 199:41]
  wire  _T_282 = _T_208[5:0] == 6'h21; // @[lib.scala 199:41]
  wire  _T_284 = _T_208[5:0] == 6'h22; // @[lib.scala 199:41]
  wire  _T_286 = _T_208[5:0] == 6'h23; // @[lib.scala 199:41]
  wire  _T_288 = _T_208[5:0] == 6'h24; // @[lib.scala 199:41]
  wire  _T_290 = _T_208[5:0] == 6'h25; // @[lib.scala 199:41]
  wire  _T_292 = _T_208[5:0] == 6'h26; // @[lib.scala 199:41]
  wire  _T_294 = _T_208[5:0] == 6'h27; // @[lib.scala 199:41]
  wire [7:0] _T_309 = {io_dccm_data_ecc_hi_m[3],io_dccm_rdata_hi_m[3:1],io_dccm_data_ecc_hi_m[2],io_dccm_rdata_hi_m[0],io_dccm_data_ecc_hi_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_315 = {io_dccm_data_ecc_hi_m[6],io_dccm_rdata_hi_m[31:26],io_dccm_data_ecc_hi_m[5],io_dccm_rdata_hi_m[25:11],io_dccm_data_ecc_hi_m[4],io_dccm_rdata_hi_m[10:4],_T_309}; // @[Cat.scala 29:58]
  wire [9:0] _T_333 = {_T_254,_T_252,_T_250,_T_248,_T_246,_T_244,_T_242,_T_240,_T_238,_T_236}; // @[lib.scala 202:69]
  wire [18:0] _T_334 = {_T_333,_T_234,_T_232,_T_230,_T_228,_T_226,_T_224,_T_222,_T_220,_T_218}; // @[lib.scala 202:69]
  wire [9:0] _T_343 = {_T_274,_T_272,_T_270,_T_268,_T_266,_T_264,_T_262,_T_260,_T_258,_T_256}; // @[lib.scala 202:69]
  wire [9:0] _T_352 = {_T_294,_T_292,_T_290,_T_288,_T_286,_T_284,_T_282,_T_280,_T_278,_T_276}; // @[lib.scala 202:69]
  wire [38:0] _T_354 = {_T_352,_T_343,_T_334}; // @[lib.scala 202:69]
  wire [38:0] _T_355 = _T_354 ^ _T_315; // @[lib.scala 202:76]
  wire [38:0] _T_356 = single_ecc_error_hi_any ? _T_355 : _T_315; // @[lib.scala 202:31]
  wire [3:0] _T_362 = {_T_356[6:4],_T_356[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_364 = {_T_356[37:32],_T_356[30:16],_T_356[14:8]}; // @[Cat.scala 29:58]
  wire  _T_474 = ^io_dccm_rdata_lo_m; // @[lib.scala 193:30]
  wire  _T_475 = ^io_dccm_data_ecc_lo_m; // @[lib.scala 193:44]
  wire  _T_476 = _T_474 ^ _T_475; // @[lib.scala 193:35]
  wire [5:0] _T_484 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[26]}; // @[lib.scala 193:76]
  wire  _T_485 = ^_T_484; // @[lib.scala 193:83]
  wire  _T_486 = io_dccm_data_ecc_lo_m[5] ^ _T_485; // @[lib.scala 193:71]
  wire [6:0] _T_493 = {io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[11]}; // @[lib.scala 193:103]
  wire [14:0] _T_501 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_493}; // @[lib.scala 193:103]
  wire  _T_502 = ^_T_501; // @[lib.scala 193:110]
  wire  _T_503 = io_dccm_data_ecc_lo_m[4] ^ _T_502; // @[lib.scala 193:98]
  wire [6:0] _T_510 = {io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[4]}; // @[lib.scala 193:130]
  wire [14:0] _T_518 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_510}; // @[lib.scala 193:130]
  wire  _T_519 = ^_T_518; // @[lib.scala 193:137]
  wire  _T_520 = io_dccm_data_ecc_lo_m[3] ^ _T_519; // @[lib.scala 193:125]
  wire [8:0] _T_529 = {io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[1]}; // @[lib.scala 193:157]
  wire [17:0] _T_538 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_529}; // @[lib.scala 193:157]
  wire  _T_539 = ^_T_538; // @[lib.scala 193:164]
  wire  _T_540 = io_dccm_data_ecc_lo_m[2] ^ _T_539; // @[lib.scala 193:152]
  wire [8:0] _T_549 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[0]}; // @[lib.scala 193:184]
  wire [17:0] _T_558 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_549}; // @[lib.scala 193:184]
  wire  _T_559 = ^_T_558; // @[lib.scala 193:191]
  wire  _T_560 = io_dccm_data_ecc_lo_m[1] ^ _T_559; // @[lib.scala 193:179]
  wire [8:0] _T_569 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[11],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[4],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[1],io_dccm_rdata_lo_m[0]}; // @[lib.scala 193:211]
  wire [17:0] _T_578 = {io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[26],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[15],_T_569}; // @[lib.scala 193:211]
  wire  _T_579 = ^_T_578; // @[lib.scala 193:218]
  wire  _T_580 = io_dccm_data_ecc_lo_m[0] ^ _T_579; // @[lib.scala 193:206]
  wire [6:0] _T_586 = {_T_476,_T_486,_T_503,_T_520,_T_540,_T_560,_T_580}; // @[Cat.scala 29:58]
  wire  _T_587 = _T_586 != 7'h0; // @[lib.scala 194:44]
  wire  is_ldst_lo_m = is_ldst_m & _T_1130; // @[lsu_ecc.scala 125:33]
  wire  _T_588 = is_ldst_lo_m & _T_587; // @[lib.scala 194:32]
  wire  single_ecc_error_lo_any = _T_588 & _T_586[6]; // @[lib.scala 194:53]
  wire  _T_593 = ~_T_586[6]; // @[lib.scala 195:55]
  wire  double_ecc_error_lo_any = _T_588 & _T_593; // @[lib.scala 195:53]
  wire  _T_596 = _T_586[5:0] == 6'h1; // @[lib.scala 199:41]
  wire  _T_598 = _T_586[5:0] == 6'h2; // @[lib.scala 199:41]
  wire  _T_600 = _T_586[5:0] == 6'h3; // @[lib.scala 199:41]
  wire  _T_602 = _T_586[5:0] == 6'h4; // @[lib.scala 199:41]
  wire  _T_604 = _T_586[5:0] == 6'h5; // @[lib.scala 199:41]
  wire  _T_606 = _T_586[5:0] == 6'h6; // @[lib.scala 199:41]
  wire  _T_608 = _T_586[5:0] == 6'h7; // @[lib.scala 199:41]
  wire  _T_610 = _T_586[5:0] == 6'h8; // @[lib.scala 199:41]
  wire  _T_612 = _T_586[5:0] == 6'h9; // @[lib.scala 199:41]
  wire  _T_614 = _T_586[5:0] == 6'ha; // @[lib.scala 199:41]
  wire  _T_616 = _T_586[5:0] == 6'hb; // @[lib.scala 199:41]
  wire  _T_618 = _T_586[5:0] == 6'hc; // @[lib.scala 199:41]
  wire  _T_620 = _T_586[5:0] == 6'hd; // @[lib.scala 199:41]
  wire  _T_622 = _T_586[5:0] == 6'he; // @[lib.scala 199:41]
  wire  _T_624 = _T_586[5:0] == 6'hf; // @[lib.scala 199:41]
  wire  _T_626 = _T_586[5:0] == 6'h10; // @[lib.scala 199:41]
  wire  _T_628 = _T_586[5:0] == 6'h11; // @[lib.scala 199:41]
  wire  _T_630 = _T_586[5:0] == 6'h12; // @[lib.scala 199:41]
  wire  _T_632 = _T_586[5:0] == 6'h13; // @[lib.scala 199:41]
  wire  _T_634 = _T_586[5:0] == 6'h14; // @[lib.scala 199:41]
  wire  _T_636 = _T_586[5:0] == 6'h15; // @[lib.scala 199:41]
  wire  _T_638 = _T_586[5:0] == 6'h16; // @[lib.scala 199:41]
  wire  _T_640 = _T_586[5:0] == 6'h17; // @[lib.scala 199:41]
  wire  _T_642 = _T_586[5:0] == 6'h18; // @[lib.scala 199:41]
  wire  _T_644 = _T_586[5:0] == 6'h19; // @[lib.scala 199:41]
  wire  _T_646 = _T_586[5:0] == 6'h1a; // @[lib.scala 199:41]
  wire  _T_648 = _T_586[5:0] == 6'h1b; // @[lib.scala 199:41]
  wire  _T_650 = _T_586[5:0] == 6'h1c; // @[lib.scala 199:41]
  wire  _T_652 = _T_586[5:0] == 6'h1d; // @[lib.scala 199:41]
  wire  _T_654 = _T_586[5:0] == 6'h1e; // @[lib.scala 199:41]
  wire  _T_656 = _T_586[5:0] == 6'h1f; // @[lib.scala 199:41]
  wire  _T_658 = _T_586[5:0] == 6'h20; // @[lib.scala 199:41]
  wire  _T_660 = _T_586[5:0] == 6'h21; // @[lib.scala 199:41]
  wire  _T_662 = _T_586[5:0] == 6'h22; // @[lib.scala 199:41]
  wire  _T_664 = _T_586[5:0] == 6'h23; // @[lib.scala 199:41]
  wire  _T_666 = _T_586[5:0] == 6'h24; // @[lib.scala 199:41]
  wire  _T_668 = _T_586[5:0] == 6'h25; // @[lib.scala 199:41]
  wire  _T_670 = _T_586[5:0] == 6'h26; // @[lib.scala 199:41]
  wire  _T_672 = _T_586[5:0] == 6'h27; // @[lib.scala 199:41]
  wire [7:0] _T_687 = {io_dccm_data_ecc_lo_m[3],io_dccm_rdata_lo_m[3:1],io_dccm_data_ecc_lo_m[2],io_dccm_rdata_lo_m[0],io_dccm_data_ecc_lo_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_693 = {io_dccm_data_ecc_lo_m[6],io_dccm_rdata_lo_m[31:26],io_dccm_data_ecc_lo_m[5],io_dccm_rdata_lo_m[25:11],io_dccm_data_ecc_lo_m[4],io_dccm_rdata_lo_m[10:4],_T_687}; // @[Cat.scala 29:58]
  wire [9:0] _T_711 = {_T_632,_T_630,_T_628,_T_626,_T_624,_T_622,_T_620,_T_618,_T_616,_T_614}; // @[lib.scala 202:69]
  wire [18:0] _T_712 = {_T_711,_T_612,_T_610,_T_608,_T_606,_T_604,_T_602,_T_600,_T_598,_T_596}; // @[lib.scala 202:69]
  wire [9:0] _T_721 = {_T_652,_T_650,_T_648,_T_646,_T_644,_T_642,_T_640,_T_638,_T_636,_T_634}; // @[lib.scala 202:69]
  wire [9:0] _T_730 = {_T_672,_T_670,_T_668,_T_666,_T_664,_T_662,_T_660,_T_658,_T_656,_T_654}; // @[lib.scala 202:69]
  wire [38:0] _T_732 = {_T_730,_T_721,_T_712}; // @[lib.scala 202:69]
  wire [38:0] _T_733 = _T_732 ^ _T_693; // @[lib.scala 202:76]
  wire [38:0] _T_734 = single_ecc_error_lo_any ? _T_733 : _T_693; // @[lib.scala 202:31]
  wire [3:0] _T_740 = {_T_734[6:4],_T_734[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_742 = {_T_734[37:32],_T_734[30:16],_T_734[14:8]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1159 = io_dma_dccm_wen ? io_dma_dccm_wdata_lo : io_stbuf_data_any; // @[lsu_ecc.scala 148:87]
  wire [31:0] dccm_wdata_lo_any = io_ld_single_ecc_error_r_ff ? io_sec_data_lo_r_ff : _T_1159; // @[lsu_ecc.scala 148:27]
  wire  _T_774 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[1]; // @[lib.scala 119:74]
  wire  _T_775 = _T_774 ^ dccm_wdata_lo_any[3]; // @[lib.scala 119:74]
  wire  _T_776 = _T_775 ^ dccm_wdata_lo_any[4]; // @[lib.scala 119:74]
  wire  _T_777 = _T_776 ^ dccm_wdata_lo_any[6]; // @[lib.scala 119:74]
  wire  _T_778 = _T_777 ^ dccm_wdata_lo_any[8]; // @[lib.scala 119:74]
  wire  _T_779 = _T_778 ^ dccm_wdata_lo_any[10]; // @[lib.scala 119:74]
  wire  _T_780 = _T_779 ^ dccm_wdata_lo_any[11]; // @[lib.scala 119:74]
  wire  _T_781 = _T_780 ^ dccm_wdata_lo_any[13]; // @[lib.scala 119:74]
  wire  _T_782 = _T_781 ^ dccm_wdata_lo_any[15]; // @[lib.scala 119:74]
  wire  _T_783 = _T_782 ^ dccm_wdata_lo_any[17]; // @[lib.scala 119:74]
  wire  _T_784 = _T_783 ^ dccm_wdata_lo_any[19]; // @[lib.scala 119:74]
  wire  _T_785 = _T_784 ^ dccm_wdata_lo_any[21]; // @[lib.scala 119:74]
  wire  _T_786 = _T_785 ^ dccm_wdata_lo_any[23]; // @[lib.scala 119:74]
  wire  _T_787 = _T_786 ^ dccm_wdata_lo_any[25]; // @[lib.scala 119:74]
  wire  _T_788 = _T_787 ^ dccm_wdata_lo_any[26]; // @[lib.scala 119:74]
  wire  _T_789 = _T_788 ^ dccm_wdata_lo_any[28]; // @[lib.scala 119:74]
  wire  _T_790 = _T_789 ^ dccm_wdata_lo_any[30]; // @[lib.scala 119:74]
  wire  _T_809 = dccm_wdata_lo_any[0] ^ dccm_wdata_lo_any[2]; // @[lib.scala 119:74]
  wire  _T_810 = _T_809 ^ dccm_wdata_lo_any[3]; // @[lib.scala 119:74]
  wire  _T_811 = _T_810 ^ dccm_wdata_lo_any[5]; // @[lib.scala 119:74]
  wire  _T_812 = _T_811 ^ dccm_wdata_lo_any[6]; // @[lib.scala 119:74]
  wire  _T_813 = _T_812 ^ dccm_wdata_lo_any[9]; // @[lib.scala 119:74]
  wire  _T_814 = _T_813 ^ dccm_wdata_lo_any[10]; // @[lib.scala 119:74]
  wire  _T_815 = _T_814 ^ dccm_wdata_lo_any[12]; // @[lib.scala 119:74]
  wire  _T_816 = _T_815 ^ dccm_wdata_lo_any[13]; // @[lib.scala 119:74]
  wire  _T_817 = _T_816 ^ dccm_wdata_lo_any[16]; // @[lib.scala 119:74]
  wire  _T_818 = _T_817 ^ dccm_wdata_lo_any[17]; // @[lib.scala 119:74]
  wire  _T_819 = _T_818 ^ dccm_wdata_lo_any[20]; // @[lib.scala 119:74]
  wire  _T_820 = _T_819 ^ dccm_wdata_lo_any[21]; // @[lib.scala 119:74]
  wire  _T_821 = _T_820 ^ dccm_wdata_lo_any[24]; // @[lib.scala 119:74]
  wire  _T_822 = _T_821 ^ dccm_wdata_lo_any[25]; // @[lib.scala 119:74]
  wire  _T_823 = _T_822 ^ dccm_wdata_lo_any[27]; // @[lib.scala 119:74]
  wire  _T_824 = _T_823 ^ dccm_wdata_lo_any[28]; // @[lib.scala 119:74]
  wire  _T_825 = _T_824 ^ dccm_wdata_lo_any[31]; // @[lib.scala 119:74]
  wire  _T_844 = dccm_wdata_lo_any[1] ^ dccm_wdata_lo_any[2]; // @[lib.scala 119:74]
  wire  _T_845 = _T_844 ^ dccm_wdata_lo_any[3]; // @[lib.scala 119:74]
  wire  _T_846 = _T_845 ^ dccm_wdata_lo_any[7]; // @[lib.scala 119:74]
  wire  _T_847 = _T_846 ^ dccm_wdata_lo_any[8]; // @[lib.scala 119:74]
  wire  _T_848 = _T_847 ^ dccm_wdata_lo_any[9]; // @[lib.scala 119:74]
  wire  _T_849 = _T_848 ^ dccm_wdata_lo_any[10]; // @[lib.scala 119:74]
  wire  _T_850 = _T_849 ^ dccm_wdata_lo_any[14]; // @[lib.scala 119:74]
  wire  _T_851 = _T_850 ^ dccm_wdata_lo_any[15]; // @[lib.scala 119:74]
  wire  _T_852 = _T_851 ^ dccm_wdata_lo_any[16]; // @[lib.scala 119:74]
  wire  _T_853 = _T_852 ^ dccm_wdata_lo_any[17]; // @[lib.scala 119:74]
  wire  _T_854 = _T_853 ^ dccm_wdata_lo_any[22]; // @[lib.scala 119:74]
  wire  _T_855 = _T_854 ^ dccm_wdata_lo_any[23]; // @[lib.scala 119:74]
  wire  _T_856 = _T_855 ^ dccm_wdata_lo_any[24]; // @[lib.scala 119:74]
  wire  _T_857 = _T_856 ^ dccm_wdata_lo_any[25]; // @[lib.scala 119:74]
  wire  _T_858 = _T_857 ^ dccm_wdata_lo_any[29]; // @[lib.scala 119:74]
  wire  _T_859 = _T_858 ^ dccm_wdata_lo_any[30]; // @[lib.scala 119:74]
  wire  _T_860 = _T_859 ^ dccm_wdata_lo_any[31]; // @[lib.scala 119:74]
  wire  _T_876 = dccm_wdata_lo_any[4] ^ dccm_wdata_lo_any[5]; // @[lib.scala 119:74]
  wire  _T_877 = _T_876 ^ dccm_wdata_lo_any[6]; // @[lib.scala 119:74]
  wire  _T_878 = _T_877 ^ dccm_wdata_lo_any[7]; // @[lib.scala 119:74]
  wire  _T_879 = _T_878 ^ dccm_wdata_lo_any[8]; // @[lib.scala 119:74]
  wire  _T_880 = _T_879 ^ dccm_wdata_lo_any[9]; // @[lib.scala 119:74]
  wire  _T_881 = _T_880 ^ dccm_wdata_lo_any[10]; // @[lib.scala 119:74]
  wire  _T_882 = _T_881 ^ dccm_wdata_lo_any[18]; // @[lib.scala 119:74]
  wire  _T_883 = _T_882 ^ dccm_wdata_lo_any[19]; // @[lib.scala 119:74]
  wire  _T_884 = _T_883 ^ dccm_wdata_lo_any[20]; // @[lib.scala 119:74]
  wire  _T_885 = _T_884 ^ dccm_wdata_lo_any[21]; // @[lib.scala 119:74]
  wire  _T_886 = _T_885 ^ dccm_wdata_lo_any[22]; // @[lib.scala 119:74]
  wire  _T_887 = _T_886 ^ dccm_wdata_lo_any[23]; // @[lib.scala 119:74]
  wire  _T_888 = _T_887 ^ dccm_wdata_lo_any[24]; // @[lib.scala 119:74]
  wire  _T_889 = _T_888 ^ dccm_wdata_lo_any[25]; // @[lib.scala 119:74]
  wire  _T_905 = dccm_wdata_lo_any[11] ^ dccm_wdata_lo_any[12]; // @[lib.scala 119:74]
  wire  _T_906 = _T_905 ^ dccm_wdata_lo_any[13]; // @[lib.scala 119:74]
  wire  _T_907 = _T_906 ^ dccm_wdata_lo_any[14]; // @[lib.scala 119:74]
  wire  _T_908 = _T_907 ^ dccm_wdata_lo_any[15]; // @[lib.scala 119:74]
  wire  _T_909 = _T_908 ^ dccm_wdata_lo_any[16]; // @[lib.scala 119:74]
  wire  _T_910 = _T_909 ^ dccm_wdata_lo_any[17]; // @[lib.scala 119:74]
  wire  _T_911 = _T_910 ^ dccm_wdata_lo_any[18]; // @[lib.scala 119:74]
  wire  _T_912 = _T_911 ^ dccm_wdata_lo_any[19]; // @[lib.scala 119:74]
  wire  _T_913 = _T_912 ^ dccm_wdata_lo_any[20]; // @[lib.scala 119:74]
  wire  _T_914 = _T_913 ^ dccm_wdata_lo_any[21]; // @[lib.scala 119:74]
  wire  _T_915 = _T_914 ^ dccm_wdata_lo_any[22]; // @[lib.scala 119:74]
  wire  _T_916 = _T_915 ^ dccm_wdata_lo_any[23]; // @[lib.scala 119:74]
  wire  _T_917 = _T_916 ^ dccm_wdata_lo_any[24]; // @[lib.scala 119:74]
  wire  _T_918 = _T_917 ^ dccm_wdata_lo_any[25]; // @[lib.scala 119:74]
  wire  _T_925 = dccm_wdata_lo_any[26] ^ dccm_wdata_lo_any[27]; // @[lib.scala 119:74]
  wire  _T_926 = _T_925 ^ dccm_wdata_lo_any[28]; // @[lib.scala 119:74]
  wire  _T_927 = _T_926 ^ dccm_wdata_lo_any[29]; // @[lib.scala 119:74]
  wire  _T_928 = _T_927 ^ dccm_wdata_lo_any[30]; // @[lib.scala 119:74]
  wire  _T_929 = _T_928 ^ dccm_wdata_lo_any[31]; // @[lib.scala 119:74]
  wire [5:0] _T_934 = {_T_929,_T_918,_T_889,_T_860,_T_825,_T_790}; // @[Cat.scala 29:58]
  wire  _T_935 = ^dccm_wdata_lo_any; // @[lib.scala 127:13]
  wire  _T_936 = ^_T_934; // @[lib.scala 127:23]
  wire  _T_937 = _T_935 ^ _T_936; // @[lib.scala 127:18]
  wire [31:0] _T_1163 = io_dma_dccm_wen ? io_dma_dccm_wdata_hi : 32'h0; // @[lsu_ecc.scala 149:87]
  wire [31:0] dccm_wdata_hi_any = io_ld_single_ecc_error_r_ff ? io_sec_data_hi_r_ff : _T_1163; // @[lsu_ecc.scala 149:27]
  wire  _T_956 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[1]; // @[lib.scala 119:74]
  wire  _T_957 = _T_956 ^ dccm_wdata_hi_any[3]; // @[lib.scala 119:74]
  wire  _T_958 = _T_957 ^ dccm_wdata_hi_any[4]; // @[lib.scala 119:74]
  wire  _T_959 = _T_958 ^ dccm_wdata_hi_any[6]; // @[lib.scala 119:74]
  wire  _T_960 = _T_959 ^ dccm_wdata_hi_any[8]; // @[lib.scala 119:74]
  wire  _T_961 = _T_960 ^ dccm_wdata_hi_any[10]; // @[lib.scala 119:74]
  wire  _T_962 = _T_961 ^ dccm_wdata_hi_any[11]; // @[lib.scala 119:74]
  wire  _T_963 = _T_962 ^ dccm_wdata_hi_any[13]; // @[lib.scala 119:74]
  wire  _T_964 = _T_963 ^ dccm_wdata_hi_any[15]; // @[lib.scala 119:74]
  wire  _T_965 = _T_964 ^ dccm_wdata_hi_any[17]; // @[lib.scala 119:74]
  wire  _T_966 = _T_965 ^ dccm_wdata_hi_any[19]; // @[lib.scala 119:74]
  wire  _T_967 = _T_966 ^ dccm_wdata_hi_any[21]; // @[lib.scala 119:74]
  wire  _T_968 = _T_967 ^ dccm_wdata_hi_any[23]; // @[lib.scala 119:74]
  wire  _T_969 = _T_968 ^ dccm_wdata_hi_any[25]; // @[lib.scala 119:74]
  wire  _T_970 = _T_969 ^ dccm_wdata_hi_any[26]; // @[lib.scala 119:74]
  wire  _T_971 = _T_970 ^ dccm_wdata_hi_any[28]; // @[lib.scala 119:74]
  wire  _T_972 = _T_971 ^ dccm_wdata_hi_any[30]; // @[lib.scala 119:74]
  wire  _T_991 = dccm_wdata_hi_any[0] ^ dccm_wdata_hi_any[2]; // @[lib.scala 119:74]
  wire  _T_992 = _T_991 ^ dccm_wdata_hi_any[3]; // @[lib.scala 119:74]
  wire  _T_993 = _T_992 ^ dccm_wdata_hi_any[5]; // @[lib.scala 119:74]
  wire  _T_994 = _T_993 ^ dccm_wdata_hi_any[6]; // @[lib.scala 119:74]
  wire  _T_995 = _T_994 ^ dccm_wdata_hi_any[9]; // @[lib.scala 119:74]
  wire  _T_996 = _T_995 ^ dccm_wdata_hi_any[10]; // @[lib.scala 119:74]
  wire  _T_997 = _T_996 ^ dccm_wdata_hi_any[12]; // @[lib.scala 119:74]
  wire  _T_998 = _T_997 ^ dccm_wdata_hi_any[13]; // @[lib.scala 119:74]
  wire  _T_999 = _T_998 ^ dccm_wdata_hi_any[16]; // @[lib.scala 119:74]
  wire  _T_1000 = _T_999 ^ dccm_wdata_hi_any[17]; // @[lib.scala 119:74]
  wire  _T_1001 = _T_1000 ^ dccm_wdata_hi_any[20]; // @[lib.scala 119:74]
  wire  _T_1002 = _T_1001 ^ dccm_wdata_hi_any[21]; // @[lib.scala 119:74]
  wire  _T_1003 = _T_1002 ^ dccm_wdata_hi_any[24]; // @[lib.scala 119:74]
  wire  _T_1004 = _T_1003 ^ dccm_wdata_hi_any[25]; // @[lib.scala 119:74]
  wire  _T_1005 = _T_1004 ^ dccm_wdata_hi_any[27]; // @[lib.scala 119:74]
  wire  _T_1006 = _T_1005 ^ dccm_wdata_hi_any[28]; // @[lib.scala 119:74]
  wire  _T_1007 = _T_1006 ^ dccm_wdata_hi_any[31]; // @[lib.scala 119:74]
  wire  _T_1026 = dccm_wdata_hi_any[1] ^ dccm_wdata_hi_any[2]; // @[lib.scala 119:74]
  wire  _T_1027 = _T_1026 ^ dccm_wdata_hi_any[3]; // @[lib.scala 119:74]
  wire  _T_1028 = _T_1027 ^ dccm_wdata_hi_any[7]; // @[lib.scala 119:74]
  wire  _T_1029 = _T_1028 ^ dccm_wdata_hi_any[8]; // @[lib.scala 119:74]
  wire  _T_1030 = _T_1029 ^ dccm_wdata_hi_any[9]; // @[lib.scala 119:74]
  wire  _T_1031 = _T_1030 ^ dccm_wdata_hi_any[10]; // @[lib.scala 119:74]
  wire  _T_1032 = _T_1031 ^ dccm_wdata_hi_any[14]; // @[lib.scala 119:74]
  wire  _T_1033 = _T_1032 ^ dccm_wdata_hi_any[15]; // @[lib.scala 119:74]
  wire  _T_1034 = _T_1033 ^ dccm_wdata_hi_any[16]; // @[lib.scala 119:74]
  wire  _T_1035 = _T_1034 ^ dccm_wdata_hi_any[17]; // @[lib.scala 119:74]
  wire  _T_1036 = _T_1035 ^ dccm_wdata_hi_any[22]; // @[lib.scala 119:74]
  wire  _T_1037 = _T_1036 ^ dccm_wdata_hi_any[23]; // @[lib.scala 119:74]
  wire  _T_1038 = _T_1037 ^ dccm_wdata_hi_any[24]; // @[lib.scala 119:74]
  wire  _T_1039 = _T_1038 ^ dccm_wdata_hi_any[25]; // @[lib.scala 119:74]
  wire  _T_1040 = _T_1039 ^ dccm_wdata_hi_any[29]; // @[lib.scala 119:74]
  wire  _T_1041 = _T_1040 ^ dccm_wdata_hi_any[30]; // @[lib.scala 119:74]
  wire  _T_1042 = _T_1041 ^ dccm_wdata_hi_any[31]; // @[lib.scala 119:74]
  wire  _T_1058 = dccm_wdata_hi_any[4] ^ dccm_wdata_hi_any[5]; // @[lib.scala 119:74]
  wire  _T_1059 = _T_1058 ^ dccm_wdata_hi_any[6]; // @[lib.scala 119:74]
  wire  _T_1060 = _T_1059 ^ dccm_wdata_hi_any[7]; // @[lib.scala 119:74]
  wire  _T_1061 = _T_1060 ^ dccm_wdata_hi_any[8]; // @[lib.scala 119:74]
  wire  _T_1062 = _T_1061 ^ dccm_wdata_hi_any[9]; // @[lib.scala 119:74]
  wire  _T_1063 = _T_1062 ^ dccm_wdata_hi_any[10]; // @[lib.scala 119:74]
  wire  _T_1064 = _T_1063 ^ dccm_wdata_hi_any[18]; // @[lib.scala 119:74]
  wire  _T_1065 = _T_1064 ^ dccm_wdata_hi_any[19]; // @[lib.scala 119:74]
  wire  _T_1066 = _T_1065 ^ dccm_wdata_hi_any[20]; // @[lib.scala 119:74]
  wire  _T_1067 = _T_1066 ^ dccm_wdata_hi_any[21]; // @[lib.scala 119:74]
  wire  _T_1068 = _T_1067 ^ dccm_wdata_hi_any[22]; // @[lib.scala 119:74]
  wire  _T_1069 = _T_1068 ^ dccm_wdata_hi_any[23]; // @[lib.scala 119:74]
  wire  _T_1070 = _T_1069 ^ dccm_wdata_hi_any[24]; // @[lib.scala 119:74]
  wire  _T_1071 = _T_1070 ^ dccm_wdata_hi_any[25]; // @[lib.scala 119:74]
  wire  _T_1087 = dccm_wdata_hi_any[11] ^ dccm_wdata_hi_any[12]; // @[lib.scala 119:74]
  wire  _T_1088 = _T_1087 ^ dccm_wdata_hi_any[13]; // @[lib.scala 119:74]
  wire  _T_1089 = _T_1088 ^ dccm_wdata_hi_any[14]; // @[lib.scala 119:74]
  wire  _T_1090 = _T_1089 ^ dccm_wdata_hi_any[15]; // @[lib.scala 119:74]
  wire  _T_1091 = _T_1090 ^ dccm_wdata_hi_any[16]; // @[lib.scala 119:74]
  wire  _T_1092 = _T_1091 ^ dccm_wdata_hi_any[17]; // @[lib.scala 119:74]
  wire  _T_1093 = _T_1092 ^ dccm_wdata_hi_any[18]; // @[lib.scala 119:74]
  wire  _T_1094 = _T_1093 ^ dccm_wdata_hi_any[19]; // @[lib.scala 119:74]
  wire  _T_1095 = _T_1094 ^ dccm_wdata_hi_any[20]; // @[lib.scala 119:74]
  wire  _T_1096 = _T_1095 ^ dccm_wdata_hi_any[21]; // @[lib.scala 119:74]
  wire  _T_1097 = _T_1096 ^ dccm_wdata_hi_any[22]; // @[lib.scala 119:74]
  wire  _T_1098 = _T_1097 ^ dccm_wdata_hi_any[23]; // @[lib.scala 119:74]
  wire  _T_1099 = _T_1098 ^ dccm_wdata_hi_any[24]; // @[lib.scala 119:74]
  wire  _T_1100 = _T_1099 ^ dccm_wdata_hi_any[25]; // @[lib.scala 119:74]
  wire  _T_1107 = dccm_wdata_hi_any[26] ^ dccm_wdata_hi_any[27]; // @[lib.scala 119:74]
  wire  _T_1108 = _T_1107 ^ dccm_wdata_hi_any[28]; // @[lib.scala 119:74]
  wire  _T_1109 = _T_1108 ^ dccm_wdata_hi_any[29]; // @[lib.scala 119:74]
  wire  _T_1110 = _T_1109 ^ dccm_wdata_hi_any[30]; // @[lib.scala 119:74]
  wire  _T_1111 = _T_1110 ^ dccm_wdata_hi_any[31]; // @[lib.scala 119:74]
  wire [5:0] _T_1116 = {_T_1111,_T_1100,_T_1071,_T_1042,_T_1007,_T_972}; // @[Cat.scala 29:58]
  wire  _T_1117 = ^dccm_wdata_hi_any; // @[lib.scala 127:13]
  wire  _T_1118 = ^_T_1116; // @[lib.scala 127:23]
  wire  _T_1119 = _T_1117 ^ _T_1118; // @[lib.scala 127:18]
  reg  _T_1149; // @[lsu_ecc.scala 140:72]
  reg  _T_1150; // @[lsu_ecc.scala 141:72]
  reg  _T_1151; // @[lsu_ecc.scala 142:72]
  reg  _T_1152; // @[lsu_ecc.scala 143:72]
  reg [31:0] _T_1154; // @[lib.scala 374:16]
  reg [31:0] _T_1156; // @[lib.scala 374:16]
  reg [31:0] _T_1166; // @[lib.scala 374:16]
  reg [31:0] _T_1168; // @[lib.scala 374:16]
  rvclkhdr rvclkhdr ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  assign io_sec_data_hi_r = _T_1154; // @[lsu_ecc.scala 113:22 lsu_ecc.scala 144:34]
  assign io_sec_data_lo_r = _T_1156; // @[lsu_ecc.scala 116:25 lsu_ecc.scala 145:34]
  assign io_sec_data_hi_m = {_T_364,_T_362}; // @[lsu_ecc.scala 89:32 lsu_ecc.scala 133:27]
  assign io_sec_data_lo_m = {_T_742,_T_740}; // @[lsu_ecc.scala 90:32 lsu_ecc.scala 135:27]
  assign io_sec_data_hi_r_ff = _T_1166; // @[lsu_ecc.scala 156:23]
  assign io_sec_data_lo_r_ff = _T_1168; // @[lsu_ecc.scala 157:23]
  assign io_dma_dccm_wdata_ecc_hi = {_T_1119,_T_1116}; // @[lsu_ecc.scala 153:28]
  assign io_dma_dccm_wdata_ecc_lo = {_T_937,_T_934}; // @[lsu_ecc.scala 154:28]
  assign io_stbuf_ecc_any = {_T_937,_T_934}; // @[lsu_ecc.scala 152:28]
  assign io_sec_data_ecc_hi_r_ff = {_T_1119,_T_1116}; // @[lsu_ecc.scala 150:28]
  assign io_sec_data_ecc_lo_r_ff = {_T_937,_T_934}; // @[lsu_ecc.scala 151:28]
  assign io_single_ecc_error_hi_r = _T_1152; // @[lsu_ecc.scala 114:31 lsu_ecc.scala 143:62]
  assign io_single_ecc_error_lo_r = _T_1151; // @[lsu_ecc.scala 117:31 lsu_ecc.scala 142:62]
  assign io_lsu_single_ecc_error_r = _T_1149; // @[lsu_ecc.scala 119:31 lsu_ecc.scala 140:62]
  assign io_lsu_double_ecc_error_r = _T_1150; // @[lsu_ecc.scala 120:31 lsu_ecc.scala 141:62]
  assign io_lsu_single_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[lsu_ecc.scala 91:30 lsu_ecc.scala 137:33]
  assign io_lsu_double_ecc_error_m = double_ecc_error_hi_any | double_ecc_error_lo_any; // @[lsu_ecc.scala 92:30 lsu_ecc.scala 138:33]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_io_en = io_lsu_single_ecc_error_m | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = io_lsu_single_ecc_error_m | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = io_ld_single_ecc_error_r | io_clk_override; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  _T_1149 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1150 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1151 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1152 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1154 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1156 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1166 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1168 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1149 = 1'h0;
  end
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
    _T_1154 = 32'h0;
  end
  if (reset) begin
    _T_1156 = 32'h0;
  end
  if (reset) begin
    _T_1166 = 32'h0;
  end
  if (reset) begin
    _T_1168 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1149 <= 1'h0;
    end else begin
      _T_1149 <= io_lsu_single_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1150 <= 1'h0;
    end else begin
      _T_1150 <= io_lsu_double_ecc_error_m;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1151 <= 1'h0;
    end else begin
      _T_1151 <= _T_588 & _T_586[6];
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_1152 <= 1'h0;
    end else begin
      _T_1152 <= _T_210 & _T_208[6];
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1154 <= 32'h0;
    end else begin
      _T_1154 <= io_sec_data_hi_m;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1156 <= 32'h0;
    end else begin
      _T_1156 <= io_sec_data_lo_m;
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1166 <= 32'h0;
    end else begin
      _T_1166 <= io_sec_data_hi_r;
    end
  end
  always @(posedge rvclkhdr_3_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_1168 <= 32'h0;
    end else begin
      _T_1168 <= io_sec_data_lo_r;
    end
  end
endmodule
module lsu_trigger(
  input         io_trigger_pkt_any_0_select,
  input         io_trigger_pkt_any_0_match_pkt,
  input         io_trigger_pkt_any_0_store,
  input         io_trigger_pkt_any_0_load,
  input         io_trigger_pkt_any_0_m,
  input  [31:0] io_trigger_pkt_any_0_tdata2,
  input         io_trigger_pkt_any_1_select,
  input         io_trigger_pkt_any_1_match_pkt,
  input         io_trigger_pkt_any_1_store,
  input         io_trigger_pkt_any_1_load,
  input         io_trigger_pkt_any_1_m,
  input  [31:0] io_trigger_pkt_any_1_tdata2,
  input         io_trigger_pkt_any_2_select,
  input         io_trigger_pkt_any_2_match_pkt,
  input         io_trigger_pkt_any_2_store,
  input         io_trigger_pkt_any_2_load,
  input         io_trigger_pkt_any_2_m,
  input  [31:0] io_trigger_pkt_any_2_tdata2,
  input         io_trigger_pkt_any_3_select,
  input         io_trigger_pkt_any_3_match_pkt,
  input         io_trigger_pkt_any_3_store,
  input         io_trigger_pkt_any_3_load,
  input         io_trigger_pkt_any_3_m,
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
  wire  _T = io_trigger_pkt_any_0_m | io_trigger_pkt_any_1_m; // @[lsu_trigger.scala 16:73]
  wire  _T_1 = _T | io_trigger_pkt_any_2_m; // @[lsu_trigger.scala 16:73]
  wire  trigger_enable = _T_1 | io_trigger_pkt_any_3_m; // @[lsu_trigger.scala 16:73]
  wire [15:0] _T_4 = io_lsu_pkt_m_bits_word ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_6 = _T_4 & io_store_data_m[31:16]; // @[lsu_trigger.scala 17:66]
  wire  _T_7 = io_lsu_pkt_m_bits_half | io_lsu_pkt_m_bits_word; // @[lsu_trigger.scala 17:124]
  wire [7:0] _T_9 = _T_7 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_11 = _T_9 & io_store_data_m[15:8]; // @[lsu_trigger.scala 17:151]
  wire [31:0] store_data_trigger_m = {_T_6,_T_11,io_store_data_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_15 = trigger_enable ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] ldst_addr_trigger_m = io_lsu_addr_m & _T_15; // @[lsu_trigger.scala 18:43]
  wire  _T_17 = ~io_trigger_pkt_any_0_select; // @[lsu_trigger.scala 19:53]
  wire  _T_18 = io_trigger_pkt_any_0_select & io_trigger_pkt_any_0_store; // @[lsu_trigger.scala 19:143]
  wire [31:0] _T_20 = _T_17 ? ldst_addr_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = _T_18 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_0 = _T_20 | _T_21; // @[Mux.scala 27:72]
  wire  _T_24 = ~io_trigger_pkt_any_1_select; // @[lsu_trigger.scala 19:53]
  wire  _T_25 = io_trigger_pkt_any_1_select & io_trigger_pkt_any_1_store; // @[lsu_trigger.scala 19:143]
  wire [31:0] _T_27 = _T_24 ? ldst_addr_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_28 = _T_25 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_1 = _T_27 | _T_28; // @[Mux.scala 27:72]
  wire  _T_31 = ~io_trigger_pkt_any_2_select; // @[lsu_trigger.scala 19:53]
  wire  _T_32 = io_trigger_pkt_any_2_select & io_trigger_pkt_any_2_store; // @[lsu_trigger.scala 19:143]
  wire [31:0] _T_34 = _T_31 ? ldst_addr_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_35 = _T_32 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_2 = _T_34 | _T_35; // @[Mux.scala 27:72]
  wire  _T_38 = ~io_trigger_pkt_any_3_select; // @[lsu_trigger.scala 19:53]
  wire  _T_39 = io_trigger_pkt_any_3_select & io_trigger_pkt_any_3_store; // @[lsu_trigger.scala 19:143]
  wire [31:0] _T_41 = _T_38 ? ldst_addr_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_42 = _T_39 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] lsu_match_data_3 = _T_41 | _T_42; // @[Mux.scala 27:72]
  wire  _T_44 = ~io_lsu_pkt_m_bits_dma; // @[lsu_trigger.scala 20:70]
  wire  _T_45 = io_lsu_pkt_m_valid & _T_44; // @[lsu_trigger.scala 20:68]
  wire  _T_46 = _T_45 & trigger_enable; // @[lsu_trigger.scala 20:93]
  wire  _T_47 = io_trigger_pkt_any_0_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 20:142]
  wire  _T_48 = io_trigger_pkt_any_0_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 21:33]
  wire  _T_50 = _T_48 & _T_17; // @[lsu_trigger.scala 21:58]
  wire  _T_51 = _T_47 | _T_50; // @[lsu_trigger.scala 20:168]
  wire  _T_52 = _T_46 & _T_51; // @[lsu_trigger.scala 20:110]
  wire  _T_55 = &io_trigger_pkt_any_0_tdata2; // @[lib.scala 101:45]
  wire  _T_56 = ~_T_55; // @[lib.scala 101:39]
  wire  _T_57 = io_trigger_pkt_any_0_match_pkt & _T_56; // @[lib.scala 101:37]
  wire  _T_60 = io_trigger_pkt_any_0_tdata2[0] == lsu_match_data_0[0]; // @[lib.scala 102:52]
  wire  _T_61 = _T_57 | _T_60; // @[lib.scala 102:41]
  wire  _T_63 = &io_trigger_pkt_any_0_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_64 = _T_63 & _T_57; // @[lib.scala 104:41]
  wire  _T_67 = io_trigger_pkt_any_0_tdata2[1] == lsu_match_data_0[1]; // @[lib.scala 104:78]
  wire  _T_68 = _T_64 | _T_67; // @[lib.scala 104:23]
  wire  _T_70 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_71 = _T_70 & _T_57; // @[lib.scala 104:41]
  wire  _T_74 = io_trigger_pkt_any_0_tdata2[2] == lsu_match_data_0[2]; // @[lib.scala 104:78]
  wire  _T_75 = _T_71 | _T_74; // @[lib.scala 104:23]
  wire  _T_77 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_78 = _T_77 & _T_57; // @[lib.scala 104:41]
  wire  _T_81 = io_trigger_pkt_any_0_tdata2[3] == lsu_match_data_0[3]; // @[lib.scala 104:78]
  wire  _T_82 = _T_78 | _T_81; // @[lib.scala 104:23]
  wire  _T_84 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_85 = _T_84 & _T_57; // @[lib.scala 104:41]
  wire  _T_88 = io_trigger_pkt_any_0_tdata2[4] == lsu_match_data_0[4]; // @[lib.scala 104:78]
  wire  _T_89 = _T_85 | _T_88; // @[lib.scala 104:23]
  wire  _T_91 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_92 = _T_91 & _T_57; // @[lib.scala 104:41]
  wire  _T_95 = io_trigger_pkt_any_0_tdata2[5] == lsu_match_data_0[5]; // @[lib.scala 104:78]
  wire  _T_96 = _T_92 | _T_95; // @[lib.scala 104:23]
  wire  _T_98 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_99 = _T_98 & _T_57; // @[lib.scala 104:41]
  wire  _T_102 = io_trigger_pkt_any_0_tdata2[6] == lsu_match_data_0[6]; // @[lib.scala 104:78]
  wire  _T_103 = _T_99 | _T_102; // @[lib.scala 104:23]
  wire  _T_105 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_106 = _T_105 & _T_57; // @[lib.scala 104:41]
  wire  _T_109 = io_trigger_pkt_any_0_tdata2[7] == lsu_match_data_0[7]; // @[lib.scala 104:78]
  wire  _T_110 = _T_106 | _T_109; // @[lib.scala 104:23]
  wire  _T_112 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_113 = _T_112 & _T_57; // @[lib.scala 104:41]
  wire  _T_116 = io_trigger_pkt_any_0_tdata2[8] == lsu_match_data_0[8]; // @[lib.scala 104:78]
  wire  _T_117 = _T_113 | _T_116; // @[lib.scala 104:23]
  wire  _T_119 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_120 = _T_119 & _T_57; // @[lib.scala 104:41]
  wire  _T_123 = io_trigger_pkt_any_0_tdata2[9] == lsu_match_data_0[9]; // @[lib.scala 104:78]
  wire  _T_124 = _T_120 | _T_123; // @[lib.scala 104:23]
  wire  _T_126 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_127 = _T_126 & _T_57; // @[lib.scala 104:41]
  wire  _T_130 = io_trigger_pkt_any_0_tdata2[10] == lsu_match_data_0[10]; // @[lib.scala 104:78]
  wire  _T_131 = _T_127 | _T_130; // @[lib.scala 104:23]
  wire  _T_133 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_134 = _T_133 & _T_57; // @[lib.scala 104:41]
  wire  _T_137 = io_trigger_pkt_any_0_tdata2[11] == lsu_match_data_0[11]; // @[lib.scala 104:78]
  wire  _T_138 = _T_134 | _T_137; // @[lib.scala 104:23]
  wire  _T_140 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_141 = _T_140 & _T_57; // @[lib.scala 104:41]
  wire  _T_144 = io_trigger_pkt_any_0_tdata2[12] == lsu_match_data_0[12]; // @[lib.scala 104:78]
  wire  _T_145 = _T_141 | _T_144; // @[lib.scala 104:23]
  wire  _T_147 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_148 = _T_147 & _T_57; // @[lib.scala 104:41]
  wire  _T_151 = io_trigger_pkt_any_0_tdata2[13] == lsu_match_data_0[13]; // @[lib.scala 104:78]
  wire  _T_152 = _T_148 | _T_151; // @[lib.scala 104:23]
  wire  _T_154 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_155 = _T_154 & _T_57; // @[lib.scala 104:41]
  wire  _T_158 = io_trigger_pkt_any_0_tdata2[14] == lsu_match_data_0[14]; // @[lib.scala 104:78]
  wire  _T_159 = _T_155 | _T_158; // @[lib.scala 104:23]
  wire  _T_161 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_162 = _T_161 & _T_57; // @[lib.scala 104:41]
  wire  _T_165 = io_trigger_pkt_any_0_tdata2[15] == lsu_match_data_0[15]; // @[lib.scala 104:78]
  wire  _T_166 = _T_162 | _T_165; // @[lib.scala 104:23]
  wire  _T_168 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_169 = _T_168 & _T_57; // @[lib.scala 104:41]
  wire  _T_172 = io_trigger_pkt_any_0_tdata2[16] == lsu_match_data_0[16]; // @[lib.scala 104:78]
  wire  _T_173 = _T_169 | _T_172; // @[lib.scala 104:23]
  wire  _T_175 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_176 = _T_175 & _T_57; // @[lib.scala 104:41]
  wire  _T_179 = io_trigger_pkt_any_0_tdata2[17] == lsu_match_data_0[17]; // @[lib.scala 104:78]
  wire  _T_180 = _T_176 | _T_179; // @[lib.scala 104:23]
  wire  _T_182 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_183 = _T_182 & _T_57; // @[lib.scala 104:41]
  wire  _T_186 = io_trigger_pkt_any_0_tdata2[18] == lsu_match_data_0[18]; // @[lib.scala 104:78]
  wire  _T_187 = _T_183 | _T_186; // @[lib.scala 104:23]
  wire  _T_189 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_190 = _T_189 & _T_57; // @[lib.scala 104:41]
  wire  _T_193 = io_trigger_pkt_any_0_tdata2[19] == lsu_match_data_0[19]; // @[lib.scala 104:78]
  wire  _T_194 = _T_190 | _T_193; // @[lib.scala 104:23]
  wire  _T_196 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_197 = _T_196 & _T_57; // @[lib.scala 104:41]
  wire  _T_200 = io_trigger_pkt_any_0_tdata2[20] == lsu_match_data_0[20]; // @[lib.scala 104:78]
  wire  _T_201 = _T_197 | _T_200; // @[lib.scala 104:23]
  wire  _T_203 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_204 = _T_203 & _T_57; // @[lib.scala 104:41]
  wire  _T_207 = io_trigger_pkt_any_0_tdata2[21] == lsu_match_data_0[21]; // @[lib.scala 104:78]
  wire  _T_208 = _T_204 | _T_207; // @[lib.scala 104:23]
  wire  _T_210 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_211 = _T_210 & _T_57; // @[lib.scala 104:41]
  wire  _T_214 = io_trigger_pkt_any_0_tdata2[22] == lsu_match_data_0[22]; // @[lib.scala 104:78]
  wire  _T_215 = _T_211 | _T_214; // @[lib.scala 104:23]
  wire  _T_217 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_218 = _T_217 & _T_57; // @[lib.scala 104:41]
  wire  _T_221 = io_trigger_pkt_any_0_tdata2[23] == lsu_match_data_0[23]; // @[lib.scala 104:78]
  wire  _T_222 = _T_218 | _T_221; // @[lib.scala 104:23]
  wire  _T_224 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_225 = _T_224 & _T_57; // @[lib.scala 104:41]
  wire  _T_228 = io_trigger_pkt_any_0_tdata2[24] == lsu_match_data_0[24]; // @[lib.scala 104:78]
  wire  _T_229 = _T_225 | _T_228; // @[lib.scala 104:23]
  wire  _T_231 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_232 = _T_231 & _T_57; // @[lib.scala 104:41]
  wire  _T_235 = io_trigger_pkt_any_0_tdata2[25] == lsu_match_data_0[25]; // @[lib.scala 104:78]
  wire  _T_236 = _T_232 | _T_235; // @[lib.scala 104:23]
  wire  _T_238 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_239 = _T_238 & _T_57; // @[lib.scala 104:41]
  wire  _T_242 = io_trigger_pkt_any_0_tdata2[26] == lsu_match_data_0[26]; // @[lib.scala 104:78]
  wire  _T_243 = _T_239 | _T_242; // @[lib.scala 104:23]
  wire  _T_245 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_246 = _T_245 & _T_57; // @[lib.scala 104:41]
  wire  _T_249 = io_trigger_pkt_any_0_tdata2[27] == lsu_match_data_0[27]; // @[lib.scala 104:78]
  wire  _T_250 = _T_246 | _T_249; // @[lib.scala 104:23]
  wire  _T_252 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_253 = _T_252 & _T_57; // @[lib.scala 104:41]
  wire  _T_256 = io_trigger_pkt_any_0_tdata2[28] == lsu_match_data_0[28]; // @[lib.scala 104:78]
  wire  _T_257 = _T_253 | _T_256; // @[lib.scala 104:23]
  wire  _T_259 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_260 = _T_259 & _T_57; // @[lib.scala 104:41]
  wire  _T_263 = io_trigger_pkt_any_0_tdata2[29] == lsu_match_data_0[29]; // @[lib.scala 104:78]
  wire  _T_264 = _T_260 | _T_263; // @[lib.scala 104:23]
  wire  _T_266 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_267 = _T_266 & _T_57; // @[lib.scala 104:41]
  wire  _T_270 = io_trigger_pkt_any_0_tdata2[30] == lsu_match_data_0[30]; // @[lib.scala 104:78]
  wire  _T_271 = _T_267 | _T_270; // @[lib.scala 104:23]
  wire  _T_273 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_274 = _T_273 & _T_57; // @[lib.scala 104:41]
  wire  _T_277 = io_trigger_pkt_any_0_tdata2[31] == lsu_match_data_0[31]; // @[lib.scala 104:78]
  wire  _T_278 = _T_274 | _T_277; // @[lib.scala 104:23]
  wire [7:0] _T_285 = {_T_110,_T_103,_T_96,_T_89,_T_82,_T_75,_T_68,_T_61}; // @[lib.scala 105:14]
  wire [15:0] _T_293 = {_T_166,_T_159,_T_152,_T_145,_T_138,_T_131,_T_124,_T_117,_T_285}; // @[lib.scala 105:14]
  wire [7:0] _T_300 = {_T_222,_T_215,_T_208,_T_201,_T_194,_T_187,_T_180,_T_173}; // @[lib.scala 105:14]
  wire [31:0] _T_309 = {_T_278,_T_271,_T_264,_T_257,_T_250,_T_243,_T_236,_T_229,_T_300,_T_293}; // @[lib.scala 105:14]
  wire  _T_310 = &_T_309; // @[lib.scala 105:25]
  wire  _T_311 = _T_52 & _T_310; // @[lsu_trigger.scala 21:92]
  wire  _T_315 = io_trigger_pkt_any_1_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 20:142]
  wire  _T_316 = io_trigger_pkt_any_1_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 21:33]
  wire  _T_318 = _T_316 & _T_24; // @[lsu_trigger.scala 21:58]
  wire  _T_319 = _T_315 | _T_318; // @[lsu_trigger.scala 20:168]
  wire  _T_320 = _T_46 & _T_319; // @[lsu_trigger.scala 20:110]
  wire  _T_323 = &io_trigger_pkt_any_1_tdata2; // @[lib.scala 101:45]
  wire  _T_324 = ~_T_323; // @[lib.scala 101:39]
  wire  _T_325 = io_trigger_pkt_any_1_match_pkt & _T_324; // @[lib.scala 101:37]
  wire  _T_328 = io_trigger_pkt_any_1_tdata2[0] == lsu_match_data_1[0]; // @[lib.scala 102:52]
  wire  _T_329 = _T_325 | _T_328; // @[lib.scala 102:41]
  wire  _T_331 = &io_trigger_pkt_any_1_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_332 = _T_331 & _T_325; // @[lib.scala 104:41]
  wire  _T_335 = io_trigger_pkt_any_1_tdata2[1] == lsu_match_data_1[1]; // @[lib.scala 104:78]
  wire  _T_336 = _T_332 | _T_335; // @[lib.scala 104:23]
  wire  _T_338 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_339 = _T_338 & _T_325; // @[lib.scala 104:41]
  wire  _T_342 = io_trigger_pkt_any_1_tdata2[2] == lsu_match_data_1[2]; // @[lib.scala 104:78]
  wire  _T_343 = _T_339 | _T_342; // @[lib.scala 104:23]
  wire  _T_345 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_346 = _T_345 & _T_325; // @[lib.scala 104:41]
  wire  _T_349 = io_trigger_pkt_any_1_tdata2[3] == lsu_match_data_1[3]; // @[lib.scala 104:78]
  wire  _T_350 = _T_346 | _T_349; // @[lib.scala 104:23]
  wire  _T_352 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_353 = _T_352 & _T_325; // @[lib.scala 104:41]
  wire  _T_356 = io_trigger_pkt_any_1_tdata2[4] == lsu_match_data_1[4]; // @[lib.scala 104:78]
  wire  _T_357 = _T_353 | _T_356; // @[lib.scala 104:23]
  wire  _T_359 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_360 = _T_359 & _T_325; // @[lib.scala 104:41]
  wire  _T_363 = io_trigger_pkt_any_1_tdata2[5] == lsu_match_data_1[5]; // @[lib.scala 104:78]
  wire  _T_364 = _T_360 | _T_363; // @[lib.scala 104:23]
  wire  _T_366 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_367 = _T_366 & _T_325; // @[lib.scala 104:41]
  wire  _T_370 = io_trigger_pkt_any_1_tdata2[6] == lsu_match_data_1[6]; // @[lib.scala 104:78]
  wire  _T_371 = _T_367 | _T_370; // @[lib.scala 104:23]
  wire  _T_373 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_374 = _T_373 & _T_325; // @[lib.scala 104:41]
  wire  _T_377 = io_trigger_pkt_any_1_tdata2[7] == lsu_match_data_1[7]; // @[lib.scala 104:78]
  wire  _T_378 = _T_374 | _T_377; // @[lib.scala 104:23]
  wire  _T_380 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_381 = _T_380 & _T_325; // @[lib.scala 104:41]
  wire  _T_384 = io_trigger_pkt_any_1_tdata2[8] == lsu_match_data_1[8]; // @[lib.scala 104:78]
  wire  _T_385 = _T_381 | _T_384; // @[lib.scala 104:23]
  wire  _T_387 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_388 = _T_387 & _T_325; // @[lib.scala 104:41]
  wire  _T_391 = io_trigger_pkt_any_1_tdata2[9] == lsu_match_data_1[9]; // @[lib.scala 104:78]
  wire  _T_392 = _T_388 | _T_391; // @[lib.scala 104:23]
  wire  _T_394 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_395 = _T_394 & _T_325; // @[lib.scala 104:41]
  wire  _T_398 = io_trigger_pkt_any_1_tdata2[10] == lsu_match_data_1[10]; // @[lib.scala 104:78]
  wire  _T_399 = _T_395 | _T_398; // @[lib.scala 104:23]
  wire  _T_401 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_402 = _T_401 & _T_325; // @[lib.scala 104:41]
  wire  _T_405 = io_trigger_pkt_any_1_tdata2[11] == lsu_match_data_1[11]; // @[lib.scala 104:78]
  wire  _T_406 = _T_402 | _T_405; // @[lib.scala 104:23]
  wire  _T_408 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_409 = _T_408 & _T_325; // @[lib.scala 104:41]
  wire  _T_412 = io_trigger_pkt_any_1_tdata2[12] == lsu_match_data_1[12]; // @[lib.scala 104:78]
  wire  _T_413 = _T_409 | _T_412; // @[lib.scala 104:23]
  wire  _T_415 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_416 = _T_415 & _T_325; // @[lib.scala 104:41]
  wire  _T_419 = io_trigger_pkt_any_1_tdata2[13] == lsu_match_data_1[13]; // @[lib.scala 104:78]
  wire  _T_420 = _T_416 | _T_419; // @[lib.scala 104:23]
  wire  _T_422 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_423 = _T_422 & _T_325; // @[lib.scala 104:41]
  wire  _T_426 = io_trigger_pkt_any_1_tdata2[14] == lsu_match_data_1[14]; // @[lib.scala 104:78]
  wire  _T_427 = _T_423 | _T_426; // @[lib.scala 104:23]
  wire  _T_429 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_430 = _T_429 & _T_325; // @[lib.scala 104:41]
  wire  _T_433 = io_trigger_pkt_any_1_tdata2[15] == lsu_match_data_1[15]; // @[lib.scala 104:78]
  wire  _T_434 = _T_430 | _T_433; // @[lib.scala 104:23]
  wire  _T_436 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_437 = _T_436 & _T_325; // @[lib.scala 104:41]
  wire  _T_440 = io_trigger_pkt_any_1_tdata2[16] == lsu_match_data_1[16]; // @[lib.scala 104:78]
  wire  _T_441 = _T_437 | _T_440; // @[lib.scala 104:23]
  wire  _T_443 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_444 = _T_443 & _T_325; // @[lib.scala 104:41]
  wire  _T_447 = io_trigger_pkt_any_1_tdata2[17] == lsu_match_data_1[17]; // @[lib.scala 104:78]
  wire  _T_448 = _T_444 | _T_447; // @[lib.scala 104:23]
  wire  _T_450 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_451 = _T_450 & _T_325; // @[lib.scala 104:41]
  wire  _T_454 = io_trigger_pkt_any_1_tdata2[18] == lsu_match_data_1[18]; // @[lib.scala 104:78]
  wire  _T_455 = _T_451 | _T_454; // @[lib.scala 104:23]
  wire  _T_457 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_458 = _T_457 & _T_325; // @[lib.scala 104:41]
  wire  _T_461 = io_trigger_pkt_any_1_tdata2[19] == lsu_match_data_1[19]; // @[lib.scala 104:78]
  wire  _T_462 = _T_458 | _T_461; // @[lib.scala 104:23]
  wire  _T_464 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_465 = _T_464 & _T_325; // @[lib.scala 104:41]
  wire  _T_468 = io_trigger_pkt_any_1_tdata2[20] == lsu_match_data_1[20]; // @[lib.scala 104:78]
  wire  _T_469 = _T_465 | _T_468; // @[lib.scala 104:23]
  wire  _T_471 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_472 = _T_471 & _T_325; // @[lib.scala 104:41]
  wire  _T_475 = io_trigger_pkt_any_1_tdata2[21] == lsu_match_data_1[21]; // @[lib.scala 104:78]
  wire  _T_476 = _T_472 | _T_475; // @[lib.scala 104:23]
  wire  _T_478 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_479 = _T_478 & _T_325; // @[lib.scala 104:41]
  wire  _T_482 = io_trigger_pkt_any_1_tdata2[22] == lsu_match_data_1[22]; // @[lib.scala 104:78]
  wire  _T_483 = _T_479 | _T_482; // @[lib.scala 104:23]
  wire  _T_485 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_486 = _T_485 & _T_325; // @[lib.scala 104:41]
  wire  _T_489 = io_trigger_pkt_any_1_tdata2[23] == lsu_match_data_1[23]; // @[lib.scala 104:78]
  wire  _T_490 = _T_486 | _T_489; // @[lib.scala 104:23]
  wire  _T_492 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_493 = _T_492 & _T_325; // @[lib.scala 104:41]
  wire  _T_496 = io_trigger_pkt_any_1_tdata2[24] == lsu_match_data_1[24]; // @[lib.scala 104:78]
  wire  _T_497 = _T_493 | _T_496; // @[lib.scala 104:23]
  wire  _T_499 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_500 = _T_499 & _T_325; // @[lib.scala 104:41]
  wire  _T_503 = io_trigger_pkt_any_1_tdata2[25] == lsu_match_data_1[25]; // @[lib.scala 104:78]
  wire  _T_504 = _T_500 | _T_503; // @[lib.scala 104:23]
  wire  _T_506 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_507 = _T_506 & _T_325; // @[lib.scala 104:41]
  wire  _T_510 = io_trigger_pkt_any_1_tdata2[26] == lsu_match_data_1[26]; // @[lib.scala 104:78]
  wire  _T_511 = _T_507 | _T_510; // @[lib.scala 104:23]
  wire  _T_513 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_514 = _T_513 & _T_325; // @[lib.scala 104:41]
  wire  _T_517 = io_trigger_pkt_any_1_tdata2[27] == lsu_match_data_1[27]; // @[lib.scala 104:78]
  wire  _T_518 = _T_514 | _T_517; // @[lib.scala 104:23]
  wire  _T_520 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_521 = _T_520 & _T_325; // @[lib.scala 104:41]
  wire  _T_524 = io_trigger_pkt_any_1_tdata2[28] == lsu_match_data_1[28]; // @[lib.scala 104:78]
  wire  _T_525 = _T_521 | _T_524; // @[lib.scala 104:23]
  wire  _T_527 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_528 = _T_527 & _T_325; // @[lib.scala 104:41]
  wire  _T_531 = io_trigger_pkt_any_1_tdata2[29] == lsu_match_data_1[29]; // @[lib.scala 104:78]
  wire  _T_532 = _T_528 | _T_531; // @[lib.scala 104:23]
  wire  _T_534 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_535 = _T_534 & _T_325; // @[lib.scala 104:41]
  wire  _T_538 = io_trigger_pkt_any_1_tdata2[30] == lsu_match_data_1[30]; // @[lib.scala 104:78]
  wire  _T_539 = _T_535 | _T_538; // @[lib.scala 104:23]
  wire  _T_541 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_542 = _T_541 & _T_325; // @[lib.scala 104:41]
  wire  _T_545 = io_trigger_pkt_any_1_tdata2[31] == lsu_match_data_1[31]; // @[lib.scala 104:78]
  wire  _T_546 = _T_542 | _T_545; // @[lib.scala 104:23]
  wire [7:0] _T_553 = {_T_378,_T_371,_T_364,_T_357,_T_350,_T_343,_T_336,_T_329}; // @[lib.scala 105:14]
  wire [15:0] _T_561 = {_T_434,_T_427,_T_420,_T_413,_T_406,_T_399,_T_392,_T_385,_T_553}; // @[lib.scala 105:14]
  wire [7:0] _T_568 = {_T_490,_T_483,_T_476,_T_469,_T_462,_T_455,_T_448,_T_441}; // @[lib.scala 105:14]
  wire [31:0] _T_577 = {_T_546,_T_539,_T_532,_T_525,_T_518,_T_511,_T_504,_T_497,_T_568,_T_561}; // @[lib.scala 105:14]
  wire  _T_578 = &_T_577; // @[lib.scala 105:25]
  wire  _T_579 = _T_320 & _T_578; // @[lsu_trigger.scala 21:92]
  wire  _T_583 = io_trigger_pkt_any_2_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 20:142]
  wire  _T_584 = io_trigger_pkt_any_2_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 21:33]
  wire  _T_586 = _T_584 & _T_31; // @[lsu_trigger.scala 21:58]
  wire  _T_587 = _T_583 | _T_586; // @[lsu_trigger.scala 20:168]
  wire  _T_588 = _T_46 & _T_587; // @[lsu_trigger.scala 20:110]
  wire  _T_591 = &io_trigger_pkt_any_2_tdata2; // @[lib.scala 101:45]
  wire  _T_592 = ~_T_591; // @[lib.scala 101:39]
  wire  _T_593 = io_trigger_pkt_any_2_match_pkt & _T_592; // @[lib.scala 101:37]
  wire  _T_596 = io_trigger_pkt_any_2_tdata2[0] == lsu_match_data_2[0]; // @[lib.scala 102:52]
  wire  _T_597 = _T_593 | _T_596; // @[lib.scala 102:41]
  wire  _T_599 = &io_trigger_pkt_any_2_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_600 = _T_599 & _T_593; // @[lib.scala 104:41]
  wire  _T_603 = io_trigger_pkt_any_2_tdata2[1] == lsu_match_data_2[1]; // @[lib.scala 104:78]
  wire  _T_604 = _T_600 | _T_603; // @[lib.scala 104:23]
  wire  _T_606 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_607 = _T_606 & _T_593; // @[lib.scala 104:41]
  wire  _T_610 = io_trigger_pkt_any_2_tdata2[2] == lsu_match_data_2[2]; // @[lib.scala 104:78]
  wire  _T_611 = _T_607 | _T_610; // @[lib.scala 104:23]
  wire  _T_613 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_614 = _T_613 & _T_593; // @[lib.scala 104:41]
  wire  _T_617 = io_trigger_pkt_any_2_tdata2[3] == lsu_match_data_2[3]; // @[lib.scala 104:78]
  wire  _T_618 = _T_614 | _T_617; // @[lib.scala 104:23]
  wire  _T_620 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_621 = _T_620 & _T_593; // @[lib.scala 104:41]
  wire  _T_624 = io_trigger_pkt_any_2_tdata2[4] == lsu_match_data_2[4]; // @[lib.scala 104:78]
  wire  _T_625 = _T_621 | _T_624; // @[lib.scala 104:23]
  wire  _T_627 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_628 = _T_627 & _T_593; // @[lib.scala 104:41]
  wire  _T_631 = io_trigger_pkt_any_2_tdata2[5] == lsu_match_data_2[5]; // @[lib.scala 104:78]
  wire  _T_632 = _T_628 | _T_631; // @[lib.scala 104:23]
  wire  _T_634 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_635 = _T_634 & _T_593; // @[lib.scala 104:41]
  wire  _T_638 = io_trigger_pkt_any_2_tdata2[6] == lsu_match_data_2[6]; // @[lib.scala 104:78]
  wire  _T_639 = _T_635 | _T_638; // @[lib.scala 104:23]
  wire  _T_641 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_642 = _T_641 & _T_593; // @[lib.scala 104:41]
  wire  _T_645 = io_trigger_pkt_any_2_tdata2[7] == lsu_match_data_2[7]; // @[lib.scala 104:78]
  wire  _T_646 = _T_642 | _T_645; // @[lib.scala 104:23]
  wire  _T_648 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_649 = _T_648 & _T_593; // @[lib.scala 104:41]
  wire  _T_652 = io_trigger_pkt_any_2_tdata2[8] == lsu_match_data_2[8]; // @[lib.scala 104:78]
  wire  _T_653 = _T_649 | _T_652; // @[lib.scala 104:23]
  wire  _T_655 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_656 = _T_655 & _T_593; // @[lib.scala 104:41]
  wire  _T_659 = io_trigger_pkt_any_2_tdata2[9] == lsu_match_data_2[9]; // @[lib.scala 104:78]
  wire  _T_660 = _T_656 | _T_659; // @[lib.scala 104:23]
  wire  _T_662 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_663 = _T_662 & _T_593; // @[lib.scala 104:41]
  wire  _T_666 = io_trigger_pkt_any_2_tdata2[10] == lsu_match_data_2[10]; // @[lib.scala 104:78]
  wire  _T_667 = _T_663 | _T_666; // @[lib.scala 104:23]
  wire  _T_669 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_670 = _T_669 & _T_593; // @[lib.scala 104:41]
  wire  _T_673 = io_trigger_pkt_any_2_tdata2[11] == lsu_match_data_2[11]; // @[lib.scala 104:78]
  wire  _T_674 = _T_670 | _T_673; // @[lib.scala 104:23]
  wire  _T_676 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_677 = _T_676 & _T_593; // @[lib.scala 104:41]
  wire  _T_680 = io_trigger_pkt_any_2_tdata2[12] == lsu_match_data_2[12]; // @[lib.scala 104:78]
  wire  _T_681 = _T_677 | _T_680; // @[lib.scala 104:23]
  wire  _T_683 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_684 = _T_683 & _T_593; // @[lib.scala 104:41]
  wire  _T_687 = io_trigger_pkt_any_2_tdata2[13] == lsu_match_data_2[13]; // @[lib.scala 104:78]
  wire  _T_688 = _T_684 | _T_687; // @[lib.scala 104:23]
  wire  _T_690 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_691 = _T_690 & _T_593; // @[lib.scala 104:41]
  wire  _T_694 = io_trigger_pkt_any_2_tdata2[14] == lsu_match_data_2[14]; // @[lib.scala 104:78]
  wire  _T_695 = _T_691 | _T_694; // @[lib.scala 104:23]
  wire  _T_697 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_698 = _T_697 & _T_593; // @[lib.scala 104:41]
  wire  _T_701 = io_trigger_pkt_any_2_tdata2[15] == lsu_match_data_2[15]; // @[lib.scala 104:78]
  wire  _T_702 = _T_698 | _T_701; // @[lib.scala 104:23]
  wire  _T_704 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_705 = _T_704 & _T_593; // @[lib.scala 104:41]
  wire  _T_708 = io_trigger_pkt_any_2_tdata2[16] == lsu_match_data_2[16]; // @[lib.scala 104:78]
  wire  _T_709 = _T_705 | _T_708; // @[lib.scala 104:23]
  wire  _T_711 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_712 = _T_711 & _T_593; // @[lib.scala 104:41]
  wire  _T_715 = io_trigger_pkt_any_2_tdata2[17] == lsu_match_data_2[17]; // @[lib.scala 104:78]
  wire  _T_716 = _T_712 | _T_715; // @[lib.scala 104:23]
  wire  _T_718 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_719 = _T_718 & _T_593; // @[lib.scala 104:41]
  wire  _T_722 = io_trigger_pkt_any_2_tdata2[18] == lsu_match_data_2[18]; // @[lib.scala 104:78]
  wire  _T_723 = _T_719 | _T_722; // @[lib.scala 104:23]
  wire  _T_725 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_726 = _T_725 & _T_593; // @[lib.scala 104:41]
  wire  _T_729 = io_trigger_pkt_any_2_tdata2[19] == lsu_match_data_2[19]; // @[lib.scala 104:78]
  wire  _T_730 = _T_726 | _T_729; // @[lib.scala 104:23]
  wire  _T_732 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_733 = _T_732 & _T_593; // @[lib.scala 104:41]
  wire  _T_736 = io_trigger_pkt_any_2_tdata2[20] == lsu_match_data_2[20]; // @[lib.scala 104:78]
  wire  _T_737 = _T_733 | _T_736; // @[lib.scala 104:23]
  wire  _T_739 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_740 = _T_739 & _T_593; // @[lib.scala 104:41]
  wire  _T_743 = io_trigger_pkt_any_2_tdata2[21] == lsu_match_data_2[21]; // @[lib.scala 104:78]
  wire  _T_744 = _T_740 | _T_743; // @[lib.scala 104:23]
  wire  _T_746 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_747 = _T_746 & _T_593; // @[lib.scala 104:41]
  wire  _T_750 = io_trigger_pkt_any_2_tdata2[22] == lsu_match_data_2[22]; // @[lib.scala 104:78]
  wire  _T_751 = _T_747 | _T_750; // @[lib.scala 104:23]
  wire  _T_753 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_754 = _T_753 & _T_593; // @[lib.scala 104:41]
  wire  _T_757 = io_trigger_pkt_any_2_tdata2[23] == lsu_match_data_2[23]; // @[lib.scala 104:78]
  wire  _T_758 = _T_754 | _T_757; // @[lib.scala 104:23]
  wire  _T_760 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_761 = _T_760 & _T_593; // @[lib.scala 104:41]
  wire  _T_764 = io_trigger_pkt_any_2_tdata2[24] == lsu_match_data_2[24]; // @[lib.scala 104:78]
  wire  _T_765 = _T_761 | _T_764; // @[lib.scala 104:23]
  wire  _T_767 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_768 = _T_767 & _T_593; // @[lib.scala 104:41]
  wire  _T_771 = io_trigger_pkt_any_2_tdata2[25] == lsu_match_data_2[25]; // @[lib.scala 104:78]
  wire  _T_772 = _T_768 | _T_771; // @[lib.scala 104:23]
  wire  _T_774 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_775 = _T_774 & _T_593; // @[lib.scala 104:41]
  wire  _T_778 = io_trigger_pkt_any_2_tdata2[26] == lsu_match_data_2[26]; // @[lib.scala 104:78]
  wire  _T_779 = _T_775 | _T_778; // @[lib.scala 104:23]
  wire  _T_781 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_782 = _T_781 & _T_593; // @[lib.scala 104:41]
  wire  _T_785 = io_trigger_pkt_any_2_tdata2[27] == lsu_match_data_2[27]; // @[lib.scala 104:78]
  wire  _T_786 = _T_782 | _T_785; // @[lib.scala 104:23]
  wire  _T_788 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_789 = _T_788 & _T_593; // @[lib.scala 104:41]
  wire  _T_792 = io_trigger_pkt_any_2_tdata2[28] == lsu_match_data_2[28]; // @[lib.scala 104:78]
  wire  _T_793 = _T_789 | _T_792; // @[lib.scala 104:23]
  wire  _T_795 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_796 = _T_795 & _T_593; // @[lib.scala 104:41]
  wire  _T_799 = io_trigger_pkt_any_2_tdata2[29] == lsu_match_data_2[29]; // @[lib.scala 104:78]
  wire  _T_800 = _T_796 | _T_799; // @[lib.scala 104:23]
  wire  _T_802 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_803 = _T_802 & _T_593; // @[lib.scala 104:41]
  wire  _T_806 = io_trigger_pkt_any_2_tdata2[30] == lsu_match_data_2[30]; // @[lib.scala 104:78]
  wire  _T_807 = _T_803 | _T_806; // @[lib.scala 104:23]
  wire  _T_809 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_810 = _T_809 & _T_593; // @[lib.scala 104:41]
  wire  _T_813 = io_trigger_pkt_any_2_tdata2[31] == lsu_match_data_2[31]; // @[lib.scala 104:78]
  wire  _T_814 = _T_810 | _T_813; // @[lib.scala 104:23]
  wire [7:0] _T_821 = {_T_646,_T_639,_T_632,_T_625,_T_618,_T_611,_T_604,_T_597}; // @[lib.scala 105:14]
  wire [15:0] _T_829 = {_T_702,_T_695,_T_688,_T_681,_T_674,_T_667,_T_660,_T_653,_T_821}; // @[lib.scala 105:14]
  wire [7:0] _T_836 = {_T_758,_T_751,_T_744,_T_737,_T_730,_T_723,_T_716,_T_709}; // @[lib.scala 105:14]
  wire [31:0] _T_845 = {_T_814,_T_807,_T_800,_T_793,_T_786,_T_779,_T_772,_T_765,_T_836,_T_829}; // @[lib.scala 105:14]
  wire  _T_846 = &_T_845; // @[lib.scala 105:25]
  wire  _T_847 = _T_588 & _T_846; // @[lsu_trigger.scala 21:92]
  wire  _T_851 = io_trigger_pkt_any_3_store & io_lsu_pkt_m_bits_store; // @[lsu_trigger.scala 20:142]
  wire  _T_852 = io_trigger_pkt_any_3_load & io_lsu_pkt_m_bits_load; // @[lsu_trigger.scala 21:33]
  wire  _T_854 = _T_852 & _T_38; // @[lsu_trigger.scala 21:58]
  wire  _T_855 = _T_851 | _T_854; // @[lsu_trigger.scala 20:168]
  wire  _T_856 = _T_46 & _T_855; // @[lsu_trigger.scala 20:110]
  wire  _T_859 = &io_trigger_pkt_any_3_tdata2; // @[lib.scala 101:45]
  wire  _T_860 = ~_T_859; // @[lib.scala 101:39]
  wire  _T_861 = io_trigger_pkt_any_3_match_pkt & _T_860; // @[lib.scala 101:37]
  wire  _T_864 = io_trigger_pkt_any_3_tdata2[0] == lsu_match_data_3[0]; // @[lib.scala 102:52]
  wire  _T_865 = _T_861 | _T_864; // @[lib.scala 102:41]
  wire  _T_867 = &io_trigger_pkt_any_3_tdata2[0]; // @[lib.scala 104:36]
  wire  _T_868 = _T_867 & _T_861; // @[lib.scala 104:41]
  wire  _T_871 = io_trigger_pkt_any_3_tdata2[1] == lsu_match_data_3[1]; // @[lib.scala 104:78]
  wire  _T_872 = _T_868 | _T_871; // @[lib.scala 104:23]
  wire  _T_874 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[lib.scala 104:36]
  wire  _T_875 = _T_874 & _T_861; // @[lib.scala 104:41]
  wire  _T_878 = io_trigger_pkt_any_3_tdata2[2] == lsu_match_data_3[2]; // @[lib.scala 104:78]
  wire  _T_879 = _T_875 | _T_878; // @[lib.scala 104:23]
  wire  _T_881 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[lib.scala 104:36]
  wire  _T_882 = _T_881 & _T_861; // @[lib.scala 104:41]
  wire  _T_885 = io_trigger_pkt_any_3_tdata2[3] == lsu_match_data_3[3]; // @[lib.scala 104:78]
  wire  _T_886 = _T_882 | _T_885; // @[lib.scala 104:23]
  wire  _T_888 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[lib.scala 104:36]
  wire  _T_889 = _T_888 & _T_861; // @[lib.scala 104:41]
  wire  _T_892 = io_trigger_pkt_any_3_tdata2[4] == lsu_match_data_3[4]; // @[lib.scala 104:78]
  wire  _T_893 = _T_889 | _T_892; // @[lib.scala 104:23]
  wire  _T_895 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[lib.scala 104:36]
  wire  _T_896 = _T_895 & _T_861; // @[lib.scala 104:41]
  wire  _T_899 = io_trigger_pkt_any_3_tdata2[5] == lsu_match_data_3[5]; // @[lib.scala 104:78]
  wire  _T_900 = _T_896 | _T_899; // @[lib.scala 104:23]
  wire  _T_902 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[lib.scala 104:36]
  wire  _T_903 = _T_902 & _T_861; // @[lib.scala 104:41]
  wire  _T_906 = io_trigger_pkt_any_3_tdata2[6] == lsu_match_data_3[6]; // @[lib.scala 104:78]
  wire  _T_907 = _T_903 | _T_906; // @[lib.scala 104:23]
  wire  _T_909 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[lib.scala 104:36]
  wire  _T_910 = _T_909 & _T_861; // @[lib.scala 104:41]
  wire  _T_913 = io_trigger_pkt_any_3_tdata2[7] == lsu_match_data_3[7]; // @[lib.scala 104:78]
  wire  _T_914 = _T_910 | _T_913; // @[lib.scala 104:23]
  wire  _T_916 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[lib.scala 104:36]
  wire  _T_917 = _T_916 & _T_861; // @[lib.scala 104:41]
  wire  _T_920 = io_trigger_pkt_any_3_tdata2[8] == lsu_match_data_3[8]; // @[lib.scala 104:78]
  wire  _T_921 = _T_917 | _T_920; // @[lib.scala 104:23]
  wire  _T_923 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[lib.scala 104:36]
  wire  _T_924 = _T_923 & _T_861; // @[lib.scala 104:41]
  wire  _T_927 = io_trigger_pkt_any_3_tdata2[9] == lsu_match_data_3[9]; // @[lib.scala 104:78]
  wire  _T_928 = _T_924 | _T_927; // @[lib.scala 104:23]
  wire  _T_930 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[lib.scala 104:36]
  wire  _T_931 = _T_930 & _T_861; // @[lib.scala 104:41]
  wire  _T_934 = io_trigger_pkt_any_3_tdata2[10] == lsu_match_data_3[10]; // @[lib.scala 104:78]
  wire  _T_935 = _T_931 | _T_934; // @[lib.scala 104:23]
  wire  _T_937 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[lib.scala 104:36]
  wire  _T_938 = _T_937 & _T_861; // @[lib.scala 104:41]
  wire  _T_941 = io_trigger_pkt_any_3_tdata2[11] == lsu_match_data_3[11]; // @[lib.scala 104:78]
  wire  _T_942 = _T_938 | _T_941; // @[lib.scala 104:23]
  wire  _T_944 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[lib.scala 104:36]
  wire  _T_945 = _T_944 & _T_861; // @[lib.scala 104:41]
  wire  _T_948 = io_trigger_pkt_any_3_tdata2[12] == lsu_match_data_3[12]; // @[lib.scala 104:78]
  wire  _T_949 = _T_945 | _T_948; // @[lib.scala 104:23]
  wire  _T_951 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[lib.scala 104:36]
  wire  _T_952 = _T_951 & _T_861; // @[lib.scala 104:41]
  wire  _T_955 = io_trigger_pkt_any_3_tdata2[13] == lsu_match_data_3[13]; // @[lib.scala 104:78]
  wire  _T_956 = _T_952 | _T_955; // @[lib.scala 104:23]
  wire  _T_958 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[lib.scala 104:36]
  wire  _T_959 = _T_958 & _T_861; // @[lib.scala 104:41]
  wire  _T_962 = io_trigger_pkt_any_3_tdata2[14] == lsu_match_data_3[14]; // @[lib.scala 104:78]
  wire  _T_963 = _T_959 | _T_962; // @[lib.scala 104:23]
  wire  _T_965 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[lib.scala 104:36]
  wire  _T_966 = _T_965 & _T_861; // @[lib.scala 104:41]
  wire  _T_969 = io_trigger_pkt_any_3_tdata2[15] == lsu_match_data_3[15]; // @[lib.scala 104:78]
  wire  _T_970 = _T_966 | _T_969; // @[lib.scala 104:23]
  wire  _T_972 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[lib.scala 104:36]
  wire  _T_973 = _T_972 & _T_861; // @[lib.scala 104:41]
  wire  _T_976 = io_trigger_pkt_any_3_tdata2[16] == lsu_match_data_3[16]; // @[lib.scala 104:78]
  wire  _T_977 = _T_973 | _T_976; // @[lib.scala 104:23]
  wire  _T_979 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[lib.scala 104:36]
  wire  _T_980 = _T_979 & _T_861; // @[lib.scala 104:41]
  wire  _T_983 = io_trigger_pkt_any_3_tdata2[17] == lsu_match_data_3[17]; // @[lib.scala 104:78]
  wire  _T_984 = _T_980 | _T_983; // @[lib.scala 104:23]
  wire  _T_986 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[lib.scala 104:36]
  wire  _T_987 = _T_986 & _T_861; // @[lib.scala 104:41]
  wire  _T_990 = io_trigger_pkt_any_3_tdata2[18] == lsu_match_data_3[18]; // @[lib.scala 104:78]
  wire  _T_991 = _T_987 | _T_990; // @[lib.scala 104:23]
  wire  _T_993 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[lib.scala 104:36]
  wire  _T_994 = _T_993 & _T_861; // @[lib.scala 104:41]
  wire  _T_997 = io_trigger_pkt_any_3_tdata2[19] == lsu_match_data_3[19]; // @[lib.scala 104:78]
  wire  _T_998 = _T_994 | _T_997; // @[lib.scala 104:23]
  wire  _T_1000 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[lib.scala 104:36]
  wire  _T_1001 = _T_1000 & _T_861; // @[lib.scala 104:41]
  wire  _T_1004 = io_trigger_pkt_any_3_tdata2[20] == lsu_match_data_3[20]; // @[lib.scala 104:78]
  wire  _T_1005 = _T_1001 | _T_1004; // @[lib.scala 104:23]
  wire  _T_1007 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[lib.scala 104:36]
  wire  _T_1008 = _T_1007 & _T_861; // @[lib.scala 104:41]
  wire  _T_1011 = io_trigger_pkt_any_3_tdata2[21] == lsu_match_data_3[21]; // @[lib.scala 104:78]
  wire  _T_1012 = _T_1008 | _T_1011; // @[lib.scala 104:23]
  wire  _T_1014 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[lib.scala 104:36]
  wire  _T_1015 = _T_1014 & _T_861; // @[lib.scala 104:41]
  wire  _T_1018 = io_trigger_pkt_any_3_tdata2[22] == lsu_match_data_3[22]; // @[lib.scala 104:78]
  wire  _T_1019 = _T_1015 | _T_1018; // @[lib.scala 104:23]
  wire  _T_1021 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[lib.scala 104:36]
  wire  _T_1022 = _T_1021 & _T_861; // @[lib.scala 104:41]
  wire  _T_1025 = io_trigger_pkt_any_3_tdata2[23] == lsu_match_data_3[23]; // @[lib.scala 104:78]
  wire  _T_1026 = _T_1022 | _T_1025; // @[lib.scala 104:23]
  wire  _T_1028 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[lib.scala 104:36]
  wire  _T_1029 = _T_1028 & _T_861; // @[lib.scala 104:41]
  wire  _T_1032 = io_trigger_pkt_any_3_tdata2[24] == lsu_match_data_3[24]; // @[lib.scala 104:78]
  wire  _T_1033 = _T_1029 | _T_1032; // @[lib.scala 104:23]
  wire  _T_1035 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[lib.scala 104:36]
  wire  _T_1036 = _T_1035 & _T_861; // @[lib.scala 104:41]
  wire  _T_1039 = io_trigger_pkt_any_3_tdata2[25] == lsu_match_data_3[25]; // @[lib.scala 104:78]
  wire  _T_1040 = _T_1036 | _T_1039; // @[lib.scala 104:23]
  wire  _T_1042 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[lib.scala 104:36]
  wire  _T_1043 = _T_1042 & _T_861; // @[lib.scala 104:41]
  wire  _T_1046 = io_trigger_pkt_any_3_tdata2[26] == lsu_match_data_3[26]; // @[lib.scala 104:78]
  wire  _T_1047 = _T_1043 | _T_1046; // @[lib.scala 104:23]
  wire  _T_1049 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[lib.scala 104:36]
  wire  _T_1050 = _T_1049 & _T_861; // @[lib.scala 104:41]
  wire  _T_1053 = io_trigger_pkt_any_3_tdata2[27] == lsu_match_data_3[27]; // @[lib.scala 104:78]
  wire  _T_1054 = _T_1050 | _T_1053; // @[lib.scala 104:23]
  wire  _T_1056 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[lib.scala 104:36]
  wire  _T_1057 = _T_1056 & _T_861; // @[lib.scala 104:41]
  wire  _T_1060 = io_trigger_pkt_any_3_tdata2[28] == lsu_match_data_3[28]; // @[lib.scala 104:78]
  wire  _T_1061 = _T_1057 | _T_1060; // @[lib.scala 104:23]
  wire  _T_1063 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[lib.scala 104:36]
  wire  _T_1064 = _T_1063 & _T_861; // @[lib.scala 104:41]
  wire  _T_1067 = io_trigger_pkt_any_3_tdata2[29] == lsu_match_data_3[29]; // @[lib.scala 104:78]
  wire  _T_1068 = _T_1064 | _T_1067; // @[lib.scala 104:23]
  wire  _T_1070 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[lib.scala 104:36]
  wire  _T_1071 = _T_1070 & _T_861; // @[lib.scala 104:41]
  wire  _T_1074 = io_trigger_pkt_any_3_tdata2[30] == lsu_match_data_3[30]; // @[lib.scala 104:78]
  wire  _T_1075 = _T_1071 | _T_1074; // @[lib.scala 104:23]
  wire  _T_1077 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[lib.scala 104:36]
  wire  _T_1078 = _T_1077 & _T_861; // @[lib.scala 104:41]
  wire  _T_1081 = io_trigger_pkt_any_3_tdata2[31] == lsu_match_data_3[31]; // @[lib.scala 104:78]
  wire  _T_1082 = _T_1078 | _T_1081; // @[lib.scala 104:23]
  wire [7:0] _T_1089 = {_T_914,_T_907,_T_900,_T_893,_T_886,_T_879,_T_872,_T_865}; // @[lib.scala 105:14]
  wire [15:0] _T_1097 = {_T_970,_T_963,_T_956,_T_949,_T_942,_T_935,_T_928,_T_921,_T_1089}; // @[lib.scala 105:14]
  wire [7:0] _T_1104 = {_T_1026,_T_1019,_T_1012,_T_1005,_T_998,_T_991,_T_984,_T_977}; // @[lib.scala 105:14]
  wire [31:0] _T_1113 = {_T_1082,_T_1075,_T_1068,_T_1061,_T_1054,_T_1047,_T_1040,_T_1033,_T_1104,_T_1097}; // @[lib.scala 105:14]
  wire  _T_1114 = &_T_1113; // @[lib.scala 105:25]
  wire  _T_1115 = _T_856 & _T_1114; // @[lsu_trigger.scala 21:92]
  wire [2:0] _T_1117 = {_T_1115,_T_847,_T_579}; // @[Cat.scala 29:58]
  assign io_lsu_trigger_match_m = {_T_1117,_T_311}; // @[lsu_trigger.scala 20:25]
endmodule
module lsu_clkdomain(
  input   clock,
  input   reset,
  input   io_active_clk,
  input   io_clk_override,
  input   io_dec_tlu_force_halt,
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
  output  io_lsu_bus_obuf_c1_clken,
  output  io_lsu_busm_clken,
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
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_3_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_4_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_6_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_7_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_8_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_8_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_9_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_9_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_10_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_10_io_scan_mode; // @[lib.scala 343:22]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 343:22]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 343:22]
  wire  rvclkhdr_11_io_en; // @[lib.scala 343:22]
  wire  rvclkhdr_11_io_scan_mode; // @[lib.scala 343:22]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[lsu_clkdomain.scala 64:47]
  wire  lsu_c1_m_clken = _T | io_clk_override; // @[lsu_clkdomain.scala 64:65]
  reg  lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 84:67]
  wire  _T_1 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 65:51]
  wire  lsu_c1_r_clken = _T_1 | io_clk_override; // @[lsu_clkdomain.scala 65:70]
  wire  _T_2 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[lsu_clkdomain.scala 67:47]
  reg  lsu_c1_r_clken_q; // @[lsu_clkdomain.scala 85:67]
  wire  _T_3 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[lsu_clkdomain.scala 68:47]
  wire  _T_4 = lsu_c1_m_clken & io_lsu_pkt_d_bits_store; // @[lsu_clkdomain.scala 70:49]
  wire  _T_5 = lsu_c1_r_clken & io_lsu_pkt_m_bits_store; // @[lsu_clkdomain.scala 71:49]
  wire  _T_6 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[lsu_clkdomain.scala 72:55]
  wire  _T_7 = _T_6 | io_stbuf_reqvld_flushed_any; // @[lsu_clkdomain.scala 72:77]
  wire  _T_8 = io_lsu_bus_buffer_pend_any | io_lsu_busreq_r; // @[lsu_clkdomain.scala 74:62]
  wire  _T_9 = _T_8 | io_clk_override; // @[lsu_clkdomain.scala 74:80]
  wire  _T_11 = ~io_lsu_bus_buffer_empty_any; // @[lsu_clkdomain.scala 75:32]
  wire  _T_12 = _T_11 | io_lsu_busreq_r; // @[lsu_clkdomain.scala 75:61]
  wire  _T_13 = _T_12 | io_dec_tlu_force_halt; // @[lsu_clkdomain.scala 75:79]
  wire  _T_14 = io_lsu_p_valid | io_lsu_pkt_d_valid; // @[lsu_clkdomain.scala 77:48]
  wire  _T_15 = _T_14 | io_lsu_pkt_m_valid; // @[lsu_clkdomain.scala 77:69]
  wire  _T_16 = _T_15 | io_lsu_pkt_r_valid; // @[lsu_clkdomain.scala 77:90]
  wire  _T_18 = _T_16 | _T_11; // @[lsu_clkdomain.scala 77:112]
  wire  _T_19 = ~io_lsu_stbuf_empty_any; // @[lsu_clkdomain.scala 77:145]
  wire  _T_20 = _T_18 | _T_19; // @[lsu_clkdomain.scala 77:143]
  wire  lsu_free_c1_clken = _T_20 | io_clk_override; // @[lsu_clkdomain.scala 77:169]
  reg  lsu_free_c1_clken_q; // @[lsu_clkdomain.scala 82:62]
  wire  _T_21 = lsu_free_c1_clken | lsu_free_c1_clken_q; // @[lsu_clkdomain.scala 78:50]
  wire  _T_24 = _T_12 | io_clk_override; // @[lsu_clkdomain.scala 79:72]
  rvclkhdr rvclkhdr ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 343:22]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_bus_obuf_c1_clken = _T_9 & io_lsu_bus_clk_en; // @[lsu_clkdomain.scala 74:30]
  assign io_lsu_busm_clken = _T_24 & io_lsu_bus_clk_en; // @[lsu_clkdomain.scala 79:21]
  assign io_lsu_c1_m_clk = rvclkhdr_io_l1clk; // @[lsu_clkdomain.scala 87:26]
  assign io_lsu_c1_r_clk = rvclkhdr_1_io_l1clk; // @[lsu_clkdomain.scala 88:26]
  assign io_lsu_c2_m_clk = rvclkhdr_2_io_l1clk; // @[lsu_clkdomain.scala 89:26]
  assign io_lsu_c2_r_clk = rvclkhdr_3_io_l1clk; // @[lsu_clkdomain.scala 90:26]
  assign io_lsu_store_c1_m_clk = rvclkhdr_4_io_l1clk; // @[lsu_clkdomain.scala 91:26]
  assign io_lsu_store_c1_r_clk = rvclkhdr_5_io_l1clk; // @[lsu_clkdomain.scala 92:26]
  assign io_lsu_stbuf_c1_clk = rvclkhdr_6_io_l1clk; // @[lsu_clkdomain.scala 93:26]
  assign io_lsu_bus_obuf_c1_clk = rvclkhdr_8_io_l1clk; // @[lsu_clkdomain.scala 95:26]
  assign io_lsu_bus_ibuf_c1_clk = rvclkhdr_7_io_l1clk; // @[lsu_clkdomain.scala 94:26]
  assign io_lsu_bus_buf_c1_clk = rvclkhdr_9_io_l1clk; // @[lsu_clkdomain.scala 96:26]
  assign io_lsu_busm_clk = rvclkhdr_10_io_l1clk; // @[lsu_clkdomain.scala 97:26]
  assign io_lsu_free_c2_clk = rvclkhdr_11_io_l1clk; // @[lsu_clkdomain.scala 98:26]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_io_en = _T | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_1_io_en = _T_1 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_2_io_en = _T_2 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_3_io_en = _T_3 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_4_io_en = _T_4 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_5_io_en = _T_5 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_6_io_en = _T_7 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_7_io_en = io_lsu_busreq_r | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_8_io_en = io_lsu_bus_obuf_c1_clken; // @[lib.scala 345:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_9_io_en = _T_13 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_10_io_en = io_lsu_busm_clken; // @[lib.scala 345:16]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 344:17]
  assign rvclkhdr_11_io_en = _T_21 | io_clk_override; // @[lib.scala 345:16]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[lib.scala 346:23]
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
  lsu_c1_m_clken_q = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_c1_r_clken_q = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_free_c1_clken_q = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
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
      lsu_c1_m_clken_q <= 1'h0;
    end else begin
      lsu_c1_m_clken_q <= _T | io_clk_override;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_r_clken_q <= 1'h0;
    end else begin
      lsu_c1_r_clken_q <= _T_1 | io_clk_override;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_free_c1_clken_q <= 1'h0;
    end else begin
      lsu_free_c1_clken_q <= _T_20 | io_clk_override;
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
  wire  rvclkhdr_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_1_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_2_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_3_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_4_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_5_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_6_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_7_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_8_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_8_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_8_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_8_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_9_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_9_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_9_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_9_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_10_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_10_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_10_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_10_io_scan_mode; // @[lib.scala 368:23]
  wire  rvclkhdr_11_io_l1clk; // @[lib.scala 368:23]
  wire  rvclkhdr_11_io_clk; // @[lib.scala 368:23]
  wire  rvclkhdr_11_io_en; // @[lib.scala 368:23]
  wire  rvclkhdr_11_io_scan_mode; // @[lib.scala 368:23]
  wire [3:0] ldst_byteen_hi_m = io_ldst_byteen_ext_m[7:4]; // @[lsu_bus_buffer.scala 76:46]
  wire [3:0] ldst_byteen_lo_m = io_ldst_byteen_ext_m[3:0]; // @[lsu_bus_buffer.scala 77:46]
  reg [31:0] buf_addr_0; // @[lib.scala 374:16]
  wire  _T_2 = io_lsu_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 79:74]
  reg  _T_4344; // @[Reg.scala 27:20]
  reg  _T_4341; // @[Reg.scala 27:20]
  reg  _T_4338; // @[Reg.scala 27:20]
  reg  _T_4335; // @[Reg.scala 27:20]
  wire [3:0] buf_write = {_T_4344,_T_4341,_T_4338,_T_4335}; // @[Cat.scala 29:58]
  wire  _T_4 = _T_2 & buf_write[0]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_0; // @[Reg.scala 27:20]
  wire  _T_5 = buf_state_0 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_6 = _T_4 & _T_5; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_0 = _T_6 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_1; // @[lib.scala 374:16]
  wire  _T_9 = io_lsu_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_11 = _T_9 & buf_write[1]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_1; // @[Reg.scala 27:20]
  wire  _T_12 = buf_state_1 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_13 = _T_11 & _T_12; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_1 = _T_13 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_2; // @[lib.scala 374:16]
  wire  _T_16 = io_lsu_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_18 = _T_16 & buf_write[2]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_2; // @[Reg.scala 27:20]
  wire  _T_19 = buf_state_2 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_20 = _T_18 & _T_19; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_2 = _T_20 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  reg [31:0] buf_addr_3; // @[lib.scala 374:16]
  wire  _T_23 = io_lsu_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 79:74]
  wire  _T_25 = _T_23 & buf_write[3]; // @[lsu_bus_buffer.scala 79:98]
  reg [2:0] buf_state_3; // @[Reg.scala 27:20]
  wire  _T_26 = buf_state_3 != 3'h0; // @[lsu_bus_buffer.scala 79:129]
  wire  _T_27 = _T_25 & _T_26; // @[lsu_bus_buffer.scala 79:113]
  wire  ld_addr_hitvec_lo_3 = _T_27 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 79:141]
  wire  _T_30 = io_end_addr_m[31:2] == buf_addr_0[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_32 = _T_30 & buf_write[0]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_34 = _T_32 & _T_5; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_0 = _T_34 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_37 = io_end_addr_m[31:2] == buf_addr_1[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_39 = _T_37 & buf_write[1]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_41 = _T_39 & _T_12; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_1 = _T_41 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_44 = io_end_addr_m[31:2] == buf_addr_2[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_46 = _T_44 & buf_write[2]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_48 = _T_46 & _T_19; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_2 = _T_48 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  wire  _T_51 = io_end_addr_m[31:2] == buf_addr_3[31:2]; // @[lsu_bus_buffer.scala 80:74]
  wire  _T_53 = _T_51 & buf_write[3]; // @[lsu_bus_buffer.scala 80:98]
  wire  _T_55 = _T_53 & _T_26; // @[lsu_bus_buffer.scala 80:113]
  wire  ld_addr_hitvec_hi_3 = _T_55 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 80:141]
  reg [3:0] buf_byteen_3; // @[Reg.scala 27:20]
  wire  _T_99 = ld_addr_hitvec_lo_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_101 = _T_99 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_2; // @[Reg.scala 27:20]
  wire  _T_95 = ld_addr_hitvec_lo_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_97 = _T_95 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_1; // @[Reg.scala 27:20]
  wire  _T_91 = ld_addr_hitvec_lo_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_93 = _T_91 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  reg [3:0] buf_byteen_0; // @[Reg.scala 27:20]
  wire  _T_87 = ld_addr_hitvec_lo_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_89 = _T_87 & ldst_byteen_lo_m[0]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_0 = {_T_101,_T_97,_T_93,_T_89}; // @[Cat.scala 29:58]
  reg [3:0] buf_ageQ_3; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2583 = buf_state_3 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_4094 = 3'h0 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4117 = 3'h1 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4121 = 3'h2 == buf_state_3; // @[Conditional.scala 37:30]
  reg [1:0] _T_1780; // @[Reg.scala 27:20]
  wire [2:0] obuf_tag0 = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 354:13]
  wire  _T_4128 = obuf_tag0 == 3'h3; // @[lsu_bus_buffer.scala 459:48]
  reg  obuf_merge; // @[Reg.scala 27:20]
  reg [1:0] obuf_tag1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_362 = {{1'd0}, obuf_tag1}; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_4129 = _GEN_362 == 3'h3; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_4130 = obuf_merge & _T_4129; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_4131 = _T_4128 | _T_4130; // @[lsu_bus_buffer.scala 459:77]
  reg  obuf_valid; // @[lsu_bus_buffer.scala 348:54]
  wire  _T_4132 = _T_4131 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  reg  obuf_wr_enQ; // @[lsu_bus_buffer.scala 347:55]
  wire  _T_4133 = _T_4132 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_4155 = 3'h3 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4239 = 3'h4 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4257 = 3'h5 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _T_4265 = 3'h6 == buf_state_3; // @[Conditional.scala 37:30]
  wire  _GEN_284 = _T_4121 & _T_4133; // @[Conditional.scala 39:67]
  wire  _GEN_297 = _T_4117 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_297; // @[Conditional.scala 40:58]
  wire  _T_2584 = _T_2583 & buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2585 = ~_T_2584; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2586 = buf_ageQ_3[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2587 = ~io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 414:140]
  wire  _T_2588 = _T_2586 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2576 = buf_state_2 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3904 = 3'h0 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3927 = 3'h1 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3931 = 3'h2 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_3938 = obuf_tag0 == 3'h2; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3939 = _GEN_362 == 3'h2; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3940 = obuf_merge & _T_3939; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3941 = _T_3938 | _T_3940; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3942 = _T_3941 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3943 = _T_3942 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3965 = 3'h3 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4049 = 3'h4 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4067 = 3'h5 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _T_4075 = 3'h6 == buf_state_2; // @[Conditional.scala 37:30]
  wire  _GEN_207 = _T_3931 & _T_3943; // @[Conditional.scala 39:67]
  wire  _GEN_220 = _T_3927 ? 1'h0 : _GEN_207; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58]
  wire  _T_2577 = _T_2576 & buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2578 = ~_T_2577; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2579 = buf_ageQ_3[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2581 = _T_2579 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2569 = buf_state_1 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3714 = 3'h0 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3737 = 3'h1 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3741 = 3'h2 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3748 = obuf_tag0 == 3'h1; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3749 = _GEN_362 == 3'h1; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3750 = obuf_merge & _T_3749; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3751 = _T_3748 | _T_3750; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3752 = _T_3751 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3753 = _T_3752 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3775 = 3'h3 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3859 = 3'h4 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3877 = 3'h5 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _T_3885 = 3'h6 == buf_state_1; // @[Conditional.scala 37:30]
  wire  _GEN_130 = _T_3741 & _T_3753; // @[Conditional.scala 39:67]
  wire  _GEN_143 = _T_3737 ? 1'h0 : _GEN_130; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_143; // @[Conditional.scala 40:58]
  wire  _T_2570 = _T_2569 & buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2571 = ~_T_2570; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2572 = buf_ageQ_3[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2574 = _T_2572 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2562 = buf_state_0 == 3'h2; // @[lsu_bus_buffer.scala 414:93]
  wire  _T_3524 = 3'h0 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3547 = 3'h1 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3551 = 3'h2 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3558 = obuf_tag0 == 3'h0; // @[lsu_bus_buffer.scala 459:48]
  wire  _T_3559 = _GEN_362 == 3'h0; // @[lsu_bus_buffer.scala 459:104]
  wire  _T_3560 = obuf_merge & _T_3559; // @[lsu_bus_buffer.scala 459:91]
  wire  _T_3561 = _T_3558 | _T_3560; // @[lsu_bus_buffer.scala 459:77]
  wire  _T_3562 = _T_3561 & obuf_valid; // @[lsu_bus_buffer.scala 459:135]
  wire  _T_3563 = _T_3562 & obuf_wr_enQ; // @[lsu_bus_buffer.scala 459:148]
  wire  _T_3585 = 3'h3 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3669 = 3'h4 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3687 = 3'h5 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _T_3695 = 3'h6 == buf_state_0; // @[Conditional.scala 37:30]
  wire  _GEN_53 = _T_3551 & _T_3563; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_3547 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  buf_cmd_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _T_2563 = _T_2562 & buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 414:103]
  wire  _T_2564 = ~_T_2563; // @[lsu_bus_buffer.scala 414:78]
  wire  _T_2565 = buf_ageQ_3[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2567 = _T_2565 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_3 = {_T_2588,_T_2581,_T_2574,_T_2567}; // @[Cat.scala 29:58]
  wire  _T_2687 = ~buf_age_3[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2689 = _T_2687 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2681 = ~buf_age_3[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2683 = _T_2681 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2675 = ~buf_age_3[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2677 = _T_2675 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_3 = {1'h0,_T_2689,_T_2683,_T_2677}; // @[Cat.scala 29:58]
  wire [3:0] _T_255 = ld_byte_hitvec_lo_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_256 = |_T_255; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_257 = ~_T_256; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_258 = ld_byte_hitvec_lo_0[3] & _T_257; // @[lsu_bus_buffer.scala 149:97]
  reg [31:0] ibuf_addr; // @[lib.scala 374:16]
  wire  _T_512 = io_lsu_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 155:51]
  reg  ibuf_write; // @[Reg.scala 27:20]
  wire  _T_513 = _T_512 & ibuf_write; // @[lsu_bus_buffer.scala 155:73]
  reg  ibuf_valid; // @[lsu_bus_buffer.scala 243:54]
  wire  _T_514 = _T_513 & ibuf_valid; // @[lsu_bus_buffer.scala 155:86]
  wire  ld_addr_ibuf_hit_lo = _T_514 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 155:99]
  wire [3:0] _T_521 = ld_addr_ibuf_hit_lo ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  reg [3:0] ibuf_byteen; // @[Reg.scala 27:20]
  wire [3:0] _T_522 = _T_521 & ibuf_byteen; // @[lsu_bus_buffer.scala 160:55]
  wire [3:0] ld_byte_ibuf_hit_lo = _T_522 & ldst_byteen_lo_m; // @[lsu_bus_buffer.scala 160:69]
  wire  _T_260 = ~ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_261 = _T_258 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_2; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2555 = buf_ageQ_2[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2557 = _T_2555 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2548 = buf_ageQ_2[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2550 = _T_2548 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2541 = buf_ageQ_2[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2543 = _T_2541 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2534 = buf_ageQ_2[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2536 = _T_2534 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_2 = {_T_2557,_T_2550,_T_2543,_T_2536}; // @[Cat.scala 29:58]
  wire  _T_2666 = ~buf_age_2[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2668 = _T_2666 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2654 = ~buf_age_2[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2656 = _T_2654 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2648 = ~buf_age_2[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2650 = _T_2648 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_2 = {_T_2668,1'h0,_T_2656,_T_2650}; // @[Cat.scala 29:58]
  wire [3:0] _T_247 = ld_byte_hitvec_lo_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_248 = |_T_247; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_249 = ~_T_248; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_250 = ld_byte_hitvec_lo_0[2] & _T_249; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_253 = _T_250 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_1; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2524 = buf_ageQ_1[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2526 = _T_2524 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2517 = buf_ageQ_1[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2519 = _T_2517 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2510 = buf_ageQ_1[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2512 = _T_2510 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2503 = buf_ageQ_1[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2505 = _T_2503 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_1 = {_T_2526,_T_2519,_T_2512,_T_2505}; // @[Cat.scala 29:58]
  wire  _T_2639 = ~buf_age_1[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2641 = _T_2639 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2633 = ~buf_age_1[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2635 = _T_2633 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2621 = ~buf_age_1[0]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2623 = _T_2621 & _T_5; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_1 = {_T_2641,_T_2635,1'h0,_T_2623}; // @[Cat.scala 29:58]
  wire [3:0] _T_239 = ld_byte_hitvec_lo_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_240 = |_T_239; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_241 = ~_T_240; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_242 = ld_byte_hitvec_lo_0[1] & _T_241; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_245 = _T_242 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  reg [3:0] buf_ageQ_0; // @[lsu_bus_buffer.scala 508:60]
  wire  _T_2493 = buf_ageQ_0[3] & _T_2585; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2495 = _T_2493 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2486 = buf_ageQ_0[2] & _T_2578; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2488 = _T_2486 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2479 = buf_ageQ_0[1] & _T_2571; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2481 = _T_2479 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire  _T_2472 = buf_ageQ_0[0] & _T_2564; // @[lsu_bus_buffer.scala 414:76]
  wire  _T_2474 = _T_2472 & _T_2587; // @[lsu_bus_buffer.scala 414:138]
  wire [3:0] buf_age_0 = {_T_2495,_T_2488,_T_2481,_T_2474}; // @[Cat.scala 29:58]
  wire  _T_2612 = ~buf_age_0[3]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2614 = _T_2612 & _T_26; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2606 = ~buf_age_0[2]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2608 = _T_2606 & _T_19; // @[lsu_bus_buffer.scala 415:104]
  wire  _T_2600 = ~buf_age_0[1]; // @[lsu_bus_buffer.scala 415:89]
  wire  _T_2602 = _T_2600 & _T_12; // @[lsu_bus_buffer.scala 415:104]
  wire [3:0] buf_age_younger_0 = {_T_2614,_T_2608,_T_2602,1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_231 = ld_byte_hitvec_lo_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_232 = |_T_231; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_233 = ~_T_232; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_234 = ld_byte_hitvec_lo_0[0] & _T_233; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_237 = _T_234 & _T_260; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_0 = {_T_261,_T_253,_T_245,_T_237}; // @[Cat.scala 29:58]
  wire  _T_56 = |ld_byte_hitvecfn_lo_0; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_58 = _T_56 | ld_byte_ibuf_hit_lo[0]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_117 = ld_addr_hitvec_lo_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_119 = _T_117 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_113 = ld_addr_hitvec_lo_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_115 = _T_113 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_109 = ld_addr_hitvec_lo_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_111 = _T_109 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_105 = ld_addr_hitvec_lo_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_107 = _T_105 & ldst_byteen_lo_m[1]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_1 = {_T_119,_T_115,_T_111,_T_107}; // @[Cat.scala 29:58]
  wire [3:0] _T_290 = ld_byte_hitvec_lo_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_291 = |_T_290; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_292 = ~_T_291; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_293 = ld_byte_hitvec_lo_1[3] & _T_292; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_295 = ~ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_296 = _T_293 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_282 = ld_byte_hitvec_lo_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_283 = |_T_282; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_284 = ~_T_283; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_285 = ld_byte_hitvec_lo_1[2] & _T_284; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_288 = _T_285 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_274 = ld_byte_hitvec_lo_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_275 = |_T_274; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_276 = ~_T_275; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_277 = ld_byte_hitvec_lo_1[1] & _T_276; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_280 = _T_277 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_266 = ld_byte_hitvec_lo_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_267 = |_T_266; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_268 = ~_T_267; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_269 = ld_byte_hitvec_lo_1[0] & _T_268; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_272 = _T_269 & _T_295; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_1 = {_T_296,_T_288,_T_280,_T_272}; // @[Cat.scala 29:58]
  wire  _T_59 = |ld_byte_hitvecfn_lo_1; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_61 = _T_59 | ld_byte_ibuf_hit_lo[1]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_135 = ld_addr_hitvec_lo_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_137 = _T_135 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_131 = ld_addr_hitvec_lo_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_133 = _T_131 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_127 = ld_addr_hitvec_lo_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_129 = _T_127 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_123 = ld_addr_hitvec_lo_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_125 = _T_123 & ldst_byteen_lo_m[2]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_2 = {_T_137,_T_133,_T_129,_T_125}; // @[Cat.scala 29:58]
  wire [3:0] _T_325 = ld_byte_hitvec_lo_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_326 = |_T_325; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_327 = ~_T_326; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_328 = ld_byte_hitvec_lo_2[3] & _T_327; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_330 = ~ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_331 = _T_328 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_317 = ld_byte_hitvec_lo_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_318 = |_T_317; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_319 = ~_T_318; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_320 = ld_byte_hitvec_lo_2[2] & _T_319; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_323 = _T_320 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_309 = ld_byte_hitvec_lo_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_310 = |_T_309; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_311 = ~_T_310; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_312 = ld_byte_hitvec_lo_2[1] & _T_311; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_315 = _T_312 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_301 = ld_byte_hitvec_lo_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_302 = |_T_301; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_303 = ~_T_302; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_304 = ld_byte_hitvec_lo_2[0] & _T_303; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_307 = _T_304 & _T_330; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_2 = {_T_331,_T_323,_T_315,_T_307}; // @[Cat.scala 29:58]
  wire  _T_62 = |ld_byte_hitvecfn_lo_2; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_64 = _T_62 | ld_byte_ibuf_hit_lo[2]; // @[lsu_bus_buffer.scala 141:77]
  wire  _T_153 = ld_addr_hitvec_lo_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_155 = _T_153 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_149 = ld_addr_hitvec_lo_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_151 = _T_149 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_145 = ld_addr_hitvec_lo_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_147 = _T_145 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire  _T_141 = ld_addr_hitvec_lo_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 144:95]
  wire  _T_143 = _T_141 & ldst_byteen_lo_m[3]; // @[lsu_bus_buffer.scala 144:114]
  wire [3:0] ld_byte_hitvec_lo_3 = {_T_155,_T_151,_T_147,_T_143}; // @[Cat.scala 29:58]
  wire [3:0] _T_360 = ld_byte_hitvec_lo_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_361 = |_T_360; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_362 = ~_T_361; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_363 = ld_byte_hitvec_lo_3[3] & _T_362; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_365 = ~ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 149:150]
  wire  _T_366 = _T_363 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_352 = ld_byte_hitvec_lo_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_353 = |_T_352; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_354 = ~_T_353; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_355 = ld_byte_hitvec_lo_3[2] & _T_354; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_358 = _T_355 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_344 = ld_byte_hitvec_lo_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_345 = |_T_344; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_346 = ~_T_345; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_347 = ld_byte_hitvec_lo_3[1] & _T_346; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_350 = _T_347 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] _T_336 = ld_byte_hitvec_lo_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 149:122]
  wire  _T_337 = |_T_336; // @[lsu_bus_buffer.scala 149:144]
  wire  _T_338 = ~_T_337; // @[lsu_bus_buffer.scala 149:99]
  wire  _T_339 = ld_byte_hitvec_lo_3[0] & _T_338; // @[lsu_bus_buffer.scala 149:97]
  wire  _T_342 = _T_339 & _T_365; // @[lsu_bus_buffer.scala 149:148]
  wire [3:0] ld_byte_hitvecfn_lo_3 = {_T_366,_T_358,_T_350,_T_342}; // @[Cat.scala 29:58]
  wire  _T_65 = |ld_byte_hitvecfn_lo_3; // @[lsu_bus_buffer.scala 141:73]
  wire  _T_67 = _T_65 | ld_byte_ibuf_hit_lo[3]; // @[lsu_bus_buffer.scala 141:77]
  wire [2:0] _T_69 = {_T_67,_T_64,_T_61}; // @[Cat.scala 29:58]
  wire  _T_171 = ld_addr_hitvec_hi_3 & buf_byteen_3[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_173 = _T_171 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_167 = ld_addr_hitvec_hi_2 & buf_byteen_2[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_169 = _T_167 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_163 = ld_addr_hitvec_hi_1 & buf_byteen_1[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_165 = _T_163 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_159 = ld_addr_hitvec_hi_0 & buf_byteen_0[0]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_161 = _T_159 & ldst_byteen_hi_m[0]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_0 = {_T_173,_T_169,_T_165,_T_161}; // @[Cat.scala 29:58]
  wire [3:0] _T_395 = ld_byte_hitvec_hi_0 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_396 = |_T_395; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_397 = ~_T_396; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_398 = ld_byte_hitvec_hi_0[3] & _T_397; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_517 = io_end_addr_m[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 156:51]
  wire  _T_518 = _T_517 & ibuf_write; // @[lsu_bus_buffer.scala 156:73]
  wire  _T_519 = _T_518 & ibuf_valid; // @[lsu_bus_buffer.scala 156:86]
  wire  ld_addr_ibuf_hit_hi = _T_519 & io_lsu_busreq_m; // @[lsu_bus_buffer.scala 156:99]
  wire [3:0] _T_525 = ld_addr_ibuf_hit_hi ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_526 = _T_525 & ibuf_byteen; // @[lsu_bus_buffer.scala 161:55]
  wire [3:0] ld_byte_ibuf_hit_hi = _T_526 & ldst_byteen_hi_m; // @[lsu_bus_buffer.scala 161:69]
  wire  _T_400 = ~ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_401 = _T_398 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_387 = ld_byte_hitvec_hi_0 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_388 = |_T_387; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_389 = ~_T_388; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_390 = ld_byte_hitvec_hi_0[2] & _T_389; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_393 = _T_390 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_379 = ld_byte_hitvec_hi_0 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_380 = |_T_379; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_381 = ~_T_380; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_382 = ld_byte_hitvec_hi_0[1] & _T_381; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_385 = _T_382 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_371 = ld_byte_hitvec_hi_0 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_372 = |_T_371; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_373 = ~_T_372; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_374 = ld_byte_hitvec_hi_0[0] & _T_373; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_377 = _T_374 & _T_400; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_0 = {_T_401,_T_393,_T_385,_T_377}; // @[Cat.scala 29:58]
  wire  _T_71 = |ld_byte_hitvecfn_hi_0; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_73 = _T_71 | ld_byte_ibuf_hit_hi[0]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_189 = ld_addr_hitvec_hi_3 & buf_byteen_3[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_191 = _T_189 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_185 = ld_addr_hitvec_hi_2 & buf_byteen_2[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_187 = _T_185 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_181 = ld_addr_hitvec_hi_1 & buf_byteen_1[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_183 = _T_181 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_177 = ld_addr_hitvec_hi_0 & buf_byteen_0[1]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_179 = _T_177 & ldst_byteen_hi_m[1]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_1 = {_T_191,_T_187,_T_183,_T_179}; // @[Cat.scala 29:58]
  wire [3:0] _T_430 = ld_byte_hitvec_hi_1 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_431 = |_T_430; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_432 = ~_T_431; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_433 = ld_byte_hitvec_hi_1[3] & _T_432; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_435 = ~ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_436 = _T_433 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_422 = ld_byte_hitvec_hi_1 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_423 = |_T_422; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_424 = ~_T_423; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_425 = ld_byte_hitvec_hi_1[2] & _T_424; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_428 = _T_425 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_414 = ld_byte_hitvec_hi_1 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_415 = |_T_414; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_416 = ~_T_415; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_417 = ld_byte_hitvec_hi_1[1] & _T_416; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_420 = _T_417 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_406 = ld_byte_hitvec_hi_1 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_407 = |_T_406; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_408 = ~_T_407; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_409 = ld_byte_hitvec_hi_1[0] & _T_408; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_412 = _T_409 & _T_435; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_1 = {_T_436,_T_428,_T_420,_T_412}; // @[Cat.scala 29:58]
  wire  _T_74 = |ld_byte_hitvecfn_hi_1; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_76 = _T_74 | ld_byte_ibuf_hit_hi[1]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_207 = ld_addr_hitvec_hi_3 & buf_byteen_3[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_209 = _T_207 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_203 = ld_addr_hitvec_hi_2 & buf_byteen_2[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_205 = _T_203 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_199 = ld_addr_hitvec_hi_1 & buf_byteen_1[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_201 = _T_199 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_195 = ld_addr_hitvec_hi_0 & buf_byteen_0[2]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_197 = _T_195 & ldst_byteen_hi_m[2]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_2 = {_T_209,_T_205,_T_201,_T_197}; // @[Cat.scala 29:58]
  wire [3:0] _T_465 = ld_byte_hitvec_hi_2 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_466 = |_T_465; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_467 = ~_T_466; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_468 = ld_byte_hitvec_hi_2[3] & _T_467; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_470 = ~ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_471 = _T_468 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_457 = ld_byte_hitvec_hi_2 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_458 = |_T_457; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_459 = ~_T_458; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_460 = ld_byte_hitvec_hi_2[2] & _T_459; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_463 = _T_460 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_449 = ld_byte_hitvec_hi_2 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_450 = |_T_449; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_451 = ~_T_450; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_452 = ld_byte_hitvec_hi_2[1] & _T_451; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_455 = _T_452 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_441 = ld_byte_hitvec_hi_2 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_442 = |_T_441; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_443 = ~_T_442; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_444 = ld_byte_hitvec_hi_2[0] & _T_443; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_447 = _T_444 & _T_470; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_2 = {_T_471,_T_463,_T_455,_T_447}; // @[Cat.scala 29:58]
  wire  _T_77 = |ld_byte_hitvecfn_hi_2; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_79 = _T_77 | ld_byte_ibuf_hit_hi[2]; // @[lsu_bus_buffer.scala 142:77]
  wire  _T_225 = ld_addr_hitvec_hi_3 & buf_byteen_3[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_227 = _T_225 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_221 = ld_addr_hitvec_hi_2 & buf_byteen_2[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_223 = _T_221 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_217 = ld_addr_hitvec_hi_1 & buf_byteen_1[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_219 = _T_217 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire  _T_213 = ld_addr_hitvec_hi_0 & buf_byteen_0[3]; // @[lsu_bus_buffer.scala 145:95]
  wire  _T_215 = _T_213 & ldst_byteen_hi_m[3]; // @[lsu_bus_buffer.scala 145:114]
  wire [3:0] ld_byte_hitvec_hi_3 = {_T_227,_T_223,_T_219,_T_215}; // @[Cat.scala 29:58]
  wire [3:0] _T_500 = ld_byte_hitvec_hi_3 & buf_age_younger_3; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_501 = |_T_500; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_502 = ~_T_501; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_503 = ld_byte_hitvec_hi_3[3] & _T_502; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_505 = ~ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 150:150]
  wire  _T_506 = _T_503 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_492 = ld_byte_hitvec_hi_3 & buf_age_younger_2; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_493 = |_T_492; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_494 = ~_T_493; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_495 = ld_byte_hitvec_hi_3[2] & _T_494; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_498 = _T_495 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_484 = ld_byte_hitvec_hi_3 & buf_age_younger_1; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_485 = |_T_484; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_486 = ~_T_485; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_487 = ld_byte_hitvec_hi_3[1] & _T_486; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_490 = _T_487 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] _T_476 = ld_byte_hitvec_hi_3 & buf_age_younger_0; // @[lsu_bus_buffer.scala 150:122]
  wire  _T_477 = |_T_476; // @[lsu_bus_buffer.scala 150:144]
  wire  _T_478 = ~_T_477; // @[lsu_bus_buffer.scala 150:99]
  wire  _T_479 = ld_byte_hitvec_hi_3[0] & _T_478; // @[lsu_bus_buffer.scala 150:97]
  wire  _T_482 = _T_479 & _T_505; // @[lsu_bus_buffer.scala 150:148]
  wire [3:0] ld_byte_hitvecfn_hi_3 = {_T_506,_T_498,_T_490,_T_482}; // @[Cat.scala 29:58]
  wire  _T_80 = |ld_byte_hitvecfn_hi_3; // @[lsu_bus_buffer.scala 142:73]
  wire  _T_82 = _T_80 | ld_byte_ibuf_hit_hi[3]; // @[lsu_bus_buffer.scala 142:77]
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
  reg [31:0] buf_data_0; // @[lib.scala 374:16]
  wire [7:0] _T_560 = _T_558 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_563 = ld_byte_hitvecfn_lo_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_1; // @[lib.scala 374:16]
  wire [7:0] _T_565 = _T_563 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_568 = ld_byte_hitvecfn_lo_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_2; // @[lib.scala 374:16]
  wire [7:0] _T_570 = _T_568 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_573 = ld_byte_hitvecfn_lo_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  reg [31:0] buf_data_3; // @[lib.scala 374:16]
  wire [7:0] _T_575 = _T_573 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 168:91]
  wire [7:0] _T_576 = _T_560 | _T_565; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_577 = _T_576 | _T_570; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_578 = _T_577 | _T_575; // @[lsu_bus_buffer.scala 168:123]
  wire [7:0] _T_581 = ld_byte_hitvecfn_lo_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_583 = _T_581 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_586 = ld_byte_hitvecfn_lo_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_588 = _T_586 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_591 = ld_byte_hitvecfn_lo_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_593 = _T_591 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_596 = ld_byte_hitvecfn_lo_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_598 = _T_596 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 169:65]
  wire [7:0] _T_599 = _T_583 | _T_588; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_600 = _T_599 | _T_593; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_601 = _T_600 | _T_598; // @[lsu_bus_buffer.scala 169:97]
  wire [7:0] _T_604 = ld_byte_hitvecfn_lo_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_606 = _T_604 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_609 = ld_byte_hitvecfn_lo_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_611 = _T_609 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_614 = ld_byte_hitvecfn_lo_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_616 = _T_614 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_619 = ld_byte_hitvecfn_lo_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_621 = _T_619 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 170:65]
  wire [7:0] _T_622 = _T_606 | _T_611; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_623 = _T_622 | _T_616; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_624 = _T_623 | _T_621; // @[lsu_bus_buffer.scala 170:97]
  wire [7:0] _T_627 = ld_byte_hitvecfn_lo_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_629 = _T_627 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_632 = ld_byte_hitvecfn_lo_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_634 = _T_632 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_637 = ld_byte_hitvecfn_lo_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_639 = _T_637 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_642 = ld_byte_hitvecfn_lo_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_644 = _T_642 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 171:65]
  wire [7:0] _T_645 = _T_629 | _T_634; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_646 = _T_645 | _T_639; // @[lsu_bus_buffer.scala 171:97]
  wire [7:0] _T_647 = _T_646 | _T_644; // @[lsu_bus_buffer.scala 171:97]
  wire [31:0] _T_650 = {_T_578,_T_601,_T_624,_T_647}; // @[Cat.scala 29:58]
  reg [31:0] ibuf_data; // @[lib.scala 374:16]
  wire [31:0] _T_651 = ld_fwddata_buf_lo_initial & ibuf_data; // @[lsu_bus_buffer.scala 172:32]
  wire [7:0] _T_655 = ld_byte_hitvecfn_hi_3[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_657 = _T_655 & buf_data_0[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_660 = ld_byte_hitvecfn_hi_3[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_662 = _T_660 & buf_data_1[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_665 = ld_byte_hitvecfn_hi_3[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_667 = _T_665 & buf_data_2[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_670 = ld_byte_hitvecfn_hi_3[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_672 = _T_670 & buf_data_3[31:24]; // @[lsu_bus_buffer.scala 174:91]
  wire [7:0] _T_673 = _T_657 | _T_662; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_674 = _T_673 | _T_667; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_675 = _T_674 | _T_672; // @[lsu_bus_buffer.scala 174:123]
  wire [7:0] _T_678 = ld_byte_hitvecfn_hi_2[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_680 = _T_678 & buf_data_0[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_683 = ld_byte_hitvecfn_hi_2[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_685 = _T_683 & buf_data_1[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_688 = ld_byte_hitvecfn_hi_2[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_690 = _T_688 & buf_data_2[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_693 = ld_byte_hitvecfn_hi_2[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_695 = _T_693 & buf_data_3[23:16]; // @[lsu_bus_buffer.scala 175:65]
  wire [7:0] _T_696 = _T_680 | _T_685; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_697 = _T_696 | _T_690; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_698 = _T_697 | _T_695; // @[lsu_bus_buffer.scala 175:97]
  wire [7:0] _T_701 = ld_byte_hitvecfn_hi_1[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_703 = _T_701 & buf_data_0[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_706 = ld_byte_hitvecfn_hi_1[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_708 = _T_706 & buf_data_1[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_711 = ld_byte_hitvecfn_hi_1[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_713 = _T_711 & buf_data_2[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_716 = ld_byte_hitvecfn_hi_1[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_718 = _T_716 & buf_data_3[15:8]; // @[lsu_bus_buffer.scala 176:65]
  wire [7:0] _T_719 = _T_703 | _T_708; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_720 = _T_719 | _T_713; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_721 = _T_720 | _T_718; // @[lsu_bus_buffer.scala 176:97]
  wire [7:0] _T_724 = ld_byte_hitvecfn_hi_0[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_726 = _T_724 & buf_data_0[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_729 = ld_byte_hitvecfn_hi_0[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_731 = _T_729 & buf_data_1[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_734 = ld_byte_hitvecfn_hi_0[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_736 = _T_734 & buf_data_2[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_739 = ld_byte_hitvecfn_hi_0[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_741 = _T_739 & buf_data_3[7:0]; // @[lsu_bus_buffer.scala 177:65]
  wire [7:0] _T_742 = _T_726 | _T_731; // @[lsu_bus_buffer.scala 177:97]
  wire [7:0] _T_743 = _T_742 | _T_736; // @[lsu_bus_buffer.scala 177:97]
  wire [7:0] _T_744 = _T_743 | _T_741; // @[lsu_bus_buffer.scala 177:97]
  wire [31:0] _T_747 = {_T_675,_T_698,_T_721,_T_744}; // @[Cat.scala 29:58]
  wire [31:0] _T_748 = ld_fwddata_buf_hi_initial & ibuf_data; // @[lsu_bus_buffer.scala 178:32]
  wire [3:0] _T_750 = io_lsu_pkt_r_bits_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_751 = io_lsu_pkt_r_bits_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_752 = io_lsu_pkt_r_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_753 = _T_750 | _T_751; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_r = _T_753 | _T_752; // @[Mux.scala 27:72]
  wire  _T_756 = io_lsu_addr_r[1:0] == 2'h0; // @[lsu_bus_buffer.scala 185:55]
  wire  _T_758 = io_lsu_addr_r[1:0] == 2'h1; // @[lsu_bus_buffer.scala 186:24]
  wire [3:0] _T_760 = {3'h0,ldst_byteen_r[3]}; // @[Cat.scala 29:58]
  wire  _T_762 = io_lsu_addr_r[1:0] == 2'h2; // @[lsu_bus_buffer.scala 187:24]
  wire [3:0] _T_764 = {2'h0,ldst_byteen_r[3:2]}; // @[Cat.scala 29:58]
  wire  _T_766 = io_lsu_addr_r[1:0] == 2'h3; // @[lsu_bus_buffer.scala 188:24]
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
  wire  ldst_samedw_r = io_lsu_addr_r[3] == io_end_addr_r[3]; // @[lsu_bus_buffer.scala 206:40]
  wire  _T_844 = ~io_lsu_addr_r[0]; // @[lsu_bus_buffer.scala 208:31]
  wire  _T_845 = io_lsu_pkt_r_bits_word & _T_756; // @[Mux.scala 27:72]
  wire  _T_846 = io_lsu_pkt_r_bits_half & _T_844; // @[Mux.scala 27:72]
  wire  _T_848 = _T_845 | _T_846; // @[Mux.scala 27:72]
  wire  is_aligned_r = _T_848 | io_lsu_pkt_r_bits_by; // @[Mux.scala 27:72]
  wire  _T_850 = io_lsu_pkt_r_bits_load | io_no_word_merge_r; // @[lsu_bus_buffer.scala 210:60]
  wire  _T_851 = io_lsu_busreq_r & _T_850; // @[lsu_bus_buffer.scala 210:34]
  wire  _T_852 = ~ibuf_valid; // @[lsu_bus_buffer.scala 210:84]
  wire  ibuf_byp = _T_851 & _T_852; // @[lsu_bus_buffer.scala 210:82]
  wire  _T_853 = io_lsu_busreq_r & io_lsu_commit_r; // @[lsu_bus_buffer.scala 211:36]
  wire  _T_854 = ~ibuf_byp; // @[lsu_bus_buffer.scala 211:56]
  wire  ibuf_wr_en = _T_853 & _T_854; // @[lsu_bus_buffer.scala 211:54]
  wire  _T_855 = ~ibuf_wr_en; // @[lsu_bus_buffer.scala 213:36]
  reg [2:0] ibuf_timer; // @[lsu_bus_buffer.scala 256:55]
  wire  _T_864 = ibuf_timer == 3'h7; // @[lsu_bus_buffer.scala 219:62]
  wire  _T_865 = ibuf_wr_en | _T_864; // @[lsu_bus_buffer.scala 219:48]
  wire  _T_929 = _T_853 & io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 238:54]
  wire  _T_930 = _T_929 & ibuf_valid; // @[lsu_bus_buffer.scala 238:80]
  wire  _T_931 = _T_930 & ibuf_write; // @[lsu_bus_buffer.scala 238:93]
  wire  _T_934 = io_lsu_addr_r[31:2] == ibuf_addr[31:2]; // @[lsu_bus_buffer.scala 238:129]
  wire  _T_935 = _T_931 & _T_934; // @[lsu_bus_buffer.scala 238:106]
  wire  _T_936 = ~io_is_sideeffects_r; // @[lsu_bus_buffer.scala 238:152]
  wire  _T_937 = _T_935 & _T_936; // @[lsu_bus_buffer.scala 238:150]
  wire  _T_938 = ~io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 238:175]
  wire  ibuf_merge_en = _T_937 & _T_938; // @[lsu_bus_buffer.scala 238:173]
  wire  ibuf_merge_in = ~io_ldst_dual_r; // @[lsu_bus_buffer.scala 239:20]
  wire  _T_866 = ibuf_merge_en & ibuf_merge_in; // @[lsu_bus_buffer.scala 219:98]
  wire  _T_867 = ~_T_866; // @[lsu_bus_buffer.scala 219:82]
  wire  _T_868 = _T_865 & _T_867; // @[lsu_bus_buffer.scala 219:80]
  wire  _T_869 = _T_868 | ibuf_byp; // @[lsu_bus_buffer.scala 220:5]
  wire  _T_857 = ~io_lsu_busreq_r; // @[lsu_bus_buffer.scala 214:44]
  wire  _T_858 = io_lsu_busreq_m & _T_857; // @[lsu_bus_buffer.scala 214:42]
  wire  _T_859 = _T_858 & ibuf_valid; // @[lsu_bus_buffer.scala 214:61]
  wire  _T_862 = ibuf_addr[31:2] != io_lsu_addr_m[31:2]; // @[lsu_bus_buffer.scala 214:120]
  wire  _T_863 = io_lsu_pkt_m_bits_load | _T_862; // @[lsu_bus_buffer.scala 214:100]
  wire  ibuf_force_drain = _T_859 & _T_863; // @[lsu_bus_buffer.scala 214:74]
  wire  _T_870 = _T_869 | ibuf_force_drain; // @[lsu_bus_buffer.scala 220:16]
  reg  ibuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_871 = _T_870 | ibuf_sideeffect; // @[lsu_bus_buffer.scala 220:35]
  wire  _T_872 = ~ibuf_write; // @[lsu_bus_buffer.scala 220:55]
  wire  _T_873 = _T_871 | _T_872; // @[lsu_bus_buffer.scala 220:53]
  wire  _T_874 = _T_873 | io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_buffer.scala 220:67]
  wire  ibuf_drain_vld = ibuf_valid & _T_874; // @[lsu_bus_buffer.scala 219:32]
  wire  _T_856 = ibuf_drain_vld & _T_855; // @[lsu_bus_buffer.scala 213:34]
  wire  ibuf_rst = _T_856 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 213:49]
  reg [1:0] WrPtr1_r; // @[lsu_bus_buffer.scala 623:49]
  reg [1:0] WrPtr0_r; // @[lsu_bus_buffer.scala 622:49]
  reg [1:0] ibuf_tag; // @[Reg.scala 27:20]
  wire [1:0] ibuf_sz_in = {io_lsu_pkt_r_bits_word,io_lsu_pkt_r_bits_half}; // @[Cat.scala 29:58]
  wire [3:0] _T_881 = ibuf_byteen | ldst_byteen_lo_r; // @[lsu_bus_buffer.scala 229:77]
  wire [7:0] _T_889 = ldst_byteen_lo_r[0] ? store_data_lo_r[7:0] : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_892 = io_ldst_dual_r ? store_data_hi_r[7:0] : store_data_lo_r[7:0]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_893 = _T_866 ? _T_889 : _T_892; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_898 = ldst_byteen_lo_r[1] ? store_data_lo_r[15:8] : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_901 = io_ldst_dual_r ? store_data_hi_r[15:8] : store_data_lo_r[15:8]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_902 = _T_866 ? _T_898 : _T_901; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_907 = ldst_byteen_lo_r[2] ? store_data_lo_r[23:16] : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_910 = io_ldst_dual_r ? store_data_hi_r[23:16] : store_data_lo_r[23:16]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_911 = _T_866 ? _T_907 : _T_910; // @[lsu_bus_buffer.scala 233:46]
  wire [7:0] _T_916 = ldst_byteen_lo_r[3] ? store_data_lo_r[31:24] : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 234:8]
  wire [7:0] _T_919 = io_ldst_dual_r ? store_data_hi_r[31:24] : store_data_lo_r[31:24]; // @[lsu_bus_buffer.scala 235:8]
  wire [7:0] _T_920 = _T_866 ? _T_916 : _T_919; // @[lsu_bus_buffer.scala 233:46]
  wire [23:0] _T_922 = {_T_920,_T_911,_T_902}; // @[Cat.scala 29:58]
  wire  _T_923 = ibuf_timer < 3'h7; // @[lsu_bus_buffer.scala 236:59]
  wire [2:0] _T_926 = ibuf_timer + 3'h1; // @[lsu_bus_buffer.scala 236:93]
  wire  _T_941 = ~ibuf_merge_in; // @[lsu_bus_buffer.scala 240:65]
  wire  _T_942 = ibuf_merge_en & _T_941; // @[lsu_bus_buffer.scala 240:63]
  wire  _T_945 = ibuf_byteen[0] | ldst_byteen_lo_r[0]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_947 = _T_942 ? _T_945 : ibuf_byteen[0]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_952 = ibuf_byteen[1] | ldst_byteen_lo_r[1]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_954 = _T_942 ? _T_952 : ibuf_byteen[1]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_959 = ibuf_byteen[2] | ldst_byteen_lo_r[2]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_961 = _T_942 ? _T_959 : ibuf_byteen[2]; // @[lsu_bus_buffer.scala 240:48]
  wire  _T_966 = ibuf_byteen[3] | ldst_byteen_lo_r[3]; // @[lsu_bus_buffer.scala 240:96]
  wire  _T_968 = _T_942 ? _T_966 : ibuf_byteen[3]; // @[lsu_bus_buffer.scala 240:48]
  wire [3:0] ibuf_byteen_out = {_T_968,_T_961,_T_954,_T_947}; // @[Cat.scala 29:58]
  wire [7:0] _T_978 = _T_942 ? _T_889 : ibuf_data[7:0]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_986 = _T_942 ? _T_898 : ibuf_data[15:8]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_994 = _T_942 ? _T_907 : ibuf_data[23:16]; // @[lsu_bus_buffer.scala 241:45]
  wire [7:0] _T_1002 = _T_942 ? _T_916 : ibuf_data[31:24]; // @[lsu_bus_buffer.scala 241:45]
  wire [31:0] ibuf_data_out = {_T_1002,_T_994,_T_986,_T_978}; // @[Cat.scala 29:58]
  wire  _T_1005 = ibuf_wr_en | ibuf_valid; // @[lsu_bus_buffer.scala 243:58]
  wire  _T_1006 = ~ibuf_rst; // @[lsu_bus_buffer.scala 243:93]
  reg [1:0] ibuf_dualtag; // @[Reg.scala 27:20]
  reg  ibuf_dual; // @[Reg.scala 27:20]
  reg  ibuf_samedw; // @[Reg.scala 27:20]
  reg  ibuf_nomerge; // @[Reg.scala 27:20]
  reg  ibuf_unsign; // @[Reg.scala 27:20]
  reg [1:0] ibuf_sz; // @[Reg.scala 27:20]
  wire  _T_4430 = buf_write[3] & _T_2583; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4431 = ~buf_cmd_state_bus_en_3; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4432 = _T_4430 & _T_4431; // @[lsu_bus_buffer.scala 529:89]
  wire  _T_4425 = buf_write[2] & _T_2576; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4426 = ~buf_cmd_state_bus_en_2; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4427 = _T_4425 & _T_4426; // @[lsu_bus_buffer.scala 529:89]
  wire [1:0] _T_4433 = _T_4432 + _T_4427; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_4420 = buf_write[1] & _T_2569; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4421 = ~buf_cmd_state_bus_en_1; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4422 = _T_4420 & _T_4421; // @[lsu_bus_buffer.scala 529:89]
  wire [1:0] _GEN_366 = {{1'd0}, _T_4422}; // @[lsu_bus_buffer.scala 529:142]
  wire [2:0] _T_4434 = _T_4433 + _GEN_366; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_4415 = buf_write[0] & _T_2562; // @[lsu_bus_buffer.scala 529:64]
  wire  _T_4416 = ~buf_cmd_state_bus_en_0; // @[lsu_bus_buffer.scala 529:91]
  wire  _T_4417 = _T_4415 & _T_4416; // @[lsu_bus_buffer.scala 529:89]
  wire [2:0] _GEN_367 = {{2'd0}, _T_4417}; // @[lsu_bus_buffer.scala 529:142]
  wire [3:0] buf_numvld_wrcmd_any = _T_4434 + _GEN_367; // @[lsu_bus_buffer.scala 529:142]
  wire  _T_1016 = buf_numvld_wrcmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:43]
  wire  _T_4447 = _T_2583 & _T_4431; // @[lsu_bus_buffer.scala 530:73]
  wire  _T_4444 = _T_2576 & _T_4426; // @[lsu_bus_buffer.scala 530:73]
  wire [1:0] _T_4448 = _T_4447 + _T_4444; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_4441 = _T_2569 & _T_4421; // @[lsu_bus_buffer.scala 530:73]
  wire [1:0] _GEN_368 = {{1'd0}, _T_4441}; // @[lsu_bus_buffer.scala 530:126]
  wire [2:0] _T_4449 = _T_4448 + _GEN_368; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_4438 = _T_2562 & _T_4416; // @[lsu_bus_buffer.scala 530:73]
  wire [2:0] _GEN_369 = {{2'd0}, _T_4438}; // @[lsu_bus_buffer.scala 530:126]
  wire [3:0] buf_numvld_cmd_any = _T_4449 + _GEN_369; // @[lsu_bus_buffer.scala 530:126]
  wire  _T_1017 = buf_numvld_cmd_any == 4'h1; // @[lsu_bus_buffer.scala 266:72]
  wire  _T_1018 = _T_1016 & _T_1017; // @[lsu_bus_buffer.scala 266:51]
  reg [2:0] obuf_wr_timer; // @[lsu_bus_buffer.scala 363:54]
  wire  _T_1019 = obuf_wr_timer != 3'h7; // @[lsu_bus_buffer.scala 266:97]
  wire  _T_1020 = _T_1018 & _T_1019; // @[lsu_bus_buffer.scala 266:80]
  wire  _T_1022 = _T_1020 & _T_938; // @[lsu_bus_buffer.scala 266:114]
  wire  _T_1911 = |buf_age_3; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1912 = ~_T_1911; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1914 = _T_1912 & _T_2583; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1916 = _T_1914 & _T_4431; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1905 = |buf_age_2; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1906 = ~_T_1905; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1908 = _T_1906 & _T_2576; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1910 = _T_1908 & _T_4426; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1899 = |buf_age_1; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1900 = ~_T_1899; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1902 = _T_1900 & _T_2569; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1904 = _T_1902 & _T_4421; // @[lsu_bus_buffer.scala 380:88]
  wire  _T_1893 = |buf_age_0; // @[lsu_bus_buffer.scala 380:58]
  wire  _T_1894 = ~_T_1893; // @[lsu_bus_buffer.scala 380:45]
  wire  _T_1896 = _T_1894 & _T_2562; // @[lsu_bus_buffer.scala 380:63]
  wire  _T_1898 = _T_1896 & _T_4416; // @[lsu_bus_buffer.scala 380:88]
  wire [3:0] CmdPtr0Dec = {_T_1916,_T_1910,_T_1904,_T_1898}; // @[Cat.scala 29:58]
  wire [7:0] _T_1986 = {4'h0,_T_1916,_T_1910,_T_1904,_T_1898}; // @[Cat.scala 29:58]
  wire  _T_1989 = _T_1986[4] | _T_1986[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_1991 = _T_1989 | _T_1986[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_1993 = _T_1991 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_1996 = _T_1986[2] | _T_1986[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_1998 = _T_1996 | _T_1986[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2000 = _T_1998 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2003 = _T_1986[1] | _T_1986[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2005 = _T_2003 | _T_1986[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2007 = _T_2005 | _T_1986[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2009 = {_T_1993,_T_2000,_T_2007}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr0 = _T_2009[1:0]; // @[lsu_bus_buffer.scala 393:11]
  wire  _T_1023 = CmdPtr0 == 2'h0; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1024 = CmdPtr0 == 2'h1; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1025 = CmdPtr0 == 2'h2; // @[lsu_bus_buffer.scala 267:114]
  wire  _T_1026 = CmdPtr0 == 2'h3; // @[lsu_bus_buffer.scala 267:114]
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
  wire  _T_1035 = ~_T_1033; // @[lsu_bus_buffer.scala 267:31]
  wire  _T_1036 = _T_1022 & _T_1035; // @[lsu_bus_buffer.scala 267:29]
  reg  _T_4314; // @[Reg.scala 27:20]
  reg  _T_4311; // @[Reg.scala 27:20]
  reg  _T_4308; // @[Reg.scala 27:20]
  reg  _T_4305; // @[Reg.scala 27:20]
  wire [3:0] buf_sideeffect = {_T_4314,_T_4311,_T_4308,_T_4305}; // @[Cat.scala 29:58]
  wire  _T_1045 = _T_1023 & buf_sideeffect[0]; // @[Mux.scala 27:72]
  wire  _T_1046 = _T_1024 & buf_sideeffect[1]; // @[Mux.scala 27:72]
  wire  _T_1047 = _T_1025 & buf_sideeffect[2]; // @[Mux.scala 27:72]
  wire  _T_1048 = _T_1026 & buf_sideeffect[3]; // @[Mux.scala 27:72]
  wire  _T_1049 = _T_1045 | _T_1046; // @[Mux.scala 27:72]
  wire  _T_1050 = _T_1049 | _T_1047; // @[Mux.scala 27:72]
  wire  _T_1051 = _T_1050 | _T_1048; // @[Mux.scala 27:72]
  wire  _T_1053 = ~_T_1051; // @[lsu_bus_buffer.scala 268:5]
  wire  _T_1054 = _T_1036 & _T_1053; // @[lsu_bus_buffer.scala 267:140]
  wire  _T_1065 = _T_858 & _T_852; // @[lsu_bus_buffer.scala 270:58]
  wire  _T_1067 = _T_1065 & _T_1017; // @[lsu_bus_buffer.scala 270:72]
  wire [29:0] _T_1077 = _T_1023 ? buf_addr_0[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1078 = _T_1024 ? buf_addr_1[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1081 = _T_1077 | _T_1078; // @[Mux.scala 27:72]
  wire [29:0] _T_1079 = _T_1025 ? buf_addr_2[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1082 = _T_1081 | _T_1079; // @[Mux.scala 27:72]
  wire [29:0] _T_1080 = _T_1026 ? buf_addr_3[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_1083 = _T_1082 | _T_1080; // @[Mux.scala 27:72]
  wire  _T_1085 = io_lsu_addr_m[31:2] != _T_1083; // @[lsu_bus_buffer.scala 270:123]
  wire  obuf_force_wr_en = _T_1067 & _T_1085; // @[lsu_bus_buffer.scala 270:101]
  wire  _T_1055 = ~obuf_force_wr_en; // @[lsu_bus_buffer.scala 268:119]
  wire  obuf_wr_wait = _T_1054 & _T_1055; // @[lsu_bus_buffer.scala 268:117]
  wire  _T_1056 = |buf_numvld_cmd_any; // @[lsu_bus_buffer.scala 269:75]
  wire  _T_1057 = obuf_wr_timer < 3'h7; // @[lsu_bus_buffer.scala 269:95]
  wire  _T_1058 = _T_1056 & _T_1057; // @[lsu_bus_buffer.scala 269:79]
  wire [2:0] _T_1060 = obuf_wr_timer + 3'h1; // @[lsu_bus_buffer.scala 269:123]
  wire  _T_4466 = buf_state_3 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4470 = _T_4466 | _T_4447; // @[lsu_bus_buffer.scala 531:74]
  wire  _T_4461 = buf_state_2 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4465 = _T_4461 | _T_4444; // @[lsu_bus_buffer.scala 531:74]
  wire [1:0] _T_4471 = _T_4470 + _T_4465; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_4456 = buf_state_1 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4460 = _T_4456 | _T_4441; // @[lsu_bus_buffer.scala 531:74]
  wire [1:0] _GEN_370 = {{1'd0}, _T_4460}; // @[lsu_bus_buffer.scala 531:154]
  wire [2:0] _T_4472 = _T_4471 + _GEN_370; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_4451 = buf_state_0 == 3'h1; // @[lsu_bus_buffer.scala 531:63]
  wire  _T_4455 = _T_4451 | _T_4438; // @[lsu_bus_buffer.scala 531:74]
  wire [2:0] _GEN_371 = {{2'd0}, _T_4455}; // @[lsu_bus_buffer.scala 531:154]
  wire [3:0] buf_numvld_pend_any = _T_4472 + _GEN_371; // @[lsu_bus_buffer.scala 531:154]
  wire  _T_1087 = buf_numvld_pend_any == 4'h0; // @[lsu_bus_buffer.scala 272:53]
  wire  _T_1088 = ibuf_byp & _T_1087; // @[lsu_bus_buffer.scala 272:31]
  wire  _T_1089 = ~io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 272:64]
  wire  _T_1090 = _T_1089 | io_no_dword_merge_r; // @[lsu_bus_buffer.scala 272:89]
  wire  ibuf_buf_byp = _T_1088 & _T_1090; // @[lsu_bus_buffer.scala 272:61]
  wire  _T_1091 = ibuf_buf_byp & io_lsu_commit_r; // @[lsu_bus_buffer.scala 287:32]
  wire  _T_4740 = buf_state_0 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4742 = _T_4740 & buf_sideeffect[0]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4743 = _T_4742 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4744 = buf_state_1 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4746 = _T_4744 & buf_sideeffect[1]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4747 = _T_4746 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4756 = _T_4743 | _T_4747; // @[lsu_bus_buffer.scala 559:153]
  wire  _T_4748 = buf_state_2 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4750 = _T_4748 & buf_sideeffect[2]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4751 = _T_4750 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4757 = _T_4756 | _T_4751; // @[lsu_bus_buffer.scala 559:153]
  wire  _T_4752 = buf_state_3 == 3'h3; // @[lsu_bus_buffer.scala 559:62]
  wire  _T_4754 = _T_4752 & buf_sideeffect[3]; // @[lsu_bus_buffer.scala 559:73]
  wire  _T_4755 = _T_4754 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:93]
  wire  _T_4758 = _T_4757 | _T_4755; // @[lsu_bus_buffer.scala 559:153]
  reg  obuf_sideeffect; // @[Reg.scala 27:20]
  wire  _T_4759 = obuf_valid & obuf_sideeffect; // @[lsu_bus_buffer.scala 559:171]
  wire  _T_4760 = _T_4759 & io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_buffer.scala 559:189]
  wire  bus_sideeffect_pend = _T_4758 | _T_4760; // @[lsu_bus_buffer.scala 559:157]
  wire  _T_1092 = io_is_sideeffects_r & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 287:74]
  wire  _T_1093 = ~_T_1092; // @[lsu_bus_buffer.scala 287:52]
  wire  _T_1094 = _T_1091 & _T_1093; // @[lsu_bus_buffer.scala 287:50]
  wire [2:0] _T_1099 = _T_1023 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1100 = _T_1024 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1103 = _T_1099 | _T_1100; // @[Mux.scala 27:72]
  wire [2:0] _T_1101 = _T_1025 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1104 = _T_1103 | _T_1101; // @[Mux.scala 27:72]
  wire [2:0] _T_1102 = _T_1026 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1105 = _T_1104 | _T_1102; // @[Mux.scala 27:72]
  wire  _T_1107 = _T_1105 == 3'h2; // @[lsu_bus_buffer.scala 288:36]
  wire  found_cmdptr0 = |CmdPtr0Dec; // @[lsu_bus_buffer.scala 385:31]
  wire  _T_1108 = _T_1107 & found_cmdptr0; // @[lsu_bus_buffer.scala 288:47]
  wire [3:0] _T_1111 = {buf_cmd_state_bus_en_3,buf_cmd_state_bus_en_2,buf_cmd_state_bus_en_1,buf_cmd_state_bus_en_0}; // @[Cat.scala 29:58]
  wire  _T_1120 = _T_1023 & _T_1111[0]; // @[Mux.scala 27:72]
  wire  _T_1121 = _T_1024 & _T_1111[1]; // @[Mux.scala 27:72]
  wire  _T_1124 = _T_1120 | _T_1121; // @[Mux.scala 27:72]
  wire  _T_1122 = _T_1025 & _T_1111[2]; // @[Mux.scala 27:72]
  wire  _T_1125 = _T_1124 | _T_1122; // @[Mux.scala 27:72]
  wire  _T_1123 = _T_1026 & _T_1111[3]; // @[Mux.scala 27:72]
  wire  _T_1126 = _T_1125 | _T_1123; // @[Mux.scala 27:72]
  wire  _T_1128 = ~_T_1126; // @[lsu_bus_buffer.scala 289:23]
  wire  _T_1129 = _T_1108 & _T_1128; // @[lsu_bus_buffer.scala 289:21]
  wire  _T_1146 = _T_1051 & bus_sideeffect_pend; // @[lsu_bus_buffer.scala 289:141]
  wire  _T_1147 = ~_T_1146; // @[lsu_bus_buffer.scala 289:105]
  wire  _T_1148 = _T_1129 & _T_1147; // @[lsu_bus_buffer.scala 289:103]
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
  wire  _T_1187 = _T_1166 & _T_1185; // @[lsu_bus_buffer.scala 290:77]
  wire  _T_1196 = _T_1023 & buf_write[0]; // @[Mux.scala 27:72]
  wire  _T_1197 = _T_1024 & buf_write[1]; // @[Mux.scala 27:72]
  wire  _T_1200 = _T_1196 | _T_1197; // @[Mux.scala 27:72]
  wire  _T_1198 = _T_1025 & buf_write[2]; // @[Mux.scala 27:72]
  wire  _T_1201 = _T_1200 | _T_1198; // @[Mux.scala 27:72]
  wire  _T_1199 = _T_1026 & buf_write[3]; // @[Mux.scala 27:72]
  wire  _T_1202 = _T_1201 | _T_1199; // @[Mux.scala 27:72]
  wire  _T_1204 = ~_T_1202; // @[lsu_bus_buffer.scala 290:150]
  wire  _T_1205 = _T_1187 & _T_1204; // @[lsu_bus_buffer.scala 290:148]
  wire  _T_1206 = ~_T_1205; // @[lsu_bus_buffer.scala 290:8]
  wire [3:0] _T_1952 = ~CmdPtr0Dec; // @[lsu_bus_buffer.scala 381:62]
  wire [3:0] _T_1953 = buf_age_3 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1954 = |_T_1953; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1955 = ~_T_1954; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1957 = ~CmdPtr0Dec[3]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1958 = _T_1955 & _T_1957; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1960 = _T_1958 & _T_2583; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1962 = _T_1960 & _T_4431; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1942 = buf_age_2 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1943 = |_T_1942; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1944 = ~_T_1943; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1946 = ~CmdPtr0Dec[2]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1947 = _T_1944 & _T_1946; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1949 = _T_1947 & _T_2576; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1951 = _T_1949 & _T_4426; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1931 = buf_age_1 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1932 = |_T_1931; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1933 = ~_T_1932; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1935 = ~CmdPtr0Dec[1]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1936 = _T_1933 & _T_1935; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1938 = _T_1936 & _T_2569; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1940 = _T_1938 & _T_4421; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] _T_1920 = buf_age_0 & _T_1952; // @[lsu_bus_buffer.scala 381:59]
  wire  _T_1921 = |_T_1920; // @[lsu_bus_buffer.scala 381:76]
  wire  _T_1922 = ~_T_1921; // @[lsu_bus_buffer.scala 381:45]
  wire  _T_1924 = ~CmdPtr0Dec[0]; // @[lsu_bus_buffer.scala 381:83]
  wire  _T_1925 = _T_1922 & _T_1924; // @[lsu_bus_buffer.scala 381:81]
  wire  _T_1927 = _T_1925 & _T_2562; // @[lsu_bus_buffer.scala 381:98]
  wire  _T_1929 = _T_1927 & _T_4416; // @[lsu_bus_buffer.scala 381:123]
  wire [3:0] CmdPtr1Dec = {_T_1962,_T_1951,_T_1940,_T_1929}; // @[Cat.scala 29:58]
  wire  found_cmdptr1 = |CmdPtr1Dec; // @[lsu_bus_buffer.scala 386:31]
  wire  _T_1207 = _T_1206 | found_cmdptr1; // @[lsu_bus_buffer.scala 290:181]
  wire [3:0] _T_1210 = {buf_nomerge_3,buf_nomerge_2,buf_nomerge_1,buf_nomerge_0}; // @[Cat.scala 29:58]
  wire  _T_1219 = _T_1023 & _T_1210[0]; // @[Mux.scala 27:72]
  wire  _T_1220 = _T_1024 & _T_1210[1]; // @[Mux.scala 27:72]
  wire  _T_1223 = _T_1219 | _T_1220; // @[Mux.scala 27:72]
  wire  _T_1221 = _T_1025 & _T_1210[2]; // @[Mux.scala 27:72]
  wire  _T_1224 = _T_1223 | _T_1221; // @[Mux.scala 27:72]
  wire  _T_1222 = _T_1026 & _T_1210[3]; // @[Mux.scala 27:72]
  wire  _T_1225 = _T_1224 | _T_1222; // @[Mux.scala 27:72]
  wire  _T_1227 = _T_1207 | _T_1225; // @[lsu_bus_buffer.scala 290:197]
  wire  _T_1228 = _T_1227 | obuf_force_wr_en; // @[lsu_bus_buffer.scala 290:269]
  wire  _T_1229 = _T_1148 & _T_1228; // @[lsu_bus_buffer.scala 289:164]
  wire  _T_1230 = _T_1094 | _T_1229; // @[lsu_bus_buffer.scala 287:98]
  reg  obuf_write; // @[Reg.scala 27:20]
  reg  obuf_cmd_done; // @[lsu_bus_buffer.scala 350:54]
  reg  obuf_data_done; // @[lsu_bus_buffer.scala 351:55]
  wire  _T_4814 = obuf_cmd_done | obuf_data_done; // @[lsu_bus_buffer.scala 563:54]
  wire  _T_4815 = obuf_cmd_done ? io_lsu_axi_w_ready : io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 563:75]
  wire  _T_4816 = io_lsu_axi_aw_ready & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 563:153]
  wire  _T_4817 = _T_4814 ? _T_4815 : _T_4816; // @[lsu_bus_buffer.scala 563:39]
  wire  bus_cmd_ready = obuf_write ? _T_4817 : io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 563:23]
  wire  _T_1231 = ~obuf_valid; // @[lsu_bus_buffer.scala 291:48]
  wire  _T_1232 = bus_cmd_ready | _T_1231; // @[lsu_bus_buffer.scala 291:46]
  reg  obuf_nosend; // @[Reg.scala 27:20]
  wire  _T_1233 = _T_1232 | obuf_nosend; // @[lsu_bus_buffer.scala 291:60]
  wire  _T_1234 = _T_1230 & _T_1233; // @[lsu_bus_buffer.scala 291:29]
  wire  _T_1235 = ~obuf_wr_wait; // @[lsu_bus_buffer.scala 291:77]
  wire  _T_1236 = _T_1234 & _T_1235; // @[lsu_bus_buffer.scala 291:75]
  reg [31:0] obuf_addr; // @[lib.scala 374:16]
  wire  _T_4765 = obuf_addr[31:3] == buf_addr_0[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4766 = obuf_valid & _T_4765; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4768 = obuf_tag1 == 2'h0; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4769 = obuf_merge & _T_4768; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4770 = _T_3558 | _T_4769; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4771 = ~_T_4770; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4772 = _T_4766 & _T_4771; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4806 = _T_4740 & _T_4772; // @[Mux.scala 27:72]
  wire  _T_4776 = obuf_addr[31:3] == buf_addr_1[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4777 = obuf_valid & _T_4776; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4779 = obuf_tag1 == 2'h1; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4780 = obuf_merge & _T_4779; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4781 = _T_3748 | _T_4780; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4782 = ~_T_4781; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4783 = _T_4777 & _T_4782; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4807 = _T_4744 & _T_4783; // @[Mux.scala 27:72]
  wire  _T_4810 = _T_4806 | _T_4807; // @[Mux.scala 27:72]
  wire  _T_4787 = obuf_addr[31:3] == buf_addr_2[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4788 = obuf_valid & _T_4787; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4790 = obuf_tag1 == 2'h2; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4791 = obuf_merge & _T_4790; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4792 = _T_3938 | _T_4791; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4793 = ~_T_4792; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4794 = _T_4788 & _T_4793; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4808 = _T_4748 & _T_4794; // @[Mux.scala 27:72]
  wire  _T_4811 = _T_4810 | _T_4808; // @[Mux.scala 27:72]
  wire  _T_4798 = obuf_addr[31:3] == buf_addr_3[31:3]; // @[lsu_bus_buffer.scala 561:37]
  wire  _T_4799 = obuf_valid & _T_4798; // @[lsu_bus_buffer.scala 561:19]
  wire  _T_4801 = obuf_tag1 == 2'h3; // @[lsu_bus_buffer.scala 561:107]
  wire  _T_4802 = obuf_merge & _T_4801; // @[lsu_bus_buffer.scala 561:95]
  wire  _T_4803 = _T_4128 | _T_4802; // @[lsu_bus_buffer.scala 561:81]
  wire  _T_4804 = ~_T_4803; // @[lsu_bus_buffer.scala 561:61]
  wire  _T_4805 = _T_4799 & _T_4804; // @[lsu_bus_buffer.scala 561:59]
  wire  _T_4809 = _T_4752 & _T_4805; // @[Mux.scala 27:72]
  wire  bus_addr_match_pending = _T_4811 | _T_4809; // @[Mux.scala 27:72]
  wire  _T_1237 = ~bus_addr_match_pending; // @[lsu_bus_buffer.scala 291:94]
  wire  _T_1238 = _T_1236 & _T_1237; // @[lsu_bus_buffer.scala 291:92]
  wire  obuf_wr_en = _T_1238 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 291:118]
  wire  _T_1240 = obuf_valid & obuf_nosend; // @[lsu_bus_buffer.scala 293:47]
  wire  bus_wcmd_sent = io_lsu_axi_aw_valid & io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 564:40]
  wire  _T_4821 = obuf_cmd_done | bus_wcmd_sent; // @[lsu_bus_buffer.scala 566:35]
  wire  bus_wdata_sent = io_lsu_axi_w_valid & io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 565:40]
  wire  _T_4822 = obuf_data_done | bus_wdata_sent; // @[lsu_bus_buffer.scala 566:70]
  wire  _T_4823 = _T_4821 & _T_4822; // @[lsu_bus_buffer.scala 566:52]
  wire  _T_4824 = io_lsu_axi_ar_valid & io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 566:112]
  wire  bus_cmd_sent = _T_4823 | _T_4824; // @[lsu_bus_buffer.scala 566:89]
  wire  _T_1241 = bus_cmd_sent | _T_1240; // @[lsu_bus_buffer.scala 293:33]
  wire  _T_1242 = ~obuf_wr_en; // @[lsu_bus_buffer.scala 293:65]
  wire  _T_1243 = _T_1241 & _T_1242; // @[lsu_bus_buffer.scala 293:63]
  wire  _T_1244 = _T_1243 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 293:77]
  wire  obuf_rst = _T_1244 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 293:98]
  wire  obuf_write_in = ibuf_buf_byp ? io_lsu_pkt_r_bits_store : _T_1202; // @[lsu_bus_buffer.scala 294:26]
  wire [31:0] _T_1281 = _T_1023 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1282 = _T_1024 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1283 = _T_1025 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1284 = _T_1026 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1285 = _T_1281 | _T_1282; // @[Mux.scala 27:72]
  wire [31:0] _T_1286 = _T_1285 | _T_1283; // @[Mux.scala 27:72]
  wire [31:0] _T_1287 = _T_1286 | _T_1284; // @[Mux.scala 27:72]
  wire [31:0] obuf_addr_in = ibuf_buf_byp ? io_lsu_addr_r : _T_1287; // @[lsu_bus_buffer.scala 296:25]
  reg [1:0] buf_sz_0; // @[Reg.scala 27:20]
  wire [1:0] _T_1294 = _T_1023 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_1; // @[Reg.scala 27:20]
  wire [1:0] _T_1295 = _T_1024 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_2; // @[Reg.scala 27:20]
  wire [1:0] _T_1296 = _T_1025 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] buf_sz_3; // @[Reg.scala 27:20]
  wire [1:0] _T_1297 = _T_1026 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1298 = _T_1294 | _T_1295; // @[Mux.scala 27:72]
  wire [1:0] _T_1299 = _T_1298 | _T_1296; // @[Mux.scala 27:72]
  wire [1:0] _T_1300 = _T_1299 | _T_1297; // @[Mux.scala 27:72]
  wire [1:0] obuf_sz_in = ibuf_buf_byp ? ibuf_sz_in : _T_1300; // @[lsu_bus_buffer.scala 299:23]
  wire [7:0] _T_2011 = {4'h0,_T_1962,_T_1951,_T_1940,_T_1929}; // @[Cat.scala 29:58]
  wire  _T_2014 = _T_2011[4] | _T_2011[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_2016 = _T_2014 | _T_2011[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_2018 = _T_2016 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_2021 = _T_2011[2] | _T_2011[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_2023 = _T_2021 | _T_2011[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2025 = _T_2023 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2028 = _T_2011[1] | _T_2011[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2030 = _T_2028 | _T_2011[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2032 = _T_2030 | _T_2011[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2034 = {_T_2018,_T_2025,_T_2032}; // @[Cat.scala 29:58]
  wire [1:0] CmdPtr1 = _T_2034[1:0]; // @[lsu_bus_buffer.scala 395:11]
  wire  _T_1302 = obuf_wr_en | obuf_rst; // @[lsu_bus_buffer.scala 307:39]
  wire  _T_1303 = ~_T_1302; // @[lsu_bus_buffer.scala 307:26]
  wire  _T_1309 = obuf_sz_in == 2'h0; // @[lsu_bus_buffer.scala 311:72]
  wire  _T_1312 = ~obuf_addr_in[0]; // @[lsu_bus_buffer.scala 311:98]
  wire  _T_1313 = obuf_sz_in[0] & _T_1312; // @[lsu_bus_buffer.scala 311:96]
  wire  _T_1314 = _T_1309 | _T_1313; // @[lsu_bus_buffer.scala 311:79]
  wire  _T_1317 = |obuf_addr_in[1:0]; // @[lsu_bus_buffer.scala 311:153]
  wire  _T_1318 = ~_T_1317; // @[lsu_bus_buffer.scala 311:134]
  wire  _T_1319 = obuf_sz_in[1] & _T_1318; // @[lsu_bus_buffer.scala 311:132]
  wire  _T_1320 = _T_1314 | _T_1319; // @[lsu_bus_buffer.scala 311:116]
  wire  obuf_aligned_in = ibuf_buf_byp ? is_aligned_r : _T_1320; // @[lsu_bus_buffer.scala 311:28]
  wire  _T_1337 = obuf_addr_in[31:3] == obuf_addr[31:3]; // @[lsu_bus_buffer.scala 326:40]
  wire  _T_1338 = _T_1337 & obuf_aligned_in; // @[lsu_bus_buffer.scala 326:60]
  wire  _T_1339 = ~obuf_sideeffect; // @[lsu_bus_buffer.scala 326:80]
  wire  _T_1340 = _T_1338 & _T_1339; // @[lsu_bus_buffer.scala 326:78]
  wire  _T_1341 = ~obuf_write; // @[lsu_bus_buffer.scala 326:99]
  wire  _T_1342 = _T_1340 & _T_1341; // @[lsu_bus_buffer.scala 326:97]
  wire  _T_1343 = ~obuf_write_in; // @[lsu_bus_buffer.scala 326:113]
  wire  _T_1344 = _T_1342 & _T_1343; // @[lsu_bus_buffer.scala 326:111]
  wire  _T_1345 = ~io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_buffer.scala 326:130]
  wire  _T_1346 = _T_1344 & _T_1345; // @[lsu_bus_buffer.scala 326:128]
  wire  _T_1347 = ~obuf_nosend; // @[lsu_bus_buffer.scala 327:20]
  wire  _T_1348 = obuf_valid & _T_1347; // @[lsu_bus_buffer.scala 327:18]
  reg  obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 352:56]
  wire  bus_rsp_read = io_lsu_axi_r_valid & io_lsu_axi_r_ready; // @[lsu_bus_buffer.scala 567:38]
  reg [2:0] obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 353:55]
  wire  _T_1349 = io_lsu_axi_r_bits_id == obuf_rdrsp_tag; // @[lsu_bus_buffer.scala 327:90]
  wire  _T_1350 = bus_rsp_read & _T_1349; // @[lsu_bus_buffer.scala 327:70]
  wire  _T_1351 = ~_T_1350; // @[lsu_bus_buffer.scala 327:55]
  wire  _T_1352 = obuf_rdrsp_pend & _T_1351; // @[lsu_bus_buffer.scala 327:53]
  wire  _T_1353 = _T_1348 | _T_1352; // @[lsu_bus_buffer.scala 327:34]
  wire  obuf_nosend_in = _T_1346 & _T_1353; // @[lsu_bus_buffer.scala 326:177]
  wire  _T_1321 = ~obuf_nosend_in; // @[lsu_bus_buffer.scala 319:45]
  wire  _T_1322 = obuf_wr_en & _T_1321; // @[lsu_bus_buffer.scala 319:43]
  wire  _T_1323 = ~_T_1322; // @[lsu_bus_buffer.scala 319:30]
  wire  _T_1324 = _T_1323 & obuf_rdrsp_pend; // @[lsu_bus_buffer.scala 319:62]
  wire  _T_1328 = _T_1324 & _T_1351; // @[lsu_bus_buffer.scala 319:80]
  wire  _T_1330 = bus_cmd_sent & _T_1341; // @[lsu_bus_buffer.scala 320:19]
  wire  _T_1331 = _T_1328 | _T_1330; // @[lsu_bus_buffer.scala 319:139]
  wire  obuf_rdrsp_pend_en = io_lsu_bus_clk_en | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 321:47]
  wire [7:0] _T_1356 = {ldst_byteen_lo_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1357 = {4'h0,ldst_byteen_lo_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1358 = io_lsu_addr_r[2] ? _T_1356 : _T_1357; // @[lsu_bus_buffer.scala 328:46]
  wire [3:0] _T_1377 = _T_1023 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1378 = _T_1024 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1379 = _T_1025 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1380 = _T_1026 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1381 = _T_1377 | _T_1378; // @[Mux.scala 27:72]
  wire [3:0] _T_1382 = _T_1381 | _T_1379; // @[Mux.scala 27:72]
  wire [3:0] _T_1383 = _T_1382 | _T_1380; // @[Mux.scala 27:72]
  wire [7:0] _T_1385 = {_T_1383,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1398 = {4'h0,_T_1383}; // @[Cat.scala 29:58]
  wire [7:0] _T_1399 = _T_1287[2] ? _T_1385 : _T_1398; // @[lsu_bus_buffer.scala 329:8]
  wire [7:0] obuf_byteen0_in = ibuf_buf_byp ? _T_1358 : _T_1399; // @[lsu_bus_buffer.scala 328:28]
  wire [7:0] _T_1401 = {ldst_byteen_hi_r,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1402 = {4'h0,ldst_byteen_hi_r}; // @[Cat.scala 29:58]
  wire [7:0] _T_1403 = io_end_addr_r[2] ? _T_1401 : _T_1402; // @[lsu_bus_buffer.scala 330:46]
  wire  _T_1404 = CmdPtr1 == 2'h0; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1405 = CmdPtr1 == 2'h1; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1406 = CmdPtr1 == 2'h2; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_1407 = CmdPtr1 == 2'h3; // @[lsu_bus_buffer.scala 61:123]
  wire [31:0] _T_1408 = _T_1404 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1409 = _T_1405 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1410 = _T_1406 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1411 = _T_1407 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1412 = _T_1408 | _T_1409; // @[Mux.scala 27:72]
  wire [31:0] _T_1413 = _T_1412 | _T_1410; // @[Mux.scala 27:72]
  wire [31:0] _T_1414 = _T_1413 | _T_1411; // @[Mux.scala 27:72]
  wire [3:0] _T_1422 = _T_1404 ? buf_byteen_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1423 = _T_1405 ? buf_byteen_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1424 = _T_1406 ? buf_byteen_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1425 = _T_1407 ? buf_byteen_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_1426 = _T_1422 | _T_1423; // @[Mux.scala 27:72]
  wire [3:0] _T_1427 = _T_1426 | _T_1424; // @[Mux.scala 27:72]
  wire [3:0] _T_1428 = _T_1427 | _T_1425; // @[Mux.scala 27:72]
  wire [7:0] _T_1430 = {_T_1428,4'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_1443 = {4'h0,_T_1428}; // @[Cat.scala 29:58]
  wire [7:0] _T_1444 = _T_1414[2] ? _T_1430 : _T_1443; // @[lsu_bus_buffer.scala 331:8]
  wire [7:0] obuf_byteen1_in = ibuf_buf_byp ? _T_1403 : _T_1444; // @[lsu_bus_buffer.scala 330:28]
  wire [63:0] _T_1446 = {store_data_lo_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1447 = {32'h0,store_data_lo_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1448 = io_lsu_addr_r[2] ? _T_1446 : _T_1447; // @[lsu_bus_buffer.scala 333:44]
  wire [31:0] _T_1467 = _T_1023 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1468 = _T_1024 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1469 = _T_1025 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1470 = _T_1026 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1471 = _T_1467 | _T_1468; // @[Mux.scala 27:72]
  wire [31:0] _T_1472 = _T_1471 | _T_1469; // @[Mux.scala 27:72]
  wire [31:0] _T_1473 = _T_1472 | _T_1470; // @[Mux.scala 27:72]
  wire [63:0] _T_1475 = {_T_1473,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1488 = {32'h0,_T_1473}; // @[Cat.scala 29:58]
  wire [63:0] _T_1489 = _T_1287[2] ? _T_1475 : _T_1488; // @[lsu_bus_buffer.scala 334:8]
  wire [63:0] obuf_data0_in = ibuf_buf_byp ? _T_1448 : _T_1489; // @[lsu_bus_buffer.scala 333:26]
  wire [63:0] _T_1491 = {store_data_hi_r,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1492 = {32'h0,store_data_hi_r}; // @[Cat.scala 29:58]
  wire [63:0] _T_1493 = io_end_addr_r[2] ? _T_1491 : _T_1492; // @[lsu_bus_buffer.scala 335:44]
  wire [31:0] _T_1512 = _T_1404 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1513 = _T_1405 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1514 = _T_1406 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1515 = _T_1407 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1516 = _T_1512 | _T_1513; // @[Mux.scala 27:72]
  wire [31:0] _T_1517 = _T_1516 | _T_1514; // @[Mux.scala 27:72]
  wire [31:0] _T_1518 = _T_1517 | _T_1515; // @[Mux.scala 27:72]
  wire [63:0] _T_1520 = {_T_1518,32'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_1533 = {32'h0,_T_1518}; // @[Cat.scala 29:58]
  wire [63:0] _T_1534 = _T_1414[2] ? _T_1520 : _T_1533; // @[lsu_bus_buffer.scala 336:8]
  wire [63:0] obuf_data1_in = ibuf_buf_byp ? _T_1493 : _T_1534; // @[lsu_bus_buffer.scala 335:26]
  wire  _T_1619 = CmdPtr0 != CmdPtr1; // @[lsu_bus_buffer.scala 342:30]
  wire  _T_1620 = _T_1619 & found_cmdptr0; // @[lsu_bus_buffer.scala 342:43]
  wire  _T_1621 = _T_1620 & found_cmdptr1; // @[lsu_bus_buffer.scala 342:59]
  wire  _T_1635 = _T_1621 & _T_1107; // @[lsu_bus_buffer.scala 342:75]
  wire [2:0] _T_1640 = _T_1404 ? buf_state_0 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1641 = _T_1405 ? buf_state_1 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1644 = _T_1640 | _T_1641; // @[Mux.scala 27:72]
  wire [2:0] _T_1642 = _T_1406 ? buf_state_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1645 = _T_1644 | _T_1642; // @[Mux.scala 27:72]
  wire [2:0] _T_1643 = _T_1407 ? buf_state_3 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1646 = _T_1645 | _T_1643; // @[Mux.scala 27:72]
  wire  _T_1648 = _T_1646 == 3'h2; // @[lsu_bus_buffer.scala 342:150]
  wire  _T_1649 = _T_1635 & _T_1648; // @[lsu_bus_buffer.scala 342:118]
  wire  _T_1670 = _T_1649 & _T_1128; // @[lsu_bus_buffer.scala 342:161]
  wire  _T_1688 = _T_1670 & _T_1053; // @[lsu_bus_buffer.scala 343:85]
  wire  _T_1725 = _T_1204 & _T_1166; // @[lsu_bus_buffer.scala 344:36]
  reg  buf_dualhi_3; // @[Reg.scala 27:20]
  reg  buf_dualhi_2; // @[Reg.scala 27:20]
  reg  buf_dualhi_1; // @[Reg.scala 27:20]
  reg  buf_dualhi_0; // @[Reg.scala 27:20]
  wire [3:0] _T_1728 = {buf_dualhi_3,buf_dualhi_2,buf_dualhi_1,buf_dualhi_0}; // @[Cat.scala 29:58]
  wire  _T_1737 = _T_1023 & _T_1728[0]; // @[Mux.scala 27:72]
  wire  _T_1738 = _T_1024 & _T_1728[1]; // @[Mux.scala 27:72]
  wire  _T_1741 = _T_1737 | _T_1738; // @[Mux.scala 27:72]
  wire  _T_1739 = _T_1025 & _T_1728[2]; // @[Mux.scala 27:72]
  wire  _T_1742 = _T_1741 | _T_1739; // @[Mux.scala 27:72]
  wire  _T_1740 = _T_1026 & _T_1728[3]; // @[Mux.scala 27:72]
  wire  _T_1743 = _T_1742 | _T_1740; // @[Mux.scala 27:72]
  wire  _T_1745 = ~_T_1743; // @[lsu_bus_buffer.scala 344:107]
  wire  _T_1746 = _T_1725 & _T_1745; // @[lsu_bus_buffer.scala 344:105]
  wire  _T_1766 = _T_1746 & _T_1185; // @[lsu_bus_buffer.scala 344:177]
  wire  _T_1767 = _T_1688 & _T_1766; // @[lsu_bus_buffer.scala 343:122]
  wire  _T_1768 = ibuf_buf_byp & ldst_samedw_r; // @[lsu_bus_buffer.scala 345:19]
  wire  _T_1769 = _T_1768 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 345:35]
  wire  obuf_merge_en = _T_1767 | _T_1769; // @[lsu_bus_buffer.scala 344:250]
  wire  _T_1537 = obuf_merge_en & obuf_byteen1_in[0]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1538 = obuf_byteen0_in[0] | _T_1537; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1541 = obuf_merge_en & obuf_byteen1_in[1]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1542 = obuf_byteen0_in[1] | _T_1541; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1545 = obuf_merge_en & obuf_byteen1_in[2]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1546 = obuf_byteen0_in[2] | _T_1545; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1549 = obuf_merge_en & obuf_byteen1_in[3]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1550 = obuf_byteen0_in[3] | _T_1549; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1553 = obuf_merge_en & obuf_byteen1_in[4]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1554 = obuf_byteen0_in[4] | _T_1553; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1557 = obuf_merge_en & obuf_byteen1_in[5]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1558 = obuf_byteen0_in[5] | _T_1557; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1561 = obuf_merge_en & obuf_byteen1_in[6]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1562 = obuf_byteen0_in[6] | _T_1561; // @[lsu_bus_buffer.scala 337:63]
  wire  _T_1565 = obuf_merge_en & obuf_byteen1_in[7]; // @[lsu_bus_buffer.scala 337:80]
  wire  _T_1566 = obuf_byteen0_in[7] | _T_1565; // @[lsu_bus_buffer.scala 337:63]
  wire [7:0] obuf_byteen_in = {_T_1566,_T_1562,_T_1558,_T_1554,_T_1550,_T_1546,_T_1542,_T_1538}; // @[Cat.scala 29:58]
  wire [7:0] _T_1577 = _T_1537 ? obuf_data1_in[7:0] : obuf_data0_in[7:0]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1582 = _T_1541 ? obuf_data1_in[15:8] : obuf_data0_in[15:8]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1587 = _T_1545 ? obuf_data1_in[23:16] : obuf_data0_in[23:16]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1592 = _T_1549 ? obuf_data1_in[31:24] : obuf_data0_in[31:24]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1597 = _T_1553 ? obuf_data1_in[39:32] : obuf_data0_in[39:32]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1602 = _T_1557 ? obuf_data1_in[47:40] : obuf_data0_in[47:40]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1607 = _T_1561 ? obuf_data1_in[55:48] : obuf_data0_in[55:48]; // @[lsu_bus_buffer.scala 338:44]
  wire [7:0] _T_1612 = _T_1565 ? obuf_data1_in[63:56] : obuf_data0_in[63:56]; // @[lsu_bus_buffer.scala 338:44]
  wire [55:0] _T_1618 = {_T_1612,_T_1607,_T_1602,_T_1597,_T_1592,_T_1587,_T_1582}; // @[Cat.scala 29:58]
  wire  _T_1771 = obuf_wr_en | obuf_valid; // @[lsu_bus_buffer.scala 348:58]
  wire  _T_1772 = ~obuf_rst; // @[lsu_bus_buffer.scala 348:93]
  reg [1:0] obuf_sz; // @[Reg.scala 27:20]
  reg [7:0] obuf_byteen; // @[Reg.scala 27:20]
  reg [63:0] obuf_data; // @[lib.scala 374:16]
  wire  _T_1785 = buf_state_0 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1786 = ibuf_tag == 2'h0; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1787 = ibuf_valid & _T_1786; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1788 = WrPtr0_r == 2'h0; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1789 = WrPtr1_r == 2'h0; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1790 = io_ldst_dual_r & _T_1789; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1791 = _T_1788 | _T_1790; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1792 = io_lsu_busreq_r & _T_1791; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1793 = _T_1787 | _T_1792; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1794 = ~_T_1793; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1795 = _T_1785 & _T_1794; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1796 = buf_state_1 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1797 = ibuf_tag == 2'h1; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1798 = ibuf_valid & _T_1797; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1799 = WrPtr0_r == 2'h1; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1800 = WrPtr1_r == 2'h1; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1801 = io_ldst_dual_r & _T_1800; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1802 = _T_1799 | _T_1801; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1803 = io_lsu_busreq_r & _T_1802; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1804 = _T_1798 | _T_1803; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1805 = ~_T_1804; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1806 = _T_1796 & _T_1805; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1807 = buf_state_2 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1808 = ibuf_tag == 2'h2; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1809 = ibuf_valid & _T_1808; // @[lsu_bus_buffer.scala 367:19]
  wire  _T_1810 = WrPtr0_r == 2'h2; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1811 = WrPtr1_r == 2'h2; // @[lsu_bus_buffer.scala 368:57]
  wire  _T_1812 = io_ldst_dual_r & _T_1811; // @[lsu_bus_buffer.scala 368:45]
  wire  _T_1813 = _T_1810 | _T_1812; // @[lsu_bus_buffer.scala 368:27]
  wire  _T_1814 = io_lsu_busreq_r & _T_1813; // @[lsu_bus_buffer.scala 367:58]
  wire  _T_1815 = _T_1809 | _T_1814; // @[lsu_bus_buffer.scala 367:39]
  wire  _T_1816 = ~_T_1815; // @[lsu_bus_buffer.scala 367:5]
  wire  _T_1817 = _T_1807 & _T_1816; // @[lsu_bus_buffer.scala 366:76]
  wire  _T_1818 = buf_state_3 == 3'h0; // @[lsu_bus_buffer.scala 366:65]
  wire  _T_1819 = ibuf_tag == 2'h3; // @[lsu_bus_buffer.scala 367:30]
  wire  _T_1821 = WrPtr0_r == 2'h3; // @[lsu_bus_buffer.scala 368:18]
  wire  _T_1822 = WrPtr1_r == 2'h3; // @[lsu_bus_buffer.scala 368:57]
  wire [1:0] _T_1830 = _T_1817 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_1831 = _T_1806 ? 2'h1 : _T_1830; // @[Mux.scala 98:16]
  wire [1:0] WrPtr0_m = _T_1795 ? 2'h0 : _T_1831; // @[Mux.scala 98:16]
  wire  _T_1836 = WrPtr0_m == 2'h0; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1837 = io_lsu_busreq_m & _T_1836; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1838 = _T_1787 | _T_1837; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1844 = _T_1838 | _T_1792; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1845 = ~_T_1844; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1846 = _T_1785 & _T_1845; // @[lsu_bus_buffer.scala 372:76]
  wire  _T_1850 = WrPtr0_m == 2'h1; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1851 = io_lsu_busreq_m & _T_1850; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1852 = _T_1798 | _T_1851; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1858 = _T_1852 | _T_1803; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1859 = ~_T_1858; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1860 = _T_1796 & _T_1859; // @[lsu_bus_buffer.scala 372:76]
  wire  _T_1864 = WrPtr0_m == 2'h2; // @[lsu_bus_buffer.scala 373:33]
  wire  _T_1865 = io_lsu_busreq_m & _T_1864; // @[lsu_bus_buffer.scala 373:22]
  wire  _T_1866 = _T_1809 | _T_1865; // @[lsu_bus_buffer.scala 372:112]
  wire  _T_1872 = _T_1866 | _T_1814; // @[lsu_bus_buffer.scala 373:42]
  wire  _T_1873 = ~_T_1872; // @[lsu_bus_buffer.scala 372:78]
  wire  _T_1874 = _T_1807 & _T_1873; // @[lsu_bus_buffer.scala 372:76]
  reg [3:0] buf_rspageQ_0; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2710 = buf_state_3 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2711 = buf_rspageQ_0[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2707 = buf_state_2 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2708 = buf_rspageQ_0[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2704 = buf_state_1 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2705 = buf_rspageQ_0[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2701 = buf_state_0 == 3'h5; // @[lsu_bus_buffer.scala 416:102]
  wire  _T_2702 = buf_rspageQ_0[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_0 = {_T_2711,_T_2708,_T_2705,_T_2702}; // @[Cat.scala 29:58]
  wire  _T_1965 = |buf_rsp_pickage_0; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1966 = ~_T_1965; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1968 = _T_1966 & _T_2701; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_1; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2726 = buf_rspageQ_1[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2723 = buf_rspageQ_1[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2720 = buf_rspageQ_1[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2717 = buf_rspageQ_1[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_1 = {_T_2726,_T_2723,_T_2720,_T_2717}; // @[Cat.scala 29:58]
  wire  _T_1969 = |buf_rsp_pickage_1; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1970 = ~_T_1969; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1972 = _T_1970 & _T_2704; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_2; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2741 = buf_rspageQ_2[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2738 = buf_rspageQ_2[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2735 = buf_rspageQ_2[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2732 = buf_rspageQ_2[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_2 = {_T_2741,_T_2738,_T_2735,_T_2732}; // @[Cat.scala 29:58]
  wire  _T_1973 = |buf_rsp_pickage_2; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1974 = ~_T_1973; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1976 = _T_1974 & _T_2707; // @[lsu_bus_buffer.scala 384:70]
  reg [3:0] buf_rspageQ_3; // @[lsu_bus_buffer.scala 509:63]
  wire  _T_2756 = buf_rspageQ_3[3] & _T_2710; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2753 = buf_rspageQ_3[2] & _T_2707; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2750 = buf_rspageQ_3[1] & _T_2704; // @[lsu_bus_buffer.scala 416:87]
  wire  _T_2747 = buf_rspageQ_3[0] & _T_2701; // @[lsu_bus_buffer.scala 416:87]
  wire [3:0] buf_rsp_pickage_3 = {_T_2756,_T_2753,_T_2750,_T_2747}; // @[Cat.scala 29:58]
  wire  _T_1977 = |buf_rsp_pickage_3; // @[lsu_bus_buffer.scala 384:65]
  wire  _T_1978 = ~_T_1977; // @[lsu_bus_buffer.scala 384:44]
  wire  _T_1980 = _T_1978 & _T_2710; // @[lsu_bus_buffer.scala 384:70]
  wire [7:0] _T_2036 = {4'h0,_T_1980,_T_1976,_T_1972,_T_1968}; // @[Cat.scala 29:58]
  wire  _T_2039 = _T_2036[4] | _T_2036[5]; // @[lsu_bus_buffer.scala 388:42]
  wire  _T_2041 = _T_2039 | _T_2036[6]; // @[lsu_bus_buffer.scala 388:48]
  wire  _T_2043 = _T_2041 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:54]
  wire  _T_2046 = _T_2036[2] | _T_2036[3]; // @[lsu_bus_buffer.scala 388:67]
  wire  _T_2048 = _T_2046 | _T_2036[6]; // @[lsu_bus_buffer.scala 388:73]
  wire  _T_2050 = _T_2048 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:79]
  wire  _T_2053 = _T_2036[1] | _T_2036[3]; // @[lsu_bus_buffer.scala 388:92]
  wire  _T_2055 = _T_2053 | _T_2036[5]; // @[lsu_bus_buffer.scala 388:98]
  wire  _T_2057 = _T_2055 | _T_2036[7]; // @[lsu_bus_buffer.scala 388:104]
  wire [2:0] _T_2059 = {_T_2043,_T_2050,_T_2057}; // @[Cat.scala 29:58]
  wire  _T_3528 = ibuf_byp | io_ldst_dual_r; // @[lsu_bus_buffer.scala 446:77]
  wire  _T_3529 = ~ibuf_merge_en; // @[lsu_bus_buffer.scala 446:97]
  wire  _T_3530 = _T_3528 & _T_3529; // @[lsu_bus_buffer.scala 446:95]
  wire  _T_3531 = 2'h0 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3532 = _T_3530 & _T_3531; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3533 = ibuf_byp & io_ldst_dual_r; // @[lsu_bus_buffer.scala 446:144]
  wire  _T_3534 = 2'h0 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3535 = _T_3533 & _T_3534; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3536 = _T_3532 | _T_3535; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3537 = _T_853 & _T_3536; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3538 = 2'h0 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3539 = ibuf_drain_vld & _T_3538; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3540 = _T_3537 | _T_3539; // @[lsu_bus_buffer.scala 446:183]
  wire  bus_rsp_write = io_lsu_axi_b_valid & io_lsu_axi_b_ready; // @[lsu_bus_buffer.scala 568:39]
  wire  _T_3628 = io_lsu_axi_b_bits_id == 3'h0; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3629 = bus_rsp_write & _T_3628; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3630 = io_lsu_axi_r_bits_id == 3'h0; // @[lsu_bus_buffer.scala 474:46]
  reg  _T_4291; // @[Reg.scala 27:20]
  reg  _T_4289; // @[Reg.scala 27:20]
  reg  _T_4287; // @[Reg.scala 27:20]
  reg  _T_4285; // @[Reg.scala 27:20]
  wire [3:0] buf_ldfwd = {_T_4291,_T_4289,_T_4287,_T_4285}; // @[Cat.scala 29:58]
  reg [1:0] buf_ldfwdtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_372 = {{1'd0}, buf_ldfwdtag_0}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3632 = io_lsu_axi_r_bits_id == _GEN_372; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3633 = buf_ldfwd[0] & _T_3632; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3634 = _T_3630 | _T_3633; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3635 = buf_dual_0 & buf_dualhi_0; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3637 = ~buf_write[0]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3638 = _T_3635 & _T_3637; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3639 = _T_3638 & buf_samedw_0; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_0; // @[Reg.scala 27:20]
  wire [2:0] _GEN_373 = {{1'd0}, buf_dualtag_0}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3640 = io_lsu_axi_r_bits_id == _GEN_373; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3641 = _T_3639 & _T_3640; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3642 = _T_3634 | _T_3641; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3643 = bus_rsp_read & _T_3642; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3644 = _T_3629 | _T_3643; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_43 = _T_3585 & _T_3644; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3551 ? 1'h0 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_3547 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  wire [3:0] _T_3679 = buf_ldfwd >> buf_dualtag_0; // @[lsu_bus_buffer.scala 489:21]
  reg [1:0] buf_ldfwdtag_3; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_2; // @[Reg.scala 27:20]
  reg [1:0] buf_ldfwdtag_1; // @[Reg.scala 27:20]
  wire [1:0] _GEN_23 = 2'h1 == buf_dualtag_0 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_24 = 2'h2 == buf_dualtag_0 ? buf_ldfwdtag_2 : _GEN_23; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_25 = 2'h3 == buf_dualtag_0 ? buf_ldfwdtag_3 : _GEN_24; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_375 = {{1'd0}, _GEN_25}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3681 = io_lsu_axi_r_bits_id == _GEN_375; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3682 = _T_3679[0] & _T_3681; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_3683 = _T_3640 | _T_3682; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_3684 = bus_rsp_read & _T_3683; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_37 = _T_3669 & _T_3684; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_3585 ? buf_resp_state_bus_en_0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_3551 ? buf_cmd_state_bus_en_0 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_3547 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_0 = _T_3524 ? 1'h0 : _GEN_67; // @[Conditional.scala 40:58]
  wire  _T_3564 = buf_state_bus_en_0 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3565 = _T_3564 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire [1:0] RspPtr = _T_2059[1:0]; // @[lsu_bus_buffer.scala 396:10]
  wire  _T_3690 = RspPtr == 2'h0; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_3691 = buf_dualtag_0 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_3692 = buf_dual_0 & _T_3691; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_3693 = _T_3690 | _T_3692; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_3694 = _T_3693 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_32 = _T_3687 ? _T_3694 : _T_3695; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_3669 ? _T_3565 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_3585 ? _T_3565 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_3551 ? _T_3565 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_3547 ? obuf_rdrsp_pend_en : _GEN_55; // @[Conditional.scala 39:67]
  wire  buf_state_en_0 = _T_3524 ? _T_3540 : _GEN_65; // @[Conditional.scala 40:58]
  wire  _T_2061 = _T_1785 & buf_state_en_0; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2067 = ibuf_drain_vld & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 410:23]
  wire  _T_2069 = _T_2067 & _T_3528; // @[lsu_bus_buffer.scala 410:41]
  wire  _T_2071 = _T_2069 & _T_1788; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2073 = _T_2071 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2074 = _T_4455 | _T_2073; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2075 = ibuf_byp & io_lsu_busreq_r; // @[lsu_bus_buffer.scala 411:17]
  wire  _T_2076 = _T_2075 & io_ldst_dual_r; // @[lsu_bus_buffer.scala 411:35]
  wire  _T_2078 = _T_2076 & _T_1789; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2080 = _T_2078 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2081 = _T_2074 | _T_2080; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2082 = _T_2061 & _T_2081; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2084 = _T_2082 | buf_age_0[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2098 = _T_2071 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2099 = _T_4460 | _T_2098; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2105 = _T_2078 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2106 = _T_2099 | _T_2105; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2107 = _T_2061 & _T_2106; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2109 = _T_2107 | buf_age_0[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2123 = _T_2071 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2124 = _T_4465 | _T_2123; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2130 = _T_2078 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2131 = _T_2124 | _T_2130; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2132 = _T_2061 & _T_2131; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2134 = _T_2132 | buf_age_0[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2148 = _T_2071 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2149 = _T_4470 | _T_2148; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2155 = _T_2078 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2156 = _T_2149 | _T_2155; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2157 = _T_2061 & _T_2156; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2159 = _T_2157 | buf_age_0[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2161 = {_T_2159,_T_2134,_T_2109}; // @[Cat.scala 29:58]
  wire  _T_3721 = 2'h1 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3722 = _T_3530 & _T_3721; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3724 = 2'h1 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3725 = _T_3533 & _T_3724; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3726 = _T_3722 | _T_3725; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3727 = _T_853 & _T_3726; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3728 = 2'h1 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3729 = ibuf_drain_vld & _T_3728; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3730 = _T_3727 | _T_3729; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_3818 = io_lsu_axi_b_bits_id == 3'h1; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_3819 = bus_rsp_write & _T_3818; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_3820 = io_lsu_axi_r_bits_id == 3'h1; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_376 = {{1'd0}, buf_ldfwdtag_1}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3822 = io_lsu_axi_r_bits_id == _GEN_376; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_3823 = buf_ldfwd[1] & _T_3822; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_3824 = _T_3820 | _T_3823; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_3825 = buf_dual_1 & buf_dualhi_1; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_3827 = ~buf_write[1]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_3828 = _T_3825 & _T_3827; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_3829 = _T_3828 & buf_samedw_1; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_1; // @[Reg.scala 27:20]
  wire [2:0] _GEN_377 = {{1'd0}, buf_dualtag_1}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3830 = io_lsu_axi_r_bits_id == _GEN_377; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_3831 = _T_3829 & _T_3830; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_3832 = _T_3824 | _T_3831; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_3833 = bus_rsp_read & _T_3832; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_3834 = _T_3819 | _T_3833; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_120 = _T_3775 & _T_3834; // @[Conditional.scala 39:67]
  wire  _GEN_139 = _T_3741 ? 1'h0 : _GEN_120; // @[Conditional.scala 39:67]
  wire  _GEN_151 = _T_3737 ? 1'h0 : _GEN_139; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_151; // @[Conditional.scala 40:58]
  wire [3:0] _T_3869 = buf_ldfwd >> buf_dualtag_1; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_100 = 2'h1 == buf_dualtag_1 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_101 = 2'h2 == buf_dualtag_1 ? buf_ldfwdtag_2 : _GEN_100; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_102 = 2'h3 == buf_dualtag_1 ? buf_ldfwdtag_3 : _GEN_101; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_379 = {{1'd0}, _GEN_102}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3871 = io_lsu_axi_r_bits_id == _GEN_379; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_3872 = _T_3869[0] & _T_3871; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_3873 = _T_3830 | _T_3872; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_3874 = bus_rsp_read & _T_3873; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_114 = _T_3859 & _T_3874; // @[Conditional.scala 39:67]
  wire  _GEN_121 = _T_3775 ? buf_resp_state_bus_en_1 : _GEN_114; // @[Conditional.scala 39:67]
  wire  _GEN_131 = _T_3741 ? buf_cmd_state_bus_en_1 : _GEN_121; // @[Conditional.scala 39:67]
  wire  _GEN_144 = _T_3737 ? 1'h0 : _GEN_131; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_1 = _T_3714 ? 1'h0 : _GEN_144; // @[Conditional.scala 40:58]
  wire  _T_3754 = buf_state_bus_en_1 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3755 = _T_3754 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_3880 = RspPtr == 2'h1; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_3881 = buf_dualtag_1 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_3882 = buf_dual_1 & _T_3881; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_3883 = _T_3880 | _T_3882; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_3884 = _T_3883 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_109 = _T_3877 ? _T_3884 : _T_3885; // @[Conditional.scala 39:67]
  wire  _GEN_115 = _T_3859 ? _T_3755 : _GEN_109; // @[Conditional.scala 39:67]
  wire  _GEN_122 = _T_3775 ? _T_3755 : _GEN_115; // @[Conditional.scala 39:67]
  wire  _GEN_132 = _T_3741 ? _T_3755 : _GEN_122; // @[Conditional.scala 39:67]
  wire  _GEN_142 = _T_3737 ? obuf_rdrsp_pend_en : _GEN_132; // @[Conditional.scala 39:67]
  wire  buf_state_en_1 = _T_3714 ? _T_3730 : _GEN_142; // @[Conditional.scala 40:58]
  wire  _T_2163 = _T_1796 & buf_state_en_1; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2173 = _T_2069 & _T_1799; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2175 = _T_2173 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2176 = _T_4455 | _T_2175; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2180 = _T_2076 & _T_1800; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2182 = _T_2180 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2183 = _T_2176 | _T_2182; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2184 = _T_2163 & _T_2183; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2186 = _T_2184 | buf_age_1[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2200 = _T_2173 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2201 = _T_4460 | _T_2200; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2207 = _T_2180 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2208 = _T_2201 | _T_2207; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2209 = _T_2163 & _T_2208; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2211 = _T_2209 | buf_age_1[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2225 = _T_2173 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2226 = _T_4465 | _T_2225; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2232 = _T_2180 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2233 = _T_2226 | _T_2232; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2234 = _T_2163 & _T_2233; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2236 = _T_2234 | buf_age_1[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2250 = _T_2173 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2251 = _T_4470 | _T_2250; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2257 = _T_2180 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2258 = _T_2251 | _T_2257; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2259 = _T_2163 & _T_2258; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2261 = _T_2259 | buf_age_1[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2263 = {_T_2261,_T_2236,_T_2211}; // @[Cat.scala 29:58]
  wire  _T_3911 = 2'h2 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_3912 = _T_3530 & _T_3911; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_3914 = 2'h2 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_3915 = _T_3533 & _T_3914; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_3916 = _T_3912 | _T_3915; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_3917 = _T_853 & _T_3916; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_3918 = 2'h2 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_3919 = ibuf_drain_vld & _T_3918; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_3920 = _T_3917 | _T_3919; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_4008 = io_lsu_axi_b_bits_id == 3'h2; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4009 = bus_rsp_write & _T_4008; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4010 = io_lsu_axi_r_bits_id == 3'h2; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_380 = {{1'd0}, buf_ldfwdtag_2}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4012 = io_lsu_axi_r_bits_id == _GEN_380; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4013 = buf_ldfwd[2] & _T_4012; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4014 = _T_4010 | _T_4013; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4015 = buf_dual_2 & buf_dualhi_2; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4017 = ~buf_write[2]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4018 = _T_4015 & _T_4017; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4019 = _T_4018 & buf_samedw_2; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_2; // @[Reg.scala 27:20]
  wire [2:0] _GEN_381 = {{1'd0}, buf_dualtag_2}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4020 = io_lsu_axi_r_bits_id == _GEN_381; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4021 = _T_4019 & _T_4020; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4022 = _T_4014 | _T_4021; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4023 = bus_rsp_read & _T_4022; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4024 = _T_4009 | _T_4023; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_197 = _T_3965 & _T_4024; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_3931 ? 1'h0 : _GEN_197; // @[Conditional.scala 39:67]
  wire  _GEN_228 = _T_3927 ? 1'h0 : _GEN_216; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_228; // @[Conditional.scala 40:58]
  wire [3:0] _T_4059 = buf_ldfwd >> buf_dualtag_2; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_177 = 2'h1 == buf_dualtag_2 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_178 = 2'h2 == buf_dualtag_2 ? buf_ldfwdtag_2 : _GEN_177; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_179 = 2'h3 == buf_dualtag_2 ? buf_ldfwdtag_3 : _GEN_178; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_383 = {{1'd0}, _GEN_179}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4061 = io_lsu_axi_r_bits_id == _GEN_383; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4062 = _T_4059[0] & _T_4061; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_4063 = _T_4020 | _T_4062; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_4064 = bus_rsp_read & _T_4063; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_191 = _T_4049 & _T_4064; // @[Conditional.scala 39:67]
  wire  _GEN_198 = _T_3965 ? buf_resp_state_bus_en_2 : _GEN_191; // @[Conditional.scala 39:67]
  wire  _GEN_208 = _T_3931 ? buf_cmd_state_bus_en_2 : _GEN_198; // @[Conditional.scala 39:67]
  wire  _GEN_221 = _T_3927 ? 1'h0 : _GEN_208; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_2 = _T_3904 ? 1'h0 : _GEN_221; // @[Conditional.scala 40:58]
  wire  _T_3944 = buf_state_bus_en_2 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_3945 = _T_3944 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_4070 = RspPtr == 2'h2; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_4071 = buf_dualtag_2 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_4072 = buf_dual_2 & _T_4071; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_4073 = _T_4070 | _T_4072; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_4074 = _T_4073 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_186 = _T_4067 ? _T_4074 : _T_4075; // @[Conditional.scala 39:67]
  wire  _GEN_192 = _T_4049 ? _T_3945 : _GEN_186; // @[Conditional.scala 39:67]
  wire  _GEN_199 = _T_3965 ? _T_3945 : _GEN_192; // @[Conditional.scala 39:67]
  wire  _GEN_209 = _T_3931 ? _T_3945 : _GEN_199; // @[Conditional.scala 39:67]
  wire  _GEN_219 = _T_3927 ? obuf_rdrsp_pend_en : _GEN_209; // @[Conditional.scala 39:67]
  wire  buf_state_en_2 = _T_3904 ? _T_3920 : _GEN_219; // @[Conditional.scala 40:58]
  wire  _T_2265 = _T_1807 & buf_state_en_2; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2275 = _T_2069 & _T_1810; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2277 = _T_2275 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2278 = _T_4455 | _T_2277; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2282 = _T_2076 & _T_1811; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2284 = _T_2282 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2285 = _T_2278 | _T_2284; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2286 = _T_2265 & _T_2285; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2288 = _T_2286 | buf_age_2[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2302 = _T_2275 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2303 = _T_4460 | _T_2302; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2309 = _T_2282 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2310 = _T_2303 | _T_2309; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2311 = _T_2265 & _T_2310; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2313 = _T_2311 | buf_age_2[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2327 = _T_2275 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2328 = _T_4465 | _T_2327; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2334 = _T_2282 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2335 = _T_2328 | _T_2334; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2336 = _T_2265 & _T_2335; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2338 = _T_2336 | buf_age_2[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2352 = _T_2275 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2353 = _T_4470 | _T_2352; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2359 = _T_2282 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2360 = _T_2353 | _T_2359; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2361 = _T_2265 & _T_2360; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2363 = _T_2361 | buf_age_2[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2365 = {_T_2363,_T_2338,_T_2313}; // @[Cat.scala 29:58]
  wire  _T_4101 = 2'h3 == WrPtr0_r; // @[lsu_bus_buffer.scala 446:117]
  wire  _T_4102 = _T_3530 & _T_4101; // @[lsu_bus_buffer.scala 446:112]
  wire  _T_4104 = 2'h3 == WrPtr1_r; // @[lsu_bus_buffer.scala 446:166]
  wire  _T_4105 = _T_3533 & _T_4104; // @[lsu_bus_buffer.scala 446:161]
  wire  _T_4106 = _T_4102 | _T_4105; // @[lsu_bus_buffer.scala 446:132]
  wire  _T_4107 = _T_853 & _T_4106; // @[lsu_bus_buffer.scala 446:63]
  wire  _T_4108 = 2'h3 == ibuf_tag; // @[lsu_bus_buffer.scala 446:206]
  wire  _T_4109 = ibuf_drain_vld & _T_4108; // @[lsu_bus_buffer.scala 446:201]
  wire  _T_4110 = _T_4107 | _T_4109; // @[lsu_bus_buffer.scala 446:183]
  wire  _T_4198 = io_lsu_axi_b_bits_id == 3'h3; // @[lsu_bus_buffer.scala 473:73]
  wire  _T_4199 = bus_rsp_write & _T_4198; // @[lsu_bus_buffer.scala 473:52]
  wire  _T_4200 = io_lsu_axi_r_bits_id == 3'h3; // @[lsu_bus_buffer.scala 474:46]
  wire [2:0] _GEN_384 = {{1'd0}, buf_ldfwdtag_3}; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4202 = io_lsu_axi_r_bits_id == _GEN_384; // @[lsu_bus_buffer.scala 475:47]
  wire  _T_4203 = buf_ldfwd[3] & _T_4202; // @[lsu_bus_buffer.scala 475:27]
  wire  _T_4204 = _T_4200 | _T_4203; // @[lsu_bus_buffer.scala 474:77]
  wire  _T_4205 = buf_dual_3 & buf_dualhi_3; // @[lsu_bus_buffer.scala 476:26]
  wire  _T_4207 = ~buf_write[3]; // @[lsu_bus_buffer.scala 476:44]
  wire  _T_4208 = _T_4205 & _T_4207; // @[lsu_bus_buffer.scala 476:42]
  wire  _T_4209 = _T_4208 & buf_samedw_3; // @[lsu_bus_buffer.scala 476:58]
  reg [1:0] buf_dualtag_3; // @[Reg.scala 27:20]
  wire [2:0] _GEN_385 = {{1'd0}, buf_dualtag_3}; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4210 = io_lsu_axi_r_bits_id == _GEN_385; // @[lsu_bus_buffer.scala 476:94]
  wire  _T_4211 = _T_4209 & _T_4210; // @[lsu_bus_buffer.scala 476:74]
  wire  _T_4212 = _T_4204 | _T_4211; // @[lsu_bus_buffer.scala 475:71]
  wire  _T_4213 = bus_rsp_read & _T_4212; // @[lsu_bus_buffer.scala 474:25]
  wire  _T_4214 = _T_4199 | _T_4213; // @[lsu_bus_buffer.scala 473:105]
  wire  _GEN_274 = _T_4155 & _T_4214; // @[Conditional.scala 39:67]
  wire  _GEN_293 = _T_4121 ? 1'h0 : _GEN_274; // @[Conditional.scala 39:67]
  wire  _GEN_305 = _T_4117 ? 1'h0 : _GEN_293; // @[Conditional.scala 39:67]
  wire  buf_resp_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_305; // @[Conditional.scala 40:58]
  wire [3:0] _T_4249 = buf_ldfwd >> buf_dualtag_3; // @[lsu_bus_buffer.scala 489:21]
  wire [1:0] _GEN_254 = 2'h1 == buf_dualtag_3 ? buf_ldfwdtag_1 : buf_ldfwdtag_0; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_255 = 2'h2 == buf_dualtag_3 ? buf_ldfwdtag_2 : _GEN_254; // @[lsu_bus_buffer.scala 489:58]
  wire [1:0] _GEN_256 = 2'h3 == buf_dualtag_3 ? buf_ldfwdtag_3 : _GEN_255; // @[lsu_bus_buffer.scala 489:58]
  wire [2:0] _GEN_387 = {{1'd0}, _GEN_256}; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4251 = io_lsu_axi_r_bits_id == _GEN_387; // @[lsu_bus_buffer.scala 489:58]
  wire  _T_4252 = _T_4249[0] & _T_4251; // @[lsu_bus_buffer.scala 489:38]
  wire  _T_4253 = _T_4210 | _T_4252; // @[lsu_bus_buffer.scala 488:95]
  wire  _T_4254 = bus_rsp_read & _T_4253; // @[lsu_bus_buffer.scala 488:45]
  wire  _GEN_268 = _T_4239 & _T_4254; // @[Conditional.scala 39:67]
  wire  _GEN_275 = _T_4155 ? buf_resp_state_bus_en_3 : _GEN_268; // @[Conditional.scala 39:67]
  wire  _GEN_285 = _T_4121 ? buf_cmd_state_bus_en_3 : _GEN_275; // @[Conditional.scala 39:67]
  wire  _GEN_298 = _T_4117 ? 1'h0 : _GEN_285; // @[Conditional.scala 39:67]
  wire  buf_state_bus_en_3 = _T_4094 ? 1'h0 : _GEN_298; // @[Conditional.scala 40:58]
  wire  _T_4134 = buf_state_bus_en_3 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 461:49]
  wire  _T_4135 = _T_4134 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 461:70]
  wire  _T_4260 = RspPtr == 2'h3; // @[lsu_bus_buffer.scala 495:37]
  wire  _T_4261 = buf_dualtag_3 == RspPtr; // @[lsu_bus_buffer.scala 495:98]
  wire  _T_4262 = buf_dual_3 & _T_4261; // @[lsu_bus_buffer.scala 495:80]
  wire  _T_4263 = _T_4260 | _T_4262; // @[lsu_bus_buffer.scala 495:65]
  wire  _T_4264 = _T_4263 | io_dec_tlu_force_halt; // @[lsu_bus_buffer.scala 495:112]
  wire  _GEN_263 = _T_4257 ? _T_4264 : _T_4265; // @[Conditional.scala 39:67]
  wire  _GEN_269 = _T_4239 ? _T_4135 : _GEN_263; // @[Conditional.scala 39:67]
  wire  _GEN_276 = _T_4155 ? _T_4135 : _GEN_269; // @[Conditional.scala 39:67]
  wire  _GEN_286 = _T_4121 ? _T_4135 : _GEN_276; // @[Conditional.scala 39:67]
  wire  _GEN_296 = _T_4117 ? obuf_rdrsp_pend_en : _GEN_286; // @[Conditional.scala 39:67]
  wire  buf_state_en_3 = _T_4094 ? _T_4110 : _GEN_296; // @[Conditional.scala 40:58]
  wire  _T_2367 = _T_1818 & buf_state_en_3; // @[lsu_bus_buffer.scala 408:94]
  wire  _T_2377 = _T_2069 & _T_1821; // @[lsu_bus_buffer.scala 410:71]
  wire  _T_2379 = _T_2377 & _T_1786; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2380 = _T_4455 | _T_2379; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2384 = _T_2076 & _T_1822; // @[lsu_bus_buffer.scala 411:52]
  wire  _T_2386 = _T_2384 & _T_1788; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2387 = _T_2380 | _T_2386; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2388 = _T_2367 & _T_2387; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2390 = _T_2388 | buf_age_3[0]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2404 = _T_2377 & _T_1797; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2405 = _T_4460 | _T_2404; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2411 = _T_2384 & _T_1799; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2412 = _T_2405 | _T_2411; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2413 = _T_2367 & _T_2412; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2415 = _T_2413 | buf_age_3[1]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2429 = _T_2377 & _T_1808; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2430 = _T_4465 | _T_2429; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2436 = _T_2384 & _T_1810; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2437 = _T_2430 | _T_2436; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2438 = _T_2367 & _T_2437; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2440 = _T_2438 | buf_age_3[2]; // @[lsu_bus_buffer.scala 411:97]
  wire  _T_2454 = _T_2377 & _T_1819; // @[lsu_bus_buffer.scala 410:92]
  wire  _T_2455 = _T_4470 | _T_2454; // @[lsu_bus_buffer.scala 409:86]
  wire  _T_2461 = _T_2384 & _T_1821; // @[lsu_bus_buffer.scala 411:73]
  wire  _T_2462 = _T_2455 | _T_2461; // @[lsu_bus_buffer.scala 410:114]
  wire  _T_2463 = _T_2367 & _T_2462; // @[lsu_bus_buffer.scala 408:113]
  wire  _T_2465 = _T_2463 | buf_age_3[3]; // @[lsu_bus_buffer.scala 411:97]
  wire [2:0] _T_2467 = {_T_2465,_T_2440,_T_2415}; // @[Cat.scala 29:58]
  wire  _T_2763 = buf_state_0 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2764 = _T_1785 | _T_2763; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2765 = ~_T_2764; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2773 = _T_2765 | _T_2073; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2780 = _T_2773 | _T_2080; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2781 = _T_2061 & _T_2780; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2785 = buf_state_1 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2786 = _T_1796 | _T_2785; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2787 = ~_T_2786; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2795 = _T_2787 | _T_2098; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2802 = _T_2795 | _T_2105; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2803 = _T_2061 & _T_2802; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2807 = buf_state_2 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2808 = _T_1807 | _T_2807; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2809 = ~_T_2808; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2817 = _T_2809 | _T_2123; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2824 = _T_2817 | _T_2130; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2825 = _T_2061 & _T_2824; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2829 = buf_state_3 == 3'h6; // @[lsu_bus_buffer.scala 419:47]
  wire  _T_2830 = _T_1818 | _T_2829; // @[lsu_bus_buffer.scala 419:32]
  wire  _T_2831 = ~_T_2830; // @[lsu_bus_buffer.scala 419:6]
  wire  _T_2839 = _T_2831 | _T_2148; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2846 = _T_2839 | _T_2155; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2847 = _T_2061 & _T_2846; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_0 = {_T_2847,_T_2825,_T_2803,_T_2781}; // @[Cat.scala 29:58]
  wire  _T_2864 = _T_2765 | _T_2175; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2871 = _T_2864 | _T_2182; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2872 = _T_2163 & _T_2871; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2886 = _T_2787 | _T_2200; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2893 = _T_2886 | _T_2207; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2894 = _T_2163 & _T_2893; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2908 = _T_2809 | _T_2225; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2915 = _T_2908 | _T_2232; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2916 = _T_2163 & _T_2915; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2930 = _T_2831 | _T_2250; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2937 = _T_2930 | _T_2257; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2938 = _T_2163 & _T_2937; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_1 = {_T_2938,_T_2916,_T_2894,_T_2872}; // @[Cat.scala 29:58]
  wire  _T_2955 = _T_2765 | _T_2277; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2962 = _T_2955 | _T_2284; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2963 = _T_2265 & _T_2962; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2977 = _T_2787 | _T_2302; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_2984 = _T_2977 | _T_2309; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_2985 = _T_2265 & _T_2984; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_2999 = _T_2809 | _T_2327; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3006 = _T_2999 | _T_2334; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3007 = _T_2265 & _T_3006; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3021 = _T_2831 | _T_2352; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3028 = _T_3021 | _T_2359; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3029 = _T_2265 & _T_3028; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_2 = {_T_3029,_T_3007,_T_2985,_T_2963}; // @[Cat.scala 29:58]
  wire  _T_3046 = _T_2765 | _T_2379; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3053 = _T_3046 | _T_2386; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3054 = _T_2367 & _T_3053; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3068 = _T_2787 | _T_2404; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3075 = _T_3068 | _T_2411; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3076 = _T_2367 & _T_3075; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3090 = _T_2809 | _T_2429; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3097 = _T_3090 | _T_2436; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3098 = _T_2367 & _T_3097; // @[lsu_bus_buffer.scala 418:112]
  wire  _T_3112 = _T_2831 | _T_2454; // @[lsu_bus_buffer.scala 419:59]
  wire  _T_3119 = _T_3112 | _T_2461; // @[lsu_bus_buffer.scala 420:110]
  wire  _T_3120 = _T_2367 & _T_3119; // @[lsu_bus_buffer.scala 418:112]
  wire [3:0] buf_rspage_set_3 = {_T_3120,_T_3098,_T_3076,_T_3054}; // @[Cat.scala 29:58]
  wire  _T_3211 = _T_2829 | _T_1818; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3212 = ~_T_3211; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3213 = buf_rspageQ_0[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3215 = _T_3213 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3203 = _T_2807 | _T_1807; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3204 = ~_T_3203; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3205 = buf_rspageQ_0[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3207 = _T_3205 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3195 = _T_2785 | _T_1796; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3196 = ~_T_3195; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3197 = buf_rspageQ_0[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3199 = _T_3197 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3187 = _T_2763 | _T_1785; // @[lsu_bus_buffer.scala 423:110]
  wire  _T_3188 = ~_T_3187; // @[lsu_bus_buffer.scala 423:84]
  wire  _T_3189 = buf_rspageQ_0[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3191 = _T_3189 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_0 = {_T_3215,_T_3207,_T_3199,_T_3191}; // @[Cat.scala 29:58]
  wire  _T_3126 = buf_rspage_set_0[0] | buf_rspage_0[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3129 = buf_rspage_set_0[1] | buf_rspage_0[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3132 = buf_rspage_set_0[2] | buf_rspage_0[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3135 = buf_rspage_set_0[3] | buf_rspage_0[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3137 = {_T_3135,_T_3132,_T_3129}; // @[Cat.scala 29:58]
  wire  _T_3248 = buf_rspageQ_1[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3250 = _T_3248 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3240 = buf_rspageQ_1[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3242 = _T_3240 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3232 = buf_rspageQ_1[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3234 = _T_3232 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3224 = buf_rspageQ_1[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3226 = _T_3224 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_1 = {_T_3250,_T_3242,_T_3234,_T_3226}; // @[Cat.scala 29:58]
  wire  _T_3141 = buf_rspage_set_1[0] | buf_rspage_1[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3144 = buf_rspage_set_1[1] | buf_rspage_1[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3147 = buf_rspage_set_1[2] | buf_rspage_1[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3150 = buf_rspage_set_1[3] | buf_rspage_1[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3152 = {_T_3150,_T_3147,_T_3144}; // @[Cat.scala 29:58]
  wire  _T_3283 = buf_rspageQ_2[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3285 = _T_3283 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3275 = buf_rspageQ_2[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3277 = _T_3275 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3267 = buf_rspageQ_2[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3269 = _T_3267 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3259 = buf_rspageQ_2[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3261 = _T_3259 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_2 = {_T_3285,_T_3277,_T_3269,_T_3261}; // @[Cat.scala 29:58]
  wire  _T_3156 = buf_rspage_set_2[0] | buf_rspage_2[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3159 = buf_rspage_set_2[1] | buf_rspage_2[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3162 = buf_rspage_set_2[2] | buf_rspage_2[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3165 = buf_rspage_set_2[3] | buf_rspage_2[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3167 = {_T_3165,_T_3162,_T_3159}; // @[Cat.scala 29:58]
  wire  _T_3318 = buf_rspageQ_3[3] & _T_3212; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3320 = _T_3318 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3310 = buf_rspageQ_3[2] & _T_3204; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3312 = _T_3310 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3302 = buf_rspageQ_3[1] & _T_3196; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3304 = _T_3302 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire  _T_3294 = buf_rspageQ_3[0] & _T_3188; // @[lsu_bus_buffer.scala 423:82]
  wire  _T_3296 = _T_3294 & _T_2587; // @[lsu_bus_buffer.scala 423:145]
  wire [3:0] buf_rspage_3 = {_T_3320,_T_3312,_T_3304,_T_3296}; // @[Cat.scala 29:58]
  wire  _T_3171 = buf_rspage_set_3[0] | buf_rspage_3[0]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3174 = buf_rspage_set_3[1] | buf_rspage_3[1]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3177 = buf_rspage_set_3[2] | buf_rspage_3[2]; // @[lsu_bus_buffer.scala 422:88]
  wire  _T_3180 = buf_rspage_set_3[3] | buf_rspage_3[3]; // @[lsu_bus_buffer.scala 422:88]
  wire [2:0] _T_3182 = {_T_3180,_T_3177,_T_3174}; // @[Cat.scala 29:58]
  wire  _T_3325 = ibuf_drain_vld & _T_1786; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3327 = ibuf_drain_vld & _T_1797; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3329 = ibuf_drain_vld & _T_1808; // @[lsu_bus_buffer.scala 428:63]
  wire  _T_3331 = ibuf_drain_vld & _T_1819; // @[lsu_bus_buffer.scala 428:63]
  wire [3:0] ibuf_drainvec_vld = {_T_3331,_T_3329,_T_3327,_T_3325}; // @[Cat.scala 29:58]
  wire  _T_3339 = _T_3533 & _T_1789; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3348 = _T_3533 & _T_1800; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3357 = _T_3533 & _T_1811; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3366 = _T_3533 & _T_1822; // @[lsu_bus_buffer.scala 430:35]
  wire  _T_3396 = ibuf_drainvec_vld[0] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3398 = ibuf_drainvec_vld[1] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3400 = ibuf_drainvec_vld[2] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire  _T_3402 = ibuf_drainvec_vld[3] ? ibuf_dual : io_ldst_dual_r; // @[lsu_bus_buffer.scala 432:45]
  wire [3:0] buf_dual_in = {_T_3402,_T_3400,_T_3398,_T_3396}; // @[Cat.scala 29:58]
  wire  _T_3407 = ibuf_drainvec_vld[0] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3409 = ibuf_drainvec_vld[1] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3411 = ibuf_drainvec_vld[2] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire  _T_3413 = ibuf_drainvec_vld[3] ? ibuf_samedw : ldst_samedw_r; // @[lsu_bus_buffer.scala 433:47]
  wire [3:0] buf_samedw_in = {_T_3413,_T_3411,_T_3409,_T_3407}; // @[Cat.scala 29:58]
  wire  _T_3418 = ibuf_nomerge | ibuf_force_drain; // @[lsu_bus_buffer.scala 434:84]
  wire  _T_3419 = ibuf_drainvec_vld[0] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3422 = ibuf_drainvec_vld[1] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3425 = ibuf_drainvec_vld[2] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire  _T_3428 = ibuf_drainvec_vld[3] ? _T_3418 : io_no_dword_merge_r; // @[lsu_bus_buffer.scala 434:48]
  wire [3:0] buf_nomerge_in = {_T_3428,_T_3425,_T_3422,_T_3419}; // @[Cat.scala 29:58]
  wire  _T_3436 = ibuf_drainvec_vld[0] ? ibuf_dual : _T_3339; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3441 = ibuf_drainvec_vld[1] ? ibuf_dual : _T_3348; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3446 = ibuf_drainvec_vld[2] ? ibuf_dual : _T_3357; // @[lsu_bus_buffer.scala 435:47]
  wire  _T_3451 = ibuf_drainvec_vld[3] ? ibuf_dual : _T_3366; // @[lsu_bus_buffer.scala 435:47]
  wire [3:0] buf_dualhi_in = {_T_3451,_T_3446,_T_3441,_T_3436}; // @[Cat.scala 29:58]
  wire  _T_3480 = ibuf_drainvec_vld[0] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3482 = ibuf_drainvec_vld[1] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3484 = ibuf_drainvec_vld[2] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire  _T_3486 = ibuf_drainvec_vld[3] ? ibuf_sideeffect : io_is_sideeffects_r; // @[lsu_bus_buffer.scala 437:51]
  wire [3:0] buf_sideeffect_in = {_T_3486,_T_3484,_T_3482,_T_3480}; // @[Cat.scala 29:58]
  wire  _T_3491 = ibuf_drainvec_vld[0] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3493 = ibuf_drainvec_vld[1] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3495 = ibuf_drainvec_vld[2] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire  _T_3497 = ibuf_drainvec_vld[3] ? ibuf_unsign : io_lsu_pkt_r_bits_unsign; // @[lsu_bus_buffer.scala 438:47]
  wire [3:0] buf_unsign_in = {_T_3497,_T_3495,_T_3493,_T_3491}; // @[Cat.scala 29:58]
  wire  _T_3514 = ibuf_drainvec_vld[0] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3516 = ibuf_drainvec_vld[1] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3518 = ibuf_drainvec_vld[2] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire  _T_3520 = ibuf_drainvec_vld[3] ? ibuf_write : io_lsu_pkt_r_bits_store; // @[lsu_bus_buffer.scala 440:46]
  wire [3:0] buf_write_in = {_T_3520,_T_3518,_T_3516,_T_3514}; // @[Cat.scala 29:58]
  wire  _T_3553 = obuf_nosend & bus_rsp_read; // @[lsu_bus_buffer.scala 458:89]
  wire  _T_3555 = _T_3553 & _T_1349; // @[lsu_bus_buffer.scala 458:104]
  wire  _T_3568 = buf_state_en_0 & _T_3637; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3569 = _T_3568 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3571 = _T_3569 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3574 = _T_3564 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3575 = _T_3574 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_4830 = io_lsu_axi_r_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 572:64]
  wire  bus_rsp_read_error = bus_rsp_read & _T_4830; // @[lsu_bus_buffer.scala 572:38]
  wire  _T_3578 = _T_3574 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_3651 = bus_rsp_read_error & _T_3630; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3653 = bus_rsp_read_error & buf_ldfwd[0]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3655 = _T_3653 & _T_3632; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3656 = _T_3651 | _T_3655; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4828 = io_lsu_axi_b_bits_resp != 2'h0; // @[lsu_bus_buffer.scala 571:66]
  wire  bus_rsp_write_error = bus_rsp_write & _T_4828; // @[lsu_bus_buffer.scala 571:40]
  wire  _T_3658 = bus_rsp_write_error & _T_3628; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3659 = _T_3656 | _T_3658; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3660 = _T_3564 & _T_3659; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_47 = _T_3585 & _T_3660; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_3551 ? _T_3578 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_3547 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  buf_error_en_0 = _T_3524 ? 1'h0 : _GEN_72; // @[Conditional.scala 40:58]
  wire  _T_3587 = buf_write[0] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3588 = io_dec_tlu_force_halt | _T_3587; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3590 = ~buf_samedw_0; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3591 = buf_dual_0 & _T_3590; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3594 = _T_3591 & _T_3637; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_19 = 2'h1 == buf_dualtag_0 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_20 = 2'h2 == buf_dualtag_0 ? buf_state_2 : _GEN_19; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_21 = 2'h3 == buf_dualtag_0 ? buf_state_3 : _GEN_20; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3595 = _GEN_21 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3596 = _T_3594 & _T_3595; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4478 = _T_2710 | _T_2707; // @[lsu_bus_buffer.scala 532:93]
  wire  _T_4479 = _T_4478 | _T_2704; // @[lsu_bus_buffer.scala 532:93]
  wire  any_done_wait_state = _T_4479 | _T_2701; // @[lsu_bus_buffer.scala 532:93]
  wire  _T_3598 = buf_ldfwd[0] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3604 = buf_dualtag_0 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3606 = buf_dualtag_0 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3608 = buf_dualtag_0 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3610 = buf_dualtag_0 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3612 = _T_3604 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3613 = _T_3606 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3614 = _T_3608 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3615 = _T_3610 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3616 = _T_3612 | _T_3613; // @[Mux.scala 27:72]
  wire  _T_3617 = _T_3616 | _T_3614; // @[Mux.scala 27:72]
  wire  _T_3618 = _T_3617 | _T_3615; // @[Mux.scala 27:72]
  wire  _T_3620 = _T_3594 & _T_3618; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3621 = _GEN_21 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3622 = _T_3620 & _T_3621; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3623 = _T_3622 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3624 = _T_3598 | _T_3623; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3647 = buf_state_bus_en_0 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3648 = _T_3647 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3661 = ~buf_error_en_0; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3662 = buf_state_en_0 & _T_3661; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3674 = buf_ldfwd[0] | _T_3679[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_3675 = _T_3674 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_27 = _T_3695 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_3695 ? buf_state_en_0 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_3687 ? io_dec_tlu_force_halt : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_3687 ? io_dec_tlu_force_halt : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_3669 ? io_dec_tlu_force_halt : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_3669 ? io_dec_tlu_force_halt : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_3585 & _T_3648; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_3585 ? io_dec_tlu_force_halt : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_51 = _T_3585 ? io_dec_tlu_force_halt : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_3551 ? _T_3571 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_3551 ? _T_3575 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_3551 ? io_dec_tlu_force_halt : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_3547 ? io_dec_tlu_force_halt : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_3547 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_3547 ? io_dec_tlu_force_halt : _GEN_63; // @[Conditional.scala 39:67]
  wire  buf_wr_en_0 = _T_3524 & buf_state_en_0; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_0 = _T_3524 ? io_dec_tlu_force_halt : _GEN_69; // @[Conditional.scala 40:58]
  wire  buf_rst_0 = _T_3524 ? io_dec_tlu_force_halt : _GEN_75; // @[Conditional.scala 40:58]
  wire  _T_3758 = buf_state_en_1 & _T_3827; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3759 = _T_3758 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3761 = _T_3759 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3764 = _T_3754 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3765 = _T_3764 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_3768 = _T_3764 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_3841 = bus_rsp_read_error & _T_3820; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_3843 = bus_rsp_read_error & buf_ldfwd[1]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_3845 = _T_3843 & _T_3822; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_3846 = _T_3841 | _T_3845; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_3848 = bus_rsp_write_error & _T_3818; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_3849 = _T_3846 | _T_3848; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_3850 = _T_3754 & _T_3849; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_124 = _T_3775 & _T_3850; // @[Conditional.scala 39:67]
  wire  _GEN_137 = _T_3741 ? _T_3768 : _GEN_124; // @[Conditional.scala 39:67]
  wire  _GEN_149 = _T_3737 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67]
  wire  buf_error_en_1 = _T_3714 ? 1'h0 : _GEN_149; // @[Conditional.scala 40:58]
  wire  _T_3777 = buf_write[1] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3778 = io_dec_tlu_force_halt | _T_3777; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3780 = ~buf_samedw_1; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3781 = buf_dual_1 & _T_3780; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3784 = _T_3781 & _T_3827; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_96 = 2'h1 == buf_dualtag_1 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_97 = 2'h2 == buf_dualtag_1 ? buf_state_2 : _GEN_96; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_98 = 2'h3 == buf_dualtag_1 ? buf_state_3 : _GEN_97; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3785 = _GEN_98 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3786 = _T_3784 & _T_3785; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3788 = buf_ldfwd[1] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3794 = buf_dualtag_1 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3796 = buf_dualtag_1 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3798 = buf_dualtag_1 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3800 = buf_dualtag_1 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3802 = _T_3794 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3803 = _T_3796 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3804 = _T_3798 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3805 = _T_3800 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3806 = _T_3802 | _T_3803; // @[Mux.scala 27:72]
  wire  _T_3807 = _T_3806 | _T_3804; // @[Mux.scala 27:72]
  wire  _T_3808 = _T_3807 | _T_3805; // @[Mux.scala 27:72]
  wire  _T_3810 = _T_3784 & _T_3808; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_3811 = _GEN_98 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_3812 = _T_3810 & _T_3811; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_3813 = _T_3812 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_3814 = _T_3788 | _T_3813; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_3837 = buf_state_bus_en_1 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_3838 = _T_3837 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_3851 = ~buf_error_en_1; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_3852 = buf_state_en_1 & _T_3851; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_3864 = buf_ldfwd[1] | _T_3869[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_3865 = _T_3864 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_104 = _T_3885 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_107 = _T_3885 ? buf_state_en_1 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_111 = _T_3877 ? io_dec_tlu_force_halt : _GEN_104; // @[Conditional.scala 39:67]
  wire  _GEN_112 = _T_3877 ? io_dec_tlu_force_halt : _GEN_107; // @[Conditional.scala 39:67]
  wire  _GEN_117 = _T_3859 ? io_dec_tlu_force_halt : _GEN_111; // @[Conditional.scala 39:67]
  wire  _GEN_118 = _T_3859 ? io_dec_tlu_force_halt : _GEN_112; // @[Conditional.scala 39:67]
  wire  _GEN_123 = _T_3775 & _T_3838; // @[Conditional.scala 39:67]
  wire  _GEN_127 = _T_3775 ? io_dec_tlu_force_halt : _GEN_117; // @[Conditional.scala 39:67]
  wire  _GEN_128 = _T_3775 ? io_dec_tlu_force_halt : _GEN_118; // @[Conditional.scala 39:67]
  wire  _GEN_134 = _T_3741 ? _T_3761 : _GEN_128; // @[Conditional.scala 39:67]
  wire  _GEN_136 = _T_3741 ? _T_3765 : _GEN_123; // @[Conditional.scala 39:67]
  wire  _GEN_140 = _T_3741 ? io_dec_tlu_force_halt : _GEN_127; // @[Conditional.scala 39:67]
  wire  _GEN_146 = _T_3737 ? io_dec_tlu_force_halt : _GEN_134; // @[Conditional.scala 39:67]
  wire  _GEN_148 = _T_3737 ? 1'h0 : _GEN_136; // @[Conditional.scala 39:67]
  wire  _GEN_152 = _T_3737 ? io_dec_tlu_force_halt : _GEN_140; // @[Conditional.scala 39:67]
  wire  buf_wr_en_1 = _T_3714 & buf_state_en_1; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_1 = _T_3714 ? io_dec_tlu_force_halt : _GEN_146; // @[Conditional.scala 40:58]
  wire  buf_rst_1 = _T_3714 ? io_dec_tlu_force_halt : _GEN_152; // @[Conditional.scala 40:58]
  wire  _T_3948 = buf_state_en_2 & _T_4017; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_3949 = _T_3948 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_3951 = _T_3949 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_3954 = _T_3944 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_3955 = _T_3954 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_3958 = _T_3954 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_4031 = bus_rsp_read_error & _T_4010; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4033 = bus_rsp_read_error & buf_ldfwd[2]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4035 = _T_4033 & _T_4012; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4036 = _T_4031 | _T_4035; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4038 = bus_rsp_write_error & _T_4008; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4039 = _T_4036 | _T_4038; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4040 = _T_3944 & _T_4039; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_201 = _T_3965 & _T_4040; // @[Conditional.scala 39:67]
  wire  _GEN_214 = _T_3931 ? _T_3958 : _GEN_201; // @[Conditional.scala 39:67]
  wire  _GEN_226 = _T_3927 ? 1'h0 : _GEN_214; // @[Conditional.scala 39:67]
  wire  buf_error_en_2 = _T_3904 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58]
  wire  _T_3967 = buf_write[2] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_3968 = io_dec_tlu_force_halt | _T_3967; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_3970 = ~buf_samedw_2; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_3971 = buf_dual_2 & _T_3970; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_3974 = _T_3971 & _T_4017; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_173 = 2'h1 == buf_dualtag_2 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_174 = 2'h2 == buf_dualtag_2 ? buf_state_2 : _GEN_173; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_175 = 2'h3 == buf_dualtag_2 ? buf_state_3 : _GEN_174; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3975 = _GEN_175 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_3976 = _T_3974 & _T_3975; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_3978 = buf_ldfwd[2] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_3984 = buf_dualtag_2 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3986 = buf_dualtag_2 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3988 = buf_dualtag_2 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3990 = buf_dualtag_2 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_3992 = _T_3984 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_3993 = _T_3986 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_3994 = _T_3988 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_3995 = _T_3990 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_3996 = _T_3992 | _T_3993; // @[Mux.scala 27:72]
  wire  _T_3997 = _T_3996 | _T_3994; // @[Mux.scala 27:72]
  wire  _T_3998 = _T_3997 | _T_3995; // @[Mux.scala 27:72]
  wire  _T_4000 = _T_3974 & _T_3998; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4001 = _GEN_175 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4002 = _T_4000 & _T_4001; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4003 = _T_4002 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4004 = _T_3978 | _T_4003; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4027 = buf_state_bus_en_2 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4028 = _T_4027 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4041 = ~buf_error_en_2; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4042 = buf_state_en_2 & _T_4041; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4054 = buf_ldfwd[2] | _T_4059[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_4055 = _T_4054 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_181 = _T_4075 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_4075 ? buf_state_en_2 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_188 = _T_4067 ? io_dec_tlu_force_halt : _GEN_181; // @[Conditional.scala 39:67]
  wire  _GEN_189 = _T_4067 ? io_dec_tlu_force_halt : _GEN_184; // @[Conditional.scala 39:67]
  wire  _GEN_194 = _T_4049 ? io_dec_tlu_force_halt : _GEN_188; // @[Conditional.scala 39:67]
  wire  _GEN_195 = _T_4049 ? io_dec_tlu_force_halt : _GEN_189; // @[Conditional.scala 39:67]
  wire  _GEN_200 = _T_3965 & _T_4028; // @[Conditional.scala 39:67]
  wire  _GEN_204 = _T_3965 ? io_dec_tlu_force_halt : _GEN_194; // @[Conditional.scala 39:67]
  wire  _GEN_205 = _T_3965 ? io_dec_tlu_force_halt : _GEN_195; // @[Conditional.scala 39:67]
  wire  _GEN_211 = _T_3931 ? _T_3951 : _GEN_205; // @[Conditional.scala 39:67]
  wire  _GEN_213 = _T_3931 ? _T_3955 : _GEN_200; // @[Conditional.scala 39:67]
  wire  _GEN_217 = _T_3931 ? io_dec_tlu_force_halt : _GEN_204; // @[Conditional.scala 39:67]
  wire  _GEN_223 = _T_3927 ? io_dec_tlu_force_halt : _GEN_211; // @[Conditional.scala 39:67]
  wire  _GEN_225 = _T_3927 ? 1'h0 : _GEN_213; // @[Conditional.scala 39:67]
  wire  _GEN_229 = _T_3927 ? io_dec_tlu_force_halt : _GEN_217; // @[Conditional.scala 39:67]
  wire  buf_wr_en_2 = _T_3904 & buf_state_en_2; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_2 = _T_3904 ? io_dec_tlu_force_halt : _GEN_223; // @[Conditional.scala 40:58]
  wire  buf_rst_2 = _T_3904 ? io_dec_tlu_force_halt : _GEN_229; // @[Conditional.scala 40:58]
  wire  _T_4138 = buf_state_en_3 & _T_4207; // @[lsu_bus_buffer.scala 463:44]
  wire  _T_4139 = _T_4138 & obuf_nosend; // @[lsu_bus_buffer.scala 463:60]
  wire  _T_4141 = _T_4139 & _T_2587; // @[lsu_bus_buffer.scala 463:74]
  wire  _T_4144 = _T_4134 & obuf_nosend; // @[lsu_bus_buffer.scala 465:67]
  wire  _T_4145 = _T_4144 & bus_rsp_read; // @[lsu_bus_buffer.scala 465:81]
  wire  _T_4148 = _T_4144 & bus_rsp_read_error; // @[lsu_bus_buffer.scala 466:82]
  wire  _T_4221 = bus_rsp_read_error & _T_4200; // @[lsu_bus_buffer.scala 480:91]
  wire  _T_4223 = bus_rsp_read_error & buf_ldfwd[3]; // @[lsu_bus_buffer.scala 481:31]
  wire  _T_4225 = _T_4223 & _T_4202; // @[lsu_bus_buffer.scala 481:46]
  wire  _T_4226 = _T_4221 | _T_4225; // @[lsu_bus_buffer.scala 480:143]
  wire  _T_4228 = bus_rsp_write_error & _T_4198; // @[lsu_bus_buffer.scala 482:33]
  wire  _T_4229 = _T_4226 | _T_4228; // @[lsu_bus_buffer.scala 481:88]
  wire  _T_4230 = _T_4134 & _T_4229; // @[lsu_bus_buffer.scala 480:68]
  wire  _GEN_278 = _T_4155 & _T_4230; // @[Conditional.scala 39:67]
  wire  _GEN_291 = _T_4121 ? _T_4148 : _GEN_278; // @[Conditional.scala 39:67]
  wire  _GEN_303 = _T_4117 ? 1'h0 : _GEN_291; // @[Conditional.scala 39:67]
  wire  buf_error_en_3 = _T_4094 ? 1'h0 : _GEN_303; // @[Conditional.scala 40:58]
  wire  _T_4157 = buf_write[3] & bus_rsp_write_error; // @[lsu_bus_buffer.scala 470:71]
  wire  _T_4158 = io_dec_tlu_force_halt | _T_4157; // @[lsu_bus_buffer.scala 470:55]
  wire  _T_4160 = ~buf_samedw_3; // @[lsu_bus_buffer.scala 471:30]
  wire  _T_4161 = buf_dual_3 & _T_4160; // @[lsu_bus_buffer.scala 471:28]
  wire  _T_4164 = _T_4161 & _T_4207; // @[lsu_bus_buffer.scala 471:45]
  wire [2:0] _GEN_250 = 2'h1 == buf_dualtag_3 ? buf_state_1 : buf_state_0; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_251 = 2'h2 == buf_dualtag_3 ? buf_state_2 : _GEN_250; // @[lsu_bus_buffer.scala 471:90]
  wire [2:0] _GEN_252 = 2'h3 == buf_dualtag_3 ? buf_state_3 : _GEN_251; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4165 = _GEN_252 != 3'h4; // @[lsu_bus_buffer.scala 471:90]
  wire  _T_4166 = _T_4164 & _T_4165; // @[lsu_bus_buffer.scala 471:61]
  wire  _T_4168 = buf_ldfwd[3] | any_done_wait_state; // @[lsu_bus_buffer.scala 472:31]
  wire  _T_4174 = buf_dualtag_3 == 2'h0; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4176 = buf_dualtag_3 == 2'h1; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4178 = buf_dualtag_3 == 2'h2; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4180 = buf_dualtag_3 == 2'h3; // @[lsu_bus_buffer.scala 60:118]
  wire  _T_4182 = _T_4174 & buf_ldfwd[0]; // @[Mux.scala 27:72]
  wire  _T_4183 = _T_4176 & buf_ldfwd[1]; // @[Mux.scala 27:72]
  wire  _T_4184 = _T_4178 & buf_ldfwd[2]; // @[Mux.scala 27:72]
  wire  _T_4185 = _T_4180 & buf_ldfwd[3]; // @[Mux.scala 27:72]
  wire  _T_4186 = _T_4182 | _T_4183; // @[Mux.scala 27:72]
  wire  _T_4187 = _T_4186 | _T_4184; // @[Mux.scala 27:72]
  wire  _T_4188 = _T_4187 | _T_4185; // @[Mux.scala 27:72]
  wire  _T_4190 = _T_4164 & _T_4188; // @[lsu_bus_buffer.scala 472:101]
  wire  _T_4191 = _GEN_252 == 3'h4; // @[lsu_bus_buffer.scala 472:167]
  wire  _T_4192 = _T_4190 & _T_4191; // @[lsu_bus_buffer.scala 472:138]
  wire  _T_4193 = _T_4192 & any_done_wait_state; // @[lsu_bus_buffer.scala 472:187]
  wire  _T_4194 = _T_4168 | _T_4193; // @[lsu_bus_buffer.scala 472:53]
  wire  _T_4217 = buf_state_bus_en_3 & bus_rsp_read; // @[lsu_bus_buffer.scala 479:47]
  wire  _T_4218 = _T_4217 & io_lsu_bus_clk_en; // @[lsu_bus_buffer.scala 479:62]
  wire  _T_4231 = ~buf_error_en_3; // @[lsu_bus_buffer.scala 483:50]
  wire  _T_4232 = buf_state_en_3 & _T_4231; // @[lsu_bus_buffer.scala 483:48]
  wire  _T_4244 = buf_ldfwd[3] | _T_4249[0]; // @[lsu_bus_buffer.scala 487:90]
  wire  _T_4245 = _T_4244 | any_done_wait_state; // @[lsu_bus_buffer.scala 487:118]
  wire  _GEN_258 = _T_4265 | io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_261 = _T_4265 ? buf_state_en_3 : io_dec_tlu_force_halt; // @[Conditional.scala 39:67]
  wire  _GEN_265 = _T_4257 ? io_dec_tlu_force_halt : _GEN_258; // @[Conditional.scala 39:67]
  wire  _GEN_266 = _T_4257 ? io_dec_tlu_force_halt : _GEN_261; // @[Conditional.scala 39:67]
  wire  _GEN_271 = _T_4239 ? io_dec_tlu_force_halt : _GEN_265; // @[Conditional.scala 39:67]
  wire  _GEN_272 = _T_4239 ? io_dec_tlu_force_halt : _GEN_266; // @[Conditional.scala 39:67]
  wire  _GEN_277 = _T_4155 & _T_4218; // @[Conditional.scala 39:67]
  wire  _GEN_281 = _T_4155 ? io_dec_tlu_force_halt : _GEN_271; // @[Conditional.scala 39:67]
  wire  _GEN_282 = _T_4155 ? io_dec_tlu_force_halt : _GEN_272; // @[Conditional.scala 39:67]
  wire  _GEN_288 = _T_4121 ? _T_4141 : _GEN_282; // @[Conditional.scala 39:67]
  wire  _GEN_290 = _T_4121 ? _T_4145 : _GEN_277; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_4121 ? io_dec_tlu_force_halt : _GEN_281; // @[Conditional.scala 39:67]
  wire  _GEN_300 = _T_4117 ? io_dec_tlu_force_halt : _GEN_288; // @[Conditional.scala 39:67]
  wire  _GEN_302 = _T_4117 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67]
  wire  _GEN_306 = _T_4117 ? io_dec_tlu_force_halt : _GEN_294; // @[Conditional.scala 39:67]
  wire  buf_wr_en_3 = _T_4094 & buf_state_en_3; // @[Conditional.scala 40:58]
  wire  buf_ldfwd_en_3 = _T_4094 ? io_dec_tlu_force_halt : _GEN_300; // @[Conditional.scala 40:58]
  wire  buf_rst_3 = _T_4094 ? io_dec_tlu_force_halt : _GEN_306; // @[Conditional.scala 40:58]
  reg  _T_4320; // @[Reg.scala 27:20]
  reg  _T_4323; // @[Reg.scala 27:20]
  reg  _T_4326; // @[Reg.scala 27:20]
  reg  _T_4329; // @[Reg.scala 27:20]
  wire [3:0] buf_unsign = {_T_4329,_T_4326,_T_4323,_T_4320}; // @[Cat.scala 29:58]
  reg  _T_4395; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4390; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4385; // @[lsu_bus_buffer.scala 526:80]
  reg  _T_4380; // @[lsu_bus_buffer.scala 526:80]
  wire [3:0] buf_error = {_T_4395,_T_4390,_T_4385,_T_4380}; // @[Cat.scala 29:58]
  wire  _T_4377 = buf_error_en_0 | buf_error[0]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4378 = ~buf_rst_0; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4382 = buf_error_en_1 | buf_error[1]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4383 = ~buf_rst_1; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4387 = buf_error_en_2 | buf_error[2]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4388 = ~buf_rst_2; // @[lsu_bus_buffer.scala 526:126]
  wire  _T_4392 = buf_error_en_3 | buf_error[3]; // @[lsu_bus_buffer.scala 526:84]
  wire  _T_4393 = ~buf_rst_3; // @[lsu_bus_buffer.scala 526:126]
  wire [1:0] _T_4399 = {io_lsu_busreq_m,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4400 = io_ldst_dual_m ? _T_4399 : {{1'd0}, io_lsu_busreq_m}; // @[lsu_bus_buffer.scala 528:28]
  wire [1:0] _T_4401 = {io_lsu_busreq_r,1'h0}; // @[Cat.scala 29:58]
  wire [1:0] _T_4402 = io_ldst_dual_r ? _T_4401 : {{1'd0}, io_lsu_busreq_r}; // @[lsu_bus_buffer.scala 528:94]
  wire [2:0] _T_4403 = _T_4400 + _T_4402; // @[lsu_bus_buffer.scala 528:88]
  wire [2:0] _GEN_392 = {{2'd0}, ibuf_valid}; // @[lsu_bus_buffer.scala 528:154]
  wire [3:0] _T_4404 = _T_4403 + _GEN_392; // @[lsu_bus_buffer.scala 528:154]
  wire [1:0] _T_4409 = _T_5 + _T_12; // @[lsu_bus_buffer.scala 528:217]
  wire [1:0] _GEN_393 = {{1'd0}, _T_19}; // @[lsu_bus_buffer.scala 528:217]
  wire [2:0] _T_4410 = _T_4409 + _GEN_393; // @[lsu_bus_buffer.scala 528:217]
  wire [2:0] _GEN_394 = {{2'd0}, _T_26}; // @[lsu_bus_buffer.scala 528:217]
  wire [3:0] _T_4411 = _T_4410 + _GEN_394; // @[lsu_bus_buffer.scala 528:217]
  wire [3:0] buf_numvld_any = _T_4404 + _T_4411; // @[lsu_bus_buffer.scala 528:169]
  wire  _T_4482 = io_ldst_dual_d & io_dec_lsu_valid_raw_d; // @[lsu_bus_buffer.scala 534:52]
  wire  _T_4483 = buf_numvld_any >= 4'h3; // @[lsu_bus_buffer.scala 534:92]
  wire  _T_4484 = buf_numvld_any == 4'h4; // @[lsu_bus_buffer.scala 534:121]
  wire  _T_4486 = |buf_state_0; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4487 = |buf_state_1; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4488 = |buf_state_2; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4489 = |buf_state_3; // @[lsu_bus_buffer.scala 535:52]
  wire  _T_4490 = _T_4486 | _T_4487; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4491 = _T_4490 | _T_4488; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4492 = _T_4491 | _T_4489; // @[lsu_bus_buffer.scala 535:65]
  wire  _T_4493 = ~_T_4492; // @[lsu_bus_buffer.scala 535:34]
  wire  _T_4495 = _T_4493 & _T_852; // @[lsu_bus_buffer.scala 535:70]
  wire  _T_4498 = io_lsu_busreq_m & io_lsu_pkt_m_valid; // @[lsu_bus_buffer.scala 537:64]
  wire  _T_4499 = _T_4498 & io_lsu_pkt_m_bits_load; // @[lsu_bus_buffer.scala 537:85]
  wire  _T_4500 = ~io_flush_m_up; // @[lsu_bus_buffer.scala 537:112]
  wire  _T_4501 = _T_4499 & _T_4500; // @[lsu_bus_buffer.scala 537:110]
  wire  _T_4502 = ~io_ld_full_hit_m; // @[lsu_bus_buffer.scala 537:129]
  wire  _T_4504 = ~io_lsu_commit_r; // @[lsu_bus_buffer.scala 540:74]
  reg  lsu_nonblock_load_valid_r; // @[lsu_bus_buffer.scala 625:66]
  wire  _T_4518 = _T_2763 & _T_3637; // @[Mux.scala 27:72]
  wire  _T_4519 = _T_2785 & _T_3827; // @[Mux.scala 27:72]
  wire  _T_4520 = _T_2807 & _T_4017; // @[Mux.scala 27:72]
  wire  _T_4521 = _T_2829 & _T_4207; // @[Mux.scala 27:72]
  wire  _T_4522 = _T_4518 | _T_4519; // @[Mux.scala 27:72]
  wire  _T_4523 = _T_4522 | _T_4520; // @[Mux.scala 27:72]
  wire  lsu_nonblock_load_data_ready = _T_4523 | _T_4521; // @[Mux.scala 27:72]
  wire  _T_4529 = buf_error[0] & _T_3637; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4534 = buf_error[1] & _T_3827; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4539 = buf_error[2] & _T_4017; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4544 = buf_error[3] & _T_4207; // @[lsu_bus_buffer.scala 543:121]
  wire  _T_4545 = _T_2763 & _T_4529; // @[Mux.scala 27:72]
  wire  _T_4546 = _T_2785 & _T_4534; // @[Mux.scala 27:72]
  wire  _T_4547 = _T_2807 & _T_4539; // @[Mux.scala 27:72]
  wire  _T_4548 = _T_2829 & _T_4544; // @[Mux.scala 27:72]
  wire  _T_4549 = _T_4545 | _T_4546; // @[Mux.scala 27:72]
  wire  _T_4550 = _T_4549 | _T_4547; // @[Mux.scala 27:72]
  wire  _T_4557 = ~buf_dual_0; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4558 = ~buf_dualhi_0; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4559 = _T_4557 | _T_4558; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4560 = _T_4518 & _T_4559; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4565 = ~buf_dual_1; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4566 = ~buf_dualhi_1; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4567 = _T_4565 | _T_4566; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4568 = _T_4519 & _T_4567; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4573 = ~buf_dual_2; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4574 = ~buf_dualhi_2; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4575 = _T_4573 | _T_4574; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4576 = _T_4520 & _T_4575; // @[lsu_bus_buffer.scala 544:119]
  wire  _T_4581 = ~buf_dual_3; // @[lsu_bus_buffer.scala 544:122]
  wire  _T_4582 = ~buf_dualhi_3; // @[lsu_bus_buffer.scala 544:137]
  wire  _T_4583 = _T_4581 | _T_4582; // @[lsu_bus_buffer.scala 544:135]
  wire  _T_4584 = _T_4521 & _T_4583; // @[lsu_bus_buffer.scala 544:119]
  wire [1:0] _T_4587 = _T_4576 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4588 = _T_4584 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_395 = {{1'd0}, _T_4568}; // @[Mux.scala 27:72]
  wire [1:0] _T_4590 = _GEN_395 | _T_4587; // @[Mux.scala 27:72]
  wire [31:0] _T_4625 = _T_4560 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4626 = _T_4568 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4627 = _T_4576 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4628 = _T_4584 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4629 = _T_4625 | _T_4626; // @[Mux.scala 27:72]
  wire [31:0] _T_4630 = _T_4629 | _T_4627; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_lo = _T_4630 | _T_4628; // @[Mux.scala 27:72]
  wire  _T_4637 = _T_4518 & _T_3635; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4643 = _T_4519 & _T_3825; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4649 = _T_4520 & _T_4015; // @[lsu_bus_buffer.scala 546:105]
  wire  _T_4655 = _T_4521 & _T_4205; // @[lsu_bus_buffer.scala 546:105]
  wire [31:0] _T_4656 = _T_4637 ? buf_data_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4657 = _T_4643 ? buf_data_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4658 = _T_4649 ? buf_data_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4659 = _T_4655 ? buf_data_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4660 = _T_4656 | _T_4657; // @[Mux.scala 27:72]
  wire [31:0] _T_4661 = _T_4660 | _T_4658; // @[Mux.scala 27:72]
  wire [31:0] lsu_nonblock_load_data_hi = _T_4661 | _T_4659; // @[Mux.scala 27:72]
  wire  _T_4663 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h0; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4664 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h1; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4665 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h2; // @[lsu_bus_buffer.scala 61:123]
  wire  _T_4666 = io_dctl_busbuff_lsu_nonblock_load_data_tag == 2'h3; // @[lsu_bus_buffer.scala 61:123]
  wire [31:0] _T_4667 = _T_4663 ? buf_addr_0 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4668 = _T_4664 ? buf_addr_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4669 = _T_4665 ? buf_addr_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4670 = _T_4666 ? buf_addr_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4671 = _T_4667 | _T_4668; // @[Mux.scala 27:72]
  wire [31:0] _T_4672 = _T_4671 | _T_4669; // @[Mux.scala 27:72]
  wire [31:0] _T_4673 = _T_4672 | _T_4670; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_addr_offset = _T_4673[1:0]; // @[lsu_bus_buffer.scala 547:96]
  wire [1:0] _T_4679 = _T_4663 ? buf_sz_0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4680 = _T_4664 ? buf_sz_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4681 = _T_4665 ? buf_sz_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4682 = _T_4666 ? buf_sz_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4683 = _T_4679 | _T_4680; // @[Mux.scala 27:72]
  wire [1:0] _T_4684 = _T_4683 | _T_4681; // @[Mux.scala 27:72]
  wire [1:0] lsu_nonblock_sz = _T_4684 | _T_4682; // @[Mux.scala 27:72]
  wire  _T_4694 = _T_4663 & buf_unsign[0]; // @[Mux.scala 27:72]
  wire  _T_4695 = _T_4664 & buf_unsign[1]; // @[Mux.scala 27:72]
  wire  _T_4696 = _T_4665 & buf_unsign[2]; // @[Mux.scala 27:72]
  wire  _T_4697 = _T_4666 & buf_unsign[3]; // @[Mux.scala 27:72]
  wire  _T_4698 = _T_4694 | _T_4695; // @[Mux.scala 27:72]
  wire  _T_4699 = _T_4698 | _T_4696; // @[Mux.scala 27:72]
  wire  lsu_nonblock_unsign = _T_4699 | _T_4697; // @[Mux.scala 27:72]
  wire [63:0] _T_4701 = {lsu_nonblock_load_data_hi,lsu_nonblock_load_data_lo}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_396 = {{2'd0}, lsu_nonblock_addr_offset}; // @[lsu_bus_buffer.scala 551:121]
  wire [5:0] _T_4702 = _GEN_396 * 4'h8; // @[lsu_bus_buffer.scala 551:121]
  wire [63:0] lsu_nonblock_data_unalgn = _T_4701 >> _T_4702; // @[lsu_bus_buffer.scala 551:92]
  wire  _T_4703 = ~io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_buffer.scala 553:82]
  wire  _T_4705 = lsu_nonblock_sz == 2'h0; // @[lsu_bus_buffer.scala 554:94]
  wire  _T_4706 = lsu_nonblock_unsign & _T_4705; // @[lsu_bus_buffer.scala 554:76]
  wire [31:0] _T_4708 = {24'h0,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4709 = lsu_nonblock_sz == 2'h1; // @[lsu_bus_buffer.scala 555:45]
  wire  _T_4710 = lsu_nonblock_unsign & _T_4709; // @[lsu_bus_buffer.scala 555:26]
  wire [31:0] _T_4712 = {16'h0,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4713 = ~lsu_nonblock_unsign; // @[lsu_bus_buffer.scala 556:6]
  wire  _T_4715 = _T_4713 & _T_4705; // @[lsu_bus_buffer.scala 556:27]
  wire [23:0] _T_4718 = lsu_nonblock_data_unalgn[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4720 = {_T_4718,lsu_nonblock_data_unalgn[7:0]}; // @[Cat.scala 29:58]
  wire  _T_4723 = _T_4713 & _T_4709; // @[lsu_bus_buffer.scala 557:27]
  wire [15:0] _T_4726 = lsu_nonblock_data_unalgn[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_4728 = {_T_4726,lsu_nonblock_data_unalgn[15:0]}; // @[Cat.scala 29:58]
  wire  _T_4729 = lsu_nonblock_sz == 2'h2; // @[lsu_bus_buffer.scala 558:21]
  wire [31:0] _T_4730 = _T_4706 ? _T_4708 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4731 = _T_4710 ? _T_4712 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4732 = _T_4715 ? _T_4720 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4733 = _T_4723 ? _T_4728 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_4734 = _T_4729 ? lsu_nonblock_data_unalgn : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_4735 = _T_4730 | _T_4731; // @[Mux.scala 27:72]
  wire [31:0] _T_4736 = _T_4735 | _T_4732; // @[Mux.scala 27:72]
  wire [31:0] _T_4737 = _T_4736 | _T_4733; // @[Mux.scala 27:72]
  wire [63:0] _GEN_397 = {{32'd0}, _T_4737}; // @[Mux.scala 27:72]
  wire [63:0] _T_4738 = _GEN_397 | _T_4734; // @[Mux.scala 27:72]
  wire  _T_4832 = obuf_valid & obuf_write; // @[lsu_bus_buffer.scala 576:37]
  wire  _T_4833 = ~obuf_cmd_done; // @[lsu_bus_buffer.scala 576:52]
  wire  _T_4834 = _T_4832 & _T_4833; // @[lsu_bus_buffer.scala 576:50]
  wire [31:0] _T_4838 = {obuf_addr[31:3],3'h0}; // @[Cat.scala 29:58]
  wire [2:0] _T_4840 = {1'h0,obuf_sz}; // @[Cat.scala 29:58]
  wire  _T_4845 = ~obuf_data_done; // @[lsu_bus_buffer.scala 588:51]
  wire  _T_4846 = _T_4832 & _T_4845; // @[lsu_bus_buffer.scala 588:49]
  wire [7:0] _T_4850 = obuf_write ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire  _T_4853 = obuf_valid & _T_1341; // @[lsu_bus_buffer.scala 593:37]
  wire  _T_4855 = _T_4853 & _T_1347; // @[lsu_bus_buffer.scala 593:51]
  wire  _T_4867 = io_lsu_bus_clk_en_q & buf_error[0]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4869 = _T_4867 & buf_write[0]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4872 = io_lsu_bus_clk_en_q & buf_error[1]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4874 = _T_4872 & buf_write[1]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4877 = io_lsu_bus_clk_en_q & buf_error[2]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4879 = _T_4877 & buf_write[2]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4882 = io_lsu_bus_clk_en_q & buf_error[3]; // @[lsu_bus_buffer.scala 606:126]
  wire  _T_4884 = _T_4882 & buf_write[3]; // @[lsu_bus_buffer.scala 606:141]
  wire  _T_4885 = _T_2763 & _T_4869; // @[Mux.scala 27:72]
  wire  _T_4886 = _T_2785 & _T_4874; // @[Mux.scala 27:72]
  wire  _T_4887 = _T_2807 & _T_4879; // @[Mux.scala 27:72]
  wire  _T_4888 = _T_2829 & _T_4884; // @[Mux.scala 27:72]
  wire  _T_4889 = _T_4885 | _T_4886; // @[Mux.scala 27:72]
  wire  _T_4890 = _T_4889 | _T_4887; // @[Mux.scala 27:72]
  wire  _T_4900 = _T_2785 & buf_error[1]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4902 = _T_4900 & buf_write[1]; // @[lsu_bus_buffer.scala 607:108]
  wire  _T_4905 = _T_2807 & buf_error[2]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4907 = _T_4905 & buf_write[2]; // @[lsu_bus_buffer.scala 607:108]
  wire  _T_4910 = _T_2829 & buf_error[3]; // @[lsu_bus_buffer.scala 607:93]
  wire  _T_4912 = _T_4910 & buf_write[3]; // @[lsu_bus_buffer.scala 607:108]
  wire [1:0] _T_4915 = _T_4907 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_4916 = _T_4912 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_398 = {{1'd0}, _T_4902}; // @[Mux.scala 27:72]
  wire [1:0] _T_4918 = _GEN_398 | _T_4915; // @[Mux.scala 27:72]
  wire [1:0] lsu_imprecise_error_store_tag = _T_4918 | _T_4916; // @[Mux.scala 27:72]
  wire  _T_4920 = ~io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 609:97]
  wire [31:0] _GEN_355 = 2'h1 == lsu_imprecise_error_store_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_356 = 2'h2 == lsu_imprecise_error_store_tag ? buf_addr_2 : _GEN_355; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_357 = 2'h3 == lsu_imprecise_error_store_tag ? buf_addr_3 : _GEN_356; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_359 = 2'h1 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_1 : buf_addr_0; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_360 = 2'h2 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_2 : _GEN_359; // @[lsu_bus_buffer.scala 610:53]
  wire [31:0] _GEN_361 = 2'h3 == io_dctl_busbuff_lsu_nonblock_load_data_tag ? buf_addr_3 : _GEN_360; // @[lsu_bus_buffer.scala 610:53]
  wire  _T_4925 = bus_wcmd_sent | bus_wdata_sent; // @[lsu_bus_buffer.scala 616:82]
  wire  _T_4928 = io_lsu_busreq_r & io_ldst_dual_r; // @[lsu_bus_buffer.scala 617:60]
  wire  _T_4931 = ~io_lsu_axi_aw_ready; // @[lsu_bus_buffer.scala 620:61]
  wire  _T_4932 = io_lsu_axi_aw_valid & _T_4931; // @[lsu_bus_buffer.scala 620:59]
  wire  _T_4933 = ~io_lsu_axi_w_ready; // @[lsu_bus_buffer.scala 620:107]
  wire  _T_4934 = io_lsu_axi_w_valid & _T_4933; // @[lsu_bus_buffer.scala 620:105]
  wire  _T_4935 = _T_4932 | _T_4934; // @[lsu_bus_buffer.scala 620:83]
  wire  _T_4936 = ~io_lsu_axi_ar_ready; // @[lsu_bus_buffer.scala 620:153]
  wire  _T_4937 = io_lsu_axi_ar_valid & _T_4936; // @[lsu_bus_buffer.scala 620:151]
  wire  _T_4941 = ~io_flush_r; // @[lsu_bus_buffer.scala 624:75]
  wire  _T_4942 = io_lsu_busreq_m & _T_4941; // @[lsu_bus_buffer.scala 624:73]
  reg  _T_4945; // @[lsu_bus_buffer.scala 624:56]
  rvclkhdr rvclkhdr ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[lib.scala 368:23]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = _T_4925 | _T_4824; // @[lsu_bus_buffer.scala 616:35]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = _T_4928 & io_lsu_commit_r; // @[lsu_bus_buffer.scala 617:41]
  assign io_tlu_busbuff_lsu_pmu_bus_error = io_tlu_busbuff_lsu_imprecise_error_load_any | io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_buffer.scala 618:36]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = _T_4935 | _T_4937; // @[lsu_bus_buffer.scala 620:35]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = io_dctl_busbuff_lsu_nonblock_load_data_error & _T_4920; // @[lsu_bus_buffer.scala 609:47]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = _T_4890 | _T_4888; // @[lsu_bus_buffer.scala 606:48]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = io_tlu_busbuff_lsu_imprecise_error_store_any ? _GEN_357 : _GEN_361; // @[lsu_bus_buffer.scala 610:47]
  assign io_dctl_busbuff_lsu_nonblock_load_valid_m = _T_4501 & _T_4502; // @[lsu_bus_buffer.scala 537:45]
  assign io_dctl_busbuff_lsu_nonblock_load_tag_m = _T_1795 ? 2'h0 : _T_1831; // @[lsu_bus_buffer.scala 538:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_r = lsu_nonblock_load_valid_r & _T_4504; // @[lsu_bus_buffer.scala 540:43]
  assign io_dctl_busbuff_lsu_nonblock_load_inv_tag_r = WrPtr0_r; // @[lsu_bus_buffer.scala 541:47]
  assign io_dctl_busbuff_lsu_nonblock_load_data_valid = lsu_nonblock_load_data_ready & _T_4703; // @[lsu_bus_buffer.scala 553:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_error = _T_4550 | _T_4548; // @[lsu_bus_buffer.scala 543:48]
  assign io_dctl_busbuff_lsu_nonblock_load_data_tag = _T_4590 | _T_4588; // @[lsu_bus_buffer.scala 544:46]
  assign io_dctl_busbuff_lsu_nonblock_load_data = _T_4738[31:0]; // @[lsu_bus_buffer.scala 554:42]
  assign io_lsu_axi_aw_valid = _T_4834 & _T_1237; // @[lsu_bus_buffer.scala 576:23]
  assign io_lsu_axi_aw_bits_id = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 577:25]
  assign io_lsu_axi_aw_bits_addr = obuf_sideeffect ? obuf_addr : _T_4838; // @[lsu_bus_buffer.scala 578:27]
  assign io_lsu_axi_aw_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 582:29]
  assign io_lsu_axi_aw_bits_size = obuf_sideeffect ? _T_4840 : 3'h3; // @[lsu_bus_buffer.scala 579:27]
  assign io_lsu_axi_aw_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 581:28]
  assign io_lsu_axi_w_valid = _T_4846 & _T_1237; // @[lsu_bus_buffer.scala 588:22]
  assign io_lsu_axi_w_bits_data = obuf_data; // @[lsu_bus_buffer.scala 590:26]
  assign io_lsu_axi_w_bits_strb = obuf_byteen & _T_4850; // @[lsu_bus_buffer.scala 589:26]
  assign io_lsu_axi_b_ready = 1'h1; // @[lsu_bus_buffer.scala 604:22]
  assign io_lsu_axi_ar_valid = _T_4855 & _T_1237; // @[lsu_bus_buffer.scala 593:23]
  assign io_lsu_axi_ar_bits_id = {{1'd0}, _T_1780}; // @[lsu_bus_buffer.scala 594:25]
  assign io_lsu_axi_ar_bits_addr = obuf_sideeffect ? obuf_addr : _T_4838; // @[lsu_bus_buffer.scala 595:27]
  assign io_lsu_axi_ar_bits_region = obuf_addr[31:28]; // @[lsu_bus_buffer.scala 599:29]
  assign io_lsu_axi_ar_bits_size = obuf_sideeffect ? _T_4840 : 3'h3; // @[lsu_bus_buffer.scala 596:27]
  assign io_lsu_axi_ar_bits_cache = obuf_sideeffect ? 4'h0 : 4'hf; // @[lsu_bus_buffer.scala 598:28]
  assign io_lsu_axi_r_ready = 1'h1; // @[lsu_bus_buffer.scala 605:22]
  assign io_lsu_busreq_r = _T_4945; // @[lsu_bus_buffer.scala 624:19]
  assign io_lsu_bus_buffer_pend_any = |buf_numvld_pend_any; // @[lsu_bus_buffer.scala 533:30]
  assign io_lsu_bus_buffer_full_any = _T_4482 ? _T_4483 : _T_4484; // @[lsu_bus_buffer.scala 534:30]
  assign io_lsu_bus_buffer_empty_any = _T_4495 & _T_1231; // @[lsu_bus_buffer.scala 535:31]
  assign io_ld_byte_hit_buf_lo = {_T_69,_T_58}; // @[lsu_bus_buffer.scala 141:25]
  assign io_ld_byte_hit_buf_hi = {_T_84,_T_73}; // @[lsu_bus_buffer.scala 142:25]
  assign io_ld_fwddata_buf_lo = _T_650 | _T_651; // @[lsu_bus_buffer.scala 168:24]
  assign io_ld_fwddata_buf_hi = _T_747 | _T_748; // @[lsu_bus_buffer.scala 174:24]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_io_en = _T_853 & _T_854; // @[lib.scala 371:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_1_io_en = _T_853 & _T_854; // @[lib.scala 371:17]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_2_io_en = _T_1238 & io_lsu_bus_clk_en; // @[lib.scala 371:17]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_3_io_en = _T_1238 & io_lsu_bus_clk_en; // @[lib.scala 371:17]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_4_io_en = _T_3524 & buf_state_en_0; // @[lib.scala 371:17]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_5_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_5_io_en = _T_3714 & buf_state_en_1; // @[lib.scala 371:17]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_6_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_6_io_en = _T_3904 & buf_state_en_2; // @[lib.scala 371:17]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_7_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_7_io_en = _T_4094 & buf_state_en_3; // @[lib.scala 371:17]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_8_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_8_io_en = _T_3524 ? buf_state_en_0 : _GEN_71; // @[lib.scala 371:17]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_9_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_9_io_en = _T_3714 ? buf_state_en_1 : _GEN_148; // @[lib.scala 371:17]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_10_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_10_io_en = _T_3904 ? buf_state_en_2 : _GEN_225; // @[lib.scala 371:17]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
  assign rvclkhdr_11_io_clk = clock; // @[lib.scala 370:18]
  assign rvclkhdr_11_io_en = _T_4094 ? buf_state_en_3 : _GEN_302; // @[lib.scala 371:17]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[lib.scala 372:24]
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
  _T_4344 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_4341 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_4338 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_4335 = _RAND_4[0:0];
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
  _T_1780 = _RAND_17[1:0];
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
  _T_4314 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  _T_4311 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  _T_4308 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  _T_4305 = _RAND_53[0:0];
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
  _T_4291 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  _T_4289 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  _T_4287 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  _T_4285 = _RAND_88[0:0];
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
  _T_4320 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  _T_4323 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  _T_4326 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  _T_4329 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  _T_4395 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  _T_4390 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  _T_4385 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  _T_4380 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  lsu_nonblock_load_valid_r = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  _T_4945 = _RAND_106[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    buf_addr_0 = 32'h0;
  end
  if (reset) begin
    _T_4344 = 1'h0;
  end
  if (reset) begin
    _T_4341 = 1'h0;
  end
  if (reset) begin
    _T_4338 = 1'h0;
  end
  if (reset) begin
    _T_4335 = 1'h0;
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
    _T_1780 = 2'h0;
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
    _T_4314 = 1'h0;
  end
  if (reset) begin
    _T_4311 = 1'h0;
  end
  if (reset) begin
    _T_4308 = 1'h0;
  end
  if (reset) begin
    _T_4305 = 1'h0;
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
    _T_4291 = 1'h0;
  end
  if (reset) begin
    _T_4289 = 1'h0;
  end
  if (reset) begin
    _T_4287 = 1'h0;
  end
  if (reset) begin
    _T_4285 = 1'h0;
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
    _T_4320 = 1'h0;
  end
  if (reset) begin
    _T_4323 = 1'h0;
  end
  if (reset) begin
    _T_4326 = 1'h0;
  end
  if (reset) begin
    _T_4329 = 1'h0;
  end
  if (reset) begin
    _T_4395 = 1'h0;
  end
  if (reset) begin
    _T_4390 = 1'h0;
  end
  if (reset) begin
    _T_4385 = 1'h0;
  end
  if (reset) begin
    _T_4380 = 1'h0;
  end
  if (reset) begin
    lsu_nonblock_load_valid_r = 1'h0;
  end
  if (reset) begin
    _T_4945 = 1'h0;
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
    end else if (_T_3339) begin
      buf_addr_0 <= io_end_addr_r;
    end else begin
      buf_addr_0 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4344 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4344 <= buf_write_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4341 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4341 <= buf_write_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4338 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4338 <= buf_write_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4335 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4335 <= buf_write_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_0 <= 3'h0;
    end else if (buf_state_en_0) begin
      if (_T_3524) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_0 <= 3'h2;
        end else begin
          buf_state_0 <= 3'h1;
        end
      end else if (_T_3547) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else begin
          buf_state_0 <= 3'h2;
        end
      end else if (_T_3551) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h3;
        end
      end else if (_T_3585) begin
        if (_T_3588) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3596) begin
          buf_state_0 <= 3'h4;
        end else if (_T_3624) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3669) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_0 <= 3'h0;
        end else if (_T_3675) begin
          buf_state_0 <= 3'h5;
        end else begin
          buf_state_0 <= 3'h6;
        end
      end else if (_T_3687) begin
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
    end else if (_T_3348) begin
      buf_addr_1 <= io_end_addr_r;
    end else begin
      buf_addr_1 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_1 <= 3'h0;
    end else if (buf_state_en_1) begin
      if (_T_3714) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_1 <= 3'h2;
        end else begin
          buf_state_1 <= 3'h1;
        end
      end else if (_T_3737) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else begin
          buf_state_1 <= 3'h2;
        end
      end else if (_T_3741) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h3;
        end
      end else if (_T_3775) begin
        if (_T_3778) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3786) begin
          buf_state_1 <= 3'h4;
        end else if (_T_3814) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3859) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_1 <= 3'h0;
        end else if (_T_3865) begin
          buf_state_1 <= 3'h5;
        end else begin
          buf_state_1 <= 3'h6;
        end
      end else if (_T_3877) begin
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
    end else if (_T_3357) begin
      buf_addr_2 <= io_end_addr_r;
    end else begin
      buf_addr_2 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_2 <= 3'h0;
    end else if (buf_state_en_2) begin
      if (_T_3904) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_2 <= 3'h2;
        end else begin
          buf_state_2 <= 3'h1;
        end
      end else if (_T_3927) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else begin
          buf_state_2 <= 3'h2;
        end
      end else if (_T_3931) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h3;
        end
      end else if (_T_3965) begin
        if (_T_3968) begin
          buf_state_2 <= 3'h0;
        end else if (_T_3976) begin
          buf_state_2 <= 3'h4;
        end else if (_T_4004) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4049) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_2 <= 3'h0;
        end else if (_T_4055) begin
          buf_state_2 <= 3'h5;
        end else begin
          buf_state_2 <= 3'h6;
        end
      end else if (_T_4067) begin
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
    end else if (_T_3366) begin
      buf_addr_3 <= io_end_addr_r;
    end else begin
      buf_addr_3 <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_state_3 <= 3'h0;
    end else if (buf_state_en_3) begin
      if (_T_4094) begin
        if (io_lsu_bus_clk_en) begin
          buf_state_3 <= 3'h2;
        end else begin
          buf_state_3 <= 3'h1;
        end
      end else if (_T_4117) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else begin
          buf_state_3 <= 3'h2;
        end
      end else if (_T_4121) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_3555) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h3;
        end
      end else if (_T_4155) begin
        if (_T_4158) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4166) begin
          buf_state_3 <= 3'h4;
        end else if (_T_4194) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4239) begin
        if (io_dec_tlu_force_halt) begin
          buf_state_3 <= 3'h0;
        end else if (_T_4245) begin
          buf_state_3 <= 3'h5;
        end else begin
          buf_state_3 <= 3'h6;
        end
      end else if (_T_4257) begin
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
      end else if (_T_3366) begin
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
      end else if (_T_3357) begin
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
      end else if (_T_3348) begin
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
      end else if (_T_3339) begin
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
      buf_ageQ_3 <= {_T_2467,_T_2390};
    end
  end
  always @(posedge io_lsu_bus_obuf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_1780 <= 2'h0;
    end else if (obuf_wr_en) begin
      if (ibuf_buf_byp) begin
        _T_1780 <= WrPtr0_r;
      end else begin
        _T_1780 <= CmdPtr0;
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
      obuf_valid <= _T_1771 & _T_1772;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_wr_enQ <= 1'h0;
    end else begin
      obuf_wr_enQ <= _T_1238 & io_lsu_bus_clk_en;
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
      buf_ageQ_2 <= {_T_2365,_T_2288};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_1 <= 4'h0;
    end else begin
      buf_ageQ_1 <= {_T_2263,_T_2186};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ageQ_0 <= 4'h0;
    end else begin
      buf_ageQ_0 <= {_T_2161,_T_2084};
    end
  end
  always @(posedge rvclkhdr_8_io_l1clk or posedge reset) begin
    if (reset) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3524) begin
      if (_T_3539) begin
        buf_data_0 <= ibuf_data_out;
      end else begin
        buf_data_0 <= store_data_lo_r;
      end
    end else if (_T_3547) begin
      buf_data_0 <= 32'h0;
    end else if (_T_3551) begin
      if (buf_error_en_0) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_0[2]) begin
        buf_data_0 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_0 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3585) begin
      if (_T_3662) begin
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
    end else if (_T_3714) begin
      if (_T_3729) begin
        buf_data_1 <= ibuf_data_out;
      end else begin
        buf_data_1 <= store_data_lo_r;
      end
    end else if (_T_3737) begin
      buf_data_1 <= 32'h0;
    end else if (_T_3741) begin
      if (buf_error_en_1) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_1[2]) begin
        buf_data_1 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_1 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3775) begin
      if (_T_3852) begin
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
    end else if (_T_3904) begin
      if (_T_3919) begin
        buf_data_2 <= ibuf_data_out;
      end else begin
        buf_data_2 <= store_data_lo_r;
      end
    end else if (_T_3927) begin
      buf_data_2 <= 32'h0;
    end else if (_T_3931) begin
      if (buf_error_en_2) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_2[2]) begin
        buf_data_2 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_2 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_3965) begin
      if (_T_4042) begin
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
    end else if (_T_4094) begin
      if (_T_4109) begin
        buf_data_3 <= ibuf_data_out;
      end else begin
        buf_data_3 <= store_data_lo_r;
      end
    end else if (_T_4117) begin
      buf_data_3 <= 32'h0;
    end else if (_T_4121) begin
      if (buf_error_en_3) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end else if (buf_addr_3[2]) begin
        buf_data_3 <= io_lsu_axi_r_bits_data[63:32];
      end else begin
        buf_data_3 <= io_lsu_axi_r_bits_data[31:0];
      end
    end else if (_T_4155) begin
      if (_T_4232) begin
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
    end else if (_T_1846) begin
      WrPtr1_r <= 2'h0;
    end else if (_T_1860) begin
      WrPtr1_r <= 2'h1;
    end else if (_T_1874) begin
      WrPtr1_r <= 2'h2;
    end else begin
      WrPtr1_r <= 2'h3;
    end
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1795) begin
      WrPtr0_r <= 2'h0;
    end else if (_T_1806) begin
      WrPtr0_r <= 2'h1;
    end else if (_T_1817) begin
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
      _T_4314 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4314 <= buf_sideeffect_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4311 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4311 <= buf_sideeffect_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4308 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4308 <= buf_sideeffect_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4305 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4305 <= buf_sideeffect_in[0];
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
      obuf_cmd_done <= _T_1303 & _T_4821;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_data_done <= 1'h0;
    end else begin
      obuf_data_done <= _T_1303 & _T_4822;
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
      obuf_addr <= _T_1287;
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
      obuf_rdrsp_pend <= _T_1331 & _T_2587;
    end
  end
  always @(posedge io_lsu_busm_clk or posedge reset) begin
    if (reset) begin
      obuf_rdrsp_tag <= 3'h0;
    end else if (_T_1330) begin
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
        obuf_sz <= _T_1300;
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
      obuf_data <= {_T_1618,_T_1577};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_0 <= 4'h0;
    end else begin
      buf_rspageQ_0 <= {_T_3137,_T_3126};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_1 <= 4'h0;
    end else begin
      buf_rspageQ_1 <= {_T_3152,_T_3141};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_2 <= 4'h0;
    end else begin
      buf_rspageQ_2 <= {_T_3167,_T_3156};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_rspageQ_3 <= 4'h0;
    end else begin
      buf_rspageQ_3 <= {_T_3182,_T_3171};
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4291 <= 1'h0;
    end else if (buf_ldfwd_en_3) begin
      if (_T_4094) begin
        _T_4291 <= 1'h0;
      end else if (_T_4117) begin
        _T_4291 <= 1'h0;
      end else begin
        _T_4291 <= _T_4121;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4289 <= 1'h0;
    end else if (buf_ldfwd_en_2) begin
      if (_T_3904) begin
        _T_4289 <= 1'h0;
      end else if (_T_3927) begin
        _T_4289 <= 1'h0;
      end else begin
        _T_4289 <= _T_3931;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4287 <= 1'h0;
    end else if (buf_ldfwd_en_1) begin
      if (_T_3714) begin
        _T_4287 <= 1'h0;
      end else if (_T_3737) begin
        _T_4287 <= 1'h0;
      end else begin
        _T_4287 <= _T_3741;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4285 <= 1'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        _T_4285 <= 1'h0;
      end else if (_T_3547) begin
        _T_4285 <= 1'h0;
      end else begin
        _T_4285 <= _T_3551;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      buf_ldfwdtag_0 <= 2'h0;
    end else if (buf_ldfwd_en_0) begin
      if (_T_3524) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3547) begin
        buf_ldfwdtag_0 <= 2'h0;
      end else if (_T_3551) begin
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
      end else if (_T_3339) begin
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
      if (_T_4094) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4117) begin
        buf_ldfwdtag_3 <= 2'h0;
      end else if (_T_4121) begin
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
      if (_T_3904) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3927) begin
        buf_ldfwdtag_2 <= 2'h0;
      end else if (_T_3931) begin
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
      if (_T_3714) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3737) begin
        buf_ldfwdtag_1 <= 2'h0;
      end else if (_T_3741) begin
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
      end else if (_T_3348) begin
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
      end else if (_T_3357) begin
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
      end else if (_T_3366) begin
        buf_dualtag_3 <= WrPtr0_r;
      end else begin
        buf_dualtag_3 <= WrPtr1_r;
      end
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4320 <= 1'h0;
    end else if (buf_wr_en_0) begin
      _T_4320 <= buf_unsign_in[0];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4323 <= 1'h0;
    end else if (buf_wr_en_1) begin
      _T_4323 <= buf_unsign_in[1];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4326 <= 1'h0;
    end else if (buf_wr_en_2) begin
      _T_4326 <= buf_unsign_in[2];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4329 <= 1'h0;
    end else if (buf_wr_en_3) begin
      _T_4329 <= buf_unsign_in[3];
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4395 <= 1'h0;
    end else begin
      _T_4395 <= _T_4392 & _T_4393;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4390 <= 1'h0;
    end else begin
      _T_4390 <= _T_4387 & _T_4388;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4385 <= 1'h0;
    end else begin
      _T_4385 <= _T_4382 & _T_4383;
    end
  end
  always @(posedge io_lsu_bus_buf_c1_clk or posedge reset) begin
    if (reset) begin
      _T_4380 <= 1'h0;
    end else begin
      _T_4380 <= _T_4377 & _T_4378;
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
      _T_4945 <= 1'h0;
    end else begin
      _T_4945 <= _T_4942 & _T_4502;
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
  input         io_lsu_c1_r_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_bus_ibuf_c1_clk,
  input         io_lsu_bus_obuf_c1_clk,
  input         io_lsu_bus_buf_c1_clk,
  input         io_lsu_free_c2_clk,
  input         io_active_clk,
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
  input  [31:0] io_lsu_addr_m,
  input  [31:0] io_lsu_addr_r,
  input  [31:0] io_end_addr_m,
  input  [31:0] io_end_addr_r,
  input         io_ldst_dual_d,
  input         io_ldst_dual_m,
  input         io_ldst_dual_r,
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
`endif // RANDOMIZE_REG_INIT
  wire  bus_buffer_clock; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_reset; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_scan_mode; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu_bus_intf.scala 100:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu_bus_intf.scala 100:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu_bus_intf.scala 100:39]
  wire [1:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dec_tlu_force_halt; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_c2_r_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_ibuf_c1_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_obuf_c1_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_buf_c1_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_free_c2_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_busm_clk; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_dec_lsu_valid_raw_d; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_m_valid; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_m_bits_load; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_by; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_half; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_word; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_load; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_pkt_r_bits_unsign; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_lsu_addr_m; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_end_addr_m; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_lsu_addr_r; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_end_addr_r; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_store_data_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_no_word_merge_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_no_dword_merge_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_busreq_m; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_ld_full_hit_m; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_flush_m_up; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_flush_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_commit_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_is_sideeffects_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_ldst_dual_d; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_ldst_dual_m; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_ldst_dual_r; // @[lsu_bus_intf.scala 100:39]
  wire [7:0] bus_buffer_io_ldst_byteen_ext_m; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_aw_ready; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_aw_valid; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_aw_bits_id; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_lsu_axi_aw_bits_addr; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_lsu_axi_aw_bits_region; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_aw_bits_size; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_lsu_axi_aw_bits_cache; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_w_ready; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_w_valid; // @[lsu_bus_intf.scala 100:39]
  wire [63:0] bus_buffer_io_lsu_axi_w_bits_data; // @[lsu_bus_intf.scala 100:39]
  wire [7:0] bus_buffer_io_lsu_axi_w_bits_strb; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_b_ready; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_b_valid; // @[lsu_bus_intf.scala 100:39]
  wire [1:0] bus_buffer_io_lsu_axi_b_bits_resp; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_b_bits_id; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_ar_ready; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_ar_valid; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_ar_bits_id; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_lsu_axi_ar_bits_addr; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_lsu_axi_ar_bits_region; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_ar_bits_size; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_lsu_axi_ar_bits_cache; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_r_ready; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_axi_r_valid; // @[lsu_bus_intf.scala 100:39]
  wire [2:0] bus_buffer_io_lsu_axi_r_bits_id; // @[lsu_bus_intf.scala 100:39]
  wire [63:0] bus_buffer_io_lsu_axi_r_bits_data; // @[lsu_bus_intf.scala 100:39]
  wire [1:0] bus_buffer_io_lsu_axi_r_bits_resp; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_clk_en; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_clk_en_q; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_busreq_r; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_buffer_pend_any; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_buffer_full_any; // @[lsu_bus_intf.scala 100:39]
  wire  bus_buffer_io_lsu_bus_buffer_empty_any; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_lo; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] bus_buffer_io_ld_byte_hit_buf_hi; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_lo; // @[lsu_bus_intf.scala 100:39]
  wire [31:0] bus_buffer_io_ld_fwddata_buf_hi; // @[lsu_bus_intf.scala 100:39]
  wire [3:0] _T_3 = io_lsu_pkt_m_bits_word ? 4'hf : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_4 = io_lsu_pkt_m_bits_half ? 4'h3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_5 = io_lsu_pkt_m_bits_by ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_6 = _T_3 | _T_4; // @[Mux.scala 27:72]
  wire [3:0] ldst_byteen_m = _T_6 | _T_5; // @[Mux.scala 27:72]
  wire  addr_match_dw_lo_r_m = io_lsu_addr_r[31:3] == io_lsu_addr_m[31:3]; // @[lsu_bus_intf.scala 155:51]
  wire  _T_14 = io_lsu_addr_r[2] ^ io_lsu_addr_m[2]; // @[lsu_bus_intf.scala 156:71]
  wire  _T_15 = ~_T_14; // @[lsu_bus_intf.scala 156:53]
  wire  addr_match_word_lo_r_m = addr_match_dw_lo_r_m & _T_15; // @[lsu_bus_intf.scala 156:51]
  wire  _T_17 = ~io_ldst_dual_r; // @[lsu_bus_intf.scala 157:48]
  wire  _T_18 = io_lsu_busreq_r & _T_17; // @[lsu_bus_intf.scala 157:46]
  wire  _T_19 = _T_18 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 157:64]
  wire  _T_20 = ~addr_match_word_lo_r_m; // @[lsu_bus_intf.scala 157:110]
  wire  _T_21 = io_lsu_pkt_m_bits_load | _T_20; // @[lsu_bus_intf.scala 157:108]
  wire  _T_26 = ~addr_match_dw_lo_r_m; // @[lsu_bus_intf.scala 158:110]
  wire  _T_27 = io_lsu_pkt_m_bits_load | _T_26; // @[lsu_bus_intf.scala 158:108]
  wire [6:0] _GEN_0 = {{3'd0}, ldst_byteen_m}; // @[lsu_bus_intf.scala 160:49]
  wire [6:0] _T_31 = _GEN_0 << io_lsu_addr_m[1:0]; // @[lsu_bus_intf.scala 160:49]
  reg [3:0] ldst_byteen_r; // @[lsu_bus_intf.scala 200:33]
  wire [6:0] _GEN_1 = {{3'd0}, ldst_byteen_r}; // @[lsu_bus_intf.scala 161:49]
  wire [6:0] _T_34 = _GEN_1 << io_lsu_addr_r[1:0]; // @[lsu_bus_intf.scala 161:49]
  wire [4:0] _T_37 = {io_lsu_addr_r[1:0],3'h0}; // @[Cat.scala 29:58]
  wire [62:0] _GEN_2 = {{31'd0}, io_store_data_r}; // @[lsu_bus_intf.scala 162:52]
  wire [62:0] _T_38 = _GEN_2 << _T_37; // @[lsu_bus_intf.scala 162:52]
  wire [7:0] ldst_byteen_ext_m = {{1'd0}, _T_31}; // @[lsu_bus_intf.scala 160:27]
  wire [3:0] ldst_byteen_hi_m = ldst_byteen_ext_m[7:4]; // @[lsu_bus_intf.scala 163:47]
  wire [3:0] ldst_byteen_lo_m = ldst_byteen_ext_m[3:0]; // @[lsu_bus_intf.scala 164:47]
  wire [7:0] ldst_byteen_ext_r = {{1'd0}, _T_34}; // @[lsu_bus_intf.scala 161:27]
  wire [3:0] ldst_byteen_hi_r = ldst_byteen_ext_r[7:4]; // @[lsu_bus_intf.scala 165:47]
  wire [3:0] ldst_byteen_lo_r = ldst_byteen_ext_r[3:0]; // @[lsu_bus_intf.scala 166:47]
  wire [63:0] store_data_ext_r = {{1'd0}, _T_38}; // @[lsu_bus_intf.scala 162:27]
  wire [31:0] store_data_hi_r = store_data_ext_r[63:32]; // @[lsu_bus_intf.scala 168:46]
  wire [31:0] store_data_lo_r = store_data_ext_r[31:0]; // @[lsu_bus_intf.scala 169:46]
  wire  _T_47 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_bus_intf.scala 170:51]
  wire  _T_48 = _T_47 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 170:76]
  wire  _T_49 = _T_48 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 170:97]
  wire  ld_addr_rhit_lo_lo = _T_49 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 170:123]
  wire  _T_53 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[lsu_bus_intf.scala 171:51]
  wire  _T_54 = _T_53 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 171:76]
  wire  _T_55 = _T_54 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 171:97]
  wire  ld_addr_rhit_lo_hi = _T_55 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 171:123]
  wire  _T_59 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_bus_intf.scala 172:51]
  wire  _T_60 = _T_59 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 172:76]
  wire  _T_61 = _T_60 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 172:97]
  wire  ld_addr_rhit_hi_lo = _T_61 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 172:123]
  wire  _T_65 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[lsu_bus_intf.scala 173:51]
  wire  _T_66 = _T_65 & io_lsu_pkt_r_valid; // @[lsu_bus_intf.scala 173:76]
  wire  _T_67 = _T_66 & io_lsu_pkt_r_bits_store; // @[lsu_bus_intf.scala 173:97]
  wire  ld_addr_rhit_hi_hi = _T_67 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 173:123]
  wire  _T_70 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[0]; // @[lsu_bus_intf.scala 175:70]
  wire  _T_72 = _T_70 & ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 175:92]
  wire  _T_74 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[1]; // @[lsu_bus_intf.scala 175:70]
  wire  _T_76 = _T_74 & ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 175:92]
  wire  _T_78 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[2]; // @[lsu_bus_intf.scala 175:70]
  wire  _T_80 = _T_78 & ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 175:92]
  wire  _T_82 = ld_addr_rhit_lo_lo & ldst_byteen_lo_r[3]; // @[lsu_bus_intf.scala 175:70]
  wire  _T_84 = _T_82 & ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 175:92]
  wire [3:0] ld_byte_rhit_lo_lo = {_T_84,_T_80,_T_76,_T_72}; // @[Cat.scala 29:58]
  wire  _T_89 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[0]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_91 = _T_89 & ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_93 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[1]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_95 = _T_93 & ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_97 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[2]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_99 = _T_97 & ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 176:92]
  wire  _T_101 = ld_addr_rhit_lo_hi & ldst_byteen_lo_r[3]; // @[lsu_bus_intf.scala 176:70]
  wire  _T_103 = _T_101 & ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 176:92]
  wire [3:0] ld_byte_rhit_lo_hi = {_T_103,_T_99,_T_95,_T_91}; // @[Cat.scala 29:58]
  wire  _T_108 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[0]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_110 = _T_108 & ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_112 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[1]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_114 = _T_112 & ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_116 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[2]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_118 = _T_116 & ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 177:92]
  wire  _T_120 = ld_addr_rhit_hi_lo & ldst_byteen_hi_r[3]; // @[lsu_bus_intf.scala 177:70]
  wire  _T_122 = _T_120 & ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 177:92]
  wire [3:0] ld_byte_rhit_hi_lo = {_T_122,_T_118,_T_114,_T_110}; // @[Cat.scala 29:58]
  wire  _T_127 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[0]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_129 = _T_127 & ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_131 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[1]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_133 = _T_131 & ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_135 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[2]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_137 = _T_135 & ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 178:92]
  wire  _T_139 = ld_addr_rhit_hi_hi & ldst_byteen_hi_r[3]; // @[lsu_bus_intf.scala 178:70]
  wire  _T_141 = _T_139 & ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 178:92]
  wire [3:0] ld_byte_rhit_hi_hi = {_T_141,_T_137,_T_133,_T_129}; // @[Cat.scala 29:58]
  wire  _T_147 = ld_byte_rhit_lo_lo[0] | ld_byte_rhit_hi_lo[0]; // @[lsu_bus_intf.scala 180:73]
  wire [3:0] ld_byte_hit_buf_lo = bus_buffer_io_ld_byte_hit_buf_lo; // @[lsu_bus_intf.scala 139:38]
  wire  _T_149 = _T_147 | ld_byte_hit_buf_lo[0]; // @[lsu_bus_intf.scala 180:97]
  wire  _T_152 = ld_byte_rhit_lo_lo[1] | ld_byte_rhit_hi_lo[1]; // @[lsu_bus_intf.scala 180:73]
  wire  _T_154 = _T_152 | ld_byte_hit_buf_lo[1]; // @[lsu_bus_intf.scala 180:97]
  wire  _T_157 = ld_byte_rhit_lo_lo[2] | ld_byte_rhit_hi_lo[2]; // @[lsu_bus_intf.scala 180:73]
  wire  _T_159 = _T_157 | ld_byte_hit_buf_lo[2]; // @[lsu_bus_intf.scala 180:97]
  wire  _T_162 = ld_byte_rhit_lo_lo[3] | ld_byte_rhit_hi_lo[3]; // @[lsu_bus_intf.scala 180:73]
  wire  _T_164 = _T_162 | ld_byte_hit_buf_lo[3]; // @[lsu_bus_intf.scala 180:97]
  wire [3:0] ld_byte_hit_lo = {_T_164,_T_159,_T_154,_T_149}; // @[Cat.scala 29:58]
  wire  _T_170 = ld_byte_rhit_lo_hi[0] | ld_byte_rhit_hi_hi[0]; // @[lsu_bus_intf.scala 181:73]
  wire [3:0] ld_byte_hit_buf_hi = bus_buffer_io_ld_byte_hit_buf_hi; // @[lsu_bus_intf.scala 140:38]
  wire  _T_172 = _T_170 | ld_byte_hit_buf_hi[0]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_175 = ld_byte_rhit_lo_hi[1] | ld_byte_rhit_hi_hi[1]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_177 = _T_175 | ld_byte_hit_buf_hi[1]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_180 = ld_byte_rhit_lo_hi[2] | ld_byte_rhit_hi_hi[2]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_182 = _T_180 | ld_byte_hit_buf_hi[2]; // @[lsu_bus_intf.scala 181:97]
  wire  _T_185 = ld_byte_rhit_lo_hi[3] | ld_byte_rhit_hi_hi[3]; // @[lsu_bus_intf.scala 181:73]
  wire  _T_187 = _T_185 | ld_byte_hit_buf_hi[3]; // @[lsu_bus_intf.scala 181:97]
  wire [3:0] ld_byte_hit_hi = {_T_187,_T_182,_T_177,_T_172}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = {_T_162,_T_157,_T_152,_T_147}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = {_T_185,_T_180,_T_175,_T_170}; // @[Cat.scala 29:58]
  wire [7:0] _T_225 = ld_byte_rhit_lo_lo[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_226 = ld_byte_rhit_hi_lo[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_227 = _T_225 | _T_226; // @[Mux.scala 27:72]
  wire [7:0] _T_233 = ld_byte_rhit_lo_lo[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_234 = ld_byte_rhit_hi_lo[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_235 = _T_233 | _T_234; // @[Mux.scala 27:72]
  wire [7:0] _T_241 = ld_byte_rhit_lo_lo[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_242 = ld_byte_rhit_hi_lo[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_243 = _T_241 | _T_242; // @[Mux.scala 27:72]
  wire [7:0] _T_249 = ld_byte_rhit_lo_lo[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_250 = ld_byte_rhit_hi_lo[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_251 = _T_249 | _T_250; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_lo = {_T_251,_T_243,_T_235,_T_227}; // @[Cat.scala 29:58]
  wire [7:0] _T_260 = ld_byte_rhit_lo_hi[0] ? store_data_lo_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_261 = ld_byte_rhit_hi_hi[0] ? store_data_hi_r[7:0] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_262 = _T_260 | _T_261; // @[Mux.scala 27:72]
  wire [7:0] _T_268 = ld_byte_rhit_lo_hi[1] ? store_data_lo_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_269 = ld_byte_rhit_hi_hi[1] ? store_data_hi_r[15:8] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_270 = _T_268 | _T_269; // @[Mux.scala 27:72]
  wire [7:0] _T_276 = ld_byte_rhit_lo_hi[2] ? store_data_lo_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_277 = ld_byte_rhit_hi_hi[2] ? store_data_hi_r[23:16] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_278 = _T_276 | _T_277; // @[Mux.scala 27:72]
  wire [7:0] _T_284 = ld_byte_rhit_lo_hi[3] ? store_data_lo_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_285 = ld_byte_rhit_hi_hi[3] ? store_data_hi_r[31:24] : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_286 = _T_284 | _T_285; // @[Mux.scala 27:72]
  wire [31:0] ld_fwddata_rpipe_hi = {_T_286,_T_278,_T_270,_T_262}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_lo = bus_buffer_io_ld_fwddata_buf_lo; // @[lsu_bus_intf.scala 141:38]
  wire [7:0] _T_294 = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : ld_fwddata_buf_lo[7:0]; // @[lsu_bus_intf.scala 186:54]
  wire [7:0] _T_298 = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : ld_fwddata_buf_lo[15:8]; // @[lsu_bus_intf.scala 186:54]
  wire [7:0] _T_302 = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : ld_fwddata_buf_lo[23:16]; // @[lsu_bus_intf.scala 186:54]
  wire [7:0] _T_306 = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : ld_fwddata_buf_lo[31:24]; // @[lsu_bus_intf.scala 186:54]
  wire [31:0] _T_309 = {_T_306,_T_302,_T_298,_T_294}; // @[Cat.scala 29:58]
  wire [31:0] ld_fwddata_buf_hi = bus_buffer_io_ld_fwddata_buf_hi; // @[lsu_bus_intf.scala 142:38]
  wire [7:0] _T_313 = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : ld_fwddata_buf_hi[7:0]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_317 = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : ld_fwddata_buf_hi[15:8]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_321 = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : ld_fwddata_buf_hi[23:16]; // @[lsu_bus_intf.scala 187:54]
  wire [7:0] _T_325 = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : ld_fwddata_buf_hi[31:24]; // @[lsu_bus_intf.scala 187:54]
  wire [31:0] _T_328 = {_T_325,_T_321,_T_317,_T_313}; // @[Cat.scala 29:58]
  wire  _T_331 = ~ldst_byteen_lo_m[0]; // @[lsu_bus_intf.scala 188:72]
  wire  _T_332 = ld_byte_hit_lo[0] | _T_331; // @[lsu_bus_intf.scala 188:70]
  wire  _T_335 = ~ldst_byteen_lo_m[1]; // @[lsu_bus_intf.scala 188:72]
  wire  _T_336 = ld_byte_hit_lo[1] | _T_335; // @[lsu_bus_intf.scala 188:70]
  wire  _T_339 = ~ldst_byteen_lo_m[2]; // @[lsu_bus_intf.scala 188:72]
  wire  _T_340 = ld_byte_hit_lo[2] | _T_339; // @[lsu_bus_intf.scala 188:70]
  wire  _T_343 = ~ldst_byteen_lo_m[3]; // @[lsu_bus_intf.scala 188:72]
  wire  _T_344 = ld_byte_hit_lo[3] | _T_343; // @[lsu_bus_intf.scala 188:70]
  wire  _T_345 = _T_332 & _T_336; // @[lsu_bus_intf.scala 188:111]
  wire  _T_346 = _T_345 & _T_340; // @[lsu_bus_intf.scala 188:111]
  wire  ld_full_hit_lo_m = _T_346 & _T_344; // @[lsu_bus_intf.scala 188:111]
  wire  _T_350 = ~ldst_byteen_hi_m[0]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_351 = ld_byte_hit_hi[0] | _T_350; // @[lsu_bus_intf.scala 189:70]
  wire  _T_354 = ~ldst_byteen_hi_m[1]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_355 = ld_byte_hit_hi[1] | _T_354; // @[lsu_bus_intf.scala 189:70]
  wire  _T_358 = ~ldst_byteen_hi_m[2]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_359 = ld_byte_hit_hi[2] | _T_358; // @[lsu_bus_intf.scala 189:70]
  wire  _T_362 = ~ldst_byteen_hi_m[3]; // @[lsu_bus_intf.scala 189:72]
  wire  _T_363 = ld_byte_hit_hi[3] | _T_362; // @[lsu_bus_intf.scala 189:70]
  wire  _T_364 = _T_351 & _T_355; // @[lsu_bus_intf.scala 189:111]
  wire  _T_365 = _T_364 & _T_359; // @[lsu_bus_intf.scala 189:111]
  wire  ld_full_hit_hi_m = _T_365 & _T_363; // @[lsu_bus_intf.scala 189:111]
  wire  _T_367 = ld_full_hit_lo_m & ld_full_hit_hi_m; // @[lsu_bus_intf.scala 190:47]
  wire  _T_368 = _T_367 & io_lsu_busreq_m; // @[lsu_bus_intf.scala 190:66]
  wire  _T_369 = _T_368 & io_lsu_pkt_m_bits_load; // @[lsu_bus_intf.scala 190:84]
  wire  _T_370 = ~io_is_sideeffects_m; // @[lsu_bus_intf.scala 190:111]
  wire [63:0] ld_fwddata_hi = {{32'd0}, _T_328}; // @[lsu_bus_intf.scala 187:27]
  wire [63:0] ld_fwddata_lo = {{32'd0}, _T_309}; // @[lsu_bus_intf.scala 186:27]
  wire [63:0] _T_374 = {ld_fwddata_hi[31:0],ld_fwddata_lo[31:0]}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_3 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[lsu_bus_intf.scala 191:83]
  wire [5:0] _T_376 = 4'h8 * _GEN_3; // @[lsu_bus_intf.scala 191:83]
  wire [63:0] ld_fwddata_m = _T_374 >> _T_376; // @[lsu_bus_intf.scala 191:76]
  reg  lsu_bus_clk_en_q; // @[lsu_bus_intf.scala 195:32]
  reg  is_sideeffects_r; // @[lsu_bus_intf.scala 199:33]
  lsu_bus_buffer bus_buffer ( // @[lsu_bus_intf.scala 100:39]
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
  assign io_tlu_busbuff_lsu_pmu_bus_trxn = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_pmu_bus_misaligned = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_pmu_bus_error = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_pmu_bus_busy = bus_buffer_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_imprecise_error_load_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_imprecise_error_store_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu_bus_intf.scala 103:18]
  assign io_tlu_busbuff_lsu_imprecise_error_addr_any = bus_buffer_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu_bus_intf.scala 103:18]
  assign io_axi_aw_valid = bus_buffer_io_lsu_axi_aw_valid; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_aw_bits_id = bus_buffer_io_lsu_axi_aw_bits_id; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_aw_bits_addr = bus_buffer_io_lsu_axi_aw_bits_addr; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_aw_bits_region = bus_buffer_io_lsu_axi_aw_bits_region; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_aw_bits_size = bus_buffer_io_lsu_axi_aw_bits_size; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_aw_bits_cache = bus_buffer_io_lsu_axi_aw_bits_cache; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_w_valid = bus_buffer_io_lsu_axi_w_valid; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_w_bits_data = bus_buffer_io_lsu_axi_w_bits_data; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_w_bits_strb = bus_buffer_io_lsu_axi_w_bits_strb; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_valid = bus_buffer_io_lsu_axi_ar_valid; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_bits_id = bus_buffer_io_lsu_axi_ar_bits_id; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_bits_addr = bus_buffer_io_lsu_axi_ar_bits_addr; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_bits_region = bus_buffer_io_lsu_axi_ar_bits_region; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_bits_size = bus_buffer_io_lsu_axi_ar_bits_size; // @[lsu_bus_intf.scala 131:51]
  assign io_axi_ar_bits_cache = bus_buffer_io_lsu_axi_ar_bits_cache; // @[lsu_bus_intf.scala 131:51]
  assign io_lsu_busreq_r = bus_buffer_io_lsu_busreq_r; // @[lsu_bus_intf.scala 134:38]
  assign io_lsu_bus_buffer_pend_any = bus_buffer_io_lsu_bus_buffer_pend_any; // @[lsu_bus_intf.scala 135:38]
  assign io_lsu_bus_buffer_full_any = bus_buffer_io_lsu_bus_buffer_full_any; // @[lsu_bus_intf.scala 136:38]
  assign io_lsu_bus_buffer_empty_any = bus_buffer_io_lsu_bus_buffer_empty_any; // @[lsu_bus_intf.scala 137:38]
  assign io_bus_read_data_m = ld_fwddata_m[31:0]; // @[lsu_bus_intf.scala 192:27]
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
  assign bus_buffer_io_scan_mode = io_scan_mode; // @[lsu_bus_intf.scala 102:29]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_external_ldfwd_disable = io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu_bus_intf.scala 103:18]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_wb_coalescing_disable = io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu_bus_intf.scala 103:18]
  assign bus_buffer_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu_bus_intf.scala 103:18]
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
  assign bus_buffer_io_no_word_merge_r = _T_19 & _T_21; // @[lsu_bus_intf.scala 144:51]
  assign bus_buffer_io_no_dword_merge_r = _T_19 & _T_27; // @[lsu_bus_intf.scala 145:51]
  assign bus_buffer_io_lsu_busreq_m = io_lsu_busreq_m; // @[lsu_bus_intf.scala 127:51]
  assign bus_buffer_io_ld_full_hit_m = _T_369 & _T_370; // @[lsu_bus_intf.scala 151:51]
  assign bus_buffer_io_flush_m_up = io_flush_m_up; // @[lsu_bus_intf.scala 128:51]
  assign bus_buffer_io_flush_r = io_flush_r; // @[lsu_bus_intf.scala 129:51]
  assign bus_buffer_io_lsu_commit_r = io_lsu_commit_r; // @[lsu_bus_intf.scala 130:51]
  assign bus_buffer_io_is_sideeffects_r = is_sideeffects_r; // @[lsu_bus_intf.scala 146:51]
  assign bus_buffer_io_ldst_dual_d = io_ldst_dual_d; // @[lsu_bus_intf.scala 147:51]
  assign bus_buffer_io_ldst_dual_m = io_ldst_dual_m; // @[lsu_bus_intf.scala 148:51]
  assign bus_buffer_io_ldst_dual_r = io_ldst_dual_r; // @[lsu_bus_intf.scala 149:51]
  assign bus_buffer_io_ldst_byteen_ext_m = {{1'd0}, _T_31}; // @[lsu_bus_intf.scala 150:51]
  assign bus_buffer_io_lsu_axi_aw_ready = io_axi_aw_ready; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_w_ready = io_axi_w_ready; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_b_valid = io_axi_b_valid; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_b_bits_resp = io_axi_b_bits_resp; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_b_bits_id = io_axi_b_bits_id; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_ar_ready = io_axi_ar_ready; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_r_valid = io_axi_r_valid; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_r_bits_id = io_axi_r_bits_id; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_r_bits_data = io_axi_r_bits_data; // @[lsu_bus_intf.scala 131:51]
  assign bus_buffer_io_lsu_axi_r_bits_resp = io_axi_r_bits_resp; // @[lsu_bus_intf.scala 131:51]
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
  ldst_byteen_r = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_bus_clk_en_q = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  is_sideeffects_r = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ldst_byteen_r = 4'h0;
  end
  if (reset) begin
    lsu_bus_clk_en_q = 1'h0;
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
      ldst_byteen_r <= 4'h0;
    end else begin
      ldst_byteen_r <= _T_6 | _T_5;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      lsu_bus_clk_en_q <= 1'h0;
    end else begin
      lsu_bus_clk_en_q <= io_lsu_bus_clk_en;
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
  output        io_lsu_active,
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
  input         io_active_clk
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_lsc_ctl_clock; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_reset; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_clk_override; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_c1_m_clk; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_c1_r_clk; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_c2_m_clk; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_c2_r_clk; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_store_c1_m_clk; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_r; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_flush_m_up; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_flush_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_ldst_dual_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_ldst_dual_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs1_d; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs2_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_valid; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_fast_int; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_by; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_half; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_word; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_dword; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_load; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_unsign; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_dma; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_load_ldst_bypass_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_dec_lsu_valid_raw_d; // @[lsu.scala 65:30]
  wire [11:0] lsu_lsc_ctl_io_dec_lsu_offset_d; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_picm_mask_data_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_bus_read_data_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_corr_r; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_d; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_d; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_dec_tlu_mrac_ff; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_exc_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_is_sideeffects_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_valid; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_single_ecc_error; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_inst_type; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_bits_exc_type; // @[lsu.scala 65:30]
  wire [3:0] lsu_lsc_ctl_io_lsu_error_pkt_r_bits_mscause; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_error_pkt_r_bits_addr; // @[lsu.scala 65:30]
  wire [30:0] lsu_lsc_ctl_io_lsu_fir_addr; // @[lsu.scala 65:30]
  wire [1:0] lsu_lsc_ctl_io_lsu_fir_error; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_r; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 65:30]
  wire [31:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_addr; // @[lsu.scala 65:30]
  wire [2:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_sz; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 65:30]
  wire [63:0] lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_wdata; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_fast_int; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_by; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_half; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_unsign; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_load_ldst_bypass_d; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_bits_store_data_bypass_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_fast_int; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_dword; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_unsign; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_bits_store_data_bypass_m; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_dword; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 65:30]
  wire  lsu_lsc_ctl_io_scan_mode; // @[lsu.scala 65:30]
  wire  dccm_ctl_clock; // @[lsu.scala 68:30]
  wire  dccm_ctl_reset; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_clk_override; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_c2_m_clk; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_free_c2_clk; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_store_c1_r_clk; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_dccm_d; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_dccm_m; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_dccm_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_pic_d; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_pic_m; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_addr_in_pic_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_raw_fwd_lo_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_raw_fwd_hi_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_commit_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_ldst_dual_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_addr_d; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_lsu_addr_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_addr_r; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_end_addr_d; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_end_addr_m; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_end_addr_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_stbuf_reqvld_any; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_stbuf_addr_any; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_stbuf_data_any; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_stbuf_ecc_any; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_hi_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_lo_m; // @[lsu.scala 68:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 68:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_single_ecc_error_hi_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_single_ecc_error_lo_r; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_r_ff; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_r_ff; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_hi_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_lo_m; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_hi_m; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_lo_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_m; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_data_m; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dma_dccm_wen; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dma_pic_wen; // @[lsu.scala 68:30]
  wire [2:0] dccm_ctl_io_dma_mem_tag_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_lo; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_hi; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 68:30]
  wire [6:0] dccm_ctl_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_data_hi_r; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_data_lo_r; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_datafn_hi_r; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_datafn_lo_r; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_store_data_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_picm_mask_data_m; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_stbuf_commit_any; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_dccm_rden_m; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_dma_dccm_ctl_dma_mem_addr; // @[lsu.scala 68:30]
  wire [63:0] dccm_ctl_io_dma_dccm_ctl_dma_mem_wdata; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dma_dccm_ctl_dccm_dma_rvalid; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dma_dccm_ctl_dccm_dma_ecc_error; // @[lsu.scala 68:30]
  wire [2:0] dccm_ctl_io_dma_dccm_ctl_dccm_dma_rtag; // @[lsu.scala 68:30]
  wire [63:0] dccm_ctl_io_dma_dccm_ctl_dccm_dma_rdata; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dccm_wren; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_dccm_rden; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_lo; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_hi; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_lo; // @[lsu.scala 68:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_hi; // @[lsu.scala 68:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_lo; // @[lsu.scala 68:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_hi; // @[lsu.scala 68:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_lo; // @[lsu.scala 68:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_hi; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pic_picm_wren; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pic_picm_rden; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_lsu_pic_picm_mken; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_rdaddr; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_wraddr; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_wr_data; // @[lsu.scala 68:30]
  wire [31:0] dccm_ctl_io_lsu_pic_picm_rd_data; // @[lsu.scala 68:30]
  wire  dccm_ctl_io_scan_mode; // @[lsu.scala 68:30]
  wire  stbuf_clock; // @[lsu.scala 69:30]
  wire  stbuf_reset; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_stbuf_c1_clk; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_free_c2_clk; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_m_valid; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_m_bits_store; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_m_bits_dma; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_valid; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_by; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_half; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_word; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_dword; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_store; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_pkt_r_bits_dma; // @[lsu.scala 69:30]
  wire  stbuf_io_store_stbuf_reqvld_r; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_commit_r; // @[lsu.scala 69:30]
  wire  stbuf_io_dec_lsu_valid_raw_d; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_store_data_hi_r; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_store_data_lo_r; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_store_datafn_hi_r; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_store_datafn_lo_r; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_stbuf_commit_any; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_lsu_addr_m; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_lsu_addr_r; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_end_addr_m; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_end_addr_r; // @[lsu.scala 69:30]
  wire  stbuf_io_ldst_dual_d; // @[lsu.scala 69:30]
  wire  stbuf_io_ldst_dual_m; // @[lsu.scala 69:30]
  wire  stbuf_io_ldst_dual_r; // @[lsu.scala 69:30]
  wire  stbuf_io_addr_in_dccm_m; // @[lsu.scala 69:30]
  wire  stbuf_io_addr_in_dccm_r; // @[lsu.scala 69:30]
  wire  stbuf_io_scan_mode; // @[lsu.scala 69:30]
  wire  stbuf_io_stbuf_reqvld_any; // @[lsu.scala 69:30]
  wire  stbuf_io_stbuf_reqvld_flushed_any; // @[lsu.scala 69:30]
  wire [15:0] stbuf_io_stbuf_addr_any; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_stbuf_data_any; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_stbuf_full_any; // @[lsu.scala 69:30]
  wire  stbuf_io_lsu_stbuf_empty_any; // @[lsu.scala 69:30]
  wire  stbuf_io_ldst_stbuf_reqvld_r; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_stbuf_fwddata_hi_m; // @[lsu.scala 69:30]
  wire [31:0] stbuf_io_stbuf_fwddata_lo_m; // @[lsu.scala 69:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 69:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 69:30]
  wire  ecc_clock; // @[lsu.scala 70:30]
  wire  ecc_reset; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_c2_r_clk; // @[lsu.scala 70:30]
  wire  ecc_io_clk_override; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_pkt_m_valid; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_pkt_m_bits_load; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_pkt_m_bits_store; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_pkt_m_bits_dma; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_stbuf_data_any; // @[lsu.scala 70:30]
  wire  ecc_io_dec_tlu_core_ecc_disable; // @[lsu.scala 70:30]
  wire [15:0] ecc_io_lsu_addr_m; // @[lsu.scala 70:30]
  wire [15:0] ecc_io_end_addr_m; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_dccm_rdata_hi_m; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_dccm_rdata_lo_m; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_dccm_data_ecc_hi_m; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_dccm_data_ecc_lo_m; // @[lsu.scala 70:30]
  wire  ecc_io_ld_single_ecc_error_r; // @[lsu.scala 70:30]
  wire  ecc_io_ld_single_ecc_error_r_ff; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_dccm_rden_m; // @[lsu.scala 70:30]
  wire  ecc_io_addr_in_dccm_m; // @[lsu.scala 70:30]
  wire  ecc_io_dma_dccm_wen; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_dma_dccm_wdata_lo; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_dma_dccm_wdata_hi; // @[lsu.scala 70:30]
  wire  ecc_io_scan_mode; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_hi_r; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_lo_r; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_hi_m; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_lo_m; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_hi_r_ff; // @[lsu.scala 70:30]
  wire [31:0] ecc_io_sec_data_lo_r_ff; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_stbuf_ecc_any; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 70:30]
  wire [6:0] ecc_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 70:30]
  wire  ecc_io_single_ecc_error_hi_r; // @[lsu.scala 70:30]
  wire  ecc_io_single_ecc_error_lo_r; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_single_ecc_error_r; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_single_ecc_error_m; // @[lsu.scala 70:30]
  wire  ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 70:30]
  wire  trigger_io_trigger_pkt_any_0_select; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_0_match_pkt; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_0_store; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_0_load; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_0_m; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_trigger_pkt_any_0_tdata2; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_1_select; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_1_match_pkt; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_1_store; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_1_load; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_1_m; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_trigger_pkt_any_1_tdata2; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_2_select; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_2_match_pkt; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_2_store; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_2_load; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_2_m; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_trigger_pkt_any_2_tdata2; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_3_select; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_3_match_pkt; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_3_store; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_3_load; // @[lsu.scala 71:30]
  wire  trigger_io_trigger_pkt_any_3_m; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_trigger_pkt_any_3_tdata2; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_valid; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_bits_half; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_bits_word; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_bits_load; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_bits_store; // @[lsu.scala 71:30]
  wire  trigger_io_lsu_pkt_m_bits_dma; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_lsu_addr_m; // @[lsu.scala 71:30]
  wire [31:0] trigger_io_store_data_m; // @[lsu.scala 71:30]
  wire [3:0] trigger_io_lsu_trigger_match_m; // @[lsu.scala 71:30]
  wire  clkdomain_clock; // @[lsu.scala 72:30]
  wire  clkdomain_reset; // @[lsu.scala 72:30]
  wire  clkdomain_io_active_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_clk_override; // @[lsu.scala 72:30]
  wire  clkdomain_io_dec_tlu_force_halt; // @[lsu.scala 72:30]
  wire  clkdomain_io_dma_dccm_req; // @[lsu.scala 72:30]
  wire  clkdomain_io_ldst_stbuf_reqvld_r; // @[lsu.scala 72:30]
  wire  clkdomain_io_stbuf_reqvld_any; // @[lsu.scala 72:30]
  wire  clkdomain_io_stbuf_reqvld_flushed_any; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_busreq_r; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_buffer_pend_any; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_buffer_empty_any; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_stbuf_empty_any; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_clk_en; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_p_valid; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_pkt_d_valid; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_pkt_d_bits_store; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_pkt_m_valid; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_pkt_m_bits_store; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_pkt_r_valid; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_obuf_c1_clken; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_busm_clken; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_store_c1_m_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_store_c1_r_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_stbuf_c1_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_bus_buf_c1_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_busm_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 72:30]
  wire  clkdomain_io_scan_mode; // @[lsu.scala 72:30]
  wire  bus_intf_clock; // @[lsu.scala 73:30]
  wire  bus_intf_reset; // @[lsu.scala 73:30]
  wire  bus_intf_io_scan_mode; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu.scala 73:30]
  wire  bus_intf_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_c1_r_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_c2_r_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_buf_c1_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_free_c2_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_active_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_busm_clk; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_aw_ready; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_aw_valid; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_aw_bits_id; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_axi_aw_bits_addr; // @[lsu.scala 73:30]
  wire [3:0] bus_intf_io_axi_aw_bits_region; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_aw_bits_size; // @[lsu.scala 73:30]
  wire [3:0] bus_intf_io_axi_aw_bits_cache; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_w_ready; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_w_valid; // @[lsu.scala 73:30]
  wire [63:0] bus_intf_io_axi_w_bits_data; // @[lsu.scala 73:30]
  wire [7:0] bus_intf_io_axi_w_bits_strb; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_b_valid; // @[lsu.scala 73:30]
  wire [1:0] bus_intf_io_axi_b_bits_resp; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_b_bits_id; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_ar_ready; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_ar_valid; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_ar_bits_id; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_axi_ar_bits_addr; // @[lsu.scala 73:30]
  wire [3:0] bus_intf_io_axi_ar_bits_region; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_ar_bits_size; // @[lsu.scala 73:30]
  wire [3:0] bus_intf_io_axi_ar_bits_cache; // @[lsu.scala 73:30]
  wire  bus_intf_io_axi_r_valid; // @[lsu.scala 73:30]
  wire [2:0] bus_intf_io_axi_r_bits_id; // @[lsu.scala 73:30]
  wire [63:0] bus_intf_io_axi_r_bits_data; // @[lsu.scala 73:30]
  wire [1:0] bus_intf_io_axi_r_bits_resp; // @[lsu.scala 73:30]
  wire  bus_intf_io_dec_lsu_valid_raw_d; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_busreq_m; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_m_valid; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_m_bits_by; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_m_bits_half; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_m_bits_word; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_m_bits_load; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_valid; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_by; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_half; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_word; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_load; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_store; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_lsu_addr_m; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_lsu_addr_r; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_end_addr_m; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_end_addr_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_ldst_dual_d; // @[lsu.scala 73:30]
  wire  bus_intf_io_ldst_dual_m; // @[lsu.scala 73:30]
  wire  bus_intf_io_ldst_dual_r; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_store_data_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_dec_tlu_force_halt; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_commit_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_is_sideeffects_m; // @[lsu.scala 73:30]
  wire  bus_intf_io_flush_m_up; // @[lsu.scala 73:30]
  wire  bus_intf_io_flush_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_busreq_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_buffer_pend_any; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_buffer_full_any; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_bus_read_data_m; // @[lsu.scala 73:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu.scala 73:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu.scala 73:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu.scala 73:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu.scala 73:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu.scala 73:30]
  wire  bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu.scala 73:30]
  wire [1:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu.scala 73:30]
  wire [31:0] bus_intf_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu.scala 73:30]
  wire  bus_intf_io_lsu_bus_clk_en; // @[lsu.scala 73:30]
  wire  _T = stbuf_io_lsu_stbuf_full_any | bus_intf_io_lsu_bus_buffer_full_any; // @[lsu.scala 79:57]
  wire  _T_3 = ~lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 86:58]
  wire  _T_4 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_3; // @[lsu.scala 86:56]
  wire  _T_5 = lsu_lsc_ctl_io_addr_in_dccm_m | lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 86:126]
  wire  _T_6 = _T_4 & _T_5; // @[lsu.scala 86:93]
  wire  ldst_nodma_mtor = _T_6 & lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 86:158]
  wire  _T_7 = io_dec_lsu_valid_raw_d | ldst_nodma_mtor; // @[lsu.scala 87:53]
  wire  _T_8 = _T_7 | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 87:71]
  wire  _T_10 = io_lsu_dma_dma_lsc_ctl_dma_dccm_req & io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 88:58]
  wire  _T_11 = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 88:97]
  wire [5:0] _T_15 = {io_lsu_dma_dma_lsc_ctl_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_dccm_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata >> _T_15; // @[lsu.scala 90:58]
  wire  _T_21 = ~lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 101:130]
  wire  _T_22 = lsu_lsc_ctl_io_lsu_pkt_r_valid & _T_21; // @[lsu.scala 101:128]
  wire  _T_23 = _T_4 | _T_22; // @[lsu.scala 101:94]
  wire  _T_24 = ~_T_23; // @[lsu.scala 101:22]
  wire  _T_26 = lsu_lsc_ctl_io_lsu_pkt_m_valid | lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 102:52]
  wire  _T_27 = _T_26 | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 102:85]
  wire  _T_28 = ~bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 102:127]
  wire  _T_30 = lsu_lsc_ctl_io_lsu_pkt_r_valid & lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 104:61]
  wire  _T_31 = _T_30 & lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 104:99]
  wire  _T_32 = ~io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 104:133]
  wire  _T_33 = _T_31 & _T_32; // @[lsu.scala 104:131]
  wire  _T_35 = lsu_lsc_ctl_io_lsu_pkt_r_bits_by | lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 104:217]
  wire  _T_36 = ~ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 104:257]
  wire  _T_37 = _T_35 & _T_36; // @[lsu.scala 104:255]
  wire  _T_38 = _T_21 | _T_37; // @[lsu.scala 104:180]
  wire  _T_39 = lsu_lsc_ctl_io_lsu_pkt_m_bits_load | lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 106:90]
  wire  _T_43 = _T_39 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 108:131]
  wire  _T_44 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_43; // @[lsu.scala 108:53]
  wire  _T_45 = ~io_dec_tlu_flush_lower_r; // @[lsu.scala 108:167]
  wire  _T_46 = _T_44 & _T_45; // @[lsu.scala 108:165]
  wire  _T_47 = ~lsu_lsc_ctl_io_lsu_exc_m; // @[lsu.scala 108:181]
  wire  _T_48 = _T_46 & _T_47; // @[lsu.scala 108:179]
  wire  _T_49 = ~lsu_lsc_ctl_io_lsu_pkt_m_bits_fast_int; // @[lsu.scala 108:209]
  wire  _T_57 = lsu_lsc_ctl_io_lsu_pkt_m_bits_half & lsu_lsc_ctl_io_lsu_addr_m[0]; // @[lsu.scala 114:100]
  wire  _T_59 = |lsu_lsc_ctl_io_lsu_addr_m[1:0]; // @[lsu.scala 114:203]
  wire  _T_60 = lsu_lsc_ctl_io_lsu_pkt_m_bits_word & _T_59; // @[lsu.scala 114:170]
  wire  _T_61 = _T_57 | _T_60; // @[lsu.scala 114:132]
  wire  _T_63 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 115:73]
  wire  _T_65 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 116:73]
  reg [2:0] dma_mem_tag_m; // @[lsu.scala 339:67]
  reg  lsu_raw_fwd_hi_r; // @[lsu.scala 340:67]
  reg  lsu_raw_fwd_lo_r; // @[lsu.scala 341:67]
  lsu_lsc_ctl lsu_lsc_ctl ( // @[lsu.scala 65:30]
    .clock(lsu_lsc_ctl_clock),
    .reset(lsu_lsc_ctl_reset),
    .io_clk_override(lsu_lsc_ctl_io_clk_override),
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
    .io_ldst_dual_d(lsu_lsc_ctl_io_ldst_dual_d),
    .io_ldst_dual_m(lsu_lsc_ctl_io_ldst_dual_m),
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
    .io_lsu_pkt_r_bits_dma(lsu_lsc_ctl_io_lsu_pkt_r_bits_dma),
    .io_scan_mode(lsu_lsc_ctl_io_scan_mode)
  );
  lsu_dccm_ctl dccm_ctl ( // @[lsu.scala 68:30]
    .clock(dccm_ctl_clock),
    .reset(dccm_ctl_reset),
    .io_clk_override(dccm_ctl_io_clk_override),
    .io_lsu_c2_m_clk(dccm_ctl_io_lsu_c2_m_clk),
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
    .io_ldst_dual_m(dccm_ctl_io_ldst_dual_m),
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
  lsu_stbuf stbuf ( // @[lsu.scala 69:30]
    .clock(stbuf_clock),
    .reset(stbuf_reset),
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
    .io_lsu_addr_m(stbuf_io_lsu_addr_m),
    .io_lsu_addr_r(stbuf_io_lsu_addr_r),
    .io_end_addr_m(stbuf_io_end_addr_m),
    .io_end_addr_r(stbuf_io_end_addr_r),
    .io_ldst_dual_d(stbuf_io_ldst_dual_d),
    .io_ldst_dual_m(stbuf_io_ldst_dual_m),
    .io_ldst_dual_r(stbuf_io_ldst_dual_r),
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
  lsu_ecc ecc ( // @[lsu.scala 70:30]
    .clock(ecc_clock),
    .reset(ecc_reset),
    .io_lsu_c2_r_clk(ecc_io_lsu_c2_r_clk),
    .io_clk_override(ecc_io_clk_override),
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
  lsu_trigger trigger ( // @[lsu.scala 71:30]
    .io_trigger_pkt_any_0_select(trigger_io_trigger_pkt_any_0_select),
    .io_trigger_pkt_any_0_match_pkt(trigger_io_trigger_pkt_any_0_match_pkt),
    .io_trigger_pkt_any_0_store(trigger_io_trigger_pkt_any_0_store),
    .io_trigger_pkt_any_0_load(trigger_io_trigger_pkt_any_0_load),
    .io_trigger_pkt_any_0_m(trigger_io_trigger_pkt_any_0_m),
    .io_trigger_pkt_any_0_tdata2(trigger_io_trigger_pkt_any_0_tdata2),
    .io_trigger_pkt_any_1_select(trigger_io_trigger_pkt_any_1_select),
    .io_trigger_pkt_any_1_match_pkt(trigger_io_trigger_pkt_any_1_match_pkt),
    .io_trigger_pkt_any_1_store(trigger_io_trigger_pkt_any_1_store),
    .io_trigger_pkt_any_1_load(trigger_io_trigger_pkt_any_1_load),
    .io_trigger_pkt_any_1_m(trigger_io_trigger_pkt_any_1_m),
    .io_trigger_pkt_any_1_tdata2(trigger_io_trigger_pkt_any_1_tdata2),
    .io_trigger_pkt_any_2_select(trigger_io_trigger_pkt_any_2_select),
    .io_trigger_pkt_any_2_match_pkt(trigger_io_trigger_pkt_any_2_match_pkt),
    .io_trigger_pkt_any_2_store(trigger_io_trigger_pkt_any_2_store),
    .io_trigger_pkt_any_2_load(trigger_io_trigger_pkt_any_2_load),
    .io_trigger_pkt_any_2_m(trigger_io_trigger_pkt_any_2_m),
    .io_trigger_pkt_any_2_tdata2(trigger_io_trigger_pkt_any_2_tdata2),
    .io_trigger_pkt_any_3_select(trigger_io_trigger_pkt_any_3_select),
    .io_trigger_pkt_any_3_match_pkt(trigger_io_trigger_pkt_any_3_match_pkt),
    .io_trigger_pkt_any_3_store(trigger_io_trigger_pkt_any_3_store),
    .io_trigger_pkt_any_3_load(trigger_io_trigger_pkt_any_3_load),
    .io_trigger_pkt_any_3_m(trigger_io_trigger_pkt_any_3_m),
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
  lsu_clkdomain clkdomain ( // @[lsu.scala 72:30]
    .clock(clkdomain_clock),
    .reset(clkdomain_reset),
    .io_active_clk(clkdomain_io_active_clk),
    .io_clk_override(clkdomain_io_clk_override),
    .io_dec_tlu_force_halt(clkdomain_io_dec_tlu_force_halt),
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
    .io_lsu_bus_obuf_c1_clken(clkdomain_io_lsu_bus_obuf_c1_clken),
    .io_lsu_busm_clken(clkdomain_io_lsu_busm_clken),
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
  lsu_bus_intf bus_intf ( // @[lsu.scala 73:30]
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
    .io_lsu_c1_r_clk(bus_intf_io_lsu_c1_r_clk),
    .io_lsu_c2_r_clk(bus_intf_io_lsu_c2_r_clk),
    .io_lsu_bus_ibuf_c1_clk(bus_intf_io_lsu_bus_ibuf_c1_clk),
    .io_lsu_bus_obuf_c1_clk(bus_intf_io_lsu_bus_obuf_c1_clk),
    .io_lsu_bus_buf_c1_clk(bus_intf_io_lsu_bus_buf_c1_clk),
    .io_lsu_free_c2_clk(bus_intf_io_lsu_free_c2_clk),
    .io_active_clk(bus_intf_io_active_clk),
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
    .io_lsu_addr_m(bus_intf_io_lsu_addr_m),
    .io_lsu_addr_r(bus_intf_io_lsu_addr_r),
    .io_end_addr_m(bus_intf_io_end_addr_m),
    .io_end_addr_r(bus_intf_io_end_addr_r),
    .io_ldst_dual_d(bus_intf_io_ldst_dual_d),
    .io_ldst_dual_m(bus_intf_io_ldst_dual_m),
    .io_ldst_dual_r(bus_intf_io_ldst_dual_r),
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
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rvalid; // @[lsu.scala 211:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_ecc_error = dccm_ctl_io_dma_dccm_ctl_dccm_dma_ecc_error; // @[lsu.scala 211:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rtag = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rtag; // @[lsu.scala 211:27]
  assign io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata = dccm_ctl_io_dma_dccm_ctl_dccm_dma_rdata; // @[lsu.scala 211:27]
  assign io_lsu_dma_dccm_ready = ~_T_8; // @[lsu.scala 87:25]
  assign io_lsu_pic_picm_wren = dccm_ctl_io_lsu_pic_picm_wren; // @[lsu.scala 213:14]
  assign io_lsu_pic_picm_rden = dccm_ctl_io_lsu_pic_picm_rden; // @[lsu.scala 213:14]
  assign io_lsu_pic_picm_mken = dccm_ctl_io_lsu_pic_picm_mken; // @[lsu.scala 213:14]
  assign io_lsu_pic_picm_rdaddr = dccm_ctl_io_lsu_pic_picm_rdaddr; // @[lsu.scala 213:14]
  assign io_lsu_pic_picm_wraddr = dccm_ctl_io_lsu_pic_picm_wraddr; // @[lsu.scala 213:14]
  assign io_lsu_pic_picm_wr_data = dccm_ctl_io_lsu_pic_picm_wr_data; // @[lsu.scala 213:14]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_trxn = bus_intf_io_tlu_busbuff_lsu_pmu_bus_trxn; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_misaligned = bus_intf_io_tlu_busbuff_lsu_pmu_bus_misaligned; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_error = bus_intf_io_tlu_busbuff_lsu_pmu_bus_error; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_pmu_bus_busy = bus_intf_io_tlu_busbuff_lsu_pmu_bus_busy; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_load_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_load_any; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_store_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_store_any; // @[lsu.scala 305:26]
  assign io_lsu_dec_tlu_busbuff_lsu_imprecise_error_addr_any = bus_intf_io_tlu_busbuff_lsu_imprecise_error_addr_any; // @[lsu.scala 305:26]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_valid_m = bus_intf_io_dctl_busbuff_lsu_nonblock_load_valid_m; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_tag_m = bus_intf_io_dctl_busbuff_lsu_nonblock_load_tag_m; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_r = bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_r; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_inv_tag_r = bus_intf_io_dctl_busbuff_lsu_nonblock_load_inv_tag_r; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_valid = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_valid; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_error = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_error; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data_tag = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data_tag; // @[lsu.scala 335:27]
  assign io_lsu_dec_dctl_busbuff_lsu_nonblock_load_data = bus_intf_io_dctl_busbuff_lsu_nonblock_load_data; // @[lsu.scala 335:27]
  assign io_dccm_wren = dccm_ctl_io_dccm_wren; // @[lsu.scala 212:11]
  assign io_dccm_rden = dccm_ctl_io_dccm_rden; // @[lsu.scala 212:11]
  assign io_dccm_wr_addr_lo = dccm_ctl_io_dccm_wr_addr_lo; // @[lsu.scala 212:11]
  assign io_dccm_wr_addr_hi = dccm_ctl_io_dccm_wr_addr_hi; // @[lsu.scala 212:11]
  assign io_dccm_rd_addr_lo = dccm_ctl_io_dccm_rd_addr_lo; // @[lsu.scala 212:11]
  assign io_dccm_rd_addr_hi = dccm_ctl_io_dccm_rd_addr_hi; // @[lsu.scala 212:11]
  assign io_dccm_wr_data_lo = dccm_ctl_io_dccm_wr_data_lo; // @[lsu.scala 212:11]
  assign io_dccm_wr_data_hi = dccm_ctl_io_dccm_wr_data_hi; // @[lsu.scala 212:11]
  assign io_lsu_tlu_lsu_pmu_load_external_m = _T_63 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 115:39]
  assign io_lsu_tlu_lsu_pmu_store_external_m = _T_65 & lsu_lsc_ctl_io_addr_external_m; // @[lsu.scala 116:39]
  assign io_axi_aw_valid = bus_intf_io_axi_aw_valid; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_id = bus_intf_io_axi_aw_bits_id; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_addr = bus_intf_io_axi_aw_bits_addr; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_region = bus_intf_io_axi_aw_bits_region; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_len = 8'h0; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_size = bus_intf_io_axi_aw_bits_size; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_burst = 2'h1; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_lock = 1'h0; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_cache = bus_intf_io_axi_aw_bits_cache; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_prot = 3'h1; // @[lsu.scala 336:49]
  assign io_axi_aw_bits_qos = 4'h0; // @[lsu.scala 336:49]
  assign io_axi_w_valid = bus_intf_io_axi_w_valid; // @[lsu.scala 336:49]
  assign io_axi_w_bits_data = bus_intf_io_axi_w_bits_data; // @[lsu.scala 336:49]
  assign io_axi_w_bits_strb = bus_intf_io_axi_w_bits_strb; // @[lsu.scala 336:49]
  assign io_axi_w_bits_last = 1'h1; // @[lsu.scala 336:49]
  assign io_axi_b_ready = 1'h1; // @[lsu.scala 336:49]
  assign io_axi_ar_valid = bus_intf_io_axi_ar_valid; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_id = bus_intf_io_axi_ar_bits_id; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_addr = bus_intf_io_axi_ar_bits_addr; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_region = bus_intf_io_axi_ar_bits_region; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_len = 8'h0; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_size = bus_intf_io_axi_ar_bits_size; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_burst = 2'h1; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_lock = 1'h0; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_cache = bus_intf_io_axi_ar_bits_cache; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_prot = 3'h1; // @[lsu.scala 336:49]
  assign io_axi_ar_bits_qos = 4'h0; // @[lsu.scala 336:49]
  assign io_axi_r_ready = 1'h1; // @[lsu.scala 336:49]
  assign io_lsu_result_m = lsu_lsc_ctl_io_lsu_result_m; // @[lsu.scala 66:19]
  assign io_lsu_result_corr_r = lsu_lsc_ctl_io_lsu_result_corr_r; // @[lsu.scala 67:24]
  assign io_lsu_load_stall_any = bus_intf_io_lsu_bus_buffer_full_any | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 80:25]
  assign io_lsu_store_stall_any = _T | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 79:26]
  assign io_lsu_fastint_stall_any = dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 81:28]
  assign io_lsu_idle_any = _T_24 & bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 101:19]
  assign io_lsu_active = _T_27 | _T_28; // @[lsu.scala 102:17]
  assign io_lsu_fir_addr = lsu_lsc_ctl_io_lsu_fir_addr; // @[lsu.scala 151:49]
  assign io_lsu_fir_error = lsu_lsc_ctl_io_lsu_fir_error; // @[lsu.scala 152:49]
  assign io_lsu_single_ecc_error_incr = lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[lsu.scala 149:49]
  assign io_lsu_error_pkt_r_valid = lsu_lsc_ctl_io_lsu_error_pkt_r_valid; // @[lsu.scala 150:49]
  assign io_lsu_error_pkt_r_bits_single_ecc_error = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_single_ecc_error; // @[lsu.scala 150:49]
  assign io_lsu_error_pkt_r_bits_inst_type = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_inst_type; // @[lsu.scala 150:49]
  assign io_lsu_error_pkt_r_bits_exc_type = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_exc_type; // @[lsu.scala 150:49]
  assign io_lsu_error_pkt_r_bits_mscause = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_mscause; // @[lsu.scala 150:49]
  assign io_lsu_error_pkt_r_bits_addr = lsu_lsc_ctl_io_lsu_error_pkt_r_bits_addr; // @[lsu.scala 150:49]
  assign io_lsu_pmu_misaligned_m = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_61; // @[lsu.scala 114:27]
  assign io_lsu_trigger_match_m = trigger_io_lsu_trigger_match_m; // @[lsu.scala 280:50]
  assign lsu_lsc_ctl_clock = clock;
  assign lsu_lsc_ctl_reset = reset;
  assign lsu_lsc_ctl_io_clk_override = io_clk_override; // @[lsu.scala 120:46]
  assign lsu_lsc_ctl_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[lsu.scala 121:46]
  assign lsu_lsc_ctl_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 122:46]
  assign lsu_lsc_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 123:46]
  assign lsu_lsc_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 124:46]
  assign lsu_lsc_ctl_io_lsu_store_c1_m_clk = clkdomain_io_lsu_store_c1_m_clk; // @[lsu.scala 125:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_corr_r = dccm_ctl_io_lsu_ld_data_corr_r; // @[lsu.scala 127:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_r = ecc_io_lsu_single_ecc_error_r; // @[lsu.scala 128:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 129:46]
  assign lsu_lsc_ctl_io_lsu_ld_data_m = dccm_ctl_io_lsu_ld_data_m; // @[lsu.scala 130:46]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_m = ecc_io_lsu_single_ecc_error_m; // @[lsu.scala 131:46]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 132:46]
  assign lsu_lsc_ctl_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[lsu.scala 133:46]
  assign lsu_lsc_ctl_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 134:46]
  assign lsu_lsc_ctl_io_ldst_dual_d = lsu_lsc_ctl_io_lsu_addr_d[2] != lsu_lsc_ctl_io_end_addr_d[2]; // @[lsu.scala 135:46]
  assign lsu_lsc_ctl_io_ldst_dual_m = lsu_lsc_ctl_io_lsu_addr_m[2] != lsu_lsc_ctl_io_end_addr_m[2]; // @[lsu.scala 136:46]
  assign lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs1_d = io_lsu_exu_exu_lsu_rs1_d; // @[lsu.scala 138:46]
  assign lsu_lsc_ctl_io_lsu_exu_exu_lsu_rs2_d = io_lsu_exu_exu_lsu_rs2_d; // @[lsu.scala 138:46]
  assign lsu_lsc_ctl_io_lsu_p_valid = io_lsu_p_valid; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_fast_int = io_lsu_p_bits_fast_int; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_by = io_lsu_p_bits_by; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_half = io_lsu_p_bits_half; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_word = io_lsu_p_bits_word; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_dword = io_lsu_p_bits_dword; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_load = io_lsu_p_bits_load; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store = io_lsu_p_bits_store; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_unsign = io_lsu_p_bits_unsign; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_dma = io_lsu_p_bits_dma; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_d = io_lsu_p_bits_store_data_bypass_d; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_load_ldst_bypass_d = io_lsu_p_bits_load_ldst_bypass_d; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_lsu_p_bits_store_data_bypass_m = io_lsu_p_bits_store_data_bypass_m; // @[lsu.scala 139:46]
  assign lsu_lsc_ctl_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 140:46]
  assign lsu_lsc_ctl_io_dec_lsu_offset_d = io_dec_lsu_offset_d; // @[lsu.scala 141:46]
  assign lsu_lsc_ctl_io_picm_mask_data_m = dccm_ctl_io_picm_mask_data_m; // @[lsu.scala 142:46]
  assign lsu_lsc_ctl_io_bus_read_data_m = bus_intf_io_bus_read_data_m; // @[lsu.scala 143:46]
  assign lsu_lsc_ctl_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[lsu.scala 145:46]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_dccm_req = io_lsu_dma_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 144:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_addr = io_lsu_dma_dma_lsc_ctl_dma_mem_addr; // @[lsu.scala 144:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_sz = io_lsu_dma_dma_lsc_ctl_dma_mem_sz; // @[lsu.scala 144:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_write = io_lsu_dma_dma_lsc_ctl_dma_mem_write; // @[lsu.scala 144:38]
  assign lsu_lsc_ctl_io_dma_lsc_ctl_dma_mem_wdata = io_lsu_dma_dma_lsc_ctl_dma_mem_wdata; // @[lsu.scala 144:38]
  assign lsu_lsc_ctl_io_scan_mode = io_scan_mode; // @[lsu.scala 146:46]
  assign dccm_ctl_clock = clock;
  assign dccm_ctl_reset = reset;
  assign dccm_ctl_io_clk_override = io_clk_override; // @[lsu.scala 155:46]
  assign dccm_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[lsu.scala 158:46]
  assign dccm_ctl_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 160:46]
  assign dccm_ctl_io_lsu_store_c1_r_clk = clkdomain_io_lsu_store_c1_r_clk; // @[lsu.scala 162:46]
  assign dccm_ctl_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_word = lsu_lsc_ctl_io_lsu_pkt_d_bits_word; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_dword = lsu_lsc_ctl_io_lsu_pkt_d_bits_dword; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_load = lsu_lsc_ctl_io_lsu_pkt_d_bits_load; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_store = lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_d_bits_dma = lsu_lsc_ctl_io_lsu_pkt_d_bits_dma; // @[lsu.scala 163:46]
  assign dccm_ctl_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_by = lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 164:46]
  assign dccm_ctl_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_load = lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 165:46]
  assign dccm_ctl_io_lsu_pkt_r_bits_dma = lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 165:46]
  assign dccm_ctl_io_addr_in_dccm_d = lsu_lsc_ctl_io_addr_in_dccm_d; // @[lsu.scala 166:46]
  assign dccm_ctl_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 167:46]
  assign dccm_ctl_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 168:46]
  assign dccm_ctl_io_addr_in_pic_d = lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 169:46]
  assign dccm_ctl_io_addr_in_pic_m = lsu_lsc_ctl_io_addr_in_pic_m; // @[lsu.scala 170:46]
  assign dccm_ctl_io_addr_in_pic_r = lsu_lsc_ctl_io_addr_in_pic_r; // @[lsu.scala 171:46]
  assign dccm_ctl_io_lsu_raw_fwd_lo_r = lsu_raw_fwd_lo_r; // @[lsu.scala 172:46]
  assign dccm_ctl_io_lsu_raw_fwd_hi_r = lsu_raw_fwd_hi_r; // @[lsu.scala 173:46]
  assign dccm_ctl_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 174:46]
  assign dccm_ctl_io_ldst_dual_m = lsu_lsc_ctl_io_lsu_addr_m[2] != lsu_lsc_ctl_io_end_addr_m[2]; // @[lsu.scala 156:46]
  assign dccm_ctl_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d; // @[lsu.scala 175:46]
  assign dccm_ctl_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[lsu.scala 176:46]
  assign dccm_ctl_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 177:46]
  assign dccm_ctl_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[lsu.scala 178:46]
  assign dccm_ctl_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[lsu.scala 179:46]
  assign dccm_ctl_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r[15:0]; // @[lsu.scala 180:46]
  assign dccm_ctl_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[lsu.scala 181:46]
  assign dccm_ctl_io_stbuf_addr_any = stbuf_io_stbuf_addr_any; // @[lsu.scala 182:46]
  assign dccm_ctl_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[lsu.scala 183:46]
  assign dccm_ctl_io_stbuf_ecc_any = ecc_io_stbuf_ecc_any; // @[lsu.scala 184:46]
  assign dccm_ctl_io_stbuf_fwddata_hi_m = stbuf_io_stbuf_fwddata_hi_m; // @[lsu.scala 185:46]
  assign dccm_ctl_io_stbuf_fwddata_lo_m = stbuf_io_stbuf_fwddata_lo_m; // @[lsu.scala 186:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_lo_m = stbuf_io_stbuf_fwdbyteen_lo_m; // @[lsu.scala 187:46]
  assign dccm_ctl_io_stbuf_fwdbyteen_hi_m = stbuf_io_stbuf_fwdbyteen_hi_m; // @[lsu.scala 188:46]
  assign dccm_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[lsu.scala 189:46]
  assign dccm_ctl_io_single_ecc_error_hi_r = ecc_io_single_ecc_error_hi_r; // @[lsu.scala 190:46]
  assign dccm_ctl_io_single_ecc_error_lo_r = ecc_io_single_ecc_error_lo_r; // @[lsu.scala 191:46]
  assign dccm_ctl_io_sec_data_hi_r_ff = ecc_io_sec_data_hi_r_ff; // @[lsu.scala 194:46]
  assign dccm_ctl_io_sec_data_lo_r_ff = ecc_io_sec_data_lo_r_ff; // @[lsu.scala 195:46]
  assign dccm_ctl_io_sec_data_ecc_hi_r_ff = ecc_io_sec_data_ecc_hi_r_ff; // @[lsu.scala 196:46]
  assign dccm_ctl_io_sec_data_ecc_lo_r_ff = ecc_io_sec_data_ecc_lo_r_ff; // @[lsu.scala 197:46]
  assign dccm_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[lsu.scala 198:46]
  assign dccm_ctl_io_sec_data_hi_m = ecc_io_sec_data_hi_m; // @[lsu.scala 199:46]
  assign dccm_ctl_io_sec_data_lo_m = ecc_io_sec_data_lo_m; // @[lsu.scala 200:46]
  assign dccm_ctl_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 201:46]
  assign dccm_ctl_io_dma_dccm_wen = _T_11 & io_lsu_dma_dma_lsc_ctl_dma_mem_sz[1]; // @[lsu.scala 202:46]
  assign dccm_ctl_io_dma_pic_wen = _T_10 & lsu_lsc_ctl_io_addr_in_pic_d; // @[lsu.scala 203:46]
  assign dccm_ctl_io_dma_mem_tag_m = dma_mem_tag_m; // @[lsu.scala 204:46]
  assign dccm_ctl_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[lsu.scala 205:46]
  assign dccm_ctl_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[lsu.scala 206:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_hi = ecc_io_dma_dccm_wdata_ecc_hi; // @[lsu.scala 207:46]
  assign dccm_ctl_io_dma_dccm_wdata_ecc_lo = ecc_io_dma_dccm_wdata_ecc_lo; // @[lsu.scala 208:46]
  assign dccm_ctl_io_dma_dccm_ctl_dma_mem_addr = io_lsu_dma_dma_dccm_ctl_dma_mem_addr; // @[lsu.scala 211:27]
  assign dccm_ctl_io_dma_dccm_ctl_dma_mem_wdata = io_lsu_dma_dma_dccm_ctl_dma_mem_wdata; // @[lsu.scala 211:27]
  assign dccm_ctl_io_dccm_rd_data_lo = io_dccm_rd_data_lo; // @[lsu.scala 212:11]
  assign dccm_ctl_io_dccm_rd_data_hi = io_dccm_rd_data_hi; // @[lsu.scala 212:11]
  assign dccm_ctl_io_lsu_pic_picm_rd_data = io_lsu_pic_picm_rd_data; // @[lsu.scala 213:14]
  assign dccm_ctl_io_scan_mode = io_scan_mode; // @[lsu.scala 209:46]
  assign stbuf_clock = clock;
  assign stbuf_reset = reset;
  assign stbuf_io_lsu_stbuf_c1_clk = clkdomain_io_lsu_stbuf_c1_clk; // @[lsu.scala 219:54]
  assign stbuf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 220:54]
  assign stbuf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 221:48]
  assign stbuf_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 221:48]
  assign stbuf_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 221:48]
  assign stbuf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_dword = lsu_lsc_ctl_io_lsu_pkt_r_bits_dword; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 222:48]
  assign stbuf_io_lsu_pkt_r_bits_dma = lsu_lsc_ctl_io_lsu_pkt_r_bits_dma; // @[lsu.scala 222:48]
  assign stbuf_io_store_stbuf_reqvld_r = _T_33 & _T_38; // @[lsu.scala 223:48]
  assign stbuf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 224:49]
  assign stbuf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 225:49]
  assign stbuf_io_store_data_hi_r = dccm_ctl_io_store_data_hi_r; // @[lsu.scala 226:62]
  assign stbuf_io_store_data_lo_r = dccm_ctl_io_store_data_lo_r; // @[lsu.scala 227:62]
  assign stbuf_io_store_datafn_hi_r = dccm_ctl_io_store_datafn_hi_r; // @[lsu.scala 228:49]
  assign stbuf_io_store_datafn_lo_r = dccm_ctl_io_store_datafn_lo_r; // @[lsu.scala 229:56]
  assign stbuf_io_lsu_stbuf_commit_any = dccm_ctl_io_lsu_stbuf_commit_any; // @[lsu.scala 230:52]
  assign stbuf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 232:64]
  assign stbuf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 233:64]
  assign stbuf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 235:64]
  assign stbuf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 236:64]
  assign stbuf_io_ldst_dual_d = lsu_lsc_ctl_io_lsu_addr_d[2] != lsu_lsc_ctl_io_end_addr_d[2]; // @[lsu.scala 216:50]
  assign stbuf_io_ldst_dual_m = lsu_lsc_ctl_io_lsu_addr_m[2] != lsu_lsc_ctl_io_end_addr_m[2]; // @[lsu.scala 217:50]
  assign stbuf_io_ldst_dual_r = lsu_lsc_ctl_io_lsu_addr_r[2] != lsu_lsc_ctl_io_end_addr_r[2]; // @[lsu.scala 218:50]
  assign stbuf_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 237:49]
  assign stbuf_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[lsu.scala 238:56]
  assign stbuf_io_scan_mode = io_scan_mode; // @[lsu.scala 240:49]
  assign ecc_clock = clock;
  assign ecc_reset = reset;
  assign ecc_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 245:52]
  assign ecc_io_clk_override = io_clk_override; // @[lsu.scala 244:50]
  assign ecc_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 246:52]
  assign ecc_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 246:52]
  assign ecc_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 246:52]
  assign ecc_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 246:52]
  assign ecc_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[lsu.scala 248:54]
  assign ecc_io_dec_tlu_core_ecc_disable = io_dec_tlu_core_ecc_disable; // @[lsu.scala 249:50]
  assign ecc_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[lsu.scala 254:58]
  assign ecc_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[lsu.scala 255:58]
  assign ecc_io_dccm_rdata_hi_m = dccm_ctl_io_dccm_rdata_hi_m; // @[lsu.scala 258:54]
  assign ecc_io_dccm_rdata_lo_m = dccm_ctl_io_dccm_rdata_lo_m; // @[lsu.scala 259:54]
  assign ecc_io_dccm_data_ecc_hi_m = dccm_ctl_io_dccm_data_ecc_hi_m; // @[lsu.scala 262:50]
  assign ecc_io_dccm_data_ecc_lo_m = dccm_ctl_io_dccm_data_ecc_lo_m; // @[lsu.scala 263:50]
  assign ecc_io_ld_single_ecc_error_r = dccm_ctl_io_ld_single_ecc_error_r; // @[lsu.scala 264:50]
  assign ecc_io_ld_single_ecc_error_r_ff = dccm_ctl_io_ld_single_ecc_error_r_ff; // @[lsu.scala 265:50]
  assign ecc_io_lsu_dccm_rden_m = dccm_ctl_io_lsu_dccm_rden_m; // @[lsu.scala 266:50]
  assign ecc_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[lsu.scala 267:50]
  assign ecc_io_dma_dccm_wen = _T_11 & io_lsu_dma_dma_lsc_ctl_dma_mem_sz[1]; // @[lsu.scala 268:50]
  assign ecc_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[lsu.scala 269:50]
  assign ecc_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[lsu.scala 270:50]
  assign ecc_io_scan_mode = io_scan_mode; // @[lsu.scala 271:50]
  assign trigger_io_trigger_pkt_any_0_select = io_trigger_pkt_any_0_select; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_0_match_pkt = io_trigger_pkt_any_0_match_pkt; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_0_store = io_trigger_pkt_any_0_store; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_0_load = io_trigger_pkt_any_0_load; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_0_m = io_trigger_pkt_any_0_m; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_0_tdata2 = io_trigger_pkt_any_0_tdata2; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_select = io_trigger_pkt_any_1_select; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_match_pkt = io_trigger_pkt_any_1_match_pkt; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_store = io_trigger_pkt_any_1_store; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_load = io_trigger_pkt_any_1_load; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_m = io_trigger_pkt_any_1_m; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_1_tdata2 = io_trigger_pkt_any_1_tdata2; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_select = io_trigger_pkt_any_2_select; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_match_pkt = io_trigger_pkt_any_2_match_pkt; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_store = io_trigger_pkt_any_2_store; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_load = io_trigger_pkt_any_2_load; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_m = io_trigger_pkt_any_2_m; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_2_tdata2 = io_trigger_pkt_any_2_tdata2; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_select = io_trigger_pkt_any_3_select; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_match_pkt = io_trigger_pkt_any_3_match_pkt; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_store = io_trigger_pkt_any_3_store; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_load = io_trigger_pkt_any_3_load; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_m = io_trigger_pkt_any_3_m; // @[lsu.scala 275:50]
  assign trigger_io_trigger_pkt_any_3_tdata2 = io_trigger_pkt_any_3_tdata2; // @[lsu.scala 275:50]
  assign trigger_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 276:50]
  assign trigger_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 276:50]
  assign trigger_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 276:50]
  assign trigger_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 276:50]
  assign trigger_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 276:50]
  assign trigger_io_lsu_pkt_m_bits_dma = lsu_lsc_ctl_io_lsu_pkt_m_bits_dma; // @[lsu.scala 276:50]
  assign trigger_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 277:50]
  assign trigger_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[lsu.scala 278:50]
  assign clkdomain_clock = clock;
  assign clkdomain_reset = reset;
  assign clkdomain_io_active_clk = io_active_clk; // @[lsu.scala 284:50]
  assign clkdomain_io_clk_override = io_clk_override; // @[lsu.scala 285:50]
  assign clkdomain_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[lsu.scala 286:50]
  assign clkdomain_io_dma_dccm_req = io_lsu_dma_dma_lsc_ctl_dma_dccm_req; // @[lsu.scala 287:50]
  assign clkdomain_io_ldst_stbuf_reqvld_r = stbuf_io_ldst_stbuf_reqvld_r; // @[lsu.scala 288:50]
  assign clkdomain_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[lsu.scala 289:50]
  assign clkdomain_io_stbuf_reqvld_flushed_any = stbuf_io_stbuf_reqvld_flushed_any; // @[lsu.scala 290:50]
  assign clkdomain_io_lsu_busreq_r = bus_intf_io_lsu_busreq_r; // @[lsu.scala 291:50]
  assign clkdomain_io_lsu_bus_buffer_pend_any = bus_intf_io_lsu_bus_buffer_pend_any; // @[lsu.scala 292:50]
  assign clkdomain_io_lsu_bus_buffer_empty_any = bus_intf_io_lsu_bus_buffer_empty_any; // @[lsu.scala 293:50]
  assign clkdomain_io_lsu_stbuf_empty_any = stbuf_io_lsu_stbuf_empty_any; // @[lsu.scala 294:50]
  assign clkdomain_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[lsu.scala 295:50]
  assign clkdomain_io_lsu_p_valid = io_lsu_p_valid; // @[lsu.scala 296:50]
  assign clkdomain_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[lsu.scala 297:50]
  assign clkdomain_io_lsu_pkt_d_bits_store = lsu_lsc_ctl_io_lsu_pkt_d_bits_store; // @[lsu.scala 297:50]
  assign clkdomain_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 298:50]
  assign clkdomain_io_lsu_pkt_m_bits_store = lsu_lsc_ctl_io_lsu_pkt_m_bits_store; // @[lsu.scala 298:50]
  assign clkdomain_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 299:50]
  assign clkdomain_io_scan_mode = io_scan_mode; // @[lsu.scala 300:50]
  assign bus_intf_clock = clock;
  assign bus_intf_reset = reset;
  assign bus_intf_io_scan_mode = io_scan_mode; // @[lsu.scala 304:49]
  assign bus_intf_io_tlu_busbuff_dec_tlu_external_ldfwd_disable = io_lsu_dec_tlu_busbuff_dec_tlu_external_ldfwd_disable; // @[lsu.scala 305:26]
  assign bus_intf_io_tlu_busbuff_dec_tlu_wb_coalescing_disable = io_lsu_dec_tlu_busbuff_dec_tlu_wb_coalescing_disable; // @[lsu.scala 305:26]
  assign bus_intf_io_tlu_busbuff_dec_tlu_sideeffect_posted_disable = io_lsu_dec_tlu_busbuff_dec_tlu_sideeffect_posted_disable; // @[lsu.scala 305:26]
  assign bus_intf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[lsu.scala 307:49]
  assign bus_intf_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[lsu.scala 308:49]
  assign bus_intf_io_lsu_bus_ibuf_c1_clk = clkdomain_io_lsu_bus_ibuf_c1_clk; // @[lsu.scala 311:49]
  assign bus_intf_io_lsu_bus_obuf_c1_clk = clkdomain_io_lsu_bus_obuf_c1_clk; // @[lsu.scala 312:49]
  assign bus_intf_io_lsu_bus_buf_c1_clk = clkdomain_io_lsu_bus_buf_c1_clk; // @[lsu.scala 313:49]
  assign bus_intf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[lsu.scala 314:49]
  assign bus_intf_io_active_clk = io_active_clk; // @[lsu.scala 315:49]
  assign bus_intf_io_lsu_busm_clk = clkdomain_io_lsu_busm_clk; // @[lsu.scala 316:49]
  assign bus_intf_io_axi_aw_ready = io_axi_aw_ready; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_w_ready = io_axi_w_ready; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_b_valid = io_axi_b_valid; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_b_bits_resp = io_axi_b_bits_resp; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_b_bits_id = io_axi_b_bits_id; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_ar_ready = io_axi_ar_ready; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_r_valid = io_axi_r_valid; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_r_bits_id = io_axi_r_bits_id; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_r_bits_data = io_axi_r_bits_data; // @[lsu.scala 336:49]
  assign bus_intf_io_axi_r_bits_resp = io_axi_r_bits_resp; // @[lsu.scala 336:49]
  assign bus_intf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[lsu.scala 317:49]
  assign bus_intf_io_lsu_busreq_m = _T_48 & _T_49; // @[lsu.scala 318:49]
  assign bus_intf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[lsu.scala 327:49]
  assign bus_intf_io_lsu_pkt_m_bits_by = lsu_lsc_ctl_io_lsu_pkt_m_bits_by; // @[lsu.scala 327:49]
  assign bus_intf_io_lsu_pkt_m_bits_half = lsu_lsc_ctl_io_lsu_pkt_m_bits_half; // @[lsu.scala 327:49]
  assign bus_intf_io_lsu_pkt_m_bits_word = lsu_lsc_ctl_io_lsu_pkt_m_bits_word; // @[lsu.scala 327:49]
  assign bus_intf_io_lsu_pkt_m_bits_load = lsu_lsc_ctl_io_lsu_pkt_m_bits_load; // @[lsu.scala 327:49]
  assign bus_intf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_by = lsu_lsc_ctl_io_lsu_pkt_r_bits_by; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_half = lsu_lsc_ctl_io_lsu_pkt_r_bits_half; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_word = lsu_lsc_ctl_io_lsu_pkt_r_bits_word; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_load = lsu_lsc_ctl_io_lsu_pkt_r_bits_load; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_store = lsu_lsc_ctl_io_lsu_pkt_r_bits_store; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_pkt_r_bits_unsign = lsu_lsc_ctl_io_lsu_pkt_r_bits_unsign; // @[lsu.scala 328:49]
  assign bus_intf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[lsu.scala 322:49]
  assign bus_intf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[lsu.scala 323:49]
  assign bus_intf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[lsu.scala 324:49]
  assign bus_intf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[lsu.scala 325:49]
  assign bus_intf_io_ldst_dual_d = lsu_lsc_ctl_io_lsu_addr_d[2] != lsu_lsc_ctl_io_end_addr_d[2]; // @[lsu.scala 319:49]
  assign bus_intf_io_ldst_dual_m = lsu_lsc_ctl_io_lsu_addr_m[2] != lsu_lsc_ctl_io_end_addr_m[2]; // @[lsu.scala 320:49]
  assign bus_intf_io_ldst_dual_r = lsu_lsc_ctl_io_lsu_addr_r[2] != lsu_lsc_ctl_io_end_addr_r[2]; // @[lsu.scala 321:49]
  assign bus_intf_io_store_data_r = dccm_ctl_io_store_data_r; // @[lsu.scala 326:49]
  assign bus_intf_io_dec_tlu_force_halt = io_dec_tlu_force_halt; // @[lsu.scala 329:49]
  assign bus_intf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[lsu.scala 330:49]
  assign bus_intf_io_is_sideeffects_m = lsu_lsc_ctl_io_is_sideeffects_m; // @[lsu.scala 331:49]
  assign bus_intf_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[lsu.scala 332:49]
  assign bus_intf_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[lsu.scala 333:49]
  assign bus_intf_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[lsu.scala 337:49]
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
