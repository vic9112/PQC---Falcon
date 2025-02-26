// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module userdma_paralleltostreamwithburst (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY,
        m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY,
        m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST,
        m_axi_gmem1_WID,
        m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST,
        m_axi_gmem1_RID,
        m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID,
        m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP,
        m_axi_gmem1_BID,
        m_axi_gmem1_BUSER,
        in_memory,
        kernel_mode,
        outbuf_din,
        outbuf_num_data_valid,
        outbuf_fifo_cap,
        outbuf_full_n,
        outbuf_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output   m_axi_gmem1_AWVALID;
input   m_axi_gmem1_AWREADY;
output  [63:0] m_axi_gmem1_AWADDR;
output  [0:0] m_axi_gmem1_AWID;
output  [31:0] m_axi_gmem1_AWLEN;
output  [2:0] m_axi_gmem1_AWSIZE;
output  [1:0] m_axi_gmem1_AWBURST;
output  [1:0] m_axi_gmem1_AWLOCK;
output  [3:0] m_axi_gmem1_AWCACHE;
output  [2:0] m_axi_gmem1_AWPROT;
output  [3:0] m_axi_gmem1_AWQOS;
output  [3:0] m_axi_gmem1_AWREGION;
output  [0:0] m_axi_gmem1_AWUSER;
output   m_axi_gmem1_WVALID;
input   m_axi_gmem1_WREADY;
output  [63:0] m_axi_gmem1_WDATA;
output  [7:0] m_axi_gmem1_WSTRB;
output   m_axi_gmem1_WLAST;
output  [0:0] m_axi_gmem1_WID;
output  [0:0] m_axi_gmem1_WUSER;
output   m_axi_gmem1_ARVALID;
input   m_axi_gmem1_ARREADY;
output  [63:0] m_axi_gmem1_ARADDR;
output  [0:0] m_axi_gmem1_ARID;
output  [31:0] m_axi_gmem1_ARLEN;
output  [2:0] m_axi_gmem1_ARSIZE;
output  [1:0] m_axi_gmem1_ARBURST;
output  [1:0] m_axi_gmem1_ARLOCK;
output  [3:0] m_axi_gmem1_ARCACHE;
output  [2:0] m_axi_gmem1_ARPROT;
output  [3:0] m_axi_gmem1_ARQOS;
output  [3:0] m_axi_gmem1_ARREGION;
output  [0:0] m_axi_gmem1_ARUSER;
input   m_axi_gmem1_RVALID;
output   m_axi_gmem1_RREADY;
input  [63:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [0:0] m_axi_gmem1_RID;
input  [10:0] m_axi_gmem1_RFIFONUM;
input  [0:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [0:0] m_axi_gmem1_BID;
input  [0:0] m_axi_gmem1_BUSER;
input  [63:0] in_memory;
input  [1:0] kernel_mode;
output  [32:0] outbuf_din;
input  [10:0] outbuf_num_data_valid;
input  [10:0] outbuf_fifo_cap;
input   outbuf_full_n;
output   outbuf_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg m_axi_gmem1_ARVALID;
reg m_axi_gmem1_RREADY;
reg[32:0] outbuf_din;
reg outbuf_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    outbuf_blk_n;
wire   [0:0] even_fu_145_p2;
reg   [0:0] even_reg_433;
reg   [0:0] tmp_reg_438;
wire   [5:0] shl_ln91_1_fu_226_p3;
reg   [5:0] shl_ln91_1_reg_443;
wire   [5:0] shl_ln91_3_fu_234_p3;
reg   [5:0] shl_ln91_3_reg_448;
wire   [31:0] count_3_fu_261_p3;
reg   [31:0] count_3_reg_456;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_fu_279_p2;
reg   [0:0] icmp_reg_465;
reg   [30:0] lshr_ln141_1_reg_470;
wire   [60:0] trunc_ln100_fu_304_p1;
reg   [60:0] trunc_ln100_reg_475;
wire    ap_CS_fsm_state3;
wire   [31:0] sub46_fu_309_p2;
reg   [31:0] sub46_reg_480;
wire   [31:0] final_m2s_len_fu_343_p2;
reg   [31:0] final_m2s_len_reg_485;
wire   [63:0] in_memory_addr_1_idx_fu_395_p2;
reg   [63:0] in_memory_addr_1_idx_reg_490;
wire   [0:0] icmp_ln145_fu_401_p2;
reg   [0:0] icmp_ln145_reg_495;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_idle;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_ready;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WDATA;
wire   [7:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WSTRB;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WLAST;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WID;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_RREADY;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_BREADY;
wire   [32:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_din;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_write;
reg    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg;
wire    ap_CS_fsm_state4;
reg   [63:0] in_memory_addr_0_idx_fu_90;
reg    ap_block_state1;
reg   [31:0] count_fu_94;
wire   [31:0] select_ln103_fu_151_p3;
wire   [32:0] p_0_fu_199_p3;
wire   [0:0] icmp_ln1065_fu_133_p2;
wire   [0:0] icmp_ln1065_3_fu_139_p2;
wire   [0:0] icmp_ln107_fu_159_p2;
wire   [0:0] or_ln107_fu_173_p2;
wire   [2:0] select_ln107_fu_165_p3;
wire   [2:0] select_ln107_1_fu_179_p3;
wire   [2:0] out_val_data_filed_V_fu_187_p3;
wire   [31:0] zext_ln97_fu_195_p1;
wire   [2:0] trunc_ln91_fu_216_p1;
wire   [2:0] xor_ln91_fu_220_p2;
wire   [0:0] icmp_ln113_fu_255_p2;
wire   [23:0] tmp_5_fu_269_p4;
wire   [31:0] sub_ln141_fu_285_p2;
wire   [31:0] select_ln121_fu_315_p3;
wire   [0:0] empty_44_fu_325_p2;
wire   [8:0] empty_fu_321_p1;
wire   [8:0] smax1_fu_331_p3;
wire   [31:0] zext_ln100_fu_339_p1;
wire   [31:0] zext_ln141_fu_355_p1;
wire   [30:0] lshr_ln141_2_fu_364_p4;
wire   [0:0] tmp_6_fu_348_p3;
wire   [31:0] sub_ln141_1_fu_358_p2;
wire   [31:0] zext_ln141_1_fu_373_p1;
wire   [31:0] select_ln141_fu_377_p3;
wire   [31:0] select_ln140_fu_385_p3;
wire  signed [63:0] sext_ln143_fu_391_p1;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg = 1'b0;
end

userdma_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start),
    .ap_done(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done),
    .ap_idle(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_idle),
    .ap_ready(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_ready),
    .m_axi_gmem1_AWVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(1'b0),
    .m_axi_gmem1_AWADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWADDR),
    .m_axi_gmem1_AWID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWID),
    .m_axi_gmem1_AWLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_AWUSER),
    .m_axi_gmem1_WVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WVALID),
    .m_axi_gmem1_WREADY(1'b0),
    .m_axi_gmem1_WDATA(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WDATA),
    .m_axi_gmem1_WSTRB(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WSTRB),
    .m_axi_gmem1_WLAST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WLAST),
    .m_axi_gmem1_WID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WID),
    .m_axi_gmem1_WUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_WUSER),
    .m_axi_gmem1_ARVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(m_axi_gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARADDR),
    .m_axi_gmem1_ARID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARID),
    .m_axi_gmem1_ARLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARUSER),
    .m_axi_gmem1_RVALID(m_axi_gmem1_RVALID),
    .m_axi_gmem1_RREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_RREADY),
    .m_axi_gmem1_RDATA(m_axi_gmem1_RDATA),
    .m_axi_gmem1_RLAST(m_axi_gmem1_RLAST),
    .m_axi_gmem1_RID(m_axi_gmem1_RID),
    .m_axi_gmem1_RFIFONUM(m_axi_gmem1_RFIFONUM),
    .m_axi_gmem1_RUSER(m_axi_gmem1_RUSER),
    .m_axi_gmem1_RRESP(m_axi_gmem1_RRESP),
    .m_axi_gmem1_BVALID(1'b0),
    .m_axi_gmem1_BREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_BREADY),
    .m_axi_gmem1_BRESP(2'd0),
    .m_axi_gmem1_BID(1'd0),
    .m_axi_gmem1_BUSER(1'd0),
    .outbuf_din(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_din),
    .outbuf_num_data_valid(11'd0),
    .outbuf_fifo_cap(11'd0),
    .outbuf_full_n(outbuf_full_n),
    .outbuf_write(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_write),
    .final_m2s_len_4(count_fu_94),
    .count_1(count_3_reg_456),
    .even(even_reg_433),
    .sub46(sub46_reg_480),
    .in_memory_addr_0_idx(trunc_ln100_reg_475),
    .in_memory(in_memory),
    .zext_ln91(shl_ln91_1_reg_443),
    .zext_ln91_1(shl_ln91_3_reg_448)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg <= 1'b1;
        end else if ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_ready == 1'b1)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        count_fu_94 <= select_ln103_fu_151_p3;
    end else if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd0))) begin
        count_fu_94 <= final_m2s_len_reg_485;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_memory_addr_0_idx_fu_90 <= 64'd0;
    end else if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd0))) begin
        in_memory_addr_0_idx_fu_90 <= in_memory_addr_1_idx_reg_490;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        count_3_reg_456 <= count_3_fu_261_p3;
        icmp_reg_465 <= icmp_fu_279_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        even_reg_433 <= even_fu_145_p2;
        shl_ln91_1_reg_443[5 : 3] <= shl_ln91_1_fu_226_p3[5 : 3];
        shl_ln91_3_reg_448[5 : 3] <= shl_ln91_3_fu_234_p3[5 : 3];
        tmp_reg_438 <= kernel_mode[32'd1];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        final_m2s_len_reg_485 <= final_m2s_len_fu_343_p2;
        icmp_ln145_reg_495 <= icmp_ln145_fu_401_p2;
        in_memory_addr_1_idx_reg_490 <= in_memory_addr_1_idx_fu_395_p2;
        sub46_reg_480 <= sub46_fu_309_p2;
        trunc_ln100_reg_475 <= trunc_ln100_fu_304_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (tmp_reg_438 == 1'd0))) begin
        lshr_ln141_1_reg_470 <= {{sub_ln141_fu_285_p2[31:1]}};
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (real_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem1_ARVALID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARVALID;
    end else begin
        m_axi_gmem1_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem1_RREADY = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_RREADY;
    end else begin
        m_axi_gmem1_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        outbuf_blk_n = outbuf_full_n;
    end else begin
        outbuf_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        outbuf_din = p_0_fu_199_p3;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        outbuf_din = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_din;
    end else begin
        outbuf_din = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_din;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        outbuf_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        outbuf_write = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_outbuf_write;
    end else begin
        outbuf_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((1'b1 == ap_CS_fsm_state4) & (grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_done == 1'b1) & (icmp_ln145_reg_495 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0) | (outbuf_full_n == 1'b0));
end

assign ap_ready = internal_ap_ready;

assign count_3_fu_261_p3 = ((icmp_ln113_fu_255_p2[0:0] == 1'b1) ? 32'd256 : count_fu_94);

assign empty_44_fu_325_p2 = (($signed(select_ln121_fu_315_p3) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign empty_fu_321_p1 = select_ln121_fu_315_p3[8:0];

assign even_fu_145_p2 = (icmp_ln1065_fu_133_p2 | icmp_ln1065_3_fu_139_p2);

assign final_m2s_len_fu_343_p2 = (count_fu_94 - zext_ln100_fu_339_p1);

assign grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_ap_start_reg;

assign icmp_fu_279_p2 = (($signed(tmp_5_fu_269_p4) < $signed(24'd1)) ? 1'b1 : 1'b0);

assign icmp_ln1065_3_fu_139_p2 = ((kernel_mode == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_133_p2 = ((kernel_mode == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln107_fu_159_p2 = ((kernel_mode == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln113_fu_255_p2 = (($signed(count_fu_94) > $signed(32'd256)) ? 1'b1 : 1'b0);

assign icmp_ln145_fu_401_p2 = ((count_fu_94 == zext_ln100_fu_339_p1) ? 1'b1 : 1'b0);

assign in_memory_addr_1_idx_fu_395_p2 = ($signed(sext_ln143_fu_391_p1) + $signed(in_memory_addr_0_idx_fu_90));

assign lshr_ln141_2_fu_364_p4 = {{count_3_reg_456[31:1]}};

assign m_axi_gmem1_ARADDR = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARADDR;

assign m_axi_gmem1_ARBURST = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARBURST;

assign m_axi_gmem1_ARCACHE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARCACHE;

assign m_axi_gmem1_ARID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARID;

assign m_axi_gmem1_ARLEN = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLEN;

assign m_axi_gmem1_ARLOCK = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARLOCK;

assign m_axi_gmem1_ARPROT = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARPROT;

assign m_axi_gmem1_ARQOS = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARQOS;

assign m_axi_gmem1_ARREGION = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARREGION;

assign m_axi_gmem1_ARSIZE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARSIZE;

assign m_axi_gmem1_ARUSER = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_121_2_fu_117_m_axi_gmem1_ARUSER;

assign m_axi_gmem1_AWADDR = 64'd0;

assign m_axi_gmem1_AWBURST = 2'd0;

assign m_axi_gmem1_AWCACHE = 4'd0;

assign m_axi_gmem1_AWID = 1'd0;

assign m_axi_gmem1_AWLEN = 32'd0;

assign m_axi_gmem1_AWLOCK = 2'd0;

assign m_axi_gmem1_AWPROT = 3'd0;

assign m_axi_gmem1_AWQOS = 4'd0;

assign m_axi_gmem1_AWREGION = 4'd0;

assign m_axi_gmem1_AWSIZE = 3'd0;

assign m_axi_gmem1_AWUSER = 1'd0;

assign m_axi_gmem1_AWVALID = 1'b0;

assign m_axi_gmem1_BREADY = 1'b0;

assign m_axi_gmem1_WDATA = 64'd0;

assign m_axi_gmem1_WID = 1'd0;

assign m_axi_gmem1_WLAST = 1'b0;

assign m_axi_gmem1_WSTRB = 8'd0;

assign m_axi_gmem1_WUSER = 1'd0;

assign m_axi_gmem1_WVALID = 1'b0;

assign or_ln107_fu_173_p2 = (icmp_ln107_fu_159_p2 | icmp_ln1065_3_fu_139_p2);

assign out_val_data_filed_V_fu_187_p3 = ((icmp_ln1065_fu_133_p2[0:0] == 1'b1) ? 3'd4 : select_ln107_1_fu_179_p3);

assign p_0_fu_199_p3 = {{1'd0}, {zext_ln97_fu_195_p1}};

assign select_ln103_fu_151_p3 = ((even_fu_145_p2[0:0] == 1'b1) ? 32'd2048 : 32'd1024);

assign select_ln107_1_fu_179_p3 = ((or_ln107_fu_173_p2[0:0] == 1'b1) ? select_ln107_fu_165_p3 : 3'd7);

assign select_ln107_fu_165_p3 = ((icmp_ln1065_3_fu_139_p2[0:0] == 1'b1) ? 3'd5 : 3'd6);

assign select_ln121_fu_315_p3 = ((icmp_reg_465[0:0] == 1'b1) ? count_fu_94 : 32'd256);

assign select_ln140_fu_385_p3 = ((tmp_reg_438[0:0] == 1'b1) ? count_3_reg_456 : select_ln141_fu_377_p3);

assign select_ln141_fu_377_p3 = ((tmp_6_fu_348_p3[0:0] == 1'b1) ? sub_ln141_1_fu_358_p2 : zext_ln141_1_fu_373_p1);

assign sext_ln143_fu_391_p1 = $signed(select_ln140_fu_385_p3);

assign shl_ln91_1_fu_226_p3 = {{xor_ln91_fu_220_p2}, {3'd0}};

assign shl_ln91_3_fu_234_p3 = {{trunc_ln91_fu_216_p1}, {3'd0}};

assign smax1_fu_331_p3 = ((empty_44_fu_325_p2[0:0] == 1'b1) ? empty_fu_321_p1 : 9'd0);

assign start_out = real_start;

assign sub46_fu_309_p2 = ($signed(count_3_reg_456) + $signed(32'd4294967295));

assign sub_ln141_1_fu_358_p2 = (32'd0 - zext_ln141_fu_355_p1);

assign sub_ln141_fu_285_p2 = (32'd0 - count_3_fu_261_p3);

assign tmp_5_fu_269_p4 = {{count_fu_94[31:8]}};

assign tmp_6_fu_348_p3 = count_3_reg_456[32'd31];

assign trunc_ln100_fu_304_p1 = in_memory_addr_0_idx_fu_90[60:0];

assign trunc_ln91_fu_216_p1 = in_memory[2:0];

assign xor_ln91_fu_220_p2 = (trunc_ln91_fu_216_p1 ^ 3'd4);

assign zext_ln100_fu_339_p1 = smax1_fu_331_p3;

assign zext_ln141_1_fu_373_p1 = lshr_ln141_2_fu_364_p4;

assign zext_ln141_fu_355_p1 = lshr_ln141_1_reg_470;

assign zext_ln97_fu_195_p1 = out_val_data_filed_V_fu_187_p3;

always @ (posedge ap_clk) begin
    shl_ln91_1_reg_443[2:0] <= 3'b000;
    shl_ln91_3_reg_448[2:0] <= 3'b000;
end

endmodule //userdma_paralleltostreamwithburst
