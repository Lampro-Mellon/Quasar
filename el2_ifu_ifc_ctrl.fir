;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_ifc_ctrl : 
  module el2_ifu_ifc_ctrl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip free_clk : UInt<1>, flip active_clk : UInt<1>, flip rst_l : UInt<1>, flip scan_mode : UInt<1>, flip ic_hit_f : UInt<1>, flip ifu_ic_mb_empty : UInt<1>, flip ifu_fb_consume1 : UInt<1>, flip ifu_fb_consume2 : UInt<1>, flip dec_tlu_flush_noredir_wb : UInt<1>, flip exu_flush_final : UInt<1>, flip exu_flush_path_final : UInt<31>, flip ifu_bp_hit_taken_f : UInt<1>, flip ifu_bp_btb_target_f : UInt<31>, flip ic_dma_active : UInt<1>, flip ic_write_stall : UInt<1>, flip dma_iccm_stall_any : UInt<1>, flip dec_tlu_mrac_ff : UInt<31>, ifc_fetch_addr_f : UInt<31>, ifc_fetch_addr_bf : UInt<31>, ifc_fetch_req_f : UInt<1>, ifu_pmu_fetch_stall : UInt<1>, ifc_fetch_uncacheable_bf : UInt<1>, ifc_fetch_req_bf : UInt<1>, ifc_fetch_req_bf_raw : UInt<1>, ifc_iccm_access_bf : UInt<1>, ifc_region_acc_fault_bf : UInt<1>, ifc_dma_access_ok : UInt<1>, flip testin : UInt<1>, test1 : UInt}
    
    wire fetch_addr_bf : UInt<32>
    fetch_addr_bf <= UInt<1>("h00")
    wire fetch_addr_next : UInt<32>
    fetch_addr_next <= UInt<1>("h00")
    wire fb_write_ns : UInt<4>
    fb_write_ns <= UInt<1>("h00")
    wire fb_write_f : UInt<4>
    fb_write_f <= UInt<1>("h00")
    wire fb_full_f_ns : UInt<1>
    fb_full_f_ns <= UInt<1>("h00")
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
    wire miss_a : UInt<1> @[el2_ifu_ifc_ctrl.scala 56:20]
    wire flush_fb : UInt<1>
    flush_fb <= UInt<1>("h00")
    wire mb_empty_mod : UInt<1>
    mb_empty_mod <= UInt<1>("h00")
    wire goto_idle : UInt<1>
    goto_idle <= UInt<1>("h00")
    wire leave_idle : UInt<1>
    leave_idle <= UInt<1>("h00")
    wire fetch_bf_en : UInt<1>
    fetch_bf_en <= UInt<1>("h00")
    wire line_wrap : UInt<1>
    line_wrap <= io.testin
    wire fetch_addr_next_1 : UInt<1>
    fetch_addr_next_1 <= UInt<1>("h00")
    wire state : UInt<2>
    state <= UInt<1>("h00")
    io.ifc_fetch_addr_f <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 67:23]
    io.ifc_fetch_addr_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 68:24]
    io.ifc_fetch_req_f <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 69:22]
    io.ifu_pmu_fetch_stall <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 70:26]
    io.ifc_fetch_uncacheable_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 71:31]
    io.ifc_fetch_req_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 72:23]
    io.ifc_fetch_req_bf_raw <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 73:27]
    io.ifc_iccm_access_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 74:25]
    io.ifc_region_acc_fault_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 75:30]
    io.ifc_dma_access_ok <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 76:24]
    reg dma_iccm_stall_any_f : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 78:37]
    dma_iccm_stall_any_f <= io.dma_iccm_stall_any @[el2_ifu_ifc_ctrl.scala 78:37]
    node dma_stall = or(io.ic_dma_active, dma_iccm_stall_any_f) @[el2_ifu_ifc_ctrl.scala 79:36]
    reg _T : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 80:20]
    _T <= miss_f @[el2_ifu_ifc_ctrl.scala 80:20]
    miss_a <= _T @[el2_ifu_ifc_ctrl.scala 80:10]
    node _T_1 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 82:23]
    node _T_2 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 82:46]
    node _T_3 = not(io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 82:68]
    node _T_4 = or(_T_2, _T_3) @[el2_ifu_ifc_ctrl.scala 82:66]
    node _T_5 = and(_T_1, _T_4) @[el2_ifu_ifc_ctrl.scala 82:43]
    sel_last_addr_bf <= _T_5 @[el2_ifu_ifc_ctrl.scala 82:20]
    node _T_6 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 83:23]
    node _T_7 = and(_T_6, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 83:43]
    node _T_8 = and(_T_7, io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 83:64]
    node _T_9 = and(_T_8, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 83:88]
    sel_btb_addr_bf <= _T_9 @[el2_ifu_ifc_ctrl.scala 83:20]
    node _T_10 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 84:23]
    node _T_11 = and(_T_10, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 84:43]
    node _T_12 = not(io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 84:66]
    node _T_13 = and(_T_11, _T_12) @[el2_ifu_ifc_ctrl.scala 84:64]
    node _T_14 = and(_T_13, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 84:89]
    sel_next_addr_bf <= _T_14 @[el2_ifu_ifc_ctrl.scala 84:20]
    node _T_15 = bits(fetch_addr_next, 6, 6) @[el2_ifu_ifc_ctrl.scala 88:31]
    node _T_16 = bits(io.ifc_fetch_addr_f, 6, 6) @[el2_ifu_ifc_ctrl.scala 88:74]
    node _T_17 = xor(_T_15, _T_16) @[el2_ifu_ifc_ctrl.scala 88:53]
    line_wrap <= _T_17 @[el2_ifu_ifc_ctrl.scala 88:13]
    node _T_18 = bits(line_wrap, 0, 0) @[el2_ifu_ifc_ctrl.scala 90:44]
    node _T_19 = bits(io.ifc_fetch_addr_f, 0, 0) @[el2_ifu_ifc_ctrl.scala 90:72]
    node _T_20 = mux(_T_18, UInt<1>("h00"), _T_19) @[el2_ifu_ifc_ctrl.scala 90:27]
    fetch_addr_next_1 <= _T_20 @[el2_ifu_ifc_ctrl.scala 90:21]
    node _T_21 = add(io.ifc_fetch_addr_f, UInt<2>("h02")) @[el2_ifu_ifc_ctrl.scala 92:45]
    node _T_22 = tail(_T_21, 1) @[el2_ifu_ifc_ctrl.scala 92:45]
    node _T_23 = cat(_T_22, fetch_addr_next_1) @[Cat.scala 29:58]
    fetch_addr_next <= _T_23 @[el2_ifu_ifc_ctrl.scala 92:19]
    node _T_24 = bits(io.exu_flush_final, 0, 0) @[el2_ifu_ifc_ctrl.scala 96:56]
    node _T_25 = bits(sel_last_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 97:46]
    node _T_26 = bits(sel_btb_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 98:45]
    node _T_27 = bits(sel_next_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 99:46]
    node _T_28 = mux(_T_24, io.exu_flush_path_final, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_29 = mux(_T_25, io.ifc_fetch_addr_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_30 = mux(_T_26, io.ifu_bp_btb_target_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_31 = mux(_T_27, fetch_addr_next, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_32 = or(_T_28, _T_29) @[Mux.scala 27:72]
    node _T_33 = or(_T_32, _T_30) @[Mux.scala 27:72]
    node _T_34 = or(_T_33, _T_31) @[Mux.scala 27:72]
    wire _T_35 : UInt<32> @[Mux.scala 27:72]
    _T_35 <= _T_34 @[Mux.scala 27:72]
    io.ifc_fetch_addr_bf <= _T_35 @[el2_ifu_ifc_ctrl.scala 96:24]
    node _T_36 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 102:88]
    reg _T_37 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_36 : @[Reg.scala 28:19]
      _T_37 <= io.ifc_fetch_addr_bf @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.ifc_fetch_addr_f <= _T_37 @[el2_ifu_ifc_ctrl.scala 102:23]
    node _T_38 = not(idle) @[el2_ifu_ifc_ctrl.scala 104:30]
    io.ifc_fetch_req_bf_raw <= _T_38 @[el2_ifu_ifc_ctrl.scala 104:27]
    reg _T_39 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 106:32]
    _T_39 <= io.ifc_fetch_addr_bf @[el2_ifu_ifc_ctrl.scala 106:32]
    io.ifc_fetch_req_f <= _T_39 @[el2_ifu_ifc_ctrl.scala 106:22]
    io.test1 <= io.ifc_fetch_addr_bf @[el2_ifu_ifc_ctrl.scala 107:12]
    node _T_40 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctrl.scala 109:91]
    node _T_41 = not(_T_40) @[el2_ifu_ifc_ctrl.scala 109:70]
    node _T_42 = and(fb_full_f_ns, _T_41) @[el2_ifu_ifc_ctrl.scala 109:68]
    node _T_43 = not(_T_42) @[el2_ifu_ifc_ctrl.scala 109:53]
    node _T_44 = and(io.ifc_fetch_req_bf_raw, _T_43) @[el2_ifu_ifc_ctrl.scala 109:51]
    node _T_45 = not(dma_stall) @[el2_ifu_ifc_ctrl.scala 110:5]
    node _T_46 = and(_T_44, _T_45) @[el2_ifu_ifc_ctrl.scala 109:114]
    node _T_47 = not(io.ic_write_stall) @[el2_ifu_ifc_ctrl.scala 110:18]
    node _T_48 = and(_T_46, _T_47) @[el2_ifu_ifc_ctrl.scala 110:16]
    node _T_49 = not(io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 110:39]
    node _T_50 = and(_T_48, _T_49) @[el2_ifu_ifc_ctrl.scala 110:37]
    io.ifc_fetch_req_bf <= _T_50 @[el2_ifu_ifc_ctrl.scala 109:23]
    node _T_51 = not(io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 112:34]
    node _T_52 = and(io.ifc_fetch_req_f, _T_51) @[el2_ifu_ifc_ctrl.scala 112:32]
    node _T_53 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 112:49]
    node _T_54 = and(_T_52, _T_53) @[el2_ifu_ifc_ctrl.scala 112:47]
    miss_f <= _T_54 @[el2_ifu_ifc_ctrl.scala 112:10]
    node _T_55 = and(io.exu_flush_final, io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 114:35]
    goto_idle <= _T_55 @[el2_ifu_ifc_ctrl.scala 114:13]
    node _T_56 = or(io.ifu_ic_mb_empty, io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 116:39]
    node _T_57 = not(dma_stall) @[el2_ifu_ifc_ctrl.scala 116:63]
    node _T_58 = and(_T_56, _T_57) @[el2_ifu_ifc_ctrl.scala 116:61]
    node _T_59 = not(miss_f) @[el2_ifu_ifc_ctrl.scala 116:76]
    node _T_60 = and(_T_58, _T_59) @[el2_ifu_ifc_ctrl.scala 116:74]
    node _T_61 = not(miss_a) @[el2_ifu_ifc_ctrl.scala 116:86]
    node _T_62 = and(_T_60, _T_61) @[el2_ifu_ifc_ctrl.scala 116:84]
    mb_empty_mod <= _T_62 @[el2_ifu_ifc_ctrl.scala 116:16]
    node _T_63 = not(io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 118:38]
    node _T_64 = and(io.exu_flush_final, _T_63) @[el2_ifu_ifc_ctrl.scala 118:36]
    node _T_65 = and(_T_64, idle) @[el2_ifu_ifc_ctrl.scala 118:67]
    leave_idle <= _T_65 @[el2_ifu_ifc_ctrl.scala 118:14]
    node _T_66 = bits(state, 1, 1) @[el2_ifu_ifc_ctrl.scala 120:29]
    node _T_67 = not(_T_66) @[el2_ifu_ifc_ctrl.scala 120:23]
    node _T_68 = bits(state, 0, 0) @[el2_ifu_ifc_ctrl.scala 120:40]
    node _T_69 = and(_T_67, _T_68) @[el2_ifu_ifc_ctrl.scala 120:33]
    node _T_70 = and(_T_69, miss_f) @[el2_ifu_ifc_ctrl.scala 120:44]
    node _T_71 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 120:55]
    node _T_72 = and(_T_70, _T_71) @[el2_ifu_ifc_ctrl.scala 120:53]
    node _T_73 = bits(state, 1, 1) @[el2_ifu_ifc_ctrl.scala 121:11]
    node _T_74 = not(mb_empty_mod) @[el2_ifu_ifc_ctrl.scala 121:17]
    node _T_75 = and(_T_73, _T_74) @[el2_ifu_ifc_ctrl.scala 121:15]
    node _T_76 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 121:33]
    node _T_77 = and(_T_75, _T_76) @[el2_ifu_ifc_ctrl.scala 121:31]
    node next_state_1 = or(_T_72, _T_77) @[el2_ifu_ifc_ctrl.scala 120:67]
    node _T_78 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 123:23]
    node _T_79 = and(_T_78, leave_idle) @[el2_ifu_ifc_ctrl.scala 123:34]
    node _T_80 = bits(state, 0, 0) @[el2_ifu_ifc_ctrl.scala 123:56]
    node _T_81 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 123:62]
    node _T_82 = and(_T_80, _T_81) @[el2_ifu_ifc_ctrl.scala 123:60]
    node next_state_0 = or(_T_79, _T_82) @[el2_ifu_ifc_ctrl.scala 123:48]
    node _T_83 = cat(next_state_0, next_state_0) @[Cat.scala 29:58]
    reg _T_84 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 125:19]
    _T_84 <= _T_83 @[el2_ifu_ifc_ctrl.scala 125:19]
    state <= _T_84 @[el2_ifu_ifc_ctrl.scala 125:9]
    flush_fb <= io.exu_flush_final @[el2_ifu_ifc_ctrl.scala 127:12]
    node _T_85 = not(io.ifu_fb_consume2) @[el2_ifu_ifc_ctrl.scala 129:38]
    node _T_86 = and(io.ifu_fb_consume1, _T_85) @[el2_ifu_ifc_ctrl.scala 129:36]
    node _T_87 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 129:61]
    node _T_88 = or(_T_87, miss_f) @[el2_ifu_ifc_ctrl.scala 129:81]
    node _T_89 = and(_T_86, _T_88) @[el2_ifu_ifc_ctrl.scala 129:58]
    node _T_90 = and(io.ifu_fb_consume2, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 130:25]
    node _T_91 = or(_T_89, _T_90) @[el2_ifu_ifc_ctrl.scala 129:92]
    fb_right <= _T_91 @[el2_ifu_ifc_ctrl.scala 129:12]
    node _T_92 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 132:39]
    node _T_93 = or(_T_92, miss_f) @[el2_ifu_ifc_ctrl.scala 132:59]
    node _T_94 = and(io.ifu_fb_consume2, _T_93) @[el2_ifu_ifc_ctrl.scala 132:36]
    fb_right2 <= _T_94 @[el2_ifu_ifc_ctrl.scala 132:13]
    node _T_95 = or(io.ifu_fb_consume1, io.ifu_fb_consume2) @[el2_ifu_ifc_ctrl.scala 133:56]
    node _T_96 = not(_T_95) @[el2_ifu_ifc_ctrl.scala 133:35]
    node _T_97 = and(io.ifc_fetch_req_f, _T_96) @[el2_ifu_ifc_ctrl.scala 133:33]
    node _T_98 = not(miss_f) @[el2_ifu_ifc_ctrl.scala 133:80]
    node _T_99 = and(_T_97, _T_98) @[el2_ifu_ifc_ctrl.scala 133:78]
    fb_left <= _T_99 @[el2_ifu_ifc_ctrl.scala 133:11]
    node _T_100 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 136:6]
    node _T_101 = and(_T_100, fb_right) @[el2_ifu_ifc_ctrl.scala 136:16]
    node _T_102 = bits(_T_101, 0, 0) @[el2_ifu_ifc_ctrl.scala 136:28]
    node _T_103 = bits(fb_write_f, 3, 1) @[el2_ifu_ifc_ctrl.scala 136:62]
    node _T_104 = cat(UInt<1>("h00"), _T_103) @[Cat.scala 29:58]
    node _T_105 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 137:6]
    node _T_106 = and(_T_105, fb_right2) @[el2_ifu_ifc_ctrl.scala 137:16]
    node _T_107 = bits(_T_106, 0, 0) @[el2_ifu_ifc_ctrl.scala 137:29]
    node _T_108 = bits(fb_write_f, 3, 2) @[el2_ifu_ifc_ctrl.scala 137:63]
    node _T_109 = cat(UInt<2>("h00"), _T_108) @[Cat.scala 29:58]
    node _T_110 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 138:6]
    node _T_111 = and(_T_110, fb_left) @[el2_ifu_ifc_ctrl.scala 138:16]
    node _T_112 = bits(_T_111, 0, 0) @[el2_ifu_ifc_ctrl.scala 138:27]
    node _T_113 = bits(fb_write_f, 2, 0) @[el2_ifu_ifc_ctrl.scala 138:51]
    node _T_114 = cat(_T_113, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_115 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 139:6]
    node _T_116 = not(fb_right) @[el2_ifu_ifc_ctrl.scala 139:18]
    node _T_117 = and(_T_115, _T_116) @[el2_ifu_ifc_ctrl.scala 139:16]
    node _T_118 = not(fb_right2) @[el2_ifu_ifc_ctrl.scala 139:30]
    node _T_119 = and(_T_117, _T_118) @[el2_ifu_ifc_ctrl.scala 139:28]
    node _T_120 = not(fb_left) @[el2_ifu_ifc_ctrl.scala 139:43]
    node _T_121 = and(_T_119, _T_120) @[el2_ifu_ifc_ctrl.scala 139:41]
    node _T_122 = bits(_T_121, 0, 0) @[el2_ifu_ifc_ctrl.scala 139:53]
    node _T_123 = bits(fb_write_f, 3, 0) @[el2_ifu_ifc_ctrl.scala 139:73]
    node _T_124 = mux(io.exu_flush_final, UInt<1>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_125 = mux(_T_102, _T_104, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_126 = mux(_T_107, _T_109, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_127 = mux(_T_112, _T_114, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_128 = mux(_T_122, _T_123, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_129 = or(_T_124, _T_125) @[Mux.scala 27:72]
    node _T_130 = or(_T_129, _T_126) @[Mux.scala 27:72]
    node _T_131 = or(_T_130, _T_127) @[Mux.scala 27:72]
    node _T_132 = or(_T_131, _T_128) @[Mux.scala 27:72]
    wire _T_133 : UInt<4> @[Mux.scala 27:72]
    _T_133 <= _T_132 @[Mux.scala 27:72]
    fb_write_ns <= _T_133 @[el2_ifu_ifc_ctrl.scala 135:15]
    reg _T_134 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 142:26]
    _T_134 <= fb_write_ns @[el2_ifu_ifc_ctrl.scala 142:26]
    fb_full_f_ns <= _T_134 @[el2_ifu_ifc_ctrl.scala 142:16]
    node _T_135 = eq(state, UInt<2>("h00")) @[el2_ifu_ifc_ctrl.scala 144:17]
    idle <= _T_135 @[el2_ifu_ifc_ctrl.scala 144:8]
    node _T_136 = eq(state, UInt<2>("h03")) @[el2_ifu_ifc_ctrl.scala 145:16]
    wfm <= _T_136 @[el2_ifu_ifc_ctrl.scala 145:7]
    node _T_137 = bits(fb_write_ns, 3, 3) @[el2_ifu_ifc_ctrl.scala 147:30]
    fb_full_f_ns <= _T_137 @[el2_ifu_ifc_ctrl.scala 147:16]
    reg fb_full_f : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 148:26]
    fb_full_f <= fb_full_f_ns @[el2_ifu_ifc_ctrl.scala 148:26]
    node _T_138 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctrl.scala 151:26]
    node _T_139 = or(_T_138, io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 151:47]
    node _T_140 = not(_T_139) @[el2_ifu_ifc_ctrl.scala 151:5]
    node _T_141 = and(fb_full_f, _T_140) @[el2_ifu_ifc_ctrl.scala 150:75]
    node _T_142 = or(_T_141, dma_stall) @[el2_ifu_ifc_ctrl.scala 151:70]
    node _T_143 = and(io.ifc_fetch_req_bf_raw, _T_142) @[el2_ifu_ifc_ctrl.scala 150:60]
    node _T_144 = or(wfm, _T_143) @[el2_ifu_ifc_ctrl.scala 150:33]
    io.ifu_pmu_fetch_stall <= _T_144 @[el2_ifu_ifc_ctrl.scala 150:26]
    node _T_145 = cat(io.ifc_fetch_addr_bf, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_146 = bits(_T_145, 31, 28) @[el2_lib.scala 203:25]
    node iccm_acc_in_region_bf = eq(_T_146, UInt<4>("h0e")) @[el2_lib.scala 203:47]
    node _T_147 = bits(_T_145, 31, 16) @[el2_lib.scala 206:14]
    node iccm_acc_in_range_bf = eq(_T_147, UInt<16>("h0ee00")) @[el2_lib.scala 206:29]
    io.ifc_iccm_access_bf <= iccm_acc_in_range_bf @[el2_ifu_ifc_ctrl.scala 157:25]
    node _T_148 = bits(io.ifc_fetch_addr_bf, 30, 27) @[el2_ifu_ifc_ctrl.scala 158:78]
    node _T_149 = cat(_T_148, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_150 = dshr(io.dec_tlu_mrac_ff, _T_149) @[el2_ifu_ifc_ctrl.scala 158:53]
    node _T_151 = bits(_T_150, 0, 0) @[el2_ifu_ifc_ctrl.scala 158:53]
    node _T_152 = not(_T_151) @[el2_ifu_ifc_ctrl.scala 158:34]
    io.ifc_fetch_uncacheable_bf <= _T_152 @[el2_ifu_ifc_ctrl.scala 158:31]
    
