module el2_exu_mul_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_mul_p_valid,
  input         io_mul_p_rs1_sign,
  input         io_mul_p_rs2_sign,
  input         io_mul_p_low,
  input         io_mul_p_bext,
  input         io_mul_p_bdep,
  input         io_mul_p_clmul,
  input         io_mul_p_clmulh,
  input         io_mul_p_clmulr,
  input         io_mul_p_grev,
  input         io_mul_p_shfl,
  input         io_mul_p_unshfl,
  input         io_mul_p_crc32_b,
  input         io_mul_p_crc32_h,
  input         io_mul_p_crc32_w,
  input         io_mul_p_crc32c_b,
  input         io_mul_p_crc32c_h,
  input         io_mul_p_crc32c_w,
  input         io_mul_p_bfp,
  input  [31:0] io_rs1_in,
  input  [31:0] io_rs2_in,
  output [31:0] io_result_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  _T_1 = io_mul_p_rs1_sign & io_rs1_in[31]; // @[el2_exu_mul_ctl.scala 23:39]
  wire [32:0] rs1_ext_in = {_T_1,io_rs1_in}; // @[el2_exu_mul_ctl.scala 23:66]
  wire  _T_5 = io_mul_p_rs2_sign & io_rs2_in[31]; // @[el2_exu_mul_ctl.scala 24:39]
  wire [32:0] rs2_ext_in = {_T_5,io_rs2_in}; // @[el2_exu_mul_ctl.scala 24:66]
  reg  low_x; // @[Reg.scala 27:20]
  reg [32:0] rs1_x; // @[Reg.scala 27:20]
  reg [32:0] rs2_x; // @[Reg.scala 27:20]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[el2_exu_mul_ctl.scala 31:20]
  wire  _T_14 = ~low_x; // @[el2_exu_mul_ctl.scala 32:29]
  wire [31:0] _T_18 = _T_14 ? prod_x[63:32] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_19 = low_x ? prod_x[31:0] : 32'h0; // @[Mux.scala 27:72]
  assign io_result_x = _T_18 | _T_19; // @[el2_exu_mul_ctl.scala 32:15]
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
  low_x = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  rs1_x = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  rs2_x = _RAND_2[32:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    low_x = 1'h0;
  end
  if (reset) begin
    rs1_x = 33'sh0;
  end
  if (reset) begin
    rs2_x = 33'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      low_x <= 1'h0;
    end else if (io_mul_p_valid) begin
      low_x <= io_mul_p_low;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rs1_x <= 33'sh0;
    end else if (io_mul_p_valid) begin
      rs1_x <= rs1_ext_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rs2_x <= 33'sh0;
    end else if (io_mul_p_valid) begin
      rs2_x <= rs2_ext_in;
    end
  end
endmodule
