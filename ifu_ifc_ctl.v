module ifu_ifc_ctl(
  input         clock,
  input         reset,
  input         io_exu_flush_final,
  input  [30:0] io_exu_flush_path_final,
  input         io_free_l2clk,
  input         io_scan_mode,
  input         io_ic_hit_f,
  input         io_ifu_ic_mb_empty,
  input         io_ifu_fb_consume1,
  input         io_ifu_fb_consume2,
  input         io_ifu_bp_hit_taken_f,
  input  [30:0] io_ifu_bp_btb_target_f,
  input         io_ic_dma_active,
  input         io_ic_write_stall,
  input         io_dec_ifc_dec_tlu_flush_noredir_wb,
  input  [31:0] io_dec_ifc_dec_tlu_mrac_ff,
  output        io_dec_ifc_ifu_pmu_fetch_stall,
  input         io_dma_ifc_dma_iccm_stall_any,
  output [30:0] io_ifc_fetch_addr_f,
  output [30:0] io_ifc_fetch_addr_bf,
  output        io_ifc_fetch_req_f,
  output        io_ifc_fetch_uncacheable_bf,
  output        io_ifc_fetch_req_bf,
  output        io_ifc_fetch_req_bf_raw,
  output        io_ifc_iccm_access_bf,
  output        io_ifc_region_acc_fault_bf,
  output        io_ifc_dma_access_ok
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  dma_iccm_stall_any_f; // @[Reg.scala 27:20]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[ifu_ifc_ctl.scala 62:36]
  wire  _T_1 = io_dma_ifc_dma_iccm_stall_any ^ dma_iccm_stall_any_f; // @[lib.scala 458:21]
  wire  _T_2 = |_T_1; // @[lib.scala 458:29]
  wire  _T_56 = ~io_ic_hit_f; // @[ifu_ifc_ctl.scala 97:34]
  wire  _T_57 = io_ifc_fetch_req_f & _T_56; // @[ifu_ifc_ctl.scala 97:32]
  wire  _T_58 = ~io_exu_flush_final; // @[ifu_ifc_ctl.scala 97:49]
  wire  miss_f = _T_57 & _T_58; // @[ifu_ifc_ctl.scala 97:47]
  reg  miss_a; // @[Reg.scala 27:20]
  wire  _T_5 = miss_f ^ miss_a; // @[lib.scala 436:21]
  wire  _T_6 = |_T_5; // @[lib.scala 436:29]
  wire  _T_9 = ~io_ifc_fetch_req_f; // @[ifu_ifc_ctl.scala 67:53]
  wire  _T_11 = _T_9 | _T_56; // @[ifu_ifc_ctl.scala 67:73]
  wire  _T_12 = _T_58 & _T_11; // @[ifu_ifc_ctl.scala 67:50]
  wire  _T_14 = _T_58 & io_ifc_fetch_req_f; // @[ifu_ifc_ctl.scala 68:49]
  wire  _T_15 = _T_14 & io_ifu_bp_hit_taken_f; // @[ifu_ifc_ctl.scala 68:70]
  wire  _T_16 = _T_15 & io_ic_hit_f; // @[ifu_ifc_ctl.scala 68:94]
  wire  _T_19 = ~io_ifu_bp_hit_taken_f; // @[ifu_ifc_ctl.scala 69:73]
  wire  _T_20 = _T_14 & _T_19; // @[ifu_ifc_ctl.scala 69:71]
  wire  _T_21 = _T_20 & io_ic_hit_f; // @[ifu_ifc_ctl.scala 69:96]
  wire [30:0] _T_26 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_27 = _T_12 ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_28 = _T_16 ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] address_upper = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[ifu_ifc_ctl.scala 84:48]
  wire  _T_38 = address_upper[4] ^ io_ifc_fetch_addr_f[5]; // @[ifu_ifc_ctl.scala 85:63]
  wire  _T_39 = ~_T_38; // @[ifu_ifc_ctl.scala 85:24]
  wire  fetch_addr_next_0 = _T_39 & io_ifc_fetch_addr_f[0]; // @[ifu_ifc_ctl.scala 85:109]
  wire [30:0] fetch_addr_next = {address_upper,fetch_addr_next_0}; // @[Cat.scala 29:58]
  wire [30:0] _T_29 = _T_21 ? fetch_addr_next : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_30 = _T_26 | _T_27; // @[Mux.scala 27:72]
  wire [30:0] _T_31 = _T_30 | _T_28; // @[Mux.scala 27:72]
  reg [1:0] state; // @[Reg.scala 27:20]
  wire  idle = state == 2'h0; // @[ifu_ifc_ctl.scala 129:17]
  wire  _T_44 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[ifu_ifc_ctl.scala 92:91]
  wire  _T_45 = ~_T_44; // @[ifu_ifc_ctl.scala 92:70]
  wire [3:0] _T_133 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_93 = ~io_ifu_fb_consume2; // @[ifu_ifc_ctl.scala 115:38]
  wire  _T_94 = io_ifu_fb_consume1 & _T_93; // @[ifu_ifc_ctl.scala 115:36]
  wire  _T_96 = _T_9 | miss_f; // @[ifu_ifc_ctl.scala 115:81]
  wire  _T_97 = _T_94 & _T_96; // @[ifu_ifc_ctl.scala 115:58]
  wire  _T_98 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[ifu_ifc_ctl.scala 116:25]
  wire  fb_right = _T_97 | _T_98; // @[ifu_ifc_ctl.scala 115:92]
  wire  _T_110 = _T_58 & fb_right; // @[ifu_ifc_ctl.scala 123:16]
  reg [3:0] fb_write_f; // @[Reg.scala 27:20]
  wire [3:0] _T_113 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_134 = _T_110 ? _T_113 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_138 = _T_133 | _T_134; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_96; // @[ifu_ifc_ctl.scala 118:36]
  wire  _T_115 = _T_58 & fb_right2; // @[ifu_ifc_ctl.scala 124:16]
  wire [3:0] _T_118 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_135 = _T_115 ? _T_118 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_139 = _T_138 | _T_135; // @[Mux.scala 27:72]
  wire  _T_103 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[ifu_ifc_ctl.scala 119:56]
  wire  _T_104 = ~_T_103; // @[ifu_ifc_ctl.scala 119:35]
  wire  _T_105 = io_ifc_fetch_req_f & _T_104; // @[ifu_ifc_ctl.scala 119:33]
  wire  _T_106 = ~miss_f; // @[ifu_ifc_ctl.scala 119:80]
  wire  fb_left = _T_105 & _T_106; // @[ifu_ifc_ctl.scala 119:78]
  wire  _T_120 = _T_58 & fb_left; // @[ifu_ifc_ctl.scala 125:16]
  wire [3:0] _T_123 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_136 = _T_120 ? _T_123 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_140 = _T_139 | _T_136; // @[Mux.scala 27:72]
  wire  _T_125 = ~fb_right; // @[ifu_ifc_ctl.scala 126:18]
  wire  _T_126 = _T_58 & _T_125; // @[ifu_ifc_ctl.scala 126:16]
  wire  _T_127 = ~fb_right2; // @[ifu_ifc_ctl.scala 126:30]
  wire  _T_128 = _T_126 & _T_127; // @[ifu_ifc_ctl.scala 126:28]
  wire  _T_129 = ~fb_left; // @[ifu_ifc_ctl.scala 126:43]
  wire  _T_130 = _T_128 & _T_129; // @[ifu_ifc_ctl.scala 126:41]
  wire [3:0] _T_137 = _T_130 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_140 | _T_137; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[ifu_ifc_ctl.scala 132:30]
  wire  _T_46 = fb_full_f_ns & _T_45; // @[ifu_ifc_ctl.scala 92:68]
  wire  _T_47 = ~_T_46; // @[ifu_ifc_ctl.scala 92:53]
  wire  _T_48 = io_ifc_fetch_req_bf_raw & _T_47; // @[ifu_ifc_ctl.scala 92:51]
  wire  _T_49 = ~dma_stall; // @[ifu_ifc_ctl.scala 93:5]
  wire  _T_50 = _T_48 & _T_49; // @[ifu_ifc_ctl.scala 92:114]
  wire  _T_51 = ~io_ic_write_stall; // @[ifu_ifc_ctl.scala 93:18]
  wire  _T_52 = _T_50 & _T_51; // @[ifu_ifc_ctl.scala 93:16]
  wire  _T_53 = ~io_dec_ifc_dec_tlu_flush_noredir_wb; // @[ifu_ifc_ctl.scala 93:39]
  wire  fetch_bf_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[ifu_ifc_ctl.scala 95:37]
  wire  _T_60 = io_ifu_ic_mb_empty | io_exu_flush_final; // @[ifu_ifc_ctl.scala 99:39]
  wire  _T_62 = _T_60 & _T_49; // @[ifu_ifc_ctl.scala 99:61]
  wire  _T_64 = _T_62 & _T_106; // @[ifu_ifc_ctl.scala 99:74]
  wire  _T_65 = ~miss_a; // @[ifu_ifc_ctl.scala 99:86]
  wire  mb_empty_mod = _T_64 & _T_65; // @[ifu_ifc_ctl.scala 99:84]
  wire  goto_idle = io_exu_flush_final & io_dec_ifc_dec_tlu_flush_noredir_wb; // @[ifu_ifc_ctl.scala 101:35]
  wire  _T_69 = io_exu_flush_final & _T_53; // @[ifu_ifc_ctl.scala 103:36]
  wire  leave_idle = _T_69 & idle; // @[ifu_ifc_ctl.scala 103:75]
  wire  _T_72 = ~state[1]; // @[ifu_ifc_ctl.scala 105:23]
  wire  _T_74 = _T_72 & state[0]; // @[ifu_ifc_ctl.scala 105:33]
  wire  _T_75 = _T_74 & miss_f; // @[ifu_ifc_ctl.scala 105:44]
  wire  _T_76 = ~goto_idle; // @[ifu_ifc_ctl.scala 105:55]
  wire  _T_77 = _T_75 & _T_76; // @[ifu_ifc_ctl.scala 105:53]
  wire  _T_79 = ~mb_empty_mod; // @[ifu_ifc_ctl.scala 106:17]
  wire  _T_80 = state[1] & _T_79; // @[ifu_ifc_ctl.scala 106:15]
  wire  _T_82 = _T_80 & _T_76; // @[ifu_ifc_ctl.scala 106:31]
  wire  next_state_1 = _T_77 | _T_82; // @[ifu_ifc_ctl.scala 105:67]
  wire  _T_84 = _T_76 & leave_idle; // @[ifu_ifc_ctl.scala 108:34]
  wire  _T_87 = state[0] & _T_76; // @[ifu_ifc_ctl.scala 108:60]
  wire  next_state_0 = _T_84 | _T_87; // @[ifu_ifc_ctl.scala 108:48]
  wire [1:0] _T_88 = {next_state_1,next_state_0}; // @[Cat.scala 29:58]
  wire [1:0] _T_90 = _T_88 ^ state; // @[lib.scala 436:21]
  wire  _T_91 = |_T_90; // @[lib.scala 436:29]
  wire  wfm = state == 2'h3; // @[ifu_ifc_ctl.scala 130:16]
  reg  fb_full_f; // @[Reg.scala 27:20]
  wire  _T_146 = fb_full_f_ns ^ fb_full_f; // @[lib.scala 436:21]
  wire  _T_147 = |_T_146; // @[lib.scala 436:29]
  wire [3:0] _T_150 = fb_write_ns ^ fb_write_f; // @[lib.scala 436:21]
  wire  _T_151 = |_T_150; // @[lib.scala 436:29]
  wire  _T_154 = _T_44 | io_exu_flush_final; // @[ifu_ifc_ctl.scala 137:61]
  wire  _T_155 = ~_T_154; // @[ifu_ifc_ctl.scala 137:19]
  wire  _T_156 = fb_full_f & _T_155; // @[ifu_ifc_ctl.scala 137:17]
  wire  _T_157 = _T_156 | dma_stall; // @[ifu_ifc_ctl.scala 137:84]
  wire  _T_158 = io_ifc_fetch_req_bf_raw & _T_157; // @[ifu_ifc_ctl.scala 136:68]
  wire [31:0] _T_160 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire  iccm_acc_in_region_bf = _T_160[31:28] == 4'he; // @[lib.scala 84:47]
  wire  iccm_acc_in_range_bf = _T_160[31:16] == 16'hee00; // @[lib.scala 87:29]
  wire  _T_163 = ~io_ifc_iccm_access_bf; // @[ifu_ifc_ctl.scala 143:30]
  wire  _T_166 = fb_full_f & _T_45; // @[ifu_ifc_ctl.scala 144:16]
  wire  _T_167 = _T_163 | _T_166; // @[ifu_ifc_ctl.scala 143:53]
  wire  _T_168 = ~io_ifc_fetch_req_bf; // @[ifu_ifc_ctl.scala 145:13]
  wire  _T_169 = wfm & _T_168; // @[ifu_ifc_ctl.scala 145:11]
  wire  _T_170 = _T_167 | _T_169; // @[ifu_ifc_ctl.scala 144:62]
  wire  _T_171 = _T_170 | idle; // @[ifu_ifc_ctl.scala 145:35]
  wire  _T_173 = _T_171 & _T_58; // @[ifu_ifc_ctl.scala 145:44]
  wire  _T_175 = ~iccm_acc_in_range_bf; // @[ifu_ifc_ctl.scala 147:33]
  wire [4:0] _T_178 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_179 = io_dec_ifc_dec_tlu_mrac_ff >> _T_178; // @[ifu_ifc_ctl.scala 148:61]
  reg  _T_185; // @[Reg.scala 27:20]
  wire  _T_183 = io_ifc_fetch_req_bf ^ _T_185; // @[lib.scala 458:21]
  wire  _T_184 = |_T_183; // @[lib.scala 458:29]
  reg [30:0] _T_188; // @[Reg.scala 27:20]
  assign io_dec_ifc_ifu_pmu_fetch_stall = wfm | _T_158; // @[ifu_ifc_ctl.scala 136:34]
  assign io_ifc_fetch_addr_f = _T_188; // @[ifu_ifc_ctl.scala 152:23]
  assign io_ifc_fetch_addr_bf = _T_31 | _T_29; // @[ifu_ifc_ctl.scala 71:25]
  assign io_ifc_fetch_req_f = _T_185; // @[ifu_ifc_ctl.scala 150:22]
  assign io_ifc_fetch_uncacheable_bf = ~_T_179[0]; // @[ifu_ifc_ctl.scala 148:31]
  assign io_ifc_fetch_req_bf = _T_52 & _T_53; // @[ifu_ifc_ctl.scala 92:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[ifu_ifc_ctl.scala 90:27]
  assign io_ifc_iccm_access_bf = _T_160[31:16] == 16'hee00; // @[ifu_ifc_ctl.scala 142:25]
  assign io_ifc_region_acc_fault_bf = _T_175 & iccm_acc_in_region_bf; // @[ifu_ifc_ctl.scala 147:30]
  assign io_ifc_dma_access_ok = _T_173 | dma_iccm_stall_any_f; // @[ifu_ifc_ctl.scala 143:24]
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
  dma_iccm_stall_any_f = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  miss_a = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  fb_write_f = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  fb_full_f = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_185 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_188 = _RAND_6[30:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    dma_iccm_stall_any_f = 1'h0;
  end
  if (reset) begin
    miss_a = 1'h0;
  end
  if (reset) begin
    state = 2'h0;
  end
  if (reset) begin
    fb_write_f = 4'h0;
  end
  if (reset) begin
    fb_full_f = 1'h0;
  end
  if (reset) begin
    _T_185 = 1'h0;
  end
  if (reset) begin
    _T_188 = 31'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      dma_iccm_stall_any_f <= 1'h0;
    end else if (_T_2) begin
      dma_iccm_stall_any_f <= io_dma_ifc_dma_iccm_stall_any;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      miss_a <= 1'h0;
    end else if (_T_6) begin
      miss_a <= miss_f;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_91) begin
      state <= _T_88;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      fb_write_f <= 4'h0;
    end else if (_T_151) begin
      fb_write_f <= fb_write_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      fb_full_f <= 1'h0;
    end else if (_T_147) begin
      fb_full_f <= fb_full_f_ns;
    end
  end
  always @(posedge io_free_l2clk or posedge reset) begin
    if (reset) begin
      _T_185 <= 1'h0;
    end else if (_T_184) begin
      _T_185 <= io_ifc_fetch_req_bf;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_188 <= 31'h0;
    end else if (fetch_bf_en) begin
      _T_188 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
