;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_lsu_lsc_ctl : 
  module rvlsadder : 
    input clock : Clock
    input reset : Reset
    output io : {flip rs1 : UInt<32>, flip offset : UInt<12>, dout : UInt<32>}
    
    node _T = bits(io.rs1, 11, 0) @[beh_lib.scala 47:30]
    node _T_1 = cat(UInt<1>("h00"), _T) @[Cat.scala 29:58]
    node _T_2 = bits(io.offset, 11, 0) @[beh_lib.scala 47:60]
    node _T_3 = cat(UInt<1>("h00"), _T_2) @[Cat.scala 29:58]
    node _T_4 = add(_T_1, _T_3) @[beh_lib.scala 47:38]
    node w1 = tail(_T_4, 1) @[beh_lib.scala 47:38]
    node _T_5 = bits(io.offset, 11, 11) @[beh_lib.scala 49:42]
    node _T_6 = bits(w1, 12, 12) @[beh_lib.scala 49:51]
    node _T_7 = xor(_T_5, _T_6) @[beh_lib.scala 49:47]
    node _T_8 = not(_T_7) @[beh_lib.scala 49:31]
    node _T_9 = bits(_T_8, 0, 0) @[Bitwise.scala 72:15]
    node _T_10 = mux(_T_9, UInt<20>("h0fffff"), UInt<20>("h00")) @[Bitwise.scala 72:12]
    node _T_11 = bits(io.rs1, 31, 12) @[beh_lib.scala 49:67]
    node _T_12 = and(_T_10, _T_11) @[beh_lib.scala 49:59]
    node _T_13 = bits(io.offset, 11, 11) @[beh_lib.scala 50:26]
    node _T_14 = not(_T_13) @[beh_lib.scala 50:16]
    node _T_15 = bits(w1, 12, 12) @[beh_lib.scala 50:35]
    node _T_16 = xor(_T_14, _T_15) @[beh_lib.scala 50:31]
    node _T_17 = bits(_T_16, 0, 0) @[Bitwise.scala 72:15]
    node _T_18 = mux(_T_17, UInt<20>("h0fffff"), UInt<20>("h00")) @[Bitwise.scala 72:12]
    node _T_19 = bits(io.rs1, 31, 12) @[beh_lib.scala 50:51]
    node _T_20 = add(_T_19, UInt<1>("h01")) @[beh_lib.scala 50:58]
    node _T_21 = tail(_T_20, 1) @[beh_lib.scala 50:58]
    node _T_22 = and(_T_18, _T_21) @[beh_lib.scala 50:42]
    node _T_23 = or(_T_12, _T_22) @[beh_lib.scala 49:76]
    node _T_24 = bits(io.offset, 11, 11) @[beh_lib.scala 51:25]
    node _T_25 = bits(w1, 12, 12) @[beh_lib.scala 51:35]
    node _T_26 = not(_T_25) @[beh_lib.scala 51:32]
    node _T_27 = xor(_T_24, _T_26) @[beh_lib.scala 51:30]
    node _T_28 = bits(_T_27, 0, 0) @[Bitwise.scala 72:15]
    node _T_29 = mux(_T_28, UInt<20>("h0fffff"), UInt<20>("h00")) @[Bitwise.scala 72:12]
    node _T_30 = bits(io.rs1, 31, 12) @[beh_lib.scala 51:51]
    node _T_31 = sub(_T_30, UInt<1>("h01")) @[beh_lib.scala 51:58]
    node _T_32 = tail(_T_31, 1) @[beh_lib.scala 51:58]
    node _T_33 = and(_T_29, _T_32) @[beh_lib.scala 51:42]
    node dout_upper = or(_T_23, _T_33) @[beh_lib.scala 50:65]
    node _T_34 = bits(w1, 11, 0) @[beh_lib.scala 53:31]
    node _T_35 = cat(dout_upper, _T_34) @[Cat.scala 29:58]
    io.dout <= _T_35 @[beh_lib.scala 53:11]
    
  module rvrangecheck : 
    input clock : Clock
    input reset : Reset
    output io : {flip addr : UInt<32>, in_range : UInt<1>, in_region : UInt<1>}
    
    node _T = bits(io.addr, 31, 28) @[beh_lib.scala 113:30]
    node _T_1 = eq(_T, UInt<4>("h0f")) @[beh_lib.scala 113:52]
    io.in_region <= _T_1 @[beh_lib.scala 113:19]
    node _T_2 = bits(io.addr, 31, 16) @[beh_lib.scala 117:30]
    node _T_3 = eq(_T_2, UInt<16>("h0f004")) @[beh_lib.scala 117:45]
    io.in_range <= _T_3 @[beh_lib.scala 117:19]
    
  module rvrangecheck_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip addr : UInt<32>, in_range : UInt<1>, in_region : UInt<1>}
    
    node _T = bits(io.addr, 31, 28) @[beh_lib.scala 113:30]
    node _T_1 = eq(_T, UInt<4>("h0f")) @[beh_lib.scala 113:52]
    io.in_region <= _T_1 @[beh_lib.scala 113:19]
    node _T_2 = bits(io.addr, 31, 16) @[beh_lib.scala 117:30]
    node _T_3 = eq(_T_2, UInt<16>("h0f004")) @[beh_lib.scala 117:45]
    io.in_range <= _T_3 @[beh_lib.scala 117:19]
    
  module rvrangecheck_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip addr : UInt<32>, in_range : UInt<1>, in_region : UInt<1>}
    
    node _T = bits(io.addr, 31, 28) @[beh_lib.scala 113:30]
    node _T_1 = eq(_T, UInt<4>("h0f")) @[beh_lib.scala 113:52]
    io.in_region <= _T_1 @[beh_lib.scala 113:19]
    node _T_2 = bits(io.addr, 31, 15) @[beh_lib.scala 117:30]
    node _T_3 = eq(_T_2, UInt<17>("h01e018")) @[beh_lib.scala 117:45]
    io.in_range <= _T_3 @[beh_lib.scala 117:19]
    
  module rvrangecheck_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip addr : UInt<32>, in_range : UInt<1>, in_region : UInt<1>}
    
    node _T = bits(io.addr, 31, 28) @[beh_lib.scala 113:30]
    node _T_1 = eq(_T, UInt<4>("h0f")) @[beh_lib.scala 113:52]
    io.in_region <= _T_1 @[beh_lib.scala 113:19]
    node _T_2 = bits(io.addr, 31, 15) @[beh_lib.scala 117:30]
    node _T_3 = eq(_T_2, UInt<17>("h01e018")) @[beh_lib.scala 117:45]
    io.in_range <= _T_3 @[beh_lib.scala 117:19]
    
  module el2_lsu_addrcheck : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip lsu_c2_m_clk : Clock, flip start_addr_d : UInt<32>, flip end_addr_d : UInt<32>, flip lsu_pkt_d : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip dec_tlu_mrac_ff : UInt<32>, flip rs1_region_d : UInt<4>, flip rs1_d : UInt<32>, is_sideeffects_m : UInt<1>, addr_in_dccm_d : UInt<1>, addr_in_pic_d : UInt<1>, addr_external_d : UInt<1>, access_fault_d : UInt<1>, misaligned_fault_d : UInt<1>, exc_mscause_d : UInt<4>, fir_dccm_access_error_d : UInt<1>, fir_nondccm_access_error_d : UInt<1>, flip scan_mode : UInt<1>}
    
    wire start_addr_in_dccm_d : UInt<1>
    start_addr_in_dccm_d <= UInt<1>("h00")
    wire start_addr_in_dccm_region_d : UInt<1>
    start_addr_in_dccm_region_d <= UInt<1>("h00")
    wire end_addr_in_dccm_d : UInt<1>
    end_addr_in_dccm_d <= UInt<1>("h00")
    wire end_addr_in_dccm_region_d : UInt<1>
    end_addr_in_dccm_region_d <= UInt<1>("h00")
    inst rvrangecheck of rvrangecheck @[el2_lsu_addrcheck.scala 45:44]
    rvrangecheck.clock <= clock
    rvrangecheck.reset <= reset
    rvrangecheck.io.addr <= io.start_addr_d @[el2_lsu_addrcheck.scala 46:41]
    start_addr_in_dccm_d <= rvrangecheck.io.in_range @[el2_lsu_addrcheck.scala 47:41]
    start_addr_in_dccm_region_d <= rvrangecheck.io.in_region @[el2_lsu_addrcheck.scala 48:41]
    inst rvrangecheck_1 of rvrangecheck_1 @[el2_lsu_addrcheck.scala 51:44]
    rvrangecheck_1.clock <= clock
    rvrangecheck_1.reset <= reset
    rvrangecheck_1.io.addr <= io.end_addr_d @[el2_lsu_addrcheck.scala 52:41]
    end_addr_in_dccm_d <= rvrangecheck_1.io.in_range @[el2_lsu_addrcheck.scala 53:41]
    end_addr_in_dccm_region_d <= rvrangecheck_1.io.in_region @[el2_lsu_addrcheck.scala 54:41]
    wire addr_in_iccm : UInt<1>
    addr_in_iccm <= UInt<1>("h00")
    node _T = bits(io.start_addr_d, 31, 28) @[el2_lsu_addrcheck.scala 65:37]
    node _T_1 = eq(_T, UInt<4>("h0e")) @[el2_lsu_addrcheck.scala 65:45]
    addr_in_iccm <= _T_1 @[el2_lsu_addrcheck.scala 65:18]
    inst start_addr_pic_rangecheck of rvrangecheck_2 @[el2_lsu_addrcheck.scala 74:41]
    start_addr_pic_rangecheck.clock <= clock
    start_addr_pic_rangecheck.reset <= reset
    node _T_2 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 75:55]
    start_addr_pic_rangecheck.io.addr <= _T_2 @[el2_lsu_addrcheck.scala 75:37]
    inst end_addr_pic_rangecheck of rvrangecheck_3 @[el2_lsu_addrcheck.scala 80:39]
    end_addr_pic_rangecheck.clock <= clock
    end_addr_pic_rangecheck.reset <= reset
    node _T_3 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 81:51]
    end_addr_pic_rangecheck.io.addr <= _T_3 @[el2_lsu_addrcheck.scala 81:35]
    node start_addr_dccm_or_pic = or(start_addr_in_dccm_region_d, start_addr_pic_rangecheck.io.in_region) @[el2_lsu_addrcheck.scala 85:60]
    node _T_4 = bits(io.rs1_region_d, 3, 0) @[el2_lsu_addrcheck.scala 86:48]
    node _T_5 = eq(_T_4, UInt<4>("h0f")) @[el2_lsu_addrcheck.scala 86:54]
    node _T_6 = bits(io.rs1_region_d, 3, 0) @[el2_lsu_addrcheck.scala 86:92]
    node _T_7 = eq(_T_6, UInt<4>("h0f")) @[el2_lsu_addrcheck.scala 86:98]
    node base_reg_dccm_or_pic = or(_T_5, _T_7) @[el2_lsu_addrcheck.scala 86:74]
    node _T_8 = and(start_addr_in_dccm_d, end_addr_in_dccm_d) @[el2_lsu_addrcheck.scala 87:57]
    io.addr_in_dccm_d <= _T_8 @[el2_lsu_addrcheck.scala 87:32]
    node _T_9 = and(start_addr_pic_rangecheck.io.in_range, end_addr_pic_rangecheck.io.in_range) @[el2_lsu_addrcheck.scala 88:56]
    io.addr_in_pic_d <= _T_9 @[el2_lsu_addrcheck.scala 88:32]
    node _T_10 = or(start_addr_in_dccm_region_d, start_addr_pic_rangecheck.io.in_region) @[el2_lsu_addrcheck.scala 90:63]
    node _T_11 = not(_T_10) @[el2_lsu_addrcheck.scala 90:33]
    io.addr_external_d <= _T_11 @[el2_lsu_addrcheck.scala 90:30]
    node _T_12 = bits(io.start_addr_d, 31, 28) @[el2_lsu_addrcheck.scala 91:51]
    node csr_idx = cat(_T_12, UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_13 = dshr(io.dec_tlu_mrac_ff, csr_idx) @[el2_lsu_addrcheck.scala 92:50]
    node _T_14 = bits(_T_13, 0, 0) @[el2_lsu_addrcheck.scala 92:50]
    node _T_15 = or(start_addr_in_dccm_region_d, start_addr_pic_rangecheck.io.in_region) @[el2_lsu_addrcheck.scala 92:92]
    node _T_16 = or(_T_15, addr_in_iccm) @[el2_lsu_addrcheck.scala 92:121]
    node _T_17 = not(_T_16) @[el2_lsu_addrcheck.scala 92:62]
    node _T_18 = and(_T_14, _T_17) @[el2_lsu_addrcheck.scala 92:60]
    node _T_19 = and(_T_18, io.lsu_pkt_d.valid) @[el2_lsu_addrcheck.scala 92:137]
    node _T_20 = or(io.lsu_pkt_d.store, io.lsu_pkt_d.load) @[el2_lsu_addrcheck.scala 92:180]
    node is_sideeffects_d = and(_T_19, _T_20) @[el2_lsu_addrcheck.scala 92:158]
    node _T_21 = bits(io.start_addr_d, 1, 0) @[el2_lsu_addrcheck.scala 93:69]
    node _T_22 = eq(_T_21, UInt<1>("h00")) @[el2_lsu_addrcheck.scala 93:75]
    node _T_23 = and(io.lsu_pkt_d.word, _T_22) @[el2_lsu_addrcheck.scala 93:51]
    node _T_24 = bits(io.start_addr_d, 0, 0) @[el2_lsu_addrcheck.scala 93:124]
    node _T_25 = eq(_T_24, UInt<1>("h00")) @[el2_lsu_addrcheck.scala 93:128]
    node _T_26 = and(io.lsu_pkt_d.half, _T_25) @[el2_lsu_addrcheck.scala 93:106]
    node _T_27 = or(_T_23, _T_26) @[el2_lsu_addrcheck.scala 93:85]
    node is_aligned_d = or(_T_27, io.lsu_pkt_d.by) @[el2_lsu_addrcheck.scala 93:138]
    node _T_28 = cat(UInt<1>("h00"), UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_29 = cat(UInt<1>("h00"), UInt<1>("h00")) @[Cat.scala 29:58]
    node _T_30 = cat(_T_29, _T_28) @[Cat.scala 29:58]
    node _T_31 = cat(UInt<1>("h01"), UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_32 = cat(UInt<1>("h01"), UInt<1>("h01")) @[Cat.scala 29:58]
    node _T_33 = cat(_T_32, _T_31) @[Cat.scala 29:58]
    node _T_34 = cat(_T_33, _T_30) @[Cat.scala 29:58]
    node _T_35 = orr(_T_34) @[el2_lsu_addrcheck.scala 97:99]
    node _T_36 = not(_T_35) @[el2_lsu_addrcheck.scala 96:33]
    node _T_37 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 98:50]
    node _T_38 = or(_T_37, UInt<32>("h07fffffff")) @[el2_lsu_addrcheck.scala 98:57]
    node _T_39 = or(UInt<32>("h00"), UInt<32>("h07fffffff")) @[el2_lsu_addrcheck.scala 98:108]
    node _T_40 = eq(_T_38, _T_39) @[el2_lsu_addrcheck.scala 98:82]
    node _T_41 = and(UInt<1>("h01"), _T_40) @[el2_lsu_addrcheck.scala 98:31]
    node _T_42 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 99:50]
    node _T_43 = or(_T_42, UInt<32>("h03fffffff")) @[el2_lsu_addrcheck.scala 99:57]
    node _T_44 = or(UInt<32>("h0c0000000"), UInt<32>("h03fffffff")) @[el2_lsu_addrcheck.scala 99:108]
    node _T_45 = eq(_T_43, _T_44) @[el2_lsu_addrcheck.scala 99:82]
    node _T_46 = and(UInt<1>("h01"), _T_45) @[el2_lsu_addrcheck.scala 99:31]
    node _T_47 = or(_T_41, _T_46) @[el2_lsu_addrcheck.scala 98:133]
    node _T_48 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 100:50]
    node _T_49 = or(_T_48, UInt<32>("h01fffffff")) @[el2_lsu_addrcheck.scala 100:57]
    node _T_50 = or(UInt<32>("h0a0000000"), UInt<32>("h01fffffff")) @[el2_lsu_addrcheck.scala 100:108]
    node _T_51 = eq(_T_49, _T_50) @[el2_lsu_addrcheck.scala 100:82]
    node _T_52 = and(UInt<1>("h01"), _T_51) @[el2_lsu_addrcheck.scala 100:31]
    node _T_53 = or(_T_47, _T_52) @[el2_lsu_addrcheck.scala 99:133]
    node _T_54 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 101:50]
    node _T_55 = or(_T_54, UInt<32>("h0fffffff")) @[el2_lsu_addrcheck.scala 101:57]
    node _T_56 = or(UInt<32>("h080000000"), UInt<32>("h0fffffff")) @[el2_lsu_addrcheck.scala 101:108]
    node _T_57 = eq(_T_55, _T_56) @[el2_lsu_addrcheck.scala 101:82]
    node _T_58 = and(UInt<1>("h01"), _T_57) @[el2_lsu_addrcheck.scala 101:31]
    node _T_59 = or(_T_53, _T_58) @[el2_lsu_addrcheck.scala 100:133]
    node _T_60 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 102:50]
    node _T_61 = or(_T_60, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 102:57]
    node _T_62 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 102:108]
    node _T_63 = eq(_T_61, _T_62) @[el2_lsu_addrcheck.scala 102:82]
    node _T_64 = and(UInt<1>("h00"), _T_63) @[el2_lsu_addrcheck.scala 102:31]
    node _T_65 = or(_T_59, _T_64) @[el2_lsu_addrcheck.scala 101:133]
    node _T_66 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 103:50]
    node _T_67 = or(_T_66, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 103:57]
    node _T_68 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 103:108]
    node _T_69 = eq(_T_67, _T_68) @[el2_lsu_addrcheck.scala 103:82]
    node _T_70 = and(UInt<1>("h00"), _T_69) @[el2_lsu_addrcheck.scala 103:31]
    node _T_71 = or(_T_65, _T_70) @[el2_lsu_addrcheck.scala 102:133]
    node _T_72 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 104:50]
    node _T_73 = or(_T_72, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 104:57]
    node _T_74 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 104:108]
    node _T_75 = eq(_T_73, _T_74) @[el2_lsu_addrcheck.scala 104:82]
    node _T_76 = and(UInt<1>("h00"), _T_75) @[el2_lsu_addrcheck.scala 104:31]
    node _T_77 = or(_T_71, _T_76) @[el2_lsu_addrcheck.scala 103:133]
    node _T_78 = bits(io.start_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 105:50]
    node _T_79 = or(_T_78, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 105:57]
    node _T_80 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 105:108]
    node _T_81 = eq(_T_79, _T_80) @[el2_lsu_addrcheck.scala 105:82]
    node _T_82 = and(UInt<1>("h00"), _T_81) @[el2_lsu_addrcheck.scala 105:31]
    node _T_83 = or(_T_77, _T_82) @[el2_lsu_addrcheck.scala 104:133]
    node _T_84 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 107:49]
    node _T_85 = or(_T_84, UInt<32>("h07fffffff")) @[el2_lsu_addrcheck.scala 107:58]
    node _T_86 = or(UInt<32>("h00"), UInt<32>("h07fffffff")) @[el2_lsu_addrcheck.scala 107:109]
    node _T_87 = eq(_T_85, _T_86) @[el2_lsu_addrcheck.scala 107:83]
    node _T_88 = and(UInt<1>("h01"), _T_87) @[el2_lsu_addrcheck.scala 107:32]
    node _T_89 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 108:50]
    node _T_90 = or(_T_89, UInt<32>("h03fffffff")) @[el2_lsu_addrcheck.scala 108:59]
    node _T_91 = or(UInt<32>("h0c0000000"), UInt<32>("h03fffffff")) @[el2_lsu_addrcheck.scala 108:110]
    node _T_92 = eq(_T_90, _T_91) @[el2_lsu_addrcheck.scala 108:84]
    node _T_93 = and(UInt<1>("h01"), _T_92) @[el2_lsu_addrcheck.scala 108:33]
    node _T_94 = or(_T_88, _T_93) @[el2_lsu_addrcheck.scala 107:134]
    node _T_95 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 109:50]
    node _T_96 = or(_T_95, UInt<32>("h01fffffff")) @[el2_lsu_addrcheck.scala 109:59]
    node _T_97 = or(UInt<32>("h0a0000000"), UInt<32>("h01fffffff")) @[el2_lsu_addrcheck.scala 109:110]
    node _T_98 = eq(_T_96, _T_97) @[el2_lsu_addrcheck.scala 109:84]
    node _T_99 = and(UInt<1>("h01"), _T_98) @[el2_lsu_addrcheck.scala 109:33]
    node _T_100 = or(_T_94, _T_99) @[el2_lsu_addrcheck.scala 108:135]
    node _T_101 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 110:50]
    node _T_102 = or(_T_101, UInt<32>("h0fffffff")) @[el2_lsu_addrcheck.scala 110:59]
    node _T_103 = or(UInt<32>("h080000000"), UInt<32>("h0fffffff")) @[el2_lsu_addrcheck.scala 110:110]
    node _T_104 = eq(_T_102, _T_103) @[el2_lsu_addrcheck.scala 110:84]
    node _T_105 = and(UInt<1>("h01"), _T_104) @[el2_lsu_addrcheck.scala 110:33]
    node _T_106 = or(_T_100, _T_105) @[el2_lsu_addrcheck.scala 109:135]
    node _T_107 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 111:50]
    node _T_108 = or(_T_107, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 111:59]
    node _T_109 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 111:110]
    node _T_110 = eq(_T_108, _T_109) @[el2_lsu_addrcheck.scala 111:84]
    node _T_111 = and(UInt<1>("h00"), _T_110) @[el2_lsu_addrcheck.scala 111:33]
    node _T_112 = or(_T_106, _T_111) @[el2_lsu_addrcheck.scala 110:135]
    node _T_113 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 112:50]
    node _T_114 = or(_T_113, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 112:59]
    node _T_115 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 112:110]
    node _T_116 = eq(_T_114, _T_115) @[el2_lsu_addrcheck.scala 112:84]
    node _T_117 = and(UInt<1>("h00"), _T_116) @[el2_lsu_addrcheck.scala 112:33]
    node _T_118 = or(_T_112, _T_117) @[el2_lsu_addrcheck.scala 111:135]
    node _T_119 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 113:50]
    node _T_120 = or(_T_119, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 113:59]
    node _T_121 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 113:110]
    node _T_122 = eq(_T_120, _T_121) @[el2_lsu_addrcheck.scala 113:84]
    node _T_123 = and(UInt<1>("h00"), _T_122) @[el2_lsu_addrcheck.scala 113:33]
    node _T_124 = or(_T_118, _T_123) @[el2_lsu_addrcheck.scala 112:135]
    node _T_125 = bits(io.end_addr_d, 31, 0) @[el2_lsu_addrcheck.scala 114:50]
    node _T_126 = or(_T_125, UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 114:59]
    node _T_127 = or(UInt<32>("h00"), UInt<32>("h0ffffffff")) @[el2_lsu_addrcheck.scala 114:110]
    node _T_128 = eq(_T_126, _T_127) @[el2_lsu_addrcheck.scala 114:84]
    node _T_129 = and(UInt<1>("h00"), _T_128) @[el2_lsu_addrcheck.scala 114:33]
    node _T_130 = or(_T_124, _T_129) @[el2_lsu_addrcheck.scala 113:135]
    node _T_131 = and(_T_83, _T_130) @[el2_lsu_addrcheck.scala 106:7]
    node non_dccm_access_ok = or(_T_36, _T_131) @[el2_lsu_addrcheck.scala 97:104]
    node regpred_access_fault_d = xor(start_addr_dccm_or_pic, base_reg_dccm_or_pic) @[el2_lsu_addrcheck.scala 116:57]
    node _T_132 = bits(io.start_addr_d, 1, 0) @[el2_lsu_addrcheck.scala 117:70]
    node _T_133 = neq(_T_132, UInt<2>("h00")) @[el2_lsu_addrcheck.scala 117:76]
    node _T_134 = not(io.lsu_pkt_d.word) @[el2_lsu_addrcheck.scala 117:92]
    node _T_135 = or(_T_133, _T_134) @[el2_lsu_addrcheck.scala 117:90]
    node picm_access_fault_d = and(io.addr_in_pic_d, _T_135) @[el2_lsu_addrcheck.scala 117:51]
    wire unmapped_access_fault_d : UInt<1>
    unmapped_access_fault_d <= UInt<1>("h01")
    wire mpu_access_fault_d : UInt<1>
    mpu_access_fault_d <= UInt<1>("h01")
    node _T_136 = or(start_addr_in_dccm_d, start_addr_pic_rangecheck.io.in_range) @[el2_lsu_addrcheck.scala 122:87]
    node _T_137 = not(_T_136) @[el2_lsu_addrcheck.scala 122:64]
    node _T_138 = and(start_addr_in_dccm_region_d, _T_137) @[el2_lsu_addrcheck.scala 122:62]
    node _T_139 = or(end_addr_in_dccm_d, end_addr_pic_rangecheck.io.in_range) @[el2_lsu_addrcheck.scala 124:57]
    node _T_140 = not(_T_139) @[el2_lsu_addrcheck.scala 124:36]
    node _T_141 = and(end_addr_in_dccm_region_d, _T_140) @[el2_lsu_addrcheck.scala 124:34]
    node _T_142 = or(_T_138, _T_141) @[el2_lsu_addrcheck.scala 122:112]
    node _T_143 = and(start_addr_in_dccm_d, end_addr_pic_rangecheck.io.in_range) @[el2_lsu_addrcheck.scala 126:29]
    node _T_144 = or(_T_142, _T_143) @[el2_lsu_addrcheck.scala 124:85]
    node _T_145 = and(start_addr_pic_rangecheck.io.in_range, end_addr_in_dccm_d) @[el2_lsu_addrcheck.scala 128:29]
    node _T_146 = or(_T_144, _T_145) @[el2_lsu_addrcheck.scala 126:85]
    unmapped_access_fault_d <= _T_146 @[el2_lsu_addrcheck.scala 122:29]
    node _T_147 = not(start_addr_in_dccm_region_d) @[el2_lsu_addrcheck.scala 130:33]
    node _T_148 = not(non_dccm_access_ok) @[el2_lsu_addrcheck.scala 130:64]
    node _T_149 = and(_T_147, _T_148) @[el2_lsu_addrcheck.scala 130:62]
    mpu_access_fault_d <= _T_149 @[el2_lsu_addrcheck.scala 130:29]
    node _T_150 = or(unmapped_access_fault_d, mpu_access_fault_d) @[el2_lsu_addrcheck.scala 142:49]
    node _T_151 = or(_T_150, picm_access_fault_d) @[el2_lsu_addrcheck.scala 142:70]
    node _T_152 = or(_T_151, regpred_access_fault_d) @[el2_lsu_addrcheck.scala 142:92]
    node _T_153 = and(_T_152, io.lsu_pkt_d.valid) @[el2_lsu_addrcheck.scala 142:118]
    node _T_154 = not(io.lsu_pkt_d.dma) @[el2_lsu_addrcheck.scala 142:141]
    node _T_155 = and(_T_153, _T_154) @[el2_lsu_addrcheck.scala 142:139]
    io.access_fault_d <= _T_155 @[el2_lsu_addrcheck.scala 142:21]
    node _T_156 = bits(unmapped_access_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 143:60]
    node _T_157 = bits(mpu_access_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 143:100]
    node _T_158 = bits(regpred_access_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 143:144]
    node _T_159 = bits(picm_access_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 143:185]
    node _T_160 = mux(_T_159, UInt<4>("h06"), UInt<4>("h00")) @[el2_lsu_addrcheck.scala 143:164]
    node _T_161 = mux(_T_158, UInt<4>("h05"), _T_160) @[el2_lsu_addrcheck.scala 143:120]
    node _T_162 = mux(_T_157, UInt<4>("h03"), _T_161) @[el2_lsu_addrcheck.scala 143:80]
    node access_fault_mscause_d = mux(_T_156, UInt<4>("h02"), _T_162) @[el2_lsu_addrcheck.scala 143:35]
    node _T_163 = bits(io.start_addr_d, 31, 28) @[el2_lsu_addrcheck.scala 144:53]
    node _T_164 = bits(io.end_addr_d, 31, 28) @[el2_lsu_addrcheck.scala 144:78]
    node regcross_misaligned_fault_d = neq(_T_163, _T_164) @[el2_lsu_addrcheck.scala 144:61]
    node _T_165 = not(is_aligned_d) @[el2_lsu_addrcheck.scala 145:59]
    node sideeffect_misaligned_fault_d = and(is_sideeffects_d, _T_165) @[el2_lsu_addrcheck.scala 145:57]
    node _T_166 = and(sideeffect_misaligned_fault_d, io.addr_external_d) @[el2_lsu_addrcheck.scala 146:90]
    node _T_167 = or(regcross_misaligned_fault_d, _T_166) @[el2_lsu_addrcheck.scala 146:57]
    node _T_168 = and(_T_167, io.lsu_pkt_d.valid) @[el2_lsu_addrcheck.scala 146:113]
    node _T_169 = not(io.lsu_pkt_d.dma) @[el2_lsu_addrcheck.scala 146:136]
    node _T_170 = and(_T_168, _T_169) @[el2_lsu_addrcheck.scala 146:134]
    io.misaligned_fault_d <= _T_170 @[el2_lsu_addrcheck.scala 146:25]
    node _T_171 = bits(sideeffect_misaligned_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 147:111]
    node _T_172 = mux(_T_171, UInt<4>("h01"), UInt<4>("h00")) @[el2_lsu_addrcheck.scala 147:80]
    node misaligned_fault_mscause_d = mux(regcross_misaligned_fault_d, UInt<4>("h02"), _T_172) @[el2_lsu_addrcheck.scala 147:39]
    node _T_173 = bits(io.misaligned_fault_d, 0, 0) @[el2_lsu_addrcheck.scala 148:50]
    node _T_174 = bits(misaligned_fault_mscause_d, 3, 0) @[el2_lsu_addrcheck.scala 148:84]
    node _T_175 = bits(access_fault_mscause_d, 3, 0) @[el2_lsu_addrcheck.scala 148:113]
    node _T_176 = mux(_T_173, _T_174, _T_175) @[el2_lsu_addrcheck.scala 148:27]
    io.exc_mscause_d <= _T_176 @[el2_lsu_addrcheck.scala 148:21]
    node _T_177 = not(start_addr_in_dccm_d) @[el2_lsu_addrcheck.scala 149:66]
    node _T_178 = and(start_addr_in_dccm_region_d, _T_177) @[el2_lsu_addrcheck.scala 149:64]
    node _T_179 = not(end_addr_in_dccm_d) @[el2_lsu_addrcheck.scala 149:120]
    node _T_180 = and(end_addr_in_dccm_region_d, _T_179) @[el2_lsu_addrcheck.scala 149:118]
    node _T_181 = or(_T_178, _T_180) @[el2_lsu_addrcheck.scala 149:88]
    node _T_182 = and(_T_181, io.lsu_pkt_d.valid) @[el2_lsu_addrcheck.scala 149:142]
    node _T_183 = and(_T_182, io.lsu_pkt_d.fast_int) @[el2_lsu_addrcheck.scala 149:163]
    io.fir_dccm_access_error_d <= _T_183 @[el2_lsu_addrcheck.scala 149:31]
    node _T_184 = and(start_addr_in_dccm_region_d, end_addr_in_dccm_region_d) @[el2_lsu_addrcheck.scala 150:66]
    node _T_185 = not(_T_184) @[el2_lsu_addrcheck.scala 150:36]
    node _T_186 = and(_T_185, io.lsu_pkt_d.valid) @[el2_lsu_addrcheck.scala 150:95]
    node _T_187 = and(_T_186, io.lsu_pkt_d.fast_int) @[el2_lsu_addrcheck.scala 150:116]
    io.fir_nondccm_access_error_d <= _T_187 @[el2_lsu_addrcheck.scala 150:33]
    reg _T_188 : UInt, io.lsu_c2_m_clk with : (reset => (reset, UInt<1>("h00"))) @[el2_lsu_addrcheck.scala 152:60]
    _T_188 <= is_sideeffects_d @[el2_lsu_addrcheck.scala 152:60]
    io.is_sideeffects_m <= _T_188 @[el2_lsu_addrcheck.scala 152:50]
    
  module rvdff : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<4>, dout : UInt<4>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<2>, dout : UInt<2>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<1>, dout : UInt<1>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module rvdff_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<32>, dout : UInt<32>}
    
    reg flop : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[beh_lib.scala 12:21]
    flop <= io.din @[beh_lib.scala 12:21]
    io.dout <= flop @[beh_lib.scala 17:12]
    
  module el2_lsu_lsc_ctl : 
    input clock : Clock
    input reset : AsyncReset
    output io : {flip lsu_c1_m_clk : Clock, flip lsu_c1_r_clk : Clock, flip lsu_c2_m_clk : Clock, flip lsu_c2_r_clk : Clock, flip lsu_store_c1_m_clk : Clock, flip lsu_ld_data_r : UInt<32>, flip lsu_ld_data_corr_r : UInt<32>, flip lsu_single_ecc_error_r : UInt<1>, flip lsu_double_ecc_error_r : UInt<1>, flip lsu_ld_data_m : UInt<32>, flip lsu_single_ecc_error_m : UInt<1>, flip lsu_double_ecc_error_m : UInt<1>, flip flush_m_up : UInt<1>, flip flush_r : UInt<1>, flip exu_lsu_rs1_d : UInt<32>, flip exu_lsu_rs2_d : UInt<32>, flip lsu_p : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip dec_lsu_valid_raw_d : UInt<1>, flip dec_lsu_offset_d : UInt<12>, flip picm_mask_data_m : UInt<32>, flip bus_read_data_m : UInt<32>, lsu_result_m : UInt<32>, lsu_result_corr_r : UInt<32>, lsu_addr_d : UInt<32>, lsu_addr_m : UInt<32>, lsu_addr_r : UInt<32>, end_addr_d : UInt<32>, end_addr_m : UInt<32>, end_addr_r : UInt<32>, store_data_m : UInt<32>, flip dec_tlu_mrac_ff : UInt<32>, lsu_exc_m : UInt<1>, is_sideeffects_m : UInt<1>, lsu_commit_r : UInt<1>, lsu_single_ecc_error_incr : UInt<1>, lsu_error_pkt_r : {exc_valid : UInt<1>, single_ecc_error : UInt<1>, inst_type : UInt<1>, exc_type : UInt<1>, mscause : UInt<4>, addr : UInt<32>}, lsu_fir_addr : UInt<32>, lsu_fir_error : UInt<2>, addr_in_dccm_d : UInt<1>, addr_in_dccm_m : UInt<1>, addr_in_dccm_r : UInt<1>, addr_in_pic_d : UInt<1>, addr_in_pic_m : UInt<1>, addr_in_pic_r : UInt<1>, addr_external_m : UInt<1>, flip dma_dccm_req : UInt<1>, flip dma_mem_addr : UInt<32>, flip dma_mem_sz : UInt<3>, flip dma_mem_write : UInt<1>, flip dma_mem_wdata : UInt<64>, lsu_pkt_d : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, lsu_pkt_m : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, lsu_pkt_r : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, flip scan_mode : UInt<1>}
    
    wire dma_pkt_d : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>} @[el2_lsu_lsc_ctl.scala 103:29]
    wire lsu_pkt_m_in : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>} @[el2_lsu_lsc_ctl.scala 104:29]
    wire lsu_pkt_r_in : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>} @[el2_lsu_lsc_ctl.scala 105:29]
    wire lsu_error_pkt_m : {exc_valid : UInt<1>, single_ecc_error : UInt<1>, inst_type : UInt<1>, exc_type : UInt<1>, mscause : UInt<4>, addr : UInt<32>} @[el2_lsu_lsc_ctl.scala 106:29]
    node _T = bits(io.dec_lsu_valid_raw_d, 0, 0) @[el2_lsu_lsc_ctl.scala 108:52]
    node lsu_rs1_d = mux(_T, io.exu_lsu_rs1_d, io.dma_mem_addr) @[el2_lsu_lsc_ctl.scala 108:28]
    node _T_1 = bits(io.dec_lsu_offset_d, 11, 0) @[el2_lsu_lsc_ctl.scala 109:44]
    node _T_2 = bits(io.dec_lsu_valid_raw_d, 0, 0) @[Bitwise.scala 72:15]
    node _T_3 = mux(_T_2, UInt<12>("h0fff"), UInt<12>("h00")) @[Bitwise.scala 72:12]
    node lsu_offset_d = and(_T_1, _T_3) @[el2_lsu_lsc_ctl.scala 109:51]
    node _T_4 = bits(io.lsu_pkt_d.load_ldst_bypass_d, 0, 0) @[el2_lsu_lsc_ctl.scala 114:51]
    node rs1_d = mux(_T_4, io.lsu_result_m, lsu_rs1_d) @[el2_lsu_lsc_ctl.scala 114:18]
    inst lsadder of rvlsadder @[el2_lsu_lsc_ctl.scala 118:23]
    lsadder.clock <= clock
    lsadder.reset <= reset
    lsadder.io.rs1 <= rs1_d @[el2_lsu_lsc_ctl.scala 119:26]
    lsadder.io.offset <= lsu_offset_d @[el2_lsu_lsc_ctl.scala 120:26]
    node _T_5 = bits(io.lsu_pkt_d.half, 0, 0) @[Bitwise.scala 72:15]
    node _T_6 = mux(_T_5, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_7 = and(_T_6, UInt<1>("h01")) @[el2_lsu_lsc_ctl.scala 127:53]
    node _T_8 = bits(io.lsu_pkt_d.word, 0, 0) @[Bitwise.scala 72:15]
    node _T_9 = mux(_T_8, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_10 = and(_T_9, UInt<2>("h03")) @[el2_lsu_lsc_ctl.scala 128:35]
    node _T_11 = or(_T_7, _T_10) @[el2_lsu_lsc_ctl.scala 127:65]
    node _T_12 = bits(io.lsu_pkt_d.dword, 0, 0) @[Bitwise.scala 72:15]
    node _T_13 = mux(_T_12, UInt<3>("h07"), UInt<3>("h00")) @[Bitwise.scala 72:12]
    node _T_14 = and(_T_13, UInt<3>("h07")) @[el2_lsu_lsc_ctl.scala 129:35]
    node addr_offset_d = or(_T_11, _T_14) @[el2_lsu_lsc_ctl.scala 128:47]
    node _T_15 = bits(lsu_offset_d, 11, 11) @[el2_lsu_lsc_ctl.scala 131:39]
    node _T_16 = bits(lsu_offset_d, 11, 0) @[el2_lsu_lsc_ctl.scala 131:52]
    node _T_17 = cat(_T_15, _T_16) @[Cat.scala 29:58]
    node _T_18 = mux(UInt<1>("h00"), UInt<9>("h01ff"), UInt<9>("h00")) @[Bitwise.scala 72:12]
    node _T_19 = bits(addr_offset_d, 2, 0) @[el2_lsu_lsc_ctl.scala 131:94]
    node _T_20 = cat(_T_18, _T_19) @[Cat.scala 29:58]
    node _T_21 = add(_T_17, _T_20) @[el2_lsu_lsc_ctl.scala 131:60]
    node end_addr_offset_d = tail(_T_21, 1) @[el2_lsu_lsc_ctl.scala 131:60]
    node _T_22 = bits(rs1_d, 31, 0) @[el2_lsu_lsc_ctl.scala 132:32]
    node _T_23 = bits(end_addr_offset_d, 12, 12) @[el2_lsu_lsc_ctl.scala 132:70]
    node _T_24 = bits(_T_23, 0, 0) @[Bitwise.scala 72:15]
    node _T_25 = mux(_T_24, UInt<19>("h07ffff"), UInt<19>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = bits(end_addr_offset_d, 12, 0) @[el2_lsu_lsc_ctl.scala 132:93]
    node _T_27 = cat(_T_25, _T_26) @[Cat.scala 29:58]
    node _T_28 = add(_T_22, _T_27) @[el2_lsu_lsc_ctl.scala 132:39]
    node full_end_addr_d = tail(_T_28, 1) @[el2_lsu_lsc_ctl.scala 132:39]
    io.end_addr_d <= full_end_addr_d @[el2_lsu_lsc_ctl.scala 133:24]
    inst addrcheck of el2_lsu_addrcheck @[el2_lsu_lsc_ctl.scala 141:25]
    addrcheck.clock <= clock
    addrcheck.reset <= reset
    addrcheck.io.lsu_c2_m_clk <= io.lsu_c2_m_clk @[el2_lsu_lsc_ctl.scala 143:42]
    addrcheck.io.start_addr_d <= lsadder.io.dout @[el2_lsu_lsc_ctl.scala 145:42]
    addrcheck.io.end_addr_d <= full_end_addr_d @[el2_lsu_lsc_ctl.scala 146:42]
    addrcheck.io.lsu_pkt_d.valid <= io.lsu_pkt_d.valid @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.store_data_bypass_m <= io.lsu_pkt_d.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.load_ldst_bypass_d <= io.lsu_pkt_d.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.store_data_bypass_d <= io.lsu_pkt_d.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.dma <= io.lsu_pkt_d.dma @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.unsign <= io.lsu_pkt_d.unsign @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.store <= io.lsu_pkt_d.store @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.load <= io.lsu_pkt_d.load @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.dword <= io.lsu_pkt_d.dword @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.word <= io.lsu_pkt_d.word @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.half <= io.lsu_pkt_d.half @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.by <= io.lsu_pkt_d.by @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.lsu_pkt_d.fast_int <= io.lsu_pkt_d.fast_int @[el2_lsu_lsc_ctl.scala 147:42]
    addrcheck.io.dec_tlu_mrac_ff <= io.dec_tlu_mrac_ff @[el2_lsu_lsc_ctl.scala 148:42]
    node _T_29 = bits(rs1_d, 31, 28) @[el2_lsu_lsc_ctl.scala 149:50]
    addrcheck.io.rs1_region_d <= _T_29 @[el2_lsu_lsc_ctl.scala 149:42]
    addrcheck.io.rs1_d <= rs1_d @[el2_lsu_lsc_ctl.scala 150:42]
    io.is_sideeffects_m <= addrcheck.io.is_sideeffects_m @[el2_lsu_lsc_ctl.scala 151:42]
    io.addr_in_dccm_d <= addrcheck.io.addr_in_dccm_d @[el2_lsu_lsc_ctl.scala 152:42]
    io.addr_in_pic_d <= addrcheck.io.addr_in_pic_d @[el2_lsu_lsc_ctl.scala 153:42]
    addrcheck.io.scan_mode <= io.scan_mode @[el2_lsu_lsc_ctl.scala 160:42]
    wire access_fault_r : UInt<1>
    access_fault_r <= UInt<1>("h00")
    wire misaligned_fault_r : UInt<1>
    misaligned_fault_r <= UInt<1>("h00")
    wire exc_mscause_r : UInt<4>
    exc_mscause_r <= UInt<4>("h00")
    wire fir_dccm_access_error_r : UInt<1>
    fir_dccm_access_error_r <= UInt<1>("h00")
    wire fir_nondccm_access_error_r : UInt<1>
    fir_nondccm_access_error_r <= UInt<1>("h00")
    inst access_fault_mff of rvdff @[el2_lsu_lsc_ctl.scala 169:45]
    access_fault_mff.clock <= clock
    access_fault_mff.reset <= reset
    inst misaligned_fault_mff of rvdff_1 @[el2_lsu_lsc_ctl.scala 171:45]
    misaligned_fault_mff.clock <= clock
    misaligned_fault_mff.reset <= reset
    inst exc_mscause_mff of rvdff_2 @[el2_lsu_lsc_ctl.scala 173:45]
    exc_mscause_mff.clock <= clock
    exc_mscause_mff.reset <= reset
    inst lsu_fir_error_rff of rvdff_3 @[el2_lsu_lsc_ctl.scala 177:45]
    lsu_fir_error_rff.clock <= clock
    lsu_fir_error_rff.reset <= reset
    wire lsu_fir_error_m : UInt<2>
    lsu_fir_error_m <= UInt<2>("h00")
    wire access_fault_m : UInt<1>
    access_fault_m <= UInt<1>("h00")
    wire misaligned_fault_m : UInt<1>
    misaligned_fault_m <= UInt<1>("h00")
    wire exc_mscause_m : UInt<4>
    exc_mscause_m <= UInt<4>("h00")
    wire fir_dccm_access_error_m : UInt<1>
    fir_dccm_access_error_m <= UInt<1>("h00")
    wire fir_nondccm_access_error_m : UInt<1>
    fir_nondccm_access_error_m <= UInt<1>("h00")
    node _T_30 = or(access_fault_m, misaligned_fault_m) @[el2_lsu_lsc_ctl.scala 188:34]
    io.lsu_exc_m <= _T_30 @[el2_lsu_lsc_ctl.scala 188:16]
    node _T_31 = eq(io.lsu_double_ecc_error_r, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 189:64]
    node _T_32 = and(io.lsu_single_ecc_error_r, _T_31) @[el2_lsu_lsc_ctl.scala 189:62]
    node _T_33 = or(io.lsu_commit_r, io.lsu_pkt_r.dma) @[el2_lsu_lsc_ctl.scala 189:111]
    node _T_34 = and(_T_32, _T_33) @[el2_lsu_lsc_ctl.scala 189:92]
    node _T_35 = and(_T_34, io.lsu_pkt_r.valid) @[el2_lsu_lsc_ctl.scala 189:131]
    io.lsu_single_ecc_error_incr <= _T_35 @[el2_lsu_lsc_ctl.scala 189:32]
    io.lsu_fir_error <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 228:23]
    node _T_36 = or(access_fault_m, misaligned_fault_m) @[el2_lsu_lsc_ctl.scala 230:50]
    node _T_37 = or(_T_36, io.lsu_double_ecc_error_m) @[el2_lsu_lsc_ctl.scala 230:71]
    node _T_38 = and(_T_37, io.lsu_pkt_m.valid) @[el2_lsu_lsc_ctl.scala 230:100]
    node _T_39 = eq(io.lsu_pkt_m.dma, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 230:123]
    node _T_40 = and(_T_38, _T_39) @[el2_lsu_lsc_ctl.scala 230:121]
    node _T_41 = eq(io.lsu_pkt_m.fast_int, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 230:143]
    node _T_42 = and(_T_40, _T_41) @[el2_lsu_lsc_ctl.scala 230:141]
    node _T_43 = eq(io.flush_m_up, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 230:168]
    node _T_44 = and(_T_42, _T_43) @[el2_lsu_lsc_ctl.scala 230:166]
    lsu_error_pkt_m.exc_valid <= _T_44 @[el2_lsu_lsc_ctl.scala 230:31]
    node _T_45 = eq(lsu_error_pkt_m.exc_valid, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 231:70]
    node _T_46 = and(io.lsu_single_ecc_error_m, _T_45) @[el2_lsu_lsc_ctl.scala 231:68]
    node _T_47 = eq(io.lsu_pkt_m.dma, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 231:100]
    node _T_48 = and(_T_46, _T_47) @[el2_lsu_lsc_ctl.scala 231:98]
    lsu_error_pkt_m.single_ecc_error <= _T_48 @[el2_lsu_lsc_ctl.scala 231:38]
    lsu_error_pkt_m.inst_type <= io.lsu_pkt_m.store @[el2_lsu_lsc_ctl.scala 232:38]
    node _T_49 = not(misaligned_fault_m) @[el2_lsu_lsc_ctl.scala 233:41]
    lsu_error_pkt_m.exc_type <= _T_49 @[el2_lsu_lsc_ctl.scala 233:38]
    node _T_50 = eq(misaligned_fault_m, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 234:74]
    node _T_51 = and(io.lsu_double_ecc_error_m, _T_50) @[el2_lsu_lsc_ctl.scala 234:72]
    node _T_52 = eq(access_fault_m, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 234:96]
    node _T_53 = and(_T_51, _T_52) @[el2_lsu_lsc_ctl.scala 234:94]
    node _T_54 = bits(_T_53, 0, 0) @[el2_lsu_lsc_ctl.scala 234:113]
    node _T_55 = bits(exc_mscause_m, 3, 0) @[el2_lsu_lsc_ctl.scala 234:144]
    node _T_56 = mux(_T_54, UInt<1>("h01"), _T_55) @[el2_lsu_lsc_ctl.scala 234:44]
    lsu_error_pkt_m.mscause <= _T_56 @[el2_lsu_lsc_ctl.scala 234:38]
    node _T_57 = bits(io.lsu_addr_m, 31, 0) @[el2_lsu_lsc_ctl.scala 235:54]
    lsu_error_pkt_m.addr <= _T_57 @[el2_lsu_lsc_ctl.scala 235:38]
    node _T_58 = bits(fir_nondccm_access_error_m, 0, 0) @[el2_lsu_lsc_ctl.scala 236:72]
    node _T_59 = bits(fir_dccm_access_error_m, 0, 0) @[el2_lsu_lsc_ctl.scala 236:116]
    node _T_60 = and(io.lsu_pkt_m.fast_int, io.lsu_double_ecc_error_m) @[el2_lsu_lsc_ctl.scala 236:159]
    node _T_61 = bits(_T_60, 0, 0) @[el2_lsu_lsc_ctl.scala 236:188]
    node _T_62 = mux(_T_61, UInt<1>("h01"), UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 236:135]
    node _T_63 = mux(_T_59, UInt<2>("h02"), _T_62) @[el2_lsu_lsc_ctl.scala 236:91]
    node _T_64 = mux(_T_58, UInt<2>("h03"), _T_63) @[el2_lsu_lsc_ctl.scala 236:44]
    lsu_fir_error_m <= _T_64 @[el2_lsu_lsc_ctl.scala 236:38]
    reg _T_65 : {exc_valid : UInt<1>, single_ecc_error : UInt<1>, inst_type : UInt<1>, exc_type : UInt<1>, mscause : UInt<4>, addr : UInt<32>}, clock @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.addr <= lsu_error_pkt_m.addr @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.mscause <= lsu_error_pkt_m.mscause @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.exc_type <= lsu_error_pkt_m.exc_type @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.inst_type <= lsu_error_pkt_m.inst_type @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.single_ecc_error <= lsu_error_pkt_m.single_ecc_error @[el2_lsu_lsc_ctl.scala 241:34]
    _T_65.exc_valid <= lsu_error_pkt_m.exc_valid @[el2_lsu_lsc_ctl.scala 241:34]
    io.lsu_error_pkt_r.addr <= _T_65.addr @[el2_lsu_lsc_ctl.scala 241:24]
    io.lsu_error_pkt_r.mscause <= _T_65.mscause @[el2_lsu_lsc_ctl.scala 241:24]
    io.lsu_error_pkt_r.exc_type <= _T_65.exc_type @[el2_lsu_lsc_ctl.scala 241:24]
    io.lsu_error_pkt_r.inst_type <= _T_65.inst_type @[el2_lsu_lsc_ctl.scala 241:24]
    io.lsu_error_pkt_r.single_ecc_error <= _T_65.single_ecc_error @[el2_lsu_lsc_ctl.scala 241:24]
    io.lsu_error_pkt_r.exc_valid <= _T_65.exc_valid @[el2_lsu_lsc_ctl.scala 241:24]
    lsu_fir_error_rff.io.din <= lsu_fir_error_m @[el2_lsu_lsc_ctl.scala 243:41]
    lsu_fir_error_m <= lsu_fir_error_rff.io.dout @[el2_lsu_lsc_ctl.scala 244:41]
    access_fault_mff.io.din <= addrcheck.io.access_fault_d @[el2_lsu_lsc_ctl.scala 246:40]
    access_fault_m <= access_fault_mff.io.dout @[el2_lsu_lsc_ctl.scala 247:40]
    misaligned_fault_mff.io.din <= addrcheck.io.misaligned_fault_d @[el2_lsu_lsc_ctl.scala 249:40]
    misaligned_fault_m <= misaligned_fault_mff.io.dout @[el2_lsu_lsc_ctl.scala 250:40]
    exc_mscause_mff.io.din <= addrcheck.io.exc_mscause_d @[el2_lsu_lsc_ctl.scala 252:40]
    exc_mscause_m <= exc_mscause_mff.io.dout @[el2_lsu_lsc_ctl.scala 253:40]
    reg _T_66 : UInt, clock @[el2_lsu_lsc_ctl.scala 257:52]
    _T_66 <= addrcheck.io.fir_dccm_access_error_d @[el2_lsu_lsc_ctl.scala 257:52]
    fir_dccm_access_error_m <= _T_66 @[el2_lsu_lsc_ctl.scala 257:42]
    reg _T_67 : UInt, clock @[el2_lsu_lsc_ctl.scala 260:54]
    _T_67 <= addrcheck.io.fir_nondccm_access_error_d @[el2_lsu_lsc_ctl.scala 260:54]
    fir_nondccm_access_error_m <= _T_67 @[el2_lsu_lsc_ctl.scala 260:44]
    dma_pkt_d.unsign <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 263:22]
    dma_pkt_d.fast_int <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 264:22]
    dma_pkt_d.valid <= io.dma_dccm_req @[el2_lsu_lsc_ctl.scala 265:22]
    dma_pkt_d.dma <= UInt<1>("h01") @[el2_lsu_lsc_ctl.scala 266:22]
    dma_pkt_d.store <= io.dma_mem_write @[el2_lsu_lsc_ctl.scala 267:22]
    node _T_68 = not(io.dma_mem_write) @[el2_lsu_lsc_ctl.scala 268:25]
    dma_pkt_d.load <= _T_68 @[el2_lsu_lsc_ctl.scala 268:22]
    node _T_69 = bits(io.dma_mem_sz, 2, 0) @[el2_lsu_lsc_ctl.scala 269:39]
    node _T_70 = eq(_T_69, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 269:45]
    dma_pkt_d.by <= _T_70 @[el2_lsu_lsc_ctl.scala 269:22]
    node _T_71 = bits(io.dma_mem_sz, 2, 0) @[el2_lsu_lsc_ctl.scala 270:39]
    node _T_72 = eq(_T_71, UInt<1>("h01")) @[el2_lsu_lsc_ctl.scala 270:45]
    dma_pkt_d.half <= _T_72 @[el2_lsu_lsc_ctl.scala 270:22]
    node _T_73 = bits(io.dma_mem_sz, 2, 0) @[el2_lsu_lsc_ctl.scala 271:39]
    node _T_74 = eq(_T_73, UInt<2>("h02")) @[el2_lsu_lsc_ctl.scala 271:45]
    dma_pkt_d.word <= _T_74 @[el2_lsu_lsc_ctl.scala 271:22]
    node _T_75 = bits(io.dma_mem_sz, 2, 0) @[el2_lsu_lsc_ctl.scala 272:39]
    node _T_76 = eq(_T_75, UInt<2>("h03")) @[el2_lsu_lsc_ctl.scala 272:45]
    dma_pkt_d.dword <= _T_76 @[el2_lsu_lsc_ctl.scala 272:22]
    dma_pkt_d.store_data_bypass_d <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 273:34]
    dma_pkt_d.load_ldst_bypass_d <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 274:34]
    dma_pkt_d.store_data_bypass_m <= UInt<1>("h00") @[el2_lsu_lsc_ctl.scala 275:34]
    inst lsu_pkt_vldmff of rvdff_4 @[el2_lsu_lsc_ctl.scala 278:36]
    lsu_pkt_vldmff.clock <= clock
    lsu_pkt_vldmff.reset <= reset
    inst lsu_pkt_vldrff of rvdff_5 @[el2_lsu_lsc_ctl.scala 279:36]
    lsu_pkt_vldrff.clock <= clock
    lsu_pkt_vldrff.reset <= reset
    wire lsu_ld_datafn_r : UInt<32>
    lsu_ld_datafn_r <= UInt<32>("h00")
    wire lsu_ld_datafn_corr_r : UInt<32>
    lsu_ld_datafn_corr_r <= UInt<32>("h00")
    wire lsu_ld_datafn_m : UInt<32>
    lsu_ld_datafn_m <= UInt<32>("h00")
    node _T_77 = bits(io.dec_lsu_valid_raw_d, 0, 0) @[el2_lsu_lsc_ctl.scala 285:50]
    node _T_78 = mux(_T_77, io.lsu_p, dma_pkt_d) @[el2_lsu_lsc_ctl.scala 285:26]
    io.lsu_pkt_d.valid <= _T_78.valid @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.store_data_bypass_m <= _T_78.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.load_ldst_bypass_d <= _T_78.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.store_data_bypass_d <= _T_78.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.dma <= _T_78.dma @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.unsign <= _T_78.unsign @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.store <= _T_78.store @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.load <= _T_78.load @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.dword <= _T_78.dword @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.word <= _T_78.word @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.half <= _T_78.half @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.by <= _T_78.by @[el2_lsu_lsc_ctl.scala 285:20]
    io.lsu_pkt_d.fast_int <= _T_78.fast_int @[el2_lsu_lsc_ctl.scala 285:20]
    lsu_pkt_m_in.valid <= io.lsu_pkt_d.valid @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.store_data_bypass_m <= io.lsu_pkt_d.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.load_ldst_bypass_d <= io.lsu_pkt_d.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.store_data_bypass_d <= io.lsu_pkt_d.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.dma <= io.lsu_pkt_d.dma @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.unsign <= io.lsu_pkt_d.unsign @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.store <= io.lsu_pkt_d.store @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.load <= io.lsu_pkt_d.load @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.dword <= io.lsu_pkt_d.dword @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.word <= io.lsu_pkt_d.word @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.half <= io.lsu_pkt_d.half @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.by <= io.lsu_pkt_d.by @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_m_in.fast_int <= io.lsu_pkt_d.fast_int @[el2_lsu_lsc_ctl.scala 286:20]
    lsu_pkt_r_in.valid <= io.lsu_pkt_m.valid @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.store_data_bypass_m <= io.lsu_pkt_m.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.load_ldst_bypass_d <= io.lsu_pkt_m.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.store_data_bypass_d <= io.lsu_pkt_m.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.dma <= io.lsu_pkt_m.dma @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.unsign <= io.lsu_pkt_m.unsign @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.store <= io.lsu_pkt_m.store @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.load <= io.lsu_pkt_m.load @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.dword <= io.lsu_pkt_m.dword @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.word <= io.lsu_pkt_m.word @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.half <= io.lsu_pkt_m.half @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.by <= io.lsu_pkt_m.by @[el2_lsu_lsc_ctl.scala 287:20]
    lsu_pkt_r_in.fast_int <= io.lsu_pkt_m.fast_int @[el2_lsu_lsc_ctl.scala 287:20]
    node _T_79 = eq(io.lsu_p.fast_int, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 289:64]
    node _T_80 = and(io.flush_m_up, _T_79) @[el2_lsu_lsc_ctl.scala 289:61]
    node _T_81 = eq(_T_80, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 289:45]
    node _T_82 = and(io.lsu_p.valid, _T_81) @[el2_lsu_lsc_ctl.scala 289:43]
    node _T_83 = or(_T_82, io.dma_dccm_req) @[el2_lsu_lsc_ctl.scala 289:85]
    io.lsu_pkt_d.valid <= _T_83 @[el2_lsu_lsc_ctl.scala 289:24]
    node _T_84 = eq(io.lsu_pkt_d.dma, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 290:68]
    node _T_85 = and(io.flush_m_up, _T_84) @[el2_lsu_lsc_ctl.scala 290:65]
    node _T_86 = eq(_T_85, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 290:49]
    node _T_87 = and(io.lsu_pkt_d.valid, _T_86) @[el2_lsu_lsc_ctl.scala 290:47]
    lsu_pkt_m_in.valid <= _T_87 @[el2_lsu_lsc_ctl.scala 290:24]
    node _T_88 = eq(io.lsu_pkt_m.dma, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 291:68]
    node _T_89 = and(io.flush_m_up, _T_88) @[el2_lsu_lsc_ctl.scala 291:65]
    node _T_90 = eq(_T_89, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 291:49]
    node _T_91 = and(io.lsu_pkt_m.valid, _T_90) @[el2_lsu_lsc_ctl.scala 291:47]
    lsu_pkt_r_in.valid <= _T_91 @[el2_lsu_lsc_ctl.scala 291:24]
    lsu_pkt_vldmff.io.din <= lsu_pkt_m_in.valid @[el2_lsu_lsc_ctl.scala 295:34]
    io.lsu_pkt_m.valid <= lsu_pkt_vldmff.io.dout @[el2_lsu_lsc_ctl.scala 296:34]
    lsu_pkt_vldrff.io.din <= lsu_pkt_r_in.valid @[el2_lsu_lsc_ctl.scala 299:33]
    io.lsu_pkt_r.valid <= lsu_pkt_vldrff.io.dout @[el2_lsu_lsc_ctl.scala 300:33]
    reg _T_92 : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, clock @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.valid <= lsu_pkt_m_in.valid @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.store_data_bypass_m <= lsu_pkt_m_in.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.load_ldst_bypass_d <= lsu_pkt_m_in.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.store_data_bypass_d <= lsu_pkt_m_in.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.dma <= lsu_pkt_m_in.dma @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.unsign <= lsu_pkt_m_in.unsign @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.store <= lsu_pkt_m_in.store @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.load <= lsu_pkt_m_in.load @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.dword <= lsu_pkt_m_in.dword @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.word <= lsu_pkt_m_in.word @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.half <= lsu_pkt_m_in.half @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.by <= lsu_pkt_m_in.by @[el2_lsu_lsc_ctl.scala 305:26]
    _T_92.fast_int <= lsu_pkt_m_in.fast_int @[el2_lsu_lsc_ctl.scala 305:26]
    io.lsu_pkt_m.valid <= _T_92.valid @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.store_data_bypass_m <= _T_92.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.load_ldst_bypass_d <= _T_92.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.store_data_bypass_d <= _T_92.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.dma <= _T_92.dma @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.unsign <= _T_92.unsign @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.store <= _T_92.store @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.load <= _T_92.load @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.dword <= _T_92.dword @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.word <= _T_92.word @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.half <= _T_92.half @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.by <= _T_92.by @[el2_lsu_lsc_ctl.scala 305:16]
    io.lsu_pkt_m.fast_int <= _T_92.fast_int @[el2_lsu_lsc_ctl.scala 305:16]
    reg _T_93 : {fast_int : UInt<1>, by : UInt<1>, half : UInt<1>, word : UInt<1>, dword : UInt<1>, load : UInt<1>, store : UInt<1>, unsign : UInt<1>, dma : UInt<1>, store_data_bypass_d : UInt<1>, load_ldst_bypass_d : UInt<1>, store_data_bypass_m : UInt<1>, valid : UInt<1>}, clock @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.valid <= lsu_pkt_r_in.valid @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.store_data_bypass_m <= lsu_pkt_r_in.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.load_ldst_bypass_d <= lsu_pkt_r_in.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.store_data_bypass_d <= lsu_pkt_r_in.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.dma <= lsu_pkt_r_in.dma @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.unsign <= lsu_pkt_r_in.unsign @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.store <= lsu_pkt_r_in.store @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.load <= lsu_pkt_r_in.load @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.dword <= lsu_pkt_r_in.dword @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.word <= lsu_pkt_r_in.word @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.half <= lsu_pkt_r_in.half @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.by <= lsu_pkt_r_in.by @[el2_lsu_lsc_ctl.scala 310:26]
    _T_93.fast_int <= lsu_pkt_r_in.fast_int @[el2_lsu_lsc_ctl.scala 310:26]
    io.lsu_pkt_r.valid <= _T_93.valid @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.store_data_bypass_m <= _T_93.store_data_bypass_m @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.load_ldst_bypass_d <= _T_93.load_ldst_bypass_d @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.store_data_bypass_d <= _T_93.store_data_bypass_d @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.dma <= _T_93.dma @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.unsign <= _T_93.unsign @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.store <= _T_93.store @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.load <= _T_93.load @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.dword <= _T_93.dword @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.word <= _T_93.word @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.half <= _T_93.half @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.by <= _T_93.by @[el2_lsu_lsc_ctl.scala 310:16]
    io.lsu_pkt_r.fast_int <= _T_93.fast_int @[el2_lsu_lsc_ctl.scala 310:16]
    node _T_94 = bits(io.dma_mem_wdata, 63, 0) @[el2_lsu_lsc_ctl.scala 326:47]
    node _T_95 = bits(io.dma_mem_addr, 2, 0) @[el2_lsu_lsc_ctl.scala 326:76]
    node _T_96 = cat(_T_95, UInt<1>("h00")) @[Cat.scala 29:58]
    node dma_mem_wdata_shifted = dshr(_T_94, _T_96) @[el2_lsu_lsc_ctl.scala 326:54]
    node _T_97 = bits(io.dma_dccm_req, 0, 0) @[el2_lsu_lsc_ctl.scala 328:51]
    node _T_98 = bits(dma_mem_wdata_shifted, 31, 0) @[el2_lsu_lsc_ctl.scala 328:79]
    node _T_99 = bits(io.exu_lsu_rs2_d, 31, 0) @[el2_lsu_lsc_ctl.scala 328:102]
    node store_data_d = mux(_T_97, _T_98, _T_99) @[el2_lsu_lsc_ctl.scala 328:34]
    node _T_100 = bits(io.lsu_pkt_d.store_data_bypass_d, 0, 0) @[el2_lsu_lsc_ctl.scala 330:68]
    node _T_101 = bits(io.lsu_result_m, 31, 0) @[el2_lsu_lsc_ctl.scala 330:90]
    node _T_102 = bits(store_data_d, 31, 0) @[el2_lsu_lsc_ctl.scala 330:109]
    node store_data_m_in = mux(_T_100, _T_101, _T_102) @[el2_lsu_lsc_ctl.scala 330:34]
    inst sdmff of rvdff_6 @[el2_lsu_lsc_ctl.scala 333:20]
    sdmff.clock <= clock
    sdmff.reset <= reset
    sdmff.io.din <= store_data_m_in @[el2_lsu_lsc_ctl.scala 334:27]
    inst samff of rvdff_7 @[el2_lsu_lsc_ctl.scala 337:20]
    samff.clock <= clock
    samff.reset <= reset
    samff.io.din <= io.lsu_addr_d @[el2_lsu_lsc_ctl.scala 338:23]
    io.lsu_addr_m <= samff.io.dout @[el2_lsu_lsc_ctl.scala 339:26]
    inst sarff of rvdff_8 @[el2_lsu_lsc_ctl.scala 341:20]
    sarff.clock <= clock
    sarff.reset <= reset
    sarff.io.din <= io.lsu_addr_m @[el2_lsu_lsc_ctl.scala 342:23]
    io.lsu_addr_r <= sarff.io.dout @[el2_lsu_lsc_ctl.scala 343:23]
    inst end_addr_mff of rvdff_9 @[el2_lsu_lsc_ctl.scala 345:28]
    end_addr_mff.clock <= clock
    end_addr_mff.reset <= reset
    end_addr_mff.io.din <= io.end_addr_d @[el2_lsu_lsc_ctl.scala 346:26]
    io.end_addr_m <= end_addr_mff.io.dout @[el2_lsu_lsc_ctl.scala 347:26]
    inst end_addr_rff of rvdff_10 @[el2_lsu_lsc_ctl.scala 349:28]
    end_addr_rff.clock <= clock
    end_addr_rff.reset <= reset
    end_addr_rff.io.din <= io.end_addr_m @[el2_lsu_lsc_ctl.scala 350:26]
    io.end_addr_r <= end_addr_rff.io.dout @[el2_lsu_lsc_ctl.scala 351:26]
    inst addr_in_dccm_mff of rvdff_11 @[el2_lsu_lsc_ctl.scala 353:36]
    addr_in_dccm_mff.clock <= clock
    addr_in_dccm_mff.reset <= reset
    addr_in_dccm_mff.io.din <= io.addr_in_dccm_d @[el2_lsu_lsc_ctl.scala 354:27]
    io.addr_in_dccm_m <= addr_in_dccm_mff.io.dout @[el2_lsu_lsc_ctl.scala 355:27]
    inst addr_in_dccm_rff of rvdff_12 @[el2_lsu_lsc_ctl.scala 357:37]
    addr_in_dccm_rff.clock <= clock
    addr_in_dccm_rff.reset <= reset
    addr_in_dccm_rff.io.din <= io.addr_in_dccm_m @[el2_lsu_lsc_ctl.scala 358:28]
    io.addr_in_dccm_r <= addr_in_dccm_rff.io.dout @[el2_lsu_lsc_ctl.scala 359:28]
    inst addr_in_pic_mff of rvdff_13 @[el2_lsu_lsc_ctl.scala 361:37]
    addr_in_pic_mff.clock <= clock
    addr_in_pic_mff.reset <= reset
    addr_in_pic_mff.io.din <= io.addr_in_pic_d @[el2_lsu_lsc_ctl.scala 362:27]
    io.addr_in_pic_m <= addr_in_pic_mff.io.dout @[el2_lsu_lsc_ctl.scala 363:27]
    inst addr_in_pic_rff of rvdff_14 @[el2_lsu_lsc_ctl.scala 365:37]
    addr_in_pic_rff.clock <= clock
    addr_in_pic_rff.reset <= reset
    addr_in_pic_rff.io.din <= io.addr_in_pic_m @[el2_lsu_lsc_ctl.scala 366:27]
    io.addr_in_pic_r <= addr_in_pic_rff.io.dout @[el2_lsu_lsc_ctl.scala 367:27]
    inst addr_external_mff of rvdff_15 @[el2_lsu_lsc_ctl.scala 369:37]
    addr_external_mff.clock <= clock
    addr_external_mff.reset <= reset
    addr_external_mff.io.din <= addrcheck.io.addr_external_d @[el2_lsu_lsc_ctl.scala 370:28]
    io.addr_external_m <= addr_external_mff.io.dout @[el2_lsu_lsc_ctl.scala 371:28]
    inst addr_external_rff of rvdff_16 @[el2_lsu_lsc_ctl.scala 373:37]
    addr_external_rff.clock <= clock
    addr_external_rff.reset <= reset
    addr_external_rff.io.din <= io.addr_external_m @[el2_lsu_lsc_ctl.scala 374:28]
    inst bus_read_data_r_ff of rvdff_17 @[el2_lsu_lsc_ctl.scala 377:38]
    bus_read_data_r_ff.clock <= clock
    bus_read_data_r_ff.reset <= reset
    bus_read_data_r_ff.io.din <= io.bus_read_data_m @[el2_lsu_lsc_ctl.scala 378:29]
    node _T_103 = bits(io.lsu_ld_data_corr_r, 31, 0) @[el2_lsu_lsc_ctl.scala 384:52]
    io.lsu_fir_addr <= _T_103 @[el2_lsu_lsc_ctl.scala 384:28]
    io.lsu_addr_d <= lsadder.io.dout @[el2_lsu_lsc_ctl.scala 387:28]
    node _T_104 = or(io.lsu_pkt_r.store, io.lsu_pkt_r.load) @[el2_lsu_lsc_ctl.scala 391:63]
    node _T_105 = and(io.lsu_pkt_r.valid, _T_104) @[el2_lsu_lsc_ctl.scala 391:41]
    node _T_106 = eq(io.flush_r, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 391:86]
    node _T_107 = and(_T_105, _T_106) @[el2_lsu_lsc_ctl.scala 391:84]
    node _T_108 = eq(io.lsu_pkt_r.dma, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 391:100]
    node _T_109 = and(_T_107, _T_108) @[el2_lsu_lsc_ctl.scala 391:98]
    io.lsu_commit_r <= _T_109 @[el2_lsu_lsc_ctl.scala 391:19]
    node _T_110 = bits(io.picm_mask_data_m, 31, 0) @[el2_lsu_lsc_ctl.scala 394:52]
    node _T_111 = eq(io.addr_in_pic_m, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 394:69]
    node _T_112 = bits(_T_111, 0, 0) @[Bitwise.scala 72:15]
    node _T_113 = mux(_T_112, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_114 = or(_T_110, _T_113) @[el2_lsu_lsc_ctl.scala 394:59]
    node _T_115 = bits(io.lsu_pkt_m.store_data_bypass_m, 0, 0) @[el2_lsu_lsc_ctl.scala 394:128]
    node _T_116 = mux(_T_115, io.lsu_result_m, sdmff.io.dout) @[el2_lsu_lsc_ctl.scala 394:94]
    node _T_117 = and(_T_114, _T_116) @[el2_lsu_lsc_ctl.scala 394:89]
    io.store_data_m <= _T_117 @[el2_lsu_lsc_ctl.scala 394:29]
    node _T_118 = bits(io.addr_external_m, 0, 0) @[el2_lsu_lsc_ctl.scala 425:53]
    node _T_119 = mux(_T_118, io.bus_read_data_m, io.lsu_ld_data_m) @[el2_lsu_lsc_ctl.scala 425:33]
    lsu_ld_datafn_m <= _T_119 @[el2_lsu_lsc_ctl.scala 425:27]
    node _T_120 = bits(addr_external_rff.io.dout, 0, 0) @[el2_lsu_lsc_ctl.scala 426:50]
    node _T_121 = mux(_T_120, bus_read_data_r_ff.io.dout, io.lsu_ld_data_corr_r) @[el2_lsu_lsc_ctl.scala 426:33]
    lsu_ld_datafn_corr_r <= _T_121 @[el2_lsu_lsc_ctl.scala 426:27]
    node _T_122 = and(io.lsu_pkt_r.unsign, io.lsu_pkt_r.by) @[el2_lsu_lsc_ctl.scala 429:61]
    node _T_123 = bits(_T_122, 0, 0) @[Bitwise.scala 72:15]
    node _T_124 = mux(_T_123, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_125 = bits(lsu_ld_datafn_m, 7, 0) @[el2_lsu_lsc_ctl.scala 429:117]
    node _T_126 = cat(UInt<1>("h00"), _T_125) @[Cat.scala 29:58]
    node _T_127 = and(_T_124, _T_126) @[el2_lsu_lsc_ctl.scala 429:84]
    node _T_128 = and(io.lsu_pkt_r.unsign, io.lsu_pkt_r.half) @[el2_lsu_lsc_ctl.scala 430:38]
    node _T_129 = bits(_T_128, 0, 0) @[Bitwise.scala 72:15]
    node _T_130 = mux(_T_129, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_131 = bits(lsu_ld_datafn_m, 15, 0) @[el2_lsu_lsc_ctl.scala 430:92]
    node _T_132 = cat(UInt<1>("h00"), _T_131) @[Cat.scala 29:58]
    node _T_133 = and(_T_130, _T_132) @[el2_lsu_lsc_ctl.scala 430:61]
    node _T_134 = or(_T_127, _T_133) @[el2_lsu_lsc_ctl.scala 429:125]
    node _T_135 = eq(io.lsu_pkt_r.unsign, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 431:17]
    node _T_136 = and(_T_135, io.lsu_pkt_r.by) @[el2_lsu_lsc_ctl.scala 431:38]
    node _T_137 = bits(_T_136, 0, 0) @[Bitwise.scala 72:15]
    node _T_138 = mux(_T_137, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_139 = bits(lsu_ld_datafn_m, 7, 7) @[el2_lsu_lsc_ctl.scala 431:92]
    node _T_140 = bits(_T_139, 0, 0) @[Bitwise.scala 72:15]
    node _T_141 = mux(_T_140, UInt<24>("h0ffffff"), UInt<24>("h00")) @[Bitwise.scala 72:12]
    node _T_142 = bits(lsu_ld_datafn_m, 7, 0) @[el2_lsu_lsc_ctl.scala 431:115]
    node _T_143 = cat(_T_141, _T_142) @[Cat.scala 29:58]
    node _T_144 = and(_T_138, _T_143) @[el2_lsu_lsc_ctl.scala 431:61]
    node _T_145 = or(_T_134, _T_144) @[el2_lsu_lsc_ctl.scala 430:104]
    node _T_146 = eq(io.lsu_pkt_r.unsign, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 432:17]
    node _T_147 = and(_T_146, io.lsu_pkt_r.half) @[el2_lsu_lsc_ctl.scala 432:38]
    node _T_148 = bits(_T_147, 0, 0) @[Bitwise.scala 72:15]
    node _T_149 = mux(_T_148, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_150 = bits(lsu_ld_datafn_m, 15, 15) @[el2_lsu_lsc_ctl.scala 432:91]
    node _T_151 = bits(_T_150, 0, 0) @[Bitwise.scala 72:15]
    node _T_152 = mux(_T_151, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _T_153 = bits(lsu_ld_datafn_m, 15, 0) @[el2_lsu_lsc_ctl.scala 432:115]
    node _T_154 = cat(_T_152, _T_153) @[Cat.scala 29:58]
    node _T_155 = and(_T_149, _T_154) @[el2_lsu_lsc_ctl.scala 432:61]
    node _T_156 = or(_T_145, _T_155) @[el2_lsu_lsc_ctl.scala 431:124]
    node _T_157 = bits(io.lsu_pkt_r.word, 0, 0) @[Bitwise.scala 72:15]
    node _T_158 = mux(_T_157, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_159 = bits(lsu_ld_datafn_m, 31, 0) @[el2_lsu_lsc_ctl.scala 433:55]
    node _T_160 = and(_T_158, _T_159) @[el2_lsu_lsc_ctl.scala 433:38]
    node _T_161 = or(_T_156, _T_160) @[el2_lsu_lsc_ctl.scala 432:124]
    io.lsu_result_m <= _T_161 @[el2_lsu_lsc_ctl.scala 429:27]
    node _T_162 = and(io.lsu_pkt_r.unsign, io.lsu_pkt_r.by) @[el2_lsu_lsc_ctl.scala 436:61]
    node _T_163 = bits(_T_162, 0, 0) @[Bitwise.scala 72:15]
    node _T_164 = mux(_T_163, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_165 = bits(lsu_ld_datafn_corr_r, 7, 0) @[el2_lsu_lsc_ctl.scala 436:122]
    node _T_166 = cat(UInt<1>("h00"), _T_165) @[Cat.scala 29:58]
    node _T_167 = and(_T_164, _T_166) @[el2_lsu_lsc_ctl.scala 436:84]
    node _T_168 = and(io.lsu_pkt_r.unsign, io.lsu_pkt_r.half) @[el2_lsu_lsc_ctl.scala 437:38]
    node _T_169 = bits(_T_168, 0, 0) @[Bitwise.scala 72:15]
    node _T_170 = mux(_T_169, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_171 = bits(lsu_ld_datafn_corr_r, 15, 0) @[el2_lsu_lsc_ctl.scala 437:97]
    node _T_172 = cat(UInt<1>("h00"), _T_171) @[Cat.scala 29:58]
    node _T_173 = and(_T_170, _T_172) @[el2_lsu_lsc_ctl.scala 437:61]
    node _T_174 = or(_T_167, _T_173) @[el2_lsu_lsc_ctl.scala 436:130]
    node _T_175 = eq(io.lsu_pkt_r.unsign, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 438:17]
    node _T_176 = and(_T_175, io.lsu_pkt_r.by) @[el2_lsu_lsc_ctl.scala 438:38]
    node _T_177 = bits(_T_176, 0, 0) @[Bitwise.scala 72:15]
    node _T_178 = mux(_T_177, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_179 = bits(lsu_ld_datafn_corr_r, 7, 7) @[el2_lsu_lsc_ctl.scala 438:97]
    node _T_180 = bits(_T_179, 0, 0) @[Bitwise.scala 72:15]
    node _T_181 = mux(_T_180, UInt<24>("h0ffffff"), UInt<24>("h00")) @[Bitwise.scala 72:12]
    node _T_182 = bits(lsu_ld_datafn_corr_r, 7, 0) @[el2_lsu_lsc_ctl.scala 438:125]
    node _T_183 = cat(_T_181, _T_182) @[Cat.scala 29:58]
    node _T_184 = and(_T_178, _T_183) @[el2_lsu_lsc_ctl.scala 438:61]
    node _T_185 = or(_T_174, _T_184) @[el2_lsu_lsc_ctl.scala 437:109]
    node _T_186 = eq(io.lsu_pkt_r.unsign, UInt<1>("h00")) @[el2_lsu_lsc_ctl.scala 439:17]
    node _T_187 = and(_T_186, io.lsu_pkt_r.half) @[el2_lsu_lsc_ctl.scala 439:38]
    node _T_188 = bits(_T_187, 0, 0) @[Bitwise.scala 72:15]
    node _T_189 = mux(_T_188, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_190 = bits(lsu_ld_datafn_corr_r, 15, 15) @[el2_lsu_lsc_ctl.scala 439:96]
    node _T_191 = bits(_T_190, 0, 0) @[Bitwise.scala 72:15]
    node _T_192 = mux(_T_191, UInt<16>("h0ffff"), UInt<16>("h00")) @[Bitwise.scala 72:12]
    node _T_193 = bits(lsu_ld_datafn_corr_r, 15, 0) @[el2_lsu_lsc_ctl.scala 439:125]
    node _T_194 = cat(_T_192, _T_193) @[Cat.scala 29:58]
    node _T_195 = and(_T_189, _T_194) @[el2_lsu_lsc_ctl.scala 439:61]
    node _T_196 = or(_T_185, _T_195) @[el2_lsu_lsc_ctl.scala 438:134]
    node _T_197 = bits(io.lsu_pkt_r.word, 0, 0) @[Bitwise.scala 72:15]
    node _T_198 = mux(_T_197, UInt<32>("h0ffffffff"), UInt<32>("h00")) @[Bitwise.scala 72:12]
    node _T_199 = bits(lsu_ld_datafn_corr_r, 31, 0) @[el2_lsu_lsc_ctl.scala 440:60]
    node _T_200 = and(_T_198, _T_199) @[el2_lsu_lsc_ctl.scala 440:38]
    node _T_201 = or(_T_196, _T_200) @[el2_lsu_lsc_ctl.scala 439:134]
    io.lsu_result_corr_r <= _T_201 @[el2_lsu_lsc_ctl.scala 436:27]
    
