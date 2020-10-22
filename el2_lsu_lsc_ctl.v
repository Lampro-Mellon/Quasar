module rvlsadder(
  input  [31:0] io_rs1,
  input  [11:0] io_offset,
  output [31:0] io_dout
);
  wire [12:0] _T_1 = {1'h0,io_rs1[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_3 = {1'h0,io_offset}; // @[Cat.scala 29:58]
  wire [12:0] w1 = _T_1 + _T_3; // @[beh_lib.scala 47:38]
  wire  _T_7 = io_offset[11] ^ w1[12]; // @[beh_lib.scala 49:47]
  wire  _T_8 = ~_T_7; // @[beh_lib.scala 49:31]
  wire [19:0] _T_10 = _T_8 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_12 = _T_10 & io_rs1[31:12]; // @[beh_lib.scala 49:59]
  wire  _T_14 = ~io_offset[11]; // @[beh_lib.scala 50:16]
  wire  _T_16 = _T_14 ^ w1[12]; // @[beh_lib.scala 50:31]
  wire [19:0] _T_18 = _T_16 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_21 = io_rs1[31:12] + 20'h1; // @[beh_lib.scala 50:58]
  wire [19:0] _T_22 = _T_18 & _T_21; // @[beh_lib.scala 50:42]
  wire [19:0] _T_23 = _T_12 | _T_22; // @[beh_lib.scala 49:76]
  wire  _T_26 = ~w1[12]; // @[beh_lib.scala 51:32]
  wire  _T_27 = io_offset[11] ^ _T_26; // @[beh_lib.scala 51:30]
  wire [19:0] _T_29 = _T_27 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_32 = io_rs1[31:12] - 20'h1; // @[beh_lib.scala 51:58]
  wire [19:0] _T_33 = _T_29 & _T_32; // @[beh_lib.scala 51:42]
  wire [19:0] dout_upper = _T_23 | _T_33; // @[beh_lib.scala 50:65]
  assign io_dout = {dout_upper,w1[11:0]}; // @[beh_lib.scala 53:11]
