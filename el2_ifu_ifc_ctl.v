module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 474:26]
  wire  clkhdr_CK; // @[el2_lib.scala 474:26]
  wire  clkhdr_EN; // @[el2_lib.scala 474:26]
  wire  clkhdr_SE; // @[el2_lib.scala 474:26]
  gated_latch clkhdr ( // @[el2_lib.scala 474:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 475:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 476:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 477:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 478:18]
endmodule
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
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 508:23]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 508:23]
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 63:58]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 62:36]
  reg  miss_a; // @[el2_ifu_ifc_ctl.scala 65:44]
  wire  _T_2 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 67:26]
  wire  _T_3 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 67:49]
  wire  _T_4 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 67:71]
  wire  _T_5 = _T_3 | _T_4; // @[el2_ifu_ifc_ctl.scala 67:69]
  wire  sel_last_addr_bf = _T_2 & _T_5; // @[el2_ifu_ifc_ctl.scala 67:46]
  wire  _T_7 = _T_2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 68:46]
  wire  _T_8 = _T_7 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctl.scala 68:67]
  wire  sel_btb_addr_bf = _T_8 & io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 68:92]
  wire  _T_11 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctl.scala 69:69]
  wire  _T_12 = _T_7 & _T_11; // @[el2_ifu_ifc_ctl.scala 69:67]
  wire  sel_next_addr_bf = _T_12 & io_ic_hit_f; // @[el2_ifu_ifc_ctl.scala 69:92]
  wire [30:0] _T_17 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_18 = sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_19 = sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] address_upper = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_ifc_ctl.scala 77:48]
  wire  _T_29 = address_upper[4] ^ io_ifc_fetch_addr_f[5]; // @[el2_ifu_ifc_ctl.scala 78:63]
  wire  _T_30 = ~_T_29; // @[el2_ifu_ifc_ctl.scala 78:24]
  wire  fetch_addr_next_0 = _T_30 & io_ifc_fetch_addr_f[0]; // @[el2_ifu_ifc_ctl.scala 78:109]
  wire [30:0] fetch_addr_next = {address_upper,fetch_addr_next_0}; // @[Cat.scala 29:58]
  wire [30:0] _T_20 = sel_next_addr_bf ? fetch_addr_next : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_21 = _T_17 | _T_18; // @[Mux.scala 27:72]
  wire [30:0] _T_22 = _T_21 | _T_19; // @[Mux.scala 27:72]
  reg [1:0] state; // @[el2_ifu_ifc_ctl.scala 102:45]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctl.scala 119:17]
  wire  _T_35 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctl.scala 84:91]
  wire  _T_36 = ~_T_35; // @[el2_ifu_ifc_ctl.scala 84:70]
  wire [3:0] _T_121 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_81 = ~io_ifu_fb_consume2; // @[el2_ifu_ifc_ctl.scala 106:38]
  wire  _T_82 = io_ifu_fb_consume1 & _T_81; // @[el2_ifu_ifc_ctl.scala 106:36]
  wire  _T_48 = io_ifc_fetch_req_f & _T_4; // @[el2_ifu_ifc_ctl.scala 89:32]
  wire  miss_f = _T_48 & _T_2; // @[el2_ifu_ifc_ctl.scala 89:47]
  wire  _T_84 = _T_3 | miss_f; // @[el2_ifu_ifc_ctl.scala 106:81]
  wire  _T_85 = _T_82 & _T_84; // @[el2_ifu_ifc_ctl.scala 106:58]
  wire  _T_86 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctl.scala 107:25]
  wire  fb_right = _T_85 | _T_86; // @[el2_ifu_ifc_ctl.scala 106:92]
  wire  _T_98 = _T_2 & fb_right; // @[el2_ifu_ifc_ctl.scala 113:16]
  reg [3:0] fb_write_f; // @[el2_ifu_ifc_ctl.scala 124:50]
  wire [3:0] _T_101 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_122 = _T_98 ? _T_101 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_126 = _T_121 | _T_122; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_84; // @[el2_ifu_ifc_ctl.scala 109:36]
  wire  _T_103 = _T_2 & fb_right2; // @[el2_ifu_ifc_ctl.scala 114:16]
  wire [3:0] _T_106 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_123 = _T_103 ? _T_106 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_127 = _T_126 | _T_123; // @[Mux.scala 27:72]
  wire  _T_91 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[el2_ifu_ifc_ctl.scala 110:56]
  wire  _T_92 = ~_T_91; // @[el2_ifu_ifc_ctl.scala 110:35]
  wire  _T_93 = io_ifc_fetch_req_f & _T_92; // @[el2_ifu_ifc_ctl.scala 110:33]
  wire  _T_94 = ~miss_f; // @[el2_ifu_ifc_ctl.scala 110:80]
  wire  fb_left = _T_93 & _T_94; // @[el2_ifu_ifc_ctl.scala 110:78]
  wire  _T_108 = _T_2 & fb_left; // @[el2_ifu_ifc_ctl.scala 115:16]
  wire [3:0] _T_111 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_124 = _T_108 ? _T_111 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_128 = _T_127 | _T_124; // @[Mux.scala 27:72]
  wire  _T_113 = ~fb_right; // @[el2_ifu_ifc_ctl.scala 116:18]
  wire  _T_114 = _T_2 & _T_113; // @[el2_ifu_ifc_ctl.scala 116:16]
  wire  _T_115 = ~fb_right2; // @[el2_ifu_ifc_ctl.scala 116:30]
  wire  _T_116 = _T_114 & _T_115; // @[el2_ifu_ifc_ctl.scala 116:28]
  wire  _T_117 = ~fb_left; // @[el2_ifu_ifc_ctl.scala 116:43]
  wire  _T_118 = _T_116 & _T_117; // @[el2_ifu_ifc_ctl.scala 116:41]
  wire [3:0] _T_125 = _T_118 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_128 | _T_125; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctl.scala 122:30]
  wire  _T_37 = fb_full_f_ns & _T_36; // @[el2_ifu_ifc_ctl.scala 84:68]
  wire  _T_38 = ~_T_37; // @[el2_ifu_ifc_ctl.scala 84:53]
  wire  _T_39 = io_ifc_fetch_req_bf_raw & _T_38; // @[el2_ifu_ifc_ctl.scala 84:51]
  wire  _T_40 = ~dma_stall; // @[el2_ifu_ifc_ctl.scala 85:5]
  wire  _T_41 = _T_39 & _T_40; // @[el2_ifu_ifc_ctl.scala 84:114]
  wire  _T_42 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctl.scala 85:18]
  wire  _T_43 = _T_41 & _T_42; // @[el2_ifu_ifc_ctl.scala 85:16]
  wire  _T_44 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctl.scala 85:39]
  wire  _T_51 = io_ifu_ic_mb_empty | io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 91:39]
  wire  _T_53 = _T_51 & _T_40; // @[el2_ifu_ifc_ctl.scala 91:61]
  wire  _T_55 = _T_53 & _T_94; // @[el2_ifu_ifc_ctl.scala 91:74]
  wire  _T_56 = ~miss_a; // @[el2_ifu_ifc_ctl.scala 91:86]
  wire  mb_empty_mod = _T_55 & _T_56; // @[el2_ifu_ifc_ctl.scala 91:84]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctl.scala 93:35]
  wire  _T_60 = io_exu_flush_final & _T_44; // @[el2_ifu_ifc_ctl.scala 95:36]
  wire  leave_idle = _T_60 & idle; // @[el2_ifu_ifc_ctl.scala 95:67]
  wire  _T_63 = ~state[1]; // @[el2_ifu_ifc_ctl.scala 97:23]
  wire  _T_65 = _T_63 & state[0]; // @[el2_ifu_ifc_ctl.scala 97:33]
  wire  _T_66 = _T_65 & miss_f; // @[el2_ifu_ifc_ctl.scala 97:44]
  wire  _T_67 = ~goto_idle; // @[el2_ifu_ifc_ctl.scala 97:55]
  wire  _T_68 = _T_66 & _T_67; // @[el2_ifu_ifc_ctl.scala 97:53]
  wire  _T_70 = ~mb_empty_mod; // @[el2_ifu_ifc_ctl.scala 98:17]
  wire  _T_71 = state[1] & _T_70; // @[el2_ifu_ifc_ctl.scala 98:15]
  wire  _T_73 = _T_71 & _T_67; // @[el2_ifu_ifc_ctl.scala 98:31]
  wire  next_state_1 = _T_68 | _T_73; // @[el2_ifu_ifc_ctl.scala 97:67]
  wire  _T_75 = _T_67 & leave_idle; // @[el2_ifu_ifc_ctl.scala 100:34]
  wire  _T_78 = state[0] & _T_67; // @[el2_ifu_ifc_ctl.scala 100:60]
  wire  next_state_0 = _T_75 | _T_78; // @[el2_ifu_ifc_ctl.scala 100:48]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctl.scala 120:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctl.scala 123:52]
  wire  _T_136 = _T_35 | io_exu_flush_final; // @[el2_ifu_ifc_ctl.scala 127:61]
  wire  _T_137 = ~_T_136; // @[el2_ifu_ifc_ctl.scala 127:19]
  wire  _T_138 = fb_full_f & _T_137; // @[el2_ifu_ifc_ctl.scala 127:17]
  wire  _T_139 = _T_138 | dma_stall; // @[el2_ifu_ifc_ctl.scala 127:84]
  wire  _T_140 = io_ifc_fetch_req_bf_raw & _T_139; // @[el2_ifu_ifc_ctl.scala 126:60]
  wire [31:0] _T_142 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire  iccm_acc_in_region_bf = _T_142[31:28] == 4'he; // @[el2_lib.scala 224:47]
  wire  iccm_acc_in_range_bf = _T_142[31:16] == 16'hee00; // @[el2_lib.scala 227:29]
  wire  _T_145 = ~io_ifc_iccm_access_bf; // @[el2_ifu_ifc_ctl.scala 133:30]
  wire  _T_148 = fb_full_f & _T_36; // @[el2_ifu_ifc_ctl.scala 134:16]
  wire  _T_149 = _T_145 | _T_148; // @[el2_ifu_ifc_ctl.scala 133:53]
  wire  _T_150 = ~io_ifc_fetch_req_bf; // @[el2_ifu_ifc_ctl.scala 135:13]
  wire  _T_151 = wfm & _T_150; // @[el2_ifu_ifc_ctl.scala 135:11]
  wire  _T_152 = _T_149 | _T_151; // @[el2_ifu_ifc_ctl.scala 134:62]
  wire  _T_153 = _T_152 | idle; // @[el2_ifu_ifc_ctl.scala 135:35]
  wire  _T_155 = _T_153 & _T_2; // @[el2_ifu_ifc_ctl.scala 135:44]
  wire  _T_157 = ~iccm_acc_in_range_bf; // @[el2_ifu_ifc_ctl.scala 137:33]
  wire [4:0] _T_160 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_161 = io_dec_tlu_mrac_ff >> _T_160; // @[el2_ifu_ifc_ctl.scala 138:53]
  reg  _T_164; // @[el2_ifu_ifc_ctl.scala 140:57]
  reg [30:0] _T_166; // @[el2_lib.scala 514:16]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 508:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  assign io_ifc_fetch_addr_f = _T_166; // @[el2_ifu_ifc_ctl.scala 142:23]
  assign io_ifc_fetch_addr_bf = _T_22 | _T_20; // @[el2_ifu_ifc_ctl.scala 72:24]
  assign io_ifc_fetch_req_f = _T_164; // @[el2_ifu_ifc_ctl.scala 140:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_140; // @[el2_ifu_ifc_ctl.scala 126:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_161[0]; // @[el2_ifu_ifc_ctl.scala 138:31]
  assign io_ifc_fetch_req_bf = _T_43 & _T_44; // @[el2_ifu_ifc_ctl.scala 84:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctl.scala 82:27]
  assign io_ifc_iccm_access_bf = _T_142[31:16] == 16'hee00; // @[el2_ifu_ifc_ctl.scala 132:25]
  assign io_ifc_region_acc_fault_bf = _T_157 & iccm_acc_in_region_bf; // @[el2_ifu_ifc_ctl.scala 137:30]
  assign io_ifc_dma_access_ok = _T_155 | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctl.scala 133:24]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 510:18]
  assign rvclkhdr_io_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_lib.scala 511:17]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 512:24]
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
  _T_164 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_166 = _RAND_6[30:0];
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
    _T_164 = 1'h0;
  end
  if (reset) begin
    _T_166 = 31'h0;
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
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      state <= {next_state_1,next_state_0};
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      fb_write_f <= 4'h0;
    end else begin
      fb_write_f <= _T_128 | _T_125;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      fb_full_f <= 1'h0;
    end else begin
      fb_full_f <= fb_write_ns[3];
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      _T_164 <= 1'h0;
    end else begin
      _T_164 <= io_ifc_fetch_req_bf;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      _T_166 <= 31'h0;
    end else begin
      _T_166 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
