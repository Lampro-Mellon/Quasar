//package lsu
//import chisel3._
//import chisel3.util._
//import chisel3.experimental.{ChiselEnum, chiselName}
//import chisel3.util.ImplicitConversions.intToUInt
//
//
//@chiselName
//class aes extends Module{
//  val io = IO (new Bundle {
//    val byteIn = Input(UInt(8.W))
//    val byteOut = Output(UInt(8.W))
//  })
//  def ROTL(x:Int,shift:Int) ={
//    val y = (x << shift) | (x >> (8 - shift))
//  y
//  }
//  io.byteOut := ROTL(io.byteIn,3)
//  object aes extends App {
//    println((new chisel3.stage.ChiselStage).emitVerilog(new aes()))
//  }
//// def aes_sbox () ={
////
////}
///*#define ROTL8(x,shift) ((uint8_t) ((x) << (shift)) | ((x) >> (8 - (shift))))
//
//void initialize_aes_sbox(uint8_t sbox[256]) {
//  uint8_t p = 1, q = 1;
//
//  /* loop invariant: p * q == 1 in the Galois field */
//  do {
//  /* multiply p by 3 */
//  p = p ^ (p << 1) ^ (p & 0x80 ? 0x11B : 0);
//
//  /* divide q by 3 (equals multiplication by 0xf6) */
//  q ^= q << 1;
//  q ^= q << 2;
//  q ^= q << 4;
//  q ^= q & 0x80 ? 0x09 : 0;
//
//  /* compute the affine transformation */
//  uint8_t xformed = q ^ ROTL8(q, 1) ^ ROTL8(q, 2) ^ ROTL8(q, 3) ^ ROTL8(q, 4);
//
//  sbox[p] = xformed ^ 0x63;
//} while (p != 1);
//
//  /* 0 is a special case since it has no inverse */
//  sbox[0] = 0x63;*/
//}
