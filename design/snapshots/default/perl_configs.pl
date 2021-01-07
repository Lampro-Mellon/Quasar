#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by waleedbinehsan on و 15:35:44 PKT ت 07 جنوری 2021
# 
#  cmd:    quasar -target=default 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'max_mmode_perf_event' => '516',
            'core' => {
                        'timer_legal_en' => '1',
                        'lsu_num_nbload' => '4',
                        'dma_buf_depth' => '5',
                        'iccm_only' => 'derived',
                        'no_iccm_no_icache' => 'derived',
                        'lsu2dma' => 0,
                        'icache_only' => 'derived',
                        'lsu_num_nbload_width' => '2',
                        'fast_interrupt_redirect' => '1',
                        'iccm_icache' => 1,
                        'fpga_optimize' => '0',
                        'lsu_stbuf_depth' => '4'
                      },
            'icache' => {
                          'icache_tag_lo' => 13,
                          'icache_fdata_width' => 71,
                          'icache_data_index_lo' => 4,
                          'icache_tag_index_lo' => '6',
                          'icache_size' => 16,
                          'icache_num_lines' => 256,
                          'icache_bank_width' => 8,
                          'icache_num_lines_way' => '128',
                          'icache_tag_cell' => 'ram_128x25',
                          'icache_index_hi' => 12,
                          'icache_num_lines_bank' => '64',
                          'icache_beat_addr_hi' => 5,
                          'icache_ecc' => '1',
                          'icache_ln_sz' => 64,
                          'icache_bank_hi' => 3,
                          'icache_beat_bits' => 3,
                          'icache_2banks' => '1',
                          'icache_bank_lo' => 3,
                          'icache_bank_bits' => 1,
                          'icache_scnd_last' => 6,
                          'icache_tag_depth' => 128,
                          'icache_data_cell' => 'ram_512x71',
                          'icache_num_beats' => 8,
                          'icache_banks_way' => 2,
                          'icache_data_depth' => '512',
                          'icache_enable' => 1,
                          'icache_status_bits' => 1,
                          'icache_num_ways' => 2,
                          'icache_data_width' => 64
                        },
            'xlen' => 32,
            'retstack' => {
                            'ret_stack_size' => '8'
                          },
            'triggers' => [
                            {
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
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
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
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
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
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
            'config_key' => '32\'hdeadbeef',
            'numiregs' => '32',
            'physical' => '1',
            'target' => 'default',
            'num_mmode_perf_regs' => '4',
            'regwidth' => '32',
            'btb' => {
                       'btb_index2_hi' => 17,
                       'btb_btag_fold' => 0,
                       'btb_array_depth' => 256,
                       'btb_index2_lo' => 10,
                       'btb_fold2_index_hash' => 0,
                       'btb_addr_hi' => 9,
                       'btb_addr_lo' => '2',
                       'btb_index1_lo' => '2',
                       'btb_index3_lo' => 18,
                       'btb_size' => 512,
                       'btb_index3_hi' => 25,
                       'btb_btag_size' => 5,
                       'btb_index1_hi' => 9
                     },
            'csr' => {
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'tselect' => {
                                      'exists' => 'true',
                                      'reset' => '0x0',
                                      'mask' => '0x3'
                                    },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'misa' => {
                                   'exists' => 'true',
                                   'reset' => '0x40001104',
                                   'mask' => '0x0'
                                 },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'dicad1' => {
                                     'exists' => 'true',
                                     'number' => '0x7ca',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0x3',
                                     'debug' => 'true',
                                     'reset' => '0x0'
                                   },
                       'mcgc' => {
                                   'poke_mask' => '0x000001ff',
                                   'mask' => '0x000001ff',
                                   'number' => '0x7f8',
                                   'exists' => 'true',
                                   'reset' => '0x0'
                                 },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'dicago' => {
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'number' => '0x7cb',
                                     'debug' => 'true',
                                     'mask' => '0x0',
                                     'reset' => '0x0'
                                   },
                       'mhpmcounter3h' => {
                                            'reset' => '0x0',
                                            'exists' => 'true',
                                            'mask' => '0xffffffff'
                                          },
                       'mhpmevent6' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'mimpid' => {
                                     'exists' => 'true',
                                     'reset' => '0x2',
                                     'mask' => '0x0'
                                   },
                       'mitctl0' => {
                                      'exists' => 'true',
                                      'number' => '0x7d4',
                                      'reset' => '0x1',
                                      'mask' => '0x00000007'
                                    },
                       'mitcnt1' => {
                                      'exists' => 'true',
                                      'reset' => '0x0',
                                      'number' => '0x7d5',
                                      'mask' => '0xffffffff'
                                    },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter5' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'mitcnt0' => {
                                      'mask' => '0xffffffff',
                                      'number' => '0x7d2',
                                      'exists' => 'true',
                                      'reset' => '0x0'
                                    },
                       'mvendorid' => {
                                        'exists' => 'true',
                                        'reset' => '0x45',
                                        'mask' => '0x0'
                                      },
                       'mitctl1' => {
                                      'mask' => '0x0000000f',
                                      'number' => '0x7d7',
                                      'exists' => 'true',
                                      'reset' => '0x1'
                                    },
                       'dcsr' => {
                                   'debug' => 'true',
                                   'mask' => '0x00008c04',
                                   'exists' => 'true',
                                   'reset' => '0x40000003',
                                   'poke_mask' => '0x00008dcc'
                                 },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'dicad0' => {
                                     'reset' => '0x0',
                                     'debug' => 'true',
                                     'mask' => '0xffffffff',
                                     'exists' => 'true',
                                     'number' => '0x7c9',
                                     'comment' => 'Cache diagnostics.'
                                   },
                       'mhpmcounter6h' => {
                                            'mask' => '0xffffffff',
                                            'exists' => 'true',
                                            'reset' => '0x0'
                                          },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'mdccmect' => {
                                       'exists' => 'true',
                                       'number' => '0x7f2',
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff'
                                     },
                       'mhpmcounter5h' => {
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0',
                                            'exists' => 'true'
                                          },
                       'mpmc' => {
                                   'number' => '0x7c6',
                                   'exists' => 'true',
                                   'reset' => '0x2',
                                   'mask' => '0x2'
                                 },
                       'miccmect' => {
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'number' => '0x7f1',
                                       'mask' => '0xffffffff'
                                     },
                       'mhpmcounter3' => {
                                           'mask' => '0xffffffff',
                                           'exists' => 'true',
                                           'reset' => '0x0'
                                         },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'mstatus' => {
                                      'mask' => '0x88',
                                      'exists' => 'true',
                                      'reset' => '0x1800'
                                    },
                       'micect' => {
                                     'mask' => '0xffffffff',
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'number' => '0x7f0'
                                   },
                       'mhpmevent4' => {
                                         'exists' => 'true',
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff'
                                       },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter4h' => {
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0',
                                            'exists' => 'true'
                                          },
                       'mhpmevent3' => {
                                         'reset' => '0x0',
                                         'exists' => 'true',
                                         'mask' => '0xffffffff'
                                       },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'meicidpl' => {
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'comment' => 'External interrupt claim id priority level.',
                                       'number' => '0xbcb',
                                       'mask' => '0xf'
                                     },
                       'mitbnd0' => {
                                      'mask' => '0xffffffff',
                                      'reset' => '0xffffffff',
                                      'exists' => 'true',
                                      'number' => '0x7d3'
                                    },
                       'mhpmevent5' => {
                                         'mask' => '0xffffffff',
                                         'exists' => 'true',
                                         'reset' => '0x0'
                                       },
                       'dicawics' => {
                                       'exists' => 'true',
                                       'number' => '0x7c8',
                                       'comment' => 'Cache diagnostics.',
                                       'debug' => 'true',
                                       'mask' => '0x0130fffc',
                                       'reset' => '0x0'
                                     },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'mcpc' => {
                                   'exists' => 'true',
                                   'reset' => '0x0',
                                   'number' => '0x7c2',
                                   'comment' => 'Core pause',
                                   'mask' => '0x0'
                                 },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'marchid' => {
                                      'mask' => '0x0',
                                      'reset' => '0x00000010',
                                      'exists' => 'true'
                                    },
                       'mcountinhibit' => {
                                            'poke_mask' => '0x7d',
                                            'mask' => '0x7d',
                                            'exists' => 'true',
                                            'commnet' => 'Performance counter inhibit. One bit per counter.',
                                            'reset' => '0x0'
                                          },
                       'mie' => {
                                  'reset' => '0x0',
                                  'exists' => 'true',
                                  'mask' => '0x70000888'
                                },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'mfdc' => {
                                   'number' => '0x7f9',
                                   'exists' => 'true',
                                   'reset' => '0x00070040',
                                   'mask' => '0x00070fff'
                                 },
                       'mhpmcounter4' => {
                                           'exists' => 'true',
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff'
                                         },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'mscause' => {
                                      'exists' => 'true',
                                      'number' => '0x7ff',
                                      'reset' => '0x0',
                                      'mask' => '0x0000000f'
                                    },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'meipt' => {
                                    'mask' => '0xf',
                                    'reset' => '0x0',
                                    'exists' => 'true',
                                    'number' => '0xbc9',
                                    'comment' => 'External interrupt priority threshold.'
                                  },
                       'mrac' => {
                                   'mask' => '0xffffffff',
                                   'shared' => 'true',
                                   'exists' => 'true',
                                   'comment' => 'Memory region io and cache control.',
                                   'reset' => '0x0',
                                   'number' => '0x7c0'
                                 },
                       'dmst' => {
                                   'exists' => 'true',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'number' => '0x7c4',
                                   'mask' => '0x0',
                                   'debug' => 'true',
                                   'reset' => '0x0'
                                 },
                       'meicurpl' => {
                                       'mask' => '0xf',
                                       'comment' => 'External interrupt current priority level.',
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'number' => '0xbcc'
                                     },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'mip' => {
                                  'poke_mask' => '0x70000888',
                                  'reset' => '0x0',
                                  'exists' => 'true',
                                  'mask' => '0x0'
                                },
                       'mhartid' => {
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'mask' => '0x0',
                                      'poke_mask' => '0xfffffff0'
                                    },
                       'mitbnd1' => {
                                      'mask' => '0xffffffff',
                                      'reset' => '0xffffffff',
                                      'exists' => 'true',
                                      'number' => '0x7d6'
                                    }
                     },
            'nmi_vec' => '0x11110000',
            'pic' => {
                       'pic_meigwclr_mask' => '0x0',
                       'pic_meie_count' => 31,
                       'pic_int_words' => 1,
                       'pic_meipt_mask' => '0x0',
                       'pic_meip_offset' => '0x1000',
                       'pic_meipl_count' => 31,
                       'pic_meigwctrl_count' => 31,
                       'pic_size' => 32,
                       'pic_mpiccfg_count' => 1,
                       'pic_meipt_offset' => '0x3004',
                       'pic_meigwclr_count' => 31,
                       'pic_meie_offset' => '0x2000',
                       'pic_meip_count' => 4,
                       'pic_total_int' => 31,
                       'pic_meigwctrl_mask' => '0x3',
                       'pic_bits' => 15,
                       'pic_region' => '0xf',
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_offset' => '0xc0000',
                       'pic_mpiccfg_mask' => '0x1',
                       'pic_meipl_offset' => '0x0000',
                       'pic_meipl_mask' => '0xf',
                       'pic_meipt_count' => 31,
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_meie_mask' => '0x1',
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_total_int_plus1' => 32,
                       'pic_base_addr' => '0xf00c0000',
                       'pic_meip_mask' => '0x0'
                     },
            'memmap' => {
                          'external_prog' => '0xb0000000',
                          'unused_region1' => '0x10000000',
                          'unused_region3' => '0x30000000',
                          'unused_region7' => '0x70000000',
                          'unused_region4' => '0x40000000',
                          'external_data_1' => '0x00000000',
                          'unused_region0' => '0x00000000',
                          'external_data' => '0xc0580000',
                          'debug_sb_mem' => '0xb0580000',
                          'serialio' => '0xd0580000',
                          'unused_region5' => '0x50000000',
                          'external_mem_hole' => '0x90000000',
                          'unused_region6' => '0x60000000',
                          'unused_region2' => '0x20000000'
                        },
            'bht' => {
                       'bht_ghr_hash_1' => '',
                       'bht_array_depth' => 256,
                       'bht_size' => 512,
                       'bht_addr_hi' => 9,
                       'bht_addr_lo' => '2',
                       'bht_hash_string' => '{hashin[8+1:2]^ghr[8-1:0]}// cf2',
                       'bht_ghr_range' => '7:0',
                       'bht_ghr_size' => 8
                     },
            'protection' => {
                              'data_access_enable5' => '0x0',
                              'inst_access_enable6' => '0x0',
                              'inst_access_enable0' => '1',
                              'data_access_enable0' => '1',
                              'inst_access_enable5' => '0x0',
                              'data_access_enable6' => '0x0',
                              'inst_access_mask0' => '0x7fffffff',
                              'inst_access_mask4' => '0xffffffff',
                              'data_access_addr0' => '0x0',
                              'inst_access_enable2' => '1',
                              'data_access_enable4' => '0x0',
                              'data_access_addr4' => '0x00000000',
                              'data_access_enable2' => '1',
                              'inst_access_addr0' => '0x0',
                              'inst_access_enable4' => '0x0',
                              'inst_access_addr4' => '0x00000000',
                              'data_access_mask0' => '0x7fffffff',
                              'data_access_mask4' => '0xffffffff',
                              'data_access_addr1' => '0xc0000000',
                              'inst_access_enable7' => '0x0',
                              'inst_access_mask1' => '0x3fffffff',
                              'inst_access_enable1' => '1',
                              'data_access_enable3' => '1',
                              'data_access_enable7' => '0x0',
                              'data_access_mask1' => '0x3fffffff',
                              'data_access_enable1' => '1',
                              'inst_access_enable3' => '1',
                              'inst_access_addr1' => '0xc0000000',
                              'data_access_mask5' => '0xffffffff',
                              'data_access_addr3' => '0x80000000',
                              'inst_access_addr6' => '0x00000000',
                              'data_access_addr2' => '0xa0000000',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_mask3' => '0x0fffffff',
                              'inst_access_addr5' => '0x00000000',
                              'inst_access_mask7' => '0xffffffff',
                              'inst_access_mask2' => '0x1fffffff',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_mask3' => '0x0fffffff',
                              'data_access_addr5' => '0x00000000',
                              'data_access_mask7' => '0xffffffff',
                              'data_access_mask2' => '0x1fffffff',
                              'inst_access_mask6' => '0xffffffff',
                              'inst_access_mask5' => '0xffffffff',
                              'inst_access_addr3' => '0x80000000',
                              'data_access_addr6' => '0x00000000',
                              'inst_access_addr2' => '0xa0000000',
                              'inst_access_addr7' => '0x00000000'
                            },
            'iccm' => {
                        'iccm_num_banks_4' => '',
                        'iccm_sadr' => '0xee000000',
                        'iccm_offset' => '0xe000000',
                        'iccm_region' => '0xe',
                        'iccm_index_bits' => 12,
                        'iccm_enable' => 1,
                        'iccm_size' => 64,
                        'iccm_bank_hi' => 3,
                        'iccm_reserved' => '0x1000',
                        'iccm_rows' => '4096',
                        'iccm_bank_index_lo' => 4,
                        'iccm_bank_bits' => 2,
                        'iccm_data_cell' => 'ram_4096x39',
                        'iccm_bits' => 16,
                        'iccm_size_64' => '',
                        'iccm_num_banks' => '4',
                        'iccm_eadr' => '0xee00ffff'
                      },
            'harts' => 1,
            'reset_vec' => '0x80000000',
            'bus' => {
                       'bus_prty_default' => '3',
                       'ifu_bus_prty' => '2',
                       'ifu_bus_id' => '1',
                       'dma_bus_tag' => 1,
                       'lsu_bus_tag' => 3,
                       'sb_bus_tag' => 1,
                       'ifu_bus_tag' => '3',
                       'lsu_bus_id' => '1',
                       'dma_bus_prty' => '2',
                       'lsu_bus_prty' => '2',
                       'dma_bus_id' => '1',
                       'sb_bus_prty' => '2',
                       'sb_bus_id' => '1'
                     },
            'tec_rv_icg' => 'clockhdr',
            'testbench' => {
                             'ext_datawidth' => '64',
                             'CPU_TOP' => '`RV_TOP.quasar',
                             'lderr_rollback' => '1',
                             'RV_TOP' => '`TOP.rvtop',
                             'ext_addrwidth' => '32',
                             'clock_period' => '100',
                             'build_axi4' => 1,
                             'SDVT_AHB' => '1',
                             'sterr_rollback' => '0',
                             'assert_on' => '',
                             'TOP' => 'tb_top',
                             'build_axi_native' => 1
                           },
            'even_odd_trigger_chains' => 'true',
            'dccm' => {
                        'dccm_width_bits' => 2,
                        'dccm_index_bits' => 12,
                        'dccm_sadr' => '0xf0040000',
                        'dccm_num_banks_4' => '',
                        'dccm_offset' => '0x40000',
                        'dccm_fdata_width' => 39,
                        'dccm_region' => '0xf',
                        'dccm_reserved' => '0x1400',
                        'dccm_size' => 64,
                        'dccm_enable' => '1',
                        'dccm_data_width' => 32,
                        'dccm_bits' => 16,
                        'dccm_rows' => '4096',
                        'dccm_byte_width' => '4',
                        'dccm_bank_bits' => 2,
                        'dccm_data_cell' => 'ram_4096x39',
                        'dccm_ecc_width' => 7,
                        'dccm_eadr' => '0xf004ffff',
                        'dccm_size_64' => '',
                        'dccm_num_banks' => '4',
                        'lsu_sb_bits' => 16
                      }
          );
1;
