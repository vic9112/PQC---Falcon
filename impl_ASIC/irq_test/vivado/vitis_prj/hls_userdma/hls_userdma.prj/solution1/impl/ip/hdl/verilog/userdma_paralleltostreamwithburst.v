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
        in_en_clrsts,
        in_m2s_len,
        outbuf_din,
        outbuf_num_data_valid,
        outbuf_fifo_cap,
        outbuf_full_n,
        outbuf_write,
        m2s_enb_clrsts_c_din,
        m2s_enb_clrsts_c_num_data_valid,
        m2s_enb_clrsts_c_fifo_cap,
        m2s_enb_clrsts_c_full_n,
        m2s_enb_clrsts_c_write
);

parameter    ap_ST_fsm_state1 = 20'd1;
parameter    ap_ST_fsm_state2 = 20'd2;
parameter    ap_ST_fsm_state3 = 20'd4;
parameter    ap_ST_fsm_state4 = 20'd8;
parameter    ap_ST_fsm_state5 = 20'd16;
parameter    ap_ST_fsm_state6 = 20'd32;
parameter    ap_ST_fsm_state7 = 20'd64;
parameter    ap_ST_fsm_state8 = 20'd128;
parameter    ap_ST_fsm_state9 = 20'd256;
parameter    ap_ST_fsm_state10 = 20'd512;
parameter    ap_ST_fsm_state11 = 20'd1024;
parameter    ap_ST_fsm_state12 = 20'd2048;
parameter    ap_ST_fsm_state13 = 20'd4096;
parameter    ap_ST_fsm_state14 = 20'd8192;
parameter    ap_ST_fsm_state15 = 20'd16384;
parameter    ap_ST_fsm_state16 = 20'd32768;
parameter    ap_ST_fsm_state17 = 20'd65536;
parameter    ap_ST_fsm_state18 = 20'd131072;
parameter    ap_ST_fsm_state19 = 20'd262144;
parameter    ap_ST_fsm_state20 = 20'd524288;

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
output  [31:0] m_axi_gmem1_WDATA;
output  [3:0] m_axi_gmem1_WSTRB;
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
input  [31:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [0:0] m_axi_gmem1_RID;
input  [6:0] m_axi_gmem1_RFIFONUM;
input  [0:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [0:0] m_axi_gmem1_BID;
input  [0:0] m_axi_gmem1_BUSER;
input  [63:0] in_memory;
input  [0:0] in_en_clrsts;
input  [31:0] in_m2s_len;
output  [32:0] outbuf_din;
input  [6:0] outbuf_num_data_valid;
input  [6:0] outbuf_fifo_cap;
input   outbuf_full_n;
output   outbuf_write;
output  [0:0] m2s_enb_clrsts_c_din;
input  [1:0] m2s_enb_clrsts_c_num_data_valid;
input  [1:0] m2s_enb_clrsts_c_fifo_cap;
input   m2s_enb_clrsts_c_full_n;
output   m2s_enb_clrsts_c_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg m_axi_gmem1_ARVALID;
reg[63:0] m_axi_gmem1_ARADDR;
reg[0:0] m_axi_gmem1_ARID;
reg[31:0] m_axi_gmem1_ARLEN;
reg[2:0] m_axi_gmem1_ARSIZE;
reg[1:0] m_axi_gmem1_ARBURST;
reg[1:0] m_axi_gmem1_ARLOCK;
reg[3:0] m_axi_gmem1_ARCACHE;
reg[2:0] m_axi_gmem1_ARPROT;
reg[3:0] m_axi_gmem1_ARQOS;
reg[3:0] m_axi_gmem1_ARREGION;
reg[0:0] m_axi_gmem1_ARUSER;
reg m_axi_gmem1_RREADY;
reg outbuf_write;
reg m2s_enb_clrsts_c_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [19:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    gmem1_blk_n_AR;
wire    ap_CS_fsm_state3;
reg    m2s_enb_clrsts_c_blk_n;
reg   [31:0] count_2_reg_304;
wire    ap_CS_fsm_state2;
wire  signed [31:0] count_3_fu_164_p3;
reg  signed [31:0] count_3_reg_313;
wire   [3:0] sub_fu_176_p2;
reg   [3:0] sub_reg_318;
wire   [0:0] icmp_ln95_fu_182_p2;
reg   [0:0] icmp_ln95_reg_323;
wire  signed [63:0] sext_ln106_fu_188_p1;
reg  signed [63:0] sext_ln106_reg_327;
reg   [61:0] trunc_ln1_reg_332;
wire   [31:0] select_ln95_fu_238_p3;
reg   [31:0] select_ln95_reg_343;
wire    ap_CS_fsm_state19;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_done;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_idle;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_ready;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WVALID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WDATA;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WSTRB;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WLAST;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WID;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARVALID;
wire   [63:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARADDR;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARID;
wire   [31:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLEN;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARSIZE;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARBURST;
wire   [1:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLOCK;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARCACHE;
wire   [2:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARPROT;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARQOS;
wire   [3:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARREGION;
wire   [0:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARUSER;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_RREADY;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_BREADY;
wire   [32:0] grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_din;
wire    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_write;
reg    grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg;
wire    ap_CS_fsm_state20;
wire  signed [63:0] sext_ln95_fu_213_p1;
reg   [63:0] idx_fu_82;
wire   [63:0] add_ln106_fu_269_p2;
reg    ap_block_state20_on_subcall_done;
wire   [0:0] icmp_ln108_fu_274_p2;
reg    ap_block_state1;
reg   [31:0] count_fu_86;
wire   [31:0] add_ln95_1_fu_259_p2;
wire   [31:0] select_ln83_fu_140_p3;
wire   [0:0] icmp_ln89_fu_158_p2;
wire   [3:0] trunc_ln79_fu_172_p1;
wire   [63:0] shl_ln95_fu_192_p2;
wire   [63:0] add_ln95_fu_198_p2;
wire   [27:0] tmp_fu_223_p4;
wire   [0:0] icmp_fu_232_p2;
wire   [31:0] sub_ln95_fu_246_p2;
wire   [31:0] select_ln95_1_fu_251_p3;
reg   [19:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
reg    ap_ST_fsm_state20_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 20'd1;
#0 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg = 1'b0;
end

userdma_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2 grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start),
    .ap_done(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_done),
    .ap_idle(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_idle),
    .ap_ready(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_ready),
    .m_axi_gmem1_AWVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(1'b0),
    .m_axi_gmem1_AWADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWADDR),
    .m_axi_gmem1_AWID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWID),
    .m_axi_gmem1_AWLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_AWUSER),
    .m_axi_gmem1_WVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WVALID),
    .m_axi_gmem1_WREADY(1'b0),
    .m_axi_gmem1_WDATA(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WDATA),
    .m_axi_gmem1_WSTRB(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WSTRB),
    .m_axi_gmem1_WLAST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WLAST),
    .m_axi_gmem1_WID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WID),
    .m_axi_gmem1_WUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_WUSER),
    .m_axi_gmem1_ARVALID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(m_axi_gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARADDR),
    .m_axi_gmem1_ARID(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARID),
    .m_axi_gmem1_ARLEN(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARUSER),
    .m_axi_gmem1_RVALID(m_axi_gmem1_RVALID),
    .m_axi_gmem1_RREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_RREADY),
    .m_axi_gmem1_RDATA(m_axi_gmem1_RDATA),
    .m_axi_gmem1_RLAST(m_axi_gmem1_RLAST),
    .m_axi_gmem1_RID(m_axi_gmem1_RID),
    .m_axi_gmem1_RFIFONUM(m_axi_gmem1_RFIFONUM),
    .m_axi_gmem1_RUSER(m_axi_gmem1_RUSER),
    .m_axi_gmem1_RRESP(m_axi_gmem1_RRESP),
    .m_axi_gmem1_BVALID(1'b0),
    .m_axi_gmem1_BREADY(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_BREADY),
    .m_axi_gmem1_BRESP(2'd0),
    .m_axi_gmem1_BID(1'd0),
    .m_axi_gmem1_BUSER(1'd0),
    .outbuf_din(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_din),
    .outbuf_num_data_valid(7'd0),
    .outbuf_fifo_cap(7'd0),
    .outbuf_full_n(outbuf_full_n),
    .outbuf_write(grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_write),
    .count(count_2_reg_304),
    .sext_ln95(trunc_ln1_reg_332),
    .select_ln95_cast(select_ln95_reg_343),
    .zext_ln95(sub_reg_318)
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
        end else if (((icmp_ln108_fu_274_p2 == 1'd1) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state19)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg <= 1'b1;
        end else if ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_ready == 1'b1)) begin
            grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg <= 1'b0;
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
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        count_fu_86 <= select_ln83_fu_140_p3;
    end else if ((1'b1 == ap_CS_fsm_state19)) begin
        count_fu_86 <= add_ln95_1_fu_259_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        idx_fu_82 <= 64'd0;
    end else if (((icmp_ln108_fu_274_p2 == 1'd0) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
        idx_fu_82 <= add_ln106_fu_269_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        count_2_reg_304 <= count_fu_86;
        count_3_reg_313 <= count_3_fu_164_p3;
        icmp_ln95_reg_323 <= icmp_ln95_fu_182_p2;
        sext_ln106_reg_327 <= sext_ln106_fu_188_p1;
        sub_reg_318 <= sub_fu_176_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        select_ln95_reg_343 <= select_ln95_fu_238_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln95_fu_182_p2 == 1'd1))) begin
        trunc_ln1_reg_332 <= {{add_ln95_fu_198_p2[63:2]}};
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state20_on_subcall_done)) begin
        ap_ST_fsm_state20_blk = 1'b1;
    end else begin
        ap_ST_fsm_state20_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((m_axi_gmem1_ARREADY == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln108_fu_274_p2 == 1'd1) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        gmem1_blk_n_AR = m_axi_gmem1_ARREADY;
    end else begin
        gmem1_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln108_fu_274_p2 == 1'd1) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m2s_enb_clrsts_c_blk_n = m2s_enb_clrsts_c_full_n;
    end else begin
        m2s_enb_clrsts_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        m2s_enb_clrsts_c_write = 1'b1;
    end else begin
        m2s_enb_clrsts_c_write = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem1_ARADDR = sext_ln95_fu_213_p1;
    end else if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARADDR = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARADDR;
    end else begin
        m_axi_gmem1_ARADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARBURST = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARBURST;
    end else begin
        m_axi_gmem1_ARBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARCACHE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARCACHE;
    end else begin
        m_axi_gmem1_ARCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARID;
    end else begin
        m_axi_gmem1_ARID = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem1_ARLEN = count_3_reg_313;
    end else if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARLEN = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLEN;
    end else begin
        m_axi_gmem1_ARLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARLOCK = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARLOCK;
    end else begin
        m_axi_gmem1_ARLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARPROT = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARPROT;
    end else begin
        m_axi_gmem1_ARPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARQOS = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARQOS;
    end else begin
        m_axi_gmem1_ARQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARREGION = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARREGION;
    end else begin
        m_axi_gmem1_ARREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARSIZE = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARSIZE;
    end else begin
        m_axi_gmem1_ARSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARUSER = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARUSER;
    end else begin
        m_axi_gmem1_ARUSER = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem1_ARVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_ARVALID = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_ARVALID;
    end else begin
        m_axi_gmem1_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1)))) begin
        m_axi_gmem1_RREADY = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_m_axi_gmem1_RREADY;
    end else begin
        m_axi_gmem1_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state20) & (icmp_ln95_reg_323 == 1'd1))) begin
        outbuf_write = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_write;
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
            if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln95_fu_182_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((m_axi_gmem1_ARREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            if (((icmp_ln108_fu_274_p2 == 1'd1) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((icmp_ln108_fu_274_p2 == 1'd0) & (1'b0 == ap_block_state20_on_subcall_done) & (1'b1 == ap_CS_fsm_state20))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln106_fu_269_p2 = ($signed(sext_ln106_reg_327) + $signed(idx_fu_82));

assign add_ln95_1_fu_259_p2 = (select_ln95_1_fu_251_p3 + count_2_reg_304);

assign add_ln95_fu_198_p2 = (shl_ln95_fu_192_p2 + in_memory);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0) | (m2s_enb_clrsts_c_full_n == 1'b0));
end

always @ (*) begin
    ap_block_state20_on_subcall_done = ((grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_done == 1'b0) & (icmp_ln95_reg_323 == 1'd1));
end

assign ap_ready = internal_ap_ready;

assign count_3_fu_164_p3 = ((icmp_ln89_fu_158_p2[0:0] == 1'b1) ? 32'd16 : count_fu_86);

assign grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_ap_start_reg;

assign icmp_fu_232_p2 = (($signed(tmp_fu_223_p4) < $signed(28'd1)) ? 1'b1 : 1'b0);

assign icmp_ln108_fu_274_p2 = ((count_fu_86 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln89_fu_158_p2 = (($signed(count_fu_86) > $signed(32'd16)) ? 1'b1 : 1'b0);

assign icmp_ln95_fu_182_p2 = (($signed(count_3_fu_164_p3) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign m2s_enb_clrsts_c_din = in_en_clrsts;

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

assign m_axi_gmem1_WDATA = 32'd0;

assign m_axi_gmem1_WID = 1'd0;

assign m_axi_gmem1_WLAST = 1'b0;

assign m_axi_gmem1_WSTRB = 4'd0;

assign m_axi_gmem1_WUSER = 1'd0;

assign m_axi_gmem1_WVALID = 1'b0;

assign outbuf_din = grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_95_2_fu_122_outbuf_din;

assign select_ln83_fu_140_p3 = ((in_en_clrsts[0:0] == 1'b1) ? 32'd0 : in_m2s_len);

assign select_ln95_1_fu_251_p3 = ((icmp_fu_232_p2[0:0] == 1'b1) ? sub_ln95_fu_246_p2 : 32'd4294967280);

assign select_ln95_fu_238_p3 = ((icmp_fu_232_p2[0:0] == 1'b1) ? count_2_reg_304 : 32'd16);

assign sext_ln106_fu_188_p1 = count_3_fu_164_p3;

assign sext_ln95_fu_213_p1 = $signed(trunc_ln1_reg_332);

assign shl_ln95_fu_192_p2 = idx_fu_82 << 64'd2;

assign start_out = real_start;

assign sub_fu_176_p2 = ($signed(trunc_ln79_fu_172_p1) + $signed(4'd15));

assign sub_ln95_fu_246_p2 = (32'd0 - count_2_reg_304);

assign tmp_fu_223_p4 = {{count_2_reg_304[31:4]}};

assign trunc_ln79_fu_172_p1 = count_3_fu_164_p3[3:0];

endmodule //userdma_paralleltostreamwithburst
