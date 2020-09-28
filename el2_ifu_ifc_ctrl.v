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
  output        io_sel_last_addr_bf,
  output        io_sel_btb_addr_bf,
  output        io_sel_next_addr_bf
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 72:34]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 71:36]
  wire  _T_2 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 76:26]
  wire  _T_3 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 76:49]
  wire  _T_4 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 76:71]
  wire  _T_5 = _T_3 | _T_4; // @[el2_ifu_ifc_ctrl.scala 76:69]
  wire  _T_8 = _T_2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 77:46]
  wire  _T_9 = _T_8 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 77:67]
  wire  _T_13 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 78:69]
  wire  _T_14 = _T_8 & _T_13; // @[el2_ifu_ifc_ctrl.scala 78:67]
  wire [30:0] _T_20 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_21 = io_sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_22 = io_sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_30 = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_ifc_ctrl.scala 90:51]
  wire [30:0] _T_31 = {_T_30,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] fetch_addr_next = {{1'd0}, _T_31}; // @[el2_ifu_ifc_ctrl.scala 90:19]
  wire [31:0] _T_23 = io_sel_next_addr_bf ? fetch_addr_next : 32'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_24 = _T_20 | _T_21; // @[Mux.scala 27:72]
  wire [30:0] _T_25 = _T_24 | _T_22; // @[Mux.scala 27:72]
  wire [31:0] _GEN_1 = {{1'd0}, _T_25}; // @[Mux.scala 27:72]
  wire [31:0] _T_26 = _GEN_1 | _T_23; // @[Mux.scala 27:72]
  reg [1:0] state; // @[el2_ifu_ifc_ctrl.scala 113:19]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctrl.scala 135:17]
  wire  _T_33 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctrl.scala 95:91]
  wire  _T_34 = ~_T_33; // @[el2_ifu_ifc_ctrl.scala 95:70]
  wire [3:0] _T_119 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_79 = ~io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 120:38]
  wire  _T_80 = io_ifu_fb_consume1 & _T_79; // @[el2_ifu_ifc_ctrl.scala 120:36]
  wire  _T_46 = io_ifc_fetch_req_f & _T_4; // @[el2_ifu_ifc_ctrl.scala 100:32]
  wire  miss_f = _T_46 & _T_2; // @[el2_ifu_ifc_ctrl.scala 100:47]
  wire  _T_82 = _T_3 | miss_f; // @[el2_ifu_ifc_ctrl.scala 120:81]
  wire  _T_83 = _T_80 & _T_82; // @[el2_ifu_ifc_ctrl.scala 120:58]
  wire  _T_84 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 121:25]
  wire  fb_right = _T_83 | _T_84; // @[el2_ifu_ifc_ctrl.scala 120:92]
  wire  _T_96 = _T_2 & fb_right; // @[el2_ifu_ifc_ctrl.scala 127:16]
  reg [3:0] fb_write_f; // @[el2_ifu_ifc_ctrl.scala 140:24]
  wire [3:0] _T_99 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_120 = _T_96 ? _T_99 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_124 = _T_119 | _T_120; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_82; // @[el2_ifu_ifc_ctrl.scala 123:36]
  wire  _T_101 = _T_2 & fb_right2; // @[el2_ifu_ifc_ctrl.scala 128:16]
  wire [3:0] _T_104 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_121 = _T_101 ? _T_104 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_125 = _T_124 | _T_121; // @[Mux.scala 27:72]
  wire  _T_89 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 124:56]
  wire  _T_90 = ~_T_89; // @[el2_ifu_ifc_ctrl.scala 124:35]
  wire  _T_91 = io_ifc_fetch_req_f & _T_90; // @[el2_ifu_ifc_ctrl.scala 124:33]
  wire  _T_92 = ~miss_f; // @[el2_ifu_ifc_ctrl.scala 124:80]
  wire  fb_left = _T_91 & _T_92; // @[el2_ifu_ifc_ctrl.scala 124:78]
  wire  _T_106 = _T_2 & fb_left; // @[el2_ifu_ifc_ctrl.scala 129:16]
  wire [3:0] _T_109 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_122 = _T_106 ? _T_109 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_126 = _T_125 | _T_122; // @[Mux.scala 27:72]
  wire  _T_111 = ~fb_right; // @[el2_ifu_ifc_ctrl.scala 130:18]
  wire  _T_112 = _T_2 & _T_111; // @[el2_ifu_ifc_ctrl.scala 130:16]
  wire  _T_113 = ~fb_right2; // @[el2_ifu_ifc_ctrl.scala 130:30]
  wire  _T_114 = _T_112 & _T_113; // @[el2_ifu_ifc_ctrl.scala 130:28]
  wire  _T_115 = ~fb_left; // @[el2_ifu_ifc_ctrl.scala 130:43]
  wire  _T_116 = _T_114 & _T_115; // @[el2_ifu_ifc_ctrl.scala 130:41]
  wire [3:0] _T_123 = _T_116 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_126 | _T_123; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctrl.scala 138:30]
  wire  _T_35 = fb_full_f_ns & _T_34; // @[el2_ifu_ifc_ctrl.scala 95:68]
  wire  _T_36 = ~_T_35; // @[el2_ifu_ifc_ctrl.scala 95:53]
  wire  _T_37 = io_ifc_fetch_req_bf_raw & _T_36; // @[el2_ifu_ifc_ctrl.scala 95:51]
  wire  _T_38 = ~dma_stall; // @[el2_ifu_ifc_ctrl.scala 96:5]
  wire  _T_39 = _T_37 & _T_38; // @[el2_ifu_ifc_ctrl.scala 95:114]
  wire  _T_40 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctrl.scala 96:18]
  wire  _T_41 = _T_39 & _T_40; // @[el2_ifu_ifc_ctrl.scala 96:16]
  wire  _T_42 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 96:39]
  wire  fetch_bf_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 98:37]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 104:35]
  wire  _T_58 = io_exu_flush_final & _T_42; // @[el2_ifu_ifc_ctrl.scala 106:36]
  wire  leave_idle = _T_58 & idle; // @[el2_ifu_ifc_ctrl.scala 106:67]
  wire  _T_65 = ~goto_idle; // @[el2_ifu_ifc_ctrl.scala 108:55]
  wire  _T_73 = _T_65 & leave_idle; // @[el2_ifu_ifc_ctrl.scala 111:34]
  wire  _T_76 = state[0] & _T_65; // @[el2_ifu_ifc_ctrl.scala 111:60]
  wire  next_state_0 = _T_73 | _T_76; // @[el2_ifu_ifc_ctrl.scala 111:48]
  wire [1:0] _T_77 = {next_state_0,next_state_0}; // @[Cat.scala 29:58]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctrl.scala 136:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctrl.scala 139:26]
  wire  _T_136 = _T_33 | io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 143:47]
  wire  _T_137 = ~_T_136; // @[el2_ifu_ifc_ctrl.scala 143:5]
  wire  _T_138 = fb_full_f & _T_137; // @[el2_ifu_ifc_ctrl.scala 142:75]
  wire  _T_139 = _T_138 | dma_stall; // @[el2_ifu_ifc_ctrl.scala 143:70]
  wire  _T_140 = io_ifc_fetch_req_bf_raw & _T_139; // @[el2_ifu_ifc_ctrl.scala 142:60]
  wire [31:0] _T_142 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_146 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_147 = io_dec_tlu_mrac_ff >> _T_146; // @[el2_ifu_ifc_ctrl.scala 150:53]
  reg  _T_150; // @[el2_ifu_ifc_ctrl.scala 154:32]
  reg [30:0] _T_152; // @[Reg.scala 27:20]
  assign io_ifc_fetch_addr_f = _T_152; // @[el2_ifu_ifc_ctrl.scala 157:23]
  assign io_ifc_fetch_addr_bf = _T_26[30:0]; // @[el2_ifu_ifc_ctrl.scala 81:24]
  assign io_ifc_fetch_req_f = _T_150; // @[el2_ifu_ifc_ctrl.scala 154:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_140; // @[el2_ifu_ifc_ctrl.scala 142:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_147[0]; // @[el2_ifu_ifc_ctrl.scala 150:31]
  assign io_ifc_fetch_req_bf = _T_41 & _T_42; // @[el2_ifu_ifc_ctrl.scala 95:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctrl.scala 93:27]
  assign io_ifc_iccm_access_bf = _T_142[31:16] == 16'hee00; // @[el2_ifu_ifc_ctrl.scala 149:25]
  assign io_ifc_region_acc_fault_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 42:30]
  assign io_ifc_dma_access_ok = 1'h0; // @[el2_ifu_ifc_ctrl.scala 43:24]
  assign io_sel_last_addr_bf = _T_2 & _T_5; // @[el2_ifu_ifc_ctrl.scala 76:23]
  assign io_sel_btb_addr_bf = _T_9 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 77:23]
  assign io_sel_next_addr_bf = _T_14 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 78:23]
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
  _T_150 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_152 = _RAND_5[30:0];
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
      state <= _T_77;
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
      _T_150 <= 1'h0;
    end else begin
      _T_150 <= io_ifc_fetch_req_bf;
    end
    if (reset) begin
      _T_152 <= 31'h0;
    end else if (fetch_bf_en) begin
      _T_152 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
