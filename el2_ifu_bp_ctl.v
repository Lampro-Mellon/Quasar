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
  wire  _T_36 = io_dec_tlu_flush_leak_one_wb & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 137:47]
  reg  leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 132:30]
  wire  _T_37 = leak_one_f_d1 & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 137:93]
  wire  leak_one_f = _T_36 | _T_37; // @[el2_ifu_bp_ctl.scala 137:76]
  wire  _T = ~leak_one_f; // @[el2_ifu_bp_ctl.scala 69:43]
  wire  exu_mp_valid = io_exu_mp_pkt_misp & _T; // @[el2_ifu_bp_ctl.scala 69:41]
  wire [7:0] _T_3 = io_ifc_fetch_addr_f[9:2] ^ io_ifc_fetch_addr_f[17:10]; // @[el2_lib.scala 182:42]
  wire [7:0] btb_rd_addr_f = _T_3 ^ io_ifc_fetch_addr_f[25:18]; // @[el2_lib.scala 182:76]
  wire [31:0] fetch_addr_p1_f = io_ifc_fetch_addr_f + 32'h4; // @[el2_ifu_bp_ctl.scala 108:45]
  wire [7:0] _T_8 = fetch_addr_p1_f[9:2] ^ fetch_addr_p1_f[17:10]; // @[el2_lib.scala 182:42]
  wire [7:0] btb_rd_addr_p1_f = _T_8 ^ fetch_addr_p1_f[25:18]; // @[el2_lib.scala 182:76]
  wire  _T_139 = ~io_ifc_fetch_addr_f[1]; // @[el2_ifu_bp_ctl.scala 184:40]
  wire [4:0] _T_22 = io_ifc_fetch_addr_f[14:10] ^ io_ifc_fetch_addr_f[19:15]; // @[el2_lib.scala 175:111]
  wire [4:0] fetch_rd_tag_f = _T_22 ^ io_ifc_fetch_addr_f[24:20]; // @[el2_lib.scala 175:111]
  wire [4:0] _T_27 = fetch_addr_p1_f[14:10] ^ fetch_addr_p1_f[19:15]; // @[el2_lib.scala 175:111]
  wire [4:0] fetch_rd_tag_p1_f = _T_27 ^ fetch_addr_p1_f[24:20]; // @[el2_lib.scala 175:111]
  wire [1:0] fetch_start_f = {io_ifc_fetch_addr_f[1],_T_139}; // @[Cat.scala 29:58]
  wire  _T_28 = io_exu_mp_btag == fetch_rd_tag_f; // @[el2_ifu_bp_ctl.scala 129:46]
  wire  _T_29 = _T_28 & exu_mp_valid; // @[el2_ifu_bp_ctl.scala 129:66]
  wire  _T_30 = _T_29 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 129:81]
  wire [7:0] _GEN_12 = {{1'd0}, io_exu_mp_index}; // @[el2_ifu_bp_ctl.scala 129:117]
  wire  _T_31 = _GEN_12 == btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 129:117]
  wire  fetch_mp_collision_f = _T_30 & _T_31; // @[el2_ifu_bp_ctl.scala 129:102]
  wire  _T_32 = io_exu_mp_btag == fetch_rd_tag_p1_f; // @[el2_ifu_bp_ctl.scala 130:49]
  wire  _T_33 = _T_32 & exu_mp_valid; // @[el2_ifu_bp_ctl.scala 130:72]
  wire  _T_34 = _T_33 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 130:87]
  wire  _T_35 = _GEN_12 == btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 130:123]
  wire  fetch_mp_collision_p1_f = _T_34 & _T_35; // @[el2_ifu_bp_ctl.scala 130:108]
  reg  exu_mp_way_f; // @[el2_ifu_bp_ctl.scala 134:29]
  reg  exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 135:35]
  wire [127:0] mp_wrindex_dec = 128'h0 << io_exu_mp_index; // @[el2_ifu_bp_ctl.scala 188:38]
  wire [255:0] fetch_wrindex_dec = 256'h0 << btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 189:41]
  wire [255:0] fetch_wrindex_p1_dec = 256'h0 << btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 190:44]
  wire [255:0] _T_145 = exu_mp_valid ? 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff : 256'h0; // @[Bitwise.scala 72:12]
  wire [255:0] _GEN_14 = {{128'd0}, mp_wrindex_dec}; // @[el2_ifu_bp_ctl.scala 191:36]
  wire [255:0] mp_wrlru_b0 = _GEN_14 & _T_145; // @[el2_ifu_bp_ctl.scala 191:36]
  wire [255:0] btb_lru_b0_hold = ~mp_wrlru_b0; // @[el2_ifu_bp_ctl.scala 200:25]
  wire  _T_171 = ~io_exu_mp_pkt_way; // @[el2_ifu_bp_ctl.scala 204:33]
  wire [255:0] _T_174 = _T_171 ? mp_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  reg [255:0] btb_lru_b0_f; // @[Reg.scala 27:20]
  wire [255:0] _T_180 = btb_lru_b0_hold & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 206:71]
  wire [255:0] btb_lru_b0_ns = _T_174 | _T_180; // @[el2_ifu_bp_ctl.scala 206:53]
  wire [255:0] _T_182 = fetch_wrindex_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 208:78]
  wire  _T_183 = |_T_182; // @[el2_ifu_bp_ctl.scala 208:94]
  wire  btb_lru_rd_f = fetch_mp_collision_f ? exu_mp_way_f : _T_183; // @[el2_ifu_bp_ctl.scala 208:25]
  wire [255:0] _T_185 = fetch_wrindex_p1_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 209:87]
  wire  _T_186 = |_T_185; // @[el2_ifu_bp_ctl.scala 209:103]
  wire  btb_lru_rd_p1_f = fetch_mp_collision_p1_f ? exu_mp_way_f : _T_186; // @[el2_ifu_bp_ctl.scala 209:28]
  wire [1:0] _T_189 = {btb_lru_rd_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_192 = {btb_lru_rd_p1_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_193 = _T_139 ? _T_189 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_194 = io_ifc_fetch_addr_f[1] ? _T_192 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_209 = io_ifc_fetch_req_f | exu_mp_valid; // @[el2_ifu_bp_ctl.scala 219:75]
  wire  _T_233 = ~leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 233:79]
  reg [7:0] fghr; // @[el2_ifu_bp_ctl.scala 281:18]
  wire  _T_317 = ~exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 278:6]
  wire  _T_318 = _T_317 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 278:26]
  wire  _T_319 = _T_318 & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 278:47]
  wire  _T_321 = _T_319 & _T_233; // @[el2_ifu_bp_ctl.scala 278:61]
  wire  _T_324 = io_ifc_fetch_req_f & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 279:49]
  wire  _T_326 = _T_324 & _T_233; // @[el2_ifu_bp_ctl.scala 279:63]
  wire  _T_327 = ~_T_326; // @[el2_ifu_bp_ctl.scala 279:28]
  wire  _T_328 = _T_317 & _T_327; // @[el2_ifu_bp_ctl.scala 279:26]
  wire [7:0] _T_330 = exu_flush_final_d1 ? io_exu_mp_fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_331 = _T_321 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_332 = _T_328 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_333 = _T_330 | _T_331; // @[Mux.scala 27:72]
  wire [7:0] fghr_ns = _T_333 | _T_332; // @[Mux.scala 27:72]
  wire  _T_342 = ~fetch_start_f[0]; // @[el2_ifu_bp_ctl.scala 292:36]
  wire [1:0] bloc_f = {fetch_start_f[0],_T_342}; // @[Cat.scala 29:58]
  wire  use_fa_plus = io_ifc_fetch_addr_f[0]; // @[el2_ifu_bp_ctl.scala 295:56]
  wire  bp_total_branch_offset_f = bloc_f[1]; // @[el2_ifu_bp_ctl.scala 298:40]
  wire  _T_374 = ~use_fa_plus; // @[el2_ifu_bp_ctl.scala 305:27]
  wire [31:0] _T_378 = use_fa_plus ? fetch_addr_p1_f : 32'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_380 = _T_374 ? io_ifc_fetch_addr_f[31:2] : 30'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_15 = {{2'd0}, _T_380}; // @[Mux.scala 27:72]
  wire [31:0] adder_pc_in_f = _T_378 | _GEN_15; // @[Mux.scala 27:72]
  wire [31:0] _T_385 = {adder_pc_in_f[31:2],bp_total_branch_offset_f,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_389 = {{1'd0}, _T_385[12:1]}; // @[el2_lib.scala 199:31]
  wire [18:0] _T_392 = _T_385[31:13] + 19'h1; // @[el2_lib.scala 200:27]
  wire  _T_398 = ~_T_389[12]; // @[el2_lib.scala 203:27]
  wire [18:0] _T_410 = _T_398 ? _T_385[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_411 = _T_389[12] ? _T_392 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_413 = _T_410 | _T_411; // @[Mux.scala 27:72]
  wire [31:0] bp_btb_target_adder_f = {_T_413,_T_389[11:0],1'h0}; // @[Cat.scala 29:58]
  assign io_ifu_bp_hit_taken_f = 1'h0; // @[el2_ifu_bp_ctl.scala 44:25]
  assign io_ifu_bp_btb_target_f = bp_btb_target_adder_f[31:1]; // @[el2_ifu_bp_ctl.scala 45:26 el2_ifu_bp_ctl.scala 312:26]
  assign io_ifu_bp_inst_mask_f = 1'h0; // @[el2_ifu_bp_ctl.scala 46:25]
  assign io_ifu_bp_fghr_f = fghr; // @[el2_ifu_bp_ctl.scala 47:20 el2_ifu_bp_ctl.scala 282:20]
  assign io_ifu_bp_way_f = _T_193 | _T_194; // @[el2_ifu_bp_ctl.scala 48:19 el2_ifu_bp_ctl.scala 284:19]
  assign io_ifu_bp_ret_f = 2'h0; // @[el2_ifu_bp_ctl.scala 49:19 el2_ifu_bp_ctl.scala 290:19]
  assign io_ifu_bp_hist1_f = 2'h0; // @[el2_ifu_bp_ctl.scala 50:21 el2_ifu_bp_ctl.scala 285:21]
  assign io_ifu_bp_hist0_f = 2'h0; // @[el2_ifu_bp_ctl.scala 51:21 el2_ifu_bp_ctl.scala 286:21]
  assign io_ifu_bp_pc4_f = 2'h0; // @[el2_ifu_bp_ctl.scala 52:19 el2_ifu_bp_ctl.scala 287:19]
  assign io_ifu_bp_valid_f = 2'h0; // @[el2_ifu_bp_ctl.scala 53:21 el2_ifu_bp_ctl.scala 289:21]
  assign io_ifu_bp_poffset_f = 12'h0; // @[el2_ifu_bp_ctl.scala 54:23]
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
    end else if (_T_209) begin
      btb_lru_b0_f <= btb_lru_b0_ns;
    end
    if (reset) begin
      fghr <= 8'h0;
    end else begin
      fghr <= fghr_ns;
    end
  end
endmodule
