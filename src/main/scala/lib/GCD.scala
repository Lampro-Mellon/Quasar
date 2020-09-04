package lib

import chisel3._
import chisel3.util._

///////////////////////////////////////////////////////////////
class rvdff(val Width:Int = 1, val short:Int = 0) extends Module with RequireAsyncReset {
  val io = IO(new Bundle {
    val in = Input(UInt(Width.W))
    val out = Output(UInt())
  })
  val inter = if(short==0) RegNext(io.in, init =0.U) else io.in
  io.out := inter
}

/////////////////////////////////////////////////////////////
class caller extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(32.W))
    val out = Output(UInt())
  })
  val u0 = Module(new rvdff(32))
  io <> u0.io
}

///////////////////////////////////////////////////////////////
class reg1 extends Module with RequireAsyncReset{
  val io = IO(new Bundle{
    val in = Input(Bool())
    val out = Output(Bool())
  })

  io.out := RegNext(io.in, init = 0.U)
}

class top extends Module with RequireAsyncReset{
  val io = IO(new Bundle{
    val in = Input(Bool())
    val out = Output(Bool())
  })
  val negReset = (~reset.asBool).asAsyncReset
  val r0 = Module(new reg1)
  r0.io<>io
  r0.reset := negReset
}
///////////////////////////////////////////////////////////////
class rvbradder() extends Module {
  val io = IO(new Bundle {
    val pc = Input(UInt(31.W))
    val offset = Input(UInt(12.W))
    val dout = Output(UInt())
  })
  val inter = io.pc(11,0) +& io.offset
  val cout = inter(inter.getWidth-1)
  val pc_inc = io.pc(io.pc.getWidth-1, 12) + 1.U
  val pc_dec = io.pc(io.pc.getWidth-1, 12) - 1.U
  val sign = io.offset(io.offset.getWidth -1)

  io.dout:= Cat(Fill(19,(sign ^(~cout))) & io.pc(io.pc.getWidth-1,12) |
    (Fill(19,(~sign & cout)) & pc_inc) |
    (Fill(19,(sign & ~cout)) & pc_dec) , inter(inter.getWidth-2,0))
}

///////////////////////////////////////////////////////////////
class encoder_generator(val width:Int=4) extends Module {
  val io = IO (new Bundle {
    val in = Input (UInt(width.W))
    val out = Output (UInt(log2Ceil(width).W))
  })
  var z:Array[UInt] = new Array[UInt](width)
  for(i<- 0 until width){
    z(i) = i.U
  }
  io.out := Mux1H(io.in , z)
}

///////////////////////////////////////////////////////////////
class rvrangecheck(val CCM_SADR:Int = 0, val CCM_SIZE:Int = 128) extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(32.W))
    val in_range = Output(Bool())
    val in_region = Output(Bool())
    //val test = Output(UInt())
  })
  val start_addr = (CCM_SADR.U)(32.W)
  val region = start_addr(31,28)
  val MASK_BITS = 10+log2Ceil(CCM_SIZE)
  io.in_region := io.addr(31,28) === region
  val inter = if(CCM_SIZE == 48) io.addr(31, MASK_BITS) === start_addr(31, MASK_BITS) & ~(io.addr(MASK_BITS-1,MASK_BITS-2).andR)
  else (io.addr(31,MASK_BITS)===start_addr(31,MASK_BITS))
  io.in_range := inter
}



////////////////////////////////////////////////////////////////
class tocopy extends Module{
  val io = IO(new Bundle {
    val in1 = Input(UInt(1.W))
    val in2 = Input(UInt(1.W))
    val out = Output(UInt())
  })
  io.out := io.in1 +& io.in2
}
class exp extends Module{
  val io = IO(new Bundle{
    val in1 = Input(UInt(1.W))
    val in2 = Input(UInt(1.W))
    val out = Output(UInt())
  })

  val mod_array= new Array[tocopy](2)
  mod_array(0) = Module(new tocopy)
  mod_array(0).io.in1:=io.in1
  mod_array(0).io.in2:=io.in2
  mod_array(1) = Module(new tocopy)
  mod_array(1).io.in1:=io.in1
  mod_array(1).io.in2:=io.in2
  io.out:= mod_array(0).io.out +& mod_array(1).io.out
}
////////////////////////////////////////////////////////////////

//println((new chisel3.stage.ChiselStage).emitVerilog(new exp))