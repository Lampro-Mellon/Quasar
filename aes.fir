;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit aes : 
  module aes : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip byteIn : UInt<8>, byteOut : UInt<8>}
    
    
