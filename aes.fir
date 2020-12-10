;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit aes : 
  module aes : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip byteIn : UInt<8>, byteOut : UInt<8>}
    
    node _T = dshl(io.byteIn, UInt<2>("h03")) @[cipher.scala 16:16]
    node _T_1 = sub(UInt<4>("h08"), UInt<2>("h03")) @[cipher.scala 16:39]
    node _T_2 = tail(_T_1, 1) @[cipher.scala 16:39]
    node _T_3 = dshr(io.byteIn, _T_2) @[cipher.scala 16:31]
    node z = or(_T, _T_3) @[cipher.scala 16:26]
    io.byteOut <= z @[cipher.scala 21:14]
    
