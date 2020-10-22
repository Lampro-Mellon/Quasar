;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_pic_ctrl : 
  extmodule TEC_RV_ICG : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG @[beh_lib.scala 331:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 332:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 333:16]
    clkhdr.EN <= io.en @[beh_lib.scala 334:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 335:16]
    
  extmodule TEC_RV_ICG_1 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_1 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_1 @[beh_lib.scala 331:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 332:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 333:16]
    clkhdr.EN <= io.en @[beh_lib.scala 334:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 335:16]
    
  extmodule TEC_RV_ICG_2 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_2 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_2 @[beh_lib.scala 331:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 332:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 333:16]
    clkhdr.EN <= io.en @[beh_lib.scala 334:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 335:16]
    
  extmodule TEC_RV_ICG_3 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_3 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_3 @[beh_lib.scala 331:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 332:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 333:16]
    clkhdr.EN <= io.en @[beh_lib.scala 334:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 335:16]
    
  extmodule TEC_RV_ICG_4 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_4 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_4 @[beh_lib.scala 331:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 332:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 333:16]
    clkhdr.EN <= io.en @[beh_lib.scala 334:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 335:16]
    
  module rvsyncss : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<31>, dout : UInt<31>, flip clk : Clock}
    
    reg sync_ff1 : UInt, io.clk with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 32:43]
    sync_ff1 <= io.din @[beh_lib.scala 32:43]
    reg sync_ff2 : UInt, io.clk with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 33:43]
    sync_ff2 <= sync_ff1 @[beh_lib.scala 33:43]
    io.dout <= sync_ff2 @[beh_lib.scala 37:12]
    
  module el2_pic_ctrl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip free_clk : Clock, flip active_clk : Clock, flip clk_override : UInt<1>, flip extintsrc_req : UInt<32>, flip picm_rdaddr : UInt<32>, flip picm_wraddr : UInt<32>, flip picm_wr_data : UInt<32>, flip picm_wren : UInt<1>, flip picm_rden : UInt<1>, flip picm_mken : UInt<1>, flip meicurpl : UInt<4>, flip meipt : UInt<4>, mexintpend : UInt<1>, claimid : UInt<8>, pl : UInt<4>, picm_rd_data : UInt<32>, mhwakeup : UInt<1>, test : UInt}
    
    io.mexintpend <= UInt<1>("h00") @[el2_pic_ctrl.scala 31:20]
    io.claimid <= UInt<1>("h00") @[el2_pic_ctrl.scala 32:20]
    io.pl <= UInt<1>("h00") @[el2_pic_ctrl.scala 33:20]
    io.picm_rd_data <= UInt<1>("h00") @[el2_pic_ctrl.scala 34:20]
    io.mhwakeup <= UInt<1>("h00") @[el2_pic_ctrl.scala 35:20]
    wire GW_CONFIG : UInt<32>
    GW_CONFIG <= UInt<1>("h00")
    wire picm_rd_data_in : UInt<32>
    picm_rd_data_in <= UInt<32>("h00")
    wire intpend_rd_out : UInt<32>
    intpend_rd_out <= UInt<32>("h00")
    wire intenable_rd_out : UInt<1>
    intenable_rd_out <= UInt<1>("h00")
    wire intpriority_rd_out : UInt<4>
    intpriority_rd_out <= UInt<4>("h00")
    wire gw_config_rd_out : UInt<2>
    gw_config_rd_out <= UInt<2>("h00")
    wire intpriority_reg_we : UInt<32>
    intpriority_reg_we <= UInt<32>("h00")
    wire intpriority_reg_re : UInt<32>
    intpriority_reg_re <= UInt<32>("h00")
    wire intenable_reg : UInt<32>
    intenable_reg <= UInt<32>("h00")
    wire intenable_reg_we : UInt<32>
    intenable_reg_we <= UInt<32>("h00")
    wire intenable_reg_re : UInt<32>
    intenable_reg_re <= UInt<32>("h00")
    wire gw_config_reg_we : UInt<32>
    gw_config_reg_we <= UInt<32>("h00")
    wire gw_config_reg_re : UInt<32>
    gw_config_reg_re <= UInt<32>("h00")
    wire gw_clear_reg_we : UInt<32>
    gw_clear_reg_we <= UInt<32>("h00")
    wire intpend_reg_extended : UInt<64>
    intpend_reg_extended <= UInt<64>("h00")
    wire selected_int_priority : UInt<4>
    selected_int_priority <= UInt<4>("h00")
    wire config_reg : UInt<1>
    config_reg <= UInt<1>("h00")
    wire prithresh_reg_write : UInt<1>
    prithresh_reg_write <= UInt<1>("h00")
    wire prithresh_reg_read : UInt<1>
    prithresh_reg_read <= UInt<1>("h00")
    wire picm_wren_ff : UInt<1>
    picm_wren_ff <= UInt<1>("h00")
    wire picm_rden_ff : UInt<1>
    picm_rden_ff <= UInt<1>("h00")
    wire picm_raddr_ff : UInt<32>
    picm_raddr_ff <= UInt<32>("h00")
    wire picm_waddr_ff : UInt<32>
    picm_waddr_ff <= UInt<32>("h00")
    wire picm_wr_data_ff : UInt<32>
    picm_wr_data_ff <= UInt<32>("h00")
    wire mask : UInt<4>
    mask <= UInt<4>("h00")
    wire picm_mken_ff : UInt<1>
    picm_mken_ff <= UInt<1>("h00")
    wire claimid_in : UInt<8>
    claimid_in <= UInt<8>("h00")
    wire pl_in : UInt<4>
    pl_in <= UInt<4>("h00")
    wire extintsrc_req_sync : UInt<32>
    extintsrc_req_sync <= UInt<32>("h00")
    wire extintsrc_req_gw : UInt<32>
    extintsrc_req_gw <= UInt<32>("h00")
    wire pic_raddr_c1_clk : Clock @[el2_pic_ctrl.scala 127:42]
    wire pic_data_c1_clk : Clock @[el2_pic_ctrl.scala 128:42]
    wire pic_pri_c1_clk : Clock @[el2_pic_ctrl.scala 129:42]
    wire pic_int_c1_clk : Clock @[el2_pic_ctrl.scala 130:42]
    wire gw_config_c1_clk : Clock @[el2_pic_ctrl.scala 131:42]
    reg _T : UInt, pic_raddr_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 133:56]
    _T <= io.picm_rdaddr @[el2_pic_ctrl.scala 133:56]
    picm_raddr_ff <= _T @[el2_pic_ctrl.scala 133:46]
    reg _T_1 : UInt, pic_data_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 134:57]
    _T_1 <= io.picm_wraddr @[el2_pic_ctrl.scala 134:57]
    picm_waddr_ff <= _T_1 @[el2_pic_ctrl.scala 134:46]
    reg _T_2 : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 135:55]
    _T_2 <= io.picm_wren @[el2_pic_ctrl.scala 135:55]
    picm_wren_ff <= _T_2 @[el2_pic_ctrl.scala 135:45]
    reg _T_3 : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 136:55]
    _T_3 <= io.picm_rden @[el2_pic_ctrl.scala 136:55]
    picm_rden_ff <= _T_3 @[el2_pic_ctrl.scala 136:45]
    reg _T_4 : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 137:55]
    _T_4 <= io.picm_mken @[el2_pic_ctrl.scala 137:55]
    picm_mken_ff <= _T_4 @[el2_pic_ctrl.scala 137:45]
    reg _T_5 : UInt, pic_data_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 138:58]
    _T_5 <= io.picm_wr_data @[el2_pic_ctrl.scala 138:58]
    picm_wr_data_ff <= _T_5 @[el2_pic_ctrl.scala 138:48]
    node _T_6 = bits(picm_raddr_ff, 31, 7) @[el2_pic_ctrl.scala 140:53]
    node raddr_intenable_base_match = eq(_T_6, UInt<25>("h01e01840")) @[el2_pic_ctrl.scala 140:71]
    node _T_7 = bits(picm_raddr_ff, 31, 7) @[el2_pic_ctrl.scala 141:53]
    node raddr_intpriority_base_match = eq(_T_7, UInt<25>("h01e01800")) @[el2_pic_ctrl.scala 141:71]
    node _T_8 = bits(picm_raddr_ff, 31, 7) @[el2_pic_ctrl.scala 142:53]
    node raddr_config_gw_base_match = eq(_T_8, UInt<25>("h01e01880")) @[el2_pic_ctrl.scala 142:71]
    node _T_9 = bits(picm_raddr_ff, 31, 0) @[el2_pic_ctrl.scala 143:53]
    node raddr_config_pic_match = eq(_T_9, UInt<32>("h0f00c3000")) @[el2_pic_ctrl.scala 143:71]
    node _T_10 = bits(picm_raddr_ff, 31, 6) @[el2_pic_ctrl.scala 144:53]
    node addr_intpend_base_match = eq(_T_10, UInt<26>("h03c03040")) @[el2_pic_ctrl.scala 144:71]
    node _T_11 = bits(picm_waddr_ff, 31, 0) @[el2_pic_ctrl.scala 146:53]
    node waddr_config_pic_match = eq(_T_11, UInt<32>("h0f00c3000")) @[el2_pic_ctrl.scala 146:71]
    node _T_12 = bits(picm_waddr_ff, 31, 7) @[el2_pic_ctrl.scala 147:53]
    node addr_clear_gw_base_match = eq(_T_12, UInt<25>("h01e018a0")) @[el2_pic_ctrl.scala 147:71]
    node _T_13 = bits(picm_waddr_ff, 31, 7) @[el2_pic_ctrl.scala 148:53]
    node waddr_intpriority_base_match = eq(_T_13, UInt<25>("h01e01800")) @[el2_pic_ctrl.scala 148:71]
    node _T_14 = bits(picm_waddr_ff, 31, 7) @[el2_pic_ctrl.scala 149:53]
    node waddr_intenable_base_match = eq(_T_14, UInt<25>("h01e01840")) @[el2_pic_ctrl.scala 149:71]
    node _T_15 = bits(picm_waddr_ff, 31, 7) @[el2_pic_ctrl.scala 150:53]
    node waddr_config_gw_base_match = eq(_T_15, UInt<25>("h01e01880")) @[el2_pic_ctrl.scala 150:71]
    node _T_16 = and(picm_rden_ff, picm_wren_ff) @[el2_pic_ctrl.scala 151:53]
    node _T_17 = eq(picm_raddr_ff, picm_waddr_ff) @[el2_pic_ctrl.scala 151:86]
    node picm_bypass_ff = and(_T_16, _T_17) @[el2_pic_ctrl.scala 151:68]
    node _T_18 = or(io.picm_mken, io.picm_rden) @[el2_pic_ctrl.scala 155:42]
    node pic_raddr_c1_clken = or(_T_18, io.clk_override) @[el2_pic_ctrl.scala 155:57]
    node pic_data_c1_clken = or(io.picm_wren, io.clk_override) @[el2_pic_ctrl.scala 156:42]
    node _T_19 = and(waddr_intpriority_base_match, picm_wren_ff) @[el2_pic_ctrl.scala 157:59]
    node _T_20 = and(raddr_intpriority_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 157:108]
    node _T_21 = or(_T_19, _T_20) @[el2_pic_ctrl.scala 157:76]
    node pic_pri_c1_clken = or(_T_21, io.clk_override) @[el2_pic_ctrl.scala 157:124]
    node _T_22 = and(waddr_intpriority_base_match, picm_wren_ff) @[el2_pic_ctrl.scala 158:59]
    node _T_23 = and(raddr_intenable_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 158:106]
    node _T_24 = or(_T_22, _T_23) @[el2_pic_ctrl.scala 158:76]
    node pic_int_c1_clken = or(_T_24, io.clk_override) @[el2_pic_ctrl.scala 158:122]
    node _T_25 = and(waddr_config_gw_base_match, picm_wren_ff) @[el2_pic_ctrl.scala 159:59]
    node _T_26 = and(raddr_config_gw_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 159:108]
    node _T_27 = or(_T_25, _T_26) @[el2_pic_ctrl.scala 159:76]
    node gw_config_c1_clken = or(_T_27, io.clk_override) @[el2_pic_ctrl.scala 159:124]
    inst pic_addr_c1_cgc of rvclkhdr @[el2_pic_ctrl.scala 162:32]
    pic_addr_c1_cgc.clock <= clock
    pic_addr_c1_cgc.reset <= reset
    pic_addr_c1_cgc.io.en <= pic_raddr_c1_clken @[el2_pic_ctrl.scala 163:34]
    pic_raddr_c1_clk <= pic_addr_c1_cgc.io.l1clk @[el2_pic_ctrl.scala 163:89]
    pic_addr_c1_cgc.io.clk <= clock @[el2_pic_ctrl.scala 164:34]
    pic_addr_c1_cgc.io.scan_mode <= io.scan_mode @[el2_pic_ctrl.scala 164:89]
    inst pic_data_c1_cgc of rvclkhdr_1 @[el2_pic_ctrl.scala 166:32]
    pic_data_c1_cgc.clock <= clock
    pic_data_c1_cgc.reset <= reset
    pic_data_c1_cgc.io.en <= pic_data_c1_clken @[el2_pic_ctrl.scala 167:34]
    pic_data_c1_clk <= pic_data_c1_cgc.io.l1clk @[el2_pic_ctrl.scala 167:89]
    pic_data_c1_cgc.io.clk <= clock @[el2_pic_ctrl.scala 168:34]
    pic_data_c1_cgc.io.scan_mode <= io.scan_mode @[el2_pic_ctrl.scala 168:89]
    inst pic_pri_c1_cgc of rvclkhdr_2 @[el2_pic_ctrl.scala 170:31]
    pic_pri_c1_cgc.clock <= clock
    pic_pri_c1_cgc.reset <= reset
    pic_pri_c1_cgc.io.en <= pic_pri_c1_clken @[el2_pic_ctrl.scala 171:33]
    pic_pri_c1_clk <= pic_pri_c1_cgc.io.l1clk @[el2_pic_ctrl.scala 171:87]
    pic_pri_c1_cgc.io.clk <= clock @[el2_pic_ctrl.scala 172:33]
    pic_pri_c1_cgc.io.scan_mode <= io.scan_mode @[el2_pic_ctrl.scala 172:87]
    inst pic_int_c1_cgc of rvclkhdr_3 @[el2_pic_ctrl.scala 174:32]
    pic_int_c1_cgc.clock <= clock
    pic_int_c1_cgc.reset <= reset
    pic_int_c1_cgc.io.en <= pic_int_c1_clken @[el2_pic_ctrl.scala 175:33]
    pic_int_c1_clk <= pic_int_c1_cgc.io.l1clk @[el2_pic_ctrl.scala 175:87]
    pic_int_c1_cgc.io.clk <= clock @[el2_pic_ctrl.scala 176:33]
    pic_int_c1_cgc.io.scan_mode <= io.scan_mode @[el2_pic_ctrl.scala 176:87]
    inst gw_config_c1_cgc of rvclkhdr_4 @[el2_pic_ctrl.scala 178:33]
    gw_config_c1_cgc.clock <= clock
    gw_config_c1_cgc.reset <= reset
    gw_config_c1_cgc.io.en <= gw_config_c1_clken @[el2_pic_ctrl.scala 179:35]
    gw_config_c1_clk <= gw_config_c1_cgc.io.l1clk @[el2_pic_ctrl.scala 179:90]
    gw_config_c1_cgc.io.clk <= clock @[el2_pic_ctrl.scala 180:35]
    gw_config_c1_cgc.io.scan_mode <= io.scan_mode @[el2_pic_ctrl.scala 180:91]
    inst sync_inst of rvsyncss @[el2_pic_ctrl.scala 185:26]
    sync_inst.clock <= clock
    sync_inst.reset <= reset
    node _T_28 = shr(io.extintsrc_req, 1) @[el2_pic_ctrl.scala 186:48]
    sync_inst.io.din <= _T_28 @[el2_pic_ctrl.scala 186:29]
    node _T_29 = bits(io.extintsrc_req, 0, 0) @[el2_pic_ctrl.scala 187:71]
    node _T_30 = cat(sync_inst.io.dout, _T_29) @[Cat.scala 29:58]
    extintsrc_req_sync <= _T_30 @[el2_pic_ctrl.scala 187:29]
    sync_inst.io.clk <= io.free_clk @[el2_pic_ctrl.scala 188:29]
    io.test <= extintsrc_req_sync @[el2_pic_ctrl.scala 190:11]
    node config_reg_we = and(waddr_config_pic_match, picm_wren_ff) @[el2_pic_ctrl.scala 195:47]
    node config_reg_re = and(raddr_config_pic_match, picm_rden_ff) @[el2_pic_ctrl.scala 196:47]
    node config_reg_in = bits(picm_wr_data_ff, 0, 0) @[el2_pic_ctrl.scala 197:39]
    node _T_31 = bits(config_reg_we, 0, 0) @[el2_pic_ctrl.scala 198:82]
    reg _T_32 : UInt, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_31 : @[Reg.scala 28:19]
      _T_32 <= config_reg_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    config_reg <= _T_32 @[el2_pic_ctrl.scala 198:37]
    node _T_33 = bits(config_reg, 0, 0) @[el2_pic_ctrl.scala 204:31]
    node _T_34 = not(pl_in) @[el2_pic_ctrl.scala 204:38]
    node pl_in_q = mux(_T_33, _T_34, pl_in) @[el2_pic_ctrl.scala 204:20]
    reg _T_35 : UInt, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 205:47]
    _T_35 <= claimid_in @[el2_pic_ctrl.scala 205:47]
    io.claimid <= _T_35 @[el2_pic_ctrl.scala 205:37]
    reg _T_36 : UInt, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 206:42]
    _T_36 <= pl_in_q @[el2_pic_ctrl.scala 206:42]
    io.pl <= _T_36 @[el2_pic_ctrl.scala 206:32]
    node _T_37 = bits(config_reg, 0, 0) @[el2_pic_ctrl.scala 207:33]
    node _T_38 = eq(io.meipt, UInt<1>("h00")) @[el2_pic_ctrl.scala 207:40]
    node meipt_inv = mux(_T_37, _T_38, io.meipt) @[el2_pic_ctrl.scala 207:22]
    node _T_39 = bits(config_reg, 0, 0) @[el2_pic_ctrl.scala 208:36]
    node _T_40 = eq(io.meicurpl, UInt<1>("h00")) @[el2_pic_ctrl.scala 208:43]
    node meicurpl_inv = mux(_T_39, _T_40, io.meicurpl) @[el2_pic_ctrl.scala 208:25]
    node _T_41 = gt(selected_int_priority, meipt_inv) @[el2_pic_ctrl.scala 209:47]
    node _T_42 = gt(selected_int_priority, meicurpl_inv) @[el2_pic_ctrl.scala 209:86]
    node mexintpend_in = and(_T_41, _T_42) @[el2_pic_ctrl.scala 209:60]
    reg _T_43 : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 210:50]
    _T_43 <= mexintpend_in @[el2_pic_ctrl.scala 210:50]
    io.mexintpend <= _T_43 @[el2_pic_ctrl.scala 210:40]
    node _T_44 = bits(config_reg, 0, 0) @[el2_pic_ctrl.scala 211:30]
    node maxint = mux(_T_44, UInt<1>("h00"), UInt<4>("h0f")) @[el2_pic_ctrl.scala 211:19]
    node mhwakeup_in = eq(pl_in_q, maxint) @[el2_pic_ctrl.scala 212:29]
    reg _T_45 : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_pic_ctrl.scala 213:48]
    _T_45 <= mhwakeup_in @[el2_pic_ctrl.scala 213:48]
    io.mhwakeup <= _T_45 @[el2_pic_ctrl.scala 213:38]
    node intpend_reg_read = and(addr_intpend_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 219:60]
    node intpriority_reg_read = and(raddr_intpriority_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 220:60]
    node intenable_reg_read = and(raddr_intenable_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 221:60]
    node gw_config_reg_read = and(raddr_config_gw_base_match, picm_rden_ff) @[el2_pic_ctrl.scala 222:60]
    node _T_46 = bits(picm_raddr_ff, 5, 2) @[el2_pic_ctrl.scala 227:98]
    node _T_47 = eq(_T_46, UInt<1>("h00")) @[el2_pic_ctrl.scala 227:104]
    node _T_48 = and(intpend_reg_read, _T_47) @[el2_pic_ctrl.scala 227:83]
    node _T_49 = bits(_T_48, 0, 0) @[Bitwise.scala 72:15]
    node _T_50 = mux(_T_49, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_51 = bits(intpend_reg_extended, 31, 0) @[el2_pic_ctrl.scala 227:140]
    node _T_52 = and(_T_50, _T_51) @[el2_pic_ctrl.scala 227:118]
    node _T_53 = bits(picm_raddr_ff, 5, 2) @[el2_pic_ctrl.scala 227:98]
    node _T_54 = eq(_T_53, UInt<1>("h01")) @[el2_pic_ctrl.scala 227:104]
    node _T_55 = and(intpend_reg_read, _T_54) @[el2_pic_ctrl.scala 227:83]
    node _T_56 = bits(_T_55, 0, 0) @[Bitwise.scala 72:15]
    node _T_57 = mux(_T_56, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_58 = bits(intpend_reg_extended, 63, 32) @[el2_pic_ctrl.scala 227:140]
    node _T_59 = and(_T_57, _T_58) @[el2_pic_ctrl.scala 227:118]
    node intpend_rd_part_out = cat(_T_59, _T_52) @[Cat.scala 29:58]
    node _T_60 = bits(intpend_rd_part_out, 0, 0) @[el2_pic_ctrl.scala 228:79]
    node _T_61 = bits(intpend_rd_part_out, 1, 1) @[el2_pic_ctrl.scala 228:79]
    wire _T_62 : UInt<1>[2] @[el2_pic_ctrl.scala 228:56]
    _T_62[0] <= _T_60 @[el2_pic_ctrl.scala 228:56]
    _T_62[1] <= _T_61 @[el2_pic_ctrl.scala 228:56]
    node _T_63 = or(_T_62[0], _T_62[1]) @[el2_pic_ctrl.scala 228:93]
    intpend_rd_out <= _T_63 @[el2_pic_ctrl.scala 228:27]
    
