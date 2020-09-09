import chisel3._
import chisel3.util._
import lib._
import include._
import snapshot._

class el2_lsu_clkdomain extends Module {
   val io = IO (new Bundle {
   /* Implicit
   val clk                 = Input(Clock())     // clock
   val rst_l               = Input(1.W)         // reset
*/
   val free_clk            = Input(Clock())     // clock
   // Inputs
   val clk_override        = Input(Bool())           // chciken bit to turn off clock gating
   val addr_in_dccm_m      = Input(Bool())         // address in dccm
   val dma_dccm_req        = Input(Bool())           // dma is active
   val ldst_stbuf_reqvld_r = Input(Bool())    // allocating in to the store queue

   val stbuf_reqvld_any          = Input(Bool())       // stbuf is draining
   val stbuf_reqvld_flushed_any  = Input(Bool())// instruction going to stbuf is flushed
   val lsu_busreq_r              = Input(Bool())           // busreq in r
   val lsu_bus_buffer_pend_any   = Input(Bool())// bus buffer has a pending bus entry
   val lsu_bus_buffer_empty_any  = Input(Bool())// external bus buffer is empty
   val lsu_stbuf_empty_any       = Input(Bool())    // stbuf is empty

   val lsu_bus_clk_en            = Input(Bool())         // bus clock enable

   val lsu_p      = new el2_lsu_pkt_t              // lsu packet in decode
   val lsu_pkt_d  = new el2_lsu_pkt_t              // lsu packet in d
   val lsu_pkt_m  = new el2_lsu_pkt_t              // lsu packet in m
   val lsu_pkt_r  = new el2_lsu_pkt_t              // lsu packet in r

   // Outputs
   val lsu_c1_m_clk              = Output(Clock())          // m pipe single pulse clock
   val lsu_c1_r_clk              = Output(Clock())          // r pipe single pulse clock

   val lsu_c2_m_clk              = Output(Clock())          // m pipe double pulse clock
   val lsu_c2_r_clk              = Output(Clock())          // r pipe double pulse clock

   val lsu_store_c1_m_clk        = Output(Clock())          // store in m
   val lsu_store_c1_r_clk        = Output(Clock())          // store in r

   val lsu_stbuf_c1_clk          = Output(Clock())
   val lsu_bus_obuf_c1_clk       = Output(Clock())          // ibuf clock
   val lsu_bus_ibuf_c1_clk       = Output(Clock())          // ibuf clock
   val lsu_bus_buf_c1_clk        = Output(Clock())          // ibuf clock
   val lsu_busm_clk              = Output(Clock())          // bus clock

   val lsu_free_c2_clk           = Output(Clock())

   val scan_mode                 = Input(Bool())
})

   val lsu_c1_d_clken         = 0.U
   val lsu_c1_m_clken         = 0.U
   val lsu_c1_r_clken         = 0.U
   val lsu_c2_m_clken         = 0.U
   val lsu_c2_r_clken         = 0.U
   val lsu_c1_d_clken_q       = 0.U
   val lsu_c1_m_clken_q       = 0.U
   val lsu_c1_r_clken_q       = 0.U
   val lsu_store_c1_m_clken   = 0.U
   val lsu_store_c1_r_clken   = 0.U


   val lsu_stbuf_c1_clken     = 0.U
   val lsu_bus_ibuf_c1_clken  = 0.U
   val lsu_bus_obuf_c1_clken  = 0.U
   val lsu_bus_buf_c1_clken   = 0.U

   val lsu_free_c1_clken      = 0.U
   val lsu_free_c1_clken_q    = 0.U
   val lsu_free_c2_clken      = 0.U

   //-------------------------------------------------------------------------------------------
   // Clock Enable Logic
   //-------------------------------------------------------------------------------------------

   lsu_c1_d_clken          := lsu_p.valid     | io.dma_dccm_req     | io.clk_override 
   lsu_c1_m_clken          := lsu_pkt_d.valid | lsu_c1_d_clken_q | io.clk_override 
   lsu_c1_r_clken          := lsu_pkt_m.valid | lsu_c1_m_clken_q | io.clk_override 

