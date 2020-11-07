module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 465:26]
  wire  clkhdr_CK; // @[el2_lib.scala 465:26]
  wire  clkhdr_EN; // @[el2_lib.scala 465:26]
  wire  clkhdr_SE; // @[el2_lib.scala 465:26]
  TEC_RV_ICG clkhdr ( // @[el2_lib.scala 465:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 466:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 467:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 468:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 469:18]
endmodule
module el2_pic_ctrl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_free_clk,
  input         io_active_clk,
  input         io_clk_override,
  input  [31:0] io_extintsrc_req,
  input  [31:0] io_picm_rdaddr,
  input  [31:0] io_picm_wraddr,
  input  [31:0] io_picm_wr_data,
  input         io_picm_wren,
  input         io_picm_rden,
  input         io_picm_mken,
  input  [3:0]  io_meicurpl,
  input  [3:0]  io_meipt,
  output        io_mexintpend,
  output [7:0]  io_claimid,
  output [3:0]  io_pl,
  output [31:0] io_picm_rd_data,
  output        io_mhwakeup,
  output [31:0] io_test
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 474:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 474:22]
  wire  _T = io_picm_mken | io_picm_rden; // @[el2_pic_ctl.scala 62:42]
  reg [31:0] picm_waddr_ff; // @[el2_pic_ctl.scala 102:54]
  wire  waddr_intpriority_base_match = picm_waddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctl.scala 95:68]
  reg  picm_wren_ff; // @[el2_pic_ctl.scala 103:51]
  wire  _T_1 = waddr_intpriority_base_match & picm_wren_ff; // @[el2_pic_ctl.scala 71:59]
  reg [31:0] picm_raddr_ff; // @[el2_pic_ctl.scala 101:55]
  wire  raddr_intpriority_base_match = picm_raddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctl.scala 88:68]
  reg  picm_rden_ff; // @[el2_pic_ctl.scala 104:51]
  wire  _T_2 = raddr_intpriority_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 71:108]
  wire  _T_3 = _T_1 | _T_2; // @[el2_pic_ctl.scala 71:76]
  wire  raddr_intenable_base_match = picm_raddr_ff[31:7] == 25'h1e01840; // @[el2_pic_ctl.scala 84:64]
  wire  _T_5 = raddr_intenable_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 72:106]
  wire  _T_6 = _T_1 | _T_5; // @[el2_pic_ctl.scala 72:76]
  wire  waddr_config_gw_base_match = picm_waddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctl.scala 97:68]
  wire  _T_7 = waddr_config_gw_base_match & picm_wren_ff; // @[el2_pic_ctl.scala 73:59]
  wire  raddr_config_gw_base_match = picm_raddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctl.scala 89:68]
  wire  _T_8 = raddr_config_gw_base_match & picm_rden_ff; // @[el2_pic_ctl.scala 73:108]
  wire  _T_9 = _T_7 | _T_8; // @[el2_pic_ctl.scala 73:76]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 474:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 474:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 474:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 474:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 474:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  assign io_mexintpend = 1'h0; // @[el2_pic_ctl.scala 31:20]
  assign io_claimid = 8'h0; // @[el2_pic_ctl.scala 32:20]
  assign io_pl = 4'h0; // @[el2_pic_ctl.scala 33:20]
  assign io_picm_rd_data = 32'h0; // @[el2_pic_ctl.scala 34:20]
  assign io_mhwakeup = 1'h0; // @[el2_pic_ctl.scala 35:20]
  assign io_test = 32'hf00c2000; // @[el2_pic_ctl.scala 85:11]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 475:17]
  assign rvclkhdr_io_en = _T | io_clk_override; // @[el2_lib.scala 476:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 477:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 475:17]
  assign rvclkhdr_1_io_en = io_picm_wren | io_clk_override; // @[el2_lib.scala 476:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 477:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 475:17]
  assign rvclkhdr_2_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 476:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 477:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 475:17]
  assign rvclkhdr_3_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 476:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 477:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 475:17]
  assign rvclkhdr_4_io_en = _T_9 | io_clk_override; // @[el2_lib.scala 476:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 477:23]
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
  picm_waddr_ff = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  picm_wren_ff = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  picm_raddr_ff = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  picm_rden_ff = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    picm_waddr_ff = 32'h0;
  end
  if (reset) begin
    picm_wren_ff = 1'h0;
  end
  if (reset) begin
    picm_raddr_ff = 32'h0;
  end
  if (reset) begin
    picm_rden_ff = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rvclkhdr_1_io_l1clk or posedge reset) begin
    if (reset) begin
      picm_waddr_ff <= 32'h0;
    end else begin
      picm_waddr_ff <= io_picm_wraddr;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_wren_ff <= 1'h0;
    end else begin
      picm_wren_ff <= io_picm_wren;
    end
  end
  always @(posedge rvclkhdr_io_l1clk or posedge reset) begin
    if (reset) begin
      picm_raddr_ff <= 32'h0;
    end else begin
      picm_raddr_ff <= io_picm_rdaddr;
    end
  end
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_rden_ff <= 1'h0;
    end else begin
      picm_rden_ff <= io_picm_rden;
    end
  end
endmodule
