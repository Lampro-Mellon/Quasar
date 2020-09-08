class el2_lsu_ecc extends Module {
val io = IO(new Bundle{

   val lsu_c2_r_clk        	  = Input(Clock()) 
   val lsu_pkt_m           	  = Input(new el2_lsu_pkt_t)
   val lsu_pkt_r           	  = Input(new el2_lsu_pkt_t)
   val stbuf_data_any	   	  = Input(UInt(32.W))
   val dec_tlu_core_ecc_disable   = Input(UInt(1.W))
   val lsu_dccm_rden_r        	  = Input(UInt(1.W))
   val addr_in_dccm_r             = Input(UInt(1.W))
   
   val lsu_addr_r	   	  = Input(UInt(16.W))
   val end_addr_r	   	  = Input(UInt(16.W))
   val lsu_addr_m	   	  = Input(UInt(16.W))
   val end_addr_m	   	  = Input(UInt(16.W))
   
   val dccm_rdata_hi_r   	  = Input(UInt(32.W))
   val dccm_rdata_lo_r   	  = Input(UInt(32.W))
   val dccm_rdata_hi_m   	  = Input(UInt(32.W))
   val dccm_rdata_lo_m   	  = Input(UInt(32.W))
   
   val dccm_data_ecc_hi_r         = Input(UInt(7.W))
   val dccm_data_ecc_lo_r         = Input(UInt(7.W))
   val dccm_data_ecc_hi_m         = Input(UInt(7.W))
   val dccm_data_ecc_lo_m         = Input(UInt(7.W))
   
   val ld_single_ecc_error_r      = Input(UInt(1.W))
   val ld_single_ecc_error_r_ff   = Input(UInt(1.W))
   val lsu_dccm_rden_m            = Input(UInt(1.W))
   val addr_in_dccm_m             = Input(UInt(1.W))

   val dma_dccm_wen               = Input(UInt(1.W))
   val dma_dccm_wdata_lo          = Input(UInt(32.W))
   val dma_dccm_wdata_hi          = Input(UInt(32.W))

   val scan_mode                  = Input(UInt(1.W))

 //Outputs  
   val sec_data_hi_r   	          = Output(UInt(32.W))
   val sec_data_lo_r   	          = Output(UInt(32.W))
   val sec_data_hi_m   	          = Output(UInt(32.W))
   val sec_data_lo_m   	          = Output(UInt(32.W))
   val sec_data_hi_r_ff   	  = Output(UInt(32.W))
   val sec_data_lo_r_ff   	  = Output(UInt(32.W))
   
   val dma_dccm_wdata_ecc_hi      = Output(UInt(7.W))
   val dma_dccm_wdata_ecc_lo      = Output(UInt(7.W))
   val stbuf_ecc_any              = Output(UInt(7.W))
   val sec_data_ecc_hi_r_ff       = Output(UInt(7.W))
   val sec_data_ecc_lo_r_ff       = Output(UInt(7.W))
   
   val single_ecc_error_hi_r      = Output(UInt(1.W))
   val single_ecc_error_lo_r      = Output(UInt(1.W))
   val lsu_single_ecc_error_r     = Output(UInt(1.W))
   val lsu_double_ecc_error_r     = Output(UInt(1.W))
   val lsu_single_ecc_error_m     = Output(UInt(1.W))
   val lsu_double_ecc_error_m     = Output(UInt(1.W))
})    
   val is_ldst_r                  = WireInit(0.U(1.W))
   val is_ldst_hi_any             = WireInit(0.U(1.W))
   val is_ldst_lo_any             = WireInit(0.U(1.W))
   val dccm_wdata_hi_any          = WireInit(0.U(32.W))
   val dccm_wdata_lo_any          = WireInit(0.U(32.W))
   val dccm_rdata_hi_any          = WireInit(0.U(32.W))
   val dccm_rdata_lo_any          = WireInit(0.U(32.W))
   val sec_data_hi_any            = WireInit(0.U(32.W))
   val sec_data_lo_any            = WireInit(0.U(32.W))
   val dccm_wdata_ecc_hi_any      = WireInit(0.U(7.W))
   val dccm_wdata_ecc_lo_any      = WireInit(0.U(7.W))
   val dccm_data_ecc_hi_any       = WireInit(0.U(7.W))
   val dccm_data_ecc_lo_any       = WireInit(0.U(7.W))
   
   val single_ecc_error_hi_any	  = WireInit(0.U(1.W))
   val single_ecc_error_lo_any	  = WireInit(0.U(1.W))
   val double_ecc_error_hi_any	  = WireInit(0.U(1.W))
   val double_ecc_error_lo_any	  = WireInit(0.U(1.W))
   val double_ecc_error_hi_m	  = WireInit(0.U(1.W))
   val double_ecc_error_lo_m	  = WireInit(0.U(1.W))
   val double_ecc_error_hi_r	  = WireInit(0.U(1.W))
   val double_ecc_error_lo_r	  = WireInit(0.U(1.W))
   val ecc_out_hi_nc              = WireInit(0.U(7.W))
   val ecc_out_lo_nc              = WireInit(0.U(7.W))

   io.sec_data_hi_r           :=0.U       
   io.sec_data_lo_r   	      :=0.U   
   io.sec_data_hi_m   	      :=0.U    
   io.sec_data_lo_m   	      :=0.U   
   io.sec_data_hi_r_ff        :=0.U   
   io.sec_data_lo_r_ff        :=0.U 
   
   io.dma_dccm_wdata_ecc_hi   :=0.U       
   io.dma_dccm_wdata_ecc_lo   :=0.U    
   io.stbuf_ecc_any           :=0.U   
   io.sec_data_ecc_hi_r_ff    :=0.U     
   io.sec_data_ecc_lo_r_ff    :=0.U    
   
   io.single_ecc_error_hi_r   :=0.U     
   io.single_ecc_error_lo_r   :=0.U   
   io.lsu_single_ecc_error_r  :=0.U   
   io.lsu_double_ecc_error_r  :=0.U     
   io.lsu_single_ecc_error_m  :=0.U    
   io.lsu_double_ecc_error_m  :=0.U  
}

