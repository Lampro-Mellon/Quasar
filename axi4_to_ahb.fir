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
    buf_rst <= UInt<1>("h00") @[axi4_to_ahb.scala 61:11]
    wire buf_state_en : UInt<1>
    buf_state_en <= UInt<1>("h00")
    wire ahbm_clk : Clock @[axi4_to_ahb.scala 63:22]
    wire ahbm_addr_clk : Clock @[axi4_to_ahb.scala 64:27]
    wire ahbm_data_clk : Clock @[axi4_to_ahb.scala 65:27]
    wire buf_state : UInt<3>
    buf_state <= UInt<3>("h00")
    wire buf_nxtstate : UInt<3>
    buf_nxtstate <= UInt<3>("h00")
    node _T = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 69:70]
    node _T_1 = mux(_T, buf_nxtstate, buf_state) @[axi4_to_ahb.scala 69:50]
    node _T_2 = eq(buf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 69:108]
    node _T_3 = bits(_T_2, 0, 0) @[Bitwise.scala 72:15]
    node _T_4 = mux(_T_3, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_5 = and(_T_1, _T_4) @[axi4_to_ahb.scala 69:98]
    reg _T_6 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 69:45]
    _T_6 <= _T_5 @[axi4_to_ahb.scala 69:45]
    buf_state <= _T_6 @[axi4_to_ahb.scala 69:13]
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
    wire bus_clk : Clock @[axi4_to_ahb.scala 89:21]
    wire bus_write_clk : Clock @[axi4_to_ahb.scala 90:27]
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
    wire buf_clk : Clock @[axi4_to_ahb.scala 157:21]
    node _T_7 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 177:27]
    wr_cmd_vld <= _T_7 @[axi4_to_ahb.scala 177:14]
    node _T_8 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 178:30]
    master_valid <= _T_8 @[axi4_to_ahb.scala 178:16]
    node _T_9 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 179:38]
    node _T_10 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 179:51]
    node _T_11 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 179:76]
    node _T_12 = mux(_T_9, _T_10, _T_11) @[axi4_to_ahb.scala 179:20]
    master_tag <= _T_12 @[axi4_to_ahb.scala 179:14]
    node _T_13 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 180:38]
    node _T_14 = mux(_T_13, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 180:20]
    master_opc <= _T_14 @[axi4_to_ahb.scala 180:14]
    node _T_15 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 181:39]
    node _T_16 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 181:53]
    node _T_17 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 181:75]
    node _T_18 = mux(_T_15, _T_16, _T_17) @[axi4_to_ahb.scala 181:21]
    master_addr <= _T_18 @[axi4_to_ahb.scala 181:15]
    node _T_19 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 182:39]
    node _T_20 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 182:53]
    node _T_21 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 182:74]
    node _T_22 = mux(_T_19, _T_20, _T_21) @[axi4_to_ahb.scala 182:21]
    master_size <= _T_22 @[axi4_to_ahb.scala 182:15]
    node _T_23 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 183:32]
    master_byteen <= _T_23 @[axi4_to_ahb.scala 183:17]
    node _T_24 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 184:29]
    master_wdata <= _T_24 @[axi4_to_ahb.scala 184:16]
    node _T_25 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 187:32]
    node _T_26 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 187:57]
    node _T_27 = and(_T_25, _T_26) @[axi4_to_ahb.scala 187:46]
    io.axi_bvalid <= _T_27 @[axi4_to_ahb.scala 187:17]
    node _T_28 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 188:32]
    node _T_29 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 188:59]
    node _T_30 = mux(_T_29, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 188:49]
    node _T_31 = mux(_T_28, UInt<2>("h02"), _T_30) @[axi4_to_ahb.scala 188:22]
    io.axi_bresp <= _T_31 @[axi4_to_ahb.scala 188:16]
    node _T_32 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 189:26]
    io.axi_bid <= _T_32 @[axi4_to_ahb.scala 189:14]
    node _T_33 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 191:32]
    node _T_34 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 191:58]
    node _T_35 = eq(_T_34, UInt<1>("h00")) @[axi4_to_ahb.scala 191:65]
    node _T_36 = and(_T_33, _T_35) @[axi4_to_ahb.scala 191:46]
    io.axi_rvalid <= _T_36 @[axi4_to_ahb.scala 191:17]
    node _T_37 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 192:32]
    node _T_38 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 192:59]
    node _T_39 = mux(_T_38, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 192:49]
    node _T_40 = mux(_T_37, UInt<2>("h02"), _T_39) @[axi4_to_ahb.scala 192:22]
    io.axi_rresp <= _T_40 @[axi4_to_ahb.scala 192:16]
    node _T_41 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 193:26]
    io.axi_rid <= _T_41 @[axi4_to_ahb.scala 193:14]
    node _T_42 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 194:30]
    io.axi_rdata <= _T_42 @[axi4_to_ahb.scala 194:16]
    node _T_43 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 195:32]
    slave_ready <= _T_43 @[axi4_to_ahb.scala 195:15]
    node _T_44 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 198:56]
    node _T_45 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 198:91]
    node _T_46 = or(_T_44, _T_45) @[axi4_to_ahb.scala 198:74]
    node _T_47 = and(io.bus_clk_en, _T_46) @[axi4_to_ahb.scala 198:37]
    bus_write_clk_en <= _T_47 @[axi4_to_ahb.scala 198:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 200:11]
    node _T_48 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 201:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_48 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 201:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 204:17]
    master_ready <= UInt<1>("h00") @[axi4_to_ahb.scala 205:16]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 206:16]
    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 207:18]
    buf_data_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 209:18]
    slvbuf_error_in <= UInt<1>("h00") @[axi4_to_ahb.scala 210:21]
    slvbuf_error_en <= UInt<1>("h00") @[axi4_to_ahb.scala 211:21]
    buf_write_in <= UInt<1>("h00") @[axi4_to_ahb.scala 212:18]
    cmd_done <= UInt<1>("h00") @[axi4_to_ahb.scala 213:18]
    trxn_done <= UInt<1>("h00") @[axi4_to_ahb.scala 214:18]
    buf_cmd_byte_ptr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 215:23]
    buf_cmd_byte_ptr <= UInt<1>("h00") @[axi4_to_ahb.scala 216:20]
    slave_valid_pre <= UInt<1>("h00") @[axi4_to_ahb.scala 217:21]
    slvbuf_wr_en <= UInt<1>("h00") @[axi4_to_ahb.scala 218:19]
    bypass_en <= UInt<1>("h00") @[axi4_to_ahb.scala 219:20]
    rd_bypass_idle <= UInt<1>("h00") @[axi4_to_ahb.scala 220:18]
    node _T_49 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_49 : @[Conditional.scala 40:58]
      master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 224:20]
      node _T_50 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 225:34]
      node _T_51 = eq(_T_50, UInt<1>("h01")) @[axi4_to_ahb.scala 225:41]
      buf_write_in <= _T_51 @[axi4_to_ahb.scala 225:20]
      node _T_52 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 226:46]
      node _T_53 = mux(_T_52, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 226:26]
      buf_nxtstate <= _T_53 @[axi4_to_ahb.scala 226:20]
      node _T_54 = and(master_valid, UInt<1>("h01")) @[axi4_to_ahb.scala 227:36]
      buf_state_en <= _T_54 @[axi4_to_ahb.scala 227:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 228:17]
      node _T_55 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 229:54]
      node _T_56 = and(buf_state_en, _T_55) @[axi4_to_ahb.scala 229:38]
      buf_data_wr_en <= _T_56 @[axi4_to_ahb.scala 229:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 230:27]
      node _T_57 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 232:50]
      node _T_58 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 232:94]
      node _T_59 = add(UInt<3>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
      node _T_60 = tail(_T_59, 1) @[axi4_to_ahb.scala 174:52]
      node _T_61 = mux(UInt<1>("h00"), _T_60, UInt<3>("h00")) @[axi4_to_ahb.scala 174:24]
      node _T_62 = bits(_T_58, 0, 0) @[axi4_to_ahb.scala 175:45]
      node _T_63 = geq(UInt<1>("h00"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_64 = and(_T_62, _T_63) @[axi4_to_ahb.scala 175:49]
      node _T_65 = orr(_T_64) @[axi4_to_ahb.scala 175:78]
      node _T_66 = bits(_T_58, 1, 1) @[axi4_to_ahb.scala 175:45]
      node _T_67 = geq(UInt<1>("h01"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_68 = and(_T_66, _T_67) @[axi4_to_ahb.scala 175:49]
      node _T_69 = orr(_T_68) @[axi4_to_ahb.scala 175:78]
      node _T_70 = bits(_T_58, 2, 2) @[axi4_to_ahb.scala 175:45]
      node _T_71 = geq(UInt<2>("h02"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_72 = and(_T_70, _T_71) @[axi4_to_ahb.scala 175:49]
      node _T_73 = orr(_T_72) @[axi4_to_ahb.scala 175:78]
      node _T_74 = bits(_T_58, 3, 3) @[axi4_to_ahb.scala 175:45]
      node _T_75 = geq(UInt<2>("h03"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_76 = and(_T_74, _T_75) @[axi4_to_ahb.scala 175:49]
      node _T_77 = orr(_T_76) @[axi4_to_ahb.scala 175:78]
      node _T_78 = bits(_T_58, 4, 4) @[axi4_to_ahb.scala 175:45]
      node _T_79 = geq(UInt<3>("h04"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_80 = and(_T_78, _T_79) @[axi4_to_ahb.scala 175:49]
      node _T_81 = orr(_T_80) @[axi4_to_ahb.scala 175:78]
      node _T_82 = bits(_T_58, 5, 5) @[axi4_to_ahb.scala 175:45]
      node _T_83 = geq(UInt<3>("h05"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_84 = and(_T_82, _T_83) @[axi4_to_ahb.scala 175:49]
      node _T_85 = orr(_T_84) @[axi4_to_ahb.scala 175:78]
      node _T_86 = bits(_T_58, 6, 6) @[axi4_to_ahb.scala 175:45]
      node _T_87 = geq(UInt<3>("h06"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_88 = and(_T_86, _T_87) @[axi4_to_ahb.scala 175:49]
      node _T_89 = orr(_T_88) @[axi4_to_ahb.scala 175:78]
      node _T_90 = bits(_T_58, 7, 7) @[axi4_to_ahb.scala 175:45]
      node _T_91 = geq(UInt<3>("h07"), _T_61) @[axi4_to_ahb.scala 175:63]
      node _T_92 = and(_T_90, _T_91) @[axi4_to_ahb.scala 175:49]
      node _T_93 = orr(_T_92) @[axi4_to_ahb.scala 175:78]
      node _T_94 = mux(_T_93, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_95 = mux(_T_89, UInt<3>("h06"), _T_94) @[Mux.scala 98:16]
      node _T_96 = mux(_T_85, UInt<3>("h05"), _T_95) @[Mux.scala 98:16]
      node _T_97 = mux(_T_81, UInt<3>("h04"), _T_96) @[Mux.scala 98:16]
      node _T_98 = mux(_T_77, UInt<2>("h03"), _T_97) @[Mux.scala 98:16]
      node _T_99 = mux(_T_73, UInt<2>("h02"), _T_98) @[Mux.scala 98:16]
      node _T_100 = mux(_T_69, UInt<1>("h01"), _T_99) @[Mux.scala 98:16]
      node _T_101 = mux(_T_65, UInt<1>("h00"), _T_100) @[Mux.scala 98:16]
      node _T_102 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 232:124]
      node _T_103 = mux(_T_57, _T_101, _T_102) @[axi4_to_ahb.scala 232:30]
      buf_cmd_byte_ptr <= _T_103 @[axi4_to_ahb.scala 232:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 233:17]
      node _T_104 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 234:51]
      node _T_105 = and(bypass_en, _T_104) @[axi4_to_ahb.scala 234:35]
      rd_bypass_idle <= _T_105 @[axi4_to_ahb.scala 234:22]
      node _T_106 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_107 = mux(_T_106, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_108 = and(_T_107, UInt<2>("h02")) @[axi4_to_ahb.scala 235:45]
      io.ahb_htrans <= _T_108 @[axi4_to_ahb.scala 235:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_109 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_109 : @[Conditional.scala 39:67]
        node _T_110 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 239:54]
        node _T_111 = eq(_T_110, UInt<1>("h00")) @[axi4_to_ahb.scala 239:61]
        node _T_112 = and(master_valid, _T_111) @[axi4_to_ahb.scala 239:41]
        node _T_113 = bits(_T_112, 0, 0) @[axi4_to_ahb.scala 239:82]
        node _T_114 = mux(_T_113, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 239:26]
        buf_nxtstate <= _T_114 @[axi4_to_ahb.scala 239:20]
        node _T_115 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 240:51]
        node _T_116 = neq(_T_115, UInt<1>("h00")) @[axi4_to_ahb.scala 240:58]
        node _T_117 = and(ahb_hready_q, _T_116) @[axi4_to_ahb.scala 240:36]
        node _T_118 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 240:72]
        node _T_119 = and(_T_117, _T_118) @[axi4_to_ahb.scala 240:70]
        buf_state_en <= _T_119 @[axi4_to_ahb.scala 240:20]
        node _T_120 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 241:34]
        node _T_121 = and(buf_state_en, _T_120) @[axi4_to_ahb.scala 241:32]
        cmd_done <= _T_121 @[axi4_to_ahb.scala 241:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 242:20]
        node _T_122 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 243:52]
        node _T_123 = neq(_T_122, UInt<1>("h00")) @[axi4_to_ahb.scala 243:59]
        node _T_124 = and(ahb_hready_q, _T_123) @[axi4_to_ahb.scala 243:37]
        node _T_125 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 243:73]
        node _T_126 = and(_T_124, _T_125) @[axi4_to_ahb.scala 243:71]
        node _T_127 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 243:122]
        node _T_128 = eq(_T_127, UInt<1>("h00")) @[axi4_to_ahb.scala 243:129]
        node _T_129 = and(master_valid, _T_128) @[axi4_to_ahb.scala 243:109]
        node _T_130 = bits(_T_129, 0, 0) @[axi4_to_ahb.scala 243:150]
        node _T_131 = mux(_T_130, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 243:94]
        node _T_132 = eq(_T_131, UInt<3>("h06")) @[axi4_to_ahb.scala 243:174]
        node _T_133 = and(_T_126, _T_132) @[axi4_to_ahb.scala 243:88]
        master_ready <= _T_133 @[axi4_to_ahb.scala 243:20]
        buf_wr_en <= master_ready @[axi4_to_ahb.scala 244:17]
        node _T_134 = and(master_ready, master_valid) @[axi4_to_ahb.scala 245:33]
        bypass_en <= _T_134 @[axi4_to_ahb.scala 245:17]
        node _T_135 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 246:47]
        node _T_136 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 246:62]
        node _T_137 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 246:78]
        node _T_138 = mux(_T_135, _T_136, _T_137) @[axi4_to_ahb.scala 246:30]
        buf_cmd_byte_ptr <= _T_138 @[axi4_to_ahb.scala 246:24]
        node _T_139 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 247:44]
        node _T_140 = or(_T_139, bypass_en) @[axi4_to_ahb.scala 247:58]
        node _T_141 = bits(_T_140, 0, 0) @[Bitwise.scala 72:15]
        node _T_142 = mux(_T_141, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_143 = and(UInt<2>("h02"), _T_142) @[axi4_to_ahb.scala 247:32]
        io.ahb_htrans <= _T_143 @[axi4_to_ahb.scala 247:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_144 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_144 : @[Conditional.scala 39:67]
          node _T_145 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 251:39]
          node _T_146 = and(ahb_hready_q, _T_145) @[axi4_to_ahb.scala 251:37]
          node _T_147 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 251:82]
          node _T_148 = eq(_T_147, UInt<1>("h01")) @[axi4_to_ahb.scala 251:89]
          node _T_149 = and(master_valid, _T_148) @[axi4_to_ahb.scala 251:70]
          node _T_150 = eq(_T_149, UInt<1>("h00")) @[axi4_to_ahb.scala 251:55]
          node _T_151 = and(_T_146, _T_150) @[axi4_to_ahb.scala 251:53]
          master_ready <= _T_151 @[axi4_to_ahb.scala 251:20]
          node _T_152 = and(master_valid, master_ready) @[axi4_to_ahb.scala 252:34]
          node _T_153 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 252:62]
          node _T_154 = eq(_T_153, UInt<1>("h00")) @[axi4_to_ahb.scala 252:69]
          node _T_155 = and(_T_152, _T_154) @[axi4_to_ahb.scala 252:49]
          buf_wr_en <= _T_155 @[axi4_to_ahb.scala 252:17]
          node _T_156 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 253:45]
          node _T_157 = and(master_valid, master_ready) @[axi4_to_ahb.scala 253:82]
          node _T_158 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 253:110]
          node _T_159 = eq(_T_158, UInt<1>("h00")) @[axi4_to_ahb.scala 253:117]
          node _T_160 = and(_T_157, _T_159) @[axi4_to_ahb.scala 253:97]
          node _T_161 = bits(_T_160, 0, 0) @[axi4_to_ahb.scala 253:138]
          node _T_162 = mux(_T_161, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 253:67]
          node _T_163 = mux(_T_156, UInt<3>("h07"), _T_162) @[axi4_to_ahb.scala 253:26]
          buf_nxtstate <= _T_163 @[axi4_to_ahb.scala 253:20]
          node _T_164 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 254:37]
          buf_state_en <= _T_164 @[axi4_to_ahb.scala 254:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 255:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 256:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 257:23]
          node _T_165 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 258:41]
          node _T_166 = and(buf_state_en, _T_165) @[axi4_to_ahb.scala 258:39]
          slave_valid_pre <= _T_166 @[axi4_to_ahb.scala 258:23]
          node _T_167 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 259:34]
          node _T_168 = and(buf_state_en, _T_167) @[axi4_to_ahb.scala 259:32]
          cmd_done <= _T_168 @[axi4_to_ahb.scala 259:16]
          node _T_169 = and(master_ready, master_valid) @[axi4_to_ahb.scala 260:33]
          node _T_170 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 260:64]
          node _T_171 = and(_T_169, _T_170) @[axi4_to_ahb.scala 260:48]
          node _T_172 = and(_T_171, buf_state_en) @[axi4_to_ahb.scala 260:79]
          bypass_en <= _T_172 @[axi4_to_ahb.scala 260:17]
          node _T_173 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 261:47]
          node _T_174 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 261:62]
          node _T_175 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 261:78]
          node _T_176 = mux(_T_173, _T_174, _T_175) @[axi4_to_ahb.scala 261:30]
          buf_cmd_byte_ptr <= _T_176 @[axi4_to_ahb.scala 261:24]
          node _T_177 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 262:59]
          node _T_178 = and(_T_177, buf_state_en) @[axi4_to_ahb.scala 262:74]
          node _T_179 = eq(_T_178, UInt<1>("h00")) @[axi4_to_ahb.scala 262:43]
          node _T_180 = bits(_T_179, 0, 0) @[Bitwise.scala 72:15]
          node _T_181 = mux(_T_180, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_182 = and(UInt<2>("h02"), _T_181) @[axi4_to_ahb.scala 262:32]
          io.ahb_htrans <= _T_182 @[axi4_to_ahb.scala 262:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 263:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_183 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_183 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 267:20]
            node _T_184 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 268:51]
            node _T_185 = neq(_T_184, UInt<1>("h00")) @[axi4_to_ahb.scala 268:58]
            node _T_186 = and(ahb_hready_q, _T_185) @[axi4_to_ahb.scala 268:36]
            node _T_187 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 268:72]
            node _T_188 = and(_T_186, _T_187) @[axi4_to_ahb.scala 268:70]
            buf_state_en <= _T_188 @[axi4_to_ahb.scala 268:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 269:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 270:20]
            node _T_189 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 271:35]
            buf_cmd_byte_ptr <= _T_189 @[axi4_to_ahb.scala 271:24]
            node _T_190 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 272:47]
            node _T_191 = bits(_T_190, 0, 0) @[Bitwise.scala 72:15]
            node _T_192 = mux(_T_191, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_193 = and(UInt<2>("h02"), _T_192) @[axi4_to_ahb.scala 272:37]
            io.ahb_htrans <= _T_193 @[axi4_to_ahb.scala 272:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_194 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_194 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 276:20]
              node _T_195 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 277:37]
              buf_state_en <= _T_195 @[axi4_to_ahb.scala 277:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 278:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 279:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 280:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 281:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_196 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_196 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 285:20]
                node _T_197 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 286:33]
                node _T_198 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 286:63]
                node _T_199 = neq(_T_198, UInt<1>("h00")) @[axi4_to_ahb.scala 286:70]
                node _T_200 = and(_T_197, _T_199) @[axi4_to_ahb.scala 286:48]
                trxn_done <= _T_200 @[axi4_to_ahb.scala 286:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 287:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 288:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 289:20]
                node _T_201 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 290:47]
                node _T_202 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 290:85]
                node _T_203 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 290:103]
                node _T_204 = add(_T_202, UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
                node _T_205 = tail(_T_204, 1) @[axi4_to_ahb.scala 174:52]
                node _T_206 = mux(UInt<1>("h01"), _T_205, _T_202) @[axi4_to_ahb.scala 174:24]
                node _T_207 = bits(_T_203, 0, 0) @[axi4_to_ahb.scala 175:45]
                node _T_208 = geq(UInt<1>("h00"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_209 = and(_T_207, _T_208) @[axi4_to_ahb.scala 175:49]
                node _T_210 = orr(_T_209) @[axi4_to_ahb.scala 175:78]
                node _T_211 = bits(_T_203, 1, 1) @[axi4_to_ahb.scala 175:45]
                node _T_212 = geq(UInt<1>("h01"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_213 = and(_T_211, _T_212) @[axi4_to_ahb.scala 175:49]
                node _T_214 = orr(_T_213) @[axi4_to_ahb.scala 175:78]
                node _T_215 = bits(_T_203, 2, 2) @[axi4_to_ahb.scala 175:45]
                node _T_216 = geq(UInt<2>("h02"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_217 = and(_T_215, _T_216) @[axi4_to_ahb.scala 175:49]
                node _T_218 = orr(_T_217) @[axi4_to_ahb.scala 175:78]
                node _T_219 = bits(_T_203, 3, 3) @[axi4_to_ahb.scala 175:45]
                node _T_220 = geq(UInt<2>("h03"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_221 = and(_T_219, _T_220) @[axi4_to_ahb.scala 175:49]
                node _T_222 = orr(_T_221) @[axi4_to_ahb.scala 175:78]
                node _T_223 = bits(_T_203, 4, 4) @[axi4_to_ahb.scala 175:45]
                node _T_224 = geq(UInt<3>("h04"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_225 = and(_T_223, _T_224) @[axi4_to_ahb.scala 175:49]
                node _T_226 = orr(_T_225) @[axi4_to_ahb.scala 175:78]
                node _T_227 = bits(_T_203, 5, 5) @[axi4_to_ahb.scala 175:45]
                node _T_228 = geq(UInt<3>("h05"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_229 = and(_T_227, _T_228) @[axi4_to_ahb.scala 175:49]
                node _T_230 = orr(_T_229) @[axi4_to_ahb.scala 175:78]
                node _T_231 = bits(_T_203, 6, 6) @[axi4_to_ahb.scala 175:45]
                node _T_232 = geq(UInt<3>("h06"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_233 = and(_T_231, _T_232) @[axi4_to_ahb.scala 175:49]
                node _T_234 = orr(_T_233) @[axi4_to_ahb.scala 175:78]
                node _T_235 = bits(_T_203, 7, 7) @[axi4_to_ahb.scala 175:45]
                node _T_236 = geq(UInt<3>("h07"), _T_206) @[axi4_to_ahb.scala 175:63]
                node _T_237 = and(_T_235, _T_236) @[axi4_to_ahb.scala 175:49]
                node _T_238 = orr(_T_237) @[axi4_to_ahb.scala 175:78]
                node _T_239 = mux(_T_238, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_240 = mux(_T_234, UInt<3>("h06"), _T_239) @[Mux.scala 98:16]
                node _T_241 = mux(_T_230, UInt<3>("h05"), _T_240) @[Mux.scala 98:16]
                node _T_242 = mux(_T_226, UInt<3>("h04"), _T_241) @[Mux.scala 98:16]
                node _T_243 = mux(_T_222, UInt<2>("h03"), _T_242) @[Mux.scala 98:16]
                node _T_244 = mux(_T_218, UInt<2>("h02"), _T_243) @[Mux.scala 98:16]
                node _T_245 = mux(_T_214, UInt<1>("h01"), _T_244) @[Mux.scala 98:16]
                node _T_246 = mux(_T_210, UInt<1>("h00"), _T_245) @[Mux.scala 98:16]
                node _T_247 = mux(_T_201, _T_246, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 290:30]
                buf_cmd_byte_ptr <= _T_247 @[axi4_to_ahb.scala 290:24]
                node _T_248 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 291:65]
                node _T_249 = or(buf_aligned, _T_248) @[axi4_to_ahb.scala 291:44]
                node _T_250 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 291:127]
                node _T_251 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 291:145]
                node _T_252 = add(_T_250, UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
                node _T_253 = tail(_T_252, 1) @[axi4_to_ahb.scala 174:52]
                node _T_254 = mux(UInt<1>("h01"), _T_253, _T_250) @[axi4_to_ahb.scala 174:24]
                node _T_255 = bits(_T_251, 0, 0) @[axi4_to_ahb.scala 175:45]
                node _T_256 = geq(UInt<1>("h00"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_257 = and(_T_255, _T_256) @[axi4_to_ahb.scala 175:49]
                node _T_258 = orr(_T_257) @[axi4_to_ahb.scala 175:78]
                node _T_259 = bits(_T_251, 1, 1) @[axi4_to_ahb.scala 175:45]
                node _T_260 = geq(UInt<1>("h01"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_261 = and(_T_259, _T_260) @[axi4_to_ahb.scala 175:49]
                node _T_262 = orr(_T_261) @[axi4_to_ahb.scala 175:78]
                node _T_263 = bits(_T_251, 2, 2) @[axi4_to_ahb.scala 175:45]
                node _T_264 = geq(UInt<2>("h02"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_265 = and(_T_263, _T_264) @[axi4_to_ahb.scala 175:49]
                node _T_266 = orr(_T_265) @[axi4_to_ahb.scala 175:78]
                node _T_267 = bits(_T_251, 3, 3) @[axi4_to_ahb.scala 175:45]
                node _T_268 = geq(UInt<2>("h03"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_269 = and(_T_267, _T_268) @[axi4_to_ahb.scala 175:49]
                node _T_270 = orr(_T_269) @[axi4_to_ahb.scala 175:78]
                node _T_271 = bits(_T_251, 4, 4) @[axi4_to_ahb.scala 175:45]
                node _T_272 = geq(UInt<3>("h04"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_273 = and(_T_271, _T_272) @[axi4_to_ahb.scala 175:49]
                node _T_274 = orr(_T_273) @[axi4_to_ahb.scala 175:78]
                node _T_275 = bits(_T_251, 5, 5) @[axi4_to_ahb.scala 175:45]
                node _T_276 = geq(UInt<3>("h05"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_277 = and(_T_275, _T_276) @[axi4_to_ahb.scala 175:49]
                node _T_278 = orr(_T_277) @[axi4_to_ahb.scala 175:78]
                node _T_279 = bits(_T_251, 6, 6) @[axi4_to_ahb.scala 175:45]
                node _T_280 = geq(UInt<3>("h06"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_281 = and(_T_279, _T_280) @[axi4_to_ahb.scala 175:49]
                node _T_282 = orr(_T_281) @[axi4_to_ahb.scala 175:78]
                node _T_283 = bits(_T_251, 7, 7) @[axi4_to_ahb.scala 175:45]
                node _T_284 = geq(UInt<3>("h07"), _T_254) @[axi4_to_ahb.scala 175:63]
                node _T_285 = and(_T_283, _T_284) @[axi4_to_ahb.scala 175:49]
                node _T_286 = orr(_T_285) @[axi4_to_ahb.scala 175:78]
                node _T_287 = mux(_T_286, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_288 = mux(_T_282, UInt<3>("h06"), _T_287) @[Mux.scala 98:16]
                node _T_289 = mux(_T_278, UInt<3>("h05"), _T_288) @[Mux.scala 98:16]
                node _T_290 = mux(_T_274, UInt<3>("h04"), _T_289) @[Mux.scala 98:16]
                node _T_291 = mux(_T_270, UInt<2>("h03"), _T_290) @[Mux.scala 98:16]
                node _T_292 = mux(_T_266, UInt<2>("h02"), _T_291) @[Mux.scala 98:16]
                node _T_293 = mux(_T_262, UInt<1>("h01"), _T_292) @[Mux.scala 98:16]
                node _T_294 = mux(_T_258, UInt<1>("h00"), _T_293) @[Mux.scala 98:16]
                node _T_295 = dshr(buf_byteen, _T_294) @[axi4_to_ahb.scala 291:92]
                node _T_296 = bits(_T_295, 0, 0) @[axi4_to_ahb.scala 291:92]
                node _T_297 = eq(_T_296, UInt<1>("h00")) @[axi4_to_ahb.scala 291:163]
                node _T_298 = or(_T_249, _T_297) @[axi4_to_ahb.scala 291:79]
                node _T_299 = and(trxn_done, _T_298) @[axi4_to_ahb.scala 291:29]
                cmd_done <= _T_299 @[axi4_to_ahb.scala 291:16]
                node _T_300 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 292:43]
                node _T_301 = eq(_T_300, UInt<1>("h00")) @[axi4_to_ahb.scala 292:32]
                node _T_302 = bits(_T_301, 0, 0) @[Bitwise.scala 72:15]
                node _T_303 = mux(_T_302, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_304 = and(_T_303, UInt<2>("h02")) @[axi4_to_ahb.scala 292:57]
                io.ahb_htrans <= _T_304 @[axi4_to_ahb.scala 292:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_305 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_305 : @[Conditional.scala 39:67]
                  node _T_306 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 296:34]
                  node _T_307 = or(_T_306, ahb_hresp_q) @[axi4_to_ahb.scala 296:50]
                  buf_state_en <= _T_307 @[axi4_to_ahb.scala 296:20]
                  node _T_308 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 297:35]
                  node _T_309 = or(_T_308, ahb_hresp_q) @[axi4_to_ahb.scala 297:51]
                  node _T_310 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 297:68]
                  node _T_311 = and(_T_309, _T_310) @[axi4_to_ahb.scala 297:66]
                  node _T_312 = and(_T_311, slave_ready) @[axi4_to_ahb.scala 297:81]
                  master_ready <= _T_312 @[axi4_to_ahb.scala 297:20]
                  node _T_313 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 298:42]
                  node _T_314 = or(ahb_hresp_q, _T_313) @[axi4_to_ahb.scala 298:40]
                  node _T_315 = bits(_T_314, 0, 0) @[axi4_to_ahb.scala 298:62]
                  node _T_316 = and(master_valid, master_ready) @[axi4_to_ahb.scala 298:90]
                  node _T_317 = bits(_T_316, 0, 0) @[axi4_to_ahb.scala 298:112]
                  node _T_318 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 298:131]
                  node _T_319 = eq(_T_318, UInt<1>("h01")) @[axi4_to_ahb.scala 298:138]
                  node _T_320 = mux(_T_319, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 298:119]
                  node _T_321 = mux(_T_317, _T_320, UInt<3>("h00")) @[axi4_to_ahb.scala 298:75]
                  node _T_322 = mux(_T_315, UInt<3>("h05"), _T_321) @[axi4_to_ahb.scala 298:26]
                  buf_nxtstate <= _T_322 @[axi4_to_ahb.scala 298:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 299:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 300:23]
                  node _T_323 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 301:34]
                  node _T_324 = eq(_T_323, UInt<1>("h01")) @[axi4_to_ahb.scala 301:41]
                  buf_write_in <= _T_324 @[axi4_to_ahb.scala 301:20]
                  node _T_325 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 302:50]
                  node _T_326 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 302:78]
                  node _T_327 = or(_T_325, _T_326) @[axi4_to_ahb.scala 302:62]
                  node _T_328 = and(buf_state_en, _T_327) @[axi4_to_ahb.scala 302:33]
                  buf_wr_en <= _T_328 @[axi4_to_ahb.scala 302:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 303:22]
                  node _T_329 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 304:63]
                  node _T_330 = neq(_T_329, UInt<1>("h00")) @[axi4_to_ahb.scala 304:70]
                  node _T_331 = and(ahb_hready_q, _T_330) @[axi4_to_ahb.scala 304:48]
                  node _T_332 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 304:104]
                  node _T_333 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 304:166]
                  node _T_334 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 304:184]
                  node _T_335 = add(_T_333, UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
                  node _T_336 = tail(_T_335, 1) @[axi4_to_ahb.scala 174:52]
                  node _T_337 = mux(UInt<1>("h01"), _T_336, _T_333) @[axi4_to_ahb.scala 174:24]
                  node _T_338 = bits(_T_334, 0, 0) @[axi4_to_ahb.scala 175:45]
                  node _T_339 = geq(UInt<1>("h00"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_340 = and(_T_338, _T_339) @[axi4_to_ahb.scala 175:49]
                  node _T_341 = orr(_T_340) @[axi4_to_ahb.scala 175:78]
                  node _T_342 = bits(_T_334, 1, 1) @[axi4_to_ahb.scala 175:45]
                  node _T_343 = geq(UInt<1>("h01"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_344 = and(_T_342, _T_343) @[axi4_to_ahb.scala 175:49]
                  node _T_345 = orr(_T_344) @[axi4_to_ahb.scala 175:78]
                  node _T_346 = bits(_T_334, 2, 2) @[axi4_to_ahb.scala 175:45]
                  node _T_347 = geq(UInt<2>("h02"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_348 = and(_T_346, _T_347) @[axi4_to_ahb.scala 175:49]
                  node _T_349 = orr(_T_348) @[axi4_to_ahb.scala 175:78]
                  node _T_350 = bits(_T_334, 3, 3) @[axi4_to_ahb.scala 175:45]
                  node _T_351 = geq(UInt<2>("h03"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_352 = and(_T_350, _T_351) @[axi4_to_ahb.scala 175:49]
                  node _T_353 = orr(_T_352) @[axi4_to_ahb.scala 175:78]
                  node _T_354 = bits(_T_334, 4, 4) @[axi4_to_ahb.scala 175:45]
                  node _T_355 = geq(UInt<3>("h04"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_356 = and(_T_354, _T_355) @[axi4_to_ahb.scala 175:49]
                  node _T_357 = orr(_T_356) @[axi4_to_ahb.scala 175:78]
                  node _T_358 = bits(_T_334, 5, 5) @[axi4_to_ahb.scala 175:45]
                  node _T_359 = geq(UInt<3>("h05"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_360 = and(_T_358, _T_359) @[axi4_to_ahb.scala 175:49]
                  node _T_361 = orr(_T_360) @[axi4_to_ahb.scala 175:78]
                  node _T_362 = bits(_T_334, 6, 6) @[axi4_to_ahb.scala 175:45]
                  node _T_363 = geq(UInt<3>("h06"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_364 = and(_T_362, _T_363) @[axi4_to_ahb.scala 175:49]
                  node _T_365 = orr(_T_364) @[axi4_to_ahb.scala 175:78]
                  node _T_366 = bits(_T_334, 7, 7) @[axi4_to_ahb.scala 175:45]
                  node _T_367 = geq(UInt<3>("h07"), _T_337) @[axi4_to_ahb.scala 175:63]
                  node _T_368 = and(_T_366, _T_367) @[axi4_to_ahb.scala 175:49]
                  node _T_369 = orr(_T_368) @[axi4_to_ahb.scala 175:78]
                  node _T_370 = mux(_T_369, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_371 = mux(_T_365, UInt<3>("h06"), _T_370) @[Mux.scala 98:16]
                  node _T_372 = mux(_T_361, UInt<3>("h05"), _T_371) @[Mux.scala 98:16]
                  node _T_373 = mux(_T_357, UInt<3>("h04"), _T_372) @[Mux.scala 98:16]
                  node _T_374 = mux(_T_353, UInt<2>("h03"), _T_373) @[Mux.scala 98:16]
                  node _T_375 = mux(_T_349, UInt<2>("h02"), _T_374) @[Mux.scala 98:16]
                  node _T_376 = mux(_T_345, UInt<1>("h01"), _T_375) @[Mux.scala 98:16]
                  node _T_377 = mux(_T_341, UInt<1>("h00"), _T_376) @[Mux.scala 98:16]
                  node _T_378 = dshr(buf_byteen, _T_377) @[axi4_to_ahb.scala 304:131]
                  node _T_379 = bits(_T_378, 0, 0) @[axi4_to_ahb.scala 304:131]
                  node _T_380 = eq(_T_379, UInt<1>("h00")) @[axi4_to_ahb.scala 304:202]
                  node _T_381 = or(_T_332, _T_380) @[axi4_to_ahb.scala 304:118]
                  node _T_382 = and(_T_331, _T_381) @[axi4_to_ahb.scala 304:82]
                  node _T_383 = or(ahb_hresp_q, _T_382) @[axi4_to_ahb.scala 304:32]
                  cmd_done <= _T_383 @[axi4_to_ahb.scala 304:16]
                  node _T_384 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 305:33]
                  node _T_385 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 305:64]
                  node _T_386 = and(_T_384, _T_385) @[axi4_to_ahb.scala 305:48]
                  bypass_en <= _T_386 @[axi4_to_ahb.scala 305:17]
                  node _T_387 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 306:44]
                  node _T_388 = eq(_T_387, UInt<1>("h00")) @[axi4_to_ahb.scala 306:33]
                  node _T_389 = or(_T_388, bypass_en) @[axi4_to_ahb.scala 306:57]
                  node _T_390 = bits(_T_389, 0, 0) @[Bitwise.scala 72:15]
                  node _T_391 = mux(_T_390, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_392 = and(_T_391, UInt<2>("h02")) @[axi4_to_ahb.scala 306:71]
                  io.ahb_htrans <= _T_392 @[axi4_to_ahb.scala 306:21]
                  node _T_393 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 307:55]
                  node _T_394 = and(buf_state_en, _T_393) @[axi4_to_ahb.scala 307:39]
                  slave_valid_pre <= _T_394 @[axi4_to_ahb.scala 307:23]
                  node _T_395 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 308:33]
                  node _T_396 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 308:63]
                  node _T_397 = neq(_T_396, UInt<1>("h00")) @[axi4_to_ahb.scala 308:70]
                  node _T_398 = and(_T_395, _T_397) @[axi4_to_ahb.scala 308:48]
                  trxn_done <= _T_398 @[axi4_to_ahb.scala 308:17]
                  node _T_399 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 309:40]
                  buf_cmd_byte_ptr_en <= _T_399 @[axi4_to_ahb.scala 309:27]
                  node _T_400 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 310:76]
                  node _T_401 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
                  node _T_402 = tail(_T_401, 1) @[axi4_to_ahb.scala 174:52]
                  node _T_403 = mux(UInt<1>("h00"), _T_402, UInt<1>("h00")) @[axi4_to_ahb.scala 174:24]
                  node _T_404 = bits(_T_400, 0, 0) @[axi4_to_ahb.scala 175:45]
                  node _T_405 = geq(UInt<1>("h00"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_406 = and(_T_404, _T_405) @[axi4_to_ahb.scala 175:49]
                  node _T_407 = orr(_T_406) @[axi4_to_ahb.scala 175:78]
                  node _T_408 = bits(_T_400, 1, 1) @[axi4_to_ahb.scala 175:45]
                  node _T_409 = geq(UInt<1>("h01"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_410 = and(_T_408, _T_409) @[axi4_to_ahb.scala 175:49]
                  node _T_411 = orr(_T_410) @[axi4_to_ahb.scala 175:78]
                  node _T_412 = bits(_T_400, 2, 2) @[axi4_to_ahb.scala 175:45]
                  node _T_413 = geq(UInt<2>("h02"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_414 = and(_T_412, _T_413) @[axi4_to_ahb.scala 175:49]
                  node _T_415 = orr(_T_414) @[axi4_to_ahb.scala 175:78]
                  node _T_416 = bits(_T_400, 3, 3) @[axi4_to_ahb.scala 175:45]
                  node _T_417 = geq(UInt<2>("h03"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_418 = and(_T_416, _T_417) @[axi4_to_ahb.scala 175:49]
                  node _T_419 = orr(_T_418) @[axi4_to_ahb.scala 175:78]
                  node _T_420 = bits(_T_400, 4, 4) @[axi4_to_ahb.scala 175:45]
                  node _T_421 = geq(UInt<3>("h04"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_422 = and(_T_420, _T_421) @[axi4_to_ahb.scala 175:49]
                  node _T_423 = orr(_T_422) @[axi4_to_ahb.scala 175:78]
                  node _T_424 = bits(_T_400, 5, 5) @[axi4_to_ahb.scala 175:45]
                  node _T_425 = geq(UInt<3>("h05"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_426 = and(_T_424, _T_425) @[axi4_to_ahb.scala 175:49]
                  node _T_427 = orr(_T_426) @[axi4_to_ahb.scala 175:78]
                  node _T_428 = bits(_T_400, 6, 6) @[axi4_to_ahb.scala 175:45]
                  node _T_429 = geq(UInt<3>("h06"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_430 = and(_T_428, _T_429) @[axi4_to_ahb.scala 175:49]
                  node _T_431 = orr(_T_430) @[axi4_to_ahb.scala 175:78]
                  node _T_432 = bits(_T_400, 7, 7) @[axi4_to_ahb.scala 175:45]
                  node _T_433 = geq(UInt<3>("h07"), _T_403) @[axi4_to_ahb.scala 175:63]
                  node _T_434 = and(_T_432, _T_433) @[axi4_to_ahb.scala 175:49]
                  node _T_435 = orr(_T_434) @[axi4_to_ahb.scala 175:78]
                  node _T_436 = mux(_T_435, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_437 = mux(_T_431, UInt<3>("h06"), _T_436) @[Mux.scala 98:16]
                  node _T_438 = mux(_T_427, UInt<3>("h05"), _T_437) @[Mux.scala 98:16]
                  node _T_439 = mux(_T_423, UInt<3>("h04"), _T_438) @[Mux.scala 98:16]
                  node _T_440 = mux(_T_419, UInt<2>("h03"), _T_439) @[Mux.scala 98:16]
                  node _T_441 = mux(_T_415, UInt<2>("h02"), _T_440) @[Mux.scala 98:16]
                  node _T_442 = mux(_T_411, UInt<1>("h01"), _T_441) @[Mux.scala 98:16]
                  node _T_443 = mux(_T_407, UInt<1>("h00"), _T_442) @[Mux.scala 98:16]
                  node _T_444 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 310:142]
                  node _T_445 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 310:160]
                  node _T_446 = add(_T_444, UInt<1>("h01")) @[axi4_to_ahb.scala 174:52]
                  node _T_447 = tail(_T_446, 1) @[axi4_to_ahb.scala 174:52]
                  node _T_448 = mux(UInt<1>("h01"), _T_447, _T_444) @[axi4_to_ahb.scala 174:24]
                  node _T_449 = bits(_T_445, 0, 0) @[axi4_to_ahb.scala 175:45]
                  node _T_450 = geq(UInt<1>("h00"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_451 = and(_T_449, _T_450) @[axi4_to_ahb.scala 175:49]
                  node _T_452 = orr(_T_451) @[axi4_to_ahb.scala 175:78]
                  node _T_453 = bits(_T_445, 1, 1) @[axi4_to_ahb.scala 175:45]
                  node _T_454 = geq(UInt<1>("h01"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_455 = and(_T_453, _T_454) @[axi4_to_ahb.scala 175:49]
                  node _T_456 = orr(_T_455) @[axi4_to_ahb.scala 175:78]
                  node _T_457 = bits(_T_445, 2, 2) @[axi4_to_ahb.scala 175:45]
                  node _T_458 = geq(UInt<2>("h02"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_459 = and(_T_457, _T_458) @[axi4_to_ahb.scala 175:49]
                  node _T_460 = orr(_T_459) @[axi4_to_ahb.scala 175:78]
                  node _T_461 = bits(_T_445, 3, 3) @[axi4_to_ahb.scala 175:45]
                  node _T_462 = geq(UInt<2>("h03"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_463 = and(_T_461, _T_462) @[axi4_to_ahb.scala 175:49]
                  node _T_464 = orr(_T_463) @[axi4_to_ahb.scala 175:78]
                  node _T_465 = bits(_T_445, 4, 4) @[axi4_to_ahb.scala 175:45]
                  node _T_466 = geq(UInt<3>("h04"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_467 = and(_T_465, _T_466) @[axi4_to_ahb.scala 175:49]
                  node _T_468 = orr(_T_467) @[axi4_to_ahb.scala 175:78]
                  node _T_469 = bits(_T_445, 5, 5) @[axi4_to_ahb.scala 175:45]
                  node _T_470 = geq(UInt<3>("h05"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_471 = and(_T_469, _T_470) @[axi4_to_ahb.scala 175:49]
                  node _T_472 = orr(_T_471) @[axi4_to_ahb.scala 175:78]
                  node _T_473 = bits(_T_445, 6, 6) @[axi4_to_ahb.scala 175:45]
                  node _T_474 = geq(UInt<3>("h06"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_475 = and(_T_473, _T_474) @[axi4_to_ahb.scala 175:49]
                  node _T_476 = orr(_T_475) @[axi4_to_ahb.scala 175:78]
                  node _T_477 = bits(_T_445, 7, 7) @[axi4_to_ahb.scala 175:45]
                  node _T_478 = geq(UInt<3>("h07"), _T_448) @[axi4_to_ahb.scala 175:63]
                  node _T_479 = and(_T_477, _T_478) @[axi4_to_ahb.scala 175:49]
                  node _T_480 = orr(_T_479) @[axi4_to_ahb.scala 175:78]
                  node _T_481 = mux(_T_480, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_482 = mux(_T_476, UInt<3>("h06"), _T_481) @[Mux.scala 98:16]
                  node _T_483 = mux(_T_472, UInt<3>("h05"), _T_482) @[Mux.scala 98:16]
                  node _T_484 = mux(_T_468, UInt<3>("h04"), _T_483) @[Mux.scala 98:16]
                  node _T_485 = mux(_T_464, UInt<2>("h03"), _T_484) @[Mux.scala 98:16]
                  node _T_486 = mux(_T_460, UInt<2>("h02"), _T_485) @[Mux.scala 98:16]
                  node _T_487 = mux(_T_456, UInt<1>("h01"), _T_486) @[Mux.scala 98:16]
                  node _T_488 = mux(_T_452, UInt<1>("h00"), _T_487) @[Mux.scala 98:16]
                  node _T_489 = mux(trxn_done, _T_488, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 310:97]
                  node _T_490 = mux(bypass_en, _T_443, _T_489) @[axi4_to_ahb.scala 310:30]
                  buf_cmd_byte_ptr <= _T_490 @[axi4_to_ahb.scala 310:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_491 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_491 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 314:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 315:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 316:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 317:23]
                    skip @[Conditional.scala 39:67]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 321:16]
    node _T_492 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 322:33]
    node _T_493 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 322:73]
    node _T_494 = eq(_T_493, UInt<1>("h01")) @[axi4_to_ahb.scala 322:80]
    node _T_495 = and(buf_aligned_in, _T_494) @[axi4_to_ahb.scala 322:60]
    node _T_496 = bits(_T_495, 0, 0) @[axi4_to_ahb.scala 322:100]
    node _T_497 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 322:132]
    node _T_498 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 166:50]
    node _T_499 = eq(_T_498, UInt<8>("h0ff")) @[axi4_to_ahb.scala 166:57]
    node _T_500 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 166:81]
    node _T_501 = eq(_T_500, UInt<8>("h0f")) @[axi4_to_ahb.scala 166:88]
    node _T_502 = or(_T_499, _T_501) @[axi4_to_ahb.scala 166:70]
    node _T_503 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 166:117]
    node _T_504 = eq(_T_503, UInt<8>("h03")) @[axi4_to_ahb.scala 166:124]
    node _T_505 = or(_T_502, _T_504) @[axi4_to_ahb.scala 166:106]
    node _T_506 = bits(_T_505, 0, 0) @[Bitwise.scala 72:15]
    node _T_507 = mux(_T_506, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_508 = and(UInt<3>("h00"), _T_507) @[axi4_to_ahb.scala 166:29]
    node _T_509 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 167:35]
    node _T_510 = eq(_T_509, UInt<8>("h0c")) @[axi4_to_ahb.scala 167:42]
    node _T_511 = bits(_T_510, 0, 0) @[Bitwise.scala 72:15]
    node _T_512 = mux(_T_511, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_513 = and(UInt<2>("h02"), _T_512) @[axi4_to_ahb.scala 167:15]
    node _T_514 = or(_T_508, _T_513) @[axi4_to_ahb.scala 166:146]
    node _T_515 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 168:36]
    node _T_516 = eq(_T_515, UInt<8>("h0f0")) @[axi4_to_ahb.scala 168:43]
    node _T_517 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 168:67]
    node _T_518 = eq(_T_517, UInt<8>("h03")) @[axi4_to_ahb.scala 168:74]
    node _T_519 = or(_T_516, _T_518) @[axi4_to_ahb.scala 168:56]
    node _T_520 = bits(_T_519, 0, 0) @[Bitwise.scala 72:15]
    node _T_521 = mux(_T_520, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_522 = and(UInt<3>("h04"), _T_521) @[axi4_to_ahb.scala 168:15]
    node _T_523 = or(_T_514, _T_522) @[axi4_to_ahb.scala 167:63]
    node _T_524 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 169:37]
    node _T_525 = eq(_T_524, UInt<8>("h0c0")) @[axi4_to_ahb.scala 169:44]
    node _T_526 = bits(_T_525, 0, 0) @[Bitwise.scala 72:15]
    node _T_527 = mux(_T_526, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_528 = and(UInt<3>("h06"), _T_527) @[axi4_to_ahb.scala 169:17]
    node _T_529 = or(_T_523, _T_528) @[axi4_to_ahb.scala 168:96]
    node _T_530 = bits(_T_497, 7, 0) @[axi4_to_ahb.scala 170:37]
    node _T_531 = eq(_T_530, UInt<8>("h0c0")) @[axi4_to_ahb.scala 170:44]
    node _T_532 = bits(_T_531, 0, 0) @[Bitwise.scala 72:15]
    node _T_533 = mux(_T_532, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_534 = and(UInt<3>("h06"), _T_533) @[axi4_to_ahb.scala 170:17]
    node _T_535 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 322:152]
    node _T_536 = mux(_T_496, _T_529, _T_535) @[axi4_to_ahb.scala 322:43]
    node _T_537 = cat(_T_492, _T_536) @[Cat.scala 29:58]
    buf_addr_in <= _T_537 @[axi4_to_ahb.scala 322:15]
    node _T_538 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 323:27]
    buf_tag_in <= _T_538 @[axi4_to_ahb.scala 323:14]
    node _T_539 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 324:32]
    buf_byteen_in <= _T_539 @[axi4_to_ahb.scala 324:17]
    node _T_540 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 325:33]
    node _T_541 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 325:59]
    node _T_542 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 325:80]
    node _T_543 = mux(_T_540, _T_541, _T_542) @[axi4_to_ahb.scala 325:21]
    buf_data_in <= _T_543 @[axi4_to_ahb.scala 325:15]
    node _T_544 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 326:52]
    node _T_545 = eq(_T_544, UInt<2>("h03")) @[axi4_to_ahb.scala 326:58]
    node _T_546 = and(buf_aligned_in, _T_545) @[axi4_to_ahb.scala 326:38]
    node _T_547 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 326:84]
    node _T_548 = eq(_T_547, UInt<1>("h01")) @[axi4_to_ahb.scala 326:91]
    node _T_549 = and(_T_546, _T_548) @[axi4_to_ahb.scala 326:71]
    node _T_550 = bits(_T_549, 0, 0) @[axi4_to_ahb.scala 326:111]
    node _T_551 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 326:142]
    node _T_552 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 160:40]
    node _T_553 = eq(_T_552, UInt<8>("h0ff")) @[axi4_to_ahb.scala 160:47]
    node _T_554 = bits(_T_553, 0, 0) @[Bitwise.scala 72:15]
    node _T_555 = mux(_T_554, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_556 = and(UInt<2>("h03"), _T_555) @[axi4_to_ahb.scala 160:23]
    node _T_557 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 161:35]
    node _T_558 = eq(_T_557, UInt<8>("h0f0")) @[axi4_to_ahb.scala 161:42]
    node _T_559 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 161:64]
    node _T_560 = eq(_T_559, UInt<8>("h0f")) @[axi4_to_ahb.scala 161:71]
    node _T_561 = or(_T_558, _T_560) @[axi4_to_ahb.scala 161:55]
    node _T_562 = bits(_T_561, 0, 0) @[Bitwise.scala 72:15]
    node _T_563 = mux(_T_562, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_564 = and(UInt<2>("h02"), _T_563) @[axi4_to_ahb.scala 161:16]
    node _T_565 = or(_T_556, _T_564) @[axi4_to_ahb.scala 160:62]
    node _T_566 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 162:40]
    node _T_567 = eq(_T_566, UInt<8>("h0c0")) @[axi4_to_ahb.scala 162:47]
    node _T_568 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 162:69]
    node _T_569 = eq(_T_568, UInt<6>("h030")) @[axi4_to_ahb.scala 162:76]
    node _T_570 = or(_T_567, _T_569) @[axi4_to_ahb.scala 162:60]
    node _T_571 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 162:98]
    node _T_572 = eq(_T_571, UInt<8>("h0c")) @[axi4_to_ahb.scala 162:105]
    node _T_573 = or(_T_570, _T_572) @[axi4_to_ahb.scala 162:89]
    node _T_574 = bits(_T_551, 7, 0) @[axi4_to_ahb.scala 162:132]
    node _T_575 = eq(_T_574, UInt<8>("h03")) @[axi4_to_ahb.scala 162:139]
    node _T_576 = or(_T_573, _T_575) @[axi4_to_ahb.scala 162:123]
    node _T_577 = bits(_T_576, 0, 0) @[Bitwise.scala 72:15]
    node _T_578 = mux(_T_577, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_579 = and(UInt<2>("h01"), _T_578) @[axi4_to_ahb.scala 162:21]
    node _T_580 = or(_T_565, _T_579) @[axi4_to_ahb.scala 161:93]
    node _T_581 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 326:161]
    node _T_582 = mux(_T_550, _T_580, _T_581) @[axi4_to_ahb.scala 326:21]
    buf_size_in <= _T_582 @[axi4_to_ahb.scala 326:15]
    node _T_583 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 327:32]
    node _T_584 = eq(_T_583, UInt<1>("h00")) @[axi4_to_ahb.scala 327:39]
    node _T_585 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 328:17]
    node _T_586 = eq(_T_585, UInt<1>("h00")) @[axi4_to_ahb.scala 328:24]
    node _T_587 = or(_T_584, _T_586) @[axi4_to_ahb.scala 327:48]
    node _T_588 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 328:47]
    node _T_589 = eq(_T_588, UInt<2>("h01")) @[axi4_to_ahb.scala 328:54]
    node _T_590 = or(_T_587, _T_589) @[axi4_to_ahb.scala 328:33]
    node _T_591 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 328:86]
    node _T_592 = eq(_T_591, UInt<2>("h02")) @[axi4_to_ahb.scala 328:93]
    node _T_593 = or(_T_590, _T_592) @[axi4_to_ahb.scala 328:72]
    node _T_594 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 329:18]
    node _T_595 = eq(_T_594, UInt<2>("h03")) @[axi4_to_ahb.scala 329:25]
    node _T_596 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 329:55]
    node _T_597 = eq(_T_596, UInt<2>("h03")) @[axi4_to_ahb.scala 329:62]
    node _T_598 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 329:90]
    node _T_599 = eq(_T_598, UInt<4>("h0c")) @[axi4_to_ahb.scala 329:97]
    node _T_600 = or(_T_597, _T_599) @[axi4_to_ahb.scala 329:74]
    node _T_601 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 329:125]
    node _T_602 = eq(_T_601, UInt<6>("h030")) @[axi4_to_ahb.scala 329:132]
    node _T_603 = or(_T_600, _T_602) @[axi4_to_ahb.scala 329:109]
    node _T_604 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 329:161]
    node _T_605 = eq(_T_604, UInt<8>("h0c0")) @[axi4_to_ahb.scala 329:168]
    node _T_606 = or(_T_603, _T_605) @[axi4_to_ahb.scala 329:145]
    node _T_607 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 330:21]
    node _T_608 = eq(_T_607, UInt<4>("h0f")) @[axi4_to_ahb.scala 330:28]
    node _T_609 = or(_T_606, _T_608) @[axi4_to_ahb.scala 329:181]
    node _T_610 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 330:56]
    node _T_611 = eq(_T_610, UInt<8>("h0f0")) @[axi4_to_ahb.scala 330:63]
    node _T_612 = or(_T_609, _T_611) @[axi4_to_ahb.scala 330:40]
    node _T_613 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 330:92]
    node _T_614 = eq(_T_613, UInt<8>("h0ff")) @[axi4_to_ahb.scala 330:99]
    node _T_615 = or(_T_612, _T_614) @[axi4_to_ahb.scala 330:76]
    node _T_616 = and(_T_595, _T_615) @[axi4_to_ahb.scala 329:38]
    node _T_617 = or(_T_593, _T_616) @[axi4_to_ahb.scala 328:106]
    buf_aligned_in <= _T_617 @[axi4_to_ahb.scala 327:18]
    node _T_618 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 332:39]
    node _T_619 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 332:58]
    node _T_620 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 332:83]
    node _T_621 = cat(_T_619, _T_620) @[Cat.scala 29:58]
    node _T_622 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 332:104]
    node _T_623 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 332:129]
    node _T_624 = cat(_T_622, _T_623) @[Cat.scala 29:58]
    node _T_625 = mux(_T_618, _T_621, _T_624) @[axi4_to_ahb.scala 332:22]
    io.ahb_haddr <= _T_625 @[axi4_to_ahb.scala 332:16]
    node _T_626 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 333:39]
    node _T_627 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_628 = mux(_T_627, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_629 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 333:90]
    node _T_630 = and(_T_628, _T_629) @[axi4_to_ahb.scala 333:77]
    node _T_631 = cat(UInt<1>("h00"), _T_630) @[Cat.scala 29:58]
    node _T_632 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_633 = mux(_T_632, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_634 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 333:144]
    node _T_635 = and(_T_633, _T_634) @[axi4_to_ahb.scala 333:134]
    node _T_636 = cat(UInt<1>("h00"), _T_635) @[Cat.scala 29:58]
    node _T_637 = mux(_T_626, _T_631, _T_636) @[axi4_to_ahb.scala 333:22]
    io.ahb_hsize <= _T_637 @[axi4_to_ahb.scala 333:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 335:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 336:20]
    node _T_638 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 337:47]
    node _T_639 = not(_T_638) @[axi4_to_ahb.scala 337:33]
    node _T_640 = cat(UInt<1>("h01"), _T_639) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_640 @[axi4_to_ahb.scala 337:16]
    node _T_641 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 338:40]
    node _T_642 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 338:55]
    node _T_643 = eq(_T_642, UInt<1>("h01")) @[axi4_to_ahb.scala 338:62]
    node _T_644 = mux(_T_641, _T_643, buf_write) @[axi4_to_ahb.scala 338:23]
    io.ahb_hwrite <= _T_644 @[axi4_to_ahb.scala 338:17]
    node _T_645 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 339:28]
    io.ahb_hwdata <= _T_645 @[axi4_to_ahb.scala 339:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 341:15]
    node _T_646 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 342:43]
    node _T_647 = mux(_T_646, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 342:23]
    node _T_648 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_649 = mux(_T_648, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_650 = and(_T_649, UInt<2>("h02")) @[axi4_to_ahb.scala 342:88]
    node _T_651 = cat(_T_647, _T_650) @[Cat.scala 29:58]
    slave_opc <= _T_651 @[axi4_to_ahb.scala 342:13]
    node _T_652 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 343:41]
    node _T_653 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 343:66]
    node _T_654 = cat(_T_653, _T_653) @[Cat.scala 29:58]
    node _T_655 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 343:91]
    node _T_656 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 343:110]
    node _T_657 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 343:131]
    node _T_658 = mux(_T_655, _T_656, _T_657) @[axi4_to_ahb.scala 343:79]
    node _T_659 = mux(_T_652, _T_654, _T_658) @[axi4_to_ahb.scala 343:21]
    slave_rdata <= _T_659 @[axi4_to_ahb.scala 343:15]
    node _T_660 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 344:26]
    slave_tag <= _T_660 @[axi4_to_ahb.scala 344:13]
    node _T_661 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 346:33]
    node _T_662 = neq(_T_661, UInt<1>("h00")) @[axi4_to_ahb.scala 346:40]
    node _T_663 = and(_T_662, io.ahb_hready) @[axi4_to_ahb.scala 346:52]
    node _T_664 = and(_T_663, io.ahb_hwrite) @[axi4_to_ahb.scala 346:68]
    last_addr_en <= _T_664 @[axi4_to_ahb.scala 346:16]
    node _T_665 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 348:30]
    node _T_666 = and(_T_665, master_ready) @[axi4_to_ahb.scala 348:47]
    wrbuf_en <= _T_666 @[axi4_to_ahb.scala 348:12]
    node _T_667 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 349:34]
    node _T_668 = and(_T_667, master_ready) @[axi4_to_ahb.scala 349:50]
    wrbuf_data_en <= _T_668 @[axi4_to_ahb.scala 349:17]
    node _T_669 = and(master_valid, master_ready) @[axi4_to_ahb.scala 350:34]
    node _T_670 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 350:62]
    node _T_671 = eq(_T_670, UInt<1>("h01")) @[axi4_to_ahb.scala 350:69]
    node _T_672 = and(_T_669, _T_671) @[axi4_to_ahb.scala 350:49]
    wrbuf_cmd_sent <= _T_672 @[axi4_to_ahb.scala 350:18]
    node _T_673 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 351:33]
    node _T_674 = and(wrbuf_cmd_sent, _T_673) @[axi4_to_ahb.scala 351:31]
    wrbuf_rst <= _T_674 @[axi4_to_ahb.scala 351:13]
    node _T_675 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 353:35]
    node _T_676 = and(wrbuf_vld, _T_675) @[axi4_to_ahb.scala 353:33]
    node _T_677 = eq(_T_676, UInt<1>("h00")) @[axi4_to_ahb.scala 353:21]
    node _T_678 = and(_T_677, master_ready) @[axi4_to_ahb.scala 353:52]
    io.axi_awready <= _T_678 @[axi4_to_ahb.scala 353:18]
    node _T_679 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 354:39]
    node _T_680 = and(wrbuf_data_vld, _T_679) @[axi4_to_ahb.scala 354:37]
    node _T_681 = eq(_T_680, UInt<1>("h00")) @[axi4_to_ahb.scala 354:20]
    node _T_682 = and(_T_681, master_ready) @[axi4_to_ahb.scala 354:56]
    io.axi_wready <= _T_682 @[axi4_to_ahb.scala 354:17]
    node _T_683 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 355:33]
    node _T_684 = eq(_T_683, UInt<1>("h00")) @[axi4_to_ahb.scala 355:21]
    node _T_685 = and(_T_684, master_ready) @[axi4_to_ahb.scala 355:51]
    io.axi_arready <= _T_685 @[axi4_to_ahb.scala 355:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 356:16]
    node _T_686 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 358:71]
    node _T_687 = mux(_T_686, UInt<1>("h01"), wrbuf_vld) @[axi4_to_ahb.scala 358:55]
    node _T_688 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 358:91]
    node _T_689 = and(_T_687, _T_688) @[axi4_to_ahb.scala 358:89]
    reg _T_690 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 358:51]
    _T_690 <= _T_689 @[axi4_to_ahb.scala 358:51]
    wrbuf_vld <= _T_690 @[axi4_to_ahb.scala 358:21]
    node _T_691 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 359:76]
    node _T_692 = mux(_T_691, UInt<1>("h01"), wrbuf_data_vld) @[axi4_to_ahb.scala 359:55]
    node _T_693 = eq(wrbuf_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 359:102]
    node _T_694 = and(_T_692, _T_693) @[axi4_to_ahb.scala 359:100]
    reg _T_695 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 359:51]
    _T_695 <= _T_694 @[axi4_to_ahb.scala 359:51]
    wrbuf_data_vld <= _T_695 @[axi4_to_ahb.scala 359:21]
    node _T_696 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 360:65]
    node _T_697 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 360:99]
    reg _T_698 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_697 : @[Reg.scala 28:19]
      _T_698 <= _T_696 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_698 @[axi4_to_ahb.scala 360:21]
    node _T_699 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 361:67]
    node _T_700 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 361:95]
    reg _T_701 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_700 : @[Reg.scala 28:19]
      _T_701 <= _T_699 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_701 @[axi4_to_ahb.scala 361:21]
    node _T_702 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 362:55]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_702 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_703 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_703 <= io.axi_awaddr @[el2_lib.scala 514:16]
    wrbuf_addr <= _T_703 @[axi4_to_ahb.scala 362:21]
    node _T_704 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 363:59]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_704 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_705 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_705 <= io.axi_wdata @[el2_lib.scala 514:16]
    wrbuf_data <= _T_705 @[axi4_to_ahb.scala 363:21]
    node _T_706 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 364:66]
    node _T_707 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 364:99]
    reg _T_708 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_707 : @[Reg.scala 28:19]
      _T_708 <= _T_706 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_708 @[axi4_to_ahb.scala 364:21]
    node _T_709 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 365:67]
    node _T_710 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 365:100]
    reg _T_711 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_710 : @[Reg.scala 28:19]
      _T_711 <= _T_709 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_711 @[axi4_to_ahb.scala 365:21]
    node _T_712 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 366:89]
    reg _T_713 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_712 : @[Reg.scala 28:19]
      _T_713 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_713 @[axi4_to_ahb.scala 366:21]
    node _T_714 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 367:64]
    node _T_715 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 367:99]
    reg _T_716 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_715 : @[Reg.scala 28:19]
      _T_716 <= _T_714 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_716 @[axi4_to_ahb.scala 367:21]
    node _T_717 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 368:42]
    node _T_718 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 368:61]
    node _T_719 = bits(_T_718, 0, 0) @[axi4_to_ahb.scala 368:78]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_719 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_720 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_720 <= _T_717 @[el2_lib.scala 514:16]
    buf_addr <= _T_720 @[axi4_to_ahb.scala 368:21]
    node _T_721 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 369:65]
    node _T_722 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 369:94]
    reg _T_723 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_722 : @[Reg.scala 28:19]
      _T_723 <= _T_721 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_723 @[axi4_to_ahb.scala 369:21]
    node _T_724 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 370:91]
    reg _T_725 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_724 : @[Reg.scala 28:19]
      _T_725 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_725 @[axi4_to_ahb.scala 370:21]
    node _T_726 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 371:67]
    node _T_727 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 371:96]
    reg _T_728 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_727 : @[Reg.scala 28:19]
      _T_728 <= _T_726 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_728 @[axi4_to_ahb.scala 371:21]
    node _T_729 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 372:42]
    node _T_730 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 372:66]
    node _T_731 = bits(_T_730, 0, 0) @[axi4_to_ahb.scala 372:89]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_731 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_732 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_732 <= _T_729 @[el2_lib.scala 514:16]
    buf_data <= _T_732 @[axi4_to_ahb.scala 372:21]
    node _T_733 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 373:89]
    reg _T_734 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_733 : @[Reg.scala 28:19]
      _T_734 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_734 @[axi4_to_ahb.scala 373:21]
    node _T_735 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 374:61]
    node _T_736 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 374:99]
    reg _T_737 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_736 : @[Reg.scala 28:19]
      _T_737 <= _T_735 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_737 @[axi4_to_ahb.scala 374:21]
    node _T_738 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 375:99]
    reg _T_739 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_738 : @[Reg.scala 28:19]
      _T_739 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_739 @[axi4_to_ahb.scala 375:21]
    node _T_740 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 376:72]
    node _T_741 = mux(_T_740, UInt<1>("h01"), cmd_doneQ) @[axi4_to_ahb.scala 376:56]
    node _T_742 = eq(cmd_done_rst, UInt<1>("h00")) @[axi4_to_ahb.scala 376:92]
    node _T_743 = and(_T_741, _T_742) @[axi4_to_ahb.scala 376:90]
    reg _T_744 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 376:52]
    _T_744 <= _T_743 @[axi4_to_ahb.scala 376:52]
    cmd_doneQ <= _T_744 @[axi4_to_ahb.scala 376:21]
    node _T_745 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 377:71]
    node _T_746 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 377:110]
    reg _T_747 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_746 : @[Reg.scala 28:19]
      _T_747 <= _T_745 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_747 @[axi4_to_ahb.scala 377:21]
    reg _T_748 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 378:52]
    _T_748 <= io.ahb_hready @[axi4_to_ahb.scala 378:52]
    ahb_hready_q <= _T_748 @[axi4_to_ahb.scala 378:21]
    node _T_749 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 379:66]
    reg _T_750 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 379:52]
    _T_750 <= _T_749 @[axi4_to_ahb.scala 379:52]
    ahb_htrans_q <= _T_750 @[axi4_to_ahb.scala 379:21]
    reg _T_751 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 380:57]
    _T_751 <= io.ahb_hwrite @[axi4_to_ahb.scala 380:57]
    ahb_hwrite_q <= _T_751 @[axi4_to_ahb.scala 380:21]
    reg _T_752 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 381:52]
    _T_752 <= io.ahb_hresp @[axi4_to_ahb.scala 381:52]
    ahb_hresp_q <= _T_752 @[axi4_to_ahb.scala 381:21]
    node _T_753 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 382:71]
    reg _T_754 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 382:57]
    _T_754 <= _T_753 @[axi4_to_ahb.scala 382:57]
    ahb_hrdata_q <= _T_754 @[axi4_to_ahb.scala 382:21]
    node _T_755 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 384:43]
    node _T_756 = or(_T_755, io.clk_override) @[axi4_to_ahb.scala 384:58]
    node _T_757 = and(io.bus_clk_en, _T_756) @[axi4_to_ahb.scala 384:30]
    buf_clken <= _T_757 @[axi4_to_ahb.scala 384:13]
    node _T_758 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 385:69]
    node _T_759 = and(io.ahb_hready, _T_758) @[axi4_to_ahb.scala 385:54]
    node _T_760 = or(_T_759, io.clk_override) @[axi4_to_ahb.scala 385:74]
    node _T_761 = and(io.bus_clk_en, _T_760) @[axi4_to_ahb.scala 385:36]
    ahbm_addr_clken <= _T_761 @[axi4_to_ahb.scala 385:19]
    node _T_762 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 386:50]
    node _T_763 = or(_T_762, io.clk_override) @[axi4_to_ahb.scala 386:60]
    node _T_764 = and(io.bus_clk_en, _T_763) @[axi4_to_ahb.scala 386:36]
    ahbm_data_clken <= _T_764 @[axi4_to_ahb.scala 386:19]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_6.io.l1clk @[axi4_to_ahb.scala 389:12]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_7.io.l1clk @[axi4_to_ahb.scala 390:12]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_8.io.l1clk @[axi4_to_ahb.scala 391:17]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_9.io.l1clk @[axi4_to_ahb.scala 392:17]
    
