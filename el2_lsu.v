module rvlsadder(
  input  [31:0] io_rs1,
  input  [11:0] io_offset,
  output [31:0] io_dout
);
  wire [12:0] _T_1 = {1'h0,io_rs1[11:0]}; // @[Cat.scala 29:58]
  wire [12:0] _T_3 = {1'h0,io_offset}; // @[Cat.scala 29:58]
  wire [12:0] w1 = _T_1 + _T_3; // @[beh_lib.scala 51:40]
  wire  _T_7 = io_offset[11] ^ w1[12]; // @[beh_lib.scala 53:47]
  wire  _T_8 = ~_T_7; // @[beh_lib.scala 53:31]
  wire [19:0] _T_10 = _T_8 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_12 = _T_10 & io_rs1[31:12]; // @[beh_lib.scala 53:59]
  wire  _T_14 = ~io_offset[11]; // @[beh_lib.scala 54:16]
  wire  _T_16 = _T_14 & w1[12]; // @[beh_lib.scala 54:31]
  wire [19:0] _T_18 = _T_16 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_21 = io_rs1[31:12] + 20'h1; // @[beh_lib.scala 54:58]
  wire [19:0] _T_22 = _T_18 & _T_21; // @[beh_lib.scala 54:42]
  wire [19:0] _T_23 = _T_12 | _T_22; // @[beh_lib.scala 53:76]
  wire  _T_26 = ~w1[12]; // @[beh_lib.scala 55:32]
  wire  _T_27 = io_offset[11] & _T_26; // @[beh_lib.scala 55:30]
  wire [19:0] _T_29 = _T_27 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [19:0] _T_32 = io_rs1[31:12] - 20'h1; // @[beh_lib.scala 55:58]
  wire [19:0] _T_33 = _T_29 & _T_32; // @[beh_lib.scala 55:42]
  wire [19:0] dout_upper = _T_23 | _T_33; // @[beh_lib.scala 54:65]
  assign io_dout = {dout_upper,w1[11:0]}; // @[beh_lib.scala 57:11]
endmodule
module rvrangecheck(
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:16] == 16'hf004; // @[beh_lib.scala 118:17]
  assign io_in_region = io_addr[31:28] == 4'hf; // @[beh_lib.scala 114:17]
endmodule
module rvrangecheck_2(
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:15] == 17'h1e018; // @[beh_lib.scala 118:17]
  assign io_in_region = io_addr[31:28] == 4'hf; // @[beh_lib.scala 114:17]
endmodule
module el2_lsu_addrcheck(
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
  output        io_addr_in_dccm_d,
  output        io_addr_in_pic_d,
  output        io_addr_external_d,
  output        io_access_fault_d,
  output        io_misaligned_fault_d,
  output [3:0]  io_exc_mscause_d
);
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
  reg  flop; // @[beh_lib.scala 15:21]
  assign io_dout = flop; // @[beh_lib.scala 20:12]
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
  reg [3:0] flop; // @[beh_lib.scala 15:21]
  assign io_dout = flop; // @[beh_lib.scala 20:12]
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
  reg [31:0] flop; // @[beh_lib.scala 15:21]
  assign io_dout = flop; // @[beh_lib.scala 20:12]
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
  output [31:0] io_lsu_result_m,
  output [31:0] io_lsu_addr_d,
  output [31:0] io_lsu_addr_m,
  output [31:0] io_lsu_addr_r,
  output [31:0] io_end_addr_d,
  output [31:0] io_end_addr_m,
  output [31:0] io_end_addr_r,
  output [31:0] io_store_data_m,
  input  [31:0] io_dec_tlu_mrac_ff,
  output        io_lsu_commit_r,
  output        io_lsu_single_ecc_error_incr,
  output        io_lsu_error_pkt_r_exc_valid,
  output        io_lsu_error_pkt_r_single_ecc_error,
  output        io_lsu_error_pkt_r_inst_type,
  output        io_lsu_error_pkt_r_exc_type,
  output [3:0]  io_lsu_error_pkt_r_mscause,
  output [31:0] io_lsu_error_pkt_r_addr,
  output [31:0] io_lsu_fir_addr,
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] lsadder_io_rs1; // @[el2_lsu_lsc_ctl.scala 118:23]
  wire [11:0] lsadder_io_offset; // @[el2_lsu_lsc_ctl.scala 118:23]
  wire [31:0] lsadder_io_dout; // @[el2_lsu_lsc_ctl.scala 118:23]
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
  reg  _T_92_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_92_valid; // @[el2_lsu_lsc_ctl.scala 305:26]
  reg  _T_93_by; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_half; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_word; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_dword; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_load; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_store; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_unsign; // @[el2_lsu_lsc_ctl.scala 310:26]
  reg  _T_93_dma; // @[el2_lsu_lsc_ctl.scala 310:26]
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
  wire [31:0] lsu_ld_datafn_m = io_addr_external_m ? 32'h0 : io_lsu_ld_data_m; // @[el2_lsu_lsc_ctl.scala 425:33]
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
  rvlsadder lsadder ( // @[el2_lsu_lsc_ctl.scala 118:23]
    .io_rs1(lsadder_io_rs1),
    .io_offset(lsadder_io_offset),
    .io_dout(lsadder_io_dout)
  );
  el2_lsu_addrcheck addrcheck ( // @[el2_lsu_lsc_ctl.scala 141:25]
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
  assign io_lsu_addr_d = lsadder_io_dout; // @[el2_lsu_lsc_ctl.scala 387:28]
  assign io_lsu_addr_m = samff_io_dout; // @[el2_lsu_lsc_ctl.scala 339:26]
  assign io_lsu_addr_r = sarff_io_dout; // @[el2_lsu_lsc_ctl.scala 343:23]
  assign io_end_addr_d = rs1_d + _T_27; // @[el2_lsu_lsc_ctl.scala 133:24]
  assign io_end_addr_m = end_addr_mff_io_dout; // @[el2_lsu_lsc_ctl.scala 347:26]
  assign io_end_addr_r = end_addr_rff_io_dout; // @[el2_lsu_lsc_ctl.scala 351:26]
  assign io_store_data_m = _T_114 & _T_116; // @[el2_lsu_lsc_ctl.scala 394:29]
  assign io_lsu_commit_r = _T_107 & _T_108; // @[el2_lsu_lsc_ctl.scala 391:19]
  assign io_lsu_single_ecc_error_incr = _T_34 & io_lsu_pkt_r_valid; // @[el2_lsu_lsc_ctl.scala 189:32]
  assign io_lsu_error_pkt_r_exc_valid = _T_65_exc_valid; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_single_ecc_error = _T_65_single_ecc_error; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_inst_type = _T_65_inst_type; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_exc_type = _T_65_exc_type; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_mscause = _T_65_mscause; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_error_pkt_r_addr = _T_65_addr; // @[el2_lsu_lsc_ctl.scala 241:24]
  assign io_lsu_fir_addr = io_lsu_ld_data_corr_r; // @[el2_lsu_lsc_ctl.scala 384:28]
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
  assign io_lsu_pkt_m_store_data_bypass_m = _T_92_store_data_bypass_m; // @[el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_m_valid = _T_92_valid; // @[el2_lsu_lsc_ctl.scala 296:34 el2_lsu_lsc_ctl.scala 305:16]
  assign io_lsu_pkt_r_by = _T_93_by; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_half = _T_93_half; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_word = _T_93_word; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_dword = _T_93_dword; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_load = _T_93_load; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_store = _T_93_store; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_unsign = _T_93_unsign; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_dma = _T_93_dma; // @[el2_lsu_lsc_ctl.scala 310:16]
  assign io_lsu_pkt_r_valid = _T_93_valid; // @[el2_lsu_lsc_ctl.scala 300:33 el2_lsu_lsc_ctl.scala 310:16]
  assign lsadder_io_rs1 = io_lsu_pkt_d_load_ldst_bypass_d ? io_lsu_result_m : lsu_rs1_d; // @[el2_lsu_lsc_ctl.scala 119:26]
  assign lsadder_io_offset = io_dec_lsu_offset_d & _T_3; // @[el2_lsu_lsc_ctl.scala 120:26]
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
  assign bus_read_data_r_ff_io_din = 32'h0; // @[el2_lsu_lsc_ctl.scala 378:29]
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
  _T_92_store_data_bypass_m = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_92_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_93_by = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_93_half = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_93_word = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  _T_93_dword = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  _T_93_load = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  _T_93_store = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  _T_93_unsign = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  _T_93_dma = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  _T_93_valid = _RAND_25[0:0];
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
    _T_92_store_data_bypass_m <= io_lsu_pkt_d_store_data_bypass_m;
    _T_92_valid <= io_lsu_pkt_d_valid & _T_86;
    _T_93_by <= io_lsu_pkt_m_by;
    _T_93_half <= io_lsu_pkt_m_half;
    _T_93_word <= io_lsu_pkt_m_word;
    _T_93_dword <= io_lsu_pkt_m_dword;
    _T_93_load <= io_lsu_pkt_m_load;
    _T_93_store <= io_lsu_pkt_m_store;
    _T_93_unsign <= io_lsu_pkt_m_unsign;
    _T_93_dma <= io_lsu_pkt_m_dma;
    _T_93_valid <= io_lsu_pkt_m_valid & _T_90;
  end
endmodule
module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 331:24]
  wire  clkhdr_CK; // @[beh_lib.scala 331:24]
  wire  clkhdr_EN; // @[beh_lib.scala 331:24]
  wire  clkhdr_SE; // @[beh_lib.scala 331:24]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 331:24]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 332:12]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 333:16]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 334:16]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 335:16]
endmodule
module el2_lsu_dccm_ctl(
  input         reset,
  input         io_lsu_c2_m_clk,
  input         io_lsu_c2_r_clk,
  input         io_lsu_free_c2_clk,
  input         io_lsu_store_c1_r_clk,
  input         io_clk,
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
  input  [15:0] io_lsu_addr_d,
  input  [15:0] io_lsu_addr_m,
  input  [15:0] io_lsu_addr_r,
  input  [15:0] io_end_addr_d,
  input  [15:0] io_end_addr_m,
  input  [15:0] io_end_addr_r,
  input         io_stbuf_reqvld_any,
  input  [15:0] io_stbuf_addr_any,
  input  [31:0] io_stbuf_data_any,
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
  output [31:0] io_store_data_hi_r,
  output [31:0] io_store_data_lo_r,
  output [31:0] io_store_datafn_hi_r,
  output [31:0] io_store_datafn_lo_r,
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
  wire  rvclkhdr_io_l1clk; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_io_clk; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_io_en; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_io_scan_mode; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_1_io_l1clk; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_1_io_clk; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_1_io_en; // @[beh_lib.scala 351:21]
  wire  rvclkhdr_1_io_scan_mode; // @[beh_lib.scala 351:21]
  wire [63:0] picm_rd_data_m = {io_picm_rd_data,io_picm_rd_data}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_corr_m = {io_sec_data_hi_m,io_sec_data_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] dccm_rdata_m = {io_dccm_rdata_hi_m,io_dccm_rdata_lo_m}; // @[Cat.scala 29:58]
  wire  _T = io_lsu_pkt_m_valid & io_lsu_pkt_m_load; // @[el2_lsu_dccm_ctl.scala 168:50]
  wire [7:0] _T_30 = {io_stbuf_fwdbyteen_hi_m,io_stbuf_fwdbyteen_lo_m}; // @[Cat.scala 29:58]
  wire [63:0] _T_33 = {io_stbuf_fwddata_hi_m,io_stbuf_fwddata_lo_m}; // @[Cat.scala 29:58]
  wire [7:0] _T_38 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_corr_m[15:8]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_1 = _T_30[1] ? _T_33[15:8] : _T_38; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_18 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_corr_m[7:0]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_0 = _T_30[0] ? _T_33[7:0] : _T_18; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_78 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_corr_m[31:24]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_3 = _T_30[3] ? _T_33[31:24] : _T_78; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_58 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_corr_m[23:16]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_2 = _T_30[2] ? _T_33[23:16] : _T_58; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [31:0] _T_4 = {lsu_rdata_corr_m_3,lsu_rdata_corr_m_2,lsu_rdata_corr_m_1,lsu_rdata_corr_m_0}; // @[el2_lsu_dccm_ctl.scala 170:48]
  wire [7:0] _T_118 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_corr_m[47:40]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_5 = _T_30[5] ? _T_33[47:40] : _T_118; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_98 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_corr_m[39:32]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_4 = _T_30[4] ? _T_33[39:32] : _T_98; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_158 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_corr_m[63:56]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_7 = _T_30[7] ? _T_33[63:56] : _T_158; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [7:0] _T_138 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_corr_m[55:48]; // @[el2_lsu_dccm_ctl.scala 184:171]
  wire [7:0] lsu_rdata_corr_m_6 = _T_30[6] ? _T_33[55:48] : _T_138; // @[el2_lsu_dccm_ctl.scala 184:36]
  wire [31:0] _T_7 = {lsu_rdata_corr_m_7,lsu_rdata_corr_m_6,lsu_rdata_corr_m_5,lsu_rdata_corr_m_4}; // @[el2_lsu_dccm_ctl.scala 170:48]
  wire [63:0] _T_8 = {lsu_rdata_corr_m_7,lsu_rdata_corr_m_6,lsu_rdata_corr_m_5,lsu_rdata_corr_m_4,lsu_rdata_corr_m_3,lsu_rdata_corr_m_2,lsu_rdata_corr_m_1,lsu_rdata_corr_m_0}; // @[el2_lsu_dccm_ctl.scala 170:48]
  reg [63:0] _T_9; // @[el2_lsu_dccm_ctl.scala 178:65]
  wire [7:0] _T_28 = io_addr_in_pic_m ? picm_rd_data_m[7:0] : dccm_rdata_m[7:0]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_0 = _T_30[0] ? _T_33[7:0] : _T_28; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_48 = io_addr_in_pic_m ? picm_rd_data_m[15:8] : dccm_rdata_m[15:8]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_1 = _T_30[1] ? _T_33[15:8] : _T_48; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_68 = io_addr_in_pic_m ? picm_rd_data_m[23:16] : dccm_rdata_m[23:16]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_2 = _T_30[2] ? _T_33[23:16] : _T_68; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_88 = io_addr_in_pic_m ? picm_rd_data_m[31:24] : dccm_rdata_m[31:24]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_3 = _T_30[3] ? _T_33[31:24] : _T_88; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_108 = io_addr_in_pic_m ? picm_rd_data_m[39:32] : dccm_rdata_m[39:32]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_4 = _T_30[4] ? _T_33[39:32] : _T_108; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_128 = io_addr_in_pic_m ? picm_rd_data_m[47:40] : dccm_rdata_m[47:40]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_5 = _T_30[5] ? _T_33[47:40] : _T_128; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_148 = io_addr_in_pic_m ? picm_rd_data_m[55:48] : dccm_rdata_m[55:48]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_6 = _T_30[6] ? _T_33[55:48] : _T_148; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [7:0] _T_168 = io_addr_in_pic_m ? picm_rd_data_m[63:56] : dccm_rdata_m[63:56]; // @[el2_lsu_dccm_ctl.scala 185:171]
  wire [7:0] lsu_rdata_m_7 = _T_30[7] ? _T_33[63:56] : _T_168; // @[el2_lsu_dccm_ctl.scala 185:36]
  wire [63:0] _T_176 = {lsu_rdata_m_7,lsu_rdata_m_6,lsu_rdata_m_5,lsu_rdata_m_4,lsu_rdata_m_3,lsu_rdata_m_2,lsu_rdata_m_1,lsu_rdata_m_0}; // @[el2_lsu_dccm_ctl.scala 186:43]
  wire [3:0] _GEN_0 = {{2'd0}, io_lsu_addr_m[1:0]}; // @[el2_lsu_dccm_ctl.scala 186:56]
  wire [5:0] _T_178 = 4'h8 * _GEN_0; // @[el2_lsu_dccm_ctl.scala 186:56]
  wire [63:0] _T_179 = _T_176 >> _T_178; // @[el2_lsu_dccm_ctl.scala 186:50]
  wire  _T_192 = io_lsu_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 190:64]
  wire  _T_195 = io_end_addr_d[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 190:145]
  wire  _T_196 = _T_192 | _T_195; // @[el2_lsu_dccm_ctl.scala 190:109]
  wire  _T_197 = _T_196 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 190:191]
  wire  _T_198 = _T_197 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 190:212]
  wire  _T_199 = _T_198 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 190:233]
  wire  _T_200 = _T_199 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 190:252]
  wire  _T_203 = io_lsu_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 191:41]
  wire  _T_206 = io_end_addr_m[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 191:122]
  wire  _T_207 = _T_203 | _T_206; // @[el2_lsu_dccm_ctl.scala 191:86]
  wire  _T_208 = _T_207 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 191:168]
  wire  _T_209 = _T_208 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 191:189]
  wire  _T_210 = _T_209 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 191:210]
  wire  _T_211 = _T_210 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 191:229]
  wire  kill_ecc_corr_lo_r = _T_200 | _T_211; // @[el2_lsu_dccm_ctl.scala 190:273]
  wire  _T_214 = io_lsu_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 192:64]
  wire  _T_217 = io_end_addr_d[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 192:145]
  wire  _T_218 = _T_214 | _T_217; // @[el2_lsu_dccm_ctl.scala 192:109]
  wire  _T_219 = _T_218 & io_lsu_pkt_d_valid; // @[el2_lsu_dccm_ctl.scala 192:191]
  wire  _T_220 = _T_219 & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 192:212]
  wire  _T_221 = _T_220 & io_lsu_pkt_d_dma; // @[el2_lsu_dccm_ctl.scala 192:233]
  wire  _T_222 = _T_221 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 192:252]
  wire  _T_225 = io_lsu_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 193:41]
  wire  _T_228 = io_end_addr_m[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 193:122]
  wire  _T_229 = _T_225 | _T_228; // @[el2_lsu_dccm_ctl.scala 193:86]
  wire  _T_230 = _T_229 & io_lsu_pkt_m_valid; // @[el2_lsu_dccm_ctl.scala 193:168]
  wire  _T_231 = _T_230 & io_lsu_pkt_m_store; // @[el2_lsu_dccm_ctl.scala 193:189]
  wire  _T_232 = _T_231 & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 193:210]
  wire  _T_233 = _T_232 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 193:229]
  wire  kill_ecc_corr_hi_r = _T_222 | _T_233; // @[el2_lsu_dccm_ctl.scala 192:273]
  wire  _T_234 = io_lsu_pkt_r_load & io_single_ecc_error_lo_r; // @[el2_lsu_dccm_ctl.scala 194:55]
  wire  _T_235 = ~io_lsu_raw_fwd_lo_r; // @[el2_lsu_dccm_ctl.scala 194:84]
  wire  ld_single_ecc_error_lo_r = _T_234 & _T_235; // @[el2_lsu_dccm_ctl.scala 194:82]
  wire  _T_236 = io_lsu_pkt_r_load & io_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 195:55]
  wire  _T_237 = ~io_lsu_raw_fwd_hi_r; // @[el2_lsu_dccm_ctl.scala 195:84]
  wire  ld_single_ecc_error_hi_r = _T_236 & _T_237; // @[el2_lsu_dccm_ctl.scala 195:82]
  wire  _T_238 = ld_single_ecc_error_lo_r | ld_single_ecc_error_hi_r; // @[el2_lsu_dccm_ctl.scala 196:62]
  wire  _T_239 = ~io_lsu_double_ecc_error_r; // @[el2_lsu_dccm_ctl.scala 196:92]
  wire  _T_241 = io_lsu_commit_r | io_lsu_pkt_r_dma; // @[el2_lsu_dccm_ctl.scala 197:81]
  wire  _T_242 = ld_single_ecc_error_lo_r & _T_241; // @[el2_lsu_dccm_ctl.scala 197:62]
  wire  _T_243 = ~kill_ecc_corr_lo_r; // @[el2_lsu_dccm_ctl.scala 197:103]
  wire  _T_245 = ld_single_ecc_error_hi_r & _T_241; // @[el2_lsu_dccm_ctl.scala 198:62]
  wire  _T_246 = ~kill_ecc_corr_hi_r; // @[el2_lsu_dccm_ctl.scala 198:103]
  reg  lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 200:74]
  reg  ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 201:74]
  reg  ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 202:74]
  reg [15:0] ld_sec_addr_hi_r_ff; // @[beh_lib.scala 357:14]
  reg [15:0] ld_sec_addr_lo_r_ff; // @[beh_lib.scala 357:14]
  wire  _T_253 = io_lsu_pkt_d_word | io_lsu_pkt_d_dword; // @[el2_lsu_dccm_ctl.scala 208:110]
  wire  _T_254 = ~_T_253; // @[el2_lsu_dccm_ctl.scala 208:90]
  wire  _T_256 = io_lsu_addr_d[1:0] != 2'h0; // @[el2_lsu_dccm_ctl.scala 208:154]
  wire  _T_257 = _T_254 | _T_256; // @[el2_lsu_dccm_ctl.scala 208:132]
  wire  _T_258 = io_lsu_pkt_d_store & _T_257; // @[el2_lsu_dccm_ctl.scala 208:87]
  wire  _T_259 = io_lsu_pkt_d_load | _T_258; // @[el2_lsu_dccm_ctl.scala 208:65]
  wire  _T_260 = io_lsu_pkt_d_valid & _T_259; // @[el2_lsu_dccm_ctl.scala 208:44]
  wire  lsu_dccm_rden_d = _T_260 & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 208:171]
  wire  _T_261 = ld_single_ecc_error_lo_r_ff | ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 211:63]
  wire  _T_262 = ~lsu_double_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 211:96]
  wire  _T_264 = lsu_dccm_rden_d | io_dma_dccm_wen; // @[el2_lsu_dccm_ctl.scala 212:71]
  wire  _T_265 = _T_264 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 212:89]
  wire  _T_266 = ~_T_265; // @[el2_lsu_dccm_ctl.scala 212:53]
  wire  _T_269 = io_stbuf_addr_any[3:2] == io_lsu_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 213:107]
  wire  _T_272 = io_stbuf_addr_any[3:2] == io_end_addr_d[3:2]; // @[el2_lsu_dccm_ctl.scala 214:88]
  wire  _T_273 = _T_269 | _T_272; // @[el2_lsu_dccm_ctl.scala 213:195]
  wire  _T_274 = ~_T_273; // @[el2_lsu_dccm_ctl.scala 213:24]
  wire  _T_275 = lsu_dccm_rden_d & _T_274; // @[el2_lsu_dccm_ctl.scala 213:22]
  wire  _T_276 = _T_266 | _T_275; // @[el2_lsu_dccm_ctl.scala 212:120]
  wire  _T_278 = io_dma_dccm_wen | io_lsu_stbuf_commit_any; // @[el2_lsu_dccm_ctl.scala 217:41]
  wire [15:0] _T_285 = ld_single_ecc_error_lo_r_ff ? ld_sec_addr_lo_r_ff : ld_sec_addr_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 220:8]
  wire [15:0] _T_289 = io_dma_dccm_wen ? io_lsu_addr_d : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 221:8]
  wire [15:0] _T_295 = ld_single_ecc_error_hi_r_ff ? ld_sec_addr_hi_r_ff : ld_sec_addr_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 223:8]
  wire [15:0] _T_299 = io_dma_dccm_wen ? io_end_addr_d : io_stbuf_addr_any; // @[el2_lsu_dccm_ctl.scala 224:8]
  wire  _T_304 = ~ld_single_ecc_error_lo_r_ff; // @[el2_lsu_dccm_ctl.scala 228:36]
  wire [38:0] _T_307 = {7'h0,io_sec_data_lo_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_310 = {7'h0,io_sec_data_hi_r_ff}; // @[Cat.scala 29:58]
  wire [38:0] _T_311 = _T_304 ? _T_307 : _T_310; // @[el2_lsu_dccm_ctl.scala 228:8]
  wire [38:0] _T_315 = {7'h0,io_dma_dccm_wdata_lo}; // @[Cat.scala 29:58]
  wire [38:0] _T_318 = {7'h0,io_stbuf_data_any}; // @[Cat.scala 29:58]
  wire [38:0] _T_319 = io_dma_dccm_wen ? _T_315 : _T_318; // @[el2_lsu_dccm_ctl.scala 230:8]
  wire  _T_322 = ~ld_single_ecc_error_hi_r_ff; // @[el2_lsu_dccm_ctl.scala 234:36]
  wire [38:0] _T_329 = _T_322 ? _T_310 : _T_307; // @[el2_lsu_dccm_ctl.scala 234:8]
  wire [38:0] _T_333 = {7'h0,io_dma_dccm_wdata_hi}; // @[Cat.scala 29:58]
  wire [38:0] _T_337 = io_dma_dccm_wen ? _T_333 : _T_318; // @[el2_lsu_dccm_ctl.scala 236:8]
  wire [3:0] _T_340 = io_lsu_pkt_m_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_342 = io_lsu_pkt_m_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_343 = _T_342 & 4'h1; // @[el2_lsu_dccm_ctl.scala 240:84]
  wire [3:0] _T_345 = io_lsu_pkt_m_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_346 = _T_345 & 4'h3; // @[el2_lsu_dccm_ctl.scala 241:33]
  wire [3:0] _T_347 = _T_343 | _T_346; // @[el2_lsu_dccm_ctl.scala 240:97]
  wire [3:0] _T_349 = io_lsu_pkt_m_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_351 = _T_347 | _T_349; // @[el2_lsu_dccm_ctl.scala 241:46]
  wire [3:0] store_byteen_m = _T_340 & _T_351; // @[el2_lsu_dccm_ctl.scala 240:53]
  wire [3:0] _T_353 = io_lsu_pkt_r_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_355 = io_lsu_pkt_r_by ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_356 = _T_355 & 4'h1; // @[el2_lsu_dccm_ctl.scala 243:84]
  wire [3:0] _T_358 = io_lsu_pkt_r_half ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_359 = _T_358 & 4'h3; // @[el2_lsu_dccm_ctl.scala 244:33]
  wire [3:0] _T_360 = _T_356 | _T_359; // @[el2_lsu_dccm_ctl.scala 243:97]
  wire [3:0] _T_362 = io_lsu_pkt_r_word ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_364 = _T_360 | _T_362; // @[el2_lsu_dccm_ctl.scala 244:46]
  wire [3:0] store_byteen_r = _T_353 & _T_364; // @[el2_lsu_dccm_ctl.scala 243:53]
  wire [7:0] _T_366 = {4'h0,store_byteen_m}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_2 = {{3'd0}, _T_366}; // @[el2_lsu_dccm_ctl.scala 246:62]
  wire [10:0] store_byteen_ext_m = _GEN_2 << io_lsu_addr_m[1:0]; // @[el2_lsu_dccm_ctl.scala 246:62]
  wire [7:0] _T_369 = {4'h0,store_byteen_r}; // @[Cat.scala 29:58]
  wire [10:0] _GEN_3 = {{3'd0}, _T_369}; // @[el2_lsu_dccm_ctl.scala 247:62]
  wire [10:0] store_byteen_ext_r = _GEN_3 << io_lsu_addr_r[1:0]; // @[el2_lsu_dccm_ctl.scala 247:62]
  wire  _T_373 = io_stbuf_addr_any[15:2] == io_lsu_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 250:71]
  wire  dccm_wr_bypass_d_m_lo = _T_373 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 250:109]
  wire  _T_376 = io_stbuf_addr_any[15:2] == io_end_addr_m[15:2]; // @[el2_lsu_dccm_ctl.scala 251:71]
  wire  dccm_wr_bypass_d_m_hi = _T_376 & io_addr_in_dccm_m; // @[el2_lsu_dccm_ctl.scala 251:109]
  wire  _T_379 = io_stbuf_addr_any[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_dccm_ctl.scala 253:71]
  wire  dccm_wr_bypass_d_r_lo = _T_379 & io_addr_in_dccm_r; // @[el2_lsu_dccm_ctl.scala 253:109]
  wire [63:0] _T_385 = {32'h0,io_store_data_m}; // @[Cat.scala 29:58]
  wire [126:0] _GEN_5 = {{63'd0}, _T_385}; // @[el2_lsu_dccm_ctl.scala 287:72]
  wire [126:0] _T_388 = _GEN_5 << _T_178; // @[el2_lsu_dccm_ctl.scala 287:72]
  wire [63:0] store_data_pre_m = _T_388[63:0]; // @[el2_lsu_dccm_ctl.scala 287:29]
  wire [31:0] store_data_hi_m = store_data_pre_m[63:32]; // @[el2_lsu_dccm_ctl.scala 288:48]
  wire [31:0] store_data_lo_m = store_data_pre_m[31:0]; // @[el2_lsu_dccm_ctl.scala 289:48]
  wire  _T_394 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_lo; // @[el2_lsu_dccm_ctl.scala 290:195]
  wire [7:0] _T_398 = _T_394 ? io_stbuf_data_any[7:0] : io_sec_data_lo_m[7:0]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_399 = store_byteen_ext_m[0] ? store_data_lo_m[7:0] : _T_398; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_407 = _T_394 ? io_stbuf_data_any[15:8] : io_sec_data_lo_m[15:8]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_408 = store_byteen_ext_m[1] ? store_data_lo_m[15:8] : _T_407; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_416 = _T_394 ? io_stbuf_data_any[23:16] : io_sec_data_lo_m[23:16]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_417 = store_byteen_ext_m[2] ? store_data_lo_m[23:16] : _T_416; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [7:0] _T_425 = _T_394 ? io_stbuf_data_any[31:24] : io_sec_data_lo_m[31:24]; // @[el2_lsu_dccm_ctl.scala 290:169]
  wire [7:0] _T_426 = store_byteen_ext_m[3] ? store_data_lo_m[31:24] : _T_425; // @[el2_lsu_dccm_ctl.scala 290:104]
  wire [15:0] _T_428 = {_T_417,_T_426}; // @[Cat.scala 29:58]
  wire [15:0] _T_429 = {_T_399,_T_408}; // @[Cat.scala 29:58]
  reg [31:0] _T_431; // @[el2_lsu_dccm_ctl.scala 290:72]
  wire  _T_435 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_m_hi; // @[el2_lsu_dccm_ctl.scala 291:195]
  wire [7:0] _T_439 = _T_435 ? io_stbuf_data_any[7:0] : io_sec_data_hi_m[7:0]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_440 = store_byteen_ext_m[4] ? store_data_hi_m[7:0] : _T_439; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_448 = _T_435 ? io_stbuf_data_any[15:8] : io_sec_data_hi_m[15:8]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_449 = store_byteen_ext_m[5] ? store_data_hi_m[15:8] : _T_448; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_457 = _T_435 ? io_stbuf_data_any[23:16] : io_sec_data_hi_m[23:16]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_458 = store_byteen_ext_m[6] ? store_data_hi_m[23:16] : _T_457; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [7:0] _T_466 = _T_435 ? io_stbuf_data_any[31:24] : io_sec_data_hi_m[31:24]; // @[el2_lsu_dccm_ctl.scala 291:169]
  wire [7:0] _T_467 = store_byteen_ext_m[7] ? store_data_hi_m[31:24] : _T_466; // @[el2_lsu_dccm_ctl.scala 291:104]
  wire [15:0] _T_469 = {_T_458,_T_467}; // @[Cat.scala 29:58]
  wire [15:0] _T_470 = {_T_440,_T_449}; // @[Cat.scala 29:58]
  reg [31:0] _T_472; // @[el2_lsu_dccm_ctl.scala 291:72]
  wire  _T_473 = io_lsu_stbuf_commit_any & dccm_wr_bypass_d_r_lo; // @[el2_lsu_dccm_ctl.scala 292:89]
  wire  _T_475 = ~store_byteen_ext_r[0]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_476 = _T_473 & _T_475; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_480 = _T_476 ? io_stbuf_data_any[7:0] : io_store_data_lo_r[7:0]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_483 = ~store_byteen_ext_r[1]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_484 = _T_473 & _T_483; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_488 = _T_484 ? io_stbuf_data_any[15:8] : io_store_data_lo_r[15:8]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_491 = ~store_byteen_ext_r[2]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_492 = _T_473 & _T_491; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_496 = _T_492 ? io_stbuf_data_any[23:16] : io_store_data_lo_r[23:16]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire  _T_499 = ~store_byteen_ext_r[3]; // @[el2_lsu_dccm_ctl.scala 292:115]
  wire  _T_500 = _T_473 & _T_499; // @[el2_lsu_dccm_ctl.scala 292:113]
  wire [7:0] _T_504 = _T_500 ? io_stbuf_data_any[31:24] : io_store_data_lo_r[31:24]; // @[el2_lsu_dccm_ctl.scala 292:63]
  wire [15:0] _T_506 = {_T_496,_T_504}; // @[Cat.scala 29:58]
  wire [15:0] _T_507 = {_T_480,_T_488}; // @[Cat.scala 29:58]
  wire [7:0] _T_516 = _T_476 ? io_stbuf_data_any[7:0] : io_store_data_hi_r[7:0]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_524 = _T_484 ? io_stbuf_data_any[15:8] : io_store_data_hi_r[15:8]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_532 = _T_492 ? io_stbuf_data_any[23:16] : io_store_data_hi_r[23:16]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [7:0] _T_540 = _T_500 ? io_stbuf_data_any[31:24] : io_store_data_hi_r[31:24]; // @[el2_lsu_dccm_ctl.scala 293:63]
  wire [15:0] _T_542 = {_T_532,_T_540}; // @[Cat.scala 29:58]
  wire [15:0] _T_543 = {_T_516,_T_524}; // @[Cat.scala 29:58]
  wire  _T_577 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_dccm_ctl.scala 302:50]
  wire  _T_578 = _T_577 & io_addr_in_pic_r; // @[el2_lsu_dccm_ctl.scala 302:71]
  wire  _T_579 = _T_578 & io_lsu_commit_r; // @[el2_lsu_dccm_ctl.scala 302:90]
  wire  _T_581 = io_lsu_pkt_d_valid & io_lsu_pkt_d_load; // @[el2_lsu_dccm_ctl.scala 303:50]
  wire  _T_583 = io_lsu_pkt_d_valid & io_lsu_pkt_d_store; // @[el2_lsu_dccm_ctl.scala 304:50]
  wire [5:0] _T_586 = 6'h20 - 6'h1; // @[el2_lsu_dccm_ctl.scala 306:58]
  wire [20:0] _T_588 = {_T_586,io_lsu_addr_d[14:0]}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_8 = {{11'd0}, _T_588}; // @[el2_lsu_dccm_ctl.scala 306:47]
  wire [14:0] _T_595 = io_dma_pic_wen ? io_dma_mem_addr[14:0] : io_lsu_addr_r[14:0]; // @[el2_lsu_dccm_ctl.scala 307:78]
  wire [20:0] _T_596 = {_T_586,_T_595}; // @[Cat.scala 29:58]
  wire [31:0] _GEN_9 = {{11'd0}, _T_596}; // @[el2_lsu_dccm_ctl.scala 307:47]
  reg  _T_603; // @[el2_lsu_dccm_ctl.scala 312:61]
  rvclkhdr rvclkhdr ( // @[beh_lib.scala 351:21]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[beh_lib.scala 351:21]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  assign io_lsu_ld_data_corr_r = _T_9[31:0]; // @[el2_lsu_dccm_ctl.scala 178:28]
  assign io_dccm_rdata_hi_m = io_dccm_rd_data_hi[31:0]; // @[el2_lsu_dccm_ctl.scala 298:27]
  assign io_dccm_rdata_lo_m = io_dccm_rd_data_lo[31:0]; // @[el2_lsu_dccm_ctl.scala 297:27]
  assign io_dccm_data_ecc_hi_m = io_dccm_rd_data_hi[38:32]; // @[el2_lsu_dccm_ctl.scala 300:27]
  assign io_dccm_data_ecc_lo_m = io_dccm_rd_data_lo[38:32]; // @[el2_lsu_dccm_ctl.scala 299:27]
  assign io_lsu_ld_data_m = _T_179[31:0]; // @[el2_lsu_dccm_ctl.scala 186:28]
  assign io_store_data_hi_r = _T_472; // @[el2_lsu_dccm_ctl.scala 291:29]
  assign io_store_data_lo_r = _T_431; // @[el2_lsu_dccm_ctl.scala 290:29]
  assign io_store_datafn_hi_r = {_T_543,_T_542}; // @[el2_lsu_dccm_ctl.scala 293:29]
  assign io_store_datafn_lo_r = {_T_507,_T_506}; // @[el2_lsu_dccm_ctl.scala 292:29]
  assign io_ld_single_ecc_error_r = _T_238 & _T_239; // @[el2_lsu_dccm_ctl.scala 196:33]
  assign io_ld_single_ecc_error_r_ff = _T_261 & _T_262; // @[el2_lsu_dccm_ctl.scala 211:31]
  assign io_picm_mask_data_m = picm_rd_data_m[31:0]; // @[el2_lsu_dccm_ctl.scala 308:27]
  assign io_lsu_stbuf_commit_any = io_stbuf_reqvld_any & _T_276; // @[el2_lsu_dccm_ctl.scala 212:27]
  assign io_lsu_dccm_rden_m = _T_603; // @[el2_lsu_dccm_ctl.scala 312:24]
  assign io_dccm_dma_rvalid = _T & io_lsu_pkt_m_dma; // @[el2_lsu_dccm_ctl.scala 168:28]
  assign io_dccm_dma_ecc_error = io_lsu_double_ecc_error_m; // @[el2_lsu_dccm_ctl.scala 169:28]
  assign io_dccm_dma_rtag = io_dma_mem_tag_m; // @[el2_lsu_dccm_ctl.scala 171:28]
  assign io_dccm_dma_rdata = {_T_7,_T_4}; // @[el2_lsu_dccm_ctl.scala 170:28]
  assign io_dccm_wren = _T_278 | io_ld_single_ecc_error_r_ff; // @[el2_lsu_dccm_ctl.scala 217:22]
  assign io_dccm_rden = lsu_dccm_rden_d & io_addr_in_dccm_d; // @[el2_lsu_dccm_ctl.scala 218:22]
  assign io_dccm_wr_addr_lo = io_ld_single_ecc_error_r_ff ? _T_285 : _T_289; // @[el2_lsu_dccm_ctl.scala 219:22]
  assign io_dccm_wr_data_lo = io_ld_single_ecc_error_r_ff ? _T_311 : _T_319; // @[el2_lsu_dccm_ctl.scala 227:22]
  assign io_dccm_rd_addr_lo = io_lsu_addr_d; // @[el2_lsu_dccm_ctl.scala 225:22]
  assign io_dccm_wr_addr_hi = io_ld_single_ecc_error_r_ff ? _T_295 : _T_299; // @[el2_lsu_dccm_ctl.scala 222:22]
  assign io_dccm_wr_data_hi = io_ld_single_ecc_error_r_ff ? _T_329 : _T_337; // @[el2_lsu_dccm_ctl.scala 233:22]
  assign io_dccm_rd_addr_hi = io_end_addr_d; // @[el2_lsu_dccm_ctl.scala 226:22]
  assign io_picm_wren = _T_579 | io_dma_pic_wen; // @[el2_lsu_dccm_ctl.scala 302:27]
  assign io_picm_rden = _T_581 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 303:27]
  assign io_picm_mken = _T_583 & io_addr_in_pic_d; // @[el2_lsu_dccm_ctl.scala 304:27]
  assign io_picm_rdaddr = 32'hf00c0000 | _GEN_8; // @[el2_lsu_dccm_ctl.scala 306:27]
  assign io_picm_wraddr = 32'hf00c0000 | _GEN_9; // @[el2_lsu_dccm_ctl.scala 307:27]
  assign io_picm_wr_data = io_dma_pic_wen ? io_dma_mem_wdata[31:0] : io_store_datafn_lo_r; // @[el2_lsu_dccm_ctl.scala 309:27]
  assign rvclkhdr_io_clk = io_clk; // @[beh_lib.scala 353:16]
  assign rvclkhdr_io_en = io_ld_single_ecc_error_r; // @[beh_lib.scala 354:15]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[beh_lib.scala 355:22]
  assign rvclkhdr_1_io_clk = io_clk; // @[beh_lib.scala 353:16]
  assign rvclkhdr_1_io_en = io_ld_single_ecc_error_r; // @[beh_lib.scala 354:15]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[beh_lib.scala 355:22]
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
  _T_9 = _RAND_0[63:0];
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
  _T_431 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_472 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  _T_603 = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_9 = 64'h0;
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
    _T_603 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_store_c1_r_clk) begin
    _T_431 <= {_T_429,_T_428};
    _T_472 <= {_T_470,_T_469};
  end
  always @(posedge io_lsu_c2_r_clk or posedge reset) begin
    if (reset) begin
      _T_9 <= 64'h0;
    end else begin
      _T_9 <= _T_8 >> _T_178;
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
      ld_single_ecc_error_hi_r_ff <= _T_245 & _T_246;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      ld_single_ecc_error_lo_r_ff <= 1'h0;
    end else begin
      ld_single_ecc_error_lo_r_ff <= _T_242 & _T_243;
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
      ld_sec_addr_lo_r_ff <= io_lsu_addr_r;
    end
  end
  always @(posedge io_lsu_c2_m_clk or posedge reset) begin
    if (reset) begin
      _T_603 <= 1'h0;
    end else begin
      _T_603 <= _T_260 & io_addr_in_dccm_d;
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
  output        io_stbuf_reqvld_any,
  output        io_stbuf_reqvld_flushed_any,
  output [15:0] io_stbuf_addr_any,
  output [31:0] io_stbuf_data_any,
  output        io_lsu_stbuf_full_any,
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
  wire [7:0] _T_1 = io_lsu_pkt_r_by ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_2 = _T_1 & 8'h1; // @[el2_lsu_stbuf.scala 108:49]
  wire [7:0] _T_4 = io_lsu_pkt_r_half ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_5 = _T_4 & 8'h3; // @[el2_lsu_stbuf.scala 109:32]
  wire [7:0] _T_6 = _T_2 | _T_5; // @[el2_lsu_stbuf.scala 108:65]
  wire [7:0] _T_8 = io_lsu_pkt_r_word ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_9 = _T_8 & 8'hf; // @[el2_lsu_stbuf.scala 110:32]
  wire [7:0] _T_10 = _T_6 | _T_9; // @[el2_lsu_stbuf.scala 109:48]
  wire [7:0] _T_12 = io_lsu_pkt_r_dword ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] ldst_byteen_r = _T_10 | _T_12; // @[el2_lsu_stbuf.scala 110:48]
  wire  ldst_dual_d = io_lsu_addr_d[2] != io_end_addr_d[2]; // @[el2_lsu_stbuf.scala 112:40]
  reg  ldst_dual_r; // @[el2_lsu_stbuf.scala 161:53]
  wire  dual_stbuf_write_r = ldst_dual_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 113:41]
  wire [10:0] _GEN_38 = {{3'd0}, ldst_byteen_r}; // @[el2_lsu_stbuf.scala 115:40]
  wire [10:0] _T_17 = _GEN_38 << io_lsu_addr_r[1:0]; // @[el2_lsu_stbuf.scala 115:40]
  wire [7:0] store_byteen_ext_r = _T_17[7:0]; // @[el2_lsu_stbuf.scala 115:23]
  wire [3:0] _T_20 = io_lsu_pkt_m_store ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] store_byteen_hi_r = store_byteen_ext_r[7:4] & _T_20; // @[el2_lsu_stbuf.scala 116:53]
  wire [3:0] store_byteen_lo_r = store_byteen_ext_r[3:0] & _T_20; // @[el2_lsu_stbuf.scala 117:53]
  reg [1:0] RdPtr; // @[Reg.scala 27:20]
  wire [1:0] NxtRdPtr = RdPtr + 2'h1; // @[el2_lsu_stbuf.scala 118:27]
  reg [1:0] WrPtr; // @[Reg.scala 27:20]
  wire [1:0] WrPtrPlus1 = WrPtr + 2'h1; // @[el2_lsu_stbuf.scala 119:27]
  wire [1:0] WrPtrPlus2 = WrPtr + 2'h2; // @[el2_lsu_stbuf.scala 120:27]
  reg [15:0] stbuf_addr_0; // @[Reg.scala 27:20]
  wire  _T_30 = stbuf_addr_0[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_0; // @[Reg.scala 27:20]
  wire  _T_31 = _T_30 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_0; // @[Reg.scala 27:20]
  wire  _T_32 = ~stbuf_dma_kill_0; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_33 = _T_31 & _T_32; // @[el2_lsu_stbuf.scala 124:196]
  wire  _T_214 = io_lsu_stbuf_commit_any | io_stbuf_reqvld_flushed_any; // @[el2_lsu_stbuf.scala 132:78]
  wire  _T_215 = 2'h3 == RdPtr; // @[el2_lsu_stbuf.scala 132:121]
  wire  _T_217 = _T_214 & _T_215; // @[el2_lsu_stbuf.scala 132:109]
  wire  _T_211 = 2'h2 == RdPtr; // @[el2_lsu_stbuf.scala 132:121]
  wire  _T_213 = _T_214 & _T_211; // @[el2_lsu_stbuf.scala 132:109]
  wire  _T_207 = 2'h1 == RdPtr; // @[el2_lsu_stbuf.scala 132:121]
  wire  _T_209 = _T_214 & _T_207; // @[el2_lsu_stbuf.scala 132:109]
  wire  _T_203 = 2'h0 == RdPtr; // @[el2_lsu_stbuf.scala 132:121]
  wire  _T_205 = _T_214 & _T_203; // @[el2_lsu_stbuf.scala 132:109]
  wire [3:0] stbuf_reset = {_T_217,_T_213,_T_209,_T_205}; // @[Cat.scala 29:58]
  wire  _T_35 = ~stbuf_reset[0]; // @[el2_lsu_stbuf.scala 124:219]
  wire  _T_36 = _T_33 & _T_35; // @[el2_lsu_stbuf.scala 124:217]
  reg [15:0] stbuf_addr_1; // @[Reg.scala 27:20]
  wire  _T_39 = stbuf_addr_1[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_1; // @[Reg.scala 27:20]
  wire  _T_40 = _T_39 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_1; // @[Reg.scala 27:20]
  wire  _T_41 = ~stbuf_dma_kill_1; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_42 = _T_40 & _T_41; // @[el2_lsu_stbuf.scala 124:196]
  wire  _T_44 = ~stbuf_reset[1]; // @[el2_lsu_stbuf.scala 124:219]
  wire  _T_45 = _T_42 & _T_44; // @[el2_lsu_stbuf.scala 124:217]
  reg [15:0] stbuf_addr_2; // @[Reg.scala 27:20]
  wire  _T_48 = stbuf_addr_2[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_2; // @[Reg.scala 27:20]
  wire  _T_49 = _T_48 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_2; // @[Reg.scala 27:20]
  wire  _T_50 = ~stbuf_dma_kill_2; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_51 = _T_49 & _T_50; // @[el2_lsu_stbuf.scala 124:196]
  wire  _T_53 = ~stbuf_reset[2]; // @[el2_lsu_stbuf.scala 124:219]
  wire  _T_54 = _T_51 & _T_53; // @[el2_lsu_stbuf.scala 124:217]
  reg [15:0] stbuf_addr_3; // @[Reg.scala 27:20]
  wire  _T_57 = stbuf_addr_3[15:2] == io_lsu_addr_r[15:2]; // @[el2_lsu_stbuf.scala 124:121]
  reg  stbuf_vld_3; // @[Reg.scala 27:20]
  wire  _T_58 = _T_57 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 124:181]
  reg  stbuf_dma_kill_3; // @[Reg.scala 27:20]
  wire  _T_59 = ~stbuf_dma_kill_3; // @[el2_lsu_stbuf.scala 124:198]
  wire  _T_60 = _T_58 & _T_59; // @[el2_lsu_stbuf.scala 124:196]
  wire  _T_62 = ~stbuf_reset[3]; // @[el2_lsu_stbuf.scala 124:219]
  wire  _T_63 = _T_60 & _T_62; // @[el2_lsu_stbuf.scala 124:217]
  wire [3:0] store_matchvec_lo_r = {_T_63,_T_54,_T_45,_T_36}; // @[Cat.scala 29:58]
  wire  _T_68 = stbuf_addr_0[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_69 = _T_68 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_71 = _T_69 & _T_32; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_72 = _T_71 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_75 = _T_72 & _T_35; // @[el2_lsu_stbuf.scala 125:238]
  wire  _T_78 = stbuf_addr_1[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_79 = _T_78 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_81 = _T_79 & _T_41; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_82 = _T_81 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_85 = _T_82 & _T_44; // @[el2_lsu_stbuf.scala 125:238]
  wire  _T_88 = stbuf_addr_2[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_89 = _T_88 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_91 = _T_89 & _T_50; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_92 = _T_91 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_95 = _T_92 & _T_53; // @[el2_lsu_stbuf.scala 125:238]
  wire  _T_98 = stbuf_addr_3[15:2] == io_end_addr_r[15:2]; // @[el2_lsu_stbuf.scala 125:121]
  wire  _T_99 = _T_98 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 125:181]
  wire  _T_101 = _T_99 & _T_59; // @[el2_lsu_stbuf.scala 125:196]
  wire  _T_102 = _T_101 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 125:217]
  wire  _T_105 = _T_102 & _T_62; // @[el2_lsu_stbuf.scala 125:238]
  wire [3:0] store_matchvec_hi_r = {_T_105,_T_95,_T_85,_T_75}; // @[Cat.scala 29:58]
  wire  store_coalesce_lo_r = |store_matchvec_lo_r; // @[el2_lsu_stbuf.scala 127:50]
  wire  store_coalesce_hi_r = |store_matchvec_hi_r; // @[el2_lsu_stbuf.scala 128:50]
  wire  _T_108 = 2'h0 == WrPtr; // @[el2_lsu_stbuf.scala 130:92]
  wire  _T_110 = ~store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 130:112]
  wire  _T_111 = _T_108 & _T_110; // @[el2_lsu_stbuf.scala 130:110]
  wire  _T_112 = io_ldst_stbuf_reqvld_r & _T_111; // @[el2_lsu_stbuf.scala 130:79]
  wire  _T_115 = ~dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 130:167]
  wire  _T_116 = _T_108 & _T_115; // @[el2_lsu_stbuf.scala 130:165]
  wire  _T_117 = ~store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 130:189]
  wire  _T_118 = _T_116 & _T_117; // @[el2_lsu_stbuf.scala 130:187]
  wire  _T_119 = _T_112 | _T_118; // @[el2_lsu_stbuf.scala 130:134]
  wire  _T_120 = 2'h0 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 131:17]
  wire  _T_122 = _T_120 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:40]
  wire  _T_123 = store_coalesce_lo_r | store_coalesce_hi_r; // @[el2_lsu_stbuf.scala 131:85]
  wire  _T_124 = ~_T_123; // @[el2_lsu_stbuf.scala 131:63]
  wire  _T_125 = _T_122 & _T_124; // @[el2_lsu_stbuf.scala 131:61]
  wire  _T_126 = _T_119 | _T_125; // @[el2_lsu_stbuf.scala 130:211]
  wire  _T_128 = _T_126 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 131:109]
  wire  _T_130 = _T_128 | store_matchvec_hi_r[0]; // @[el2_lsu_stbuf.scala 131:134]
  wire  _T_131 = 2'h1 == WrPtr; // @[el2_lsu_stbuf.scala 130:92]
  wire  _T_134 = _T_131 & _T_110; // @[el2_lsu_stbuf.scala 130:110]
  wire  _T_135 = io_ldst_stbuf_reqvld_r & _T_134; // @[el2_lsu_stbuf.scala 130:79]
  wire  _T_139 = _T_131 & _T_115; // @[el2_lsu_stbuf.scala 130:165]
  wire  _T_141 = _T_139 & _T_117; // @[el2_lsu_stbuf.scala 130:187]
  wire  _T_142 = _T_135 | _T_141; // @[el2_lsu_stbuf.scala 130:134]
  wire  _T_143 = 2'h1 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 131:17]
  wire  _T_145 = _T_143 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:40]
  wire  _T_148 = _T_145 & _T_124; // @[el2_lsu_stbuf.scala 131:61]
  wire  _T_149 = _T_142 | _T_148; // @[el2_lsu_stbuf.scala 130:211]
  wire  _T_151 = _T_149 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 131:109]
  wire  _T_153 = _T_151 | store_matchvec_hi_r[1]; // @[el2_lsu_stbuf.scala 131:134]
  wire  _T_154 = 2'h2 == WrPtr; // @[el2_lsu_stbuf.scala 130:92]
  wire  _T_157 = _T_154 & _T_110; // @[el2_lsu_stbuf.scala 130:110]
  wire  _T_158 = io_ldst_stbuf_reqvld_r & _T_157; // @[el2_lsu_stbuf.scala 130:79]
  wire  _T_162 = _T_154 & _T_115; // @[el2_lsu_stbuf.scala 130:165]
  wire  _T_164 = _T_162 & _T_117; // @[el2_lsu_stbuf.scala 130:187]
  wire  _T_165 = _T_158 | _T_164; // @[el2_lsu_stbuf.scala 130:134]
  wire  _T_166 = 2'h2 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 131:17]
  wire  _T_168 = _T_166 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:40]
  wire  _T_171 = _T_168 & _T_124; // @[el2_lsu_stbuf.scala 131:61]
  wire  _T_172 = _T_165 | _T_171; // @[el2_lsu_stbuf.scala 130:211]
  wire  _T_174 = _T_172 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 131:109]
  wire  _T_176 = _T_174 | store_matchvec_hi_r[2]; // @[el2_lsu_stbuf.scala 131:134]
  wire  _T_177 = 2'h3 == WrPtr; // @[el2_lsu_stbuf.scala 130:92]
  wire  _T_180 = _T_177 & _T_110; // @[el2_lsu_stbuf.scala 130:110]
  wire  _T_181 = io_ldst_stbuf_reqvld_r & _T_180; // @[el2_lsu_stbuf.scala 130:79]
  wire  _T_185 = _T_177 & _T_115; // @[el2_lsu_stbuf.scala 130:165]
  wire  _T_187 = _T_185 & _T_117; // @[el2_lsu_stbuf.scala 130:187]
  wire  _T_188 = _T_181 | _T_187; // @[el2_lsu_stbuf.scala 130:134]
  wire  _T_189 = 2'h3 == WrPtrPlus1; // @[el2_lsu_stbuf.scala 131:17]
  wire  _T_191 = _T_189 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 131:40]
  wire  _T_194 = _T_191 & _T_124; // @[el2_lsu_stbuf.scala 131:61]
  wire  _T_195 = _T_188 | _T_194; // @[el2_lsu_stbuf.scala 130:211]
  wire  _T_197 = _T_195 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 131:109]
  wire  _T_199 = _T_197 | store_matchvec_hi_r[3]; // @[el2_lsu_stbuf.scala 131:134]
  wire [3:0] stbuf_wr_en = {_T_199,_T_176,_T_153,_T_130}; // @[Cat.scala 29:58]
  wire  _T_221 = ~ldst_dual_r; // @[el2_lsu_stbuf.scala 133:52]
  wire  _T_222 = _T_221 | io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 133:65]
  wire  _T_225 = _T_222 & _T_108; // @[el2_lsu_stbuf.scala 133:92]
  wire  _T_227 = _T_225 & _T_110; // @[el2_lsu_stbuf.scala 133:122]
  wire  _T_229 = _T_227 | store_matchvec_lo_r[0]; // @[el2_lsu_stbuf.scala 133:145]
  wire  _T_234 = _T_222 & _T_131; // @[el2_lsu_stbuf.scala 133:92]
  wire  _T_236 = _T_234 & _T_110; // @[el2_lsu_stbuf.scala 133:122]
  wire  _T_238 = _T_236 | store_matchvec_lo_r[1]; // @[el2_lsu_stbuf.scala 133:145]
  wire  _T_243 = _T_222 & _T_154; // @[el2_lsu_stbuf.scala 133:92]
  wire  _T_245 = _T_243 & _T_110; // @[el2_lsu_stbuf.scala 133:122]
  wire  _T_247 = _T_245 | store_matchvec_lo_r[2]; // @[el2_lsu_stbuf.scala 133:145]
  wire  _T_252 = _T_222 & _T_177; // @[el2_lsu_stbuf.scala 133:92]
  wire  _T_254 = _T_252 & _T_110; // @[el2_lsu_stbuf.scala 133:122]
  wire  _T_256 = _T_254 | store_matchvec_lo_r[3]; // @[el2_lsu_stbuf.scala 133:145]
  wire [3:0] sel_lo = {_T_256,_T_247,_T_238,_T_229}; // @[Cat.scala 29:58]
  wire [31:0] _T_260 = sel_lo[0] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_262 = sel_lo[1] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_264 = sel_lo[2] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  wire [31:0] _T_266 = sel_lo[3] ? io_lsu_addr_r : io_end_addr_r; // @[el2_lsu_stbuf.scala 135:57]
  reg [3:0] stbuf_byteen_0; // @[Reg.scala 27:20]
  wire [3:0] _T_268 = stbuf_byteen_0 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_269 = stbuf_byteen_0 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  wire [3:0] stbuf_byteenin_3 = sel_lo[0] ? _T_268 : _T_269; // @[el2_lsu_stbuf.scala 136:59]
  reg [3:0] stbuf_byteen_1; // @[Reg.scala 27:20]
  wire [3:0] _T_272 = stbuf_byteen_1 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_273 = stbuf_byteen_1 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  wire [3:0] stbuf_byteenin_2 = sel_lo[1] ? _T_272 : _T_273; // @[el2_lsu_stbuf.scala 136:59]
  reg [3:0] stbuf_byteen_2; // @[Reg.scala 27:20]
  wire [3:0] _T_276 = stbuf_byteen_2 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_277 = stbuf_byteen_2 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  wire [3:0] stbuf_byteenin_1 = sel_lo[2] ? _T_276 : _T_277; // @[el2_lsu_stbuf.scala 136:59]
  reg [3:0] stbuf_byteen_3; // @[Reg.scala 27:20]
  wire [3:0] _T_280 = stbuf_byteen_3 | store_byteen_lo_r; // @[el2_lsu_stbuf.scala 136:87]
  wire [3:0] _T_281 = stbuf_byteen_3 | store_byteen_hi_r; // @[el2_lsu_stbuf.scala 136:124]
  wire [3:0] stbuf_byteenin_0 = sel_lo[3] ? _T_280 : _T_281; // @[el2_lsu_stbuf.scala 136:59]
  wire  _T_285 = ~stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_287 = _T_285 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_0; // @[Reg.scala 27:20]
  wire [7:0] _T_290 = _T_287 ? io_store_datafn_lo_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_294 = _T_285 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_297 = _T_294 ? io_store_datafn_hi_r[7:0] : stbuf_data_0[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_3 = sel_lo[0] ? _T_290 : _T_297; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_301 = ~stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_303 = _T_301 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_1; // @[Reg.scala 27:20]
  wire [7:0] _T_306 = _T_303 ? io_store_datafn_lo_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_310 = _T_301 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_313 = _T_310 ? io_store_datafn_hi_r[7:0] : stbuf_data_1[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_2 = sel_lo[1] ? _T_306 : _T_313; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_317 = ~stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_319 = _T_317 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_2; // @[Reg.scala 27:20]
  wire [7:0] _T_322 = _T_319 ? io_store_datafn_lo_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_326 = _T_317 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_329 = _T_326 ? io_store_datafn_hi_r[7:0] : stbuf_data_2[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_1 = sel_lo[2] ? _T_322 : _T_329; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_333 = ~stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 138:68]
  wire  _T_335 = _T_333 | store_byteen_lo_r[0]; // @[el2_lsu_stbuf.scala 138:88]
  reg [31:0] stbuf_data_3; // @[Reg.scala 27:20]
  wire [7:0] _T_338 = _T_335 ? io_store_datafn_lo_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 138:67]
  wire  _T_342 = _T_333 | store_byteen_hi_r[0]; // @[el2_lsu_stbuf.scala 139:31]
  wire [7:0] _T_345 = _T_342 ? io_store_datafn_hi_r[7:0] : stbuf_data_3[7:0]; // @[el2_lsu_stbuf.scala 139:10]
  wire [7:0] datain1_0 = sel_lo[3] ? _T_338 : _T_345; // @[el2_lsu_stbuf.scala 138:52]
  wire  _T_349 = ~stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_351 = _T_349 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_354 = _T_351 ? io_store_datafn_lo_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_358 = _T_349 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_361 = _T_358 ? io_store_datafn_hi_r[15:8] : stbuf_data_0[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_3 = sel_lo[0] ? _T_354 : _T_361; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_365 = ~stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_367 = _T_365 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_370 = _T_367 ? io_store_datafn_lo_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_374 = _T_365 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_377 = _T_374 ? io_store_datafn_hi_r[15:8] : stbuf_data_1[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_2 = sel_lo[1] ? _T_370 : _T_377; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_381 = ~stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_383 = _T_381 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_386 = _T_383 ? io_store_datafn_lo_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_390 = _T_381 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_393 = _T_390 ? io_store_datafn_hi_r[15:8] : stbuf_data_2[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_1 = sel_lo[2] ? _T_386 : _T_393; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_397 = ~stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 141:69]
  wire  _T_399 = _T_397 | store_byteen_lo_r[1]; // @[el2_lsu_stbuf.scala 141:89]
  wire [7:0] _T_402 = _T_399 ? io_store_datafn_lo_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 141:68]
  wire  _T_406 = _T_397 | store_byteen_hi_r[1]; // @[el2_lsu_stbuf.scala 142:31]
  wire [7:0] _T_409 = _T_406 ? io_store_datafn_hi_r[15:8] : stbuf_data_3[15:8]; // @[el2_lsu_stbuf.scala 142:10]
  wire [7:0] datain2_0 = sel_lo[3] ? _T_402 : _T_409; // @[el2_lsu_stbuf.scala 141:53]
  wire  _T_413 = ~stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_415 = _T_413 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_418 = _T_415 ? io_store_datafn_lo_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_422 = _T_413 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_425 = _T_422 ? io_store_datafn_hi_r[23:16] : stbuf_data_0[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_3 = sel_lo[0] ? _T_418 : _T_425; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_429 = ~stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_431 = _T_429 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_434 = _T_431 ? io_store_datafn_lo_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_438 = _T_429 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_441 = _T_438 ? io_store_datafn_hi_r[23:16] : stbuf_data_1[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_2 = sel_lo[1] ? _T_434 : _T_441; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_445 = ~stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_447 = _T_445 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_450 = _T_447 ? io_store_datafn_lo_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_454 = _T_445 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_457 = _T_454 ? io_store_datafn_hi_r[23:16] : stbuf_data_2[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_1 = sel_lo[2] ? _T_450 : _T_457; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_461 = ~stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 144:69]
  wire  _T_463 = _T_461 | store_byteen_lo_r[2]; // @[el2_lsu_stbuf.scala 144:89]
  wire [7:0] _T_466 = _T_463 ? io_store_datafn_lo_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 144:68]
  wire  _T_470 = _T_461 | store_byteen_hi_r[2]; // @[el2_lsu_stbuf.scala 145:31]
  wire [7:0] _T_473 = _T_470 ? io_store_datafn_hi_r[23:16] : stbuf_data_3[23:16]; // @[el2_lsu_stbuf.scala 145:10]
  wire [7:0] datain3_0 = sel_lo[3] ? _T_466 : _T_473; // @[el2_lsu_stbuf.scala 144:53]
  wire  _T_477 = ~stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_479 = _T_477 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_482 = _T_479 ? io_store_datafn_lo_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_486 = _T_477 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_489 = _T_486 ? io_store_datafn_hi_r[31:24] : stbuf_data_0[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_3 = sel_lo[0] ? _T_482 : _T_489; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_493 = ~stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_495 = _T_493 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_498 = _T_495 ? io_store_datafn_lo_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_502 = _T_493 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_505 = _T_502 ? io_store_datafn_hi_r[31:24] : stbuf_data_1[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_2 = sel_lo[1] ? _T_498 : _T_505; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_509 = ~stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_511 = _T_509 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_514 = _T_511 ? io_store_datafn_lo_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_518 = _T_509 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_521 = _T_518 ? io_store_datafn_hi_r[31:24] : stbuf_data_2[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_1 = sel_lo[2] ? _T_514 : _T_521; // @[el2_lsu_stbuf.scala 147:53]
  wire  _T_525 = ~stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 147:69]
  wire  _T_527 = _T_525 | store_byteen_lo_r[3]; // @[el2_lsu_stbuf.scala 147:89]
  wire [7:0] _T_530 = _T_527 ? io_store_datafn_lo_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 147:68]
  wire  _T_534 = _T_525 | store_byteen_hi_r[3]; // @[el2_lsu_stbuf.scala 148:31]
  wire [7:0] _T_537 = _T_534 ? io_store_datafn_hi_r[31:24] : stbuf_data_3[31:24]; // @[el2_lsu_stbuf.scala 148:10]
  wire [7:0] datain4_0 = sel_lo[3] ? _T_530 : _T_537; // @[el2_lsu_stbuf.scala 147:53]
  wire [31:0] stbuf_datain_0 = {datain4_0,datain3_0,datain2_0,datain1_0}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_1 = {datain4_1,datain3_1,datain2_1,datain1_1}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_2 = {datain4_2,datain3_2,datain2_2,datain1_2}; // @[Cat.scala 29:58]
  wire [31:0] stbuf_datain_3 = {datain4_3,datain3_3,datain2_3,datain1_3}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_hi_m = {{2'd0}, io_end_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 187:17]
  wire  _T_721 = stbuf_addr_3[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_722 = _T_721 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_724 = _T_722 & _T_59; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_725 = _T_724 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_714 = stbuf_addr_2[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_715 = _T_714 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_717 = _T_715 & _T_50; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_718 = _T_717 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_707 = stbuf_addr_1[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_708 = _T_707 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_710 = _T_708 & _T_41; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_711 = _T_710 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire  _T_700 = stbuf_addr_0[15:2] == cmpaddr_hi_m[15:2]; // @[el2_lsu_stbuf.scala 193:116]
  wire  _T_701 = _T_700 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 193:175]
  wire  _T_703 = _T_701 & _T_32; // @[el2_lsu_stbuf.scala 193:190]
  wire  _T_704 = _T_703 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 193:211]
  wire [3:0] stbuf_match_hi = {_T_725,_T_718,_T_711,_T_704}; // @[Cat.scala 29:58]
  wire [15:0] cmpaddr_lo_m = {{2'd0}, io_lsu_addr_m[15:2]}; // @[el2_lsu_stbuf.scala 190:18]
  wire  _T_751 = stbuf_addr_3[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_752 = _T_751 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_754 = _T_752 & _T_59; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_755 = _T_754 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_744 = stbuf_addr_2[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_745 = _T_744 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_747 = _T_745 & _T_50; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_748 = _T_747 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_737 = stbuf_addr_1[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_738 = _T_737 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_740 = _T_738 & _T_41; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_741 = _T_740 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire  _T_730 = stbuf_addr_0[15:2] == cmpaddr_lo_m[15:2]; // @[el2_lsu_stbuf.scala 194:116]
  wire  _T_731 = _T_730 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 194:175]
  wire  _T_733 = _T_731 & _T_32; // @[el2_lsu_stbuf.scala 194:190]
  wire  _T_734 = _T_733 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 194:211]
  wire [3:0] stbuf_match_lo = {_T_755,_T_748,_T_741,_T_734}; // @[Cat.scala 29:58]
  wire  _T_778 = stbuf_match_hi[3] | stbuf_match_lo[3]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_779 = _T_778 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_780 = _T_779 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_781 = _T_780 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_772 = stbuf_match_hi[2] | stbuf_match_lo[2]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_773 = _T_772 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_774 = _T_773 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_775 = _T_774 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_766 = stbuf_match_hi[1] | stbuf_match_lo[1]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_767 = _T_766 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_768 = _T_767 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_769 = _T_768 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire  _T_760 = stbuf_match_hi[0] | stbuf_match_lo[0]; // @[el2_lsu_stbuf.scala 195:79]
  wire  _T_761 = _T_760 & io_lsu_pkt_m_valid; // @[el2_lsu_stbuf.scala 195:100]
  wire  _T_762 = _T_761 & io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 195:121]
  wire  _T_763 = _T_762 & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 195:140]
  wire [3:0] stbuf_dma_kill_en = {_T_781,_T_775,_T_769,_T_763}; // @[Cat.scala 29:58]
  wire [15:0] stbuf_addrin_0 = _T_266[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire [3:0] _T_567 = _T_35 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_568 = stbuf_byteenin_0 & _T_567; // @[el2_lsu_stbuf.scala 157:87]
  wire [15:0] stbuf_addrin_1 = _T_264[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire [3:0] _T_589 = _T_44 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_590 = stbuf_byteenin_1 & _T_589; // @[el2_lsu_stbuf.scala 157:87]
  wire [15:0] stbuf_addrin_2 = _T_262[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire [3:0] _T_611 = _T_53 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_612 = stbuf_byteenin_2 & _T_611; // @[el2_lsu_stbuf.scala 157:87]
  wire [15:0] stbuf_addrin_3 = _T_260[15:0]; // @[el2_lsu_stbuf.scala 74:39 el2_lsu_stbuf.scala 75:17 el2_lsu_stbuf.scala 135:17]
  wire [3:0] _T_633 = _T_62 ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] _T_634 = stbuf_byteenin_3 & _T_633; // @[el2_lsu_stbuf.scala 157:87]
  reg  ldst_dual_m; // @[el2_lsu_stbuf.scala 160:53]
  wire  _GEN_21 = 2'h1 == RdPtr ? stbuf_vld_1 : stbuf_vld_0; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_22 = 2'h2 == RdPtr ? stbuf_vld_2 : _GEN_21; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_23 = 2'h3 == RdPtr ? stbuf_vld_3 : _GEN_22; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_25 = 2'h1 == RdPtr ? stbuf_dma_kill_1 : stbuf_dma_kill_0; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_26 = 2'h2 == RdPtr ? stbuf_dma_kill_2 : _GEN_25; // @[el2_lsu_stbuf.scala 164:52]
  wire  _GEN_27 = 2'h3 == RdPtr ? stbuf_dma_kill_3 : _GEN_26; // @[el2_lsu_stbuf.scala 164:52]
  wire  _T_642 = ~_GEN_27; // @[el2_lsu_stbuf.scala 165:47]
  wire  _T_643 = _GEN_23 & _T_642; // @[el2_lsu_stbuf.scala 165:45]
  wire  _T_644 = |stbuf_dma_kill_en; // @[el2_lsu_stbuf.scala 165:91]
  wire  _T_645 = ~_T_644; // @[el2_lsu_stbuf.scala 165:72]
  wire [15:0] _GEN_29 = 2'h1 == RdPtr ? stbuf_addr_1 : stbuf_addr_0; // @[el2_lsu_stbuf.scala 166:23]
  wire [15:0] _GEN_30 = 2'h2 == RdPtr ? stbuf_addr_2 : _GEN_29; // @[el2_lsu_stbuf.scala 166:23]
  wire [31:0] _GEN_33 = 2'h1 == RdPtr ? stbuf_data_1 : stbuf_data_0; // @[el2_lsu_stbuf.scala 167:23]
  wire [31:0] _GEN_34 = 2'h2 == RdPtr ? stbuf_data_2 : _GEN_33; // @[el2_lsu_stbuf.scala 167:23]
  wire  _T_648 = io_ldst_stbuf_reqvld_r & _T_115; // @[el2_lsu_stbuf.scala 169:43]
  wire  _T_649 = store_coalesce_hi_r | store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 169:89]
  wire  _T_650 = ~_T_649; // @[el2_lsu_stbuf.scala 169:67]
  wire  _T_651 = _T_648 & _T_650; // @[el2_lsu_stbuf.scala 169:65]
  wire  _T_652 = io_ldst_stbuf_reqvld_r & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 170:31]
  wire  _T_653 = store_coalesce_hi_r & store_coalesce_lo_r; // @[el2_lsu_stbuf.scala 170:77]
  wire  _T_654 = ~_T_653; // @[el2_lsu_stbuf.scala 170:55]
  wire  _T_655 = _T_652 & _T_654; // @[el2_lsu_stbuf.scala 170:53]
  wire  WrPtrEn = _T_651 | _T_655; // @[el2_lsu_stbuf.scala 169:114]
  wire  _T_660 = _T_652 & _T_650; // @[el2_lsu_stbuf.scala 171:68]
  wire [3:0] _T_662 = {3'h0,stbuf_vld_0}; // @[Cat.scala 29:58]
  wire [3:0] _T_663 = {3'h0,stbuf_vld_1}; // @[Cat.scala 29:58]
  wire [3:0] _T_664 = {3'h0,stbuf_vld_2}; // @[Cat.scala 29:58]
  wire [3:0] _T_665 = {3'h0,stbuf_vld_3}; // @[Cat.scala 29:58]
  wire [3:0] _T_668 = _T_662 + _T_663; // @[el2_lsu_stbuf.scala 175:102]
  wire [3:0] _T_670 = _T_668 + _T_664; // @[el2_lsu_stbuf.scala 175:102]
  wire [3:0] stbuf_numvld_any = _T_670 + _T_665; // @[el2_lsu_stbuf.scala 175:102]
  wire  _T_672 = io_lsu_pkt_m_valid & io_lsu_pkt_m_store; // @[el2_lsu_stbuf.scala 176:40]
  wire  _T_673 = _T_672 & io_addr_in_dccm_m; // @[el2_lsu_stbuf.scala 176:61]
  wire  _T_674 = ~io_lsu_pkt_m_dma; // @[el2_lsu_stbuf.scala 176:83]
  wire  isdccmst_m = _T_673 & _T_674; // @[el2_lsu_stbuf.scala 176:81]
  wire  _T_675 = io_lsu_pkt_r_valid & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 177:40]
  wire  _T_676 = _T_675 & io_addr_in_dccm_r; // @[el2_lsu_stbuf.scala 177:61]
  wire  _T_677 = ~io_lsu_pkt_r_dma; // @[el2_lsu_stbuf.scala 177:83]
  wire  isdccmst_r = _T_676 & _T_677; // @[el2_lsu_stbuf.scala 177:81]
  wire [1:0] _T_678 = {1'h0,isdccmst_m}; // @[Cat.scala 29:58]
  wire  _T_679 = isdccmst_m & ldst_dual_m; // @[el2_lsu_stbuf.scala 179:63]
  wire [2:0] _GEN_39 = {{1'd0}, _T_678}; // @[el2_lsu_stbuf.scala 179:48]
  wire [2:0] _T_680 = _GEN_39 << _T_679; // @[el2_lsu_stbuf.scala 179:48]
  wire [1:0] _T_681 = {1'h0,isdccmst_r}; // @[Cat.scala 29:58]
  wire  _T_682 = isdccmst_r & ldst_dual_r; // @[el2_lsu_stbuf.scala 180:63]
  wire [2:0] _GEN_40 = {{1'd0}, _T_681}; // @[el2_lsu_stbuf.scala 180:48]
  wire [2:0] _T_683 = _GEN_40 << _T_682; // @[el2_lsu_stbuf.scala 180:48]
  wire [1:0] stbuf_specvld_m = _T_680[1:0]; // @[el2_lsu_stbuf.scala 179:20]
  wire [3:0] _T_684 = {2'h0,stbuf_specvld_m}; // @[Cat.scala 29:58]
  wire [3:0] _T_686 = stbuf_numvld_any + _T_684; // @[el2_lsu_stbuf.scala 181:45]
  wire [1:0] stbuf_specvld_r = _T_683[1:0]; // @[el2_lsu_stbuf.scala 180:20]
  wire [3:0] _T_687 = {2'h0,stbuf_specvld_r}; // @[Cat.scala 29:58]
  wire [3:0] stbuf_specvld_any = _T_686 + _T_687; // @[el2_lsu_stbuf.scala 181:79]
  wire  _T_689 = ~ldst_dual_d; // @[el2_lsu_stbuf.scala 183:35]
  wire  _T_690 = _T_689 & io_dec_lsu_valid_raw_d; // @[el2_lsu_stbuf.scala 183:48]
  wire  _T_692 = stbuf_specvld_any >= 4'h4; // @[el2_lsu_stbuf.scala 183:99]
  wire  _T_693 = stbuf_specvld_any >= 4'h3; // @[el2_lsu_stbuf.scala 183:138]
  wire  _T_787 = stbuf_match_hi[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_788 = _T_787 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_791 = stbuf_match_hi[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_792 = _T_791 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_795 = stbuf_match_hi[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_796 = _T_795 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_799 = stbuf_match_hi[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_800 = _T_799 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_0 = {_T_800,_T_796,_T_792,_T_788}; // @[Cat.scala 29:58]
  wire  _T_805 = stbuf_match_hi[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_806 = _T_805 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_809 = stbuf_match_hi[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_810 = _T_809 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_813 = stbuf_match_hi[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_814 = _T_813 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_817 = stbuf_match_hi[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_818 = _T_817 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_1 = {_T_818,_T_814,_T_810,_T_806}; // @[Cat.scala 29:58]
  wire  _T_823 = stbuf_match_hi[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_824 = _T_823 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_827 = stbuf_match_hi[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_828 = _T_827 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_831 = stbuf_match_hi[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_832 = _T_831 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_835 = stbuf_match_hi[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_836 = _T_835 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_2 = {_T_836,_T_832,_T_828,_T_824}; // @[Cat.scala 29:58]
  wire  _T_841 = stbuf_match_hi[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_842 = _T_841 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_845 = stbuf_match_hi[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_846 = _T_845 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_849 = stbuf_match_hi[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_850 = _T_849 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire  _T_853 = stbuf_match_hi[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 198:117]
  wire  _T_854 = _T_853 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 198:138]
  wire [3:0] stbuf_fwdbyteenvec_hi_3 = {_T_854,_T_850,_T_846,_T_842}; // @[Cat.scala 29:58]
  wire  _T_859 = stbuf_match_lo[0] & stbuf_byteen_0[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_860 = _T_859 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_863 = stbuf_match_lo[0] & stbuf_byteen_0[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_864 = _T_863 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_867 = stbuf_match_lo[0] & stbuf_byteen_0[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_868 = _T_867 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_871 = stbuf_match_lo[0] & stbuf_byteen_0[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_872 = _T_871 & stbuf_vld_0; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_0 = {_T_872,_T_868,_T_864,_T_860}; // @[Cat.scala 29:58]
  wire  _T_877 = stbuf_match_lo[1] & stbuf_byteen_1[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_878 = _T_877 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_881 = stbuf_match_lo[1] & stbuf_byteen_1[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_882 = _T_881 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_885 = stbuf_match_lo[1] & stbuf_byteen_1[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_886 = _T_885 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_889 = stbuf_match_lo[1] & stbuf_byteen_1[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_890 = _T_889 & stbuf_vld_1; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_1 = {_T_890,_T_886,_T_882,_T_878}; // @[Cat.scala 29:58]
  wire  _T_895 = stbuf_match_lo[2] & stbuf_byteen_2[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_896 = _T_895 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_899 = stbuf_match_lo[2] & stbuf_byteen_2[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_900 = _T_899 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_903 = stbuf_match_lo[2] & stbuf_byteen_2[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_904 = _T_903 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_907 = stbuf_match_lo[2] & stbuf_byteen_2[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_908 = _T_907 & stbuf_vld_2; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_2 = {_T_908,_T_904,_T_900,_T_896}; // @[Cat.scala 29:58]
  wire  _T_913 = stbuf_match_lo[3] & stbuf_byteen_3[0]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_914 = _T_913 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_917 = stbuf_match_lo[3] & stbuf_byteen_3[1]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_918 = _T_917 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_921 = stbuf_match_lo[3] & stbuf_byteen_3[2]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_922 = _T_921 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire  _T_925 = stbuf_match_lo[3] & stbuf_byteen_3[3]; // @[el2_lsu_stbuf.scala 199:117]
  wire  _T_926 = _T_925 & stbuf_vld_3; // @[el2_lsu_stbuf.scala 199:138]
  wire [3:0] stbuf_fwdbyteenvec_lo_3 = {_T_926,_T_922,_T_918,_T_914}; // @[Cat.scala 29:58]
  wire  _T_933 = stbuf_fwdbyteenvec_hi_0[3] | stbuf_fwdbyteenvec_hi_0[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_934 = _T_933 | stbuf_fwdbyteenvec_hi_0[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_0 = _T_934 | stbuf_fwdbyteenvec_hi_0[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_939 = stbuf_fwdbyteenvec_hi_1[3] | stbuf_fwdbyteenvec_hi_1[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_940 = _T_939 | stbuf_fwdbyteenvec_hi_1[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_1 = _T_940 | stbuf_fwdbyteenvec_hi_1[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_945 = stbuf_fwdbyteenvec_hi_2[3] | stbuf_fwdbyteenvec_hi_2[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_946 = _T_945 | stbuf_fwdbyteenvec_hi_2[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_2 = _T_946 | stbuf_fwdbyteenvec_hi_2[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_951 = stbuf_fwdbyteenvec_hi_3[3] | stbuf_fwdbyteenvec_hi_3[2]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_952 = _T_951 | stbuf_fwdbyteenvec_hi_3[1]; // @[el2_lsu_stbuf.scala 200:156]
  wire  stbuf_fwdbyteen_hi_pre_m_3 = _T_952 | stbuf_fwdbyteenvec_hi_3[0]; // @[el2_lsu_stbuf.scala 200:156]
  wire  _T_957 = stbuf_fwdbyteenvec_lo_0[3] | stbuf_fwdbyteenvec_lo_0[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_958 = _T_957 | stbuf_fwdbyteenvec_lo_0[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_0 = _T_958 | stbuf_fwdbyteenvec_lo_0[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_963 = stbuf_fwdbyteenvec_lo_1[3] | stbuf_fwdbyteenvec_lo_1[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_964 = _T_963 | stbuf_fwdbyteenvec_lo_1[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_1 = _T_964 | stbuf_fwdbyteenvec_lo_1[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_969 = stbuf_fwdbyteenvec_lo_2[3] | stbuf_fwdbyteenvec_lo_2[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_970 = _T_969 | stbuf_fwdbyteenvec_lo_2[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_2 = _T_970 | stbuf_fwdbyteenvec_lo_2[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_975 = stbuf_fwdbyteenvec_lo_3[3] | stbuf_fwdbyteenvec_lo_3[2]; // @[el2_lsu_stbuf.scala 201:156]
  wire  _T_976 = _T_975 | stbuf_fwdbyteenvec_lo_3[1]; // @[el2_lsu_stbuf.scala 201:156]
  wire  stbuf_fwdbyteen_lo_pre_m_3 = _T_976 | stbuf_fwdbyteenvec_lo_3[0]; // @[el2_lsu_stbuf.scala 201:156]
  wire [31:0] _T_979 = stbuf_match_hi[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_980 = _T_979 & stbuf_data_0; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_983 = stbuf_match_hi[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_984 = _T_983 & stbuf_data_1; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_987 = stbuf_match_hi[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_988 = _T_987 & stbuf_data_2; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_991 = stbuf_match_hi[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_992 = _T_991 & stbuf_data_3; // @[el2_lsu_stbuf.scala 203:98]
  wire [31:0] _T_994 = _T_980 | _T_984; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] _T_995 = _T_994 | _T_988; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] stbuf_fwddata_hi_pre_m = _T_995 | _T_992; // @[el2_lsu_stbuf.scala 203:123]
  wire [31:0] _T_998 = stbuf_match_lo[0] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_999 = _T_998 & stbuf_data_0; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_1002 = stbuf_match_lo[1] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1003 = _T_1002 & stbuf_data_1; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_1006 = stbuf_match_lo[2] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1007 = _T_1006 & stbuf_data_2; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_1010 = stbuf_match_lo[3] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_1011 = _T_1010 & stbuf_data_3; // @[el2_lsu_stbuf.scala 204:98]
  wire [31:0] _T_1013 = _T_999 | _T_1003; // @[el2_lsu_stbuf.scala 204:123]
  wire [31:0] _T_1014 = _T_1013 | _T_1007; // @[el2_lsu_stbuf.scala 204:123]
  wire [31:0] stbuf_fwddata_lo_pre_m = _T_1014 | _T_1011; // @[el2_lsu_stbuf.scala 204:123]
  wire  _T_1019 = io_lsu_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 210:50]
  wire  _T_1020 = _T_1019 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 210:75]
  wire  _T_1021 = _T_1020 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 210:96]
  wire  ld_addr_rhit_lo_lo = _T_1021 & _T_677; // @[el2_lsu_stbuf.scala 210:117]
  wire  _T_1025 = io_end_addr_m[31:2] == io_lsu_addr_r[31:2]; // @[el2_lsu_stbuf.scala 211:50]
  wire  _T_1026 = _T_1025 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 211:75]
  wire  _T_1027 = _T_1026 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 211:96]
  wire  ld_addr_rhit_lo_hi = _T_1027 & _T_677; // @[el2_lsu_stbuf.scala 211:117]
  wire  _T_1031 = io_lsu_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 212:50]
  wire  _T_1032 = _T_1031 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 212:75]
  wire  _T_1033 = _T_1032 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 212:96]
  wire  _T_1035 = _T_1033 & _T_677; // @[el2_lsu_stbuf.scala 212:117]
  wire  ld_addr_rhit_hi_lo = _T_1035 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 212:137]
  wire  _T_1038 = io_end_addr_m[31:2] == io_end_addr_r[31:2]; // @[el2_lsu_stbuf.scala 213:50]
  wire  _T_1039 = _T_1038 & io_lsu_pkt_r_valid; // @[el2_lsu_stbuf.scala 213:75]
  wire  _T_1040 = _T_1039 & io_lsu_pkt_r_store; // @[el2_lsu_stbuf.scala 213:96]
  wire  _T_1042 = _T_1040 & _T_677; // @[el2_lsu_stbuf.scala 213:117]
  wire  ld_addr_rhit_hi_hi = _T_1042 & dual_stbuf_write_r; // @[el2_lsu_stbuf.scala 213:137]
  wire  _T_1044 = ld_addr_rhit_lo_lo & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1046 = ld_addr_rhit_lo_lo & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1048 = ld_addr_rhit_lo_lo & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 215:80]
  wire  _T_1050 = ld_addr_rhit_lo_lo & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 215:80]
  wire [3:0] _T_1053 = {_T_1050,_T_1048,_T_1046,_T_1044}; // @[Cat.scala 29:58]
  wire  _T_1055 = ld_addr_rhit_lo_hi & store_byteen_ext_r[0]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1057 = ld_addr_rhit_lo_hi & store_byteen_ext_r[1]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1059 = ld_addr_rhit_lo_hi & store_byteen_ext_r[2]; // @[el2_lsu_stbuf.scala 216:80]
  wire  _T_1061 = ld_addr_rhit_lo_hi & store_byteen_ext_r[3]; // @[el2_lsu_stbuf.scala 216:80]
  wire [3:0] _T_1064 = {_T_1061,_T_1059,_T_1057,_T_1055}; // @[Cat.scala 29:58]
  wire  _T_1066 = ld_addr_rhit_hi_lo & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1068 = ld_addr_rhit_hi_lo & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1070 = ld_addr_rhit_hi_lo & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 217:80]
  wire  _T_1072 = ld_addr_rhit_hi_lo & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 217:80]
  wire [3:0] _T_1075 = {_T_1072,_T_1070,_T_1068,_T_1066}; // @[Cat.scala 29:58]
  wire  _T_1077 = ld_addr_rhit_hi_hi & store_byteen_ext_r[4]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1079 = ld_addr_rhit_hi_hi & store_byteen_ext_r[5]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1081 = ld_addr_rhit_hi_hi & store_byteen_ext_r[6]; // @[el2_lsu_stbuf.scala 218:80]
  wire  _T_1083 = ld_addr_rhit_hi_hi & store_byteen_ext_r[7]; // @[el2_lsu_stbuf.scala 218:80]
  wire [3:0] _T_1086 = {_T_1083,_T_1081,_T_1079,_T_1077}; // @[Cat.scala 29:58]
  wire [31:0] ld_byte_rhit_hi_lo = {{28'd0}, _T_1075}; // @[el2_lsu_stbuf.scala 217:23]
  wire [31:0] ld_byte_rhit_lo_lo = {{28'd0}, _T_1053}; // @[el2_lsu_stbuf.scala 215:23]
  wire [31:0] _GEN_42 = {{31'd0}, ld_byte_rhit_hi_lo[0]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1088 = ld_byte_rhit_lo_lo | _GEN_42; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_43 = {{31'd0}, ld_byte_rhit_hi_lo[1]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1090 = ld_byte_rhit_lo_lo | _GEN_43; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_44 = {{31'd0}, ld_byte_rhit_hi_lo[2]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1092 = ld_byte_rhit_lo_lo | _GEN_44; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _GEN_45 = {{31'd0}, ld_byte_rhit_hi_lo[3]}; // @[el2_lsu_stbuf.scala 220:77]
  wire [31:0] _T_1094 = ld_byte_rhit_lo_lo | _GEN_45; // @[el2_lsu_stbuf.scala 220:77]
  wire [127:0] _T_1097 = {_T_1094,_T_1092,_T_1090,_T_1088}; // @[Cat.scala 29:58]
  wire [31:0] ld_byte_rhit_hi_hi = {{28'd0}, _T_1086}; // @[el2_lsu_stbuf.scala 218:23]
  wire [31:0] ld_byte_rhit_lo_hi = {{28'd0}, _T_1064}; // @[el2_lsu_stbuf.scala 216:23]
  wire [31:0] _GEN_46 = {{31'd0}, ld_byte_rhit_hi_hi[0]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1099 = ld_byte_rhit_lo_hi | _GEN_46; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_47 = {{31'd0}, ld_byte_rhit_hi_hi[1]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1101 = ld_byte_rhit_lo_hi | _GEN_47; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_48 = {{31'd0}, ld_byte_rhit_hi_hi[2]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1103 = ld_byte_rhit_lo_hi | _GEN_48; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _GEN_49 = {{31'd0}, ld_byte_rhit_hi_hi[3]}; // @[el2_lsu_stbuf.scala 221:77]
  wire [31:0] _T_1105 = ld_byte_rhit_lo_hi | _GEN_49; // @[el2_lsu_stbuf.scala 221:77]
  wire [127:0] _T_1108 = {_T_1105,_T_1103,_T_1101,_T_1099}; // @[Cat.scala 29:58]
  wire [7:0] _T_1111 = ld_byte_rhit_lo_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1113 = _T_1111 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 223:54]
  wire [7:0] _T_1116 = ld_byte_rhit_hi_lo[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1118 = _T_1116 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 223:115]
  wire [7:0] fwdpipe1_lo = _T_1113 | _T_1118; // @[el2_lsu_stbuf.scala 223:81]
  wire [7:0] _T_1121 = ld_byte_rhit_lo_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1123 = _T_1121 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 224:54]
  wire [7:0] _T_1126 = ld_byte_rhit_hi_lo[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1128 = _T_1126 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 224:116]
  wire [7:0] fwdpipe2_lo = _T_1123 | _T_1128; // @[el2_lsu_stbuf.scala 224:82]
  wire [7:0] _T_1131 = ld_byte_rhit_lo_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1133 = _T_1131 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 225:54]
  wire [7:0] _T_1136 = ld_byte_rhit_hi_lo[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1138 = _T_1136 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 225:117]
  wire [7:0] fwdpipe3_lo = _T_1133 | _T_1138; // @[el2_lsu_stbuf.scala 225:83]
  wire [7:0] _T_1141 = ld_byte_rhit_lo_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1143 = _T_1141 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 226:54]
  wire [7:0] _T_1146 = ld_byte_rhit_hi_lo[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _GEN_50 = {{16'd0}, _T_1146}; // @[el2_lsu_stbuf.scala 226:117]
  wire [23:0] _T_1148 = _GEN_50 & io_store_data_hi_r[31:8]; // @[el2_lsu_stbuf.scala 226:117]
  wire [23:0] _GEN_51 = {{16'd0}, _T_1143}; // @[el2_lsu_stbuf.scala 226:83]
  wire [23:0] fwdpipe4_lo = _GEN_51 | _T_1148; // @[el2_lsu_stbuf.scala 226:83]
  wire [47:0] _T_1151 = {fwdpipe4_lo,fwdpipe3_lo,fwdpipe2_lo,fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [7:0] _T_1154 = ld_byte_rhit_lo_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1156 = _T_1154 & io_store_data_lo_r[7:0]; // @[el2_lsu_stbuf.scala 229:54]
  wire [7:0] _T_1159 = ld_byte_rhit_hi_hi[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1161 = _T_1159 & io_store_data_hi_r[7:0]; // @[el2_lsu_stbuf.scala 229:115]
  wire [7:0] fwdpipe1_hi = _T_1156 | _T_1161; // @[el2_lsu_stbuf.scala 229:81]
  wire [7:0] _T_1164 = ld_byte_rhit_lo_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1166 = _T_1164 & io_store_data_lo_r[15:8]; // @[el2_lsu_stbuf.scala 230:54]
  wire [7:0] _T_1169 = ld_byte_rhit_hi_hi[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1171 = _T_1169 & io_store_data_hi_r[15:8]; // @[el2_lsu_stbuf.scala 230:116]
  wire [7:0] fwdpipe2_hi = _T_1166 | _T_1171; // @[el2_lsu_stbuf.scala 230:82]
  wire [7:0] _T_1174 = ld_byte_rhit_lo_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1176 = _T_1174 & io_store_data_lo_r[23:16]; // @[el2_lsu_stbuf.scala 231:54]
  wire [7:0] _T_1179 = ld_byte_rhit_hi_hi[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1181 = _T_1179 & io_store_data_hi_r[23:16]; // @[el2_lsu_stbuf.scala 231:117]
  wire [7:0] fwdpipe3_hi = _T_1176 | _T_1181; // @[el2_lsu_stbuf.scala 231:83]
  wire [7:0] _T_1184 = ld_byte_rhit_lo_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_1186 = _T_1184 & io_store_data_lo_r[31:24]; // @[el2_lsu_stbuf.scala 232:54]
  wire [7:0] _T_1189 = ld_byte_rhit_hi_hi[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [23:0] _GEN_52 = {{16'd0}, _T_1189}; // @[el2_lsu_stbuf.scala 232:117]
  wire [23:0] _T_1191 = _GEN_52 & io_store_data_hi_r[31:8]; // @[el2_lsu_stbuf.scala 232:117]
  wire [23:0] _GEN_53 = {{16'd0}, _T_1186}; // @[el2_lsu_stbuf.scala 232:83]
  wire [23:0] fwdpipe4_hi = _GEN_53 | _T_1191; // @[el2_lsu_stbuf.scala 232:83]
  wire [47:0] _T_1194 = {fwdpipe4_hi,fwdpipe3_hi,fwdpipe2_hi,fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [2:0] _T_1204 = {stbuf_fwdbyteen_hi_pre_m_3,stbuf_fwdbyteen_hi_pre_m_2,stbuf_fwdbyteen_hi_pre_m_1}; // @[Cat.scala 29:58]
  wire [2:0] _T_1215 = {stbuf_fwdbyteen_lo_pre_m_3,stbuf_fwdbyteen_lo_pre_m_2,stbuf_fwdbyteen_lo_pre_m_1}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_lo = _T_1097[3:0]; // @[el2_lsu_stbuf.scala 220:20]
  wire [31:0] ld_fwddata_rpipe_lo = _T_1151[31:0]; // @[el2_lsu_stbuf.scala 227:24]
  wire [7:0] stbuf_fwdpipe1_lo = ld_byte_rhit_lo[0] ? ld_fwddata_rpipe_lo[7:0] : stbuf_fwddata_lo_pre_m[7:0]; // @[el2_lsu_stbuf.scala 239:31]
  wire [7:0] stbuf_fwdpipe2_lo = ld_byte_rhit_lo[1] ? ld_fwddata_rpipe_lo[15:8] : stbuf_fwddata_lo_pre_m[15:8]; // @[el2_lsu_stbuf.scala 240:31]
  wire [7:0] stbuf_fwdpipe3_lo = ld_byte_rhit_lo[2] ? ld_fwddata_rpipe_lo[23:16] : stbuf_fwddata_lo_pre_m[23:16]; // @[el2_lsu_stbuf.scala 241:31]
  wire [7:0] stbuf_fwdpipe4_lo = ld_byte_rhit_lo[3] ? ld_fwddata_rpipe_lo[31:24] : stbuf_fwddata_lo_pre_m[31:24]; // @[el2_lsu_stbuf.scala 242:31]
  wire [15:0] _T_1229 = {stbuf_fwdpipe2_lo,stbuf_fwdpipe1_lo}; // @[Cat.scala 29:58]
  wire [15:0] _T_1230 = {stbuf_fwdpipe4_lo,stbuf_fwdpipe3_lo}; // @[Cat.scala 29:58]
  wire [3:0] ld_byte_rhit_hi = _T_1108[3:0]; // @[el2_lsu_stbuf.scala 221:20]
  wire [31:0] ld_fwddata_rpipe_hi = _T_1194[31:0]; // @[el2_lsu_stbuf.scala 233:24]
  wire [7:0] stbuf_fwdpipe1_hi = ld_byte_rhit_hi[0] ? ld_fwddata_rpipe_hi[7:0] : stbuf_fwddata_hi_pre_m[7:0]; // @[el2_lsu_stbuf.scala 245:31]
  wire [7:0] stbuf_fwdpipe2_hi = ld_byte_rhit_hi[1] ? ld_fwddata_rpipe_hi[15:8] : stbuf_fwddata_hi_pre_m[15:8]; // @[el2_lsu_stbuf.scala 246:31]
  wire [7:0] stbuf_fwdpipe3_hi = ld_byte_rhit_hi[2] ? ld_fwddata_rpipe_hi[23:16] : stbuf_fwddata_hi_pre_m[23:16]; // @[el2_lsu_stbuf.scala 247:31]
  wire [7:0] stbuf_fwdpipe4_hi = ld_byte_rhit_hi[3] ? ld_fwddata_rpipe_hi[31:24] : stbuf_fwddata_hi_pre_m[31:24]; // @[el2_lsu_stbuf.scala 248:31]
  wire [15:0] _T_1244 = {stbuf_fwdpipe2_hi,stbuf_fwdpipe1_hi}; // @[Cat.scala 29:58]
  wire [15:0] _T_1245 = {stbuf_fwdpipe4_hi,stbuf_fwdpipe3_hi}; // @[Cat.scala 29:58]
  assign io_stbuf_reqvld_any = _T_643 & _T_645; // @[el2_lsu_stbuf.scala 50:47 el2_lsu_stbuf.scala 165:25]
  assign io_stbuf_reqvld_flushed_any = _GEN_23 & _GEN_27; // @[el2_lsu_stbuf.scala 51:36 el2_lsu_stbuf.scala 164:32]
  assign io_stbuf_addr_any = 2'h3 == RdPtr ? stbuf_addr_3 : _GEN_30; // @[el2_lsu_stbuf.scala 52:35 el2_lsu_stbuf.scala 166:23]
  assign io_stbuf_data_any = 2'h3 == RdPtr ? stbuf_data_3 : _GEN_34; // @[el2_lsu_stbuf.scala 53:35 el2_lsu_stbuf.scala 167:23]
  assign io_lsu_stbuf_full_any = _T_690 ? _T_692 : _T_693; // @[el2_lsu_stbuf.scala 54:43 el2_lsu_stbuf.scala 183:27]
  assign io_ldst_stbuf_reqvld_r = io_lsu_commit_r & io_store_stbuf_reqvld_r; // @[el2_lsu_stbuf.scala 56:43 el2_lsu_stbuf.scala 122:27]
  assign io_stbuf_fwddata_hi_m = {_T_1245,_T_1244}; // @[el2_lsu_stbuf.scala 57:43 el2_lsu_stbuf.scala 249:26]
  assign io_stbuf_fwddata_lo_m = {_T_1230,_T_1229}; // @[el2_lsu_stbuf.scala 58:43 el2_lsu_stbuf.scala 243:26]
  assign io_stbuf_fwdbyteen_hi_m = {_T_1204,stbuf_fwdbyteen_hi_pre_m_0}; // @[el2_lsu_stbuf.scala 59:37 el2_lsu_stbuf.scala 235:28]
  assign io_stbuf_fwdbyteen_lo_m = {_T_1215,stbuf_fwdbyteen_lo_pre_m_0}; // @[el2_lsu_stbuf.scala 60:37 el2_lsu_stbuf.scala 236:28]
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
  stbuf_vld_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stbuf_dma_kill_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stbuf_addr_1 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  stbuf_vld_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stbuf_dma_kill_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stbuf_addr_2 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  stbuf_vld_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stbuf_dma_kill_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stbuf_addr_3 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  stbuf_vld_3 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stbuf_dma_kill_3 = _RAND_14[0:0];
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
    stbuf_vld_0 = 1'h0;
  end
  if (reset) begin
    stbuf_dma_kill_0 = 1'h0;
  end
  if (reset) begin
    stbuf_addr_1 = 16'h0;
  end
  if (reset) begin
    stbuf_vld_1 = 1'h0;
  end
  if (reset) begin
    stbuf_dma_kill_1 = 1'h0;
  end
  if (reset) begin
    stbuf_addr_2 = 16'h0;
  end
  if (reset) begin
    stbuf_vld_2 = 1'h0;
  end
  if (reset) begin
    stbuf_dma_kill_2 = 1'h0;
  end
  if (reset) begin
    stbuf_addr_3 = 16'h0;
  end
  if (reset) begin
    stbuf_vld_3 = 1'h0;
  end
  if (reset) begin
    stbuf_dma_kill_3 = 1'h0;
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
    end else if (_T_214) begin
      RdPtr <= NxtRdPtr;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      WrPtr <= 2'h0;
    end else if (WrPtrEn) begin
      if (_T_660) begin
        WrPtr <= WrPtrPlus2;
      end else begin
        WrPtr <= WrPtrPlus1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_addr_0 <= 16'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_addr_0 <= stbuf_addrin_0;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_vld_0 <= 1'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_vld_0 <= _T_35;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_dma_kill_0 <= 1'h0;
    end else if (stbuf_dma_kill_en[0]) begin
      stbuf_dma_kill_0 <= _T_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_addr_1 <= 16'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_addr_1 <= stbuf_addrin_1;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_vld_1 <= 1'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_vld_1 <= _T_44;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_dma_kill_1 <= 1'h0;
    end else if (stbuf_dma_kill_en[1]) begin
      stbuf_dma_kill_1 <= _T_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_addr_2 <= 16'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_addr_2 <= stbuf_addrin_2;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_vld_2 <= 1'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_vld_2 <= _T_53;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_dma_kill_2 <= 1'h0;
    end else if (stbuf_dma_kill_en[2]) begin
      stbuf_dma_kill_2 <= _T_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_addr_3 <= 16'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_addr_3 <= stbuf_addrin_3;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_vld_3 <= 1'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_vld_3 <= _T_62;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      stbuf_dma_kill_3 <= 1'h0;
    end else if (stbuf_dma_kill_en[3]) begin
      stbuf_dma_kill_3 <= _T_62;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_0 <= 4'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_byteen_0 <= _T_568;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_1 <= 4'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_byteen_1 <= _T_590;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_2 <= 4'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_byteen_2 <= _T_612;
    end
  end
  always @(posedge io_lsu_stbuf_c1_clk or posedge reset) begin
    if (reset) begin
      stbuf_byteen_3 <= 4'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_byteen_3 <= _T_634;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_data_0 <= 32'h0;
    end else if (stbuf_wr_en[0]) begin
      stbuf_data_0 <= stbuf_datain_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_data_1 <= 32'h0;
    end else if (stbuf_wr_en[1]) begin
      stbuf_data_1 <= stbuf_datain_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_data_2 <= 32'h0;
    end else if (stbuf_wr_en[2]) begin
      stbuf_data_2 <= stbuf_datain_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      stbuf_data_3 <= 32'h0;
    end else if (stbuf_wr_en[3]) begin
      stbuf_data_3 <= stbuf_datain_3;
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
  input         io_dec_tlu_core_ecc_disable,
  input  [15:0] io_lsu_addr_m,
  input  [15:0] io_end_addr_m,
  input  [31:0] io_dccm_rdata_hi_m,
  input  [31:0] io_dccm_rdata_lo_m,
  input  [6:0]  io_dccm_data_ecc_hi_m,
  input  [6:0]  io_dccm_data_ecc_lo_m,
  input         io_ld_single_ecc_error_r,
  input         io_lsu_dccm_rden_m,
  input         io_addr_in_dccm_m,
  output [31:0] io_sec_data_hi_r,
  output [31:0] io_sec_data_lo_r,
  output [31:0] io_sec_data_hi_m,
  output [31:0] io_sec_data_lo_m,
  output [31:0] io_sec_data_hi_r_ff,
  output [31:0] io_sec_data_lo_r_ff,
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
  wire  _T_96 = ^io_dccm_rdata_hi_m; // @[el2_lib.scala 279:30]
  wire  _T_97 = ^io_dccm_data_ecc_hi_m; // @[el2_lib.scala 279:44]
  wire  _T_98 = _T_96 ^ _T_97; // @[el2_lib.scala 279:35]
  wire [5:0] _T_106 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[26]}; // @[el2_lib.scala 279:76]
  wire  _T_107 = ^_T_106; // @[el2_lib.scala 279:83]
  wire  _T_108 = io_dccm_data_ecc_hi_m[5] ^ _T_107; // @[el2_lib.scala 279:71]
  wire [6:0] _T_115 = {io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[11]}; // @[el2_lib.scala 279:103]
  wire [14:0] _T_123 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_115}; // @[el2_lib.scala 279:103]
  wire  _T_124 = ^_T_123; // @[el2_lib.scala 279:110]
  wire  _T_125 = io_dccm_data_ecc_hi_m[4] ^ _T_124; // @[el2_lib.scala 279:98]
  wire [6:0] _T_132 = {io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[4]}; // @[el2_lib.scala 279:130]
  wire [14:0] _T_140 = {io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[18],_T_132}; // @[el2_lib.scala 279:130]
  wire  _T_141 = ^_T_140; // @[el2_lib.scala 279:137]
  wire  _T_142 = io_dccm_data_ecc_hi_m[3] ^ _T_141; // @[el2_lib.scala 279:125]
  wire [8:0] _T_151 = {io_dccm_rdata_hi_m[15],io_dccm_rdata_hi_m[14],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[7],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[1]}; // @[el2_lib.scala 279:157]
  wire [17:0] _T_160 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[29],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[22],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_151}; // @[el2_lib.scala 279:157]
  wire  _T_161 = ^_T_160; // @[el2_lib.scala 279:164]
  wire  _T_162 = io_dccm_data_ecc_hi_m[2] ^ _T_161; // @[el2_lib.scala 279:152]
  wire [8:0] _T_171 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[12],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[9],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[5],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[2],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 279:184]
  wire [17:0] _T_180 = {io_dccm_rdata_hi_m[31],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[27],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[24],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[20],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[16],_T_171}; // @[el2_lib.scala 279:184]
  wire  _T_181 = ^_T_180; // @[el2_lib.scala 279:191]
  wire  _T_182 = io_dccm_data_ecc_hi_m[1] ^ _T_181; // @[el2_lib.scala 279:179]
  wire [8:0] _T_191 = {io_dccm_rdata_hi_m[13],io_dccm_rdata_hi_m[11],io_dccm_rdata_hi_m[10],io_dccm_rdata_hi_m[8],io_dccm_rdata_hi_m[6],io_dccm_rdata_hi_m[4],io_dccm_rdata_hi_m[3],io_dccm_rdata_hi_m[1],io_dccm_rdata_hi_m[0]}; // @[el2_lib.scala 279:211]
  wire [17:0] _T_200 = {io_dccm_rdata_hi_m[30],io_dccm_rdata_hi_m[28],io_dccm_rdata_hi_m[26],io_dccm_rdata_hi_m[25],io_dccm_rdata_hi_m[23],io_dccm_rdata_hi_m[21],io_dccm_rdata_hi_m[19],io_dccm_rdata_hi_m[17],io_dccm_rdata_hi_m[15],_T_191}; // @[el2_lib.scala 279:211]
  wire  _T_201 = ^_T_200; // @[el2_lib.scala 279:218]
  wire  _T_202 = io_dccm_data_ecc_hi_m[0] ^ _T_201; // @[el2_lib.scala 279:206]
  wire [6:0] _T_208 = {_T_98,_T_108,_T_125,_T_142,_T_162,_T_182,_T_202}; // @[Cat.scala 29:58]
  wire  _T_209 = _T_208 != 7'h0; // @[el2_lib.scala 281:44]
  wire  _T_1169 = ~io_dec_tlu_core_ecc_disable; // @[el2_lsu_ecc.scala 105:70]
  wire  _T_1176 = io_lsu_pkt_m_load | io_lsu_pkt_m_store; // @[el2_lsu_ecc.scala 123:60]
  wire  _T_1177 = io_lsu_pkt_m_valid & _T_1176; // @[el2_lsu_ecc.scala 123:39]
  wire  _T_1178 = _T_1177 & io_addr_in_dccm_m; // @[el2_lsu_ecc.scala 123:82]
  wire  is_ldst_m = _T_1178 & io_lsu_dccm_rden_m; // @[el2_lsu_ecc.scala 123:102]
  wire  ldst_dual_m = io_lsu_addr_m[2] != io_end_addr_m[2]; // @[el2_lsu_ecc.scala 122:39]
  wire  _T_1182 = ldst_dual_m | io_lsu_pkt_m_dma; // @[el2_lsu_ecc.scala 125:48]
  wire  _T_1183 = is_ldst_m & _T_1182; // @[el2_lsu_ecc.scala 125:33]
  wire  is_ldst_hi_m = _T_1183 & _T_1169; // @[el2_lsu_ecc.scala 125:68]
  wire  _T_210 = is_ldst_hi_m & _T_209; // @[el2_lib.scala 281:32]
  wire  single_ecc_error_hi_any = _T_210 & _T_98; // @[el2_lib.scala 281:52]
  wire  _T_225 = _T_208[5:0] == 6'h1; // @[el2_lib.scala 286:41]
  wire  _T_227 = _T_208[5:0] == 6'h2; // @[el2_lib.scala 286:41]
  wire  _T_229 = _T_208[5:0] == 6'h3; // @[el2_lib.scala 286:41]
  wire  _T_231 = _T_208[5:0] == 6'h4; // @[el2_lib.scala 286:41]
  wire  _T_233 = _T_208[5:0] == 6'h5; // @[el2_lib.scala 286:41]
  wire  _T_235 = _T_208[5:0] == 6'h6; // @[el2_lib.scala 286:41]
  wire  _T_237 = _T_208[5:0] == 6'h7; // @[el2_lib.scala 286:41]
  wire  _T_239 = _T_208[5:0] == 6'h8; // @[el2_lib.scala 286:41]
  wire  _T_241 = _T_208[5:0] == 6'h9; // @[el2_lib.scala 286:41]
  wire  _T_243 = _T_208[5:0] == 6'ha; // @[el2_lib.scala 286:41]
  wire  _T_245 = _T_208[5:0] == 6'hb; // @[el2_lib.scala 286:41]
  wire  _T_247 = _T_208[5:0] == 6'hc; // @[el2_lib.scala 286:41]
  wire  _T_249 = _T_208[5:0] == 6'hd; // @[el2_lib.scala 286:41]
  wire  _T_251 = _T_208[5:0] == 6'he; // @[el2_lib.scala 286:41]
  wire  _T_253 = _T_208[5:0] == 6'hf; // @[el2_lib.scala 286:41]
  wire  _T_255 = _T_208[5:0] == 6'h10; // @[el2_lib.scala 286:41]
  wire  _T_257 = _T_208[5:0] == 6'h11; // @[el2_lib.scala 286:41]
  wire  _T_259 = _T_208[5:0] == 6'h12; // @[el2_lib.scala 286:41]
  wire  _T_261 = _T_208[5:0] == 6'h13; // @[el2_lib.scala 286:41]
  wire  _T_263 = _T_208[5:0] == 6'h14; // @[el2_lib.scala 286:41]
  wire  _T_265 = _T_208[5:0] == 6'h15; // @[el2_lib.scala 286:41]
  wire  _T_267 = _T_208[5:0] == 6'h16; // @[el2_lib.scala 286:41]
  wire  _T_269 = _T_208[5:0] == 6'h17; // @[el2_lib.scala 286:41]
  wire  _T_271 = _T_208[5:0] == 6'h18; // @[el2_lib.scala 286:41]
  wire  _T_273 = _T_208[5:0] == 6'h19; // @[el2_lib.scala 286:41]
  wire  _T_275 = _T_208[5:0] == 6'h1a; // @[el2_lib.scala 286:41]
  wire  _T_277 = _T_208[5:0] == 6'h1b; // @[el2_lib.scala 286:41]
  wire  _T_279 = _T_208[5:0] == 6'h1c; // @[el2_lib.scala 286:41]
  wire  _T_281 = _T_208[5:0] == 6'h1d; // @[el2_lib.scala 286:41]
  wire  _T_283 = _T_208[5:0] == 6'h1e; // @[el2_lib.scala 286:41]
  wire  _T_285 = _T_208[5:0] == 6'h1f; // @[el2_lib.scala 286:41]
  wire  _T_287 = _T_208[5:0] == 6'h20; // @[el2_lib.scala 286:41]
  wire  _T_289 = _T_208[5:0] == 6'h21; // @[el2_lib.scala 286:41]
  wire  _T_291 = _T_208[5:0] == 6'h22; // @[el2_lib.scala 286:41]
  wire  _T_293 = _T_208[5:0] == 6'h23; // @[el2_lib.scala 286:41]
  wire  _T_295 = _T_208[5:0] == 6'h24; // @[el2_lib.scala 286:41]
  wire  _T_297 = _T_208[5:0] == 6'h25; // @[el2_lib.scala 286:41]
  wire  _T_299 = _T_208[5:0] == 6'h26; // @[el2_lib.scala 286:41]
  wire  _T_301 = _T_208[5:0] == 6'h27; // @[el2_lib.scala 286:41]
  wire [7:0] _T_316 = {io_dccm_data_ecc_hi_m[3],io_dccm_rdata_hi_m[3:1],io_dccm_data_ecc_hi_m[2],io_dccm_rdata_hi_m[0],io_dccm_data_ecc_hi_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_322 = {io_dccm_data_ecc_hi_m[6],io_dccm_rdata_hi_m[31:26],io_dccm_data_ecc_hi_m[5],io_dccm_rdata_hi_m[25:11],io_dccm_data_ecc_hi_m[4],io_dccm_rdata_hi_m[10:4],_T_316}; // @[Cat.scala 29:58]
  wire [9:0] _T_340 = {_T_261,_T_259,_T_257,_T_255,_T_253,_T_251,_T_249,_T_247,_T_245,_T_243}; // @[el2_lib.scala 289:69]
  wire [18:0] _T_341 = {_T_340,_T_241,_T_239,_T_237,_T_235,_T_233,_T_231,_T_229,_T_227,_T_225}; // @[el2_lib.scala 289:69]
  wire [9:0] _T_350 = {_T_281,_T_279,_T_277,_T_275,_T_273,_T_271,_T_269,_T_267,_T_265,_T_263}; // @[el2_lib.scala 289:69]
  wire [9:0] _T_359 = {_T_301,_T_299,_T_297,_T_295,_T_293,_T_291,_T_289,_T_287,_T_285,_T_283}; // @[el2_lib.scala 289:69]
  wire [38:0] _T_361 = {_T_359,_T_350,_T_341}; // @[el2_lib.scala 289:69]
  wire [38:0] _T_362 = _T_361 ^ _T_322; // @[el2_lib.scala 289:76]
  wire [38:0] _T_363 = single_ecc_error_hi_any ? _T_362 : _T_322; // @[el2_lib.scala 289:31]
  wire [3:0] _T_369 = {_T_363[6:4],_T_363[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_371 = {_T_363[37:32],_T_363[30:16],_T_363[14:8]}; // @[Cat.scala 29:58]
  wire  _T_481 = ^io_dccm_rdata_lo_m; // @[el2_lib.scala 279:30]
  wire  _T_482 = ^io_dccm_data_ecc_lo_m; // @[el2_lib.scala 279:44]
  wire  _T_483 = _T_481 ^ _T_482; // @[el2_lib.scala 279:35]
  wire [5:0] _T_491 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[26]}; // @[el2_lib.scala 279:76]
  wire  _T_492 = ^_T_491; // @[el2_lib.scala 279:83]
  wire  _T_493 = io_dccm_data_ecc_lo_m[5] ^ _T_492; // @[el2_lib.scala 279:71]
  wire [6:0] _T_500 = {io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[11]}; // @[el2_lib.scala 279:103]
  wire [14:0] _T_508 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_500}; // @[el2_lib.scala 279:103]
  wire  _T_509 = ^_T_508; // @[el2_lib.scala 279:110]
  wire  _T_510 = io_dccm_data_ecc_lo_m[4] ^ _T_509; // @[el2_lib.scala 279:98]
  wire [6:0] _T_517 = {io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[4]}; // @[el2_lib.scala 279:130]
  wire [14:0] _T_525 = {io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[18],_T_517}; // @[el2_lib.scala 279:130]
  wire  _T_526 = ^_T_525; // @[el2_lib.scala 279:137]
  wire  _T_527 = io_dccm_data_ecc_lo_m[3] ^ _T_526; // @[el2_lib.scala 279:125]
  wire [8:0] _T_536 = {io_dccm_rdata_lo_m[15],io_dccm_rdata_lo_m[14],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[7],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[1]}; // @[el2_lib.scala 279:157]
  wire [17:0] _T_545 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[29],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[22],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_536}; // @[el2_lib.scala 279:157]
  wire  _T_546 = ^_T_545; // @[el2_lib.scala 279:164]
  wire  _T_547 = io_dccm_data_ecc_lo_m[2] ^ _T_546; // @[el2_lib.scala 279:152]
  wire [8:0] _T_556 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[12],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[9],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[5],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[2],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 279:184]
  wire [17:0] _T_565 = {io_dccm_rdata_lo_m[31],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[27],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[24],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[20],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[16],_T_556}; // @[el2_lib.scala 279:184]
  wire  _T_566 = ^_T_565; // @[el2_lib.scala 279:191]
  wire  _T_567 = io_dccm_data_ecc_lo_m[1] ^ _T_566; // @[el2_lib.scala 279:179]
  wire [8:0] _T_576 = {io_dccm_rdata_lo_m[13],io_dccm_rdata_lo_m[11],io_dccm_rdata_lo_m[10],io_dccm_rdata_lo_m[8],io_dccm_rdata_lo_m[6],io_dccm_rdata_lo_m[4],io_dccm_rdata_lo_m[3],io_dccm_rdata_lo_m[1],io_dccm_rdata_lo_m[0]}; // @[el2_lib.scala 279:211]
  wire [17:0] _T_585 = {io_dccm_rdata_lo_m[30],io_dccm_rdata_lo_m[28],io_dccm_rdata_lo_m[26],io_dccm_rdata_lo_m[25],io_dccm_rdata_lo_m[23],io_dccm_rdata_lo_m[21],io_dccm_rdata_lo_m[19],io_dccm_rdata_lo_m[17],io_dccm_rdata_lo_m[15],_T_576}; // @[el2_lib.scala 279:211]
  wire  _T_586 = ^_T_585; // @[el2_lib.scala 279:218]
  wire  _T_587 = io_dccm_data_ecc_lo_m[0] ^ _T_586; // @[el2_lib.scala 279:206]
  wire [6:0] _T_593 = {_T_483,_T_493,_T_510,_T_527,_T_547,_T_567,_T_587}; // @[Cat.scala 29:58]
  wire  _T_594 = _T_593 != 7'h0; // @[el2_lib.scala 281:44]
  wire  is_ldst_lo_m = is_ldst_m & _T_1169; // @[el2_lsu_ecc.scala 124:33]
  wire  _T_595 = is_ldst_lo_m & _T_594; // @[el2_lib.scala 281:32]
  wire  single_ecc_error_lo_any = _T_595 & _T_483; // @[el2_lib.scala 281:52]
  wire  _T_610 = _T_593[5:0] == 6'h1; // @[el2_lib.scala 286:41]
  wire  _T_612 = _T_593[5:0] == 6'h2; // @[el2_lib.scala 286:41]
  wire  _T_614 = _T_593[5:0] == 6'h3; // @[el2_lib.scala 286:41]
  wire  _T_616 = _T_593[5:0] == 6'h4; // @[el2_lib.scala 286:41]
  wire  _T_618 = _T_593[5:0] == 6'h5; // @[el2_lib.scala 286:41]
  wire  _T_620 = _T_593[5:0] == 6'h6; // @[el2_lib.scala 286:41]
  wire  _T_622 = _T_593[5:0] == 6'h7; // @[el2_lib.scala 286:41]
  wire  _T_624 = _T_593[5:0] == 6'h8; // @[el2_lib.scala 286:41]
  wire  _T_626 = _T_593[5:0] == 6'h9; // @[el2_lib.scala 286:41]
  wire  _T_628 = _T_593[5:0] == 6'ha; // @[el2_lib.scala 286:41]
  wire  _T_630 = _T_593[5:0] == 6'hb; // @[el2_lib.scala 286:41]
  wire  _T_632 = _T_593[5:0] == 6'hc; // @[el2_lib.scala 286:41]
  wire  _T_634 = _T_593[5:0] == 6'hd; // @[el2_lib.scala 286:41]
  wire  _T_636 = _T_593[5:0] == 6'he; // @[el2_lib.scala 286:41]
  wire  _T_638 = _T_593[5:0] == 6'hf; // @[el2_lib.scala 286:41]
  wire  _T_640 = _T_593[5:0] == 6'h10; // @[el2_lib.scala 286:41]
  wire  _T_642 = _T_593[5:0] == 6'h11; // @[el2_lib.scala 286:41]
  wire  _T_644 = _T_593[5:0] == 6'h12; // @[el2_lib.scala 286:41]
  wire  _T_646 = _T_593[5:0] == 6'h13; // @[el2_lib.scala 286:41]
  wire  _T_648 = _T_593[5:0] == 6'h14; // @[el2_lib.scala 286:41]
  wire  _T_650 = _T_593[5:0] == 6'h15; // @[el2_lib.scala 286:41]
  wire  _T_652 = _T_593[5:0] == 6'h16; // @[el2_lib.scala 286:41]
  wire  _T_654 = _T_593[5:0] == 6'h17; // @[el2_lib.scala 286:41]
  wire  _T_656 = _T_593[5:0] == 6'h18; // @[el2_lib.scala 286:41]
  wire  _T_658 = _T_593[5:0] == 6'h19; // @[el2_lib.scala 286:41]
  wire  _T_660 = _T_593[5:0] == 6'h1a; // @[el2_lib.scala 286:41]
  wire  _T_662 = _T_593[5:0] == 6'h1b; // @[el2_lib.scala 286:41]
  wire  _T_664 = _T_593[5:0] == 6'h1c; // @[el2_lib.scala 286:41]
  wire  _T_666 = _T_593[5:0] == 6'h1d; // @[el2_lib.scala 286:41]
  wire  _T_668 = _T_593[5:0] == 6'h1e; // @[el2_lib.scala 286:41]
  wire  _T_670 = _T_593[5:0] == 6'h1f; // @[el2_lib.scala 286:41]
  wire  _T_672 = _T_593[5:0] == 6'h20; // @[el2_lib.scala 286:41]
  wire  _T_674 = _T_593[5:0] == 6'h21; // @[el2_lib.scala 286:41]
  wire  _T_676 = _T_593[5:0] == 6'h22; // @[el2_lib.scala 286:41]
  wire  _T_678 = _T_593[5:0] == 6'h23; // @[el2_lib.scala 286:41]
  wire  _T_680 = _T_593[5:0] == 6'h24; // @[el2_lib.scala 286:41]
  wire  _T_682 = _T_593[5:0] == 6'h25; // @[el2_lib.scala 286:41]
  wire  _T_684 = _T_593[5:0] == 6'h26; // @[el2_lib.scala 286:41]
  wire  _T_686 = _T_593[5:0] == 6'h27; // @[el2_lib.scala 286:41]
  wire [7:0] _T_701 = {io_dccm_data_ecc_lo_m[3],io_dccm_rdata_lo_m[3:1],io_dccm_data_ecc_lo_m[2],io_dccm_rdata_lo_m[0],io_dccm_data_ecc_lo_m[1:0]}; // @[Cat.scala 29:58]
  wire [38:0] _T_707 = {io_dccm_data_ecc_lo_m[6],io_dccm_rdata_lo_m[31:26],io_dccm_data_ecc_lo_m[5],io_dccm_rdata_lo_m[25:11],io_dccm_data_ecc_lo_m[4],io_dccm_rdata_lo_m[10:4],_T_701}; // @[Cat.scala 29:58]
  wire [9:0] _T_725 = {_T_646,_T_644,_T_642,_T_640,_T_638,_T_636,_T_634,_T_632,_T_630,_T_628}; // @[el2_lib.scala 289:69]
  wire [18:0] _T_726 = {_T_725,_T_626,_T_624,_T_622,_T_620,_T_618,_T_616,_T_614,_T_612,_T_610}; // @[el2_lib.scala 289:69]
  wire [9:0] _T_735 = {_T_666,_T_664,_T_662,_T_660,_T_658,_T_656,_T_654,_T_652,_T_650,_T_648}; // @[el2_lib.scala 289:69]
  wire [9:0] _T_744 = {_T_686,_T_684,_T_682,_T_680,_T_678,_T_676,_T_674,_T_672,_T_670,_T_668}; // @[el2_lib.scala 289:69]
  wire [38:0] _T_746 = {_T_744,_T_735,_T_726}; // @[el2_lib.scala 289:69]
  wire [38:0] _T_747 = _T_746 ^ _T_707; // @[el2_lib.scala 289:76]
  wire [38:0] _T_748 = single_ecc_error_lo_any ? _T_747 : _T_707; // @[el2_lib.scala 289:31]
  wire [3:0] _T_754 = {_T_748[6:4],_T_748[2]}; // @[Cat.scala 29:58]
  wire [27:0] _T_756 = {_T_748[37:32],_T_748[30:16],_T_748[14:8]}; // @[Cat.scala 29:58]
  reg  _T_1188; // @[el2_lsu_ecc.scala 139:72]
  reg  _T_1189; // @[el2_lsu_ecc.scala 140:72]
  reg  _T_1190; // @[el2_lsu_ecc.scala 141:72]
  reg  _T_1191; // @[el2_lsu_ecc.scala 142:72]
  reg [31:0] _T_1192; // @[el2_lsu_ecc.scala 143:72]
  reg [31:0] _T_1193; // @[el2_lsu_ecc.scala 144:72]
  reg [31:0] _T_1202; // @[Reg.scala 27:20]
  reg [31:0] _T_1203; // @[Reg.scala 27:20]
  assign io_sec_data_hi_r = _T_1192; // @[el2_lsu_ecc.scala 112:24 el2_lsu_ecc.scala 143:62]
  assign io_sec_data_lo_r = _T_1193; // @[el2_lsu_ecc.scala 115:27 el2_lsu_ecc.scala 144:62]
  assign io_sec_data_hi_m = {_T_371,_T_369}; // @[el2_lsu_ecc.scala 88:32 el2_lsu_ecc.scala 132:27]
  assign io_sec_data_lo_m = {_T_756,_T_754}; // @[el2_lsu_ecc.scala 89:32 el2_lsu_ecc.scala 134:27]
  assign io_sec_data_hi_r_ff = _T_1202; // @[el2_lsu_ecc.scala 155:23]
  assign io_sec_data_lo_r_ff = _T_1203; // @[el2_lsu_ecc.scala 156:23]
  assign io_single_ecc_error_hi_r = _T_1191; // @[el2_lsu_ecc.scala 113:33 el2_lsu_ecc.scala 142:62]
  assign io_single_ecc_error_lo_r = _T_1190; // @[el2_lsu_ecc.scala 116:33 el2_lsu_ecc.scala 141:62]
  assign io_lsu_single_ecc_error_r = _T_1188; // @[el2_lsu_ecc.scala 118:33 el2_lsu_ecc.scala 139:62]
  assign io_lsu_double_ecc_error_r = _T_1189; // @[el2_lsu_ecc.scala 119:33 el2_lsu_ecc.scala 140:62]
  assign io_lsu_single_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[el2_lsu_ecc.scala 90:30 el2_lsu_ecc.scala 136:33]
  assign io_lsu_double_ecc_error_m = single_ecc_error_hi_any | single_ecc_error_lo_any; // @[el2_lsu_ecc.scala 91:30 el2_lsu_ecc.scala 137:33]
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
  _T_1188 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_1189 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1190 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  _T_1191 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_1192 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  _T_1193 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  _T_1202 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  _T_1203 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T_1202 = 32'h0;
  end
  if (reset) begin
    _T_1203 = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_c2_r_clk) begin
    _T_1188 <= io_lsu_single_ecc_error_m;
    _T_1189 <= io_lsu_double_ecc_error_m;
    _T_1190 <= _T_595 & _T_483;
    _T_1191 <= _T_210 & _T_98;
    _T_1192 <= io_sec_data_hi_m;
    _T_1193 <= io_sec_data_lo_m;
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1202 <= 32'h0;
    end else if (io_ld_single_ecc_error_r) begin
      _T_1202 <= io_sec_data_hi_r;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_1203 <= 32'h0;
    end else if (io_ld_single_ecc_error_r) begin
      _T_1203 <= io_sec_data_lo_r;
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
  wire [15:0] _T_3 = _T_1 & io_store_data_m[31:16]; // @[el2_lsu_trigger.scala 17:60]
  wire  _T_4 = io_lsu_pkt_m_half | io_lsu_pkt_m_word; // @[el2_lsu_trigger.scala 17:110]
  wire [7:0] _T_6 = _T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _T_8 = _T_6 & io_store_data_m[15:8]; // @[el2_lsu_trigger.scala 17:131]
  wire [31:0] store_data_trigger_m = {_T_3,_T_8,io_store_data_m[7:0]}; // @[Cat.scala 29:58]
  wire  _T_12 = ~io_trigger_pkt_any_0_select; // @[el2_lsu_trigger.scala 24:107]
  wire  _T_13 = io_trigger_pkt_any_0_select & io_trigger_pkt_any_0_store; // @[el2_lsu_trigger.scala 25:35]
  wire [31:0] _T_15 = _T_12 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_16 = _T_13 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_17 = _T_15 | _T_16; // @[Mux.scala 27:72]
  wire  _T_23 = &io_trigger_pkt_any_0_tdata2; // @[el2_lib.scala 194:73]
  wire  _T_24 = ~_T_23; // @[el2_lib.scala 194:47]
  wire  _T_25 = io_trigger_pkt_any_0_match_ & _T_24; // @[el2_lib.scala 194:44]
  wire  _T_28 = io_trigger_pkt_any_0_tdata2[0] == _T_17[0]; // @[el2_lib.scala 195:52]
  wire  _T_29 = _T_25 | _T_28; // @[el2_lib.scala 195:41]
  wire  _T_31 = &io_trigger_pkt_any_0_tdata2[0]; // @[el2_lib.scala 197:37]
  wire  _T_32 = _T_31 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_35 = io_trigger_pkt_any_0_tdata2[1] == _T_17[1]; // @[el2_lib.scala 197:79]
  wire  _T_36 = _T_32 | _T_35; // @[el2_lib.scala 197:24]
  wire  _T_38 = &io_trigger_pkt_any_0_tdata2[1:0]; // @[el2_lib.scala 197:37]
  wire  _T_39 = _T_38 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_42 = io_trigger_pkt_any_0_tdata2[2] == _T_17[2]; // @[el2_lib.scala 197:79]
  wire  _T_43 = _T_39 | _T_42; // @[el2_lib.scala 197:24]
  wire  _T_45 = &io_trigger_pkt_any_0_tdata2[2:0]; // @[el2_lib.scala 197:37]
  wire  _T_46 = _T_45 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_49 = io_trigger_pkt_any_0_tdata2[3] == _T_17[3]; // @[el2_lib.scala 197:79]
  wire  _T_50 = _T_46 | _T_49; // @[el2_lib.scala 197:24]
  wire  _T_52 = &io_trigger_pkt_any_0_tdata2[3:0]; // @[el2_lib.scala 197:37]
  wire  _T_53 = _T_52 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_56 = io_trigger_pkt_any_0_tdata2[4] == _T_17[4]; // @[el2_lib.scala 197:79]
  wire  _T_57 = _T_53 | _T_56; // @[el2_lib.scala 197:24]
  wire  _T_59 = &io_trigger_pkt_any_0_tdata2[4:0]; // @[el2_lib.scala 197:37]
  wire  _T_60 = _T_59 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_63 = io_trigger_pkt_any_0_tdata2[5] == _T_17[5]; // @[el2_lib.scala 197:79]
  wire  _T_64 = _T_60 | _T_63; // @[el2_lib.scala 197:24]
  wire  _T_66 = &io_trigger_pkt_any_0_tdata2[5:0]; // @[el2_lib.scala 197:37]
  wire  _T_67 = _T_66 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_70 = io_trigger_pkt_any_0_tdata2[6] == _T_17[6]; // @[el2_lib.scala 197:79]
  wire  _T_71 = _T_67 | _T_70; // @[el2_lib.scala 197:24]
  wire  _T_73 = &io_trigger_pkt_any_0_tdata2[6:0]; // @[el2_lib.scala 197:37]
  wire  _T_74 = _T_73 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_77 = io_trigger_pkt_any_0_tdata2[7] == _T_17[7]; // @[el2_lib.scala 197:79]
  wire  _T_78 = _T_74 | _T_77; // @[el2_lib.scala 197:24]
  wire  _T_80 = &io_trigger_pkt_any_0_tdata2[7:0]; // @[el2_lib.scala 197:37]
  wire  _T_81 = _T_80 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_84 = io_trigger_pkt_any_0_tdata2[8] == _T_17[8]; // @[el2_lib.scala 197:79]
  wire  _T_85 = _T_81 | _T_84; // @[el2_lib.scala 197:24]
  wire  _T_87 = &io_trigger_pkt_any_0_tdata2[8:0]; // @[el2_lib.scala 197:37]
  wire  _T_88 = _T_87 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_91 = io_trigger_pkt_any_0_tdata2[9] == _T_17[9]; // @[el2_lib.scala 197:79]
  wire  _T_92 = _T_88 | _T_91; // @[el2_lib.scala 197:24]
  wire  _T_94 = &io_trigger_pkt_any_0_tdata2[9:0]; // @[el2_lib.scala 197:37]
  wire  _T_95 = _T_94 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_98 = io_trigger_pkt_any_0_tdata2[10] == _T_17[10]; // @[el2_lib.scala 197:79]
  wire  _T_99 = _T_95 | _T_98; // @[el2_lib.scala 197:24]
  wire  _T_101 = &io_trigger_pkt_any_0_tdata2[10:0]; // @[el2_lib.scala 197:37]
  wire  _T_102 = _T_101 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_105 = io_trigger_pkt_any_0_tdata2[11] == _T_17[11]; // @[el2_lib.scala 197:79]
  wire  _T_106 = _T_102 | _T_105; // @[el2_lib.scala 197:24]
  wire  _T_108 = &io_trigger_pkt_any_0_tdata2[11:0]; // @[el2_lib.scala 197:37]
  wire  _T_109 = _T_108 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_112 = io_trigger_pkt_any_0_tdata2[12] == _T_17[12]; // @[el2_lib.scala 197:79]
  wire  _T_113 = _T_109 | _T_112; // @[el2_lib.scala 197:24]
  wire  _T_115 = &io_trigger_pkt_any_0_tdata2[12:0]; // @[el2_lib.scala 197:37]
  wire  _T_116 = _T_115 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_119 = io_trigger_pkt_any_0_tdata2[13] == _T_17[13]; // @[el2_lib.scala 197:79]
  wire  _T_120 = _T_116 | _T_119; // @[el2_lib.scala 197:24]
  wire  _T_122 = &io_trigger_pkt_any_0_tdata2[13:0]; // @[el2_lib.scala 197:37]
  wire  _T_123 = _T_122 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_126 = io_trigger_pkt_any_0_tdata2[14] == _T_17[14]; // @[el2_lib.scala 197:79]
  wire  _T_127 = _T_123 | _T_126; // @[el2_lib.scala 197:24]
  wire  _T_129 = &io_trigger_pkt_any_0_tdata2[14:0]; // @[el2_lib.scala 197:37]
  wire  _T_130 = _T_129 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_133 = io_trigger_pkt_any_0_tdata2[15] == _T_17[15]; // @[el2_lib.scala 197:79]
  wire  _T_134 = _T_130 | _T_133; // @[el2_lib.scala 197:24]
  wire  _T_136 = &io_trigger_pkt_any_0_tdata2[15:0]; // @[el2_lib.scala 197:37]
  wire  _T_137 = _T_136 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_140 = io_trigger_pkt_any_0_tdata2[16] == _T_17[16]; // @[el2_lib.scala 197:79]
  wire  _T_141 = _T_137 | _T_140; // @[el2_lib.scala 197:24]
  wire  _T_143 = &io_trigger_pkt_any_0_tdata2[16:0]; // @[el2_lib.scala 197:37]
  wire  _T_144 = _T_143 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_147 = io_trigger_pkt_any_0_tdata2[17] == _T_17[17]; // @[el2_lib.scala 197:79]
  wire  _T_148 = _T_144 | _T_147; // @[el2_lib.scala 197:24]
  wire  _T_150 = &io_trigger_pkt_any_0_tdata2[17:0]; // @[el2_lib.scala 197:37]
  wire  _T_151 = _T_150 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_154 = io_trigger_pkt_any_0_tdata2[18] == _T_17[18]; // @[el2_lib.scala 197:79]
  wire  _T_155 = _T_151 | _T_154; // @[el2_lib.scala 197:24]
  wire  _T_157 = &io_trigger_pkt_any_0_tdata2[18:0]; // @[el2_lib.scala 197:37]
  wire  _T_158 = _T_157 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_161 = io_trigger_pkt_any_0_tdata2[19] == _T_17[19]; // @[el2_lib.scala 197:79]
  wire  _T_162 = _T_158 | _T_161; // @[el2_lib.scala 197:24]
  wire  _T_164 = &io_trigger_pkt_any_0_tdata2[19:0]; // @[el2_lib.scala 197:37]
  wire  _T_165 = _T_164 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_168 = io_trigger_pkt_any_0_tdata2[20] == _T_17[20]; // @[el2_lib.scala 197:79]
  wire  _T_169 = _T_165 | _T_168; // @[el2_lib.scala 197:24]
  wire  _T_171 = &io_trigger_pkt_any_0_tdata2[20:0]; // @[el2_lib.scala 197:37]
  wire  _T_172 = _T_171 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_175 = io_trigger_pkt_any_0_tdata2[21] == _T_17[21]; // @[el2_lib.scala 197:79]
  wire  _T_176 = _T_172 | _T_175; // @[el2_lib.scala 197:24]
  wire  _T_178 = &io_trigger_pkt_any_0_tdata2[21:0]; // @[el2_lib.scala 197:37]
  wire  _T_179 = _T_178 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_182 = io_trigger_pkt_any_0_tdata2[22] == _T_17[22]; // @[el2_lib.scala 197:79]
  wire  _T_183 = _T_179 | _T_182; // @[el2_lib.scala 197:24]
  wire  _T_185 = &io_trigger_pkt_any_0_tdata2[22:0]; // @[el2_lib.scala 197:37]
  wire  _T_186 = _T_185 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_189 = io_trigger_pkt_any_0_tdata2[23] == _T_17[23]; // @[el2_lib.scala 197:79]
  wire  _T_190 = _T_186 | _T_189; // @[el2_lib.scala 197:24]
  wire  _T_192 = &io_trigger_pkt_any_0_tdata2[23:0]; // @[el2_lib.scala 197:37]
  wire  _T_193 = _T_192 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_196 = io_trigger_pkt_any_0_tdata2[24] == _T_17[24]; // @[el2_lib.scala 197:79]
  wire  _T_197 = _T_193 | _T_196; // @[el2_lib.scala 197:24]
  wire  _T_199 = &io_trigger_pkt_any_0_tdata2[24:0]; // @[el2_lib.scala 197:37]
  wire  _T_200 = _T_199 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_203 = io_trigger_pkt_any_0_tdata2[25] == _T_17[25]; // @[el2_lib.scala 197:79]
  wire  _T_204 = _T_200 | _T_203; // @[el2_lib.scala 197:24]
  wire  _T_206 = &io_trigger_pkt_any_0_tdata2[25:0]; // @[el2_lib.scala 197:37]
  wire  _T_207 = _T_206 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_210 = io_trigger_pkt_any_0_tdata2[26] == _T_17[26]; // @[el2_lib.scala 197:79]
  wire  _T_211 = _T_207 | _T_210; // @[el2_lib.scala 197:24]
  wire  _T_213 = &io_trigger_pkt_any_0_tdata2[26:0]; // @[el2_lib.scala 197:37]
  wire  _T_214 = _T_213 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_217 = io_trigger_pkt_any_0_tdata2[27] == _T_17[27]; // @[el2_lib.scala 197:79]
  wire  _T_218 = _T_214 | _T_217; // @[el2_lib.scala 197:24]
  wire  _T_220 = &io_trigger_pkt_any_0_tdata2[27:0]; // @[el2_lib.scala 197:37]
  wire  _T_221 = _T_220 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_224 = io_trigger_pkt_any_0_tdata2[28] == _T_17[28]; // @[el2_lib.scala 197:79]
  wire  _T_225 = _T_221 | _T_224; // @[el2_lib.scala 197:24]
  wire  _T_227 = &io_trigger_pkt_any_0_tdata2[28:0]; // @[el2_lib.scala 197:37]
  wire  _T_228 = _T_227 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_231 = io_trigger_pkt_any_0_tdata2[29] == _T_17[29]; // @[el2_lib.scala 197:79]
  wire  _T_232 = _T_228 | _T_231; // @[el2_lib.scala 197:24]
  wire  _T_234 = &io_trigger_pkt_any_0_tdata2[29:0]; // @[el2_lib.scala 197:37]
  wire  _T_235 = _T_234 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_238 = io_trigger_pkt_any_0_tdata2[30] == _T_17[30]; // @[el2_lib.scala 197:79]
  wire  _T_239 = _T_235 | _T_238; // @[el2_lib.scala 197:24]
  wire  _T_241 = &io_trigger_pkt_any_0_tdata2[30:0]; // @[el2_lib.scala 197:37]
  wire  _T_242 = _T_241 & _T_25; // @[el2_lib.scala 197:42]
  wire  _T_245 = io_trigger_pkt_any_0_tdata2[31] == _T_17[31]; // @[el2_lib.scala 197:79]
  wire  _T_246 = _T_242 | _T_245; // @[el2_lib.scala 197:24]
  wire [7:0] _T_253 = {_T_78,_T_71,_T_64,_T_57,_T_50,_T_43,_T_36,_T_29}; // @[el2_lib.scala 198:14]
  wire [15:0] _T_261 = {_T_134,_T_127,_T_120,_T_113,_T_106,_T_99,_T_92,_T_85,_T_253}; // @[el2_lib.scala 198:14]
  wire [7:0] _T_268 = {_T_190,_T_183,_T_176,_T_169,_T_162,_T_155,_T_148,_T_141}; // @[el2_lib.scala 198:14]
  wire [31:0] _T_277 = {_T_246,_T_239,_T_232,_T_225,_T_218,_T_211,_T_204,_T_197,_T_268,_T_261}; // @[el2_lib.scala 198:14]
  wire  lsu_trigger_data_match_0 = &_T_277; // @[el2_lib.scala 198:21]
  wire  _T_279 = ~io_trigger_pkt_any_1_select; // @[el2_lsu_trigger.scala 24:107]
  wire  _T_280 = io_trigger_pkt_any_1_select & io_trigger_pkt_any_1_store; // @[el2_lsu_trigger.scala 25:35]
  wire [31:0] _T_282 = _T_279 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_283 = _T_280 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_284 = _T_282 | _T_283; // @[Mux.scala 27:72]
  wire  _T_290 = &io_trigger_pkt_any_1_tdata2; // @[el2_lib.scala 194:73]
  wire  _T_291 = ~_T_290; // @[el2_lib.scala 194:47]
  wire  _T_292 = io_trigger_pkt_any_1_match_ & _T_291; // @[el2_lib.scala 194:44]
  wire  _T_295 = io_trigger_pkt_any_1_tdata2[0] == _T_284[0]; // @[el2_lib.scala 195:52]
  wire  _T_296 = _T_292 | _T_295; // @[el2_lib.scala 195:41]
  wire  _T_298 = &io_trigger_pkt_any_1_tdata2[0]; // @[el2_lib.scala 197:37]
  wire  _T_299 = _T_298 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_302 = io_trigger_pkt_any_1_tdata2[1] == _T_284[1]; // @[el2_lib.scala 197:79]
  wire  _T_303 = _T_299 | _T_302; // @[el2_lib.scala 197:24]
  wire  _T_305 = &io_trigger_pkt_any_1_tdata2[1:0]; // @[el2_lib.scala 197:37]
  wire  _T_306 = _T_305 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_309 = io_trigger_pkt_any_1_tdata2[2] == _T_284[2]; // @[el2_lib.scala 197:79]
  wire  _T_310 = _T_306 | _T_309; // @[el2_lib.scala 197:24]
  wire  _T_312 = &io_trigger_pkt_any_1_tdata2[2:0]; // @[el2_lib.scala 197:37]
  wire  _T_313 = _T_312 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_316 = io_trigger_pkt_any_1_tdata2[3] == _T_284[3]; // @[el2_lib.scala 197:79]
  wire  _T_317 = _T_313 | _T_316; // @[el2_lib.scala 197:24]
  wire  _T_319 = &io_trigger_pkt_any_1_tdata2[3:0]; // @[el2_lib.scala 197:37]
  wire  _T_320 = _T_319 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_323 = io_trigger_pkt_any_1_tdata2[4] == _T_284[4]; // @[el2_lib.scala 197:79]
  wire  _T_324 = _T_320 | _T_323; // @[el2_lib.scala 197:24]
  wire  _T_326 = &io_trigger_pkt_any_1_tdata2[4:0]; // @[el2_lib.scala 197:37]
  wire  _T_327 = _T_326 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_330 = io_trigger_pkt_any_1_tdata2[5] == _T_284[5]; // @[el2_lib.scala 197:79]
  wire  _T_331 = _T_327 | _T_330; // @[el2_lib.scala 197:24]
  wire  _T_333 = &io_trigger_pkt_any_1_tdata2[5:0]; // @[el2_lib.scala 197:37]
  wire  _T_334 = _T_333 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_337 = io_trigger_pkt_any_1_tdata2[6] == _T_284[6]; // @[el2_lib.scala 197:79]
  wire  _T_338 = _T_334 | _T_337; // @[el2_lib.scala 197:24]
  wire  _T_340 = &io_trigger_pkt_any_1_tdata2[6:0]; // @[el2_lib.scala 197:37]
  wire  _T_341 = _T_340 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_344 = io_trigger_pkt_any_1_tdata2[7] == _T_284[7]; // @[el2_lib.scala 197:79]
  wire  _T_345 = _T_341 | _T_344; // @[el2_lib.scala 197:24]
  wire  _T_347 = &io_trigger_pkt_any_1_tdata2[7:0]; // @[el2_lib.scala 197:37]
  wire  _T_348 = _T_347 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_351 = io_trigger_pkt_any_1_tdata2[8] == _T_284[8]; // @[el2_lib.scala 197:79]
  wire  _T_352 = _T_348 | _T_351; // @[el2_lib.scala 197:24]
  wire  _T_354 = &io_trigger_pkt_any_1_tdata2[8:0]; // @[el2_lib.scala 197:37]
  wire  _T_355 = _T_354 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_358 = io_trigger_pkt_any_1_tdata2[9] == _T_284[9]; // @[el2_lib.scala 197:79]
  wire  _T_359 = _T_355 | _T_358; // @[el2_lib.scala 197:24]
  wire  _T_361 = &io_trigger_pkt_any_1_tdata2[9:0]; // @[el2_lib.scala 197:37]
  wire  _T_362 = _T_361 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_365 = io_trigger_pkt_any_1_tdata2[10] == _T_284[10]; // @[el2_lib.scala 197:79]
  wire  _T_366 = _T_362 | _T_365; // @[el2_lib.scala 197:24]
  wire  _T_368 = &io_trigger_pkt_any_1_tdata2[10:0]; // @[el2_lib.scala 197:37]
  wire  _T_369 = _T_368 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_372 = io_trigger_pkt_any_1_tdata2[11] == _T_284[11]; // @[el2_lib.scala 197:79]
  wire  _T_373 = _T_369 | _T_372; // @[el2_lib.scala 197:24]
  wire  _T_375 = &io_trigger_pkt_any_1_tdata2[11:0]; // @[el2_lib.scala 197:37]
  wire  _T_376 = _T_375 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_379 = io_trigger_pkt_any_1_tdata2[12] == _T_284[12]; // @[el2_lib.scala 197:79]
  wire  _T_380 = _T_376 | _T_379; // @[el2_lib.scala 197:24]
  wire  _T_382 = &io_trigger_pkt_any_1_tdata2[12:0]; // @[el2_lib.scala 197:37]
  wire  _T_383 = _T_382 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_386 = io_trigger_pkt_any_1_tdata2[13] == _T_284[13]; // @[el2_lib.scala 197:79]
  wire  _T_387 = _T_383 | _T_386; // @[el2_lib.scala 197:24]
  wire  _T_389 = &io_trigger_pkt_any_1_tdata2[13:0]; // @[el2_lib.scala 197:37]
  wire  _T_390 = _T_389 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_393 = io_trigger_pkt_any_1_tdata2[14] == _T_284[14]; // @[el2_lib.scala 197:79]
  wire  _T_394 = _T_390 | _T_393; // @[el2_lib.scala 197:24]
  wire  _T_396 = &io_trigger_pkt_any_1_tdata2[14:0]; // @[el2_lib.scala 197:37]
  wire  _T_397 = _T_396 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_400 = io_trigger_pkt_any_1_tdata2[15] == _T_284[15]; // @[el2_lib.scala 197:79]
  wire  _T_401 = _T_397 | _T_400; // @[el2_lib.scala 197:24]
  wire  _T_403 = &io_trigger_pkt_any_1_tdata2[15:0]; // @[el2_lib.scala 197:37]
  wire  _T_404 = _T_403 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_407 = io_trigger_pkt_any_1_tdata2[16] == _T_284[16]; // @[el2_lib.scala 197:79]
  wire  _T_408 = _T_404 | _T_407; // @[el2_lib.scala 197:24]
  wire  _T_410 = &io_trigger_pkt_any_1_tdata2[16:0]; // @[el2_lib.scala 197:37]
  wire  _T_411 = _T_410 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_414 = io_trigger_pkt_any_1_tdata2[17] == _T_284[17]; // @[el2_lib.scala 197:79]
  wire  _T_415 = _T_411 | _T_414; // @[el2_lib.scala 197:24]
  wire  _T_417 = &io_trigger_pkt_any_1_tdata2[17:0]; // @[el2_lib.scala 197:37]
  wire  _T_418 = _T_417 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_421 = io_trigger_pkt_any_1_tdata2[18] == _T_284[18]; // @[el2_lib.scala 197:79]
  wire  _T_422 = _T_418 | _T_421; // @[el2_lib.scala 197:24]
  wire  _T_424 = &io_trigger_pkt_any_1_tdata2[18:0]; // @[el2_lib.scala 197:37]
  wire  _T_425 = _T_424 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_428 = io_trigger_pkt_any_1_tdata2[19] == _T_284[19]; // @[el2_lib.scala 197:79]
  wire  _T_429 = _T_425 | _T_428; // @[el2_lib.scala 197:24]
  wire  _T_431 = &io_trigger_pkt_any_1_tdata2[19:0]; // @[el2_lib.scala 197:37]
  wire  _T_432 = _T_431 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_435 = io_trigger_pkt_any_1_tdata2[20] == _T_284[20]; // @[el2_lib.scala 197:79]
  wire  _T_436 = _T_432 | _T_435; // @[el2_lib.scala 197:24]
  wire  _T_438 = &io_trigger_pkt_any_1_tdata2[20:0]; // @[el2_lib.scala 197:37]
  wire  _T_439 = _T_438 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_442 = io_trigger_pkt_any_1_tdata2[21] == _T_284[21]; // @[el2_lib.scala 197:79]
  wire  _T_443 = _T_439 | _T_442; // @[el2_lib.scala 197:24]
  wire  _T_445 = &io_trigger_pkt_any_1_tdata2[21:0]; // @[el2_lib.scala 197:37]
  wire  _T_446 = _T_445 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_449 = io_trigger_pkt_any_1_tdata2[22] == _T_284[22]; // @[el2_lib.scala 197:79]
  wire  _T_450 = _T_446 | _T_449; // @[el2_lib.scala 197:24]
  wire  _T_452 = &io_trigger_pkt_any_1_tdata2[22:0]; // @[el2_lib.scala 197:37]
  wire  _T_453 = _T_452 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_456 = io_trigger_pkt_any_1_tdata2[23] == _T_284[23]; // @[el2_lib.scala 197:79]
  wire  _T_457 = _T_453 | _T_456; // @[el2_lib.scala 197:24]
  wire  _T_459 = &io_trigger_pkt_any_1_tdata2[23:0]; // @[el2_lib.scala 197:37]
  wire  _T_460 = _T_459 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_463 = io_trigger_pkt_any_1_tdata2[24] == _T_284[24]; // @[el2_lib.scala 197:79]
  wire  _T_464 = _T_460 | _T_463; // @[el2_lib.scala 197:24]
  wire  _T_466 = &io_trigger_pkt_any_1_tdata2[24:0]; // @[el2_lib.scala 197:37]
  wire  _T_467 = _T_466 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_470 = io_trigger_pkt_any_1_tdata2[25] == _T_284[25]; // @[el2_lib.scala 197:79]
  wire  _T_471 = _T_467 | _T_470; // @[el2_lib.scala 197:24]
  wire  _T_473 = &io_trigger_pkt_any_1_tdata2[25:0]; // @[el2_lib.scala 197:37]
  wire  _T_474 = _T_473 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_477 = io_trigger_pkt_any_1_tdata2[26] == _T_284[26]; // @[el2_lib.scala 197:79]
  wire  _T_478 = _T_474 | _T_477; // @[el2_lib.scala 197:24]
  wire  _T_480 = &io_trigger_pkt_any_1_tdata2[26:0]; // @[el2_lib.scala 197:37]
  wire  _T_481 = _T_480 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_484 = io_trigger_pkt_any_1_tdata2[27] == _T_284[27]; // @[el2_lib.scala 197:79]
  wire  _T_485 = _T_481 | _T_484; // @[el2_lib.scala 197:24]
  wire  _T_487 = &io_trigger_pkt_any_1_tdata2[27:0]; // @[el2_lib.scala 197:37]
  wire  _T_488 = _T_487 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_491 = io_trigger_pkt_any_1_tdata2[28] == _T_284[28]; // @[el2_lib.scala 197:79]
  wire  _T_492 = _T_488 | _T_491; // @[el2_lib.scala 197:24]
  wire  _T_494 = &io_trigger_pkt_any_1_tdata2[28:0]; // @[el2_lib.scala 197:37]
  wire  _T_495 = _T_494 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_498 = io_trigger_pkt_any_1_tdata2[29] == _T_284[29]; // @[el2_lib.scala 197:79]
  wire  _T_499 = _T_495 | _T_498; // @[el2_lib.scala 197:24]
  wire  _T_501 = &io_trigger_pkt_any_1_tdata2[29:0]; // @[el2_lib.scala 197:37]
  wire  _T_502 = _T_501 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_505 = io_trigger_pkt_any_1_tdata2[30] == _T_284[30]; // @[el2_lib.scala 197:79]
  wire  _T_506 = _T_502 | _T_505; // @[el2_lib.scala 197:24]
  wire  _T_508 = &io_trigger_pkt_any_1_tdata2[30:0]; // @[el2_lib.scala 197:37]
  wire  _T_509 = _T_508 & _T_292; // @[el2_lib.scala 197:42]
  wire  _T_512 = io_trigger_pkt_any_1_tdata2[31] == _T_284[31]; // @[el2_lib.scala 197:79]
  wire  _T_513 = _T_509 | _T_512; // @[el2_lib.scala 197:24]
  wire [7:0] _T_520 = {_T_345,_T_338,_T_331,_T_324,_T_317,_T_310,_T_303,_T_296}; // @[el2_lib.scala 198:14]
  wire [15:0] _T_528 = {_T_401,_T_394,_T_387,_T_380,_T_373,_T_366,_T_359,_T_352,_T_520}; // @[el2_lib.scala 198:14]
  wire [7:0] _T_535 = {_T_457,_T_450,_T_443,_T_436,_T_429,_T_422,_T_415,_T_408}; // @[el2_lib.scala 198:14]
  wire [31:0] _T_544 = {_T_513,_T_506,_T_499,_T_492,_T_485,_T_478,_T_471,_T_464,_T_535,_T_528}; // @[el2_lib.scala 198:14]
  wire  lsu_trigger_data_match_1 = &_T_544; // @[el2_lib.scala 198:21]
  wire  _T_546 = ~io_trigger_pkt_any_2_select; // @[el2_lsu_trigger.scala 24:107]
  wire  _T_547 = io_trigger_pkt_any_2_select & io_trigger_pkt_any_2_store; // @[el2_lsu_trigger.scala 25:35]
  wire [31:0] _T_549 = _T_546 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_550 = _T_547 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_551 = _T_549 | _T_550; // @[Mux.scala 27:72]
  wire  _T_557 = &io_trigger_pkt_any_2_tdata2; // @[el2_lib.scala 194:73]
  wire  _T_558 = ~_T_557; // @[el2_lib.scala 194:47]
  wire  _T_559 = io_trigger_pkt_any_2_match_ & _T_558; // @[el2_lib.scala 194:44]
  wire  _T_562 = io_trigger_pkt_any_2_tdata2[0] == _T_551[0]; // @[el2_lib.scala 195:52]
  wire  _T_563 = _T_559 | _T_562; // @[el2_lib.scala 195:41]
  wire  _T_565 = &io_trigger_pkt_any_2_tdata2[0]; // @[el2_lib.scala 197:37]
  wire  _T_566 = _T_565 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_569 = io_trigger_pkt_any_2_tdata2[1] == _T_551[1]; // @[el2_lib.scala 197:79]
  wire  _T_570 = _T_566 | _T_569; // @[el2_lib.scala 197:24]
  wire  _T_572 = &io_trigger_pkt_any_2_tdata2[1:0]; // @[el2_lib.scala 197:37]
  wire  _T_573 = _T_572 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_576 = io_trigger_pkt_any_2_tdata2[2] == _T_551[2]; // @[el2_lib.scala 197:79]
  wire  _T_577 = _T_573 | _T_576; // @[el2_lib.scala 197:24]
  wire  _T_579 = &io_trigger_pkt_any_2_tdata2[2:0]; // @[el2_lib.scala 197:37]
  wire  _T_580 = _T_579 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_583 = io_trigger_pkt_any_2_tdata2[3] == _T_551[3]; // @[el2_lib.scala 197:79]
  wire  _T_584 = _T_580 | _T_583; // @[el2_lib.scala 197:24]
  wire  _T_586 = &io_trigger_pkt_any_2_tdata2[3:0]; // @[el2_lib.scala 197:37]
  wire  _T_587 = _T_586 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_590 = io_trigger_pkt_any_2_tdata2[4] == _T_551[4]; // @[el2_lib.scala 197:79]
  wire  _T_591 = _T_587 | _T_590; // @[el2_lib.scala 197:24]
  wire  _T_593 = &io_trigger_pkt_any_2_tdata2[4:0]; // @[el2_lib.scala 197:37]
  wire  _T_594 = _T_593 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_597 = io_trigger_pkt_any_2_tdata2[5] == _T_551[5]; // @[el2_lib.scala 197:79]
  wire  _T_598 = _T_594 | _T_597; // @[el2_lib.scala 197:24]
  wire  _T_600 = &io_trigger_pkt_any_2_tdata2[5:0]; // @[el2_lib.scala 197:37]
  wire  _T_601 = _T_600 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_604 = io_trigger_pkt_any_2_tdata2[6] == _T_551[6]; // @[el2_lib.scala 197:79]
  wire  _T_605 = _T_601 | _T_604; // @[el2_lib.scala 197:24]
  wire  _T_607 = &io_trigger_pkt_any_2_tdata2[6:0]; // @[el2_lib.scala 197:37]
  wire  _T_608 = _T_607 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_611 = io_trigger_pkt_any_2_tdata2[7] == _T_551[7]; // @[el2_lib.scala 197:79]
  wire  _T_612 = _T_608 | _T_611; // @[el2_lib.scala 197:24]
  wire  _T_614 = &io_trigger_pkt_any_2_tdata2[7:0]; // @[el2_lib.scala 197:37]
  wire  _T_615 = _T_614 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_618 = io_trigger_pkt_any_2_tdata2[8] == _T_551[8]; // @[el2_lib.scala 197:79]
  wire  _T_619 = _T_615 | _T_618; // @[el2_lib.scala 197:24]
  wire  _T_621 = &io_trigger_pkt_any_2_tdata2[8:0]; // @[el2_lib.scala 197:37]
  wire  _T_622 = _T_621 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_625 = io_trigger_pkt_any_2_tdata2[9] == _T_551[9]; // @[el2_lib.scala 197:79]
  wire  _T_626 = _T_622 | _T_625; // @[el2_lib.scala 197:24]
  wire  _T_628 = &io_trigger_pkt_any_2_tdata2[9:0]; // @[el2_lib.scala 197:37]
  wire  _T_629 = _T_628 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_632 = io_trigger_pkt_any_2_tdata2[10] == _T_551[10]; // @[el2_lib.scala 197:79]
  wire  _T_633 = _T_629 | _T_632; // @[el2_lib.scala 197:24]
  wire  _T_635 = &io_trigger_pkt_any_2_tdata2[10:0]; // @[el2_lib.scala 197:37]
  wire  _T_636 = _T_635 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_639 = io_trigger_pkt_any_2_tdata2[11] == _T_551[11]; // @[el2_lib.scala 197:79]
  wire  _T_640 = _T_636 | _T_639; // @[el2_lib.scala 197:24]
  wire  _T_642 = &io_trigger_pkt_any_2_tdata2[11:0]; // @[el2_lib.scala 197:37]
  wire  _T_643 = _T_642 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_646 = io_trigger_pkt_any_2_tdata2[12] == _T_551[12]; // @[el2_lib.scala 197:79]
  wire  _T_647 = _T_643 | _T_646; // @[el2_lib.scala 197:24]
  wire  _T_649 = &io_trigger_pkt_any_2_tdata2[12:0]; // @[el2_lib.scala 197:37]
  wire  _T_650 = _T_649 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_653 = io_trigger_pkt_any_2_tdata2[13] == _T_551[13]; // @[el2_lib.scala 197:79]
  wire  _T_654 = _T_650 | _T_653; // @[el2_lib.scala 197:24]
  wire  _T_656 = &io_trigger_pkt_any_2_tdata2[13:0]; // @[el2_lib.scala 197:37]
  wire  _T_657 = _T_656 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_660 = io_trigger_pkt_any_2_tdata2[14] == _T_551[14]; // @[el2_lib.scala 197:79]
  wire  _T_661 = _T_657 | _T_660; // @[el2_lib.scala 197:24]
  wire  _T_663 = &io_trigger_pkt_any_2_tdata2[14:0]; // @[el2_lib.scala 197:37]
  wire  _T_664 = _T_663 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_667 = io_trigger_pkt_any_2_tdata2[15] == _T_551[15]; // @[el2_lib.scala 197:79]
  wire  _T_668 = _T_664 | _T_667; // @[el2_lib.scala 197:24]
  wire  _T_670 = &io_trigger_pkt_any_2_tdata2[15:0]; // @[el2_lib.scala 197:37]
  wire  _T_671 = _T_670 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_674 = io_trigger_pkt_any_2_tdata2[16] == _T_551[16]; // @[el2_lib.scala 197:79]
  wire  _T_675 = _T_671 | _T_674; // @[el2_lib.scala 197:24]
  wire  _T_677 = &io_trigger_pkt_any_2_tdata2[16:0]; // @[el2_lib.scala 197:37]
  wire  _T_678 = _T_677 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_681 = io_trigger_pkt_any_2_tdata2[17] == _T_551[17]; // @[el2_lib.scala 197:79]
  wire  _T_682 = _T_678 | _T_681; // @[el2_lib.scala 197:24]
  wire  _T_684 = &io_trigger_pkt_any_2_tdata2[17:0]; // @[el2_lib.scala 197:37]
  wire  _T_685 = _T_684 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_688 = io_trigger_pkt_any_2_tdata2[18] == _T_551[18]; // @[el2_lib.scala 197:79]
  wire  _T_689 = _T_685 | _T_688; // @[el2_lib.scala 197:24]
  wire  _T_691 = &io_trigger_pkt_any_2_tdata2[18:0]; // @[el2_lib.scala 197:37]
  wire  _T_692 = _T_691 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_695 = io_trigger_pkt_any_2_tdata2[19] == _T_551[19]; // @[el2_lib.scala 197:79]
  wire  _T_696 = _T_692 | _T_695; // @[el2_lib.scala 197:24]
  wire  _T_698 = &io_trigger_pkt_any_2_tdata2[19:0]; // @[el2_lib.scala 197:37]
  wire  _T_699 = _T_698 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_702 = io_trigger_pkt_any_2_tdata2[20] == _T_551[20]; // @[el2_lib.scala 197:79]
  wire  _T_703 = _T_699 | _T_702; // @[el2_lib.scala 197:24]
  wire  _T_705 = &io_trigger_pkt_any_2_tdata2[20:0]; // @[el2_lib.scala 197:37]
  wire  _T_706 = _T_705 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_709 = io_trigger_pkt_any_2_tdata2[21] == _T_551[21]; // @[el2_lib.scala 197:79]
  wire  _T_710 = _T_706 | _T_709; // @[el2_lib.scala 197:24]
  wire  _T_712 = &io_trigger_pkt_any_2_tdata2[21:0]; // @[el2_lib.scala 197:37]
  wire  _T_713 = _T_712 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_716 = io_trigger_pkt_any_2_tdata2[22] == _T_551[22]; // @[el2_lib.scala 197:79]
  wire  _T_717 = _T_713 | _T_716; // @[el2_lib.scala 197:24]
  wire  _T_719 = &io_trigger_pkt_any_2_tdata2[22:0]; // @[el2_lib.scala 197:37]
  wire  _T_720 = _T_719 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_723 = io_trigger_pkt_any_2_tdata2[23] == _T_551[23]; // @[el2_lib.scala 197:79]
  wire  _T_724 = _T_720 | _T_723; // @[el2_lib.scala 197:24]
  wire  _T_726 = &io_trigger_pkt_any_2_tdata2[23:0]; // @[el2_lib.scala 197:37]
  wire  _T_727 = _T_726 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_730 = io_trigger_pkt_any_2_tdata2[24] == _T_551[24]; // @[el2_lib.scala 197:79]
  wire  _T_731 = _T_727 | _T_730; // @[el2_lib.scala 197:24]
  wire  _T_733 = &io_trigger_pkt_any_2_tdata2[24:0]; // @[el2_lib.scala 197:37]
  wire  _T_734 = _T_733 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_737 = io_trigger_pkt_any_2_tdata2[25] == _T_551[25]; // @[el2_lib.scala 197:79]
  wire  _T_738 = _T_734 | _T_737; // @[el2_lib.scala 197:24]
  wire  _T_740 = &io_trigger_pkt_any_2_tdata2[25:0]; // @[el2_lib.scala 197:37]
  wire  _T_741 = _T_740 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_744 = io_trigger_pkt_any_2_tdata2[26] == _T_551[26]; // @[el2_lib.scala 197:79]
  wire  _T_745 = _T_741 | _T_744; // @[el2_lib.scala 197:24]
  wire  _T_747 = &io_trigger_pkt_any_2_tdata2[26:0]; // @[el2_lib.scala 197:37]
  wire  _T_748 = _T_747 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_751 = io_trigger_pkt_any_2_tdata2[27] == _T_551[27]; // @[el2_lib.scala 197:79]
  wire  _T_752 = _T_748 | _T_751; // @[el2_lib.scala 197:24]
  wire  _T_754 = &io_trigger_pkt_any_2_tdata2[27:0]; // @[el2_lib.scala 197:37]
  wire  _T_755 = _T_754 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_758 = io_trigger_pkt_any_2_tdata2[28] == _T_551[28]; // @[el2_lib.scala 197:79]
  wire  _T_759 = _T_755 | _T_758; // @[el2_lib.scala 197:24]
  wire  _T_761 = &io_trigger_pkt_any_2_tdata2[28:0]; // @[el2_lib.scala 197:37]
  wire  _T_762 = _T_761 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_765 = io_trigger_pkt_any_2_tdata2[29] == _T_551[29]; // @[el2_lib.scala 197:79]
  wire  _T_766 = _T_762 | _T_765; // @[el2_lib.scala 197:24]
  wire  _T_768 = &io_trigger_pkt_any_2_tdata2[29:0]; // @[el2_lib.scala 197:37]
  wire  _T_769 = _T_768 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_772 = io_trigger_pkt_any_2_tdata2[30] == _T_551[30]; // @[el2_lib.scala 197:79]
  wire  _T_773 = _T_769 | _T_772; // @[el2_lib.scala 197:24]
  wire  _T_775 = &io_trigger_pkt_any_2_tdata2[30:0]; // @[el2_lib.scala 197:37]
  wire  _T_776 = _T_775 & _T_559; // @[el2_lib.scala 197:42]
  wire  _T_779 = io_trigger_pkt_any_2_tdata2[31] == _T_551[31]; // @[el2_lib.scala 197:79]
  wire  _T_780 = _T_776 | _T_779; // @[el2_lib.scala 197:24]
  wire [7:0] _T_787 = {_T_612,_T_605,_T_598,_T_591,_T_584,_T_577,_T_570,_T_563}; // @[el2_lib.scala 198:14]
  wire [15:0] _T_795 = {_T_668,_T_661,_T_654,_T_647,_T_640,_T_633,_T_626,_T_619,_T_787}; // @[el2_lib.scala 198:14]
  wire [7:0] _T_802 = {_T_724,_T_717,_T_710,_T_703,_T_696,_T_689,_T_682,_T_675}; // @[el2_lib.scala 198:14]
  wire [31:0] _T_811 = {_T_780,_T_773,_T_766,_T_759,_T_752,_T_745,_T_738,_T_731,_T_802,_T_795}; // @[el2_lib.scala 198:14]
  wire  lsu_trigger_data_match_2 = &_T_811; // @[el2_lib.scala 198:21]
  wire  _T_813 = ~io_trigger_pkt_any_3_select; // @[el2_lsu_trigger.scala 24:107]
  wire  _T_814 = io_trigger_pkt_any_3_select & io_trigger_pkt_any_3_store; // @[el2_lsu_trigger.scala 25:35]
  wire [31:0] _T_816 = _T_813 ? io_lsu_addr_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_817 = _T_814 ? store_data_trigger_m : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_818 = _T_816 | _T_817; // @[Mux.scala 27:72]
  wire  _T_824 = &io_trigger_pkt_any_3_tdata2; // @[el2_lib.scala 194:73]
  wire  _T_825 = ~_T_824; // @[el2_lib.scala 194:47]
  wire  _T_826 = io_trigger_pkt_any_3_match_ & _T_825; // @[el2_lib.scala 194:44]
  wire  _T_829 = io_trigger_pkt_any_3_tdata2[0] == _T_818[0]; // @[el2_lib.scala 195:52]
  wire  _T_830 = _T_826 | _T_829; // @[el2_lib.scala 195:41]
  wire  _T_832 = &io_trigger_pkt_any_3_tdata2[0]; // @[el2_lib.scala 197:37]
  wire  _T_833 = _T_832 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_836 = io_trigger_pkt_any_3_tdata2[1] == _T_818[1]; // @[el2_lib.scala 197:79]
  wire  _T_837 = _T_833 | _T_836; // @[el2_lib.scala 197:24]
  wire  _T_839 = &io_trigger_pkt_any_3_tdata2[1:0]; // @[el2_lib.scala 197:37]
  wire  _T_840 = _T_839 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_843 = io_trigger_pkt_any_3_tdata2[2] == _T_818[2]; // @[el2_lib.scala 197:79]
  wire  _T_844 = _T_840 | _T_843; // @[el2_lib.scala 197:24]
  wire  _T_846 = &io_trigger_pkt_any_3_tdata2[2:0]; // @[el2_lib.scala 197:37]
  wire  _T_847 = _T_846 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_850 = io_trigger_pkt_any_3_tdata2[3] == _T_818[3]; // @[el2_lib.scala 197:79]
  wire  _T_851 = _T_847 | _T_850; // @[el2_lib.scala 197:24]
  wire  _T_853 = &io_trigger_pkt_any_3_tdata2[3:0]; // @[el2_lib.scala 197:37]
  wire  _T_854 = _T_853 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_857 = io_trigger_pkt_any_3_tdata2[4] == _T_818[4]; // @[el2_lib.scala 197:79]
  wire  _T_858 = _T_854 | _T_857; // @[el2_lib.scala 197:24]
  wire  _T_860 = &io_trigger_pkt_any_3_tdata2[4:0]; // @[el2_lib.scala 197:37]
  wire  _T_861 = _T_860 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_864 = io_trigger_pkt_any_3_tdata2[5] == _T_818[5]; // @[el2_lib.scala 197:79]
  wire  _T_865 = _T_861 | _T_864; // @[el2_lib.scala 197:24]
  wire  _T_867 = &io_trigger_pkt_any_3_tdata2[5:0]; // @[el2_lib.scala 197:37]
  wire  _T_868 = _T_867 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_871 = io_trigger_pkt_any_3_tdata2[6] == _T_818[6]; // @[el2_lib.scala 197:79]
  wire  _T_872 = _T_868 | _T_871; // @[el2_lib.scala 197:24]
  wire  _T_874 = &io_trigger_pkt_any_3_tdata2[6:0]; // @[el2_lib.scala 197:37]
  wire  _T_875 = _T_874 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_878 = io_trigger_pkt_any_3_tdata2[7] == _T_818[7]; // @[el2_lib.scala 197:79]
  wire  _T_879 = _T_875 | _T_878; // @[el2_lib.scala 197:24]
  wire  _T_881 = &io_trigger_pkt_any_3_tdata2[7:0]; // @[el2_lib.scala 197:37]
  wire  _T_882 = _T_881 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_885 = io_trigger_pkt_any_3_tdata2[8] == _T_818[8]; // @[el2_lib.scala 197:79]
  wire  _T_886 = _T_882 | _T_885; // @[el2_lib.scala 197:24]
  wire  _T_888 = &io_trigger_pkt_any_3_tdata2[8:0]; // @[el2_lib.scala 197:37]
  wire  _T_889 = _T_888 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_892 = io_trigger_pkt_any_3_tdata2[9] == _T_818[9]; // @[el2_lib.scala 197:79]
  wire  _T_893 = _T_889 | _T_892; // @[el2_lib.scala 197:24]
  wire  _T_895 = &io_trigger_pkt_any_3_tdata2[9:0]; // @[el2_lib.scala 197:37]
  wire  _T_896 = _T_895 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_899 = io_trigger_pkt_any_3_tdata2[10] == _T_818[10]; // @[el2_lib.scala 197:79]
  wire  _T_900 = _T_896 | _T_899; // @[el2_lib.scala 197:24]
  wire  _T_902 = &io_trigger_pkt_any_3_tdata2[10:0]; // @[el2_lib.scala 197:37]
  wire  _T_903 = _T_902 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_906 = io_trigger_pkt_any_3_tdata2[11] == _T_818[11]; // @[el2_lib.scala 197:79]
  wire  _T_907 = _T_903 | _T_906; // @[el2_lib.scala 197:24]
  wire  _T_909 = &io_trigger_pkt_any_3_tdata2[11:0]; // @[el2_lib.scala 197:37]
  wire  _T_910 = _T_909 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_913 = io_trigger_pkt_any_3_tdata2[12] == _T_818[12]; // @[el2_lib.scala 197:79]
  wire  _T_914 = _T_910 | _T_913; // @[el2_lib.scala 197:24]
  wire  _T_916 = &io_trigger_pkt_any_3_tdata2[12:0]; // @[el2_lib.scala 197:37]
  wire  _T_917 = _T_916 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_920 = io_trigger_pkt_any_3_tdata2[13] == _T_818[13]; // @[el2_lib.scala 197:79]
  wire  _T_921 = _T_917 | _T_920; // @[el2_lib.scala 197:24]
  wire  _T_923 = &io_trigger_pkt_any_3_tdata2[13:0]; // @[el2_lib.scala 197:37]
  wire  _T_924 = _T_923 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_927 = io_trigger_pkt_any_3_tdata2[14] == _T_818[14]; // @[el2_lib.scala 197:79]
  wire  _T_928 = _T_924 | _T_927; // @[el2_lib.scala 197:24]
  wire  _T_930 = &io_trigger_pkt_any_3_tdata2[14:0]; // @[el2_lib.scala 197:37]
  wire  _T_931 = _T_930 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_934 = io_trigger_pkt_any_3_tdata2[15] == _T_818[15]; // @[el2_lib.scala 197:79]
  wire  _T_935 = _T_931 | _T_934; // @[el2_lib.scala 197:24]
  wire  _T_937 = &io_trigger_pkt_any_3_tdata2[15:0]; // @[el2_lib.scala 197:37]
  wire  _T_938 = _T_937 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_941 = io_trigger_pkt_any_3_tdata2[16] == _T_818[16]; // @[el2_lib.scala 197:79]
  wire  _T_942 = _T_938 | _T_941; // @[el2_lib.scala 197:24]
  wire  _T_944 = &io_trigger_pkt_any_3_tdata2[16:0]; // @[el2_lib.scala 197:37]
  wire  _T_945 = _T_944 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_948 = io_trigger_pkt_any_3_tdata2[17] == _T_818[17]; // @[el2_lib.scala 197:79]
  wire  _T_949 = _T_945 | _T_948; // @[el2_lib.scala 197:24]
  wire  _T_951 = &io_trigger_pkt_any_3_tdata2[17:0]; // @[el2_lib.scala 197:37]
  wire  _T_952 = _T_951 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_955 = io_trigger_pkt_any_3_tdata2[18] == _T_818[18]; // @[el2_lib.scala 197:79]
  wire  _T_956 = _T_952 | _T_955; // @[el2_lib.scala 197:24]
  wire  _T_958 = &io_trigger_pkt_any_3_tdata2[18:0]; // @[el2_lib.scala 197:37]
  wire  _T_959 = _T_958 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_962 = io_trigger_pkt_any_3_tdata2[19] == _T_818[19]; // @[el2_lib.scala 197:79]
  wire  _T_963 = _T_959 | _T_962; // @[el2_lib.scala 197:24]
  wire  _T_965 = &io_trigger_pkt_any_3_tdata2[19:0]; // @[el2_lib.scala 197:37]
  wire  _T_966 = _T_965 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_969 = io_trigger_pkt_any_3_tdata2[20] == _T_818[20]; // @[el2_lib.scala 197:79]
  wire  _T_970 = _T_966 | _T_969; // @[el2_lib.scala 197:24]
  wire  _T_972 = &io_trigger_pkt_any_3_tdata2[20:0]; // @[el2_lib.scala 197:37]
  wire  _T_973 = _T_972 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_976 = io_trigger_pkt_any_3_tdata2[21] == _T_818[21]; // @[el2_lib.scala 197:79]
  wire  _T_977 = _T_973 | _T_976; // @[el2_lib.scala 197:24]
  wire  _T_979 = &io_trigger_pkt_any_3_tdata2[21:0]; // @[el2_lib.scala 197:37]
  wire  _T_980 = _T_979 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_983 = io_trigger_pkt_any_3_tdata2[22] == _T_818[22]; // @[el2_lib.scala 197:79]
  wire  _T_984 = _T_980 | _T_983; // @[el2_lib.scala 197:24]
  wire  _T_986 = &io_trigger_pkt_any_3_tdata2[22:0]; // @[el2_lib.scala 197:37]
  wire  _T_987 = _T_986 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_990 = io_trigger_pkt_any_3_tdata2[23] == _T_818[23]; // @[el2_lib.scala 197:79]
  wire  _T_991 = _T_987 | _T_990; // @[el2_lib.scala 197:24]
  wire  _T_993 = &io_trigger_pkt_any_3_tdata2[23:0]; // @[el2_lib.scala 197:37]
  wire  _T_994 = _T_993 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_997 = io_trigger_pkt_any_3_tdata2[24] == _T_818[24]; // @[el2_lib.scala 197:79]
  wire  _T_998 = _T_994 | _T_997; // @[el2_lib.scala 197:24]
  wire  _T_1000 = &io_trigger_pkt_any_3_tdata2[24:0]; // @[el2_lib.scala 197:37]
  wire  _T_1001 = _T_1000 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1004 = io_trigger_pkt_any_3_tdata2[25] == _T_818[25]; // @[el2_lib.scala 197:79]
  wire  _T_1005 = _T_1001 | _T_1004; // @[el2_lib.scala 197:24]
  wire  _T_1007 = &io_trigger_pkt_any_3_tdata2[25:0]; // @[el2_lib.scala 197:37]
  wire  _T_1008 = _T_1007 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1011 = io_trigger_pkt_any_3_tdata2[26] == _T_818[26]; // @[el2_lib.scala 197:79]
  wire  _T_1012 = _T_1008 | _T_1011; // @[el2_lib.scala 197:24]
  wire  _T_1014 = &io_trigger_pkt_any_3_tdata2[26:0]; // @[el2_lib.scala 197:37]
  wire  _T_1015 = _T_1014 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1018 = io_trigger_pkt_any_3_tdata2[27] == _T_818[27]; // @[el2_lib.scala 197:79]
  wire  _T_1019 = _T_1015 | _T_1018; // @[el2_lib.scala 197:24]
  wire  _T_1021 = &io_trigger_pkt_any_3_tdata2[27:0]; // @[el2_lib.scala 197:37]
  wire  _T_1022 = _T_1021 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1025 = io_trigger_pkt_any_3_tdata2[28] == _T_818[28]; // @[el2_lib.scala 197:79]
  wire  _T_1026 = _T_1022 | _T_1025; // @[el2_lib.scala 197:24]
  wire  _T_1028 = &io_trigger_pkt_any_3_tdata2[28:0]; // @[el2_lib.scala 197:37]
  wire  _T_1029 = _T_1028 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1032 = io_trigger_pkt_any_3_tdata2[29] == _T_818[29]; // @[el2_lib.scala 197:79]
  wire  _T_1033 = _T_1029 | _T_1032; // @[el2_lib.scala 197:24]
  wire  _T_1035 = &io_trigger_pkt_any_3_tdata2[29:0]; // @[el2_lib.scala 197:37]
  wire  _T_1036 = _T_1035 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1039 = io_trigger_pkt_any_3_tdata2[30] == _T_818[30]; // @[el2_lib.scala 197:79]
  wire  _T_1040 = _T_1036 | _T_1039; // @[el2_lib.scala 197:24]
  wire  _T_1042 = &io_trigger_pkt_any_3_tdata2[30:0]; // @[el2_lib.scala 197:37]
  wire  _T_1043 = _T_1042 & _T_826; // @[el2_lib.scala 197:42]
  wire  _T_1046 = io_trigger_pkt_any_3_tdata2[31] == _T_818[31]; // @[el2_lib.scala 197:79]
  wire  _T_1047 = _T_1043 | _T_1046; // @[el2_lib.scala 197:24]
  wire [7:0] _T_1054 = {_T_879,_T_872,_T_865,_T_858,_T_851,_T_844,_T_837,_T_830}; // @[el2_lib.scala 198:14]
  wire [15:0] _T_1062 = {_T_935,_T_928,_T_921,_T_914,_T_907,_T_900,_T_893,_T_886,_T_1054}; // @[el2_lib.scala 198:14]
  wire [7:0] _T_1069 = {_T_991,_T_984,_T_977,_T_970,_T_963,_T_956,_T_949,_T_942}; // @[el2_lib.scala 198:14]
  wire [31:0] _T_1078 = {_T_1047,_T_1040,_T_1033,_T_1026,_T_1019,_T_1012,_T_1005,_T_998,_T_1069,_T_1062}; // @[el2_lib.scala 198:14]
  wire  lsu_trigger_data_match_3 = &_T_1078; // @[el2_lib.scala 198:21]
  wire  _T_1079 = ~io_lsu_pkt_m_dma; // @[el2_lsu_trigger.scala 26:74]
  wire  _T_1080 = io_lsu_pkt_m_valid & _T_1079; // @[el2_lsu_trigger.scala 26:72]
  wire  _T_1081 = io_trigger_pkt_any_0_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 26:123]
  wire  _T_1082 = _T_1080 & _T_1081; // @[el2_lsu_trigger.scala 26:92]
  wire  _T_1083 = io_trigger_pkt_any_0_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 27:33]
  wire  _T_1085 = _T_1083 & _T_12; // @[el2_lsu_trigger.scala 27:53]
  wire  _T_1086 = _T_1085 & lsu_trigger_data_match_0; // @[el2_lsu_trigger.scala 27:85]
  wire  _T_1087 = _T_1082 | _T_1086; // @[el2_lsu_trigger.scala 26:144]
  wire  _T_1090 = io_trigger_pkt_any_1_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 26:123]
  wire  _T_1091 = _T_1080 & _T_1090; // @[el2_lsu_trigger.scala 26:92]
  wire  _T_1092 = io_trigger_pkt_any_1_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 27:33]
  wire  _T_1094 = _T_1092 & _T_279; // @[el2_lsu_trigger.scala 27:53]
  wire  _T_1095 = _T_1094 & lsu_trigger_data_match_1; // @[el2_lsu_trigger.scala 27:85]
  wire  _T_1096 = _T_1091 | _T_1095; // @[el2_lsu_trigger.scala 26:144]
  wire  _T_1099 = io_trigger_pkt_any_2_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 26:123]
  wire  _T_1100 = _T_1080 & _T_1099; // @[el2_lsu_trigger.scala 26:92]
  wire  _T_1101 = io_trigger_pkt_any_2_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 27:33]
  wire  _T_1103 = _T_1101 & _T_546; // @[el2_lsu_trigger.scala 27:53]
  wire  _T_1104 = _T_1103 & lsu_trigger_data_match_2; // @[el2_lsu_trigger.scala 27:85]
  wire  _T_1105 = _T_1100 | _T_1104; // @[el2_lsu_trigger.scala 26:144]
  wire  _T_1108 = io_trigger_pkt_any_3_store & io_lsu_pkt_m_store; // @[el2_lsu_trigger.scala 26:123]
  wire  _T_1109 = _T_1080 & _T_1108; // @[el2_lsu_trigger.scala 26:92]
  wire  _T_1110 = io_trigger_pkt_any_3_load & io_lsu_pkt_m_load; // @[el2_lsu_trigger.scala 27:33]
  wire  _T_1112 = _T_1110 & _T_813; // @[el2_lsu_trigger.scala 27:53]
  wire  _T_1113 = _T_1112 & lsu_trigger_data_match_3; // @[el2_lsu_trigger.scala 27:85]
  wire  _T_1114 = _T_1109 | _T_1113; // @[el2_lsu_trigger.scala 26:144]
  wire [2:0] _T_1117 = {_T_1114,_T_1105,_T_1096}; // @[Cat.scala 29:58]
  assign io_lsu_trigger_match_m = {_T_1117,_T_1087}; // @[el2_lsu_trigger.scala 15:25 el2_lsu_trigger.scala 26:26]
endmodule
module el2_lsu_clkdomain(
  input   clock,
  input   reset,
  input   io_clk_override,
  input   io_dma_dccm_req,
  input   io_ldst_stbuf_reqvld_r,
  input   io_stbuf_reqvld_any,
  input   io_stbuf_reqvld_flushed_any,
  input   io_lsu_bus_clk_en,
  input   io_lsu_p_valid,
  input   io_lsu_pkt_d_store,
  input   io_lsu_pkt_d_valid,
  input   io_lsu_pkt_m_store,
  input   io_lsu_pkt_m_valid,
  output  io_lsu_c1_m_clk,
  output  io_lsu_c1_r_clk,
  output  io_lsu_c2_m_clk,
  output  io_lsu_c2_r_clk,
  output  io_lsu_stbuf_c1_clk,
  output  io_lsu_free_c2_clk,
  input   io_scan_mode
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_en; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_en; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c2m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_en; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_en; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_store_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_en; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_en; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_stbuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_bus_ibuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_obuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_buf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_busm_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_clk; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_en; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_free_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_clk; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_en; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 99:35]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[el2_lsu_clkdomain.scala 64:51]
  reg  lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 84:67]
  wire  _T_1 = io_lsu_pkt_d_valid | lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 65:51]
  wire  lsu_c1_m_clken = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 65:70]
  reg  lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 85:67]
  wire  _T_2 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 66:51]
  wire  lsu_c1_r_clken = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 66:70]
  wire  _T_3 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 68:47]
  reg  lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 86:67]
  wire  _T_4 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 69:47]
  wire  _T_5 = lsu_c1_m_clken & io_lsu_pkt_d_store; // @[el2_lsu_clkdomain.scala 71:49]
  wire  _T_6 = lsu_c1_r_clken & io_lsu_pkt_m_store; // @[el2_lsu_clkdomain.scala 72:49]
  wire  _T_7 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[el2_lsu_clkdomain.scala 73:55]
  wire  _T_8 = _T_7 | io_stbuf_reqvld_flushed_any; // @[el2_lsu_clkdomain.scala 73:77]
  rvclkhdr lsu_c1m_cgc ( // @[el2_lsu_clkdomain.scala 88:35]
    .io_l1clk(lsu_c1m_cgc_io_l1clk),
    .io_clk(lsu_c1m_cgc_io_clk),
    .io_en(lsu_c1m_cgc_io_en),
    .io_scan_mode(lsu_c1m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c1r_cgc ( // @[el2_lsu_clkdomain.scala 89:35]
    .io_l1clk(lsu_c1r_cgc_io_l1clk),
    .io_clk(lsu_c1r_cgc_io_clk),
    .io_en(lsu_c1r_cgc_io_en),
    .io_scan_mode(lsu_c1r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c2m_cgc ( // @[el2_lsu_clkdomain.scala 90:35]
    .io_l1clk(lsu_c2m_cgc_io_l1clk),
    .io_clk(lsu_c2m_cgc_io_clk),
    .io_en(lsu_c2m_cgc_io_en),
    .io_scan_mode(lsu_c2m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c2r_cgc ( // @[el2_lsu_clkdomain.scala 91:35]
    .io_l1clk(lsu_c2r_cgc_io_l1clk),
    .io_clk(lsu_c2r_cgc_io_clk),
    .io_en(lsu_c2r_cgc_io_en),
    .io_scan_mode(lsu_c2r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_store_c1m_cgc ( // @[el2_lsu_clkdomain.scala 92:35]
    .io_l1clk(lsu_store_c1m_cgc_io_l1clk),
    .io_clk(lsu_store_c1m_cgc_io_clk),
    .io_en(lsu_store_c1m_cgc_io_en),
    .io_scan_mode(lsu_store_c1m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_store_c1r_cgc ( // @[el2_lsu_clkdomain.scala 93:35]
    .io_l1clk(lsu_store_c1r_cgc_io_l1clk),
    .io_clk(lsu_store_c1r_cgc_io_clk),
    .io_en(lsu_store_c1r_cgc_io_en),
    .io_scan_mode(lsu_store_c1r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_stbuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 94:35]
    .io_l1clk(lsu_stbuf_c1_cgc_io_l1clk),
    .io_clk(lsu_stbuf_c1_cgc_io_clk),
    .io_en(lsu_stbuf_c1_cgc_io_en),
    .io_scan_mode(lsu_stbuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_ibuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 95:35]
    .io_l1clk(lsu_bus_ibuf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_ibuf_c1_cgc_io_clk),
    .io_en(lsu_bus_ibuf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_ibuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_obuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 96:35]
    .io_l1clk(lsu_bus_obuf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_obuf_c1_cgc_io_clk),
    .io_en(lsu_bus_obuf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_obuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_buf_c1_cgc ( // @[el2_lsu_clkdomain.scala 97:35]
    .io_l1clk(lsu_bus_buf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_buf_c1_cgc_io_clk),
    .io_en(lsu_bus_buf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_buf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_busm_cgc ( // @[el2_lsu_clkdomain.scala 98:35]
    .io_l1clk(lsu_busm_cgc_io_l1clk),
    .io_clk(lsu_busm_cgc_io_clk),
    .io_en(lsu_busm_cgc_io_en),
    .io_scan_mode(lsu_busm_cgc_io_scan_mode)
  );
  rvclkhdr lsu_free_cgc ( // @[el2_lsu_clkdomain.scala 99:35]
    .io_l1clk(lsu_free_cgc_io_l1clk),
    .io_clk(lsu_free_cgc_io_clk),
    .io_en(lsu_free_cgc_io_en),
    .io_scan_mode(lsu_free_cgc_io_scan_mode)
  );
  assign io_lsu_c1_m_clk = lsu_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 88:127]
  assign io_lsu_c1_r_clk = lsu_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 89:127]
  assign io_lsu_c2_m_clk = lsu_c2m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 90:127]
  assign io_lsu_c2_r_clk = lsu_c2r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 91:127]
  assign io_lsu_stbuf_c1_clk = lsu_stbuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 94:127]
  assign io_lsu_free_c2_clk = lsu_free_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 99:127]
  assign lsu_c1m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 101:30]
  assign lsu_c1m_cgc_io_en = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 88:77]
  assign lsu_c1m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 101:75]
  assign lsu_c1r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 102:30]
  assign lsu_c1r_cgc_io_en = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 89:77]
  assign lsu_c1r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 102:75]
  assign lsu_c2m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 103:30]
  assign lsu_c2m_cgc_io_en = _T_3 | io_clk_override; // @[el2_lsu_clkdomain.scala 90:77]
  assign lsu_c2m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 103:75]
  assign lsu_c2r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 104:30]
  assign lsu_c2r_cgc_io_en = _T_4 | io_clk_override; // @[el2_lsu_clkdomain.scala 91:77]
  assign lsu_c2r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 104:75]
  assign lsu_store_c1m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 105:30]
  assign lsu_store_c1m_cgc_io_en = _T_5 | io_clk_override; // @[el2_lsu_clkdomain.scala 92:77]
  assign lsu_store_c1m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 105:75]
  assign lsu_store_c1r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 106:30]
  assign lsu_store_c1r_cgc_io_en = _T_6 | io_clk_override; // @[el2_lsu_clkdomain.scala 93:77]
  assign lsu_store_c1r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 106:75]
  assign lsu_stbuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 107:30]
  assign lsu_stbuf_c1_cgc_io_en = _T_8 | io_clk_override; // @[el2_lsu_clkdomain.scala 94:77]
  assign lsu_stbuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 107:75]
  assign lsu_bus_ibuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 108:30]
  assign lsu_bus_ibuf_c1_cgc_io_en = io_clk_override; // @[el2_lsu_clkdomain.scala 95:77]
  assign lsu_bus_ibuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 108:75]
  assign lsu_bus_obuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 109:30]
  assign lsu_bus_obuf_c1_cgc_io_en = io_clk_override & io_lsu_bus_clk_en; // @[el2_lsu_clkdomain.scala 96:77]
  assign lsu_bus_obuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 109:75]
  assign lsu_bus_buf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 110:30]
  assign lsu_bus_buf_c1_cgc_io_en = 1'h1; // @[el2_lsu_clkdomain.scala 97:77]
  assign lsu_bus_buf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 110:75]
  assign lsu_busm_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 111:30]
  assign lsu_busm_cgc_io_en = io_lsu_bus_clk_en; // @[el2_lsu_clkdomain.scala 98:77]
  assign lsu_busm_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 111:75]
  assign lsu_free_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 112:30]
  assign lsu_free_cgc_io_en = 1'h1; // @[el2_lsu_clkdomain.scala 99:77]
  assign lsu_free_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 112:75]
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
  output [3:0]  io_lsu_error_pkt_r_mscause,
  output [31:0] io_lsu_error_pkt_r_addr,
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
  wire  lsu_lsc_ctl_clock; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_reset; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_flush_m_up; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_flush_r; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_exu_lsu_rs1_d; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_exu_lsu_rs2_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_fast_int; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_by; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_half; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_word; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_dword; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_load; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_store; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_unsign; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_dma; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_store_data_bypass_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_load_ldst_bypass_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_store_data_bypass_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_p_valid; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 153:30]
  wire [11:0] lsu_lsc_ctl_io_dec_lsu_offset_d; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_result_m; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_d; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_d; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_m; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_end_addr_r; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_dec_tlu_mrac_ff; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type; // @[el2_lsu.scala 153:30]
  wire [3:0] lsu_lsc_ctl_io_lsu_error_pkt_r_mscause; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_error_pkt_r_addr; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_lsu_fir_addr; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_dma_dccm_req; // @[el2_lsu.scala 153:30]
  wire [31:0] lsu_lsc_ctl_io_dma_mem_addr; // @[el2_lsu.scala 153:30]
  wire [2:0] lsu_lsc_ctl_io_dma_mem_sz; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_dma_mem_write; // @[el2_lsu.scala 153:30]
  wire [63:0] lsu_lsc_ctl_io_dma_mem_wdata; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_fast_int; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_by; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_half; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_unsign; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_load_ldst_bypass_d; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_store_data_bypass_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_fast_int; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_dword; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_unsign; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_store_data_bypass_m; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_dword; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_unsign; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 153:30]
  wire  lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 153:30]
  wire  dccm_ctl_reset; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_c2_m_clk; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_c2_r_clk; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_free_c2_clk; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_store_c1_r_clk; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_clk; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_raw_fwd_lo_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_raw_fwd_hi_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_commit_r; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_lsu_addr_d; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_lsu_addr_m; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_lsu_addr_r; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_end_addr_d; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_end_addr_m; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_end_addr_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_stbuf_reqvld_any; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_stbuf_addr_any; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_stbuf_data_any; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 154:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 154:30]
  wire [3:0] dccm_ctl_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_single_ecc_error_hi_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_single_ecc_error_lo_r; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_r_ff; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_r_ff; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_hi_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_dccm_rdata_lo_m; // @[el2_lsu.scala 154:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 154:30]
  wire [6:0] dccm_ctl_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_sec_data_hi_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_sec_data_lo_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_store_data_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dma_dccm_wen; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dma_pic_wen; // @[el2_lsu.scala 154:30]
  wire [2:0] dccm_ctl_io_dma_mem_tag_m; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_dma_mem_addr; // @[el2_lsu.scala 154:30]
  wire [63:0] dccm_ctl_io_dma_mem_wdata; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_lo; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_dma_dccm_wdata_hi; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_store_data_hi_r; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_store_data_lo_r; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_store_datafn_hi_r; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_store_datafn_lo_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_lsu_dccm_rden_m; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dccm_dma_rvalid; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dccm_dma_ecc_error; // @[el2_lsu.scala 154:30]
  wire [2:0] dccm_ctl_io_dccm_dma_rtag; // @[el2_lsu.scala 154:30]
  wire [63:0] dccm_ctl_io_dccm_dma_rdata; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dccm_wren; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_dccm_rden; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_lo; // @[el2_lsu.scala 154:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_lo; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_lo; // @[el2_lsu.scala 154:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_lo; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_dccm_wr_addr_hi; // @[el2_lsu.scala 154:30]
  wire [38:0] dccm_ctl_io_dccm_wr_data_hi; // @[el2_lsu.scala 154:30]
  wire [15:0] dccm_ctl_io_dccm_rd_addr_hi; // @[el2_lsu.scala 154:30]
  wire [38:0] dccm_ctl_io_dccm_rd_data_hi; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_picm_wren; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_picm_rden; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_picm_mken; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_picm_rdaddr; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_picm_wraddr; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_picm_wr_data; // @[el2_lsu.scala 154:30]
  wire [31:0] dccm_ctl_io_picm_rd_data; // @[el2_lsu.scala 154:30]
  wire  dccm_ctl_io_scan_mode; // @[el2_lsu.scala 154:30]
  wire  stbuf_clock; // @[el2_lsu.scala 155:30]
  wire  stbuf_reset; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_c1_m_clk; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_c1_r_clk; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_free_c2_clk; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_m_store; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_m_dma; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_m_valid; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_by; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_half; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_word; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_dword; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_store; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_dma; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_pkt_r_valid; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_store_stbuf_reqvld_r; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_commit_r; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_store_data_hi_r; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_store_data_lo_r; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_store_datafn_hi_r; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_store_datafn_lo_r; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 155:30]
  wire [15:0] stbuf_io_lsu_addr_d; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_lsu_addr_m; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_lsu_addr_r; // @[el2_lsu.scala 155:30]
  wire [15:0] stbuf_io_end_addr_d; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_end_addr_m; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_end_addr_r; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_addr_in_dccm_m; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_addr_in_dccm_r; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 155:30]
  wire [15:0] stbuf_io_stbuf_addr_any; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_stbuf_data_any; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_lsu_stbuf_full_any; // @[el2_lsu.scala 155:30]
  wire  stbuf_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 155:30]
  wire [31:0] stbuf_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 155:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 155:30]
  wire [3:0] stbuf_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 155:30]
  wire  ecc_clock; // @[el2_lsu.scala 156:30]
  wire  ecc_reset; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_c2_r_clk; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_pkt_m_load; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_pkt_m_store; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_pkt_m_dma; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_pkt_m_valid; // @[el2_lsu.scala 156:30]
  wire  ecc_io_dec_tlu_core_ecc_disable; // @[el2_lsu.scala 156:30]
  wire [15:0] ecc_io_lsu_addr_m; // @[el2_lsu.scala 156:30]
  wire [15:0] ecc_io_end_addr_m; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_dccm_rdata_hi_m; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_dccm_rdata_lo_m; // @[el2_lsu.scala 156:30]
  wire [6:0] ecc_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 156:30]
  wire [6:0] ecc_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 156:30]
  wire  ecc_io_ld_single_ecc_error_r; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_dccm_rden_m; // @[el2_lsu.scala 156:30]
  wire  ecc_io_addr_in_dccm_m; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_hi_r; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_lo_r; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_hi_m; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_lo_m; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_hi_r_ff; // @[el2_lsu.scala 156:30]
  wire [31:0] ecc_io_sec_data_lo_r_ff; // @[el2_lsu.scala 156:30]
  wire  ecc_io_single_ecc_error_hi_r; // @[el2_lsu.scala 156:30]
  wire  ecc_io_single_ecc_error_lo_r; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 156:30]
  wire  ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 156:30]
  wire  trigger_io_trigger_pkt_any_0_select; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_0_match_; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_0_store; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_0_load; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_trigger_pkt_any_0_tdata2; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_1_select; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_1_match_; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_1_store; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_1_load; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_trigger_pkt_any_1_tdata2; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_2_select; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_2_match_; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_2_store; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_2_load; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_trigger_pkt_any_2_tdata2; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_3_select; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_3_match_; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_3_store; // @[el2_lsu.scala 157:30]
  wire  trigger_io_trigger_pkt_any_3_load; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_trigger_pkt_any_3_tdata2; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_half; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_word; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_load; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_store; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_dma; // @[el2_lsu.scala 157:30]
  wire  trigger_io_lsu_pkt_m_valid; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_lsu_addr_m; // @[el2_lsu.scala 157:30]
  wire [31:0] trigger_io_store_data_m; // @[el2_lsu.scala 157:30]
  wire [3:0] trigger_io_lsu_trigger_match_m; // @[el2_lsu.scala 157:30]
  wire  clkdomain_clock; // @[el2_lsu.scala 158:30]
  wire  clkdomain_reset; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_clk_override; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_dma_dccm_req; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_stbuf_reqvld_any; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_bus_clk_en; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_p_valid; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_pkt_d_store; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_pkt_d_valid; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_pkt_m_store; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_pkt_m_valid; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_lsu_free_c2_clk; // @[el2_lsu.scala 158:30]
  wire  clkdomain_io_scan_mode; // @[el2_lsu.scala 158:30]
  wire  _T = stbuf_io_lsu_stbuf_full_any; // @[el2_lsu.scala 165:57]
  wire  _T_3 = ~lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 172:58]
  wire  _T_4 = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_3; // @[el2_lsu.scala 172:56]
  wire  _T_5 = lsu_lsc_ctl_io_addr_in_dccm_m | lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 172:121]
  wire  _T_6 = _T_4 & _T_5; // @[el2_lsu.scala 172:88]
  wire  ldst_nodma_mtor = _T_6 & lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 172:153]
  wire  _T_7 = io_dec_lsu_valid_raw_d | ldst_nodma_mtor; // @[el2_lsu.scala 173:45]
  wire  _T_8 = _T_7 | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 173:63]
  wire  _T_10 = io_dma_dccm_req & io_dma_mem_write; // @[el2_lsu.scala 174:38]
  wire [5:0] _T_13 = {io_dma_mem_addr[2:0],3'h0}; // @[Cat.scala 29:58]
  wire [63:0] dma_dccm_wdata = io_dma_mem_wdata >> _T_13; // @[el2_lsu.scala 176:38]
  wire  _T_19 = ~lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 187:125]
  wire  _T_25 = lsu_lsc_ctl_io_lsu_pkt_r_valid & lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 189:61]
  wire  _T_26 = _T_25 & lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 189:94]
  wire  _T_27 = ~io_dec_tlu_i0_kill_writeb_r; // @[el2_lsu.scala 189:128]
  wire  _T_28 = _T_26 & _T_27; // @[el2_lsu.scala 189:126]
  wire  _T_42 = lsu_lsc_ctl_io_lsu_pkt_m_half & lsu_lsc_ctl_io_lsu_addr_m[0]; // @[el2_lsu.scala 195:94]
  wire  _T_44 = |lsu_lsc_ctl_io_lsu_addr_m[1:0]; // @[el2_lsu.scala 195:192]
  wire  _T_45 = lsu_lsc_ctl_io_lsu_pkt_m_word & _T_44; // @[el2_lsu.scala 195:159]
  wire  _T_46 = _T_42 | _T_45; // @[el2_lsu.scala 195:126]
  wire  _T_48 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 196:64]
  wire  _T_50 = lsu_lsc_ctl_io_lsu_pkt_m_valid & lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 197:64]
  reg [2:0] _T_52; // @[el2_lsu.scala 490:67]
  reg  lsu_raw_fwd_hi_r; // @[el2_lsu.scala 491:67]
  reg  lsu_raw_fwd_lo_r; // @[el2_lsu.scala 492:67]
  wire [31:0] dma_mem_tag_m = {{29'd0}, _T_52}; // @[el2_lsu.scala 490:57]
  el2_lsu_lsc_ctl lsu_lsc_ctl ( // @[el2_lsu.scala 153:30]
    .clock(lsu_lsc_ctl_clock),
    .reset(lsu_lsc_ctl_reset),
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
    .io_lsu_result_m(lsu_lsc_ctl_io_lsu_result_m),
    .io_lsu_addr_d(lsu_lsc_ctl_io_lsu_addr_d),
    .io_lsu_addr_m(lsu_lsc_ctl_io_lsu_addr_m),
    .io_lsu_addr_r(lsu_lsc_ctl_io_lsu_addr_r),
    .io_end_addr_d(lsu_lsc_ctl_io_end_addr_d),
    .io_end_addr_m(lsu_lsc_ctl_io_end_addr_m),
    .io_end_addr_r(lsu_lsc_ctl_io_end_addr_r),
    .io_store_data_m(lsu_lsc_ctl_io_store_data_m),
    .io_dec_tlu_mrac_ff(lsu_lsc_ctl_io_dec_tlu_mrac_ff),
    .io_lsu_commit_r(lsu_lsc_ctl_io_lsu_commit_r),
    .io_lsu_single_ecc_error_incr(lsu_lsc_ctl_io_lsu_single_ecc_error_incr),
    .io_lsu_error_pkt_r_exc_valid(lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid),
    .io_lsu_error_pkt_r_single_ecc_error(lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error),
    .io_lsu_error_pkt_r_inst_type(lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type),
    .io_lsu_error_pkt_r_exc_type(lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type),
    .io_lsu_error_pkt_r_mscause(lsu_lsc_ctl_io_lsu_error_pkt_r_mscause),
    .io_lsu_error_pkt_r_addr(lsu_lsc_ctl_io_lsu_error_pkt_r_addr),
    .io_lsu_fir_addr(lsu_lsc_ctl_io_lsu_fir_addr),
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
  el2_lsu_dccm_ctl dccm_ctl ( // @[el2_lsu.scala 154:30]
    .reset(dccm_ctl_reset),
    .io_lsu_c2_m_clk(dccm_ctl_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(dccm_ctl_io_lsu_c2_r_clk),
    .io_lsu_free_c2_clk(dccm_ctl_io_lsu_free_c2_clk),
    .io_lsu_store_c1_r_clk(dccm_ctl_io_lsu_store_c1_r_clk),
    .io_clk(dccm_ctl_io_clk),
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
    .io_store_data_hi_r(dccm_ctl_io_store_data_hi_r),
    .io_store_data_lo_r(dccm_ctl_io_store_data_lo_r),
    .io_store_datafn_hi_r(dccm_ctl_io_store_datafn_hi_r),
    .io_store_datafn_lo_r(dccm_ctl_io_store_datafn_lo_r),
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
  el2_lsu_stbuf stbuf ( // @[el2_lsu.scala 155:30]
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
    .io_stbuf_reqvld_any(stbuf_io_stbuf_reqvld_any),
    .io_stbuf_reqvld_flushed_any(stbuf_io_stbuf_reqvld_flushed_any),
    .io_stbuf_addr_any(stbuf_io_stbuf_addr_any),
    .io_stbuf_data_any(stbuf_io_stbuf_data_any),
    .io_lsu_stbuf_full_any(stbuf_io_lsu_stbuf_full_any),
    .io_ldst_stbuf_reqvld_r(stbuf_io_ldst_stbuf_reqvld_r),
    .io_stbuf_fwddata_hi_m(stbuf_io_stbuf_fwddata_hi_m),
    .io_stbuf_fwddata_lo_m(stbuf_io_stbuf_fwddata_lo_m),
    .io_stbuf_fwdbyteen_hi_m(stbuf_io_stbuf_fwdbyteen_hi_m),
    .io_stbuf_fwdbyteen_lo_m(stbuf_io_stbuf_fwdbyteen_lo_m)
  );
  el2_lsu_ecc ecc ( // @[el2_lsu.scala 156:30]
    .clock(ecc_clock),
    .reset(ecc_reset),
    .io_lsu_c2_r_clk(ecc_io_lsu_c2_r_clk),
    .io_lsu_pkt_m_load(ecc_io_lsu_pkt_m_load),
    .io_lsu_pkt_m_store(ecc_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_dma(ecc_io_lsu_pkt_m_dma),
    .io_lsu_pkt_m_valid(ecc_io_lsu_pkt_m_valid),
    .io_dec_tlu_core_ecc_disable(ecc_io_dec_tlu_core_ecc_disable),
    .io_lsu_addr_m(ecc_io_lsu_addr_m),
    .io_end_addr_m(ecc_io_end_addr_m),
    .io_dccm_rdata_hi_m(ecc_io_dccm_rdata_hi_m),
    .io_dccm_rdata_lo_m(ecc_io_dccm_rdata_lo_m),
    .io_dccm_data_ecc_hi_m(ecc_io_dccm_data_ecc_hi_m),
    .io_dccm_data_ecc_lo_m(ecc_io_dccm_data_ecc_lo_m),
    .io_ld_single_ecc_error_r(ecc_io_ld_single_ecc_error_r),
    .io_lsu_dccm_rden_m(ecc_io_lsu_dccm_rden_m),
    .io_addr_in_dccm_m(ecc_io_addr_in_dccm_m),
    .io_sec_data_hi_r(ecc_io_sec_data_hi_r),
    .io_sec_data_lo_r(ecc_io_sec_data_lo_r),
    .io_sec_data_hi_m(ecc_io_sec_data_hi_m),
    .io_sec_data_lo_m(ecc_io_sec_data_lo_m),
    .io_sec_data_hi_r_ff(ecc_io_sec_data_hi_r_ff),
    .io_sec_data_lo_r_ff(ecc_io_sec_data_lo_r_ff),
    .io_single_ecc_error_hi_r(ecc_io_single_ecc_error_hi_r),
    .io_single_ecc_error_lo_r(ecc_io_single_ecc_error_lo_r),
    .io_lsu_single_ecc_error_r(ecc_io_lsu_single_ecc_error_r),
    .io_lsu_double_ecc_error_r(ecc_io_lsu_double_ecc_error_r),
    .io_lsu_single_ecc_error_m(ecc_io_lsu_single_ecc_error_m),
    .io_lsu_double_ecc_error_m(ecc_io_lsu_double_ecc_error_m)
  );
  el2_lsu_trigger trigger ( // @[el2_lsu.scala 157:30]
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
  el2_lsu_clkdomain clkdomain ( // @[el2_lsu.scala 158:30]
    .clock(clkdomain_clock),
    .reset(clkdomain_reset),
    .io_clk_override(clkdomain_io_clk_override),
    .io_dma_dccm_req(clkdomain_io_dma_dccm_req),
    .io_ldst_stbuf_reqvld_r(clkdomain_io_ldst_stbuf_reqvld_r),
    .io_stbuf_reqvld_any(clkdomain_io_stbuf_reqvld_any),
    .io_stbuf_reqvld_flushed_any(clkdomain_io_stbuf_reqvld_flushed_any),
    .io_lsu_bus_clk_en(clkdomain_io_lsu_bus_clk_en),
    .io_lsu_p_valid(clkdomain_io_lsu_p_valid),
    .io_lsu_pkt_d_store(clkdomain_io_lsu_pkt_d_store),
    .io_lsu_pkt_d_valid(clkdomain_io_lsu_pkt_d_valid),
    .io_lsu_pkt_m_store(clkdomain_io_lsu_pkt_m_store),
    .io_lsu_pkt_m_valid(clkdomain_io_lsu_pkt_m_valid),
    .io_lsu_c1_m_clk(clkdomain_io_lsu_c1_m_clk),
    .io_lsu_c1_r_clk(clkdomain_io_lsu_c1_r_clk),
    .io_lsu_c2_m_clk(clkdomain_io_lsu_c2_m_clk),
    .io_lsu_c2_r_clk(clkdomain_io_lsu_c2_r_clk),
    .io_lsu_stbuf_c1_clk(clkdomain_io_lsu_stbuf_c1_clk),
    .io_lsu_free_c2_clk(clkdomain_io_lsu_free_c2_clk),
    .io_scan_mode(clkdomain_io_scan_mode)
  );
  assign io_lsu_load_stall_any = dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 166:25]
  assign io_lsu_store_stall_any = _T | dccm_ctl_io_ld_single_ecc_error_r_ff; // @[el2_lsu.scala 165:26]
  assign io_lsu_fastint_stall_any = dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 167:28]
  assign io_lsu_idle_any = 1'h0; // @[el2_lsu.scala 187:19]
  assign io_lsu_fir_addr = lsu_lsc_ctl_io_lsu_fir_addr; // @[el2_lsu.scala 233:50]
  assign io_lsu_fir_error = 2'h0; // @[el2_lsu.scala 234:50]
  assign io_lsu_single_ecc_error_incr = lsu_lsc_ctl_io_lsu_single_ecc_error_incr; // @[el2_lsu.scala 231:50]
  assign io_lsu_error_pkt_r_exc_valid = lsu_lsc_ctl_io_lsu_error_pkt_r_exc_valid; // @[el2_lsu.scala 232:50]
  assign io_lsu_error_pkt_r_single_ecc_error = lsu_lsc_ctl_io_lsu_error_pkt_r_single_ecc_error; // @[el2_lsu.scala 232:50]
  assign io_lsu_error_pkt_r_inst_type = lsu_lsc_ctl_io_lsu_error_pkt_r_inst_type; // @[el2_lsu.scala 232:50]
  assign io_lsu_error_pkt_r_exc_type = lsu_lsc_ctl_io_lsu_error_pkt_r_exc_type; // @[el2_lsu.scala 232:50]
  assign io_lsu_error_pkt_r_mscause = lsu_lsc_ctl_io_lsu_error_pkt_r_mscause; // @[el2_lsu.scala 232:50]
  assign io_lsu_error_pkt_r_addr = lsu_lsc_ctl_io_lsu_error_pkt_r_addr; // @[el2_lsu.scala 232:50]
  assign io_lsu_imprecise_error_load_any = 1'h0; // @[el2_lsu.scala 434:50]
  assign io_lsu_imprecise_error_store_any = 1'h0; // @[el2_lsu.scala 435:50]
  assign io_lsu_imprecise_error_addr_any = 32'h0; // @[el2_lsu.scala 436:50]
  assign io_lsu_nonblock_load_valid_m = 1'h0; // @[el2_lsu.scala 437:50]
  assign io_lsu_nonblock_load_tag_m = 2'h0; // @[el2_lsu.scala 438:50]
  assign io_lsu_nonblock_load_inv_r = 1'h0; // @[el2_lsu.scala 439:50]
  assign io_lsu_nonblock_load_inv_tag_r = 2'h0; // @[el2_lsu.scala 440:50]
  assign io_lsu_nonblock_load_data_valid = 1'h0; // @[el2_lsu.scala 441:50]
  assign io_lsu_nonblock_load_data_error = 1'h0; // @[el2_lsu.scala 442:50]
  assign io_lsu_nonblock_load_data_tag = 2'h0; // @[el2_lsu.scala 443:50]
  assign io_lsu_nonblock_load_data = 32'h0; // @[el2_lsu.scala 444:50]
  assign io_lsu_pmu_load_external_m = _T_48 & lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 196:30]
  assign io_lsu_pmu_store_external_m = _T_50 & lsu_lsc_ctl_io_addr_external_m; // @[el2_lsu.scala 197:30]
  assign io_lsu_pmu_misaligned_m = lsu_lsc_ctl_io_lsu_pkt_m_valid & _T_46; // @[el2_lsu.scala 195:26]
  assign io_lsu_pmu_bus_trxn = 1'h0; // @[el2_lsu.scala 445:50]
  assign io_lsu_pmu_bus_misaligned = 1'h0; // @[el2_lsu.scala 446:50]
  assign io_lsu_pmu_bus_error = 1'h0; // @[el2_lsu.scala 447:50]
  assign io_lsu_pmu_bus_busy = 1'h0; // @[el2_lsu.scala 448:50]
  assign io_lsu_trigger_match_m = trigger_io_lsu_trigger_match_m; // @[el2_lsu.scala 381:50]
  assign io_dccm_wren = dccm_ctl_io_dccm_wren; // @[el2_lsu.scala 303:50]
  assign io_dccm_rden = dccm_ctl_io_dccm_rden; // @[el2_lsu.scala 304:50]
  assign io_dccm_wr_addr_lo = dccm_ctl_io_dccm_wr_addr_lo; // @[el2_lsu.scala 305:50]
  assign io_dccm_wr_addr_hi = dccm_ctl_io_dccm_wr_addr_hi; // @[el2_lsu.scala 308:50]
  assign io_dccm_rd_addr_lo = dccm_ctl_io_dccm_rd_addr_lo; // @[el2_lsu.scala 307:50]
  assign io_dccm_rd_addr_hi = dccm_ctl_io_dccm_rd_addr_hi; // @[el2_lsu.scala 310:50]
  assign io_dccm_wr_data_lo = dccm_ctl_io_dccm_wr_data_lo; // @[el2_lsu.scala 306:50]
  assign io_dccm_wr_data_hi = dccm_ctl_io_dccm_wr_data_hi; // @[el2_lsu.scala 309:50]
  assign io_picm_wren = dccm_ctl_io_picm_wren; // @[el2_lsu.scala 311:50]
  assign io_picm_rden = dccm_ctl_io_picm_rden; // @[el2_lsu.scala 312:50]
  assign io_picm_mken = dccm_ctl_io_picm_mken; // @[el2_lsu.scala 313:50]
  assign io_picm_rdaddr = dccm_ctl_io_picm_rdaddr; // @[el2_lsu.scala 314:50]
  assign io_picm_wraddr = dccm_ctl_io_picm_wraddr; // @[el2_lsu.scala 315:50]
  assign io_picm_wr_data = dccm_ctl_io_picm_wr_data; // @[el2_lsu.scala 316:50]
  assign io_lsu_axi_awvalid = 1'h0; // @[el2_lsu.scala 449:50]
  assign io_lsu_axi_awlock = 1'h0; // @[el2_lsu.scala 457:50]
  assign io_lsu_axi_awid = 3'h0; // @[el2_lsu.scala 451:50]
  assign io_lsu_axi_awaddr = 32'h0; // @[el2_lsu.scala 452:50]
  assign io_lsu_axi_awregion = 4'h0; // @[el2_lsu.scala 453:50]
  assign io_lsu_axi_awlen = 8'h0; // @[el2_lsu.scala 454:50]
  assign io_lsu_axi_awsize = 3'h0; // @[el2_lsu.scala 455:50]
  assign io_lsu_axi_awburst = 2'h0; // @[el2_lsu.scala 456:50]
  assign io_lsu_axi_awcache = 4'h0; // @[el2_lsu.scala 458:50]
  assign io_lsu_axi_awprot = 3'h0; // @[el2_lsu.scala 459:50]
  assign io_lsu_axi_awqos = 4'h0; // @[el2_lsu.scala 460:50]
  assign io_lsu_axi_wvalid = 1'h0; // @[el2_lsu.scala 461:50]
  assign io_lsu_axi_wdata = 64'h0; // @[el2_lsu.scala 463:50]
  assign io_lsu_axi_wstrb = 8'h0; // @[el2_lsu.scala 464:50]
  assign io_lsu_axi_wlast = 1'h0; // @[el2_lsu.scala 465:50]
  assign io_lsu_axi_bready = 1'h0; // @[el2_lsu.scala 467:50]
  assign io_lsu_axi_arvalid = 1'h0; // @[el2_lsu.scala 470:50]
  assign io_lsu_axi_arlock = 1'h0; // @[el2_lsu.scala 478:50]
  assign io_lsu_axi_arid = 3'h0; // @[el2_lsu.scala 472:50]
  assign io_lsu_axi_araddr = 32'h0; // @[el2_lsu.scala 473:50]
  assign io_lsu_axi_arregion = 4'h0; // @[el2_lsu.scala 474:50]
  assign io_lsu_axi_arlen = 8'h0; // @[el2_lsu.scala 475:50]
  assign io_lsu_axi_arsize = 3'h0; // @[el2_lsu.scala 476:50]
  assign io_lsu_axi_arburst = 2'h0; // @[el2_lsu.scala 477:50]
  assign io_lsu_axi_arcache = 4'h0; // @[el2_lsu.scala 479:50]
  assign io_lsu_axi_arprot = 3'h0; // @[el2_lsu.scala 480:50]
  assign io_lsu_axi_arqos = 4'h0; // @[el2_lsu.scala 481:50]
  assign io_lsu_axi_rready = 1'h0; // @[el2_lsu.scala 483:50]
  assign io_dccm_dma_rvalid = dccm_ctl_io_dccm_dma_rvalid; // @[el2_lsu.scala 299:50]
  assign io_dccm_dma_ecc_error = dccm_ctl_io_dccm_dma_ecc_error; // @[el2_lsu.scala 300:50]
  assign io_dccm_dma_rtag = dccm_ctl_io_dccm_dma_rtag; // @[el2_lsu.scala 301:50]
  assign io_dccm_dma_rdata = dccm_ctl_io_dccm_dma_rdata; // @[el2_lsu.scala 302:50]
  assign io_dccm_ready = ~_T_8; // @[el2_lsu.scala 173:17]
  assign lsu_lsc_ctl_clock = clock;
  assign lsu_lsc_ctl_reset = reset;
  assign lsu_lsc_ctl_io_lsu_ld_data_corr_r = dccm_ctl_io_lsu_ld_data_corr_r; // @[el2_lsu.scala 207:50]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_r = ecc_io_lsu_single_ecc_error_r; // @[el2_lsu.scala 208:50]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 209:50]
  assign lsu_lsc_ctl_io_lsu_ld_data_m = dccm_ctl_io_lsu_ld_data_m; // @[el2_lsu.scala 210:50]
  assign lsu_lsc_ctl_io_lsu_single_ecc_error_m = ecc_io_lsu_single_ecc_error_m; // @[el2_lsu.scala 211:50]
  assign lsu_lsc_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 212:50]
  assign lsu_lsc_ctl_io_flush_m_up = io_dec_tlu_flush_lower_r; // @[el2_lsu.scala 213:50]
  assign lsu_lsc_ctl_io_flush_r = io_dec_tlu_i0_kill_writeb_r; // @[el2_lsu.scala 214:50]
  assign lsu_lsc_ctl_io_exu_lsu_rs1_d = io_exu_lsu_rs1_d; // @[el2_lsu.scala 215:50]
  assign lsu_lsc_ctl_io_exu_lsu_rs2_d = io_exu_lsu_rs2_d; // @[el2_lsu.scala 216:50]
  assign lsu_lsc_ctl_io_lsu_p_fast_int = io_lsu_p_fast_int; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_by = io_lsu_p_by; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_half = io_lsu_p_half; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_word = io_lsu_p_word; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_dword = io_lsu_p_dword; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_load = io_lsu_p_load; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_store = io_lsu_p_store; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_unsign = io_lsu_p_unsign; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_dma = io_lsu_p_dma; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_store_data_bypass_d = io_lsu_p_store_data_bypass_d; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_load_ldst_bypass_d = io_lsu_p_load_ldst_bypass_d; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_store_data_bypass_m = io_lsu_p_store_data_bypass_m; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_lsu_p_valid = io_lsu_p_valid; // @[el2_lsu.scala 217:50]
  assign lsu_lsc_ctl_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 218:50]
  assign lsu_lsc_ctl_io_dec_lsu_offset_d = io_dec_lsu_offset_d; // @[el2_lsu.scala 219:50]
  assign lsu_lsc_ctl_io_picm_mask_data_m = dccm_ctl_io_picm_mask_data_m; // @[el2_lsu.scala 220:50]
  assign lsu_lsc_ctl_io_dec_tlu_mrac_ff = io_dec_tlu_mrac_ff; // @[el2_lsu.scala 227:50]
  assign lsu_lsc_ctl_io_dma_dccm_req = io_dma_dccm_req; // @[el2_lsu.scala 222:50]
  assign lsu_lsc_ctl_io_dma_mem_addr = io_dma_mem_addr; // @[el2_lsu.scala 223:50]
  assign lsu_lsc_ctl_io_dma_mem_sz = io_dma_mem_sz; // @[el2_lsu.scala 224:50]
  assign lsu_lsc_ctl_io_dma_mem_write = io_dma_mem_write; // @[el2_lsu.scala 225:50]
  assign lsu_lsc_ctl_io_dma_mem_wdata = io_dma_mem_wdata; // @[el2_lsu.scala 226:50]
  assign dccm_ctl_reset = reset;
  assign dccm_ctl_io_lsu_c2_m_clk = clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 239:50]
  assign dccm_ctl_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_m_clk; // @[el2_lsu.scala 240:50]
  assign dccm_ctl_io_lsu_free_c2_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 241:50]
  assign dccm_ctl_io_lsu_store_c1_r_clk = clkdomain_io_lsu_c1_r_clk; // @[el2_lsu.scala 243:50]
  assign dccm_ctl_io_clk = clock; // @[el2_lsu.scala 244:50]
  assign dccm_ctl_io_lsu_pkt_d_word = lsu_lsc_ctl_io_lsu_pkt_d_word; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_d_dword = lsu_lsc_ctl_io_lsu_pkt_d_dword; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_d_load = lsu_lsc_ctl_io_lsu_pkt_d_load; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_d_store = lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_d_dma = lsu_lsc_ctl_io_lsu_pkt_d_dma; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 245:50]
  assign dccm_ctl_io_lsu_pkt_m_by = lsu_lsc_ctl_io_lsu_pkt_m_by; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_half = lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_word = lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 246:50]
  assign dccm_ctl_io_lsu_pkt_r_by = lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_half = lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_word = lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_load = lsu_lsc_ctl_io_lsu_pkt_r_load; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_store = lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_dma = lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 247:50]
  assign dccm_ctl_io_addr_in_dccm_d = lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 248:50]
  assign dccm_ctl_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 249:50]
  assign dccm_ctl_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 250:50]
  assign dccm_ctl_io_addr_in_pic_d = lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 251:50]
  assign dccm_ctl_io_addr_in_pic_m = lsu_lsc_ctl_io_addr_in_pic_m; // @[el2_lsu.scala 252:50]
  assign dccm_ctl_io_addr_in_pic_r = lsu_lsc_ctl_io_addr_in_pic_r; // @[el2_lsu.scala 253:50]
  assign dccm_ctl_io_lsu_raw_fwd_lo_r = lsu_raw_fwd_lo_r; // @[el2_lsu.scala 254:50]
  assign dccm_ctl_io_lsu_raw_fwd_hi_r = lsu_raw_fwd_hi_r; // @[el2_lsu.scala 255:50]
  assign dccm_ctl_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 256:50]
  assign dccm_ctl_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d[15:0]; // @[el2_lsu.scala 257:50]
  assign dccm_ctl_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[el2_lsu.scala 258:50]
  assign dccm_ctl_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r[15:0]; // @[el2_lsu.scala 259:50]
  assign dccm_ctl_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[el2_lsu.scala 260:50]
  assign dccm_ctl_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[el2_lsu.scala 261:50]
  assign dccm_ctl_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r[15:0]; // @[el2_lsu.scala 262:50]
  assign dccm_ctl_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 263:50]
  assign dccm_ctl_io_stbuf_addr_any = stbuf_io_stbuf_addr_any; // @[el2_lsu.scala 264:50]
  assign dccm_ctl_io_stbuf_data_any = stbuf_io_stbuf_data_any; // @[el2_lsu.scala 265:50]
  assign dccm_ctl_io_stbuf_fwddata_hi_m = stbuf_io_stbuf_fwddata_hi_m; // @[el2_lsu.scala 267:50]
  assign dccm_ctl_io_stbuf_fwddata_lo_m = stbuf_io_stbuf_fwddata_lo_m; // @[el2_lsu.scala 268:50]
  assign dccm_ctl_io_stbuf_fwdbyteen_lo_m = stbuf_io_stbuf_fwdbyteen_lo_m; // @[el2_lsu.scala 269:50]
  assign dccm_ctl_io_stbuf_fwdbyteen_hi_m = stbuf_io_stbuf_fwdbyteen_hi_m; // @[el2_lsu.scala 270:50]
  assign dccm_ctl_io_lsu_double_ecc_error_r = ecc_io_lsu_double_ecc_error_r; // @[el2_lsu.scala 271:50]
  assign dccm_ctl_io_single_ecc_error_hi_r = ecc_io_single_ecc_error_hi_r; // @[el2_lsu.scala 272:50]
  assign dccm_ctl_io_single_ecc_error_lo_r = ecc_io_single_ecc_error_lo_r; // @[el2_lsu.scala 273:50]
  assign dccm_ctl_io_sec_data_hi_r_ff = ecc_io_sec_data_hi_r_ff; // @[el2_lsu.scala 276:50]
  assign dccm_ctl_io_sec_data_lo_r_ff = ecc_io_sec_data_lo_r_ff; // @[el2_lsu.scala 277:50]
  assign dccm_ctl_io_lsu_double_ecc_error_m = ecc_io_lsu_double_ecc_error_m; // @[el2_lsu.scala 280:50]
  assign dccm_ctl_io_sec_data_hi_m = ecc_io_sec_data_hi_m; // @[el2_lsu.scala 281:50]
  assign dccm_ctl_io_sec_data_lo_m = ecc_io_sec_data_lo_m; // @[el2_lsu.scala 282:50]
  assign dccm_ctl_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 283:50]
  assign dccm_ctl_io_dma_dccm_wen = _T_10 & lsu_lsc_ctl_io_addr_in_dccm_d; // @[el2_lsu.scala 284:50]
  assign dccm_ctl_io_dma_pic_wen = _T_10 & lsu_lsc_ctl_io_addr_in_pic_d; // @[el2_lsu.scala 285:50]
  assign dccm_ctl_io_dma_mem_tag_m = dma_mem_tag_m[2:0]; // @[el2_lsu.scala 286:50]
  assign dccm_ctl_io_dma_mem_addr = io_dma_mem_addr; // @[el2_lsu.scala 287:50]
  assign dccm_ctl_io_dma_mem_wdata = io_dma_mem_wdata; // @[el2_lsu.scala 288:50]
  assign dccm_ctl_io_dma_dccm_wdata_lo = dma_dccm_wdata[31:0]; // @[el2_lsu.scala 289:50]
  assign dccm_ctl_io_dma_dccm_wdata_hi = dma_dccm_wdata[63:32]; // @[el2_lsu.scala 290:50]
  assign dccm_ctl_io_dccm_rd_data_lo = io_dccm_rd_data_lo; // @[el2_lsu.scala 293:50]
  assign dccm_ctl_io_dccm_rd_data_hi = io_dccm_rd_data_hi; // @[el2_lsu.scala 294:50]
  assign dccm_ctl_io_picm_rd_data = io_picm_rd_data; // @[el2_lsu.scala 295:50]
  assign dccm_ctl_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 296:50]
  assign stbuf_clock = clock;
  assign stbuf_reset = reset;
  assign stbuf_io_lsu_c1_m_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 319:50]
  assign stbuf_io_lsu_c1_r_clk = clkdomain_io_lsu_c1_m_clk; // @[el2_lsu.scala 320:56]
  assign stbuf_io_lsu_stbuf_c1_clk = clkdomain_io_lsu_stbuf_c1_clk; // @[el2_lsu.scala 321:54]
  assign stbuf_io_lsu_free_c2_clk = clkdomain_io_lsu_free_c2_clk; // @[el2_lsu.scala 322:54]
  assign stbuf_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 323:56]
  assign stbuf_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 323:56]
  assign stbuf_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 323:56]
  assign stbuf_io_lsu_pkt_r_by = lsu_lsc_ctl_io_lsu_pkt_r_by; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_half = lsu_lsc_ctl_io_lsu_pkt_r_half; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_word = lsu_lsc_ctl_io_lsu_pkt_r_word; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_dword = lsu_lsc_ctl_io_lsu_pkt_r_dword; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_store = lsu_lsc_ctl_io_lsu_pkt_r_store; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_dma = lsu_lsc_ctl_io_lsu_pkt_r_dma; // @[el2_lsu.scala 324:56]
  assign stbuf_io_lsu_pkt_r_valid = lsu_lsc_ctl_io_lsu_pkt_r_valid; // @[el2_lsu.scala 324:56]
  assign stbuf_io_store_stbuf_reqvld_r = _T_28 & _T_19; // @[el2_lsu.scala 325:56]
  assign stbuf_io_lsu_commit_r = lsu_lsc_ctl_io_lsu_commit_r; // @[el2_lsu.scala 326:50]
  assign stbuf_io_dec_lsu_valid_raw_d = io_dec_lsu_valid_raw_d; // @[el2_lsu.scala 327:50]
  assign stbuf_io_store_data_hi_r = dccm_ctl_io_store_data_hi_r; // @[el2_lsu.scala 328:62]
  assign stbuf_io_store_data_lo_r = dccm_ctl_io_store_data_lo_r; // @[el2_lsu.scala 329:62]
  assign stbuf_io_store_datafn_hi_r = dccm_ctl_io_store_datafn_hi_r; // @[el2_lsu.scala 330:50]
  assign stbuf_io_store_datafn_lo_r = dccm_ctl_io_store_datafn_lo_r; // @[el2_lsu.scala 331:56]
  assign stbuf_io_lsu_stbuf_commit_any = dccm_ctl_io_lsu_stbuf_commit_any; // @[el2_lsu.scala 332:60]
  assign stbuf_io_lsu_addr_d = lsu_lsc_ctl_io_lsu_addr_d[15:0]; // @[el2_lsu.scala 333:64]
  assign stbuf_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 334:64]
  assign stbuf_io_lsu_addr_r = lsu_lsc_ctl_io_lsu_addr_r; // @[el2_lsu.scala 335:64]
  assign stbuf_io_end_addr_d = lsu_lsc_ctl_io_end_addr_d[15:0]; // @[el2_lsu.scala 336:64]
  assign stbuf_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m; // @[el2_lsu.scala 337:64]
  assign stbuf_io_end_addr_r = lsu_lsc_ctl_io_end_addr_r; // @[el2_lsu.scala 338:64]
  assign stbuf_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 339:50]
  assign stbuf_io_addr_in_dccm_r = lsu_lsc_ctl_io_addr_in_dccm_r; // @[el2_lsu.scala 340:56]
  assign ecc_clock = clock;
  assign ecc_reset = reset;
  assign ecc_io_lsu_c2_r_clk = clkdomain_io_lsu_c2_r_clk; // @[el2_lsu.scala 346:52]
  assign ecc_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 347:52]
  assign ecc_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 347:52]
  assign ecc_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 347:52]
  assign ecc_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 347:52]
  assign ecc_io_dec_tlu_core_ecc_disable = io_dec_tlu_core_ecc_disable; // @[el2_lsu.scala 350:50]
  assign ecc_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m[15:0]; // @[el2_lsu.scala 355:58]
  assign ecc_io_end_addr_m = lsu_lsc_ctl_io_end_addr_m[15:0]; // @[el2_lsu.scala 356:58]
  assign ecc_io_dccm_rdata_hi_m = dccm_ctl_io_dccm_rdata_hi_m; // @[el2_lsu.scala 359:54]
  assign ecc_io_dccm_rdata_lo_m = dccm_ctl_io_dccm_rdata_lo_m; // @[el2_lsu.scala 360:54]
  assign ecc_io_dccm_data_ecc_hi_m = dccm_ctl_io_dccm_data_ecc_hi_m; // @[el2_lsu.scala 363:50]
  assign ecc_io_dccm_data_ecc_lo_m = dccm_ctl_io_dccm_data_ecc_lo_m; // @[el2_lsu.scala 364:50]
  assign ecc_io_ld_single_ecc_error_r = dccm_ctl_io_ld_single_ecc_error_r; // @[el2_lsu.scala 365:50]
  assign ecc_io_lsu_dccm_rden_m = dccm_ctl_io_lsu_dccm_rden_m; // @[el2_lsu.scala 367:50]
  assign ecc_io_addr_in_dccm_m = lsu_lsc_ctl_io_addr_in_dccm_m; // @[el2_lsu.scala 368:50]
  assign trigger_io_trigger_pkt_any_0_select = io_trigger_pkt_any_0_select; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_0_match_ = io_trigger_pkt_any_0_match_; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_0_store = io_trigger_pkt_any_0_store; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_0_load = io_trigger_pkt_any_0_load; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_0_tdata2 = io_trigger_pkt_any_0_tdata2; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_1_select = io_trigger_pkt_any_1_select; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_1_match_ = io_trigger_pkt_any_1_match_; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_1_store = io_trigger_pkt_any_1_store; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_1_load = io_trigger_pkt_any_1_load; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_1_tdata2 = io_trigger_pkt_any_1_tdata2; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_2_select = io_trigger_pkt_any_2_select; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_2_match_ = io_trigger_pkt_any_2_match_; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_2_store = io_trigger_pkt_any_2_store; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_2_load = io_trigger_pkt_any_2_load; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_2_tdata2 = io_trigger_pkt_any_2_tdata2; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_3_select = io_trigger_pkt_any_3_select; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_3_match_ = io_trigger_pkt_any_3_match_; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_3_store = io_trigger_pkt_any_3_store; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_3_load = io_trigger_pkt_any_3_load; // @[el2_lsu.scala 376:50]
  assign trigger_io_trigger_pkt_any_3_tdata2 = io_trigger_pkt_any_3_tdata2; // @[el2_lsu.scala 376:50]
  assign trigger_io_lsu_pkt_m_half = lsu_lsc_ctl_io_lsu_pkt_m_half; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_pkt_m_word = lsu_lsc_ctl_io_lsu_pkt_m_word; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_pkt_m_load = lsu_lsc_ctl_io_lsu_pkt_m_load; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_pkt_m_dma = lsu_lsc_ctl_io_lsu_pkt_m_dma; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 377:50]
  assign trigger_io_lsu_addr_m = lsu_lsc_ctl_io_lsu_addr_m; // @[el2_lsu.scala 378:50]
  assign trigger_io_store_data_m = lsu_lsc_ctl_io_store_data_m; // @[el2_lsu.scala 379:50]
  assign clkdomain_clock = clock;
  assign clkdomain_reset = reset;
  assign clkdomain_io_clk_override = io_clk_override; // @[el2_lsu.scala 386:50]
  assign clkdomain_io_dma_dccm_req = io_dma_dccm_req; // @[el2_lsu.scala 388:50]
  assign clkdomain_io_ldst_stbuf_reqvld_r = stbuf_io_ldst_stbuf_reqvld_r; // @[el2_lsu.scala 389:50]
  assign clkdomain_io_stbuf_reqvld_any = stbuf_io_stbuf_reqvld_any; // @[el2_lsu.scala 390:50]
  assign clkdomain_io_stbuf_reqvld_flushed_any = stbuf_io_stbuf_reqvld_flushed_any; // @[el2_lsu.scala 391:50]
  assign clkdomain_io_lsu_bus_clk_en = io_lsu_bus_clk_en; // @[el2_lsu.scala 396:50]
  assign clkdomain_io_lsu_p_valid = io_lsu_p_valid; // @[el2_lsu.scala 397:50]
  assign clkdomain_io_lsu_pkt_d_store = lsu_lsc_ctl_io_lsu_pkt_d_store; // @[el2_lsu.scala 398:50]
  assign clkdomain_io_lsu_pkt_d_valid = lsu_lsc_ctl_io_lsu_pkt_d_valid; // @[el2_lsu.scala 398:50]
  assign clkdomain_io_lsu_pkt_m_store = lsu_lsc_ctl_io_lsu_pkt_m_store; // @[el2_lsu.scala 399:50]
  assign clkdomain_io_lsu_pkt_m_valid = lsu_lsc_ctl_io_lsu_pkt_m_valid; // @[el2_lsu.scala 399:50]
  assign clkdomain_io_scan_mode = io_scan_mode; // @[el2_lsu.scala 401:50]
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
