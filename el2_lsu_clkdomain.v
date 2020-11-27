module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[el2_lib.scala 474:26]
  wire  clkhdr_CK; // @[el2_lib.scala 474:26]
  wire  clkhdr_EN; // @[el2_lib.scala 474:26]
  wire  clkhdr_SE; // @[el2_lib.scala 474:26]
  gated_latch clkhdr ( // @[el2_lib.scala 474:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[el2_lib.scala 475:14]
  assign clkhdr_CK = io_clk; // @[el2_lib.scala 476:18]
  assign clkhdr_EN = io_en; // @[el2_lib.scala 477:18]
  assign clkhdr_SE = io_scan_mode; // @[el2_lib.scala 478:18]
endmodule
module el2_lsu_clkdomain(
  input   clock,
  input   reset,
  input   io_free_clk,
  input   io_clk_override,
  input   io_addr_in_dccm_m,
  input   io_dma_dccm_req,
  input   io_ldst_stbuf_reqvld_r,
  input   io_stbuf_reqvld_any,
  input   io_stbuf_reqvld_flushed_any,
  input   io_lsu_busreq_r,
  input   io_lsu_bus_buffer_pend_any,
  input   io_lsu_bus_buffer_empty_any,
  input   io_lsu_stbuf_empty_any,
  input   io_lsu_bus_clk_en,
  input   io_lsu_p_valid,
  input   io_lsu_p_bits_fast_int,
  input   io_lsu_p_bits_by,
  input   io_lsu_p_bits_half,
  input   io_lsu_p_bits_word,
  input   io_lsu_p_bits_dword,
  input   io_lsu_p_bits_load,
  input   io_lsu_p_bits_store,
  input   io_lsu_p_bits_unsign,
  input   io_lsu_p_bits_dma,
  input   io_lsu_p_bits_store_data_bypass_d,
  input   io_lsu_p_bits_load_ldst_bypass_d,
  input   io_lsu_p_bits_store_data_bypass_m,
  input   io_lsu_pkt_d_valid,
  input   io_lsu_pkt_d_bits_fast_int,
  input   io_lsu_pkt_d_bits_by,
  input   io_lsu_pkt_d_bits_half,
  input   io_lsu_pkt_d_bits_word,
  input   io_lsu_pkt_d_bits_dword,
  input   io_lsu_pkt_d_bits_load,
  input   io_lsu_pkt_d_bits_store,
  input   io_lsu_pkt_d_bits_unsign,
  input   io_lsu_pkt_d_bits_dma,
  input   io_lsu_pkt_d_bits_store_data_bypass_d,
  input   io_lsu_pkt_d_bits_load_ldst_bypass_d,
  input   io_lsu_pkt_d_bits_store_data_bypass_m,
  input   io_lsu_pkt_m_valid,
  input   io_lsu_pkt_m_bits_fast_int,
  input   io_lsu_pkt_m_bits_by,
  input   io_lsu_pkt_m_bits_half,
  input   io_lsu_pkt_m_bits_word,
  input   io_lsu_pkt_m_bits_dword,
  input   io_lsu_pkt_m_bits_load,
  input   io_lsu_pkt_m_bits_store,
  input   io_lsu_pkt_m_bits_unsign,
  input   io_lsu_pkt_m_bits_dma,
  input   io_lsu_pkt_m_bits_store_data_bypass_d,
  input   io_lsu_pkt_m_bits_load_ldst_bypass_d,
  input   io_lsu_pkt_m_bits_store_data_bypass_m,
  input   io_lsu_pkt_r_valid,
  input   io_lsu_pkt_r_bits_fast_int,
  input   io_lsu_pkt_r_bits_by,
  input   io_lsu_pkt_r_bits_half,
  input   io_lsu_pkt_r_bits_word,
  input   io_lsu_pkt_r_bits_dword,
  input   io_lsu_pkt_r_bits_load,
  input   io_lsu_pkt_r_bits_store,
  input   io_lsu_pkt_r_bits_unsign,
  input   io_lsu_pkt_r_bits_dma,
  input   io_lsu_pkt_r_bits_store_data_bypass_d,
  input   io_lsu_pkt_r_bits_load_ldst_bypass_d,
  input   io_lsu_pkt_r_bits_store_data_bypass_m,
  output  io_lsu_c1_m_clk,
  output  io_lsu_c1_r_clk,
  output  io_lsu_c2_m_clk,
  output  io_lsu_c2_r_clk,
  output  io_lsu_store_c1_m_clk,
  output  io_lsu_store_c1_r_clk,
  output  io_lsu_stbuf_c1_clk,
  output  io_lsu_bus_obuf_c1_clk,
  output  io_lsu_bus_ibuf_c1_clk,
  output  io_lsu_bus_buf_c1_clk,
  output  io_lsu_busm_clk,
  output  io_lsu_free_c2_clk,
  input   io_scan_mode
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  rvclkhdr_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_1_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_2_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_3_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_4_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_5_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_6_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_7_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_8_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_9_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_10_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_10_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_10_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_10_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_11_io_l1clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_11_io_clk; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_11_io_en; // @[el2_lib.scala 483:22]
  wire  rvclkhdr_11_io_scan_mode; // @[el2_lib.scala 483:22]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[el2_lsu_clkdomain.scala 63:51]
  reg  lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 82:67]
  wire  _T_1 = io_lsu_pkt_d_valid | lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 64:51]
  wire  lsu_c1_m_clken = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 64:70]
  reg  lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 83:67]
  wire  _T_2 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 65:51]
  wire  lsu_c1_r_clken = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 65:70]
  wire  _T_3 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 67:47]
  reg  lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 84:67]
  wire  _T_4 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 68:47]
  wire  _T_5 = lsu_c1_m_clken & io_lsu_pkt_d_bits_store; // @[el2_lsu_clkdomain.scala 70:49]
  wire  _T_6 = lsu_c1_r_clken & io_lsu_pkt_m_bits_store; // @[el2_lsu_clkdomain.scala 71:49]
  wire  _T_7 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[el2_lsu_clkdomain.scala 72:55]
  wire  _T_8 = _T_7 | io_stbuf_reqvld_flushed_any; // @[el2_lsu_clkdomain.scala 72:77]
  wire  _T_9 = io_lsu_bus_buffer_pend_any | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 74:61]
  wire  _T_10 = _T_9 | io_clk_override; // @[el2_lsu_clkdomain.scala 74:79]
  wire  _T_11 = ~io_lsu_bus_buffer_empty_any; // @[el2_lsu_clkdomain.scala 75:32]
  wire  _T_12 = _T_11 | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 75:61]
  wire  _T_13 = io_lsu_p_valid | io_lsu_pkt_d_valid; // @[el2_lsu_clkdomain.scala 77:48]
  wire  _T_14 = _T_13 | io_lsu_pkt_m_valid; // @[el2_lsu_clkdomain.scala 77:69]
  wire  _T_15 = _T_14 | io_lsu_pkt_r_valid; // @[el2_lsu_clkdomain.scala 77:90]
  wire  _T_17 = _T_15 | _T_11; // @[el2_lsu_clkdomain.scala 77:112]
  wire  _T_18 = ~io_lsu_stbuf_empty_any; // @[el2_lsu_clkdomain.scala 77:145]
  wire  _T_19 = _T_17 | _T_18; // @[el2_lsu_clkdomain.scala 77:143]
  wire  lsu_free_c1_clken = _T_19 | io_clk_override; // @[el2_lsu_clkdomain.scala 77:169]
  reg  lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 81:60]
  wire  _T_20 = lsu_free_c1_clken | lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 78:50]
  rvclkhdr rvclkhdr ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_io_l1clk),
    .io_clk(rvclkhdr_io_clk),
    .io_en(rvclkhdr_io_en),
    .io_scan_mode(rvclkhdr_io_scan_mode)
  );
  rvclkhdr rvclkhdr_1 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_1_io_l1clk),
    .io_clk(rvclkhdr_1_io_clk),
    .io_en(rvclkhdr_1_io_en),
    .io_scan_mode(rvclkhdr_1_io_scan_mode)
  );
  rvclkhdr rvclkhdr_2 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_2_io_l1clk),
    .io_clk(rvclkhdr_2_io_clk),
    .io_en(rvclkhdr_2_io_en),
    .io_scan_mode(rvclkhdr_2_io_scan_mode)
  );
  rvclkhdr rvclkhdr_3 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_3_io_l1clk),
    .io_clk(rvclkhdr_3_io_clk),
    .io_en(rvclkhdr_3_io_en),
    .io_scan_mode(rvclkhdr_3_io_scan_mode)
  );
  rvclkhdr rvclkhdr_4 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_4_io_l1clk),
    .io_clk(rvclkhdr_4_io_clk),
    .io_en(rvclkhdr_4_io_en),
    .io_scan_mode(rvclkhdr_4_io_scan_mode)
  );
  rvclkhdr rvclkhdr_5 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_5_io_l1clk),
    .io_clk(rvclkhdr_5_io_clk),
    .io_en(rvclkhdr_5_io_en),
    .io_scan_mode(rvclkhdr_5_io_scan_mode)
  );
  rvclkhdr rvclkhdr_6 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_6_io_l1clk),
    .io_clk(rvclkhdr_6_io_clk),
    .io_en(rvclkhdr_6_io_en),
    .io_scan_mode(rvclkhdr_6_io_scan_mode)
  );
  rvclkhdr rvclkhdr_7 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_7_io_l1clk),
    .io_clk(rvclkhdr_7_io_clk),
    .io_en(rvclkhdr_7_io_en),
    .io_scan_mode(rvclkhdr_7_io_scan_mode)
  );
  rvclkhdr rvclkhdr_8 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_8_io_l1clk),
    .io_clk(rvclkhdr_8_io_clk),
    .io_en(rvclkhdr_8_io_en),
    .io_scan_mode(rvclkhdr_8_io_scan_mode)
  );
  rvclkhdr rvclkhdr_9 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_9_io_l1clk),
    .io_clk(rvclkhdr_9_io_clk),
    .io_en(rvclkhdr_9_io_en),
    .io_scan_mode(rvclkhdr_9_io_scan_mode)
  );
  rvclkhdr rvclkhdr_10 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_10_io_l1clk),
    .io_clk(rvclkhdr_10_io_clk),
    .io_en(rvclkhdr_10_io_en),
    .io_scan_mode(rvclkhdr_10_io_scan_mode)
  );
  rvclkhdr rvclkhdr_11 ( // @[el2_lib.scala 483:22]
    .io_l1clk(rvclkhdr_11_io_l1clk),
    .io_clk(rvclkhdr_11_io_clk),
    .io_en(rvclkhdr_11_io_en),
    .io_scan_mode(rvclkhdr_11_io_scan_mode)
  );
  assign io_lsu_c1_m_clk = rvclkhdr_io_l1clk; // @[el2_lsu_clkdomain.scala 86:26]
  assign io_lsu_c1_r_clk = rvclkhdr_1_io_l1clk; // @[el2_lsu_clkdomain.scala 87:26]
  assign io_lsu_c2_m_clk = rvclkhdr_2_io_l1clk; // @[el2_lsu_clkdomain.scala 88:26]
  assign io_lsu_c2_r_clk = rvclkhdr_3_io_l1clk; // @[el2_lsu_clkdomain.scala 89:26]
  assign io_lsu_store_c1_m_clk = rvclkhdr_4_io_l1clk; // @[el2_lsu_clkdomain.scala 90:26]
  assign io_lsu_store_c1_r_clk = rvclkhdr_5_io_l1clk; // @[el2_lsu_clkdomain.scala 91:26]
  assign io_lsu_stbuf_c1_clk = rvclkhdr_6_io_l1clk; // @[el2_lsu_clkdomain.scala 92:26]
  assign io_lsu_bus_obuf_c1_clk = rvclkhdr_8_io_l1clk; // @[el2_lsu_clkdomain.scala 94:26]
  assign io_lsu_bus_ibuf_c1_clk = rvclkhdr_7_io_l1clk; // @[el2_lsu_clkdomain.scala 93:26]
  assign io_lsu_bus_buf_c1_clk = rvclkhdr_9_io_l1clk; // @[el2_lsu_clkdomain.scala 95:26]
  assign io_lsu_busm_clk = rvclkhdr_10_io_l1clk; // @[el2_lsu_clkdomain.scala 96:26]
  assign io_lsu_free_c2_clk = rvclkhdr_11_io_l1clk; // @[el2_lsu_clkdomain.scala 97:26]
  assign rvclkhdr_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_io_en = _T_1 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_1_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_1_io_en = _T_2 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_1_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_2_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_2_io_en = _T_3 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_2_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_3_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_3_io_en = _T_4 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_3_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_4_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_4_io_en = _T_5 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_4_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_5_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_5_io_en = _T_6 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_5_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_6_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_6_io_en = _T_8 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_6_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_7_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_7_io_en = io_lsu_busreq_r | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_7_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_8_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_8_io_en = _T_10 & io_lsu_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_8_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_9_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_9_io_en = _T_12 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_9_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_10_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_10_io_en = io_lsu_bus_clk_en; // @[el2_lib.scala 485:16]
  assign rvclkhdr_10_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
  assign rvclkhdr_11_io_clk = clock; // @[el2_lib.scala 484:17]
  assign rvclkhdr_11_io_en = _T_20 | io_clk_override; // @[el2_lib.scala 485:16]
  assign rvclkhdr_11_io_scan_mode = io_scan_mode; // @[el2_lib.scala 486:23]
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
  lsu_c1_d_clken_q = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_c1_m_clken_q = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lsu_c1_r_clken_q = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsu_free_c1_clken_q = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    lsu_c1_d_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_c1_m_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_c1_r_clken_q = 1'h0;
  end
  if (reset) begin
    lsu_free_c1_clken_q = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_d_clken_q <= 1'h0;
    end else begin
      lsu_c1_d_clken_q <= _T | io_clk_override;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_m_clken_q <= 1'h0;
    end else begin
      lsu_c1_m_clken_q <= _T_1 | io_clk_override;
    end
  end
  always @(posedge io_lsu_free_c2_clk or posedge reset) begin
    if (reset) begin
      lsu_c1_r_clken_q <= 1'h0;
    end else begin
      lsu_c1_r_clken_q <= _T_2 | io_clk_override;
    end
  end
  always @(posedge io_free_clk or posedge reset) begin
    if (reset) begin
      lsu_free_c1_clken_q <= 1'h0;
    end else begin
      lsu_free_c1_clken_q <= _T_19 | io_clk_override;
    end
  end
endmodule
