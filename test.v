module test(
  input        clock,
  input        reset,
  input  [7:0] io_in1,
  input  [7:0] io_in2,
  input        io_in3,
  output       io_out
);
  wire  _T_1 = &io_in1; // @[el2_lib.scala 212:45]
  wire  _T_2 = ~_T_1; // @[el2_lib.scala 212:39]
  wire  _T_3 = io_in3 & _T_2; // @[el2_lib.scala 212:37]
  wire  _T_6 = io_in1[0] == io_in2[0]; // @[el2_lib.scala 213:52]
  wire  _T_7 = _T_3 | _T_6; // @[el2_lib.scala 213:41]
  wire  _T_9 = &io_in1[0]; // @[el2_lib.scala 215:36]
  wire  _T_10 = _T_9 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_13 = io_in1[1] == io_in2[1]; // @[el2_lib.scala 215:78]
  wire  _T_14 = _T_10 | _T_13; // @[el2_lib.scala 215:23]
  wire  _T_16 = &io_in1[1:0]; // @[el2_lib.scala 215:36]
  wire  _T_17 = _T_16 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_20 = io_in1[2] == io_in2[2]; // @[el2_lib.scala 215:78]
  wire  _T_21 = _T_17 | _T_20; // @[el2_lib.scala 215:23]
  wire  _T_23 = &io_in1[2:0]; // @[el2_lib.scala 215:36]
  wire  _T_24 = _T_23 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_27 = io_in1[3] == io_in2[3]; // @[el2_lib.scala 215:78]
  wire  _T_28 = _T_24 | _T_27; // @[el2_lib.scala 215:23]
  wire  _T_30 = &io_in1[3:0]; // @[el2_lib.scala 215:36]
  wire  _T_31 = _T_30 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_34 = io_in1[4] == io_in2[4]; // @[el2_lib.scala 215:78]
  wire  _T_35 = _T_31 | _T_34; // @[el2_lib.scala 215:23]
  wire  _T_37 = &io_in1[4:0]; // @[el2_lib.scala 215:36]
  wire  _T_38 = _T_37 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_41 = io_in1[5] == io_in2[5]; // @[el2_lib.scala 215:78]
  wire  _T_42 = _T_38 | _T_41; // @[el2_lib.scala 215:23]
  wire  _T_44 = &io_in1[5:0]; // @[el2_lib.scala 215:36]
  wire  _T_45 = _T_44 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_48 = io_in1[6] == io_in2[6]; // @[el2_lib.scala 215:78]
  wire  _T_49 = _T_45 | _T_48; // @[el2_lib.scala 215:23]
  wire  _T_51 = &io_in1[6:0]; // @[el2_lib.scala 215:36]
  wire  _T_52 = _T_51 & _T_3; // @[el2_lib.scala 215:41]
  wire  _T_55 = io_in1[7] == io_in2[7]; // @[el2_lib.scala 215:78]
  wire  _T_56 = _T_52 | _T_55; // @[el2_lib.scala 215:23]
  wire [7:0] _T_63 = {_T_56,_T_49,_T_42,_T_35,_T_28,_T_21,_T_14,_T_7}; // @[el2_lib.scala 216:14]
  assign io_out = _T_63[0]; // @[el2_ifu_ifc_ctrl.scala 12:10]
endmodule
