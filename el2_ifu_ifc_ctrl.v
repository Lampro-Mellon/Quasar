module el2_ifu_ifc_ctrl(
  input         clock,
  input         reset,
  input         io_free_clk,
  input         io_active_clk,
  input         io_rst_l,
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
  output [30:0] io_test_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 70:34]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 69:36]
  wire  _T_2 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 74:23]
  wire  _T_3 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 74:46]
  wire  _T_4 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 74:68]
  wire  _T_5 = _T_3 | _T_4; // @[el2_ifu_ifc_ctrl.scala 74:66]
  wire  sel_last_addr_bf = _T_2 & _T_5; // @[el2_ifu_ifc_ctrl.scala 74:43]
  wire  _T_8 = _T_2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 75:43]
  wire  _T_9 = _T_8 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 75:64]
  wire  sel_btb_addr_bf = _T_9 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 75:88]
  wire  _T_13 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 76:66]
  wire  _T_14 = _T_8 & _T_13; // @[el2_ifu_ifc_ctrl.scala 76:64]
  wire  sel_next_addr_bf = _T_14 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 76:89]
  wire [30:0] _T_20 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_21 = sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_22 = sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_30 = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_ifc_ctrl.scala 88:52]
  wire [29:0] _GEN_1 = {{29'd0}, io_ifc_fetch_addr_f[0]}; // @[el2_ifu_ifc_ctrl.scala 88:58]
  wire [29:0] _T_34 = _T_30 | _GEN_1; // @[el2_ifu_ifc_ctrl.scala 88:58]
  wire [31:0] fetch_addr_next = {{2'd0}, _T_34}; // @[el2_ifu_ifc_ctrl.scala 88:19]
  wire [31:0] _T_23 = sel_next_addr_bf ? fetch_addr_next : 32'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_24 = _T_20 | _T_21; // @[Mux.scala 27:72]
  wire [30:0] _T_25 = _T_24 | _T_22; // @[Mux.scala 27:72]
  wire [31:0] _GEN_2 = {{1'd0}, _T_25}; // @[Mux.scala 27:72]
  wire [31:0] _T_26 = _GEN_2 | _T_23; // @[Mux.scala 27:72]
  reg [1:0] state; // @[el2_ifu_ifc_ctrl.scala 113:19]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctrl.scala 136:17]
  wire  _T_36 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctrl.scala 95:91]
  wire  _T_37 = ~_T_36; // @[el2_ifu_ifc_ctrl.scala 95:70]
  wire [3:0] _T_122 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_82 = ~io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 121:38]
  wire  _T_83 = io_ifu_fb_consume1 & _T_82; // @[el2_ifu_ifc_ctrl.scala 121:36]
  wire  _T_49 = io_ifc_fetch_req_f & _T_4; // @[el2_ifu_ifc_ctrl.scala 100:32]
  wire  miss_f = _T_49 & _T_2; // @[el2_ifu_ifc_ctrl.scala 100:47]
  wire  _T_85 = _T_3 | miss_f; // @[el2_ifu_ifc_ctrl.scala 121:81]
  wire  _T_86 = _T_83 & _T_85; // @[el2_ifu_ifc_ctrl.scala 121:58]
  wire  _T_87 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 122:25]
  wire  fb_right = _T_86 | _T_87; // @[el2_ifu_ifc_ctrl.scala 121:92]
  wire  _T_99 = _T_2 & fb_right; // @[el2_ifu_ifc_ctrl.scala 128:16]
  reg [3:0] fb_write_f; // @[el2_ifu_ifc_ctrl.scala 141:24]
  wire [3:0] _T_102 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_123 = _T_99 ? _T_102 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_127 = _T_122 | _T_123; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_85; // @[el2_ifu_ifc_ctrl.scala 124:36]
  wire  _T_104 = _T_2 & fb_right2; // @[el2_ifu_ifc_ctrl.scala 129:16]
  wire [3:0] _T_107 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_124 = _T_104 ? _T_107 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_128 = _T_127 | _T_124; // @[Mux.scala 27:72]
  wire  _T_92 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 125:56]
  wire  _T_93 = ~_T_92; // @[el2_ifu_ifc_ctrl.scala 125:35]
  wire  _T_94 = io_ifc_fetch_req_f & _T_93; // @[el2_ifu_ifc_ctrl.scala 125:33]
  wire  _T_95 = ~miss_f; // @[el2_ifu_ifc_ctrl.scala 125:80]
  wire  fb_left = _T_94 & _T_95; // @[el2_ifu_ifc_ctrl.scala 125:78]
  wire  _T_109 = _T_2 & fb_left; // @[el2_ifu_ifc_ctrl.scala 130:16]
  wire [3:0] _T_112 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_125 = _T_109 ? _T_112 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_129 = _T_128 | _T_125; // @[Mux.scala 27:72]
  wire  _T_114 = ~fb_right; // @[el2_ifu_ifc_ctrl.scala 131:18]
  wire  _T_115 = _T_2 & _T_114; // @[el2_ifu_ifc_ctrl.scala 131:16]
  wire  _T_116 = ~fb_right2; // @[el2_ifu_ifc_ctrl.scala 131:30]
  wire  _T_117 = _T_115 & _T_116; // @[el2_ifu_ifc_ctrl.scala 131:28]
  wire  _T_118 = ~fb_left; // @[el2_ifu_ifc_ctrl.scala 131:43]
  wire  _T_119 = _T_117 & _T_118; // @[el2_ifu_ifc_ctrl.scala 131:41]
  wire [3:0] _T_126 = _T_119 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_129 | _T_126; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctrl.scala 139:30]
  wire  _T_38 = fb_full_f_ns & _T_37; // @[el2_ifu_ifc_ctrl.scala 95:68]
  wire  _T_39 = ~_T_38; // @[el2_ifu_ifc_ctrl.scala 95:53]
  wire  _T_40 = io_ifc_fetch_req_bf_raw & _T_39; // @[el2_ifu_ifc_ctrl.scala 95:51]
  wire  _T_41 = ~dma_stall; // @[el2_ifu_ifc_ctrl.scala 96:5]
  wire  _T_42 = _T_40 & _T_41; // @[el2_ifu_ifc_ctrl.scala 95:114]
  wire  _T_43 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctrl.scala 96:18]
  wire  _T_44 = _T_42 & _T_43; // @[el2_ifu_ifc_ctrl.scala 96:16]
  wire  _T_45 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 96:39]
  wire  fetch_bf_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 98:37]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 104:35]
  wire  _T_61 = io_exu_flush_final & _T_45; // @[el2_ifu_ifc_ctrl.scala 106:36]
  wire  leave_idle = _T_61 & idle; // @[el2_ifu_ifc_ctrl.scala 106:67]
  wire  _T_68 = ~goto_idle; // @[el2_ifu_ifc_ctrl.scala 108:55]
  wire  _T_76 = _T_68 & leave_idle; // @[el2_ifu_ifc_ctrl.scala 111:34]
  wire  _T_79 = state[0] & _T_68; // @[el2_ifu_ifc_ctrl.scala 111:60]
  wire  next_state_0 = _T_76 | _T_79; // @[el2_ifu_ifc_ctrl.scala 111:48]
  wire [1:0] _T_80 = {next_state_0,next_state_0}; // @[Cat.scala 29:58]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctrl.scala 137:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctrl.scala 140:26]
  wire  _T_139 = _T_36 | io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 144:47]
  wire  _T_140 = ~_T_139; // @[el2_ifu_ifc_ctrl.scala 144:5]
  wire  _T_141 = fb_full_f & _T_140; // @[el2_ifu_ifc_ctrl.scala 143:75]
  wire  _T_142 = _T_141 | dma_stall; // @[el2_ifu_ifc_ctrl.scala 144:70]
  wire  _T_143 = io_ifc_fetch_req_bf_raw & _T_142; // @[el2_ifu_ifc_ctrl.scala 143:60]
  wire [31:0] _T_145 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_149 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_150 = io_dec_tlu_mrac_ff >> _T_149; // @[el2_ifu_ifc_ctrl.scala 151:53]
  reg  _T_153; // @[el2_ifu_ifc_ctrl.scala 155:32]
  reg [30:0] _T_155; // @[Reg.scala 27:20]
  assign io_ifc_fetch_addr_f = _T_155; // @[el2_ifu_ifc_ctrl.scala 158:23]
  assign io_ifc_fetch_addr_bf = _T_26[30:0]; // @[el2_ifu_ifc_ctrl.scala 79:24]
  assign io_ifc_fetch_req_f = _T_153; // @[el2_ifu_ifc_ctrl.scala 155:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_143; // @[el2_ifu_ifc_ctrl.scala 143:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_150[0]; // @[el2_ifu_ifc_ctrl.scala 151:31]
  assign io_ifc_fetch_req_bf = _T_44 & _T_45; // @[el2_ifu_ifc_ctrl.scala 95:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctrl.scala 93:27]
  assign io_ifc_iccm_access_bf = _T_145[31:16] == 16'hee00; // @[el2_ifu_ifc_ctrl.scala 150:25]
  assign io_ifc_region_acc_fault_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 40:30]
  assign io_ifc_dma_access_ok = 1'h0; // @[el2_ifu_ifc_ctrl.scala 41:24]
  assign io_test_out = io_ifc_fetch_addr_bf; // @[el2_ifu_ifc_ctrl.scala 84:15]
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
  state = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  fb_write_f = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  fb_full_f = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_153 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_155 = _RAND_5[30:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      dma_iccm_stall_any_f <= 1'h0;
    end else begin
      dma_iccm_stall_any_f <= io_dma_iccm_stall_any;
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      state <= _T_80;
    end
    if (reset) begin
      fb_write_f <= 4'h0;
    end else begin
      fb_write_f <= fb_write_ns;
    end
    if (reset) begin
      fb_full_f <= 1'h0;
    end else begin
      fb_full_f <= fb_full_f_ns;
    end
    if (reset) begin
      _T_153 <= 1'h0;
    end else begin
      _T_153 <= io_ifc_fetch_req_bf;
    end
    if (reset) begin
      _T_155 <= 31'h0;
    end else if (fetch_bf_en) begin
      _T_155 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
