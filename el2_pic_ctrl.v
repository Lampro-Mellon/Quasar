module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 331:24]
  wire  clkhdr_CK; // @[beh_lib.scala 331:24]
  wire  clkhdr_EN; // @[beh_lib.scala 331:24]
  wire  clkhdr_SE; // @[beh_lib.scala 331:24]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 331:24]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 332:12]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 333:16]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 334:16]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 335:16]
endmodule
module rvsyncss(
  input         reset,
  input  [30:0] io_din,
  output [30:0] io_dout,
  input         io_clk
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [30:0] sync_ff1; // @[beh_lib.scala 32:43]
  reg [30:0] sync_ff2; // @[beh_lib.scala 33:43]
  assign io_dout = sync_ff2; // @[beh_lib.scala 37:12]
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
  sync_ff1 = _RAND_0[30:0];
  _RAND_1 = {1{`RANDOM}};
  sync_ff2 = _RAND_1[30:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    sync_ff1 = 31'h0;
  end
  if (reset) begin
    sync_ff2 = 31'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_clk or posedge reset) begin
    if (reset) begin
      sync_ff1 <= 31'h0;
    end else begin
      sync_ff1 <= io_din;
    end
  end
  always @(posedge io_clk or posedge reset) begin
    if (reset) begin
      sync_ff2 <= 31'h0;
    end else begin
      sync_ff2 <= sync_ff1;
    end
  end
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
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  pic_addr_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 162:32]
  wire  pic_addr_c1_cgc_io_clk; // @[el2_pic_ctrl.scala 162:32]
  wire  pic_addr_c1_cgc_io_en; // @[el2_pic_ctrl.scala 162:32]
  wire  pic_addr_c1_cgc_io_scan_mode; // @[el2_pic_ctrl.scala 162:32]
  wire  pic_data_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 166:32]
  wire  pic_data_c1_cgc_io_clk; // @[el2_pic_ctrl.scala 166:32]
  wire  pic_data_c1_cgc_io_en; // @[el2_pic_ctrl.scala 166:32]
  wire  pic_data_c1_cgc_io_scan_mode; // @[el2_pic_ctrl.scala 166:32]
  wire  pic_pri_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 170:31]
  wire  pic_pri_c1_cgc_io_clk; // @[el2_pic_ctrl.scala 170:31]
  wire  pic_pri_c1_cgc_io_en; // @[el2_pic_ctrl.scala 170:31]
  wire  pic_pri_c1_cgc_io_scan_mode; // @[el2_pic_ctrl.scala 170:31]
  wire  pic_int_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 174:32]
  wire  pic_int_c1_cgc_io_clk; // @[el2_pic_ctrl.scala 174:32]
  wire  pic_int_c1_cgc_io_en; // @[el2_pic_ctrl.scala 174:32]
  wire  pic_int_c1_cgc_io_scan_mode; // @[el2_pic_ctrl.scala 174:32]
  wire  gw_config_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 178:33]
  wire  gw_config_c1_cgc_io_clk; // @[el2_pic_ctrl.scala 178:33]
  wire  gw_config_c1_cgc_io_en; // @[el2_pic_ctrl.scala 178:33]
  wire  gw_config_c1_cgc_io_scan_mode; // @[el2_pic_ctrl.scala 178:33]
  wire  sync_inst_reset; // @[el2_pic_ctrl.scala 185:26]
  wire [30:0] sync_inst_io_din; // @[el2_pic_ctrl.scala 185:26]
  wire [30:0] sync_inst_io_dout; // @[el2_pic_ctrl.scala 185:26]
  wire  sync_inst_io_clk; // @[el2_pic_ctrl.scala 185:26]
  wire  pic_raddr_c1_clk = pic_addr_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 127:42 el2_pic_ctrl.scala 163:89]
  reg [31:0] picm_raddr_ff; // @[el2_pic_ctrl.scala 133:56]
  wire  pic_data_c1_clk = pic_data_c1_cgc_io_l1clk; // @[el2_pic_ctrl.scala 128:42 el2_pic_ctrl.scala 167:89]
  reg [31:0] picm_waddr_ff; // @[el2_pic_ctrl.scala 134:57]
  reg  picm_wren_ff; // @[el2_pic_ctrl.scala 135:55]
  reg  picm_rden_ff; // @[el2_pic_ctrl.scala 136:55]
  reg [31:0] picm_wr_data_ff; // @[el2_pic_ctrl.scala 138:58]
  wire  raddr_intenable_base_match = picm_raddr_ff[31:7] == 25'h1e01840; // @[el2_pic_ctrl.scala 140:71]
  wire  raddr_intpriority_base_match = picm_raddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctrl.scala 141:71]
  wire  raddr_config_gw_base_match = picm_raddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctrl.scala 142:71]
  wire  waddr_config_pic_match = picm_waddr_ff == 32'hf00c3000; // @[el2_pic_ctrl.scala 146:71]
  wire  waddr_intpriority_base_match = picm_waddr_ff[31:7] == 25'h1e01800; // @[el2_pic_ctrl.scala 148:71]
  wire  waddr_config_gw_base_match = picm_waddr_ff[31:7] == 25'h1e01880; // @[el2_pic_ctrl.scala 150:71]
  wire  _T_18 = io_picm_mken | io_picm_rden; // @[el2_pic_ctrl.scala 155:42]
  wire  _T_19 = waddr_intpriority_base_match & picm_wren_ff; // @[el2_pic_ctrl.scala 157:59]
  wire  _T_20 = raddr_intpriority_base_match & picm_rden_ff; // @[el2_pic_ctrl.scala 157:108]
  wire  _T_21 = _T_19 | _T_20; // @[el2_pic_ctrl.scala 157:76]
  wire  _T_23 = raddr_intenable_base_match & picm_rden_ff; // @[el2_pic_ctrl.scala 158:106]
  wire  _T_24 = _T_19 | _T_23; // @[el2_pic_ctrl.scala 158:76]
  wire  _T_25 = waddr_config_gw_base_match & picm_wren_ff; // @[el2_pic_ctrl.scala 159:59]
  wire  _T_26 = raddr_config_gw_base_match & picm_rden_ff; // @[el2_pic_ctrl.scala 159:108]
  wire  _T_27 = _T_25 | _T_26; // @[el2_pic_ctrl.scala 159:76]
  wire  config_reg_we = waddr_config_pic_match & picm_wren_ff; // @[el2_pic_ctrl.scala 195:47]
  wire  config_reg_in = picm_wr_data_ff[0]; // @[el2_pic_ctrl.scala 197:39]
  reg  config_reg; // @[Reg.scala 27:20]
  wire [3:0] pl_in_q = config_reg ? 4'hf : 4'h0; // @[el2_pic_ctrl.scala 204:20]
  reg [3:0] _T_36; // @[el2_pic_ctrl.scala 206:42]
  wire [3:0] maxint = config_reg ? 4'h0 : 4'hf; // @[el2_pic_ctrl.scala 211:19]
  reg  _T_45; // @[el2_pic_ctrl.scala 213:48]
  rvclkhdr pic_addr_c1_cgc ( // @[el2_pic_ctrl.scala 162:32]
    .io_l1clk(pic_addr_c1_cgc_io_l1clk),
    .io_clk(pic_addr_c1_cgc_io_clk),
    .io_en(pic_addr_c1_cgc_io_en),
    .io_scan_mode(pic_addr_c1_cgc_io_scan_mode)
  );
  rvclkhdr pic_data_c1_cgc ( // @[el2_pic_ctrl.scala 166:32]
    .io_l1clk(pic_data_c1_cgc_io_l1clk),
    .io_clk(pic_data_c1_cgc_io_clk),
    .io_en(pic_data_c1_cgc_io_en),
    .io_scan_mode(pic_data_c1_cgc_io_scan_mode)
  );
  rvclkhdr pic_pri_c1_cgc ( // @[el2_pic_ctrl.scala 170:31]
    .io_l1clk(pic_pri_c1_cgc_io_l1clk),
    .io_clk(pic_pri_c1_cgc_io_clk),
    .io_en(pic_pri_c1_cgc_io_en),
    .io_scan_mode(pic_pri_c1_cgc_io_scan_mode)
  );
  rvclkhdr pic_int_c1_cgc ( // @[el2_pic_ctrl.scala 174:32]
    .io_l1clk(pic_int_c1_cgc_io_l1clk),
    .io_clk(pic_int_c1_cgc_io_clk),
    .io_en(pic_int_c1_cgc_io_en),
    .io_scan_mode(pic_int_c1_cgc_io_scan_mode)
  );
  rvclkhdr gw_config_c1_cgc ( // @[el2_pic_ctrl.scala 178:33]
    .io_l1clk(gw_config_c1_cgc_io_l1clk),
    .io_clk(gw_config_c1_cgc_io_clk),
    .io_en(gw_config_c1_cgc_io_en),
    .io_scan_mode(gw_config_c1_cgc_io_scan_mode)
  );
  rvsyncss sync_inst ( // @[el2_pic_ctrl.scala 185:26]
    .reset(sync_inst_reset),
    .io_din(sync_inst_io_din),
    .io_dout(sync_inst_io_dout),
    .io_clk(sync_inst_io_clk)
  );
  assign io_mexintpend = 1'h0; // @[el2_pic_ctrl.scala 31:20 el2_pic_ctrl.scala 210:40]
  assign io_claimid = 8'h0; // @[el2_pic_ctrl.scala 32:20 el2_pic_ctrl.scala 205:37]
  assign io_pl = _T_36; // @[el2_pic_ctrl.scala 33:20 el2_pic_ctrl.scala 206:32]
  assign io_picm_rd_data = 32'h0; // @[el2_pic_ctrl.scala 34:20]
  assign io_mhwakeup = _T_45; // @[el2_pic_ctrl.scala 35:20 el2_pic_ctrl.scala 213:38]
  assign io_test = {sync_inst_io_dout,io_extintsrc_req[0]}; // @[el2_pic_ctrl.scala 190:11]
  assign pic_addr_c1_cgc_io_clk = clock; // @[el2_pic_ctrl.scala 164:34]
  assign pic_addr_c1_cgc_io_en = _T_18 | io_clk_override; // @[el2_pic_ctrl.scala 163:34]
  assign pic_addr_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_pic_ctrl.scala 164:89]
  assign pic_data_c1_cgc_io_clk = clock; // @[el2_pic_ctrl.scala 168:34]
  assign pic_data_c1_cgc_io_en = io_picm_wren | io_clk_override; // @[el2_pic_ctrl.scala 167:34]
  assign pic_data_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_pic_ctrl.scala 168:89]
  assign pic_pri_c1_cgc_io_clk = clock; // @[el2_pic_ctrl.scala 172:33]
  assign pic_pri_c1_cgc_io_en = _T_21 | io_clk_override; // @[el2_pic_ctrl.scala 171:33]
  assign pic_pri_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_pic_ctrl.scala 172:87]
  assign pic_int_c1_cgc_io_clk = clock; // @[el2_pic_ctrl.scala 176:33]
  assign pic_int_c1_cgc_io_en = _T_24 | io_clk_override; // @[el2_pic_ctrl.scala 175:33]
  assign pic_int_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_pic_ctrl.scala 176:87]
  assign gw_config_c1_cgc_io_clk = clock; // @[el2_pic_ctrl.scala 180:35]
  assign gw_config_c1_cgc_io_en = _T_27 | io_clk_override; // @[el2_pic_ctrl.scala 179:35]
  assign gw_config_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_pic_ctrl.scala 180:91]
  assign sync_inst_reset = reset;
  assign sync_inst_io_din = io_extintsrc_req[31:1]; // @[el2_pic_ctrl.scala 186:29]
  assign sync_inst_io_clk = io_free_clk; // @[el2_pic_ctrl.scala 188:29]
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
  picm_raddr_ff = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  picm_waddr_ff = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  picm_wren_ff = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  picm_rden_ff = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  picm_wr_data_ff = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  config_reg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  _T_36 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  _T_45 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    picm_raddr_ff = 32'h0;
  end
  if (reset) begin
    picm_waddr_ff = 32'h0;
  end
  if (reset) begin
    picm_wren_ff = 1'h0;
  end
  if (reset) begin
    picm_rden_ff = 1'h0;
  end
  if (reset) begin
    picm_wr_data_ff = 32'h0;
  end
  if (reset) begin
    config_reg = 1'h0;
  end
  if (reset) begin
    _T_36 = 4'h0;
  end
  if (reset) begin
    _T_45 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge pic_raddr_c1_clk or posedge reset) begin
    if (reset) begin
      picm_raddr_ff <= 32'h0;
    end else begin
      picm_raddr_ff <= io_picm_rdaddr;
    end
  end
  always @(posedge pic_data_c1_clk or posedge reset) begin
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
  always @(posedge io_active_clk or posedge reset) begin
    if (reset) begin
      picm_rden_ff <= 1'h0;
    end else begin
      picm_rden_ff <= io_picm_rden;
    end
  end
  always @(posedge pic_data_c1_clk or posedge reset) begin
    if (reset) begin
      picm_wr_data_ff <= 32'h0;
    end else begin
      picm_wr_data_ff <= io_picm_wr_data;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      config_reg <= 1'h0;
    end else if (config_reg_we) begin
      config_reg <= config_reg_in;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_36 <= 4'h0;
    end else if (config_reg) begin
      _T_36 <= 4'hf;
    end else begin
      _T_36 <= 4'h0;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      _T_45 <= 1'h0;
    end else begin
      _T_45 <= pl_in_q == maxint;
    end
  end
endmodule
