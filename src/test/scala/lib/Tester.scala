//package lib
//import java.io.File
//
//import chisel3.iotesters
//import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
//
//class Tester(c: encoder_generator) extends PeekPokeTester(c) {
//
//  poke(c.io.in, 1)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 2)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 4)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 8)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 16)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 32)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 64)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//  poke(c.io.in, 128)
//  println(s"output at ${peek(c.io.in)} = ${peek(c.io.out)}")
//}
//
//object GCDMain extends App {
//  iotesters.Driver.execute(args, () => new encoder_generator(8)) {
//    c => new Tester(c)
//  }
//}
