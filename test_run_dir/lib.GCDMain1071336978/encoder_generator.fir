;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit encoder_generator : 
  module encoder_generator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<2>}
    
    node _T = bits(io.in, 0, 0) @[Mux.scala 29:36]
    node _T_1 = bits(io.in, 1, 1) @[Mux.scala 29:36]
    node _T_2 = bits(io.in, 2, 2) @[Mux.scala 29:36]
    node _T_3 = bits(io.in, 3, 3) @[Mux.scala 29:36]
    node _T_4 = mux(_T, UInt<1>("h00"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_5 = mux(_T_1, UInt<1>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_6 = mux(_T_2, UInt<2>("h02"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_7 = mux(_T_3, UInt<2>("h03"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_8 = or(_T_4, _T_5) @[Mux.scala 27:72]
    node _T_9 = or(_T_8, _T_6) @[Mux.scala 27:72]
    node _T_10 = or(_T_9, _T_7) @[Mux.scala 27:72]
    wire _T_11 : UInt<2> @[Mux.scala 27:72]
    _T_11 <= _T_10 @[Mux.scala 27:72]
    io.out <= _T_11 @[GCD.scala 74:10]
    
