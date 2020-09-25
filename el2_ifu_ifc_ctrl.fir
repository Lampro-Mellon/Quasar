;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_ifc_ctrl : 
  module el2_ifu_ifc_ctrl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip free_clk : UInt<1>, flip active_clk : UInt<1>, flip rst_l : UInt<1>, flip scan_mode : UInt<1>, flip ic_hit_f : UInt<1>, flip ifu_ic_mb_empty : UInt<1>, flip ifu_fb_consume1 : UInt<1>, flip ifu_fb_consume2 : UInt<1>, flip dec_tlu_flush_noredir_wb : UInt<1>, flip exu_flush_final : UInt<1>, flip exu_flush_path_final : UInt<31>, flip ifu_bp_hit_taken_f : UInt<1>, flip ifu_bp_btb_target_f : UInt<31>, flip ic_dma_active : UInt<1>, flip ic_write_stall : UInt<1>, flip dma_iccm_stall_any : UInt<1>, flip dec_tlu_mrac_ff : UInt<32>, ifc_fetch_addr_f : UInt<31>, ifc_fetch_addr_bf : UInt<31>, ifc_fetch_req_f : UInt<1>, ifu_pmu_fetch_stall : UInt<1>, ifc_fetch_uncacheable_bf : UInt<1>, ifc_fetch_req_bf : UInt<1>, ifc_fetch_req_bf_raw : UInt<1>, ifc_iccm_access_bf : UInt<1>, ifc_region_acc_fault_bf : UInt<1>, ifc_dma_access_ok : UInt<1>, test_out : UInt}
    
    io.ifc_region_acc_fault_bf <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 40:30]
    io.ifc_dma_access_ok <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 41:24]
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
    wire miss_a : UInt<1>
    miss_a <= UInt<1>("h00")
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
    line_wrap <= UInt<1>("h00")
    wire state : UInt<2>
    state <= UInt<1>("h00")
    wire dma_iccm_stall_any_f : UInt<1>
    dma_iccm_stall_any_f <= UInt<1>("h00")
    node dma_stall = or(io.ic_dma_active, dma_iccm_stall_any_f) @[el2_ifu_ifc_ctrl.scala 69:36]
    reg _T : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 70:34]
    _T <= io.dma_iccm_stall_any @[el2_ifu_ifc_ctrl.scala 70:34]
    dma_iccm_stall_any_f <= _T @[el2_ifu_ifc_ctrl.scala 70:24]
    reg _T_1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 72:20]
    _T_1 <= miss_f @[el2_ifu_ifc_ctrl.scala 72:20]
    miss_a <= _T_1 @[el2_ifu_ifc_ctrl.scala 72:10]
    node _T_2 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 74:23]
    node _T_3 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 74:46]
    node _T_4 = not(io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 74:68]
    node _T_5 = or(_T_3, _T_4) @[el2_ifu_ifc_ctrl.scala 74:66]
    node _T_6 = and(_T_2, _T_5) @[el2_ifu_ifc_ctrl.scala 74:43]
    sel_last_addr_bf <= _T_6 @[el2_ifu_ifc_ctrl.scala 74:20]
    node _T_7 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 75:23]
    node _T_8 = and(_T_7, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 75:43]
    node _T_9 = and(_T_8, io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 75:64]
    node _T_10 = and(_T_9, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 75:88]
    sel_btb_addr_bf <= _T_10 @[el2_ifu_ifc_ctrl.scala 75:20]
    node _T_11 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 76:23]
    node _T_12 = and(_T_11, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 76:43]
    node _T_13 = not(io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctrl.scala 76:66]
    node _T_14 = and(_T_12, _T_13) @[el2_ifu_ifc_ctrl.scala 76:64]
    node _T_15 = and(_T_14, io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 76:89]
    sel_next_addr_bf <= _T_15 @[el2_ifu_ifc_ctrl.scala 76:20]
    node _T_16 = bits(io.exu_flush_final, 0, 0) @[el2_ifu_ifc_ctrl.scala 79:56]
    node _T_17 = bits(sel_last_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 80:46]
    node _T_18 = bits(sel_btb_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 81:45]
    node _T_19 = bits(sel_next_addr_bf, 0, 0) @[el2_ifu_ifc_ctrl.scala 82:46]
    node _T_20 = mux(_T_16, io.exu_flush_path_final, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_21 = mux(_T_17, io.ifc_fetch_addr_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_22 = mux(_T_18, io.ifu_bp_btb_target_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_23 = mux(_T_19, fetch_addr_next, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_24 = or(_T_20, _T_21) @[Mux.scala 27:72]
    node _T_25 = or(_T_24, _T_22) @[Mux.scala 27:72]
    node _T_26 = or(_T_25, _T_23) @[Mux.scala 27:72]
    wire _T_27 : UInt<32> @[Mux.scala 27:72]
    _T_27 <= _T_26 @[Mux.scala 27:72]
    io.ifc_fetch_addr_bf <= _T_27 @[el2_ifu_ifc_ctrl.scala 79:24]
    io.test_out <= io.ifc_fetch_addr_bf @[el2_ifu_ifc_ctrl.scala 84:15]
    line_wrap <= UInt<1>("h00") @[el2_ifu_ifc_ctrl.scala 86:13]
    node _T_28 = bits(io.ifc_fetch_addr_f, 30, 1) @[el2_ifu_ifc_ctrl.scala 88:46]
    node _T_29 = add(_T_28, UInt<1>("h01")) @[el2_ifu_ifc_ctrl.scala 88:52]
    node _T_30 = tail(_T_29, 1) @[el2_ifu_ifc_ctrl.scala 88:52]
    node _T_31 = bits(line_wrap, 0, 0) @[el2_ifu_ifc_ctrl.scala 89:25]
    node _T_32 = bits(io.ifc_fetch_addr_f, 0, 0) @[el2_ifu_ifc_ctrl.scala 89:53]
    node _T_33 = mux(_T_31, UInt<1>("h00"), _T_32) @[el2_ifu_ifc_ctrl.scala 89:8]
    node _T_34 = or(_T_30, _T_33) @[el2_ifu_ifc_ctrl.scala 88:58]
    fetch_addr_next <= _T_34 @[el2_ifu_ifc_ctrl.scala 88:19]
    node _T_35 = not(idle) @[el2_ifu_ifc_ctrl.scala 93:30]
    io.ifc_fetch_req_bf_raw <= _T_35 @[el2_ifu_ifc_ctrl.scala 93:27]
    node _T_36 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctrl.scala 95:91]
    node _T_37 = not(_T_36) @[el2_ifu_ifc_ctrl.scala 95:70]
    node _T_38 = and(fb_full_f_ns, _T_37) @[el2_ifu_ifc_ctrl.scala 95:68]
    node _T_39 = not(_T_38) @[el2_ifu_ifc_ctrl.scala 95:53]
    node _T_40 = and(io.ifc_fetch_req_bf_raw, _T_39) @[el2_ifu_ifc_ctrl.scala 95:51]
    node _T_41 = not(dma_stall) @[el2_ifu_ifc_ctrl.scala 96:5]
    node _T_42 = and(_T_40, _T_41) @[el2_ifu_ifc_ctrl.scala 95:114]
    node _T_43 = not(io.ic_write_stall) @[el2_ifu_ifc_ctrl.scala 96:18]
    node _T_44 = and(_T_42, _T_43) @[el2_ifu_ifc_ctrl.scala 96:16]
    node _T_45 = not(io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 96:39]
    node _T_46 = and(_T_44, _T_45) @[el2_ifu_ifc_ctrl.scala 96:37]
    io.ifc_fetch_req_bf <= _T_46 @[el2_ifu_ifc_ctrl.scala 95:23]
    node _T_47 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 98:37]
    fetch_bf_en <= _T_47 @[el2_ifu_ifc_ctrl.scala 98:15]
    node _T_48 = not(io.ic_hit_f) @[el2_ifu_ifc_ctrl.scala 100:34]
    node _T_49 = and(io.ifc_fetch_req_f, _T_48) @[el2_ifu_ifc_ctrl.scala 100:32]
    node _T_50 = not(io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 100:49]
    node _T_51 = and(_T_49, _T_50) @[el2_ifu_ifc_ctrl.scala 100:47]
    miss_f <= _T_51 @[el2_ifu_ifc_ctrl.scala 100:10]
    node _T_52 = or(io.ifu_ic_mb_empty, io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 102:39]
    node _T_53 = not(dma_stall) @[el2_ifu_ifc_ctrl.scala 102:63]
    node _T_54 = and(_T_52, _T_53) @[el2_ifu_ifc_ctrl.scala 102:61]
    node _T_55 = not(miss_f) @[el2_ifu_ifc_ctrl.scala 102:76]
    node _T_56 = and(_T_54, _T_55) @[el2_ifu_ifc_ctrl.scala 102:74]
    node _T_57 = not(miss_a) @[el2_ifu_ifc_ctrl.scala 102:86]
    node _T_58 = and(_T_56, _T_57) @[el2_ifu_ifc_ctrl.scala 102:84]
    mb_empty_mod <= _T_58 @[el2_ifu_ifc_ctrl.scala 102:16]
    node _T_59 = and(io.exu_flush_final, io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 104:35]
    goto_idle <= _T_59 @[el2_ifu_ifc_ctrl.scala 104:13]
    node _T_60 = not(io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctrl.scala 106:38]
    node _T_61 = and(io.exu_flush_final, _T_60) @[el2_ifu_ifc_ctrl.scala 106:36]
    node _T_62 = and(_T_61, idle) @[el2_ifu_ifc_ctrl.scala 106:67]
    leave_idle <= _T_62 @[el2_ifu_ifc_ctrl.scala 106:14]
    node _T_63 = bits(state, 1, 1) @[el2_ifu_ifc_ctrl.scala 108:29]
    node _T_64 = not(_T_63) @[el2_ifu_ifc_ctrl.scala 108:23]
    node _T_65 = bits(state, 0, 0) @[el2_ifu_ifc_ctrl.scala 108:40]
    node _T_66 = and(_T_64, _T_65) @[el2_ifu_ifc_ctrl.scala 108:33]
    node _T_67 = and(_T_66, miss_f) @[el2_ifu_ifc_ctrl.scala 108:44]
    node _T_68 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 108:55]
    node _T_69 = and(_T_67, _T_68) @[el2_ifu_ifc_ctrl.scala 108:53]
    node _T_70 = bits(state, 1, 1) @[el2_ifu_ifc_ctrl.scala 109:11]
    node _T_71 = not(mb_empty_mod) @[el2_ifu_ifc_ctrl.scala 109:17]
    node _T_72 = and(_T_70, _T_71) @[el2_ifu_ifc_ctrl.scala 109:15]
    node _T_73 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 109:33]
    node _T_74 = and(_T_72, _T_73) @[el2_ifu_ifc_ctrl.scala 109:31]
    node next_state_1 = or(_T_69, _T_74) @[el2_ifu_ifc_ctrl.scala 108:67]
    node _T_75 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 111:23]
    node _T_76 = and(_T_75, leave_idle) @[el2_ifu_ifc_ctrl.scala 111:34]
    node _T_77 = bits(state, 0, 0) @[el2_ifu_ifc_ctrl.scala 111:56]
    node _T_78 = not(goto_idle) @[el2_ifu_ifc_ctrl.scala 111:62]
    node _T_79 = and(_T_77, _T_78) @[el2_ifu_ifc_ctrl.scala 111:60]
    node next_state_0 = or(_T_76, _T_79) @[el2_ifu_ifc_ctrl.scala 111:48]
    node _T_80 = cat(next_state_0, next_state_0) @[Cat.scala 29:58]
    reg _T_81 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 113:19]
    _T_81 <= _T_80 @[el2_ifu_ifc_ctrl.scala 113:19]
    state <= _T_81 @[el2_ifu_ifc_ctrl.scala 113:9]
    flush_fb <= io.exu_flush_final @[el2_ifu_ifc_ctrl.scala 119:12]
    node _T_82 = not(io.ifu_fb_consume2) @[el2_ifu_ifc_ctrl.scala 121:38]
    node _T_83 = and(io.ifu_fb_consume1, _T_82) @[el2_ifu_ifc_ctrl.scala 121:36]
    node _T_84 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 121:61]
    node _T_85 = or(_T_84, miss_f) @[el2_ifu_ifc_ctrl.scala 121:81]
    node _T_86 = and(_T_83, _T_85) @[el2_ifu_ifc_ctrl.scala 121:58]
    node _T_87 = and(io.ifu_fb_consume2, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 122:25]
    node _T_88 = or(_T_86, _T_87) @[el2_ifu_ifc_ctrl.scala 121:92]
    fb_right <= _T_88 @[el2_ifu_ifc_ctrl.scala 121:12]
    node _T_89 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 124:39]
    node _T_90 = or(_T_89, miss_f) @[el2_ifu_ifc_ctrl.scala 124:59]
    node _T_91 = and(io.ifu_fb_consume2, _T_90) @[el2_ifu_ifc_ctrl.scala 124:36]
    fb_right2 <= _T_91 @[el2_ifu_ifc_ctrl.scala 124:13]
    node _T_92 = or(io.ifu_fb_consume1, io.ifu_fb_consume2) @[el2_ifu_ifc_ctrl.scala 125:56]
    node _T_93 = not(_T_92) @[el2_ifu_ifc_ctrl.scala 125:35]
    node _T_94 = and(io.ifc_fetch_req_f, _T_93) @[el2_ifu_ifc_ctrl.scala 125:33]
    node _T_95 = not(miss_f) @[el2_ifu_ifc_ctrl.scala 125:80]
    node _T_96 = and(_T_94, _T_95) @[el2_ifu_ifc_ctrl.scala 125:78]
    fb_left <= _T_96 @[el2_ifu_ifc_ctrl.scala 125:11]
    node _T_97 = bits(flush_fb, 0, 0) @[el2_ifu_ifc_ctrl.scala 127:37]
    node _T_98 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 128:6]
    node _T_99 = and(_T_98, fb_right) @[el2_ifu_ifc_ctrl.scala 128:16]
    node _T_100 = bits(_T_99, 0, 0) @[el2_ifu_ifc_ctrl.scala 128:28]
    node _T_101 = bits(fb_write_f, 3, 1) @[el2_ifu_ifc_ctrl.scala 128:62]
    node _T_102 = cat(UInt<1>("h00"), _T_101) @[Cat.scala 29:58]
    node _T_103 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 129:6]
    node _T_104 = and(_T_103, fb_right2) @[el2_ifu_ifc_ctrl.scala 129:16]
    node _T_105 = bits(_T_104, 0, 0) @[el2_ifu_ifc_ctrl.scala 129:29]
    node _T_106 = bits(fb_write_f, 3, 2) @[el2_ifu_ifc_ctrl.scala 129:63]
    node _T_107 = cat(UInt<2>("h00"), _T_106) @[Cat.scala 29:58]
    node _T_108 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 130:6]
    node _T_109 = and(_T_108, fb_left) @[el2_ifu_ifc_ctrl.scala 130:16]
    node _T_110 = bits(_T_109, 0, 0) @[el2_ifu_ifc_ctrl.scala 130:27]
    node _T_111 = bits(fb_write_f, 2, 0) @[el2_ifu_ifc_ctrl.scala 130:51]
    node _T_112 = cat(_T_111, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_113 = not(flush_fb) @[el2_ifu_ifc_ctrl.scala 131:6]
    node _T_114 = not(fb_right) @[el2_ifu_ifc_ctrl.scala 131:18]
    node _T_115 = and(_T_113, _T_114) @[el2_ifu_ifc_ctrl.scala 131:16]
    node _T_116 = not(fb_right2) @[el2_ifu_ifc_ctrl.scala 131:30]
    node _T_117 = and(_T_115, _T_116) @[el2_ifu_ifc_ctrl.scala 131:28]
    node _T_118 = not(fb_left) @[el2_ifu_ifc_ctrl.scala 131:43]
    node _T_119 = and(_T_117, _T_118) @[el2_ifu_ifc_ctrl.scala 131:41]
    node _T_120 = bits(_T_119, 0, 0) @[el2_ifu_ifc_ctrl.scala 131:53]
    node _T_121 = bits(fb_write_f, 3, 0) @[el2_ifu_ifc_ctrl.scala 131:73]
    node _T_122 = mux(_T_97, UInt<4>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_123 = mux(_T_100, _T_102, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_124 = mux(_T_105, _T_107, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_125 = mux(_T_110, _T_112, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_126 = mux(_T_120, _T_121, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_127 = or(_T_122, _T_123) @[Mux.scala 27:72]
    node _T_128 = or(_T_127, _T_124) @[Mux.scala 27:72]
    node _T_129 = or(_T_128, _T_125) @[Mux.scala 27:72]
    node _T_130 = or(_T_129, _T_126) @[Mux.scala 27:72]
    wire _T_131 : UInt<4> @[Mux.scala 27:72]
    _T_131 <= _T_130 @[Mux.scala 27:72]
    fb_write_ns <= _T_131 @[el2_ifu_ifc_ctrl.scala 127:15]
    node _T_132 = bits(fb_write_ns, 3, 3) @[el2_ifu_ifc_ctrl.scala 134:38]
    reg _T_133 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 134:26]
    _T_133 <= _T_132 @[el2_ifu_ifc_ctrl.scala 134:26]
    fb_full_f_ns <= _T_133 @[el2_ifu_ifc_ctrl.scala 134:16]
    node _T_134 = eq(state, UInt<2>("h00")) @[el2_ifu_ifc_ctrl.scala 136:17]
    idle <= _T_134 @[el2_ifu_ifc_ctrl.scala 136:8]
    node _T_135 = eq(state, UInt<2>("h03")) @[el2_ifu_ifc_ctrl.scala 137:16]
    wfm <= _T_135 @[el2_ifu_ifc_ctrl.scala 137:7]
    node _T_136 = bits(fb_write_ns, 3, 3) @[el2_ifu_ifc_ctrl.scala 139:30]
    fb_full_f_ns <= _T_136 @[el2_ifu_ifc_ctrl.scala 139:16]
    reg fb_full_f : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 140:26]
    fb_full_f <= fb_full_f_ns @[el2_ifu_ifc_ctrl.scala 140:26]
    reg _T_137 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 141:24]
    _T_137 <= fb_write_ns @[el2_ifu_ifc_ctrl.scala 141:24]
    fb_write_f <= _T_137 @[el2_ifu_ifc_ctrl.scala 141:14]
    node _T_138 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctrl.scala 144:26]
    node _T_139 = or(_T_138, io.exu_flush_final) @[el2_ifu_ifc_ctrl.scala 144:47]
    node _T_140 = not(_T_139) @[el2_ifu_ifc_ctrl.scala 144:5]
    node _T_141 = and(fb_full_f, _T_140) @[el2_ifu_ifc_ctrl.scala 143:75]
    node _T_142 = or(_T_141, dma_stall) @[el2_ifu_ifc_ctrl.scala 144:70]
    node _T_143 = and(io.ifc_fetch_req_bf_raw, _T_142) @[el2_ifu_ifc_ctrl.scala 143:60]
    node _T_144 = or(wfm, _T_143) @[el2_ifu_ifc_ctrl.scala 143:33]
    io.ifu_pmu_fetch_stall <= _T_144 @[el2_ifu_ifc_ctrl.scala 143:26]
    node _T_145 = cat(io.ifc_fetch_addr_bf, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_146 = bits(_T_145, 31, 28) @[el2_lib.scala 204:25]
    node iccm_acc_in_region_bf = eq(_T_146, UInt<4>("h0e")) @[el2_lib.scala 204:47]
    node _T_147 = bits(_T_145, 31, 16) @[el2_lib.scala 207:14]
    node iccm_acc_in_range_bf = eq(_T_147, UInt<16>("h0ee00")) @[el2_lib.scala 207:29]
    io.ifc_iccm_access_bf <= iccm_acc_in_range_bf @[el2_ifu_ifc_ctrl.scala 150:25]
    node _T_148 = bits(io.ifc_fetch_addr_bf, 30, 27) @[el2_ifu_ifc_ctrl.scala 151:78]
    node _T_149 = cat(_T_148, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_150 = dshr(io.dec_tlu_mrac_ff, _T_149) @[el2_ifu_ifc_ctrl.scala 151:53]
    node _T_151 = bits(_T_150, 0, 0) @[el2_ifu_ifc_ctrl.scala 151:53]
    node _T_152 = not(_T_151) @[el2_ifu_ifc_ctrl.scala 151:34]
    io.ifc_fetch_uncacheable_bf <= _T_152 @[el2_ifu_ifc_ctrl.scala 151:31]
    reg _T_153 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctrl.scala 155:32]
    _T_153 <= io.ifc_fetch_req_bf @[el2_ifu_ifc_ctrl.scala 155:32]
    io.ifc_fetch_req_f <= _T_153 @[el2_ifu_ifc_ctrl.scala 155:22]
    node _T_154 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctrl.scala 158:88]
    reg _T_155 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_154 : @[Reg.scala 28:19]
      _T_155 <= io.ifc_fetch_addr_bf @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.ifc_fetch_addr_f <= _T_155 @[el2_ifu_ifc_ctrl.scala 158:23]
    
