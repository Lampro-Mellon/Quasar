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
  input  [30:0] io_dec_tlu_mrac_ff,
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
`endif // RANDOMIZE_REG_INIT
  reg  dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 75:37]
  wire  dma_stall = io_ic_dma_active | dma_iccm_stall_any_f; // @[el2_ifu_ifc_ctrl.scala 76:36]
  wire  _T_1 = ~io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 79:23]
  wire  _T_2 = ~io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 79:46]
  wire  _T_3 = ~io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 79:68]
  wire  _T_4 = _T_2 | _T_3; // @[el2_ifu_ifc_ctrl.scala 79:66]
  wire  sel_last_addr_bf = _T_1 & _T_4; // @[el2_ifu_ifc_ctrl.scala 79:43]
  wire  _T_7 = _T_1 & io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 80:43]
  wire  _T_8 = _T_7 & io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 80:64]
  wire  sel_btb_addr_bf = _T_8 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 80:88]
  wire  _T_12 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_ifc_ctrl.scala 81:66]
  wire  _T_13 = _T_7 & _T_12; // @[el2_ifu_ifc_ctrl.scala 81:64]
  wire  sel_next_addr_bf = _T_13 & io_ic_hit_f; // @[el2_ifu_ifc_ctrl.scala 81:89]
  wire [30:0] _T_16 = io_ifc_fetch_addr_f + 31'h2; // @[el2_ifu_ifc_ctrl.scala 84:42]
  wire [30:0] _GEN_1 = {{30'd0}, io_ifc_fetch_addr_f[0]}; // @[el2_ifu_ifc_ctrl.scala 84:48]
  wire [30:0] _T_20 = _T_16 | _GEN_1; // @[el2_ifu_ifc_ctrl.scala 84:48]
  wire [30:0] _T_25 = io_exu_flush_final ? io_exu_flush_path_final : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_26 = sel_last_addr_bf ? io_ifc_fetch_addr_f : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_27 = sel_btb_addr_bf ? io_ifu_bp_btb_target_f : 31'h0; // @[Mux.scala 27:72]
  wire [31:0] fetch_addr_next = {{1'd0}, _T_20}; // @[el2_ifu_ifc_ctrl.scala 84:19]
  wire [31:0] _T_28 = sel_next_addr_bf ? fetch_addr_next : 32'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_29 = _T_25 | _T_26; // @[Mux.scala 27:72]
  wire [30:0] _T_30 = _T_29 | _T_27; // @[Mux.scala 27:72]
  wire [31:0] _GEN_2 = {{1'd0}, _T_30}; // @[Mux.scala 27:72]
  wire [31:0] _T_31 = _GEN_2 | _T_28; // @[Mux.scala 27:72]
  wire  _T_33 = io_exu_flush_final | io_ifc_fetch_req_f; // @[el2_ifu_ifc_ctrl.scala 95:88]
  reg [30:0] _T_34; // @[Reg.scala 27:20]
  reg [1:0] state; // @[el2_ifu_ifc_ctrl.scala 117:19]
  wire  idle = state == 2'h0; // @[el2_ifu_ifc_ctrl.scala 136:17]
  reg [30:0] _T_36; // @[el2_ifu_ifc_ctrl.scala 99:32]
  wire  _T_37 = io_ifu_fb_consume2 | io_ifu_fb_consume1; // @[el2_ifu_ifc_ctrl.scala 101:91]
  wire  _T_38 = ~_T_37; // @[el2_ifu_ifc_ctrl.scala 101:70]
  wire [3:0] fb_write_ns = {{3'd0}, io_exu_flush_final}; // @[Mux.scala 27:72]
  wire  fb_full_f_ns = fb_write_ns[3]; // @[el2_ifu_ifc_ctrl.scala 139:30]
  wire  _T_39 = fb_full_f_ns & _T_38; // @[el2_ifu_ifc_ctrl.scala 101:68]
  wire  _T_40 = ~_T_39; // @[el2_ifu_ifc_ctrl.scala 101:53]
  wire  _T_41 = io_ifc_fetch_req_bf_raw & _T_40; // @[el2_ifu_ifc_ctrl.scala 101:51]
  wire  _T_42 = ~dma_stall; // @[el2_ifu_ifc_ctrl.scala 102:5]
  wire  _T_43 = _T_41 & _T_42; // @[el2_ifu_ifc_ctrl.scala 101:114]
  wire  _T_44 = ~io_ic_write_stall; // @[el2_ifu_ifc_ctrl.scala 102:18]
  wire  _T_45 = _T_43 & _T_44; // @[el2_ifu_ifc_ctrl.scala 102:16]
  wire  _T_46 = ~io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 102:39]
  wire  goto_idle = io_exu_flush_final & io_dec_tlu_flush_noredir_wb; // @[el2_ifu_ifc_ctrl.scala 106:35]
  wire  _T_61 = io_exu_flush_final & _T_46; // @[el2_ifu_ifc_ctrl.scala 110:36]
  wire  leave_idle = _T_61 & idle; // @[el2_ifu_ifc_ctrl.scala 110:67]
  wire  _T_68 = ~goto_idle; // @[el2_ifu_ifc_ctrl.scala 112:55]
  wire  _T_76 = _T_68 & leave_idle; // @[el2_ifu_ifc_ctrl.scala 115:34]
  wire  _T_79 = state[0] & _T_68; // @[el2_ifu_ifc_ctrl.scala 115:60]
  wire  next_state_0 = _T_76 | _T_79; // @[el2_ifu_ifc_ctrl.scala 115:48]
  wire [1:0] _T_80 = {next_state_0,next_state_0}; // @[Cat.scala 29:58]
  wire  wfm = state == 2'h3; // @[el2_ifu_ifc_ctrl.scala 137:16]
  reg  fb_full_f; // @[el2_ifu_ifc_ctrl.scala 140:26]
  wire  _T_136 = _T_37 | io_exu_flush_final; // @[el2_ifu_ifc_ctrl.scala 143:47]
  wire  _T_137 = ~_T_136; // @[el2_ifu_ifc_ctrl.scala 143:5]
  wire  _T_138 = fb_full_f & _T_137; // @[el2_ifu_ifc_ctrl.scala 142:75]
  wire  _T_139 = _T_138 | dma_stall; // @[el2_ifu_ifc_ctrl.scala 143:70]
  wire  _T_140 = io_ifc_fetch_req_bf_raw & _T_139; // @[el2_ifu_ifc_ctrl.scala 142:60]
  wire [31:0] _T_142 = {io_ifc_fetch_addr_bf,1'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_146 = {io_ifc_fetch_addr_bf[30:27],1'h0}; // @[Cat.scala 29:58]
  wire [30:0] _T_147 = io_dec_tlu_mrac_ff >> _T_146; // @[el2_ifu_ifc_ctrl.scala 150:53]
  assign io_ifc_fetch_addr_f = _T_34; // @[el2_ifu_ifc_ctrl.scala 64:23 el2_ifu_ifc_ctrl.scala 95:23]
  assign io_ifc_fetch_addr_bf = _T_31[30:0]; // @[el2_ifu_ifc_ctrl.scala 65:24 el2_ifu_ifc_ctrl.scala 89:24]
  assign io_ifc_fetch_req_f = _T_36[0]; // @[el2_ifu_ifc_ctrl.scala 66:22 el2_ifu_ifc_ctrl.scala 99:22]
  assign io_ifu_pmu_fetch_stall = wfm | _T_140; // @[el2_ifu_ifc_ctrl.scala 67:26 el2_ifu_ifc_ctrl.scala 142:26]
  assign io_ifc_fetch_uncacheable_bf = ~_T_147[0]; // @[el2_ifu_ifc_ctrl.scala 68:31 el2_ifu_ifc_ctrl.scala 150:31]
  assign io_ifc_fetch_req_bf = _T_45 & _T_46; // @[el2_ifu_ifc_ctrl.scala 69:23 el2_ifu_ifc_ctrl.scala 101:23]
  assign io_ifc_fetch_req_bf_raw = ~idle; // @[el2_ifu_ifc_ctrl.scala 70:27 el2_ifu_ifc_ctrl.scala 97:27]
  assign io_ifc_iccm_access_bf = _T_142[31:16] == 16'hee00; // @[el2_ifu_ifc_ctrl.scala 71:25 el2_ifu_ifc_ctrl.scala 149:25]
  assign io_ifc_region_acc_fault_bf = 1'h0; // @[el2_ifu_ifc_ctrl.scala 72:30]
  assign io_ifc_dma_access_ok = 1'h0; // @[el2_ifu_ifc_ctrl.scala 73:24]
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
  _T_34 = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  _T_36 = _RAND_3[30:0];
  _RAND_4 = {1{`RANDOM}};
  fb_full_f = _RAND_4[0:0];
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
      _T_34 <= 31'h0;
    end else if (_T_33) begin
      _T_34 <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      state <= _T_80;
    end
    if (reset) begin
      _T_36 <= 31'h0;
    end else begin
      _T_36 <= io_ifc_fetch_addr_bf;
    end
    if (reset) begin
      fb_full_f <= 1'h0;
    end else begin
      fb_full_f <= fb_full_f_ns;
    end
  end
endmodule
