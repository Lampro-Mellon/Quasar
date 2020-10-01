module el2_ifu_ifc_ctl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_scan_mode,
  input         io_ic_hit_f,
  input         io_ifu_ic_mb_empty,
  input         io_ifu_fb_consume1,
  input         io_ifu_fb_consume2,
  input         io_dec_tlu_flush_noredir_wb,
  input         io_exu_flush_final,
  input  [30:0] io_exu_flush_path_final,
  input         io_ifu_bp_hit_taken_f,
  input  [30:0] io_ifu_bp_btb_target_f,
  input         io_ic_dma_active,
  input         io_ic_write_stall,
  input         io_dma_iccm_stall_any,
  input  [31:0] io_dec_tlu_mrac_ff,
  output [30:0] io_ifc_fetch_addr_f,
  output [30:0] io_ifc_fetch_addr_bf,
  output        io_ifc_fetch_req_f,
  output        io_ifu_pmu_fetch_stall,
  output        io_ifc_fetch_uncacheable_bf,
  output        io_ifc_fetch_req_bf,
  output        io_ifc_fetch_req_bf_raw,
  output        io_ifc_iccm_access_bf,
  output        io_ifc_region_acc_fault_bf,
  output        io_ifc_dma_access_ok,
  output        io_test
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
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 64:58]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 63:36]
  reg  miss_a; // @[el2_ifu_ifc_ctl.scala 66:44]
  wire  _T_2 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 68:26]
  wire  _T_3 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 68:49]
  wire  _T_4 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 68:71]
  wire  _T_5 = _T_3 | _T_4; // @[el2_ifu_ifc_ctl.scala 68:69]
  wire  sel_last_addr_bf = _T_2 & _T_5; // @[el2_ifu_ifc_ctl.scala 68:46]
  wire  _T_7 = _T_2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 69:46]
  wire  _T_8 = _T_7 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctl.scala 69:67]
  wire  sel_btb_addr_bf = _T_8 & io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 69:92]
  wire  _T_11 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctl.scala 70:69]
  wire  _T_12 = _T_7 & _T_11; // @[el2_ifu_ifc_ctl.scala 70:67]
  wire  sel_next_addr_bf = _T_12 & io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 70:92]
  wire [30:0] _T_17 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_18 = sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_19 = sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] address_upper = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_ifc_ctl.scala 78:48]
  wire  _T_29 = address_upper[4] ^ io_ifc_fetch_addr_f[5]; // @[el2_ifu_ifc_ctl.scala 79:63]
  wire  _T_30 = ~_T_29; // @[el2_ifu_ifc_ctl.scala 79:24]
  wire  fetch_addr_next_0 = _T_30 & io_ifc_fetch_addr_f[0]; // @[el2_ifu_ifc_ctl.scala 79:109]
  wire [30:0] fetch_addr_next = {address_upper,fetch_addr_next_0}; // @[Cat.scala 29:58]
  wire [30:0] _T_20 = sel_next_addr_bf ? fetch_addr_next : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_21 = _T_17 | _T_18; // @[Mux.scala 27:72]
  wire [30:0] _T_22 = _T_21 | _T_19; // @[Mux.scala 27:72]
  reg [1:0] state; // @[el2_ifu_ifc_ctl.scala 103:19]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctl.scala 122:17]
  wire  _T_35 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctl.scala 85:91]
  wire  _T_36 = ~_T_35; // @[el2_ifu_ifc_ctl.scala 85:70]
  wire [3:0] _T_121 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_81 = ~io_ifu_fb_consume2; // @[el2_ifu_ifc_ctl.scala 107:38]
  wire  _T_82 = io_ifu_fb_consume1 & _T_81; // @[el2_ifu_ifc_ctl.scala 107:36]
  wire  _T_48 = io_ifc_fetch_req_f & _T_4; // @[el2_ifu_ifc_ctl.scala 90:32]
  wire  miss_f = _T_48 & _T_2; // @[el2_ifu_ifc_ctl.scala 90:47]
  wire  _T_84 = _T_3 | miss_f; // @[el2_ifu_ifc_ctl.scala 107:81]
  wire  _T_85 = _T_82 & _T_84; // @[el2_ifu_ifc_ctl.scala 107:58]
  wire  _T_86 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 108:25]
  wire  fb_right = _T_85 | _T_86; // @[el2_ifu_ifc_ctl.scala 107:92]
  wire  _T_98 = _T_2 & fb_right; // @[el2_ifu_ifc_ctl.scala 114:16]
  reg [3:0] fb_write_f; // @[el2_ifu_ifc_ctl.scala 127:24]
  wire [3:0] _T_101 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_122 = _T_98 ? _T_101 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_126 = _T_121 | _T_122; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_84; // @[el2_ifu_ifc_ctl.scala 110:36]
  wire  _T_103 = _T_2 & fb_right2; // @[el2_ifu_ifc_ctl.scala 115:16]
  wire [3:0] _T_106 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_123 = _T_103 ? _T_106 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_127 = _T_126 | _T_123; // @[Mux.scala 27:72]
  wire  _T_91 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[el2_ifu_ifc_ctl.scala 111:56]
  wire  _T_92 = ~_T_91; // @[el2_ifu_ifc_ctl.scala 111:35]
  wire  _T_93 = io_ifc_fetch_req_f & _T_92; // @[el2_ifu_ifc_ctl.scala 111:33]
  wire  _T_94 = ~miss_f; // @[el2_ifu_ifc_ctl.scala 111:80]
  wire  fb_left = _T_93 & _T_94; // @[el2_ifu_ifc_ctl.scala 111:78]
  wire  _T_108 = _T_2 & fb_left; // @[el2_ifu_ifc_ctl.scala 116:16]
  wire [3:0] _T_111 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_124 = _T_108 ? _T_111 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_128 = _T_127 | _T_124; // @[Mux.scala 27:72]
  wire  _T_113 = ~fb_right; // @[el2_ifu_ifc_ctl.scala 117:18]
  wire  _T_114 = _T_2 & _T_113; // @[el2_ifu_ifc_ctl.scala 117:16]
  wire  _T_115 = ~fb_right2; // @[el2_ifu_ifc_ctl.scala 117:30]
  wire  _T_116 = _T_114 & _T_115; // @[el2_ifu_ifc_ctl.scala 117:28]
  wire  _T_117 = ~fb_left; // @[el2_ifu_ifc_ctl.scala 117:43]
  wire  _T_118 = _T_116 & _T_117; // @[el2_ifu_ifc_ctl.scala 117:41]
  wire [3:0] _T_125 = _T_118 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_128 | _T_125; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctl.scala 125:30]
  wire  _T_37 = fb_full_f_ns & _T_36; // @[el2_ifu_ifc_ctl.scala 85:68]
  wire  _T_38 = ~_T_37; // @[el2_ifu_ifc_ctl.scala 85:53]
  wire  _T_39 = io_ifc_fetch_req_bf_raw & _T_38; // @[el2_ifu_ifc_ctl.scala 85:51]
  wire  _T_40 = ~dma_stall; // @[el2_ifu_ifc_ctl.scala 86:5]
  wire  _T_41 = _T_39 & _T_40; // @[el2_ifu_ifc_ctl.scala 85:114]
  wire  _T_42 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctl.scala 86:18]
  wire  _T_43 = _T_41 & _T_42; // @[el2_ifu_ifc_ctl.scala 86:16]
  wire  _T_44 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctl.scala 86:39]
  wire  fetch_bf_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 88:37]
  wire  _T_51 = io_ifu_ic_mb_empty | io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 92:39]
  wire  _T_53 = _T_51 & _T_40; // @[el2_ifu_ifc_ctl.scala 92:61]
  wire  _T_55 = _T_53 & _T_94; // @[el2_ifu_ifc_ctl.scala 92:74]
  wire  _T_56 = ~miss_a; // @[el2_ifu_ifc_ctl.scala 92:86]
  wire  mb_empty_mod = _T_55 & _T_56; // @[el2_ifu_ifc_ctl.scala 92:84]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctl.scala 94:35]
  wire  _T_60 = io_exu_flush_final & _T_44; // @[el2_ifu_ifc_ctl.scala 96:36]
  wire  leave_idle = _T_60 & idle; // @[el2_ifu_ifc_ctl.scala 96:67]
  wire  _T_63 = ~state[1]; // @[el2_ifu_ifc_ctl.scala 98:23]
  wire  _T_65 = _T_63 & state[0]; // @[el2_ifu_ifc_ctl.scala 98:33]
  wire  _T_66 = _T_65 & miss_f; // @[el2_ifu_ifc_ctl.scala 98:44]
  wire  _T_67 = ~goto_idle; // @[el2_ifu_ifc_ctl.scala 98:55]
  wire  _T_68 = _T_66 & _T_67; // @[el2_ifu_ifc_ctl.scala 98:53]
  wire  _T_70 = ~mb_empty_mod; // @[el2_ifu_ifc_ctl.scala 99:17]
  wire  _T_71 = state[1] & _T_70; // @[el2_ifu_ifc_ctl.scala 99:15]
  wire  _T_73 = _T_71 & _T_67; // @[el2_ifu_ifc_ctl.scala 99:31]
  wire  next_state_1 = _T_68 | _T_73; // @[el2_ifu_ifc_ctl.scala 98:67]
  wire  _T_75 = _T_67 & leave_idle; // @[el2_ifu_ifc_ctl.scala 101:34]
  wire  _T_78 = state[0] & _T_67; // @[el2_ifu_ifc_ctl.scala 101:60]
  wire  next_state_0 = _T_75 | _T_78; // @[el2_ifu_ifc_ctl.scala 101:48]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctl.scala 123:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctl.scala 126:26]
  wire  _T_138 = _T_35 | io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 130:61]
  wire  _T_139 = ~_T_138; // @[el2_ifu_ifc_ctl.scala 130:19]
  wire  _T_140 = fb_full_f & _T_139; // @[el2_ifu_ifc_ctl.scala 130:17]
  wire  _T_141 = _T_140 | dma_stall; // @[el2_ifu_ifc_ctl.scala 130:84]
  wire  _T_142 = io_ifc_fetch_req_bf_raw & _T_141; // @[el2_ifu_ifc_ctl.scala 129:60]
  wire [31:0] _T_144 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire  iccm_acc_in_region_bf = _T_144[31:28] == 4'he; // @[el2_lib.scala 211:47]
  wire  iccm_acc_in_range_bf = _T_144[31:16] == 16'hee00; // @[el2_lib.scala 214:29]
  wire  _T_147 = ~io_ifc_iccm_access_bf; // @[el2_ifu_ifc_ctl.scala 136:30]
  wire  _T_150 = fb_full_f & _T_36; // @[el2_ifu_ifc_ctl.scala 137:16]
  wire  _T_151 = _T_147 | _T_150; // @[el2_ifu_ifc_ctl.scala 136:53]
  wire  _T_152 = ~io_ifc_fetch_req_bf; // @[el2_ifu_ifc_ctl.scala 138:13]
  wire  _T_153 = wfm & _T_152; // @[el2_ifu_ifc_ctl.scala 138:11]
  wire  _T_154 = _T_151 | _T_153; // @[el2_ifu_ifc_ctl.scala 137:62]
  wire  _T_155 = _T_154 | idle; // @[el2_ifu_ifc_ctl.scala 138:35]
  wire  _T_157 = _T_155 & _T_2; // @[el2_ifu_ifc_ctl.scala 138:44]
  wire  _T_159 = ~iccm_acc_in_range_bf; // @[el2_ifu_ifc_ctl.scala 140:33]
  wire [4:0] _T_162 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_163 = io_dec_tlu_mrac_ff >> _T_162; // @[el2_ifu_ifc_ctl.scala 141:53]
  reg  _T_166; // @[el2_ifu_ifc_ctl.scala 143:32]
  reg [30:0] _T_168; // @[Reg.scala 27:20]
  assign io_ifc_fetch_addr_f = _T_168; // @[el2_ifu_ifc_ctl.scala 145:23]
  assign io_ifc_fetch_addr_bf = _T_22 | _T_20; // @[el2_ifu_ifc_ctl.scala 73:24]
  assign io_ifc_fetch_req_f = _T_166; // @[el2_ifu_ifc_ctl.scala 143:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_142; // @[el2_ifu_ifc_ctl.scala 129:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_163[0]; // @[el2_ifu_ifc_ctl.scala 141:31]
  assign io_ifc_fetch_req_bf = _T_43 & _T_44; // @[el2_ifu_ifc_ctl.scala 85:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctl.scala 83:27]
  assign io_ifc_iccm_access_bf = _T_144[31:16] == 16'hee00; // @[el2_ifu_ifc_ctl.scala 135:25]
  assign io_ifc_region_acc_fault_bf = _T_159 & iccm_acc_in_region_bf; // @[el2_ifu_ifc_ctl.scala 140:30]
  assign io_ifc_dma_access_ok = _T_157 | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 136:24]
  assign io_test = _T_30 & io_ifc_fetch_addr_f[0]; // @[el2_ifu_ifc_ctl.scala 80:11]
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
  _T_166 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_168 = _RAND_6[30:0];
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
    _T_166 = 1'h0;
  end
  if (reset) begin
    _T_168 = 31'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      dma_iccm_stall_any_f <= 1'h0;
    end else begin
      dma_iccm_stall_any_f <= io_dma_iccm_stall_any;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      miss_a <= 1'h0;
    end else begin
      miss_a <= _T_48 & _T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      state <= {next_state_1,next_state_0};
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fb_write_f <= 4'h0;
    end else begin
      fb_write_f <= _T_128 | _T_125;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      fb_full_f <= 1'h0;
    end else begin
      fb_full_f <= fb_write_ns[3];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_166 <= 1'h0;
    end else begin
      _T_166 <= io_ifc_fetch_req_bf;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T_168 <= 31'h0;
    end else if (fetch_bf_en) begin
      _T_168 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