endmodule
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
  input         reset,
  input         io_lsu_c2_m_clk,
  input  [31:0] io_start_addr_d,
  input  [31:0] io_end_addr_d,
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
  output [3:0]  io_exc_mscause_d
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
module rvdff(
  input   clock,
  input   reset,
  input   io_din,
  output  io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  flop; // @[beh_lib.scala 12:21]
  assign io_dout = flop; // @[beh_lib.scala 17:12]
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
  flop = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    flop = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      flop <= 1'h0;
    end else begin
      flop <= io_din;
    end
  end
endmodule
module rvdff_2(
  input        clock,
  input        reset,
  input  [3:0] io_din,
  output [3:0] io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] flop; // @[beh_lib.scala 12:21]
  assign io_dout = flop; // @[beh_lib.scala 17:12]
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
  flop = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    flop = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      flop <= 4'h0;
    end else begin
      flop <= io_din;
    end
  end
endmodule
module rvdff_6(
  input         clock,
  input         reset,
  input  [31:0] io_din,
  output [31:0] io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] flop; // @[beh_lib.scala 12:21]
  assign io_dout = flop; // @[beh_lib.scala 17:12]
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
  flop = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    flop = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      flop <= 32'h0;
    end else begin
      flop <= io_din;
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
  output        io_lsu_error_pkt_r_exc_valid,
  output        io_lsu_error_pkt_r_single_ecc_error,
  output        io_lsu_error_pkt_r_inst_type,
  output        io_lsu_error_pkt_r_exc_type,
  output [3:0]  io_lsu_error_pkt_r_mscause,
  output [31:0] io_lsu_error_pkt_r_addr,
  output [31:0] io_lsu_fir_addr,
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] lsadder_io_rs1; // @[el2_lsu_lsc_ctl.scala 118:23]
  wire [11:0] lsadder_io_offset; // @[el2_lsu_lsc_ctl.scala 118:23]
  wire [31:0] lsadder_io_dout; // @[el2_lsu_lsc_ctl.scala 118:23]
  wire  addrcheck_reset; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_c2_m_clk; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire [31:0] addrcheck_io_start_addr_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire [31:0] addrcheck_io_end_addr_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_store; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_lsu_pkt_d_valid; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire [31:0] addrcheck_io_dec_tlu_mrac_ff; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire [3:0] addrcheck_io_rs1_region_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_is_sideeffects_m; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_addr_in_dccm_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_addr_in_pic_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_addr_external_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_access_fault_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  addrcheck_io_misaligned_fault_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire [3:0] addrcheck_io_exc_mscause_d; // @[el2_lsu_lsc_ctl.scala 141:25]
  wire  access_fault_mff_clock; // @[el2_lsu_lsc_ctl.scala 169:45]
  wire  access_fault_mff_reset; // @[el2_lsu_lsc_ctl.scala 169:45]
  wire  access_fault_mff_io_din; // @[el2_lsu_lsc_ctl.scala 169:45]
  wire  access_fault_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 169:45]
  wire  misaligned_fault_mff_clock; // @[el2_lsu_lsc_ctl.scala 171:45]
  wire  misaligned_fault_mff_reset; // @[el2_lsu_lsc_ctl.scala 171:45]
  wire  misaligned_fault_mff_io_din; // @[el2_lsu_lsc_ctl.scala 171:45]
  wire  misaligned_fault_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 171:45]
  wire  exc_mscause_mff_clock; // @[el2_lsu_lsc_ctl.scala 173:45]
  wire  exc_mscause_mff_reset; // @[el2_lsu_lsc_ctl.scala 173:45]
  wire [3:0] exc_mscause_mff_io_din; // @[el2_lsu_lsc_ctl.scala 173:45]
  wire [3:0] exc_mscause_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 173:45]
  wire  lsu_pkt_vldmff_clock; // @[el2_lsu_lsc_ctl.scala 278:36]
  wire  lsu_pkt_vldmff_reset; // @[el2_lsu_lsc_ctl.scala 278:36]
  wire  lsu_pkt_vldmff_io_din; // @[el2_lsu_lsc_ctl.scala 278:36]
  wire  lsu_pkt_vldmff_io_dout; // @[el2_lsu_lsc_ctl.scala 278:36]
  wire  lsu_pkt_vldrff_clock; // @[el2_lsu_lsc_ctl.scala 279:36]
  wire  lsu_pkt_vldrff_reset; // @[el2_lsu_lsc_ctl.scala 279:36]
  wire  lsu_pkt_vldrff_io_din; // @[el2_lsu_lsc_ctl.scala 279:36]
  wire  lsu_pkt_vldrff_io_dout; // @[el2_lsu_lsc_ctl.scala 279:36]
  wire  sdmff_clock; // @[el2_lsu_lsc_ctl.scala 333:20]
  wire  sdmff_reset; // @[el2_lsu_lsc_ctl.scala 333:20]
  wire [31:0] sdmff_io_din; // @[el2_lsu_lsc_ctl.scala 333:20]
  wire [31:0] sdmff_io_dout; // @[el2_lsu_lsc_ctl.scala 333:20]
  wire  samff_clock; // @[el2_lsu_lsc_ctl.scala 337:20]
  wire  samff_reset; // @[el2_lsu_lsc_ctl.scala 337:20]
  wire [31:0] samff_io_din; // @[el2_lsu_lsc_ctl.scala 337:20]
  wire [31:0] samff_io_dout; // @[el2_lsu_lsc_ctl.scala 337:20]
  wire  sarff_clock; // @[el2_lsu_lsc_ctl.scala 341:20]
  wire  sarff_reset; // @[el2_lsu_lsc_ctl.scala 341:20]
  wire [31:0] sarff_io_din; // @[el2_lsu_lsc_ctl.scala 341:20]
  wire [31:0] sarff_io_dout; // @[el2_lsu_lsc_ctl.scala 341:20]
  wire  end_addr_mff_clock; // @[el2_lsu_lsc_ctl.scala 345:28]
  wire  end_addr_mff_reset; // @[el2_lsu_lsc_ctl.scala 345:28]
  wire [31:0] end_addr_mff_io_din; // @[el2_lsu_lsc_ctl.scala 345:28]
  wire [31:0] end_addr_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 345:28]
  wire  end_addr_rff_clock; // @[el2_lsu_lsc_ctl.scala 349:28]
  wire  end_addr_rff_reset; // @[el2_lsu_lsc_ctl.scala 349:28]
  wire [31:0] end_addr_rff_io_din; // @[el2_lsu_lsc_ctl.scala 349:28]
  wire [31:0] end_addr_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 349:28]
  wire  addr_in_dccm_mff_clock; // @[el2_lsu_lsc_ctl.scala 353:36]
  wire  addr_in_dccm_mff_reset; // @[el2_lsu_lsc_ctl.scala 353:36]
  wire  addr_in_dccm_mff_io_din; // @[el2_lsu_lsc_ctl.scala 353:36]
  wire  addr_in_dccm_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 353:36]
  wire  addr_in_dccm_rff_clock; // @[el2_lsu_lsc_ctl.scala 357:37]
  wire  addr_in_dccm_rff_reset; // @[el2_lsu_lsc_ctl.scala 357:37]
  wire  addr_in_dccm_rff_io_din; // @[el2_lsu_lsc_ctl.scala 357:37]
  wire  addr_in_dccm_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 357:37]
  wire  addr_in_pic_mff_clock; // @[el2_lsu_lsc_ctl.scala 361:37]
  wire  addr_in_pic_mff_reset; // @[el2_lsu_lsc_ctl.scala 361:37]
  wire  addr_in_pic_mff_io_din; // @[el2_lsu_lsc_ctl.scala 361:37]
  wire  addr_in_pic_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 361:37]
  wire  addr_in_pic_rff_clock; // @[el2_lsu_lsc_ctl.scala 365:37]
  wire  addr_in_pic_rff_reset; // @[el2_lsu_lsc_ctl.scala 365:37]
  wire  addr_in_pic_rff_io_din; // @[el2_lsu_lsc_ctl.scala 365:37]
  wire  addr_in_pic_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 365:37]
  wire  addr_external_mff_clock; // @[el2_lsu_lsc_ctl.scala 369:37]
  wire  addr_external_mff_reset; // @[el2_lsu_lsc_ctl.scala 369:37]
  wire  addr_external_mff_io_din; // @[el2_lsu_lsc_ctl.scala 369:37]
  wire  addr_external_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 369:37]
  wire  addr_external_rff_clock; // @[el2_lsu_lsc_ctl.scala 373:37]
  wire  addr_external_rff_reset; // @[el2_lsu_lsc_ctl.scala 373:37]
  wire  addr_external_rff_io_din; // @[el2_lsu_lsc_ctl.scala 373:37]
  wire  addr_external_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 373:37]
  wire  bus_read_data_r_ff_clock; // @[el2_lsu_lsc_ctl.scala 377:38]
  wire  bus_read_data_r_ff_reset; // @[el2_lsu_lsc_ctl.scala 377:38]
  wire [31:0] bus_read_data_r_ff_io_din; // @[el2_lsu_lsc_ctl.scala 377:38]
  wire [31:0] bus_read_data_r_ff_io_dout; // @[el2_lsu_lsc_ctl.scala 377:38]
  wire [31:0] lsu_rs1_d = io_dec_lsu_valid_raw_d ? io_exu_lsu_rs1_d : io_dma_mem_addr; // @[el2_lsu_lsc_ctl.scala 108:28]
  wire [11:0] _T_3 = io_dec_lsu_valid_raw_d ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [11:0] lsu_offset_d = io_dec_lsu_offset_d & _T_3; // @[el2_lsu_lsc_ctl.scala 109:51]
  wire [31:0] rs1_d = io_lsu_pkt_d_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[el2_lsu_lsc_ctl.scala 114:18]
  wire [2:0] _T_6 = io_lsu_pkt_d_half ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_7 = _T_6 & 3'h1; // @[el2_lsu_lsc_ctl.scala 127:53]
  wire [2:0] _T_9 = io_lsu_pkt_d_word ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_10 = _T_9 & 3'h3; // @[el2_lsu_lsc_ctl.scala 128:35]
  wire [2:0] _T_11 = _T_7 | _T_10; // @[el2_lsu_lsc_ctl.scala 127:65]
  wire [2:0] _T_13 = io_lsu_pkt_d_dword ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [2:0] addr_offset_d = _T_11 | _T_13; // @[el2_lsu_lsc_ctl.scala 128:47]
  wire [12:0] _T_17 = {lsu_offset_d[11],lsu_offset_d}; // @[Cat.scala 29:58]
  wire [11:0] _T_20 = {9'h0,addr_offset_d}; // @[Cat.scala 29:58]
  wire [12:0] _GEN_0 = {{1'd0}, _T_20}; // @[el2_lsu_lsc_ctl.scala 131:60]
  wire [12:0] end_addr_offset_d = _T_17 + _GEN_0; // @[el2_lsu_lsc_ctl.scala 131:60]
  wire [18:0] _T_25 = end_addr_offset_d[12] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_27 = {_T_25,end_addr_offset_d}; // @[Cat.scala 29:58]
  wire  access_fault_m = access_fault_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 247:40]
  wire  misaligned_fault_m = misaligned_fault_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 250:40]
  wire  _T_30 = access_fault_m | misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 188:34]
  wire  _T_31 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_lsc_ctl.scala 189:64]
  wire  _T_32 = io_lsu_single_ecc_error_r & _T_31; // @[el2_lsu_lsc_ctl.scala 189:62]
  wire  _T_33 = io_lsu_commit_r | io_lsu_pkt_r_dma; // @[el2_lsu_lsc_ctl.scala 189:111]
  wire  _T_34 = _T_32 & _T_33; // @[el2_lsu_lsc_ctl.scala 189:92]
  wire  _T_37 = _T_30 | io_lsu_double_ecc_error_m; // @[el2_lsu_lsc_ctl.scala 230:71]
  wire  _T_38 = _T_37 & io_lsu_pkt_m_valid; // @[el2_lsu_lsc_ctl.scala 230:100]
  wire  _T_39 = ~io_lsu_pkt_m_dma; // @[el2_lsu_lsc_ctl.scala 230:123]
  wire  _T_40 = _T_38 & _T_39; // @[el2_lsu_lsc_ctl.scala 230:121]
  wire  _T_41 = ~io_lsu_pkt_m_fast_int; // @[el2_lsu_lsc_ctl.scala 230:143]
  wire  _T_42 = _T_40 & _T_41; // @[el2_lsu_lsc_ctl.scala 230:141]
  wire  _T_43 = ~io_flush_m_up; // @[el2_lsu_lsc_ctl.scala 230:168]
  wire  lsu_error_pkt_m_exc_valid = _T_42 & _T_43; // @[el2_lsu_lsc_ctl.scala 230:166]
  wire  _T_45 = ~lsu_error_pkt_m_exc_valid; // @[el2_lsu_lsc_ctl.scala 231:70]
  wire  _T_46 = io_lsu_single_ecc_error_m & _T_45; // @[el2_lsu_lsc_ctl.scala 231:68]
  wire  lsu_error_pkt_m_exc_type = ~misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 233:41]
  wire  _T_51 = io_lsu_double_ecc_error_m & lsu_error_pkt_m_exc_type; // @[el2_lsu_lsc_ctl.scala 234:72]
  wire  _T_52 = ~access_fault_m; // @[el2_lsu_lsc_ctl.scala 234:96]
  wire  _T_53 = _T_51 & _T_52; // @[el2_lsu_lsc_ctl.scala 234:94]
  wire [3:0] exc_mscause_m = exc_mscause_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 253:40]
  reg  _T_65_exc_valid; // @[el2_lsu_lsc_ctl.scala 241:34]
  reg  _T_65_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 241:34]
  reg  _T_65_inst_type; // @[el2_lsu_lsc_ctl.scala 241:34]
  reg  _T_65_exc_type; // @[el2_lsu_lsc_ctl.scala 241:34]
  reg [3:0] _T_65_mscause; // @[el2_lsu_lsc_ctl.scala 241:34]
  reg [31:0] _T_65_addr; // @[el2_lsu_lsc_ctl.scala 241:34]
  wire  dma_pkt_d_load = ~io_dma_mem_write; // @[el2_lsu_lsc_ctl.scala 268:25]
  wire  dma_pkt_d_by = io_dma_mem_sz == 3'h0; // @[el2_lsu_lsc_ctl.scala 269:45]
  wire  dma_pkt_d_half = io_dma_mem_sz == 3'h1; // @[el2_lsu_lsc_ctl.scala 270:45]
  wire  dma_pkt_d_word = io_dma_mem_sz == 3'h2; // @[el2_lsu_lsc_ctl.scala 271:45]
  wire  dma_pkt_d_dword = io_dma_mem_sz == 3'h3; // @[el2_lsu_lsc_ctl.scala 272:45]
  wire  _T_79 = ~io_lsu_p_fast_int; // @[el2_lsu_lsc_ctl.scala 289:64]
  wire  _T_80 = io_flush_m_up & _T_79; // @[el2_lsu_lsc_ctl.scala 289:61]
  wire  _T_81 = ~_T_80; // @[el2_lsu_lsc_ctl.scala 289:45]
  wire  _T_82 = io_lsu_p_valid & _T_81; // @[el2_lsu_lsc_ctl.scala 289:43]
  wire  _T_84 = ~io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 290:68]
  wire  _T_85 = io_flush_m_up & _T_84; // @[el2_lsu_lsc_ctl.scala 290:65]
  wire  _T_86 = ~_T_85; // @[el2_lsu_lsc_ctl.scala 290:49]
  wire  _T_89 = io_flush_m_up & _T_39; // @[el2_lsu_lsc_ctl.scala 291:65]
  wire  _T_90 = ~_T_89; // @[el2_lsu_lsc_ctl.scala 291:49]
  reg  _T_92_fast_int; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_by; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_half; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_word; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_dword; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_load; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_store; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_unsign; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_dma; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_valid; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_93_fast_int; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_by; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_half; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_word; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_dword; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_load; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_store; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_unsign; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_dma; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_valid; // @[el2_lsu_lsc_ctl.scala 310:26]
  wire [3:0] _T_96 = {io_dma_mem_addr[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_mem_wdata_shifted = io_dma_mem_wdata >> _T_96; // @[el2_lsu_lsc_ctl.scala 326:54]
  wire [31:0] store_data_d = io_dma_dccm_req ? dma_mem_wdata_shifted[31:0] : io_exu_lsu_rs2_d; // @[el2_lsu_lsc_ctl.scala 328:34]
  wire  _T_104 = io_lsu_pkt_r_store | io_lsu_pkt_r_load; // @[el2_lsu_lsc_ctl.scala 391:63]
  wire  _T_105 = io_lsu_pkt_r_valid & _T_104; // @[el2_lsu_lsc_ctl.scala 391:41]
  wire  _T_106 = ~io_flush_r; // @[el2_lsu_lsc_ctl.scala 391:86]
  wire  _T_107 = _T_105 & _T_106; // @[el2_lsu_lsc_ctl.scala 391:84]
  wire  _T_108 = ~io_lsu_pkt_r_dma; // @[el2_lsu_lsc_ctl.scala 391:100]
  wire  _T_111 = ~io_addr_in_pic_m; // @[el2_lsu_lsc_ctl.scala 394:69]
  wire [31:0] _T_113 = _T_111 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_114 = io_picm_mask_data_m | _T_113; // @[el2_lsu_lsc_ctl.scala 394:59]
  wire [31:0] _T_116 = io_lsu_pkt_m_store_data_bypass_m ? io_lsu_result_m : sdmff_io_dout; // @[el2_lsu_lsc_ctl.scala 394:94]
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? io_bus_read_data_m : io_lsu_ld_data_m; // @[el2_lsu_lsc_ctl.scala 425:33]
  wire  _T_120 = addr_external_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 426:50]
  wire [31:0] lsu_ld_datafn_corr_r = _T_120 ? bus_read_data_r_ff_io_dout : io_lsu_ld_data_corr_r; // @[el2_lsu_lsc_ctl.scala 426:33]
  wire  _T_122 = io_lsu_pkt_r_unsign & io_lsu_pkt_r_by; // @[el2_lsu_lsc_ctl.scala 429:61]
  wire [31:0] _T_124 = _T_122 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [8:0] _T_126 = {1'h0,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_1 = {{23'd0}, _T_126}; // @[el2_lsu_lsc_ctl.scala 429:84]
  wire [31:0] _T_127 = _T_124 & _GEN_1; // @[el2_lsu_lsc_ctl.scala 429:84]
  wire  _T_128 = io_lsu_pkt_r_unsign & io_lsu_pkt_r_half; // @[el2_lsu_lsc_ctl.scala 430:38]
  wire [31:0] _T_130 = _T_128 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [16:0] _T_132 = {1'h0,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_2 = {{15'd0}, _T_132}; // @[el2_lsu_lsc_ctl.scala 430:61]
  wire [31:0] _T_133 = _T_130 & _GEN_2; // @[el2_lsu_lsc_ctl.scala 430:61]
  wire [31:0] _T_134 = _T_127 | _T_133; // @[el2_lsu_lsc_ctl.scala 429:125]
  wire  _T_135 = ~io_lsu_pkt_r_unsign; // @[el2_lsu_lsc_ctl.scala 431:17]
  wire  _T_136 = _T_135 & io_lsu_pkt_r_by; // @[el2_lsu_lsc_ctl.scala 431:38]
  wire [31:0] _T_138 = _T_136 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _T_141 = lsu_ld_datafn_m[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_143 = {_T_141,lsu_ld_datafn_m[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_144 = _T_138 & _T_143; // @[el2_lsu_lsc_ctl.scala 431:61]
  wire [31:0] _T_145 = _T_134 | _T_144; // @[el2_lsu_lsc_ctl.scala 430:104]
  wire  _T_147 = _T_135 & io_lsu_pkt_r_half; // @[el2_lsu_lsc_ctl.scala 432:38]
  wire [31:0] _T_149 = _T_147 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [15:0] _T_152 = lsu_ld_datafn_m[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_154 = {_T_152,lsu_ld_datafn_m[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_155 = _T_149 & _T_154; // @[el2_lsu_lsc_ctl.scala 432:61]
  wire [31:0] _T_156 = _T_145 | _T_155; // @[el2_lsu_lsc_ctl.scala 431:124]
  wire [31:0] _T_158 = io_lsu_pkt_r_word ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_160 = _T_158 & lsu_ld_datafn_m; // @[el2_lsu_lsc_ctl.scala 433:38]
  wire [8:0] _T_166 = {1'h0,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_3 = {{23'd0}, _T_166}; // @[el2_lsu_lsc_ctl.scala 436:84]
  wire [31:0] _T_167 = _T_124 & _GEN_3; // @[el2_lsu_lsc_ctl.scala 436:84]
  wire [16:0] _T_172 = {1'h0,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_4 = {{15'd0}, _T_172}; // @[el2_lsu_lsc_ctl.scala 437:61]
  wire [31:0] _T_173 = _T_130 & _GEN_4; // @[el2_lsu_lsc_ctl.scala 437:61]
  wire [31:0] _T_174 = _T_167 | _T_173; // @[el2_lsu_lsc_ctl.scala 436:130]
  wire [23:0] _T_181 = lsu_ld_datafn_corr_r[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_183 = {_T_181,lsu_ld_datafn_corr_r[7:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_184 = _T_138 & _T_183; // @[el2_lsu_lsc_ctl.scala 438:61]
  wire [31:0] _T_185 = _T_174 | _T_184; // @[el2_lsu_lsc_ctl.scala 437:109]
  wire [15:0] _T_192 = lsu_ld_datafn_corr_r[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_194 = {_T_192,lsu_ld_datafn_corr_r[15:0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_195 = _T_149 & _T_194; // @[el2_lsu_lsc_ctl.scala 439:61]
  wire [31:0] _T_196 = _T_185 | _T_195; // @[el2_lsu_lsc_ctl.scala 438:134]
  wire [31:0] _T_200 = _T_158 & lsu_ld_datafn_corr_r; // @[el2_lsu_lsc_ctl.scala 440:38]
  rvlsadder lsadder ( // @[el2_lsu_lsc_ctl.scala 118:23]
    .io_rs1(lsadder_io_rs1),
    .io_offset(lsadder_io_offset),
    .io_dout(lsadder_io_dout)
  );
  el2_lsu_addrcheck addrcheck ( // @[el2_lsu_lsc_ctl.scala 141:25]
    .reset(addrcheck_reset),
    .io_lsu_c2_m_clk(addrcheck_io_lsu_c2_m_clk),
    .io_start_addr_d(addrcheck_io_start_addr_d),
    .io_end_addr_d(addrcheck_io_end_addr_d),
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
    .io_exc_mscause_d(addrcheck_io_exc_mscause_d)
  );
  rvdff access_fault_mff ( // @[el2_lsu_lsc_ctl.scala 169:45]
    .clock(access_fault_mff_clock),
    .reset(access_fault_mff_reset),
    .io_din(access_fault_mff_io_din),
    .io_dout(access_fault_mff_io_dout)
  );
  rvdff misaligned_fault_mff ( // @[el2_lsu_lsc_ctl.scala 171:45]
    .clock(misaligned_fault_mff_clock),
    .reset(misaligned_fault_mff_reset),
    .io_din(misaligned_fault_mff_io_din),
    .io_dout(misaligned_fault_mff_io_dout)
  );
  rvdff_2 exc_mscause_mff ( // @[el2_lsu_lsc_ctl.scala 173:45]
    .clock(exc_mscause_mff_clock),
    .reset(exc_mscause_mff_reset),
    .io_din(exc_mscause_mff_io_din),
    .io_dout(exc_mscause_mff_io_dout)
  );
  rvdff lsu_pkt_vldmff ( // @[el2_lsu_lsc_ctl.scala 278:36]
    .clock(lsu_pkt_vldmff_clock),
    .reset(lsu_pkt_vldmff_reset),
    .io_din(lsu_pkt_vldmff_io_din),
    .io_dout(lsu_pkt_vldmff_io_dout)
  );
  rvdff lsu_pkt_vldrff ( // @[el2_lsu_lsc_ctl.scala 279:36]
    .clock(lsu_pkt_vldrff_clock),
    .reset(lsu_pkt_vldrff_reset),
    .io_din(lsu_pkt_vldrff_io_din),
    .io_dout(lsu_pkt_vldrff_io_dout)
  );
  rvdff_6 sdmff ( // @[el2_lsu_lsc_ctl.scala 333:20]
    .clock(sdmff_clock),
    .reset(sdmff_reset),
    .io_din(sdmff_io_din),
    .io_dout(sdmff_io_dout)
  );
  rvdff_6 samff ( // @[el2_lsu_lsc_ctl.scala 337:20]
    .clock(samff_clock),
    .reset(samff_reset),
    .io_din(samff_io_din),
    .io_dout(samff_io_dout)
  );
  rvdff_6 sarff ( // @[el2_lsu_lsc_ctl.scala 341:20]
    .clock(sarff_clock),
    .reset(sarff_reset),
    .io_din(sarff_io_din),
    .io_dout(sarff_io_dout)
  );
  rvdff_6 end_addr_mff ( // @[el2_lsu_lsc_ctl.scala 345:28]
    .clock(end_addr_mff_clock),
    .reset(end_addr_mff_reset),
    .io_din(end_addr_mff_io_din),
    .io_dout(end_addr_mff_io_dout)
  );
  rvdff_6 end_addr_rff ( // @[el2_lsu_lsc_ctl.scala 349:28]
    .clock(end_addr_rff_clock),
    .reset(end_addr_rff_reset),
    .io_din(end_addr_rff_io_din),
    .io_dout(end_addr_rff_io_dout)
  );
  rvdff addr_in_dccm_mff ( // @[el2_lsu_lsc_ctl.scala 353:36]
    .clock(addr_in_dccm_mff_clock),
    .reset(addr_in_dccm_mff_reset),
    .io_din(addr_in_dccm_mff_io_din),
    .io_dout(addr_in_dccm_mff_io_dout)
  );
  rvdff addr_in_dccm_rff ( // @[el2_lsu_lsc_ctl.scala 357:37]
    .clock(addr_in_dccm_rff_clock),
    .reset(addr_in_dccm_rff_reset),
    .io_din(addr_in_dccm_rff_io_din),
    .io_dout(addr_in_dccm_rff_io_dout)
  );
  rvdff addr_in_pic_mff ( // @[el2_lsu_lsc_ctl.scala 361:37]
    .clock(addr_in_pic_mff_clock),
    .reset(addr_in_pic_mff_reset),
    .io_din(addr_in_pic_mff_io_din),
    .io_dout(addr_in_pic_mff_io_dout)
  );
  rvdff addr_in_pic_rff ( // @[el2_lsu_lsc_ctl.scala 365:37]
    .clock(addr_in_pic_rff_clock),
    .reset(addr_in_pic_rff_reset),
    .io_din(addr_in_pic_rff_io_din),
    .io_dout(addr_in_pic_rff_io_dout)
  );
  rvdff addr_external_mff ( // @[el2_lsu_lsc_ctl.scala 369:37]
    .clock(addr_external_mff_clock),
    .reset(addr_external_mff_reset),
    .io_din(addr_external_mff_io_din),
    .io_dout(addr_external_mff_io_dout)
  );
  rvdff addr_external_rff ( // @[el2_lsu_lsc_ctl.scala 373:37]
    .clock(addr_external_rff_clock),
    .reset(addr_external_rff_reset),
    .io_din(addr_external_rff_io_din),
    .io_dout(addr_external_rff_io_dout)
  );
  rvdff_6 bus_read_data_r_ff ( // @[el2_lsu_lsc_ctl.scala 377:38]
    .clock(bus_read_data_r_ff_clock),
    .reset(bus_read_data_r_ff_reset),
    .io_din(bus_read_data_r_ff_io_din),
    .io_dout(bus_read_data_r_ff_io_dout)
  );
  assign io_lsu_result_m = _T_156 | _T_160; // @[el2_lsu_lsc_ctl.scala 429:27]
  assign io_lsu_result_corr_r = _T_196 | _T_200; // @[el2_lsu_lsc_ctl.scala 436:27]
  assign io_lsu_addr_d = lsadder_io_dout; // @[el2_lsu_lsc_ctl.scala 387:28]
  assign io_lsu_addr_m = samff_io_dout; // @[el2_lsu_lsc_ctl.scala 339:26]
  assign io_lsu_addr_r = sarff_io_dout; // @[el2_lsu_lsc_ctl.scala 343:23]
  assign io_end_addr_d = rs1_d + _T_27; // @[el2_lsu_lsc_ctl.scala 133:24]
  assign io_end_addr_m = end_addr_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 347:26]
  assign io_end_addr_r = end_addr_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 351:26]
  assign io_store_data_m = _T_114 & _T_116; // @[el2_lsu_lsc_ctl.scala 394:29]
  assign io_lsu_exc_m = access_fault_m | misaligned_fault_m; // @[el2_lsu_lsc_ctl.scala 188:16]
  assign io_is_sideeffects_m = addrcheck_io_is_sideeffects_m; // @[el2_lsu_lsc_ctl.scala 151:42]
  assign io_lsu_commit_r = _T_107 & _T_108; // @[el2_lsu_lsc_ctl.scala 391:19]
  assign io_lsu_single_ecc_error_incr = _T_34 & io_lsu_pkt_r_valid; // @[el2_lsu_lsc_ctl.scala 189:32]
  assign io_lsu_error_pkt_r_exc_valid = _T_65_exc_valid; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_single_ecc_error = _T_65_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_inst_type = _T_65_inst_type; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_exc_type = _T_65_exc_type; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_mscause = _T_65_mscause; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_addr = _T_65_addr; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r; // @[el2_lsu_lsc_ctl.scala 384:28]
  assign io_lsu_fir_error = 2'h0; // @[el2_lsu_lsc_ctl.scala 228:23]
  assign io_addr_in_dccm_d = addrcheck_io_addr_in_dccm_d; // @[el2_lsu_lsc_ctl.scala 152:42]
  assign io_addr_in_dccm_m = addr_in_dccm_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 355:27]
  assign io_addr_in_dccm_r = addr_in_dccm_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 359:28]
  assign io_addr_in_pic_d = addrcheck_io_addr_in_pic_d; // @[el2_lsu_lsc_ctl.scala 153:42]
  assign io_addr_in_pic_m = addr_in_pic_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 363:27]
  assign io_addr_in_pic_r = addr_in_pic_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 367:27]
  assign io_addr_external_m = addr_external_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 371:28]
  assign io_lsu_pkt_d_fast_int = io_dec_lsu_valid_raw_d & io_lsu_p_fast_int; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_by = io_dec_lsu_valid_raw_d ? io_lsu_p_by : dma_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_half = io_dec_lsu_valid_raw_d ? io_lsu_p_half : dma_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_word = io_dec_lsu_valid_raw_d ? io_lsu_p_word : dma_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_dword = io_dec_lsu_valid_raw_d ? io_lsu_p_dword : dma_pkt_d_dword; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_load = io_dec_lsu_valid_raw_d ? io_lsu_p_load : dma_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_store = io_dec_lsu_valid_raw_d ? io_lsu_p_store : io_dma_mem_write; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_unsign = io_dec_lsu_valid_raw_d & io_lsu_p_unsign; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_dma = io_dec_lsu_valid_raw_d ? io_lsu_p_dma : 1'h1; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_store_data_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_load_ldst_bypass_d = io_dec_lsu_valid_raw_d & io_lsu_p_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_store_data_bypass_m = io_dec_lsu_valid_raw_d & io_lsu_p_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 285:20]
  assign io_lsu_pkt_d_valid = _T_82 | io_dma_dccm_req; // @[el2_lsu_lsc_ctl.scala 285:20 el2_lsu_lsc_ctl.scala 289:24]
  assign io_lsu_pkt_m_fast_int = _T_92_fast_int; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_by = _T_92_by; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_half = _T_92_half; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_word = _T_92_word; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_dword = _T_92_dword; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_load = _T_92_load; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_store = _T_92_store; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_unsign = _T_92_unsign; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_dma = _T_92_dma; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_store_data_bypass_d = _T_92_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_load_ldst_bypass_d = _T_92_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_store_data_bypass_m = _T_92_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_valid = _T_92_valid; // @[el2_lsu_lsc_ctl.scala 296:34 el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_r_fast_int = _T_93_fast_int; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_by = _T_93_by; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_half = _T_93_half; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_word = _T_93_word; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_dword = _T_93_dword; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_load = _T_93_load; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_store = _T_93_store; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_unsign = _T_93_unsign; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_dma = _T_93_dma; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_store_data_bypass_d = _T_93_store_data_bypass_d; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_load_ldst_bypass_d = _T_93_load_ldst_bypass_d; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_store_data_bypass_m = _T_93_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_valid = _T_93_valid; // @[el2_lsu_lsc_ctl.scala 300:33 el2_lsu_lsc_ctl.scala 310:16]
  assign lsadder_io_rs1 = io_lsu_pkt_d_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[el2_lsu_lsc_ctl.scala 119:26]
  assign lsadder_io_offset = io_dec_lsu_offset_d & _T_3; // @[el2_lsu_lsc_ctl.scala 120:26]
  assign addrcheck_reset = reset;
  assign addrcheck_io_lsu_c2_m_clk = io_lsu_c2_m_clk; // @[el2_lsu_lsc_ctl.scala 143:42]
  assign addrcheck_io_start_addr_d = lsadder_io_dout; // @[el2_lsu_lsc_ctl.scala 145:42]
  assign addrcheck_io_end_addr_d = rs1_d + _T_27; // @[el2_lsu_lsc_ctl.scala 146:42]
  assign addrcheck_io_lsu_pkt_d_by = io_lsu_pkt_d_by; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_half = io_lsu_pkt_d_half; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_word = io_lsu_pkt_d_word; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_load = io_lsu_pkt_d_load; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_store = io_lsu_pkt_d_store; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_dma = io_lsu_pkt_d_dma; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_lsu_pkt_d_valid = io_lsu_pkt_d_valid; // @[el2_lsu_lsc_ctl.scala 147:42]
  assign addrcheck_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[el2_lsu_lsc_ctl.scala 148:42]
  assign addrcheck_io_rs1_region_d = rs1_d[31:28]; // @[el2_lsu_lsc_ctl.scala 149:42]
  assign access_fault_mff_clock = clock;
  assign access_fault_mff_reset = reset;
  assign access_fault_mff_io_din = addrcheck_io_access_fault_d; // @[el2_lsu_lsc_ctl.scala 246:40]
  assign misaligned_fault_mff_clock = clock;
  assign misaligned_fault_mff_reset = reset;
  assign misaligned_fault_mff_io_din = addrcheck_io_misaligned_fault_d; // @[el2_lsu_lsc_ctl.scala 249:40]
  assign exc_mscause_mff_clock = clock;
  assign exc_mscause_mff_reset = reset;
  assign exc_mscause_mff_io_din = addrcheck_io_exc_mscause_d; // @[el2_lsu_lsc_ctl.scala 252:40]
  assign lsu_pkt_vldmff_clock = clock;
  assign lsu_pkt_vldmff_reset = reset;
  assign lsu_pkt_vldmff_io_din = io_lsu_pkt_d_valid & _T_86; // @[el2_lsu_lsc_ctl.scala 295:34]
  assign lsu_pkt_vldrff_clock = clock;
  assign lsu_pkt_vldrff_reset = reset;
  assign lsu_pkt_vldrff_io_din = io_lsu_pkt_m_valid & _T_90; // @[el2_lsu_lsc_ctl.scala 299:33]
  assign sdmff_clock = clock;
  assign sdmff_reset = reset;
  assign sdmff_io_din = io_lsu_pkt_d_store_data_bypass_d ? io_lsu_result_m : store_data_d; // @[el2_lsu_lsc_ctl.scala 334:27]
  assign samff_clock = clock;
  assign samff_reset = reset;
  assign samff_io_din = io_lsu_addr_d; // @[el2_lsu_lsc_ctl.scala 338:23]
  assign sarff_clock = clock;
  assign sarff_reset = reset;
  assign sarff_io_din = io_lsu_addr_m; // @[el2_lsu_lsc_ctl.scala 342:23]
  assign end_addr_mff_clock = clock;
  assign end_addr_mff_reset = reset;
  assign end_addr_mff_io_din = io_end_addr_d; // @[el2_lsu_lsc_ctl.scala 346:26]
  assign end_addr_rff_clock = clock;
  assign end_addr_rff_reset = reset;
  assign end_addr_rff_io_din = io_end_addr_m; // @[el2_lsu_lsc_ctl.scala 350:26]
  assign addr_in_dccm_mff_clock = clock;
  assign addr_in_dccm_mff_reset = reset;
  assign addr_in_dccm_mff_io_din = io_addr_in_dccm_d; // @[el2_lsu_lsc_ctl.scala 354:27]
  assign addr_in_dccm_rff_clock = clock;
  assign addr_in_dccm_rff_reset = reset;
  assign addr_in_dccm_rff_io_din = io_addr_in_dccm_m; // @[el2_lsu_lsc_ctl.scala 358:28]
  assign addr_in_pic_mff_clock = clock;
  assign addr_in_pic_mff_reset = reset;
  assign addr_in_pic_mff_io_din = io_addr_in_pic_d; // @[el2_lsu_lsc_ctl.scala 362:27]
  assign addr_in_pic_rff_clock = clock;
  assign addr_in_pic_rff_reset = reset;
  assign addr_in_pic_rff_io_din = io_addr_in_pic_m; // @[el2_lsu_lsc_ctl.scala 366:27]
  assign addr_external_mff_clock = clock;
  assign addr_external_mff_reset = reset;
  assign addr_external_mff_io_din = addrcheck_io_addr_external_d; // @[el2_lsu_lsc_ctl.scala 370:28]
  assign addr_external_rff_clock = clock;
  assign addr_external_rff_reset = reset;
  assign addr_external_rff_io_din = io_addr_external_m; // @[el2_lsu_lsc_ctl.scala 374:28]
  assign bus_read_data_r_ff_clock = clock;
  assign bus_read_data_r_ff_reset = reset;
  assign bus_read_data_r_ff_io_din = io_bus_read_data_m; // @[el2_lsu_lsc_ctl.scala 378:29]
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
  _T_65_exc_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_65_single_ecc_error = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_65_inst_type = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_65_exc_type = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_65_mscause = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  _T_65_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_92_fast_int = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  _T_92_by = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  _T_92_half = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_92_word = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_92_dword = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_92_load = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_92_store = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_92_unsign = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_92_dma = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_92_store_data_bypass_d = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_92_load_ldst_bypass_d = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_92_store_data_bypass_m = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_92_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_93_fast_int = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_93_by = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_93_half = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_93_word = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_93_dword = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_93_load = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_93_store = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  _T_93_unsign = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  _T_93_dma = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  _T_93_store_data_bypass_d = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  _T_93_load_ldst_bypass_d = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  _T_93_store_data_bypass_m = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  _T_93_valid = _RAND_31[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T_65_exc_valid <= _T_42 & _T_43;
    _T_65_single_ecc_error <= _T_46 & _T_39;
    _T_65_inst_type <= io_lsu_pkt_m_store;
    _T_65_exc_type <= ~misaligned_fault_m;
    if (_T_53) begin
      _T_65_mscause <= 4'h1;
    end else begin
      _T_65_mscause <= exc_mscause_m;
    end
    _T_65_addr <= io_lsu_addr_m;
    _T_92_fast_int <= io_lsu_pkt_d_fast_int;
    _T_92_by <= io_lsu_pkt_d_by;
    _T_92_half <= io_lsu_pkt_d_half;
    _T_92_word <= io_lsu_pkt_d_word;
    _T_92_dword <= io_lsu_pkt_d_dword;
    _T_92_load <= io_lsu_pkt_d_load;
    _T_92_store <= io_lsu_pkt_d_store;
    _T_92_unsign <= io_lsu_pkt_d_unsign;
    _T_92_dma <= io_lsu_pkt_d_dma;
    _T_92_store_data_bypass_d <= io_lsu_pkt_d_store_data_bypass_d;
    _T_92_load_ldst_bypass_d <= io_lsu_pkt_d_load_ldst_bypass_d;
    _T_92_store_data_bypass_m <= io_lsu_pkt_d_store_data_bypass_m;
    _T_92_valid <= io_lsu_pkt_d_valid & _T_86;
    _T_93_fast_int <= io_lsu_pkt_m_fast_int;
    _T_93_by <= io_lsu_pkt_m_by;
    _T_93_half <= io_lsu_pkt_m_half;
    _T_93_word <= io_lsu_pkt_m_word;
    _T_93_dword <= io_lsu_pkt_m_dword;
    _T_93_load <= io_lsu_pkt_m_load;
    _T_93_store <= io_lsu_pkt_m_store;
    _T_93_unsign <= io_lsu_pkt_m_unsign;
    _T_93_dma <= io_lsu_pkt_m_dma;
    _T_93_store_data_bypass_d <= io_lsu_pkt_m_store_data_bypass_d;
    _T_93_load_ldst_bypass_d <= io_lsu_pkt_m_load_ldst_bypass_d;
    _T_93_store_data_bypass_m <= io_lsu_pkt_m_store_data_bypass_m;
    _T_93_valid <= io_lsu_pkt_m_valid & _T_90;
  end
endmodule
