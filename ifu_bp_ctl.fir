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
    node _T_139 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 189:60]
    node _T_140 = eq(_T_139, UInt<1>("h00")) @[ifu_bp_ctl.scala 189:40]
    node _T_141 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 190:24]
    node _T_142 = mux(_T_140, btb_bank0e_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_143 = mux(_T_141, btb_bank0o_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_144 = or(_T_142, _T_143) @[Mux.scala 27:72]
    wire btb_vbank0_rd_data_f_1 : UInt<22> @[Mux.scala 27:72]
    btb_vbank0_rd_data_f_1 <= _T_144 @[Mux.scala 27:72]
    node _T_145 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 191:60]
    node _T_146 = eq(_T_145, UInt<1>("h00")) @[ifu_bp_ctl.scala 191:40]
    node _T_147 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 192:24]
    node _T_148 = mux(_T_146, btb_bank0o_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_149 = mux(_T_147, btb_bank0e_rd_data_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_150 = or(_T_148, _T_149) @[Mux.scala 27:72]
    wire btb_vbank1_rd_data_f_1 : UInt<22> @[Mux.scala 27:72]
    btb_vbank1_rd_data_f_1 <= _T_150 @[Mux.scala 27:72]
    node _T_151 = not(vwayhit_f) @[ifu_bp_ctl.scala 194:44]
    node _T_152 = and(_T_151, btb_vlru_rd_f) @[ifu_bp_ctl.scala 194:55]
    node _T_153 = or(tag_match_vway1_expanded_f, _T_152) @[ifu_bp_ctl.scala 194:41]
    way_raw <= _T_153 @[ifu_bp_ctl.scala 194:11]
    node mp_wrindex_dec = dshl(UInt<1>("h01"), io.exu_bp.exu_mp_index) @[ifu_bp_ctl.scala 210:28]
    node fetch_wrindex_dec = dshl(UInt<1>("h01"), btb_rd_addr_f) @[ifu_bp_ctl.scala 213:31]
    node fetch_wrindex_p1_dec = dshl(UInt<1>("h01"), btb_rd_addr_p1_f) @[ifu_bp_ctl.scala 216:34]
    node _T_154 = bits(exu_mp_valid, 0, 0) @[Bitwise.scala 72:15]
    node _T_155 = mux(_T_154, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node mp_wrlru_b0 = and(mp_wrindex_dec, _T_155) @[ifu_bp_ctl.scala 219:36]
    node _T_156 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 222:38]
    node _T_157 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 222:53]
    node _T_158 = or(_T_156, _T_157) @[ifu_bp_ctl.scala 222:42]
    node _T_159 = and(_T_158, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 222:58]
    node _T_160 = eq(leak_one_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 222:81]
    node lru_update_valid_f = and(_T_159, _T_160) @[ifu_bp_ctl.scala 222:79]
    node _T_161 = bits(lru_update_valid_f, 0, 0) @[Bitwise.scala 72:15]
    node _T_162 = mux(_T_161, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node fetch_wrlru_b0 = and(fetch_wrindex_dec, _T_162) @[ifu_bp_ctl.scala 224:42]
    node _T_163 = bits(lru_update_valid_f, 0, 0) @[Bitwise.scala 72:15]
    node _T_164 = mux(_T_163, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node fetch_wrlru_p1_b0 = and(fetch_wrindex_p1_dec, _T_164) @[ifu_bp_ctl.scala 225:48]
    node _T_165 = not(mp_wrlru_b0) @[ifu_bp_ctl.scala 227:25]
    node _T_166 = not(fetch_wrlru_b0) @[ifu_bp_ctl.scala 227:40]
    node btb_lru_b0_hold = and(_T_165, _T_166) @[ifu_bp_ctl.scala 227:38]
    node _T_167 = bits(io.exu_bp.exu_mp_pkt.bits.way, 0, 0) @[ifu_bp_ctl.scala 234:51]
    node _T_168 = eq(_T_167, UInt<1>("h00")) @[ifu_bp_ctl.scala 234:39]
    node _T_169 = bits(tag_match_way0_f, 0, 0) @[ifu_bp_ctl.scala 235:22]
    node _T_170 = bits(tag_match_way0_p1_f, 0, 0) @[ifu_bp_ctl.scala 236:25]
    node _T_171 = mux(_T_168, mp_wrlru_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_172 = mux(_T_169, fetch_wrlru_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_173 = mux(_T_170, fetch_wrlru_p1_b0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_174 = or(_T_171, _T_172) @[Mux.scala 27:72]
    node _T_175 = or(_T_174, _T_173) @[Mux.scala 27:72]
    wire _T_176 : UInt<256> @[Mux.scala 27:72]
    _T_176 <= _T_175 @[Mux.scala 27:72]
    node _T_177 = and(btb_lru_b0_hold, btb_lru_b0_f) @[ifu_bp_ctl.scala 236:73]
    node btb_lru_b0_ns = or(_T_176, _T_177) @[ifu_bp_ctl.scala 236:55]
    node _T_178 = bits(fetch_mp_collision_f, 0, 0) @[ifu_bp_ctl.scala 239:37]
    node _T_179 = and(fetch_wrindex_dec, btb_lru_b0_f) @[ifu_bp_ctl.scala 239:78]
    node _T_180 = orr(_T_179) @[ifu_bp_ctl.scala 239:94]
    node btb_lru_rd_f = mux(_T_178, exu_mp_way_f, _T_180) @[ifu_bp_ctl.scala 239:25]
    node _T_181 = bits(fetch_mp_collision_p1_f, 0, 0) @[ifu_bp_ctl.scala 241:43]
    node _T_182 = and(fetch_wrindex_p1_dec, btb_lru_b0_f) @[ifu_bp_ctl.scala 241:87]
    node _T_183 = orr(_T_182) @[ifu_bp_ctl.scala 241:103]
    node btb_lru_rd_p1_f = mux(_T_181, exu_mp_way_f, _T_183) @[ifu_bp_ctl.scala 241:28]
    node _T_184 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 244:50]
    node _T_185 = eq(_T_184, UInt<1>("h00")) @[ifu_bp_ctl.scala 244:30]
    node _T_186 = cat(btb_lru_rd_f, btb_lru_rd_f) @[Cat.scala 29:58]
    node _T_187 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 245:24]
    node _T_188 = bits(_T_187, 0, 0) @[ifu_bp_ctl.scala 245:28]
    node _T_189 = cat(btb_lru_rd_p1_f, btb_lru_rd_f) @[Cat.scala 29:58]
    node _T_190 = mux(_T_185, _T_186, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_191 = mux(_T_188, _T_189, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_192 = or(_T_190, _T_191) @[Mux.scala 27:72]
    wire _T_193 : UInt<2> @[Mux.scala 27:72]
    _T_193 <= _T_192 @[Mux.scala 27:72]
    btb_vlru_rd_f <= _T_193 @[ifu_bp_ctl.scala 244:17]
    node _T_194 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 248:63]
    node _T_195 = bits(_T_194, 0, 0) @[ifu_bp_ctl.scala 248:67]
    node _T_196 = eq(_T_195, UInt<1>("h00")) @[ifu_bp_ctl.scala 248:43]
    node _T_197 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 249:24]
    node _T_198 = bits(_T_197, 0, 0) @[ifu_bp_ctl.scala 249:28]
    node _T_199 = bits(tag_match_way1_expanded_p1_f, 0, 0) @[ifu_bp_ctl.scala 249:70]
    node _T_200 = bits(tag_match_way1_expanded_f, 1, 1) @[ifu_bp_ctl.scala 249:100]
    node _T_201 = cat(_T_199, _T_200) @[Cat.scala 29:58]
    node _T_202 = mux(_T_196, tag_match_way1_expanded_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_203 = mux(_T_198, _T_201, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_204 = or(_T_202, _T_203) @[Mux.scala 27:72]
    wire _T_205 : UInt<2> @[Mux.scala 27:72]
    _T_205 <= _T_204 @[Mux.scala 27:72]
    tag_match_vway1_expanded_f <= _T_205 @[ifu_bp_ctl.scala 248:30]
    node _T_206 = or(io.ifc_fetch_req_f, exu_mp_valid) @[ifu_bp_ctl.scala 251:60]
    node _T_207 = bits(_T_206, 0, 0) @[ifu_bp_ctl.scala 251:75]
    inst rvclkhdr of rvclkhdr @[lib.scala 399:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr.io.en <= _T_207 @[lib.scala 402:17]
    rvclkhdr.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_208 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_207 : @[Reg.scala 28:19]
      _T_208 <= btb_lru_b0_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    btb_lru_b0_f <= _T_208 @[ifu_bp_ctl.scala 251:16]
    io.ifu_bp_way_f <= way_raw @[ifu_bp_ctl.scala 253:19]
    node _T_209 = bits(io.ifc_fetch_addr_f, 4, 2) @[ifu_bp_ctl.scala 257:37]
    node eoc_near = andr(_T_209) @[ifu_bp_ctl.scala 257:64]
    node _T_210 = eq(eoc_near, UInt<1>("h00")) @[ifu_bp_ctl.scala 259:15]
    node _T_211 = bits(io.ifc_fetch_addr_f, 1, 0) @[ifu_bp_ctl.scala 259:48]
    node _T_212 = not(_T_211) @[ifu_bp_ctl.scala 259:28]
    node _T_213 = orr(_T_212) @[ifu_bp_ctl.scala 259:58]
    node _T_214 = or(_T_210, _T_213) @[ifu_bp_ctl.scala 259:25]
    eoc_mask <= _T_214 @[ifu_bp_ctl.scala 259:12]
    wire btb_sel_data_f : UInt<16>
    btb_sel_data_f <= UInt<1>("h00")
    wire hist1_raw : UInt<2>
    hist1_raw <= UInt<1>("h00")
    node btb_rd_tgt_f = bits(btb_sel_data_f, 15, 4) @[ifu_bp_ctl.scala 266:36]
    node btb_rd_pc4_f = bits(btb_sel_data_f, 3, 3) @[ifu_bp_ctl.scala 267:36]
    node btb_rd_call_f = bits(btb_sel_data_f, 1, 1) @[ifu_bp_ctl.scala 268:37]
    node btb_rd_ret_f = bits(btb_sel_data_f, 0, 0) @[ifu_bp_ctl.scala 269:36]
    node _T_215 = bits(btb_sel_f, 1, 1) @[ifu_bp_ctl.scala 272:40]
    node _T_216 = bits(_T_215, 0, 0) @[ifu_bp_ctl.scala 272:44]
    node _T_217 = bits(btb_vbank1_rd_data_f, 16, 1) @[ifu_bp_ctl.scala 272:73]
    node _T_218 = bits(btb_sel_f, 0, 0) @[ifu_bp_ctl.scala 273:40]
    node _T_219 = bits(_T_218, 0, 0) @[ifu_bp_ctl.scala 273:44]
    node _T_220 = bits(btb_vbank0_rd_data_f, 16, 1) @[ifu_bp_ctl.scala 273:73]
    node _T_221 = mux(_T_216, _T_217, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_222 = mux(_T_219, _T_220, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_223 = or(_T_221, _T_222) @[Mux.scala 27:72]
    wire _T_224 : UInt<16> @[Mux.scala 27:72]
    _T_224 <= _T_223 @[Mux.scala 27:72]
    btb_sel_data_f <= _T_224 @[ifu_bp_ctl.scala 272:18]
    node _T_225 = and(vwayhit_f, hist1_raw) @[ifu_bp_ctl.scala 276:39]
    node _T_226 = orr(_T_225) @[ifu_bp_ctl.scala 276:52]
    node _T_227 = and(_T_226, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 276:56]
    node _T_228 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 276:79]
    node _T_229 = and(_T_227, _T_228) @[ifu_bp_ctl.scala 276:77]
    node _T_230 = eq(io.dec_bp.dec_tlu_bpred_disable, UInt<1>("h00")) @[ifu_bp_ctl.scala 276:96]
    node _T_231 = and(_T_229, _T_230) @[ifu_bp_ctl.scala 276:94]
    io.ifu_bp_hit_taken_f <= _T_231 @[ifu_bp_ctl.scala 276:25]
    node _T_232 = bits(btb_vbank1_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 279:52]
    node _T_233 = bits(btb_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 279:81]
    node _T_234 = or(_T_232, _T_233) @[ifu_bp_ctl.scala 279:59]
    node _T_235 = bits(btb_vbank0_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 280:52]
    node _T_236 = bits(btb_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 280:81]
    node _T_237 = or(_T_235, _T_236) @[ifu_bp_ctl.scala 280:59]
    node bht_force_taken_f = cat(_T_234, _T_237) @[Cat.scala 29:58]
    wire bht_bank1_rd_data_f : UInt<2>
    bht_bank1_rd_data_f <= UInt<1>("h00")
    wire bht_bank0_rd_data_f : UInt<2>
    bht_bank0_rd_data_f <= UInt<1>("h00")
    wire bht_bank0_rd_data_p1_f : UInt<2>
    bht_bank0_rd_data_p1_f <= UInt<1>("h00")
    node _T_238 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 289:60]
    node _T_239 = bits(_T_238, 0, 0) @[ifu_bp_ctl.scala 289:64]
    node _T_240 = eq(_T_239, UInt<1>("h00")) @[ifu_bp_ctl.scala 289:40]
    node _T_241 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 290:60]
    node _T_242 = bits(_T_241, 0, 0) @[ifu_bp_ctl.scala 290:64]
    node _T_243 = mux(_T_240, bht_bank0_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_244 = mux(_T_242, bht_bank1_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_245 = or(_T_243, _T_244) @[Mux.scala 27:72]
    wire bht_vbank0_rd_data_f : UInt<2> @[Mux.scala 27:72]
    bht_vbank0_rd_data_f <= _T_245 @[Mux.scala 27:72]
    node _T_246 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 292:60]
    node _T_247 = bits(_T_246, 0, 0) @[ifu_bp_ctl.scala 292:64]
    node _T_248 = eq(_T_247, UInt<1>("h00")) @[ifu_bp_ctl.scala 292:40]
    node _T_249 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 293:60]
    node _T_250 = bits(_T_249, 0, 0) @[ifu_bp_ctl.scala 293:64]
    node _T_251 = mux(_T_248, bht_bank1_rd_data_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_252 = mux(_T_250, bht_bank0_rd_data_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_253 = or(_T_251, _T_252) @[Mux.scala 27:72]
    wire bht_vbank1_rd_data_f : UInt<2> @[Mux.scala 27:72]
    bht_vbank1_rd_data_f <= _T_253 @[Mux.scala 27:72]
    node _T_254 = bits(bht_force_taken_f, 1, 1) @[ifu_bp_ctl.scala 296:38]
    node _T_255 = bits(bht_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 296:64]
    node _T_256 = or(_T_254, _T_255) @[ifu_bp_ctl.scala 296:42]
    node _T_257 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 296:82]
    node _T_258 = and(_T_256, _T_257) @[ifu_bp_ctl.scala 296:69]
    node _T_259 = bits(bht_force_taken_f, 0, 0) @[ifu_bp_ctl.scala 297:41]
    node _T_260 = bits(bht_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 297:67]
    node _T_261 = or(_T_259, _T_260) @[ifu_bp_ctl.scala 297:45]
    node _T_262 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 297:85]
    node _T_263 = and(_T_261, _T_262) @[ifu_bp_ctl.scala 297:72]
    node _T_264 = cat(_T_258, _T_263) @[Cat.scala 29:58]
    bht_dir_f <= _T_264 @[ifu_bp_ctl.scala 296:13]
    node _T_265 = bits(btb_sel_f, 1, 1) @[ifu_bp_ctl.scala 300:62]
    node _T_266 = and(io.ifu_bp_hit_taken_f, _T_265) @[ifu_bp_ctl.scala 300:51]
    node _T_267 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 300:69]
    node _T_268 = or(_T_266, _T_267) @[ifu_bp_ctl.scala 300:67]
    io.ifu_bp_inst_mask_f <= _T_268 @[ifu_bp_ctl.scala 300:25]
    node _T_269 = bits(bht_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 303:60]
    node _T_270 = bits(bht_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 303:85]
    node _T_271 = cat(_T_269, _T_270) @[Cat.scala 29:58]
    node _T_272 = or(bht_force_taken_f, _T_271) @[ifu_bp_ctl.scala 303:34]
    hist1_raw <= _T_272 @[ifu_bp_ctl.scala 303:13]
    node _T_273 = bits(bht_vbank1_rd_data_f, 0, 0) @[ifu_bp_ctl.scala 306:43]
    node _T_274 = bits(bht_vbank0_rd_data_f, 0, 0) @[ifu_bp_ctl.scala 306:68]
    node hist0_raw = cat(_T_273, _T_274) @[Cat.scala 29:58]
    node _T_275 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 309:30]
    node _T_276 = bits(btb_vbank1_rd_data_f, 4, 4) @[ifu_bp_ctl.scala 309:56]
    node _T_277 = and(_T_275, _T_276) @[ifu_bp_ctl.scala 309:34]
    node _T_278 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 310:30]
    node _T_279 = bits(btb_vbank0_rd_data_f, 4, 4) @[ifu_bp_ctl.scala 310:56]
    node _T_280 = and(_T_278, _T_279) @[ifu_bp_ctl.scala 310:34]
    node pc4_raw = cat(_T_277, _T_280) @[Cat.scala 29:58]
    node _T_281 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 313:31]
    node _T_282 = bits(btb_vbank1_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 313:58]
    node _T_283 = eq(_T_282, UInt<1>("h00")) @[ifu_bp_ctl.scala 313:37]
    node _T_284 = and(_T_281, _T_283) @[ifu_bp_ctl.scala 313:35]
    node _T_285 = bits(btb_vbank1_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 313:87]
    node _T_286 = and(_T_284, _T_285) @[ifu_bp_ctl.scala 313:65]
    node _T_287 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 314:31]
    node _T_288 = bits(btb_vbank0_rd_data_f, 2, 2) @[ifu_bp_ctl.scala 314:58]
    node _T_289 = eq(_T_288, UInt<1>("h00")) @[ifu_bp_ctl.scala 314:37]
    node _T_290 = and(_T_287, _T_289) @[ifu_bp_ctl.scala 314:35]
    node _T_291 = bits(btb_vbank0_rd_data_f, 1, 1) @[ifu_bp_ctl.scala 314:87]
    node _T_292 = and(_T_290, _T_291) @[ifu_bp_ctl.scala 314:65]
    node pret_raw = cat(_T_286, _T_292) @[Cat.scala 29:58]
    node _T_293 = bits(vwayhit_f, 1, 1) @[ifu_bp_ctl.scala 317:31]
    node _T_294 = bits(vwayhit_f, 0, 0) @[ifu_bp_ctl.scala 317:49]
    node num_valids = add(_T_293, _T_294) @[ifu_bp_ctl.scala 317:35]
    node _T_295 = and(btb_sel_f, bht_dir_f) @[ifu_bp_ctl.scala 320:28]
    node final_h = orr(_T_295) @[ifu_bp_ctl.scala 320:41]
    wire fghr : UInt<8>
    fghr <= UInt<1>("h00")
    node _T_296 = eq(num_valids, UInt<2>("h02")) @[ifu_bp_ctl.scala 324:41]
    node _T_297 = bits(_T_296, 0, 0) @[ifu_bp_ctl.scala 324:49]
    node _T_298 = bits(fghr, 5, 0) @[ifu_bp_ctl.scala 324:65]
    node _T_299 = cat(_T_298, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_300 = cat(_T_299, final_h) @[Cat.scala 29:58]
    node _T_301 = eq(num_valids, UInt<1>("h01")) @[ifu_bp_ctl.scala 325:41]
    node _T_302 = bits(_T_301, 0, 0) @[ifu_bp_ctl.scala 325:49]
    node _T_303 = bits(fghr, 6, 0) @[ifu_bp_ctl.scala 325:65]
    node _T_304 = cat(_T_303, final_h) @[Cat.scala 29:58]
    node _T_305 = eq(num_valids, UInt<1>("h00")) @[ifu_bp_ctl.scala 326:41]
    node _T_306 = bits(_T_305, 0, 0) @[ifu_bp_ctl.scala 326:49]
    node _T_307 = bits(fghr, 7, 0) @[ifu_bp_ctl.scala 326:65]
    node _T_308 = mux(_T_297, _T_300, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_309 = mux(_T_302, _T_304, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_310 = mux(_T_306, _T_307, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_311 = or(_T_308, _T_309) @[Mux.scala 27:72]
    node _T_312 = or(_T_311, _T_310) @[Mux.scala 27:72]
    wire merged_ghr : UInt<8> @[Mux.scala 27:72]
    merged_ghr <= _T_312 @[Mux.scala 27:72]
    wire fghr_ns : UInt<8> @[ifu_bp_ctl.scala 329:21]
    node _T_313 = bits(exu_flush_final_d1, 0, 0) @[ifu_bp_ctl.scala 334:43]
    node _T_314 = eq(exu_flush_final_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 335:27]
    node _T_315 = and(_T_314, io.ifc_fetch_req_f) @[ifu_bp_ctl.scala 335:47]
    node _T_316 = and(_T_315, io.ic_hit_f) @[ifu_bp_ctl.scala 335:70]
    node _T_317 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 335:86]
    node _T_318 = and(_T_316, _T_317) @[ifu_bp_ctl.scala 335:84]
    node _T_319 = bits(_T_318, 0, 0) @[ifu_bp_ctl.scala 335:102]
    node _T_320 = eq(exu_flush_final_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 336:27]
    node _T_321 = and(io.ifc_fetch_req_f, io.ic_hit_f) @[ifu_bp_ctl.scala 336:70]
    node _T_322 = eq(leak_one_f_d1, UInt<1>("h00")) @[ifu_bp_ctl.scala 336:86]
    node _T_323 = and(_T_321, _T_322) @[ifu_bp_ctl.scala 336:84]
    node _T_324 = eq(_T_323, UInt<1>("h00")) @[ifu_bp_ctl.scala 336:49]
    node _T_325 = and(_T_320, _T_324) @[ifu_bp_ctl.scala 336:47]
    node _T_326 = bits(_T_325, 0, 0) @[ifu_bp_ctl.scala 336:103]
    node _T_327 = mux(_T_313, io.exu_bp.exu_mp_fghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_328 = mux(_T_319, merged_ghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_329 = mux(_T_326, fghr, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_330 = or(_T_327, _T_328) @[Mux.scala 27:72]
    node _T_331 = or(_T_330, _T_329) @[Mux.scala 27:72]
    wire _T_332 : UInt<8> @[Mux.scala 27:72]
    _T_332 <= _T_331 @[Mux.scala 27:72]
    fghr_ns <= _T_332 @[ifu_bp_ctl.scala 334:11]
    wire _T_333 : UInt
    _T_333 <= UInt<1>("h00")
    node _T_334 = xor(leak_one_f, _T_333) @[lib.scala 436:21]
    node _T_335 = orr(_T_334) @[lib.scala 436:29]
    reg _T_336 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_335 : @[Reg.scala 28:19]
      _T_336 <= leak_one_f @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_333 <= _T_336 @[lib.scala 439:16]
    leak_one_f_d1 <= _T_333 @[ifu_bp_ctl.scala 337:17]
    wire _T_337 : UInt
    _T_337 <= UInt<1>("h00")
    node _T_338 = xor(io.exu_bp.exu_mp_pkt.bits.way, _T_337) @[lib.scala 436:21]
    node _T_339 = orr(_T_338) @[lib.scala 436:29]
    reg _T_340 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_339 : @[Reg.scala 28:19]
      _T_340 <= io.exu_bp.exu_mp_pkt.bits.way @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_337 <= _T_340 @[lib.scala 439:16]
    exu_mp_way_f <= _T_337 @[ifu_bp_ctl.scala 339:16]
    wire _T_341 : UInt<1>
    _T_341 <= UInt<1>("h00")
    node _T_342 = xor(io.exu_flush_final, _T_341) @[lib.scala 458:21]
    node _T_343 = orr(_T_342) @[lib.scala 458:29]
    reg _T_344 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_343 : @[Reg.scala 28:19]
      _T_344 <= io.exu_flush_final @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_341 <= _T_344 @[lib.scala 461:16]
    exu_flush_final_d1 <= _T_341 @[ifu_bp_ctl.scala 340:22]
    wire _T_345 : UInt
    _T_345 <= UInt<1>("h00")
    node _T_346 = xor(fghr_ns, _T_345) @[lib.scala 436:21]
    node _T_347 = orr(_T_346) @[lib.scala 436:29]
    reg _T_348 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_347 : @[Reg.scala 28:19]
      _T_348 <= fghr_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_345 <= _T_348 @[lib.scala 439:16]
    fghr <= _T_345 @[ifu_bp_ctl.scala 341:8]
    io.ifu_bp_fghr_f <= fghr @[ifu_bp_ctl.scala 343:20]
    io.ifu_bp_hist1_f <= hist1_raw @[ifu_bp_ctl.scala 344:21]
    io.ifu_bp_hist0_f <= hist0_raw @[ifu_bp_ctl.scala 345:21]
    io.ifu_bp_pc4_f <= pc4_raw @[ifu_bp_ctl.scala 346:19]
    node _T_349 = bits(io.dec_bp.dec_tlu_bpred_disable, 0, 0) @[Bitwise.scala 72:15]
    node _T_350 = mux(_T_349, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_351 = not(_T_350) @[ifu_bp_ctl.scala 348:36]
    node _T_352 = and(vwayhit_f, _T_351) @[ifu_bp_ctl.scala 348:34]
    io.ifu_bp_valid_f <= _T_352 @[ifu_bp_ctl.scala 348:21]
    io.ifu_bp_ret_f <= pret_raw @[ifu_bp_ctl.scala 349:19]
    node _T_353 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 352:30]
    node _T_354 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 352:50]
    node _T_355 = eq(_T_354, UInt<1>("h00")) @[ifu_bp_ctl.scala 352:36]
    node _T_356 = and(_T_353, _T_355) @[ifu_bp_ctl.scala 352:34]
    node _T_357 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 352:68]
    node _T_358 = eq(_T_357, UInt<1>("h00")) @[ifu_bp_ctl.scala 352:58]
    node _T_359 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 352:87]
    node _T_360 = and(_T_358, _T_359) @[ifu_bp_ctl.scala 352:72]
    node _T_361 = or(_T_356, _T_360) @[ifu_bp_ctl.scala 352:55]
    node _T_362 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 353:30]
    node _T_363 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 353:49]
    node _T_364 = and(_T_362, _T_363) @[ifu_bp_ctl.scala 353:34]
    node _T_365 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 353:67]
    node _T_366 = eq(_T_365, UInt<1>("h00")) @[ifu_bp_ctl.scala 353:57]
    node _T_367 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 353:87]
    node _T_368 = eq(_T_367, UInt<1>("h00")) @[ifu_bp_ctl.scala 353:73]
    node _T_369 = and(_T_366, _T_368) @[ifu_bp_ctl.scala 353:71]
    node _T_370 = or(_T_364, _T_369) @[ifu_bp_ctl.scala 353:54]
    node bloc_f = cat(_T_361, _T_370) @[Cat.scala 29:58]
    node _T_371 = bits(bht_dir_f, 0, 0) @[ifu_bp_ctl.scala 355:31]
    node _T_372 = eq(_T_371, UInt<1>("h00")) @[ifu_bp_ctl.scala 355:21]
    node _T_373 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 355:56]
    node _T_374 = and(_T_372, _T_373) @[ifu_bp_ctl.scala 355:35]
    node _T_375 = eq(btb_rd_pc4_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 355:62]
    node use_fa_plus = and(_T_374, _T_375) @[ifu_bp_ctl.scala 355:60]
    node _T_376 = bits(fetch_start_f, 0, 0) @[ifu_bp_ctl.scala 357:40]
    node _T_377 = bits(btb_sel_f, 0, 0) @[ifu_bp_ctl.scala 357:55]
    node _T_378 = and(_T_376, _T_377) @[ifu_bp_ctl.scala 357:44]
    node btb_fg_crossing_f = and(_T_378, btb_rd_pc4_f) @[ifu_bp_ctl.scala 357:59]
    node _T_379 = bits(bloc_f, 1, 1) @[ifu_bp_ctl.scala 358:40]
    node bp_total_branch_offset_f = xor(_T_379, btb_rd_pc4_f) @[ifu_bp_ctl.scala 358:43]
    node _T_380 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_bp_ctl.scala 359:64]
    node _T_381 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 359:119]
    node _T_382 = and(io.ifc_fetch_req_f, _T_381) @[ifu_bp_ctl.scala 359:117]
    node _T_383 = and(_T_382, io.ic_hit_f) @[ifu_bp_ctl.scala 359:142]
    node _T_384 = bits(_T_383, 0, 0) @[ifu_bp_ctl.scala 359:157]
    wire _T_385 : UInt<30> @[lib.scala 570:35]
    _T_385 <= UInt<1>("h00") @[lib.scala 570:35]
    reg ifc_fetch_adder_prior : UInt, clock with : (reset => (reset, _T_385)) @[Reg.scala 27:20]
    when _T_384 : @[Reg.scala 28:19]
      ifc_fetch_adder_prior <= _T_380 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.ifu_bp_poffset_f <= btb_rd_tgt_f @[ifu_bp_ctl.scala 361:23]
    node _T_386 = bits(use_fa_plus, 0, 0) @[ifu_bp_ctl.scala 363:45]
    node _T_387 = bits(btb_fg_crossing_f, 0, 0) @[ifu_bp_ctl.scala 364:51]
    node _T_388 = eq(btb_fg_crossing_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 365:32]
    node _T_389 = eq(use_fa_plus, UInt<1>("h00")) @[ifu_bp_ctl.scala 365:53]
    node _T_390 = and(_T_388, _T_389) @[ifu_bp_ctl.scala 365:51]
    node _T_391 = bits(_T_390, 0, 0) @[ifu_bp_ctl.scala 365:67]
    node _T_392 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_bp_ctl.scala 365:95]
    node _T_393 = mux(_T_386, fetch_addr_p1_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_394 = mux(_T_387, ifc_fetch_adder_prior, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_395 = mux(_T_391, _T_392, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_396 = or(_T_393, _T_394) @[Mux.scala 27:72]
    node _T_397 = or(_T_396, _T_395) @[Mux.scala 27:72]
    wire adder_pc_in_f : UInt @[Mux.scala 27:72]
    adder_pc_in_f <= _T_397 @[Mux.scala 27:72]
    node _T_398 = bits(adder_pc_in_f, 29, 0) @[ifu_bp_ctl.scala 368:58]
    node _T_399 = cat(_T_398, bp_total_branch_offset_f) @[Cat.scala 29:58]
    node _T_400 = cat(_T_399, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_401 = cat(btb_rd_tgt_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_402 = bits(_T_400, 12, 1) @[lib.scala 68:24]
    node _T_403 = bits(_T_401, 12, 1) @[lib.scala 68:40]
    node _T_404 = add(_T_402, _T_403) @[lib.scala 68:31]
    node _T_405 = bits(_T_400, 31, 13) @[lib.scala 69:20]
    node _T_406 = add(_T_405, UInt<1>("h01")) @[lib.scala 69:27]
    node _T_407 = tail(_T_406, 1) @[lib.scala 69:27]
    node _T_408 = bits(_T_400, 31, 13) @[lib.scala 70:20]
    node _T_409 = sub(_T_408, UInt<1>("h01")) @[lib.scala 70:27]
    node _T_410 = tail(_T_409, 1) @[lib.scala 70:27]
    node _T_411 = bits(_T_401, 12, 12) @[lib.scala 71:22]
    node _T_412 = bits(_T_404, 12, 12) @[lib.scala 72:39]
    node _T_413 = eq(_T_412, UInt<1>("h00")) @[lib.scala 72:28]
    node _T_414 = xor(_T_411, _T_413) @[lib.scala 72:26]
    node _T_415 = bits(_T_414, 0, 0) @[lib.scala 72:64]
    node _T_416 = bits(_T_400, 31, 13) @[lib.scala 72:76]
    node _T_417 = eq(_T_411, UInt<1>("h00")) @[lib.scala 73:20]
    node _T_418 = bits(_T_404, 12, 12) @[lib.scala 73:39]
    node _T_419 = and(_T_417, _T_418) @[lib.scala 73:26]
    node _T_420 = bits(_T_419, 0, 0) @[lib.scala 73:64]
    node _T_421 = bits(_T_404, 12, 12) @[lib.scala 74:39]
    node _T_422 = eq(_T_421, UInt<1>("h00")) @[lib.scala 74:28]
    node _T_423 = and(_T_411, _T_422) @[lib.scala 74:26]
    node _T_424 = bits(_T_423, 0, 0) @[lib.scala 74:64]
    node _T_425 = mux(_T_415, _T_416, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_426 = mux(_T_420, _T_407, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_427 = mux(_T_424, _T_410, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_428 = or(_T_425, _T_426) @[Mux.scala 27:72]
    node _T_429 = or(_T_428, _T_427) @[Mux.scala 27:72]
    wire _T_430 : UInt<19> @[Mux.scala 27:72]
    _T_430 <= _T_429 @[Mux.scala 27:72]
    node _T_431 = bits(_T_404, 11, 0) @[lib.scala 74:94]
    node _T_432 = cat(_T_430, _T_431) @[Cat.scala 29:58]
    node bp_btb_target_adder_f = cat(_T_432, UInt<1>("h00")) @[Cat.scala 29:58]
    wire rets_out : UInt<32>[8] @[ifu_bp_ctl.scala 370:22]
    rets_out[0] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[1] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[2] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[3] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[4] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[5] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[6] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    rets_out[7] <= UInt<1>("h00") @[ifu_bp_ctl.scala 371:12]
    node _T_433 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 373:55]
    node _T_434 = and(btb_rd_ret_f, _T_433) @[ifu_bp_ctl.scala 373:53]
    node _T_435 = bits(rets_out[0], 0, 0) @[ifu_bp_ctl.scala 373:83]
    node _T_436 = and(_T_434, _T_435) @[ifu_bp_ctl.scala 373:70]
    node _T_437 = and(_T_436, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 373:87]
    node _T_438 = bits(_T_437, 0, 0) @[Bitwise.scala 72:15]
    node _T_439 = mux(_T_438, UInt<31>("h07fffffff"), UInt<31>("h00")) @[Bitwise.scala 72:12]
    node _T_440 = bits(rets_out[0], 31, 1) @[ifu_bp_ctl.scala 373:126]
    node _T_441 = and(_T_439, _T_440) @[ifu_bp_ctl.scala 373:113]
    node _T_442 = eq(btb_rd_ret_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 374:15]
    node _T_443 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 374:31]
    node _T_444 = and(_T_442, _T_443) @[ifu_bp_ctl.scala 374:29]
    node _T_445 = bits(rets_out[0], 0, 0) @[ifu_bp_ctl.scala 374:59]
    node _T_446 = and(_T_444, _T_445) @[ifu_bp_ctl.scala 374:46]
    node _T_447 = and(_T_446, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 374:63]
    node _T_448 = bits(_T_447, 0, 0) @[Bitwise.scala 72:15]
    node _T_449 = mux(_T_448, UInt<31>("h07fffffff"), UInt<31>("h00")) @[Bitwise.scala 72:12]
    node _T_450 = bits(bp_btb_target_adder_f, 31, 1) @[ifu_bp_ctl.scala 374:112]
    node _T_451 = and(_T_449, _T_450) @[ifu_bp_ctl.scala 374:89]
    node _T_452 = or(_T_441, _T_451) @[ifu_bp_ctl.scala 373:134]
    io.ifu_bp_btb_target_f <= _T_452 @[ifu_bp_ctl.scala 373:26]
    node _T_453 = bits(adder_pc_in_f, 29, 0) @[ifu_bp_ctl.scala 377:56]
    node _T_454 = cat(_T_453, bp_total_branch_offset_f) @[Cat.scala 29:58]
    node _T_455 = cat(_T_454, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_456 = mux(UInt<1>("h00"), UInt<11>("h07ff"), UInt<11>("h00")) @[Bitwise.scala 72:12]
    node _T_457 = not(btb_rd_pc4_f) @[ifu_bp_ctl.scala 377:113]
    node _T_458 = cat(_T_456, _T_457) @[Cat.scala 29:58]
    node _T_459 = cat(_T_458, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_460 = bits(_T_455, 12, 1) @[lib.scala 68:24]
    node _T_461 = bits(_T_459, 12, 1) @[lib.scala 68:40]
    node _T_462 = add(_T_460, _T_461) @[lib.scala 68:31]
    node _T_463 = bits(_T_455, 31, 13) @[lib.scala 69:20]
    node _T_464 = add(_T_463, UInt<1>("h01")) @[lib.scala 69:27]
    node _T_465 = tail(_T_464, 1) @[lib.scala 69:27]
    node _T_466 = bits(_T_455, 31, 13) @[lib.scala 70:20]
    node _T_467 = sub(_T_466, UInt<1>("h01")) @[lib.scala 70:27]
    node _T_468 = tail(_T_467, 1) @[lib.scala 70:27]
    node _T_469 = bits(_T_459, 12, 12) @[lib.scala 71:22]
    node _T_470 = bits(_T_462, 12, 12) @[lib.scala 72:39]
    node _T_471 = eq(_T_470, UInt<1>("h00")) @[lib.scala 72:28]
    node _T_472 = xor(_T_469, _T_471) @[lib.scala 72:26]
    node _T_473 = bits(_T_472, 0, 0) @[lib.scala 72:64]
    node _T_474 = bits(_T_455, 31, 13) @[lib.scala 72:76]
    node _T_475 = eq(_T_469, UInt<1>("h00")) @[lib.scala 73:20]
    node _T_476 = bits(_T_462, 12, 12) @[lib.scala 73:39]
    node _T_477 = and(_T_475, _T_476) @[lib.scala 73:26]
    node _T_478 = bits(_T_477, 0, 0) @[lib.scala 73:64]
    node _T_479 = bits(_T_462, 12, 12) @[lib.scala 74:39]
    node _T_480 = eq(_T_479, UInt<1>("h00")) @[lib.scala 74:28]
    node _T_481 = and(_T_469, _T_480) @[lib.scala 74:26]
    node _T_482 = bits(_T_481, 0, 0) @[lib.scala 74:64]
    node _T_483 = mux(_T_473, _T_474, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_484 = mux(_T_478, _T_465, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_485 = mux(_T_482, _T_468, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_486 = or(_T_483, _T_484) @[Mux.scala 27:72]
    node _T_487 = or(_T_486, _T_485) @[Mux.scala 27:72]
    wire _T_488 : UInt<19> @[Mux.scala 27:72]
    _T_488 <= _T_487 @[Mux.scala 27:72]
    node _T_489 = bits(_T_462, 11, 0) @[lib.scala 74:94]
    node _T_490 = cat(_T_488, _T_489) @[Cat.scala 29:58]
    node bp_rs_call_target_f = cat(_T_490, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_491 = eq(btb_rd_ret_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 379:33]
    node _T_492 = and(btb_rd_call_f, _T_491) @[ifu_bp_ctl.scala 379:31]
    node rs_push = and(_T_492, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 379:47]
    node _T_493 = eq(btb_rd_call_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 380:31]
    node _T_494 = and(btb_rd_ret_f, _T_493) @[ifu_bp_ctl.scala 380:29]
    node rs_pop = and(_T_494, io.ifu_bp_hit_taken_f) @[ifu_bp_ctl.scala 380:46]
    node _T_495 = eq(rs_push, UInt<1>("h00")) @[ifu_bp_ctl.scala 381:17]
    node _T_496 = eq(rs_pop, UInt<1>("h00")) @[ifu_bp_ctl.scala 381:28]
    node rs_hold = and(_T_495, _T_496) @[ifu_bp_ctl.scala 381:26]
    node rsenable_0 = eq(rs_hold, UInt<1>("h00")) @[ifu_bp_ctl.scala 383:60]
    node rsenable_1 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_2 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_3 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_4 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_5 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node rsenable_6 = or(rs_push, rs_pop) @[ifu_bp_ctl.scala 383:119]
    node _T_497 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 386:23]
    node _T_498 = bits(bp_rs_call_target_f, 31, 1) @[ifu_bp_ctl.scala 386:56]
    node _T_499 = cat(_T_498, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_500 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 387:22]
    node _T_501 = mux(_T_497, _T_499, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_502 = mux(_T_500, rets_out[1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_503 = or(_T_501, _T_502) @[Mux.scala 27:72]
    wire rets_in_0 : UInt<32> @[Mux.scala 27:72]
    rets_in_0 <= _T_503 @[Mux.scala 27:72]
    node _T_504 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_505 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_506 = mux(_T_504, rets_out[0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_507 = mux(_T_505, rets_out[2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_508 = or(_T_506, _T_507) @[Mux.scala 27:72]
    wire rets_in_1 : UInt<32> @[Mux.scala 27:72]
    rets_in_1 <= _T_508 @[Mux.scala 27:72]
    node _T_509 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_510 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_511 = mux(_T_509, rets_out[1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_512 = mux(_T_510, rets_out[3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_513 = or(_T_511, _T_512) @[Mux.scala 27:72]
    wire rets_in_2 : UInt<32> @[Mux.scala 27:72]
    rets_in_2 <= _T_513 @[Mux.scala 27:72]
    node _T_514 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_515 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_516 = mux(_T_514, rets_out[2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_517 = mux(_T_515, rets_out[4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_518 = or(_T_516, _T_517) @[Mux.scala 27:72]
    wire rets_in_3 : UInt<32> @[Mux.scala 27:72]
    rets_in_3 <= _T_518 @[Mux.scala 27:72]
    node _T_519 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_520 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_521 = mux(_T_519, rets_out[3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_522 = mux(_T_520, rets_out[5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_523 = or(_T_521, _T_522) @[Mux.scala 27:72]
    wire rets_in_4 : UInt<32> @[Mux.scala 27:72]
    rets_in_4 <= _T_523 @[Mux.scala 27:72]
    node _T_524 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_525 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_526 = mux(_T_524, rets_out[4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_527 = mux(_T_525, rets_out[6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_528 = or(_T_526, _T_527) @[Mux.scala 27:72]
    wire rets_in_5 : UInt<32> @[Mux.scala 27:72]
    rets_in_5 <= _T_528 @[Mux.scala 27:72]
    node _T_529 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 389:28]
    node _T_530 = bits(rs_pop, 0, 0) @[ifu_bp_ctl.scala 390:27]
    node _T_531 = mux(_T_529, rets_out[5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_532 = mux(_T_530, rets_out[7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_533 = or(_T_531, _T_532) @[Mux.scala 27:72]
    wire rets_in_6 : UInt<32> @[Mux.scala 27:72]
    rets_in_6 <= _T_533 @[Mux.scala 27:72]
    node _T_534 = bits(rsenable_0, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_1 of rvclkhdr_1 @[lib.scala 399:23]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_1.io.en <= _T_534 @[lib.scala 402:17]
    rvclkhdr_1.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_535 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_534 : @[Reg.scala 28:19]
      _T_535 <= rets_in_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_536 = bits(rsenable_1, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_2 of rvclkhdr_2 @[lib.scala 399:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_2.io.en <= _T_536 @[lib.scala 402:17]
    rvclkhdr_2.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_537 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_536 : @[Reg.scala 28:19]
      _T_537 <= rets_in_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_538 = bits(rsenable_2, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_3 of rvclkhdr_3 @[lib.scala 399:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_3.io.en <= _T_538 @[lib.scala 402:17]
    rvclkhdr_3.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_539 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_538 : @[Reg.scala 28:19]
      _T_539 <= rets_in_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_540 = bits(rsenable_3, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_4 of rvclkhdr_4 @[lib.scala 399:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_4.io.en <= _T_540 @[lib.scala 402:17]
    rvclkhdr_4.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_541 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_540 : @[Reg.scala 28:19]
      _T_541 <= rets_in_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_542 = bits(rsenable_4, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_5 of rvclkhdr_5 @[lib.scala 399:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_5.io.en <= _T_542 @[lib.scala 402:17]
    rvclkhdr_5.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_543 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_542 : @[Reg.scala 28:19]
      _T_543 <= rets_in_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_544 = bits(rsenable_5, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_6 of rvclkhdr_6 @[lib.scala 399:23]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_6.io.en <= _T_544 @[lib.scala 402:17]
    rvclkhdr_6.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_545 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_544 : @[Reg.scala 28:19]
      _T_545 <= rets_in_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_546 = bits(rsenable_6, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_7 of rvclkhdr_7 @[lib.scala 399:23]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_7.io.en <= _T_546 @[lib.scala 402:17]
    rvclkhdr_7.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_547 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_546 : @[Reg.scala 28:19]
      _T_547 <= rets_in_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_548 = bits(rs_push, 0, 0) @[ifu_bp_ctl.scala 393:78]
    inst rvclkhdr_8 of rvclkhdr_8 @[lib.scala 399:23]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_8.io.en <= _T_548 @[lib.scala 402:17]
    rvclkhdr_8.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg _T_549 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_548 : @[Reg.scala 28:19]
      _T_549 <= rets_out[6] @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    rets_out[0] <= _T_535 @[ifu_bp_ctl.scala 393:12]
    rets_out[1] <= _T_537 @[ifu_bp_ctl.scala 393:12]
    rets_out[2] <= _T_539 @[ifu_bp_ctl.scala 393:12]
    rets_out[3] <= _T_541 @[ifu_bp_ctl.scala 393:12]
    rets_out[4] <= _T_543 @[ifu_bp_ctl.scala 393:12]
    rets_out[5] <= _T_545 @[ifu_bp_ctl.scala 393:12]
    rets_out[6] <= _T_547 @[ifu_bp_ctl.scala 393:12]
    rets_out[7] <= _T_549 @[ifu_bp_ctl.scala 393:12]
    node _T_550 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 395:35]
    node btb_valid = and(exu_mp_valid, _T_550) @[ifu_bp_ctl.scala 395:32]
    node _T_551 = or(io.exu_bp.exu_mp_pkt.bits.pcall, io.exu_bp.exu_mp_pkt.bits.pja) @[ifu_bp_ctl.scala 409:89]
    node _T_552 = or(io.exu_bp.exu_mp_pkt.bits.pret, io.exu_bp.exu_mp_pkt.bits.pja) @[ifu_bp_ctl.scala 409:113]
    node _T_553 = cat(_T_551, _T_552) @[Cat.scala 29:58]
    node _T_554 = cat(_T_553, btb_valid) @[Cat.scala 29:58]
    node _T_555 = cat(io.exu_bp.exu_mp_pkt.bits.pc4, io.exu_bp.exu_mp_pkt.bits.boffset) @[Cat.scala 29:58]
    node _T_556 = cat(io.exu_bp.exu_mp_btag, io.exu_bp.exu_mp_pkt.bits.toffset) @[Cat.scala 29:58]
    node _T_557 = cat(_T_556, _T_555) @[Cat.scala 29:58]
    node btb_wr_data = cat(_T_557, _T_554) @[Cat.scala 29:58]
    node _T_558 = and(exu_mp_valid, io.exu_bp.exu_mp_pkt.bits.ataken) @[ifu_bp_ctl.scala 410:41]
    node _T_559 = eq(io.exu_bp.exu_mp_pkt.valid, UInt<1>("h00")) @[ifu_bp_ctl.scala 410:59]
    node exu_mp_valid_write = and(_T_558, _T_559) @[ifu_bp_ctl.scala 410:57]
    node middle_of_bank = xor(io.exu_bp.exu_mp_pkt.bits.pc4, io.exu_bp.exu_mp_pkt.bits.boffset) @[ifu_bp_ctl.scala 411:35]
    node _T_560 = eq(io.exu_bp.exu_mp_pkt.bits.pcall, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:43]
    node _T_561 = and(exu_mp_valid, _T_560) @[ifu_bp_ctl.scala 414:41]
    node _T_562 = eq(io.exu_bp.exu_mp_pkt.bits.pret, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:58]
    node _T_563 = and(_T_561, _T_562) @[ifu_bp_ctl.scala 414:56]
    node _T_564 = eq(io.exu_bp.exu_mp_pkt.bits.pja, UInt<1>("h00")) @[ifu_bp_ctl.scala 414:72]
    node _T_565 = and(_T_563, _T_564) @[ifu_bp_ctl.scala 414:70]
    node _T_566 = bits(_T_565, 0, 0) @[Bitwise.scala 72:15]
    node _T_567 = mux(_T_566, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_568 = not(middle_of_bank) @[ifu_bp_ctl.scala 414:106]
    node _T_569 = cat(middle_of_bank, _T_568) @[Cat.scala 29:58]
    node bht_wr_en0 = and(_T_567, _T_569) @[ifu_bp_ctl.scala 414:84]
    node _T_570 = bits(io.dec_bp.dec_tlu_br0_r_pkt.valid, 0, 0) @[Bitwise.scala 72:15]
    node _T_571 = mux(_T_570, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_572 = not(io.dec_bp.dec_tlu_br0_r_pkt.bits.middle) @[ifu_bp_ctl.scala 415:75]
    node _T_573 = cat(io.dec_bp.dec_tlu_br0_r_pkt.bits.middle, _T_572) @[Cat.scala 29:58]
    node bht_wr_en2 = and(_T_571, _T_573) @[ifu_bp_ctl.scala 415:46]
    node _T_574 = cat(io.exu_bp.exu_mp_index, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_575 = bits(_T_574, 9, 2) @[lib.scala 56:16]
    node _T_576 = bits(io.exu_bp.exu_mp_eghr, 7, 0) @[lib.scala 56:40]
    node mp_hashed = xor(_T_575, _T_576) @[lib.scala 56:35]
    node _T_577 = cat(io.exu_bp.exu_i0_br_index_r, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_578 = bits(_T_577, 9, 2) @[lib.scala 56:16]
    node _T_579 = bits(io.exu_bp.exu_i0_br_fghr_r, 7, 0) @[lib.scala 56:40]
    node br0_hashed_wb = xor(_T_578, _T_579) @[lib.scala 56:35]
    node _T_580 = cat(btb_rd_addr_f, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_581 = bits(_T_580, 9, 2) @[lib.scala 56:16]
    node _T_582 = bits(fghr, 7, 0) @[lib.scala 56:40]
    node bht_rd_addr_hashed_f = xor(_T_581, _T_582) @[lib.scala 56:35]
    node _T_583 = cat(btb_rd_addr_p1_f, UInt<2>("h00")) @[Cat.scala 29:58]
    node _T_584 = bits(_T_583, 9, 2) @[lib.scala 56:16]
    node _T_585 = bits(fghr, 7, 0) @[lib.scala 56:40]
    node bht_rd_addr_hashed_p1_f = xor(_T_584, _T_585) @[lib.scala 56:35]
    node _T_586 = eq(io.exu_bp.exu_mp_pkt.bits.way, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:26]
    node _T_587 = and(_T_586, exu_mp_valid_write) @[ifu_bp_ctl.scala 434:39]
    node _T_588 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:63]
    node _T_589 = and(_T_587, _T_588) @[ifu_bp_ctl.scala 434:60]
    node _T_590 = eq(dec_tlu_way_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 434:87]
    node _T_591 = and(_T_590, dec_tlu_error_wb) @[ifu_bp_ctl.scala 434:104]
    node btb_wr_en_way0 = or(_T_589, _T_591) @[ifu_bp_ctl.scala 434:83]
    node _T_592 = and(io.exu_bp.exu_mp_pkt.bits.way, exu_mp_valid_write) @[ifu_bp_ctl.scala 435:36]
    node _T_593 = eq(dec_tlu_error_wb, UInt<1>("h00")) @[ifu_bp_ctl.scala 435:60]
    node _T_594 = and(_T_592, _T_593) @[ifu_bp_ctl.scala 435:57]
    node _T_595 = and(dec_tlu_way_wb, dec_tlu_error_wb) @[ifu_bp_ctl.scala 435:98]
    node btb_wr_en_way1 = or(_T_594, _T_595) @[ifu_bp_ctl.scala 435:80]
    node _T_596 = bits(dec_tlu_error_wb, 0, 0) @[ifu_bp_ctl.scala 438:42]
    node btb_wr_addr = mux(_T_596, btb_error_addr_wb, io.exu_bp.exu_mp_index) @[ifu_bp_ctl.scala 438:24]
    node _T_597 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 439:44]
    node _T_598 = bits(_T_597, 0, 0) @[Bitwise.scala 72:15]
    node _T_599 = mux(_T_598, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_600 = bits(wayhit_f, 1, 0) @[ifu_bp_ctl.scala 439:59]
    node _T_601 = and(_T_599, _T_600) @[ifu_bp_ctl.scala 439:49]
    node _T_602 = bits(io.ifc_fetch_addr_f, 1, 1) @[ifu_bp_ctl.scala 439:95]
    node _T_603 = bits(_T_602, 0, 0) @[Bitwise.scala 72:15]
    node _T_604 = mux(_T_603, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_605 = bits(wayhit_p1_f, 0, 0) @[ifu_bp_ctl.scala 439:117]
    node _T_606 = bits(wayhit_f, 1, 1) @[ifu_bp_ctl.scala 439:129]
    node _T_607 = cat(_T_605, _T_606) @[Cat.scala 29:58]
    node _T_608 = and(_T_604, _T_607) @[ifu_bp_ctl.scala 439:100]
    node _T_609 = or(_T_601, _T_608) @[ifu_bp_ctl.scala 439:66]
    node _T_610 = cat(eoc_mask, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_611 = and(_T_609, _T_610) @[ifu_bp_ctl.scala 439:136]
    vwayhit_f <= _T_611 @[ifu_bp_ctl.scala 439:13]
    node _T_612 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 441:98]
    node _T_613 = and(_T_612, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_614 = bits(_T_613, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_9 of rvclkhdr_9 @[lib.scala 399:23]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_9.io.en <= _T_614 @[lib.scala 402:17]
    rvclkhdr_9.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_614 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_615 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 441:98]
    node _T_616 = and(_T_615, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_617 = bits(_T_616, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_10 of rvclkhdr_10 @[lib.scala 399:23]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_10.io.en <= _T_617 @[lib.scala 402:17]
    rvclkhdr_10.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_617 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_618 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 441:98]
    node _T_619 = and(_T_618, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_620 = bits(_T_619, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_11 of rvclkhdr_11 @[lib.scala 399:23]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_11.io.en <= _T_620 @[lib.scala 402:17]
    rvclkhdr_11.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_620 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_621 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 441:98]
    node _T_622 = and(_T_621, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_623 = bits(_T_622, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_12 of rvclkhdr_12 @[lib.scala 399:23]
    rvclkhdr_12.clock <= clock
    rvclkhdr_12.reset <= reset
    rvclkhdr_12.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_12.io.en <= _T_623 @[lib.scala 402:17]
    rvclkhdr_12.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_623 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_624 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 441:98]
    node _T_625 = and(_T_624, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_626 = bits(_T_625, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_13 of rvclkhdr_13 @[lib.scala 399:23]
    rvclkhdr_13.clock <= clock
    rvclkhdr_13.reset <= reset
    rvclkhdr_13.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_13.io.en <= _T_626 @[lib.scala 402:17]
    rvclkhdr_13.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_626 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_627 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 441:98]
    node _T_628 = and(_T_627, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_629 = bits(_T_628, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_14 of rvclkhdr_14 @[lib.scala 399:23]
    rvclkhdr_14.clock <= clock
    rvclkhdr_14.reset <= reset
    rvclkhdr_14.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_14.io.en <= _T_629 @[lib.scala 402:17]
    rvclkhdr_14.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_629 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_630 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 441:98]
    node _T_631 = and(_T_630, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_632 = bits(_T_631, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_15 of rvclkhdr_15 @[lib.scala 399:23]
    rvclkhdr_15.clock <= clock
    rvclkhdr_15.reset <= reset
    rvclkhdr_15.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_15.io.en <= _T_632 @[lib.scala 402:17]
    rvclkhdr_15.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_632 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_633 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 441:98]
    node _T_634 = and(_T_633, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_635 = bits(_T_634, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_16 of rvclkhdr_16 @[lib.scala 399:23]
    rvclkhdr_16.clock <= clock
    rvclkhdr_16.reset <= reset
    rvclkhdr_16.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_16.io.en <= _T_635 @[lib.scala 402:17]
    rvclkhdr_16.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_635 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_636 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 441:98]
    node _T_637 = and(_T_636, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_638 = bits(_T_637, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_17 of rvclkhdr_17 @[lib.scala 399:23]
    rvclkhdr_17.clock <= clock
    rvclkhdr_17.reset <= reset
    rvclkhdr_17.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_17.io.en <= _T_638 @[lib.scala 402:17]
    rvclkhdr_17.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_638 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_639 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 441:98]
    node _T_640 = and(_T_639, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_641 = bits(_T_640, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_18 of rvclkhdr_18 @[lib.scala 399:23]
    rvclkhdr_18.clock <= clock
    rvclkhdr_18.reset <= reset
    rvclkhdr_18.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_18.io.en <= _T_641 @[lib.scala 402:17]
    rvclkhdr_18.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_641 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_642 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 441:98]
    node _T_643 = and(_T_642, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_644 = bits(_T_643, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_19 of rvclkhdr_19 @[lib.scala 399:23]
    rvclkhdr_19.clock <= clock
    rvclkhdr_19.reset <= reset
    rvclkhdr_19.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_19.io.en <= _T_644 @[lib.scala 402:17]
    rvclkhdr_19.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_644 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_645 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 441:98]
    node _T_646 = and(_T_645, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_647 = bits(_T_646, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_20 of rvclkhdr_20 @[lib.scala 399:23]
    rvclkhdr_20.clock <= clock
    rvclkhdr_20.reset <= reset
    rvclkhdr_20.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_20.io.en <= _T_647 @[lib.scala 402:17]
    rvclkhdr_20.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_647 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_648 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 441:98]
    node _T_649 = and(_T_648, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_650 = bits(_T_649, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_21 of rvclkhdr_21 @[lib.scala 399:23]
    rvclkhdr_21.clock <= clock
    rvclkhdr_21.reset <= reset
    rvclkhdr_21.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_21.io.en <= _T_650 @[lib.scala 402:17]
    rvclkhdr_21.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_650 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_651 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 441:98]
    node _T_652 = and(_T_651, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_653 = bits(_T_652, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_22 of rvclkhdr_22 @[lib.scala 399:23]
    rvclkhdr_22.clock <= clock
    rvclkhdr_22.reset <= reset
    rvclkhdr_22.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_22.io.en <= _T_653 @[lib.scala 402:17]
    rvclkhdr_22.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_653 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_654 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 441:98]
    node _T_655 = and(_T_654, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_656 = bits(_T_655, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_23 of rvclkhdr_23 @[lib.scala 399:23]
    rvclkhdr_23.clock <= clock
    rvclkhdr_23.reset <= reset
    rvclkhdr_23.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_23.io.en <= _T_656 @[lib.scala 402:17]
    rvclkhdr_23.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_656 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_657 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 441:98]
    node _T_658 = and(_T_657, btb_wr_en_way0) @[ifu_bp_ctl.scala 441:107]
    node _T_659 = bits(_T_658, 0, 0) @[ifu_bp_ctl.scala 441:125]
    inst rvclkhdr_24 of rvclkhdr_24 @[lib.scala 399:23]
    rvclkhdr_24.clock <= clock
    rvclkhdr_24.reset <= reset
    rvclkhdr_24.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_24.io.en <= _T_659 @[lib.scala 402:17]
    rvclkhdr_24.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_659 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_660 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 442:98]
    node _T_661 = and(_T_660, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_662 = bits(_T_661, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_25 of rvclkhdr_25 @[lib.scala 399:23]
    rvclkhdr_25.clock <= clock
    rvclkhdr_25.reset <= reset
    rvclkhdr_25.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_25.io.en <= _T_662 @[lib.scala 402:17]
    rvclkhdr_25.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_662 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_663 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 442:98]
    node _T_664 = and(_T_663, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_665 = bits(_T_664, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_26 of rvclkhdr_26 @[lib.scala 399:23]
    rvclkhdr_26.clock <= clock
    rvclkhdr_26.reset <= reset
    rvclkhdr_26.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_26.io.en <= _T_665 @[lib.scala 402:17]
    rvclkhdr_26.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_665 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_666 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 442:98]
    node _T_667 = and(_T_666, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_668 = bits(_T_667, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_27 of rvclkhdr_27 @[lib.scala 399:23]
    rvclkhdr_27.clock <= clock
    rvclkhdr_27.reset <= reset
    rvclkhdr_27.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_27.io.en <= _T_668 @[lib.scala 402:17]
    rvclkhdr_27.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_668 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_669 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 442:98]
    node _T_670 = and(_T_669, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_671 = bits(_T_670, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_28 of rvclkhdr_28 @[lib.scala 399:23]
    rvclkhdr_28.clock <= clock
    rvclkhdr_28.reset <= reset
    rvclkhdr_28.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_28.io.en <= _T_671 @[lib.scala 402:17]
    rvclkhdr_28.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_671 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_672 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 442:98]
    node _T_673 = and(_T_672, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_674 = bits(_T_673, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_29 of rvclkhdr_29 @[lib.scala 399:23]
    rvclkhdr_29.clock <= clock
    rvclkhdr_29.reset <= reset
    rvclkhdr_29.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_29.io.en <= _T_674 @[lib.scala 402:17]
    rvclkhdr_29.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_674 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_675 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 442:98]
    node _T_676 = and(_T_675, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_677 = bits(_T_676, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_30 of rvclkhdr_30 @[lib.scala 399:23]
    rvclkhdr_30.clock <= clock
    rvclkhdr_30.reset <= reset
    rvclkhdr_30.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_30.io.en <= _T_677 @[lib.scala 402:17]
    rvclkhdr_30.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_677 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_678 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 442:98]
    node _T_679 = and(_T_678, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_680 = bits(_T_679, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_31 of rvclkhdr_31 @[lib.scala 399:23]
    rvclkhdr_31.clock <= clock
    rvclkhdr_31.reset <= reset
    rvclkhdr_31.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_31.io.en <= _T_680 @[lib.scala 402:17]
    rvclkhdr_31.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_680 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_681 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 442:98]
    node _T_682 = and(_T_681, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_683 = bits(_T_682, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_32 of rvclkhdr_32 @[lib.scala 399:23]
    rvclkhdr_32.clock <= clock
    rvclkhdr_32.reset <= reset
    rvclkhdr_32.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_32.io.en <= _T_683 @[lib.scala 402:17]
    rvclkhdr_32.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_683 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_684 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 442:98]
    node _T_685 = and(_T_684, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_686 = bits(_T_685, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_33 of rvclkhdr_33 @[lib.scala 399:23]
    rvclkhdr_33.clock <= clock
    rvclkhdr_33.reset <= reset
    rvclkhdr_33.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_33.io.en <= _T_686 @[lib.scala 402:17]
    rvclkhdr_33.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_686 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_687 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 442:98]
    node _T_688 = and(_T_687, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_689 = bits(_T_688, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_34 of rvclkhdr_34 @[lib.scala 399:23]
    rvclkhdr_34.clock <= clock
    rvclkhdr_34.reset <= reset
    rvclkhdr_34.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_34.io.en <= _T_689 @[lib.scala 402:17]
    rvclkhdr_34.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_689 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_690 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 442:98]
    node _T_691 = and(_T_690, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_692 = bits(_T_691, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_35 of rvclkhdr_35 @[lib.scala 399:23]
    rvclkhdr_35.clock <= clock
    rvclkhdr_35.reset <= reset
    rvclkhdr_35.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_35.io.en <= _T_692 @[lib.scala 402:17]
    rvclkhdr_35.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_692 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_693 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 442:98]
    node _T_694 = and(_T_693, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_695 = bits(_T_694, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_36 of rvclkhdr_36 @[lib.scala 399:23]
    rvclkhdr_36.clock <= clock
    rvclkhdr_36.reset <= reset
    rvclkhdr_36.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_36.io.en <= _T_695 @[lib.scala 402:17]
    rvclkhdr_36.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_695 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_696 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 442:98]
    node _T_697 = and(_T_696, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_698 = bits(_T_697, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_37 of rvclkhdr_37 @[lib.scala 399:23]
    rvclkhdr_37.clock <= clock
    rvclkhdr_37.reset <= reset
    rvclkhdr_37.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_37.io.en <= _T_698 @[lib.scala 402:17]
    rvclkhdr_37.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_698 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_699 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 442:98]
    node _T_700 = and(_T_699, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_701 = bits(_T_700, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_38 of rvclkhdr_38 @[lib.scala 399:23]
    rvclkhdr_38.clock <= clock
    rvclkhdr_38.reset <= reset
    rvclkhdr_38.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_38.io.en <= _T_701 @[lib.scala 402:17]
    rvclkhdr_38.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_701 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_702 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 442:98]
    node _T_703 = and(_T_702, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_704 = bits(_T_703, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_39 of rvclkhdr_39 @[lib.scala 399:23]
    rvclkhdr_39.clock <= clock
    rvclkhdr_39.reset <= reset
    rvclkhdr_39.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_39.io.en <= _T_704 @[lib.scala 402:17]
    rvclkhdr_39.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_704 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_705 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 442:98]
    node _T_706 = and(_T_705, btb_wr_en_way1) @[ifu_bp_ctl.scala 442:107]
    node _T_707 = bits(_T_706, 0, 0) @[ifu_bp_ctl.scala 442:125]
    inst rvclkhdr_40 of rvclkhdr_40 @[lib.scala 399:23]
    rvclkhdr_40.clock <= clock
    rvclkhdr_40.reset <= reset
    rvclkhdr_40.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_40.io.en <= _T_707 @[lib.scala 402:17]
    rvclkhdr_40.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_707 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_708 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 444:80]
    node _T_709 = bits(_T_708, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_710 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 444:80]
    node _T_711 = bits(_T_710, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_712 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 444:80]
    node _T_713 = bits(_T_712, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_714 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 444:80]
    node _T_715 = bits(_T_714, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_716 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 444:80]
    node _T_717 = bits(_T_716, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_718 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 444:80]
    node _T_719 = bits(_T_718, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_720 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 444:80]
    node _T_721 = bits(_T_720, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_722 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 444:80]
    node _T_723 = bits(_T_722, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_724 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 444:80]
    node _T_725 = bits(_T_724, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_726 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 444:80]
    node _T_727 = bits(_T_726, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_728 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 444:80]
    node _T_729 = bits(_T_728, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_730 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 444:80]
    node _T_731 = bits(_T_730, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_732 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 444:80]
    node _T_733 = bits(_T_732, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_734 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 444:80]
    node _T_735 = bits(_T_734, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_736 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 444:80]
    node _T_737 = bits(_T_736, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_738 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 444:80]
    node _T_739 = bits(_T_738, 0, 0) @[ifu_bp_ctl.scala 444:89]
    node _T_740 = mux(_T_709, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_741 = mux(_T_711, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_742 = mux(_T_713, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_743 = mux(_T_715, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_744 = mux(_T_717, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_745 = mux(_T_719, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_746 = mux(_T_721, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_747 = mux(_T_723, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_748 = mux(_T_725, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_749 = mux(_T_727, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_750 = mux(_T_729, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_751 = mux(_T_731, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_752 = mux(_T_733, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_753 = mux(_T_735, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_754 = mux(_T_737, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_755 = mux(_T_739, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_756 = or(_T_740, _T_741) @[Mux.scala 27:72]
    node _T_757 = or(_T_756, _T_742) @[Mux.scala 27:72]
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
    wire _T_771 : UInt @[Mux.scala 27:72]
    _T_771 <= _T_770 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_f <= _T_771 @[ifu_bp_ctl.scala 444:28]
    node _T_772 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 445:80]
    node _T_773 = bits(_T_772, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_774 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 445:80]
    node _T_775 = bits(_T_774, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_776 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 445:80]
    node _T_777 = bits(_T_776, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_778 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 445:80]
    node _T_779 = bits(_T_778, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_780 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 445:80]
    node _T_781 = bits(_T_780, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_782 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 445:80]
    node _T_783 = bits(_T_782, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_784 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 445:80]
    node _T_785 = bits(_T_784, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_786 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 445:80]
    node _T_787 = bits(_T_786, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_788 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 445:80]
    node _T_789 = bits(_T_788, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_790 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 445:80]
    node _T_791 = bits(_T_790, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_792 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 445:80]
    node _T_793 = bits(_T_792, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_794 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 445:80]
    node _T_795 = bits(_T_794, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_796 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 445:80]
    node _T_797 = bits(_T_796, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_798 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 445:80]
    node _T_799 = bits(_T_798, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_800 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 445:80]
    node _T_801 = bits(_T_800, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_802 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 445:80]
    node _T_803 = bits(_T_802, 0, 0) @[ifu_bp_ctl.scala 445:89]
    node _T_804 = mux(_T_773, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_805 = mux(_T_775, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_806 = mux(_T_777, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_807 = mux(_T_779, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_808 = mux(_T_781, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_809 = mux(_T_783, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_810 = mux(_T_785, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_811 = mux(_T_787, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_812 = mux(_T_789, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_813 = mux(_T_791, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_814 = mux(_T_793, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_815 = mux(_T_795, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_816 = mux(_T_797, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_817 = mux(_T_799, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_818 = mux(_T_801, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_819 = mux(_T_803, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_820 = or(_T_804, _T_805) @[Mux.scala 27:72]
    node _T_821 = or(_T_820, _T_806) @[Mux.scala 27:72]
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
    wire _T_835 : UInt @[Mux.scala 27:72]
    _T_835 <= _T_834 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_f <= _T_835 @[ifu_bp_ctl.scala 445:28]
    node _T_836 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 448:86]
    node _T_837 = bits(_T_836, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_838 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 448:86]
    node _T_839 = bits(_T_838, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_840 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 448:86]
    node _T_841 = bits(_T_840, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_842 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 448:86]
    node _T_843 = bits(_T_842, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_844 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 448:86]
    node _T_845 = bits(_T_844, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_846 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 448:86]
    node _T_847 = bits(_T_846, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_848 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 448:86]
    node _T_849 = bits(_T_848, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_850 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 448:86]
    node _T_851 = bits(_T_850, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_852 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 448:86]
    node _T_853 = bits(_T_852, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_854 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 448:86]
    node _T_855 = bits(_T_854, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_856 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 448:86]
    node _T_857 = bits(_T_856, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_858 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 448:86]
    node _T_859 = bits(_T_858, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_860 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 448:86]
    node _T_861 = bits(_T_860, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_862 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 448:86]
    node _T_863 = bits(_T_862, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_864 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 448:86]
    node _T_865 = bits(_T_864, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_866 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 448:86]
    node _T_867 = bits(_T_866, 0, 0) @[ifu_bp_ctl.scala 448:95]
    node _T_868 = mux(_T_837, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_869 = mux(_T_839, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_870 = mux(_T_841, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_871 = mux(_T_843, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_872 = mux(_T_845, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_873 = mux(_T_847, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_874 = mux(_T_849, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_875 = mux(_T_851, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_876 = mux(_T_853, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_877 = mux(_T_855, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_878 = mux(_T_857, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_879 = mux(_T_859, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_880 = mux(_T_861, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_881 = mux(_T_863, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_882 = mux(_T_865, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_883 = mux(_T_867, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_884 = or(_T_868, _T_869) @[Mux.scala 27:72]
    node _T_885 = or(_T_884, _T_870) @[Mux.scala 27:72]
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
    wire _T_899 : UInt @[Mux.scala 27:72]
    _T_899 <= _T_898 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_p1_f <= _T_899 @[ifu_bp_ctl.scala 448:31]
    node _T_900 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 449:86]
    node _T_901 = bits(_T_900, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_902 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 449:86]
    node _T_903 = bits(_T_902, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_904 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 449:86]
    node _T_905 = bits(_T_904, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_906 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 449:86]
    node _T_907 = bits(_T_906, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_908 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 449:86]
    node _T_909 = bits(_T_908, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_910 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 449:86]
    node _T_911 = bits(_T_910, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_912 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 449:86]
    node _T_913 = bits(_T_912, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_914 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 449:86]
    node _T_915 = bits(_T_914, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_916 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 449:86]
    node _T_917 = bits(_T_916, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_918 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 449:86]
    node _T_919 = bits(_T_918, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_920 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 449:86]
    node _T_921 = bits(_T_920, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_922 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 449:86]
    node _T_923 = bits(_T_922, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_924 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 449:86]
    node _T_925 = bits(_T_924, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_926 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 449:86]
    node _T_927 = bits(_T_926, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_928 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 449:86]
    node _T_929 = bits(_T_928, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_930 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 449:86]
    node _T_931 = bits(_T_930, 0, 0) @[ifu_bp_ctl.scala 449:95]
    node _T_932 = mux(_T_901, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_933 = mux(_T_903, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_934 = mux(_T_905, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_935 = mux(_T_907, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_936 = mux(_T_909, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_937 = mux(_T_911, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_938 = mux(_T_913, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_939 = mux(_T_915, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_940 = mux(_T_917, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_941 = mux(_T_919, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_942 = mux(_T_921, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_943 = mux(_T_923, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_944 = mux(_T_925, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_945 = mux(_T_927, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_946 = mux(_T_929, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_947 = mux(_T_931, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_948 = or(_T_932, _T_933) @[Mux.scala 27:72]
    node _T_949 = or(_T_948, _T_934) @[Mux.scala 27:72]
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
    wire _T_963 : UInt @[Mux.scala 27:72]
    _T_963 <= _T_962 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_p1_f <= _T_963 @[ifu_bp_ctl.scala 449:31]
    wire bht_bank_clken : UInt<1>[1][2] @[ifu_bp_ctl.scala 505:28]
    wire bht_bank_clk : Clock[1][2] @[ifu_bp_ctl.scala 507:26]
    inst rvclkhdr_41 of rvclkhdr_41 @[lib.scala 343:22]
    rvclkhdr_41.clock <= clock
    rvclkhdr_41.reset <= reset
    rvclkhdr_41.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_41.io.en <= bht_bank_clken[0][0] @[lib.scala 345:16]
    rvclkhdr_41.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[0][0] <= rvclkhdr_41.io.l1clk @[ifu_bp_ctl.scala 509:84]
    inst rvclkhdr_42 of rvclkhdr_42 @[lib.scala 343:22]
    rvclkhdr_42.clock <= clock
    rvclkhdr_42.reset <= reset
    rvclkhdr_42.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_42.io.en <= bht_bank_clken[1][0] @[lib.scala 345:16]
    rvclkhdr_42.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[1][0] <= rvclkhdr_42.io.l1clk @[ifu_bp_ctl.scala 509:84]
    node _T_964 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 514:40]
    node _T_965 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 514:60]
    node _T_966 = eq(_T_965, UInt<1>("h00")) @[ifu_bp_ctl.scala 514:109]
    node _T_967 = or(_T_966, UInt<1>("h01")) @[ifu_bp_ctl.scala 514:117]
    node _T_968 = and(_T_964, _T_967) @[ifu_bp_ctl.scala 514:44]
    node _T_969 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 515:40]
    node _T_970 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 515:60]
    node _T_971 = eq(_T_970, UInt<1>("h00")) @[ifu_bp_ctl.scala 515:109]
    node _T_972 = or(_T_971, UInt<1>("h01")) @[ifu_bp_ctl.scala 515:117]
    node _T_973 = and(_T_969, _T_972) @[ifu_bp_ctl.scala 515:44]
    node _T_974 = or(_T_968, _T_973) @[ifu_bp_ctl.scala 514:142]
    bht_bank_clken[0][0] <= _T_974 @[ifu_bp_ctl.scala 514:26]
    node _T_975 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 514:40]
    node _T_976 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 514:60]
    node _T_977 = eq(_T_976, UInt<1>("h00")) @[ifu_bp_ctl.scala 514:109]
    node _T_978 = or(_T_977, UInt<1>("h01")) @[ifu_bp_ctl.scala 514:117]
    node _T_979 = and(_T_975, _T_978) @[ifu_bp_ctl.scala 514:44]
    node _T_980 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 515:40]
    node _T_981 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 515:60]
    node _T_982 = eq(_T_981, UInt<1>("h00")) @[ifu_bp_ctl.scala 515:109]
    node _T_983 = or(_T_982, UInt<1>("h01")) @[ifu_bp_ctl.scala 515:117]
    node _T_984 = and(_T_980, _T_983) @[ifu_bp_ctl.scala 515:44]
    node _T_985 = or(_T_979, _T_984) @[ifu_bp_ctl.scala 514:142]
    bht_bank_clken[1][0] <= _T_985 @[ifu_bp_ctl.scala 514:26]
    node _T_986 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_987 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_988 = eq(_T_987, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:74]
    node _T_989 = and(_T_986, _T_988) @[ifu_bp_ctl.scala 520:23]
    node _T_990 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_991 = eq(_T_990, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_992 = and(_T_989, _T_991) @[ifu_bp_ctl.scala 520:81]
    node _T_993 = or(_T_992, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_994 = bits(_T_993, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_0 = mux(_T_994, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_995 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_996 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_997 = eq(_T_996, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:74]
    node _T_998 = and(_T_995, _T_997) @[ifu_bp_ctl.scala 520:23]
    node _T_999 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1000 = eq(_T_999, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1001 = and(_T_998, _T_1000) @[ifu_bp_ctl.scala 520:81]
    node _T_1002 = or(_T_1001, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1003 = bits(_T_1002, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_1 = mux(_T_1003, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1004 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1005 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1006 = eq(_T_1005, UInt<2>("h02")) @[ifu_bp_ctl.scala 520:74]
    node _T_1007 = and(_T_1004, _T_1006) @[ifu_bp_ctl.scala 520:23]
    node _T_1008 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1009 = eq(_T_1008, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1010 = and(_T_1007, _T_1009) @[ifu_bp_ctl.scala 520:81]
    node _T_1011 = or(_T_1010, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1012 = bits(_T_1011, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_2 = mux(_T_1012, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1013 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1014 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1015 = eq(_T_1014, UInt<2>("h03")) @[ifu_bp_ctl.scala 520:74]
    node _T_1016 = and(_T_1013, _T_1015) @[ifu_bp_ctl.scala 520:23]
    node _T_1017 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1018 = eq(_T_1017, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1019 = and(_T_1016, _T_1018) @[ifu_bp_ctl.scala 520:81]
    node _T_1020 = or(_T_1019, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1021 = bits(_T_1020, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_3 = mux(_T_1021, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1022 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1023 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1024 = eq(_T_1023, UInt<3>("h04")) @[ifu_bp_ctl.scala 520:74]
    node _T_1025 = and(_T_1022, _T_1024) @[ifu_bp_ctl.scala 520:23]
    node _T_1026 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1027 = eq(_T_1026, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1028 = and(_T_1025, _T_1027) @[ifu_bp_ctl.scala 520:81]
    node _T_1029 = or(_T_1028, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1030 = bits(_T_1029, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_4 = mux(_T_1030, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1031 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1032 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1033 = eq(_T_1032, UInt<3>("h05")) @[ifu_bp_ctl.scala 520:74]
    node _T_1034 = and(_T_1031, _T_1033) @[ifu_bp_ctl.scala 520:23]
    node _T_1035 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1036 = eq(_T_1035, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1037 = and(_T_1034, _T_1036) @[ifu_bp_ctl.scala 520:81]
    node _T_1038 = or(_T_1037, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1039 = bits(_T_1038, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_5 = mux(_T_1039, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1040 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1041 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1042 = eq(_T_1041, UInt<3>("h06")) @[ifu_bp_ctl.scala 520:74]
    node _T_1043 = and(_T_1040, _T_1042) @[ifu_bp_ctl.scala 520:23]
    node _T_1044 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1045 = eq(_T_1044, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1046 = and(_T_1043, _T_1045) @[ifu_bp_ctl.scala 520:81]
    node _T_1047 = or(_T_1046, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1048 = bits(_T_1047, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_6 = mux(_T_1048, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1049 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1050 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1051 = eq(_T_1050, UInt<3>("h07")) @[ifu_bp_ctl.scala 520:74]
    node _T_1052 = and(_T_1049, _T_1051) @[ifu_bp_ctl.scala 520:23]
    node _T_1053 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1054 = eq(_T_1053, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1055 = and(_T_1052, _T_1054) @[ifu_bp_ctl.scala 520:81]
    node _T_1056 = or(_T_1055, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1057 = bits(_T_1056, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_7 = mux(_T_1057, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1058 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1059 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1060 = eq(_T_1059, UInt<4>("h08")) @[ifu_bp_ctl.scala 520:74]
    node _T_1061 = and(_T_1058, _T_1060) @[ifu_bp_ctl.scala 520:23]
    node _T_1062 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1063 = eq(_T_1062, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1064 = and(_T_1061, _T_1063) @[ifu_bp_ctl.scala 520:81]
    node _T_1065 = or(_T_1064, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1066 = bits(_T_1065, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_8 = mux(_T_1066, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1067 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1068 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1069 = eq(_T_1068, UInt<4>("h09")) @[ifu_bp_ctl.scala 520:74]
    node _T_1070 = and(_T_1067, _T_1069) @[ifu_bp_ctl.scala 520:23]
    node _T_1071 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1072 = eq(_T_1071, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1073 = and(_T_1070, _T_1072) @[ifu_bp_ctl.scala 520:81]
    node _T_1074 = or(_T_1073, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1075 = bits(_T_1074, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_9 = mux(_T_1075, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1076 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1077 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1078 = eq(_T_1077, UInt<4>("h0a")) @[ifu_bp_ctl.scala 520:74]
    node _T_1079 = and(_T_1076, _T_1078) @[ifu_bp_ctl.scala 520:23]
    node _T_1080 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1081 = eq(_T_1080, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1082 = and(_T_1079, _T_1081) @[ifu_bp_ctl.scala 520:81]
    node _T_1083 = or(_T_1082, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1084 = bits(_T_1083, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_10 = mux(_T_1084, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1085 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1086 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1087 = eq(_T_1086, UInt<4>("h0b")) @[ifu_bp_ctl.scala 520:74]
    node _T_1088 = and(_T_1085, _T_1087) @[ifu_bp_ctl.scala 520:23]
    node _T_1089 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1090 = eq(_T_1089, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1091 = and(_T_1088, _T_1090) @[ifu_bp_ctl.scala 520:81]
    node _T_1092 = or(_T_1091, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1093 = bits(_T_1092, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_11 = mux(_T_1093, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1094 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1095 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1096 = eq(_T_1095, UInt<4>("h0c")) @[ifu_bp_ctl.scala 520:74]
    node _T_1097 = and(_T_1094, _T_1096) @[ifu_bp_ctl.scala 520:23]
    node _T_1098 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1099 = eq(_T_1098, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1100 = and(_T_1097, _T_1099) @[ifu_bp_ctl.scala 520:81]
    node _T_1101 = or(_T_1100, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1102 = bits(_T_1101, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_12 = mux(_T_1102, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1103 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1104 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1105 = eq(_T_1104, UInt<4>("h0d")) @[ifu_bp_ctl.scala 520:74]
    node _T_1106 = and(_T_1103, _T_1105) @[ifu_bp_ctl.scala 520:23]
    node _T_1107 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1108 = eq(_T_1107, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1109 = and(_T_1106, _T_1108) @[ifu_bp_ctl.scala 520:81]
    node _T_1110 = or(_T_1109, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1111 = bits(_T_1110, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_13 = mux(_T_1111, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1112 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1113 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1114 = eq(_T_1113, UInt<4>("h0e")) @[ifu_bp_ctl.scala 520:74]
    node _T_1115 = and(_T_1112, _T_1114) @[ifu_bp_ctl.scala 520:23]
    node _T_1116 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1117 = eq(_T_1116, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1118 = and(_T_1115, _T_1117) @[ifu_bp_ctl.scala 520:81]
    node _T_1119 = or(_T_1118, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1120 = bits(_T_1119, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_14 = mux(_T_1120, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1121 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:20]
    node _T_1122 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1123 = eq(_T_1122, UInt<4>("h0f")) @[ifu_bp_ctl.scala 520:74]
    node _T_1124 = and(_T_1121, _T_1123) @[ifu_bp_ctl.scala 520:23]
    node _T_1125 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1126 = eq(_T_1125, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1127 = and(_T_1124, _T_1126) @[ifu_bp_ctl.scala 520:81]
    node _T_1128 = or(_T_1127, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1129 = bits(_T_1128, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_0_0_15 = mux(_T_1129, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1130 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1131 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1132 = eq(_T_1131, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:74]
    node _T_1133 = and(_T_1130, _T_1132) @[ifu_bp_ctl.scala 520:23]
    node _T_1134 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1135 = eq(_T_1134, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1136 = and(_T_1133, _T_1135) @[ifu_bp_ctl.scala 520:81]
    node _T_1137 = or(_T_1136, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1138 = bits(_T_1137, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_0 = mux(_T_1138, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1139 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1140 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1141 = eq(_T_1140, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:74]
    node _T_1142 = and(_T_1139, _T_1141) @[ifu_bp_ctl.scala 520:23]
    node _T_1143 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1144 = eq(_T_1143, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1145 = and(_T_1142, _T_1144) @[ifu_bp_ctl.scala 520:81]
    node _T_1146 = or(_T_1145, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1147 = bits(_T_1146, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_1 = mux(_T_1147, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1148 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1149 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1150 = eq(_T_1149, UInt<2>("h02")) @[ifu_bp_ctl.scala 520:74]
    node _T_1151 = and(_T_1148, _T_1150) @[ifu_bp_ctl.scala 520:23]
    node _T_1152 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1153 = eq(_T_1152, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1154 = and(_T_1151, _T_1153) @[ifu_bp_ctl.scala 520:81]
    node _T_1155 = or(_T_1154, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1156 = bits(_T_1155, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_2 = mux(_T_1156, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1157 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1158 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1159 = eq(_T_1158, UInt<2>("h03")) @[ifu_bp_ctl.scala 520:74]
    node _T_1160 = and(_T_1157, _T_1159) @[ifu_bp_ctl.scala 520:23]
    node _T_1161 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1162 = eq(_T_1161, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1163 = and(_T_1160, _T_1162) @[ifu_bp_ctl.scala 520:81]
    node _T_1164 = or(_T_1163, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1165 = bits(_T_1164, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_3 = mux(_T_1165, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1166 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1167 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1168 = eq(_T_1167, UInt<3>("h04")) @[ifu_bp_ctl.scala 520:74]
    node _T_1169 = and(_T_1166, _T_1168) @[ifu_bp_ctl.scala 520:23]
    node _T_1170 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1171 = eq(_T_1170, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1172 = and(_T_1169, _T_1171) @[ifu_bp_ctl.scala 520:81]
    node _T_1173 = or(_T_1172, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1174 = bits(_T_1173, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_4 = mux(_T_1174, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1175 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1176 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1177 = eq(_T_1176, UInt<3>("h05")) @[ifu_bp_ctl.scala 520:74]
    node _T_1178 = and(_T_1175, _T_1177) @[ifu_bp_ctl.scala 520:23]
    node _T_1179 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1180 = eq(_T_1179, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1181 = and(_T_1178, _T_1180) @[ifu_bp_ctl.scala 520:81]
    node _T_1182 = or(_T_1181, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1183 = bits(_T_1182, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_5 = mux(_T_1183, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1184 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1185 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1186 = eq(_T_1185, UInt<3>("h06")) @[ifu_bp_ctl.scala 520:74]
    node _T_1187 = and(_T_1184, _T_1186) @[ifu_bp_ctl.scala 520:23]
    node _T_1188 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1189 = eq(_T_1188, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1190 = and(_T_1187, _T_1189) @[ifu_bp_ctl.scala 520:81]
    node _T_1191 = or(_T_1190, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1192 = bits(_T_1191, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_6 = mux(_T_1192, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1193 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1194 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1195 = eq(_T_1194, UInt<3>("h07")) @[ifu_bp_ctl.scala 520:74]
    node _T_1196 = and(_T_1193, _T_1195) @[ifu_bp_ctl.scala 520:23]
    node _T_1197 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1198 = eq(_T_1197, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1199 = and(_T_1196, _T_1198) @[ifu_bp_ctl.scala 520:81]
    node _T_1200 = or(_T_1199, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1201 = bits(_T_1200, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_7 = mux(_T_1201, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1202 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1203 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1204 = eq(_T_1203, UInt<4>("h08")) @[ifu_bp_ctl.scala 520:74]
    node _T_1205 = and(_T_1202, _T_1204) @[ifu_bp_ctl.scala 520:23]
    node _T_1206 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1207 = eq(_T_1206, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1208 = and(_T_1205, _T_1207) @[ifu_bp_ctl.scala 520:81]
    node _T_1209 = or(_T_1208, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1210 = bits(_T_1209, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_8 = mux(_T_1210, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1211 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1212 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1213 = eq(_T_1212, UInt<4>("h09")) @[ifu_bp_ctl.scala 520:74]
    node _T_1214 = and(_T_1211, _T_1213) @[ifu_bp_ctl.scala 520:23]
    node _T_1215 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1216 = eq(_T_1215, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1217 = and(_T_1214, _T_1216) @[ifu_bp_ctl.scala 520:81]
    node _T_1218 = or(_T_1217, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1219 = bits(_T_1218, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_9 = mux(_T_1219, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1220 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1221 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1222 = eq(_T_1221, UInt<4>("h0a")) @[ifu_bp_ctl.scala 520:74]
    node _T_1223 = and(_T_1220, _T_1222) @[ifu_bp_ctl.scala 520:23]
    node _T_1224 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1225 = eq(_T_1224, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1226 = and(_T_1223, _T_1225) @[ifu_bp_ctl.scala 520:81]
    node _T_1227 = or(_T_1226, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1228 = bits(_T_1227, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_10 = mux(_T_1228, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1229 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1230 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1231 = eq(_T_1230, UInt<4>("h0b")) @[ifu_bp_ctl.scala 520:74]
    node _T_1232 = and(_T_1229, _T_1231) @[ifu_bp_ctl.scala 520:23]
    node _T_1233 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1234 = eq(_T_1233, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1235 = and(_T_1232, _T_1234) @[ifu_bp_ctl.scala 520:81]
    node _T_1236 = or(_T_1235, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1237 = bits(_T_1236, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_11 = mux(_T_1237, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1238 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1239 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1240 = eq(_T_1239, UInt<4>("h0c")) @[ifu_bp_ctl.scala 520:74]
    node _T_1241 = and(_T_1238, _T_1240) @[ifu_bp_ctl.scala 520:23]
    node _T_1242 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1243 = eq(_T_1242, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1244 = and(_T_1241, _T_1243) @[ifu_bp_ctl.scala 520:81]
    node _T_1245 = or(_T_1244, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1246 = bits(_T_1245, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_12 = mux(_T_1246, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1247 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1248 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1249 = eq(_T_1248, UInt<4>("h0d")) @[ifu_bp_ctl.scala 520:74]
    node _T_1250 = and(_T_1247, _T_1249) @[ifu_bp_ctl.scala 520:23]
    node _T_1251 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1252 = eq(_T_1251, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1253 = and(_T_1250, _T_1252) @[ifu_bp_ctl.scala 520:81]
    node _T_1254 = or(_T_1253, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1255 = bits(_T_1254, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_13 = mux(_T_1255, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1256 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1257 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1258 = eq(_T_1257, UInt<4>("h0e")) @[ifu_bp_ctl.scala 520:74]
    node _T_1259 = and(_T_1256, _T_1258) @[ifu_bp_ctl.scala 520:23]
    node _T_1260 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1261 = eq(_T_1260, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1262 = and(_T_1259, _T_1261) @[ifu_bp_ctl.scala 520:81]
    node _T_1263 = or(_T_1262, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1264 = bits(_T_1263, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_14 = mux(_T_1264, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    node _T_1265 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:20]
    node _T_1266 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:37]
    node _T_1267 = eq(_T_1266, UInt<4>("h0f")) @[ifu_bp_ctl.scala 520:74]
    node _T_1268 = and(_T_1265, _T_1267) @[ifu_bp_ctl.scala 520:23]
    node _T_1269 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:95]
    node _T_1270 = eq(_T_1269, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:154]
    node _T_1271 = and(_T_1268, _T_1270) @[ifu_bp_ctl.scala 520:81]
    node _T_1272 = or(_T_1271, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:161]
    node _T_1273 = bits(_T_1272, 0, 0) @[ifu_bp_ctl.scala 520:183]
    node bht_bank_wr_data_1_0_15 = mux(_T_1273, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 520:8]
    wire bht_bank_sel : UInt<1>[16][1][2] @[ifu_bp_ctl.scala 522:26]
    node _T_1274 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1275 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1276 = eq(_T_1275, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:97]
    node _T_1277 = and(_T_1274, _T_1276) @[ifu_bp_ctl.scala 528:45]
    node _T_1278 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1279 = eq(_T_1278, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1280 = or(_T_1279, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1281 = and(_T_1277, _T_1280) @[ifu_bp_ctl.scala 528:110]
    node _T_1282 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1283 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1284 = eq(_T_1283, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:74]
    node _T_1285 = and(_T_1282, _T_1284) @[ifu_bp_ctl.scala 529:22]
    node _T_1286 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1287 = eq(_T_1286, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1288 = or(_T_1287, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1289 = and(_T_1285, _T_1288) @[ifu_bp_ctl.scala 529:87]
    node _T_1290 = or(_T_1281, _T_1289) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][0] <= _T_1290 @[ifu_bp_ctl.scala 528:27]
    node _T_1291 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1292 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1293 = eq(_T_1292, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:97]
    node _T_1294 = and(_T_1291, _T_1293) @[ifu_bp_ctl.scala 528:45]
    node _T_1295 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1296 = eq(_T_1295, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1297 = or(_T_1296, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1298 = and(_T_1294, _T_1297) @[ifu_bp_ctl.scala 528:110]
    node _T_1299 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1300 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1301 = eq(_T_1300, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:74]
    node _T_1302 = and(_T_1299, _T_1301) @[ifu_bp_ctl.scala 529:22]
    node _T_1303 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1304 = eq(_T_1303, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1305 = or(_T_1304, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1306 = and(_T_1302, _T_1305) @[ifu_bp_ctl.scala 529:87]
    node _T_1307 = or(_T_1298, _T_1306) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][1] <= _T_1307 @[ifu_bp_ctl.scala 528:27]
    node _T_1308 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1309 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1310 = eq(_T_1309, UInt<2>("h02")) @[ifu_bp_ctl.scala 528:97]
    node _T_1311 = and(_T_1308, _T_1310) @[ifu_bp_ctl.scala 528:45]
    node _T_1312 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1313 = eq(_T_1312, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1314 = or(_T_1313, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1315 = and(_T_1311, _T_1314) @[ifu_bp_ctl.scala 528:110]
    node _T_1316 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1317 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1318 = eq(_T_1317, UInt<2>("h02")) @[ifu_bp_ctl.scala 529:74]
    node _T_1319 = and(_T_1316, _T_1318) @[ifu_bp_ctl.scala 529:22]
    node _T_1320 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1321 = eq(_T_1320, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1322 = or(_T_1321, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1323 = and(_T_1319, _T_1322) @[ifu_bp_ctl.scala 529:87]
    node _T_1324 = or(_T_1315, _T_1323) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][2] <= _T_1324 @[ifu_bp_ctl.scala 528:27]
    node _T_1325 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1326 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1327 = eq(_T_1326, UInt<2>("h03")) @[ifu_bp_ctl.scala 528:97]
    node _T_1328 = and(_T_1325, _T_1327) @[ifu_bp_ctl.scala 528:45]
    node _T_1329 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1330 = eq(_T_1329, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1331 = or(_T_1330, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1332 = and(_T_1328, _T_1331) @[ifu_bp_ctl.scala 528:110]
    node _T_1333 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1334 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1335 = eq(_T_1334, UInt<2>("h03")) @[ifu_bp_ctl.scala 529:74]
    node _T_1336 = and(_T_1333, _T_1335) @[ifu_bp_ctl.scala 529:22]
    node _T_1337 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1338 = eq(_T_1337, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1339 = or(_T_1338, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1340 = and(_T_1336, _T_1339) @[ifu_bp_ctl.scala 529:87]
    node _T_1341 = or(_T_1332, _T_1340) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][3] <= _T_1341 @[ifu_bp_ctl.scala 528:27]
    node _T_1342 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1343 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1344 = eq(_T_1343, UInt<3>("h04")) @[ifu_bp_ctl.scala 528:97]
    node _T_1345 = and(_T_1342, _T_1344) @[ifu_bp_ctl.scala 528:45]
    node _T_1346 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1347 = eq(_T_1346, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1348 = or(_T_1347, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1349 = and(_T_1345, _T_1348) @[ifu_bp_ctl.scala 528:110]
    node _T_1350 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1351 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1352 = eq(_T_1351, UInt<3>("h04")) @[ifu_bp_ctl.scala 529:74]
    node _T_1353 = and(_T_1350, _T_1352) @[ifu_bp_ctl.scala 529:22]
    node _T_1354 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1355 = eq(_T_1354, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1356 = or(_T_1355, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1357 = and(_T_1353, _T_1356) @[ifu_bp_ctl.scala 529:87]
    node _T_1358 = or(_T_1349, _T_1357) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][4] <= _T_1358 @[ifu_bp_ctl.scala 528:27]
    node _T_1359 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1360 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1361 = eq(_T_1360, UInt<3>("h05")) @[ifu_bp_ctl.scala 528:97]
    node _T_1362 = and(_T_1359, _T_1361) @[ifu_bp_ctl.scala 528:45]
    node _T_1363 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1364 = eq(_T_1363, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1365 = or(_T_1364, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1366 = and(_T_1362, _T_1365) @[ifu_bp_ctl.scala 528:110]
    node _T_1367 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1368 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1369 = eq(_T_1368, UInt<3>("h05")) @[ifu_bp_ctl.scala 529:74]
    node _T_1370 = and(_T_1367, _T_1369) @[ifu_bp_ctl.scala 529:22]
    node _T_1371 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1372 = eq(_T_1371, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1373 = or(_T_1372, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1374 = and(_T_1370, _T_1373) @[ifu_bp_ctl.scala 529:87]
    node _T_1375 = or(_T_1366, _T_1374) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][5] <= _T_1375 @[ifu_bp_ctl.scala 528:27]
    node _T_1376 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1377 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1378 = eq(_T_1377, UInt<3>("h06")) @[ifu_bp_ctl.scala 528:97]
    node _T_1379 = and(_T_1376, _T_1378) @[ifu_bp_ctl.scala 528:45]
    node _T_1380 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1381 = eq(_T_1380, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1382 = or(_T_1381, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1383 = and(_T_1379, _T_1382) @[ifu_bp_ctl.scala 528:110]
    node _T_1384 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1385 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1386 = eq(_T_1385, UInt<3>("h06")) @[ifu_bp_ctl.scala 529:74]
    node _T_1387 = and(_T_1384, _T_1386) @[ifu_bp_ctl.scala 529:22]
    node _T_1388 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1389 = eq(_T_1388, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1390 = or(_T_1389, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1391 = and(_T_1387, _T_1390) @[ifu_bp_ctl.scala 529:87]
    node _T_1392 = or(_T_1383, _T_1391) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][6] <= _T_1392 @[ifu_bp_ctl.scala 528:27]
    node _T_1393 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1394 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1395 = eq(_T_1394, UInt<3>("h07")) @[ifu_bp_ctl.scala 528:97]
    node _T_1396 = and(_T_1393, _T_1395) @[ifu_bp_ctl.scala 528:45]
    node _T_1397 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1398 = eq(_T_1397, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1399 = or(_T_1398, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1400 = and(_T_1396, _T_1399) @[ifu_bp_ctl.scala 528:110]
    node _T_1401 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1402 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1403 = eq(_T_1402, UInt<3>("h07")) @[ifu_bp_ctl.scala 529:74]
    node _T_1404 = and(_T_1401, _T_1403) @[ifu_bp_ctl.scala 529:22]
    node _T_1405 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1406 = eq(_T_1405, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1407 = or(_T_1406, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1408 = and(_T_1404, _T_1407) @[ifu_bp_ctl.scala 529:87]
    node _T_1409 = or(_T_1400, _T_1408) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][7] <= _T_1409 @[ifu_bp_ctl.scala 528:27]
    node _T_1410 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1411 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1412 = eq(_T_1411, UInt<4>("h08")) @[ifu_bp_ctl.scala 528:97]
    node _T_1413 = and(_T_1410, _T_1412) @[ifu_bp_ctl.scala 528:45]
    node _T_1414 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1415 = eq(_T_1414, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1416 = or(_T_1415, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1417 = and(_T_1413, _T_1416) @[ifu_bp_ctl.scala 528:110]
    node _T_1418 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1419 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1420 = eq(_T_1419, UInt<4>("h08")) @[ifu_bp_ctl.scala 529:74]
    node _T_1421 = and(_T_1418, _T_1420) @[ifu_bp_ctl.scala 529:22]
    node _T_1422 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1423 = eq(_T_1422, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1424 = or(_T_1423, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1425 = and(_T_1421, _T_1424) @[ifu_bp_ctl.scala 529:87]
    node _T_1426 = or(_T_1417, _T_1425) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][8] <= _T_1426 @[ifu_bp_ctl.scala 528:27]
    node _T_1427 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1428 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1429 = eq(_T_1428, UInt<4>("h09")) @[ifu_bp_ctl.scala 528:97]
    node _T_1430 = and(_T_1427, _T_1429) @[ifu_bp_ctl.scala 528:45]
    node _T_1431 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1432 = eq(_T_1431, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1433 = or(_T_1432, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1434 = and(_T_1430, _T_1433) @[ifu_bp_ctl.scala 528:110]
    node _T_1435 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1436 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1437 = eq(_T_1436, UInt<4>("h09")) @[ifu_bp_ctl.scala 529:74]
    node _T_1438 = and(_T_1435, _T_1437) @[ifu_bp_ctl.scala 529:22]
    node _T_1439 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1440 = eq(_T_1439, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1441 = or(_T_1440, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1442 = and(_T_1438, _T_1441) @[ifu_bp_ctl.scala 529:87]
    node _T_1443 = or(_T_1434, _T_1442) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][9] <= _T_1443 @[ifu_bp_ctl.scala 528:27]
    node _T_1444 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1445 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1446 = eq(_T_1445, UInt<4>("h0a")) @[ifu_bp_ctl.scala 528:97]
    node _T_1447 = and(_T_1444, _T_1446) @[ifu_bp_ctl.scala 528:45]
    node _T_1448 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1449 = eq(_T_1448, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1450 = or(_T_1449, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1451 = and(_T_1447, _T_1450) @[ifu_bp_ctl.scala 528:110]
    node _T_1452 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1453 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1454 = eq(_T_1453, UInt<4>("h0a")) @[ifu_bp_ctl.scala 529:74]
    node _T_1455 = and(_T_1452, _T_1454) @[ifu_bp_ctl.scala 529:22]
    node _T_1456 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1457 = eq(_T_1456, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1458 = or(_T_1457, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1459 = and(_T_1455, _T_1458) @[ifu_bp_ctl.scala 529:87]
    node _T_1460 = or(_T_1451, _T_1459) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][10] <= _T_1460 @[ifu_bp_ctl.scala 528:27]
    node _T_1461 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1462 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1463 = eq(_T_1462, UInt<4>("h0b")) @[ifu_bp_ctl.scala 528:97]
    node _T_1464 = and(_T_1461, _T_1463) @[ifu_bp_ctl.scala 528:45]
    node _T_1465 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1466 = eq(_T_1465, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1467 = or(_T_1466, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1468 = and(_T_1464, _T_1467) @[ifu_bp_ctl.scala 528:110]
    node _T_1469 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1470 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1471 = eq(_T_1470, UInt<4>("h0b")) @[ifu_bp_ctl.scala 529:74]
    node _T_1472 = and(_T_1469, _T_1471) @[ifu_bp_ctl.scala 529:22]
    node _T_1473 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1474 = eq(_T_1473, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1475 = or(_T_1474, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1476 = and(_T_1472, _T_1475) @[ifu_bp_ctl.scala 529:87]
    node _T_1477 = or(_T_1468, _T_1476) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][11] <= _T_1477 @[ifu_bp_ctl.scala 528:27]
    node _T_1478 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1479 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1480 = eq(_T_1479, UInt<4>("h0c")) @[ifu_bp_ctl.scala 528:97]
    node _T_1481 = and(_T_1478, _T_1480) @[ifu_bp_ctl.scala 528:45]
    node _T_1482 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1483 = eq(_T_1482, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1484 = or(_T_1483, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1485 = and(_T_1481, _T_1484) @[ifu_bp_ctl.scala 528:110]
    node _T_1486 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1487 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1488 = eq(_T_1487, UInt<4>("h0c")) @[ifu_bp_ctl.scala 529:74]
    node _T_1489 = and(_T_1486, _T_1488) @[ifu_bp_ctl.scala 529:22]
    node _T_1490 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1491 = eq(_T_1490, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1492 = or(_T_1491, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1493 = and(_T_1489, _T_1492) @[ifu_bp_ctl.scala 529:87]
    node _T_1494 = or(_T_1485, _T_1493) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][12] <= _T_1494 @[ifu_bp_ctl.scala 528:27]
    node _T_1495 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1496 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1497 = eq(_T_1496, UInt<4>("h0d")) @[ifu_bp_ctl.scala 528:97]
    node _T_1498 = and(_T_1495, _T_1497) @[ifu_bp_ctl.scala 528:45]
    node _T_1499 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1500 = eq(_T_1499, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1501 = or(_T_1500, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1502 = and(_T_1498, _T_1501) @[ifu_bp_ctl.scala 528:110]
    node _T_1503 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1504 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1505 = eq(_T_1504, UInt<4>("h0d")) @[ifu_bp_ctl.scala 529:74]
    node _T_1506 = and(_T_1503, _T_1505) @[ifu_bp_ctl.scala 529:22]
    node _T_1507 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1508 = eq(_T_1507, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1509 = or(_T_1508, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1510 = and(_T_1506, _T_1509) @[ifu_bp_ctl.scala 529:87]
    node _T_1511 = or(_T_1502, _T_1510) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][13] <= _T_1511 @[ifu_bp_ctl.scala 528:27]
    node _T_1512 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1513 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1514 = eq(_T_1513, UInt<4>("h0e")) @[ifu_bp_ctl.scala 528:97]
    node _T_1515 = and(_T_1512, _T_1514) @[ifu_bp_ctl.scala 528:45]
    node _T_1516 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1517 = eq(_T_1516, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1518 = or(_T_1517, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1519 = and(_T_1515, _T_1518) @[ifu_bp_ctl.scala 528:110]
    node _T_1520 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1521 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1522 = eq(_T_1521, UInt<4>("h0e")) @[ifu_bp_ctl.scala 529:74]
    node _T_1523 = and(_T_1520, _T_1522) @[ifu_bp_ctl.scala 529:22]
    node _T_1524 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1525 = eq(_T_1524, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1526 = or(_T_1525, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1527 = and(_T_1523, _T_1526) @[ifu_bp_ctl.scala 529:87]
    node _T_1528 = or(_T_1519, _T_1527) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][14] <= _T_1528 @[ifu_bp_ctl.scala 528:27]
    node _T_1529 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 528:41]
    node _T_1530 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1531 = eq(_T_1530, UInt<4>("h0f")) @[ifu_bp_ctl.scala 528:97]
    node _T_1532 = and(_T_1529, _T_1531) @[ifu_bp_ctl.scala 528:45]
    node _T_1533 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1534 = eq(_T_1533, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1535 = or(_T_1534, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1536 = and(_T_1532, _T_1535) @[ifu_bp_ctl.scala 528:110]
    node _T_1537 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 529:18]
    node _T_1538 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1539 = eq(_T_1538, UInt<4>("h0f")) @[ifu_bp_ctl.scala 529:74]
    node _T_1540 = and(_T_1537, _T_1539) @[ifu_bp_ctl.scala 529:22]
    node _T_1541 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1542 = eq(_T_1541, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1543 = or(_T_1542, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1544 = and(_T_1540, _T_1543) @[ifu_bp_ctl.scala 529:87]
    node _T_1545 = or(_T_1536, _T_1544) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[0][0][15] <= _T_1545 @[ifu_bp_ctl.scala 528:27]
    node _T_1546 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1547 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1548 = eq(_T_1547, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:97]
    node _T_1549 = and(_T_1546, _T_1548) @[ifu_bp_ctl.scala 528:45]
    node _T_1550 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1551 = eq(_T_1550, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1552 = or(_T_1551, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1553 = and(_T_1549, _T_1552) @[ifu_bp_ctl.scala 528:110]
    node _T_1554 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1555 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1556 = eq(_T_1555, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:74]
    node _T_1557 = and(_T_1554, _T_1556) @[ifu_bp_ctl.scala 529:22]
    node _T_1558 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1559 = eq(_T_1558, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1560 = or(_T_1559, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1561 = and(_T_1557, _T_1560) @[ifu_bp_ctl.scala 529:87]
    node _T_1562 = or(_T_1553, _T_1561) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][0] <= _T_1562 @[ifu_bp_ctl.scala 528:27]
    node _T_1563 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1564 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1565 = eq(_T_1564, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:97]
    node _T_1566 = and(_T_1563, _T_1565) @[ifu_bp_ctl.scala 528:45]
    node _T_1567 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1568 = eq(_T_1567, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1569 = or(_T_1568, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1570 = and(_T_1566, _T_1569) @[ifu_bp_ctl.scala 528:110]
    node _T_1571 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1572 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1573 = eq(_T_1572, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:74]
    node _T_1574 = and(_T_1571, _T_1573) @[ifu_bp_ctl.scala 529:22]
    node _T_1575 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1576 = eq(_T_1575, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1577 = or(_T_1576, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1578 = and(_T_1574, _T_1577) @[ifu_bp_ctl.scala 529:87]
    node _T_1579 = or(_T_1570, _T_1578) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][1] <= _T_1579 @[ifu_bp_ctl.scala 528:27]
    node _T_1580 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1581 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1582 = eq(_T_1581, UInt<2>("h02")) @[ifu_bp_ctl.scala 528:97]
    node _T_1583 = and(_T_1580, _T_1582) @[ifu_bp_ctl.scala 528:45]
    node _T_1584 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1585 = eq(_T_1584, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1586 = or(_T_1585, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1587 = and(_T_1583, _T_1586) @[ifu_bp_ctl.scala 528:110]
    node _T_1588 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1589 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1590 = eq(_T_1589, UInt<2>("h02")) @[ifu_bp_ctl.scala 529:74]
    node _T_1591 = and(_T_1588, _T_1590) @[ifu_bp_ctl.scala 529:22]
    node _T_1592 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1593 = eq(_T_1592, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1594 = or(_T_1593, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1595 = and(_T_1591, _T_1594) @[ifu_bp_ctl.scala 529:87]
    node _T_1596 = or(_T_1587, _T_1595) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][2] <= _T_1596 @[ifu_bp_ctl.scala 528:27]
    node _T_1597 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1598 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1599 = eq(_T_1598, UInt<2>("h03")) @[ifu_bp_ctl.scala 528:97]
    node _T_1600 = and(_T_1597, _T_1599) @[ifu_bp_ctl.scala 528:45]
    node _T_1601 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1602 = eq(_T_1601, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1603 = or(_T_1602, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1604 = and(_T_1600, _T_1603) @[ifu_bp_ctl.scala 528:110]
    node _T_1605 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1606 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1607 = eq(_T_1606, UInt<2>("h03")) @[ifu_bp_ctl.scala 529:74]
    node _T_1608 = and(_T_1605, _T_1607) @[ifu_bp_ctl.scala 529:22]
    node _T_1609 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1610 = eq(_T_1609, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1611 = or(_T_1610, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1612 = and(_T_1608, _T_1611) @[ifu_bp_ctl.scala 529:87]
    node _T_1613 = or(_T_1604, _T_1612) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][3] <= _T_1613 @[ifu_bp_ctl.scala 528:27]
    node _T_1614 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1615 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1616 = eq(_T_1615, UInt<3>("h04")) @[ifu_bp_ctl.scala 528:97]
    node _T_1617 = and(_T_1614, _T_1616) @[ifu_bp_ctl.scala 528:45]
    node _T_1618 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1619 = eq(_T_1618, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1620 = or(_T_1619, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1621 = and(_T_1617, _T_1620) @[ifu_bp_ctl.scala 528:110]
    node _T_1622 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1623 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1624 = eq(_T_1623, UInt<3>("h04")) @[ifu_bp_ctl.scala 529:74]
    node _T_1625 = and(_T_1622, _T_1624) @[ifu_bp_ctl.scala 529:22]
    node _T_1626 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1627 = eq(_T_1626, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1628 = or(_T_1627, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1629 = and(_T_1625, _T_1628) @[ifu_bp_ctl.scala 529:87]
    node _T_1630 = or(_T_1621, _T_1629) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][4] <= _T_1630 @[ifu_bp_ctl.scala 528:27]
    node _T_1631 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1632 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1633 = eq(_T_1632, UInt<3>("h05")) @[ifu_bp_ctl.scala 528:97]
    node _T_1634 = and(_T_1631, _T_1633) @[ifu_bp_ctl.scala 528:45]
    node _T_1635 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1636 = eq(_T_1635, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1637 = or(_T_1636, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1638 = and(_T_1634, _T_1637) @[ifu_bp_ctl.scala 528:110]
    node _T_1639 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1640 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1641 = eq(_T_1640, UInt<3>("h05")) @[ifu_bp_ctl.scala 529:74]
    node _T_1642 = and(_T_1639, _T_1641) @[ifu_bp_ctl.scala 529:22]
    node _T_1643 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1644 = eq(_T_1643, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1645 = or(_T_1644, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1646 = and(_T_1642, _T_1645) @[ifu_bp_ctl.scala 529:87]
    node _T_1647 = or(_T_1638, _T_1646) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][5] <= _T_1647 @[ifu_bp_ctl.scala 528:27]
    node _T_1648 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1649 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1650 = eq(_T_1649, UInt<3>("h06")) @[ifu_bp_ctl.scala 528:97]
    node _T_1651 = and(_T_1648, _T_1650) @[ifu_bp_ctl.scala 528:45]
    node _T_1652 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1653 = eq(_T_1652, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1654 = or(_T_1653, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1655 = and(_T_1651, _T_1654) @[ifu_bp_ctl.scala 528:110]
    node _T_1656 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1657 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1658 = eq(_T_1657, UInt<3>("h06")) @[ifu_bp_ctl.scala 529:74]
    node _T_1659 = and(_T_1656, _T_1658) @[ifu_bp_ctl.scala 529:22]
    node _T_1660 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1661 = eq(_T_1660, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1662 = or(_T_1661, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1663 = and(_T_1659, _T_1662) @[ifu_bp_ctl.scala 529:87]
    node _T_1664 = or(_T_1655, _T_1663) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][6] <= _T_1664 @[ifu_bp_ctl.scala 528:27]
    node _T_1665 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1666 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1667 = eq(_T_1666, UInt<3>("h07")) @[ifu_bp_ctl.scala 528:97]
    node _T_1668 = and(_T_1665, _T_1667) @[ifu_bp_ctl.scala 528:45]
    node _T_1669 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1670 = eq(_T_1669, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1671 = or(_T_1670, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1672 = and(_T_1668, _T_1671) @[ifu_bp_ctl.scala 528:110]
    node _T_1673 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1674 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1675 = eq(_T_1674, UInt<3>("h07")) @[ifu_bp_ctl.scala 529:74]
    node _T_1676 = and(_T_1673, _T_1675) @[ifu_bp_ctl.scala 529:22]
    node _T_1677 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1678 = eq(_T_1677, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1679 = or(_T_1678, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1680 = and(_T_1676, _T_1679) @[ifu_bp_ctl.scala 529:87]
    node _T_1681 = or(_T_1672, _T_1680) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][7] <= _T_1681 @[ifu_bp_ctl.scala 528:27]
    node _T_1682 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1683 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1684 = eq(_T_1683, UInt<4>("h08")) @[ifu_bp_ctl.scala 528:97]
    node _T_1685 = and(_T_1682, _T_1684) @[ifu_bp_ctl.scala 528:45]
    node _T_1686 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1687 = eq(_T_1686, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1688 = or(_T_1687, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1689 = and(_T_1685, _T_1688) @[ifu_bp_ctl.scala 528:110]
    node _T_1690 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1691 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1692 = eq(_T_1691, UInt<4>("h08")) @[ifu_bp_ctl.scala 529:74]
    node _T_1693 = and(_T_1690, _T_1692) @[ifu_bp_ctl.scala 529:22]
    node _T_1694 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1695 = eq(_T_1694, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1696 = or(_T_1695, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1697 = and(_T_1693, _T_1696) @[ifu_bp_ctl.scala 529:87]
    node _T_1698 = or(_T_1689, _T_1697) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][8] <= _T_1698 @[ifu_bp_ctl.scala 528:27]
    node _T_1699 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1700 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1701 = eq(_T_1700, UInt<4>("h09")) @[ifu_bp_ctl.scala 528:97]
    node _T_1702 = and(_T_1699, _T_1701) @[ifu_bp_ctl.scala 528:45]
    node _T_1703 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1704 = eq(_T_1703, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1705 = or(_T_1704, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1706 = and(_T_1702, _T_1705) @[ifu_bp_ctl.scala 528:110]
    node _T_1707 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1708 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1709 = eq(_T_1708, UInt<4>("h09")) @[ifu_bp_ctl.scala 529:74]
    node _T_1710 = and(_T_1707, _T_1709) @[ifu_bp_ctl.scala 529:22]
    node _T_1711 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1712 = eq(_T_1711, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1713 = or(_T_1712, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1714 = and(_T_1710, _T_1713) @[ifu_bp_ctl.scala 529:87]
    node _T_1715 = or(_T_1706, _T_1714) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][9] <= _T_1715 @[ifu_bp_ctl.scala 528:27]
    node _T_1716 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1717 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1718 = eq(_T_1717, UInt<4>("h0a")) @[ifu_bp_ctl.scala 528:97]
    node _T_1719 = and(_T_1716, _T_1718) @[ifu_bp_ctl.scala 528:45]
    node _T_1720 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1721 = eq(_T_1720, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1722 = or(_T_1721, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1723 = and(_T_1719, _T_1722) @[ifu_bp_ctl.scala 528:110]
    node _T_1724 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1725 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1726 = eq(_T_1725, UInt<4>("h0a")) @[ifu_bp_ctl.scala 529:74]
    node _T_1727 = and(_T_1724, _T_1726) @[ifu_bp_ctl.scala 529:22]
    node _T_1728 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1729 = eq(_T_1728, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1730 = or(_T_1729, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1731 = and(_T_1727, _T_1730) @[ifu_bp_ctl.scala 529:87]
    node _T_1732 = or(_T_1723, _T_1731) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][10] <= _T_1732 @[ifu_bp_ctl.scala 528:27]
    node _T_1733 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1734 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1735 = eq(_T_1734, UInt<4>("h0b")) @[ifu_bp_ctl.scala 528:97]
    node _T_1736 = and(_T_1733, _T_1735) @[ifu_bp_ctl.scala 528:45]
    node _T_1737 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1738 = eq(_T_1737, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1739 = or(_T_1738, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1740 = and(_T_1736, _T_1739) @[ifu_bp_ctl.scala 528:110]
    node _T_1741 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1742 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1743 = eq(_T_1742, UInt<4>("h0b")) @[ifu_bp_ctl.scala 529:74]
    node _T_1744 = and(_T_1741, _T_1743) @[ifu_bp_ctl.scala 529:22]
    node _T_1745 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1746 = eq(_T_1745, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1747 = or(_T_1746, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1748 = and(_T_1744, _T_1747) @[ifu_bp_ctl.scala 529:87]
    node _T_1749 = or(_T_1740, _T_1748) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][11] <= _T_1749 @[ifu_bp_ctl.scala 528:27]
    node _T_1750 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1751 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1752 = eq(_T_1751, UInt<4>("h0c")) @[ifu_bp_ctl.scala 528:97]
    node _T_1753 = and(_T_1750, _T_1752) @[ifu_bp_ctl.scala 528:45]
    node _T_1754 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1755 = eq(_T_1754, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1756 = or(_T_1755, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1757 = and(_T_1753, _T_1756) @[ifu_bp_ctl.scala 528:110]
    node _T_1758 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1759 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1760 = eq(_T_1759, UInt<4>("h0c")) @[ifu_bp_ctl.scala 529:74]
    node _T_1761 = and(_T_1758, _T_1760) @[ifu_bp_ctl.scala 529:22]
    node _T_1762 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1763 = eq(_T_1762, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1764 = or(_T_1763, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1765 = and(_T_1761, _T_1764) @[ifu_bp_ctl.scala 529:87]
    node _T_1766 = or(_T_1757, _T_1765) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][12] <= _T_1766 @[ifu_bp_ctl.scala 528:27]
    node _T_1767 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1768 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1769 = eq(_T_1768, UInt<4>("h0d")) @[ifu_bp_ctl.scala 528:97]
    node _T_1770 = and(_T_1767, _T_1769) @[ifu_bp_ctl.scala 528:45]
    node _T_1771 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1772 = eq(_T_1771, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1773 = or(_T_1772, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1774 = and(_T_1770, _T_1773) @[ifu_bp_ctl.scala 528:110]
    node _T_1775 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1776 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1777 = eq(_T_1776, UInt<4>("h0d")) @[ifu_bp_ctl.scala 529:74]
    node _T_1778 = and(_T_1775, _T_1777) @[ifu_bp_ctl.scala 529:22]
    node _T_1779 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1780 = eq(_T_1779, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1781 = or(_T_1780, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1782 = and(_T_1778, _T_1781) @[ifu_bp_ctl.scala 529:87]
    node _T_1783 = or(_T_1774, _T_1782) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][13] <= _T_1783 @[ifu_bp_ctl.scala 528:27]
    node _T_1784 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1785 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1786 = eq(_T_1785, UInt<4>("h0e")) @[ifu_bp_ctl.scala 528:97]
    node _T_1787 = and(_T_1784, _T_1786) @[ifu_bp_ctl.scala 528:45]
    node _T_1788 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1789 = eq(_T_1788, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1790 = or(_T_1789, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1791 = and(_T_1787, _T_1790) @[ifu_bp_ctl.scala 528:110]
    node _T_1792 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1793 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1794 = eq(_T_1793, UInt<4>("h0e")) @[ifu_bp_ctl.scala 529:74]
    node _T_1795 = and(_T_1792, _T_1794) @[ifu_bp_ctl.scala 529:22]
    node _T_1796 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1797 = eq(_T_1796, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1798 = or(_T_1797, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1799 = and(_T_1795, _T_1798) @[ifu_bp_ctl.scala 529:87]
    node _T_1800 = or(_T_1791, _T_1799) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][14] <= _T_1800 @[ifu_bp_ctl.scala 528:27]
    node _T_1801 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 528:41]
    node _T_1802 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:60]
    node _T_1803 = eq(_T_1802, UInt<4>("h0f")) @[ifu_bp_ctl.scala 528:97]
    node _T_1804 = and(_T_1801, _T_1803) @[ifu_bp_ctl.scala 528:45]
    node _T_1805 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 528:126]
    node _T_1806 = eq(_T_1805, UInt<1>("h00")) @[ifu_bp_ctl.scala 528:186]
    node _T_1807 = or(_T_1806, UInt<1>("h01")) @[ifu_bp_ctl.scala 528:199]
    node _T_1808 = and(_T_1804, _T_1807) @[ifu_bp_ctl.scala 528:110]
    node _T_1809 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 529:18]
    node _T_1810 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:37]
    node _T_1811 = eq(_T_1810, UInt<4>("h0f")) @[ifu_bp_ctl.scala 529:74]
    node _T_1812 = and(_T_1809, _T_1811) @[ifu_bp_ctl.scala 529:22]
    node _T_1813 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 529:103]
    node _T_1814 = eq(_T_1813, UInt<1>("h00")) @[ifu_bp_ctl.scala 529:163]
    node _T_1815 = or(_T_1814, UInt<1>("h01")) @[ifu_bp_ctl.scala 529:176]
    node _T_1816 = and(_T_1812, _T_1815) @[ifu_bp_ctl.scala 529:87]
    node _T_1817 = or(_T_1808, _T_1816) @[ifu_bp_ctl.scala 528:223]
    bht_bank_sel[1][0][15] <= _T_1817 @[ifu_bp_ctl.scala 528:27]
    wire bht_bank_rd_data_out : UInt<2>[16][2] @[ifu_bp_ctl.scala 532:34]
    node _T_1818 = and(bht_bank_sel[0][0][0], bht_bank_sel[0][0][0]) @[lib.scala 383:57]
    reg _T_1819 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1818 : @[Reg.scala 28:19]
      _T_1819 <= bht_bank_wr_data_0_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][0] <= _T_1819 @[ifu_bp_ctl.scala 534:39]
    node _T_1820 = and(bht_bank_sel[0][0][1], bht_bank_sel[0][0][1]) @[lib.scala 383:57]
    reg _T_1821 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1820 : @[Reg.scala 28:19]
      _T_1821 <= bht_bank_wr_data_0_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][1] <= _T_1821 @[ifu_bp_ctl.scala 534:39]
    node _T_1822 = and(bht_bank_sel[0][0][2], bht_bank_sel[0][0][2]) @[lib.scala 383:57]
    reg _T_1823 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1822 : @[Reg.scala 28:19]
      _T_1823 <= bht_bank_wr_data_0_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][2] <= _T_1823 @[ifu_bp_ctl.scala 534:39]
    node _T_1824 = and(bht_bank_sel[0][0][3], bht_bank_sel[0][0][3]) @[lib.scala 383:57]
    reg _T_1825 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1824 : @[Reg.scala 28:19]
      _T_1825 <= bht_bank_wr_data_0_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][3] <= _T_1825 @[ifu_bp_ctl.scala 534:39]
    node _T_1826 = and(bht_bank_sel[0][0][4], bht_bank_sel[0][0][4]) @[lib.scala 383:57]
    reg _T_1827 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1826 : @[Reg.scala 28:19]
      _T_1827 <= bht_bank_wr_data_0_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][4] <= _T_1827 @[ifu_bp_ctl.scala 534:39]
    node _T_1828 = and(bht_bank_sel[0][0][5], bht_bank_sel[0][0][5]) @[lib.scala 383:57]
    reg _T_1829 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1828 : @[Reg.scala 28:19]
      _T_1829 <= bht_bank_wr_data_0_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][5] <= _T_1829 @[ifu_bp_ctl.scala 534:39]
    node _T_1830 = and(bht_bank_sel[0][0][6], bht_bank_sel[0][0][6]) @[lib.scala 383:57]
    reg _T_1831 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1830 : @[Reg.scala 28:19]
      _T_1831 <= bht_bank_wr_data_0_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][6] <= _T_1831 @[ifu_bp_ctl.scala 534:39]
    node _T_1832 = and(bht_bank_sel[0][0][7], bht_bank_sel[0][0][7]) @[lib.scala 383:57]
    reg _T_1833 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1832 : @[Reg.scala 28:19]
      _T_1833 <= bht_bank_wr_data_0_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][7] <= _T_1833 @[ifu_bp_ctl.scala 534:39]
    node _T_1834 = and(bht_bank_sel[0][0][8], bht_bank_sel[0][0][8]) @[lib.scala 383:57]
    reg _T_1835 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1834 : @[Reg.scala 28:19]
      _T_1835 <= bht_bank_wr_data_0_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][8] <= _T_1835 @[ifu_bp_ctl.scala 534:39]
    node _T_1836 = and(bht_bank_sel[0][0][9], bht_bank_sel[0][0][9]) @[lib.scala 383:57]
    reg _T_1837 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1836 : @[Reg.scala 28:19]
      _T_1837 <= bht_bank_wr_data_0_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][9] <= _T_1837 @[ifu_bp_ctl.scala 534:39]
    node _T_1838 = and(bht_bank_sel[0][0][10], bht_bank_sel[0][0][10]) @[lib.scala 383:57]
    reg _T_1839 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1838 : @[Reg.scala 28:19]
      _T_1839 <= bht_bank_wr_data_0_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][10] <= _T_1839 @[ifu_bp_ctl.scala 534:39]
    node _T_1840 = and(bht_bank_sel[0][0][11], bht_bank_sel[0][0][11]) @[lib.scala 383:57]
    reg _T_1841 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1840 : @[Reg.scala 28:19]
      _T_1841 <= bht_bank_wr_data_0_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][11] <= _T_1841 @[ifu_bp_ctl.scala 534:39]
    node _T_1842 = and(bht_bank_sel[0][0][12], bht_bank_sel[0][0][12]) @[lib.scala 383:57]
    reg _T_1843 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1842 : @[Reg.scala 28:19]
      _T_1843 <= bht_bank_wr_data_0_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][12] <= _T_1843 @[ifu_bp_ctl.scala 534:39]
    node _T_1844 = and(bht_bank_sel[0][0][13], bht_bank_sel[0][0][13]) @[lib.scala 383:57]
    reg _T_1845 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1844 : @[Reg.scala 28:19]
      _T_1845 <= bht_bank_wr_data_0_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][13] <= _T_1845 @[ifu_bp_ctl.scala 534:39]
    node _T_1846 = and(bht_bank_sel[0][0][14], bht_bank_sel[0][0][14]) @[lib.scala 383:57]
    reg _T_1847 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1846 : @[Reg.scala 28:19]
      _T_1847 <= bht_bank_wr_data_0_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][14] <= _T_1847 @[ifu_bp_ctl.scala 534:39]
    node _T_1848 = and(bht_bank_sel[0][0][15], bht_bank_sel[0][0][15]) @[lib.scala 383:57]
    reg _T_1849 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1848 : @[Reg.scala 28:19]
      _T_1849 <= bht_bank_wr_data_0_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][15] <= _T_1849 @[ifu_bp_ctl.scala 534:39]
    node _T_1850 = and(bht_bank_sel[1][0][0], bht_bank_sel[1][0][0]) @[lib.scala 383:57]
    reg _T_1851 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1850 : @[Reg.scala 28:19]
      _T_1851 <= bht_bank_wr_data_1_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][0] <= _T_1851 @[ifu_bp_ctl.scala 534:39]
    node _T_1852 = and(bht_bank_sel[1][0][1], bht_bank_sel[1][0][1]) @[lib.scala 383:57]
    reg _T_1853 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1852 : @[Reg.scala 28:19]
      _T_1853 <= bht_bank_wr_data_1_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][1] <= _T_1853 @[ifu_bp_ctl.scala 534:39]
    node _T_1854 = and(bht_bank_sel[1][0][2], bht_bank_sel[1][0][2]) @[lib.scala 383:57]
    reg _T_1855 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1854 : @[Reg.scala 28:19]
      _T_1855 <= bht_bank_wr_data_1_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][2] <= _T_1855 @[ifu_bp_ctl.scala 534:39]
    node _T_1856 = and(bht_bank_sel[1][0][3], bht_bank_sel[1][0][3]) @[lib.scala 383:57]
    reg _T_1857 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1856 : @[Reg.scala 28:19]
      _T_1857 <= bht_bank_wr_data_1_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][3] <= _T_1857 @[ifu_bp_ctl.scala 534:39]
    node _T_1858 = and(bht_bank_sel[1][0][4], bht_bank_sel[1][0][4]) @[lib.scala 383:57]
    reg _T_1859 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1858 : @[Reg.scala 28:19]
      _T_1859 <= bht_bank_wr_data_1_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][4] <= _T_1859 @[ifu_bp_ctl.scala 534:39]
    node _T_1860 = and(bht_bank_sel[1][0][5], bht_bank_sel[1][0][5]) @[lib.scala 383:57]
    reg _T_1861 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1860 : @[Reg.scala 28:19]
      _T_1861 <= bht_bank_wr_data_1_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][5] <= _T_1861 @[ifu_bp_ctl.scala 534:39]
    node _T_1862 = and(bht_bank_sel[1][0][6], bht_bank_sel[1][0][6]) @[lib.scala 383:57]
    reg _T_1863 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1862 : @[Reg.scala 28:19]
      _T_1863 <= bht_bank_wr_data_1_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][6] <= _T_1863 @[ifu_bp_ctl.scala 534:39]
    node _T_1864 = and(bht_bank_sel[1][0][7], bht_bank_sel[1][0][7]) @[lib.scala 383:57]
    reg _T_1865 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1864 : @[Reg.scala 28:19]
      _T_1865 <= bht_bank_wr_data_1_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][7] <= _T_1865 @[ifu_bp_ctl.scala 534:39]
    node _T_1866 = and(bht_bank_sel[1][0][8], bht_bank_sel[1][0][8]) @[lib.scala 383:57]
    reg _T_1867 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1866 : @[Reg.scala 28:19]
      _T_1867 <= bht_bank_wr_data_1_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][8] <= _T_1867 @[ifu_bp_ctl.scala 534:39]
    node _T_1868 = and(bht_bank_sel[1][0][9], bht_bank_sel[1][0][9]) @[lib.scala 383:57]
    reg _T_1869 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1868 : @[Reg.scala 28:19]
      _T_1869 <= bht_bank_wr_data_1_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][9] <= _T_1869 @[ifu_bp_ctl.scala 534:39]
    node _T_1870 = and(bht_bank_sel[1][0][10], bht_bank_sel[1][0][10]) @[lib.scala 383:57]
    reg _T_1871 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1870 : @[Reg.scala 28:19]
      _T_1871 <= bht_bank_wr_data_1_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][10] <= _T_1871 @[ifu_bp_ctl.scala 534:39]
    node _T_1872 = and(bht_bank_sel[1][0][11], bht_bank_sel[1][0][11]) @[lib.scala 383:57]
    reg _T_1873 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1872 : @[Reg.scala 28:19]
      _T_1873 <= bht_bank_wr_data_1_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][11] <= _T_1873 @[ifu_bp_ctl.scala 534:39]
    node _T_1874 = and(bht_bank_sel[1][0][12], bht_bank_sel[1][0][12]) @[lib.scala 383:57]
    reg _T_1875 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1874 : @[Reg.scala 28:19]
      _T_1875 <= bht_bank_wr_data_1_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][12] <= _T_1875 @[ifu_bp_ctl.scala 534:39]
    node _T_1876 = and(bht_bank_sel[1][0][13], bht_bank_sel[1][0][13]) @[lib.scala 383:57]
    reg _T_1877 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1876 : @[Reg.scala 28:19]
      _T_1877 <= bht_bank_wr_data_1_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][13] <= _T_1877 @[ifu_bp_ctl.scala 534:39]
    node _T_1878 = and(bht_bank_sel[1][0][14], bht_bank_sel[1][0][14]) @[lib.scala 383:57]
    reg _T_1879 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1878 : @[Reg.scala 28:19]
      _T_1879 <= bht_bank_wr_data_1_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][14] <= _T_1879 @[ifu_bp_ctl.scala 534:39]
    node _T_1880 = and(bht_bank_sel[1][0][15], bht_bank_sel[1][0][15]) @[lib.scala 383:57]
    reg _T_1881 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1880 : @[Reg.scala 28:19]
      _T_1881 <= bht_bank_wr_data_1_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][15] <= _T_1881 @[ifu_bp_ctl.scala 534:39]
    node _T_1882 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 538:79]
    node _T_1883 = bits(_T_1882, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1884 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 538:79]
    node _T_1885 = bits(_T_1884, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1886 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 538:79]
    node _T_1887 = bits(_T_1886, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1888 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 538:79]
    node _T_1889 = bits(_T_1888, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1890 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 538:79]
    node _T_1891 = bits(_T_1890, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1892 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 538:79]
    node _T_1893 = bits(_T_1892, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1894 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 538:79]
    node _T_1895 = bits(_T_1894, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1896 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 538:79]
    node _T_1897 = bits(_T_1896, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1898 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 538:79]
    node _T_1899 = bits(_T_1898, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1900 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 538:79]
    node _T_1901 = bits(_T_1900, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1902 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 538:79]
    node _T_1903 = bits(_T_1902, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1904 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 538:79]
    node _T_1905 = bits(_T_1904, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1906 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 538:79]
    node _T_1907 = bits(_T_1906, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1908 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 538:79]
    node _T_1909 = bits(_T_1908, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1910 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 538:79]
    node _T_1911 = bits(_T_1910, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1912 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 538:79]
    node _T_1913 = bits(_T_1912, 0, 0) @[ifu_bp_ctl.scala 538:87]
    node _T_1914 = mux(_T_1883, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1915 = mux(_T_1885, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1916 = mux(_T_1887, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1917 = mux(_T_1889, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1918 = mux(_T_1891, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1919 = mux(_T_1893, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1920 = mux(_T_1895, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1921 = mux(_T_1897, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1922 = mux(_T_1899, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1923 = mux(_T_1901, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1924 = mux(_T_1903, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1925 = mux(_T_1905, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1926 = mux(_T_1907, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1927 = mux(_T_1909, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1928 = mux(_T_1911, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1929 = mux(_T_1913, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1930 = or(_T_1914, _T_1915) @[Mux.scala 27:72]
    node _T_1931 = or(_T_1930, _T_1916) @[Mux.scala 27:72]
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
    wire _T_1945 : UInt<2> @[Mux.scala 27:72]
    _T_1945 <= _T_1944 @[Mux.scala 27:72]
    bht_bank0_rd_data_f <= _T_1945 @[ifu_bp_ctl.scala 538:23]
    node _T_1946 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 539:79]
    node _T_1947 = bits(_T_1946, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1948 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 539:79]
    node _T_1949 = bits(_T_1948, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1950 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 539:79]
    node _T_1951 = bits(_T_1950, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1952 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 539:79]
    node _T_1953 = bits(_T_1952, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1954 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 539:79]
    node _T_1955 = bits(_T_1954, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1956 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 539:79]
    node _T_1957 = bits(_T_1956, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1958 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 539:79]
    node _T_1959 = bits(_T_1958, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1960 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 539:79]
    node _T_1961 = bits(_T_1960, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1962 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 539:79]
    node _T_1963 = bits(_T_1962, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1964 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 539:79]
    node _T_1965 = bits(_T_1964, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1966 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 539:79]
    node _T_1967 = bits(_T_1966, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1968 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 539:79]
    node _T_1969 = bits(_T_1968, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1970 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 539:79]
    node _T_1971 = bits(_T_1970, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1972 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 539:79]
    node _T_1973 = bits(_T_1972, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1974 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 539:79]
    node _T_1975 = bits(_T_1974, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1976 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 539:79]
    node _T_1977 = bits(_T_1976, 0, 0) @[ifu_bp_ctl.scala 539:87]
    node _T_1978 = mux(_T_1947, bht_bank_rd_data_out[1][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1979 = mux(_T_1949, bht_bank_rd_data_out[1][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1980 = mux(_T_1951, bht_bank_rd_data_out[1][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1981 = mux(_T_1953, bht_bank_rd_data_out[1][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1982 = mux(_T_1955, bht_bank_rd_data_out[1][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1983 = mux(_T_1957, bht_bank_rd_data_out[1][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1984 = mux(_T_1959, bht_bank_rd_data_out[1][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1985 = mux(_T_1961, bht_bank_rd_data_out[1][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1986 = mux(_T_1963, bht_bank_rd_data_out[1][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1987 = mux(_T_1965, bht_bank_rd_data_out[1][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1988 = mux(_T_1967, bht_bank_rd_data_out[1][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1989 = mux(_T_1969, bht_bank_rd_data_out[1][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1990 = mux(_T_1971, bht_bank_rd_data_out[1][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1991 = mux(_T_1973, bht_bank_rd_data_out[1][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1992 = mux(_T_1975, bht_bank_rd_data_out[1][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1993 = mux(_T_1977, bht_bank_rd_data_out[1][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1994 = or(_T_1978, _T_1979) @[Mux.scala 27:72]
    node _T_1995 = or(_T_1994, _T_1980) @[Mux.scala 27:72]
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
    wire _T_2009 : UInt<2> @[Mux.scala 27:72]
    _T_2009 <= _T_2008 @[Mux.scala 27:72]
    bht_bank1_rd_data_f <= _T_2009 @[ifu_bp_ctl.scala 539:23]
    node _T_2010 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 540:85]
    node _T_2011 = bits(_T_2010, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2012 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 540:85]
    node _T_2013 = bits(_T_2012, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2014 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 540:85]
    node _T_2015 = bits(_T_2014, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2016 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 540:85]
    node _T_2017 = bits(_T_2016, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2018 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 540:85]
    node _T_2019 = bits(_T_2018, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2020 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 540:85]
    node _T_2021 = bits(_T_2020, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2022 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 540:85]
    node _T_2023 = bits(_T_2022, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2024 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 540:85]
    node _T_2025 = bits(_T_2024, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2026 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 540:85]
    node _T_2027 = bits(_T_2026, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2028 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 540:85]
    node _T_2029 = bits(_T_2028, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2030 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 540:85]
    node _T_2031 = bits(_T_2030, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2032 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 540:85]
    node _T_2033 = bits(_T_2032, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2034 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 540:85]
    node _T_2035 = bits(_T_2034, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2036 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 540:85]
    node _T_2037 = bits(_T_2036, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2038 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 540:85]
    node _T_2039 = bits(_T_2038, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2040 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 540:85]
    node _T_2041 = bits(_T_2040, 0, 0) @[ifu_bp_ctl.scala 540:93]
    node _T_2042 = mux(_T_2011, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2043 = mux(_T_2013, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2044 = mux(_T_2015, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2045 = mux(_T_2017, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2046 = mux(_T_2019, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2047 = mux(_T_2021, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2048 = mux(_T_2023, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2049 = mux(_T_2025, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2050 = mux(_T_2027, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2051 = mux(_T_2029, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2052 = mux(_T_2031, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2053 = mux(_T_2033, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2054 = mux(_T_2035, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2055 = mux(_T_2037, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2056 = mux(_T_2039, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2057 = mux(_T_2041, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2058 = or(_T_2042, _T_2043) @[Mux.scala 27:72]
    node _T_2059 = or(_T_2058, _T_2044) @[Mux.scala 27:72]
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
    wire _T_2073 : UInt<2> @[Mux.scala 27:72]
    _T_2073 <= _T_2072 @[Mux.scala 27:72]
    bht_bank0_rd_data_p1_f <= _T_2073 @[ifu_bp_ctl.scala 540:26]
    
