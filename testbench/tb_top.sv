// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
`ifdef VERILATOR
module tb_top ( input bit core_clk );
`else
module tb_top;
    bit                         core_clk;
`endif
    logic                       rst_l;
    logic                       porst_l;
    logic                       nmi_int;

    logic        [31:0]         reset_vector;
    logic        [31:0]         nmi_vector;
    logic        [31:1]         jtag_id;

    logic        [31:0]         ic_haddr        ;
    logic        [2:0]          ic_hburst       ;
    logic                       ic_hmastlock    ;
    logic        [3:0]          ic_hprot        ;
    logic        [2:0]          ic_hsize        ;
    logic        [1:0]          ic_htrans       ;
    logic                       ic_hwrite       ;
    logic        [63:0]         ic_hrdata       ;
    logic                       ic_hready       ;
    logic                       ic_hresp        ;

    logic        [31:0]         lsu_haddr       ;
    logic        [2:0]          lsu_hburst      ;
    logic                       lsu_hmastlock   ;
    logic        [3:0]          lsu_hprot       ;
    logic        [2:0]          lsu_hsize       ;
    logic        [1:0]          lsu_htrans      ;
    logic                       lsu_hwrite      ;
    logic        [63:0]         lsu_hrdata      ;
    logic        [63:0]         lsu_hwdata      ;
    logic                       lsu_hready      ;
    logic                       lsu_hresp        ;

    logic        [31:0]         sb_haddr        ;
    logic        [2:0]          sb_hburst       ;
    logic                       sb_hmastlock    ;
    logic        [3:0]          sb_hprot        ;
    logic        [2:0]          sb_hsize        ;
    logic        [1:0]          sb_htrans       ;
    logic                       sb_hwrite       ;

    logic        [63:0]         sb_hrdata       ;
    logic        [63:0]         sb_hwdata       ;
    logic                       sb_hready       ;
    logic                       sb_hresp        ;

    logic        [31:0]         trace_rv_i_insn_ip;
    logic        [31:0]         trace_rv_i_address_ip;
    logic                       trace_rv_i_valid_ip;
    logic                       trace_rv_i_exception_ip;
    logic        [4:0]          trace_rv_i_ecause_ip;
    logic                       trace_rv_i_interrupt_ip;
    logic        [31:0]         trace_rv_i_tval_ip;

    logic                       o_debug_mode_status;


    logic                       jtag_tdo;
    logic                       o_cpu_halt_ack;
    logic                       o_cpu_halt_status;
    logic                       o_cpu_run_ack;

    logic                       mailbox_write;
    logic        [63:0]         dma_hrdata       ;
    logic        [63:0]         dma_hwdata       ;
    logic                       dma_hready       ;
    logic                       dma_hresp        ;

    logic                       mpc_debug_halt_req;
    logic                       mpc_debug_run_req;
    logic                       mpc_reset_run_req;
    logic                       mpc_debug_halt_ack;
    logic                       mpc_debug_run_ack;
    logic                       debug_brkpt_status;

    int                         cycleCnt;
    logic                       mailbox_data_val;

    wire                        dma_hready_out;
    int                         commit_count;

    logic                       wb_valid;
    logic [4:0]                 wb_dest;
    logic [31:0]                wb_data;

`ifdef RV_BUILD_AXI4
   //-------------------------- LSU AXI signals--------------------------
   // AXI Write Channels
    wire                        lsu_axi_awvalid;
    wire                        lsu_axi_awready;
    wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_awid;
    wire [31:0]                 lsu_axi_awaddr;
    wire [3:0]                  lsu_axi_awregion;
    wire [7:0]                  lsu_axi_awlen;
    wire [2:0]                  lsu_axi_awsize;
    wire [1:0]                  lsu_axi_awburst;
    wire                        lsu_axi_awlock;
    wire [3:0]                  lsu_axi_awcache;
    wire [2:0]                  lsu_axi_awprot;
    wire [3:0]                  lsu_axi_awqos;

    wire                        lsu_axi_wvalid;
    wire                        lsu_axi_wready;
    wire [63:0]                 lsu_axi_wdata;
    wire [7:0]                  lsu_axi_wstrb;
    wire                        lsu_axi_wlast;

    wire                        lsu_axi_bvalid;
    wire                        lsu_axi_bready;
    wire [1:0]                  lsu_axi_bresp;
    wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_bid;

    // AXI Read Channels
    wire                        lsu_axi_arvalid;
    wire                        lsu_axi_arready;
    wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_arid;
    wire [31:0]                 lsu_axi_araddr;
    wire [3:0]                  lsu_axi_arregion;
    wire [7:0]                  lsu_axi_arlen;
    wire [2:0]                  lsu_axi_arsize;
    wire [1:0]                  lsu_axi_arburst;
    wire                        lsu_axi_arlock;
    wire [3:0]                  lsu_axi_arcache;
    wire [2:0]                  lsu_axi_arprot;
    wire [3:0]                  lsu_axi_arqos;

    wire                        lsu_axi_rvalid;
    wire                        lsu_axi_rready;
    wire [`RV_LSU_BUS_TAG-1:0]  lsu_axi_rid;
    wire [63:0]                 lsu_axi_rdata;
    wire [1:0]                  lsu_axi_rresp;
    wire                        lsu_axi_rlast;

    //-------------------------- IFU AXI signals--------------------------
    // AXI Write Channels
    wire                        ifu_axi_awvalid;
    wire                        ifu_axi_awready;
    wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_awid;
    wire [31:0]                 ifu_axi_awaddr;
    wire [3:0]                  ifu_axi_awregion;
    wire [7:0]                  ifu_axi_awlen;
    wire [2:0]                  ifu_axi_awsize;
    wire [1:0]                  ifu_axi_awburst;
    wire                        ifu_axi_awlock;
    wire [3:0]                  ifu_axi_awcache;
    wire [2:0]                  ifu_axi_awprot;
    wire [3:0]                  ifu_axi_awqos;

    wire                        ifu_axi_wvalid;
    wire                        ifu_axi_wready;
    wire [63:0]                 ifu_axi_wdata;
    wire [7:0]                  ifu_axi_wstrb;
    wire                        ifu_axi_wlast;

    wire                        ifu_axi_bvalid;
    wire                        ifu_axi_bready;
    wire [1:0]                  ifu_axi_bresp;
    wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_bid;

    // AXI Read Channels
    wire                        ifu_axi_arvalid;
    wire                        ifu_axi_arready;
    wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_arid;
    wire [31:0]                 ifu_axi_araddr;
    wire [3:0]                  ifu_axi_arregion;
    wire [7:0]                  ifu_axi_arlen;
    wire [2:0]                  ifu_axi_arsize;
    wire [1:0]                  ifu_axi_arburst;
    wire                        ifu_axi_arlock;
    wire [3:0]                  ifu_axi_arcache;
    wire [2:0]                  ifu_axi_arprot;
    wire [3:0]                  ifu_axi_arqos;

    wire                        ifu_axi_rvalid;
    wire                        ifu_axi_rready;
    wire [`RV_IFU_BUS_TAG-1:0]  ifu_axi_rid;
    wire [63:0]                 ifu_axi_rdata;
    wire [1:0]                  ifu_axi_rresp;
    wire                        ifu_axi_rlast;

    //-------------------------- SB AXI signals--------------------------
    // AXI Write Channels
    wire                        sb_axi_awvalid;
    wire                        sb_axi_awready;
    wire [`RV_SB_BUS_TAG-1:0]   sb_axi_awid;
    wire [31:0]                 sb_axi_awaddr;
    wire [3:0]                  sb_axi_awregion;
    wire [7:0]                  sb_axi_awlen;
    wire [2:0]                  sb_axi_awsize;
    wire [1:0]                  sb_axi_awburst;
    wire                        sb_axi_awlock;
    wire [3:0]                  sb_axi_awcache;
    wire [2:0]                  sb_axi_awprot;
    wire [3:0]                  sb_axi_awqos;

    wire                        sb_axi_wvalid;
    wire                        sb_axi_wready;
    wire [63:0]                 sb_axi_wdata;
    wire [7:0]                  sb_axi_wstrb;
    wire                        sb_axi_wlast;

    wire                        sb_axi_bvalid;
    wire                        sb_axi_bready;
    wire [1:0]                  sb_axi_bresp;
    wire [`RV_SB_BUS_TAG-1:0]   sb_axi_bid;

    // AXI Read Channels
    wire                        sb_axi_arvalid;
    wire                        sb_axi_arready;
    wire [`RV_SB_BUS_TAG-1:0]   sb_axi_arid;
    wire [31:0]                 sb_axi_araddr;
    wire [3:0]                  sb_axi_arregion;
    wire [7:0]                  sb_axi_arlen;
    wire [2:0]                  sb_axi_arsize;
    wire [1:0]                  sb_axi_arburst;
    wire                        sb_axi_arlock;
    wire [3:0]                  sb_axi_arcache;
    wire [2:0]                  sb_axi_arprot;
    wire [3:0]                  sb_axi_arqos;

    wire                        sb_axi_rvalid;
    wire                        sb_axi_rready;
    wire [`RV_SB_BUS_TAG-1:0]   sb_axi_rid;
    wire [63:0]                 sb_axi_rdata;
    wire [1:0]                  sb_axi_rresp;
    wire                        sb_axi_rlast;

   //-------------------------- DMA AXI signals--------------------------
   // AXI Write Channels
    wire                        dma_axi_awvalid;
    wire                        dma_axi_awready;
    wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_awid;
    wire [31:0]                 dma_axi_awaddr;
    wire [2:0]                  dma_axi_awsize;
    wire [2:0]                  dma_axi_awprot;
    wire [7:0]                  dma_axi_awlen;
    wire [1:0]                  dma_axi_awburst;


    wire                        dma_axi_wvalid;
    wire                        dma_axi_wready;
    wire [63:0]                 dma_axi_wdata;
    wire [7:0]                  dma_axi_wstrb;
    wire                        dma_axi_wlast;

    wire                        dma_axi_bvalid;
    wire                        dma_axi_bready;
    wire [1:0]                  dma_axi_bresp;
    wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_bid;

    // AXI Read Channels
    wire                        dma_axi_arvalid;
    wire                        dma_axi_arready;
    wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_arid;
    wire [31:0]                 dma_axi_araddr;
    wire [2:0]                  dma_axi_arsize;
    wire [2:0]                  dma_axi_arprot;
    wire [7:0]                  dma_axi_arlen;
    wire [1:0]                  dma_axi_arburst;

    wire                        dma_axi_rvalid;
    wire                        dma_axi_rready;
    wire [`RV_DMA_BUS_TAG-1:0]  dma_axi_rid;
    wire [63:0]                 dma_axi_rdata;
    wire [1:0]                  dma_axi_rresp;
    wire                        dma_axi_rlast;

    wire                        lmem_axi_arvalid;
    wire                        lmem_axi_arready;

    wire                        lmem_axi_rvalid;
    wire [`RV_LSU_BUS_TAG-1:0]  lmem_axi_rid;
    wire [1:0]                  lmem_axi_rresp;
    wire [63:0]                 lmem_axi_rdata;
    wire                        lmem_axi_rlast;
    wire                        lmem_axi_rready;

    wire                        lmem_axi_awvalid;
    wire                        lmem_axi_awready;

    wire                        lmem_axi_wvalid;
    wire                        lmem_axi_wready;

    wire [1:0]                  lmem_axi_bresp;
    wire                        lmem_axi_bvalid;
    wire [`RV_LSU_BUS_TAG-1:0]  lmem_axi_bid;
    wire                        lmem_axi_bready;

`endif
    wire[63:0] WriteData;
    string                      abi_reg[32]; // ABI register names


    assign mailbox_write = lmem.mailbox_write;
    assign WriteData = lmem.WriteData;
    assign mailbox_data_val = WriteData[7:0] > 8'h5 && WriteData[7:0] < 8'h7f;

    parameter MAX_CYCLES = 2_000_000;

    integer fd, tp, el, pic ,lsu, ifu, dec,exu;

    always @(negedge core_clk) begin
        cycleCnt <= cycleCnt+1;
        // Test timeout monitor
        if(cycleCnt == MAX_CYCLES) begin
            $display ("Hit max cycle count (%0d) .. stopping",cycleCnt);
            $finish;
        end
        // console Monitor
        if( mailbox_data_val & mailbox_write) begin
            $fwrite(fd,"%c", WriteData[7:0]);
            $write("%c", WriteData[7:0]);
        end
        // End Of test monitor
        if(mailbox_write && WriteData[7:0] == 8'hff) begin
            $display("TEST_PASSED");
            $display("\nFinished : minstret = %0d, mcycle = %0d", rvtop.core.dec.tlu.csr.minstretl[31:0],rvtop.core.dec.tlu.csr.mcyclel[31:0]);
            $display("See \"exec.log\" for execution trace with register updates..\n");
            $finish;
        end
        else if(mailbox_write && WriteData[7:0] == 8'h1) begin
            $display("TEST_FAILED");
            $finish;
        end
    end


    // trace monitor
    always @(posedge core_clk) begin
        wb_valid  <= rvtop.core.dec.decode_io_dec_i0_wen_r;
        wb_dest   <= rvtop.core.dec.decode_io_dec_i0_waddr_r;
        wb_data   <= rvtop.core.dec.decode_io_dec_i0_wdata_r;
        if (trace_rv_i_valid_ip) begin
           $fwrite(tp,"%b,%h,%h,%0h,%0h,3,%b,%h,%h,%b\n", trace_rv_i_valid_ip, 0, trace_rv_i_address_ip,
                  0, trace_rv_i_insn_ip,trace_rv_i_exception_ip,trace_rv_i_ecause_ip,
                  trace_rv_i_tval_ip,trace_rv_i_interrupt_ip);
           // Basic trace - no exception register updates
           // #1 0 ee000000 b0201073 c 0b02       00000000
           commit_count++;
           $fwrite (el, "%10d : %8s 0 %h %h%13s ; %s\n", cycleCnt, $sformatf("#%0d",commit_count),
                        trace_rv_i_address_ip, trace_rv_i_insn_ip,
                        (wb_dest !=0 && wb_valid)?  $sformatf("%s=%h", abi_reg[wb_dest], wb_data) : "             ",
                        dasm(trace_rv_i_insn_ip, trace_rv_i_address_ip, wb_dest & {5{wb_valid}}, wb_data)
                   );
    end
        if(rvtop.core.dec.decode_io_dec_nonblock_load_wen)
           $fwrite (el, "%10d : %32s=%h ; nbL\n", cycleCnt, abi_reg[rvtop.core.dec.decode_io_dec_nonblock_load_waddr], rvtop.core.dec.io_lsu_nonblock_load_data);
        if(rvtop.core.dec.io_exu_div_wren)
           $fwrite (el, "%10d : %32s=%h ; nbD\n", cycleCnt, abi_reg[rvtop.core.dec.decode_io_div_waddr_wb], rvtop.core.dec.io_exu_div_result);
  end


//////////////////////////////////////////////////pic tracer///////////////////////////////////////////////////////
 always @(posedge core_clk) begin
        
        if (rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_wren == 1) begin
           $fwrite(pic,"%0d,%0d,%h\t",rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_wren, rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_wraddr, rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_wr_data);
             
        end
		else if(rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_rden == 1)
			$fwrite(pic, "x\tx\tx\t");

 		if (rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_rden == 1) begin
           $fwrite(pic,"%0d,%0d,%h\n",rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_rden, rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_rdaddr, rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_rd_data);
             
        end
		else if(rvtop.core.pic_ctrl_inst.io_lsu_pic_picm_wren == 1)
			$fwrite(pic, "x\tx\tx\t\n");
    end
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////LSU tracer///////////////////////////////////////////////////////
 always @(posedge core_clk) begin
        
        if (rvtop.core.lsu.io_dccm_wren == 1) begin
           $fwrite(lsu,"%0h,%0h,%0h,%0h,%0h\t",rvtop.core.lsu.io_dccm_wren, rvtop.core.lsu.io_dccm_wr_addr_hi,rvtop.core.lsu.io_dccm_wr_addr_lo, rvtop.core.lsu.io_dccm_wr_data_hi,rvtop.core.lsu.io_dccm_wr_data_lo );
             
        end
		else if(rvtop.core.lsu.io_dccm_rden == 1 || rvtop.core.lsu.io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid)
			$fwrite(lsu, "x\tx\tx\tx\tx\t");

		if (rvtop.core.lsu.io_dccm_rden == 1) begin
           $fwrite(lsu,"%0h,%0h,%0h,%0h,%0h\t",rvtop.core.lsu.io_dccm_rden, rvtop.core.lsu.io_dccm_rd_addr_hi,rvtop.core.lsu.io_dccm_rd_addr_lo, rvtop.core.lsu.io_dccm_rd_data_hi,rvtop.core.lsu.io_dccm_rd_data_lo );
             
        end
		else if(rvtop.core.lsu.io_dccm_wren == 1 || rvtop.core.lsu.io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid)
			$fwrite(lsu, "x\tx\tx\tx\tx\t");

		if (rvtop.core.lsu.io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid == 1) begin
           $fwrite(lsu,"%0h,%0h\n",rvtop.core.lsu.io_lsu_dma_dma_dccm_ctl_dccm_dma_rvalid, rvtop.core.lsu.io_lsu_dma_dma_dccm_ctl_dccm_dma_rdata );
		end
		else if (rvtop.core.lsu.io_dccm_wren == 1 || rvtop.core.lsu.io_dccm_rden== 1)
			$fwrite(lsu, "x\tx\n");
end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////IFU tracer////////////////////////////////////////////////////////
 always @(posedge core_clk) begin
        
        if (rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 && cycleCnt != 0) begin
           $fwrite(ifu,"%5d,%0h,%0h,%0h\t",cycleCnt,rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid, rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_instr,rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_pc);
  		end

		else if((rvtop.core.ifu.io_iccm_wren == 1 || rvtop.core.ifu.io_iccm_rden==1 || rvtop.core.ifu.io_ic_wr_en !==0 || rvtop.core.ifu.io_ic_rd_en ==1 || rvtop.core.ifu.io_iccm_dma_rvalid == 1) && cycleCnt != 0)
			$fwrite(ifu,"%5d,x\tx\tx\t",cycleCnt);

		if (rvtop.core.ifu.io_iccm_wren == 1 && cycleCnt != 0) begin
           $fwrite(ifu,"%0h,%0h,%0h\t",rvtop.core.ifu.io_iccm_wren,rvtop.core.ifu.io_iccm_rw_addr , rvtop.core.ifu.io_iccm_wr_data);
  		end

		else if((rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 || rvtop.core.ifu.io_iccm_rden==1 || rvtop.core.ifu.io_ic_wr_en !==0 || rvtop.core.ifu.io_ic_rd_en ==1 || rvtop.core.ifu.io_iccm_dma_rvalid == 1) && cycleCnt != 0)
			$fwrite(ifu,"\tx\tx\tx\t");

		if (rvtop.core.ifu.io_iccm_rden == 1 && cycleCnt != 0) begin
           $fwrite(ifu,"%0h,%0h,%0h\t",rvtop.core.ifu.io_iccm_rden,rvtop.core.ifu.io_iccm_rw_addr , rvtop.core.ifu.io_iccm_rd_data_ecc);
  		end

		else if((rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 || rvtop.core.ifu.io_iccm_wren==1 || rvtop.core.ifu.io_ic_wr_en !==0 || rvtop.core.ifu.io_ic_rd_en ==1 || rvtop.core.ifu.io_iccm_dma_rvalid == 1)&& cycleCnt != 0)
			$fwrite(ifu,"\tx\tx\tx\t");
		
		if (rvtop.core.ifu.io_ic_wr_en !== 0 && cycleCnt != 0) begin
           $fwrite(ifu,"%0h,%0h,%0h\t",rvtop.core.ifu.io_ic_wr_en,rvtop.core.ifu.io_ic_rw_addr,rvtop.core.ifu.io_ic_wr_data_0,rvtop.core.ifu.io_ic_wr_data_1);
  		end

		else if((rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 || rvtop.core.ifu.io_iccm_wren==1 || rvtop.core.ifu.io_iccm_rden ==1 || rvtop.core.ifu.io_ic_rd_en ==1 || rvtop.core.ifu.io_iccm_dma_rvalid == 1)&& cycleCnt != 0)
			$fwrite(ifu,"\tx\tx\tx\tx\t");

		if (rvtop.core.ifu.io_ic_rd_en == 1 && cycleCnt != 0) begin
           $fwrite(ifu,"%0h,%0h,%0h\t",rvtop.core.ifu.io_ic_rd_en,rvtop.core.ifu.io_ic_rw_addr,rvtop.core.ifu.io_ic_rd_data);
  		end

		else if((rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 || rvtop.core.ifu.io_iccm_wren==1 || rvtop.core.ifu.io_iccm_rden ==1 || rvtop.core.ifu.io_ic_wr_en !== 0 ||rvtop.core.ifu.io_iccm_dma_rvalid == 1)&& cycleCnt != 0)
			$fwrite(ifu,"\tx\tx\tx\t");
		
		if (rvtop.core.ifu.io_iccm_dma_rvalid == 1 && cycleCnt != 0) begin
           $fwrite(ifu,"%h,%0h\n",rvtop.core.ifu.io_iccm_dma_rvalid,rvtop.core.ifu.io_iccm_dma_rdata);
  		end

		else if((rvtop.core.ifu.aln_ctl_io_dec_aln_aln_ib_ifu_i0_valid == 1 || rvtop.core.ifu.io_iccm_wren==1 || rvtop.core.ifu.io_iccm_rden ==1 || rvtop.core.ifu.io_ic_wr_en !== 0 || rvtop.core.ifu.io_ic_rd_en)&& cycleCnt != 0)
			$fwrite(ifu,"\tx\tx\n");
end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////DEC tracer////////////////////////////////////////////////////////
 always @(posedge core_clk) begin
        
        if (rvtop.core.dma_ctrl.io_dma_dbg_cmd_done == 1) begin
           $fwrite(dec,"%5d,\t%0h,%0h\t",cycleCnt,rvtop.core.dma_ctrl.io_dma_dbg_cmd_done,rvtop.core.dec.io_dec_dbg_rddata);
  		end

		else if(rvtop.core.dec.io_dec_exu_dec_alu_dec_i0_alu_decode_d == 1  ||  rvtop.core.dec.decode_io_dec_csr_wen_r==1)
			$fwrite(dec,"%5d,\tx\tx\t",cycleCnt);

		 if (rvtop.core.dec.io_dec_exu_dec_alu_dec_i0_alu_decode_d == 1) begin
           $fwrite(dec,"%0h,%0h,%0h,%0h,%0h,%0h\t", rvtop.core.dec.io_dec_exu_dec_alu_dec_i0_alu_decode_d, rvtop.core.dec.decode_io_decode_exu_dec_i0_rs1_en_d, 
			rvtop.core.exu.i0_rs1_d, rvtop.core.dec.decode_io_decode_exu_dec_i0_rs2_en_d, rvtop.core.exu.i0_rs2_d, rvtop.core.exu.io_dec_exu_decode_exu_exu_i0_result_x);
  		end

		else if(rvtop.core.dma_ctrl.io_dma_dbg_cmd_done == 1 ||  rvtop.core.dec.decode_io_dec_csr_wen_r==1)
			$fwrite(dec,"x\t,x\t,x\t,x\tx\tx\t");

		 if (rvtop.core.dec.decode_io_dec_csr_wen_r==1 ) begin
           $fwrite(dec,"%0h,%0h,%0h,%0h,%0h\n", rvtop.core.dec.decode_io_dec_csr_wen_r, rvtop.core.dec.decode_io_dec_csr_wraddr_r, rvtop.core.dec.decode_io_dec_csr_wrdata_r, rvtop.core.dec.decode_io_dec_csr_rdaddr_d, rvtop.core.dec.decode_io_dec_csr_rddata_d);
  		end

		else if(rvtop.core.dma_ctrl.io_dma_dbg_cmd_done == 1 || rvtop.core.dec.io_dec_exu_dec_alu_dec_i0_alu_decode_d == 1 )
			$fwrite(dec,"x\t,x\t,x\t,x\t,x\n");

end
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////exu tracer///////////////////////////////////////////////////
always @(posedge core_clk) begin
        
        if (rvtop.core.exu.io_exu_div_wren == 1) begin
           $fwrite(exu,"%5d,\t%0h,%0h,%0h,%0h,%0h\t",cycleCnt,rvtop.core.exu.io_exu_div_wren, rvtop.core.exu.io_exu_div_result, rvtop.core.exu.i_div.io_dividend, rvtop.core.exu.i_div.io_divisor, rvtop.core.exu.i_div.io_exu_div_result);
  		end

		else if(rvtop.core.exu.i0_rs1_bypass_en_d == 1  ||  rvtop.core.exu.i0_rs2_bypass_en_d == 1)
			$fwrite(exu,"%5d,\tx\tx\tx\tx\tx,\t",cycleCnt);

		 if (rvtop.core.exu.i0_rs1_bypass_en_d == 1) begin
           $fwrite(exu,"\t%0h,%0h\t",rvtop.core.exu.i0_rs1_bypass_en_d ,rvtop.core.exu.i0_rs1_bypass_data_d  );
  		end

		else if(rvtop.core.exu.io_exu_div_wren == 1  ||  rvtop.core.exu.i0_rs2_bypass_en_d == 1)
			$fwrite(exu,"\tx\tx\t");
		
		 if (rvtop.core.exu.i0_rs2_bypass_en_d == 1) begin
           $fwrite(exu,"\t%0h,%0h\n",rvtop.core.exu.i0_rs2_bypass_en_d ,rvtop.core.exu.i0_rs2_bypass_data_d  );
  		end

		else if(rvtop.core.exu.io_exu_div_wren == 1  ||  rvtop.core.exu.i0_rs1_bypass_en_d == 1)
			$fwrite(exu,"\tx\tx\n");
end
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    initial begin
        abi_reg[0] = "zero";
        abi_reg[1] = "ra";
        abi_reg[2] = "sp";
        abi_reg[3] = "gp";
        abi_reg[4] = "tp";
        abi_reg[5] = "t0";
        abi_reg[6] = "t1";
        abi_reg[7] = "t2";
        abi_reg[8] = "s0";
        abi_reg[9] = "s1";
        abi_reg[10] = "a0";
        abi_reg[11] = "a1";
        abi_reg[12] = "a2";
        abi_reg[13] = "a3";
        abi_reg[14] = "a4";
        abi_reg[15] = "a5";
        abi_reg[16] = "a6";
        abi_reg[17] = "a7";
        abi_reg[18] = "s2";
        abi_reg[19] = "s3";
        abi_reg[20] = "s4";
        abi_reg[21] = "s5";
        abi_reg[22] = "s6";
        abi_reg[23] = "s7";
        abi_reg[24] = "s8";
        abi_reg[25] = "s9";
        abi_reg[26] = "s10";
        abi_reg[27] = "s11";
        abi_reg[28] = "t3";
        abi_reg[29] = "t4";
        abi_reg[30] = "t5";
        abi_reg[31] = "t6";
    // tie offs
        jtag_id[31:28] = 4'b1;
        jtag_id[27:12] = '0;
        jtag_id[11:1]  = 11'h45;
        reset_vector = `RV_RESET_VEC;
        nmi_vector   = 32'hee000000;
        nmi_int   = 0;

        $readmemh("program.hex",  lmem.mem);
        $readmemh("program.hex",  imem.mem);
        tp = $fopen("trace_port.csv","w");
        el = $fopen("exec.log","w");
//////////////////////////////////////////////////////////////////
		pic = $fopen("pic.log","w");
		$fwrite (pic, " write enable, write addr , write data ,read enable, read address, read data \n");
///////////////////////////////////////////////////////////////////
		lsu = $fopen("lsu.log","w");
		$fwrite (lsu,"write en, write addrs hi,write addrs lo, write data hi,write data lo,	read_en, read addrs hi,read addrs lo, read data hi,read data lo, dma valid, dma read data \n");
/////////////////////////////////////////////////////////////////////////
		ifu = $fopen("ifu.log","w");
		$fwrite (ifu,"cycleCnt,inst_valid,inst,inst_pc\ticcm wen,iccm waddr,iccm wdata, iccm ren,iccm raddr, iccm rdata\tic wen,ic waddr,ic wdata0,ic wdata1\tic ren,ic raddr,ic rdata\ticcm dma rvalid,iccm dma rdata\n");
///////////////////////////////////////////////////////////////////////////
		dec = $fopen("dec.log","w");
		$fwrite (dec,"clock cycle dbg cmd, dbg rd data\talu decode, rs1 en, rs1, rs2 en, rs2, result, csr wen, csr wr addr, csr wrdata, csr rd addr, csr rd data\n");
///////////////////////////////////////////////////////////////////////////
		exu = $fopen("exu.log","w");
		$fwrite (exu,"clock cycle div enable, div result, dividend, divisor, out\t,rs1 bypassen, rs1 bypassdata\t, rs2 bypassen, rs2 bypassdata\n");
        $fwrite (el, "//Cycle : #inst 0  pc opcode reg regnum value\n");
        fd = $fopen("console.log","w");
        commit_count = 0;
        preload_dccm();
        preload_iccm();

`ifndef VERILATOR
        if($test$plusargs("dumpon")) $dumpvars;
        forever  core_clk = #5 ~core_clk;
`endif
    end


    assign rst_l = cycleCnt > 5;
    assign porst_l = cycleCnt > 2;

   //=========================================================================-
   // RTL instance
   //=========================================================================-
/* verilator lint_off PINMISSING */
quasar_wrapper rvtop (
    .reset                  ( rst_l         ),
    .io_dbg_rst_l              ( porst_l       ),
    .clock                    ( core_clk      ),
    .io_rst_vec                ( reset_vector[31:1]),
    .io_nmi_int                ( nmi_int       ),
    .io_nmi_vec                ( nmi_vector[31:1]),
    .io_jtag_id                ( jtag_id[31:1]),

`ifdef RV_BUILD_AHB_LITE
    .io_ifu_brg_out_haddr                  ( ic_haddr      ),
    .io_ifu_brg_out_hburst                 ( ic_hburst     ),
    .io_ifu_brg_out_hmastlock              ( ic_hmastlock  ),
    .io_ifu_brg_out_hprot                  ( ic_hprot      ),
    .io_ifu_brg_out_hsize                  ( ic_hsize      ),
    .io_ifu_brg_out_htrans                 ( ic_htrans     ),
    .io_ifu_brg_out_hwrite                 ( ic_hwrite     ),
    .io_ifu_brg_out_hwdata                 ( ifu_brg_out_hwdata),
    .io_ifu_brg_in_hrdata                 ( ic_hrdata[63:0]),
    .io_ifu_brg_in_hready                 ( ic_hready     ),
    .io_ifu_brg_in_hresp                  ( ic_hresp      ),

    //---------------------------------------------------------------
    // Debug AHB Master
    //---------------------------------------------------------------
    .io_sb_brg_out_haddr               ( sb_haddr      ),
    .io_sb_brg_out_hburst              ( sb_hburst     ),
    .io_sb_brg_out_hmastlock           ( sb_hmastlock  ),
    .io_sb_brg_out_hprot               ( sb_hprot      ),
    .io_sb_brg_out_hsize               ( sb_hsize      ),
    .io_sb_brg_out_htrans              ( sb_htrans     ),
    .io_sb_brg_out_hwrite              ( sb_hwrite     ),
    .io_sb_brg_out_hwdata              ( sb_hwdata     ),

    .io_sb_brg_in_hrdata              ( sb_hrdata     ),
    .io_sb_brg_in_hready              ( sb_hready     ),
    .io_sb_brg_in_hresp               ( sb_hresp      ),

    //---------------------------------------------------------------
    // LSU AHB Master
    //---------------------------------------------------------------
    .io_lsu_brg_out_haddr              ( lsu_haddr       ),
    .io_lsu_brg_out_hburst             ( lsu_hburst      ),
    .io_lsu_brg_out_hmastlock          ( lsu_hmastlock   ),
    .io_lsu_brg_out_hprot              ( lsu_hprot       ),
    .io_lsu_brg_out_hsize              ( lsu_hsize       ),
    .io_lsu_brg_out_htrans             ( lsu_htrans      ),
    .io_lsu_brg_out_hwrite             ( lsu_hwrite      ),
    .io_lsu_brg_out_hwdata             ( lsu_hwdata      ),

    .io_lsu_brg_in_hrdata             ( lsu_hrdata[63:0]),
    .io_lsu_brg_in_hready             ( lsu_hready      ),
    .io_lsu_brg_in_hresp              ( lsu_hresp       ),

    //---------------------------------------------------------------
    // DMA Slave
    //---------------------------------------------------------------
    .io_dma_brg_sig_out_haddr              ( '0 ),
    .io_dma_brg_sig_out_hburst             ( '0 ),
    .io_dma_brg_sig_out_hmastlock          ( '0 ),
    .io_dma_brg_sig_out_hprot              ( '0 ),
    .io_dma_brg_sig_out_hsize              ( '0 ),
    .io_dma_brg_sig_out_htrans             ( '0 ),
    .io_dma_brg_sig_out_hwrite             ( '0 ),
    .io_dma_brg_sig_out_hwdata             ( '0 ),

    .io_dma_brg_sig_in_hrdata             ( dma_hrdata    ),
    .io_dma_brg_sig_in_hresp              ( dma_hresp     ),
    .io_dma_brg_hsel               ( 1'b1            ),
    .io_dma_brg_hreadyin          ( dma_hready_out  ),
    .io_dma_brg_sig_in_hready          ( dma_hready_out  ),
`endif
`ifdef RV_BUILD_AXI4
    //-------------------------- LSU AXI signals--------------------------
    // AXI Write Channels
    .io_lsu_brg_aw_valid        (lsu_axi_awvalid),
    .io_lsu_brg_aw_ready        (lsu_axi_awready),
    .io_lsu_brg_aw_bits_id           (lsu_axi_awid),
    .io_lsu_brg_aw_bits_addr         (lsu_axi_awaddr),
    .io_lsu_brg_aw_bits_region       (lsu_axi_awregion),
    .io_lsu_brg_aw_bits_len          (lsu_axi_awlen),
    .io_lsu_brg_aw_bits_size         (lsu_axi_awsize),
    .io_lsu_brg_aw_bits_burst        (lsu_axi_awburst),
    .io_lsu_brg_aw_bits_lock         (lsu_axi_awlock),
    .io_lsu_brg_aw_bits_cache        (lsu_axi_awcache),
    .io_lsu_brg_aw_bits_prot         (lsu_axi_awprot),
    .io_lsu_brg_aw_bits_qos          (lsu_axi_awqos),

    .io_lsu_brg_w_valid         (lsu_axi_wvalid),
    .io_lsu_brg_w_ready         (lsu_axi_wready),
    .io_lsu_brg_w_bits_data          (lsu_axi_wdata),
    .io_lsu_brg_w_bits_strb          (lsu_axi_wstrb),
    .io_lsu_brg_w_bits_last          (lsu_axi_wlast),

    .io_lsu_brg_b_valid         (lsu_axi_bvalid),
    .io_lsu_brg_b_ready         (lsu_axi_bready),
    .io_lsu_brg_b_bits_resp          (lsu_axi_bresp),
    .io_lsu_brg_b_bits_id            (lsu_axi_bid),


    .io_lsu_brg_ar_valid        (lsu_axi_arvalid),
    .io_lsu_brg_ar_ready        (lsu_axi_arready),
    .io_lsu_brg_ar_bits_id           (lsu_axi_arid),
    .io_lsu_brg_ar_bits_addr         (lsu_axi_araddr),
    .io_lsu_brg_ar_bits_region       (lsu_axi_arregion),
    .io_lsu_brg_ar_bits_len          (lsu_axi_arlen),
    .io_lsu_brg_ar_bits_size         (lsu_axi_arsize),
    .io_lsu_brg_ar_bits_burst        (lsu_axi_arburst),
    .io_lsu_brg_ar_bits_lock         (lsu_axi_arlock),
    .io_lsu_brg_ar_bits_cache        (lsu_axi_arcache),
    .io_lsu_brg_ar_bits_prot         (lsu_axi_arprot),
    .io_lsu_brg_ar_bits_qos          (lsu_axi_arqos),

    .io_lsu_brg_r_valid         (lsu_axi_rvalid),
    .io_lsu_brg_r_ready         (lsu_axi_rready),
    .io_lsu_brg_r_bits_id            (lsu_axi_rid),
    .io_lsu_brg_r_bits_data          (lsu_axi_rdata),
    .io_lsu_brg_r_bits_resp          (lsu_axi_rresp),
    .io_lsu_brg_r_bits_last          (lsu_axi_rlast),

    //-------------------------- IFU AXI signals--------------------------
    // AXI Write Channels
    .io_ifu_brg_aw_valid        (ifu_axi_awvalid),
    .io_ifu_brg_aw_ready        (ifu_axi_awready),
    .io_ifu_brg_aw_bits_id           (ifu_axi_awid),
    .io_ifu_brg_aw_bits_addr         (ifu_axi_awaddr),
    .io_ifu_brg_aw_bits_region       (ifu_axi_awregion),
    .io_ifu_brg_aw_bits_len          (ifu_axi_awlen),
    .io_ifu_brg_aw_bits_size         (ifu_axi_awsize),
    .io_ifu_brg_aw_bits_burst        (ifu_axi_awburst),
    .io_ifu_brg_aw_bits_lock         (ifu_axi_awlock),
    .io_ifu_brg_aw_bits_cache        (ifu_axi_awcache),
    .io_ifu_brg_aw_bits_prot         (ifu_axi_awprot),
    .io_ifu_brg_aw_bits_qos          (ifu_axi_awqos),

    .io_ifu_brg_w_valid         (ifu_axi_wvalid),
    .io_ifu_brg_w_ready         (ifu_axi_wready),
    .io_ifu_brg_w_bits_data          (ifu_axi_wdata),
    .io_ifu_brg_w_bits_strb          (ifu_axi_wstrb),
    .io_ifu_brg_w_bits_last          (ifu_axi_wlast),

    .io_ifu_brg_b_valid         (ifu_axi_bvalid),
    .io_ifu_brg_b_ready         (ifu_axi_bready),
    .io_ifu_brg_b_bits_resp          (ifu_axi_bresp),
    .io_ifu_brg_b_bits_id            (ifu_axi_bid),

    .io_ifu_brg_ar_valid        (ifu_axi_arvalid),
    .io_ifu_brg_ar_ready        (ifu_axi_arready),
    .io_ifu_brg_ar_bits_id           (ifu_axi_arid),
    .io_ifu_brg_ar_bits_addr         (ifu_axi_araddr),
    .io_ifu_brg_ar_bits_region       (ifu_axi_arregion),
    .io_ifu_brg_ar_bits_len          (ifu_axi_arlen),
    .io_ifu_brg_ar_bits_size         (ifu_axi_arsize),
    .io_ifu_brg_ar_bits_burst        (ifu_axi_arburst),
    .io_ifu_brg_ar_bits_lock         (ifu_axi_arlock),
    .io_ifu_brg_ar_bits_cache        (ifu_axi_arcache),
    .io_ifu_brg_ar_bits_prot         (ifu_axi_arprot),
    .io_ifu_brg_ar_bits_qos          (ifu_axi_arqos),

    .io_ifu_brg_r_valid         (ifu_axi_rvalid),
    .io_ifu_brg_r_ready         (ifu_axi_rready),
    .io_ifu_brg_r_bits_id            (ifu_axi_rid),
    .io_ifu_brg_r_bits_data          (ifu_axi_rdata),
    .io_ifu_brg_r_bits_resp          (ifu_axi_rresp),
    .io_ifu_brg_r_bits_last          (ifu_axi_rlast),

    //-------------------------- SB AXI signals--------------------------
    // AXI Write Channels
    .io_sb_brg_aw_valid         (sb_axi_awvalid),
    .io_sb_brg_aw_ready         (sb_axi_awready),
    .io_sb_brg_aw_bits_id            (sb_axi_awid),
    .io_sb_brg_aw_bits_addr          (sb_axi_awaddr),
    .io_sb_brg_aw_bits_region        (sb_axi_awregion),
    .io_sb_brg_aw_bits_len           (sb_axi_awlen),
    .io_sb_brg_aw_bits_size          (sb_axi_awsize),
    .io_sb_brg_aw_bits_burst         (sb_axi_awburst),
    .io_sb_brg_aw_bits_lock          (sb_axi_awlock),
    .io_sb_brg_aw_bits_cache         (sb_axi_awcache),
    .io_sb_brg_aw_bits_prot          (sb_axi_awprot),
    .io_sb_brg_aw_bits_qos           (sb_axi_awqos),

    .io_sb_brg_w_valid          (sb_axi_wvalid),
    .io_sb_brg_w_ready          (sb_axi_wready),
    .io_sb_brg_w_bits_data           (sb_axi_wdata),
    .io_sb_brg_w_bits_strb           (sb_axi_wstrb),
    .io_sb_brg_w_bits_last           (sb_axi_wlast),

    .io_sb_brg_b_valid          (sb_axi_bvalid),
    .io_sb_brg_b_ready          (sb_axi_bready),
    .io_sb_brg_b_bits_resp           (sb_axi_bresp),
    .io_sb_brg_b_bits_id             (sb_axi_bid),


    .io_sb_brg_ar_valid         (sb_axi_arvalid),
    .io_sb_brg_ar_ready         (sb_axi_arready),
    .io_sb_brg_ar_bits_id            (sb_axi_arid),
    .io_sb_brg_ar_bits_addr          (sb_axi_araddr),
    .io_sb_brg_ar_bits_region        (sb_axi_arregion),
    .io_sb_brg_ar_bits_len           (sb_axi_arlen),
    .io_sb_brg_ar_bits_size          (sb_axi_arsize),
    .io_sb_brg_ar_bits_burst         (sb_axi_arburst),
    .io_sb_brg_ar_bits_lock          (sb_axi_arlock),
    .io_sb_brg_ar_bits_cache         (sb_axi_arcache),
    .io_sb_brg_ar_bits_prot          (sb_axi_arprot),
    .io_sb_brg_ar_bits_qos           (sb_axi_arqos),

    .io_sb_brg_r_valid          (sb_axi_rvalid),
    .io_sb_brg_r_ready          (sb_axi_rready),
    .io_sb_brg_r_bits_id             (sb_axi_rid),
    .io_sb_brg_r_bits_data           (sb_axi_rdata),
    .io_sb_brg_r_bits_resp           (sb_axi_rresp),
    .io_sb_brg_r_bits_last           (sb_axi_rlast),

    //-------------------------- DMA AXI signals--------------------------
    // AXI Write Channels
    .io_dma_brg_aw_valid        (dma_axi_awvalid),
    .io_dma_brg_aw_ready        (dma_axi_awready),
    .io_dma_brg_aw_bits_id           ('0),
    .io_dma_brg_aw_bits_addr         (lsu_axi_awaddr),
    .io_dma_brg_aw_bits_size         (lsu_axi_awsize),
    .io_dma_brg_aw_bits_prot         (lsu_axi_awprot),
    .io_dma_brg_aw_bits_len          (lsu_axi_awlen),
    .io_dma_brg_aw_bits_burst        (lsu_axi_awburst),
    .io_dma_brg_aw_bits_region        (lsu_axi_awregion),
    .io_dma_brg_aw_bits_lock        (lsu_axi_awlock),
    .io_dma_brg_aw_bits_cache        (lsu_axi_awcache),
    .io_dma_brg_aw_bits_qos        (lsu_axi_awqos),

    .io_dma_brg_w_valid         (dma_axi_wvalid),
    .io_dma_brg_w_ready         (dma_axi_wready),
    .io_dma_brg_w_bits_data          (lsu_axi_wdata),
    .io_dma_brg_w_bits_strb          (lsu_axi_wstrb),
    .io_dma_brg_w_bits_last          (lsu_axi_wlast),

    .io_dma_brg_b_valid         (dma_axi_bvalid),
    .io_dma_brg_b_ready         (dma_axi_bready),
    .io_dma_brg_b_bits_resp          (dma_axi_bresp),
    .io_dma_brg_b_bits_id            (),

    .io_dma_brg_ar_valid        (dma_axi_arvalid),
    .io_dma_brg_ar_ready        (dma_axi_arready),
    .io_dma_brg_ar_bits_id           ('0),
    .io_dma_brg_ar_bits_addr         (lsu_axi_araddr),
    .io_dma_brg_ar_bits_size         (lsu_axi_arsize),
    .io_dma_brg_ar_bits_prot         (lsu_axi_arprot),
    .io_dma_brg_ar_bits_len          (lsu_axi_arlen),
    .io_dma_brg_ar_bits_burst        (lsu_axi_arburst),
	.io_dma_brg_ar_bits_region        (lsu_axi_arregion),
    .io_dma_brg_ar_bits_lock        (lsu_axi_arlock),
    .io_dma_brg_ar_bits_cache        (lsu_axi_arcache),
    .io_dma_brg_ar_bits_qos        (lsu_axi_arqos),

    .io_dma_brg_r_valid         (dma_axi_rvalid),
    .io_dma_brg_r_ready         (dma_axi_rready),
    .io_dma_brg_r_bits_id            (),
    .io_dma_brg_r_bits_data          (dma_axi_rdata),
    .io_dma_brg_r_bits_resp          (dma_axi_rresp),
    .io_dma_brg_r_bits_last          (dma_axi_rlast),
`endif
    .io_timer_int              ( 1'b0     ),
    .io_extintsrc_req          ( '0  ),

    .io_lsu_bus_clk_en         ( 1'b1  ),// Clock ratio b/w cpu core clk & AHB master interface
    .io_ifu_bus_clk_en         ( 1'b1  ),// Clock ratio b/w cpu core clk & AHB master interface
    .io_dbg_bus_clk_en         ( 1'b1  ),// Clock ratio b/w cpu core clk & AHB Debug master interface
    .io_dma_bus_clk_en         ( 1'b1  ),// Clock ratio b/w cpu core clk & AHB slave interface

    .io_rv_trace_pkt_rv_i_insn_ip     (trace_rv_i_insn_ip),
    .io_rv_trace_pkt_rv_i_address_ip  (trace_rv_i_address_ip),
    .io_rv_trace_pkt_rv_i_valid_ip    (trace_rv_i_valid_ip),
    .io_rv_trace_pkt_rv_i_exception_ip(trace_rv_i_exception_ip),
    .io_rv_trace_pkt_rv_i_ecause_ip   (trace_rv_i_ecause_ip),
    .io_rv_trace_pkt_rv_i_interrupt_ip(trace_rv_i_interrupt_ip),
    .io_rv_trace_pkt_rv_i_tval_ip     (trace_rv_i_tval_ip),

    .io_jtag_tck               ( 1'b0  ),
    .io_jtag_tms               ( 1'b0  ),
    .io_jtag_tdi               ( 1'b0  ),
    .io_jtag_trst_n            ( 1'b0  ),
    .io_jtag_tdo               ( jtag_tdo ),

    .io_mpc_debug_halt_ack     ( mpc_debug_halt_ack),
    .io_mpc_debug_halt_req     ( 1'b0),
    .io_mpc_debug_run_ack      ( mpc_debug_run_ack),
    .io_mpc_debug_run_req      ( 1'b1),
    .io_mpc_reset_run_req      ( 1'b1),             // Start running after reset
    .io_debug_brkpt_status    ( debug_brkpt_status),

    .io_i_cpu_halt_req         ( 1'b0  ),    // Async halt req to CPU
    .io_o_cpu_halt_ack         ( o_cpu_halt_ack ),    // core response to halt
    .io_o_cpu_halt_status      ( o_cpu_halt_status ), // 1'b1 indicates core is halted
    .io_i_cpu_run_req          ( 1'b0  ),     // Async restart req to CPU
    .io_o_debug_mode_status    ( o_debug_mode_status),
    .io_o_cpu_run_ack          ( o_cpu_run_ack ),     // Core response to run req

    .io_dccm_ext_in_pkt_TEST1_0('0),
    .io_dccm_ext_in_pkt_TEST1_1('0),
    .io_dccm_ext_in_pkt_TEST1_2('0),
    .io_dccm_ext_in_pkt_TEST1_3('0),
    .io_dccm_ext_in_pkt_RME_0('0),
    .io_dccm_ext_in_pkt_RME_1('0),
    .io_dccm_ext_in_pkt_RME_2('0),
    .io_dccm_ext_in_pkt_RME_3('0),
    .io_dccm_ext_in_pkt_RM_0('0),
    .io_dccm_ext_in_pkt_RM_1('0),
    .io_dccm_ext_in_pkt_RM_2('0),
    .io_dccm_ext_in_pkt_RM_3('0),
    .io_dccm_ext_in_pkt_LS_0('0),
    .io_dccm_ext_in_pkt_LS_1('0),
    .io_dccm_ext_in_pkt_LS_2('0),
    .io_dccm_ext_in_pkt_LS_3('0),
    .io_dccm_ext_in_pkt_DS_0('0),
    .io_dccm_ext_in_pkt_DS_1('0),
    .io_dccm_ext_in_pkt_DS_2('0),
    .io_dccm_ext_in_pkt_DS_3('0),
    .io_dccm_ext_in_pkt_SD_0('0),
    .io_dccm_ext_in_pkt_SD_1('0),
    .io_dccm_ext_in_pkt_SD_2('0),
    .io_dccm_ext_in_pkt_SD_3('0),
    .io_dccm_ext_in_pkt_TEST_RNM_0('0),
    .io_dccm_ext_in_pkt_TEST_RNM_1('0),
    .io_dccm_ext_in_pkt_TEST_RNM_2('0),
    .io_dccm_ext_in_pkt_TEST_RNM_3('0),
    .io_dccm_ext_in_pkt_BC1_0('0),
    .io_dccm_ext_in_pkt_BC1_1('0),
    .io_dccm_ext_in_pkt_BC1_2('0),
    .io_dccm_ext_in_pkt_BC1_3('0),
    .io_dccm_ext_in_pkt_BC2_0('0),
    .io_dccm_ext_in_pkt_BC2_1('0),
    .io_dccm_ext_in_pkt_BC2_2('0),
    .io_dccm_ext_in_pkt_BC2_3('0),
    .io_iccm_ext_in_pkt_TEST1_0('0),
    .io_iccm_ext_in_pkt_TEST1_1('0),
    .io_iccm_ext_in_pkt_TEST1_2('0),
    .io_iccm_ext_in_pkt_TEST1_3('0),
    .io_iccm_ext_in_pkt_RME_0('0),
    .io_iccm_ext_in_pkt_RME_1('0),
    .io_iccm_ext_in_pkt_RME_2('0),
    .io_iccm_ext_in_pkt_RME_3('0),
    .io_iccm_ext_in_pkt_RM_0('0),
    .io_iccm_ext_in_pkt_RM_1('0),
    .io_iccm_ext_in_pkt_RM_2('0),
    .io_iccm_ext_in_pkt_RM_3('0),
    .io_iccm_ext_in_pkt_LS_0('0),
    .io_iccm_ext_in_pkt_LS_1('0),
    .io_iccm_ext_in_pkt_LS_2('0),
    .io_iccm_ext_in_pkt_LS_3('0),
    .io_iccm_ext_in_pkt_DS_0('0),
    .io_iccm_ext_in_pkt_DS_1('0),
    .io_iccm_ext_in_pkt_DS_2('0),
    .io_iccm_ext_in_pkt_DS_3('0),
    .io_iccm_ext_in_pkt_SD_0('0),
    .io_iccm_ext_in_pkt_SD_1('0),
    .io_iccm_ext_in_pkt_SD_2('0),
    .io_iccm_ext_in_pkt_SD_3('0),
    .io_iccm_ext_in_pkt_TEST_RNM_0('0),
    .io_iccm_ext_in_pkt_TEST_RNM_1('0),
    .io_iccm_ext_in_pkt_TEST_RNM_2('0),
    .io_iccm_ext_in_pkt_TEST_RNM_3('0),
    .io_iccm_ext_in_pkt_BC1_0('0),
    .io_iccm_ext_in_pkt_BC1_1('0),
    .io_iccm_ext_in_pkt_BC1_2('0),
    .io_iccm_ext_in_pkt_BC1_3('0),
    .io_iccm_ext_in_pkt_BC2_0('0),
    .io_iccm_ext_in_pkt_BC2_1('0),
    .io_iccm_ext_in_pkt_BC2_2('0),
    .io_iccm_ext_in_pkt_BC2_3('0),
    .io_ic_data_ext_in_pkt_0_TEST1_0('0),
    .io_ic_data_ext_in_pkt_0_TEST1_1('0),
    .io_ic_data_ext_in_pkt_0_RME_0('0),
    .io_ic_data_ext_in_pkt_0_RME_1('0),
    .io_ic_data_ext_in_pkt_0_RM_0('0),
    .io_ic_data_ext_in_pkt_0_RM_1('0),
    .io_ic_data_ext_in_pkt_0_LS_0('0),
    .io_ic_data_ext_in_pkt_0_LS_1('0),
    .io_ic_data_ext_in_pkt_0_DS_0('0),
    .io_ic_data_ext_in_pkt_0_DS_1('0),
    .io_ic_data_ext_in_pkt_0_SD_0('0),
    .io_ic_data_ext_in_pkt_0_SD_1('0),
    .io_ic_data_ext_in_pkt_0_TEST_RNM_0('0),
    .io_ic_data_ext_in_pkt_0_TEST_RNM_1('0),
    .io_ic_data_ext_in_pkt_0_BC1_0('0),
    .io_ic_data_ext_in_pkt_0_BC1_1('0),
    .io_ic_data_ext_in_pkt_0_BC2_0('0),
    .io_ic_data_ext_in_pkt_0_BC2_1('0),
    .io_ic_data_ext_in_pkt_1_TEST1_0('0),
    .io_ic_data_ext_in_pkt_1_TEST1_1('0),
    .io_ic_data_ext_in_pkt_1_RME_0('0),
    .io_ic_data_ext_in_pkt_1_RME_1('0),
    .io_ic_data_ext_in_pkt_1_RM_0('0),
    .io_ic_data_ext_in_pkt_1_RM_1('0),
    .io_ic_data_ext_in_pkt_1_LS_0('0),
    .io_ic_data_ext_in_pkt_1_LS_1('0),
    .io_ic_data_ext_in_pkt_1_DS_0('0),
    .io_ic_data_ext_in_pkt_1_DS_1('0),
    .io_ic_data_ext_in_pkt_1_SD_0('0),
    .io_ic_data_ext_in_pkt_1_SD_1('0),
    .io_ic_data_ext_in_pkt_1_TEST_RNM_0('0),
    .io_ic_data_ext_in_pkt_1_TEST_RNM_1('0),
    .io_ic_data_ext_in_pkt_1_BC1_0('0),
    .io_ic_data_ext_in_pkt_1_BC1_1('0),
    .io_ic_data_ext_in_pkt_1_BC2_0('0),
    .io_ic_data_ext_in_pkt_1_BC2_1('0),
    .io_ic_tag_ext_in_pkt_TEST1_0('0),
    .io_ic_tag_ext_in_pkt_TEST1_1('0),
    .io_ic_tag_ext_in_pkt_RME_0('0),
    .io_ic_tag_ext_in_pkt_RME_1('0),
    .io_ic_tag_ext_in_pkt_RM_0('0),
    .io_ic_tag_ext_in_pkt_RM_1('0),
    .io_ic_tag_ext_in_pkt_LS_0('0),
    .io_ic_tag_ext_in_pkt_LS_1('0),
    .io_ic_tag_ext_in_pkt_DS_0('0),
    .io_ic_tag_ext_in_pkt_DS_1('0),
    .io_ic_tag_ext_in_pkt_SD_0('0),
    .io_ic_tag_ext_in_pkt_SD_1('0),
    .io_ic_tag_ext_in_pkt_TEST_RNM_0('0),
    .io_ic_tag_ext_in_pkt_TEST_RNM_1('0),
    .io_ic_tag_ext_in_pkt_BC1_0('0),
    .io_ic_tag_ext_in_pkt_BC1_1('0),
    .io_ic_tag_ext_in_pkt_BC2_0('0),
    .io_ic_tag_ext_in_pkt_BC2_1('0),

    .io_dec_tlu_perfcnt0(),
    .io_dec_tlu_perfcnt1(),
    .io_dec_tlu_perfcnt2(),
    .io_dec_tlu_perfcnt3(),

    .io_soft_int               ('0),
    .io_core_id                ('0),
    .io_scan_mode              ( 1'b0 ),         // To enable scan mode
    .io_mbist_mode             ( 1'b0 )        // to enable mbist

);
//=========================================================================-
   // AHB I$ instance
   //=========================================================================-
`ifdef RV_BUILD_AHB_LITE

ahb_sif imem (
     // Inputs
     .HWDATA(64'h0),
     .HCLK(core_clk),
     .HSEL(1'b1),
     .HPROT(ic_hprot),
     .HWRITE(ic_hwrite),
     .HTRANS(ic_htrans),
     .HSIZE(ic_hsize),
     .HREADY(ic_hready),
     .HRESETn(rst_l),
     .HADDR(ic_haddr),
     .HBURST(ic_hburst),

     // Outputs
     .HREADYOUT(ic_hready),
     .HRESP(ic_hresp),
     .HRDATA(ic_hrdata[63:0])
);


ahb_sif lmem (
     // Inputs
     .HWDATA(lsu_hwdata),
     .HCLK(core_clk),
     .HSEL(1'b1),
     .HPROT(lsu_hprot),
     .HWRITE(lsu_hwrite),
     .HTRANS(lsu_htrans),
     .HSIZE(lsu_hsize),
     .HREADY(lsu_hready),
     .HRESETn(rst_l),
     .HADDR(lsu_haddr),
     .HBURST(lsu_hburst),

     // Outputs
     .HREADYOUT(lsu_hready),
     .HRESP(lsu_hresp),
     .HRDATA(lsu_hrdata[63:0])
);

`endif
`ifdef RV_BUILD_AXI4
axi_slv #(.TAGW(`RV_IFU_BUS_TAG)) imem(
    .aclk(core_clk),
    .rst_l(rst_l),
    .arvalid(ifu_axi_arvalid),
    .arready(ifu_axi_arready),
    .araddr(ifu_axi_araddr),
    .arid(ifu_axi_arid),
    .arlen(ifu_axi_arlen),
    .arburst(ifu_axi_arburst),
    .arsize(ifu_axi_arsize),

    .rvalid(ifu_axi_rvalid),
    .rready(ifu_axi_rready),
    .rdata(ifu_axi_rdata),
    .rresp(ifu_axi_rresp),
    .rid(ifu_axi_rid),
    .rlast(ifu_axi_rlast),

    .awvalid(1'b0),
    .awready(),
    .awaddr('0),
    .awid('0),
    .awlen('0),
    .awburst('0),
    .awsize('0),

    .wdata('0),
    .wstrb('0),
    .wvalid(1'b0),
    .wready(),

    .bvalid(),
    .bready(1'b0),
    .bresp(),
    .bid()
);

defparam lmem.TAGW =`RV_LSU_BUS_TAG;

//axi_slv #(.TAGW(`RV_LSU_BUS_TAG)) lmem(
axi_slv  lmem(
    .aclk(core_clk),
    .rst_l(rst_l),
    .arvalid(lmem_axi_arvalid),
    .arready(lmem_axi_arready),
    .araddr(lsu_axi_araddr),
    .arid(lsu_axi_arid),
    .arlen(lsu_axi_arlen),
    .arburst(lsu_axi_arburst),
    .arsize(lsu_axi_arsize),

    .rvalid(lmem_axi_rvalid),
    .rready(lmem_axi_rready),
    .rdata(lmem_axi_rdata),
    .rresp(lmem_axi_rresp),
    .rid(lmem_axi_rid),
    .rlast(lmem_axi_rlast),

    .awvalid(lmem_axi_awvalid),
    .awready(lmem_axi_awready),
    .awaddr(lsu_axi_awaddr),
    .awid(lsu_axi_awid),
    .awlen(lsu_axi_awlen),
    .awburst(lsu_axi_awburst),
    .awsize(lsu_axi_awsize),

    .wdata(lsu_axi_wdata),
    .wstrb(lsu_axi_wstrb),
    .wvalid(lmem_axi_wvalid),
    .wready(lmem_axi_wready),

    .bvalid(lmem_axi_bvalid),
    .bready(lmem_axi_bready),
    .bresp(lmem_axi_bresp),
    .bid(lmem_axi_bid)
);

axi_lsu_dma_bridge # (`RV_LSU_BUS_TAG,`RV_LSU_BUS_TAG ) bridge(
    .clk(core_clk),
    .reset_l(rst_l),

    .m_arvalid(lsu_axi_arvalid),
    .m_arid(lsu_axi_arid),
    .m_araddr(lsu_axi_araddr),
    .m_arready(lsu_axi_arready),

    .m_rvalid(lsu_axi_rvalid),
    .m_rready(lsu_axi_rready),
    .m_rdata(lsu_axi_rdata),
    .m_rid(lsu_axi_rid),
    .m_rresp(lsu_axi_rresp),
    .m_rlast(lsu_axi_rlast),

    .m_awvalid(lsu_axi_awvalid),
    .m_awid(lsu_axi_awid),
    .m_awaddr(lsu_axi_awaddr),
    .m_awready(lsu_axi_awready),

    .m_wvalid(lsu_axi_wvalid),
    .m_wready(lsu_axi_wready),

    .m_bresp(lsu_axi_bresp),
    .m_bvalid(lsu_axi_bvalid),
    .m_bid(lsu_axi_bid),
    .m_bready(lsu_axi_bready),

    .s0_arvalid(lmem_axi_arvalid),
    .s0_arready(lmem_axi_arready),

    .s0_rvalid(lmem_axi_rvalid),
    .s0_rid(lmem_axi_rid),
    .s0_rresp(lmem_axi_rresp),
    .s0_rdata(lmem_axi_rdata),
    .s0_rlast(lmem_axi_rlast),
    .s0_rready(lmem_axi_rready),

    .s0_awvalid(lmem_axi_awvalid),
    .s0_awready(lmem_axi_awready),

    .s0_wvalid(lmem_axi_wvalid),
    .s0_wready(lmem_axi_wready),

    .s0_bresp(lmem_axi_bresp),
    .s0_bvalid(lmem_axi_bvalid),
    .s0_bid(lmem_axi_bid),
    .s0_bready(lmem_axi_bready),


    .s1_arvalid(dma_axi_arvalid),
    .s1_arready(dma_axi_arready),

    .s1_rvalid(dma_axi_rvalid),
    .s1_rresp(dma_axi_rresp),
    .s1_rdata(dma_axi_rdata),
    .s1_rlast(dma_axi_rlast),
    .s1_rready(dma_axi_rready),

    .s1_awvalid(dma_axi_awvalid),
    .s1_awready(dma_axi_awready),

    .s1_wvalid(dma_axi_wvalid),
    .s1_wready(dma_axi_wready),

    .s1_bresp(dma_axi_bresp),
    .s1_bvalid(dma_axi_bvalid),
    .s1_bready(dma_axi_bready)
);


`endif

task preload_iccm;
bit[31:0] data;
bit[31:0] addr, eaddr, saddr;

/*
addresses:
 0xfffffff0 - ICCM start address to load
 0xfffffff4 - ICCM end address to load
*/

addr = 'hffff_fff0;
saddr = {lmem.mem[addr+3],lmem.mem[addr+2],lmem.mem[addr+1],lmem.mem[addr]};
if ( (saddr < `RV_ICCM_SADR) || (saddr > `RV_ICCM_EADR)) return;
`ifndef RV_ICCM_ENABLE
    $display("********************************************************");
    $display("ICCM preload: there is no ICCM in SweRV, terminating !!!");
    $display("********************************************************");
    $finish;
`endif
addr += 4;
eaddr = {lmem.mem[addr+3],lmem.mem[addr+2],lmem.mem[addr+1],lmem.mem[addr]};
$display("ICCM pre-load from %h to %h", saddr, eaddr);

for(addr= saddr; addr <= eaddr; addr+=4) begin
    data = {imem.mem[addr+3],imem.mem[addr+2],imem.mem[addr+1],imem.mem[addr]};
    slam_iccm_ram(addr, data == 0 ? 0 : {riscv_ecc32(data),data});
end

endtask


task preload_dccm;
bit[31:0] data;
bit[31:0] addr, saddr, eaddr;

/*
addresses:
 0xffff_fff8 - DCCM start address to load
 0xffff_fffc - DCCM end address to load
*/

addr = 'hffff_fff8;
saddr = {lmem.mem[addr+3],lmem.mem[addr+2],lmem.mem[addr+1],lmem.mem[addr]};
if (saddr < `RV_DCCM_SADR || saddr > `RV_DCCM_EADR) return;
`ifndef RV_DCCM_ENABLE
    $display("********************************************************");
    $display("DCCM preload: there is no DCCM in SweRV, terminating !!!");
    $display("********************************************************");
    $finish;
`endif
addr += 4;
eaddr = {lmem.mem[addr+3],lmem.mem[addr+2],lmem.mem[addr+1],lmem.mem[addr]};
$display("DCCM pre-load from %h to %h", saddr, eaddr);

for(addr=saddr; addr <= eaddr; addr+=4) begin
    data = {lmem.mem[addr+3],lmem.mem[addr+2],lmem.mem[addr+1],lmem.mem[addr]};
    slam_dccm_ram(addr, data == 0 ? 0 : {riscv_ecc32(data),data});
end

endtask

`define ICCM_PATH `RV_TOP.mem.iccm.iccm
`ifdef VERILATOR
`define DRAM(bk) rvtop.mem.Gen_dccm_enable.dccm.mem_bank[bk].ram.ram_core
`define IRAM(bk) `ICCM_PATH.mem_bank[bk].iccm_bank.ram_core
`else
`define DRAM(bk) rvtop.mem.Gen_dccm_enable.dccm.mem_bank[bk].dccm.dccm_bank.ram_core
`define IRAM(bk) `ICCM_PATH.mem_bank[bk].iccm.iccm_bank.ram_core
`endif


task slam_dccm_ram(input [31:0] addr, input[38:0] data);
int bank, indx;
bank = get_dccm_bank(addr, indx);
`ifdef RV_DCCM_ENABLE
case(bank)
0: `DRAM(0)[indx] = data;
1: `DRAM(1)[indx] = data;
`ifdef RV_DCCM_NUM_BANKS_4
2: `DRAM(2)[indx] = data;
3: `DRAM(3)[indx] = data;
`endif
`ifdef RV_DCCM_NUM_BANKS_8
2: `DRAM(2)[indx] = data;
3: `DRAM(3)[indx] = data;
4: `DRAM(4)[indx] = data;
5: `DRAM(5)[indx] = data;
6: `DRAM(6)[indx] = data;
7: `DRAM(7)[indx] = data;
`endif
endcase
`endif
//$display("Writing bank %0d indx=%0d A=%h, D=%h",bank, indx, addr, data);
endtask


task slam_iccm_ram( input[31:0] addr, input[38:0] data);
int bank, idx;

bank = get_iccm_bank(addr, idx);
`ifdef RV_ICCM_ENABLE
case(bank) // {
  0: `IRAM(0)[idx] = data;
  1: `IRAM(1)[idx] = data;
 `ifdef RV_ICCM_NUM_BANKS_4
  2: `IRAM(2)[idx] = data;
  3: `IRAM(3)[idx] = data;
 `endif
 `ifdef RV_ICCM_NUM_BANKS_8
  2: `IRAM(2)[idx] = data;
  3: `IRAM(3)[idx] = data;
  4: `IRAM(4)[idx] = data;
  5: `IRAM(5)[idx] = data;
  6: `IRAM(6)[idx] = data;
  7: `IRAM(7)[idx] = data;
 `endif

 `ifdef RV_ICCM_NUM_BANKS_16
  2: `IRAM(2)[idx] = data;
  3: `IRAM(3)[idx] = data;
  4: `IRAM(4)[idx] = data;
  5: `IRAM(5)[idx] = data;
  6: `IRAM(6)[idx] = data;
  7: `IRAM(7)[idx] = data;
  8: `IRAM(8)[idx] = data;
  9: `IRAM(9)[idx] = data;
  10: `IRAM(10)[idx] = data;
  11: `IRAM(11)[idx] = data;
  12: `IRAM(12)[idx] = data;
  13: `IRAM(13)[idx] = data;
  14: `IRAM(14)[idx] = data;
  15: `IRAM(15)[idx] = data;
 `endif
endcase // }
`endif
endtask

task init_iccm;
`ifdef RV_ICCM_ENABLE
    `IRAM(0) = '{default:39'h0};
    `IRAM(1) = '{default:39'h0};
`ifdef RV_ICCM_NUM_BANKS_4
    `IRAM(2) = '{default:39'h0};
    `IRAM(3) = '{default:39'h0};
`endif
`ifdef RV_ICCM_NUM_BANKS_8
    `IRAM(4) = '{default:39'h0};
    `IRAM(5) = '{default:39'h0};
    `IRAM(6) = '{default:39'h0};
    `IRAM(7) = '{default:39'h0};
`endif

`ifdef RV_ICCM_NUM_BANKS_16
    `IRAM(4) = '{default:39'h0};
    `IRAM(5) = '{default:39'h0};
    `IRAM(6) = '{default:39'h0};
    `IRAM(7) = '{default:39'h0};
    `IRAM(8) = '{default:39'h0};
    `IRAM(9) = '{default:39'h0};
    `IRAM(10) = '{default:39'h0};
    `IRAM(11) = '{default:39'h0};
    `IRAM(12) = '{default:39'h0};
    `IRAM(13) = '{default:39'h0};
    `IRAM(14) = '{default:39'h0};
    `IRAM(15) = '{default:39'h0};
 `endif
`endif
endtask


function[6:0] riscv_ecc32(input[31:0] data);
reg[6:0] synd;
synd[0] = ^(data & 32'h56aa_ad5b);
synd[1] = ^(data & 32'h9b33_366d);
synd[2] = ^(data & 32'he3c3_c78e);
synd[3] = ^(data & 32'h03fc_07f0);
synd[4] = ^(data & 32'h03ff_f800);
synd[5] = ^(data & 32'hfc00_0000);
synd[6] = ^{data, synd[5:0]};
return synd;
endfunction

function int get_dccm_bank(input[31:0] addr,  output int bank_idx);
`ifdef RV_DCCM_NUM_BANKS_2
    bank_idx = int'(addr[`RV_DCCM_BITS-1:3]);
    return int'( addr[2]);
`elsif RV_DCCM_NUM_BANKS_4
    bank_idx = int'(addr[`RV_DCCM_BITS-1:4]);
    return int'(addr[3:2]);
`elsif RV_DCCM_NUM_BANKS_8
    bank_idx = int'(addr[`RV_DCCM_BITS-1:5]);
    return int'( addr[4:2]);
`endif
endfunction

function int get_iccm_bank(input[31:0] addr,  output int bank_idx);
`ifdef RV_DCCM_NUM_BANKS_2
    bank_idx = int'(addr[`RV_DCCM_BITS-1:3]);
    return int'( addr[2]);
`elsif RV_ICCM_NUM_BANKS_4
    bank_idx = int'(addr[`RV_ICCM_BITS-1:4]);
    return int'(addr[3:2]);
`elsif RV_ICCM_NUM_BANKS_8
    bank_idx = int'(addr[`RV_ICCM_BITS-1:5]);
    return int'( addr[4:2]);
`elsif RV_ICCM_NUM_BANKS_16
    bank_idx = int'(addr[`RV_ICCM_BITS-1:6]);
    return int'( addr[5:2]);
`endif
endfunction

/* verilator lint_off CASEINCOMPLETE */
`include "testbench/dasm.svi"
/* verilator lint_on CASEINCOMPLETE */

endmodule
