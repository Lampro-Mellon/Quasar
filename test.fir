;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit test : 
  module test : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<4>, flip in2 : {waleed : UInt<5>, laraib : UInt<5>, hameed : UInt<5>}, out2 : {waleed : UInt<5>, laraib : UInt<5>, hameed : UInt<5>}, out1 : UInt}
    
    io.out1 <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 235:13]
    
