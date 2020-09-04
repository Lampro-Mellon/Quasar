;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit MakeInout : 
  extmodule rvdff : 
    input in : UInt<16>
    input clk : Clock
    input reset : UInt<1>
    output out : UInt<16>
    
    defname = rvdff
    
    
  module MakeInout : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, flip clk : Clock, flip reset : UInt<1>, out : UInt<16>}
    
    inst m of rvdff @[GCD.scala 40:17]
    m.out is invalid
    m.reset is invalid
    m.clk is invalid
    m.in is invalid
    io.out <= m.out @[GCD.scala 42:8]
    m.reset <= io.reset @[GCD.scala 42:8]
    m.clk <= io.clk @[GCD.scala 42:8]
    m.in <= io.in @[GCD.scala 42:8]
    
