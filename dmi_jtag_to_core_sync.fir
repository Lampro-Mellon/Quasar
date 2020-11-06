;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit dmi_jtag_to_core_sync : 
  module dmi_jtag_to_core_sync : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip rd_en : UInt<1>, flip wr_en : UInt<1>, reg_en : UInt<1>, reg_wr_en : UInt<1>}
    
    wire c_rd_en : UInt<1>
    c_rd_en <= UInt<1>("h00")
    wire c_wr_en : UInt<1>
    c_wr_en <= UInt<1>("h00")
    wire rden : UInt<3>
    rden <= UInt<3>("h00")
    wire wren : UInt<3>
    wren <= UInt<3>("h00")
    node _T = bits(rden, 1, 0) @[dmi_jtag_to_core_sync.scala 26:27]
    node _T_1 = cat(_T, io.rd_en) @[Cat.scala 29:58]
    reg _T_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[dmi_jtag_to_core_sync.scala 26:18]
    _T_2 <= _T_1 @[dmi_jtag_to_core_sync.scala 26:18]
    rden <= _T_2 @[dmi_jtag_to_core_sync.scala 26:8]
    node _T_3 = bits(wren, 1, 0) @[dmi_jtag_to_core_sync.scala 27:27]
    node _T_4 = cat(_T_3, io.wr_en) @[Cat.scala 29:58]
    reg _T_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[dmi_jtag_to_core_sync.scala 27:18]
    _T_5 <= _T_4 @[dmi_jtag_to_core_sync.scala 27:18]
    wren <= _T_5 @[dmi_jtag_to_core_sync.scala 27:8]
    node _T_6 = bits(rden, 1, 1) @[dmi_jtag_to_core_sync.scala 28:17]
    node _T_7 = bits(rden, 2, 2) @[dmi_jtag_to_core_sync.scala 28:28]
    node _T_8 = eq(_T_7, UInt<1>("h00")) @[dmi_jtag_to_core_sync.scala 28:23]
    node _T_9 = and(_T_6, _T_8) @[dmi_jtag_to_core_sync.scala 28:21]
    c_rd_en <= _T_9 @[dmi_jtag_to_core_sync.scala 28:10]
    node _T_10 = bits(wren, 1, 1) @[dmi_jtag_to_core_sync.scala 29:17]
    node _T_11 = bits(wren, 2, 2) @[dmi_jtag_to_core_sync.scala 29:28]
    node _T_12 = eq(_T_11, UInt<1>("h00")) @[dmi_jtag_to_core_sync.scala 29:23]
    node _T_13 = and(_T_10, _T_12) @[dmi_jtag_to_core_sync.scala 29:21]
    c_wr_en <= _T_13 @[dmi_jtag_to_core_sync.scala 29:10]
    node _T_14 = or(c_wr_en, c_rd_en) @[dmi_jtag_to_core_sync.scala 31:28]
    io.reg_en <= _T_14 @[dmi_jtag_to_core_sync.scala 31:17]
    io.reg_wr_en <= c_wr_en @[dmi_jtag_to_core_sync.scala 32:17]
    
