;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ifu_ifc_ctl : 
  module ifu_ifc_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip exu_flush_final : UInt<1>, flip exu_flush_path_final : UInt<31>, flip free_l2clk : Clock, flip scan_mode : UInt<1>, flip ic_hit_f : UInt<1>, flip ifu_ic_mb_empty : UInt<1>, flip ifu_fb_consume1 : UInt<1>, flip ifu_fb_consume2 : UInt<1>, flip ifu_bp_hit_taken_f : UInt<1>, flip ifu_bp_btb_target_f : UInt<31>, flip ic_dma_active : UInt<1>, flip ic_write_stall : UInt<1>, dec_ifc : {flip dec_tlu_flush_noredir_wb : UInt<1>, flip dec_tlu_mrac_ff : UInt<32>, ifu_pmu_fetch_stall : UInt<1>}, dma_ifc : {flip dma_iccm_stall_any : UInt<1>}, ifc_fetch_addr_f : UInt<31>, ifc_fetch_addr_bf : UInt<31>, ifc_fetch_req_f : UInt<1>, ifc_fetch_uncacheable_bf : UInt<1>, ifc_fetch_req_bf : UInt<1>, ifc_fetch_req_bf_raw : UInt<1>, ifc_iccm_access_bf : UInt<1>, ifc_region_acc_fault_bf : UInt<1>, ifc_dma_access_ok : UInt<1>}
    
    wire fetch_addr_bf : UInt<31>
    fetch_addr_bf <= UInt<1>("h00")
    wire fetch_addr_next_0 : UInt<1>
    fetch_addr_next_0 <= UInt<1>("h00")
    wire fetch_addr_next : UInt<31>
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
    node dma_stall = or(io.ic_dma_active, dma_iccm_stall_any_f) @[ifu_ifc_ctl.scala 62:36]
    wire _T : UInt<1>
    _T <= UInt<1>("h00")
    node _T_1 = xor(io.dma_ifc.dma_iccm_stall_any, _T) @[lib.scala 458:21]
    node _T_2 = orr(_T_1) @[lib.scala 458:29]
    reg _T_3 : UInt<1>, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_2 : @[Reg.scala 28:19]
      _T_3 <= io.dma_ifc.dma_iccm_stall_any @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T <= _T_3 @[lib.scala 461:16]
    dma_iccm_stall_any_f <= _T @[ifu_ifc_ctl.scala 64:24]
    wire _T_4 : UInt
    _T_4 <= UInt<1>("h00")
    node _T_5 = xor(miss_f, _T_4) @[lib.scala 436:21]
    node _T_6 = orr(_T_5) @[lib.scala 436:29]
    reg _T_7 : UInt, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_6 : @[Reg.scala 28:19]
      _T_7 <= miss_f @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_4 <= _T_7 @[lib.scala 439:16]
    miss_a <= _T_4 @[ifu_ifc_ctl.scala 65:10]
    node _T_8 = eq(io.exu_flush_final, UInt<1>("h00")) @[ifu_ifc_ctl.scala 67:30]
    node _T_9 = eq(io.ifc_fetch_req_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 67:53]
    node _T_10 = eq(io.ic_hit_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 67:75]
    node _T_11 = or(_T_9, _T_10) @[ifu_ifc_ctl.scala 67:73]
    node _T_12 = and(_T_8, _T_11) @[ifu_ifc_ctl.scala 67:50]
    node _T_13 = eq(io.exu_flush_final, UInt<1>("h00")) @[ifu_ifc_ctl.scala 68:29]
    node _T_14 = and(_T_13, io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 68:49]
    node _T_15 = and(_T_14, io.ifu_bp_hit_taken_f) @[ifu_ifc_ctl.scala 68:70]
    node _T_16 = and(_T_15, io.ic_hit_f) @[ifu_ifc_ctl.scala 68:94]
    node _T_17 = eq(io.exu_flush_final, UInt<1>("h00")) @[ifu_ifc_ctl.scala 69:30]
    node _T_18 = and(_T_17, io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 69:50]
    node _T_19 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 69:73]
    node _T_20 = and(_T_18, _T_19) @[ifu_ifc_ctl.scala 69:71]
    node _T_21 = and(_T_20, io.ic_hit_f) @[ifu_ifc_ctl.scala 69:96]
    node _T_22 = bits(io.exu_flush_final, 0, 0) @[ifu_ifc_ctl.scala 71:57]
    node _T_23 = bits(_T_12, 0, 0) @[ifu_ifc_ctl.scala 72:23]
    node _T_24 = bits(_T_16, 0, 0) @[ifu_ifc_ctl.scala 73:22]
    node _T_25 = bits(_T_21, 0, 0) @[ifu_ifc_ctl.scala 74:23]
    node _T_26 = mux(_T_22, io.exu_flush_path_final, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_27 = mux(_T_23, io.ifc_fetch_addr_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_28 = mux(_T_24, io.ifu_bp_btb_target_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_29 = mux(_T_25, fetch_addr_next, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_30 = or(_T_26, _T_27) @[Mux.scala 27:72]
    node _T_31 = or(_T_30, _T_28) @[Mux.scala 27:72]
    node _T_32 = or(_T_31, _T_29) @[Mux.scala 27:72]
    wire _T_33 : UInt<31> @[Mux.scala 27:72]
    _T_33 <= _T_32 @[Mux.scala 27:72]
    io.ifc_fetch_addr_bf <= _T_33 @[ifu_ifc_ctl.scala 71:25]
    node _T_34 = bits(io.ifc_fetch_addr_f, 30, 1) @[ifu_ifc_ctl.scala 84:42]
    node _T_35 = add(_T_34, UInt<1>("h01")) @[ifu_ifc_ctl.scala 84:48]
    node address_upper = tail(_T_35, 1) @[ifu_ifc_ctl.scala 84:48]
    node _T_36 = bits(address_upper, 4, 4) @[ifu_ifc_ctl.scala 85:39]
    node _T_37 = bits(io.ifc_fetch_addr_f, 5, 5) @[ifu_ifc_ctl.scala 85:84]
    node _T_38 = xor(_T_36, _T_37) @[ifu_ifc_ctl.scala 85:63]
    node _T_39 = eq(_T_38, UInt<1>("h00")) @[ifu_ifc_ctl.scala 85:24]
    node _T_40 = bits(io.ifc_fetch_addr_f, 0, 0) @[ifu_ifc_ctl.scala 85:130]
    node _T_41 = and(_T_39, _T_40) @[ifu_ifc_ctl.scala 85:109]
    fetch_addr_next_0 <= _T_41 @[ifu_ifc_ctl.scala 85:21]
    node _T_42 = cat(address_upper, fetch_addr_next_0) @[Cat.scala 29:58]
    fetch_addr_next <= _T_42 @[ifu_ifc_ctl.scala 88:19]
    node _T_43 = not(idle) @[ifu_ifc_ctl.scala 90:30]
    io.ifc_fetch_req_bf_raw <= _T_43 @[ifu_ifc_ctl.scala 90:27]
    node _T_44 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[ifu_ifc_ctl.scala 92:91]
    node _T_45 = eq(_T_44, UInt<1>("h00")) @[ifu_ifc_ctl.scala 92:70]
    node _T_46 = and(fb_full_f_ns, _T_45) @[ifu_ifc_ctl.scala 92:68]
    node _T_47 = eq(_T_46, UInt<1>("h00")) @[ifu_ifc_ctl.scala 92:53]
    node _T_48 = and(io.ifc_fetch_req_bf_raw, _T_47) @[ifu_ifc_ctl.scala 92:51]
    node _T_49 = eq(dma_stall, UInt<1>("h00")) @[ifu_ifc_ctl.scala 93:5]
    node _T_50 = and(_T_48, _T_49) @[ifu_ifc_ctl.scala 92:114]
    node _T_51 = eq(io.ic_write_stall, UInt<1>("h00")) @[ifu_ifc_ctl.scala 93:18]
    node _T_52 = and(_T_50, _T_51) @[ifu_ifc_ctl.scala 93:16]
    node _T_53 = eq(io.dec_ifc.dec_tlu_flush_noredir_wb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 93:39]
    node _T_54 = and(_T_52, _T_53) @[ifu_ifc_ctl.scala 93:37]
    io.ifc_fetch_req_bf <= _T_54 @[ifu_ifc_ctl.scala 92:23]
    node _T_55 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 95:37]
    fetch_bf_en <= _T_55 @[ifu_ifc_ctl.scala 95:15]
    node _T_56 = eq(io.ic_hit_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 97:34]
    node _T_57 = and(io.ifc_fetch_req_f, _T_56) @[ifu_ifc_ctl.scala 97:32]
    node _T_58 = eq(io.exu_flush_final, UInt<1>("h00")) @[ifu_ifc_ctl.scala 97:49]
    node _T_59 = and(_T_57, _T_58) @[ifu_ifc_ctl.scala 97:47]
    miss_f <= _T_59 @[ifu_ifc_ctl.scala 97:10]
    node _T_60 = or(io.ifu_ic_mb_empty, io.exu_flush_final) @[ifu_ifc_ctl.scala 99:39]
    node _T_61 = eq(dma_stall, UInt<1>("h00")) @[ifu_ifc_ctl.scala 99:63]
    node _T_62 = and(_T_60, _T_61) @[ifu_ifc_ctl.scala 99:61]
    node _T_63 = eq(miss_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 99:76]
    node _T_64 = and(_T_62, _T_63) @[ifu_ifc_ctl.scala 99:74]
    node _T_65 = eq(miss_a, UInt<1>("h00")) @[ifu_ifc_ctl.scala 99:86]
    node _T_66 = and(_T_64, _T_65) @[ifu_ifc_ctl.scala 99:84]
    mb_empty_mod <= _T_66 @[ifu_ifc_ctl.scala 99:16]
    node _T_67 = and(io.exu_flush_final, io.dec_ifc.dec_tlu_flush_noredir_wb) @[ifu_ifc_ctl.scala 101:35]
    goto_idle <= _T_67 @[ifu_ifc_ctl.scala 101:13]
    node _T_68 = eq(io.dec_ifc.dec_tlu_flush_noredir_wb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 103:38]
    node _T_69 = and(io.exu_flush_final, _T_68) @[ifu_ifc_ctl.scala 103:36]
    node _T_70 = and(_T_69, idle) @[ifu_ifc_ctl.scala 103:75]
    leave_idle <= _T_70 @[ifu_ifc_ctl.scala 103:14]
    node _T_71 = bits(state, 1, 1) @[ifu_ifc_ctl.scala 105:29]
    node _T_72 = eq(_T_71, UInt<1>("h00")) @[ifu_ifc_ctl.scala 105:23]
    node _T_73 = bits(state, 0, 0) @[ifu_ifc_ctl.scala 105:40]
    node _T_74 = and(_T_72, _T_73) @[ifu_ifc_ctl.scala 105:33]
    node _T_75 = and(_T_74, miss_f) @[ifu_ifc_ctl.scala 105:44]
    node _T_76 = eq(goto_idle, UInt<1>("h00")) @[ifu_ifc_ctl.scala 105:55]
    node _T_77 = and(_T_75, _T_76) @[ifu_ifc_ctl.scala 105:53]
    node _T_78 = bits(state, 1, 1) @[ifu_ifc_ctl.scala 106:11]
    node _T_79 = eq(mb_empty_mod, UInt<1>("h00")) @[ifu_ifc_ctl.scala 106:17]
    node _T_80 = and(_T_78, _T_79) @[ifu_ifc_ctl.scala 106:15]
    node _T_81 = eq(goto_idle, UInt<1>("h00")) @[ifu_ifc_ctl.scala 106:33]
    node _T_82 = and(_T_80, _T_81) @[ifu_ifc_ctl.scala 106:31]
    node next_state_1 = or(_T_77, _T_82) @[ifu_ifc_ctl.scala 105:67]
    node _T_83 = eq(goto_idle, UInt<1>("h00")) @[ifu_ifc_ctl.scala 108:23]
    node _T_84 = and(_T_83, leave_idle) @[ifu_ifc_ctl.scala 108:34]
    node _T_85 = bits(state, 0, 0) @[ifu_ifc_ctl.scala 108:56]
    node _T_86 = eq(goto_idle, UInt<1>("h00")) @[ifu_ifc_ctl.scala 108:62]
    node _T_87 = and(_T_85, _T_86) @[ifu_ifc_ctl.scala 108:60]
    node next_state_0 = or(_T_84, _T_87) @[ifu_ifc_ctl.scala 108:48]
    node _T_88 = cat(next_state_1, next_state_0) @[Cat.scala 29:58]
    wire _T_89 : UInt
    _T_89 <= UInt<1>("h00")
    node _T_90 = xor(_T_88, _T_89) @[lib.scala 436:21]
    node _T_91 = orr(_T_90) @[lib.scala 436:29]
    reg _T_92 : UInt, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_91 : @[Reg.scala 28:19]
      _T_92 <= _T_88 @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_89 <= _T_92 @[lib.scala 439:16]
    state <= _T_89 @[ifu_ifc_ctl.scala 110:9]
    flush_fb <= io.exu_flush_final @[ifu_ifc_ctl.scala 112:12]
    node _T_93 = eq(io.ifu_fb_consume2, UInt<1>("h00")) @[ifu_ifc_ctl.scala 115:38]
    node _T_94 = and(io.ifu_fb_consume1, _T_93) @[ifu_ifc_ctl.scala 115:36]
    node _T_95 = eq(io.ifc_fetch_req_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 115:61]
    node _T_96 = or(_T_95, miss_f) @[ifu_ifc_ctl.scala 115:81]
    node _T_97 = and(_T_94, _T_96) @[ifu_ifc_ctl.scala 115:58]
    node _T_98 = and(io.ifu_fb_consume2, io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 116:25]
    node _T_99 = or(_T_97, _T_98) @[ifu_ifc_ctl.scala 115:92]
    fb_right <= _T_99 @[ifu_ifc_ctl.scala 115:12]
    node _T_100 = not(io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 118:39]
    node _T_101 = or(_T_100, miss_f) @[ifu_ifc_ctl.scala 118:59]
    node _T_102 = and(io.ifu_fb_consume2, _T_101) @[ifu_ifc_ctl.scala 118:36]
    fb_right2 <= _T_102 @[ifu_ifc_ctl.scala 118:13]
    node _T_103 = or(io.ifu_fb_consume1, io.ifu_fb_consume2) @[ifu_ifc_ctl.scala 119:56]
    node _T_104 = eq(_T_103, UInt<1>("h00")) @[ifu_ifc_ctl.scala 119:35]
    node _T_105 = and(io.ifc_fetch_req_f, _T_104) @[ifu_ifc_ctl.scala 119:33]
    node _T_106 = eq(miss_f, UInt<1>("h00")) @[ifu_ifc_ctl.scala 119:80]
    node _T_107 = and(_T_105, _T_106) @[ifu_ifc_ctl.scala 119:78]
    fb_left <= _T_107 @[ifu_ifc_ctl.scala 119:11]
    node _T_108 = bits(flush_fb, 0, 0) @[ifu_ifc_ctl.scala 122:37]
    node _T_109 = eq(flush_fb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 123:6]
    node _T_110 = and(_T_109, fb_right) @[ifu_ifc_ctl.scala 123:16]
    node _T_111 = bits(_T_110, 0, 0) @[ifu_ifc_ctl.scala 123:28]
    node _T_112 = bits(fb_write_f, 3, 1) @[ifu_ifc_ctl.scala 123:62]
    node _T_113 = cat(UInt<1>("h00"), _T_112) @[Cat.scala 29:58]
    node _T_114 = eq(flush_fb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 124:6]
    node _T_115 = and(_T_114, fb_right2) @[ifu_ifc_ctl.scala 124:16]
    node _T_116 = bits(_T_115, 0, 0) @[ifu_ifc_ctl.scala 124:29]
    node _T_117 = bits(fb_write_f, 3, 2) @[ifu_ifc_ctl.scala 124:63]
    node _T_118 = cat(UInt<2>("h00"), _T_117) @[Cat.scala 29:58]
    node _T_119 = eq(flush_fb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 125:6]
    node _T_120 = and(_T_119, fb_left) @[ifu_ifc_ctl.scala 125:16]
    node _T_121 = bits(_T_120, 0, 0) @[ifu_ifc_ctl.scala 125:27]
    node _T_122 = bits(fb_write_f, 2, 0) @[ifu_ifc_ctl.scala 125:51]
    node _T_123 = cat(_T_122, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_124 = eq(flush_fb, UInt<1>("h00")) @[ifu_ifc_ctl.scala 126:6]
    node _T_125 = eq(fb_right, UInt<1>("h00")) @[ifu_ifc_ctl.scala 126:18]
    node _T_126 = and(_T_124, _T_125) @[ifu_ifc_ctl.scala 126:16]
    node _T_127 = eq(fb_right2, UInt<1>("h00")) @[ifu_ifc_ctl.scala 126:30]
    node _T_128 = and(_T_126, _T_127) @[ifu_ifc_ctl.scala 126:28]
    node _T_129 = eq(fb_left, UInt<1>("h00")) @[ifu_ifc_ctl.scala 126:43]
    node _T_130 = and(_T_128, _T_129) @[ifu_ifc_ctl.scala 126:41]
    node _T_131 = bits(_T_130, 0, 0) @[ifu_ifc_ctl.scala 126:53]
    node _T_132 = bits(fb_write_f, 3, 0) @[ifu_ifc_ctl.scala 126:73]
    node _T_133 = mux(_T_108, UInt<4>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_134 = mux(_T_111, _T_113, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_135 = mux(_T_116, _T_118, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_136 = mux(_T_121, _T_123, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_137 = mux(_T_131, _T_132, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_138 = or(_T_133, _T_134) @[Mux.scala 27:72]
    node _T_139 = or(_T_138, _T_135) @[Mux.scala 27:72]
    node _T_140 = or(_T_139, _T_136) @[Mux.scala 27:72]
    node _T_141 = or(_T_140, _T_137) @[Mux.scala 27:72]
    wire _T_142 : UInt<4> @[Mux.scala 27:72]
    _T_142 <= _T_141 @[Mux.scala 27:72]
    fb_write_ns <= _T_142 @[ifu_ifc_ctl.scala 122:15]
    node _T_143 = eq(state, UInt<2>("h00")) @[ifu_ifc_ctl.scala 129:17]
    idle <= _T_143 @[ifu_ifc_ctl.scala 129:8]
    node _T_144 = eq(state, UInt<2>("h03")) @[ifu_ifc_ctl.scala 130:16]
    wfm <= _T_144 @[ifu_ifc_ctl.scala 130:7]
    node _T_145 = bits(fb_write_ns, 3, 3) @[ifu_ifc_ctl.scala 132:30]
    fb_full_f_ns <= _T_145 @[ifu_ifc_ctl.scala 132:16]
    wire fb_full_f : UInt
    fb_full_f <= UInt<1>("h00")
    node _T_146 = xor(fb_full_f_ns, fb_full_f) @[lib.scala 436:21]
    node _T_147 = orr(_T_146) @[lib.scala 436:29]
    reg _T_148 : UInt, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_147 : @[Reg.scala 28:19]
      _T_148 <= fb_full_f_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    fb_full_f <= _T_148 @[lib.scala 439:16]
    wire _T_149 : UInt
    _T_149 <= UInt<1>("h00")
    node _T_150 = xor(fb_write_ns, _T_149) @[lib.scala 436:21]
    node _T_151 = orr(_T_150) @[lib.scala 436:29]
    reg _T_152 : UInt, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_151 : @[Reg.scala 28:19]
      _T_152 <= fb_write_ns @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_149 <= _T_152 @[lib.scala 439:16]
    fb_write_f <= _T_149 @[ifu_ifc_ctl.scala 134:16]
    node _T_153 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[ifu_ifc_ctl.scala 137:40]
    node _T_154 = or(_T_153, io.exu_flush_final) @[ifu_ifc_ctl.scala 137:61]
    node _T_155 = eq(_T_154, UInt<1>("h00")) @[ifu_ifc_ctl.scala 137:19]
    node _T_156 = and(fb_full_f, _T_155) @[ifu_ifc_ctl.scala 137:17]
    node _T_157 = or(_T_156, dma_stall) @[ifu_ifc_ctl.scala 137:84]
    node _T_158 = and(io.ifc_fetch_req_bf_raw, _T_157) @[ifu_ifc_ctl.scala 136:68]
    node _T_159 = or(wfm, _T_158) @[ifu_ifc_ctl.scala 136:41]
    io.dec_ifc.ifu_pmu_fetch_stall <= _T_159 @[ifu_ifc_ctl.scala 136:34]
    node _T_160 = cat(io.ifc_fetch_addr_bf, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_161 = bits(_T_160, 31, 28) @[lib.scala 84:25]
    node iccm_acc_in_region_bf = eq(_T_161, UInt<4>("h0e")) @[lib.scala 84:47]
    node _T_162 = bits(_T_160, 31, 16) @[lib.scala 87:14]
    node iccm_acc_in_range_bf = eq(_T_162, UInt<16>("h0ee00")) @[lib.scala 87:29]
    io.ifc_iccm_access_bf <= iccm_acc_in_range_bf @[ifu_ifc_ctl.scala 142:25]
    node _T_163 = eq(io.ifc_iccm_access_bf, UInt<1>("h00")) @[ifu_ifc_ctl.scala 143:30]
    node _T_164 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[ifu_ifc_ctl.scala 144:39]
    node _T_165 = eq(_T_164, UInt<1>("h00")) @[ifu_ifc_ctl.scala 144:18]
    node _T_166 = and(fb_full_f, _T_165) @[ifu_ifc_ctl.scala 144:16]
    node _T_167 = or(_T_163, _T_166) @[ifu_ifc_ctl.scala 143:53]
    node _T_168 = eq(io.ifc_fetch_req_bf, UInt<1>("h00")) @[ifu_ifc_ctl.scala 145:13]
    node _T_169 = and(wfm, _T_168) @[ifu_ifc_ctl.scala 145:11]
    node _T_170 = or(_T_167, _T_169) @[ifu_ifc_ctl.scala 144:62]
    node _T_171 = or(_T_170, idle) @[ifu_ifc_ctl.scala 145:35]
    node _T_172 = eq(io.exu_flush_final, UInt<1>("h00")) @[ifu_ifc_ctl.scala 145:46]
    node _T_173 = and(_T_171, _T_172) @[ifu_ifc_ctl.scala 145:44]
    node _T_174 = or(_T_173, dma_iccm_stall_any_f) @[ifu_ifc_ctl.scala 145:67]
    io.ifc_dma_access_ok <= _T_174 @[ifu_ifc_ctl.scala 143:24]
    node _T_175 = eq(iccm_acc_in_range_bf, UInt<1>("h00")) @[ifu_ifc_ctl.scala 147:33]
    node _T_176 = and(_T_175, iccm_acc_in_region_bf) @[ifu_ifc_ctl.scala 147:55]
    io.ifc_region_acc_fault_bf <= _T_176 @[ifu_ifc_ctl.scala 147:30]
    node _T_177 = bits(io.ifc_fetch_addr_bf, 30, 27) @[ifu_ifc_ctl.scala 148:86]
    node _T_178 = cat(_T_177, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_179 = dshr(io.dec_ifc.dec_tlu_mrac_ff, _T_178) @[ifu_ifc_ctl.scala 148:61]
    node _T_180 = bits(_T_179, 0, 0) @[ifu_ifc_ctl.scala 148:61]
    node _T_181 = not(_T_180) @[ifu_ifc_ctl.scala 148:34]
    io.ifc_fetch_uncacheable_bf <= _T_181 @[ifu_ifc_ctl.scala 148:31]
    wire _T_182 : UInt<1>
    _T_182 <= UInt<1>("h00")
    node _T_183 = xor(io.ifc_fetch_req_bf, _T_182) @[lib.scala 458:21]
    node _T_184 = orr(_T_183) @[lib.scala 458:29]
    reg _T_185 : UInt<1>, io.free_l2clk with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when _T_184 : @[Reg.scala 28:19]
      _T_185 <= io.ifc_fetch_req_bf @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    _T_182 <= _T_185 @[lib.scala 461:16]
    io.ifc_fetch_req_f <= _T_182 @[ifu_ifc_ctl.scala 150:22]
    node _T_186 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[ifu_ifc_ctl.scala 152:76]
    wire _T_187 : UInt<31> @[lib.scala 593:38]
    _T_187 <= UInt<1>("h00") @[lib.scala 593:38]
    reg _T_188 : UInt, clock with : (reset => (reset, _T_187)) @[Reg.scala 27:20]
    when _T_186 : @[Reg.scala 28:19]
      _T_188 <= io.ifc_fetch_addr_bf @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.ifc_fetch_addr_f <= _T_188 @[ifu_ifc_ctl.scala 152:23]
    
