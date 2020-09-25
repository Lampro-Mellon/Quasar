module el2_ifu_bp_ctl(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_active_clk,
  input         io_rst_l,
  input         io_ic_hit_f,
  input  [31:0] io_ifc_fetch_addr_f,
  input         io_ifc_fetch_req_f,
  input         io_dec_tlu_br0_r_pkt_valid,
  input  [1:0]  io_dec_tlu_br0_r_pkt_hist,
  input         io_dec_tlu_br0_r_pkt_br_error,
  input         io_dec_tlu_br0_r_pkt_br_start_error,
  input         io_dec_tlu_br0_r_pkt_way,
  input         io_dec_tlu_br0_r_pkt_middle,
  input  [7:0]  io_exu_i0_br_fghr_r,
  input  [6:0]  io_exu_i0_br_index_r,
  input         io_dec_tlu_flush_lower_wb,
  input         io_dec_tlu_flush_leak_one_wb,
  input         io_dec_tlu_bpred_disable,
  input         io_exu_mp_pkt_misp,
  input         io_exu_mp_pkt_ataken,
  input         io_exu_mp_pkt_boffset,
  input         io_exu_mp_pkt_pc4,
  input  [1:0]  io_exu_mp_pkt_hist,
  input  [11:0] io_exu_mp_pkt_toffset,
  input         io_exu_mp_pkt_valid,
  input         io_exu_mp_pkt_br_error,
  input         io_exu_mp_pkt_br_start_error,
  input  [31:0] io_exu_mp_pkt_prett,
  input         io_exu_mp_pkt_pcall,
  input         io_exu_mp_pkt_pret,
  input         io_exu_mp_pkt_pja,
  input         io_exu_mp_pkt_way,
  input  [7:0]  io_exu_mp_eghr,
  input  [7:0]  io_exu_mp_fghr,
  input  [6:0]  io_exu_mp_index,
  input  [4:0]  io_exu_mp_btag,
  input         io_exu_flush_final,
  output        io_ifu_bp_hit_taken_f,
  output [30:0] io_ifu_bp_btb_target_f,
  output        io_ifu_bp_inst_mask_f,
  output [7:0]  io_ifu_bp_fghr_f,
  output [1:0]  io_ifu_bp_way_f,
  output [1:0]  io_ifu_bp_ret_f,
  output [1:0]  io_ifu_bp_hist1_f,
  output [1:0]  io_ifu_bp_hist0_f,
  output [1:0]  io_ifu_bp_pc4_f,
  output [1:0]  io_ifu_bp_valid_f,
  output [11:0] io_ifu_bp_poffset_f
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [255:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  _T_26 = io_dec_tlu_flush_leak_one_wb & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 133:47]
  reg  leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 128:30]
  wire  _T_27 = leak_one_f_d1 & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 133:93]
  wire  leak_one_f = _T_26 | _T_27; // @[el2_ifu_bp_ctl.scala 133:76]
  wire  _T = ~leak_one_f; // @[el2_ifu_bp_ctl.scala 67:43]
  wire  exu_mp_valid = io_exu_mp_pkt_misp & _T; // @[el2_ifu_bp_ctl.scala 67:41]
  wire [7:0] _T_3 = io_ifc_fetch_addr_f[9:2] ^ io_ifc_fetch_addr_f[17:10]; // @[el2_lib.scala 182:42]
  wire [7:0] btb_rd_addr_f = _T_3 ^ io_ifc_fetch_addr_f[25:18]; // @[el2_lib.scala 182:76]
  wire [31:0] fetch_addr_p1_f = io_ifc_fetch_addr_f + 32'h4; // @[el2_ifu_bp_ctl.scala 106:45]
  wire [7:0] _T_8 = fetch_addr_p1_f[9:2] ^ fetch_addr_p1_f[17:10]; // @[el2_lib.scala 182:42]
  wire [7:0] btb_rd_addr_p1_f = _T_8 ^ fetch_addr_p1_f[25:18]; // @[el2_lib.scala 182:76]
  wire  _T_129 = ~io_ifc_fetch_addr_f[1]; // @[el2_ifu_bp_ctl.scala 180:40]
  wire  _T_18 = io_exu_mp_btag == 5'h0; // @[el2_ifu_bp_ctl.scala 125:46]
  wire  _T_19 = _T_18 & exu_mp_valid; // @[el2_ifu_bp_ctl.scala 125:66]
  wire  _T_20 = _T_19 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 125:81]
  wire [7:0] _GEN_2 = {{1'd0}, io_exu_mp_index}; // @[el2_ifu_bp_ctl.scala 125:117]
  wire  _T_21 = _GEN_2 == btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 125:117]
  wire  fetch_mp_collision_f = _T_20 & _T_21; // @[el2_ifu_bp_ctl.scala 125:102]
  wire  _T_25 = _GEN_2 == btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 126:123]
  wire  fetch_mp_collision_p1_f = _T_20 & _T_25; // @[el2_ifu_bp_ctl.scala 126:108]
  reg  exu_mp_way_f; // @[el2_ifu_bp_ctl.scala 130:29]
  reg  exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 131:35]
  wire [127:0] mp_wrindex_dec = 128'h0 << io_exu_mp_index; // @[el2_ifu_bp_ctl.scala 184:38]
  wire [255:0] fetch_wrindex_dec = 256'h0 << btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 185:41]
  wire [255:0] fetch_wrindex_p1_dec = 256'h0 << btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 186:44]
  wire [255:0] _T_135 = exu_mp_valid ? 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff : 256'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_4 = {{128'd0}, mp_wrindex_dec}; // @[el2_ifu_bp_ctl.scala 187:36]
  wire [255:0] mp_wrlru_b0 = _GEN_4 & _T_135; // @[el2_ifu_bp_ctl.scala 187:36]
  wire [255:0] btb_lru_b0_hold = ~mp_wrlru_b0; // @[el2_ifu_bp_ctl.scala 196:25]
  wire  _T_161 = ~io_exu_mp_pkt_way; // @[el2_ifu_bp_ctl.scala 200:33]
  wire [255:0] _T_164 = _T_161 ? mp_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  reg [255:0] btb_lru_b0_f; // @[Reg.scala 27:20]
  wire [255:0] _T_170 = btb_lru_b0_hold & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 202:71]
  wire [255:0] btb_lru_b0_ns = _T_164 | _T_170; // @[el2_ifu_bp_ctl.scala 202:53]
  wire [255:0] _T_172 = fetch_wrindex_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 204:78]
  wire  _T_173 = |_T_172; // @[el2_ifu_bp_ctl.scala 204:94]
  wire  btb_lru_rd_f = fetch_mp_collision_f ? exu_mp_way_f : _T_173; // @[el2_ifu_bp_ctl.scala 204:25]
  wire [255:0] _T_175 = fetch_wrindex_p1_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 205:87]
  wire  _T_176 = |_T_175; // @[el2_ifu_bp_ctl.scala 205:103]
  wire  btb_lru_rd_p1_f = fetch_mp_collision_p1_f ? exu_mp_way_f : _T_176; // @[el2_ifu_bp_ctl.scala 205:28]
  wire [1:0] _T_179 = {btb_lru_rd_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_182 = {btb_lru_rd_p1_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_183 = _T_129 ? _T_179 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_184 = io_ifc_fetch_addr_f[1] ? _T_182 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_199 = io_ifc_fetch_req_f | exu_mp_valid; // @[el2_ifu_bp_ctl.scala 215:75]
  wire  _T_223 = ~leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 229:79]
  reg [7:0] fghr; // @[el2_ifu_bp_ctl.scala 277:18]
  wire  _T_307 = ~exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 274:6]
  wire  _T_308 = _T_307 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 274:26]
  wire  _T_309 = _T_308 & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 274:47]
  wire  _T_311 = _T_309 & _T_223; // @[el2_ifu_bp_ctl.scala 274:61]
  wire  _T_314 = io_ifc_fetch_req_f & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 275:49]
  wire  _T_316 = _T_314 & _T_223; // @[el2_ifu_bp_ctl.scala 275:63]
  wire  _T_317 = ~_T_316; // @[el2_ifu_bp_ctl.scala 275:28]
  wire  _T_318 = _T_307 & _T_317; // @[el2_ifu_bp_ctl.scala 275:26]
  wire [7:0] _T_320 = exu_flush_final_d1 ? io_exu_mp_fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_321 = _T_311 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_322 = _T_318 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_323 = _T_320 | _T_321; // @[Mux.scala 27:72]
  wire [7:0] fghr_ns = _T_323 | _T_322; // @[Mux.scala 27:72]
  assign io_ifu_bp_hit_taken_f = 1'h0; // @[el2_ifu_bp_ctl.scala 42:25]
  assign io_ifu_bp_btb_target_f = 31'h0; // @[el2_ifu_bp_ctl.scala 43:26]
  assign io_ifu_bp_inst_mask_f = 1'h0; // @[el2_ifu_bp_ctl.scala 44:25]
  assign io_ifu_bp_fghr_f = fghr; // @[el2_ifu_bp_ctl.scala 45:20 el2_ifu_bp_ctl.scala 278:20]
  assign io_ifu_bp_way_f = _T_183 | _T_184; // @[el2_ifu_bp_ctl.scala 46:19 el2_ifu_bp_ctl.scala 280:19]
  assign io_ifu_bp_ret_f = 2'h0; // @[el2_ifu_bp_ctl.scala 47:19 el2_ifu_bp_ctl.scala 286:19]
  assign io_ifu_bp_hist1_f = 2'h0; // @[el2_ifu_bp_ctl.scala 48:21 el2_ifu_bp_ctl.scala 281:21]
  assign io_ifu_bp_hist0_f = 2'h0; // @[el2_ifu_bp_ctl.scala 49:21 el2_ifu_bp_ctl.scala 282:21]
  assign io_ifu_bp_pc4_f = 2'h0; // @[el2_ifu_bp_ctl.scala 50:19 el2_ifu_bp_ctl.scala 283:19]
  assign io_ifu_bp_valid_f = 2'h0; // @[el2_ifu_bp_ctl.scala 51:21 el2_ifu_bp_ctl.scala 285:21]
  assign io_ifu_bp_poffset_f = 12'h0; // @[el2_ifu_bp_ctl.scala 52:23]
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
  leak_one_f_d1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exu_mp_way_f = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  exu_flush_final_d1 = _RAND_2[0:0];
  _RAND_3 = {8{`RANDOM}};
  btb_lru_b0_f = _RAND_3[255:0];
  _RAND_4 = {1{`RANDOM}};
  fghr = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      leak_one_f_d1 <= 1'h0;
    end else begin
      leak_one_f_d1 <= leak_one_f;
    end
    if (reset) begin
      exu_mp_way_f <= 1'h0;
    end else begin
      exu_mp_way_f <= io_exu_mp_pkt_way;
    end
    if (reset) begin
      exu_flush_final_d1 <= 1'h0;
    end else begin
      exu_flush_final_d1 <= io_exu_flush_final;
    end
    if (reset) begin
      btb_lru_b0_f <= 256'h0;
    end else if (_T_199) begin
      btb_lru_b0_f <= btb_lru_b0_ns;
    end
    if (reset) begin
      fghr <= 8'h0;
    end else begin
      fghr <= fghr_ns;
    end
  end
endmodule
