module rvdffs(
  input         clock,
  input         reset,
  input  [31:0] io_din,
  input         io_en,
  input         io_clear,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [9:0] _T_9 = {io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear}; // @[Cat.scala 29:58]
  wire [18:0] _T_18 = {_T_9,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear}; // @[Cat.scala 29:58]
  wire [27:0] _T_27 = {_T_18,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear,io_clear}; // @[Cat.scala 29:58]
  wire [31:0] _T_31 = {_T_27,io_clear,io_clear,io_clear,io_clear}; // @[Cat.scala 29:58]
  wire [31:0] _T_32 = io_din & _T_31; // @[el2_ifu_ic_mem.scala 93:30]
  reg [31:0] _T_33; // @[Reg.scala 27:20]
  assign io_out = _T_33; // @[el2_ifu_ic_mem.scala 93:10]
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
  _T_33 = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      _T_33 <= 32'h0;
    end else if (io_en) begin
      _T_33 <= _T_32;
    end
  end
endmodule
