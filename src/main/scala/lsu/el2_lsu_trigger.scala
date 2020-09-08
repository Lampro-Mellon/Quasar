class el2_lsu_trigger extends MultiIOModule
{
   val trigger_pkt_any     		= IO(Input(Vec (4,(new el2_trigger_pkt_t))))
   val lsu_pkt_m           		= IO(Input(new el2_lsu_pkt_t))
   val lsu_addr_m          		= IO(Input(UInt(32.W)))
   val store_data_m        		= IO(Input(UInt(32.W)))
   val lsu_trigger_m_match 		= IO(Output(UInt(4.W)))
  
   val lsu_match_data         = Reg(Vec(4,UInt(32.W)))
   val lsu_trigger_data_match = WireInit(0.U(4.W))
   val store_data_trigger_m   = WireInit(0.U(32.W))

    lsu_trigger_m_match:=0.U

}
