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
    node _T_597 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 440:47]
    node _T_598 = bits(_T_597, 0, 0) @[ifu_bp_ctl.scala 440:51]
    node _T_599 = eq(_T_598, UInt<1>("h00")) @[ifu_bp_ctl.scala 440:27]
    node _T_600 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_bp_ctl.scala 441:24]
    node _T_601 = bits(_T_600, 0, 0) @[ifu_bp_ctl.scala 441:28]
    node _T_602 = bits(wayhit_p1_f, 0, 0) @[ifu_bp_ctl.scala 441:51]
    node _T_603 = bits(wayhit_f, 1, 1) @[ifu_bp_ctl.scala 441:64]
    node _T_604 = cat(_T_602, _T_603) @[Cat.scala 29:58]
    node _T_605 = mux(_T_599, wayhit_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_606 = mux(_T_601, _T_604, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_607 = or(_T_605, _T_606) @[Mux.scala 27:72]
    wire _T_608 : UInt<2> @[Mux.scala 27:72]
    _T_608 <= _T_607 @[Mux.scala 27:72]
    node _T_609 = cat(eoc_mask, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_610 = and(_T_608, _T_609) @[ifu_bp_ctl.scala 441:71]
    vwayhit_f <= _T_610 @[ifu_bp_ctl.scala 440:14]
    node _T_611 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 445:98]
    node _T_612 = and(_T_611, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_613 = bits(_T_612, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_9 of rvclkhdr_9 @[lib.scala 399:23]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_9.io.en <= _T_613 @[lib.scala 402:17]
    rvclkhdr_9.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_613 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_614 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 445:98]
    node _T_615 = and(_T_614, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_616 = bits(_T_615, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_10 of rvclkhdr_10 @[lib.scala 399:23]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_10.io.en <= _T_616 @[lib.scala 402:17]
    rvclkhdr_10.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_616 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_617 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 445:98]
    node _T_618 = and(_T_617, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_619 = bits(_T_618, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_11 of rvclkhdr_11 @[lib.scala 399:23]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_11.io.en <= _T_619 @[lib.scala 402:17]
    rvclkhdr_11.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_619 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_620 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 445:98]
    node _T_621 = and(_T_620, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_622 = bits(_T_621, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_12 of rvclkhdr_12 @[lib.scala 399:23]
    rvclkhdr_12.clock <= clock
    rvclkhdr_12.reset <= reset
    rvclkhdr_12.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_12.io.en <= _T_622 @[lib.scala 402:17]
    rvclkhdr_12.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_622 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_623 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 445:98]
    node _T_624 = and(_T_623, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_625 = bits(_T_624, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_13 of rvclkhdr_13 @[lib.scala 399:23]
    rvclkhdr_13.clock <= clock
    rvclkhdr_13.reset <= reset
    rvclkhdr_13.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_13.io.en <= _T_625 @[lib.scala 402:17]
    rvclkhdr_13.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_625 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_626 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 445:98]
    node _T_627 = and(_T_626, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_628 = bits(_T_627, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_14 of rvclkhdr_14 @[lib.scala 399:23]
    rvclkhdr_14.clock <= clock
    rvclkhdr_14.reset <= reset
    rvclkhdr_14.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_14.io.en <= _T_628 @[lib.scala 402:17]
    rvclkhdr_14.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_628 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_629 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 445:98]
    node _T_630 = and(_T_629, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_631 = bits(_T_630, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_15 of rvclkhdr_15 @[lib.scala 399:23]
    rvclkhdr_15.clock <= clock
    rvclkhdr_15.reset <= reset
    rvclkhdr_15.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_15.io.en <= _T_631 @[lib.scala 402:17]
    rvclkhdr_15.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_631 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_632 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 445:98]
    node _T_633 = and(_T_632, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_634 = bits(_T_633, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_16 of rvclkhdr_16 @[lib.scala 399:23]
    rvclkhdr_16.clock <= clock
    rvclkhdr_16.reset <= reset
    rvclkhdr_16.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_16.io.en <= _T_634 @[lib.scala 402:17]
    rvclkhdr_16.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_634 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_635 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 445:98]
    node _T_636 = and(_T_635, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_637 = bits(_T_636, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_17 of rvclkhdr_17 @[lib.scala 399:23]
    rvclkhdr_17.clock <= clock
    rvclkhdr_17.reset <= reset
    rvclkhdr_17.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_17.io.en <= _T_637 @[lib.scala 402:17]
    rvclkhdr_17.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_637 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_638 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 445:98]
    node _T_639 = and(_T_638, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_640 = bits(_T_639, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_18 of rvclkhdr_18 @[lib.scala 399:23]
    rvclkhdr_18.clock <= clock
    rvclkhdr_18.reset <= reset
    rvclkhdr_18.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_18.io.en <= _T_640 @[lib.scala 402:17]
    rvclkhdr_18.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_640 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_641 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 445:98]
    node _T_642 = and(_T_641, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_643 = bits(_T_642, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_19 of rvclkhdr_19 @[lib.scala 399:23]
    rvclkhdr_19.clock <= clock
    rvclkhdr_19.reset <= reset
    rvclkhdr_19.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_19.io.en <= _T_643 @[lib.scala 402:17]
    rvclkhdr_19.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_643 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_644 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 445:98]
    node _T_645 = and(_T_644, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_646 = bits(_T_645, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_20 of rvclkhdr_20 @[lib.scala 399:23]
    rvclkhdr_20.clock <= clock
    rvclkhdr_20.reset <= reset
    rvclkhdr_20.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_20.io.en <= _T_646 @[lib.scala 402:17]
    rvclkhdr_20.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_646 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_647 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 445:98]
    node _T_648 = and(_T_647, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_649 = bits(_T_648, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_21 of rvclkhdr_21 @[lib.scala 399:23]
    rvclkhdr_21.clock <= clock
    rvclkhdr_21.reset <= reset
    rvclkhdr_21.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_21.io.en <= _T_649 @[lib.scala 402:17]
    rvclkhdr_21.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_649 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_650 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 445:98]
    node _T_651 = and(_T_650, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_652 = bits(_T_651, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_22 of rvclkhdr_22 @[lib.scala 399:23]
    rvclkhdr_22.clock <= clock
    rvclkhdr_22.reset <= reset
    rvclkhdr_22.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_22.io.en <= _T_652 @[lib.scala 402:17]
    rvclkhdr_22.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_652 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_653 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 445:98]
    node _T_654 = and(_T_653, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_655 = bits(_T_654, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_23 of rvclkhdr_23 @[lib.scala 399:23]
    rvclkhdr_23.clock <= clock
    rvclkhdr_23.reset <= reset
    rvclkhdr_23.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_23.io.en <= _T_655 @[lib.scala 402:17]
    rvclkhdr_23.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_655 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_656 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 445:98]
    node _T_657 = and(_T_656, btb_wr_en_way0) @[ifu_bp_ctl.scala 445:107]
    node _T_658 = bits(_T_657, 0, 0) @[ifu_bp_ctl.scala 445:125]
    inst rvclkhdr_24 of rvclkhdr_24 @[lib.scala 399:23]
    rvclkhdr_24.clock <= clock
    rvclkhdr_24.reset <= reset
    rvclkhdr_24.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_24.io.en <= _T_658 @[lib.scala 402:17]
    rvclkhdr_24.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way0_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_658 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_659 = eq(btb_wr_addr, UInt<1>("h00")) @[ifu_bp_ctl.scala 446:98]
    node _T_660 = and(_T_659, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_661 = bits(_T_660, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_25 of rvclkhdr_25 @[lib.scala 399:23]
    rvclkhdr_25.clock <= clock
    rvclkhdr_25.reset <= reset
    rvclkhdr_25.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_25.io.en <= _T_661 @[lib.scala 402:17]
    rvclkhdr_25.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_661 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_662 = eq(btb_wr_addr, UInt<1>("h01")) @[ifu_bp_ctl.scala 446:98]
    node _T_663 = and(_T_662, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_664 = bits(_T_663, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_26 of rvclkhdr_26 @[lib.scala 399:23]
    rvclkhdr_26.clock <= clock
    rvclkhdr_26.reset <= reset
    rvclkhdr_26.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_26.io.en <= _T_664 @[lib.scala 402:17]
    rvclkhdr_26.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_664 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_665 = eq(btb_wr_addr, UInt<2>("h02")) @[ifu_bp_ctl.scala 446:98]
    node _T_666 = and(_T_665, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_667 = bits(_T_666, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_27 of rvclkhdr_27 @[lib.scala 399:23]
    rvclkhdr_27.clock <= clock
    rvclkhdr_27.reset <= reset
    rvclkhdr_27.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_27.io.en <= _T_667 @[lib.scala 402:17]
    rvclkhdr_27.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_667 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_668 = eq(btb_wr_addr, UInt<2>("h03")) @[ifu_bp_ctl.scala 446:98]
    node _T_669 = and(_T_668, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_670 = bits(_T_669, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_28 of rvclkhdr_28 @[lib.scala 399:23]
    rvclkhdr_28.clock <= clock
    rvclkhdr_28.reset <= reset
    rvclkhdr_28.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_28.io.en <= _T_670 @[lib.scala 402:17]
    rvclkhdr_28.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_3 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_670 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_671 = eq(btb_wr_addr, UInt<3>("h04")) @[ifu_bp_ctl.scala 446:98]
    node _T_672 = and(_T_671, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_673 = bits(_T_672, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_29 of rvclkhdr_29 @[lib.scala 399:23]
    rvclkhdr_29.clock <= clock
    rvclkhdr_29.reset <= reset
    rvclkhdr_29.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_29.io.en <= _T_673 @[lib.scala 402:17]
    rvclkhdr_29.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_4 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_673 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_674 = eq(btb_wr_addr, UInt<3>("h05")) @[ifu_bp_ctl.scala 446:98]
    node _T_675 = and(_T_674, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_676 = bits(_T_675, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_30 of rvclkhdr_30 @[lib.scala 399:23]
    rvclkhdr_30.clock <= clock
    rvclkhdr_30.reset <= reset
    rvclkhdr_30.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_30.io.en <= _T_676 @[lib.scala 402:17]
    rvclkhdr_30.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_676 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_677 = eq(btb_wr_addr, UInt<3>("h06")) @[ifu_bp_ctl.scala 446:98]
    node _T_678 = and(_T_677, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_679 = bits(_T_678, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_31 of rvclkhdr_31 @[lib.scala 399:23]
    rvclkhdr_31.clock <= clock
    rvclkhdr_31.reset <= reset
    rvclkhdr_31.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_31.io.en <= _T_679 @[lib.scala 402:17]
    rvclkhdr_31.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_6 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_679 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_680 = eq(btb_wr_addr, UInt<3>("h07")) @[ifu_bp_ctl.scala 446:98]
    node _T_681 = and(_T_680, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_682 = bits(_T_681, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_32 of rvclkhdr_32 @[lib.scala 399:23]
    rvclkhdr_32.clock <= clock
    rvclkhdr_32.reset <= reset
    rvclkhdr_32.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_32.io.en <= _T_682 @[lib.scala 402:17]
    rvclkhdr_32.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_7 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_682 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_683 = eq(btb_wr_addr, UInt<4>("h08")) @[ifu_bp_ctl.scala 446:98]
    node _T_684 = and(_T_683, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_685 = bits(_T_684, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_33 of rvclkhdr_33 @[lib.scala 399:23]
    rvclkhdr_33.clock <= clock
    rvclkhdr_33.reset <= reset
    rvclkhdr_33.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_33.io.en <= _T_685 @[lib.scala 402:17]
    rvclkhdr_33.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_8 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_685 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_686 = eq(btb_wr_addr, UInt<4>("h09")) @[ifu_bp_ctl.scala 446:98]
    node _T_687 = and(_T_686, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_688 = bits(_T_687, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_34 of rvclkhdr_34 @[lib.scala 399:23]
    rvclkhdr_34.clock <= clock
    rvclkhdr_34.reset <= reset
    rvclkhdr_34.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_34.io.en <= _T_688 @[lib.scala 402:17]
    rvclkhdr_34.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_688 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_689 = eq(btb_wr_addr, UInt<4>("h0a")) @[ifu_bp_ctl.scala 446:98]
    node _T_690 = and(_T_689, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_691 = bits(_T_690, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_35 of rvclkhdr_35 @[lib.scala 399:23]
    rvclkhdr_35.clock <= clock
    rvclkhdr_35.reset <= reset
    rvclkhdr_35.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_35.io.en <= _T_691 @[lib.scala 402:17]
    rvclkhdr_35.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_10 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_691 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_692 = eq(btb_wr_addr, UInt<4>("h0b")) @[ifu_bp_ctl.scala 446:98]
    node _T_693 = and(_T_692, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_694 = bits(_T_693, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_36 of rvclkhdr_36 @[lib.scala 399:23]
    rvclkhdr_36.clock <= clock
    rvclkhdr_36.reset <= reset
    rvclkhdr_36.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_36.io.en <= _T_694 @[lib.scala 402:17]
    rvclkhdr_36.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_11 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_694 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_695 = eq(btb_wr_addr, UInt<4>("h0c")) @[ifu_bp_ctl.scala 446:98]
    node _T_696 = and(_T_695, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_697 = bits(_T_696, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_37 of rvclkhdr_37 @[lib.scala 399:23]
    rvclkhdr_37.clock <= clock
    rvclkhdr_37.reset <= reset
    rvclkhdr_37.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_37.io.en <= _T_697 @[lib.scala 402:17]
    rvclkhdr_37.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_12 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_697 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_698 = eq(btb_wr_addr, UInt<4>("h0d")) @[ifu_bp_ctl.scala 446:98]
    node _T_699 = and(_T_698, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_700 = bits(_T_699, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_38 of rvclkhdr_38 @[lib.scala 399:23]
    rvclkhdr_38.clock <= clock
    rvclkhdr_38.reset <= reset
    rvclkhdr_38.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_38.io.en <= _T_700 @[lib.scala 402:17]
    rvclkhdr_38.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_13 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_700 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_701 = eq(btb_wr_addr, UInt<4>("h0e")) @[ifu_bp_ctl.scala 446:98]
    node _T_702 = and(_T_701, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_703 = bits(_T_702, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_39 of rvclkhdr_39 @[lib.scala 399:23]
    rvclkhdr_39.clock <= clock
    rvclkhdr_39.reset <= reset
    rvclkhdr_39.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_39.io.en <= _T_703 @[lib.scala 402:17]
    rvclkhdr_39.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_14 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_703 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_704 = eq(btb_wr_addr, UInt<4>("h0f")) @[ifu_bp_ctl.scala 446:98]
    node _T_705 = and(_T_704, btb_wr_en_way1) @[ifu_bp_ctl.scala 446:107]
    node _T_706 = bits(_T_705, 0, 0) @[ifu_bp_ctl.scala 446:125]
    inst rvclkhdr_40 of rvclkhdr_40 @[lib.scala 399:23]
    rvclkhdr_40.clock <= clock
    rvclkhdr_40.reset <= reset
    rvclkhdr_40.io.clk <= clock @[lib.scala 401:18]
    rvclkhdr_40.io.en <= _T_706 @[lib.scala 402:17]
    rvclkhdr_40.io.scan_mode <= UInt<1>("h00") @[lib.scala 403:24]
    reg btb_bank0_rd_data_way1_out_15 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_706 : @[Reg.scala 28:19]
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_707 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 448:80]
    node _T_708 = bits(_T_707, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_709 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 448:80]
    node _T_710 = bits(_T_709, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_711 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 448:80]
    node _T_712 = bits(_T_711, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_713 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 448:80]
    node _T_714 = bits(_T_713, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_715 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 448:80]
    node _T_716 = bits(_T_715, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_717 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 448:80]
    node _T_718 = bits(_T_717, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_719 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 448:80]
    node _T_720 = bits(_T_719, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_721 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 448:80]
    node _T_722 = bits(_T_721, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_723 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 448:80]
    node _T_724 = bits(_T_723, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_725 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 448:80]
    node _T_726 = bits(_T_725, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_727 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 448:80]
    node _T_728 = bits(_T_727, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_729 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 448:80]
    node _T_730 = bits(_T_729, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_731 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 448:80]
    node _T_732 = bits(_T_731, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_733 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 448:80]
    node _T_734 = bits(_T_733, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_735 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 448:80]
    node _T_736 = bits(_T_735, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_737 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 448:80]
    node _T_738 = bits(_T_737, 0, 0) @[ifu_bp_ctl.scala 448:89]
    node _T_739 = mux(_T_708, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_740 = mux(_T_710, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_741 = mux(_T_712, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_742 = mux(_T_714, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_743 = mux(_T_716, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_744 = mux(_T_718, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_745 = mux(_T_720, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_746 = mux(_T_722, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_747 = mux(_T_724, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_748 = mux(_T_726, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_749 = mux(_T_728, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_750 = mux(_T_730, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_751 = mux(_T_732, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_752 = mux(_T_734, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_753 = mux(_T_736, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_754 = mux(_T_738, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_755 = or(_T_739, _T_740) @[Mux.scala 27:72]
    node _T_756 = or(_T_755, _T_741) @[Mux.scala 27:72]
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
    wire _T_770 : UInt @[Mux.scala 27:72]
    _T_770 <= _T_769 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_f <= _T_770 @[ifu_bp_ctl.scala 448:28]
    node _T_771 = eq(btb_rd_addr_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 449:80]
    node _T_772 = bits(_T_771, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_773 = eq(btb_rd_addr_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 449:80]
    node _T_774 = bits(_T_773, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_775 = eq(btb_rd_addr_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 449:80]
    node _T_776 = bits(_T_775, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_777 = eq(btb_rd_addr_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 449:80]
    node _T_778 = bits(_T_777, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_779 = eq(btb_rd_addr_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 449:80]
    node _T_780 = bits(_T_779, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_781 = eq(btb_rd_addr_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 449:80]
    node _T_782 = bits(_T_781, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_783 = eq(btb_rd_addr_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 449:80]
    node _T_784 = bits(_T_783, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_785 = eq(btb_rd_addr_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 449:80]
    node _T_786 = bits(_T_785, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_787 = eq(btb_rd_addr_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 449:80]
    node _T_788 = bits(_T_787, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_789 = eq(btb_rd_addr_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 449:80]
    node _T_790 = bits(_T_789, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_791 = eq(btb_rd_addr_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 449:80]
    node _T_792 = bits(_T_791, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_793 = eq(btb_rd_addr_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 449:80]
    node _T_794 = bits(_T_793, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_795 = eq(btb_rd_addr_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 449:80]
    node _T_796 = bits(_T_795, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_797 = eq(btb_rd_addr_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 449:80]
    node _T_798 = bits(_T_797, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_799 = eq(btb_rd_addr_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 449:80]
    node _T_800 = bits(_T_799, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_801 = eq(btb_rd_addr_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 449:80]
    node _T_802 = bits(_T_801, 0, 0) @[ifu_bp_ctl.scala 449:89]
    node _T_803 = mux(_T_772, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_804 = mux(_T_774, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_805 = mux(_T_776, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_806 = mux(_T_778, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_807 = mux(_T_780, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_808 = mux(_T_782, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_809 = mux(_T_784, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_810 = mux(_T_786, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_811 = mux(_T_788, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_812 = mux(_T_790, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_813 = mux(_T_792, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_814 = mux(_T_794, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_815 = mux(_T_796, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_816 = mux(_T_798, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_817 = mux(_T_800, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_818 = mux(_T_802, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_819 = or(_T_803, _T_804) @[Mux.scala 27:72]
    node _T_820 = or(_T_819, _T_805) @[Mux.scala 27:72]
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
    wire _T_834 : UInt @[Mux.scala 27:72]
    _T_834 <= _T_833 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_f <= _T_834 @[ifu_bp_ctl.scala 449:28]
    node _T_835 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 452:86]
    node _T_836 = bits(_T_835, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_837 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 452:86]
    node _T_838 = bits(_T_837, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_839 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 452:86]
    node _T_840 = bits(_T_839, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_841 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 452:86]
    node _T_842 = bits(_T_841, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_843 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 452:86]
    node _T_844 = bits(_T_843, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_845 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 452:86]
    node _T_846 = bits(_T_845, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_847 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 452:86]
    node _T_848 = bits(_T_847, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_849 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 452:86]
    node _T_850 = bits(_T_849, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_851 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 452:86]
    node _T_852 = bits(_T_851, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_853 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 452:86]
    node _T_854 = bits(_T_853, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_855 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 452:86]
    node _T_856 = bits(_T_855, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_857 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 452:86]
    node _T_858 = bits(_T_857, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_859 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 452:86]
    node _T_860 = bits(_T_859, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_861 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 452:86]
    node _T_862 = bits(_T_861, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_863 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 452:86]
    node _T_864 = bits(_T_863, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_865 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 452:86]
    node _T_866 = bits(_T_865, 0, 0) @[ifu_bp_ctl.scala 452:95]
    node _T_867 = mux(_T_836, btb_bank0_rd_data_way0_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_868 = mux(_T_838, btb_bank0_rd_data_way0_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_869 = mux(_T_840, btb_bank0_rd_data_way0_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_870 = mux(_T_842, btb_bank0_rd_data_way0_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_871 = mux(_T_844, btb_bank0_rd_data_way0_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_872 = mux(_T_846, btb_bank0_rd_data_way0_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_873 = mux(_T_848, btb_bank0_rd_data_way0_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_874 = mux(_T_850, btb_bank0_rd_data_way0_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_875 = mux(_T_852, btb_bank0_rd_data_way0_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_876 = mux(_T_854, btb_bank0_rd_data_way0_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_877 = mux(_T_856, btb_bank0_rd_data_way0_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_878 = mux(_T_858, btb_bank0_rd_data_way0_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_879 = mux(_T_860, btb_bank0_rd_data_way0_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_880 = mux(_T_862, btb_bank0_rd_data_way0_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_881 = mux(_T_864, btb_bank0_rd_data_way0_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_882 = mux(_T_866, btb_bank0_rd_data_way0_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_883 = or(_T_867, _T_868) @[Mux.scala 27:72]
    node _T_884 = or(_T_883, _T_869) @[Mux.scala 27:72]
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
    wire _T_898 : UInt @[Mux.scala 27:72]
    _T_898 <= _T_897 @[Mux.scala 27:72]
    btb_bank0_rd_data_way0_p1_f <= _T_898 @[ifu_bp_ctl.scala 452:31]
    node _T_899 = eq(btb_rd_addr_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 453:86]
    node _T_900 = bits(_T_899, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_901 = eq(btb_rd_addr_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 453:86]
    node _T_902 = bits(_T_901, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_903 = eq(btb_rd_addr_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 453:86]
    node _T_904 = bits(_T_903, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_905 = eq(btb_rd_addr_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 453:86]
    node _T_906 = bits(_T_905, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_907 = eq(btb_rd_addr_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 453:86]
    node _T_908 = bits(_T_907, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_909 = eq(btb_rd_addr_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 453:86]
    node _T_910 = bits(_T_909, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_911 = eq(btb_rd_addr_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 453:86]
    node _T_912 = bits(_T_911, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_913 = eq(btb_rd_addr_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 453:86]
    node _T_914 = bits(_T_913, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_915 = eq(btb_rd_addr_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 453:86]
    node _T_916 = bits(_T_915, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_917 = eq(btb_rd_addr_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 453:86]
    node _T_918 = bits(_T_917, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_919 = eq(btb_rd_addr_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 453:86]
    node _T_920 = bits(_T_919, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_921 = eq(btb_rd_addr_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 453:86]
    node _T_922 = bits(_T_921, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_923 = eq(btb_rd_addr_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 453:86]
    node _T_924 = bits(_T_923, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_925 = eq(btb_rd_addr_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 453:86]
    node _T_926 = bits(_T_925, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_927 = eq(btb_rd_addr_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 453:86]
    node _T_928 = bits(_T_927, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_929 = eq(btb_rd_addr_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 453:86]
    node _T_930 = bits(_T_929, 0, 0) @[ifu_bp_ctl.scala 453:95]
    node _T_931 = mux(_T_900, btb_bank0_rd_data_way1_out_0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_932 = mux(_T_902, btb_bank0_rd_data_way1_out_1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_933 = mux(_T_904, btb_bank0_rd_data_way1_out_2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_934 = mux(_T_906, btb_bank0_rd_data_way1_out_3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_935 = mux(_T_908, btb_bank0_rd_data_way1_out_4, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_936 = mux(_T_910, btb_bank0_rd_data_way1_out_5, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_937 = mux(_T_912, btb_bank0_rd_data_way1_out_6, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_938 = mux(_T_914, btb_bank0_rd_data_way1_out_7, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_939 = mux(_T_916, btb_bank0_rd_data_way1_out_8, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_940 = mux(_T_918, btb_bank0_rd_data_way1_out_9, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_941 = mux(_T_920, btb_bank0_rd_data_way1_out_10, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_942 = mux(_T_922, btb_bank0_rd_data_way1_out_11, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_943 = mux(_T_924, btb_bank0_rd_data_way1_out_12, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_944 = mux(_T_926, btb_bank0_rd_data_way1_out_13, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_945 = mux(_T_928, btb_bank0_rd_data_way1_out_14, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_946 = mux(_T_930, btb_bank0_rd_data_way1_out_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_947 = or(_T_931, _T_932) @[Mux.scala 27:72]
    node _T_948 = or(_T_947, _T_933) @[Mux.scala 27:72]
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
    wire _T_962 : UInt @[Mux.scala 27:72]
    _T_962 <= _T_961 @[Mux.scala 27:72]
    btb_bank0_rd_data_way1_p1_f <= _T_962 @[ifu_bp_ctl.scala 453:31]
    wire bht_bank_clken : UInt<1>[1][2] @[ifu_bp_ctl.scala 510:28]
    wire bht_bank_clk : Clock[1][2] @[ifu_bp_ctl.scala 512:26]
    inst rvclkhdr_41 of rvclkhdr_41 @[lib.scala 343:22]
    rvclkhdr_41.clock <= clock
    rvclkhdr_41.reset <= reset
    rvclkhdr_41.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_41.io.en <= bht_bank_clken[0][0] @[lib.scala 345:16]
    rvclkhdr_41.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[0][0] <= rvclkhdr_41.io.l1clk @[ifu_bp_ctl.scala 514:84]
    inst rvclkhdr_42 of rvclkhdr_42 @[lib.scala 343:22]
    rvclkhdr_42.clock <= clock
    rvclkhdr_42.reset <= reset
    rvclkhdr_42.io.clk <= clock @[lib.scala 344:17]
    rvclkhdr_42.io.en <= bht_bank_clken[1][0] @[lib.scala 345:16]
    rvclkhdr_42.io.scan_mode <= UInt<1>("h00") @[lib.scala 346:23]
    bht_bank_clk[1][0] <= rvclkhdr_42.io.l1clk @[ifu_bp_ctl.scala 514:84]
    node _T_963 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 519:40]
    node _T_964 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 519:60]
    node _T_965 = eq(_T_964, UInt<1>("h00")) @[ifu_bp_ctl.scala 519:109]
    node _T_966 = or(_T_965, UInt<1>("h01")) @[ifu_bp_ctl.scala 519:117]
    node _T_967 = and(_T_963, _T_966) @[ifu_bp_ctl.scala 519:44]
    node _T_968 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 520:40]
    node _T_969 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:60]
    node _T_970 = eq(_T_969, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:109]
    node _T_971 = or(_T_970, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:117]
    node _T_972 = and(_T_968, _T_971) @[ifu_bp_ctl.scala 520:44]
    node _T_973 = or(_T_967, _T_972) @[ifu_bp_ctl.scala 519:142]
    bht_bank_clken[0][0] <= _T_973 @[ifu_bp_ctl.scala 519:26]
    node _T_974 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 519:40]
    node _T_975 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 519:60]
    node _T_976 = eq(_T_975, UInt<1>("h00")) @[ifu_bp_ctl.scala 519:109]
    node _T_977 = or(_T_976, UInt<1>("h01")) @[ifu_bp_ctl.scala 519:117]
    node _T_978 = and(_T_974, _T_977) @[ifu_bp_ctl.scala 519:44]
    node _T_979 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 520:40]
    node _T_980 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 520:60]
    node _T_981 = eq(_T_980, UInt<1>("h00")) @[ifu_bp_ctl.scala 520:109]
    node _T_982 = or(_T_981, UInt<1>("h01")) @[ifu_bp_ctl.scala 520:117]
    node _T_983 = and(_T_979, _T_982) @[ifu_bp_ctl.scala 520:44]
    node _T_984 = or(_T_978, _T_983) @[ifu_bp_ctl.scala 519:142]
    bht_bank_clken[1][0] <= _T_984 @[ifu_bp_ctl.scala 519:26]
    node _T_985 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_986 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_987 = eq(_T_986, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:74]
    node _T_988 = and(_T_985, _T_987) @[ifu_bp_ctl.scala 525:23]
    node _T_989 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_990 = eq(_T_989, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_991 = and(_T_988, _T_990) @[ifu_bp_ctl.scala 525:81]
    node _T_992 = or(_T_991, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_993 = bits(_T_992, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_0 = mux(_T_993, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_994 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_995 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_996 = eq(_T_995, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:74]
    node _T_997 = and(_T_994, _T_996) @[ifu_bp_ctl.scala 525:23]
    node _T_998 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_999 = eq(_T_998, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1000 = and(_T_997, _T_999) @[ifu_bp_ctl.scala 525:81]
    node _T_1001 = or(_T_1000, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1002 = bits(_T_1001, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_1 = mux(_T_1002, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1003 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1004 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1005 = eq(_T_1004, UInt<2>("h02")) @[ifu_bp_ctl.scala 525:74]
    node _T_1006 = and(_T_1003, _T_1005) @[ifu_bp_ctl.scala 525:23]
    node _T_1007 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1008 = eq(_T_1007, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1009 = and(_T_1006, _T_1008) @[ifu_bp_ctl.scala 525:81]
    node _T_1010 = or(_T_1009, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1011 = bits(_T_1010, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_2 = mux(_T_1011, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1012 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1013 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1014 = eq(_T_1013, UInt<2>("h03")) @[ifu_bp_ctl.scala 525:74]
    node _T_1015 = and(_T_1012, _T_1014) @[ifu_bp_ctl.scala 525:23]
    node _T_1016 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1017 = eq(_T_1016, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1018 = and(_T_1015, _T_1017) @[ifu_bp_ctl.scala 525:81]
    node _T_1019 = or(_T_1018, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1020 = bits(_T_1019, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_3 = mux(_T_1020, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1021 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1022 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1023 = eq(_T_1022, UInt<3>("h04")) @[ifu_bp_ctl.scala 525:74]
    node _T_1024 = and(_T_1021, _T_1023) @[ifu_bp_ctl.scala 525:23]
    node _T_1025 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1026 = eq(_T_1025, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1027 = and(_T_1024, _T_1026) @[ifu_bp_ctl.scala 525:81]
    node _T_1028 = or(_T_1027, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1029 = bits(_T_1028, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_4 = mux(_T_1029, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1030 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1031 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1032 = eq(_T_1031, UInt<3>("h05")) @[ifu_bp_ctl.scala 525:74]
    node _T_1033 = and(_T_1030, _T_1032) @[ifu_bp_ctl.scala 525:23]
    node _T_1034 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1035 = eq(_T_1034, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1036 = and(_T_1033, _T_1035) @[ifu_bp_ctl.scala 525:81]
    node _T_1037 = or(_T_1036, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1038 = bits(_T_1037, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_5 = mux(_T_1038, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1039 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1040 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1041 = eq(_T_1040, UInt<3>("h06")) @[ifu_bp_ctl.scala 525:74]
    node _T_1042 = and(_T_1039, _T_1041) @[ifu_bp_ctl.scala 525:23]
    node _T_1043 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1044 = eq(_T_1043, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1045 = and(_T_1042, _T_1044) @[ifu_bp_ctl.scala 525:81]
    node _T_1046 = or(_T_1045, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1047 = bits(_T_1046, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_6 = mux(_T_1047, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1048 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1049 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1050 = eq(_T_1049, UInt<3>("h07")) @[ifu_bp_ctl.scala 525:74]
    node _T_1051 = and(_T_1048, _T_1050) @[ifu_bp_ctl.scala 525:23]
    node _T_1052 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1053 = eq(_T_1052, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1054 = and(_T_1051, _T_1053) @[ifu_bp_ctl.scala 525:81]
    node _T_1055 = or(_T_1054, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1056 = bits(_T_1055, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_7 = mux(_T_1056, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1057 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1058 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1059 = eq(_T_1058, UInt<4>("h08")) @[ifu_bp_ctl.scala 525:74]
    node _T_1060 = and(_T_1057, _T_1059) @[ifu_bp_ctl.scala 525:23]
    node _T_1061 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1062 = eq(_T_1061, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1063 = and(_T_1060, _T_1062) @[ifu_bp_ctl.scala 525:81]
    node _T_1064 = or(_T_1063, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1065 = bits(_T_1064, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_8 = mux(_T_1065, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1066 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1067 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1068 = eq(_T_1067, UInt<4>("h09")) @[ifu_bp_ctl.scala 525:74]
    node _T_1069 = and(_T_1066, _T_1068) @[ifu_bp_ctl.scala 525:23]
    node _T_1070 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1071 = eq(_T_1070, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1072 = and(_T_1069, _T_1071) @[ifu_bp_ctl.scala 525:81]
    node _T_1073 = or(_T_1072, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1074 = bits(_T_1073, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_9 = mux(_T_1074, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1075 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1076 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1077 = eq(_T_1076, UInt<4>("h0a")) @[ifu_bp_ctl.scala 525:74]
    node _T_1078 = and(_T_1075, _T_1077) @[ifu_bp_ctl.scala 525:23]
    node _T_1079 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1080 = eq(_T_1079, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1081 = and(_T_1078, _T_1080) @[ifu_bp_ctl.scala 525:81]
    node _T_1082 = or(_T_1081, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1083 = bits(_T_1082, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_10 = mux(_T_1083, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1084 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1085 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1086 = eq(_T_1085, UInt<4>("h0b")) @[ifu_bp_ctl.scala 525:74]
    node _T_1087 = and(_T_1084, _T_1086) @[ifu_bp_ctl.scala 525:23]
    node _T_1088 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1089 = eq(_T_1088, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1090 = and(_T_1087, _T_1089) @[ifu_bp_ctl.scala 525:81]
    node _T_1091 = or(_T_1090, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1092 = bits(_T_1091, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_11 = mux(_T_1092, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1093 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1094 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1095 = eq(_T_1094, UInt<4>("h0c")) @[ifu_bp_ctl.scala 525:74]
    node _T_1096 = and(_T_1093, _T_1095) @[ifu_bp_ctl.scala 525:23]
    node _T_1097 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1098 = eq(_T_1097, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1099 = and(_T_1096, _T_1098) @[ifu_bp_ctl.scala 525:81]
    node _T_1100 = or(_T_1099, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1101 = bits(_T_1100, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_12 = mux(_T_1101, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1102 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1103 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1104 = eq(_T_1103, UInt<4>("h0d")) @[ifu_bp_ctl.scala 525:74]
    node _T_1105 = and(_T_1102, _T_1104) @[ifu_bp_ctl.scala 525:23]
    node _T_1106 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1107 = eq(_T_1106, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1108 = and(_T_1105, _T_1107) @[ifu_bp_ctl.scala 525:81]
    node _T_1109 = or(_T_1108, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1110 = bits(_T_1109, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_13 = mux(_T_1110, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1111 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1112 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1113 = eq(_T_1112, UInt<4>("h0e")) @[ifu_bp_ctl.scala 525:74]
    node _T_1114 = and(_T_1111, _T_1113) @[ifu_bp_ctl.scala 525:23]
    node _T_1115 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1116 = eq(_T_1115, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1117 = and(_T_1114, _T_1116) @[ifu_bp_ctl.scala 525:81]
    node _T_1118 = or(_T_1117, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1119 = bits(_T_1118, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_14 = mux(_T_1119, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1120 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 525:20]
    node _T_1121 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1122 = eq(_T_1121, UInt<4>("h0f")) @[ifu_bp_ctl.scala 525:74]
    node _T_1123 = and(_T_1120, _T_1122) @[ifu_bp_ctl.scala 525:23]
    node _T_1124 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1125 = eq(_T_1124, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1126 = and(_T_1123, _T_1125) @[ifu_bp_ctl.scala 525:81]
    node _T_1127 = or(_T_1126, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1128 = bits(_T_1127, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_0_0_15 = mux(_T_1128, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1129 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1130 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1131 = eq(_T_1130, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:74]
    node _T_1132 = and(_T_1129, _T_1131) @[ifu_bp_ctl.scala 525:23]
    node _T_1133 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1134 = eq(_T_1133, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1135 = and(_T_1132, _T_1134) @[ifu_bp_ctl.scala 525:81]
    node _T_1136 = or(_T_1135, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1137 = bits(_T_1136, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_0 = mux(_T_1137, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1138 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1139 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1140 = eq(_T_1139, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:74]
    node _T_1141 = and(_T_1138, _T_1140) @[ifu_bp_ctl.scala 525:23]
    node _T_1142 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1143 = eq(_T_1142, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1144 = and(_T_1141, _T_1143) @[ifu_bp_ctl.scala 525:81]
    node _T_1145 = or(_T_1144, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1146 = bits(_T_1145, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_1 = mux(_T_1146, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1147 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1148 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1149 = eq(_T_1148, UInt<2>("h02")) @[ifu_bp_ctl.scala 525:74]
    node _T_1150 = and(_T_1147, _T_1149) @[ifu_bp_ctl.scala 525:23]
    node _T_1151 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1152 = eq(_T_1151, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1153 = and(_T_1150, _T_1152) @[ifu_bp_ctl.scala 525:81]
    node _T_1154 = or(_T_1153, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1155 = bits(_T_1154, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_2 = mux(_T_1155, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1156 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1157 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1158 = eq(_T_1157, UInt<2>("h03")) @[ifu_bp_ctl.scala 525:74]
    node _T_1159 = and(_T_1156, _T_1158) @[ifu_bp_ctl.scala 525:23]
    node _T_1160 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1161 = eq(_T_1160, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1162 = and(_T_1159, _T_1161) @[ifu_bp_ctl.scala 525:81]
    node _T_1163 = or(_T_1162, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1164 = bits(_T_1163, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_3 = mux(_T_1164, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1165 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1166 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1167 = eq(_T_1166, UInt<3>("h04")) @[ifu_bp_ctl.scala 525:74]
    node _T_1168 = and(_T_1165, _T_1167) @[ifu_bp_ctl.scala 525:23]
    node _T_1169 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1170 = eq(_T_1169, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1171 = and(_T_1168, _T_1170) @[ifu_bp_ctl.scala 525:81]
    node _T_1172 = or(_T_1171, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1173 = bits(_T_1172, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_4 = mux(_T_1173, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1174 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1175 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1176 = eq(_T_1175, UInt<3>("h05")) @[ifu_bp_ctl.scala 525:74]
    node _T_1177 = and(_T_1174, _T_1176) @[ifu_bp_ctl.scala 525:23]
    node _T_1178 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1179 = eq(_T_1178, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1180 = and(_T_1177, _T_1179) @[ifu_bp_ctl.scala 525:81]
    node _T_1181 = or(_T_1180, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1182 = bits(_T_1181, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_5 = mux(_T_1182, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1183 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1184 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1185 = eq(_T_1184, UInt<3>("h06")) @[ifu_bp_ctl.scala 525:74]
    node _T_1186 = and(_T_1183, _T_1185) @[ifu_bp_ctl.scala 525:23]
    node _T_1187 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1188 = eq(_T_1187, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1189 = and(_T_1186, _T_1188) @[ifu_bp_ctl.scala 525:81]
    node _T_1190 = or(_T_1189, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1191 = bits(_T_1190, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_6 = mux(_T_1191, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1192 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1193 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1194 = eq(_T_1193, UInt<3>("h07")) @[ifu_bp_ctl.scala 525:74]
    node _T_1195 = and(_T_1192, _T_1194) @[ifu_bp_ctl.scala 525:23]
    node _T_1196 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1197 = eq(_T_1196, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1198 = and(_T_1195, _T_1197) @[ifu_bp_ctl.scala 525:81]
    node _T_1199 = or(_T_1198, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1200 = bits(_T_1199, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_7 = mux(_T_1200, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1201 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1202 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1203 = eq(_T_1202, UInt<4>("h08")) @[ifu_bp_ctl.scala 525:74]
    node _T_1204 = and(_T_1201, _T_1203) @[ifu_bp_ctl.scala 525:23]
    node _T_1205 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1206 = eq(_T_1205, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1207 = and(_T_1204, _T_1206) @[ifu_bp_ctl.scala 525:81]
    node _T_1208 = or(_T_1207, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1209 = bits(_T_1208, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_8 = mux(_T_1209, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1210 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1211 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1212 = eq(_T_1211, UInt<4>("h09")) @[ifu_bp_ctl.scala 525:74]
    node _T_1213 = and(_T_1210, _T_1212) @[ifu_bp_ctl.scala 525:23]
    node _T_1214 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1215 = eq(_T_1214, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1216 = and(_T_1213, _T_1215) @[ifu_bp_ctl.scala 525:81]
    node _T_1217 = or(_T_1216, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1218 = bits(_T_1217, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_9 = mux(_T_1218, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1219 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1220 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1221 = eq(_T_1220, UInt<4>("h0a")) @[ifu_bp_ctl.scala 525:74]
    node _T_1222 = and(_T_1219, _T_1221) @[ifu_bp_ctl.scala 525:23]
    node _T_1223 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1224 = eq(_T_1223, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1225 = and(_T_1222, _T_1224) @[ifu_bp_ctl.scala 525:81]
    node _T_1226 = or(_T_1225, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1227 = bits(_T_1226, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_10 = mux(_T_1227, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1228 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1229 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1230 = eq(_T_1229, UInt<4>("h0b")) @[ifu_bp_ctl.scala 525:74]
    node _T_1231 = and(_T_1228, _T_1230) @[ifu_bp_ctl.scala 525:23]
    node _T_1232 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1233 = eq(_T_1232, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1234 = and(_T_1231, _T_1233) @[ifu_bp_ctl.scala 525:81]
    node _T_1235 = or(_T_1234, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1236 = bits(_T_1235, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_11 = mux(_T_1236, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1237 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1238 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1239 = eq(_T_1238, UInt<4>("h0c")) @[ifu_bp_ctl.scala 525:74]
    node _T_1240 = and(_T_1237, _T_1239) @[ifu_bp_ctl.scala 525:23]
    node _T_1241 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1242 = eq(_T_1241, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1243 = and(_T_1240, _T_1242) @[ifu_bp_ctl.scala 525:81]
    node _T_1244 = or(_T_1243, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1245 = bits(_T_1244, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_12 = mux(_T_1245, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1246 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1247 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1248 = eq(_T_1247, UInt<4>("h0d")) @[ifu_bp_ctl.scala 525:74]
    node _T_1249 = and(_T_1246, _T_1248) @[ifu_bp_ctl.scala 525:23]
    node _T_1250 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1251 = eq(_T_1250, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1252 = and(_T_1249, _T_1251) @[ifu_bp_ctl.scala 525:81]
    node _T_1253 = or(_T_1252, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1254 = bits(_T_1253, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_13 = mux(_T_1254, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1255 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1256 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1257 = eq(_T_1256, UInt<4>("h0e")) @[ifu_bp_ctl.scala 525:74]
    node _T_1258 = and(_T_1255, _T_1257) @[ifu_bp_ctl.scala 525:23]
    node _T_1259 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1260 = eq(_T_1259, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1261 = and(_T_1258, _T_1260) @[ifu_bp_ctl.scala 525:81]
    node _T_1262 = or(_T_1261, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1263 = bits(_T_1262, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_14 = mux(_T_1263, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    node _T_1264 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 525:20]
    node _T_1265 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:37]
    node _T_1266 = eq(_T_1265, UInt<4>("h0f")) @[ifu_bp_ctl.scala 525:74]
    node _T_1267 = and(_T_1264, _T_1266) @[ifu_bp_ctl.scala 525:23]
    node _T_1268 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 525:95]
    node _T_1269 = eq(_T_1268, UInt<1>("h00")) @[ifu_bp_ctl.scala 525:154]
    node _T_1270 = and(_T_1267, _T_1269) @[ifu_bp_ctl.scala 525:81]
    node _T_1271 = or(_T_1270, UInt<1>("h01")) @[ifu_bp_ctl.scala 525:161]
    node _T_1272 = bits(_T_1271, 0, 0) @[ifu_bp_ctl.scala 525:183]
    node bht_bank_wr_data_1_0_15 = mux(_T_1272, io.dec_bp.dec_tlu_br0_r_pkt.bits.hist, io.exu_bp.exu_mp_pkt.bits.hist) @[ifu_bp_ctl.scala 525:8]
    wire bht_bank_sel : UInt<1>[16][1][2] @[ifu_bp_ctl.scala 527:26]
    node _T_1273 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1274 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1275 = eq(_T_1274, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:97]
    node _T_1276 = and(_T_1273, _T_1275) @[ifu_bp_ctl.scala 533:45]
    node _T_1277 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1278 = eq(_T_1277, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1279 = or(_T_1278, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1280 = and(_T_1276, _T_1279) @[ifu_bp_ctl.scala 533:110]
    node _T_1281 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1282 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1283 = eq(_T_1282, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:74]
    node _T_1284 = and(_T_1281, _T_1283) @[ifu_bp_ctl.scala 534:22]
    node _T_1285 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1286 = eq(_T_1285, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1287 = or(_T_1286, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1288 = and(_T_1284, _T_1287) @[ifu_bp_ctl.scala 534:87]
    node _T_1289 = or(_T_1280, _T_1288) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][0] <= _T_1289 @[ifu_bp_ctl.scala 533:27]
    node _T_1290 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1291 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1292 = eq(_T_1291, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:97]
    node _T_1293 = and(_T_1290, _T_1292) @[ifu_bp_ctl.scala 533:45]
    node _T_1294 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1295 = eq(_T_1294, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1296 = or(_T_1295, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1297 = and(_T_1293, _T_1296) @[ifu_bp_ctl.scala 533:110]
    node _T_1298 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1299 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1300 = eq(_T_1299, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:74]
    node _T_1301 = and(_T_1298, _T_1300) @[ifu_bp_ctl.scala 534:22]
    node _T_1302 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1303 = eq(_T_1302, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1304 = or(_T_1303, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1305 = and(_T_1301, _T_1304) @[ifu_bp_ctl.scala 534:87]
    node _T_1306 = or(_T_1297, _T_1305) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][1] <= _T_1306 @[ifu_bp_ctl.scala 533:27]
    node _T_1307 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1308 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1309 = eq(_T_1308, UInt<2>("h02")) @[ifu_bp_ctl.scala 533:97]
    node _T_1310 = and(_T_1307, _T_1309) @[ifu_bp_ctl.scala 533:45]
    node _T_1311 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1312 = eq(_T_1311, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1313 = or(_T_1312, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1314 = and(_T_1310, _T_1313) @[ifu_bp_ctl.scala 533:110]
    node _T_1315 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1316 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1317 = eq(_T_1316, UInt<2>("h02")) @[ifu_bp_ctl.scala 534:74]
    node _T_1318 = and(_T_1315, _T_1317) @[ifu_bp_ctl.scala 534:22]
    node _T_1319 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1320 = eq(_T_1319, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1321 = or(_T_1320, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1322 = and(_T_1318, _T_1321) @[ifu_bp_ctl.scala 534:87]
    node _T_1323 = or(_T_1314, _T_1322) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][2] <= _T_1323 @[ifu_bp_ctl.scala 533:27]
    node _T_1324 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1325 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1326 = eq(_T_1325, UInt<2>("h03")) @[ifu_bp_ctl.scala 533:97]
    node _T_1327 = and(_T_1324, _T_1326) @[ifu_bp_ctl.scala 533:45]
    node _T_1328 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1329 = eq(_T_1328, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1330 = or(_T_1329, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1331 = and(_T_1327, _T_1330) @[ifu_bp_ctl.scala 533:110]
    node _T_1332 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1333 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1334 = eq(_T_1333, UInt<2>("h03")) @[ifu_bp_ctl.scala 534:74]
    node _T_1335 = and(_T_1332, _T_1334) @[ifu_bp_ctl.scala 534:22]
    node _T_1336 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1337 = eq(_T_1336, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1338 = or(_T_1337, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1339 = and(_T_1335, _T_1338) @[ifu_bp_ctl.scala 534:87]
    node _T_1340 = or(_T_1331, _T_1339) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][3] <= _T_1340 @[ifu_bp_ctl.scala 533:27]
    node _T_1341 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1342 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1343 = eq(_T_1342, UInt<3>("h04")) @[ifu_bp_ctl.scala 533:97]
    node _T_1344 = and(_T_1341, _T_1343) @[ifu_bp_ctl.scala 533:45]
    node _T_1345 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1346 = eq(_T_1345, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1347 = or(_T_1346, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1348 = and(_T_1344, _T_1347) @[ifu_bp_ctl.scala 533:110]
    node _T_1349 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1350 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1351 = eq(_T_1350, UInt<3>("h04")) @[ifu_bp_ctl.scala 534:74]
    node _T_1352 = and(_T_1349, _T_1351) @[ifu_bp_ctl.scala 534:22]
    node _T_1353 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1354 = eq(_T_1353, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1355 = or(_T_1354, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1356 = and(_T_1352, _T_1355) @[ifu_bp_ctl.scala 534:87]
    node _T_1357 = or(_T_1348, _T_1356) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][4] <= _T_1357 @[ifu_bp_ctl.scala 533:27]
    node _T_1358 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1359 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1360 = eq(_T_1359, UInt<3>("h05")) @[ifu_bp_ctl.scala 533:97]
    node _T_1361 = and(_T_1358, _T_1360) @[ifu_bp_ctl.scala 533:45]
    node _T_1362 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1363 = eq(_T_1362, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1364 = or(_T_1363, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1365 = and(_T_1361, _T_1364) @[ifu_bp_ctl.scala 533:110]
    node _T_1366 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1367 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1368 = eq(_T_1367, UInt<3>("h05")) @[ifu_bp_ctl.scala 534:74]
    node _T_1369 = and(_T_1366, _T_1368) @[ifu_bp_ctl.scala 534:22]
    node _T_1370 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1371 = eq(_T_1370, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1372 = or(_T_1371, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1373 = and(_T_1369, _T_1372) @[ifu_bp_ctl.scala 534:87]
    node _T_1374 = or(_T_1365, _T_1373) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][5] <= _T_1374 @[ifu_bp_ctl.scala 533:27]
    node _T_1375 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1376 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1377 = eq(_T_1376, UInt<3>("h06")) @[ifu_bp_ctl.scala 533:97]
    node _T_1378 = and(_T_1375, _T_1377) @[ifu_bp_ctl.scala 533:45]
    node _T_1379 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1380 = eq(_T_1379, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1381 = or(_T_1380, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1382 = and(_T_1378, _T_1381) @[ifu_bp_ctl.scala 533:110]
    node _T_1383 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1384 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1385 = eq(_T_1384, UInt<3>("h06")) @[ifu_bp_ctl.scala 534:74]
    node _T_1386 = and(_T_1383, _T_1385) @[ifu_bp_ctl.scala 534:22]
    node _T_1387 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1388 = eq(_T_1387, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1389 = or(_T_1388, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1390 = and(_T_1386, _T_1389) @[ifu_bp_ctl.scala 534:87]
    node _T_1391 = or(_T_1382, _T_1390) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][6] <= _T_1391 @[ifu_bp_ctl.scala 533:27]
    node _T_1392 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1393 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1394 = eq(_T_1393, UInt<3>("h07")) @[ifu_bp_ctl.scala 533:97]
    node _T_1395 = and(_T_1392, _T_1394) @[ifu_bp_ctl.scala 533:45]
    node _T_1396 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1397 = eq(_T_1396, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1398 = or(_T_1397, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1399 = and(_T_1395, _T_1398) @[ifu_bp_ctl.scala 533:110]
    node _T_1400 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1401 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1402 = eq(_T_1401, UInt<3>("h07")) @[ifu_bp_ctl.scala 534:74]
    node _T_1403 = and(_T_1400, _T_1402) @[ifu_bp_ctl.scala 534:22]
    node _T_1404 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1405 = eq(_T_1404, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1406 = or(_T_1405, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1407 = and(_T_1403, _T_1406) @[ifu_bp_ctl.scala 534:87]
    node _T_1408 = or(_T_1399, _T_1407) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][7] <= _T_1408 @[ifu_bp_ctl.scala 533:27]
    node _T_1409 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1410 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1411 = eq(_T_1410, UInt<4>("h08")) @[ifu_bp_ctl.scala 533:97]
    node _T_1412 = and(_T_1409, _T_1411) @[ifu_bp_ctl.scala 533:45]
    node _T_1413 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1414 = eq(_T_1413, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1415 = or(_T_1414, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1416 = and(_T_1412, _T_1415) @[ifu_bp_ctl.scala 533:110]
    node _T_1417 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1418 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1419 = eq(_T_1418, UInt<4>("h08")) @[ifu_bp_ctl.scala 534:74]
    node _T_1420 = and(_T_1417, _T_1419) @[ifu_bp_ctl.scala 534:22]
    node _T_1421 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1422 = eq(_T_1421, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1423 = or(_T_1422, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1424 = and(_T_1420, _T_1423) @[ifu_bp_ctl.scala 534:87]
    node _T_1425 = or(_T_1416, _T_1424) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][8] <= _T_1425 @[ifu_bp_ctl.scala 533:27]
    node _T_1426 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1427 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1428 = eq(_T_1427, UInt<4>("h09")) @[ifu_bp_ctl.scala 533:97]
    node _T_1429 = and(_T_1426, _T_1428) @[ifu_bp_ctl.scala 533:45]
    node _T_1430 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1431 = eq(_T_1430, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1432 = or(_T_1431, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1433 = and(_T_1429, _T_1432) @[ifu_bp_ctl.scala 533:110]
    node _T_1434 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1435 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1436 = eq(_T_1435, UInt<4>("h09")) @[ifu_bp_ctl.scala 534:74]
    node _T_1437 = and(_T_1434, _T_1436) @[ifu_bp_ctl.scala 534:22]
    node _T_1438 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1439 = eq(_T_1438, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1440 = or(_T_1439, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1441 = and(_T_1437, _T_1440) @[ifu_bp_ctl.scala 534:87]
    node _T_1442 = or(_T_1433, _T_1441) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][9] <= _T_1442 @[ifu_bp_ctl.scala 533:27]
    node _T_1443 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1444 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1445 = eq(_T_1444, UInt<4>("h0a")) @[ifu_bp_ctl.scala 533:97]
    node _T_1446 = and(_T_1443, _T_1445) @[ifu_bp_ctl.scala 533:45]
    node _T_1447 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1448 = eq(_T_1447, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1449 = or(_T_1448, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1450 = and(_T_1446, _T_1449) @[ifu_bp_ctl.scala 533:110]
    node _T_1451 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1452 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1453 = eq(_T_1452, UInt<4>("h0a")) @[ifu_bp_ctl.scala 534:74]
    node _T_1454 = and(_T_1451, _T_1453) @[ifu_bp_ctl.scala 534:22]
    node _T_1455 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1456 = eq(_T_1455, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1457 = or(_T_1456, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1458 = and(_T_1454, _T_1457) @[ifu_bp_ctl.scala 534:87]
    node _T_1459 = or(_T_1450, _T_1458) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][10] <= _T_1459 @[ifu_bp_ctl.scala 533:27]
    node _T_1460 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1461 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1462 = eq(_T_1461, UInt<4>("h0b")) @[ifu_bp_ctl.scala 533:97]
    node _T_1463 = and(_T_1460, _T_1462) @[ifu_bp_ctl.scala 533:45]
    node _T_1464 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1465 = eq(_T_1464, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1466 = or(_T_1465, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1467 = and(_T_1463, _T_1466) @[ifu_bp_ctl.scala 533:110]
    node _T_1468 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1469 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1470 = eq(_T_1469, UInt<4>("h0b")) @[ifu_bp_ctl.scala 534:74]
    node _T_1471 = and(_T_1468, _T_1470) @[ifu_bp_ctl.scala 534:22]
    node _T_1472 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1473 = eq(_T_1472, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1474 = or(_T_1473, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1475 = and(_T_1471, _T_1474) @[ifu_bp_ctl.scala 534:87]
    node _T_1476 = or(_T_1467, _T_1475) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][11] <= _T_1476 @[ifu_bp_ctl.scala 533:27]
    node _T_1477 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1478 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1479 = eq(_T_1478, UInt<4>("h0c")) @[ifu_bp_ctl.scala 533:97]
    node _T_1480 = and(_T_1477, _T_1479) @[ifu_bp_ctl.scala 533:45]
    node _T_1481 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1482 = eq(_T_1481, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1483 = or(_T_1482, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1484 = and(_T_1480, _T_1483) @[ifu_bp_ctl.scala 533:110]
    node _T_1485 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1486 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1487 = eq(_T_1486, UInt<4>("h0c")) @[ifu_bp_ctl.scala 534:74]
    node _T_1488 = and(_T_1485, _T_1487) @[ifu_bp_ctl.scala 534:22]
    node _T_1489 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1490 = eq(_T_1489, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1491 = or(_T_1490, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1492 = and(_T_1488, _T_1491) @[ifu_bp_ctl.scala 534:87]
    node _T_1493 = or(_T_1484, _T_1492) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][12] <= _T_1493 @[ifu_bp_ctl.scala 533:27]
    node _T_1494 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1495 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1496 = eq(_T_1495, UInt<4>("h0d")) @[ifu_bp_ctl.scala 533:97]
    node _T_1497 = and(_T_1494, _T_1496) @[ifu_bp_ctl.scala 533:45]
    node _T_1498 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1499 = eq(_T_1498, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1500 = or(_T_1499, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1501 = and(_T_1497, _T_1500) @[ifu_bp_ctl.scala 533:110]
    node _T_1502 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1503 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1504 = eq(_T_1503, UInt<4>("h0d")) @[ifu_bp_ctl.scala 534:74]
    node _T_1505 = and(_T_1502, _T_1504) @[ifu_bp_ctl.scala 534:22]
    node _T_1506 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1507 = eq(_T_1506, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1508 = or(_T_1507, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1509 = and(_T_1505, _T_1508) @[ifu_bp_ctl.scala 534:87]
    node _T_1510 = or(_T_1501, _T_1509) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][13] <= _T_1510 @[ifu_bp_ctl.scala 533:27]
    node _T_1511 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1512 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1513 = eq(_T_1512, UInt<4>("h0e")) @[ifu_bp_ctl.scala 533:97]
    node _T_1514 = and(_T_1511, _T_1513) @[ifu_bp_ctl.scala 533:45]
    node _T_1515 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1516 = eq(_T_1515, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1517 = or(_T_1516, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1518 = and(_T_1514, _T_1517) @[ifu_bp_ctl.scala 533:110]
    node _T_1519 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1520 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1521 = eq(_T_1520, UInt<4>("h0e")) @[ifu_bp_ctl.scala 534:74]
    node _T_1522 = and(_T_1519, _T_1521) @[ifu_bp_ctl.scala 534:22]
    node _T_1523 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1524 = eq(_T_1523, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1525 = or(_T_1524, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1526 = and(_T_1522, _T_1525) @[ifu_bp_ctl.scala 534:87]
    node _T_1527 = or(_T_1518, _T_1526) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][14] <= _T_1527 @[ifu_bp_ctl.scala 533:27]
    node _T_1528 = bits(bht_wr_en0, 0, 0) @[ifu_bp_ctl.scala 533:41]
    node _T_1529 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1530 = eq(_T_1529, UInt<4>("h0f")) @[ifu_bp_ctl.scala 533:97]
    node _T_1531 = and(_T_1528, _T_1530) @[ifu_bp_ctl.scala 533:45]
    node _T_1532 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1533 = eq(_T_1532, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1534 = or(_T_1533, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1535 = and(_T_1531, _T_1534) @[ifu_bp_ctl.scala 533:110]
    node _T_1536 = bits(bht_wr_en2, 0, 0) @[ifu_bp_ctl.scala 534:18]
    node _T_1537 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1538 = eq(_T_1537, UInt<4>("h0f")) @[ifu_bp_ctl.scala 534:74]
    node _T_1539 = and(_T_1536, _T_1538) @[ifu_bp_ctl.scala 534:22]
    node _T_1540 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1541 = eq(_T_1540, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1542 = or(_T_1541, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1543 = and(_T_1539, _T_1542) @[ifu_bp_ctl.scala 534:87]
    node _T_1544 = or(_T_1535, _T_1543) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[0][0][15] <= _T_1544 @[ifu_bp_ctl.scala 533:27]
    node _T_1545 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1546 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1547 = eq(_T_1546, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:97]
    node _T_1548 = and(_T_1545, _T_1547) @[ifu_bp_ctl.scala 533:45]
    node _T_1549 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1550 = eq(_T_1549, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1551 = or(_T_1550, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1552 = and(_T_1548, _T_1551) @[ifu_bp_ctl.scala 533:110]
    node _T_1553 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1554 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1555 = eq(_T_1554, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:74]
    node _T_1556 = and(_T_1553, _T_1555) @[ifu_bp_ctl.scala 534:22]
    node _T_1557 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1558 = eq(_T_1557, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1559 = or(_T_1558, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1560 = and(_T_1556, _T_1559) @[ifu_bp_ctl.scala 534:87]
    node _T_1561 = or(_T_1552, _T_1560) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][0] <= _T_1561 @[ifu_bp_ctl.scala 533:27]
    node _T_1562 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1563 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1564 = eq(_T_1563, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:97]
    node _T_1565 = and(_T_1562, _T_1564) @[ifu_bp_ctl.scala 533:45]
    node _T_1566 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1567 = eq(_T_1566, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1568 = or(_T_1567, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1569 = and(_T_1565, _T_1568) @[ifu_bp_ctl.scala 533:110]
    node _T_1570 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1571 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1572 = eq(_T_1571, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:74]
    node _T_1573 = and(_T_1570, _T_1572) @[ifu_bp_ctl.scala 534:22]
    node _T_1574 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1575 = eq(_T_1574, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1576 = or(_T_1575, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1577 = and(_T_1573, _T_1576) @[ifu_bp_ctl.scala 534:87]
    node _T_1578 = or(_T_1569, _T_1577) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][1] <= _T_1578 @[ifu_bp_ctl.scala 533:27]
    node _T_1579 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1580 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1581 = eq(_T_1580, UInt<2>("h02")) @[ifu_bp_ctl.scala 533:97]
    node _T_1582 = and(_T_1579, _T_1581) @[ifu_bp_ctl.scala 533:45]
    node _T_1583 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1584 = eq(_T_1583, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1585 = or(_T_1584, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1586 = and(_T_1582, _T_1585) @[ifu_bp_ctl.scala 533:110]
    node _T_1587 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1588 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1589 = eq(_T_1588, UInt<2>("h02")) @[ifu_bp_ctl.scala 534:74]
    node _T_1590 = and(_T_1587, _T_1589) @[ifu_bp_ctl.scala 534:22]
    node _T_1591 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1592 = eq(_T_1591, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1593 = or(_T_1592, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1594 = and(_T_1590, _T_1593) @[ifu_bp_ctl.scala 534:87]
    node _T_1595 = or(_T_1586, _T_1594) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][2] <= _T_1595 @[ifu_bp_ctl.scala 533:27]
    node _T_1596 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1597 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1598 = eq(_T_1597, UInt<2>("h03")) @[ifu_bp_ctl.scala 533:97]
    node _T_1599 = and(_T_1596, _T_1598) @[ifu_bp_ctl.scala 533:45]
    node _T_1600 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1601 = eq(_T_1600, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1602 = or(_T_1601, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1603 = and(_T_1599, _T_1602) @[ifu_bp_ctl.scala 533:110]
    node _T_1604 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1605 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1606 = eq(_T_1605, UInt<2>("h03")) @[ifu_bp_ctl.scala 534:74]
    node _T_1607 = and(_T_1604, _T_1606) @[ifu_bp_ctl.scala 534:22]
    node _T_1608 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1609 = eq(_T_1608, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1610 = or(_T_1609, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1611 = and(_T_1607, _T_1610) @[ifu_bp_ctl.scala 534:87]
    node _T_1612 = or(_T_1603, _T_1611) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][3] <= _T_1612 @[ifu_bp_ctl.scala 533:27]
    node _T_1613 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1614 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1615 = eq(_T_1614, UInt<3>("h04")) @[ifu_bp_ctl.scala 533:97]
    node _T_1616 = and(_T_1613, _T_1615) @[ifu_bp_ctl.scala 533:45]
    node _T_1617 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1618 = eq(_T_1617, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1619 = or(_T_1618, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1620 = and(_T_1616, _T_1619) @[ifu_bp_ctl.scala 533:110]
    node _T_1621 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1622 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1623 = eq(_T_1622, UInt<3>("h04")) @[ifu_bp_ctl.scala 534:74]
    node _T_1624 = and(_T_1621, _T_1623) @[ifu_bp_ctl.scala 534:22]
    node _T_1625 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1626 = eq(_T_1625, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1627 = or(_T_1626, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1628 = and(_T_1624, _T_1627) @[ifu_bp_ctl.scala 534:87]
    node _T_1629 = or(_T_1620, _T_1628) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][4] <= _T_1629 @[ifu_bp_ctl.scala 533:27]
    node _T_1630 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1631 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1632 = eq(_T_1631, UInt<3>("h05")) @[ifu_bp_ctl.scala 533:97]
    node _T_1633 = and(_T_1630, _T_1632) @[ifu_bp_ctl.scala 533:45]
    node _T_1634 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1635 = eq(_T_1634, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1636 = or(_T_1635, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1637 = and(_T_1633, _T_1636) @[ifu_bp_ctl.scala 533:110]
    node _T_1638 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1639 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1640 = eq(_T_1639, UInt<3>("h05")) @[ifu_bp_ctl.scala 534:74]
    node _T_1641 = and(_T_1638, _T_1640) @[ifu_bp_ctl.scala 534:22]
    node _T_1642 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1643 = eq(_T_1642, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1644 = or(_T_1643, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1645 = and(_T_1641, _T_1644) @[ifu_bp_ctl.scala 534:87]
    node _T_1646 = or(_T_1637, _T_1645) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][5] <= _T_1646 @[ifu_bp_ctl.scala 533:27]
    node _T_1647 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1648 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1649 = eq(_T_1648, UInt<3>("h06")) @[ifu_bp_ctl.scala 533:97]
    node _T_1650 = and(_T_1647, _T_1649) @[ifu_bp_ctl.scala 533:45]
    node _T_1651 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1652 = eq(_T_1651, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1653 = or(_T_1652, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1654 = and(_T_1650, _T_1653) @[ifu_bp_ctl.scala 533:110]
    node _T_1655 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1656 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1657 = eq(_T_1656, UInt<3>("h06")) @[ifu_bp_ctl.scala 534:74]
    node _T_1658 = and(_T_1655, _T_1657) @[ifu_bp_ctl.scala 534:22]
    node _T_1659 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1660 = eq(_T_1659, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1661 = or(_T_1660, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1662 = and(_T_1658, _T_1661) @[ifu_bp_ctl.scala 534:87]
    node _T_1663 = or(_T_1654, _T_1662) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][6] <= _T_1663 @[ifu_bp_ctl.scala 533:27]
    node _T_1664 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1665 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1666 = eq(_T_1665, UInt<3>("h07")) @[ifu_bp_ctl.scala 533:97]
    node _T_1667 = and(_T_1664, _T_1666) @[ifu_bp_ctl.scala 533:45]
    node _T_1668 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1669 = eq(_T_1668, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1670 = or(_T_1669, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1671 = and(_T_1667, _T_1670) @[ifu_bp_ctl.scala 533:110]
    node _T_1672 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1673 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1674 = eq(_T_1673, UInt<3>("h07")) @[ifu_bp_ctl.scala 534:74]
    node _T_1675 = and(_T_1672, _T_1674) @[ifu_bp_ctl.scala 534:22]
    node _T_1676 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1677 = eq(_T_1676, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1678 = or(_T_1677, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1679 = and(_T_1675, _T_1678) @[ifu_bp_ctl.scala 534:87]
    node _T_1680 = or(_T_1671, _T_1679) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][7] <= _T_1680 @[ifu_bp_ctl.scala 533:27]
    node _T_1681 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1682 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1683 = eq(_T_1682, UInt<4>("h08")) @[ifu_bp_ctl.scala 533:97]
    node _T_1684 = and(_T_1681, _T_1683) @[ifu_bp_ctl.scala 533:45]
    node _T_1685 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1686 = eq(_T_1685, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1687 = or(_T_1686, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1688 = and(_T_1684, _T_1687) @[ifu_bp_ctl.scala 533:110]
    node _T_1689 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1690 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1691 = eq(_T_1690, UInt<4>("h08")) @[ifu_bp_ctl.scala 534:74]
    node _T_1692 = and(_T_1689, _T_1691) @[ifu_bp_ctl.scala 534:22]
    node _T_1693 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1694 = eq(_T_1693, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1695 = or(_T_1694, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1696 = and(_T_1692, _T_1695) @[ifu_bp_ctl.scala 534:87]
    node _T_1697 = or(_T_1688, _T_1696) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][8] <= _T_1697 @[ifu_bp_ctl.scala 533:27]
    node _T_1698 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1699 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1700 = eq(_T_1699, UInt<4>("h09")) @[ifu_bp_ctl.scala 533:97]
    node _T_1701 = and(_T_1698, _T_1700) @[ifu_bp_ctl.scala 533:45]
    node _T_1702 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1703 = eq(_T_1702, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1704 = or(_T_1703, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1705 = and(_T_1701, _T_1704) @[ifu_bp_ctl.scala 533:110]
    node _T_1706 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1707 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1708 = eq(_T_1707, UInt<4>("h09")) @[ifu_bp_ctl.scala 534:74]
    node _T_1709 = and(_T_1706, _T_1708) @[ifu_bp_ctl.scala 534:22]
    node _T_1710 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1711 = eq(_T_1710, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1712 = or(_T_1711, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1713 = and(_T_1709, _T_1712) @[ifu_bp_ctl.scala 534:87]
    node _T_1714 = or(_T_1705, _T_1713) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][9] <= _T_1714 @[ifu_bp_ctl.scala 533:27]
    node _T_1715 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1716 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1717 = eq(_T_1716, UInt<4>("h0a")) @[ifu_bp_ctl.scala 533:97]
    node _T_1718 = and(_T_1715, _T_1717) @[ifu_bp_ctl.scala 533:45]
    node _T_1719 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1720 = eq(_T_1719, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1721 = or(_T_1720, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1722 = and(_T_1718, _T_1721) @[ifu_bp_ctl.scala 533:110]
    node _T_1723 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1724 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1725 = eq(_T_1724, UInt<4>("h0a")) @[ifu_bp_ctl.scala 534:74]
    node _T_1726 = and(_T_1723, _T_1725) @[ifu_bp_ctl.scala 534:22]
    node _T_1727 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1728 = eq(_T_1727, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1729 = or(_T_1728, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1730 = and(_T_1726, _T_1729) @[ifu_bp_ctl.scala 534:87]
    node _T_1731 = or(_T_1722, _T_1730) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][10] <= _T_1731 @[ifu_bp_ctl.scala 533:27]
    node _T_1732 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1733 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1734 = eq(_T_1733, UInt<4>("h0b")) @[ifu_bp_ctl.scala 533:97]
    node _T_1735 = and(_T_1732, _T_1734) @[ifu_bp_ctl.scala 533:45]
    node _T_1736 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1737 = eq(_T_1736, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1738 = or(_T_1737, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1739 = and(_T_1735, _T_1738) @[ifu_bp_ctl.scala 533:110]
    node _T_1740 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1741 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1742 = eq(_T_1741, UInt<4>("h0b")) @[ifu_bp_ctl.scala 534:74]
    node _T_1743 = and(_T_1740, _T_1742) @[ifu_bp_ctl.scala 534:22]
    node _T_1744 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1745 = eq(_T_1744, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1746 = or(_T_1745, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1747 = and(_T_1743, _T_1746) @[ifu_bp_ctl.scala 534:87]
    node _T_1748 = or(_T_1739, _T_1747) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][11] <= _T_1748 @[ifu_bp_ctl.scala 533:27]
    node _T_1749 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1750 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1751 = eq(_T_1750, UInt<4>("h0c")) @[ifu_bp_ctl.scala 533:97]
    node _T_1752 = and(_T_1749, _T_1751) @[ifu_bp_ctl.scala 533:45]
    node _T_1753 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1754 = eq(_T_1753, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1755 = or(_T_1754, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1756 = and(_T_1752, _T_1755) @[ifu_bp_ctl.scala 533:110]
    node _T_1757 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1758 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1759 = eq(_T_1758, UInt<4>("h0c")) @[ifu_bp_ctl.scala 534:74]
    node _T_1760 = and(_T_1757, _T_1759) @[ifu_bp_ctl.scala 534:22]
    node _T_1761 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1762 = eq(_T_1761, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1763 = or(_T_1762, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1764 = and(_T_1760, _T_1763) @[ifu_bp_ctl.scala 534:87]
    node _T_1765 = or(_T_1756, _T_1764) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][12] <= _T_1765 @[ifu_bp_ctl.scala 533:27]
    node _T_1766 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1767 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1768 = eq(_T_1767, UInt<4>("h0d")) @[ifu_bp_ctl.scala 533:97]
    node _T_1769 = and(_T_1766, _T_1768) @[ifu_bp_ctl.scala 533:45]
    node _T_1770 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1771 = eq(_T_1770, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1772 = or(_T_1771, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1773 = and(_T_1769, _T_1772) @[ifu_bp_ctl.scala 533:110]
    node _T_1774 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1775 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1776 = eq(_T_1775, UInt<4>("h0d")) @[ifu_bp_ctl.scala 534:74]
    node _T_1777 = and(_T_1774, _T_1776) @[ifu_bp_ctl.scala 534:22]
    node _T_1778 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1779 = eq(_T_1778, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1780 = or(_T_1779, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1781 = and(_T_1777, _T_1780) @[ifu_bp_ctl.scala 534:87]
    node _T_1782 = or(_T_1773, _T_1781) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][13] <= _T_1782 @[ifu_bp_ctl.scala 533:27]
    node _T_1783 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1784 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1785 = eq(_T_1784, UInt<4>("h0e")) @[ifu_bp_ctl.scala 533:97]
    node _T_1786 = and(_T_1783, _T_1785) @[ifu_bp_ctl.scala 533:45]
    node _T_1787 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1788 = eq(_T_1787, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1789 = or(_T_1788, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1790 = and(_T_1786, _T_1789) @[ifu_bp_ctl.scala 533:110]
    node _T_1791 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1792 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1793 = eq(_T_1792, UInt<4>("h0e")) @[ifu_bp_ctl.scala 534:74]
    node _T_1794 = and(_T_1791, _T_1793) @[ifu_bp_ctl.scala 534:22]
    node _T_1795 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1796 = eq(_T_1795, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1797 = or(_T_1796, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1798 = and(_T_1794, _T_1797) @[ifu_bp_ctl.scala 534:87]
    node _T_1799 = or(_T_1790, _T_1798) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][14] <= _T_1799 @[ifu_bp_ctl.scala 533:27]
    node _T_1800 = bits(bht_wr_en0, 1, 1) @[ifu_bp_ctl.scala 533:41]
    node _T_1801 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:60]
    node _T_1802 = eq(_T_1801, UInt<4>("h0f")) @[ifu_bp_ctl.scala 533:97]
    node _T_1803 = and(_T_1800, _T_1802) @[ifu_bp_ctl.scala 533:45]
    node _T_1804 = bits(mp_hashed, 7, 0) @[ifu_bp_ctl.scala 533:126]
    node _T_1805 = eq(_T_1804, UInt<1>("h00")) @[ifu_bp_ctl.scala 533:186]
    node _T_1806 = or(_T_1805, UInt<1>("h01")) @[ifu_bp_ctl.scala 533:199]
    node _T_1807 = and(_T_1803, _T_1806) @[ifu_bp_ctl.scala 533:110]
    node _T_1808 = bits(bht_wr_en2, 1, 1) @[ifu_bp_ctl.scala 534:18]
    node _T_1809 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:37]
    node _T_1810 = eq(_T_1809, UInt<4>("h0f")) @[ifu_bp_ctl.scala 534:74]
    node _T_1811 = and(_T_1808, _T_1810) @[ifu_bp_ctl.scala 534:22]
    node _T_1812 = bits(br0_hashed_wb, 7, 0) @[ifu_bp_ctl.scala 534:103]
    node _T_1813 = eq(_T_1812, UInt<1>("h00")) @[ifu_bp_ctl.scala 534:163]
    node _T_1814 = or(_T_1813, UInt<1>("h01")) @[ifu_bp_ctl.scala 534:176]
    node _T_1815 = and(_T_1811, _T_1814) @[ifu_bp_ctl.scala 534:87]
    node _T_1816 = or(_T_1807, _T_1815) @[ifu_bp_ctl.scala 533:223]
    bht_bank_sel[1][0][15] <= _T_1816 @[ifu_bp_ctl.scala 533:27]
    wire bht_bank_rd_data_out : UInt<2>[16][2] @[ifu_bp_ctl.scala 537:34]
    node _T_1817 = and(bht_bank_sel[0][0][0], bht_bank_sel[0][0][0]) @[lib.scala 383:57]
    reg _T_1818 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1817 : @[Reg.scala 28:19]
      _T_1818 <= bht_bank_wr_data_0_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][0] <= _T_1818 @[ifu_bp_ctl.scala 539:39]
    node _T_1819 = and(bht_bank_sel[0][0][1], bht_bank_sel[0][0][1]) @[lib.scala 383:57]
    reg _T_1820 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1819 : @[Reg.scala 28:19]
      _T_1820 <= bht_bank_wr_data_0_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][1] <= _T_1820 @[ifu_bp_ctl.scala 539:39]
    node _T_1821 = and(bht_bank_sel[0][0][2], bht_bank_sel[0][0][2]) @[lib.scala 383:57]
    reg _T_1822 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1821 : @[Reg.scala 28:19]
      _T_1822 <= bht_bank_wr_data_0_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][2] <= _T_1822 @[ifu_bp_ctl.scala 539:39]
    node _T_1823 = and(bht_bank_sel[0][0][3], bht_bank_sel[0][0][3]) @[lib.scala 383:57]
    reg _T_1824 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1823 : @[Reg.scala 28:19]
      _T_1824 <= bht_bank_wr_data_0_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][3] <= _T_1824 @[ifu_bp_ctl.scala 539:39]
    node _T_1825 = and(bht_bank_sel[0][0][4], bht_bank_sel[0][0][4]) @[lib.scala 383:57]
    reg _T_1826 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1825 : @[Reg.scala 28:19]
      _T_1826 <= bht_bank_wr_data_0_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][4] <= _T_1826 @[ifu_bp_ctl.scala 539:39]
    node _T_1827 = and(bht_bank_sel[0][0][5], bht_bank_sel[0][0][5]) @[lib.scala 383:57]
    reg _T_1828 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1827 : @[Reg.scala 28:19]
      _T_1828 <= bht_bank_wr_data_0_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][5] <= _T_1828 @[ifu_bp_ctl.scala 539:39]
    node _T_1829 = and(bht_bank_sel[0][0][6], bht_bank_sel[0][0][6]) @[lib.scala 383:57]
    reg _T_1830 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1829 : @[Reg.scala 28:19]
      _T_1830 <= bht_bank_wr_data_0_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][6] <= _T_1830 @[ifu_bp_ctl.scala 539:39]
    node _T_1831 = and(bht_bank_sel[0][0][7], bht_bank_sel[0][0][7]) @[lib.scala 383:57]
    reg _T_1832 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1831 : @[Reg.scala 28:19]
      _T_1832 <= bht_bank_wr_data_0_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][7] <= _T_1832 @[ifu_bp_ctl.scala 539:39]
    node _T_1833 = and(bht_bank_sel[0][0][8], bht_bank_sel[0][0][8]) @[lib.scala 383:57]
    reg _T_1834 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1833 : @[Reg.scala 28:19]
      _T_1834 <= bht_bank_wr_data_0_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][8] <= _T_1834 @[ifu_bp_ctl.scala 539:39]
    node _T_1835 = and(bht_bank_sel[0][0][9], bht_bank_sel[0][0][9]) @[lib.scala 383:57]
    reg _T_1836 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1835 : @[Reg.scala 28:19]
      _T_1836 <= bht_bank_wr_data_0_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][9] <= _T_1836 @[ifu_bp_ctl.scala 539:39]
    node _T_1837 = and(bht_bank_sel[0][0][10], bht_bank_sel[0][0][10]) @[lib.scala 383:57]
    reg _T_1838 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1837 : @[Reg.scala 28:19]
      _T_1838 <= bht_bank_wr_data_0_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][10] <= _T_1838 @[ifu_bp_ctl.scala 539:39]
    node _T_1839 = and(bht_bank_sel[0][0][11], bht_bank_sel[0][0][11]) @[lib.scala 383:57]
    reg _T_1840 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1839 : @[Reg.scala 28:19]
      _T_1840 <= bht_bank_wr_data_0_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][11] <= _T_1840 @[ifu_bp_ctl.scala 539:39]
    node _T_1841 = and(bht_bank_sel[0][0][12], bht_bank_sel[0][0][12]) @[lib.scala 383:57]
    reg _T_1842 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1841 : @[Reg.scala 28:19]
      _T_1842 <= bht_bank_wr_data_0_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][12] <= _T_1842 @[ifu_bp_ctl.scala 539:39]
    node _T_1843 = and(bht_bank_sel[0][0][13], bht_bank_sel[0][0][13]) @[lib.scala 383:57]
    reg _T_1844 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1843 : @[Reg.scala 28:19]
      _T_1844 <= bht_bank_wr_data_0_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][13] <= _T_1844 @[ifu_bp_ctl.scala 539:39]
    node _T_1845 = and(bht_bank_sel[0][0][14], bht_bank_sel[0][0][14]) @[lib.scala 383:57]
    reg _T_1846 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1845 : @[Reg.scala 28:19]
      _T_1846 <= bht_bank_wr_data_0_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][14] <= _T_1846 @[ifu_bp_ctl.scala 539:39]
    node _T_1847 = and(bht_bank_sel[0][0][15], bht_bank_sel[0][0][15]) @[lib.scala 383:57]
    reg _T_1848 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1847 : @[Reg.scala 28:19]
      _T_1848 <= bht_bank_wr_data_0_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[0][15] <= _T_1848 @[ifu_bp_ctl.scala 539:39]
    node _T_1849 = and(bht_bank_sel[1][0][0], bht_bank_sel[1][0][0]) @[lib.scala 383:57]
    reg _T_1850 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1849 : @[Reg.scala 28:19]
      _T_1850 <= bht_bank_wr_data_1_0_0 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][0] <= _T_1850 @[ifu_bp_ctl.scala 539:39]
    node _T_1851 = and(bht_bank_sel[1][0][1], bht_bank_sel[1][0][1]) @[lib.scala 383:57]
    reg _T_1852 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1851 : @[Reg.scala 28:19]
      _T_1852 <= bht_bank_wr_data_1_0_1 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][1] <= _T_1852 @[ifu_bp_ctl.scala 539:39]
    node _T_1853 = and(bht_bank_sel[1][0][2], bht_bank_sel[1][0][2]) @[lib.scala 383:57]
    reg _T_1854 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1853 : @[Reg.scala 28:19]
      _T_1854 <= bht_bank_wr_data_1_0_2 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][2] <= _T_1854 @[ifu_bp_ctl.scala 539:39]
    node _T_1855 = and(bht_bank_sel[1][0][3], bht_bank_sel[1][0][3]) @[lib.scala 383:57]
    reg _T_1856 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1855 : @[Reg.scala 28:19]
      _T_1856 <= bht_bank_wr_data_1_0_3 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][3] <= _T_1856 @[ifu_bp_ctl.scala 539:39]
    node _T_1857 = and(bht_bank_sel[1][0][4], bht_bank_sel[1][0][4]) @[lib.scala 383:57]
    reg _T_1858 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1857 : @[Reg.scala 28:19]
      _T_1858 <= bht_bank_wr_data_1_0_4 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][4] <= _T_1858 @[ifu_bp_ctl.scala 539:39]
    node _T_1859 = and(bht_bank_sel[1][0][5], bht_bank_sel[1][0][5]) @[lib.scala 383:57]
    reg _T_1860 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1859 : @[Reg.scala 28:19]
      _T_1860 <= bht_bank_wr_data_1_0_5 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][5] <= _T_1860 @[ifu_bp_ctl.scala 539:39]
    node _T_1861 = and(bht_bank_sel[1][0][6], bht_bank_sel[1][0][6]) @[lib.scala 383:57]
    reg _T_1862 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1861 : @[Reg.scala 28:19]
      _T_1862 <= bht_bank_wr_data_1_0_6 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][6] <= _T_1862 @[ifu_bp_ctl.scala 539:39]
    node _T_1863 = and(bht_bank_sel[1][0][7], bht_bank_sel[1][0][7]) @[lib.scala 383:57]
    reg _T_1864 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1863 : @[Reg.scala 28:19]
      _T_1864 <= bht_bank_wr_data_1_0_7 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][7] <= _T_1864 @[ifu_bp_ctl.scala 539:39]
    node _T_1865 = and(bht_bank_sel[1][0][8], bht_bank_sel[1][0][8]) @[lib.scala 383:57]
    reg _T_1866 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1865 : @[Reg.scala 28:19]
      _T_1866 <= bht_bank_wr_data_1_0_8 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][8] <= _T_1866 @[ifu_bp_ctl.scala 539:39]
    node _T_1867 = and(bht_bank_sel[1][0][9], bht_bank_sel[1][0][9]) @[lib.scala 383:57]
    reg _T_1868 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1867 : @[Reg.scala 28:19]
      _T_1868 <= bht_bank_wr_data_1_0_9 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][9] <= _T_1868 @[ifu_bp_ctl.scala 539:39]
    node _T_1869 = and(bht_bank_sel[1][0][10], bht_bank_sel[1][0][10]) @[lib.scala 383:57]
    reg _T_1870 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1869 : @[Reg.scala 28:19]
      _T_1870 <= bht_bank_wr_data_1_0_10 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][10] <= _T_1870 @[ifu_bp_ctl.scala 539:39]
    node _T_1871 = and(bht_bank_sel[1][0][11], bht_bank_sel[1][0][11]) @[lib.scala 383:57]
    reg _T_1872 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1871 : @[Reg.scala 28:19]
      _T_1872 <= bht_bank_wr_data_1_0_11 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][11] <= _T_1872 @[ifu_bp_ctl.scala 539:39]
    node _T_1873 = and(bht_bank_sel[1][0][12], bht_bank_sel[1][0][12]) @[lib.scala 383:57]
    reg _T_1874 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1873 : @[Reg.scala 28:19]
      _T_1874 <= bht_bank_wr_data_1_0_12 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][12] <= _T_1874 @[ifu_bp_ctl.scala 539:39]
    node _T_1875 = and(bht_bank_sel[1][0][13], bht_bank_sel[1][0][13]) @[lib.scala 383:57]
    reg _T_1876 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1875 : @[Reg.scala 28:19]
      _T_1876 <= bht_bank_wr_data_1_0_13 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][13] <= _T_1876 @[ifu_bp_ctl.scala 539:39]
    node _T_1877 = and(bht_bank_sel[1][0][14], bht_bank_sel[1][0][14]) @[lib.scala 383:57]
    reg _T_1878 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1877 : @[Reg.scala 28:19]
      _T_1878 <= bht_bank_wr_data_1_0_14 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][14] <= _T_1878 @[ifu_bp_ctl.scala 539:39]
    node _T_1879 = and(bht_bank_sel[1][0][15], bht_bank_sel[1][0][15]) @[lib.scala 383:57]
    reg _T_1880 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1879 : @[Reg.scala 28:19]
      _T_1880 <= bht_bank_wr_data_1_0_15 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    bht_bank_rd_data_out[1][15] <= _T_1880 @[ifu_bp_ctl.scala 539:39]
    node _T_1881 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 543:79]
    node _T_1882 = bits(_T_1881, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1883 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 543:79]
    node _T_1884 = bits(_T_1883, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1885 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 543:79]
    node _T_1886 = bits(_T_1885, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1887 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 543:79]
    node _T_1888 = bits(_T_1887, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1889 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 543:79]
    node _T_1890 = bits(_T_1889, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1891 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 543:79]
    node _T_1892 = bits(_T_1891, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1893 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 543:79]
    node _T_1894 = bits(_T_1893, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1895 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 543:79]
    node _T_1896 = bits(_T_1895, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1897 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 543:79]
    node _T_1898 = bits(_T_1897, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1899 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 543:79]
    node _T_1900 = bits(_T_1899, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1901 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 543:79]
    node _T_1902 = bits(_T_1901, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1903 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 543:79]
    node _T_1904 = bits(_T_1903, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1905 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 543:79]
    node _T_1906 = bits(_T_1905, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1907 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 543:79]
    node _T_1908 = bits(_T_1907, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1909 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 543:79]
    node _T_1910 = bits(_T_1909, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1911 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 543:79]
    node _T_1912 = bits(_T_1911, 0, 0) @[ifu_bp_ctl.scala 543:87]
    node _T_1913 = mux(_T_1882, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1914 = mux(_T_1884, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1915 = mux(_T_1886, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1916 = mux(_T_1888, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1917 = mux(_T_1890, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1918 = mux(_T_1892, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1919 = mux(_T_1894, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1920 = mux(_T_1896, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1921 = mux(_T_1898, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1922 = mux(_T_1900, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1923 = mux(_T_1902, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1924 = mux(_T_1904, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1925 = mux(_T_1906, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1926 = mux(_T_1908, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1927 = mux(_T_1910, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1928 = mux(_T_1912, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1929 = or(_T_1913, _T_1914) @[Mux.scala 27:72]
    node _T_1930 = or(_T_1929, _T_1915) @[Mux.scala 27:72]
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
    wire _T_1944 : UInt<2> @[Mux.scala 27:72]
    _T_1944 <= _T_1943 @[Mux.scala 27:72]
    bht_bank0_rd_data_f <= _T_1944 @[ifu_bp_ctl.scala 543:23]
    node _T_1945 = eq(bht_rd_addr_hashed_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 544:79]
    node _T_1946 = bits(_T_1945, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1947 = eq(bht_rd_addr_hashed_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 544:79]
    node _T_1948 = bits(_T_1947, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1949 = eq(bht_rd_addr_hashed_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 544:79]
    node _T_1950 = bits(_T_1949, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1951 = eq(bht_rd_addr_hashed_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 544:79]
    node _T_1952 = bits(_T_1951, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1953 = eq(bht_rd_addr_hashed_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 544:79]
    node _T_1954 = bits(_T_1953, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1955 = eq(bht_rd_addr_hashed_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 544:79]
    node _T_1956 = bits(_T_1955, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1957 = eq(bht_rd_addr_hashed_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 544:79]
    node _T_1958 = bits(_T_1957, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1959 = eq(bht_rd_addr_hashed_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 544:79]
    node _T_1960 = bits(_T_1959, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1961 = eq(bht_rd_addr_hashed_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 544:79]
    node _T_1962 = bits(_T_1961, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1963 = eq(bht_rd_addr_hashed_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 544:79]
    node _T_1964 = bits(_T_1963, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1965 = eq(bht_rd_addr_hashed_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 544:79]
    node _T_1966 = bits(_T_1965, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1967 = eq(bht_rd_addr_hashed_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 544:79]
    node _T_1968 = bits(_T_1967, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1969 = eq(bht_rd_addr_hashed_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 544:79]
    node _T_1970 = bits(_T_1969, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1971 = eq(bht_rd_addr_hashed_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 544:79]
    node _T_1972 = bits(_T_1971, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1973 = eq(bht_rd_addr_hashed_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 544:79]
    node _T_1974 = bits(_T_1973, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1975 = eq(bht_rd_addr_hashed_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 544:79]
    node _T_1976 = bits(_T_1975, 0, 0) @[ifu_bp_ctl.scala 544:87]
    node _T_1977 = mux(_T_1946, bht_bank_rd_data_out[1][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1978 = mux(_T_1948, bht_bank_rd_data_out[1][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1979 = mux(_T_1950, bht_bank_rd_data_out[1][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1980 = mux(_T_1952, bht_bank_rd_data_out[1][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1981 = mux(_T_1954, bht_bank_rd_data_out[1][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1982 = mux(_T_1956, bht_bank_rd_data_out[1][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1983 = mux(_T_1958, bht_bank_rd_data_out[1][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1984 = mux(_T_1960, bht_bank_rd_data_out[1][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1985 = mux(_T_1962, bht_bank_rd_data_out[1][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1986 = mux(_T_1964, bht_bank_rd_data_out[1][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1987 = mux(_T_1966, bht_bank_rd_data_out[1][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1988 = mux(_T_1968, bht_bank_rd_data_out[1][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1989 = mux(_T_1970, bht_bank_rd_data_out[1][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1990 = mux(_T_1972, bht_bank_rd_data_out[1][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1991 = mux(_T_1974, bht_bank_rd_data_out[1][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1992 = mux(_T_1976, bht_bank_rd_data_out[1][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1993 = or(_T_1977, _T_1978) @[Mux.scala 27:72]
    node _T_1994 = or(_T_1993, _T_1979) @[Mux.scala 27:72]
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
    wire _T_2008 : UInt<2> @[Mux.scala 27:72]
    _T_2008 <= _T_2007 @[Mux.scala 27:72]
    bht_bank1_rd_data_f <= _T_2008 @[ifu_bp_ctl.scala 544:23]
    node _T_2009 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h00")) @[ifu_bp_ctl.scala 545:85]
    node _T_2010 = bits(_T_2009, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2011 = eq(bht_rd_addr_hashed_p1_f, UInt<1>("h01")) @[ifu_bp_ctl.scala 545:85]
    node _T_2012 = bits(_T_2011, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2013 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h02")) @[ifu_bp_ctl.scala 545:85]
    node _T_2014 = bits(_T_2013, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2015 = eq(bht_rd_addr_hashed_p1_f, UInt<2>("h03")) @[ifu_bp_ctl.scala 545:85]
    node _T_2016 = bits(_T_2015, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2017 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h04")) @[ifu_bp_ctl.scala 545:85]
    node _T_2018 = bits(_T_2017, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2019 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h05")) @[ifu_bp_ctl.scala 545:85]
    node _T_2020 = bits(_T_2019, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2021 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h06")) @[ifu_bp_ctl.scala 545:85]
    node _T_2022 = bits(_T_2021, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2023 = eq(bht_rd_addr_hashed_p1_f, UInt<3>("h07")) @[ifu_bp_ctl.scala 545:85]
    node _T_2024 = bits(_T_2023, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2025 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h08")) @[ifu_bp_ctl.scala 545:85]
    node _T_2026 = bits(_T_2025, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2027 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h09")) @[ifu_bp_ctl.scala 545:85]
    node _T_2028 = bits(_T_2027, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2029 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0a")) @[ifu_bp_ctl.scala 545:85]
    node _T_2030 = bits(_T_2029, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2031 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0b")) @[ifu_bp_ctl.scala 545:85]
    node _T_2032 = bits(_T_2031, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2033 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0c")) @[ifu_bp_ctl.scala 545:85]
    node _T_2034 = bits(_T_2033, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2035 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0d")) @[ifu_bp_ctl.scala 545:85]
    node _T_2036 = bits(_T_2035, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2037 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0e")) @[ifu_bp_ctl.scala 545:85]
    node _T_2038 = bits(_T_2037, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2039 = eq(bht_rd_addr_hashed_p1_f, UInt<4>("h0f")) @[ifu_bp_ctl.scala 545:85]
    node _T_2040 = bits(_T_2039, 0, 0) @[ifu_bp_ctl.scala 545:93]
    node _T_2041 = mux(_T_2010, bht_bank_rd_data_out[0][0], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2042 = mux(_T_2012, bht_bank_rd_data_out[0][1], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2043 = mux(_T_2014, bht_bank_rd_data_out[0][2], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2044 = mux(_T_2016, bht_bank_rd_data_out[0][3], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2045 = mux(_T_2018, bht_bank_rd_data_out[0][4], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2046 = mux(_T_2020, bht_bank_rd_data_out[0][5], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2047 = mux(_T_2022, bht_bank_rd_data_out[0][6], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2048 = mux(_T_2024, bht_bank_rd_data_out[0][7], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2049 = mux(_T_2026, bht_bank_rd_data_out[0][8], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2050 = mux(_T_2028, bht_bank_rd_data_out[0][9], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2051 = mux(_T_2030, bht_bank_rd_data_out[0][10], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2052 = mux(_T_2032, bht_bank_rd_data_out[0][11], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2053 = mux(_T_2034, bht_bank_rd_data_out[0][12], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2054 = mux(_T_2036, bht_bank_rd_data_out[0][13], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2055 = mux(_T_2038, bht_bank_rd_data_out[0][14], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2056 = mux(_T_2040, bht_bank_rd_data_out[0][15], UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_2057 = or(_T_2041, _T_2042) @[Mux.scala 27:72]
    node _T_2058 = or(_T_2057, _T_2043) @[Mux.scala 27:72]
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
    wire _T_2072 : UInt<2> @[Mux.scala 27:72]
    _T_2072 <= _T_2071 @[Mux.scala 27:72]
    bht_bank0_rd_data_p1_f <= _T_2072 @[ifu_bp_ctl.scala 545:26]
    
