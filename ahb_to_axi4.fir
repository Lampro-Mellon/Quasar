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
    
  module ahb_to_axi4 : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip bus_clk_en : UInt<1>, flip clk_override : UInt<1>, flip axi_awready : UInt<1>, flip axi_wready : UInt<1>, flip axi_bvalid : UInt<1>, flip axi_bresp : UInt<2>, flip axi_bid : UInt<0>, flip axi_arready : UInt<1>, flip axi_rvalid : UInt<1>, flip axi_rid : UInt<0>, flip axi_rdata : UInt<64>, flip axi_rresp : UInt<2>, flip ahb_haddr : UInt<32>, flip ahb_hburst : UInt<3>, flip ahb_hmastlock : UInt<1>, flip ahb_hprot : UInt<4>, flip ahb_hsize : UInt<3>, flip ahb_htrans : UInt<2>, flip ahb_hwrite : UInt<1>, flip ahb_hwdata : UInt<64>, flip ahb_hsel : UInt<1>, flip ahb_hreadyin : UInt<1>, axi_awvalid : UInt<1>, axi_awid : UInt<0>, axi_awaddr : UInt<32>, axi_awsize : UInt<3>, axi_awprot : UInt<3>, axi_awlen : UInt<8>, axi_awburst : UInt<2>, axi_wvalid : UInt<1>, axi_wdata : UInt<64>, axi_wstrb : UInt<8>, axi_wlast : UInt<1>, axi_bready : UInt<1>, axi_arvalid : UInt<1>, axi_arid : UInt<0>, axi_araddr : UInt<32>, axi_arsize : UInt<3>, axi_arprot : UInt<3>, axi_arlen : UInt<8>, axi_arburst : UInt<2>, axi_rready : UInt<1>, ahb_hrdata : UInt<64>, ahb_hreadyout : UInt<1>, ahb_hresp : UInt<1>}
    
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
    wire ahb_addr_in_iccm : UInt<1>
    ahb_addr_in_iccm <= UInt<1>("h00")
    wire ahb_addr_in_iccm_region_nc : UInt<1>
    ahb_addr_in_iccm_region_nc <= UInt<1>("h00")
    wire buf_rdata_en : UInt<1>
    buf_rdata_en <= UInt<1>("h00")
    wire ahb_bus_addr_clk_en : UInt<1>
    ahb_bus_addr_clk_en <= UInt<1>("h00")
    wire buf_rdata_clk_en : UInt<1>
    buf_rdata_clk_en <= UInt<1>("h00")
    wire ahb_clk : Clock @[ahb_to_axi4.scala 84:35]
    wire ahb_addr_clk : Clock @[ahb_to_axi4.scala 85:35]
    wire buf_rdata_clk : Clock @[ahb_to_axi4.scala 86:35]
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
    wire bus_clk : Clock @[ahb_to_axi4.scala 98:35]
    node _T = bits(ahb_haddr_q, 31, 28) @[el2_lib.scala 496:27]
    node ahb_addr_in_dccm_region_nc = eq(_T, UInt<4>("h0f")) @[el2_lib.scala 496:49]
    wire ahb_addr_in_dccm : UInt<1> @[el2_lib.scala 497:26]
    node _T_1 = bits(ahb_haddr_q, 31, 16) @[el2_lib.scala 501:24]
    node _T_2 = eq(_T_1, UInt<16>("h0f004")) @[el2_lib.scala 501:39]
    ahb_addr_in_dccm <= _T_2 @[el2_lib.scala 501:16]
    ahb_addr_in_iccm <= UInt<1>("h00") @[ahb_to_axi4.scala 109:24]
    ahb_addr_in_iccm_region_nc <= UInt<1>("h00") @[ahb_to_axi4.scala 110:34]
    node _T_3 = bits(ahb_haddr_q, 31, 28) @[el2_lib.scala 496:27]
    node ahb_addr_in_pic_region_nc = eq(_T_3, UInt<4>("h0f")) @[el2_lib.scala 496:49]
    wire ahb_addr_in_pic : UInt<1> @[el2_lib.scala 497:26]
    node _T_4 = bits(ahb_haddr_q, 31, 15) @[el2_lib.scala 501:24]
    node _T_5 = eq(_T_4, UInt<17>("h01e018")) @[el2_lib.scala 501:39]
    ahb_addr_in_pic <= _T_5 @[el2_lib.scala 501:16]
    wire buf_state : UInt<2>
    buf_state <= UInt<2>("h00")
    wire buf_nxtstate : UInt<2>
    buf_nxtstate <= UInt<2>("h00")
    buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 119:33]
    buf_state_en <= UInt<1>("h00") @[ahb_to_axi4.scala 120:33]
    buf_rdata_en <= UInt<1>("h00") @[ahb_to_axi4.scala 121:33]
    buf_read_error_in <= UInt<1>("h00") @[ahb_to_axi4.scala 122:33]
    cmdbuf_wr_en <= UInt<1>("h00") @[ahb_to_axi4.scala 123:33]
    node _T_6 = eq(UInt<2>("h00"), buf_state) @[Conditional.scala 37:30]
    when _T_6 : @[Conditional.scala 40:58]
      node _T_7 = mux(io.ahb_hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 127:28]
      buf_nxtstate <= _T_7 @[ahb_to_axi4.scala 127:22]
      node _T_8 = bits(io.ahb_htrans, 1, 1) @[ahb_to_axi4.scala 128:51]
      node _T_9 = and(ahb_hready, _T_8) @[ahb_to_axi4.scala 128:36]
      node _T_10 = and(_T_9, io.ahb_hsel) @[ahb_to_axi4.scala 128:55]
      buf_state_en <= _T_10 @[ahb_to_axi4.scala 128:22]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_11 = eq(UInt<2>("h01"), buf_state) @[Conditional.scala 37:30]
      when _T_11 : @[Conditional.scala 39:67]
        node _T_12 = bits(io.ahb_htrans, 1, 0) @[ahb_to_axi4.scala 131:59]
        node _T_13 = eq(_T_12, UInt<1>("h00")) @[ahb_to_axi4.scala 131:66]
        node _T_14 = or(io.ahb_hresp, _T_13) @[ahb_to_axi4.scala 131:43]
        node _T_15 = eq(io.ahb_hsel, UInt<1>("h00")) @[ahb_to_axi4.scala 131:80]
        node _T_16 = or(_T_14, _T_15) @[ahb_to_axi4.scala 131:78]
        node _T_17 = bits(_T_16, 0, 0) @[ahb_to_axi4.scala 131:94]
        node _T_18 = mux(io.ahb_hwrite, UInt<2>("h01"), UInt<2>("h02")) @[ahb_to_axi4.scala 131:111]
        node _T_19 = mux(_T_17, UInt<2>("h00"), _T_18) @[ahb_to_axi4.scala 131:28]
        buf_nxtstate <= _T_19 @[ahb_to_axi4.scala 131:22]
        node _T_20 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 132:26]
        node _T_21 = or(_T_20, io.ahb_hresp) @[ahb_to_axi4.scala 132:39]
        buf_state_en <= _T_21 @[ahb_to_axi4.scala 132:22]
        node _T_22 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 133:25]
        node _T_23 = bits(io.ahb_htrans, 1, 0) @[ahb_to_axi4.scala 133:72]
        node _T_24 = eq(_T_23, UInt<1>("h01")) @[ahb_to_axi4.scala 133:79]
        node _T_25 = and(_T_24, io.ahb_hsel) @[ahb_to_axi4.scala 133:92]
        node _T_26 = or(io.ahb_hresp, _T_25) @[ahb_to_axi4.scala 133:55]
        node _T_27 = eq(_T_26, UInt<1>("h00")) @[ahb_to_axi4.scala 133:40]
        node _T_28 = and(_T_22, _T_27) @[ahb_to_axi4.scala 133:38]
        cmdbuf_wr_en <= _T_28 @[ahb_to_axi4.scala 133:22]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_29 = eq(UInt<2>("h02"), buf_state) @[Conditional.scala 37:30]
        when _T_29 : @[Conditional.scala 39:67]
          node _T_30 = mux(io.ahb_hresp, UInt<2>("h00"), UInt<2>("h03")) @[ahb_to_axi4.scala 136:28]
          buf_nxtstate <= _T_30 @[ahb_to_axi4.scala 136:22]
          node _T_31 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 137:26]
          node _T_32 = or(_T_31, io.ahb_hresp) @[ahb_to_axi4.scala 137:39]
          buf_state_en <= _T_32 @[ahb_to_axi4.scala 137:22]
          node _T_33 = eq(io.ahb_hresp, UInt<1>("h00")) @[ahb_to_axi4.scala 138:25]
          node _T_34 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 138:41]
          node _T_35 = and(_T_33, _T_34) @[ahb_to_axi4.scala 138:39]
          cmdbuf_wr_en <= _T_35 @[ahb_to_axi4.scala 138:22]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_36 = eq(UInt<2>("h03"), buf_state) @[Conditional.scala 37:30]
          when _T_36 : @[Conditional.scala 39:67]
            buf_nxtstate <= UInt<2>("h00") @[ahb_to_axi4.scala 141:22]
            node _T_37 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 142:41]
            node _T_38 = and(io.axi_rvalid, _T_37) @[ahb_to_axi4.scala 142:39]
            buf_state_en <= _T_38 @[ahb_to_axi4.scala 142:22]
            buf_rdata_en <= buf_state_en @[ahb_to_axi4.scala 143:22]
            node _T_39 = bits(io.axi_rresp, 1, 0) @[ahb_to_axi4.scala 144:57]
            node _T_40 = orr(_T_39) @[ahb_to_axi4.scala 144:64]
            node _T_41 = and(buf_state_en, _T_40) @[ahb_to_axi4.scala 144:43]
            buf_read_error_in <= _T_41 @[ahb_to_axi4.scala 144:27]
            skip @[Conditional.scala 39:67]
    node _T_42 = bits(buf_state_en, 0, 0) @[ahb_to_axi4.scala 147:101]
    reg _T_43 : UInt, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_42 : @[Reg.scala 28:19]
      _T_43 <= buf_nxtstate @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    buf_state <= _T_43 @[ahb_to_axi4.scala 147:33]
    node _T_44 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 149:56]
    node _T_45 = eq(_T_44, UInt<1>("h00")) @[ahb_to_axi4.scala 149:62]
    node _T_46 = bits(_T_45, 0, 0) @[Bitwise.scala 72:15]
    node _T_47 = mux(_T_46, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_48 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 149:94]
    node _T_49 = dshl(UInt<1>("h01"), _T_48) @[ahb_to_axi4.scala 149:80]
    node _T_50 = and(_T_47, _T_49) @[ahb_to_axi4.scala 149:72]
    node _T_51 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 150:56]
    node _T_52 = eq(_T_51, UInt<1>("h01")) @[ahb_to_axi4.scala 150:62]
    node _T_53 = bits(_T_52, 0, 0) @[Bitwise.scala 72:15]
    node _T_54 = mux(_T_53, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_55 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 150:94]
    node _T_56 = dshl(UInt<2>("h03"), _T_55) @[ahb_to_axi4.scala 150:80]
    node _T_57 = and(_T_54, _T_56) @[ahb_to_axi4.scala 150:72]
    node _T_58 = or(_T_50, _T_57) @[ahb_to_axi4.scala 149:111]
    node _T_59 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 151:56]
    node _T_60 = eq(_T_59, UInt<2>("h02")) @[ahb_to_axi4.scala 151:62]
    node _T_61 = bits(_T_60, 0, 0) @[Bitwise.scala 72:15]
    node _T_62 = mux(_T_61, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_63 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 151:94]
    node _T_64 = dshl(UInt<4>("h0f"), _T_63) @[ahb_to_axi4.scala 151:80]
    node _T_65 = and(_T_62, _T_64) @[ahb_to_axi4.scala 151:72]
    node _T_66 = or(_T_58, _T_65) @[ahb_to_axi4.scala 150:111]
    node _T_67 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 152:56]
    node _T_68 = eq(_T_67, UInt<2>("h03")) @[ahb_to_axi4.scala 152:62]
    node _T_69 = bits(_T_68, 0, 0) @[Bitwise.scala 72:15]
    node _T_70 = mux(_T_69, UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    node _T_71 = and(_T_70, UInt<8>("h0ff")) @[ahb_to_axi4.scala 152:72]
    node _T_72 = or(_T_66, _T_71) @[ahb_to_axi4.scala 151:111]
    master_wstrb <= _T_72 @[ahb_to_axi4.scala 149:33]
    node _T_73 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 155:68]
    node _T_74 = and(ahb_hresp_q, _T_73) @[ahb_to_axi4.scala 155:66]
    node _T_75 = eq(cmdbuf_full, UInt<1>("h00")) @[ahb_to_axi4.scala 155:86]
    node _T_76 = eq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 155:112]
    node _T_77 = or(_T_75, _T_76) @[ahb_to_axi4.scala 155:99]
    node _T_78 = eq(buf_state, UInt<2>("h02")) @[ahb_to_axi4.scala 155:137]
    node _T_79 = eq(buf_state, UInt<2>("h03")) @[ahb_to_axi4.scala 155:156]
    node _T_80 = or(_T_78, _T_79) @[ahb_to_axi4.scala 155:144]
    node _T_81 = eq(_T_80, UInt<1>("h00")) @[ahb_to_axi4.scala 155:125]
    node _T_82 = and(_T_77, _T_81) @[ahb_to_axi4.scala 155:123]
    node _T_83 = eq(buf_read_error, UInt<1>("h00")) @[ahb_to_axi4.scala 155:169]
    node _T_84 = and(_T_82, _T_83) @[ahb_to_axi4.scala 155:167]
    node _T_85 = mux(io.ahb_hresp, _T_74, _T_84) @[ahb_to_axi4.scala 155:39]
    io.ahb_hreadyout <= _T_85 @[ahb_to_axi4.scala 155:33]
    node _T_86 = and(io.ahb_hreadyout, io.ahb_hreadyin) @[ahb_to_axi4.scala 156:53]
    ahb_hready <= _T_86 @[ahb_to_axi4.scala 156:33]
    node _T_87 = bits(io.ahb_hsel, 0, 0) @[Bitwise.scala 72:15]
    node _T_88 = mux(_T_87, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_89 = bits(io.ahb_htrans, 1, 0) @[ahb_to_axi4.scala 157:71]
    node _T_90 = and(_T_88, _T_89) @[ahb_to_axi4.scala 157:56]
    ahb_htrans_in <= _T_90 @[ahb_to_axi4.scala 157:33]
    node _T_91 = bits(buf_rdata, 63, 0) @[ahb_to_axi4.scala 158:45]
    io.ahb_hrdata <= _T_91 @[ahb_to_axi4.scala 158:33]
    node _T_92 = bits(ahb_htrans_q, 1, 0) @[ahb_to_axi4.scala 159:50]
    node _T_93 = neq(_T_92, UInt<1>("h00")) @[ahb_to_axi4.scala 159:56]
    node _T_94 = neq(buf_state, UInt<2>("h00")) @[ahb_to_axi4.scala 159:78]
    node _T_95 = and(_T_93, _T_94) @[ahb_to_axi4.scala 159:65]
    node _T_96 = or(ahb_addr_in_dccm, ahb_addr_in_iccm) @[ahb_to_axi4.scala 160:57]
    node _T_97 = eq(_T_96, UInt<1>("h00")) @[ahb_to_axi4.scala 160:38]
    node _T_98 = and(ahb_addr_in_dccm, ahb_hwrite_q) @[ahb_to_axi4.scala 161:75]
    node _T_99 = or(ahb_addr_in_iccm, _T_98) @[ahb_to_axi4.scala 161:55]
    node _T_100 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 161:109]
    node _T_101 = eq(_T_100, UInt<2>("h02")) @[ahb_to_axi4.scala 161:115]
    node _T_102 = bits(ahb_hsize_q, 1, 0) @[ahb_to_axi4.scala 161:138]
    node _T_103 = eq(_T_102, UInt<2>("h03")) @[ahb_to_axi4.scala 161:144]
    node _T_104 = or(_T_101, _T_103) @[ahb_to_axi4.scala 161:124]
    node _T_105 = eq(_T_104, UInt<1>("h00")) @[ahb_to_axi4.scala 161:95]
    node _T_106 = and(_T_99, _T_105) @[ahb_to_axi4.scala 161:93]
    node _T_107 = or(_T_97, _T_106) @[ahb_to_axi4.scala 160:78]
    node _T_108 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 162:49]
    node _T_109 = eq(_T_108, UInt<1>("h01")) @[ahb_to_axi4.scala 162:55]
    node _T_110 = bits(ahb_haddr_q, 0, 0) @[ahb_to_axi4.scala 162:77]
    node _T_111 = and(_T_109, _T_110) @[ahb_to_axi4.scala 162:64]
    node _T_112 = or(_T_107, _T_111) @[ahb_to_axi4.scala 161:155]
    node _T_113 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 163:49]
    node _T_114 = eq(_T_113, UInt<2>("h02")) @[ahb_to_axi4.scala 163:55]
    node _T_115 = bits(ahb_haddr_q, 1, 0) @[ahb_to_axi4.scala 163:78]
    node _T_116 = orr(_T_115) @[ahb_to_axi4.scala 163:85]
    node _T_117 = and(_T_114, _T_116) @[ahb_to_axi4.scala 163:64]
    node _T_118 = or(_T_112, _T_117) @[ahb_to_axi4.scala 162:84]
    node _T_119 = bits(ahb_hsize_q, 2, 0) @[ahb_to_axi4.scala 164:49]
    node _T_120 = eq(_T_119, UInt<2>("h03")) @[ahb_to_axi4.scala 164:55]
    node _T_121 = bits(ahb_haddr_q, 2, 0) @[ahb_to_axi4.scala 164:78]
    node _T_122 = orr(_T_121) @[ahb_to_axi4.scala 164:85]
    node _T_123 = and(_T_120, _T_122) @[ahb_to_axi4.scala 164:64]
    node _T_124 = or(_T_118, _T_123) @[ahb_to_axi4.scala 163:90]
    node _T_125 = and(_T_95, _T_124) @[ahb_to_axi4.scala 159:89]
    node _T_126 = or(_T_125, buf_read_error) @[ahb_to_axi4.scala 164:92]
    node _T_127 = eq(ahb_hready_q, UInt<1>("h00")) @[ahb_to_axi4.scala 166:51]
    node _T_128 = and(ahb_hresp_q, _T_127) @[ahb_to_axi4.scala 166:49]
    node _T_129 = or(_T_126, _T_128) @[ahb_to_axi4.scala 165:51]
    io.ahb_hresp <= _T_129 @[ahb_to_axi4.scala 159:33]
    reg _T_130 : UInt, buf_rdata_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 169:68]
    _T_130 <= io.axi_rdata @[ahb_to_axi4.scala 169:68]
    buf_rdata <= _T_130 @[ahb_to_axi4.scala 169:33]
    reg _T_131 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 170:62]
    _T_131 <= buf_read_error_in @[ahb_to_axi4.scala 170:62]
    buf_read_error <= _T_131 @[ahb_to_axi4.scala 170:33]
    reg _T_132 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 173:62]
    _T_132 <= io.ahb_hresp @[ahb_to_axi4.scala 173:62]
    ahb_hresp_q <= _T_132 @[ahb_to_axi4.scala 173:33]
    reg _T_133 : UInt<1>, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 174:62]
    _T_133 <= ahb_hready @[ahb_to_axi4.scala 174:62]
    ahb_hready_q <= _T_133 @[ahb_to_axi4.scala 174:33]
    reg _T_134 : UInt, ahb_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 175:62]
    _T_134 <= ahb_htrans_in @[ahb_to_axi4.scala 175:62]
    ahb_htrans_q <= _T_134 @[ahb_to_axi4.scala 175:33]
    reg _T_135 : UInt, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 176:67]
    _T_135 <= io.ahb_hsize @[ahb_to_axi4.scala 176:67]
    ahb_hsize_q <= _T_135 @[ahb_to_axi4.scala 176:33]
    reg _T_136 : UInt<1>, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 177:67]
    _T_136 <= io.ahb_hwrite @[ahb_to_axi4.scala 177:67]
    ahb_hwrite_q <= _T_136 @[ahb_to_axi4.scala 177:33]
    reg _T_137 : UInt, ahb_addr_clk with : (reset => (reset, UInt<1>("h00"))) @[ahb_to_axi4.scala 178:67]
    _T_137 <= io.ahb_haddr @[ahb_to_axi4.scala 178:67]
    ahb_haddr_q <= _T_137 @[ahb_to_axi4.scala 178:33]
    node _T_138 = bits(io.ahb_htrans, 1, 1) @[ahb_to_axi4.scala 181:79]
    node _T_139 = and(ahb_hready, _T_138) @[ahb_to_axi4.scala 181:64]
    node _T_140 = and(io.bus_clk_en, _T_139) @[ahb_to_axi4.scala 181:50]
    ahb_bus_addr_clk_en <= _T_140 @[ahb_to_axi4.scala 181:33]
    node _T_141 = and(io.bus_clk_en, buf_rdata_en) @[ahb_to_axi4.scala 182:50]
    buf_rdata_clk_en <= _T_141 @[ahb_to_axi4.scala 182:33]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahb_clk <= rvclkhdr.io.l1clk @[ahb_to_axi4.scala 184:33]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= ahb_bus_addr_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    ahb_addr_clk <= rvclkhdr_1.io.l1clk @[ahb_to_axi4.scala 185:33]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 483:22]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_2.io.en <= buf_rdata_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    buf_rdata_clk <= rvclkhdr_2.io.l1clk @[ahb_to_axi4.scala 186:33]
    node _T_142 = and(io.axi_awvalid, io.axi_awready) @[ahb_to_axi4.scala 188:54]
    node _T_143 = and(io.axi_arvalid, io.axi_arready) @[ahb_to_axi4.scala 188:90]
    node _T_144 = or(_T_142, _T_143) @[ahb_to_axi4.scala 188:72]
    node _T_145 = eq(cmdbuf_wr_en, UInt<1>("h00")) @[ahb_to_axi4.scala 188:111]
    node _T_146 = and(_T_144, _T_145) @[ahb_to_axi4.scala 188:109]
    node _T_147 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 188:144]
    node _T_148 = and(io.ahb_hresp, _T_147) @[ahb_to_axi4.scala 188:142]
    node _T_149 = or(_T_146, _T_148) @[ahb_to_axi4.scala 188:126]
    cmdbuf_rst <= _T_149 @[ahb_to_axi4.scala 188:33]
    node _T_150 = and(io.axi_awvalid, io.axi_awready) @[ahb_to_axi4.scala 189:68]
    node _T_151 = and(io.axi_arvalid, io.axi_arready) @[ahb_to_axi4.scala 189:104]
    node _T_152 = or(_T_150, _T_151) @[ahb_to_axi4.scala 189:86]
    node _T_153 = eq(_T_152, UInt<1>("h00")) @[ahb_to_axi4.scala 189:50]
    node _T_154 = and(cmdbuf_vld, _T_153) @[ahb_to_axi4.scala 189:48]
    cmdbuf_full <= _T_154 @[ahb_to_axi4.scala 189:33]
    node _T_155 = and(UInt<1>("h01"), cmdbuf_rst) @[ahb_to_axi4.scala 193:26]
    node _T_156 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 193:87]
    reg _T_157 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_156 : @[Reg.scala 28:19]
      _T_157 <= _T_155 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_vld <= _T_157 @[ahb_to_axi4.scala 192:33]
    node _T_158 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 197:57]
    reg _T_159 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_158 : @[Reg.scala 28:19]
      _T_159 <= ahb_hwrite_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_write <= _T_159 @[ahb_to_axi4.scala 196:33]
    node _T_160 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 200:56]
    reg _T_161 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_160 : @[Reg.scala 28:19]
      _T_161 <= ahb_hsize_q @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_size <= _T_161 @[ahb_to_axi4.scala 199:33]
    node _T_162 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 203:57]
    reg _T_163 : UInt, bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_162 : @[Reg.scala 28:19]
      _T_163 <= master_wstrb @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    cmdbuf_wstrb <= _T_163 @[ahb_to_axi4.scala 202:33]
    node _T_164 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 206:59]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_164 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_165 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_165 <= ahb_haddr_q @[el2_lib.scala 514:16]
    cmdbuf_addr <= _T_165 @[ahb_to_axi4.scala 206:17]
    node _T_166 = bits(cmdbuf_wr_en, 0, 0) @[ahb_to_axi4.scala 207:62]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= bus_clk @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_166 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_167 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_167 <= io.ahb_hwdata @[el2_lib.scala 514:16]
    cmdbuf_wdata <= _T_167 @[ahb_to_axi4.scala 207:18]
    node _T_168 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 210:43]
    io.axi_awvalid <= _T_168 @[ahb_to_axi4.scala 210:29]
    io.axi_awid <= UInt<1>("h00") @[ahb_to_axi4.scala 211:29]
    io.axi_awaddr <= cmdbuf_addr @[ahb_to_axi4.scala 212:29]
    node _T_169 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 213:55]
    node _T_170 = cat(UInt<1>("h00"), _T_169) @[Cat.scala 29:58]
    io.axi_awsize <= _T_170 @[ahb_to_axi4.scala 213:29]
    node _T_171 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi_awprot <= _T_171 @[ahb_to_axi4.scala 214:29]
    node _T_172 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi_awlen <= _T_172 @[ahb_to_axi4.scala 215:29]
    io.axi_awburst <= UInt<1>("h01") @[ahb_to_axi4.scala 216:29]
    node _T_173 = and(cmdbuf_vld, cmdbuf_write) @[ahb_to_axi4.scala 218:43]
    io.axi_wvalid <= _T_173 @[ahb_to_axi4.scala 218:29]
    io.axi_wdata <= cmdbuf_wdata @[ahb_to_axi4.scala 219:29]
    io.axi_wstrb <= cmdbuf_wstrb @[ahb_to_axi4.scala 220:29]
    io.axi_wlast <= UInt<1>("h01") @[ahb_to_axi4.scala 221:29]
    io.axi_bready <= UInt<1>("h01") @[ahb_to_axi4.scala 223:29]
    node _T_174 = eq(cmdbuf_write, UInt<1>("h00")) @[ahb_to_axi4.scala 225:45]
    node _T_175 = and(cmdbuf_vld, _T_174) @[ahb_to_axi4.scala 225:43]
    io.axi_arvalid <= _T_175 @[ahb_to_axi4.scala 225:29]
    io.axi_arid <= UInt<1>("h00") @[ahb_to_axi4.scala 226:29]
    io.axi_araddr <= cmdbuf_addr @[ahb_to_axi4.scala 227:29]
    node _T_176 = bits(cmdbuf_size, 1, 0) @[ahb_to_axi4.scala 228:55]
    node _T_177 = cat(UInt<1>("h00"), _T_176) @[Cat.scala 29:58]
    io.axi_arsize <= _T_177 @[ahb_to_axi4.scala 228:29]
    node _T_178 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    io.axi_arprot <= _T_178 @[ahb_to_axi4.scala 229:29]
    node _T_179 = mux(UInt<1>("h00"), UInt<8>("h0ff"), UInt<8>("h00")) @[Bitwise.scala 72:12]
    io.axi_arlen <= _T_179 @[ahb_to_axi4.scala 230:29]
    io.axi_arburst <= UInt<1>("h01") @[ahb_to_axi4.scala 231:29]
    io.axi_rready <= UInt<1>("h01") @[ahb_to_axi4.scala 233:29]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 483:22]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_5.io.en <= io.bus_clk_en @[el2_lib.scala 485:16]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    bus_clk <= rvclkhdr_5.io.l1clk @[ahb_to_axi4.scala 236:29]
    
