;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit axi4_to_ahb : 
  extmodule gated_latch : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_1 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_1 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_1 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_2 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_2 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_2 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_3 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_3 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_3 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_4 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_4 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_4 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_5 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_5 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_5 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_6 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_6 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_6 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_7 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_7 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_7 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_8 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_8 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_8 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_9 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_9 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_9 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  module axi4_to_ahb : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip bus_clk_en : UInt<1>, flip clk_override : UInt<1>, flip axi_awvalid : UInt<1>, flip axi_awid : UInt<1>, flip axi_awaddr : UInt<32>, flip axi_awsize : UInt<3>, flip axi_awprot : UInt<3>, flip axi_wvalid : UInt<1>, flip axi_wdata : UInt<64>, flip axi_wstrb : UInt<8>, flip axi_wlast : UInt<1>, flip axi_bready : UInt<1>, flip axi_arvalid : UInt<1>, flip axi_arid : UInt<1>, flip axi_araddr : UInt<32>, flip axi_arsize : UInt<3>, flip axi_arprot : UInt<3>, flip axi_rready : UInt<1>, flip ahb_hrdata : UInt<64>, flip ahb_hready : UInt<1>, flip ahb_hresp : UInt<1>, axi_awready : UInt<1>, axi_wready : UInt<1>, axi_bvalid : UInt<1>, axi_bresp : UInt<2>, axi_bid : UInt<1>, axi_arready : UInt<1>, axi_rvalid : UInt<1>, axi_rid : UInt<1>, axi_rdata : UInt<64>, axi_rresp : UInt<2>, axi_rlast : UInt<1>, ahb_haddr : UInt<32>, ahb_hburst : UInt<3>, ahb_hmastlock : UInt<1>, ahb_hprot : UInt<4>, ahb_hsize : UInt<3>, ahb_htrans : UInt<2>, ahb_hwrite : UInt<1>, ahb_hwdata : UInt<64>}
    
    wire buf_rst : UInt<1>
    buf_rst <= UInt<1>("h00")
    wire buf_state_en : UInt<1>
    buf_state_en <= UInt<1>("h00")
    wire ahbm_clk : Clock @[axi4_to_ahb.scala 62:22]
    wire ahbm_addr_clk : Clock @[axi4_to_ahb.scala 63:27]
    wire ahbm_data_clk : Clock @[axi4_to_ahb.scala 64:27]
    wire buf_state : UInt<3>
    buf_state <= UInt<3>("h00")
    wire buf_nxtstate : UInt<3>
    buf_nxtstate <= UInt<3>("h00")
    node _T = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 68:70]
    node _T_1 = mux(_T, buf_nxtstate, buf_state) @[axi4_to_ahb.scala 68:50]
    node _T_2 = eq(buf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 68:107]
    node _T_3 = bits(_T_2, 0, 0) @[Bitwise.scala 72:15]
    node _T_4 = mux(_T_3, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_5 = and(_T_1, _T_4) @[axi4_to_ahb.scala 68:98]
    reg _T_6 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 68:45]
    _T_6 <= _T_5 @[axi4_to_ahb.scala 68:45]
    buf_state <= _T_6 @[axi4_to_ahb.scala 68:13]
    wire slave_valid : UInt<1>
    slave_valid <= UInt<1>("h00")
    wire slave_ready : UInt<1>
    slave_ready <= UInt<1>("h00")
    wire slave_tag : UInt<1>
    slave_tag <= UInt<1>("h00")
    wire slave_rdata : UInt<64>
    slave_rdata <= UInt<64>("h00")
    wire slave_opc : UInt<4>
    slave_opc <= UInt<4>("h00")
    wire wrbuf_en : UInt<1>
    wrbuf_en <= UInt<1>("h00")
    wire wrbuf_data_en : UInt<1>
    wrbuf_data_en <= UInt<1>("h00")
    wire wrbuf_cmd_sent : UInt<1>
    wrbuf_cmd_sent <= UInt<1>("h00")
    wire wrbuf_rst : UInt<1>
    wrbuf_rst <= UInt<1>("h00")
    wire wrbuf_vld : UInt<1>
    wrbuf_vld <= UInt<1>("h00")
    wire wrbuf_data_vld : UInt<1>
    wrbuf_data_vld <= UInt<1>("h00")
    wire wrbuf_tag : UInt<1>
    wrbuf_tag <= UInt<1>("h00")
    wire wrbuf_size : UInt<3>
    wrbuf_size <= UInt<3>("h00")
    wire wrbuf_addr : UInt<32>
    wrbuf_addr <= UInt<32>("h00")
    wire wrbuf_data : UInt<64>
    wrbuf_data <= UInt<64>("h00")
    wire wrbuf_byteen : UInt<8>
    wrbuf_byteen <= UInt<8>("h00")
    wire bus_write_clk_en : UInt<1>
    bus_write_clk_en <= UInt<1>("h00")
    wire bus_clk : Clock @[axi4_to_ahb.scala 88:21]
    wire bus_write_clk : Clock @[axi4_to_ahb.scala 89:27]
    wire master_valid : UInt<1>
    master_valid <= UInt<1>("h00")
    wire master_ready : UInt<1>
    master_ready <= UInt<1>("h00")
    wire master_tag : UInt<1>
    master_tag <= UInt<1>("h00")
    wire master_addr : UInt<32>
    master_addr <= UInt<32>("h00")
    wire master_wdata : UInt<64>
    master_wdata <= UInt<64>("h00")
    wire master_size : UInt<3>
    master_size <= UInt<3>("h00")
    wire master_opc : UInt<3>
    master_opc <= UInt<3>("h00")
    wire master_byteen : UInt<8>
    master_byteen <= UInt<8>("h00")
    wire buf_addr : UInt<32>
    buf_addr <= UInt<32>("h00")
    wire buf_size : UInt<2>
    buf_size <= UInt<2>("h00")
    wire buf_write : UInt<1>
    buf_write <= UInt<1>("h00")
    wire buf_byteen : UInt<8>
    buf_byteen <= UInt<8>("h00")
    wire buf_aligned : UInt<1>
    buf_aligned <= UInt<1>("h00")
    wire buf_data : UInt<64>
    buf_data <= UInt<64>("h00")
    wire buf_tag : UInt<1>
    buf_tag <= UInt<1>("h00")
    wire buf_tag_in : UInt<1>
    buf_tag_in <= UInt<1>("h00")
    wire buf_addr_in : UInt<32>
    buf_addr_in <= UInt<32>("h00")
    wire buf_byteen_in : UInt<8>
    buf_byteen_in <= UInt<8>("h00")
    wire buf_data_in : UInt<64>
    buf_data_in <= UInt<64>("h00")
    wire buf_write_in : UInt<1>
    buf_write_in <= UInt<1>("h00")
    wire buf_aligned_in : UInt<1>
    buf_aligned_in <= UInt<1>("h00")
    wire buf_size_in : UInt<3>
    buf_size_in <= UInt<3>("h00")
    wire buf_wr_en : UInt<1>
    buf_wr_en <= UInt<1>("h00")
    wire buf_data_wr_en : UInt<1>
    buf_data_wr_en <= UInt<1>("h00")
    wire slvbuf_error_en : UInt<1>
    slvbuf_error_en <= UInt<1>("h00")
    wire wr_cmd_vld : UInt<1>
    wr_cmd_vld <= UInt<1>("h00")
    wire cmd_done_rst : UInt<1>
    cmd_done_rst <= UInt<1>("h00")
    wire cmd_done : UInt<1>
    cmd_done <= UInt<1>("h00")
    wire cmd_doneQ : UInt<1>
    cmd_doneQ <= UInt<1>("h00")
    wire trxn_done : UInt<1>
    trxn_done <= UInt<1>("h00")
    wire buf_cmd_byte_ptr : UInt<3>
    buf_cmd_byte_ptr <= UInt<3>("h00")
    wire buf_cmd_byte_ptrQ : UInt<3>
    buf_cmd_byte_ptrQ <= UInt<3>("h00")
    wire buf_cmd_nxtbyte_ptr : UInt<3>
    buf_cmd_nxtbyte_ptr <= UInt<3>("h00")
    wire buf_cmd_byte_ptr_en : UInt<1>
    buf_cmd_byte_ptr_en <= UInt<1>("h00")
    wire found : UInt<1>
    found <= UInt<1>("h00")
    wire slave_valid_pre : UInt<1>
    slave_valid_pre <= UInt<1>("h00")
    wire ahb_hready_q : UInt<1>
    ahb_hready_q <= UInt<1>("h00")
    wire ahb_hresp_q : UInt<1>
    ahb_hresp_q <= UInt<1>("h00")
    wire ahb_htrans_q : UInt<2>
    ahb_htrans_q <= UInt<2>("h00")
    wire ahb_hwrite_q : UInt<1>
    ahb_hwrite_q <= UInt<1>("h00")
    wire ahb_hrdata_q : UInt<64>
    ahb_hrdata_q <= UInt<64>("h00")
    wire slvbuf_write : UInt<1>
    slvbuf_write <= UInt<1>("h00")
    wire slvbuf_error : UInt<1>
    slvbuf_error <= UInt<1>("h00")
    wire slvbuf_tag : UInt<1>
    slvbuf_tag <= UInt<1>("h00")
    wire slvbuf_error_in : UInt<1>
    slvbuf_error_in <= UInt<1>("h00")
    wire slvbuf_wr_en : UInt<1>
    slvbuf_wr_en <= UInt<1>("h00")
    wire bypass_en : UInt<1>
    bypass_en <= UInt<1>("h00")
    wire rd_bypass_idle : UInt<1>
    rd_bypass_idle <= UInt<1>("h00")
    wire last_addr_en : UInt<1>
    last_addr_en <= UInt<1>("h00")
    wire last_bus_addr : UInt<32>
    last_bus_addr <= UInt<32>("h00")
    wire buf_clken : UInt<1>
    buf_clken <= UInt<1>("h00")
    wire slvbuf_clken : UInt<1>
    slvbuf_clken <= UInt<1>("h00")
    wire ahbm_addr_clken : UInt<1>
    ahbm_addr_clken <= UInt<1>("h00")
    wire ahbm_data_clken : UInt<1>
    ahbm_data_clken <= UInt<1>("h00")
    wire buf_clk : Clock @[axi4_to_ahb.scala 156:21]
    node _T_7 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 197:27]
    wr_cmd_vld <= _T_7 @[axi4_to_ahb.scala 197:14]
    node _T_8 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 198:30]
    master_valid <= _T_8 @[axi4_to_ahb.scala 198:16]
    node _T_9 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 199:38]
    node _T_10 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 199:51]
    node _T_11 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 199:76]
    node _T_12 = mux(_T_9, _T_10, _T_11) @[axi4_to_ahb.scala 199:20]
    master_tag <= _T_12 @[axi4_to_ahb.scala 199:14]
    node _T_13 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 200:38]
    node _T_14 = mux(_T_13, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 200:20]
    master_opc <= _T_14 @[axi4_to_ahb.scala 200:14]
    node _T_15 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 201:39]
    node _T_16 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 201:53]
    node _T_17 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 201:75]
    node _T_18 = mux(_T_15, _T_16, _T_17) @[axi4_to_ahb.scala 201:21]
    master_addr <= _T_18 @[axi4_to_ahb.scala 201:15]
    node _T_19 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 202:39]
    node _T_20 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 202:53]
    node _T_21 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 202:74]
    node _T_22 = mux(_T_19, _T_20, _T_21) @[axi4_to_ahb.scala 202:21]
    master_size <= _T_22 @[axi4_to_ahb.scala 202:15]
    node _T_23 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 203:32]
    master_byteen <= _T_23 @[axi4_to_ahb.scala 203:17]
    node _T_24 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 204:29]
    master_wdata <= _T_24 @[axi4_to_ahb.scala 204:16]
    node _T_25 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 207:32]
    node _T_26 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 207:57]
    node _T_27 = and(_T_25, _T_26) @[axi4_to_ahb.scala 207:46]
    io.axi_bvalid <= _T_27 @[axi4_to_ahb.scala 207:17]
    node _T_28 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 208:32]
    node _T_29 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 208:59]
    node _T_30 = mux(_T_29, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 208:49]
    node _T_31 = mux(_T_28, UInt<2>("h02"), _T_30) @[axi4_to_ahb.scala 208:22]
    io.axi_bresp <= _T_31 @[axi4_to_ahb.scala 208:16]
    node _T_32 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 209:26]
    io.axi_bid <= _T_32 @[axi4_to_ahb.scala 209:14]
    node _T_33 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 211:32]
    node _T_34 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 211:58]
    node _T_35 = eq(_T_34, UInt<1>("h00")) @[axi4_to_ahb.scala 211:65]
    node _T_36 = and(_T_33, _T_35) @[axi4_to_ahb.scala 211:46]
    io.axi_rvalid <= _T_36 @[axi4_to_ahb.scala 211:17]
    node _T_37 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 212:32]
    node _T_38 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 212:59]
    node _T_39 = mux(_T_38, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 212:49]
    node _T_40 = mux(_T_37, UInt<2>("h02"), _T_39) @[axi4_to_ahb.scala 212:22]
    io.axi_rresp <= _T_40 @[axi4_to_ahb.scala 212:16]
    node _T_41 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 213:26]
    io.axi_rid <= _T_41 @[axi4_to_ahb.scala 213:14]
    node _T_42 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 214:30]
    io.axi_rdata <= _T_42 @[axi4_to_ahb.scala 214:16]
    node _T_43 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 215:32]
    slave_ready <= _T_43 @[axi4_to_ahb.scala 215:15]
    node _T_44 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 218:56]
    node _T_45 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 218:91]
    node _T_46 = or(_T_44, _T_45) @[axi4_to_ahb.scala 218:74]
    node _T_47 = and(io.bus_clk_en, _T_46) @[axi4_to_ahb.scala 218:37]
    bus_write_clk_en <= _T_47 @[axi4_to_ahb.scala 218:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 220:11]
    node _T_48 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 221:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_48 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 221:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 224:17]
    master_ready <= UInt<1>("h00") @[axi4_to_ahb.scala 225:16]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 226:16]
    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 227:18]
    buf_data_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 229:18]
    slvbuf_error_in <= UInt<1>("h00") @[axi4_to_ahb.scala 230:21]
    slvbuf_error_en <= UInt<1>("h00") @[axi4_to_ahb.scala 231:21]
    buf_write_in <= UInt<1>("h00") @[axi4_to_ahb.scala 232:18]
    cmd_done <= UInt<1>("h00") @[axi4_to_ahb.scala 233:18]
    trxn_done <= UInt<1>("h00") @[axi4_to_ahb.scala 234:18]
    buf_cmd_byte_ptr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 235:23]
    buf_cmd_byte_ptr <= UInt<1>("h00") @[axi4_to_ahb.scala 236:20]
    slave_valid_pre <= UInt<1>("h00") @[axi4_to_ahb.scala 237:21]
    slvbuf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 238:19]
    bypass_en <= UInt<1>("h00") @[axi4_to_ahb.scala 239:20]
    rd_bypass_idle <= UInt<1>("h00") @[axi4_to_ahb.scala 240:18]
    node _T_49 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_49 : @[Conditional.scala 40:58]
      master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 244:20]
      node _T_50 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 245:34]
      node _T_51 = eq(_T_50, UInt<1>("h01")) @[axi4_to_ahb.scala 245:41]
      buf_write_in <= _T_51 @[axi4_to_ahb.scala 245:20]
      node _T_52 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 246:46]
      node _T_53 = mux(_T_52, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 246:26]
      buf_nxtstate <= _T_53 @[axi4_to_ahb.scala 246:20]
      node _T_54 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 247:36]
      buf_state_en <= _T_54 @[axi4_to_ahb.scala 247:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 248:17]
      node _T_55 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 249:54]
      node _T_56 = and(buf_state_en, _T_55) @[axi4_to_ahb.scala 249:38]
      buf_data_wr_en <= _T_56 @[axi4_to_ahb.scala 249:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 250:27]
      node _T_57 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 252:50]
      node _T_58 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 252:89]
      node _T_59 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
      node _T_60 = tail(_T_59, 1) @[axi4_to_ahb.scala 181:52]
      node _T_61 = mux(UInt<1>("h00"), _T_60, UInt<1>("h00")) @[axi4_to_ahb.scala 181:24]
      node _T_62 = bits(_T_58, 0, 0) @[axi4_to_ahb.scala 182:44]
      node _T_63 = geq(UInt<1>("h00"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_64 = and(_T_62, _T_63) @[axi4_to_ahb.scala 182:48]
      node _T_65 = bits(_T_58, 1, 1) @[axi4_to_ahb.scala 182:44]
      node _T_66 = geq(UInt<1>("h01"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_67 = and(_T_65, _T_66) @[axi4_to_ahb.scala 182:48]
      node _T_68 = bits(_T_58, 2, 2) @[axi4_to_ahb.scala 182:44]
      node _T_69 = geq(UInt<2>("h02"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_70 = and(_T_68, _T_69) @[axi4_to_ahb.scala 182:48]
      node _T_71 = bits(_T_58, 3, 3) @[axi4_to_ahb.scala 182:44]
      node _T_72 = geq(UInt<2>("h03"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_73 = and(_T_71, _T_72) @[axi4_to_ahb.scala 182:48]
      node _T_74 = bits(_T_58, 4, 4) @[axi4_to_ahb.scala 182:44]
      node _T_75 = geq(UInt<3>("h04"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_76 = and(_T_74, _T_75) @[axi4_to_ahb.scala 182:48]
      node _T_77 = bits(_T_58, 5, 5) @[axi4_to_ahb.scala 182:44]
      node _T_78 = geq(UInt<3>("h05"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_79 = and(_T_77, _T_78) @[axi4_to_ahb.scala 182:48]
      node _T_80 = bits(_T_58, 6, 6) @[axi4_to_ahb.scala 182:44]
      node _T_81 = geq(UInt<3>("h06"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_82 = and(_T_80, _T_81) @[axi4_to_ahb.scala 182:48]
      node _T_83 = bits(_T_58, 7, 7) @[axi4_to_ahb.scala 182:44]
      node _T_84 = geq(UInt<3>("h07"), _T_61) @[axi4_to_ahb.scala 182:62]
      node _T_85 = and(_T_83, _T_84) @[axi4_to_ahb.scala 182:48]
      node _T_86 = mux(_T_85, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_87 = mux(_T_82, UInt<3>("h06"), _T_86) @[Mux.scala 98:16]
      node _T_88 = mux(_T_79, UInt<3>("h05"), _T_87) @[Mux.scala 98:16]
      node _T_89 = mux(_T_76, UInt<3>("h04"), _T_88) @[Mux.scala 98:16]
      node _T_90 = mux(_T_73, UInt<2>("h03"), _T_89) @[Mux.scala 98:16]
      node _T_91 = mux(_T_70, UInt<2>("h02"), _T_90) @[Mux.scala 98:16]
      node _T_92 = mux(_T_67, UInt<1>("h01"), _T_91) @[Mux.scala 98:16]
      node _T_93 = mux(_T_64, UInt<1>("h00"), _T_92) @[Mux.scala 98:16]
      node _T_94 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 252:138]
      node _T_95 = mux(_T_57, _T_93, _T_94) @[axi4_to_ahb.scala 252:30]
      buf_cmd_byte_ptr <= _T_95 @[axi4_to_ahb.scala 252:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 253:17]
      node _T_96 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 254:51]
      node _T_97 = and(bypass_en, _T_96) @[axi4_to_ahb.scala 254:35]
      rd_bypass_idle <= _T_97 @[axi4_to_ahb.scala 254:22]
      node _T_98 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_99 = mux(_T_98, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_100 = and(_T_99, UInt<2>("h02")) @[axi4_to_ahb.scala 255:45]
      io.ahb_htrans <= _T_100 @[axi4_to_ahb.scala 255:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_101 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_101 : @[Conditional.scala 39:67]
        node _T_102 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 259:54]
        node _T_103 = eq(_T_102, UInt<1>("h00")) @[axi4_to_ahb.scala 259:61]
        node _T_104 = and(master_valid, _T_103) @[axi4_to_ahb.scala 259:41]
        node _T_105 = bits(_T_104, 0, 0) @[axi4_to_ahb.scala 259:82]
        node _T_106 = mux(_T_105, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 259:26]
        buf_nxtstate <= _T_106 @[axi4_to_ahb.scala 259:20]
        node _T_107 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 260:51]
        node _T_108 = neq(_T_107, UInt<1>("h00")) @[axi4_to_ahb.scala 260:58]
        node _T_109 = and(ahb_hready_q, _T_108) @[axi4_to_ahb.scala 260:36]
        node _T_110 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 260:72]
        node _T_111 = and(_T_109, _T_110) @[axi4_to_ahb.scala 260:70]
        buf_state_en <= _T_111 @[axi4_to_ahb.scala 260:20]
        node _T_112 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 261:34]
        node _T_113 = and(buf_state_en, _T_112) @[axi4_to_ahb.scala 261:32]
        cmd_done <= _T_113 @[axi4_to_ahb.scala 261:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 262:20]
        node _T_114 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 263:52]
        node _T_115 = neq(_T_114, UInt<1>("h00")) @[axi4_to_ahb.scala 263:59]
        node _T_116 = and(ahb_hready_q, _T_115) @[axi4_to_ahb.scala 263:37]
        node _T_117 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 263:73]
        node _T_118 = and(_T_116, _T_117) @[axi4_to_ahb.scala 263:71]
        node _T_119 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 263:122]
        node _T_120 = eq(_T_119, UInt<1>("h00")) @[axi4_to_ahb.scala 263:129]
        node _T_121 = and(master_valid, _T_120) @[axi4_to_ahb.scala 263:109]
        node _T_122 = bits(_T_121, 0, 0) @[axi4_to_ahb.scala 263:150]
        node _T_123 = mux(_T_122, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 263:94]
        node _T_124 = eq(_T_123, UInt<3>("h06")) @[axi4_to_ahb.scala 263:174]
        node _T_125 = and(_T_118, _T_124) @[axi4_to_ahb.scala 263:88]
        master_ready <= _T_125 @[axi4_to_ahb.scala 263:20]
        buf_wr_en <= master_ready @[axi4_to_ahb.scala 264:17]
        node _T_126 = and(master_ready, master_valid) @[axi4_to_ahb.scala 265:33]
        bypass_en <= _T_126 @[axi4_to_ahb.scala 265:17]
        node _T_127 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 266:47]
        node _T_128 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 266:62]
        node _T_129 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 266:78]
        node _T_130 = mux(_T_127, _T_128, _T_129) @[axi4_to_ahb.scala 266:30]
        buf_cmd_byte_ptr <= _T_130 @[axi4_to_ahb.scala 266:24]
        node _T_131 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 267:44]
        node _T_132 = or(_T_131, bypass_en) @[axi4_to_ahb.scala 267:58]
        node _T_133 = bits(_T_132, 0, 0) @[Bitwise.scala 72:15]
        node _T_134 = mux(_T_133, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_135 = and(UInt<2>("h02"), _T_134) @[axi4_to_ahb.scala 267:32]
        io.ahb_htrans <= _T_135 @[axi4_to_ahb.scala 267:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_136 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_136 : @[Conditional.scala 39:67]
          node _T_137 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 271:39]
          node _T_138 = and(ahb_hready_q, _T_137) @[axi4_to_ahb.scala 271:37]
          node _T_139 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 271:82]
          node _T_140 = eq(_T_139, UInt<1>("h01")) @[axi4_to_ahb.scala 271:89]
          node _T_141 = and(master_valid, _T_140) @[axi4_to_ahb.scala 271:70]
          node _T_142 = eq(_T_141, UInt<1>("h00")) @[axi4_to_ahb.scala 271:55]
          node _T_143 = and(_T_138, _T_142) @[axi4_to_ahb.scala 271:53]
          master_ready <= _T_143 @[axi4_to_ahb.scala 271:20]
          node _T_144 = and(master_valid, master_ready) @[axi4_to_ahb.scala 272:34]
          node _T_145 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 272:62]
          node _T_146 = eq(_T_145, UInt<1>("h00")) @[axi4_to_ahb.scala 272:69]
          node _T_147 = and(_T_144, _T_146) @[axi4_to_ahb.scala 272:49]
          buf_wr_en <= _T_147 @[axi4_to_ahb.scala 272:17]
          node _T_148 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 273:45]
          node _T_149 = and(master_valid, master_ready) @[axi4_to_ahb.scala 273:82]
          node _T_150 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 273:110]
          node _T_151 = eq(_T_150, UInt<1>("h00")) @[axi4_to_ahb.scala 273:117]
          node _T_152 = and(_T_149, _T_151) @[axi4_to_ahb.scala 273:97]
          node _T_153 = bits(_T_152, 0, 0) @[axi4_to_ahb.scala 273:138]
          node _T_154 = mux(_T_153, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 273:67]
          node _T_155 = mux(_T_148, UInt<3>("h07"), _T_154) @[axi4_to_ahb.scala 273:26]
          buf_nxtstate <= _T_155 @[axi4_to_ahb.scala 273:20]
          node _T_156 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 274:37]
          buf_state_en <= _T_156 @[axi4_to_ahb.scala 274:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 275:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 276:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 277:23]
          node _T_157 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 278:41]
          node _T_158 = and(buf_state_en, _T_157) @[axi4_to_ahb.scala 278:39]
          slave_valid_pre <= _T_158 @[axi4_to_ahb.scala 278:23]
          node _T_159 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 279:34]
          node _T_160 = and(buf_state_en, _T_159) @[axi4_to_ahb.scala 279:32]
          cmd_done <= _T_160 @[axi4_to_ahb.scala 279:16]
          node _T_161 = and(master_ready, master_valid) @[axi4_to_ahb.scala 280:33]
          node _T_162 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 280:64]
          node _T_163 = and(_T_161, _T_162) @[axi4_to_ahb.scala 280:48]
          node _T_164 = and(_T_163, buf_state_en) @[axi4_to_ahb.scala 280:79]
          bypass_en <= _T_164 @[axi4_to_ahb.scala 280:17]
          node _T_165 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 281:47]
          node _T_166 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 281:62]
          node _T_167 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 281:78]
          node _T_168 = mux(_T_165, _T_166, _T_167) @[axi4_to_ahb.scala 281:30]
          buf_cmd_byte_ptr <= _T_168 @[axi4_to_ahb.scala 281:24]
          node _T_169 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 282:59]
          node _T_170 = and(_T_169, buf_state_en) @[axi4_to_ahb.scala 282:74]
          node _T_171 = eq(_T_170, UInt<1>("h00")) @[axi4_to_ahb.scala 282:43]
          node _T_172 = bits(_T_171, 0, 0) @[Bitwise.scala 72:15]
          node _T_173 = mux(_T_172, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_174 = and(UInt<2>("h02"), _T_173) @[axi4_to_ahb.scala 282:32]
          io.ahb_htrans <= _T_174 @[axi4_to_ahb.scala 282:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 283:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_175 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_175 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 287:20]
            node _T_176 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 288:51]
            node _T_177 = neq(_T_176, UInt<1>("h00")) @[axi4_to_ahb.scala 288:58]
            node _T_178 = and(ahb_hready_q, _T_177) @[axi4_to_ahb.scala 288:36]
            node _T_179 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 288:72]
            node _T_180 = and(_T_178, _T_179) @[axi4_to_ahb.scala 288:70]
            buf_state_en <= _T_180 @[axi4_to_ahb.scala 288:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 289:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 290:20]
            node _T_181 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 291:35]
            buf_cmd_byte_ptr <= _T_181 @[axi4_to_ahb.scala 291:24]
            node _T_182 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 292:47]
            node _T_183 = bits(_T_182, 0, 0) @[Bitwise.scala 72:15]
            node _T_184 = mux(_T_183, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_185 = and(UInt<2>("h02"), _T_184) @[axi4_to_ahb.scala 292:37]
            io.ahb_htrans <= _T_185 @[axi4_to_ahb.scala 292:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_186 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_186 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 296:20]
              node _T_187 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 297:37]
              buf_state_en <= _T_187 @[axi4_to_ahb.scala 297:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 298:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 299:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 300:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 301:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_188 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_188 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 305:20]
                node _T_189 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 306:33]
                node _T_190 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 306:63]
                node _T_191 = neq(_T_190, UInt<1>("h00")) @[axi4_to_ahb.scala 306:70]
                node _T_192 = and(_T_189, _T_191) @[axi4_to_ahb.scala 306:48]
                trxn_done <= _T_192 @[axi4_to_ahb.scala 306:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 307:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 308:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 309:20]
                node _T_193 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 310:47]
                node _T_194 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 310:85]
                node _T_195 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 310:103]
                node _T_196 = add(_T_194, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                node _T_197 = tail(_T_196, 1) @[axi4_to_ahb.scala 181:52]
                node _T_198 = mux(UInt<1>("h01"), _T_197, _T_194) @[axi4_to_ahb.scala 181:24]
                node _T_199 = bits(_T_195, 0, 0) @[axi4_to_ahb.scala 182:44]
                node _T_200 = geq(UInt<1>("h00"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_201 = and(_T_199, _T_200) @[axi4_to_ahb.scala 182:48]
                node _T_202 = bits(_T_195, 1, 1) @[axi4_to_ahb.scala 182:44]
                node _T_203 = geq(UInt<1>("h01"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_204 = and(_T_202, _T_203) @[axi4_to_ahb.scala 182:48]
                node _T_205 = bits(_T_195, 2, 2) @[axi4_to_ahb.scala 182:44]
                node _T_206 = geq(UInt<2>("h02"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_207 = and(_T_205, _T_206) @[axi4_to_ahb.scala 182:48]
                node _T_208 = bits(_T_195, 3, 3) @[axi4_to_ahb.scala 182:44]
                node _T_209 = geq(UInt<2>("h03"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_210 = and(_T_208, _T_209) @[axi4_to_ahb.scala 182:48]
                node _T_211 = bits(_T_195, 4, 4) @[axi4_to_ahb.scala 182:44]
                node _T_212 = geq(UInt<3>("h04"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_213 = and(_T_211, _T_212) @[axi4_to_ahb.scala 182:48]
                node _T_214 = bits(_T_195, 5, 5) @[axi4_to_ahb.scala 182:44]
                node _T_215 = geq(UInt<3>("h05"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_216 = and(_T_214, _T_215) @[axi4_to_ahb.scala 182:48]
                node _T_217 = bits(_T_195, 6, 6) @[axi4_to_ahb.scala 182:44]
                node _T_218 = geq(UInt<3>("h06"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_219 = and(_T_217, _T_218) @[axi4_to_ahb.scala 182:48]
                node _T_220 = bits(_T_195, 7, 7) @[axi4_to_ahb.scala 182:44]
                node _T_221 = geq(UInt<3>("h07"), _T_198) @[axi4_to_ahb.scala 182:62]
                node _T_222 = and(_T_220, _T_221) @[axi4_to_ahb.scala 182:48]
                node _T_223 = mux(_T_222, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_224 = mux(_T_219, UInt<3>("h06"), _T_223) @[Mux.scala 98:16]
                node _T_225 = mux(_T_216, UInt<3>("h05"), _T_224) @[Mux.scala 98:16]
                node _T_226 = mux(_T_213, UInt<3>("h04"), _T_225) @[Mux.scala 98:16]
                node _T_227 = mux(_T_210, UInt<2>("h03"), _T_226) @[Mux.scala 98:16]
                node _T_228 = mux(_T_207, UInt<2>("h02"), _T_227) @[Mux.scala 98:16]
                node _T_229 = mux(_T_204, UInt<1>("h01"), _T_228) @[Mux.scala 98:16]
                node _T_230 = mux(_T_201, UInt<1>("h00"), _T_229) @[Mux.scala 98:16]
                node _T_231 = mux(_T_193, _T_230, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 310:30]
                buf_cmd_byte_ptr <= _T_231 @[axi4_to_ahb.scala 310:24]
                node _T_232 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 311:65]
                node _T_233 = or(buf_aligned, _T_232) @[axi4_to_ahb.scala 311:44]
                node _T_234 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 311:127]
                node _T_235 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 311:145]
                node _T_236 = add(_T_234, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                node _T_237 = tail(_T_236, 1) @[axi4_to_ahb.scala 181:52]
                node _T_238 = mux(UInt<1>("h01"), _T_237, _T_234) @[axi4_to_ahb.scala 181:24]
                node _T_239 = bits(_T_235, 0, 0) @[axi4_to_ahb.scala 182:44]
                node _T_240 = geq(UInt<1>("h00"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_241 = and(_T_239, _T_240) @[axi4_to_ahb.scala 182:48]
                node _T_242 = bits(_T_235, 1, 1) @[axi4_to_ahb.scala 182:44]
                node _T_243 = geq(UInt<1>("h01"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_244 = and(_T_242, _T_243) @[axi4_to_ahb.scala 182:48]
                node _T_245 = bits(_T_235, 2, 2) @[axi4_to_ahb.scala 182:44]
                node _T_246 = geq(UInt<2>("h02"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_247 = and(_T_245, _T_246) @[axi4_to_ahb.scala 182:48]
                node _T_248 = bits(_T_235, 3, 3) @[axi4_to_ahb.scala 182:44]
                node _T_249 = geq(UInt<2>("h03"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_250 = and(_T_248, _T_249) @[axi4_to_ahb.scala 182:48]
                node _T_251 = bits(_T_235, 4, 4) @[axi4_to_ahb.scala 182:44]
                node _T_252 = geq(UInt<3>("h04"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_253 = and(_T_251, _T_252) @[axi4_to_ahb.scala 182:48]
                node _T_254 = bits(_T_235, 5, 5) @[axi4_to_ahb.scala 182:44]
                node _T_255 = geq(UInt<3>("h05"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_256 = and(_T_254, _T_255) @[axi4_to_ahb.scala 182:48]
                node _T_257 = bits(_T_235, 6, 6) @[axi4_to_ahb.scala 182:44]
                node _T_258 = geq(UInt<3>("h06"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_259 = and(_T_257, _T_258) @[axi4_to_ahb.scala 182:48]
                node _T_260 = bits(_T_235, 7, 7) @[axi4_to_ahb.scala 182:44]
                node _T_261 = geq(UInt<3>("h07"), _T_238) @[axi4_to_ahb.scala 182:62]
                node _T_262 = and(_T_260, _T_261) @[axi4_to_ahb.scala 182:48]
                node _T_263 = mux(_T_262, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_264 = mux(_T_259, UInt<3>("h06"), _T_263) @[Mux.scala 98:16]
                node _T_265 = mux(_T_256, UInt<3>("h05"), _T_264) @[Mux.scala 98:16]
                node _T_266 = mux(_T_253, UInt<3>("h04"), _T_265) @[Mux.scala 98:16]
                node _T_267 = mux(_T_250, UInt<2>("h03"), _T_266) @[Mux.scala 98:16]
                node _T_268 = mux(_T_247, UInt<2>("h02"), _T_267) @[Mux.scala 98:16]
                node _T_269 = mux(_T_244, UInt<1>("h01"), _T_268) @[Mux.scala 98:16]
                node _T_270 = mux(_T_241, UInt<1>("h00"), _T_269) @[Mux.scala 98:16]
                node _T_271 = dshr(buf_byteen, _T_270) @[axi4_to_ahb.scala 311:92]
                node _T_272 = bits(_T_271, 0, 0) @[axi4_to_ahb.scala 311:92]
                node _T_273 = eq(_T_272, UInt<1>("h00")) @[axi4_to_ahb.scala 311:163]
                node _T_274 = or(_T_233, _T_273) @[axi4_to_ahb.scala 311:79]
                node _T_275 = and(trxn_done, _T_274) @[axi4_to_ahb.scala 311:29]
                cmd_done <= _T_275 @[axi4_to_ahb.scala 311:16]
                node _T_276 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 312:43]
                node _T_277 = eq(_T_276, UInt<1>("h00")) @[axi4_to_ahb.scala 312:32]
                node _T_278 = bits(_T_277, 0, 0) @[Bitwise.scala 72:15]
                node _T_279 = mux(_T_278, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_280 = and(_T_279, UInt<2>("h02")) @[axi4_to_ahb.scala 312:57]
                io.ahb_htrans <= _T_280 @[axi4_to_ahb.scala 312:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_281 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_281 : @[Conditional.scala 39:67]
                  node _T_282 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 316:34]
                  node _T_283 = or(_T_282, ahb_hresp_q) @[axi4_to_ahb.scala 316:50]
                  buf_state_en <= _T_283 @[axi4_to_ahb.scala 316:20]
                  node _T_284 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 317:35]
                  node _T_285 = or(_T_284, ahb_hresp_q) @[axi4_to_ahb.scala 317:51]
                  node _T_286 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 317:68]
                  node _T_287 = and(_T_285, _T_286) @[axi4_to_ahb.scala 317:66]
                  node _T_288 = and(_T_287, slave_ready) @[axi4_to_ahb.scala 317:81]
                  master_ready <= _T_288 @[axi4_to_ahb.scala 317:20]
                  node _T_289 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 318:42]
                  node _T_290 = or(ahb_hresp_q, _T_289) @[axi4_to_ahb.scala 318:40]
                  node _T_291 = bits(_T_290, 0, 0) @[axi4_to_ahb.scala 318:62]
                  node _T_292 = and(master_valid, master_ready) @[axi4_to_ahb.scala 318:90]
                  node _T_293 = bits(_T_292, 0, 0) @[axi4_to_ahb.scala 318:112]
                  node _T_294 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 318:131]
                  node _T_295 = eq(_T_294, UInt<1>("h01")) @[axi4_to_ahb.scala 318:138]
                  node _T_296 = mux(_T_295, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 318:119]
                  node _T_297 = mux(_T_293, _T_296, UInt<3>("h00")) @[axi4_to_ahb.scala 318:75]
                  node _T_298 = mux(_T_291, UInt<3>("h05"), _T_297) @[axi4_to_ahb.scala 318:26]
                  buf_nxtstate <= _T_298 @[axi4_to_ahb.scala 318:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 319:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 320:23]
                  node _T_299 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 321:34]
                  node _T_300 = eq(_T_299, UInt<1>("h01")) @[axi4_to_ahb.scala 321:41]
                  buf_write_in <= _T_300 @[axi4_to_ahb.scala 321:20]
                  node _T_301 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 322:50]
                  node _T_302 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 322:78]
                  node _T_303 = or(_T_301, _T_302) @[axi4_to_ahb.scala 322:62]
                  node _T_304 = and(buf_state_en, _T_303) @[axi4_to_ahb.scala 322:33]
                  buf_wr_en <= _T_304 @[axi4_to_ahb.scala 322:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 323:22]
                  node _T_305 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 324:63]
                  node _T_306 = neq(_T_305, UInt<1>("h00")) @[axi4_to_ahb.scala 324:70]
                  node _T_307 = and(ahb_hready_q, _T_306) @[axi4_to_ahb.scala 324:48]
                  node _T_308 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 324:104]
                  node _T_309 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 324:166]
                  node _T_310 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 324:184]
                  node _T_311 = add(_T_309, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_312 = tail(_T_311, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_313 = mux(UInt<1>("h01"), _T_312, _T_309) @[axi4_to_ahb.scala 181:24]
                  node _T_314 = bits(_T_310, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_315 = geq(UInt<1>("h00"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_316 = and(_T_314, _T_315) @[axi4_to_ahb.scala 182:48]
                  node _T_317 = bits(_T_310, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_318 = geq(UInt<1>("h01"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_319 = and(_T_317, _T_318) @[axi4_to_ahb.scala 182:48]
                  node _T_320 = bits(_T_310, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_321 = geq(UInt<2>("h02"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_322 = and(_T_320, _T_321) @[axi4_to_ahb.scala 182:48]
                  node _T_323 = bits(_T_310, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_324 = geq(UInt<2>("h03"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_325 = and(_T_323, _T_324) @[axi4_to_ahb.scala 182:48]
                  node _T_326 = bits(_T_310, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_327 = geq(UInt<3>("h04"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_328 = and(_T_326, _T_327) @[axi4_to_ahb.scala 182:48]
                  node _T_329 = bits(_T_310, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_330 = geq(UInt<3>("h05"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_331 = and(_T_329, _T_330) @[axi4_to_ahb.scala 182:48]
                  node _T_332 = bits(_T_310, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_333 = geq(UInt<3>("h06"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_334 = and(_T_332, _T_333) @[axi4_to_ahb.scala 182:48]
                  node _T_335 = bits(_T_310, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_336 = geq(UInt<3>("h07"), _T_313) @[axi4_to_ahb.scala 182:62]
                  node _T_337 = and(_T_335, _T_336) @[axi4_to_ahb.scala 182:48]
                  node _T_338 = mux(_T_337, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_339 = mux(_T_334, UInt<3>("h06"), _T_338) @[Mux.scala 98:16]
                  node _T_340 = mux(_T_331, UInt<3>("h05"), _T_339) @[Mux.scala 98:16]
                  node _T_341 = mux(_T_328, UInt<3>("h04"), _T_340) @[Mux.scala 98:16]
                  node _T_342 = mux(_T_325, UInt<2>("h03"), _T_341) @[Mux.scala 98:16]
                  node _T_343 = mux(_T_322, UInt<2>("h02"), _T_342) @[Mux.scala 98:16]
                  node _T_344 = mux(_T_319, UInt<1>("h01"), _T_343) @[Mux.scala 98:16]
                  node _T_345 = mux(_T_316, UInt<1>("h00"), _T_344) @[Mux.scala 98:16]
                  node _T_346 = dshr(buf_byteen, _T_345) @[axi4_to_ahb.scala 324:131]
                  node _T_347 = bits(_T_346, 0, 0) @[axi4_to_ahb.scala 324:131]
                  node _T_348 = eq(_T_347, UInt<1>("h00")) @[axi4_to_ahb.scala 324:202]
                  node _T_349 = or(_T_308, _T_348) @[axi4_to_ahb.scala 324:118]
                  node _T_350 = and(_T_307, _T_349) @[axi4_to_ahb.scala 324:82]
                  node _T_351 = or(ahb_hresp_q, _T_350) @[axi4_to_ahb.scala 324:32]
                  cmd_done <= _T_351 @[axi4_to_ahb.scala 324:16]
                  node _T_352 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 325:33]
                  node _T_353 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 325:64]
                  node _T_354 = and(_T_352, _T_353) @[axi4_to_ahb.scala 325:48]
                  bypass_en <= _T_354 @[axi4_to_ahb.scala 325:17]
                  node _T_355 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 326:44]
                  node _T_356 = eq(_T_355, UInt<1>("h00")) @[axi4_to_ahb.scala 326:33]
                  node _T_357 = or(_T_356, bypass_en) @[axi4_to_ahb.scala 326:57]
                  node _T_358 = bits(_T_357, 0, 0) @[Bitwise.scala 72:15]
                  node _T_359 = mux(_T_358, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_360 = and(_T_359, UInt<2>("h02")) @[axi4_to_ahb.scala 326:71]
                  io.ahb_htrans <= _T_360 @[axi4_to_ahb.scala 326:21]
                  node _T_361 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 327:55]
                  node _T_362 = and(buf_state_en, _T_361) @[axi4_to_ahb.scala 327:39]
                  slave_valid_pre <= _T_362 @[axi4_to_ahb.scala 327:23]
                  node _T_363 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 328:33]
                  node _T_364 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 328:63]
                  node _T_365 = neq(_T_364, UInt<1>("h00")) @[axi4_to_ahb.scala 328:70]
                  node _T_366 = and(_T_363, _T_365) @[axi4_to_ahb.scala 328:48]
                  trxn_done <= _T_366 @[axi4_to_ahb.scala 328:17]
                  node _T_367 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 329:40]
                  buf_cmd_byte_ptr_en <= _T_367 @[axi4_to_ahb.scala 329:27]
                  node _T_368 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 332:76]
                  node _T_369 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_370 = tail(_T_369, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_371 = mux(UInt<1>("h00"), _T_370, UInt<1>("h00")) @[axi4_to_ahb.scala 181:24]
                  node _T_372 = bits(_T_368, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_373 = geq(UInt<1>("h00"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_374 = and(_T_372, _T_373) @[axi4_to_ahb.scala 182:48]
                  node _T_375 = bits(_T_368, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_376 = geq(UInt<1>("h01"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_377 = and(_T_375, _T_376) @[axi4_to_ahb.scala 182:48]
                  node _T_378 = bits(_T_368, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_379 = geq(UInt<2>("h02"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_380 = and(_T_378, _T_379) @[axi4_to_ahb.scala 182:48]
                  node _T_381 = bits(_T_368, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_382 = geq(UInt<2>("h03"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_383 = and(_T_381, _T_382) @[axi4_to_ahb.scala 182:48]
                  node _T_384 = bits(_T_368, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_385 = geq(UInt<3>("h04"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_386 = and(_T_384, _T_385) @[axi4_to_ahb.scala 182:48]
                  node _T_387 = bits(_T_368, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_388 = geq(UInt<3>("h05"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_389 = and(_T_387, _T_388) @[axi4_to_ahb.scala 182:48]
                  node _T_390 = bits(_T_368, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_391 = geq(UInt<3>("h06"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_392 = and(_T_390, _T_391) @[axi4_to_ahb.scala 182:48]
                  node _T_393 = bits(_T_368, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_394 = geq(UInt<3>("h07"), _T_371) @[axi4_to_ahb.scala 182:62]
                  node _T_395 = and(_T_393, _T_394) @[axi4_to_ahb.scala 182:48]
                  node _T_396 = mux(_T_395, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_397 = mux(_T_392, UInt<3>("h06"), _T_396) @[Mux.scala 98:16]
                  node _T_398 = mux(_T_389, UInt<3>("h05"), _T_397) @[Mux.scala 98:16]
                  node _T_399 = mux(_T_386, UInt<3>("h04"), _T_398) @[Mux.scala 98:16]
                  node _T_400 = mux(_T_383, UInt<2>("h03"), _T_399) @[Mux.scala 98:16]
                  node _T_401 = mux(_T_380, UInt<2>("h02"), _T_400) @[Mux.scala 98:16]
                  node _T_402 = mux(_T_377, UInt<1>("h01"), _T_401) @[Mux.scala 98:16]
                  node _T_403 = mux(_T_374, UInt<1>("h00"), _T_402) @[Mux.scala 98:16]
                  node _T_404 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 332:142]
                  node _T_405 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 332:160]
                  node _T_406 = add(_T_404, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_407 = tail(_T_406, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_408 = mux(UInt<1>("h01"), _T_407, _T_404) @[axi4_to_ahb.scala 181:24]
                  node _T_409 = bits(_T_405, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_410 = geq(UInt<1>("h00"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_411 = and(_T_409, _T_410) @[axi4_to_ahb.scala 182:48]
                  node _T_412 = bits(_T_405, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_413 = geq(UInt<1>("h01"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_414 = and(_T_412, _T_413) @[axi4_to_ahb.scala 182:48]
                  node _T_415 = bits(_T_405, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_416 = geq(UInt<2>("h02"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_417 = and(_T_415, _T_416) @[axi4_to_ahb.scala 182:48]
                  node _T_418 = bits(_T_405, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_419 = geq(UInt<2>("h03"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_420 = and(_T_418, _T_419) @[axi4_to_ahb.scala 182:48]
                  node _T_421 = bits(_T_405, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_422 = geq(UInt<3>("h04"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_423 = and(_T_421, _T_422) @[axi4_to_ahb.scala 182:48]
                  node _T_424 = bits(_T_405, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_425 = geq(UInt<3>("h05"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_426 = and(_T_424, _T_425) @[axi4_to_ahb.scala 182:48]
                  node _T_427 = bits(_T_405, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_428 = geq(UInt<3>("h06"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_429 = and(_T_427, _T_428) @[axi4_to_ahb.scala 182:48]
                  node _T_430 = bits(_T_405, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_431 = geq(UInt<3>("h07"), _T_408) @[axi4_to_ahb.scala 182:62]
                  node _T_432 = and(_T_430, _T_431) @[axi4_to_ahb.scala 182:48]
                  node _T_433 = mux(_T_432, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_434 = mux(_T_429, UInt<3>("h06"), _T_433) @[Mux.scala 98:16]
                  node _T_435 = mux(_T_426, UInt<3>("h05"), _T_434) @[Mux.scala 98:16]
                  node _T_436 = mux(_T_423, UInt<3>("h04"), _T_435) @[Mux.scala 98:16]
                  node _T_437 = mux(_T_420, UInt<2>("h03"), _T_436) @[Mux.scala 98:16]
                  node _T_438 = mux(_T_417, UInt<2>("h02"), _T_437) @[Mux.scala 98:16]
                  node _T_439 = mux(_T_414, UInt<1>("h01"), _T_438) @[Mux.scala 98:16]
                  node _T_440 = mux(_T_411, UInt<1>("h00"), _T_439) @[Mux.scala 98:16]
                  node _T_441 = mux(trxn_done, _T_440, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 332:97]
                  node _T_442 = mux(bypass_en, _T_403, _T_441) @[axi4_to_ahb.scala 332:30]
                  buf_cmd_byte_ptr <= _T_442 @[axi4_to_ahb.scala 332:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_443 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_443 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 335:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 336:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 337:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 338:23]
                    skip @[Conditional.scala 39:67]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 342:16]
    node _T_444 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 343:33]
    node _T_445 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 343:73]
    node _T_446 = eq(_T_445, UInt<1>("h01")) @[axi4_to_ahb.scala 343:80]
    node _T_447 = and(buf_aligned_in, _T_446) @[axi4_to_ahb.scala 343:60]
    node _T_448 = bits(_T_447, 0, 0) @[axi4_to_ahb.scala 343:100]
    node _T_449 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 343:132]
    node _T_450 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 173:50]
    node _T_451 = eq(_T_450, UInt<8>("h0ff")) @[axi4_to_ahb.scala 173:57]
    node _T_452 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 173:81]
    node _T_453 = eq(_T_452, UInt<8>("h0f")) @[axi4_to_ahb.scala 173:88]
    node _T_454 = or(_T_451, _T_453) @[axi4_to_ahb.scala 173:70]
    node _T_455 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 173:117]
    node _T_456 = eq(_T_455, UInt<8>("h03")) @[axi4_to_ahb.scala 173:124]
    node _T_457 = or(_T_454, _T_456) @[axi4_to_ahb.scala 173:106]
    node _T_458 = bits(_T_457, 0, 0) @[Bitwise.scala 72:15]
    node _T_459 = mux(_T_458, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_460 = and(UInt<3>("h00"), _T_459) @[axi4_to_ahb.scala 173:29]
    node _T_461 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 174:35]
    node _T_462 = eq(_T_461, UInt<8>("h0c")) @[axi4_to_ahb.scala 174:42]
    node _T_463 = bits(_T_462, 0, 0) @[Bitwise.scala 72:15]
    node _T_464 = mux(_T_463, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_465 = and(UInt<2>("h02"), _T_464) @[axi4_to_ahb.scala 174:15]
    node _T_466 = or(_T_460, _T_465) @[axi4_to_ahb.scala 173:146]
    node _T_467 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 175:36]
    node _T_468 = eq(_T_467, UInt<8>("h0f0")) @[axi4_to_ahb.scala 175:43]
    node _T_469 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 175:67]
    node _T_470 = eq(_T_469, UInt<8>("h03")) @[axi4_to_ahb.scala 175:74]
    node _T_471 = or(_T_468, _T_470) @[axi4_to_ahb.scala 175:56]
    node _T_472 = bits(_T_471, 0, 0) @[Bitwise.scala 72:15]
    node _T_473 = mux(_T_472, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_474 = and(UInt<3>("h04"), _T_473) @[axi4_to_ahb.scala 175:15]
    node _T_475 = or(_T_466, _T_474) @[axi4_to_ahb.scala 174:63]
    node _T_476 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 176:37]
    node _T_477 = eq(_T_476, UInt<8>("h0c0")) @[axi4_to_ahb.scala 176:44]
    node _T_478 = bits(_T_477, 0, 0) @[Bitwise.scala 72:15]
    node _T_479 = mux(_T_478, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_480 = and(UInt<3>("h06"), _T_479) @[axi4_to_ahb.scala 176:17]
    node _T_481 = or(_T_475, _T_480) @[axi4_to_ahb.scala 175:96]
    node _T_482 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 177:37]
    node _T_483 = eq(_T_482, UInt<8>("h0c0")) @[axi4_to_ahb.scala 177:44]
    node _T_484 = bits(_T_483, 0, 0) @[Bitwise.scala 72:15]
    node _T_485 = mux(_T_484, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_486 = and(UInt<3>("h06"), _T_485) @[axi4_to_ahb.scala 177:17]
    node _T_487 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 343:152]
    node _T_488 = mux(_T_448, _T_481, _T_487) @[axi4_to_ahb.scala 343:43]
    node _T_489 = cat(_T_444, _T_488) @[Cat.scala 29:58]
    buf_addr_in <= _T_489 @[axi4_to_ahb.scala 343:15]
    node _T_490 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 344:27]
    buf_tag_in <= _T_490 @[axi4_to_ahb.scala 344:14]
    node _T_491 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 345:32]
    buf_byteen_in <= _T_491 @[axi4_to_ahb.scala 345:17]
    node _T_492 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 346:33]
    node _T_493 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 346:59]
    node _T_494 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 346:80]
    node _T_495 = mux(_T_492, _T_493, _T_494) @[axi4_to_ahb.scala 346:21]
    buf_data_in <= _T_495 @[axi4_to_ahb.scala 346:15]
    node _T_496 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 347:52]
    node _T_497 = eq(_T_496, UInt<2>("h03")) @[axi4_to_ahb.scala 347:58]
    node _T_498 = and(buf_aligned_in, _T_497) @[axi4_to_ahb.scala 347:38]
    node _T_499 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 347:84]
    node _T_500 = eq(_T_499, UInt<1>("h01")) @[axi4_to_ahb.scala 347:91]
    node _T_501 = and(_T_498, _T_500) @[axi4_to_ahb.scala 347:71]
    node _T_502 = bits(_T_501, 0, 0) @[axi4_to_ahb.scala 347:111]
    node _T_503 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 347:142]
    node _T_504 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 166:42]
    node _T_505 = eq(_T_504, UInt<8>("h0ff")) @[axi4_to_ahb.scala 166:49]
    node _T_506 = bits(_T_505, 0, 0) @[Bitwise.scala 72:15]
    node _T_507 = mux(_T_506, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_508 = and(UInt<2>("h03"), _T_507) @[axi4_to_ahb.scala 166:25]
    node _T_509 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 167:35]
    node _T_510 = eq(_T_509, UInt<8>("h0f0")) @[axi4_to_ahb.scala 167:42]
    node _T_511 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 167:64]
    node _T_512 = eq(_T_511, UInt<8>("h0f")) @[axi4_to_ahb.scala 167:71]
    node _T_513 = or(_T_510, _T_512) @[axi4_to_ahb.scala 167:55]
    node _T_514 = bits(_T_513, 0, 0) @[Bitwise.scala 72:15]
    node _T_515 = mux(_T_514, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_516 = and(UInt<2>("h02"), _T_515) @[axi4_to_ahb.scala 167:16]
    node _T_517 = or(_T_508, _T_516) @[axi4_to_ahb.scala 166:64]
    node _T_518 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 168:40]
    node _T_519 = eq(_T_518, UInt<8>("h0c0")) @[axi4_to_ahb.scala 168:47]
    node _T_520 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 168:69]
    node _T_521 = eq(_T_520, UInt<6>("h030")) @[axi4_to_ahb.scala 168:76]
    node _T_522 = or(_T_519, _T_521) @[axi4_to_ahb.scala 168:60]
    node _T_523 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 168:98]
    node _T_524 = eq(_T_523, UInt<8>("h0c")) @[axi4_to_ahb.scala 168:105]
    node _T_525 = or(_T_522, _T_524) @[axi4_to_ahb.scala 168:89]
    node _T_526 = bits(_T_503, 7, 0) @[axi4_to_ahb.scala 168:132]
    node _T_527 = eq(_T_526, UInt<8>("h03")) @[axi4_to_ahb.scala 168:139]
    node _T_528 = or(_T_525, _T_527) @[axi4_to_ahb.scala 168:123]
    node _T_529 = bits(_T_528, 0, 0) @[Bitwise.scala 72:15]
    node _T_530 = mux(_T_529, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_531 = and(UInt<2>("h01"), _T_530) @[axi4_to_ahb.scala 168:21]
    node _T_532 = or(_T_517, _T_531) @[axi4_to_ahb.scala 167:93]
    node _T_533 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 347:161]
    node _T_534 = mux(_T_502, _T_532, _T_533) @[axi4_to_ahb.scala 347:21]
    buf_size_in <= _T_534 @[axi4_to_ahb.scala 347:15]
    node _T_535 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 348:32]
    node _T_536 = eq(_T_535, UInt<1>("h00")) @[axi4_to_ahb.scala 348:39]
    node _T_537 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:17]
    node _T_538 = eq(_T_537, UInt<1>("h00")) @[axi4_to_ahb.scala 349:24]
    node _T_539 = or(_T_536, _T_538) @[axi4_to_ahb.scala 348:48]
    node _T_540 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:47]
    node _T_541 = eq(_T_540, UInt<2>("h01")) @[axi4_to_ahb.scala 349:54]
    node _T_542 = or(_T_539, _T_541) @[axi4_to_ahb.scala 349:33]
    node _T_543 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:86]
    node _T_544 = eq(_T_543, UInt<2>("h02")) @[axi4_to_ahb.scala 349:93]
    node _T_545 = or(_T_542, _T_544) @[axi4_to_ahb.scala 349:72]
    node _T_546 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 350:18]
    node _T_547 = eq(_T_546, UInt<2>("h03")) @[axi4_to_ahb.scala 350:25]
    node _T_548 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:55]
    node _T_549 = eq(_T_548, UInt<2>("h03")) @[axi4_to_ahb.scala 350:62]
    node _T_550 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:90]
    node _T_551 = eq(_T_550, UInt<4>("h0c")) @[axi4_to_ahb.scala 350:97]
    node _T_552 = or(_T_549, _T_551) @[axi4_to_ahb.scala 350:74]
    node _T_553 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:125]
    node _T_554 = eq(_T_553, UInt<6>("h030")) @[axi4_to_ahb.scala 350:132]
    node _T_555 = or(_T_552, _T_554) @[axi4_to_ahb.scala 350:109]
    node _T_556 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:161]
    node _T_557 = eq(_T_556, UInt<8>("h0c0")) @[axi4_to_ahb.scala 350:168]
    node _T_558 = or(_T_555, _T_557) @[axi4_to_ahb.scala 350:145]
    node _T_559 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 351:21]
    node _T_560 = eq(_T_559, UInt<4>("h0f")) @[axi4_to_ahb.scala 351:28]
    node _T_561 = or(_T_558, _T_560) @[axi4_to_ahb.scala 350:181]
    node _T_562 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 351:56]
    node _T_563 = eq(_T_562, UInt<8>("h0f0")) @[axi4_to_ahb.scala 351:63]
    node _T_564 = or(_T_561, _T_563) @[axi4_to_ahb.scala 351:40]
    node _T_565 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 351:92]
    node _T_566 = eq(_T_565, UInt<8>("h0ff")) @[axi4_to_ahb.scala 351:99]
    node _T_567 = or(_T_564, _T_566) @[axi4_to_ahb.scala 351:76]
    node _T_568 = and(_T_547, _T_567) @[axi4_to_ahb.scala 350:38]
    node _T_569 = or(_T_545, _T_568) @[axi4_to_ahb.scala 349:106]
    buf_aligned_in <= _T_569 @[axi4_to_ahb.scala 348:18]
    node _T_570 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 353:39]
    node _T_571 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 353:58]
    node _T_572 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 353:83]
    node _T_573 = cat(_T_571, _T_572) @[Cat.scala 29:58]
    node _T_574 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 353:104]
    node _T_575 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 353:129]
    node _T_576 = cat(_T_574, _T_575) @[Cat.scala 29:58]
    node _T_577 = mux(_T_570, _T_573, _T_576) @[axi4_to_ahb.scala 353:22]
    io.ahb_haddr <= _T_577 @[axi4_to_ahb.scala 353:16]
    node _T_578 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 354:39]
    node _T_579 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_580 = mux(_T_579, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_581 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 354:90]
    node _T_582 = and(_T_580, _T_581) @[axi4_to_ahb.scala 354:77]
    node _T_583 = cat(UInt<1>("h00"), _T_582) @[Cat.scala 29:58]
    node _T_584 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_585 = mux(_T_584, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_586 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 354:144]
    node _T_587 = and(_T_585, _T_586) @[axi4_to_ahb.scala 354:134]
    node _T_588 = cat(UInt<1>("h00"), _T_587) @[Cat.scala 29:58]
    node _T_589 = mux(_T_578, _T_583, _T_588) @[axi4_to_ahb.scala 354:22]
    io.ahb_hsize <= _T_589 @[axi4_to_ahb.scala 354:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 356:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 357:20]
    node _T_590 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 358:47]
    node _T_591 = not(_T_590) @[axi4_to_ahb.scala 358:33]
    node _T_592 = cat(UInt<1>("h01"), _T_591) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_592 @[axi4_to_ahb.scala 358:16]
    node _T_593 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 359:40]
    node _T_594 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 359:55]
    node _T_595 = eq(_T_594, UInt<1>("h01")) @[axi4_to_ahb.scala 359:62]
    node _T_596 = mux(_T_593, _T_595, buf_write) @[axi4_to_ahb.scala 359:23]
    io.ahb_hwrite <= _T_596 @[axi4_to_ahb.scala 359:17]
    node _T_597 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 360:28]
    io.ahb_hwdata <= _T_597 @[axi4_to_ahb.scala 360:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 362:15]
    node _T_598 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 363:43]
    node _T_599 = mux(_T_598, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 363:23]
    node _T_600 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_601 = mux(_T_600, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_602 = and(_T_601, UInt<2>("h02")) @[axi4_to_ahb.scala 363:88]
    node _T_603 = cat(_T_599, _T_602) @[Cat.scala 29:58]
    slave_opc <= _T_603 @[axi4_to_ahb.scala 363:13]
    node _T_604 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 364:41]
    node _T_605 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 364:66]
    node _T_606 = cat(_T_605, _T_605) @[Cat.scala 29:58]
    node _T_607 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 364:91]
    node _T_608 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 364:110]
    node _T_609 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 364:131]
    node _T_610 = mux(_T_607, _T_608, _T_609) @[axi4_to_ahb.scala 364:79]
    node _T_611 = mux(_T_604, _T_606, _T_610) @[axi4_to_ahb.scala 364:21]
    slave_rdata <= _T_611 @[axi4_to_ahb.scala 364:15]
    node _T_612 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 365:26]
    slave_tag <= _T_612 @[axi4_to_ahb.scala 365:13]
    node _T_613 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 367:33]
    node _T_614 = neq(_T_613, UInt<1>("h00")) @[axi4_to_ahb.scala 367:40]
    node _T_615 = and(_T_614, io.ahb_hready) @[axi4_to_ahb.scala 367:52]
    node _T_616 = and(_T_615, io.ahb_hwrite) @[axi4_to_ahb.scala 367:68]
    last_addr_en <= _T_616 @[axi4_to_ahb.scala 367:16]
    node _T_617 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 369:30]
    node _T_618 = and(_T_617, master_ready) @[axi4_to_ahb.scala 369:47]
    wrbuf_en <= _T_618 @[axi4_to_ahb.scala 369:12]
    node _T_619 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 370:34]
    node _T_620 = and(_T_619, master_ready) @[axi4_to_ahb.scala 370:50]
    wrbuf_data_en <= _T_620 @[axi4_to_ahb.scala 370:17]
    node _T_621 = and(master_valid, master_ready) @[axi4_to_ahb.scala 371:34]
    node _T_622 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 371:62]
    node _T_623 = eq(_T_622, UInt<1>("h01")) @[axi4_to_ahb.scala 371:69]
    node _T_624 = and(_T_621, _T_623) @[axi4_to_ahb.scala 371:49]
    wrbuf_cmd_sent <= _T_624 @[axi4_to_ahb.scala 371:18]
    node _T_625 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 372:33]
    node _T_626 = and(wrbuf_cmd_sent, _T_625) @[axi4_to_ahb.scala 372:31]
    wrbuf_rst <= _T_626 @[axi4_to_ahb.scala 372:13]
    node _T_627 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 374:35]
    node _T_628 = and(wrbuf_vld, _T_627) @[axi4_to_ahb.scala 374:33]
    node _T_629 = eq(_T_628, UInt<1>("h00")) @[axi4_to_ahb.scala 374:21]
    node _T_630 = and(_T_629, master_ready) @[axi4_to_ahb.scala 374:52]
    io.axi_awready <= _T_630 @[axi4_to_ahb.scala 374:18]
    node _T_631 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 375:39]
    node _T_632 = and(wrbuf_data_vld, _T_631) @[axi4_to_ahb.scala 375:37]
    node _T_633 = eq(_T_632, UInt<1>("h00")) @[axi4_to_ahb.scala 375:20]
    node _T_634 = and(_T_633, master_ready) @[axi4_to_ahb.scala 375:56]
    io.axi_wready <= _T_634 @[axi4_to_ahb.scala 375:17]
    node _T_635 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 376:33]
    node _T_636 = eq(_T_635, UInt<1>("h00")) @[axi4_to_ahb.scala 376:21]
    node _T_637 = and(_T_636, master_ready) @[axi4_to_ahb.scala 376:51]
    io.axi_arready <= _T_637 @[axi4_to_ahb.scala 376:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 377:16]
    node _T_638 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 380:68]
    node _T_639 = mux(_T_638, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 380:52]
    node _T_640 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 380:88]
    node _T_641 = and(_T_639, _T_640) @[axi4_to_ahb.scala 380:86]
    reg _T_642 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 380:48]
    _T_642 <= _T_641 @[axi4_to_ahb.scala 380:48]
    wrbuf_vld <= _T_642 @[axi4_to_ahb.scala 380:18]
    node _T_643 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 381:73]
    node _T_644 = mux(_T_643, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 381:52]
    node _T_645 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 381:99]
    node _T_646 = and(_T_644, _T_645) @[axi4_to_ahb.scala 381:97]
    reg _T_647 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 381:48]
    _T_647 <= _T_646 @[axi4_to_ahb.scala 381:48]
    wrbuf_data_vld <= _T_647 @[axi4_to_ahb.scala 381:18]
    node _T_648 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 383:57]
    node _T_649 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 383:91]
    reg _T_650 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_649 : @[Reg.scala 28:19]
      _T_650 <= _T_648 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_650 @[axi4_to_ahb.scala 383:13]
    node _T_651 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 384:60]
    node _T_652 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 384:88]
    reg _T_653 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_652 : @[Reg.scala 28:19]
      _T_653 <= _T_651 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_653 @[axi4_to_ahb.scala 384:14]
    node _T_654 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 386:48]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_654 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_655 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_655 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_655 @[axi4_to_ahb.scala 386:14]
    node _T_656 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 387:52]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_656 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_657 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_657 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_657 @[axi4_to_ahb.scala 387:14]
    node _T_658 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 390:27]
    node _T_659 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 390:60]
    reg _T_660 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_659 : @[Reg.scala 28:19]
      _T_660 <= _T_658 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_660 @[axi4_to_ahb.scala 389:16]
    node _T_661 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 393:27]
    node _T_662 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 393:60]
    reg _T_663 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_662 : @[Reg.scala 28:19]
      _T_663 <= _T_661 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_663 @[axi4_to_ahb.scala 392:17]
    node _T_664 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 401:50]
    reg _T_665 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_664 : @[Reg.scala 28:19]
      _T_665 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_665 @[axi4_to_ahb.scala 400:13]
    node _T_666 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 404:25]
    node _T_667 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 404:60]
    reg _T_668 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_667 : @[Reg.scala 28:19]
      _T_668 <= _T_666 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_668 @[axi4_to_ahb.scala 403:11]
    node _T_669 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 407:33]
    node _T_670 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 407:52]
    node _T_671 = bits(_T_670, 0, 0) @[axi4_to_ahb.scala 407:69]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_671 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_672 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_672 <= _T_669 @[el2_lib.scala 514:16]
    buf_addr <= _T_672 @[axi4_to_ahb.scala 407:12]
    node _T_673 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 410:26]
    node _T_674 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 410:55]
    reg _T_675 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_674 : @[Reg.scala 28:19]
      _T_675 <= _T_673 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_675 @[axi4_to_ahb.scala 409:12]
    node _T_676 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 413:52]
    reg _T_677 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_676 : @[Reg.scala 28:19]
      _T_677 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_677 @[axi4_to_ahb.scala 412:15]
    node _T_678 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 416:28]
    node _T_679 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 416:57]
    reg _T_680 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_679 : @[Reg.scala 28:19]
      _T_680 <= _T_678 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_680 @[axi4_to_ahb.scala 415:14]
    node _T_681 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 419:33]
    node _T_682 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 419:57]
    node _T_683 = bits(_T_682, 0, 0) @[axi4_to_ahb.scala 419:80]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_683 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_684 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_684 <= _T_681 @[el2_lib.scala 514:16]
    buf_data <= _T_684 @[axi4_to_ahb.scala 419:12]
    node _T_685 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 422:50]
    reg _T_686 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_685 : @[Reg.scala 28:19]
      _T_686 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_686 @[axi4_to_ahb.scala 421:16]
    node _T_687 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 425:22]
    node _T_688 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 425:60]
    reg _T_689 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_688 : @[Reg.scala 28:19]
      _T_689 <= _T_687 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_689 @[axi4_to_ahb.scala 424:14]
    node _T_690 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 428:59]
    reg _T_691 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_690 : @[Reg.scala 28:19]
      _T_691 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_691 @[axi4_to_ahb.scala 427:16]
    node _T_692 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 432:32]
    node _T_693 = mux(_T_692, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 432:16]
    node _T_694 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 432:52]
    node _T_695 = and(_T_693, _T_694) @[axi4_to_ahb.scala 432:50]
    reg _T_696 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 432:12]
    _T_696 <= _T_695 @[axi4_to_ahb.scala 432:12]
    cmd_doneQ <= _T_696 @[axi4_to_ahb.scala 431:13]
    node _T_697 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 436:31]
    node _T_698 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 436:70]
    reg _T_699 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_698 : @[Reg.scala 28:19]
      _T_699 <= _T_697 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_699 @[axi4_to_ahb.scala 435:21]
    reg _T_700 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 441:12]
    _T_700 <= io.ahb_hready @[axi4_to_ahb.scala 441:12]
    ahb_hready_q <= _T_700 @[axi4_to_ahb.scala 440:16]
    node _T_701 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 444:26]
    reg _T_702 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 444:12]
    _T_702 <= _T_701 @[axi4_to_ahb.scala 444:12]
    ahb_htrans_q <= _T_702 @[axi4_to_ahb.scala 443:16]
    reg _T_703 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 447:12]
    _T_703 <= io.ahb_hwrite @[axi4_to_ahb.scala 447:12]
    ahb_hwrite_q <= _T_703 @[axi4_to_ahb.scala 446:16]
    reg _T_704 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 450:12]
    _T_704 <= io.ahb_hresp @[axi4_to_ahb.scala 450:12]
    ahb_hresp_q <= _T_704 @[axi4_to_ahb.scala 449:15]
    node _T_705 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 453:26]
    reg _T_706 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 453:12]
    _T_706 <= _T_705 @[axi4_to_ahb.scala 453:12]
    ahb_hrdata_q <= _T_706 @[axi4_to_ahb.scala 452:16]
    node _T_707 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 456:43]
    node _T_708 = or(_T_707, io.clk_override) @[axi4_to_ahb.scala 456:58]
    node _T_709 = and(io.bus_clk_en, _T_708) @[axi4_to_ahb.scala 456:30]
    buf_clken <= _T_709 @[axi4_to_ahb.scala 456:13]
    node _T_710 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 457:69]
    node _T_711 = and(io.ahb_hready, _T_710) @[axi4_to_ahb.scala 457:54]
    node _T_712 = or(_T_711, io.clk_override) @[axi4_to_ahb.scala 457:74]
    node _T_713 = and(io.bus_clk_en, _T_712) @[axi4_to_ahb.scala 457:36]
    ahbm_addr_clken <= _T_713 @[axi4_to_ahb.scala 457:19]
    node _T_714 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 458:50]
    node _T_715 = or(_T_714, io.clk_override) @[axi4_to_ahb.scala 458:60]
    node _T_716 = and(io.bus_clk_en, _T_715) @[axi4_to_ahb.scala 458:36]
    ahbm_data_clken <= _T_716 @[axi4_to_ahb.scala 458:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 461:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 462:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 463:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 464:17]
    
