
module el2_exu
`include "parameter.sv"

  (
   input logic          clk,                                           // Top level clock
   input logic          rst_l,                                         // Reset
   input logic          scan_mode,                                     // Scan control

   input logic  [1:0]   dec_data_en,                                   // Clock enable {x,r}, one cycle pulse
   input logic  [1:0]   dec_ctl_en,                                    // Clock enable {x,r}, two cycle pulse
   input logic  [31:0]  dbg_cmd_wrdata,                                // Debug data   to primary I0 RS1
   input el2_alu_pkt_t i0_ap,                                         // DEC alu {valid,predecodes}

   input logic          dec_debug_wdata_rs1_d,                         // Debug select to primary I0 RS1

   input el2_predict_pkt_t dec_i0_predict_p_d,                        // DEC branch predict packet
   input logic [BHT_GHR_SIZE-1:0] i0_predict_fghr_d,                // DEC predict fghr
   input logic [BTB_ADDR_HI:BTB_ADDR_LO] i0_predict_index_d,     // DEC predict index
   input logic [BTB_BTAG_SIZE-1:0] i0_predict_btag_d,               // DEC predict branch tag

   input logic          dec_i0_rs1_en_d,                               // Qualify GPR RS1 data
   input logic          dec_i0_rs2_en_d,                               // Qualify GPR RS2 data
   input logic  [31:0]  gpr_i0_rs1_d,                                  // DEC data gpr
   input logic  [31:0]  gpr_i0_rs2_d,                                  // DEC data gpr
   input logic  [31:0]  dec_i0_immed_d,                                // DEC data immediate
   input logic  [31:0]  dec_i0_rs1_bypass_data_d,                      // DEC bypass data
   input logic  [31:0]  dec_i0_rs2_bypass_data_d,                      // DEC bypass data
   input logic  [12:1]  dec_i0_br_immed_d,                             // Branch immediate
   input logic          dec_i0_alu_decode_d,                           // Valid to X-stage ALU
   input logic          dec_i0_select_pc_d,                            // PC select to RS1
   input logic  [31:1]  dec_i0_pc_d,                                   // Instruction PC
   input logic  [1:0]   dec_i0_rs1_bypass_en_d,                        // DEC bypass select  1 - X-stage, 0 - dec bypass data
   input logic  [1:0]   dec_i0_rs2_bypass_en_d,                        // DEC bypass select  1 - X-stage, 0 - dec bypass data
   input logic          dec_csr_ren_d,                                 // Clear I0 RS1 primary

   input el2_mul_pkt_t mul_p,                                         // DEC {valid, operand signs, low, operand bypass}
   input el2_div_pkt_t div_p,                                         // DEC {valid, unsigned, rem}
   input logic          dec_div_cancel,                                // Cancel the divide operation

   input logic  [31:1]  pred_correct_npc_x,                            // DEC NPC for correctly predicted branch

   input logic          dec_tlu_flush_lower_r,                         // Flush divide and secondary ALUs
   input logic  [31:1]  dec_tlu_flush_path_r,                          // Redirect target


   input logic         dec_extint_stall,                               // External stall mux select
   input logic [31:2]  dec_tlu_meihap,                                 // External stall mux data


   output logic [31:0]  exu_lsu_rs1_d,                                 // LSU operand
   output logic [31:0]  exu_lsu_rs2_d,                                 // LSU operand

   output logic         exu_flush_final,                               // Pipe is being flushed this cycle
   output logic [31:1]  exu_flush_path_final,                          // Target for the oldest flush source

   output logic [31:0]  exu_i0_result_x,                               // Primary ALU result to DEC
   output logic [31:1]  exu_i0_pc_x,                                   // Primary PC  result to DEC
   output logic [31:0]  exu_csr_rs1_x,                                 // RS1 source for a CSR instruction

   output logic [31:1]  exu_npc_r,                                     // Divide NPC
   output logic [1:0]   exu_i0_br_hist_r,                              // to DEC  I0 branch history
   output logic         exu_i0_br_error_r,                             // to DEC  I0 branch error
   output logic         exu_i0_br_start_error_r,                       // to DEC  I0 branch start error
   output logic [BTB_ADDR_HI:BTB_ADDR_LO] exu_i0_br_index_r,     // to DEC  I0 branch index
   output logic         exu_i0_br_valid_r,                             // to DEC  I0 branch valid
   output logic         exu_i0_br_mp_r,                                // to DEC  I0 branch mispredict
   output logic         exu_i0_br_middle_r,                            // to DEC  I0 branch middle
   output logic [BHT_GHR_SIZE-1:0]  exu_i0_br_fghr_r,               // to DEC  I0 branch fghr
   output logic         exu_i0_br_way_r,                               // to DEC  I0 branch way

   output el2_predict_pkt_t exu_mp_pkt,                               // Mispredict branch packet
   output logic [BHT_GHR_SIZE-1:0]  exu_mp_eghr,                    // Mispredict global history
   output logic [BHT_GHR_SIZE-1:0]  exu_mp_fghr,                    // Mispredict fghr
   output logic [BTB_ADDR_HI:BTB_ADDR_LO]  exu_mp_index,         // Mispredict index
   output logic [BTB_BTAG_SIZE-1:0]  exu_mp_btag,                   // Mispredict btag


   output logic         exu_pmu_i0_br_misp,                            // to PMU - I0 E4 branch mispredict
   output logic         exu_pmu_i0_br_ataken,                          // to PMU - I0 E4 taken
   output logic         exu_pmu_i0_pc4,                                // to PMU - I0 E4 PC


   output logic [31:0]  exu_div_result,                                // Divide result
   output logic         exu_div_wren                                   // Divide write enable to GPR
  );




   logic                       data_gate_en;
   logic [31:0]                i0_rs1_bypass_data_d;
   logic [31:0]                i0_rs2_bypass_data_d;
   logic                       i0_rs1_bypass_en_d;
   logic                       i0_rs2_bypass_en_d;
   logic [31:0]                i0_rs1_d,  i0_rs2_d;
   logic [31:0]                muldiv_rs1_d, muldiv_rs2_d;
   logic [31:1]                pred_correct_npc_r;
   logic                       i0_pred_correct_upper_r;
   logic [31:0]                csr_rs1_in_d;
   logic [31:1]                i0_flush_path_upper_r;
   logic                       x_data_en, r_data_en;
   logic                       x_ctl_en,  r_ctl_en;

   logic [BHT_GHR_SIZE-1:0] ghr_d_ns, ghr_d;
   logic [BHT_GHR_SIZE-1:0] ghr_x_ns, ghr_x;
   logic                       i0_taken_d;
   logic                       i0_taken_x;
   logic                       i0_valid_d;
   logic                       i0_valid_x;
   logic [BHT_GHR_SIZE-1:0] after_flush_eghr;

   el2_predict_pkt_t          final_predict_mp;
   el2_predict_pkt_t          i0_predict_newp_d;

   logic                       flush_lower_ff;
   logic                       flush_in_d;
   logic [31:0]                alu_result_x;

   logic                       mul_valid_x;
   logic [31:0]                mul_result_x;

   el2_predict_pkt_t          i0_pp_r;

   logic                       i0_flush_upper_d;
   logic [31:1]                i0_flush_path_d;
   el2_predict_pkt_t          i0_predict_p_d;
   logic                       i0_pred_correct_upper_d;

   logic                       i0_flush_upper_x;
   logic [31:1]                i0_flush_path_x;
   el2_predict_pkt_t          i0_predict_p_x;
   logic                       i0_pred_correct_upper_x;

   localparam PREDPIPESIZE = BTB_ADDR_HI-BTB_ADDR_LO+1+BHT_GHR_SIZE+BTB_BTAG_SIZE;
   logic [PREDPIPESIZE-1:0]    predpipe_d, predpipe_x, predpipe_r, final_predpipe_mp;




   rvdffe #(31)                         i_flush_path_x_ff    (.*, .en ( x_data_en     ),  .din( i0_flush_path_d[31:1]         ),  .dout( i0_flush_path_x[31:1]      ) );
   rvdffe #(32)                         i_csr_rs1_x_ff       (.*, .en ( x_data_en     ),  .din( csr_rs1_in_d[31:0]            ),  .dout( exu_csr_rs1_x[31:0]        ) );
   rvdffe #($bits(el2_predict_pkt_t))  i_predictpacket_x_ff (.*, .en ( x_data_en     ),  .din( i0_predict_p_d                ),  .dout( i0_predict_p_x             ) );
   rvdffe #(PREDPIPESIZE)               i_predpipe_x_ff      (.*, .en ( x_data_en     ),  .din( predpipe_d                    ),  .dout( predpipe_x                 ) );
   rvdffe #(PREDPIPESIZE)               i_predpipe_r_ff      (.*, .en ( r_data_en     ),  .din( predpipe_x                    ),  .dout( predpipe_r                 ) );

   rvdffe #(4+BHT_GHR_SIZE)          i_x_ff               (.*, .en ( x_ctl_en      ),  .din ({i0_valid_d,i0_taken_d,i0_flush_upper_d,i0_pred_correct_upper_d,ghr_x_ns[BHT_GHR_SIZE-1:0]} ),
                                                                                          .dout({i0_valid_x,i0_taken_x,i0_flush_upper_x,i0_pred_correct_upper_x,ghr_x[BHT_GHR_SIZE-1:0]}    ) );

   rvdffe #($bits(el2_predict_pkt_t)+7) i_r_ff0             (.*, .en ( r_ctl_en      ),  .din ({i0_predict_p_x             ,pred_correct_npc_x[6:1],i0_pred_correct_upper_x}),
                                                                                          .dout({i0_pp_r                    ,pred_correct_npc_r[6:1],i0_pred_correct_upper_r}) );

   rvdffe #(56)                         i_r_ff1              (.*, .en ( r_data_en     ),  .din ({i0_flush_path_x[31:1]      ,pred_correct_npc_x[31:7]}),
                                                                                          .dout({i0_flush_path_upper_r[31:1],pred_correct_npc_r[31:7]}) );

   if (BHT_SIZE==32 || BHT_SIZE==64)
     begin
       rvdffs #(BHT_GHR_SIZE+2)      i_data_gate_ff       (.*, .en( data_gate_en   ),  .din ({ghr_d_ns[BHT_GHR_SIZE-1:0],mul_p.valid,dec_tlu_flush_lower_r}),
                                                                                          .dout({ghr_d[BHT_GHR_SIZE-1:0]   ,mul_valid_x,flush_lower_ff}       ) );
     end
   else
     begin
       rvdffe #(BHT_GHR_SIZE+2)      i_data_gate_ff       (.*, .en( data_gate_en   ),  .din ({ghr_d_ns[BHT_GHR_SIZE-1:0],mul_p.valid,dec_tlu_flush_lower_r}),
                                                                                          .dout({ghr_d[BHT_GHR_SIZE-1:0]   ,mul_valid_x,flush_lower_ff}       ) );
     end





   assign data_gate_en             =  ( ghr_d_ns[BHT_GHR_SIZE-1:0] != ghr_d[BHT_GHR_SIZE-1:0]) |
                                      ( mul_p.valid                   != mul_valid_x               ) |
                                      ( dec_tlu_flush_lower_r         != flush_lower_ff            );

   assign predpipe_d[PREDPIPESIZE-1:0]
                                   = {i0_predict_fghr_d, i0_predict_index_d, i0_predict_btag_d};


   assign i0_rs1_bypass_en_d       = dec_i0_rs1_bypass_en_d[0] | dec_i0_rs1_bypass_en_d[1];
   assign i0_rs2_bypass_en_d       = dec_i0_rs2_bypass_en_d[0] | dec_i0_rs2_bypass_en_d[1];

   assign i0_rs1_bypass_data_d[31:0]=({32{dec_i0_rs1_bypass_en_d[0]}} & dec_i0_rs1_bypass_data_d[31:0]) |
                                     ({32{dec_i0_rs1_bypass_en_d[1]}} & exu_i0_result_x[31:0]         );

   assign i0_rs2_bypass_data_d[31:0]=({32{dec_i0_rs2_bypass_en_d[0]}} & dec_i0_rs2_bypass_data_d[31:0]) |
                                     ({32{dec_i0_rs2_bypass_en_d[1]}} & exu_i0_result_x[31:0]         );


   assign i0_rs1_d[31:0]           = ({32{ i0_rs1_bypass_en_d                                           }}           & i0_rs1_bypass_data_d[31:0]) |
                                     ({32{~i0_rs1_bypass_en_d &  dec_i0_select_pc_d                     }}           & {dec_i0_pc_d[31:1],1'b0}  ) |    // for jal's
                                     ({32{~i0_rs1_bypass_en_d &  dec_debug_wdata_rs1_d                  }}           & dbg_cmd_wrdata[31:0]      ) |
                                     ({32{~i0_rs1_bypass_en_d & ~dec_debug_wdata_rs1_d & dec_i0_rs1_en_d}}           & gpr_i0_rs1_d[31:0]        );

   assign i0_rs2_d[31:0]           = ({32{~i0_rs2_bypass_en_d & dec_i0_rs2_en_d}}                                    & gpr_i0_rs2_d[31:0]        ) |
                                     ({32{~i0_rs2_bypass_en_d                  }}                                    & dec_i0_immed_d[31:0]      ) |
                                     ({32{ i0_rs2_bypass_en_d                  }}                                    & i0_rs2_bypass_data_d[31:0]);


   assign exu_lsu_rs1_d[31:0]      = ({32{~i0_rs1_bypass_en_d & ~dec_extint_stall & dec_i0_rs1_en_d}} & gpr_i0_rs1_d[31:0]        ) |
                                     ({32{ i0_rs1_bypass_en_d & ~dec_extint_stall                  }} & i0_rs1_bypass_data_d[31:0]) |
                                     ({32{                       dec_extint_stall                  }} & {dec_tlu_meihap[31:2],2'b0});

   assign exu_lsu_rs2_d[31:0]      = ({32{~i0_rs2_bypass_en_d & ~dec_extint_stall & dec_i0_rs2_en_d}} & gpr_i0_rs2_d[31:0]        ) |
                                     ({32{ i0_rs2_bypass_en_d & ~dec_extint_stall                  }} & i0_rs2_bypass_data_d[31:0]);


   assign muldiv_rs1_d[31:0]       = ({32{~i0_rs1_bypass_en_d & dec_i0_rs1_en_d}}                     & gpr_i0_rs1_d[31:0]        ) |
                                     ({32{ i0_rs1_bypass_en_d                  }}                     & i0_rs1_bypass_data_d[31:0]);

   assign muldiv_rs2_d[31:0]       = ({32{~i0_rs2_bypass_en_d & dec_i0_rs2_en_d}}                     & gpr_i0_rs2_d[31:0]        ) |
                                     ({32{~i0_rs2_bypass_en_d                  }}                     & dec_i0_immed_d[31:0]      ) |
                                     ({32{ i0_rs2_bypass_en_d                  }}                     & i0_rs2_bypass_data_d[31:0]);


   assign csr_rs1_in_d[31:0]       = ( dec_csr_ren_d )  ?  i0_rs1_d[31:0]  :  exu_csr_rs1_x[31:0];

   assign x_data_en                =  dec_data_en[1];
   assign r_data_en                =  dec_data_en[0];
   assign x_ctl_en                 =  dec_ctl_en[1];
   assign r_ctl_en                 =  dec_ctl_en[0];




   el2_exu_alu_ctl  i_alu  (.*,
                          .enable            ( x_ctl_en                    ),   // I
                          .pp_in             ( i0_predict_newp_d           ),   // I
                          .valid_in          ( dec_i0_alu_decode_d         ),   // I
                          .flush_upper_x     ( i0_flush_upper_x            ),   // I
                          .flush_lower_r     ( dec_tlu_flush_lower_r       ),   // I
                          .a_in              ( i0_rs1_d[31:0]              ),   // I
                          .b_in              ( i0_rs2_d[31:0]              ),   // I
                          .pc_in             ( dec_i0_pc_d[31:1]           ),   // I
                          .brimm_in          ( dec_i0_br_immed_d[12:1]     ),   // I
                          .ap                ( i0_ap                       ),   // I
                          .csr_ren_in        ( dec_csr_ren_d               ),   // I
                          .result_ff         ( alu_result_x[31:0]          ),   // O
                          .flush_upper_out   ( i0_flush_upper_d            ),   // O
                          .flush_final_out   ( exu_flush_final             ),   // O
                          .flush_path_out    ( i0_flush_path_d[31:1]       ),   // O
                          .predict_p_out     ( i0_predict_p_d              ),   // O
                          .pred_correct_out  ( i0_pred_correct_upper_d     ),   // O
                          .pc_ff             ( exu_i0_pc_x[31:1]           ));  // O



   el2_exu_mul_ctl  i_mul   (.*,
                          .mul_p             ( mul_p                       ),   // I
                          .rs1_in            ( muldiv_rs1_d[31:0]          ),   // I
                          .rs2_in            ( muldiv_rs2_d[31:0]          ),   // I
                          .result_x          ( mul_result_x[31:0]          ));  // O



   el2_exu_div_ctl  i_div   (.*,
                          .cancel            ( dec_div_cancel              ),   // I
                          .dp                ( div_p                       ),   // I
                          .dividend          ( muldiv_rs1_d[31:0]          ),   // I
                          .divisor           ( muldiv_rs2_d[31:0]          ),   // I
                          .finish_dly        ( exu_div_wren                ),   // O
                          .out               ( exu_div_result[31:0]        ));  // O



   assign exu_i0_result_x[31:0]    =  (mul_valid_x)  ?  mul_result_x[31:0]  :  alu_result_x[31:0];




   always_comb begin
      i0_predict_newp_d            =  dec_i0_predict_p_d;
      i0_predict_newp_d.boffset    =  dec_i0_pc_d[1];  // from the start of inst
   end


   assign exu_pmu_i0_br_misp       =  i0_pp_r.misp;
   assign exu_pmu_i0_br_ataken     =  i0_pp_r.ataken;
   assign exu_pmu_i0_pc4           =  i0_pp_r.pc4;


   assign i0_valid_d               =  i0_predict_p_d.valid  & dec_i0_alu_decode_d & ~dec_tlu_flush_lower_r;
   assign i0_taken_d               = (i0_predict_p_d.ataken & dec_i0_alu_decode_d);


   // maintain GHR at D
   assign ghr_d_ns[BHT_GHR_SIZE-1:0]
                                   = ({BHT_GHR_SIZE{~dec_tlu_flush_lower_r &  i0_valid_d}} & {ghr_d[BHT_GHR_SIZE-2:0], i0_taken_d}) |
                                     ({BHT_GHR_SIZE{~dec_tlu_flush_lower_r & ~i0_valid_d}} &  ghr_d[BHT_GHR_SIZE-1:0]             ) |
                                     ({BHT_GHR_SIZE{ dec_tlu_flush_lower_r              }} &  ghr_x[BHT_GHR_SIZE-1:0]             );

   // maintain GHR at X
   assign ghr_x_ns[BHT_GHR_SIZE-1:0]
                                   = ({BHT_GHR_SIZE{ i0_valid_x}} & {ghr_x[BHT_GHR_SIZE-2:0], i0_taken_x}) |
                                     ({BHT_GHR_SIZE{~i0_valid_x}} &  ghr_x[BHT_GHR_SIZE-1:0]             ) ;


   assign exu_i0_br_valid_r                                 =  i0_pp_r.valid;
   assign exu_i0_br_mp_r                                    =  i0_pp_r.misp;
   assign exu_i0_br_way_r                                   =  i0_pp_r.way;
   assign exu_i0_br_hist_r[1:0]                             =  i0_pp_r.hist[1:0];
   assign exu_i0_br_error_r                                 =  i0_pp_r.br_error;
   assign exu_i0_br_middle_r                                =  i0_pp_r.pc4 ^ i0_pp_r.boffset;
   assign exu_i0_br_start_error_r                           =  i0_pp_r.br_start_error;

   assign {exu_i0_br_fghr_r[BHT_GHR_SIZE-1:0],
           exu_i0_br_index_r[BTB_ADDR_HI:BTB_ADDR_LO]}=  predpipe_r[PREDPIPESIZE-1:BTB_BTAG_SIZE];


   assign final_predict_mp                                  = (i0_flush_upper_x)  ?  i0_predict_p_x  :  '0;

   assign final_predpipe_mp[PREDPIPESIZE-1:0]               = (i0_flush_upper_x)  ?  predpipe_x      :  '0;

   assign after_flush_eghr[BHT_GHR_SIZE-1:0]             = (i0_flush_upper_x & ~dec_tlu_flush_lower_r)  ?  ghr_d[BHT_GHR_SIZE-1:0]  :  ghr_x[BHT_GHR_SIZE-1:0];


   assign exu_mp_pkt.way                                    =  final_predict_mp.way;
   assign exu_mp_pkt.misp                                   =  final_predict_mp.misp;
   assign exu_mp_pkt.pcall                                  =  final_predict_mp.pcall;
   assign exu_mp_pkt.pja                                    =  final_predict_mp.pja;
   assign exu_mp_pkt.pret                                   =  final_predict_mp.pret;
   assign exu_mp_pkt.ataken                                 =  final_predict_mp.ataken;
   assign exu_mp_pkt.boffset                                =  final_predict_mp.boffset;
   assign exu_mp_pkt.pc4                                    =  final_predict_mp.pc4;
   assign exu_mp_pkt.hist[1:0]                              =  final_predict_mp.hist[1:0];
   assign exu_mp_pkt.toffset[11:0]                          =  final_predict_mp.toffset[11:0];

   assign exu_mp_fghr[BHT_GHR_SIZE-1:0]                  =  after_flush_eghr[BHT_GHR_SIZE-1:0];

   assign {exu_mp_index[BTB_ADDR_HI:BTB_ADDR_LO],
           exu_mp_btag[BTB_BTAG_SIZE-1:0]}               =  final_predpipe_mp[PREDPIPESIZE-BHT_GHR_SIZE-1:0];

   assign exu_mp_eghr[BHT_GHR_SIZE-1:0]                  =  final_predpipe_mp[PREDPIPESIZE-1:BTB_ADDR_HI-BTB_ADDR_LO+BTB_BTAG_SIZE+1]; // mp ghr for bht write

   assign exu_flush_path_final[31:1] = (dec_tlu_flush_lower_r)    ?  dec_tlu_flush_path_r[31:1]  :  i0_flush_path_d[31:1];

   assign exu_npc_r[31:1]            = (i0_pred_correct_upper_r)  ?  pred_correct_npc_r[31:1]    :
                                                                     i0_flush_path_upper_r[31:1];


endmodule // el2_exu
