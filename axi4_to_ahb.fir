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
    node _T = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 69:36]
    node _T_1 = mux(_T, buf_nxtstate, buf_state) @[axi4_to_ahb.scala 69:16]
    node _T_2 = eq(buf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 69:65]
    node _T_3 = and(_T_1, _T_2) @[axi4_to_ahb.scala 69:63]
    reg _T_4 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 69:12]
    _T_4 <= _T_3 @[axi4_to_ahb.scala 69:12]
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
    wire bus_clk : Clock @[axi4_to_ahb.scala 90:21]
    wire bus_write_clk : Clock @[axi4_to_ahb.scala 91:27]
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
    wire buf_clk : Clock @[axi4_to_ahb.scala 158:21]
    node _T_5 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 200:27]
    wr_cmd_vld <= _T_5 @[axi4_to_ahb.scala 200:14]
    node _T_6 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 201:30]
    master_valid <= _T_6 @[axi4_to_ahb.scala 201:16]
    node _T_7 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 202:38]
    node _T_8 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 202:51]
    node _T_9 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 202:76]
    node _T_10 = mux(_T_7, _T_8, _T_9) @[axi4_to_ahb.scala 202:20]
    master_tag <= _T_10 @[axi4_to_ahb.scala 202:14]
    node _T_11 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 203:38]
    node _T_12 = mux(_T_11, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 203:20]
    master_opc <= _T_12 @[axi4_to_ahb.scala 203:14]
    node _T_13 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 204:39]
    node _T_14 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 204:53]
    node _T_15 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 204:75]
    node _T_16 = mux(_T_13, _T_14, _T_15) @[axi4_to_ahb.scala 204:21]
    master_addr <= _T_16 @[axi4_to_ahb.scala 204:15]
    node _T_17 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 205:39]
    node _T_18 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 205:53]
    node _T_19 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 205:74]
    node _T_20 = mux(_T_17, _T_18, _T_19) @[axi4_to_ahb.scala 205:21]
    master_size <= _T_20 @[axi4_to_ahb.scala 205:15]
    node _T_21 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 206:32]
    master_byteen <= _T_21 @[axi4_to_ahb.scala 206:17]
    node _T_22 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 207:29]
    master_wdata <= _T_22 @[axi4_to_ahb.scala 207:16]
    node _T_23 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 210:32]
    node _T_24 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 210:57]
    node _T_25 = and(_T_23, _T_24) @[axi4_to_ahb.scala 210:46]
    io.axi_bvalid <= _T_25 @[axi4_to_ahb.scala 210:17]
    node _T_26 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 211:32]
    node _T_27 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 211:59]
    node _T_28 = mux(_T_27, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 211:49]
    node _T_29 = mux(_T_26, UInt<2>("h02"), _T_28) @[axi4_to_ahb.scala 211:22]
    io.axi_bresp <= _T_29 @[axi4_to_ahb.scala 211:16]
    node _T_30 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 212:26]
    io.axi_bid <= _T_30 @[axi4_to_ahb.scala 212:14]
    node _T_31 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 214:32]
    node _T_32 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 214:58]
    node _T_33 = eq(_T_32, UInt<1>("h00")) @[axi4_to_ahb.scala 214:65]
    node _T_34 = and(_T_31, _T_33) @[axi4_to_ahb.scala 214:46]
    io.axi_rvalid <= _T_34 @[axi4_to_ahb.scala 214:17]
    node _T_35 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 215:32]
    node _T_36 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 215:59]
    node _T_37 = mux(_T_36, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 215:49]
    node _T_38 = mux(_T_35, UInt<2>("h02"), _T_37) @[axi4_to_ahb.scala 215:22]
    io.axi_rresp <= _T_38 @[axi4_to_ahb.scala 215:16]
    node _T_39 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 216:26]
    io.axi_rid <= _T_39 @[axi4_to_ahb.scala 216:14]
    node _T_40 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 217:30]
    io.axi_rdata <= _T_40 @[axi4_to_ahb.scala 217:16]
    node _T_41 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 218:32]
    slave_ready <= _T_41 @[axi4_to_ahb.scala 218:15]
    node _T_42 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 221:56]
    node _T_43 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 221:91]
    node _T_44 = or(_T_42, _T_43) @[axi4_to_ahb.scala 221:74]
    node _T_45 = and(io.bus_clk_en, _T_44) @[axi4_to_ahb.scala 221:37]
    bus_write_clk_en <= _T_45 @[axi4_to_ahb.scala 221:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 223:11]
    node _T_46 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 224:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_46 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 224:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 227:17]
    master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 228:16]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 229:16]
    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 230:18]
    buf_data_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 232:18]
    slvbuf_error_in <= UInt<1>("h00") @[axi4_to_ahb.scala 233:21]
    slvbuf_error_en <= UInt<1>("h00") @[axi4_to_ahb.scala 234:21]
    buf_write_in <= UInt<1>("h00") @[axi4_to_ahb.scala 235:18]
    cmd_done <= UInt<1>("h00") @[axi4_to_ahb.scala 236:18]
    trxn_done <= UInt<1>("h00") @[axi4_to_ahb.scala 237:18]
    buf_cmd_byte_ptr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 238:23]
    buf_cmd_byte_ptr <= UInt<1>("h00") @[axi4_to_ahb.scala 239:20]
    slave_valid_pre <= UInt<1>("h00") @[axi4_to_ahb.scala 240:21]
    slvbuf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 241:19]
    bypass_en <= UInt<1>("h00") @[axi4_to_ahb.scala 242:20]
    rd_bypass_idle <= UInt<1>("h00") @[axi4_to_ahb.scala 243:18]
    node _T_47 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_47 : @[Conditional.scala 40:58]
      node _T_48 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 248:34]
      node _T_49 = eq(_T_48, UInt<1>("h01")) @[axi4_to_ahb.scala 248:41]
      buf_write_in <= _T_49 @[axi4_to_ahb.scala 248:20]
      node _T_50 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 249:46]
      node _T_51 = mux(_T_50, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 249:26]
      buf_nxtstate <= _T_51 @[axi4_to_ahb.scala 249:20]
      node _T_52 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 250:36]
      buf_state_en <= _T_52 @[axi4_to_ahb.scala 250:20]
      node _T_53 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 252:54]
      node _T_54 = and(buf_state_en, _T_53) @[axi4_to_ahb.scala 252:38]
      buf_data_wr_en <= _T_54 @[axi4_to_ahb.scala 252:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 253:27]
      node _T_55 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 255:50]
      node _T_56 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 255:92]
      node _T_57 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
      node _T_58 = tail(_T_57, 1) @[axi4_to_ahb.scala 184:52]
      node _T_59 = mux(UInt<1>("h00"), _T_58, UInt<1>("h00")) @[axi4_to_ahb.scala 184:24]
      node _T_60 = bits(_T_56, 0, 0) @[axi4_to_ahb.scala 185:44]
      node _T_61 = geq(UInt<1>("h00"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_62 = and(_T_60, _T_61) @[axi4_to_ahb.scala 185:48]
      node _T_63 = bits(_T_56, 1, 1) @[axi4_to_ahb.scala 185:44]
      node _T_64 = geq(UInt<1>("h01"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_65 = and(_T_63, _T_64) @[axi4_to_ahb.scala 185:48]
      node _T_66 = bits(_T_56, 2, 2) @[axi4_to_ahb.scala 185:44]
      node _T_67 = geq(UInt<2>("h02"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_68 = and(_T_66, _T_67) @[axi4_to_ahb.scala 185:48]
      node _T_69 = bits(_T_56, 3, 3) @[axi4_to_ahb.scala 185:44]
      node _T_70 = geq(UInt<2>("h03"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_71 = and(_T_69, _T_70) @[axi4_to_ahb.scala 185:48]
      node _T_72 = bits(_T_56, 4, 4) @[axi4_to_ahb.scala 185:44]
      node _T_73 = geq(UInt<3>("h04"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_74 = and(_T_72, _T_73) @[axi4_to_ahb.scala 185:48]
      node _T_75 = bits(_T_56, 5, 5) @[axi4_to_ahb.scala 185:44]
      node _T_76 = geq(UInt<3>("h05"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_77 = and(_T_75, _T_76) @[axi4_to_ahb.scala 185:48]
      node _T_78 = bits(_T_56, 6, 6) @[axi4_to_ahb.scala 185:44]
      node _T_79 = geq(UInt<3>("h06"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_80 = and(_T_78, _T_79) @[axi4_to_ahb.scala 185:48]
      node _T_81 = bits(_T_56, 7, 7) @[axi4_to_ahb.scala 185:44]
      node _T_82 = geq(UInt<3>("h07"), _T_59) @[axi4_to_ahb.scala 185:62]
      node _T_83 = and(_T_81, _T_82) @[axi4_to_ahb.scala 185:48]
      node _T_84 = mux(_T_83, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_85 = mux(_T_80, UInt<3>("h06"), _T_84) @[Mux.scala 98:16]
      node _T_86 = mux(_T_77, UInt<3>("h05"), _T_85) @[Mux.scala 98:16]
      node _T_87 = mux(_T_74, UInt<3>("h04"), _T_86) @[Mux.scala 98:16]
      node _T_88 = mux(_T_71, UInt<2>("h03"), _T_87) @[Mux.scala 98:16]
      node _T_89 = mux(_T_68, UInt<2>("h02"), _T_88) @[Mux.scala 98:16]
      node _T_90 = mux(_T_65, UInt<1>("h01"), _T_89) @[Mux.scala 98:16]
      node _T_91 = mux(_T_62, UInt<1>("h00"), _T_90) @[Mux.scala 98:16]
      node _T_92 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 255:141]
      node _T_93 = mux(_T_55, _T_91, _T_92) @[axi4_to_ahb.scala 255:30]
      buf_cmd_byte_ptr <= _T_93 @[axi4_to_ahb.scala 255:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 256:17]
      node _T_94 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 257:51]
      node _T_95 = and(bypass_en, _T_94) @[axi4_to_ahb.scala 257:35]
      rd_bypass_idle <= _T_95 @[axi4_to_ahb.scala 257:22]
      node _T_96 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_97 = mux(_T_96, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_98 = and(_T_97, UInt<2>("h02")) @[axi4_to_ahb.scala 258:45]
      io.ahb_htrans <= _T_98 @[axi4_to_ahb.scala 258:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_99 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_99 : @[Conditional.scala 39:67]
        node _T_100 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 262:54]
        node _T_101 = eq(_T_100, UInt<1>("h00")) @[axi4_to_ahb.scala 262:61]
        node _T_102 = and(master_valid, _T_101) @[axi4_to_ahb.scala 262:41]
        node _T_103 = bits(_T_102, 0, 0) @[axi4_to_ahb.scala 262:82]
        node _T_104 = mux(_T_103, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 262:26]
        buf_nxtstate <= _T_104 @[axi4_to_ahb.scala 262:20]
        node _T_105 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 263:51]
        node _T_106 = neq(_T_105, UInt<1>("h00")) @[axi4_to_ahb.scala 263:58]
        node _T_107 = and(ahb_hready_q, _T_106) @[axi4_to_ahb.scala 263:36]
        node _T_108 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 263:72]
        node _T_109 = and(_T_107, _T_108) @[axi4_to_ahb.scala 263:70]
        buf_state_en <= _T_109 @[axi4_to_ahb.scala 263:20]
        node _T_110 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 264:34]
        node _T_111 = and(buf_state_en, _T_110) @[axi4_to_ahb.scala 264:32]
        cmd_done <= _T_111 @[axi4_to_ahb.scala 264:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 265:20]
        node _T_112 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 266:52]
        node _T_113 = neq(_T_112, UInt<1>("h00")) @[axi4_to_ahb.scala 266:59]
        node _T_114 = and(ahb_hready_q, _T_113) @[axi4_to_ahb.scala 266:37]
        node _T_115 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 266:73]
        node _T_116 = and(_T_114, _T_115) @[axi4_to_ahb.scala 266:71]
        node _T_117 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 266:122]
        node _T_118 = eq(_T_117, UInt<1>("h00")) @[axi4_to_ahb.scala 266:129]
        node _T_119 = and(master_valid, _T_118) @[axi4_to_ahb.scala 266:109]
        node _T_120 = bits(_T_119, 0, 0) @[axi4_to_ahb.scala 266:150]
        node _T_121 = mux(_T_120, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 266:94]
        node _T_122 = eq(_T_121, UInt<3>("h06")) @[axi4_to_ahb.scala 266:174]
        node _T_123 = and(_T_116, _T_122) @[axi4_to_ahb.scala 266:88]
        master_ready <= _T_123 @[axi4_to_ahb.scala 266:20]
        node _T_124 = and(master_ready, master_valid) @[axi4_to_ahb.scala 268:33]
        bypass_en <= _T_124 @[axi4_to_ahb.scala 268:17]
        node _T_125 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 269:47]
        node _T_126 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 269:62]
        node _T_127 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 269:78]
        node _T_128 = mux(_T_125, _T_126, _T_127) @[axi4_to_ahb.scala 269:30]
        buf_cmd_byte_ptr <= _T_128 @[axi4_to_ahb.scala 269:24]
        node _T_129 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 270:44]
        node _T_130 = or(_T_129, bypass_en) @[axi4_to_ahb.scala 270:58]
        node _T_131 = bits(_T_130, 0, 0) @[Bitwise.scala 72:15]
        node _T_132 = mux(_T_131, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_133 = and(UInt<2>("h02"), _T_132) @[axi4_to_ahb.scala 270:32]
        io.ahb_htrans <= _T_133 @[axi4_to_ahb.scala 270:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_134 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_134 : @[Conditional.scala 39:67]
          node _T_135 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 274:39]
          node _T_136 = and(ahb_hready_q, _T_135) @[axi4_to_ahb.scala 274:37]
          node _T_137 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 274:82]
          node _T_138 = eq(_T_137, UInt<1>("h01")) @[axi4_to_ahb.scala 274:89]
          node _T_139 = and(master_valid, _T_138) @[axi4_to_ahb.scala 274:70]
          node _T_140 = eq(_T_139, UInt<1>("h00")) @[axi4_to_ahb.scala 274:55]
          node _T_141 = and(_T_136, _T_140) @[axi4_to_ahb.scala 274:53]
          master_ready <= _T_141 @[axi4_to_ahb.scala 274:20]
          node _T_142 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 276:45]
          node _T_143 = and(master_valid, master_ready) @[axi4_to_ahb.scala 276:82]
          node _T_144 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 276:110]
          node _T_145 = eq(_T_144, UInt<1>("h00")) @[axi4_to_ahb.scala 276:117]
          node _T_146 = and(_T_143, _T_145) @[axi4_to_ahb.scala 276:97]
          node _T_147 = bits(_T_146, 0, 0) @[axi4_to_ahb.scala 276:138]
          node _T_148 = mux(_T_147, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 276:67]
          node _T_149 = mux(_T_142, UInt<3>("h07"), _T_148) @[axi4_to_ahb.scala 276:26]
          buf_nxtstate <= _T_149 @[axi4_to_ahb.scala 276:20]
          node _T_150 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 277:37]
          buf_state_en <= _T_150 @[axi4_to_ahb.scala 277:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 278:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 279:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 280:23]
          node _T_151 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 281:41]
          node _T_152 = and(buf_state_en, _T_151) @[axi4_to_ahb.scala 281:39]
          slave_valid_pre <= _T_152 @[axi4_to_ahb.scala 281:23]
          node _T_153 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 282:34]
          node _T_154 = and(buf_state_en, _T_153) @[axi4_to_ahb.scala 282:32]
          cmd_done <= _T_154 @[axi4_to_ahb.scala 282:16]
          node _T_155 = and(master_ready, master_valid) @[axi4_to_ahb.scala 283:33]
          node _T_156 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 283:64]
          node _T_157 = and(_T_155, _T_156) @[axi4_to_ahb.scala 283:48]
          node _T_158 = and(_T_157, buf_state_en) @[axi4_to_ahb.scala 283:79]
          bypass_en <= _T_158 @[axi4_to_ahb.scala 283:17]
          node _T_159 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 284:47]
          node _T_160 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 284:62]
          node _T_161 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 284:78]
          node _T_162 = mux(_T_159, _T_160, _T_161) @[axi4_to_ahb.scala 284:30]
          buf_cmd_byte_ptr <= _T_162 @[axi4_to_ahb.scala 284:24]
          node _T_163 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 285:59]
          node _T_164 = and(_T_163, buf_state_en) @[axi4_to_ahb.scala 285:74]
          node _T_165 = eq(_T_164, UInt<1>("h00")) @[axi4_to_ahb.scala 285:43]
          node _T_166 = bits(_T_165, 0, 0) @[Bitwise.scala 72:15]
          node _T_167 = mux(_T_166, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_168 = and(UInt<2>("h02"), _T_167) @[axi4_to_ahb.scala 285:32]
          io.ahb_htrans <= _T_168 @[axi4_to_ahb.scala 285:21]
          node _T_169 = and(master_valid, master_ready) @[axi4_to_ahb.scala 286:37]
          node _T_170 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 286:65]
          node _T_171 = eq(_T_170, UInt<1>("h00")) @[axi4_to_ahb.scala 286:72]
          node _T_172 = and(_T_169, _T_171) @[axi4_to_ahb.scala 286:52]
          slvbuf_wr_en <= _T_172 @[axi4_to_ahb.scala 286:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_173 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_173 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 290:20]
            node _T_174 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 291:51]
            node _T_175 = neq(_T_174, UInt<1>("h00")) @[axi4_to_ahb.scala 291:58]
            node _T_176 = and(ahb_hready_q, _T_175) @[axi4_to_ahb.scala 291:36]
            node _T_177 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 291:72]
            node _T_178 = and(_T_176, _T_177) @[axi4_to_ahb.scala 291:70]
            buf_state_en <= _T_178 @[axi4_to_ahb.scala 291:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 292:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 293:20]
            node _T_179 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 294:35]
            buf_cmd_byte_ptr <= _T_179 @[axi4_to_ahb.scala 294:24]
            node _T_180 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 295:47]
            node _T_181 = bits(_T_180, 0, 0) @[Bitwise.scala 72:15]
            node _T_182 = mux(_T_181, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_183 = and(UInt<2>("h02"), _T_182) @[axi4_to_ahb.scala 295:37]
            io.ahb_htrans <= _T_183 @[axi4_to_ahb.scala 295:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_184 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_184 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 299:20]
              node _T_185 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 300:37]
              buf_state_en <= _T_185 @[axi4_to_ahb.scala 300:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 301:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 302:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 303:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 304:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_186 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_186 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 308:20]
                node _T_187 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 309:33]
                node _T_188 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 309:63]
                node _T_189 = neq(_T_188, UInt<1>("h00")) @[axi4_to_ahb.scala 309:70]
                node _T_190 = and(_T_187, _T_189) @[axi4_to_ahb.scala 309:48]
                trxn_done <= _T_190 @[axi4_to_ahb.scala 309:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 310:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 311:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 312:20]
                node _T_191 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 313:47]
                node _T_192 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 313:85]
                node _T_193 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 313:103]
                node _T_194 = add(_T_192, UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
                node _T_195 = tail(_T_194, 1) @[axi4_to_ahb.scala 184:52]
                node _T_196 = mux(UInt<1>("h01"), _T_195, _T_192) @[axi4_to_ahb.scala 184:24]
                node _T_197 = bits(_T_193, 0, 0) @[axi4_to_ahb.scala 185:44]
                node _T_198 = geq(UInt<1>("h00"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_199 = and(_T_197, _T_198) @[axi4_to_ahb.scala 185:48]
                node _T_200 = bits(_T_193, 1, 1) @[axi4_to_ahb.scala 185:44]
                node _T_201 = geq(UInt<1>("h01"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_202 = and(_T_200, _T_201) @[axi4_to_ahb.scala 185:48]
                node _T_203 = bits(_T_193, 2, 2) @[axi4_to_ahb.scala 185:44]
                node _T_204 = geq(UInt<2>("h02"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_205 = and(_T_203, _T_204) @[axi4_to_ahb.scala 185:48]
                node _T_206 = bits(_T_193, 3, 3) @[axi4_to_ahb.scala 185:44]
                node _T_207 = geq(UInt<2>("h03"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_208 = and(_T_206, _T_207) @[axi4_to_ahb.scala 185:48]
                node _T_209 = bits(_T_193, 4, 4) @[axi4_to_ahb.scala 185:44]
                node _T_210 = geq(UInt<3>("h04"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_211 = and(_T_209, _T_210) @[axi4_to_ahb.scala 185:48]
                node _T_212 = bits(_T_193, 5, 5) @[axi4_to_ahb.scala 185:44]
                node _T_213 = geq(UInt<3>("h05"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_214 = and(_T_212, _T_213) @[axi4_to_ahb.scala 185:48]
                node _T_215 = bits(_T_193, 6, 6) @[axi4_to_ahb.scala 185:44]
                node _T_216 = geq(UInt<3>("h06"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_217 = and(_T_215, _T_216) @[axi4_to_ahb.scala 185:48]
                node _T_218 = bits(_T_193, 7, 7) @[axi4_to_ahb.scala 185:44]
                node _T_219 = geq(UInt<3>("h07"), _T_196) @[axi4_to_ahb.scala 185:62]
                node _T_220 = and(_T_218, _T_219) @[axi4_to_ahb.scala 185:48]
                node _T_221 = mux(_T_220, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_222 = mux(_T_217, UInt<3>("h06"), _T_221) @[Mux.scala 98:16]
                node _T_223 = mux(_T_214, UInt<3>("h05"), _T_222) @[Mux.scala 98:16]
                node _T_224 = mux(_T_211, UInt<3>("h04"), _T_223) @[Mux.scala 98:16]
                node _T_225 = mux(_T_208, UInt<2>("h03"), _T_224) @[Mux.scala 98:16]
                node _T_226 = mux(_T_205, UInt<2>("h02"), _T_225) @[Mux.scala 98:16]
                node _T_227 = mux(_T_202, UInt<1>("h01"), _T_226) @[Mux.scala 98:16]
                node _T_228 = mux(_T_199, UInt<1>("h00"), _T_227) @[Mux.scala 98:16]
                node _T_229 = mux(_T_191, _T_228, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 313:30]
                buf_cmd_byte_ptr <= _T_229 @[axi4_to_ahb.scala 313:24]
                node _T_230 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 314:65]
                node _T_231 = or(buf_aligned, _T_230) @[axi4_to_ahb.scala 314:44]
                node _T_232 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 314:127]
                node _T_233 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 314:145]
                node _T_234 = add(_T_232, UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
                node _T_235 = tail(_T_234, 1) @[axi4_to_ahb.scala 184:52]
                node _T_236 = mux(UInt<1>("h01"), _T_235, _T_232) @[axi4_to_ahb.scala 184:24]
                node _T_237 = bits(_T_233, 0, 0) @[axi4_to_ahb.scala 185:44]
                node _T_238 = geq(UInt<1>("h00"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_239 = and(_T_237, _T_238) @[axi4_to_ahb.scala 185:48]
                node _T_240 = bits(_T_233, 1, 1) @[axi4_to_ahb.scala 185:44]
                node _T_241 = geq(UInt<1>("h01"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_242 = and(_T_240, _T_241) @[axi4_to_ahb.scala 185:48]
                node _T_243 = bits(_T_233, 2, 2) @[axi4_to_ahb.scala 185:44]
                node _T_244 = geq(UInt<2>("h02"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_245 = and(_T_243, _T_244) @[axi4_to_ahb.scala 185:48]
                node _T_246 = bits(_T_233, 3, 3) @[axi4_to_ahb.scala 185:44]
                node _T_247 = geq(UInt<2>("h03"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_248 = and(_T_246, _T_247) @[axi4_to_ahb.scala 185:48]
                node _T_249 = bits(_T_233, 4, 4) @[axi4_to_ahb.scala 185:44]
                node _T_250 = geq(UInt<3>("h04"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_251 = and(_T_249, _T_250) @[axi4_to_ahb.scala 185:48]
                node _T_252 = bits(_T_233, 5, 5) @[axi4_to_ahb.scala 185:44]
                node _T_253 = geq(UInt<3>("h05"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_254 = and(_T_252, _T_253) @[axi4_to_ahb.scala 185:48]
                node _T_255 = bits(_T_233, 6, 6) @[axi4_to_ahb.scala 185:44]
                node _T_256 = geq(UInt<3>("h06"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_257 = and(_T_255, _T_256) @[axi4_to_ahb.scala 185:48]
                node _T_258 = bits(_T_233, 7, 7) @[axi4_to_ahb.scala 185:44]
                node _T_259 = geq(UInt<3>("h07"), _T_236) @[axi4_to_ahb.scala 185:62]
                node _T_260 = and(_T_258, _T_259) @[axi4_to_ahb.scala 185:48]
                node _T_261 = mux(_T_260, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_262 = mux(_T_257, UInt<3>("h06"), _T_261) @[Mux.scala 98:16]
                node _T_263 = mux(_T_254, UInt<3>("h05"), _T_262) @[Mux.scala 98:16]
                node _T_264 = mux(_T_251, UInt<3>("h04"), _T_263) @[Mux.scala 98:16]
                node _T_265 = mux(_T_248, UInt<2>("h03"), _T_264) @[Mux.scala 98:16]
                node _T_266 = mux(_T_245, UInt<2>("h02"), _T_265) @[Mux.scala 98:16]
                node _T_267 = mux(_T_242, UInt<1>("h01"), _T_266) @[Mux.scala 98:16]
                node _T_268 = mux(_T_239, UInt<1>("h00"), _T_267) @[Mux.scala 98:16]
                node _T_269 = dshr(buf_byteen, _T_268) @[axi4_to_ahb.scala 314:92]
                node _T_270 = bits(_T_269, 0, 0) @[axi4_to_ahb.scala 314:92]
                node _T_271 = eq(_T_270, UInt<1>("h00")) @[axi4_to_ahb.scala 314:163]
                node _T_272 = or(_T_231, _T_271) @[axi4_to_ahb.scala 314:79]
                node _T_273 = and(trxn_done, _T_272) @[axi4_to_ahb.scala 314:29]
                cmd_done <= _T_273 @[axi4_to_ahb.scala 314:16]
                node _T_274 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 315:43]
                node _T_275 = eq(_T_274, UInt<1>("h00")) @[axi4_to_ahb.scala 315:32]
                node _T_276 = bits(_T_275, 0, 0) @[Bitwise.scala 72:15]
                node _T_277 = mux(_T_276, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_278 = and(_T_277, UInt<2>("h02")) @[axi4_to_ahb.scala 315:57]
                io.ahb_htrans <= _T_278 @[axi4_to_ahb.scala 315:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_279 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_279 : @[Conditional.scala 39:67]
                  node _T_280 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 319:34]
                  node _T_281 = or(_T_280, ahb_hresp_q) @[axi4_to_ahb.scala 319:50]
                  buf_state_en <= _T_281 @[axi4_to_ahb.scala 319:20]
                  node _T_282 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 320:35]
                  node _T_283 = or(_T_282, ahb_hresp_q) @[axi4_to_ahb.scala 320:51]
                  node _T_284 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 320:68]
                  node _T_285 = and(_T_283, _T_284) @[axi4_to_ahb.scala 320:66]
                  node _T_286 = and(_T_285, slave_ready) @[axi4_to_ahb.scala 320:81]
                  master_ready <= _T_286 @[axi4_to_ahb.scala 320:20]
                  node _T_287 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 321:42]
                  node _T_288 = or(ahb_hresp_q, _T_287) @[axi4_to_ahb.scala 321:40]
                  node _T_289 = bits(_T_288, 0, 0) @[axi4_to_ahb.scala 321:62]
                  node _T_290 = and(master_valid, master_ready) @[axi4_to_ahb.scala 321:90]
                  node _T_291 = bits(_T_290, 0, 0) @[axi4_to_ahb.scala 321:112]
                  node _T_292 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 321:131]
                  node _T_293 = eq(_T_292, UInt<1>("h01")) @[axi4_to_ahb.scala 321:138]
                  node _T_294 = mux(_T_293, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 321:119]
                  node _T_295 = mux(_T_291, _T_294, UInt<3>("h00")) @[axi4_to_ahb.scala 321:75]
                  node _T_296 = mux(_T_289, UInt<3>("h05"), _T_295) @[axi4_to_ahb.scala 321:26]
                  buf_nxtstate <= _T_296 @[axi4_to_ahb.scala 321:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 322:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 323:23]
                  node _T_297 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 324:34]
                  node _T_298 = eq(_T_297, UInt<1>("h01")) @[axi4_to_ahb.scala 324:41]
                  buf_write_in <= _T_298 @[axi4_to_ahb.scala 324:20]
                  node _T_299 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 325:50]
                  node _T_300 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 325:78]
                  node _T_301 = or(_T_299, _T_300) @[axi4_to_ahb.scala 325:62]
                  node _T_302 = and(buf_state_en, _T_301) @[axi4_to_ahb.scala 325:33]
                  buf_wr_en <= _T_302 @[axi4_to_ahb.scala 325:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 326:22]
                  node _T_303 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 327:63]
                  node _T_304 = neq(_T_303, UInt<1>("h00")) @[axi4_to_ahb.scala 327:70]
                  node _T_305 = and(ahb_hready_q, _T_304) @[axi4_to_ahb.scala 327:48]
                  node _T_306 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 327:104]
                  node _T_307 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 327:166]
                  node _T_308 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 327:184]
                  node _T_309 = add(_T_307, UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
                  node _T_310 = tail(_T_309, 1) @[axi4_to_ahb.scala 184:52]
                  node _T_311 = mux(UInt<1>("h01"), _T_310, _T_307) @[axi4_to_ahb.scala 184:24]
                  node _T_312 = bits(_T_308, 0, 0) @[axi4_to_ahb.scala 185:44]
                  node _T_313 = geq(UInt<1>("h00"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_314 = and(_T_312, _T_313) @[axi4_to_ahb.scala 185:48]
                  node _T_315 = bits(_T_308, 1, 1) @[axi4_to_ahb.scala 185:44]
                  node _T_316 = geq(UInt<1>("h01"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_317 = and(_T_315, _T_316) @[axi4_to_ahb.scala 185:48]
                  node _T_318 = bits(_T_308, 2, 2) @[axi4_to_ahb.scala 185:44]
                  node _T_319 = geq(UInt<2>("h02"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_320 = and(_T_318, _T_319) @[axi4_to_ahb.scala 185:48]
                  node _T_321 = bits(_T_308, 3, 3) @[axi4_to_ahb.scala 185:44]
                  node _T_322 = geq(UInt<2>("h03"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_323 = and(_T_321, _T_322) @[axi4_to_ahb.scala 185:48]
                  node _T_324 = bits(_T_308, 4, 4) @[axi4_to_ahb.scala 185:44]
                  node _T_325 = geq(UInt<3>("h04"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_326 = and(_T_324, _T_325) @[axi4_to_ahb.scala 185:48]
                  node _T_327 = bits(_T_308, 5, 5) @[axi4_to_ahb.scala 185:44]
                  node _T_328 = geq(UInt<3>("h05"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_329 = and(_T_327, _T_328) @[axi4_to_ahb.scala 185:48]
                  node _T_330 = bits(_T_308, 6, 6) @[axi4_to_ahb.scala 185:44]
                  node _T_331 = geq(UInt<3>("h06"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_332 = and(_T_330, _T_331) @[axi4_to_ahb.scala 185:48]
                  node _T_333 = bits(_T_308, 7, 7) @[axi4_to_ahb.scala 185:44]
                  node _T_334 = geq(UInt<3>("h07"), _T_311) @[axi4_to_ahb.scala 185:62]
                  node _T_335 = and(_T_333, _T_334) @[axi4_to_ahb.scala 185:48]
                  node _T_336 = mux(_T_335, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_337 = mux(_T_332, UInt<3>("h06"), _T_336) @[Mux.scala 98:16]
                  node _T_338 = mux(_T_329, UInt<3>("h05"), _T_337) @[Mux.scala 98:16]
                  node _T_339 = mux(_T_326, UInt<3>("h04"), _T_338) @[Mux.scala 98:16]
                  node _T_340 = mux(_T_323, UInt<2>("h03"), _T_339) @[Mux.scala 98:16]
                  node _T_341 = mux(_T_320, UInt<2>("h02"), _T_340) @[Mux.scala 98:16]
                  node _T_342 = mux(_T_317, UInt<1>("h01"), _T_341) @[Mux.scala 98:16]
                  node _T_343 = mux(_T_314, UInt<1>("h00"), _T_342) @[Mux.scala 98:16]
                  node _T_344 = dshr(buf_byteen, _T_343) @[axi4_to_ahb.scala 327:131]
                  node _T_345 = bits(_T_344, 0, 0) @[axi4_to_ahb.scala 327:131]
                  node _T_346 = eq(_T_345, UInt<1>("h00")) @[axi4_to_ahb.scala 327:202]
                  node _T_347 = or(_T_306, _T_346) @[axi4_to_ahb.scala 327:118]
                  node _T_348 = and(_T_305, _T_347) @[axi4_to_ahb.scala 327:82]
                  node _T_349 = or(ahb_hresp_q, _T_348) @[axi4_to_ahb.scala 327:32]
                  cmd_done <= _T_349 @[axi4_to_ahb.scala 327:16]
                  node _T_350 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 328:33]
                  node _T_351 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 328:64]
                  node _T_352 = and(_T_350, _T_351) @[axi4_to_ahb.scala 328:48]
                  bypass_en <= _T_352 @[axi4_to_ahb.scala 328:17]
                  node _T_353 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 329:44]
                  node _T_354 = eq(_T_353, UInt<1>("h00")) @[axi4_to_ahb.scala 329:33]
                  node _T_355 = or(_T_354, bypass_en) @[axi4_to_ahb.scala 329:57]
                  node _T_356 = bits(_T_355, 0, 0) @[Bitwise.scala 72:15]
                  node _T_357 = mux(_T_356, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_358 = and(_T_357, UInt<2>("h02")) @[axi4_to_ahb.scala 329:71]
                  io.ahb_htrans <= _T_358 @[axi4_to_ahb.scala 329:21]
                  node _T_359 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 330:55]
                  node _T_360 = and(buf_state_en, _T_359) @[axi4_to_ahb.scala 330:39]
                  slave_valid_pre <= _T_360 @[axi4_to_ahb.scala 330:23]
                  node _T_361 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 331:33]
                  node _T_362 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 331:63]
                  node _T_363 = neq(_T_362, UInt<1>("h00")) @[axi4_to_ahb.scala 331:70]
                  node _T_364 = and(_T_361, _T_363) @[axi4_to_ahb.scala 331:48]
                  trxn_done <= _T_364 @[axi4_to_ahb.scala 331:17]
                  node _T_365 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 332:40]
                  buf_cmd_byte_ptr_en <= _T_365 @[axi4_to_ahb.scala 332:27]
                  node _T_366 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
                  node _T_367 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 335:85]
                  node _T_368 = add(_T_366, UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
                  node _T_369 = tail(_T_368, 1) @[axi4_to_ahb.scala 184:52]
                  node _T_370 = mux(UInt<1>("h00"), _T_369, _T_366) @[axi4_to_ahb.scala 184:24]
                  node _T_371 = bits(_T_367, 0, 0) @[axi4_to_ahb.scala 185:44]
                  node _T_372 = geq(UInt<1>("h00"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_373 = and(_T_371, _T_372) @[axi4_to_ahb.scala 185:48]
                  node _T_374 = bits(_T_367, 1, 1) @[axi4_to_ahb.scala 185:44]
                  node _T_375 = geq(UInt<1>("h01"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_376 = and(_T_374, _T_375) @[axi4_to_ahb.scala 185:48]
                  node _T_377 = bits(_T_367, 2, 2) @[axi4_to_ahb.scala 185:44]
                  node _T_378 = geq(UInt<2>("h02"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_379 = and(_T_377, _T_378) @[axi4_to_ahb.scala 185:48]
                  node _T_380 = bits(_T_367, 3, 3) @[axi4_to_ahb.scala 185:44]
                  node _T_381 = geq(UInt<2>("h03"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_382 = and(_T_380, _T_381) @[axi4_to_ahb.scala 185:48]
                  node _T_383 = bits(_T_367, 4, 4) @[axi4_to_ahb.scala 185:44]
                  node _T_384 = geq(UInt<3>("h04"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_385 = and(_T_383, _T_384) @[axi4_to_ahb.scala 185:48]
                  node _T_386 = bits(_T_367, 5, 5) @[axi4_to_ahb.scala 185:44]
                  node _T_387 = geq(UInt<3>("h05"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_388 = and(_T_386, _T_387) @[axi4_to_ahb.scala 185:48]
                  node _T_389 = bits(_T_367, 6, 6) @[axi4_to_ahb.scala 185:44]
                  node _T_390 = geq(UInt<3>("h06"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_391 = and(_T_389, _T_390) @[axi4_to_ahb.scala 185:48]
                  node _T_392 = bits(_T_367, 7, 7) @[axi4_to_ahb.scala 185:44]
                  node _T_393 = geq(UInt<3>("h07"), _T_370) @[axi4_to_ahb.scala 185:62]
                  node _T_394 = and(_T_392, _T_393) @[axi4_to_ahb.scala 185:48]
                  node _T_395 = mux(_T_394, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_396 = mux(_T_391, UInt<3>("h06"), _T_395) @[Mux.scala 98:16]
                  node _T_397 = mux(_T_388, UInt<3>("h05"), _T_396) @[Mux.scala 98:16]
                  node _T_398 = mux(_T_385, UInt<3>("h04"), _T_397) @[Mux.scala 98:16]
                  node _T_399 = mux(_T_382, UInt<2>("h03"), _T_398) @[Mux.scala 98:16]
                  node _T_400 = mux(_T_379, UInt<2>("h02"), _T_399) @[Mux.scala 98:16]
                  node _T_401 = mux(_T_376, UInt<1>("h01"), _T_400) @[Mux.scala 98:16]
                  node _T_402 = mux(_T_373, UInt<1>("h00"), _T_401) @[Mux.scala 98:16]
                  node _T_403 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 335:151]
                  node _T_404 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 335:169]
                  node _T_405 = add(_T_403, UInt<1>("h01")) @[axi4_to_ahb.scala 184:52]
                  node _T_406 = tail(_T_405, 1) @[axi4_to_ahb.scala 184:52]
                  node _T_407 = mux(UInt<1>("h01"), _T_406, _T_403) @[axi4_to_ahb.scala 184:24]
                  node _T_408 = bits(_T_404, 0, 0) @[axi4_to_ahb.scala 185:44]
                  node _T_409 = geq(UInt<1>("h00"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_410 = and(_T_408, _T_409) @[axi4_to_ahb.scala 185:48]
                  node _T_411 = bits(_T_404, 1, 1) @[axi4_to_ahb.scala 185:44]
                  node _T_412 = geq(UInt<1>("h01"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_413 = and(_T_411, _T_412) @[axi4_to_ahb.scala 185:48]
                  node _T_414 = bits(_T_404, 2, 2) @[axi4_to_ahb.scala 185:44]
                  node _T_415 = geq(UInt<2>("h02"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_416 = and(_T_414, _T_415) @[axi4_to_ahb.scala 185:48]
                  node _T_417 = bits(_T_404, 3, 3) @[axi4_to_ahb.scala 185:44]
                  node _T_418 = geq(UInt<2>("h03"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_419 = and(_T_417, _T_418) @[axi4_to_ahb.scala 185:48]
                  node _T_420 = bits(_T_404, 4, 4) @[axi4_to_ahb.scala 185:44]
                  node _T_421 = geq(UInt<3>("h04"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_422 = and(_T_420, _T_421) @[axi4_to_ahb.scala 185:48]
                  node _T_423 = bits(_T_404, 5, 5) @[axi4_to_ahb.scala 185:44]
                  node _T_424 = geq(UInt<3>("h05"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_425 = and(_T_423, _T_424) @[axi4_to_ahb.scala 185:48]
                  node _T_426 = bits(_T_404, 6, 6) @[axi4_to_ahb.scala 185:44]
                  node _T_427 = geq(UInt<3>("h06"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_428 = and(_T_426, _T_427) @[axi4_to_ahb.scala 185:48]
                  node _T_429 = bits(_T_404, 7, 7) @[axi4_to_ahb.scala 185:44]
                  node _T_430 = geq(UInt<3>("h07"), _T_407) @[axi4_to_ahb.scala 185:62]
                  node _T_431 = and(_T_429, _T_430) @[axi4_to_ahb.scala 185:48]
                  node _T_432 = mux(_T_431, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_433 = mux(_T_428, UInt<3>("h06"), _T_432) @[Mux.scala 98:16]
                  node _T_434 = mux(_T_425, UInt<3>("h05"), _T_433) @[Mux.scala 98:16]
                  node _T_435 = mux(_T_422, UInt<3>("h04"), _T_434) @[Mux.scala 98:16]
                  node _T_436 = mux(_T_419, UInt<2>("h03"), _T_435) @[Mux.scala 98:16]
                  node _T_437 = mux(_T_416, UInt<2>("h02"), _T_436) @[Mux.scala 98:16]
                  node _T_438 = mux(_T_413, UInt<1>("h01"), _T_437) @[Mux.scala 98:16]
                  node _T_439 = mux(_T_410, UInt<1>("h00"), _T_438) @[Mux.scala 98:16]
                  node _T_440 = mux(trxn_done, _T_439, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 335:106]
                  node _T_441 = mux(bypass_en, _T_402, _T_440) @[axi4_to_ahb.scala 335:30]
                  buf_cmd_byte_ptr <= _T_441 @[axi4_to_ahb.scala 335:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_442 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_442 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 338:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 339:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 340:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 341:23]
                    skip @[Conditional.scala 39:67]
    buf_rst <= UInt<1>("h00") @[axi4_to_ahb.scala 345:11]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 346:16]
    node _T_443 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 347:33]
    node _T_444 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 347:73]
    node _T_445 = eq(_T_444, UInt<1>("h01")) @[axi4_to_ahb.scala 347:80]
    node _T_446 = and(buf_aligned_in, _T_445) @[axi4_to_ahb.scala 347:60]
    node _T_447 = bits(_T_446, 0, 0) @[axi4_to_ahb.scala 347:100]
    node _T_448 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 347:132]
    wire _T_449 : UInt<8>
    _T_449 <= UInt<8>("h00")
    node _T_450 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 176:44]
    node _T_451 = eq(_T_450, UInt<8>("h0ff")) @[axi4_to_ahb.scala 176:51]
    node _T_452 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 176:75]
    node _T_453 = eq(_T_452, UInt<4>("h0f")) @[axi4_to_ahb.scala 176:82]
    node _T_454 = or(_T_451, _T_453) @[axi4_to_ahb.scala 176:64]
    node _T_455 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 176:106]
    node _T_456 = eq(_T_455, UInt<2>("h03")) @[axi4_to_ahb.scala 176:113]
    node _T_457 = or(_T_454, _T_456) @[axi4_to_ahb.scala 176:95]
    node _T_458 = bits(_T_457, 0, 0) @[Bitwise.scala 72:15]
    node _T_459 = mux(_T_458, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_460 = and(UInt<1>("h00"), _T_459) @[axi4_to_ahb.scala 176:24]
    node _T_461 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 177:35]
    node _T_462 = eq(_T_461, UInt<4>("h0c")) @[axi4_to_ahb.scala 177:42]
    node _T_463 = bits(_T_462, 0, 0) @[Bitwise.scala 72:15]
    node _T_464 = mux(_T_463, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_465 = and(UInt<2>("h02"), _T_464) @[axi4_to_ahb.scala 177:15]
    node _T_466 = or(_T_460, _T_465) @[axi4_to_ahb.scala 176:128]
    node _T_467 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 178:36]
    node _T_468 = eq(_T_467, UInt<8>("h0f0")) @[axi4_to_ahb.scala 178:43]
    node _T_469 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 178:67]
    node _T_470 = eq(_T_469, UInt<2>("h03")) @[axi4_to_ahb.scala 178:74]
    node _T_471 = or(_T_468, _T_470) @[axi4_to_ahb.scala 178:56]
    node _T_472 = bits(_T_471, 0, 0) @[Bitwise.scala 72:15]
    node _T_473 = mux(_T_472, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_474 = and(UInt<3>("h04"), _T_473) @[axi4_to_ahb.scala 178:15]
    node _T_475 = bits(_T_449, 7, 0) @[axi4_to_ahb.scala 179:37]
    node _T_476 = eq(_T_475, UInt<8>("h0c0")) @[axi4_to_ahb.scala 179:44]
    node _T_477 = bits(_T_476, 0, 0) @[Bitwise.scala 72:15]
    node _T_478 = mux(_T_477, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_479 = and(UInt<3>("h06"), _T_478) @[axi4_to_ahb.scala 179:17]
    node _T_480 = or(_T_474, _T_479) @[axi4_to_ahb.scala 178:90]
    node _T_481 = or(_T_466, _T_480) @[axi4_to_ahb.scala 177:58]
    node _T_482 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 347:152]
    node _T_483 = mux(_T_447, _T_481, _T_482) @[axi4_to_ahb.scala 347:43]
    node _T_484 = cat(_T_443, _T_483) @[Cat.scala 29:58]
    buf_addr_in <= _T_484 @[axi4_to_ahb.scala 347:15]
    node _T_485 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 348:27]
    buf_tag_in <= _T_485 @[axi4_to_ahb.scala 348:14]
    node _T_486 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 349:32]
    buf_byteen_in <= _T_486 @[axi4_to_ahb.scala 349:17]
    node _T_487 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 350:33]
    node _T_488 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 350:59]
    node _T_489 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 350:80]
    node _T_490 = mux(_T_487, _T_488, _T_489) @[axi4_to_ahb.scala 350:21]
    buf_data_in <= _T_490 @[axi4_to_ahb.scala 350:15]
    node _T_491 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 351:52]
    node _T_492 = eq(_T_491, UInt<2>("h03")) @[axi4_to_ahb.scala 351:59]
    node _T_493 = and(buf_aligned_in, _T_492) @[axi4_to_ahb.scala 351:38]
    node _T_494 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 351:85]
    node _T_495 = eq(_T_494, UInt<1>("h01")) @[axi4_to_ahb.scala 351:92]
    node _T_496 = and(_T_493, _T_495) @[axi4_to_ahb.scala 351:72]
    node _T_497 = bits(_T_496, 0, 0) @[axi4_to_ahb.scala 351:112]
    node _T_498 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 351:144]
    wire _T_499 : UInt<8>
    _T_499 <= UInt<8>("h00")
    node _T_500 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 168:43]
    node _T_501 = eq(_T_500, UInt<8>("h0ff")) @[axi4_to_ahb.scala 168:50]
    node _T_502 = bits(_T_501, 0, 0) @[Bitwise.scala 72:15]
    node _T_503 = mux(_T_502, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_504 = and(UInt<2>("h03"), _T_503) @[axi4_to_ahb.scala 168:25]
    node _T_505 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 169:34]
    node _T_506 = eq(_T_505, UInt<8>("h0f0")) @[axi4_to_ahb.scala 169:41]
    node _T_507 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 169:63]
    node _T_508 = eq(_T_507, UInt<4>("h0f")) @[axi4_to_ahb.scala 169:70]
    node _T_509 = or(_T_506, _T_508) @[axi4_to_ahb.scala 169:54]
    node _T_510 = bits(_T_509, 0, 0) @[Bitwise.scala 72:15]
    node _T_511 = mux(_T_510, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_512 = and(UInt<2>("h02"), _T_511) @[axi4_to_ahb.scala 169:16]
    node _T_513 = or(_T_504, _T_512) @[axi4_to_ahb.scala 168:65]
    node _T_514 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 170:34]
    node _T_515 = eq(_T_514, UInt<8>("h0c0")) @[axi4_to_ahb.scala 170:41]
    node _T_516 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 170:63]
    node _T_517 = eq(_T_516, UInt<6>("h030")) @[axi4_to_ahb.scala 170:70]
    node _T_518 = or(_T_515, _T_517) @[axi4_to_ahb.scala 170:54]
    node _T_519 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 170:92]
    node _T_520 = eq(_T_519, UInt<4>("h0c")) @[axi4_to_ahb.scala 170:99]
    node _T_521 = or(_T_518, _T_520) @[axi4_to_ahb.scala 170:83]
    node _T_522 = bits(_T_499, 7, 0) @[axi4_to_ahb.scala 170:121]
    node _T_523 = eq(_T_522, UInt<2>("h03")) @[axi4_to_ahb.scala 170:128]
    node _T_524 = or(_T_521, _T_523) @[axi4_to_ahb.scala 170:112]
    node _T_525 = bits(_T_524, 0, 0) @[Bitwise.scala 72:15]
    node _T_526 = mux(_T_525, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_527 = and(UInt<1>("h01"), _T_526) @[axi4_to_ahb.scala 170:16]
    node _T_528 = or(_T_513, _T_527) @[axi4_to_ahb.scala 169:86]
    node _T_529 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 351:164]
    node _T_530 = mux(_T_497, _T_528, _T_529) @[axi4_to_ahb.scala 351:21]
    buf_size_in <= _T_530 @[axi4_to_ahb.scala 351:15]
    node _T_531 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 352:32]
    node _T_532 = eq(_T_531, UInt<1>("h00")) @[axi4_to_ahb.scala 352:39]
    node _T_533 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 353:17]
    node _T_534 = eq(_T_533, UInt<1>("h00")) @[axi4_to_ahb.scala 353:24]
    node _T_535 = or(_T_532, _T_534) @[axi4_to_ahb.scala 352:51]
    node _T_536 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 353:50]
    node _T_537 = eq(_T_536, UInt<1>("h01")) @[axi4_to_ahb.scala 353:57]
    node _T_538 = or(_T_535, _T_537) @[axi4_to_ahb.scala 353:36]
    node _T_539 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 353:84]
    node _T_540 = eq(_T_539, UInt<2>("h02")) @[axi4_to_ahb.scala 353:91]
    node _T_541 = or(_T_538, _T_540) @[axi4_to_ahb.scala 353:70]
    node _T_542 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 354:18]
    node _T_543 = eq(_T_542, UInt<2>("h03")) @[axi4_to_ahb.scala 354:25]
    node _T_544 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 354:55]
    node _T_545 = eq(_T_544, UInt<2>("h03")) @[axi4_to_ahb.scala 354:62]
    node _T_546 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 354:90]
    node _T_547 = eq(_T_546, UInt<4>("h0c")) @[axi4_to_ahb.scala 354:97]
    node _T_548 = or(_T_545, _T_547) @[axi4_to_ahb.scala 354:74]
    node _T_549 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 354:125]
    node _T_550 = eq(_T_549, UInt<6>("h030")) @[axi4_to_ahb.scala 354:132]
    node _T_551 = or(_T_548, _T_550) @[axi4_to_ahb.scala 354:109]
    node _T_552 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 354:161]
    node _T_553 = eq(_T_552, UInt<8>("h0c0")) @[axi4_to_ahb.scala 354:168]
    node _T_554 = or(_T_551, _T_553) @[axi4_to_ahb.scala 354:145]
    node _T_555 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 355:21]
    node _T_556 = eq(_T_555, UInt<4>("h0f")) @[axi4_to_ahb.scala 355:28]
    node _T_557 = or(_T_554, _T_556) @[axi4_to_ahb.scala 354:181]
    node _T_558 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 355:56]
    node _T_559 = eq(_T_558, UInt<8>("h0f0")) @[axi4_to_ahb.scala 355:63]
    node _T_560 = or(_T_557, _T_559) @[axi4_to_ahb.scala 355:40]
    node _T_561 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 355:92]
    node _T_562 = eq(_T_561, UInt<8>("h0ff")) @[axi4_to_ahb.scala 355:99]
    node _T_563 = or(_T_560, _T_562) @[axi4_to_ahb.scala 355:76]
    node _T_564 = and(_T_543, _T_563) @[axi4_to_ahb.scala 354:38]
    node _T_565 = or(_T_541, _T_564) @[axi4_to_ahb.scala 353:104]
    buf_aligned_in <= _T_565 @[axi4_to_ahb.scala 352:18]
    node _T_566 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 357:39]
    node _T_567 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 357:58]
    node _T_568 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 357:83]
    node _T_569 = cat(_T_567, _T_568) @[Cat.scala 29:58]
    node _T_570 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 357:104]
    node _T_571 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 357:129]
    node _T_572 = cat(_T_570, _T_571) @[Cat.scala 29:58]
    node _T_573 = mux(_T_566, _T_569, _T_572) @[axi4_to_ahb.scala 357:22]
    io.ahb_haddr <= _T_573 @[axi4_to_ahb.scala 357:16]
    node _T_574 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 358:39]
    node _T_575 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_576 = mux(_T_575, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_577 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 358:93]
    node _T_578 = and(_T_576, _T_577) @[axi4_to_ahb.scala 358:80]
    node _T_579 = cat(UInt<1>("h00"), _T_578) @[Cat.scala 29:58]
    node _T_580 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_581 = mux(_T_580, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_582 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 358:148]
    node _T_583 = and(_T_581, _T_582) @[axi4_to_ahb.scala 358:138]
    node _T_584 = cat(UInt<1>("h00"), _T_583) @[Cat.scala 29:58]
    node _T_585 = mux(_T_574, _T_579, _T_584) @[axi4_to_ahb.scala 358:22]
    io.ahb_hsize <= _T_585 @[axi4_to_ahb.scala 358:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 360:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 361:20]
    node _T_586 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 362:47]
    node _T_587 = not(_T_586) @[axi4_to_ahb.scala 362:33]
    node _T_588 = cat(UInt<1>("h01"), _T_587) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_588 @[axi4_to_ahb.scala 362:16]
    node _T_589 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 363:40]
    node _T_590 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 363:55]
    node _T_591 = eq(_T_590, UInt<1>("h01")) @[axi4_to_ahb.scala 363:62]
    node _T_592 = mux(_T_589, _T_591, buf_write) @[axi4_to_ahb.scala 363:23]
    io.ahb_hwrite <= _T_592 @[axi4_to_ahb.scala 363:17]
    node _T_593 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 364:28]
    io.ahb_hwdata <= _T_593 @[axi4_to_ahb.scala 364:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 366:15]
    node _T_594 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 367:43]
    node _T_595 = mux(_T_594, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 367:23]
    node _T_596 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_597 = mux(_T_596, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_598 = and(_T_597, UInt<2>("h02")) @[axi4_to_ahb.scala 367:88]
    node _T_599 = cat(_T_595, _T_598) @[Cat.scala 29:58]
    slave_opc <= _T_599 @[axi4_to_ahb.scala 367:13]
    node _T_600 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 368:41]
    node _T_601 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 368:66]
    node _T_602 = cat(_T_601, _T_601) @[Cat.scala 29:58]
    node _T_603 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 368:91]
    node _T_604 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 368:110]
    node _T_605 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 368:131]
    node _T_606 = mux(_T_603, _T_604, _T_605) @[axi4_to_ahb.scala 368:79]
    node _T_607 = mux(_T_600, _T_602, _T_606) @[axi4_to_ahb.scala 368:21]
    slave_rdata <= _T_607 @[axi4_to_ahb.scala 368:15]
    node _T_608 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 369:26]
    slave_tag <= _T_608 @[axi4_to_ahb.scala 369:13]
    node _T_609 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 371:33]
    node _T_610 = neq(_T_609, UInt<1>("h00")) @[axi4_to_ahb.scala 371:40]
    node _T_611 = and(_T_610, io.ahb_hready) @[axi4_to_ahb.scala 371:52]
    node _T_612 = and(_T_611, io.ahb_hwrite) @[axi4_to_ahb.scala 371:68]
    last_addr_en <= _T_612 @[axi4_to_ahb.scala 371:16]
    node _T_613 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 373:30]
    node _T_614 = and(_T_613, master_ready) @[axi4_to_ahb.scala 373:47]
    wrbuf_en <= _T_614 @[axi4_to_ahb.scala 373:12]
    node _T_615 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 374:34]
    node _T_616 = and(_T_615, master_ready) @[axi4_to_ahb.scala 374:50]
    wrbuf_data_en <= _T_616 @[axi4_to_ahb.scala 374:17]
    node _T_617 = and(master_valid, master_ready) @[axi4_to_ahb.scala 375:34]
    node _T_618 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 375:62]
    node _T_619 = eq(_T_618, UInt<1>("h01")) @[axi4_to_ahb.scala 375:69]
    node _T_620 = and(_T_617, _T_619) @[axi4_to_ahb.scala 375:49]
    wrbuf_cmd_sent <= _T_620 @[axi4_to_ahb.scala 375:18]
    node _T_621 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 376:33]
    node _T_622 = and(wrbuf_cmd_sent, _T_621) @[axi4_to_ahb.scala 376:31]
    wrbuf_rst <= _T_622 @[axi4_to_ahb.scala 376:13]
    node _T_623 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 378:35]
    node _T_624 = and(wrbuf_vld, _T_623) @[axi4_to_ahb.scala 378:33]
    node _T_625 = eq(_T_624, UInt<1>("h00")) @[axi4_to_ahb.scala 378:21]
    node _T_626 = and(_T_625, master_ready) @[axi4_to_ahb.scala 378:52]
    io.axi_awready <= _T_626 @[axi4_to_ahb.scala 378:18]
    node _T_627 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 379:39]
    node _T_628 = and(wrbuf_data_vld, _T_627) @[axi4_to_ahb.scala 379:37]
    node _T_629 = eq(_T_628, UInt<1>("h00")) @[axi4_to_ahb.scala 379:20]
    node _T_630 = and(_T_629, master_ready) @[axi4_to_ahb.scala 379:56]
    io.axi_wready <= _T_630 @[axi4_to_ahb.scala 379:17]
    node _T_631 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 380:33]
    node _T_632 = eq(_T_631, UInt<1>("h00")) @[axi4_to_ahb.scala 380:21]
    node _T_633 = and(_T_632, master_ready) @[axi4_to_ahb.scala 380:51]
    io.axi_arready <= _T_633 @[axi4_to_ahb.scala 380:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 381:16]
    node _T_634 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 384:68]
    node _T_635 = mux(_T_634, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 384:52]
    node _T_636 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 384:88]
    node _T_637 = and(_T_635, _T_636) @[axi4_to_ahb.scala 384:86]
    reg _T_638 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 384:48]
    _T_638 <= _T_637 @[axi4_to_ahb.scala 384:48]
    wrbuf_vld <= _T_638 @[axi4_to_ahb.scala 384:18]
    node _T_639 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 385:73]
    node _T_640 = mux(_T_639, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 385:52]
    node _T_641 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 385:99]
    node _T_642 = and(_T_640, _T_641) @[axi4_to_ahb.scala 385:97]
    reg _T_643 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 385:48]
    _T_643 <= _T_642 @[axi4_to_ahb.scala 385:48]
    wrbuf_data_vld <= _T_643 @[axi4_to_ahb.scala 385:18]
    node _T_644 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 387:57]
    node _T_645 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 387:91]
    reg _T_646 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_645 : @[Reg.scala 28:19]
      _T_646 <= _T_644 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_646 @[axi4_to_ahb.scala 387:13]
    node _T_647 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 388:60]
    node _T_648 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 388:88]
    reg _T_649 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_648 : @[Reg.scala 28:19]
      _T_649 <= _T_647 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_649 @[axi4_to_ahb.scala 388:14]
    node _T_650 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 390:48]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_650 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_651 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_651 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_651 @[axi4_to_ahb.scala 390:14]
    node _T_652 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 391:52]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_652 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_653 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_653 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_653 @[axi4_to_ahb.scala 391:14]
    node _T_654 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 394:27]
    node _T_655 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 394:60]
    reg _T_656 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_655 : @[Reg.scala 28:19]
      _T_656 <= _T_654 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_656 @[axi4_to_ahb.scala 393:16]
    node _T_657 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 397:27]
    node _T_658 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 397:60]
    reg _T_659 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_658 : @[Reg.scala 28:19]
      _T_659 <= _T_657 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_659 @[axi4_to_ahb.scala 396:17]
    node _T_660 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 405:50]
    reg _T_661 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_660 : @[Reg.scala 28:19]
      _T_661 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_661 @[axi4_to_ahb.scala 404:13]
    node _T_662 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 408:25]
    node _T_663 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 408:60]
    reg _T_664 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_663 : @[Reg.scala 28:19]
      _T_664 <= _T_662 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_664 @[axi4_to_ahb.scala 407:11]
    node _T_665 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 411:33]
    node _T_666 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 411:52]
    node _T_667 = bits(_T_666, 0, 0) @[axi4_to_ahb.scala 411:69]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_667 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_668 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_668 <= _T_665 @[el2_lib.scala 514:16]
    buf_addr <= _T_668 @[axi4_to_ahb.scala 411:12]
    node _T_669 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 414:26]
    node _T_670 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 414:55]
    reg _T_671 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_670 : @[Reg.scala 28:19]
      _T_671 <= _T_669 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_671 @[axi4_to_ahb.scala 413:12]
    node _T_672 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 417:52]
    reg _T_673 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_672 : @[Reg.scala 28:19]
      _T_673 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_673 @[axi4_to_ahb.scala 416:15]
    node _T_674 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 420:28]
    node _T_675 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 420:57]
    reg _T_676 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_675 : @[Reg.scala 28:19]
      _T_676 <= _T_674 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_676 @[axi4_to_ahb.scala 419:14]
    node _T_677 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 423:33]
    node _T_678 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 423:57]
    node _T_679 = bits(_T_678, 0, 0) @[axi4_to_ahb.scala 423:80]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_679 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_680 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_680 <= _T_677 @[el2_lib.scala 514:16]
    buf_data <= _T_680 @[axi4_to_ahb.scala 423:12]
    node _T_681 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 426:50]
    reg _T_682 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_681 : @[Reg.scala 28:19]
      _T_682 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_682 @[axi4_to_ahb.scala 425:16]
    node _T_683 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 429:22]
    node _T_684 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 429:60]
    reg _T_685 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_684 : @[Reg.scala 28:19]
      _T_685 <= _T_683 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_685 @[axi4_to_ahb.scala 428:14]
    node _T_686 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 432:59]
    reg _T_687 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_686 : @[Reg.scala 28:19]
      _T_687 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_687 @[axi4_to_ahb.scala 431:16]
    node _T_688 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 436:32]
    node _T_689 = mux(_T_688, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 436:16]
    node _T_690 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 436:52]
    node _T_691 = and(_T_689, _T_690) @[axi4_to_ahb.scala 436:50]
    reg _T_692 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 436:12]
    _T_692 <= _T_691 @[axi4_to_ahb.scala 436:12]
    cmd_doneQ <= _T_692 @[axi4_to_ahb.scala 435:13]
    node _T_693 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 440:31]
    node _T_694 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 440:70]
    reg _T_695 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_694 : @[Reg.scala 28:19]
      _T_695 <= _T_693 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_695 @[axi4_to_ahb.scala 439:21]
    reg _T_696 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 445:12]
    _T_696 <= io.ahb_hready @[axi4_to_ahb.scala 445:12]
    ahb_hready_q <= _T_696 @[axi4_to_ahb.scala 444:16]
    node _T_697 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 448:26]
    reg _T_698 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 448:12]
    _T_698 <= _T_697 @[axi4_to_ahb.scala 448:12]
    ahb_htrans_q <= _T_698 @[axi4_to_ahb.scala 447:16]
    reg _T_699 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 451:12]
    _T_699 <= io.ahb_hwrite @[axi4_to_ahb.scala 451:12]
    ahb_hwrite_q <= _T_699 @[axi4_to_ahb.scala 450:16]
    reg _T_700 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 454:12]
    _T_700 <= io.ahb_hresp @[axi4_to_ahb.scala 454:12]
    ahb_hresp_q <= _T_700 @[axi4_to_ahb.scala 453:15]
    node _T_701 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 457:26]
    reg _T_702 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 457:12]
    _T_702 <= _T_701 @[axi4_to_ahb.scala 457:12]
    ahb_hrdata_q <= _T_702 @[axi4_to_ahb.scala 456:16]
    node _T_703 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 460:43]
    node _T_704 = or(_T_703, io.clk_override) @[axi4_to_ahb.scala 460:58]
    node _T_705 = and(io.bus_clk_en, _T_704) @[axi4_to_ahb.scala 460:30]
    buf_clken <= _T_705 @[axi4_to_ahb.scala 460:13]
    node _T_706 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 461:69]
    node _T_707 = and(io.ahb_hready, _T_706) @[axi4_to_ahb.scala 461:54]
    node _T_708 = or(_T_707, io.clk_override) @[axi4_to_ahb.scala 461:74]
    node _T_709 = and(io.bus_clk_en, _T_708) @[axi4_to_ahb.scala 461:36]
    ahbm_addr_clken <= _T_709 @[axi4_to_ahb.scala 461:19]
    node _T_710 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 462:50]
    node _T_711 = or(_T_710, io.clk_override) @[axi4_to_ahb.scala 462:60]
    node _T_712 = and(io.bus_clk_en, _T_711) @[axi4_to_ahb.scala 462:36]
    ahbm_data_clken <= _T_712 @[axi4_to_ahb.scala 462:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 465:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 466:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 467:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 468:17]
    
