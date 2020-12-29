#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by waleedbinehsan on و 17:46:00 PKT ت 29 دسمبر 2020
# 
#  cmd:    quasar -target=default 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'even_odd_trigger_chains' => 'true',
            'regwidth' => '32',
            'numiregs' => '32',
            'harts' => 1,
            'config_key' => '32\'hdeadbeef',
            'memmap' => {
                          'unused_region5' => '0x50000000',
                          'external_data' => '0xc0580000',
                          'unused_region1' => '0x10000000',
                          'unused_region0' => '0x00000000',
                          'debug_sb_mem' => '0xb0580000',
                          'serialio' => '0xd0580000',
                          'unused_region7' => '0x70000000',
                          'external_mem_hole' => '0x90000000',
                          'external_prog' => '0xb0000000',
                          'unused_region6' => '0x60000000',
                          'unused_region2' => '0x20000000',
                          'external_data_1' => '0x00000000',
                          'unused_region4' => '0x40000000',
                          'unused_region3' => '0x30000000'
                        },
            'iccm' => {
                        'iccm_data_cell' => 'ram_4096x39',
                        'iccm_size_64' => '',
                        'iccm_size' => 64,
                        'iccm_offset' => '0xe000000',
                        'iccm_index_bits' => 12,
                        'iccm_reserved' => '0x1000',
                        'iccm_rows' => '4096',
                        'iccm_bank_index_lo' => 4,
                        'iccm_sadr' => '0xee000000',
                        'iccm_num_banks_4' => '',
                        'iccm_region' => '0xe',
                        'iccm_bits' => 16,
                        'iccm_eadr' => '0xee00ffff',
                        'iccm_bank_hi' => 3,
                        'iccm_enable' => 1,
                        'iccm_bank_bits' => 2,
                        'iccm_num_banks' => '4'
                      },
            'target' => 'default',
            'bht' => {
                       'bht_hash_string' => '{hashin[8+1:2]^ghr[8-1:0]}// cf2',
                       'bht_ghr_hash_1' => '',
                       'bht_size' => 512,
                       'bht_addr_lo' => '2',
                       'bht_addr_hi' => 9,
                       'bht_array_depth' => 256,
                       'bht_ghr_range' => '7:0',
                       'bht_ghr_size' => 8
                     },
            'icache' => {
                          'icache_bank_lo' => 3,
                          'icache_num_lines' => 256,
                          'icache_ln_sz' => 64,
                          'icache_tag_cell' => 'ram_128x25',
                          'icache_2banks' => '1',
                          'icache_tag_depth' => 128,
                          'icache_tag_lo' => 13,
                          'icache_num_beats' => 8,
                          'icache_beat_bits' => 3,
                          'icache_num_lines_way' => '128',
                          'icache_data_index_lo' => 4,
                          'icache_tag_index_lo' => '6',
                          'icache_bank_hi' => 3,
                          'icache_banks_way' => 2,
                          'icache_scnd_last' => 6,
                          'icache_data_width' => 64,
                          'icache_num_ways' => 2,
                          'icache_data_depth' => '512',
                          'icache_size' => 16,
                          'icache_bank_bits' => 1,
                          'icache_num_lines_bank' => '64',
                          'icache_status_bits' => 1,
                          'icache_beat_addr_hi' => 5,
                          'icache_fdata_width' => 71,
                          'icache_data_cell' => 'ram_512x71',
                          'icache_enable' => 1,
                          'icache_bank_width' => 8,
                          'icache_index_hi' => 12,
                          'icache_ecc' => '1'
                        },
            'bus' => {
                       'lsu_bus_tag' => 3,
                       'lsu_bus_id' => '1',
                       'bus_prty_default' => '3',
                       'ifu_bus_id' => '1',
                       'sb_bus_id' => '1',
                       'ifu_bus_tag' => '3',
                       'sb_bus_tag' => 1,
                       'dma_bus_prty' => '2',
                       'lsu_bus_prty' => '2',
                       'dma_bus_id' => '1',
                       'dma_bus_tag' => 1,
                       'ifu_bus_prty' => '2',
                       'sb_bus_prty' => '2'
                     },
            'max_mmode_perf_event' => '516',
            'protection' => {
                              'data_access_addr3' => '0x80000000',
                              'inst_access_enable4' => '0x0',
                              'inst_access_enable2' => '1',
                              'inst_access_mask3' => '0x0fffffff',
                              'data_access_mask2' => '0x1fffffff',
                              'inst_access_enable7' => '0x0',
                              'inst_access_addr2' => '0xa0000000',
                              'data_access_mask4' => '0xffffffff',
                              'inst_access_addr4' => '0x00000000',
                              'data_access_mask1' => '0x3fffffff',
                              'inst_access_addr7' => '0x00000000',
                              'inst_access_addr1' => '0xc0000000',
                              'data_access_mask7' => '0xffffffff',
                              'data_access_enable6' => '0x0',
                              'data_access_enable3' => '1',
                              'inst_access_mask0' => '0x7fffffff',
                              'inst_access_enable1' => '1',
                              'data_access_addr0' => '0x0',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_enable5' => '0x0',
                              'inst_access_enable0' => '1',
                              'inst_access_addr6' => '0x00000000',
                              'inst_access_addr5' => '0x00000000',
                              'data_access_mask5' => '0xffffffff',
                              'inst_access_mask1' => '0x3fffffff',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_enable6' => '0x0',
                              'inst_access_mask7' => '0xffffffff',
                              'data_access_addr1' => '0xc0000000',
                              'inst_access_enable3' => '1',
                              'data_access_mask0' => '0x7fffffff',
                              'inst_access_addr0' => '0x0',
                              'data_access_enable1' => '1',
                              'inst_access_mask6' => '0xffffffff',
                              'inst_access_enable5' => '0x0',
                              'data_access_addr6' => '0x00000000',
                              'data_access_enable0' => '1',
                              'data_access_addr5' => '0x00000000',
                              'inst_access_mask5' => '0xffffffff',
                              'data_access_enable4' => '0x0',
                              'inst_access_addr3' => '0x80000000',
                              'data_access_mask3' => '0x0fffffff',
                              'data_access_enable2' => '1',
                              'inst_access_mask2' => '0x1fffffff',
                              'data_access_addr2' => '0xa0000000',
                              'data_access_enable7' => '0x0',
                              'inst_access_mask4' => '0xffffffff',
                              'data_access_addr4' => '0x00000000'
                            },
            'csr' => {
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'mhpmcounter3' => {
                                           'reset' => '0x0',
                                           'exists' => 'true',
                                           'mask' => '0xffffffff'
                                         },
                       'mitcnt1' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d5'
                                    },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'dicago' => {
                                     'number' => '0x7cb',
                                     'mask' => '0x0',
                                     'debug' => 'true',
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'reset' => '0x0'
                                   },
                       'mcpc' => {
                                   'number' => '0x7c2',
                                   'mask' => '0x0',
                                   'reset' => '0x0',
                                   'comment' => 'Core pause',
                                   'exists' => 'true'
                                 },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'dcsr' => {
                                   'reset' => '0x40000003',
                                   'exists' => 'true',
                                   'poke_mask' => '0x00008dcc',
                                   'debug' => 'true',
                                   'mask' => '0x00008c04'
                                 },
                       'mitcnt0' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d2'
                                    },
                       'mhpmcounter4' => {
                                           'mask' => '0xffffffff',
                                           'exists' => 'true',
                                           'reset' => '0x0'
                                         },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'dicad0' => {
                                     'mask' => '0xffffffff',
                                     'number' => '0x7c9',
                                     'debug' => 'true',
                                     'exists' => 'true',
                                     'reset' => '0x0',
                                     'comment' => 'Cache diagnostics.'
                                   },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'mitctl1' => {
                                      'mask' => '0x0000000f',
                                      'number' => '0x7d7',
                                      'exists' => 'true',
                                      'reset' => '0x1'
                                    },
                       'mie' => {
                                  'reset' => '0x0',
                                  'exists' => 'true',
                                  'mask' => '0x70000888'
                                },
                       'mhpmcounter3h' => {
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0',
                                            'exists' => 'true'
                                          },
                       'miccmect' => {
                                       'number' => '0x7f1',
                                       'mask' => '0xffffffff',
                                       'reset' => '0x0',
                                       'exists' => 'true'
                                     },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'mcgc' => {
                                   'mask' => '0x000001ff',
                                   'number' => '0x7f8',
                                   'poke_mask' => '0x000001ff',
                                   'exists' => 'true',
                                   'reset' => '0x0'
                                 },
                       'mitctl0' => {
                                      'exists' => 'true',
                                      'reset' => '0x1',
                                      'number' => '0x7d4',
                                      'mask' => '0x00000007'
                                    },
                       'mhpmcounter4h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'mhartid' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'poke_mask' => '0xfffffff0',
                                      'mask' => '0x0'
                                    },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'mimpid' => {
                                     'reset' => '0x2',
                                     'exists' => 'true',
                                     'mask' => '0x0'
                                   },
                       'meicurpl' => {
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'comment' => 'External interrupt current priority level.',
                                       'number' => '0xbcc',
                                       'mask' => '0xf'
                                     },
                       'mhpmevent6' => {
                                         'exists' => 'true',
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff'
                                       },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'mitbnd0' => {
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d3',
                                      'reset' => '0xffffffff',
                                      'exists' => 'true'
                                    },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'mhpmevent4' => {
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0',
                                         'exists' => 'true'
                                       },
                       'mhpmcounter5h' => {
                                            'mask' => '0xffffffff',
                                            'exists' => 'true',
                                            'reset' => '0x0'
                                          },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'mstatus' => {
                                      'mask' => '0x88',
                                      'exists' => 'true',
                                      'reset' => '0x1800'
                                    },
                       'tselect' => {
                                      'exists' => 'true',
                                      'reset' => '0x0',
                                      'mask' => '0x3'
                                    },
                       'mitbnd1' => {
                                      'exists' => 'true',
                                      'reset' => '0xffffffff',
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d6'
                                    },
                       'mrac' => {
                                   'shared' => 'true',
                                   'number' => '0x7c0',
                                   'mask' => '0xffffffff',
                                   'comment' => 'Memory region io and cache control.',
                                   'reset' => '0x0',
                                   'exists' => 'true'
                                 },
                       'dmst' => {
                                   'exists' => 'true',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'reset' => '0x0',
                                   'mask' => '0x0',
                                   'number' => '0x7c4',
                                   'debug' => 'true'
                                 },
                       'dicad1' => {
                                     'number' => '0x7ca',
                                     'mask' => '0x3',
                                     'debug' => 'true',
                                     'exists' => 'true',
                                     'reset' => '0x0',
                                     'comment' => 'Cache diagnostics.'
                                   },
                       'micect' => {
                                     'number' => '0x7f0',
                                     'mask' => '0xffffffff',
                                     'reset' => '0x0',
                                     'exists' => 'true'
                                   },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'mpmc' => {
                                   'reset' => '0x2',
                                   'exists' => 'true',
                                   'mask' => '0x2',
                                   'number' => '0x7c6'
                                 },
                       'meicidpl' => {
                                       'number' => '0xbcb',
                                       'mask' => '0xf',
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'comment' => 'External interrupt claim id priority level.'
                                     },
                       'mhpmcounter6h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'misa' => {
                                   'reset' => '0x40001104',
                                   'exists' => 'true',
                                   'mask' => '0x0'
                                 },
                       'mip' => {
                                  'reset' => '0x0',
                                  'exists' => 'true',
                                  'poke_mask' => '0x70000888',
                                  'mask' => '0x0'
                                },
                       'mhpmevent5' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'mcountinhibit' => {
                                            'exists' => 'true',
                                            'reset' => '0x0',
                                            'commnet' => 'Performance counter inhibit. One bit per counter.',
                                            'mask' => '0x7d',
                                            'poke_mask' => '0x7d'
                                          },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'mfdc' => {
                                   'exists' => 'true',
                                   'reset' => '0x00070040',
                                   'mask' => '0x00070fff',
                                   'number' => '0x7f9'
                                 },
                       'mscause' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'number' => '0x7ff',
                                      'mask' => '0x0000000f'
                                    },
                       'mhpmevent3' => {
                                         'exists' => 'true',
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff'
                                       },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'dicawics' => {
                                       'debug' => 'true',
                                       'mask' => '0x0130fffc',
                                       'number' => '0x7c8',
                                       'reset' => '0x0',
                                       'comment' => 'Cache diagnostics.',
                                       'exists' => 'true'
                                     },
                       'mdccmect' => {
                                       'mask' => '0xffffffff',
                                       'number' => '0x7f2',
                                       'reset' => '0x0',
                                       'exists' => 'true'
                                     },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'mvendorid' => {
                                        'mask' => '0x0',
                                        'reset' => '0x45',
                                        'exists' => 'true'
                                      },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'meipt' => {
                                    'number' => '0xbc9',
                                    'mask' => '0xf',
                                    'exists' => 'true',
                                    'comment' => 'External interrupt priority threshold.',
                                    'reset' => '0x0'
                                  },
                       'mhpmcounter5' => {
                                           'reset' => '0x0',
                                           'exists' => 'true',
                                           'mask' => '0xffffffff'
                                         },
                       'marchid' => {
                                      'mask' => '0x0',
                                      'reset' => '0x00000010',
                                      'exists' => 'true'
                                    }
                     },
            'pic' => {
                       'pic_meip_offset' => '0x1000',
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_meie_count' => 31,
                       'pic_offset' => '0xc0000',
                       'pic_mpiccfg_mask' => '0x1',
                       'pic_int_words' => 1,
                       'pic_mpiccfg_count' => 1,
                       'pic_meipl_offset' => '0x0000',
                       'pic_meigwctrl_count' => 31,
                       'pic_meipt_offset' => '0x3004',
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_meigwclr_count' => 31,
                       'pic_meip_mask' => '0x0',
                       'pic_base_addr' => '0xf00c0000',
                       'pic_region' => '0xf',
                       'pic_total_int' => 31,
                       'pic_bits' => 15,
                       'pic_meipl_mask' => '0xf',
                       'pic_meipt_mask' => '0x0',
                       'pic_meigwctrl_mask' => '0x3',
                       'pic_total_int_plus1' => 32,
                       'pic_meie_mask' => '0x1',
                       'pic_meipt_count' => 31,
                       'pic_meigwclr_mask' => '0x0',
                       'pic_meipl_count' => 31,
                       'pic_size' => 32,
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meip_count' => 4,
                       'pic_meie_offset' => '0x2000'
                     },
            'nmi_vec' => '0x11110000',
            'retstack' => {
                            'ret_stack_size' => '8'
                          },
            'num_mmode_perf_regs' => '4',
            'physical' => '1',
            'btb' => {
                       'btb_index3_hi' => 25,
                       'btb_index1_lo' => '2',
                       'btb_size' => 512,
                       'btb_addr_hi' => 9,
                       'btb_addr_lo' => '2',
                       'btb_index2_lo' => 10,
                       'btb_btag_fold' => 0,
                       'btb_fold2_index_hash' => 0,
                       'btb_index3_lo' => 18,
                       'btb_index1_hi' => 9,
                       'btb_index2_hi' => 17,
                       'btb_btag_size' => 5,
                       'btb_array_depth' => 256
                     },
            'dccm' => {
                        'dccm_reserved' => '0x1400',
                        'dccm_rows' => '4096',
                        'dccm_index_bits' => 12,
                        'dccm_byte_width' => '4',
                        'dccm_offset' => '0x40000',
                        'dccm_data_cell' => 'ram_4096x39',
                        'dccm_size_64' => '',
                        'dccm_ecc_width' => 7,
                        'dccm_size' => 64,
                        'dccm_width_bits' => 2,
                        'dccm_enable' => '1',
                        'dccm_fdata_width' => 39,
                        'dccm_region' => '0xf',
                        'dccm_bits' => 16,
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_num_banks_4' => '',
                        'dccm_sadr' => '0xf0040000',
                        'lsu_sb_bits' => 16,
                        'dccm_data_width' => 32,
                        'dccm_bank_bits' => 2,
                        'dccm_num_banks' => '4'
                      },
            'triggers' => [
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
            'tec_rv_icg' => 'clockhdr',
            'core' => {
                        'iccm_only' => 'derived',
                        'timer_legal_en' => '1',
                        'lsu_stbuf_depth' => '4',
                        'icache_only' => 'derived',
                        'dma_buf_depth' => '5',
                        'no_iccm_no_icache' => 'derived',
                        'lsu2dma' => 0,
                        'iccm_icache' => 1,
                        'lsu_num_nbload_width' => '2',
                        'lsu_num_nbload' => '4',
                        'fast_interrupt_redirect' => '1',
                        'fpga_optimize' => '0'
                      },
            'reset_vec' => '0x80000000',
            'xlen' => 32,
            'testbench' => {
                             'SDVT_AHB' => '1',
                             'build_axi4' => 1,
                             'build_axi_native' => 1,
                             'lderr_rollback' => '1',
                             'clock_period' => '100',
                             'RV_TOP' => '`TOP.rvtop',
                             'assert_on' => '',
                             'TOP' => 'tb_top',
                             'ext_datawidth' => '64',
                             'CPU_TOP' => '`RV_TOP.quasar',
                             'sterr_rollback' => '0',
                             'ext_addrwidth' => '32'
                           }
          );
1;
