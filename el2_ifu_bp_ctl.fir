;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_bp_ctl : 
  module el2_ifu_bp_ctl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<32>, out : UInt}
    
    node _T = bits(io.in, 14, 10) @[el2_lib.scala 18:33]
    node _T_1 = bits(io.in, 19, 15) @[el2_lib.scala 18:33]
    node _T_2 = bits(io.in, 24, 20) @[el2_lib.scala 18:33]
    wire _T_3 : UInt<5>[3] @[el2_lib.scala 18:25]
    _T_3[0] <= _T @[el2_lib.scala 18:25]
    _T_3[1] <= _T_1 @[el2_lib.scala 18:25]
    _T_3[2] <= _T_2 @[el2_lib.scala 18:25]
    node _T_4 = xor(_T_3[0], _T_3[1]) @[el2_lib.scala 18:113]
    node _T_5 = xor(_T_4, _T_3[2]) @[el2_lib.scala 18:113]
    io.out <= _T_5 @[el2_ifu_bp_ctl.scala 12:10]
    
