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
  val exu_flush_path_final = Input(UInt(32.W))
  val ifu_bp_hit_taken_f = Input(Bool())
  val ifu_bp_btb_target_f = Input(UInt(32.W))
  val ic_dma_active = Input(Bool())
  val ic_write_stall = Input(Bool())
  val dma_iccm_stall_any = Input(Bool())
  val dec_tlu_mrac_ff = Input(UInt(32.W))

  val ifc_fetch_addr_f = Output(UInt(32.W))
  val ifc_fetch_addr_bf = Output(UInt(32.W))
  val ifc_fetch_req_f = Output(Bool())
  val ifu_pmu_fetch_stall = Output(Bool())
  val ifc_fetch_uncacheable_bf = Output(Bool())
  val ifc_fetch_req_bf = Output(Bool())
  val ifc_fetch_req_bf_raw = Output(Bool())
  val ifc_iccm_access_bf = Output(Bool())
  val ifc_region_acc_fault_bf = Output(Bool())
  val ifc_dma_access_ok = Output(Bool())
  val testin = Input(Bool())
  val test1 = Output(UInt())
  //val test2 = Output(Bool())
})
  io.ifc_fetch_addr_f := 0.U
  io.ifc_fetch_addr_bf := 0.U
  io.ifc_fetch_req_f := 0.U
  io.ifu_pmu_fetch_stall := 0.U
  io.ifc_fetch_uncacheable_bf := 0.U
  io.ifc_fetch_req_bf := 0.U
  io.ifc_fetch_req_bf_raw := 0.U
  io.ifc_iccm_access_bf := 0.U
  io.ifc_region_acc_fault_bf := 0.U
  io.ifc_dma_access_ok := 0.U

  val fetch_addr_bf = WireInit(UInt(32.W), init = 0.U)
  val fetch_addr_next = WireInit(UInt(32.W), init = 0.U)
  val fb_write_f = WireInit(UInt(4.W), init = 0.U)
  val fb_write_ns = WireInit(UInt(4.W), init = 0.U)
  val fb_full_f_ns = WireInit(Bool(), init = 0.U)
  val fb_full_f = WireInit(Bool(), init = 0.U)
  val fb_right = WireInit(Bool(), init = 0.U)
  val fb_right2 = WireInit(Bool(), init = 0.U)
  val fb_left = WireInit(Bool(), init = 0.U)
  val wfm = WireInit(Bool(), init = 0.U)
  val idle = WireInit(Bool(), init = 0.U)
  val sel_last_addr_bf = WireInit(Bool(), init = 0.U)
  val sel_btb_addr_bf = WireInit(Bool(), init = 0.U)
  val sel_next_addr_bf = WireInit(Bool(), init = 0.U)
  val miss_f = WireInit(Bool(), init = 0.U)
  val miss_a = WireInit(Bool(), init = 0.U)
  val flush_fb = WireInit(Bool(), init = 0.U)
  val dma_iccm_stall_any_f = WireInit(Bool(), init = 0.U)
  val mb_empty_mod = WireInit(Bool(), init = 0.U)
  val goto_idle = WireInit(Bool(), init = 0.U)
  val leave_idle = WireInit(Bool(), init = 0.U)
  val fetch_bf_en = WireInit(Bool(), init = 0.U)
  val line_wrap = WireInit(Bool(), init = 0.U)
  val fetch_addr_next_1 = WireInit(Bool(), init = 0.U)

  val idle_E :: fetch_E :: stall_E :: wfm_E :: Nil = Enum(4)
  dma_iccm_stall_any_f := RegNext(io.dma_iccm_stall_any, init = 0.U)
  val dma_stall = io.ic_dma_active | dma_iccm_stall_any_f

  dma_iccm_stall_any_f := RegNext(io.dma_iccm_stall_any, init = 0.U)
  miss_a := RegNext(miss_f, init = 0.U)
  sel_last_addr_bf := ~io.exu_flush_final & (~io.ifc_fetch_req_f | ~io.ic_hit_f)
  sel_btb_addr_bf  := ~io.exu_flush_final & io.ifc_fetch_req_f & io.ifu_bp_hit_taken_f & io.ic_hit_f
  sel_next_addr_bf := ~io.exu_flush_final & io.ifc_fetch_req_f & ~io.ifu_bp_hit_taken_f & io.ic_hit_f
  fetch_addr_bf := Mux1H(Seq(io.exu_flush_final.asBool()-> Cat(io.exu_flush_path_final,0.U),
                            sel_last_addr_bf.asBool()   -> Cat(io.ifc_fetch_addr_f,0.U),
                            sel_btb_addr_bf.asBool()    -> Cat(io.ifu_bp_btb_target_f,0.U),
                            sel_next_addr_bf.asBool()   -> Cat(fetch_addr_next, 0.U)))
  fetch_addr_next := Cat((io.ifc_fetch_addr_f(31,2) + 1.U), fetch_addr_next_1)
  line_wrap := (fetch_addr_next(ICACHE_TAG_INDEX_LO) ^ io.ifc_fetch_addr_f(ICACHE_TAG_INDEX_LO))
  fetch_addr_next_1 := ~line_wrap & io.ifc_fetch_addr_f(1)
  io.ifc_fetch_req_bf_raw := ~idle
  io.ifc_fetch_req_bf :=  io.ifc_fetch_req_bf_raw & ~(fb_full_f_ns & ~(io.ifu_fb_consume2 | io.ifu_fb_consume1)) &
    ~dma_stall & ~io.ic_write_stall & ~io.dec_tlu_flush_noredir_wb


  io.test1 := io.ifc_fetch_req_bf // RegNext(miss_f, init = 0.U)//waleed// RegNext(miss_f, init = 0.U)

  /*






  io.ifc_fetch_req_bf_raw := ~idle
  io.ifc_fetch_req_bf := io.ifc_fetch_req_bf_raw & ~(fb_full_f_ns & ~(io.ifu_fb_consume2 | io.ifu_fb_consume1)) &
    ~dma_stall & ~io.ic_write_stall & ~io.dec_tlu_flush_noredir_wb




  val goto_idle = io.exu_flush_final & io.dec_tlu_flush_noredir_wb
  val mb_empty_mod = (io.ifu_ic_mb_empty | io.exu_flush_final) & ~dma_stall & ~miss_f & ~miss_a
  val leave_idle = io.exu_flush_final & ~io.dec_tlu_flush_noredir_wb & idle
  val state = RegNext(next_state, init = 0.U)
  val next_state = Wire(UInt(2.W))
  next_state := Cat((~state(1) & state(0) & miss_f & ~goto_idle) | (state(1) & ~mb_empty_mod & ~goto_idle),
    (~goto_idle & leave_idle) | (state(0) & ~goto_idle))
  val fb_right = Wire(UInt(1.W))
  fb_right := ( io.ifu_fb_consume1 & ~io.ifu_fb_consume2 & (~io.ifc_fetch_req_f | miss_f)) | // Consumed and no new fetch
    (io.ifu_fb_consume2 &  io.ifc_fetch_req_f) // Consumed 2 and new fetch

  val fb_right2 = io.ifu_fb_consume2 & (~io.ifc_fetch_req_f | miss_f)
  val fb_left = io.ifc_fetch_req_f & ~(io.ifu_fb_consume1 | io.ifu_fb_consume2) & ~miss_f
  val fb_write_ns = Wire(UInt(4.W))

  fb_write_ns := Mux1H(Seq(flush_fb->1.U(4.W),
    (~flush_fb & fb_right).asBool                           ->fb_write_f(3,1),
    (~flush_fb & fb_right2).asBool                          ->0.U,
    (~flush_fb & fb_left).asBool           -> Cat(fb_write_f,0.U),
    (~flush_fb & ~fb_right & ~fb_right2 & ~fb_left).asBool  ->fb_write_f))

  val fb_full_f_ns = fb_write_ns(3)
  val idle     = state === idle_E
  val wfm      = state === wfm_E
  val fb_full_f = RegNext(fb_full_f_ns, init = 0.U)
  val fb_write_f = RegNext(fb_write_ns, init = 0.U)
  val flush_fb = io.exu_flush_final
  val ifu_pmu_fetch_stall = wfm | (io.ifc_fetch_req_bf_raw & ( (fb_full_f &
    ~(io.ifu_fb_consume2 | io.ifu_fb_consume1 | io.exu_flush_final)) | dma_stall))

  io.test1 := dma_iccm_stall_any_f
  io.test2 := dma_stall





  io.ifc_fetch_req_f := RegNext(io.ifc_fetch_req_bf, init = 0.U)
  val ifc_fetch_addr_bf = Cat(fetch_addr_bf(31,1), 0.U)



  val (iccm_acc_in_region_bf, iccm_acc_in_range_bf) = if(ICCM_ENABLE)
    rvrangecheck(ICCM_SADR, ICCM_SIZE, ifc_fetch_addr_bf) else (0.U, 0.U)

  io.ifc_iccm_access_bf := iccm_acc_in_range_bf
  io.ifc_region_acc_fault_bf := ~iccm_acc_in_range_bf & iccm_acc_in_region_bf
  io.ifc_dma_access_ok := ( (~io.ifc_iccm_access_bf |
    (fb_full_f & ~(io.ifu_fb_consume2 | io.ifu_fb_consume1)) |
    (wfm  & ~io.ifc_fetch_req_bf) | idle ) & ~io.exu_flush_final) | dma_iccm_stall_any_f*/

}

class test extends Module with el2_lib {
  val io= IO(new Bundle() {
    val addr = Input(UInt(32.W))
    val in_range = Output(Bool())
    val in_region = Output(Bool())
  })
  val (range, region) = rvrangecheck(ICCM_SADR, ICCM_SIZE, io.addr)
  io.in_region := region
  io.in_range := range
}
object ifu_ifc extends App {
  println((new chisel3.stage.ChiselStage).emitVerilog(new el2_ifu_ifc_ctrl()))
}