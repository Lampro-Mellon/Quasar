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
    
    inst clkhdr of TEC_RV_ICG @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_1 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_2 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_3 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_4 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_5 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_6 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_7 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_8 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_9 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_10 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
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
    
    inst clkhdr of TEC_RV_ICG_11 @[beh_lib.scala 330:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[beh_lib.scala 331:14]
    clkhdr.CK <= io.clk @[beh_lib.scala 332:18]
    clkhdr.EN <= io.en @[beh_lib.scala 333:18]
    clkhdr.SE <= io.scan_mode @[beh_lib.scala 334:18]
    
  module el2_lsu_clkdomain : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip free_clk : Clock, flip clk_override : UInt<1>, flip addr_in_dccm_m : UInt<1>, flip dma_dccm_req : UInt<1>, flip ldst_stbuf_reqvld_r : UInt<1>, flip stbuf_reqvld_any : UInt<1>, flip stbuf_reqvld_flushed_any : UInt<1>, flip lsu_busreq_r : UInt<1>, flip lsu_bus_buffer_pend_any : UInt<1>, flip lsu_bus_buffer_empty_any : UInt<1>, flip lsu_stbuf_empty_any : UInt<1>, flip lsu_bus_clk_en : UInt<1>, flip lsu_p : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_d : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_m : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip lsu_pkt_r : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, lsu_c1_m_clk : Clock, lsu_c1_r_clk : Clock, lsu_c2_m_clk : Clock, lsu_c2_r_clk : Clock, lsu_store_c1_m_clk : Clock, lsu_store_c1_r_clk : Clock, lsu_stbuf_c1_clk : Clock, lsu_bus_obuf_c1_clk : Clock, lsu_bus_ibuf_c1_clk : Clock, lsu_bus_buf_c1_clk : Clock, lsu_busm_clk : Clock, lsu_free_c2_clk : Clock, flip scan_mode : UInt<1>}
    
    wire lsu_c1_d_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 60:36]
    wire lsu_c1_m_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 61:36]
    wire lsu_c1_r_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 62:36]
    wire lsu_free_c1_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 63:36]
    node _T = or(io.lsu_p.valid, io.dma_dccm_req) @[el2_lsu_clkdomain.scala 64:51]
    node lsu_c1_d_clken = or(_T, io.clk_override) @[el2_lsu_clkdomain.scala 64:70]
    node _T_1 = or(io.lsu_pkt_d.valid, lsu_c1_d_clken_q) @[el2_lsu_clkdomain.scala 65:51]
    node lsu_c1_m_clken = or(_T_1, io.clk_override) @[el2_lsu_clkdomain.scala 65:70]
    node _T_2 = or(io.lsu_pkt_m.valid, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 66:51]
    node lsu_c1_r_clken = or(_T_2, io.clk_override) @[el2_lsu_clkdomain.scala 66:70]
    node _T_3 = or(lsu_c1_m_clken, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 68:47]
    node lsu_c2_m_clken = or(_T_3, io.clk_override) @[el2_lsu_clkdomain.scala 68:66]
    node _T_4 = or(lsu_c1_r_clken, lsu_c1_r_clken_q) @[el2_lsu_clkdomain.scala 69:47]
    node lsu_c2_r_clken = or(_T_4, io.clk_override) @[el2_lsu_clkdomain.scala 69:66]
    node _T_5 = and(lsu_c1_m_clken, io.lsu_pkt_d.store) @[el2_lsu_clkdomain.scala 71:49]
    node lsu_store_c1_m_clken = or(_T_5, io.clk_override) @[el2_lsu_clkdomain.scala 71:71]
    node _T_6 = and(lsu_c1_r_clken, io.lsu_pkt_m.store) @[el2_lsu_clkdomain.scala 72:49]
    node lsu_store_c1_r_clken = or(_T_6, io.clk_override) @[el2_lsu_clkdomain.scala 72:71]
    node _T_7 = or(io.ldst_stbuf_reqvld_r, io.stbuf_reqvld_any) @[el2_lsu_clkdomain.scala 73:55]
    node _T_8 = or(_T_7, io.stbuf_reqvld_flushed_any) @[el2_lsu_clkdomain.scala 73:77]
    node lsu_stbuf_c1_clken = or(_T_8, io.clk_override) @[el2_lsu_clkdomain.scala 73:107]
    node lsu_bus_ibuf_c1_clken = or(io.lsu_busreq_r, io.clk_override) @[el2_lsu_clkdomain.scala 74:49]
    node _T_9 = or(io.lsu_bus_buffer_pend_any, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 75:61]
    node _T_10 = or(_T_9, io.clk_override) @[el2_lsu_clkdomain.scala 75:79]
    node lsu_bus_obuf_c1_clken = and(_T_10, io.lsu_bus_clk_en) @[el2_lsu_clkdomain.scala 75:98]
    node _T_11 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 76:32]
    node _T_12 = or(_T_11, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 76:61]
    node lsu_bus_buf_c1_clken = or(_T_12, io.clk_override) @[el2_lsu_clkdomain.scala 76:79]
    node _T_13 = or(io.lsu_p.valid, io.lsu_pkt_d.valid) @[el2_lsu_clkdomain.scala 78:48]
    node _T_14 = or(_T_13, io.lsu_pkt_m.valid) @[el2_lsu_clkdomain.scala 78:69]
    node _T_15 = or(_T_14, io.lsu_pkt_r.valid) @[el2_lsu_clkdomain.scala 78:90]
    node _T_16 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 78:114]
    node _T_17 = or(_T_15, _T_16) @[el2_lsu_clkdomain.scala 78:112]
    node _T_18 = eq(io.lsu_stbuf_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 78:145]
    node _T_19 = or(_T_17, _T_18) @[el2_lsu_clkdomain.scala 78:143]
    node lsu_free_c1_clken = or(_T_19, io.clk_override) @[el2_lsu_clkdomain.scala 78:169]
    node _T_20 = or(lsu_free_c1_clken, lsu_free_c1_clken_q) @[el2_lsu_clkdomain.scala 79:50]
    node lsu_free_c2_clken = or(_T_20, io.clk_override) @[el2_lsu_clkdomain.scala 79:72]
    reg _T_21 : UInt, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 82:60]
    _T_21 <= lsu_free_c1_clken @[el2_lsu_clkdomain.scala 82:60]
    lsu_free_c1_clken_q <= _T_21 @[el2_lsu_clkdomain.scala 82:26]
    reg _T_22 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 84:67]
    _T_22 <= lsu_c1_d_clken @[el2_lsu_clkdomain.scala 84:67]
    lsu_c1_d_clken_q <= _T_22 @[el2_lsu_clkdomain.scala 84:26]
    reg _T_23 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 85:67]
    _T_23 <= lsu_c1_m_clken @[el2_lsu_clkdomain.scala 85:67]
    lsu_c1_m_clken_q <= _T_23 @[el2_lsu_clkdomain.scala 85:26]
    reg _T_24 : UInt, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 86:67]
    _T_24 <= lsu_c1_r_clken @[el2_lsu_clkdomain.scala 86:67]
    lsu_c1_r_clken_q <= _T_24 @[el2_lsu_clkdomain.scala 86:26]
    inst lsu_c1m_cgc of rvclkhdr @[el2_lsu_clkdomain.scala 88:35]
    lsu_c1m_cgc.clock <= clock
    lsu_c1m_cgc.reset <= reset
    lsu_c1m_cgc.io.en <= lsu_c1_m_clken @[el2_lsu_clkdomain.scala 88:77]
    io.lsu_c1_m_clk <= lsu_c1m_cgc.io.l1clk @[el2_lsu_clkdomain.scala 88:127]
    inst lsu_c1r_cgc of rvclkhdr_1 @[el2_lsu_clkdomain.scala 89:35]
    lsu_c1r_cgc.clock <= clock
    lsu_c1r_cgc.reset <= reset
    lsu_c1r_cgc.io.en <= lsu_c1_r_clken @[el2_lsu_clkdomain.scala 89:77]
    io.lsu_c1_r_clk <= lsu_c1r_cgc.io.l1clk @[el2_lsu_clkdomain.scala 89:127]
    inst lsu_c2m_cgc of rvclkhdr_2 @[el2_lsu_clkdomain.scala 90:35]
    lsu_c2m_cgc.clock <= clock
    lsu_c2m_cgc.reset <= reset
    lsu_c2m_cgc.io.en <= lsu_c2_m_clken @[el2_lsu_clkdomain.scala 90:77]
    io.lsu_c2_m_clk <= lsu_c2m_cgc.io.l1clk @[el2_lsu_clkdomain.scala 90:127]
    inst lsu_c2r_cgc of rvclkhdr_3 @[el2_lsu_clkdomain.scala 91:35]
    lsu_c2r_cgc.clock <= clock
    lsu_c2r_cgc.reset <= reset
    lsu_c2r_cgc.io.en <= lsu_c2_r_clken @[el2_lsu_clkdomain.scala 91:77]
    io.lsu_c2_r_clk <= lsu_c2r_cgc.io.l1clk @[el2_lsu_clkdomain.scala 91:127]
    inst lsu_store_c1m_cgc of rvclkhdr_4 @[el2_lsu_clkdomain.scala 92:35]
    lsu_store_c1m_cgc.clock <= clock
    lsu_store_c1m_cgc.reset <= reset
    lsu_store_c1m_cgc.io.en <= lsu_store_c1_m_clken @[el2_lsu_clkdomain.scala 92:77]
    io.lsu_store_c1_m_clk <= lsu_store_c1m_cgc.io.l1clk @[el2_lsu_clkdomain.scala 92:127]
    inst lsu_store_c1r_cgc of rvclkhdr_5 @[el2_lsu_clkdomain.scala 93:35]
    lsu_store_c1r_cgc.clock <= clock
    lsu_store_c1r_cgc.reset <= reset
    lsu_store_c1r_cgc.io.en <= lsu_store_c1_r_clken @[el2_lsu_clkdomain.scala 93:77]
    io.lsu_store_c1_r_clk <= lsu_store_c1r_cgc.io.l1clk @[el2_lsu_clkdomain.scala 93:127]
    inst lsu_stbuf_c1_cgc of rvclkhdr_6 @[el2_lsu_clkdomain.scala 94:35]
    lsu_stbuf_c1_cgc.clock <= clock
    lsu_stbuf_c1_cgc.reset <= reset
    lsu_stbuf_c1_cgc.io.en <= lsu_stbuf_c1_clken @[el2_lsu_clkdomain.scala 94:77]
    io.lsu_stbuf_c1_clk <= lsu_stbuf_c1_cgc.io.l1clk @[el2_lsu_clkdomain.scala 94:127]
    inst lsu_bus_ibuf_c1_cgc of rvclkhdr_7 @[el2_lsu_clkdomain.scala 95:35]
    lsu_bus_ibuf_c1_cgc.clock <= clock
    lsu_bus_ibuf_c1_cgc.reset <= reset
    lsu_bus_ibuf_c1_cgc.io.en <= lsu_bus_ibuf_c1_clken @[el2_lsu_clkdomain.scala 95:77]
    io.lsu_bus_ibuf_c1_clk <= lsu_bus_ibuf_c1_cgc.io.l1clk @[el2_lsu_clkdomain.scala 95:127]
    inst lsu_bus_obuf_c1_cgc of rvclkhdr_8 @[el2_lsu_clkdomain.scala 96:35]
    lsu_bus_obuf_c1_cgc.clock <= clock
    lsu_bus_obuf_c1_cgc.reset <= reset
    lsu_bus_obuf_c1_cgc.io.en <= lsu_bus_obuf_c1_clken @[el2_lsu_clkdomain.scala 96:77]
    io.lsu_bus_obuf_c1_clk <= lsu_bus_obuf_c1_cgc.io.l1clk @[el2_lsu_clkdomain.scala 96:127]
    inst lsu_bus_buf_c1_cgc of rvclkhdr_9 @[el2_lsu_clkdomain.scala 97:35]
    lsu_bus_buf_c1_cgc.clock <= clock
    lsu_bus_buf_c1_cgc.reset <= reset
    lsu_bus_buf_c1_cgc.io.en <= lsu_bus_buf_c1_clken @[el2_lsu_clkdomain.scala 97:77]
    io.lsu_bus_buf_c1_clk <= lsu_bus_buf_c1_cgc.io.l1clk @[el2_lsu_clkdomain.scala 97:127]
    inst lsu_busm_cgc of rvclkhdr_10 @[el2_lsu_clkdomain.scala 98:35]
    lsu_busm_cgc.clock <= clock
    lsu_busm_cgc.reset <= reset
    lsu_busm_cgc.io.en <= io.lsu_bus_clk_en @[el2_lsu_clkdomain.scala 98:77]
    io.lsu_busm_clk <= lsu_busm_cgc.io.l1clk @[el2_lsu_clkdomain.scala 98:127]
    inst lsu_free_cgc of rvclkhdr_11 @[el2_lsu_clkdomain.scala 99:35]
    lsu_free_cgc.clock <= clock
    lsu_free_cgc.reset <= reset
    lsu_free_cgc.io.en <= lsu_free_c2_clken @[el2_lsu_clkdomain.scala 99:77]
    io.lsu_free_c2_clk <= lsu_free_cgc.io.l1clk @[el2_lsu_clkdomain.scala 99:127]
    lsu_c1m_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 101:30]
    lsu_c1m_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 101:75]
    lsu_c1r_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 102:30]
    lsu_c1r_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 102:75]
    lsu_c2m_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 103:30]
    lsu_c2m_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 103:75]
    lsu_c2r_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 104:30]
    lsu_c2r_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 104:75]
    lsu_store_c1m_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 105:30]
    lsu_store_c1m_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 105:75]
    lsu_store_c1r_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 106:30]
    lsu_store_c1r_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 106:75]
    lsu_stbuf_c1_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 107:30]
    lsu_stbuf_c1_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 107:75]
    lsu_bus_ibuf_c1_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 108:30]
    lsu_bus_ibuf_c1_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 108:75]
    lsu_bus_obuf_c1_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 109:30]
    lsu_bus_obuf_c1_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 109:75]
    lsu_bus_buf_c1_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 110:30]
    lsu_bus_buf_c1_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 110:75]
    lsu_busm_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 111:30]
    lsu_busm_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 111:75]
    lsu_free_cgc.io.clk <= clock @[el2_lsu_clkdomain.scala 112:30]
    lsu_free_cgc.io.scan_mode <= io.scan_mode @[el2_lsu_clkdomain.scala 112:75]
    
