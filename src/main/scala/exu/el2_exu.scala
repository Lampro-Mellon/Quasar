package exu
import chisel3._
import scala.collection._
import chisel3.util._
import include._
import lib._
import chisel3.experimental.chiselName

@chiselName
class el2_exu extends Module with el2_lib with RequireAsyncReset{
  val io=IO(new Bundle{
    val		scan_mode				      =Input(Bool())                              // Scan control
    val   dec_data_en				    =Input(UInt(2.W))                           // Clock enable {x,r}, one cycle pulse
    val   dec_ctl_en				    =Input(UInt(2.W))                           // Clock enable {x,r}, two cycle pulse
    val  	dbg_cmd_wrdata			  =Input(UInt(32.W))                          // Debug data   to primary I0 RS1
    val		i0_ap					        =Input(new el2_alu_pkt_t)                   // DEC alu {valid,predecodes}
    val		dec_debug_wdata_rs1_d	=Input(UInt(1.W))                           // Debug select to primary I0 RS1
    val  	dec_i0_predict_p_d		=Flipped(Valid(new el2_predict_pkt_t))               // DEC branch predict packet
    val		i0_predict_fghr_d		  =Input(UInt(BHT_GHR_SIZE.W))                // DEC predict fghr
    val		i0_predict_index_d		=Input(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))   // DEC predict index
    val		i0_predict_btag_d		  =Input(UInt(BTB_BTAG_SIZE.W))               // DEC predict branch tag
    val		dec_i0_rs1_en_d			  =Input(UInt(1.W))                           // Qualify GPR RS1 data
    val		dec_i0_rs2_en_d			  =Input(UInt(1.W))                           // Qualify GPR RS2 data
    val		gpr_i0_rs1_d			    =Input(UInt(32.W))                          // DEC data gpr
    val		gpr_i0_rs2_d			    =Input(UInt(32.W))                          // DEC data gpr
    val		dec_i0_immed_d			  =Input(UInt(32.W))                          // DEC data immediate
    val		dec_i0_rs1_bypass_data_d=Input(UInt(32.W))                      	// DEC bypass data
    val		dec_i0_rs2_bypass_data_d=Input(UInt(32.W))                      	// DEC bypass data
    val		dec_i0_br_immed_d		  =Input(UInt(12.W))                          // Branch immediate
    val		dec_i0_alu_decode_d		=Input(UInt(1.W))                           // Valid to X-stage ALU
    val		dec_i0_select_pc_d		=Input(UInt(1.W))                           // PC select to RS1
    val		dec_i0_pc_d				    =Input(UInt(31.W))                          // Instruction PC
    val		dec_i0_rs1_bypass_en_d	=Input(UInt(2.W))                       	// DEC bypass select  1 - X-stage, 0 - dec bypass data
    val		dec_i0_rs2_bypass_en_d	=Input(UInt(2.W))                        	// DEC bypass select  1 - X-stage, 0 - dec bypass data
    val		dec_csr_ren_d			    =Input(UInt(1.W))                           // Clear I0 RS1 primary
    val		mul_p					        =Flipped(Valid(new el2_mul_pkt_t))                   // DEC {valid, operand signs, low, operand bypass}
    val		div_p					        =Flipped(Valid(new el2_div_pkt_t))                   // DEC {valid, unsigned, rem}
    val		dec_div_cancel			  =Input(UInt(1.W))                           // Cancel the divide operation
    val		pred_correct_npc_x		=Input(UInt(31.W))                          // DEC NPC for correctly predicted branch
    val		dec_tlu_flush_lower_r	=Input(UInt(1.W))                         	// Flush divide and secondary ALUs
    val		dec_tlu_flush_path_r	=Input(UInt(31.W))                          // Redirect target
    val		dec_extint_stall		  =Input(UInt(1.W))                           // External stall mux select
    val		dec_tlu_meihap			  =Input(UInt(30.W))                          // External stall mux data

    val		exu_lsu_rs1_d			    =Output(UInt(32.W))                         // LSU operand
    val		exu_lsu_rs2_d			    =Output(UInt(32.W))                         // LSU operand
    val		exu_flush_final			  =Output(UInt(1.W))                          // Pipe is being flushed this cycle
    val		exu_flush_path_final	=Output(UInt(31.W))                         // Target for the oldest flush source
    val		exu_i0_result_x			  =Output(UInt(32.W))                         // Primary ALU result to DEC
    val		exu_i0_pc_x				    =Output(UInt(31.W))                         // Primary PC  result to DEC
    val		exu_csr_rs1_x			    =Output(UInt(32.W))                         // RS1 source for a CSR instruction
    val		exu_npc_r				      =Output(UInt(31.W))                         // Divide NPC
    val		exu_i0_br_hist_r		  =Output(UInt(2.W))                          // to DEC  I0 branch history
    val		exu_i0_br_error_r		  =Output(UInt(1.W))                          // to DEC  I0 branch error
    val		exu_i0_br_start_error_r	=Output(UInt(1.W))                       	// to DEC  I0 branch start error
    val		exu_i0_br_index_r		  =Output(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))  // to DEC  I0 branch index
    val		exu_i0_br_valid_r		  =Output(UInt(1.W))                          // to DEC  I0 branch valid
    val		exu_i0_br_mp_r			  =Output(UInt(1.W))                          // to DEC  I0 branch mispredict
    val		exu_i0_br_middle_r		=Output(UInt(1.W))                          // to DEC  I0 branch middle
    val		exu_i0_br_fghr_r		  =Output(UInt(BHT_GHR_SIZE.W))               // to DEC  I0 branch fghr
    val		exu_i0_br_way_r			  =Output(UInt(1.W))                          // to DEC  I0 branch way
    val		exu_mp_pkt				    =Valid(new el2_predict_pkt_t)              // Mispredict branch packet
    val		exu_mp_eghr				    =Output(UInt(BHT_GHR_SIZE.W))               // Mispredict global history
    val		exu_mp_fghr				    =Output(UInt(BHT_GHR_SIZE.W))               // Mispredict fghr
    val		exu_mp_index			    =Output(UInt(((BTB_ADDR_HI-BTB_ADDR_LO)+1).W))  // Mispredict index
    val		exu_mp_btag				    =Output(UInt(BTB_BTAG_SIZE.W))              // Mispredict btag
    val		exu_pmu_i0_br_misp		=Output(UInt(1.W))                          // to PMU - I0 E4 branch mispredict
    val		exu_pmu_i0_br_ataken	=Output(UInt(1.W))                          // to PMU - I0 E4 taken
    val		exu_pmu_i0_pc4			  =Output(UInt(1.W))                          // to PMU - I0 E4 PC
    val		exu_div_result			  =Output(UInt(32.W))                         // Divide result
    val		exu_div_wren			    =Output(UInt(1.W))                          // Divide write enable to GPR
  })

  val PREDPIPESIZE 			        = BTB_ADDR_HI - BTB_ADDR_LO + BHT_GHR_SIZE + BTB_BTAG_SIZE +1
  val ghr_x_ns 				          = Wire(UInt(BHT_GHR_SIZE.W))
  val ghr_d_ns 				          = Wire(UInt(BHT_GHR_SIZE.W))
  val ghr_d	 				            = Wire(UInt(BHT_GHR_SIZE.W))
  val i0_taken_d				        =Wire(UInt(1.W))
  val mul_valid_x				        =Wire(UInt(1.W))
  val i0_valid_d				        =Wire(UInt(1.W))
  val flush_lower_ff			      =Wire(UInt(1.W))
  val data_gate_en			        =Wire(UInt(1.W))
  val csr_rs1_in_d			        =Wire(UInt(32.W))
  val i0_predict_newp_d 		    =Wire(Valid(new el2_predict_pkt_t))
  val i0_flush_path_d			      =Wire(UInt(31.W))
  val i0_predict_p_d			      =Wire(Valid(new el2_predict_pkt_t))
  val i0_pp_r					          =Wire(Valid(new el2_predict_pkt_t))
  val i0_predict_p_x			      =Wire(Valid(new el2_predict_pkt_t))
  val final_predict_mp		      =Wire(Valid(new el2_predict_pkt_t))
  val pred_correct_npc_r		    =Wire(UInt(32.W))
  val i0_pred_correct_upper_d	  =Wire(UInt(1.W))
  val i0_flush_upper_d		      =Wire(UInt(1.W))
  io.exu_mp_pkt.bits.prett			:=0.U
  io.exu_mp_pkt.bits.br_start_error:=0.U
  io.exu_mp_pkt.bits.br_error		:=0.U
  io.exu_mp_pkt.valid			      :=0.U
  i0_pp_r.bits.toffset          := 0.U

  val x_data_en                 =  io.dec_data_en(1)
  val r_data_en                 =  io.dec_data_en(0)
  val x_ctl_en                  =  io.dec_ctl_en(1)
  val r_ctl_en                  =  io.dec_ctl_en(0)
  val predpipe_d    = Cat(io.i0_predict_fghr_d, io.i0_predict_index_d, io.i0_predict_btag_d)


  val i0_flush_path_x 	=rvdffe(i0_flush_path_d,x_data_en.asBool,clock,io.scan_mode)
  io.exu_csr_rs1_x			:=rvdffe(csr_rs1_in_d,x_data_en.asBool,clock,io.scan_mode)
  i0_predict_p_x				:=rvdffe(i0_predict_p_d,x_data_en.asBool,clock,io.scan_mode)
  val predpipe_x   		 	=rvdffe(predpipe_d,x_data_en.asBool,clock,io.scan_mode)
  val predpipe_r			 	=rvdffe(predpipe_x ,r_data_en.asBool,clock,io.scan_mode)
  val ghr_x					    =rvdffe(ghr_x_ns ,x_ctl_en.asBool,clock,io.scan_mode)
  val i0_pred_correct_upper_x	=rvdffe(i0_pred_correct_upper_d ,x_ctl_en.asBool,clock,io.scan_mode)
  val i0_flush_upper_x	=rvdffe(i0_flush_upper_d ,x_ctl_en.asBool,clock,io.scan_mode)
  val i0_taken_x				=rvdffe(i0_taken_d ,x_ctl_en.asBool,clock,io.scan_mode)
  val i0_valid_x				=rvdffe(i0_valid_d ,x_ctl_en.asBool,clock,io.scan_mode)
  i0_pp_r               :=rvdffe(i0_predict_p_x,r_ctl_en.asBool,clock,io.scan_mode)
  val pred_temp1		    =rvdffe(io.pred_correct_npc_x(5,0) ,r_ctl_en.asBool,clock,io.scan_mode)
  val i0_pred_correct_upper_r	=rvdffe(i0_pred_correct_upper_x ,r_ctl_en.asBool,clock,io.scan_mode)
  val i0_flush_path_upper_r	=rvdffe(i0_flush_path_x ,r_data_en.asBool,clock,io.scan_mode)
  val pred_temp2				=rvdffe(io.pred_correct_npc_x(30,6) ,r_data_en.asBool,clock,io.scan_mode)
  pred_correct_npc_r			:=Cat(pred_temp2,pred_temp1)

  when (BHT_SIZE.asUInt===32.U || BHT_SIZE.asUInt===64.U){
    ghr_d			:=RegEnable(ghr_d_ns,0.U,data_gate_en.asBool)
    mul_valid_x		:=RegEnable(io.mul_p.valid,0.U,data_gate_en.asBool)
    flush_lower_ff	:=RegEnable(io.dec_tlu_flush_lower_r,0.U,data_gate_en.asBool)
  }.otherwise{
    ghr_d			:=rvdffe(ghr_d_ns ,data_gate_en.asBool,clock,io.scan_mode)
    mul_valid_x		:=rvdffe(io.mul_p.valid ,data_gate_en.asBool,clock,io.scan_mode)
    flush_lower_ff	:=rvdffe(io.dec_tlu_flush_lower_r ,data_gate_en.asBool,clock,io.scan_mode)
  }


  data_gate_en   	:=  (ghr_d_ns =/= ghr_d) | ( io.mul_p.valid  =/= mul_valid_x) | ( io.dec_tlu_flush_lower_r =/= flush_lower_ff)
  val i0_rs1_bypass_en_d         = io.dec_i0_rs1_bypass_en_d(0) | io.dec_i0_rs1_bypass_en_d(1)
  val i0_rs2_bypass_en_d         = io.dec_i0_rs2_bypass_en_d(0) | io.dec_i0_rs2_bypass_en_d(1)

  val i0_rs1_bypass_data_d =	Mux1H(Seq(
    io.dec_i0_rs1_bypass_en_d(0).asBool							-> io.dec_i0_rs1_bypass_data_d,
    io.dec_i0_rs1_bypass_en_d(1).asBool 						-> io.exu_i0_result_x
  ))

  val i0_rs2_bypass_data_d =	Mux1H(Seq(
    io.dec_i0_rs2_bypass_en_d(0).asBool							-> io.dec_i0_rs2_bypass_data_d,
    io.dec_i0_rs2_bypass_en_d(1).asBool 						-> io.exu_i0_result_x
  ))

  val i0_rs1_d = Mux1H(Seq(
    i0_rs1_bypass_en_d.asBool 														-> i0_rs1_bypass_data_d,
    (!i0_rs1_bypass_en_d &  io.dec_i0_select_pc_d).asBool 							-> Cat(io.dec_i0_pc_d,0.U(1.W)),
    (!i0_rs1_bypass_en_d &  io.dec_debug_wdata_rs1_d).asBool 						-> io.dbg_cmd_wrdata,
    (!i0_rs1_bypass_en_d & !io.dec_debug_wdata_rs1_d & io.dec_i0_rs1_en_d).asBool 	-> io.gpr_i0_rs1_d
  ))

  val i0_rs2_d = Mux1H(Seq(
    (!i0_rs2_bypass_en_d & io.dec_i0_rs2_en_d).asBool 	-> io.gpr_i0_rs2_d,
    (!i0_rs2_bypass_en_d).asBool						-> io.dec_i0_immed_d,
    (i0_rs2_bypass_en_d).asBool							-> i0_rs2_bypass_data_d
  ))
  dontTouch(i0_rs2_d)

  io.exu_lsu_rs1_d:=Mux1H(Seq(
    (!i0_rs1_bypass_en_d & !io.dec_extint_stall & io.dec_i0_rs1_en_d).asBool	 	-> io.gpr_i0_rs1_d,
    (i0_rs1_bypass_en_d & !io.dec_extint_stall).asBool								-> i0_rs1_bypass_data_d,
    (io.dec_extint_stall).asBool													-> Cat(io.dec_tlu_meihap,0.U(2.W))
  ))

  io.exu_lsu_rs2_d:=Mux1H(Seq(
    (!i0_rs2_bypass_en_d & !io.dec_extint_stall & io.dec_i0_rs2_en_d).asBool 	-> io.gpr_i0_rs2_d,
    (i0_rs2_bypass_en_d & !io.dec_extint_stall).asBool							-> i0_rs2_bypass_data_d
  ))

  val muldiv_rs1_d=Mux1H(Seq(
    (!i0_rs1_bypass_en_d & io.dec_i0_rs1_en_d).asBool		-> io.gpr_i0_rs1_d,
    (i0_rs1_bypass_en_d).asBool								-> i0_rs1_bypass_data_d
  ))

  val muldiv_rs2_d=Mux1H(Seq(
    (!i0_rs2_bypass_en_d & io.dec_i0_rs2_en_d).asBool   	-> io.gpr_i0_rs2_d,
    (!i0_rs2_bypass_en_d).asBool							-> io.dec_i0_immed_d,
    (i0_rs2_bypass_en_d).asBool								-> i0_rs2_bypass_data_d
  ))

  csr_rs1_in_d       := Mux( io.dec_csr_ren_d.asBool, i0_rs1_d, io.exu_csr_rs1_x)


  val i_alu=Module(new el2_exu_alu_ctl)
  i_alu.io.scan_mode		:=io.scan_mode
  i_alu.io.enable			:=x_ctl_en
  i_alu.io.pp_in			:=i0_predict_newp_d
  i_alu.io.valid_in		:=io.dec_i0_alu_decode_d
  i_alu.io.flush_upper_x	:=i0_flush_upper_x
  i_alu.io.flush_lower_r	:=io.dec_tlu_flush_lower_r
  i_alu.io.a_in			:=i0_rs1_d.asSInt
  i_alu.io.b_in			:=i0_rs2_d
  i_alu.io.pc_in			:=io.dec_i0_pc_d
  i_alu.io.brimm_in		:=io.dec_i0_br_immed_d
  i_alu.io.ap				:=io.i0_ap
  i_alu.io.csr_ren_in		:=io.dec_csr_ren_d
  val alu_result_x   		 =i_alu.io.result_ff
  i0_flush_upper_d   		:=i_alu.io.flush_upper_out
  io.exu_flush_final		:=i_alu.io.flush_final_out
  i0_flush_path_d			:=i_alu.io.flush_path_out
  i0_predict_p_d			:=i_alu.io.predict_p_out
  i0_pred_correct_upper_d :=i_alu.io.pred_correct_out
  io.exu_i0_pc_x			:=i_alu.io.pc_ff

  val i_mul=Module(new el2_exu_mul_ctl)
  i_mul.io.scan_mode		:=io.scan_mode
  i_mul.io.mul_p			:=io.mul_p
  i_mul.io.rs1_in			:=muldiv_rs1_d
  i_mul.io.rs2_in			:=muldiv_rs2_d
  val mul_result_x		 =i_mul.io.result_x

  val i_div=Module(new el2_exu_div_ctl)
  i_div.io.scan_mode		:=io.scan_mode
  i_div.io.cancel			:=io.dec_div_cancel
  i_div.io.dp				:=io.div_p
  i_div.io.dividend		:=muldiv_rs1_d
  i_div.io.divisor		:=muldiv_rs2_d
  io.exu_div_wren			:=i_div.io.finish_dly
  io.exu_div_result		:=i_div.io.out

  io.exu_i0_result_x    		 := Mux(mul_valid_x.asBool, mul_result_x,  alu_result_x)
  i0_predict_newp_d            :=  io.dec_i0_predict_p_d
  i0_predict_newp_d.bits.boffset    :=  io.dec_i0_pc_d(0)  // from the start of inst

  io.exu_pmu_i0_br_misp       :=  i0_pp_r.bits.misp
  io.exu_pmu_i0_br_ataken     :=  i0_pp_r.bits.ataken
  io.exu_pmu_i0_pc4           :=  i0_pp_r.bits.pc4


  i0_valid_d               :=  i0_predict_p_d.valid  & io.dec_i0_alu_decode_d & !io.dec_tlu_flush_lower_r
  i0_taken_d               := (i0_predict_p_d.bits.ataken & io.dec_i0_alu_decode_d)



  // maintain GHR at D
  ghr_d_ns:=Mux1H(Seq(
    (!io.dec_tlu_flush_lower_r &  i0_valid_d).asBool		->  Cat(ghr_d(BHT_GHR_SIZE-2,0),i0_taken_d),
    (!io.dec_tlu_flush_lower_r & !i0_valid_d).asBool		->	ghr_d,
    (io.dec_tlu_flush_lower_r).asBool					->  ghr_x
  ))

  // maintain GHR at X
  ghr_x_ns:=Mux(i0_valid_x===1.U, Cat(ghr_x(BHT_GHR_SIZE-2,0),i0_taken_x), ghr_x )

  io.exu_i0_br_valid_r             :=  i0_pp_r.valid
  io.exu_i0_br_mp_r                :=  i0_pp_r.bits.misp
  io.exu_i0_br_way_r               :=  i0_pp_r.bits.way
  io.exu_i0_br_hist_r		 		 :=  i0_pp_r.bits.hist
  io.exu_i0_br_error_r          	 :=  i0_pp_r.bits.br_error
  io.exu_i0_br_middle_r            :=  i0_pp_r.bits.pc4 ^ i0_pp_r.bits.boffset
  io.exu_i0_br_start_error_r       :=  i0_pp_r.bits.br_start_error
  io.exu_i0_br_fghr_r		 		 :=  predpipe_r(PREDPIPESIZE-1,BTB_ADDR_HI+BTB_BTAG_SIZE-BTB_ADDR_LO+1)
  io.exu_i0_br_index_r		 	 :=  predpipe_r(BTB_ADDR_HI+BTB_BTAG_SIZE-BTB_ADDR_LO,BTB_BTAG_SIZE)
  final_predict_mp		 		 :=  Mux(i0_flush_upper_x===1.U,i0_predict_p_x,0.U.asTypeOf(i0_predict_p_x))
  val final_predpipe_mp		  	  =  Mux(i0_flush_upper_x===1.U,predpipe_x,0.U)

  val after_flush_eghr              = Mux((i0_flush_upper_x===1.U & !(io.dec_tlu_flush_lower_r===1.U)),  ghr_d,  ghr_x)


  io.exu_mp_pkt.bits.way                :=  final_predict_mp.bits.way
  io.exu_mp_pkt.bits.misp               :=  final_predict_mp.bits.misp
  io.exu_mp_pkt.bits.pcall              :=  final_predict_mp.bits.pcall
  io.exu_mp_pkt.bits.pja                :=  final_predict_mp.bits.pja
  io.exu_mp_pkt.bits.pret               :=  final_predict_mp.bits.pret
  io.exu_mp_pkt.bits.ataken             :=  final_predict_mp.bits.ataken
  io.exu_mp_pkt.bits.boffset            :=  final_predict_mp.bits.boffset
  io.exu_mp_pkt.bits.pc4                :=  final_predict_mp.bits.pc4
  io.exu_mp_pkt.bits.hist		 		 :=  final_predict_mp.bits.hist(1,0)
  io.exu_mp_pkt.bits.toffset		 	 :=  final_predict_mp.bits.toffset(11,0)
  io.exu_mp_fghr                   :=  after_flush_eghr
  io.exu_mp_index			 		 :=  final_predpipe_mp(PREDPIPESIZE-BHT_GHR_SIZE-1,BTB_BTAG_SIZE)
  io.exu_mp_btag			 		 :=  final_predpipe_mp(BTB_BTAG_SIZE-1,0)
  io.exu_mp_eghr                   :=  final_predpipe_mp(PREDPIPESIZE-1,BTB_ADDR_HI-BTB_ADDR_LO+BTB_BTAG_SIZE+1) // mp ghr for bht write
  io.exu_flush_path_final		 	 := Mux(io.dec_tlu_flush_lower_r.asBool, io.dec_tlu_flush_path_r,  i0_flush_path_d)
  io.exu_npc_r			 		 := Mux(i0_pred_correct_upper_r===1.U,  pred_correct_npc_r, i0_flush_path_upper_r)
}

object exu_gen extends App{
  println(chisel3.Driver.emitVerilog(new el2_exu()))
}
