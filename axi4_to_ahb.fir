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
    
  module axi4_to_ahb : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip bus_clk_en : UInt<1>, flip clk_override : UInt<1>, flip axi_awvalid : UInt<1>, flip axi_awid : UInt<1>, flip axi_awaddr : UInt<32>, flip axi_awsize : UInt<3>, flip axi_awprot : UInt<3>, flip axi_wvalid : UInt<1>, flip axi_wdata : UInt<64>, flip axi_wstrb : UInt<8>, flip axi_wlast : UInt<1>, flip axi_bready : UInt<1>, flip axi_arvalid : UInt<1>, flip axi_arid : UInt<1>, flip axi_araddr : UInt<32>, flip axi_arsize : UInt<3>, flip axi_arprot : UInt<3>, flip axi_rready : UInt<1>, flip ahb_hrdata : UInt<64>, flip ahb_hready : UInt<1>, flip ahb_hresp : UInt<1>, axi_awready : UInt<1>, axi_wready : UInt<1>, axi_bvalid : UInt<1>, axi_bresp : UInt<2>, axi_bid : UInt<1>, axi_arready : UInt<1>, axi_rvalid : UInt<1>, axi_rid : UInt<1>, axi_rdata : UInt<32>, axi_rresp : UInt<2>, axi_rlast : UInt<1>, ahb_haddr : UInt<32>, ahb_hburst : UInt<3>, ahb_hmastlock : UInt<1>, ahb_hprot : UInt<4>, ahb_hsize : UInt<3>, ahb_htrans : UInt<2>, ahb_hwrite : UInt<1>, ahb_hwdata : UInt<64>}
    
    reg state : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[axi4_to_ahb.scala 61:22]
    reg buf_state : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[axi4_to_ahb.scala 62:26]
    reg buf_nxtstate : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[axi4_to_ahb.scala 63:29]
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
    wire bus_clk : Clock @[axi4_to_ahb.scala 83:21]
    wire bus_write_clk : Clock @[axi4_to_ahb.scala 84:27]
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
    wire buf_clk : Clock @[axi4_to_ahb.scala 151:21]
    wire ahbm_clk : Clock @[axi4_to_ahb.scala 153:22]
    wire ahbm_addr_clk : Clock @[axi4_to_ahb.scala 154:27]
    wire ahbm_data_clk : Clock @[axi4_to_ahb.scala 155:27]
    node _T = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 183:30]
    node _T_1 = and(_T, master_ready) @[axi4_to_ahb.scala 183:47]
    wrbuf_en <= _T_1 @[axi4_to_ahb.scala 183:12]
    node _T_2 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 184:34]
    node _T_3 = and(_T_2, master_ready) @[axi4_to_ahb.scala 184:50]
    wrbuf_data_en <= _T_3 @[axi4_to_ahb.scala 184:17]
    node _T_4 = and(master_valid, master_ready) @[axi4_to_ahb.scala 185:34]
    node _T_5 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 185:62]
    node _T_6 = eq(_T_5, UInt<1>("h01")) @[axi4_to_ahb.scala 185:69]
    node _T_7 = and(_T_4, _T_6) @[axi4_to_ahb.scala 185:49]
    wrbuf_cmd_sent <= _T_7 @[axi4_to_ahb.scala 185:18]
    node _T_8 = eq(wrbuf_en, UInt<1>("h00")) @[axi4_to_ahb.scala 186:33]
    node _T_9 = and(wrbuf_cmd_sent, _T_8) @[axi4_to_ahb.scala 186:31]
    wrbuf_rst <= _T_9 @[axi4_to_ahb.scala 186:13]
    node _T_10 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 188:35]
    node _T_11 = and(wrbuf_vld, _T_10) @[axi4_to_ahb.scala 188:33]
    node _T_12 = eq(_T_11, UInt<1>("h00")) @[axi4_to_ahb.scala 188:21]
    node _T_13 = and(_T_12, master_ready) @[axi4_to_ahb.scala 188:52]
    io.axi_awready <= _T_13 @[axi4_to_ahb.scala 188:18]
    node _T_14 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[axi4_to_ahb.scala 189:39]
    node _T_15 = and(wrbuf_data_vld, _T_14) @[axi4_to_ahb.scala 189:37]
    node _T_16 = eq(_T_15, UInt<1>("h00")) @[axi4_to_ahb.scala 189:20]
    node _T_17 = and(_T_16, master_ready) @[axi4_to_ahb.scala 189:56]
    io.axi_wready <= _T_17 @[axi4_to_ahb.scala 189:17]
    node _T_18 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 190:33]
    node _T_19 = eq(_T_18, UInt<1>("h00")) @[axi4_to_ahb.scala 190:21]
    node _T_20 = and(_T_19, master_ready) @[axi4_to_ahb.scala 190:51]
    io.axi_arready <= _T_20 @[axi4_to_ahb.scala 190:18]
    io.axi_rlast <= UInt<1>("h01") @[axi4_to_ahb.scala 191:16]
    node _T_21 = and(wrbuf_vld, wrbuf_data_vld) @[axi4_to_ahb.scala 193:27]
    wr_cmd_vld <= _T_21 @[axi4_to_ahb.scala 193:14]
    node _T_22 = or(wr_cmd_vld, io.axi_arvalid) @[axi4_to_ahb.scala 194:30]
    master_valid <= _T_22 @[axi4_to_ahb.scala 194:16]
    node _T_23 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 195:38]
    node _T_24 = bits(wrbuf_tag, 0, 0) @[axi4_to_ahb.scala 195:51]
    node _T_25 = bits(io.axi_arid, 0, 0) @[axi4_to_ahb.scala 195:76]
    node _T_26 = mux(_T_23, _T_24, _T_25) @[axi4_to_ahb.scala 195:20]
    master_tag <= _T_26 @[axi4_to_ahb.scala 195:14]
    node _T_27 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 196:38]
    node _T_28 = mux(_T_27, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 196:20]
    master_opc <= _T_28 @[axi4_to_ahb.scala 196:14]
    node _T_29 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 197:39]
    node _T_30 = bits(wrbuf_addr, 31, 0) @[axi4_to_ahb.scala 197:53]
    node _T_31 = bits(io.axi_araddr, 31, 0) @[axi4_to_ahb.scala 197:75]
    node _T_32 = mux(_T_29, _T_30, _T_31) @[axi4_to_ahb.scala 197:21]
    master_addr <= _T_32 @[axi4_to_ahb.scala 197:15]
    node _T_33 = bits(wr_cmd_vld, 0, 0) @[axi4_to_ahb.scala 198:39]
    node _T_34 = bits(wrbuf_size, 2, 0) @[axi4_to_ahb.scala 198:53]
    node _T_35 = bits(io.axi_arsize, 2, 0) @[axi4_to_ahb.scala 198:74]
    node _T_36 = mux(_T_33, _T_34, _T_35) @[axi4_to_ahb.scala 198:21]
    master_size <= _T_36 @[axi4_to_ahb.scala 198:15]
    node _T_37 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 199:32]
    master_byteen <= _T_37 @[axi4_to_ahb.scala 199:17]
    node _T_38 = bits(wrbuf_data, 63, 0) @[axi4_to_ahb.scala 200:29]
    master_wdata <= _T_38 @[axi4_to_ahb.scala 200:16]
    node _T_39 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 203:32]
    node _T_40 = bits(slave_opc, 3, 3) @[axi4_to_ahb.scala 203:57]
    node _T_41 = and(_T_39, _T_40) @[axi4_to_ahb.scala 203:46]
    io.axi_bvalid <= _T_41 @[axi4_to_ahb.scala 203:17]
    node _T_42 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 204:32]
    node _T_43 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 204:59]
    node _T_44 = mux(_T_43, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 204:49]
    node _T_45 = mux(_T_42, UInt<2>("h02"), _T_44) @[axi4_to_ahb.scala 204:22]
    io.axi_bresp <= _T_45 @[axi4_to_ahb.scala 204:16]
    node _T_46 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 205:26]
    io.axi_bid <= _T_46 @[axi4_to_ahb.scala 205:14]
    node _T_47 = and(slave_valid, slave_ready) @[axi4_to_ahb.scala 207:32]
    node _T_48 = bits(slave_opc, 3, 2) @[axi4_to_ahb.scala 207:58]
    node _T_49 = eq(_T_48, UInt<1>("h00")) @[axi4_to_ahb.scala 207:65]
    node _T_50 = and(_T_47, _T_49) @[axi4_to_ahb.scala 207:46]
    io.axi_rvalid <= _T_50 @[axi4_to_ahb.scala 207:17]
    node _T_51 = bits(slave_opc, 0, 0) @[axi4_to_ahb.scala 208:32]
    node _T_52 = bits(slave_opc, 1, 1) @[axi4_to_ahb.scala 208:59]
    node _T_53 = mux(_T_52, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 208:49]
    node _T_54 = mux(_T_51, UInt<2>("h02"), _T_53) @[axi4_to_ahb.scala 208:22]
    io.axi_rresp <= _T_54 @[axi4_to_ahb.scala 208:16]
    node _T_55 = bits(slave_tag, 0, 0) @[axi4_to_ahb.scala 209:26]
    io.axi_rid <= _T_55 @[axi4_to_ahb.scala 209:14]
    node _T_56 = bits(slave_rdata, 63, 0) @[axi4_to_ahb.scala 210:30]
    io.axi_rdata <= _T_56 @[axi4_to_ahb.scala 210:16]
    node _T_57 = and(io.axi_bready, io.axi_rready) @[axi4_to_ahb.scala 211:32]
    slave_ready <= _T_57 @[axi4_to_ahb.scala 211:15]
    node _T_58 = and(io.axi_awvalid, io.axi_awready) @[axi4_to_ahb.scala 214:56]
    node _T_59 = and(io.axi_wvalid, io.axi_wready) @[axi4_to_ahb.scala 214:91]
    node _T_60 = or(_T_58, _T_59) @[axi4_to_ahb.scala 214:74]
    node _T_61 = and(io.bus_clk_en, _T_60) @[axi4_to_ahb.scala 214:37]
    bus_write_clk_en <= _T_61 @[axi4_to_ahb.scala 214:20]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr.io.l1clk @[axi4_to_ahb.scala 216:11]
    node _T_62 = bits(bus_write_clk_en, 0, 0) @[axi4_to_ahb.scala 217:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_62 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_write_clk <= rvclkhdr_1.io.l1clk @[axi4_to_ahb.scala 217:17]
    io.ahb_htrans <= UInt<1>("h00") @[axi4_to_ahb.scala 220:17]
    master_ready <= UInt<1>("h00") @[axi4_to_ahb.scala 221:16]
    buf_state_en <= UInt<1>("h00") @[axi4_to_ahb.scala 222:16]
    node _T_63 = eq(UInt<3>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_63 : @[Conditional.scala 40:58]
      master_ready <= UInt<1>("h01") @[axi4_to_ahb.scala 225:20]
      node _T_64 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 226:34]
      node _T_65 = eq(_T_64, UInt<1>("h01")) @[axi4_to_ahb.scala 226:41]
      buf_write_in <= _T_65 @[axi4_to_ahb.scala 226:20]
      node _T_66 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 227:46]
      node _T_67 = mux(_T_66, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 227:26]
      buf_nxtstate <= _T_67 @[axi4_to_ahb.scala 227:20]
      node _T_68 = and(master_valid, master_ready) @[axi4_to_ahb.scala 228:36]
      buf_state_en <= _T_68 @[axi4_to_ahb.scala 228:20]
      buf_wr_en <= buf_state_en @[axi4_to_ahb.scala 229:17]
      node _T_69 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 230:54]
      node _T_70 = and(buf_state_en, _T_69) @[axi4_to_ahb.scala 230:38]
      buf_data_wr_en <= _T_70 @[axi4_to_ahb.scala 230:22]
      buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 231:27]
      node _T_71 = bits(buf_write_in, 0, 0) @[axi4_to_ahb.scala 233:50]
      node _T_72 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 233:92]
      node _T_73 = add(UInt<1>("h00"), UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
      node _T_74 = tail(_T_73, 1) @[axi4_to_ahb.scala 177:52]
      node _T_75 = mux(UInt<1>("h00"), _T_74, UInt<1>("h00")) @[axi4_to_ahb.scala 177:24]
      node _T_76 = bits(_T_72, 0, 0) @[axi4_to_ahb.scala 178:44]
      node _T_77 = geq(UInt<1>("h00"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_78 = and(_T_76, _T_77) @[axi4_to_ahb.scala 178:48]
      node _T_79 = bits(_T_72, 1, 1) @[axi4_to_ahb.scala 178:44]
      node _T_80 = geq(UInt<1>("h01"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_81 = and(_T_79, _T_80) @[axi4_to_ahb.scala 178:48]
      node _T_82 = bits(_T_72, 2, 2) @[axi4_to_ahb.scala 178:44]
      node _T_83 = geq(UInt<2>("h02"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_84 = and(_T_82, _T_83) @[axi4_to_ahb.scala 178:48]
      node _T_85 = bits(_T_72, 3, 3) @[axi4_to_ahb.scala 178:44]
      node _T_86 = geq(UInt<2>("h03"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_87 = and(_T_85, _T_86) @[axi4_to_ahb.scala 178:48]
      node _T_88 = bits(_T_72, 4, 4) @[axi4_to_ahb.scala 178:44]
      node _T_89 = geq(UInt<3>("h04"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_90 = and(_T_88, _T_89) @[axi4_to_ahb.scala 178:48]
      node _T_91 = bits(_T_72, 5, 5) @[axi4_to_ahb.scala 178:44]
      node _T_92 = geq(UInt<3>("h05"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_93 = and(_T_91, _T_92) @[axi4_to_ahb.scala 178:48]
      node _T_94 = bits(_T_72, 6, 6) @[axi4_to_ahb.scala 178:44]
      node _T_95 = geq(UInt<3>("h06"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_96 = and(_T_94, _T_95) @[axi4_to_ahb.scala 178:48]
      node _T_97 = bits(_T_72, 7, 7) @[axi4_to_ahb.scala 178:44]
      node _T_98 = geq(UInt<3>("h07"), _T_75) @[axi4_to_ahb.scala 178:62]
      node _T_99 = and(_T_97, _T_98) @[axi4_to_ahb.scala 178:48]
      node _T_100 = mux(_T_99, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
      node _T_101 = mux(_T_96, UInt<3>("h06"), _T_100) @[Mux.scala 98:16]
      node _T_102 = mux(_T_93, UInt<3>("h05"), _T_101) @[Mux.scala 98:16]
      node _T_103 = mux(_T_90, UInt<3>("h04"), _T_102) @[Mux.scala 98:16]
      node _T_104 = mux(_T_87, UInt<2>("h03"), _T_103) @[Mux.scala 98:16]
      node _T_105 = mux(_T_84, UInt<2>("h02"), _T_104) @[Mux.scala 98:16]
      node _T_106 = mux(_T_81, UInt<1>("h01"), _T_105) @[Mux.scala 98:16]
      node _T_107 = mux(_T_78, UInt<1>("h00"), _T_106) @[Mux.scala 98:16]
      node _T_108 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 233:141]
      node _T_109 = mux(_T_71, _T_107, _T_108) @[axi4_to_ahb.scala 233:30]
      buf_cmd_byte_ptr <= _T_109 @[axi4_to_ahb.scala 233:24]
      bypass_en <= buf_state_en @[axi4_to_ahb.scala 234:17]
      node _T_110 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 235:51]
      node _T_111 = and(bypass_en, _T_110) @[axi4_to_ahb.scala 235:35]
      rd_bypass_idle <= _T_111 @[axi4_to_ahb.scala 235:22]
      node _T_112 = bits(bypass_en, 0, 0) @[Bitwise.scala 72:15]
      node _T_113 = mux(_T_112, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
      node _T_114 = and(_T_113, UInt<2>("h02")) @[axi4_to_ahb.scala 236:45]
      io.ahb_htrans <= _T_114 @[axi4_to_ahb.scala 236:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_115 = eq(UInt<3>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_115 : @[Conditional.scala 39:67]
        node _T_116 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 240:54]
        node _T_117 = eq(_T_116, UInt<1>("h00")) @[axi4_to_ahb.scala 240:61]
        node _T_118 = and(master_valid, _T_117) @[axi4_to_ahb.scala 240:41]
        node _T_119 = bits(_T_118, 0, 0) @[axi4_to_ahb.scala 240:82]
        node _T_120 = mux(_T_119, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 240:26]
        buf_nxtstate <= _T_120 @[axi4_to_ahb.scala 240:20]
        node _T_121 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 241:51]
        node _T_122 = neq(_T_121, UInt<1>("h00")) @[axi4_to_ahb.scala 241:58]
        node _T_123 = and(ahb_hready_q, _T_122) @[axi4_to_ahb.scala 241:36]
        node _T_124 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 241:72]
        node _T_125 = and(_T_123, _T_124) @[axi4_to_ahb.scala 241:70]
        buf_state_en <= _T_125 @[axi4_to_ahb.scala 241:20]
        node _T_126 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 242:34]
        node _T_127 = and(buf_state_en, _T_126) @[axi4_to_ahb.scala 242:32]
        cmd_done <= _T_127 @[axi4_to_ahb.scala 242:16]
        slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 243:20]
        node _T_128 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 244:52]
        node _T_129 = neq(_T_128, UInt<1>("h00")) @[axi4_to_ahb.scala 244:59]
        node _T_130 = and(ahb_hready_q, _T_129) @[axi4_to_ahb.scala 244:37]
        node _T_131 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 244:73]
        node _T_132 = and(_T_130, _T_131) @[axi4_to_ahb.scala 244:71]
        node _T_133 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 244:104]
        node _T_134 = and(_T_132, _T_133) @[axi4_to_ahb.scala 244:88]
        master_ready <= _T_134 @[axi4_to_ahb.scala 244:20]
        buf_wr_en <= master_ready @[axi4_to_ahb.scala 245:17]
        node _T_135 = and(master_ready, master_valid) @[axi4_to_ahb.scala 246:33]
        bypass_en <= _T_135 @[axi4_to_ahb.scala 246:17]
        node _T_136 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 247:47]
        node _T_137 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 247:62]
        node _T_138 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 247:78]
        node _T_139 = mux(_T_136, _T_137, _T_138) @[axi4_to_ahb.scala 247:30]
        buf_cmd_byte_ptr <= _T_139 @[axi4_to_ahb.scala 247:24]
        node _T_140 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 248:44]
        node _T_141 = or(_T_140, bypass_en) @[axi4_to_ahb.scala 248:58]
        node _T_142 = bits(_T_141, 0, 0) @[Bitwise.scala 72:15]
        node _T_143 = mux(_T_142, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
        node _T_144 = and(UInt<2>("h02"), _T_143) @[axi4_to_ahb.scala 248:32]
        io.ahb_htrans <= _T_144 @[axi4_to_ahb.scala 248:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_145 = eq(UInt<3>("h06"), buf_state) @[Conditional.scala 37:30]
        when _T_145 : @[Conditional.scala 39:67]
          node _T_146 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 252:39]
          node _T_147 = and(ahb_hready_q, _T_146) @[axi4_to_ahb.scala 252:37]
          node _T_148 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 252:82]
          node _T_149 = eq(_T_148, UInt<1>("h01")) @[axi4_to_ahb.scala 252:89]
          node _T_150 = and(master_valid, _T_149) @[axi4_to_ahb.scala 252:70]
          node _T_151 = eq(_T_150, UInt<1>("h00")) @[axi4_to_ahb.scala 252:55]
          node _T_152 = and(_T_147, _T_151) @[axi4_to_ahb.scala 252:53]
          master_ready <= _T_152 @[axi4_to_ahb.scala 252:20]
          node _T_153 = and(master_valid, master_ready) @[axi4_to_ahb.scala 253:34]
          node _T_154 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 253:62]
          node _T_155 = eq(_T_154, UInt<1>("h00")) @[axi4_to_ahb.scala 253:69]
          node _T_156 = and(_T_153, _T_155) @[axi4_to_ahb.scala 253:49]
          buf_wr_en <= _T_156 @[axi4_to_ahb.scala 253:17]
          node _T_157 = bits(ahb_hresp_q, 0, 0) @[axi4_to_ahb.scala 254:45]
          node _T_158 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 254:84]
          node _T_159 = mux(_T_158, UInt<3>("h06"), UInt<3>("h03")) @[axi4_to_ahb.scala 254:67]
          node _T_160 = mux(_T_157, UInt<3>("h07"), _T_159) @[axi4_to_ahb.scala 254:26]
          buf_nxtstate <= _T_160 @[axi4_to_ahb.scala 254:20]
          node _T_161 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 255:37]
          buf_state_en <= _T_161 @[axi4_to_ahb.scala 255:20]
          buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 256:22]
          slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 257:23]
          slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 258:23]
          node _T_162 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 259:41]
          node _T_163 = and(buf_state_en, _T_162) @[axi4_to_ahb.scala 259:39]
          slave_valid_pre <= _T_163 @[axi4_to_ahb.scala 259:23]
          node _T_164 = eq(master_valid, UInt<1>("h00")) @[axi4_to_ahb.scala 260:34]
          node _T_165 = and(buf_state_en, _T_164) @[axi4_to_ahb.scala 260:32]
          cmd_done <= _T_165 @[axi4_to_ahb.scala 260:16]
          node _T_166 = and(master_ready, master_valid) @[axi4_to_ahb.scala 261:33]
          node _T_167 = eq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 261:64]
          node _T_168 = and(_T_166, _T_167) @[axi4_to_ahb.scala 261:48]
          node _T_169 = and(_T_168, buf_state_en) @[axi4_to_ahb.scala 261:79]
          bypass_en <= _T_169 @[axi4_to_ahb.scala 261:17]
          node _T_170 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 262:47]
          node _T_171 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 262:62]
          node _T_172 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 262:78]
          node _T_173 = mux(_T_170, _T_171, _T_172) @[axi4_to_ahb.scala 262:30]
          buf_cmd_byte_ptr <= _T_173 @[axi4_to_ahb.scala 262:24]
          node _T_174 = neq(buf_nxtstate, UInt<3>("h06")) @[axi4_to_ahb.scala 263:59]
          node _T_175 = and(_T_174, buf_state_en) @[axi4_to_ahb.scala 263:74]
          node _T_176 = eq(_T_175, UInt<1>("h00")) @[axi4_to_ahb.scala 263:43]
          node _T_177 = bits(_T_176, 0, 0) @[Bitwise.scala 72:15]
          node _T_178 = mux(_T_177, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
          node _T_179 = and(UInt<2>("h02"), _T_178) @[axi4_to_ahb.scala 263:32]
          io.ahb_htrans <= _T_179 @[axi4_to_ahb.scala 263:21]
          slvbuf_wr_en <= buf_wr_en @[axi4_to_ahb.scala 264:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_180 = eq(UInt<3>("h07"), buf_state) @[Conditional.scala 37:30]
          when _T_180 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<3>("h03") @[axi4_to_ahb.scala 268:20]
            node _T_181 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 269:51]
            node _T_182 = neq(_T_181, UInt<1>("h00")) @[axi4_to_ahb.scala 269:58]
            node _T_183 = and(ahb_hready_q, _T_182) @[axi4_to_ahb.scala 269:36]
            node _T_184 = eq(ahb_hwrite_q, UInt<1>("h00")) @[axi4_to_ahb.scala 269:72]
            node _T_185 = and(_T_183, _T_184) @[axi4_to_ahb.scala 269:70]
            buf_state_en <= _T_185 @[axi4_to_ahb.scala 269:20]
            slave_valid_pre <= buf_state_en @[axi4_to_ahb.scala 270:23]
            slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 271:20]
            node _T_186 = bits(buf_addr, 2, 0) @[axi4_to_ahb.scala 272:35]
            buf_cmd_byte_ptr <= _T_186 @[axi4_to_ahb.scala 272:24]
            node _T_187 = eq(buf_state_en, UInt<1>("h00")) @[axi4_to_ahb.scala 273:47]
            node _T_188 = bits(_T_187, 0, 0) @[Bitwise.scala 72:15]
            node _T_189 = mux(_T_188, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
            node _T_190 = and(UInt<2>("h02"), _T_189) @[axi4_to_ahb.scala 273:37]
            io.ahb_htrans <= _T_190 @[axi4_to_ahb.scala 273:21]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_191 = eq(UInt<3>("h03"), buf_state) @[Conditional.scala 37:30]
            when _T_191 : @[Conditional.scala 39:67]
              buf_nxtstate <= UInt<3>("h05") @[axi4_to_ahb.scala 277:20]
              node _T_192 = or(ahb_hready_q, ahb_hresp_q) @[axi4_to_ahb.scala 278:37]
              buf_state_en <= _T_192 @[axi4_to_ahb.scala 278:20]
              buf_data_wr_en <= buf_state_en @[axi4_to_ahb.scala 279:22]
              slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 280:23]
              slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 281:23]
              slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 282:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_193 = eq(UInt<3>("h02"), buf_state) @[Conditional.scala 37:30]
              when _T_193 : @[Conditional.scala 39:67]
                buf_nxtstate <= UInt<3>("h04") @[axi4_to_ahb.scala 286:20]
                node _T_194 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 287:33]
                node _T_195 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 287:63]
                node _T_196 = neq(_T_195, UInt<1>("h00")) @[axi4_to_ahb.scala 287:70]
                node _T_197 = and(_T_194, _T_196) @[axi4_to_ahb.scala 287:48]
                trxn_done <= _T_197 @[axi4_to_ahb.scala 287:17]
                buf_state_en <= trxn_done @[axi4_to_ahb.scala 288:20]
                buf_cmd_byte_ptr_en <= buf_state_en @[axi4_to_ahb.scala 289:27]
                slvbuf_wr_en <= buf_state_en @[axi4_to_ahb.scala 290:20]
                node _T_198 = bits(trxn_done, 0, 0) @[axi4_to_ahb.scala 291:47]
                node _T_199 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 291:85]
                node _T_200 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 291:103]
                node _T_201 = add(_T_199, UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
                node _T_202 = tail(_T_201, 1) @[axi4_to_ahb.scala 177:52]
                node _T_203 = mux(UInt<1>("h01"), _T_202, _T_199) @[axi4_to_ahb.scala 177:24]
                node _T_204 = bits(_T_200, 0, 0) @[axi4_to_ahb.scala 178:44]
                node _T_205 = geq(UInt<1>("h00"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_206 = and(_T_204, _T_205) @[axi4_to_ahb.scala 178:48]
                node _T_207 = bits(_T_200, 1, 1) @[axi4_to_ahb.scala 178:44]
                node _T_208 = geq(UInt<1>("h01"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_209 = and(_T_207, _T_208) @[axi4_to_ahb.scala 178:48]
                node _T_210 = bits(_T_200, 2, 2) @[axi4_to_ahb.scala 178:44]
                node _T_211 = geq(UInt<2>("h02"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_212 = and(_T_210, _T_211) @[axi4_to_ahb.scala 178:48]
                node _T_213 = bits(_T_200, 3, 3) @[axi4_to_ahb.scala 178:44]
                node _T_214 = geq(UInt<2>("h03"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_215 = and(_T_213, _T_214) @[axi4_to_ahb.scala 178:48]
                node _T_216 = bits(_T_200, 4, 4) @[axi4_to_ahb.scala 178:44]
                node _T_217 = geq(UInt<3>("h04"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_218 = and(_T_216, _T_217) @[axi4_to_ahb.scala 178:48]
                node _T_219 = bits(_T_200, 5, 5) @[axi4_to_ahb.scala 178:44]
                node _T_220 = geq(UInt<3>("h05"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_221 = and(_T_219, _T_220) @[axi4_to_ahb.scala 178:48]
                node _T_222 = bits(_T_200, 6, 6) @[axi4_to_ahb.scala 178:44]
                node _T_223 = geq(UInt<3>("h06"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_224 = and(_T_222, _T_223) @[axi4_to_ahb.scala 178:48]
                node _T_225 = bits(_T_200, 7, 7) @[axi4_to_ahb.scala 178:44]
                node _T_226 = geq(UInt<3>("h07"), _T_203) @[axi4_to_ahb.scala 178:62]
                node _T_227 = and(_T_225, _T_226) @[axi4_to_ahb.scala 178:48]
                node _T_228 = mux(_T_227, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_229 = mux(_T_224, UInt<3>("h06"), _T_228) @[Mux.scala 98:16]
                node _T_230 = mux(_T_221, UInt<3>("h05"), _T_229) @[Mux.scala 98:16]
                node _T_231 = mux(_T_218, UInt<3>("h04"), _T_230) @[Mux.scala 98:16]
                node _T_232 = mux(_T_215, UInt<2>("h03"), _T_231) @[Mux.scala 98:16]
                node _T_233 = mux(_T_212, UInt<2>("h02"), _T_232) @[Mux.scala 98:16]
                node _T_234 = mux(_T_209, UInt<1>("h01"), _T_233) @[Mux.scala 98:16]
                node _T_235 = mux(_T_206, UInt<1>("h00"), _T_234) @[Mux.scala 98:16]
                node _T_236 = mux(_T_198, _T_235, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 291:30]
                buf_cmd_byte_ptr <= _T_236 @[axi4_to_ahb.scala 291:24]
                node _T_237 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 292:65]
                node _T_238 = or(buf_aligned, _T_237) @[axi4_to_ahb.scala 292:44]
                node _T_239 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 292:127]
                node _T_240 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 292:145]
                node _T_241 = add(_T_239, UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
                node _T_242 = tail(_T_241, 1) @[axi4_to_ahb.scala 177:52]
                node _T_243 = mux(UInt<1>("h01"), _T_242, _T_239) @[axi4_to_ahb.scala 177:24]
                node _T_244 = bits(_T_240, 0, 0) @[axi4_to_ahb.scala 178:44]
                node _T_245 = geq(UInt<1>("h00"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_246 = and(_T_244, _T_245) @[axi4_to_ahb.scala 178:48]
                node _T_247 = bits(_T_240, 1, 1) @[axi4_to_ahb.scala 178:44]
                node _T_248 = geq(UInt<1>("h01"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_249 = and(_T_247, _T_248) @[axi4_to_ahb.scala 178:48]
                node _T_250 = bits(_T_240, 2, 2) @[axi4_to_ahb.scala 178:44]
                node _T_251 = geq(UInt<2>("h02"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_252 = and(_T_250, _T_251) @[axi4_to_ahb.scala 178:48]
                node _T_253 = bits(_T_240, 3, 3) @[axi4_to_ahb.scala 178:44]
                node _T_254 = geq(UInt<2>("h03"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_255 = and(_T_253, _T_254) @[axi4_to_ahb.scala 178:48]
                node _T_256 = bits(_T_240, 4, 4) @[axi4_to_ahb.scala 178:44]
                node _T_257 = geq(UInt<3>("h04"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_258 = and(_T_256, _T_257) @[axi4_to_ahb.scala 178:48]
                node _T_259 = bits(_T_240, 5, 5) @[axi4_to_ahb.scala 178:44]
                node _T_260 = geq(UInt<3>("h05"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_261 = and(_T_259, _T_260) @[axi4_to_ahb.scala 178:48]
                node _T_262 = bits(_T_240, 6, 6) @[axi4_to_ahb.scala 178:44]
                node _T_263 = geq(UInt<3>("h06"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_264 = and(_T_262, _T_263) @[axi4_to_ahb.scala 178:48]
                node _T_265 = bits(_T_240, 7, 7) @[axi4_to_ahb.scala 178:44]
                node _T_266 = geq(UInt<3>("h07"), _T_243) @[axi4_to_ahb.scala 178:62]
                node _T_267 = and(_T_265, _T_266) @[axi4_to_ahb.scala 178:48]
                node _T_268 = mux(_T_267, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                node _T_269 = mux(_T_264, UInt<3>("h06"), _T_268) @[Mux.scala 98:16]
                node _T_270 = mux(_T_261, UInt<3>("h05"), _T_269) @[Mux.scala 98:16]
                node _T_271 = mux(_T_258, UInt<3>("h04"), _T_270) @[Mux.scala 98:16]
                node _T_272 = mux(_T_255, UInt<2>("h03"), _T_271) @[Mux.scala 98:16]
                node _T_273 = mux(_T_252, UInt<2>("h02"), _T_272) @[Mux.scala 98:16]
                node _T_274 = mux(_T_249, UInt<1>("h01"), _T_273) @[Mux.scala 98:16]
                node _T_275 = mux(_T_246, UInt<1>("h00"), _T_274) @[Mux.scala 98:16]
                node _T_276 = dshr(buf_byteen, _T_275) @[axi4_to_ahb.scala 292:92]
                node _T_277 = bits(_T_276, 0, 0) @[axi4_to_ahb.scala 292:92]
                node _T_278 = eq(_T_277, UInt<1>("h00")) @[axi4_to_ahb.scala 292:163]
                node _T_279 = or(_T_238, _T_278) @[axi4_to_ahb.scala 292:79]
                node _T_280 = and(trxn_done, _T_279) @[axi4_to_ahb.scala 292:29]
                cmd_done <= _T_280 @[axi4_to_ahb.scala 292:16]
                node _T_281 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 293:43]
                node _T_282 = eq(_T_281, UInt<1>("h00")) @[axi4_to_ahb.scala 293:32]
                node _T_283 = bits(_T_282, 0, 0) @[Bitwise.scala 72:15]
                node _T_284 = mux(_T_283, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                node _T_285 = and(_T_284, UInt<2>("h02")) @[axi4_to_ahb.scala 293:57]
                io.ahb_htrans <= _T_285 @[axi4_to_ahb.scala 293:21]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_286 = eq(UInt<3>("h04"), buf_state) @[Conditional.scala 37:30]
                when _T_286 : @[Conditional.scala 39:67]
                  node _T_287 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 297:34]
                  node _T_288 = or(_T_287, ahb_hresp_q) @[axi4_to_ahb.scala 297:50]
                  buf_state_en <= _T_288 @[axi4_to_ahb.scala 297:20]
                  node _T_289 = and(cmd_doneQ, ahb_hready_q) @[axi4_to_ahb.scala 298:35]
                  node _T_290 = or(_T_289, ahb_hresp_q) @[axi4_to_ahb.scala 298:51]
                  node _T_291 = eq(ahb_hresp_q, UInt<1>("h00")) @[axi4_to_ahb.scala 298:68]
                  node _T_292 = and(_T_290, _T_291) @[axi4_to_ahb.scala 298:66]
                  node _T_293 = and(_T_292, slave_ready) @[axi4_to_ahb.scala 298:81]
                  master_ready <= _T_293 @[axi4_to_ahb.scala 298:20]
                  node _T_294 = eq(slave_ready, UInt<1>("h00")) @[axi4_to_ahb.scala 299:42]
                  node _T_295 = or(ahb_hresp_q, _T_294) @[axi4_to_ahb.scala 299:40]
                  node _T_296 = bits(_T_295, 0, 0) @[axi4_to_ahb.scala 299:62]
                  node _T_297 = and(master_valid, master_ready) @[axi4_to_ahb.scala 299:90]
                  node _T_298 = bits(_T_297, 0, 0) @[axi4_to_ahb.scala 299:112]
                  node _T_299 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 299:131]
                  node _T_300 = eq(_T_299, UInt<1>("h01")) @[axi4_to_ahb.scala 299:138]
                  node _T_301 = mux(_T_300, UInt<3>("h02"), UInt<3>("h01")) @[axi4_to_ahb.scala 299:119]
                  node _T_302 = mux(_T_298, _T_301, UInt<3>("h00")) @[axi4_to_ahb.scala 299:75]
                  node _T_303 = mux(_T_296, UInt<3>("h05"), _T_302) @[axi4_to_ahb.scala 299:26]
                  buf_nxtstate <= _T_303 @[axi4_to_ahb.scala 299:20]
                  slvbuf_error_in <= ahb_hresp_q @[axi4_to_ahb.scala 300:23]
                  slvbuf_error_en <= buf_state_en @[axi4_to_ahb.scala 301:23]
                  node _T_304 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 302:34]
                  node _T_305 = eq(_T_304, UInt<1>("h01")) @[axi4_to_ahb.scala 302:41]
                  buf_write_in <= _T_305 @[axi4_to_ahb.scala 302:20]
                  node _T_306 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 303:50]
                  node _T_307 = eq(buf_nxtstate, UInt<3>("h01")) @[axi4_to_ahb.scala 303:78]
                  node _T_308 = or(_T_306, _T_307) @[axi4_to_ahb.scala 303:62]
                  node _T_309 = and(buf_state_en, _T_308) @[axi4_to_ahb.scala 303:33]
                  buf_wr_en <= _T_309 @[axi4_to_ahb.scala 303:17]
                  buf_data_wr_en <= buf_wr_en @[axi4_to_ahb.scala 304:22]
                  node _T_310 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 305:63]
                  node _T_311 = neq(_T_310, UInt<1>("h00")) @[axi4_to_ahb.scala 305:70]
                  node _T_312 = and(ahb_hready_q, _T_311) @[axi4_to_ahb.scala 305:48]
                  node _T_313 = eq(buf_cmd_byte_ptrQ, UInt<3>("h07")) @[axi4_to_ahb.scala 305:104]
                  node _T_314 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 305:166]
                  node _T_315 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 305:184]
                  node _T_316 = add(_T_314, UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
                  node _T_317 = tail(_T_316, 1) @[axi4_to_ahb.scala 177:52]
                  node _T_318 = mux(UInt<1>("h01"), _T_317, _T_314) @[axi4_to_ahb.scala 177:24]
                  node _T_319 = bits(_T_315, 0, 0) @[axi4_to_ahb.scala 178:44]
                  node _T_320 = geq(UInt<1>("h00"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_321 = and(_T_319, _T_320) @[axi4_to_ahb.scala 178:48]
                  node _T_322 = bits(_T_315, 1, 1) @[axi4_to_ahb.scala 178:44]
                  node _T_323 = geq(UInt<1>("h01"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_324 = and(_T_322, _T_323) @[axi4_to_ahb.scala 178:48]
                  node _T_325 = bits(_T_315, 2, 2) @[axi4_to_ahb.scala 178:44]
                  node _T_326 = geq(UInt<2>("h02"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_327 = and(_T_325, _T_326) @[axi4_to_ahb.scala 178:48]
                  node _T_328 = bits(_T_315, 3, 3) @[axi4_to_ahb.scala 178:44]
                  node _T_329 = geq(UInt<2>("h03"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_330 = and(_T_328, _T_329) @[axi4_to_ahb.scala 178:48]
                  node _T_331 = bits(_T_315, 4, 4) @[axi4_to_ahb.scala 178:44]
                  node _T_332 = geq(UInt<3>("h04"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_333 = and(_T_331, _T_332) @[axi4_to_ahb.scala 178:48]
                  node _T_334 = bits(_T_315, 5, 5) @[axi4_to_ahb.scala 178:44]
                  node _T_335 = geq(UInt<3>("h05"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_336 = and(_T_334, _T_335) @[axi4_to_ahb.scala 178:48]
                  node _T_337 = bits(_T_315, 6, 6) @[axi4_to_ahb.scala 178:44]
                  node _T_338 = geq(UInt<3>("h06"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_339 = and(_T_337, _T_338) @[axi4_to_ahb.scala 178:48]
                  node _T_340 = bits(_T_315, 7, 7) @[axi4_to_ahb.scala 178:44]
                  node _T_341 = geq(UInt<3>("h07"), _T_318) @[axi4_to_ahb.scala 178:62]
                  node _T_342 = and(_T_340, _T_341) @[axi4_to_ahb.scala 178:48]
                  node _T_343 = mux(_T_342, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_344 = mux(_T_339, UInt<3>("h06"), _T_343) @[Mux.scala 98:16]
                  node _T_345 = mux(_T_336, UInt<3>("h05"), _T_344) @[Mux.scala 98:16]
                  node _T_346 = mux(_T_333, UInt<3>("h04"), _T_345) @[Mux.scala 98:16]
                  node _T_347 = mux(_T_330, UInt<2>("h03"), _T_346) @[Mux.scala 98:16]
                  node _T_348 = mux(_T_327, UInt<2>("h02"), _T_347) @[Mux.scala 98:16]
                  node _T_349 = mux(_T_324, UInt<1>("h01"), _T_348) @[Mux.scala 98:16]
                  node _T_350 = mux(_T_321, UInt<1>("h00"), _T_349) @[Mux.scala 98:16]
                  node _T_351 = dshr(buf_byteen, _T_350) @[axi4_to_ahb.scala 305:131]
                  node _T_352 = bits(_T_351, 0, 0) @[axi4_to_ahb.scala 305:131]
                  node _T_353 = eq(_T_352, UInt<1>("h00")) @[axi4_to_ahb.scala 305:202]
                  node _T_354 = or(_T_313, _T_353) @[axi4_to_ahb.scala 305:118]
                  node _T_355 = and(_T_312, _T_354) @[axi4_to_ahb.scala 305:82]
                  node _T_356 = or(ahb_hresp_q, _T_355) @[axi4_to_ahb.scala 305:32]
                  cmd_done <= _T_356 @[axi4_to_ahb.scala 305:16]
                  node _T_357 = and(buf_state_en, buf_write_in) @[axi4_to_ahb.scala 306:33]
                  node _T_358 = eq(buf_nxtstate, UInt<3>("h02")) @[axi4_to_ahb.scala 306:64]
                  node _T_359 = and(_T_357, _T_358) @[axi4_to_ahb.scala 306:48]
                  bypass_en <= _T_359 @[axi4_to_ahb.scala 306:17]
                  node _T_360 = or(cmd_done, cmd_doneQ) @[axi4_to_ahb.scala 307:44]
                  node _T_361 = eq(_T_360, UInt<1>("h00")) @[axi4_to_ahb.scala 307:33]
                  node _T_362 = or(_T_361, bypass_en) @[axi4_to_ahb.scala 307:57]
                  node _T_363 = bits(_T_362, 0, 0) @[Bitwise.scala 72:15]
                  node _T_364 = mux(_T_363, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
                  node _T_365 = and(_T_364, UInt<2>("h02")) @[axi4_to_ahb.scala 307:71]
                  io.ahb_htrans <= _T_365 @[axi4_to_ahb.scala 307:21]
                  node _T_366 = neq(buf_nxtstate, UInt<3>("h05")) @[axi4_to_ahb.scala 308:55]
                  node _T_367 = and(buf_state_en, _T_366) @[axi4_to_ahb.scala 308:39]
                  slave_valid_pre <= _T_367 @[axi4_to_ahb.scala 308:23]
                  node _T_368 = and(ahb_hready_q, ahb_hwrite_q) @[axi4_to_ahb.scala 309:33]
                  node _T_369 = bits(ahb_htrans_q, 1, 0) @[axi4_to_ahb.scala 309:63]
                  node _T_370 = neq(_T_369, UInt<1>("h00")) @[axi4_to_ahb.scala 309:70]
                  node _T_371 = and(_T_368, _T_370) @[axi4_to_ahb.scala 309:48]
                  trxn_done <= _T_371 @[axi4_to_ahb.scala 309:17]
                  node _T_372 = or(trxn_done, bypass_en) @[axi4_to_ahb.scala 310:40]
                  buf_cmd_byte_ptr_en <= _T_372 @[axi4_to_ahb.scala 310:27]
                  node _T_373 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
                  node _T_374 = bits(buf_byteen_in, 7, 0) @[axi4_to_ahb.scala 313:85]
                  node _T_375 = add(_T_373, UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
                  node _T_376 = tail(_T_375, 1) @[axi4_to_ahb.scala 177:52]
                  node _T_377 = mux(UInt<1>("h00"), _T_376, _T_373) @[axi4_to_ahb.scala 177:24]
                  node _T_378 = bits(_T_374, 0, 0) @[axi4_to_ahb.scala 178:44]
                  node _T_379 = geq(UInt<1>("h00"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_380 = and(_T_378, _T_379) @[axi4_to_ahb.scala 178:48]
                  node _T_381 = bits(_T_374, 1, 1) @[axi4_to_ahb.scala 178:44]
                  node _T_382 = geq(UInt<1>("h01"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_383 = and(_T_381, _T_382) @[axi4_to_ahb.scala 178:48]
                  node _T_384 = bits(_T_374, 2, 2) @[axi4_to_ahb.scala 178:44]
                  node _T_385 = geq(UInt<2>("h02"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_386 = and(_T_384, _T_385) @[axi4_to_ahb.scala 178:48]
                  node _T_387 = bits(_T_374, 3, 3) @[axi4_to_ahb.scala 178:44]
                  node _T_388 = geq(UInt<2>("h03"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_389 = and(_T_387, _T_388) @[axi4_to_ahb.scala 178:48]
                  node _T_390 = bits(_T_374, 4, 4) @[axi4_to_ahb.scala 178:44]
                  node _T_391 = geq(UInt<3>("h04"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_392 = and(_T_390, _T_391) @[axi4_to_ahb.scala 178:48]
                  node _T_393 = bits(_T_374, 5, 5) @[axi4_to_ahb.scala 178:44]
                  node _T_394 = geq(UInt<3>("h05"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_395 = and(_T_393, _T_394) @[axi4_to_ahb.scala 178:48]
                  node _T_396 = bits(_T_374, 6, 6) @[axi4_to_ahb.scala 178:44]
                  node _T_397 = geq(UInt<3>("h06"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_398 = and(_T_396, _T_397) @[axi4_to_ahb.scala 178:48]
                  node _T_399 = bits(_T_374, 7, 7) @[axi4_to_ahb.scala 178:44]
                  node _T_400 = geq(UInt<3>("h07"), _T_377) @[axi4_to_ahb.scala 178:62]
                  node _T_401 = and(_T_399, _T_400) @[axi4_to_ahb.scala 178:48]
                  node _T_402 = mux(_T_401, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_403 = mux(_T_398, UInt<3>("h06"), _T_402) @[Mux.scala 98:16]
                  node _T_404 = mux(_T_395, UInt<3>("h05"), _T_403) @[Mux.scala 98:16]
                  node _T_405 = mux(_T_392, UInt<3>("h04"), _T_404) @[Mux.scala 98:16]
                  node _T_406 = mux(_T_389, UInt<2>("h03"), _T_405) @[Mux.scala 98:16]
                  node _T_407 = mux(_T_386, UInt<2>("h02"), _T_406) @[Mux.scala 98:16]
                  node _T_408 = mux(_T_383, UInt<1>("h01"), _T_407) @[Mux.scala 98:16]
                  node _T_409 = mux(_T_380, UInt<1>("h00"), _T_408) @[Mux.scala 98:16]
                  node _T_410 = bits(buf_cmd_byte_ptrQ, 2, 0) @[axi4_to_ahb.scala 313:151]
                  node _T_411 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 313:169]
                  node _T_412 = add(_T_410, UInt<1>("h01")) @[axi4_to_ahb.scala 177:52]
                  node _T_413 = tail(_T_412, 1) @[axi4_to_ahb.scala 177:52]
                  node _T_414 = mux(UInt<1>("h01"), _T_413, _T_410) @[axi4_to_ahb.scala 177:24]
                  node _T_415 = bits(_T_411, 0, 0) @[axi4_to_ahb.scala 178:44]
                  node _T_416 = geq(UInt<1>("h00"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_417 = and(_T_415, _T_416) @[axi4_to_ahb.scala 178:48]
                  node _T_418 = bits(_T_411, 1, 1) @[axi4_to_ahb.scala 178:44]
                  node _T_419 = geq(UInt<1>("h01"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_420 = and(_T_418, _T_419) @[axi4_to_ahb.scala 178:48]
                  node _T_421 = bits(_T_411, 2, 2) @[axi4_to_ahb.scala 178:44]
                  node _T_422 = geq(UInt<2>("h02"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_423 = and(_T_421, _T_422) @[axi4_to_ahb.scala 178:48]
                  node _T_424 = bits(_T_411, 3, 3) @[axi4_to_ahb.scala 178:44]
                  node _T_425 = geq(UInt<2>("h03"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_426 = and(_T_424, _T_425) @[axi4_to_ahb.scala 178:48]
                  node _T_427 = bits(_T_411, 4, 4) @[axi4_to_ahb.scala 178:44]
                  node _T_428 = geq(UInt<3>("h04"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_429 = and(_T_427, _T_428) @[axi4_to_ahb.scala 178:48]
                  node _T_430 = bits(_T_411, 5, 5) @[axi4_to_ahb.scala 178:44]
                  node _T_431 = geq(UInt<3>("h05"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_432 = and(_T_430, _T_431) @[axi4_to_ahb.scala 178:48]
                  node _T_433 = bits(_T_411, 6, 6) @[axi4_to_ahb.scala 178:44]
                  node _T_434 = geq(UInt<3>("h06"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_435 = and(_T_433, _T_434) @[axi4_to_ahb.scala 178:48]
                  node _T_436 = bits(_T_411, 7, 7) @[axi4_to_ahb.scala 178:44]
                  node _T_437 = geq(UInt<3>("h07"), _T_414) @[axi4_to_ahb.scala 178:62]
                  node _T_438 = and(_T_436, _T_437) @[axi4_to_ahb.scala 178:48]
                  node _T_439 = mux(_T_438, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 98:16]
                  node _T_440 = mux(_T_435, UInt<3>("h06"), _T_439) @[Mux.scala 98:16]
                  node _T_441 = mux(_T_432, UInt<3>("h05"), _T_440) @[Mux.scala 98:16]
                  node _T_442 = mux(_T_429, UInt<3>("h04"), _T_441) @[Mux.scala 98:16]
                  node _T_443 = mux(_T_426, UInt<2>("h03"), _T_442) @[Mux.scala 98:16]
                  node _T_444 = mux(_T_423, UInt<2>("h02"), _T_443) @[Mux.scala 98:16]
                  node _T_445 = mux(_T_420, UInt<1>("h01"), _T_444) @[Mux.scala 98:16]
                  node _T_446 = mux(_T_417, UInt<1>("h00"), _T_445) @[Mux.scala 98:16]
                  node _T_447 = mux(trxn_done, _T_446, buf_cmd_byte_ptrQ) @[axi4_to_ahb.scala 313:106]
                  node _T_448 = mux(bypass_en, _T_409, _T_447) @[axi4_to_ahb.scala 313:30]
                  buf_cmd_byte_ptr <= _T_448 @[axi4_to_ahb.scala 313:24]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_449 = eq(UInt<3>("h05"), buf_state) @[Conditional.scala 37:30]
                  when _T_449 : @[Conditional.scala 39:67]
                    buf_nxtstate <= UInt<3>("h00") @[axi4_to_ahb.scala 316:20]
                    buf_state_en <= slave_ready @[axi4_to_ahb.scala 317:20]
                    slvbuf_error_en <= UInt<1>("h01") @[axi4_to_ahb.scala 318:23]
                    slave_valid_pre <= UInt<1>("h01") @[axi4_to_ahb.scala 319:23]
                    skip @[Conditional.scala 39:67]
    buf_rst <= UInt<1>("h00") @[axi4_to_ahb.scala 323:11]
    cmd_done_rst <= slave_valid_pre @[axi4_to_ahb.scala 324:16]
    node _T_450 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 325:68]
    node _T_451 = eq(_T_450, UInt<1>("h01")) @[axi4_to_ahb.scala 325:75]
    node _T_452 = and(buf_aligned_in, _T_451) @[axi4_to_ahb.scala 325:55]
    node _T_453 = bits(_T_452, 0, 0) @[axi4_to_ahb.scala 325:95]
    node _T_454 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 325:127]
    wire _T_455 : UInt<8>
    _T_455 <= UInt<8>("h00")
    node _T_456 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 169:44]
    node _T_457 = eq(_T_456, UInt<8>("h0ff")) @[axi4_to_ahb.scala 169:51]
    node _T_458 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 169:75]
    node _T_459 = eq(_T_458, UInt<4>("h0f")) @[axi4_to_ahb.scala 169:82]
    node _T_460 = or(_T_457, _T_459) @[axi4_to_ahb.scala 169:64]
    node _T_461 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 169:106]
    node _T_462 = eq(_T_461, UInt<2>("h03")) @[axi4_to_ahb.scala 169:113]
    node _T_463 = or(_T_460, _T_462) @[axi4_to_ahb.scala 169:95]
    node _T_464 = bits(_T_463, 0, 0) @[Bitwise.scala 72:15]
    node _T_465 = mux(_T_464, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_466 = and(UInt<1>("h00"), _T_465) @[axi4_to_ahb.scala 169:24]
    node _T_467 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 170:35]
    node _T_468 = eq(_T_467, UInt<4>("h0c")) @[axi4_to_ahb.scala 170:42]
    node _T_469 = bits(_T_468, 0, 0) @[Bitwise.scala 72:15]
    node _T_470 = mux(_T_469, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_471 = and(UInt<2>("h02"), _T_470) @[axi4_to_ahb.scala 170:15]
    node _T_472 = or(_T_466, _T_471) @[axi4_to_ahb.scala 169:128]
    node _T_473 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 171:36]
    node _T_474 = eq(_T_473, UInt<8>("h0f0")) @[axi4_to_ahb.scala 171:43]
    node _T_475 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 171:67]
    node _T_476 = eq(_T_475, UInt<2>("h03")) @[axi4_to_ahb.scala 171:74]
    node _T_477 = or(_T_474, _T_476) @[axi4_to_ahb.scala 171:56]
    node _T_478 = bits(_T_477, 0, 0) @[Bitwise.scala 72:15]
    node _T_479 = mux(_T_478, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_480 = and(UInt<3>("h04"), _T_479) @[axi4_to_ahb.scala 171:15]
    node _T_481 = bits(_T_455, 7, 0) @[axi4_to_ahb.scala 172:37]
    node _T_482 = eq(_T_481, UInt<8>("h0c0")) @[axi4_to_ahb.scala 172:44]
    node _T_483 = bits(_T_482, 0, 0) @[Bitwise.scala 72:15]
    node _T_484 = mux(_T_483, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_485 = and(UInt<3>("h06"), _T_484) @[axi4_to_ahb.scala 172:17]
    node _T_486 = or(_T_480, _T_485) @[axi4_to_ahb.scala 171:90]
    node _T_487 = or(_T_472, _T_486) @[axi4_to_ahb.scala 170:58]
    node _T_488 = bits(master_addr, 2, 0) @[axi4_to_ahb.scala 325:147]
    node _T_489 = mux(_T_453, _T_487, _T_488) @[axi4_to_ahb.scala 325:38]
    node _T_490 = cat(master_addr, _T_489) @[Cat.scala 29:58]
    buf_addr_in <= _T_490 @[axi4_to_ahb.scala 325:15]
    node _T_491 = bits(master_tag, 0, 0) @[axi4_to_ahb.scala 326:27]
    buf_tag_in <= _T_491 @[axi4_to_ahb.scala 326:14]
    node _T_492 = bits(wrbuf_byteen, 7, 0) @[axi4_to_ahb.scala 327:32]
    buf_byteen_in <= _T_492 @[axi4_to_ahb.scala 327:17]
    node _T_493 = eq(buf_state, UInt<3>("h03")) @[axi4_to_ahb.scala 328:33]
    node _T_494 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 328:59]
    node _T_495 = bits(master_wdata, 63, 0) @[axi4_to_ahb.scala 328:80]
    node _T_496 = mux(_T_493, _T_494, _T_495) @[axi4_to_ahb.scala 328:21]
    buf_data_in <= _T_496 @[axi4_to_ahb.scala 328:15]
    node _T_497 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 329:52]
    node _T_498 = eq(_T_497, UInt<2>("h03")) @[axi4_to_ahb.scala 329:59]
    node _T_499 = and(buf_aligned_in, _T_498) @[axi4_to_ahb.scala 329:38]
    node _T_500 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 329:85]
    node _T_501 = eq(_T_500, UInt<1>("h01")) @[axi4_to_ahb.scala 329:92]
    node _T_502 = and(_T_499, _T_501) @[axi4_to_ahb.scala 329:72]
    node _T_503 = bits(_T_502, 0, 0) @[axi4_to_ahb.scala 329:112]
    node _T_504 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 329:144]
    wire _T_505 : UInt<8>
    _T_505 <= UInt<8>("h00")
    node _T_506 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 161:43]
    node _T_507 = eq(_T_506, UInt<8>("h0ff")) @[axi4_to_ahb.scala 161:50]
    node _T_508 = bits(_T_507, 0, 0) @[Bitwise.scala 72:15]
    node _T_509 = mux(_T_508, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_510 = and(UInt<2>("h03"), _T_509) @[axi4_to_ahb.scala 161:25]
    node _T_511 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 162:34]
    node _T_512 = eq(_T_511, UInt<8>("h0f0")) @[axi4_to_ahb.scala 162:41]
    node _T_513 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 162:63]
    node _T_514 = eq(_T_513, UInt<4>("h0f")) @[axi4_to_ahb.scala 162:70]
    node _T_515 = or(_T_512, _T_514) @[axi4_to_ahb.scala 162:54]
    node _T_516 = bits(_T_515, 0, 0) @[Bitwise.scala 72:15]
    node _T_517 = mux(_T_516, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_518 = and(UInt<2>("h02"), _T_517) @[axi4_to_ahb.scala 162:16]
    node _T_519 = or(_T_510, _T_518) @[axi4_to_ahb.scala 161:65]
    node _T_520 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 163:34]
    node _T_521 = eq(_T_520, UInt<8>("h0c0")) @[axi4_to_ahb.scala 163:41]
    node _T_522 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 163:63]
    node _T_523 = eq(_T_522, UInt<6>("h030")) @[axi4_to_ahb.scala 163:70]
    node _T_524 = or(_T_521, _T_523) @[axi4_to_ahb.scala 163:54]
    node _T_525 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 163:92]
    node _T_526 = eq(_T_525, UInt<4>("h0c")) @[axi4_to_ahb.scala 163:99]
    node _T_527 = or(_T_524, _T_526) @[axi4_to_ahb.scala 163:83]
    node _T_528 = bits(_T_505, 7, 0) @[axi4_to_ahb.scala 163:121]
    node _T_529 = eq(_T_528, UInt<2>("h03")) @[axi4_to_ahb.scala 163:128]
    node _T_530 = or(_T_527, _T_529) @[axi4_to_ahb.scala 163:112]
    node _T_531 = bits(_T_530, 0, 0) @[Bitwise.scala 72:15]
    node _T_532 = mux(_T_531, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_533 = and(UInt<1>("h01"), _T_532) @[axi4_to_ahb.scala 163:16]
    node _T_534 = or(_T_519, _T_533) @[axi4_to_ahb.scala 162:86]
    node _T_535 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 329:164]
    node _T_536 = mux(_T_503, _T_534, _T_535) @[axi4_to_ahb.scala 329:21]
    buf_size_in <= _T_536 @[axi4_to_ahb.scala 329:15]
    node _T_537 = bits(master_opc, 2, 0) @[axi4_to_ahb.scala 330:32]
    node _T_538 = eq(_T_537, UInt<1>("h00")) @[axi4_to_ahb.scala 330:39]
    node _T_539 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 331:17]
    node _T_540 = eq(_T_539, UInt<1>("h00")) @[axi4_to_ahb.scala 331:24]
    node _T_541 = or(_T_538, _T_540) @[axi4_to_ahb.scala 330:51]
    node _T_542 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 331:50]
    node _T_543 = eq(_T_542, UInt<1>("h01")) @[axi4_to_ahb.scala 331:57]
    node _T_544 = or(_T_541, _T_543) @[axi4_to_ahb.scala 331:36]
    node _T_545 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 331:84]
    node _T_546 = eq(_T_545, UInt<2>("h02")) @[axi4_to_ahb.scala 331:91]
    node _T_547 = or(_T_544, _T_546) @[axi4_to_ahb.scala 331:70]
    node _T_548 = bits(master_size, 1, 0) @[axi4_to_ahb.scala 332:18]
    node _T_549 = eq(_T_548, UInt<2>("h03")) @[axi4_to_ahb.scala 332:25]
    node _T_550 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 332:55]
    node _T_551 = eq(_T_550, UInt<2>("h03")) @[axi4_to_ahb.scala 332:62]
    node _T_552 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 332:90]
    node _T_553 = eq(_T_552, UInt<4>("h0c")) @[axi4_to_ahb.scala 332:97]
    node _T_554 = or(_T_551, _T_553) @[axi4_to_ahb.scala 332:74]
    node _T_555 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 332:125]
    node _T_556 = eq(_T_555, UInt<6>("h030")) @[axi4_to_ahb.scala 332:132]
    node _T_557 = or(_T_554, _T_556) @[axi4_to_ahb.scala 332:109]
    node _T_558 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 332:161]
    node _T_559 = eq(_T_558, UInt<8>("h0c0")) @[axi4_to_ahb.scala 332:168]
    node _T_560 = or(_T_557, _T_559) @[axi4_to_ahb.scala 332:145]
    node _T_561 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 333:21]
    node _T_562 = eq(_T_561, UInt<4>("h0f")) @[axi4_to_ahb.scala 333:28]
    node _T_563 = or(_T_560, _T_562) @[axi4_to_ahb.scala 332:181]
    node _T_564 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 333:56]
    node _T_565 = eq(_T_564, UInt<8>("h0f0")) @[axi4_to_ahb.scala 333:63]
    node _T_566 = or(_T_563, _T_565) @[axi4_to_ahb.scala 333:40]
    node _T_567 = bits(master_byteen, 7, 0) @[axi4_to_ahb.scala 333:92]
    node _T_568 = eq(_T_567, UInt<8>("h0ff")) @[axi4_to_ahb.scala 333:99]
    node _T_569 = or(_T_566, _T_568) @[axi4_to_ahb.scala 333:76]
    node _T_570 = and(_T_549, _T_569) @[axi4_to_ahb.scala 332:38]
    node _T_571 = or(_T_547, _T_570) @[axi4_to_ahb.scala 331:104]
    buf_aligned_in <= _T_571 @[axi4_to_ahb.scala 330:18]
    node _T_572 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 335:39]
    node _T_573 = bits(master_addr, 31, 3) @[axi4_to_ahb.scala 335:58]
    node _T_574 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 335:83]
    node _T_575 = cat(_T_573, _T_574) @[Cat.scala 29:58]
    node _T_576 = bits(buf_addr, 31, 3) @[axi4_to_ahb.scala 335:104]
    node _T_577 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 335:129]
    node _T_578 = cat(_T_576, _T_577) @[Cat.scala 29:58]
    node _T_579 = mux(_T_572, _T_575, _T_578) @[axi4_to_ahb.scala 335:22]
    io.ahb_haddr <= _T_579 @[axi4_to_ahb.scala 335:16]
    node _T_580 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 336:39]
    node _T_581 = bits(buf_aligned_in, 0, 0) @[Bitwise.scala 72:15]
    node _T_582 = mux(_T_581, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_583 = bits(buf_size_in, 1, 0) @[axi4_to_ahb.scala 336:93]
    node _T_584 = and(_T_582, _T_583) @[axi4_to_ahb.scala 336:80]
    node _T_585 = cat(UInt<1>("h00"), _T_584) @[Cat.scala 29:58]
    node _T_586 = bits(buf_aligned, 0, 0) @[Bitwise.scala 72:15]
    node _T_587 = mux(_T_586, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_588 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 336:148]
    node _T_589 = and(_T_587, _T_588) @[axi4_to_ahb.scala 336:138]
    node _T_590 = cat(UInt<1>("h00"), _T_589) @[Cat.scala 29:58]
    node _T_591 = mux(_T_580, _T_585, _T_590) @[axi4_to_ahb.scala 336:22]
    io.ahb_hsize <= _T_591 @[axi4_to_ahb.scala 336:16]
    io.ahb_hburst <= UInt<1>("h00") @[axi4_to_ahb.scala 338:17]
    io.ahb_hmastlock <= UInt<1>("h00") @[axi4_to_ahb.scala 339:20]
    node _T_592 = bits(io.axi_arprot, 2, 2) @[axi4_to_ahb.scala 340:47]
    node _T_593 = not(_T_592) @[axi4_to_ahb.scala 340:33]
    node _T_594 = cat(UInt<1>("h01"), _T_593) @[Cat.scala 29:58]
    io.ahb_hprot <= _T_594 @[axi4_to_ahb.scala 340:16]
    node _T_595 = bits(bypass_en, 0, 0) @[axi4_to_ahb.scala 341:40]
    node _T_596 = bits(master_opc, 2, 1) @[axi4_to_ahb.scala 341:55]
    node _T_597 = eq(_T_596, UInt<1>("h01")) @[axi4_to_ahb.scala 341:62]
    node _T_598 = mux(_T_595, _T_597, buf_write) @[axi4_to_ahb.scala 341:23]
    io.ahb_hwrite <= _T_598 @[axi4_to_ahb.scala 341:17]
    node _T_599 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 342:28]
    io.ahb_hwdata <= _T_599 @[axi4_to_ahb.scala 342:17]
    slave_valid <= slave_valid_pre @[axi4_to_ahb.scala 344:15]
    node _T_600 = bits(slvbuf_write, 0, 0) @[axi4_to_ahb.scala 345:43]
    node _T_601 = mux(_T_600, UInt<2>("h03"), UInt<1>("h00")) @[axi4_to_ahb.scala 345:23]
    node _T_602 = bits(slvbuf_error, 0, 0) @[Bitwise.scala 72:15]
    node _T_603 = mux(_T_602, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_604 = and(_T_603, UInt<2>("h02")) @[axi4_to_ahb.scala 345:88]
    node _T_605 = cat(_T_601, _T_604) @[Cat.scala 29:58]
    slave_opc <= _T_605 @[axi4_to_ahb.scala 345:13]
    node _T_606 = bits(slvbuf_error, 0, 0) @[axi4_to_ahb.scala 346:41]
    node _T_607 = bits(last_bus_addr, 31, 0) @[axi4_to_ahb.scala 346:66]
    node _T_608 = cat(_T_607, _T_607) @[Cat.scala 29:58]
    node _T_609 = eq(buf_state, UInt<3>("h05")) @[axi4_to_ahb.scala 346:91]
    node _T_610 = bits(buf_data, 63, 0) @[axi4_to_ahb.scala 346:110]
    node _T_611 = bits(ahb_hrdata_q, 63, 0) @[axi4_to_ahb.scala 346:131]
    node _T_612 = mux(_T_609, _T_610, _T_611) @[axi4_to_ahb.scala 346:79]
    node _T_613 = mux(_T_606, _T_608, _T_612) @[axi4_to_ahb.scala 346:21]
    slave_rdata <= _T_613 @[axi4_to_ahb.scala 346:15]
    node _T_614 = bits(slvbuf_tag, 0, 0) @[axi4_to_ahb.scala 347:26]
    slave_tag <= _T_614 @[axi4_to_ahb.scala 347:13]
    node _T_615 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 349:33]
    node _T_616 = neq(_T_615, UInt<1>("h00")) @[axi4_to_ahb.scala 349:40]
    node _T_617 = and(_T_616, io.ahb_hready) @[axi4_to_ahb.scala 349:52]
    node _T_618 = and(_T_617, io.ahb_hwrite) @[axi4_to_ahb.scala 349:68]
    last_addr_en <= _T_618 @[axi4_to_ahb.scala 349:16]
    node _T_619 = and(UInt<1>("h01"), wrbuf_rst) @[axi4_to_ahb.scala 352:58]
    node _T_620 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 352:114]
    reg _T_621 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_620 : @[Reg.scala 28:19]
      _T_621 <= _T_619 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_vld <= _T_621 @[axi4_to_ahb.scala 352:18]
    node _T_622 = and(UInt<1>("h01"), wrbuf_rst) @[axi4_to_ahb.scala 353:58]
    node _T_623 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 353:119]
    reg _T_624 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_623 : @[Reg.scala 28:19]
      _T_624 <= _T_622 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_data_vld <= _T_624 @[axi4_to_ahb.scala 353:18]
    node _T_625 = bits(io.axi_awid, 0, 0) @[axi4_to_ahb.scala 355:57]
    node _T_626 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 355:91]
    reg _T_627 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_626 : @[Reg.scala 28:19]
      _T_627 <= _T_625 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_tag <= _T_627 @[axi4_to_ahb.scala 355:13]
    node _T_628 = bits(io.axi_awsize, 2, 0) @[axi4_to_ahb.scala 356:60]
    node _T_629 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 356:88]
    reg _T_630 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_629 : @[Reg.scala 28:19]
      _T_630 <= _T_628 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_size <= _T_630 @[axi4_to_ahb.scala 356:14]
    node _T_631 = bits(wrbuf_en, 0, 0) @[axi4_to_ahb.scala 358:62]
    reg _T_632 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_631 : @[Reg.scala 28:19]
      _T_632 <= io.axi_awaddr @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_addr <= _T_632 @[axi4_to_ahb.scala 358:14]
    node _T_633 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 359:66]
    reg _T_634 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_633 : @[Reg.scala 28:19]
      _T_634 <= io.axi_wdata @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_data <= _T_634 @[axi4_to_ahb.scala 359:14]
    node _T_635 = bits(io.axi_wstrb, 7, 0) @[axi4_to_ahb.scala 362:27]
    node _T_636 = bits(wrbuf_data_en, 0, 0) @[axi4_to_ahb.scala 362:60]
    reg _T_637 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_636 : @[Reg.scala 28:19]
      _T_637 <= _T_635 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    wrbuf_byteen <= _T_637 @[axi4_to_ahb.scala 361:16]
    node _T_638 = bits(io.ahb_haddr, 31, 0) @[axi4_to_ahb.scala 365:27]
    node _T_639 = bits(last_addr_en, 0, 0) @[axi4_to_ahb.scala 365:60]
    reg _T_640 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_639 : @[Reg.scala 28:19]
      _T_640 <= _T_638 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    last_bus_addr <= _T_640 @[axi4_to_ahb.scala 364:17]
    node _T_641 = bits(buf_rst, 0, 0) @[Bitwise.scala 72:15]
    node _T_642 = mux(_T_641, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_643 = and(buf_nxtstate, _T_642) @[axi4_to_ahb.scala 369:28]
    node _T_644 = bits(buf_state_en, 0, 0) @[axi4_to_ahb.scala 369:92]
    reg _T_645 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_644 : @[Reg.scala 28:19]
      _T_645 <= _T_643 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_state <= _T_645 @[axi4_to_ahb.scala 368:13]
    node _T_646 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 373:50]
    reg _T_647 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_646 : @[Reg.scala 28:19]
      _T_647 <= buf_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_write <= _T_647 @[axi4_to_ahb.scala 372:13]
    node _T_648 = bits(buf_tag_in, 0, 0) @[axi4_to_ahb.scala 376:25]
    node _T_649 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 376:60]
    reg _T_650 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_649 : @[Reg.scala 28:19]
      _T_650 <= _T_648 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_tag <= _T_650 @[axi4_to_ahb.scala 375:11]
    node _T_651 = bits(buf_addr_in, 31, 0) @[axi4_to_ahb.scala 379:36]
    node _T_652 = and(buf_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 379:61]
    node _T_653 = bits(_T_652, 0, 0) @[axi4_to_ahb.scala 379:78]
    reg _T_654 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_653 : @[Reg.scala 28:19]
      _T_654 <= _T_651 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_addr <= _T_654 @[axi4_to_ahb.scala 379:12]
    node _T_655 = bits(buf_size, 1, 0) @[axi4_to_ahb.scala 382:23]
    node _T_656 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 382:52]
    reg _T_657 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_656 : @[Reg.scala 28:19]
      _T_657 <= _T_655 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_size <= _T_657 @[axi4_to_ahb.scala 381:12]
    node _T_658 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 385:52]
    reg _T_659 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_658 : @[Reg.scala 28:19]
      _T_659 <= buf_aligned_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_aligned <= _T_659 @[axi4_to_ahb.scala 384:15]
    node _T_660 = bits(buf_byteen, 7, 0) @[axi4_to_ahb.scala 388:25]
    node _T_661 = bits(buf_wr_en, 0, 0) @[axi4_to_ahb.scala 388:54]
    reg _T_662 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_661 : @[Reg.scala 28:19]
      _T_662 <= _T_660 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_byteen <= _T_662 @[axi4_to_ahb.scala 387:14]
    node _T_663 = bits(buf_data_in, 63, 0) @[axi4_to_ahb.scala 391:36]
    node _T_664 = and(buf_data_wr_en, io.bus_clk_en) @[axi4_to_ahb.scala 391:66]
    node _T_665 = bits(_T_664, 0, 0) @[axi4_to_ahb.scala 391:89]
    reg _T_666 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_665 : @[Reg.scala 28:19]
      _T_666 <= _T_663 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_data <= _T_666 @[axi4_to_ahb.scala 391:12]
    node _T_667 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 394:50]
    reg _T_668 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_667 : @[Reg.scala 28:19]
      _T_668 <= buf_write @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_write <= _T_668 @[axi4_to_ahb.scala 393:16]
    node _T_669 = bits(buf_tag, 0, 0) @[axi4_to_ahb.scala 397:22]
    node _T_670 = bits(slvbuf_wr_en, 0, 0) @[axi4_to_ahb.scala 397:60]
    reg _T_671 : UInt, buf_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_670 : @[Reg.scala 28:19]
      _T_671 <= _T_669 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_tag <= _T_671 @[axi4_to_ahb.scala 396:14]
    node _T_672 = bits(slvbuf_error_en, 0, 0) @[axi4_to_ahb.scala 400:59]
    reg _T_673 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_672 : @[Reg.scala 28:19]
      _T_673 <= slvbuf_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    slvbuf_error <= _T_673 @[axi4_to_ahb.scala 399:16]
    node _T_674 = and(UInt<1>("h01"), cmd_done_rst) @[axi4_to_ahb.scala 404:22]
    node _T_675 = bits(cmd_done, 0, 0) @[axi4_to_ahb.scala 404:81]
    reg _T_676 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_675 : @[Reg.scala 28:19]
      _T_676 <= _T_674 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmd_doneQ <= _T_676 @[axi4_to_ahb.scala 403:13]
    node _T_677 = bits(buf_cmd_byte_ptr, 2, 0) @[axi4_to_ahb.scala 408:31]
    node _T_678 = bits(buf_cmd_byte_ptr_en, 0, 0) @[axi4_to_ahb.scala 408:70]
    reg _T_679 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_678 : @[Reg.scala 28:19]
      _T_679 <= _T_677 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_cmd_byte_ptrQ <= _T_679 @[axi4_to_ahb.scala 407:21]
    reg _T_680 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 413:12]
    _T_680 <= io.ahb_hready @[axi4_to_ahb.scala 413:12]
    ahb_hready_q <= _T_680 @[axi4_to_ahb.scala 412:16]
    node _T_681 = bits(io.ahb_htrans, 1, 0) @[axi4_to_ahb.scala 416:26]
    reg _T_682 : UInt, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 416:12]
    _T_682 <= _T_681 @[axi4_to_ahb.scala 416:12]
    ahb_htrans_q <= _T_682 @[axi4_to_ahb.scala 415:16]
    reg _T_683 : UInt<1>, ahbm_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 419:12]
    _T_683 <= io.ahb_hwrite @[axi4_to_ahb.scala 419:12]
    ahb_hwrite_q <= _T_683 @[axi4_to_ahb.scala 418:16]
    reg _T_684 : UInt<1>, ahbm_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 422:12]
    _T_684 <= io.ahb_hresp @[axi4_to_ahb.scala 422:12]
    ahb_hresp_q <= _T_684 @[axi4_to_ahb.scala 421:15]
    node _T_685 = bits(io.ahb_hrdata, 63, 0) @[axi4_to_ahb.scala 425:26]
    reg _T_686 : UInt, ahbm_data_clk with : (reset => (reset, UInt<1>("h00"))) @[axi4_to_ahb.scala 425:12]
    _T_686 <= _T_685 @[axi4_to_ahb.scala 425:12]
    ahb_hrdata_q <= _T_686 @[axi4_to_ahb.scala 424:16]
    node _T_687 = or(buf_wr_en, slvbuf_wr_en) @[axi4_to_ahb.scala 428:43]
    node _T_688 = or(_T_687, io.clk_override) @[axi4_to_ahb.scala 428:58]
    node _T_689 = and(io.bus_clk_en, _T_688) @[axi4_to_ahb.scala 428:30]
    buf_clken <= _T_689 @[axi4_to_ahb.scala 428:13]
    node _T_690 = bits(io.ahb_htrans, 1, 1) @[axi4_to_ahb.scala 429:69]
    node _T_691 = and(io.ahb_hready, _T_690) @[axi4_to_ahb.scala 429:54]
    node _T_692 = or(_T_691, io.clk_override) @[axi4_to_ahb.scala 429:74]
    node _T_693 = and(io.bus_clk_en, _T_692) @[axi4_to_ahb.scala 429:36]
    ahbm_addr_clken <= _T_693 @[axi4_to_ahb.scala 429:19]
    node _T_694 = neq(buf_state, UInt<3>("h00")) @[axi4_to_ahb.scala 430:50]
    node _T_695 = or(_T_694, io.clk_override) @[axi4_to_ahb.scala 430:60]
    node _T_696 = and(io.bus_clk_en, _T_695) @[axi4_to_ahb.scala 430:36]
    ahbm_data_clken <= _T_696 @[axi4_to_ahb.scala 430:19]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 483:22]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_2.io.en <= buf_clken @[el2_lib.scala 485:16]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_clk <= rvclkhdr_2.io.l1clk @[axi4_to_ahb.scala 433:11]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 483:22]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_3.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_clk <= rvclkhdr_3.io.l1clk @[axi4_to_ahb.scala 434:12]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 483:22]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_4.io.en <= ahbm_addr_clken @[el2_lib.scala 485:16]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_addr_clk <= rvclkhdr_4.io.l1clk @[axi4_to_ahb.scala 435:17]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 483:22]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_5.io.en <= ahbm_data_clken @[el2_lib.scala 485:16]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahbm_data_clk <= rvclkhdr_5.io.l1clk @[axi4_to_ahb.scala 436:17]
    
