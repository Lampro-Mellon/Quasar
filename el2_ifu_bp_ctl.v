module el2_ifu_bp_ctl(
  input          clock,
  input          reset,
  input          io_active_clk,
  input          io_ic_hit_f,
  input  [30:0]  io_ifc_fetch_addr_f,
  input          io_ifc_fetch_req_f,
  input          io_dec_tlu_br0_r_pkt_valid,
  input  [1:0]   io_dec_tlu_br0_r_pkt_hist,
  input          io_dec_tlu_br0_r_pkt_br_error,
  input          io_dec_tlu_br0_r_pkt_br_start_error,
  input          io_dec_tlu_br0_r_pkt_way,
  input          io_dec_tlu_br0_r_pkt_middle,
  input  [7:0]   io_exu_i0_br_fghr_r,
  input  [7:0]   io_exu_i0_br_index_r,
  input          io_dec_tlu_flush_lower_wb,
  input          io_dec_tlu_flush_leak_one_wb,
  input          io_dec_tlu_bpred_disable,
  input          io_exu_mp_pkt_misp,
  input          io_exu_mp_pkt_ataken,
  input          io_exu_mp_pkt_boffset,
  input          io_exu_mp_pkt_pc4,
  input  [1:0]   io_exu_mp_pkt_hist,
  input  [11:0]  io_exu_mp_pkt_toffset,
  input          io_exu_mp_pkt_valid,
  input          io_exu_mp_pkt_br_error,
  input          io_exu_mp_pkt_br_start_error,
  input  [31:0]  io_exu_mp_pkt_prett,
  input          io_exu_mp_pkt_pcall,
  input          io_exu_mp_pkt_pret,
  input          io_exu_mp_pkt_pja,
  input          io_exu_mp_pkt_way,
  input  [7:0]   io_exu_mp_eghr,
  input  [7:0]   io_exu_mp_fghr,
  input  [7:0]   io_exu_mp_index,
  input  [4:0]   io_exu_mp_btag,
  input          io_exu_flush_final,
  output         io_ifu_bp_hit_taken_f,
  output [30:0]  io_ifu_bp_btb_target_f,
  output         io_ifu_bp_inst_mask_f,
  output [7:0]   io_ifu_bp_fghr_f,
  output [1:0]   io_ifu_bp_way_f,
  output [1:0]   io_ifu_bp_ret_f,
  output [1:0]   io_ifu_bp_hist1_f,
  output [1:0]   io_ifu_bp_hist0_f,
  output [1:0]   io_ifu_bp_pc4_f,
  output [1:0]   io_ifu_bp_valid_f,
  output [11:0]  io_ifu_bp_poffset_f,
  output [255:0] io_test1,
  output [1:0]   io_test2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [255:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
`endif // RANDOMIZE_REG_INIT
  wire  _T_40 = io_dec_tlu_flush_leak_one_wb & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 133:47]
  reg  leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 127:30]
  wire  _T_41 = leak_one_f_d1 & io_dec_tlu_flush_lower_wb; // @[el2_ifu_bp_ctl.scala 133:93]
  wire  leak_one_f = _T_40 | _T_41; // @[el2_ifu_bp_ctl.scala 133:76]
  wire  _T = ~leak_one_f; // @[el2_ifu_bp_ctl.scala 72:46]
  wire  exu_mp_valid = io_exu_mp_pkt_misp & _T; // @[el2_ifu_bp_ctl.scala 72:44]
  wire  dec_tlu_error_wb = io_dec_tlu_br0_r_pkt_br_start_error | io_dec_tlu_br0_r_pkt_br_error; // @[el2_ifu_bp_ctl.scala 94:50]
  wire [7:0] _T_4 = io_ifc_fetch_addr_f[8:1] ^ io_ifc_fetch_addr_f[16:9]; // @[el2_lib.scala 185:46]
  wire [7:0] btb_rd_addr_f = _T_4 ^ io_ifc_fetch_addr_f[24:17]; // @[el2_lib.scala 185:84]
  wire [29:0] fetch_addr_p1_f = io_ifc_fetch_addr_f[30:1] + 30'h1; // @[el2_ifu_bp_ctl.scala 102:51]
  wire [30:0] _T_8 = {fetch_addr_p1_f,1'h0}; // @[Cat.scala 29:58]
  wire [7:0] _T_11 = _T_8[8:1] ^ _T_8[16:9]; // @[el2_lib.scala 185:46]
  wire [7:0] btb_rd_addr_p1_f = _T_11 ^ _T_8[24:17]; // @[el2_lib.scala 185:84]
  wire  _T_143 = ~io_ifc_fetch_addr_f[0]; // @[el2_ifu_bp_ctl.scala 179:40]
  wire  _T_2110 = btb_rd_addr_f == 8'h0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_2622 = _T_2110 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_2112 = btb_rd_addr_f == 8'h1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_2623 = _T_2112 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2878 = _T_2622 | _T_2623; // @[Mux.scala 27:72]
  wire  _T_2114 = btb_rd_addr_f == 8'h2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_2624 = _T_2114 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2879 = _T_2878 | _T_2624; // @[Mux.scala 27:72]
  wire  _T_2116 = btb_rd_addr_f == 8'h3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_2625 = _T_2116 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2880 = _T_2879 | _T_2625; // @[Mux.scala 27:72]
  wire  _T_2118 = btb_rd_addr_f == 8'h4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_2626 = _T_2118 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2881 = _T_2880 | _T_2626; // @[Mux.scala 27:72]
  wire  _T_2120 = btb_rd_addr_f == 8'h5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_2627 = _T_2120 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2882 = _T_2881 | _T_2627; // @[Mux.scala 27:72]
  wire  _T_2122 = btb_rd_addr_f == 8'h6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_2628 = _T_2122 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2883 = _T_2882 | _T_2628; // @[Mux.scala 27:72]
  wire  _T_2124 = btb_rd_addr_f == 8'h7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_2629 = _T_2124 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2884 = _T_2883 | _T_2629; // @[Mux.scala 27:72]
  wire  _T_2126 = btb_rd_addr_f == 8'h8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_2630 = _T_2126 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2885 = _T_2884 | _T_2630; // @[Mux.scala 27:72]
  wire  _T_2128 = btb_rd_addr_f == 8'h9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_2631 = _T_2128 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2886 = _T_2885 | _T_2631; // @[Mux.scala 27:72]
  wire  _T_2130 = btb_rd_addr_f == 8'ha; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_2632 = _T_2130 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2887 = _T_2886 | _T_2632; // @[Mux.scala 27:72]
  wire  _T_2132 = btb_rd_addr_f == 8'hb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_2633 = _T_2132 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2888 = _T_2887 | _T_2633; // @[Mux.scala 27:72]
  wire  _T_2134 = btb_rd_addr_f == 8'hc; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_2634 = _T_2134 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2889 = _T_2888 | _T_2634; // @[Mux.scala 27:72]
  wire  _T_2136 = btb_rd_addr_f == 8'hd; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_2635 = _T_2136 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2890 = _T_2889 | _T_2635; // @[Mux.scala 27:72]
  wire  _T_2138 = btb_rd_addr_f == 8'he; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_2636 = _T_2138 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2891 = _T_2890 | _T_2636; // @[Mux.scala 27:72]
  wire  _T_2140 = btb_rd_addr_f == 8'hf; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_2637 = _T_2140 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2892 = _T_2891 | _T_2637; // @[Mux.scala 27:72]
  wire  _T_2142 = btb_rd_addr_f == 8'h10; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_16; // @[Reg.scala 27:20]
  wire [21:0] _T_2638 = _T_2142 ? btb_bank0_rd_data_way0_out_16 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2893 = _T_2892 | _T_2638; // @[Mux.scala 27:72]
  wire  _T_2144 = btb_rd_addr_f == 8'h11; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_17; // @[Reg.scala 27:20]
  wire [21:0] _T_2639 = _T_2144 ? btb_bank0_rd_data_way0_out_17 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2894 = _T_2893 | _T_2639; // @[Mux.scala 27:72]
  wire  _T_2146 = btb_rd_addr_f == 8'h12; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_18; // @[Reg.scala 27:20]
  wire [21:0] _T_2640 = _T_2146 ? btb_bank0_rd_data_way0_out_18 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2895 = _T_2894 | _T_2640; // @[Mux.scala 27:72]
  wire  _T_2148 = btb_rd_addr_f == 8'h13; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_19; // @[Reg.scala 27:20]
  wire [21:0] _T_2641 = _T_2148 ? btb_bank0_rd_data_way0_out_19 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2896 = _T_2895 | _T_2641; // @[Mux.scala 27:72]
  wire  _T_2150 = btb_rd_addr_f == 8'h14; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_20; // @[Reg.scala 27:20]
  wire [21:0] _T_2642 = _T_2150 ? btb_bank0_rd_data_way0_out_20 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2897 = _T_2896 | _T_2642; // @[Mux.scala 27:72]
  wire  _T_2152 = btb_rd_addr_f == 8'h15; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_21; // @[Reg.scala 27:20]
  wire [21:0] _T_2643 = _T_2152 ? btb_bank0_rd_data_way0_out_21 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2898 = _T_2897 | _T_2643; // @[Mux.scala 27:72]
  wire  _T_2154 = btb_rd_addr_f == 8'h16; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_22; // @[Reg.scala 27:20]
  wire [21:0] _T_2644 = _T_2154 ? btb_bank0_rd_data_way0_out_22 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2899 = _T_2898 | _T_2644; // @[Mux.scala 27:72]
  wire  _T_2156 = btb_rd_addr_f == 8'h17; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_23; // @[Reg.scala 27:20]
  wire [21:0] _T_2645 = _T_2156 ? btb_bank0_rd_data_way0_out_23 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2900 = _T_2899 | _T_2645; // @[Mux.scala 27:72]
  wire  _T_2158 = btb_rd_addr_f == 8'h18; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_24; // @[Reg.scala 27:20]
  wire [21:0] _T_2646 = _T_2158 ? btb_bank0_rd_data_way0_out_24 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2901 = _T_2900 | _T_2646; // @[Mux.scala 27:72]
  wire  _T_2160 = btb_rd_addr_f == 8'h19; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_25; // @[Reg.scala 27:20]
  wire [21:0] _T_2647 = _T_2160 ? btb_bank0_rd_data_way0_out_25 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2902 = _T_2901 | _T_2647; // @[Mux.scala 27:72]
  wire  _T_2162 = btb_rd_addr_f == 8'h1a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_26; // @[Reg.scala 27:20]
  wire [21:0] _T_2648 = _T_2162 ? btb_bank0_rd_data_way0_out_26 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2903 = _T_2902 | _T_2648; // @[Mux.scala 27:72]
  wire  _T_2164 = btb_rd_addr_f == 8'h1b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_27; // @[Reg.scala 27:20]
  wire [21:0] _T_2649 = _T_2164 ? btb_bank0_rd_data_way0_out_27 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2904 = _T_2903 | _T_2649; // @[Mux.scala 27:72]
  wire  _T_2166 = btb_rd_addr_f == 8'h1c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_28; // @[Reg.scala 27:20]
  wire [21:0] _T_2650 = _T_2166 ? btb_bank0_rd_data_way0_out_28 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2905 = _T_2904 | _T_2650; // @[Mux.scala 27:72]
  wire  _T_2168 = btb_rd_addr_f == 8'h1d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_29; // @[Reg.scala 27:20]
  wire [21:0] _T_2651 = _T_2168 ? btb_bank0_rd_data_way0_out_29 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2906 = _T_2905 | _T_2651; // @[Mux.scala 27:72]
  wire  _T_2170 = btb_rd_addr_f == 8'h1e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_30; // @[Reg.scala 27:20]
  wire [21:0] _T_2652 = _T_2170 ? btb_bank0_rd_data_way0_out_30 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2907 = _T_2906 | _T_2652; // @[Mux.scala 27:72]
  wire  _T_2172 = btb_rd_addr_f == 8'h1f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_31; // @[Reg.scala 27:20]
  wire [21:0] _T_2653 = _T_2172 ? btb_bank0_rd_data_way0_out_31 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2908 = _T_2907 | _T_2653; // @[Mux.scala 27:72]
  wire  _T_2174 = btb_rd_addr_f == 8'h20; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_32; // @[Reg.scala 27:20]
  wire [21:0] _T_2654 = _T_2174 ? btb_bank0_rd_data_way0_out_32 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2909 = _T_2908 | _T_2654; // @[Mux.scala 27:72]
  wire  _T_2176 = btb_rd_addr_f == 8'h21; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_33; // @[Reg.scala 27:20]
  wire [21:0] _T_2655 = _T_2176 ? btb_bank0_rd_data_way0_out_33 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2910 = _T_2909 | _T_2655; // @[Mux.scala 27:72]
  wire  _T_2178 = btb_rd_addr_f == 8'h22; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_34; // @[Reg.scala 27:20]
  wire [21:0] _T_2656 = _T_2178 ? btb_bank0_rd_data_way0_out_34 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2911 = _T_2910 | _T_2656; // @[Mux.scala 27:72]
  wire  _T_2180 = btb_rd_addr_f == 8'h23; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_35; // @[Reg.scala 27:20]
  wire [21:0] _T_2657 = _T_2180 ? btb_bank0_rd_data_way0_out_35 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2912 = _T_2911 | _T_2657; // @[Mux.scala 27:72]
  wire  _T_2182 = btb_rd_addr_f == 8'h24; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_36; // @[Reg.scala 27:20]
  wire [21:0] _T_2658 = _T_2182 ? btb_bank0_rd_data_way0_out_36 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2913 = _T_2912 | _T_2658; // @[Mux.scala 27:72]
  wire  _T_2184 = btb_rd_addr_f == 8'h25; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_37; // @[Reg.scala 27:20]
  wire [21:0] _T_2659 = _T_2184 ? btb_bank0_rd_data_way0_out_37 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2914 = _T_2913 | _T_2659; // @[Mux.scala 27:72]
  wire  _T_2186 = btb_rd_addr_f == 8'h26; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_38; // @[Reg.scala 27:20]
  wire [21:0] _T_2660 = _T_2186 ? btb_bank0_rd_data_way0_out_38 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2915 = _T_2914 | _T_2660; // @[Mux.scala 27:72]
  wire  _T_2188 = btb_rd_addr_f == 8'h27; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_39; // @[Reg.scala 27:20]
  wire [21:0] _T_2661 = _T_2188 ? btb_bank0_rd_data_way0_out_39 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2916 = _T_2915 | _T_2661; // @[Mux.scala 27:72]
  wire  _T_2190 = btb_rd_addr_f == 8'h28; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_40; // @[Reg.scala 27:20]
  wire [21:0] _T_2662 = _T_2190 ? btb_bank0_rd_data_way0_out_40 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2917 = _T_2916 | _T_2662; // @[Mux.scala 27:72]
  wire  _T_2192 = btb_rd_addr_f == 8'h29; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_41; // @[Reg.scala 27:20]
  wire [21:0] _T_2663 = _T_2192 ? btb_bank0_rd_data_way0_out_41 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2918 = _T_2917 | _T_2663; // @[Mux.scala 27:72]
  wire  _T_2194 = btb_rd_addr_f == 8'h2a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_42; // @[Reg.scala 27:20]
  wire [21:0] _T_2664 = _T_2194 ? btb_bank0_rd_data_way0_out_42 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2919 = _T_2918 | _T_2664; // @[Mux.scala 27:72]
  wire  _T_2196 = btb_rd_addr_f == 8'h2b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_43; // @[Reg.scala 27:20]
  wire [21:0] _T_2665 = _T_2196 ? btb_bank0_rd_data_way0_out_43 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2920 = _T_2919 | _T_2665; // @[Mux.scala 27:72]
  wire  _T_2198 = btb_rd_addr_f == 8'h2c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_44; // @[Reg.scala 27:20]
  wire [21:0] _T_2666 = _T_2198 ? btb_bank0_rd_data_way0_out_44 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2921 = _T_2920 | _T_2666; // @[Mux.scala 27:72]
  wire  _T_2200 = btb_rd_addr_f == 8'h2d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_45; // @[Reg.scala 27:20]
  wire [21:0] _T_2667 = _T_2200 ? btb_bank0_rd_data_way0_out_45 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2922 = _T_2921 | _T_2667; // @[Mux.scala 27:72]
  wire  _T_2202 = btb_rd_addr_f == 8'h2e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_46; // @[Reg.scala 27:20]
  wire [21:0] _T_2668 = _T_2202 ? btb_bank0_rd_data_way0_out_46 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2923 = _T_2922 | _T_2668; // @[Mux.scala 27:72]
  wire  _T_2204 = btb_rd_addr_f == 8'h2f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_47; // @[Reg.scala 27:20]
  wire [21:0] _T_2669 = _T_2204 ? btb_bank0_rd_data_way0_out_47 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2924 = _T_2923 | _T_2669; // @[Mux.scala 27:72]
  wire  _T_2206 = btb_rd_addr_f == 8'h30; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_48; // @[Reg.scala 27:20]
  wire [21:0] _T_2670 = _T_2206 ? btb_bank0_rd_data_way0_out_48 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2925 = _T_2924 | _T_2670; // @[Mux.scala 27:72]
  wire  _T_2208 = btb_rd_addr_f == 8'h31; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_49; // @[Reg.scala 27:20]
  wire [21:0] _T_2671 = _T_2208 ? btb_bank0_rd_data_way0_out_49 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2926 = _T_2925 | _T_2671; // @[Mux.scala 27:72]
  wire  _T_2210 = btb_rd_addr_f == 8'h32; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_50; // @[Reg.scala 27:20]
  wire [21:0] _T_2672 = _T_2210 ? btb_bank0_rd_data_way0_out_50 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2927 = _T_2926 | _T_2672; // @[Mux.scala 27:72]
  wire  _T_2212 = btb_rd_addr_f == 8'h33; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_51; // @[Reg.scala 27:20]
  wire [21:0] _T_2673 = _T_2212 ? btb_bank0_rd_data_way0_out_51 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2928 = _T_2927 | _T_2673; // @[Mux.scala 27:72]
  wire  _T_2214 = btb_rd_addr_f == 8'h34; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_52; // @[Reg.scala 27:20]
  wire [21:0] _T_2674 = _T_2214 ? btb_bank0_rd_data_way0_out_52 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2929 = _T_2928 | _T_2674; // @[Mux.scala 27:72]
  wire  _T_2216 = btb_rd_addr_f == 8'h35; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_53; // @[Reg.scala 27:20]
  wire [21:0] _T_2675 = _T_2216 ? btb_bank0_rd_data_way0_out_53 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2930 = _T_2929 | _T_2675; // @[Mux.scala 27:72]
  wire  _T_2218 = btb_rd_addr_f == 8'h36; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_54; // @[Reg.scala 27:20]
  wire [21:0] _T_2676 = _T_2218 ? btb_bank0_rd_data_way0_out_54 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2931 = _T_2930 | _T_2676; // @[Mux.scala 27:72]
  wire  _T_2220 = btb_rd_addr_f == 8'h37; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_55; // @[Reg.scala 27:20]
  wire [21:0] _T_2677 = _T_2220 ? btb_bank0_rd_data_way0_out_55 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2932 = _T_2931 | _T_2677; // @[Mux.scala 27:72]
  wire  _T_2222 = btb_rd_addr_f == 8'h38; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_56; // @[Reg.scala 27:20]
  wire [21:0] _T_2678 = _T_2222 ? btb_bank0_rd_data_way0_out_56 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2933 = _T_2932 | _T_2678; // @[Mux.scala 27:72]
  wire  _T_2224 = btb_rd_addr_f == 8'h39; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_57; // @[Reg.scala 27:20]
  wire [21:0] _T_2679 = _T_2224 ? btb_bank0_rd_data_way0_out_57 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2934 = _T_2933 | _T_2679; // @[Mux.scala 27:72]
  wire  _T_2226 = btb_rd_addr_f == 8'h3a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_58; // @[Reg.scala 27:20]
  wire [21:0] _T_2680 = _T_2226 ? btb_bank0_rd_data_way0_out_58 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2935 = _T_2934 | _T_2680; // @[Mux.scala 27:72]
  wire  _T_2228 = btb_rd_addr_f == 8'h3b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_59; // @[Reg.scala 27:20]
  wire [21:0] _T_2681 = _T_2228 ? btb_bank0_rd_data_way0_out_59 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2936 = _T_2935 | _T_2681; // @[Mux.scala 27:72]
  wire  _T_2230 = btb_rd_addr_f == 8'h3c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_60; // @[Reg.scala 27:20]
  wire [21:0] _T_2682 = _T_2230 ? btb_bank0_rd_data_way0_out_60 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2937 = _T_2936 | _T_2682; // @[Mux.scala 27:72]
  wire  _T_2232 = btb_rd_addr_f == 8'h3d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_61; // @[Reg.scala 27:20]
  wire [21:0] _T_2683 = _T_2232 ? btb_bank0_rd_data_way0_out_61 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2938 = _T_2937 | _T_2683; // @[Mux.scala 27:72]
  wire  _T_2234 = btb_rd_addr_f == 8'h3e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_62; // @[Reg.scala 27:20]
  wire [21:0] _T_2684 = _T_2234 ? btb_bank0_rd_data_way0_out_62 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2939 = _T_2938 | _T_2684; // @[Mux.scala 27:72]
  wire  _T_2236 = btb_rd_addr_f == 8'h3f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_63; // @[Reg.scala 27:20]
  wire [21:0] _T_2685 = _T_2236 ? btb_bank0_rd_data_way0_out_63 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2940 = _T_2939 | _T_2685; // @[Mux.scala 27:72]
  wire  _T_2238 = btb_rd_addr_f == 8'h40; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_64; // @[Reg.scala 27:20]
  wire [21:0] _T_2686 = _T_2238 ? btb_bank0_rd_data_way0_out_64 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2941 = _T_2940 | _T_2686; // @[Mux.scala 27:72]
  wire  _T_2240 = btb_rd_addr_f == 8'h41; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_65; // @[Reg.scala 27:20]
  wire [21:0] _T_2687 = _T_2240 ? btb_bank0_rd_data_way0_out_65 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2942 = _T_2941 | _T_2687; // @[Mux.scala 27:72]
  wire  _T_2242 = btb_rd_addr_f == 8'h42; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_66; // @[Reg.scala 27:20]
  wire [21:0] _T_2688 = _T_2242 ? btb_bank0_rd_data_way0_out_66 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2943 = _T_2942 | _T_2688; // @[Mux.scala 27:72]
  wire  _T_2244 = btb_rd_addr_f == 8'h43; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_67; // @[Reg.scala 27:20]
  wire [21:0] _T_2689 = _T_2244 ? btb_bank0_rd_data_way0_out_67 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2944 = _T_2943 | _T_2689; // @[Mux.scala 27:72]
  wire  _T_2246 = btb_rd_addr_f == 8'h44; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_68; // @[Reg.scala 27:20]
  wire [21:0] _T_2690 = _T_2246 ? btb_bank0_rd_data_way0_out_68 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2945 = _T_2944 | _T_2690; // @[Mux.scala 27:72]
  wire  _T_2248 = btb_rd_addr_f == 8'h45; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_69; // @[Reg.scala 27:20]
  wire [21:0] _T_2691 = _T_2248 ? btb_bank0_rd_data_way0_out_69 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2946 = _T_2945 | _T_2691; // @[Mux.scala 27:72]
  wire  _T_2250 = btb_rd_addr_f == 8'h46; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_70; // @[Reg.scala 27:20]
  wire [21:0] _T_2692 = _T_2250 ? btb_bank0_rd_data_way0_out_70 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2947 = _T_2946 | _T_2692; // @[Mux.scala 27:72]
  wire  _T_2252 = btb_rd_addr_f == 8'h47; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_71; // @[Reg.scala 27:20]
  wire [21:0] _T_2693 = _T_2252 ? btb_bank0_rd_data_way0_out_71 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2948 = _T_2947 | _T_2693; // @[Mux.scala 27:72]
  wire  _T_2254 = btb_rd_addr_f == 8'h48; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_72; // @[Reg.scala 27:20]
  wire [21:0] _T_2694 = _T_2254 ? btb_bank0_rd_data_way0_out_72 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2949 = _T_2948 | _T_2694; // @[Mux.scala 27:72]
  wire  _T_2256 = btb_rd_addr_f == 8'h49; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_73; // @[Reg.scala 27:20]
  wire [21:0] _T_2695 = _T_2256 ? btb_bank0_rd_data_way0_out_73 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2950 = _T_2949 | _T_2695; // @[Mux.scala 27:72]
  wire  _T_2258 = btb_rd_addr_f == 8'h4a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_74; // @[Reg.scala 27:20]
  wire [21:0] _T_2696 = _T_2258 ? btb_bank0_rd_data_way0_out_74 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2951 = _T_2950 | _T_2696; // @[Mux.scala 27:72]
  wire  _T_2260 = btb_rd_addr_f == 8'h4b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_75; // @[Reg.scala 27:20]
  wire [21:0] _T_2697 = _T_2260 ? btb_bank0_rd_data_way0_out_75 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2952 = _T_2951 | _T_2697; // @[Mux.scala 27:72]
  wire  _T_2262 = btb_rd_addr_f == 8'h4c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_76; // @[Reg.scala 27:20]
  wire [21:0] _T_2698 = _T_2262 ? btb_bank0_rd_data_way0_out_76 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2953 = _T_2952 | _T_2698; // @[Mux.scala 27:72]
  wire  _T_2264 = btb_rd_addr_f == 8'h4d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_77; // @[Reg.scala 27:20]
  wire [21:0] _T_2699 = _T_2264 ? btb_bank0_rd_data_way0_out_77 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2954 = _T_2953 | _T_2699; // @[Mux.scala 27:72]
  wire  _T_2266 = btb_rd_addr_f == 8'h4e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_78; // @[Reg.scala 27:20]
  wire [21:0] _T_2700 = _T_2266 ? btb_bank0_rd_data_way0_out_78 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2955 = _T_2954 | _T_2700; // @[Mux.scala 27:72]
  wire  _T_2268 = btb_rd_addr_f == 8'h4f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_79; // @[Reg.scala 27:20]
  wire [21:0] _T_2701 = _T_2268 ? btb_bank0_rd_data_way0_out_79 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2956 = _T_2955 | _T_2701; // @[Mux.scala 27:72]
  wire  _T_2270 = btb_rd_addr_f == 8'h50; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_80; // @[Reg.scala 27:20]
  wire [21:0] _T_2702 = _T_2270 ? btb_bank0_rd_data_way0_out_80 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2957 = _T_2956 | _T_2702; // @[Mux.scala 27:72]
  wire  _T_2272 = btb_rd_addr_f == 8'h51; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_81; // @[Reg.scala 27:20]
  wire [21:0] _T_2703 = _T_2272 ? btb_bank0_rd_data_way0_out_81 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2958 = _T_2957 | _T_2703; // @[Mux.scala 27:72]
  wire  _T_2274 = btb_rd_addr_f == 8'h52; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_82; // @[Reg.scala 27:20]
  wire [21:0] _T_2704 = _T_2274 ? btb_bank0_rd_data_way0_out_82 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2959 = _T_2958 | _T_2704; // @[Mux.scala 27:72]
  wire  _T_2276 = btb_rd_addr_f == 8'h53; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_83; // @[Reg.scala 27:20]
  wire [21:0] _T_2705 = _T_2276 ? btb_bank0_rd_data_way0_out_83 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2960 = _T_2959 | _T_2705; // @[Mux.scala 27:72]
  wire  _T_2278 = btb_rd_addr_f == 8'h54; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_84; // @[Reg.scala 27:20]
  wire [21:0] _T_2706 = _T_2278 ? btb_bank0_rd_data_way0_out_84 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2961 = _T_2960 | _T_2706; // @[Mux.scala 27:72]
  wire  _T_2280 = btb_rd_addr_f == 8'h55; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_85; // @[Reg.scala 27:20]
  wire [21:0] _T_2707 = _T_2280 ? btb_bank0_rd_data_way0_out_85 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2962 = _T_2961 | _T_2707; // @[Mux.scala 27:72]
  wire  _T_2282 = btb_rd_addr_f == 8'h56; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_86; // @[Reg.scala 27:20]
  wire [21:0] _T_2708 = _T_2282 ? btb_bank0_rd_data_way0_out_86 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2963 = _T_2962 | _T_2708; // @[Mux.scala 27:72]
  wire  _T_2284 = btb_rd_addr_f == 8'h57; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_87; // @[Reg.scala 27:20]
  wire [21:0] _T_2709 = _T_2284 ? btb_bank0_rd_data_way0_out_87 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2964 = _T_2963 | _T_2709; // @[Mux.scala 27:72]
  wire  _T_2286 = btb_rd_addr_f == 8'h58; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_88; // @[Reg.scala 27:20]
  wire [21:0] _T_2710 = _T_2286 ? btb_bank0_rd_data_way0_out_88 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2965 = _T_2964 | _T_2710; // @[Mux.scala 27:72]
  wire  _T_2288 = btb_rd_addr_f == 8'h59; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_89; // @[Reg.scala 27:20]
  wire [21:0] _T_2711 = _T_2288 ? btb_bank0_rd_data_way0_out_89 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2966 = _T_2965 | _T_2711; // @[Mux.scala 27:72]
  wire  _T_2290 = btb_rd_addr_f == 8'h5a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_90; // @[Reg.scala 27:20]
  wire [21:0] _T_2712 = _T_2290 ? btb_bank0_rd_data_way0_out_90 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2967 = _T_2966 | _T_2712; // @[Mux.scala 27:72]
  wire  _T_2292 = btb_rd_addr_f == 8'h5b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_91; // @[Reg.scala 27:20]
  wire [21:0] _T_2713 = _T_2292 ? btb_bank0_rd_data_way0_out_91 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2968 = _T_2967 | _T_2713; // @[Mux.scala 27:72]
  wire  _T_2294 = btb_rd_addr_f == 8'h5c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_92; // @[Reg.scala 27:20]
  wire [21:0] _T_2714 = _T_2294 ? btb_bank0_rd_data_way0_out_92 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2969 = _T_2968 | _T_2714; // @[Mux.scala 27:72]
  wire  _T_2296 = btb_rd_addr_f == 8'h5d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_93; // @[Reg.scala 27:20]
  wire [21:0] _T_2715 = _T_2296 ? btb_bank0_rd_data_way0_out_93 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2970 = _T_2969 | _T_2715; // @[Mux.scala 27:72]
  wire  _T_2298 = btb_rd_addr_f == 8'h5e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_94; // @[Reg.scala 27:20]
  wire [21:0] _T_2716 = _T_2298 ? btb_bank0_rd_data_way0_out_94 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2971 = _T_2970 | _T_2716; // @[Mux.scala 27:72]
  wire  _T_2300 = btb_rd_addr_f == 8'h5f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_95; // @[Reg.scala 27:20]
  wire [21:0] _T_2717 = _T_2300 ? btb_bank0_rd_data_way0_out_95 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2972 = _T_2971 | _T_2717; // @[Mux.scala 27:72]
  wire  _T_2302 = btb_rd_addr_f == 8'h60; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_96; // @[Reg.scala 27:20]
  wire [21:0] _T_2718 = _T_2302 ? btb_bank0_rd_data_way0_out_96 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2973 = _T_2972 | _T_2718; // @[Mux.scala 27:72]
  wire  _T_2304 = btb_rd_addr_f == 8'h61; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_97; // @[Reg.scala 27:20]
  wire [21:0] _T_2719 = _T_2304 ? btb_bank0_rd_data_way0_out_97 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2974 = _T_2973 | _T_2719; // @[Mux.scala 27:72]
  wire  _T_2306 = btb_rd_addr_f == 8'h62; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_98; // @[Reg.scala 27:20]
  wire [21:0] _T_2720 = _T_2306 ? btb_bank0_rd_data_way0_out_98 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2975 = _T_2974 | _T_2720; // @[Mux.scala 27:72]
  wire  _T_2308 = btb_rd_addr_f == 8'h63; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_99; // @[Reg.scala 27:20]
  wire [21:0] _T_2721 = _T_2308 ? btb_bank0_rd_data_way0_out_99 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2976 = _T_2975 | _T_2721; // @[Mux.scala 27:72]
  wire  _T_2310 = btb_rd_addr_f == 8'h64; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_100; // @[Reg.scala 27:20]
  wire [21:0] _T_2722 = _T_2310 ? btb_bank0_rd_data_way0_out_100 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2977 = _T_2976 | _T_2722; // @[Mux.scala 27:72]
  wire  _T_2312 = btb_rd_addr_f == 8'h65; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_101; // @[Reg.scala 27:20]
  wire [21:0] _T_2723 = _T_2312 ? btb_bank0_rd_data_way0_out_101 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2978 = _T_2977 | _T_2723; // @[Mux.scala 27:72]
  wire  _T_2314 = btb_rd_addr_f == 8'h66; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_102; // @[Reg.scala 27:20]
  wire [21:0] _T_2724 = _T_2314 ? btb_bank0_rd_data_way0_out_102 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2979 = _T_2978 | _T_2724; // @[Mux.scala 27:72]
  wire  _T_2316 = btb_rd_addr_f == 8'h67; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_103; // @[Reg.scala 27:20]
  wire [21:0] _T_2725 = _T_2316 ? btb_bank0_rd_data_way0_out_103 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2980 = _T_2979 | _T_2725; // @[Mux.scala 27:72]
  wire  _T_2318 = btb_rd_addr_f == 8'h68; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_104; // @[Reg.scala 27:20]
  wire [21:0] _T_2726 = _T_2318 ? btb_bank0_rd_data_way0_out_104 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2981 = _T_2980 | _T_2726; // @[Mux.scala 27:72]
  wire  _T_2320 = btb_rd_addr_f == 8'h69; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_105; // @[Reg.scala 27:20]
  wire [21:0] _T_2727 = _T_2320 ? btb_bank0_rd_data_way0_out_105 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2982 = _T_2981 | _T_2727; // @[Mux.scala 27:72]
  wire  _T_2322 = btb_rd_addr_f == 8'h6a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_106; // @[Reg.scala 27:20]
  wire [21:0] _T_2728 = _T_2322 ? btb_bank0_rd_data_way0_out_106 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2983 = _T_2982 | _T_2728; // @[Mux.scala 27:72]
  wire  _T_2324 = btb_rd_addr_f == 8'h6b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_107; // @[Reg.scala 27:20]
  wire [21:0] _T_2729 = _T_2324 ? btb_bank0_rd_data_way0_out_107 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2984 = _T_2983 | _T_2729; // @[Mux.scala 27:72]
  wire  _T_2326 = btb_rd_addr_f == 8'h6c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_108; // @[Reg.scala 27:20]
  wire [21:0] _T_2730 = _T_2326 ? btb_bank0_rd_data_way0_out_108 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2985 = _T_2984 | _T_2730; // @[Mux.scala 27:72]
  wire  _T_2328 = btb_rd_addr_f == 8'h6d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_109; // @[Reg.scala 27:20]
  wire [21:0] _T_2731 = _T_2328 ? btb_bank0_rd_data_way0_out_109 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2986 = _T_2985 | _T_2731; // @[Mux.scala 27:72]
  wire  _T_2330 = btb_rd_addr_f == 8'h6e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_110; // @[Reg.scala 27:20]
  wire [21:0] _T_2732 = _T_2330 ? btb_bank0_rd_data_way0_out_110 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2987 = _T_2986 | _T_2732; // @[Mux.scala 27:72]
  wire  _T_2332 = btb_rd_addr_f == 8'h6f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_111; // @[Reg.scala 27:20]
  wire [21:0] _T_2733 = _T_2332 ? btb_bank0_rd_data_way0_out_111 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2988 = _T_2987 | _T_2733; // @[Mux.scala 27:72]
  wire  _T_2334 = btb_rd_addr_f == 8'h70; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_112; // @[Reg.scala 27:20]
  wire [21:0] _T_2734 = _T_2334 ? btb_bank0_rd_data_way0_out_112 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2989 = _T_2988 | _T_2734; // @[Mux.scala 27:72]
  wire  _T_2336 = btb_rd_addr_f == 8'h71; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_113; // @[Reg.scala 27:20]
  wire [21:0] _T_2735 = _T_2336 ? btb_bank0_rd_data_way0_out_113 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2990 = _T_2989 | _T_2735; // @[Mux.scala 27:72]
  wire  _T_2338 = btb_rd_addr_f == 8'h72; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_114; // @[Reg.scala 27:20]
  wire [21:0] _T_2736 = _T_2338 ? btb_bank0_rd_data_way0_out_114 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2991 = _T_2990 | _T_2736; // @[Mux.scala 27:72]
  wire  _T_2340 = btb_rd_addr_f == 8'h73; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_115; // @[Reg.scala 27:20]
  wire [21:0] _T_2737 = _T_2340 ? btb_bank0_rd_data_way0_out_115 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2992 = _T_2991 | _T_2737; // @[Mux.scala 27:72]
  wire  _T_2342 = btb_rd_addr_f == 8'h74; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_116; // @[Reg.scala 27:20]
  wire [21:0] _T_2738 = _T_2342 ? btb_bank0_rd_data_way0_out_116 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2993 = _T_2992 | _T_2738; // @[Mux.scala 27:72]
  wire  _T_2344 = btb_rd_addr_f == 8'h75; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_117; // @[Reg.scala 27:20]
  wire [21:0] _T_2739 = _T_2344 ? btb_bank0_rd_data_way0_out_117 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2994 = _T_2993 | _T_2739; // @[Mux.scala 27:72]
  wire  _T_2346 = btb_rd_addr_f == 8'h76; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_118; // @[Reg.scala 27:20]
  wire [21:0] _T_2740 = _T_2346 ? btb_bank0_rd_data_way0_out_118 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2995 = _T_2994 | _T_2740; // @[Mux.scala 27:72]
  wire  _T_2348 = btb_rd_addr_f == 8'h77; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_119; // @[Reg.scala 27:20]
  wire [21:0] _T_2741 = _T_2348 ? btb_bank0_rd_data_way0_out_119 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2996 = _T_2995 | _T_2741; // @[Mux.scala 27:72]
  wire  _T_2350 = btb_rd_addr_f == 8'h78; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_120; // @[Reg.scala 27:20]
  wire [21:0] _T_2742 = _T_2350 ? btb_bank0_rd_data_way0_out_120 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2997 = _T_2996 | _T_2742; // @[Mux.scala 27:72]
  wire  _T_2352 = btb_rd_addr_f == 8'h79; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_121; // @[Reg.scala 27:20]
  wire [21:0] _T_2743 = _T_2352 ? btb_bank0_rd_data_way0_out_121 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2998 = _T_2997 | _T_2743; // @[Mux.scala 27:72]
  wire  _T_2354 = btb_rd_addr_f == 8'h7a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_122; // @[Reg.scala 27:20]
  wire [21:0] _T_2744 = _T_2354 ? btb_bank0_rd_data_way0_out_122 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_2999 = _T_2998 | _T_2744; // @[Mux.scala 27:72]
  wire  _T_2356 = btb_rd_addr_f == 8'h7b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_123; // @[Reg.scala 27:20]
  wire [21:0] _T_2745 = _T_2356 ? btb_bank0_rd_data_way0_out_123 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3000 = _T_2999 | _T_2745; // @[Mux.scala 27:72]
  wire  _T_2358 = btb_rd_addr_f == 8'h7c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_124; // @[Reg.scala 27:20]
  wire [21:0] _T_2746 = _T_2358 ? btb_bank0_rd_data_way0_out_124 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3001 = _T_3000 | _T_2746; // @[Mux.scala 27:72]
  wire  _T_2360 = btb_rd_addr_f == 8'h7d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_125; // @[Reg.scala 27:20]
  wire [21:0] _T_2747 = _T_2360 ? btb_bank0_rd_data_way0_out_125 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3002 = _T_3001 | _T_2747; // @[Mux.scala 27:72]
  wire  _T_2362 = btb_rd_addr_f == 8'h7e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_126; // @[Reg.scala 27:20]
  wire [21:0] _T_2748 = _T_2362 ? btb_bank0_rd_data_way0_out_126 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3003 = _T_3002 | _T_2748; // @[Mux.scala 27:72]
  wire  _T_2364 = btb_rd_addr_f == 8'h7f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_127; // @[Reg.scala 27:20]
  wire [21:0] _T_2749 = _T_2364 ? btb_bank0_rd_data_way0_out_127 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3004 = _T_3003 | _T_2749; // @[Mux.scala 27:72]
  wire  _T_2366 = btb_rd_addr_f == 8'h80; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_128; // @[Reg.scala 27:20]
  wire [21:0] _T_2750 = _T_2366 ? btb_bank0_rd_data_way0_out_128 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3005 = _T_3004 | _T_2750; // @[Mux.scala 27:72]
  wire  _T_2368 = btb_rd_addr_f == 8'h81; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_129; // @[Reg.scala 27:20]
  wire [21:0] _T_2751 = _T_2368 ? btb_bank0_rd_data_way0_out_129 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3006 = _T_3005 | _T_2751; // @[Mux.scala 27:72]
  wire  _T_2370 = btb_rd_addr_f == 8'h82; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_130; // @[Reg.scala 27:20]
  wire [21:0] _T_2752 = _T_2370 ? btb_bank0_rd_data_way0_out_130 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3007 = _T_3006 | _T_2752; // @[Mux.scala 27:72]
  wire  _T_2372 = btb_rd_addr_f == 8'h83; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_131; // @[Reg.scala 27:20]
  wire [21:0] _T_2753 = _T_2372 ? btb_bank0_rd_data_way0_out_131 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3008 = _T_3007 | _T_2753; // @[Mux.scala 27:72]
  wire  _T_2374 = btb_rd_addr_f == 8'h84; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_132; // @[Reg.scala 27:20]
  wire [21:0] _T_2754 = _T_2374 ? btb_bank0_rd_data_way0_out_132 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3009 = _T_3008 | _T_2754; // @[Mux.scala 27:72]
  wire  _T_2376 = btb_rd_addr_f == 8'h85; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_133; // @[Reg.scala 27:20]
  wire [21:0] _T_2755 = _T_2376 ? btb_bank0_rd_data_way0_out_133 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3010 = _T_3009 | _T_2755; // @[Mux.scala 27:72]
  wire  _T_2378 = btb_rd_addr_f == 8'h86; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_134; // @[Reg.scala 27:20]
  wire [21:0] _T_2756 = _T_2378 ? btb_bank0_rd_data_way0_out_134 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3011 = _T_3010 | _T_2756; // @[Mux.scala 27:72]
  wire  _T_2380 = btb_rd_addr_f == 8'h87; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_135; // @[Reg.scala 27:20]
  wire [21:0] _T_2757 = _T_2380 ? btb_bank0_rd_data_way0_out_135 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3012 = _T_3011 | _T_2757; // @[Mux.scala 27:72]
  wire  _T_2382 = btb_rd_addr_f == 8'h88; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_136; // @[Reg.scala 27:20]
  wire [21:0] _T_2758 = _T_2382 ? btb_bank0_rd_data_way0_out_136 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3013 = _T_3012 | _T_2758; // @[Mux.scala 27:72]
  wire  _T_2384 = btb_rd_addr_f == 8'h89; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_137; // @[Reg.scala 27:20]
  wire [21:0] _T_2759 = _T_2384 ? btb_bank0_rd_data_way0_out_137 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3014 = _T_3013 | _T_2759; // @[Mux.scala 27:72]
  wire  _T_2386 = btb_rd_addr_f == 8'h8a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_138; // @[Reg.scala 27:20]
  wire [21:0] _T_2760 = _T_2386 ? btb_bank0_rd_data_way0_out_138 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3015 = _T_3014 | _T_2760; // @[Mux.scala 27:72]
  wire  _T_2388 = btb_rd_addr_f == 8'h8b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_139; // @[Reg.scala 27:20]
  wire [21:0] _T_2761 = _T_2388 ? btb_bank0_rd_data_way0_out_139 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3016 = _T_3015 | _T_2761; // @[Mux.scala 27:72]
  wire  _T_2390 = btb_rd_addr_f == 8'h8c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_140; // @[Reg.scala 27:20]
  wire [21:0] _T_2762 = _T_2390 ? btb_bank0_rd_data_way0_out_140 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3017 = _T_3016 | _T_2762; // @[Mux.scala 27:72]
  wire  _T_2392 = btb_rd_addr_f == 8'h8d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_141; // @[Reg.scala 27:20]
  wire [21:0] _T_2763 = _T_2392 ? btb_bank0_rd_data_way0_out_141 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3018 = _T_3017 | _T_2763; // @[Mux.scala 27:72]
  wire  _T_2394 = btb_rd_addr_f == 8'h8e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_142; // @[Reg.scala 27:20]
  wire [21:0] _T_2764 = _T_2394 ? btb_bank0_rd_data_way0_out_142 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3019 = _T_3018 | _T_2764; // @[Mux.scala 27:72]
  wire  _T_2396 = btb_rd_addr_f == 8'h8f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_143; // @[Reg.scala 27:20]
  wire [21:0] _T_2765 = _T_2396 ? btb_bank0_rd_data_way0_out_143 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3020 = _T_3019 | _T_2765; // @[Mux.scala 27:72]
  wire  _T_2398 = btb_rd_addr_f == 8'h90; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_144; // @[Reg.scala 27:20]
  wire [21:0] _T_2766 = _T_2398 ? btb_bank0_rd_data_way0_out_144 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3021 = _T_3020 | _T_2766; // @[Mux.scala 27:72]
  wire  _T_2400 = btb_rd_addr_f == 8'h91; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_145; // @[Reg.scala 27:20]
  wire [21:0] _T_2767 = _T_2400 ? btb_bank0_rd_data_way0_out_145 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3022 = _T_3021 | _T_2767; // @[Mux.scala 27:72]
  wire  _T_2402 = btb_rd_addr_f == 8'h92; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_146; // @[Reg.scala 27:20]
  wire [21:0] _T_2768 = _T_2402 ? btb_bank0_rd_data_way0_out_146 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3023 = _T_3022 | _T_2768; // @[Mux.scala 27:72]
  wire  _T_2404 = btb_rd_addr_f == 8'h93; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_147; // @[Reg.scala 27:20]
  wire [21:0] _T_2769 = _T_2404 ? btb_bank0_rd_data_way0_out_147 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3024 = _T_3023 | _T_2769; // @[Mux.scala 27:72]
  wire  _T_2406 = btb_rd_addr_f == 8'h94; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_148; // @[Reg.scala 27:20]
  wire [21:0] _T_2770 = _T_2406 ? btb_bank0_rd_data_way0_out_148 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3025 = _T_3024 | _T_2770; // @[Mux.scala 27:72]
  wire  _T_2408 = btb_rd_addr_f == 8'h95; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_149; // @[Reg.scala 27:20]
  wire [21:0] _T_2771 = _T_2408 ? btb_bank0_rd_data_way0_out_149 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3026 = _T_3025 | _T_2771; // @[Mux.scala 27:72]
  wire  _T_2410 = btb_rd_addr_f == 8'h96; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_150; // @[Reg.scala 27:20]
  wire [21:0] _T_2772 = _T_2410 ? btb_bank0_rd_data_way0_out_150 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3027 = _T_3026 | _T_2772; // @[Mux.scala 27:72]
  wire  _T_2412 = btb_rd_addr_f == 8'h97; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_151; // @[Reg.scala 27:20]
  wire [21:0] _T_2773 = _T_2412 ? btb_bank0_rd_data_way0_out_151 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3028 = _T_3027 | _T_2773; // @[Mux.scala 27:72]
  wire  _T_2414 = btb_rd_addr_f == 8'h98; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_152; // @[Reg.scala 27:20]
  wire [21:0] _T_2774 = _T_2414 ? btb_bank0_rd_data_way0_out_152 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3029 = _T_3028 | _T_2774; // @[Mux.scala 27:72]
  wire  _T_2416 = btb_rd_addr_f == 8'h99; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_153; // @[Reg.scala 27:20]
  wire [21:0] _T_2775 = _T_2416 ? btb_bank0_rd_data_way0_out_153 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3030 = _T_3029 | _T_2775; // @[Mux.scala 27:72]
  wire  _T_2418 = btb_rd_addr_f == 8'h9a; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_154; // @[Reg.scala 27:20]
  wire [21:0] _T_2776 = _T_2418 ? btb_bank0_rd_data_way0_out_154 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3031 = _T_3030 | _T_2776; // @[Mux.scala 27:72]
  wire  _T_2420 = btb_rd_addr_f == 8'h9b; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_155; // @[Reg.scala 27:20]
  wire [21:0] _T_2777 = _T_2420 ? btb_bank0_rd_data_way0_out_155 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3032 = _T_3031 | _T_2777; // @[Mux.scala 27:72]
  wire  _T_2422 = btb_rd_addr_f == 8'h9c; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_156; // @[Reg.scala 27:20]
  wire [21:0] _T_2778 = _T_2422 ? btb_bank0_rd_data_way0_out_156 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3033 = _T_3032 | _T_2778; // @[Mux.scala 27:72]
  wire  _T_2424 = btb_rd_addr_f == 8'h9d; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_157; // @[Reg.scala 27:20]
  wire [21:0] _T_2779 = _T_2424 ? btb_bank0_rd_data_way0_out_157 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3034 = _T_3033 | _T_2779; // @[Mux.scala 27:72]
  wire  _T_2426 = btb_rd_addr_f == 8'h9e; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_158; // @[Reg.scala 27:20]
  wire [21:0] _T_2780 = _T_2426 ? btb_bank0_rd_data_way0_out_158 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3035 = _T_3034 | _T_2780; // @[Mux.scala 27:72]
  wire  _T_2428 = btb_rd_addr_f == 8'h9f; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_159; // @[Reg.scala 27:20]
  wire [21:0] _T_2781 = _T_2428 ? btb_bank0_rd_data_way0_out_159 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3036 = _T_3035 | _T_2781; // @[Mux.scala 27:72]
  wire  _T_2430 = btb_rd_addr_f == 8'ha0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_160; // @[Reg.scala 27:20]
  wire [21:0] _T_2782 = _T_2430 ? btb_bank0_rd_data_way0_out_160 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3037 = _T_3036 | _T_2782; // @[Mux.scala 27:72]
  wire  _T_2432 = btb_rd_addr_f == 8'ha1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_161; // @[Reg.scala 27:20]
  wire [21:0] _T_2783 = _T_2432 ? btb_bank0_rd_data_way0_out_161 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3038 = _T_3037 | _T_2783; // @[Mux.scala 27:72]
  wire  _T_2434 = btb_rd_addr_f == 8'ha2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_162; // @[Reg.scala 27:20]
  wire [21:0] _T_2784 = _T_2434 ? btb_bank0_rd_data_way0_out_162 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3039 = _T_3038 | _T_2784; // @[Mux.scala 27:72]
  wire  _T_2436 = btb_rd_addr_f == 8'ha3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_163; // @[Reg.scala 27:20]
  wire [21:0] _T_2785 = _T_2436 ? btb_bank0_rd_data_way0_out_163 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3040 = _T_3039 | _T_2785; // @[Mux.scala 27:72]
  wire  _T_2438 = btb_rd_addr_f == 8'ha4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_164; // @[Reg.scala 27:20]
  wire [21:0] _T_2786 = _T_2438 ? btb_bank0_rd_data_way0_out_164 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3041 = _T_3040 | _T_2786; // @[Mux.scala 27:72]
  wire  _T_2440 = btb_rd_addr_f == 8'ha5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_165; // @[Reg.scala 27:20]
  wire [21:0] _T_2787 = _T_2440 ? btb_bank0_rd_data_way0_out_165 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3042 = _T_3041 | _T_2787; // @[Mux.scala 27:72]
  wire  _T_2442 = btb_rd_addr_f == 8'ha6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_166; // @[Reg.scala 27:20]
  wire [21:0] _T_2788 = _T_2442 ? btb_bank0_rd_data_way0_out_166 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3043 = _T_3042 | _T_2788; // @[Mux.scala 27:72]
  wire  _T_2444 = btb_rd_addr_f == 8'ha7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_167; // @[Reg.scala 27:20]
  wire [21:0] _T_2789 = _T_2444 ? btb_bank0_rd_data_way0_out_167 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3044 = _T_3043 | _T_2789; // @[Mux.scala 27:72]
  wire  _T_2446 = btb_rd_addr_f == 8'ha8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_168; // @[Reg.scala 27:20]
  wire [21:0] _T_2790 = _T_2446 ? btb_bank0_rd_data_way0_out_168 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3045 = _T_3044 | _T_2790; // @[Mux.scala 27:72]
  wire  _T_2448 = btb_rd_addr_f == 8'ha9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_169; // @[Reg.scala 27:20]
  wire [21:0] _T_2791 = _T_2448 ? btb_bank0_rd_data_way0_out_169 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3046 = _T_3045 | _T_2791; // @[Mux.scala 27:72]
  wire  _T_2450 = btb_rd_addr_f == 8'haa; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_170; // @[Reg.scala 27:20]
  wire [21:0] _T_2792 = _T_2450 ? btb_bank0_rd_data_way0_out_170 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3047 = _T_3046 | _T_2792; // @[Mux.scala 27:72]
  wire  _T_2452 = btb_rd_addr_f == 8'hab; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_171; // @[Reg.scala 27:20]
  wire [21:0] _T_2793 = _T_2452 ? btb_bank0_rd_data_way0_out_171 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3048 = _T_3047 | _T_2793; // @[Mux.scala 27:72]
  wire  _T_2454 = btb_rd_addr_f == 8'hac; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_172; // @[Reg.scala 27:20]
  wire [21:0] _T_2794 = _T_2454 ? btb_bank0_rd_data_way0_out_172 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3049 = _T_3048 | _T_2794; // @[Mux.scala 27:72]
  wire  _T_2456 = btb_rd_addr_f == 8'had; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_173; // @[Reg.scala 27:20]
  wire [21:0] _T_2795 = _T_2456 ? btb_bank0_rd_data_way0_out_173 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3050 = _T_3049 | _T_2795; // @[Mux.scala 27:72]
  wire  _T_2458 = btb_rd_addr_f == 8'hae; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_174; // @[Reg.scala 27:20]
  wire [21:0] _T_2796 = _T_2458 ? btb_bank0_rd_data_way0_out_174 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3051 = _T_3050 | _T_2796; // @[Mux.scala 27:72]
  wire  _T_2460 = btb_rd_addr_f == 8'haf; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_175; // @[Reg.scala 27:20]
  wire [21:0] _T_2797 = _T_2460 ? btb_bank0_rd_data_way0_out_175 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3052 = _T_3051 | _T_2797; // @[Mux.scala 27:72]
  wire  _T_2462 = btb_rd_addr_f == 8'hb0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_176; // @[Reg.scala 27:20]
  wire [21:0] _T_2798 = _T_2462 ? btb_bank0_rd_data_way0_out_176 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3053 = _T_3052 | _T_2798; // @[Mux.scala 27:72]
  wire  _T_2464 = btb_rd_addr_f == 8'hb1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_177; // @[Reg.scala 27:20]
  wire [21:0] _T_2799 = _T_2464 ? btb_bank0_rd_data_way0_out_177 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3054 = _T_3053 | _T_2799; // @[Mux.scala 27:72]
  wire  _T_2466 = btb_rd_addr_f == 8'hb2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_178; // @[Reg.scala 27:20]
  wire [21:0] _T_2800 = _T_2466 ? btb_bank0_rd_data_way0_out_178 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3055 = _T_3054 | _T_2800; // @[Mux.scala 27:72]
  wire  _T_2468 = btb_rd_addr_f == 8'hb3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_179; // @[Reg.scala 27:20]
  wire [21:0] _T_2801 = _T_2468 ? btb_bank0_rd_data_way0_out_179 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3056 = _T_3055 | _T_2801; // @[Mux.scala 27:72]
  wire  _T_2470 = btb_rd_addr_f == 8'hb4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_180; // @[Reg.scala 27:20]
  wire [21:0] _T_2802 = _T_2470 ? btb_bank0_rd_data_way0_out_180 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3057 = _T_3056 | _T_2802; // @[Mux.scala 27:72]
  wire  _T_2472 = btb_rd_addr_f == 8'hb5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_181; // @[Reg.scala 27:20]
  wire [21:0] _T_2803 = _T_2472 ? btb_bank0_rd_data_way0_out_181 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3058 = _T_3057 | _T_2803; // @[Mux.scala 27:72]
  wire  _T_2474 = btb_rd_addr_f == 8'hb6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_182; // @[Reg.scala 27:20]
  wire [21:0] _T_2804 = _T_2474 ? btb_bank0_rd_data_way0_out_182 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3059 = _T_3058 | _T_2804; // @[Mux.scala 27:72]
  wire  _T_2476 = btb_rd_addr_f == 8'hb7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_183; // @[Reg.scala 27:20]
  wire [21:0] _T_2805 = _T_2476 ? btb_bank0_rd_data_way0_out_183 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3060 = _T_3059 | _T_2805; // @[Mux.scala 27:72]
  wire  _T_2478 = btb_rd_addr_f == 8'hb8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_184; // @[Reg.scala 27:20]
  wire [21:0] _T_2806 = _T_2478 ? btb_bank0_rd_data_way0_out_184 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3061 = _T_3060 | _T_2806; // @[Mux.scala 27:72]
  wire  _T_2480 = btb_rd_addr_f == 8'hb9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_185; // @[Reg.scala 27:20]
  wire [21:0] _T_2807 = _T_2480 ? btb_bank0_rd_data_way0_out_185 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3062 = _T_3061 | _T_2807; // @[Mux.scala 27:72]
  wire  _T_2482 = btb_rd_addr_f == 8'hba; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_186; // @[Reg.scala 27:20]
  wire [21:0] _T_2808 = _T_2482 ? btb_bank0_rd_data_way0_out_186 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3063 = _T_3062 | _T_2808; // @[Mux.scala 27:72]
  wire  _T_2484 = btb_rd_addr_f == 8'hbb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_187; // @[Reg.scala 27:20]
  wire [21:0] _T_2809 = _T_2484 ? btb_bank0_rd_data_way0_out_187 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3064 = _T_3063 | _T_2809; // @[Mux.scala 27:72]
  wire  _T_2486 = btb_rd_addr_f == 8'hbc; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_188; // @[Reg.scala 27:20]
  wire [21:0] _T_2810 = _T_2486 ? btb_bank0_rd_data_way0_out_188 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3065 = _T_3064 | _T_2810; // @[Mux.scala 27:72]
  wire  _T_2488 = btb_rd_addr_f == 8'hbd; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_189; // @[Reg.scala 27:20]
  wire [21:0] _T_2811 = _T_2488 ? btb_bank0_rd_data_way0_out_189 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3066 = _T_3065 | _T_2811; // @[Mux.scala 27:72]
  wire  _T_2490 = btb_rd_addr_f == 8'hbe; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_190; // @[Reg.scala 27:20]
  wire [21:0] _T_2812 = _T_2490 ? btb_bank0_rd_data_way0_out_190 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3067 = _T_3066 | _T_2812; // @[Mux.scala 27:72]
  wire  _T_2492 = btb_rd_addr_f == 8'hbf; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_191; // @[Reg.scala 27:20]
  wire [21:0] _T_2813 = _T_2492 ? btb_bank0_rd_data_way0_out_191 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3068 = _T_3067 | _T_2813; // @[Mux.scala 27:72]
  wire  _T_2494 = btb_rd_addr_f == 8'hc0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_192; // @[Reg.scala 27:20]
  wire [21:0] _T_2814 = _T_2494 ? btb_bank0_rd_data_way0_out_192 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3069 = _T_3068 | _T_2814; // @[Mux.scala 27:72]
  wire  _T_2496 = btb_rd_addr_f == 8'hc1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_193; // @[Reg.scala 27:20]
  wire [21:0] _T_2815 = _T_2496 ? btb_bank0_rd_data_way0_out_193 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3070 = _T_3069 | _T_2815; // @[Mux.scala 27:72]
  wire  _T_2498 = btb_rd_addr_f == 8'hc2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_194; // @[Reg.scala 27:20]
  wire [21:0] _T_2816 = _T_2498 ? btb_bank0_rd_data_way0_out_194 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3071 = _T_3070 | _T_2816; // @[Mux.scala 27:72]
  wire  _T_2500 = btb_rd_addr_f == 8'hc3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_195; // @[Reg.scala 27:20]
  wire [21:0] _T_2817 = _T_2500 ? btb_bank0_rd_data_way0_out_195 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3072 = _T_3071 | _T_2817; // @[Mux.scala 27:72]
  wire  _T_2502 = btb_rd_addr_f == 8'hc4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_196; // @[Reg.scala 27:20]
  wire [21:0] _T_2818 = _T_2502 ? btb_bank0_rd_data_way0_out_196 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3073 = _T_3072 | _T_2818; // @[Mux.scala 27:72]
  wire  _T_2504 = btb_rd_addr_f == 8'hc5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_197; // @[Reg.scala 27:20]
  wire [21:0] _T_2819 = _T_2504 ? btb_bank0_rd_data_way0_out_197 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3074 = _T_3073 | _T_2819; // @[Mux.scala 27:72]
  wire  _T_2506 = btb_rd_addr_f == 8'hc6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_198; // @[Reg.scala 27:20]
  wire [21:0] _T_2820 = _T_2506 ? btb_bank0_rd_data_way0_out_198 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3075 = _T_3074 | _T_2820; // @[Mux.scala 27:72]
  wire  _T_2508 = btb_rd_addr_f == 8'hc7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_199; // @[Reg.scala 27:20]
  wire [21:0] _T_2821 = _T_2508 ? btb_bank0_rd_data_way0_out_199 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3076 = _T_3075 | _T_2821; // @[Mux.scala 27:72]
  wire  _T_2510 = btb_rd_addr_f == 8'hc8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_200; // @[Reg.scala 27:20]
  wire [21:0] _T_2822 = _T_2510 ? btb_bank0_rd_data_way0_out_200 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3077 = _T_3076 | _T_2822; // @[Mux.scala 27:72]
  wire  _T_2512 = btb_rd_addr_f == 8'hc9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_201; // @[Reg.scala 27:20]
  wire [21:0] _T_2823 = _T_2512 ? btb_bank0_rd_data_way0_out_201 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3078 = _T_3077 | _T_2823; // @[Mux.scala 27:72]
  wire  _T_2514 = btb_rd_addr_f == 8'hca; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_202; // @[Reg.scala 27:20]
  wire [21:0] _T_2824 = _T_2514 ? btb_bank0_rd_data_way0_out_202 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3079 = _T_3078 | _T_2824; // @[Mux.scala 27:72]
  wire  _T_2516 = btb_rd_addr_f == 8'hcb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_203; // @[Reg.scala 27:20]
  wire [21:0] _T_2825 = _T_2516 ? btb_bank0_rd_data_way0_out_203 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3080 = _T_3079 | _T_2825; // @[Mux.scala 27:72]
  wire  _T_2518 = btb_rd_addr_f == 8'hcc; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_204; // @[Reg.scala 27:20]
  wire [21:0] _T_2826 = _T_2518 ? btb_bank0_rd_data_way0_out_204 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3081 = _T_3080 | _T_2826; // @[Mux.scala 27:72]
  wire  _T_2520 = btb_rd_addr_f == 8'hcd; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_205; // @[Reg.scala 27:20]
  wire [21:0] _T_2827 = _T_2520 ? btb_bank0_rd_data_way0_out_205 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3082 = _T_3081 | _T_2827; // @[Mux.scala 27:72]
  wire  _T_2522 = btb_rd_addr_f == 8'hce; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_206; // @[Reg.scala 27:20]
  wire [21:0] _T_2828 = _T_2522 ? btb_bank0_rd_data_way0_out_206 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3083 = _T_3082 | _T_2828; // @[Mux.scala 27:72]
  wire  _T_2524 = btb_rd_addr_f == 8'hcf; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_207; // @[Reg.scala 27:20]
  wire [21:0] _T_2829 = _T_2524 ? btb_bank0_rd_data_way0_out_207 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3084 = _T_3083 | _T_2829; // @[Mux.scala 27:72]
  wire  _T_2526 = btb_rd_addr_f == 8'hd0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_208; // @[Reg.scala 27:20]
  wire [21:0] _T_2830 = _T_2526 ? btb_bank0_rd_data_way0_out_208 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3085 = _T_3084 | _T_2830; // @[Mux.scala 27:72]
  wire  _T_2528 = btb_rd_addr_f == 8'hd1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_209; // @[Reg.scala 27:20]
  wire [21:0] _T_2831 = _T_2528 ? btb_bank0_rd_data_way0_out_209 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3086 = _T_3085 | _T_2831; // @[Mux.scala 27:72]
  wire  _T_2530 = btb_rd_addr_f == 8'hd2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_210; // @[Reg.scala 27:20]
  wire [21:0] _T_2832 = _T_2530 ? btb_bank0_rd_data_way0_out_210 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3087 = _T_3086 | _T_2832; // @[Mux.scala 27:72]
  wire  _T_2532 = btb_rd_addr_f == 8'hd3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_211; // @[Reg.scala 27:20]
  wire [21:0] _T_2833 = _T_2532 ? btb_bank0_rd_data_way0_out_211 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3088 = _T_3087 | _T_2833; // @[Mux.scala 27:72]
  wire  _T_2534 = btb_rd_addr_f == 8'hd4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_212; // @[Reg.scala 27:20]
  wire [21:0] _T_2834 = _T_2534 ? btb_bank0_rd_data_way0_out_212 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3089 = _T_3088 | _T_2834; // @[Mux.scala 27:72]
  wire  _T_2536 = btb_rd_addr_f == 8'hd5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_213; // @[Reg.scala 27:20]
  wire [21:0] _T_2835 = _T_2536 ? btb_bank0_rd_data_way0_out_213 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3090 = _T_3089 | _T_2835; // @[Mux.scala 27:72]
  wire  _T_2538 = btb_rd_addr_f == 8'hd6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_214; // @[Reg.scala 27:20]
  wire [21:0] _T_2836 = _T_2538 ? btb_bank0_rd_data_way0_out_214 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3091 = _T_3090 | _T_2836; // @[Mux.scala 27:72]
  wire  _T_2540 = btb_rd_addr_f == 8'hd7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_215; // @[Reg.scala 27:20]
  wire [21:0] _T_2837 = _T_2540 ? btb_bank0_rd_data_way0_out_215 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3092 = _T_3091 | _T_2837; // @[Mux.scala 27:72]
  wire  _T_2542 = btb_rd_addr_f == 8'hd8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_216; // @[Reg.scala 27:20]
  wire [21:0] _T_2838 = _T_2542 ? btb_bank0_rd_data_way0_out_216 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3093 = _T_3092 | _T_2838; // @[Mux.scala 27:72]
  wire  _T_2544 = btb_rd_addr_f == 8'hd9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_217; // @[Reg.scala 27:20]
  wire [21:0] _T_2839 = _T_2544 ? btb_bank0_rd_data_way0_out_217 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3094 = _T_3093 | _T_2839; // @[Mux.scala 27:72]
  wire  _T_2546 = btb_rd_addr_f == 8'hda; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_218; // @[Reg.scala 27:20]
  wire [21:0] _T_2840 = _T_2546 ? btb_bank0_rd_data_way0_out_218 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3095 = _T_3094 | _T_2840; // @[Mux.scala 27:72]
  wire  _T_2548 = btb_rd_addr_f == 8'hdb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_219; // @[Reg.scala 27:20]
  wire [21:0] _T_2841 = _T_2548 ? btb_bank0_rd_data_way0_out_219 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3096 = _T_3095 | _T_2841; // @[Mux.scala 27:72]
  wire  _T_2550 = btb_rd_addr_f == 8'hdc; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_220; // @[Reg.scala 27:20]
  wire [21:0] _T_2842 = _T_2550 ? btb_bank0_rd_data_way0_out_220 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3097 = _T_3096 | _T_2842; // @[Mux.scala 27:72]
  wire  _T_2552 = btb_rd_addr_f == 8'hdd; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_221; // @[Reg.scala 27:20]
  wire [21:0] _T_2843 = _T_2552 ? btb_bank0_rd_data_way0_out_221 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3098 = _T_3097 | _T_2843; // @[Mux.scala 27:72]
  wire  _T_2554 = btb_rd_addr_f == 8'hde; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_222; // @[Reg.scala 27:20]
  wire [21:0] _T_2844 = _T_2554 ? btb_bank0_rd_data_way0_out_222 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3099 = _T_3098 | _T_2844; // @[Mux.scala 27:72]
  wire  _T_2556 = btb_rd_addr_f == 8'hdf; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_223; // @[Reg.scala 27:20]
  wire [21:0] _T_2845 = _T_2556 ? btb_bank0_rd_data_way0_out_223 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3100 = _T_3099 | _T_2845; // @[Mux.scala 27:72]
  wire  _T_2558 = btb_rd_addr_f == 8'he0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_224; // @[Reg.scala 27:20]
  wire [21:0] _T_2846 = _T_2558 ? btb_bank0_rd_data_way0_out_224 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3101 = _T_3100 | _T_2846; // @[Mux.scala 27:72]
  wire  _T_2560 = btb_rd_addr_f == 8'he1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_225; // @[Reg.scala 27:20]
  wire [21:0] _T_2847 = _T_2560 ? btb_bank0_rd_data_way0_out_225 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3102 = _T_3101 | _T_2847; // @[Mux.scala 27:72]
  wire  _T_2562 = btb_rd_addr_f == 8'he2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_226; // @[Reg.scala 27:20]
  wire [21:0] _T_2848 = _T_2562 ? btb_bank0_rd_data_way0_out_226 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3103 = _T_3102 | _T_2848; // @[Mux.scala 27:72]
  wire  _T_2564 = btb_rd_addr_f == 8'he3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_227; // @[Reg.scala 27:20]
  wire [21:0] _T_2849 = _T_2564 ? btb_bank0_rd_data_way0_out_227 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3104 = _T_3103 | _T_2849; // @[Mux.scala 27:72]
  wire  _T_2566 = btb_rd_addr_f == 8'he4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_228; // @[Reg.scala 27:20]
  wire [21:0] _T_2850 = _T_2566 ? btb_bank0_rd_data_way0_out_228 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3105 = _T_3104 | _T_2850; // @[Mux.scala 27:72]
  wire  _T_2568 = btb_rd_addr_f == 8'he5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_229; // @[Reg.scala 27:20]
  wire [21:0] _T_2851 = _T_2568 ? btb_bank0_rd_data_way0_out_229 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3106 = _T_3105 | _T_2851; // @[Mux.scala 27:72]
  wire  _T_2570 = btb_rd_addr_f == 8'he6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_230; // @[Reg.scala 27:20]
  wire [21:0] _T_2852 = _T_2570 ? btb_bank0_rd_data_way0_out_230 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3107 = _T_3106 | _T_2852; // @[Mux.scala 27:72]
  wire  _T_2572 = btb_rd_addr_f == 8'he7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_231; // @[Reg.scala 27:20]
  wire [21:0] _T_2853 = _T_2572 ? btb_bank0_rd_data_way0_out_231 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3108 = _T_3107 | _T_2853; // @[Mux.scala 27:72]
  wire  _T_2574 = btb_rd_addr_f == 8'he8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_232; // @[Reg.scala 27:20]
  wire [21:0] _T_2854 = _T_2574 ? btb_bank0_rd_data_way0_out_232 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3109 = _T_3108 | _T_2854; // @[Mux.scala 27:72]
  wire  _T_2576 = btb_rd_addr_f == 8'he9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_233; // @[Reg.scala 27:20]
  wire [21:0] _T_2855 = _T_2576 ? btb_bank0_rd_data_way0_out_233 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3110 = _T_3109 | _T_2855; // @[Mux.scala 27:72]
  wire  _T_2578 = btb_rd_addr_f == 8'hea; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_234; // @[Reg.scala 27:20]
  wire [21:0] _T_2856 = _T_2578 ? btb_bank0_rd_data_way0_out_234 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3111 = _T_3110 | _T_2856; // @[Mux.scala 27:72]
  wire  _T_2580 = btb_rd_addr_f == 8'heb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_235; // @[Reg.scala 27:20]
  wire [21:0] _T_2857 = _T_2580 ? btb_bank0_rd_data_way0_out_235 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3112 = _T_3111 | _T_2857; // @[Mux.scala 27:72]
  wire  _T_2582 = btb_rd_addr_f == 8'hec; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_236; // @[Reg.scala 27:20]
  wire [21:0] _T_2858 = _T_2582 ? btb_bank0_rd_data_way0_out_236 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3113 = _T_3112 | _T_2858; // @[Mux.scala 27:72]
  wire  _T_2584 = btb_rd_addr_f == 8'hed; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_237; // @[Reg.scala 27:20]
  wire [21:0] _T_2859 = _T_2584 ? btb_bank0_rd_data_way0_out_237 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3114 = _T_3113 | _T_2859; // @[Mux.scala 27:72]
  wire  _T_2586 = btb_rd_addr_f == 8'hee; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_238; // @[Reg.scala 27:20]
  wire [21:0] _T_2860 = _T_2586 ? btb_bank0_rd_data_way0_out_238 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3115 = _T_3114 | _T_2860; // @[Mux.scala 27:72]
  wire  _T_2588 = btb_rd_addr_f == 8'hef; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_239; // @[Reg.scala 27:20]
  wire [21:0] _T_2861 = _T_2588 ? btb_bank0_rd_data_way0_out_239 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3116 = _T_3115 | _T_2861; // @[Mux.scala 27:72]
  wire  _T_2590 = btb_rd_addr_f == 8'hf0; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_240; // @[Reg.scala 27:20]
  wire [21:0] _T_2862 = _T_2590 ? btb_bank0_rd_data_way0_out_240 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3117 = _T_3116 | _T_2862; // @[Mux.scala 27:72]
  wire  _T_2592 = btb_rd_addr_f == 8'hf1; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_241; // @[Reg.scala 27:20]
  wire [21:0] _T_2863 = _T_2592 ? btb_bank0_rd_data_way0_out_241 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3118 = _T_3117 | _T_2863; // @[Mux.scala 27:72]
  wire  _T_2594 = btb_rd_addr_f == 8'hf2; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_242; // @[Reg.scala 27:20]
  wire [21:0] _T_2864 = _T_2594 ? btb_bank0_rd_data_way0_out_242 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3119 = _T_3118 | _T_2864; // @[Mux.scala 27:72]
  wire  _T_2596 = btb_rd_addr_f == 8'hf3; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_243; // @[Reg.scala 27:20]
  wire [21:0] _T_2865 = _T_2596 ? btb_bank0_rd_data_way0_out_243 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3120 = _T_3119 | _T_2865; // @[Mux.scala 27:72]
  wire  _T_2598 = btb_rd_addr_f == 8'hf4; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_244; // @[Reg.scala 27:20]
  wire [21:0] _T_2866 = _T_2598 ? btb_bank0_rd_data_way0_out_244 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3121 = _T_3120 | _T_2866; // @[Mux.scala 27:72]
  wire  _T_2600 = btb_rd_addr_f == 8'hf5; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_245; // @[Reg.scala 27:20]
  wire [21:0] _T_2867 = _T_2600 ? btb_bank0_rd_data_way0_out_245 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3122 = _T_3121 | _T_2867; // @[Mux.scala 27:72]
  wire  _T_2602 = btb_rd_addr_f == 8'hf6; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_246; // @[Reg.scala 27:20]
  wire [21:0] _T_2868 = _T_2602 ? btb_bank0_rd_data_way0_out_246 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3123 = _T_3122 | _T_2868; // @[Mux.scala 27:72]
  wire  _T_2604 = btb_rd_addr_f == 8'hf7; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_247; // @[Reg.scala 27:20]
  wire [21:0] _T_2869 = _T_2604 ? btb_bank0_rd_data_way0_out_247 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3124 = _T_3123 | _T_2869; // @[Mux.scala 27:72]
  wire  _T_2606 = btb_rd_addr_f == 8'hf8; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_248; // @[Reg.scala 27:20]
  wire [21:0] _T_2870 = _T_2606 ? btb_bank0_rd_data_way0_out_248 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3125 = _T_3124 | _T_2870; // @[Mux.scala 27:72]
  wire  _T_2608 = btb_rd_addr_f == 8'hf9; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_249; // @[Reg.scala 27:20]
  wire [21:0] _T_2871 = _T_2608 ? btb_bank0_rd_data_way0_out_249 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3126 = _T_3125 | _T_2871; // @[Mux.scala 27:72]
  wire  _T_2610 = btb_rd_addr_f == 8'hfa; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_250; // @[Reg.scala 27:20]
  wire [21:0] _T_2872 = _T_2610 ? btb_bank0_rd_data_way0_out_250 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3127 = _T_3126 | _T_2872; // @[Mux.scala 27:72]
  wire  _T_2612 = btb_rd_addr_f == 8'hfb; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_251; // @[Reg.scala 27:20]
  wire [21:0] _T_2873 = _T_2612 ? btb_bank0_rd_data_way0_out_251 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3128 = _T_3127 | _T_2873; // @[Mux.scala 27:72]
  wire  _T_2614 = btb_rd_addr_f == 8'hfc; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_252; // @[Reg.scala 27:20]
  wire [21:0] _T_2874 = _T_2614 ? btb_bank0_rd_data_way0_out_252 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3129 = _T_3128 | _T_2874; // @[Mux.scala 27:72]
  wire  _T_2616 = btb_rd_addr_f == 8'hfd; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_253; // @[Reg.scala 27:20]
  wire [21:0] _T_2875 = _T_2616 ? btb_bank0_rd_data_way0_out_253 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3130 = _T_3129 | _T_2875; // @[Mux.scala 27:72]
  wire  _T_2618 = btb_rd_addr_f == 8'hfe; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_254; // @[Reg.scala 27:20]
  wire [21:0] _T_2876 = _T_2618 ? btb_bank0_rd_data_way0_out_254 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3131 = _T_3130 | _T_2876; // @[Mux.scala 27:72]
  wire  _T_2620 = btb_rd_addr_f == 8'hff; // @[el2_ifu_bp_ctl.scala 373:77]
  reg [21:0] btb_bank0_rd_data_way0_out_255; // @[Reg.scala 27:20]
  wire [21:0] _T_2877 = _T_2620 ? btb_bank0_rd_data_way0_out_255 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_f = _T_3131 | _T_2877; // @[Mux.scala 27:72]
  wire [4:0] _T_25 = io_ifc_fetch_addr_f[13:9] ^ io_ifc_fetch_addr_f[18:14]; // @[el2_lib.scala 176:111]
  wire [4:0] fetch_rd_tag_f = _T_25 ^ io_ifc_fetch_addr_f[23:19]; // @[el2_lib.scala 176:111]
  wire  _T_45 = btb_bank0_rd_data_way0_f[21:17] == fetch_rd_tag_f; // @[el2_ifu_bp_ctl.scala 136:97]
  wire  _T_46 = btb_bank0_rd_data_way0_f[0] & _T_45; // @[el2_ifu_bp_ctl.scala 136:55]
  reg  dec_tlu_way_wb_f; // @[el2_ifu_bp_ctl.scala 128:33]
  wire [6:0] btb_error_addr_wb = io_exu_i0_br_index_r[6:0]; // @[el2_ifu_bp_ctl.scala 95:21]
  wire [7:0] _GEN_1034 = {{1'd0}, btb_error_addr_wb}; // @[el2_ifu_bp_ctl.scala 114:72]
  wire  _T_19 = _GEN_1034 == btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 114:72]
  wire  branch_error_collision_f = dec_tlu_error_wb & _T_19; // @[el2_ifu_bp_ctl.scala 114:51]
  wire  branch_error_bank_conflict_f = branch_error_collision_f & dec_tlu_error_wb; // @[el2_ifu_bp_ctl.scala 118:63]
  wire  _T_47 = dec_tlu_way_wb_f & branch_error_bank_conflict_f; // @[el2_ifu_bp_ctl.scala 137:22]
  wire  _T_48 = ~_T_47; // @[el2_ifu_bp_ctl.scala 137:3]
  wire  _T_49 = _T_46 & _T_48; // @[el2_ifu_bp_ctl.scala 136:117]
  wire  _T_50 = _T_49 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 137:54]
  wire  tag_match_way0_f = _T_50 & _T; // @[el2_ifu_bp_ctl.scala 137:75]
  wire  _T_81 = btb_bank0_rd_data_way0_f[3] ^ btb_bank0_rd_data_way0_f[4]; // @[el2_ifu_bp_ctl.scala 149:91]
  wire  _T_82 = tag_match_way0_f & _T_81; // @[el2_ifu_bp_ctl.scala 149:56]
  wire  _T_86 = ~_T_81; // @[el2_ifu_bp_ctl.scala 150:58]
  wire  _T_87 = tag_match_way0_f & _T_86; // @[el2_ifu_bp_ctl.scala 150:56]
  wire [1:0] tag_match_way0_expanded_f = {_T_82,_T_87}; // @[Cat.scala 29:58]
  wire [21:0] _T_126 = tag_match_way0_expanded_f[1] ? btb_bank0_rd_data_way0_f : 22'h0; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_0; // @[Reg.scala 27:20]
  wire [21:0] _T_3646 = _T_2110 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_1; // @[Reg.scala 27:20]
  wire [21:0] _T_3647 = _T_2112 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3902 = _T_3646 | _T_3647; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_2; // @[Reg.scala 27:20]
  wire [21:0] _T_3648 = _T_2114 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3903 = _T_3902 | _T_3648; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_3; // @[Reg.scala 27:20]
  wire [21:0] _T_3649 = _T_2116 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3904 = _T_3903 | _T_3649; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_4; // @[Reg.scala 27:20]
  wire [21:0] _T_3650 = _T_2118 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3905 = _T_3904 | _T_3650; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_5; // @[Reg.scala 27:20]
  wire [21:0] _T_3651 = _T_2120 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3906 = _T_3905 | _T_3651; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_6; // @[Reg.scala 27:20]
  wire [21:0] _T_3652 = _T_2122 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3907 = _T_3906 | _T_3652; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_7; // @[Reg.scala 27:20]
  wire [21:0] _T_3653 = _T_2124 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3908 = _T_3907 | _T_3653; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_8; // @[Reg.scala 27:20]
  wire [21:0] _T_3654 = _T_2126 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3909 = _T_3908 | _T_3654; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_9; // @[Reg.scala 27:20]
  wire [21:0] _T_3655 = _T_2128 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3910 = _T_3909 | _T_3655; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_10; // @[Reg.scala 27:20]
  wire [21:0] _T_3656 = _T_2130 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3911 = _T_3910 | _T_3656; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_11; // @[Reg.scala 27:20]
  wire [21:0] _T_3657 = _T_2132 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3912 = _T_3911 | _T_3657; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_12; // @[Reg.scala 27:20]
  wire [21:0] _T_3658 = _T_2134 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3913 = _T_3912 | _T_3658; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_13; // @[Reg.scala 27:20]
  wire [21:0] _T_3659 = _T_2136 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3914 = _T_3913 | _T_3659; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_14; // @[Reg.scala 27:20]
  wire [21:0] _T_3660 = _T_2138 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3915 = _T_3914 | _T_3660; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_15; // @[Reg.scala 27:20]
  wire [21:0] _T_3661 = _T_2140 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3916 = _T_3915 | _T_3661; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_16; // @[Reg.scala 27:20]
  wire [21:0] _T_3662 = _T_2142 ? btb_bank0_rd_data_way1_out_16 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3917 = _T_3916 | _T_3662; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_17; // @[Reg.scala 27:20]
  wire [21:0] _T_3663 = _T_2144 ? btb_bank0_rd_data_way1_out_17 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3918 = _T_3917 | _T_3663; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_18; // @[Reg.scala 27:20]
  wire [21:0] _T_3664 = _T_2146 ? btb_bank0_rd_data_way1_out_18 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3919 = _T_3918 | _T_3664; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_19; // @[Reg.scala 27:20]
  wire [21:0] _T_3665 = _T_2148 ? btb_bank0_rd_data_way1_out_19 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3920 = _T_3919 | _T_3665; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_20; // @[Reg.scala 27:20]
  wire [21:0] _T_3666 = _T_2150 ? btb_bank0_rd_data_way1_out_20 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3921 = _T_3920 | _T_3666; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_21; // @[Reg.scala 27:20]
  wire [21:0] _T_3667 = _T_2152 ? btb_bank0_rd_data_way1_out_21 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3922 = _T_3921 | _T_3667; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_22; // @[Reg.scala 27:20]
  wire [21:0] _T_3668 = _T_2154 ? btb_bank0_rd_data_way1_out_22 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3923 = _T_3922 | _T_3668; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_23; // @[Reg.scala 27:20]
  wire [21:0] _T_3669 = _T_2156 ? btb_bank0_rd_data_way1_out_23 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3924 = _T_3923 | _T_3669; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_24; // @[Reg.scala 27:20]
  wire [21:0] _T_3670 = _T_2158 ? btb_bank0_rd_data_way1_out_24 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3925 = _T_3924 | _T_3670; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_25; // @[Reg.scala 27:20]
  wire [21:0] _T_3671 = _T_2160 ? btb_bank0_rd_data_way1_out_25 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3926 = _T_3925 | _T_3671; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_26; // @[Reg.scala 27:20]
  wire [21:0] _T_3672 = _T_2162 ? btb_bank0_rd_data_way1_out_26 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3927 = _T_3926 | _T_3672; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_27; // @[Reg.scala 27:20]
  wire [21:0] _T_3673 = _T_2164 ? btb_bank0_rd_data_way1_out_27 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3928 = _T_3927 | _T_3673; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_28; // @[Reg.scala 27:20]
  wire [21:0] _T_3674 = _T_2166 ? btb_bank0_rd_data_way1_out_28 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3929 = _T_3928 | _T_3674; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_29; // @[Reg.scala 27:20]
  wire [21:0] _T_3675 = _T_2168 ? btb_bank0_rd_data_way1_out_29 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3930 = _T_3929 | _T_3675; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_30; // @[Reg.scala 27:20]
  wire [21:0] _T_3676 = _T_2170 ? btb_bank0_rd_data_way1_out_30 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3931 = _T_3930 | _T_3676; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_31; // @[Reg.scala 27:20]
  wire [21:0] _T_3677 = _T_2172 ? btb_bank0_rd_data_way1_out_31 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3932 = _T_3931 | _T_3677; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_32; // @[Reg.scala 27:20]
  wire [21:0] _T_3678 = _T_2174 ? btb_bank0_rd_data_way1_out_32 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3933 = _T_3932 | _T_3678; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_33; // @[Reg.scala 27:20]
  wire [21:0] _T_3679 = _T_2176 ? btb_bank0_rd_data_way1_out_33 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3934 = _T_3933 | _T_3679; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_34; // @[Reg.scala 27:20]
  wire [21:0] _T_3680 = _T_2178 ? btb_bank0_rd_data_way1_out_34 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3935 = _T_3934 | _T_3680; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_35; // @[Reg.scala 27:20]
  wire [21:0] _T_3681 = _T_2180 ? btb_bank0_rd_data_way1_out_35 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3936 = _T_3935 | _T_3681; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_36; // @[Reg.scala 27:20]
  wire [21:0] _T_3682 = _T_2182 ? btb_bank0_rd_data_way1_out_36 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3937 = _T_3936 | _T_3682; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_37; // @[Reg.scala 27:20]
  wire [21:0] _T_3683 = _T_2184 ? btb_bank0_rd_data_way1_out_37 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3938 = _T_3937 | _T_3683; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_38; // @[Reg.scala 27:20]
  wire [21:0] _T_3684 = _T_2186 ? btb_bank0_rd_data_way1_out_38 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3939 = _T_3938 | _T_3684; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_39; // @[Reg.scala 27:20]
  wire [21:0] _T_3685 = _T_2188 ? btb_bank0_rd_data_way1_out_39 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3940 = _T_3939 | _T_3685; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_40; // @[Reg.scala 27:20]
  wire [21:0] _T_3686 = _T_2190 ? btb_bank0_rd_data_way1_out_40 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3941 = _T_3940 | _T_3686; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_41; // @[Reg.scala 27:20]
  wire [21:0] _T_3687 = _T_2192 ? btb_bank0_rd_data_way1_out_41 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3942 = _T_3941 | _T_3687; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_42; // @[Reg.scala 27:20]
  wire [21:0] _T_3688 = _T_2194 ? btb_bank0_rd_data_way1_out_42 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3943 = _T_3942 | _T_3688; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_43; // @[Reg.scala 27:20]
  wire [21:0] _T_3689 = _T_2196 ? btb_bank0_rd_data_way1_out_43 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3944 = _T_3943 | _T_3689; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_44; // @[Reg.scala 27:20]
  wire [21:0] _T_3690 = _T_2198 ? btb_bank0_rd_data_way1_out_44 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3945 = _T_3944 | _T_3690; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_45; // @[Reg.scala 27:20]
  wire [21:0] _T_3691 = _T_2200 ? btb_bank0_rd_data_way1_out_45 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3946 = _T_3945 | _T_3691; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_46; // @[Reg.scala 27:20]
  wire [21:0] _T_3692 = _T_2202 ? btb_bank0_rd_data_way1_out_46 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3947 = _T_3946 | _T_3692; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_47; // @[Reg.scala 27:20]
  wire [21:0] _T_3693 = _T_2204 ? btb_bank0_rd_data_way1_out_47 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3948 = _T_3947 | _T_3693; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_48; // @[Reg.scala 27:20]
  wire [21:0] _T_3694 = _T_2206 ? btb_bank0_rd_data_way1_out_48 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3949 = _T_3948 | _T_3694; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_49; // @[Reg.scala 27:20]
  wire [21:0] _T_3695 = _T_2208 ? btb_bank0_rd_data_way1_out_49 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3950 = _T_3949 | _T_3695; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_50; // @[Reg.scala 27:20]
  wire [21:0] _T_3696 = _T_2210 ? btb_bank0_rd_data_way1_out_50 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3951 = _T_3950 | _T_3696; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_51; // @[Reg.scala 27:20]
  wire [21:0] _T_3697 = _T_2212 ? btb_bank0_rd_data_way1_out_51 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3952 = _T_3951 | _T_3697; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_52; // @[Reg.scala 27:20]
  wire [21:0] _T_3698 = _T_2214 ? btb_bank0_rd_data_way1_out_52 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3953 = _T_3952 | _T_3698; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_53; // @[Reg.scala 27:20]
  wire [21:0] _T_3699 = _T_2216 ? btb_bank0_rd_data_way1_out_53 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3954 = _T_3953 | _T_3699; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_54; // @[Reg.scala 27:20]
  wire [21:0] _T_3700 = _T_2218 ? btb_bank0_rd_data_way1_out_54 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3955 = _T_3954 | _T_3700; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_55; // @[Reg.scala 27:20]
  wire [21:0] _T_3701 = _T_2220 ? btb_bank0_rd_data_way1_out_55 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3956 = _T_3955 | _T_3701; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_56; // @[Reg.scala 27:20]
  wire [21:0] _T_3702 = _T_2222 ? btb_bank0_rd_data_way1_out_56 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3957 = _T_3956 | _T_3702; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_57; // @[Reg.scala 27:20]
  wire [21:0] _T_3703 = _T_2224 ? btb_bank0_rd_data_way1_out_57 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3958 = _T_3957 | _T_3703; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_58; // @[Reg.scala 27:20]
  wire [21:0] _T_3704 = _T_2226 ? btb_bank0_rd_data_way1_out_58 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3959 = _T_3958 | _T_3704; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_59; // @[Reg.scala 27:20]
  wire [21:0] _T_3705 = _T_2228 ? btb_bank0_rd_data_way1_out_59 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3960 = _T_3959 | _T_3705; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_60; // @[Reg.scala 27:20]
  wire [21:0] _T_3706 = _T_2230 ? btb_bank0_rd_data_way1_out_60 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3961 = _T_3960 | _T_3706; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_61; // @[Reg.scala 27:20]
  wire [21:0] _T_3707 = _T_2232 ? btb_bank0_rd_data_way1_out_61 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3962 = _T_3961 | _T_3707; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_62; // @[Reg.scala 27:20]
  wire [21:0] _T_3708 = _T_2234 ? btb_bank0_rd_data_way1_out_62 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3963 = _T_3962 | _T_3708; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_63; // @[Reg.scala 27:20]
  wire [21:0] _T_3709 = _T_2236 ? btb_bank0_rd_data_way1_out_63 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3964 = _T_3963 | _T_3709; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_64; // @[Reg.scala 27:20]
  wire [21:0] _T_3710 = _T_2238 ? btb_bank0_rd_data_way1_out_64 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3965 = _T_3964 | _T_3710; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_65; // @[Reg.scala 27:20]
  wire [21:0] _T_3711 = _T_2240 ? btb_bank0_rd_data_way1_out_65 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3966 = _T_3965 | _T_3711; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_66; // @[Reg.scala 27:20]
  wire [21:0] _T_3712 = _T_2242 ? btb_bank0_rd_data_way1_out_66 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3967 = _T_3966 | _T_3712; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_67; // @[Reg.scala 27:20]
  wire [21:0] _T_3713 = _T_2244 ? btb_bank0_rd_data_way1_out_67 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3968 = _T_3967 | _T_3713; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_68; // @[Reg.scala 27:20]
  wire [21:0] _T_3714 = _T_2246 ? btb_bank0_rd_data_way1_out_68 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3969 = _T_3968 | _T_3714; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_69; // @[Reg.scala 27:20]
  wire [21:0] _T_3715 = _T_2248 ? btb_bank0_rd_data_way1_out_69 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3970 = _T_3969 | _T_3715; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_70; // @[Reg.scala 27:20]
  wire [21:0] _T_3716 = _T_2250 ? btb_bank0_rd_data_way1_out_70 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3971 = _T_3970 | _T_3716; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_71; // @[Reg.scala 27:20]
  wire [21:0] _T_3717 = _T_2252 ? btb_bank0_rd_data_way1_out_71 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3972 = _T_3971 | _T_3717; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_72; // @[Reg.scala 27:20]
  wire [21:0] _T_3718 = _T_2254 ? btb_bank0_rd_data_way1_out_72 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3973 = _T_3972 | _T_3718; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_73; // @[Reg.scala 27:20]
  wire [21:0] _T_3719 = _T_2256 ? btb_bank0_rd_data_way1_out_73 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3974 = _T_3973 | _T_3719; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_74; // @[Reg.scala 27:20]
  wire [21:0] _T_3720 = _T_2258 ? btb_bank0_rd_data_way1_out_74 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3975 = _T_3974 | _T_3720; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_75; // @[Reg.scala 27:20]
  wire [21:0] _T_3721 = _T_2260 ? btb_bank0_rd_data_way1_out_75 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3976 = _T_3975 | _T_3721; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_76; // @[Reg.scala 27:20]
  wire [21:0] _T_3722 = _T_2262 ? btb_bank0_rd_data_way1_out_76 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3977 = _T_3976 | _T_3722; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_77; // @[Reg.scala 27:20]
  wire [21:0] _T_3723 = _T_2264 ? btb_bank0_rd_data_way1_out_77 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3978 = _T_3977 | _T_3723; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_78; // @[Reg.scala 27:20]
  wire [21:0] _T_3724 = _T_2266 ? btb_bank0_rd_data_way1_out_78 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3979 = _T_3978 | _T_3724; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_79; // @[Reg.scala 27:20]
  wire [21:0] _T_3725 = _T_2268 ? btb_bank0_rd_data_way1_out_79 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3980 = _T_3979 | _T_3725; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_80; // @[Reg.scala 27:20]
  wire [21:0] _T_3726 = _T_2270 ? btb_bank0_rd_data_way1_out_80 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3981 = _T_3980 | _T_3726; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_81; // @[Reg.scala 27:20]
  wire [21:0] _T_3727 = _T_2272 ? btb_bank0_rd_data_way1_out_81 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3982 = _T_3981 | _T_3727; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_82; // @[Reg.scala 27:20]
  wire [21:0] _T_3728 = _T_2274 ? btb_bank0_rd_data_way1_out_82 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3983 = _T_3982 | _T_3728; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_83; // @[Reg.scala 27:20]
  wire [21:0] _T_3729 = _T_2276 ? btb_bank0_rd_data_way1_out_83 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3984 = _T_3983 | _T_3729; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_84; // @[Reg.scala 27:20]
  wire [21:0] _T_3730 = _T_2278 ? btb_bank0_rd_data_way1_out_84 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3985 = _T_3984 | _T_3730; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_85; // @[Reg.scala 27:20]
  wire [21:0] _T_3731 = _T_2280 ? btb_bank0_rd_data_way1_out_85 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3986 = _T_3985 | _T_3731; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_86; // @[Reg.scala 27:20]
  wire [21:0] _T_3732 = _T_2282 ? btb_bank0_rd_data_way1_out_86 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3987 = _T_3986 | _T_3732; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_87; // @[Reg.scala 27:20]
  wire [21:0] _T_3733 = _T_2284 ? btb_bank0_rd_data_way1_out_87 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3988 = _T_3987 | _T_3733; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_88; // @[Reg.scala 27:20]
  wire [21:0] _T_3734 = _T_2286 ? btb_bank0_rd_data_way1_out_88 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3989 = _T_3988 | _T_3734; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_89; // @[Reg.scala 27:20]
  wire [21:0] _T_3735 = _T_2288 ? btb_bank0_rd_data_way1_out_89 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3990 = _T_3989 | _T_3735; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_90; // @[Reg.scala 27:20]
  wire [21:0] _T_3736 = _T_2290 ? btb_bank0_rd_data_way1_out_90 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3991 = _T_3990 | _T_3736; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_91; // @[Reg.scala 27:20]
  wire [21:0] _T_3737 = _T_2292 ? btb_bank0_rd_data_way1_out_91 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3992 = _T_3991 | _T_3737; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_92; // @[Reg.scala 27:20]
  wire [21:0] _T_3738 = _T_2294 ? btb_bank0_rd_data_way1_out_92 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3993 = _T_3992 | _T_3738; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_93; // @[Reg.scala 27:20]
  wire [21:0] _T_3739 = _T_2296 ? btb_bank0_rd_data_way1_out_93 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3994 = _T_3993 | _T_3739; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_94; // @[Reg.scala 27:20]
  wire [21:0] _T_3740 = _T_2298 ? btb_bank0_rd_data_way1_out_94 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3995 = _T_3994 | _T_3740; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_95; // @[Reg.scala 27:20]
  wire [21:0] _T_3741 = _T_2300 ? btb_bank0_rd_data_way1_out_95 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3996 = _T_3995 | _T_3741; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_96; // @[Reg.scala 27:20]
  wire [21:0] _T_3742 = _T_2302 ? btb_bank0_rd_data_way1_out_96 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3997 = _T_3996 | _T_3742; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_97; // @[Reg.scala 27:20]
  wire [21:0] _T_3743 = _T_2304 ? btb_bank0_rd_data_way1_out_97 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3998 = _T_3997 | _T_3743; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_98; // @[Reg.scala 27:20]
  wire [21:0] _T_3744 = _T_2306 ? btb_bank0_rd_data_way1_out_98 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_3999 = _T_3998 | _T_3744; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_99; // @[Reg.scala 27:20]
  wire [21:0] _T_3745 = _T_2308 ? btb_bank0_rd_data_way1_out_99 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4000 = _T_3999 | _T_3745; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_100; // @[Reg.scala 27:20]
  wire [21:0] _T_3746 = _T_2310 ? btb_bank0_rd_data_way1_out_100 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4001 = _T_4000 | _T_3746; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_101; // @[Reg.scala 27:20]
  wire [21:0] _T_3747 = _T_2312 ? btb_bank0_rd_data_way1_out_101 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4002 = _T_4001 | _T_3747; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_102; // @[Reg.scala 27:20]
  wire [21:0] _T_3748 = _T_2314 ? btb_bank0_rd_data_way1_out_102 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4003 = _T_4002 | _T_3748; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_103; // @[Reg.scala 27:20]
  wire [21:0] _T_3749 = _T_2316 ? btb_bank0_rd_data_way1_out_103 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4004 = _T_4003 | _T_3749; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_104; // @[Reg.scala 27:20]
  wire [21:0] _T_3750 = _T_2318 ? btb_bank0_rd_data_way1_out_104 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4005 = _T_4004 | _T_3750; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_105; // @[Reg.scala 27:20]
  wire [21:0] _T_3751 = _T_2320 ? btb_bank0_rd_data_way1_out_105 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4006 = _T_4005 | _T_3751; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_106; // @[Reg.scala 27:20]
  wire [21:0] _T_3752 = _T_2322 ? btb_bank0_rd_data_way1_out_106 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4007 = _T_4006 | _T_3752; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_107; // @[Reg.scala 27:20]
  wire [21:0] _T_3753 = _T_2324 ? btb_bank0_rd_data_way1_out_107 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4008 = _T_4007 | _T_3753; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_108; // @[Reg.scala 27:20]
  wire [21:0] _T_3754 = _T_2326 ? btb_bank0_rd_data_way1_out_108 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4009 = _T_4008 | _T_3754; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_109; // @[Reg.scala 27:20]
  wire [21:0] _T_3755 = _T_2328 ? btb_bank0_rd_data_way1_out_109 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4010 = _T_4009 | _T_3755; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_110; // @[Reg.scala 27:20]
  wire [21:0] _T_3756 = _T_2330 ? btb_bank0_rd_data_way1_out_110 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4011 = _T_4010 | _T_3756; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_111; // @[Reg.scala 27:20]
  wire [21:0] _T_3757 = _T_2332 ? btb_bank0_rd_data_way1_out_111 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4012 = _T_4011 | _T_3757; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_112; // @[Reg.scala 27:20]
  wire [21:0] _T_3758 = _T_2334 ? btb_bank0_rd_data_way1_out_112 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4013 = _T_4012 | _T_3758; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_113; // @[Reg.scala 27:20]
  wire [21:0] _T_3759 = _T_2336 ? btb_bank0_rd_data_way1_out_113 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4014 = _T_4013 | _T_3759; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_114; // @[Reg.scala 27:20]
  wire [21:0] _T_3760 = _T_2338 ? btb_bank0_rd_data_way1_out_114 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4015 = _T_4014 | _T_3760; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_115; // @[Reg.scala 27:20]
  wire [21:0] _T_3761 = _T_2340 ? btb_bank0_rd_data_way1_out_115 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4016 = _T_4015 | _T_3761; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_116; // @[Reg.scala 27:20]
  wire [21:0] _T_3762 = _T_2342 ? btb_bank0_rd_data_way1_out_116 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4017 = _T_4016 | _T_3762; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_117; // @[Reg.scala 27:20]
  wire [21:0] _T_3763 = _T_2344 ? btb_bank0_rd_data_way1_out_117 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4018 = _T_4017 | _T_3763; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_118; // @[Reg.scala 27:20]
  wire [21:0] _T_3764 = _T_2346 ? btb_bank0_rd_data_way1_out_118 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4019 = _T_4018 | _T_3764; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_119; // @[Reg.scala 27:20]
  wire [21:0] _T_3765 = _T_2348 ? btb_bank0_rd_data_way1_out_119 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4020 = _T_4019 | _T_3765; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_120; // @[Reg.scala 27:20]
  wire [21:0] _T_3766 = _T_2350 ? btb_bank0_rd_data_way1_out_120 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4021 = _T_4020 | _T_3766; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_121; // @[Reg.scala 27:20]
  wire [21:0] _T_3767 = _T_2352 ? btb_bank0_rd_data_way1_out_121 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4022 = _T_4021 | _T_3767; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_122; // @[Reg.scala 27:20]
  wire [21:0] _T_3768 = _T_2354 ? btb_bank0_rd_data_way1_out_122 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4023 = _T_4022 | _T_3768; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_123; // @[Reg.scala 27:20]
  wire [21:0] _T_3769 = _T_2356 ? btb_bank0_rd_data_way1_out_123 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4024 = _T_4023 | _T_3769; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_124; // @[Reg.scala 27:20]
  wire [21:0] _T_3770 = _T_2358 ? btb_bank0_rd_data_way1_out_124 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4025 = _T_4024 | _T_3770; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_125; // @[Reg.scala 27:20]
  wire [21:0] _T_3771 = _T_2360 ? btb_bank0_rd_data_way1_out_125 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4026 = _T_4025 | _T_3771; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_126; // @[Reg.scala 27:20]
  wire [21:0] _T_3772 = _T_2362 ? btb_bank0_rd_data_way1_out_126 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4027 = _T_4026 | _T_3772; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_127; // @[Reg.scala 27:20]
  wire [21:0] _T_3773 = _T_2364 ? btb_bank0_rd_data_way1_out_127 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4028 = _T_4027 | _T_3773; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_128; // @[Reg.scala 27:20]
  wire [21:0] _T_3774 = _T_2366 ? btb_bank0_rd_data_way1_out_128 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4029 = _T_4028 | _T_3774; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_129; // @[Reg.scala 27:20]
  wire [21:0] _T_3775 = _T_2368 ? btb_bank0_rd_data_way1_out_129 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4030 = _T_4029 | _T_3775; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_130; // @[Reg.scala 27:20]
  wire [21:0] _T_3776 = _T_2370 ? btb_bank0_rd_data_way1_out_130 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4031 = _T_4030 | _T_3776; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_131; // @[Reg.scala 27:20]
  wire [21:0] _T_3777 = _T_2372 ? btb_bank0_rd_data_way1_out_131 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4032 = _T_4031 | _T_3777; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_132; // @[Reg.scala 27:20]
  wire [21:0] _T_3778 = _T_2374 ? btb_bank0_rd_data_way1_out_132 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4033 = _T_4032 | _T_3778; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_133; // @[Reg.scala 27:20]
  wire [21:0] _T_3779 = _T_2376 ? btb_bank0_rd_data_way1_out_133 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4034 = _T_4033 | _T_3779; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_134; // @[Reg.scala 27:20]
  wire [21:0] _T_3780 = _T_2378 ? btb_bank0_rd_data_way1_out_134 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4035 = _T_4034 | _T_3780; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_135; // @[Reg.scala 27:20]
  wire [21:0] _T_3781 = _T_2380 ? btb_bank0_rd_data_way1_out_135 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4036 = _T_4035 | _T_3781; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_136; // @[Reg.scala 27:20]
  wire [21:0] _T_3782 = _T_2382 ? btb_bank0_rd_data_way1_out_136 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4037 = _T_4036 | _T_3782; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_137; // @[Reg.scala 27:20]
  wire [21:0] _T_3783 = _T_2384 ? btb_bank0_rd_data_way1_out_137 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4038 = _T_4037 | _T_3783; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_138; // @[Reg.scala 27:20]
  wire [21:0] _T_3784 = _T_2386 ? btb_bank0_rd_data_way1_out_138 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4039 = _T_4038 | _T_3784; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_139; // @[Reg.scala 27:20]
  wire [21:0] _T_3785 = _T_2388 ? btb_bank0_rd_data_way1_out_139 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4040 = _T_4039 | _T_3785; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_140; // @[Reg.scala 27:20]
  wire [21:0] _T_3786 = _T_2390 ? btb_bank0_rd_data_way1_out_140 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4041 = _T_4040 | _T_3786; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_141; // @[Reg.scala 27:20]
  wire [21:0] _T_3787 = _T_2392 ? btb_bank0_rd_data_way1_out_141 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4042 = _T_4041 | _T_3787; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_142; // @[Reg.scala 27:20]
  wire [21:0] _T_3788 = _T_2394 ? btb_bank0_rd_data_way1_out_142 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4043 = _T_4042 | _T_3788; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_143; // @[Reg.scala 27:20]
  wire [21:0] _T_3789 = _T_2396 ? btb_bank0_rd_data_way1_out_143 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4044 = _T_4043 | _T_3789; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_144; // @[Reg.scala 27:20]
  wire [21:0] _T_3790 = _T_2398 ? btb_bank0_rd_data_way1_out_144 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4045 = _T_4044 | _T_3790; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_145; // @[Reg.scala 27:20]
  wire [21:0] _T_3791 = _T_2400 ? btb_bank0_rd_data_way1_out_145 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4046 = _T_4045 | _T_3791; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_146; // @[Reg.scala 27:20]
  wire [21:0] _T_3792 = _T_2402 ? btb_bank0_rd_data_way1_out_146 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4047 = _T_4046 | _T_3792; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_147; // @[Reg.scala 27:20]
  wire [21:0] _T_3793 = _T_2404 ? btb_bank0_rd_data_way1_out_147 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4048 = _T_4047 | _T_3793; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_148; // @[Reg.scala 27:20]
  wire [21:0] _T_3794 = _T_2406 ? btb_bank0_rd_data_way1_out_148 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4049 = _T_4048 | _T_3794; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_149; // @[Reg.scala 27:20]
  wire [21:0] _T_3795 = _T_2408 ? btb_bank0_rd_data_way1_out_149 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4050 = _T_4049 | _T_3795; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_150; // @[Reg.scala 27:20]
  wire [21:0] _T_3796 = _T_2410 ? btb_bank0_rd_data_way1_out_150 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4051 = _T_4050 | _T_3796; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_151; // @[Reg.scala 27:20]
  wire [21:0] _T_3797 = _T_2412 ? btb_bank0_rd_data_way1_out_151 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4052 = _T_4051 | _T_3797; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_152; // @[Reg.scala 27:20]
  wire [21:0] _T_3798 = _T_2414 ? btb_bank0_rd_data_way1_out_152 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4053 = _T_4052 | _T_3798; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_153; // @[Reg.scala 27:20]
  wire [21:0] _T_3799 = _T_2416 ? btb_bank0_rd_data_way1_out_153 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4054 = _T_4053 | _T_3799; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_154; // @[Reg.scala 27:20]
  wire [21:0] _T_3800 = _T_2418 ? btb_bank0_rd_data_way1_out_154 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4055 = _T_4054 | _T_3800; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_155; // @[Reg.scala 27:20]
  wire [21:0] _T_3801 = _T_2420 ? btb_bank0_rd_data_way1_out_155 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4056 = _T_4055 | _T_3801; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_156; // @[Reg.scala 27:20]
  wire [21:0] _T_3802 = _T_2422 ? btb_bank0_rd_data_way1_out_156 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4057 = _T_4056 | _T_3802; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_157; // @[Reg.scala 27:20]
  wire [21:0] _T_3803 = _T_2424 ? btb_bank0_rd_data_way1_out_157 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4058 = _T_4057 | _T_3803; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_158; // @[Reg.scala 27:20]
  wire [21:0] _T_3804 = _T_2426 ? btb_bank0_rd_data_way1_out_158 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4059 = _T_4058 | _T_3804; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_159; // @[Reg.scala 27:20]
  wire [21:0] _T_3805 = _T_2428 ? btb_bank0_rd_data_way1_out_159 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4060 = _T_4059 | _T_3805; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_160; // @[Reg.scala 27:20]
  wire [21:0] _T_3806 = _T_2430 ? btb_bank0_rd_data_way1_out_160 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4061 = _T_4060 | _T_3806; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_161; // @[Reg.scala 27:20]
  wire [21:0] _T_3807 = _T_2432 ? btb_bank0_rd_data_way1_out_161 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4062 = _T_4061 | _T_3807; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_162; // @[Reg.scala 27:20]
  wire [21:0] _T_3808 = _T_2434 ? btb_bank0_rd_data_way1_out_162 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4063 = _T_4062 | _T_3808; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_163; // @[Reg.scala 27:20]
  wire [21:0] _T_3809 = _T_2436 ? btb_bank0_rd_data_way1_out_163 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4064 = _T_4063 | _T_3809; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_164; // @[Reg.scala 27:20]
  wire [21:0] _T_3810 = _T_2438 ? btb_bank0_rd_data_way1_out_164 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4065 = _T_4064 | _T_3810; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_165; // @[Reg.scala 27:20]
  wire [21:0] _T_3811 = _T_2440 ? btb_bank0_rd_data_way1_out_165 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4066 = _T_4065 | _T_3811; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_166; // @[Reg.scala 27:20]
  wire [21:0] _T_3812 = _T_2442 ? btb_bank0_rd_data_way1_out_166 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4067 = _T_4066 | _T_3812; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_167; // @[Reg.scala 27:20]
  wire [21:0] _T_3813 = _T_2444 ? btb_bank0_rd_data_way1_out_167 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4068 = _T_4067 | _T_3813; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_168; // @[Reg.scala 27:20]
  wire [21:0] _T_3814 = _T_2446 ? btb_bank0_rd_data_way1_out_168 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4069 = _T_4068 | _T_3814; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_169; // @[Reg.scala 27:20]
  wire [21:0] _T_3815 = _T_2448 ? btb_bank0_rd_data_way1_out_169 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4070 = _T_4069 | _T_3815; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_170; // @[Reg.scala 27:20]
  wire [21:0] _T_3816 = _T_2450 ? btb_bank0_rd_data_way1_out_170 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4071 = _T_4070 | _T_3816; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_171; // @[Reg.scala 27:20]
  wire [21:0] _T_3817 = _T_2452 ? btb_bank0_rd_data_way1_out_171 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4072 = _T_4071 | _T_3817; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_172; // @[Reg.scala 27:20]
  wire [21:0] _T_3818 = _T_2454 ? btb_bank0_rd_data_way1_out_172 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4073 = _T_4072 | _T_3818; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_173; // @[Reg.scala 27:20]
  wire [21:0] _T_3819 = _T_2456 ? btb_bank0_rd_data_way1_out_173 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4074 = _T_4073 | _T_3819; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_174; // @[Reg.scala 27:20]
  wire [21:0] _T_3820 = _T_2458 ? btb_bank0_rd_data_way1_out_174 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4075 = _T_4074 | _T_3820; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_175; // @[Reg.scala 27:20]
  wire [21:0] _T_3821 = _T_2460 ? btb_bank0_rd_data_way1_out_175 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4076 = _T_4075 | _T_3821; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_176; // @[Reg.scala 27:20]
  wire [21:0] _T_3822 = _T_2462 ? btb_bank0_rd_data_way1_out_176 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4077 = _T_4076 | _T_3822; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_177; // @[Reg.scala 27:20]
  wire [21:0] _T_3823 = _T_2464 ? btb_bank0_rd_data_way1_out_177 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4078 = _T_4077 | _T_3823; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_178; // @[Reg.scala 27:20]
  wire [21:0] _T_3824 = _T_2466 ? btb_bank0_rd_data_way1_out_178 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4079 = _T_4078 | _T_3824; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_179; // @[Reg.scala 27:20]
  wire [21:0] _T_3825 = _T_2468 ? btb_bank0_rd_data_way1_out_179 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4080 = _T_4079 | _T_3825; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_180; // @[Reg.scala 27:20]
  wire [21:0] _T_3826 = _T_2470 ? btb_bank0_rd_data_way1_out_180 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4081 = _T_4080 | _T_3826; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_181; // @[Reg.scala 27:20]
  wire [21:0] _T_3827 = _T_2472 ? btb_bank0_rd_data_way1_out_181 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4082 = _T_4081 | _T_3827; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_182; // @[Reg.scala 27:20]
  wire [21:0] _T_3828 = _T_2474 ? btb_bank0_rd_data_way1_out_182 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4083 = _T_4082 | _T_3828; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_183; // @[Reg.scala 27:20]
  wire [21:0] _T_3829 = _T_2476 ? btb_bank0_rd_data_way1_out_183 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4084 = _T_4083 | _T_3829; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_184; // @[Reg.scala 27:20]
  wire [21:0] _T_3830 = _T_2478 ? btb_bank0_rd_data_way1_out_184 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4085 = _T_4084 | _T_3830; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_185; // @[Reg.scala 27:20]
  wire [21:0] _T_3831 = _T_2480 ? btb_bank0_rd_data_way1_out_185 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4086 = _T_4085 | _T_3831; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_186; // @[Reg.scala 27:20]
  wire [21:0] _T_3832 = _T_2482 ? btb_bank0_rd_data_way1_out_186 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4087 = _T_4086 | _T_3832; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_187; // @[Reg.scala 27:20]
  wire [21:0] _T_3833 = _T_2484 ? btb_bank0_rd_data_way1_out_187 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4088 = _T_4087 | _T_3833; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_188; // @[Reg.scala 27:20]
  wire [21:0] _T_3834 = _T_2486 ? btb_bank0_rd_data_way1_out_188 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4089 = _T_4088 | _T_3834; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_189; // @[Reg.scala 27:20]
  wire [21:0] _T_3835 = _T_2488 ? btb_bank0_rd_data_way1_out_189 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4090 = _T_4089 | _T_3835; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_190; // @[Reg.scala 27:20]
  wire [21:0] _T_3836 = _T_2490 ? btb_bank0_rd_data_way1_out_190 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4091 = _T_4090 | _T_3836; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_191; // @[Reg.scala 27:20]
  wire [21:0] _T_3837 = _T_2492 ? btb_bank0_rd_data_way1_out_191 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4092 = _T_4091 | _T_3837; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_192; // @[Reg.scala 27:20]
  wire [21:0] _T_3838 = _T_2494 ? btb_bank0_rd_data_way1_out_192 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4093 = _T_4092 | _T_3838; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_193; // @[Reg.scala 27:20]
  wire [21:0] _T_3839 = _T_2496 ? btb_bank0_rd_data_way1_out_193 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4094 = _T_4093 | _T_3839; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_194; // @[Reg.scala 27:20]
  wire [21:0] _T_3840 = _T_2498 ? btb_bank0_rd_data_way1_out_194 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4095 = _T_4094 | _T_3840; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_195; // @[Reg.scala 27:20]
  wire [21:0] _T_3841 = _T_2500 ? btb_bank0_rd_data_way1_out_195 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4096 = _T_4095 | _T_3841; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_196; // @[Reg.scala 27:20]
  wire [21:0] _T_3842 = _T_2502 ? btb_bank0_rd_data_way1_out_196 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4097 = _T_4096 | _T_3842; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_197; // @[Reg.scala 27:20]
  wire [21:0] _T_3843 = _T_2504 ? btb_bank0_rd_data_way1_out_197 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4098 = _T_4097 | _T_3843; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_198; // @[Reg.scala 27:20]
  wire [21:0] _T_3844 = _T_2506 ? btb_bank0_rd_data_way1_out_198 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4099 = _T_4098 | _T_3844; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_199; // @[Reg.scala 27:20]
  wire [21:0] _T_3845 = _T_2508 ? btb_bank0_rd_data_way1_out_199 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4100 = _T_4099 | _T_3845; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_200; // @[Reg.scala 27:20]
  wire [21:0] _T_3846 = _T_2510 ? btb_bank0_rd_data_way1_out_200 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4101 = _T_4100 | _T_3846; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_201; // @[Reg.scala 27:20]
  wire [21:0] _T_3847 = _T_2512 ? btb_bank0_rd_data_way1_out_201 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4102 = _T_4101 | _T_3847; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_202; // @[Reg.scala 27:20]
  wire [21:0] _T_3848 = _T_2514 ? btb_bank0_rd_data_way1_out_202 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4103 = _T_4102 | _T_3848; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_203; // @[Reg.scala 27:20]
  wire [21:0] _T_3849 = _T_2516 ? btb_bank0_rd_data_way1_out_203 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4104 = _T_4103 | _T_3849; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_204; // @[Reg.scala 27:20]
  wire [21:0] _T_3850 = _T_2518 ? btb_bank0_rd_data_way1_out_204 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4105 = _T_4104 | _T_3850; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_205; // @[Reg.scala 27:20]
  wire [21:0] _T_3851 = _T_2520 ? btb_bank0_rd_data_way1_out_205 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4106 = _T_4105 | _T_3851; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_206; // @[Reg.scala 27:20]
  wire [21:0] _T_3852 = _T_2522 ? btb_bank0_rd_data_way1_out_206 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4107 = _T_4106 | _T_3852; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_207; // @[Reg.scala 27:20]
  wire [21:0] _T_3853 = _T_2524 ? btb_bank0_rd_data_way1_out_207 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4108 = _T_4107 | _T_3853; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_208; // @[Reg.scala 27:20]
  wire [21:0] _T_3854 = _T_2526 ? btb_bank0_rd_data_way1_out_208 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4109 = _T_4108 | _T_3854; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_209; // @[Reg.scala 27:20]
  wire [21:0] _T_3855 = _T_2528 ? btb_bank0_rd_data_way1_out_209 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4110 = _T_4109 | _T_3855; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_210; // @[Reg.scala 27:20]
  wire [21:0] _T_3856 = _T_2530 ? btb_bank0_rd_data_way1_out_210 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4111 = _T_4110 | _T_3856; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_211; // @[Reg.scala 27:20]
  wire [21:0] _T_3857 = _T_2532 ? btb_bank0_rd_data_way1_out_211 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4112 = _T_4111 | _T_3857; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_212; // @[Reg.scala 27:20]
  wire [21:0] _T_3858 = _T_2534 ? btb_bank0_rd_data_way1_out_212 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4113 = _T_4112 | _T_3858; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_213; // @[Reg.scala 27:20]
  wire [21:0] _T_3859 = _T_2536 ? btb_bank0_rd_data_way1_out_213 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4114 = _T_4113 | _T_3859; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_214; // @[Reg.scala 27:20]
  wire [21:0] _T_3860 = _T_2538 ? btb_bank0_rd_data_way1_out_214 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4115 = _T_4114 | _T_3860; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_215; // @[Reg.scala 27:20]
  wire [21:0] _T_3861 = _T_2540 ? btb_bank0_rd_data_way1_out_215 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4116 = _T_4115 | _T_3861; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_216; // @[Reg.scala 27:20]
  wire [21:0] _T_3862 = _T_2542 ? btb_bank0_rd_data_way1_out_216 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4117 = _T_4116 | _T_3862; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_217; // @[Reg.scala 27:20]
  wire [21:0] _T_3863 = _T_2544 ? btb_bank0_rd_data_way1_out_217 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4118 = _T_4117 | _T_3863; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_218; // @[Reg.scala 27:20]
  wire [21:0] _T_3864 = _T_2546 ? btb_bank0_rd_data_way1_out_218 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4119 = _T_4118 | _T_3864; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_219; // @[Reg.scala 27:20]
  wire [21:0] _T_3865 = _T_2548 ? btb_bank0_rd_data_way1_out_219 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4120 = _T_4119 | _T_3865; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_220; // @[Reg.scala 27:20]
  wire [21:0] _T_3866 = _T_2550 ? btb_bank0_rd_data_way1_out_220 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4121 = _T_4120 | _T_3866; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_221; // @[Reg.scala 27:20]
  wire [21:0] _T_3867 = _T_2552 ? btb_bank0_rd_data_way1_out_221 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4122 = _T_4121 | _T_3867; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_222; // @[Reg.scala 27:20]
  wire [21:0] _T_3868 = _T_2554 ? btb_bank0_rd_data_way1_out_222 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4123 = _T_4122 | _T_3868; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_223; // @[Reg.scala 27:20]
  wire [21:0] _T_3869 = _T_2556 ? btb_bank0_rd_data_way1_out_223 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4124 = _T_4123 | _T_3869; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_224; // @[Reg.scala 27:20]
  wire [21:0] _T_3870 = _T_2558 ? btb_bank0_rd_data_way1_out_224 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4125 = _T_4124 | _T_3870; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_225; // @[Reg.scala 27:20]
  wire [21:0] _T_3871 = _T_2560 ? btb_bank0_rd_data_way1_out_225 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4126 = _T_4125 | _T_3871; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_226; // @[Reg.scala 27:20]
  wire [21:0] _T_3872 = _T_2562 ? btb_bank0_rd_data_way1_out_226 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4127 = _T_4126 | _T_3872; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_227; // @[Reg.scala 27:20]
  wire [21:0] _T_3873 = _T_2564 ? btb_bank0_rd_data_way1_out_227 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4128 = _T_4127 | _T_3873; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_228; // @[Reg.scala 27:20]
  wire [21:0] _T_3874 = _T_2566 ? btb_bank0_rd_data_way1_out_228 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4129 = _T_4128 | _T_3874; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_229; // @[Reg.scala 27:20]
  wire [21:0] _T_3875 = _T_2568 ? btb_bank0_rd_data_way1_out_229 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4130 = _T_4129 | _T_3875; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_230; // @[Reg.scala 27:20]
  wire [21:0] _T_3876 = _T_2570 ? btb_bank0_rd_data_way1_out_230 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4131 = _T_4130 | _T_3876; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_231; // @[Reg.scala 27:20]
  wire [21:0] _T_3877 = _T_2572 ? btb_bank0_rd_data_way1_out_231 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4132 = _T_4131 | _T_3877; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_232; // @[Reg.scala 27:20]
  wire [21:0] _T_3878 = _T_2574 ? btb_bank0_rd_data_way1_out_232 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4133 = _T_4132 | _T_3878; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_233; // @[Reg.scala 27:20]
  wire [21:0] _T_3879 = _T_2576 ? btb_bank0_rd_data_way1_out_233 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4134 = _T_4133 | _T_3879; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_234; // @[Reg.scala 27:20]
  wire [21:0] _T_3880 = _T_2578 ? btb_bank0_rd_data_way1_out_234 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4135 = _T_4134 | _T_3880; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_235; // @[Reg.scala 27:20]
  wire [21:0] _T_3881 = _T_2580 ? btb_bank0_rd_data_way1_out_235 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4136 = _T_4135 | _T_3881; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_236; // @[Reg.scala 27:20]
  wire [21:0] _T_3882 = _T_2582 ? btb_bank0_rd_data_way1_out_236 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4137 = _T_4136 | _T_3882; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_237; // @[Reg.scala 27:20]
  wire [21:0] _T_3883 = _T_2584 ? btb_bank0_rd_data_way1_out_237 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4138 = _T_4137 | _T_3883; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_238; // @[Reg.scala 27:20]
  wire [21:0] _T_3884 = _T_2586 ? btb_bank0_rd_data_way1_out_238 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4139 = _T_4138 | _T_3884; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_239; // @[Reg.scala 27:20]
  wire [21:0] _T_3885 = _T_2588 ? btb_bank0_rd_data_way1_out_239 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4140 = _T_4139 | _T_3885; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_240; // @[Reg.scala 27:20]
  wire [21:0] _T_3886 = _T_2590 ? btb_bank0_rd_data_way1_out_240 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4141 = _T_4140 | _T_3886; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_241; // @[Reg.scala 27:20]
  wire [21:0] _T_3887 = _T_2592 ? btb_bank0_rd_data_way1_out_241 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4142 = _T_4141 | _T_3887; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_242; // @[Reg.scala 27:20]
  wire [21:0] _T_3888 = _T_2594 ? btb_bank0_rd_data_way1_out_242 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4143 = _T_4142 | _T_3888; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_243; // @[Reg.scala 27:20]
  wire [21:0] _T_3889 = _T_2596 ? btb_bank0_rd_data_way1_out_243 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4144 = _T_4143 | _T_3889; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_244; // @[Reg.scala 27:20]
  wire [21:0] _T_3890 = _T_2598 ? btb_bank0_rd_data_way1_out_244 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4145 = _T_4144 | _T_3890; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_245; // @[Reg.scala 27:20]
  wire [21:0] _T_3891 = _T_2600 ? btb_bank0_rd_data_way1_out_245 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4146 = _T_4145 | _T_3891; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_246; // @[Reg.scala 27:20]
  wire [21:0] _T_3892 = _T_2602 ? btb_bank0_rd_data_way1_out_246 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4147 = _T_4146 | _T_3892; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_247; // @[Reg.scala 27:20]
  wire [21:0] _T_3893 = _T_2604 ? btb_bank0_rd_data_way1_out_247 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4148 = _T_4147 | _T_3893; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_248; // @[Reg.scala 27:20]
  wire [21:0] _T_3894 = _T_2606 ? btb_bank0_rd_data_way1_out_248 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4149 = _T_4148 | _T_3894; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_249; // @[Reg.scala 27:20]
  wire [21:0] _T_3895 = _T_2608 ? btb_bank0_rd_data_way1_out_249 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4150 = _T_4149 | _T_3895; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_250; // @[Reg.scala 27:20]
  wire [21:0] _T_3896 = _T_2610 ? btb_bank0_rd_data_way1_out_250 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4151 = _T_4150 | _T_3896; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_251; // @[Reg.scala 27:20]
  wire [21:0] _T_3897 = _T_2612 ? btb_bank0_rd_data_way1_out_251 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4152 = _T_4151 | _T_3897; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_252; // @[Reg.scala 27:20]
  wire [21:0] _T_3898 = _T_2614 ? btb_bank0_rd_data_way1_out_252 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4153 = _T_4152 | _T_3898; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_253; // @[Reg.scala 27:20]
  wire [21:0] _T_3899 = _T_2616 ? btb_bank0_rd_data_way1_out_253 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4154 = _T_4153 | _T_3899; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_254; // @[Reg.scala 27:20]
  wire [21:0] _T_3900 = _T_2618 ? btb_bank0_rd_data_way1_out_254 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4155 = _T_4154 | _T_3900; // @[Mux.scala 27:72]
  reg [21:0] btb_bank0_rd_data_way1_out_255; // @[Reg.scala 27:20]
  wire [21:0] _T_3901 = _T_2620 ? btb_bank0_rd_data_way1_out_255 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_f = _T_4155 | _T_3901; // @[Mux.scala 27:72]
  wire  _T_54 = btb_bank0_rd_data_way1_f[21:17] == fetch_rd_tag_f; // @[el2_ifu_bp_ctl.scala 139:97]
  wire  _T_55 = btb_bank0_rd_data_way1_f[0] & _T_54; // @[el2_ifu_bp_ctl.scala 139:55]
  wire  _T_58 = _T_55 & _T_48; // @[el2_ifu_bp_ctl.scala 139:117]
  wire  _T_59 = _T_58 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 140:54]
  wire  tag_match_way1_f = _T_59 & _T; // @[el2_ifu_bp_ctl.scala 140:75]
  wire  _T_90 = btb_bank0_rd_data_way1_f[3] ^ btb_bank0_rd_data_way1_f[4]; // @[el2_ifu_bp_ctl.scala 152:91]
  wire  _T_91 = tag_match_way1_f & _T_90; // @[el2_ifu_bp_ctl.scala 152:56]
  wire  _T_95 = ~_T_90; // @[el2_ifu_bp_ctl.scala 153:58]
  wire  _T_96 = tag_match_way1_f & _T_95; // @[el2_ifu_bp_ctl.scala 153:56]
  wire [1:0] tag_match_way1_expanded_f = {_T_91,_T_96}; // @[Cat.scala 29:58]
  wire [21:0] _T_127 = tag_match_way1_expanded_f[1] ? btb_bank0_rd_data_way1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0o_rd_data_f = _T_126 | _T_127; // @[Mux.scala 27:72]
  wire [21:0] _T_145 = _T_143 ? btb_bank0o_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire  _T_4158 = btb_rd_addr_p1_f == 8'h0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4670 = _T_4158 ? btb_bank0_rd_data_way0_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire  _T_4160 = btb_rd_addr_p1_f == 8'h1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4671 = _T_4160 ? btb_bank0_rd_data_way0_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4926 = _T_4670 | _T_4671; // @[Mux.scala 27:72]
  wire  _T_4162 = btb_rd_addr_p1_f == 8'h2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4672 = _T_4162 ? btb_bank0_rd_data_way0_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4927 = _T_4926 | _T_4672; // @[Mux.scala 27:72]
  wire  _T_4164 = btb_rd_addr_p1_f == 8'h3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4673 = _T_4164 ? btb_bank0_rd_data_way0_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4928 = _T_4927 | _T_4673; // @[Mux.scala 27:72]
  wire  _T_4166 = btb_rd_addr_p1_f == 8'h4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4674 = _T_4166 ? btb_bank0_rd_data_way0_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4929 = _T_4928 | _T_4674; // @[Mux.scala 27:72]
  wire  _T_4168 = btb_rd_addr_p1_f == 8'h5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4675 = _T_4168 ? btb_bank0_rd_data_way0_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4930 = _T_4929 | _T_4675; // @[Mux.scala 27:72]
  wire  _T_4170 = btb_rd_addr_p1_f == 8'h6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4676 = _T_4170 ? btb_bank0_rd_data_way0_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4931 = _T_4930 | _T_4676; // @[Mux.scala 27:72]
  wire  _T_4172 = btb_rd_addr_p1_f == 8'h7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4677 = _T_4172 ? btb_bank0_rd_data_way0_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4932 = _T_4931 | _T_4677; // @[Mux.scala 27:72]
  wire  _T_4174 = btb_rd_addr_p1_f == 8'h8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4678 = _T_4174 ? btb_bank0_rd_data_way0_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4933 = _T_4932 | _T_4678; // @[Mux.scala 27:72]
  wire  _T_4176 = btb_rd_addr_p1_f == 8'h9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4679 = _T_4176 ? btb_bank0_rd_data_way0_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4934 = _T_4933 | _T_4679; // @[Mux.scala 27:72]
  wire  _T_4178 = btb_rd_addr_p1_f == 8'ha; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4680 = _T_4178 ? btb_bank0_rd_data_way0_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4935 = _T_4934 | _T_4680; // @[Mux.scala 27:72]
  wire  _T_4180 = btb_rd_addr_p1_f == 8'hb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4681 = _T_4180 ? btb_bank0_rd_data_way0_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4936 = _T_4935 | _T_4681; // @[Mux.scala 27:72]
  wire  _T_4182 = btb_rd_addr_p1_f == 8'hc; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4682 = _T_4182 ? btb_bank0_rd_data_way0_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4937 = _T_4936 | _T_4682; // @[Mux.scala 27:72]
  wire  _T_4184 = btb_rd_addr_p1_f == 8'hd; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4683 = _T_4184 ? btb_bank0_rd_data_way0_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4938 = _T_4937 | _T_4683; // @[Mux.scala 27:72]
  wire  _T_4186 = btb_rd_addr_p1_f == 8'he; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4684 = _T_4186 ? btb_bank0_rd_data_way0_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4939 = _T_4938 | _T_4684; // @[Mux.scala 27:72]
  wire  _T_4188 = btb_rd_addr_p1_f == 8'hf; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4685 = _T_4188 ? btb_bank0_rd_data_way0_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4940 = _T_4939 | _T_4685; // @[Mux.scala 27:72]
  wire  _T_4190 = btb_rd_addr_p1_f == 8'h10; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4686 = _T_4190 ? btb_bank0_rd_data_way0_out_16 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4941 = _T_4940 | _T_4686; // @[Mux.scala 27:72]
  wire  _T_4192 = btb_rd_addr_p1_f == 8'h11; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4687 = _T_4192 ? btb_bank0_rd_data_way0_out_17 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4942 = _T_4941 | _T_4687; // @[Mux.scala 27:72]
  wire  _T_4194 = btb_rd_addr_p1_f == 8'h12; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4688 = _T_4194 ? btb_bank0_rd_data_way0_out_18 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4943 = _T_4942 | _T_4688; // @[Mux.scala 27:72]
  wire  _T_4196 = btb_rd_addr_p1_f == 8'h13; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4689 = _T_4196 ? btb_bank0_rd_data_way0_out_19 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4944 = _T_4943 | _T_4689; // @[Mux.scala 27:72]
  wire  _T_4198 = btb_rd_addr_p1_f == 8'h14; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4690 = _T_4198 ? btb_bank0_rd_data_way0_out_20 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4945 = _T_4944 | _T_4690; // @[Mux.scala 27:72]
  wire  _T_4200 = btb_rd_addr_p1_f == 8'h15; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4691 = _T_4200 ? btb_bank0_rd_data_way0_out_21 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4946 = _T_4945 | _T_4691; // @[Mux.scala 27:72]
  wire  _T_4202 = btb_rd_addr_p1_f == 8'h16; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4692 = _T_4202 ? btb_bank0_rd_data_way0_out_22 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4947 = _T_4946 | _T_4692; // @[Mux.scala 27:72]
  wire  _T_4204 = btb_rd_addr_p1_f == 8'h17; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4693 = _T_4204 ? btb_bank0_rd_data_way0_out_23 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4948 = _T_4947 | _T_4693; // @[Mux.scala 27:72]
  wire  _T_4206 = btb_rd_addr_p1_f == 8'h18; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4694 = _T_4206 ? btb_bank0_rd_data_way0_out_24 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4949 = _T_4948 | _T_4694; // @[Mux.scala 27:72]
  wire  _T_4208 = btb_rd_addr_p1_f == 8'h19; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4695 = _T_4208 ? btb_bank0_rd_data_way0_out_25 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4950 = _T_4949 | _T_4695; // @[Mux.scala 27:72]
  wire  _T_4210 = btb_rd_addr_p1_f == 8'h1a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4696 = _T_4210 ? btb_bank0_rd_data_way0_out_26 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4951 = _T_4950 | _T_4696; // @[Mux.scala 27:72]
  wire  _T_4212 = btb_rd_addr_p1_f == 8'h1b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4697 = _T_4212 ? btb_bank0_rd_data_way0_out_27 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4952 = _T_4951 | _T_4697; // @[Mux.scala 27:72]
  wire  _T_4214 = btb_rd_addr_p1_f == 8'h1c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4698 = _T_4214 ? btb_bank0_rd_data_way0_out_28 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4953 = _T_4952 | _T_4698; // @[Mux.scala 27:72]
  wire  _T_4216 = btb_rd_addr_p1_f == 8'h1d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4699 = _T_4216 ? btb_bank0_rd_data_way0_out_29 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4954 = _T_4953 | _T_4699; // @[Mux.scala 27:72]
  wire  _T_4218 = btb_rd_addr_p1_f == 8'h1e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4700 = _T_4218 ? btb_bank0_rd_data_way0_out_30 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4955 = _T_4954 | _T_4700; // @[Mux.scala 27:72]
  wire  _T_4220 = btb_rd_addr_p1_f == 8'h1f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4701 = _T_4220 ? btb_bank0_rd_data_way0_out_31 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4956 = _T_4955 | _T_4701; // @[Mux.scala 27:72]
  wire  _T_4222 = btb_rd_addr_p1_f == 8'h20; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4702 = _T_4222 ? btb_bank0_rd_data_way0_out_32 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4957 = _T_4956 | _T_4702; // @[Mux.scala 27:72]
  wire  _T_4224 = btb_rd_addr_p1_f == 8'h21; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4703 = _T_4224 ? btb_bank0_rd_data_way0_out_33 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4958 = _T_4957 | _T_4703; // @[Mux.scala 27:72]
  wire  _T_4226 = btb_rd_addr_p1_f == 8'h22; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4704 = _T_4226 ? btb_bank0_rd_data_way0_out_34 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4959 = _T_4958 | _T_4704; // @[Mux.scala 27:72]
  wire  _T_4228 = btb_rd_addr_p1_f == 8'h23; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4705 = _T_4228 ? btb_bank0_rd_data_way0_out_35 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4960 = _T_4959 | _T_4705; // @[Mux.scala 27:72]
  wire  _T_4230 = btb_rd_addr_p1_f == 8'h24; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4706 = _T_4230 ? btb_bank0_rd_data_way0_out_36 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4961 = _T_4960 | _T_4706; // @[Mux.scala 27:72]
  wire  _T_4232 = btb_rd_addr_p1_f == 8'h25; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4707 = _T_4232 ? btb_bank0_rd_data_way0_out_37 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4962 = _T_4961 | _T_4707; // @[Mux.scala 27:72]
  wire  _T_4234 = btb_rd_addr_p1_f == 8'h26; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4708 = _T_4234 ? btb_bank0_rd_data_way0_out_38 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4963 = _T_4962 | _T_4708; // @[Mux.scala 27:72]
  wire  _T_4236 = btb_rd_addr_p1_f == 8'h27; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4709 = _T_4236 ? btb_bank0_rd_data_way0_out_39 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4964 = _T_4963 | _T_4709; // @[Mux.scala 27:72]
  wire  _T_4238 = btb_rd_addr_p1_f == 8'h28; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4710 = _T_4238 ? btb_bank0_rd_data_way0_out_40 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4965 = _T_4964 | _T_4710; // @[Mux.scala 27:72]
  wire  _T_4240 = btb_rd_addr_p1_f == 8'h29; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4711 = _T_4240 ? btb_bank0_rd_data_way0_out_41 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4966 = _T_4965 | _T_4711; // @[Mux.scala 27:72]
  wire  _T_4242 = btb_rd_addr_p1_f == 8'h2a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4712 = _T_4242 ? btb_bank0_rd_data_way0_out_42 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4967 = _T_4966 | _T_4712; // @[Mux.scala 27:72]
  wire  _T_4244 = btb_rd_addr_p1_f == 8'h2b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4713 = _T_4244 ? btb_bank0_rd_data_way0_out_43 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4968 = _T_4967 | _T_4713; // @[Mux.scala 27:72]
  wire  _T_4246 = btb_rd_addr_p1_f == 8'h2c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4714 = _T_4246 ? btb_bank0_rd_data_way0_out_44 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4969 = _T_4968 | _T_4714; // @[Mux.scala 27:72]
  wire  _T_4248 = btb_rd_addr_p1_f == 8'h2d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4715 = _T_4248 ? btb_bank0_rd_data_way0_out_45 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4970 = _T_4969 | _T_4715; // @[Mux.scala 27:72]
  wire  _T_4250 = btb_rd_addr_p1_f == 8'h2e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4716 = _T_4250 ? btb_bank0_rd_data_way0_out_46 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4971 = _T_4970 | _T_4716; // @[Mux.scala 27:72]
  wire  _T_4252 = btb_rd_addr_p1_f == 8'h2f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4717 = _T_4252 ? btb_bank0_rd_data_way0_out_47 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4972 = _T_4971 | _T_4717; // @[Mux.scala 27:72]
  wire  _T_4254 = btb_rd_addr_p1_f == 8'h30; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4718 = _T_4254 ? btb_bank0_rd_data_way0_out_48 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4973 = _T_4972 | _T_4718; // @[Mux.scala 27:72]
  wire  _T_4256 = btb_rd_addr_p1_f == 8'h31; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4719 = _T_4256 ? btb_bank0_rd_data_way0_out_49 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4974 = _T_4973 | _T_4719; // @[Mux.scala 27:72]
  wire  _T_4258 = btb_rd_addr_p1_f == 8'h32; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4720 = _T_4258 ? btb_bank0_rd_data_way0_out_50 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4975 = _T_4974 | _T_4720; // @[Mux.scala 27:72]
  wire  _T_4260 = btb_rd_addr_p1_f == 8'h33; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4721 = _T_4260 ? btb_bank0_rd_data_way0_out_51 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4976 = _T_4975 | _T_4721; // @[Mux.scala 27:72]
  wire  _T_4262 = btb_rd_addr_p1_f == 8'h34; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4722 = _T_4262 ? btb_bank0_rd_data_way0_out_52 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4977 = _T_4976 | _T_4722; // @[Mux.scala 27:72]
  wire  _T_4264 = btb_rd_addr_p1_f == 8'h35; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4723 = _T_4264 ? btb_bank0_rd_data_way0_out_53 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4978 = _T_4977 | _T_4723; // @[Mux.scala 27:72]
  wire  _T_4266 = btb_rd_addr_p1_f == 8'h36; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4724 = _T_4266 ? btb_bank0_rd_data_way0_out_54 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4979 = _T_4978 | _T_4724; // @[Mux.scala 27:72]
  wire  _T_4268 = btb_rd_addr_p1_f == 8'h37; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4725 = _T_4268 ? btb_bank0_rd_data_way0_out_55 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4980 = _T_4979 | _T_4725; // @[Mux.scala 27:72]
  wire  _T_4270 = btb_rd_addr_p1_f == 8'h38; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4726 = _T_4270 ? btb_bank0_rd_data_way0_out_56 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4981 = _T_4980 | _T_4726; // @[Mux.scala 27:72]
  wire  _T_4272 = btb_rd_addr_p1_f == 8'h39; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4727 = _T_4272 ? btb_bank0_rd_data_way0_out_57 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4982 = _T_4981 | _T_4727; // @[Mux.scala 27:72]
  wire  _T_4274 = btb_rd_addr_p1_f == 8'h3a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4728 = _T_4274 ? btb_bank0_rd_data_way0_out_58 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4983 = _T_4982 | _T_4728; // @[Mux.scala 27:72]
  wire  _T_4276 = btb_rd_addr_p1_f == 8'h3b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4729 = _T_4276 ? btb_bank0_rd_data_way0_out_59 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4984 = _T_4983 | _T_4729; // @[Mux.scala 27:72]
  wire  _T_4278 = btb_rd_addr_p1_f == 8'h3c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4730 = _T_4278 ? btb_bank0_rd_data_way0_out_60 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4985 = _T_4984 | _T_4730; // @[Mux.scala 27:72]
  wire  _T_4280 = btb_rd_addr_p1_f == 8'h3d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4731 = _T_4280 ? btb_bank0_rd_data_way0_out_61 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4986 = _T_4985 | _T_4731; // @[Mux.scala 27:72]
  wire  _T_4282 = btb_rd_addr_p1_f == 8'h3e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4732 = _T_4282 ? btb_bank0_rd_data_way0_out_62 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4987 = _T_4986 | _T_4732; // @[Mux.scala 27:72]
  wire  _T_4284 = btb_rd_addr_p1_f == 8'h3f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4733 = _T_4284 ? btb_bank0_rd_data_way0_out_63 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4988 = _T_4987 | _T_4733; // @[Mux.scala 27:72]
  wire  _T_4286 = btb_rd_addr_p1_f == 8'h40; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4734 = _T_4286 ? btb_bank0_rd_data_way0_out_64 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4989 = _T_4988 | _T_4734; // @[Mux.scala 27:72]
  wire  _T_4288 = btb_rd_addr_p1_f == 8'h41; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4735 = _T_4288 ? btb_bank0_rd_data_way0_out_65 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4990 = _T_4989 | _T_4735; // @[Mux.scala 27:72]
  wire  _T_4290 = btb_rd_addr_p1_f == 8'h42; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4736 = _T_4290 ? btb_bank0_rd_data_way0_out_66 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4991 = _T_4990 | _T_4736; // @[Mux.scala 27:72]
  wire  _T_4292 = btb_rd_addr_p1_f == 8'h43; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4737 = _T_4292 ? btb_bank0_rd_data_way0_out_67 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4992 = _T_4991 | _T_4737; // @[Mux.scala 27:72]
  wire  _T_4294 = btb_rd_addr_p1_f == 8'h44; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4738 = _T_4294 ? btb_bank0_rd_data_way0_out_68 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4993 = _T_4992 | _T_4738; // @[Mux.scala 27:72]
  wire  _T_4296 = btb_rd_addr_p1_f == 8'h45; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4739 = _T_4296 ? btb_bank0_rd_data_way0_out_69 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4994 = _T_4993 | _T_4739; // @[Mux.scala 27:72]
  wire  _T_4298 = btb_rd_addr_p1_f == 8'h46; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4740 = _T_4298 ? btb_bank0_rd_data_way0_out_70 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4995 = _T_4994 | _T_4740; // @[Mux.scala 27:72]
  wire  _T_4300 = btb_rd_addr_p1_f == 8'h47; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4741 = _T_4300 ? btb_bank0_rd_data_way0_out_71 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4996 = _T_4995 | _T_4741; // @[Mux.scala 27:72]
  wire  _T_4302 = btb_rd_addr_p1_f == 8'h48; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4742 = _T_4302 ? btb_bank0_rd_data_way0_out_72 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4997 = _T_4996 | _T_4742; // @[Mux.scala 27:72]
  wire  _T_4304 = btb_rd_addr_p1_f == 8'h49; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4743 = _T_4304 ? btb_bank0_rd_data_way0_out_73 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4998 = _T_4997 | _T_4743; // @[Mux.scala 27:72]
  wire  _T_4306 = btb_rd_addr_p1_f == 8'h4a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4744 = _T_4306 ? btb_bank0_rd_data_way0_out_74 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_4999 = _T_4998 | _T_4744; // @[Mux.scala 27:72]
  wire  _T_4308 = btb_rd_addr_p1_f == 8'h4b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4745 = _T_4308 ? btb_bank0_rd_data_way0_out_75 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5000 = _T_4999 | _T_4745; // @[Mux.scala 27:72]
  wire  _T_4310 = btb_rd_addr_p1_f == 8'h4c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4746 = _T_4310 ? btb_bank0_rd_data_way0_out_76 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5001 = _T_5000 | _T_4746; // @[Mux.scala 27:72]
  wire  _T_4312 = btb_rd_addr_p1_f == 8'h4d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4747 = _T_4312 ? btb_bank0_rd_data_way0_out_77 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5002 = _T_5001 | _T_4747; // @[Mux.scala 27:72]
  wire  _T_4314 = btb_rd_addr_p1_f == 8'h4e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4748 = _T_4314 ? btb_bank0_rd_data_way0_out_78 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5003 = _T_5002 | _T_4748; // @[Mux.scala 27:72]
  wire  _T_4316 = btb_rd_addr_p1_f == 8'h4f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4749 = _T_4316 ? btb_bank0_rd_data_way0_out_79 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5004 = _T_5003 | _T_4749; // @[Mux.scala 27:72]
  wire  _T_4318 = btb_rd_addr_p1_f == 8'h50; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4750 = _T_4318 ? btb_bank0_rd_data_way0_out_80 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5005 = _T_5004 | _T_4750; // @[Mux.scala 27:72]
  wire  _T_4320 = btb_rd_addr_p1_f == 8'h51; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4751 = _T_4320 ? btb_bank0_rd_data_way0_out_81 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5006 = _T_5005 | _T_4751; // @[Mux.scala 27:72]
  wire  _T_4322 = btb_rd_addr_p1_f == 8'h52; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4752 = _T_4322 ? btb_bank0_rd_data_way0_out_82 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5007 = _T_5006 | _T_4752; // @[Mux.scala 27:72]
  wire  _T_4324 = btb_rd_addr_p1_f == 8'h53; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4753 = _T_4324 ? btb_bank0_rd_data_way0_out_83 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5008 = _T_5007 | _T_4753; // @[Mux.scala 27:72]
  wire  _T_4326 = btb_rd_addr_p1_f == 8'h54; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4754 = _T_4326 ? btb_bank0_rd_data_way0_out_84 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5009 = _T_5008 | _T_4754; // @[Mux.scala 27:72]
  wire  _T_4328 = btb_rd_addr_p1_f == 8'h55; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4755 = _T_4328 ? btb_bank0_rd_data_way0_out_85 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5010 = _T_5009 | _T_4755; // @[Mux.scala 27:72]
  wire  _T_4330 = btb_rd_addr_p1_f == 8'h56; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4756 = _T_4330 ? btb_bank0_rd_data_way0_out_86 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5011 = _T_5010 | _T_4756; // @[Mux.scala 27:72]
  wire  _T_4332 = btb_rd_addr_p1_f == 8'h57; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4757 = _T_4332 ? btb_bank0_rd_data_way0_out_87 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5012 = _T_5011 | _T_4757; // @[Mux.scala 27:72]
  wire  _T_4334 = btb_rd_addr_p1_f == 8'h58; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4758 = _T_4334 ? btb_bank0_rd_data_way0_out_88 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5013 = _T_5012 | _T_4758; // @[Mux.scala 27:72]
  wire  _T_4336 = btb_rd_addr_p1_f == 8'h59; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4759 = _T_4336 ? btb_bank0_rd_data_way0_out_89 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5014 = _T_5013 | _T_4759; // @[Mux.scala 27:72]
  wire  _T_4338 = btb_rd_addr_p1_f == 8'h5a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4760 = _T_4338 ? btb_bank0_rd_data_way0_out_90 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5015 = _T_5014 | _T_4760; // @[Mux.scala 27:72]
  wire  _T_4340 = btb_rd_addr_p1_f == 8'h5b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4761 = _T_4340 ? btb_bank0_rd_data_way0_out_91 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5016 = _T_5015 | _T_4761; // @[Mux.scala 27:72]
  wire  _T_4342 = btb_rd_addr_p1_f == 8'h5c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4762 = _T_4342 ? btb_bank0_rd_data_way0_out_92 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5017 = _T_5016 | _T_4762; // @[Mux.scala 27:72]
  wire  _T_4344 = btb_rd_addr_p1_f == 8'h5d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4763 = _T_4344 ? btb_bank0_rd_data_way0_out_93 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5018 = _T_5017 | _T_4763; // @[Mux.scala 27:72]
  wire  _T_4346 = btb_rd_addr_p1_f == 8'h5e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4764 = _T_4346 ? btb_bank0_rd_data_way0_out_94 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5019 = _T_5018 | _T_4764; // @[Mux.scala 27:72]
  wire  _T_4348 = btb_rd_addr_p1_f == 8'h5f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4765 = _T_4348 ? btb_bank0_rd_data_way0_out_95 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5020 = _T_5019 | _T_4765; // @[Mux.scala 27:72]
  wire  _T_4350 = btb_rd_addr_p1_f == 8'h60; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4766 = _T_4350 ? btb_bank0_rd_data_way0_out_96 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5021 = _T_5020 | _T_4766; // @[Mux.scala 27:72]
  wire  _T_4352 = btb_rd_addr_p1_f == 8'h61; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4767 = _T_4352 ? btb_bank0_rd_data_way0_out_97 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5022 = _T_5021 | _T_4767; // @[Mux.scala 27:72]
  wire  _T_4354 = btb_rd_addr_p1_f == 8'h62; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4768 = _T_4354 ? btb_bank0_rd_data_way0_out_98 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5023 = _T_5022 | _T_4768; // @[Mux.scala 27:72]
  wire  _T_4356 = btb_rd_addr_p1_f == 8'h63; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4769 = _T_4356 ? btb_bank0_rd_data_way0_out_99 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5024 = _T_5023 | _T_4769; // @[Mux.scala 27:72]
  wire  _T_4358 = btb_rd_addr_p1_f == 8'h64; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4770 = _T_4358 ? btb_bank0_rd_data_way0_out_100 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5025 = _T_5024 | _T_4770; // @[Mux.scala 27:72]
  wire  _T_4360 = btb_rd_addr_p1_f == 8'h65; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4771 = _T_4360 ? btb_bank0_rd_data_way0_out_101 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5026 = _T_5025 | _T_4771; // @[Mux.scala 27:72]
  wire  _T_4362 = btb_rd_addr_p1_f == 8'h66; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4772 = _T_4362 ? btb_bank0_rd_data_way0_out_102 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5027 = _T_5026 | _T_4772; // @[Mux.scala 27:72]
  wire  _T_4364 = btb_rd_addr_p1_f == 8'h67; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4773 = _T_4364 ? btb_bank0_rd_data_way0_out_103 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5028 = _T_5027 | _T_4773; // @[Mux.scala 27:72]
  wire  _T_4366 = btb_rd_addr_p1_f == 8'h68; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4774 = _T_4366 ? btb_bank0_rd_data_way0_out_104 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5029 = _T_5028 | _T_4774; // @[Mux.scala 27:72]
  wire  _T_4368 = btb_rd_addr_p1_f == 8'h69; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4775 = _T_4368 ? btb_bank0_rd_data_way0_out_105 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5030 = _T_5029 | _T_4775; // @[Mux.scala 27:72]
  wire  _T_4370 = btb_rd_addr_p1_f == 8'h6a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4776 = _T_4370 ? btb_bank0_rd_data_way0_out_106 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5031 = _T_5030 | _T_4776; // @[Mux.scala 27:72]
  wire  _T_4372 = btb_rd_addr_p1_f == 8'h6b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4777 = _T_4372 ? btb_bank0_rd_data_way0_out_107 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5032 = _T_5031 | _T_4777; // @[Mux.scala 27:72]
  wire  _T_4374 = btb_rd_addr_p1_f == 8'h6c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4778 = _T_4374 ? btb_bank0_rd_data_way0_out_108 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5033 = _T_5032 | _T_4778; // @[Mux.scala 27:72]
  wire  _T_4376 = btb_rd_addr_p1_f == 8'h6d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4779 = _T_4376 ? btb_bank0_rd_data_way0_out_109 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5034 = _T_5033 | _T_4779; // @[Mux.scala 27:72]
  wire  _T_4378 = btb_rd_addr_p1_f == 8'h6e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4780 = _T_4378 ? btb_bank0_rd_data_way0_out_110 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5035 = _T_5034 | _T_4780; // @[Mux.scala 27:72]
  wire  _T_4380 = btb_rd_addr_p1_f == 8'h6f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4781 = _T_4380 ? btb_bank0_rd_data_way0_out_111 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5036 = _T_5035 | _T_4781; // @[Mux.scala 27:72]
  wire  _T_4382 = btb_rd_addr_p1_f == 8'h70; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4782 = _T_4382 ? btb_bank0_rd_data_way0_out_112 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5037 = _T_5036 | _T_4782; // @[Mux.scala 27:72]
  wire  _T_4384 = btb_rd_addr_p1_f == 8'h71; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4783 = _T_4384 ? btb_bank0_rd_data_way0_out_113 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5038 = _T_5037 | _T_4783; // @[Mux.scala 27:72]
  wire  _T_4386 = btb_rd_addr_p1_f == 8'h72; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4784 = _T_4386 ? btb_bank0_rd_data_way0_out_114 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5039 = _T_5038 | _T_4784; // @[Mux.scala 27:72]
  wire  _T_4388 = btb_rd_addr_p1_f == 8'h73; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4785 = _T_4388 ? btb_bank0_rd_data_way0_out_115 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5040 = _T_5039 | _T_4785; // @[Mux.scala 27:72]
  wire  _T_4390 = btb_rd_addr_p1_f == 8'h74; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4786 = _T_4390 ? btb_bank0_rd_data_way0_out_116 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5041 = _T_5040 | _T_4786; // @[Mux.scala 27:72]
  wire  _T_4392 = btb_rd_addr_p1_f == 8'h75; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4787 = _T_4392 ? btb_bank0_rd_data_way0_out_117 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5042 = _T_5041 | _T_4787; // @[Mux.scala 27:72]
  wire  _T_4394 = btb_rd_addr_p1_f == 8'h76; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4788 = _T_4394 ? btb_bank0_rd_data_way0_out_118 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5043 = _T_5042 | _T_4788; // @[Mux.scala 27:72]
  wire  _T_4396 = btb_rd_addr_p1_f == 8'h77; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4789 = _T_4396 ? btb_bank0_rd_data_way0_out_119 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5044 = _T_5043 | _T_4789; // @[Mux.scala 27:72]
  wire  _T_4398 = btb_rd_addr_p1_f == 8'h78; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4790 = _T_4398 ? btb_bank0_rd_data_way0_out_120 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5045 = _T_5044 | _T_4790; // @[Mux.scala 27:72]
  wire  _T_4400 = btb_rd_addr_p1_f == 8'h79; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4791 = _T_4400 ? btb_bank0_rd_data_way0_out_121 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5046 = _T_5045 | _T_4791; // @[Mux.scala 27:72]
  wire  _T_4402 = btb_rd_addr_p1_f == 8'h7a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4792 = _T_4402 ? btb_bank0_rd_data_way0_out_122 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5047 = _T_5046 | _T_4792; // @[Mux.scala 27:72]
  wire  _T_4404 = btb_rd_addr_p1_f == 8'h7b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4793 = _T_4404 ? btb_bank0_rd_data_way0_out_123 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5048 = _T_5047 | _T_4793; // @[Mux.scala 27:72]
  wire  _T_4406 = btb_rd_addr_p1_f == 8'h7c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4794 = _T_4406 ? btb_bank0_rd_data_way0_out_124 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5049 = _T_5048 | _T_4794; // @[Mux.scala 27:72]
  wire  _T_4408 = btb_rd_addr_p1_f == 8'h7d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4795 = _T_4408 ? btb_bank0_rd_data_way0_out_125 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5050 = _T_5049 | _T_4795; // @[Mux.scala 27:72]
  wire  _T_4410 = btb_rd_addr_p1_f == 8'h7e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4796 = _T_4410 ? btb_bank0_rd_data_way0_out_126 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5051 = _T_5050 | _T_4796; // @[Mux.scala 27:72]
  wire  _T_4412 = btb_rd_addr_p1_f == 8'h7f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4797 = _T_4412 ? btb_bank0_rd_data_way0_out_127 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5052 = _T_5051 | _T_4797; // @[Mux.scala 27:72]
  wire  _T_4414 = btb_rd_addr_p1_f == 8'h80; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4798 = _T_4414 ? btb_bank0_rd_data_way0_out_128 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5053 = _T_5052 | _T_4798; // @[Mux.scala 27:72]
  wire  _T_4416 = btb_rd_addr_p1_f == 8'h81; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4799 = _T_4416 ? btb_bank0_rd_data_way0_out_129 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5054 = _T_5053 | _T_4799; // @[Mux.scala 27:72]
  wire  _T_4418 = btb_rd_addr_p1_f == 8'h82; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4800 = _T_4418 ? btb_bank0_rd_data_way0_out_130 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5055 = _T_5054 | _T_4800; // @[Mux.scala 27:72]
  wire  _T_4420 = btb_rd_addr_p1_f == 8'h83; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4801 = _T_4420 ? btb_bank0_rd_data_way0_out_131 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5056 = _T_5055 | _T_4801; // @[Mux.scala 27:72]
  wire  _T_4422 = btb_rd_addr_p1_f == 8'h84; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4802 = _T_4422 ? btb_bank0_rd_data_way0_out_132 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5057 = _T_5056 | _T_4802; // @[Mux.scala 27:72]
  wire  _T_4424 = btb_rd_addr_p1_f == 8'h85; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4803 = _T_4424 ? btb_bank0_rd_data_way0_out_133 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5058 = _T_5057 | _T_4803; // @[Mux.scala 27:72]
  wire  _T_4426 = btb_rd_addr_p1_f == 8'h86; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4804 = _T_4426 ? btb_bank0_rd_data_way0_out_134 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5059 = _T_5058 | _T_4804; // @[Mux.scala 27:72]
  wire  _T_4428 = btb_rd_addr_p1_f == 8'h87; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4805 = _T_4428 ? btb_bank0_rd_data_way0_out_135 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5060 = _T_5059 | _T_4805; // @[Mux.scala 27:72]
  wire  _T_4430 = btb_rd_addr_p1_f == 8'h88; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4806 = _T_4430 ? btb_bank0_rd_data_way0_out_136 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5061 = _T_5060 | _T_4806; // @[Mux.scala 27:72]
  wire  _T_4432 = btb_rd_addr_p1_f == 8'h89; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4807 = _T_4432 ? btb_bank0_rd_data_way0_out_137 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5062 = _T_5061 | _T_4807; // @[Mux.scala 27:72]
  wire  _T_4434 = btb_rd_addr_p1_f == 8'h8a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4808 = _T_4434 ? btb_bank0_rd_data_way0_out_138 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5063 = _T_5062 | _T_4808; // @[Mux.scala 27:72]
  wire  _T_4436 = btb_rd_addr_p1_f == 8'h8b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4809 = _T_4436 ? btb_bank0_rd_data_way0_out_139 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5064 = _T_5063 | _T_4809; // @[Mux.scala 27:72]
  wire  _T_4438 = btb_rd_addr_p1_f == 8'h8c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4810 = _T_4438 ? btb_bank0_rd_data_way0_out_140 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5065 = _T_5064 | _T_4810; // @[Mux.scala 27:72]
  wire  _T_4440 = btb_rd_addr_p1_f == 8'h8d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4811 = _T_4440 ? btb_bank0_rd_data_way0_out_141 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5066 = _T_5065 | _T_4811; // @[Mux.scala 27:72]
  wire  _T_4442 = btb_rd_addr_p1_f == 8'h8e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4812 = _T_4442 ? btb_bank0_rd_data_way0_out_142 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5067 = _T_5066 | _T_4812; // @[Mux.scala 27:72]
  wire  _T_4444 = btb_rd_addr_p1_f == 8'h8f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4813 = _T_4444 ? btb_bank0_rd_data_way0_out_143 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5068 = _T_5067 | _T_4813; // @[Mux.scala 27:72]
  wire  _T_4446 = btb_rd_addr_p1_f == 8'h90; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4814 = _T_4446 ? btb_bank0_rd_data_way0_out_144 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5069 = _T_5068 | _T_4814; // @[Mux.scala 27:72]
  wire  _T_4448 = btb_rd_addr_p1_f == 8'h91; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4815 = _T_4448 ? btb_bank0_rd_data_way0_out_145 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5070 = _T_5069 | _T_4815; // @[Mux.scala 27:72]
  wire  _T_4450 = btb_rd_addr_p1_f == 8'h92; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4816 = _T_4450 ? btb_bank0_rd_data_way0_out_146 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5071 = _T_5070 | _T_4816; // @[Mux.scala 27:72]
  wire  _T_4452 = btb_rd_addr_p1_f == 8'h93; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4817 = _T_4452 ? btb_bank0_rd_data_way0_out_147 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5072 = _T_5071 | _T_4817; // @[Mux.scala 27:72]
  wire  _T_4454 = btb_rd_addr_p1_f == 8'h94; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4818 = _T_4454 ? btb_bank0_rd_data_way0_out_148 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5073 = _T_5072 | _T_4818; // @[Mux.scala 27:72]
  wire  _T_4456 = btb_rd_addr_p1_f == 8'h95; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4819 = _T_4456 ? btb_bank0_rd_data_way0_out_149 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5074 = _T_5073 | _T_4819; // @[Mux.scala 27:72]
  wire  _T_4458 = btb_rd_addr_p1_f == 8'h96; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4820 = _T_4458 ? btb_bank0_rd_data_way0_out_150 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5075 = _T_5074 | _T_4820; // @[Mux.scala 27:72]
  wire  _T_4460 = btb_rd_addr_p1_f == 8'h97; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4821 = _T_4460 ? btb_bank0_rd_data_way0_out_151 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5076 = _T_5075 | _T_4821; // @[Mux.scala 27:72]
  wire  _T_4462 = btb_rd_addr_p1_f == 8'h98; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4822 = _T_4462 ? btb_bank0_rd_data_way0_out_152 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5077 = _T_5076 | _T_4822; // @[Mux.scala 27:72]
  wire  _T_4464 = btb_rd_addr_p1_f == 8'h99; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4823 = _T_4464 ? btb_bank0_rd_data_way0_out_153 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5078 = _T_5077 | _T_4823; // @[Mux.scala 27:72]
  wire  _T_4466 = btb_rd_addr_p1_f == 8'h9a; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4824 = _T_4466 ? btb_bank0_rd_data_way0_out_154 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5079 = _T_5078 | _T_4824; // @[Mux.scala 27:72]
  wire  _T_4468 = btb_rd_addr_p1_f == 8'h9b; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4825 = _T_4468 ? btb_bank0_rd_data_way0_out_155 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5080 = _T_5079 | _T_4825; // @[Mux.scala 27:72]
  wire  _T_4470 = btb_rd_addr_p1_f == 8'h9c; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4826 = _T_4470 ? btb_bank0_rd_data_way0_out_156 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5081 = _T_5080 | _T_4826; // @[Mux.scala 27:72]
  wire  _T_4472 = btb_rd_addr_p1_f == 8'h9d; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4827 = _T_4472 ? btb_bank0_rd_data_way0_out_157 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5082 = _T_5081 | _T_4827; // @[Mux.scala 27:72]
  wire  _T_4474 = btb_rd_addr_p1_f == 8'h9e; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4828 = _T_4474 ? btb_bank0_rd_data_way0_out_158 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5083 = _T_5082 | _T_4828; // @[Mux.scala 27:72]
  wire  _T_4476 = btb_rd_addr_p1_f == 8'h9f; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4829 = _T_4476 ? btb_bank0_rd_data_way0_out_159 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5084 = _T_5083 | _T_4829; // @[Mux.scala 27:72]
  wire  _T_4478 = btb_rd_addr_p1_f == 8'ha0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4830 = _T_4478 ? btb_bank0_rd_data_way0_out_160 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5085 = _T_5084 | _T_4830; // @[Mux.scala 27:72]
  wire  _T_4480 = btb_rd_addr_p1_f == 8'ha1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4831 = _T_4480 ? btb_bank0_rd_data_way0_out_161 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5086 = _T_5085 | _T_4831; // @[Mux.scala 27:72]
  wire  _T_4482 = btb_rd_addr_p1_f == 8'ha2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4832 = _T_4482 ? btb_bank0_rd_data_way0_out_162 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5087 = _T_5086 | _T_4832; // @[Mux.scala 27:72]
  wire  _T_4484 = btb_rd_addr_p1_f == 8'ha3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4833 = _T_4484 ? btb_bank0_rd_data_way0_out_163 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5088 = _T_5087 | _T_4833; // @[Mux.scala 27:72]
  wire  _T_4486 = btb_rd_addr_p1_f == 8'ha4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4834 = _T_4486 ? btb_bank0_rd_data_way0_out_164 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5089 = _T_5088 | _T_4834; // @[Mux.scala 27:72]
  wire  _T_4488 = btb_rd_addr_p1_f == 8'ha5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4835 = _T_4488 ? btb_bank0_rd_data_way0_out_165 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5090 = _T_5089 | _T_4835; // @[Mux.scala 27:72]
  wire  _T_4490 = btb_rd_addr_p1_f == 8'ha6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4836 = _T_4490 ? btb_bank0_rd_data_way0_out_166 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5091 = _T_5090 | _T_4836; // @[Mux.scala 27:72]
  wire  _T_4492 = btb_rd_addr_p1_f == 8'ha7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4837 = _T_4492 ? btb_bank0_rd_data_way0_out_167 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5092 = _T_5091 | _T_4837; // @[Mux.scala 27:72]
  wire  _T_4494 = btb_rd_addr_p1_f == 8'ha8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4838 = _T_4494 ? btb_bank0_rd_data_way0_out_168 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5093 = _T_5092 | _T_4838; // @[Mux.scala 27:72]
  wire  _T_4496 = btb_rd_addr_p1_f == 8'ha9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4839 = _T_4496 ? btb_bank0_rd_data_way0_out_169 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5094 = _T_5093 | _T_4839; // @[Mux.scala 27:72]
  wire  _T_4498 = btb_rd_addr_p1_f == 8'haa; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4840 = _T_4498 ? btb_bank0_rd_data_way0_out_170 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5095 = _T_5094 | _T_4840; // @[Mux.scala 27:72]
  wire  _T_4500 = btb_rd_addr_p1_f == 8'hab; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4841 = _T_4500 ? btb_bank0_rd_data_way0_out_171 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5096 = _T_5095 | _T_4841; // @[Mux.scala 27:72]
  wire  _T_4502 = btb_rd_addr_p1_f == 8'hac; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4842 = _T_4502 ? btb_bank0_rd_data_way0_out_172 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5097 = _T_5096 | _T_4842; // @[Mux.scala 27:72]
  wire  _T_4504 = btb_rd_addr_p1_f == 8'had; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4843 = _T_4504 ? btb_bank0_rd_data_way0_out_173 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5098 = _T_5097 | _T_4843; // @[Mux.scala 27:72]
  wire  _T_4506 = btb_rd_addr_p1_f == 8'hae; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4844 = _T_4506 ? btb_bank0_rd_data_way0_out_174 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5099 = _T_5098 | _T_4844; // @[Mux.scala 27:72]
  wire  _T_4508 = btb_rd_addr_p1_f == 8'haf; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4845 = _T_4508 ? btb_bank0_rd_data_way0_out_175 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5100 = _T_5099 | _T_4845; // @[Mux.scala 27:72]
  wire  _T_4510 = btb_rd_addr_p1_f == 8'hb0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4846 = _T_4510 ? btb_bank0_rd_data_way0_out_176 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5101 = _T_5100 | _T_4846; // @[Mux.scala 27:72]
  wire  _T_4512 = btb_rd_addr_p1_f == 8'hb1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4847 = _T_4512 ? btb_bank0_rd_data_way0_out_177 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5102 = _T_5101 | _T_4847; // @[Mux.scala 27:72]
  wire  _T_4514 = btb_rd_addr_p1_f == 8'hb2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4848 = _T_4514 ? btb_bank0_rd_data_way0_out_178 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5103 = _T_5102 | _T_4848; // @[Mux.scala 27:72]
  wire  _T_4516 = btb_rd_addr_p1_f == 8'hb3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4849 = _T_4516 ? btb_bank0_rd_data_way0_out_179 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5104 = _T_5103 | _T_4849; // @[Mux.scala 27:72]
  wire  _T_4518 = btb_rd_addr_p1_f == 8'hb4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4850 = _T_4518 ? btb_bank0_rd_data_way0_out_180 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5105 = _T_5104 | _T_4850; // @[Mux.scala 27:72]
  wire  _T_4520 = btb_rd_addr_p1_f == 8'hb5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4851 = _T_4520 ? btb_bank0_rd_data_way0_out_181 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5106 = _T_5105 | _T_4851; // @[Mux.scala 27:72]
  wire  _T_4522 = btb_rd_addr_p1_f == 8'hb6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4852 = _T_4522 ? btb_bank0_rd_data_way0_out_182 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5107 = _T_5106 | _T_4852; // @[Mux.scala 27:72]
  wire  _T_4524 = btb_rd_addr_p1_f == 8'hb7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4853 = _T_4524 ? btb_bank0_rd_data_way0_out_183 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5108 = _T_5107 | _T_4853; // @[Mux.scala 27:72]
  wire  _T_4526 = btb_rd_addr_p1_f == 8'hb8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4854 = _T_4526 ? btb_bank0_rd_data_way0_out_184 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5109 = _T_5108 | _T_4854; // @[Mux.scala 27:72]
  wire  _T_4528 = btb_rd_addr_p1_f == 8'hb9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4855 = _T_4528 ? btb_bank0_rd_data_way0_out_185 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5110 = _T_5109 | _T_4855; // @[Mux.scala 27:72]
  wire  _T_4530 = btb_rd_addr_p1_f == 8'hba; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4856 = _T_4530 ? btb_bank0_rd_data_way0_out_186 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5111 = _T_5110 | _T_4856; // @[Mux.scala 27:72]
  wire  _T_4532 = btb_rd_addr_p1_f == 8'hbb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4857 = _T_4532 ? btb_bank0_rd_data_way0_out_187 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5112 = _T_5111 | _T_4857; // @[Mux.scala 27:72]
  wire  _T_4534 = btb_rd_addr_p1_f == 8'hbc; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4858 = _T_4534 ? btb_bank0_rd_data_way0_out_188 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5113 = _T_5112 | _T_4858; // @[Mux.scala 27:72]
  wire  _T_4536 = btb_rd_addr_p1_f == 8'hbd; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4859 = _T_4536 ? btb_bank0_rd_data_way0_out_189 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5114 = _T_5113 | _T_4859; // @[Mux.scala 27:72]
  wire  _T_4538 = btb_rd_addr_p1_f == 8'hbe; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4860 = _T_4538 ? btb_bank0_rd_data_way0_out_190 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5115 = _T_5114 | _T_4860; // @[Mux.scala 27:72]
  wire  _T_4540 = btb_rd_addr_p1_f == 8'hbf; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4861 = _T_4540 ? btb_bank0_rd_data_way0_out_191 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5116 = _T_5115 | _T_4861; // @[Mux.scala 27:72]
  wire  _T_4542 = btb_rd_addr_p1_f == 8'hc0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4862 = _T_4542 ? btb_bank0_rd_data_way0_out_192 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5117 = _T_5116 | _T_4862; // @[Mux.scala 27:72]
  wire  _T_4544 = btb_rd_addr_p1_f == 8'hc1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4863 = _T_4544 ? btb_bank0_rd_data_way0_out_193 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5118 = _T_5117 | _T_4863; // @[Mux.scala 27:72]
  wire  _T_4546 = btb_rd_addr_p1_f == 8'hc2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4864 = _T_4546 ? btb_bank0_rd_data_way0_out_194 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5119 = _T_5118 | _T_4864; // @[Mux.scala 27:72]
  wire  _T_4548 = btb_rd_addr_p1_f == 8'hc3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4865 = _T_4548 ? btb_bank0_rd_data_way0_out_195 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5120 = _T_5119 | _T_4865; // @[Mux.scala 27:72]
  wire  _T_4550 = btb_rd_addr_p1_f == 8'hc4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4866 = _T_4550 ? btb_bank0_rd_data_way0_out_196 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5121 = _T_5120 | _T_4866; // @[Mux.scala 27:72]
  wire  _T_4552 = btb_rd_addr_p1_f == 8'hc5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4867 = _T_4552 ? btb_bank0_rd_data_way0_out_197 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5122 = _T_5121 | _T_4867; // @[Mux.scala 27:72]
  wire  _T_4554 = btb_rd_addr_p1_f == 8'hc6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4868 = _T_4554 ? btb_bank0_rd_data_way0_out_198 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5123 = _T_5122 | _T_4868; // @[Mux.scala 27:72]
  wire  _T_4556 = btb_rd_addr_p1_f == 8'hc7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4869 = _T_4556 ? btb_bank0_rd_data_way0_out_199 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5124 = _T_5123 | _T_4869; // @[Mux.scala 27:72]
  wire  _T_4558 = btb_rd_addr_p1_f == 8'hc8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4870 = _T_4558 ? btb_bank0_rd_data_way0_out_200 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5125 = _T_5124 | _T_4870; // @[Mux.scala 27:72]
  wire  _T_4560 = btb_rd_addr_p1_f == 8'hc9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4871 = _T_4560 ? btb_bank0_rd_data_way0_out_201 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5126 = _T_5125 | _T_4871; // @[Mux.scala 27:72]
  wire  _T_4562 = btb_rd_addr_p1_f == 8'hca; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4872 = _T_4562 ? btb_bank0_rd_data_way0_out_202 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5127 = _T_5126 | _T_4872; // @[Mux.scala 27:72]
  wire  _T_4564 = btb_rd_addr_p1_f == 8'hcb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4873 = _T_4564 ? btb_bank0_rd_data_way0_out_203 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5128 = _T_5127 | _T_4873; // @[Mux.scala 27:72]
  wire  _T_4566 = btb_rd_addr_p1_f == 8'hcc; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4874 = _T_4566 ? btb_bank0_rd_data_way0_out_204 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5129 = _T_5128 | _T_4874; // @[Mux.scala 27:72]
  wire  _T_4568 = btb_rd_addr_p1_f == 8'hcd; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4875 = _T_4568 ? btb_bank0_rd_data_way0_out_205 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5130 = _T_5129 | _T_4875; // @[Mux.scala 27:72]
  wire  _T_4570 = btb_rd_addr_p1_f == 8'hce; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4876 = _T_4570 ? btb_bank0_rd_data_way0_out_206 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5131 = _T_5130 | _T_4876; // @[Mux.scala 27:72]
  wire  _T_4572 = btb_rd_addr_p1_f == 8'hcf; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4877 = _T_4572 ? btb_bank0_rd_data_way0_out_207 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5132 = _T_5131 | _T_4877; // @[Mux.scala 27:72]
  wire  _T_4574 = btb_rd_addr_p1_f == 8'hd0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4878 = _T_4574 ? btb_bank0_rd_data_way0_out_208 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5133 = _T_5132 | _T_4878; // @[Mux.scala 27:72]
  wire  _T_4576 = btb_rd_addr_p1_f == 8'hd1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4879 = _T_4576 ? btb_bank0_rd_data_way0_out_209 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5134 = _T_5133 | _T_4879; // @[Mux.scala 27:72]
  wire  _T_4578 = btb_rd_addr_p1_f == 8'hd2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4880 = _T_4578 ? btb_bank0_rd_data_way0_out_210 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5135 = _T_5134 | _T_4880; // @[Mux.scala 27:72]
  wire  _T_4580 = btb_rd_addr_p1_f == 8'hd3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4881 = _T_4580 ? btb_bank0_rd_data_way0_out_211 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5136 = _T_5135 | _T_4881; // @[Mux.scala 27:72]
  wire  _T_4582 = btb_rd_addr_p1_f == 8'hd4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4882 = _T_4582 ? btb_bank0_rd_data_way0_out_212 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5137 = _T_5136 | _T_4882; // @[Mux.scala 27:72]
  wire  _T_4584 = btb_rd_addr_p1_f == 8'hd5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4883 = _T_4584 ? btb_bank0_rd_data_way0_out_213 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5138 = _T_5137 | _T_4883; // @[Mux.scala 27:72]
  wire  _T_4586 = btb_rd_addr_p1_f == 8'hd6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4884 = _T_4586 ? btb_bank0_rd_data_way0_out_214 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5139 = _T_5138 | _T_4884; // @[Mux.scala 27:72]
  wire  _T_4588 = btb_rd_addr_p1_f == 8'hd7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4885 = _T_4588 ? btb_bank0_rd_data_way0_out_215 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5140 = _T_5139 | _T_4885; // @[Mux.scala 27:72]
  wire  _T_4590 = btb_rd_addr_p1_f == 8'hd8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4886 = _T_4590 ? btb_bank0_rd_data_way0_out_216 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5141 = _T_5140 | _T_4886; // @[Mux.scala 27:72]
  wire  _T_4592 = btb_rd_addr_p1_f == 8'hd9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4887 = _T_4592 ? btb_bank0_rd_data_way0_out_217 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5142 = _T_5141 | _T_4887; // @[Mux.scala 27:72]
  wire  _T_4594 = btb_rd_addr_p1_f == 8'hda; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4888 = _T_4594 ? btb_bank0_rd_data_way0_out_218 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5143 = _T_5142 | _T_4888; // @[Mux.scala 27:72]
  wire  _T_4596 = btb_rd_addr_p1_f == 8'hdb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4889 = _T_4596 ? btb_bank0_rd_data_way0_out_219 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5144 = _T_5143 | _T_4889; // @[Mux.scala 27:72]
  wire  _T_4598 = btb_rd_addr_p1_f == 8'hdc; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4890 = _T_4598 ? btb_bank0_rd_data_way0_out_220 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5145 = _T_5144 | _T_4890; // @[Mux.scala 27:72]
  wire  _T_4600 = btb_rd_addr_p1_f == 8'hdd; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4891 = _T_4600 ? btb_bank0_rd_data_way0_out_221 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5146 = _T_5145 | _T_4891; // @[Mux.scala 27:72]
  wire  _T_4602 = btb_rd_addr_p1_f == 8'hde; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4892 = _T_4602 ? btb_bank0_rd_data_way0_out_222 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5147 = _T_5146 | _T_4892; // @[Mux.scala 27:72]
  wire  _T_4604 = btb_rd_addr_p1_f == 8'hdf; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4893 = _T_4604 ? btb_bank0_rd_data_way0_out_223 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5148 = _T_5147 | _T_4893; // @[Mux.scala 27:72]
  wire  _T_4606 = btb_rd_addr_p1_f == 8'he0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4894 = _T_4606 ? btb_bank0_rd_data_way0_out_224 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5149 = _T_5148 | _T_4894; // @[Mux.scala 27:72]
  wire  _T_4608 = btb_rd_addr_p1_f == 8'he1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4895 = _T_4608 ? btb_bank0_rd_data_way0_out_225 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5150 = _T_5149 | _T_4895; // @[Mux.scala 27:72]
  wire  _T_4610 = btb_rd_addr_p1_f == 8'he2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4896 = _T_4610 ? btb_bank0_rd_data_way0_out_226 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5151 = _T_5150 | _T_4896; // @[Mux.scala 27:72]
  wire  _T_4612 = btb_rd_addr_p1_f == 8'he3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4897 = _T_4612 ? btb_bank0_rd_data_way0_out_227 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5152 = _T_5151 | _T_4897; // @[Mux.scala 27:72]
  wire  _T_4614 = btb_rd_addr_p1_f == 8'he4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4898 = _T_4614 ? btb_bank0_rd_data_way0_out_228 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5153 = _T_5152 | _T_4898; // @[Mux.scala 27:72]
  wire  _T_4616 = btb_rd_addr_p1_f == 8'he5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4899 = _T_4616 ? btb_bank0_rd_data_way0_out_229 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5154 = _T_5153 | _T_4899; // @[Mux.scala 27:72]
  wire  _T_4618 = btb_rd_addr_p1_f == 8'he6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4900 = _T_4618 ? btb_bank0_rd_data_way0_out_230 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5155 = _T_5154 | _T_4900; // @[Mux.scala 27:72]
  wire  _T_4620 = btb_rd_addr_p1_f == 8'he7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4901 = _T_4620 ? btb_bank0_rd_data_way0_out_231 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5156 = _T_5155 | _T_4901; // @[Mux.scala 27:72]
  wire  _T_4622 = btb_rd_addr_p1_f == 8'he8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4902 = _T_4622 ? btb_bank0_rd_data_way0_out_232 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5157 = _T_5156 | _T_4902; // @[Mux.scala 27:72]
  wire  _T_4624 = btb_rd_addr_p1_f == 8'he9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4903 = _T_4624 ? btb_bank0_rd_data_way0_out_233 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5158 = _T_5157 | _T_4903; // @[Mux.scala 27:72]
  wire  _T_4626 = btb_rd_addr_p1_f == 8'hea; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4904 = _T_4626 ? btb_bank0_rd_data_way0_out_234 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5159 = _T_5158 | _T_4904; // @[Mux.scala 27:72]
  wire  _T_4628 = btb_rd_addr_p1_f == 8'heb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4905 = _T_4628 ? btb_bank0_rd_data_way0_out_235 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5160 = _T_5159 | _T_4905; // @[Mux.scala 27:72]
  wire  _T_4630 = btb_rd_addr_p1_f == 8'hec; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4906 = _T_4630 ? btb_bank0_rd_data_way0_out_236 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5161 = _T_5160 | _T_4906; // @[Mux.scala 27:72]
  wire  _T_4632 = btb_rd_addr_p1_f == 8'hed; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4907 = _T_4632 ? btb_bank0_rd_data_way0_out_237 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5162 = _T_5161 | _T_4907; // @[Mux.scala 27:72]
  wire  _T_4634 = btb_rd_addr_p1_f == 8'hee; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4908 = _T_4634 ? btb_bank0_rd_data_way0_out_238 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5163 = _T_5162 | _T_4908; // @[Mux.scala 27:72]
  wire  _T_4636 = btb_rd_addr_p1_f == 8'hef; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4909 = _T_4636 ? btb_bank0_rd_data_way0_out_239 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5164 = _T_5163 | _T_4909; // @[Mux.scala 27:72]
  wire  _T_4638 = btb_rd_addr_p1_f == 8'hf0; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4910 = _T_4638 ? btb_bank0_rd_data_way0_out_240 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5165 = _T_5164 | _T_4910; // @[Mux.scala 27:72]
  wire  _T_4640 = btb_rd_addr_p1_f == 8'hf1; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4911 = _T_4640 ? btb_bank0_rd_data_way0_out_241 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5166 = _T_5165 | _T_4911; // @[Mux.scala 27:72]
  wire  _T_4642 = btb_rd_addr_p1_f == 8'hf2; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4912 = _T_4642 ? btb_bank0_rd_data_way0_out_242 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5167 = _T_5166 | _T_4912; // @[Mux.scala 27:72]
  wire  _T_4644 = btb_rd_addr_p1_f == 8'hf3; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4913 = _T_4644 ? btb_bank0_rd_data_way0_out_243 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5168 = _T_5167 | _T_4913; // @[Mux.scala 27:72]
  wire  _T_4646 = btb_rd_addr_p1_f == 8'hf4; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4914 = _T_4646 ? btb_bank0_rd_data_way0_out_244 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5169 = _T_5168 | _T_4914; // @[Mux.scala 27:72]
  wire  _T_4648 = btb_rd_addr_p1_f == 8'hf5; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4915 = _T_4648 ? btb_bank0_rd_data_way0_out_245 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5170 = _T_5169 | _T_4915; // @[Mux.scala 27:72]
  wire  _T_4650 = btb_rd_addr_p1_f == 8'hf6; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4916 = _T_4650 ? btb_bank0_rd_data_way0_out_246 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5171 = _T_5170 | _T_4916; // @[Mux.scala 27:72]
  wire  _T_4652 = btb_rd_addr_p1_f == 8'hf7; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4917 = _T_4652 ? btb_bank0_rd_data_way0_out_247 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5172 = _T_5171 | _T_4917; // @[Mux.scala 27:72]
  wire  _T_4654 = btb_rd_addr_p1_f == 8'hf8; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4918 = _T_4654 ? btb_bank0_rd_data_way0_out_248 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5173 = _T_5172 | _T_4918; // @[Mux.scala 27:72]
  wire  _T_4656 = btb_rd_addr_p1_f == 8'hf9; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4919 = _T_4656 ? btb_bank0_rd_data_way0_out_249 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5174 = _T_5173 | _T_4919; // @[Mux.scala 27:72]
  wire  _T_4658 = btb_rd_addr_p1_f == 8'hfa; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4920 = _T_4658 ? btb_bank0_rd_data_way0_out_250 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5175 = _T_5174 | _T_4920; // @[Mux.scala 27:72]
  wire  _T_4660 = btb_rd_addr_p1_f == 8'hfb; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4921 = _T_4660 ? btb_bank0_rd_data_way0_out_251 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5176 = _T_5175 | _T_4921; // @[Mux.scala 27:72]
  wire  _T_4662 = btb_rd_addr_p1_f == 8'hfc; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4922 = _T_4662 ? btb_bank0_rd_data_way0_out_252 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5177 = _T_5176 | _T_4922; // @[Mux.scala 27:72]
  wire  _T_4664 = btb_rd_addr_p1_f == 8'hfd; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4923 = _T_4664 ? btb_bank0_rd_data_way0_out_253 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5178 = _T_5177 | _T_4923; // @[Mux.scala 27:72]
  wire  _T_4666 = btb_rd_addr_p1_f == 8'hfe; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4924 = _T_4666 ? btb_bank0_rd_data_way0_out_254 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5179 = _T_5178 | _T_4924; // @[Mux.scala 27:72]
  wire  _T_4668 = btb_rd_addr_p1_f == 8'hff; // @[el2_ifu_bp_ctl.scala 376:83]
  wire [21:0] _T_4925 = _T_4668 ? btb_bank0_rd_data_way0_out_255 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way0_p1_f = _T_5179 | _T_4925; // @[Mux.scala 27:72]
  wire [4:0] _T_31 = _T_8[13:9] ^ _T_8[18:14]; // @[el2_lib.scala 176:111]
  wire [4:0] fetch_rd_tag_p1_f = _T_31 ^ _T_8[23:19]; // @[el2_lib.scala 176:111]
  wire  _T_63 = btb_bank0_rd_data_way0_p1_f[21:17] == fetch_rd_tag_p1_f; // @[el2_ifu_bp_ctl.scala 142:106]
  wire  _T_64 = btb_bank0_rd_data_way0_p1_f[0] & _T_63; // @[el2_ifu_bp_ctl.scala 142:61]
  wire  _T_67 = _T_64 & _T_48; // @[el2_ifu_bp_ctl.scala 142:129]
  wire  _T_68 = _T_67 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 143:56]
  wire  tag_match_way0_p1_f = _T_68 & _T; // @[el2_ifu_bp_ctl.scala 143:77]
  wire  _T_99 = btb_bank0_rd_data_way0_p1_f[3] ^ btb_bank0_rd_data_way0_p1_f[4]; // @[el2_ifu_bp_ctl.scala 156:100]
  wire  _T_100 = tag_match_way0_p1_f & _T_99; // @[el2_ifu_bp_ctl.scala 156:62]
  wire  _T_104 = ~_T_99; // @[el2_ifu_bp_ctl.scala 157:64]
  wire  _T_105 = tag_match_way0_p1_f & _T_104; // @[el2_ifu_bp_ctl.scala 157:62]
  wire [1:0] tag_match_way0_expanded_p1_f = {_T_100,_T_105}; // @[Cat.scala 29:58]
  wire [21:0] _T_133 = tag_match_way0_expanded_p1_f[0] ? btb_bank0_rd_data_way0_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5694 = _T_4158 ? btb_bank0_rd_data_way1_out_0 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5695 = _T_4160 ? btb_bank0_rd_data_way1_out_1 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5950 = _T_5694 | _T_5695; // @[Mux.scala 27:72]
  wire [21:0] _T_5696 = _T_4162 ? btb_bank0_rd_data_way1_out_2 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5951 = _T_5950 | _T_5696; // @[Mux.scala 27:72]
  wire [21:0] _T_5697 = _T_4164 ? btb_bank0_rd_data_way1_out_3 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5952 = _T_5951 | _T_5697; // @[Mux.scala 27:72]
  wire [21:0] _T_5698 = _T_4166 ? btb_bank0_rd_data_way1_out_4 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5953 = _T_5952 | _T_5698; // @[Mux.scala 27:72]
  wire [21:0] _T_5699 = _T_4168 ? btb_bank0_rd_data_way1_out_5 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5954 = _T_5953 | _T_5699; // @[Mux.scala 27:72]
  wire [21:0] _T_5700 = _T_4170 ? btb_bank0_rd_data_way1_out_6 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5955 = _T_5954 | _T_5700; // @[Mux.scala 27:72]
  wire [21:0] _T_5701 = _T_4172 ? btb_bank0_rd_data_way1_out_7 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5956 = _T_5955 | _T_5701; // @[Mux.scala 27:72]
  wire [21:0] _T_5702 = _T_4174 ? btb_bank0_rd_data_way1_out_8 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5957 = _T_5956 | _T_5702; // @[Mux.scala 27:72]
  wire [21:0] _T_5703 = _T_4176 ? btb_bank0_rd_data_way1_out_9 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5958 = _T_5957 | _T_5703; // @[Mux.scala 27:72]
  wire [21:0] _T_5704 = _T_4178 ? btb_bank0_rd_data_way1_out_10 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5959 = _T_5958 | _T_5704; // @[Mux.scala 27:72]
  wire [21:0] _T_5705 = _T_4180 ? btb_bank0_rd_data_way1_out_11 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5960 = _T_5959 | _T_5705; // @[Mux.scala 27:72]
  wire [21:0] _T_5706 = _T_4182 ? btb_bank0_rd_data_way1_out_12 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5961 = _T_5960 | _T_5706; // @[Mux.scala 27:72]
  wire [21:0] _T_5707 = _T_4184 ? btb_bank0_rd_data_way1_out_13 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5962 = _T_5961 | _T_5707; // @[Mux.scala 27:72]
  wire [21:0] _T_5708 = _T_4186 ? btb_bank0_rd_data_way1_out_14 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5963 = _T_5962 | _T_5708; // @[Mux.scala 27:72]
  wire [21:0] _T_5709 = _T_4188 ? btb_bank0_rd_data_way1_out_15 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5964 = _T_5963 | _T_5709; // @[Mux.scala 27:72]
  wire [21:0] _T_5710 = _T_4190 ? btb_bank0_rd_data_way1_out_16 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5965 = _T_5964 | _T_5710; // @[Mux.scala 27:72]
  wire [21:0] _T_5711 = _T_4192 ? btb_bank0_rd_data_way1_out_17 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5966 = _T_5965 | _T_5711; // @[Mux.scala 27:72]
  wire [21:0] _T_5712 = _T_4194 ? btb_bank0_rd_data_way1_out_18 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5967 = _T_5966 | _T_5712; // @[Mux.scala 27:72]
  wire [21:0] _T_5713 = _T_4196 ? btb_bank0_rd_data_way1_out_19 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5968 = _T_5967 | _T_5713; // @[Mux.scala 27:72]
  wire [21:0] _T_5714 = _T_4198 ? btb_bank0_rd_data_way1_out_20 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5969 = _T_5968 | _T_5714; // @[Mux.scala 27:72]
  wire [21:0] _T_5715 = _T_4200 ? btb_bank0_rd_data_way1_out_21 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5970 = _T_5969 | _T_5715; // @[Mux.scala 27:72]
  wire [21:0] _T_5716 = _T_4202 ? btb_bank0_rd_data_way1_out_22 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5971 = _T_5970 | _T_5716; // @[Mux.scala 27:72]
  wire [21:0] _T_5717 = _T_4204 ? btb_bank0_rd_data_way1_out_23 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5972 = _T_5971 | _T_5717; // @[Mux.scala 27:72]
  wire [21:0] _T_5718 = _T_4206 ? btb_bank0_rd_data_way1_out_24 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5973 = _T_5972 | _T_5718; // @[Mux.scala 27:72]
  wire [21:0] _T_5719 = _T_4208 ? btb_bank0_rd_data_way1_out_25 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5974 = _T_5973 | _T_5719; // @[Mux.scala 27:72]
  wire [21:0] _T_5720 = _T_4210 ? btb_bank0_rd_data_way1_out_26 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5975 = _T_5974 | _T_5720; // @[Mux.scala 27:72]
  wire [21:0] _T_5721 = _T_4212 ? btb_bank0_rd_data_way1_out_27 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5976 = _T_5975 | _T_5721; // @[Mux.scala 27:72]
  wire [21:0] _T_5722 = _T_4214 ? btb_bank0_rd_data_way1_out_28 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5977 = _T_5976 | _T_5722; // @[Mux.scala 27:72]
  wire [21:0] _T_5723 = _T_4216 ? btb_bank0_rd_data_way1_out_29 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5978 = _T_5977 | _T_5723; // @[Mux.scala 27:72]
  wire [21:0] _T_5724 = _T_4218 ? btb_bank0_rd_data_way1_out_30 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5979 = _T_5978 | _T_5724; // @[Mux.scala 27:72]
  wire [21:0] _T_5725 = _T_4220 ? btb_bank0_rd_data_way1_out_31 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5980 = _T_5979 | _T_5725; // @[Mux.scala 27:72]
  wire [21:0] _T_5726 = _T_4222 ? btb_bank0_rd_data_way1_out_32 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5981 = _T_5980 | _T_5726; // @[Mux.scala 27:72]
  wire [21:0] _T_5727 = _T_4224 ? btb_bank0_rd_data_way1_out_33 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5982 = _T_5981 | _T_5727; // @[Mux.scala 27:72]
  wire [21:0] _T_5728 = _T_4226 ? btb_bank0_rd_data_way1_out_34 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5983 = _T_5982 | _T_5728; // @[Mux.scala 27:72]
  wire [21:0] _T_5729 = _T_4228 ? btb_bank0_rd_data_way1_out_35 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5984 = _T_5983 | _T_5729; // @[Mux.scala 27:72]
  wire [21:0] _T_5730 = _T_4230 ? btb_bank0_rd_data_way1_out_36 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5985 = _T_5984 | _T_5730; // @[Mux.scala 27:72]
  wire [21:0] _T_5731 = _T_4232 ? btb_bank0_rd_data_way1_out_37 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5986 = _T_5985 | _T_5731; // @[Mux.scala 27:72]
  wire [21:0] _T_5732 = _T_4234 ? btb_bank0_rd_data_way1_out_38 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5987 = _T_5986 | _T_5732; // @[Mux.scala 27:72]
  wire [21:0] _T_5733 = _T_4236 ? btb_bank0_rd_data_way1_out_39 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5988 = _T_5987 | _T_5733; // @[Mux.scala 27:72]
  wire [21:0] _T_5734 = _T_4238 ? btb_bank0_rd_data_way1_out_40 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5989 = _T_5988 | _T_5734; // @[Mux.scala 27:72]
  wire [21:0] _T_5735 = _T_4240 ? btb_bank0_rd_data_way1_out_41 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5990 = _T_5989 | _T_5735; // @[Mux.scala 27:72]
  wire [21:0] _T_5736 = _T_4242 ? btb_bank0_rd_data_way1_out_42 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5991 = _T_5990 | _T_5736; // @[Mux.scala 27:72]
  wire [21:0] _T_5737 = _T_4244 ? btb_bank0_rd_data_way1_out_43 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5992 = _T_5991 | _T_5737; // @[Mux.scala 27:72]
  wire [21:0] _T_5738 = _T_4246 ? btb_bank0_rd_data_way1_out_44 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5993 = _T_5992 | _T_5738; // @[Mux.scala 27:72]
  wire [21:0] _T_5739 = _T_4248 ? btb_bank0_rd_data_way1_out_45 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5994 = _T_5993 | _T_5739; // @[Mux.scala 27:72]
  wire [21:0] _T_5740 = _T_4250 ? btb_bank0_rd_data_way1_out_46 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5995 = _T_5994 | _T_5740; // @[Mux.scala 27:72]
  wire [21:0] _T_5741 = _T_4252 ? btb_bank0_rd_data_way1_out_47 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5996 = _T_5995 | _T_5741; // @[Mux.scala 27:72]
  wire [21:0] _T_5742 = _T_4254 ? btb_bank0_rd_data_way1_out_48 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5997 = _T_5996 | _T_5742; // @[Mux.scala 27:72]
  wire [21:0] _T_5743 = _T_4256 ? btb_bank0_rd_data_way1_out_49 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5998 = _T_5997 | _T_5743; // @[Mux.scala 27:72]
  wire [21:0] _T_5744 = _T_4258 ? btb_bank0_rd_data_way1_out_50 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_5999 = _T_5998 | _T_5744; // @[Mux.scala 27:72]
  wire [21:0] _T_5745 = _T_4260 ? btb_bank0_rd_data_way1_out_51 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6000 = _T_5999 | _T_5745; // @[Mux.scala 27:72]
  wire [21:0] _T_5746 = _T_4262 ? btb_bank0_rd_data_way1_out_52 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6001 = _T_6000 | _T_5746; // @[Mux.scala 27:72]
  wire [21:0] _T_5747 = _T_4264 ? btb_bank0_rd_data_way1_out_53 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6002 = _T_6001 | _T_5747; // @[Mux.scala 27:72]
  wire [21:0] _T_5748 = _T_4266 ? btb_bank0_rd_data_way1_out_54 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6003 = _T_6002 | _T_5748; // @[Mux.scala 27:72]
  wire [21:0] _T_5749 = _T_4268 ? btb_bank0_rd_data_way1_out_55 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6004 = _T_6003 | _T_5749; // @[Mux.scala 27:72]
  wire [21:0] _T_5750 = _T_4270 ? btb_bank0_rd_data_way1_out_56 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6005 = _T_6004 | _T_5750; // @[Mux.scala 27:72]
  wire [21:0] _T_5751 = _T_4272 ? btb_bank0_rd_data_way1_out_57 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6006 = _T_6005 | _T_5751; // @[Mux.scala 27:72]
  wire [21:0] _T_5752 = _T_4274 ? btb_bank0_rd_data_way1_out_58 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6007 = _T_6006 | _T_5752; // @[Mux.scala 27:72]
  wire [21:0] _T_5753 = _T_4276 ? btb_bank0_rd_data_way1_out_59 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6008 = _T_6007 | _T_5753; // @[Mux.scala 27:72]
  wire [21:0] _T_5754 = _T_4278 ? btb_bank0_rd_data_way1_out_60 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6009 = _T_6008 | _T_5754; // @[Mux.scala 27:72]
  wire [21:0] _T_5755 = _T_4280 ? btb_bank0_rd_data_way1_out_61 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6010 = _T_6009 | _T_5755; // @[Mux.scala 27:72]
  wire [21:0] _T_5756 = _T_4282 ? btb_bank0_rd_data_way1_out_62 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6011 = _T_6010 | _T_5756; // @[Mux.scala 27:72]
  wire [21:0] _T_5757 = _T_4284 ? btb_bank0_rd_data_way1_out_63 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6012 = _T_6011 | _T_5757; // @[Mux.scala 27:72]
  wire [21:0] _T_5758 = _T_4286 ? btb_bank0_rd_data_way1_out_64 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6013 = _T_6012 | _T_5758; // @[Mux.scala 27:72]
  wire [21:0] _T_5759 = _T_4288 ? btb_bank0_rd_data_way1_out_65 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6014 = _T_6013 | _T_5759; // @[Mux.scala 27:72]
  wire [21:0] _T_5760 = _T_4290 ? btb_bank0_rd_data_way1_out_66 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6015 = _T_6014 | _T_5760; // @[Mux.scala 27:72]
  wire [21:0] _T_5761 = _T_4292 ? btb_bank0_rd_data_way1_out_67 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6016 = _T_6015 | _T_5761; // @[Mux.scala 27:72]
  wire [21:0] _T_5762 = _T_4294 ? btb_bank0_rd_data_way1_out_68 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6017 = _T_6016 | _T_5762; // @[Mux.scala 27:72]
  wire [21:0] _T_5763 = _T_4296 ? btb_bank0_rd_data_way1_out_69 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6018 = _T_6017 | _T_5763; // @[Mux.scala 27:72]
  wire [21:0] _T_5764 = _T_4298 ? btb_bank0_rd_data_way1_out_70 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6019 = _T_6018 | _T_5764; // @[Mux.scala 27:72]
  wire [21:0] _T_5765 = _T_4300 ? btb_bank0_rd_data_way1_out_71 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6020 = _T_6019 | _T_5765; // @[Mux.scala 27:72]
  wire [21:0] _T_5766 = _T_4302 ? btb_bank0_rd_data_way1_out_72 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6021 = _T_6020 | _T_5766; // @[Mux.scala 27:72]
  wire [21:0] _T_5767 = _T_4304 ? btb_bank0_rd_data_way1_out_73 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6022 = _T_6021 | _T_5767; // @[Mux.scala 27:72]
  wire [21:0] _T_5768 = _T_4306 ? btb_bank0_rd_data_way1_out_74 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6023 = _T_6022 | _T_5768; // @[Mux.scala 27:72]
  wire [21:0] _T_5769 = _T_4308 ? btb_bank0_rd_data_way1_out_75 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6024 = _T_6023 | _T_5769; // @[Mux.scala 27:72]
  wire [21:0] _T_5770 = _T_4310 ? btb_bank0_rd_data_way1_out_76 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6025 = _T_6024 | _T_5770; // @[Mux.scala 27:72]
  wire [21:0] _T_5771 = _T_4312 ? btb_bank0_rd_data_way1_out_77 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6026 = _T_6025 | _T_5771; // @[Mux.scala 27:72]
  wire [21:0] _T_5772 = _T_4314 ? btb_bank0_rd_data_way1_out_78 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6027 = _T_6026 | _T_5772; // @[Mux.scala 27:72]
  wire [21:0] _T_5773 = _T_4316 ? btb_bank0_rd_data_way1_out_79 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6028 = _T_6027 | _T_5773; // @[Mux.scala 27:72]
  wire [21:0] _T_5774 = _T_4318 ? btb_bank0_rd_data_way1_out_80 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6029 = _T_6028 | _T_5774; // @[Mux.scala 27:72]
  wire [21:0] _T_5775 = _T_4320 ? btb_bank0_rd_data_way1_out_81 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6030 = _T_6029 | _T_5775; // @[Mux.scala 27:72]
  wire [21:0] _T_5776 = _T_4322 ? btb_bank0_rd_data_way1_out_82 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6031 = _T_6030 | _T_5776; // @[Mux.scala 27:72]
  wire [21:0] _T_5777 = _T_4324 ? btb_bank0_rd_data_way1_out_83 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6032 = _T_6031 | _T_5777; // @[Mux.scala 27:72]
  wire [21:0] _T_5778 = _T_4326 ? btb_bank0_rd_data_way1_out_84 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6033 = _T_6032 | _T_5778; // @[Mux.scala 27:72]
  wire [21:0] _T_5779 = _T_4328 ? btb_bank0_rd_data_way1_out_85 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6034 = _T_6033 | _T_5779; // @[Mux.scala 27:72]
  wire [21:0] _T_5780 = _T_4330 ? btb_bank0_rd_data_way1_out_86 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6035 = _T_6034 | _T_5780; // @[Mux.scala 27:72]
  wire [21:0] _T_5781 = _T_4332 ? btb_bank0_rd_data_way1_out_87 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6036 = _T_6035 | _T_5781; // @[Mux.scala 27:72]
  wire [21:0] _T_5782 = _T_4334 ? btb_bank0_rd_data_way1_out_88 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6037 = _T_6036 | _T_5782; // @[Mux.scala 27:72]
  wire [21:0] _T_5783 = _T_4336 ? btb_bank0_rd_data_way1_out_89 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6038 = _T_6037 | _T_5783; // @[Mux.scala 27:72]
  wire [21:0] _T_5784 = _T_4338 ? btb_bank0_rd_data_way1_out_90 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6039 = _T_6038 | _T_5784; // @[Mux.scala 27:72]
  wire [21:0] _T_5785 = _T_4340 ? btb_bank0_rd_data_way1_out_91 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6040 = _T_6039 | _T_5785; // @[Mux.scala 27:72]
  wire [21:0] _T_5786 = _T_4342 ? btb_bank0_rd_data_way1_out_92 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6041 = _T_6040 | _T_5786; // @[Mux.scala 27:72]
  wire [21:0] _T_5787 = _T_4344 ? btb_bank0_rd_data_way1_out_93 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6042 = _T_6041 | _T_5787; // @[Mux.scala 27:72]
  wire [21:0] _T_5788 = _T_4346 ? btb_bank0_rd_data_way1_out_94 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6043 = _T_6042 | _T_5788; // @[Mux.scala 27:72]
  wire [21:0] _T_5789 = _T_4348 ? btb_bank0_rd_data_way1_out_95 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6044 = _T_6043 | _T_5789; // @[Mux.scala 27:72]
  wire [21:0] _T_5790 = _T_4350 ? btb_bank0_rd_data_way1_out_96 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6045 = _T_6044 | _T_5790; // @[Mux.scala 27:72]
  wire [21:0] _T_5791 = _T_4352 ? btb_bank0_rd_data_way1_out_97 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6046 = _T_6045 | _T_5791; // @[Mux.scala 27:72]
  wire [21:0] _T_5792 = _T_4354 ? btb_bank0_rd_data_way1_out_98 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6047 = _T_6046 | _T_5792; // @[Mux.scala 27:72]
  wire [21:0] _T_5793 = _T_4356 ? btb_bank0_rd_data_way1_out_99 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6048 = _T_6047 | _T_5793; // @[Mux.scala 27:72]
  wire [21:0] _T_5794 = _T_4358 ? btb_bank0_rd_data_way1_out_100 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6049 = _T_6048 | _T_5794; // @[Mux.scala 27:72]
  wire [21:0] _T_5795 = _T_4360 ? btb_bank0_rd_data_way1_out_101 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6050 = _T_6049 | _T_5795; // @[Mux.scala 27:72]
  wire [21:0] _T_5796 = _T_4362 ? btb_bank0_rd_data_way1_out_102 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6051 = _T_6050 | _T_5796; // @[Mux.scala 27:72]
  wire [21:0] _T_5797 = _T_4364 ? btb_bank0_rd_data_way1_out_103 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6052 = _T_6051 | _T_5797; // @[Mux.scala 27:72]
  wire [21:0] _T_5798 = _T_4366 ? btb_bank0_rd_data_way1_out_104 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6053 = _T_6052 | _T_5798; // @[Mux.scala 27:72]
  wire [21:0] _T_5799 = _T_4368 ? btb_bank0_rd_data_way1_out_105 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6054 = _T_6053 | _T_5799; // @[Mux.scala 27:72]
  wire [21:0] _T_5800 = _T_4370 ? btb_bank0_rd_data_way1_out_106 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6055 = _T_6054 | _T_5800; // @[Mux.scala 27:72]
  wire [21:0] _T_5801 = _T_4372 ? btb_bank0_rd_data_way1_out_107 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6056 = _T_6055 | _T_5801; // @[Mux.scala 27:72]
  wire [21:0] _T_5802 = _T_4374 ? btb_bank0_rd_data_way1_out_108 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6057 = _T_6056 | _T_5802; // @[Mux.scala 27:72]
  wire [21:0] _T_5803 = _T_4376 ? btb_bank0_rd_data_way1_out_109 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6058 = _T_6057 | _T_5803; // @[Mux.scala 27:72]
  wire [21:0] _T_5804 = _T_4378 ? btb_bank0_rd_data_way1_out_110 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6059 = _T_6058 | _T_5804; // @[Mux.scala 27:72]
  wire [21:0] _T_5805 = _T_4380 ? btb_bank0_rd_data_way1_out_111 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6060 = _T_6059 | _T_5805; // @[Mux.scala 27:72]
  wire [21:0] _T_5806 = _T_4382 ? btb_bank0_rd_data_way1_out_112 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6061 = _T_6060 | _T_5806; // @[Mux.scala 27:72]
  wire [21:0] _T_5807 = _T_4384 ? btb_bank0_rd_data_way1_out_113 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6062 = _T_6061 | _T_5807; // @[Mux.scala 27:72]
  wire [21:0] _T_5808 = _T_4386 ? btb_bank0_rd_data_way1_out_114 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6063 = _T_6062 | _T_5808; // @[Mux.scala 27:72]
  wire [21:0] _T_5809 = _T_4388 ? btb_bank0_rd_data_way1_out_115 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6064 = _T_6063 | _T_5809; // @[Mux.scala 27:72]
  wire [21:0] _T_5810 = _T_4390 ? btb_bank0_rd_data_way1_out_116 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6065 = _T_6064 | _T_5810; // @[Mux.scala 27:72]
  wire [21:0] _T_5811 = _T_4392 ? btb_bank0_rd_data_way1_out_117 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6066 = _T_6065 | _T_5811; // @[Mux.scala 27:72]
  wire [21:0] _T_5812 = _T_4394 ? btb_bank0_rd_data_way1_out_118 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6067 = _T_6066 | _T_5812; // @[Mux.scala 27:72]
  wire [21:0] _T_5813 = _T_4396 ? btb_bank0_rd_data_way1_out_119 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6068 = _T_6067 | _T_5813; // @[Mux.scala 27:72]
  wire [21:0] _T_5814 = _T_4398 ? btb_bank0_rd_data_way1_out_120 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6069 = _T_6068 | _T_5814; // @[Mux.scala 27:72]
  wire [21:0] _T_5815 = _T_4400 ? btb_bank0_rd_data_way1_out_121 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6070 = _T_6069 | _T_5815; // @[Mux.scala 27:72]
  wire [21:0] _T_5816 = _T_4402 ? btb_bank0_rd_data_way1_out_122 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6071 = _T_6070 | _T_5816; // @[Mux.scala 27:72]
  wire [21:0] _T_5817 = _T_4404 ? btb_bank0_rd_data_way1_out_123 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6072 = _T_6071 | _T_5817; // @[Mux.scala 27:72]
  wire [21:0] _T_5818 = _T_4406 ? btb_bank0_rd_data_way1_out_124 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6073 = _T_6072 | _T_5818; // @[Mux.scala 27:72]
  wire [21:0] _T_5819 = _T_4408 ? btb_bank0_rd_data_way1_out_125 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6074 = _T_6073 | _T_5819; // @[Mux.scala 27:72]
  wire [21:0] _T_5820 = _T_4410 ? btb_bank0_rd_data_way1_out_126 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6075 = _T_6074 | _T_5820; // @[Mux.scala 27:72]
  wire [21:0] _T_5821 = _T_4412 ? btb_bank0_rd_data_way1_out_127 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6076 = _T_6075 | _T_5821; // @[Mux.scala 27:72]
  wire [21:0] _T_5822 = _T_4414 ? btb_bank0_rd_data_way1_out_128 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6077 = _T_6076 | _T_5822; // @[Mux.scala 27:72]
  wire [21:0] _T_5823 = _T_4416 ? btb_bank0_rd_data_way1_out_129 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6078 = _T_6077 | _T_5823; // @[Mux.scala 27:72]
  wire [21:0] _T_5824 = _T_4418 ? btb_bank0_rd_data_way1_out_130 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6079 = _T_6078 | _T_5824; // @[Mux.scala 27:72]
  wire [21:0] _T_5825 = _T_4420 ? btb_bank0_rd_data_way1_out_131 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6080 = _T_6079 | _T_5825; // @[Mux.scala 27:72]
  wire [21:0] _T_5826 = _T_4422 ? btb_bank0_rd_data_way1_out_132 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6081 = _T_6080 | _T_5826; // @[Mux.scala 27:72]
  wire [21:0] _T_5827 = _T_4424 ? btb_bank0_rd_data_way1_out_133 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6082 = _T_6081 | _T_5827; // @[Mux.scala 27:72]
  wire [21:0] _T_5828 = _T_4426 ? btb_bank0_rd_data_way1_out_134 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6083 = _T_6082 | _T_5828; // @[Mux.scala 27:72]
  wire [21:0] _T_5829 = _T_4428 ? btb_bank0_rd_data_way1_out_135 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6084 = _T_6083 | _T_5829; // @[Mux.scala 27:72]
  wire [21:0] _T_5830 = _T_4430 ? btb_bank0_rd_data_way1_out_136 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6085 = _T_6084 | _T_5830; // @[Mux.scala 27:72]
  wire [21:0] _T_5831 = _T_4432 ? btb_bank0_rd_data_way1_out_137 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6086 = _T_6085 | _T_5831; // @[Mux.scala 27:72]
  wire [21:0] _T_5832 = _T_4434 ? btb_bank0_rd_data_way1_out_138 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6087 = _T_6086 | _T_5832; // @[Mux.scala 27:72]
  wire [21:0] _T_5833 = _T_4436 ? btb_bank0_rd_data_way1_out_139 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6088 = _T_6087 | _T_5833; // @[Mux.scala 27:72]
  wire [21:0] _T_5834 = _T_4438 ? btb_bank0_rd_data_way1_out_140 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6089 = _T_6088 | _T_5834; // @[Mux.scala 27:72]
  wire [21:0] _T_5835 = _T_4440 ? btb_bank0_rd_data_way1_out_141 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6090 = _T_6089 | _T_5835; // @[Mux.scala 27:72]
  wire [21:0] _T_5836 = _T_4442 ? btb_bank0_rd_data_way1_out_142 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6091 = _T_6090 | _T_5836; // @[Mux.scala 27:72]
  wire [21:0] _T_5837 = _T_4444 ? btb_bank0_rd_data_way1_out_143 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6092 = _T_6091 | _T_5837; // @[Mux.scala 27:72]
  wire [21:0] _T_5838 = _T_4446 ? btb_bank0_rd_data_way1_out_144 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6093 = _T_6092 | _T_5838; // @[Mux.scala 27:72]
  wire [21:0] _T_5839 = _T_4448 ? btb_bank0_rd_data_way1_out_145 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6094 = _T_6093 | _T_5839; // @[Mux.scala 27:72]
  wire [21:0] _T_5840 = _T_4450 ? btb_bank0_rd_data_way1_out_146 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6095 = _T_6094 | _T_5840; // @[Mux.scala 27:72]
  wire [21:0] _T_5841 = _T_4452 ? btb_bank0_rd_data_way1_out_147 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6096 = _T_6095 | _T_5841; // @[Mux.scala 27:72]
  wire [21:0] _T_5842 = _T_4454 ? btb_bank0_rd_data_way1_out_148 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6097 = _T_6096 | _T_5842; // @[Mux.scala 27:72]
  wire [21:0] _T_5843 = _T_4456 ? btb_bank0_rd_data_way1_out_149 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6098 = _T_6097 | _T_5843; // @[Mux.scala 27:72]
  wire [21:0] _T_5844 = _T_4458 ? btb_bank0_rd_data_way1_out_150 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6099 = _T_6098 | _T_5844; // @[Mux.scala 27:72]
  wire [21:0] _T_5845 = _T_4460 ? btb_bank0_rd_data_way1_out_151 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6100 = _T_6099 | _T_5845; // @[Mux.scala 27:72]
  wire [21:0] _T_5846 = _T_4462 ? btb_bank0_rd_data_way1_out_152 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6101 = _T_6100 | _T_5846; // @[Mux.scala 27:72]
  wire [21:0] _T_5847 = _T_4464 ? btb_bank0_rd_data_way1_out_153 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6102 = _T_6101 | _T_5847; // @[Mux.scala 27:72]
  wire [21:0] _T_5848 = _T_4466 ? btb_bank0_rd_data_way1_out_154 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6103 = _T_6102 | _T_5848; // @[Mux.scala 27:72]
  wire [21:0] _T_5849 = _T_4468 ? btb_bank0_rd_data_way1_out_155 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6104 = _T_6103 | _T_5849; // @[Mux.scala 27:72]
  wire [21:0] _T_5850 = _T_4470 ? btb_bank0_rd_data_way1_out_156 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6105 = _T_6104 | _T_5850; // @[Mux.scala 27:72]
  wire [21:0] _T_5851 = _T_4472 ? btb_bank0_rd_data_way1_out_157 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6106 = _T_6105 | _T_5851; // @[Mux.scala 27:72]
  wire [21:0] _T_5852 = _T_4474 ? btb_bank0_rd_data_way1_out_158 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6107 = _T_6106 | _T_5852; // @[Mux.scala 27:72]
  wire [21:0] _T_5853 = _T_4476 ? btb_bank0_rd_data_way1_out_159 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6108 = _T_6107 | _T_5853; // @[Mux.scala 27:72]
  wire [21:0] _T_5854 = _T_4478 ? btb_bank0_rd_data_way1_out_160 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6109 = _T_6108 | _T_5854; // @[Mux.scala 27:72]
  wire [21:0] _T_5855 = _T_4480 ? btb_bank0_rd_data_way1_out_161 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6110 = _T_6109 | _T_5855; // @[Mux.scala 27:72]
  wire [21:0] _T_5856 = _T_4482 ? btb_bank0_rd_data_way1_out_162 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6111 = _T_6110 | _T_5856; // @[Mux.scala 27:72]
  wire [21:0] _T_5857 = _T_4484 ? btb_bank0_rd_data_way1_out_163 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6112 = _T_6111 | _T_5857; // @[Mux.scala 27:72]
  wire [21:0] _T_5858 = _T_4486 ? btb_bank0_rd_data_way1_out_164 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6113 = _T_6112 | _T_5858; // @[Mux.scala 27:72]
  wire [21:0] _T_5859 = _T_4488 ? btb_bank0_rd_data_way1_out_165 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6114 = _T_6113 | _T_5859; // @[Mux.scala 27:72]
  wire [21:0] _T_5860 = _T_4490 ? btb_bank0_rd_data_way1_out_166 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6115 = _T_6114 | _T_5860; // @[Mux.scala 27:72]
  wire [21:0] _T_5861 = _T_4492 ? btb_bank0_rd_data_way1_out_167 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6116 = _T_6115 | _T_5861; // @[Mux.scala 27:72]
  wire [21:0] _T_5862 = _T_4494 ? btb_bank0_rd_data_way1_out_168 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6117 = _T_6116 | _T_5862; // @[Mux.scala 27:72]
  wire [21:0] _T_5863 = _T_4496 ? btb_bank0_rd_data_way1_out_169 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6118 = _T_6117 | _T_5863; // @[Mux.scala 27:72]
  wire [21:0] _T_5864 = _T_4498 ? btb_bank0_rd_data_way1_out_170 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6119 = _T_6118 | _T_5864; // @[Mux.scala 27:72]
  wire [21:0] _T_5865 = _T_4500 ? btb_bank0_rd_data_way1_out_171 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6120 = _T_6119 | _T_5865; // @[Mux.scala 27:72]
  wire [21:0] _T_5866 = _T_4502 ? btb_bank0_rd_data_way1_out_172 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6121 = _T_6120 | _T_5866; // @[Mux.scala 27:72]
  wire [21:0] _T_5867 = _T_4504 ? btb_bank0_rd_data_way1_out_173 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6122 = _T_6121 | _T_5867; // @[Mux.scala 27:72]
  wire [21:0] _T_5868 = _T_4506 ? btb_bank0_rd_data_way1_out_174 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6123 = _T_6122 | _T_5868; // @[Mux.scala 27:72]
  wire [21:0] _T_5869 = _T_4508 ? btb_bank0_rd_data_way1_out_175 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6124 = _T_6123 | _T_5869; // @[Mux.scala 27:72]
  wire [21:0] _T_5870 = _T_4510 ? btb_bank0_rd_data_way1_out_176 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6125 = _T_6124 | _T_5870; // @[Mux.scala 27:72]
  wire [21:0] _T_5871 = _T_4512 ? btb_bank0_rd_data_way1_out_177 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6126 = _T_6125 | _T_5871; // @[Mux.scala 27:72]
  wire [21:0] _T_5872 = _T_4514 ? btb_bank0_rd_data_way1_out_178 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6127 = _T_6126 | _T_5872; // @[Mux.scala 27:72]
  wire [21:0] _T_5873 = _T_4516 ? btb_bank0_rd_data_way1_out_179 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6128 = _T_6127 | _T_5873; // @[Mux.scala 27:72]
  wire [21:0] _T_5874 = _T_4518 ? btb_bank0_rd_data_way1_out_180 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6129 = _T_6128 | _T_5874; // @[Mux.scala 27:72]
  wire [21:0] _T_5875 = _T_4520 ? btb_bank0_rd_data_way1_out_181 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6130 = _T_6129 | _T_5875; // @[Mux.scala 27:72]
  wire [21:0] _T_5876 = _T_4522 ? btb_bank0_rd_data_way1_out_182 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6131 = _T_6130 | _T_5876; // @[Mux.scala 27:72]
  wire [21:0] _T_5877 = _T_4524 ? btb_bank0_rd_data_way1_out_183 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6132 = _T_6131 | _T_5877; // @[Mux.scala 27:72]
  wire [21:0] _T_5878 = _T_4526 ? btb_bank0_rd_data_way1_out_184 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6133 = _T_6132 | _T_5878; // @[Mux.scala 27:72]
  wire [21:0] _T_5879 = _T_4528 ? btb_bank0_rd_data_way1_out_185 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6134 = _T_6133 | _T_5879; // @[Mux.scala 27:72]
  wire [21:0] _T_5880 = _T_4530 ? btb_bank0_rd_data_way1_out_186 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6135 = _T_6134 | _T_5880; // @[Mux.scala 27:72]
  wire [21:0] _T_5881 = _T_4532 ? btb_bank0_rd_data_way1_out_187 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6136 = _T_6135 | _T_5881; // @[Mux.scala 27:72]
  wire [21:0] _T_5882 = _T_4534 ? btb_bank0_rd_data_way1_out_188 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6137 = _T_6136 | _T_5882; // @[Mux.scala 27:72]
  wire [21:0] _T_5883 = _T_4536 ? btb_bank0_rd_data_way1_out_189 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6138 = _T_6137 | _T_5883; // @[Mux.scala 27:72]
  wire [21:0] _T_5884 = _T_4538 ? btb_bank0_rd_data_way1_out_190 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6139 = _T_6138 | _T_5884; // @[Mux.scala 27:72]
  wire [21:0] _T_5885 = _T_4540 ? btb_bank0_rd_data_way1_out_191 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6140 = _T_6139 | _T_5885; // @[Mux.scala 27:72]
  wire [21:0] _T_5886 = _T_4542 ? btb_bank0_rd_data_way1_out_192 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6141 = _T_6140 | _T_5886; // @[Mux.scala 27:72]
  wire [21:0] _T_5887 = _T_4544 ? btb_bank0_rd_data_way1_out_193 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6142 = _T_6141 | _T_5887; // @[Mux.scala 27:72]
  wire [21:0] _T_5888 = _T_4546 ? btb_bank0_rd_data_way1_out_194 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6143 = _T_6142 | _T_5888; // @[Mux.scala 27:72]
  wire [21:0] _T_5889 = _T_4548 ? btb_bank0_rd_data_way1_out_195 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6144 = _T_6143 | _T_5889; // @[Mux.scala 27:72]
  wire [21:0] _T_5890 = _T_4550 ? btb_bank0_rd_data_way1_out_196 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6145 = _T_6144 | _T_5890; // @[Mux.scala 27:72]
  wire [21:0] _T_5891 = _T_4552 ? btb_bank0_rd_data_way1_out_197 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6146 = _T_6145 | _T_5891; // @[Mux.scala 27:72]
  wire [21:0] _T_5892 = _T_4554 ? btb_bank0_rd_data_way1_out_198 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6147 = _T_6146 | _T_5892; // @[Mux.scala 27:72]
  wire [21:0] _T_5893 = _T_4556 ? btb_bank0_rd_data_way1_out_199 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6148 = _T_6147 | _T_5893; // @[Mux.scala 27:72]
  wire [21:0] _T_5894 = _T_4558 ? btb_bank0_rd_data_way1_out_200 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6149 = _T_6148 | _T_5894; // @[Mux.scala 27:72]
  wire [21:0] _T_5895 = _T_4560 ? btb_bank0_rd_data_way1_out_201 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6150 = _T_6149 | _T_5895; // @[Mux.scala 27:72]
  wire [21:0] _T_5896 = _T_4562 ? btb_bank0_rd_data_way1_out_202 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6151 = _T_6150 | _T_5896; // @[Mux.scala 27:72]
  wire [21:0] _T_5897 = _T_4564 ? btb_bank0_rd_data_way1_out_203 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6152 = _T_6151 | _T_5897; // @[Mux.scala 27:72]
  wire [21:0] _T_5898 = _T_4566 ? btb_bank0_rd_data_way1_out_204 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6153 = _T_6152 | _T_5898; // @[Mux.scala 27:72]
  wire [21:0] _T_5899 = _T_4568 ? btb_bank0_rd_data_way1_out_205 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6154 = _T_6153 | _T_5899; // @[Mux.scala 27:72]
  wire [21:0] _T_5900 = _T_4570 ? btb_bank0_rd_data_way1_out_206 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6155 = _T_6154 | _T_5900; // @[Mux.scala 27:72]
  wire [21:0] _T_5901 = _T_4572 ? btb_bank0_rd_data_way1_out_207 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6156 = _T_6155 | _T_5901; // @[Mux.scala 27:72]
  wire [21:0] _T_5902 = _T_4574 ? btb_bank0_rd_data_way1_out_208 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6157 = _T_6156 | _T_5902; // @[Mux.scala 27:72]
  wire [21:0] _T_5903 = _T_4576 ? btb_bank0_rd_data_way1_out_209 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6158 = _T_6157 | _T_5903; // @[Mux.scala 27:72]
  wire [21:0] _T_5904 = _T_4578 ? btb_bank0_rd_data_way1_out_210 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6159 = _T_6158 | _T_5904; // @[Mux.scala 27:72]
  wire [21:0] _T_5905 = _T_4580 ? btb_bank0_rd_data_way1_out_211 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6160 = _T_6159 | _T_5905; // @[Mux.scala 27:72]
  wire [21:0] _T_5906 = _T_4582 ? btb_bank0_rd_data_way1_out_212 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6161 = _T_6160 | _T_5906; // @[Mux.scala 27:72]
  wire [21:0] _T_5907 = _T_4584 ? btb_bank0_rd_data_way1_out_213 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6162 = _T_6161 | _T_5907; // @[Mux.scala 27:72]
  wire [21:0] _T_5908 = _T_4586 ? btb_bank0_rd_data_way1_out_214 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6163 = _T_6162 | _T_5908; // @[Mux.scala 27:72]
  wire [21:0] _T_5909 = _T_4588 ? btb_bank0_rd_data_way1_out_215 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6164 = _T_6163 | _T_5909; // @[Mux.scala 27:72]
  wire [21:0] _T_5910 = _T_4590 ? btb_bank0_rd_data_way1_out_216 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6165 = _T_6164 | _T_5910; // @[Mux.scala 27:72]
  wire [21:0] _T_5911 = _T_4592 ? btb_bank0_rd_data_way1_out_217 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6166 = _T_6165 | _T_5911; // @[Mux.scala 27:72]
  wire [21:0] _T_5912 = _T_4594 ? btb_bank0_rd_data_way1_out_218 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6167 = _T_6166 | _T_5912; // @[Mux.scala 27:72]
  wire [21:0] _T_5913 = _T_4596 ? btb_bank0_rd_data_way1_out_219 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6168 = _T_6167 | _T_5913; // @[Mux.scala 27:72]
  wire [21:0] _T_5914 = _T_4598 ? btb_bank0_rd_data_way1_out_220 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6169 = _T_6168 | _T_5914; // @[Mux.scala 27:72]
  wire [21:0] _T_5915 = _T_4600 ? btb_bank0_rd_data_way1_out_221 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6170 = _T_6169 | _T_5915; // @[Mux.scala 27:72]
  wire [21:0] _T_5916 = _T_4602 ? btb_bank0_rd_data_way1_out_222 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6171 = _T_6170 | _T_5916; // @[Mux.scala 27:72]
  wire [21:0] _T_5917 = _T_4604 ? btb_bank0_rd_data_way1_out_223 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6172 = _T_6171 | _T_5917; // @[Mux.scala 27:72]
  wire [21:0] _T_5918 = _T_4606 ? btb_bank0_rd_data_way1_out_224 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6173 = _T_6172 | _T_5918; // @[Mux.scala 27:72]
  wire [21:0] _T_5919 = _T_4608 ? btb_bank0_rd_data_way1_out_225 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6174 = _T_6173 | _T_5919; // @[Mux.scala 27:72]
  wire [21:0] _T_5920 = _T_4610 ? btb_bank0_rd_data_way1_out_226 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6175 = _T_6174 | _T_5920; // @[Mux.scala 27:72]
  wire [21:0] _T_5921 = _T_4612 ? btb_bank0_rd_data_way1_out_227 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6176 = _T_6175 | _T_5921; // @[Mux.scala 27:72]
  wire [21:0] _T_5922 = _T_4614 ? btb_bank0_rd_data_way1_out_228 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6177 = _T_6176 | _T_5922; // @[Mux.scala 27:72]
  wire [21:0] _T_5923 = _T_4616 ? btb_bank0_rd_data_way1_out_229 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6178 = _T_6177 | _T_5923; // @[Mux.scala 27:72]
  wire [21:0] _T_5924 = _T_4618 ? btb_bank0_rd_data_way1_out_230 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6179 = _T_6178 | _T_5924; // @[Mux.scala 27:72]
  wire [21:0] _T_5925 = _T_4620 ? btb_bank0_rd_data_way1_out_231 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6180 = _T_6179 | _T_5925; // @[Mux.scala 27:72]
  wire [21:0] _T_5926 = _T_4622 ? btb_bank0_rd_data_way1_out_232 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6181 = _T_6180 | _T_5926; // @[Mux.scala 27:72]
  wire [21:0] _T_5927 = _T_4624 ? btb_bank0_rd_data_way1_out_233 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6182 = _T_6181 | _T_5927; // @[Mux.scala 27:72]
  wire [21:0] _T_5928 = _T_4626 ? btb_bank0_rd_data_way1_out_234 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6183 = _T_6182 | _T_5928; // @[Mux.scala 27:72]
  wire [21:0] _T_5929 = _T_4628 ? btb_bank0_rd_data_way1_out_235 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6184 = _T_6183 | _T_5929; // @[Mux.scala 27:72]
  wire [21:0] _T_5930 = _T_4630 ? btb_bank0_rd_data_way1_out_236 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6185 = _T_6184 | _T_5930; // @[Mux.scala 27:72]
  wire [21:0] _T_5931 = _T_4632 ? btb_bank0_rd_data_way1_out_237 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6186 = _T_6185 | _T_5931; // @[Mux.scala 27:72]
  wire [21:0] _T_5932 = _T_4634 ? btb_bank0_rd_data_way1_out_238 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6187 = _T_6186 | _T_5932; // @[Mux.scala 27:72]
  wire [21:0] _T_5933 = _T_4636 ? btb_bank0_rd_data_way1_out_239 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6188 = _T_6187 | _T_5933; // @[Mux.scala 27:72]
  wire [21:0] _T_5934 = _T_4638 ? btb_bank0_rd_data_way1_out_240 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6189 = _T_6188 | _T_5934; // @[Mux.scala 27:72]
  wire [21:0] _T_5935 = _T_4640 ? btb_bank0_rd_data_way1_out_241 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6190 = _T_6189 | _T_5935; // @[Mux.scala 27:72]
  wire [21:0] _T_5936 = _T_4642 ? btb_bank0_rd_data_way1_out_242 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6191 = _T_6190 | _T_5936; // @[Mux.scala 27:72]
  wire [21:0] _T_5937 = _T_4644 ? btb_bank0_rd_data_way1_out_243 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6192 = _T_6191 | _T_5937; // @[Mux.scala 27:72]
  wire [21:0] _T_5938 = _T_4646 ? btb_bank0_rd_data_way1_out_244 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6193 = _T_6192 | _T_5938; // @[Mux.scala 27:72]
  wire [21:0] _T_5939 = _T_4648 ? btb_bank0_rd_data_way1_out_245 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6194 = _T_6193 | _T_5939; // @[Mux.scala 27:72]
  wire [21:0] _T_5940 = _T_4650 ? btb_bank0_rd_data_way1_out_246 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6195 = _T_6194 | _T_5940; // @[Mux.scala 27:72]
  wire [21:0] _T_5941 = _T_4652 ? btb_bank0_rd_data_way1_out_247 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6196 = _T_6195 | _T_5941; // @[Mux.scala 27:72]
  wire [21:0] _T_5942 = _T_4654 ? btb_bank0_rd_data_way1_out_248 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6197 = _T_6196 | _T_5942; // @[Mux.scala 27:72]
  wire [21:0] _T_5943 = _T_4656 ? btb_bank0_rd_data_way1_out_249 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6198 = _T_6197 | _T_5943; // @[Mux.scala 27:72]
  wire [21:0] _T_5944 = _T_4658 ? btb_bank0_rd_data_way1_out_250 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6199 = _T_6198 | _T_5944; // @[Mux.scala 27:72]
  wire [21:0] _T_5945 = _T_4660 ? btb_bank0_rd_data_way1_out_251 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6200 = _T_6199 | _T_5945; // @[Mux.scala 27:72]
  wire [21:0] _T_5946 = _T_4662 ? btb_bank0_rd_data_way1_out_252 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6201 = _T_6200 | _T_5946; // @[Mux.scala 27:72]
  wire [21:0] _T_5947 = _T_4664 ? btb_bank0_rd_data_way1_out_253 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6202 = _T_6201 | _T_5947; // @[Mux.scala 27:72]
  wire [21:0] _T_5948 = _T_4666 ? btb_bank0_rd_data_way1_out_254 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_6203 = _T_6202 | _T_5948; // @[Mux.scala 27:72]
  wire [21:0] _T_5949 = _T_4668 ? btb_bank0_rd_data_way1_out_255 : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0_rd_data_way1_p1_f = _T_6203 | _T_5949; // @[Mux.scala 27:72]
  wire  _T_72 = btb_bank0_rd_data_way1_p1_f[21:17] == fetch_rd_tag_p1_f; // @[el2_ifu_bp_ctl.scala 145:106]
  wire  _T_73 = btb_bank0_rd_data_way1_p1_f[0] & _T_72; // @[el2_ifu_bp_ctl.scala 145:61]
  wire  _T_76 = _T_73 & _T_48; // @[el2_ifu_bp_ctl.scala 145:129]
  wire  _T_77 = _T_76 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 146:56]
  wire  tag_match_way1_p1_f = _T_77 & _T; // @[el2_ifu_bp_ctl.scala 146:77]
  wire  _T_108 = btb_bank0_rd_data_way1_p1_f[3] ^ btb_bank0_rd_data_way1_p1_f[4]; // @[el2_ifu_bp_ctl.scala 159:100]
  wire  _T_109 = tag_match_way1_p1_f & _T_108; // @[el2_ifu_bp_ctl.scala 159:62]
  wire  _T_113 = ~_T_108; // @[el2_ifu_bp_ctl.scala 160:64]
  wire  _T_114 = tag_match_way1_p1_f & _T_113; // @[el2_ifu_bp_ctl.scala 160:62]
  wire [1:0] tag_match_way1_expanded_p1_f = {_T_109,_T_114}; // @[Cat.scala 29:58]
  wire [21:0] _T_134 = tag_match_way1_expanded_p1_f[1] ? btb_bank0_rd_data_way1_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0e_rd_data_p1_f = _T_133 | _T_134; // @[Mux.scala 27:72]
  wire [21:0] _T_146 = io_ifc_fetch_addr_f[0] ? btb_bank0e_rd_data_p1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_vbank1_rd_data_f = _T_145 | _T_146; // @[Mux.scala 27:72]
  wire  _T_243 = btb_vbank1_rd_data_f[2] | btb_vbank1_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 240:59]
  wire [21:0] _T_119 = tag_match_way0_expanded_f[0] ? btb_bank0_rd_data_way0_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_120 = tag_match_way1_expanded_f[0] ? btb_bank0_rd_data_way1_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_bank0e_rd_data_f = _T_119 | _T_120; // @[Mux.scala 27:72]
  wire [21:0] _T_139 = _T_143 ? btb_bank0e_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] _T_140 = io_ifc_fetch_addr_f[0] ? btb_bank0o_rd_data_f : 22'h0; // @[Mux.scala 27:72]
  wire [21:0] btb_vbank0_rd_data_f = _T_139 | _T_140; // @[Mux.scala 27:72]
  wire  _T_246 = btb_vbank0_rd_data_f[2] | btb_vbank0_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 241:59]
  wire [1:0] bht_force_taken_f = {_T_243,_T_246}; // @[Cat.scala 29:58]
  wire [9:0] _T_568 = {btb_rd_addr_f,2'h0}; // @[Cat.scala 29:58]
  reg [7:0] fghr; // @[el2_ifu_bp_ctl.scala 288:44]
  wire [7:0] bht_rd_addr_hashed_f = _T_568[9:2] ^ fghr; // @[el2_lib.scala 190:35]
  wire  _T_20367 = bht_rd_addr_hashed_f == 8'h0; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_0; // @[Reg.scala 27:20]
  wire [1:0] _T_20414 = _T_20367 ? bht_bank_rd_data_out_1_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_20370 = bht_rd_addr_hashed_f == 8'h1; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_1; // @[Reg.scala 27:20]
  wire [1:0] _T_20415 = _T_20370 ? bht_bank_rd_data_out_1_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20430 = _T_20414 | _T_20415; // @[Mux.scala 27:72]
  wire  _T_20373 = bht_rd_addr_hashed_f == 8'h2; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_2; // @[Reg.scala 27:20]
  wire [1:0] _T_20416 = _T_20373 ? bht_bank_rd_data_out_1_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20431 = _T_20430 | _T_20416; // @[Mux.scala 27:72]
  wire  _T_20376 = bht_rd_addr_hashed_f == 8'h3; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_3; // @[Reg.scala 27:20]
  wire [1:0] _T_20417 = _T_20376 ? bht_bank_rd_data_out_1_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20432 = _T_20431 | _T_20417; // @[Mux.scala 27:72]
  wire  _T_20379 = bht_rd_addr_hashed_f == 8'h4; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_4; // @[Reg.scala 27:20]
  wire [1:0] _T_20418 = _T_20379 ? bht_bank_rd_data_out_1_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20433 = _T_20432 | _T_20418; // @[Mux.scala 27:72]
  wire  _T_20382 = bht_rd_addr_hashed_f == 8'h5; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_5; // @[Reg.scala 27:20]
  wire [1:0] _T_20419 = _T_20382 ? bht_bank_rd_data_out_1_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20434 = _T_20433 | _T_20419; // @[Mux.scala 27:72]
  wire  _T_20385 = bht_rd_addr_hashed_f == 8'h6; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_6; // @[Reg.scala 27:20]
  wire [1:0] _T_20420 = _T_20385 ? bht_bank_rd_data_out_1_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20435 = _T_20434 | _T_20420; // @[Mux.scala 27:72]
  wire  _T_20388 = bht_rd_addr_hashed_f == 8'h7; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_7; // @[Reg.scala 27:20]
  wire [1:0] _T_20421 = _T_20388 ? bht_bank_rd_data_out_1_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20436 = _T_20435 | _T_20421; // @[Mux.scala 27:72]
  wire  _T_20391 = bht_rd_addr_hashed_f == 8'h8; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_8; // @[Reg.scala 27:20]
  wire [1:0] _T_20422 = _T_20391 ? bht_bank_rd_data_out_1_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20437 = _T_20436 | _T_20422; // @[Mux.scala 27:72]
  wire  _T_20394 = bht_rd_addr_hashed_f == 8'h9; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_9; // @[Reg.scala 27:20]
  wire [1:0] _T_20423 = _T_20394 ? bht_bank_rd_data_out_1_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20438 = _T_20437 | _T_20423; // @[Mux.scala 27:72]
  wire  _T_20397 = bht_rd_addr_hashed_f == 8'ha; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_10; // @[Reg.scala 27:20]
  wire [1:0] _T_20424 = _T_20397 ? bht_bank_rd_data_out_1_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20439 = _T_20438 | _T_20424; // @[Mux.scala 27:72]
  wire  _T_20400 = bht_rd_addr_hashed_f == 8'hb; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_11; // @[Reg.scala 27:20]
  wire [1:0] _T_20425 = _T_20400 ? bht_bank_rd_data_out_1_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20440 = _T_20439 | _T_20425; // @[Mux.scala 27:72]
  wire  _T_20403 = bht_rd_addr_hashed_f == 8'hc; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_12; // @[Reg.scala 27:20]
  wire [1:0] _T_20426 = _T_20403 ? bht_bank_rd_data_out_1_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20441 = _T_20440 | _T_20426; // @[Mux.scala 27:72]
  wire  _T_20406 = bht_rd_addr_hashed_f == 8'hd; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_13; // @[Reg.scala 27:20]
  wire [1:0] _T_20427 = _T_20406 ? bht_bank_rd_data_out_1_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20442 = _T_20441 | _T_20427; // @[Mux.scala 27:72]
  wire  _T_20409 = bht_rd_addr_hashed_f == 8'he; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_14; // @[Reg.scala 27:20]
  wire [1:0] _T_20428 = _T_20409 ? bht_bank_rd_data_out_1_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20443 = _T_20442 | _T_20428; // @[Mux.scala 27:72]
  wire  _T_20412 = bht_rd_addr_hashed_f == 8'hf; // @[el2_ifu_bp_ctl.scala 396:103]
  reg [1:0] bht_bank_rd_data_out_1_15; // @[Reg.scala 27:20]
  wire [1:0] _T_20429 = _T_20412 ? bht_bank_rd_data_out_1_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank1_rd_data_f = _T_20443 | _T_20429; // @[Mux.scala 27:72]
  wire [1:0] _T_260 = _T_143 ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [9:0] _T_571 = {btb_rd_addr_p1_f,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] bht_rd_addr_hashed_p1_f = _T_571[9:2] ^ fghr; // @[el2_lib.scala 190:35]
  wire  _T_20447 = bht_rd_addr_hashed_p1_f == 8'h0; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20494 = _T_20447 ? bht_bank_rd_data_out_1_0 : 2'h0; // @[Mux.scala 27:72]
  wire  _T_20450 = bht_rd_addr_hashed_p1_f == 8'h1; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20495 = _T_20450 ? bht_bank_rd_data_out_1_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20510 = _T_20494 | _T_20495; // @[Mux.scala 27:72]
  wire  _T_20453 = bht_rd_addr_hashed_p1_f == 8'h2; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20496 = _T_20453 ? bht_bank_rd_data_out_1_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20511 = _T_20510 | _T_20496; // @[Mux.scala 27:72]
  wire  _T_20456 = bht_rd_addr_hashed_p1_f == 8'h3; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20497 = _T_20456 ? bht_bank_rd_data_out_1_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20512 = _T_20511 | _T_20497; // @[Mux.scala 27:72]
  wire  _T_20459 = bht_rd_addr_hashed_p1_f == 8'h4; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20498 = _T_20459 ? bht_bank_rd_data_out_1_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20513 = _T_20512 | _T_20498; // @[Mux.scala 27:72]
  wire  _T_20462 = bht_rd_addr_hashed_p1_f == 8'h5; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20499 = _T_20462 ? bht_bank_rd_data_out_1_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20514 = _T_20513 | _T_20499; // @[Mux.scala 27:72]
  wire  _T_20465 = bht_rd_addr_hashed_p1_f == 8'h6; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20500 = _T_20465 ? bht_bank_rd_data_out_1_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20515 = _T_20514 | _T_20500; // @[Mux.scala 27:72]
  wire  _T_20468 = bht_rd_addr_hashed_p1_f == 8'h7; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20501 = _T_20468 ? bht_bank_rd_data_out_1_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20516 = _T_20515 | _T_20501; // @[Mux.scala 27:72]
  wire  _T_20471 = bht_rd_addr_hashed_p1_f == 8'h8; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20502 = _T_20471 ? bht_bank_rd_data_out_1_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20517 = _T_20516 | _T_20502; // @[Mux.scala 27:72]
  wire  _T_20474 = bht_rd_addr_hashed_p1_f == 8'h9; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20503 = _T_20474 ? bht_bank_rd_data_out_1_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20518 = _T_20517 | _T_20503; // @[Mux.scala 27:72]
  wire  _T_20477 = bht_rd_addr_hashed_p1_f == 8'ha; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20504 = _T_20477 ? bht_bank_rd_data_out_1_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20519 = _T_20518 | _T_20504; // @[Mux.scala 27:72]
  wire  _T_20480 = bht_rd_addr_hashed_p1_f == 8'hb; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20505 = _T_20480 ? bht_bank_rd_data_out_1_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20520 = _T_20519 | _T_20505; // @[Mux.scala 27:72]
  wire  _T_20483 = bht_rd_addr_hashed_p1_f == 8'hc; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20506 = _T_20483 ? bht_bank_rd_data_out_1_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20521 = _T_20520 | _T_20506; // @[Mux.scala 27:72]
  wire  _T_20486 = bht_rd_addr_hashed_p1_f == 8'hd; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20507 = _T_20486 ? bht_bank_rd_data_out_1_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20522 = _T_20521 | _T_20507; // @[Mux.scala 27:72]
  wire  _T_20489 = bht_rd_addr_hashed_p1_f == 8'he; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20508 = _T_20489 ? bht_bank_rd_data_out_1_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20523 = _T_20522 | _T_20508; // @[Mux.scala 27:72]
  wire  _T_20492 = bht_rd_addr_hashed_p1_f == 8'hf; // @[el2_ifu_bp_ctl.scala 397:109]
  wire [1:0] _T_20509 = _T_20492 ? bht_bank_rd_data_out_1_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_p1_f = _T_20523 | _T_20509; // @[Mux.scala 27:72]
  wire [1:0] _T_261 = io_ifc_fetch_addr_f[0] ? bht_bank0_rd_data_p1_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank1_rd_data_f = _T_260 | _T_261; // @[Mux.scala 27:72]
  wire  _T_265 = bht_force_taken_f[1] | bht_vbank1_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 255:42]
  wire [1:0] wayhit_f = tag_match_way0_expanded_f | tag_match_way1_expanded_f; // @[el2_ifu_bp_ctl.scala 162:44]
  wire [1:0] _T_158 = _T_143 ? wayhit_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] wayhit_p1_f = tag_match_way0_expanded_p1_f | tag_match_way1_expanded_p1_f; // @[el2_ifu_bp_ctl.scala 164:50]
  wire [1:0] _T_157 = {wayhit_p1_f[0],wayhit_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_159 = io_ifc_fetch_addr_f[0] ? _T_157 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_160 = _T_158 | _T_159; // @[Mux.scala 27:72]
  wire  eoc_near = &io_ifc_fetch_addr_f[4:2]; // @[el2_ifu_bp_ctl.scala 224:64]
  wire  _T_219 = ~eoc_near; // @[el2_ifu_bp_ctl.scala 226:15]
  wire  _T_221 = |io_ifc_fetch_addr_f[1:0]; // @[el2_ifu_bp_ctl.scala 226:57]
  wire  _T_222 = ~_T_221; // @[el2_ifu_bp_ctl.scala 226:28]
  wire  eoc_mask = _T_219 | _T_222; // @[el2_ifu_bp_ctl.scala 226:25]
  wire [1:0] _T_162 = {eoc_mask,1'h1}; // @[Cat.scala 29:58]
  wire [1:0] vwayhit_f = _T_160 & _T_162; // @[el2_ifu_bp_ctl.scala 191:71]
  wire  _T_267 = _T_265 & vwayhit_f[1]; // @[el2_ifu_bp_ctl.scala 255:69]
  reg [1:0] bht_bank_rd_data_out_0_0; // @[Reg.scala 27:20]
  wire [1:0] _T_20334 = _T_20367 ? bht_bank_rd_data_out_0_0 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_1; // @[Reg.scala 27:20]
  wire [1:0] _T_20335 = _T_20370 ? bht_bank_rd_data_out_0_1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20350 = _T_20334 | _T_20335; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_2; // @[Reg.scala 27:20]
  wire [1:0] _T_20336 = _T_20373 ? bht_bank_rd_data_out_0_2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20351 = _T_20350 | _T_20336; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_3; // @[Reg.scala 27:20]
  wire [1:0] _T_20337 = _T_20376 ? bht_bank_rd_data_out_0_3 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20352 = _T_20351 | _T_20337; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_4; // @[Reg.scala 27:20]
  wire [1:0] _T_20338 = _T_20379 ? bht_bank_rd_data_out_0_4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20353 = _T_20352 | _T_20338; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_5; // @[Reg.scala 27:20]
  wire [1:0] _T_20339 = _T_20382 ? bht_bank_rd_data_out_0_5 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20354 = _T_20353 | _T_20339; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_6; // @[Reg.scala 27:20]
  wire [1:0] _T_20340 = _T_20385 ? bht_bank_rd_data_out_0_6 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20355 = _T_20354 | _T_20340; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_7; // @[Reg.scala 27:20]
  wire [1:0] _T_20341 = _T_20388 ? bht_bank_rd_data_out_0_7 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20356 = _T_20355 | _T_20341; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_8; // @[Reg.scala 27:20]
  wire [1:0] _T_20342 = _T_20391 ? bht_bank_rd_data_out_0_8 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20357 = _T_20356 | _T_20342; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_9; // @[Reg.scala 27:20]
  wire [1:0] _T_20343 = _T_20394 ? bht_bank_rd_data_out_0_9 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20358 = _T_20357 | _T_20343; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_10; // @[Reg.scala 27:20]
  wire [1:0] _T_20344 = _T_20397 ? bht_bank_rd_data_out_0_10 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20359 = _T_20358 | _T_20344; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_11; // @[Reg.scala 27:20]
  wire [1:0] _T_20345 = _T_20400 ? bht_bank_rd_data_out_0_11 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20360 = _T_20359 | _T_20345; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_12; // @[Reg.scala 27:20]
  wire [1:0] _T_20346 = _T_20403 ? bht_bank_rd_data_out_0_12 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20361 = _T_20360 | _T_20346; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_13; // @[Reg.scala 27:20]
  wire [1:0] _T_20347 = _T_20406 ? bht_bank_rd_data_out_0_13 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20362 = _T_20361 | _T_20347; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_14; // @[Reg.scala 27:20]
  wire [1:0] _T_20348 = _T_20409 ? bht_bank_rd_data_out_0_14 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_20363 = _T_20362 | _T_20348; // @[Mux.scala 27:72]
  reg [1:0] bht_bank_rd_data_out_0_15; // @[Reg.scala 27:20]
  wire [1:0] _T_20349 = _T_20412 ? bht_bank_rd_data_out_0_15 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_bank0_rd_data_f = _T_20363 | _T_20349; // @[Mux.scala 27:72]
  wire [1:0] _T_252 = _T_143 ? bht_bank0_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_253 = io_ifc_fetch_addr_f[0] ? bht_bank1_rd_data_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] bht_vbank0_rd_data_f = _T_252 | _T_253; // @[Mux.scala 27:72]
  wire  _T_270 = bht_force_taken_f[0] | bht_vbank0_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 256:45]
  wire  _T_272 = _T_270 & vwayhit_f[0]; // @[el2_ifu_bp_ctl.scala 256:72]
  wire [1:0] bht_dir_f = {_T_267,_T_272}; // @[Cat.scala 29:58]
  wire  _T_14 = ~bht_dir_f[0]; // @[el2_ifu_bp_ctl.scala 108:23]
  wire [1:0] btb_sel_f = {_T_14,bht_dir_f[0]}; // @[Cat.scala 29:58]
  wire [1:0] fetch_start_f = {io_ifc_fetch_addr_f[0],_T_143}; // @[Cat.scala 29:58]
  wire  _T_32 = io_exu_mp_btag == fetch_rd_tag_f; // @[el2_ifu_bp_ctl.scala 124:46]
  wire  _T_33 = _T_32 & exu_mp_valid; // @[el2_ifu_bp_ctl.scala 124:66]
  wire  _T_34 = _T_33 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 124:81]
  wire  _T_35 = io_exu_mp_index == btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 124:117]
  wire  fetch_mp_collision_f = _T_34 & _T_35; // @[el2_ifu_bp_ctl.scala 124:102]
  wire  _T_36 = io_exu_mp_btag == fetch_rd_tag_p1_f; // @[el2_ifu_bp_ctl.scala 125:49]
  wire  _T_37 = _T_36 & exu_mp_valid; // @[el2_ifu_bp_ctl.scala 125:72]
  wire  _T_38 = _T_37 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 125:87]
  wire  _T_39 = io_exu_mp_index == btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 125:123]
  wire  fetch_mp_collision_p1_f = _T_38 & _T_39; // @[el2_ifu_bp_ctl.scala 125:108]
  reg  exu_mp_way_f; // @[el2_ifu_bp_ctl.scala 129:29]
  reg  exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 130:35]
  wire [255:0] mp_wrindex_dec = 256'h1 << io_exu_mp_index; // @[el2_ifu_bp_ctl.scala 183:28]
  wire [255:0] fetch_wrindex_dec = 256'h1 << btb_rd_addr_f; // @[el2_ifu_bp_ctl.scala 185:31]
  wire [255:0] fetch_wrindex_p1_dec = 256'h1 << btb_rd_addr_p1_f; // @[el2_ifu_bp_ctl.scala 187:34]
  wire [255:0] _T_149 = exu_mp_valid ? 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff : 256'h0; // @[Bitwise.scala 72:12]
  wire [255:0] mp_wrlru_b0 = mp_wrindex_dec & _T_149; // @[el2_ifu_bp_ctl.scala 189:36]
  wire  _T_165 = vwayhit_f[0] | vwayhit_f[1]; // @[el2_ifu_bp_ctl.scala 193:42]
  wire  _T_166 = _T_165 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 193:58]
  wire  lru_update_valid_f = _T_166 & _T; // @[el2_ifu_bp_ctl.scala 193:79]
  wire [255:0] _T_169 = lru_update_valid_f ? 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff : 256'h0; // @[Bitwise.scala 72:12]
  wire [255:0] fetch_wrlru_b0 = fetch_wrindex_dec & _T_169; // @[el2_ifu_bp_ctl.scala 195:42]
  wire [255:0] fetch_wrlru_p1_b0 = fetch_wrindex_p1_dec & _T_169; // @[el2_ifu_bp_ctl.scala 196:48]
  wire [255:0] _T_172 = ~mp_wrlru_b0; // @[el2_ifu_bp_ctl.scala 198:25]
  wire [255:0] _T_173 = ~fetch_wrlru_b0; // @[el2_ifu_bp_ctl.scala 198:40]
  wire [255:0] btb_lru_b0_hold = _T_172 & _T_173; // @[el2_ifu_bp_ctl.scala 198:38]
  wire  _T_176 = ~io_exu_mp_pkt_way; // @[el2_ifu_bp_ctl.scala 203:62]
  wire [255:0] _T_179 = _T_176 ? mp_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_180 = tag_match_way0_f ? fetch_wrlru_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_181 = tag_match_way0_p1_f ? fetch_wrlru_p1_b0 : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_182 = _T_179 | _T_180; // @[Mux.scala 27:72]
  wire [255:0] _T_183 = _T_182 | _T_181; // @[Mux.scala 27:72]
  reg [255:0] btb_lru_b0_f; // @[Reg.scala 27:20]
  wire [255:0] _T_185 = btb_lru_b0_hold & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 205:100]
  wire [255:0] _T_186 = _T_183 | _T_185; // @[el2_ifu_bp_ctl.scala 205:82]
  wire [255:0] _T_188 = fetch_wrindex_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 207:78]
  wire  _T_189 = |_T_188; // @[el2_ifu_bp_ctl.scala 207:94]
  wire  btb_lru_rd_f = fetch_mp_collision_f ? exu_mp_way_f : _T_189; // @[el2_ifu_bp_ctl.scala 207:25]
  wire [255:0] _T_191 = fetch_wrindex_p1_dec & btb_lru_b0_f; // @[el2_ifu_bp_ctl.scala 209:87]
  wire  _T_192 = |_T_191; // @[el2_ifu_bp_ctl.scala 209:103]
  wire  btb_lru_rd_p1_f = fetch_mp_collision_p1_f ? exu_mp_way_f : _T_192; // @[el2_ifu_bp_ctl.scala 209:28]
  wire [1:0] _T_195 = {btb_lru_rd_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_198 = {btb_lru_rd_p1_f,btb_lru_rd_f}; // @[Cat.scala 29:58]
  wire [1:0] _T_199 = _T_143 ? _T_195 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_200 = io_ifc_fetch_addr_f[0] ? _T_198 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] btb_vlru_rd_f = _T_199 | _T_200; // @[Mux.scala 27:72]
  wire [1:0] _T_209 = {tag_match_way1_expanded_p1_f[0],tag_match_way1_expanded_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] _T_210 = _T_143 ? tag_match_way1_expanded_f : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_211 = io_ifc_fetch_addr_f[0] ? _T_209 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] tag_match_vway1_expanded_f = _T_210 | _T_211; // @[Mux.scala 27:72]
  wire [1:0] _T_213 = ~vwayhit_f; // @[el2_ifu_bp_ctl.scala 217:47]
  wire [1:0] _T_214 = _T_213 & btb_vlru_rd_f; // @[el2_ifu_bp_ctl.scala 217:58]
  wire  _T_215 = io_ifc_fetch_req_f | exu_mp_valid; // @[el2_ifu_bp_ctl.scala 222:75]
  wire [15:0] _T_230 = btb_sel_f[1] ? btb_vbank1_rd_data_f[16:1] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_231 = btb_sel_f[0] ? btb_vbank1_rd_data_f[16:1] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_232 = _T_230 | _T_231; // @[Mux.scala 27:72]
  wire [16:0] btb_sel_data_f = {{1'd0}, _T_232}; // @[el2_ifu_bp_ctl.scala 235:18]
  wire [11:0] btb_rd_tgt_f = btb_sel_data_f[15:4]; // @[el2_ifu_bp_ctl.scala 230:36]
  wire  btb_rd_pc4_f = btb_sel_data_f[3]; // @[el2_ifu_bp_ctl.scala 231:36]
  wire  btb_rd_call_f = btb_sel_data_f[1]; // @[el2_ifu_bp_ctl.scala 232:37]
  wire  btb_rd_ret_f = btb_sel_data_f[0]; // @[el2_ifu_bp_ctl.scala 233:36]
  wire [1:0] _T_280 = {bht_vbank1_rd_data_f[1],bht_vbank0_rd_data_f[1]}; // @[Cat.scala 29:58]
  wire [1:0] hist1_raw = bht_force_taken_f | _T_280; // @[el2_ifu_bp_ctl.scala 261:34]
  wire [1:0] _T_234 = vwayhit_f & hist1_raw; // @[el2_ifu_bp_ctl.scala 238:39]
  wire  _T_235 = |_T_234; // @[el2_ifu_bp_ctl.scala 238:52]
  wire  _T_236 = _T_235 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 238:56]
  wire  _T_237 = ~leak_one_f_d1; // @[el2_ifu_bp_ctl.scala 238:79]
  wire  _T_238 = _T_236 & _T_237; // @[el2_ifu_bp_ctl.scala 238:77]
  wire  _T_239 = ~io_dec_tlu_bpred_disable; // @[el2_ifu_bp_ctl.scala 238:96]
  wire  _T_275 = io_ifu_bp_hit_taken_f & btb_sel_f[1]; // @[el2_ifu_bp_ctl.scala 258:51]
  wire  _T_276 = ~io_ifu_bp_hit_taken_f; // @[el2_ifu_bp_ctl.scala 258:69]
  wire  _T_286 = vwayhit_f[1] & btb_vbank1_rd_data_f[4]; // @[el2_ifu_bp_ctl.scala 265:34]
  wire  _T_289 = vwayhit_f[0] & btb_vbank0_rd_data_f[4]; // @[el2_ifu_bp_ctl.scala 266:34]
  wire  _T_292 = ~btb_vbank1_rd_data_f[2]; // @[el2_ifu_bp_ctl.scala 268:37]
  wire  _T_293 = vwayhit_f[1] & _T_292; // @[el2_ifu_bp_ctl.scala 268:35]
  wire  _T_295 = _T_293 & btb_vbank1_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 268:65]
  wire  _T_298 = ~btb_vbank0_rd_data_f[2]; // @[el2_ifu_bp_ctl.scala 269:37]
  wire  _T_299 = vwayhit_f[0] & _T_298; // @[el2_ifu_bp_ctl.scala 269:35]
  wire  _T_301 = _T_299 & btb_vbank0_rd_data_f[1]; // @[el2_ifu_bp_ctl.scala 269:65]
  wire [1:0] num_valids = vwayhit_f[1] + vwayhit_f[0]; // @[el2_ifu_bp_ctl.scala 272:35]
  wire [1:0] _T_304 = btb_sel_f & bht_dir_f; // @[el2_ifu_bp_ctl.scala 274:28]
  wire  final_h = |_T_304; // @[el2_ifu_bp_ctl.scala 274:41]
  wire  _T_305 = num_valids == 2'h2; // @[el2_ifu_bp_ctl.scala 278:41]
  wire [7:0] _T_309 = {fghr[5:0],1'h0,final_h}; // @[Cat.scala 29:58]
  wire  _T_310 = num_valids == 2'h1; // @[el2_ifu_bp_ctl.scala 279:41]
  wire [7:0] _T_313 = {fghr[6:0],final_h}; // @[Cat.scala 29:58]
  wire  _T_314 = num_valids == 2'h0; // @[el2_ifu_bp_ctl.scala 280:41]
  wire [7:0] _T_317 = _T_305 ? _T_309 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_318 = _T_310 ? _T_313 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_319 = _T_314 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_320 = _T_317 | _T_318; // @[Mux.scala 27:72]
  wire [7:0] merged_ghr = _T_320 | _T_319; // @[Mux.scala 27:72]
  wire  _T_323 = ~exu_flush_final_d1; // @[el2_ifu_bp_ctl.scala 285:27]
  wire  _T_324 = _T_323 & io_ifc_fetch_req_f; // @[el2_ifu_bp_ctl.scala 285:47]
  wire  _T_325 = _T_324 & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 285:68]
  wire  _T_327 = _T_325 & _T_237; // @[el2_ifu_bp_ctl.scala 285:82]
  wire  _T_330 = io_ifc_fetch_req_f & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 286:70]
  wire  _T_332 = _T_330 & _T_237; // @[el2_ifu_bp_ctl.scala 286:84]
  wire  _T_333 = ~_T_332; // @[el2_ifu_bp_ctl.scala 286:49]
  wire  _T_334 = _T_323 & _T_333; // @[el2_ifu_bp_ctl.scala 286:47]
  wire [7:0] _T_336 = exu_flush_final_d1 ? io_exu_mp_fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_337 = _T_327 ? merged_ghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_338 = _T_334 ? fghr : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_339 = _T_336 | _T_337; // @[Mux.scala 27:72]
  wire [7:0] fghr_ns = _T_339 | _T_338; // @[Mux.scala 27:72]
  wire [1:0] _T_343 = io_dec_tlu_bpred_disable ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_344 = ~_T_343; // @[el2_ifu_bp_ctl.scala 297:36]
  wire  _T_348 = ~fetch_start_f[0]; // @[el2_ifu_bp_ctl.scala 300:36]
  wire  _T_349 = bht_dir_f[0] & _T_348; // @[el2_ifu_bp_ctl.scala 300:34]
  wire  _T_353 = _T_14 & fetch_start_f[0]; // @[el2_ifu_bp_ctl.scala 300:72]
  wire  _T_354 = _T_349 | _T_353; // @[el2_ifu_bp_ctl.scala 300:55]
  wire  _T_357 = bht_dir_f[0] & fetch_start_f[0]; // @[el2_ifu_bp_ctl.scala 301:19]
  wire  _T_362 = _T_14 & _T_348; // @[el2_ifu_bp_ctl.scala 301:56]
  wire  _T_363 = _T_357 | _T_362; // @[el2_ifu_bp_ctl.scala 301:39]
  wire [1:0] bloc_f = {_T_354,_T_363}; // @[Cat.scala 29:58]
  wire  _T_367 = _T_14 & io_ifc_fetch_addr_f[0]; // @[el2_ifu_bp_ctl.scala 303:35]
  wire  _T_368 = ~btb_rd_pc4_f; // @[el2_ifu_bp_ctl.scala 303:62]
  wire  use_fa_plus = _T_367 & _T_368; // @[el2_ifu_bp_ctl.scala 303:60]
  wire  _T_371 = fetch_start_f[0] & btb_sel_f[0]; // @[el2_ifu_bp_ctl.scala 305:44]
  wire  btb_fg_crossing_f = _T_371 & btb_rd_pc4_f; // @[el2_ifu_bp_ctl.scala 305:59]
  wire  bp_total_branch_offset_f = bloc_f[1] ^ btb_rd_pc4_f; // @[el2_ifu_bp_ctl.scala 306:43]
  wire  _T_374 = io_ifc_fetch_req_f & _T_276; // @[el2_ifu_bp_ctl.scala 308:87]
  wire  _T_375 = _T_374 & io_ic_hit_f; // @[el2_ifu_bp_ctl.scala 308:112]
  reg [30:0] ifc_fetch_adder_prior; // @[Reg.scala 27:20]
  wire  _T_379 = ~btb_fg_crossing_f; // @[el2_ifu_bp_ctl.scala 313:32]
  wire  _T_380 = ~use_fa_plus; // @[el2_ifu_bp_ctl.scala 313:53]
  wire  _T_381 = _T_379 & _T_380; // @[el2_ifu_bp_ctl.scala 313:51]
  wire [29:0] _T_384 = use_fa_plus ? fetch_addr_p1_f : 30'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_385 = btb_fg_crossing_f ? ifc_fetch_adder_prior : 31'h0; // @[Mux.scala 27:72]
  wire [29:0] _T_386 = _T_381 ? io_ifc_fetch_addr_f[30:1] : 30'h0; // @[Mux.scala 27:72]
  wire [30:0] _GEN_1036 = {{1'd0}, _T_384}; // @[Mux.scala 27:72]
  wire [30:0] _T_387 = _GEN_1036 | _T_385; // @[Mux.scala 27:72]
  wire [30:0] _GEN_1037 = {{1'd0}, _T_386}; // @[Mux.scala 27:72]
  wire [30:0] adder_pc_in_f = _T_387 | _GEN_1037; // @[Mux.scala 27:72]
  wire [31:0] _T_391 = {adder_pc_in_f[29:0],bp_total_branch_offset_f,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_392 = {btb_rd_tgt_f,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_395 = _T_391[12:1] + _T_392[12:1]; // @[el2_lib.scala 200:31]
  wire [18:0] _T_398 = _T_391[31:13] + 19'h1; // @[el2_lib.scala 201:27]
  wire [18:0] _T_401 = _T_391[31:13] - 19'h1; // @[el2_lib.scala 202:27]
  wire  _T_404 = ~_T_395[12]; // @[el2_lib.scala 204:27]
  wire  _T_405 = _T_392[12] ^ _T_404; // @[el2_lib.scala 204:25]
  wire  _T_408 = ~_T_392[12]; // @[el2_lib.scala 205:8]
  wire  _T_410 = _T_408 & _T_395[12]; // @[el2_lib.scala 205:14]
  wire  _T_414 = _T_392[12] & _T_404; // @[el2_lib.scala 206:13]
  wire [18:0] _T_416 = _T_405 ? _T_391[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_417 = _T_410 ? _T_398 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_418 = _T_414 ? _T_401 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_419 = _T_416 | _T_417; // @[Mux.scala 27:72]
  wire [18:0] _T_420 = _T_419 | _T_418; // @[Mux.scala 27:72]
  wire [31:0] bp_btb_target_adder_f = {_T_420,_T_395[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_424 = ~btb_rd_call_f; // @[el2_ifu_bp_ctl.scala 320:49]
  wire  _T_425 = btb_rd_ret_f & _T_424; // @[el2_ifu_bp_ctl.scala 320:47]
  reg [31:0] rets_out_0; // @[Reg.scala 27:20]
  wire  _T_427 = _T_425 & rets_out_0[0]; // @[el2_ifu_bp_ctl.scala 320:64]
  wire [12:0] _T_438 = {11'h0,_T_368,1'h0}; // @[Cat.scala 29:58]
  wire [12:0] _T_441 = _T_391[12:1] + _T_438[12:1]; // @[el2_lib.scala 200:31]
  wire  _T_450 = ~_T_441[12]; // @[el2_lib.scala 204:27]
  wire  _T_451 = _T_438[12] ^ _T_450; // @[el2_lib.scala 204:25]
  wire  _T_454 = ~_T_438[12]; // @[el2_lib.scala 205:8]
  wire  _T_456 = _T_454 & _T_441[12]; // @[el2_lib.scala 205:14]
  wire  _T_460 = _T_438[12] & _T_450; // @[el2_lib.scala 206:13]
  wire [18:0] _T_462 = _T_451 ? _T_391[31:13] : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_463 = _T_456 ? _T_398 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_464 = _T_460 ? _T_401 : 19'h0; // @[Mux.scala 27:72]
  wire [18:0] _T_465 = _T_462 | _T_463; // @[Mux.scala 27:72]
  wire [18:0] _T_466 = _T_465 | _T_464; // @[Mux.scala 27:72]
  wire [31:0] bp_rs_call_target_f = {_T_466,_T_441[11:0],1'h0}; // @[Cat.scala 29:58]
  wire  _T_470 = ~btb_rd_ret_f; // @[el2_ifu_bp_ctl.scala 326:33]
  wire  _T_471 = btb_rd_call_f & _T_470; // @[el2_ifu_bp_ctl.scala 326:31]
  wire  rs_push = _T_471 & io_ifu_bp_hit_taken_f; // @[el2_ifu_bp_ctl.scala 326:47]
  wire  rs_pop = _T_425 & io_ifu_bp_hit_taken_f; // @[el2_ifu_bp_ctl.scala 327:46]
  wire  _T_474 = ~rs_push; // @[el2_ifu_bp_ctl.scala 328:17]
  wire  _T_475 = ~rs_pop; // @[el2_ifu_bp_ctl.scala 328:28]
  wire  rs_hold = _T_474 & _T_475; // @[el2_ifu_bp_ctl.scala 328:26]
  wire  rsenable_0 = ~rs_hold; // @[el2_ifu_bp_ctl.scala 330:60]
  wire  rsenable_1 = rs_push | rs_pop; // @[el2_ifu_bp_ctl.scala 330:119]
  wire [31:0] _T_478 = {bp_rs_call_target_f[31:1],1'h1}; // @[Cat.scala 29:58]
  wire [31:0] _T_480 = rs_push ? _T_478 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_1; // @[Reg.scala 27:20]
  wire [31:0] _T_481 = rs_pop ? rets_out_1 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_0 = _T_480 | _T_481; // @[Mux.scala 27:72]
  wire [31:0] _T_485 = rs_push ? rets_out_0 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_2; // @[Reg.scala 27:20]
  wire [31:0] _T_486 = rs_pop ? rets_out_2 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_1 = _T_485 | _T_486; // @[Mux.scala 27:72]
  wire [31:0] _T_490 = rs_push ? rets_out_1 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_3; // @[Reg.scala 27:20]
  wire [31:0] _T_491 = rs_pop ? rets_out_3 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_2 = _T_490 | _T_491; // @[Mux.scala 27:72]
  wire [31:0] _T_495 = rs_push ? rets_out_2 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_4; // @[Reg.scala 27:20]
  wire [31:0] _T_496 = rs_pop ? rets_out_4 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_3 = _T_495 | _T_496; // @[Mux.scala 27:72]
  wire [31:0] _T_500 = rs_push ? rets_out_3 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_5; // @[Reg.scala 27:20]
  wire [31:0] _T_501 = rs_pop ? rets_out_5 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_4 = _T_500 | _T_501; // @[Mux.scala 27:72]
  wire [31:0] _T_505 = rs_push ? rets_out_4 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_6; // @[Reg.scala 27:20]
  wire [31:0] _T_506 = rs_pop ? rets_out_6 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_5 = _T_505 | _T_506; // @[Mux.scala 27:72]
  wire [31:0] _T_510 = rs_push ? rets_out_5 : 32'h0; // @[Mux.scala 27:72]
  reg [31:0] rets_out_7; // @[Reg.scala 27:20]
  wire [31:0] _T_511 = rs_pop ? rets_out_7 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] rets_in_6 = _T_510 | _T_511; // @[Mux.scala 27:72]
  wire  _T_529 = ~dec_tlu_error_wb; // @[el2_ifu_bp_ctl.scala 341:35]
  wire  btb_valid = exu_mp_valid & _T_529; // @[el2_ifu_bp_ctl.scala 341:32]
  wire  _T_530 = io_exu_mp_pkt_pcall | io_exu_mp_pkt_pja; // @[el2_ifu_bp_ctl.scala 344:89]
  wire  _T_531 = io_exu_mp_pkt_pret | io_exu_mp_pkt_pja; // @[el2_ifu_bp_ctl.scala 344:113]
  wire [21:0] btb_wr_data = {io_exu_mp_btag,io_exu_mp_pkt_toffset,io_exu_mp_pkt_pc4,io_exu_mp_pkt_boffset,_T_530,_T_531,btb_valid}; // @[Cat.scala 29:58]
  wire  exu_mp_valid_write = exu_mp_valid & io_exu_mp_pkt_ataken; // @[el2_ifu_bp_ctl.scala 345:41]
  wire  _T_538 = _T_176 & exu_mp_valid_write; // @[el2_ifu_bp_ctl.scala 347:39]
  wire  _T_540 = _T_538 & _T_529; // @[el2_ifu_bp_ctl.scala 347:60]
  wire  _T_541 = ~io_dec_tlu_br0_r_pkt_way; // @[el2_ifu_bp_ctl.scala 347:87]
  wire  _T_542 = _T_541 & dec_tlu_error_wb; // @[el2_ifu_bp_ctl.scala 347:104]
  wire  btb_wr_en_way0 = _T_540 | _T_542; // @[el2_ifu_bp_ctl.scala 347:83]
  wire  _T_543 = io_exu_mp_pkt_way & exu_mp_valid_write; // @[el2_ifu_bp_ctl.scala 348:36]
  wire  _T_545 = _T_543 & _T_529; // @[el2_ifu_bp_ctl.scala 348:57]
  wire  _T_546 = io_dec_tlu_br0_r_pkt_way & dec_tlu_error_wb; // @[el2_ifu_bp_ctl.scala 348:98]
  wire  btb_wr_en_way1 = _T_545 | _T_546; // @[el2_ifu_bp_ctl.scala 348:80]
  wire [7:0] btb_wr_addr = dec_tlu_error_wb ? {{1'd0}, btb_error_addr_wb} : io_exu_mp_index; // @[el2_ifu_bp_ctl.scala 350:24]
  wire  middle_of_bank = io_exu_mp_pkt_pc4 ^ io_exu_mp_pkt_boffset; // @[el2_ifu_bp_ctl.scala 351:35]
  wire  _T_548 = ~io_exu_mp_pkt_pcall; // @[el2_ifu_bp_ctl.scala 352:43]
  wire  _T_549 = exu_mp_valid & _T_548; // @[el2_ifu_bp_ctl.scala 352:41]
  wire  _T_550 = ~io_exu_mp_pkt_pret; // @[el2_ifu_bp_ctl.scala 352:58]
  wire  _T_551 = _T_549 & _T_550; // @[el2_ifu_bp_ctl.scala 352:56]
  wire  _T_552 = ~io_exu_mp_pkt_pja; // @[el2_ifu_bp_ctl.scala 352:72]
  wire  _T_553 = _T_551 & _T_552; // @[el2_ifu_bp_ctl.scala 352:70]
  wire [1:0] _T_555 = _T_553 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_556 = ~middle_of_bank; // @[el2_ifu_bp_ctl.scala 352:106]
  wire [1:0] _T_557 = {middle_of_bank,_T_556}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en0 = _T_555 & _T_557; // @[el2_ifu_bp_ctl.scala 352:84]
  wire [1:0] _T_559 = io_dec_tlu_br0_r_pkt_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  _T_560 = ~io_dec_tlu_br0_r_pkt_middle; // @[el2_ifu_bp_ctl.scala 353:75]
  wire [1:0] _T_561 = {io_dec_tlu_br0_r_pkt_middle,_T_560}; // @[Cat.scala 29:58]
  wire [1:0] bht_wr_en2 = _T_559 & _T_561; // @[el2_ifu_bp_ctl.scala 353:46]
  wire [9:0] _T_562 = {io_exu_mp_index,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] mp_hashed = _T_562[9:2] ^ io_exu_mp_eghr; // @[el2_lib.scala 190:35]
  wire [9:0] _T_565 = {io_exu_i0_br_index_r,2'h0}; // @[Cat.scala 29:58]
  wire [7:0] br0_hashed_wb = _T_565[9:2] ^ io_exu_i0_br_fghr_r; // @[el2_lib.scala 190:35]
  wire  _T_574 = btb_wr_addr == 8'h0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_575 = _T_574 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_577 = btb_wr_addr == 8'h1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_578 = _T_577 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_580 = btb_wr_addr == 8'h2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_581 = _T_580 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_583 = btb_wr_addr == 8'h3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_584 = _T_583 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_586 = btb_wr_addr == 8'h4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_587 = _T_586 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_589 = btb_wr_addr == 8'h5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_590 = _T_589 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_592 = btb_wr_addr == 8'h6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_593 = _T_592 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_595 = btb_wr_addr == 8'h7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_596 = _T_595 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_598 = btb_wr_addr == 8'h8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_599 = _T_598 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_601 = btb_wr_addr == 8'h9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_602 = _T_601 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_604 = btb_wr_addr == 8'ha; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_605 = _T_604 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_607 = btb_wr_addr == 8'hb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_608 = _T_607 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_610 = btb_wr_addr == 8'hc; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_611 = _T_610 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_613 = btb_wr_addr == 8'hd; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_614 = _T_613 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_616 = btb_wr_addr == 8'he; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_617 = _T_616 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_619 = btb_wr_addr == 8'hf; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_620 = _T_619 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_622 = btb_wr_addr == 8'h10; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_623 = _T_622 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_625 = btb_wr_addr == 8'h11; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_626 = _T_625 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_628 = btb_wr_addr == 8'h12; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_629 = _T_628 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_631 = btb_wr_addr == 8'h13; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_632 = _T_631 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_634 = btb_wr_addr == 8'h14; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_635 = _T_634 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_637 = btb_wr_addr == 8'h15; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_638 = _T_637 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_640 = btb_wr_addr == 8'h16; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_641 = _T_640 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_643 = btb_wr_addr == 8'h17; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_644 = _T_643 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_646 = btb_wr_addr == 8'h18; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_647 = _T_646 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_649 = btb_wr_addr == 8'h19; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_650 = _T_649 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_652 = btb_wr_addr == 8'h1a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_653 = _T_652 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_655 = btb_wr_addr == 8'h1b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_656 = _T_655 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_658 = btb_wr_addr == 8'h1c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_659 = _T_658 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_661 = btb_wr_addr == 8'h1d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_662 = _T_661 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_664 = btb_wr_addr == 8'h1e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_665 = _T_664 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_667 = btb_wr_addr == 8'h1f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_668 = _T_667 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_670 = btb_wr_addr == 8'h20; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_671 = _T_670 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_673 = btb_wr_addr == 8'h21; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_674 = _T_673 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_676 = btb_wr_addr == 8'h22; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_677 = _T_676 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_679 = btb_wr_addr == 8'h23; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_680 = _T_679 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_682 = btb_wr_addr == 8'h24; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_683 = _T_682 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_685 = btb_wr_addr == 8'h25; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_686 = _T_685 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_688 = btb_wr_addr == 8'h26; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_689 = _T_688 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_691 = btb_wr_addr == 8'h27; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_692 = _T_691 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_694 = btb_wr_addr == 8'h28; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_695 = _T_694 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_697 = btb_wr_addr == 8'h29; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_698 = _T_697 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_700 = btb_wr_addr == 8'h2a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_701 = _T_700 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_703 = btb_wr_addr == 8'h2b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_704 = _T_703 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_706 = btb_wr_addr == 8'h2c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_707 = _T_706 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_709 = btb_wr_addr == 8'h2d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_710 = _T_709 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_712 = btb_wr_addr == 8'h2e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_713 = _T_712 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_715 = btb_wr_addr == 8'h2f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_716 = _T_715 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_718 = btb_wr_addr == 8'h30; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_719 = _T_718 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_721 = btb_wr_addr == 8'h31; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_722 = _T_721 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_724 = btb_wr_addr == 8'h32; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_725 = _T_724 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_727 = btb_wr_addr == 8'h33; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_728 = _T_727 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_730 = btb_wr_addr == 8'h34; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_731 = _T_730 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_733 = btb_wr_addr == 8'h35; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_734 = _T_733 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_736 = btb_wr_addr == 8'h36; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_737 = _T_736 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_739 = btb_wr_addr == 8'h37; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_740 = _T_739 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_742 = btb_wr_addr == 8'h38; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_743 = _T_742 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_745 = btb_wr_addr == 8'h39; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_746 = _T_745 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_748 = btb_wr_addr == 8'h3a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_749 = _T_748 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_751 = btb_wr_addr == 8'h3b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_752 = _T_751 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_754 = btb_wr_addr == 8'h3c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_755 = _T_754 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_757 = btb_wr_addr == 8'h3d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_758 = _T_757 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_760 = btb_wr_addr == 8'h3e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_761 = _T_760 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_763 = btb_wr_addr == 8'h3f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_764 = _T_763 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_766 = btb_wr_addr == 8'h40; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_767 = _T_766 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_769 = btb_wr_addr == 8'h41; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_770 = _T_769 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_772 = btb_wr_addr == 8'h42; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_773 = _T_772 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_775 = btb_wr_addr == 8'h43; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_776 = _T_775 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_778 = btb_wr_addr == 8'h44; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_779 = _T_778 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_781 = btb_wr_addr == 8'h45; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_782 = _T_781 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_784 = btb_wr_addr == 8'h46; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_785 = _T_784 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_787 = btb_wr_addr == 8'h47; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_788 = _T_787 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_790 = btb_wr_addr == 8'h48; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_791 = _T_790 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_793 = btb_wr_addr == 8'h49; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_794 = _T_793 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_796 = btb_wr_addr == 8'h4a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_797 = _T_796 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_799 = btb_wr_addr == 8'h4b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_800 = _T_799 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_802 = btb_wr_addr == 8'h4c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_803 = _T_802 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_805 = btb_wr_addr == 8'h4d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_806 = _T_805 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_808 = btb_wr_addr == 8'h4e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_809 = _T_808 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_811 = btb_wr_addr == 8'h4f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_812 = _T_811 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_814 = btb_wr_addr == 8'h50; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_815 = _T_814 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_817 = btb_wr_addr == 8'h51; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_818 = _T_817 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_820 = btb_wr_addr == 8'h52; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_821 = _T_820 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_823 = btb_wr_addr == 8'h53; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_824 = _T_823 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_826 = btb_wr_addr == 8'h54; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_827 = _T_826 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_829 = btb_wr_addr == 8'h55; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_830 = _T_829 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_832 = btb_wr_addr == 8'h56; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_833 = _T_832 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_835 = btb_wr_addr == 8'h57; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_836 = _T_835 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_838 = btb_wr_addr == 8'h58; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_839 = _T_838 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_841 = btb_wr_addr == 8'h59; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_842 = _T_841 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_844 = btb_wr_addr == 8'h5a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_845 = _T_844 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_847 = btb_wr_addr == 8'h5b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_848 = _T_847 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_850 = btb_wr_addr == 8'h5c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_851 = _T_850 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_853 = btb_wr_addr == 8'h5d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_854 = _T_853 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_856 = btb_wr_addr == 8'h5e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_857 = _T_856 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_859 = btb_wr_addr == 8'h5f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_860 = _T_859 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_862 = btb_wr_addr == 8'h60; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_863 = _T_862 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_865 = btb_wr_addr == 8'h61; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_866 = _T_865 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_868 = btb_wr_addr == 8'h62; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_869 = _T_868 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_871 = btb_wr_addr == 8'h63; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_872 = _T_871 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_874 = btb_wr_addr == 8'h64; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_875 = _T_874 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_877 = btb_wr_addr == 8'h65; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_878 = _T_877 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_880 = btb_wr_addr == 8'h66; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_881 = _T_880 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_883 = btb_wr_addr == 8'h67; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_884 = _T_883 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_886 = btb_wr_addr == 8'h68; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_887 = _T_886 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_889 = btb_wr_addr == 8'h69; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_890 = _T_889 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_892 = btb_wr_addr == 8'h6a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_893 = _T_892 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_895 = btb_wr_addr == 8'h6b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_896 = _T_895 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_898 = btb_wr_addr == 8'h6c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_899 = _T_898 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_901 = btb_wr_addr == 8'h6d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_902 = _T_901 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_904 = btb_wr_addr == 8'h6e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_905 = _T_904 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_907 = btb_wr_addr == 8'h6f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_908 = _T_907 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_910 = btb_wr_addr == 8'h70; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_911 = _T_910 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_913 = btb_wr_addr == 8'h71; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_914 = _T_913 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_916 = btb_wr_addr == 8'h72; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_917 = _T_916 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_919 = btb_wr_addr == 8'h73; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_920 = _T_919 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_922 = btb_wr_addr == 8'h74; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_923 = _T_922 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_925 = btb_wr_addr == 8'h75; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_926 = _T_925 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_928 = btb_wr_addr == 8'h76; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_929 = _T_928 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_931 = btb_wr_addr == 8'h77; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_932 = _T_931 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_934 = btb_wr_addr == 8'h78; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_935 = _T_934 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_937 = btb_wr_addr == 8'h79; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_938 = _T_937 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_940 = btb_wr_addr == 8'h7a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_941 = _T_940 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_943 = btb_wr_addr == 8'h7b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_944 = _T_943 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_946 = btb_wr_addr == 8'h7c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_947 = _T_946 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_949 = btb_wr_addr == 8'h7d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_950 = _T_949 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_952 = btb_wr_addr == 8'h7e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_953 = _T_952 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_955 = btb_wr_addr == 8'h7f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_956 = _T_955 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_958 = btb_wr_addr == 8'h80; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_959 = _T_958 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_961 = btb_wr_addr == 8'h81; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_962 = _T_961 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_964 = btb_wr_addr == 8'h82; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_965 = _T_964 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_967 = btb_wr_addr == 8'h83; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_968 = _T_967 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_970 = btb_wr_addr == 8'h84; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_971 = _T_970 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_973 = btb_wr_addr == 8'h85; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_974 = _T_973 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_976 = btb_wr_addr == 8'h86; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_977 = _T_976 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_979 = btb_wr_addr == 8'h87; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_980 = _T_979 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_982 = btb_wr_addr == 8'h88; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_983 = _T_982 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_985 = btb_wr_addr == 8'h89; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_986 = _T_985 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_988 = btb_wr_addr == 8'h8a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_989 = _T_988 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_991 = btb_wr_addr == 8'h8b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_992 = _T_991 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_994 = btb_wr_addr == 8'h8c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_995 = _T_994 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_997 = btb_wr_addr == 8'h8d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_998 = _T_997 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1000 = btb_wr_addr == 8'h8e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1001 = _T_1000 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1003 = btb_wr_addr == 8'h8f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1004 = _T_1003 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1006 = btb_wr_addr == 8'h90; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1007 = _T_1006 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1009 = btb_wr_addr == 8'h91; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1010 = _T_1009 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1012 = btb_wr_addr == 8'h92; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1013 = _T_1012 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1015 = btb_wr_addr == 8'h93; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1016 = _T_1015 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1018 = btb_wr_addr == 8'h94; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1019 = _T_1018 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1021 = btb_wr_addr == 8'h95; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1022 = _T_1021 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1024 = btb_wr_addr == 8'h96; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1025 = _T_1024 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1027 = btb_wr_addr == 8'h97; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1028 = _T_1027 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1030 = btb_wr_addr == 8'h98; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1031 = _T_1030 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1033 = btb_wr_addr == 8'h99; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1034 = _T_1033 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1036 = btb_wr_addr == 8'h9a; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1037 = _T_1036 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1039 = btb_wr_addr == 8'h9b; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1040 = _T_1039 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1042 = btb_wr_addr == 8'h9c; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1043 = _T_1042 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1045 = btb_wr_addr == 8'h9d; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1046 = _T_1045 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1048 = btb_wr_addr == 8'h9e; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1049 = _T_1048 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1051 = btb_wr_addr == 8'h9f; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1052 = _T_1051 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1054 = btb_wr_addr == 8'ha0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1055 = _T_1054 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1057 = btb_wr_addr == 8'ha1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1058 = _T_1057 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1060 = btb_wr_addr == 8'ha2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1061 = _T_1060 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1063 = btb_wr_addr == 8'ha3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1064 = _T_1063 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1066 = btb_wr_addr == 8'ha4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1067 = _T_1066 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1069 = btb_wr_addr == 8'ha5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1070 = _T_1069 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1072 = btb_wr_addr == 8'ha6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1073 = _T_1072 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1075 = btb_wr_addr == 8'ha7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1076 = _T_1075 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1078 = btb_wr_addr == 8'ha8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1079 = _T_1078 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1081 = btb_wr_addr == 8'ha9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1082 = _T_1081 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1084 = btb_wr_addr == 8'haa; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1085 = _T_1084 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1087 = btb_wr_addr == 8'hab; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1088 = _T_1087 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1090 = btb_wr_addr == 8'hac; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1091 = _T_1090 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1093 = btb_wr_addr == 8'had; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1094 = _T_1093 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1096 = btb_wr_addr == 8'hae; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1097 = _T_1096 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1099 = btb_wr_addr == 8'haf; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1100 = _T_1099 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1102 = btb_wr_addr == 8'hb0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1103 = _T_1102 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1105 = btb_wr_addr == 8'hb1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1106 = _T_1105 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1108 = btb_wr_addr == 8'hb2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1109 = _T_1108 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1111 = btb_wr_addr == 8'hb3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1112 = _T_1111 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1114 = btb_wr_addr == 8'hb4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1115 = _T_1114 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1117 = btb_wr_addr == 8'hb5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1118 = _T_1117 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1120 = btb_wr_addr == 8'hb6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1121 = _T_1120 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1123 = btb_wr_addr == 8'hb7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1124 = _T_1123 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1126 = btb_wr_addr == 8'hb8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1127 = _T_1126 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1129 = btb_wr_addr == 8'hb9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1130 = _T_1129 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1132 = btb_wr_addr == 8'hba; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1133 = _T_1132 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1135 = btb_wr_addr == 8'hbb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1136 = _T_1135 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1138 = btb_wr_addr == 8'hbc; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1139 = _T_1138 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1141 = btb_wr_addr == 8'hbd; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1142 = _T_1141 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1144 = btb_wr_addr == 8'hbe; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1145 = _T_1144 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1147 = btb_wr_addr == 8'hbf; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1148 = _T_1147 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1150 = btb_wr_addr == 8'hc0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1151 = _T_1150 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1153 = btb_wr_addr == 8'hc1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1154 = _T_1153 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1156 = btb_wr_addr == 8'hc2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1157 = _T_1156 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1159 = btb_wr_addr == 8'hc3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1160 = _T_1159 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1162 = btb_wr_addr == 8'hc4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1163 = _T_1162 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1165 = btb_wr_addr == 8'hc5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1166 = _T_1165 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1168 = btb_wr_addr == 8'hc6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1169 = _T_1168 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1171 = btb_wr_addr == 8'hc7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1172 = _T_1171 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1174 = btb_wr_addr == 8'hc8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1175 = _T_1174 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1177 = btb_wr_addr == 8'hc9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1178 = _T_1177 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1180 = btb_wr_addr == 8'hca; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1181 = _T_1180 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1183 = btb_wr_addr == 8'hcb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1184 = _T_1183 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1186 = btb_wr_addr == 8'hcc; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1187 = _T_1186 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1189 = btb_wr_addr == 8'hcd; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1190 = _T_1189 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1192 = btb_wr_addr == 8'hce; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1193 = _T_1192 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1195 = btb_wr_addr == 8'hcf; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1196 = _T_1195 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1198 = btb_wr_addr == 8'hd0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1199 = _T_1198 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1201 = btb_wr_addr == 8'hd1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1202 = _T_1201 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1204 = btb_wr_addr == 8'hd2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1205 = _T_1204 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1207 = btb_wr_addr == 8'hd3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1208 = _T_1207 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1210 = btb_wr_addr == 8'hd4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1211 = _T_1210 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1213 = btb_wr_addr == 8'hd5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1214 = _T_1213 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1216 = btb_wr_addr == 8'hd6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1217 = _T_1216 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1219 = btb_wr_addr == 8'hd7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1220 = _T_1219 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1222 = btb_wr_addr == 8'hd8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1223 = _T_1222 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1225 = btb_wr_addr == 8'hd9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1226 = _T_1225 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1228 = btb_wr_addr == 8'hda; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1229 = _T_1228 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1231 = btb_wr_addr == 8'hdb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1232 = _T_1231 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1234 = btb_wr_addr == 8'hdc; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1235 = _T_1234 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1237 = btb_wr_addr == 8'hdd; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1238 = _T_1237 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1240 = btb_wr_addr == 8'hde; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1241 = _T_1240 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1243 = btb_wr_addr == 8'hdf; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1244 = _T_1243 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1246 = btb_wr_addr == 8'he0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1247 = _T_1246 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1249 = btb_wr_addr == 8'he1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1250 = _T_1249 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1252 = btb_wr_addr == 8'he2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1253 = _T_1252 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1255 = btb_wr_addr == 8'he3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1256 = _T_1255 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1258 = btb_wr_addr == 8'he4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1259 = _T_1258 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1261 = btb_wr_addr == 8'he5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1262 = _T_1261 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1264 = btb_wr_addr == 8'he6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1265 = _T_1264 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1267 = btb_wr_addr == 8'he7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1268 = _T_1267 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1270 = btb_wr_addr == 8'he8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1271 = _T_1270 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1273 = btb_wr_addr == 8'he9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1274 = _T_1273 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1276 = btb_wr_addr == 8'hea; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1277 = _T_1276 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1279 = btb_wr_addr == 8'heb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1280 = _T_1279 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1282 = btb_wr_addr == 8'hec; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1283 = _T_1282 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1285 = btb_wr_addr == 8'hed; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1286 = _T_1285 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1288 = btb_wr_addr == 8'hee; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1289 = _T_1288 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1291 = btb_wr_addr == 8'hef; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1292 = _T_1291 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1294 = btb_wr_addr == 8'hf0; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1295 = _T_1294 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1297 = btb_wr_addr == 8'hf1; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1298 = _T_1297 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1300 = btb_wr_addr == 8'hf2; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1301 = _T_1300 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1303 = btb_wr_addr == 8'hf3; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1304 = _T_1303 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1306 = btb_wr_addr == 8'hf4; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1307 = _T_1306 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1309 = btb_wr_addr == 8'hf5; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1310 = _T_1309 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1312 = btb_wr_addr == 8'hf6; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1313 = _T_1312 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1315 = btb_wr_addr == 8'hf7; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1316 = _T_1315 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1318 = btb_wr_addr == 8'hf8; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1319 = _T_1318 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1321 = btb_wr_addr == 8'hf9; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1322 = _T_1321 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1324 = btb_wr_addr == 8'hfa; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1325 = _T_1324 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1327 = btb_wr_addr == 8'hfb; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1328 = _T_1327 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1330 = btb_wr_addr == 8'hfc; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1331 = _T_1330 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1333 = btb_wr_addr == 8'hfd; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1334 = _T_1333 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1336 = btb_wr_addr == 8'hfe; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1337 = _T_1336 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1339 = btb_wr_addr == 8'hff; // @[el2_ifu_bp_ctl.scala 370:101]
  wire  _T_1340 = _T_1339 & btb_wr_en_way0; // @[el2_ifu_bp_ctl.scala 370:109]
  wire  _T_1343 = _T_574 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1346 = _T_577 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1349 = _T_580 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1352 = _T_583 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1355 = _T_586 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1358 = _T_589 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1361 = _T_592 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1364 = _T_595 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1367 = _T_598 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1370 = _T_601 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1373 = _T_604 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1376 = _T_607 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1379 = _T_610 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1382 = _T_613 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1385 = _T_616 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1388 = _T_619 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1391 = _T_622 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1394 = _T_625 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1397 = _T_628 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1400 = _T_631 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1403 = _T_634 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1406 = _T_637 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1409 = _T_640 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1412 = _T_643 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1415 = _T_646 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1418 = _T_649 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1421 = _T_652 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1424 = _T_655 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1427 = _T_658 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1430 = _T_661 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1433 = _T_664 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1436 = _T_667 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1439 = _T_670 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1442 = _T_673 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1445 = _T_676 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1448 = _T_679 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1451 = _T_682 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1454 = _T_685 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1457 = _T_688 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1460 = _T_691 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1463 = _T_694 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1466 = _T_697 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1469 = _T_700 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1472 = _T_703 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1475 = _T_706 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1478 = _T_709 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1481 = _T_712 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1484 = _T_715 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1487 = _T_718 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1490 = _T_721 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1493 = _T_724 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1496 = _T_727 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1499 = _T_730 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1502 = _T_733 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1505 = _T_736 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1508 = _T_739 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1511 = _T_742 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1514 = _T_745 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1517 = _T_748 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1520 = _T_751 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1523 = _T_754 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1526 = _T_757 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1529 = _T_760 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1532 = _T_763 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1535 = _T_766 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1538 = _T_769 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1541 = _T_772 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1544 = _T_775 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1547 = _T_778 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1550 = _T_781 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1553 = _T_784 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1556 = _T_787 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1559 = _T_790 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1562 = _T_793 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1565 = _T_796 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1568 = _T_799 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1571 = _T_802 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1574 = _T_805 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1577 = _T_808 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1580 = _T_811 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1583 = _T_814 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1586 = _T_817 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1589 = _T_820 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1592 = _T_823 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1595 = _T_826 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1598 = _T_829 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1601 = _T_832 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1604 = _T_835 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1607 = _T_838 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1610 = _T_841 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1613 = _T_844 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1616 = _T_847 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1619 = _T_850 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1622 = _T_853 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1625 = _T_856 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1628 = _T_859 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1631 = _T_862 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1634 = _T_865 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1637 = _T_868 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1640 = _T_871 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1643 = _T_874 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1646 = _T_877 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1649 = _T_880 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1652 = _T_883 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1655 = _T_886 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1658 = _T_889 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1661 = _T_892 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1664 = _T_895 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1667 = _T_898 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1670 = _T_901 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1673 = _T_904 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1676 = _T_907 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1679 = _T_910 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1682 = _T_913 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1685 = _T_916 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1688 = _T_919 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1691 = _T_922 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1694 = _T_925 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1697 = _T_928 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1700 = _T_931 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1703 = _T_934 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1706 = _T_937 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1709 = _T_940 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1712 = _T_943 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1715 = _T_946 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1718 = _T_949 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1721 = _T_952 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1724 = _T_955 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1727 = _T_958 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1730 = _T_961 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1733 = _T_964 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1736 = _T_967 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1739 = _T_970 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1742 = _T_973 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1745 = _T_976 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1748 = _T_979 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1751 = _T_982 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1754 = _T_985 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1757 = _T_988 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1760 = _T_991 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1763 = _T_994 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1766 = _T_997 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1769 = _T_1000 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1772 = _T_1003 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1775 = _T_1006 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1778 = _T_1009 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1781 = _T_1012 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1784 = _T_1015 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1787 = _T_1018 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1790 = _T_1021 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1793 = _T_1024 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1796 = _T_1027 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1799 = _T_1030 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1802 = _T_1033 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1805 = _T_1036 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1808 = _T_1039 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1811 = _T_1042 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1814 = _T_1045 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1817 = _T_1048 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1820 = _T_1051 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1823 = _T_1054 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1826 = _T_1057 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1829 = _T_1060 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1832 = _T_1063 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1835 = _T_1066 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1838 = _T_1069 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1841 = _T_1072 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1844 = _T_1075 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1847 = _T_1078 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1850 = _T_1081 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1853 = _T_1084 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1856 = _T_1087 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1859 = _T_1090 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1862 = _T_1093 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1865 = _T_1096 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1868 = _T_1099 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1871 = _T_1102 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1874 = _T_1105 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1877 = _T_1108 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1880 = _T_1111 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1883 = _T_1114 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1886 = _T_1117 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1889 = _T_1120 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1892 = _T_1123 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1895 = _T_1126 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1898 = _T_1129 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1901 = _T_1132 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1904 = _T_1135 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1907 = _T_1138 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1910 = _T_1141 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1913 = _T_1144 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1916 = _T_1147 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1919 = _T_1150 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1922 = _T_1153 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1925 = _T_1156 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1928 = _T_1159 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1931 = _T_1162 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1934 = _T_1165 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1937 = _T_1168 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1940 = _T_1171 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1943 = _T_1174 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1946 = _T_1177 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1949 = _T_1180 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1952 = _T_1183 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1955 = _T_1186 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1958 = _T_1189 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1961 = _T_1192 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1964 = _T_1195 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1967 = _T_1198 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1970 = _T_1201 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1973 = _T_1204 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1976 = _T_1207 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1979 = _T_1210 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1982 = _T_1213 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1985 = _T_1216 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1988 = _T_1219 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1991 = _T_1222 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1994 = _T_1225 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_1997 = _T_1228 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2000 = _T_1231 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2003 = _T_1234 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2006 = _T_1237 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2009 = _T_1240 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2012 = _T_1243 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2015 = _T_1246 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2018 = _T_1249 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2021 = _T_1252 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2024 = _T_1255 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2027 = _T_1258 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2030 = _T_1261 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2033 = _T_1264 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2036 = _T_1267 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2039 = _T_1270 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2042 = _T_1273 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2045 = _T_1276 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2048 = _T_1279 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2051 = _T_1282 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2054 = _T_1285 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2057 = _T_1288 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2060 = _T_1291 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2063 = _T_1294 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2066 = _T_1297 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2069 = _T_1300 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2072 = _T_1303 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2075 = _T_1306 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2078 = _T_1309 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2081 = _T_1312 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2084 = _T_1315 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2087 = _T_1318 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2090 = _T_1321 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2093 = _T_1324 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2096 = _T_1327 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2099 = _T_1330 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2102 = _T_1333 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2105 = _T_1336 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_2108 = _T_1339 & btb_wr_en_way1; // @[el2_ifu_bp_ctl.scala 371:109]
  wire  _T_6208 = br0_hashed_wb[3:0] == 4'h0; // @[el2_ifu_bp_ctl.scala 380:74]
  wire  _T_6209 = bht_wr_en2[0] & _T_6208; // @[el2_ifu_bp_ctl.scala 380:23]
  wire  _T_6211 = ~br0_hashed_wb[4]; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6212 = _T_6209 & _T_6211; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_6356 = _T_6209 & br0_hashed_wb[4]; // @[el2_ifu_bp_ctl.scala 380:86]
  wire [1:0] _GEN_1038 = {{1'd0}, br0_hashed_wb[4]}; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6499 = _GEN_1038 == 2'h2; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6500 = _T_6209 & _T_6499; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_6643 = _GEN_1038 == 2'h3; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6644 = _T_6209 & _T_6643; // @[el2_ifu_bp_ctl.scala 380:86]
  wire [2:0] _GEN_1070 = {{2'd0}, br0_hashed_wb[4]}; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6787 = _GEN_1070 == 3'h4; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6788 = _T_6209 & _T_6787; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_6931 = _GEN_1070 == 3'h5; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_6932 = _T_6209 & _T_6931; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7075 = _GEN_1070 == 3'h6; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7076 = _T_6209 & _T_7075; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7219 = _GEN_1070 == 3'h7; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7220 = _T_6209 & _T_7219; // @[el2_ifu_bp_ctl.scala 380:86]
  wire [3:0] _GEN_1134 = {{3'd0}, br0_hashed_wb[4]}; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7363 = _GEN_1134 == 4'h8; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7364 = _T_6209 & _T_7363; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7507 = _GEN_1134 == 4'h9; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7508 = _T_6209 & _T_7507; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7651 = _GEN_1134 == 4'ha; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7652 = _T_6209 & _T_7651; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7795 = _GEN_1134 == 4'hb; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7796 = _T_6209 & _T_7795; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_7939 = _GEN_1134 == 4'hc; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_7940 = _T_6209 & _T_7939; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8083 = _GEN_1134 == 4'hd; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_8084 = _T_6209 & _T_8083; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8227 = _GEN_1134 == 4'he; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_8228 = _T_6209 & _T_8227; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8371 = _GEN_1134 == 4'hf; // @[el2_ifu_bp_ctl.scala 380:171]
  wire  _T_8372 = _T_6209 & _T_8371; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8513 = bht_wr_en2[1] & _T_6208; // @[el2_ifu_bp_ctl.scala 380:23]
  wire  _T_8516 = _T_8513 & _T_6211; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8660 = _T_8513 & br0_hashed_wb[4]; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8804 = _T_8513 & _T_6499; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_8948 = _T_8513 & _T_6643; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9092 = _T_8513 & _T_6787; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9236 = _T_8513 & _T_6931; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9380 = _T_8513 & _T_7075; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9524 = _T_8513 & _T_7219; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9668 = _T_8513 & _T_7363; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9812 = _T_8513 & _T_7507; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_9956 = _T_8513 & _T_7651; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10100 = _T_8513 & _T_7795; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10244 = _T_8513 & _T_7939; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10388 = _T_8513 & _T_8083; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10532 = _T_8513 & _T_8227; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10676 = _T_8513 & _T_8371; // @[el2_ifu_bp_ctl.scala 380:86]
  wire  _T_10816 = mp_hashed[3:0] == 4'h0; // @[el2_ifu_bp_ctl.scala 383:69]
  wire  _T_10817 = bht_wr_en0[0] & _T_10816; // @[el2_ifu_bp_ctl.scala 383:17]
  wire  _T_10819 = ~mp_hashed[4]; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_10820 = _T_10817 & _T_10819; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_0_0 = _T_10820 | _T_6212; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_11076 = _T_10817 & mp_hashed[4]; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_1_0 = _T_11076 | _T_6356; // @[el2_ifu_bp_ctl.scala 383:204]
  wire [1:0] _GEN_1486 = {{1'd0}, mp_hashed[4]}; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_11331 = _GEN_1486 == 2'h2; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_11332 = _T_10817 & _T_11331; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_2_0 = _T_11332 | _T_6500; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_11587 = _GEN_1486 == 2'h3; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_11588 = _T_10817 & _T_11587; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_3_0 = _T_11588 | _T_6644; // @[el2_ifu_bp_ctl.scala 383:204]
  wire [2:0] _GEN_1550 = {{2'd0}, mp_hashed[4]}; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_11843 = _GEN_1550 == 3'h4; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_11844 = _T_10817 & _T_11843; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_4_0 = _T_11844 | _T_6788; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_12099 = _GEN_1550 == 3'h5; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_12100 = _T_10817 & _T_12099; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_5_0 = _T_12100 | _T_6932; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_12355 = _GEN_1550 == 3'h6; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_12356 = _T_10817 & _T_12355; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_6_0 = _T_12356 | _T_7076; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_12611 = _GEN_1550 == 3'h7; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_12612 = _T_10817 & _T_12611; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_7_0 = _T_12612 | _T_7220; // @[el2_ifu_bp_ctl.scala 383:204]
  wire [3:0] _GEN_1678 = {{3'd0}, mp_hashed[4]}; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_12867 = _GEN_1678 == 4'h8; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_12868 = _T_10817 & _T_12867; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_8_0 = _T_12868 | _T_7364; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_13123 = _GEN_1678 == 4'h9; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_13124 = _T_10817 & _T_13123; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_9_0 = _T_13124 | _T_7508; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_13379 = _GEN_1678 == 4'ha; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_13380 = _T_10817 & _T_13379; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_10_0 = _T_13380 | _T_7652; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_13635 = _GEN_1678 == 4'hb; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_13636 = _T_10817 & _T_13635; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_11_0 = _T_13636 | _T_7796; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_13891 = _GEN_1678 == 4'hc; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_13892 = _T_10817 & _T_13891; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_12_0 = _T_13892 | _T_7940; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_14147 = _GEN_1678 == 4'hd; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_14148 = _T_10817 & _T_14147; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_13_0 = _T_14148 | _T_8084; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_14403 = _GEN_1678 == 4'he; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_14404 = _T_10817 & _T_14403; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_14_0 = _T_14404 | _T_8228; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_14659 = _GEN_1678 == 4'hf; // @[el2_ifu_bp_ctl.scala 383:169]
  wire  _T_14660 = _T_10817 & _T_14659; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_0_15_0 = _T_14660 | _T_8372; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_14913 = bht_wr_en0[1] & _T_10816; // @[el2_ifu_bp_ctl.scala 383:17]
  wire  _T_14916 = _T_14913 & _T_10819; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_0_0 = _T_14916 | _T_8516; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_15172 = _T_14913 & mp_hashed[4]; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_1_0 = _T_15172 | _T_8660; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_15428 = _T_14913 & _T_11331; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_2_0 = _T_15428 | _T_8804; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_15684 = _T_14913 & _T_11587; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_3_0 = _T_15684 | _T_8948; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_15940 = _T_14913 & _T_11843; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_4_0 = _T_15940 | _T_9092; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_16196 = _T_14913 & _T_12099; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_5_0 = _T_16196 | _T_9236; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_16452 = _T_14913 & _T_12355; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_6_0 = _T_16452 | _T_9380; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_16708 = _T_14913 & _T_12611; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_7_0 = _T_16708 | _T_9524; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_16964 = _T_14913 & _T_12867; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_8_0 = _T_16964 | _T_9668; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_17220 = _T_14913 & _T_13123; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_9_0 = _T_17220 | _T_9812; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_17476 = _T_14913 & _T_13379; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_10_0 = _T_17476 | _T_9956; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_17732 = _T_14913 & _T_13635; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_11_0 = _T_17732 | _T_10100; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_17988 = _T_14913 & _T_13891; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_12_0 = _T_17988 | _T_10244; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_18244 = _T_14913 & _T_14147; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_13_0 = _T_18244 | _T_10388; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_18500 = _T_14913 & _T_14403; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_14_0 = _T_18500 | _T_10532; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_18756 = _T_14913 & _T_14659; // @[el2_ifu_bp_ctl.scala 383:82]
  wire  bht_bank_sel_1_15_0 = _T_18756 | _T_10676; // @[el2_ifu_bp_ctl.scala 383:204]
  wire  _T_19007 = mp_hashed == 8'h0; // @[el2_ifu_bp_ctl.scala 388:36]
  wire  _T_19009 = bht_wr_en0[0] & _T_19007; // @[el2_ifu_bp_ctl.scala 388:20]
  wire  _T_19011 = br0_hashed_wb == 8'h0; // @[el2_ifu_bp_ctl.scala 389:34]
  wire  _T_19013 = bht_wr_en2[0] & _T_19011; // @[el2_ifu_bp_ctl.scala 389:18]
  wire  bht_bank_clken_0_0 = _T_19009 | _T_19013; // @[el2_ifu_bp_ctl.scala 388:74]
  wire  _T_19137 = bht_wr_en0[1] & _T_19007; // @[el2_ifu_bp_ctl.scala 388:20]
  wire  _T_19141 = bht_wr_en2[1] & _T_19011; // @[el2_ifu_bp_ctl.scala 389:18]
  wire  bht_bank_clken_1_0 = _T_19137 | _T_19141; // @[el2_ifu_bp_ctl.scala 388:74]
  wire  _T_19262 = bht_bank_sel_0_0_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19264 = bht_bank_sel_0_1_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19266 = bht_bank_sel_0_2_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19268 = bht_bank_sel_0_3_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19270 = bht_bank_sel_0_4_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19272 = bht_bank_sel_0_5_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19274 = bht_bank_sel_0_6_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19276 = bht_bank_sel_0_7_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19278 = bht_bank_sel_0_8_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19280 = bht_bank_sel_0_9_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19282 = bht_bank_sel_0_10_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19284 = bht_bank_sel_0_11_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19286 = bht_bank_sel_0_12_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19288 = bht_bank_sel_0_13_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19290 = bht_bank_sel_0_14_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19292 = bht_bank_sel_0_15_0 & bht_bank_clken_0_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19774 = bht_bank_sel_1_0_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19776 = bht_bank_sel_1_1_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19778 = bht_bank_sel_1_2_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19780 = bht_bank_sel_1_3_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19782 = bht_bank_sel_1_4_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19784 = bht_bank_sel_1_5_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19786 = bht_bank_sel_1_6_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19788 = bht_bank_sel_1_7_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19790 = bht_bank_sel_1_8_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19792 = bht_bank_sel_1_9_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19794 = bht_bank_sel_1_10_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19796 = bht_bank_sel_1_11_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19798 = bht_bank_sel_1_12_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19800 = bht_bank_sel_1_13_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19802 = bht_bank_sel_1_14_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  wire  _T_19804 = bht_bank_sel_1_15_0 & bht_bank_clken_1_0; // @[el2_ifu_bp_ctl.scala 392:105]
  assign io_ifu_bp_hit_taken_f = _T_238 & _T_239; // @[el2_ifu_bp_ctl.scala 238:25]
  assign io_ifu_bp_btb_target_f = _T_427 ? rets_out_0[31:1] : bp_btb_target_adder_f[31:1]; // @[el2_ifu_bp_ctl.scala 320:26]
  assign io_ifu_bp_inst_mask_f = _T_275 | _T_276; // @[el2_ifu_bp_ctl.scala 258:25]
  assign io_ifu_bp_fghr_f = fghr; // @[el2_ifu_bp_ctl.scala 290:20]
  assign io_ifu_bp_way_f = tag_match_vway1_expanded_f | _T_214; // @[el2_ifu_bp_ctl.scala 292:19]
  assign io_ifu_bp_ret_f = {_T_295,_T_301}; // @[el2_ifu_bp_ctl.scala 298:19]
  assign io_ifu_bp_hist1_f = bht_force_taken_f | _T_280; // @[el2_ifu_bp_ctl.scala 293:21]
  assign io_ifu_bp_hist0_f = {bht_vbank1_rd_data_f[0],bht_vbank0_rd_data_f[0]}; // @[el2_ifu_bp_ctl.scala 294:21]
  assign io_ifu_bp_pc4_f = {_T_286,_T_289}; // @[el2_ifu_bp_ctl.scala 295:19]
  assign io_ifu_bp_valid_f = vwayhit_f & _T_344; // @[el2_ifu_bp_ctl.scala 297:21]
  assign io_ifu_bp_poffset_f = btb_sel_data_f[15:4]; // @[el2_ifu_bp_ctl.scala 310:23]
  assign io_test1 = _T_172 & _T_173; // @[el2_ifu_bp_ctl.scala 199:12]
  assign io_test2 = tag_match_vway1_expanded_f | _T_214; // @[el2_ifu_bp_ctl.scala 220:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  leak_one_f_d1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_0 = _RAND_1[21:0];
  _RAND_2 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_1 = _RAND_2[21:0];
  _RAND_3 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_2 = _RAND_3[21:0];
  _RAND_4 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_3 = _RAND_4[21:0];
  _RAND_5 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_4 = _RAND_5[21:0];
  _RAND_6 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_5 = _RAND_6[21:0];
  _RAND_7 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_6 = _RAND_7[21:0];
  _RAND_8 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_7 = _RAND_8[21:0];
  _RAND_9 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_8 = _RAND_9[21:0];
  _RAND_10 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_9 = _RAND_10[21:0];
  _RAND_11 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_10 = _RAND_11[21:0];
  _RAND_12 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_11 = _RAND_12[21:0];
  _RAND_13 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_12 = _RAND_13[21:0];
  _RAND_14 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_13 = _RAND_14[21:0];
  _RAND_15 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_14 = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_15 = _RAND_16[21:0];
  _RAND_17 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_16 = _RAND_17[21:0];
  _RAND_18 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_17 = _RAND_18[21:0];
  _RAND_19 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_18 = _RAND_19[21:0];
  _RAND_20 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_19 = _RAND_20[21:0];
  _RAND_21 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_20 = _RAND_21[21:0];
  _RAND_22 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_21 = _RAND_22[21:0];
  _RAND_23 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_22 = _RAND_23[21:0];
  _RAND_24 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_23 = _RAND_24[21:0];
  _RAND_25 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_24 = _RAND_25[21:0];
  _RAND_26 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_25 = _RAND_26[21:0];
  _RAND_27 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_26 = _RAND_27[21:0];
  _RAND_28 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_27 = _RAND_28[21:0];
  _RAND_29 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_28 = _RAND_29[21:0];
  _RAND_30 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_29 = _RAND_30[21:0];
  _RAND_31 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_30 = _RAND_31[21:0];
  _RAND_32 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_31 = _RAND_32[21:0];
  _RAND_33 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_32 = _RAND_33[21:0];
  _RAND_34 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_33 = _RAND_34[21:0];
  _RAND_35 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_34 = _RAND_35[21:0];
  _RAND_36 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_35 = _RAND_36[21:0];
  _RAND_37 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_36 = _RAND_37[21:0];
  _RAND_38 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_37 = _RAND_38[21:0];
  _RAND_39 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_38 = _RAND_39[21:0];
  _RAND_40 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_39 = _RAND_40[21:0];
  _RAND_41 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_40 = _RAND_41[21:0];
  _RAND_42 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_41 = _RAND_42[21:0];
  _RAND_43 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_42 = _RAND_43[21:0];
  _RAND_44 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_43 = _RAND_44[21:0];
  _RAND_45 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_44 = _RAND_45[21:0];
  _RAND_46 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_45 = _RAND_46[21:0];
  _RAND_47 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_46 = _RAND_47[21:0];
  _RAND_48 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_47 = _RAND_48[21:0];
  _RAND_49 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_48 = _RAND_49[21:0];
  _RAND_50 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_49 = _RAND_50[21:0];
  _RAND_51 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_50 = _RAND_51[21:0];
  _RAND_52 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_51 = _RAND_52[21:0];
  _RAND_53 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_52 = _RAND_53[21:0];
  _RAND_54 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_53 = _RAND_54[21:0];
  _RAND_55 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_54 = _RAND_55[21:0];
  _RAND_56 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_55 = _RAND_56[21:0];
  _RAND_57 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_56 = _RAND_57[21:0];
  _RAND_58 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_57 = _RAND_58[21:0];
  _RAND_59 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_58 = _RAND_59[21:0];
  _RAND_60 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_59 = _RAND_60[21:0];
  _RAND_61 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_60 = _RAND_61[21:0];
  _RAND_62 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_61 = _RAND_62[21:0];
  _RAND_63 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_62 = _RAND_63[21:0];
  _RAND_64 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_63 = _RAND_64[21:0];
  _RAND_65 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_64 = _RAND_65[21:0];
  _RAND_66 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_65 = _RAND_66[21:0];
  _RAND_67 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_66 = _RAND_67[21:0];
  _RAND_68 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_67 = _RAND_68[21:0];
  _RAND_69 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_68 = _RAND_69[21:0];
  _RAND_70 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_69 = _RAND_70[21:0];
  _RAND_71 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_70 = _RAND_71[21:0];
  _RAND_72 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_71 = _RAND_72[21:0];
  _RAND_73 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_72 = _RAND_73[21:0];
  _RAND_74 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_73 = _RAND_74[21:0];
  _RAND_75 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_74 = _RAND_75[21:0];
  _RAND_76 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_75 = _RAND_76[21:0];
  _RAND_77 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_76 = _RAND_77[21:0];
  _RAND_78 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_77 = _RAND_78[21:0];
  _RAND_79 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_78 = _RAND_79[21:0];
  _RAND_80 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_79 = _RAND_80[21:0];
  _RAND_81 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_80 = _RAND_81[21:0];
  _RAND_82 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_81 = _RAND_82[21:0];
  _RAND_83 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_82 = _RAND_83[21:0];
  _RAND_84 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_83 = _RAND_84[21:0];
  _RAND_85 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_84 = _RAND_85[21:0];
  _RAND_86 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_85 = _RAND_86[21:0];
  _RAND_87 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_86 = _RAND_87[21:0];
  _RAND_88 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_87 = _RAND_88[21:0];
  _RAND_89 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_88 = _RAND_89[21:0];
  _RAND_90 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_89 = _RAND_90[21:0];
  _RAND_91 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_90 = _RAND_91[21:0];
  _RAND_92 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_91 = _RAND_92[21:0];
  _RAND_93 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_92 = _RAND_93[21:0];
  _RAND_94 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_93 = _RAND_94[21:0];
  _RAND_95 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_94 = _RAND_95[21:0];
  _RAND_96 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_95 = _RAND_96[21:0];
  _RAND_97 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_96 = _RAND_97[21:0];
  _RAND_98 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_97 = _RAND_98[21:0];
  _RAND_99 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_98 = _RAND_99[21:0];
  _RAND_100 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_99 = _RAND_100[21:0];
  _RAND_101 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_100 = _RAND_101[21:0];
  _RAND_102 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_101 = _RAND_102[21:0];
  _RAND_103 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_102 = _RAND_103[21:0];
  _RAND_104 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_103 = _RAND_104[21:0];
  _RAND_105 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_104 = _RAND_105[21:0];
  _RAND_106 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_105 = _RAND_106[21:0];
  _RAND_107 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_106 = _RAND_107[21:0];
  _RAND_108 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_107 = _RAND_108[21:0];
  _RAND_109 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_108 = _RAND_109[21:0];
  _RAND_110 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_109 = _RAND_110[21:0];
  _RAND_111 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_110 = _RAND_111[21:0];
  _RAND_112 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_111 = _RAND_112[21:0];
  _RAND_113 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_112 = _RAND_113[21:0];
  _RAND_114 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_113 = _RAND_114[21:0];
  _RAND_115 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_114 = _RAND_115[21:0];
  _RAND_116 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_115 = _RAND_116[21:0];
  _RAND_117 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_116 = _RAND_117[21:0];
  _RAND_118 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_117 = _RAND_118[21:0];
  _RAND_119 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_118 = _RAND_119[21:0];
  _RAND_120 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_119 = _RAND_120[21:0];
  _RAND_121 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_120 = _RAND_121[21:0];
  _RAND_122 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_121 = _RAND_122[21:0];
  _RAND_123 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_122 = _RAND_123[21:0];
  _RAND_124 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_123 = _RAND_124[21:0];
  _RAND_125 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_124 = _RAND_125[21:0];
  _RAND_126 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_125 = _RAND_126[21:0];
  _RAND_127 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_126 = _RAND_127[21:0];
  _RAND_128 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_127 = _RAND_128[21:0];
  _RAND_129 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_128 = _RAND_129[21:0];
  _RAND_130 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_129 = _RAND_130[21:0];
  _RAND_131 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_130 = _RAND_131[21:0];
  _RAND_132 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_131 = _RAND_132[21:0];
  _RAND_133 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_132 = _RAND_133[21:0];
  _RAND_134 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_133 = _RAND_134[21:0];
  _RAND_135 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_134 = _RAND_135[21:0];
  _RAND_136 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_135 = _RAND_136[21:0];
  _RAND_137 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_136 = _RAND_137[21:0];
  _RAND_138 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_137 = _RAND_138[21:0];
  _RAND_139 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_138 = _RAND_139[21:0];
  _RAND_140 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_139 = _RAND_140[21:0];
  _RAND_141 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_140 = _RAND_141[21:0];
  _RAND_142 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_141 = _RAND_142[21:0];
  _RAND_143 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_142 = _RAND_143[21:0];
  _RAND_144 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_143 = _RAND_144[21:0];
  _RAND_145 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_144 = _RAND_145[21:0];
  _RAND_146 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_145 = _RAND_146[21:0];
  _RAND_147 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_146 = _RAND_147[21:0];
  _RAND_148 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_147 = _RAND_148[21:0];
  _RAND_149 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_148 = _RAND_149[21:0];
  _RAND_150 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_149 = _RAND_150[21:0];
  _RAND_151 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_150 = _RAND_151[21:0];
  _RAND_152 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_151 = _RAND_152[21:0];
  _RAND_153 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_152 = _RAND_153[21:0];
  _RAND_154 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_153 = _RAND_154[21:0];
  _RAND_155 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_154 = _RAND_155[21:0];
  _RAND_156 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_155 = _RAND_156[21:0];
  _RAND_157 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_156 = _RAND_157[21:0];
  _RAND_158 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_157 = _RAND_158[21:0];
  _RAND_159 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_158 = _RAND_159[21:0];
  _RAND_160 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_159 = _RAND_160[21:0];
  _RAND_161 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_160 = _RAND_161[21:0];
  _RAND_162 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_161 = _RAND_162[21:0];
  _RAND_163 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_162 = _RAND_163[21:0];
  _RAND_164 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_163 = _RAND_164[21:0];
  _RAND_165 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_164 = _RAND_165[21:0];
  _RAND_166 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_165 = _RAND_166[21:0];
  _RAND_167 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_166 = _RAND_167[21:0];
  _RAND_168 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_167 = _RAND_168[21:0];
  _RAND_169 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_168 = _RAND_169[21:0];
  _RAND_170 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_169 = _RAND_170[21:0];
  _RAND_171 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_170 = _RAND_171[21:0];
  _RAND_172 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_171 = _RAND_172[21:0];
  _RAND_173 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_172 = _RAND_173[21:0];
  _RAND_174 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_173 = _RAND_174[21:0];
  _RAND_175 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_174 = _RAND_175[21:0];
  _RAND_176 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_175 = _RAND_176[21:0];
  _RAND_177 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_176 = _RAND_177[21:0];
  _RAND_178 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_177 = _RAND_178[21:0];
  _RAND_179 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_178 = _RAND_179[21:0];
  _RAND_180 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_179 = _RAND_180[21:0];
  _RAND_181 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_180 = _RAND_181[21:0];
  _RAND_182 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_181 = _RAND_182[21:0];
  _RAND_183 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_182 = _RAND_183[21:0];
  _RAND_184 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_183 = _RAND_184[21:0];
  _RAND_185 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_184 = _RAND_185[21:0];
  _RAND_186 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_185 = _RAND_186[21:0];
  _RAND_187 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_186 = _RAND_187[21:0];
  _RAND_188 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_187 = _RAND_188[21:0];
  _RAND_189 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_188 = _RAND_189[21:0];
  _RAND_190 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_189 = _RAND_190[21:0];
  _RAND_191 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_190 = _RAND_191[21:0];
  _RAND_192 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_191 = _RAND_192[21:0];
  _RAND_193 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_192 = _RAND_193[21:0];
  _RAND_194 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_193 = _RAND_194[21:0];
  _RAND_195 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_194 = _RAND_195[21:0];
  _RAND_196 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_195 = _RAND_196[21:0];
  _RAND_197 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_196 = _RAND_197[21:0];
  _RAND_198 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_197 = _RAND_198[21:0];
  _RAND_199 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_198 = _RAND_199[21:0];
  _RAND_200 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_199 = _RAND_200[21:0];
  _RAND_201 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_200 = _RAND_201[21:0];
  _RAND_202 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_201 = _RAND_202[21:0];
  _RAND_203 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_202 = _RAND_203[21:0];
  _RAND_204 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_203 = _RAND_204[21:0];
  _RAND_205 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_204 = _RAND_205[21:0];
  _RAND_206 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_205 = _RAND_206[21:0];
  _RAND_207 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_206 = _RAND_207[21:0];
  _RAND_208 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_207 = _RAND_208[21:0];
  _RAND_209 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_208 = _RAND_209[21:0];
  _RAND_210 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_209 = _RAND_210[21:0];
  _RAND_211 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_210 = _RAND_211[21:0];
  _RAND_212 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_211 = _RAND_212[21:0];
  _RAND_213 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_212 = _RAND_213[21:0];
  _RAND_214 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_213 = _RAND_214[21:0];
  _RAND_215 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_214 = _RAND_215[21:0];
  _RAND_216 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_215 = _RAND_216[21:0];
  _RAND_217 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_216 = _RAND_217[21:0];
  _RAND_218 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_217 = _RAND_218[21:0];
  _RAND_219 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_218 = _RAND_219[21:0];
  _RAND_220 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_219 = _RAND_220[21:0];
  _RAND_221 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_220 = _RAND_221[21:0];
  _RAND_222 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_221 = _RAND_222[21:0];
  _RAND_223 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_222 = _RAND_223[21:0];
  _RAND_224 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_223 = _RAND_224[21:0];
  _RAND_225 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_224 = _RAND_225[21:0];
  _RAND_226 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_225 = _RAND_226[21:0];
  _RAND_227 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_226 = _RAND_227[21:0];
  _RAND_228 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_227 = _RAND_228[21:0];
  _RAND_229 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_228 = _RAND_229[21:0];
  _RAND_230 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_229 = _RAND_230[21:0];
  _RAND_231 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_230 = _RAND_231[21:0];
  _RAND_232 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_231 = _RAND_232[21:0];
  _RAND_233 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_232 = _RAND_233[21:0];
  _RAND_234 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_233 = _RAND_234[21:0];
  _RAND_235 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_234 = _RAND_235[21:0];
  _RAND_236 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_235 = _RAND_236[21:0];
  _RAND_237 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_236 = _RAND_237[21:0];
  _RAND_238 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_237 = _RAND_238[21:0];
  _RAND_239 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_238 = _RAND_239[21:0];
  _RAND_240 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_239 = _RAND_240[21:0];
  _RAND_241 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_240 = _RAND_241[21:0];
  _RAND_242 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_241 = _RAND_242[21:0];
  _RAND_243 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_242 = _RAND_243[21:0];
  _RAND_244 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_243 = _RAND_244[21:0];
  _RAND_245 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_244 = _RAND_245[21:0];
  _RAND_246 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_245 = _RAND_246[21:0];
  _RAND_247 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_246 = _RAND_247[21:0];
  _RAND_248 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_247 = _RAND_248[21:0];
  _RAND_249 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_248 = _RAND_249[21:0];
  _RAND_250 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_249 = _RAND_250[21:0];
  _RAND_251 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_250 = _RAND_251[21:0];
  _RAND_252 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_251 = _RAND_252[21:0];
  _RAND_253 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_252 = _RAND_253[21:0];
  _RAND_254 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_253 = _RAND_254[21:0];
  _RAND_255 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_254 = _RAND_255[21:0];
  _RAND_256 = {1{`RANDOM}};
  btb_bank0_rd_data_way0_out_255 = _RAND_256[21:0];
  _RAND_257 = {1{`RANDOM}};
  dec_tlu_way_wb_f = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_0 = _RAND_258[21:0];
  _RAND_259 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_1 = _RAND_259[21:0];
  _RAND_260 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_2 = _RAND_260[21:0];
  _RAND_261 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_3 = _RAND_261[21:0];
  _RAND_262 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_4 = _RAND_262[21:0];
  _RAND_263 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_5 = _RAND_263[21:0];
  _RAND_264 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_6 = _RAND_264[21:0];
  _RAND_265 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_7 = _RAND_265[21:0];
  _RAND_266 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_8 = _RAND_266[21:0];
  _RAND_267 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_9 = _RAND_267[21:0];
  _RAND_268 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_10 = _RAND_268[21:0];
  _RAND_269 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_11 = _RAND_269[21:0];
  _RAND_270 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_12 = _RAND_270[21:0];
  _RAND_271 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_13 = _RAND_271[21:0];
  _RAND_272 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_14 = _RAND_272[21:0];
  _RAND_273 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_15 = _RAND_273[21:0];
  _RAND_274 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_16 = _RAND_274[21:0];
  _RAND_275 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_17 = _RAND_275[21:0];
  _RAND_276 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_18 = _RAND_276[21:0];
  _RAND_277 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_19 = _RAND_277[21:0];
  _RAND_278 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_20 = _RAND_278[21:0];
  _RAND_279 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_21 = _RAND_279[21:0];
  _RAND_280 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_22 = _RAND_280[21:0];
  _RAND_281 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_23 = _RAND_281[21:0];
  _RAND_282 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_24 = _RAND_282[21:0];
  _RAND_283 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_25 = _RAND_283[21:0];
  _RAND_284 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_26 = _RAND_284[21:0];
  _RAND_285 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_27 = _RAND_285[21:0];
  _RAND_286 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_28 = _RAND_286[21:0];
  _RAND_287 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_29 = _RAND_287[21:0];
  _RAND_288 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_30 = _RAND_288[21:0];
  _RAND_289 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_31 = _RAND_289[21:0];
  _RAND_290 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_32 = _RAND_290[21:0];
  _RAND_291 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_33 = _RAND_291[21:0];
  _RAND_292 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_34 = _RAND_292[21:0];
  _RAND_293 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_35 = _RAND_293[21:0];
  _RAND_294 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_36 = _RAND_294[21:0];
  _RAND_295 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_37 = _RAND_295[21:0];
  _RAND_296 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_38 = _RAND_296[21:0];
  _RAND_297 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_39 = _RAND_297[21:0];
  _RAND_298 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_40 = _RAND_298[21:0];
  _RAND_299 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_41 = _RAND_299[21:0];
  _RAND_300 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_42 = _RAND_300[21:0];
  _RAND_301 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_43 = _RAND_301[21:0];
  _RAND_302 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_44 = _RAND_302[21:0];
  _RAND_303 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_45 = _RAND_303[21:0];
  _RAND_304 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_46 = _RAND_304[21:0];
  _RAND_305 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_47 = _RAND_305[21:0];
  _RAND_306 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_48 = _RAND_306[21:0];
  _RAND_307 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_49 = _RAND_307[21:0];
  _RAND_308 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_50 = _RAND_308[21:0];
  _RAND_309 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_51 = _RAND_309[21:0];
  _RAND_310 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_52 = _RAND_310[21:0];
  _RAND_311 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_53 = _RAND_311[21:0];
  _RAND_312 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_54 = _RAND_312[21:0];
  _RAND_313 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_55 = _RAND_313[21:0];
  _RAND_314 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_56 = _RAND_314[21:0];
  _RAND_315 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_57 = _RAND_315[21:0];
  _RAND_316 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_58 = _RAND_316[21:0];
  _RAND_317 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_59 = _RAND_317[21:0];
  _RAND_318 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_60 = _RAND_318[21:0];
  _RAND_319 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_61 = _RAND_319[21:0];
  _RAND_320 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_62 = _RAND_320[21:0];
  _RAND_321 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_63 = _RAND_321[21:0];
  _RAND_322 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_64 = _RAND_322[21:0];
  _RAND_323 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_65 = _RAND_323[21:0];
  _RAND_324 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_66 = _RAND_324[21:0];
  _RAND_325 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_67 = _RAND_325[21:0];
  _RAND_326 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_68 = _RAND_326[21:0];
  _RAND_327 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_69 = _RAND_327[21:0];
  _RAND_328 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_70 = _RAND_328[21:0];
  _RAND_329 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_71 = _RAND_329[21:0];
  _RAND_330 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_72 = _RAND_330[21:0];
  _RAND_331 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_73 = _RAND_331[21:0];
  _RAND_332 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_74 = _RAND_332[21:0];
  _RAND_333 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_75 = _RAND_333[21:0];
  _RAND_334 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_76 = _RAND_334[21:0];
  _RAND_335 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_77 = _RAND_335[21:0];
  _RAND_336 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_78 = _RAND_336[21:0];
  _RAND_337 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_79 = _RAND_337[21:0];
  _RAND_338 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_80 = _RAND_338[21:0];
  _RAND_339 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_81 = _RAND_339[21:0];
  _RAND_340 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_82 = _RAND_340[21:0];
  _RAND_341 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_83 = _RAND_341[21:0];
  _RAND_342 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_84 = _RAND_342[21:0];
  _RAND_343 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_85 = _RAND_343[21:0];
  _RAND_344 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_86 = _RAND_344[21:0];
  _RAND_345 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_87 = _RAND_345[21:0];
  _RAND_346 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_88 = _RAND_346[21:0];
  _RAND_347 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_89 = _RAND_347[21:0];
  _RAND_348 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_90 = _RAND_348[21:0];
  _RAND_349 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_91 = _RAND_349[21:0];
  _RAND_350 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_92 = _RAND_350[21:0];
  _RAND_351 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_93 = _RAND_351[21:0];
  _RAND_352 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_94 = _RAND_352[21:0];
  _RAND_353 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_95 = _RAND_353[21:0];
  _RAND_354 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_96 = _RAND_354[21:0];
  _RAND_355 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_97 = _RAND_355[21:0];
  _RAND_356 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_98 = _RAND_356[21:0];
  _RAND_357 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_99 = _RAND_357[21:0];
  _RAND_358 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_100 = _RAND_358[21:0];
  _RAND_359 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_101 = _RAND_359[21:0];
  _RAND_360 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_102 = _RAND_360[21:0];
  _RAND_361 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_103 = _RAND_361[21:0];
  _RAND_362 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_104 = _RAND_362[21:0];
  _RAND_363 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_105 = _RAND_363[21:0];
  _RAND_364 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_106 = _RAND_364[21:0];
  _RAND_365 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_107 = _RAND_365[21:0];
  _RAND_366 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_108 = _RAND_366[21:0];
  _RAND_367 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_109 = _RAND_367[21:0];
  _RAND_368 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_110 = _RAND_368[21:0];
  _RAND_369 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_111 = _RAND_369[21:0];
  _RAND_370 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_112 = _RAND_370[21:0];
  _RAND_371 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_113 = _RAND_371[21:0];
  _RAND_372 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_114 = _RAND_372[21:0];
  _RAND_373 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_115 = _RAND_373[21:0];
  _RAND_374 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_116 = _RAND_374[21:0];
  _RAND_375 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_117 = _RAND_375[21:0];
  _RAND_376 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_118 = _RAND_376[21:0];
  _RAND_377 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_119 = _RAND_377[21:0];
  _RAND_378 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_120 = _RAND_378[21:0];
  _RAND_379 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_121 = _RAND_379[21:0];
  _RAND_380 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_122 = _RAND_380[21:0];
  _RAND_381 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_123 = _RAND_381[21:0];
  _RAND_382 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_124 = _RAND_382[21:0];
  _RAND_383 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_125 = _RAND_383[21:0];
  _RAND_384 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_126 = _RAND_384[21:0];
  _RAND_385 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_127 = _RAND_385[21:0];
  _RAND_386 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_128 = _RAND_386[21:0];
  _RAND_387 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_129 = _RAND_387[21:0];
  _RAND_388 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_130 = _RAND_388[21:0];
  _RAND_389 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_131 = _RAND_389[21:0];
  _RAND_390 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_132 = _RAND_390[21:0];
  _RAND_391 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_133 = _RAND_391[21:0];
  _RAND_392 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_134 = _RAND_392[21:0];
  _RAND_393 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_135 = _RAND_393[21:0];
  _RAND_394 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_136 = _RAND_394[21:0];
  _RAND_395 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_137 = _RAND_395[21:0];
  _RAND_396 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_138 = _RAND_396[21:0];
  _RAND_397 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_139 = _RAND_397[21:0];
  _RAND_398 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_140 = _RAND_398[21:0];
  _RAND_399 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_141 = _RAND_399[21:0];
  _RAND_400 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_142 = _RAND_400[21:0];
  _RAND_401 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_143 = _RAND_401[21:0];
  _RAND_402 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_144 = _RAND_402[21:0];
  _RAND_403 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_145 = _RAND_403[21:0];
  _RAND_404 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_146 = _RAND_404[21:0];
  _RAND_405 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_147 = _RAND_405[21:0];
  _RAND_406 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_148 = _RAND_406[21:0];
  _RAND_407 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_149 = _RAND_407[21:0];
  _RAND_408 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_150 = _RAND_408[21:0];
  _RAND_409 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_151 = _RAND_409[21:0];
  _RAND_410 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_152 = _RAND_410[21:0];
  _RAND_411 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_153 = _RAND_411[21:0];
  _RAND_412 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_154 = _RAND_412[21:0];
  _RAND_413 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_155 = _RAND_413[21:0];
  _RAND_414 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_156 = _RAND_414[21:0];
  _RAND_415 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_157 = _RAND_415[21:0];
  _RAND_416 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_158 = _RAND_416[21:0];
  _RAND_417 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_159 = _RAND_417[21:0];
  _RAND_418 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_160 = _RAND_418[21:0];
  _RAND_419 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_161 = _RAND_419[21:0];
  _RAND_420 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_162 = _RAND_420[21:0];
  _RAND_421 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_163 = _RAND_421[21:0];
  _RAND_422 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_164 = _RAND_422[21:0];
  _RAND_423 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_165 = _RAND_423[21:0];
  _RAND_424 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_166 = _RAND_424[21:0];
  _RAND_425 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_167 = _RAND_425[21:0];
  _RAND_426 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_168 = _RAND_426[21:0];
  _RAND_427 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_169 = _RAND_427[21:0];
  _RAND_428 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_170 = _RAND_428[21:0];
  _RAND_429 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_171 = _RAND_429[21:0];
  _RAND_430 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_172 = _RAND_430[21:0];
  _RAND_431 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_173 = _RAND_431[21:0];
  _RAND_432 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_174 = _RAND_432[21:0];
  _RAND_433 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_175 = _RAND_433[21:0];
  _RAND_434 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_176 = _RAND_434[21:0];
  _RAND_435 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_177 = _RAND_435[21:0];
  _RAND_436 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_178 = _RAND_436[21:0];
  _RAND_437 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_179 = _RAND_437[21:0];
  _RAND_438 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_180 = _RAND_438[21:0];
  _RAND_439 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_181 = _RAND_439[21:0];
  _RAND_440 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_182 = _RAND_440[21:0];
  _RAND_441 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_183 = _RAND_441[21:0];
  _RAND_442 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_184 = _RAND_442[21:0];
  _RAND_443 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_185 = _RAND_443[21:0];
  _RAND_444 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_186 = _RAND_444[21:0];
  _RAND_445 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_187 = _RAND_445[21:0];
  _RAND_446 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_188 = _RAND_446[21:0];
  _RAND_447 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_189 = _RAND_447[21:0];
  _RAND_448 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_190 = _RAND_448[21:0];
  _RAND_449 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_191 = _RAND_449[21:0];
  _RAND_450 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_192 = _RAND_450[21:0];
  _RAND_451 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_193 = _RAND_451[21:0];
  _RAND_452 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_194 = _RAND_452[21:0];
  _RAND_453 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_195 = _RAND_453[21:0];
  _RAND_454 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_196 = _RAND_454[21:0];
  _RAND_455 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_197 = _RAND_455[21:0];
  _RAND_456 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_198 = _RAND_456[21:0];
  _RAND_457 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_199 = _RAND_457[21:0];
  _RAND_458 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_200 = _RAND_458[21:0];
  _RAND_459 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_201 = _RAND_459[21:0];
  _RAND_460 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_202 = _RAND_460[21:0];
  _RAND_461 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_203 = _RAND_461[21:0];
  _RAND_462 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_204 = _RAND_462[21:0];
  _RAND_463 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_205 = _RAND_463[21:0];
  _RAND_464 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_206 = _RAND_464[21:0];
  _RAND_465 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_207 = _RAND_465[21:0];
  _RAND_466 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_208 = _RAND_466[21:0];
  _RAND_467 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_209 = _RAND_467[21:0];
  _RAND_468 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_210 = _RAND_468[21:0];
  _RAND_469 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_211 = _RAND_469[21:0];
  _RAND_470 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_212 = _RAND_470[21:0];
  _RAND_471 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_213 = _RAND_471[21:0];
  _RAND_472 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_214 = _RAND_472[21:0];
  _RAND_473 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_215 = _RAND_473[21:0];
  _RAND_474 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_216 = _RAND_474[21:0];
  _RAND_475 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_217 = _RAND_475[21:0];
  _RAND_476 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_218 = _RAND_476[21:0];
  _RAND_477 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_219 = _RAND_477[21:0];
  _RAND_478 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_220 = _RAND_478[21:0];
  _RAND_479 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_221 = _RAND_479[21:0];
  _RAND_480 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_222 = _RAND_480[21:0];
  _RAND_481 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_223 = _RAND_481[21:0];
  _RAND_482 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_224 = _RAND_482[21:0];
  _RAND_483 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_225 = _RAND_483[21:0];
  _RAND_484 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_226 = _RAND_484[21:0];
  _RAND_485 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_227 = _RAND_485[21:0];
  _RAND_486 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_228 = _RAND_486[21:0];
  _RAND_487 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_229 = _RAND_487[21:0];
  _RAND_488 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_230 = _RAND_488[21:0];
  _RAND_489 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_231 = _RAND_489[21:0];
  _RAND_490 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_232 = _RAND_490[21:0];
  _RAND_491 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_233 = _RAND_491[21:0];
  _RAND_492 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_234 = _RAND_492[21:0];
  _RAND_493 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_235 = _RAND_493[21:0];
  _RAND_494 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_236 = _RAND_494[21:0];
  _RAND_495 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_237 = _RAND_495[21:0];
  _RAND_496 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_238 = _RAND_496[21:0];
  _RAND_497 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_239 = _RAND_497[21:0];
  _RAND_498 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_240 = _RAND_498[21:0];
  _RAND_499 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_241 = _RAND_499[21:0];
  _RAND_500 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_242 = _RAND_500[21:0];
  _RAND_501 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_243 = _RAND_501[21:0];
  _RAND_502 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_244 = _RAND_502[21:0];
  _RAND_503 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_245 = _RAND_503[21:0];
  _RAND_504 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_246 = _RAND_504[21:0];
  _RAND_505 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_247 = _RAND_505[21:0];
  _RAND_506 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_248 = _RAND_506[21:0];
  _RAND_507 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_249 = _RAND_507[21:0];
  _RAND_508 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_250 = _RAND_508[21:0];
  _RAND_509 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_251 = _RAND_509[21:0];
  _RAND_510 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_252 = _RAND_510[21:0];
  _RAND_511 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_253 = _RAND_511[21:0];
  _RAND_512 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_254 = _RAND_512[21:0];
  _RAND_513 = {1{`RANDOM}};
  btb_bank0_rd_data_way1_out_255 = _RAND_513[21:0];
  _RAND_514 = {1{`RANDOM}};
  fghr = _RAND_514[7:0];
  _RAND_515 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_0 = _RAND_515[1:0];
  _RAND_516 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_1 = _RAND_516[1:0];
  _RAND_517 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_2 = _RAND_517[1:0];
  _RAND_518 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_3 = _RAND_518[1:0];
  _RAND_519 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_4 = _RAND_519[1:0];
  _RAND_520 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_5 = _RAND_520[1:0];
  _RAND_521 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_6 = _RAND_521[1:0];
  _RAND_522 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_7 = _RAND_522[1:0];
  _RAND_523 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_8 = _RAND_523[1:0];
  _RAND_524 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_9 = _RAND_524[1:0];
  _RAND_525 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_10 = _RAND_525[1:0];
  _RAND_526 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_11 = _RAND_526[1:0];
  _RAND_527 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_12 = _RAND_527[1:0];
  _RAND_528 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_13 = _RAND_528[1:0];
  _RAND_529 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_14 = _RAND_529[1:0];
  _RAND_530 = {1{`RANDOM}};
  bht_bank_rd_data_out_1_15 = _RAND_530[1:0];
  _RAND_531 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_0 = _RAND_531[1:0];
  _RAND_532 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_1 = _RAND_532[1:0];
  _RAND_533 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_2 = _RAND_533[1:0];
  _RAND_534 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_3 = _RAND_534[1:0];
  _RAND_535 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_4 = _RAND_535[1:0];
  _RAND_536 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_5 = _RAND_536[1:0];
  _RAND_537 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_6 = _RAND_537[1:0];
  _RAND_538 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_7 = _RAND_538[1:0];
  _RAND_539 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_8 = _RAND_539[1:0];
  _RAND_540 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_9 = _RAND_540[1:0];
  _RAND_541 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_10 = _RAND_541[1:0];
  _RAND_542 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_11 = _RAND_542[1:0];
  _RAND_543 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_12 = _RAND_543[1:0];
  _RAND_544 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_13 = _RAND_544[1:0];
  _RAND_545 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_14 = _RAND_545[1:0];
  _RAND_546 = {1{`RANDOM}};
  bht_bank_rd_data_out_0_15 = _RAND_546[1:0];
  _RAND_547 = {1{`RANDOM}};
  exu_mp_way_f = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  exu_flush_final_d1 = _RAND_548[0:0];
  _RAND_549 = {8{`RANDOM}};
  btb_lru_b0_f = _RAND_549[255:0];
  _RAND_550 = {1{`RANDOM}};
  ifc_fetch_adder_prior = _RAND_550[30:0];
  _RAND_551 = {1{`RANDOM}};
  rets_out_0 = _RAND_551[31:0];
  _RAND_552 = {1{`RANDOM}};
  rets_out_1 = _RAND_552[31:0];
  _RAND_553 = {1{`RANDOM}};
  rets_out_2 = _RAND_553[31:0];
  _RAND_554 = {1{`RANDOM}};
  rets_out_3 = _RAND_554[31:0];
  _RAND_555 = {1{`RANDOM}};
  rets_out_4 = _RAND_555[31:0];
  _RAND_556 = {1{`RANDOM}};
  rets_out_5 = _RAND_556[31:0];
  _RAND_557 = {1{`RANDOM}};
  rets_out_6 = _RAND_557[31:0];
  _RAND_558 = {1{`RANDOM}};
  rets_out_7 = _RAND_558[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      leak_one_f_d1 <= 1'h0;
    end else begin
      leak_one_f_d1 <= leak_one_f;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_0 <= 22'h0;
    end else if (_T_575) begin
      btb_bank0_rd_data_way0_out_0 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_1 <= 22'h0;
    end else if (_T_578) begin
      btb_bank0_rd_data_way0_out_1 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_2 <= 22'h0;
    end else if (_T_581) begin
      btb_bank0_rd_data_way0_out_2 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_3 <= 22'h0;
    end else if (_T_584) begin
      btb_bank0_rd_data_way0_out_3 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_4 <= 22'h0;
    end else if (_T_587) begin
      btb_bank0_rd_data_way0_out_4 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_5 <= 22'h0;
    end else if (_T_590) begin
      btb_bank0_rd_data_way0_out_5 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_6 <= 22'h0;
    end else if (_T_593) begin
      btb_bank0_rd_data_way0_out_6 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_7 <= 22'h0;
    end else if (_T_596) begin
      btb_bank0_rd_data_way0_out_7 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_8 <= 22'h0;
    end else if (_T_599) begin
      btb_bank0_rd_data_way0_out_8 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_9 <= 22'h0;
    end else if (_T_602) begin
      btb_bank0_rd_data_way0_out_9 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_10 <= 22'h0;
    end else if (_T_605) begin
      btb_bank0_rd_data_way0_out_10 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_11 <= 22'h0;
    end else if (_T_608) begin
      btb_bank0_rd_data_way0_out_11 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_12 <= 22'h0;
    end else if (_T_611) begin
      btb_bank0_rd_data_way0_out_12 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_13 <= 22'h0;
    end else if (_T_614) begin
      btb_bank0_rd_data_way0_out_13 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_14 <= 22'h0;
    end else if (_T_617) begin
      btb_bank0_rd_data_way0_out_14 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_15 <= 22'h0;
    end else if (_T_620) begin
      btb_bank0_rd_data_way0_out_15 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_16 <= 22'h0;
    end else if (_T_623) begin
      btb_bank0_rd_data_way0_out_16 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_17 <= 22'h0;
    end else if (_T_626) begin
      btb_bank0_rd_data_way0_out_17 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_18 <= 22'h0;
    end else if (_T_629) begin
      btb_bank0_rd_data_way0_out_18 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_19 <= 22'h0;
    end else if (_T_632) begin
      btb_bank0_rd_data_way0_out_19 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_20 <= 22'h0;
    end else if (_T_635) begin
      btb_bank0_rd_data_way0_out_20 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_21 <= 22'h0;
    end else if (_T_638) begin
      btb_bank0_rd_data_way0_out_21 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_22 <= 22'h0;
    end else if (_T_641) begin
      btb_bank0_rd_data_way0_out_22 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_23 <= 22'h0;
    end else if (_T_644) begin
      btb_bank0_rd_data_way0_out_23 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_24 <= 22'h0;
    end else if (_T_647) begin
      btb_bank0_rd_data_way0_out_24 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_25 <= 22'h0;
    end else if (_T_650) begin
      btb_bank0_rd_data_way0_out_25 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_26 <= 22'h0;
    end else if (_T_653) begin
      btb_bank0_rd_data_way0_out_26 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_27 <= 22'h0;
    end else if (_T_656) begin
      btb_bank0_rd_data_way0_out_27 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_28 <= 22'h0;
    end else if (_T_659) begin
      btb_bank0_rd_data_way0_out_28 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_29 <= 22'h0;
    end else if (_T_662) begin
      btb_bank0_rd_data_way0_out_29 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_30 <= 22'h0;
    end else if (_T_665) begin
      btb_bank0_rd_data_way0_out_30 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_31 <= 22'h0;
    end else if (_T_668) begin
      btb_bank0_rd_data_way0_out_31 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_32 <= 22'h0;
    end else if (_T_671) begin
      btb_bank0_rd_data_way0_out_32 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_33 <= 22'h0;
    end else if (_T_674) begin
      btb_bank0_rd_data_way0_out_33 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_34 <= 22'h0;
    end else if (_T_677) begin
      btb_bank0_rd_data_way0_out_34 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_35 <= 22'h0;
    end else if (_T_680) begin
      btb_bank0_rd_data_way0_out_35 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_36 <= 22'h0;
    end else if (_T_683) begin
      btb_bank0_rd_data_way0_out_36 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_37 <= 22'h0;
    end else if (_T_686) begin
      btb_bank0_rd_data_way0_out_37 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_38 <= 22'h0;
    end else if (_T_689) begin
      btb_bank0_rd_data_way0_out_38 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_39 <= 22'h0;
    end else if (_T_692) begin
      btb_bank0_rd_data_way0_out_39 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_40 <= 22'h0;
    end else if (_T_695) begin
      btb_bank0_rd_data_way0_out_40 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_41 <= 22'h0;
    end else if (_T_698) begin
      btb_bank0_rd_data_way0_out_41 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_42 <= 22'h0;
    end else if (_T_701) begin
      btb_bank0_rd_data_way0_out_42 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_43 <= 22'h0;
    end else if (_T_704) begin
      btb_bank0_rd_data_way0_out_43 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_44 <= 22'h0;
    end else if (_T_707) begin
      btb_bank0_rd_data_way0_out_44 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_45 <= 22'h0;
    end else if (_T_710) begin
      btb_bank0_rd_data_way0_out_45 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_46 <= 22'h0;
    end else if (_T_713) begin
      btb_bank0_rd_data_way0_out_46 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_47 <= 22'h0;
    end else if (_T_716) begin
      btb_bank0_rd_data_way0_out_47 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_48 <= 22'h0;
    end else if (_T_719) begin
      btb_bank0_rd_data_way0_out_48 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_49 <= 22'h0;
    end else if (_T_722) begin
      btb_bank0_rd_data_way0_out_49 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_50 <= 22'h0;
    end else if (_T_725) begin
      btb_bank0_rd_data_way0_out_50 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_51 <= 22'h0;
    end else if (_T_728) begin
      btb_bank0_rd_data_way0_out_51 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_52 <= 22'h0;
    end else if (_T_731) begin
      btb_bank0_rd_data_way0_out_52 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_53 <= 22'h0;
    end else if (_T_734) begin
      btb_bank0_rd_data_way0_out_53 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_54 <= 22'h0;
    end else if (_T_737) begin
      btb_bank0_rd_data_way0_out_54 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_55 <= 22'h0;
    end else if (_T_740) begin
      btb_bank0_rd_data_way0_out_55 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_56 <= 22'h0;
    end else if (_T_743) begin
      btb_bank0_rd_data_way0_out_56 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_57 <= 22'h0;
    end else if (_T_746) begin
      btb_bank0_rd_data_way0_out_57 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_58 <= 22'h0;
    end else if (_T_749) begin
      btb_bank0_rd_data_way0_out_58 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_59 <= 22'h0;
    end else if (_T_752) begin
      btb_bank0_rd_data_way0_out_59 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_60 <= 22'h0;
    end else if (_T_755) begin
      btb_bank0_rd_data_way0_out_60 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_61 <= 22'h0;
    end else if (_T_758) begin
      btb_bank0_rd_data_way0_out_61 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_62 <= 22'h0;
    end else if (_T_761) begin
      btb_bank0_rd_data_way0_out_62 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_63 <= 22'h0;
    end else if (_T_764) begin
      btb_bank0_rd_data_way0_out_63 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_64 <= 22'h0;
    end else if (_T_767) begin
      btb_bank0_rd_data_way0_out_64 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_65 <= 22'h0;
    end else if (_T_770) begin
      btb_bank0_rd_data_way0_out_65 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_66 <= 22'h0;
    end else if (_T_773) begin
      btb_bank0_rd_data_way0_out_66 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_67 <= 22'h0;
    end else if (_T_776) begin
      btb_bank0_rd_data_way0_out_67 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_68 <= 22'h0;
    end else if (_T_779) begin
      btb_bank0_rd_data_way0_out_68 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_69 <= 22'h0;
    end else if (_T_782) begin
      btb_bank0_rd_data_way0_out_69 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_70 <= 22'h0;
    end else if (_T_785) begin
      btb_bank0_rd_data_way0_out_70 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_71 <= 22'h0;
    end else if (_T_788) begin
      btb_bank0_rd_data_way0_out_71 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_72 <= 22'h0;
    end else if (_T_791) begin
      btb_bank0_rd_data_way0_out_72 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_73 <= 22'h0;
    end else if (_T_794) begin
      btb_bank0_rd_data_way0_out_73 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_74 <= 22'h0;
    end else if (_T_797) begin
      btb_bank0_rd_data_way0_out_74 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_75 <= 22'h0;
    end else if (_T_800) begin
      btb_bank0_rd_data_way0_out_75 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_76 <= 22'h0;
    end else if (_T_803) begin
      btb_bank0_rd_data_way0_out_76 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_77 <= 22'h0;
    end else if (_T_806) begin
      btb_bank0_rd_data_way0_out_77 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_78 <= 22'h0;
    end else if (_T_809) begin
      btb_bank0_rd_data_way0_out_78 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_79 <= 22'h0;
    end else if (_T_812) begin
      btb_bank0_rd_data_way0_out_79 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_80 <= 22'h0;
    end else if (_T_815) begin
      btb_bank0_rd_data_way0_out_80 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_81 <= 22'h0;
    end else if (_T_818) begin
      btb_bank0_rd_data_way0_out_81 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_82 <= 22'h0;
    end else if (_T_821) begin
      btb_bank0_rd_data_way0_out_82 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_83 <= 22'h0;
    end else if (_T_824) begin
      btb_bank0_rd_data_way0_out_83 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_84 <= 22'h0;
    end else if (_T_827) begin
      btb_bank0_rd_data_way0_out_84 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_85 <= 22'h0;
    end else if (_T_830) begin
      btb_bank0_rd_data_way0_out_85 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_86 <= 22'h0;
    end else if (_T_833) begin
      btb_bank0_rd_data_way0_out_86 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_87 <= 22'h0;
    end else if (_T_836) begin
      btb_bank0_rd_data_way0_out_87 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_88 <= 22'h0;
    end else if (_T_839) begin
      btb_bank0_rd_data_way0_out_88 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_89 <= 22'h0;
    end else if (_T_842) begin
      btb_bank0_rd_data_way0_out_89 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_90 <= 22'h0;
    end else if (_T_845) begin
      btb_bank0_rd_data_way0_out_90 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_91 <= 22'h0;
    end else if (_T_848) begin
      btb_bank0_rd_data_way0_out_91 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_92 <= 22'h0;
    end else if (_T_851) begin
      btb_bank0_rd_data_way0_out_92 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_93 <= 22'h0;
    end else if (_T_854) begin
      btb_bank0_rd_data_way0_out_93 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_94 <= 22'h0;
    end else if (_T_857) begin
      btb_bank0_rd_data_way0_out_94 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_95 <= 22'h0;
    end else if (_T_860) begin
      btb_bank0_rd_data_way0_out_95 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_96 <= 22'h0;
    end else if (_T_863) begin
      btb_bank0_rd_data_way0_out_96 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_97 <= 22'h0;
    end else if (_T_866) begin
      btb_bank0_rd_data_way0_out_97 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_98 <= 22'h0;
    end else if (_T_869) begin
      btb_bank0_rd_data_way0_out_98 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_99 <= 22'h0;
    end else if (_T_872) begin
      btb_bank0_rd_data_way0_out_99 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_100 <= 22'h0;
    end else if (_T_875) begin
      btb_bank0_rd_data_way0_out_100 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_101 <= 22'h0;
    end else if (_T_878) begin
      btb_bank0_rd_data_way0_out_101 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_102 <= 22'h0;
    end else if (_T_881) begin
      btb_bank0_rd_data_way0_out_102 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_103 <= 22'h0;
    end else if (_T_884) begin
      btb_bank0_rd_data_way0_out_103 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_104 <= 22'h0;
    end else if (_T_887) begin
      btb_bank0_rd_data_way0_out_104 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_105 <= 22'h0;
    end else if (_T_890) begin
      btb_bank0_rd_data_way0_out_105 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_106 <= 22'h0;
    end else if (_T_893) begin
      btb_bank0_rd_data_way0_out_106 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_107 <= 22'h0;
    end else if (_T_896) begin
      btb_bank0_rd_data_way0_out_107 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_108 <= 22'h0;
    end else if (_T_899) begin
      btb_bank0_rd_data_way0_out_108 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_109 <= 22'h0;
    end else if (_T_902) begin
      btb_bank0_rd_data_way0_out_109 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_110 <= 22'h0;
    end else if (_T_905) begin
      btb_bank0_rd_data_way0_out_110 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_111 <= 22'h0;
    end else if (_T_908) begin
      btb_bank0_rd_data_way0_out_111 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_112 <= 22'h0;
    end else if (_T_911) begin
      btb_bank0_rd_data_way0_out_112 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_113 <= 22'h0;
    end else if (_T_914) begin
      btb_bank0_rd_data_way0_out_113 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_114 <= 22'h0;
    end else if (_T_917) begin
      btb_bank0_rd_data_way0_out_114 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_115 <= 22'h0;
    end else if (_T_920) begin
      btb_bank0_rd_data_way0_out_115 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_116 <= 22'h0;
    end else if (_T_923) begin
      btb_bank0_rd_data_way0_out_116 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_117 <= 22'h0;
    end else if (_T_926) begin
      btb_bank0_rd_data_way0_out_117 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_118 <= 22'h0;
    end else if (_T_929) begin
      btb_bank0_rd_data_way0_out_118 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_119 <= 22'h0;
    end else if (_T_932) begin
      btb_bank0_rd_data_way0_out_119 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_120 <= 22'h0;
    end else if (_T_935) begin
      btb_bank0_rd_data_way0_out_120 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_121 <= 22'h0;
    end else if (_T_938) begin
      btb_bank0_rd_data_way0_out_121 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_122 <= 22'h0;
    end else if (_T_941) begin
      btb_bank0_rd_data_way0_out_122 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_123 <= 22'h0;
    end else if (_T_944) begin
      btb_bank0_rd_data_way0_out_123 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_124 <= 22'h0;
    end else if (_T_947) begin
      btb_bank0_rd_data_way0_out_124 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_125 <= 22'h0;
    end else if (_T_950) begin
      btb_bank0_rd_data_way0_out_125 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_126 <= 22'h0;
    end else if (_T_953) begin
      btb_bank0_rd_data_way0_out_126 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_127 <= 22'h0;
    end else if (_T_956) begin
      btb_bank0_rd_data_way0_out_127 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_128 <= 22'h0;
    end else if (_T_959) begin
      btb_bank0_rd_data_way0_out_128 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_129 <= 22'h0;
    end else if (_T_962) begin
      btb_bank0_rd_data_way0_out_129 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_130 <= 22'h0;
    end else if (_T_965) begin
      btb_bank0_rd_data_way0_out_130 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_131 <= 22'h0;
    end else if (_T_968) begin
      btb_bank0_rd_data_way0_out_131 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_132 <= 22'h0;
    end else if (_T_971) begin
      btb_bank0_rd_data_way0_out_132 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_133 <= 22'h0;
    end else if (_T_974) begin
      btb_bank0_rd_data_way0_out_133 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_134 <= 22'h0;
    end else if (_T_977) begin
      btb_bank0_rd_data_way0_out_134 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_135 <= 22'h0;
    end else if (_T_980) begin
      btb_bank0_rd_data_way0_out_135 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_136 <= 22'h0;
    end else if (_T_983) begin
      btb_bank0_rd_data_way0_out_136 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_137 <= 22'h0;
    end else if (_T_986) begin
      btb_bank0_rd_data_way0_out_137 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_138 <= 22'h0;
    end else if (_T_989) begin
      btb_bank0_rd_data_way0_out_138 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_139 <= 22'h0;
    end else if (_T_992) begin
      btb_bank0_rd_data_way0_out_139 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_140 <= 22'h0;
    end else if (_T_995) begin
      btb_bank0_rd_data_way0_out_140 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_141 <= 22'h0;
    end else if (_T_998) begin
      btb_bank0_rd_data_way0_out_141 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_142 <= 22'h0;
    end else if (_T_1001) begin
      btb_bank0_rd_data_way0_out_142 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_143 <= 22'h0;
    end else if (_T_1004) begin
      btb_bank0_rd_data_way0_out_143 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_144 <= 22'h0;
    end else if (_T_1007) begin
      btb_bank0_rd_data_way0_out_144 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_145 <= 22'h0;
    end else if (_T_1010) begin
      btb_bank0_rd_data_way0_out_145 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_146 <= 22'h0;
    end else if (_T_1013) begin
      btb_bank0_rd_data_way0_out_146 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_147 <= 22'h0;
    end else if (_T_1016) begin
      btb_bank0_rd_data_way0_out_147 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_148 <= 22'h0;
    end else if (_T_1019) begin
      btb_bank0_rd_data_way0_out_148 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_149 <= 22'h0;
    end else if (_T_1022) begin
      btb_bank0_rd_data_way0_out_149 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_150 <= 22'h0;
    end else if (_T_1025) begin
      btb_bank0_rd_data_way0_out_150 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_151 <= 22'h0;
    end else if (_T_1028) begin
      btb_bank0_rd_data_way0_out_151 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_152 <= 22'h0;
    end else if (_T_1031) begin
      btb_bank0_rd_data_way0_out_152 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_153 <= 22'h0;
    end else if (_T_1034) begin
      btb_bank0_rd_data_way0_out_153 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_154 <= 22'h0;
    end else if (_T_1037) begin
      btb_bank0_rd_data_way0_out_154 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_155 <= 22'h0;
    end else if (_T_1040) begin
      btb_bank0_rd_data_way0_out_155 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_156 <= 22'h0;
    end else if (_T_1043) begin
      btb_bank0_rd_data_way0_out_156 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_157 <= 22'h0;
    end else if (_T_1046) begin
      btb_bank0_rd_data_way0_out_157 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_158 <= 22'h0;
    end else if (_T_1049) begin
      btb_bank0_rd_data_way0_out_158 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_159 <= 22'h0;
    end else if (_T_1052) begin
      btb_bank0_rd_data_way0_out_159 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_160 <= 22'h0;
    end else if (_T_1055) begin
      btb_bank0_rd_data_way0_out_160 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_161 <= 22'h0;
    end else if (_T_1058) begin
      btb_bank0_rd_data_way0_out_161 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_162 <= 22'h0;
    end else if (_T_1061) begin
      btb_bank0_rd_data_way0_out_162 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_163 <= 22'h0;
    end else if (_T_1064) begin
      btb_bank0_rd_data_way0_out_163 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_164 <= 22'h0;
    end else if (_T_1067) begin
      btb_bank0_rd_data_way0_out_164 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_165 <= 22'h0;
    end else if (_T_1070) begin
      btb_bank0_rd_data_way0_out_165 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_166 <= 22'h0;
    end else if (_T_1073) begin
      btb_bank0_rd_data_way0_out_166 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_167 <= 22'h0;
    end else if (_T_1076) begin
      btb_bank0_rd_data_way0_out_167 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_168 <= 22'h0;
    end else if (_T_1079) begin
      btb_bank0_rd_data_way0_out_168 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_169 <= 22'h0;
    end else if (_T_1082) begin
      btb_bank0_rd_data_way0_out_169 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_170 <= 22'h0;
    end else if (_T_1085) begin
      btb_bank0_rd_data_way0_out_170 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_171 <= 22'h0;
    end else if (_T_1088) begin
      btb_bank0_rd_data_way0_out_171 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_172 <= 22'h0;
    end else if (_T_1091) begin
      btb_bank0_rd_data_way0_out_172 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_173 <= 22'h0;
    end else if (_T_1094) begin
      btb_bank0_rd_data_way0_out_173 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_174 <= 22'h0;
    end else if (_T_1097) begin
      btb_bank0_rd_data_way0_out_174 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_175 <= 22'h0;
    end else if (_T_1100) begin
      btb_bank0_rd_data_way0_out_175 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_176 <= 22'h0;
    end else if (_T_1103) begin
      btb_bank0_rd_data_way0_out_176 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_177 <= 22'h0;
    end else if (_T_1106) begin
      btb_bank0_rd_data_way0_out_177 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_178 <= 22'h0;
    end else if (_T_1109) begin
      btb_bank0_rd_data_way0_out_178 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_179 <= 22'h0;
    end else if (_T_1112) begin
      btb_bank0_rd_data_way0_out_179 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_180 <= 22'h0;
    end else if (_T_1115) begin
      btb_bank0_rd_data_way0_out_180 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_181 <= 22'h0;
    end else if (_T_1118) begin
      btb_bank0_rd_data_way0_out_181 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_182 <= 22'h0;
    end else if (_T_1121) begin
      btb_bank0_rd_data_way0_out_182 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_183 <= 22'h0;
    end else if (_T_1124) begin
      btb_bank0_rd_data_way0_out_183 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_184 <= 22'h0;
    end else if (_T_1127) begin
      btb_bank0_rd_data_way0_out_184 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_185 <= 22'h0;
    end else if (_T_1130) begin
      btb_bank0_rd_data_way0_out_185 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_186 <= 22'h0;
    end else if (_T_1133) begin
      btb_bank0_rd_data_way0_out_186 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_187 <= 22'h0;
    end else if (_T_1136) begin
      btb_bank0_rd_data_way0_out_187 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_188 <= 22'h0;
    end else if (_T_1139) begin
      btb_bank0_rd_data_way0_out_188 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_189 <= 22'h0;
    end else if (_T_1142) begin
      btb_bank0_rd_data_way0_out_189 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_190 <= 22'h0;
    end else if (_T_1145) begin
      btb_bank0_rd_data_way0_out_190 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_191 <= 22'h0;
    end else if (_T_1148) begin
      btb_bank0_rd_data_way0_out_191 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_192 <= 22'h0;
    end else if (_T_1151) begin
      btb_bank0_rd_data_way0_out_192 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_193 <= 22'h0;
    end else if (_T_1154) begin
      btb_bank0_rd_data_way0_out_193 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_194 <= 22'h0;
    end else if (_T_1157) begin
      btb_bank0_rd_data_way0_out_194 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_195 <= 22'h0;
    end else if (_T_1160) begin
      btb_bank0_rd_data_way0_out_195 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_196 <= 22'h0;
    end else if (_T_1163) begin
      btb_bank0_rd_data_way0_out_196 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_197 <= 22'h0;
    end else if (_T_1166) begin
      btb_bank0_rd_data_way0_out_197 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_198 <= 22'h0;
    end else if (_T_1169) begin
      btb_bank0_rd_data_way0_out_198 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_199 <= 22'h0;
    end else if (_T_1172) begin
      btb_bank0_rd_data_way0_out_199 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_200 <= 22'h0;
    end else if (_T_1175) begin
      btb_bank0_rd_data_way0_out_200 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_201 <= 22'h0;
    end else if (_T_1178) begin
      btb_bank0_rd_data_way0_out_201 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_202 <= 22'h0;
    end else if (_T_1181) begin
      btb_bank0_rd_data_way0_out_202 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_203 <= 22'h0;
    end else if (_T_1184) begin
      btb_bank0_rd_data_way0_out_203 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_204 <= 22'h0;
    end else if (_T_1187) begin
      btb_bank0_rd_data_way0_out_204 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_205 <= 22'h0;
    end else if (_T_1190) begin
      btb_bank0_rd_data_way0_out_205 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_206 <= 22'h0;
    end else if (_T_1193) begin
      btb_bank0_rd_data_way0_out_206 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_207 <= 22'h0;
    end else if (_T_1196) begin
      btb_bank0_rd_data_way0_out_207 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_208 <= 22'h0;
    end else if (_T_1199) begin
      btb_bank0_rd_data_way0_out_208 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_209 <= 22'h0;
    end else if (_T_1202) begin
      btb_bank0_rd_data_way0_out_209 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_210 <= 22'h0;
    end else if (_T_1205) begin
      btb_bank0_rd_data_way0_out_210 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_211 <= 22'h0;
    end else if (_T_1208) begin
      btb_bank0_rd_data_way0_out_211 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_212 <= 22'h0;
    end else if (_T_1211) begin
      btb_bank0_rd_data_way0_out_212 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_213 <= 22'h0;
    end else if (_T_1214) begin
      btb_bank0_rd_data_way0_out_213 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_214 <= 22'h0;
    end else if (_T_1217) begin
      btb_bank0_rd_data_way0_out_214 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_215 <= 22'h0;
    end else if (_T_1220) begin
      btb_bank0_rd_data_way0_out_215 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_216 <= 22'h0;
    end else if (_T_1223) begin
      btb_bank0_rd_data_way0_out_216 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_217 <= 22'h0;
    end else if (_T_1226) begin
      btb_bank0_rd_data_way0_out_217 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_218 <= 22'h0;
    end else if (_T_1229) begin
      btb_bank0_rd_data_way0_out_218 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_219 <= 22'h0;
    end else if (_T_1232) begin
      btb_bank0_rd_data_way0_out_219 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_220 <= 22'h0;
    end else if (_T_1235) begin
      btb_bank0_rd_data_way0_out_220 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_221 <= 22'h0;
    end else if (_T_1238) begin
      btb_bank0_rd_data_way0_out_221 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_222 <= 22'h0;
    end else if (_T_1241) begin
      btb_bank0_rd_data_way0_out_222 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_223 <= 22'h0;
    end else if (_T_1244) begin
      btb_bank0_rd_data_way0_out_223 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_224 <= 22'h0;
    end else if (_T_1247) begin
      btb_bank0_rd_data_way0_out_224 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_225 <= 22'h0;
    end else if (_T_1250) begin
      btb_bank0_rd_data_way0_out_225 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_226 <= 22'h0;
    end else if (_T_1253) begin
      btb_bank0_rd_data_way0_out_226 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_227 <= 22'h0;
    end else if (_T_1256) begin
      btb_bank0_rd_data_way0_out_227 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_228 <= 22'h0;
    end else if (_T_1259) begin
      btb_bank0_rd_data_way0_out_228 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_229 <= 22'h0;
    end else if (_T_1262) begin
      btb_bank0_rd_data_way0_out_229 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_230 <= 22'h0;
    end else if (_T_1265) begin
      btb_bank0_rd_data_way0_out_230 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_231 <= 22'h0;
    end else if (_T_1268) begin
      btb_bank0_rd_data_way0_out_231 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_232 <= 22'h0;
    end else if (_T_1271) begin
      btb_bank0_rd_data_way0_out_232 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_233 <= 22'h0;
    end else if (_T_1274) begin
      btb_bank0_rd_data_way0_out_233 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_234 <= 22'h0;
    end else if (_T_1277) begin
      btb_bank0_rd_data_way0_out_234 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_235 <= 22'h0;
    end else if (_T_1280) begin
      btb_bank0_rd_data_way0_out_235 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_236 <= 22'h0;
    end else if (_T_1283) begin
      btb_bank0_rd_data_way0_out_236 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_237 <= 22'h0;
    end else if (_T_1286) begin
      btb_bank0_rd_data_way0_out_237 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_238 <= 22'h0;
    end else if (_T_1289) begin
      btb_bank0_rd_data_way0_out_238 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_239 <= 22'h0;
    end else if (_T_1292) begin
      btb_bank0_rd_data_way0_out_239 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_240 <= 22'h0;
    end else if (_T_1295) begin
      btb_bank0_rd_data_way0_out_240 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_241 <= 22'h0;
    end else if (_T_1298) begin
      btb_bank0_rd_data_way0_out_241 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_242 <= 22'h0;
    end else if (_T_1301) begin
      btb_bank0_rd_data_way0_out_242 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_243 <= 22'h0;
    end else if (_T_1304) begin
      btb_bank0_rd_data_way0_out_243 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_244 <= 22'h0;
    end else if (_T_1307) begin
      btb_bank0_rd_data_way0_out_244 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_245 <= 22'h0;
    end else if (_T_1310) begin
      btb_bank0_rd_data_way0_out_245 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_246 <= 22'h0;
    end else if (_T_1313) begin
      btb_bank0_rd_data_way0_out_246 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_247 <= 22'h0;
    end else if (_T_1316) begin
      btb_bank0_rd_data_way0_out_247 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_248 <= 22'h0;
    end else if (_T_1319) begin
      btb_bank0_rd_data_way0_out_248 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_249 <= 22'h0;
    end else if (_T_1322) begin
      btb_bank0_rd_data_way0_out_249 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_250 <= 22'h0;
    end else if (_T_1325) begin
      btb_bank0_rd_data_way0_out_250 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_251 <= 22'h0;
    end else if (_T_1328) begin
      btb_bank0_rd_data_way0_out_251 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_252 <= 22'h0;
    end else if (_T_1331) begin
      btb_bank0_rd_data_way0_out_252 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_253 <= 22'h0;
    end else if (_T_1334) begin
      btb_bank0_rd_data_way0_out_253 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_254 <= 22'h0;
    end else if (_T_1337) begin
      btb_bank0_rd_data_way0_out_254 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way0_out_255 <= 22'h0;
    end else if (_T_1340) begin
      btb_bank0_rd_data_way0_out_255 <= btb_wr_data;
    end
    if (reset) begin
      dec_tlu_way_wb_f <= 1'h0;
    end else begin
      dec_tlu_way_wb_f <= io_dec_tlu_br0_r_pkt_way;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_0 <= 22'h0;
    end else if (_T_1343) begin
      btb_bank0_rd_data_way1_out_0 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_1 <= 22'h0;
    end else if (_T_1346) begin
      btb_bank0_rd_data_way1_out_1 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_2 <= 22'h0;
    end else if (_T_1349) begin
      btb_bank0_rd_data_way1_out_2 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_3 <= 22'h0;
    end else if (_T_1352) begin
      btb_bank0_rd_data_way1_out_3 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_4 <= 22'h0;
    end else if (_T_1355) begin
      btb_bank0_rd_data_way1_out_4 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_5 <= 22'h0;
    end else if (_T_1358) begin
      btb_bank0_rd_data_way1_out_5 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_6 <= 22'h0;
    end else if (_T_1361) begin
      btb_bank0_rd_data_way1_out_6 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_7 <= 22'h0;
    end else if (_T_1364) begin
      btb_bank0_rd_data_way1_out_7 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_8 <= 22'h0;
    end else if (_T_1367) begin
      btb_bank0_rd_data_way1_out_8 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_9 <= 22'h0;
    end else if (_T_1370) begin
      btb_bank0_rd_data_way1_out_9 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_10 <= 22'h0;
    end else if (_T_1373) begin
      btb_bank0_rd_data_way1_out_10 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_11 <= 22'h0;
    end else if (_T_1376) begin
      btb_bank0_rd_data_way1_out_11 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_12 <= 22'h0;
    end else if (_T_1379) begin
      btb_bank0_rd_data_way1_out_12 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_13 <= 22'h0;
    end else if (_T_1382) begin
      btb_bank0_rd_data_way1_out_13 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_14 <= 22'h0;
    end else if (_T_1385) begin
      btb_bank0_rd_data_way1_out_14 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_15 <= 22'h0;
    end else if (_T_1388) begin
      btb_bank0_rd_data_way1_out_15 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_16 <= 22'h0;
    end else if (_T_1391) begin
      btb_bank0_rd_data_way1_out_16 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_17 <= 22'h0;
    end else if (_T_1394) begin
      btb_bank0_rd_data_way1_out_17 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_18 <= 22'h0;
    end else if (_T_1397) begin
      btb_bank0_rd_data_way1_out_18 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_19 <= 22'h0;
    end else if (_T_1400) begin
      btb_bank0_rd_data_way1_out_19 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_20 <= 22'h0;
    end else if (_T_1403) begin
      btb_bank0_rd_data_way1_out_20 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_21 <= 22'h0;
    end else if (_T_1406) begin
      btb_bank0_rd_data_way1_out_21 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_22 <= 22'h0;
    end else if (_T_1409) begin
      btb_bank0_rd_data_way1_out_22 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_23 <= 22'h0;
    end else if (_T_1412) begin
      btb_bank0_rd_data_way1_out_23 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_24 <= 22'h0;
    end else if (_T_1415) begin
      btb_bank0_rd_data_way1_out_24 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_25 <= 22'h0;
    end else if (_T_1418) begin
      btb_bank0_rd_data_way1_out_25 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_26 <= 22'h0;
    end else if (_T_1421) begin
      btb_bank0_rd_data_way1_out_26 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_27 <= 22'h0;
    end else if (_T_1424) begin
      btb_bank0_rd_data_way1_out_27 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_28 <= 22'h0;
    end else if (_T_1427) begin
      btb_bank0_rd_data_way1_out_28 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_29 <= 22'h0;
    end else if (_T_1430) begin
      btb_bank0_rd_data_way1_out_29 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_30 <= 22'h0;
    end else if (_T_1433) begin
      btb_bank0_rd_data_way1_out_30 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_31 <= 22'h0;
    end else if (_T_1436) begin
      btb_bank0_rd_data_way1_out_31 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_32 <= 22'h0;
    end else if (_T_1439) begin
      btb_bank0_rd_data_way1_out_32 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_33 <= 22'h0;
    end else if (_T_1442) begin
      btb_bank0_rd_data_way1_out_33 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_34 <= 22'h0;
    end else if (_T_1445) begin
      btb_bank0_rd_data_way1_out_34 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_35 <= 22'h0;
    end else if (_T_1448) begin
      btb_bank0_rd_data_way1_out_35 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_36 <= 22'h0;
    end else if (_T_1451) begin
      btb_bank0_rd_data_way1_out_36 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_37 <= 22'h0;
    end else if (_T_1454) begin
      btb_bank0_rd_data_way1_out_37 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_38 <= 22'h0;
    end else if (_T_1457) begin
      btb_bank0_rd_data_way1_out_38 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_39 <= 22'h0;
    end else if (_T_1460) begin
      btb_bank0_rd_data_way1_out_39 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_40 <= 22'h0;
    end else if (_T_1463) begin
      btb_bank0_rd_data_way1_out_40 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_41 <= 22'h0;
    end else if (_T_1466) begin
      btb_bank0_rd_data_way1_out_41 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_42 <= 22'h0;
    end else if (_T_1469) begin
      btb_bank0_rd_data_way1_out_42 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_43 <= 22'h0;
    end else if (_T_1472) begin
      btb_bank0_rd_data_way1_out_43 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_44 <= 22'h0;
    end else if (_T_1475) begin
      btb_bank0_rd_data_way1_out_44 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_45 <= 22'h0;
    end else if (_T_1478) begin
      btb_bank0_rd_data_way1_out_45 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_46 <= 22'h0;
    end else if (_T_1481) begin
      btb_bank0_rd_data_way1_out_46 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_47 <= 22'h0;
    end else if (_T_1484) begin
      btb_bank0_rd_data_way1_out_47 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_48 <= 22'h0;
    end else if (_T_1487) begin
      btb_bank0_rd_data_way1_out_48 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_49 <= 22'h0;
    end else if (_T_1490) begin
      btb_bank0_rd_data_way1_out_49 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_50 <= 22'h0;
    end else if (_T_1493) begin
      btb_bank0_rd_data_way1_out_50 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_51 <= 22'h0;
    end else if (_T_1496) begin
      btb_bank0_rd_data_way1_out_51 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_52 <= 22'h0;
    end else if (_T_1499) begin
      btb_bank0_rd_data_way1_out_52 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_53 <= 22'h0;
    end else if (_T_1502) begin
      btb_bank0_rd_data_way1_out_53 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_54 <= 22'h0;
    end else if (_T_1505) begin
      btb_bank0_rd_data_way1_out_54 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_55 <= 22'h0;
    end else if (_T_1508) begin
      btb_bank0_rd_data_way1_out_55 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_56 <= 22'h0;
    end else if (_T_1511) begin
      btb_bank0_rd_data_way1_out_56 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_57 <= 22'h0;
    end else if (_T_1514) begin
      btb_bank0_rd_data_way1_out_57 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_58 <= 22'h0;
    end else if (_T_1517) begin
      btb_bank0_rd_data_way1_out_58 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_59 <= 22'h0;
    end else if (_T_1520) begin
      btb_bank0_rd_data_way1_out_59 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_60 <= 22'h0;
    end else if (_T_1523) begin
      btb_bank0_rd_data_way1_out_60 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_61 <= 22'h0;
    end else if (_T_1526) begin
      btb_bank0_rd_data_way1_out_61 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_62 <= 22'h0;
    end else if (_T_1529) begin
      btb_bank0_rd_data_way1_out_62 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_63 <= 22'h0;
    end else if (_T_1532) begin
      btb_bank0_rd_data_way1_out_63 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_64 <= 22'h0;
    end else if (_T_1535) begin
      btb_bank0_rd_data_way1_out_64 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_65 <= 22'h0;
    end else if (_T_1538) begin
      btb_bank0_rd_data_way1_out_65 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_66 <= 22'h0;
    end else if (_T_1541) begin
      btb_bank0_rd_data_way1_out_66 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_67 <= 22'h0;
    end else if (_T_1544) begin
      btb_bank0_rd_data_way1_out_67 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_68 <= 22'h0;
    end else if (_T_1547) begin
      btb_bank0_rd_data_way1_out_68 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_69 <= 22'h0;
    end else if (_T_1550) begin
      btb_bank0_rd_data_way1_out_69 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_70 <= 22'h0;
    end else if (_T_1553) begin
      btb_bank0_rd_data_way1_out_70 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_71 <= 22'h0;
    end else if (_T_1556) begin
      btb_bank0_rd_data_way1_out_71 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_72 <= 22'h0;
    end else if (_T_1559) begin
      btb_bank0_rd_data_way1_out_72 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_73 <= 22'h0;
    end else if (_T_1562) begin
      btb_bank0_rd_data_way1_out_73 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_74 <= 22'h0;
    end else if (_T_1565) begin
      btb_bank0_rd_data_way1_out_74 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_75 <= 22'h0;
    end else if (_T_1568) begin
      btb_bank0_rd_data_way1_out_75 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_76 <= 22'h0;
    end else if (_T_1571) begin
      btb_bank0_rd_data_way1_out_76 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_77 <= 22'h0;
    end else if (_T_1574) begin
      btb_bank0_rd_data_way1_out_77 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_78 <= 22'h0;
    end else if (_T_1577) begin
      btb_bank0_rd_data_way1_out_78 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_79 <= 22'h0;
    end else if (_T_1580) begin
      btb_bank0_rd_data_way1_out_79 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_80 <= 22'h0;
    end else if (_T_1583) begin
      btb_bank0_rd_data_way1_out_80 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_81 <= 22'h0;
    end else if (_T_1586) begin
      btb_bank0_rd_data_way1_out_81 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_82 <= 22'h0;
    end else if (_T_1589) begin
      btb_bank0_rd_data_way1_out_82 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_83 <= 22'h0;
    end else if (_T_1592) begin
      btb_bank0_rd_data_way1_out_83 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_84 <= 22'h0;
    end else if (_T_1595) begin
      btb_bank0_rd_data_way1_out_84 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_85 <= 22'h0;
    end else if (_T_1598) begin
      btb_bank0_rd_data_way1_out_85 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_86 <= 22'h0;
    end else if (_T_1601) begin
      btb_bank0_rd_data_way1_out_86 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_87 <= 22'h0;
    end else if (_T_1604) begin
      btb_bank0_rd_data_way1_out_87 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_88 <= 22'h0;
    end else if (_T_1607) begin
      btb_bank0_rd_data_way1_out_88 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_89 <= 22'h0;
    end else if (_T_1610) begin
      btb_bank0_rd_data_way1_out_89 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_90 <= 22'h0;
    end else if (_T_1613) begin
      btb_bank0_rd_data_way1_out_90 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_91 <= 22'h0;
    end else if (_T_1616) begin
      btb_bank0_rd_data_way1_out_91 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_92 <= 22'h0;
    end else if (_T_1619) begin
      btb_bank0_rd_data_way1_out_92 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_93 <= 22'h0;
    end else if (_T_1622) begin
      btb_bank0_rd_data_way1_out_93 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_94 <= 22'h0;
    end else if (_T_1625) begin
      btb_bank0_rd_data_way1_out_94 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_95 <= 22'h0;
    end else if (_T_1628) begin
      btb_bank0_rd_data_way1_out_95 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_96 <= 22'h0;
    end else if (_T_1631) begin
      btb_bank0_rd_data_way1_out_96 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_97 <= 22'h0;
    end else if (_T_1634) begin
      btb_bank0_rd_data_way1_out_97 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_98 <= 22'h0;
    end else if (_T_1637) begin
      btb_bank0_rd_data_way1_out_98 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_99 <= 22'h0;
    end else if (_T_1640) begin
      btb_bank0_rd_data_way1_out_99 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_100 <= 22'h0;
    end else if (_T_1643) begin
      btb_bank0_rd_data_way1_out_100 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_101 <= 22'h0;
    end else if (_T_1646) begin
      btb_bank0_rd_data_way1_out_101 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_102 <= 22'h0;
    end else if (_T_1649) begin
      btb_bank0_rd_data_way1_out_102 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_103 <= 22'h0;
    end else if (_T_1652) begin
      btb_bank0_rd_data_way1_out_103 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_104 <= 22'h0;
    end else if (_T_1655) begin
      btb_bank0_rd_data_way1_out_104 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_105 <= 22'h0;
    end else if (_T_1658) begin
      btb_bank0_rd_data_way1_out_105 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_106 <= 22'h0;
    end else if (_T_1661) begin
      btb_bank0_rd_data_way1_out_106 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_107 <= 22'h0;
    end else if (_T_1664) begin
      btb_bank0_rd_data_way1_out_107 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_108 <= 22'h0;
    end else if (_T_1667) begin
      btb_bank0_rd_data_way1_out_108 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_109 <= 22'h0;
    end else if (_T_1670) begin
      btb_bank0_rd_data_way1_out_109 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_110 <= 22'h0;
    end else if (_T_1673) begin
      btb_bank0_rd_data_way1_out_110 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_111 <= 22'h0;
    end else if (_T_1676) begin
      btb_bank0_rd_data_way1_out_111 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_112 <= 22'h0;
    end else if (_T_1679) begin
      btb_bank0_rd_data_way1_out_112 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_113 <= 22'h0;
    end else if (_T_1682) begin
      btb_bank0_rd_data_way1_out_113 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_114 <= 22'h0;
    end else if (_T_1685) begin
      btb_bank0_rd_data_way1_out_114 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_115 <= 22'h0;
    end else if (_T_1688) begin
      btb_bank0_rd_data_way1_out_115 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_116 <= 22'h0;
    end else if (_T_1691) begin
      btb_bank0_rd_data_way1_out_116 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_117 <= 22'h0;
    end else if (_T_1694) begin
      btb_bank0_rd_data_way1_out_117 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_118 <= 22'h0;
    end else if (_T_1697) begin
      btb_bank0_rd_data_way1_out_118 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_119 <= 22'h0;
    end else if (_T_1700) begin
      btb_bank0_rd_data_way1_out_119 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_120 <= 22'h0;
    end else if (_T_1703) begin
      btb_bank0_rd_data_way1_out_120 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_121 <= 22'h0;
    end else if (_T_1706) begin
      btb_bank0_rd_data_way1_out_121 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_122 <= 22'h0;
    end else if (_T_1709) begin
      btb_bank0_rd_data_way1_out_122 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_123 <= 22'h0;
    end else if (_T_1712) begin
      btb_bank0_rd_data_way1_out_123 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_124 <= 22'h0;
    end else if (_T_1715) begin
      btb_bank0_rd_data_way1_out_124 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_125 <= 22'h0;
    end else if (_T_1718) begin
      btb_bank0_rd_data_way1_out_125 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_126 <= 22'h0;
    end else if (_T_1721) begin
      btb_bank0_rd_data_way1_out_126 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_127 <= 22'h0;
    end else if (_T_1724) begin
      btb_bank0_rd_data_way1_out_127 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_128 <= 22'h0;
    end else if (_T_1727) begin
      btb_bank0_rd_data_way1_out_128 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_129 <= 22'h0;
    end else if (_T_1730) begin
      btb_bank0_rd_data_way1_out_129 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_130 <= 22'h0;
    end else if (_T_1733) begin
      btb_bank0_rd_data_way1_out_130 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_131 <= 22'h0;
    end else if (_T_1736) begin
      btb_bank0_rd_data_way1_out_131 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_132 <= 22'h0;
    end else if (_T_1739) begin
      btb_bank0_rd_data_way1_out_132 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_133 <= 22'h0;
    end else if (_T_1742) begin
      btb_bank0_rd_data_way1_out_133 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_134 <= 22'h0;
    end else if (_T_1745) begin
      btb_bank0_rd_data_way1_out_134 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_135 <= 22'h0;
    end else if (_T_1748) begin
      btb_bank0_rd_data_way1_out_135 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_136 <= 22'h0;
    end else if (_T_1751) begin
      btb_bank0_rd_data_way1_out_136 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_137 <= 22'h0;
    end else if (_T_1754) begin
      btb_bank0_rd_data_way1_out_137 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_138 <= 22'h0;
    end else if (_T_1757) begin
      btb_bank0_rd_data_way1_out_138 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_139 <= 22'h0;
    end else if (_T_1760) begin
      btb_bank0_rd_data_way1_out_139 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_140 <= 22'h0;
    end else if (_T_1763) begin
      btb_bank0_rd_data_way1_out_140 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_141 <= 22'h0;
    end else if (_T_1766) begin
      btb_bank0_rd_data_way1_out_141 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_142 <= 22'h0;
    end else if (_T_1769) begin
      btb_bank0_rd_data_way1_out_142 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_143 <= 22'h0;
    end else if (_T_1772) begin
      btb_bank0_rd_data_way1_out_143 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_144 <= 22'h0;
    end else if (_T_1775) begin
      btb_bank0_rd_data_way1_out_144 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_145 <= 22'h0;
    end else if (_T_1778) begin
      btb_bank0_rd_data_way1_out_145 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_146 <= 22'h0;
    end else if (_T_1781) begin
      btb_bank0_rd_data_way1_out_146 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_147 <= 22'h0;
    end else if (_T_1784) begin
      btb_bank0_rd_data_way1_out_147 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_148 <= 22'h0;
    end else if (_T_1787) begin
      btb_bank0_rd_data_way1_out_148 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_149 <= 22'h0;
    end else if (_T_1790) begin
      btb_bank0_rd_data_way1_out_149 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_150 <= 22'h0;
    end else if (_T_1793) begin
      btb_bank0_rd_data_way1_out_150 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_151 <= 22'h0;
    end else if (_T_1796) begin
      btb_bank0_rd_data_way1_out_151 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_152 <= 22'h0;
    end else if (_T_1799) begin
      btb_bank0_rd_data_way1_out_152 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_153 <= 22'h0;
    end else if (_T_1802) begin
      btb_bank0_rd_data_way1_out_153 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_154 <= 22'h0;
    end else if (_T_1805) begin
      btb_bank0_rd_data_way1_out_154 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_155 <= 22'h0;
    end else if (_T_1808) begin
      btb_bank0_rd_data_way1_out_155 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_156 <= 22'h0;
    end else if (_T_1811) begin
      btb_bank0_rd_data_way1_out_156 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_157 <= 22'h0;
    end else if (_T_1814) begin
      btb_bank0_rd_data_way1_out_157 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_158 <= 22'h0;
    end else if (_T_1817) begin
      btb_bank0_rd_data_way1_out_158 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_159 <= 22'h0;
    end else if (_T_1820) begin
      btb_bank0_rd_data_way1_out_159 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_160 <= 22'h0;
    end else if (_T_1823) begin
      btb_bank0_rd_data_way1_out_160 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_161 <= 22'h0;
    end else if (_T_1826) begin
      btb_bank0_rd_data_way1_out_161 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_162 <= 22'h0;
    end else if (_T_1829) begin
      btb_bank0_rd_data_way1_out_162 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_163 <= 22'h0;
    end else if (_T_1832) begin
      btb_bank0_rd_data_way1_out_163 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_164 <= 22'h0;
    end else if (_T_1835) begin
      btb_bank0_rd_data_way1_out_164 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_165 <= 22'h0;
    end else if (_T_1838) begin
      btb_bank0_rd_data_way1_out_165 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_166 <= 22'h0;
    end else if (_T_1841) begin
      btb_bank0_rd_data_way1_out_166 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_167 <= 22'h0;
    end else if (_T_1844) begin
      btb_bank0_rd_data_way1_out_167 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_168 <= 22'h0;
    end else if (_T_1847) begin
      btb_bank0_rd_data_way1_out_168 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_169 <= 22'h0;
    end else if (_T_1850) begin
      btb_bank0_rd_data_way1_out_169 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_170 <= 22'h0;
    end else if (_T_1853) begin
      btb_bank0_rd_data_way1_out_170 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_171 <= 22'h0;
    end else if (_T_1856) begin
      btb_bank0_rd_data_way1_out_171 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_172 <= 22'h0;
    end else if (_T_1859) begin
      btb_bank0_rd_data_way1_out_172 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_173 <= 22'h0;
    end else if (_T_1862) begin
      btb_bank0_rd_data_way1_out_173 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_174 <= 22'h0;
    end else if (_T_1865) begin
      btb_bank0_rd_data_way1_out_174 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_175 <= 22'h0;
    end else if (_T_1868) begin
      btb_bank0_rd_data_way1_out_175 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_176 <= 22'h0;
    end else if (_T_1871) begin
      btb_bank0_rd_data_way1_out_176 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_177 <= 22'h0;
    end else if (_T_1874) begin
      btb_bank0_rd_data_way1_out_177 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_178 <= 22'h0;
    end else if (_T_1877) begin
      btb_bank0_rd_data_way1_out_178 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_179 <= 22'h0;
    end else if (_T_1880) begin
      btb_bank0_rd_data_way1_out_179 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_180 <= 22'h0;
    end else if (_T_1883) begin
      btb_bank0_rd_data_way1_out_180 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_181 <= 22'h0;
    end else if (_T_1886) begin
      btb_bank0_rd_data_way1_out_181 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_182 <= 22'h0;
    end else if (_T_1889) begin
      btb_bank0_rd_data_way1_out_182 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_183 <= 22'h0;
    end else if (_T_1892) begin
      btb_bank0_rd_data_way1_out_183 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_184 <= 22'h0;
    end else if (_T_1895) begin
      btb_bank0_rd_data_way1_out_184 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_185 <= 22'h0;
    end else if (_T_1898) begin
      btb_bank0_rd_data_way1_out_185 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_186 <= 22'h0;
    end else if (_T_1901) begin
      btb_bank0_rd_data_way1_out_186 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_187 <= 22'h0;
    end else if (_T_1904) begin
      btb_bank0_rd_data_way1_out_187 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_188 <= 22'h0;
    end else if (_T_1907) begin
      btb_bank0_rd_data_way1_out_188 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_189 <= 22'h0;
    end else if (_T_1910) begin
      btb_bank0_rd_data_way1_out_189 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_190 <= 22'h0;
    end else if (_T_1913) begin
      btb_bank0_rd_data_way1_out_190 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_191 <= 22'h0;
    end else if (_T_1916) begin
      btb_bank0_rd_data_way1_out_191 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_192 <= 22'h0;
    end else if (_T_1919) begin
      btb_bank0_rd_data_way1_out_192 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_193 <= 22'h0;
    end else if (_T_1922) begin
      btb_bank0_rd_data_way1_out_193 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_194 <= 22'h0;
    end else if (_T_1925) begin
      btb_bank0_rd_data_way1_out_194 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_195 <= 22'h0;
    end else if (_T_1928) begin
      btb_bank0_rd_data_way1_out_195 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_196 <= 22'h0;
    end else if (_T_1931) begin
      btb_bank0_rd_data_way1_out_196 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_197 <= 22'h0;
    end else if (_T_1934) begin
      btb_bank0_rd_data_way1_out_197 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_198 <= 22'h0;
    end else if (_T_1937) begin
      btb_bank0_rd_data_way1_out_198 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_199 <= 22'h0;
    end else if (_T_1940) begin
      btb_bank0_rd_data_way1_out_199 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_200 <= 22'h0;
    end else if (_T_1943) begin
      btb_bank0_rd_data_way1_out_200 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_201 <= 22'h0;
    end else if (_T_1946) begin
      btb_bank0_rd_data_way1_out_201 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_202 <= 22'h0;
    end else if (_T_1949) begin
      btb_bank0_rd_data_way1_out_202 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_203 <= 22'h0;
    end else if (_T_1952) begin
      btb_bank0_rd_data_way1_out_203 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_204 <= 22'h0;
    end else if (_T_1955) begin
      btb_bank0_rd_data_way1_out_204 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_205 <= 22'h0;
    end else if (_T_1958) begin
      btb_bank0_rd_data_way1_out_205 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_206 <= 22'h0;
    end else if (_T_1961) begin
      btb_bank0_rd_data_way1_out_206 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_207 <= 22'h0;
    end else if (_T_1964) begin
      btb_bank0_rd_data_way1_out_207 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_208 <= 22'h0;
    end else if (_T_1967) begin
      btb_bank0_rd_data_way1_out_208 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_209 <= 22'h0;
    end else if (_T_1970) begin
      btb_bank0_rd_data_way1_out_209 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_210 <= 22'h0;
    end else if (_T_1973) begin
      btb_bank0_rd_data_way1_out_210 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_211 <= 22'h0;
    end else if (_T_1976) begin
      btb_bank0_rd_data_way1_out_211 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_212 <= 22'h0;
    end else if (_T_1979) begin
      btb_bank0_rd_data_way1_out_212 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_213 <= 22'h0;
    end else if (_T_1982) begin
      btb_bank0_rd_data_way1_out_213 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_214 <= 22'h0;
    end else if (_T_1985) begin
      btb_bank0_rd_data_way1_out_214 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_215 <= 22'h0;
    end else if (_T_1988) begin
      btb_bank0_rd_data_way1_out_215 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_216 <= 22'h0;
    end else if (_T_1991) begin
      btb_bank0_rd_data_way1_out_216 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_217 <= 22'h0;
    end else if (_T_1994) begin
      btb_bank0_rd_data_way1_out_217 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_218 <= 22'h0;
    end else if (_T_1997) begin
      btb_bank0_rd_data_way1_out_218 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_219 <= 22'h0;
    end else if (_T_2000) begin
      btb_bank0_rd_data_way1_out_219 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_220 <= 22'h0;
    end else if (_T_2003) begin
      btb_bank0_rd_data_way1_out_220 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_221 <= 22'h0;
    end else if (_T_2006) begin
      btb_bank0_rd_data_way1_out_221 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_222 <= 22'h0;
    end else if (_T_2009) begin
      btb_bank0_rd_data_way1_out_222 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_223 <= 22'h0;
    end else if (_T_2012) begin
      btb_bank0_rd_data_way1_out_223 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_224 <= 22'h0;
    end else if (_T_2015) begin
      btb_bank0_rd_data_way1_out_224 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_225 <= 22'h0;
    end else if (_T_2018) begin
      btb_bank0_rd_data_way1_out_225 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_226 <= 22'h0;
    end else if (_T_2021) begin
      btb_bank0_rd_data_way1_out_226 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_227 <= 22'h0;
    end else if (_T_2024) begin
      btb_bank0_rd_data_way1_out_227 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_228 <= 22'h0;
    end else if (_T_2027) begin
      btb_bank0_rd_data_way1_out_228 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_229 <= 22'h0;
    end else if (_T_2030) begin
      btb_bank0_rd_data_way1_out_229 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_230 <= 22'h0;
    end else if (_T_2033) begin
      btb_bank0_rd_data_way1_out_230 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_231 <= 22'h0;
    end else if (_T_2036) begin
      btb_bank0_rd_data_way1_out_231 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_232 <= 22'h0;
    end else if (_T_2039) begin
      btb_bank0_rd_data_way1_out_232 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_233 <= 22'h0;
    end else if (_T_2042) begin
      btb_bank0_rd_data_way1_out_233 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_234 <= 22'h0;
    end else if (_T_2045) begin
      btb_bank0_rd_data_way1_out_234 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_235 <= 22'h0;
    end else if (_T_2048) begin
      btb_bank0_rd_data_way1_out_235 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_236 <= 22'h0;
    end else if (_T_2051) begin
      btb_bank0_rd_data_way1_out_236 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_237 <= 22'h0;
    end else if (_T_2054) begin
      btb_bank0_rd_data_way1_out_237 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_238 <= 22'h0;
    end else if (_T_2057) begin
      btb_bank0_rd_data_way1_out_238 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_239 <= 22'h0;
    end else if (_T_2060) begin
      btb_bank0_rd_data_way1_out_239 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_240 <= 22'h0;
    end else if (_T_2063) begin
      btb_bank0_rd_data_way1_out_240 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_241 <= 22'h0;
    end else if (_T_2066) begin
      btb_bank0_rd_data_way1_out_241 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_242 <= 22'h0;
    end else if (_T_2069) begin
      btb_bank0_rd_data_way1_out_242 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_243 <= 22'h0;
    end else if (_T_2072) begin
      btb_bank0_rd_data_way1_out_243 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_244 <= 22'h0;
    end else if (_T_2075) begin
      btb_bank0_rd_data_way1_out_244 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_245 <= 22'h0;
    end else if (_T_2078) begin
      btb_bank0_rd_data_way1_out_245 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_246 <= 22'h0;
    end else if (_T_2081) begin
      btb_bank0_rd_data_way1_out_246 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_247 <= 22'h0;
    end else if (_T_2084) begin
      btb_bank0_rd_data_way1_out_247 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_248 <= 22'h0;
    end else if (_T_2087) begin
      btb_bank0_rd_data_way1_out_248 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_249 <= 22'h0;
    end else if (_T_2090) begin
      btb_bank0_rd_data_way1_out_249 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_250 <= 22'h0;
    end else if (_T_2093) begin
      btb_bank0_rd_data_way1_out_250 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_251 <= 22'h0;
    end else if (_T_2096) begin
      btb_bank0_rd_data_way1_out_251 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_252 <= 22'h0;
    end else if (_T_2099) begin
      btb_bank0_rd_data_way1_out_252 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_253 <= 22'h0;
    end else if (_T_2102) begin
      btb_bank0_rd_data_way1_out_253 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_254 <= 22'h0;
    end else if (_T_2105) begin
      btb_bank0_rd_data_way1_out_254 <= btb_wr_data;
    end
    if (reset) begin
      btb_bank0_rd_data_way1_out_255 <= 22'h0;
    end else if (_T_2108) begin
      btb_bank0_rd_data_way1_out_255 <= btb_wr_data;
    end
    if (reset) begin
      bht_bank_rd_data_out_1_0 <= 2'h0;
    end else if (_T_19774) begin
      if (_T_8516) begin
        bht_bank_rd_data_out_1_0 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_0 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_1 <= 2'h0;
    end else if (_T_19776) begin
      if (_T_8660) begin
        bht_bank_rd_data_out_1_1 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_1 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_2 <= 2'h0;
    end else if (_T_19778) begin
      if (_T_8804) begin
        bht_bank_rd_data_out_1_2 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_2 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_3 <= 2'h0;
    end else if (_T_19780) begin
      if (_T_8948) begin
        bht_bank_rd_data_out_1_3 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_3 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_4 <= 2'h0;
    end else if (_T_19782) begin
      if (_T_9092) begin
        bht_bank_rd_data_out_1_4 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_4 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_5 <= 2'h0;
    end else if (_T_19784) begin
      if (_T_9236) begin
        bht_bank_rd_data_out_1_5 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_5 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_6 <= 2'h0;
    end else if (_T_19786) begin
      if (_T_9380) begin
        bht_bank_rd_data_out_1_6 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_6 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_7 <= 2'h0;
    end else if (_T_19788) begin
      if (_T_9524) begin
        bht_bank_rd_data_out_1_7 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_7 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_8 <= 2'h0;
    end else if (_T_19790) begin
      if (_T_9668) begin
        bht_bank_rd_data_out_1_8 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_8 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_9 <= 2'h0;
    end else if (_T_19792) begin
      if (_T_9812) begin
        bht_bank_rd_data_out_1_9 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_9 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_10 <= 2'h0;
    end else if (_T_19794) begin
      if (_T_9956) begin
        bht_bank_rd_data_out_1_10 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_10 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_11 <= 2'h0;
    end else if (_T_19796) begin
      if (_T_10100) begin
        bht_bank_rd_data_out_1_11 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_11 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_12 <= 2'h0;
    end else if (_T_19798) begin
      if (_T_10244) begin
        bht_bank_rd_data_out_1_12 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_12 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_13 <= 2'h0;
    end else if (_T_19800) begin
      if (_T_10388) begin
        bht_bank_rd_data_out_1_13 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_13 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_14 <= 2'h0;
    end else if (_T_19802) begin
      if (_T_10532) begin
        bht_bank_rd_data_out_1_14 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_14 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_1_15 <= 2'h0;
    end else if (_T_19804) begin
      if (_T_10676) begin
        bht_bank_rd_data_out_1_15 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_1_15 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_0 <= 2'h0;
    end else if (_T_19262) begin
      if (_T_6212) begin
        bht_bank_rd_data_out_0_0 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_0 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_1 <= 2'h0;
    end else if (_T_19264) begin
      if (_T_6356) begin
        bht_bank_rd_data_out_0_1 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_1 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_2 <= 2'h0;
    end else if (_T_19266) begin
      if (_T_6500) begin
        bht_bank_rd_data_out_0_2 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_2 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_3 <= 2'h0;
    end else if (_T_19268) begin
      if (_T_6644) begin
        bht_bank_rd_data_out_0_3 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_3 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_4 <= 2'h0;
    end else if (_T_19270) begin
      if (_T_6788) begin
        bht_bank_rd_data_out_0_4 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_4 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_5 <= 2'h0;
    end else if (_T_19272) begin
      if (_T_6932) begin
        bht_bank_rd_data_out_0_5 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_5 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_6 <= 2'h0;
    end else if (_T_19274) begin
      if (_T_7076) begin
        bht_bank_rd_data_out_0_6 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_6 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_7 <= 2'h0;
    end else if (_T_19276) begin
      if (_T_7220) begin
        bht_bank_rd_data_out_0_7 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_7 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_8 <= 2'h0;
    end else if (_T_19278) begin
      if (_T_7364) begin
        bht_bank_rd_data_out_0_8 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_8 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_9 <= 2'h0;
    end else if (_T_19280) begin
      if (_T_7508) begin
        bht_bank_rd_data_out_0_9 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_9 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_10 <= 2'h0;
    end else if (_T_19282) begin
      if (_T_7652) begin
        bht_bank_rd_data_out_0_10 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_10 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_11 <= 2'h0;
    end else if (_T_19284) begin
      if (_T_7796) begin
        bht_bank_rd_data_out_0_11 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_11 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_12 <= 2'h0;
    end else if (_T_19286) begin
      if (_T_7940) begin
        bht_bank_rd_data_out_0_12 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_12 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_13 <= 2'h0;
    end else if (_T_19288) begin
      if (_T_8084) begin
        bht_bank_rd_data_out_0_13 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_13 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_14 <= 2'h0;
    end else if (_T_19290) begin
      if (_T_8228) begin
        bht_bank_rd_data_out_0_14 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_14 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      bht_bank_rd_data_out_0_15 <= 2'h0;
    end else if (_T_19292) begin
      if (_T_8372) begin
        bht_bank_rd_data_out_0_15 <= io_dec_tlu_br0_r_pkt_hist;
      end else begin
        bht_bank_rd_data_out_0_15 <= io_exu_mp_pkt_hist;
      end
    end
    if (reset) begin
      exu_mp_way_f <= 1'h0;
    end else begin
      exu_mp_way_f <= io_exu_mp_pkt_way;
    end
    if (reset) begin
      exu_flush_final_d1 <= 1'h0;
    end else begin
      exu_flush_final_d1 <= io_exu_flush_final;
    end
    if (reset) begin
      btb_lru_b0_f <= 256'h0;
    end else if (_T_215) begin
      if (io_exu_mp_pkt_way) begin
        btb_lru_b0_f <= 256'h0;
      end else begin
        btb_lru_b0_f <= _T_186;
      end
    end
    if (reset) begin
      ifc_fetch_adder_prior <= 31'h0;
    end else if (_T_375) begin
      ifc_fetch_adder_prior <= io_ifc_fetch_addr_f;
    end
    if (reset) begin
      rets_out_0 <= 32'h0;
    end else if (rsenable_0) begin
      rets_out_0 <= rets_in_0;
    end
    if (reset) begin
      rets_out_1 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_1 <= rets_in_1;
    end
    if (reset) begin
      rets_out_2 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_2 <= rets_in_2;
    end
    if (reset) begin
      rets_out_3 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_3 <= rets_in_3;
    end
    if (reset) begin
      rets_out_4 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_4 <= rets_in_4;
    end
    if (reset) begin
      rets_out_5 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_5 <= rets_in_5;
    end
    if (reset) begin
      rets_out_6 <= 32'h0;
    end else if (rsenable_1) begin
      rets_out_6 <= rets_in_6;
    end
    if (reset) begin
      rets_out_7 <= 32'h0;
    end else if (rs_push) begin
      rets_out_7 <= rets_out_6;
    end
  end
  always @(posedge io_active_clk) begin
    if (reset) begin
      fghr <= 8'h0;
    end else begin
      fghr <= fghr_ns;
    end
  end
endmodule
