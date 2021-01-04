#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by awais.abbas on Tue Dec 29 15:11:49 PKT 2020
# 
#  cmd:    swerv -target=default 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'memmap' => {
                          'external_data_1' => '0x00000000',
                          'unused_region0' => '0x00000000',
                          'unused_region7' => '0x70000000',
                          'external_prog' => '0xb0000000',
                          'unused_region5' => '0x50000000',
                          'serialio' => '0xd0580000',
                          'unused_region2' => '0x20000000',
                          'unused_region3' => '0x30000000',
                          'unused_region6' => '0x60000000',
                          'debug_sb_mem' => '0xb0580000',
                          'unused_region1' => '0x10000000',
                          'external_mem_hole' => '0x90000000',
                          'unused_region4' => '0x40000000',
                          'external_data' => '0xc0580000'
                        },
            'reset_vec' => '0x80000000',
            'dccm' => {
                        'dccm_byte_width' => '4',
                        'dccm_reserved' => '0x1400',
                        'dccm_region' => '0xf',
                        'dccm_num_banks_4' => '',
                        'dccm_index_bits' => 12,
                        'dccm_enable' => '1',
                        'dccm_size' => 64,
                        'dccm_bits' => 16,
                        'dccm_sadr' => '0xf0040000',
                        'dccm_rows' => '4096',
                        'dccm_data_cell' => 'ram_4096x39',
                        'lsu_sb_bits' => 16,
                        'dccm_bank_bits' => 2,
                        'dccm_offset' => '0x40000',
                        'dccm_width_bits' => 2,
                        'dccm_size_64' => '',
                        'dccm_num_banks' => '4',
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_fdata_width' => 39,
                        'dccm_ecc_width' => 7,
                        'dccm_data_width' => 32
                      },
            'csr' => {
                       'mhpmcounter6' => {
                                           'mask' => '0xffffffff',
                                           'exists' => 'true',
                                           'reset' => '0x0'
                                         },
                       'mimpid' => {
                                     'reset' => '0x2',
                                     'exists' => 'true',
                                     'mask' => '0x0'
                                   },
                       'mcgc' => {
                                   'number' => '0x7f8',
                                   'poke_mask' => '0x000001ff',
                                   'exists' => 'true',
                                   'mask' => '0x000001ff',
                                   'reset' => '0x0'
                                 },
                       'mhpmcounter6h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'mhartid' => {
                                      'reset' => '0x0',
                                      'mask' => '0x0',
                                      'exists' => 'true',
                                      'poke_mask' => '0xfffffff0'
                                    },
                       'mitbnd1' => {
                                      'number' => '0x7d6',
                                      'reset' => '0xffffffff',
                                      'mask' => '0xffffffff',
                                      'exists' => 'true'
                                    },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'mfdc' => {
                                   'number' => '0x7f9',
                                   'mask' => '0x00070fff',
                                   'exists' => 'true',
                                   'reset' => '0x00070040'
                                 },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'mrac' => {
                                   'mask' => '0xffffffff',
                                   'exists' => 'true',
                                   'reset' => '0x0',
                                   'comment' => 'Memory region io and cache control.',
                                   'shared' => 'true',
                                   'number' => '0x7c0'
                                 },
                       'mcountinhibit' => {
                                            'reset' => '0x0',
                                            'commnet' => 'Performance counter inhibit. One bit per counter.',
                                            'exists' => 'true',
                                            'mask' => '0x7d',
                                            'poke_mask' => '0x7d'
                                          },
                       'mstatus' => {
                                      'exists' => 'true',
                                      'mask' => '0x88',
                                      'reset' => '0x1800'
                                    },
                       'meicidpl' => {
                                       'comment' => 'External interrupt claim id priority level.',
                                       'reset' => '0x0',
                                       'exists' => 'true',
                                       'mask' => '0xf',
                                       'number' => '0xbcb'
                                     },
                       'mhpmevent5' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'meipt' => {
                                    'number' => '0xbc9',
                                    'comment' => 'External interrupt priority threshold.',
                                    'reset' => '0x0',
                                    'exists' => 'true',
                                    'mask' => '0xf'
                                  },
                       'mitctl0' => {
                                      'mask' => '0x00000007',
                                      'exists' => 'true',
                                      'reset' => '0x1',
                                      'number' => '0x7d4'
                                    },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter4h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'tselect' => {
                                      'reset' => '0x0',
                                      'mask' => '0x3',
                                      'exists' => 'true'
                                    },
                       'meicurpl' => {
                                       'comment' => 'External interrupt current priority level.',
                                       'reset' => '0x0',
                                       'mask' => '0xf',
                                       'exists' => 'true',
                                       'number' => '0xbcc'
                                     },
                       'dcsr' => {
                                   'reset' => '0x40000003',
                                   'debug' => 'true',
                                   'mask' => '0x00008c04',
                                   'exists' => 'true',
                                   'poke_mask' => '0x00008dcc'
                                 },
                       'mpmc' => {
                                   'reset' => '0x2',
                                   'mask' => '0x2',
                                   'exists' => 'true',
                                   'number' => '0x7c6'
                                 },
                       'mip' => {
                                  'poke_mask' => '0x70000888',
                                  'exists' => 'true',
                                  'mask' => '0x0',
                                  'reset' => '0x0'
                                },
                       'micect' => {
                                     'reset' => '0x0',
                                     'mask' => '0xffffffff',
                                     'exists' => 'true',
                                     'number' => '0x7f0'
                                   },
                       'marchid' => {
                                      'reset' => '0x00000010',
                                      'mask' => '0x0',
                                      'exists' => 'true'
                                    },
                       'mitcnt1' => {
                                      'mask' => '0xffffffff',
                                      'exists' => 'true',
                                      'reset' => '0x0',
                                      'number' => '0x7d5'
                                    },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'dmst' => {
                                   'exists' => 'true',
                                   'mask' => '0x0',
                                   'debug' => 'true',
                                   'reset' => '0x0',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'number' => '0x7c4'
                                 },
                       'mhpmcounter4' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'dicad1' => {
                                     'mask' => '0x3',
                                     'exists' => 'true',
                                     'debug' => 'true',
                                     'reset' => '0x0',
                                     'comment' => 'Cache diagnostics.',
                                     'number' => '0x7ca'
                                   },
                       'mitctl1' => {
                                      'exists' => 'true',
                                      'mask' => '0x0000000f',
                                      'reset' => '0x1',
                                      'number' => '0x7d7'
                                    },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'mhpmevent3' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'mhpmcounter3h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'mhpmevent6' => {
                                         'reset' => '0x0',
                                         'exists' => 'true',
                                         'mask' => '0xffffffff'
                                       },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'mie' => {
                                  'mask' => '0x70000888',
                                  'exists' => 'true',
                                  'reset' => '0x0'
                                },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'mhpmcounter5h' => {
                                            'mask' => '0xffffffff',
                                            'exists' => 'true',
                                            'reset' => '0x0'
                                          },
                       'dicad0' => {
                                     'number' => '0x7c9',
                                     'mask' => '0xffffffff',
                                     'exists' => 'true',
                                     'reset' => '0x0',
                                     'debug' => 'true',
                                     'comment' => 'Cache diagnostics.'
                                   },
                       'mdccmect' => {
                                       'number' => '0x7f2',
                                       'mask' => '0xffffffff',
                                       'exists' => 'true',
                                       'reset' => '0x0'
                                     },
                       'dicawics' => {
                                       'number' => '0x7c8',
                                       'reset' => '0x0',
                                       'debug' => 'true',
                                       'comment' => 'Cache diagnostics.',
                                       'exists' => 'true',
                                       'mask' => '0x0130fffc'
                                     },
                       'miccmect' => {
                                       'number' => '0x7f1',
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff',
                                       'exists' => 'true'
                                     },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'mhpmevent4' => {
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff',
                                         'exists' => 'true'
                                       },
                       'mhpmcounter3' => {
                                           'exists' => 'true',
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0'
                                         },
                       'mitbnd0' => {
                                      'number' => '0x7d3',
                                      'reset' => '0xffffffff',
                                      'exists' => 'true',
                                      'mask' => '0xffffffff'
                                    },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'mitcnt0' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d2'
                                    },
                       'mscause' => {
                                      'number' => '0x7ff',
                                      'exists' => 'true',
                                      'mask' => '0x0000000f',
                                      'reset' => '0x0'
                                    },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'mcpc' => {
                                   'number' => '0x7c2',
                                   'mask' => '0x0',
                                   'exists' => 'true',
                                   'comment' => 'Core pause',
                                   'reset' => '0x0'
                                 },
                       'mvendorid' => {
                                        'reset' => '0x45',
                                        'mask' => '0x0',
                                        'exists' => 'true'
                                      },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'misa' => {
                                   'exists' => 'true',
                                   'mask' => '0x0',
                                   'reset' => '0x40001104'
                                 },
                       'mhpmcounter5' => {
                                           'reset' => '0x0',
                                           'exists' => 'true',
                                           'mask' => '0xffffffff'
                                         },
                       'dicago' => {
                                     'number' => '0x7cb',
                                     'debug' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'mask' => '0x0'
                                   },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     }
                     },
            'btb' => {
                       'btb_addr_lo' => '2',
                       'btb_size' => 512,
                       'btb_index2_lo' => 10,
                       'btb_array_depth' => 256,
                       'btb_btag_size' => 5,
                       'btb_index1_lo' => '2',
                       'btb_index3_lo' => 18,
                       'btb_addr_hi' => 9,
                       'btb_index3_hi' => 25,
                       'btb_index1_hi' => 9,
                       'btb_btag_fold' => 0,
                       'btb_fold2_index_hash' => 0,
                       'btb_index2_hi' => 17
                     },
            'triggers' => [
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ]
                            },
                            {
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ]
                            },
                            {
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ]
                            }
                          ],
            'iccm' => {
                        'iccm_eadr' => '0xee00ffff',
                        'iccm_sadr' => '0xee000000',
                        'iccm_bank_hi' => 3,
                        'iccm_region' => '0xe',
                        'iccm_reserved' => '0x1000',
                        'iccm_enable' => 1,
                        'iccm_size_64' => '',
                        'iccm_bits' => 16,
                        'iccm_data_cell' => 'ram_4096x39',
                        'iccm_size' => 64,
                        'iccm_num_banks' => '4',
                        'iccm_rows' => '4096',
                        'iccm_index_bits' => 12,
                        'iccm_bank_bits' => 2,
                        'iccm_num_banks_4' => '',
                        'iccm_bank_index_lo' => 4,
                        'iccm_offset' => '0xe000000'
                      },
            'physical' => '1',
            'bus' => {
                       'dma_bus_tag' => 1,
                       'dma_bus_prty' => '2',
                       'lsu_bus_id' => '1',
                       'sb_bus_prty' => '2',
                       'bus_prty_default' => '3',
                       'dma_bus_id' => '1',
                       'ifu_bus_prty' => '2',
                       'sb_bus_tag' => 1,
                       'ifu_bus_tag' => '3',
                       'lsu_bus_prty' => '2',
                       'sb_bus_id' => '1',
                       'lsu_bus_tag' => 3,
                       'ifu_bus_id' => '1'
                     },
            'harts' => 1,
            'icache' => {
                          'icache_tag_depth' => 128,
                          'icache_index_hi' => 12,
                          'icache_ln_sz' => 64,
                          'icache_num_beats' => 8,
                          'icache_2banks' => '1',
                          'icache_bank_hi' => 3,
                          'icache_ecc' => '1',
                          'icache_enable' => 1,
                          'icache_scnd_last' => 6,
                          'icache_bank_lo' => 3,
                          'icache_size' => 16,
                          'icache_fdata_width' => 71,
                          'icache_num_lines_bank' => '64',
                          'icache_tag_lo' => 13,
                          'icache_banks_way' => 2,
                          'icache_beat_addr_hi' => 5,
                          'icache_tag_index_lo' => '6',
                          'icache_data_depth' => '512',
                          'icache_data_index_lo' => 4,
                          'icache_tag_cell' => 'ram_128x25',
                          'icache_status_bits' => 1,
                          'icache_bank_width' => 8,
                          'icache_num_lines' => 256,
                          'icache_data_width' => 64,
                          'icache_bank_bits' => 1,
                          'icache_num_lines_way' => '128',
                          'icache_num_ways' => 2,
                          'icache_data_cell' => 'ram_512x71',
                          'icache_beat_bits' => 3
                        },
            'config_key' => '32\'hdeadbeef',
            'even_odd_trigger_chains' => 'true',
            'testbench' => {
                             'RV_TOP' => '`TOP.rvtop',
                             'ext_addrwidth' => '32',
                             'lderr_rollback' => '1',
                             'clock_period' => '100',
                             'sterr_rollback' => '0',
                             'assert_on' => '',
                             'build_axi4' => 1,
                             'TOP' => 'tb_top',
                             'CPU_TOP' => '`RV_TOP.swerv',
                             'SDVT_AHB' => '1',
                             'build_axi_native' => 1,
                             'ext_datawidth' => '64'
                           },
            'retstack' => {
                            'ret_stack_size' => '8'
                          },
            'target' => 'default',
            'numiregs' => '32',
            'xlen' => 32,
            'protection' => {
                              'data_access_enable0' => '1',
                              'data_access_addr1' => '0xc0000000',
                              'data_access_enable2' => '1',
                              'data_access_enable1' => '1',
                              'data_access_enable4' => '0x0',
                              'inst_access_addr6' => '0x00000000',
                              'inst_access_mask3' => '0x0fffffff',
                              'inst_access_addr3' => '0x80000000',
                              'inst_access_addr1' => '0xc0000000',
                              'inst_access_mask1' => '0x3fffffff',
                              'data_access_addr2' => '0xa0000000',
                              'inst_access_addr0' => '0x0',
                              'data_access_mask3' => '0x0fffffff',
                              'inst_access_addr4' => '0x00000000',
                              'inst_access_enable1' => '1',
                              'inst_access_mask7' => '0xffffffff',
                              'inst_access_enable3' => '1',
                              'inst_access_mask5' => '0xffffffff',
                              'data_access_enable6' => '0x0',
                              'data_access_enable3' => '1',
                              'data_access_addr3' => '0x80000000',
                              'data_access_mask1' => '0x3fffffff',
                              'data_access_mask2' => '0x1fffffff',
                              'data_access_mask4' => '0xffffffff',
                              'inst_access_enable4' => '0x0',
                              'inst_access_addr2' => '0xa0000000',
                              'inst_access_enable0' => '1',
                              'data_access_addr4' => '0x00000000',
                              'data_access_mask0' => '0x7fffffff',
                              'data_access_mask5' => '0xffffffff',
                              'inst_access_enable5' => '0x0',
                              'inst_access_mask4' => '0xffffffff',
                              'inst_access_mask0' => '0x7fffffff',
                              'inst_access_mask2' => '0x1fffffff',
                              'data_access_enable7' => '0x0',
                              'data_access_addr7' => '0x00000000',
                              'data_access_mask6' => '0xffffffff',
                              'inst_access_enable6' => '0x0',
                              'data_access_addr0' => '0x0',
                              'inst_access_mask6' => '0xffffffff',
                              'data_access_addr5' => '0x00000000',
                              'inst_access_addr7' => '0x00000000',
                              'data_access_mask7' => '0xffffffff',
                              'inst_access_enable2' => '1',
                              'data_access_enable5' => '0x0',
                              'inst_access_addr5' => '0x00000000',
                              'inst_access_enable7' => '0x0',
                              'data_access_addr6' => '0x00000000'
                            },
            'num_mmode_perf_regs' => '4',
            'pic' => {
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_meipl_mask' => '0xf',
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meipt_count' => 31,
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_meigwctrl_count' => 31,
                       'pic_meie_mask' => '0x1',
                       'pic_mpiccfg_mask' => '0x1',
                       'pic_meipt_offset' => '0x3004',
                       'pic_meip_offset' => '0x1000',
                       'pic_meie_offset' => '0x2000',
                       'pic_int_words' => 1,
                       'pic_meigwclr_count' => 31,
                       'pic_meigwctrl_mask' => '0x3',
                       'pic_meipt_mask' => '0x0',
                       'pic_meip_count' => 4,
                       'pic_total_int_plus1' => 32,
                       'pic_offset' => '0xc0000',
                       'pic_meipl_offset' => '0x0000',
                       'pic_meie_count' => 31,
                       'pic_bits' => 15,
                       'pic_total_int' => 31,
                       'pic_meigwclr_mask' => '0x0',
                       'pic_size' => 32,
                       'pic_meipl_count' => 31,
                       'pic_base_addr' => '0xf00c0000',
                       'pic_mpiccfg_count' => 1,
                       'pic_region' => '0xf',
                       'pic_meip_mask' => '0x0'
                     },
            'tec_rv_icg' => 'clockhdr',
            'core' => {
                        'no_iccm_no_icache' => 'derived',
                        'lsu_stbuf_depth' => '4',
                        'dma_buf_depth' => '5',
                        'lsu2dma' => 0,
                        'lsu_num_nbload_width' => '2',
                        'timer_legal_en' => '1',
                        'lsu_num_nbload' => '4',
                        'fast_interrupt_redirect' => '1',
                        'icache_only' => 'derived',
                        'iccm_icache' => 1,
                        'iccm_only' => 'derived',
                        'fpga_optimize' => '0'
                      },
            'regwidth' => '32',
            'bht' => {
                       'bht_array_depth' => 256,
                       'bht_ghr_size' => 8,
                       'bht_addr_hi' => 9,
                       'bht_ghr_hash_1' => '',
                       'bht_size' => 512,
                       'bht_addr_lo' => '2',
                       'bht_hash_string' => '{hashin[8+1:2]^ghr[8-1:0]}// cf2',
                       'bht_ghr_range' => '7:0'
                     },
            'nmi_vec' => '0x11110000',
            'max_mmode_perf_event' => '516'
          );
1;
