module test(
  input         clock,
  input         reset,
  input  [31:0] io_addr,
  output        io_in_range,
  output        io_in_region
);
  assign io_in_range = io_addr[31:28] == 4'he; // @[el2_ifu_ifc_ctrl.scala 143:15]
  assign io_in_region = io_addr[31:16] == 16'hee00; // @[el2_ifu_ifc_ctrl.scala 142:16]
endmodule
