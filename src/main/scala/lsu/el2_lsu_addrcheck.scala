class el2_lsu_addrcheck extends MultiIOModule
{
   val lsu_c2_m_clk        = IO(Input(Clock()))
    //val rst_l = IO(Input(1.W)) //implicit 
   val start_addr_d        = IO(Input(UInt(32.W)))
   val end_addr_d          = IO(Input(UInt(32.W)))
   val lsu_pkt_d           = IO(Input(new el2_lsu_pkt_t))
   val dec_tlu_mrac_ff     = IO(Input(UInt(32.W)))
   val rs1_region_d        = IO(Input(UInt(4.W)))
   val rs1_d               = IO(Input(UInt(32.W)))
   val is_sideeffects_m    = IO(Output(UInt(1.W)))
   val addr_in_dccm_d      = IO(Output(UInt(1.W)))
   val addr_in_pic_d       = IO(Output(UInt(1.W)))
   val addr_external_d     = IO(Output(UInt(1.W)))
   val access_fault_d      = IO(Output(UInt(1.W))) 
   val misaligned_fault_d  = IO(Output(UInt(1.W)))
   val exc_mscause_d       = IO(Output(UInt(4.W)))
   val fir_dccm_access_error_d     = IO(Output(UInt(1.W)))
   val fir_nondccm_access_error_d  = IO(Output(UInt(1.W)))
   val scan_mode           = IO(Input(UInt(1.W)))
    
    val start_addr_in_dccm_d         = WireInit(0.U(1.W))
    val start_addr_in_dccm_region_d  = WireInit(0.U(1.W))
    val end_addr_in_dccm_d           = WireInit(0.U(1.W))
    val end_addr_in_dccm_region_d    = WireInit(0.U(1.W))
    
    //DCCM check
    // Start address check
    if(pt1.DCCM_ENABLE==1){  // Gen_dccm_enable
       val start_addr_dccm_rangecheck = Module(new rvrangecheck(pt1.DCCM_SADR,pt1.DCCM_SIZE))
           start_addr_dccm_rangecheck.io.addr  := start_addr_d 
           start_addr_in_dccm_d                := start_addr_dccm_rangecheck.io.in_range
           start_addr_in_dccm_region_d         := start_addr_dccm_rangecheck.io.in_region
         
    // End address check
       val end_addr_dccm_rangecheck   = Module(new rvrangecheck(pt1.DCCM_SADR,pt1.DCCM_SIZE))
           end_addr_dccm_rangecheck.io.addr    := end_addr_d
           end_addr_in_dccm_d                  := end_addr_dccm_rangecheck.io.in_range
           end_addr_in_dccm_region_d           := end_addr_dccm_rangecheck.io.in_region
    }
    else{  //Gen_dccm_disable 
            start_addr_in_dccm_d           := 0.U
            start_addr_in_dccm_region_d    := 0.U
            end_addr_in_dccm_d             := 0.U
            end_addr_in_dccm_region_d      := 0.U
    }
    
    val addr_in_iccm  = WireInit(0.U(1.W))
    if(pt1.ICCM_ENABLE == 1){  //check_iccm
        addr_in_iccm := (start_addr_d(31,28) === pt.ICCM_REGION)
    }
    else{ 
        addr_in_iccm := 1.U
    }
    

  //PIC memory check
  //start address check 
    val start_addr_pic_rangecheck = Module(new rvrangecheck(pt1.PIC_BASE_ADDR,pt1.PIC_SIZE)) 
    start_addr_pic_rangecheck.io.addr := start_addr_d(31,0)
    val start_addr_in_pic_d            = start_addr_pic_rangecheck.io.in_range
    val start_addr_in_pic_region_d     = start_addr_pic_rangecheck.io.in_region
    
  //End address check
    val end_addr_pic_rangecheck = Module(new rvrangecheck(pt1.PIC_BASE_ADDR,pt1.PIC_SIZE)) 
    end_addr_pic_rangecheck.io.addr := end_addr_d(31,0)
    val end_addr_in_pic_d            = end_addr_pic_rangecheck.io.in_range
    val end_addr_in_pic_region_d     = end_addr_pic_rangecheck.io.in_region
      
    val start_addr_dccm_or_pic = start_addr_in_dccm_region_d | start_addr_in_pic_region_d
    val base_reg_dccm_or_pic   = (rs1_region_d(3,0) === pt.DCCM_REGION) | (rs1_region_d(3,0) === pt.PIC_REGION) //base region
    addr_in_dccm_d            := (start_addr_in_dccm_d & end_addr_in_dccm_d)
    addr_in_pic_d             := (start_addr_in_pic_d & end_addr_in_pic_d)

    addr_external_d           := ~(start_addr_in_dccm_region_d | start_addr_in_pic_region_d); //if start address does not belong to dccm/pic
    val csr_idx                = Cat(start_addr_d(31,28),"b1".U)
    val is_sideeffects_d       = dec_tlu_mrac_ff(csr_idx) & ~(start_addr_in_dccm_region_d | start_addr_in_pic_region_d | addr_in_iccm) & lsu_pkt_d.valid & (lsu_pkt_d.store | lsu_pkt_d.load)  //every region has the 2 LSB indicating ( 1: sideeffects/no_side effects, and 0: cacheable ). Ignored in internal regions
    val is_aligned_d           = (lsu_pkt_d.word & (start_addr_d(1,0) === "b00".U)) | (lsu_pkt_d.half & (start_addr_d(0) === "b0".U)) | lsu_pkt_d.by
    

    val non_dccm_access_ok     = (~(Cat(pt.DATA_ACCESS_ENABLE0,pt.DATA_ACCESS_ENABLE1,pt.DATA_ACCESS_ENABLE2,pt.DATA_ACCESS_ENABLE3,
                                    pt.DATA_ACCESS_ENABLE4,pt.DATA_ACCESS_ENABLE5,pt.DATA_ACCESS_ENABLE6,pt.DATA_ACCESS_ENABLE7)).orR) |
(((pt.DATA_ACCESS_ENABLE0 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK0)) === (pt.DATA_ACCESS_ADDR0 | pt.DATA_ACCESS_MASK0)) | //0111
  (pt.DATA_ACCESS_ENABLE1 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK1)) === (pt.DATA_ACCESS_ADDR1 | pt.DATA_ACCESS_MASK1)) | //1111
  (pt.DATA_ACCESS_ENABLE2 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK2)) === (pt.DATA_ACCESS_ADDR2 | pt.DATA_ACCESS_MASK2)) | //1011
  (pt.DATA_ACCESS_ENABLE3 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK3)) === (pt.DATA_ACCESS_ADDR3 | pt.DATA_ACCESS_MASK3)) | //1000
  (pt.DATA_ACCESS_ENABLE4 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK4)) === (pt.DATA_ACCESS_ADDR4 | pt.DATA_ACCESS_MASK4)) |
  (pt.DATA_ACCESS_ENABLE5 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK5)) === (pt.DATA_ACCESS_ADDR5 | pt.DATA_ACCESS_MASK5)) |
  (pt.DATA_ACCESS_ENABLE6 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK6)) === (pt.DATA_ACCESS_ADDR6 | pt.DATA_ACCESS_MASK6)) |
  (pt.DATA_ACCESS_ENABLE7 & ((start_addr_d(31,0) | pt.DATA_ACCESS_MASK7)) === (pt.DATA_ACCESS_ADDR7 | pt.DATA_ACCESS_MASK7)))  
  &
 ((pt.DATA_ACCESS_ENABLE0 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK0)) === (pt.DATA_ACCESS_ADDR0 | pt.DATA_ACCESS_MASK0)) |
  (pt.DATA_ACCESS_ENABLE1 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK1)) === (pt.DATA_ACCESS_ADDR1 | pt.DATA_ACCESS_MASK1)) |
  (pt.DATA_ACCESS_ENABLE2 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK2)) === (pt.DATA_ACCESS_ADDR2 | pt.DATA_ACCESS_MASK2)) |
  (pt.DATA_ACCESS_ENABLE3 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK3)) === (pt.DATA_ACCESS_ADDR3 | pt.DATA_ACCESS_MASK3)) |
  (pt.DATA_ACCESS_ENABLE4 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK4)) === (pt.DATA_ACCESS_ADDR4 | pt.DATA_ACCESS_MASK4)) |
  (pt.DATA_ACCESS_ENABLE5 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK5)) === (pt.DATA_ACCESS_ADDR5 | pt.DATA_ACCESS_MASK5)) |
  (pt.DATA_ACCESS_ENABLE6 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK6)) === (pt.DATA_ACCESS_ADDR6 | pt.DATA_ACCESS_MASK6)) |
  (pt.DATA_ACCESS_ENABLE7 & ((end_addr_d(31,0)   | pt.DATA_ACCESS_MASK7)) === (pt.DATA_ACCESS_ADDR7 | pt.DATA_ACCESS_MASK7))))
    
    val regpred_access_fault_d  = (start_addr_dccm_or_pic ^ base_reg_dccm_or_pic)   
    val picm_access_fault_d     = (addr_in_pic_d & ((start_addr_d(1,0) != "b00".U) | ~lsu_pkt_d.word))
    
    
    val unmapped_access_fault_d = WireInit(1.U(1.W))
    val mpu_access_fault_d      = WireInit(1.U(1.W))
    
    
    if(pt1.DCCM_REGION == pt1.PIC_REGION){
        unmapped_access_fault_d := ((start_addr_in_dccm_region_d & ~(start_addr_in_dccm_d | start_addr_in_pic_d))  |   
  // 0. Addr in dccm/pic region but not in dccm/pic offset
                                        (end_addr_in_dccm_region_d & ~(end_addr_in_dccm_d | end_addr_in_pic_d))       |   
  // 0. Addr in dccm/pic region but not in dccm/pic offset
                                        (start_addr_in_dccm_d & end_addr_in_pic_d)                                    |  
  // 0. DCCM -> PIC cross when DCCM/PIC in same region
                                        (start_addr_in_pic_d  & end_addr_in_dccm_d))                                     
  // 0. DCCM -> PIC cross when DCCM/PIC in same region



        mpu_access_fault_d      := (~start_addr_in_dccm_region_d & ~non_dccm_access_ok)                             
   // 3. Address is not in a populated non-dccm region    
    }
    
    else{
        
        unmapped_access_fault_d := ((start_addr_in_dccm_region_d & ~start_addr_in_dccm_d) |   
   // 0. Addr in dccm region but not in dccm offset
                                      (end_addr_in_dccm_region_d & ~end_addr_in_dccm_d)   |   
   // 0. Addr in dccm region but not in dccm offset
                                      (start_addr_in_pic_region_d & ~start_addr_in_pic_d) |   
   // 0. Addr in picm region but not in picm offset
                                      (end_addr_in_pic_region_d & ~end_addr_in_pic_d))   
           
   // 0. Addr in picm region but not in picm offset


        mpu_access_fault_d      := (~start_addr_in_pic_region_d & ~start_addr_in_dccm_region_d & ~non_dccm_access_ok);     
   // 3. Address is not in a populated non-dccm region
    }
  
    //check width of  access_fault_mscause_d

   access_fault_d         := (unmapped_access_fault_d | mpu_access_fault_d | picm_access_fault_d | regpred_access_fault_d) & lsu_pkt_d.valid & ~lsu_pkt_d.dma
   val access_fault_mscause_d = WireInit(0.U(4.W)) 
    access_fault_mscause_d := Mux(unmapped_access_fault_d.asBool, "b0010".U, Mux(mpu_access_fault_d.asBool, "b0011".U, Mux(regpred_access_fault_d.asBool, "b0101".U, Mux(picm_access_fault_d.asBool, "b0110".U, "b0000".U))))
    
   
    
   val regcross_misaligned_fault_d          = (start_addr_d(31,28) =/= end_addr_d(31,28))
   val sideeffect_misaligned_fault_d        = (is_sideeffects_d & ~ is_aligned_d)


   misaligned_fault_d := (regcross_misaligned_fault_d | (sideeffect_misaligned_fault_d & addr_external_d)) & lsu_pkt_d.valid & ~lsu_pkt_d.dma
   
    
    val misaligned_fault_mscause_d = WireInit(0.U(4.W)) 
   misaligned_fault_mscause_d           := Mux(regcross_misaligned_fault_d, "b0010".U, Mux(sideeffect_misaligned_fault_d.asBool, "b0001".U, "b0000".U))

    
   exc_mscause_d  := Mux(misaligned_fault_d.asBool, misaligned_fault_mscause_d(3,0), access_fault_mscause_d(3,0))

   // Fast interrupt error logic
   fir_dccm_access_error_d  := ((start_addr_in_dccm_region_d & ~start_addr_in_dccm_d) |
                                (end_addr_in_dccm_region_d   & ~end_addr_in_dccm_d)) & lsu_pkt_d.valid & lsu_pkt_d.fast_int
   fir_nondccm_access_error_d := ~(start_addr_in_dccm_region_d & end_addr_in_dccm_region_d) & lsu_pkt_d.valid & lsu_pkt_d.fast_int
    
    
    
    //rvdff #(.WIDTH(1))   is_sideeffects_mff (.din(is_sideeffects_d), .dout(is_sideeffects_m), .clk(lsu_c2_m_clk), .*);
    
  
    val is_sideeffects_mff = Module(new rvdff(1,0))   //TBD for clock and reset
    is_sideeffects_mff.io.din := is_sideeffects_d
    is_sideeffects_m          := is_sideeffects_mff.io.dout
    
    
    
   //is_sideeffects_m    :=0.U
  // addr_in_dccm_d      :=0.U
  // addr_in_pic_d       :=0.U
  // addr_external_d     :=0.U
  // access_fault_d      :=0.U
  // misaligned_fault_d  :=0.U
  // exc_mscause_d       :=0.U
  // fir_dccm_access_error_d     :=0.U
  // fir_nondccm_access_error_d  :=0.U
}
