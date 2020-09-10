;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit EL2_IC_DATA : 
  module EL2_IC_DATA : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rst_l : UInt<1>, flip clk_override : UInt<1>, flip ic_rw_addr : UInt<12>, flip ic_wr_en : UInt<2>, flip ic_rd_en : UInt<1>, flip ic_wr_data : UInt<71>[2], ic_rd_data : UInt<64>, flip ic_debug_wr_data : UInt<71>, ic_debug_rd_data : UInt<71>, ic_parerr : UInt<2>, ic_eccerr : UInt<2>, flip ic_debug_addr : UInt<15>, flip ic_debug_rd_en : UInt<1>, flip ic_debug_wr_en : UInt<1>, flip ic_debug_tag_array : UInt<1>, flip ic_debug_way : UInt<2>, flip ic_premux_data : UInt<64>, flip ic_sel_premux_data : UInt<1>, flip ic_rd_hit : UInt<2>, flip scan_mode : UInt<1>, flip mask : UInt<1>[2][2]}
    
    smem ic_memory : UInt<26>[2][2][512], undefined @[el2_ifu_ic_mem.scala 209:30]
    wire data : UInt<71>[2][2] @[el2_ifu_ic_mem.scala 210:48]
    data[0][0] <= io.ic_wr_data[0] @[el2_ifu_ic_mem.scala 210:48]
    data[0][1] <= io.ic_wr_data[1] @[el2_ifu_ic_mem.scala 210:48]
    data[1][0] <= io.ic_wr_data[0] @[el2_ifu_ic_mem.scala 210:48]
    data[1][1] <= io.ic_wr_data[1] @[el2_ifu_ic_mem.scala 210:48]
    wire mem_mask : UInt<1>[2] @[el2_ifu_ic_mem.scala 211:51]
    mem_mask[0] <= UInt<1>("h01") @[el2_ifu_ic_mem.scala 211:51]
    mem_mask[1] <= UInt<1>("h01") @[el2_ifu_ic_mem.scala 211:51]
    wire mem_mask2 : UInt<1>[2][2] @[el2_ifu_ic_mem.scala 212:52]
    mem_mask2[0][0] <= mem_mask[0] @[el2_ifu_ic_mem.scala 212:52]
    mem_mask2[0][1] <= mem_mask[1] @[el2_ifu_ic_mem.scala 212:52]
    mem_mask2[1][0] <= mem_mask[0] @[el2_ifu_ic_mem.scala 212:52]
    mem_mask2[1][1] <= mem_mask[1] @[el2_ifu_ic_mem.scala 212:52]
    io.ic_debug_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 214:23]
    io.ic_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 215:17]
    io.ic_eccerr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 216:16]
    io.ic_parerr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 217:16]
    
