module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 332:24]
  wire  clkhdr_CK; // @[beh_lib.scala 332:24]
  wire  clkhdr_EN; // @[beh_lib.scala 332:24]
  wire  clkhdr_SE; // @[beh_lib.scala 332:24]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 332:24]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 333:12]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 334:16]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 335:16]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 336:16]
endmodule
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
  wire  rvclkhdr_io_l1clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_io_clk; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_io_en; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_io_scan_mode; // @[beh_lib.scala 352:21]
  wire  rvclkhdr_1_io_l1clk; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_1_io_clk; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_1_io_en; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_1_io_scan_mode; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_2_io_l1clk; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_2_io_clk; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_2_io_en; // @[beh_lib.scala 372:21]
  wire  rvclkhdr_2_io_scan_mode; // @[beh_lib.scala 372:21]
  wire  _T_1 = io_mul_p_rs1_sign & io_rs1_in[31]; // @[el2_exu_mul_ctl.scala 26:39]
  wire  _T_5 = io_mul_p_rs2_sign & io_rs2_in[31]; // @[el2_exu_mul_ctl.scala 27:39]
  reg  low_x; // @[beh_lib.scala 358:14]
  reg [32:0] rs1_x; // @[beh_lib.scala 378:14]
  reg [32:0] rs2_x; // @[beh_lib.scala 378:14]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[el2_exu_mul_ctl.scala 40:20]
  wire  _T_16 = ~low_x; // @[el2_exu_mul_ctl.scala 41:29]
  wire [31:0] _T_20 = _T_16 ? prod_x[63:32] : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_21 = low_x ? prod_x[31:0] : 32'h0; // @[Mux.scala 27:72]
  rvclkhdr rvclkhdr ( // @[beh_lib.scala 352:21]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[beh_lib.scala 372:21]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[beh_lib.scala 372:21]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  assign io_result_x = _T_20 | _T_21; // @[el2_exu_mul_ctl.scala 41:15]
  assign rvclkhdr_io_clk = clock; // @[beh_lib.scala 354:16]
  assign rvclkhdr_io_en = io_mul_p_valid; // @[beh_lib.scala 355:15]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[beh_lib.scala 356:22]
  assign rvclkhdr_1_io_clk = clock; // @[beh_lib.scala 374:16]
  assign rvclkhdr_1_io_en = io_mul_p_valid; // @[beh_lib.scala 375:15]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[beh_lib.scala 376:22]
  assign rvclkhdr_2_io_clk = clock; // @[beh_lib.scala 374:16]
  assign rvclkhdr_2_io_en = io_mul_p_valid; // @[beh_lib.scala 375:15]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[beh_lib.scala 376:22]
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
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      low_x <= 1'h0;
    end else begin
      low_x <= io_mul_p_low;
    end
  end
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      rs1_x <= 33'sh0;
    end else begin
      rs1_x <= {_T_1,io_rs1_in};
    end
  end
  always @(posedge rvclkhdr_2_io_l1clk or posedge reset) begin
    if (reset) begin
      rs2_x <= 33'sh0;
    end else begin
      rs2_x <= {_T_5,io_rs2_in};
    end
  end
endmodule
