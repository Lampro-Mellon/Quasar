;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit EL2_IC_TAG : 
  module EL2_IC_TAG : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clk : UInt<1>, flip rst_l : UInt<1>, flip clk_override : UInt<1>, flip dec_tlu_core_ecc_disable : UInt<1>, flip ic_rw_addr : UInt<29>, flip ic_wr_en : UInt<2>, flip ic_tag_valid : UInt<2>, flip ic_rd_en : UInt<1>, flip ic_debug_addr : UInt<9>, flip ic_debug_rd_en : UInt<1>, flip ic_debug_wr_en : UInt<1>, flip ic_debug_tag_array : UInt<1>, flip ic_debug_way : UInt<2>, ictag_debug_rd_data : UInt<26>, flip ic_debug_wr_data : UInt<71>, ic_rd_hit : UInt<2>, ic_tag_perr : UInt<1>, flip scan_mode : UInt<1>, test : UInt}
    
    node _T = bits(io.ic_rw_addr, 5, 4) @[el2_ifu_ic_mem.scala 68:69]
    wire _T_1 : UInt<1>[1] @[el2_lib.scala 39:24]
    _T_1[0] <= UInt<1>("h01") @[el2_lib.scala 39:24]
    node _T_2 = eq(_T, _T_1[0]) @[el2_ifu_ic_mem.scala 68:92]
    wire _T_3 : UInt<1>[2] @[el2_lib.scala 39:24]
    _T_3[0] <= _T_2 @[el2_lib.scala 39:24]
    _T_3[1] <= _T_2 @[el2_lib.scala 39:24]
    node _T_4 = cat(_T_3[0], _T_3[1]) @[Cat.scala 29:58]
    node ic_tag_wren = and(io.ic_wr_en, _T_4) @[el2_ifu_ic_mem.scala 68:32]
    io.test <= ic_tag_wren @[el2_ifu_ic_mem.scala 72:10]
    io.ic_tag_perr <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 73:18]
    io.ic_rd_hit <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 74:16]
    io.ictag_debug_rd_data <= UInt<1>("h00") @[el2_ifu_ic_mem.scala 75:26]
    
