;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit dmi_wrapper : 
  module rvjtag_tap : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip tck : Clock, flip tms : UInt<1>, flip tdi : UInt<1>, flip rd_data : UInt<32>, flip rd_status : UInt<2>, flip idle : UInt<3>, flip dmi_stat : UInt<2>, flip jtag_id : UInt<32>, flip version : UInt<4>, tdo : UInt<1>, tdoEnable : UInt<1>, wr_data : UInt<32>, wr_addr : UInt<7>, wr_en : UInt<1>, rd_en : UInt<1>, dmi_reset : UInt<1>, dmi_hard_reset : UInt<1>}
    
    io.tdo <= UInt<1>("h00") @[rvjtag_tap.scala 31:21]
    io.tdoEnable <= UInt<1>("h00") @[rvjtag_tap.scala 32:21]
    io.wr_data <= UInt<1>("h00") @[rvjtag_tap.scala 33:21]
    io.wr_addr <= UInt<1>("h00") @[rvjtag_tap.scala 34:21]
    io.wr_en <= UInt<1>("h00") @[rvjtag_tap.scala 35:21]
    io.rd_en <= UInt<1>("h00") @[rvjtag_tap.scala 36:21]
    io.dmi_reset <= UInt<1>("h00") @[rvjtag_tap.scala 37:21]
    io.dmi_hard_reset <= UInt<1>("h00") @[rvjtag_tap.scala 38:21]
    
  module dmi_jtag_to_core_sync : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip rd_en : UInt<1>, flip wr_en : UInt<1>, reg_en : UInt<1>, reg_wr_en : UInt<1>}
    
    io.reg_en <= UInt<1>("h00") @[dmi_jtag_to_core_sync.scala 19:16]
    io.reg_wr_en <= UInt<1>("h00") @[dmi_jtag_to_core_sync.scala 20:16]
    wire rden : UInt<3>
    rden <= UInt<1>("h00")
    wire wren : UInt<3>
    wren <= UInt<1>("h00")
    node _T = bits(rden, 1, 0) @[dmi_jtag_to_core_sync.scala 25:27]
    node _T_1 = cat(_T, io.rd_en) @[Cat.scala 29:58]
    reg _T_2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[dmi_jtag_to_core_sync.scala 25:18]
    _T_2 <= _T_1 @[dmi_jtag_to_core_sync.scala 25:18]
    rden <= _T_2 @[dmi_jtag_to_core_sync.scala 25:8]
    node _T_3 = bits(wren, 1, 0) @[dmi_jtag_to_core_sync.scala 26:27]
    node _T_4 = cat(_T_3, io.wr_en) @[Cat.scala 29:58]
    reg _T_5 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[dmi_jtag_to_core_sync.scala 26:18]
    _T_5 <= _T_4 @[dmi_jtag_to_core_sync.scala 26:18]
    wren <= _T_5 @[dmi_jtag_to_core_sync.scala 26:8]
    node _T_6 = bits(rden, 1, 1) @[dmi_jtag_to_core_sync.scala 28:21]
    node _T_7 = bits(rden, 2, 2) @[dmi_jtag_to_core_sync.scala 28:32]
    node _T_8 = eq(_T_7, UInt<1>("h00")) @[dmi_jtag_to_core_sync.scala 28:27]
    node c_rd_en = and(_T_6, _T_8) @[dmi_jtag_to_core_sync.scala 28:25]
    node _T_9 = bits(wren, 1, 1) @[dmi_jtag_to_core_sync.scala 29:21]
    node _T_10 = bits(wren, 2, 2) @[dmi_jtag_to_core_sync.scala 29:32]
    node _T_11 = eq(_T_10, UInt<1>("h00")) @[dmi_jtag_to_core_sync.scala 29:27]
    node c_wr_en = and(_T_9, _T_11) @[dmi_jtag_to_core_sync.scala 29:25]
    node _T_12 = or(c_wr_en, c_rd_en) @[dmi_jtag_to_core_sync.scala 31:24]
    io.reg_en <= _T_12 @[dmi_jtag_to_core_sync.scala 31:13]
    io.reg_wr_en <= c_wr_en @[dmi_jtag_to_core_sync.scala 32:16]
    
  module dmi_wrapper : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip tck : Clock, flip tms : UInt<1>, flip tdi : UInt<1>, tdo : UInt<1>, tdoEnable : UInt<1>, flip core_clk : Clock, flip jtag_id : UInt<32>, flip rd_data : UInt<32>, reg_wr_data : UInt<32>, reg_wr_addr : UInt<7>, reg_en : UInt<1>, reg_wr_en : UInt<1>, dmi_hard_reset : UInt<1>}
    
    wire rd_en : UInt<1>
    rd_en <= UInt<1>("h00")
    wire wr_en : UInt<1>
    wr_en <= UInt<1>("h00")
    wire dmireset : UInt<1>
    dmireset <= UInt<1>("h00")
    inst i_jtag_tap of rvjtag_tap @[dmi_wrapper.scala 33:27]
    i_jtag_tap.clock <= clock
    i_jtag_tap.reset <= reset
    i_jtag_tap.io.tck <= io.tck @[dmi_wrapper.scala 36:27]
    i_jtag_tap.io.tms <= io.tms @[dmi_wrapper.scala 37:27]
    i_jtag_tap.io.tdi <= io.tdi @[dmi_wrapper.scala 38:27]
    i_jtag_tap.io.rd_data <= io.rd_data @[dmi_wrapper.scala 39:27]
    i_jtag_tap.io.rd_status <= UInt<2>("h00") @[dmi_wrapper.scala 40:27]
    i_jtag_tap.io.idle <= UInt<3>("h00") @[dmi_wrapper.scala 41:27]
    i_jtag_tap.io.dmi_stat <= UInt<2>("h00") @[dmi_wrapper.scala 42:27]
    i_jtag_tap.io.jtag_id <= io.jtag_id @[dmi_wrapper.scala 43:27]
    i_jtag_tap.io.version <= UInt<1>("h01") @[dmi_wrapper.scala 44:27]
    io.tdo <= i_jtag_tap.io.tdo @[dmi_wrapper.scala 46:27]
    io.tdoEnable <= i_jtag_tap.io.tdoEnable @[dmi_wrapper.scala 47:27]
    io.reg_wr_data <= i_jtag_tap.io.wr_data @[dmi_wrapper.scala 48:27]
    io.reg_wr_addr <= i_jtag_tap.io.wr_addr @[dmi_wrapper.scala 49:27]
    rd_en <= i_jtag_tap.io.rd_en @[dmi_wrapper.scala 50:27]
    wr_en <= i_jtag_tap.io.wr_en @[dmi_wrapper.scala 51:27]
    io.dmi_hard_reset <= i_jtag_tap.io.dmi_hard_reset @[dmi_wrapper.scala 52:27]
    dmireset <= i_jtag_tap.io.dmi_reset @[dmi_wrapper.scala 53:27]
    inst i_dmi_jtag_to_core_sync of dmi_jtag_to_core_sync @[dmi_wrapper.scala 56:40]
    i_dmi_jtag_to_core_sync.clock <= clock
    i_dmi_jtag_to_core_sync.reset <= reset
    i_dmi_jtag_to_core_sync.io.wr_en <= wr_en @[dmi_wrapper.scala 57:39]
    i_dmi_jtag_to_core_sync.io.rd_en <= rd_en @[dmi_wrapper.scala 58:39]
    io.reg_en <= i_dmi_jtag_to_core_sync.io.reg_en @[dmi_wrapper.scala 59:39]
    io.reg_wr_en <= i_dmi_jtag_to_core_sync.io.reg_wr_en @[dmi_wrapper.scala 60:39]
    
