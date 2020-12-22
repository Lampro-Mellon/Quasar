;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit lsu_clkdomain : 
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
    
    inst clkhdr of gated_latch_6 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_7 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_8 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
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
    
    inst clkhdr of gated_latch_9 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_10 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_10 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_10 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_11 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_11 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_11 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  module lsu_clkdomain : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip active_clk : Clock, flip clk_override : UInt<1>, flip dec_tlu_force_halt : UInt<1>, flip dma_dccm_req : UInt<1>, flip ldst_stbuf_reqvld_r : UInt<1>, flip stbuf_reqvld_any : UInt<1>, flip stbuf_reqvld_flushed_any : UInt<1>, flip lsu_busreq_r : UInt<1>, flip lsu_bus_buffer_pend_any : UInt<1>, flip lsu_bus_buffer_empty_any : UInt<1>, flip lsu_stbuf_empty_any : UInt<1>, flip lsu_bus_clk_en : UInt<1>, flip lsu_p : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_d : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_m : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_r : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, lsu_bus_obuf_c1_clken : UInt<1>, lsu_busm_clken : UInt<1>, lsu_c1_m_clk : Clock, lsu_c1_r_clk : Clock, lsu_c2_m_clk : Clock, lsu_c2_r_clk : Clock, lsu_store_c1_m_clk : Clock, lsu_store_c1_r_clk : Clock, lsu_stbuf_c1_clk : Clock, lsu_bus_obuf_c1_clk : Clock, lsu_bus_ibuf_c1_clk : Clock, lsu_bus_buf_c1_clk : Clock, lsu_busm_clk : Clock, lsu_free_c2_clk : Clock, flip scan_mode : UInt<1>}
    
    wire lsu_c1_m_clken_q : UInt<1> @[lsu_clkdomain.scala 60:36]
    wire lsu_c1_r_clken_q : UInt<1> @[lsu_clkdomain.scala 61:36]
    wire lsu_free_c1_clken_q : UInt<1> @[lsu_clkdomain.scala 62:36]
    node _T = or(io.lsu_p.valid, io.dma_dccm_req) @[lsu_clkdomain.scala 64:47]
    node lsu_c1_m_clken = or(_T, io.clk_override) @[lsu_clkdomain.scala 64:65]
    node _T_1 = or(io.lsu_pkt_m.valid, lsu_c1_m_clken_q) @[lsu_clkdomain.scala 65:51]
    node lsu_c1_r_clken = or(_T_1, io.clk_override) @[lsu_clkdomain.scala 65:70]
    node _T_2 = or(lsu_c1_m_clken, lsu_c1_m_clken_q) @[lsu_clkdomain.scala 67:47]
    node lsu_c2_m_clken = or(_T_2, io.clk_override) @[lsu_clkdomain.scala 67:66]
    node _T_3 = or(lsu_c1_r_clken, lsu_c1_r_clken_q) @[lsu_clkdomain.scala 68:47]
    node lsu_c2_r_clken = or(_T_3, io.clk_override) @[lsu_clkdomain.scala 68:66]
    node _T_4 = and(lsu_c1_m_clken, io.lsu_pkt_d.bits.store) @[lsu_clkdomain.scala 70:49]
    node lsu_store_c1_m_clken = or(_T_4, io.clk_override) @[lsu_clkdomain.scala 70:76]
    node _T_5 = and(lsu_c1_r_clken, io.lsu_pkt_m.bits.store) @[lsu_clkdomain.scala 71:49]
    node lsu_store_c1_r_clken = or(_T_5, io.clk_override) @[lsu_clkdomain.scala 71:76]
    node _T_6 = or(io.ldst_stbuf_reqvld_r, io.stbuf_reqvld_any) @[lsu_clkdomain.scala 72:55]
    node _T_7 = or(_T_6, io.stbuf_reqvld_flushed_any) @[lsu_clkdomain.scala 72:77]
    node lsu_stbuf_c1_clken = or(_T_7, io.clk_override) @[lsu_clkdomain.scala 72:107]
    node lsu_bus_ibuf_c1_clken = or(io.lsu_busreq_r, io.clk_override) @[lsu_clkdomain.scala 73:49]
    node _T_8 = or(io.lsu_bus_buffer_pend_any, io.lsu_busreq_r) @[lsu_clkdomain.scala 74:62]
    node _T_9 = or(_T_8, io.clk_override) @[lsu_clkdomain.scala 74:80]
    node _T_10 = and(_T_9, io.lsu_bus_clk_en) @[lsu_clkdomain.scala 74:99]
    io.lsu_bus_obuf_c1_clken <= _T_10 @[lsu_clkdomain.scala 74:30]
    node _T_11 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[lsu_clkdomain.scala 75:32]
    node _T_12 = or(_T_11, io.lsu_busreq_r) @[lsu_clkdomain.scala 75:61]
    node _T_13 = or(_T_12, io.dec_tlu_force_halt) @[lsu_clkdomain.scala 75:79]
    node lsu_bus_buf_c1_clken = or(_T_13, io.clk_override) @[lsu_clkdomain.scala 75:103]
    node _T_14 = or(io.lsu_p.valid, io.lsu_pkt_d.valid) @[lsu_clkdomain.scala 77:48]
    node _T_15 = or(_T_14, io.lsu_pkt_m.valid) @[lsu_clkdomain.scala 77:69]
    node _T_16 = or(_T_15, io.lsu_pkt_r.valid) @[lsu_clkdomain.scala 77:90]
    node _T_17 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[lsu_clkdomain.scala 77:114]
    node _T_18 = or(_T_16, _T_17) @[lsu_clkdomain.scala 77:112]
    node _T_19 = eq(io.lsu_stbuf_empty_any, UInt<1>("h00")) @[lsu_clkdomain.scala 77:145]
    node _T_20 = or(_T_18, _T_19) @[lsu_clkdomain.scala 77:143]
    node lsu_free_c1_clken = or(_T_20, io.clk_override) @[lsu_clkdomain.scala 77:169]
    node _T_21 = or(lsu_free_c1_clken, lsu_free_c1_clken_q) @[lsu_clkdomain.scala 78:50]
    node lsu_free_c2_clken = or(_T_21, io.clk_override) @[lsu_clkdomain.scala 78:72]
    node _T_22 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[lsu_clkdomain.scala 79:25]
    node _T_23 = or(_T_22, io.lsu_busreq_r) @[lsu_clkdomain.scala 79:54]
    node _T_24 = or(_T_23, io.clk_override) @[lsu_clkdomain.scala 79:72]
    node _T_25 = and(_T_24, io.lsu_bus_clk_en) @[lsu_clkdomain.scala 79:91]
    io.lsu_busm_clken <= _T_25 @[lsu_clkdomain.scala 79:21]
    reg _T_26 : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[lsu_clkdomain.scala 82:62]
    _T_26 <= lsu_free_c1_clken @[lsu_clkdomain.scala 82:62]
    lsu_free_c1_clken_q <= _T_26 @[lsu_clkdomain.scala 82:26]
    reg _T_27 : UInt<1>, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[lsu_clkdomain.scala 84:67]
    _T_27 <= lsu_c1_m_clken @[lsu_clkdomain.scala 84:67]
    lsu_c1_m_clken_q <= _T_27 @[lsu_clkdomain.scala 84:26]
    reg _T_28 : UInt<1>, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[lsu_clkdomain.scala 85:67]
    _T_28 <= lsu_c1_r_clken @[lsu_clkdomain.scala 85:67]
    lsu_c1_r_clken_q <= _T_28 @[lsu_clkdomain.scala 85:26]
    node _T_29 = bits(lsu_c1_m_clken, 0, 0) @[lsu_clkdomain.scala 87:60]
    inst rvclkhdr of rvclkhdr @[lib.scala 352:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr.io.en <= _T_29 @[lib.scala 354:16]
    rvclkhdr.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_c1_m_clk <= rvclkhdr.io.l1clk @[lsu_clkdomain.scala 87:26]
    node _T_30 = bits(lsu_c1_r_clken, 0, 0) @[lsu_clkdomain.scala 88:60]
    inst rvclkhdr_1 of rvclkhdr_1 @[lib.scala 352:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_1.io.en <= _T_30 @[lib.scala 354:16]
    rvclkhdr_1.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_c1_r_clk <= rvclkhdr_1.io.l1clk @[lsu_clkdomain.scala 88:26]
    node _T_31 = bits(lsu_c2_m_clken, 0, 0) @[lsu_clkdomain.scala 89:60]
    inst rvclkhdr_2 of rvclkhdr_2 @[lib.scala 352:22]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_2.io.en <= _T_31 @[lib.scala 354:16]
    rvclkhdr_2.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_c2_m_clk <= rvclkhdr_2.io.l1clk @[lsu_clkdomain.scala 89:26]
    node _T_32 = bits(lsu_c2_r_clken, 0, 0) @[lsu_clkdomain.scala 90:60]
    inst rvclkhdr_3 of rvclkhdr_3 @[lib.scala 352:22]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_3.io.en <= _T_32 @[lib.scala 354:16]
    rvclkhdr_3.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_c2_r_clk <= rvclkhdr_3.io.l1clk @[lsu_clkdomain.scala 90:26]
    node _T_33 = bits(lsu_store_c1_m_clken, 0, 0) @[lsu_clkdomain.scala 91:66]
    inst rvclkhdr_4 of rvclkhdr_4 @[lib.scala 352:22]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_4.io.en <= _T_33 @[lib.scala 354:16]
    rvclkhdr_4.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_store_c1_m_clk <= rvclkhdr_4.io.l1clk @[lsu_clkdomain.scala 91:26]
    node _T_34 = bits(lsu_store_c1_r_clken, 0, 0) @[lsu_clkdomain.scala 92:66]
    inst rvclkhdr_5 of rvclkhdr_5 @[lib.scala 352:22]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_5.io.en <= _T_34 @[lib.scala 354:16]
    rvclkhdr_5.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_store_c1_r_clk <= rvclkhdr_5.io.l1clk @[lsu_clkdomain.scala 92:26]
    node _T_35 = bits(lsu_stbuf_c1_clken, 0, 0) @[lsu_clkdomain.scala 93:64]
    inst rvclkhdr_6 of rvclkhdr_6 @[lib.scala 352:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_6.io.en <= _T_35 @[lib.scala 354:16]
    rvclkhdr_6.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_stbuf_c1_clk <= rvclkhdr_6.io.l1clk @[lsu_clkdomain.scala 93:26]
    node _T_36 = bits(lsu_bus_ibuf_c1_clken, 0, 0) @[lsu_clkdomain.scala 94:67]
    inst rvclkhdr_7 of rvclkhdr_7 @[lib.scala 352:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_7.io.en <= _T_36 @[lib.scala 354:16]
    rvclkhdr_7.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_bus_ibuf_c1_clk <= rvclkhdr_7.io.l1clk @[lsu_clkdomain.scala 94:26]
    node _T_37 = bits(io.lsu_bus_obuf_c1_clken, 0, 0) @[lsu_clkdomain.scala 95:69]
    inst rvclkhdr_8 of rvclkhdr_8 @[lib.scala 343:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_8.io.en <= _T_37 @[lib.scala 345:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    io.lsu_bus_obuf_c1_clk <= rvclkhdr_8.io.l1clk @[lsu_clkdomain.scala 95:26]
    node _T_38 = bits(lsu_bus_buf_c1_clken, 0, 0) @[lsu_clkdomain.scala 96:66]
    inst rvclkhdr_9 of rvclkhdr_9 @[lib.scala 352:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_9.io.en <= _T_38 @[lib.scala 354:16]
    rvclkhdr_9.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_bus_buf_c1_clk <= rvclkhdr_9.io.l1clk @[lsu_clkdomain.scala 96:26]
    node _T_39 = bits(io.lsu_busm_clken, 0, 0) @[lsu_clkdomain.scala 97:62]
    inst rvclkhdr_10 of rvclkhdr_10 @[lib.scala 343:22]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_10.io.en <= _T_39 @[lib.scala 345:16]
    rvclkhdr_10.io.scan_mode <= io.scan_mode @[lib.scala 346:23]
    io.lsu_busm_clk <= rvclkhdr_10.io.l1clk @[lsu_clkdomain.scala 97:26]
    node _T_40 = bits(lsu_free_c2_clken, 0, 0) @[lsu_clkdomain.scala 98:63]
    inst rvclkhdr_11 of rvclkhdr_11 @[lib.scala 352:22]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[lib.scala 353:17]
    rvclkhdr_11.io.en <= _T_40 @[lib.scala 354:16]
    rvclkhdr_11.io.scan_mode <= UInt<1>("h00") @[lib.scala 355:23]
    io.lsu_free_c2_clk <= rvclkhdr_11.io.l1clk @[lsu_clkdomain.scala 98:26]
    
