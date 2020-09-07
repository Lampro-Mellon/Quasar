class  el2_lsu_lsc_ctl extends MultiIOModule  
{
   //val rst_l = IO(Input(1.W)) //implicit
   val lsu_c1_m_clk = IO(Input(Clock()))
   val lsu_c1_r_clk = IO(Input(Clock()))
   val lsu_c2_m_clk = IO(Input(Clock()))
   val lsu_c2_r_clk = IO(Input(Clock()))
   val lsu_store_c1_m_clk = IO(Input(Clock()))

   val lsu_ld_data_r = IO(Input(UInt(32.W)))                   //DCCM data
   val lsu_ld_data_corr_r = IO(Input(UInt(32.W)))         // ECC corrected data
   val lsu_single_ecc_error_r = IO(Input(UInt(1.W)))
   val lsu_double_ecc_error_r = IO(Input(UInt(1.W))) 

   val lsu_ld_data_m = IO(Input(UInt(32.W))) 
   val lsu_single_ecc_error_m = IO(Input(UInt(1.W))) 
   val lsu_double_ecc_error_m = IO(Input(UInt(1.W))) 

   val flush_m_up = IO(Input(UInt(1.W))) 
   val flush_r = IO(Input(UInt(1.W))) 

   val exu_lsu_rs1_d = IO(Input(UInt(32.W)))         // address
   val exu_lsu_rs2_d = IO(Input(UInt(32.W)))         // store data

   val lsu_p = IO(Input(new el2_lsu_pkt_t()))        // lsu control packet //coming from decode
   val dec_lsu_valid_raw_d = IO(Input(UInt(1.W)))   // Raw valid for address computation
   val dec_lsu_offset_d = IO(Input(UInt(12.W))) 

   val picm_mask_data_m = IO(Input(UInt(32.W))) 
   val bus_read_data_m = IO(Input(UInt(32.W)))  //coming from bus interface

   val lsu_result_m = IO(Output(UInt(32.W)) )
   val lsu_result_corr_r = IO(Output(UInt(32.W)))     // This is the ECC corrected data going to RF
   
    // lsu address down the pipe
   val lsu_addr_d = IO(Output(UInt(32.W)))
   val lsu_addr_m = IO(Output(UInt(32.W)))
   val lsu_addr_r = IO(Output(UInt(32.W)))
   
    // lsu address down the pipe - needed to check unaligned
   val end_addr_d = IO(Output(UInt(32.W)))
   val end_addr_m = IO(Output(UInt(32.W)))
   val end_addr_r = IO(Output(UInt(32.W)))
   
    // store data down the pipe
   val store_data_m = IO(Output(UInt(32.W)))
    
   val dec_tlu_mrac_ff = IO(Output(UInt(32.W))) // CSR read
        
   val lsu_exc_m = IO(Output(UInt(1.W)))
   val is_sideeffects_m  = IO(Output(UInt(1.W)))
   val lsu_commit_r = IO(Output(UInt(1.W)))
   val lsu_single_ecc_error_incr = IO(Output(UInt(1.W)))
   val lsu_error_pkt_r = IO(Output(new el2_lsu_error_pkt_t())) 

   val lsu_fir_addr  = IO(Output(UInt(32.W))) //(31:1) in sv      // fast interrupt address TBD
   val lsu_fir_error = IO(Output(UInt(2.W)))              // Error during fast interrupt lookup TBD

   // address in dccm/pic/external per pipe stage
   val addr_in_dccm_d = IO(Output(UInt(1.W)))
   val addr_in_dccm_m = IO(Output(UInt(1.W)))
   val addr_in_dccm_r = IO(Output(UInt(1.W)))

   val addr_in_pic_d  = IO(Output(UInt(1.W)))
   val addr_in_pic_m  = IO(Output(UInt(1.W)))
   val addr_in_pic_r  = IO(Output(UInt(1.W)))

   val addr_external_m = IO(Output(UInt(1.W)))

   // DMA slave
   val dma_dccm_req  = IO(Input(UInt(1.W)))
   val dma_mem_addr  = IO(Input(UInt(32.W))) 
   val dma_mem_sz    = IO(Input(UInt(3.W))) 
   val dma_mem_write = IO(Input(UInt(1.W))) 
   val dma_mem_wdata = IO(Input(UInt(64.W))) 

    
    
    
   // Store buffer related signals
   val lsu_pkt_d = new el2_lsu_pkt_t()
   val lsu_pkt_m = new el2_lsu_pkt_t()
   val lsu_pkt_r = new el2_lsu_pkt_t()

   val scan_mode    = IO(Input(UInt(1.W))) 
   val dma_pkt_d    = new el2_lsu_pkt_t()
   val lsu_pkt_m_in = new el2_lsu_pkt_t()
   val lsu_pkt_r_in = new el2_lsu_pkt_t()
   val lsu_error_pkt_m = new el2_lsu_error_pkt_t()

   val lsu_rs1_d    = Mux(dec_lsu_valid_raw_d.asBool,dec_lsu_valid_raw_d, dec_lsu_valid_raw_d) 
   val lsu_offset_d = dec_lsu_offset_d(11,0) & Fill(12,dec_lsu_valid_raw_d)
    
   val rs1_d_raw = lsu_rs1_d
   val offset_d  = lsu_offset_d
 
   val rs1_d = Mux(lsu_pkt_d.load_ldst_bypass_d.asBool,lsu_result_m,rs1_d_raw)
   
   val lsadder = new rvlsadder()
    lsadder.io.rs1         := rs1_d
    lsadder.io.offset      := offset_d
    val full_addr_d         =  lsadder.io.dout
    
   
    
    
    
}
