;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit test : 
  module test : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, in_range : UInt<1>, in_region : UInt<1>}
    
    node _T = bits(io.addr, 31, 28) @[el2_lib.scala 203:25]
    node range = eq(_T, UInt<4>("h0e")) @[el2_lib.scala 203:47]
    node _T_1 = bits(io.addr, 31, 16) @[el2_lib.scala 206:14]
    node region = eq(_T_1, UInt<16>("h0ee00")) @[el2_lib.scala 206:29]
    io.in_region <= region @[el2_ifu_ifc_ctrl.scala 142:16]
    io.in_range <= range @[el2_ifu_ifc_ctrl.scala 143:15]
    
