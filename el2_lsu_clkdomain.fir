;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_lsu_clkdomain : 
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
    
    inst clkhdr of TEC_RV_ICG @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
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
    
    inst clkhdr of TEC_RV_ICG_1 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
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
    
    inst clkhdr of TEC_RV_ICG_2 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
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
    
    inst clkhdr of TEC_RV_ICG_3 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
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
    
    inst clkhdr of TEC_RV_ICG_4 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_5 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_5 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_5 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_6 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_6 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_6 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_7 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_7 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_7 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_8 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_8 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_8 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_9 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_9 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_9 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_10 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_10 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_10 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  extmodule TEC_RV_ICG_11 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = TEC_RV_ICG
    
    
  module rvclkhdr_11 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of TEC_RV_ICG_11 @[beh_lib.scala 332:24]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 333:12]
    clkhdr.CK <= io.clk @[beh_lib.scala 334:16]
    clkhdr.EN <= io.en @[beh_lib.scala 335:16]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 336:16]
    
  module el2_lsu_clkdomain : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip free_clk : Clock, flip clk_override : UInt<1>, flip addr_in_dccm_m : UInt<1>, flip dma_dccm_req : UInt<1>, flip ldst_stbuf_reqvld_r : UInt<1>, flip stbuf_reqvld_any : UInt<1>, flip stbuf_reqvld_flushed_any : UInt<1>, flip lsu_busreq_r : UInt<1>, flip lsu_bus_buffer_pend_any : UInt<1>, flip lsu_bus_buffer_empty_any : UInt<1>, flip lsu_stbuf_empty_any : UInt<1>, flip lsu_bus_clk_en : UInt<1>, flip lsu_p : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_d : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_m : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_r : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, lsu_c1_m_clk : Clock, lsu_c1_r_clk : Clock, lsu_c2_m_clk : Clock, lsu_c2_r_clk : Clock, lsu_store_c1_m_clk : Clock, lsu_store_c1_r_clk : Clock, lsu_stbuf_c1_clk : Clock, lsu_bus_obuf_c1_clk : Clock, lsu_bus_ibuf_c1_clk : Clock, lsu_bus_buf_c1_clk : Clock, lsu_busm_clk : Clock, lsu_free_c2_clk : Clock, flip scan_mode : UInt<1>}
    
    wire lsu_c1_d_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 58:37]
    wire lsu_c1_m_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 59:37]
    wire lsu_c1_r_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 60:37]
    wire lsu_free_c1_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 61:37]
    node _T = or(io.lsu_p.valid, io.dma_dccm_req) @[el2_lsu_clkdomain.scala 63:52]
    node lsu_c1_d_clken = or(_T, io.clk_override) @[el2_lsu_clkdomain.scala 63:71]
    node _T_1 = or(io.lsu_pkt_d.valid, lsu_c1_d_clken_q) @[el2_lsu_clkdomain.scala 64:52]
    node lsu_c1_m_clken = or(_T_1, io.clk_override) @[el2_lsu_clkdomain.scala 64:71]
    node _T_2 = or(io.lsu_pkt_m.valid, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 65:52]
    node lsu_c1_r_clken = or(_T_2, io.clk_override) @[el2_lsu_clkdomain.scala 65:71]
    node _T_3 = or(lsu_c1_m_clken, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 67:48]
    node lsu_c2_m_clken = or(_T_3, io.clk_override) @[el2_lsu_clkdomain.scala 67:67]
    node _T_4 = or(lsu_c1_r_clken, lsu_c1_r_clken_q) @[el2_lsu_clkdomain.scala 68:48]
    node lsu_c2_r_clken = or(_T_4, io.clk_override) @[el2_lsu_clkdomain.scala 68:67]
    node _T_5 = and(lsu_c1_m_clken, io.lsu_pkt_d.store) @[el2_lsu_clkdomain.scala 70:50]
    node lsu_store_c1_m_clken = or(_T_5, io.clk_override) @[el2_lsu_clkdomain.scala 70:72]
    node _T_6 = and(lsu_c1_r_clken, io.lsu_pkt_m.store) @[el2_lsu_clkdomain.scala 71:50]
    node lsu_store_c1_r_clken = or(_T_6, io.clk_override) @[el2_lsu_clkdomain.scala 71:72]
    node _T_7 = or(io.ldst_stbuf_reqvld_r, io.stbuf_reqvld_any) @[el2_lsu_clkdomain.scala 72:56]
    node _T_8 = or(_T_7, io.stbuf_reqvld_flushed_any) @[el2_lsu_clkdomain.scala 72:78]
    node lsu_stbuf_c1_clken = or(_T_8, io.clk_override) @[el2_lsu_clkdomain.scala 72:108]
    node lsu_bus_ibuf_c1_clken = or(io.lsu_busreq_r, io.clk_override) @[el2_lsu_clkdomain.scala 73:50]
    node _T_9 = or(io.lsu_bus_buffer_pend_any, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 74:62]
    node _T_10 = or(_T_9, io.clk_override) @[el2_lsu_clkdomain.scala 74:80]
    node lsu_bus_obuf_c1_clken = and(_T_10, io.lsu_bus_clk_en) @[el2_lsu_clkdomain.scala 74:99]
    node _T_11 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 75:34]
    node _T_12 = or(_T_11, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 75:63]
    node _T_13 = or(_T_12, io.clk_override) @[el2_lsu_clkdomain.scala 75:81]
    node lsu_bus_buf_c1_clken = bits(_T_13, 0, 0) @[el2_lsu_clkdomain.scala 75:100]
    node _T_14 = or(io.lsu_p.valid, io.lsu_pkt_d.valid) @[el2_lsu_clkdomain.scala 77:49]
    node _T_15 = or(_T_14, io.lsu_pkt_m.valid) @[el2_lsu_clkdomain.scala 77:70]
    node _T_16 = or(_T_15, io.lsu_pkt_r.valid) @[el2_lsu_clkdomain.scala 77:91]
    node _T_17 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 77:115]
    node _T_18 = or(_T_16, _T_17) @[el2_lsu_clkdomain.scala 77:113]
    node _T_19 = eq(io.lsu_stbuf_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 77:146]
    node _T_20 = or(_T_18, _T_19) @[el2_lsu_clkdomain.scala 77:144]
    node lsu_free_c1_clken = or(_T_20, io.clk_override) @[el2_lsu_clkdomain.scala 77:170]
    node _T_21 = or(lsu_free_c1_clken, lsu_free_c1_clken_q) @[el2_lsu_clkdomain.scala 78:51]
    node lsu_free_c2_clken = or(_T_21, io.clk_override) @[el2_lsu_clkdomain.scala 78:73]
    reg _T_22 : UInt, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 81:61]
    _T_22 <= lsu_free_c1_clken @[el2_lsu_clkdomain.scala 81:61]
    lsu_free_c1_clken_q <= _T_22 @[el2_lsu_clkdomain.scala 81:27]
    reg _T_23 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 82:68]
    _T_23 <= lsu_c1_d_clken @[el2_lsu_clkdomain.scala 82:68]
    lsu_c1_d_clken_q <= _T_23 @[el2_lsu_clkdomain.scala 82:27]
    reg _T_24 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 83:68]
    _T_24 <= lsu_c1_m_clken @[el2_lsu_clkdomain.scala 83:68]
    lsu_c1_m_clken_q <= _T_24 @[el2_lsu_clkdomain.scala 83:27]
    reg _T_25 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 84:68]
    _T_25 <= lsu_c1_r_clken @[el2_lsu_clkdomain.scala 84:68]
    lsu_c1_r_clken_q <= _T_25 @[el2_lsu_clkdomain.scala 84:27]
    node _T_26 = bits(lsu_c1_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 86:60]
    inst rvclkhdr of rvclkhdr @[beh_lib.scala 341:20]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr.io.en <= _T_26 @[beh_lib.scala 343:14]
    rvclkhdr.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_c1_m_clk <= rvclkhdr.io.l1clk @[el2_lsu_clkdomain.scala 86:27]
    node _T_27 = bits(lsu_c1_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 87:60]
    inst rvclkhdr_1 of rvclkhdr_1 @[beh_lib.scala 341:20]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_1.io.en <= _T_27 @[beh_lib.scala 343:14]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_c1_r_clk <= rvclkhdr_1.io.l1clk @[el2_lsu_clkdomain.scala 87:27]
    node _T_28 = bits(lsu_c2_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 88:60]
    inst rvclkhdr_2 of rvclkhdr_2 @[beh_lib.scala 341:20]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_2.io.en <= _T_28 @[beh_lib.scala 343:14]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_c2_m_clk <= rvclkhdr_2.io.l1clk @[el2_lsu_clkdomain.scala 88:27]
    node _T_29 = bits(lsu_c2_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 89:60]
    inst rvclkhdr_3 of rvclkhdr_3 @[beh_lib.scala 341:20]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_3.io.en <= _T_29 @[beh_lib.scala 343:14]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_c2_r_clk <= rvclkhdr_3.io.l1clk @[el2_lsu_clkdomain.scala 89:27]
    node _T_30 = bits(lsu_store_c1_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 90:66]
    inst rvclkhdr_4 of rvclkhdr_4 @[beh_lib.scala 341:20]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_4.io.en <= _T_30 @[beh_lib.scala 343:14]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_store_c1_m_clk <= rvclkhdr_4.io.l1clk @[el2_lsu_clkdomain.scala 90:27]
    node _T_31 = bits(lsu_store_c1_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 91:66]
    inst rvclkhdr_5 of rvclkhdr_5 @[beh_lib.scala 341:20]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_5.io.en <= _T_31 @[beh_lib.scala 343:14]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_store_c1_r_clk <= rvclkhdr_5.io.l1clk @[el2_lsu_clkdomain.scala 91:27]
    node _T_32 = bits(lsu_stbuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 92:64]
    inst rvclkhdr_6 of rvclkhdr_6 @[beh_lib.scala 341:20]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_6.io.en <= _T_32 @[beh_lib.scala 343:14]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_stbuf_c1_clk <= rvclkhdr_6.io.l1clk @[el2_lsu_clkdomain.scala 92:27]
    node _T_33 = bits(lsu_bus_ibuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 93:67]
    inst rvclkhdr_7 of rvclkhdr_7 @[beh_lib.scala 341:20]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_7.io.en <= _T_33 @[beh_lib.scala 343:14]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_bus_ibuf_c1_clk <= rvclkhdr_7.io.l1clk @[el2_lsu_clkdomain.scala 93:27]
    node _T_34 = bits(lsu_bus_obuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 94:67]
    inst rvclkhdr_8 of rvclkhdr_8 @[beh_lib.scala 341:20]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_8.io.en <= _T_34 @[beh_lib.scala 343:14]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_bus_obuf_c1_clk <= rvclkhdr_8.io.l1clk @[el2_lsu_clkdomain.scala 94:27]
    node _T_35 = bits(lsu_bus_buf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 95:66]
    inst rvclkhdr_9 of rvclkhdr_9 @[beh_lib.scala 341:20]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_9.io.en <= _T_35 @[beh_lib.scala 343:14]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_bus_buf_c1_clk <= rvclkhdr_9.io.l1clk @[el2_lsu_clkdomain.scala 95:27]
    node _T_36 = bits(io.lsu_bus_clk_en, 0, 0) @[el2_lsu_clkdomain.scala 96:63]
    inst rvclkhdr_10 of rvclkhdr_10 @[beh_lib.scala 341:20]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_10.io.en <= _T_36 @[beh_lib.scala 343:14]
    rvclkhdr_10.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_busm_clk <= rvclkhdr_10.io.l1clk @[el2_lsu_clkdomain.scala 96:27]
    node _T_37 = bits(lsu_free_c2_clken, 0, 0) @[el2_lsu_clkdomain.scala 97:63]
    inst rvclkhdr_11 of rvclkhdr_11 @[beh_lib.scala 341:20]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[beh_lib.scala 342:15]
    rvclkhdr_11.io.en <= _T_37 @[beh_lib.scala 343:14]
    rvclkhdr_11.io.scan_mode <= io.scan_mode @[beh_lib.scala 344:21]
    io.lsu_free_c2_clk <= rvclkhdr_11.io.l1clk @[el2_lsu_clkdomain.scala 97:27]
    
