;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit caller : 
  module rvdff : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : UInt<32>, out : UInt}
    
    io.out <= io.in @[GCD.scala 12:10]
    
  module caller : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<32>, out : UInt}
    
    inst u0 of rvdff @[GCD.scala 21:18]
    u0.clock <= clock
    u0.reset <= reset
    io.out <= u0.io.out @[GCD.scala 22:6]
    u0.io.in <= io.in @[GCD.scala 22:6]
    
