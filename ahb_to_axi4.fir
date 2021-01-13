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
    
  module ahb_to_axi4 : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip bus_clk_en : UInt<1>, flip clk_override : UInt<1>, axi : {aw : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, w : {flip ready : UInt<1>, valid : UInt<1>, bits : {data : UInt<64>, strb : UInt<8>, last : UInt<1>}}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : {resp : UInt<2>, id : UInt<1>}}, ar : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, flip r : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, data : UInt<64>, resp : UInt<2>, last : UInt<1>}}}, ahb : {flip sig : {in : {flip hrdata : UInt<64>, flip hready : UInt<1>, flip hresp : UInt<1>}, out : {haddr : UInt<32>, hburst : UInt<3>, hmastlock : UInt<1>, hprot : UInt<4>, hsize : UInt<3>, htrans : UInt<2>, hwrite : UInt<1>, hwdata : UInt<64>}}, flip hsel : UInt<1>, flip hreadyin : UInt<1>}}
    
    wire _T : {aw : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, w : {flip ready : UInt<1>, valid : UInt<1>, bits : {data : UInt<64>, strb : UInt<8>, last : UInt<1>}}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : {resp : UInt<2>, id : UInt<1>}}, ar : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, addr : UInt<32>, region : UInt<4>, len : UInt<8>, size : UInt<3>, burst : UInt<2>, lock : UInt<1>, cache : UInt<4>, prot : UInt<3>, qos : UInt<4>}}, flip r : {flip ready : UInt<1>, valid : UInt<1>, bits : {id : UInt<1>, data : UInt<64>, resp : UInt<2>, last : UInt<1>}}} @[ahb_to_axi4.scala 20:25]
    _T.r.bits.last <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.resp <= UInt<2>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.data <= UInt<64>("h00") @[ahb_to_axi4.scala 20:25]
    _T.r.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
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
    _T.ar.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.valid <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.ar.ready <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
    _T.b.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
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
    _T.aw.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 20:25]
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
    wire ahb_addr_clk_en : UInt<1>
    ahb_addr_clk_en <= UInt<1>("h00")
    wire buf_rdata_clk_en : UInt<1>
    buf_rdata_clk_en <= UInt<1>("h00")
    wire bus_clk : Clock @[ahb_to_axi4.scala 43:33]
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
    buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 66:31]
    buf_state_en <= UInt<1>("h00") @[ahb_to_axi4.scala 67:31]
    buf_rdata_en <= UInt<1>("h00") @[ahb_to_axi4.scala 68:31]
    buf_read_error_in <= UInt<1>("h00") @[ahb_to_axi4.scala 69:31]
    cmdbuf_wr_en <= UInt<1>("h00") @[ahb_to_axi4.scala 70:31]
    node _T_7 = eq(UInt<2>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_7 : @[Conditional.scala 40:58]
      node _T_8 = mux(io.ahb.sig.out.hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 74:26]
      buf_nxtstate <= _T_8 @[ahb_to_axi4.scala 74:20]
      node _T_9 = bits(io.ahb.sig.out.htrans, 1, 1) @[ahb_to_axi4.scala 75:57]
      node _T_10 = and(ahb_hready, _T_9) @[ahb_to_axi4.scala 75:34]
      node _T_11 = and(_T_10, io.ahb.hsel) @[ahb_to_axi4.scala 75:61]
      buf_state_en <= _T_11 @[ahb_to_axi4.scala 75:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_12 = eq(UInt<2>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_12 : @[Conditional.scala 39:67]
        node _T_13 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 78:72]
        node _T_14 = eq(_T_13, UInt<1>("h00")) @[ahb_to_axi4.scala 78:79]
        node _T_15 = or(io.ahb.sig.in.hresp, _T_14) @[ahb_to_axi4.scala 78:48]
        node _T_16 = eq(io.ahb.hsel, UInt<1>("h00")) @[ahb_to_axi4.scala 78:93]
        node _T_17 = or(_T_15, _T_16) @[ahb_to_axi4.scala 78:91]
        node _T_18 = bits(_T_17, 0, 0) @[ahb_to_axi4.scala 78:107]
        node _T_19 = mux(io.ahb.sig.out.hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 78:124]
        node _T_20 = mux(_T_18, UInt<2>("h00"), _T_19) @[ahb_to_axi4.scala 78:26]
        buf_nxtstate <= _T_20 @[ahb_to_axi4.scala 78:20]
        node _T_21 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 79:24]
        node _T_22 = or(_T_21, io.ahb.sig.in.hresp) @[ahb_to_axi4.scala 79:37]
        buf_state_en <= _T_22 @[ahb_to_axi4.scala 79:20]
        node _T_23 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 80:23]
        node _T_24 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 80:85]
        node _T_25 = eq(_T_24, UInt<2>("h01")) @[ahb_to_axi4.scala 80:92]
        node _T_26 = and(_T_25, io.ahb.hsel) @[ahb_to_axi4.scala 80:110]
        node _T_27 = or(io.ahb.sig.in.hresp, _T_26) @[ahb_to_axi4.scala 80:60]
        node _T_28 = eq(_T_27, UInt<1>("h00")) @[ahb_to_axi4.scala 80:38]
        node _T_29 = and(_T_23, _T_28) @[ahb_to_axi4.scala 80:36]
        cmdbuf_wr_en <= _T_29 @[ahb_to_axi4.scala 80:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_30 = eq(UInt<2>("h02"), buf_state) @[Conditional.scala 37:30]
        when _T_30 : @[Conditional.scala 39:67]
          node _T_31 = mux(io.ahb.sig.in.hresp, UInt<2>("h00"), UInt<2>("h03")) @[ahb_to_axi4.scala 83:26]
          buf_nxtstate <= _T_31 @[ahb_to_axi4.scala 83:20]
          node _T_32 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 84:24]
          node _T_33 = or(_T_32, io.ahb.sig.in.hresp) @[ahb_to_axi4.scala 84:37]
          buf_state_en <= _T_33 @[ahb_to_axi4.scala 84:20]
          node _T_34 = eq(io.ahb.sig.in.hresp, UInt<1>("h00")) @[ahb_to_axi4.scala 85:23]
          node _T_35 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 85:46]
          node _T_36 = and(_T_34, _T_35) @[ahb_to_axi4.scala 85:44]
          cmdbuf_wr_en <= _T_36 @[ahb_to_axi4.scala 85:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_37 = eq(UInt<2>("h03"), buf_state) @[Conditional.scala 37:30]
          when _T_37 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 88:20]
            node _T_38 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 89:40]
            node _T_39 = and(io.axi.r.valid, _T_38) @[ahb_to_axi4.scala 89:38]
            buf_state_en <= _T_39 @[ahb_to_axi4.scala 89:20]
            buf_rdata_en <= buf_state_en @[ahb_to_axi4.scala 90:20]
            node _T_40 = bits(io.axi.r.bits.resp, 1, 0) @[ahb_to_axi4.scala 91:61]
            node _T_41 = orr(_T_40) @[ahb_to_axi4.scala 91:68]
            node _T_42 = and(buf_state_en, _T_41) @[ahb_to_axi4.scala 91:41]
            buf_read_error_in <= _T_42 @[ahb_to_axi4.scala 91:25]
            skip @[Conditional.scala 39:67]
    node _T_43 = bits(buf_state_en, 0, 0) @[ahb_to_axi4.scala 94:78]
    node _T_44 = and(io.bus_clk_en, _T_43) @[lib.scala 383:57]
    reg _T_45 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_44 : @[Reg.scala 28:19]
      _T_45 <= buf_nxtstate @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_state <= _T_45 @[ahb_to_axi4.scala 94:31]
    node _T_46 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 96:54]
    node _T_47 = eq(_T_46, UInt<1>("h00")) @[ahb_to_axi4.scala 96:60]
    node _T_48 = bits(_T_47, 0, 0) @[Bitwise.scala 72:15]
    node _T_49 = mux(_T_48, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_50 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 96:92]
    node _T_51 = dshl(UInt<1>("h01"), _T_50) @[ahb_to_axi4.scala 96:78]
    node _T_52 = and(_T_49, _T_51) @[ahb_to_axi4.scala 96:70]
    node _T_53 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 97:24]
    node _T_54 = eq(_T_53, UInt<1>("h01")) @[ahb_to_axi4.scala 97:30]
    node _T_55 = bits(_T_54, 0, 0) @[Bitwise.scala 72:15]
    node _T_56 = mux(_T_55, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_57 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 97:62]
    node _T_58 = dshl(UInt<2>("h03"), _T_57) @[ahb_to_axi4.scala 97:48]
    node _T_59 = and(_T_56, _T_58) @[ahb_to_axi4.scala 97:40]
    node _T_60 = or(_T_52, _T_59) @[ahb_to_axi4.scala 96:109]
    node _T_61 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 98:24]
    node _T_62 = eq(_T_61, UInt<2>("h02")) @[ahb_to_axi4.scala 98:30]
    node _T_63 = bits(_T_62, 0, 0) @[Bitwise.scala 72:15]
    node _T_64 = mux(_T_63, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_65 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 98:62]
    node _T_66 = dshl(UInt<4>("h0f"), _T_65) @[ahb_to_axi4.scala 98:48]
    node _T_67 = and(_T_64, _T_66) @[ahb_to_axi4.scala 98:40]
    node _T_68 = or(_T_60, _T_67) @[ahb_to_axi4.scala 97:79]
    node _T_69 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 99:24]
    node _T_70 = eq(_T_69, UInt<2>("h03")) @[ahb_to_axi4.scala 99:30]
    node _T_71 = bits(_T_70, 0, 0) @[Bitwise.scala 72:15]
    node _T_72 = mux(_T_71, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_73 = and(_T_72, UInt<8>("h0ff")) @[ahb_to_axi4.scala 99:40]
    node _T_74 = or(_T_68, _T_73) @[ahb_to_axi4.scala 98:79]
    master_wstrb <= _T_74 @[ahb_to_axi4.scala 96:31]
    node _T_75 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 102:80]
    node _T_76 = and(ahb_hresp_q, _T_75) @[ahb_to_axi4.scala 102:78]
    node _T_77 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 102:98]
    node _T_78 = eq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 102:124]
    node _T_79 = or(_T_77, _T_78) @[ahb_to_axi4.scala 102:111]
    node _T_80 = eq(buf_state, UInt<2>("h02")) @[ahb_to_axi4.scala 102:149]
    node _T_81 = eq(buf_state, UInt<2>("h03")) @[ahb_to_axi4.scala 102:168]
    node _T_82 = or(_T_80, _T_81) @[ahb_to_axi4.scala 102:156]
    node _T_83 = eq(_T_82, UInt<1>("h00")) @[ahb_to_axi4.scala 102:137]
    node _T_84 = and(_T_79, _T_83) @[ahb_to_axi4.scala 102:135]
    node _T_85 = eq(buf_read_error, UInt<1>("h00")) @[ahb_to_axi4.scala 102:181]
    node _T_86 = and(_T_84, _T_85) @[ahb_to_axi4.scala 102:179]
    node _T_87 = mux(io.ahb.sig.in.hresp, _T_76, _T_86) @[ahb_to_axi4.scala 102:44]
    io.ahb.sig.in.hready <= _T_87 @[ahb_to_axi4.scala 102:38]
    node _T_88 = and(io.ahb.sig.in.hready, io.ahb.hreadyin) @[ahb_to_axi4.scala 103:55]
    ahb_hready <= _T_88 @[ahb_to_axi4.scala 103:31]
    node _T_89 = bits(io.ahb.hsel, 0, 0) @[Bitwise.scala 72:15]
    node _T_90 = mux(_T_89, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_91 = bits(io.ahb.sig.out.htrans, 1, 0) @[ahb_to_axi4.scala 104:77]
    node _T_92 = and(_T_90, _T_91) @[ahb_to_axi4.scala 104:54]
    ahb_htrans_in <= _T_92 @[ahb_to_axi4.scala 104:31]
    node _T_93 = bits(buf_rdata, 63, 0) @[ahb_to_axi4.scala 105:50]
    io.ahb.sig.in.hrdata <= _T_93 @[ahb_to_axi4.scala 105:38]
    node _T_94 = bits(ahb_htrans_q, 1, 0) @[ahb_to_axi4.scala 106:55]
    node _T_95 = neq(_T_94, UInt<1>("h00")) @[ahb_to_axi4.scala 106:61]
    node _T_96 = neq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 106:83]
    node _T_97 = and(_T_95, _T_96) @[ahb_to_axi4.scala 106:70]
    node _T_98 = or(ahb_addr_in_dccm, ahb_addr_in_iccm) @[ahb_to_axi4.scala 107:26]
    node _T_99 = eq(_T_98, UInt<1>("h00")) @[ahb_to_axi4.scala 107:7]
    node _T_100 = and(ahb_addr_in_dccm, ahb_hwrite_q) @[ahb_to_axi4.scala 108:46]
    node _T_101 = or(ahb_addr_in_iccm, _T_100) @[ahb_to_axi4.scala 108:26]
    node _T_102 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 108:80]
    node _T_103 = eq(_T_102, UInt<2>("h02")) @[ahb_to_axi4.scala 108:86]
    node _T_104 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 108:109]
    node _T_105 = eq(_T_104, UInt<2>("h03")) @[ahb_to_axi4.scala 108:115]
    node _T_106 = or(_T_103, _T_105) @[ahb_to_axi4.scala 108:95]
    node _T_107 = eq(_T_106, UInt<1>("h00")) @[ahb_to_axi4.scala 108:66]
    node _T_108 = and(_T_101, _T_107) @[ahb_to_axi4.scala 108:64]
    node _T_109 = or(_T_99, _T_108) @[ahb_to_axi4.scala 107:47]
    node _T_110 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 109:20]
    node _T_111 = eq(_T_110, UInt<1>("h01")) @[ahb_to_axi4.scala 109:26]
    node _T_112 = bits(ahb_haddr_q, 0, 0) @[ahb_to_axi4.scala 109:48]
    node _T_113 = and(_T_111, _T_112) @[ahb_to_axi4.scala 109:35]
    node _T_114 = or(_T_109, _T_113) @[ahb_to_axi4.scala 108:126]
    node _T_115 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 110:20]
    node _T_116 = eq(_T_115, UInt<2>("h02")) @[ahb_to_axi4.scala 110:26]
    node _T_117 = bits(ahb_haddr_q, 1, 0) @[ahb_to_axi4.scala 110:49]
    node _T_118 = orr(_T_117) @[ahb_to_axi4.scala 110:56]
    node _T_119 = and(_T_116, _T_118) @[ahb_to_axi4.scala 110:35]
    node _T_120 = or(_T_114, _T_119) @[ahb_to_axi4.scala 109:55]
    node _T_121 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 111:20]
    node _T_122 = eq(_T_121, UInt<2>("h03")) @[ahb_to_axi4.scala 111:26]
    node _T_123 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 111:49]
    node _T_124 = orr(_T_123) @[ahb_to_axi4.scala 111:56]
    node _T_125 = and(_T_122, _T_124) @[ahb_to_axi4.scala 111:35]
    node _T_126 = or(_T_120, _T_125) @[ahb_to_axi4.scala 110:61]
    node _T_127 = and(_T_97, _T_126) @[ahb_to_axi4.scala 106:94]
    node _T_128 = or(_T_127, buf_read_error) @[ahb_to_axi4.scala 111:63]
    node _T_129 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 113:20]
    node _T_130 = and(ahb_hresp_q, _T_129) @[ahb_to_axi4.scala 113:18]
    node _T_131 = or(_T_128, _T_130) @[ahb_to_axi4.scala 112:20]
    io.ahb.sig.in.hresp <= _T_131 @[ahb_to_axi4.scala 106:38]
    reg _T_132 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when buf_rdata_clk_en : @[Reg.scala 28:19]
      _T_132 <= io.axi.r.bits.data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_rdata <= _T_132 @[ahb_to_axi4.scala 116:31]
    reg _T_133 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when io.bus_clk_en : @[Reg.scala 28:19]
      _T_133 <= buf_read_error_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_read_error <= _T_133 @[ahb_to_axi4.scala 117:31]
    reg _T_134 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when io.bus_clk_en : @[Reg.scala 28:19]
      _T_134 <= io.ahb.sig.in.hresp @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_hresp_q <= _T_134 @[ahb_to_axi4.scala 120:31]
    reg _T_135 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when io.bus_clk_en : @[Reg.scala 28:19]
      _T_135 <= ahb_hready @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_hready_q <= _T_135 @[ahb_to_axi4.scala 121:31]
    reg _T_136 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when io.bus_clk_en : @[Reg.scala 28:19]
      _T_136 <= ahb_htrans_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_htrans_q <= _T_136 @[ahb_to_axi4.scala 122:31]
    reg _T_137 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when ahb_addr_clk_en : @[Reg.scala 28:19]
      _T_137 <= io.ahb.sig.out.hsize @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_hsize_q <= _T_137 @[ahb_to_axi4.scala 123:31]
    reg _T_138 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when ahb_addr_clk_en : @[Reg.scala 28:19]
      _T_138 <= io.ahb.sig.out.hwrite @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_hwrite_q <= _T_138 @[ahb_to_axi4.scala 124:31]
    reg _T_139 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when ahb_addr_clk_en : @[Reg.scala 28:19]
      _T_139 <= io.ahb.sig.out.haddr @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    ahb_haddr_q <= _T_139 @[ahb_to_axi4.scala 125:31]
    node _T_140 = bits(io.ahb.sig.out.htrans, 1, 1) @[ahb_to_axi4.scala 128:81]
    node _T_141 = and(ahb_hready, _T_140) @[ahb_to_axi4.scala 128:58]
    node _T_142 = and(io.bus_clk_en, _T_141) @[ahb_to_axi4.scala 128:44]
    ahb_addr_clk_en <= _T_142 @[ahb_to_axi4.scala 128:27]
    node _T_143 = and(io.bus_clk_en, buf_rdata_en) @[ahb_to_axi4.scala 129:48]
    buf_rdata_clk_en <= _T_143 @[ahb_to_axi4.scala 129:31]
    node _T_144 = asClock(UInt<1>("h00")) @[ahb_to_axi4.scala 132:34]
    bus_clk <= _T_144 @[ahb_to_axi4.scala 132:20]
    node _T_145 = asClock(UInt<1>("h00")) @[ahb_to_axi4.scala 133:34]
    ahb_addr_clk <= _T_145 @[ahb_to_axi4.scala 133:20]
    node _T_146 = asClock(UInt<1>("h00")) @[ahb_to_axi4.scala 134:34]
    buf_rdata_clk <= _T_146 @[ahb_to_axi4.scala 134:20]
    node _T_147 = and(io.axi.aw.valid, io.axi.aw.ready) @[ahb_to_axi4.scala 141:53]
    node _T_148 = and(io.axi.ar.valid, io.axi.ar.ready) @[ahb_to_axi4.scala 141:91]
    node _T_149 = or(_T_147, _T_148) @[ahb_to_axi4.scala 141:72]
    node _T_150 = eq(cmdbuf_wr_en, UInt<1>("h00")) @[ahb_to_axi4.scala 141:113]
    node _T_151 = and(_T_149, _T_150) @[ahb_to_axi4.scala 141:111]
    node _T_152 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 141:153]
    node _T_153 = and(io.ahb.sig.in.hresp, _T_152) @[ahb_to_axi4.scala 141:151]
    node _T_154 = or(_T_151, _T_153) @[ahb_to_axi4.scala 141:128]
    cmdbuf_rst <= _T_154 @[ahb_to_axi4.scala 141:31]
    node _T_155 = and(io.axi.aw.valid, io.axi.aw.ready) @[ahb_to_axi4.scala 142:67]
    node _T_156 = and(io.axi.ar.valid, io.axi.ar.ready) @[ahb_to_axi4.scala 142:105]
    node _T_157 = or(_T_155, _T_156) @[ahb_to_axi4.scala 142:86]
    node _T_158 = eq(_T_157, UInt<1>("h00")) @[ahb_to_axi4.scala 142:48]
    node _T_159 = and(cmdbuf_vld, _T_158) @[ahb_to_axi4.scala 142:46]
    cmdbuf_full <= _T_159 @[ahb_to_axi4.scala 142:31]
    node _T_160 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 144:73]
    wire _T_161 : UInt @[lib.scala 389:21]
    node _T_162 = eq(cmdbuf_rst, UInt<1>("h00")) @[lib.scala 391:75]
    node _T_163 = and(UInt<1>("h01"), _T_162) @[lib.scala 391:53]
    node _T_164 = or(_T_160, cmdbuf_rst) @[lib.scala 391:95]
    node _T_165 = and(_T_164, io.bus_clk_en) @[lib.scala 391:102]
    node _T_166 = bits(_T_165, 0, 0) @[lib.scala 8:44]
    reg _T_167 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_166 : @[Reg.scala 28:19]
      _T_167 <= _T_163 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_161 <= _T_167 @[lib.scala 391:14]
    cmdbuf_vld <= _T_161 @[ahb_to_axi4.scala 144:31]
    node _T_168 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 146:79]
    node _T_169 = and(io.bus_clk_en, _T_168) @[lib.scala 383:57]
    reg _T_170 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_169 : @[Reg.scala 28:19]
      _T_170 <= ahb_hwrite_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_write <= _T_170 @[ahb_to_axi4.scala 146:31]
    node _T_171 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 147:78]
    node _T_172 = and(io.bus_clk_en, _T_171) @[lib.scala 383:57]
    reg _T_173 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_172 : @[Reg.scala 28:19]
      _T_173 <= ahb_hsize_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_size <= _T_173 @[ahb_to_axi4.scala 147:31]
    node _T_174 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 148:79]
    node _T_175 = and(io.bus_clk_en, _T_174) @[lib.scala 383:57]
    reg _T_176 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_175 : @[Reg.scala 28:19]
      _T_176 <= master_wstrb @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_wstrb <= _T_176 @[ahb_to_axi4.scala 148:31]
    node _T_177 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 150:57]
    node _T_178 = and(_T_177, io.bus_clk_en) @[ahb_to_axi4.scala 150:59]
    inst rvclkhdr of rvclkhdr @[lib.scala 399:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr.io.en <= _T_178 @[lib.scala 402:17]
    rvclkhdr.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_179 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_178 : @[Reg.scala 28:19]
      _T_179 <= ahb_haddr_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_addr <= _T_179 @[ahb_to_axi4.scala 150:15]
    node _T_180 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 151:68]
    node _T_181 = and(_T_180, io.bus_clk_en) @[ahb_to_axi4.scala 151:70]
    inst rvclkhdr_1 of rvclkhdr_1 @[lib.scala 399:23]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_1.io.en <= _T_181 @[lib.scala 402:17]
    rvclkhdr_1.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_182 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_181 : @[Reg.scala 28:19]
      _T_182 <= io.ahb.sig.out.hwdata @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_wdata <= _T_182 @[ahb_to_axi4.scala 151:16]
    node _T_183 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 154:42]
    io.axi.aw.valid <= _T_183 @[ahb_to_axi4.scala 154:28]
    io.axi.aw.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 155:33]
    io.axi.aw.bits.addr <= cmdbuf_addr @[ahb_to_axi4.scala 156:33]
    node _T_184 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 157:59]
    node _T_185 = cat(UInt<1>("h00"), _T_184) @[Cat.scala 29:58]
    io.axi.aw.bits.size <= _T_185 @[ahb_to_axi4.scala 157:33]
    node _T_186 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.aw.bits.prot <= _T_186 @[ahb_to_axi4.scala 158:33]
    node _T_187 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi.aw.bits.len <= _T_187 @[ahb_to_axi4.scala 159:33]
    io.axi.aw.bits.burst <= UInt<1>("h01") @[ahb_to_axi4.scala 160:33]
    node _T_188 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 162:42]
    io.axi.w.valid <= _T_188 @[ahb_to_axi4.scala 162:28]
    io.axi.w.bits.data <= cmdbuf_wdata @[ahb_to_axi4.scala 163:33]
    io.axi.w.bits.strb <= cmdbuf_wstrb @[ahb_to_axi4.scala 164:33]
    io.axi.w.bits.last <= UInt<1>("h01") @[ahb_to_axi4.scala 165:33]
    io.axi.b.ready <= UInt<1>("h01") @[ahb_to_axi4.scala 167:28]
    node _T_189 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 169:44]
    node _T_190 = and(cmdbuf_vld, _T_189) @[ahb_to_axi4.scala 169:42]
    io.axi.ar.valid <= _T_190 @[ahb_to_axi4.scala 169:28]
    io.axi.ar.bits.id <= UInt<1>("h00") @[ahb_to_axi4.scala 170:33]
    io.axi.ar.bits.addr <= cmdbuf_addr @[ahb_to_axi4.scala 171:33]
    node _T_191 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 172:59]
    node _T_192 = cat(UInt<1>("h00"), _T_191) @[Cat.scala 29:58]
    io.axi.ar.bits.size <= _T_192 @[ahb_to_axi4.scala 172:33]
    node _T_193 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi.ar.bits.prot <= _T_193 @[ahb_to_axi4.scala 173:33]
    node _T_194 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi.ar.bits.len <= _T_194 @[ahb_to_axi4.scala 174:33]
    io.axi.ar.bits.burst <= UInt<1>("h01") @[ahb_to_axi4.scala 175:33]
    io.axi.r.ready <= UInt<1>("h01") @[ahb_to_axi4.scala 177:28]
    
