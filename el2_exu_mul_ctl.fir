;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_exu_mul_ctl : 
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
    
  module el2_exu_mul_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip mul_p : {valid : UInt<1>, bits : {rs1_sign : UInt<1>, rs2_sign : UInt<1>, low : UInt<1>, bext : UInt<1>, bdep : UInt<1>, clmul : UInt<1>, clmulh : UInt<1>, clmulr : UInt<1>, grev : UInt<1>, shfl : UInt<1>, unshfl : UInt<1>, crc32_b : UInt<1>, crc32_h : UInt<1>, crc32_w : UInt<1>, crc32c_b : UInt<1>, crc32c_h : UInt<1>, crc32c_w : UInt<1>, bfp : UInt<1>}}, flip rs1_in : UInt<32>, flip rs2_in : UInt<32>, result_x : UInt<32>}
    
    wire rs1_ext_in : SInt<33>
    rs1_ext_in <= asSInt(UInt<1>("h00"))
    wire rs2_ext_in : SInt<33>
    rs2_ext_in <= asSInt(UInt<1>("h00"))
    wire rs1_x : SInt<33>
    rs1_x <= asSInt(UInt<1>("h00"))
    wire rs2_x : SInt<33>
    rs2_x <= asSInt(UInt<1>("h00"))
    wire prod_x : SInt<66>
    prod_x <= asSInt(UInt<1>("h00"))
    wire low_x : UInt<1>
    low_x <= UInt<1>("h00")
    node _T = bits(io.rs1_in, 31, 31) @[el2_exu_mul_ctl.scala 26:55]
    node _T_1 = and(io.mul_p.bits.rs1_sign, _T) @[el2_exu_mul_ctl.scala 26:44]
    node _T_2 = cat(_T_1, io.rs1_in) @[Cat.scala 29:58]
    node _T_3 = asSInt(_T_2) @[el2_exu_mul_ctl.scala 26:71]
    rs1_ext_in <= _T_3 @[el2_exu_mul_ctl.scala 26:14]
    node _T_4 = bits(io.rs2_in, 31, 31) @[el2_exu_mul_ctl.scala 27:55]
    node _T_5 = and(io.mul_p.bits.rs2_sign, _T_4) @[el2_exu_mul_ctl.scala 27:44]
    node _T_6 = cat(_T_5, io.rs2_in) @[Cat.scala 29:58]
    node _T_7 = asSInt(_T_6) @[el2_exu_mul_ctl.scala 27:71]
    rs2_ext_in <= _T_7 @[el2_exu_mul_ctl.scala 27:14]
    node _T_8 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 36:52]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 508:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr.io.en <= _T_8 @[el2_lib.scala 511:17]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_9 : UInt, rvclkhdr.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_9 <= io.mul_p.bits.low @[el2_lib.scala 514:16]
    low_x <= _T_9 @[el2_exu_mul_ctl.scala 36:9]
    node _T_10 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 37:44]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 528:23]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 530:18]
    rvclkhdr_1.io.en <= _T_10 @[el2_lib.scala 531:17]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 532:24]
    reg _T_11 : SInt, rvclkhdr_1.io.l1clk with : (reset => (reset, asSInt(UInt<1>("h00")))) @[el2_lib.scala 534:16]
    _T_11 <= rs1_ext_in @[el2_lib.scala 534:16]
    rs1_x <= _T_11 @[el2_exu_mul_ctl.scala 37:9]
    node _T_12 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 38:45]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 528:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 530:18]
    rvclkhdr_2.io.en <= _T_12 @[el2_lib.scala 531:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 532:24]
    reg _T_13 : SInt, rvclkhdr_2.io.l1clk with : (reset => (reset, asSInt(UInt<1>("h00")))) @[el2_lib.scala 534:16]
    _T_13 <= rs2_ext_in @[el2_lib.scala 534:16]
    rs2_x <= _T_13 @[el2_exu_mul_ctl.scala 38:9]
    node _T_14 = mul(rs1_x, rs2_x) @[el2_exu_mul_ctl.scala 40:20]
    prod_x <= _T_14 @[el2_exu_mul_ctl.scala 40:10]
    node _T_15 = bits(low_x, 0, 0) @[el2_exu_mul_ctl.scala 41:36]
    node _T_16 = eq(_T_15, UInt<1>("h00")) @[el2_exu_mul_ctl.scala 41:29]
    node _T_17 = bits(prod_x, 63, 32) @[el2_exu_mul_ctl.scala 41:52]
    node _T_18 = bits(low_x, 0, 0) @[el2_exu_mul_ctl.scala 41:67]
    node _T_19 = bits(prod_x, 31, 0) @[el2_exu_mul_ctl.scala 41:83]
    node _T_20 = mux(_T_16, _T_17, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_21 = mux(_T_18, _T_19, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_22 = or(_T_20, _T_21) @[Mux.scala 27:72]
    wire _T_23 : UInt<32> @[Mux.scala 27:72]
    _T_23 <= _T_22 @[Mux.scala 27:72]
    io.result_x <= _T_23 @[el2_exu_mul_ctl.scala 41:15]
    
