;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit el2_ifu_bp_ctl : 
  module el2_ifu_bp_ctl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clk : UInt<1>, flip active_clk : UInt<1>, flip rst_l : UInt<1>, flip ic_hit_f : UInt<1>, flip ifc_fetch_addr_f : UInt<32>, flip ifc_fetch_req_f : UInt<1>, flip dec_tlu_br0_r_pkt : {valid : UInt<1>, hist : UInt<2>, br_error : UInt<1>, br_start_error : UInt<1>, way : UInt<1>, middle : UInt<1>}, flip exu_i0_br_fghr_r : UInt<8>, flip exu_i0_br_index_r : UInt<7>, flip dec_tlu_flush_lower_wb : UInt<1>, flip dec_tlu_flush_leak_one_wb : UInt<1>, flip dec_tlu_bpred_disable : UInt<1>, flip exu_mp_pkt : {misp : UInt<1>, ataken : UInt<1>, boffset : UInt<1>, pc4 : UInt<1>, hist : UInt<2>, toffset : UInt<12>, valid : UInt<1>, br_error : UInt<1>, br_start_error : UInt<1>, prett : UInt<32>, pcall : UInt<1>, pret : UInt<1>, pja : UInt<1>, way : UInt<1>}, flip exu_mp_eghr : UInt<8>, flip exu_mp_fghr : UInt<8>, flip exu_mp_index : UInt<7>, flip exu_mp_btag : UInt<5>, flip exu_flush_final : UInt<1>, ifu_bp_hit_taken_f : UInt<1>, ifu_bp_btb_target_f : UInt<31>, ifu_bp_inst_mask_f : UInt<1>, ifu_bp_fghr_f : UInt<8>, ifu_bp_way_f : UInt<2>, ifu_bp_ret_f : UInt<2>, ifu_bp_hist1_f : UInt<2>, ifu_bp_hist0_f : UInt<2>, ifu_bp_pc4_f : UInt<2>, ifu_bp_valid_f : UInt<2>, ifu_bp_poffset_f : UInt<12>}
    
    io.ifu_bp_hit_taken_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 42:25]
    io.ifu_bp_btb_target_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 43:26]
    io.ifu_bp_inst_mask_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 44:25]
    io.ifu_bp_fghr_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 45:20]
    io.ifu_bp_way_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 46:19]
    io.ifu_bp_ret_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 47:19]
    io.ifu_bp_hist1_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 48:21]
    io.ifu_bp_hist0_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 49:21]
    io.ifu_bp_pc4_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 50:19]
    io.ifu_bp_valid_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 51:21]
    io.ifu_bp_poffset_f <= UInt<1>("h00") @[el2_ifu_bp_ctl.scala 52:23]
    wire leak_one_f : UInt<1>
    leak_one_f <= UInt<1>("h00")
    node _T = not(leak_one_f) @[el2_ifu_bp_ctl.scala 67:43]
    node exu_mp_valid = and(io.exu_mp_pkt.misp, _T) @[el2_ifu_bp_ctl.scala 67:41]
    wire fetch_rd_tag_p1_f : UInt<5>
    fetch_rd_tag_p1_f <= UInt<1>("h00")
    wire fetch_rd_tag_f : UInt<5>
    fetch_rd_tag_f <= UInt<1>("h00")
    wire bht_dir_f : UInt<2>
    bht_dir_f <= UInt<1>("h00")
    wire dec_tlu_error_wb : UInt<1>
    dec_tlu_error_wb <= UInt<1>("h00")
    wire btb_error_addr_wb : UInt<7>
    btb_error_addr_wb <= UInt<1>("h00")
    wire btb_bank0_rd_data_way0_f : UInt<22>
    btb_bank0_rd_data_way0_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way1_f : UInt<22>
    btb_bank0_rd_data_way1_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way0_p1_f : UInt<22>
    btb_bank0_rd_data_way0_p1_f <= UInt<1>("h00")
    wire btb_bank0_rd_data_way1_p1_f : UInt<22>
    btb_bank0_rd_data_way1_p1_f <= UInt<1>("h00")
    wire dec_tlu_way_wb : UInt<1>
    dec_tlu_way_wb <= UInt<1>("h00")
    node _T_1 = bits(io.ifc_fetch_addr_f, 9, 2) @[el2_lib.scala 182:12]
    node _T_2 = bits(io.ifc_fetch_addr_f, 17, 10) @[el2_lib.scala 182:46]
    node _T_3 = xor(_T_1, _T_2) @[el2_lib.scala 182:42]
    node _T_4 = bits(io.ifc_fetch_addr_f, 25, 18) @[el2_lib.scala 182:80]
    node btb_rd_addr_f = xor(_T_3, _T_4) @[el2_lib.scala 182:76]
    node _T_5 = add(io.ifc_fetch_addr_f, UInt<3>("h04")) @[el2_ifu_bp_ctl.scala 103:45]
    node fetch_addr_p1_f = tail(_T_5, 1) @[el2_ifu_bp_ctl.scala 103:45]
    node _T_6 = bits(fetch_addr_p1_f, 9, 2) @[el2_lib.scala 182:12]
    node _T_7 = bits(fetch_addr_p1_f, 17, 10) @[el2_lib.scala 182:46]
    node _T_8 = xor(_T_6, _T_7) @[el2_lib.scala 182:42]
    node _T_9 = bits(fetch_addr_p1_f, 25, 18) @[el2_lib.scala 182:80]
    node btb_rd_addr_p1_f = xor(_T_8, _T_9) @[el2_lib.scala 182:76]
    node _T_10 = bits(bht_dir_f, 0, 0) @[el2_ifu_bp_ctl.scala 108:33]
    node _T_11 = not(_T_10) @[el2_ifu_bp_ctl.scala 108:23]
    node _T_12 = bits(bht_dir_f, 0, 0) @[el2_ifu_bp_ctl.scala 108:46]
    node btb_sel_f = cat(_T_11, _T_12) @[Cat.scala 29:58]
    node _T_13 = bits(io.ifc_fetch_addr_f, 1, 1) @[el2_ifu_bp_ctl.scala 111:46]
    node _T_14 = bits(io.ifc_fetch_addr_f, 1, 1) @[el2_ifu_bp_ctl.scala 111:70]
    node _T_15 = not(_T_14) @[el2_ifu_bp_ctl.scala 111:50]
    node fetch_start_f = cat(_T_13, _T_15) @[Cat.scala 29:58]
    node _T_16 = eq(btb_error_addr_wb, btb_rd_addr_f) @[el2_ifu_bp_ctl.scala 114:72]
    node branch_error_collision_f = and(dec_tlu_error_wb, _T_16) @[el2_ifu_bp_ctl.scala 114:51]
    node _T_17 = eq(btb_error_addr_wb, btb_rd_addr_p1_f) @[el2_ifu_bp_ctl.scala 115:75]
    node branch_error_collision_p1_f = and(dec_tlu_error_wb, _T_17) @[el2_ifu_bp_ctl.scala 115:54]
    node branch_error_bank_conflict_f = and(branch_error_collision_f, dec_tlu_error_wb) @[el2_ifu_bp_ctl.scala 118:63]
    node branch_error_bank_conflict_p1_f = and(branch_error_collision_p1_f, dec_tlu_error_wb) @[el2_ifu_bp_ctl.scala 119:69]
    node _T_18 = eq(io.exu_mp_btag, fetch_rd_tag_f) @[el2_ifu_bp_ctl.scala 122:46]
    node _T_19 = and(_T_18, exu_mp_valid) @[el2_ifu_bp_ctl.scala 122:66]
    node _T_20 = and(_T_19, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 122:81]
    node _T_21 = eq(io.exu_mp_index, btb_rd_addr_f) @[el2_ifu_bp_ctl.scala 122:117]
    node fetch_mp_collision_f = and(_T_20, _T_21) @[el2_ifu_bp_ctl.scala 122:102]
    node _T_22 = eq(io.exu_mp_btag, fetch_rd_tag_p1_f) @[el2_ifu_bp_ctl.scala 123:49]
    node _T_23 = and(_T_22, exu_mp_valid) @[el2_ifu_bp_ctl.scala 123:72]
    node _T_24 = and(_T_23, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 123:87]
    node _T_25 = eq(io.exu_mp_index, btb_rd_addr_p1_f) @[el2_ifu_bp_ctl.scala 123:123]
    node fetch_mp_collision_p1_f = and(_T_24, _T_25) @[el2_ifu_bp_ctl.scala 123:108]
    reg leak_one_f_d1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_bp_ctl.scala 125:30]
    leak_one_f_d1 <= leak_one_f @[el2_ifu_bp_ctl.scala 125:30]
    reg dec_tlu_way_wb_f : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_bp_ctl.scala 126:33]
    dec_tlu_way_wb_f <= dec_tlu_way_wb @[el2_ifu_bp_ctl.scala 126:33]
    reg exu_mp_way_f : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_bp_ctl.scala 127:29]
    exu_mp_way_f <= io.exu_mp_pkt.way @[el2_ifu_bp_ctl.scala 127:29]
    reg exu_flush_final_d1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[el2_ifu_bp_ctl.scala 128:35]
    exu_flush_final_d1 <= io.exu_flush_final @[el2_ifu_bp_ctl.scala 128:35]
    node _T_26 = and(io.dec_tlu_flush_leak_one_wb, io.dec_tlu_flush_lower_wb) @[el2_ifu_bp_ctl.scala 130:47]
    node _T_27 = and(leak_one_f_d1, io.dec_tlu_flush_lower_wb) @[el2_ifu_bp_ctl.scala 130:93]
    node _T_28 = or(_T_26, _T_27) @[el2_ifu_bp_ctl.scala 130:76]
    leak_one_f <= _T_28 @[el2_ifu_bp_ctl.scala 130:14]
    node _T_29 = bits(btb_bank0_rd_data_way0_f, 0, 0) @[el2_ifu_bp_ctl.scala 133:50]
    node _T_30 = bits(btb_bank0_rd_data_way0_f, 21, 17) @[el2_ifu_bp_ctl.scala 133:82]
    node _T_31 = eq(_T_30, fetch_rd_tag_f) @[el2_ifu_bp_ctl.scala 133:97]
    node _T_32 = and(_T_29, _T_31) @[el2_ifu_bp_ctl.scala 133:55]
    node _T_33 = and(dec_tlu_way_wb_f, branch_error_bank_conflict_f) @[el2_ifu_bp_ctl.scala 134:22]
    node _T_34 = not(_T_33) @[el2_ifu_bp_ctl.scala 134:3]
    node _T_35 = and(_T_32, _T_34) @[el2_ifu_bp_ctl.scala 133:117]
    node _T_36 = and(_T_35, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 134:54]
    node _T_37 = not(leak_one_f) @[el2_ifu_bp_ctl.scala 134:77]
    node tag_match_way0_f = and(_T_36, _T_37) @[el2_ifu_bp_ctl.scala 134:75]
    node _T_38 = bits(btb_bank0_rd_data_way1_f, 0, 0) @[el2_ifu_bp_ctl.scala 136:50]
    node _T_39 = bits(btb_bank0_rd_data_way1_f, 21, 17) @[el2_ifu_bp_ctl.scala 136:82]
    node _T_40 = eq(_T_39, fetch_rd_tag_f) @[el2_ifu_bp_ctl.scala 136:97]
    node _T_41 = and(_T_38, _T_40) @[el2_ifu_bp_ctl.scala 136:55]
    node _T_42 = and(dec_tlu_way_wb_f, branch_error_bank_conflict_f) @[el2_ifu_bp_ctl.scala 137:22]
    node _T_43 = not(_T_42) @[el2_ifu_bp_ctl.scala 137:3]
    node _T_44 = and(_T_41, _T_43) @[el2_ifu_bp_ctl.scala 136:117]
    node _T_45 = and(_T_44, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 137:54]
    node _T_46 = not(leak_one_f) @[el2_ifu_bp_ctl.scala 137:77]
    node tag_match_way1_f = and(_T_45, _T_46) @[el2_ifu_bp_ctl.scala 137:75]
    node _T_47 = bits(btb_bank0_rd_data_way0_p1_f, 0, 0) @[el2_ifu_bp_ctl.scala 139:56]
    node _T_48 = bits(btb_bank0_rd_data_way0_p1_f, 21, 17) @[el2_ifu_bp_ctl.scala 139:91]
    node _T_49 = eq(_T_48, fetch_rd_tag_p1_f) @[el2_ifu_bp_ctl.scala 139:106]
    node _T_50 = and(_T_47, _T_49) @[el2_ifu_bp_ctl.scala 139:61]
    node _T_51 = and(dec_tlu_way_wb_f, branch_error_bank_conflict_f) @[el2_ifu_bp_ctl.scala 140:24]
    node _T_52 = not(_T_51) @[el2_ifu_bp_ctl.scala 140:5]
    node _T_53 = and(_T_50, _T_52) @[el2_ifu_bp_ctl.scala 139:129]
    node _T_54 = and(_T_53, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 140:56]
    node _T_55 = not(leak_one_f) @[el2_ifu_bp_ctl.scala 140:79]
    node tag_match_way0_p1_f = and(_T_54, _T_55) @[el2_ifu_bp_ctl.scala 140:77]
    node _T_56 = bits(btb_bank0_rd_data_way1_p1_f, 0, 0) @[el2_ifu_bp_ctl.scala 142:56]
    node _T_57 = bits(btb_bank0_rd_data_way1_p1_f, 21, 17) @[el2_ifu_bp_ctl.scala 142:91]
    node _T_58 = eq(_T_57, fetch_rd_tag_p1_f) @[el2_ifu_bp_ctl.scala 142:106]
    node _T_59 = and(_T_56, _T_58) @[el2_ifu_bp_ctl.scala 142:61]
    node _T_60 = and(dec_tlu_way_wb_f, branch_error_bank_conflict_f) @[el2_ifu_bp_ctl.scala 143:24]
    node _T_61 = not(_T_60) @[el2_ifu_bp_ctl.scala 143:5]
    node _T_62 = and(_T_59, _T_61) @[el2_ifu_bp_ctl.scala 142:129]
    node _T_63 = and(_T_62, io.ifc_fetch_req_f) @[el2_ifu_bp_ctl.scala 143:56]
    node _T_64 = not(leak_one_f) @[el2_ifu_bp_ctl.scala 143:79]
    node tag_match_way1_p1_f = and(_T_63, _T_64) @[el2_ifu_bp_ctl.scala 143:77]
    