   lsu_c2_m_clken          := lsu_c1_m_clken | lsu_c1_m_clken_q | io.clk_override 
   lsu_c2_r_clken          := lsu_c1_r_clken | lsu_c1_r_clken_q | io.clk_override 

   lsu_store_c1_m_clken    := ((lsu_c1_m_clken & lsu_pkt_d.store) | io.clk_override)  
   lsu_store_c1_r_clken    := ((lsu_c1_r_clken & lsu_pkt_m.store) | io.clk_override)  

   lsu_stbuf_c1_clken      := io.ldst_stbuf_reqvld_r | io.stbuf_reqvld_any | io.stbuf_reqvld_flushed_any | io.clk_override 
   lsu_bus_ibuf_c1_clken   := io.lsu_busreq_r | io.clk_override 
   lsu_bus_obuf_c1_clken   := (io.lsu_bus_buffer_pend_any | io.lsu_busreq_r | io.clk_override) & io.lsu_bus_clk_en 
   lsu_bus_buf_c1_clken    := ~io.lsu_bus_buffer_empty_any | io.lsu_busreq_r | io.clk_override 

   lsu_free_c1_clken := (lsu_p.valid | lsu_pkt_d.valid | lsu_pkt_m.valid | lsu_pkt_r.valid) | ~io.lsu_bus_buffer_empty_any | ~io.lsu_stbuf_empty_any | io.clk_override 
   lsu_free_c2_clken := lsu_free_c1_clken | lsu_free_c1_clken_q | io.clk_override 
/*
    // Flops
   rvdff #(1) lsu_free_c1_clkenff (.din(lsu_free_c1_clken), dout(lsu_free_c1_clken_q), clk(free_clk), *) 

   rvdff #(1) lsu_c1_d_clkenff (.din(lsu_c1_d_clken), dout(lsu_c1_d_clken_q), clk(lsu_free_c2_clk), *) 
   rvdff #(1) lsu_c1_m_clkenff (.din(lsu_c1_m_clken), dout(lsu_c1_m_clken_q), clk(lsu_free_c2_clk), *) 
   rvdff #(1) lsu_c1_r_clkenff (.din(lsu_c1_r_clken), dout(lsu_c1_r_clken_q), clk(lsu_free_c2_clk), *) 

   // Clock Headers
   rvoclkhdr lsu_c1m_cgc ( .en(lsu_c1_m_clken), l1clk(lsu_c1_m_clk), * ) 
   rvoclkhdr lsu_c1r_cgc ( .en(lsu_c1_r_clken), l1clk(lsu_c1_r_clk), * ) 

   rvoclkhdr lsu_c2m_cgc ( .en(lsu_c2_m_clken), l1clk(lsu_c2_m_clk), * ) 
   rvoclkhdr lsu_c2r_cgc ( .en(lsu_c2_r_clken), l1clk(lsu_c2_r_clk), * ) 

   rvoclkhdr lsu_store_c1m_cgc (.en(lsu_store_c1_m_clken), l1clk(lsu_store_c1_m_clk), *) 
   rvoclkhdr lsu_store_c1r_cgc (.en(lsu_store_c1_r_clken), l1clk(lsu_store_c1_r_clk), *) 

   rvoclkhdr lsu_stbuf_c1_cgc ( .en(lsu_stbuf_c1_clken), l1clk(lsu_stbuf_c1_clk), * ) 
   rvoclkhdr lsu_bus_ibuf_c1_cgc ( .en(lsu_bus_ibuf_c1_clken), l1clk(lsu_bus_ibuf_c1_clk), * ) 
   rvclkhdr  lsu_bus_obuf_c1_cgc ( .en(lsu_bus_obuf_c1_clken), l1clk(lsu_bus_obuf_c1_clk), * ) 
   rvoclkhdr lsu_bus_buf_c1_cgc  ( .en(lsu_bus_buf_c1_clken) =
   val  .l1clk(lsu_bus_buf_c1_clk), * ) 

   rvclkhdr  lsu_busm_cgc (.en(lsu_bus_clk_en), l1clk(lsu_busm_clk), *) 

   rvoclkhdr lsu_free_cgc (.en(lsu_free_c2_clken), l1clk(lsu_free_c2_clk), *) 

*/
}

