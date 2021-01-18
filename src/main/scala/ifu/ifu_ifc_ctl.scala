package ifu
import lib._
import exu._
import include._
import chisel3._
import chisel3.util._

class ifu_ifc_ctl extends Module with lib with RequireAsyncReset {
  val io = IO(new Bundle{
    val exu_flush_final = Input(Bool()) // Miss Prediction for EXU
    val exu_flush_path_final = Input(UInt(31.W)) // Replay PC
    val free_l2clk = Input(Clock())
   // val active_clk = Input(Clock())
    val scan_mode = Input(Bool())
    val ic_hit_f = Input(Bool())
    val ifu_ic_mb_empty = Input(Bool()) // Miss buffer of mem-ctl empty
    val ifu_fb_consume1 = Input(Bool()) // Consume 1 fetch from FP
    val ifu_fb_consume2 = Input(Bool()) // Consume 2 fetch from FP
    val ifu_bp_hit_taken_f = Input(Bool()) // Branch taken from BP
    val ifu_bp_btb_target_f = Input(UInt(31.W)) // Predicted PC
    val ic_dma_active = Input(Bool()) // DMA for I$
    val ic_write_stall = Input(Bool())
    val dec_ifc = new dec_ifc() // DEC to IFC Bundle
    val dma_ifc = new dma_ifc() // DMA to IFC Bundle
    val ifc_fetch_addr_f = Output(UInt(31.W)) // Previous PC
    val ifc_fetch_addr_bf = Output(UInt(31.W)) // Next PC

    val ifc_fetch_req_f = Output(Bool()) // Fetch State

    val ifc_fetch_uncacheable_bf = Output(Bool()) // Fetch req for uncacheable
    val ifc_fetch_req_bf = Output(Bool())
    val ifc_fetch_req_bf_raw = Output(Bool())
    val ifc_iccm_access_bf = Output(Bool()) // ICCM access
    val ifc_region_acc_fault_bf = Output(Bool()) // Region access fault
    val ifc_dma_access_ok = Output(Bool()) // DMA accesing
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

  dma_iccm_stall_any_f := rvdffie(io.dma_ifc.dma_iccm_stall_any,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
  miss_a := rvdffie(miss_f,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
   if(BTB_ENABLE) {
      val sel_last_addr_bf = !io.exu_flush_final & (!io.ifc_fetch_req_f | !io.ic_hit_f)
      val sel_btb_addr_bf = !io.exu_flush_final & io.ifc_fetch_req_f & io.ifu_bp_hit_taken_f & io.ic_hit_f
      val sel_next_addr_bf = !io.exu_flush_final & io.ifc_fetch_req_f & !io.ifu_bp_hit_taken_f & io.ic_hit_f
   // Next PC calculation
   io.ifc_fetch_addr_bf := Mux1H(Seq(io.exu_flush_final.asBool -> io.exu_flush_path_final, // Replay PC
     sel_last_addr_bf.asBool -> io.ifc_fetch_addr_f, // Hold the current PC
     sel_btb_addr_bf.asBool -> io.ifu_bp_btb_target_f, // Take the predicted PC
     sel_next_addr_bf.asBool -> fetch_addr_next)) // PC+4
 }
  else{
     val sel_last_addr_bf = !io.exu_flush_final & (!io.ifc_fetch_req_f | !io.ic_hit_f)
     val sel_next_addr_bf = !io.exu_flush_final & io.ifc_fetch_req_f & io.ic_hit_f
   // Next PC calculation
   io.ifc_fetch_addr_bf := Mux1H(Seq(io.exu_flush_final.asBool -> io.exu_flush_path_final, // Replay PC
     sel_last_addr_bf.asBool -> io.ifc_fetch_addr_f, // Hold the current PC
     sel_next_addr_bf.asBool -> fetch_addr_next)) // PC+4
  }
  val address_upper = io.ifc_fetch_addr_f(30,1)+1.U
  fetch_addr_next_0 := !(address_upper(ICACHE_TAG_INDEX_LO-2) ^ io.ifc_fetch_addr_f(ICACHE_TAG_INDEX_LO-1)) & io.ifc_fetch_addr_f(0)

  // Next PC to check from which boundary it is comming from
  fetch_addr_next := Cat(address_upper, fetch_addr_next_0)

  io.ifc_fetch_req_bf_raw := ~idle

  io.ifc_fetch_req_bf :=  io.ifc_fetch_req_bf_raw & !(fb_full_f_ns & !(io.ifu_fb_consume2 | io.ifu_fb_consume1)) &
    !dma_stall & !io.ic_write_stall & !io.dec_ifc.dec_tlu_flush_noredir_wb

  fetch_bf_en := io.exu_flush_final | io.ifc_fetch_req_f

  miss_f := io.ifc_fetch_req_f & !io.ic_hit_f & !io.exu_flush_final

  mb_empty_mod := (io.ifu_ic_mb_empty | io.exu_flush_final) & !dma_stall & !miss_f & !miss_a

  goto_idle := io.exu_flush_final & io.dec_ifc.dec_tlu_flush_noredir_wb

  leave_idle := io.exu_flush_final & !io.dec_ifc.dec_tlu_flush_noredir_wb & idle

  val next_state_1 = (!state(1) & state(0) & miss_f & !goto_idle) |
    (state(1) & !mb_empty_mod & !goto_idle)

  val next_state_0 = (!goto_idle & leave_idle) | (state(0) & !goto_idle)

  state := rvdffie(Cat(next_state_1, next_state_0),io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  flush_fb := io.exu_flush_final

  // Checking FP for PMU
  fb_right := ( io.ifu_fb_consume1 & !io.ifu_fb_consume2 & (!io.ifc_fetch_req_f | miss_f)) |
    (io.ifu_fb_consume2 &  io.ifc_fetch_req_f)

  fb_right2 := (io.ifu_fb_consume2 & (~io.ifc_fetch_req_f | miss_f))
  fb_left := io.ifc_fetch_req_f & !(io.ifu_fb_consume1 | io.ifu_fb_consume2) & !miss_f

  // Shifting the fb to remember the FP state
  fb_write_ns := Mux1H(Seq(flush_fb.asBool -> 1.U(4.W),
    (!flush_fb & fb_right).asBool -> Cat(0.U(1.W), fb_write_f(3,1)),
    (!flush_fb & fb_right2).asBool -> Cat(0.U(2.W), fb_write_f(3,2)),
    (!flush_fb & fb_left).asBool -> Cat(fb_write_f(2,0), 0.U(1.W)),
    (!flush_fb & !fb_right & !fb_right2 & !fb_left).asBool -> fb_write_f(3,0)
  ))

  idle := state === 0.U(2.W)
  wfm := state === 3.U(2.W)

  fb_full_f_ns := fb_write_ns(3)
  val fb_full_f = rvdffie(fb_full_f_ns,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)
  fb_write_f   := rvdffie(fb_write_ns,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  io.dec_ifc.ifu_pmu_fetch_stall := wfm | (io.ifc_fetch_req_bf_raw &
    ((fb_full_f & !(io.ifu_fb_consume2 | io.ifu_fb_consume1 | io.exu_flush_final)) | dma_stall))
  // Checking the next PC range and its region to access the ICCM or I$
  val (iccm_acc_in_region_bf, iccm_acc_in_range_bf) = if(ICCM_ENABLE)
    rvrangecheck(ICCM_SADR, ICCM_SIZE, Cat(io.ifc_fetch_addr_bf,0.U))
  else (0.U, 0.U)
  io.ifc_iccm_access_bf := iccm_acc_in_range_bf
  io.ifc_dma_access_ok := ( (!io.ifc_iccm_access_bf |
    (fb_full_f & !(io.ifu_fb_consume2 | io.ifu_fb_consume1)) |
    (wfm  & !io.ifc_fetch_req_bf) | idle ) & !io.exu_flush_final) | dma_iccm_stall_any_f

  io.ifc_region_acc_fault_bf := !iccm_acc_in_range_bf & iccm_acc_in_region_bf
  io.ifc_fetch_uncacheable_bf := ~io.dec_ifc.dec_tlu_mrac_ff(Cat(io.ifc_fetch_addr_bf(30,27), 0.U))

  io.ifc_fetch_req_f := rvdffie(io.ifc_fetch_req_bf,io.free_l2clk,reset.asAsyncReset(),io.scan_mode)

  io.ifc_fetch_addr_f := rvdffpcie(io.ifc_fetch_addr_bf, io.exu_flush_final|io.ifc_fetch_req_f,reset.asAsyncReset(), clock, io.scan_mode)
}
object ifc extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new ifu_ifc_ctl()))
}