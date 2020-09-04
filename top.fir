;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit top : 
  module reg1 : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip in : UInt<1>, out : UInt<1>}
    
    reg _T : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[GCD.scala 32:20]
    _T <= io.in @[GCD.scala 32:20]
    io.out <= _T @[GCD.scala 32:10]
    
  module top : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip in : UInt<1>, out : UInt<1>}
    
    node _T = asUInt(reset) @[GCD.scala 40:26]
    node _T_1 = not(_T) @[GCD.scala 40:19]
    node negReset = asAsyncReset(_T_1) @[GCD.scala 40:34]
    inst r0 of reg1 @[GCD.scala 41:18]
    r0.clock <= clock
    r0.reset <= reset
    io.out <= r0.io.out @[GCD.scala 42:8]
    r0.io.in <= io.in @[GCD.scala 42:8]
    r0.reset <= negReset @[GCD.scala 43:12]
    
