package ifu
import lib._
import chisel3._
import chisel3.util._

class el2_ifu_ifc_ctrl extends Module with el2_lib {
val io = IO(new Bundle{
  val free_clk = Input(Bool())
  val active_clk = Input(Bool())
  val rst_l = Input(Bool())
  val scan_mode = Input(Bool())
  val ic_hit_f = Input(Bool())
  val ifu_ic_mb_empty = Input(Bool())
  val ifu_fb_consume1 = Input(Bool())
  val ifu_fb_consume2 = Input(Bool())
  val dec_tlu_flush_noredir_wb = Input(Bool())
  val exu_flush_final = Input(Bool())
  val exu_flush_path_final = Input(UInt(31.W))
  val ifu_bp_hit_taken_f = Input(Bool())
  val ifu_bp_btb_target_f = Input(UInt(31.W))
  val ic_dma_active = Input(Bool())
  val ic_write_stall = Input(Bool())
  val dma_iccm_stall_any = Input(Bool())
  val dec_tlu_mrac_ff = Input(UInt(32.W))

  val ifc_fetch_addr_f = Output(UInt(31.W))
  val ifc_fetch_addr_bf = Output(UInt(31.W))

  val ifc_fetch_req_f = Output(Bool())
  val ifu_pmu_fetch_stall = Output(Bool())
  val ifc_fetch_uncacheable_bf = Output(Bool())
  val ifc_fetch_req_bf = Output(Bool())
  val ifc_fetch_req_bf_raw = Output(Bool())
  val ifc_iccm_access_bf = Output(Bool())
  val ifc_region_acc_fault_bf = Output(Bool())
  val ifc_dma_access_ok = Output(Bool())
  val mb_empty_mod = Output(Bool())

})

  io.ifc_region_acc_fault_bf := 0.U
  io.ifc_dma_access_ok := 0.U
  val fetch_addr_bf = WireInit(UInt(32.W), init = 0.U)
  val fetch_addr_next = WireInit(UInt(32.W), init = 0.U)
  val fb_write_ns = WireInit(UInt(4.W), init = 0.U)
  val fb_write_f = WireInit(UInt(4.W), init = 0.U)
  val fb_full_f_ns = WireInit(Bool(), init = 0.U)
  val fb_right = WireInit(Bool(), init = 0.U)
  val fb_right2 = WireInit(Bool(), init = 0.U)
  val fb_left = WireInit(Bool(), init = 0.U)
  val wfm = WireInit(Bool(), init = 0.U)
  val idle = WireInit(Bool(), init = 0.U)
  val miss_f = WireInit(Bool(), init = 0.U)
  val miss_a = WireInit(Bool(), init = 0.U)
  val flush_fb = WireInit(Bool(), init = 0.U)
  val mb_empty_mod = WireInit(Bool(), init = 0.U)
  val goto_idle = WireInit(Bool(), init = 0.U)
  val leave_idle = WireInit(Bool(), init = 0.U)
  val fetch_bf_en = WireInit(Bool(), init = 0.U)
  val line_wrap = WireInit(Bool(), init = 0.U)
  val state = WireInit(UInt(2.W), init = 0.U)
  val dma_iccm_stall_any_f = WireInit(Bool(), init = 0.U)

  val idle_E :: fetch_E :: stall_E :: wfm_E :: Nil = Enum(4)

  val dma_stall = io.ic_dma_active | dma_iccm_stall_any_f
  dma_iccm_stall_any_f := RegNext(io.dma_iccm_stall_any, init=0.U)

  miss_a := RegNext(miss_f, init=0.U)

  val sel_last_addr_bf = !io.exu_flush_final & (!io.ifc_fetch_req_f | !io.ic_hit_f)
  val sel_btb_addr_bf  = !io.exu_flush_final & io.ifc_fetch_req_f &  io.ifu_bp_hit_taken_f & io.ic_hit_f
  val sel_next_addr_bf = !io.exu_flush_final & io.ifc_fetch_req_f & !io.ifu_bp_hit_taken_f & io.ic_hit_f

  // TODO: Make an assertion for the 1H-Mux under here
  io.ifc_fetch_addr_bf := Mux1H(Seq(io.exu_flush_final.asBool -> io.exu_flush_path_final,  // Replay PC
                            sel_last_addr_bf.asBool -> io.ifc_fetch_addr_f,         // Hold the current PC
                            sel_btb_addr_bf.asBool -> io.ifu_bp_btb_target_f,       // Take the predicted PC
                            sel_next_addr_bf.asBool -> fetch_addr_next))            // PC+4

