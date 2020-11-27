;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_ifc_ctl : 
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
    
  module el2_ifu_ifc_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip free_clk : Clock, flip active_clk : Clock, flip scan_mode : UInt<1>, flip ic_hit_f : UInt<1>, flip ifu_ic_mb_empty : UInt<1>, flip ifu_fb_consume1 : UInt<1>, flip ifu_fb_consume2 : UInt<1>, flip dec_tlu_flush_noredir_wb : UInt<1>, flip exu_flush_final : UInt<1>, flip exu_flush_path_final : UInt<31>, flip ifu_bp_hit_taken_f : UInt<1>, flip ifu_bp_btb_target_f : UInt<31>, flip ic_dma_active : UInt<1>, flip ic_write_stall : UInt<1>, flip dma_iccm_stall_any : UInt<1>, flip dec_tlu_mrac_ff : UInt<32>, ifc_fetch_addr_f : UInt<31>, ifc_fetch_addr_bf : UInt<31>, ifc_fetch_req_f : UInt<1>, ifu_pmu_fetch_stall : UInt<1>, ifc_fetch_uncacheable_bf : UInt<1>, ifc_fetch_req_bf : UInt<1>, ifc_fetch_req_bf_raw : UInt<1>, ifc_iccm_access_bf : UInt<1>, ifc_region_acc_fault_bf : UInt<1>, ifc_dma_access_ok : UInt<1>}
    
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
    node dma_stall = or(io.ic_dma_active, dma_iccm_stall_any_f) @[el2_ifu_ifc_ctl.scala 62:36]
    reg _T : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 63:58]
    _T <= io.dma_iccm_stall_any @[el2_ifu_ifc_ctl.scala 63:58]
    dma_iccm_stall_any_f <= _T @[el2_ifu_ifc_ctl.scala 63:24]
    reg _T_1 : UInt<1>, io.free_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 65:44]
    _T_1 <= miss_f @[el2_ifu_ifc_ctl.scala 65:44]
    miss_a <= _T_1 @[el2_ifu_ifc_ctl.scala 65:10]
    node _T_2 = eq(io.exu_flush_final, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 67:26]
    node _T_3 = eq(io.ifc_fetch_req_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 67:49]
    node _T_4 = eq(io.ic_hit_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 67:71]
    node _T_5 = or(_T_3, _T_4) @[el2_ifu_ifc_ctl.scala 67:69]
    node sel_last_addr_bf = and(_T_2, _T_5) @[el2_ifu_ifc_ctl.scala 67:46]
    node _T_6 = eq(io.exu_flush_final, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 68:26]
    node _T_7 = and(_T_6, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 68:46]
    node _T_8 = and(_T_7, io.ifu_bp_hit_taken_f) @[el2_ifu_ifc_ctl.scala 68:67]
    node sel_btb_addr_bf = and(_T_8, io.ic_hit_f) @[el2_ifu_ifc_ctl.scala 68:92]
    node _T_9 = eq(io.exu_flush_final, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 69:26]
    node _T_10 = and(_T_9, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 69:46]
    node _T_11 = eq(io.ifu_bp_hit_taken_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 69:69]
    node _T_12 = and(_T_10, _T_11) @[el2_ifu_ifc_ctl.scala 69:67]
    node sel_next_addr_bf = and(_T_12, io.ic_hit_f) @[el2_ifu_ifc_ctl.scala 69:92]
    node _T_13 = bits(io.exu_flush_final, 0, 0) @[el2_ifu_ifc_ctl.scala 72:56]
    node _T_14 = bits(sel_last_addr_bf, 0, 0) @[el2_ifu_ifc_ctl.scala 73:22]
    node _T_15 = bits(sel_btb_addr_bf, 0, 0) @[el2_ifu_ifc_ctl.scala 74:21]
    node _T_16 = bits(sel_next_addr_bf, 0, 0) @[el2_ifu_ifc_ctl.scala 75:22]
    node _T_17 = mux(_T_13, io.exu_flush_path_final, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_18 = mux(_T_14, io.ifc_fetch_addr_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_19 = mux(_T_15, io.ifu_bp_btb_target_f, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_20 = mux(_T_16, fetch_addr_next, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_21 = or(_T_17, _T_18) @[Mux.scala 27:72]
    node _T_22 = or(_T_21, _T_19) @[Mux.scala 27:72]
    node _T_23 = or(_T_22, _T_20) @[Mux.scala 27:72]
    wire _T_24 : UInt<31> @[Mux.scala 27:72]
    _T_24 <= _T_23 @[Mux.scala 27:72]
    io.ifc_fetch_addr_bf <= _T_24 @[el2_ifu_ifc_ctl.scala 72:24]
    node _T_25 = bits(io.ifc_fetch_addr_f, 30, 1) @[el2_ifu_ifc_ctl.scala 77:42]
    node _T_26 = add(_T_25, UInt<1>("h01")) @[el2_ifu_ifc_ctl.scala 77:48]
    node address_upper = tail(_T_26, 1) @[el2_ifu_ifc_ctl.scala 77:48]
    node _T_27 = bits(address_upper, 4, 4) @[el2_ifu_ifc_ctl.scala 78:39]
    node _T_28 = bits(io.ifc_fetch_addr_f, 5, 5) @[el2_ifu_ifc_ctl.scala 78:84]
    node _T_29 = xor(_T_27, _T_28) @[el2_ifu_ifc_ctl.scala 78:63]
    node _T_30 = eq(_T_29, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 78:24]
    node _T_31 = bits(io.ifc_fetch_addr_f, 0, 0) @[el2_ifu_ifc_ctl.scala 78:130]
    node _T_32 = and(_T_30, _T_31) @[el2_ifu_ifc_ctl.scala 78:109]
    fetch_addr_next_0 <= _T_32 @[el2_ifu_ifc_ctl.scala 78:21]
    node _T_33 = cat(address_upper, fetch_addr_next_0) @[Cat.scala 29:58]
    fetch_addr_next <= _T_33 @[el2_ifu_ifc_ctl.scala 80:19]
    node _T_34 = not(idle) @[el2_ifu_ifc_ctl.scala 82:30]
    io.ifc_fetch_req_bf_raw <= _T_34 @[el2_ifu_ifc_ctl.scala 82:27]
    node _T_35 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctl.scala 84:91]
    node _T_36 = eq(_T_35, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 84:70]
    node _T_37 = and(fb_full_f_ns, _T_36) @[el2_ifu_ifc_ctl.scala 84:68]
    node _T_38 = eq(_T_37, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 84:53]
    node _T_39 = and(io.ifc_fetch_req_bf_raw, _T_38) @[el2_ifu_ifc_ctl.scala 84:51]
    node _T_40 = eq(dma_stall, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 85:5]
    node _T_41 = and(_T_39, _T_40) @[el2_ifu_ifc_ctl.scala 84:114]
    node _T_42 = eq(io.ic_write_stall, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 85:18]
    node _T_43 = and(_T_41, _T_42) @[el2_ifu_ifc_ctl.scala 85:16]
    node _T_44 = eq(io.dec_tlu_flush_noredir_wb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 85:39]
    node _T_45 = and(_T_43, _T_44) @[el2_ifu_ifc_ctl.scala 85:37]
    io.ifc_fetch_req_bf <= _T_45 @[el2_ifu_ifc_ctl.scala 84:23]
    node _T_46 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 87:37]
    fetch_bf_en <= _T_46 @[el2_ifu_ifc_ctl.scala 87:15]
    node _T_47 = eq(io.ic_hit_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 89:34]
    node _T_48 = and(io.ifc_fetch_req_f, _T_47) @[el2_ifu_ifc_ctl.scala 89:32]
    node _T_49 = eq(io.exu_flush_final, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 89:49]
    node _T_50 = and(_T_48, _T_49) @[el2_ifu_ifc_ctl.scala 89:47]
    miss_f <= _T_50 @[el2_ifu_ifc_ctl.scala 89:10]
    node _T_51 = or(io.ifu_ic_mb_empty, io.exu_flush_final) @[el2_ifu_ifc_ctl.scala 91:39]
    node _T_52 = eq(dma_stall, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 91:63]
    node _T_53 = and(_T_51, _T_52) @[el2_ifu_ifc_ctl.scala 91:61]
    node _T_54 = eq(miss_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 91:76]
    node _T_55 = and(_T_53, _T_54) @[el2_ifu_ifc_ctl.scala 91:74]
    node _T_56 = eq(miss_a, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 91:86]
    node _T_57 = and(_T_55, _T_56) @[el2_ifu_ifc_ctl.scala 91:84]
    mb_empty_mod <= _T_57 @[el2_ifu_ifc_ctl.scala 91:16]
    node _T_58 = and(io.exu_flush_final, io.dec_tlu_flush_noredir_wb) @[el2_ifu_ifc_ctl.scala 93:35]
    goto_idle <= _T_58 @[el2_ifu_ifc_ctl.scala 93:13]
    node _T_59 = eq(io.dec_tlu_flush_noredir_wb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 95:38]
    node _T_60 = and(io.exu_flush_final, _T_59) @[el2_ifu_ifc_ctl.scala 95:36]
    node _T_61 = and(_T_60, idle) @[el2_ifu_ifc_ctl.scala 95:67]
    leave_idle <= _T_61 @[el2_ifu_ifc_ctl.scala 95:14]
    node _T_62 = bits(state, 1, 1) @[el2_ifu_ifc_ctl.scala 97:29]
    node _T_63 = eq(_T_62, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 97:23]
    node _T_64 = bits(state, 0, 0) @[el2_ifu_ifc_ctl.scala 97:40]
    node _T_65 = and(_T_63, _T_64) @[el2_ifu_ifc_ctl.scala 97:33]
    node _T_66 = and(_T_65, miss_f) @[el2_ifu_ifc_ctl.scala 97:44]
    node _T_67 = eq(goto_idle, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 97:55]
    node _T_68 = and(_T_66, _T_67) @[el2_ifu_ifc_ctl.scala 97:53]
    node _T_69 = bits(state, 1, 1) @[el2_ifu_ifc_ctl.scala 98:11]
    node _T_70 = eq(mb_empty_mod, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 98:17]
    node _T_71 = and(_T_69, _T_70) @[el2_ifu_ifc_ctl.scala 98:15]
    node _T_72 = eq(goto_idle, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 98:33]
    node _T_73 = and(_T_71, _T_72) @[el2_ifu_ifc_ctl.scala 98:31]
    node next_state_1 = or(_T_68, _T_73) @[el2_ifu_ifc_ctl.scala 97:67]
    node _T_74 = eq(goto_idle, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 100:23]
    node _T_75 = and(_T_74, leave_idle) @[el2_ifu_ifc_ctl.scala 100:34]
    node _T_76 = bits(state, 0, 0) @[el2_ifu_ifc_ctl.scala 100:56]
    node _T_77 = eq(goto_idle, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 100:62]
    node _T_78 = and(_T_76, _T_77) @[el2_ifu_ifc_ctl.scala 100:60]
    node next_state_0 = or(_T_75, _T_78) @[el2_ifu_ifc_ctl.scala 100:48]
    node _T_79 = cat(next_state_1, next_state_0) @[Cat.scala 29:58]
    reg _T_80 : UInt, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 102:45]
    _T_80 <= _T_79 @[el2_ifu_ifc_ctl.scala 102:45]
    state <= _T_80 @[el2_ifu_ifc_ctl.scala 102:9]
    flush_fb <= io.exu_flush_final @[el2_ifu_ifc_ctl.scala 104:12]
    node _T_81 = eq(io.ifu_fb_consume2, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 106:38]
    node _T_82 = and(io.ifu_fb_consume1, _T_81) @[el2_ifu_ifc_ctl.scala 106:36]
    node _T_83 = eq(io.ifc_fetch_req_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 106:61]
    node _T_84 = or(_T_83, miss_f) @[el2_ifu_ifc_ctl.scala 106:81]
    node _T_85 = and(_T_82, _T_84) @[el2_ifu_ifc_ctl.scala 106:58]
    node _T_86 = and(io.ifu_fb_consume2, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 107:25]
    node _T_87 = or(_T_85, _T_86) @[el2_ifu_ifc_ctl.scala 106:92]
    fb_right <= _T_87 @[el2_ifu_ifc_ctl.scala 106:12]
    node _T_88 = not(io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 109:39]
    node _T_89 = or(_T_88, miss_f) @[el2_ifu_ifc_ctl.scala 109:59]
    node _T_90 = and(io.ifu_fb_consume2, _T_89) @[el2_ifu_ifc_ctl.scala 109:36]
    fb_right2 <= _T_90 @[el2_ifu_ifc_ctl.scala 109:13]
    node _T_91 = or(io.ifu_fb_consume1, io.ifu_fb_consume2) @[el2_ifu_ifc_ctl.scala 110:56]
    node _T_92 = eq(_T_91, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 110:35]
    node _T_93 = and(io.ifc_fetch_req_f, _T_92) @[el2_ifu_ifc_ctl.scala 110:33]
    node _T_94 = eq(miss_f, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 110:80]
    node _T_95 = and(_T_93, _T_94) @[el2_ifu_ifc_ctl.scala 110:78]
    fb_left <= _T_95 @[el2_ifu_ifc_ctl.scala 110:11]
    node _T_96 = bits(flush_fb, 0, 0) @[el2_ifu_ifc_ctl.scala 112:37]
    node _T_97 = eq(flush_fb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 113:6]
    node _T_98 = and(_T_97, fb_right) @[el2_ifu_ifc_ctl.scala 113:16]
    node _T_99 = bits(_T_98, 0, 0) @[el2_ifu_ifc_ctl.scala 113:28]
    node _T_100 = bits(fb_write_f, 3, 1) @[el2_ifu_ifc_ctl.scala 113:62]
    node _T_101 = cat(UInt<1>("h00"), _T_100) @[Cat.scala 29:58]
    node _T_102 = eq(flush_fb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 114:6]
    node _T_103 = and(_T_102, fb_right2) @[el2_ifu_ifc_ctl.scala 114:16]
    node _T_104 = bits(_T_103, 0, 0) @[el2_ifu_ifc_ctl.scala 114:29]
    node _T_105 = bits(fb_write_f, 3, 2) @[el2_ifu_ifc_ctl.scala 114:63]
    node _T_106 = cat(UInt<2>("h00"), _T_105) @[Cat.scala 29:58]
    node _T_107 = eq(flush_fb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 115:6]
    node _T_108 = and(_T_107, fb_left) @[el2_ifu_ifc_ctl.scala 115:16]
    node _T_109 = bits(_T_108, 0, 0) @[el2_ifu_ifc_ctl.scala 115:27]
    node _T_110 = bits(fb_write_f, 2, 0) @[el2_ifu_ifc_ctl.scala 115:51]
    node _T_111 = cat(_T_110, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_112 = eq(flush_fb, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 116:6]
    node _T_113 = eq(fb_right, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 116:18]
    node _T_114 = and(_T_112, _T_113) @[el2_ifu_ifc_ctl.scala 116:16]
    node _T_115 = eq(fb_right2, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 116:30]
    node _T_116 = and(_T_114, _T_115) @[el2_ifu_ifc_ctl.scala 116:28]
    node _T_117 = eq(fb_left, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 116:43]
    node _T_118 = and(_T_116, _T_117) @[el2_ifu_ifc_ctl.scala 116:41]
    node _T_119 = bits(_T_118, 0, 0) @[el2_ifu_ifc_ctl.scala 116:53]
    node _T_120 = bits(fb_write_f, 3, 0) @[el2_ifu_ifc_ctl.scala 116:73]
    node _T_121 = mux(_T_96, UInt<4>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_122 = mux(_T_99, _T_101, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_123 = mux(_T_104, _T_106, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_124 = mux(_T_109, _T_111, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_125 = mux(_T_119, _T_120, UInt<1>("h00")) @[Mux.scala 27:72]
    node _T_126 = or(_T_121, _T_122) @[Mux.scala 27:72]
    node _T_127 = or(_T_126, _T_123) @[Mux.scala 27:72]
    node _T_128 = or(_T_127, _T_124) @[Mux.scala 27:72]
    node _T_129 = or(_T_128, _T_125) @[Mux.scala 27:72]
    wire _T_130 : UInt<4> @[Mux.scala 27:72]
    _T_130 <= _T_129 @[Mux.scala 27:72]
    fb_write_ns <= _T_130 @[el2_ifu_ifc_ctl.scala 112:15]
    node _T_131 = eq(state, UInt<2>("h00")) @[el2_ifu_ifc_ctl.scala 119:17]
    idle <= _T_131 @[el2_ifu_ifc_ctl.scala 119:8]
    node _T_132 = eq(state, UInt<2>("h03")) @[el2_ifu_ifc_ctl.scala 120:16]
    wfm <= _T_132 @[el2_ifu_ifc_ctl.scala 120:7]
    node _T_133 = bits(fb_write_ns, 3, 3) @[el2_ifu_ifc_ctl.scala 122:30]
    fb_full_f_ns <= _T_133 @[el2_ifu_ifc_ctl.scala 122:16]
    reg fb_full_f : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 123:52]
    fb_full_f <= fb_full_f_ns @[el2_ifu_ifc_ctl.scala 123:52]
    reg _T_134 : UInt, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 124:50]
    _T_134 <= fb_write_ns @[el2_ifu_ifc_ctl.scala 124:50]
    fb_write_f <= _T_134 @[el2_ifu_ifc_ctl.scala 124:14]
    node _T_135 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctl.scala 127:40]
    node _T_136 = or(_T_135, io.exu_flush_final) @[el2_ifu_ifc_ctl.scala 127:61]
    node _T_137 = eq(_T_136, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 127:19]
    node _T_138 = and(fb_full_f, _T_137) @[el2_ifu_ifc_ctl.scala 127:17]
    node _T_139 = or(_T_138, dma_stall) @[el2_ifu_ifc_ctl.scala 127:84]
    node _T_140 = and(io.ifc_fetch_req_bf_raw, _T_139) @[el2_ifu_ifc_ctl.scala 126:60]
    node _T_141 = or(wfm, _T_140) @[el2_ifu_ifc_ctl.scala 126:33]
    io.ifu_pmu_fetch_stall <= _T_141 @[el2_ifu_ifc_ctl.scala 126:26]
    node _T_142 = cat(io.ifc_fetch_addr_bf, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_143 = bits(_T_142, 31, 28) @[el2_lib.scala 224:25]
    node iccm_acc_in_region_bf = eq(_T_143, UInt<4>("h0e")) @[el2_lib.scala 224:47]
    node _T_144 = bits(_T_142, 31, 16) @[el2_lib.scala 227:14]
    node iccm_acc_in_range_bf = eq(_T_144, UInt<16>("h0ee00")) @[el2_lib.scala 227:29]
    io.ifc_iccm_access_bf <= iccm_acc_in_range_bf @[el2_ifu_ifc_ctl.scala 132:25]
    node _T_145 = eq(io.ifc_iccm_access_bf, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 133:30]
    node _T_146 = or(io.ifu_fb_consume2, io.ifu_fb_consume1) @[el2_ifu_ifc_ctl.scala 134:39]
    node _T_147 = eq(_T_146, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 134:18]
    node _T_148 = and(fb_full_f, _T_147) @[el2_ifu_ifc_ctl.scala 134:16]
    node _T_149 = or(_T_145, _T_148) @[el2_ifu_ifc_ctl.scala 133:53]
    node _T_150 = eq(io.ifc_fetch_req_bf, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 135:13]
    node _T_151 = and(wfm, _T_150) @[el2_ifu_ifc_ctl.scala 135:11]
    node _T_152 = or(_T_149, _T_151) @[el2_ifu_ifc_ctl.scala 134:62]
    node _T_153 = or(_T_152, idle) @[el2_ifu_ifc_ctl.scala 135:35]
    node _T_154 = eq(io.exu_flush_final, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 135:46]
    node _T_155 = and(_T_153, _T_154) @[el2_ifu_ifc_ctl.scala 135:44]
    node _T_156 = or(_T_155, dma_iccm_stall_any_f) @[el2_ifu_ifc_ctl.scala 135:67]
    io.ifc_dma_access_ok <= _T_156 @[el2_ifu_ifc_ctl.scala 133:24]
    node _T_157 = eq(iccm_acc_in_range_bf, UInt<1>("h00")) @[el2_ifu_ifc_ctl.scala 137:33]
    node _T_158 = and(_T_157, iccm_acc_in_region_bf) @[el2_ifu_ifc_ctl.scala 137:55]
    io.ifc_region_acc_fault_bf <= _T_158 @[el2_ifu_ifc_ctl.scala 137:30]
    node _T_159 = bits(io.ifc_fetch_addr_bf, 30, 27) @[el2_ifu_ifc_ctl.scala 138:78]
    node _T_160 = cat(_T_159, UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_161 = dshr(io.dec_tlu_mrac_ff, _T_160) @[el2_ifu_ifc_ctl.scala 138:53]
    node _T_162 = bits(_T_161, 0, 0) @[el2_ifu_ifc_ctl.scala 138:53]
    node _T_163 = not(_T_162) @[el2_ifu_ifc_ctl.scala 138:34]
    io.ifc_fetch_uncacheable_bf <= _T_163 @[el2_ifu_ifc_ctl.scala 138:31]
    reg _T_164 : UInt<1>, io.active_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_ifc_ctl.scala 140:57]
    _T_164 <= io.ifc_fetch_req_bf @[el2_ifu_ifc_ctl.scala 140:57]
    io.ifc_fetch_req_f <= _T_164 @[el2_ifu_ifc_ctl.scala 140:22]
    node _T_165 = or(io.exu_flush_final, io.ifc_fetch_req_f) @[el2_ifu_ifc_ctl.scala 142:73]
    inst rvclkhdr of rvclkhdr @[el2_lib.scala 508:23]
    rvclkhdr.clock <= clock
    rvclkhdr.reset <= reset
    rvclkhdr.io.clk <= clock @[el2_lib.scala 510:18]
    rvclkhdr.io.en <= _T_165 @[el2_lib.scala 511:17]
    rvclkhdr.io.scan_mode <= io.scan_mode @[el2_lib.scala 512:24]
    reg _T_166 : UInt, rvclkhdr.io.l1clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lib.scala 514:16]
    _T_166 <= io.ifc_fetch_addr_bf @[el2_lib.scala 514:16]
    io.ifc_fetch_addr_f <= _T_166 @[el2_ifu_ifc_ctl.scala 142:23]
    
