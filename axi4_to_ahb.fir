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
    node _T = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 68:69]
    node _T_1 = mux(_T, buf_nxtstate, buf_state) @[axi4_to_ahb.scala 68:49]
    node _T_2 = eq(buf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 68:98]
    node _T_3 = and(_T_1, _T_2) @[axi4_to_ahb.scala 68:96]
    reg _T_4 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 68:45]
    _T_4 <= _T_3 @[axi4_to_ahb.scala 68:45]
    buf_state <= _T_4 @[axi4_to_ahb.scala 68:13]
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
    node _T_5 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 198:27]
    wr_cmd_vld <= _T_5 @[axi4_to_ahb.scala 198:14]
    node _T_6 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 199:30]
    master_valid <= _T_6 @[axi4_to_ahb.scala 199:16]
    node _T_7 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 200:38]
    node _T_8 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 200:51]
    node _T_9 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 200:76]
    node _T_10 = mux(_T_7, _T_8, _T_9) @[axi4_to_ahb.scala 200:20]
    master_tag <= _T_10 @[axi4_to_ahb.scala 200:14]
    node _T_11 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 201:38]
    node _T_12 = mux(_T_11, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 201:20]
    master_opc <= _T_12 @[axi4_to_ahb.scala 201:14]
    node _T_13 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 202:39]
    node _T_14 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 202:53]
    node _T_15 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 202:75]
    node _T_16 = mux(_T_13, _T_14, _T_15) @[axi4_to_ahb.scala 202:21]
    master_addr <= _T_16 @[axi4_to_ahb.scala 202:15]
    node _T_17 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 203:39]
    node _T_18 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 203:53]
    node _T_19 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 203:74]
    node _T_20 = mux(_T_17, _T_18, _T_19) @[axi4_to_ahb.scala 203:21]
    master_size <= _T_20 @[axi4_to_ahb.scala 203:15]
    node _T_21 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 204:32]
    master_byteen <= _T_21 @[axi4_to_ahb.scala 204:17]
    node _T_22 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 205:29]
    master_wdata <= _T_22 @[axi4_to_ahb.scala 205:16]
    node _T_23 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 208:32]
    node _T_24 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 208:57]
    node _T_25 = and(_T_23, _T_24) @[axi4_to_ahb.scala 208:46]
    io.axi_bvalid <= _T_25 @[axi4_to_ahb.scala 208:17]
    node _T_26 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 209:32]
    node _T_27 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 209:59]
    node _T_28 = mux(_T_27, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 209:49]
    node _T_29 = mux(_T_26, UInt<2>("h02"), _T_28) @[axi4_to_ahb.scala 209:22]
    io.axi_bresp <= _T_29 @[axi4_to_ahb.scala 209:16]
    node _T_30 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 210:26]
    io.axi_bid <= _T_30 @[axi4_to_ahb.scala 210:14]
    node _T_31 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 212:32]
    node _T_32 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 212:58]
    node _T_33 = eq(_T_32, UInt<1>("h00")) @[axi4_to_ahb.scala 212:65]
    node _T_34 = and(_T_31, _T_33) @[axi4_to_ahb.scala 212:46]
    io.axi_rvalid <= _T_34 @[axi4_to_ahb.scala 212:17]
    node _T_35 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 213:32]
    node _T_36 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 213:59]
    node _T_37 = mux(_T_36, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 213:49]
    node _T_38 = mux(_T_35, UInt<2>("h02"), _T_37) @[axi4_to_ahb.scala 213:22]
    io.axi_rresp <= _T_38 @[axi4_to_ahb.scala 213:16]
    node _T_39 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 214:26]
    io.axi_rid <= _T_39 @[axi4_to_ahb.scala 214:14]
    node _T_40 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 215:30]
    io.axi_rdata <= _T_40 @[axi4_to_ahb.scala 215:16]
    node _T_41 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 216:32]
    slave_ready <= _T_41 @[axi4_to_ahb.scala 216:15]
    node _T_42 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 219:56]
    node _T_43 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 219:91]
    node _T_44 = or(_T_42, _T_43) @[axi4_to_ahb.scala 219:74]
    node _T_45 = and(io.bus_clk_en, _T_44) @[axi4_to_ahb.scala 219:37]
    bus_write_clk_en <= _T_45 @[axi4_to_ahb.scala 219:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 221:11]
    node _T_46 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 222:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_46 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 222:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 225:17]
    master_ready <= UInt<1>("h00") @[axi4_to_ahb.scala 226:16]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 227:16]
    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 228:18]
    buf_data_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 230:18]
    slvbuf_error_in <= UInt<1>("h00") @[axi4_to_ahb.scala 231:21]
    slvbuf_error_en <= UInt<1>("h00") @[axi4_to_ahb.scala 232:21]
    buf_write_in <= UInt<1>("h00") @[axi4_to_ahb.scala 233:18]
    cmd_done <= UInt<1>("h00") @[axi4_to_ahb.scala 234:18]
    trxn_done <= UInt<1>("h00") @[axi4_to_ahb.scala 235:18]
    buf_cmd_byte_ptr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 236:23]
    buf_cmd_byte_ptr <= UInt<1>("h00") @[axi4_to_ahb.scala 237:20]
    slave_valid_pre <= UInt<1>("h00") @[axi4_to_ahb.scala 238:21]
    slvbuf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 239:19]
    bypass_en <= UInt<1>("h00") @[axi4_to_ahb.scala 240:20]
    rd_bypass_idle <= UInt<1>("h00") @[axi4_to_ahb.scala 241:18]
    node _T_47 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_47 : @[Conditional.scala 40:58]
      master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 245:20]
      node _T_48 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 246:34]
      node _T_49 = eq(_T_48, UInt<1>("h01")) @[axi4_to_ahb.scala 246:41]
      buf_write_in <= _T_49 @[axi4_to_ahb.scala 246:20]
      node _T_50 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 247:46]
      node _T_51 = mux(_T_50, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 247:26]
      buf_nxtstate <= _T_51 @[axi4_to_ahb.scala 247:20]
      node _T_52 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 248:36]
      buf_state_en <= _T_52 @[axi4_to_ahb.scala 248:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 249:17]
      node _T_53 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 250:54]
      node _T_54 = and(buf_state_en, _T_53) @[axi4_to_ahb.scala 250:38]
      buf_data_wr_en <= _T_54 @[axi4_to_ahb.scala 250:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 251:27]
      node _T_55 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 253:50]
      node _T_56 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 253:89]
      node _T_57 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
      node _T_58 = tail(_T_57, 1) @[axi4_to_ahb.scala 182:52]
      node _T_59 = mux(UInt<1>("h00"), _T_58, UInt<1>("h00")) @[axi4_to_ahb.scala 182:24]
      node _T_60 = bits(_T_56, 0, 0) @[axi4_to_ahb.scala 183:44]
      node _T_61 = geq(UInt<1>("h00"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_62 = and(_T_60, _T_61) @[axi4_to_ahb.scala 183:48]
      node _T_63 = bits(_T_56, 1, 1) @[axi4_to_ahb.scala 183:44]
      node _T_64 = geq(UInt<1>("h01"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_65 = and(_T_63, _T_64) @[axi4_to_ahb.scala 183:48]
      node _T_66 = bits(_T_56, 2, 2) @[axi4_to_ahb.scala 183:44]
      node _T_67 = geq(UInt<2>("h02"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_68 = and(_T_66, _T_67) @[axi4_to_ahb.scala 183:48]
      node _T_69 = bits(_T_56, 3, 3) @[axi4_to_ahb.scala 183:44]
      node _T_70 = geq(UInt<2>("h03"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_71 = and(_T_69, _T_70) @[axi4_to_ahb.scala 183:48]
      node _T_72 = bits(_T_56, 4, 4) @[axi4_to_ahb.scala 183:44]
      node _T_73 = geq(UInt<3>("h04"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_74 = and(_T_72, _T_73) @[axi4_to_ahb.scala 183:48]
      node _T_75 = bits(_T_56, 5, 5) @[axi4_to_ahb.scala 183:44]
      node _T_76 = geq(UInt<3>("h05"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_77 = and(_T_75, _T_76) @[axi4_to_ahb.scala 183:48]
      node _T_78 = bits(_T_56, 6, 6) @[axi4_to_ahb.scala 183:44]
      node _T_79 = geq(UInt<3>("h06"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_80 = and(_T_78, _T_79) @[axi4_to_ahb.scala 183:48]
      node _T_81 = bits(_T_56, 7, 7) @[axi4_to_ahb.scala 183:44]
      node _T_82 = geq(UInt<3>("h07"), _T_59) @[axi4_to_ahb.scala 183:62]
      node _T_83 = and(_T_81, _T_82) @[axi4_to_ahb.scala 183:48]
      node _T_84 = mux(_T_83, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_85 = mux(_T_80, UInt<3>("h06"), _T_84) @[Mux.scala 98:16]
      node _T_86 = mux(_T_77, UInt<3>("h05"), _T_85) @[Mux.scala 98:16]
      node _T_87 = mux(_T_74, UInt<3>("h04"), _T_86) @[Mux.scala 98:16]
      node _T_88 = mux(_T_71, UInt<2>("h03"), _T_87) @[Mux.scala 98:16]
      node _T_89 = mux(_T_68, UInt<2>("h02"), _T_88) @[Mux.scala 98:16]
      node _T_90 = mux(_T_65, UInt<1>("h01"), _T_89) @[Mux.scala 98:16]
      node _T_91 = mux(_T_62, UInt<1>("h00"), _T_90) @[Mux.scala 98:16]
      node _T_92 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 253:138]
      node _T_93 = mux(_T_55, _T_91, _T_92) @[axi4_to_ahb.scala 253:30]
      buf_cmd_byte_ptr <= _T_93 @[axi4_to_ahb.scala 253:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 254:17]
      node _T_94 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 255:51]
      node _T_95 = and(bypass_en, _T_94) @[axi4_to_ahb.scala 255:35]
      rd_bypass_idle <= _T_95 @[axi4_to_ahb.scala 255:22]
      node _T_96 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_97 = mux(_T_96, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_98 = and(_T_97, UInt<2>("h02")) @[axi4_to_ahb.scala 256:45]
      io.ahb_htrans <= _T_98 @[axi4_to_ahb.scala 256:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_99 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_99 : @[Conditional.scala 39:67]
        node _T_100 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 260:54]
        node _T_101 = eq(_T_100, UInt<1>("h00")) @[axi4_to_ahb.scala 260:61]
        node _T_102 = and(master_valid, _T_101) @[axi4_to_ahb.scala 260:41]
        node _T_103 = bits(_T_102, 0, 0) @[axi4_to_ahb.scala 260:82]
        node _T_104 = mux(_T_103, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 260:26]
        buf_nxtstate <= _T_104 @[axi4_to_ahb.scala 260:20]
        node _T_105 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 261:51]
        node _T_106 = neq(_T_105, UInt<1>("h00")) @[axi4_to_ahb.scala 261:58]
        node _T_107 = and(ahb_hready_q, _T_106) @[axi4_to_ahb.scala 261:36]
        node _T_108 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 261:72]
        node _T_109 = and(_T_107, _T_108) @[axi4_to_ahb.scala 261:70]
        buf_state_en <= _T_109 @[axi4_to_ahb.scala 261:20]
        node _T_110 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 262:34]
        node _T_111 = and(buf_state_en, _T_110) @[axi4_to_ahb.scala 262:32]
        cmd_done <= _T_111 @[axi4_to_ahb.scala 262:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 263:20]
        node _T_112 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 264:52]
        node _T_113 = neq(_T_112, UInt<1>("h00")) @[axi4_to_ahb.scala 264:59]
        node _T_114 = and(ahb_hready_q, _T_113) @[axi4_to_ahb.scala 264:37]
        node _T_115 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 264:73]
        node _T_116 = and(_T_114, _T_115) @[axi4_to_ahb.scala 264:71]
        node _T_117 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 264:122]
        node _T_118 = eq(_T_117, UInt<1>("h00")) @[axi4_to_ahb.scala 264:129]
        node _T_119 = and(master_valid, _T_118) @[axi4_to_ahb.scala 264:109]
        node _T_120 = bits(_T_119, 0, 0) @[axi4_to_ahb.scala 264:150]
        node _T_121 = mux(_T_120, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 264:94]
        node _T_122 = eq(_T_121, UInt<3>("h06")) @[axi4_to_ahb.scala 264:174]
        node _T_123 = and(_T_116, _T_122) @[axi4_to_ahb.scala 264:88]
        master_ready <= _T_123 @[axi4_to_ahb.scala 264:20]
        buf_wr_en <= master_ready @[axi4_to_ahb.scala 265:17]
        node _T_124 = and(master_ready, master_valid) @[axi4_to_ahb.scala 266:33]
        bypass_en <= _T_124 @[axi4_to_ahb.scala 266:17]
        node _T_125 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 267:47]
        node _T_126 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 267:62]
        node _T_127 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 267:78]
        node _T_128 = mux(_T_125, _T_126, _T_127) @[axi4_to_ahb.scala 267:30]
        buf_cmd_byte_ptr <= _T_128 @[axi4_to_ahb.scala 267:24]
        node _T_129 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 268:44]
        node _T_130 = or(_T_129, bypass_en) @[axi4_to_ahb.scala 268:58]
        node _T_131 = bits(_T_130, 0, 0) @[Bitwise.scala 72:15]
        node _T_132 = mux(_T_131, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_133 = and(UInt<2>("h02"), _T_132) @[axi4_to_ahb.scala 268:32]
        io.ahb_htrans <= _T_133 @[axi4_to_ahb.scala 268:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_134 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_134 : @[Conditional.scala 39:67]
          node _T_135 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 272:39]
          node _T_136 = and(ahb_hready_q, _T_135) @[axi4_to_ahb.scala 272:37]
          node _T_137 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 272:82]
          node _T_138 = eq(_T_137, UInt<1>("h01")) @[axi4_to_ahb.scala 272:89]
          node _T_139 = and(master_valid, _T_138) @[axi4_to_ahb.scala 272:70]
          node _T_140 = eq(_T_139, UInt<1>("h00")) @[axi4_to_ahb.scala 272:55]
          node _T_141 = and(_T_136, _T_140) @[axi4_to_ahb.scala 272:53]
          master_ready <= _T_141 @[axi4_to_ahb.scala 272:20]
          node _T_142 = and(master_valid, master_ready) @[axi4_to_ahb.scala 273:34]
          node _T_143 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 273:62]
          node _T_144 = eq(_T_143, UInt<1>("h00")) @[axi4_to_ahb.scala 273:69]
          node _T_145 = and(_T_142, _T_144) @[axi4_to_ahb.scala 273:49]
          buf_wr_en <= _T_145 @[axi4_to_ahb.scala 273:17]
          node _T_146 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 274:45]
          node _T_147 = and(master_valid, master_ready) @[axi4_to_ahb.scala 274:82]
          node _T_148 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 274:110]
          node _T_149 = eq(_T_148, UInt<1>("h00")) @[axi4_to_ahb.scala 274:117]
          node _T_150 = and(_T_147, _T_149) @[axi4_to_ahb.scala 274:97]
          node _T_151 = bits(_T_150, 0, 0) @[axi4_to_ahb.scala 274:138]
          node _T_152 = mux(_T_151, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 274:67]
          node _T_153 = mux(_T_146, UInt<3>("h07"), _T_152) @[axi4_to_ahb.scala 274:26]
          buf_nxtstate <= _T_153 @[axi4_to_ahb.scala 274:20]
          node _T_154 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 275:37]
          buf_state_en <= _T_154 @[axi4_to_ahb.scala 275:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 276:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 277:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 278:23]
          node _T_155 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 279:41]
          node _T_156 = and(buf_state_en, _T_155) @[axi4_to_ahb.scala 279:39]
          slave_valid_pre <= _T_156 @[axi4_to_ahb.scala 279:23]
          node _T_157 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 280:34]
          node _T_158 = and(buf_state_en, _T_157) @[axi4_to_ahb.scala 280:32]
          cmd_done <= _T_158 @[axi4_to_ahb.scala 280:16]
          node _T_159 = and(master_ready, master_valid) @[axi4_to_ahb.scala 281:33]
          node _T_160 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 281:64]
          node _T_161 = and(_T_159, _T_160) @[axi4_to_ahb.scala 281:48]
          node _T_162 = and(_T_161, buf_state_en) @[axi4_to_ahb.scala 281:79]
          bypass_en <= _T_162 @[axi4_to_ahb.scala 281:17]
          node _T_163 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 282:47]
          node _T_164 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 282:62]
          node _T_165 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 282:78]
          node _T_166 = mux(_T_163, _T_164, _T_165) @[axi4_to_ahb.scala 282:30]
          buf_cmd_byte_ptr <= _T_166 @[axi4_to_ahb.scala 282:24]
          node _T_167 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 283:59]
          node _T_168 = and(_T_167, buf_state_en) @[axi4_to_ahb.scala 283:74]
          node _T_169 = eq(_T_168, UInt<1>("h00")) @[axi4_to_ahb.scala 283:43]
          node _T_170 = bits(_T_169, 0, 0) @[Bitwise.scala 72:15]
          node _T_171 = mux(_T_170, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_172 = and(UInt<2>("h02"), _T_171) @[axi4_to_ahb.scala 283:32]
          io.ahb_htrans <= _T_172 @[axi4_to_ahb.scala 283:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 284:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_173 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_173 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 288:20]
            node _T_174 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 289:51]
            node _T_175 = neq(_T_174, UInt<1>("h00")) @[axi4_to_ahb.scala 289:58]
            node _T_176 = and(ahb_hready_q, _T_175) @[axi4_to_ahb.scala 289:36]
            node _T_177 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 289:72]
            node _T_178 = and(_T_176, _T_177) @[axi4_to_ahb.scala 289:70]
            buf_state_en <= _T_178 @[axi4_to_ahb.scala 289:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 290:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 291:20]
            node _T_179 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 292:35]
            buf_cmd_byte_ptr <= _T_179 @[axi4_to_ahb.scala 292:24]
            node _T_180 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 293:47]
            node _T_181 = bits(_T_180, 0, 0) @[Bitwise.scala 72:15]
            node _T_182 = mux(_T_181, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_183 = and(UInt<2>("h02"), _T_182) @[axi4_to_ahb.scala 293:37]
            io.ahb_htrans <= _T_183 @[axi4_to_ahb.scala 293:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_184 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_184 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 297:20]
              node _T_185 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 298:37]
              buf_state_en <= _T_185 @[axi4_to_ahb.scala 298:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 299:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 300:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 301:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 302:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_186 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_186 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 306:20]
                node _T_187 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 307:33]
                node _T_188 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 307:63]
                node _T_189 = neq(_T_188, UInt<1>("h00")) @[axi4_to_ahb.scala 307:70]
                node _T_190 = and(_T_187, _T_189) @[axi4_to_ahb.scala 307:48]
                trxn_done <= _T_190 @[axi4_to_ahb.scala 307:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 308:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 309:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 310:20]
                node _T_191 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 311:47]
                node _T_192 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 311:85]
                node _T_193 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 311:103]
                node _T_194 = add(_T_192, UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
                node _T_195 = tail(_T_194, 1) @[axi4_to_ahb.scala 182:52]
                node _T_196 = mux(UInt<1>("h01"), _T_195, _T_192) @[axi4_to_ahb.scala 182:24]
                node _T_197 = bits(_T_193, 0, 0) @[axi4_to_ahb.scala 183:44]
                node _T_198 = geq(UInt<1>("h00"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_199 = and(_T_197, _T_198) @[axi4_to_ahb.scala 183:48]
                node _T_200 = bits(_T_193, 1, 1) @[axi4_to_ahb.scala 183:44]
                node _T_201 = geq(UInt<1>("h01"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_202 = and(_T_200, _T_201) @[axi4_to_ahb.scala 183:48]
                node _T_203 = bits(_T_193, 2, 2) @[axi4_to_ahb.scala 183:44]
                node _T_204 = geq(UInt<2>("h02"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_205 = and(_T_203, _T_204) @[axi4_to_ahb.scala 183:48]
                node _T_206 = bits(_T_193, 3, 3) @[axi4_to_ahb.scala 183:44]
                node _T_207 = geq(UInt<2>("h03"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_208 = and(_T_206, _T_207) @[axi4_to_ahb.scala 183:48]
                node _T_209 = bits(_T_193, 4, 4) @[axi4_to_ahb.scala 183:44]
                node _T_210 = geq(UInt<3>("h04"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_211 = and(_T_209, _T_210) @[axi4_to_ahb.scala 183:48]
                node _T_212 = bits(_T_193, 5, 5) @[axi4_to_ahb.scala 183:44]
                node _T_213 = geq(UInt<3>("h05"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_214 = and(_T_212, _T_213) @[axi4_to_ahb.scala 183:48]
                node _T_215 = bits(_T_193, 6, 6) @[axi4_to_ahb.scala 183:44]
                node _T_216 = geq(UInt<3>("h06"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_217 = and(_T_215, _T_216) @[axi4_to_ahb.scala 183:48]
                node _T_218 = bits(_T_193, 7, 7) @[axi4_to_ahb.scala 183:44]
                node _T_219 = geq(UInt<3>("h07"), _T_196) @[axi4_to_ahb.scala 183:62]
                node _T_220 = and(_T_218, _T_219) @[axi4_to_ahb.scala 183:48]
                node _T_221 = mux(_T_220, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_222 = mux(_T_217, UInt<3>("h06"), _T_221) @[Mux.scala 98:16]
                node _T_223 = mux(_T_214, UInt<3>("h05"), _T_222) @[Mux.scala 98:16]
                node _T_224 = mux(_T_211, UInt<3>("h04"), _T_223) @[Mux.scala 98:16]
                node _T_225 = mux(_T_208, UInt<2>("h03"), _T_224) @[Mux.scala 98:16]
                node _T_226 = mux(_T_205, UInt<2>("h02"), _T_225) @[Mux.scala 98:16]
                node _T_227 = mux(_T_202, UInt<1>("h01"), _T_226) @[Mux.scala 98:16]
                node _T_228 = mux(_T_199, UInt<1>("h00"), _T_227) @[Mux.scala 98:16]
                node _T_229 = mux(_T_191, _T_228, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 311:30]
                buf_cmd_byte_ptr <= _T_229 @[axi4_to_ahb.scala 311:24]
                node _T_230 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 312:65]
                node _T_231 = or(buf_aligned, _T_230) @[axi4_to_ahb.scala 312:44]
                node _T_232 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 312:127]
                node _T_233 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 312:145]
                node _T_234 = add(_T_232, UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
                node _T_235 = tail(_T_234, 1) @[axi4_to_ahb.scala 182:52]
                node _T_236 = mux(UInt<1>("h01"), _T_235, _T_232) @[axi4_to_ahb.scala 182:24]
                node _T_237 = bits(_T_233, 0, 0) @[axi4_to_ahb.scala 183:44]
                node _T_238 = geq(UInt<1>("h00"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_239 = and(_T_237, _T_238) @[axi4_to_ahb.scala 183:48]
                node _T_240 = bits(_T_233, 1, 1) @[axi4_to_ahb.scala 183:44]
                node _T_241 = geq(UInt<1>("h01"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_242 = and(_T_240, _T_241) @[axi4_to_ahb.scala 183:48]
                node _T_243 = bits(_T_233, 2, 2) @[axi4_to_ahb.scala 183:44]
                node _T_244 = geq(UInt<2>("h02"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_245 = and(_T_243, _T_244) @[axi4_to_ahb.scala 183:48]
                node _T_246 = bits(_T_233, 3, 3) @[axi4_to_ahb.scala 183:44]
                node _T_247 = geq(UInt<2>("h03"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_248 = and(_T_246, _T_247) @[axi4_to_ahb.scala 183:48]
                node _T_249 = bits(_T_233, 4, 4) @[axi4_to_ahb.scala 183:44]
                node _T_250 = geq(UInt<3>("h04"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_251 = and(_T_249, _T_250) @[axi4_to_ahb.scala 183:48]
                node _T_252 = bits(_T_233, 5, 5) @[axi4_to_ahb.scala 183:44]
                node _T_253 = geq(UInt<3>("h05"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_254 = and(_T_252, _T_253) @[axi4_to_ahb.scala 183:48]
                node _T_255 = bits(_T_233, 6, 6) @[axi4_to_ahb.scala 183:44]
                node _T_256 = geq(UInt<3>("h06"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_257 = and(_T_255, _T_256) @[axi4_to_ahb.scala 183:48]
                node _T_258 = bits(_T_233, 7, 7) @[axi4_to_ahb.scala 183:44]
                node _T_259 = geq(UInt<3>("h07"), _T_236) @[axi4_to_ahb.scala 183:62]
                node _T_260 = and(_T_258, _T_259) @[axi4_to_ahb.scala 183:48]
                node _T_261 = mux(_T_260, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_262 = mux(_T_257, UInt<3>("h06"), _T_261) @[Mux.scala 98:16]
                node _T_263 = mux(_T_254, UInt<3>("h05"), _T_262) @[Mux.scala 98:16]
                node _T_264 = mux(_T_251, UInt<3>("h04"), _T_263) @[Mux.scala 98:16]
                node _T_265 = mux(_T_248, UInt<2>("h03"), _T_264) @[Mux.scala 98:16]
                node _T_266 = mux(_T_245, UInt<2>("h02"), _T_265) @[Mux.scala 98:16]
                node _T_267 = mux(_T_242, UInt<1>("h01"), _T_266) @[Mux.scala 98:16]
                node _T_268 = mux(_T_239, UInt<1>("h00"), _T_267) @[Mux.scala 98:16]
                node _T_269 = dshr(buf_byteen, _T_268) @[axi4_to_ahb.scala 312:92]
                node _T_270 = bits(_T_269, 0, 0) @[axi4_to_ahb.scala 312:92]
                node _T_271 = eq(_T_270, UInt<1>("h00")) @[axi4_to_ahb.scala 312:163]
                node _T_272 = or(_T_231, _T_271) @[axi4_to_ahb.scala 312:79]
                node _T_273 = and(trxn_done, _T_272) @[axi4_to_ahb.scala 312:29]
                cmd_done <= _T_273 @[axi4_to_ahb.scala 312:16]
                node _T_274 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 313:43]
                node _T_275 = eq(_T_274, UInt<1>("h00")) @[axi4_to_ahb.scala 313:32]
                node _T_276 = bits(_T_275, 0, 0) @[Bitwise.scala 72:15]
                node _T_277 = mux(_T_276, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_278 = and(_T_277, UInt<2>("h02")) @[axi4_to_ahb.scala 313:57]
                io.ahb_htrans <= _T_278 @[axi4_to_ahb.scala 313:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_279 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_279 : @[Conditional.scala 39:67]
                  node _T_280 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 317:34]
                  node _T_281 = or(_T_280, ahb_hresp_q) @[axi4_to_ahb.scala 317:50]
                  buf_state_en <= _T_281 @[axi4_to_ahb.scala 317:20]
                  node _T_282 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 318:35]
                  node _T_283 = or(_T_282, ahb_hresp_q) @[axi4_to_ahb.scala 318:51]
                  node _T_284 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 318:68]
                  node _T_285 = and(_T_283, _T_284) @[axi4_to_ahb.scala 318:66]
                  node _T_286 = and(_T_285, slave_ready) @[axi4_to_ahb.scala 318:81]
                  master_ready <= _T_286 @[axi4_to_ahb.scala 318:20]
                  node _T_287 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 319:42]
                  node _T_288 = or(ahb_hresp_q, _T_287) @[axi4_to_ahb.scala 319:40]
                  node _T_289 = bits(_T_288, 0, 0) @[axi4_to_ahb.scala 319:62]
                  node _T_290 = and(master_valid, master_ready) @[axi4_to_ahb.scala 319:90]
                  node _T_291 = bits(_T_290, 0, 0) @[axi4_to_ahb.scala 319:112]
                  node _T_292 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 319:131]
                  node _T_293 = eq(_T_292, UInt<1>("h01")) @[axi4_to_ahb.scala 319:138]
                  node _T_294 = mux(_T_293, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 319:119]
                  node _T_295 = mux(_T_291, _T_294, UInt<3>("h00")) @[axi4_to_ahb.scala 319:75]
                  node _T_296 = mux(_T_289, UInt<3>("h05"), _T_295) @[axi4_to_ahb.scala 319:26]
                  buf_nxtstate <= _T_296 @[axi4_to_ahb.scala 319:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 320:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 321:23]
                  node _T_297 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 322:34]
                  node _T_298 = eq(_T_297, UInt<1>("h01")) @[axi4_to_ahb.scala 322:41]
                  buf_write_in <= _T_298 @[axi4_to_ahb.scala 322:20]
                  node _T_299 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 323:50]
                  node _T_300 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 323:78]
                  node _T_301 = or(_T_299, _T_300) @[axi4_to_ahb.scala 323:62]
                  node _T_302 = and(buf_state_en, _T_301) @[axi4_to_ahb.scala 323:33]
                  buf_wr_en <= _T_302 @[axi4_to_ahb.scala 323:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 324:22]
                  node _T_303 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 325:63]
                  node _T_304 = neq(_T_303, UInt<1>("h00")) @[axi4_to_ahb.scala 325:70]
                  node _T_305 = and(ahb_hready_q, _T_304) @[axi4_to_ahb.scala 325:48]
                  node _T_306 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 325:104]
                  node _T_307 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 325:166]
                  node _T_308 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 325:184]
                  node _T_309 = add(_T_307, UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
                  node _T_310 = tail(_T_309, 1) @[axi4_to_ahb.scala 182:52]
                  node _T_311 = mux(UInt<1>("h01"), _T_310, _T_307) @[axi4_to_ahb.scala 182:24]
                  node _T_312 = bits(_T_308, 0, 0) @[axi4_to_ahb.scala 183:44]
                  node _T_313 = geq(UInt<1>("h00"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_314 = and(_T_312, _T_313) @[axi4_to_ahb.scala 183:48]
                  node _T_315 = bits(_T_308, 1, 1) @[axi4_to_ahb.scala 183:44]
                  node _T_316 = geq(UInt<1>("h01"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_317 = and(_T_315, _T_316) @[axi4_to_ahb.scala 183:48]
                  node _T_318 = bits(_T_308, 2, 2) @[axi4_to_ahb.scala 183:44]
                  node _T_319 = geq(UInt<2>("h02"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_320 = and(_T_318, _T_319) @[axi4_to_ahb.scala 183:48]
                  node _T_321 = bits(_T_308, 3, 3) @[axi4_to_ahb.scala 183:44]
                  node _T_322 = geq(UInt<2>("h03"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_323 = and(_T_321, _T_322) @[axi4_to_ahb.scala 183:48]
                  node _T_324 = bits(_T_308, 4, 4) @[axi4_to_ahb.scala 183:44]
                  node _T_325 = geq(UInt<3>("h04"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_326 = and(_T_324, _T_325) @[axi4_to_ahb.scala 183:48]
                  node _T_327 = bits(_T_308, 5, 5) @[axi4_to_ahb.scala 183:44]
                  node _T_328 = geq(UInt<3>("h05"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_329 = and(_T_327, _T_328) @[axi4_to_ahb.scala 183:48]
                  node _T_330 = bits(_T_308, 6, 6) @[axi4_to_ahb.scala 183:44]
                  node _T_331 = geq(UInt<3>("h06"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_332 = and(_T_330, _T_331) @[axi4_to_ahb.scala 183:48]
                  node _T_333 = bits(_T_308, 7, 7) @[axi4_to_ahb.scala 183:44]
                  node _T_334 = geq(UInt<3>("h07"), _T_311) @[axi4_to_ahb.scala 183:62]
                  node _T_335 = and(_T_333, _T_334) @[axi4_to_ahb.scala 183:48]
                  node _T_336 = mux(_T_335, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_337 = mux(_T_332, UInt<3>("h06"), _T_336) @[Mux.scala 98:16]
                  node _T_338 = mux(_T_329, UInt<3>("h05"), _T_337) @[Mux.scala 98:16]
                  node _T_339 = mux(_T_326, UInt<3>("h04"), _T_338) @[Mux.scala 98:16]
                  node _T_340 = mux(_T_323, UInt<2>("h03"), _T_339) @[Mux.scala 98:16]
                  node _T_341 = mux(_T_320, UInt<2>("h02"), _T_340) @[Mux.scala 98:16]
                  node _T_342 = mux(_T_317, UInt<1>("h01"), _T_341) @[Mux.scala 98:16]
                  node _T_343 = mux(_T_314, UInt<1>("h00"), _T_342) @[Mux.scala 98:16]
                  node _T_344 = dshr(buf_byteen, _T_343) @[axi4_to_ahb.scala 325:131]
                  node _T_345 = bits(_T_344, 0, 0) @[axi4_to_ahb.scala 325:131]
                  node _T_346 = eq(_T_345, UInt<1>("h00")) @[axi4_to_ahb.scala 325:202]
                  node _T_347 = or(_T_306, _T_346) @[axi4_to_ahb.scala 325:118]
                  node _T_348 = and(_T_305, _T_347) @[axi4_to_ahb.scala 325:82]
                  node _T_349 = or(ahb_hresp_q, _T_348) @[axi4_to_ahb.scala 325:32]
                  cmd_done <= _T_349 @[axi4_to_ahb.scala 325:16]
                  node _T_350 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 326:33]
                  node _T_351 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 326:64]
                  node _T_352 = and(_T_350, _T_351) @[axi4_to_ahb.scala 326:48]
                  bypass_en <= _T_352 @[axi4_to_ahb.scala 326:17]
                  node _T_353 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 327:44]
                  node _T_354 = eq(_T_353, UInt<1>("h00")) @[axi4_to_ahb.scala 327:33]
                  node _T_355 = or(_T_354, bypass_en) @[axi4_to_ahb.scala 327:57]
                  node _T_356 = bits(_T_355, 0, 0) @[Bitwise.scala 72:15]
                  node _T_357 = mux(_T_356, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_358 = and(_T_357, UInt<2>("h02")) @[axi4_to_ahb.scala 327:71]
                  io.ahb_htrans <= _T_358 @[axi4_to_ahb.scala 327:21]
                  node _T_359 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 328:55]
                  node _T_360 = and(buf_state_en, _T_359) @[axi4_to_ahb.scala 328:39]
                  slave_valid_pre <= _T_360 @[axi4_to_ahb.scala 328:23]
                  node _T_361 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 329:33]
                  node _T_362 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 329:63]
                  node _T_363 = neq(_T_362, UInt<1>("h00")) @[axi4_to_ahb.scala 329:70]
                  node _T_364 = and(_T_361, _T_363) @[axi4_to_ahb.scala 329:48]
                  trxn_done <= _T_364 @[axi4_to_ahb.scala 329:17]
                  node _T_365 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 330:40]
                  buf_cmd_byte_ptr_en <= _T_365 @[axi4_to_ahb.scala 330:27]
                  node _T_366 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 333:76]
                  node _T_367 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
                  node _T_368 = tail(_T_367, 1) @[axi4_to_ahb.scala 182:52]
                  node _T_369 = mux(UInt<1>("h00"), _T_368, UInt<1>("h00")) @[axi4_to_ahb.scala 182:24]
                  node _T_370 = bits(_T_366, 0, 0) @[axi4_to_ahb.scala 183:44]
                  node _T_371 = geq(UInt<1>("h00"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_372 = and(_T_370, _T_371) @[axi4_to_ahb.scala 183:48]
                  node _T_373 = bits(_T_366, 1, 1) @[axi4_to_ahb.scala 183:44]
                  node _T_374 = geq(UInt<1>("h01"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_375 = and(_T_373, _T_374) @[axi4_to_ahb.scala 183:48]
                  node _T_376 = bits(_T_366, 2, 2) @[axi4_to_ahb.scala 183:44]
                  node _T_377 = geq(UInt<2>("h02"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_378 = and(_T_376, _T_377) @[axi4_to_ahb.scala 183:48]
                  node _T_379 = bits(_T_366, 3, 3) @[axi4_to_ahb.scala 183:44]
                  node _T_380 = geq(UInt<2>("h03"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_381 = and(_T_379, _T_380) @[axi4_to_ahb.scala 183:48]
                  node _T_382 = bits(_T_366, 4, 4) @[axi4_to_ahb.scala 183:44]
                  node _T_383 = geq(UInt<3>("h04"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_384 = and(_T_382, _T_383) @[axi4_to_ahb.scala 183:48]
                  node _T_385 = bits(_T_366, 5, 5) @[axi4_to_ahb.scala 183:44]
                  node _T_386 = geq(UInt<3>("h05"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_387 = and(_T_385, _T_386) @[axi4_to_ahb.scala 183:48]
                  node _T_388 = bits(_T_366, 6, 6) @[axi4_to_ahb.scala 183:44]
                  node _T_389 = geq(UInt<3>("h06"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_390 = and(_T_388, _T_389) @[axi4_to_ahb.scala 183:48]
                  node _T_391 = bits(_T_366, 7, 7) @[axi4_to_ahb.scala 183:44]
                  node _T_392 = geq(UInt<3>("h07"), _T_369) @[axi4_to_ahb.scala 183:62]
                  node _T_393 = and(_T_391, _T_392) @[axi4_to_ahb.scala 183:48]
                  node _T_394 = mux(_T_393, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_395 = mux(_T_390, UInt<3>("h06"), _T_394) @[Mux.scala 98:16]
                  node _T_396 = mux(_T_387, UInt<3>("h05"), _T_395) @[Mux.scala 98:16]
                  node _T_397 = mux(_T_384, UInt<3>("h04"), _T_396) @[Mux.scala 98:16]
                  node _T_398 = mux(_T_381, UInt<2>("h03"), _T_397) @[Mux.scala 98:16]
                  node _T_399 = mux(_T_378, UInt<2>("h02"), _T_398) @[Mux.scala 98:16]
                  node _T_400 = mux(_T_375, UInt<1>("h01"), _T_399) @[Mux.scala 98:16]
                  node _T_401 = mux(_T_372, UInt<1>("h00"), _T_400) @[Mux.scala 98:16]
                  node _T_402 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 333:142]
                  node _T_403 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 333:160]
                  node _T_404 = add(_T_402, UInt<1>("h01")) @[axi4_to_ahb.scala 182:52]
                  node _T_405 = tail(_T_404, 1) @[axi4_to_ahb.scala 182:52]
                  node _T_406 = mux(UInt<1>("h01"), _T_405, _T_402) @[axi4_to_ahb.scala 182:24]
                  node _T_407 = bits(_T_403, 0, 0) @[axi4_to_ahb.scala 183:44]
                  node _T_408 = geq(UInt<1>("h00"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_409 = and(_T_407, _T_408) @[axi4_to_ahb.scala 183:48]
                  node _T_410 = bits(_T_403, 1, 1) @[axi4_to_ahb.scala 183:44]
                  node _T_411 = geq(UInt<1>("h01"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_412 = and(_T_410, _T_411) @[axi4_to_ahb.scala 183:48]
                  node _T_413 = bits(_T_403, 2, 2) @[axi4_to_ahb.scala 183:44]
                  node _T_414 = geq(UInt<2>("h02"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_415 = and(_T_413, _T_414) @[axi4_to_ahb.scala 183:48]
                  node _T_416 = bits(_T_403, 3, 3) @[axi4_to_ahb.scala 183:44]
                  node _T_417 = geq(UInt<2>("h03"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_418 = and(_T_416, _T_417) @[axi4_to_ahb.scala 183:48]
                  node _T_419 = bits(_T_403, 4, 4) @[axi4_to_ahb.scala 183:44]
                  node _T_420 = geq(UInt<3>("h04"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_421 = and(_T_419, _T_420) @[axi4_to_ahb.scala 183:48]
                  node _T_422 = bits(_T_403, 5, 5) @[axi4_to_ahb.scala 183:44]
                  node _T_423 = geq(UInt<3>("h05"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_424 = and(_T_422, _T_423) @[axi4_to_ahb.scala 183:48]
                  node _T_425 = bits(_T_403, 6, 6) @[axi4_to_ahb.scala 183:44]
                  node _T_426 = geq(UInt<3>("h06"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_427 = and(_T_425, _T_426) @[axi4_to_ahb.scala 183:48]
                  node _T_428 = bits(_T_403, 7, 7) @[axi4_to_ahb.scala 183:44]
                  node _T_429 = geq(UInt<3>("h07"), _T_406) @[axi4_to_ahb.scala 183:62]
                  node _T_430 = and(_T_428, _T_429) @[axi4_to_ahb.scala 183:48]
                  node _T_431 = mux(_T_430, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_432 = mux(_T_427, UInt<3>("h06"), _T_431) @[Mux.scala 98:16]
                  node _T_433 = mux(_T_424, UInt<3>("h05"), _T_432) @[Mux.scala 98:16]
                  node _T_434 = mux(_T_421, UInt<3>("h04"), _T_433) @[Mux.scala 98:16]
                  node _T_435 = mux(_T_418, UInt<2>("h03"), _T_434) @[Mux.scala 98:16]
                  node _T_436 = mux(_T_415, UInt<2>("h02"), _T_435) @[Mux.scala 98:16]
                  node _T_437 = mux(_T_412, UInt<1>("h01"), _T_436) @[Mux.scala 98:16]
                  node _T_438 = mux(_T_409, UInt<1>("h00"), _T_437) @[Mux.scala 98:16]
                  node _T_439 = mux(trxn_done, _T_438, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 333:97]
                  node _T_440 = mux(bypass_en, _T_401, _T_439) @[axi4_to_ahb.scala 333:30]
                  buf_cmd_byte_ptr <= _T_440 @[axi4_to_ahb.scala 333:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_441 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_441 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 336:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 337:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 338:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 339:23]
                    skip @[Conditional.scala 39:67]
    buf_rst <= UInt<1>("h00") @[axi4_to_ahb.scala 343:11]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 344:16]
    node _T_442 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 345:33]
    node _T_443 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 345:73]
    node _T_444 = eq(_T_443, UInt<1>("h01")) @[axi4_to_ahb.scala 345:80]
    node _T_445 = and(buf_aligned_in, _T_444) @[axi4_to_ahb.scala 345:60]
    node _T_446 = bits(_T_445, 0, 0) @[axi4_to_ahb.scala 345:100]
    node _T_447 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 345:132]
    wire _T_448 : UInt<8>
    _T_448 <= UInt<8>("h00")
    node _T_449 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 174:45]
    node _T_450 = eq(_T_449, UInt<8>("h0ff")) @[axi4_to_ahb.scala 174:52]
    node _T_451 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 174:76]
    node _T_452 = eq(_T_451, UInt<4>("h0f")) @[axi4_to_ahb.scala 174:83]
    node _T_453 = or(_T_450, _T_452) @[axi4_to_ahb.scala 174:65]
    node _T_454 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 174:107]
    node _T_455 = eq(_T_454, UInt<2>("h03")) @[axi4_to_ahb.scala 174:114]
    node _T_456 = or(_T_453, _T_455) @[axi4_to_ahb.scala 174:96]
    node _T_457 = bits(_T_456, 0, 0) @[Bitwise.scala 72:15]
    node _T_458 = mux(_T_457, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_459 = and(UInt<1>("h00"), _T_458) @[axi4_to_ahb.scala 174:24]
    node _T_460 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 175:35]
    node _T_461 = eq(_T_460, UInt<4>("h0c")) @[axi4_to_ahb.scala 175:42]
    node _T_462 = bits(_T_461, 0, 0) @[Bitwise.scala 72:15]
    node _T_463 = mux(_T_462, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_464 = and(UInt<2>("h02"), _T_463) @[axi4_to_ahb.scala 175:15]
    node _T_465 = or(_T_459, _T_464) @[axi4_to_ahb.scala 174:131]
    node _T_466 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 176:36]
    node _T_467 = eq(_T_466, UInt<8>("h0f0")) @[axi4_to_ahb.scala 176:43]
    node _T_468 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 176:67]
    node _T_469 = eq(_T_468, UInt<2>("h03")) @[axi4_to_ahb.scala 176:74]
    node _T_470 = or(_T_467, _T_469) @[axi4_to_ahb.scala 176:56]
    node _T_471 = bits(_T_470, 0, 0) @[Bitwise.scala 72:15]
    node _T_472 = mux(_T_471, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_473 = and(UInt<3>("h04"), _T_472) @[axi4_to_ahb.scala 176:15]
    node _T_474 = or(_T_465, _T_473) @[axi4_to_ahb.scala 175:58]
    node _T_475 = bits(_T_448, 7, 0) @[axi4_to_ahb.scala 177:37]
    node _T_476 = eq(_T_475, UInt<8>("h0c0")) @[axi4_to_ahb.scala 177:44]
    node _T_477 = bits(_T_476, 0, 0) @[Bitwise.scala 72:15]
    node _T_478 = mux(_T_477, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_479 = and(UInt<3>("h06"), _T_478) @[axi4_to_ahb.scala 177:17]
    node _T_480 = or(_T_474, _T_479) @[axi4_to_ahb.scala 176:91]
    node _T_481 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 345:152]
    node _T_482 = mux(_T_446, _T_480, _T_481) @[axi4_to_ahb.scala 345:43]
    node _T_483 = cat(_T_442, _T_482) @[Cat.scala 29:58]
    buf_addr_in <= _T_483 @[axi4_to_ahb.scala 345:15]
    node _T_484 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 346:27]
    buf_tag_in <= _T_484 @[axi4_to_ahb.scala 346:14]
    node _T_485 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 347:32]
    buf_byteen_in <= _T_485 @[axi4_to_ahb.scala 347:17]
    node _T_486 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 348:33]
    node _T_487 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 348:59]
    node _T_488 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 348:80]
    node _T_489 = mux(_T_486, _T_487, _T_488) @[axi4_to_ahb.scala 348:21]
    buf_data_in <= _T_489 @[axi4_to_ahb.scala 348:15]
    node _T_490 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:52]
    node _T_491 = eq(_T_490, UInt<2>("h03")) @[axi4_to_ahb.scala 349:59]
    node _T_492 = and(buf_aligned_in, _T_491) @[axi4_to_ahb.scala 349:38]
    node _T_493 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 349:85]
    node _T_494 = eq(_T_493, UInt<1>("h01")) @[axi4_to_ahb.scala 349:92]
    node _T_495 = and(_T_492, _T_494) @[axi4_to_ahb.scala 349:72]
    node _T_496 = bits(_T_495, 0, 0) @[axi4_to_ahb.scala 349:112]
    node _T_497 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 349:144]
    wire _T_498 : UInt<8>
    _T_498 <= UInt<8>("h00")
    node _T_499 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 166:42]
    node _T_500 = eq(_T_499, UInt<8>("h0ff")) @[axi4_to_ahb.scala 166:49]
    node _T_501 = bits(_T_500, 0, 0) @[Bitwise.scala 72:15]
    node _T_502 = mux(_T_501, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_503 = and(UInt<2>("h03"), _T_502) @[axi4_to_ahb.scala 166:25]
    node _T_504 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 167:35]
    node _T_505 = eq(_T_504, UInt<8>("h0f0")) @[axi4_to_ahb.scala 167:42]
    node _T_506 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 167:64]
    node _T_507 = eq(_T_506, UInt<4>("h0f")) @[axi4_to_ahb.scala 167:71]
    node _T_508 = or(_T_505, _T_507) @[axi4_to_ahb.scala 167:55]
    node _T_509 = bits(_T_508, 0, 0) @[Bitwise.scala 72:15]
    node _T_510 = mux(_T_509, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_511 = and(UInt<2>("h02"), _T_510) @[axi4_to_ahb.scala 167:16]
    node _T_512 = or(_T_503, _T_511) @[axi4_to_ahb.scala 166:64]
    node _T_513 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 168:35]
    node _T_514 = eq(_T_513, UInt<8>("h0c0")) @[axi4_to_ahb.scala 168:42]
    node _T_515 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 168:64]
    node _T_516 = eq(_T_515, UInt<6>("h030")) @[axi4_to_ahb.scala 168:71]
    node _T_517 = or(_T_514, _T_516) @[axi4_to_ahb.scala 168:55]
    node _T_518 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 168:93]
    node _T_519 = eq(_T_518, UInt<4>("h0c")) @[axi4_to_ahb.scala 168:100]
    node _T_520 = or(_T_517, _T_519) @[axi4_to_ahb.scala 168:84]
    node _T_521 = bits(_T_498, 7, 0) @[axi4_to_ahb.scala 168:122]
    node _T_522 = eq(_T_521, UInt<2>("h03")) @[axi4_to_ahb.scala 168:129]
    node _T_523 = or(_T_520, _T_522) @[axi4_to_ahb.scala 168:113]
    node _T_524 = bits(_T_523, 0, 0) @[Bitwise.scala 72:15]
    node _T_525 = mux(_T_524, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_526 = and(UInt<1>("h01"), _T_525) @[axi4_to_ahb.scala 168:16]
    node _T_527 = or(_T_512, _T_526) @[axi4_to_ahb.scala 167:88]
    node _T_528 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:164]
    node _T_529 = mux(_T_496, _T_527, _T_528) @[axi4_to_ahb.scala 349:21]
    buf_size_in <= _T_529 @[axi4_to_ahb.scala 349:15]
    node _T_530 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 350:32]
    node _T_531 = eq(_T_530, UInt<1>("h00")) @[axi4_to_ahb.scala 350:39]
    node _T_532 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 351:17]
    node _T_533 = eq(_T_532, UInt<1>("h00")) @[axi4_to_ahb.scala 351:24]
    node _T_534 = or(_T_531, _T_533) @[axi4_to_ahb.scala 350:51]
    node _T_535 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 351:50]
    node _T_536 = eq(_T_535, UInt<1>("h01")) @[axi4_to_ahb.scala 351:57]
    node _T_537 = or(_T_534, _T_536) @[axi4_to_ahb.scala 351:36]
    node _T_538 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 351:84]
    node _T_539 = eq(_T_538, UInt<2>("h02")) @[axi4_to_ahb.scala 351:91]
    node _T_540 = or(_T_537, _T_539) @[axi4_to_ahb.scala 351:70]
    node _T_541 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 352:18]
    node _T_542 = eq(_T_541, UInt<2>("h03")) @[axi4_to_ahb.scala 352:25]
    node _T_543 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 352:55]
    node _T_544 = eq(_T_543, UInt<2>("h03")) @[axi4_to_ahb.scala 352:62]
    node _T_545 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 352:90]
    node _T_546 = eq(_T_545, UInt<4>("h0c")) @[axi4_to_ahb.scala 352:97]
    node _T_547 = or(_T_544, _T_546) @[axi4_to_ahb.scala 352:74]
    node _T_548 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 352:125]
    node _T_549 = eq(_T_548, UInt<6>("h030")) @[axi4_to_ahb.scala 352:132]
    node _T_550 = or(_T_547, _T_549) @[axi4_to_ahb.scala 352:109]
    node _T_551 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 352:161]
    node _T_552 = eq(_T_551, UInt<8>("h0c0")) @[axi4_to_ahb.scala 352:168]
    node _T_553 = or(_T_550, _T_552) @[axi4_to_ahb.scala 352:145]
    node _T_554 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 353:21]
    node _T_555 = eq(_T_554, UInt<4>("h0f")) @[axi4_to_ahb.scala 353:28]
    node _T_556 = or(_T_553, _T_555) @[axi4_to_ahb.scala 352:181]
    node _T_557 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 353:56]
    node _T_558 = eq(_T_557, UInt<8>("h0f0")) @[axi4_to_ahb.scala 353:63]
    node _T_559 = or(_T_556, _T_558) @[axi4_to_ahb.scala 353:40]
    node _T_560 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 353:92]
    node _T_561 = eq(_T_560, UInt<8>("h0ff")) @[axi4_to_ahb.scala 353:99]
    node _T_562 = or(_T_559, _T_561) @[axi4_to_ahb.scala 353:76]
    node _T_563 = and(_T_542, _T_562) @[axi4_to_ahb.scala 352:38]
    node _T_564 = or(_T_540, _T_563) @[axi4_to_ahb.scala 351:104]
    buf_aligned_in <= _T_564 @[axi4_to_ahb.scala 350:18]
    node _T_565 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 355:39]
    node _T_566 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 355:58]
    node _T_567 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 355:83]
    node _T_568 = cat(_T_566, _T_567) @[Cat.scala 29:58]
    node _T_569 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 355:104]
    node _T_570 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 355:129]
    node _T_571 = cat(_T_569, _T_570) @[Cat.scala 29:58]
    node _T_572 = mux(_T_565, _T_568, _T_571) @[axi4_to_ahb.scala 355:22]
    io.ahb_haddr <= _T_572 @[axi4_to_ahb.scala 355:16]
    node _T_573 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 356:39]
    node _T_574 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_575 = mux(_T_574, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_576 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 356:90]
    node _T_577 = and(_T_575, _T_576) @[axi4_to_ahb.scala 356:77]
    node _T_578 = cat(UInt<1>("h00"), _T_577) @[Cat.scala 29:58]
    node _T_579 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_580 = mux(_T_579, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_581 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 356:145]
    node _T_582 = and(_T_580, _T_581) @[axi4_to_ahb.scala 356:135]
    node _T_583 = cat(UInt<1>("h00"), _T_582) @[Cat.scala 29:58]
    node _T_584 = mux(_T_573, _T_578, _T_583) @[axi4_to_ahb.scala 356:22]
    io.ahb_hsize <= _T_584 @[axi4_to_ahb.scala 356:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 358:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 359:20]
    node _T_585 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 360:47]
    node _T_586 = not(_T_585) @[axi4_to_ahb.scala 360:33]
    node _T_587 = cat(UInt<1>("h01"), _T_586) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_587 @[axi4_to_ahb.scala 360:16]
    node _T_588 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 361:40]
    node _T_589 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 361:55]
    node _T_590 = eq(_T_589, UInt<1>("h01")) @[axi4_to_ahb.scala 361:62]
    node _T_591 = mux(_T_588, _T_590, buf_write) @[axi4_to_ahb.scala 361:23]
    io.ahb_hwrite <= _T_591 @[axi4_to_ahb.scala 361:17]
    node _T_592 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 362:28]
    io.ahb_hwdata <= _T_592 @[axi4_to_ahb.scala 362:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 364:15]
    node _T_593 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 365:43]
    node _T_594 = mux(_T_593, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 365:23]
    node _T_595 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_596 = mux(_T_595, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_597 = and(_T_596, UInt<2>("h02")) @[axi4_to_ahb.scala 365:88]
    node _T_598 = cat(_T_594, _T_597) @[Cat.scala 29:58]
    slave_opc <= _T_598 @[axi4_to_ahb.scala 365:13]
    node _T_599 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 366:41]
    node _T_600 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 366:66]
    node _T_601 = cat(_T_600, _T_600) @[Cat.scala 29:58]
    node _T_602 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 366:91]
    node _T_603 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 366:110]
    node _T_604 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 366:131]
    node _T_605 = mux(_T_602, _T_603, _T_604) @[axi4_to_ahb.scala 366:79]
    node _T_606 = mux(_T_599, _T_601, _T_605) @[axi4_to_ahb.scala 366:21]
    slave_rdata <= _T_606 @[axi4_to_ahb.scala 366:15]
    node _T_607 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 367:26]
    slave_tag <= _T_607 @[axi4_to_ahb.scala 367:13]
    node _T_608 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 369:33]
    node _T_609 = neq(_T_608, UInt<1>("h00")) @[axi4_to_ahb.scala 369:40]
    node _T_610 = and(_T_609, io.ahb_hready) @[axi4_to_ahb.scala 369:52]
    node _T_611 = and(_T_610, io.ahb_hwrite) @[axi4_to_ahb.scala 369:68]
    last_addr_en <= _T_611 @[axi4_to_ahb.scala 369:16]
    node _T_612 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 371:30]
    node _T_613 = and(_T_612, master_ready) @[axi4_to_ahb.scala 371:47]
    wrbuf_en <= _T_613 @[axi4_to_ahb.scala 371:12]
    node _T_614 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 372:34]
    node _T_615 = and(_T_614, master_ready) @[axi4_to_ahb.scala 372:50]
    wrbuf_data_en <= _T_615 @[axi4_to_ahb.scala 372:17]
    node _T_616 = and(master_valid, master_ready) @[axi4_to_ahb.scala 373:34]
    node _T_617 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 373:62]
    node _T_618 = eq(_T_617, UInt<1>("h01")) @[axi4_to_ahb.scala 373:69]
    node _T_619 = and(_T_616, _T_618) @[axi4_to_ahb.scala 373:49]
    wrbuf_cmd_sent <= _T_619 @[axi4_to_ahb.scala 373:18]
    node _T_620 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 374:33]
    node _T_621 = and(wrbuf_cmd_sent, _T_620) @[axi4_to_ahb.scala 374:31]
    wrbuf_rst <= _T_621 @[axi4_to_ahb.scala 374:13]
    node _T_622 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 376:35]
    node _T_623 = and(wrbuf_vld, _T_622) @[axi4_to_ahb.scala 376:33]
    node _T_624 = eq(_T_623, UInt<1>("h00")) @[axi4_to_ahb.scala 376:21]
    node _T_625 = and(_T_624, master_ready) @[axi4_to_ahb.scala 376:52]
    io.axi_awready <= _T_625 @[axi4_to_ahb.scala 376:18]
    node _T_626 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 377:39]
    node _T_627 = and(wrbuf_data_vld, _T_626) @[axi4_to_ahb.scala 377:37]
    node _T_628 = eq(_T_627, UInt<1>("h00")) @[axi4_to_ahb.scala 377:20]
    node _T_629 = and(_T_628, master_ready) @[axi4_to_ahb.scala 377:56]
    io.axi_wready <= _T_629 @[axi4_to_ahb.scala 377:17]
    node _T_630 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 378:33]
    node _T_631 = eq(_T_630, UInt<1>("h00")) @[axi4_to_ahb.scala 378:21]
    node _T_632 = and(_T_631, master_ready) @[axi4_to_ahb.scala 378:51]
    io.axi_arready <= _T_632 @[axi4_to_ahb.scala 378:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 379:16]
    node _T_633 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 382:68]
    node _T_634 = mux(_T_633, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 382:52]
    node _T_635 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 382:88]
    node _T_636 = and(_T_634, _T_635) @[axi4_to_ahb.scala 382:86]
    reg _T_637 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 382:48]
    _T_637 <= _T_636 @[axi4_to_ahb.scala 382:48]
    wrbuf_vld <= _T_637 @[axi4_to_ahb.scala 382:18]
    node _T_638 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 383:73]
    node _T_639 = mux(_T_638, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 383:52]
    node _T_640 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 383:99]
    node _T_641 = and(_T_639, _T_640) @[axi4_to_ahb.scala 383:97]
    reg _T_642 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 383:48]
    _T_642 <= _T_641 @[axi4_to_ahb.scala 383:48]
    wrbuf_data_vld <= _T_642 @[axi4_to_ahb.scala 383:18]
    node _T_643 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 385:57]
    node _T_644 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 385:91]
    reg _T_645 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_644 : @[Reg.scala 28:19]
      _T_645 <= _T_643 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_645 @[axi4_to_ahb.scala 385:13]
    node _T_646 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 386:60]
    node _T_647 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 386:88]
    reg _T_648 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_647 : @[Reg.scala 28:19]
      _T_648 <= _T_646 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_648 @[axi4_to_ahb.scala 386:14]
    node _T_649 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 388:48]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_649 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_650 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_650 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_650 @[axi4_to_ahb.scala 388:14]
    node _T_651 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 389:52]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_651 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_652 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_652 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_652 @[axi4_to_ahb.scala 389:14]
    node _T_653 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 392:27]
    node _T_654 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 392:60]
    reg _T_655 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_654 : @[Reg.scala 28:19]
      _T_655 <= _T_653 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_655 @[axi4_to_ahb.scala 391:16]
    node _T_656 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 395:27]
    node _T_657 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 395:60]
    reg _T_658 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_657 : @[Reg.scala 28:19]
      _T_658 <= _T_656 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_658 @[axi4_to_ahb.scala 394:17]
    node _T_659 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 403:50]
    reg _T_660 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_659 : @[Reg.scala 28:19]
      _T_660 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_660 @[axi4_to_ahb.scala 402:13]
    node _T_661 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 406:25]
    node _T_662 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 406:60]
    reg _T_663 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_662 : @[Reg.scala 28:19]
      _T_663 <= _T_661 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_663 @[axi4_to_ahb.scala 405:11]
    node _T_664 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 409:33]
    node _T_665 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 409:52]
    node _T_666 = bits(_T_665, 0, 0) @[axi4_to_ahb.scala 409:69]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_666 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_667 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_667 <= _T_664 @[el2_lib.scala 514:16]
    buf_addr <= _T_667 @[axi4_to_ahb.scala 409:12]
    node _T_668 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 412:26]
    node _T_669 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 412:55]
    reg _T_670 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_669 : @[Reg.scala 28:19]
      _T_670 <= _T_668 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_670 @[axi4_to_ahb.scala 411:12]
    node _T_671 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 415:52]
    reg _T_672 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_671 : @[Reg.scala 28:19]
      _T_672 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_672 @[axi4_to_ahb.scala 414:15]
    node _T_673 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 418:28]
    node _T_674 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 418:57]
    reg _T_675 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_674 : @[Reg.scala 28:19]
      _T_675 <= _T_673 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_675 @[axi4_to_ahb.scala 417:14]
    node _T_676 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 421:33]
    node _T_677 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 421:57]
    node _T_678 = bits(_T_677, 0, 0) @[axi4_to_ahb.scala 421:80]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_678 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_679 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_679 <= _T_676 @[el2_lib.scala 514:16]
    buf_data <= _T_679 @[axi4_to_ahb.scala 421:12]
    node _T_680 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 424:50]
    reg _T_681 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_680 : @[Reg.scala 28:19]
      _T_681 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_681 @[axi4_to_ahb.scala 423:16]
    node _T_682 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 427:22]
    node _T_683 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 427:60]
    reg _T_684 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_683 : @[Reg.scala 28:19]
      _T_684 <= _T_682 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_684 @[axi4_to_ahb.scala 426:14]
    node _T_685 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 430:59]
    reg _T_686 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_685 : @[Reg.scala 28:19]
      _T_686 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_686 @[axi4_to_ahb.scala 429:16]
    node _T_687 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 434:32]
    node _T_688 = mux(_T_687, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 434:16]
    node _T_689 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 434:52]
    node _T_690 = and(_T_688, _T_689) @[axi4_to_ahb.scala 434:50]
    reg _T_691 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 434:12]
    _T_691 <= _T_690 @[axi4_to_ahb.scala 434:12]
    cmd_doneQ <= _T_691 @[axi4_to_ahb.scala 433:13]
    node _T_692 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 438:31]
    node _T_693 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 438:70]
    reg _T_694 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_693 : @[Reg.scala 28:19]
      _T_694 <= _T_692 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_694 @[axi4_to_ahb.scala 437:21]
    reg _T_695 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 443:12]
    _T_695 <= io.ahb_hready @[axi4_to_ahb.scala 443:12]
    ahb_hready_q <= _T_695 @[axi4_to_ahb.scala 442:16]
    node _T_696 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 446:26]
    reg _T_697 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 446:12]
    _T_697 <= _T_696 @[axi4_to_ahb.scala 446:12]
    ahb_htrans_q <= _T_697 @[axi4_to_ahb.scala 445:16]
    reg _T_698 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 449:12]
    _T_698 <= io.ahb_hwrite @[axi4_to_ahb.scala 449:12]
    ahb_hwrite_q <= _T_698 @[axi4_to_ahb.scala 448:16]
    reg _T_699 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 452:12]
    _T_699 <= io.ahb_hresp @[axi4_to_ahb.scala 452:12]
    ahb_hresp_q <= _T_699 @[axi4_to_ahb.scala 451:15]
    node _T_700 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 455:26]
    reg _T_701 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 455:12]
    _T_701 <= _T_700 @[axi4_to_ahb.scala 455:12]
    ahb_hrdata_q <= _T_701 @[axi4_to_ahb.scala 454:16]
    node _T_702 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 458:43]
    node _T_703 = or(_T_702, io.clk_override) @[axi4_to_ahb.scala 458:58]
    node _T_704 = and(io.bus_clk_en, _T_703) @[axi4_to_ahb.scala 458:30]
    buf_clken <= _T_704 @[axi4_to_ahb.scala 458:13]
    node _T_705 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 459:69]
    node _T_706 = and(io.ahb_hready, _T_705) @[axi4_to_ahb.scala 459:54]
    node _T_707 = or(_T_706, io.clk_override) @[axi4_to_ahb.scala 459:74]
    node _T_708 = and(io.bus_clk_en, _T_707) @[axi4_to_ahb.scala 459:36]
    ahbm_addr_clken <= _T_708 @[axi4_to_ahb.scala 459:19]
    node _T_709 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 460:50]
    node _T_710 = or(_T_709, io.clk_override) @[axi4_to_ahb.scala 460:60]
    node _T_711 = and(io.bus_clk_en, _T_710) @[axi4_to_ahb.scala 460:36]
    ahbm_data_clken <= _T_711 @[axi4_to_ahb.scala 460:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 463:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 464:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 465:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 466:17]
    
