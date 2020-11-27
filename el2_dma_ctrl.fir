;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_dma_ctrl : 
  extmodule gated_latch : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_1 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_1 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_1 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_2 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_2 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_2 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_3 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_3 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_3 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_4 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_4 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_4 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_5 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_5 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_5 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_6 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_6 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_6 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_7 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_7 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_7 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_8 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_8 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_8 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_9 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_9 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_9 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_10 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_10 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_10 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_11 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_11 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_11 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_12 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_12 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_12 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_13 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_13 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_13 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_14 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_14 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_14 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  extmodule gated_latch_15 : 
    output Q : Clock
    input CK : Clock
    input EN : UInt<1>
    input SE : UInt<1>
    
    defname = gated_latch
    
    
  module rvclkhdr_15 : 
    input clock : Clock
    input reset : Reset
    output io : {l1clk : Clock, flip clk : Clock, flip en : UInt<1>, flip scan_mode : UInt<1>}
    
    inst clkhdr of gated_latch_15 @[el2_lib.scala 474:26]
    clkhdr.SE is invalid
    clkhdr.EN is invalid
    clkhdr.CK is invalid
    clkhdr.Q is invalid
    io.l1clk <= clkhdr.Q @[el2_lib.scala 475:14]
    clkhdr.CK <= io.clk @[el2_lib.scala 476:18]
    clkhdr.EN <= io.en @[el2_lib.scala 477:18]
    clkhdr.SE <= io.scan_mode @[el2_lib.scala 478:18]
    
  module el2_dma_ctrl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip free_clk : Clock, flip dma_bus_clk_en : UInt<1>, flip clk_override : UInt<1>, flip scan_mode : UInt<1>, flip dbg_cmd_addr : UInt<32>, flip dbg_cmd_wrdata : UInt<32>, flip dbg_cmd_valid : UInt<1>, flip dbg_cmd_write : UInt<1>, flip dbg_cmd_type : UInt<2>, flip dbg_cmd_size : UInt<2>, flip dbg_dma_bubble : UInt<1>, dma_dbg_ready : UInt<1>, dma_dbg_cmd_done : UInt<1>, dma_dbg_cmd_fail : UInt<1>, dma_dbg_rddata : UInt<32>, dma_dccm_req : UInt<1>, dma_iccm_req : UInt<1>, dma_mem_tag : UInt<3>, dma_mem_addr : UInt<32>, dma_mem_sz : UInt<3>, dma_mem_write : UInt<1>, dma_mem_wdata : UInt<64>, flip dccm_dma_rvalid : UInt<1>, flip dccm_dma_ecc_error : UInt<1>, flip dccm_dma_rtag : UInt<3>, flip dccm_dma_rdata : UInt<64>, flip iccm_dma_rvalid : UInt<1>, flip iccm_dma_ecc_error : UInt<1>, flip iccm_dma_rtag : UInt<3>, flip iccm_dma_rdata : UInt<64>, dma_dccm_stall_any : UInt<1>, dma_iccm_stall_any : UInt<1>, flip dccm_ready : UInt<1>, flip iccm_ready : UInt<1>, flip dec_tlu_dma_qos_prty : UInt<3>, dma_pmu_dccm_read : UInt<1>, dma_pmu_dccm_write : UInt<1>, dma_pmu_any_read : UInt<1>, dma_pmu_any_write : UInt<1>, flip dma_axi_awvalid : UInt<1>, dma_axi_awready : UInt<1>, flip dma_axi_awid : UInt<1>, flip dma_axi_awaddr : UInt<32>, flip dma_axi_awsize : UInt<3>, flip dma_axi_wvalid : UInt<1>, dma_axi_wready : UInt<1>, flip dma_axi_wdata : UInt<64>, flip dma_axi_wstrb : UInt<8>, dma_axi_bvalid : UInt<1>, flip dma_axi_bready : UInt<1>, dma_axi_bresp : UInt<2>, dma_axi_bid : UInt<1>, flip dma_axi_arvalid : UInt<1>, dma_axi_arready : UInt<1>, flip dma_axi_arid : UInt<1>, flip dma_axi_araddr : UInt<32>, flip dma_axi_arsize : UInt<3>, dma_axi_rvalid : UInt<1>, flip dma_axi_rready : UInt<1>, dma_axi_rid : UInt<1>, dma_axi_rdata : UInt<64>, dma_axi_rresp : UInt<2>, dma_axi_rlast : UInt<1>}
    
    wire fifo_error : UInt<2>[5] @[el2_dma_ctrl.scala 92:24]
    wire fifo_error_bus : UInt<5>
    fifo_error_bus <= UInt<1>("h00")
    wire fifo_done : UInt<5>
    fifo_done <= UInt<1>("h00")
    wire fifo_addr : UInt<32>[5] @[el2_dma_ctrl.scala 98:23]
    wire fifo_sz : UInt<3>[5] @[el2_dma_ctrl.scala 100:21]
    wire fifo_byteen : UInt<8>[5] @[el2_dma_ctrl.scala 102:25]
    wire fifo_data : UInt<64>[5] @[el2_dma_ctrl.scala 104:23]
    wire fifo_tag : UInt<1>[5] @[el2_dma_ctrl.scala 106:22]
    wire fifo_mid : UInt<1>[5] @[el2_dma_ctrl.scala 108:22]
    wire fifo_prty : UInt<2>[5] @[el2_dma_ctrl.scala 110:23]
    wire fifo_error_en : UInt<5>
    fifo_error_en <= UInt<1>("h00")
    wire fifo_error_in : UInt<2>[5] @[el2_dma_ctrl.scala 114:27]
    wire fifo_data_in : UInt<64>[5] @[el2_dma_ctrl.scala 116:26]
    wire RspPtr : UInt<3>
    RspPtr <= UInt<1>("h00")
    wire WrPtr : UInt<3>
    WrPtr <= UInt<1>("h00")
    wire RdPtr : UInt<3>
    RdPtr <= UInt<1>("h00")
    wire NxtRspPtr : UInt<3>
    NxtRspPtr <= UInt<1>("h00")
    wire NxtWrPtr : UInt<3>
    NxtWrPtr <= UInt<1>("h00")
    wire NxtRdPtr : UInt<3>
    NxtRdPtr <= UInt<1>("h00")
    wire dma_dbg_cmd_error : UInt<1>
    dma_dbg_cmd_error <= UInt<1>("h00")
    wire dma_dbg_cmd_done_q : UInt<1>
    dma_dbg_cmd_done_q <= UInt<1>("h00")
    wire fifo_empty : UInt<1>
    fifo_empty <= UInt<1>("h00")
    wire dma_address_error : UInt<1>
    dma_address_error <= UInt<1>("h00")
    wire dma_alignment_error : UInt<1>
    dma_alignment_error <= UInt<1>("h00")
    wire num_fifo_vld : UInt<4>
    num_fifo_vld <= UInt<1>("h00")
    wire dma_mem_req : UInt<1>
    dma_mem_req <= UInt<1>("h00")
    wire dma_mem_addr_int : UInt<32>
    dma_mem_addr_int <= UInt<1>("h00")
    wire dma_mem_sz_int : UInt<3>
    dma_mem_sz_int <= UInt<1>("h00")
    wire dma_mem_byteen : UInt<8>
    dma_mem_byteen <= UInt<1>("h00")
    wire dma_nack_count : UInt<3>
    dma_nack_count <= UInt<1>("h00")
    wire dma_nack_count_csr : UInt<3>
    dma_nack_count_csr <= UInt<1>("h00")
    wire bus_rsp_valid : UInt<1>
    bus_rsp_valid <= UInt<1>("h00")
    wire bus_rsp_sent : UInt<1>
    bus_rsp_sent <= UInt<1>("h00")
    wire bus_cmd_valid : UInt<1>
    bus_cmd_valid <= UInt<1>("h00")
    wire axi_mstr_prty_en : UInt<1>
    axi_mstr_prty_en <= UInt<1>("h00")
    wire bus_cmd_write : UInt<1>
    bus_cmd_write <= UInt<1>("h00")
    wire bus_cmd_posted_write : UInt<1>
    bus_cmd_posted_write <= UInt<1>("h00")
    wire bus_cmd_byteen : UInt<8>
    bus_cmd_byteen <= UInt<1>("h00")
    wire bus_cmd_sz : UInt<3>
    bus_cmd_sz <= UInt<1>("h00")
    wire bus_cmd_addr : UInt<32>
    bus_cmd_addr <= UInt<1>("h00")
    wire bus_cmd_wdata : UInt<64>
    bus_cmd_wdata <= UInt<1>("h00")
    wire bus_cmd_tag : UInt<1>
    bus_cmd_tag <= UInt<1>("h00")
    wire bus_cmd_mid : UInt<1>
    bus_cmd_mid <= UInt<1>("h00")
    wire bus_cmd_prty : UInt<2>
    bus_cmd_prty <= UInt<1>("h00")
    wire bus_posted_write_done : UInt<1>
    bus_posted_write_done <= UInt<1>("h00")
    wire fifo_full : UInt<1>
    fifo_full <= UInt<1>("h00")
    wire dbg_dma_bubble_bus : UInt<1>
    dbg_dma_bubble_bus <= UInt<1>("h00")
    wire axi_mstr_priority : UInt<1>
    axi_mstr_priority <= UInt<1>("h00")
    wire axi_mstr_sel : UInt<1>
    axi_mstr_sel <= UInt<1>("h00")
    wire axi_rsp_sent : UInt<1>
    axi_rsp_sent <= UInt<1>("h00")
    wire fifo_cmd_en : UInt<5>
    fifo_cmd_en <= UInt<1>("h00")
    wire fifo_data_en : UInt<5>
    fifo_data_en <= UInt<1>("h00")
    wire fifo_pend_en : UInt<5>
    fifo_pend_en <= UInt<1>("h00")
    wire fifo_error_bus_en : UInt<5>
    fifo_error_bus_en <= UInt<1>("h00")
    wire fifo_done_en : UInt<5>
    fifo_done_en <= UInt<1>("h00")
    wire fifo_done_bus_en : UInt<5>
    fifo_done_bus_en <= UInt<1>("h00")
    wire fifo_reset : UInt<5>
    fifo_reset <= UInt<1>("h00")
    wire fifo_valid : UInt<5>
    fifo_valid <= UInt<1>("h00")
    wire fifo_rpend : UInt<5>
    fifo_rpend <= UInt<1>("h00")
    wire fifo_done_bus : UInt<5>
    fifo_done_bus <= UInt<1>("h00")
    wire fifo_write : UInt<5>
    fifo_write <= UInt<1>("h00")
    wire fifo_posted_write : UInt<5>
    fifo_posted_write <= UInt<1>("h00")
    wire fifo_dbg : UInt<5>
    fifo_dbg <= UInt<1>("h00")
    wire wrbuf_vld : UInt<1>
    wrbuf_vld <= UInt<1>("h00")
    wire wrbuf_data_vld : UInt<1>
    wrbuf_data_vld <= UInt<1>("h00")
    wire rdbuf_vld : UInt<1>
    rdbuf_vld <= UInt<1>("h00")
    wire dma_free_clk : Clock @[el2_dma_ctrl.scala 224:26]
    wire dma_bus_clk : Clock @[el2_dma_ctrl.scala 226:25]
    wire dma_buffer_c1_clk : Clock @[el2_dma_ctrl.scala 228:31]
    wire fifo_byteen_in : UInt<8>
    fifo_byteen_in <= UInt<1>("h00")
    node _T = bits(dma_mem_addr_int, 31, 0) @[el2_dma_ctrl.scala 237:95]
    node _T_1 = bits(_T, 31, 28) @[el2_lib.scala 496:27]
    node dma_mem_addr_in_dccm_region_nc = eq(_T_1, UInt<4>("h0f")) @[el2_lib.scala 496:49]
    wire dma_mem_addr_in_dccm : UInt<1> @[el2_lib.scala 497:26]
    node _T_2 = bits(_T, 31, 16) @[el2_lib.scala 501:24]
    node _T_3 = eq(_T_2, UInt<16>("h0f004")) @[el2_lib.scala 501:39]
    dma_mem_addr_in_dccm <= _T_3 @[el2_lib.scala 501:16]
    node _T_4 = bits(dma_mem_addr_int, 31, 0) @[el2_dma_ctrl.scala 241:93]
    node _T_5 = bits(_T_4, 31, 28) @[el2_lib.scala 496:27]
    node dma_mem_addr_in_pic_region_nc = eq(_T_5, UInt<4>("h0f")) @[el2_lib.scala 496:49]
    wire dma_mem_addr_in_pic : UInt<1> @[el2_lib.scala 497:26]
    node _T_6 = bits(_T_4, 31, 15) @[el2_lib.scala 501:24]
    node _T_7 = eq(_T_6, UInt<17>("h01e018")) @[el2_lib.scala 501:39]
    dma_mem_addr_in_pic <= _T_7 @[el2_lib.scala 501:16]
    node _T_8 = bits(dma_mem_addr_int, 31, 0) @[el2_dma_ctrl.scala 245:111]
    node _T_9 = bits(_T_8, 31, 28) @[el2_lib.scala 496:27]
    node dma_mem_addr_in_iccm_region_nc = eq(_T_9, UInt<4>("h0e")) @[el2_lib.scala 496:49]
    wire dma_mem_addr_in_iccm : UInt<1> @[el2_lib.scala 497:26]
    node _T_10 = bits(_T_8, 31, 16) @[el2_lib.scala 501:24]
    node _T_11 = eq(_T_10, UInt<16>("h0ee00")) @[el2_lib.scala 501:39]
    dma_mem_addr_in_iccm <= _T_11 @[el2_lib.scala 501:16]
    node _T_12 = bits(io.dbg_cmd_valid, 0, 0) @[el2_dma_ctrl.scala 249:51]
    node _T_13 = bits(io.dbg_cmd_addr, 31, 0) @[el2_dma_ctrl.scala 249:74]
    node _T_14 = bits(bus_cmd_addr, 31, 0) @[el2_dma_ctrl.scala 249:94]
    node fifo_addr_in = mux(_T_12, _T_13, _T_14) @[el2_dma_ctrl.scala 249:33]
    node _T_15 = bits(io.dbg_cmd_valid, 0, 0) @[el2_dma_ctrl.scala 251:52]
    node _T_16 = bits(io.dbg_cmd_addr, 2, 2) @[el2_dma_ctrl.scala 251:93]
    node _T_17 = mul(UInt<3>("h04"), _T_16) @[el2_dma_ctrl.scala 251:76]
    node _T_18 = dshl(UInt<4>("h0f"), _T_17) @[el2_dma_ctrl.scala 251:68]
    node _T_19 = bits(bus_cmd_byteen, 7, 0) @[el2_dma_ctrl.scala 251:113]
    node _T_20 = mux(_T_15, _T_18, _T_19) @[el2_dma_ctrl.scala 251:34]
    fifo_byteen_in <= _T_20 @[el2_dma_ctrl.scala 251:28]
    node _T_21 = bits(io.dbg_cmd_valid, 0, 0) @[el2_dma_ctrl.scala 253:51]
    node _T_22 = bits(io.dbg_cmd_size, 1, 0) @[el2_dma_ctrl.scala 253:83]
    node _T_23 = cat(UInt<1>("h00"), _T_22) @[Cat.scala 29:58]
    node _T_24 = bits(bus_cmd_sz, 2, 0) @[el2_dma_ctrl.scala 253:101]
    node fifo_sz_in = mux(_T_21, _T_23, _T_24) @[el2_dma_ctrl.scala 253:33]
    node _T_25 = bits(io.dbg_cmd_valid, 0, 0) @[el2_dma_ctrl.scala 255:51]
    node fifo_write_in = mux(_T_25, io.dbg_cmd_write, bus_cmd_write) @[el2_dma_ctrl.scala 255:33]
    node _T_26 = eq(io.dbg_cmd_valid, UInt<1>("h00")) @[el2_dma_ctrl.scala 257:30]
    node fifo_posted_write_in = and(_T_26, bus_cmd_posted_write) @[el2_dma_ctrl.scala 257:48]
    node _T_27 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 262:73]
    node _T_28 = and(_T_27, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 262:80]
    node _T_29 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 262:138]
    node _T_30 = bits(_T_29, 0, 0) @[el2_dma_ctrl.scala 262:142]
    node _T_31 = and(io.dbg_cmd_valid, _T_30) @[el2_dma_ctrl.scala 262:121]
    node _T_32 = or(_T_28, _T_31) @[el2_dma_ctrl.scala 262:101]
    node _T_33 = eq(UInt<1>("h00"), WrPtr) @[el2_dma_ctrl.scala 262:158]
    node _T_34 = and(_T_32, _T_33) @[el2_dma_ctrl.scala 262:151]
    node _T_35 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 262:73]
    node _T_36 = and(_T_35, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 262:80]
    node _T_37 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 262:138]
    node _T_38 = bits(_T_37, 0, 0) @[el2_dma_ctrl.scala 262:142]
    node _T_39 = and(io.dbg_cmd_valid, _T_38) @[el2_dma_ctrl.scala 262:121]
    node _T_40 = or(_T_36, _T_39) @[el2_dma_ctrl.scala 262:101]
    node _T_41 = eq(UInt<1>("h01"), WrPtr) @[el2_dma_ctrl.scala 262:158]
    node _T_42 = and(_T_40, _T_41) @[el2_dma_ctrl.scala 262:151]
    node _T_43 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 262:73]
    node _T_44 = and(_T_43, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 262:80]
    node _T_45 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 262:138]
    node _T_46 = bits(_T_45, 0, 0) @[el2_dma_ctrl.scala 262:142]
    node _T_47 = and(io.dbg_cmd_valid, _T_46) @[el2_dma_ctrl.scala 262:121]
    node _T_48 = or(_T_44, _T_47) @[el2_dma_ctrl.scala 262:101]
    node _T_49 = eq(UInt<2>("h02"), WrPtr) @[el2_dma_ctrl.scala 262:158]
    node _T_50 = and(_T_48, _T_49) @[el2_dma_ctrl.scala 262:151]
    node _T_51 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 262:73]
    node _T_52 = and(_T_51, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 262:80]
    node _T_53 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 262:138]
    node _T_54 = bits(_T_53, 0, 0) @[el2_dma_ctrl.scala 262:142]
    node _T_55 = and(io.dbg_cmd_valid, _T_54) @[el2_dma_ctrl.scala 262:121]
    node _T_56 = or(_T_52, _T_55) @[el2_dma_ctrl.scala 262:101]
    node _T_57 = eq(UInt<2>("h03"), WrPtr) @[el2_dma_ctrl.scala 262:158]
    node _T_58 = and(_T_56, _T_57) @[el2_dma_ctrl.scala 262:151]
    node _T_59 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 262:73]
    node _T_60 = and(_T_59, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 262:80]
    node _T_61 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 262:138]
    node _T_62 = bits(_T_61, 0, 0) @[el2_dma_ctrl.scala 262:142]
    node _T_63 = and(io.dbg_cmd_valid, _T_62) @[el2_dma_ctrl.scala 262:121]
    node _T_64 = or(_T_60, _T_63) @[el2_dma_ctrl.scala 262:101]
    node _T_65 = eq(UInt<3>("h04"), WrPtr) @[el2_dma_ctrl.scala 262:158]
    node _T_66 = and(_T_64, _T_65) @[el2_dma_ctrl.scala 262:151]
    node _T_67 = cat(_T_66, _T_58) @[Cat.scala 29:58]
    node _T_68 = cat(_T_67, _T_50) @[Cat.scala 29:58]
    node _T_69 = cat(_T_68, _T_42) @[Cat.scala 29:58]
    node _T_70 = cat(_T_69, _T_34) @[Cat.scala 29:58]
    fifo_cmd_en <= _T_70 @[el2_dma_ctrl.scala 262:21]
    node _T_71 = and(axi_mstr_prty_en, fifo_write_in) @[el2_dma_ctrl.scala 264:73]
    node _T_72 = and(_T_71, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 264:89]
    node _T_73 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 264:147]
    node _T_74 = and(io.dbg_cmd_valid, _T_73) @[el2_dma_ctrl.scala 264:130]
    node _T_75 = and(_T_74, io.dbg_cmd_write) @[el2_dma_ctrl.scala 264:151]
    node _T_76 = or(_T_72, _T_75) @[el2_dma_ctrl.scala 264:110]
    node _T_77 = eq(UInt<1>("h00"), WrPtr) @[el2_dma_ctrl.scala 264:179]
    node _T_78 = and(_T_76, _T_77) @[el2_dma_ctrl.scala 264:172]
    node _T_79 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 264:213]
    node _T_80 = eq(UInt<1>("h00"), RdPtr) @[el2_dma_ctrl.scala 264:243]
    node _T_81 = and(_T_79, _T_80) @[el2_dma_ctrl.scala 264:236]
    node _T_82 = or(_T_78, _T_81) @[el2_dma_ctrl.scala 264:191]
    node _T_83 = eq(UInt<1>("h00"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 264:284]
    node _T_84 = and(io.dccm_dma_rvalid, _T_83) @[el2_dma_ctrl.scala 264:277]
    node _T_85 = or(_T_82, _T_84) @[el2_dma_ctrl.scala 264:255]
    node _T_86 = eq(UInt<1>("h00"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 264:336]
    node _T_87 = and(io.iccm_dma_rvalid, _T_86) @[el2_dma_ctrl.scala 264:329]
    node _T_88 = or(_T_85, _T_87) @[el2_dma_ctrl.scala 264:307]
    node _T_89 = and(axi_mstr_prty_en, fifo_write_in) @[el2_dma_ctrl.scala 264:73]
    node _T_90 = and(_T_89, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 264:89]
    node _T_91 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 264:147]
    node _T_92 = and(io.dbg_cmd_valid, _T_91) @[el2_dma_ctrl.scala 264:130]
    node _T_93 = and(_T_92, io.dbg_cmd_write) @[el2_dma_ctrl.scala 264:151]
    node _T_94 = or(_T_90, _T_93) @[el2_dma_ctrl.scala 264:110]
    node _T_95 = eq(UInt<1>("h01"), WrPtr) @[el2_dma_ctrl.scala 264:179]
    node _T_96 = and(_T_94, _T_95) @[el2_dma_ctrl.scala 264:172]
    node _T_97 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 264:213]
    node _T_98 = eq(UInt<1>("h01"), RdPtr) @[el2_dma_ctrl.scala 264:243]
    node _T_99 = and(_T_97, _T_98) @[el2_dma_ctrl.scala 264:236]
    node _T_100 = or(_T_96, _T_99) @[el2_dma_ctrl.scala 264:191]
    node _T_101 = eq(UInt<1>("h01"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 264:284]
    node _T_102 = and(io.dccm_dma_rvalid, _T_101) @[el2_dma_ctrl.scala 264:277]
    node _T_103 = or(_T_100, _T_102) @[el2_dma_ctrl.scala 264:255]
    node _T_104 = eq(UInt<1>("h01"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 264:336]
    node _T_105 = and(io.iccm_dma_rvalid, _T_104) @[el2_dma_ctrl.scala 264:329]
    node _T_106 = or(_T_103, _T_105) @[el2_dma_ctrl.scala 264:307]
    node _T_107 = and(axi_mstr_prty_en, fifo_write_in) @[el2_dma_ctrl.scala 264:73]
    node _T_108 = and(_T_107, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 264:89]
    node _T_109 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 264:147]
    node _T_110 = and(io.dbg_cmd_valid, _T_109) @[el2_dma_ctrl.scala 264:130]
    node _T_111 = and(_T_110, io.dbg_cmd_write) @[el2_dma_ctrl.scala 264:151]
    node _T_112 = or(_T_108, _T_111) @[el2_dma_ctrl.scala 264:110]
    node _T_113 = eq(UInt<2>("h02"), WrPtr) @[el2_dma_ctrl.scala 264:179]
    node _T_114 = and(_T_112, _T_113) @[el2_dma_ctrl.scala 264:172]
    node _T_115 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 264:213]
    node _T_116 = eq(UInt<2>("h02"), RdPtr) @[el2_dma_ctrl.scala 264:243]
    node _T_117 = and(_T_115, _T_116) @[el2_dma_ctrl.scala 264:236]
    node _T_118 = or(_T_114, _T_117) @[el2_dma_ctrl.scala 264:191]
    node _T_119 = eq(UInt<2>("h02"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 264:284]
    node _T_120 = and(io.dccm_dma_rvalid, _T_119) @[el2_dma_ctrl.scala 264:277]
    node _T_121 = or(_T_118, _T_120) @[el2_dma_ctrl.scala 264:255]
    node _T_122 = eq(UInt<2>("h02"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 264:336]
    node _T_123 = and(io.iccm_dma_rvalid, _T_122) @[el2_dma_ctrl.scala 264:329]
    node _T_124 = or(_T_121, _T_123) @[el2_dma_ctrl.scala 264:307]
    node _T_125 = and(axi_mstr_prty_en, fifo_write_in) @[el2_dma_ctrl.scala 264:73]
    node _T_126 = and(_T_125, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 264:89]
    node _T_127 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 264:147]
    node _T_128 = and(io.dbg_cmd_valid, _T_127) @[el2_dma_ctrl.scala 264:130]
    node _T_129 = and(_T_128, io.dbg_cmd_write) @[el2_dma_ctrl.scala 264:151]
    node _T_130 = or(_T_126, _T_129) @[el2_dma_ctrl.scala 264:110]
    node _T_131 = eq(UInt<2>("h03"), WrPtr) @[el2_dma_ctrl.scala 264:179]
    node _T_132 = and(_T_130, _T_131) @[el2_dma_ctrl.scala 264:172]
    node _T_133 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 264:213]
    node _T_134 = eq(UInt<2>("h03"), RdPtr) @[el2_dma_ctrl.scala 264:243]
    node _T_135 = and(_T_133, _T_134) @[el2_dma_ctrl.scala 264:236]
    node _T_136 = or(_T_132, _T_135) @[el2_dma_ctrl.scala 264:191]
    node _T_137 = eq(UInt<2>("h03"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 264:284]
    node _T_138 = and(io.dccm_dma_rvalid, _T_137) @[el2_dma_ctrl.scala 264:277]
    node _T_139 = or(_T_136, _T_138) @[el2_dma_ctrl.scala 264:255]
    node _T_140 = eq(UInt<2>("h03"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 264:336]
    node _T_141 = and(io.iccm_dma_rvalid, _T_140) @[el2_dma_ctrl.scala 264:329]
    node _T_142 = or(_T_139, _T_141) @[el2_dma_ctrl.scala 264:307]
    node _T_143 = and(axi_mstr_prty_en, fifo_write_in) @[el2_dma_ctrl.scala 264:73]
    node _T_144 = and(_T_143, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 264:89]
    node _T_145 = bits(io.dbg_cmd_type, 1, 1) @[el2_dma_ctrl.scala 264:147]
    node _T_146 = and(io.dbg_cmd_valid, _T_145) @[el2_dma_ctrl.scala 264:130]
    node _T_147 = and(_T_146, io.dbg_cmd_write) @[el2_dma_ctrl.scala 264:151]
    node _T_148 = or(_T_144, _T_147) @[el2_dma_ctrl.scala 264:110]
    node _T_149 = eq(UInt<3>("h04"), WrPtr) @[el2_dma_ctrl.scala 264:179]
    node _T_150 = and(_T_148, _T_149) @[el2_dma_ctrl.scala 264:172]
    node _T_151 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 264:213]
    node _T_152 = eq(UInt<3>("h04"), RdPtr) @[el2_dma_ctrl.scala 264:243]
    node _T_153 = and(_T_151, _T_152) @[el2_dma_ctrl.scala 264:236]
    node _T_154 = or(_T_150, _T_153) @[el2_dma_ctrl.scala 264:191]
    node _T_155 = eq(UInt<3>("h04"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 264:284]
    node _T_156 = and(io.dccm_dma_rvalid, _T_155) @[el2_dma_ctrl.scala 264:277]
    node _T_157 = or(_T_154, _T_156) @[el2_dma_ctrl.scala 264:255]
    node _T_158 = eq(UInt<3>("h04"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 264:336]
    node _T_159 = and(io.iccm_dma_rvalid, _T_158) @[el2_dma_ctrl.scala 264:329]
    node _T_160 = or(_T_157, _T_159) @[el2_dma_ctrl.scala 264:307]
    node _T_161 = cat(_T_160, _T_142) @[Cat.scala 29:58]
    node _T_162 = cat(_T_161, _T_124) @[Cat.scala 29:58]
    node _T_163 = cat(_T_162, _T_106) @[Cat.scala 29:58]
    node _T_164 = cat(_T_163, _T_88) @[Cat.scala 29:58]
    fifo_data_en <= _T_164 @[el2_dma_ctrl.scala 264:21]
    node _T_165 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 266:75]
    node _T_166 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 266:96]
    node _T_167 = and(_T_165, _T_166) @[el2_dma_ctrl.scala 266:94]
    node _T_168 = eq(UInt<1>("h00"), RdPtr) @[el2_dma_ctrl.scala 266:121]
    node _T_169 = and(_T_167, _T_168) @[el2_dma_ctrl.scala 266:114]
    node _T_170 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 266:75]
    node _T_171 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 266:96]
    node _T_172 = and(_T_170, _T_171) @[el2_dma_ctrl.scala 266:94]
    node _T_173 = eq(UInt<1>("h01"), RdPtr) @[el2_dma_ctrl.scala 266:121]
    node _T_174 = and(_T_172, _T_173) @[el2_dma_ctrl.scala 266:114]
    node _T_175 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 266:75]
    node _T_176 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 266:96]
    node _T_177 = and(_T_175, _T_176) @[el2_dma_ctrl.scala 266:94]
    node _T_178 = eq(UInt<2>("h02"), RdPtr) @[el2_dma_ctrl.scala 266:121]
    node _T_179 = and(_T_177, _T_178) @[el2_dma_ctrl.scala 266:114]
    node _T_180 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 266:75]
    node _T_181 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 266:96]
    node _T_182 = and(_T_180, _T_181) @[el2_dma_ctrl.scala 266:94]
    node _T_183 = eq(UInt<2>("h03"), RdPtr) @[el2_dma_ctrl.scala 266:121]
    node _T_184 = and(_T_182, _T_183) @[el2_dma_ctrl.scala 266:114]
    node _T_185 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 266:75]
    node _T_186 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 266:96]
    node _T_187 = and(_T_185, _T_186) @[el2_dma_ctrl.scala 266:94]
    node _T_188 = eq(UInt<3>("h04"), RdPtr) @[el2_dma_ctrl.scala 266:121]
    node _T_189 = and(_T_187, _T_188) @[el2_dma_ctrl.scala 266:114]
    node _T_190 = cat(_T_189, _T_184) @[Cat.scala 29:58]
    node _T_191 = cat(_T_190, _T_179) @[Cat.scala 29:58]
    node _T_192 = cat(_T_191, _T_174) @[Cat.scala 29:58]
    node _T_193 = cat(_T_192, _T_169) @[Cat.scala 29:58]
    fifo_pend_en <= _T_193 @[el2_dma_ctrl.scala 266:21]
    node _T_194 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 268:78]
    node _T_195 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 268:107]
    node _T_196 = or(_T_194, _T_195) @[el2_dma_ctrl.scala 268:85]
    node _T_197 = or(_T_196, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 268:114]
    node _T_198 = eq(UInt<1>("h00"), RdPtr) @[el2_dma_ctrl.scala 268:142]
    node _T_199 = and(_T_197, _T_198) @[el2_dma_ctrl.scala 268:135]
    node _T_200 = and(io.dccm_dma_rvalid, io.dccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:177]
    node _T_201 = eq(UInt<1>("h00"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 268:209]
    node _T_202 = and(_T_200, _T_201) @[el2_dma_ctrl.scala 268:202]
    node _T_203 = or(_T_199, _T_202) @[el2_dma_ctrl.scala 268:154]
    node _T_204 = and(io.iccm_dma_rvalid, io.iccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:255]
    node _T_205 = eq(UInt<1>("h00"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 268:287]
    node _T_206 = and(_T_204, _T_205) @[el2_dma_ctrl.scala 268:280]
    node _T_207 = or(_T_203, _T_206) @[el2_dma_ctrl.scala 268:232]
    node _T_208 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 268:78]
    node _T_209 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 268:107]
    node _T_210 = or(_T_208, _T_209) @[el2_dma_ctrl.scala 268:85]
    node _T_211 = or(_T_210, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 268:114]
    node _T_212 = eq(UInt<1>("h01"), RdPtr) @[el2_dma_ctrl.scala 268:142]
    node _T_213 = and(_T_211, _T_212) @[el2_dma_ctrl.scala 268:135]
    node _T_214 = and(io.dccm_dma_rvalid, io.dccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:177]
    node _T_215 = eq(UInt<1>("h01"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 268:209]
    node _T_216 = and(_T_214, _T_215) @[el2_dma_ctrl.scala 268:202]
    node _T_217 = or(_T_213, _T_216) @[el2_dma_ctrl.scala 268:154]
    node _T_218 = and(io.iccm_dma_rvalid, io.iccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:255]
    node _T_219 = eq(UInt<1>("h01"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 268:287]
    node _T_220 = and(_T_218, _T_219) @[el2_dma_ctrl.scala 268:280]
    node _T_221 = or(_T_217, _T_220) @[el2_dma_ctrl.scala 268:232]
    node _T_222 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 268:78]
    node _T_223 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 268:107]
    node _T_224 = or(_T_222, _T_223) @[el2_dma_ctrl.scala 268:85]
    node _T_225 = or(_T_224, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 268:114]
    node _T_226 = eq(UInt<2>("h02"), RdPtr) @[el2_dma_ctrl.scala 268:142]
    node _T_227 = and(_T_225, _T_226) @[el2_dma_ctrl.scala 268:135]
    node _T_228 = and(io.dccm_dma_rvalid, io.dccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:177]
    node _T_229 = eq(UInt<2>("h02"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 268:209]
    node _T_230 = and(_T_228, _T_229) @[el2_dma_ctrl.scala 268:202]
    node _T_231 = or(_T_227, _T_230) @[el2_dma_ctrl.scala 268:154]
    node _T_232 = and(io.iccm_dma_rvalid, io.iccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:255]
    node _T_233 = eq(UInt<2>("h02"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 268:287]
    node _T_234 = and(_T_232, _T_233) @[el2_dma_ctrl.scala 268:280]
    node _T_235 = or(_T_231, _T_234) @[el2_dma_ctrl.scala 268:232]
    node _T_236 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 268:78]
    node _T_237 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 268:107]
    node _T_238 = or(_T_236, _T_237) @[el2_dma_ctrl.scala 268:85]
    node _T_239 = or(_T_238, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 268:114]
    node _T_240 = eq(UInt<2>("h03"), RdPtr) @[el2_dma_ctrl.scala 268:142]
    node _T_241 = and(_T_239, _T_240) @[el2_dma_ctrl.scala 268:135]
    node _T_242 = and(io.dccm_dma_rvalid, io.dccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:177]
    node _T_243 = eq(UInt<2>("h03"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 268:209]
    node _T_244 = and(_T_242, _T_243) @[el2_dma_ctrl.scala 268:202]
    node _T_245 = or(_T_241, _T_244) @[el2_dma_ctrl.scala 268:154]
    node _T_246 = and(io.iccm_dma_rvalid, io.iccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:255]
    node _T_247 = eq(UInt<2>("h03"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 268:287]
    node _T_248 = and(_T_246, _T_247) @[el2_dma_ctrl.scala 268:280]
    node _T_249 = or(_T_245, _T_248) @[el2_dma_ctrl.scala 268:232]
    node _T_250 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 268:78]
    node _T_251 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 268:107]
    node _T_252 = or(_T_250, _T_251) @[el2_dma_ctrl.scala 268:85]
    node _T_253 = or(_T_252, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 268:114]
    node _T_254 = eq(UInt<3>("h04"), RdPtr) @[el2_dma_ctrl.scala 268:142]
    node _T_255 = and(_T_253, _T_254) @[el2_dma_ctrl.scala 268:135]
    node _T_256 = and(io.dccm_dma_rvalid, io.dccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:177]
    node _T_257 = eq(UInt<3>("h04"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 268:209]
    node _T_258 = and(_T_256, _T_257) @[el2_dma_ctrl.scala 268:202]
    node _T_259 = or(_T_255, _T_258) @[el2_dma_ctrl.scala 268:154]
    node _T_260 = and(io.iccm_dma_rvalid, io.iccm_dma_ecc_error) @[el2_dma_ctrl.scala 268:255]
    node _T_261 = eq(UInt<3>("h04"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 268:287]
    node _T_262 = and(_T_260, _T_261) @[el2_dma_ctrl.scala 268:280]
    node _T_263 = or(_T_259, _T_262) @[el2_dma_ctrl.scala 268:232]
    node _T_264 = cat(_T_263, _T_249) @[Cat.scala 29:58]
    node _T_265 = cat(_T_264, _T_235) @[Cat.scala 29:58]
    node _T_266 = cat(_T_265, _T_221) @[Cat.scala 29:58]
    node _T_267 = cat(_T_266, _T_207) @[Cat.scala 29:58]
    fifo_error_en <= _T_267 @[el2_dma_ctrl.scala 268:21]
    node _T_268 = bits(fifo_error_in[0], 1, 0) @[el2_dma_ctrl.scala 270:77]
    node _T_269 = orr(_T_268) @[el2_dma_ctrl.scala 270:83]
    node _T_270 = bits(fifo_error_en, 0, 0) @[el2_dma_ctrl.scala 270:103]
    node _T_271 = and(_T_269, _T_270) @[el2_dma_ctrl.scala 270:88]
    node _T_272 = orr(fifo_error[0]) @[el2_dma_ctrl.scala 270:125]
    node _T_273 = or(_T_271, _T_272) @[el2_dma_ctrl.scala 270:108]
    node _T_274 = and(_T_273, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 270:131]
    node _T_275 = bits(fifo_error_in[1], 1, 0) @[el2_dma_ctrl.scala 270:77]
    node _T_276 = orr(_T_275) @[el2_dma_ctrl.scala 270:83]
    node _T_277 = bits(fifo_error_en, 1, 1) @[el2_dma_ctrl.scala 270:103]
    node _T_278 = and(_T_276, _T_277) @[el2_dma_ctrl.scala 270:88]
    node _T_279 = orr(fifo_error[1]) @[el2_dma_ctrl.scala 270:125]
    node _T_280 = or(_T_278, _T_279) @[el2_dma_ctrl.scala 270:108]
    node _T_281 = and(_T_280, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 270:131]
    node _T_282 = bits(fifo_error_in[2], 1, 0) @[el2_dma_ctrl.scala 270:77]
    node _T_283 = orr(_T_282) @[el2_dma_ctrl.scala 270:83]
    node _T_284 = bits(fifo_error_en, 2, 2) @[el2_dma_ctrl.scala 270:103]
    node _T_285 = and(_T_283, _T_284) @[el2_dma_ctrl.scala 270:88]
    node _T_286 = orr(fifo_error[2]) @[el2_dma_ctrl.scala 270:125]
    node _T_287 = or(_T_285, _T_286) @[el2_dma_ctrl.scala 270:108]
    node _T_288 = and(_T_287, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 270:131]
    node _T_289 = bits(fifo_error_in[3], 1, 0) @[el2_dma_ctrl.scala 270:77]
    node _T_290 = orr(_T_289) @[el2_dma_ctrl.scala 270:83]
    node _T_291 = bits(fifo_error_en, 3, 3) @[el2_dma_ctrl.scala 270:103]
    node _T_292 = and(_T_290, _T_291) @[el2_dma_ctrl.scala 270:88]
    node _T_293 = orr(fifo_error[3]) @[el2_dma_ctrl.scala 270:125]
    node _T_294 = or(_T_292, _T_293) @[el2_dma_ctrl.scala 270:108]
    node _T_295 = and(_T_294, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 270:131]
    node _T_296 = bits(fifo_error_in[4], 1, 0) @[el2_dma_ctrl.scala 270:77]
    node _T_297 = orr(_T_296) @[el2_dma_ctrl.scala 270:83]
    node _T_298 = bits(fifo_error_en, 4, 4) @[el2_dma_ctrl.scala 270:103]
    node _T_299 = and(_T_297, _T_298) @[el2_dma_ctrl.scala 270:88]
    node _T_300 = orr(fifo_error[4]) @[el2_dma_ctrl.scala 270:125]
    node _T_301 = or(_T_299, _T_300) @[el2_dma_ctrl.scala 270:108]
    node _T_302 = and(_T_301, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 270:131]
    node _T_303 = cat(_T_302, _T_295) @[Cat.scala 29:58]
    node _T_304 = cat(_T_303, _T_288) @[Cat.scala 29:58]
    node _T_305 = cat(_T_304, _T_281) @[Cat.scala 29:58]
    node _T_306 = cat(_T_305, _T_274) @[Cat.scala 29:58]
    fifo_error_bus_en <= _T_306 @[el2_dma_ctrl.scala 270:21]
    node _T_307 = orr(fifo_error[0]) @[el2_dma_ctrl.scala 272:74]
    node _T_308 = bits(fifo_error_en, 0, 0) @[el2_dma_ctrl.scala 272:93]
    node _T_309 = or(_T_307, _T_308) @[el2_dma_ctrl.scala 272:78]
    node _T_310 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 272:117]
    node _T_311 = and(_T_310, io.dma_mem_write) @[el2_dma_ctrl.scala 272:136]
    node _T_312 = or(_T_309, _T_311) @[el2_dma_ctrl.scala 272:97]
    node _T_313 = eq(UInt<1>("h00"), RdPtr) @[el2_dma_ctrl.scala 272:164]
    node _T_314 = and(_T_312, _T_313) @[el2_dma_ctrl.scala 272:157]
    node _T_315 = eq(UInt<1>("h00"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 272:205]
    node _T_316 = and(io.dccm_dma_rvalid, _T_315) @[el2_dma_ctrl.scala 272:198]
    node _T_317 = or(_T_314, _T_316) @[el2_dma_ctrl.scala 272:176]
    node _T_318 = eq(UInt<1>("h00"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 272:257]
    node _T_319 = and(io.iccm_dma_rvalid, _T_318) @[el2_dma_ctrl.scala 272:250]
    node _T_320 = or(_T_317, _T_319) @[el2_dma_ctrl.scala 272:228]
    node _T_321 = orr(fifo_error[1]) @[el2_dma_ctrl.scala 272:74]
    node _T_322 = bits(fifo_error_en, 1, 1) @[el2_dma_ctrl.scala 272:93]
    node _T_323 = or(_T_321, _T_322) @[el2_dma_ctrl.scala 272:78]
    node _T_324 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 272:117]
    node _T_325 = and(_T_324, io.dma_mem_write) @[el2_dma_ctrl.scala 272:136]
    node _T_326 = or(_T_323, _T_325) @[el2_dma_ctrl.scala 272:97]
    node _T_327 = eq(UInt<1>("h01"), RdPtr) @[el2_dma_ctrl.scala 272:164]
    node _T_328 = and(_T_326, _T_327) @[el2_dma_ctrl.scala 272:157]
    node _T_329 = eq(UInt<1>("h01"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 272:205]
    node _T_330 = and(io.dccm_dma_rvalid, _T_329) @[el2_dma_ctrl.scala 272:198]
    node _T_331 = or(_T_328, _T_330) @[el2_dma_ctrl.scala 272:176]
    node _T_332 = eq(UInt<1>("h01"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 272:257]
    node _T_333 = and(io.iccm_dma_rvalid, _T_332) @[el2_dma_ctrl.scala 272:250]
    node _T_334 = or(_T_331, _T_333) @[el2_dma_ctrl.scala 272:228]
    node _T_335 = orr(fifo_error[2]) @[el2_dma_ctrl.scala 272:74]
    node _T_336 = bits(fifo_error_en, 2, 2) @[el2_dma_ctrl.scala 272:93]
    node _T_337 = or(_T_335, _T_336) @[el2_dma_ctrl.scala 272:78]
    node _T_338 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 272:117]
    node _T_339 = and(_T_338, io.dma_mem_write) @[el2_dma_ctrl.scala 272:136]
    node _T_340 = or(_T_337, _T_339) @[el2_dma_ctrl.scala 272:97]
    node _T_341 = eq(UInt<2>("h02"), RdPtr) @[el2_dma_ctrl.scala 272:164]
    node _T_342 = and(_T_340, _T_341) @[el2_dma_ctrl.scala 272:157]
    node _T_343 = eq(UInt<2>("h02"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 272:205]
    node _T_344 = and(io.dccm_dma_rvalid, _T_343) @[el2_dma_ctrl.scala 272:198]
    node _T_345 = or(_T_342, _T_344) @[el2_dma_ctrl.scala 272:176]
    node _T_346 = eq(UInt<2>("h02"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 272:257]
    node _T_347 = and(io.iccm_dma_rvalid, _T_346) @[el2_dma_ctrl.scala 272:250]
    node _T_348 = or(_T_345, _T_347) @[el2_dma_ctrl.scala 272:228]
    node _T_349 = orr(fifo_error[3]) @[el2_dma_ctrl.scala 272:74]
    node _T_350 = bits(fifo_error_en, 3, 3) @[el2_dma_ctrl.scala 272:93]
    node _T_351 = or(_T_349, _T_350) @[el2_dma_ctrl.scala 272:78]
    node _T_352 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 272:117]
    node _T_353 = and(_T_352, io.dma_mem_write) @[el2_dma_ctrl.scala 272:136]
    node _T_354 = or(_T_351, _T_353) @[el2_dma_ctrl.scala 272:97]
    node _T_355 = eq(UInt<2>("h03"), RdPtr) @[el2_dma_ctrl.scala 272:164]
    node _T_356 = and(_T_354, _T_355) @[el2_dma_ctrl.scala 272:157]
    node _T_357 = eq(UInt<2>("h03"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 272:205]
    node _T_358 = and(io.dccm_dma_rvalid, _T_357) @[el2_dma_ctrl.scala 272:198]
    node _T_359 = or(_T_356, _T_358) @[el2_dma_ctrl.scala 272:176]
    node _T_360 = eq(UInt<2>("h03"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 272:257]
    node _T_361 = and(io.iccm_dma_rvalid, _T_360) @[el2_dma_ctrl.scala 272:250]
    node _T_362 = or(_T_359, _T_361) @[el2_dma_ctrl.scala 272:228]
    node _T_363 = orr(fifo_error[4]) @[el2_dma_ctrl.scala 272:74]
    node _T_364 = bits(fifo_error_en, 4, 4) @[el2_dma_ctrl.scala 272:93]
    node _T_365 = or(_T_363, _T_364) @[el2_dma_ctrl.scala 272:78]
    node _T_366 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 272:117]
    node _T_367 = and(_T_366, io.dma_mem_write) @[el2_dma_ctrl.scala 272:136]
    node _T_368 = or(_T_365, _T_367) @[el2_dma_ctrl.scala 272:97]
    node _T_369 = eq(UInt<3>("h04"), RdPtr) @[el2_dma_ctrl.scala 272:164]
    node _T_370 = and(_T_368, _T_369) @[el2_dma_ctrl.scala 272:157]
    node _T_371 = eq(UInt<3>("h04"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 272:205]
    node _T_372 = and(io.dccm_dma_rvalid, _T_371) @[el2_dma_ctrl.scala 272:198]
    node _T_373 = or(_T_370, _T_372) @[el2_dma_ctrl.scala 272:176]
    node _T_374 = eq(UInt<3>("h04"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 272:257]
    node _T_375 = and(io.iccm_dma_rvalid, _T_374) @[el2_dma_ctrl.scala 272:250]
    node _T_376 = or(_T_373, _T_375) @[el2_dma_ctrl.scala 272:228]
    node _T_377 = cat(_T_376, _T_362) @[Cat.scala 29:58]
    node _T_378 = cat(_T_377, _T_348) @[Cat.scala 29:58]
    node _T_379 = cat(_T_378, _T_334) @[Cat.scala 29:58]
    node _T_380 = cat(_T_379, _T_320) @[Cat.scala 29:58]
    fifo_done_en <= _T_380 @[el2_dma_ctrl.scala 272:21]
    node _T_381 = bits(fifo_done_en, 0, 0) @[el2_dma_ctrl.scala 274:71]
    node _T_382 = bits(fifo_done, 0, 0) @[el2_dma_ctrl.scala 274:86]
    node _T_383 = or(_T_381, _T_382) @[el2_dma_ctrl.scala 274:75]
    node _T_384 = and(_T_383, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 274:91]
    node _T_385 = bits(fifo_done_en, 1, 1) @[el2_dma_ctrl.scala 274:71]
    node _T_386 = bits(fifo_done, 1, 1) @[el2_dma_ctrl.scala 274:86]
    node _T_387 = or(_T_385, _T_386) @[el2_dma_ctrl.scala 274:75]
    node _T_388 = and(_T_387, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 274:91]
    node _T_389 = bits(fifo_done_en, 2, 2) @[el2_dma_ctrl.scala 274:71]
    node _T_390 = bits(fifo_done, 2, 2) @[el2_dma_ctrl.scala 274:86]
    node _T_391 = or(_T_389, _T_390) @[el2_dma_ctrl.scala 274:75]
    node _T_392 = and(_T_391, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 274:91]
    node _T_393 = bits(fifo_done_en, 3, 3) @[el2_dma_ctrl.scala 274:71]
    node _T_394 = bits(fifo_done, 3, 3) @[el2_dma_ctrl.scala 274:86]
    node _T_395 = or(_T_393, _T_394) @[el2_dma_ctrl.scala 274:75]
    node _T_396 = and(_T_395, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 274:91]
    node _T_397 = bits(fifo_done_en, 4, 4) @[el2_dma_ctrl.scala 274:71]
    node _T_398 = bits(fifo_done, 4, 4) @[el2_dma_ctrl.scala 274:86]
    node _T_399 = or(_T_397, _T_398) @[el2_dma_ctrl.scala 274:75]
    node _T_400 = and(_T_399, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 274:91]
    node _T_401 = cat(_T_400, _T_396) @[Cat.scala 29:58]
    node _T_402 = cat(_T_401, _T_392) @[Cat.scala 29:58]
    node _T_403 = cat(_T_402, _T_388) @[Cat.scala 29:58]
    node _T_404 = cat(_T_403, _T_384) @[Cat.scala 29:58]
    fifo_done_bus_en <= _T_404 @[el2_dma_ctrl.scala 274:21]
    node _T_405 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 276:74]
    node _T_406 = and(_T_405, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 276:99]
    node _T_407 = or(_T_406, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 276:120]
    node _T_408 = eq(UInt<1>("h00"), RspPtr) @[el2_dma_ctrl.scala 276:150]
    node _T_409 = and(_T_407, _T_408) @[el2_dma_ctrl.scala 276:143]
    node _T_410 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 276:74]
    node _T_411 = and(_T_410, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 276:99]
    node _T_412 = or(_T_411, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 276:120]
    node _T_413 = eq(UInt<1>("h01"), RspPtr) @[el2_dma_ctrl.scala 276:150]
    node _T_414 = and(_T_412, _T_413) @[el2_dma_ctrl.scala 276:143]
    node _T_415 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 276:74]
    node _T_416 = and(_T_415, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 276:99]
    node _T_417 = or(_T_416, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 276:120]
    node _T_418 = eq(UInt<2>("h02"), RspPtr) @[el2_dma_ctrl.scala 276:150]
    node _T_419 = and(_T_417, _T_418) @[el2_dma_ctrl.scala 276:143]
    node _T_420 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 276:74]
    node _T_421 = and(_T_420, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 276:99]
    node _T_422 = or(_T_421, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 276:120]
    node _T_423 = eq(UInt<2>("h03"), RspPtr) @[el2_dma_ctrl.scala 276:150]
    node _T_424 = and(_T_422, _T_423) @[el2_dma_ctrl.scala 276:143]
    node _T_425 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 276:74]
    node _T_426 = and(_T_425, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 276:99]
    node _T_427 = or(_T_426, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 276:120]
    node _T_428 = eq(UInt<3>("h04"), RspPtr) @[el2_dma_ctrl.scala 276:150]
    node _T_429 = and(_T_427, _T_428) @[el2_dma_ctrl.scala 276:143]
    node _T_430 = cat(_T_429, _T_424) @[Cat.scala 29:58]
    node _T_431 = cat(_T_430, _T_419) @[Cat.scala 29:58]
    node _T_432 = cat(_T_431, _T_414) @[Cat.scala 29:58]
    node _T_433 = cat(_T_432, _T_409) @[Cat.scala 29:58]
    fifo_reset <= _T_433 @[el2_dma_ctrl.scala 276:21]
    node _T_434 = eq(UInt<1>("h00"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 278:87]
    node _T_435 = and(io.dccm_dma_rvalid, _T_434) @[el2_dma_ctrl.scala 278:80]
    node _T_436 = cat(UInt<1>("h00"), io.dccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_437 = eq(UInt<1>("h00"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 278:173]
    node _T_438 = and(io.iccm_dma_rvalid, _T_437) @[el2_dma_ctrl.scala 278:166]
    node _T_439 = cat(UInt<1>("h00"), io.iccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_440 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 278:255]
    node _T_441 = or(_T_440, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 278:277]
    node _T_442 = cat(_T_441, dma_alignment_error) @[Cat.scala 29:58]
    node _T_443 = mux(_T_438, _T_439, _T_442) @[el2_dma_ctrl.scala 278:146]
    node _T_444 = mux(_T_435, _T_436, _T_443) @[el2_dma_ctrl.scala 278:60]
    fifo_error_in[0] <= _T_444 @[el2_dma_ctrl.scala 278:53]
    node _T_445 = eq(UInt<1>("h01"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 278:87]
    node _T_446 = and(io.dccm_dma_rvalid, _T_445) @[el2_dma_ctrl.scala 278:80]
    node _T_447 = cat(UInt<1>("h00"), io.dccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_448 = eq(UInt<1>("h01"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 278:173]
    node _T_449 = and(io.iccm_dma_rvalid, _T_448) @[el2_dma_ctrl.scala 278:166]
    node _T_450 = cat(UInt<1>("h00"), io.iccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_451 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 278:255]
    node _T_452 = or(_T_451, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 278:277]
    node _T_453 = cat(_T_452, dma_alignment_error) @[Cat.scala 29:58]
    node _T_454 = mux(_T_449, _T_450, _T_453) @[el2_dma_ctrl.scala 278:146]
    node _T_455 = mux(_T_446, _T_447, _T_454) @[el2_dma_ctrl.scala 278:60]
    fifo_error_in[1] <= _T_455 @[el2_dma_ctrl.scala 278:53]
    node _T_456 = eq(UInt<2>("h02"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 278:87]
    node _T_457 = and(io.dccm_dma_rvalid, _T_456) @[el2_dma_ctrl.scala 278:80]
    node _T_458 = cat(UInt<1>("h00"), io.dccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_459 = eq(UInt<2>("h02"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 278:173]
    node _T_460 = and(io.iccm_dma_rvalid, _T_459) @[el2_dma_ctrl.scala 278:166]
    node _T_461 = cat(UInt<1>("h00"), io.iccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_462 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 278:255]
    node _T_463 = or(_T_462, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 278:277]
    node _T_464 = cat(_T_463, dma_alignment_error) @[Cat.scala 29:58]
    node _T_465 = mux(_T_460, _T_461, _T_464) @[el2_dma_ctrl.scala 278:146]
    node _T_466 = mux(_T_457, _T_458, _T_465) @[el2_dma_ctrl.scala 278:60]
    fifo_error_in[2] <= _T_466 @[el2_dma_ctrl.scala 278:53]
    node _T_467 = eq(UInt<2>("h03"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 278:87]
    node _T_468 = and(io.dccm_dma_rvalid, _T_467) @[el2_dma_ctrl.scala 278:80]
    node _T_469 = cat(UInt<1>("h00"), io.dccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_470 = eq(UInt<2>("h03"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 278:173]
    node _T_471 = and(io.iccm_dma_rvalid, _T_470) @[el2_dma_ctrl.scala 278:166]
    node _T_472 = cat(UInt<1>("h00"), io.iccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_473 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 278:255]
    node _T_474 = or(_T_473, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 278:277]
    node _T_475 = cat(_T_474, dma_alignment_error) @[Cat.scala 29:58]
    node _T_476 = mux(_T_471, _T_472, _T_475) @[el2_dma_ctrl.scala 278:146]
    node _T_477 = mux(_T_468, _T_469, _T_476) @[el2_dma_ctrl.scala 278:60]
    fifo_error_in[3] <= _T_477 @[el2_dma_ctrl.scala 278:53]
    node _T_478 = eq(UInt<3>("h04"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 278:87]
    node _T_479 = and(io.dccm_dma_rvalid, _T_478) @[el2_dma_ctrl.scala 278:80]
    node _T_480 = cat(UInt<1>("h00"), io.dccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_481 = eq(UInt<3>("h04"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 278:173]
    node _T_482 = and(io.iccm_dma_rvalid, _T_481) @[el2_dma_ctrl.scala 278:166]
    node _T_483 = cat(UInt<1>("h00"), io.iccm_dma_ecc_error) @[Cat.scala 29:58]
    node _T_484 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 278:255]
    node _T_485 = or(_T_484, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 278:277]
    node _T_486 = cat(_T_485, dma_alignment_error) @[Cat.scala 29:58]
    node _T_487 = mux(_T_482, _T_483, _T_486) @[el2_dma_ctrl.scala 278:146]
    node _T_488 = mux(_T_479, _T_480, _T_487) @[el2_dma_ctrl.scala 278:60]
    fifo_error_in[4] <= _T_488 @[el2_dma_ctrl.scala 278:53]
    node _T_489 = bits(fifo_error_en, 0, 0) @[el2_dma_ctrl.scala 280:73]
    node _T_490 = orr(fifo_error_in[0]) @[el2_dma_ctrl.scala 280:97]
    node _T_491 = and(_T_489, _T_490) @[el2_dma_ctrl.scala 280:77]
    node _T_492 = mux(UInt<1>("h00"), UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_493 = cat(_T_492, fifo_addr[0]) @[Cat.scala 29:58]
    node _T_494 = eq(UInt<1>("h00"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 280:167]
    node _T_495 = and(io.dccm_dma_rvalid, _T_494) @[el2_dma_ctrl.scala 280:160]
    node _T_496 = eq(UInt<1>("h00"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 280:239]
    node _T_497 = and(io.iccm_dma_rvalid, _T_496) @[el2_dma_ctrl.scala 280:232]
    node _T_498 = cat(io.dbg_cmd_wrdata, io.dbg_cmd_wrdata) @[Cat.scala 29:58]
    node _T_499 = bits(bus_cmd_wdata, 63, 0) @[el2_dma_ctrl.scala 280:344]
    node _T_500 = mux(io.dbg_cmd_valid, _T_498, _T_499) @[el2_dma_ctrl.scala 280:284]
    node _T_501 = mux(_T_497, io.iccm_dma_rdata, _T_500) @[el2_dma_ctrl.scala 280:212]
    node _T_502 = mux(_T_495, io.dccm_dma_rdata, _T_501) @[el2_dma_ctrl.scala 280:140]
    node _T_503 = mux(_T_491, _T_493, _T_502) @[el2_dma_ctrl.scala 280:59]
    fifo_data_in[0] <= _T_503 @[el2_dma_ctrl.scala 280:52]
    node _T_504 = bits(fifo_error_en, 1, 1) @[el2_dma_ctrl.scala 280:73]
    node _T_505 = orr(fifo_error_in[1]) @[el2_dma_ctrl.scala 280:97]
    node _T_506 = and(_T_504, _T_505) @[el2_dma_ctrl.scala 280:77]
    node _T_507 = mux(UInt<1>("h00"), UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_508 = cat(_T_507, fifo_addr[1]) @[Cat.scala 29:58]
    node _T_509 = eq(UInt<1>("h01"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 280:167]
    node _T_510 = and(io.dccm_dma_rvalid, _T_509) @[el2_dma_ctrl.scala 280:160]
    node _T_511 = eq(UInt<1>("h01"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 280:239]
    node _T_512 = and(io.iccm_dma_rvalid, _T_511) @[el2_dma_ctrl.scala 280:232]
    node _T_513 = cat(io.dbg_cmd_wrdata, io.dbg_cmd_wrdata) @[Cat.scala 29:58]
    node _T_514 = bits(bus_cmd_wdata, 63, 0) @[el2_dma_ctrl.scala 280:344]
    node _T_515 = mux(io.dbg_cmd_valid, _T_513, _T_514) @[el2_dma_ctrl.scala 280:284]
    node _T_516 = mux(_T_512, io.iccm_dma_rdata, _T_515) @[el2_dma_ctrl.scala 280:212]
    node _T_517 = mux(_T_510, io.dccm_dma_rdata, _T_516) @[el2_dma_ctrl.scala 280:140]
    node _T_518 = mux(_T_506, _T_508, _T_517) @[el2_dma_ctrl.scala 280:59]
    fifo_data_in[1] <= _T_518 @[el2_dma_ctrl.scala 280:52]
    node _T_519 = bits(fifo_error_en, 2, 2) @[el2_dma_ctrl.scala 280:73]
    node _T_520 = orr(fifo_error_in[2]) @[el2_dma_ctrl.scala 280:97]
    node _T_521 = and(_T_519, _T_520) @[el2_dma_ctrl.scala 280:77]
    node _T_522 = mux(UInt<1>("h00"), UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_523 = cat(_T_522, fifo_addr[2]) @[Cat.scala 29:58]
    node _T_524 = eq(UInt<2>("h02"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 280:167]
    node _T_525 = and(io.dccm_dma_rvalid, _T_524) @[el2_dma_ctrl.scala 280:160]
    node _T_526 = eq(UInt<2>("h02"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 280:239]
    node _T_527 = and(io.iccm_dma_rvalid, _T_526) @[el2_dma_ctrl.scala 280:232]
    node _T_528 = cat(io.dbg_cmd_wrdata, io.dbg_cmd_wrdata) @[Cat.scala 29:58]
    node _T_529 = bits(bus_cmd_wdata, 63, 0) @[el2_dma_ctrl.scala 280:344]
    node _T_530 = mux(io.dbg_cmd_valid, _T_528, _T_529) @[el2_dma_ctrl.scala 280:284]
    node _T_531 = mux(_T_527, io.iccm_dma_rdata, _T_530) @[el2_dma_ctrl.scala 280:212]
    node _T_532 = mux(_T_525, io.dccm_dma_rdata, _T_531) @[el2_dma_ctrl.scala 280:140]
    node _T_533 = mux(_T_521, _T_523, _T_532) @[el2_dma_ctrl.scala 280:59]
    fifo_data_in[2] <= _T_533 @[el2_dma_ctrl.scala 280:52]
    node _T_534 = bits(fifo_error_en, 3, 3) @[el2_dma_ctrl.scala 280:73]
    node _T_535 = orr(fifo_error_in[3]) @[el2_dma_ctrl.scala 280:97]
    node _T_536 = and(_T_534, _T_535) @[el2_dma_ctrl.scala 280:77]
    node _T_537 = mux(UInt<1>("h00"), UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_538 = cat(_T_537, fifo_addr[3]) @[Cat.scala 29:58]
    node _T_539 = eq(UInt<2>("h03"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 280:167]
    node _T_540 = and(io.dccm_dma_rvalid, _T_539) @[el2_dma_ctrl.scala 280:160]
    node _T_541 = eq(UInt<2>("h03"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 280:239]
    node _T_542 = and(io.iccm_dma_rvalid, _T_541) @[el2_dma_ctrl.scala 280:232]
    node _T_543 = cat(io.dbg_cmd_wrdata, io.dbg_cmd_wrdata) @[Cat.scala 29:58]
    node _T_544 = bits(bus_cmd_wdata, 63, 0) @[el2_dma_ctrl.scala 280:344]
    node _T_545 = mux(io.dbg_cmd_valid, _T_543, _T_544) @[el2_dma_ctrl.scala 280:284]
    node _T_546 = mux(_T_542, io.iccm_dma_rdata, _T_545) @[el2_dma_ctrl.scala 280:212]
    node _T_547 = mux(_T_540, io.dccm_dma_rdata, _T_546) @[el2_dma_ctrl.scala 280:140]
    node _T_548 = mux(_T_536, _T_538, _T_547) @[el2_dma_ctrl.scala 280:59]
    fifo_data_in[3] <= _T_548 @[el2_dma_ctrl.scala 280:52]
    node _T_549 = bits(fifo_error_en, 4, 4) @[el2_dma_ctrl.scala 280:73]
    node _T_550 = orr(fifo_error_in[4]) @[el2_dma_ctrl.scala 280:97]
    node _T_551 = and(_T_549, _T_550) @[el2_dma_ctrl.scala 280:77]
    node _T_552 = mux(UInt<1>("h00"), UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_553 = cat(_T_552, fifo_addr[4]) @[Cat.scala 29:58]
    node _T_554 = eq(UInt<3>("h04"), io.dccm_dma_rtag) @[el2_dma_ctrl.scala 280:167]
    node _T_555 = and(io.dccm_dma_rvalid, _T_554) @[el2_dma_ctrl.scala 280:160]
    node _T_556 = eq(UInt<3>("h04"), io.iccm_dma_rtag) @[el2_dma_ctrl.scala 280:239]
    node _T_557 = and(io.iccm_dma_rvalid, _T_556) @[el2_dma_ctrl.scala 280:232]
    node _T_558 = cat(io.dbg_cmd_wrdata, io.dbg_cmd_wrdata) @[Cat.scala 29:58]
    node _T_559 = bits(bus_cmd_wdata, 63, 0) @[el2_dma_ctrl.scala 280:344]
    node _T_560 = mux(io.dbg_cmd_valid, _T_558, _T_559) @[el2_dma_ctrl.scala 280:284]
    node _T_561 = mux(_T_557, io.iccm_dma_rdata, _T_560) @[el2_dma_ctrl.scala 280:212]
    node _T_562 = mux(_T_555, io.dccm_dma_rdata, _T_561) @[el2_dma_ctrl.scala 280:140]
    node _T_563 = mux(_T_551, _T_553, _T_562) @[el2_dma_ctrl.scala 280:59]
    fifo_data_in[4] <= _T_563 @[el2_dma_ctrl.scala 280:52]
    node _T_564 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 282:98]
    node _T_565 = bits(fifo_valid, 0, 0) @[el2_dma_ctrl.scala 282:118]
    node _T_566 = mux(_T_564, UInt<1>("h01"), _T_565) @[el2_dma_ctrl.scala 282:86]
    node _T_567 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 282:136]
    node _T_568 = eq(_T_567, UInt<1>("h00")) @[el2_dma_ctrl.scala 282:125]
    node _T_569 = and(_T_566, _T_568) @[el2_dma_ctrl.scala 282:123]
    reg _T_570 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 282:82]
    _T_570 <= _T_569 @[el2_dma_ctrl.scala 282:82]
    node _T_571 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 282:98]
    node _T_572 = bits(fifo_valid, 1, 1) @[el2_dma_ctrl.scala 282:118]
    node _T_573 = mux(_T_571, UInt<1>("h01"), _T_572) @[el2_dma_ctrl.scala 282:86]
    node _T_574 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 282:136]
    node _T_575 = eq(_T_574, UInt<1>("h00")) @[el2_dma_ctrl.scala 282:125]
    node _T_576 = and(_T_573, _T_575) @[el2_dma_ctrl.scala 282:123]
    reg _T_577 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 282:82]
    _T_577 <= _T_576 @[el2_dma_ctrl.scala 282:82]
    node _T_578 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 282:98]
    node _T_579 = bits(fifo_valid, 2, 2) @[el2_dma_ctrl.scala 282:118]
    node _T_580 = mux(_T_578, UInt<1>("h01"), _T_579) @[el2_dma_ctrl.scala 282:86]
    node _T_581 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 282:136]
    node _T_582 = eq(_T_581, UInt<1>("h00")) @[el2_dma_ctrl.scala 282:125]
    node _T_583 = and(_T_580, _T_582) @[el2_dma_ctrl.scala 282:123]
    reg _T_584 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 282:82]
    _T_584 <= _T_583 @[el2_dma_ctrl.scala 282:82]
    node _T_585 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 282:98]
    node _T_586 = bits(fifo_valid, 3, 3) @[el2_dma_ctrl.scala 282:118]
    node _T_587 = mux(_T_585, UInt<1>("h01"), _T_586) @[el2_dma_ctrl.scala 282:86]
    node _T_588 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 282:136]
    node _T_589 = eq(_T_588, UInt<1>("h00")) @[el2_dma_ctrl.scala 282:125]
    node _T_590 = and(_T_587, _T_589) @[el2_dma_ctrl.scala 282:123]
    reg _T_591 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 282:82]
    _T_591 <= _T_590 @[el2_dma_ctrl.scala 282:82]
    node _T_592 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 282:98]
    node _T_593 = bits(fifo_valid, 4, 4) @[el2_dma_ctrl.scala 282:118]
    node _T_594 = mux(_T_592, UInt<1>("h01"), _T_593) @[el2_dma_ctrl.scala 282:86]
    node _T_595 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 282:136]
    node _T_596 = eq(_T_595, UInt<1>("h00")) @[el2_dma_ctrl.scala 282:125]
    node _T_597 = and(_T_594, _T_596) @[el2_dma_ctrl.scala 282:123]
    reg _T_598 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 282:82]
    _T_598 <= _T_597 @[el2_dma_ctrl.scala 282:82]
    node _T_599 = cat(_T_598, _T_591) @[Cat.scala 29:58]
    node _T_600 = cat(_T_599, _T_584) @[Cat.scala 29:58]
    node _T_601 = cat(_T_600, _T_577) @[Cat.scala 29:58]
    node _T_602 = cat(_T_601, _T_570) @[Cat.scala 29:58]
    fifo_valid <= _T_602 @[el2_dma_ctrl.scala 282:14]
    node _T_603 = bits(fifo_error_en, 0, 0) @[el2_dma_ctrl.scala 284:103]
    node _T_604 = bits(_T_603, 0, 0) @[el2_dma_ctrl.scala 284:113]
    node _T_605 = mux(_T_604, fifo_error_in[0], fifo_error[0]) @[el2_dma_ctrl.scala 284:89]
    node _T_606 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 284:196]
    node _T_607 = eq(_T_606, UInt<1>("h00")) @[el2_dma_ctrl.scala 284:185]
    node _T_608 = bits(_T_607, 0, 0) @[Bitwise.scala 72:15]
    node _T_609 = mux(_T_608, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_610 = and(_T_605, _T_609) @[el2_dma_ctrl.scala 284:150]
    reg _T_611 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 284:85]
    _T_611 <= _T_610 @[el2_dma_ctrl.scala 284:85]
    fifo_error[0] <= _T_611 @[el2_dma_ctrl.scala 284:50]
    node _T_612 = bits(fifo_error_en, 1, 1) @[el2_dma_ctrl.scala 284:103]
    node _T_613 = bits(_T_612, 0, 0) @[el2_dma_ctrl.scala 284:113]
    node _T_614 = mux(_T_613, fifo_error_in[1], fifo_error[1]) @[el2_dma_ctrl.scala 284:89]
    node _T_615 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 284:196]
    node _T_616 = eq(_T_615, UInt<1>("h00")) @[el2_dma_ctrl.scala 284:185]
    node _T_617 = bits(_T_616, 0, 0) @[Bitwise.scala 72:15]
    node _T_618 = mux(_T_617, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_619 = and(_T_614, _T_618) @[el2_dma_ctrl.scala 284:150]
    reg _T_620 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 284:85]
    _T_620 <= _T_619 @[el2_dma_ctrl.scala 284:85]
    fifo_error[1] <= _T_620 @[el2_dma_ctrl.scala 284:50]
    node _T_621 = bits(fifo_error_en, 2, 2) @[el2_dma_ctrl.scala 284:103]
    node _T_622 = bits(_T_621, 0, 0) @[el2_dma_ctrl.scala 284:113]
    node _T_623 = mux(_T_622, fifo_error_in[2], fifo_error[2]) @[el2_dma_ctrl.scala 284:89]
    node _T_624 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 284:196]
    node _T_625 = eq(_T_624, UInt<1>("h00")) @[el2_dma_ctrl.scala 284:185]
    node _T_626 = bits(_T_625, 0, 0) @[Bitwise.scala 72:15]
    node _T_627 = mux(_T_626, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_628 = and(_T_623, _T_627) @[el2_dma_ctrl.scala 284:150]
    reg _T_629 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 284:85]
    _T_629 <= _T_628 @[el2_dma_ctrl.scala 284:85]
    fifo_error[2] <= _T_629 @[el2_dma_ctrl.scala 284:50]
    node _T_630 = bits(fifo_error_en, 3, 3) @[el2_dma_ctrl.scala 284:103]
    node _T_631 = bits(_T_630, 0, 0) @[el2_dma_ctrl.scala 284:113]
    node _T_632 = mux(_T_631, fifo_error_in[3], fifo_error[3]) @[el2_dma_ctrl.scala 284:89]
    node _T_633 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 284:196]
    node _T_634 = eq(_T_633, UInt<1>("h00")) @[el2_dma_ctrl.scala 284:185]
    node _T_635 = bits(_T_634, 0, 0) @[Bitwise.scala 72:15]
    node _T_636 = mux(_T_635, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_637 = and(_T_632, _T_636) @[el2_dma_ctrl.scala 284:150]
    reg _T_638 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 284:85]
    _T_638 <= _T_637 @[el2_dma_ctrl.scala 284:85]
    fifo_error[3] <= _T_638 @[el2_dma_ctrl.scala 284:50]
    node _T_639 = bits(fifo_error_en, 4, 4) @[el2_dma_ctrl.scala 284:103]
    node _T_640 = bits(_T_639, 0, 0) @[el2_dma_ctrl.scala 284:113]
    node _T_641 = mux(_T_640, fifo_error_in[4], fifo_error[4]) @[el2_dma_ctrl.scala 284:89]
    node _T_642 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 284:196]
    node _T_643 = eq(_T_642, UInt<1>("h00")) @[el2_dma_ctrl.scala 284:185]
    node _T_644 = bits(_T_643, 0, 0) @[Bitwise.scala 72:15]
    node _T_645 = mux(_T_644, UInt<2>("h03"), UInt<2>("h00")) @[Bitwise.scala 72:12]
    node _T_646 = and(_T_641, _T_645) @[el2_dma_ctrl.scala 284:150]
    reg _T_647 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 284:85]
    _T_647 <= _T_646 @[el2_dma_ctrl.scala 284:85]
    fifo_error[4] <= _T_647 @[el2_dma_ctrl.scala 284:50]
    node _T_648 = bits(fifo_error_bus_en, 0, 0) @[el2_dma_ctrl.scala 286:111]
    node _T_649 = bits(fifo_error_bus, 0, 0) @[el2_dma_ctrl.scala 286:135]
    node _T_650 = mux(_T_648, UInt<1>("h01"), _T_649) @[el2_dma_ctrl.scala 286:93]
    node _T_651 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 286:153]
    node _T_652 = eq(_T_651, UInt<1>("h00")) @[el2_dma_ctrl.scala 286:142]
    node _T_653 = and(_T_650, _T_652) @[el2_dma_ctrl.scala 286:140]
    reg _T_654 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 286:89]
    _T_654 <= _T_653 @[el2_dma_ctrl.scala 286:89]
    node _T_655 = bits(fifo_error_bus_en, 1, 1) @[el2_dma_ctrl.scala 286:111]
    node _T_656 = bits(fifo_error_bus, 1, 1) @[el2_dma_ctrl.scala 286:135]
    node _T_657 = mux(_T_655, UInt<1>("h01"), _T_656) @[el2_dma_ctrl.scala 286:93]
    node _T_658 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 286:153]
    node _T_659 = eq(_T_658, UInt<1>("h00")) @[el2_dma_ctrl.scala 286:142]
    node _T_660 = and(_T_657, _T_659) @[el2_dma_ctrl.scala 286:140]
    reg _T_661 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 286:89]
    _T_661 <= _T_660 @[el2_dma_ctrl.scala 286:89]
    node _T_662 = bits(fifo_error_bus_en, 2, 2) @[el2_dma_ctrl.scala 286:111]
    node _T_663 = bits(fifo_error_bus, 2, 2) @[el2_dma_ctrl.scala 286:135]
    node _T_664 = mux(_T_662, UInt<1>("h01"), _T_663) @[el2_dma_ctrl.scala 286:93]
    node _T_665 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 286:153]
    node _T_666 = eq(_T_665, UInt<1>("h00")) @[el2_dma_ctrl.scala 286:142]
    node _T_667 = and(_T_664, _T_666) @[el2_dma_ctrl.scala 286:140]
    reg _T_668 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 286:89]
    _T_668 <= _T_667 @[el2_dma_ctrl.scala 286:89]
    node _T_669 = bits(fifo_error_bus_en, 3, 3) @[el2_dma_ctrl.scala 286:111]
    node _T_670 = bits(fifo_error_bus, 3, 3) @[el2_dma_ctrl.scala 286:135]
    node _T_671 = mux(_T_669, UInt<1>("h01"), _T_670) @[el2_dma_ctrl.scala 286:93]
    node _T_672 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 286:153]
    node _T_673 = eq(_T_672, UInt<1>("h00")) @[el2_dma_ctrl.scala 286:142]
    node _T_674 = and(_T_671, _T_673) @[el2_dma_ctrl.scala 286:140]
    reg _T_675 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 286:89]
    _T_675 <= _T_674 @[el2_dma_ctrl.scala 286:89]
    node _T_676 = bits(fifo_error_bus_en, 4, 4) @[el2_dma_ctrl.scala 286:111]
    node _T_677 = bits(fifo_error_bus, 4, 4) @[el2_dma_ctrl.scala 286:135]
    node _T_678 = mux(_T_676, UInt<1>("h01"), _T_677) @[el2_dma_ctrl.scala 286:93]
    node _T_679 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 286:153]
    node _T_680 = eq(_T_679, UInt<1>("h00")) @[el2_dma_ctrl.scala 286:142]
    node _T_681 = and(_T_678, _T_680) @[el2_dma_ctrl.scala 286:140]
    reg _T_682 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 286:89]
    _T_682 <= _T_681 @[el2_dma_ctrl.scala 286:89]
    node _T_683 = cat(_T_682, _T_675) @[Cat.scala 29:58]
    node _T_684 = cat(_T_683, _T_668) @[Cat.scala 29:58]
    node _T_685 = cat(_T_684, _T_661) @[Cat.scala 29:58]
    node _T_686 = cat(_T_685, _T_654) @[Cat.scala 29:58]
    fifo_error_bus <= _T_686 @[el2_dma_ctrl.scala 286:21]
    node _T_687 = bits(fifo_pend_en, 0, 0) @[el2_dma_ctrl.scala 288:106]
    node _T_688 = bits(fifo_rpend, 0, 0) @[el2_dma_ctrl.scala 288:126]
    node _T_689 = mux(_T_687, UInt<1>("h01"), _T_688) @[el2_dma_ctrl.scala 288:93]
    node _T_690 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 288:144]
    node _T_691 = eq(_T_690, UInt<1>("h00")) @[el2_dma_ctrl.scala 288:133]
    node _T_692 = and(_T_689, _T_691) @[el2_dma_ctrl.scala 288:131]
    reg _T_693 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 288:89]
    _T_693 <= _T_692 @[el2_dma_ctrl.scala 288:89]
    node _T_694 = bits(fifo_pend_en, 1, 1) @[el2_dma_ctrl.scala 288:106]
    node _T_695 = bits(fifo_rpend, 1, 1) @[el2_dma_ctrl.scala 288:126]
    node _T_696 = mux(_T_694, UInt<1>("h01"), _T_695) @[el2_dma_ctrl.scala 288:93]
    node _T_697 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 288:144]
    node _T_698 = eq(_T_697, UInt<1>("h00")) @[el2_dma_ctrl.scala 288:133]
    node _T_699 = and(_T_696, _T_698) @[el2_dma_ctrl.scala 288:131]
    reg _T_700 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 288:89]
    _T_700 <= _T_699 @[el2_dma_ctrl.scala 288:89]
    node _T_701 = bits(fifo_pend_en, 2, 2) @[el2_dma_ctrl.scala 288:106]
    node _T_702 = bits(fifo_rpend, 2, 2) @[el2_dma_ctrl.scala 288:126]
    node _T_703 = mux(_T_701, UInt<1>("h01"), _T_702) @[el2_dma_ctrl.scala 288:93]
    node _T_704 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 288:144]
    node _T_705 = eq(_T_704, UInt<1>("h00")) @[el2_dma_ctrl.scala 288:133]
    node _T_706 = and(_T_703, _T_705) @[el2_dma_ctrl.scala 288:131]
    reg _T_707 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 288:89]
    _T_707 <= _T_706 @[el2_dma_ctrl.scala 288:89]
    node _T_708 = bits(fifo_pend_en, 3, 3) @[el2_dma_ctrl.scala 288:106]
    node _T_709 = bits(fifo_rpend, 3, 3) @[el2_dma_ctrl.scala 288:126]
    node _T_710 = mux(_T_708, UInt<1>("h01"), _T_709) @[el2_dma_ctrl.scala 288:93]
    node _T_711 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 288:144]
    node _T_712 = eq(_T_711, UInt<1>("h00")) @[el2_dma_ctrl.scala 288:133]
    node _T_713 = and(_T_710, _T_712) @[el2_dma_ctrl.scala 288:131]
    reg _T_714 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 288:89]
    _T_714 <= _T_713 @[el2_dma_ctrl.scala 288:89]
    node _T_715 = bits(fifo_pend_en, 4, 4) @[el2_dma_ctrl.scala 288:106]
    node _T_716 = bits(fifo_rpend, 4, 4) @[el2_dma_ctrl.scala 288:126]
    node _T_717 = mux(_T_715, UInt<1>("h01"), _T_716) @[el2_dma_ctrl.scala 288:93]
    node _T_718 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 288:144]
    node _T_719 = eq(_T_718, UInt<1>("h00")) @[el2_dma_ctrl.scala 288:133]
    node _T_720 = and(_T_717, _T_719) @[el2_dma_ctrl.scala 288:131]
    reg _T_721 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 288:89]
    _T_721 <= _T_720 @[el2_dma_ctrl.scala 288:89]
    node _T_722 = cat(_T_721, _T_714) @[Cat.scala 29:58]
    node _T_723 = cat(_T_722, _T_707) @[Cat.scala 29:58]
    node _T_724 = cat(_T_723, _T_700) @[Cat.scala 29:58]
    node _T_725 = cat(_T_724, _T_693) @[Cat.scala 29:58]
    fifo_rpend <= _T_725 @[el2_dma_ctrl.scala 288:21]
    node _T_726 = bits(fifo_done_en, 0, 0) @[el2_dma_ctrl.scala 290:106]
    node _T_727 = bits(fifo_done, 0, 0) @[el2_dma_ctrl.scala 290:125]
    node _T_728 = mux(_T_726, UInt<1>("h01"), _T_727) @[el2_dma_ctrl.scala 290:93]
    node _T_729 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 290:143]
    node _T_730 = eq(_T_729, UInt<1>("h00")) @[el2_dma_ctrl.scala 290:132]
    node _T_731 = and(_T_728, _T_730) @[el2_dma_ctrl.scala 290:130]
    reg _T_732 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 290:89]
    _T_732 <= _T_731 @[el2_dma_ctrl.scala 290:89]
    node _T_733 = bits(fifo_done_en, 1, 1) @[el2_dma_ctrl.scala 290:106]
    node _T_734 = bits(fifo_done, 1, 1) @[el2_dma_ctrl.scala 290:125]
    node _T_735 = mux(_T_733, UInt<1>("h01"), _T_734) @[el2_dma_ctrl.scala 290:93]
    node _T_736 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 290:143]
    node _T_737 = eq(_T_736, UInt<1>("h00")) @[el2_dma_ctrl.scala 290:132]
    node _T_738 = and(_T_735, _T_737) @[el2_dma_ctrl.scala 290:130]
    reg _T_739 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 290:89]
    _T_739 <= _T_738 @[el2_dma_ctrl.scala 290:89]
    node _T_740 = bits(fifo_done_en, 2, 2) @[el2_dma_ctrl.scala 290:106]
    node _T_741 = bits(fifo_done, 2, 2) @[el2_dma_ctrl.scala 290:125]
    node _T_742 = mux(_T_740, UInt<1>("h01"), _T_741) @[el2_dma_ctrl.scala 290:93]
    node _T_743 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 290:143]
    node _T_744 = eq(_T_743, UInt<1>("h00")) @[el2_dma_ctrl.scala 290:132]
    node _T_745 = and(_T_742, _T_744) @[el2_dma_ctrl.scala 290:130]
    reg _T_746 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 290:89]
    _T_746 <= _T_745 @[el2_dma_ctrl.scala 290:89]
    node _T_747 = bits(fifo_done_en, 3, 3) @[el2_dma_ctrl.scala 290:106]
    node _T_748 = bits(fifo_done, 3, 3) @[el2_dma_ctrl.scala 290:125]
    node _T_749 = mux(_T_747, UInt<1>("h01"), _T_748) @[el2_dma_ctrl.scala 290:93]
    node _T_750 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 290:143]
    node _T_751 = eq(_T_750, UInt<1>("h00")) @[el2_dma_ctrl.scala 290:132]
    node _T_752 = and(_T_749, _T_751) @[el2_dma_ctrl.scala 290:130]
    reg _T_753 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 290:89]
    _T_753 <= _T_752 @[el2_dma_ctrl.scala 290:89]
    node _T_754 = bits(fifo_done_en, 4, 4) @[el2_dma_ctrl.scala 290:106]
    node _T_755 = bits(fifo_done, 4, 4) @[el2_dma_ctrl.scala 290:125]
    node _T_756 = mux(_T_754, UInt<1>("h01"), _T_755) @[el2_dma_ctrl.scala 290:93]
    node _T_757 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 290:143]
    node _T_758 = eq(_T_757, UInt<1>("h00")) @[el2_dma_ctrl.scala 290:132]
    node _T_759 = and(_T_756, _T_758) @[el2_dma_ctrl.scala 290:130]
    reg _T_760 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 290:89]
    _T_760 <= _T_759 @[el2_dma_ctrl.scala 290:89]
    node _T_761 = cat(_T_760, _T_753) @[Cat.scala 29:58]
    node _T_762 = cat(_T_761, _T_746) @[Cat.scala 29:58]
    node _T_763 = cat(_T_762, _T_739) @[Cat.scala 29:58]
    node _T_764 = cat(_T_763, _T_732) @[Cat.scala 29:58]
    fifo_done <= _T_764 @[el2_dma_ctrl.scala 290:21]
    node _T_765 = bits(fifo_done_bus_en, 0, 0) @[el2_dma_ctrl.scala 292:110]
    node _T_766 = bits(fifo_done_bus, 0, 0) @[el2_dma_ctrl.scala 292:133]
    node _T_767 = mux(_T_765, UInt<1>("h01"), _T_766) @[el2_dma_ctrl.scala 292:93]
    node _T_768 = bits(fifo_reset, 0, 0) @[el2_dma_ctrl.scala 292:151]
    node _T_769 = eq(_T_768, UInt<1>("h00")) @[el2_dma_ctrl.scala 292:140]
    node _T_770 = and(_T_767, _T_769) @[el2_dma_ctrl.scala 292:138]
    reg _T_771 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 292:89]
    _T_771 <= _T_770 @[el2_dma_ctrl.scala 292:89]
    node _T_772 = bits(fifo_done_bus_en, 1, 1) @[el2_dma_ctrl.scala 292:110]
    node _T_773 = bits(fifo_done_bus, 1, 1) @[el2_dma_ctrl.scala 292:133]
    node _T_774 = mux(_T_772, UInt<1>("h01"), _T_773) @[el2_dma_ctrl.scala 292:93]
    node _T_775 = bits(fifo_reset, 1, 1) @[el2_dma_ctrl.scala 292:151]
    node _T_776 = eq(_T_775, UInt<1>("h00")) @[el2_dma_ctrl.scala 292:140]
    node _T_777 = and(_T_774, _T_776) @[el2_dma_ctrl.scala 292:138]
    reg _T_778 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 292:89]
    _T_778 <= _T_777 @[el2_dma_ctrl.scala 292:89]
    node _T_779 = bits(fifo_done_bus_en, 2, 2) @[el2_dma_ctrl.scala 292:110]
    node _T_780 = bits(fifo_done_bus, 2, 2) @[el2_dma_ctrl.scala 292:133]
    node _T_781 = mux(_T_779, UInt<1>("h01"), _T_780) @[el2_dma_ctrl.scala 292:93]
    node _T_782 = bits(fifo_reset, 2, 2) @[el2_dma_ctrl.scala 292:151]
    node _T_783 = eq(_T_782, UInt<1>("h00")) @[el2_dma_ctrl.scala 292:140]
    node _T_784 = and(_T_781, _T_783) @[el2_dma_ctrl.scala 292:138]
    reg _T_785 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 292:89]
    _T_785 <= _T_784 @[el2_dma_ctrl.scala 292:89]
    node _T_786 = bits(fifo_done_bus_en, 3, 3) @[el2_dma_ctrl.scala 292:110]
    node _T_787 = bits(fifo_done_bus, 3, 3) @[el2_dma_ctrl.scala 292:133]
    node _T_788 = mux(_T_786, UInt<1>("h01"), _T_787) @[el2_dma_ctrl.scala 292:93]
    node _T_789 = bits(fifo_reset, 3, 3) @[el2_dma_ctrl.scala 292:151]
    node _T_790 = eq(_T_789, UInt<1>("h00")) @[el2_dma_ctrl.scala 292:140]
    node _T_791 = and(_T_788, _T_790) @[el2_dma_ctrl.scala 292:138]
    reg _T_792 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 292:89]
    _T_792 <= _T_791 @[el2_dma_ctrl.scala 292:89]
    node _T_793 = bits(fifo_done_bus_en, 4, 4) @[el2_dma_ctrl.scala 292:110]
    node _T_794 = bits(fifo_done_bus, 4, 4) @[el2_dma_ctrl.scala 292:133]
    node _T_795 = mux(_T_793, UInt<1>("h01"), _T_794) @[el2_dma_ctrl.scala 292:93]
    node _T_796 = bits(fifo_reset, 4, 4) @[el2_dma_ctrl.scala 292:151]
    node _T_797 = eq(_T_796, UInt<1>("h00")) @[el2_dma_ctrl.scala 292:140]
    node _T_798 = and(_T_795, _T_797) @[el2_dma_ctrl.scala 292:138]
    reg _T_799 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 292:89]
    _T_799 <= _T_798 @[el2_dma_ctrl.scala 292:89]
    node _T_800 = cat(_T_799, _T_792) @[Cat.scala 29:58]
    node _T_801 = cat(_T_800, _T_785) @[Cat.scala 29:58]
    node _T_802 = cat(_T_801, _T_778) @[Cat.scala 29:58]
    node _T_803 = cat(_T_802, _T_771) @[Cat.scala 29:58]
    fifo_done_bus <= _T_803 @[el2_dma_ctrl.scala 292:21]
    node _T_804 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 294:84]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 508:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr.io.en <= _T_804 @[el2_lib.scala 511:17]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_805 : UInt, rvclkhdr.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_805 <= fifo_addr_in @[el2_lib.scala 514:16]
    fifo_addr[0] <= _T_805 @[el2_dma_ctrl.scala 294:49]
    node _T_806 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 294:84]
    inst rvclkhdr_1 of rvclkhdr_1 @[el2_lib.scala 508:23]
    rvclkhdr_1.clock <= clock
    rvclkhdr_1.reset <= reset
    rvclkhdr_1.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_1.io.en <= _T_806 @[el2_lib.scala 511:17]
    rvclkhdr_1.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_807 : UInt, rvclkhdr_1.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_807 <= fifo_addr_in @[el2_lib.scala 514:16]
    fifo_addr[1] <= _T_807 @[el2_dma_ctrl.scala 294:49]
    node _T_808 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 294:84]
    inst rvclkhdr_2 of rvclkhdr_2 @[el2_lib.scala 508:23]
    rvclkhdr_2.clock <= clock
    rvclkhdr_2.reset <= reset
    rvclkhdr_2.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_2.io.en <= _T_808 @[el2_lib.scala 511:17]
    rvclkhdr_2.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_809 : UInt, rvclkhdr_2.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_809 <= fifo_addr_in @[el2_lib.scala 514:16]
    fifo_addr[2] <= _T_809 @[el2_dma_ctrl.scala 294:49]
    node _T_810 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 294:84]
    inst rvclkhdr_3 of rvclkhdr_3 @[el2_lib.scala 508:23]
    rvclkhdr_3.clock <= clock
    rvclkhdr_3.reset <= reset
    rvclkhdr_3.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_3.io.en <= _T_810 @[el2_lib.scala 511:17]
    rvclkhdr_3.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_811 : UInt, rvclkhdr_3.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_811 <= fifo_addr_in @[el2_lib.scala 514:16]
    fifo_addr[3] <= _T_811 @[el2_dma_ctrl.scala 294:49]
    node _T_812 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 294:84]
    inst rvclkhdr_4 of rvclkhdr_4 @[el2_lib.scala 508:23]
    rvclkhdr_4.clock <= clock
    rvclkhdr_4.reset <= reset
    rvclkhdr_4.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_4.io.en <= _T_812 @[el2_lib.scala 511:17]
    rvclkhdr_4.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_813 : UInt, rvclkhdr_4.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_813 <= fifo_addr_in @[el2_lib.scala 514:16]
    fifo_addr[4] <= _T_813 @[el2_dma_ctrl.scala 294:49]
    node _T_814 = bits(fifo_sz_in, 2, 0) @[el2_dma_ctrl.scala 296:100]
    node _T_815 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 296:123]
    reg _T_816 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_815 : @[Reg.scala 28:19]
      _T_816 <= _T_814 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_sz[0] <= _T_816 @[el2_dma_ctrl.scala 296:47]
    node _T_817 = bits(fifo_sz_in, 2, 0) @[el2_dma_ctrl.scala 296:100]
    node _T_818 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 296:123]
    reg _T_819 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_818 : @[Reg.scala 28:19]
      _T_819 <= _T_817 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_sz[1] <= _T_819 @[el2_dma_ctrl.scala 296:47]
    node _T_820 = bits(fifo_sz_in, 2, 0) @[el2_dma_ctrl.scala 296:100]
    node _T_821 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 296:123]
    reg _T_822 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_821 : @[Reg.scala 28:19]
      _T_822 <= _T_820 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_sz[2] <= _T_822 @[el2_dma_ctrl.scala 296:47]
    node _T_823 = bits(fifo_sz_in, 2, 0) @[el2_dma_ctrl.scala 296:100]
    node _T_824 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 296:123]
    reg _T_825 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_824 : @[Reg.scala 28:19]
      _T_825 <= _T_823 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_sz[3] <= _T_825 @[el2_dma_ctrl.scala 296:47]
    node _T_826 = bits(fifo_sz_in, 2, 0) @[el2_dma_ctrl.scala 296:100]
    node _T_827 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 296:123]
    reg _T_828 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_827 : @[Reg.scala 28:19]
      _T_828 <= _T_826 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_sz[4] <= _T_828 @[el2_dma_ctrl.scala 296:47]
    node _T_829 = bits(fifo_byteen_in, 7, 0) @[el2_dma_ctrl.scala 298:108]
    node _T_830 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 298:131]
    node _T_831 = bits(_T_830, 0, 0) @[el2_dma_ctrl.scala 298:141]
    reg _T_832 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_831 : @[Reg.scala 28:19]
      _T_832 <= _T_829 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_byteen[0] <= _T_832 @[el2_dma_ctrl.scala 298:51]
    node _T_833 = bits(fifo_byteen_in, 7, 0) @[el2_dma_ctrl.scala 298:108]
    node _T_834 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 298:131]
    node _T_835 = bits(_T_834, 0, 0) @[el2_dma_ctrl.scala 298:141]
    reg _T_836 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_835 : @[Reg.scala 28:19]
      _T_836 <= _T_833 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_byteen[1] <= _T_836 @[el2_dma_ctrl.scala 298:51]
    node _T_837 = bits(fifo_byteen_in, 7, 0) @[el2_dma_ctrl.scala 298:108]
    node _T_838 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 298:131]
    node _T_839 = bits(_T_838, 0, 0) @[el2_dma_ctrl.scala 298:141]
    reg _T_840 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_839 : @[Reg.scala 28:19]
      _T_840 <= _T_837 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_byteen[2] <= _T_840 @[el2_dma_ctrl.scala 298:51]
    node _T_841 = bits(fifo_byteen_in, 7, 0) @[el2_dma_ctrl.scala 298:108]
    node _T_842 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 298:131]
    node _T_843 = bits(_T_842, 0, 0) @[el2_dma_ctrl.scala 298:141]
    reg _T_844 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_843 : @[Reg.scala 28:19]
      _T_844 <= _T_841 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_byteen[3] <= _T_844 @[el2_dma_ctrl.scala 298:51]
    node _T_845 = bits(fifo_byteen_in, 7, 0) @[el2_dma_ctrl.scala 298:108]
    node _T_846 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 298:131]
    node _T_847 = bits(_T_846, 0, 0) @[el2_dma_ctrl.scala 298:141]
    reg _T_848 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_847 : @[Reg.scala 28:19]
      _T_848 <= _T_845 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_byteen[4] <= _T_848 @[el2_dma_ctrl.scala 298:51]
    node _T_849 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 300:129]
    reg _T_850 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_849 : @[Reg.scala 28:19]
      _T_850 <= fifo_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_851 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 300:129]
    reg _T_852 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_851 : @[Reg.scala 28:19]
      _T_852 <= fifo_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_853 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 300:129]
    reg _T_854 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_853 : @[Reg.scala 28:19]
      _T_854 <= fifo_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_855 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 300:129]
    reg _T_856 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_855 : @[Reg.scala 28:19]
      _T_856 <= fifo_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_857 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 300:129]
    reg _T_858 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_857 : @[Reg.scala 28:19]
      _T_858 <= fifo_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_859 = cat(_T_858, _T_856) @[Cat.scala 29:58]
    node _T_860 = cat(_T_859, _T_854) @[Cat.scala 29:58]
    node _T_861 = cat(_T_860, _T_852) @[Cat.scala 29:58]
    node _T_862 = cat(_T_861, _T_850) @[Cat.scala 29:58]
    fifo_write <= _T_862 @[el2_dma_ctrl.scala 300:21]
    node _T_863 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 302:136]
    reg _T_864 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_863 : @[Reg.scala 28:19]
      _T_864 <= fifo_posted_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_865 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 302:136]
    reg _T_866 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_865 : @[Reg.scala 28:19]
      _T_866 <= fifo_posted_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_867 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 302:136]
    reg _T_868 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_867 : @[Reg.scala 28:19]
      _T_868 <= fifo_posted_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_869 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 302:136]
    reg _T_870 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_869 : @[Reg.scala 28:19]
      _T_870 <= fifo_posted_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_871 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 302:136]
    reg _T_872 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_871 : @[Reg.scala 28:19]
      _T_872 <= fifo_posted_write_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_873 = cat(_T_872, _T_870) @[Cat.scala 29:58]
    node _T_874 = cat(_T_873, _T_868) @[Cat.scala 29:58]
    node _T_875 = cat(_T_874, _T_866) @[Cat.scala 29:58]
    node _T_876 = cat(_T_875, _T_864) @[Cat.scala 29:58]
    fifo_posted_write <= _T_876 @[el2_dma_ctrl.scala 302:21]
    node _T_877 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 304:126]
    reg _T_878 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_877 : @[Reg.scala 28:19]
      _T_878 <= io.dbg_cmd_valid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_879 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 304:126]
    reg _T_880 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_879 : @[Reg.scala 28:19]
      _T_880 <= io.dbg_cmd_valid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_881 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 304:126]
    reg _T_882 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_881 : @[Reg.scala 28:19]
      _T_882 <= io.dbg_cmd_valid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_883 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 304:126]
    reg _T_884 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_883 : @[Reg.scala 28:19]
      _T_884 <= io.dbg_cmd_valid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_885 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 304:126]
    reg _T_886 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_885 : @[Reg.scala 28:19]
      _T_886 <= io.dbg_cmd_valid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_887 = cat(_T_886, _T_884) @[Cat.scala 29:58]
    node _T_888 = cat(_T_887, _T_882) @[Cat.scala 29:58]
    node _T_889 = cat(_T_888, _T_880) @[Cat.scala 29:58]
    node _T_890 = cat(_T_889, _T_878) @[Cat.scala 29:58]
    fifo_dbg <= _T_890 @[el2_dma_ctrl.scala 304:21]
    node _T_891 = bits(fifo_data_en, 0, 0) @[el2_dma_ctrl.scala 306:88]
    inst rvclkhdr_5 of rvclkhdr_5 @[el2_lib.scala 508:23]
    rvclkhdr_5.clock <= clock
    rvclkhdr_5.reset <= reset
    rvclkhdr_5.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_5.io.en <= _T_891 @[el2_lib.scala 511:17]
    rvclkhdr_5.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_892 : UInt, rvclkhdr_5.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_892 <= fifo_data_in[0] @[el2_lib.scala 514:16]
    fifo_data[0] <= _T_892 @[el2_dma_ctrl.scala 306:49]
    node _T_893 = bits(fifo_data_en, 1, 1) @[el2_dma_ctrl.scala 306:88]
    inst rvclkhdr_6 of rvclkhdr_6 @[el2_lib.scala 508:23]
    rvclkhdr_6.clock <= clock
    rvclkhdr_6.reset <= reset
    rvclkhdr_6.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_6.io.en <= _T_893 @[el2_lib.scala 511:17]
    rvclkhdr_6.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_894 : UInt, rvclkhdr_6.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_894 <= fifo_data_in[1] @[el2_lib.scala 514:16]
    fifo_data[1] <= _T_894 @[el2_dma_ctrl.scala 306:49]
    node _T_895 = bits(fifo_data_en, 2, 2) @[el2_dma_ctrl.scala 306:88]
    inst rvclkhdr_7 of rvclkhdr_7 @[el2_lib.scala 508:23]
    rvclkhdr_7.clock <= clock
    rvclkhdr_7.reset <= reset
    rvclkhdr_7.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_7.io.en <= _T_895 @[el2_lib.scala 511:17]
    rvclkhdr_7.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_896 : UInt, rvclkhdr_7.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_896 <= fifo_data_in[2] @[el2_lib.scala 514:16]
    fifo_data[2] <= _T_896 @[el2_dma_ctrl.scala 306:49]
    node _T_897 = bits(fifo_data_en, 3, 3) @[el2_dma_ctrl.scala 306:88]
    inst rvclkhdr_8 of rvclkhdr_8 @[el2_lib.scala 508:23]
    rvclkhdr_8.clock <= clock
    rvclkhdr_8.reset <= reset
    rvclkhdr_8.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_8.io.en <= _T_897 @[el2_lib.scala 511:17]
    rvclkhdr_8.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_898 : UInt, rvclkhdr_8.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_898 <= fifo_data_in[3] @[el2_lib.scala 514:16]
    fifo_data[3] <= _T_898 @[el2_dma_ctrl.scala 306:49]
    node _T_899 = bits(fifo_data_en, 4, 4) @[el2_dma_ctrl.scala 306:88]
    inst rvclkhdr_9 of rvclkhdr_9 @[el2_lib.scala 508:23]
    rvclkhdr_9.clock <= clock
    rvclkhdr_9.reset <= reset
    rvclkhdr_9.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_9.io.en <= _T_899 @[el2_lib.scala 511:17]
    rvclkhdr_9.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_900 : UInt, rvclkhdr_9.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_900 <= fifo_data_in[4] @[el2_lib.scala 514:16]
    fifo_data[4] <= _T_900 @[el2_dma_ctrl.scala 306:49]
    node _T_901 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 308:120]
    reg _T_902 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_901 : @[Reg.scala 28:19]
      _T_902 <= bus_cmd_tag @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_tag[0] <= _T_902 @[el2_dma_ctrl.scala 308:48]
    node _T_903 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 308:120]
    reg _T_904 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_903 : @[Reg.scala 28:19]
      _T_904 <= bus_cmd_tag @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_tag[1] <= _T_904 @[el2_dma_ctrl.scala 308:48]
    node _T_905 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 308:120]
    reg _T_906 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_905 : @[Reg.scala 28:19]
      _T_906 <= bus_cmd_tag @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_tag[2] <= _T_906 @[el2_dma_ctrl.scala 308:48]
    node _T_907 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 308:120]
    reg _T_908 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_907 : @[Reg.scala 28:19]
      _T_908 <= bus_cmd_tag @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_tag[3] <= _T_908 @[el2_dma_ctrl.scala 308:48]
    node _T_909 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 308:120]
    reg _T_910 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_909 : @[Reg.scala 28:19]
      _T_910 <= bus_cmd_tag @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_tag[4] <= _T_910 @[el2_dma_ctrl.scala 308:48]
    node _T_911 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 310:120]
    reg _T_912 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_911 : @[Reg.scala 28:19]
      _T_912 <= bus_cmd_mid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_mid[0] <= _T_912 @[el2_dma_ctrl.scala 310:48]
    node _T_913 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 310:120]
    reg _T_914 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_913 : @[Reg.scala 28:19]
      _T_914 <= bus_cmd_mid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_mid[1] <= _T_914 @[el2_dma_ctrl.scala 310:48]
    node _T_915 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 310:120]
    reg _T_916 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_915 : @[Reg.scala 28:19]
      _T_916 <= bus_cmd_mid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_mid[2] <= _T_916 @[el2_dma_ctrl.scala 310:48]
    node _T_917 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 310:120]
    reg _T_918 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_917 : @[Reg.scala 28:19]
      _T_918 <= bus_cmd_mid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_mid[3] <= _T_918 @[el2_dma_ctrl.scala 310:48]
    node _T_919 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 310:120]
    reg _T_920 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_919 : @[Reg.scala 28:19]
      _T_920 <= bus_cmd_mid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_mid[4] <= _T_920 @[el2_dma_ctrl.scala 310:48]
    node _T_921 = bits(fifo_cmd_en, 0, 0) @[el2_dma_ctrl.scala 312:122]
    reg _T_922 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_921 : @[Reg.scala 28:19]
      _T_922 <= bus_cmd_prty @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_prty[0] <= _T_922 @[el2_dma_ctrl.scala 312:49]
    node _T_923 = bits(fifo_cmd_en, 1, 1) @[el2_dma_ctrl.scala 312:122]
    reg _T_924 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_923 : @[Reg.scala 28:19]
      _T_924 <= bus_cmd_prty @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_prty[1] <= _T_924 @[el2_dma_ctrl.scala 312:49]
    node _T_925 = bits(fifo_cmd_en, 2, 2) @[el2_dma_ctrl.scala 312:122]
    reg _T_926 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_925 : @[Reg.scala 28:19]
      _T_926 <= bus_cmd_prty @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_prty[2] <= _T_926 @[el2_dma_ctrl.scala 312:49]
    node _T_927 = bits(fifo_cmd_en, 3, 3) @[el2_dma_ctrl.scala 312:122]
    reg _T_928 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_927 : @[Reg.scala 28:19]
      _T_928 <= bus_cmd_prty @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_prty[3] <= _T_928 @[el2_dma_ctrl.scala 312:49]
    node _T_929 = bits(fifo_cmd_en, 4, 4) @[el2_dma_ctrl.scala 312:122]
    reg _T_930 : UInt, dma_buffer_c1_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_929 : @[Reg.scala 28:19]
      _T_930 <= bus_cmd_prty @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fifo_prty[4] <= _T_930 @[el2_dma_ctrl.scala 312:49]
    node _T_931 = eq(WrPtr, UInt<3>("h04")) @[el2_dma_ctrl.scala 316:30]
    node _T_932 = bits(_T_931, 0, 0) @[el2_dma_ctrl.scala 316:57]
    node _T_933 = add(WrPtr, UInt<1>("h01")) @[el2_dma_ctrl.scala 316:76]
    node _T_934 = tail(_T_933, 1) @[el2_dma_ctrl.scala 316:76]
    node _T_935 = mux(_T_932, UInt<1>("h00"), _T_934) @[el2_dma_ctrl.scala 316:22]
    NxtWrPtr <= _T_935 @[el2_dma_ctrl.scala 316:16]
    node _T_936 = eq(RdPtr, UInt<3>("h04")) @[el2_dma_ctrl.scala 318:30]
    node _T_937 = bits(_T_936, 0, 0) @[el2_dma_ctrl.scala 318:57]
    node _T_938 = add(RdPtr, UInt<1>("h01")) @[el2_dma_ctrl.scala 318:76]
    node _T_939 = tail(_T_938, 1) @[el2_dma_ctrl.scala 318:76]
    node _T_940 = mux(_T_937, UInt<1>("h00"), _T_939) @[el2_dma_ctrl.scala 318:22]
    NxtRdPtr <= _T_940 @[el2_dma_ctrl.scala 318:16]
    node _T_941 = eq(RspPtr, UInt<3>("h04")) @[el2_dma_ctrl.scala 320:31]
    node _T_942 = bits(_T_941, 0, 0) @[el2_dma_ctrl.scala 320:58]
    node _T_943 = add(RspPtr, UInt<1>("h01")) @[el2_dma_ctrl.scala 320:78]
    node _T_944 = tail(_T_943, 1) @[el2_dma_ctrl.scala 320:78]
    node _T_945 = mux(_T_942, UInt<1>("h00"), _T_944) @[el2_dma_ctrl.scala 320:22]
    NxtRspPtr <= _T_945 @[el2_dma_ctrl.scala 320:16]
    node WrPtrEn = orr(fifo_cmd_en) @[el2_dma_ctrl.scala 322:30]
    node _T_946 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 324:35]
    node _T_947 = bits(dma_address_error, 0, 0) @[el2_dma_ctrl.scala 324:74]
    node _T_948 = bits(dma_alignment_error, 0, 0) @[el2_dma_ctrl.scala 324:103]
    node _T_949 = or(_T_947, _T_948) @[el2_dma_ctrl.scala 324:81]
    node _T_950 = or(_T_949, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 324:110]
    node RdPtrEn = or(_T_946, _T_950) @[el2_dma_ctrl.scala 324:53]
    node _T_951 = or(bus_rsp_sent, bus_posted_write_done) @[el2_dma_ctrl.scala 326:55]
    node _T_952 = and(_T_951, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 326:80]
    node RspPtrEn = or(io.dma_dbg_cmd_done, _T_952) @[el2_dma_ctrl.scala 326:39]
    reg _T_953 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when WrPtrEn : @[Reg.scala 28:19]
      _T_953 <= NxtWrPtr @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    WrPtr <= _T_953 @[el2_dma_ctrl.scala 328:16]
    node _T_954 = bits(RdPtrEn, 0, 0) @[el2_dma_ctrl.scala 333:38]
    reg _T_955 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_954 : @[Reg.scala 28:19]
      _T_955 <= NxtRdPtr @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    RdPtr <= _T_955 @[el2_dma_ctrl.scala 332:16]
    node _T_956 = bits(RspPtrEn, 0, 0) @[el2_dma_ctrl.scala 337:40]
    reg _T_957 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_956 : @[Reg.scala 28:19]
      _T_957 <= NxtRspPtr @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    RspPtr <= _T_957 @[el2_dma_ctrl.scala 336:16]
    wire num_fifo_vld_tmp : UInt<4>
    num_fifo_vld_tmp <= UInt<1>("h00")
    wire num_fifo_vld_tmp2 : UInt<4>
    num_fifo_vld_tmp2 <= UInt<1>("h00")
    node _T_958 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_959 = cat(_T_958, axi_mstr_prty_en) @[Cat.scala 29:58]
    node _T_960 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_961 = cat(_T_960, bus_rsp_sent) @[Cat.scala 29:58]
    node _T_962 = sub(_T_959, _T_961) @[el2_dma_ctrl.scala 347:62]
    node _T_963 = tail(_T_962, 1) @[el2_dma_ctrl.scala 347:62]
    num_fifo_vld_tmp <= _T_963 @[el2_dma_ctrl.scala 347:25]
    node _T_964 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_965 = bits(fifo_valid, 0, 0) @[el2_dma_ctrl.scala 349:88]
    node _T_966 = cat(_T_964, _T_965) @[Cat.scala 29:58]
    node _T_967 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_968 = bits(fifo_valid, 1, 1) @[el2_dma_ctrl.scala 349:88]
    node _T_969 = cat(_T_967, _T_968) @[Cat.scala 29:58]
    node _T_970 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_971 = bits(fifo_valid, 2, 2) @[el2_dma_ctrl.scala 349:88]
    node _T_972 = cat(_T_970, _T_971) @[Cat.scala 29:58]
    node _T_973 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_974 = bits(fifo_valid, 3, 3) @[el2_dma_ctrl.scala 349:88]
    node _T_975 = cat(_T_973, _T_974) @[Cat.scala 29:58]
    node _T_976 = mux(UInt<1>("h00"), UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_977 = bits(fifo_valid, 4, 4) @[el2_dma_ctrl.scala 349:88]
    node _T_978 = cat(_T_976, _T_977) @[Cat.scala 29:58]
    node _T_979 = add(_T_966, _T_969) @[el2_dma_ctrl.scala 349:102]
    node _T_980 = tail(_T_979, 1) @[el2_dma_ctrl.scala 349:102]
    node _T_981 = add(_T_980, _T_972) @[el2_dma_ctrl.scala 349:102]
    node _T_982 = tail(_T_981, 1) @[el2_dma_ctrl.scala 349:102]
    node _T_983 = add(_T_982, _T_975) @[el2_dma_ctrl.scala 349:102]
    node _T_984 = tail(_T_983, 1) @[el2_dma_ctrl.scala 349:102]
    node _T_985 = add(_T_984, _T_978) @[el2_dma_ctrl.scala 349:102]
    node _T_986 = tail(_T_985, 1) @[el2_dma_ctrl.scala 349:102]
    num_fifo_vld_tmp2 <= _T_986 @[el2_dma_ctrl.scala 349:25]
    node _T_987 = add(num_fifo_vld_tmp, num_fifo_vld_tmp2) @[el2_dma_ctrl.scala 351:45]
    node _T_988 = tail(_T_987, 1) @[el2_dma_ctrl.scala 351:45]
    num_fifo_vld <= _T_988 @[el2_dma_ctrl.scala 351:25]
    node fifo_full_spec = geq(num_fifo_vld_tmp2, UInt<3>("h05")) @[el2_dma_ctrl.scala 353:46]
    node _T_989 = or(fifo_full, dbg_dma_bubble_bus) @[el2_dma_ctrl.scala 355:39]
    node dma_fifo_ready = not(_T_989) @[el2_dma_ctrl.scala 355:27]
    node _T_990 = dshr(fifo_valid, RdPtr) @[el2_dma_ctrl.scala 359:38]
    node _T_991 = bits(_T_990, 0, 0) @[el2_dma_ctrl.scala 359:38]
    node _T_992 = dshr(fifo_done, RdPtr) @[el2_dma_ctrl.scala 359:58]
    node _T_993 = bits(_T_992, 0, 0) @[el2_dma_ctrl.scala 359:58]
    node _T_994 = eq(_T_993, UInt<1>("h00")) @[el2_dma_ctrl.scala 359:48]
    node _T_995 = and(_T_991, _T_994) @[el2_dma_ctrl.scala 359:46]
    node _T_996 = dshr(fifo_dbg, RdPtr) @[el2_dma_ctrl.scala 359:77]
    node _T_997 = bits(_T_996, 0, 0) @[el2_dma_ctrl.scala 359:77]
    node _T_998 = eq(_T_997, UInt<1>("h00")) @[el2_dma_ctrl.scala 359:68]
    node _T_999 = and(_T_995, _T_998) @[el2_dma_ctrl.scala 359:66]
    node _T_1000 = or(dma_mem_addr_in_dccm, dma_mem_addr_in_iccm) @[el2_dma_ctrl.scala 359:111]
    node _T_1001 = not(_T_1000) @[el2_dma_ctrl.scala 359:88]
    node _T_1002 = and(_T_999, _T_1001) @[el2_dma_ctrl.scala 359:85]
    dma_address_error <= _T_1002 @[el2_dma_ctrl.scala 359:25]
    node _T_1003 = dshr(fifo_valid, RdPtr) @[el2_dma_ctrl.scala 360:38]
    node _T_1004 = bits(_T_1003, 0, 0) @[el2_dma_ctrl.scala 360:38]
    node _T_1005 = dshr(fifo_done, RdPtr) @[el2_dma_ctrl.scala 360:58]
    node _T_1006 = bits(_T_1005, 0, 0) @[el2_dma_ctrl.scala 360:58]
    node _T_1007 = eq(_T_1006, UInt<1>("h00")) @[el2_dma_ctrl.scala 360:48]
    node _T_1008 = and(_T_1004, _T_1007) @[el2_dma_ctrl.scala 360:46]
    node _T_1009 = eq(dma_address_error, UInt<1>("h00")) @[el2_dma_ctrl.scala 360:68]
    node _T_1010 = and(_T_1008, _T_1009) @[el2_dma_ctrl.scala 360:66]
    node _T_1011 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 361:22]
    node _T_1012 = eq(_T_1011, UInt<1>("h01")) @[el2_dma_ctrl.scala 361:28]
    node _T_1013 = bits(dma_mem_addr_int, 0, 0) @[el2_dma_ctrl.scala 361:55]
    node _T_1014 = and(_T_1012, _T_1013) @[el2_dma_ctrl.scala 361:37]
    node _T_1015 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 362:23]
    node _T_1016 = eq(_T_1015, UInt<2>("h02")) @[el2_dma_ctrl.scala 362:29]
    node _T_1017 = bits(dma_mem_addr_int, 1, 0) @[el2_dma_ctrl.scala 362:57]
    node _T_1018 = orr(_T_1017) @[el2_dma_ctrl.scala 362:64]
    node _T_1019 = and(_T_1016, _T_1018) @[el2_dma_ctrl.scala 362:38]
    node _T_1020 = or(_T_1014, _T_1019) @[el2_dma_ctrl.scala 361:60]
    node _T_1021 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 363:23]
    node _T_1022 = eq(_T_1021, UInt<2>("h03")) @[el2_dma_ctrl.scala 363:29]
    node _T_1023 = bits(dma_mem_addr_int, 2, 0) @[el2_dma_ctrl.scala 363:57]
    node _T_1024 = orr(_T_1023) @[el2_dma_ctrl.scala 363:64]
    node _T_1025 = and(_T_1022, _T_1024) @[el2_dma_ctrl.scala 363:38]
    node _T_1026 = or(_T_1020, _T_1025) @[el2_dma_ctrl.scala 362:70]
    node _T_1027 = bits(dma_mem_sz_int, 1, 0) @[el2_dma_ctrl.scala 364:48]
    node _T_1028 = eq(_T_1027, UInt<2>("h02")) @[el2_dma_ctrl.scala 364:55]
    node _T_1029 = bits(dma_mem_sz_int, 1, 0) @[el2_dma_ctrl.scala 364:81]
    node _T_1030 = eq(_T_1029, UInt<2>("h03")) @[el2_dma_ctrl.scala 364:88]
    node _T_1031 = or(_T_1028, _T_1030) @[el2_dma_ctrl.scala 364:64]
    node _T_1032 = not(_T_1031) @[el2_dma_ctrl.scala 364:31]
    node _T_1033 = and(dma_mem_addr_in_iccm, _T_1032) @[el2_dma_ctrl.scala 364:29]
    node _T_1034 = or(_T_1026, _T_1033) @[el2_dma_ctrl.scala 363:70]
    node _T_1035 = and(dma_mem_addr_in_dccm, io.dma_mem_write) @[el2_dma_ctrl.scala 365:29]
    node _T_1036 = bits(dma_mem_sz_int, 1, 0) @[el2_dma_ctrl.scala 365:67]
    node _T_1037 = eq(_T_1036, UInt<2>("h02")) @[el2_dma_ctrl.scala 365:74]
    node _T_1038 = bits(dma_mem_sz_int, 1, 0) @[el2_dma_ctrl.scala 365:100]
    node _T_1039 = eq(_T_1038, UInt<2>("h03")) @[el2_dma_ctrl.scala 365:107]
    node _T_1040 = or(_T_1037, _T_1039) @[el2_dma_ctrl.scala 365:83]
    node _T_1041 = not(_T_1040) @[el2_dma_ctrl.scala 365:50]
    node _T_1042 = and(_T_1035, _T_1041) @[el2_dma_ctrl.scala 365:48]
    node _T_1043 = or(_T_1034, _T_1042) @[el2_dma_ctrl.scala 364:108]
    node _T_1044 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 366:42]
    node _T_1045 = eq(_T_1044, UInt<2>("h02")) @[el2_dma_ctrl.scala 366:49]
    node _T_1046 = and(io.dma_mem_write, _T_1045) @[el2_dma_ctrl.scala 366:25]
    node _T_1047 = bits(dma_mem_addr_int, 2, 0) @[el2_dma_ctrl.scala 366:88]
    node _T_1048 = eq(_T_1047, UInt<1>("h00")) @[el2_dma_ctrl.scala 366:94]
    node _T_1049 = bits(dma_mem_byteen, 3, 0) @[el2_dma_ctrl.scala 366:121]
    node _T_1050 = bits(dma_mem_addr_int, 2, 0) @[el2_dma_ctrl.scala 367:26]
    node _T_1051 = eq(_T_1050, UInt<1>("h01")) @[el2_dma_ctrl.scala 367:32]
    node _T_1052 = bits(dma_mem_byteen, 4, 1) @[el2_dma_ctrl.scala 367:59]
    node _T_1053 = bits(dma_mem_addr_int, 2, 0) @[el2_dma_ctrl.scala 368:26]
    node _T_1054 = eq(_T_1053, UInt<2>("h02")) @[el2_dma_ctrl.scala 368:32]
    node _T_1055 = bits(dma_mem_byteen, 5, 2) @[el2_dma_ctrl.scala 368:59]
    node _T_1056 = bits(dma_mem_addr_int, 2, 0) @[el2_dma_ctrl.scala 369:26]
    node _T_1057 = eq(_T_1056, UInt<2>("h03")) @[el2_dma_ctrl.scala 369:32]
    node _T_1058 = bits(dma_mem_byteen, 6, 3) @[el2_dma_ctrl.scala 369:59]
    node _T_1059 = mux(_T_1048, _T_1049, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1060 = mux(_T_1051, _T_1052, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1061 = mux(_T_1054, _T_1055, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1062 = mux(_T_1057, _T_1058, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_1063 = or(_T_1059, _T_1060) @[Mux.scala 27:72]
    node _T_1064 = or(_T_1063, _T_1061) @[Mux.scala 27:72]
    node _T_1065 = or(_T_1064, _T_1062) @[Mux.scala 27:72]
    wire _T_1066 : UInt<4> @[Mux.scala 27:72]
    _T_1066 <= _T_1065 @[Mux.scala 27:72]
    node _T_1067 = neq(_T_1066, UInt<4>("h0f")) @[el2_dma_ctrl.scala 369:68]
    node _T_1068 = and(_T_1046, _T_1067) @[el2_dma_ctrl.scala 366:58]
    node _T_1069 = or(_T_1043, _T_1068) @[el2_dma_ctrl.scala 365:125]
    node _T_1070 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 370:42]
    node _T_1071 = eq(_T_1070, UInt<2>("h03")) @[el2_dma_ctrl.scala 370:49]
    node _T_1072 = and(io.dma_mem_write, _T_1071) @[el2_dma_ctrl.scala 370:25]
    node _T_1073 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 370:77]
    node _T_1074 = eq(_T_1073, UInt<4>("h0f")) @[el2_dma_ctrl.scala 370:83]
    node _T_1075 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 370:113]
    node _T_1076 = eq(_T_1075, UInt<8>("h0f0")) @[el2_dma_ctrl.scala 370:119]
    node _T_1077 = or(_T_1074, _T_1076) @[el2_dma_ctrl.scala 370:96]
    node _T_1078 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 370:149]
    node _T_1079 = eq(_T_1078, UInt<8>("h0ff")) @[el2_dma_ctrl.scala 370:155]
    node _T_1080 = or(_T_1077, _T_1079) @[el2_dma_ctrl.scala 370:132]
    node _T_1081 = eq(_T_1080, UInt<1>("h00")) @[el2_dma_ctrl.scala 370:60]
    node _T_1082 = and(_T_1072, _T_1081) @[el2_dma_ctrl.scala 370:58]
    node _T_1083 = or(_T_1069, _T_1082) @[el2_dma_ctrl.scala 369:79]
    node _T_1084 = and(_T_1010, _T_1083) @[el2_dma_ctrl.scala 360:87]
    dma_alignment_error <= _T_1084 @[el2_dma_ctrl.scala 360:25]
    node _T_1085 = and(fifo_empty, dbg_dma_bubble_bus) @[el2_dma_ctrl.scala 374:39]
    io.dma_dbg_ready <= _T_1085 @[el2_dma_ctrl.scala 374:25]
    node _T_1086 = dshr(fifo_valid, RspPtr) @[el2_dma_ctrl.scala 375:39]
    node _T_1087 = bits(_T_1086, 0, 0) @[el2_dma_ctrl.scala 375:39]
    node _T_1088 = dshr(fifo_dbg, RspPtr) @[el2_dma_ctrl.scala 375:58]
    node _T_1089 = bits(_T_1088, 0, 0) @[el2_dma_ctrl.scala 375:58]
    node _T_1090 = and(_T_1087, _T_1089) @[el2_dma_ctrl.scala 375:48]
    node _T_1091 = dshr(fifo_done, RspPtr) @[el2_dma_ctrl.scala 375:78]
    node _T_1092 = bits(_T_1091, 0, 0) @[el2_dma_ctrl.scala 375:78]
    node _T_1093 = and(_T_1090, _T_1092) @[el2_dma_ctrl.scala 375:67]
    io.dma_dbg_cmd_done <= _T_1093 @[el2_dma_ctrl.scala 375:25]
    node _T_1094 = bits(fifo_addr[RspPtr], 2, 2) @[el2_dma_ctrl.scala 376:49]
    node _T_1095 = bits(fifo_data[RspPtr], 63, 32) @[el2_dma_ctrl.scala 376:71]
    node _T_1096 = bits(fifo_data[RspPtr], 31, 0) @[el2_dma_ctrl.scala 376:98]
    node _T_1097 = mux(_T_1094, _T_1095, _T_1096) @[el2_dma_ctrl.scala 376:31]
    io.dma_dbg_rddata <= _T_1097 @[el2_dma_ctrl.scala 376:25]
    node _T_1098 = orr(fifo_error[RspPtr]) @[el2_dma_ctrl.scala 377:47]
    io.dma_dbg_cmd_fail <= _T_1098 @[el2_dma_ctrl.scala 377:25]
    node _T_1099 = dshr(fifo_valid, RdPtr) @[el2_dma_ctrl.scala 379:38]
    node _T_1100 = bits(_T_1099, 0, 0) @[el2_dma_ctrl.scala 379:38]
    node _T_1101 = dshr(fifo_done, RdPtr) @[el2_dma_ctrl.scala 379:58]
    node _T_1102 = bits(_T_1101, 0, 0) @[el2_dma_ctrl.scala 379:58]
    node _T_1103 = eq(_T_1102, UInt<1>("h00")) @[el2_dma_ctrl.scala 379:48]
    node _T_1104 = and(_T_1100, _T_1103) @[el2_dma_ctrl.scala 379:46]
    node _T_1105 = dshr(fifo_dbg, RdPtr) @[el2_dma_ctrl.scala 379:76]
    node _T_1106 = bits(_T_1105, 0, 0) @[el2_dma_ctrl.scala 379:76]
    node _T_1107 = and(_T_1104, _T_1106) @[el2_dma_ctrl.scala 379:66]
    node _T_1108 = or(dma_mem_addr_in_dccm, dma_mem_addr_in_iccm) @[el2_dma_ctrl.scala 379:111]
    node _T_1109 = or(_T_1108, dma_mem_addr_in_pic) @[el2_dma_ctrl.scala 379:134]
    node _T_1110 = not(_T_1109) @[el2_dma_ctrl.scala 379:88]
    node _T_1111 = bits(_T_1110, 0, 0) @[el2_dma_ctrl.scala 379:164]
    node _T_1112 = bits(dma_mem_sz_int, 1, 0) @[el2_dma_ctrl.scala 379:184]
    node _T_1113 = neq(_T_1112, UInt<2>("h02")) @[el2_dma_ctrl.scala 379:191]
    node _T_1114 = or(_T_1111, _T_1113) @[el2_dma_ctrl.scala 379:167]
    node _T_1115 = and(_T_1107, _T_1114) @[el2_dma_ctrl.scala 379:84]
    dma_dbg_cmd_error <= _T_1115 @[el2_dma_ctrl.scala 379:25]
    node _T_1116 = or(dma_mem_addr_in_dccm, dma_mem_addr_in_pic) @[el2_dma_ctrl.scala 383:64]
    node _T_1117 = and(dma_mem_req, _T_1116) @[el2_dma_ctrl.scala 383:40]
    node _T_1118 = geq(dma_nack_count, dma_nack_count_csr) @[el2_dma_ctrl.scala 383:105]
    node _T_1119 = and(_T_1117, _T_1118) @[el2_dma_ctrl.scala 383:87]
    io.dma_dccm_stall_any <= _T_1119 @[el2_dma_ctrl.scala 383:25]
    node _T_1120 = and(dma_mem_req, dma_mem_addr_in_iccm) @[el2_dma_ctrl.scala 384:40]
    node _T_1121 = geq(dma_nack_count, dma_nack_count_csr) @[el2_dma_ctrl.scala 384:81]
    node _T_1122 = and(_T_1120, _T_1121) @[el2_dma_ctrl.scala 384:63]
    io.dma_iccm_stall_any <= _T_1122 @[el2_dma_ctrl.scala 384:25]
    node _T_1123 = orr(fifo_valid) @[el2_dma_ctrl.scala 388:30]
    node _T_1124 = not(_T_1123) @[el2_dma_ctrl.scala 388:17]
    fifo_empty <= _T_1124 @[el2_dma_ctrl.scala 388:14]
    dma_nack_count_csr <= io.dec_tlu_dma_qos_prty @[el2_dma_ctrl.scala 392:22]
    node _T_1125 = geq(dma_nack_count, dma_nack_count_csr) @[el2_dma_ctrl.scala 393:45]
    node _T_1126 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 393:95]
    node _T_1127 = eq(_T_1126, UInt<1>("h00")) @[el2_dma_ctrl.scala 393:77]
    node _T_1128 = bits(_T_1127, 0, 0) @[Bitwise.scala 72:15]
    node _T_1129 = mux(_T_1128, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_1130 = bits(dma_nack_count, 2, 0) @[el2_dma_ctrl.scala 393:131]
    node _T_1131 = and(_T_1129, _T_1130) @[el2_dma_ctrl.scala 393:115]
    node _T_1132 = bits(dma_mem_req, 0, 0) @[el2_dma_ctrl.scala 393:156]
    node _T_1133 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 393:183]
    node _T_1134 = eq(_T_1133, UInt<1>("h00")) @[el2_dma_ctrl.scala 393:165]
    node _T_1135 = and(_T_1132, _T_1134) @[el2_dma_ctrl.scala 393:163]
    node _T_1136 = bits(dma_nack_count, 2, 0) @[el2_dma_ctrl.scala 393:218]
    node _T_1137 = add(_T_1136, UInt<1>("h01")) @[el2_dma_ctrl.scala 393:224]
    node _T_1138 = tail(_T_1137, 1) @[el2_dma_ctrl.scala 393:224]
    node _T_1139 = mux(_T_1135, _T_1138, UInt<1>("h00")) @[el2_dma_ctrl.scala 393:142]
    node dma_nack_count_d = mux(_T_1125, _T_1131, _T_1139) @[el2_dma_ctrl.scala 393:29]
    node _T_1140 = bits(dma_nack_count_d, 2, 0) @[el2_dma_ctrl.scala 396:31]
    node _T_1141 = bits(dma_mem_req, 0, 0) @[el2_dma_ctrl.scala 396:55]
    reg _T_1142 : UInt, dma_free_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1141 : @[Reg.scala 28:19]
      _T_1142 <= _T_1140 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    dma_nack_count <= _T_1142 @[el2_dma_ctrl.scala 395:22]
    node _T_1143 = dshr(fifo_valid, RdPtr) @[el2_dma_ctrl.scala 401:33]
    node _T_1144 = bits(_T_1143, 0, 0) @[el2_dma_ctrl.scala 401:33]
    node _T_1145 = dshr(fifo_rpend, RdPtr) @[el2_dma_ctrl.scala 401:54]
    node _T_1146 = bits(_T_1145, 0, 0) @[el2_dma_ctrl.scala 401:54]
    node _T_1147 = eq(_T_1146, UInt<1>("h00")) @[el2_dma_ctrl.scala 401:43]
    node _T_1148 = and(_T_1144, _T_1147) @[el2_dma_ctrl.scala 401:41]
    node _T_1149 = dshr(fifo_done, RdPtr) @[el2_dma_ctrl.scala 401:74]
    node _T_1150 = bits(_T_1149, 0, 0) @[el2_dma_ctrl.scala 401:74]
    node _T_1151 = eq(_T_1150, UInt<1>("h00")) @[el2_dma_ctrl.scala 401:64]
    node _T_1152 = and(_T_1148, _T_1151) @[el2_dma_ctrl.scala 401:62]
    node _T_1153 = or(dma_address_error, dma_alignment_error) @[el2_dma_ctrl.scala 401:104]
    node _T_1154 = or(_T_1153, dma_dbg_cmd_error) @[el2_dma_ctrl.scala 401:126]
    node _T_1155 = eq(_T_1154, UInt<1>("h00")) @[el2_dma_ctrl.scala 401:84]
    node _T_1156 = and(_T_1152, _T_1155) @[el2_dma_ctrl.scala 401:82]
    dma_mem_req <= _T_1156 @[el2_dma_ctrl.scala 401:20]
    node _T_1157 = or(dma_mem_addr_in_dccm, dma_mem_addr_in_pic) @[el2_dma_ctrl.scala 402:59]
    node _T_1158 = and(dma_mem_req, _T_1157) @[el2_dma_ctrl.scala 402:35]
    node _T_1159 = and(_T_1158, io.dccm_ready) @[el2_dma_ctrl.scala 402:82]
    io.dma_dccm_req <= _T_1159 @[el2_dma_ctrl.scala 402:20]
    node _T_1160 = and(dma_mem_req, dma_mem_addr_in_iccm) @[el2_dma_ctrl.scala 403:35]
    node _T_1161 = and(_T_1160, io.iccm_ready) @[el2_dma_ctrl.scala 403:58]
    io.dma_iccm_req <= _T_1161 @[el2_dma_ctrl.scala 403:20]
    io.dma_mem_tag <= RdPtr @[el2_dma_ctrl.scala 404:20]
    dma_mem_addr_int <= fifo_addr[RdPtr] @[el2_dma_ctrl.scala 405:20]
    dma_mem_sz_int <= fifo_sz[RdPtr] @[el2_dma_ctrl.scala 406:20]
    node _T_1162 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 407:61]
    node _T_1163 = eq(_T_1162, UInt<8>("h0f0")) @[el2_dma_ctrl.scala 407:67]
    node _T_1164 = and(io.dma_mem_write, _T_1163) @[el2_dma_ctrl.scala 407:44]
    node _T_1165 = bits(dma_mem_addr_int, 31, 3) @[el2_dma_ctrl.scala 407:101]
    node _T_1166 = bits(dma_mem_addr_int, 1, 0) @[el2_dma_ctrl.scala 407:131]
    node _T_1167 = cat(_T_1165, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_1168 = cat(_T_1167, _T_1166) @[Cat.scala 29:58]
    node _T_1169 = bits(dma_mem_addr_int, 31, 0) @[el2_dma_ctrl.scala 407:156]
    node _T_1170 = mux(_T_1164, _T_1168, _T_1169) @[el2_dma_ctrl.scala 407:26]
    io.dma_mem_addr <= _T_1170 @[el2_dma_ctrl.scala 407:20]
    node _T_1171 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 408:62]
    node _T_1172 = eq(_T_1171, UInt<4>("h0f")) @[el2_dma_ctrl.scala 408:68]
    node _T_1173 = bits(dma_mem_byteen, 7, 0) @[el2_dma_ctrl.scala 408:98]
    node _T_1174 = eq(_T_1173, UInt<8>("h0f0")) @[el2_dma_ctrl.scala 408:104]
    node _T_1175 = or(_T_1172, _T_1174) @[el2_dma_ctrl.scala 408:81]
    node _T_1176 = and(io.dma_mem_write, _T_1175) @[el2_dma_ctrl.scala 408:44]
    node _T_1177 = bits(dma_mem_sz_int, 2, 0) @[el2_dma_ctrl.scala 408:138]
    node _T_1178 = mux(_T_1176, UInt<2>("h02"), _T_1177) @[el2_dma_ctrl.scala 408:26]
    io.dma_mem_sz <= _T_1178 @[el2_dma_ctrl.scala 408:20]
    dma_mem_byteen <= fifo_byteen[RdPtr] @[el2_dma_ctrl.scala 409:20]
    node _T_1179 = dshr(fifo_write, RdPtr) @[el2_dma_ctrl.scala 410:33]
    node _T_1180 = bits(_T_1179, 0, 0) @[el2_dma_ctrl.scala 410:33]
    io.dma_mem_write <= _T_1180 @[el2_dma_ctrl.scala 410:20]
    io.dma_mem_wdata <= fifo_data[RdPtr] @[el2_dma_ctrl.scala 411:20]
    node _T_1181 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 415:47]
    node _T_1182 = and(io.dma_dccm_req, _T_1181) @[el2_dma_ctrl.scala 415:45]
    io.dma_pmu_dccm_read <= _T_1182 @[el2_dma_ctrl.scala 415:26]
    node _T_1183 = and(io.dma_dccm_req, io.dma_mem_write) @[el2_dma_ctrl.scala 416:45]
    io.dma_pmu_dccm_write <= _T_1183 @[el2_dma_ctrl.scala 416:26]
    node _T_1184 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 417:46]
    node _T_1185 = eq(io.dma_mem_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 417:67]
    node _T_1186 = and(_T_1184, _T_1185) @[el2_dma_ctrl.scala 417:65]
    io.dma_pmu_any_read <= _T_1186 @[el2_dma_ctrl.scala 417:26]
    node _T_1187 = or(io.dma_dccm_req, io.dma_iccm_req) @[el2_dma_ctrl.scala 418:46]
    node _T_1188 = and(_T_1187, io.dma_mem_write) @[el2_dma_ctrl.scala 418:65]
    io.dma_pmu_any_write <= _T_1188 @[el2_dma_ctrl.scala 418:26]
    reg _T_1189 : UInt<1>, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 423:12]
    _T_1189 <= fifo_full_spec @[el2_dma_ctrl.scala 423:12]
    fifo_full <= _T_1189 @[el2_dma_ctrl.scala 422:22]
    reg _T_1190 : UInt<1>, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 427:12]
    _T_1190 <= io.dbg_dma_bubble @[el2_dma_ctrl.scala 427:12]
    dbg_dma_bubble_bus <= _T_1190 @[el2_dma_ctrl.scala 426:22]
    reg _T_1191 : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 431:12]
    _T_1191 <= io.dma_dbg_cmd_done @[el2_dma_ctrl.scala 431:12]
    dma_dbg_cmd_done_q <= _T_1191 @[el2_dma_ctrl.scala 430:22]
    node _T_1192 = and(bus_cmd_valid, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 436:44]
    node _T_1193 = or(_T_1192, io.dbg_cmd_valid) @[el2_dma_ctrl.scala 436:65]
    node dma_buffer_c1_clken = or(_T_1193, io.clk_override) @[el2_dma_ctrl.scala 436:84]
    node _T_1194 = or(bus_cmd_valid, bus_rsp_valid) @[el2_dma_ctrl.scala 437:44]
    node _T_1195 = or(_T_1194, io.dbg_cmd_valid) @[el2_dma_ctrl.scala 437:60]
    node _T_1196 = or(_T_1195, io.dma_dbg_cmd_done) @[el2_dma_ctrl.scala 437:79]
    node _T_1197 = or(_T_1196, dma_dbg_cmd_done_q) @[el2_dma_ctrl.scala 437:101]
    node _T_1198 = orr(fifo_valid) @[el2_dma_ctrl.scala 437:136]
    node _T_1199 = or(_T_1197, _T_1198) @[el2_dma_ctrl.scala 437:122]
    node dma_free_clken = or(_T_1199, io.clk_override) @[el2_dma_ctrl.scala 437:141]
    inst dma_buffer_c1cgc of rvclkhdr_10 @[el2_dma_ctrl.scala 439:32]
    dma_buffer_c1cgc.clock <= clock
    dma_buffer_c1cgc.reset <= reset
    dma_buffer_c1cgc.io.en <= dma_buffer_c1_clken @[el2_dma_ctrl.scala 440:33]
    dma_buffer_c1cgc.io.scan_mode <= io.scan_mode @[el2_dma_ctrl.scala 441:33]
    dma_buffer_c1cgc.io.clk <= clock @[el2_dma_ctrl.scala 442:33]
    dma_buffer_c1_clk <= dma_buffer_c1cgc.io.l1clk @[el2_dma_ctrl.scala 443:33]
    inst dma_free_cgc of rvclkhdr_11 @[el2_dma_ctrl.scala 445:28]
    dma_free_cgc.clock <= clock
    dma_free_cgc.reset <= reset
    dma_free_cgc.io.en <= dma_free_clken @[el2_dma_ctrl.scala 446:29]
    dma_free_cgc.io.scan_mode <= io.scan_mode @[el2_dma_ctrl.scala 447:29]
    dma_free_cgc.io.clk <= clock @[el2_dma_ctrl.scala 448:29]
    dma_free_clk <= dma_free_cgc.io.l1clk @[el2_dma_ctrl.scala 449:29]
    inst dma_bus_cgc of rvclkhdr_12 @[el2_dma_ctrl.scala 451:27]
    dma_bus_cgc.clock <= clock
    dma_bus_cgc.reset <= reset
    dma_bus_cgc.io.en <= io.dma_bus_clk_en @[el2_dma_ctrl.scala 452:28]
    dma_bus_cgc.io.scan_mode <= io.scan_mode @[el2_dma_ctrl.scala 453:28]
    dma_bus_cgc.io.clk <= clock @[el2_dma_ctrl.scala 454:28]
    dma_bus_clk <= dma_bus_cgc.io.l1clk @[el2_dma_ctrl.scala 455:28]
    node wrbuf_en = and(io.dma_axi_awvalid, io.dma_axi_awready) @[el2_dma_ctrl.scala 459:46]
    node wrbuf_data_en = and(io.dma_axi_wvalid, io.dma_axi_wready) @[el2_dma_ctrl.scala 460:45]
    node wrbuf_cmd_sent = and(axi_mstr_prty_en, bus_cmd_write) @[el2_dma_ctrl.scala 461:40]
    node _T_1200 = bits(wrbuf_cmd_sent, 0, 0) @[el2_dma_ctrl.scala 462:42]
    node _T_1201 = eq(wrbuf_en, UInt<1>("h00")) @[el2_dma_ctrl.scala 462:51]
    node wrbuf_rst = and(_T_1200, _T_1201) @[el2_dma_ctrl.scala 462:49]
    node _T_1202 = bits(wrbuf_cmd_sent, 0, 0) @[el2_dma_ctrl.scala 463:42]
    node _T_1203 = eq(wrbuf_data_en, UInt<1>("h00")) @[el2_dma_ctrl.scala 463:51]
    node wrbuf_data_rst = and(_T_1202, _T_1203) @[el2_dma_ctrl.scala 463:49]
    node _T_1204 = mux(wrbuf_en, UInt<1>("h01"), wrbuf_vld) @[el2_dma_ctrl.scala 465:63]
    node _T_1205 = eq(wrbuf_rst, UInt<1>("h00")) @[el2_dma_ctrl.scala 465:92]
    node _T_1206 = and(_T_1204, _T_1205) @[el2_dma_ctrl.scala 465:90]
    reg _T_1207 : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 465:59]
    _T_1207 <= _T_1206 @[el2_dma_ctrl.scala 465:59]
    wrbuf_vld <= _T_1207 @[el2_dma_ctrl.scala 465:25]
    node _T_1208 = mux(wrbuf_data_en, UInt<1>("h01"), wrbuf_data_vld) @[el2_dma_ctrl.scala 467:63]
    node _T_1209 = eq(wrbuf_data_rst, UInt<1>("h00")) @[el2_dma_ctrl.scala 467:102]
    node _T_1210 = and(_T_1208, _T_1209) @[el2_dma_ctrl.scala 467:100]
    reg _T_1211 : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 467:59]
    _T_1211 <= _T_1210 @[el2_dma_ctrl.scala 467:59]
    wrbuf_data_vld <= _T_1211 @[el2_dma_ctrl.scala 467:25]
    reg wrbuf_tag : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when wrbuf_en : @[Reg.scala 28:19]
      wrbuf_tag <= io.dma_axi_awid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    reg wrbuf_sz : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when wrbuf_en : @[Reg.scala 28:19]
      wrbuf_sz <= io.dma_axi_awsize @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_1212 = and(wrbuf_en, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 477:62]
    inst rvclkhdr_10 of rvclkhdr_13 @[el2_lib.scala 508:23]
    rvclkhdr_10.clock <= clock
    rvclkhdr_10.reset <= reset
    rvclkhdr_10.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_10.io.en <= _T_1212 @[el2_lib.scala 511:17]
    rvclkhdr_10.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg wrbuf_addr : UInt, rvclkhdr_10.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    wrbuf_addr <= io.dma_axi_awaddr @[el2_lib.scala 514:16]
    node _T_1213 = and(wrbuf_data_en, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 479:66]
    inst rvclkhdr_11 of rvclkhdr_14 @[el2_lib.scala 508:23]
    rvclkhdr_11.clock <= clock
    rvclkhdr_11.reset <= reset
    rvclkhdr_11.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_11.io.en <= _T_1213 @[el2_lib.scala 511:17]
    rvclkhdr_11.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg wrbuf_data : UInt, rvclkhdr_11.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    wrbuf_data <= io.dma_axi_wdata @[el2_lib.scala 514:16]
    reg wrbuf_byteen : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when wrbuf_data_en : @[Reg.scala 28:19]
      wrbuf_byteen <= io.dma_axi_wstrb @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node rdbuf_en = and(io.dma_axi_arvalid, io.dma_axi_arready) @[el2_dma_ctrl.scala 487:58]
    node _T_1214 = eq(bus_cmd_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 488:44]
    node rdbuf_cmd_sent = and(axi_mstr_prty_en, _T_1214) @[el2_dma_ctrl.scala 488:42]
    node _T_1215 = bits(rdbuf_cmd_sent, 0, 0) @[el2_dma_ctrl.scala 489:54]
    node _T_1216 = eq(rdbuf_en, UInt<1>("h00")) @[el2_dma_ctrl.scala 489:63]
    node rdbuf_rst = and(_T_1215, _T_1216) @[el2_dma_ctrl.scala 489:61]
    node _T_1217 = mux(rdbuf_en, UInt<1>("h01"), rdbuf_vld) @[el2_dma_ctrl.scala 491:51]
    node _T_1218 = eq(rdbuf_rst, UInt<1>("h00")) @[el2_dma_ctrl.scala 491:80]
    node _T_1219 = and(_T_1217, _T_1218) @[el2_dma_ctrl.scala 491:78]
    reg _T_1220 : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_dma_ctrl.scala 491:47]
    _T_1220 <= _T_1219 @[el2_dma_ctrl.scala 491:47]
    rdbuf_vld <= _T_1220 @[el2_dma_ctrl.scala 491:13]
    reg rdbuf_tag : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when rdbuf_en : @[Reg.scala 28:19]
      rdbuf_tag <= io.dma_axi_arid @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    reg rdbuf_sz : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when rdbuf_en : @[Reg.scala 28:19]
      rdbuf_sz <= io.dma_axi_arsize @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    node _T_1221 = and(rdbuf_en, io.dma_bus_clk_en) @[el2_dma_ctrl.scala 501:55]
    inst rvclkhdr_12 of rvclkhdr_15 @[el2_lib.scala 508:23]
    rvclkhdr_12.clock <= clock
    rvclkhdr_12.reset <= reset
    rvclkhdr_12.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr_12.io.en <= _T_1221 @[el2_lib.scala 511:17]
    rvclkhdr_12.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg rdbuf_addr : UInt, rvclkhdr_12.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    rdbuf_addr <= io.dma_axi_araddr @[el2_lib.scala 514:16]
    node _T_1222 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[el2_dma_ctrl.scala 503:44]
    node _T_1223 = and(wrbuf_vld, _T_1222) @[el2_dma_ctrl.scala 503:42]
    node _T_1224 = not(_T_1223) @[el2_dma_ctrl.scala 503:30]
    io.dma_axi_awready <= _T_1224 @[el2_dma_ctrl.scala 503:27]
    node _T_1225 = eq(wrbuf_cmd_sent, UInt<1>("h00")) @[el2_dma_ctrl.scala 504:49]
    node _T_1226 = and(wrbuf_data_vld, _T_1225) @[el2_dma_ctrl.scala 504:47]
    node _T_1227 = not(_T_1226) @[el2_dma_ctrl.scala 504:30]
    io.dma_axi_wready <= _T_1227 @[el2_dma_ctrl.scala 504:27]
    node _T_1228 = eq(rdbuf_cmd_sent, UInt<1>("h00")) @[el2_dma_ctrl.scala 505:44]
    node _T_1229 = and(rdbuf_vld, _T_1228) @[el2_dma_ctrl.scala 505:42]
    node _T_1230 = not(_T_1229) @[el2_dma_ctrl.scala 505:30]
    io.dma_axi_arready <= _T_1230 @[el2_dma_ctrl.scala 505:27]
    node _T_1231 = and(wrbuf_vld, wrbuf_data_vld) @[el2_dma_ctrl.scala 509:51]
    node _T_1232 = or(_T_1231, rdbuf_vld) @[el2_dma_ctrl.scala 509:69]
    bus_cmd_valid <= _T_1232 @[el2_dma_ctrl.scala 509:37]
    node _T_1233 = and(bus_cmd_valid, dma_fifo_ready) @[el2_dma_ctrl.scala 510:54]
    axi_mstr_prty_en <= _T_1233 @[el2_dma_ctrl.scala 510:37]
    bus_cmd_write <= axi_mstr_sel @[el2_dma_ctrl.scala 511:37]
    bus_cmd_posted_write <= UInt<1>("h00") @[el2_dma_ctrl.scala 512:25]
    node _T_1234 = bits(axi_mstr_sel, 0, 0) @[el2_dma_ctrl.scala 513:57]
    node _T_1235 = mux(_T_1234, wrbuf_addr, rdbuf_addr) @[el2_dma_ctrl.scala 513:43]
    bus_cmd_addr <= _T_1235 @[el2_dma_ctrl.scala 513:37]
    node _T_1236 = bits(axi_mstr_sel, 0, 0) @[el2_dma_ctrl.scala 514:59]
    node _T_1237 = mux(_T_1236, wrbuf_sz, rdbuf_sz) @[el2_dma_ctrl.scala 514:45]
    bus_cmd_sz <= _T_1237 @[el2_dma_ctrl.scala 514:39]
    bus_cmd_wdata <= wrbuf_data @[el2_dma_ctrl.scala 515:37]
    bus_cmd_byteen <= wrbuf_byteen @[el2_dma_ctrl.scala 516:37]
    node _T_1238 = bits(axi_mstr_sel, 0, 0) @[el2_dma_ctrl.scala 517:57]
    node _T_1239 = mux(_T_1238, wrbuf_tag, rdbuf_tag) @[el2_dma_ctrl.scala 517:43]
    bus_cmd_tag <= _T_1239 @[el2_dma_ctrl.scala 517:37]
    bus_cmd_mid <= UInt<1>("h00") @[el2_dma_ctrl.scala 518:37]
    bus_cmd_prty <= UInt<1>("h00") @[el2_dma_ctrl.scala 519:37]
    node _T_1240 = and(wrbuf_vld, wrbuf_data_vld) @[el2_dma_ctrl.scala 523:43]
    node _T_1241 = and(_T_1240, rdbuf_vld) @[el2_dma_ctrl.scala 523:60]
    node _T_1242 = eq(_T_1241, UInt<1>("h01")) @[el2_dma_ctrl.scala 523:73]
    node _T_1243 = and(wrbuf_vld, wrbuf_data_vld) @[el2_dma_ctrl.scala 523:111]
    node _T_1244 = mux(_T_1242, axi_mstr_priority, _T_1243) @[el2_dma_ctrl.scala 523:31]
    axi_mstr_sel <= _T_1244 @[el2_dma_ctrl.scala 523:25]
    node axi_mstr_prty_in = not(axi_mstr_priority) @[el2_dma_ctrl.scala 524:27]
    node _T_1245 = bits(axi_mstr_prty_en, 0, 0) @[el2_dma_ctrl.scala 528:55]
    reg _T_1246 : UInt, dma_bus_clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_1245 : @[Reg.scala 28:19]
      _T_1246 <= axi_mstr_prty_in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    axi_mstr_priority <= _T_1246 @[el2_dma_ctrl.scala 527:27]
    node _T_1247 = dshr(fifo_valid, RspPtr) @[el2_dma_ctrl.scala 531:39]
    node _T_1248 = bits(_T_1247, 0, 0) @[el2_dma_ctrl.scala 531:39]
    node _T_1249 = dshr(fifo_dbg, RspPtr) @[el2_dma_ctrl.scala 531:59]
    node _T_1250 = bits(_T_1249, 0, 0) @[el2_dma_ctrl.scala 531:59]
    node _T_1251 = eq(_T_1250, UInt<1>("h00")) @[el2_dma_ctrl.scala 531:50]
    node _T_1252 = and(_T_1248, _T_1251) @[el2_dma_ctrl.scala 531:48]
    node _T_1253 = dshr(fifo_done_bus, RspPtr) @[el2_dma_ctrl.scala 531:83]
    node _T_1254 = bits(_T_1253, 0, 0) @[el2_dma_ctrl.scala 531:83]
    node axi_rsp_valid = and(_T_1252, _T_1254) @[el2_dma_ctrl.scala 531:68]
    node _T_1255 = dshr(fifo_write, RspPtr) @[el2_dma_ctrl.scala 533:39]
    node axi_rsp_write = bits(_T_1255, 0, 0) @[el2_dma_ctrl.scala 533:39]
    node _T_1256 = bits(fifo_error[RspPtr], 0, 0) @[el2_dma_ctrl.scala 534:51]
    node _T_1257 = bits(fifo_error[RspPtr], 1, 1) @[el2_dma_ctrl.scala 534:83]
    node _T_1258 = mux(_T_1257, UInt<2>("h03"), UInt<1>("h00")) @[el2_dma_ctrl.scala 534:64]
    node axi_rsp_error = mux(_T_1256, UInt<2>("h02"), _T_1258) @[el2_dma_ctrl.scala 534:32]
    node _T_1259 = and(axi_rsp_valid, axi_rsp_write) @[el2_dma_ctrl.scala 540:44]
    io.dma_axi_bvalid <= _T_1259 @[el2_dma_ctrl.scala 540:27]
    node _T_1260 = bits(axi_rsp_error, 1, 0) @[el2_dma_ctrl.scala 541:49]
    io.dma_axi_bresp <= _T_1260 @[el2_dma_ctrl.scala 541:33]
    io.dma_axi_bid <= fifo_tag[RspPtr] @[el2_dma_ctrl.scala 542:33]
    node _T_1261 = eq(axi_rsp_write, UInt<1>("h00")) @[el2_dma_ctrl.scala 544:46]
    node _T_1262 = and(axi_rsp_valid, _T_1261) @[el2_dma_ctrl.scala 544:44]
    io.dma_axi_rvalid <= _T_1262 @[el2_dma_ctrl.scala 544:27]
    io.dma_axi_rresp <= axi_rsp_error @[el2_dma_ctrl.scala 545:33]
    node _T_1263 = bits(fifo_data[RspPtr], 63, 0) @[el2_dma_ctrl.scala 546:51]
    io.dma_axi_rdata <= _T_1263 @[el2_dma_ctrl.scala 546:35]
    io.dma_axi_rlast <= UInt<1>("h01") @[el2_dma_ctrl.scala 547:33]
    io.dma_axi_rid <= fifo_tag[RspPtr] @[el2_dma_ctrl.scala 548:37]
    bus_posted_write_done <= UInt<1>("h00") @[el2_dma_ctrl.scala 550:25]
    node _T_1264 = or(io.dma_axi_bvalid, io.dma_axi_rvalid) @[el2_dma_ctrl.scala 551:59]
    bus_rsp_valid <= _T_1264 @[el2_dma_ctrl.scala 551:37]
    node _T_1265 = and(io.dma_axi_bvalid, io.dma_axi_bready) @[el2_dma_ctrl.scala 552:60]
    node _T_1266 = and(io.dma_axi_rvalid, io.dma_axi_rready) @[el2_dma_ctrl.scala 552:102]
    node _T_1267 = or(_T_1265, _T_1266) @[el2_dma_ctrl.scala 552:81]
    bus_rsp_sent <= _T_1267 @[el2_dma_ctrl.scala 552:37]
    
