module reg1(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  _T; // @[GCD.scala 32:20]
  assign io_out = _T; // @[GCD.scala 32:10]
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
  _T = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    _T = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      _T <= 1'h0;
    end else begin
      _T <= io_in;
    end
  end
endmodule
module top(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
  wire  r0_clock; // @[GCD.scala 41:18]
  wire  r0_reset; // @[GCD.scala 41:18]
  wire  r0_io_in; // @[GCD.scala 41:18]
  wire  r0_io_out; // @[GCD.scala 41:18]
  reg1 r0 ( // @[GCD.scala 41:18]
    .clock(r0_clock),
    .reset(r0_reset),
    .io_in(r0_io_in),
    .io_out(r0_io_out)
  );
  assign io_out = r0_io_out; // @[GCD.scala 42:8]
  assign r0_clock = clock;
  assign r0_reset = ~reset; // @[GCD.scala 43:12]
  assign r0_io_in = io_in; // @[GCD.scala 42:8]
endmodule
