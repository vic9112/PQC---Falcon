// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fiFFNTT_fiFFNTT,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.300000,HLS_SYN_LAT=7455,HLS_SYN_TPT=none,HLS_SYN_MEM=22,HLS_SYN_DSP=0,HLS_SYN_FF=14423,HLS_SYN_LUT=12483,HLS_VERSION=2022_1}" *)

module fiFFNTT (
        ap_clk,
        ap_rst_n,
        m_axi_gmem0_AWVALID,
        m_axi_gmem0_AWREADY,
        m_axi_gmem0_AWADDR,
        m_axi_gmem0_AWID,
        m_axi_gmem0_AWLEN,
        m_axi_gmem0_AWSIZE,
        m_axi_gmem0_AWBURST,
        m_axi_gmem0_AWLOCK,
        m_axi_gmem0_AWCACHE,
        m_axi_gmem0_AWPROT,
        m_axi_gmem0_AWQOS,
        m_axi_gmem0_AWREGION,
        m_axi_gmem0_AWUSER,
        m_axi_gmem0_WVALID,
        m_axi_gmem0_WREADY,
        m_axi_gmem0_WDATA,
        m_axi_gmem0_WSTRB,
        m_axi_gmem0_WLAST,
        m_axi_gmem0_WID,
        m_axi_gmem0_WUSER,
        m_axi_gmem0_ARVALID,
        m_axi_gmem0_ARREADY,
        m_axi_gmem0_ARADDR,
        m_axi_gmem0_ARID,
        m_axi_gmem0_ARLEN,
        m_axi_gmem0_ARSIZE,
        m_axi_gmem0_ARBURST,
        m_axi_gmem0_ARLOCK,
        m_axi_gmem0_ARCACHE,
        m_axi_gmem0_ARPROT,
        m_axi_gmem0_ARQOS,
        m_axi_gmem0_ARREGION,
        m_axi_gmem0_ARUSER,
        m_axi_gmem0_RVALID,
        m_axi_gmem0_RREADY,
        m_axi_gmem0_RDATA,
        m_axi_gmem0_RLAST,
        m_axi_gmem0_RID,
        m_axi_gmem0_RUSER,
        m_axi_gmem0_RRESP,
        m_axi_gmem0_BVALID,
        m_axi_gmem0_BREADY,
        m_axi_gmem0_BRESP,
        m_axi_gmem0_BID,
        m_axi_gmem0_BUSER,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM0_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM0_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM0_DATA_WIDTH = 64;
parameter    C_M_AXI_GMEM0_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM0_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM0_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM0_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM0_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM0_USER_VALUE = 0;
parameter    C_M_AXI_GMEM0_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM0_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM0_WSTRB_WIDTH = (64 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_gmem0_AWVALID;
input   m_axi_gmem0_AWREADY;
output  [C_M_AXI_GMEM0_ADDR_WIDTH - 1:0] m_axi_gmem0_AWADDR;
output  [C_M_AXI_GMEM0_ID_WIDTH - 1:0] m_axi_gmem0_AWID;
output  [7:0] m_axi_gmem0_AWLEN;
output  [2:0] m_axi_gmem0_AWSIZE;
output  [1:0] m_axi_gmem0_AWBURST;
output  [1:0] m_axi_gmem0_AWLOCK;
output  [3:0] m_axi_gmem0_AWCACHE;
output  [2:0] m_axi_gmem0_AWPROT;
output  [3:0] m_axi_gmem0_AWQOS;
output  [3:0] m_axi_gmem0_AWREGION;
output  [C_M_AXI_GMEM0_AWUSER_WIDTH - 1:0] m_axi_gmem0_AWUSER;
output   m_axi_gmem0_WVALID;
input   m_axi_gmem0_WREADY;
output  [C_M_AXI_GMEM0_DATA_WIDTH - 1:0] m_axi_gmem0_WDATA;
output  [C_M_AXI_GMEM0_WSTRB_WIDTH - 1:0] m_axi_gmem0_WSTRB;
output   m_axi_gmem0_WLAST;
output  [C_M_AXI_GMEM0_ID_WIDTH - 1:0] m_axi_gmem0_WID;
output  [C_M_AXI_GMEM0_WUSER_WIDTH - 1:0] m_axi_gmem0_WUSER;
output   m_axi_gmem0_ARVALID;
input   m_axi_gmem0_ARREADY;
output  [C_M_AXI_GMEM0_ADDR_WIDTH - 1:0] m_axi_gmem0_ARADDR;
output  [C_M_AXI_GMEM0_ID_WIDTH - 1:0] m_axi_gmem0_ARID;
output  [7:0] m_axi_gmem0_ARLEN;
output  [2:0] m_axi_gmem0_ARSIZE;
output  [1:0] m_axi_gmem0_ARBURST;
output  [1:0] m_axi_gmem0_ARLOCK;
output  [3:0] m_axi_gmem0_ARCACHE;
output  [2:0] m_axi_gmem0_ARPROT;
output  [3:0] m_axi_gmem0_ARQOS;
output  [3:0] m_axi_gmem0_ARREGION;
output  [C_M_AXI_GMEM0_ARUSER_WIDTH - 1:0] m_axi_gmem0_ARUSER;
input   m_axi_gmem0_RVALID;
output   m_axi_gmem0_RREADY;
input  [C_M_AXI_GMEM0_DATA_WIDTH - 1:0] m_axi_gmem0_RDATA;
input   m_axi_gmem0_RLAST;
input  [C_M_AXI_GMEM0_ID_WIDTH - 1:0] m_axi_gmem0_RID;
input  [C_M_AXI_GMEM0_RUSER_WIDTH - 1:0] m_axi_gmem0_RUSER;
input  [1:0] m_axi_gmem0_RRESP;
input   m_axi_gmem0_BVALID;
output   m_axi_gmem0_BREADY;
input  [1:0] m_axi_gmem0_BRESP;
input  [C_M_AXI_GMEM0_ID_WIDTH - 1:0] m_axi_gmem0_BID;
input  [C_M_AXI_GMEM0_BUSER_WIDTH - 1:0] m_axi_gmem0_BUSER;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] in_r;
wire    mode;
wire    inverse;
reg   [0:0] inverse_read_reg_124;
reg   [0:0] mode_read_reg_130;
reg   [63:0] in_r_read_reg_137;
reg   [9:0] inplace_buf_address0;
reg    inplace_buf_ce0;
reg   [7:0] inplace_buf_we0;
reg   [63:0] inplace_buf_d0;
wire   [63:0] inplace_buf_q0;
reg   [9:0] inplace_buf_address1;
reg    inplace_buf_ce1;
reg   [7:0] inplace_buf_we1;
wire   [63:0] inplace_buf_q1;
wire    grp_in_copy_fu_90_ap_start;
wire    grp_in_copy_fu_90_ap_done;
wire    grp_in_copy_fu_90_ap_idle;
wire    grp_in_copy_fu_90_ap_ready;
wire    grp_in_copy_fu_90_m_axi_gmem0_AWVALID;
wire   [63:0] grp_in_copy_fu_90_m_axi_gmem0_AWADDR;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_AWID;
wire   [31:0] grp_in_copy_fu_90_m_axi_gmem0_AWLEN;
wire   [2:0] grp_in_copy_fu_90_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_in_copy_fu_90_m_axi_gmem0_AWBURST;
wire   [1:0] grp_in_copy_fu_90_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_in_copy_fu_90_m_axi_gmem0_AWPROT;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_AWQOS;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_AWREGION;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_AWUSER;
wire    grp_in_copy_fu_90_m_axi_gmem0_WVALID;
wire   [63:0] grp_in_copy_fu_90_m_axi_gmem0_WDATA;
wire   [7:0] grp_in_copy_fu_90_m_axi_gmem0_WSTRB;
wire    grp_in_copy_fu_90_m_axi_gmem0_WLAST;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_WID;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_WUSER;
wire    grp_in_copy_fu_90_m_axi_gmem0_ARVALID;
wire   [63:0] grp_in_copy_fu_90_m_axi_gmem0_ARADDR;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_ARID;
wire   [31:0] grp_in_copy_fu_90_m_axi_gmem0_ARLEN;
wire   [2:0] grp_in_copy_fu_90_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_in_copy_fu_90_m_axi_gmem0_ARBURST;
wire   [1:0] grp_in_copy_fu_90_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_in_copy_fu_90_m_axi_gmem0_ARPROT;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_ARQOS;
wire   [3:0] grp_in_copy_fu_90_m_axi_gmem0_ARREGION;
wire   [0:0] grp_in_copy_fu_90_m_axi_gmem0_ARUSER;
wire    grp_in_copy_fu_90_m_axi_gmem0_RREADY;
wire    grp_in_copy_fu_90_m_axi_gmem0_BREADY;
wire   [9:0] grp_in_copy_fu_90_inplace_buf_address0;
wire    grp_in_copy_fu_90_inplace_buf_ce0;
wire   [7:0] grp_in_copy_fu_90_inplace_buf_we0;
wire   [63:0] grp_in_copy_fu_90_inplace_buf_d0;
wire    grp_stages_fu_99_ap_start;
wire    grp_stages_fu_99_ap_done;
wire    grp_stages_fu_99_ap_idle;
wire    grp_stages_fu_99_ap_ready;
wire   [9:0] grp_stages_fu_99_inplace_buf_address0;
wire    grp_stages_fu_99_inplace_buf_ce0;
wire   [7:0] grp_stages_fu_99_inplace_buf_we0;
wire   [63:0] grp_stages_fu_99_inplace_buf_d0;
wire   [9:0] grp_stages_fu_99_inplace_buf_address1;
wire    grp_stages_fu_99_inplace_buf_ce1;
wire   [7:0] grp_stages_fu_99_inplace_buf_we1;
wire   [63:0] grp_stages_fu_99_inplace_buf_d1;
wire    grp_out_copy_fu_114_ap_start;
wire    grp_out_copy_fu_114_ap_done;
wire    grp_out_copy_fu_114_ap_idle;
wire    grp_out_copy_fu_114_ap_ready;
wire    grp_out_copy_fu_114_m_axi_gmem0_AWVALID;
wire   [63:0] grp_out_copy_fu_114_m_axi_gmem0_AWADDR;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_AWID;
wire   [31:0] grp_out_copy_fu_114_m_axi_gmem0_AWLEN;
wire   [2:0] grp_out_copy_fu_114_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_out_copy_fu_114_m_axi_gmem0_AWBURST;
wire   [1:0] grp_out_copy_fu_114_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_out_copy_fu_114_m_axi_gmem0_AWPROT;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_AWQOS;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_AWREGION;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_AWUSER;
wire    grp_out_copy_fu_114_m_axi_gmem0_WVALID;
wire   [63:0] grp_out_copy_fu_114_m_axi_gmem0_WDATA;
wire   [7:0] grp_out_copy_fu_114_m_axi_gmem0_WSTRB;
wire    grp_out_copy_fu_114_m_axi_gmem0_WLAST;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_WID;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_WUSER;
wire    grp_out_copy_fu_114_m_axi_gmem0_ARVALID;
wire   [63:0] grp_out_copy_fu_114_m_axi_gmem0_ARADDR;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_ARID;
wire   [31:0] grp_out_copy_fu_114_m_axi_gmem0_ARLEN;
wire   [2:0] grp_out_copy_fu_114_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_out_copy_fu_114_m_axi_gmem0_ARBURST;
wire   [1:0] grp_out_copy_fu_114_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_out_copy_fu_114_m_axi_gmem0_ARPROT;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_ARQOS;
wire   [3:0] grp_out_copy_fu_114_m_axi_gmem0_ARREGION;
wire   [0:0] grp_out_copy_fu_114_m_axi_gmem0_ARUSER;
wire    grp_out_copy_fu_114_m_axi_gmem0_RREADY;
wire    grp_out_copy_fu_114_m_axi_gmem0_BREADY;
wire   [9:0] grp_out_copy_fu_114_inplace_buf_address0;
wire    grp_out_copy_fu_114_inplace_buf_ce0;
wire   [9:0] grp_out_copy_fu_114_inplace_buf_address1;
wire    grp_out_copy_fu_114_inplace_buf_ce1;
reg    gmem0_AWVALID;
wire    gmem0_AWREADY;
reg    gmem0_WVALID;
wire    gmem0_WREADY;
reg    gmem0_ARVALID;
wire    gmem0_ARREADY;
wire    gmem0_RVALID;
reg    gmem0_RREADY;
wire   [63:0] gmem0_RDATA;
wire   [8:0] gmem0_RFIFONUM;
wire    gmem0_BVALID;
reg    gmem0_BREADY;
reg    grp_in_copy_fu_90_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg    grp_stages_fu_99_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg    grp_out_copy_fu_114_ap_start_reg;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg   [6:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 grp_in_copy_fu_90_ap_start_reg = 1'b0;
#0 grp_stages_fu_99_ap_start_reg = 1'b0;
#0 grp_out_copy_fu_114_ap_start_reg = 1'b0;
end

fiFFNTT_inplace_buf_RAM_AUTO_1R1W #(
    .DataWidth( 64 ),
    .AddressRange( 1024 ),
    .AddressWidth( 10 ))
inplace_buf_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(inplace_buf_address0),
    .ce0(inplace_buf_ce0),
    .we0(inplace_buf_we0),
    .d0(inplace_buf_d0),
    .q0(inplace_buf_q0),
    .address1(inplace_buf_address1),
    .ce1(inplace_buf_ce1),
    .we1(inplace_buf_we1),
    .d1(grp_stages_fu_99_inplace_buf_d1),
    .q1(inplace_buf_q1)
);