  //io.test_out := io.ifc_fetch_addr_bf

  line_wrap := 0.U//fetch_addr_next(ICACHE_TAG_INDEX_LO) ^ io.ifc_fetch_addr_f(ICACHE_TAG_INDEX_LO)
  val fetch_addr_next_1 = Mux(line_wrap.asBool(), 0.U, io.ifc_fetch_addr_f(0))
  fetch_addr_next := Cat(io.ifc_fetch_addr_f(30,1)+1.U, 0.U) //|
    //Mux(line_wrap.asBool(), 0.U, io.ifc_fetch_addr_f(0)))

  io.ifc_fetch_req_bf_raw := ~idle

  io.ifc_fetch_req_bf :=  io.ifc_fetch_req_bf_raw & !(fb_full_f_ns & !(io.ifu_fb_consume2 | io.ifu_fb_consume1)) &
    !dma_stall & !io.ic_write_stall & !io.dec_tlu_flush_noredir_wb

  fetch_bf_en := io.exu_flush_final | io.ifc_fetch_req_f

  miss_f := io.ifc_fetch_req_f & !io.ic_hit_f & !io.exu_flush_final

  mb_empty_mod := (io.ifu_ic_mb_empty | io.exu_flush_final) & !dma_stall & !miss_f & !miss_a
  io.mb_empty_mod := mb_empty_mod
  goto_idle := io.exu_flush_final & io.dec_tlu_flush_noredir_wb

  leave_idle := io.exu_flush_final & !io.dec_tlu_flush_noredir_wb & idle

  val next_state_1 = (!state(1) & state(0) & miss_f & !goto_idle) |
    (state(1) & !mb_empty_mod & !goto_idle)

  val next_state_0 = (!goto_idle & leave_idle) | (state(0) & !goto_idle)

  state := RegNext(Cat(next_state_0, next_state_0), init = 0.U)

  flush_fb := io.exu_flush_final

  fb_right := ( io.ifu_fb_consume1 & !io.ifu_fb_consume2 & (!io.ifc_fetch_req_f | miss_f)) |
    (io.ifu_fb_consume2 &  io.ifc_fetch_req_f)

  fb_right2 := (io.ifu_fb_consume2 & (~io.ifc_fetch_req_f | miss_f))
  fb_left := io.ifc_fetch_req_f & !(io.ifu_fb_consume1 | io.ifu_fb_consume2) & !miss_f

  fb_write_ns := Mux1H(Seq(flush_fb.asBool -> 1.U(4.W),
    (!flush_fb & fb_right).asBool -> Cat(0.U(1.W), fb_write_f(3,1)),
    (!flush_fb & fb_right2).asBool -> Cat(0.U(2.W), fb_write_f(3,2)),
    (!flush_fb & fb_left).asBool -> Cat(fb_write_f(2,0), 0.U(1.W)),
    (!flush_fb & !fb_right & !fb_right2 & !fb_left).asBool -> fb_write_f(3,0)
  ))

  fb_full_f_ns := RegNext(fb_write_ns(3), init = 0.U)

  idle := state === 0.U(2.W)
  wfm := state === 3.U(2.W)

  fb_full_f_ns := fb_write_ns(3)
  val fb_full_f = RegNext(fb_full_f_ns, init = 0.U)
  fb_write_f := RegNext(fb_write_ns, 0.U)

  io.ifu_pmu_fetch_stall := wfm | (io.ifc_fetch_req_bf_raw &
    ((fb_full_f & !(io.ifu_fb_consume2 | io.ifu_fb_consume1 | io.exu_flush_final)) | dma_stall))

    val (iccm_acc_in_region_bf, iccm_acc_in_range_bf) = if(ICCM_ENABLE)
    rvrangecheck(ICCM_SADR, ICCM_SIZE, Cat(io.ifc_fetch_addr_bf,0.U))
                                                        else (0.U, 0.U)

  io.ifc_iccm_access_bf := iccm_acc_in_range_bf
  io.ifc_fetch_uncacheable_bf := ~io.dec_tlu_mrac_ff(Cat(io.ifc_fetch_addr_bf(30,27), 0.U))

  io.ifc_fetch_req_f := RegNext(io.ifc_fetch_req_bf, init=0.U)

  io.ifc_fetch_addr_f := RegEnable(io.ifc_fetch_addr_bf, init = 0.U, io.exu_flush_final|io.ifc_fetch_req_f)
}

object ifu_ifc extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_ifc_ctrl()))
}
