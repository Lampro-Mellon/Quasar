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
    
    wire buf_rst : UInt<3>
    buf_rst <= UInt<3>("h00")
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
    node _T_2 = not(buf_rst) @[axi4_to_ahb.scala 68:100]
    node _T_3 = and(_T_1, _T_2) @[axi4_to_ahb.scala 68:98]
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
    node _T_5 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 197:27]
    wr_cmd_vld <= _T_5 @[axi4_to_ahb.scala 197:14]
    node _T_6 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 198:30]
    master_valid <= _T_6 @[axi4_to_ahb.scala 198:16]
    node _T_7 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 199:38]
    node _T_8 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 199:51]
    node _T_9 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 199:76]
    node _T_10 = mux(_T_7, _T_8, _T_9) @[axi4_to_ahb.scala 199:20]
    master_tag <= _T_10 @[axi4_to_ahb.scala 199:14]
    node _T_11 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 200:38]
    node _T_12 = mux(_T_11, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 200:20]
    master_opc <= _T_12 @[axi4_to_ahb.scala 200:14]
    node _T_13 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 201:39]
    node _T_14 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 201:53]
    node _T_15 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 201:75]
    node _T_16 = mux(_T_13, _T_14, _T_15) @[axi4_to_ahb.scala 201:21]
    master_addr <= _T_16 @[axi4_to_ahb.scala 201:15]
    node _T_17 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 202:39]
    node _T_18 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 202:53]
    node _T_19 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 202:74]
    node _T_20 = mux(_T_17, _T_18, _T_19) @[axi4_to_ahb.scala 202:21]
    master_size <= _T_20 @[axi4_to_ahb.scala 202:15]
    node _T_21 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 203:32]
    master_byteen <= _T_21 @[axi4_to_ahb.scala 203:17]
    node _T_22 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 204:29]
    master_wdata <= _T_22 @[axi4_to_ahb.scala 204:16]
    node _T_23 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 207:32]
    node _T_24 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 207:57]
    node _T_25 = and(_T_23, _T_24) @[axi4_to_ahb.scala 207:46]
    io.axi_bvalid <= _T_25 @[axi4_to_ahb.scala 207:17]
    node _T_26 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 208:32]
    node _T_27 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 208:59]
    node _T_28 = mux(_T_27, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 208:49]
    node _T_29 = mux(_T_26, UInt<2>("h02"), _T_28) @[axi4_to_ahb.scala 208:22]
    io.axi_bresp <= _T_29 @[axi4_to_ahb.scala 208:16]
    node _T_30 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 209:26]
    io.axi_bid <= _T_30 @[axi4_to_ahb.scala 209:14]
    node _T_31 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 211:32]
    node _T_32 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 211:58]
    node _T_33 = eq(_T_32, UInt<1>("h00")) @[axi4_to_ahb.scala 211:65]
    node _T_34 = and(_T_31, _T_33) @[axi4_to_ahb.scala 211:46]
    io.axi_rvalid <= _T_34 @[axi4_to_ahb.scala 211:17]
    node _T_35 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 212:32]
    node _T_36 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 212:59]
    node _T_37 = mux(_T_36, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 212:49]
    node _T_38 = mux(_T_35, UInt<2>("h02"), _T_37) @[axi4_to_ahb.scala 212:22]
    io.axi_rresp <= _T_38 @[axi4_to_ahb.scala 212:16]
    node _T_39 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 213:26]
    io.axi_rid <= _T_39 @[axi4_to_ahb.scala 213:14]
    node _T_40 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 214:30]
    io.axi_rdata <= _T_40 @[axi4_to_ahb.scala 214:16]
    node _T_41 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 215:32]
    slave_ready <= _T_41 @[axi4_to_ahb.scala 215:15]
    node _T_42 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 218:56]
    node _T_43 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 218:91]
    node _T_44 = or(_T_42, _T_43) @[axi4_to_ahb.scala 218:74]
    node _T_45 = and(io.bus_clk_en, _T_44) @[axi4_to_ahb.scala 218:37]
    bus_write_clk_en <= _T_45 @[axi4_to_ahb.scala 218:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 220:11]
    node _T_46 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 221:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_46 @[el2_lib.scala 485:16]
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
    node _T_47 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_47 : @[Conditional.scala 40:58]
      master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 244:20]
      node _T_48 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 245:34]
      node _T_49 = eq(_T_48, UInt<1>("h01")) @[axi4_to_ahb.scala 245:41]
      buf_write_in <= _T_49 @[axi4_to_ahb.scala 245:20]
      node _T_50 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 246:46]
      node _T_51 = mux(_T_50, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 246:26]
      buf_nxtstate <= _T_51 @[axi4_to_ahb.scala 246:20]
      node _T_52 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 247:36]
      buf_state_en <= _T_52 @[axi4_to_ahb.scala 247:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 248:17]
      node _T_53 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 249:54]
      node _T_54 = and(buf_state_en, _T_53) @[axi4_to_ahb.scala 249:38]
      buf_data_wr_en <= _T_54 @[axi4_to_ahb.scala 249:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 250:27]
      node _T_55 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 252:50]
      node _T_56 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 252:89]
      node _T_57 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
      node _T_58 = tail(_T_57, 1) @[axi4_to_ahb.scala 181:52]
      node _T_59 = mux(UInt<1>("h00"), _T_58, UInt<1>("h00")) @[axi4_to_ahb.scala 181:24]
      node _T_60 = bits(_T_56, 0, 0) @[axi4_to_ahb.scala 182:44]
      node _T_61 = geq(UInt<1>("h00"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_62 = and(_T_60, _T_61) @[axi4_to_ahb.scala 182:48]
      node _T_63 = bits(_T_56, 1, 1) @[axi4_to_ahb.scala 182:44]
      node _T_64 = geq(UInt<1>("h01"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_65 = and(_T_63, _T_64) @[axi4_to_ahb.scala 182:48]
      node _T_66 = bits(_T_56, 2, 2) @[axi4_to_ahb.scala 182:44]
      node _T_67 = geq(UInt<2>("h02"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_68 = and(_T_66, _T_67) @[axi4_to_ahb.scala 182:48]
      node _T_69 = bits(_T_56, 3, 3) @[axi4_to_ahb.scala 182:44]
      node _T_70 = geq(UInt<2>("h03"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_71 = and(_T_69, _T_70) @[axi4_to_ahb.scala 182:48]
      node _T_72 = bits(_T_56, 4, 4) @[axi4_to_ahb.scala 182:44]
      node _T_73 = geq(UInt<3>("h04"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_74 = and(_T_72, _T_73) @[axi4_to_ahb.scala 182:48]
      node _T_75 = bits(_T_56, 5, 5) @[axi4_to_ahb.scala 182:44]
      node _T_76 = geq(UInt<3>("h05"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_77 = and(_T_75, _T_76) @[axi4_to_ahb.scala 182:48]
      node _T_78 = bits(_T_56, 6, 6) @[axi4_to_ahb.scala 182:44]
      node _T_79 = geq(UInt<3>("h06"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_80 = and(_T_78, _T_79) @[axi4_to_ahb.scala 182:48]
      node _T_81 = bits(_T_56, 7, 7) @[axi4_to_ahb.scala 182:44]
      node _T_82 = geq(UInt<3>("h07"), _T_59) @[axi4_to_ahb.scala 182:62]
      node _T_83 = and(_T_81, _T_82) @[axi4_to_ahb.scala 182:48]
      node _T_84 = mux(_T_83, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_85 = mux(_T_80, UInt<3>("h06"), _T_84) @[Mux.scala 98:16]
      node _T_86 = mux(_T_77, UInt<3>("h05"), _T_85) @[Mux.scala 98:16]
      node _T_87 = mux(_T_74, UInt<3>("h04"), _T_86) @[Mux.scala 98:16]
      node _T_88 = mux(_T_71, UInt<2>("h03"), _T_87) @[Mux.scala 98:16]
      node _T_89 = mux(_T_68, UInt<2>("h02"), _T_88) @[Mux.scala 98:16]
      node _T_90 = mux(_T_65, UInt<1>("h01"), _T_89) @[Mux.scala 98:16]
      node _T_91 = mux(_T_62, UInt<1>("h00"), _T_90) @[Mux.scala 98:16]
      node _T_92 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 252:138]
      node _T_93 = mux(_T_55, _T_91, _T_92) @[axi4_to_ahb.scala 252:30]
      buf_cmd_byte_ptr <= _T_93 @[axi4_to_ahb.scala 252:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 253:17]
      node _T_94 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 254:51]
      node _T_95 = and(bypass_en, _T_94) @[axi4_to_ahb.scala 254:35]
      rd_bypass_idle <= _T_95 @[axi4_to_ahb.scala 254:22]
      node _T_96 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_97 = mux(_T_96, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_98 = and(_T_97, UInt<2>("h02")) @[axi4_to_ahb.scala 255:45]
      io.ahb_htrans <= _T_98 @[axi4_to_ahb.scala 255:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_99 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_99 : @[Conditional.scala 39:67]
        node _T_100 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 259:54]
        node _T_101 = eq(_T_100, UInt<1>("h00")) @[axi4_to_ahb.scala 259:61]
        node _T_102 = and(master_valid, _T_101) @[axi4_to_ahb.scala 259:41]
        node _T_103 = bits(_T_102, 0, 0) @[axi4_to_ahb.scala 259:82]
        node _T_104 = mux(_T_103, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 259:26]
        buf_nxtstate <= _T_104 @[axi4_to_ahb.scala 259:20]
        node _T_105 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 260:51]
        node _T_106 = neq(_T_105, UInt<1>("h00")) @[axi4_to_ahb.scala 260:58]
        node _T_107 = and(ahb_hready_q, _T_106) @[axi4_to_ahb.scala 260:36]
        node _T_108 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 260:72]
        node _T_109 = and(_T_107, _T_108) @[axi4_to_ahb.scala 260:70]
        buf_state_en <= _T_109 @[axi4_to_ahb.scala 260:20]
        node _T_110 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 261:34]
        node _T_111 = and(buf_state_en, _T_110) @[axi4_to_ahb.scala 261:32]
        cmd_done <= _T_111 @[axi4_to_ahb.scala 261:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 262:20]
        node _T_112 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 263:52]
        node _T_113 = neq(_T_112, UInt<1>("h00")) @[axi4_to_ahb.scala 263:59]
        node _T_114 = and(ahb_hready_q, _T_113) @[axi4_to_ahb.scala 263:37]
        node _T_115 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 263:73]
        node _T_116 = and(_T_114, _T_115) @[axi4_to_ahb.scala 263:71]
        node _T_117 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 263:122]
        node _T_118 = eq(_T_117, UInt<1>("h00")) @[axi4_to_ahb.scala 263:129]
        node _T_119 = and(master_valid, _T_118) @[axi4_to_ahb.scala 263:109]
        node _T_120 = bits(_T_119, 0, 0) @[axi4_to_ahb.scala 263:150]
        node _T_121 = mux(_T_120, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 263:94]
        node _T_122 = eq(_T_121, UInt<3>("h06")) @[axi4_to_ahb.scala 263:174]
        node _T_123 = and(_T_116, _T_122) @[axi4_to_ahb.scala 263:88]
        master_ready <= _T_123 @[axi4_to_ahb.scala 263:20]
        buf_wr_en <= master_ready @[axi4_to_ahb.scala 264:17]
        node _T_124 = and(master_ready, master_valid) @[axi4_to_ahb.scala 265:33]
        bypass_en <= _T_124 @[axi4_to_ahb.scala 265:17]
        node _T_125 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 266:47]
        node _T_126 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 266:62]
        node _T_127 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 266:78]
        node _T_128 = mux(_T_125, _T_126, _T_127) @[axi4_to_ahb.scala 266:30]
        buf_cmd_byte_ptr <= _T_128 @[axi4_to_ahb.scala 266:24]
        node _T_129 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 267:44]
        node _T_130 = or(_T_129, bypass_en) @[axi4_to_ahb.scala 267:58]
        node _T_131 = bits(_T_130, 0, 0) @[Bitwise.scala 72:15]
        node _T_132 = mux(_T_131, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_133 = and(UInt<2>("h02"), _T_132) @[axi4_to_ahb.scala 267:32]
        io.ahb_htrans <= _T_133 @[axi4_to_ahb.scala 267:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_134 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_134 : @[Conditional.scala 39:67]
          node _T_135 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 271:39]
          node _T_136 = and(ahb_hready_q, _T_135) @[axi4_to_ahb.scala 271:37]
          node _T_137 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 271:82]
          node _T_138 = eq(_T_137, UInt<1>("h01")) @[axi4_to_ahb.scala 271:89]
          node _T_139 = and(master_valid, _T_138) @[axi4_to_ahb.scala 271:70]
          node _T_140 = eq(_T_139, UInt<1>("h00")) @[axi4_to_ahb.scala 271:55]
          node _T_141 = and(_T_136, _T_140) @[axi4_to_ahb.scala 271:53]
          master_ready <= _T_141 @[axi4_to_ahb.scala 271:20]
          node _T_142 = and(master_valid, master_ready) @[axi4_to_ahb.scala 272:34]
          node _T_143 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 272:62]
          node _T_144 = eq(_T_143, UInt<1>("h00")) @[axi4_to_ahb.scala 272:69]
          node _T_145 = and(_T_142, _T_144) @[axi4_to_ahb.scala 272:49]
          buf_wr_en <= _T_145 @[axi4_to_ahb.scala 272:17]
          node _T_146 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 273:45]
          node _T_147 = and(master_valid, master_ready) @[axi4_to_ahb.scala 273:82]
          node _T_148 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 273:110]
          node _T_149 = eq(_T_148, UInt<1>("h00")) @[axi4_to_ahb.scala 273:117]
          node _T_150 = and(_T_147, _T_149) @[axi4_to_ahb.scala 273:97]
          node _T_151 = bits(_T_150, 0, 0) @[axi4_to_ahb.scala 273:138]
          node _T_152 = mux(_T_151, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 273:67]
          node _T_153 = mux(_T_146, UInt<3>("h07"), _T_152) @[axi4_to_ahb.scala 273:26]
          buf_nxtstate <= _T_153 @[axi4_to_ahb.scala 273:20]
          node _T_154 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 274:37]
          buf_state_en <= _T_154 @[axi4_to_ahb.scala 274:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 275:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 276:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 277:23]
          node _T_155 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 278:41]
          node _T_156 = and(buf_state_en, _T_155) @[axi4_to_ahb.scala 278:39]
          slave_valid_pre <= _T_156 @[axi4_to_ahb.scala 278:23]
          node _T_157 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 279:34]
          node _T_158 = and(buf_state_en, _T_157) @[axi4_to_ahb.scala 279:32]
          cmd_done <= _T_158 @[axi4_to_ahb.scala 279:16]
          node _T_159 = and(master_ready, master_valid) @[axi4_to_ahb.scala 280:33]
          node _T_160 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 280:64]
          node _T_161 = and(_T_159, _T_160) @[axi4_to_ahb.scala 280:48]
          node _T_162 = and(_T_161, buf_state_en) @[axi4_to_ahb.scala 280:79]
          bypass_en <= _T_162 @[axi4_to_ahb.scala 280:17]
          node _T_163 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 281:47]
          node _T_164 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 281:62]
          node _T_165 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 281:78]
          node _T_166 = mux(_T_163, _T_164, _T_165) @[axi4_to_ahb.scala 281:30]
          buf_cmd_byte_ptr <= _T_166 @[axi4_to_ahb.scala 281:24]
          node _T_167 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 282:59]
          node _T_168 = and(_T_167, buf_state_en) @[axi4_to_ahb.scala 282:74]
          node _T_169 = eq(_T_168, UInt<1>("h00")) @[axi4_to_ahb.scala 282:43]
          node _T_170 = bits(_T_169, 0, 0) @[Bitwise.scala 72:15]
          node _T_171 = mux(_T_170, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_172 = and(UInt<2>("h02"), _T_171) @[axi4_to_ahb.scala 282:32]
          io.ahb_htrans <= _T_172 @[axi4_to_ahb.scala 282:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 283:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_173 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_173 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 287:20]
            node _T_174 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 288:51]
            node _T_175 = neq(_T_174, UInt<1>("h00")) @[axi4_to_ahb.scala 288:58]
            node _T_176 = and(ahb_hready_q, _T_175) @[axi4_to_ahb.scala 288:36]
            node _T_177 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 288:72]
            node _T_178 = and(_T_176, _T_177) @[axi4_to_ahb.scala 288:70]
            buf_state_en <= _T_178 @[axi4_to_ahb.scala 288:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 289:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 290:20]
            node _T_179 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 291:35]
            buf_cmd_byte_ptr <= _T_179 @[axi4_to_ahb.scala 291:24]
            node _T_180 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 292:47]
            node _T_181 = bits(_T_180, 0, 0) @[Bitwise.scala 72:15]
            node _T_182 = mux(_T_181, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_183 = and(UInt<2>("h02"), _T_182) @[axi4_to_ahb.scala 292:37]
            io.ahb_htrans <= _T_183 @[axi4_to_ahb.scala 292:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_184 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_184 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 296:20]
              node _T_185 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 297:37]
              buf_state_en <= _T_185 @[axi4_to_ahb.scala 297:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 298:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 299:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 300:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 301:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_186 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_186 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 305:20]
                node _T_187 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 306:33]
                node _T_188 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 306:63]
                node _T_189 = neq(_T_188, UInt<1>("h00")) @[axi4_to_ahb.scala 306:70]
                node _T_190 = and(_T_187, _T_189) @[axi4_to_ahb.scala 306:48]
                trxn_done <= _T_190 @[axi4_to_ahb.scala 306:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 307:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 308:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 309:20]
                node _T_191 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 310:47]
                node _T_192 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 310:85]
                node _T_193 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 310:103]
                node _T_194 = add(_T_192, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                node _T_195 = tail(_T_194, 1) @[axi4_to_ahb.scala 181:52]
                node _T_196 = mux(UInt<1>("h01"), _T_195, _T_192) @[axi4_to_ahb.scala 181:24]
                node _T_197 = bits(_T_193, 0, 0) @[axi4_to_ahb.scala 182:44]
                node _T_198 = geq(UInt<1>("h00"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_199 = and(_T_197, _T_198) @[axi4_to_ahb.scala 182:48]
                node _T_200 = bits(_T_193, 1, 1) @[axi4_to_ahb.scala 182:44]
                node _T_201 = geq(UInt<1>("h01"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_202 = and(_T_200, _T_201) @[axi4_to_ahb.scala 182:48]
                node _T_203 = bits(_T_193, 2, 2) @[axi4_to_ahb.scala 182:44]
                node _T_204 = geq(UInt<2>("h02"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_205 = and(_T_203, _T_204) @[axi4_to_ahb.scala 182:48]
                node _T_206 = bits(_T_193, 3, 3) @[axi4_to_ahb.scala 182:44]
                node _T_207 = geq(UInt<2>("h03"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_208 = and(_T_206, _T_207) @[axi4_to_ahb.scala 182:48]
                node _T_209 = bits(_T_193, 4, 4) @[axi4_to_ahb.scala 182:44]
                node _T_210 = geq(UInt<3>("h04"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_211 = and(_T_209, _T_210) @[axi4_to_ahb.scala 182:48]
                node _T_212 = bits(_T_193, 5, 5) @[axi4_to_ahb.scala 182:44]
                node _T_213 = geq(UInt<3>("h05"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_214 = and(_T_212, _T_213) @[axi4_to_ahb.scala 182:48]
                node _T_215 = bits(_T_193, 6, 6) @[axi4_to_ahb.scala 182:44]
                node _T_216 = geq(UInt<3>("h06"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_217 = and(_T_215, _T_216) @[axi4_to_ahb.scala 182:48]
                node _T_218 = bits(_T_193, 7, 7) @[axi4_to_ahb.scala 182:44]
                node _T_219 = geq(UInt<3>("h07"), _T_196) @[axi4_to_ahb.scala 182:62]
                node _T_220 = and(_T_218, _T_219) @[axi4_to_ahb.scala 182:48]
                node _T_221 = mux(_T_220, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_222 = mux(_T_217, UInt<3>("h06"), _T_221) @[Mux.scala 98:16]
                node _T_223 = mux(_T_214, UInt<3>("h05"), _T_222) @[Mux.scala 98:16]
                node _T_224 = mux(_T_211, UInt<3>("h04"), _T_223) @[Mux.scala 98:16]
                node _T_225 = mux(_T_208, UInt<2>("h03"), _T_224) @[Mux.scala 98:16]
                node _T_226 = mux(_T_205, UInt<2>("h02"), _T_225) @[Mux.scala 98:16]
                node _T_227 = mux(_T_202, UInt<1>("h01"), _T_226) @[Mux.scala 98:16]
                node _T_228 = mux(_T_199, UInt<1>("h00"), _T_227) @[Mux.scala 98:16]
                node _T_229 = mux(_T_191, _T_228, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 310:30]
                buf_cmd_byte_ptr <= _T_229 @[axi4_to_ahb.scala 310:24]
                node _T_230 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 311:65]
                node _T_231 = or(buf_aligned, _T_230) @[axi4_to_ahb.scala 311:44]
                node _T_232 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 311:127]
                node _T_233 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 311:145]
                node _T_234 = add(_T_232, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                node _T_235 = tail(_T_234, 1) @[axi4_to_ahb.scala 181:52]
                node _T_236 = mux(UInt<1>("h01"), _T_235, _T_232) @[axi4_to_ahb.scala 181:24]
                node _T_237 = bits(_T_233, 0, 0) @[axi4_to_ahb.scala 182:44]
                node _T_238 = geq(UInt<1>("h00"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_239 = and(_T_237, _T_238) @[axi4_to_ahb.scala 182:48]
                node _T_240 = bits(_T_233, 1, 1) @[axi4_to_ahb.scala 182:44]
                node _T_241 = geq(UInt<1>("h01"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_242 = and(_T_240, _T_241) @[axi4_to_ahb.scala 182:48]
                node _T_243 = bits(_T_233, 2, 2) @[axi4_to_ahb.scala 182:44]
                node _T_244 = geq(UInt<2>("h02"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_245 = and(_T_243, _T_244) @[axi4_to_ahb.scala 182:48]
                node _T_246 = bits(_T_233, 3, 3) @[axi4_to_ahb.scala 182:44]
                node _T_247 = geq(UInt<2>("h03"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_248 = and(_T_246, _T_247) @[axi4_to_ahb.scala 182:48]
                node _T_249 = bits(_T_233, 4, 4) @[axi4_to_ahb.scala 182:44]
                node _T_250 = geq(UInt<3>("h04"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_251 = and(_T_249, _T_250) @[axi4_to_ahb.scala 182:48]
                node _T_252 = bits(_T_233, 5, 5) @[axi4_to_ahb.scala 182:44]
                node _T_253 = geq(UInt<3>("h05"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_254 = and(_T_252, _T_253) @[axi4_to_ahb.scala 182:48]
                node _T_255 = bits(_T_233, 6, 6) @[axi4_to_ahb.scala 182:44]
                node _T_256 = geq(UInt<3>("h06"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_257 = and(_T_255, _T_256) @[axi4_to_ahb.scala 182:48]
                node _T_258 = bits(_T_233, 7, 7) @[axi4_to_ahb.scala 182:44]
                node _T_259 = geq(UInt<3>("h07"), _T_236) @[axi4_to_ahb.scala 182:62]
                node _T_260 = and(_T_258, _T_259) @[axi4_to_ahb.scala 182:48]
                node _T_261 = mux(_T_260, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_262 = mux(_T_257, UInt<3>("h06"), _T_261) @[Mux.scala 98:16]
                node _T_263 = mux(_T_254, UInt<3>("h05"), _T_262) @[Mux.scala 98:16]
                node _T_264 = mux(_T_251, UInt<3>("h04"), _T_263) @[Mux.scala 98:16]
                node _T_265 = mux(_T_248, UInt<2>("h03"), _T_264) @[Mux.scala 98:16]
                node _T_266 = mux(_T_245, UInt<2>("h02"), _T_265) @[Mux.scala 98:16]
                node _T_267 = mux(_T_242, UInt<1>("h01"), _T_266) @[Mux.scala 98:16]
                node _T_268 = mux(_T_239, UInt<1>("h00"), _T_267) @[Mux.scala 98:16]
                node _T_269 = dshr(buf_byteen, _T_268) @[axi4_to_ahb.scala 311:92]
                node _T_270 = bits(_T_269, 0, 0) @[axi4_to_ahb.scala 311:92]
                node _T_271 = eq(_T_270, UInt<1>("h00")) @[axi4_to_ahb.scala 311:163]
                node _T_272 = or(_T_231, _T_271) @[axi4_to_ahb.scala 311:79]
                node _T_273 = and(trxn_done, _T_272) @[axi4_to_ahb.scala 311:29]
                cmd_done <= _T_273 @[axi4_to_ahb.scala 311:16]
                node _T_274 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 312:43]
                node _T_275 = eq(_T_274, UInt<1>("h00")) @[axi4_to_ahb.scala 312:32]
                node _T_276 = bits(_T_275, 0, 0) @[Bitwise.scala 72:15]
                node _T_277 = mux(_T_276, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_278 = and(_T_277, UInt<2>("h02")) @[axi4_to_ahb.scala 312:57]
                io.ahb_htrans <= _T_278 @[axi4_to_ahb.scala 312:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_279 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_279 : @[Conditional.scala 39:67]
                  node _T_280 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 316:34]
                  node _T_281 = or(_T_280, ahb_hresp_q) @[axi4_to_ahb.scala 316:50]
                  buf_state_en <= _T_281 @[axi4_to_ahb.scala 316:20]
                  node _T_282 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 317:35]
                  node _T_283 = or(_T_282, ahb_hresp_q) @[axi4_to_ahb.scala 317:51]
                  node _T_284 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 317:68]
                  node _T_285 = and(_T_283, _T_284) @[axi4_to_ahb.scala 317:66]
                  node _T_286 = and(_T_285, slave_ready) @[axi4_to_ahb.scala 317:81]
                  master_ready <= _T_286 @[axi4_to_ahb.scala 317:20]
                  node _T_287 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 318:42]
                  node _T_288 = or(ahb_hresp_q, _T_287) @[axi4_to_ahb.scala 318:40]
                  node _T_289 = bits(_T_288, 0, 0) @[axi4_to_ahb.scala 318:62]
                  node _T_290 = and(master_valid, master_ready) @[axi4_to_ahb.scala 318:90]
                  node _T_291 = bits(_T_290, 0, 0) @[axi4_to_ahb.scala 318:112]
                  node _T_292 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 318:131]
                  node _T_293 = eq(_T_292, UInt<1>("h01")) @[axi4_to_ahb.scala 318:138]
                  node _T_294 = mux(_T_293, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 318:119]
                  node _T_295 = mux(_T_291, _T_294, UInt<3>("h00")) @[axi4_to_ahb.scala 318:75]
                  node _T_296 = mux(_T_289, UInt<3>("h05"), _T_295) @[axi4_to_ahb.scala 318:26]
                  buf_nxtstate <= _T_296 @[axi4_to_ahb.scala 318:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 319:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 320:23]
                  node _T_297 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 321:34]
                  node _T_298 = eq(_T_297, UInt<1>("h01")) @[axi4_to_ahb.scala 321:41]
                  buf_write_in <= _T_298 @[axi4_to_ahb.scala 321:20]
                  node _T_299 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 322:50]
                  node _T_300 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 322:78]
                  node _T_301 = or(_T_299, _T_300) @[axi4_to_ahb.scala 322:62]
                  node _T_302 = and(buf_state_en, _T_301) @[axi4_to_ahb.scala 322:33]
                  buf_wr_en <= _T_302 @[axi4_to_ahb.scala 322:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 323:22]
                  node _T_303 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 324:63]
                  node _T_304 = neq(_T_303, UInt<1>("h00")) @[axi4_to_ahb.scala 324:70]
                  node _T_305 = and(ahb_hready_q, _T_304) @[axi4_to_ahb.scala 324:48]
                  node _T_306 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 324:104]
                  node _T_307 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 324:166]
                  node _T_308 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 324:184]
                  node _T_309 = add(_T_307, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_310 = tail(_T_309, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_311 = mux(UInt<1>("h01"), _T_310, _T_307) @[axi4_to_ahb.scala 181:24]
                  node _T_312 = bits(_T_308, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_313 = geq(UInt<1>("h00"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_314 = and(_T_312, _T_313) @[axi4_to_ahb.scala 182:48]
                  node _T_315 = bits(_T_308, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_316 = geq(UInt<1>("h01"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_317 = and(_T_315, _T_316) @[axi4_to_ahb.scala 182:48]
                  node _T_318 = bits(_T_308, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_319 = geq(UInt<2>("h02"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_320 = and(_T_318, _T_319) @[axi4_to_ahb.scala 182:48]
                  node _T_321 = bits(_T_308, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_322 = geq(UInt<2>("h03"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_323 = and(_T_321, _T_322) @[axi4_to_ahb.scala 182:48]
                  node _T_324 = bits(_T_308, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_325 = geq(UInt<3>("h04"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_326 = and(_T_324, _T_325) @[axi4_to_ahb.scala 182:48]
                  node _T_327 = bits(_T_308, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_328 = geq(UInt<3>("h05"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_329 = and(_T_327, _T_328) @[axi4_to_ahb.scala 182:48]
                  node _T_330 = bits(_T_308, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_331 = geq(UInt<3>("h06"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_332 = and(_T_330, _T_331) @[axi4_to_ahb.scala 182:48]
                  node _T_333 = bits(_T_308, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_334 = geq(UInt<3>("h07"), _T_311) @[axi4_to_ahb.scala 182:62]
                  node _T_335 = and(_T_333, _T_334) @[axi4_to_ahb.scala 182:48]
                  node _T_336 = mux(_T_335, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_337 = mux(_T_332, UInt<3>("h06"), _T_336) @[Mux.scala 98:16]
                  node _T_338 = mux(_T_329, UInt<3>("h05"), _T_337) @[Mux.scala 98:16]
                  node _T_339 = mux(_T_326, UInt<3>("h04"), _T_338) @[Mux.scala 98:16]
                  node _T_340 = mux(_T_323, UInt<2>("h03"), _T_339) @[Mux.scala 98:16]
                  node _T_341 = mux(_T_320, UInt<2>("h02"), _T_340) @[Mux.scala 98:16]
                  node _T_342 = mux(_T_317, UInt<1>("h01"), _T_341) @[Mux.scala 98:16]
                  node _T_343 = mux(_T_314, UInt<1>("h00"), _T_342) @[Mux.scala 98:16]
                  node _T_344 = dshr(buf_byteen, _T_343) @[axi4_to_ahb.scala 324:131]
                  node _T_345 = bits(_T_344, 0, 0) @[axi4_to_ahb.scala 324:131]
                  node _T_346 = eq(_T_345, UInt<1>("h00")) @[axi4_to_ahb.scala 324:202]
                  node _T_347 = or(_T_306, _T_346) @[axi4_to_ahb.scala 324:118]
                  node _T_348 = and(_T_305, _T_347) @[axi4_to_ahb.scala 324:82]
                  node _T_349 = or(ahb_hresp_q, _T_348) @[axi4_to_ahb.scala 324:32]
                  cmd_done <= _T_349 @[axi4_to_ahb.scala 324:16]
                  node _T_350 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 325:33]
                  node _T_351 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 325:64]
                  node _T_352 = and(_T_350, _T_351) @[axi4_to_ahb.scala 325:48]
                  bypass_en <= _T_352 @[axi4_to_ahb.scala 325:17]
                  node _T_353 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 326:44]
                  node _T_354 = eq(_T_353, UInt<1>("h00")) @[axi4_to_ahb.scala 326:33]
                  node _T_355 = or(_T_354, bypass_en) @[axi4_to_ahb.scala 326:57]
                  node _T_356 = bits(_T_355, 0, 0) @[Bitwise.scala 72:15]
                  node _T_357 = mux(_T_356, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_358 = and(_T_357, UInt<2>("h02")) @[axi4_to_ahb.scala 326:71]
                  io.ahb_htrans <= _T_358 @[axi4_to_ahb.scala 326:21]
                  node _T_359 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 327:55]
                  node _T_360 = and(buf_state_en, _T_359) @[axi4_to_ahb.scala 327:39]
                  slave_valid_pre <= _T_360 @[axi4_to_ahb.scala 327:23]
                  node _T_361 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 328:33]
                  node _T_362 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 328:63]
                  node _T_363 = neq(_T_362, UInt<1>("h00")) @[axi4_to_ahb.scala 328:70]
                  node _T_364 = and(_T_361, _T_363) @[axi4_to_ahb.scala 328:48]
                  trxn_done <= _T_364 @[axi4_to_ahb.scala 328:17]
                  node _T_365 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 329:40]
                  buf_cmd_byte_ptr_en <= _T_365 @[axi4_to_ahb.scala 329:27]
                  node _T_366 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 332:76]
                  node _T_367 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_368 = tail(_T_367, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_369 = mux(UInt<1>("h00"), _T_368, UInt<1>("h00")) @[axi4_to_ahb.scala 181:24]
                  node _T_370 = bits(_T_366, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_371 = geq(UInt<1>("h00"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_372 = and(_T_370, _T_371) @[axi4_to_ahb.scala 182:48]
                  node _T_373 = bits(_T_366, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_374 = geq(UInt<1>("h01"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_375 = and(_T_373, _T_374) @[axi4_to_ahb.scala 182:48]
                  node _T_376 = bits(_T_366, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_377 = geq(UInt<2>("h02"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_378 = and(_T_376, _T_377) @[axi4_to_ahb.scala 182:48]
                  node _T_379 = bits(_T_366, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_380 = geq(UInt<2>("h03"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_381 = and(_T_379, _T_380) @[axi4_to_ahb.scala 182:48]
                  node _T_382 = bits(_T_366, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_383 = geq(UInt<3>("h04"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_384 = and(_T_382, _T_383) @[axi4_to_ahb.scala 182:48]
                  node _T_385 = bits(_T_366, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_386 = geq(UInt<3>("h05"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_387 = and(_T_385, _T_386) @[axi4_to_ahb.scala 182:48]
                  node _T_388 = bits(_T_366, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_389 = geq(UInt<3>("h06"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_390 = and(_T_388, _T_389) @[axi4_to_ahb.scala 182:48]
                  node _T_391 = bits(_T_366, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_392 = geq(UInt<3>("h07"), _T_369) @[axi4_to_ahb.scala 182:62]
                  node _T_393 = and(_T_391, _T_392) @[axi4_to_ahb.scala 182:48]
                  node _T_394 = mux(_T_393, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_395 = mux(_T_390, UInt<3>("h06"), _T_394) @[Mux.scala 98:16]
                  node _T_396 = mux(_T_387, UInt<3>("h05"), _T_395) @[Mux.scala 98:16]
                  node _T_397 = mux(_T_384, UInt<3>("h04"), _T_396) @[Mux.scala 98:16]
                  node _T_398 = mux(_T_381, UInt<2>("h03"), _T_397) @[Mux.scala 98:16]
                  node _T_399 = mux(_T_378, UInt<2>("h02"), _T_398) @[Mux.scala 98:16]
                  node _T_400 = mux(_T_375, UInt<1>("h01"), _T_399) @[Mux.scala 98:16]
                  node _T_401 = mux(_T_372, UInt<1>("h00"), _T_400) @[Mux.scala 98:16]
                  node _T_402 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 332:142]
                  node _T_403 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 332:160]
                  node _T_404 = add(_T_402, UInt<1>("h01")) @[axi4_to_ahb.scala 181:52]
                  node _T_405 = tail(_T_404, 1) @[axi4_to_ahb.scala 181:52]
                  node _T_406 = mux(UInt<1>("h01"), _T_405, _T_402) @[axi4_to_ahb.scala 181:24]
                  node _T_407 = bits(_T_403, 0, 0) @[axi4_to_ahb.scala 182:44]
                  node _T_408 = geq(UInt<1>("h00"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_409 = and(_T_407, _T_408) @[axi4_to_ahb.scala 182:48]
                  node _T_410 = bits(_T_403, 1, 1) @[axi4_to_ahb.scala 182:44]
                  node _T_411 = geq(UInt<1>("h01"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_412 = and(_T_410, _T_411) @[axi4_to_ahb.scala 182:48]
                  node _T_413 = bits(_T_403, 2, 2) @[axi4_to_ahb.scala 182:44]
                  node _T_414 = geq(UInt<2>("h02"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_415 = and(_T_413, _T_414) @[axi4_to_ahb.scala 182:48]
                  node _T_416 = bits(_T_403, 3, 3) @[axi4_to_ahb.scala 182:44]
                  node _T_417 = geq(UInt<2>("h03"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_418 = and(_T_416, _T_417) @[axi4_to_ahb.scala 182:48]
                  node _T_419 = bits(_T_403, 4, 4) @[axi4_to_ahb.scala 182:44]
                  node _T_420 = geq(UInt<3>("h04"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_421 = and(_T_419, _T_420) @[axi4_to_ahb.scala 182:48]
                  node _T_422 = bits(_T_403, 5, 5) @[axi4_to_ahb.scala 182:44]
                  node _T_423 = geq(UInt<3>("h05"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_424 = and(_T_422, _T_423) @[axi4_to_ahb.scala 182:48]
                  node _T_425 = bits(_T_403, 6, 6) @[axi4_to_ahb.scala 182:44]
                  node _T_426 = geq(UInt<3>("h06"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_427 = and(_T_425, _T_426) @[axi4_to_ahb.scala 182:48]
                  node _T_428 = bits(_T_403, 7, 7) @[axi4_to_ahb.scala 182:44]
                  node _T_429 = geq(UInt<3>("h07"), _T_406) @[axi4_to_ahb.scala 182:62]
                  node _T_430 = and(_T_428, _T_429) @[axi4_to_ahb.scala 182:48]
                  node _T_431 = mux(_T_430, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_432 = mux(_T_427, UInt<3>("h06"), _T_431) @[Mux.scala 98:16]
                  node _T_433 = mux(_T_424, UInt<3>("h05"), _T_432) @[Mux.scala 98:16]
                  node _T_434 = mux(_T_421, UInt<3>("h04"), _T_433) @[Mux.scala 98:16]
                  node _T_435 = mux(_T_418, UInt<2>("h03"), _T_434) @[Mux.scala 98:16]
                  node _T_436 = mux(_T_415, UInt<2>("h02"), _T_435) @[Mux.scala 98:16]
                  node _T_437 = mux(_T_412, UInt<1>("h01"), _T_436) @[Mux.scala 98:16]
                  node _T_438 = mux(_T_409, UInt<1>("h00"), _T_437) @[Mux.scala 98:16]
                  node _T_439 = mux(trxn_done, _T_438, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 332:97]
                  node _T_440 = mux(bypass_en, _T_401, _T_439) @[axi4_to_ahb.scala 332:30]
                  buf_cmd_byte_ptr <= _T_440 @[axi4_to_ahb.scala 332:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_441 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_441 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 335:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 336:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 337:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 338:23]
                    skip @[Conditional.scala 39:67]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 341:16]
    node _T_442 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 342:33]
    node _T_443 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 342:73]
    node _T_444 = eq(_T_443, UInt<1>("h01")) @[axi4_to_ahb.scala 342:80]
    node _T_445 = and(buf_aligned_in, _T_444) @[axi4_to_ahb.scala 342:60]
    node _T_446 = bits(_T_445, 0, 0) @[axi4_to_ahb.scala 342:100]
    node _T_447 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 342:132]
    node _T_448 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 173:50]
    node _T_449 = eq(_T_448, UInt<8>("h0ff")) @[axi4_to_ahb.scala 173:57]
    node _T_450 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 173:81]
    node _T_451 = eq(_T_450, UInt<8>("h0f")) @[axi4_to_ahb.scala 173:88]
    node _T_452 = or(_T_449, _T_451) @[axi4_to_ahb.scala 173:70]
    node _T_453 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 173:117]
    node _T_454 = eq(_T_453, UInt<8>("h03")) @[axi4_to_ahb.scala 173:124]
    node _T_455 = or(_T_452, _T_454) @[axi4_to_ahb.scala 173:106]
    node _T_456 = bits(_T_455, 0, 0) @[Bitwise.scala 72:15]
    node _T_457 = mux(_T_456, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_458 = and(UInt<3>("h00"), _T_457) @[axi4_to_ahb.scala 173:29]
    node _T_459 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 174:35]
    node _T_460 = eq(_T_459, UInt<8>("h0c")) @[axi4_to_ahb.scala 174:42]
    node _T_461 = bits(_T_460, 0, 0) @[Bitwise.scala 72:15]
    node _T_462 = mux(_T_461, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_463 = and(UInt<2>("h02"), _T_462) @[axi4_to_ahb.scala 174:15]
    node _T_464 = or(_T_458, _T_463) @[axi4_to_ahb.scala 173:146]
    node _T_465 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 175:36]
    node _T_466 = eq(_T_465, UInt<8>("h0f0")) @[axi4_to_ahb.scala 175:43]
    node _T_467 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 175:67]
    node _T_468 = eq(_T_467, UInt<8>("h03")) @[axi4_to_ahb.scala 175:74]
    node _T_469 = or(_T_466, _T_468) @[axi4_to_ahb.scala 175:56]
    node _T_470 = bits(_T_469, 0, 0) @[Bitwise.scala 72:15]
    node _T_471 = mux(_T_470, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_472 = and(UInt<3>("h04"), _T_471) @[axi4_to_ahb.scala 175:15]
    node _T_473 = or(_T_464, _T_472) @[axi4_to_ahb.scala 174:63]
    node _T_474 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 176:37]
    node _T_475 = eq(_T_474, UInt<8>("h0c0")) @[axi4_to_ahb.scala 176:44]
    node _T_476 = bits(_T_475, 0, 0) @[Bitwise.scala 72:15]
    node _T_477 = mux(_T_476, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_478 = and(UInt<3>("h06"), _T_477) @[axi4_to_ahb.scala 176:17]
    node _T_479 = or(_T_473, _T_478) @[axi4_to_ahb.scala 175:96]
    node _T_480 = bits(_T_447, 7, 0) @[axi4_to_ahb.scala 177:37]
    node _T_481 = eq(_T_480, UInt<8>("h0c0")) @[axi4_to_ahb.scala 177:44]
    node _T_482 = bits(_T_481, 0, 0) @[Bitwise.scala 72:15]
    node _T_483 = mux(_T_482, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_484 = and(UInt<3>("h06"), _T_483) @[axi4_to_ahb.scala 177:17]
    node _T_485 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 342:152]
    node _T_486 = mux(_T_446, _T_479, _T_485) @[axi4_to_ahb.scala 342:43]
    node _T_487 = cat(_T_442, _T_486) @[Cat.scala 29:58]
    buf_addr_in <= _T_487 @[axi4_to_ahb.scala 342:15]
    node _T_488 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 343:27]
    buf_tag_in <= _T_488 @[axi4_to_ahb.scala 343:14]
    node _T_489 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 344:32]
    buf_byteen_in <= _T_489 @[axi4_to_ahb.scala 344:17]
    node _T_490 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 345:33]
    node _T_491 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 345:59]
    node _T_492 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 345:80]
    node _T_493 = mux(_T_490, _T_491, _T_492) @[axi4_to_ahb.scala 345:21]
    buf_data_in <= _T_493 @[axi4_to_ahb.scala 345:15]
    node _T_494 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 346:52]
    node _T_495 = eq(_T_494, UInt<2>("h03")) @[axi4_to_ahb.scala 346:58]
    node _T_496 = and(buf_aligned_in, _T_495) @[axi4_to_ahb.scala 346:38]
    node _T_497 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 346:84]
    node _T_498 = eq(_T_497, UInt<1>("h01")) @[axi4_to_ahb.scala 346:91]
    node _T_499 = and(_T_496, _T_498) @[axi4_to_ahb.scala 346:71]
    node _T_500 = bits(_T_499, 0, 0) @[axi4_to_ahb.scala 346:111]
    node _T_501 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 346:142]
    node _T_502 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 166:42]
    node _T_503 = eq(_T_502, UInt<8>("h0ff")) @[axi4_to_ahb.scala 166:49]
    node _T_504 = bits(_T_503, 0, 0) @[Bitwise.scala 72:15]
    node _T_505 = mux(_T_504, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_506 = and(UInt<2>("h03"), _T_505) @[axi4_to_ahb.scala 166:25]
    node _T_507 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 167:35]
    node _T_508 = eq(_T_507, UInt<8>("h0f0")) @[axi4_to_ahb.scala 167:42]
    node _T_509 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 167:64]
    node _T_510 = eq(_T_509, UInt<8>("h0f")) @[axi4_to_ahb.scala 167:71]
    node _T_511 = or(_T_508, _T_510) @[axi4_to_ahb.scala 167:55]
    node _T_512 = bits(_T_511, 0, 0) @[Bitwise.scala 72:15]
    node _T_513 = mux(_T_512, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_514 = and(UInt<2>("h02"), _T_513) @[axi4_to_ahb.scala 167:16]
    node _T_515 = or(_T_506, _T_514) @[axi4_to_ahb.scala 166:64]
    node _T_516 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 168:40]
    node _T_517 = eq(_T_516, UInt<8>("h0c0")) @[axi4_to_ahb.scala 168:47]
    node _T_518 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 168:69]
    node _T_519 = eq(_T_518, UInt<6>("h030")) @[axi4_to_ahb.scala 168:76]
    node _T_520 = or(_T_517, _T_519) @[axi4_to_ahb.scala 168:60]
    node _T_521 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 168:98]
    node _T_522 = eq(_T_521, UInt<8>("h0c")) @[axi4_to_ahb.scala 168:105]
    node _T_523 = or(_T_520, _T_522) @[axi4_to_ahb.scala 168:89]
    node _T_524 = bits(_T_501, 7, 0) @[axi4_to_ahb.scala 168:132]
    node _T_525 = eq(_T_524, UInt<8>("h03")) @[axi4_to_ahb.scala 168:139]
    node _T_526 = or(_T_523, _T_525) @[axi4_to_ahb.scala 168:123]
    node _T_527 = bits(_T_526, 0, 0) @[Bitwise.scala 72:15]
    node _T_528 = mux(_T_527, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_529 = and(UInt<2>("h01"), _T_528) @[axi4_to_ahb.scala 168:21]
    node _T_530 = or(_T_515, _T_529) @[axi4_to_ahb.scala 167:93]
    node _T_531 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 346:161]
    node _T_532 = mux(_T_500, _T_530, _T_531) @[axi4_to_ahb.scala 346:21]
    buf_size_in <= _T_532 @[axi4_to_ahb.scala 346:15]
    node _T_533 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 347:32]
    node _T_534 = eq(_T_533, UInt<1>("h00")) @[axi4_to_ahb.scala 347:39]
    node _T_535 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 348:17]
    node _T_536 = eq(_T_535, UInt<1>("h00")) @[axi4_to_ahb.scala 348:24]
    node _T_537 = or(_T_534, _T_536) @[axi4_to_ahb.scala 347:48]
    node _T_538 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 348:47]
    node _T_539 = eq(_T_538, UInt<2>("h01")) @[axi4_to_ahb.scala 348:54]
    node _T_540 = or(_T_537, _T_539) @[axi4_to_ahb.scala 348:33]
    node _T_541 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 348:86]
    node _T_542 = eq(_T_541, UInt<2>("h02")) @[axi4_to_ahb.scala 348:93]
    node _T_543 = or(_T_540, _T_542) @[axi4_to_ahb.scala 348:72]
    node _T_544 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 349:18]
    node _T_545 = eq(_T_544, UInt<2>("h03")) @[axi4_to_ahb.scala 349:25]
    node _T_546 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 349:55]
    node _T_547 = eq(_T_546, UInt<2>("h03")) @[axi4_to_ahb.scala 349:62]
    node _T_548 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 349:90]
    node _T_549 = eq(_T_548, UInt<4>("h0c")) @[axi4_to_ahb.scala 349:97]
    node _T_550 = or(_T_547, _T_549) @[axi4_to_ahb.scala 349:74]
    node _T_551 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 349:125]
    node _T_552 = eq(_T_551, UInt<6>("h030")) @[axi4_to_ahb.scala 349:132]
    node _T_553 = or(_T_550, _T_552) @[axi4_to_ahb.scala 349:109]
    node _T_554 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 349:161]
    node _T_555 = eq(_T_554, UInt<8>("h0c0")) @[axi4_to_ahb.scala 349:168]
    node _T_556 = or(_T_553, _T_555) @[axi4_to_ahb.scala 349:145]
    node _T_557 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:21]
    node _T_558 = eq(_T_557, UInt<4>("h0f")) @[axi4_to_ahb.scala 350:28]
    node _T_559 = or(_T_556, _T_558) @[axi4_to_ahb.scala 349:181]
    node _T_560 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:56]
    node _T_561 = eq(_T_560, UInt<8>("h0f0")) @[axi4_to_ahb.scala 350:63]
    node _T_562 = or(_T_559, _T_561) @[axi4_to_ahb.scala 350:40]
    node _T_563 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 350:92]
    node _T_564 = eq(_T_563, UInt<8>("h0ff")) @[axi4_to_ahb.scala 350:99]
    node _T_565 = or(_T_562, _T_564) @[axi4_to_ahb.scala 350:76]
    node _T_566 = and(_T_545, _T_565) @[axi4_to_ahb.scala 349:38]
    node _T_567 = or(_T_543, _T_566) @[axi4_to_ahb.scala 348:106]
    buf_aligned_in <= _T_567 @[axi4_to_ahb.scala 347:18]
    node _T_568 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 352:39]
    node _T_569 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 352:58]
    node _T_570 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 352:83]
    node _T_571 = cat(_T_569, _T_570) @[Cat.scala 29:58]
    node _T_572 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 352:104]
    node _T_573 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 352:129]
    node _T_574 = cat(_T_572, _T_573) @[Cat.scala 29:58]
    node _T_575 = mux(_T_568, _T_571, _T_574) @[axi4_to_ahb.scala 352:22]
    io.ahb_haddr <= _T_575 @[axi4_to_ahb.scala 352:16]
    node _T_576 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 353:39]
    node _T_577 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_578 = mux(_T_577, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_579 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 353:90]
    node _T_580 = and(_T_578, _T_579) @[axi4_to_ahb.scala 353:77]
    node _T_581 = cat(UInt<1>("h00"), _T_580) @[Cat.scala 29:58]
    node _T_582 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_583 = mux(_T_582, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_584 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 353:144]
    node _T_585 = and(_T_583, _T_584) @[axi4_to_ahb.scala 353:134]
    node _T_586 = cat(UInt<1>("h00"), _T_585) @[Cat.scala 29:58]
    node _T_587 = mux(_T_576, _T_581, _T_586) @[axi4_to_ahb.scala 353:22]
    io.ahb_hsize <= _T_587 @[axi4_to_ahb.scala 353:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 355:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 356:20]
    node _T_588 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 357:47]
    node _T_589 = not(_T_588) @[axi4_to_ahb.scala 357:33]
    node _T_590 = cat(UInt<1>("h01"), _T_589) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_590 @[axi4_to_ahb.scala 357:16]
    node _T_591 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 358:40]
    node _T_592 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 358:55]
    node _T_593 = eq(_T_592, UInt<1>("h01")) @[axi4_to_ahb.scala 358:62]
    node _T_594 = mux(_T_591, _T_593, buf_write) @[axi4_to_ahb.scala 358:23]
    io.ahb_hwrite <= _T_594 @[axi4_to_ahb.scala 358:17]
    node _T_595 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 359:28]
    io.ahb_hwdata <= _T_595 @[axi4_to_ahb.scala 359:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 361:15]
    node _T_596 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 362:43]
    node _T_597 = mux(_T_596, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 362:23]
    node _T_598 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_599 = mux(_T_598, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_600 = and(_T_599, UInt<2>("h02")) @[axi4_to_ahb.scala 362:88]
    node _T_601 = cat(_T_597, _T_600) @[Cat.scala 29:58]
    slave_opc <= _T_601 @[axi4_to_ahb.scala 362:13]
    node _T_602 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 363:41]
    node _T_603 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 363:66]
    node _T_604 = cat(_T_603, _T_603) @[Cat.scala 29:58]
    node _T_605 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 363:91]
    node _T_606 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 363:110]
    node _T_607 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 363:131]
    node _T_608 = mux(_T_605, _T_606, _T_607) @[axi4_to_ahb.scala 363:79]
    node _T_609 = mux(_T_602, _T_604, _T_608) @[axi4_to_ahb.scala 363:21]
    slave_rdata <= _T_609 @[axi4_to_ahb.scala 363:15]
    node _T_610 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 364:26]
    slave_tag <= _T_610 @[axi4_to_ahb.scala 364:13]
    node _T_611 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 366:33]
    node _T_612 = neq(_T_611, UInt<1>("h00")) @[axi4_to_ahb.scala 366:40]
    node _T_613 = and(_T_612, io.ahb_hready) @[axi4_to_ahb.scala 366:52]
    node _T_614 = and(_T_613, io.ahb_hwrite) @[axi4_to_ahb.scala 366:68]
    last_addr_en <= _T_614 @[axi4_to_ahb.scala 366:16]
    node _T_615 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 368:30]
    node _T_616 = and(_T_615, master_ready) @[axi4_to_ahb.scala 368:47]
    wrbuf_en <= _T_616 @[axi4_to_ahb.scala 368:12]
    node _T_617 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 369:34]
    node _T_618 = and(_T_617, master_ready) @[axi4_to_ahb.scala 369:50]
    wrbuf_data_en <= _T_618 @[axi4_to_ahb.scala 369:17]
    node _T_619 = and(master_valid, master_ready) @[axi4_to_ahb.scala 370:34]
    node _T_620 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 370:62]
    node _T_621 = eq(_T_620, UInt<1>("h01")) @[axi4_to_ahb.scala 370:69]
    node _T_622 = and(_T_619, _T_621) @[axi4_to_ahb.scala 370:49]
    wrbuf_cmd_sent <= _T_622 @[axi4_to_ahb.scala 370:18]
    node _T_623 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 371:33]
    node _T_624 = and(wrbuf_cmd_sent, _T_623) @[axi4_to_ahb.scala 371:31]
    wrbuf_rst <= _T_624 @[axi4_to_ahb.scala 371:13]
    node _T_625 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 373:35]
    node _T_626 = and(wrbuf_vld, _T_625) @[axi4_to_ahb.scala 373:33]
    node _T_627 = eq(_T_626, UInt<1>("h00")) @[axi4_to_ahb.scala 373:21]
    node _T_628 = and(_T_627, master_ready) @[axi4_to_ahb.scala 373:52]
    io.axi_awready <= _T_628 @[axi4_to_ahb.scala 373:18]
    node _T_629 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 374:39]
    node _T_630 = and(wrbuf_data_vld, _T_629) @[axi4_to_ahb.scala 374:37]
    node _T_631 = eq(_T_630, UInt<1>("h00")) @[axi4_to_ahb.scala 374:20]
    node _T_632 = and(_T_631, master_ready) @[axi4_to_ahb.scala 374:56]
    io.axi_wready <= _T_632 @[axi4_to_ahb.scala 374:17]
    node _T_633 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 375:33]
    node _T_634 = eq(_T_633, UInt<1>("h00")) @[axi4_to_ahb.scala 375:21]
    node _T_635 = and(_T_634, master_ready) @[axi4_to_ahb.scala 375:51]
    io.axi_arready <= _T_635 @[axi4_to_ahb.scala 375:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 376:16]
    node _T_636 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 379:68]
    node _T_637 = mux(_T_636, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 379:52]
    node _T_638 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 379:88]
    node _T_639 = and(_T_637, _T_638) @[axi4_to_ahb.scala 379:86]
    reg _T_640 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 379:48]
    _T_640 <= _T_639 @[axi4_to_ahb.scala 379:48]
    wrbuf_vld <= _T_640 @[axi4_to_ahb.scala 379:18]
    node _T_641 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 380:73]
    node _T_642 = mux(_T_641, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 380:52]
    node _T_643 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 380:99]
    node _T_644 = and(_T_642, _T_643) @[axi4_to_ahb.scala 380:97]
    reg _T_645 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 380:48]
    _T_645 <= _T_644 @[axi4_to_ahb.scala 380:48]
    wrbuf_data_vld <= _T_645 @[axi4_to_ahb.scala 380:18]
    node _T_646 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 382:57]
    node _T_647 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 382:91]
    reg _T_648 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_647 : @[Reg.scala 28:19]
      _T_648 <= _T_646 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_648 @[axi4_to_ahb.scala 382:13]
    node _T_649 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 383:60]
    node _T_650 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 383:88]
    reg _T_651 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_650 : @[Reg.scala 28:19]
      _T_651 <= _T_649 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_651 @[axi4_to_ahb.scala 383:14]
    node _T_652 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 385:48]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_652 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_653 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_653 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_653 @[axi4_to_ahb.scala 385:14]
    node _T_654 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 386:52]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_654 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_655 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_655 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_655 @[axi4_to_ahb.scala 386:14]
    node _T_656 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 389:27]
    node _T_657 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 389:60]
    reg _T_658 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_657 : @[Reg.scala 28:19]
      _T_658 <= _T_656 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_658 @[axi4_to_ahb.scala 388:16]
    node _T_659 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 392:27]
    node _T_660 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 392:60]
    reg _T_661 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_660 : @[Reg.scala 28:19]
      _T_661 <= _T_659 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_661 @[axi4_to_ahb.scala 391:17]
    node _T_662 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 400:50]
    reg _T_663 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_662 : @[Reg.scala 28:19]
      _T_663 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_663 @[axi4_to_ahb.scala 399:13]
    node _T_664 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 403:25]
    node _T_665 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 403:60]
    reg _T_666 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_665 : @[Reg.scala 28:19]
      _T_666 <= _T_664 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_666 @[axi4_to_ahb.scala 402:11]
    node _T_667 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 406:33]
    node _T_668 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 406:52]
    node _T_669 = bits(_T_668, 0, 0) @[axi4_to_ahb.scala 406:69]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_669 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_670 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_670 <= _T_667 @[el2_lib.scala 514:16]
    buf_addr <= _T_670 @[axi4_to_ahb.scala 406:12]
    node _T_671 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 409:26]
    node _T_672 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 409:55]
    reg _T_673 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_672 : @[Reg.scala 28:19]
      _T_673 <= _T_671 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_673 @[axi4_to_ahb.scala 408:12]
    node _T_674 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 412:52]
    reg _T_675 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_674 : @[Reg.scala 28:19]
      _T_675 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_675 @[axi4_to_ahb.scala 411:15]
    node _T_676 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 415:28]
    node _T_677 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 415:57]
    reg _T_678 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_677 : @[Reg.scala 28:19]
      _T_678 <= _T_676 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_678 @[axi4_to_ahb.scala 414:14]
    node _T_679 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 418:33]
    node _T_680 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 418:57]
    node _T_681 = bits(_T_680, 0, 0) @[axi4_to_ahb.scala 418:80]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_681 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_682 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_682 <= _T_679 @[el2_lib.scala 514:16]
    buf_data <= _T_682 @[axi4_to_ahb.scala 418:12]
    node _T_683 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 421:50]
    reg _T_684 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_683 : @[Reg.scala 28:19]
      _T_684 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_684 @[axi4_to_ahb.scala 420:16]
    node _T_685 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 424:22]
    node _T_686 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 424:60]
    reg _T_687 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_686 : @[Reg.scala 28:19]
      _T_687 <= _T_685 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_687 @[axi4_to_ahb.scala 423:14]
    node _T_688 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 427:59]
    reg _T_689 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_688 : @[Reg.scala 28:19]
      _T_689 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_689 @[axi4_to_ahb.scala 426:16]
    node _T_690 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 431:32]
    node _T_691 = mux(_T_690, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 431:16]
    node _T_692 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 431:52]
    node _T_693 = and(_T_691, _T_692) @[axi4_to_ahb.scala 431:50]
    reg _T_694 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 431:12]
    _T_694 <= _T_693 @[axi4_to_ahb.scala 431:12]
    cmd_doneQ <= _T_694 @[axi4_to_ahb.scala 430:13]
    node _T_695 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 435:31]
    node _T_696 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 435:70]
    reg _T_697 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_696 : @[Reg.scala 28:19]
      _T_697 <= _T_695 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_697 @[axi4_to_ahb.scala 434:21]
    reg _T_698 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 440:12]
    _T_698 <= io.ahb_hready @[axi4_to_ahb.scala 440:12]
    ahb_hready_q <= _T_698 @[axi4_to_ahb.scala 439:16]
    node _T_699 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 443:26]
    reg _T_700 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 443:12]
    _T_700 <= _T_699 @[axi4_to_ahb.scala 443:12]
    ahb_htrans_q <= _T_700 @[axi4_to_ahb.scala 442:16]
    reg _T_701 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 446:12]
    _T_701 <= io.ahb_hwrite @[axi4_to_ahb.scala 446:12]
    ahb_hwrite_q <= _T_701 @[axi4_to_ahb.scala 445:16]
    reg _T_702 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 449:12]
    _T_702 <= io.ahb_hresp @[axi4_to_ahb.scala 449:12]
    ahb_hresp_q <= _T_702 @[axi4_to_ahb.scala 448:15]
    node _T_703 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 452:26]
    reg _T_704 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 452:12]
    _T_704 <= _T_703 @[axi4_to_ahb.scala 452:12]
    ahb_hrdata_q <= _T_704 @[axi4_to_ahb.scala 451:16]
    node _T_705 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 455:43]
    node _T_706 = or(_T_705, io.clk_override) @[axi4_to_ahb.scala 455:58]
    node _T_707 = and(io.bus_clk_en, _T_706) @[axi4_to_ahb.scala 455:30]
    buf_clken <= _T_707 @[axi4_to_ahb.scala 455:13]
    node _T_708 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 456:69]
    node _T_709 = and(io.ahb_hready, _T_708) @[axi4_to_ahb.scala 456:54]
    node _T_710 = or(_T_709, io.clk_override) @[axi4_to_ahb.scala 456:74]
    node _T_711 = and(io.bus_clk_en, _T_710) @[axi4_to_ahb.scala 456:36]
    ahbm_addr_clken <= _T_711 @[axi4_to_ahb.scala 456:19]
    node _T_712 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 457:50]
    node _T_713 = or(_T_712, io.clk_override) @[axi4_to_ahb.scala 457:60]
    node _T_714 = and(io.bus_clk_en, _T_713) @[axi4_to_ahb.scala 457:36]
    ahbm_data_clken <= _T_714 @[axi4_to_ahb.scala 457:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 460:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 461:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 462:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 463:17]
    
