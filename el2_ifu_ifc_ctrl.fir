;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_ifc_ctrl : 
  module el2_ifu_ifc_ctrl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip free_clk : UInt<1>, flip active_clk : UInt<1>, flip rst_l : UInt<1>, flip scan_mode : UInt<1>, flip ic_hit_f : UInt<1>, flip ifu_ic_mb_empty : UInt<1>, flip ifu_fb_consume1 : UInt<1>, flip ifu_fb_consume2 : UInt<1>, flip dec_tlu_flush_noredir_wb : UInt<1>, flip exu_flush_final : UInt<1>, flip exu_flush_path_final : UInt<32>, flip ifu_bp_hit_taken_f : UInt<1>, flip ifu_bp_btb_target_f : UInt<32>, flip ic_dma_active : UInt<1>, flip ic_write_stall : UInt<1>, flip dma_iccm_stall_any : UInt<1>, flip dec_tlu_mrac_ff : UInt<32>, ifc_fetch_addr_f : UInt<32>, ifc_fetch_addr_bf : UInt<32>, ifc_fetch_req_f : UInt<1>, ifu_pmu_fetch_stall : UInt<1>, ifc_fetch_uncacheable_bf : UInt<1>, ifc_fetch_req_bf : UInt<1>, ifc_fetch_req_bf_raw : UInt<1>, ifc_iccm_access_bf : UInt<1>, ifc_region_acc_fault_bf : UInt<1>, ifc_dma_access_ok : UInt<1>, flip testin : UInt<1>, test1 : UInt}
    
    io.ifc_fetch_addr_f <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 39:23]
    io.ifc_fetch_addr_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 40:24]
    io.ifc_fetch_req_f <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 41:22]
    io.ifu_pmu_fetch_stall <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 42:26]
    io.ifc_fetch_uncacheable_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 43:31]
    io.ifc_fetch_req_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 44:23]
    io.ifc_fetch_req_bf_raw <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 45:27]
    io.ifc_iccm_access_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 46:25]
    io.ifc_region_acc_fault_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 47:30]
    io.ifc_dma_access_ok <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 48:24]
    wire fetch_addr_bf : UInt<32>
    fetch_addr_bf <= UInt<1>("h00")
    wire fetch_addr_next : UInt<32>
    fetch_addr_next <= UInt<1>("h00")
    wire fb_write_f : UInt<4>
    fb_write_f <= UInt<1>("h00")
    wire fb_write_ns : UInt<4>
    fb_write_ns <= UInt<1>("h00")
    wire fb_full_f_ns : UInt<1>
    fb_full_f_ns <= UInt<1>("h00")
    wire fb_full_f : UInt<1>
    fb_full_f <= UInt<1>("h00")
    wire fb_right : UInt<1>
    fb_right <= UInt<1>("h00")
    wire fb_right2 : UInt<1>
    fb_right2 <= UInt<1>("h00")
    wire fb_left : UInt<1>
    fb_left <= UInt<1>("h00")
    wire wfm : UInt<1>
    wfm <= UInt<1>("h00")
    wire idle : UInt<1>
    idle <= UInt<1>("h00")
    wire sel_last_addr_bf : UInt<1>
    sel_last_addr_bf <= UInt<1>("h00")
    wire sel_btb_addr_bf : UInt<1>
    sel_btb_addr_bf <= UInt<1>("h00")
    wire sel_next_addr_bf : UInt<1>
    sel_next_addr_bf <= UInt<1>("h00")
    wire miss_f : UInt<1>
    miss_f <= UInt<1>("h00")
    wire miss_a : UInt<1>
    miss_a <= UInt<1>("h00")
    wire flush_fb : UInt<1>
    flush_fb <= UInt<1>("h00")
    wire dma_iccm_stall_any_f : UInt<1>
    dma_iccm_stall_any_f <= UInt<1>("h00")
    wire mb_empty_mod : UInt<1>
    mb_empty_mod <= UInt<1>("h00")
    wire goto_idle : UInt<1>
    goto_idle <= UInt<1>("h00")
    wire leave_idle : UInt<1>
    leave_idle <= UInt<1>("h00")
    wire fetch_bf_en : UInt<1>
    fetch_bf_en <= UInt<1>("h00")
    wire line_wrap : UInt<1>
    line_wrap <= UInt<1>("h00")
    wire fetch_addr_next_1 : UInt<1>
    fetch_addr_next_1 <= UInt<1>("h00")
    reg _T : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 76:34]
    _T <= io.dma_iccm_stall_any @[el2_ifu_ifc_ctrl.scala 76:34]
    dma_iccm_stall_any_f <= _T @[el2_ifu_ifc_ctrl.scala 76:24]
    node dma_stall = or(io.ic_dma_active, dma_iccm_stall_any_f) @[el2_ifu_ifc_ctrl.scala 77:36]
    reg _T_1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 79:34]
    _T_1 <= io.dma_iccm_stall_any @[el2_ifu_ifc_ctrl.scala 79:34]
    dma_iccm_stall_any_f <= _T_1 @[el2_ifu_ifc_ctrl.scala 79:24]
    reg _T_2 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 80:20]
    _T_2 <= miss_f @[el2_ifu_ifc_ctrl.scala 80:20]
    miss_a <= _T_2 @[el2_ifu_ifc_ctrl.scala 80:10]
    node _T_3 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 81:23]
    node _T_4 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 81:46]
    node _T_5 = not(io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 81:68]
    node _T_6 = or(_T_4, _T_5) @[el2_ifu_ifc_ctrl.scala 81:66]
    node _T_7 = and(_T_3, _T_6) @[el2_ifu_ifc_ctrl.scala 81:43]
    sel_last_addr_bf <= _T_7 @[el2_ifu_ifc_ctrl.scala 81:20]
    node _T_8 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 82:23]
    node _T_9 = and(_T_8, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 82:43]
    node _T_10 = and(_T_9, io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 82:64]
    node _T_11 = and(_T_10, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 82:88]
    sel_btb_addr_bf <= _T_11 @[el2_ifu_ifc_ctrl.scala 82:20]
    node _T_12 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 83:23]
    node _T_13 = and(_T_12, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 83:43]
    node _T_14 = not(io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 83:66]
    node _T_15 = and(_T_13, _T_14) @[el2_ifu_ifc_ctrl.scala 83:64]
    node _T_16 = and(_T_15, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 83:89]
    sel_next_addr_bf <= _T_16 @[el2_ifu_ifc_ctrl.scala 83:20]
    node _T_17 = bits(io.exu_flush_final, 0, 0) @[el2_ifu_ifc_ctrl.scala 84:55]
    node _T_18 = cat(io.exu_flush_path_final, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_19 = bits(sel_last_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 85:52]
    node _T_20 = cat(io.ifc_fetch_addr_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_21 = bits(sel_btb_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 86:51]
    node _T_22 = cat(io.ifu_bp_btb_target_f, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_23 = bits(sel_next_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 87:52]
    node _T_24 = cat(fetch_addr_next, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_25 = mux(_T_17, _T_18, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_26 = mux(_T_19, _T_20, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_27 = mux(_T_21, _T_22, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_28 = mux(_T_23, _T_24, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_29 = or(_T_25, _T_26) @[Mux.scala 27:72]
    node _T_30 = or(_T_29, _T_27) @[Mux.scala 27:72]
    node _T_31 = or(_T_30, _T_28) @[Mux.scala 27:72]
    wire _T_32 : UInt<33> @[Mux.scala 27:72]
    _T_32 <= _T_31 @[Mux.scala 27:72]
    fetch_addr_bf <= _T_32 @[el2_ifu_ifc_ctrl.scala 84:17]
    node _T_33 = bits(io.ifc_fetch_addr_f, 31, 2) @[el2_ifu_ifc_ctrl.scala 88:46]
    node _T_34 = add(_T_33, UInt<1>("h01")) @[el2_ifu_ifc_ctrl.scala 88:53]
    node _T_35 = tail(_T_34, 1) @[el2_ifu_ifc_ctrl.scala 88:53]
    node _T_36 = cat(_T_35, fetch_addr_next_1) @[Cat.scala 29:58]
    fetch_addr_next <= _T_36 @[el2_ifu_ifc_ctrl.scala 88:19]
    node _T_37 = bits(fetch_addr_next, 6, 6) @[el2_ifu_ifc_ctrl.scala 89:32]
    node _T_38 = bits(io.ifc_fetch_addr_f, 6, 6) @[el2_ifu_ifc_ctrl.scala 89:75]
    node _T_39 = xor(_T_37, _T_38) @[el2_ifu_ifc_ctrl.scala 89:54]
    line_wrap <= _T_39 @[el2_ifu_ifc_ctrl.scala 89:13]
    node _T_40 = not(line_wrap) @[el2_ifu_ifc_ctrl.scala 90:24]
    node _T_41 = bits(io.ifc_fetch_addr_f, 1, 1) @[el2_ifu_ifc_ctrl.scala 90:56]
    node _T_42 = and(_T_40, _T_41) @[el2_ifu_ifc_ctrl.scala 90:35]
    fetch_addr_next_1 <= _T_42 @[el2_ifu_ifc_ctrl.scala 90:21]
    node _T_43 = not(idle) @[el2_ifu_ifc_ctrl.scala 91:30]
    io.ifc_fetch_req_bf_raw <= _T_43 @[el2_ifu_ifc_ctrl.scala 91:27]
    node _T_44 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctrl.scala 92:91]
    node _T_45 = not(_T_44) @[el2_ifu_ifc_ctrl.scala 92:70]
    node _T_46 = and(fb_full_f_ns, _T_45) @[el2_ifu_ifc_ctrl.scala 92:68]
    node _T_47 = not(_T_46) @[el2_ifu_ifc_ctrl.scala 92:53]
    node _T_48 = and(io.ifc_fetch_req_bf_raw, _T_47) @[el2_ifu_ifc_ctrl.scala 92:51]
    node _T_49 = not(dma_stall) @[el2_ifu_ifc_ctrl.scala 93:5]
    node _T_50 = and(_T_48, _T_49) @[el2_ifu_ifc_ctrl.scala 92:114]
    node _T_51 = not(io.ic_write_stall) @[el2_ifu_ifc_ctrl.scala 93:18]
    node _T_52 = and(_T_50, _T_51) @[el2_ifu_ifc_ctrl.scala 93:16]
    node _T_53 = not(io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 93:39]
    node _T_54 = and(_T_52, _T_53) @[el2_ifu_ifc_ctrl.scala 93:37]
    io.ifc_fetch_req_bf <= _T_54 @[el2_ifu_ifc_ctrl.scala 92:23]
    io.test1 <= io.ifc_fetch_req_bf @[el2_ifu_ifc_ctrl.scala 96:12]
    
