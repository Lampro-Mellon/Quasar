module el2_dec_ib_ctl(
  input         clock,
  input         reset,
  input         io_dbg_cmd_valid,
  input         io_dbg_cmd_write,
  input  [1:0]  io_dbg_cmd_type,
  input  [31:0] io_dbg_cmd_addr,
  input         io_i0_brp_valid,
  input  [11:0] io_i0_brp_bits_toffset,
  input  [1:0]  io_i0_brp_bits_hist,
  input         io_i0_brp_bits_br_error,
  input         io_i0_brp_bits_br_start_error,
  input         io_i0_brp_bits_bank,
  input  [30:0] io_i0_brp_bits_prett,
  input         io_i0_brp_bits_way,
  input         io_i0_brp_bits_ret,
  input  [7:0]  io_ifu_i0_bp_index,
  input  [7:0]  io_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_i0_bp_btag,
  input         io_ifu_i0_pc4,
  input         io_ifu_i0_valid,
  input         io_ifu_i0_icaf,
  input  [1:0]  io_ifu_i0_icaf_type,
  input         io_ifu_i0_icaf_f1,
  input         io_ifu_i0_dbecc,
  input  [31:0] io_ifu_i0_instr,
  input  [30:0] io_ifu_i0_pc,
  output        io_dec_ib0_valid_d,
  output [1:0]  io_dec_i0_icaf_type_d,
  output [31:0] io_dec_i0_instr_d,
  output [30:0] io_dec_i0_pc_d,
  output        io_dec_i0_pc4_d,
  output        io_dec_i0_brp_valid,
  output [11:0] io_dec_i0_brp_bits_toffset,
  output [1:0]  io_dec_i0_brp_bits_hist,
  output        io_dec_i0_brp_bits_br_error,
  output        io_dec_i0_brp_bits_br_start_error,
  output        io_dec_i0_brp_bits_bank,
  output [30:0] io_dec_i0_brp_bits_prett,
  output        io_dec_i0_brp_bits_way,
  output        io_dec_i0_brp_bits_ret,
  output [7:0]  io_dec_i0_bp_index,
  output [7:0]  io_dec_i0_bp_fghr,
  output [4:0]  io_dec_i0_bp_btag,
  output        io_dec_i0_icaf_d,
  output        io_dec_i0_icaf_f1_d,
  output        io_dec_i0_dbecc_d,
  output        io_dec_debug_wdata_rs1_d,
  output        io_dec_debug_fence_d
);
  wire  _T = io_dbg_cmd_type != 2'h2; // @[el2_dec_ib_ctl.scala 31:60]
  wire  debug_valid = io_dbg_cmd_valid & _T; // @[el2_dec_ib_ctl.scala 31:41]
  wire  _T_1 = ~io_dbg_cmd_write; // @[el2_dec_ib_ctl.scala 32:38]
  wire  debug_read = debug_valid & _T_1; // @[el2_dec_ib_ctl.scala 32:36]
  wire  debug_write = debug_valid & io_dbg_cmd_write; // @[el2_dec_ib_ctl.scala 33:36]
  wire  _T_2 = io_dbg_cmd_type == 2'h0; // @[el2_dec_ib_ctl.scala 35:55]
  wire  debug_read_gpr = debug_read & _T_2; // @[el2_dec_ib_ctl.scala 35:37]
  wire  debug_write_gpr = debug_write & _T_2; // @[el2_dec_ib_ctl.scala 36:37]
  wire  _T_4 = io_dbg_cmd_type == 2'h1; // @[el2_dec_ib_ctl.scala 37:55]
  wire  debug_read_csr = debug_read & _T_4; // @[el2_dec_ib_ctl.scala 37:37]
  wire  debug_write_csr = debug_write & _T_4; // @[el2_dec_ib_ctl.scala 38:37]
  wire [4:0] dreg = io_dbg_cmd_addr[4:0]; // @[el2_dec_ib_ctl.scala 40:40]
  wire [11:0] dcsr = io_dbg_cmd_addr[11:0]; // @[el2_dec_ib_ctl.scala 41:40]
  wire [31:0] _T_9 = {12'h0,dreg,15'h6033}; // @[Cat.scala 29:58]
  wire [13:0] _T_12 = {3'h6,dreg,6'h33}; // @[Cat.scala 29:58]
  wire [25:0] _T_14 = {dcsr,14'h2073}; // @[Cat.scala 29:58]
  wire [24:0] _T_16 = {dcsr,13'h1073}; // @[Cat.scala 29:58]
  wire [31:0] _T_17 = debug_read_gpr ? _T_9 : 32'h0; // @[Mux.scala 27:72]
  wire [13:0] _T_18 = debug_write_gpr ? _T_12 : 14'h0; // @[Mux.scala 27:72]
  wire [25:0] _T_19 = debug_read_csr ? _T_14 : 26'h0; // @[Mux.scala 27:72]
  wire [24:0] _T_20 = debug_write_csr ? _T_16 : 25'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_0 = {{18'd0}, _T_18}; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = _T_17 | _GEN_0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_1 = {{6'd0}, _T_19}; // @[Mux.scala 27:72]
  wire [31:0] _T_22 = _T_21 | _GEN_1; // @[Mux.scala 27:72]
  wire [31:0] _GEN_2 = {{7'd0}, _T_20}; // @[Mux.scala 27:72]
  wire [31:0] ib0_debug_in = _T_22 | _GEN_2; // @[Mux.scala 27:72]
  wire  _T_25 = dcsr == 12'h7c4; // @[el2_dec_ib_ctl.scala 54:51]
  assign io_dec_ib0_valid_d = io_ifu_i0_valid | debug_valid; // @[el2_dec_ib_ctl.scala 56:22]
  assign io_dec_i0_icaf_type_d = io_ifu_i0_icaf_type; // @[el2_dec_ib_ctl.scala 13:31]
  assign io_dec_i0_instr_d = debug_valid ? ib0_debug_in : io_ifu_i0_instr; // @[el2_dec_ib_ctl.scala 57:22]
  assign io_dec_i0_pc_d = io_ifu_i0_pc; // @[el2_dec_ib_ctl.scala 11:31]
  assign io_dec_i0_pc4_d = io_ifu_i0_pc4; // @[el2_dec_ib_ctl.scala 12:31]
  assign io_dec_i0_brp_valid = io_i0_brp_valid; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_toffset = io_i0_brp_bits_toffset; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_hist = io_i0_brp_bits_hist; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_br_error = io_i0_brp_bits_br_error; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_br_start_error = io_i0_brp_bits_br_start_error; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_bank = io_i0_brp_bits_bank; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_prett = io_i0_brp_bits_prett; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_way = io_i0_brp_bits_way; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_brp_bits_ret = io_i0_brp_bits_ret; // @[el2_dec_ib_ctl.scala 14:31]
  assign io_dec_i0_bp_index = io_ifu_i0_bp_index; // @[el2_dec_ib_ctl.scala 15:31]
  assign io_dec_i0_bp_fghr = io_ifu_i0_bp_fghr; // @[el2_dec_ib_ctl.scala 16:31]
  assign io_dec_i0_bp_btag = io_ifu_i0_bp_btag; // @[el2_dec_ib_ctl.scala 17:31]
  assign io_dec_i0_icaf_d = io_ifu_i0_icaf; // @[el2_dec_ib_ctl.scala 10:31]
  assign io_dec_i0_icaf_f1_d = io_ifu_i0_icaf_f1; // @[el2_dec_ib_ctl.scala 8:31]
  assign io_dec_i0_dbecc_d = io_ifu_i0_dbecc; // @[el2_dec_ib_ctl.scala 9:31]
  assign io_dec_debug_wdata_rs1_d = debug_write_gpr | debug_write_csr; // @[el2_dec_ib_ctl.scala 51:28]
  assign io_dec_debug_fence_d = debug_write_csr & _T_25; // @[el2_dec_ib_ctl.scala 54:24]
endmodule
