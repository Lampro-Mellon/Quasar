;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ahb_to_axi4 : 
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
    
    inst clkhdr of gated_latch @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_1 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_2 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_3 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_4 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_5 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  module ahb_to_axi4 : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip bus_clk_en : UInt<1>, flip clk_override : UInt<1>, axi : {aw : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, w : {flip ready : UInt<1>, valid : UInt<1>, bits : {data : UInt<64>, strb : UInt<8>, last : UInt<1>}}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : {resp : UInt<2>, id : UInt<3>}}, ar : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, flip r : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, data : UInt<64>, resp : UInt<2>, last : UInt<1>}}}, ahb : {flip sig : {in : {flip hrdata : UInt<64>, flip hready : UInt<1>, flip hresp : UInt<1>}, out : {haddr : UInt<32>, hburst : UInt<3>, hmastlock : UInt<1>, hprot : UInt<4>, hsize : UInt<3>, htrans : UInt<2>, hwrite : UInt<1>, hwdata : UInt<64>}}, flip hsel : UInt<1>, flip hreadyin : UInt<1>}}
    
    wire _T : {aw : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, w : {flip ready : UInt<1>, valid : UInt<1>, bits : {data : UInt<64>, strb : UInt<8>, last : UInt<1>}}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : {resp : UInt<2>, id : UInt<3>}}, ar : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, flip r : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<3>, data : UInt<64>, resp : UInt<2>, last : UInt<1>}}} @[ahb_to_axi4.scala 20:25]
    _T.r.bits.last <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.resp <= UInt<2>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.data <= UInt<64>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.id <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.qos <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.prot <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.cache <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.lock <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.burst <= UInt<2>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.size <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.len <= UInt<8>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.region <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.addr <= UInt<32>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.bits.id <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.b.bits.id <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.b.bits.resp <= UInt<2>("h00") @[ahb_to_axi4.scala 20:25]
    _T.b.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.b.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.w.bits.last <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.w.bits.strb <= UInt<8>("h00") @[ahb_to_axi4.scala 20:25]
    _T.w.bits.data <= UInt<64>("h00") @[ahb_to_axi4.scala 20:25]
    _T.w.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.w.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.qos <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.prot <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.cache <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.lock <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.burst <= UInt<2>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.size <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.len <= UInt<8>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.region <= UInt<4>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.addr <= UInt<32>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.bits.id <= UInt<3>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.aw.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.last <= io.axi.r.bits.last @[ahb_to_axi4.scala 20:10]
    _T.r.bits.resp <= io.axi.r.bits.resp @[ahb_to_axi4.scala 20:10]
    _T.r.bits.data <= io.axi.r.bits.data @[ahb_to_axi4.scala 20:10]
    _T.r.bits.id <= io.axi.r.bits.id @[ahb_to_axi4.scala 20:10]
    _T.r.valid <= io.axi.r.valid @[ahb_to_axi4.scala 20:10]
    io.axi.r.ready <= _T.r.ready @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.qos <= _T.ar.bits.qos @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.prot <= _T.ar.bits.prot @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.cache <= _T.ar.bits.cache @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.lock <= _T.ar.bits.lock @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.burst <= _T.ar.bits.burst @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.size <= _T.ar.bits.size @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.len <= _T.ar.bits.len @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.region <= _T.ar.bits.region @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.addr <= _T.ar.bits.addr @[ahb_to_axi4.scala 20:10]
    io.axi.ar.bits.id <= _T.ar.bits.id @[ahb_to_axi4.scala 20:10]
    io.axi.ar.valid <= _T.ar.valid @[ahb_to_axi4.scala 20:10]
    _T.ar.ready <= io.axi.ar.ready @[ahb_to_axi4.scala 20:10]
    _T.b.bits.id <= io.axi.b.bits.id @[ahb_to_axi4.scala 20:10]
    _T.b.bits.resp <= io.axi.b.bits.resp @[ahb_to_axi4.scala 20:10]
    _T.b.valid <= io.axi.b.valid @[ahb_to_axi4.scala 20:10]
    io.axi.b.ready <= _T.b.ready @[ahb_to_axi4.scala 20:10]
    io.axi.w.bits.last <= _T.w.bits.last @[ahb_to_axi4.scala 20:10]
    io.axi.w.bits.strb <= _T.w.bits.strb @[ahb_to_axi4.scala 20:10]
    io.axi.w.bits.data <= _T.w.bits.data @[ahb_to_axi4.scala 20:10]
    io.axi.w.valid <= _T.w.valid @[ahb_to_axi4.scala 20:10]
    _T.w.ready <= io.axi.w.ready @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.qos <= _T.aw.bits.qos @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.prot <= _T.aw.bits.prot @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.cache <= _T.aw.bits.cache @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.lock <= _T.aw.bits.lock @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.burst <= _T.aw.bits.burst @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.size <= _T.aw.bits.size @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.len <= _T.aw.bits.len @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.region <= _T.aw.bits.region @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.addr <= _T.aw.bits.addr @[ahb_to_axi4.scala 20:10]
    io.axi.aw.bits.id <= _T.aw.bits.id @[ahb_to_axi4.scala 20:10]
    io.axi.aw.valid <= _T.aw.valid @[ahb_to_axi4.scala 20:10]
    _T.aw.ready <= io.axi.aw.ready @[ahb_to_axi4.scala 20:10]
    wire master_wstrb : UInt<8>
    master_wstrb <= UInt<8>("h00")
    wire buf_state_en : UInt<1>
    buf_state_en <= UInt<1>("h00")
    wire buf_read_error_in : UInt<1>
    buf_read_error_in <= UInt<1>("h00")
    wire buf_read_error : UInt<1>
    buf_read_error <= UInt<1>("h00")
    wire buf_rdata : UInt<64>
    buf_rdata <= UInt<64>("h00")
    wire ahb_hready : UInt<1>
    ahb_hready <= UInt<1>("h00")
    wire ahb_hready_q : UInt<1>
    ahb_hready_q <= UInt<1>("h00")
    wire ahb_htrans_in : UInt<2>
    ahb_htrans_in <= UInt<2>("h00")
    wire ahb_htrans_q : UInt<2>
    ahb_htrans_q <= UInt<2>("h00")
    wire ahb_hsize_q : UInt<3>
    ahb_hsize_q <= UInt<3>("h00")
    wire ahb_hwrite_q : UInt<1>
    ahb_hwrite_q <= UInt<1>("h00")
    wire ahb_haddr_q : UInt<32>
    ahb_haddr_q <= UInt<32>("h00")
    wire ahb_hwdata_q : UInt<64>
    ahb_hwdata_q <= UInt<64>("h00")
    wire ahb_hresp_q : UInt<1>
    ahb_hresp_q <= UInt<1>("h00")
    wire buf_rdata_en : UInt<1>
    buf_rdata_en <= UInt<1>("h00")
    wire ahb_bus_addr_clk_en : UInt<1>
    ahb_bus_addr_clk_en <= UInt<1>("h00")
    wire buf_rdata_clk_en : UInt<1>
    buf_rdata_clk_en <= UInt<1>("h00")
    wire ahb_clk : Clock @[ahb_to_axi4.scala 43:33]
    wire ahb_addr_clk : Clock @[ahb_to_axi4.scala 44:33]
    wire buf_rdata_clk : Clock @[ahb_to_axi4.scala 45:33]
    wire cmdbuf_wr_en : UInt<1>
    cmdbuf_wr_en <= UInt<1>("h00")
    wire cmdbuf_rst : UInt<1>
    cmdbuf_rst <= UInt<1>("h00")
    wire cmdbuf_full : UInt<1>
    cmdbuf_full <= UInt<1>("h00")
    wire cmdbuf_vld : UInt<1>
    cmdbuf_vld <= UInt<1>("h00")
    wire cmdbuf_write : UInt<1>
    cmdbuf_write <= UInt<1>("h00")
    wire cmdbuf_size : UInt<2>
    cmdbuf_size <= UInt<2>("h00")
    wire cmdbuf_wstrb : UInt<8>
    cmdbuf_wstrb <= UInt<8>("h00")
    wire cmdbuf_addr : UInt<32>
    cmdbuf_addr <= UInt<32>("h00")
    wire cmdbuf_wdata : UInt<64>
    cmdbuf_wdata <= UInt<64>("h00")
    wire bus_clk : Clock @[ahb_to_axi4.scala 57:33]
    node _T_1 = bits(ahb_haddr_q, 31, 28) @[lib.scala 84:25]
    node ahb_addr_in_dccm_region_nc = eq(_T_1, UInt<4>("h0f")) @[lib.scala 84:47]
    node _T_2 = bits(ahb_haddr_q, 31, 16) @[lib.scala 87:14]
    node ahb_addr_in_dccm = eq(_T_2, UInt<16>("h0f004")) @[lib.scala 87:29]
    node _T_3 = bits(ahb_haddr_q, 31, 28) @[lib.scala 84:25]
    node ahb_addr_in_iccm_region_nc = eq(_T_3, UInt<4>("h0e")) @[lib.scala 84:47]
    node _T_4 = bits(ahb_haddr_q, 31, 16) @[lib.scala 87:14]
    node ahb_addr_in_iccm = eq(_T_4, UInt<16>("h0ee00")) @[lib.scala 87:29]
    node _T_5 = bits(ahb_haddr_q, 31, 28) @[lib.scala 84:25]
    node ahb_addr_in_pic_region_nc = eq(_T_5, UInt<4>("h0f")) @[lib.scala 84:47]
    node _T_6 = bits(ahb_haddr_q, 31, 15) @[lib.scala 87:14]
    node ahb_addr_in_pic = eq(_T_6, UInt<17>("h01e018")) @[lib.scala 87:29]
    wire buf_state : UInt<2>
    buf_state <= UInt<2>("h00")
    wire buf_nxtstate : UInt<2>
    buf_nxtstate <= UInt<2>("h00")
    buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 67:31]
    buf_state_en <= UInt<1>("h00") @[ahb_to_axi4.scala 68:31]
    buf_rdata_en <= UInt<1>("h00") @[ahb_to_axi4.scala 69:31]
    buf_read_error_in <= UInt<1>("h00") @[ahb_to_axi4.scala 70:31]
    cmdbuf_wr_en <= UInt<1>("h00") @[ahb_to_axi4.scala 71:31]
    node _T_7 = eq(UInt<2>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_7 : @[Conditional.scala 40:58]
      node _T_8 = mux(io.ahb.sig.out.hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 75:26]
      buf_nxtstate <= _T_8 @[ahb_to_axi4.scala 75:20]
      node _T_9 = bits(io.ahb.sig.out.htrans, 1, 1) @[ahb_to_axi4.scala 76:57]
      node _T_10 = and(ahb_hready, _T_9) @[ahb_to_axi4.scala 76:34]
      node _T_11 = and(_T_10, io.ahb.hsel) @[ahb_to_axi4.scala 76:61]
      buf_state_en <= _T_11 @[ahb_to_axi4.scala 76:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_12 = eq(UInt<2>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_12 : @[Conditional.scala 39:67]
        node _T_13 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 79:72]
        node _T_14 = eq(_T_13, UInt<1>("h00")) @[ahb_to_axi4.scala 79:79]
        node _T_15 = or(io.ahb.sig.in.hresp, _T_14) @[ahb_to_axi4.scala 79:48]
        node _T_16 = eq(io.ahb.hsel, UInt<1>("h00")) @[ahb_to_axi4.scala 79:93]
        node _T_17 = or(_T_15, _T_16) @[ahb_to_axi4.scala 79:91]
        node _T_18 = bits(_T_17, 0, 0) @[ahb_to_axi4.scala 79:107]
        node _T_19 = mux(io.ahb.sig.out.hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 79:124]
        node _T_20 = mux(_T_18, UInt<2>("h00"), _T_19) @[ahb_to_axi4.scala 79:26]
        buf_nxtstate <= _T_20 @[ahb_to_axi4.scala 79:20]
        node _T_21 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 80:24]
        node _T_22 = or(_T_21, io.ahb.sig.in.hresp) @[ahb_to_axi4.scala 80:37]
        buf_state_en <= _T_22 @[ahb_to_axi4.scala 80:20]
        node _T_23 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 81:23]
        node _T_24 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 81:85]
        node _T_25 = eq(_T_24, UInt<2>("h01")) @[ahb_to_axi4.scala 81:92]
        node _T_26 = and(_T_25, io.ahb.hsel) @[ahb_to_axi4.scala 81:110]
        node _T_27 = or(io.ahb.sig.in.hresp, _T_26) @[ahb_to_axi4.scala 81:60]
        node _T_28 = eq(_T_27, UInt<1>("h00")) @[ahb_to_axi4.scala 81:38]
        node _T_29 = and(_T_23, _T_28) @[ahb_to_axi4.scala 81:36]
        cmdbuf_wr_en <= _T_29 @[ahb_to_axi4.scala 81:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_30 = eq(UInt<2>("h02"), buf_state) @[Conditional.scala 37:30]
        when _T_30 : @[Conditional.scala 39:67]
          node _T_31 = mux(io.ahb.sig.in.hresp, UInt<2>("h00"), UInt<2>("h03")) @[ahb_to_axi4.scala 84:26]
          buf_nxtstate <= _T_31 @[ahb_to_axi4.scala 84:20]
          node _T_32 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 85:24]
          node _T_33 = or(_T_32, io.ahb.sig.in.hresp) @[ahb_to_axi4.scala 85:37]
          buf_state_en <= _T_33 @[ahb_to_axi4.scala 85:20]
          node _T_34 = eq(io.ahb.sig.in.hresp, UInt<1>("h00")) @[ahb_to_axi4.scala 86:23]
          node _T_35 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 86:46]
          node _T_36 = and(_T_34, _T_35) @[ahb_to_axi4.scala 86:44]
          cmdbuf_wr_en <= _T_36 @[ahb_to_axi4.scala 86:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_37 = eq(UInt<2>("h03"), buf_state) @[Conditional.scala 37:30]
          when _T_37 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 89:20]
            node _T_38 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 90:40]
            node _T_39 = and(io.axi.r.valid, _T_38) @[ahb_to_axi4.scala 90:38]
            buf_state_en <= _T_39 @[ahb_to_axi4.scala 90:20]
            buf_rdata_en <= buf_state_en @[ahb_to_axi4.scala 91:20]
            node _T_40 = bits(io.axi.r.bits.resp, 1, 0) @[ahb_to_axi4.scala 92:61]
            node _T_41 = orr(_T_40) @[ahb_to_axi4.scala 92:68]
            node _T_42 = and(buf_state_en, _T_41) @[ahb_to_axi4.scala 92:41]
            buf_read_error_in <= _T_42 @[ahb_to_axi4.scala 92:25]
            skip @[Conditional.scala 39:67]
    node _T_43 = bits(buf_state_en, 0, 0) @[ahb_to_axi4.scala 95:99]
    reg _T_44 : UInt, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_43 : @[Reg.scala 28:19]
      _T_44 <= buf_nxtstate @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_state <= _T_44 @[ahb_to_axi4.scala 95:31]
    node _T_45 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 97:54]
    node _T_46 = eq(_T_45, UInt<1>("h00")) @[ahb_to_axi4.scala 97:60]
    node _T_47 = bits(_T_46, 0, 0) @[Bitwise.scala 72:15]
    node _T_48 = mux(_T_47, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_49 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 97:92]
    node _T_50 = dshl(UInt<1>("h01"), _T_49) @[ahb_to_axi4.scala 97:78]
    node _T_51 = and(_T_48, _T_50) @[ahb_to_axi4.scala 97:70]
    node _T_52 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 98:24]
    node _T_53 = eq(_T_52, UInt<1>("h01")) @[ahb_to_axi4.scala 98:30]
    node _T_54 = bits(_T_53, 0, 0) @[Bitwise.scala 72:15]
    node _T_55 = mux(_T_54, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_56 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 98:62]
    node _T_57 = dshl(UInt<2>("h03"), _T_56) @[ahb_to_axi4.scala 98:48]
    node _T_58 = and(_T_55, _T_57) @[ahb_to_axi4.scala 98:40]
    node _T_59 = or(_T_51, _T_58) @[ahb_to_axi4.scala 97:109]
    node _T_60 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 99:24]
    node _T_61 = eq(_T_60, UInt<2>("h02")) @[ahb_to_axi4.scala 99:30]
    node _T_62 = bits(_T_61, 0, 0) @[Bitwise.scala 72:15]
    node _T_63 = mux(_T_62, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_64 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 99:62]
    node _T_65 = dshl(UInt<4>("h0f"), _T_64) @[ahb_to_axi4.scala 99:48]
    node _T_66 = and(_T_63, _T_65) @[ahb_to_axi4.scala 99:40]
    node _T_67 = or(_T_59, _T_66) @[ahb_to_axi4.scala 98:79]
    node _T_68 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 100:24]
    node _T_69 = eq(_T_68, UInt<2>("h03")) @[ahb_to_axi4.scala 100:30]
    node _T_70 = bits(_T_69, 0, 0) @[Bitwise.scala 72:15]
    node _T_71 = mux(_T_70, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_72 = and(_T_71, UInt<8>("h0ff")) @[ahb_to_axi4.scala 100:40]
    node _T_73 = or(_T_67, _T_72) @[ahb_to_axi4.scala 99:79]
    master_wstrb <= _T_73 @[ahb_to_axi4.scala 97:31]
    node _T_74 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 103:80]
    node _T_75 = and(ahb_hresp_q, _T_74) @[ahb_to_axi4.scala 103:78]
    node _T_76 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 103:98]
    node _T_77 = eq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 103:124]
    node _T_78 = or(_T_76, _T_77) @[ahb_to_axi4.scala 103:111]
    node _T_79 = eq(buf_state, UInt<2>("h02")) @[ahb_to_axi4.scala 103:149]
    node _T_80 = eq(buf_state, UInt<2>("h03")) @[ahb_to_axi4.scala 103:168]
    node _T_81 = or(_T_79, _T_80) @[ahb_to_axi4.scala 103:156]
    node _T_82 = eq(_T_81, UInt<1>("h00")) @[ahb_to_axi4.scala 103:137]
    node _T_83 = and(_T_78, _T_82) @[ahb_to_axi4.scala 103:135]
    node _T_84 = eq(buf_read_error, UInt<1>("h00")) @[ahb_to_axi4.scala 103:181]
    node _T_85 = and(_T_83, _T_84) @[ahb_to_axi4.scala 103:179]
    node _T_86 = mux(io.ahb.sig.in.hresp, _T_75, _T_85) @[ahb_to_axi4.scala 103:44]
    io.ahb.sig.in.hready <= _T_86 @[ahb_to_axi4.scala 103:38]
    node _T_87 = and(io.ahb.sig.in.hready, io.ahb.hreadyin) @[ahb_to_axi4.scala 104:55]
    ahb_hready <= _T_87 @[ahb_to_axi4.scala 104:31]
    node _T_88 = bits(io.ahb.hsel, 0, 0) @[Bitwise.scala 72:15]
    node _T_89 = mux(_T_88, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_90 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 105:77]
    node _T_91 = and(_T_89, _T_90) @[ahb_to_axi4.scala 105:54]
    ahb_htrans_in <= _T_91 @[ahb_to_axi4.scala 105:31]
    node _T_92 = bits(buf_rdata, 63, 0) @[ahb_to_axi4.scala 106:50]
    io.ahb.sig.in.hrdata <= _T_92 @[ahb_to_axi4.scala 106:38]
    node _T_93 = bits(ahb_htrans_q, 1, 0) @[ahb_to_axi4.scala 107:55]
    node _T_94 = neq(_T_93, UInt<1>("h00")) @[ahb_to_axi4.scala 107:61]
    node _T_95 = neq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 107:83]
    node _T_96 = and(_T_94, _T_95) @[ahb_to_axi4.scala 107:70]
    node _T_97 = or(ahb_addr_in_dccm, ahb_addr_in_iccm) @[ahb_to_axi4.scala 108:26]
    node _T_98 = eq(_T_97, UInt<1>("h00")) @[ahb_to_axi4.scala 108:7]
    node _T_99 = and(ahb_addr_in_dccm, ahb_hwrite_q) @[ahb_to_axi4.scala 109:46]
    node _T_100 = or(ahb_addr_in_iccm, _T_99) @[ahb_to_axi4.scala 109:26]
    node _T_101 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 109:80]
    node _T_102 = eq(_T_101, UInt<2>("h02")) @[ahb_to_axi4.scala 109:86]
    node _T_103 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 109:109]
    node _T_104 = eq(_T_103, UInt<2>("h03")) @[ahb_to_axi4.scala 109:115]
    node _T_105 = or(_T_102, _T_104) @[ahb_to_axi4.scala 109:95]
    node _T_106 = eq(_T_105, UInt<1>("h00")) @[ahb_to_axi4.scala 109:66]
    node _T_107 = and(_T_100, _T_106) @[ahb_to_axi4.scala 109:64]
    node _T_108 = or(_T_98, _T_107) @[ahb_to_axi4.scala 108:47]
    node _T_109 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 110:20]
    node _T_110 = eq(_T_109, UInt<1>("h01")) @[ahb_to_axi4.scala 110:26]
    node _T_111 = bits(ahb_haddr_q, 0, 0) @[ahb_to_axi4.scala 110:48]
    node _T_112 = and(_T_110, _T_111) @[ahb_to_axi4.scala 110:35]
    node _T_113 = or(_T_108, _T_112) @[ahb_to_axi4.scala 109:126]
    node _T_114 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 111:20]
    node _T_115 = eq(_T_114, UInt<2>("h02")) @[ahb_to_axi4.scala 111:26]
    node _T_116 = bits(ahb_haddr_q, 1, 0) @[ahb_to_axi4.scala 111:49]
    node _T_117 = orr(_T_116) @[ahb_to_axi4.scala 111:56]
    node _T_118 = and(_T_115, _T_117) @[ahb_to_axi4.scala 111:35]
    node _T_119 = or(_T_113, _T_118) @[ahb_to_axi4.scala 110:55]
    node _T_120 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 112:20]
    node _T_121 = eq(_T_120, UInt<2>("h03")) @[ahb_to_axi4.scala 112:26]
    node _T_122 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 112:49]
    node _T_123 = orr(_T_122) @[ahb_to_axi4.scala 112:56]
    node _T_124 = and(_T_121, _T_123) @[ahb_to_axi4.scala 112:35]
    node _T_125 = or(_T_119, _T_124) @[ahb_to_axi4.scala 111:61]
    node _T_126 = and(_T_96, _T_125) @[ahb_to_axi4.scala 107:94]
    node _T_127 = or(_T_126, buf_read_error) @[ahb_to_axi4.scala 112:63]
    node _T_128 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 114:20]
    node _T_129 = and(ahb_hresp_q, _T_128) @[ahb_to_axi4.scala 114:18]
    node _T_130 = or(_T_127, _T_129) @[ahb_to_axi4.scala 113:20]
    io.ahb.sig.in.hresp <= _T_130 @[ahb_to_axi4.scala 107:38]
    reg _T_131 : UInt, buf_rdata_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 117:66]
    _T_131 <= io.axi.r.bits.data @[ahb_to_axi4.scala 117:66]
    buf_rdata <= _T_131 @[ahb_to_axi4.scala 117:31]
    reg _T_132 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 118:60]
    _T_132 <= buf_read_error_in @[ahb_to_axi4.scala 118:60]
    buf_read_error <= _T_132 @[ahb_to_axi4.scala 118:31]
    reg _T_133 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 121:60]
    _T_133 <= io.ahb.sig.in.hresp @[ahb_to_axi4.scala 121:60]
    ahb_hresp_q <= _T_133 @[ahb_to_axi4.scala 121:31]
    reg _T_134 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 122:60]
    _T_134 <= ahb_hready @[ahb_to_axi4.scala 122:60]
    ahb_hready_q <= _T_134 @[ahb_to_axi4.scala 122:31]
    reg _T_135 : UInt, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 123:60]
    _T_135 <= ahb_htrans_in @[ahb_to_axi4.scala 123:60]
    ahb_htrans_q <= _T_135 @[ahb_to_axi4.scala 123:31]
    reg _T_136 : UInt, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 124:65]
    _T_136 <= io.ahb.sig.out.hsize @[ahb_to_axi4.scala 124:65]
    ahb_hsize_q <= _T_136 @[ahb_to_axi4.scala 124:31]
    reg _T_137 : UInt<1>, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 125:65]
    _T_137 <= io.ahb.sig.out.hwrite @[ahb_to_axi4.scala 125:65]
    ahb_hwrite_q <= _T_137 @[ahb_to_axi4.scala 125:31]
    reg _T_138 : UInt, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 126:65]
    _T_138 <= io.ahb.sig.out.haddr @[ahb_to_axi4.scala 126:65]
    ahb_haddr_q <= _T_138 @[ahb_to_axi4.scala 126:31]
    node _T_139 = bits(io.ahb.sig.out.htrans, 1, 1) @[ahb_to_axi4.scala 129:85]
    node _T_140 = and(ahb_hready, _T_139) @[ahb_to_axi4.scala 129:62]
    node _T_141 = and(io.bus_clk_en, _T_140) @[ahb_to_axi4.scala 129:48]
    ahb_bus_addr_clk_en <= _T_141 @[ahb_to_axi4.scala 129:31]
    node _T_142 = and(io.bus_clk_en, buf_rdata_en) @[ahb_to_axi4.scala 130:48]
    buf_rdata_clk_en <= _T_142 @[ahb_to_axi4.scala 130:31]
    inst rvclkhdr of rvclkhdr @[lib.scala 343:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr.io.en <= io.bus_clk_en @[lib.scala 345:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    ahb_clk <= rvclkhdr.io.l1clk @[ahb_to_axi4.scala 132:31]
    inst rvclkhdr_1 of rvclkhdr_1 @[lib.scala 343:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_1.io.en <= ahb_bus_addr_clk_en @[lib.scala 345:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    ahb_addr_clk <= rvclkhdr_1.io.l1clk @[ahb_to_axi4.scala 133:31]
    inst rvclkhdr_2 of rvclkhdr_2 @[lib.scala 343:22]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_2.io.en <= buf_rdata_clk_en @[lib.scala 345:16]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    buf_rdata_clk <= rvclkhdr_2.io.l1clk @[ahb_to_axi4.scala 134:31]
    node _T_143 = and(io.axi.aw.valid, io.axi.aw.ready) @[ahb_to_axi4.scala 136:53]
    node _T_144 = and(io.axi.ar.valid, io.axi.ar.ready) @[ahb_to_axi4.scala 136:91]
    node _T_145 = or(_T_143, _T_144) @[ahb_to_axi4.scala 136:72]
    node _T_146 = eq(cmdbuf_wr_en, UInt<1>("h00")) @[ahb_to_axi4.scala 136:113]
    node _T_147 = and(_T_145, _T_146) @[ahb_to_axi4.scala 136:111]
    node _T_148 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 136:153]
    node _T_149 = and(io.ahb.sig.in.hresp, _T_148) @[ahb_to_axi4.scala 136:151]
    node _T_150 = or(_T_147, _T_149) @[ahb_to_axi4.scala 136:128]
    cmdbuf_rst <= _T_150 @[ahb_to_axi4.scala 136:31]
    node _T_151 = and(io.axi.aw.valid, io.axi.aw.ready) @[ahb_to_axi4.scala 137:67]
    node _T_152 = and(io.axi.ar.valid, io.axi.ar.ready) @[ahb_to_axi4.scala 137:105]
    node _T_153 = or(_T_151, _T_152) @[ahb_to_axi4.scala 137:86]
    node _T_154 = eq(_T_153, UInt<1>("h00")) @[ahb_to_axi4.scala 137:48]
    node _T_155 = and(cmdbuf_vld, _T_154) @[ahb_to_axi4.scala 137:46]
    cmdbuf_full <= _T_155 @[ahb_to_axi4.scala 137:31]
    node _T_156 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 139:86]
    node _T_157 = mux(_T_156, UInt<1>("h01"), cmdbuf_vld) @[ahb_to_axi4.scala 139:66]
    node _T_158 = eq(cmdbuf_rst, UInt<1>("h00")) @[ahb_to_axi4.scala 139:110]
    node _T_159 = and(_T_157, _T_158) @[ahb_to_axi4.scala 139:108]
    reg _T_160 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 139:61]
    _T_160 <= _T_159 @[ahb_to_axi4.scala 139:61]
    cmdbuf_vld <= _T_160 @[ahb_to_axi4.scala 139:31]
    node _T_161 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 143:53]
    reg _T_162 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_161 : @[Reg.scala 28:19]
      _T_162 <= ahb_hwrite_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_write <= _T_162 @[ahb_to_axi4.scala 142:31]
    node _T_163 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 146:52]
    reg _T_164 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_163 : @[Reg.scala 28:19]
      _T_164 <= ahb_hsize_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_size <= _T_164 @[ahb_to_axi4.scala 145:31]
    node _T_165 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 149:53]
    reg _T_166 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_165 : @[Reg.scala 28:19]
      _T_166 <= master_wstrb @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_wstrb <= _T_166 @[ahb_to_axi4.scala 148:31]
    node _T_167 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 152:57]
    inst rvclkhdr_3 of rvclkhdr_3 @[lib.scala 368:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[lib.scala 370:18]
    rvclkhdr_3.io.en <= _T_167 @[lib.scala 371:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[lib.scala 372:24]
    reg _T_168 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[lib.scala 374:16]
    _T_168 <= ahb_haddr_q @[lib.scala 374:16]
    cmdbuf_addr <= _T_168 @[ahb_to_axi4.scala 152:15]
    node _T_169 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 153:68]
    inst rvclkhdr_4 of rvclkhdr_4 @[lib.scala 368:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= bus_clk @[lib.scala 370:18]
    rvclkhdr_4.io.en <= _T_169 @[lib.scala 371:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[lib.scala 372:24]
    reg _T_170 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[lib.scala 374:16]
    _T_170 <= io.ahb.sig.out.hwdata @[lib.scala 374:16]
    cmdbuf_wdata <= _T_170 @[ahb_to_axi4.scala 153:16]
    node _T_171 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 156:42]
    io.axi.aw.valid <= _T_171 @[ahb_to_axi4.scala 156:28]
    node _T_172 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.aw.bits.id <= _T_172 @[ahb_to_axi4.scala 157:33]
    io.axi.aw.bits.addr <= cmdbuf_addr @[ahb_to_axi4.scala 158:33]
    node _T_173 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 159:59]
    node _T_174 = cat(UInt<1>("h00"), _T_173) @[Cat.scala 29:58]
    io.axi.aw.bits.size <= _T_174 @[ahb_to_axi4.scala 159:33]
    node _T_175 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.aw.bits.prot <= _T_175 @[ahb_to_axi4.scala 160:33]
    node _T_176 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi.aw.bits.len <= _T_176 @[ahb_to_axi4.scala 161:33]
    io.axi.aw.bits.burst <= UInt<1>("h01") @[ahb_to_axi4.scala 162:33]
    node _T_177 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 164:42]
    io.axi.w.valid <= _T_177 @[ahb_to_axi4.scala 164:28]
    io.axi.w.bits.data <= cmdbuf_wdata @[ahb_to_axi4.scala 165:33]
    io.axi.w.bits.strb <= cmdbuf_wstrb @[ahb_to_axi4.scala 166:33]
    io.axi.w.bits.last <= UInt<1>("h01") @[ahb_to_axi4.scala 167:33]
    io.axi.b.ready <= UInt<1>("h01") @[ahb_to_axi4.scala 169:28]
    node _T_178 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 171:44]
    node _T_179 = and(cmdbuf_vld, _T_178) @[ahb_to_axi4.scala 171:42]
    io.axi.ar.valid <= _T_179 @[ahb_to_axi4.scala 171:28]
    node _T_180 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.ar.bits.id <= _T_180 @[ahb_to_axi4.scala 172:33]
    io.axi.ar.bits.addr <= cmdbuf_addr @[ahb_to_axi4.scala 173:33]
    node _T_181 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 174:59]
    node _T_182 = cat(UInt<1>("h00"), _T_181) @[Cat.scala 29:58]
    io.axi.ar.bits.size <= _T_182 @[ahb_to_axi4.scala 174:33]
    node _T_183 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.ar.bits.prot <= _T_183 @[ahb_to_axi4.scala 175:33]
    node _T_184 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi.ar.bits.len <= _T_184 @[ahb_to_axi4.scala 176:33]
    io.axi.ar.bits.burst <= UInt<1>("h01") @[ahb_to_axi4.scala 177:33]
    io.axi.r.ready <= UInt<1>("h01") @[ahb_to_axi4.scala 179:28]
    inst rvclkhdr_5 of rvclkhdr_5 @[lib.scala 343:22]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_5.io.en <= io.bus_clk_en @[lib.scala 345:16]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    bus_clk <= rvclkhdr_5.io.l1clk @[ahb_to_axi4.scala 180:27]
    
