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
  output        io_mb_empty_mod,
  output        io_miss_f
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
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 67:34]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 66:36]
  reg  miss_a; // @[el2_ifu_ifc_ctrl.scala 69:20]
  wire  _T_2 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 71:26]
  wire  _T_3 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 71:49]
  wire  _T_4 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 71:71]
  wire  _T_5 = _T_3 | _T_4; // @[el2_ifu_ifc_ctrl.scala 71:69]
  wire  sel_last_addr_bf = _T_2 & _T_5; // @[el2_ifu_ifc_ctrl.scala 71:46]
  wire  _T_7 = _T_2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 72:46]
  wire  _T_8 = _T_7 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 72:67]
  wire  sel_btb_addr_bf = _T_8 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 72:92]
  wire  _T_11 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 73:69]
  wire  _T_12 = _T_7 & _T_11; // @[el2_ifu_ifc_ctrl.scala 73:67]
  wire  sel_next_addr_bf = _T_12 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 73:92]
  wire [30:0] _T_17 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_18 = sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_19 = sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_29 = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_ifc_ctrl.scala 85:51]
  wire [30:0] _T_30 = {_T_29,1'h0}; // @[Cat.scala 29:58]
  wire [31:0] fetch_addr_next = {{1'd0}, _T_30}; // @[el2_ifu_ifc_ctrl.scala 85:19]
  wire [31:0] _T_20 = sel_next_addr_bf ? fetch_addr_next : 32'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_21 = _T_17 | _T_18; // @[Mux.scala 27:72]
  wire [30:0] _T_22 = _T_21 | _T_19; // @[Mux.scala 27:72]
  wire [31:0] _GEN_1 = {{1'd0}, _T_22}; // @[Mux.scala 27:72]
  wire [31:0] _T_23 = _GEN_1 | _T_20; // @[Mux.scala 27:72]
  reg [1:0] state; // @[el2_ifu_ifc_ctrl.scala 108:19]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctrl.scala 127:17]
  wire  _T_32 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctrl.scala 90:91]
  wire  _T_33 = ~_T_32; // @[el2_ifu_ifc_ctrl.scala 90:70]
  wire [3:0] _T_118 = io_exu_flush_final ? 4'h1 : 4'h0; // @[Mux.scala 27:72]
  wire  _T_78 = ~io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 112:38]
  wire  _T_79 = io_ifu_fb_consume1 & _T_78; // @[el2_ifu_ifc_ctrl.scala 112:36]
  wire  _T_45 = io_ifc_fetch_req_f & _T_4; // @[el2_ifu_ifc_ctrl.scala 95:32]
  wire  miss_f = _T_45 & _T_2; // @[el2_ifu_ifc_ctrl.scala 95:47]
  wire  _T_81 = _T_3 | miss_f; // @[el2_ifu_ifc_ctrl.scala 112:81]
  wire  _T_82 = _T_79 & _T_81; // @[el2_ifu_ifc_ctrl.scala 112:58]
  wire  _T_83 = io_ifu_fb_consume2 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 113:25]
  wire  fb_right = _T_82 | _T_83; // @[el2_ifu_ifc_ctrl.scala 112:92]
  wire  _T_95 = _T_2 & fb_right; // @[el2_ifu_ifc_ctrl.scala 119:16]
  reg [3:0] fb_write_f; // @[el2_ifu_ifc_ctrl.scala 132:24]
  wire [3:0] _T_98 = {1'h0,fb_write_f[3:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_119 = _T_95 ? _T_98 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_123 = _T_118 | _T_119; // @[Mux.scala 27:72]
  wire  fb_right2 = io_ifu_fb_consume2 & _T_81; // @[el2_ifu_ifc_ctrl.scala 115:36]
  wire  _T_100 = _T_2 & fb_right2; // @[el2_ifu_ifc_ctrl.scala 120:16]
  wire [3:0] _T_103 = {2'h0,fb_write_f[3:2]}; // @[Cat.scala 29:58]
  wire [3:0] _T_120 = _T_100 ? _T_103 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_124 = _T_123 | _T_120; // @[Mux.scala 27:72]
  wire  _T_88 = io_ifu_fb_consume1 | io_ifu_fb_consume2; // @[el2_ifu_ifc_ctrl.scala 116:56]
  wire  _T_89 = ~_T_88; // @[el2_ifu_ifc_ctrl.scala 116:35]
  wire  _T_90 = io_ifc_fetch_req_f & _T_89; // @[el2_ifu_ifc_ctrl.scala 116:33]
  wire  _T_91 = ~miss_f; // @[el2_ifu_ifc_ctrl.scala 116:80]
  wire  fb_left = _T_90 & _T_91; // @[el2_ifu_ifc_ctrl.scala 116:78]
  wire  _T_105 = _T_2 & fb_left; // @[el2_ifu_ifc_ctrl.scala 121:16]
  wire [3:0] _T_108 = {fb_write_f[2:0],1'h0}; // @[Cat.scala 29:58]
  wire [3:0] _T_121 = _T_105 ? _T_108 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_125 = _T_124 | _T_121; // @[Mux.scala 27:72]
  wire  _T_110 = ~fb_right; // @[el2_ifu_ifc_ctrl.scala 122:18]
  wire  _T_111 = _T_2 & _T_110; // @[el2_ifu_ifc_ctrl.scala 122:16]
  wire  _T_112 = ~fb_right2; // @[el2_ifu_ifc_ctrl.scala 122:30]
  wire  _T_113 = _T_111 & _T_112; // @[el2_ifu_ifc_ctrl.scala 122:28]
  wire  _T_114 = ~fb_left; // @[el2_ifu_ifc_ctrl.scala 122:43]
  wire  _T_115 = _T_113 & _T_114; // @[el2_ifu_ifc_ctrl.scala 122:41]
  wire [3:0] _T_122 = _T_115 ? fb_write_f : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] fb_write_ns = _T_125 | _T_122; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctrl.scala 130:30]
  wire  _T_34 = fb_full_f_ns & _T_33; // @[el2_ifu_ifc_ctrl.scala 90:68]
  wire  _T_35 = ~_T_34; // @[el2_ifu_ifc_ctrl.scala 90:53]
  wire  _T_36 = io_ifc_fetch_req_bf_raw & _T_35; // @[el2_ifu_ifc_ctrl.scala 90:51]
  wire  _T_37 = ~dma_stall; // @[el2_ifu_ifc_ctrl.scala 91:5]
  wire  _T_38 = _T_36 & _T_37; // @[el2_ifu_ifc_ctrl.scala 90:114]
  wire  _T_39 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctrl.scala 91:18]
  wire  _T_40 = _T_38 & _T_39; // @[el2_ifu_ifc_ctrl.scala 91:16]
  wire  _T_41 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 91:39]
  wire  fetch_bf_en = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 93:37]
  wire  _T_48 = io_ifu_ic_mb_empty | io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 97:39]
  wire  _T_50 = _T_48 & _T_37; // @[el2_ifu_ifc_ctrl.scala 97:61]
  wire  _T_52 = _T_50 & _T_91; // @[el2_ifu_ifc_ctrl.scala 97:74]
  wire  _T_53 = ~miss_a; // @[el2_ifu_ifc_ctrl.scala 97:86]
  wire  mb_empty_mod = _T_52 & _T_53; // @[el2_ifu_ifc_ctrl.scala 97:84]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 99:35]
  wire  _T_57 = io_exu_flush_final & _T_41; // @[el2_ifu_ifc_ctrl.scala 101:36]
  wire  leave_idle = _T_57 & idle; // @[el2_ifu_ifc_ctrl.scala 101:67]
  wire  _T_60 = ~state[1]; // @[el2_ifu_ifc_ctrl.scala 103:23]
  wire  _T_62 = _T_60 & state[0]; // @[el2_ifu_ifc_ctrl.scala 103:33]
  wire  _T_63 = _T_62 & miss_f; // @[el2_ifu_ifc_ctrl.scala 103:44]
  wire  _T_64 = ~goto_idle; // @[el2_ifu_ifc_ctrl.scala 103:55]
  wire  _T_65 = _T_63 & _T_64; // @[el2_ifu_ifc_ctrl.scala 103:53]
  wire  _T_67 = ~mb_empty_mod; // @[el2_ifu_ifc_ctrl.scala 104:17]
  wire  _T_68 = state[1] & _T_67; // @[el2_ifu_ifc_ctrl.scala 104:15]
  wire  _T_70 = _T_68 & _T_64; // @[el2_ifu_ifc_ctrl.scala 104:31]
  wire  next_state_1 = _T_65 | _T_70; // @[el2_ifu_ifc_ctrl.scala 103:67]
  wire  _T_72 = _T_64 & leave_idle; // @[el2_ifu_ifc_ctrl.scala 106:34]
  wire  _T_75 = state[0] & _T_64; // @[el2_ifu_ifc_ctrl.scala 106:60]
  wire  next_state_0 = _T_72 | _T_75; // @[el2_ifu_ifc_ctrl.scala 106:48]
  wire [1:0] _T_76 = {next_state_1,next_state_0}; // @[Cat.scala 29:58]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctrl.scala 128:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctrl.scala 131:26]
  wire  _T_135 = _T_32 | io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 135:61]
  wire  _T_136 = ~_T_135; // @[el2_ifu_ifc_ctrl.scala 135:19]
  wire  _T_137 = fb_full_f & _T_136; // @[el2_ifu_ifc_ctrl.scala 135:17]
  wire  _T_138 = _T_137 | dma_stall; // @[el2_ifu_ifc_ctrl.scala 135:84]
  wire  _T_139 = io_ifc_fetch_req_bf_raw & _T_138; // @[el2_ifu_ifc_ctrl.scala 134:60]
  wire [31:0] _T_141 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire  _T_144 = ~io_ifc_iccm_access_bf; // @[el2_ifu_ifc_ctrl.scala 141:30]
  wire  _T_147 = fb_full_f & _T_33; // @[el2_ifu_ifc_ctrl.scala 142:16]
  wire  _T_148 = _T_144 | _T_147; // @[el2_ifu_ifc_ctrl.scala 141:53]
  wire  _T_149 = ~io_ifc_fetch_req_bf; // @[el2_ifu_ifc_ctrl.scala 143:13]
  wire  _T_150 = wfm & _T_149; // @[el2_ifu_ifc_ctrl.scala 143:11]
  wire  _T_151 = _T_148 | _T_150; // @[el2_ifu_ifc_ctrl.scala 142:62]
  wire  _T_152 = _T_151 | idle; // @[el2_ifu_ifc_ctrl.scala 143:35]
  wire  _T_154 = _T_152 & _T_2; // @[el2_ifu_ifc_ctrl.scala 143:44]
  wire [4:0] _T_157 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_158 = io_dec_tlu_mrac_ff >> _T_157; // @[el2_ifu_ifc_ctrl.scala 145:53]
  reg  _T_161; // @[el2_ifu_ifc_ctrl.scala 147:32]
  reg [30:0] _T_163; // @[Reg.scala 27:20]
  assign io_ifc_fetch_addr_f = _T_163; // @[el2_ifu_ifc_ctrl.scala 149:23]
  assign io_ifc_fetch_addr_bf = _T_23[30:0]; // @[el2_ifu_ifc_ctrl.scala 76:24]
  assign io_ifc_fetch_req_f = _T_161; // @[el2_ifu_ifc_ctrl.scala 147:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_139; // @[el2_ifu_ifc_ctrl.scala 134:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_158[0]; // @[el2_ifu_ifc_ctrl.scala 145:31]
  assign io_ifc_fetch_req_bf = _T_40 & _T_41; // @[el2_ifu_ifc_ctrl.scala 90:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctrl.scala 88:27]
  assign io_ifc_iccm_access_bf = _T_141[31:16] == 16'hee00; // @[el2_ifu_ifc_ctrl.scala 140:25]
  assign io_ifc_region_acc_fault_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 41:30]
  assign io_ifc_dma_access_ok = _T_154 | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 42:24 el2_ifu_ifc_ctrl.scala 141:24]
  assign io_mb_empty_mod = _T_52 & _T_53; // @[el2_ifu_ifc_ctrl.scala 98:19]
  assign io_miss_f = _T_45 & _T_2; // @[el2_ifu_ifc_ctrl.scala 96:13]
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
  _T_161 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_163 = _RAND_6[30:0];
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
      miss_a <= 1'h0;
    end else begin
      miss_a <= miss_f;
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      state <= _T_76;
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
      _T_161 <= 1'h0;
    end else begin
      _T_161 <= io_ifc_fetch_req_bf;
    end
    if (reset) begin
      _T_163 <= 31'h0;
    end else if (fetch_bf_en) begin
      _T_163 <= io_ifc_fetch_addr_bf;
    end
  end
endmodule
