;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_bp_ctl : 
  module el2_ifu_bp_ctl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<32>, flip in2 : UInt<32>, out : UInt}
    
    node _T = bits(io.in, 9, 2) @[el2_lib.scala 32:16]
    node _T_1 = bits(io.in2, 7, 0) @[el2_lib.scala 32:40]
    node _T_2 = xor(_T, _T_1) @[el2_lib.scala 32:35]
    io.out <= _T_2 @[el2_ifu_bp_ctl.scala 13:10]
    
