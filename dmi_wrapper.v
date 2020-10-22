module dmi_jtag_to_core_sync(
  input   clock,
  input   reset,
  output  io_reg_en,
  output  io_reg_wr_en
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] rden; // @[dmi_jtag_to_core_sync.scala 25:18]
  reg [2:0] wren; // @[dmi_jtag_to_core_sync.scala 26:18]
  wire  _T_8 = ~rden[2]; // @[dmi_jtag_to_core_sync.scala 28:27]
  wire  c_rd_en = rden[1] & _T_8; // @[dmi_jtag_to_core_sync.scala 28:25]
  wire  _T_11 = ~wren[2]; // @[dmi_jtag_to_core_sync.scala 29:27]
  wire  c_wr_en = wren[1] & _T_11; // @[dmi_jtag_to_core_sync.scala 29:25]
  assign io_reg_en = c_wr_en | c_rd_en; // @[dmi_jtag_to_core_sync.scala 19:16 dmi_jtag_to_core_sync.scala 31:13]
  assign io_reg_wr_en = wren[1] & _T_11; // @[dmi_jtag_to_core_sync.scala 20:16 dmi_jtag_to_core_sync.scala 32:16]
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
  rden = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  wren = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    rden = 3'h0;
  end
  if (reset) begin
    wren = 3'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rden <= 3'h0;
    end else begin
      rden <= {rden[1:0],1'h0};
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wren <= 3'h0;
    end else begin
      wren <= {wren[1:0],1'h0};
    end
  end
endmodule
module dmi_wrapper(
  input         clock,
  input         reset,
  input         io_tck,
  input         io_tms,
  input         io_tdi,
  output        io_tdo,
  output        io_tdoEnable,
  input         io_core_clk,
  input  [31:0] io_jtag_id,
  input  [31:0] io_rd_data,
  output [31:0] io_reg_wr_data,
  output [6:0]  io_reg_wr_addr,
  output        io_reg_en,
  output        io_reg_wr_en,
  output        io_dmi_hard_reset
);
  wire  i_dmi_jtag_to_core_sync_clock; // @[dmi_wrapper.scala 56:40]
  wire  i_dmi_jtag_to_core_sync_reset; // @[dmi_wrapper.scala 56:40]
  wire  i_dmi_jtag_to_core_sync_io_reg_en; // @[dmi_wrapper.scala 56:40]
  wire  i_dmi_jtag_to_core_sync_io_reg_wr_en; // @[dmi_wrapper.scala 56:40]
  dmi_jtag_to_core_sync i_dmi_jtag_to_core_sync ( // @[dmi_wrapper.scala 56:40]
    .clock(i_dmi_jtag_to_core_sync_clock),
    .reset(i_dmi_jtag_to_core_sync_reset),
    .io_reg_en(i_dmi_jtag_to_core_sync_io_reg_en),
    .io_reg_wr_en(i_dmi_jtag_to_core_sync_io_reg_wr_en)
  );
  assign io_tdo = 1'h0; // @[dmi_wrapper.scala 46:27]
  assign io_tdoEnable = 1'h0; // @[dmi_wrapper.scala 47:27]
  assign io_reg_wr_data = 32'h0; // @[dmi_wrapper.scala 48:27]
  assign io_reg_wr_addr = 7'h0; // @[dmi_wrapper.scala 49:27]
  assign io_reg_en = i_dmi_jtag_to_core_sync_io_reg_en; // @[dmi_wrapper.scala 59:39]
  assign io_reg_wr_en = i_dmi_jtag_to_core_sync_io_reg_wr_en; // @[dmi_wrapper.scala 60:39]
  assign io_dmi_hard_reset = 1'h0; // @[dmi_wrapper.scala 52:27]
  assign i_dmi_jtag_to_core_sync_clock = clock;
  assign i_dmi_jtag_to_core_sync_reset = reset;
endmodule
