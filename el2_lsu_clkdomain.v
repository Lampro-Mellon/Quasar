module rvclkhdr(
  output  io_l1clk,
  input   io_clk,
  input   io_en,
  input   io_scan_mode
);
  wire  clkhdr_Q; // @[beh_lib.scala 330:26]
  wire  clkhdr_CK; // @[beh_lib.scala 330:26]
  wire  clkhdr_EN; // @[beh_lib.scala 330:26]
  wire  clkhdr_SE; // @[beh_lib.scala 330:26]
  TEC_RV_ICG clkhdr ( // @[beh_lib.scala 330:26]
    .Q(clkhdr_Q),
    .CK(clkhdr_CK),
    .EN(clkhdr_EN),
    .SE(clkhdr_SE)
  );
  assign io_l1clk = clkhdr_Q; // @[beh_lib.scala 331:14]
  assign clkhdr_CK = io_clk; // @[beh_lib.scala 332:18]
  assign clkhdr_EN = io_en; // @[beh_lib.scala 333:18]
  assign clkhdr_SE = io_scan_mode; // @[beh_lib.scala 334:18]
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
  input   io_lsu_p_fast_int,
  input   io_lsu_p_by,
  input   io_lsu_p_half,
  input   io_lsu_p_word,
  input   io_lsu_p_dword,
  input   io_lsu_p_load,
  input   io_lsu_p_store,
  input   io_lsu_p_unsign,
  input   io_lsu_p_dma,
  input   io_lsu_p_store_data_bypass_d,
  input   io_lsu_p_load_ldst_bypass_d,
  input   io_lsu_p_store_data_bypass_m,
  input   io_lsu_p_valid,
  input   io_lsu_pkt_d_fast_int,
  input   io_lsu_pkt_d_by,
  input   io_lsu_pkt_d_half,
  input   io_lsu_pkt_d_word,
  input   io_lsu_pkt_d_dword,
  input   io_lsu_pkt_d_load,
  input   io_lsu_pkt_d_store,
  input   io_lsu_pkt_d_unsign,
  input   io_lsu_pkt_d_dma,
  input   io_lsu_pkt_d_store_data_bypass_d,
  input   io_lsu_pkt_d_load_ldst_bypass_d,
  input   io_lsu_pkt_d_store_data_bypass_m,
  input   io_lsu_pkt_d_valid,
  input   io_lsu_pkt_m_fast_int,
  input   io_lsu_pkt_m_by,
  input   io_lsu_pkt_m_half,
  input   io_lsu_pkt_m_word,
  input   io_lsu_pkt_m_dword,
  input   io_lsu_pkt_m_load,
  input   io_lsu_pkt_m_store,
  input   io_lsu_pkt_m_unsign,
  input   io_lsu_pkt_m_dma,
  input   io_lsu_pkt_m_store_data_bypass_d,
  input   io_lsu_pkt_m_load_ldst_bypass_d,
  input   io_lsu_pkt_m_store_data_bypass_m,
  input   io_lsu_pkt_m_valid,
  input   io_lsu_pkt_r_fast_int,
  input   io_lsu_pkt_r_by,
  input   io_lsu_pkt_r_half,
  input   io_lsu_pkt_r_word,
  input   io_lsu_pkt_r_dword,
  input   io_lsu_pkt_r_load,
  input   io_lsu_pkt_r_store,
  input   io_lsu_pkt_r_unsign,
  input   io_lsu_pkt_r_dma,
  input   io_lsu_pkt_r_store_data_bypass_d,
  input   io_lsu_pkt_r_load_ldst_bypass_d,
  input   io_lsu_pkt_r_store_data_bypass_m,
  input   io_lsu_pkt_r_valid,
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
  wire  lsu_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_en; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 88:35]
  wire  lsu_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_en; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c1r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 89:35]
  wire  lsu_c2m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_en; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 90:35]
  wire  lsu_c2r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_en; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_c2r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 91:35]
  wire  lsu_store_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_clk; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_en; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1m_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 92:35]
  wire  lsu_store_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_clk; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_en; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_store_c1r_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 93:35]
  wire  lsu_stbuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_stbuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 94:35]
  wire  lsu_bus_ibuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_ibuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 95:35]
  wire  lsu_bus_obuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_obuf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 96:35]
  wire  lsu_bus_buf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_clk; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_en; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_bus_buf_c1_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 97:35]
  wire  lsu_busm_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_clk; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_en; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_busm_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 98:35]
  wire  lsu_free_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_clk; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_en; // @[el2_lsu_clkdomain.scala 99:35]
  wire  lsu_free_cgc_io_scan_mode; // @[el2_lsu_clkdomain.scala 99:35]
  wire  _T = io_lsu_p_valid | io_dma_dccm_req; // @[el2_lsu_clkdomain.scala 64:51]
  wire  lsu_c1_d_clken = _T | io_clk_override; // @[el2_lsu_clkdomain.scala 64:70]
  reg  lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 84:67]
  wire  _T_1 = io_lsu_pkt_d_valid | lsu_c1_d_clken_q; // @[el2_lsu_clkdomain.scala 65:51]
  wire  lsu_c1_m_clken = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 65:70]
  reg  lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 85:67]
  wire  _T_2 = io_lsu_pkt_m_valid | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 66:51]
  wire  lsu_c1_r_clken = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 66:70]
  wire  _T_3 = lsu_c1_m_clken | lsu_c1_m_clken_q; // @[el2_lsu_clkdomain.scala 68:47]
  reg  lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 86:67]
  wire  _T_4 = lsu_c1_r_clken | lsu_c1_r_clken_q; // @[el2_lsu_clkdomain.scala 69:47]
  wire  _T_5 = lsu_c1_m_clken & io_lsu_pkt_d_store; // @[el2_lsu_clkdomain.scala 71:49]
  wire  _T_6 = lsu_c1_r_clken & io_lsu_pkt_m_store; // @[el2_lsu_clkdomain.scala 72:49]
  wire  _T_7 = io_ldst_stbuf_reqvld_r | io_stbuf_reqvld_any; // @[el2_lsu_clkdomain.scala 73:55]
  wire  _T_8 = _T_7 | io_stbuf_reqvld_flushed_any; // @[el2_lsu_clkdomain.scala 73:77]
  wire  _T_9 = io_lsu_bus_buffer_pend_any | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 75:61]
  wire  _T_10 = _T_9 | io_clk_override; // @[el2_lsu_clkdomain.scala 75:79]
  wire  _T_11 = ~io_lsu_bus_buffer_empty_any; // @[el2_lsu_clkdomain.scala 76:32]
  wire  _T_12 = _T_11 | io_lsu_busreq_r; // @[el2_lsu_clkdomain.scala 76:61]
  wire  _T_13 = io_lsu_p_valid | io_lsu_pkt_d_valid; // @[el2_lsu_clkdomain.scala 78:48]
  wire  _T_14 = _T_13 | io_lsu_pkt_m_valid; // @[el2_lsu_clkdomain.scala 78:69]
  wire  _T_15 = _T_14 | io_lsu_pkt_r_valid; // @[el2_lsu_clkdomain.scala 78:90]
  wire  _T_17 = _T_15 | _T_11; // @[el2_lsu_clkdomain.scala 78:112]
  wire  _T_18 = ~io_lsu_stbuf_empty_any; // @[el2_lsu_clkdomain.scala 78:145]
  wire  _T_19 = _T_17 | _T_18; // @[el2_lsu_clkdomain.scala 78:143]
  wire  lsu_free_c1_clken = _T_19 | io_clk_override; // @[el2_lsu_clkdomain.scala 78:169]
  reg  lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 82:60]
  wire  _T_20 = lsu_free_c1_clken | lsu_free_c1_clken_q; // @[el2_lsu_clkdomain.scala 79:50]
  rvclkhdr lsu_c1m_cgc ( // @[el2_lsu_clkdomain.scala 88:35]
    .io_l1clk(lsu_c1m_cgc_io_l1clk),
    .io_clk(lsu_c1m_cgc_io_clk),
    .io_en(lsu_c1m_cgc_io_en),
    .io_scan_mode(lsu_c1m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c1r_cgc ( // @[el2_lsu_clkdomain.scala 89:35]
    .io_l1clk(lsu_c1r_cgc_io_l1clk),
    .io_clk(lsu_c1r_cgc_io_clk),
    .io_en(lsu_c1r_cgc_io_en),
    .io_scan_mode(lsu_c1r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c2m_cgc ( // @[el2_lsu_clkdomain.scala 90:35]
    .io_l1clk(lsu_c2m_cgc_io_l1clk),
    .io_clk(lsu_c2m_cgc_io_clk),
    .io_en(lsu_c2m_cgc_io_en),
    .io_scan_mode(lsu_c2m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_c2r_cgc ( // @[el2_lsu_clkdomain.scala 91:35]
    .io_l1clk(lsu_c2r_cgc_io_l1clk),
    .io_clk(lsu_c2r_cgc_io_clk),
    .io_en(lsu_c2r_cgc_io_en),
    .io_scan_mode(lsu_c2r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_store_c1m_cgc ( // @[el2_lsu_clkdomain.scala 92:35]
    .io_l1clk(lsu_store_c1m_cgc_io_l1clk),
    .io_clk(lsu_store_c1m_cgc_io_clk),
    .io_en(lsu_store_c1m_cgc_io_en),
    .io_scan_mode(lsu_store_c1m_cgc_io_scan_mode)
  );
  rvclkhdr lsu_store_c1r_cgc ( // @[el2_lsu_clkdomain.scala 93:35]
    .io_l1clk(lsu_store_c1r_cgc_io_l1clk),
    .io_clk(lsu_store_c1r_cgc_io_clk),
    .io_en(lsu_store_c1r_cgc_io_en),
    .io_scan_mode(lsu_store_c1r_cgc_io_scan_mode)
  );
  rvclkhdr lsu_stbuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 94:35]
    .io_l1clk(lsu_stbuf_c1_cgc_io_l1clk),
    .io_clk(lsu_stbuf_c1_cgc_io_clk),
    .io_en(lsu_stbuf_c1_cgc_io_en),
    .io_scan_mode(lsu_stbuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_ibuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 95:35]
    .io_l1clk(lsu_bus_ibuf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_ibuf_c1_cgc_io_clk),
    .io_en(lsu_bus_ibuf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_ibuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_obuf_c1_cgc ( // @[el2_lsu_clkdomain.scala 96:35]
    .io_l1clk(lsu_bus_obuf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_obuf_c1_cgc_io_clk),
    .io_en(lsu_bus_obuf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_obuf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_bus_buf_c1_cgc ( // @[el2_lsu_clkdomain.scala 97:35]
    .io_l1clk(lsu_bus_buf_c1_cgc_io_l1clk),
    .io_clk(lsu_bus_buf_c1_cgc_io_clk),
    .io_en(lsu_bus_buf_c1_cgc_io_en),
    .io_scan_mode(lsu_bus_buf_c1_cgc_io_scan_mode)
  );
  rvclkhdr lsu_busm_cgc ( // @[el2_lsu_clkdomain.scala 98:35]
    .io_l1clk(lsu_busm_cgc_io_l1clk),
    .io_clk(lsu_busm_cgc_io_clk),
    .io_en(lsu_busm_cgc_io_en),
    .io_scan_mode(lsu_busm_cgc_io_scan_mode)
  );
  rvclkhdr lsu_free_cgc ( // @[el2_lsu_clkdomain.scala 99:35]
    .io_l1clk(lsu_free_cgc_io_l1clk),
    .io_clk(lsu_free_cgc_io_clk),
    .io_en(lsu_free_cgc_io_en),
    .io_scan_mode(lsu_free_cgc_io_scan_mode)
  );
  assign io_lsu_c1_m_clk = lsu_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 88:127]
  assign io_lsu_c1_r_clk = lsu_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 89:127]
  assign io_lsu_c2_m_clk = lsu_c2m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 90:127]
  assign io_lsu_c2_r_clk = lsu_c2r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 91:127]
  assign io_lsu_store_c1_m_clk = lsu_store_c1m_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 92:127]
  assign io_lsu_store_c1_r_clk = lsu_store_c1r_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 93:127]
  assign io_lsu_stbuf_c1_clk = lsu_stbuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 94:127]
  assign io_lsu_bus_obuf_c1_clk = lsu_bus_obuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 96:127]
  assign io_lsu_bus_ibuf_c1_clk = lsu_bus_ibuf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 95:127]
  assign io_lsu_bus_buf_c1_clk = lsu_bus_buf_c1_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 97:127]
  assign io_lsu_busm_clk = lsu_busm_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 98:127]
  assign io_lsu_free_c2_clk = lsu_free_cgc_io_l1clk; // @[el2_lsu_clkdomain.scala 99:127]
  assign lsu_c1m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 101:30]
  assign lsu_c1m_cgc_io_en = _T_1 | io_clk_override; // @[el2_lsu_clkdomain.scala 88:77]
  assign lsu_c1m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 101:75]
  assign lsu_c1r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 102:30]
  assign lsu_c1r_cgc_io_en = _T_2 | io_clk_override; // @[el2_lsu_clkdomain.scala 89:77]
  assign lsu_c1r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 102:75]
  assign lsu_c2m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 103:30]
  assign lsu_c2m_cgc_io_en = _T_3 | io_clk_override; // @[el2_lsu_clkdomain.scala 90:77]
  assign lsu_c2m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 103:75]
  assign lsu_c2r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 104:30]
  assign lsu_c2r_cgc_io_en = _T_4 | io_clk_override; // @[el2_lsu_clkdomain.scala 91:77]
  assign lsu_c2r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 104:75]
  assign lsu_store_c1m_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 105:30]
  assign lsu_store_c1m_cgc_io_en = _T_5 | io_clk_override; // @[el2_lsu_clkdomain.scala 92:77]
  assign lsu_store_c1m_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 105:75]
  assign lsu_store_c1r_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 106:30]
  assign lsu_store_c1r_cgc_io_en = _T_6 | io_clk_override; // @[el2_lsu_clkdomain.scala 93:77]
  assign lsu_store_c1r_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 106:75]
  assign lsu_stbuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 107:30]
  assign lsu_stbuf_c1_cgc_io_en = _T_8 | io_clk_override; // @[el2_lsu_clkdomain.scala 94:77]
  assign lsu_stbuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 107:75]
  assign lsu_bus_ibuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 108:30]
  assign lsu_bus_ibuf_c1_cgc_io_en = io_lsu_busreq_r | io_clk_override; // @[el2_lsu_clkdomain.scala 95:77]
  assign lsu_bus_ibuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 108:75]
  assign lsu_bus_obuf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 109:30]
  assign lsu_bus_obuf_c1_cgc_io_en = _T_10 & io_lsu_bus_clk_en; // @[el2_lsu_clkdomain.scala 96:77]
  assign lsu_bus_obuf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 109:75]
  assign lsu_bus_buf_c1_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 110:30]
  assign lsu_bus_buf_c1_cgc_io_en = _T_12 | io_clk_override; // @[el2_lsu_clkdomain.scala 97:77]
  assign lsu_bus_buf_c1_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 110:75]
  assign lsu_busm_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 111:30]
  assign lsu_busm_cgc_io_en = io_lsu_bus_clk_en; // @[el2_lsu_clkdomain.scala 98:77]
  assign lsu_busm_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 111:75]
  assign lsu_free_cgc_io_clk = clock; // @[el2_lsu_clkdomain.scala 112:30]
  assign lsu_free_cgc_io_en = _T_20 | io_clk_override; // @[el2_lsu_clkdomain.scala 99:77]
  assign lsu_free_cgc_io_scan_mode = io_scan_mode; // @[el2_lsu_clkdomain.scala 112:75]
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_lsu_free_c2_clk) begin
    if (reset) begin
      lsu_c1_d_clken_q <= 1'h0;
    end else begin
      lsu_c1_d_clken_q <= lsu_c1_d_clken;
    end
    if (reset) begin
      lsu_c1_m_clken_q <= 1'h0;
    end else begin
      lsu_c1_m_clken_q <= lsu_c1_m_clken;
    end
    if (reset) begin
      lsu_c1_r_clken_q <= 1'h0;
    end else begin
      lsu_c1_r_clken_q <= lsu_c1_r_clken;
    end
  end
  always @(posedge io_free_clk) begin
    if (reset) begin
      lsu_free_c1_clken_q <= 1'h0;
    end else begin
      lsu_free_c1_clken_q <= lsu_free_c1_clken;
    end
  end
endmodule
