class el2_lsu_trigger extends Module{
   val io = IO(new Bundle{
   val trigger_pkt_any        = Input(Vec (4,(new el2_trigger_pkt_t)))
   val lsu_pkt_m              = Input(new el2_lsu_pkt_t)
   val lsu_addr_m             = Input(UInt(32.W))
   val store_data_m           = Input(UInt(32.W))
   val lsu_trigger_m_match    = Output(UInt(4.W))
  })
   val lsu_match_data         = Vec(4,UInt(32.W))
   val lsu_trigger_data_match = WireInit(0.U(4.W))
   val store_data_trigger_m   = WireInit(0.U(32.W))

    io.lsu_trigger_m_match:=0.U

}
