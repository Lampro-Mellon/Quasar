;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit encoder_generator : 
  module encoder_generator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<3>}
    
    node _T = bits(io.in, 0, 0) @[Mux.scala 29:36]
    node _T_1 = bits(io.in, 1, 1) @[Mux.scala 29:36]
    node _T_2 = bits(io.in, 2, 2) @[Mux.scala 29:36]
    node _T_3 = bits(io.in, 3, 3) @[Mux.scala 29:36]
    node _T_4 = bits(io.in, 4, 4) @[Mux.scala 29:36]
    node _T_5 = bits(io.in, 5, 5) @[Mux.scala 29:36]
    node _T_6 = bits(io.in, 6, 6) @[Mux.scala 29:36]
    node _T_7 = bits(io.in, 7, 7) @[Mux.scala 29:36]
    node _T_8 = mux(_T, UInt<1>("h00"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_9 = mux(_T_1, UInt<1>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_10 = mux(_T_2, UInt<2>("h02"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_11 = mux(_T_3, UInt<2>("h03"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_12 = mux(_T_4, UInt<3>("h04"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_13 = mux(_T_5, UInt<3>("h05"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_14 = mux(_T_6, UInt<3>("h06"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_15 = mux(_T_7, UInt<3>("h07"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_16 = or(_T_8, _T_9) @[Mux.scala 27:72]
    node _T_17 = or(_T_16, _T_10) @[Mux.scala 27:72]
    node _T_18 = or(_T_17, _T_11) @[Mux.scala 27:72]
    node _T_19 = or(_T_18, _T_12) @[Mux.scala 27:72]
    node _T_20 = or(_T_19, _T_13) @[Mux.scala 27:72]
    node _T_21 = or(_T_20, _T_14) @[Mux.scala 27:72]
    node _T_22 = or(_T_21, _T_15) @[Mux.scala 27:72]
    wire _T_23 : UInt<3> @[Mux.scala 27:72]
    _T_23 <= _T_22 @[Mux.scala 27:72]
    io.out <= _T_23 @[GCD.scala 74:10]
    
