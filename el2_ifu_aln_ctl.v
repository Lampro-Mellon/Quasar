module el2_ifu_compress(
  input  [31:0] io_in,
  output [31:0] io_out_bits,
  output [4:0]  io_out_rd,
  output [4:0]  io_out_rs1,
  output [4:0]  io_out_rs2,
  output [4:0]  io_out_rs3,
  output        io_rvc
);
  wire  _T_3 = |io_in[12:5]; // @[el2_ifu_compress.scala 49:29]
  wire [6:0] _T_4 = _T_3 ? 7'h13 : 7'h1f; // @[el2_ifu_compress.scala 49:20]
  wire [4:0] _T_14 = {2'h1,io_in[4:2]}; // @[Cat.scala 29:58]
  wire [29:0] _T_18 = {io_in[10:7],io_in[12:11],io_in[5],io_in[6],2'h0,5'h2,3'h0,2'h1,io_in[4:2],_T_4}; // @[Cat.scala 29:58]
  wire [7:0] _T_28 = {io_in[6:5],io_in[12:10],3'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_30 = {2'h1,io_in[9:7]}; // @[Cat.scala 29:58]
  wire [27:0] _T_36 = {io_in[6:5],io_in[12:10],3'h0,2'h1,io_in[9:7],3'h3,2'h1,io_in[4:2],7'h7}; // @[Cat.scala 29:58]
  wire [6:0] _T_50 = {io_in[5],io_in[12:10],io_in[6],2'h0}; // @[Cat.scala 29:58]
  wire [26:0] _T_58 = {io_in[5],io_in[12:10],io_in[6],2'h0,2'h1,io_in[9:7],3'h2,2'h1,io_in[4:2],7'h3}; // @[Cat.scala 29:58]
  wire [26:0] _T_80 = {io_in[5],io_in[12:10],io_in[6],2'h0,2'h1,io_in[9:7],3'h2,2'h1,io_in[4:2],7'h7}; // @[Cat.scala 29:58]
  wire [26:0] _T_111 = {_T_50[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_50[4:0],7'h3f}; // @[Cat.scala 29:58]
  wire [27:0] _T_138 = {_T_28[7:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h3,_T_28[4:0],7'h27}; // @[Cat.scala 29:58]
  wire [26:0] _T_169 = {_T_50[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_50[4:0],7'h23}; // @[Cat.scala 29:58]
  wire [26:0] _T_200 = {_T_50[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_50[4:0],7'h27}; // @[Cat.scala 29:58]
  wire [6:0] _T_211 = io_in[12] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_213 = {_T_211,io_in[6:2]}; // @[Cat.scala 29:58]
  wire [31:0] _T_219 = {_T_211,io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h13}; // @[Cat.scala 29:58]
  wire [9:0] _T_228 = io_in[12] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  wire [20:0] _T_243 = {_T_228,io_in[8],io_in[10:9],io_in[6],io_in[7],io_in[2],io_in[11],io_in[5:3],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_306 = {_T_243[20],_T_243[10:1],_T_243[11],_T_243[19:12],5'h1,7'h6f}; // @[Cat.scala 29:58]
  wire [31:0] _T_321 = {_T_211,io_in[6:2],5'h0,3'h0,io_in[11:7],7'h13}; // @[Cat.scala 29:58]
  wire  _T_332 = |_T_213; // @[el2_ifu_compress.scala 86:29]
  wire [6:0] _T_333 = _T_332 ? 7'h37 : 7'h3f; // @[el2_ifu_compress.scala 86:20]
  wire [14:0] _T_336 = io_in[12] ? 15'h7fff : 15'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_339 = {_T_336,io_in[6:2],12'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_343 = {_T_339[31:12],io_in[11:7],_T_333}; // @[Cat.scala 29:58]
  wire  _T_351 = io_in[11:7] == 5'h0; // @[el2_ifu_compress.scala 88:14]
  wire  _T_353 = io_in[11:7] == 5'h2; // @[el2_ifu_compress.scala 88:27]
  wire  _T_354 = _T_351 | _T_353; // @[el2_ifu_compress.scala 88:21]
  wire [6:0] _T_361 = _T_332 ? 7'h13 : 7'h1f; // @[el2_ifu_compress.scala 82:20]
  wire [2:0] _T_364 = io_in[12] ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_379 = {_T_364,io_in[4:3],io_in[5],io_in[2],io_in[6],4'h0,io_in[11:7],3'h0,io_in[11:7],_T_361}; // @[Cat.scala 29:58]
  wire [31:0] _T_386_bits = _T_354 ? _T_379 : _T_343; // @[el2_ifu_compress.scala 88:10]
  wire [4:0] _T_386_rd = _T_354 ? io_in[11:7] : io_in[11:7]; // @[el2_ifu_compress.scala 88:10]
  wire [4:0] _T_386_rs2 = _T_354 ? _T_14 : _T_14; // @[el2_ifu_compress.scala 88:10]
  wire [4:0] _T_386_rs3 = _T_354 ? io_in[31:27] : io_in[31:27]; // @[el2_ifu_compress.scala 88:10]
  wire [25:0] _T_397 = {io_in[12],io_in[6:2],2'h1,io_in[9:7],3'h5,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 29:58]
  wire [30:0] _GEN_172 = {{5'd0}, _T_397}; // @[el2_ifu_compress.scala 95:23]
  wire [30:0] _T_409 = _GEN_172 | 31'h40000000; // @[el2_ifu_compress.scala 95:23]
  wire [31:0] _T_422 = {_T_211,io_in[6:2],2'h1,io_in[9:7],3'h7,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 29:58]
  wire [2:0] _T_426 = {io_in[12],io_in[6:5]}; // @[Cat.scala 29:58]
  wire  _T_428 = io_in[6:5] == 2'h0; // @[el2_ifu_compress.scala 99:30]
  wire [30:0] _T_429 = _T_428 ? 31'h40000000 : 31'h0; // @[el2_ifu_compress.scala 99:22]
  wire [6:0] _T_431 = io_in[12] ? 7'h3b : 7'h33; // @[el2_ifu_compress.scala 100:22]
  wire [2:0] _GEN_1 = 3'h1 == _T_426 ? 3'h4 : 3'h0; // @[Cat.scala 29:58]
  wire [2:0] _GEN_2 = 3'h2 == _T_426 ? 3'h6 : _GEN_1; // @[Cat.scala 29:58]
  wire [2:0] _GEN_3 = 3'h3 == _T_426 ? 3'h7 : _GEN_2; // @[Cat.scala 29:58]
  wire [2:0] _GEN_4 = 3'h4 == _T_426 ? 3'h0 : _GEN_3; // @[Cat.scala 29:58]
  wire [2:0] _GEN_5 = 3'h5 == _T_426 ? 3'h0 : _GEN_4; // @[Cat.scala 29:58]
  wire [2:0] _GEN_6 = 3'h6 == _T_426 ? 3'h2 : _GEN_5; // @[Cat.scala 29:58]
  wire [2:0] _GEN_7 = 3'h7 == _T_426 ? 3'h3 : _GEN_6; // @[Cat.scala 29:58]
  wire [24:0] _T_441 = {2'h1,io_in[4:2],2'h1,io_in[9:7],_GEN_7,2'h1,io_in[9:7],_T_431}; // @[Cat.scala 29:58]
  wire [30:0] _GEN_173 = {{6'd0}, _T_441}; // @[el2_ifu_compress.scala 101:43]
  wire [30:0] _T_442 = _GEN_173 | _T_429; // @[el2_ifu_compress.scala 101:43]
  wire [31:0] _T_443_0 = {{6'd0}, _T_397}; // @[el2_ifu_compress.scala 103:19 el2_ifu_compress.scala 103:19]
  wire [31:0] _T_443_1 = {{1'd0}, _T_409}; // @[el2_ifu_compress.scala 103:19 el2_ifu_compress.scala 103:19]
  wire [31:0] _GEN_9 = 2'h1 == io_in[11:10] ? _T_443_1 : _T_443_0; // @[el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_10 = 2'h2 == io_in[11:10] ? _T_422 : _GEN_9; // @[el2_ifu_compress.scala 18:14]
  wire [31:0] _T_443_3 = {{1'd0}, _T_442}; // @[el2_ifu_compress.scala 103:19 el2_ifu_compress.scala 103:19]
  wire [31:0] _GEN_11 = 2'h3 == io_in[11:10] ? _T_443_3 : _GEN_10; // @[el2_ifu_compress.scala 18:14]
  wire [31:0] _T_533 = {_T_243[20],_T_243[10:1],_T_243[11],_T_243[19:12],5'h0,7'h6f}; // @[Cat.scala 29:58]
  wire [4:0] _T_542 = io_in[12] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [12:0] _T_551 = {_T_542,io_in[6:5],io_in[2],io_in[11:10],io_in[4:3],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_600 = {_T_551[12],_T_551[10:5],5'h0,2'h1,io_in[9:7],3'h0,_T_551[4:1],_T_551[11],7'h63}; // @[Cat.scala 29:58]
  wire [31:0] _T_667 = {_T_551[12],_T_551[10:5],5'h0,2'h1,io_in[9:7],3'h1,_T_551[4:1],_T_551[11],7'h63}; // @[Cat.scala 29:58]
  wire  _T_673 = |io_in[11:7]; // @[el2_ifu_compress.scala 109:27]
  wire [6:0] _T_674 = _T_673 ? 7'h3 : 7'h1f; // @[el2_ifu_compress.scala 109:23]
  wire [25:0] _T_683 = {io_in[12],io_in[6:2],io_in[11:7],3'h1,io_in[11:7],7'h13}; // @[Cat.scala 29:58]
  wire [28:0] _T_699 = {io_in[4:2],io_in[12],io_in[6:5],3'h0,5'h2,3'h3,io_in[11:7],7'h7}; // @[Cat.scala 29:58]
  wire [27:0] _T_714 = {io_in[3:2],io_in[12],io_in[6:4],2'h0,5'h2,3'h2,io_in[11:7],_T_674}; // @[Cat.scala 29:58]
  wire [27:0] _T_729 = {io_in[3:2],io_in[12],io_in[6:4],2'h0,5'h2,3'h2,io_in[11:7],7'h7}; // @[Cat.scala 29:58]
  wire [24:0] _T_739 = {io_in[6:2],5'h0,3'h0,io_in[11:7],7'h33}; // @[Cat.scala 29:58]
  wire [24:0] _T_750 = {io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h33}; // @[Cat.scala 29:58]
  wire [24:0] _T_761 = {io_in[6:2],io_in[11:7],3'h0,12'h67}; // @[Cat.scala 29:58]
  wire [24:0] _T_763 = {_T_761[24:7],7'h1f}; // @[Cat.scala 29:58]
  wire [24:0] _T_766 = _T_673 ? _T_761 : _T_763; // @[el2_ifu_compress.scala 130:33]
  wire  _T_772 = |io_in[6:2]; // @[el2_ifu_compress.scala 131:27]
  wire [31:0] _T_743_bits = {{7'd0}, _T_739}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _T_770_bits = {{7'd0}, _T_766}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _T_773_bits = _T_772 ? _T_743_bits : _T_770_bits; // @[el2_ifu_compress.scala 131:22]
  wire [4:0] _T_773_rd = _T_772 ? io_in[11:7] : 5'h0; // @[el2_ifu_compress.scala 131:22]
  wire [4:0] _T_773_rs1 = _T_772 ? 5'h0 : io_in[11:7]; // @[el2_ifu_compress.scala 131:22]
  wire [4:0] _T_773_rs2 = _T_772 ? io_in[6:2] : io_in[6:2]; // @[el2_ifu_compress.scala 131:22]
  wire [4:0] _T_773_rs3 = _T_772 ? io_in[31:27] : io_in[31:27]; // @[el2_ifu_compress.scala 131:22]
  wire [24:0] _T_779 = {io_in[6:2],io_in[11:7],3'h0,12'he7}; // @[Cat.scala 29:58]
  wire [24:0] _T_781 = {_T_761[24:7],7'h73}; // @[Cat.scala 29:58]
  wire [24:0] _T_782 = _T_781 | 25'h100000; // @[el2_ifu_compress.scala 133:46]
  wire [24:0] _T_785 = _T_673 ? _T_779 : _T_782; // @[el2_ifu_compress.scala 134:33]
  wire [31:0] _T_755_bits = {{7'd0}, _T_750}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _T_789_bits = {{7'd0}, _T_785}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _T_792_bits = _T_772 ? _T_755_bits : _T_789_bits; // @[el2_ifu_compress.scala 135:25]
  wire [4:0] _T_792_rd = _T_772 ? io_in[11:7] : 5'h1; // @[el2_ifu_compress.scala 135:25]
  wire [4:0] _T_792_rs1 = _T_772 ? io_in[11:7] : io_in[11:7]; // @[el2_ifu_compress.scala 135:25]
  wire [31:0] _T_794_bits = io_in[12] ? _T_792_bits : _T_773_bits; // @[el2_ifu_compress.scala 136:10]
  wire [4:0] _T_794_rd = io_in[12] ? _T_792_rd : _T_773_rd; // @[el2_ifu_compress.scala 136:10]
  wire [4:0] _T_794_rs1 = io_in[12] ? _T_792_rs1 : _T_773_rs1; // @[el2_ifu_compress.scala 136:10]
  wire [4:0] _T_794_rs2 = io_in[12] ? _T_773_rs2 : _T_773_rs2; // @[el2_ifu_compress.scala 136:10]
  wire [4:0] _T_794_rs3 = io_in[12] ? _T_773_rs3 : _T_773_rs3; // @[el2_ifu_compress.scala 136:10]
  wire [8:0] _T_798 = {io_in[9:7],io_in[12:10],3'h0}; // @[Cat.scala 29:58]
  wire [28:0] _T_810 = {_T_798[8:5],io_in[6:2],5'h2,3'h3,_T_798[4:0],7'h27}; // @[Cat.scala 29:58]
  wire [7:0] _T_818 = {io_in[8:7],io_in[12:9],2'h0}; // @[Cat.scala 29:58]
  wire [27:0] _T_830 = {_T_818[7:5],io_in[6:2],5'h2,3'h2,_T_818[4:0],7'h23}; // @[Cat.scala 29:58]
  wire [27:0] _T_850 = {_T_818[7:5],io_in[6:2],5'h2,3'h2,_T_818[4:0],7'h27}; // @[Cat.scala 29:58]
  wire [4:0] _T_898 = {io_in[1:0],io_in[15:13]}; // @[Cat.scala 29:58]
  wire [31:0] _T_24_bits = {{2'd0}, _T_18}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _T_44_bits = {{4'd0}, _T_36}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_17 = 5'h1 == _T_898 ? _T_44_bits : _T_24_bits; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_18 = 5'h1 == _T_898 ? _T_14 : _T_14; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_19 = 5'h1 == _T_898 ? _T_30 : 5'h2; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_21 = 5'h1 == _T_898 ? io_in[31:27] : io_in[31:27]; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_66_bits = {{5'd0}, _T_58}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_22 = 5'h2 == _T_898 ? _T_66_bits : _GEN_17; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_23 = 5'h2 == _T_898 ? _T_14 : _GEN_18; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_24 = 5'h2 == _T_898 ? _T_30 : _GEN_19; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_26 = 5'h2 == _T_898 ? io_in[31:27] : _GEN_21; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_88_bits = {{5'd0}, _T_80}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_27 = 5'h3 == _T_898 ? _T_88_bits : _GEN_22; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_28 = 5'h3 == _T_898 ? _T_14 : _GEN_23; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_29 = 5'h3 == _T_898 ? _T_30 : _GEN_24; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_31 = 5'h3 == _T_898 ? io_in[31:27] : _GEN_26; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_119_bits = {{5'd0}, _T_111}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_32 = 5'h4 == _T_898 ? _T_119_bits : _GEN_27; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_33 = 5'h4 == _T_898 ? _T_14 : _GEN_28; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_34 = 5'h4 == _T_898 ? _T_30 : _GEN_29; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_36 = 5'h4 == _T_898 ? io_in[31:27] : _GEN_31; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_146_bits = {{4'd0}, _T_138}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_37 = 5'h5 == _T_898 ? _T_146_bits : _GEN_32; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_38 = 5'h5 == _T_898 ? _T_14 : _GEN_33; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_39 = 5'h5 == _T_898 ? _T_30 : _GEN_34; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_41 = 5'h5 == _T_898 ? io_in[31:27] : _GEN_36; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_177_bits = {{5'd0}, _T_169}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_42 = 5'h6 == _T_898 ? _T_177_bits : _GEN_37; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_43 = 5'h6 == _T_898 ? _T_14 : _GEN_38; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_44 = 5'h6 == _T_898 ? _T_30 : _GEN_39; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_46 = 5'h6 == _T_898 ? io_in[31:27] : _GEN_41; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_208_bits = {{5'd0}, _T_200}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_47 = 5'h7 == _T_898 ? _T_208_bits : _GEN_42; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_48 = 5'h7 == _T_898 ? _T_14 : _GEN_43; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_49 = 5'h7 == _T_898 ? _T_30 : _GEN_44; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_51 = 5'h7 == _T_898 ? io_in[31:27] : _GEN_46; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_52 = 5'h8 == _T_898 ? _T_219 : _GEN_47; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_53 = 5'h8 == _T_898 ? io_in[11:7] : _GEN_48; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_54 = 5'h8 == _T_898 ? io_in[11:7] : _GEN_49; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_55 = 5'h8 == _T_898 ? _T_14 : _GEN_48; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_56 = 5'h8 == _T_898 ? io_in[31:27] : _GEN_51; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_57 = 5'h9 == _T_898 ? _T_306 : _GEN_52; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_58 = 5'h9 == _T_898 ? 5'h1 : _GEN_53; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_59 = 5'h9 == _T_898 ? io_in[11:7] : _GEN_54; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_60 = 5'h9 == _T_898 ? _T_14 : _GEN_55; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_61 = 5'h9 == _T_898 ? io_in[31:27] : _GEN_56; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_62 = 5'ha == _T_898 ? _T_321 : _GEN_57; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_63 = 5'ha == _T_898 ? io_in[11:7] : _GEN_58; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_64 = 5'ha == _T_898 ? 5'h0 : _GEN_59; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_65 = 5'ha == _T_898 ? _T_14 : _GEN_60; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_66 = 5'ha == _T_898 ? io_in[31:27] : _GEN_61; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_67 = 5'hb == _T_898 ? _T_386_bits : _GEN_62; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_68 = 5'hb == _T_898 ? _T_386_rd : _GEN_63; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_69 = 5'hb == _T_898 ? _T_386_rd : _GEN_64; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_70 = 5'hb == _T_898 ? _T_386_rs2 : _GEN_65; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_71 = 5'hb == _T_898 ? _T_386_rs3 : _GEN_66; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_72 = 5'hc == _T_898 ? _GEN_11 : _GEN_67; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_73 = 5'hc == _T_898 ? _T_30 : _GEN_68; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_74 = 5'hc == _T_898 ? _T_30 : _GEN_69; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_75 = 5'hc == _T_898 ? _T_14 : _GEN_70; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_76 = 5'hc == _T_898 ? io_in[31:27] : _GEN_71; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_77 = 5'hd == _T_898 ? _T_533 : _GEN_72; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_78 = 5'hd == _T_898 ? 5'h0 : _GEN_73; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_79 = 5'hd == _T_898 ? _T_30 : _GEN_74; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_80 = 5'hd == _T_898 ? _T_14 : _GEN_75; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_81 = 5'hd == _T_898 ? io_in[31:27] : _GEN_76; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_82 = 5'he == _T_898 ? _T_600 : _GEN_77; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_83 = 5'he == _T_898 ? _T_30 : _GEN_78; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_84 = 5'he == _T_898 ? _T_30 : _GEN_79; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_85 = 5'he == _T_898 ? 5'h0 : _GEN_80; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_86 = 5'he == _T_898 ? io_in[31:27] : _GEN_81; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_87 = 5'hf == _T_898 ? _T_667 : _GEN_82; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_88 = 5'hf == _T_898 ? 5'h0 : _GEN_83; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_89 = 5'hf == _T_898 ? _T_30 : _GEN_84; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_90 = 5'hf == _T_898 ? 5'h0 : _GEN_85; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_91 = 5'hf == _T_898 ? io_in[31:27] : _GEN_86; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_688_bits = {{6'd0}, _T_683}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_92 = 5'h10 == _T_898 ? _T_688_bits : _GEN_87; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_93 = 5'h10 == _T_898 ? io_in[11:7] : _GEN_88; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_94 = 5'h10 == _T_898 ? io_in[11:7] : _GEN_89; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_95 = 5'h10 == _T_898 ? io_in[6:2] : _GEN_90; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_96 = 5'h10 == _T_898 ? io_in[31:27] : _GEN_91; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_703_bits = {{3'd0}, _T_699}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_97 = 5'h11 == _T_898 ? _T_703_bits : _GEN_92; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_98 = 5'h11 == _T_898 ? io_in[11:7] : _GEN_93; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_99 = 5'h11 == _T_898 ? 5'h2 : _GEN_94; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_100 = 5'h11 == _T_898 ? io_in[6:2] : _GEN_95; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_101 = 5'h11 == _T_898 ? io_in[31:27] : _GEN_96; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_718_bits = {{4'd0}, _T_714}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_102 = 5'h12 == _T_898 ? _T_718_bits : _GEN_97; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_103 = 5'h12 == _T_898 ? io_in[11:7] : _GEN_98; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_104 = 5'h12 == _T_898 ? 5'h2 : _GEN_99; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_105 = 5'h12 == _T_898 ? io_in[6:2] : _GEN_100; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_106 = 5'h12 == _T_898 ? io_in[31:27] : _GEN_101; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_733_bits = {{4'd0}, _T_729}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_107 = 5'h13 == _T_898 ? _T_733_bits : _GEN_102; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_108 = 5'h13 == _T_898 ? io_in[11:7] : _GEN_103; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_109 = 5'h13 == _T_898 ? 5'h2 : _GEN_104; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_110 = 5'h13 == _T_898 ? io_in[6:2] : _GEN_105; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_111 = 5'h13 == _T_898 ? io_in[31:27] : _GEN_106; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_112 = 5'h14 == _T_898 ? _T_794_bits : _GEN_107; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_113 = 5'h14 == _T_898 ? _T_794_rd : _GEN_108; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_114 = 5'h14 == _T_898 ? _T_794_rs1 : _GEN_109; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_115 = 5'h14 == _T_898 ? _T_794_rs2 : _GEN_110; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_116 = 5'h14 == _T_898 ? _T_794_rs3 : _GEN_111; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_814_bits = {{3'd0}, _T_810}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_117 = 5'h15 == _T_898 ? _T_814_bits : _GEN_112; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_118 = 5'h15 == _T_898 ? io_in[11:7] : _GEN_113; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_119 = 5'h15 == _T_898 ? 5'h2 : _GEN_114; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_120 = 5'h15 == _T_898 ? io_in[6:2] : _GEN_115; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_121 = 5'h15 == _T_898 ? io_in[31:27] : _GEN_116; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_834_bits = {{4'd0}, _T_830}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_122 = 5'h16 == _T_898 ? _T_834_bits : _GEN_117; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_123 = 5'h16 == _T_898 ? io_in[11:7] : _GEN_118; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_124 = 5'h16 == _T_898 ? 5'h2 : _GEN_119; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_125 = 5'h16 == _T_898 ? io_in[6:2] : _GEN_120; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_126 = 5'h16 == _T_898 ? io_in[31:27] : _GEN_121; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _T_854_bits = {{4'd0}, _T_850}; // @[el2_ifu_compress.scala 17:19 el2_ifu_compress.scala 18:14]
  wire [31:0] _GEN_127 = 5'h17 == _T_898 ? _T_854_bits : _GEN_122; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_128 = 5'h17 == _T_898 ? io_in[11:7] : _GEN_123; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_129 = 5'h17 == _T_898 ? 5'h2 : _GEN_124; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_130 = 5'h17 == _T_898 ? io_in[6:2] : _GEN_125; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_131 = 5'h17 == _T_898 ? io_in[31:27] : _GEN_126; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_132 = 5'h18 == _T_898 ? io_in : _GEN_127; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_133 = 5'h18 == _T_898 ? io_in[11:7] : _GEN_128; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_134 = 5'h18 == _T_898 ? io_in[19:15] : _GEN_129; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_135 = 5'h18 == _T_898 ? io_in[24:20] : _GEN_130; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_136 = 5'h18 == _T_898 ? io_in[31:27] : _GEN_131; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_137 = 5'h19 == _T_898 ? io_in : _GEN_132; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_138 = 5'h19 == _T_898 ? io_in[11:7] : _GEN_133; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_139 = 5'h19 == _T_898 ? io_in[19:15] : _GEN_134; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_140 = 5'h19 == _T_898 ? io_in[24:20] : _GEN_135; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_141 = 5'h19 == _T_898 ? io_in[31:27] : _GEN_136; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_142 = 5'h1a == _T_898 ? io_in : _GEN_137; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_143 = 5'h1a == _T_898 ? io_in[11:7] : _GEN_138; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_144 = 5'h1a == _T_898 ? io_in[19:15] : _GEN_139; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_145 = 5'h1a == _T_898 ? io_in[24:20] : _GEN_140; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_146 = 5'h1a == _T_898 ? io_in[31:27] : _GEN_141; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_147 = 5'h1b == _T_898 ? io_in : _GEN_142; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_148 = 5'h1b == _T_898 ? io_in[11:7] : _GEN_143; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_149 = 5'h1b == _T_898 ? io_in[19:15] : _GEN_144; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_150 = 5'h1b == _T_898 ? io_in[24:20] : _GEN_145; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_151 = 5'h1b == _T_898 ? io_in[31:27] : _GEN_146; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_152 = 5'h1c == _T_898 ? io_in : _GEN_147; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_153 = 5'h1c == _T_898 ? io_in[11:7] : _GEN_148; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_154 = 5'h1c == _T_898 ? io_in[19:15] : _GEN_149; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_155 = 5'h1c == _T_898 ? io_in[24:20] : _GEN_150; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_156 = 5'h1c == _T_898 ? io_in[31:27] : _GEN_151; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_157 = 5'h1d == _T_898 ? io_in : _GEN_152; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_158 = 5'h1d == _T_898 ? io_in[11:7] : _GEN_153; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_159 = 5'h1d == _T_898 ? io_in[19:15] : _GEN_154; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_160 = 5'h1d == _T_898 ? io_in[24:20] : _GEN_155; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_161 = 5'h1d == _T_898 ? io_in[31:27] : _GEN_156; // @[el2_ifu_compress.scala 195:12]
  wire [31:0] _GEN_162 = 5'h1e == _T_898 ? io_in : _GEN_157; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_163 = 5'h1e == _T_898 ? io_in[11:7] : _GEN_158; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_164 = 5'h1e == _T_898 ? io_in[19:15] : _GEN_159; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_165 = 5'h1e == _T_898 ? io_in[24:20] : _GEN_160; // @[el2_ifu_compress.scala 195:12]
  wire [4:0] _GEN_166 = 5'h1e == _T_898 ? io_in[31:27] : _GEN_161; // @[el2_ifu_compress.scala 195:12]
  assign io_out_bits = 5'h1f == _T_898 ? io_in : _GEN_162; // @[el2_ifu_compress.scala 195:12]
  assign io_out_rd = 5'h1f == _T_898 ? io_in[11:7] : _GEN_163; // @[el2_ifu_compress.scala 195:12]
  assign io_out_rs1 = 5'h1f == _T_898 ? io_in[19:15] : _GEN_164; // @[el2_ifu_compress.scala 195:12]
  assign io_out_rs2 = 5'h1f == _T_898 ? io_in[24:20] : _GEN_165; // @[el2_ifu_compress.scala 195:12]
  assign io_out_rs3 = 5'h1f == _T_898 ? io_in[31:27] : _GEN_166; // @[el2_ifu_compress.scala 195:12]
  assign io_rvc = io_in[1:0] != 2'h3; // @[el2_ifu_compress.scala 193:12]
endmodule
module el2_ifu_aln_ctl(
  input         clock,
  input         reset,
  input         io_scan_mode,
  input         io_ifu_async_error_start,
  input         io_iccm_rd_ecc_double_err,
  input         io_ic_access_fault_f,
  input  [1:0]  io_ic_access_fault_type_f,
  input  [7:0]  io_ifu_bp_fghr_f,
  input  [31:0] io_ifu_bp_btb_target_f,
  input  [11:0] io_ifu_bp_poffset_f,
  input  [1:0]  io_ifu_bp_hist0_f,
  input  [1:0]  io_ifu_bp_hist1_f,
  input  [1:0]  io_ifu_bp_pc4_f,
  input  [1:0]  io_ifu_bp_way_f,
  input  [1:0]  io_ifu_bp_valid_f,
  input  [1:0]  io_ifu_bp_ret_f,
  input         io_exu_flush_final,
  input         io_dec_i0_decode_d,
  input  [31:0] io_ifu_fetch_data_f,
  input  [1:0]  io_ifu_fetch_val,
  input  [31:0] io_ifu_fetch_pc,
  output        io_ifu_i0_valid,
  output        io_ifu_i0_icaf,
  output [1:0]  io_ifu_i0_icaf_type,
  output        io_ifu_i0_icaf_f1,
  output        io_ifu_i0_dbecc,
  output [31:0] io_ifu_i0_instr_bits,
  output [4:0]  io_ifu_i0_instr_rd,
  output [4:0]  io_ifu_i0_instr_rs1,
  output [4:0]  io_ifu_i0_instr_rs2,
  output [4:0]  io_ifu_i0_instr_rs3,
  output [31:0] io_ifu_i0_pc,
  output        io_ifu_i0_pc4,
  output        io_ifu_fb_consume1,
  output        io_ifu_fb_consume2,
  output [6:0]  io_ifu_i0_bp_index,
  output [7:0]  io_ifu_i0_bp_fghr,
  output [4:0]  io_ifu_i0_bp_btag,
  output        io_ifu_pmu_instr_aligned,
  output [15:0] io_ifu_i0_cinst,
  output        io_i0_brp_valid,
  output [11:0] io_i0_brp_toffset,
  output [1:0]  io_i0_brp_hist,
  output        io_i0_brp_br_error,
  output        io_i0_brp_br_start_error,
  output        io_i0_brp_bank,
  output [31:0] io_i0_brp_prett,
  output        io_i0_brp_way,
  output        io_i0_brp_ret,
  output [30:0] io_test_out,
  input  [31:0] io_test_in
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
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] decompressed_io_in; // @[el2_ifu_aln_ctl.scala 100:28]
  wire [31:0] decompressed_io_out_bits; // @[el2_ifu_aln_ctl.scala 100:28]
  wire [4:0] decompressed_io_out_rd; // @[el2_ifu_aln_ctl.scala 100:28]
  wire [4:0] decompressed_io_out_rs1; // @[el2_ifu_aln_ctl.scala 100:28]
  wire [4:0] decompressed_io_out_rs2; // @[el2_ifu_aln_ctl.scala 100:28]
  wire [4:0] decompressed_io_out_rs3; // @[el2_ifu_aln_ctl.scala 100:28]
  wire  decompressed_io_rvc; // @[el2_ifu_aln_ctl.scala 100:28]
  reg  error_stall; // @[el2_ifu_aln_ctl.scala 90:28]
  reg [1:0] f0val; // @[el2_ifu_aln_ctl.scala 91:22]
  wire  _T = error_stall | io_ifu_async_error_start; // @[el2_ifu_aln_ctl.scala 92:34]
  wire  _T_1 = ~io_exu_flush_final; // @[el2_ifu_aln_ctl.scala 92:64]
  wire  error_stall_in = _T & _T_1; // @[el2_ifu_aln_ctl.scala 92:62]
  wire  _T_3 = ~error_stall; // @[el2_ifu_aln_ctl.scala 94:39]
  wire  i0_shift = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 94:37]
  wire  _T_7 = ~f0val[1]; // @[el2_ifu_aln_ctl.scala 98:58]
  wire  _T_9 = _T_7 & f0val[0]; // @[el2_ifu_aln_ctl.scala 98:68]
  reg [1:0] rdptr; // @[el2_ifu_aln_ctl.scala 125:22]
  wire  _T_248 = rdptr == 2'h0; // @[el2_ifu_aln_ctl.scala 178:32]
  reg  q1off; // @[el2_ifu_aln_ctl.scala 132:22]
  wire  _T_251 = _T_248 & q1off; // @[Mux.scala 27:72]
  wire  _T_249 = rdptr == 2'h1; // @[el2_ifu_aln_ctl.scala 178:57]
  reg  q2off; // @[el2_ifu_aln_ctl.scala 131:22]
  wire  _T_252 = _T_249 & q2off; // @[Mux.scala 27:72]
  wire  _T_254 = _T_251 | _T_252; // @[Mux.scala 27:72]
  wire  _T_250 = rdptr == 2'h2; // @[el2_ifu_aln_ctl.scala 178:83]
  reg  q0off; // @[el2_ifu_aln_ctl.scala 133:22]
  wire  _T_253 = _T_250 & q0off; // @[Mux.scala 27:72]
  wire  q1ptr = _T_254 | _T_253; // @[Mux.scala 27:72]
  wire  _T_257 = ~q1ptr; // @[el2_ifu_aln_ctl.scala 182:26]
  wire [1:0] q1sel = {q1ptr,_T_257}; // @[Cat.scala 29:58]
  wire [2:0] qren = {_T_250,_T_249,_T_248}; // @[Cat.scala 29:58]
  reg [31:0] q1; // @[Reg.scala 27:20]
  reg [31:0] q0; // @[Reg.scala 27:20]
  wire [63:0] _T_317 = {q1,q0}; // @[Cat.scala 29:58]
  wire [63:0] _T_324 = qren[0] ? _T_317 : 64'h0; // @[Mux.scala 27:72]
  reg [31:0] q2; // @[Reg.scala 27:20]
  wire [63:0] _T_320 = {q2,q1}; // @[Cat.scala 29:58]
  wire [63:0] _T_325 = qren[1] ? _T_320 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_327 = _T_324 | _T_325; // @[Mux.scala 27:72]
  wire [63:0] _T_323 = {q0,q2}; // @[Cat.scala 29:58]
  wire [63:0] _T_326 = qren[2] ? _T_323 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] qeff = _T_327 | _T_326; // @[Mux.scala 27:72]
  wire [31:0] q1eff = qeff[63:32]; // @[el2_ifu_aln_ctl.scala 225:29]
  wire [15:0] _T_523 = q1sel[0] ? q1eff[15:0] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_524 = q1sel[1] ? q1eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [15:0] q1final = _T_523 | _T_524; // @[Mux.scala 27:72]
  wire  _T_243 = _T_248 & q0off; // @[Mux.scala 27:72]
  wire  _T_244 = _T_249 & q1off; // @[Mux.scala 27:72]
  wire  _T_246 = _T_243 | _T_244; // @[Mux.scala 27:72]
  wire  _T_245 = _T_250 & q2off; // @[Mux.scala 27:72]
  wire  q0ptr = _T_246 | _T_245; // @[Mux.scala 27:72]
  wire  _T_256 = ~q0ptr; // @[el2_ifu_aln_ctl.scala 180:26]
  wire [1:0] q0sel = {q0ptr,_T_256}; // @[Cat.scala 29:58]
  wire [31:0] q0eff = qeff[31:0]; // @[el2_ifu_aln_ctl.scala 225:42]
  wire [31:0] _T_513 = q0sel[0] ? q0eff : 32'h0; // @[Mux.scala 27:72]
  wire [15:0] _T_514 = q0sel[1] ? q0eff[31:16] : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_12 = {{16'd0}, _T_514}; // @[Mux.scala 27:72]
  wire [31:0] _T_515 = _T_513 | _GEN_12; // @[Mux.scala 27:72]
  wire [15:0] q0final = _T_515[15:0]; // @[el2_ifu_aln_ctl.scala 294:11]
  wire [31:0] _T_11 = {q1final,q0final}; // @[Cat.scala 29:58]
  wire [15:0] _T_12 = f0val[0] ? q0final : 16'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_13 = _T_9 ? _T_11 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _GEN_13 = {{16'd0}, _T_12}; // @[Mux.scala 27:72]
  wire [31:0] aligndata = _GEN_13 | _T_13; // @[Mux.scala 27:72]
  wire  first2B = ~decompressed_io_rvc; // @[el2_ifu_aln_ctl.scala 112:17]
  reg [54:0] _T_762; // @[Reg.scala 27:20]
  wire [53:0] misc1 = _T_762[53:0]; // @[el2_ifu_aln_ctl.scala 374:9]
  reg [54:0] _T_764; // @[Reg.scala 27:20]
  wire [53:0] misc0 = _T_764[53:0]; // @[el2_ifu_aln_ctl.scala 375:9]
  wire [107:0] _T_265 = {misc1,misc0}; // @[Cat.scala 29:58]
  wire [107:0] _T_272 = qren[0] ? _T_265 : 108'h0; // @[Mux.scala 27:72]
  reg [54:0] _T_760; // @[Reg.scala 27:20]
  wire [53:0] misc2 = _T_760[53:0]; // @[el2_ifu_aln_ctl.scala 373:9]
  wire [107:0] _T_268 = {misc2,misc1}; // @[Cat.scala 29:58]
  wire [107:0] _T_273 = qren[1] ? _T_268 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] _T_275 = _T_272 | _T_273; // @[Mux.scala 27:72]
  wire [107:0] _T_271 = {misc0,misc2}; // @[Cat.scala 29:58]
  wire [107:0] _T_274 = qren[2] ? _T_271 : 108'h0; // @[Mux.scala 27:72]
  wire [107:0] misceff = _T_275 | _T_274; // @[Mux.scala 27:72]
  wire [52:0] misc1eff = misceff[107:55]; // @[el2_ifu_aln_ctl.scala 191:25]
  wire  f1icaf = misc1eff[51]; // @[el2_ifu_aln_ctl.scala 195:21]
  wire [54:0] misc0eff = misceff[54:0]; // @[el2_ifu_aln_ctl.scala 192:25]
  wire  f0icaf = misc0eff[53]; // @[el2_ifu_aln_ctl.scala 202:21]
  wire [1:0] _T_23 = {f1icaf,f0icaf}; // @[Cat.scala 29:58]
  wire  _T_24 = f0val[1] & f0icaf; // @[Mux.scala 27:72]
  wire [1:0] _T_25 = _T_9 ? _T_23 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_14 = {{1'd0}, _T_24}; // @[Mux.scala 27:72]
  wire [1:0] alignicaf = _GEN_14 | _T_25; // @[Mux.scala 27:72]
  wire  _T_27 = |alignicaf; // @[el2_ifu_aln_ctl.scala 115:52]
  wire  _T_29 = decompressed_io_rvc & _T_27; // @[Mux.scala 27:72]
  wire  _T_30 = first2B & alignicaf[0]; // @[Mux.scala 27:72]
  wire [1:0] _T_535 = f0val[1] ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] f1val; // @[el2_ifu_aln_ctl.scala 128:22]
  wire [1:0] _T_534 = {f1val[0],1'h1}; // @[Cat.scala 29:58]
  wire [1:0] _T_536 = _T_9 ? _T_534 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignval = _T_535 | _T_536; // @[Mux.scala 27:72]
  wire  _T_35 = decompressed_io_rvc & alignval[1]; // @[Mux.scala 27:72]
  wire  _T_36 = first2B & alignval[0]; // @[Mux.scala 27:72]
  wire  shift_2B = i0_shift & first2B; // @[el2_ifu_aln_ctl.scala 119:27]
  wire  shift_4B = i0_shift & decompressed_io_rvc; // @[el2_ifu_aln_ctl.scala 120:27]
  wire  _T_43 = ~f0val[0]; // @[el2_ifu_aln_ctl.scala 121:80]
  wire  _T_45 = _T_43 & f0val[0]; // @[el2_ifu_aln_ctl.scala 121:90]
  wire  _T_46 = shift_2B & f0val[0]; // @[Mux.scala 27:72]
  wire  _T_47 = shift_4B & _T_45; // @[Mux.scala 27:72]
  wire  f0_shift_2B = _T_46 | _T_47; // @[Mux.scala 27:72]
  wire  _T_52 = f0val[0] & _T_7; // @[el2_ifu_aln_ctl.scala 122:31]
  wire  f1_shift_2B = _T_52 & shift_4B; // @[el2_ifu_aln_ctl.scala 122:43]
  reg [1:0] wrptr; // @[el2_ifu_aln_ctl.scala 124:22]
  reg [1:0] f2val; // @[el2_ifu_aln_ctl.scala 127:22]
  wire  _T_449 = f1_shift_2B & f1val[1]; // @[Mux.scala 27:72]
  wire  _T_448 = ~f1_shift_2B; // @[el2_ifu_aln_ctl.scala 281:53]
  wire [1:0] _T_450 = _T_448 ? f1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_15 = {{1'd0}, _T_449}; // @[Mux.scala 27:72]
  wire [1:0] sf1val = _GEN_15 | _T_450; // @[Mux.scala 27:72]
  wire  sf1_valid = sf1val[0]; // @[el2_ifu_aln_ctl.scala 247:22]
  wire  _T_54 = ~sf1_valid; // @[el2_ifu_aln_ctl.scala 135:42]
  wire  f2_valid = f2val[0]; // @[el2_ifu_aln_ctl.scala 246:20]
  wire  _T_56 = ~f2_valid; // @[el2_ifu_aln_ctl.scala 135:55]
  wire  ifvalid = io_ifu_fetch_val[0]; // @[el2_ifu_aln_ctl.scala 256:30]
  wire  _T_61 = _T_54 & f2_valid; // @[el2_ifu_aln_ctl.scala 136:53]
  wire  _T_62 = _T_61 & ifvalid; // @[el2_ifu_aln_ctl.scala 136:65]
  wire  _T_66 = sf1_valid & _T_56; // @[el2_ifu_aln_ctl.scala 137:30]
  wire  _T_67 = _T_66 & ifvalid; // @[el2_ifu_aln_ctl.scala 137:42]
  wire  fetch_to_f1 = _T_62 | _T_67; // @[el2_ifu_aln_ctl.scala 136:77]
  wire  _T_76 = sf1_valid & f2_valid; // @[el2_ifu_aln_ctl.scala 139:53]
  wire  f2_wr_en = _T_76 & ifvalid; // @[el2_ifu_aln_ctl.scala 139:65]
  wire  _T_90 = wrptr == 2'h2; // @[el2_ifu_aln_ctl.scala 147:24]
  wire  _T_91 = _T_90 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:32]
  wire  _T_92 = wrptr == 2'h1; // @[el2_ifu_aln_ctl.scala 147:49]
  wire  _T_93 = _T_92 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:57]
  wire  _T_94 = wrptr == 2'h0; // @[el2_ifu_aln_ctl.scala 147:74]
  wire  _T_95 = _T_94 & ifvalid; // @[el2_ifu_aln_ctl.scala 147:82]
  wire [2:0] qwen = {_T_91,_T_93,_T_95}; // @[Cat.scala 29:58]
  wire  _T_149 = qwen[0] & _T_1; // @[el2_ifu_aln_ctl.scala 157:34]
  wire  _T_153 = qwen[1] & _T_1; // @[el2_ifu_aln_ctl.scala 158:34]
  wire  _T_159 = ~ifvalid; // @[el2_ifu_aln_ctl.scala 160:26]
  wire  _T_161 = _T_159 & _T_1; // @[el2_ifu_aln_ctl.scala 160:35]
  wire [1:0] _T_164 = _T_153 ? 2'h2 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_166 = _T_161 ? wrptr : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_18 = {{1'd0}, _T_149}; // @[Mux.scala 27:72]
  wire [1:0] _T_167 = _GEN_18 | _T_164; // @[Mux.scala 27:72]
  wire [1:0] wrptr_in = _T_167 | _T_166; // @[Mux.scala 27:72]
  wire  _T_172 = ~qwen[2]; // @[el2_ifu_aln_ctl.scala 162:26]
  wire  _T_174 = _T_172 & _T_250; // @[el2_ifu_aln_ctl.scala 162:35]
  wire  _T_176 = q2off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 162:74]
  wire  _T_180 = _T_172 & _T_249; // @[el2_ifu_aln_ctl.scala 163:35]
  wire  _T_182 = q2off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 163:74]
  wire  _T_186 = _T_172 & _T_248; // @[el2_ifu_aln_ctl.scala 164:35]
  wire  _T_188 = _T_174 & _T_176; // @[Mux.scala 27:72]
  wire  _T_189 = _T_180 & _T_182; // @[Mux.scala 27:72]
  wire  _T_190 = _T_186 & q2off; // @[Mux.scala 27:72]
  wire  _T_191 = _T_188 | _T_189; // @[Mux.scala 27:72]
  wire  q2off_in = _T_191 | _T_190; // @[Mux.scala 27:72]
  wire  _T_195 = ~qwen[1]; // @[el2_ifu_aln_ctl.scala 166:26]
  wire  _T_197 = _T_195 & _T_249; // @[el2_ifu_aln_ctl.scala 166:35]
  wire  _T_199 = q1off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 166:74]
  wire  _T_203 = _T_195 & _T_248; // @[el2_ifu_aln_ctl.scala 167:35]
  wire  _T_205 = q1off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 167:74]
  wire  _T_209 = _T_195 & _T_250; // @[el2_ifu_aln_ctl.scala 168:35]
  wire  _T_211 = _T_197 & _T_199; // @[Mux.scala 27:72]
  wire  _T_212 = _T_203 & _T_205; // @[Mux.scala 27:72]
  wire  _T_213 = _T_209 & q1off; // @[Mux.scala 27:72]
  wire  _T_214 = _T_211 | _T_212; // @[Mux.scala 27:72]
  wire  q1off_in = _T_214 | _T_213; // @[Mux.scala 27:72]
  wire  _T_218 = ~qwen[0]; // @[el2_ifu_aln_ctl.scala 170:26]
  wire  _T_220 = _T_218 & _T_248; // @[el2_ifu_aln_ctl.scala 170:35]
  wire  _T_222 = q0off | f0_shift_2B; // @[el2_ifu_aln_ctl.scala 170:76]
  wire  _T_226 = _T_218 & _T_250; // @[el2_ifu_aln_ctl.scala 171:35]
  wire  _T_228 = q0off | f1_shift_2B; // @[el2_ifu_aln_ctl.scala 171:76]
  wire  _T_232 = _T_218 & _T_249; // @[el2_ifu_aln_ctl.scala 172:35]
  wire  _T_234 = _T_220 & _T_222; // @[Mux.scala 27:72]
  wire  _T_235 = _T_226 & _T_228; // @[Mux.scala 27:72]
  wire  _T_236 = _T_232 & q0off; // @[Mux.scala 27:72]
  wire  _T_237 = _T_234 | _T_235; // @[Mux.scala 27:72]
  wire  q0off_in = _T_237 | _T_236; // @[Mux.scala 27:72]
  wire [54:0] misc_data_in = {io_iccm_rd_ecc_double_err,io_ic_access_fault_f,io_ic_access_fault_type_f,io_ifu_bp_btb_target_f[31:1],io_ifu_bp_poffset_f,io_ifu_bp_fghr_f}; // @[Cat.scala 29:58]
  wire  f1dbecc = misc1eff[52]; // @[el2_ifu_aln_ctl.scala 194:25]
  wire [1:0] f1ictype = misc1eff[50:49]; // @[el2_ifu_aln_ctl.scala 196:26]
  wire [30:0] f1prett = misc1eff[48:18]; // @[el2_ifu_aln_ctl.scala 197:25]
  wire [11:0] f1poffset = misc1eff[19:8]; // @[el2_ifu_aln_ctl.scala 198:27]
  wire [7:0] f1fghr = misc1eff[7:0]; // @[el2_ifu_aln_ctl.scala 199:24]
  wire  f0dbecc = misc0eff[54]; // @[el2_ifu_aln_ctl.scala 201:25]
  wire [1:0] f0ictype = misc0eff[52:51]; // @[el2_ifu_aln_ctl.scala 203:26]
  wire [30:0] f0prett = misc0eff[50:20]; // @[el2_ifu_aln_ctl.scala 204:25]
  wire [11:0] f0poffset = misc0eff[19:8]; // @[el2_ifu_aln_ctl.scala 205:27]
  wire [7:0] f0fghr = misc0eff[7:0]; // @[el2_ifu_aln_ctl.scala 206:24]
  wire [5:0] _T_295 = {io_ifu_bp_hist1_f[0],io_ifu_bp_hist0_f[0],io_ifu_bp_pc4_f[0],io_ifu_bp_way_f[0],io_ifu_bp_valid_f[0],io_ifu_bp_ret_f[0]}; // @[Cat.scala 29:58]
  wire [11:0] brdata_in = {io_ifu_bp_hist1_f[1],io_ifu_bp_hist0_f[1],io_ifu_bp_pc4_f[1],io_ifu_bp_way_f[1],io_ifu_bp_valid_f[1],io_ifu_bp_ret_f[1],_T_295}; // @[Cat.scala 29:58]
  reg [11:0] brdata1; // @[Reg.scala 27:20]
  reg [11:0] brdata0; // @[Reg.scala 27:20]
  wire [23:0] _T_303 = {brdata1,brdata0}; // @[Cat.scala 29:58]
  reg [11:0] brdata2; // @[Reg.scala 27:20]
  wire [23:0] _T_306 = {brdata2,brdata1}; // @[Cat.scala 29:58]
  wire [23:0] _T_309 = {brdata0,brdata2}; // @[Cat.scala 29:58]
  wire [23:0] _T_310 = qren[0] ? _T_303 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_311 = qren[1] ? _T_306 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_312 = qren[2] ? _T_309 : 24'h0; // @[Mux.scala 27:72]
  wire [23:0] _T_313 = _T_310 | _T_311; // @[Mux.scala 27:72]
  wire [23:0] brdataeff = _T_313 | _T_312; // @[Mux.scala 27:72]
  wire [11:0] brdata0eff = brdataeff[11:0]; // @[el2_ifu_aln_ctl.scala 216:43]
  wire [11:0] brdata1eff = brdataeff[23:12]; // @[el2_ifu_aln_ctl.scala 216:61]
  wire [11:0] _T_334 = q0sel[0] ? brdata0eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_335 = q0sel[1] ? brdata0eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_19 = {{6'd0}, _T_335}; // @[Mux.scala 27:72]
  wire [11:0] brdata0final = _T_334 | _GEN_19; // @[Mux.scala 27:72]
  wire [11:0] _T_342 = q1sel[0] ? brdata1eff : 12'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_343 = q1sel[1] ? brdata1eff[11:6] : 6'h0; // @[Mux.scala 27:72]
  wire [11:0] _GEN_20 = {{6'd0}, _T_343}; // @[Mux.scala 27:72]
  wire [11:0] brdata1final = _T_342 | _GEN_20; // @[Mux.scala 27:72]
  wire [1:0] f0ret = {brdata0final[6],brdata0final[0]}; // @[Cat.scala 29:58]
  wire [1:0] f0brend = {brdata0final[7],brdata0final[1]}; // @[Cat.scala 29:58]
  wire [1:0] f0way = {brdata0final[8],brdata0final[2]}; // @[Cat.scala 29:58]
  wire [1:0] f0pc4 = {brdata0final[9],brdata0final[3]}; // @[Cat.scala 29:58]
  wire [1:0] f0hist0 = {brdata0final[10],brdata0final[4]}; // @[Cat.scala 29:58]
  wire [1:0] f0hist1 = {brdata0final[11],brdata0final[5]}; // @[Cat.scala 29:58]
  wire [1:0] f1ret = {brdata1final[6],brdata1final[0]}; // @[Cat.scala 29:58]
  wire [1:0] f1brend = {brdata1final[7],brdata1final[1]}; // @[Cat.scala 29:58]
  wire [1:0] f1way = {brdata1final[8],brdata1final[2]}; // @[Cat.scala 29:58]
  wire [1:0] f1pc4 = {brdata1final[9],brdata1final[3]}; // @[Cat.scala 29:58]
  wire [1:0] f1hist0 = {brdata1final[10],brdata1final[4]}; // @[Cat.scala 29:58]
  wire [1:0] f1hist1 = {brdata1final[11],brdata1final[5]}; // @[Cat.scala 29:58]
  wire  consume_fb1 = _T_54 & f1val[0]; // @[el2_ifu_aln_ctl.scala 251:32]
  wire  _T_378 = ~consume_fb1; // @[el2_ifu_aln_ctl.scala 253:39]
  wire  _T_379 = f0val[0] & _T_378; // @[el2_ifu_aln_ctl.scala 253:37]
  wire  _T_382 = f0val[0] & consume_fb1; // @[el2_ifu_aln_ctl.scala 254:37]
  wire  _T_405 = ~fetch_to_f1; // @[el2_ifu_aln_ctl.scala 271:28]
  wire  _T_406 = ~_T_76; // @[el2_ifu_aln_ctl.scala 271:43]
  wire  _T_407 = _T_405 & _T_406; // @[el2_ifu_aln_ctl.scala 271:41]
  wire  _T_418 = ~_T_61; // @[el2_ifu_aln_ctl.scala 276:43]
  wire  _T_431 = f2_wr_en & _T_1; // @[el2_ifu_aln_ctl.scala 278:38]
  wire  _T_433 = ~f2_wr_en; // @[el2_ifu_aln_ctl.scala 279:6]
  wire  _T_435 = _T_433 & _T_406; // @[el2_ifu_aln_ctl.scala 279:19]
  wire  _T_437 = _T_435 & _T_418; // @[el2_ifu_aln_ctl.scala 279:34]
  wire  _T_439 = _T_437 & _T_1; // @[el2_ifu_aln_ctl.scala 279:49]
  wire [1:0] _T_441 = _T_431 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_442 = _T_439 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] f2val_in = _T_441 | _T_442; // @[Mux.scala 27:72]
  wire  _T_454 = fetch_to_f1 & _T_1; // @[el2_ifu_aln_ctl.scala 283:38]
  wire  _T_457 = _T_76 & _T_1; // @[el2_ifu_aln_ctl.scala 284:38]
  wire  _T_463 = _T_407 & _T_54; // @[el2_ifu_aln_ctl.scala 285:54]
  wire  _T_465 = _T_463 & _T_1; // @[el2_ifu_aln_ctl.scala 285:69]
  wire [1:0] _T_467 = _T_454 ? io_ifu_fetch_val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_468 = _T_457 ? f2val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_469 = _T_465 ? sf1val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_470 = _T_467 | _T_468; // @[Mux.scala 27:72]
  wire [1:0] f1val_in = _T_470 | _T_469; // @[Mux.scala 27:72]
  wire  _T_475 = ~shift_2B; // @[el2_ifu_aln_ctl.scala 287:52]
  wire  _T_476 = ~shift_4B; // @[el2_ifu_aln_ctl.scala 287:64]
  wire  _T_477 = _T_475 & _T_476; // @[el2_ifu_aln_ctl.scala 287:62]
  wire  _T_479 = shift_2B & f0val[1]; // @[Mux.scala 27:72]
  wire [1:0] _T_480 = _T_477 ? f0val : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _GEN_26 = {{1'd0}, _T_479}; // @[Mux.scala 27:72]
  wire [1:0] _T_481 = _GEN_26 | _T_480; // @[Mux.scala 27:72]
  wire [1:0] _T_542 = f0dbecc ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [1:0] _T_548 = {f1dbecc,f0dbecc}; // @[Cat.scala 29:58]
  wire [1:0] _T_549 = f0val[1] ? _T_542 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_550 = _T_9 ? _T_548 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] aligndbecc = _T_549 | _T_550; // @[Mux.scala 27:72]
  wire [1:0] _T_561 = {f1brend[0],f0brend[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_562 = f0val[1] ? f0brend : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_563 = _T_9 ? _T_561 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignbrend = _T_562 | _T_563; // @[Mux.scala 27:72]
  wire [1:0] _T_574 = {f1pc4[0],f0pc4[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_575 = f0val[1] ? f0pc4 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_576 = _T_9 ? _T_574 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignpc4 = _T_575 | _T_576; // @[Mux.scala 27:72]
  wire [1:0] _T_587 = {f1ret[0],f0ret[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_588 = f0val[1] ? f0ret : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_589 = _T_9 ? _T_587 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignret = _T_588 | _T_589; // @[Mux.scala 27:72]
  wire [1:0] _T_600 = {f1way[0],f0way[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_601 = f0val[1] ? f0way : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_602 = _T_9 ? _T_600 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignway = _T_601 | _T_602; // @[Mux.scala 27:72]
  wire [1:0] _T_613 = {f1hist1[0],f0hist1[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_614 = f0val[1] ? f0hist1 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_615 = _T_9 ? _T_613 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist1 = _T_614 | _T_615; // @[Mux.scala 27:72]
  wire [1:0] _T_626 = {f1hist0[0],f0hist0[0]}; // @[Cat.scala 29:58]
  wire [1:0] _T_627 = f0val[1] ? f0hist0 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_628 = _T_9 ? _T_626 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] alignhist0 = _T_627 | _T_628; // @[Mux.scala 27:72]
  wire [30:0] secondpc = f0val[1] ? 31'h1 : 31'h0; // @[Mux.scala 27:72]
  wire  _T_645 = decompressed_io_rvc & _T_7; // @[el2_ifu_aln_ctl.scala 324:39]
  wire  _T_647 = _T_645 & f0val[0]; // @[el2_ifu_aln_ctl.scala 324:51]
  wire  _T_649 = ~alignicaf[0]; // @[el2_ifu_aln_ctl.scala 324:64]
  wire  _T_650 = _T_647 & _T_649; // @[el2_ifu_aln_ctl.scala 324:62]
  wire  _T_652 = ~aligndbecc[0]; // @[el2_ifu_aln_ctl.scala 324:80]
  wire  _T_653 = _T_650 & _T_652; // @[el2_ifu_aln_ctl.scala 324:78]
  wire  icaf_eff = alignicaf[1] | aligndbecc[1]; // @[el2_ifu_aln_ctl.scala 326:31]
  wire  _T_658 = decompressed_io_rvc & icaf_eff; // @[el2_ifu_aln_ctl.scala 328:32]
  wire  _T_660 = |aligndbecc; // @[el2_ifu_aln_ctl.scala 330:52]
  wire  _T_662 = decompressed_io_rvc & _T_660; // @[Mux.scala 27:72]
  wire  _T_663 = first2B & aligndbecc[0]; // @[Mux.scala 27:72]
  wire [7:0] _T_672 = secondpc[9:2] ^ secondpc[17:10]; // @[el2_lib.scala 182:42]
  wire [7:0] secondpc_hash = _T_672 ^ secondpc[25:18]; // @[el2_lib.scala 182:76]
  wire [4:0] _T_683 = secondpc[14:10] ^ secondpc[19:15]; // @[el2_lib.scala 175:111]
  wire [4:0] secondbrtag_hash = _T_683 ^ secondpc[24:20]; // @[el2_lib.scala 175:111]
  wire  _T_685 = first2B & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 340:30]
  wire  _T_687 = decompressed_io_rvc & alignbrend[1]; // @[el2_ifu_aln_ctl.scala 340:58]
  wire  _T_688 = _T_685 | _T_687; // @[el2_ifu_aln_ctl.scala 340:47]
  wire  _T_692 = _T_35 & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 340:100]
  wire  _T_695 = first2B & alignret[0]; // @[el2_ifu_aln_ctl.scala 342:29]
  wire  _T_697 = decompressed_io_rvc & alignret[1]; // @[el2_ifu_aln_ctl.scala 342:55]
  wire  _T_700 = first2B | alignbrend[0]; // @[el2_ifu_aln_ctl.scala 344:33]
  wire  _T_706 = first2B & alignhist1[0]; // @[el2_ifu_aln_ctl.scala 345:34]
  wire  _T_708 = decompressed_io_rvc & alignhist1[1]; // @[el2_ifu_aln_ctl.scala 345:62]
  wire  _T_709 = _T_706 | _T_708; // @[el2_ifu_aln_ctl.scala 345:51]
  wire  _T_711 = first2B & alignhist0[0]; // @[el2_ifu_aln_ctl.scala 346:14]
  wire  _T_713 = decompressed_io_rvc & alignhist0[1]; // @[el2_ifu_aln_ctl.scala 346:42]
  wire  _T_714 = _T_711 | _T_713; // @[el2_ifu_aln_ctl.scala 346:31]
  wire  _T_716 = decompressed_io_rvc & _T_9; // @[el2_ifu_aln_ctl.scala 348:37]
  wire [30:0] _T_721 = _T_716 ? f1prett : f0prett; // @[el2_ifu_aln_ctl.scala 350:25]
  wire  _T_733 = first2B & alignpc4[0]; // @[el2_ifu_aln_ctl.scala 356:29]
  wire  _T_735 = decompressed_io_rvc & alignpc4[1]; // @[el2_ifu_aln_ctl.scala 356:55]
  wire  i0_brp_pc4 = _T_733 | _T_735; // @[el2_ifu_aln_ctl.scala 356:44]
  wire  _T_736 = io_i0_brp_valid & i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 358:42]
  wire  _T_737 = _T_736 & first2B; // @[el2_ifu_aln_ctl.scala 358:56]
  wire  _T_738 = ~i0_brp_pc4; // @[el2_ifu_aln_ctl.scala 358:89]
  wire  _T_739 = io_i0_brp_valid & _T_738; // @[el2_ifu_aln_ctl.scala 358:87]
  wire  _T_740 = _T_739 & decompressed_io_rvc; // @[el2_ifu_aln_ctl.scala 358:101]
  wire [7:0] _T_745 = _T_700 ? 8'h0 : secondpc_hash; // @[el2_ifu_aln_ctl.scala 361:28]
  el2_ifu_compress decompressed ( // @[el2_ifu_aln_ctl.scala 100:28]
    .io_in(decompressed_io_in),
    .io_out_bits(decompressed_io_out_bits),
    .io_out_rd(decompressed_io_out_rd),
    .io_out_rs1(decompressed_io_out_rs1),
    .io_out_rs2(decompressed_io_out_rs2),
    .io_out_rs3(decompressed_io_out_rs3),
    .io_rvc(decompressed_io_rvc)
  );
  assign io_ifu_i0_valid = _T_35 | _T_36; // @[el2_ifu_aln_ctl.scala 116:19]
  assign io_ifu_i0_icaf = _T_29 | _T_30; // @[el2_ifu_aln_ctl.scala 115:18]
  assign io_ifu_i0_icaf_type = _T_653 ? f1ictype : f0ictype; // @[el2_ifu_aln_ctl.scala 324:23]
  assign io_ifu_i0_icaf_f1 = _T_658 & _T_9; // @[el2_ifu_aln_ctl.scala 328:21]
  assign io_ifu_i0_dbecc = _T_662 | _T_663; // @[el2_ifu_aln_ctl.scala 330:19]
  assign io_ifu_i0_instr_bits = decompressed_io_out_bits; // @[el2_ifu_aln_ctl.scala 104:23]
  assign io_ifu_i0_instr_rd = decompressed_io_out_rd; // @[el2_ifu_aln_ctl.scala 104:23]
  assign io_ifu_i0_instr_rs1 = decompressed_io_out_rs1; // @[el2_ifu_aln_ctl.scala 104:23]
  assign io_ifu_i0_instr_rs2 = decompressed_io_out_rs2; // @[el2_ifu_aln_ctl.scala 104:23]
  assign io_ifu_i0_instr_rs3 = decompressed_io_out_rs3; // @[el2_ifu_aln_ctl.scala 104:23]
  assign io_ifu_i0_pc = 32'h0; // @[el2_ifu_aln_ctl.scala 320:16]
  assign io_ifu_i0_pc4 = decompressed_io_rvc; // @[el2_ifu_aln_ctl.scala 117:17]
  assign io_ifu_fb_consume1 = _T_379 & _T_1; // @[el2_ifu_aln_ctl.scala 253:22]
  assign io_ifu_fb_consume2 = _T_382 & _T_1; // @[el2_ifu_aln_ctl.scala 254:22]
  assign io_ifu_i0_bp_index = _T_745[6:0]; // @[el2_ifu_aln_ctl.scala 361:22]
  assign io_ifu_i0_bp_fghr = _T_716 ? f1fghr : f0fghr; // @[el2_ifu_aln_ctl.scala 363:21]
  assign io_ifu_i0_bp_btag = _T_700 ? 5'h0 : secondbrtag_hash; // @[el2_ifu_aln_ctl.scala 365:21]
  assign io_ifu_pmu_instr_aligned = io_dec_i0_decode_d & _T_3; // @[el2_ifu_aln_ctl.scala 96:28]
  assign io_ifu_i0_cinst = aligndata[15:0]; // @[el2_ifu_aln_ctl.scala 108:19]
  assign io_i0_brp_valid = _T_688 | _T_692; // @[el2_ifu_aln_ctl.scala 340:19]
  assign io_i0_brp_toffset = _T_716 ? f1poffset : f0poffset; // @[el2_ifu_aln_ctl.scala 348:21]
  assign io_i0_brp_hist = {_T_709,_T_714}; // @[el2_ifu_aln_ctl.scala 345:18]
  assign io_i0_brp_br_error = _T_737 | _T_740; // @[el2_ifu_aln_ctl.scala 358:22]
  assign io_i0_brp_br_start_error = _T_35 & alignbrend[0]; // @[el2_ifu_aln_ctl.scala 352:29]
  assign io_i0_brp_bank = _T_700 ? 1'h0 : secondpc[1]; // @[el2_ifu_aln_ctl.scala 354:29]
  assign io_i0_brp_prett = {{1'd0}, _T_721}; // @[el2_ifu_aln_ctl.scala 350:19]
  assign io_i0_brp_way = _T_700 ? alignway[0] : alignway[1]; // @[el2_ifu_aln_ctl.scala 344:17]
  assign io_i0_brp_ret = _T_695 | _T_697; // @[el2_ifu_aln_ctl.scala 342:17]
  assign io_test_out = 31'h0; // @[el2_ifu_aln_ctl.scala 368:15]
  assign decompressed_io_in = _GEN_13 | _T_13; // @[el2_ifu_aln_ctl.scala 102:22]
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
  error_stall = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  f0val = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rdptr = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  q1off = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  q2off = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  q0off = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  q1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  q0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  q2 = _RAND_8[31:0];
  _RAND_9 = {2{`RANDOM}};
  _T_762 = _RAND_9[54:0];
  _RAND_10 = {2{`RANDOM}};
  _T_764 = _RAND_10[54:0];
  _RAND_11 = {2{`RANDOM}};
  _T_760 = _RAND_11[54:0];
  _RAND_12 = {1{`RANDOM}};
  f1val = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  wrptr = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  f2val = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  brdata1 = _RAND_15[11:0];
  _RAND_16 = {1{`RANDOM}};
  brdata0 = _RAND_16[11:0];
  _RAND_17 = {1{`RANDOM}};
  brdata2 = _RAND_17[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      error_stall <= 1'h0;
    end else begin
      error_stall <= error_stall_in;
    end
    if (reset) begin
      f0val <= 2'h0;
    end else begin
      f0val <= _T_481;
    end
    if (reset) begin
      rdptr <= 2'h0;
    end else begin
      rdptr <= wrptr_in;
    end
    if (reset) begin
      q1off <= 1'h0;
    end else begin
      q1off <= q1off_in;
    end
    if (reset) begin
      q2off <= 1'h0;
    end else begin
      q2off <= q2off_in;
    end
    if (reset) begin
      q0off <= 1'h0;
    end else begin
      q0off <= q0off_in;
    end
    if (reset) begin
      q1 <= 32'h0;
    end else if (qwen[1]) begin
      q1 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      q0 <= 32'h0;
    end else if (qwen[0]) begin
      q0 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      q2 <= 32'h0;
    end else if (qwen[2]) begin
      q2 <= io_ifu_fetch_data_f;
    end
    if (reset) begin
      _T_762 <= 55'h0;
    end else if (qwen[1]) begin
      _T_762 <= misc_data_in;
    end
    if (reset) begin
      _T_764 <= 55'h0;
    end else if (qwen[0]) begin
      _T_764 <= misc_data_in;
    end
    if (reset) begin
      _T_760 <= 55'h0;
    end else if (qwen[2]) begin
      _T_760 <= misc_data_in;
    end
    if (reset) begin
      f1val <= 2'h0;
    end else begin
      f1val <= f1val_in;
    end
    if (reset) begin
      wrptr <= 2'h0;
    end else begin
      wrptr <= wrptr_in;
    end
    if (reset) begin
      f2val <= 2'h0;
    end else begin
      f2val <= f2val_in;
    end
    if (reset) begin
      brdata1 <= 12'h0;
    end else if (qwen[1]) begin
      brdata1 <= brdata_in;
    end
    if (reset) begin
      brdata0 <= 12'h0;
    end else if (qwen[0]) begin
      brdata0 <= brdata_in;
    end
    if (reset) begin
      brdata2 <= 12'h0;
    end else if (qwen[2]) begin
      brdata2 <= brdata_in;
    end
  end
endmodule
