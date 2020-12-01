module rvjtag_tap(
  input         clock,
  input         reset,
  input         io_trst,
  input         io_tck,
  input         io_tms,
  input         io_tdi,
  output        io_dmi_reset,
  output        io_dmi_hard_reset,
  input  [1:0]  io_rd_status,
  input  [1:0]  io_dmi_stat,
  input  [2:0]  io_idle,
  input  [3:0]  io_version,
  input  [30:0] io_jtag_id,
  input  [31:0] io_rd_data,
  output        io_tdo,
  output        io_tdoEnable,
  output        io_wr_en,
  output        io_rd_en,
  output [31:0] io_wr_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [40:0] sr; // @[rvjtag_tap.scala 32:55]
  reg [3:0] state; // @[rvjtag_tap.scala 39:57]
  wire  jtag_reset = 4'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h3 == state; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_10 = 4'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_14 = 4'h7 == state; // @[Conditional.scala 37:30]
  wire  _T_16 = 4'h8 == state; // @[Conditional.scala 37:30]
  wire  _T_18 = 4'h9 == state; // @[Conditional.scala 37:30]
  wire  _T_20 = 4'ha == state; // @[Conditional.scala 37:30]
  wire  _T_22 = 4'hb == state; // @[Conditional.scala 37:30]
  wire  _T_24 = 4'hc == state; // @[Conditional.scala 37:30]
  wire  _T_26 = 4'hd == state; // @[Conditional.scala 37:30]
  wire  _T_28 = 4'he == state; // @[Conditional.scala 37:30]
  wire  _T_30 = 4'hf == state; // @[Conditional.scala 37:30]
  wire  _GEN_3 = _T_28 ? 1'h0 : _T_30; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_26 ? 1'h0 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_24 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_22 ? 1'h0 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_20 ? 1'h0 : _T_22; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_20 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_18 ? 1'h0 : _T_20; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_18 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_18 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_16 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_16 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_16 ? 1'h0 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_14 ? 1'h0 : _T_16; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_14 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_14 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_14 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_12 ? 1'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_12 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_12 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_12 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_10 ? 1'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_10 ? 1'h0 : _GEN_39; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_10 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_49 = _T_10 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_8 ? 1'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_8 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_8 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_57 = _T_8 ? 1'h0 : _GEN_49; // @[Conditional.scala 39:67]
  wire  _GEN_60 = _T_6 ? 1'h0 : _T_8; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_6 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire  _GEN_63 = _T_6 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_64 = _T_6 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_6 ? 1'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_4 ? 1'h0 : _T_6; // @[Conditional.scala 39:67]
  wire  _GEN_69 = _T_4 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_4 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_4 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_4 ? 1'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_4 ? 1'h0 : _GEN_66; // @[Conditional.scala 39:67]
  wire  _GEN_77 = _T_2 ? 1'h0 : _GEN_68; // @[Conditional.scala 39:67]
  wire  _GEN_78 = _T_2 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67]
  wire  _GEN_80 = _T_2 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67]
  wire  _GEN_81 = _T_2 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67]
  wire  _GEN_82 = _T_2 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67]
  wire  _GEN_84 = _T_2 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67]
  wire  capture_dr = jtag_reset ? 1'h0 : _GEN_77; // @[Conditional.scala 40:58]
  wire  shift_dr = jtag_reset ? 1'h0 : _GEN_78; // @[Conditional.scala 40:58]
  wire  update_dr = jtag_reset ? 1'h0 : _GEN_80; // @[Conditional.scala 40:58]
  wire  capture_ir = jtag_reset ? 1'h0 : _GEN_81; // @[Conditional.scala 40:58]
  wire  shift_ir = jtag_reset ? 1'h0 : _GEN_82; // @[Conditional.scala 40:58]
  wire  update_ir = jtag_reset ? 1'h0 : _GEN_84; // @[Conditional.scala 40:58]
  wire  _T_34 = sr[4:0] == 5'h0; // @[rvjtag_tap.scala 85:98]
  reg [4:0] ir; // @[rvjtag_tap.scala 85:52]
  wire  devid_sel = ir == 5'h1; // @[rvjtag_tap.scala 86:18]
  wire  _T_42 = ir == 5'h11; // @[rvjtag_tap.scala 87:22]
  wire  _T_43 = ir == 5'h10; // @[rvjtag_tap.scala 87:32]
  wire [1:0] dr_en = {_T_42,_T_43}; // @[Cat.scala 29:58]
  wire [40:0] _T_49 = {io_tdi,sr[40:1]}; // @[Cat.scala 29:58]
  wire  _T_53 = dr_en[0] | devid_sel; // @[rvjtag_tap.scala 94:32]
  wire [40:0] _T_57 = {9'h0,io_tdi,sr[31:1]}; // @[Cat.scala 29:58]
  wire [40:0] _T_59 = {40'h0,io_tdi}; // @[Cat.scala 29:58]
  wire [40:0] _T_66 = {26'h0,io_idle,io_dmi_stat,6'h7,io_version}; // @[Cat.scala 29:58]
  wire [40:0] _T_70 = {7'h0,io_rd_data,io_rd_status}; // @[Cat.scala 29:58]
  wire [40:0] _T_73 = {9'h0,io_jtag_id,1'h1}; // @[Cat.scala 29:58]
  wire [40:0] _T_78 = {36'h0,io_tdi,sr[4:1]}; // @[Cat.scala 29:58]
  reg  _T_83; // @[rvjtag_tap.scala 106:37]
  wire  _T_86 = update_dr & dr_en[0]; // @[rvjtag_tap.scala 108:82]
  reg  _T_89; // @[rvjtag_tap.scala 108:67]
  reg  _T_95; // @[rvjtag_tap.scala 109:62]
  wire  _T_98 = update_dr & dr_en[1]; // @[rvjtag_tap.scala 111:67]
  reg [40:0] dr; // @[rvjtag_tap.scala 111:52]
  wire [40:0] _T_100 = {dr[40:2],2'h0}; // @[Cat.scala 29:58]
  assign io_dmi_reset = _T_95; // @[rvjtag_tap.scala 109:52]
  assign io_dmi_hard_reset = _T_89; // @[rvjtag_tap.scala 108:57]
  assign io_tdo = _T_83; // @[rvjtag_tap.scala 106:28]
  assign io_tdoEnable = shift_dr | shift_ir; // @[rvjtag_tap.scala 81:16]
  assign io_wr_en = dr[1]; // @[rvjtag_tap.scala 114:14]
  assign io_rd_en = dr[0]; // @[rvjtag_tap.scala 113:14]
  assign io_wr_data = dr[33:2]; // @[rvjtag_tap.scala 115:14]
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
  _RAND_0 = {2{`RANDOM}};
  sr = _RAND_0[40:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  ir = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  _T_83 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_89 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  _T_95 = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  dr = _RAND_6[40:0];
`endif // RANDOMIZE_REG_INIT
  if (io_trst) begin
    sr = 41'h0;
  end
  if (io_trst) begin
    state = 4'h0;
  end
  if (io_trst) begin
    ir = 5'h1;
  end
  if (reset) begin
    _T_83 = 1'h0;
  end
  if (io_trst) begin
    _T_89 = 1'h0;
  end
  if (io_trst) begin
    _T_95 = 1'h0;
  end
  if (io_trst) begin
    dr = 41'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      sr <= 41'h0;
    end else if (shift_dr) begin
      if (dr_en[1]) begin
        sr <= _T_49;
      end else if (_T_53) begin
        sr <= _T_57;
      end else begin
        sr <= _T_59;
      end
    end else if (capture_dr) begin
      if (dr_en[0]) begin
        sr <= _T_66;
      end else if (dr_en[1]) begin
        sr <= _T_70;
      end else if (devid_sel) begin
        sr <= _T_73;
      end else begin
        sr <= 41'h0;
      end
    end else if (shift_ir) begin
      sr <= _T_78;
    end else if (capture_ir) begin
      sr <= 41'h1;
    end else begin
      sr <= 41'h0;
    end
  end
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      state <= 4'h0;
    end else if (jtag_reset) begin
      if (io_tms) begin
        state <= 4'h0;
      end else begin
        state <= 4'h1;
      end
    end else if (_T_2) begin
      if (io_tms) begin
        state <= 4'h2;
      end else begin
        state <= 4'h1;
      end
    end else if (_T_4) begin
      if (io_tms) begin
        state <= 4'h9;
      end else begin
        state <= 4'h3;
      end
    end else if (_T_6) begin
      if (io_tms) begin
        state <= 4'h5;
      end else begin
        state <= 4'h4;
      end
    end else if (_T_8) begin
      if (io_tms) begin
        state <= 4'h5;
      end else begin
        state <= 4'h4;
      end
    end else if (_T_10) begin
      if (io_tms) begin
        state <= 4'h8;
      end else begin
        state <= 4'h6;
      end
    end else if (_T_12) begin
      if (io_tms) begin
        state <= 4'h7;
      end else begin
        state <= 4'h6;
      end
    end else if (_T_14) begin
      if (io_tms) begin
        state <= 4'h8;
      end else begin
        state <= 4'h4;
      end
    end else if (_T_16) begin
      if (io_tms) begin
        state <= 4'h2;
      end else begin
        state <= 4'h1;
      end
    end else if (_T_18) begin
      if (io_tms) begin
        state <= 4'h0;
      end else begin
        state <= 4'ha;
      end
    end else if (_T_20) begin
      if (io_tms) begin
        state <= 4'hc;
      end else begin
        state <= 4'hb;
      end
    end else if (_T_22) begin
      if (io_tms) begin
        state <= 4'hc;
      end else begin
        state <= 4'hb;
      end
    end else if (_T_24) begin
      if (io_tms) begin
        state <= 4'hf;
      end else begin
        state <= 4'hd;
      end
    end else if (_T_26) begin
      if (io_tms) begin
        state <= 4'he;
      end else begin
        state <= 4'hd;
      end
    end else if (_T_28) begin
      if (io_tms) begin
        state <= 4'hf;
      end else begin
        state <= 4'hb;
      end
    end else if (_T_30) begin
      if (io_tms) begin
        state <= 4'h2;
      end else begin
        state <= 4'h1;
      end
    end else begin
      state <= 4'h0;
    end
  end
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      ir <= 5'h1;
    end else if (jtag_reset) begin
      ir <= 5'h1;
    end else if (update_ir) begin
      if (_T_34) begin
        ir <= 5'h1f;
      end else begin
        ir <= sr[4:0];
      end
    end else begin
      ir <= 5'h0;
    end
  end
  always @(posedge io_tck or posedge reset) begin
    if (reset) begin
      _T_83 <= 1'h0;
    end else begin
      _T_83 <= sr[0];
    end
  end
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      _T_89 <= 1'h0;
    end else begin
      _T_89 <= _T_86 & sr[17];
    end
  end
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      _T_95 <= 1'h0;
    end else begin
      _T_95 <= _T_86 & sr[16];
    end
  end
  always @(posedge io_tck or posedge io_trst) begin
    if (io_trst) begin
      dr <= 41'h0;
    end else if (_T_98) begin
      dr <= sr;
    end else begin
      dr <= _T_100;
    end
  end
endmodule
