;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ifu_bp_ctl : 
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
    
  extmodule gated_latch_12 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_12 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_12 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_13 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_13 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_13 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_14 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_14 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_14 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_15 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_15 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_15 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_16 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_16 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_16 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_17 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_17 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_17 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_18 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_18 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_18 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_19 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_19 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_19 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_20 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_20 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_20 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_21 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_21 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_21 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_22 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_22 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_22 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_23 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_23 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_23 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_24 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_24 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_24 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_25 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_25 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_25 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_26 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_26 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_26 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_27 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_27 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_27 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_28 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_28 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_28 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_29 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_29 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_29 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_30 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_30 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_30 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_31 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_31 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_31 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_32 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_32 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_32 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_33 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_33 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_33 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_34 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_34 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_34 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_35 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_35 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_35 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_36 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_36 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_36 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_37 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_37 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_37 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_38 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_38 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_38 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_39 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_39 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_39 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_40 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_40 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_40 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_41 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_41 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_41 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  extmodule gated_latch_42 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_42 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_42 @[lib.scala 334:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[lib.scala 335:14]
    clkhdr.CK <= io.clk @[lib.scala 336:18]
    clkhdr.EN <= io.en @[lib.scala 337:18]
    clkhdr.SE <= io.scan_mode @[lib.scala 338:18]
    
  module ifu_bp_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip active_clk : Clock, flip ic_hit_f : UInt<1>, flip exu_flush_final : UInt<1>, flip ifc_fetch_addr_f : UInt<31>, flip ifc_fetch_req_f : UInt<1>, dec_bp : {flip dec_tlu_br0_r_pkt : {valid : UInt<1>, bits : {hist : UInt<2>, br_error : UInt<1>, br_start_error : UInt<1>, way : UInt<1>, middle : UInt<1>}}, flip dec_tlu_flush_leak_one_wb : UInt<1>, flip dec_tlu_bpred_disable : UInt<1>}, flip dec_tlu_flush_lower_wb : UInt<1>, flip exu_bp : {exu_i0_br_index_r : UInt<8>, exu_i0_br_fghr_r : UInt<8>, exu_i0_br_way_r : UInt<1>, exu_mp_pkt : {valid : UInt<1>, bits : {misp : UInt<1>, ataken : UInt<1>, boffset : UInt<1>, pc4 : UInt<1>, hist : UInt<2>, toffset : UInt<12>, br_error : UInt<1>, br_start_error : UInt<1>, prett : UInt<31>, pcall : UInt<1>, pret : UInt<1>, pja : UInt<1>, way : UInt<1>}}, exu_mp_eghr : UInt<8>, exu_mp_fghr : UInt<8>, exu_mp_index : UInt<8>, exu_mp_btag : UInt<5>}, flip dec_fa_error_index : UInt<4>, ifu_bp_hit_taken_f : UInt<1>, ifu_bp_btb_target_f : UInt<31>, ifu_bp_inst_mask_f : UInt<1>, ifu_bp_fghr_f : UInt<8>, ifu_bp_way_f : UInt<2>, ifu_bp_ret_f : UInt<2>, ifu_bp_hist1_f : UInt<2>, ifu_bp_hist0_f : UInt<2>, ifu_bp_pc4_f : UInt<2>, ifu_bp_valid_f : UInt<2>, ifu_bp_poffset_f : UInt<12>, ifu_bp_fa_index_f : UInt<4>[2], flip scan_mode : UInt<1>}
    
    io.ifu_bp_fa_index_f[0] <= UInt<1>("h00") @[ifu_bp_ctl.scala 35:24]
    io.ifu_bp_fa_index_f[1] <= UInt<1>("h00") @[ifu_bp_ctl.scala 35:24]
    wire leak_one_f : UInt<1>
    leak_one_f <= UInt<1>("h00")
    wire leak_one_f_d1 : UInt<1>
    leak_one_f_d1 <= UInt<1>("h00")
    wire bht_dir_f : UInt<2>
    bht_dir_f <= UInt<1>("h00")
    wire dec_tlu_error_wb : UInt<1>
    dec_tlu_error_wb <= UInt<1>("h00")
    wire btb_error_addr_wb : UInt<8>
    btb_error_addr_wb <= UInt<1>("h00")
    wire btb_vbank0_rd_data_f : UInt<22>
    btb_vbank0_rd_data_f <= UInt<1>("h00")
    wire btb_vbank1_rd_data_f : UInt<22>
    btb_vbank1_rd_data_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way0_f : UInt<22>
    btb_bank0_rd_data_way0_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way1_f : UInt<22>
    btb_bank0_rd_data_way1_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way0_p1_f : UInt<22>
    btb_bank0_rd_data_way0_p1_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way1_p1_f : UInt<22>
    btb_bank0_rd_data_way1_p1_f <= UInt<1>("h00")
    wire eoc_mask : UInt<1>
    eoc_mask <= UInt<1>("h00")
    wire btb_lru_b0_f : UInt<16>
    btb_lru_b0_f <= UInt<1>("h00")
    wire dec_tlu_way_wb : UInt<1>
    dec_tlu_way_wb <= UInt<1>("h00")
    wire btb_vlru_rd_f : UInt<2>
    btb_vlru_rd_f <= UInt<1>("h00")
    wire vwayhit_f : UInt<2>
    vwayhit_f <= UInt<1>("h00")
    wire tag_match_vway1_expanded_f : UInt<2>
    tag_match_vway1_expanded_f <= UInt<1>("h00")
    wire wayhit_f : UInt<2>
    wayhit_f <= UInt<1>("h00")
    wire wayhit_p1_f : UInt<2>
    wayhit_p1_f <= UInt<1>("h00")
    wire way_raw : UInt<2>
    way_raw <= UInt<1>("h00")
    wire exu_flush_final_d1 : UInt<1>
    exu_flush_final_d1 <= UInt<1>("h00")
    node _T = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 82:58]
    node exu_mp_valid = and(io.exu_bp.exu_mp_pkt.bits.misp, _T) @[ifu_bp_ctl.scala 82:56]
    wire exu_mp_way_f : UInt<1>
    exu_mp_way_f <= UInt<1>("h00")
    node _T_1 = or(io.dec_bp.dec_tlu_br0_r_pkt.bits.br_start_error, io.dec_bp.dec_tlu_br0_r_pkt.bits.br_error) @[ifu_bp_ctl.scala 105:50]
    dec_tlu_error_wb <= _T_1 @[ifu_bp_ctl.scala 105:20]
    btb_error_addr_wb <= io.exu_bp.exu_i0_br_index_r @[ifu_bp_ctl.scala 106:21]
    dec_tlu_way_wb <= io.dec_bp.dec_tlu_br0_r_pkt.bits.way @[ifu_bp_ctl.scala 107:18]
    node _T_2 = bits(io.ifc_fetch_addr_f, 8, 1) @[lib.scala 51:13]
    node _T_3 = bits(io.ifc_fetch_addr_f, 16, 9) @[lib.scala 51:51]
    node _T_4 = xor(_T_2, _T_3) @[lib.scala 51:47]
    node _T_5 = bits(io.ifc_fetch_addr_f, 24, 17) @[lib.scala 51:89]
    node btb_rd_addr_f = xor(_T_4, _T_5) @[lib.scala 51:85]
    node _T_6 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_bp_ctl.scala 113:44]
    node _T_7 = add(_T_6, UInt<1>("h01")) @[ifu_bp_ctl.scala 113:51]
    node fetch_addr_p1_f = tail(_T_7, 1) @[ifu_bp_ctl.scala 113:51]
    node _T_8 = cat(fetch_addr_p1_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_9 = bits(_T_8, 8, 1) @[lib.scala 51:13]
    node _T_10 = bits(_T_8, 16, 9) @[lib.scala 51:51]
    node _T_11 = xor(_T_9, _T_10) @[lib.scala 51:47]
    node _T_12 = bits(_T_8, 24, 17) @[lib.scala 51:89]
    node btb_rd_addr_p1_f = xor(_T_11, _T_12) @[lib.scala 51:85]
    node _T_13 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 119:33]
    node _T_14 = not(_T_13) @[ifu_bp_ctl.scala 119:23]
    node _T_15 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 119:46]
    node btb_sel_f = cat(_T_14, _T_15) @[Cat.scala 29:58]
    node _T_16 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 122:46]
    node _T_17 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 122:70]
    node _T_18 = not(_T_17) @[ifu_bp_ctl.scala 122:50]
    node fetch_start_f = cat(_T_16, _T_18) @[Cat.scala 29:58]
    node _T_19 = eq(btb_error_addr_wb, btb_rd_addr_f) @[ifu_bp_ctl.scala 125:72]
    node branch_error_collision_f = and(dec_tlu_error_wb, _T_19) @[ifu_bp_ctl.scala 125:51]
    node _T_20 = eq(btb_error_addr_wb, btb_rd_addr_p1_f) @[ifu_bp_ctl.scala 126:75]
    node branch_error_collision_p1_f = and(dec_tlu_error_wb, _T_20) @[ifu_bp_ctl.scala 126:54]
    node branch_error_bank_conflict_f = and(branch_error_collision_f, dec_tlu_error_wb) @[ifu_bp_ctl.scala 129:63]
    node branch_error_bank_conflict_p1_f = and(branch_error_collision_p1_f, dec_tlu_error_wb) @[ifu_bp_ctl.scala 130:69]
    node _T_21 = and(io.dec_bp.dec_tlu_flush_leak_one_wb, io.dec_tlu_flush_lower_wb) @[ifu_bp_ctl.scala 135:54]
    node _T_22 = eq(io.dec_tlu_flush_lower_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 135:102]
    node _T_23 = and(leak_one_f_d1, _T_22) @[ifu_bp_ctl.scala 135:100]
    node _T_24 = or(_T_21, _T_23) @[ifu_bp_ctl.scala 135:83]
    leak_one_f <= _T_24 @[ifu_bp_ctl.scala 135:14]
    node _T_25 = bits(io.ifc_fetch_addr_f, 13, 9) @[lib.scala 42:32]
    node _T_26 = bits(io.ifc_fetch_addr_f, 18, 14) @[lib.scala 42:32]
    node _T_27 = bits(io.ifc_fetch_addr_f, 23, 19) @[lib.scala 42:32]
    wire _T_28 : UInt<5>[3] @[lib.scala 42:24]
    _T_28[0] <= _T_25 @[lib.scala 42:24]
    _T_28[1] <= _T_26 @[lib.scala 42:24]
    _T_28[2] <= _T_27 @[lib.scala 42:24]
    node _T_29 = xor(_T_28[0], _T_28[1]) @[lib.scala 42:111]
    node fetch_rd_tag_f = xor(_T_29, _T_28[2]) @[lib.scala 42:111]
    node _T_30 = cat(fetch_addr_p1_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_31 = bits(_T_30, 13, 9) @[lib.scala 42:32]
    node _T_32 = bits(_T_30, 18, 14) @[lib.scala 42:32]
    node _T_33 = bits(_T_30, 23, 19) @[lib.scala 42:32]
    wire _T_34 : UInt<5>[3] @[lib.scala 42:24]
    _T_34[0] <= _T_31 @[lib.scala 42:24]
    _T_34[1] <= _T_32 @[lib.scala 42:24]
    _T_34[2] <= _T_33 @[lib.scala 42:24]
    node _T_35 = xor(_T_34[0], _T_34[1]) @[lib.scala 42:111]
    node fetch_rd_tag_p1_f = xor(_T_35, _T_34[2]) @[lib.scala 42:111]
    node _T_36 = eq(io.exu_bp.exu_mp_btag, fetch_rd_tag_f) @[ifu_bp_ctl.scala 140:53]
    node _T_37 = and(_T_36, exu_mp_valid) @[ifu_bp_ctl.scala 140:73]
    node _T_38 = and(_T_37, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 140:88]
    node _T_39 = eq(io.exu_bp.exu_mp_index, btb_rd_addr_f) @[ifu_bp_ctl.scala 140:124]
    node fetch_mp_collision_f = and(_T_38, _T_39) @[ifu_bp_ctl.scala 140:109]
    node _T_40 = eq(io.exu_bp.exu_mp_btag, fetch_rd_tag_p1_f) @[ifu_bp_ctl.scala 141:56]
    node _T_41 = and(_T_40, exu_mp_valid) @[ifu_bp_ctl.scala 141:79]
    node _T_42 = and(_T_41, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 141:94]
    node _T_43 = eq(io.exu_bp.exu_mp_index, btb_rd_addr_p1_f) @[ifu_bp_ctl.scala 141:130]
    node fetch_mp_collision_p1_f = and(_T_42, _T_43) @[ifu_bp_ctl.scala 141:115]
    node _T_44 = bits(btb_bank0_rd_data_way0_f, 0, 0) @[ifu_bp_ctl.scala 144:50]
    node _T_45 = bits(btb_bank0_rd_data_way0_f, 21, 17) @[ifu_bp_ctl.scala 144:82]
    node _T_46 = eq(_T_45, fetch_rd_tag_f) @[ifu_bp_ctl.scala 144:98]
    node _T_47 = and(_T_44, _T_46) @[ifu_bp_ctl.scala 144:55]
    node _T_48 = and(dec_tlu_way_wb, branch_error_bank_conflict_f) @[ifu_bp_ctl.scala 145:22]
    node _T_49 = eq(_T_48, UInt<1>("h00")) @[ifu_bp_ctl.scala 145:5]
    node _T_50 = and(_T_47, _T_49) @[ifu_bp_ctl.scala 144:118]
    node _T_51 = and(_T_50, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 145:54]
    node _T_52 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 145:77]
    node tag_match_way0_f = and(_T_51, _T_52) @[ifu_bp_ctl.scala 145:75]
    node _T_53 = bits(btb_bank0_rd_data_way1_f, 0, 0) @[ifu_bp_ctl.scala 148:50]
    node _T_54 = bits(btb_bank0_rd_data_way1_f, 21, 17) @[ifu_bp_ctl.scala 148:82]
    node _T_55 = eq(_T_54, fetch_rd_tag_f) @[ifu_bp_ctl.scala 148:98]
    node _T_56 = and(_T_53, _T_55) @[ifu_bp_ctl.scala 148:55]
    node _T_57 = and(dec_tlu_way_wb, branch_error_bank_conflict_f) @[ifu_bp_ctl.scala 149:22]
    node _T_58 = eq(_T_57, UInt<1>("h00")) @[ifu_bp_ctl.scala 149:5]
    node _T_59 = and(_T_56, _T_58) @[ifu_bp_ctl.scala 148:118]
    node _T_60 = and(_T_59, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 149:54]
    node _T_61 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 149:77]
    node tag_match_way1_f = and(_T_60, _T_61) @[ifu_bp_ctl.scala 149:75]
    node _T_62 = bits(btb_bank0_rd_data_way0_p1_f, 0, 0) @[ifu_bp_ctl.scala 152:56]
    node _T_63 = bits(btb_bank0_rd_data_way0_p1_f, 21, 17) @[ifu_bp_ctl.scala 152:91]
    node _T_64 = eq(_T_63, fetch_rd_tag_p1_f) @[ifu_bp_ctl.scala 152:107]
    node _T_65 = and(_T_62, _T_64) @[ifu_bp_ctl.scala 152:61]
    node _T_66 = and(dec_tlu_way_wb, branch_error_bank_conflict_p1_f) @[ifu_bp_ctl.scala 153:22]
    node _T_67 = eq(_T_66, UInt<1>("h00")) @[ifu_bp_ctl.scala 153:5]
    node _T_68 = and(_T_65, _T_67) @[ifu_bp_ctl.scala 152:130]
    node _T_69 = and(_T_68, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 153:57]
    node _T_70 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 153:80]
    node tag_match_way0_p1_f = and(_T_69, _T_70) @[ifu_bp_ctl.scala 153:78]
    node _T_71 = bits(btb_bank0_rd_data_way1_p1_f, 0, 0) @[ifu_bp_ctl.scala 155:56]
    node _T_72 = bits(btb_bank0_rd_data_way1_p1_f, 21, 17) @[ifu_bp_ctl.scala 155:91]
    node _T_73 = eq(_T_72, fetch_rd_tag_p1_f) @[ifu_bp_ctl.scala 155:107]
    node _T_74 = and(_T_71, _T_73) @[ifu_bp_ctl.scala 155:61]
    node _T_75 = and(dec_tlu_way_wb, branch_error_bank_conflict_p1_f) @[ifu_bp_ctl.scala 156:22]
    node _T_76 = eq(_T_75, UInt<1>("h00")) @[ifu_bp_ctl.scala 156:5]
    node _T_77 = and(_T_74, _T_76) @[ifu_bp_ctl.scala 155:130]
    node _T_78 = and(_T_77, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 156:57]
    node _T_79 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 156:80]
    node tag_match_way1_p1_f = and(_T_78, _T_79) @[ifu_bp_ctl.scala 156:78]
    node _T_80 = bits(btb_bank0_rd_data_way0_f, 3, 3) @[ifu_bp_ctl.scala 159:83]
    node _T_81 = bits(btb_bank0_rd_data_way0_f, 4, 4) @[ifu_bp_ctl.scala 159:116]
    node _T_82 = xor(_T_80, _T_81) @[ifu_bp_ctl.scala 159:90]
    node _T_83 = and(tag_match_way0_f, _T_82) @[ifu_bp_ctl.scala 159:56]
    node _T_84 = bits(btb_bank0_rd_data_way0_f, 3, 3) @[ifu_bp_ctl.scala 160:50]
    node _T_85 = bits(btb_bank0_rd_data_way0_f, 4, 4) @[ifu_bp_ctl.scala 160:83]
    node _T_86 = xor(_T_84, _T_85) @[ifu_bp_ctl.scala 160:57]
    node _T_87 = eq(_T_86, UInt<1>("h00")) @[ifu_bp_ctl.scala 160:24]
    node _T_88 = and(tag_match_way0_f, _T_87) @[ifu_bp_ctl.scala 160:22]
    node tag_match_way0_expanded_f = cat(_T_83, _T_88) @[Cat.scala 29:58]
    node _T_89 = bits(btb_bank0_rd_data_way1_f, 3, 3) @[ifu_bp_ctl.scala 162:83]
    node _T_90 = bits(btb_bank0_rd_data_way1_f, 4, 4) @[ifu_bp_ctl.scala 162:116]
    node _T_91 = xor(_T_89, _T_90) @[ifu_bp_ctl.scala 162:90]
    node _T_92 = and(tag_match_way1_f, _T_91) @[ifu_bp_ctl.scala 162:56]
    node _T_93 = bits(btb_bank0_rd_data_way1_f, 3, 3) @[ifu_bp_ctl.scala 163:50]
    node _T_94 = bits(btb_bank0_rd_data_way1_f, 4, 4) @[ifu_bp_ctl.scala 163:83]
    node _T_95 = xor(_T_93, _T_94) @[ifu_bp_ctl.scala 163:57]
    node _T_96 = eq(_T_95, UInt<1>("h00")) @[ifu_bp_ctl.scala 163:24]
    node _T_97 = and(tag_match_way1_f, _T_96) @[ifu_bp_ctl.scala 163:22]
    node tag_match_way1_expanded_f = cat(_T_92, _T_97) @[Cat.scala 29:58]
    node _T_98 = bits(btb_bank0_rd_data_way0_p1_f, 3, 3) @[ifu_bp_ctl.scala 165:92]
    node _T_99 = bits(btb_bank0_rd_data_way0_p1_f, 4, 4) @[ifu_bp_ctl.scala 165:128]
    node _T_100 = xor(_T_98, _T_99) @[ifu_bp_ctl.scala 165:99]
    node _T_101 = and(tag_match_way0_p1_f, _T_100) @[ifu_bp_ctl.scala 165:62]
    node _T_102 = bits(btb_bank0_rd_data_way0_p1_f, 3, 3) @[ifu_bp_ctl.scala 166:56]
    node _T_103 = bits(btb_bank0_rd_data_way0_p1_f, 4, 4) @[ifu_bp_ctl.scala 166:92]
    node _T_104 = xor(_T_102, _T_103) @[ifu_bp_ctl.scala 166:63]
    node _T_105 = eq(_T_104, UInt<1>("h00")) @[ifu_bp_ctl.scala 166:27]
    node _T_106 = and(tag_match_way0_p1_f, _T_105) @[ifu_bp_ctl.scala 166:25]
    node tag_match_way0_expanded_p1_f = cat(_T_101, _T_106) @[Cat.scala 29:58]
    node _T_107 = bits(btb_bank0_rd_data_way1_p1_f, 3, 3) @[ifu_bp_ctl.scala 168:92]
    node _T_108 = bits(btb_bank0_rd_data_way1_p1_f, 4, 4) @[ifu_bp_ctl.scala 168:128]
    node _T_109 = xor(_T_107, _T_108) @[ifu_bp_ctl.scala 168:99]
    node _T_110 = and(tag_match_way1_p1_f, _T_109) @[ifu_bp_ctl.scala 168:62]
    node _T_111 = bits(btb_bank0_rd_data_way1_p1_f, 3, 3) @[ifu_bp_ctl.scala 169:56]
    node _T_112 = bits(btb_bank0_rd_data_way1_p1_f, 4, 4) @[ifu_bp_ctl.scala 169:92]
    node _T_113 = xor(_T_111, _T_112) @[ifu_bp_ctl.scala 169:63]
    node _T_114 = eq(_T_113, UInt<1>("h00")) @[ifu_bp_ctl.scala 169:27]
    node _T_115 = and(tag_match_way1_p1_f, _T_114) @[ifu_bp_ctl.scala 169:25]
    node tag_match_way1_expanded_p1_f = cat(_T_110, _T_115) @[Cat.scala 29:58]
    node _T_116 = or(tag_match_way0_expanded_f, tag_match_way1_expanded_f) @[ifu_bp_ctl.scala 172:41]
    wayhit_f <= _T_116 @[ifu_bp_ctl.scala 172:12]
    node _T_117 = or(tag_match_way0_expanded_p1_f, tag_match_way1_expanded_p1_f) @[ifu_bp_ctl.scala 174:47]
    wayhit_p1_f <= _T_117 @[ifu_bp_ctl.scala 174:15]
    node _T_118 = bits(tag_match_way0_expanded_f, 0, 0) @[ifu_bp_ctl.scala 178:65]
    node _T_119 = bits(_T_118, 0, 0) @[ifu_bp_ctl.scala 178:69]
    node _T_120 = bits(tag_match_way1_expanded_f, 0, 0) @[ifu_bp_ctl.scala 179:30]
    node _T_121 = bits(_T_120, 0, 0) @[ifu_bp_ctl.scala 179:34]
    node _T_122 = mux(_T_119, btb_bank0_rd_data_way0_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_123 = mux(_T_121, btb_bank0_rd_data_way1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_124 = or(_T_122, _T_123) @[Mux.scala 27:72]
    wire btb_bank0e_rd_data_f : UInt<22> @[Mux.scala 27:72]
    btb_bank0e_rd_data_f <= _T_124 @[Mux.scala 27:72]
    node _T_125 = bits(tag_match_way0_expanded_f, 1, 1) @[ifu_bp_ctl.scala 181:65]
    node _T_126 = bits(_T_125, 0, 0) @[ifu_bp_ctl.scala 181:69]
    node _T_127 = bits(tag_match_way1_expanded_f, 1, 1) @[ifu_bp_ctl.scala 182:30]
    node _T_128 = bits(_T_127, 0, 0) @[ifu_bp_ctl.scala 182:34]
    node _T_129 = mux(_T_126, btb_bank0_rd_data_way0_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_130 = mux(_T_128, btb_bank0_rd_data_way1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_131 = or(_T_129, _T_130) @[Mux.scala 27:72]
    wire btb_bank0o_rd_data_f : UInt<22> @[Mux.scala 27:72]
    btb_bank0o_rd_data_f <= _T_131 @[Mux.scala 27:72]
    node _T_132 = bits(tag_match_way0_expanded_p1_f, 0, 0) @[ifu_bp_ctl.scala 184:71]
    node _T_133 = bits(_T_132, 0, 0) @[ifu_bp_ctl.scala 184:75]
    node _T_134 = bits(tag_match_way1_expanded_p1_f, 0, 0) @[ifu_bp_ctl.scala 185:33]
    node _T_135 = bits(_T_134, 0, 0) @[ifu_bp_ctl.scala 185:37]
    node _T_136 = mux(_T_133, btb_bank0_rd_data_way0_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_137 = mux(_T_135, btb_bank0_rd_data_way1_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_138 = or(_T_136, _T_137) @[Mux.scala 27:72]
    wire btb_bank0e_rd_data_p1_f : UInt<22> @[Mux.scala 27:72]
    btb_bank0e_rd_data_p1_f <= _T_138 @[Mux.scala 27:72]
    node _T_139 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 189:57]
    node _T_140 = eq(_T_139, UInt<1>("h00")) @[ifu_bp_ctl.scala 189:37]
    node _T_141 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 190:24]
    node _T_142 = mux(_T_140, btb_bank0e_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_143 = mux(_T_141, btb_bank0o_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_144 = or(_T_142, _T_143) @[Mux.scala 27:72]
    wire _T_145 : UInt<22> @[Mux.scala 27:72]
    _T_145 <= _T_144 @[Mux.scala 27:72]
    btb_vbank0_rd_data_f <= _T_145 @[ifu_bp_ctl.scala 189:24]
    node _T_146 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 191:57]
    node _T_147 = eq(_T_146, UInt<1>("h00")) @[ifu_bp_ctl.scala 191:37]
    node _T_148 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 192:24]
    node _T_149 = mux(_T_147, btb_bank0o_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_150 = mux(_T_148, btb_bank0e_rd_data_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_151 = or(_T_149, _T_150) @[Mux.scala 27:72]
    wire _T_152 : UInt<22> @[Mux.scala 27:72]
    _T_152 <= _T_151 @[Mux.scala 27:72]
    btb_vbank1_rd_data_f <= _T_152 @[ifu_bp_ctl.scala 191:24]
    node _T_153 = not(vwayhit_f) @[ifu_bp_ctl.scala 194:44]
    node _T_154 = and(_T_153, btb_vlru_rd_f) @[ifu_bp_ctl.scala 194:55]
    node _T_155 = or(tag_match_vway1_expanded_f, _T_154) @[ifu_bp_ctl.scala 194:41]
    way_raw <= _T_155 @[ifu_bp_ctl.scala 194:11]
    node mp_wrindex_dec = dshl(UInt<1>("h01"), io.exu_bp.exu_mp_index) @[ifu_bp_ctl.scala 210:28]
    node fetch_wrindex_dec = dshl(UInt<1>("h01"), btb_rd_addr_f) @[ifu_bp_ctl.scala 213:31]
    node fetch_wrindex_p1_dec = dshl(UInt<1>("h01"), btb_rd_addr_p1_f) @[ifu_bp_ctl.scala 216:34]
    node _T_156 = bits(exu_mp_valid, 0, 0) @[Bitwise.scala 72:15]
    node _T_157 = mux(_T_156, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node mp_wrlru_b0 = and(mp_wrindex_dec, _T_157) @[ifu_bp_ctl.scala 219:36]
    node _T_158 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 222:38]
    node _T_159 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 222:53]
    node _T_160 = or(_T_158, _T_159) @[ifu_bp_ctl.scala 222:42]
    node _T_161 = and(_T_160, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 222:58]
    node _T_162 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 222:81]
    node lru_update_valid_f = and(_T_161, _T_162) @[ifu_bp_ctl.scala 222:79]
    node _T_163 = bits(lru_update_valid_f, 0, 0) @[Bitwise.scala 72:15]
    node _T_164 = mux(_T_163, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node fetch_wrlru_b0 = and(fetch_wrindex_dec, _T_164) @[ifu_bp_ctl.scala 224:42]
    node _T_165 = bits(lru_update_valid_f, 0, 0) @[Bitwise.scala 72:15]
    node _T_166 = mux(_T_165, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node fetch_wrlru_p1_b0 = and(fetch_wrindex_p1_dec, _T_166) @[ifu_bp_ctl.scala 225:48]
    node _T_167 = not(mp_wrlru_b0) @[ifu_bp_ctl.scala 227:25]
    node _T_168 = not(fetch_wrlru_b0) @[ifu_bp_ctl.scala 227:40]
    node btb_lru_b0_hold = and(_T_167, _T_168) @[ifu_bp_ctl.scala 227:38]
    node _T_169 = bits(io.exu_bp.exu_mp_pkt.bits.way, 0, 0) @[ifu_bp_ctl.scala 234:51]
    node _T_170 = eq(_T_169, UInt<1>("h00")) @[ifu_bp_ctl.scala 234:39]
    node _T_171 = bits(tag_match_way0_f, 0, 0) @[ifu_bp_ctl.scala 235:22]
    node _T_172 = bits(tag_match_way0_p1_f, 0, 0) @[ifu_bp_ctl.scala 236:25]
    node _T_173 = mux(_T_170, mp_wrlru_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_174 = mux(_T_171, fetch_wrlru_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_175 = mux(_T_172, fetch_wrlru_p1_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_176 = or(_T_173, _T_174) @[Mux.scala 27:72]
    node _T_177 = or(_T_176, _T_175) @[Mux.scala 27:72]
    wire _T_178 : UInt<256> @[Mux.scala 27:72]
    _T_178 <= _T_177 @[Mux.scala 27:72]
    node _T_179 = and(btb_lru_b0_hold, btb_lru_b0_f) @[ifu_bp_ctl.scala 236:73]
    node btb_lru_b0_ns = or(_T_178, _T_179) @[ifu_bp_ctl.scala 236:55]
    node _T_180 = bits(fetch_mp_collision_f, 0, 0) @[ifu_bp_ctl.scala 239:37]
    node _T_181 = and(fetch_wrindex_dec, btb_lru_b0_f) @[ifu_bp_ctl.scala 239:78]
    node _T_182 = orr(_T_181) @[ifu_bp_ctl.scala 239:94]
    node btb_lru_rd_f = mux(_T_180, exu_mp_way_f, _T_182) @[ifu_bp_ctl.scala 239:25]
    node _T_183 = bits(fetch_mp_collision_p1_f, 0, 0) @[ifu_bp_ctl.scala 241:43]
    node _T_184 = and(fetch_wrindex_p1_dec, btb_lru_b0_f) @[ifu_bp_ctl.scala 241:87]
    node _T_185 = orr(_T_184) @[ifu_bp_ctl.scala 241:103]
    node btb_lru_rd_p1_f = mux(_T_183, exu_mp_way_f, _T_185) @[ifu_bp_ctl.scala 241:28]
    node _T_186 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 244:50]
    node _T_187 = eq(_T_186, UInt<1>("h00")) @[ifu_bp_ctl.scala 244:30]
    node _T_188 = cat(btb_lru_rd_f, btb_lru_rd_f) @[Cat.scala 29:58]
    node _T_189 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 245:24]
    node _T_190 = bits(_T_189, 0, 0) @[ifu_bp_ctl.scala 245:28]
    node _T_191 = cat(btb_lru_rd_p1_f, btb_lru_rd_f) @[Cat.scala 29:58]
    node _T_192 = mux(_T_187, _T_188, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_193 = mux(_T_190, _T_191, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_194 = or(_T_192, _T_193) @[Mux.scala 27:72]
    wire _T_195 : UInt<2> @[Mux.scala 27:72]
    _T_195 <= _T_194 @[Mux.scala 27:72]
    btb_vlru_rd_f <= _T_195 @[ifu_bp_ctl.scala 244:17]
    node _T_196 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 248:63]
    node _T_197 = bits(_T_196, 0, 0) @[ifu_bp_ctl.scala 248:67]
    node _T_198 = eq(_T_197, UInt<1>("h00")) @[ifu_bp_ctl.scala 248:43]
    node _T_199 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 249:24]
    node _T_200 = bits(_T_199, 0, 0) @[ifu_bp_ctl.scala 249:28]
    node _T_201 = bits(tag_match_way1_expanded_p1_f, 0, 0) @[ifu_bp_ctl.scala 249:70]
    node _T_202 = bits(tag_match_way1_expanded_f, 1, 1) @[ifu_bp_ctl.scala 249:100]
    node _T_203 = cat(_T_201, _T_202) @[Cat.scala 29:58]
    node _T_204 = mux(_T_198, tag_match_way1_expanded_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_205 = mux(_T_200, _T_203, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_206 = or(_T_204, _T_205) @[Mux.scala 27:72]
    wire _T_207 : UInt<2> @[Mux.scala 27:72]
    _T_207 <= _T_206 @[Mux.scala 27:72]
    tag_match_vway1_expanded_f <= _T_207 @[ifu_bp_ctl.scala 248:30]
    node _T_208 = or(io.ifc_fetch_req_f, exu_mp_valid) @[ifu_bp_ctl.scala 251:60]
    node _T_209 = bits(_T_208, 0, 0) @[ifu_bp_ctl.scala 251:75]
    inst rvclkhdr of rvclkhdr @[lib.scala 399:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr.io.en <= _T_209 @[lib.scala 402:17]
    rvclkhdr.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_210 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_209 : @[Reg.scala 28:19]
      _T_210 <= btb_lru_b0_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    btb_lru_b0_f <= _T_210 @[ifu_bp_ctl.scala 251:16]
    io.ifu_bp_way_f <= way_raw @[ifu_bp_ctl.scala 254:19]
    node _T_211 = bits(io.ifc_fetch_addr_f, 4, 2) @[ifu_bp_ctl.scala 258:37]
    node eoc_near = andr(_T_211) @[ifu_bp_ctl.scala 258:64]
    node _T_212 = eq(eoc_near, UInt<1>("h00")) @[ifu_bp_ctl.scala 260:15]
    node _T_213 = bits(io.ifc_fetch_addr_f, 1, 0) @[ifu_bp_ctl.scala 260:48]
    node _T_214 = not(_T_213) @[ifu_bp_ctl.scala 260:28]
    node _T_215 = orr(_T_214) @[ifu_bp_ctl.scala 260:58]
    node _T_216 = or(_T_212, _T_215) @[ifu_bp_ctl.scala 260:25]
    eoc_mask <= _T_216 @[ifu_bp_ctl.scala 260:12]
    wire btb_sel_data_f : UInt<16>
    btb_sel_data_f <= UInt<1>("h00")
    wire hist1_raw : UInt<2>
    hist1_raw <= UInt<1>("h00")
    node btb_rd_tgt_f = bits(btb_sel_data_f, 15, 4) @[ifu_bp_ctl.scala 267:36]
    node btb_rd_pc4_f = bits(btb_sel_data_f, 3, 3) @[ifu_bp_ctl.scala 268:36]
    node btb_rd_call_f = bits(btb_sel_data_f, 1, 1) @[ifu_bp_ctl.scala 269:37]
    node btb_rd_ret_f = bits(btb_sel_data_f, 0, 0) @[ifu_bp_ctl.scala 270:36]
    node _T_217 = bits(btb_sel_f, 1, 1) @[ifu_bp_ctl.scala 273:40]
    node _T_218 = bits(_T_217, 0, 0) @[ifu_bp_ctl.scala 273:44]
    node _T_219 = bits(btb_vbank1_rd_data_f, 16, 1) @[ifu_bp_ctl.scala 273:73]
    node _T_220 = bits(btb_sel_f, 0, 0) @[ifu_bp_ctl.scala 274:40]
    node _T_221 = bits(_T_220, 0, 0) @[ifu_bp_ctl.scala 274:44]
    node _T_222 = bits(btb_vbank0_rd_data_f, 16, 1) @[ifu_bp_ctl.scala 274:73]
    node _T_223 = mux(_T_218, _T_219, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_224 = mux(_T_221, _T_222, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_225 = or(_T_223, _T_224) @[Mux.scala 27:72]
    wire _T_226 : UInt<16> @[Mux.scala 27:72]
    _T_226 <= _T_225 @[Mux.scala 27:72]
    btb_sel_data_f <= _T_226 @[ifu_bp_ctl.scala 273:18]
    node _T_227 = and(vwayhit_f, hist1_raw) @[ifu_bp_ctl.scala 277:39]
    node _T_228 = orr(_T_227) @[ifu_bp_ctl.scala 277:52]
    node _T_229 = and(_T_228, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 277:56]
    node _T_230 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 277:79]
    node _T_231 = and(_T_229, _T_230) @[ifu_bp_ctl.scala 277:77]
    node _T_232 = eq(io.dec_bp.dec_tlu_bpred_disable, UInt<1>("h00")) @[ifu_bp_ctl.scala 277:96]
    node _T_233 = and(_T_231, _T_232) @[ifu_bp_ctl.scala 277:94]
    io.ifu_bp_hit_taken_f <= _T_233 @[ifu_bp_ctl.scala 277:25]
    node _T_234 = bits(btb_vbank1_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 280:52]
    node _T_235 = bits(btb_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 280:81]
    node _T_236 = or(_T_234, _T_235) @[ifu_bp_ctl.scala 280:59]
    node _T_237 = bits(btb_vbank0_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 281:52]
    node _T_238 = bits(btb_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 281:81]
    node _T_239 = or(_T_237, _T_238) @[ifu_bp_ctl.scala 281:59]
    node bht_force_taken_f = cat(_T_236, _T_239) @[Cat.scala 29:58]
    wire bht_bank1_rd_data_f : UInt<2>
    bht_bank1_rd_data_f <= UInt<1>("h00")
    wire bht_bank0_rd_data_f : UInt<2>
    bht_bank0_rd_data_f <= UInt<1>("h00")
    wire bht_bank0_rd_data_p1_f : UInt<2>
    bht_bank0_rd_data_p1_f <= UInt<1>("h00")
    node _T_240 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 290:60]
    node _T_241 = bits(_T_240, 0, 0) @[ifu_bp_ctl.scala 290:64]
    node _T_242 = eq(_T_241, UInt<1>("h00")) @[ifu_bp_ctl.scala 290:40]
    node _T_243 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 291:60]
    node _T_244 = bits(_T_243, 0, 0) @[ifu_bp_ctl.scala 291:64]
    node _T_245 = mux(_T_242, bht_bank0_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_246 = mux(_T_244, bht_bank1_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_247 = or(_T_245, _T_246) @[Mux.scala 27:72]
    wire bht_vbank0_rd_data_f : UInt<2> @[Mux.scala 27:72]
    bht_vbank0_rd_data_f <= _T_247 @[Mux.scala 27:72]
    node _T_248 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 293:60]
    node _T_249 = bits(_T_248, 0, 0) @[ifu_bp_ctl.scala 293:64]
    node _T_250 = eq(_T_249, UInt<1>("h00")) @[ifu_bp_ctl.scala 293:40]
    node _T_251 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 294:60]
    node _T_252 = bits(_T_251, 0, 0) @[ifu_bp_ctl.scala 294:64]
    node _T_253 = mux(_T_250, bht_bank1_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_254 = mux(_T_252, bht_bank0_rd_data_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_255 = or(_T_253, _T_254) @[Mux.scala 27:72]
    wire bht_vbank1_rd_data_f : UInt<2> @[Mux.scala 27:72]
    bht_vbank1_rd_data_f <= _T_255 @[Mux.scala 27:72]
    node _T_256 = bits(bht_force_taken_f, 1, 1) @[ifu_bp_ctl.scala 298:38]
    node _T_257 = bits(bht_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 298:64]
    node _T_258 = or(_T_256, _T_257) @[ifu_bp_ctl.scala 298:42]
    node _T_259 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 298:82]
    node _T_260 = and(_T_258, _T_259) @[ifu_bp_ctl.scala 298:69]
    node _T_261 = bits(bht_force_taken_f, 0, 0) @[ifu_bp_ctl.scala 299:41]
    node _T_262 = bits(bht_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 299:67]
    node _T_263 = or(_T_261, _T_262) @[ifu_bp_ctl.scala 299:45]
    node _T_264 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 299:85]
    node _T_265 = and(_T_263, _T_264) @[ifu_bp_ctl.scala 299:72]
    node _T_266 = cat(_T_260, _T_265) @[Cat.scala 29:58]
    bht_dir_f <= _T_266 @[ifu_bp_ctl.scala 298:13]
    node _T_267 = bits(btb_sel_f, 1, 1) @[ifu_bp_ctl.scala 302:62]
    node _T_268 = and(io.ifu_bp_hit_taken_f, _T_267) @[ifu_bp_ctl.scala 302:51]
    node _T_269 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 302:69]
    node _T_270 = or(_T_268, _T_269) @[ifu_bp_ctl.scala 302:67]
    io.ifu_bp_inst_mask_f <= _T_270 @[ifu_bp_ctl.scala 302:25]
    node _T_271 = bits(bht_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 305:60]
    node _T_272 = bits(bht_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 305:85]
    node _T_273 = cat(_T_271, _T_272) @[Cat.scala 29:58]
    node _T_274 = or(bht_force_taken_f, _T_273) @[ifu_bp_ctl.scala 305:34]
    hist1_raw <= _T_274 @[ifu_bp_ctl.scala 305:13]
    node _T_275 = bits(bht_vbank1_rd_data_f, 0, 0) @[ifu_bp_ctl.scala 308:43]
    node _T_276 = bits(bht_vbank0_rd_data_f, 0, 0) @[ifu_bp_ctl.scala 308:68]
    node hist0_raw = cat(_T_275, _T_276) @[Cat.scala 29:58]
    node _T_277 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 311:30]
    node _T_278 = bits(btb_vbank1_rd_data_f, 4, 4) @[ifu_bp_ctl.scala 311:56]
    node _T_279 = and(_T_277, _T_278) @[ifu_bp_ctl.scala 311:34]
    node _T_280 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 312:30]
    node _T_281 = bits(btb_vbank0_rd_data_f, 4, 4) @[ifu_bp_ctl.scala 312:56]
    node _T_282 = and(_T_280, _T_281) @[ifu_bp_ctl.scala 312:34]
    node pc4_raw = cat(_T_279, _T_282) @[Cat.scala 29:58]
    node _T_283 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 315:31]
    node _T_284 = bits(btb_vbank1_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 315:58]
    node _T_285 = eq(_T_284, UInt<1>("h00")) @[ifu_bp_ctl.scala 315:37]
    node _T_286 = and(_T_283, _T_285) @[ifu_bp_ctl.scala 315:35]
    node _T_287 = bits(btb_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 315:87]
    node _T_288 = and(_T_286, _T_287) @[ifu_bp_ctl.scala 315:65]
    node _T_289 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 316:31]
    node _T_290 = bits(btb_vbank0_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 316:58]
    node _T_291 = eq(_T_290, UInt<1>("h00")) @[ifu_bp_ctl.scala 316:37]
    node _T_292 = and(_T_289, _T_291) @[ifu_bp_ctl.scala 316:35]
    node _T_293 = bits(btb_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 316:87]
    node _T_294 = and(_T_292, _T_293) @[ifu_bp_ctl.scala 316:65]
    node pret_raw = cat(_T_288, _T_294) @[Cat.scala 29:58]
    node _T_295 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 319:31]
    node _T_296 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 319:49]
    node num_valids = add(_T_295, _T_296) @[ifu_bp_ctl.scala 319:35]
    node _T_297 = and(btb_sel_f, bht_dir_f) @[ifu_bp_ctl.scala 322:28]
    node final_h = orr(_T_297) @[ifu_bp_ctl.scala 322:41]
    wire fghr : UInt<8>
    fghr <= UInt<1>("h00")
    node _T_298 = eq(num_valids, UInt<2>("h02")) @[ifu_bp_ctl.scala 326:41]
    node _T_299 = bits(_T_298, 0, 0) @[ifu_bp_ctl.scala 326:49]
    node _T_300 = bits(fghr, 5, 0) @[ifu_bp_ctl.scala 326:65]
    node _T_301 = cat(_T_300, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_302 = cat(_T_301, final_h) @[Cat.scala 29:58]
    node _T_303 = eq(num_valids, UInt<1>("h01")) @[ifu_bp_ctl.scala 327:41]
    node _T_304 = bits(_T_303, 0, 0) @[ifu_bp_ctl.scala 327:49]
    node _T_305 = bits(fghr, 6, 0) @[ifu_bp_ctl.scala 327:65]
    node _T_306 = cat(_T_305, final_h) @[Cat.scala 29:58]
    node _T_307 = eq(num_valids, UInt<1>("h00")) @[ifu_bp_ctl.scala 328:41]
    node _T_308 = bits(_T_307, 0, 0) @[ifu_bp_ctl.scala 328:49]
    node _T_309 = bits(fghr, 7, 0) @[ifu_bp_ctl.scala 328:65]
    node _T_310 = mux(_T_299, _T_302, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_311 = mux(_T_304, _T_306, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_312 = mux(_T_308, _T_309, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_313 = or(_T_310, _T_311) @[Mux.scala 27:72]
    node _T_314 = or(_T_313, _T_312) @[Mux.scala 27:72]
    wire merged_ghr : UInt<8> @[Mux.scala 27:72]
    merged_ghr <= _T_314 @[Mux.scala 27:72]
    wire fghr_ns : UInt<8> @[ifu_bp_ctl.scala 331:21]
    node _T_315 = bits(exu_flush_final_d1, 0, 0) @[ifu_bp_ctl.scala 336:43]
    node _T_316 = eq(exu_flush_final_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 337:27]
    node _T_317 = and(_T_316, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 337:47]
    node _T_318 = and(_T_317, io.ic_hit_f) @[ifu_bp_ctl.scala 337:70]
    node _T_319 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 337:86]
    node _T_320 = and(_T_318, _T_319) @[ifu_bp_ctl.scala 337:84]
    node _T_321 = bits(_T_320, 0, 0) @[ifu_bp_ctl.scala 337:102]
    node _T_322 = eq(exu_flush_final_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 338:27]
    node _T_323 = and(io.ifc_fetch_req_f, io.ic_hit_f) @[ifu_bp_ctl.scala 338:70]
    node _T_324 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 338:86]
    node _T_325 = and(_T_323, _T_324) @[ifu_bp_ctl.scala 338:84]
    node _T_326 = eq(_T_325, UInt<1>("h00")) @[ifu_bp_ctl.scala 338:49]
    node _T_327 = and(_T_322, _T_326) @[ifu_bp_ctl.scala 338:47]
    node _T_328 = bits(_T_327, 0, 0) @[ifu_bp_ctl.scala 338:103]
    node _T_329 = mux(_T_315, io.exu_bp.exu_mp_fghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_330 = mux(_T_321, merged_ghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_331 = mux(_T_328, fghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_332 = or(_T_329, _T_330) @[Mux.scala 27:72]
    node _T_333 = or(_T_332, _T_331) @[Mux.scala 27:72]
    wire _T_334 : UInt<8> @[Mux.scala 27:72]
    _T_334 <= _T_333 @[Mux.scala 27:72]
    fghr_ns <= _T_334 @[ifu_bp_ctl.scala 336:11]
    wire _T_335 : UInt
    _T_335 <= UInt<1>("h00")
    node _T_336 = xor(leak_one_f, _T_335) @[lib.scala 436:21]
    node _T_337 = orr(_T_336) @[lib.scala 436:29]
    reg _T_338 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_337 : @[Reg.scala 28:19]
      _T_338 <= leak_one_f @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_335 <= _T_338 @[lib.scala 439:16]
    leak_one_f_d1 <= _T_335 @[ifu_bp_ctl.scala 339:17]
    wire _T_339 : UInt
    _T_339 <= UInt<1>("h00")
    node _T_340 = xor(io.exu_bp.exu_mp_pkt.bits.way, _T_339) @[lib.scala 436:21]
    node _T_341 = orr(_T_340) @[lib.scala 436:29]
    reg _T_342 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_341 : @[Reg.scala 28:19]
      _T_342 <= io.exu_bp.exu_mp_pkt.bits.way @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_339 <= _T_342 @[lib.scala 439:16]
    exu_mp_way_f <= _T_339 @[ifu_bp_ctl.scala 341:16]
    wire _T_343 : UInt<1>
    _T_343 <= UInt<1>("h00")
    node _T_344 = xor(io.exu_flush_final, _T_343) @[lib.scala 458:21]
    node _T_345 = orr(_T_344) @[lib.scala 458:29]
    reg _T_346 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_345 : @[Reg.scala 28:19]
      _T_346 <= io.exu_flush_final @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_343 <= _T_346 @[lib.scala 461:16]
    exu_flush_final_d1 <= _T_343 @[ifu_bp_ctl.scala 342:22]
    wire _T_347 : UInt
    _T_347 <= UInt<1>("h00")
    node _T_348 = xor(fghr_ns, _T_347) @[lib.scala 436:21]
    node _T_349 = orr(_T_348) @[lib.scala 436:29]
    reg _T_350 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_349 : @[Reg.scala 28:19]
      _T_350 <= fghr_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_347 <= _T_350 @[lib.scala 439:16]
    fghr <= _T_347 @[ifu_bp_ctl.scala 343:8]
    io.ifu_bp_fghr_f <= fghr @[ifu_bp_ctl.scala 345:20]
    io.ifu_bp_hist1_f <= hist1_raw @[ifu_bp_ctl.scala 346:21]
    io.ifu_bp_hist0_f <= hist0_raw @[ifu_bp_ctl.scala 347:21]
    io.ifu_bp_pc4_f <= pc4_raw @[ifu_bp_ctl.scala 348:19]
    node _T_351 = bits(io.dec_bp.dec_tlu_bpred_disable, 0, 0) @[Bitwise.scala 72:15]
    node _T_352 = mux(_T_351, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_353 = not(_T_352) @[ifu_bp_ctl.scala 350:36]
    node _T_354 = and(vwayhit_f, _T_353) @[ifu_bp_ctl.scala 350:34]
    io.ifu_bp_valid_f <= _T_354 @[ifu_bp_ctl.scala 350:21]
    io.ifu_bp_ret_f <= pret_raw @[ifu_bp_ctl.scala 351:19]
    node _T_355 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 354:30]
    node _T_356 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 354:50]
    node _T_357 = eq(_T_356, UInt<1>("h00")) @[ifu_bp_ctl.scala 354:36]
    node _T_358 = and(_T_355, _T_357) @[ifu_bp_ctl.scala 354:34]
    node _T_359 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 354:68]
    node _T_360 = eq(_T_359, UInt<1>("h00")) @[ifu_bp_ctl.scala 354:58]
    node _T_361 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 354:87]
    node _T_362 = and(_T_360, _T_361) @[ifu_bp_ctl.scala 354:72]
    node _T_363 = or(_T_358, _T_362) @[ifu_bp_ctl.scala 354:55]
    node _T_364 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 355:30]
    node _T_365 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 355:49]
    node _T_366 = and(_T_364, _T_365) @[ifu_bp_ctl.scala 355:34]
    node _T_367 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 355:67]
    node _T_368 = eq(_T_367, UInt<1>("h00")) @[ifu_bp_ctl.scala 355:57]
    node _T_369 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 355:87]
    node _T_370 = eq(_T_369, UInt<1>("h00")) @[ifu_bp_ctl.scala 355:73]
    node _T_371 = and(_T_368, _T_370) @[ifu_bp_ctl.scala 355:71]
    node _T_372 = or(_T_366, _T_371) @[ifu_bp_ctl.scala 355:54]
    node bloc_f = cat(_T_363, _T_372) @[Cat.scala 29:58]
    node _T_373 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 357:31]
    node _T_374 = eq(_T_373, UInt<1>("h00")) @[ifu_bp_ctl.scala 357:21]
    node _T_375 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 357:56]
    node _T_376 = and(_T_374, _T_375) @[ifu_bp_ctl.scala 357:35]
    node _T_377 = eq(btb_rd_pc4_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 357:62]
    node use_fa_plus = and(_T_376, _T_377) @[ifu_bp_ctl.scala 357:60]
    node _T_378 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 359:40]
    node _T_379 = bits(btb_sel_f, 0, 0) @[ifu_bp_ctl.scala 359:55]
    node _T_380 = and(_T_378, _T_379) @[ifu_bp_ctl.scala 359:44]
    node btb_fg_crossing_f = and(_T_380, btb_rd_pc4_f) @[ifu_bp_ctl.scala 359:59]
    node _T_381 = bits(bloc_f, 1, 1) @[ifu_bp_ctl.scala 360:40]
    node bp_total_branch_offset_f = xor(_T_381, btb_rd_pc4_f) @[ifu_bp_ctl.scala 360:43]
    node _T_382 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_bp_ctl.scala 361:64]
    node _T_383 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 361:119]
    node _T_384 = and(io.ifc_fetch_req_f, _T_383) @[ifu_bp_ctl.scala 361:117]
    node _T_385 = and(_T_384, io.ic_hit_f) @[ifu_bp_ctl.scala 361:142]
    node _T_386 = bits(_T_385, 0, 0) @[ifu_bp_ctl.scala 361:157]
    wire _T_387 : UInt<30> @[lib.scala 570:35]
    _T_387 <= UInt<1>("h00") @[lib.scala 570:35]
    reg ifc_fetch_adder_prior : UInt, clock with : (reset => (reset, _T_387)) @[Reg.scala 27:20]
    when _T_386 : @[Reg.scala 28:19]
      ifc_fetch_adder_prior <= _T_382 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.ifu_bp_poffset_f <= btb_rd_tgt_f @[ifu_bp_ctl.scala 362:23]
    node _T_388 = bits(use_fa_plus, 0, 0) @[ifu_bp_ctl.scala 364:45]
    node _T_389 = bits(btb_fg_crossing_f, 0, 0) @[ifu_bp_ctl.scala 365:51]
    node _T_390 = eq(btb_fg_crossing_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 366:32]
    node _T_391 = eq(use_fa_plus, UInt<1>("h00")) @[ifu_bp_ctl.scala 366:53]
    node _T_392 = and(_T_390, _T_391) @[ifu_bp_ctl.scala 366:51]
    node _T_393 = bits(_T_392, 0, 0) @[ifu_bp_ctl.scala 366:67]
    node _T_394 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_bp_ctl.scala 366:95]
    node _T_395 = mux(_T_388, fetch_addr_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_396 = mux(_T_389, ifc_fetch_adder_prior, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_397 = mux(_T_393, _T_394, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_398 = or(_T_395, _T_396) @[Mux.scala 27:72]
    node _T_399 = or(_T_398, _T_397) @[Mux.scala 27:72]
    wire adder_pc_in_f : UInt @[Mux.scala 27:72]
    adder_pc_in_f <= _T_399 @[Mux.scala 27:72]
    node _T_400 = bits(adder_pc_in_f, 29, 0) @[ifu_bp_ctl.scala 369:58]
    node _T_401 = cat(_T_400, bp_total_branch_offset_f) @[Cat.scala 29:58]
    node _T_402 = cat(_T_401, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_403 = cat(btb_rd_tgt_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_404 = bits(_T_402, 12, 1) @[lib.scala 68:24]
    node _T_405 = bits(_T_403, 12, 1) @[lib.scala 68:40]
    node _T_406 = add(_T_404, _T_405) @[lib.scala 68:31]
    node _T_407 = bits(_T_402, 31, 13) @[lib.scala 69:20]
    node _T_408 = add(_T_407, UInt<1>("h01")) @[lib.scala 69:27]
    node _T_409 = tail(_T_408, 1) @[lib.scala 69:27]
    node _T_410 = bits(_T_402, 31, 13) @[lib.scala 70:20]
    node _T_411 = sub(_T_410, UInt<1>("h01")) @[lib.scala 70:27]
    node _T_412 = tail(_T_411, 1) @[lib.scala 70:27]
    node _T_413 = bits(_T_403, 12, 12) @[lib.scala 71:22]
    node _T_414 = bits(_T_406, 12, 12) @[lib.scala 72:39]
    node _T_415 = eq(_T_414, UInt<1>("h00")) @[lib.scala 72:28]
    node _T_416 = xor(_T_413, _T_415) @[lib.scala 72:26]
    node _T_417 = bits(_T_416, 0, 0) @[lib.scala 72:64]
    node _T_418 = bits(_T_402, 31, 13) @[lib.scala 72:76]
    node _T_419 = eq(_T_413, UInt<1>("h00")) @[lib.scala 73:20]
    node _T_420 = bits(_T_406, 12, 12) @[lib.scala 73:39]
    node _T_421 = and(_T_419, _T_420) @[lib.scala 73:26]
    node _T_422 = bits(_T_421, 0, 0) @[lib.scala 73:64]
    node _T_423 = bits(_T_406, 12, 12) @[lib.scala 74:39]
    node _T_424 = eq(_T_423, UInt<1>("h00")) @[lib.scala 74:28]
    node _T_425 = and(_T_413, _T_424) @[lib.scala 74:26]
    node _T_426 = bits(_T_425, 0, 0) @[lib.scala 74:64]
    node _T_427 = mux(_T_417, _T_418, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_428 = mux(_T_422, _T_409, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_429 = mux(_T_426, _T_412, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_430 = or(_T_427, _T_428) @[Mux.scala 27:72]
    node _T_431 = or(_T_430, _T_429) @[Mux.scala 27:72]
    wire _T_432 : UInt<19> @[Mux.scala 27:72]
    _T_432 <= _T_431 @[Mux.scala 27:72]
    node _T_433 = bits(_T_406, 11, 0) @[lib.scala 74:94]
    node _T_434 = cat(_T_432, _T_433) @[Cat.scala 29:58]
    node bp_btb_target_adder_f = cat(_T_434, UInt<1>("h00")) @[Cat.scala 29:58]
    wire rets_out : UInt<32>[8] @[ifu_bp_ctl.scala 371:22]
    rets_out[0] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[1] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[2] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[3] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[4] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[5] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[6] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    rets_out[7] <= UInt<1>("h00") @[ifu_bp_ctl.scala 372:12]
    node _T_435 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 374:55]
    node _T_436 = and(btb_rd_ret_f, _T_435) @[ifu_bp_ctl.scala 374:53]
    node _T_437 = bits(rets_out[0], 0, 0) @[ifu_bp_ctl.scala 374:83]
    node _T_438 = and(_T_436, _T_437) @[ifu_bp_ctl.scala 374:70]
    node _T_439 = and(_T_438, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 374:87]
    node _T_440 = bits(_T_439, 0, 0) @[Bitwise.scala 72:15]
    node _T_441 = mux(_T_440, UInt<31>("h07fffffff"), UInt<31>("h00")) @[Bitwise.scala 72:12]
    node _T_442 = bits(rets_out[0], 31, 1) @[ifu_bp_ctl.scala 374:126]
    node _T_443 = and(_T_441, _T_442) @[ifu_bp_ctl.scala 374:113]
    node _T_444 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 375:32]
    node _T_445 = and(btb_rd_ret_f, _T_444) @[ifu_bp_ctl.scala 375:30]
    node _T_446 = bits(rets_out[0], 0, 0) @[ifu_bp_ctl.scala 375:60]
    node _T_447 = and(_T_445, _T_446) @[ifu_bp_ctl.scala 375:47]
    node _T_448 = eq(_T_447, UInt<1>("h00")) @[ifu_bp_ctl.scala 375:15]
    node _T_449 = and(_T_448, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 375:65]
    node _T_450 = bits(_T_449, 0, 0) @[Bitwise.scala 72:15]
    node _T_451 = mux(_T_450, UInt<31>("h07fffffff"), UInt<31>("h00")) @[Bitwise.scala 72:12]
    node _T_452 = bits(bp_btb_target_adder_f, 31, 1) @[ifu_bp_ctl.scala 375:114]
    node _T_453 = and(_T_451, _T_452) @[ifu_bp_ctl.scala 375:91]
    node _T_454 = or(_T_443, _T_453) @[ifu_bp_ctl.scala 374:134]
    io.ifu_bp_btb_target_f <= _T_454 @[ifu_bp_ctl.scala 374:26]
    node _T_455 = bits(adder_pc_in_f, 29, 0) @[ifu_bp_ctl.scala 377:56]
    node _T_456 = cat(_T_455, bp_total_branch_offset_f) @[Cat.scala 29:58]
    node _T_457 = cat(_T_456, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_458 = mux(UInt<1>("h00"), UInt<11>("h07ff"), UInt<11>("h00")) @[Bitwise.scala 72:12]
    node _T_459 = not(btb_rd_pc4_f) @[ifu_bp_ctl.scala 377:113]
    node _T_460 = cat(_T_458, _T_459) @[Cat.scala 29:58]
    node _T_461 = cat(_T_460, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_462 = bits(_T_457, 12, 1) @[lib.scala 68:24]
    node _T_463 = bits(_T_461, 12, 1) @[lib.scala 68:40]
    node _T_464 = add(_T_462, _T_463) @[lib.scala 68:31]
    node _T_465 = bits(_T_457, 31, 13) @[lib.scala 69:20]
    node _T_466 = add(_T_465, UInt<1>("h01")) @[lib.scala 69:27]
    node _T_467 = tail(_T_466, 1) @[lib.scala 69:27]
    node _T_468 = bits(_T_457, 31, 13) @[lib.scala 70:20]
    node _T_469 = sub(_T_468, UInt<1>("h01")) @[lib.scala 70:27]
    node _T_470 = tail(_T_469, 1) @[lib.scala 70:27]
    node _T_471 = bits(_T_461, 12, 12) @[lib.scala 71:22]
    node _T_472 = bits(_T_464, 12, 12) @[lib.scala 72:39]
    node _T_473 = eq(_T_472, UInt<1>("h00")) @[lib.scala 72:28]
    node _T_474 = xor(_T_471, _T_473) @[lib.scala 72:26]
    node _T_475 = bits(_T_474, 0, 0) @[lib.scala 72:64]
    node _T_476 = bits(_T_457, 31, 13) @[lib.scala 72:76]
    node _T_477 = eq(_T_471, UInt<1>("h00")) @[lib.scala 73:20]
    node _T_478 = bits(_T_464, 12, 12) @[lib.scala 73:39]
    node _T_479 = and(_T_477, _T_478) @[lib.scala 73:26]
    node _T_480 = bits(_T_479, 0, 0) @[lib.scala 73:64]
    node _T_481 = bits(_T_464, 12, 12) @[lib.scala 74:39]
    node _T_482 = eq(_T_481, UInt<1>("h00")) @[lib.scala 74:28]
    node _T_483 = and(_T_471, _T_482) @[lib.scala 74:26]
    node _T_484 = bits(_T_483, 0, 0) @[lib.scala 74:64]
    node _T_485 = mux(_T_475, _T_476, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_486 = mux(_T_480, _T_467, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_487 = mux(_T_484, _T_470, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_488 = or(_T_485, _T_486) @[Mux.scala 27:72]
    node _T_489 = or(_T_488, _T_487) @[Mux.scala 27:72]
    wire _T_490 : UInt<19> @[Mux.scala 27:72]
    _T_490 <= _T_489 @[Mux.scala 27:72]
    node _T_491 = bits(_T_464, 11, 0) @[lib.scala 74:94]
    node _T_492 = cat(_T_490, _T_491) @[Cat.scala 29:58]
    node bp_rs_call_target_f = cat(_T_492, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_493 = eq(btb_rd_ret_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 379:33]
    node _T_494 = and(btb_rd_call_f, _T_493) @[ifu_bp_ctl.scala 379:31]
    node rs_push = and(_T_494, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 379:47]
    node _T_495 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 380:31]
    node _T_496 = and(btb_rd_ret_f, _T_495) @[ifu_bp_ctl.scala 380:29]
    node rs_pop = and(_T_496, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 380:46]
    node _T_497 = eq(rs_push, UInt<1>("h00")) @[ifu_bp_ctl.scala 381:17]
    node _T_498 = eq(rs_pop, UInt<1>("h00")) @[ifu_bp_ctl.scala 381:28]
    node rs_hold = and(_T_497, _T_498) @[ifu_bp_ctl.scala 381:26]
    node rsenable_0 = eq(rs_hold, UInt<1>("h00")) @[ifu_bp_ctl.scala 383:60]
    node rsenable_1 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_2 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_3 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_4 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_5 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_6 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node _T_499 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 386:23]
    node _T_500 = bits(bp_rs_call_target_f, 31, 1) @[ifu_bp_ctl.scala 386:56]
    node _T_501 = cat(_T_500, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_502 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 387:22]
    node _T_503 = mux(_T_499, _T_501, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_504 = mux(_T_502, rets_out[1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_505 = or(_T_503, _T_504) @[Mux.scala 27:72]
    wire rets_in_0 : UInt<32> @[Mux.scala 27:72]
    rets_in_0 <= _T_505 @[Mux.scala 27:72]
    node _T_506 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_507 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_508 = mux(_T_506, rets_out[0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_509 = mux(_T_507, rets_out[2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_510 = or(_T_508, _T_509) @[Mux.scala 27:72]
    wire rets_in_1 : UInt<32> @[Mux.scala 27:72]
    rets_in_1 <= _T_510 @[Mux.scala 27:72]
    node _T_511 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_512 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_513 = mux(_T_511, rets_out[1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_514 = mux(_T_512, rets_out[3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_515 = or(_T_513, _T_514) @[Mux.scala 27:72]
    wire rets_in_2 : UInt<32> @[Mux.scala 27:72]
    rets_in_2 <= _T_515 @[Mux.scala 27:72]
    node _T_516 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_517 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_518 = mux(_T_516, rets_out[2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_519 = mux(_T_517, rets_out[4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_520 = or(_T_518, _T_519) @[Mux.scala 27:72]
    wire rets_in_3 : UInt<32> @[Mux.scala 27:72]
    rets_in_3 <= _T_520 @[Mux.scala 27:72]
    node _T_521 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_522 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_523 = mux(_T_521, rets_out[3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_524 = mux(_T_522, rets_out[5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_525 = or(_T_523, _T_524) @[Mux.scala 27:72]
    wire rets_in_4 : UInt<32> @[Mux.scala 27:72]
    rets_in_4 <= _T_525 @[Mux.scala 27:72]
    node _T_526 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_527 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_528 = mux(_T_526, rets_out[4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_529 = mux(_T_527, rets_out[6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_530 = or(_T_528, _T_529) @[Mux.scala 27:72]
    wire rets_in_5 : UInt<32> @[Mux.scala 27:72]
    rets_in_5 <= _T_530 @[Mux.scala 27:72]
    node _T_531 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_532 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_533 = mux(_T_531, rets_out[5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_534 = mux(_T_532, rets_out[7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_535 = or(_T_533, _T_534) @[Mux.scala 27:72]
    wire rets_in_6 : UInt<32> @[Mux.scala 27:72]
    rets_in_6 <= _T_535 @[Mux.scala 27:72]
    node _T_536 = bits(rsenable_0, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_1 of rvclkhdr_1 @[lib.scala 399:23]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_1.io.en <= _T_536 @[lib.scala 402:17]
    rvclkhdr_1.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_537 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_536 : @[Reg.scala 28:19]
      _T_537 <= rets_in_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_538 = bits(rsenable_1, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_2 of rvclkhdr_2 @[lib.scala 399:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_2.io.en <= _T_538 @[lib.scala 402:17]
    rvclkhdr_2.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_539 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_538 : @[Reg.scala 28:19]
      _T_539 <= rets_in_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_540 = bits(rsenable_2, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_3 of rvclkhdr_3 @[lib.scala 399:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_3.io.en <= _T_540 @[lib.scala 402:17]
    rvclkhdr_3.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_541 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_540 : @[Reg.scala 28:19]
      _T_541 <= rets_in_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_542 = bits(rsenable_3, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_4 of rvclkhdr_4 @[lib.scala 399:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_4.io.en <= _T_542 @[lib.scala 402:17]
    rvclkhdr_4.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_543 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_542 : @[Reg.scala 28:19]
      _T_543 <= rets_in_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_544 = bits(rsenable_4, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_5 of rvclkhdr_5 @[lib.scala 399:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_5.io.en <= _T_544 @[lib.scala 402:17]
    rvclkhdr_5.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_545 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_544 : @[Reg.scala 28:19]
      _T_545 <= rets_in_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_546 = bits(rsenable_5, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_6 of rvclkhdr_6 @[lib.scala 399:23]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_6.io.en <= _T_546 @[lib.scala 402:17]
    rvclkhdr_6.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_547 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_546 : @[Reg.scala 28:19]
      _T_547 <= rets_in_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_548 = bits(rsenable_6, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_7 of rvclkhdr_7 @[lib.scala 399:23]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_7.io.en <= _T_548 @[lib.scala 402:17]
    rvclkhdr_7.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_549 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_548 : @[Reg.scala 28:19]
      _T_549 <= rets_in_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_550 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_8 of rvclkhdr_8 @[lib.scala 399:23]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_8.io.en <= _T_550 @[lib.scala 402:17]
    rvclkhdr_8.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_551 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_550 : @[Reg.scala 28:19]
      _T_551 <= rets_out[6] @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    rets_out[0] <= _T_537 @[ifu_bp_ctl.scala 393:12]
    rets_out[1] <= _T_539 @[ifu_bp_ctl.scala 393:12]
    rets_out[2] <= _T_541 @[ifu_bp_ctl.scala 393:12]
    rets_out[3] <= _T_543 @[ifu_bp_ctl.scala 393:12]
    rets_out[4] <= _T_545 @[ifu_bp_ctl.scala 393:12]
    rets_out[5] <= _T_547 @[ifu_bp_ctl.scala 393:12]
    rets_out[6] <= _T_549 @[ifu_bp_ctl.scala 393:12]
    rets_out[7] <= _T_551 @[ifu_bp_ctl.scala 393:12]
    node _T_552 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 395:35]
    node btb_valid = and(exu_mp_valid, _T_552) @[ifu_bp_ctl.scala 395:32]
    node _T_553 = or(io.exu_bp.exu_mp_pkt.bits.pcall, io.exu_bp.exu_mp_pkt.bits.pja) @[ifu_bp_ctl.scala 409:89]
    node _T_554 = or(io.exu_bp.exu_mp_pkt.bits.pret, io.exu_bp.exu_mp_pkt.bits.pja) @[ifu_bp_ctl.scala 409:113]
    node _T_555 = cat(_T_553, _T_554) @[Cat.scala 29:58]
    node _T_556 = cat(_T_555, btb_valid) @[Cat.scala 29:58]
    node _T_557 = cat(io.exu_bp.exu_mp_pkt.bits.pc4, io.exu_bp.exu_mp_pkt.bits.boffset) @[Cat.scala 29:58]
    node _T_558 = cat(io.exu_bp.exu_mp_btag, io.exu_bp.exu_mp_pkt.bits.toffset) @[Cat.scala 29:58]
    node _T_559 = cat(_T_558, _T_557) @[Cat.scala 29:58]
    node btb_wr_data = cat(_T_559, _T_556) @[Cat.scala 29:58]
    node _T_560 = and(exu_mp_valid, io.exu_bp.exu_mp_pkt.bits.ataken) @[ifu_bp_ctl.scala 410:41]
    node _T_561 = eq(io.exu_bp.exu_mp_pkt.valid, UInt<1>("h00")) @[ifu_bp_ctl.scala 410:59]
    node exu_mp_valid_write = and(_T_560, _T_561) @[ifu_bp_ctl.scala 410:57]
    node middle_of_bank = xor(io.exu_bp.exu_mp_pkt.bits.pc4, io.exu_bp.exu_mp_pkt.bits.boffset) @[ifu_bp_ctl.scala 411:35]
    node _T_562 = eq(io.exu_bp.exu_mp_pkt.bits.pcall, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:43]
    node _T_563 = and(exu_mp_valid, _T_562) @[ifu_bp_ctl.scala 414:41]
    node _T_564 = eq(io.exu_bp.exu_mp_pkt.bits.pret, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:58]
    node _T_565 = and(_T_563, _T_564) @[ifu_bp_ctl.scala 414:56]
    node _T_566 = eq(io.exu_bp.exu_mp_pkt.bits.pja, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:72]
    node _T_567 = and(_T_565, _T_566) @[ifu_bp_ctl.scala 414:70]
    node _T_568 = bits(_T_567, 0, 0) @[Bitwise.scala 72:15]
    node _T_569 = mux(_T_568, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_570 = not(middle_of_bank) @[ifu_bp_ctl.scala 414:106]
    node _T_571 = cat(middle_of_bank, _T_570) @[Cat.scala 29:58]
    node bht_wr_en0 = and(_T_569, _T_571) @[ifu_bp_ctl.scala 414:84]
    node _T_572 = bits(io.dec_bp.dec_tlu_br0_r_pkt.valid, 0, 0) @[Bitwise.scala 72:15]
    node _T_573 = mux(_T_572, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_574 = not(io.dec_bp.dec_tlu_br0_r_pkt.bits.middle) @[ifu_bp_ctl.scala 415:75]
    node _T_575 = cat(io.dec_bp.dec_tlu_br0_r_pkt.bits.middle, _T_574) @[Cat.scala 29:58]
    node bht_wr_en2 = and(_T_573, _T_575) @[ifu_bp_ctl.scala 415:46]
    node _T_576 = cat(io.exu_bp.exu_mp_index, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_577 = bits(_T_576, 9, 2) @[lib.scala 56:16]
    node _T_578 = bits(io.exu_bp.exu_mp_eghr, 7, 0) @[lib.scala 56:40]
    node mp_hashed = xor(_T_577, _T_578) @[lib.scala 56:35]
    node _T_579 = cat(io.exu_bp.exu_i0_br_index_r, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_580 = bits(_T_579, 9, 2) @[lib.scala 56:16]
    node _T_581 = bits(io.exu_bp.exu_i0_br_fghr_r, 7, 0) @[lib.scala 56:40]
    node br0_hashed_wb = xor(_T_580, _T_581) @[lib.scala 56:35]
    node _T_582 = cat(btb_rd_addr_f, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_583 = bits(_T_582, 9, 2) @[lib.scala 56:16]
    node _T_584 = bits(fghr, 7, 0) @[lib.scala 56:40]
    node bht_rd_addr_hashed_f = xor(_T_583, _T_584) @[lib.scala 56:35]
    node _T_585 = cat(btb_rd_addr_p1_f, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_586 = bits(_T_585, 9, 2) @[lib.scala 56:16]
    node _T_587 = bits(fghr, 7, 0) @[lib.scala 56:40]
    node bht_rd_addr_hashed_p1_f = xor(_T_586, _T_587) @[lib.scala 56:35]
    node _T_588 = eq(io.exu_bp.exu_mp_pkt.bits.way, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:26]
    node _T_589 = and(_T_588, exu_mp_valid_write) @[ifu_bp_ctl.scala 434:39]
    node _T_590 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:63]
    node _T_591 = and(_T_589, _T_590) @[ifu_bp_ctl.scala 434:60]
    node _T_592 = eq(dec_tlu_way_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:87]
    node _T_593 = and(_T_592, dec_tlu_error_wb) @[ifu_bp_ctl.scala 434:104]
    node btb_wr_en_way0 = or(_T_591, _T_593) @[ifu_bp_ctl.scala 434:83]
    node _T_594 = and(io.exu_bp.exu_mp_pkt.bits.way, exu_mp_valid_write) @[ifu_bp_ctl.scala 435:36]
    node _T_595 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 435:60]
    node _T_596 = and(_T_594, _T_595) @[ifu_bp_ctl.scala 435:57]
    node _T_597 = and(dec_tlu_way_wb, dec_tlu_error_wb) @[ifu_bp_ctl.scala 435:98]
    node btb_wr_en_way1 = or(_T_596, _T_597) @[ifu_bp_ctl.scala 435:80]
    node _T_598 = bits(dec_tlu_error_wb, 0, 0) @[ifu_bp_ctl.scala 438:42]
    node btb_wr_addr = mux(_T_598, btb_error_addr_wb, io.exu_bp.exu_mp_index) @[ifu_bp_ctl.scala 438:24]
    node _T_599 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 440:47]
    node _T_600 = bits(_T_599, 0, 0) @[ifu_bp_ctl.scala 440:51]
    node _T_601 = eq(_T_600, UInt<1>("h00")) @[ifu_bp_ctl.scala 440:27]
    node _T_602 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 441:24]
    node _T_603 = bits(_T_602, 0, 0) @[ifu_bp_ctl.scala 441:28]
    node _T_604 = bits(wayhit_p1_f, 0, 0) @[ifu_bp_ctl.scala 441:51]
    node _T_605 = bits(wayhit_f, 1, 1) @[ifu_bp_ctl.scala 441:64]
    node _T_606 = cat(_T_604, _T_605) @[Cat.scala 29:58]
    node _T_607 = mux(_T_601, wayhit_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_608 = mux(_T_603, _T_606, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_609 = or(_T_607, _T_608) @[Mux.scala 27:72]
    wire _T_610 : UInt<2> @[Mux.scala 27:72]
    _T_610 <= _T_609 @[Mux.scala 27:72]
    node _T_611 = cat(eoc_mask, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_612 = and(_T_610, _T_611) @[ifu_bp_ctl.scala 441:71]
    vwayhit_f <= _T_612 @[ifu_bp_ctl.scala 440:14]
    node _T_613 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 442:98]
    node _T_614 = and(_T_613, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_615 = bits(_T_614, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_9 of rvclkhdr_9 @[lib.scala 399:23]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_9.io.en <= _T_615 @[lib.scala 402:17]
    rvclkhdr_9.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_615 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_616 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 442:98]
    node _T_617 = and(_T_616, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_618 = bits(_T_617, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_10 of rvclkhdr_10 @[lib.scala 399:23]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_10.io.en <= _T_618 @[lib.scala 402:17]
    rvclkhdr_10.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_618 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_619 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 442:98]
    node _T_620 = and(_T_619, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_621 = bits(_T_620, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_11 of rvclkhdr_11 @[lib.scala 399:23]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_11.io.en <= _T_621 @[lib.scala 402:17]
    rvclkhdr_11.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_621 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_622 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 442:98]
    node _T_623 = and(_T_622, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_624 = bits(_T_623, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_12 of rvclkhdr_12 @[lib.scala 399:23]
    rvclkhdr_12.clock <= clock
    rvclkhdr_12.reset <= reset
    rvclkhdr_12.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_12.io.en <= _T_624 @[lib.scala 402:17]
    rvclkhdr_12.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_624 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_625 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 442:98]
    node _T_626 = and(_T_625, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_627 = bits(_T_626, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_13 of rvclkhdr_13 @[lib.scala 399:23]
    rvclkhdr_13.clock <= clock
    rvclkhdr_13.reset <= reset
    rvclkhdr_13.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_13.io.en <= _T_627 @[lib.scala 402:17]
    rvclkhdr_13.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_627 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_628 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 442:98]
    node _T_629 = and(_T_628, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_630 = bits(_T_629, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_14 of rvclkhdr_14 @[lib.scala 399:23]
    rvclkhdr_14.clock <= clock
    rvclkhdr_14.reset <= reset
    rvclkhdr_14.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_14.io.en <= _T_630 @[lib.scala 402:17]
    rvclkhdr_14.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_630 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_631 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 442:98]
    node _T_632 = and(_T_631, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_633 = bits(_T_632, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_15 of rvclkhdr_15 @[lib.scala 399:23]
    rvclkhdr_15.clock <= clock
    rvclkhdr_15.reset <= reset
    rvclkhdr_15.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_15.io.en <= _T_633 @[lib.scala 402:17]
    rvclkhdr_15.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_633 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_634 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 442:98]
    node _T_635 = and(_T_634, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_636 = bits(_T_635, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_16 of rvclkhdr_16 @[lib.scala 399:23]
    rvclkhdr_16.clock <= clock
    rvclkhdr_16.reset <= reset
    rvclkhdr_16.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_16.io.en <= _T_636 @[lib.scala 402:17]
    rvclkhdr_16.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_636 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_637 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 442:98]
    node _T_638 = and(_T_637, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_639 = bits(_T_638, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_17 of rvclkhdr_17 @[lib.scala 399:23]
    rvclkhdr_17.clock <= clock
    rvclkhdr_17.reset <= reset
    rvclkhdr_17.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_17.io.en <= _T_639 @[lib.scala 402:17]
    rvclkhdr_17.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_639 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_640 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 442:98]
    node _T_641 = and(_T_640, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_642 = bits(_T_641, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_18 of rvclkhdr_18 @[lib.scala 399:23]
    rvclkhdr_18.clock <= clock
    rvclkhdr_18.reset <= reset
    rvclkhdr_18.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_18.io.en <= _T_642 @[lib.scala 402:17]
    rvclkhdr_18.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_642 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_643 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 442:98]
    node _T_644 = and(_T_643, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_645 = bits(_T_644, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_19 of rvclkhdr_19 @[lib.scala 399:23]
    rvclkhdr_19.clock <= clock
    rvclkhdr_19.reset <= reset
    rvclkhdr_19.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_19.io.en <= _T_645 @[lib.scala 402:17]
    rvclkhdr_19.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_645 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_646 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 442:98]
    node _T_647 = and(_T_646, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_648 = bits(_T_647, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_20 of rvclkhdr_20 @[lib.scala 399:23]
    rvclkhdr_20.clock <= clock
    rvclkhdr_20.reset <= reset
    rvclkhdr_20.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_20.io.en <= _T_648 @[lib.scala 402:17]
    rvclkhdr_20.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_648 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_649 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 442:98]
    node _T_650 = and(_T_649, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_651 = bits(_T_650, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_21 of rvclkhdr_21 @[lib.scala 399:23]
    rvclkhdr_21.clock <= clock
    rvclkhdr_21.reset <= reset
    rvclkhdr_21.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_21.io.en <= _T_651 @[lib.scala 402:17]
    rvclkhdr_21.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_651 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_652 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 442:98]
    node _T_653 = and(_T_652, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_654 = bits(_T_653, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_22 of rvclkhdr_22 @[lib.scala 399:23]
    rvclkhdr_22.clock <= clock
    rvclkhdr_22.reset <= reset
    rvclkhdr_22.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_22.io.en <= _T_654 @[lib.scala 402:17]
    rvclkhdr_22.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_654 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_655 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 442:98]
    node _T_656 = and(_T_655, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_657 = bits(_T_656, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_23 of rvclkhdr_23 @[lib.scala 399:23]
    rvclkhdr_23.clock <= clock
    rvclkhdr_23.reset <= reset
    rvclkhdr_23.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_23.io.en <= _T_657 @[lib.scala 402:17]
    rvclkhdr_23.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_657 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_658 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 442:98]
    node _T_659 = and(_T_658, btb_wr_en_way0) @[ifu_bp_ctl.scala 442:107]
    node _T_660 = bits(_T_659, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_24 of rvclkhdr_24 @[lib.scala 399:23]
    rvclkhdr_24.clock <= clock
    rvclkhdr_24.reset <= reset
    rvclkhdr_24.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_24.io.en <= _T_660 @[lib.scala 402:17]
    rvclkhdr_24.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_660 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_661 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 443:98]
    node _T_662 = and(_T_661, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_663 = bits(_T_662, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_25 of rvclkhdr_25 @[lib.scala 399:23]
    rvclkhdr_25.clock <= clock
    rvclkhdr_25.reset <= reset
    rvclkhdr_25.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_25.io.en <= _T_663 @[lib.scala 402:17]
    rvclkhdr_25.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_663 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_664 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 443:98]
    node _T_665 = and(_T_664, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_666 = bits(_T_665, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_26 of rvclkhdr_26 @[lib.scala 399:23]
    rvclkhdr_26.clock <= clock
    rvclkhdr_26.reset <= reset
    rvclkhdr_26.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_26.io.en <= _T_666 @[lib.scala 402:17]
    rvclkhdr_26.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_666 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_667 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 443:98]
    node _T_668 = and(_T_667, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_669 = bits(_T_668, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_27 of rvclkhdr_27 @[lib.scala 399:23]
    rvclkhdr_27.clock <= clock
    rvclkhdr_27.reset <= reset
    rvclkhdr_27.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_27.io.en <= _T_669 @[lib.scala 402:17]
    rvclkhdr_27.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_669 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_670 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 443:98]
    node _T_671 = and(_T_670, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_672 = bits(_T_671, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_28 of rvclkhdr_28 @[lib.scala 399:23]
    rvclkhdr_28.clock <= clock
    rvclkhdr_28.reset <= reset
    rvclkhdr_28.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_28.io.en <= _T_672 @[lib.scala 402:17]
    rvclkhdr_28.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_672 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_673 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 443:98]
    node _T_674 = and(_T_673, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_675 = bits(_T_674, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_29 of rvclkhdr_29 @[lib.scala 399:23]
    rvclkhdr_29.clock <= clock
    rvclkhdr_29.reset <= reset
    rvclkhdr_29.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_29.io.en <= _T_675 @[lib.scala 402:17]
    rvclkhdr_29.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_675 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_676 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 443:98]
    node _T_677 = and(_T_676, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_678 = bits(_T_677, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_30 of rvclkhdr_30 @[lib.scala 399:23]
    rvclkhdr_30.clock <= clock
    rvclkhdr_30.reset <= reset
    rvclkhdr_30.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_30.io.en <= _T_678 @[lib.scala 402:17]
    rvclkhdr_30.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_678 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_679 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 443:98]
    node _T_680 = and(_T_679, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_681 = bits(_T_680, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_31 of rvclkhdr_31 @[lib.scala 399:23]
    rvclkhdr_31.clock <= clock
    rvclkhdr_31.reset <= reset
    rvclkhdr_31.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_31.io.en <= _T_681 @[lib.scala 402:17]
    rvclkhdr_31.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_681 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_682 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 443:98]
    node _T_683 = and(_T_682, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_684 = bits(_T_683, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_32 of rvclkhdr_32 @[lib.scala 399:23]
    rvclkhdr_32.clock <= clock
    rvclkhdr_32.reset <= reset
    rvclkhdr_32.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_32.io.en <= _T_684 @[lib.scala 402:17]
    rvclkhdr_32.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_684 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_685 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 443:98]
    node _T_686 = and(_T_685, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_687 = bits(_T_686, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_33 of rvclkhdr_33 @[lib.scala 399:23]
    rvclkhdr_33.clock <= clock
    rvclkhdr_33.reset <= reset
    rvclkhdr_33.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_33.io.en <= _T_687 @[lib.scala 402:17]
    rvclkhdr_33.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_687 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_688 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 443:98]
    node _T_689 = and(_T_688, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_690 = bits(_T_689, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_34 of rvclkhdr_34 @[lib.scala 399:23]
    rvclkhdr_34.clock <= clock
    rvclkhdr_34.reset <= reset
    rvclkhdr_34.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_34.io.en <= _T_690 @[lib.scala 402:17]
    rvclkhdr_34.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_690 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_691 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 443:98]
    node _T_692 = and(_T_691, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_693 = bits(_T_692, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_35 of rvclkhdr_35 @[lib.scala 399:23]
    rvclkhdr_35.clock <= clock
    rvclkhdr_35.reset <= reset
    rvclkhdr_35.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_35.io.en <= _T_693 @[lib.scala 402:17]
    rvclkhdr_35.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_693 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_694 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 443:98]
    node _T_695 = and(_T_694, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_696 = bits(_T_695, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_36 of rvclkhdr_36 @[lib.scala 399:23]
    rvclkhdr_36.clock <= clock
    rvclkhdr_36.reset <= reset
    rvclkhdr_36.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_36.io.en <= _T_696 @[lib.scala 402:17]
    rvclkhdr_36.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_696 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_697 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 443:98]
    node _T_698 = and(_T_697, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_699 = bits(_T_698, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_37 of rvclkhdr_37 @[lib.scala 399:23]
    rvclkhdr_37.clock <= clock
    rvclkhdr_37.reset <= reset
    rvclkhdr_37.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_37.io.en <= _T_699 @[lib.scala 402:17]
    rvclkhdr_37.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_699 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_700 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 443:98]
    node _T_701 = and(_T_700, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_702 = bits(_T_701, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_38 of rvclkhdr_38 @[lib.scala 399:23]
    rvclkhdr_38.clock <= clock
    rvclkhdr_38.reset <= reset
    rvclkhdr_38.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_38.io.en <= _T_702 @[lib.scala 402:17]
    rvclkhdr_38.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_702 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_703 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 443:98]
    node _T_704 = and(_T_703, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_705 = bits(_T_704, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_39 of rvclkhdr_39 @[lib.scala 399:23]
    rvclkhdr_39.clock <= clock
    rvclkhdr_39.reset <= reset
    rvclkhdr_39.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_39.io.en <= _T_705 @[lib.scala 402:17]
    rvclkhdr_39.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_705 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_706 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 443:98]
    node _T_707 = and(_T_706, btb_wr_en_way1) @[ifu_bp_ctl.scala 443:107]
    node _T_708 = bits(_T_707, 0, 0) @[ifu_bp_ctl.scala 443:125]
    inst rvclkhdr_40 of rvclkhdr_40 @[lib.scala 399:23]
    rvclkhdr_40.clock <= clock
    rvclkhdr_40.reset <= reset
    rvclkhdr_40.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_40.io.en <= _T_708 @[lib.scala 402:17]
    rvclkhdr_40.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_708 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_709 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 445:80]
    node _T_710 = bits(_T_709, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_711 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 445:80]
    node _T_712 = bits(_T_711, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_713 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 445:80]
    node _T_714 = bits(_T_713, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_715 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 445:80]
    node _T_716 = bits(_T_715, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_717 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 445:80]
    node _T_718 = bits(_T_717, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_719 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 445:80]
    node _T_720 = bits(_T_719, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_721 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 445:80]
    node _T_722 = bits(_T_721, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_723 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 445:80]
    node _T_724 = bits(_T_723, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_725 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 445:80]
    node _T_726 = bits(_T_725, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_727 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 445:80]
    node _T_728 = bits(_T_727, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_729 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 445:80]
    node _T_730 = bits(_T_729, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_731 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 445:80]
    node _T_732 = bits(_T_731, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_733 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 445:80]
    node _T_734 = bits(_T_733, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_735 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 445:80]
    node _T_736 = bits(_T_735, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_737 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 445:80]
    node _T_738 = bits(_T_737, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_739 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 445:80]
    node _T_740 = bits(_T_739, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_741 = mux(_T_710, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_742 = mux(_T_712, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_743 = mux(_T_714, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_744 = mux(_T_716, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_745 = mux(_T_718, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_746 = mux(_T_720, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_747 = mux(_T_722, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_748 = mux(_T_724, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_749 = mux(_T_726, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_750 = mux(_T_728, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_751 = mux(_T_730, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_752 = mux(_T_732, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_753 = mux(_T_734, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_754 = mux(_T_736, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_755 = mux(_T_738, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_756 = mux(_T_740, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_757 = or(_T_741, _T_742) @[Mux.scala 27:72]
    node _T_758 = or(_T_757, _T_743) @[Mux.scala 27:72]
    node _T_759 = or(_T_758, _T_744) @[Mux.scala 27:72]
    node _T_760 = or(_T_759, _T_745) @[Mux.scala 27:72]
    node _T_761 = or(_T_760, _T_746) @[Mux.scala 27:72]
    node _T_762 = or(_T_761, _T_747) @[Mux.scala 27:72]
    node _T_763 = or(_T_762, _T_748) @[Mux.scala 27:72]
    node _T_764 = or(_T_763, _T_749) @[Mux.scala 27:72]
    node _T_765 = or(_T_764, _T_750) @[Mux.scala 27:72]
    node _T_766 = or(_T_765, _T_751) @[Mux.scala 27:72]
    node _T_767 = or(_T_766, _T_752) @[Mux.scala 27:72]
    node _T_768 = or(_T_767, _T_753) @[Mux.scala 27:72]
    node _T_769 = or(_T_768, _T_754) @[Mux.scala 27:72]
    node _T_770 = or(_T_769, _T_755) @[Mux.scala 27:72]
    node _T_771 = or(_T_770, _T_756) @[Mux.scala 27:72]
    wire _T_772 : UInt @[Mux.scala 27:72]
    _T_772 <= _T_771 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_f <= _T_772 @[ifu_bp_ctl.scala 445:28]
    node _T_773 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 446:80]
    node _T_774 = bits(_T_773, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_775 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 446:80]
    node _T_776 = bits(_T_775, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_777 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 446:80]
    node _T_778 = bits(_T_777, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_779 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 446:80]
    node _T_780 = bits(_T_779, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_781 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 446:80]
    node _T_782 = bits(_T_781, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_783 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 446:80]
    node _T_784 = bits(_T_783, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_785 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 446:80]
    node _T_786 = bits(_T_785, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_787 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 446:80]
    node _T_788 = bits(_T_787, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_789 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 446:80]
    node _T_790 = bits(_T_789, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_791 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 446:80]
    node _T_792 = bits(_T_791, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_793 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 446:80]
    node _T_794 = bits(_T_793, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_795 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 446:80]
    node _T_796 = bits(_T_795, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_797 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 446:80]
    node _T_798 = bits(_T_797, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_799 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 446:80]
    node _T_800 = bits(_T_799, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_801 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 446:80]
    node _T_802 = bits(_T_801, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_803 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 446:80]
    node _T_804 = bits(_T_803, 0, 0) @[ifu_bp_ctl.scala 446:89]
    node _T_805 = mux(_T_774, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_806 = mux(_T_776, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_807 = mux(_T_778, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_808 = mux(_T_780, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_809 = mux(_T_782, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_810 = mux(_T_784, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_811 = mux(_T_786, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_812 = mux(_T_788, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_813 = mux(_T_790, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_814 = mux(_T_792, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_815 = mux(_T_794, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_816 = mux(_T_796, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_817 = mux(_T_798, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_818 = mux(_T_800, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_819 = mux(_T_802, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_820 = mux(_T_804, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_821 = or(_T_805, _T_806) @[Mux.scala 27:72]
    node _T_822 = or(_T_821, _T_807) @[Mux.scala 27:72]
    node _T_823 = or(_T_822, _T_808) @[Mux.scala 27:72]
    node _T_824 = or(_T_823, _T_809) @[Mux.scala 27:72]
    node _T_825 = or(_T_824, _T_810) @[Mux.scala 27:72]
    node _T_826 = or(_T_825, _T_811) @[Mux.scala 27:72]
    node _T_827 = or(_T_826, _T_812) @[Mux.scala 27:72]
    node _T_828 = or(_T_827, _T_813) @[Mux.scala 27:72]
    node _T_829 = or(_T_828, _T_814) @[Mux.scala 27:72]
    node _T_830 = or(_T_829, _T_815) @[Mux.scala 27:72]
    node _T_831 = or(_T_830, _T_816) @[Mux.scala 27:72]
    node _T_832 = or(_T_831, _T_817) @[Mux.scala 27:72]
    node _T_833 = or(_T_832, _T_818) @[Mux.scala 27:72]
    node _T_834 = or(_T_833, _T_819) @[Mux.scala 27:72]
    node _T_835 = or(_T_834, _T_820) @[Mux.scala 27:72]
    wire _T_836 : UInt @[Mux.scala 27:72]
    _T_836 <= _T_835 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_f <= _T_836 @[ifu_bp_ctl.scala 446:28]
    node _T_837 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 449:86]
    node _T_838 = bits(_T_837, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_839 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 449:86]
    node _T_840 = bits(_T_839, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_841 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 449:86]
    node _T_842 = bits(_T_841, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_843 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 449:86]
    node _T_844 = bits(_T_843, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_845 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 449:86]
    node _T_846 = bits(_T_845, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_847 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 449:86]
    node _T_848 = bits(_T_847, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_849 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 449:86]
    node _T_850 = bits(_T_849, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_851 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 449:86]
    node _T_852 = bits(_T_851, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_853 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 449:86]
    node _T_854 = bits(_T_853, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_855 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 449:86]
    node _T_856 = bits(_T_855, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_857 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 449:86]
    node _T_858 = bits(_T_857, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_859 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 449:86]
    node _T_860 = bits(_T_859, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_861 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 449:86]
    node _T_862 = bits(_T_861, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_863 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 449:86]
    node _T_864 = bits(_T_863, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_865 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 449:86]
    node _T_866 = bits(_T_865, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_867 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 449:86]
    node _T_868 = bits(_T_867, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_869 = mux(_T_838, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_870 = mux(_T_840, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_871 = mux(_T_842, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_872 = mux(_T_844, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_873 = mux(_T_846, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_874 = mux(_T_848, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_875 = mux(_T_850, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_876 = mux(_T_852, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_877 = mux(_T_854, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_878 = mux(_T_856, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_879 = mux(_T_858, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_880 = mux(_T_860, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_881 = mux(_T_862, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_882 = mux(_T_864, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_883 = mux(_T_866, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_884 = mux(_T_868, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_885 = or(_T_869, _T_870) @[Mux.scala 27:72]
    node _T_886 = or(_T_885, _T_871) @[Mux.scala 27:72]
    node _T_887 = or(_T_886, _T_872) @[Mux.scala 27:72]
    node _T_888 = or(_T_887, _T_873) @[Mux.scala 27:72]
    node _T_889 = or(_T_888, _T_874) @[Mux.scala 27:72]
    node _T_890 = or(_T_889, _T_875) @[Mux.scala 27:72]
    node _T_891 = or(_T_890, _T_876) @[Mux.scala 27:72]
    node _T_892 = or(_T_891, _T_877) @[Mux.scala 27:72]
    node _T_893 = or(_T_892, _T_878) @[Mux.scala 27:72]
    node _T_894 = or(_T_893, _T_879) @[Mux.scala 27:72]
    node _T_895 = or(_T_894, _T_880) @[Mux.scala 27:72]
    node _T_896 = or(_T_895, _T_881) @[Mux.scala 27:72]
    node _T_897 = or(_T_896, _T_882) @[Mux.scala 27:72]
    node _T_898 = or(_T_897, _T_883) @[Mux.scala 27:72]
    node _T_899 = or(_T_898, _T_884) @[Mux.scala 27:72]
    wire _T_900 : UInt @[Mux.scala 27:72]
    _T_900 <= _T_899 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_p1_f <= _T_900 @[ifu_bp_ctl.scala 449:31]
    node _T_901 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 450:86]
    node _T_902 = bits(_T_901, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_903 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 450:86]
    node _T_904 = bits(_T_903, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_905 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 450:86]
    node _T_906 = bits(_T_905, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_907 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 450:86]
    node _T_908 = bits(_T_907, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_909 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 450:86]
    node _T_910 = bits(_T_909, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_911 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 450:86]
    node _T_912 = bits(_T_911, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_913 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 450:86]
    node _T_914 = bits(_T_913, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_915 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 450:86]
    node _T_916 = bits(_T_915, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_917 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 450:86]
    node _T_918 = bits(_T_917, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_919 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 450:86]
    node _T_920 = bits(_T_919, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_921 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 450:86]
    node _T_922 = bits(_T_921, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_923 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 450:86]
    node _T_924 = bits(_T_923, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_925 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 450:86]
    node _T_926 = bits(_T_925, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_927 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 450:86]
    node _T_928 = bits(_T_927, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_929 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 450:86]
    node _T_930 = bits(_T_929, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_931 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 450:86]
    node _T_932 = bits(_T_931, 0, 0) @[ifu_bp_ctl.scala 450:95]
    node _T_933 = mux(_T_902, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_934 = mux(_T_904, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_935 = mux(_T_906, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_936 = mux(_T_908, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_937 = mux(_T_910, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_938 = mux(_T_912, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_939 = mux(_T_914, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_940 = mux(_T_916, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_941 = mux(_T_918, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_942 = mux(_T_920, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_943 = mux(_T_922, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_944 = mux(_T_924, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_945 = mux(_T_926, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_946 = mux(_T_928, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_947 = mux(_T_930, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_948 = mux(_T_932, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_949 = or(_T_933, _T_934) @[Mux.scala 27:72]
    node _T_950 = or(_T_949, _T_935) @[Mux.scala 27:72]
    node _T_951 = or(_T_950, _T_936) @[Mux.scala 27:72]
    node _T_952 = or(_T_951, _T_937) @[Mux.scala 27:72]
    node _T_953 = or(_T_952, _T_938) @[Mux.scala 27:72]
    node _T_954 = or(_T_953, _T_939) @[Mux.scala 27:72]
    node _T_955 = or(_T_954, _T_940) @[Mux.scala 27:72]
    node _T_956 = or(_T_955, _T_941) @[Mux.scala 27:72]
    node _T_957 = or(_T_956, _T_942) @[Mux.scala 27:72]
    node _T_958 = or(_T_957, _T_943) @[Mux.scala 27:72]
    node _T_959 = or(_T_958, _T_944) @[Mux.scala 27:72]
    node _T_960 = or(_T_959, _T_945) @[Mux.scala 27:72]
    node _T_961 = or(_T_960, _T_946) @[Mux.scala 27:72]
    node _T_962 = or(_T_961, _T_947) @[Mux.scala 27:72]
    node _T_963 = or(_T_962, _T_948) @[Mux.scala 27:72]
    wire _T_964 : UInt @[Mux.scala 27:72]
    _T_964 <= _T_963 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_p1_f <= _T_964 @[ifu_bp_ctl.scala 450:31]
    wire bht_bank_clken : UInt<1>[1][2] @[ifu_bp_ctl.scala 507:28]
    wire bht_bank_clk : Clock[1][2] @[ifu_bp_ctl.scala 509:26]
    inst rvclkhdr_41 of rvclkhdr_41 @[lib.scala 343:22]
    rvclkhdr_41.clock <= clock
    rvclkhdr_41.reset <= reset
    rvclkhdr_41.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_41.io.en <= bht_bank_clken[0][0] @[lib.scala 345:16]
    rvclkhdr_41.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[0][0] <= rvclkhdr_41.io.l1clk @[ifu_bp_ctl.scala 511:84]
    inst rvclkhdr_42 of rvclkhdr_42 @[lib.scala 343:22]
    rvclkhdr_42.clock <= clock
    rvclkhdr_42.reset <= reset
    rvclkhdr_42.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_42.io.en <= bht_bank_clken[1][0] @[lib.scala 345:16]
    rvclkhdr_42.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[1][0] <= rvclkhdr_42.io.l1clk @[ifu_bp_ctl.scala 511:84]
    node _T_965 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 516:40]
    node _T_966 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 516:60]
    node _T_967 = eq(_T_966, UInt<1>("h00")) @[ifu_bp_ctl.scala 516:109]
    node _T_968 = or(_T_967, UInt<1>("h01")) @[ifu_bp_ctl.scala 516:117]
    node _T_969 = and(_T_965, _T_968) @[ifu_bp_ctl.scala 516:44]
    node _T_970 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 517:40]
    node _T_971 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 517:60]
    node _T_972 = eq(_T_971, UInt<1>("h00")) @[ifu_bp_ctl.scala 517:109]
    node _T_973 = or(_T_972, UInt<1>("h01")) @[ifu_bp_ctl.scala 517:117]
    node _T_974 = and(_T_970, _T_973) @[ifu_bp_ctl.scala 517:44]
    node _T_975 = or(_T_969, _T_974) @[ifu_bp_ctl.scala 516:142]
    bht_bank_clken[0][0] <= _T_975 @[ifu_bp_ctl.scala 516:26]
    node _T_976 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 516:40]
    node _T_977 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 516:60]
    node _T_978 = eq(_T_977, UInt<1>("h00")) @[ifu_bp_ctl.scala 516:109]
    node _T_979 = or(_T_978, UInt<1>("h01")) @[ifu_bp_ctl.scala 516:117]
    node _T_980 = and(_T_976, _T_979) @[ifu_bp_ctl.scala 516:44]
    node _T_981 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 517:40]
    node _T_982 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 517:60]
    node _T_983 = eq(_T_982, UInt<1>("h00")) @[ifu_bp_ctl.scala 517:109]
    node _T_984 = or(_T_983, UInt<1>("h01")) @[ifu_bp_ctl.scala 517:117]
    node _T_985 = and(_T_981, _T_984) @[ifu_bp_ctl.scala 517:44]
    node _T_986 = or(_T_980, _T_985) @[ifu_bp_ctl.scala 516:142]
    bht_bank_clken[1][0] <= _T_986 @[ifu_bp_ctl.scala 516:26]
    node _T_987 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_988 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_989 = eq(_T_988, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:74]
    node _T_990 = and(_T_987, _T_989) @[ifu_bp_ctl.scala 522:23]
    node _T_991 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_992 = eq(_T_991, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_993 = and(_T_990, _T_992) @[ifu_bp_ctl.scala 522:81]
    node _T_994 = or(_T_993, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_995 = bits(_T_994, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_0 = mux(_T_995, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_996 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_997 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_998 = eq(_T_997, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:74]
    node _T_999 = and(_T_996, _T_998) @[ifu_bp_ctl.scala 522:23]
    node _T_1000 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1001 = eq(_T_1000, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1002 = and(_T_999, _T_1001) @[ifu_bp_ctl.scala 522:81]
    node _T_1003 = or(_T_1002, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1004 = bits(_T_1003, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_1 = mux(_T_1004, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1005 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1006 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1007 = eq(_T_1006, UInt<2>("h02")) @[ifu_bp_ctl.scala 522:74]
    node _T_1008 = and(_T_1005, _T_1007) @[ifu_bp_ctl.scala 522:23]
    node _T_1009 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1010 = eq(_T_1009, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1011 = and(_T_1008, _T_1010) @[ifu_bp_ctl.scala 522:81]
    node _T_1012 = or(_T_1011, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1013 = bits(_T_1012, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_2 = mux(_T_1013, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1014 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1015 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1016 = eq(_T_1015, UInt<2>("h03")) @[ifu_bp_ctl.scala 522:74]
    node _T_1017 = and(_T_1014, _T_1016) @[ifu_bp_ctl.scala 522:23]
    node _T_1018 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1019 = eq(_T_1018, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1020 = and(_T_1017, _T_1019) @[ifu_bp_ctl.scala 522:81]
    node _T_1021 = or(_T_1020, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1022 = bits(_T_1021, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_3 = mux(_T_1022, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1023 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1024 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1025 = eq(_T_1024, UInt<3>("h04")) @[ifu_bp_ctl.scala 522:74]
    node _T_1026 = and(_T_1023, _T_1025) @[ifu_bp_ctl.scala 522:23]
    node _T_1027 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1028 = eq(_T_1027, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1029 = and(_T_1026, _T_1028) @[ifu_bp_ctl.scala 522:81]
    node _T_1030 = or(_T_1029, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1031 = bits(_T_1030, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_4 = mux(_T_1031, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1032 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1033 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1034 = eq(_T_1033, UInt<3>("h05")) @[ifu_bp_ctl.scala 522:74]
    node _T_1035 = and(_T_1032, _T_1034) @[ifu_bp_ctl.scala 522:23]
    node _T_1036 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1037 = eq(_T_1036, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1038 = and(_T_1035, _T_1037) @[ifu_bp_ctl.scala 522:81]
    node _T_1039 = or(_T_1038, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1040 = bits(_T_1039, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_5 = mux(_T_1040, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1041 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1042 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1043 = eq(_T_1042, UInt<3>("h06")) @[ifu_bp_ctl.scala 522:74]
    node _T_1044 = and(_T_1041, _T_1043) @[ifu_bp_ctl.scala 522:23]
    node _T_1045 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1046 = eq(_T_1045, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1047 = and(_T_1044, _T_1046) @[ifu_bp_ctl.scala 522:81]
    node _T_1048 = or(_T_1047, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1049 = bits(_T_1048, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_6 = mux(_T_1049, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1050 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1051 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1052 = eq(_T_1051, UInt<3>("h07")) @[ifu_bp_ctl.scala 522:74]
    node _T_1053 = and(_T_1050, _T_1052) @[ifu_bp_ctl.scala 522:23]
    node _T_1054 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1055 = eq(_T_1054, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1056 = and(_T_1053, _T_1055) @[ifu_bp_ctl.scala 522:81]
    node _T_1057 = or(_T_1056, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1058 = bits(_T_1057, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_7 = mux(_T_1058, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1059 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1060 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1061 = eq(_T_1060, UInt<4>("h08")) @[ifu_bp_ctl.scala 522:74]
    node _T_1062 = and(_T_1059, _T_1061) @[ifu_bp_ctl.scala 522:23]
    node _T_1063 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1064 = eq(_T_1063, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1065 = and(_T_1062, _T_1064) @[ifu_bp_ctl.scala 522:81]
    node _T_1066 = or(_T_1065, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1067 = bits(_T_1066, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_8 = mux(_T_1067, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1068 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1069 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1070 = eq(_T_1069, UInt<4>("h09")) @[ifu_bp_ctl.scala 522:74]
    node _T_1071 = and(_T_1068, _T_1070) @[ifu_bp_ctl.scala 522:23]
    node _T_1072 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1073 = eq(_T_1072, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1074 = and(_T_1071, _T_1073) @[ifu_bp_ctl.scala 522:81]
    node _T_1075 = or(_T_1074, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1076 = bits(_T_1075, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_9 = mux(_T_1076, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1077 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1078 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1079 = eq(_T_1078, UInt<4>("h0a")) @[ifu_bp_ctl.scala 522:74]
    node _T_1080 = and(_T_1077, _T_1079) @[ifu_bp_ctl.scala 522:23]
    node _T_1081 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1082 = eq(_T_1081, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1083 = and(_T_1080, _T_1082) @[ifu_bp_ctl.scala 522:81]
    node _T_1084 = or(_T_1083, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1085 = bits(_T_1084, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_10 = mux(_T_1085, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1086 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1087 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1088 = eq(_T_1087, UInt<4>("h0b")) @[ifu_bp_ctl.scala 522:74]
    node _T_1089 = and(_T_1086, _T_1088) @[ifu_bp_ctl.scala 522:23]
    node _T_1090 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1091 = eq(_T_1090, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1092 = and(_T_1089, _T_1091) @[ifu_bp_ctl.scala 522:81]
    node _T_1093 = or(_T_1092, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1094 = bits(_T_1093, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_11 = mux(_T_1094, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1095 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1096 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1097 = eq(_T_1096, UInt<4>("h0c")) @[ifu_bp_ctl.scala 522:74]
    node _T_1098 = and(_T_1095, _T_1097) @[ifu_bp_ctl.scala 522:23]
    node _T_1099 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1100 = eq(_T_1099, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1101 = and(_T_1098, _T_1100) @[ifu_bp_ctl.scala 522:81]
    node _T_1102 = or(_T_1101, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1103 = bits(_T_1102, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_12 = mux(_T_1103, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1104 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1105 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1106 = eq(_T_1105, UInt<4>("h0d")) @[ifu_bp_ctl.scala 522:74]
    node _T_1107 = and(_T_1104, _T_1106) @[ifu_bp_ctl.scala 522:23]
    node _T_1108 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1109 = eq(_T_1108, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1110 = and(_T_1107, _T_1109) @[ifu_bp_ctl.scala 522:81]
    node _T_1111 = or(_T_1110, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1112 = bits(_T_1111, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_13 = mux(_T_1112, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1113 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1114 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1115 = eq(_T_1114, UInt<4>("h0e")) @[ifu_bp_ctl.scala 522:74]
    node _T_1116 = and(_T_1113, _T_1115) @[ifu_bp_ctl.scala 522:23]
    node _T_1117 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1118 = eq(_T_1117, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1119 = and(_T_1116, _T_1118) @[ifu_bp_ctl.scala 522:81]
    node _T_1120 = or(_T_1119, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1121 = bits(_T_1120, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_14 = mux(_T_1121, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1122 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 522:20]
    node _T_1123 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1124 = eq(_T_1123, UInt<4>("h0f")) @[ifu_bp_ctl.scala 522:74]
    node _T_1125 = and(_T_1122, _T_1124) @[ifu_bp_ctl.scala 522:23]
    node _T_1126 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1127 = eq(_T_1126, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1128 = and(_T_1125, _T_1127) @[ifu_bp_ctl.scala 522:81]
    node _T_1129 = or(_T_1128, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1130 = bits(_T_1129, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_0_0_15 = mux(_T_1130, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1131 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1132 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1133 = eq(_T_1132, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:74]
    node _T_1134 = and(_T_1131, _T_1133) @[ifu_bp_ctl.scala 522:23]
    node _T_1135 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1136 = eq(_T_1135, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1137 = and(_T_1134, _T_1136) @[ifu_bp_ctl.scala 522:81]
    node _T_1138 = or(_T_1137, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1139 = bits(_T_1138, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_0 = mux(_T_1139, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1140 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1141 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1142 = eq(_T_1141, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:74]
    node _T_1143 = and(_T_1140, _T_1142) @[ifu_bp_ctl.scala 522:23]
    node _T_1144 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1145 = eq(_T_1144, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1146 = and(_T_1143, _T_1145) @[ifu_bp_ctl.scala 522:81]
    node _T_1147 = or(_T_1146, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1148 = bits(_T_1147, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_1 = mux(_T_1148, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1149 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1150 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1151 = eq(_T_1150, UInt<2>("h02")) @[ifu_bp_ctl.scala 522:74]
    node _T_1152 = and(_T_1149, _T_1151) @[ifu_bp_ctl.scala 522:23]
    node _T_1153 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1154 = eq(_T_1153, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1155 = and(_T_1152, _T_1154) @[ifu_bp_ctl.scala 522:81]
    node _T_1156 = or(_T_1155, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1157 = bits(_T_1156, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_2 = mux(_T_1157, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1158 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1159 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1160 = eq(_T_1159, UInt<2>("h03")) @[ifu_bp_ctl.scala 522:74]
    node _T_1161 = and(_T_1158, _T_1160) @[ifu_bp_ctl.scala 522:23]
    node _T_1162 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1163 = eq(_T_1162, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1164 = and(_T_1161, _T_1163) @[ifu_bp_ctl.scala 522:81]
    node _T_1165 = or(_T_1164, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1166 = bits(_T_1165, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_3 = mux(_T_1166, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1167 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1168 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1169 = eq(_T_1168, UInt<3>("h04")) @[ifu_bp_ctl.scala 522:74]
    node _T_1170 = and(_T_1167, _T_1169) @[ifu_bp_ctl.scala 522:23]
    node _T_1171 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1172 = eq(_T_1171, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1173 = and(_T_1170, _T_1172) @[ifu_bp_ctl.scala 522:81]
    node _T_1174 = or(_T_1173, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1175 = bits(_T_1174, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_4 = mux(_T_1175, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1176 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1177 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1178 = eq(_T_1177, UInt<3>("h05")) @[ifu_bp_ctl.scala 522:74]
    node _T_1179 = and(_T_1176, _T_1178) @[ifu_bp_ctl.scala 522:23]
    node _T_1180 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1181 = eq(_T_1180, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1182 = and(_T_1179, _T_1181) @[ifu_bp_ctl.scala 522:81]
    node _T_1183 = or(_T_1182, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1184 = bits(_T_1183, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_5 = mux(_T_1184, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1185 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1186 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1187 = eq(_T_1186, UInt<3>("h06")) @[ifu_bp_ctl.scala 522:74]
    node _T_1188 = and(_T_1185, _T_1187) @[ifu_bp_ctl.scala 522:23]
    node _T_1189 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1190 = eq(_T_1189, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1191 = and(_T_1188, _T_1190) @[ifu_bp_ctl.scala 522:81]
    node _T_1192 = or(_T_1191, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1193 = bits(_T_1192, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_6 = mux(_T_1193, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1194 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1195 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1196 = eq(_T_1195, UInt<3>("h07")) @[ifu_bp_ctl.scala 522:74]
    node _T_1197 = and(_T_1194, _T_1196) @[ifu_bp_ctl.scala 522:23]
    node _T_1198 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1199 = eq(_T_1198, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1200 = and(_T_1197, _T_1199) @[ifu_bp_ctl.scala 522:81]
    node _T_1201 = or(_T_1200, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1202 = bits(_T_1201, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_7 = mux(_T_1202, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1203 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1204 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1205 = eq(_T_1204, UInt<4>("h08")) @[ifu_bp_ctl.scala 522:74]
    node _T_1206 = and(_T_1203, _T_1205) @[ifu_bp_ctl.scala 522:23]
    node _T_1207 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1208 = eq(_T_1207, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1209 = and(_T_1206, _T_1208) @[ifu_bp_ctl.scala 522:81]
    node _T_1210 = or(_T_1209, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1211 = bits(_T_1210, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_8 = mux(_T_1211, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1212 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1213 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1214 = eq(_T_1213, UInt<4>("h09")) @[ifu_bp_ctl.scala 522:74]
    node _T_1215 = and(_T_1212, _T_1214) @[ifu_bp_ctl.scala 522:23]
    node _T_1216 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1217 = eq(_T_1216, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1218 = and(_T_1215, _T_1217) @[ifu_bp_ctl.scala 522:81]
    node _T_1219 = or(_T_1218, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1220 = bits(_T_1219, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_9 = mux(_T_1220, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1221 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1222 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1223 = eq(_T_1222, UInt<4>("h0a")) @[ifu_bp_ctl.scala 522:74]
    node _T_1224 = and(_T_1221, _T_1223) @[ifu_bp_ctl.scala 522:23]
    node _T_1225 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1226 = eq(_T_1225, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1227 = and(_T_1224, _T_1226) @[ifu_bp_ctl.scala 522:81]
    node _T_1228 = or(_T_1227, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1229 = bits(_T_1228, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_10 = mux(_T_1229, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1230 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1231 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1232 = eq(_T_1231, UInt<4>("h0b")) @[ifu_bp_ctl.scala 522:74]
    node _T_1233 = and(_T_1230, _T_1232) @[ifu_bp_ctl.scala 522:23]
    node _T_1234 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1235 = eq(_T_1234, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1236 = and(_T_1233, _T_1235) @[ifu_bp_ctl.scala 522:81]
    node _T_1237 = or(_T_1236, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1238 = bits(_T_1237, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_11 = mux(_T_1238, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1239 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1240 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1241 = eq(_T_1240, UInt<4>("h0c")) @[ifu_bp_ctl.scala 522:74]
    node _T_1242 = and(_T_1239, _T_1241) @[ifu_bp_ctl.scala 522:23]
    node _T_1243 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1244 = eq(_T_1243, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1245 = and(_T_1242, _T_1244) @[ifu_bp_ctl.scala 522:81]
    node _T_1246 = or(_T_1245, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1247 = bits(_T_1246, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_12 = mux(_T_1247, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1248 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1249 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1250 = eq(_T_1249, UInt<4>("h0d")) @[ifu_bp_ctl.scala 522:74]
    node _T_1251 = and(_T_1248, _T_1250) @[ifu_bp_ctl.scala 522:23]
    node _T_1252 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1253 = eq(_T_1252, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1254 = and(_T_1251, _T_1253) @[ifu_bp_ctl.scala 522:81]
    node _T_1255 = or(_T_1254, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1256 = bits(_T_1255, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_13 = mux(_T_1256, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1257 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1258 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1259 = eq(_T_1258, UInt<4>("h0e")) @[ifu_bp_ctl.scala 522:74]
    node _T_1260 = and(_T_1257, _T_1259) @[ifu_bp_ctl.scala 522:23]
    node _T_1261 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1262 = eq(_T_1261, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1263 = and(_T_1260, _T_1262) @[ifu_bp_ctl.scala 522:81]
    node _T_1264 = or(_T_1263, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1265 = bits(_T_1264, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_14 = mux(_T_1265, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    node _T_1266 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 522:20]
    node _T_1267 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:37]
    node _T_1268 = eq(_T_1267, UInt<4>("h0f")) @[ifu_bp_ctl.scala 522:74]
    node _T_1269 = and(_T_1266, _T_1268) @[ifu_bp_ctl.scala 522:23]
    node _T_1270 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 522:95]
    node _T_1271 = eq(_T_1270, UInt<1>("h00")) @[ifu_bp_ctl.scala 522:154]
    node _T_1272 = and(_T_1269, _T_1271) @[ifu_bp_ctl.scala 522:81]
    node _T_1273 = or(_T_1272, UInt<1>("h01")) @[ifu_bp_ctl.scala 522:161]
    node _T_1274 = bits(_T_1273, 0, 0) @[ifu_bp_ctl.scala 522:183]
    node bht_bank_wr_data_1_0_15 = mux(_T_1274, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 522:8]
    wire bht_bank_sel : UInt<1>[16][1][2] @[ifu_bp_ctl.scala 524:26]
    node _T_1275 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1276 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1277 = eq(_T_1276, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:97]
    node _T_1278 = and(_T_1275, _T_1277) @[ifu_bp_ctl.scala 530:45]
    node _T_1279 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1280 = eq(_T_1279, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1281 = or(_T_1280, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1282 = and(_T_1278, _T_1281) @[ifu_bp_ctl.scala 530:110]
    node _T_1283 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1284 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1285 = eq(_T_1284, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:74]
    node _T_1286 = and(_T_1283, _T_1285) @[ifu_bp_ctl.scala 531:22]
    node _T_1287 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1288 = eq(_T_1287, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1289 = or(_T_1288, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1290 = and(_T_1286, _T_1289) @[ifu_bp_ctl.scala 531:87]
    node _T_1291 = or(_T_1282, _T_1290) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][0] <= _T_1291 @[ifu_bp_ctl.scala 530:27]
    node _T_1292 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1293 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1294 = eq(_T_1293, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:97]
    node _T_1295 = and(_T_1292, _T_1294) @[ifu_bp_ctl.scala 530:45]
    node _T_1296 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1297 = eq(_T_1296, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1298 = or(_T_1297, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1299 = and(_T_1295, _T_1298) @[ifu_bp_ctl.scala 530:110]
    node _T_1300 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1301 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1302 = eq(_T_1301, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:74]
    node _T_1303 = and(_T_1300, _T_1302) @[ifu_bp_ctl.scala 531:22]
    node _T_1304 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1305 = eq(_T_1304, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1306 = or(_T_1305, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1307 = and(_T_1303, _T_1306) @[ifu_bp_ctl.scala 531:87]
    node _T_1308 = or(_T_1299, _T_1307) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][1] <= _T_1308 @[ifu_bp_ctl.scala 530:27]
    node _T_1309 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1310 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1311 = eq(_T_1310, UInt<2>("h02")) @[ifu_bp_ctl.scala 530:97]
    node _T_1312 = and(_T_1309, _T_1311) @[ifu_bp_ctl.scala 530:45]
    node _T_1313 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1314 = eq(_T_1313, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1315 = or(_T_1314, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1316 = and(_T_1312, _T_1315) @[ifu_bp_ctl.scala 530:110]
    node _T_1317 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1318 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1319 = eq(_T_1318, UInt<2>("h02")) @[ifu_bp_ctl.scala 531:74]
    node _T_1320 = and(_T_1317, _T_1319) @[ifu_bp_ctl.scala 531:22]
    node _T_1321 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1322 = eq(_T_1321, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1323 = or(_T_1322, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1324 = and(_T_1320, _T_1323) @[ifu_bp_ctl.scala 531:87]
    node _T_1325 = or(_T_1316, _T_1324) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][2] <= _T_1325 @[ifu_bp_ctl.scala 530:27]
    node _T_1326 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1327 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1328 = eq(_T_1327, UInt<2>("h03")) @[ifu_bp_ctl.scala 530:97]
    node _T_1329 = and(_T_1326, _T_1328) @[ifu_bp_ctl.scala 530:45]
    node _T_1330 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1331 = eq(_T_1330, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1332 = or(_T_1331, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1333 = and(_T_1329, _T_1332) @[ifu_bp_ctl.scala 530:110]
    node _T_1334 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1335 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1336 = eq(_T_1335, UInt<2>("h03")) @[ifu_bp_ctl.scala 531:74]
    node _T_1337 = and(_T_1334, _T_1336) @[ifu_bp_ctl.scala 531:22]
    node _T_1338 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1339 = eq(_T_1338, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1340 = or(_T_1339, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1341 = and(_T_1337, _T_1340) @[ifu_bp_ctl.scala 531:87]
    node _T_1342 = or(_T_1333, _T_1341) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][3] <= _T_1342 @[ifu_bp_ctl.scala 530:27]
    node _T_1343 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1344 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1345 = eq(_T_1344, UInt<3>("h04")) @[ifu_bp_ctl.scala 530:97]
    node _T_1346 = and(_T_1343, _T_1345) @[ifu_bp_ctl.scala 530:45]
    node _T_1347 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1348 = eq(_T_1347, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1349 = or(_T_1348, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1350 = and(_T_1346, _T_1349) @[ifu_bp_ctl.scala 530:110]
    node _T_1351 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1352 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1353 = eq(_T_1352, UInt<3>("h04")) @[ifu_bp_ctl.scala 531:74]
    node _T_1354 = and(_T_1351, _T_1353) @[ifu_bp_ctl.scala 531:22]
    node _T_1355 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1356 = eq(_T_1355, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1357 = or(_T_1356, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1358 = and(_T_1354, _T_1357) @[ifu_bp_ctl.scala 531:87]
    node _T_1359 = or(_T_1350, _T_1358) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][4] <= _T_1359 @[ifu_bp_ctl.scala 530:27]
    node _T_1360 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1361 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1362 = eq(_T_1361, UInt<3>("h05")) @[ifu_bp_ctl.scala 530:97]
    node _T_1363 = and(_T_1360, _T_1362) @[ifu_bp_ctl.scala 530:45]
    node _T_1364 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1365 = eq(_T_1364, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1366 = or(_T_1365, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1367 = and(_T_1363, _T_1366) @[ifu_bp_ctl.scala 530:110]
    node _T_1368 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1369 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1370 = eq(_T_1369, UInt<3>("h05")) @[ifu_bp_ctl.scala 531:74]
    node _T_1371 = and(_T_1368, _T_1370) @[ifu_bp_ctl.scala 531:22]
    node _T_1372 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1373 = eq(_T_1372, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1374 = or(_T_1373, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1375 = and(_T_1371, _T_1374) @[ifu_bp_ctl.scala 531:87]
    node _T_1376 = or(_T_1367, _T_1375) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][5] <= _T_1376 @[ifu_bp_ctl.scala 530:27]
    node _T_1377 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1378 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1379 = eq(_T_1378, UInt<3>("h06")) @[ifu_bp_ctl.scala 530:97]
    node _T_1380 = and(_T_1377, _T_1379) @[ifu_bp_ctl.scala 530:45]
    node _T_1381 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1382 = eq(_T_1381, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1383 = or(_T_1382, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1384 = and(_T_1380, _T_1383) @[ifu_bp_ctl.scala 530:110]
    node _T_1385 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1386 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1387 = eq(_T_1386, UInt<3>("h06")) @[ifu_bp_ctl.scala 531:74]
    node _T_1388 = and(_T_1385, _T_1387) @[ifu_bp_ctl.scala 531:22]
    node _T_1389 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1390 = eq(_T_1389, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1391 = or(_T_1390, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1392 = and(_T_1388, _T_1391) @[ifu_bp_ctl.scala 531:87]
    node _T_1393 = or(_T_1384, _T_1392) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][6] <= _T_1393 @[ifu_bp_ctl.scala 530:27]
    node _T_1394 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1395 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1396 = eq(_T_1395, UInt<3>("h07")) @[ifu_bp_ctl.scala 530:97]
    node _T_1397 = and(_T_1394, _T_1396) @[ifu_bp_ctl.scala 530:45]
    node _T_1398 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1399 = eq(_T_1398, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1400 = or(_T_1399, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1401 = and(_T_1397, _T_1400) @[ifu_bp_ctl.scala 530:110]
    node _T_1402 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1403 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1404 = eq(_T_1403, UInt<3>("h07")) @[ifu_bp_ctl.scala 531:74]
    node _T_1405 = and(_T_1402, _T_1404) @[ifu_bp_ctl.scala 531:22]
    node _T_1406 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1407 = eq(_T_1406, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1408 = or(_T_1407, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1409 = and(_T_1405, _T_1408) @[ifu_bp_ctl.scala 531:87]
    node _T_1410 = or(_T_1401, _T_1409) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][7] <= _T_1410 @[ifu_bp_ctl.scala 530:27]
    node _T_1411 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1412 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1413 = eq(_T_1412, UInt<4>("h08")) @[ifu_bp_ctl.scala 530:97]
    node _T_1414 = and(_T_1411, _T_1413) @[ifu_bp_ctl.scala 530:45]
    node _T_1415 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1416 = eq(_T_1415, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1417 = or(_T_1416, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1418 = and(_T_1414, _T_1417) @[ifu_bp_ctl.scala 530:110]
    node _T_1419 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1420 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1421 = eq(_T_1420, UInt<4>("h08")) @[ifu_bp_ctl.scala 531:74]
    node _T_1422 = and(_T_1419, _T_1421) @[ifu_bp_ctl.scala 531:22]
    node _T_1423 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1424 = eq(_T_1423, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1425 = or(_T_1424, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1426 = and(_T_1422, _T_1425) @[ifu_bp_ctl.scala 531:87]
    node _T_1427 = or(_T_1418, _T_1426) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][8] <= _T_1427 @[ifu_bp_ctl.scala 530:27]
    node _T_1428 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1429 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1430 = eq(_T_1429, UInt<4>("h09")) @[ifu_bp_ctl.scala 530:97]
    node _T_1431 = and(_T_1428, _T_1430) @[ifu_bp_ctl.scala 530:45]
    node _T_1432 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1433 = eq(_T_1432, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1434 = or(_T_1433, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1435 = and(_T_1431, _T_1434) @[ifu_bp_ctl.scala 530:110]
    node _T_1436 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1437 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1438 = eq(_T_1437, UInt<4>("h09")) @[ifu_bp_ctl.scala 531:74]
    node _T_1439 = and(_T_1436, _T_1438) @[ifu_bp_ctl.scala 531:22]
    node _T_1440 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1441 = eq(_T_1440, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1442 = or(_T_1441, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1443 = and(_T_1439, _T_1442) @[ifu_bp_ctl.scala 531:87]
    node _T_1444 = or(_T_1435, _T_1443) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][9] <= _T_1444 @[ifu_bp_ctl.scala 530:27]
    node _T_1445 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1446 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1447 = eq(_T_1446, UInt<4>("h0a")) @[ifu_bp_ctl.scala 530:97]
    node _T_1448 = and(_T_1445, _T_1447) @[ifu_bp_ctl.scala 530:45]
    node _T_1449 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1450 = eq(_T_1449, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1451 = or(_T_1450, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1452 = and(_T_1448, _T_1451) @[ifu_bp_ctl.scala 530:110]
    node _T_1453 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1454 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1455 = eq(_T_1454, UInt<4>("h0a")) @[ifu_bp_ctl.scala 531:74]
    node _T_1456 = and(_T_1453, _T_1455) @[ifu_bp_ctl.scala 531:22]
    node _T_1457 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1458 = eq(_T_1457, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1459 = or(_T_1458, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1460 = and(_T_1456, _T_1459) @[ifu_bp_ctl.scala 531:87]
    node _T_1461 = or(_T_1452, _T_1460) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][10] <= _T_1461 @[ifu_bp_ctl.scala 530:27]
    node _T_1462 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1463 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1464 = eq(_T_1463, UInt<4>("h0b")) @[ifu_bp_ctl.scala 530:97]
    node _T_1465 = and(_T_1462, _T_1464) @[ifu_bp_ctl.scala 530:45]
    node _T_1466 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1467 = eq(_T_1466, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1468 = or(_T_1467, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1469 = and(_T_1465, _T_1468) @[ifu_bp_ctl.scala 530:110]
    node _T_1470 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1471 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1472 = eq(_T_1471, UInt<4>("h0b")) @[ifu_bp_ctl.scala 531:74]
    node _T_1473 = and(_T_1470, _T_1472) @[ifu_bp_ctl.scala 531:22]
    node _T_1474 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1475 = eq(_T_1474, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1476 = or(_T_1475, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1477 = and(_T_1473, _T_1476) @[ifu_bp_ctl.scala 531:87]
    node _T_1478 = or(_T_1469, _T_1477) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][11] <= _T_1478 @[ifu_bp_ctl.scala 530:27]
    node _T_1479 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1480 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1481 = eq(_T_1480, UInt<4>("h0c")) @[ifu_bp_ctl.scala 530:97]
    node _T_1482 = and(_T_1479, _T_1481) @[ifu_bp_ctl.scala 530:45]
    node _T_1483 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1484 = eq(_T_1483, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1485 = or(_T_1484, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1486 = and(_T_1482, _T_1485) @[ifu_bp_ctl.scala 530:110]
    node _T_1487 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1488 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1489 = eq(_T_1488, UInt<4>("h0c")) @[ifu_bp_ctl.scala 531:74]
    node _T_1490 = and(_T_1487, _T_1489) @[ifu_bp_ctl.scala 531:22]
    node _T_1491 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1492 = eq(_T_1491, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1493 = or(_T_1492, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1494 = and(_T_1490, _T_1493) @[ifu_bp_ctl.scala 531:87]
    node _T_1495 = or(_T_1486, _T_1494) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][12] <= _T_1495 @[ifu_bp_ctl.scala 530:27]
    node _T_1496 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1497 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1498 = eq(_T_1497, UInt<4>("h0d")) @[ifu_bp_ctl.scala 530:97]
    node _T_1499 = and(_T_1496, _T_1498) @[ifu_bp_ctl.scala 530:45]
    node _T_1500 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1501 = eq(_T_1500, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1502 = or(_T_1501, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1503 = and(_T_1499, _T_1502) @[ifu_bp_ctl.scala 530:110]
    node _T_1504 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1505 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1506 = eq(_T_1505, UInt<4>("h0d")) @[ifu_bp_ctl.scala 531:74]
    node _T_1507 = and(_T_1504, _T_1506) @[ifu_bp_ctl.scala 531:22]
    node _T_1508 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1509 = eq(_T_1508, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1510 = or(_T_1509, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1511 = and(_T_1507, _T_1510) @[ifu_bp_ctl.scala 531:87]
    node _T_1512 = or(_T_1503, _T_1511) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][13] <= _T_1512 @[ifu_bp_ctl.scala 530:27]
    node _T_1513 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1514 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1515 = eq(_T_1514, UInt<4>("h0e")) @[ifu_bp_ctl.scala 530:97]
    node _T_1516 = and(_T_1513, _T_1515) @[ifu_bp_ctl.scala 530:45]
    node _T_1517 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1518 = eq(_T_1517, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1519 = or(_T_1518, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1520 = and(_T_1516, _T_1519) @[ifu_bp_ctl.scala 530:110]
    node _T_1521 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1522 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1523 = eq(_T_1522, UInt<4>("h0e")) @[ifu_bp_ctl.scala 531:74]
    node _T_1524 = and(_T_1521, _T_1523) @[ifu_bp_ctl.scala 531:22]
    node _T_1525 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1526 = eq(_T_1525, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1527 = or(_T_1526, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1528 = and(_T_1524, _T_1527) @[ifu_bp_ctl.scala 531:87]
    node _T_1529 = or(_T_1520, _T_1528) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][14] <= _T_1529 @[ifu_bp_ctl.scala 530:27]
    node _T_1530 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 530:41]
    node _T_1531 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1532 = eq(_T_1531, UInt<4>("h0f")) @[ifu_bp_ctl.scala 530:97]
    node _T_1533 = and(_T_1530, _T_1532) @[ifu_bp_ctl.scala 530:45]
    node _T_1534 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1535 = eq(_T_1534, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1536 = or(_T_1535, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1537 = and(_T_1533, _T_1536) @[ifu_bp_ctl.scala 530:110]
    node _T_1538 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 531:18]
    node _T_1539 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1540 = eq(_T_1539, UInt<4>("h0f")) @[ifu_bp_ctl.scala 531:74]
    node _T_1541 = and(_T_1538, _T_1540) @[ifu_bp_ctl.scala 531:22]
    node _T_1542 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1543 = eq(_T_1542, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1544 = or(_T_1543, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1545 = and(_T_1541, _T_1544) @[ifu_bp_ctl.scala 531:87]
    node _T_1546 = or(_T_1537, _T_1545) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[0][0][15] <= _T_1546 @[ifu_bp_ctl.scala 530:27]
    node _T_1547 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1548 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1549 = eq(_T_1548, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:97]
    node _T_1550 = and(_T_1547, _T_1549) @[ifu_bp_ctl.scala 530:45]
    node _T_1551 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1552 = eq(_T_1551, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1553 = or(_T_1552, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1554 = and(_T_1550, _T_1553) @[ifu_bp_ctl.scala 530:110]
    node _T_1555 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1556 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1557 = eq(_T_1556, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:74]
    node _T_1558 = and(_T_1555, _T_1557) @[ifu_bp_ctl.scala 531:22]
    node _T_1559 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1560 = eq(_T_1559, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1561 = or(_T_1560, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1562 = and(_T_1558, _T_1561) @[ifu_bp_ctl.scala 531:87]
    node _T_1563 = or(_T_1554, _T_1562) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][0] <= _T_1563 @[ifu_bp_ctl.scala 530:27]
    node _T_1564 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1565 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1566 = eq(_T_1565, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:97]
    node _T_1567 = and(_T_1564, _T_1566) @[ifu_bp_ctl.scala 530:45]
    node _T_1568 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1569 = eq(_T_1568, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1570 = or(_T_1569, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1571 = and(_T_1567, _T_1570) @[ifu_bp_ctl.scala 530:110]
    node _T_1572 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1573 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1574 = eq(_T_1573, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:74]
    node _T_1575 = and(_T_1572, _T_1574) @[ifu_bp_ctl.scala 531:22]
    node _T_1576 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1577 = eq(_T_1576, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1578 = or(_T_1577, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1579 = and(_T_1575, _T_1578) @[ifu_bp_ctl.scala 531:87]
    node _T_1580 = or(_T_1571, _T_1579) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][1] <= _T_1580 @[ifu_bp_ctl.scala 530:27]
    node _T_1581 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1582 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1583 = eq(_T_1582, UInt<2>("h02")) @[ifu_bp_ctl.scala 530:97]
    node _T_1584 = and(_T_1581, _T_1583) @[ifu_bp_ctl.scala 530:45]
    node _T_1585 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1586 = eq(_T_1585, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1587 = or(_T_1586, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1588 = and(_T_1584, _T_1587) @[ifu_bp_ctl.scala 530:110]
    node _T_1589 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1590 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1591 = eq(_T_1590, UInt<2>("h02")) @[ifu_bp_ctl.scala 531:74]
    node _T_1592 = and(_T_1589, _T_1591) @[ifu_bp_ctl.scala 531:22]
    node _T_1593 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1594 = eq(_T_1593, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1595 = or(_T_1594, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1596 = and(_T_1592, _T_1595) @[ifu_bp_ctl.scala 531:87]
    node _T_1597 = or(_T_1588, _T_1596) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][2] <= _T_1597 @[ifu_bp_ctl.scala 530:27]
    node _T_1598 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1599 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1600 = eq(_T_1599, UInt<2>("h03")) @[ifu_bp_ctl.scala 530:97]
    node _T_1601 = and(_T_1598, _T_1600) @[ifu_bp_ctl.scala 530:45]
    node _T_1602 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1603 = eq(_T_1602, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1604 = or(_T_1603, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1605 = and(_T_1601, _T_1604) @[ifu_bp_ctl.scala 530:110]
    node _T_1606 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1607 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1608 = eq(_T_1607, UInt<2>("h03")) @[ifu_bp_ctl.scala 531:74]
    node _T_1609 = and(_T_1606, _T_1608) @[ifu_bp_ctl.scala 531:22]
    node _T_1610 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1611 = eq(_T_1610, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1612 = or(_T_1611, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1613 = and(_T_1609, _T_1612) @[ifu_bp_ctl.scala 531:87]
    node _T_1614 = or(_T_1605, _T_1613) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][3] <= _T_1614 @[ifu_bp_ctl.scala 530:27]
    node _T_1615 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1616 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1617 = eq(_T_1616, UInt<3>("h04")) @[ifu_bp_ctl.scala 530:97]
    node _T_1618 = and(_T_1615, _T_1617) @[ifu_bp_ctl.scala 530:45]
    node _T_1619 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1620 = eq(_T_1619, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1621 = or(_T_1620, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1622 = and(_T_1618, _T_1621) @[ifu_bp_ctl.scala 530:110]
    node _T_1623 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1624 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1625 = eq(_T_1624, UInt<3>("h04")) @[ifu_bp_ctl.scala 531:74]
    node _T_1626 = and(_T_1623, _T_1625) @[ifu_bp_ctl.scala 531:22]
    node _T_1627 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1628 = eq(_T_1627, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1629 = or(_T_1628, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1630 = and(_T_1626, _T_1629) @[ifu_bp_ctl.scala 531:87]
    node _T_1631 = or(_T_1622, _T_1630) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][4] <= _T_1631 @[ifu_bp_ctl.scala 530:27]
    node _T_1632 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1633 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1634 = eq(_T_1633, UInt<3>("h05")) @[ifu_bp_ctl.scala 530:97]
    node _T_1635 = and(_T_1632, _T_1634) @[ifu_bp_ctl.scala 530:45]
    node _T_1636 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1637 = eq(_T_1636, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1638 = or(_T_1637, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1639 = and(_T_1635, _T_1638) @[ifu_bp_ctl.scala 530:110]
    node _T_1640 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1641 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1642 = eq(_T_1641, UInt<3>("h05")) @[ifu_bp_ctl.scala 531:74]
    node _T_1643 = and(_T_1640, _T_1642) @[ifu_bp_ctl.scala 531:22]
    node _T_1644 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1645 = eq(_T_1644, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1646 = or(_T_1645, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1647 = and(_T_1643, _T_1646) @[ifu_bp_ctl.scala 531:87]
    node _T_1648 = or(_T_1639, _T_1647) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][5] <= _T_1648 @[ifu_bp_ctl.scala 530:27]
    node _T_1649 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1650 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1651 = eq(_T_1650, UInt<3>("h06")) @[ifu_bp_ctl.scala 530:97]
    node _T_1652 = and(_T_1649, _T_1651) @[ifu_bp_ctl.scala 530:45]
    node _T_1653 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1654 = eq(_T_1653, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1655 = or(_T_1654, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1656 = and(_T_1652, _T_1655) @[ifu_bp_ctl.scala 530:110]
    node _T_1657 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1658 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1659 = eq(_T_1658, UInt<3>("h06")) @[ifu_bp_ctl.scala 531:74]
    node _T_1660 = and(_T_1657, _T_1659) @[ifu_bp_ctl.scala 531:22]
    node _T_1661 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1662 = eq(_T_1661, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1663 = or(_T_1662, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1664 = and(_T_1660, _T_1663) @[ifu_bp_ctl.scala 531:87]
    node _T_1665 = or(_T_1656, _T_1664) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][6] <= _T_1665 @[ifu_bp_ctl.scala 530:27]
    node _T_1666 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1667 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1668 = eq(_T_1667, UInt<3>("h07")) @[ifu_bp_ctl.scala 530:97]
    node _T_1669 = and(_T_1666, _T_1668) @[ifu_bp_ctl.scala 530:45]
    node _T_1670 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1671 = eq(_T_1670, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1672 = or(_T_1671, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1673 = and(_T_1669, _T_1672) @[ifu_bp_ctl.scala 530:110]
    node _T_1674 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1675 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1676 = eq(_T_1675, UInt<3>("h07")) @[ifu_bp_ctl.scala 531:74]
    node _T_1677 = and(_T_1674, _T_1676) @[ifu_bp_ctl.scala 531:22]
    node _T_1678 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1679 = eq(_T_1678, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1680 = or(_T_1679, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1681 = and(_T_1677, _T_1680) @[ifu_bp_ctl.scala 531:87]
    node _T_1682 = or(_T_1673, _T_1681) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][7] <= _T_1682 @[ifu_bp_ctl.scala 530:27]
    node _T_1683 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1684 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1685 = eq(_T_1684, UInt<4>("h08")) @[ifu_bp_ctl.scala 530:97]
    node _T_1686 = and(_T_1683, _T_1685) @[ifu_bp_ctl.scala 530:45]
    node _T_1687 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1688 = eq(_T_1687, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1689 = or(_T_1688, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1690 = and(_T_1686, _T_1689) @[ifu_bp_ctl.scala 530:110]
    node _T_1691 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1692 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1693 = eq(_T_1692, UInt<4>("h08")) @[ifu_bp_ctl.scala 531:74]
    node _T_1694 = and(_T_1691, _T_1693) @[ifu_bp_ctl.scala 531:22]
    node _T_1695 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1696 = eq(_T_1695, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1697 = or(_T_1696, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1698 = and(_T_1694, _T_1697) @[ifu_bp_ctl.scala 531:87]
    node _T_1699 = or(_T_1690, _T_1698) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][8] <= _T_1699 @[ifu_bp_ctl.scala 530:27]
    node _T_1700 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1701 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1702 = eq(_T_1701, UInt<4>("h09")) @[ifu_bp_ctl.scala 530:97]
    node _T_1703 = and(_T_1700, _T_1702) @[ifu_bp_ctl.scala 530:45]
    node _T_1704 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1705 = eq(_T_1704, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1706 = or(_T_1705, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1707 = and(_T_1703, _T_1706) @[ifu_bp_ctl.scala 530:110]
    node _T_1708 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1709 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1710 = eq(_T_1709, UInt<4>("h09")) @[ifu_bp_ctl.scala 531:74]
    node _T_1711 = and(_T_1708, _T_1710) @[ifu_bp_ctl.scala 531:22]
    node _T_1712 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1713 = eq(_T_1712, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1714 = or(_T_1713, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1715 = and(_T_1711, _T_1714) @[ifu_bp_ctl.scala 531:87]
    node _T_1716 = or(_T_1707, _T_1715) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][9] <= _T_1716 @[ifu_bp_ctl.scala 530:27]
    node _T_1717 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1718 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1719 = eq(_T_1718, UInt<4>("h0a")) @[ifu_bp_ctl.scala 530:97]
    node _T_1720 = and(_T_1717, _T_1719) @[ifu_bp_ctl.scala 530:45]
    node _T_1721 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1722 = eq(_T_1721, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1723 = or(_T_1722, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1724 = and(_T_1720, _T_1723) @[ifu_bp_ctl.scala 530:110]
    node _T_1725 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1726 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1727 = eq(_T_1726, UInt<4>("h0a")) @[ifu_bp_ctl.scala 531:74]
    node _T_1728 = and(_T_1725, _T_1727) @[ifu_bp_ctl.scala 531:22]
    node _T_1729 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1730 = eq(_T_1729, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1731 = or(_T_1730, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1732 = and(_T_1728, _T_1731) @[ifu_bp_ctl.scala 531:87]
    node _T_1733 = or(_T_1724, _T_1732) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][10] <= _T_1733 @[ifu_bp_ctl.scala 530:27]
    node _T_1734 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1735 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1736 = eq(_T_1735, UInt<4>("h0b")) @[ifu_bp_ctl.scala 530:97]
    node _T_1737 = and(_T_1734, _T_1736) @[ifu_bp_ctl.scala 530:45]
    node _T_1738 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1739 = eq(_T_1738, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1740 = or(_T_1739, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1741 = and(_T_1737, _T_1740) @[ifu_bp_ctl.scala 530:110]
    node _T_1742 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1743 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1744 = eq(_T_1743, UInt<4>("h0b")) @[ifu_bp_ctl.scala 531:74]
    node _T_1745 = and(_T_1742, _T_1744) @[ifu_bp_ctl.scala 531:22]
    node _T_1746 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1747 = eq(_T_1746, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1748 = or(_T_1747, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1749 = and(_T_1745, _T_1748) @[ifu_bp_ctl.scala 531:87]
    node _T_1750 = or(_T_1741, _T_1749) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][11] <= _T_1750 @[ifu_bp_ctl.scala 530:27]
    node _T_1751 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1752 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1753 = eq(_T_1752, UInt<4>("h0c")) @[ifu_bp_ctl.scala 530:97]
    node _T_1754 = and(_T_1751, _T_1753) @[ifu_bp_ctl.scala 530:45]
    node _T_1755 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1756 = eq(_T_1755, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1757 = or(_T_1756, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1758 = and(_T_1754, _T_1757) @[ifu_bp_ctl.scala 530:110]
    node _T_1759 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1760 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1761 = eq(_T_1760, UInt<4>("h0c")) @[ifu_bp_ctl.scala 531:74]
    node _T_1762 = and(_T_1759, _T_1761) @[ifu_bp_ctl.scala 531:22]
    node _T_1763 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1764 = eq(_T_1763, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1765 = or(_T_1764, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1766 = and(_T_1762, _T_1765) @[ifu_bp_ctl.scala 531:87]
    node _T_1767 = or(_T_1758, _T_1766) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][12] <= _T_1767 @[ifu_bp_ctl.scala 530:27]
    node _T_1768 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1769 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1770 = eq(_T_1769, UInt<4>("h0d")) @[ifu_bp_ctl.scala 530:97]
    node _T_1771 = and(_T_1768, _T_1770) @[ifu_bp_ctl.scala 530:45]
    node _T_1772 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1773 = eq(_T_1772, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1774 = or(_T_1773, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1775 = and(_T_1771, _T_1774) @[ifu_bp_ctl.scala 530:110]
    node _T_1776 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1777 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1778 = eq(_T_1777, UInt<4>("h0d")) @[ifu_bp_ctl.scala 531:74]
    node _T_1779 = and(_T_1776, _T_1778) @[ifu_bp_ctl.scala 531:22]
    node _T_1780 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1781 = eq(_T_1780, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1782 = or(_T_1781, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1783 = and(_T_1779, _T_1782) @[ifu_bp_ctl.scala 531:87]
    node _T_1784 = or(_T_1775, _T_1783) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][13] <= _T_1784 @[ifu_bp_ctl.scala 530:27]
    node _T_1785 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1786 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1787 = eq(_T_1786, UInt<4>("h0e")) @[ifu_bp_ctl.scala 530:97]
    node _T_1788 = and(_T_1785, _T_1787) @[ifu_bp_ctl.scala 530:45]
    node _T_1789 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1790 = eq(_T_1789, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1791 = or(_T_1790, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1792 = and(_T_1788, _T_1791) @[ifu_bp_ctl.scala 530:110]
    node _T_1793 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1794 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1795 = eq(_T_1794, UInt<4>("h0e")) @[ifu_bp_ctl.scala 531:74]
    node _T_1796 = and(_T_1793, _T_1795) @[ifu_bp_ctl.scala 531:22]
    node _T_1797 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1798 = eq(_T_1797, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1799 = or(_T_1798, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1800 = and(_T_1796, _T_1799) @[ifu_bp_ctl.scala 531:87]
    node _T_1801 = or(_T_1792, _T_1800) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][14] <= _T_1801 @[ifu_bp_ctl.scala 530:27]
    node _T_1802 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 530:41]
    node _T_1803 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:60]
    node _T_1804 = eq(_T_1803, UInt<4>("h0f")) @[ifu_bp_ctl.scala 530:97]
    node _T_1805 = and(_T_1802, _T_1804) @[ifu_bp_ctl.scala 530:45]
    node _T_1806 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 530:126]
    node _T_1807 = eq(_T_1806, UInt<1>("h00")) @[ifu_bp_ctl.scala 530:186]
    node _T_1808 = or(_T_1807, UInt<1>("h01")) @[ifu_bp_ctl.scala 530:199]
    node _T_1809 = and(_T_1805, _T_1808) @[ifu_bp_ctl.scala 530:110]
    node _T_1810 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 531:18]
    node _T_1811 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:37]
    node _T_1812 = eq(_T_1811, UInt<4>("h0f")) @[ifu_bp_ctl.scala 531:74]
    node _T_1813 = and(_T_1810, _T_1812) @[ifu_bp_ctl.scala 531:22]
    node _T_1814 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 531:103]
    node _T_1815 = eq(_T_1814, UInt<1>("h00")) @[ifu_bp_ctl.scala 531:163]
    node _T_1816 = or(_T_1815, UInt<1>("h01")) @[ifu_bp_ctl.scala 531:176]
    node _T_1817 = and(_T_1813, _T_1816) @[ifu_bp_ctl.scala 531:87]
    node _T_1818 = or(_T_1809, _T_1817) @[ifu_bp_ctl.scala 530:223]
    bht_bank_sel[1][0][15] <= _T_1818 @[ifu_bp_ctl.scala 530:27]
    wire bht_bank_rd_data_out : UInt<2>[16][2] @[ifu_bp_ctl.scala 534:34]
    node _T_1819 = and(bht_bank_sel[0][0][0], bht_bank_sel[0][0][0]) @[lib.scala 383:57]
    reg _T_1820 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1819 : @[Reg.scala 28:19]
      _T_1820 <= bht_bank_wr_data_0_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][0] <= _T_1820 @[ifu_bp_ctl.scala 536:39]
    node _T_1821 = and(bht_bank_sel[0][0][1], bht_bank_sel[0][0][1]) @[lib.scala 383:57]
    reg _T_1822 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1821 : @[Reg.scala 28:19]
      _T_1822 <= bht_bank_wr_data_0_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][1] <= _T_1822 @[ifu_bp_ctl.scala 536:39]
    node _T_1823 = and(bht_bank_sel[0][0][2], bht_bank_sel[0][0][2]) @[lib.scala 383:57]
    reg _T_1824 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1823 : @[Reg.scala 28:19]
      _T_1824 <= bht_bank_wr_data_0_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][2] <= _T_1824 @[ifu_bp_ctl.scala 536:39]
    node _T_1825 = and(bht_bank_sel[0][0][3], bht_bank_sel[0][0][3]) @[lib.scala 383:57]
    reg _T_1826 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1825 : @[Reg.scala 28:19]
      _T_1826 <= bht_bank_wr_data_0_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][3] <= _T_1826 @[ifu_bp_ctl.scala 536:39]
    node _T_1827 = and(bht_bank_sel[0][0][4], bht_bank_sel[0][0][4]) @[lib.scala 383:57]
    reg _T_1828 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1827 : @[Reg.scala 28:19]
      _T_1828 <= bht_bank_wr_data_0_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][4] <= _T_1828 @[ifu_bp_ctl.scala 536:39]
    node _T_1829 = and(bht_bank_sel[0][0][5], bht_bank_sel[0][0][5]) @[lib.scala 383:57]
    reg _T_1830 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1829 : @[Reg.scala 28:19]
      _T_1830 <= bht_bank_wr_data_0_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][5] <= _T_1830 @[ifu_bp_ctl.scala 536:39]
    node _T_1831 = and(bht_bank_sel[0][0][6], bht_bank_sel[0][0][6]) @[lib.scala 383:57]
    reg _T_1832 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1831 : @[Reg.scala 28:19]
      _T_1832 <= bht_bank_wr_data_0_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][6] <= _T_1832 @[ifu_bp_ctl.scala 536:39]
    node _T_1833 = and(bht_bank_sel[0][0][7], bht_bank_sel[0][0][7]) @[lib.scala 383:57]
    reg _T_1834 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1833 : @[Reg.scala 28:19]
      _T_1834 <= bht_bank_wr_data_0_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][7] <= _T_1834 @[ifu_bp_ctl.scala 536:39]
    node _T_1835 = and(bht_bank_sel[0][0][8], bht_bank_sel[0][0][8]) @[lib.scala 383:57]
    reg _T_1836 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1835 : @[Reg.scala 28:19]
      _T_1836 <= bht_bank_wr_data_0_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][8] <= _T_1836 @[ifu_bp_ctl.scala 536:39]
    node _T_1837 = and(bht_bank_sel[0][0][9], bht_bank_sel[0][0][9]) @[lib.scala 383:57]
    reg _T_1838 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1837 : @[Reg.scala 28:19]
      _T_1838 <= bht_bank_wr_data_0_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][9] <= _T_1838 @[ifu_bp_ctl.scala 536:39]
    node _T_1839 = and(bht_bank_sel[0][0][10], bht_bank_sel[0][0][10]) @[lib.scala 383:57]
    reg _T_1840 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1839 : @[Reg.scala 28:19]
      _T_1840 <= bht_bank_wr_data_0_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][10] <= _T_1840 @[ifu_bp_ctl.scala 536:39]
    node _T_1841 = and(bht_bank_sel[0][0][11], bht_bank_sel[0][0][11]) @[lib.scala 383:57]
    reg _T_1842 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1841 : @[Reg.scala 28:19]
      _T_1842 <= bht_bank_wr_data_0_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][11] <= _T_1842 @[ifu_bp_ctl.scala 536:39]
    node _T_1843 = and(bht_bank_sel[0][0][12], bht_bank_sel[0][0][12]) @[lib.scala 383:57]
    reg _T_1844 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1843 : @[Reg.scala 28:19]
      _T_1844 <= bht_bank_wr_data_0_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][12] <= _T_1844 @[ifu_bp_ctl.scala 536:39]
    node _T_1845 = and(bht_bank_sel[0][0][13], bht_bank_sel[0][0][13]) @[lib.scala 383:57]
    reg _T_1846 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1845 : @[Reg.scala 28:19]
      _T_1846 <= bht_bank_wr_data_0_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][13] <= _T_1846 @[ifu_bp_ctl.scala 536:39]
    node _T_1847 = and(bht_bank_sel[0][0][14], bht_bank_sel[0][0][14]) @[lib.scala 383:57]
    reg _T_1848 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1847 : @[Reg.scala 28:19]
      _T_1848 <= bht_bank_wr_data_0_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][14] <= _T_1848 @[ifu_bp_ctl.scala 536:39]
    node _T_1849 = and(bht_bank_sel[0][0][15], bht_bank_sel[0][0][15]) @[lib.scala 383:57]
    reg _T_1850 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1849 : @[Reg.scala 28:19]
      _T_1850 <= bht_bank_wr_data_0_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][15] <= _T_1850 @[ifu_bp_ctl.scala 536:39]
    node _T_1851 = and(bht_bank_sel[1][0][0], bht_bank_sel[1][0][0]) @[lib.scala 383:57]
    reg _T_1852 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1851 : @[Reg.scala 28:19]
      _T_1852 <= bht_bank_wr_data_1_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][0] <= _T_1852 @[ifu_bp_ctl.scala 536:39]
    node _T_1853 = and(bht_bank_sel[1][0][1], bht_bank_sel[1][0][1]) @[lib.scala 383:57]
    reg _T_1854 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1853 : @[Reg.scala 28:19]
      _T_1854 <= bht_bank_wr_data_1_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][1] <= _T_1854 @[ifu_bp_ctl.scala 536:39]
    node _T_1855 = and(bht_bank_sel[1][0][2], bht_bank_sel[1][0][2]) @[lib.scala 383:57]
    reg _T_1856 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1855 : @[Reg.scala 28:19]
      _T_1856 <= bht_bank_wr_data_1_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][2] <= _T_1856 @[ifu_bp_ctl.scala 536:39]
    node _T_1857 = and(bht_bank_sel[1][0][3], bht_bank_sel[1][0][3]) @[lib.scala 383:57]
    reg _T_1858 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1857 : @[Reg.scala 28:19]
      _T_1858 <= bht_bank_wr_data_1_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][3] <= _T_1858 @[ifu_bp_ctl.scala 536:39]
    node _T_1859 = and(bht_bank_sel[1][0][4], bht_bank_sel[1][0][4]) @[lib.scala 383:57]
    reg _T_1860 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1859 : @[Reg.scala 28:19]
      _T_1860 <= bht_bank_wr_data_1_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][4] <= _T_1860 @[ifu_bp_ctl.scala 536:39]
    node _T_1861 = and(bht_bank_sel[1][0][5], bht_bank_sel[1][0][5]) @[lib.scala 383:57]
    reg _T_1862 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1861 : @[Reg.scala 28:19]
      _T_1862 <= bht_bank_wr_data_1_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][5] <= _T_1862 @[ifu_bp_ctl.scala 536:39]
    node _T_1863 = and(bht_bank_sel[1][0][6], bht_bank_sel[1][0][6]) @[lib.scala 383:57]
    reg _T_1864 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1863 : @[Reg.scala 28:19]
      _T_1864 <= bht_bank_wr_data_1_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][6] <= _T_1864 @[ifu_bp_ctl.scala 536:39]
    node _T_1865 = and(bht_bank_sel[1][0][7], bht_bank_sel[1][0][7]) @[lib.scala 383:57]
    reg _T_1866 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1865 : @[Reg.scala 28:19]
      _T_1866 <= bht_bank_wr_data_1_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][7] <= _T_1866 @[ifu_bp_ctl.scala 536:39]
    node _T_1867 = and(bht_bank_sel[1][0][8], bht_bank_sel[1][0][8]) @[lib.scala 383:57]
    reg _T_1868 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1867 : @[Reg.scala 28:19]
      _T_1868 <= bht_bank_wr_data_1_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][8] <= _T_1868 @[ifu_bp_ctl.scala 536:39]
    node _T_1869 = and(bht_bank_sel[1][0][9], bht_bank_sel[1][0][9]) @[lib.scala 383:57]
    reg _T_1870 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1869 : @[Reg.scala 28:19]
      _T_1870 <= bht_bank_wr_data_1_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][9] <= _T_1870 @[ifu_bp_ctl.scala 536:39]
    node _T_1871 = and(bht_bank_sel[1][0][10], bht_bank_sel[1][0][10]) @[lib.scala 383:57]
    reg _T_1872 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1871 : @[Reg.scala 28:19]
      _T_1872 <= bht_bank_wr_data_1_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][10] <= _T_1872 @[ifu_bp_ctl.scala 536:39]
    node _T_1873 = and(bht_bank_sel[1][0][11], bht_bank_sel[1][0][11]) @[lib.scala 383:57]
    reg _T_1874 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1873 : @[Reg.scala 28:19]
      _T_1874 <= bht_bank_wr_data_1_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][11] <= _T_1874 @[ifu_bp_ctl.scala 536:39]
    node _T_1875 = and(bht_bank_sel[1][0][12], bht_bank_sel[1][0][12]) @[lib.scala 383:57]
    reg _T_1876 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1875 : @[Reg.scala 28:19]
      _T_1876 <= bht_bank_wr_data_1_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][12] <= _T_1876 @[ifu_bp_ctl.scala 536:39]
    node _T_1877 = and(bht_bank_sel[1][0][13], bht_bank_sel[1][0][13]) @[lib.scala 383:57]
    reg _T_1878 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1877 : @[Reg.scala 28:19]
      _T_1878 <= bht_bank_wr_data_1_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][13] <= _T_1878 @[ifu_bp_ctl.scala 536:39]
    node _T_1879 = and(bht_bank_sel[1][0][14], bht_bank_sel[1][0][14]) @[lib.scala 383:57]
    reg _T_1880 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1879 : @[Reg.scala 28:19]
      _T_1880 <= bht_bank_wr_data_1_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][14] <= _T_1880 @[ifu_bp_ctl.scala 536:39]
    node _T_1881 = and(bht_bank_sel[1][0][15], bht_bank_sel[1][0][15]) @[lib.scala 383:57]
    reg _T_1882 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1881 : @[Reg.scala 28:19]
      _T_1882 <= bht_bank_wr_data_1_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][15] <= _T_1882 @[ifu_bp_ctl.scala 536:39]
    node _T_1883 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 539:79]
    node _T_1884 = bits(_T_1883, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1885 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 539:79]
    node _T_1886 = bits(_T_1885, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1887 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 539:79]
    node _T_1888 = bits(_T_1887, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1889 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 539:79]
    node _T_1890 = bits(_T_1889, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1891 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 539:79]
    node _T_1892 = bits(_T_1891, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1893 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 539:79]
    node _T_1894 = bits(_T_1893, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1895 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 539:79]
    node _T_1896 = bits(_T_1895, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1897 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 539:79]
    node _T_1898 = bits(_T_1897, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1899 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 539:79]
    node _T_1900 = bits(_T_1899, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1901 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 539:79]
    node _T_1902 = bits(_T_1901, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1903 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 539:79]
    node _T_1904 = bits(_T_1903, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1905 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 539:79]
    node _T_1906 = bits(_T_1905, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1907 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 539:79]
    node _T_1908 = bits(_T_1907, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1909 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 539:79]
    node _T_1910 = bits(_T_1909, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1911 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 539:79]
    node _T_1912 = bits(_T_1911, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1913 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 539:79]
    node _T_1914 = bits(_T_1913, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1915 = mux(_T_1884, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1916 = mux(_T_1886, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1917 = mux(_T_1888, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1918 = mux(_T_1890, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1919 = mux(_T_1892, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1920 = mux(_T_1894, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1921 = mux(_T_1896, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1922 = mux(_T_1898, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1923 = mux(_T_1900, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1924 = mux(_T_1902, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1925 = mux(_T_1904, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1926 = mux(_T_1906, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1927 = mux(_T_1908, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1928 = mux(_T_1910, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1929 = mux(_T_1912, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1930 = mux(_T_1914, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1931 = or(_T_1915, _T_1916) @[Mux.scala 27:72]
    node _T_1932 = or(_T_1931, _T_1917) @[Mux.scala 27:72]
    node _T_1933 = or(_T_1932, _T_1918) @[Mux.scala 27:72]
    node _T_1934 = or(_T_1933, _T_1919) @[Mux.scala 27:72]
    node _T_1935 = or(_T_1934, _T_1920) @[Mux.scala 27:72]
    node _T_1936 = or(_T_1935, _T_1921) @[Mux.scala 27:72]
    node _T_1937 = or(_T_1936, _T_1922) @[Mux.scala 27:72]
    node _T_1938 = or(_T_1937, _T_1923) @[Mux.scala 27:72]
    node _T_1939 = or(_T_1938, _T_1924) @[Mux.scala 27:72]
    node _T_1940 = or(_T_1939, _T_1925) @[Mux.scala 27:72]
    node _T_1941 = or(_T_1940, _T_1926) @[Mux.scala 27:72]
    node _T_1942 = or(_T_1941, _T_1927) @[Mux.scala 27:72]
    node _T_1943 = or(_T_1942, _T_1928) @[Mux.scala 27:72]
    node _T_1944 = or(_T_1943, _T_1929) @[Mux.scala 27:72]
    node _T_1945 = or(_T_1944, _T_1930) @[Mux.scala 27:72]
    wire _T_1946 : UInt<2> @[Mux.scala 27:72]
    _T_1946 <= _T_1945 @[Mux.scala 27:72]
    bht_bank0_rd_data_f <= _T_1946 @[ifu_bp_ctl.scala 539:23]
    node _T_1947 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 540:79]
    node _T_1948 = bits(_T_1947, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1949 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 540:79]
    node _T_1950 = bits(_T_1949, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1951 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 540:79]
    node _T_1952 = bits(_T_1951, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1953 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 540:79]
    node _T_1954 = bits(_T_1953, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1955 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 540:79]
    node _T_1956 = bits(_T_1955, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1957 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 540:79]
    node _T_1958 = bits(_T_1957, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1959 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 540:79]
    node _T_1960 = bits(_T_1959, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1961 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 540:79]
    node _T_1962 = bits(_T_1961, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1963 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 540:79]
    node _T_1964 = bits(_T_1963, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1965 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 540:79]
    node _T_1966 = bits(_T_1965, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1967 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 540:79]
    node _T_1968 = bits(_T_1967, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1969 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 540:79]
    node _T_1970 = bits(_T_1969, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1971 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 540:79]
    node _T_1972 = bits(_T_1971, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1973 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 540:79]
    node _T_1974 = bits(_T_1973, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1975 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 540:79]
    node _T_1976 = bits(_T_1975, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1977 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 540:79]
    node _T_1978 = bits(_T_1977, 0, 0) @[ifu_bp_ctl.scala 540:87]
    node _T_1979 = mux(_T_1948, bht_bank_rd_data_out[1][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1980 = mux(_T_1950, bht_bank_rd_data_out[1][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1981 = mux(_T_1952, bht_bank_rd_data_out[1][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1982 = mux(_T_1954, bht_bank_rd_data_out[1][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1983 = mux(_T_1956, bht_bank_rd_data_out[1][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1984 = mux(_T_1958, bht_bank_rd_data_out[1][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1985 = mux(_T_1960, bht_bank_rd_data_out[1][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1986 = mux(_T_1962, bht_bank_rd_data_out[1][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1987 = mux(_T_1964, bht_bank_rd_data_out[1][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1988 = mux(_T_1966, bht_bank_rd_data_out[1][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1989 = mux(_T_1968, bht_bank_rd_data_out[1][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1990 = mux(_T_1970, bht_bank_rd_data_out[1][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1991 = mux(_T_1972, bht_bank_rd_data_out[1][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1992 = mux(_T_1974, bht_bank_rd_data_out[1][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1993 = mux(_T_1976, bht_bank_rd_data_out[1][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1994 = mux(_T_1978, bht_bank_rd_data_out[1][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1995 = or(_T_1979, _T_1980) @[Mux.scala 27:72]
    node _T_1996 = or(_T_1995, _T_1981) @[Mux.scala 27:72]
    node _T_1997 = or(_T_1996, _T_1982) @[Mux.scala 27:72]
    node _T_1998 = or(_T_1997, _T_1983) @[Mux.scala 27:72]
    node _T_1999 = or(_T_1998, _T_1984) @[Mux.scala 27:72]
    node _T_2000 = or(_T_1999, _T_1985) @[Mux.scala 27:72]
    node _T_2001 = or(_T_2000, _T_1986) @[Mux.scala 27:72]
    node _T_2002 = or(_T_2001, _T_1987) @[Mux.scala 27:72]
    node _T_2003 = or(_T_2002, _T_1988) @[Mux.scala 27:72]
    node _T_2004 = or(_T_2003, _T_1989) @[Mux.scala 27:72]
    node _T_2005 = or(_T_2004, _T_1990) @[Mux.scala 27:72]
    node _T_2006 = or(_T_2005, _T_1991) @[Mux.scala 27:72]
    node _T_2007 = or(_T_2006, _T_1992) @[Mux.scala 27:72]
    node _T_2008 = or(_T_2007, _T_1993) @[Mux.scala 27:72]
    node _T_2009 = or(_T_2008, _T_1994) @[Mux.scala 27:72]
    wire _T_2010 : UInt<2> @[Mux.scala 27:72]
    _T_2010 <= _T_2009 @[Mux.scala 27:72]
    bht_bank1_rd_data_f <= _T_2010 @[ifu_bp_ctl.scala 540:23]
    node _T_2011 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 541:85]
    node _T_2012 = bits(_T_2011, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2013 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 541:85]
    node _T_2014 = bits(_T_2013, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2015 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 541:85]
    node _T_2016 = bits(_T_2015, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2017 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 541:85]
    node _T_2018 = bits(_T_2017, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2019 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 541:85]
    node _T_2020 = bits(_T_2019, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2021 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 541:85]
    node _T_2022 = bits(_T_2021, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2023 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 541:85]
    node _T_2024 = bits(_T_2023, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2025 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 541:85]
    node _T_2026 = bits(_T_2025, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2027 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 541:85]
    node _T_2028 = bits(_T_2027, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2029 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 541:85]
    node _T_2030 = bits(_T_2029, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2031 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 541:85]
    node _T_2032 = bits(_T_2031, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2033 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 541:85]
    node _T_2034 = bits(_T_2033, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2035 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 541:85]
    node _T_2036 = bits(_T_2035, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2037 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 541:85]
    node _T_2038 = bits(_T_2037, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2039 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 541:85]
    node _T_2040 = bits(_T_2039, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2041 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 541:85]
    node _T_2042 = bits(_T_2041, 0, 0) @[ifu_bp_ctl.scala 541:93]
    node _T_2043 = mux(_T_2012, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2044 = mux(_T_2014, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2045 = mux(_T_2016, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2046 = mux(_T_2018, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2047 = mux(_T_2020, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2048 = mux(_T_2022, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2049 = mux(_T_2024, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2050 = mux(_T_2026, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2051 = mux(_T_2028, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2052 = mux(_T_2030, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2053 = mux(_T_2032, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2054 = mux(_T_2034, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2055 = mux(_T_2036, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2056 = mux(_T_2038, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2057 = mux(_T_2040, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2058 = mux(_T_2042, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2059 = or(_T_2043, _T_2044) @[Mux.scala 27:72]
    node _T_2060 = or(_T_2059, _T_2045) @[Mux.scala 27:72]
    node _T_2061 = or(_T_2060, _T_2046) @[Mux.scala 27:72]
    node _T_2062 = or(_T_2061, _T_2047) @[Mux.scala 27:72]
    node _T_2063 = or(_T_2062, _T_2048) @[Mux.scala 27:72]
    node _T_2064 = or(_T_2063, _T_2049) @[Mux.scala 27:72]
    node _T_2065 = or(_T_2064, _T_2050) @[Mux.scala 27:72]
    node _T_2066 = or(_T_2065, _T_2051) @[Mux.scala 27:72]
    node _T_2067 = or(_T_2066, _T_2052) @[Mux.scala 27:72]
    node _T_2068 = or(_T_2067, _T_2053) @[Mux.scala 27:72]
    node _T_2069 = or(_T_2068, _T_2054) @[Mux.scala 27:72]
    node _T_2070 = or(_T_2069, _T_2055) @[Mux.scala 27:72]
    node _T_2071 = or(_T_2070, _T_2056) @[Mux.scala 27:72]
    node _T_2072 = or(_T_2071, _T_2057) @[Mux.scala 27:72]
    node _T_2073 = or(_T_2072, _T_2058) @[Mux.scala 27:72]
    wire _T_2074 : UInt<2> @[Mux.scala 27:72]
    _T_2074 <= _T_2073 @[Mux.scala 27:72]
    bht_bank0_rd_data_p1_f <= _T_2074 @[ifu_bp_ctl.scala 541:26]
    