fiFFNTT_in_copy grp_in_copy_fu_90(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_in_copy_fu_90_ap_start),
    .ap_done(grp_in_copy_fu_90_ap_done),
    .ap_idle(grp_in_copy_fu_90_ap_idle),
    .ap_ready(grp_in_copy_fu_90_ap_ready),
    .m_axi_gmem0_AWVALID(grp_in_copy_fu_90_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(1'b0),
    .m_axi_gmem0_AWADDR(grp_in_copy_fu_90_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_in_copy_fu_90_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_in_copy_fu_90_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_in_copy_fu_90_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_in_copy_fu_90_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_in_copy_fu_90_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_in_copy_fu_90_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_in_copy_fu_90_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_in_copy_fu_90_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_in_copy_fu_90_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_in_copy_fu_90_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_in_copy_fu_90_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(1'b0),
    .m_axi_gmem0_WDATA(grp_in_copy_fu_90_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_in_copy_fu_90_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_in_copy_fu_90_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_in_copy_fu_90_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_in_copy_fu_90_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_in_copy_fu_90_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(gmem0_ARREADY),
    .m_axi_gmem0_ARADDR(grp_in_copy_fu_90_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_in_copy_fu_90_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_in_copy_fu_90_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_in_copy_fu_90_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_in_copy_fu_90_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_in_copy_fu_90_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_in_copy_fu_90_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_in_copy_fu_90_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_in_copy_fu_90_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_in_copy_fu_90_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_in_copy_fu_90_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(gmem0_RVALID),
    .m_axi_gmem0_RREADY(grp_in_copy_fu_90_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(gmem0_RDATA),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(gmem0_RFIFONUM),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(1'b0),
    .m_axi_gmem0_BREADY(grp_in_copy_fu_90_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(2'd0),
    .m_axi_gmem0_BID(1'd0),
    .m_axi_gmem0_BUSER(1'd0),
    .in_buf(in_r_read_reg_137),
    .inplace_buf_address0(grp_in_copy_fu_90_inplace_buf_address0),
    .inplace_buf_ce0(grp_in_copy_fu_90_inplace_buf_ce0),
    .inplace_buf_we0(grp_in_copy_fu_90_inplace_buf_we0),
    .inplace_buf_d0(grp_in_copy_fu_90_inplace_buf_d0),
    .mode(mode_read_reg_130)
);

fiFFNTT_stages grp_stages_fu_99(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_stages_fu_99_ap_start),
    .ap_done(grp_stages_fu_99_ap_done),
    .ap_idle(grp_stages_fu_99_ap_idle),
    .ap_ready(grp_stages_fu_99_ap_ready),
    .inplace_buf_address0(grp_stages_fu_99_inplace_buf_address0),
    .inplace_buf_ce0(grp_stages_fu_99_inplace_buf_ce0),
    .inplace_buf_we0(grp_stages_fu_99_inplace_buf_we0),
    .inplace_buf_d0(grp_stages_fu_99_inplace_buf_d0),
    .inplace_buf_q0(inplace_buf_q0),
    .inplace_buf_address1(grp_stages_fu_99_inplace_buf_address1),
    .inplace_buf_ce1(grp_stages_fu_99_inplace_buf_ce1),
    .inplace_buf_we1(grp_stages_fu_99_inplace_buf_we1),
    .inplace_buf_d1(grp_stages_fu_99_inplace_buf_d1),
    .inplace_buf_q1(inplace_buf_q1),
    .mode(mode_read_reg_130),
    .inverse(inverse_read_reg_124)
);

fiFFNTT_out_copy grp_out_copy_fu_114(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_out_copy_fu_114_ap_start),
    .ap_done(grp_out_copy_fu_114_ap_done),
    .ap_idle(grp_out_copy_fu_114_ap_idle),
    .ap_ready(grp_out_copy_fu_114_ap_ready),
    .m_axi_gmem0_AWVALID(grp_out_copy_fu_114_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(grp_out_copy_fu_114_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_out_copy_fu_114_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_out_copy_fu_114_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_out_copy_fu_114_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_out_copy_fu_114_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_out_copy_fu_114_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_out_copy_fu_114_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_out_copy_fu_114_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_out_copy_fu_114_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_out_copy_fu_114_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_out_copy_fu_114_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_out_copy_fu_114_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(gmem0_WREADY),
    .m_axi_gmem0_WDATA(grp_out_copy_fu_114_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_out_copy_fu_114_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_out_copy_fu_114_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_out_copy_fu_114_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_out_copy_fu_114_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_out_copy_fu_114_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(1'b0),
    .m_axi_gmem0_ARADDR(grp_out_copy_fu_114_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_out_copy_fu_114_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_out_copy_fu_114_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_out_copy_fu_114_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_out_copy_fu_114_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_out_copy_fu_114_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_out_copy_fu_114_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_out_copy_fu_114_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_out_copy_fu_114_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_out_copy_fu_114_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_out_copy_fu_114_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(1'b0),
    .m_axi_gmem0_RREADY(grp_out_copy_fu_114_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(64'd0),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(9'd0),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(gmem0_BVALID),
    .m_axi_gmem0_BREADY(grp_out_copy_fu_114_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(2'd0),
    .m_axi_gmem0_BID(1'd0),
    .m_axi_gmem0_BUSER(1'd0),
    .inplace_buf_address0(grp_out_copy_fu_114_inplace_buf_address0),
    .inplace_buf_ce0(grp_out_copy_fu_114_inplace_buf_ce0),
    .inplace_buf_q0(inplace_buf_q0),
    .inplace_buf_address1(grp_out_copy_fu_114_inplace_buf_address1),
    .inplace_buf_ce1(grp_out_copy_fu_114_inplace_buf_ce1),
    .inplace_buf_q1(inplace_buf_q1),
    .out_buf(in_r_read_reg_137),
    .mode(mode_read_reg_130),
    .inverse(inverse_read_reg_124)
);

fiFFNTT_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .in_r(in_r),
    .mode(mode),
    .inverse(inverse),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

fiFFNTT_gmem0_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM0_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM0_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM0_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM0_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM0_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM0_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM0_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM0_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM0_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM0_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM0_CACHE_VALUE ),
    .USER_DW( 64 ),
    .USER_AW( 64 ))
gmem0_m_axi_U(
    .AWVALID(m_axi_gmem0_AWVALID),
    .AWREADY(m_axi_gmem0_AWREADY),
    .AWADDR(m_axi_gmem0_AWADDR),
    .AWID(m_axi_gmem0_AWID),
    .AWLEN(m_axi_gmem0_AWLEN),
    .AWSIZE(m_axi_gmem0_AWSIZE),
    .AWBURST(m_axi_gmem0_AWBURST),
    .AWLOCK(m_axi_gmem0_AWLOCK),
    .AWCACHE(m_axi_gmem0_AWCACHE),
    .AWPROT(m_axi_gmem0_AWPROT),
    .AWQOS(m_axi_gmem0_AWQOS),
    .AWREGION(m_axi_gmem0_AWREGION),
    .AWUSER(m_axi_gmem0_AWUSER),
    .WVALID(m_axi_gmem0_WVALID),
    .WREADY(m_axi_gmem0_WREADY),
    .WDATA(m_axi_gmem0_WDATA),
    .WSTRB(m_axi_gmem0_WSTRB),
    .WLAST(m_axi_gmem0_WLAST),
    .WID(m_axi_gmem0_WID),
    .WUSER(m_axi_gmem0_WUSER),
    .ARVALID(m_axi_gmem0_ARVALID),
    .ARREADY(m_axi_gmem0_ARREADY),
    .ARADDR(m_axi_gmem0_ARADDR),
    .ARID(m_axi_gmem0_ARID),
    .ARLEN(m_axi_gmem0_ARLEN),
    .ARSIZE(m_axi_gmem0_ARSIZE),
    .ARBURST(m_axi_gmem0_ARBURST),
    .ARLOCK(m_axi_gmem0_ARLOCK),
    .ARCACHE(m_axi_gmem0_ARCACHE),
    .ARPROT(m_axi_gmem0_ARPROT),
    .ARQOS(m_axi_gmem0_ARQOS),
    .ARREGION(m_axi_gmem0_ARREGION),
    .ARUSER(m_axi_gmem0_ARUSER),
    .RVALID(m_axi_gmem0_RVALID),
    .RREADY(m_axi_gmem0_RREADY),
    .RDATA(m_axi_gmem0_RDATA),
    .RLAST(m_axi_gmem0_RLAST),
    .RID(m_axi_gmem0_RID),
    .RUSER(m_axi_gmem0_RUSER),
    .RRESP(m_axi_gmem0_RRESP),
    .BVALID(m_axi_gmem0_BVALID),
    .BREADY(m_axi_gmem0_BREADY),
    .BRESP(m_axi_gmem0_BRESP),
    .BID(m_axi_gmem0_BID),
    .BUSER(m_axi_gmem0_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(gmem0_ARVALID),
    .I_ARREADY(gmem0_ARREADY),
    .I_ARADDR(grp_in_copy_fu_90_m_axi_gmem0_ARADDR),
    .I_ARLEN(grp_in_copy_fu_90_m_axi_gmem0_ARLEN),
    .I_RVALID(gmem0_RVALID),
    .I_RREADY(gmem0_RREADY),
    .I_RDATA(gmem0_RDATA),
    .I_RFIFONUM(gmem0_RFIFONUM),
    .I_AWVALID(gmem0_AWVALID),
    .I_AWREADY(gmem0_AWREADY),
    .I_AWADDR(grp_out_copy_fu_114_m_axi_gmem0_AWADDR),
    .I_AWLEN(grp_out_copy_fu_114_m_axi_gmem0_AWLEN),
    .I_WVALID(gmem0_WVALID),
    .I_WREADY(gmem0_WREADY),
    .I_WDATA(grp_out_copy_fu_114_m_axi_gmem0_WDATA),
    .I_WSTRB(grp_out_copy_fu_114_m_axi_gmem0_WSTRB),
    .I_BVALID(gmem0_BVALID),
    .I_BREADY(gmem0_BREADY)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_in_copy_fu_90_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_in_copy_fu_90_ap_start_reg <= 1'b1;
        end else if ((grp_in_copy_fu_90_ap_ready == 1'b1)) begin
            grp_in_copy_fu_90_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_out_copy_fu_114_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_out_copy_fu_114_ap_start_reg <= 1'b1;
        end else if ((grp_out_copy_fu_114_ap_ready == 1'b1)) begin
            grp_out_copy_fu_114_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_stages_fu_99_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_stages_fu_99_ap_start_reg <= 1'b1;
        end else if ((grp_stages_fu_99_ap_ready == 1'b1)) begin
            grp_stages_fu_99_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_r_read_reg_137 <= in_r;
        inverse_read_reg_124 <= inverse;
        mode_read_reg_130 <= mode;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_in_copy_fu_90_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_stages_fu_99_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((grp_out_copy_fu_114_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_out_copy_fu_114_ap_done == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_out_copy_fu_114_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        gmem0_ARVALID = grp_in_copy_fu_90_m_axi_gmem0_ARVALID;
    end else begin
        gmem0_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        gmem0_AWVALID = grp_out_copy_fu_114_m_axi_gmem0_AWVALID;
    end else begin
        gmem0_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        gmem0_BREADY = grp_out_copy_fu_114_m_axi_gmem0_BREADY;
    end else begin
        gmem0_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        gmem0_RREADY = grp_in_copy_fu_90_m_axi_gmem0_RREADY;
    end else begin
        gmem0_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        gmem0_WVALID = grp_out_copy_fu_114_m_axi_gmem0_WVALID;
    end else begin
        gmem0_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        inplace_buf_address0 = grp_out_copy_fu_114_inplace_buf_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_address0 = grp_stages_fu_99_inplace_buf_address0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        inplace_buf_address0 = grp_in_copy_fu_90_inplace_buf_address0;
    end else begin
        inplace_buf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        inplace_buf_address1 = grp_out_copy_fu_114_inplace_buf_address1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_address1 = grp_stages_fu_99_inplace_buf_address1;
    end else begin
        inplace_buf_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        inplace_buf_ce0 = grp_out_copy_fu_114_inplace_buf_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_ce0 = grp_stages_fu_99_inplace_buf_ce0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        inplace_buf_ce0 = grp_in_copy_fu_90_inplace_buf_ce0;
    end else begin
        inplace_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        inplace_buf_ce1 = grp_out_copy_fu_114_inplace_buf_ce1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_ce1 = grp_stages_fu_99_inplace_buf_ce1;
    end else begin
        inplace_buf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_d0 = grp_stages_fu_99_inplace_buf_d0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        inplace_buf_d0 = grp_in_copy_fu_90_inplace_buf_d0;
    end else begin
        inplace_buf_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_we0 = grp_stages_fu_99_inplace_buf_we0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        inplace_buf_we0 = grp_in_copy_fu_90_inplace_buf_we0;
    end else begin
        inplace_buf_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        inplace_buf_we1 = grp_stages_fu_99_inplace_buf_we1;
    end else begin
        inplace_buf_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_in_copy_fu_90_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_stages_fu_99_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_out_copy_fu_114_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
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

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_in_copy_fu_90_ap_start = grp_in_copy_fu_90_ap_start_reg;

assign grp_out_copy_fu_114_ap_start = grp_out_copy_fu_114_ap_start_reg;

assign grp_stages_fu_99_ap_start = grp_stages_fu_99_ap_start_reg;

endmodule //fiFFNTT
