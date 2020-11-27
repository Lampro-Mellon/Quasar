;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_lsu_clkdomain : 
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
    
    inst clkhdr of gated_latch_10 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
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
    
    inst clkhdr of gated_latch_11 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  module el2_lsu_clkdomain : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip free_clk : Clock, flip clk_override : UInt<1>, flip addr_in_dccm_m : UInt<1>, flip dma_dccm_req : UInt<1>, flip ldst_stbuf_reqvld_r : UInt<1>, flip stbuf_reqvld_any : UInt<1>, flip stbuf_reqvld_flushed_any : UInt<1>, flip lsu_busreq_r : UInt<1>, flip lsu_bus_buffer_pend_any : UInt<1>, flip lsu_bus_buffer_empty_any : UInt<1>, flip lsu_stbuf_empty_any : UInt<1>, flip lsu_bus_clk_en : UInt<1>, flip lsu_p : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_d : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_m : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, flip lsu_pkt_r : {valid : UInt<1>, bits : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>}}, lsu_c1_m_clk : Clock, lsu_c1_r_clk : Clock, lsu_c2_m_clk : Clock, lsu_c2_r_clk : Clock, lsu_store_c1_m_clk : Clock, lsu_store_c1_r_clk : Clock, lsu_stbuf_c1_clk : Clock, lsu_bus_obuf_c1_clk : Clock, lsu_bus_ibuf_c1_clk : Clock, lsu_bus_buf_c1_clk : Clock, lsu_busm_clk : Clock, lsu_free_c2_clk : Clock, flip scan_mode : UInt<1>}
    
    wire lsu_c1_d_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 58:36]
    wire lsu_c1_m_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 59:36]
    wire lsu_c1_r_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 60:36]
    wire lsu_free_c1_clken_q : UInt<1> @[el2_lsu_clkdomain.scala 61:36]
    node _T = or(io.lsu_p.valid, io.dma_dccm_req) @[el2_lsu_clkdomain.scala 63:51]
    node lsu_c1_d_clken = or(_T, io.clk_override) @[el2_lsu_clkdomain.scala 63:70]
    node _T_1 = or(io.lsu_pkt_d.valid, lsu_c1_d_clken_q) @[el2_lsu_clkdomain.scala 64:51]
    node lsu_c1_m_clken = or(_T_1, io.clk_override) @[el2_lsu_clkdomain.scala 64:70]
    node _T_2 = or(io.lsu_pkt_m.valid, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 65:51]
    node lsu_c1_r_clken = or(_T_2, io.clk_override) @[el2_lsu_clkdomain.scala 65:70]
    node _T_3 = or(lsu_c1_m_clken, lsu_c1_m_clken_q) @[el2_lsu_clkdomain.scala 67:47]
    node lsu_c2_m_clken = or(_T_3, io.clk_override) @[el2_lsu_clkdomain.scala 67:66]
    node _T_4 = or(lsu_c1_r_clken, lsu_c1_r_clken_q) @[el2_lsu_clkdomain.scala 68:47]
    node lsu_c2_r_clken = or(_T_4, io.clk_override) @[el2_lsu_clkdomain.scala 68:66]
    node _T_5 = and(lsu_c1_m_clken, io.lsu_pkt_d.bits.store) @[el2_lsu_clkdomain.scala 70:49]
    node lsu_store_c1_m_clken = or(_T_5, io.clk_override) @[el2_lsu_clkdomain.scala 70:76]
    node _T_6 = and(lsu_c1_r_clken, io.lsu_pkt_m.bits.store) @[el2_lsu_clkdomain.scala 71:49]
    node lsu_store_c1_r_clken = or(_T_6, io.clk_override) @[el2_lsu_clkdomain.scala 71:76]
    node _T_7 = or(io.ldst_stbuf_reqvld_r, io.stbuf_reqvld_any) @[el2_lsu_clkdomain.scala 72:55]
    node _T_8 = or(_T_7, io.stbuf_reqvld_flushed_any) @[el2_lsu_clkdomain.scala 72:77]
    node lsu_stbuf_c1_clken = or(_T_8, io.clk_override) @[el2_lsu_clkdomain.scala 72:107]
    node lsu_bus_ibuf_c1_clken = or(io.lsu_busreq_r, io.clk_override) @[el2_lsu_clkdomain.scala 73:49]
    node _T_9 = or(io.lsu_bus_buffer_pend_any, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 74:61]
    node _T_10 = or(_T_9, io.clk_override) @[el2_lsu_clkdomain.scala 74:79]
    node lsu_bus_obuf_c1_clken = and(_T_10, io.lsu_bus_clk_en) @[el2_lsu_clkdomain.scala 74:98]
    node _T_11 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 75:32]
    node _T_12 = or(_T_11, io.lsu_busreq_r) @[el2_lsu_clkdomain.scala 75:61]
    node lsu_bus_buf_c1_clken = or(_T_12, io.clk_override) @[el2_lsu_clkdomain.scala 75:79]
    node _T_13 = or(io.lsu_p.valid, io.lsu_pkt_d.valid) @[el2_lsu_clkdomain.scala 77:48]
    node _T_14 = or(_T_13, io.lsu_pkt_m.valid) @[el2_lsu_clkdomain.scala 77:69]
    node _T_15 = or(_T_14, io.lsu_pkt_r.valid) @[el2_lsu_clkdomain.scala 77:90]
    node _T_16 = eq(io.lsu_bus_buffer_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 77:114]
    node _T_17 = or(_T_15, _T_16) @[el2_lsu_clkdomain.scala 77:112]
    node _T_18 = eq(io.lsu_stbuf_empty_any, UInt<1>("h00")) @[el2_lsu_clkdomain.scala 77:145]
    node _T_19 = or(_T_17, _T_18) @[el2_lsu_clkdomain.scala 77:143]
    node lsu_free_c1_clken = or(_T_19, io.clk_override) @[el2_lsu_clkdomain.scala 77:169]
    node _T_20 = or(lsu_free_c1_clken, lsu_free_c1_clken_q) @[el2_lsu_clkdomain.scala 78:50]
    node lsu_free_c2_clken = or(_T_20, io.clk_override) @[el2_lsu_clkdomain.scala 78:72]
    reg _T_21 : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 81:60]
    _T_21 <= lsu_free_c1_clken @[el2_lsu_clkdomain.scala 81:60]
    lsu_free_c1_clken_q <= _T_21 @[el2_lsu_clkdomain.scala 81:26]
    reg _T_22 : UInt<1>, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 82:67]
    _T_22 <= lsu_c1_d_clken @[el2_lsu_clkdomain.scala 82:67]
    lsu_c1_d_clken_q <= _T_22 @[el2_lsu_clkdomain.scala 82:26]
    reg _T_23 : UInt<1>, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 83:67]
    _T_23 <= lsu_c1_m_clken @[el2_lsu_clkdomain.scala 83:67]
    lsu_c1_m_clken_q <= _T_23 @[el2_lsu_clkdomain.scala 83:26]
    reg _T_24 : UInt<1>, io.lsu_free_c2_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_clkdomain.scala 84:67]
    _T_24 <= lsu_c1_r_clken @[el2_lsu_clkdomain.scala 84:67]
    lsu_c1_r_clken_q <= _T_24 @[el2_lsu_clkdomain.scala 84:26]
    node _T_25 = bits(lsu_c1_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 86:59]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 483:22]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr.io.en <= _T_25 @[el2_lib.scala 485:16]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_c1_m_clk <= rvclkhdr.io.l1clk @[el2_lsu_clkdomain.scala 86:26]
    node _T_26 = bits(lsu_c1_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 87:59]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 483:22]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_1.io.en <= _T_26 @[el2_lib.scala 485:16]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_c1_r_clk <= rvclkhdr_1.io.l1clk @[el2_lsu_clkdomain.scala 87:26]
    node _T_27 = bits(lsu_c2_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 88:59]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 483:22]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_2.io.en <= _T_27 @[el2_lib.scala 485:16]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_c2_m_clk <= rvclkhdr_2.io.l1clk @[el2_lsu_clkdomain.scala 88:26]
    node _T_28 = bits(lsu_c2_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 89:59]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 483:22]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_3.io.en <= _T_28 @[el2_lib.scala 485:16]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_c2_r_clk <= rvclkhdr_3.io.l1clk @[el2_lsu_clkdomain.scala 89:26]
    node _T_29 = bits(lsu_store_c1_m_clken, 0, 0) @[el2_lsu_clkdomain.scala 90:65]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 483:22]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_4.io.en <= _T_29 @[el2_lib.scala 485:16]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_store_c1_m_clk <= rvclkhdr_4.io.l1clk @[el2_lsu_clkdomain.scala 90:26]
    node _T_30 = bits(lsu_store_c1_r_clken, 0, 0) @[el2_lsu_clkdomain.scala 91:65]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 483:22]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_5.io.en <= _T_30 @[el2_lib.scala 485:16]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_store_c1_r_clk <= rvclkhdr_5.io.l1clk @[el2_lsu_clkdomain.scala 91:26]
    node _T_31 = bits(lsu_stbuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 92:63]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 483:22]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_6.io.en <= _T_31 @[el2_lib.scala 485:16]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_stbuf_c1_clk <= rvclkhdr_6.io.l1clk @[el2_lsu_clkdomain.scala 92:26]
    node _T_32 = bits(lsu_bus_ibuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 93:66]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 483:22]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_7.io.en <= _T_32 @[el2_lib.scala 485:16]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_bus_ibuf_c1_clk <= rvclkhdr_7.io.l1clk @[el2_lsu_clkdomain.scala 93:26]
    node _T_33 = bits(lsu_bus_obuf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 94:66]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 483:22]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_8.io.en <= _T_33 @[el2_lib.scala 485:16]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_bus_obuf_c1_clk <= rvclkhdr_8.io.l1clk @[el2_lsu_clkdomain.scala 94:26]
    node _T_34 = bits(lsu_bus_buf_c1_clken, 0, 0) @[el2_lsu_clkdomain.scala 95:65]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 483:22]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_9.io.en <= _T_34 @[el2_lib.scala 485:16]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_bus_buf_c1_clk <= rvclkhdr_9.io.l1clk @[el2_lsu_clkdomain.scala 95:26]
    node _T_35 = bits(io.lsu_bus_clk_en, 0, 0) @[el2_lsu_clkdomain.scala 96:62]
    inst rvclkhdr_10 of rvclkhdr_10 @[el2_lib.scala 483:22]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_10.io.en <= _T_35 @[el2_lib.scala 485:16]
    rvclkhdr_10.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_busm_clk <= rvclkhdr_10.io.l1clk @[el2_lsu_clkdomain.scala 96:26]
    node _T_36 = bits(lsu_free_c2_clken, 0, 0) @[el2_lsu_clkdomain.scala 97:62]
    inst rvclkhdr_11 of rvclkhdr_11 @[el2_lib.scala 483:22]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[el2_lib.scala 484:17]
    rvclkhdr_11.io.en <= _T_36 @[el2_lib.scala 485:16]
    rvclkhdr_11.io.scan_mode <= io.scan_mode @[el2_lib.scala 486:23]
    io.lsu_free_c2_clk <= rvclkhdr_11.io.l1clk @[el2_lsu_clkdomain.scala 97:26]
    
