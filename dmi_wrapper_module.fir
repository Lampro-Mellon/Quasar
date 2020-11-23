;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit dmi_wrapper_module : 
  extmodule dmi_wrapper : 
    input trst_n : UInt<1>
    input tck : Clock
    input tms : UInt<1>
    input tdi : UInt<1>
    output tdo : UInt<1>
    output tdoEnable : UInt<1>
    input core_rst_n : AsyncReset
    input core_clk : Clock
    input jtag_id : UInt<31>
    input rd_data : UInt<32>
    output reg_wr_data : UInt<32>
    output reg_wr_addr : UInt<7>
    output reg_en : UInt<1>
    output reg_wr_en : UInt<1>
    output dmi_hard_reset : UInt<1>
    
    defname = dmi_wrapper
    
    
  module dmi_wrapper_module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip trst_n : UInt<1>, flip tck : Clock, flip tms : UInt<1>, flip tdi : UInt<1>, tdo : UInt<1>, tdoEnable : UInt<1>, flip core_rst_n : AsyncReset, flip core_clk : Clock, flip jtag_id : UInt<32>, flip rd_data : UInt<32>, reg_wr_data : UInt<32>, reg_wr_addr : UInt<7>, reg_en : UInt<1>, reg_wr_en : UInt<1>, dmi_hard_reset : UInt<1>}
    
    inst dwrap of dmi_wrapper @[dmi_wrapper.scala 45:21]
    dwrap.dmi_hard_reset is invalid
    dwrap.reg_wr_en is invalid
    dwrap.reg_en is invalid
    dwrap.reg_wr_addr is invalid
    dwrap.reg_wr_data is invalid
    dwrap.rd_data is invalid
    dwrap.jtag_id is invalid
    dwrap.core_clk is invalid
    dwrap.core_rst_n is invalid
    dwrap.tdoEnable is invalid
    dwrap.tdo is invalid
    dwrap.tdi is invalid
    dwrap.tms is invalid
    dwrap.tck is invalid
    dwrap.trst_n is invalid
    io.dmi_hard_reset <= dwrap.dmi_hard_reset @[dmi_wrapper.scala 46:12]
    io.reg_wr_en <= dwrap.reg_wr_en @[dmi_wrapper.scala 46:12]
    io.reg_en <= dwrap.reg_en @[dmi_wrapper.scala 46:12]
    io.reg_wr_addr <= dwrap.reg_wr_addr @[dmi_wrapper.scala 46:12]
    io.reg_wr_data <= dwrap.reg_wr_data @[dmi_wrapper.scala 46:12]
    dwrap.rd_data <= io.rd_data @[dmi_wrapper.scala 46:12]
    dwrap.jtag_id <= io.jtag_id @[dmi_wrapper.scala 46:12]
    dwrap.core_clk <= io.core_clk @[dmi_wrapper.scala 46:12]
    dwrap.core_rst_n <= io.core_rst_n @[dmi_wrapper.scala 46:12]
    io.tdoEnable <= dwrap.tdoEnable @[dmi_wrapper.scala 46:12]
    io.tdo <= dwrap.tdo @[dmi_wrapper.scala 46:12]
    dwrap.tdi <= io.tdi @[dmi_wrapper.scala 46:12]
    dwrap.tms <= io.tms @[dmi_wrapper.scala 46:12]
    dwrap.tck <= io.tck @[dmi_wrapper.scala 46:12]
    dwrap.trst_n <= io.trst_n @[dmi_wrapper.scala 46:12]
    
