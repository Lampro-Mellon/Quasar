module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en
);
  wire  clkhdr_Q; // @[lib.scala 334:26]
  wire  clkhdr_CK; // @[lib.scala 334:26]
  wire  clkhdr_EN; // @[lib.scala 334:26]
  wire  clkhdr_SE; // @[lib.scala 334:26]
  gated_latch clkhdr ( // @[lib.scala 334:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[lib.scala 335:14]
  assign clkhdr_CK = io_clk; // @[lib.scala 336:18]
  assign clkhdr_EN = io_en; // @[lib.scala 337:18]
  assign clkhdr_SE = 1'h0; // @[lib.scala 338:18]
endmodule
module exu_mul_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_mul_p_valid,
  input         io_mul_p_bits_rs1_sign,
  input         io_mul_p_bits_rs2_sign,
  input         io_mul_p_bits_low,
  input         io_mul_p_bits_bext,
  input         io_mul_p_bits_bdep,
  input         io_mul_p_bits_clmul,
  input         io_mul_p_bits_clmulh,
  input         io_mul_p_bits_clmulr,
  input         io_mul_p_bits_grev,
  input         io_mul_p_bits_gorc,
  input         io_mul_p_bits_shfl,
  input         io_mul_p_bits_unshfl,
  input         io_mul_p_bits_crc32_b,
  input         io_mul_p_bits_crc32_h,
  input         io_mul_p_bits_crc32_w,
  input         io_mul_p_bits_crc32c_b,
  input         io_mul_p_bits_crc32c_h,
  input         io_mul_p_bits_crc32c_w,
  input         io_mul_p_bits_bfp,
  input  [31:0] io_rs1_in,
  input  [31:0] io_rs2_in,
  output [31:0] io_result_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_1_io_l1clk; // @[lib.scala 422:23]
  wire  rvclkhdr_1_io_clk; // @[lib.scala 422:23]
  wire  rvclkhdr_1_io_en; // @[lib.scala 422:23]
  wire  rvclkhdr_2_io_l1clk; // @[lib.scala 422:23]
  wire  rvclkhdr_2_io_clk; // @[lib.scala 422:23]
  wire  rvclkhdr_2_io_en; // @[lib.scala 422:23]
  wire  rvclkhdr_3_io_l1clk; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_3_io_en; // @[lib.scala 399:23]
  wire  rvclkhdr_4_io_l1clk; // @[lib.scala 399:23]
  wire  rvclkhdr_4_io_clk; // @[lib.scala 399:23]
  wire  rvclkhdr_4_io_en; // @[lib.scala 399:23]
  wire  _T_1 = io_mul_p_bits_rs1_sign & io_rs1_in[31]; // @[exu_mul_ctl.scala 123:44]
  wire  _T_5 = io_mul_p_bits_rs2_sign & io_rs2_in[31]; // @[exu_mul_ctl.scala 124:44]
  reg  low_x; // @[Reg.scala 27:20]
  reg [32:0] rs1_x; // @[lib.scala 428:16]
  reg [32:0] rs2_x; // @[lib.scala 428:16]
  wire [65:0] prod_x = $signed(rs1_x) * $signed(rs2_x); // @[exu_mul_ctl.scala 130:20]
  wire  _T_39758 = ~low_x; // @[exu_mul_ctl.scala 388:46]
  wire [7:0] _T_39762 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758}; // @[Cat.scala 29:58]
  wire [15:0] _T_39763 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39762}; // @[Cat.scala 29:58]
  wire [31:0] _T_39764 = {_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39758,_T_39762,_T_39763}; // @[Cat.scala 29:58]
  wire [31:0] _T_39766 = _T_39764 & prod_x[63:32]; // @[exu_mul_ctl.scala 388:54]
  wire [7:0] _T_39771 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x}; // @[Cat.scala 29:58]
  wire [15:0] _T_39772 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x,_T_39771}; // @[Cat.scala 29:58]
  wire [31:0] _T_39773 = {low_x,low_x,low_x,low_x,low_x,low_x,low_x,low_x,_T_39771,_T_39772}; // @[Cat.scala 29:58]
  wire [31:0] _T_39775 = _T_39773 & prod_x[31:0]; // @[exu_mul_ctl.scala 389:40]
  rvclkhdr rvclkhdr ( // @[lib.scala 399:23]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en)
  );
  rvclkhdr rvclkhdr_1 ( // @[lib.scala 422:23]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en)
  );
  rvclkhdr rvclkhdr_2 ( // @[lib.scala 422:23]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en)
  );
  rvclkhdr rvclkhdr_3 ( // @[lib.scala 399:23]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en)
  );
  rvclkhdr rvclkhdr_4 ( // @[lib.scala 399:23]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en)
  );
  assign io_result_x = _T_39766 | _T_39775; // @[exu_mul_ctl.scala 388:15]
  assign rvclkhdr_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_io_en = io_mul_p_valid; // @[lib.scala 402:17]
  assign rvclkhdr_1_io_clk = clock; // @[lib.scala 424:18]
  assign rvclkhdr_1_io_en = io_mul_p_valid; // @[lib.scala 425:17]
  assign rvclkhdr_2_io_clk = clock; // @[lib.scala 424:18]
  assign rvclkhdr_2_io_en = io_mul_p_valid; // @[lib.scala 425:17]
  assign rvclkhdr_3_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_3_io_en = io_mul_p_valid; // @[lib.scala 402:17]
  assign rvclkhdr_4_io_clk = clock; // @[lib.scala 401:18]
  assign rvclkhdr_4_io_en = io_mul_p_valid; // @[lib.scala 402:17]
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
      low_x <= io_mul_p_bits_low;
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
