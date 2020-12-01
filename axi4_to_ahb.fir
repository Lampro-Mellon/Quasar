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
    
    wire buf_state : UInt<3>
    buf_state <= UInt<3>("h00")
    wire buf_nxtstate : UInt<3>
    buf_nxtstate <= UInt<3>("h00")
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
    wire bus_clk : Clock @[axi4_to_ahb.scala 82:21]
    wire bus_write_clk : Clock @[axi4_to_ahb.scala 83:27]
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
    wire buf_rst : UInt<1>
    buf_rst <= UInt<1>("h00")
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
    wire buf_state_en : UInt<1>
    buf_state_en <= UInt<1>("h00")
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
    wire buf_clk : Clock @[axi4_to_ahb.scala 150:21]
    wire ahbm_clk : Clock @[axi4_to_ahb.scala 152:22]
    wire ahbm_addr_clk : Clock @[axi4_to_ahb.scala 153:27]
    wire ahbm_data_clk : Clock @[axi4_to_ahb.scala 154:27]
    node _T = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 192:27]
    wr_cmd_vld <= _T @[axi4_to_ahb.scala 192:14]
    node _T_1 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 193:30]
    master_valid <= _T_1 @[axi4_to_ahb.scala 193:16]
    node _T_2 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 194:38]
    node _T_3 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 194:51]
    node _T_4 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 194:76]
    node _T_5 = mux(_T_2, _T_3, _T_4) @[axi4_to_ahb.scala 194:20]
    master_tag <= _T_5 @[axi4_to_ahb.scala 194:14]
    node _T_6 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 195:38]
    node _T_7 = mux(_T_6, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 195:20]
    master_opc <= _T_7 @[axi4_to_ahb.scala 195:14]
    node _T_8 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 196:39]
    node _T_9 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 196:53]
    node _T_10 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 196:75]
    node _T_11 = mux(_T_8, _T_9, _T_10) @[axi4_to_ahb.scala 196:21]
    master_addr <= _T_11 @[axi4_to_ahb.scala 196:15]
    node _T_12 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 197:39]
    node _T_13 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 197:53]
    node _T_14 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 197:74]
    node _T_15 = mux(_T_12, _T_13, _T_14) @[axi4_to_ahb.scala 197:21]
    master_size <= _T_15 @[axi4_to_ahb.scala 197:15]
    node _T_16 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 198:32]
    master_byteen <= _T_16 @[axi4_to_ahb.scala 198:17]
    node _T_17 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 199:29]
    master_wdata <= _T_17 @[axi4_to_ahb.scala 199:16]
    node _T_18 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 202:32]
    node _T_19 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 202:57]
    node _T_20 = and(_T_18, _T_19) @[axi4_to_ahb.scala 202:46]
    io.axi_bvalid <= _T_20 @[axi4_to_ahb.scala 202:17]
    node _T_21 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 203:32]
    node _T_22 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 203:59]
    node _T_23 = mux(_T_22, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 203:49]
    node _T_24 = mux(_T_21, UInt<2>("h02"), _T_23) @[axi4_to_ahb.scala 203:22]
    io.axi_bresp <= _T_24 @[axi4_to_ahb.scala 203:16]
    node _T_25 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 204:26]
    io.axi_bid <= _T_25 @[axi4_to_ahb.scala 204:14]
    node _T_26 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 206:32]
    node _T_27 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 206:58]
    node _T_28 = eq(_T_27, UInt<1>("h00")) @[axi4_to_ahb.scala 206:65]
    node _T_29 = and(_T_26, _T_28) @[axi4_to_ahb.scala 206:46]
    io.axi_rvalid <= _T_29 @[axi4_to_ahb.scala 206:17]
    node _T_30 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 207:32]
    node _T_31 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 207:59]
    node _T_32 = mux(_T_31, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 207:49]
    node _T_33 = mux(_T_30, UInt<2>("h02"), _T_32) @[axi4_to_ahb.scala 207:22]
    io.axi_rresp <= _T_33 @[axi4_to_ahb.scala 207:16]
    node _T_34 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 208:26]
    io.axi_rid <= _T_34 @[axi4_to_ahb.scala 208:14]
    node _T_35 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 209:30]
    io.axi_rdata <= _T_35 @[axi4_to_ahb.scala 209:16]
    node _T_36 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 210:32]
    slave_ready <= _T_36 @[axi4_to_ahb.scala 210:15]
    node _T_37 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 213:56]
    node _T_38 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 213:91]
    node _T_39 = or(_T_37, _T_38) @[axi4_to_ahb.scala 213:74]
    node _T_40 = and(io.bus_clk_en, _T_39) @[axi4_to_ahb.scala 213:37]
    bus_write_clk_en <= _T_40 @[axi4_to_ahb.scala 213:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 215:11]
    node _T_41 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 216:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_41 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 216:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 219:17]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 221:16]
    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 222:18]
    buf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 223:18]
    buf_data_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 224:18]
    slvbuf_error_in <= UInt<1>("h00") @[axi4_to_ahb.scala 225:21]
    slvbuf_error_en <= UInt<1>("h00") @[axi4_to_ahb.scala 226:21]
    buf_write_in <= UInt<1>("h00") @[axi4_to_ahb.scala 227:18]
    cmd_done <= UInt<1>("h00") @[axi4_to_ahb.scala 228:18]
    trxn_done <= UInt<1>("h00") @[axi4_to_ahb.scala 229:18]
    buf_cmd_byte_ptr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 230:23]
    buf_cmd_byte_ptr <= UInt<1>("h00") @[axi4_to_ahb.scala 231:20]
    slave_valid_pre <= UInt<1>("h00") @[axi4_to_ahb.scala 232:21]
    slvbuf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 233:19]
    bypass_en <= UInt<1>("h00") @[axi4_to_ahb.scala 234:20]
    rd_bypass_idle <= UInt<1>("h00") @[axi4_to_ahb.scala 235:18]
    node _T_42 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_42 : @[Conditional.scala 40:58]
      node _T_43 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 240:34]
      node _T_44 = eq(_T_43, UInt<1>("h01")) @[axi4_to_ahb.scala 240:41]
      buf_write_in <= _T_44 @[axi4_to_ahb.scala 240:20]
      node _T_45 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 241:49]
      node _T_46 = mux(_T_45, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 241:29]
      node _T_47 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 242:36]
      buf_state_en <= _T_47 @[axi4_to_ahb.scala 242:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 243:17]
      node _T_48 = eq(_T_46, UInt<3>("h02")) @[axi4_to_ahb.scala 244:54]
      node _T_49 = and(buf_state_en, _T_48) @[axi4_to_ahb.scala 244:38]
      buf_data_wr_en <= _T_49 @[axi4_to_ahb.scala 244:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 245:27]
      node _T_50 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 247:50]
      node _T_51 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 247:92]
      node _T_52 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
      node _T_53 = tail(_T_52, 1) @[axi4_to_ahb.scala 176:52]
      node _T_54 = mux(UInt<1>("h00"), _T_53, UInt<1>("h00")) @[axi4_to_ahb.scala 176:24]
      node _T_55 = bits(_T_51, 0, 0) @[axi4_to_ahb.scala 177:44]
      node _T_56 = geq(UInt<1>("h00"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_57 = and(_T_55, _T_56) @[axi4_to_ahb.scala 177:48]
      node _T_58 = bits(_T_51, 1, 1) @[axi4_to_ahb.scala 177:44]
      node _T_59 = geq(UInt<1>("h01"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_60 = and(_T_58, _T_59) @[axi4_to_ahb.scala 177:48]
      node _T_61 = bits(_T_51, 2, 2) @[axi4_to_ahb.scala 177:44]
      node _T_62 = geq(UInt<2>("h02"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_63 = and(_T_61, _T_62) @[axi4_to_ahb.scala 177:48]
      node _T_64 = bits(_T_51, 3, 3) @[axi4_to_ahb.scala 177:44]
      node _T_65 = geq(UInt<2>("h03"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_66 = and(_T_64, _T_65) @[axi4_to_ahb.scala 177:48]
      node _T_67 = bits(_T_51, 4, 4) @[axi4_to_ahb.scala 177:44]
      node _T_68 = geq(UInt<3>("h04"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_69 = and(_T_67, _T_68) @[axi4_to_ahb.scala 177:48]
      node _T_70 = bits(_T_51, 5, 5) @[axi4_to_ahb.scala 177:44]
      node _T_71 = geq(UInt<3>("h05"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_72 = and(_T_70, _T_71) @[axi4_to_ahb.scala 177:48]
      node _T_73 = bits(_T_51, 6, 6) @[axi4_to_ahb.scala 177:44]
      node _T_74 = geq(UInt<3>("h06"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_75 = and(_T_73, _T_74) @[axi4_to_ahb.scala 177:48]
      node _T_76 = bits(_T_51, 7, 7) @[axi4_to_ahb.scala 177:44]
      node _T_77 = geq(UInt<3>("h07"), _T_54) @[axi4_to_ahb.scala 177:62]
      node _T_78 = and(_T_76, _T_77) @[axi4_to_ahb.scala 177:48]
      node _T_79 = mux(_T_78, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_80 = mux(_T_75, UInt<3>("h06"), _T_79) @[Mux.scala 98:16]
      node _T_81 = mux(_T_72, UInt<3>("h05"), _T_80) @[Mux.scala 98:16]
      node _T_82 = mux(_T_69, UInt<3>("h04"), _T_81) @[Mux.scala 98:16]
      node _T_83 = mux(_T_66, UInt<2>("h03"), _T_82) @[Mux.scala 98:16]
      node _T_84 = mux(_T_63, UInt<2>("h02"), _T_83) @[Mux.scala 98:16]
      node _T_85 = mux(_T_60, UInt<1>("h01"), _T_84) @[Mux.scala 98:16]
      node _T_86 = mux(_T_57, UInt<1>("h00"), _T_85) @[Mux.scala 98:16]
      node _T_87 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 247:141]
      node _T_88 = mux(_T_50, _T_86, _T_87) @[axi4_to_ahb.scala 247:30]
      buf_cmd_byte_ptr <= _T_88 @[axi4_to_ahb.scala 247:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 248:17]
      node _T_89 = eq(_T_46, UInt<3>("h01")) @[axi4_to_ahb.scala 249:51]
      node _T_90 = and(bypass_en, _T_89) @[axi4_to_ahb.scala 249:35]
      rd_bypass_idle <= _T_90 @[axi4_to_ahb.scala 249:22]
      node _T_91 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_92 = mux(_T_91, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_93 = and(_T_92, UInt<2>("h02")) @[axi4_to_ahb.scala 250:45]
      io.ahb_htrans <= _T_93 @[axi4_to_ahb.scala 250:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_94 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_94 : @[Conditional.scala 39:67]
        node _T_95 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 254:56]
        node _T_96 = eq(_T_95, UInt<1>("h00")) @[axi4_to_ahb.scala 254:63]
        node _T_97 = and(master_valid, _T_96) @[axi4_to_ahb.scala 254:43]
        node _T_98 = bits(_T_97, 0, 0) @[axi4_to_ahb.scala 254:84]
        node _T_99 = mux(_T_98, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 254:28]
        node _T_100 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 255:51]
        node _T_101 = neq(_T_100, UInt<1>("h00")) @[axi4_to_ahb.scala 255:58]
        node _T_102 = and(ahb_hready_q, _T_101) @[axi4_to_ahb.scala 255:36]
        node _T_103 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 255:72]
        node _T_104 = and(_T_102, _T_103) @[axi4_to_ahb.scala 255:70]
        buf_state_en <= _T_104 @[axi4_to_ahb.scala 255:20]
        node _T_105 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 256:34]
        node _T_106 = and(buf_state_en, _T_105) @[axi4_to_ahb.scala 256:32]
        cmd_done <= _T_106 @[axi4_to_ahb.scala 256:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 257:20]
        node _T_107 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 258:55]
        node _T_108 = neq(_T_107, UInt<1>("h00")) @[axi4_to_ahb.scala 258:62]
        node _T_109 = and(ahb_hready_q, _T_108) @[axi4_to_ahb.scala 258:40]
        node _T_110 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 258:76]
        node _T_111 = and(_T_109, _T_110) @[axi4_to_ahb.scala 258:74]
        node _T_112 = eq(_T_99, UInt<3>("h06")) @[axi4_to_ahb.scala 258:107]
        node _T_113 = and(_T_111, _T_112) @[axi4_to_ahb.scala 258:91]
        buf_wr_en <= _T_113 @[axi4_to_ahb.scala 259:17]
        node _T_114 = and(_T_113, master_valid) @[axi4_to_ahb.scala 260:33]
        bypass_en <= _T_114 @[axi4_to_ahb.scala 260:17]
        node _T_115 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 261:47]
        node _T_116 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 261:62]
        node _T_117 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 261:78]
        node _T_118 = mux(_T_115, _T_116, _T_117) @[axi4_to_ahb.scala 261:30]
        buf_cmd_byte_ptr <= _T_118 @[axi4_to_ahb.scala 261:24]
        node _T_119 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 262:44]
        node _T_120 = or(_T_119, bypass_en) @[axi4_to_ahb.scala 262:58]
        node _T_121 = bits(_T_120, 0, 0) @[Bitwise.scala 72:15]
        node _T_122 = mux(_T_121, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_123 = and(UInt<2>("h02"), _T_122) @[axi4_to_ahb.scala 262:32]
        io.ahb_htrans <= _T_123 @[axi4_to_ahb.scala 262:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_124 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_124 : @[Conditional.scala 39:67]
          node _T_125 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 266:41]
          node _T_126 = and(ahb_hready_q, _T_125) @[axi4_to_ahb.scala 266:39]
          node _T_127 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 266:84]
          node _T_128 = eq(_T_127, UInt<1>("h01")) @[axi4_to_ahb.scala 266:91]
          node _T_129 = and(master_valid, _T_128) @[axi4_to_ahb.scala 266:72]
          node _T_130 = eq(_T_129, UInt<1>("h00")) @[axi4_to_ahb.scala 266:57]
          node _T_131 = and(_T_126, _T_130) @[axi4_to_ahb.scala 266:55]
          node _T_132 = and(master_valid, _T_131) @[axi4_to_ahb.scala 267:34]
          node _T_133 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 267:62]
          node _T_134 = eq(_T_133, UInt<1>("h00")) @[axi4_to_ahb.scala 267:69]
          node _T_135 = and(_T_132, _T_134) @[axi4_to_ahb.scala 267:49]
          buf_wr_en <= _T_135 @[axi4_to_ahb.scala 267:17]
          node _T_136 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 268:47]
          node _T_137 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 268:86]
          node _T_138 = mux(_T_137, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 268:69]
          node _T_139 = mux(_T_136, UInt<3>("h07"), _T_138) @[axi4_to_ahb.scala 268:28]
          node _T_140 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 269:37]
          buf_state_en <= _T_140 @[axi4_to_ahb.scala 269:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 270:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 271:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 272:23]
          node _T_141 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 273:41]
          node _T_142 = and(buf_state_en, _T_141) @[axi4_to_ahb.scala 273:39]
          slave_valid_pre <= _T_142 @[axi4_to_ahb.scala 273:23]
          node _T_143 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 274:34]
          node _T_144 = and(buf_state_en, _T_143) @[axi4_to_ahb.scala 274:32]
          cmd_done <= _T_144 @[axi4_to_ahb.scala 274:16]
          node _T_145 = and(_T_131, master_valid) @[axi4_to_ahb.scala 275:33]
          node _T_146 = eq(_T_139, UInt<3>("h06")) @[axi4_to_ahb.scala 275:64]
          node _T_147 = and(_T_145, _T_146) @[axi4_to_ahb.scala 275:48]
          node _T_148 = and(_T_147, buf_state_en) @[axi4_to_ahb.scala 275:79]
          bypass_en <= _T_148 @[axi4_to_ahb.scala 275:17]
          node _T_149 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 276:47]
          node _T_150 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 276:62]
          node _T_151 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 276:78]
          node _T_152 = mux(_T_149, _T_150, _T_151) @[axi4_to_ahb.scala 276:30]
          buf_cmd_byte_ptr <= _T_152 @[axi4_to_ahb.scala 276:24]
          node _T_153 = neq(_T_139, UInt<3>("h06")) @[axi4_to_ahb.scala 277:59]
          node _T_154 = and(_T_153, buf_state_en) @[axi4_to_ahb.scala 277:74]
          node _T_155 = eq(_T_154, UInt<1>("h00")) @[axi4_to_ahb.scala 277:43]
          node _T_156 = bits(_T_155, 0, 0) @[Bitwise.scala 72:15]
          node _T_157 = mux(_T_156, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_158 = and(UInt<2>("h02"), _T_157) @[axi4_to_ahb.scala 277:32]
          io.ahb_htrans <= _T_158 @[axi4_to_ahb.scala 277:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 278:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_159 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_159 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 282:20]
            node _T_160 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 283:51]
            node _T_161 = neq(_T_160, UInt<1>("h00")) @[axi4_to_ahb.scala 283:58]
            node _T_162 = and(ahb_hready_q, _T_161) @[axi4_to_ahb.scala 283:36]
            node _T_163 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 283:72]
            node _T_164 = and(_T_162, _T_163) @[axi4_to_ahb.scala 283:70]
            buf_state_en <= _T_164 @[axi4_to_ahb.scala 283:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 284:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 285:20]
            node _T_165 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 286:35]
            buf_cmd_byte_ptr <= _T_165 @[axi4_to_ahb.scala 286:24]
            node _T_166 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 287:47]
            node _T_167 = bits(_T_166, 0, 0) @[Bitwise.scala 72:15]
            node _T_168 = mux(_T_167, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_169 = and(UInt<2>("h02"), _T_168) @[axi4_to_ahb.scala 287:37]
            io.ahb_htrans <= _T_169 @[axi4_to_ahb.scala 287:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_170 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_170 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 291:20]
              node _T_171 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 292:37]
              buf_state_en <= _T_171 @[axi4_to_ahb.scala 292:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 293:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 294:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 295:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 296:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_172 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_172 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 300:20]
                node _T_173 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 301:33]
                node _T_174 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 301:63]
                node _T_175 = neq(_T_174, UInt<1>("h00")) @[axi4_to_ahb.scala 301:70]
                node _T_176 = and(_T_173, _T_175) @[axi4_to_ahb.scala 301:48]
                trxn_done <= _T_176 @[axi4_to_ahb.scala 301:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 302:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 303:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 304:20]
                node _T_177 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 305:47]
                node _T_178 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 305:85]
                node _T_179 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 305:103]
                node _T_180 = add(_T_178, UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
                node _T_181 = tail(_T_180, 1) @[axi4_to_ahb.scala 176:52]
                node _T_182 = mux(UInt<1>("h01"), _T_181, _T_178) @[axi4_to_ahb.scala 176:24]
                node _T_183 = bits(_T_179, 0, 0) @[axi4_to_ahb.scala 177:44]
                node _T_184 = geq(UInt<1>("h00"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_185 = and(_T_183, _T_184) @[axi4_to_ahb.scala 177:48]
                node _T_186 = bits(_T_179, 1, 1) @[axi4_to_ahb.scala 177:44]
                node _T_187 = geq(UInt<1>("h01"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_188 = and(_T_186, _T_187) @[axi4_to_ahb.scala 177:48]
                node _T_189 = bits(_T_179, 2, 2) @[axi4_to_ahb.scala 177:44]
                node _T_190 = geq(UInt<2>("h02"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_191 = and(_T_189, _T_190) @[axi4_to_ahb.scala 177:48]
                node _T_192 = bits(_T_179, 3, 3) @[axi4_to_ahb.scala 177:44]
                node _T_193 = geq(UInt<2>("h03"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_194 = and(_T_192, _T_193) @[axi4_to_ahb.scala 177:48]
                node _T_195 = bits(_T_179, 4, 4) @[axi4_to_ahb.scala 177:44]
                node _T_196 = geq(UInt<3>("h04"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_197 = and(_T_195, _T_196) @[axi4_to_ahb.scala 177:48]
                node _T_198 = bits(_T_179, 5, 5) @[axi4_to_ahb.scala 177:44]
                node _T_199 = geq(UInt<3>("h05"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_200 = and(_T_198, _T_199) @[axi4_to_ahb.scala 177:48]
                node _T_201 = bits(_T_179, 6, 6) @[axi4_to_ahb.scala 177:44]
                node _T_202 = geq(UInt<3>("h06"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_203 = and(_T_201, _T_202) @[axi4_to_ahb.scala 177:48]
                node _T_204 = bits(_T_179, 7, 7) @[axi4_to_ahb.scala 177:44]
                node _T_205 = geq(UInt<3>("h07"), _T_182) @[axi4_to_ahb.scala 177:62]
                node _T_206 = and(_T_204, _T_205) @[axi4_to_ahb.scala 177:48]
                node _T_207 = mux(_T_206, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_208 = mux(_T_203, UInt<3>("h06"), _T_207) @[Mux.scala 98:16]
                node _T_209 = mux(_T_200, UInt<3>("h05"), _T_208) @[Mux.scala 98:16]
                node _T_210 = mux(_T_197, UInt<3>("h04"), _T_209) @[Mux.scala 98:16]
                node _T_211 = mux(_T_194, UInt<2>("h03"), _T_210) @[Mux.scala 98:16]
                node _T_212 = mux(_T_191, UInt<2>("h02"), _T_211) @[Mux.scala 98:16]
                node _T_213 = mux(_T_188, UInt<1>("h01"), _T_212) @[Mux.scala 98:16]
                node _T_214 = mux(_T_185, UInt<1>("h00"), _T_213) @[Mux.scala 98:16]
                node _T_215 = mux(_T_177, _T_214, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 305:30]
                buf_cmd_byte_ptr <= _T_215 @[axi4_to_ahb.scala 305:24]
                node _T_216 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 306:65]
                node _T_217 = or(buf_aligned, _T_216) @[axi4_to_ahb.scala 306:44]
                node _T_218 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 306:127]
                node _T_219 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 306:145]
                node _T_220 = add(_T_218, UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
                node _T_221 = tail(_T_220, 1) @[axi4_to_ahb.scala 176:52]
                node _T_222 = mux(UInt<1>("h01"), _T_221, _T_218) @[axi4_to_ahb.scala 176:24]
                node _T_223 = bits(_T_219, 0, 0) @[axi4_to_ahb.scala 177:44]
                node _T_224 = geq(UInt<1>("h00"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_225 = and(_T_223, _T_224) @[axi4_to_ahb.scala 177:48]
                node _T_226 = bits(_T_219, 1, 1) @[axi4_to_ahb.scala 177:44]
                node _T_227 = geq(UInt<1>("h01"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_228 = and(_T_226, _T_227) @[axi4_to_ahb.scala 177:48]
                node _T_229 = bits(_T_219, 2, 2) @[axi4_to_ahb.scala 177:44]
                node _T_230 = geq(UInt<2>("h02"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_231 = and(_T_229, _T_230) @[axi4_to_ahb.scala 177:48]
                node _T_232 = bits(_T_219, 3, 3) @[axi4_to_ahb.scala 177:44]
                node _T_233 = geq(UInt<2>("h03"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_234 = and(_T_232, _T_233) @[axi4_to_ahb.scala 177:48]
                node _T_235 = bits(_T_219, 4, 4) @[axi4_to_ahb.scala 177:44]
                node _T_236 = geq(UInt<3>("h04"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_237 = and(_T_235, _T_236) @[axi4_to_ahb.scala 177:48]
                node _T_238 = bits(_T_219, 5, 5) @[axi4_to_ahb.scala 177:44]
                node _T_239 = geq(UInt<3>("h05"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_240 = and(_T_238, _T_239) @[axi4_to_ahb.scala 177:48]
                node _T_241 = bits(_T_219, 6, 6) @[axi4_to_ahb.scala 177:44]
                node _T_242 = geq(UInt<3>("h06"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_243 = and(_T_241, _T_242) @[axi4_to_ahb.scala 177:48]
                node _T_244 = bits(_T_219, 7, 7) @[axi4_to_ahb.scala 177:44]
                node _T_245 = geq(UInt<3>("h07"), _T_222) @[axi4_to_ahb.scala 177:62]
                node _T_246 = and(_T_244, _T_245) @[axi4_to_ahb.scala 177:48]
                node _T_247 = mux(_T_246, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_248 = mux(_T_243, UInt<3>("h06"), _T_247) @[Mux.scala 98:16]
                node _T_249 = mux(_T_240, UInt<3>("h05"), _T_248) @[Mux.scala 98:16]
                node _T_250 = mux(_T_237, UInt<3>("h04"), _T_249) @[Mux.scala 98:16]
                node _T_251 = mux(_T_234, UInt<2>("h03"), _T_250) @[Mux.scala 98:16]
                node _T_252 = mux(_T_231, UInt<2>("h02"), _T_251) @[Mux.scala 98:16]
                node _T_253 = mux(_T_228, UInt<1>("h01"), _T_252) @[Mux.scala 98:16]
                node _T_254 = mux(_T_225, UInt<1>("h00"), _T_253) @[Mux.scala 98:16]
                node _T_255 = dshr(buf_byteen, _T_254) @[axi4_to_ahb.scala 306:92]
                node _T_256 = bits(_T_255, 0, 0) @[axi4_to_ahb.scala 306:92]
                node _T_257 = eq(_T_256, UInt<1>("h00")) @[axi4_to_ahb.scala 306:163]
                node _T_258 = or(_T_217, _T_257) @[axi4_to_ahb.scala 306:79]
                node _T_259 = and(trxn_done, _T_258) @[axi4_to_ahb.scala 306:29]
                cmd_done <= _T_259 @[axi4_to_ahb.scala 306:16]
                node _T_260 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 307:43]
                node _T_261 = eq(_T_260, UInt<1>("h00")) @[axi4_to_ahb.scala 307:32]
                node _T_262 = bits(_T_261, 0, 0) @[Bitwise.scala 72:15]
                node _T_263 = mux(_T_262, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_264 = and(_T_263, UInt<2>("h02")) @[axi4_to_ahb.scala 307:57]
                io.ahb_htrans <= _T_264 @[axi4_to_ahb.scala 307:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_265 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_265 : @[Conditional.scala 39:67]
                  node _T_266 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 311:34]
                  node _T_267 = or(_T_266, ahb_hresp_q) @[axi4_to_ahb.scala 311:50]
                  buf_state_en <= _T_267 @[axi4_to_ahb.scala 311:20]
                  node _T_268 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 312:37]
                  node _T_269 = or(_T_268, ahb_hresp_q) @[axi4_to_ahb.scala 312:53]
                  node _T_270 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 312:70]
                  node _T_271 = and(_T_269, _T_270) @[axi4_to_ahb.scala 312:68]
                  node _T_272 = and(_T_271, slave_ready) @[axi4_to_ahb.scala 312:83]
                  node _T_273 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 313:42]
                  node _T_274 = or(ahb_hresp_q, _T_273) @[axi4_to_ahb.scala 313:40]
                  node _T_275 = bits(_T_274, 0, 0) @[axi4_to_ahb.scala 313:62]
                  node _T_276 = and(master_valid, _T_272) @[axi4_to_ahb.scala 313:90]
                  node _T_277 = bits(_T_276, 0, 0) @[axi4_to_ahb.scala 313:112]
                  node _T_278 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 313:131]
                  node _T_279 = eq(_T_278, UInt<1>("h01")) @[axi4_to_ahb.scala 313:138]
                  node _T_280 = mux(_T_279, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 313:119]
                  node _T_281 = mux(_T_277, _T_280, UInt<3>("h00")) @[axi4_to_ahb.scala 313:75]
                  node _T_282 = mux(_T_275, UInt<3>("h05"), _T_281) @[axi4_to_ahb.scala 313:26]
                  buf_nxtstate <= _T_282 @[axi4_to_ahb.scala 313:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 314:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 315:23]
                  node _T_283 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 316:34]
                  node _T_284 = eq(_T_283, UInt<1>("h01")) @[axi4_to_ahb.scala 316:41]
                  buf_write_in <= _T_284 @[axi4_to_ahb.scala 316:20]
                  node _T_285 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 317:50]
                  node _T_286 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 317:78]
                  node _T_287 = or(_T_285, _T_286) @[axi4_to_ahb.scala 317:62]
                  node _T_288 = and(buf_state_en, _T_287) @[axi4_to_ahb.scala 317:33]
                  buf_wr_en <= _T_288 @[axi4_to_ahb.scala 317:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 318:22]
                  node _T_289 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 319:63]
                  node _T_290 = neq(_T_289, UInt<1>("h00")) @[axi4_to_ahb.scala 319:70]
                  node _T_291 = and(ahb_hready_q, _T_290) @[axi4_to_ahb.scala 319:48]
                  node _T_292 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 319:104]
                  node _T_293 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 319:166]
                  node _T_294 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 319:184]
                  node _T_295 = add(_T_293, UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
                  node _T_296 = tail(_T_295, 1) @[axi4_to_ahb.scala 176:52]
                  node _T_297 = mux(UInt<1>("h01"), _T_296, _T_293) @[axi4_to_ahb.scala 176:24]
                  node _T_298 = bits(_T_294, 0, 0) @[axi4_to_ahb.scala 177:44]
                  node _T_299 = geq(UInt<1>("h00"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_300 = and(_T_298, _T_299) @[axi4_to_ahb.scala 177:48]
                  node _T_301 = bits(_T_294, 1, 1) @[axi4_to_ahb.scala 177:44]
                  node _T_302 = geq(UInt<1>("h01"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_303 = and(_T_301, _T_302) @[axi4_to_ahb.scala 177:48]
                  node _T_304 = bits(_T_294, 2, 2) @[axi4_to_ahb.scala 177:44]
                  node _T_305 = geq(UInt<2>("h02"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_306 = and(_T_304, _T_305) @[axi4_to_ahb.scala 177:48]
                  node _T_307 = bits(_T_294, 3, 3) @[axi4_to_ahb.scala 177:44]
                  node _T_308 = geq(UInt<2>("h03"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_309 = and(_T_307, _T_308) @[axi4_to_ahb.scala 177:48]
                  node _T_310 = bits(_T_294, 4, 4) @[axi4_to_ahb.scala 177:44]
                  node _T_311 = geq(UInt<3>("h04"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_312 = and(_T_310, _T_311) @[axi4_to_ahb.scala 177:48]
                  node _T_313 = bits(_T_294, 5, 5) @[axi4_to_ahb.scala 177:44]
                  node _T_314 = geq(UInt<3>("h05"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_315 = and(_T_313, _T_314) @[axi4_to_ahb.scala 177:48]
                  node _T_316 = bits(_T_294, 6, 6) @[axi4_to_ahb.scala 177:44]
                  node _T_317 = geq(UInt<3>("h06"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_318 = and(_T_316, _T_317) @[axi4_to_ahb.scala 177:48]
                  node _T_319 = bits(_T_294, 7, 7) @[axi4_to_ahb.scala 177:44]
                  node _T_320 = geq(UInt<3>("h07"), _T_297) @[axi4_to_ahb.scala 177:62]
                  node _T_321 = and(_T_319, _T_320) @[axi4_to_ahb.scala 177:48]
                  node _T_322 = mux(_T_321, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_323 = mux(_T_318, UInt<3>("h06"), _T_322) @[Mux.scala 98:16]
                  node _T_324 = mux(_T_315, UInt<3>("h05"), _T_323) @[Mux.scala 98:16]
                  node _T_325 = mux(_T_312, UInt<3>("h04"), _T_324) @[Mux.scala 98:16]
                  node _T_326 = mux(_T_309, UInt<2>("h03"), _T_325) @[Mux.scala 98:16]
                  node _T_327 = mux(_T_306, UInt<2>("h02"), _T_326) @[Mux.scala 98:16]
                  node _T_328 = mux(_T_303, UInt<1>("h01"), _T_327) @[Mux.scala 98:16]
                  node _T_329 = mux(_T_300, UInt<1>("h00"), _T_328) @[Mux.scala 98:16]
                  node _T_330 = dshr(buf_byteen, _T_329) @[axi4_to_ahb.scala 319:131]
                  node _T_331 = bits(_T_330, 0, 0) @[axi4_to_ahb.scala 319:131]
                  node _T_332 = eq(_T_331, UInt<1>("h00")) @[axi4_to_ahb.scala 319:202]
                  node _T_333 = or(_T_292, _T_332) @[axi4_to_ahb.scala 319:118]
                  node _T_334 = and(_T_291, _T_333) @[axi4_to_ahb.scala 319:82]
                  node _T_335 = or(ahb_hresp_q, _T_334) @[axi4_to_ahb.scala 319:32]
                  cmd_done <= _T_335 @[axi4_to_ahb.scala 319:16]
                  node _T_336 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 320:33]
                  node _T_337 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 320:64]
                  node _T_338 = and(_T_336, _T_337) @[axi4_to_ahb.scala 320:48]
                  bypass_en <= _T_338 @[axi4_to_ahb.scala 320:17]
                  node _T_339 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 321:44]
                  node _T_340 = eq(_T_339, UInt<1>("h00")) @[axi4_to_ahb.scala 321:33]
                  node _T_341 = or(_T_340, bypass_en) @[axi4_to_ahb.scala 321:57]
                  node _T_342 = bits(_T_341, 0, 0) @[Bitwise.scala 72:15]
                  node _T_343 = mux(_T_342, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_344 = and(_T_343, UInt<2>("h02")) @[axi4_to_ahb.scala 321:71]
                  io.ahb_htrans <= _T_344 @[axi4_to_ahb.scala 321:21]
                  node _T_345 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 322:55]
                  node _T_346 = and(buf_state_en, _T_345) @[axi4_to_ahb.scala 322:39]
                  slave_valid_pre <= _T_346 @[axi4_to_ahb.scala 322:23]
                  node _T_347 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 323:33]
                  node _T_348 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 323:63]
                  node _T_349 = neq(_T_348, UInt<1>("h00")) @[axi4_to_ahb.scala 323:70]
                  node _T_350 = and(_T_347, _T_349) @[axi4_to_ahb.scala 323:48]
                  trxn_done <= _T_350 @[axi4_to_ahb.scala 323:17]
                  node _T_351 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 324:40]
                  buf_cmd_byte_ptr_en <= _T_351 @[axi4_to_ahb.scala 324:27]
                  node _T_352 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
                  node _T_353 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 327:85]
                  node _T_354 = add(_T_352, UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
                  node _T_355 = tail(_T_354, 1) @[axi4_to_ahb.scala 176:52]
                  node _T_356 = mux(UInt<1>("h00"), _T_355, _T_352) @[axi4_to_ahb.scala 176:24]
                  node _T_357 = bits(_T_353, 0, 0) @[axi4_to_ahb.scala 177:44]
                  node _T_358 = geq(UInt<1>("h00"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_359 = and(_T_357, _T_358) @[axi4_to_ahb.scala 177:48]
                  node _T_360 = bits(_T_353, 1, 1) @[axi4_to_ahb.scala 177:44]
                  node _T_361 = geq(UInt<1>("h01"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_362 = and(_T_360, _T_361) @[axi4_to_ahb.scala 177:48]
                  node _T_363 = bits(_T_353, 2, 2) @[axi4_to_ahb.scala 177:44]
                  node _T_364 = geq(UInt<2>("h02"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_365 = and(_T_363, _T_364) @[axi4_to_ahb.scala 177:48]
                  node _T_366 = bits(_T_353, 3, 3) @[axi4_to_ahb.scala 177:44]
                  node _T_367 = geq(UInt<2>("h03"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_368 = and(_T_366, _T_367) @[axi4_to_ahb.scala 177:48]
                  node _T_369 = bits(_T_353, 4, 4) @[axi4_to_ahb.scala 177:44]
                  node _T_370 = geq(UInt<3>("h04"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_371 = and(_T_369, _T_370) @[axi4_to_ahb.scala 177:48]
                  node _T_372 = bits(_T_353, 5, 5) @[axi4_to_ahb.scala 177:44]
                  node _T_373 = geq(UInt<3>("h05"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_374 = and(_T_372, _T_373) @[axi4_to_ahb.scala 177:48]
                  node _T_375 = bits(_T_353, 6, 6) @[axi4_to_ahb.scala 177:44]
                  node _T_376 = geq(UInt<3>("h06"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_377 = and(_T_375, _T_376) @[axi4_to_ahb.scala 177:48]
                  node _T_378 = bits(_T_353, 7, 7) @[axi4_to_ahb.scala 177:44]
                  node _T_379 = geq(UInt<3>("h07"), _T_356) @[axi4_to_ahb.scala 177:62]
                  node _T_380 = and(_T_378, _T_379) @[axi4_to_ahb.scala 177:48]
                  node _T_381 = mux(_T_380, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_382 = mux(_T_377, UInt<3>("h06"), _T_381) @[Mux.scala 98:16]
                  node _T_383 = mux(_T_374, UInt<3>("h05"), _T_382) @[Mux.scala 98:16]
                  node _T_384 = mux(_T_371, UInt<3>("h04"), _T_383) @[Mux.scala 98:16]
                  node _T_385 = mux(_T_368, UInt<2>("h03"), _T_384) @[Mux.scala 98:16]
                  node _T_386 = mux(_T_365, UInt<2>("h02"), _T_385) @[Mux.scala 98:16]
                  node _T_387 = mux(_T_362, UInt<1>("h01"), _T_386) @[Mux.scala 98:16]
                  node _T_388 = mux(_T_359, UInt<1>("h00"), _T_387) @[Mux.scala 98:16]
                  node _T_389 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 327:151]
                  node _T_390 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 327:169]
                  node _T_391 = add(_T_389, UInt<1>("h01")) @[axi4_to_ahb.scala 176:52]
                  node _T_392 = tail(_T_391, 1) @[axi4_to_ahb.scala 176:52]
                  node _T_393 = mux(UInt<1>("h01"), _T_392, _T_389) @[axi4_to_ahb.scala 176:24]
                  node _T_394 = bits(_T_390, 0, 0) @[axi4_to_ahb.scala 177:44]
                  node _T_395 = geq(UInt<1>("h00"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_396 = and(_T_394, _T_395) @[axi4_to_ahb.scala 177:48]
                  node _T_397 = bits(_T_390, 1, 1) @[axi4_to_ahb.scala 177:44]
                  node _T_398 = geq(UInt<1>("h01"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_399 = and(_T_397, _T_398) @[axi4_to_ahb.scala 177:48]
                  node _T_400 = bits(_T_390, 2, 2) @[axi4_to_ahb.scala 177:44]
                  node _T_401 = geq(UInt<2>("h02"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_402 = and(_T_400, _T_401) @[axi4_to_ahb.scala 177:48]
                  node _T_403 = bits(_T_390, 3, 3) @[axi4_to_ahb.scala 177:44]
                  node _T_404 = geq(UInt<2>("h03"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_405 = and(_T_403, _T_404) @[axi4_to_ahb.scala 177:48]
                  node _T_406 = bits(_T_390, 4, 4) @[axi4_to_ahb.scala 177:44]
                  node _T_407 = geq(UInt<3>("h04"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_408 = and(_T_406, _T_407) @[axi4_to_ahb.scala 177:48]
                  node _T_409 = bits(_T_390, 5, 5) @[axi4_to_ahb.scala 177:44]
                  node _T_410 = geq(UInt<3>("h05"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_411 = and(_T_409, _T_410) @[axi4_to_ahb.scala 177:48]
                  node _T_412 = bits(_T_390, 6, 6) @[axi4_to_ahb.scala 177:44]
                  node _T_413 = geq(UInt<3>("h06"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_414 = and(_T_412, _T_413) @[axi4_to_ahb.scala 177:48]
                  node _T_415 = bits(_T_390, 7, 7) @[axi4_to_ahb.scala 177:44]
                  node _T_416 = geq(UInt<3>("h07"), _T_393) @[axi4_to_ahb.scala 177:62]
                  node _T_417 = and(_T_415, _T_416) @[axi4_to_ahb.scala 177:48]
                  node _T_418 = mux(_T_417, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_419 = mux(_T_414, UInt<3>("h06"), _T_418) @[Mux.scala 98:16]
                  node _T_420 = mux(_T_411, UInt<3>("h05"), _T_419) @[Mux.scala 98:16]
                  node _T_421 = mux(_T_408, UInt<3>("h04"), _T_420) @[Mux.scala 98:16]
                  node _T_422 = mux(_T_405, UInt<2>("h03"), _T_421) @[Mux.scala 98:16]
                  node _T_423 = mux(_T_402, UInt<2>("h02"), _T_422) @[Mux.scala 98:16]
                  node _T_424 = mux(_T_399, UInt<1>("h01"), _T_423) @[Mux.scala 98:16]
                  node _T_425 = mux(_T_396, UInt<1>("h00"), _T_424) @[Mux.scala 98:16]
                  node _T_426 = mux(trxn_done, _T_425, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 327:106]
                  node _T_427 = mux(bypass_en, _T_388, _T_426) @[axi4_to_ahb.scala 327:30]
                  buf_cmd_byte_ptr <= _T_427 @[axi4_to_ahb.scala 327:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_428 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_428 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 330:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 331:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 332:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 333:23]
                    skip @[Conditional.scala 39:67]
    buf_rst <= UInt<1>("h00") @[axi4_to_ahb.scala 337:11]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 338:16]
    node _T_429 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 339:68]
    node _T_430 = eq(_T_429, UInt<1>("h01")) @[axi4_to_ahb.scala 339:75]
    node _T_431 = and(buf_aligned_in, _T_430) @[axi4_to_ahb.scala 339:55]
    node _T_432 = bits(_T_431, 0, 0) @[axi4_to_ahb.scala 339:95]
    node _T_433 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 339:127]
    wire _T_434 : UInt<8>
    _T_434 <= UInt<8>("h00")
    node _T_435 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 168:44]
    node _T_436 = eq(_T_435, UInt<8>("h0ff")) @[axi4_to_ahb.scala 168:51]
    node _T_437 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 168:75]
    node _T_438 = eq(_T_437, UInt<4>("h0f")) @[axi4_to_ahb.scala 168:82]
    node _T_439 = or(_T_436, _T_438) @[axi4_to_ahb.scala 168:64]
    node _T_440 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 168:106]
    node _T_441 = eq(_T_440, UInt<2>("h03")) @[axi4_to_ahb.scala 168:113]
    node _T_442 = or(_T_439, _T_441) @[axi4_to_ahb.scala 168:95]
    node _T_443 = bits(_T_442, 0, 0) @[Bitwise.scala 72:15]
    node _T_444 = mux(_T_443, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_445 = and(UInt<1>("h00"), _T_444) @[axi4_to_ahb.scala 168:24]
    node _T_446 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 169:35]
    node _T_447 = eq(_T_446, UInt<4>("h0c")) @[axi4_to_ahb.scala 169:42]
    node _T_448 = bits(_T_447, 0, 0) @[Bitwise.scala 72:15]
    node _T_449 = mux(_T_448, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_450 = and(UInt<2>("h02"), _T_449) @[axi4_to_ahb.scala 169:15]
    node _T_451 = or(_T_445, _T_450) @[axi4_to_ahb.scala 168:128]
    node _T_452 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 170:36]
    node _T_453 = eq(_T_452, UInt<8>("h0f0")) @[axi4_to_ahb.scala 170:43]
    node _T_454 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 170:67]
    node _T_455 = eq(_T_454, UInt<2>("h03")) @[axi4_to_ahb.scala 170:74]
    node _T_456 = or(_T_453, _T_455) @[axi4_to_ahb.scala 170:56]
    node _T_457 = bits(_T_456, 0, 0) @[Bitwise.scala 72:15]
    node _T_458 = mux(_T_457, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_459 = and(UInt<3>("h04"), _T_458) @[axi4_to_ahb.scala 170:15]
    node _T_460 = bits(_T_434, 7, 0) @[axi4_to_ahb.scala 171:37]
    node _T_461 = eq(_T_460, UInt<8>("h0c0")) @[axi4_to_ahb.scala 171:44]
    node _T_462 = bits(_T_461, 0, 0) @[Bitwise.scala 72:15]
    node _T_463 = mux(_T_462, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_464 = and(UInt<3>("h06"), _T_463) @[axi4_to_ahb.scala 171:17]
    node _T_465 = or(_T_459, _T_464) @[axi4_to_ahb.scala 170:90]
    node _T_466 = or(_T_451, _T_465) @[axi4_to_ahb.scala 169:58]
    node _T_467 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 339:147]
    node _T_468 = mux(_T_432, _T_466, _T_467) @[axi4_to_ahb.scala 339:38]
    node _T_469 = cat(master_addr, _T_468) @[Cat.scala 29:58]
    buf_addr_in <= _T_469 @[axi4_to_ahb.scala 339:15]
    node _T_470 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 340:27]
    buf_tag_in <= _T_470 @[axi4_to_ahb.scala 340:14]
    node _T_471 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 341:32]
    buf_byteen_in <= _T_471 @[axi4_to_ahb.scala 341:17]
    node _T_472 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 342:33]
    node _T_473 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 342:59]
    node _T_474 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 342:80]
    node _T_475 = mux(_T_472, _T_473, _T_474) @[axi4_to_ahb.scala 342:21]
    buf_data_in <= _T_475 @[axi4_to_ahb.scala 342:15]
    node _T_476 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 343:52]
    node _T_477 = eq(_T_476, UInt<2>("h03")) @[axi4_to_ahb.scala 343:59]
    node _T_478 = and(buf_aligned_in, _T_477) @[axi4_to_ahb.scala 343:38]
    node _T_479 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 343:85]
    node _T_480 = eq(_T_479, UInt<1>("h01")) @[axi4_to_ahb.scala 343:92]
    node _T_481 = and(_T_478, _T_480) @[axi4_to_ahb.scala 343:72]
    node _T_482 = bits(_T_481, 0, 0) @[axi4_to_ahb.scala 343:112]
    node _T_483 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 343:144]
    wire _T_484 : UInt<8>
    _T_484 <= UInt<8>("h00")
    node _T_485 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 160:43]
    node _T_486 = eq(_T_485, UInt<8>("h0ff")) @[axi4_to_ahb.scala 160:50]
    node _T_487 = bits(_T_486, 0, 0) @[Bitwise.scala 72:15]
    node _T_488 = mux(_T_487, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_489 = and(UInt<2>("h03"), _T_488) @[axi4_to_ahb.scala 160:25]
    node _T_490 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 161:34]
    node _T_491 = eq(_T_490, UInt<8>("h0f0")) @[axi4_to_ahb.scala 161:41]
    node _T_492 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 161:63]
    node _T_493 = eq(_T_492, UInt<4>("h0f")) @[axi4_to_ahb.scala 161:70]
    node _T_494 = or(_T_491, _T_493) @[axi4_to_ahb.scala 161:54]
    node _T_495 = bits(_T_494, 0, 0) @[Bitwise.scala 72:15]
    node _T_496 = mux(_T_495, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_497 = and(UInt<2>("h02"), _T_496) @[axi4_to_ahb.scala 161:16]
    node _T_498 = or(_T_489, _T_497) @[axi4_to_ahb.scala 160:65]
    node _T_499 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 162:34]
    node _T_500 = eq(_T_499, UInt<8>("h0c0")) @[axi4_to_ahb.scala 162:41]
    node _T_501 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 162:63]
    node _T_502 = eq(_T_501, UInt<6>("h030")) @[axi4_to_ahb.scala 162:70]
    node _T_503 = or(_T_500, _T_502) @[axi4_to_ahb.scala 162:54]
    node _T_504 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 162:92]
    node _T_505 = eq(_T_504, UInt<4>("h0c")) @[axi4_to_ahb.scala 162:99]
    node _T_506 = or(_T_503, _T_505) @[axi4_to_ahb.scala 162:83]
    node _T_507 = bits(_T_484, 7, 0) @[axi4_to_ahb.scala 162:121]
    node _T_508 = eq(_T_507, UInt<2>("h03")) @[axi4_to_ahb.scala 162:128]
    node _T_509 = or(_T_506, _T_508) @[axi4_to_ahb.scala 162:112]
    node _T_510 = bits(_T_509, 0, 0) @[Bitwise.scala 72:15]
    node _T_511 = mux(_T_510, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_512 = and(UInt<1>("h01"), _T_511) @[axi4_to_ahb.scala 162:16]
    node _T_513 = or(_T_498, _T_512) @[axi4_to_ahb.scala 161:86]
    node _T_514 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 343:164]
    node _T_515 = mux(_T_482, _T_513, _T_514) @[axi4_to_ahb.scala 343:21]
    buf_size_in <= _T_515 @[axi4_to_ahb.scala 343:15]
    node _T_516 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 344:32]
    node _T_517 = eq(_T_516, UInt<1>("h00")) @[axi4_to_ahb.scala 344:39]
    node _T_518 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 345:17]
    node _T_519 = eq(_T_518, UInt<1>("h00")) @[axi4_to_ahb.scala 345:24]
    node _T_520 = or(_T_517, _T_519) @[axi4_to_ahb.scala 344:51]
    node _T_521 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 345:50]
    node _T_522 = eq(_T_521, UInt<1>("h01")) @[axi4_to_ahb.scala 345:57]
    node _T_523 = or(_T_520, _T_522) @[axi4_to_ahb.scala 345:36]
    node _T_524 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 345:84]
    node _T_525 = eq(_T_524, UInt<2>("h02")) @[axi4_to_ahb.scala 345:91]
    node _T_526 = or(_T_523, _T_525) @[axi4_to_ahb.scala 345:70]
    node _T_527 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 346:18]
    node _T_528 = eq(_T_527, UInt<2>("h03")) @[axi4_to_ahb.scala 346:25]
    node _T_529 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 346:55]
    node _T_530 = eq(_T_529, UInt<2>("h03")) @[axi4_to_ahb.scala 346:62]
    node _T_531 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 346:90]
    node _T_532 = eq(_T_531, UInt<4>("h0c")) @[axi4_to_ahb.scala 346:97]
    node _T_533 = or(_T_530, _T_532) @[axi4_to_ahb.scala 346:74]
    node _T_534 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 346:125]
    node _T_535 = eq(_T_534, UInt<6>("h030")) @[axi4_to_ahb.scala 346:132]
    node _T_536 = or(_T_533, _T_535) @[axi4_to_ahb.scala 346:109]
    node _T_537 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 346:161]
    node _T_538 = eq(_T_537, UInt<8>("h0c0")) @[axi4_to_ahb.scala 346:168]
    node _T_539 = or(_T_536, _T_538) @[axi4_to_ahb.scala 346:145]
    node _T_540 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 347:21]
    node _T_541 = eq(_T_540, UInt<4>("h0f")) @[axi4_to_ahb.scala 347:28]
    node _T_542 = or(_T_539, _T_541) @[axi4_to_ahb.scala 346:181]
    node _T_543 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 347:56]
    node _T_544 = eq(_T_543, UInt<8>("h0f0")) @[axi4_to_ahb.scala 347:63]
    node _T_545 = or(_T_542, _T_544) @[axi4_to_ahb.scala 347:40]
    node _T_546 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 347:92]
    node _T_547 = eq(_T_546, UInt<8>("h0ff")) @[axi4_to_ahb.scala 347:99]
    node _T_548 = or(_T_545, _T_547) @[axi4_to_ahb.scala 347:76]
    node _T_549 = and(_T_528, _T_548) @[axi4_to_ahb.scala 346:38]
    node _T_550 = or(_T_526, _T_549) @[axi4_to_ahb.scala 345:104]
    buf_aligned_in <= _T_550 @[axi4_to_ahb.scala 344:18]
    node _T_551 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 349:39]
    node _T_552 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 349:58]
    node _T_553 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 349:83]
    node _T_554 = cat(_T_552, _T_553) @[Cat.scala 29:58]
    node _T_555 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 349:104]
    node _T_556 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 349:129]
    node _T_557 = cat(_T_555, _T_556) @[Cat.scala 29:58]
    node _T_558 = mux(_T_551, _T_554, _T_557) @[axi4_to_ahb.scala 349:22]
    io.ahb_haddr <= _T_558 @[axi4_to_ahb.scala 349:16]
    node _T_559 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 350:39]
    node _T_560 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_561 = mux(_T_560, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_562 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 350:93]
    node _T_563 = and(_T_561, _T_562) @[axi4_to_ahb.scala 350:80]
    node _T_564 = cat(UInt<1>("h00"), _T_563) @[Cat.scala 29:58]
    node _T_565 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_566 = mux(_T_565, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_567 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 350:148]
    node _T_568 = and(_T_566, _T_567) @[axi4_to_ahb.scala 350:138]
    node _T_569 = cat(UInt<1>("h00"), _T_568) @[Cat.scala 29:58]
    node _T_570 = mux(_T_559, _T_564, _T_569) @[axi4_to_ahb.scala 350:22]
    io.ahb_hsize <= _T_570 @[axi4_to_ahb.scala 350:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 352:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 353:20]
    node _T_571 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 354:47]
    node _T_572 = not(_T_571) @[axi4_to_ahb.scala 354:33]
    node _T_573 = cat(UInt<1>("h01"), _T_572) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_573 @[axi4_to_ahb.scala 354:16]
    node _T_574 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 355:40]
    node _T_575 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 355:55]
    node _T_576 = eq(_T_575, UInt<1>("h01")) @[axi4_to_ahb.scala 355:62]
    node _T_577 = mux(_T_574, _T_576, buf_write) @[axi4_to_ahb.scala 355:23]
    io.ahb_hwrite <= _T_577 @[axi4_to_ahb.scala 355:17]
    node _T_578 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 356:28]
    io.ahb_hwdata <= _T_578 @[axi4_to_ahb.scala 356:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 358:15]
    node _T_579 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 359:43]
    node _T_580 = mux(_T_579, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 359:23]
    node _T_581 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_582 = mux(_T_581, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_583 = and(_T_582, UInt<2>("h02")) @[axi4_to_ahb.scala 359:88]
    node _T_584 = cat(_T_580, _T_583) @[Cat.scala 29:58]
    slave_opc <= _T_584 @[axi4_to_ahb.scala 359:13]
    node _T_585 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 360:41]
    node _T_586 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 360:66]
    node _T_587 = cat(_T_586, _T_586) @[Cat.scala 29:58]
    node _T_588 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 360:91]
    node _T_589 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 360:110]
    node _T_590 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 360:131]
    node _T_591 = mux(_T_588, _T_589, _T_590) @[axi4_to_ahb.scala 360:79]
    node _T_592 = mux(_T_585, _T_587, _T_591) @[axi4_to_ahb.scala 360:21]
    slave_rdata <= _T_592 @[axi4_to_ahb.scala 360:15]
    node _T_593 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 361:26]
    slave_tag <= _T_593 @[axi4_to_ahb.scala 361:13]
    node _T_594 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 363:33]
    node _T_595 = neq(_T_594, UInt<1>("h00")) @[axi4_to_ahb.scala 363:40]
    node _T_596 = and(_T_595, io.ahb_hready) @[axi4_to_ahb.scala 363:52]
    node _T_597 = and(_T_596, io.ahb_hwrite) @[axi4_to_ahb.scala 363:68]
    last_addr_en <= _T_597 @[axi4_to_ahb.scala 363:16]
    node _T_598 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 365:30]
    node _T_599 = and(_T_598, master_ready) @[axi4_to_ahb.scala 365:47]
    wrbuf_en <= _T_599 @[axi4_to_ahb.scala 365:12]
    node _T_600 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 366:34]
    node _T_601 = and(_T_600, master_ready) @[axi4_to_ahb.scala 366:50]
    wrbuf_data_en <= _T_601 @[axi4_to_ahb.scala 366:17]
    node _T_602 = and(master_valid, master_ready) @[axi4_to_ahb.scala 367:34]
    node _T_603 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 367:62]
    node _T_604 = eq(_T_603, UInt<1>("h01")) @[axi4_to_ahb.scala 367:69]
    node _T_605 = and(_T_602, _T_604) @[axi4_to_ahb.scala 367:49]
    wrbuf_cmd_sent <= _T_605 @[axi4_to_ahb.scala 367:18]
    node _T_606 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 368:33]
    node _T_607 = and(wrbuf_cmd_sent, _T_606) @[axi4_to_ahb.scala 368:31]
    wrbuf_rst <= _T_607 @[axi4_to_ahb.scala 368:13]
    node _T_608 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 370:35]
    node _T_609 = and(wrbuf_vld, _T_608) @[axi4_to_ahb.scala 370:33]
    node _T_610 = eq(_T_609, UInt<1>("h00")) @[axi4_to_ahb.scala 370:21]
    node _T_611 = and(_T_610, master_ready) @[axi4_to_ahb.scala 370:52]
    io.axi_awready <= _T_611 @[axi4_to_ahb.scala 370:18]
    node _T_612 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 371:39]
    node _T_613 = and(wrbuf_data_vld, _T_612) @[axi4_to_ahb.scala 371:37]
    node _T_614 = eq(_T_613, UInt<1>("h00")) @[axi4_to_ahb.scala 371:20]
    node _T_615 = and(_T_614, master_ready) @[axi4_to_ahb.scala 371:56]
    io.axi_wready <= _T_615 @[axi4_to_ahb.scala 371:17]
    node _T_616 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 372:33]
    node _T_617 = eq(_T_616, UInt<1>("h00")) @[axi4_to_ahb.scala 372:21]
    node _T_618 = and(_T_617, master_ready) @[axi4_to_ahb.scala 372:51]
    io.axi_arready <= _T_618 @[axi4_to_ahb.scala 372:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 373:16]
    node _T_619 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 376:68]
    node _T_620 = mux(_T_619, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 376:52]
    node _T_621 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 376:88]
    node _T_622 = and(_T_620, _T_621) @[axi4_to_ahb.scala 376:86]
    reg _T_623 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 376:48]
    _T_623 <= _T_622 @[axi4_to_ahb.scala 376:48]
    wrbuf_vld <= _T_623 @[axi4_to_ahb.scala 376:18]
    node _T_624 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 377:73]
    node _T_625 = mux(_T_624, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 377:52]
    node _T_626 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 377:99]
    node _T_627 = and(_T_625, _T_626) @[axi4_to_ahb.scala 377:97]
    reg _T_628 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 377:48]
    _T_628 <= _T_627 @[axi4_to_ahb.scala 377:48]
    wrbuf_data_vld <= _T_628 @[axi4_to_ahb.scala 377:18]
    node _T_629 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 379:57]
    node _T_630 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 379:91]
    reg _T_631 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_630 : @[Reg.scala 28:19]
      _T_631 <= _T_629 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_631 @[axi4_to_ahb.scala 379:13]
    node _T_632 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 380:60]
    node _T_633 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 380:88]
    reg _T_634 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_633 : @[Reg.scala 28:19]
      _T_634 <= _T_632 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_634 @[axi4_to_ahb.scala 380:14]
    node _T_635 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 382:48]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_635 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_636 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_636 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_636 @[axi4_to_ahb.scala 382:14]
    node _T_637 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 383:52]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_637 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_638 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_638 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_638 @[axi4_to_ahb.scala 383:14]
    node _T_639 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 386:27]
    node _T_640 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 386:60]
    reg _T_641 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_640 : @[Reg.scala 28:19]
      _T_641 <= _T_639 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_641 @[axi4_to_ahb.scala 385:16]
    node _T_642 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 389:27]
    node _T_643 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 389:60]
    reg _T_644 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_643 : @[Reg.scala 28:19]
      _T_644 <= _T_642 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_644 @[axi4_to_ahb.scala 388:17]
    node _T_645 = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 393:36]
    node _T_646 = mux(_T_645, buf_nxtstate, buf_state) @[axi4_to_ahb.scala 393:16]
    node _T_647 = eq(buf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 393:65]
    node _T_648 = and(_T_646, _T_647) @[axi4_to_ahb.scala 393:63]
    reg _T_649 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 393:12]
    _T_649 <= _T_648 @[axi4_to_ahb.scala 393:12]
    buf_state <= _T_649 @[axi4_to_ahb.scala 392:13]
    node _T_650 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 397:50]
    reg _T_651 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_650 : @[Reg.scala 28:19]
      _T_651 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_651 @[axi4_to_ahb.scala 396:13]
    node _T_652 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 400:25]
    node _T_653 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 400:60]
    reg _T_654 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_653 : @[Reg.scala 28:19]
      _T_654 <= _T_652 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_654 @[axi4_to_ahb.scala 399:11]
    node _T_655 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 403:33]
    node _T_656 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 403:52]
    node _T_657 = bits(_T_656, 0, 0) @[axi4_to_ahb.scala 403:69]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_657 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_658 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_658 <= _T_655 @[el2_lib.scala 514:16]
    buf_addr <= _T_658 @[axi4_to_ahb.scala 403:12]
    node _T_659 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 406:26]
    node _T_660 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 406:55]
    reg _T_661 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_660 : @[Reg.scala 28:19]
      _T_661 <= _T_659 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_661 @[axi4_to_ahb.scala 405:12]
    node _T_662 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 409:52]
    reg _T_663 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_662 : @[Reg.scala 28:19]
      _T_663 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_663 @[axi4_to_ahb.scala 408:15]
    node _T_664 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 412:28]
    node _T_665 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 412:57]
    reg _T_666 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_665 : @[Reg.scala 28:19]
      _T_666 <= _T_664 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_666 @[axi4_to_ahb.scala 411:14]
    node _T_667 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 415:33]
    node _T_668 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 415:57]
    node _T_669 = bits(_T_668, 0, 0) @[axi4_to_ahb.scala 415:80]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_669 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_670 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_670 <= _T_667 @[el2_lib.scala 514:16]
    buf_data <= _T_670 @[axi4_to_ahb.scala 415:12]
    node _T_671 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 418:50]
    reg _T_672 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_671 : @[Reg.scala 28:19]
      _T_672 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_672 @[axi4_to_ahb.scala 417:16]
    node _T_673 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 421:22]
    node _T_674 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 421:60]
    reg _T_675 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_674 : @[Reg.scala 28:19]
      _T_675 <= _T_673 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_675 @[axi4_to_ahb.scala 420:14]
    node _T_676 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 424:59]
    reg _T_677 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_676 : @[Reg.scala 28:19]
      _T_677 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_677 @[axi4_to_ahb.scala 423:16]
    node _T_678 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 428:32]
    node _T_679 = mux(_T_678, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 428:16]
    node _T_680 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 428:52]
    node _T_681 = and(_T_679, _T_680) @[axi4_to_ahb.scala 428:50]
    reg _T_682 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 428:12]
    _T_682 <= _T_681 @[axi4_to_ahb.scala 428:12]
    cmd_doneQ <= _T_682 @[axi4_to_ahb.scala 427:13]
    node _T_683 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 432:31]
    node _T_684 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 432:70]
    reg _T_685 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_684 : @[Reg.scala 28:19]
      _T_685 <= _T_683 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_685 @[axi4_to_ahb.scala 431:21]
    reg _T_686 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 437:12]
    _T_686 <= io.ahb_hready @[axi4_to_ahb.scala 437:12]
    ahb_hready_q <= _T_686 @[axi4_to_ahb.scala 436:16]
    node _T_687 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 440:26]
    reg _T_688 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 440:12]
    _T_688 <= _T_687 @[axi4_to_ahb.scala 440:12]
    ahb_htrans_q <= _T_688 @[axi4_to_ahb.scala 439:16]
    reg _T_689 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 443:12]
    _T_689 <= io.ahb_hwrite @[axi4_to_ahb.scala 443:12]
    ahb_hwrite_q <= _T_689 @[axi4_to_ahb.scala 442:16]
    reg _T_690 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 446:12]
    _T_690 <= io.ahb_hresp @[axi4_to_ahb.scala 446:12]
    ahb_hresp_q <= _T_690 @[axi4_to_ahb.scala 445:15]
    node _T_691 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 449:26]
    reg _T_692 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 449:12]
    _T_692 <= _T_691 @[axi4_to_ahb.scala 449:12]
    ahb_hrdata_q <= _T_692 @[axi4_to_ahb.scala 448:16]
    node _T_693 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 452:43]
    node _T_694 = or(_T_693, io.clk_override) @[axi4_to_ahb.scala 452:58]
    node _T_695 = and(io.bus_clk_en, _T_694) @[axi4_to_ahb.scala 452:30]
    buf_clken <= _T_695 @[axi4_to_ahb.scala 452:13]
    node _T_696 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 453:69]
    node _T_697 = and(io.ahb_hready, _T_696) @[axi4_to_ahb.scala 453:54]
    node _T_698 = or(_T_697, io.clk_override) @[axi4_to_ahb.scala 453:74]
    node _T_699 = and(io.bus_clk_en, _T_698) @[axi4_to_ahb.scala 453:36]
    ahbm_addr_clken <= _T_699 @[axi4_to_ahb.scala 453:19]
    node _T_700 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 454:50]
    node _T_701 = or(_T_700, io.clk_override) @[axi4_to_ahb.scala 454:60]
    node _T_702 = and(io.bus_clk_en, _T_701) @[axi4_to_ahb.scala 454:36]
    ahbm_data_clken <= _T_702 @[axi4_to_ahb.scala 454:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 457:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 458:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 459:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 460:17]
    
