;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_exu_mul_ctl : 
  module el2_exu_mul_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip scan_mode : UInt<1>, flip mul_p : {valid : UInt<1>, rs1_sign : UInt<1>, rs2_sign : UInt<1>, low : UInt<1>, bext : UInt<1>, bdep : UInt<1>, clmul : UInt<1>, clmulh : UInt<1>, clmulr : UInt<1>, grev : UInt<1>, shfl : UInt<1>, unshfl : UInt<1>, crc32_b : UInt<1>, crc32_h : UInt<1>, crc32_w : UInt<1>, crc32c_b : UInt<1>, crc32c_h : UInt<1>, crc32c_w : UInt<1>, bfp : UInt<1>}, flip rs1_in : UInt<32>, flip rs2_in : UInt<32>, result_x : UInt<32>}
    
    wire rs1_ext_in : SInt<33>
    rs1_ext_in <= asSInt(UInt<1>("h00"))
    wire rs2_ext_in : SInt<33>
    rs2_ext_in <= asSInt(UInt<1>("h00"))
    wire prod_x : SInt<66>
    prod_x <= asSInt(UInt<1>("h00"))
    wire low_x : UInt<1>
    low_x <= UInt<1>("h00")
    node _T = bits(io.rs1_in, 31, 31) @[el2_exu_mul_ctl.scala 23:50]
    node _T_1 = and(io.mul_p.rs1_sign, _T) @[el2_exu_mul_ctl.scala 23:39]
    node _T_2 = cat(_T_1, io.rs1_in) @[Cat.scala 29:58]
    node _T_3 = asSInt(_T_2) @[el2_exu_mul_ctl.scala 23:66]
    rs1_ext_in <= _T_3 @[el2_exu_mul_ctl.scala 23:14]
    node _T_4 = bits(io.rs2_in, 31, 31) @[el2_exu_mul_ctl.scala 24:50]
    node _T_5 = and(io.mul_p.rs2_sign, _T_4) @[el2_exu_mul_ctl.scala 24:39]
    node _T_6 = cat(_T_5, io.rs2_in) @[Cat.scala 29:58]
    node _T_7 = asSInt(_T_6) @[el2_exu_mul_ctl.scala 24:66]
    rs2_ext_in <= _T_7 @[el2_exu_mul_ctl.scala 24:14]
    node _T_8 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 27:55]
    reg _T_9 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_8 : @[Reg.scala 28:19]
      _T_9 <= io.mul_p.low @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    low_x <= _T_9 @[el2_exu_mul_ctl.scala 27:9]
    node _T_10 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 28:56]
    reg rs1_x : SInt, clock with : (reset => (reset, asSInt(UInt<1>("h00")))) @[Reg.scala 27:20]
    when _T_10 : @[Reg.scala 28:19]
      rs1_x <= rs1_ext_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_11 = bits(io.mul_p.valid, 0, 0) @[el2_exu_mul_ctl.scala 29:56]
    reg rs2_x : SInt, clock with : (reset => (reset, asSInt(UInt<1>("h00")))) @[Reg.scala 27:20]
    when _T_11 : @[Reg.scala 28:19]
      rs2_x <= rs2_ext_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_12 = mul(rs1_x, rs2_x) @[el2_exu_mul_ctl.scala 31:20]
    prod_x <= _T_12 @[el2_exu_mul_ctl.scala 31:10]
    node _T_13 = bits(low_x, 0, 0) @[el2_exu_mul_ctl.scala 32:36]
    node _T_14 = eq(_T_13, UInt<1>("h00")) @[el2_exu_mul_ctl.scala 32:29]
    node _T_15 = bits(prod_x, 63, 32) @[el2_exu_mul_ctl.scala 32:52]
    node _T_16 = bits(low_x, 0, 0) @[el2_exu_mul_ctl.scala 32:67]
    node _T_17 = bits(prod_x, 31, 0) @[el2_exu_mul_ctl.scala 32:83]
    node _T_18 = mux(_T_14, _T_15, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_19 = mux(_T_16, _T_17, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_20 = or(_T_18, _T_19) @[Mux.scala 27:72]
    wire _T_21 : UInt<32> @[Mux.scala 27:72]
    _T_21 <= _T_20 @[Mux.scala 27:72]
    io.result_x <= _T_21 @[el2_exu_mul_ctl.scala 32:15]
    
