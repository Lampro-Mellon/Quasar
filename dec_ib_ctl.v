module dec_ib_ctl(
  input         clock,
  input         reset,
  input         io_ifu_ib_ifu_i0_icaf,
  input  [1:0]  io_ifu_ib_ifu_i0_icaf_type,
  input         io_ifu_ib_ifu_i0_icaf_second,
  input         io_ifu_ib_ifu_i0_dbecc,
  input  [7:0]  io_ifu_ib_ifu_i0_bp_index,
  input  [7:0]  io_ifu_ib_ifu_i0_bp_fghr,
  input  [4:0]  io_ifu_ib_ifu_i0_bp_btag,
  input         io_ifu_ib_ifu_i0_valid,
  input  [31:0] io_ifu_ib_ifu_i0_instr,
  input  [30:0] io_ifu_ib_ifu_i0_pc,
  input         io_ifu_ib_ifu_i0_pc4,
  input         io_ifu_ib_i0_brp_valid,
  input  [11:0] io_ifu_ib_i0_brp_bits_toffset,
  input  [1:0]  io_ifu_ib_i0_brp_bits_hist,
  input         io_ifu_ib_i0_brp_bits_br_error,
  input         io_ifu_ib_i0_brp_bits_br_start_error,
  input         io_ifu_ib_i0_brp_bits_bank,
  input  [30:0] io_ifu_ib_i0_brp_bits_prett,
  input         io_ifu_ib_i0_brp_bits_way,
  input         io_ifu_ib_i0_brp_bits_ret,
  output [30:0] io_ib_exu_dec_i0_pc_d,
  output        io_ib_exu_dec_debug_wdata_rs1_d,
  input         io_dbg_ib_dbg_cmd_valid,
  input         io_dbg_ib_dbg_cmd_write,
  input  [1:0]  io_dbg_ib_dbg_cmd_type,
  input  [31:0] io_dbg_ib_dbg_cmd_addr,
  output        io_dec_debug_valid_d,
  output        io_dec_ib0_valid_d,
  output [1:0]  io_dec_i0_icaf_type_d,
  output [31:0] io_dec_i0_instr_d,
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
  input  [8:0]  io_ifu_i0_fa_index,
  output [8:0]  io_dec_i0_bp_fa_index,
  output        io_dec_i0_icaf_d,
  output        io_dec_i0_icaf_second_d,
  output        io_dec_i0_dbecc_d,
  output        io_dec_debug_fence_d
);
  wire  _T = io_dbg_ib_dbg_cmd_type != 2'h2; // @[dec_ib_ctl.scala 58:74]
  wire  debug_valid = io_dbg_ib_dbg_cmd_valid & _T; // @[dec_ib_ctl.scala 58:48]
  wire  _T_1 = ~io_dbg_ib_dbg_cmd_write; // @[dec_ib_ctl.scala 59:38]
  wire  debug_read = debug_valid & _T_1; // @[dec_ib_ctl.scala 59:36]
  wire  debug_write = debug_valid & io_dbg_ib_dbg_cmd_write; // @[dec_ib_ctl.scala 60:36]
  wire  _T_2 = io_dbg_ib_dbg_cmd_type == 2'h0; // @[dec_ib_ctl.scala 62:62]
  wire  debug_read_gpr = debug_read & _T_2; // @[dec_ib_ctl.scala 62:37]
  wire  debug_write_gpr = debug_write & _T_2; // @[dec_ib_ctl.scala 63:37]
  wire  _T_4 = io_dbg_ib_dbg_cmd_type == 2'h1; // @[dec_ib_ctl.scala 64:62]
  wire  debug_read_csr = debug_read & _T_4; // @[dec_ib_ctl.scala 64:37]
  wire  debug_write_csr = debug_write & _T_4; // @[dec_ib_ctl.scala 65:37]
  wire [4:0] dreg = io_dbg_ib_dbg_cmd_addr[4:0]; // @[dec_ib_ctl.scala 67:47]
  wire [11:0] dcsr = io_dbg_ib_dbg_cmd_addr[11:0]; // @[dec_ib_ctl.scala 68:47]
  wire [31:0] _T_9 = {12'h0,dreg,15'h6033}; // @[Cat.scala 29:58]
  wire [31:0] _T_12 = {20'h6,dreg,7'h33}; // @[Cat.scala 29:58]
  wire [31:0] _T_14 = {dcsr,20'h2073}; // @[Cat.scala 29:58]
  wire [31:0] _T_16 = {dcsr,20'h1073}; // @[Cat.scala 29:58]
  wire [31:0] _T_17 = debug_read_gpr ? _T_9 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_18 = debug_write_gpr ? _T_12 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_19 = debug_read_csr ? _T_14 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_20 = debug_write_csr ? _T_16 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = _T_17 | _T_18; // @[Mux.scala 27:72]
  wire [31:0] _T_22 = _T_21 | _T_19; // @[Mux.scala 27:72]
  wire [31:0] ib0_debug_in = _T_22 | _T_20; // @[Mux.scala 27:72]
  wire  _T_25 = dcsr == 12'h7c4; // @[dec_ib_ctl.scala 81:51]
  assign io_ib_exu_dec_i0_pc_d = io_ifu_ib_ifu_i0_pc; // @[dec_ib_ctl.scala 37:31]
  assign io_ib_exu_dec_debug_wdata_rs1_d = debug_write_gpr | debug_write_csr; // @[dec_ib_ctl.scala 78:35]
  assign io_dec_debug_valid_d = io_dbg_ib_dbg_cmd_valid & _T; // @[dec_ib_ctl.scala 61:24]
  assign io_dec_ib0_valid_d = io_ifu_ib_ifu_i0_valid | debug_valid; // @[dec_ib_ctl.scala 83:22]
  assign io_dec_i0_icaf_type_d = io_ifu_ib_ifu_i0_icaf_type; // @[dec_ib_ctl.scala 39:31]
  assign io_dec_i0_instr_d = debug_valid ? ib0_debug_in : io_ifu_ib_ifu_i0_instr; // @[dec_ib_ctl.scala 84:22]
  assign io_dec_i0_pc4_d = io_ifu_ib_ifu_i0_pc4; // @[dec_ib_ctl.scala 38:31]
  assign io_dec_i0_brp_valid = io_ifu_ib_i0_brp_valid; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_toffset = io_ifu_ib_i0_brp_bits_toffset; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_hist = io_ifu_ib_i0_brp_bits_hist; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_br_error = io_ifu_ib_i0_brp_bits_br_error; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_br_start_error = io_ifu_ib_i0_brp_bits_br_start_error; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_bank = io_ifu_ib_i0_brp_bits_bank; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_prett = io_ifu_ib_i0_brp_bits_prett; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_way = io_ifu_ib_i0_brp_bits_way; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_brp_bits_ret = io_ifu_ib_i0_brp_bits_ret; // @[dec_ib_ctl.scala 40:31]
  assign io_dec_i0_bp_index = io_ifu_ib_ifu_i0_bp_index; // @[dec_ib_ctl.scala 41:31]
  assign io_dec_i0_bp_fghr = io_ifu_ib_ifu_i0_bp_fghr; // @[dec_ib_ctl.scala 42:31]
  assign io_dec_i0_bp_btag = io_ifu_ib_ifu_i0_bp_btag; // @[dec_ib_ctl.scala 43:31]
  assign io_dec_i0_bp_fa_index = io_ifu_i0_fa_index; // @[dec_ib_ctl.scala 44:25]
  assign io_dec_i0_icaf_d = io_ifu_ib_ifu_i0_icaf; // @[dec_ib_ctl.scala 36:31]
  assign io_dec_i0_icaf_second_d = io_ifu_ib_ifu_i0_icaf_second; // @[dec_ib_ctl.scala 34:35]
  assign io_dec_i0_dbecc_d = io_ifu_ib_ifu_i0_dbecc; // @[dec_ib_ctl.scala 35:31]
  assign io_dec_debug_fence_d = debug_write_csr & _T_25; // @[dec_ib_ctl.scala 81:24]
endmodule
