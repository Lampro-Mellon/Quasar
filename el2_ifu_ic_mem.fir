;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_ic_mem : 
  module el2_ifu_ic_mem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clk_override : UInt<1>, flip dec_tlu_core_ecc_disable : UInt<1>, flip ic_rw_addr : UInt<31>, flip ic_wr_en : UInt<2>, flip ic_rd_en : UInt<1>, flip ic_debug_addr : UInt<9>, flip ic_debug_rd_en : UInt<1>, flip ic_debug_wr_en : UInt<1>, flip ic_debug_tag_array : UInt<1>, flip ic_debug_way : UInt<2>, flip ic_premux_data : UInt<64>, flip ic_sel_premux_data : UInt<1>, flip ic_wr_data : UInt<71>[2], ic_rd_data : UInt<64>, ic_debug_rd_data : UInt<71>, ictag_debug_rd_data : UInt<26>, flip ic_debug_wr_data : UInt<71>, ic_eccerr : UInt<2>, ic_parerr : UInt<2>, flip ic_tag_valid : UInt<2>, ic_rd_hit : UInt<2>, ic_tag_perr : UInt<1>, flip scan_mode : UInt<1>}
    
    io.ic_tag_perr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 32:18]
    io.ic_rd_hit <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 33:16]
    io.ic_parerr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 34:16]
    io.ic_eccerr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 35:16]
    io.ictag_debug_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 36:26]
    io.ic_debug_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 37:23]
    io.ic_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 38:17]
    
