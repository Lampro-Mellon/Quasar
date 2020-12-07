package ifu
import lib._
import chisel3._
import chisel3.util._

class dec_ifc extends Bundle{
  val dec_tlu_flush_noredir_wb = Input(Bool())
  val dec_tlu_mrac_ff = Input(UInt(32.W))
  val ifu_pmu_fetch_stall = Output(Bool())
}

class exu_ifc extends Bundle{
  val exu_flush_final = Input(Bool())
  val exu_flush_path_final = Input(UInt(31.W))
}

class el2_ifu_ifc_ctl extends Module with el2_lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val free_clk = Input(Clock())
    val active_clk = Input(Clock())
    val scan_mode = Input(Bool())
    val ic_hit_f = Input(Bool())
    val ifu_ic_mb_empty = Input(Bool())
    val ifu_fb_consume1 = Input(Bool())
    val ifu_fb_consume2 = Input(Bool())
    val exu_ifc = new exu_ifc()
    val ifu_bp_hit_taken_f = Input(Bool())
    val ifu_bp_btb_target_f = Input(UInt(31.W))
    val ic_dma_active = Input(Bool())
    val ic_write_stall = Input(Bool())
    val dma_iccm_stall_any = Input(Bool())
    val dec_ifc = new dec_ifc()
    val ifc_fetch_addr_f = Output(UInt(31.W))
    val ifc_fetch_addr_bf = Output(UInt(31.W))

    val ifc_fetch_req_f = Output(Bool())

    val ifc_fetch_uncacheable_bf = Output(Bool())
    val ifc_fetch_req_bf = Output(Bool())
    val ifc_fetch_req_bf_raw = Output(Bool())
    val ifc_iccm_access_bf = Output(Bool())
    val ifc_region_acc_fault_bf = Output(Bool())
    val ifc_dma_access_ok = Output(Bool())
  })

  val fetch_addr_bf = WireInit(UInt(31.W), init = 0.U)
  val fetch_addr_next_0 = WireInit(Bool(), 0.U)
  val fetch_addr_next = WireInit(UInt(31.W), init = 0.U)
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
  dma_iccm_stall_any_f := withClock(io.free_clk) {RegNext(io.dma_iccm_stall_any, init=0.U)}

  miss_a := withClock(io.free_clk) {RegNext(miss_f, init=0.U)}

  val sel_last_addr_bf = !io.exu_ifc.exu_flush_final & (!io.ifc_fetch_req_f | !io.ic_hit_f)
  val sel_btb_addr_bf  = !io.exu_ifc.exu_flush_final & io.ifc_fetch_req_f &  io.ifu_bp_hit_taken_f & io.ic_hit_f
  val sel_next_addr_bf = !io.exu_ifc.exu_flush_final & io.ifc_fetch_req_f & !io.ifu_bp_hit_taken_f & io.ic_hit_f

  // TODO: Make an assertion for the 1H-Mux under here
  io.ifc_fetch_addr_bf := Mux1H(Seq(io.exu_ifc.exu_flush_final.asBool -> io.exu_ifc.exu_flush_path_final,  // Replay PC
        sel_last_addr_bf.asBool -> io.ifc_fetch_addr_f,         // Hold the current PC
        sel_btb_addr_bf.asBool -> io.ifu_bp_btb_target_f,       // Take the predicted PC
        sel_next_addr_bf.asBool -> fetch_addr_next))            // PC+4

  val address_upper = io.ifc_fetch_addr_f(30,1)+1.U
  fetch_addr_next_0 := !(address_upper(ICACHE_TAG_INDEX_LO-2) ^ io.ifc_fetch_addr_f(ICACHE_TAG_INDEX_LO-1)) & io.ifc_fetch_addr_f(0)

  fetch_addr_next := Cat(address_upper, fetch_addr_next_0)

  io.ifc_fetch_req_bf_raw := ~idle

  io.ifc_fetch_req_bf :=  io.ifc_fetch_req_bf_raw & !(fb_full_f_ns & !(io.ifu_fb_consume2 | io.ifu_fb_consume1)) &
    !dma_stall & !io.ic_write_stall & !io.dec_ifc.dec_tlu_flush_noredir_wb

  fetch_bf_en := io.exu_ifc.exu_flush_final | io.ifc_fetch_req_f

  miss_f := io.ifc_fetch_req_f & !io.ic_hit_f & !io.exu_ifc.exu_flush_final

  mb_empty_mod := (io.ifu_ic_mb_empty | io.exu_ifc.exu_flush_final) & !dma_stall & !miss_f & !miss_a

  goto_idle := io.exu_ifc.exu_flush_final & io.dec_ifc.dec_tlu_flush_noredir_wb

  leave_idle := io.exu_ifc.exu_flush_final & !io.dec_ifc.dec_tlu_flush_noredir_wb & idle

  val next_state_1 = (!state(1) & state(0) & miss_f & !goto_idle) |
    (state(1) & !mb_empty_mod & !goto_idle)

  val next_state_0 = (!goto_idle & leave_idle) | (state(0) & !goto_idle)

  state := withClock(io.active_clk) {RegNext(Cat(next_state_1, next_state_0), init = 0.U)}

  flush_fb := io.exu_ifc.exu_flush_final

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

  idle := state === 0.U(2.W)
  wfm := state === 3.U(2.W)

  fb_full_f_ns := fb_write_ns(3)
  val fb_full_f = withClock(io.active_clk) {RegNext(fb_full_f_ns, init = 0.U)}
  fb_write_f := withClock(io.active_clk) {RegNext(fb_write_ns, 0.U)}

  io.dec_ifc.ifu_pmu_fetch_stall := wfm | (io.ifc_fetch_req_bf_raw &
    ((fb_full_f & !(io.ifu_fb_consume2 | io.ifu_fb_consume1 | io.exu_ifc.exu_flush_final)) | dma_stall))

  val (iccm_acc_in_region_bf, iccm_acc_in_range_bf) = if(ICCM_ENABLE)
    rvrangecheck(ICCM_SADR, ICCM_SIZE, Cat(io.ifc_fetch_addr_bf,0.U))
  else (0.U, 0.U)
  io.ifc_iccm_access_bf := iccm_acc_in_range_bf
  io.ifc_dma_access_ok := ( (!io.ifc_iccm_access_bf |
    (fb_full_f & !(io.ifu_fb_consume2 | io.ifu_fb_consume1)) |
    (wfm  & !io.ifc_fetch_req_bf) | idle ) & !io.exu_ifc.exu_flush_final) | dma_iccm_stall_any_f

  io.ifc_region_acc_fault_bf := !iccm_acc_in_range_bf & iccm_acc_in_region_bf
  io.ifc_fetch_uncacheable_bf := ~io.dec_ifc.dec_tlu_mrac_ff(Cat(io.ifc_fetch_addr_bf(30,27), 0.U))

  io.ifc_fetch_req_f := withClock(io.active_clk){RegNext(io.ifc_fetch_req_bf, init=0.U)}

  io.ifc_fetch_addr_f := rvdffe(io.ifc_fetch_addr_bf, io.exu_ifc.exu_flush_final|io.ifc_fetch_req_f, clock, io.scan_mode)
}

object ifc_ctl extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_ifc_ctl()))
}