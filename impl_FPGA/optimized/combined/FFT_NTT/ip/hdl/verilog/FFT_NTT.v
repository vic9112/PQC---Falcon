// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="FFT_NTT_FFT_NTT,hls_ip_2022_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.300000,HLS_SYN_LAT=7353,HLS_SYN_TPT=none,HLS_SYN_MEM=25,HLS_SYN_DSP=0,HLS_SYN_FF=7117,HLS_SYN_LUT=9156,HLS_VERSION=2022_1}" *)

module FFT_NTT (
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

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;
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
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] in_r;
wire   [0:0] mode;
reg   [0:0] mode_read_reg_155;
reg   [63:0] in_r_read_reg_162;
wire   [2:0] add_ln18_fu_131_p2;
reg   [2:0] add_ln18_reg_168;
wire   [5:0] shl_ln_fu_137_p3;
reg   [5:0] shl_ln_reg_173;
wire   [7:0] shl_ln33_fu_149_p2;
reg   [7:0] shl_ln33_reg_179;
wire    ap_CS_fsm_state4;
reg   [9:0] in_buf_address0;
reg    in_buf_ce0;
reg   [7:0] in_buf_we0;
wire   [63:0] in_buf_q0;
reg    in_buf_ce1;
wire   [63:0] in_buf_q1;
reg   [9:0] out_buf_address0;
reg    out_buf_ce0;
reg   [7:0] out_buf_we0;
wire   [63:0] out_buf_q0;
reg    out_buf_ce1;
reg   [7:0] out_buf_we1;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_done;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_idle;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_ready;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWADDR;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWID;
wire   [31:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWLEN;
wire   [2:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWBURST;
wire   [1:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWPROT;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWQOS;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWREGION;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWUSER;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WDATA;
wire   [7:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WSTRB;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WLAST;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WID;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WUSER;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARADDR;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARID;
wire   [31:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARLEN;
wire   [2:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARBURST;
wire   [1:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARPROT;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARQOS;
wire   [3:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARREGION;
wire   [0:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARUSER;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_RREADY;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_BREADY;
wire   [9:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_address0;
wire    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_ce0;
wire   [7:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_we0;
wire   [63:0] grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_d0;
wire    grp_combine_stages_1_fu_103_ap_start;
wire    grp_combine_stages_1_fu_103_ap_done;
wire    grp_combine_stages_1_fu_103_ap_idle;
wire    grp_combine_stages_1_fu_103_ap_ready;
wire   [9:0] grp_combine_stages_1_fu_103_in_buf_address0;
wire    grp_combine_stages_1_fu_103_in_buf_ce0;
wire   [9:0] grp_combine_stages_1_fu_103_in_buf_address1;
wire    grp_combine_stages_1_fu_103_in_buf_ce1;
wire   [9:0] grp_combine_stages_1_fu_103_out_buf_address0;
wire    grp_combine_stages_1_fu_103_out_buf_ce0;
wire   [7:0] grp_combine_stages_1_fu_103_out_buf_we0;
wire   [63:0] grp_combine_stages_1_fu_103_out_buf_d0;
wire   [9:0] grp_combine_stages_1_fu_103_out_buf_address1;
wire    grp_combine_stages_1_fu_103_out_buf_ce1;
wire   [7:0] grp_combine_stages_1_fu_103_out_buf_we1;
wire   [63:0] grp_combine_stages_1_fu_103_out_buf_d1;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_idle;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_ready;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWADDR;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWID;
wire   [31:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWLEN;
wire   [2:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWBURST;
wire   [1:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWPROT;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWQOS;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWREGION;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWUSER;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WDATA;
wire   [7:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WSTRB;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WLAST;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WID;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WUSER;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARVALID;
wire   [63:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARADDR;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARID;
wire   [31:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARLEN;
wire   [2:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARBURST;
wire   [1:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARPROT;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARQOS;
wire   [3:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARREGION;
wire   [0:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARUSER;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_RREADY;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_BREADY;
wire   [9:0] grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_address0;
wire    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_ce0;
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
reg    grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_combine_stages_1_fu_103_ap_start_reg;
wire    ap_CS_fsm_state3;
reg    grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire   [2:0] trunc_ln18_fu_127_p1;
wire   [7:0] zext_ln33_fu_146_p1;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg = 1'b0;
#0 grp_combine_stages_1_fu_103_ap_start_reg = 1'b0;
#0 grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg = 1'b0;
end

FFT_NTT_in_buf_RAM_AUTO_1R1W #(
    .DataWidth( 64 ),
    .AddressRange( 1024 ),
    .AddressWidth( 10 ))
in_buf_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(in_buf_address0),
    .ce0(in_buf_ce0),
    .we0(in_buf_we0),
    .d0(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_d0),
    .q0(in_buf_q0),
    .address1(grp_combine_stages_1_fu_103_in_buf_address1),
    .ce1(in_buf_ce1),
    .q1(in_buf_q1)
);

FFT_NTT_out_buf_RAM_AUTO_1R1W #(
    .DataWidth( 64 ),
    .AddressRange( 1024 ),
    .AddressWidth( 10 ))
out_buf_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(out_buf_address0),
    .ce0(out_buf_ce0),
    .we0(out_buf_we0),
    .d0(grp_combine_stages_1_fu_103_out_buf_d0),
    .q0(out_buf_q0),
    .address1(grp_combine_stages_1_fu_103_out_buf_address1),
    .ce1(out_buf_ce1),
    .we1(out_buf_we1),
    .d1(grp_combine_stages_1_fu_103_out_buf_d1)
);

FFT_NTT_FFT_NTT_Pipeline_INMEMCPY grp_FFT_NTT_Pipeline_INMEMCPY_fu_90(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start),
    .ap_done(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_done),
    .ap_idle(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_idle),
    .ap_ready(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_ready),
    .m_axi_gmem0_AWVALID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(1'b0),
    .m_axi_gmem0_AWADDR(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(1'b0),
    .m_axi_gmem0_WDATA(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(gmem0_ARREADY),
    .m_axi_gmem0_ARADDR(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(gmem0_RVALID),
    .m_axi_gmem0_RREADY(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(gmem0_RDATA),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(gmem0_RFIFONUM),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(1'b0),
    .m_axi_gmem0_BREADY(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(2'd0),
    .m_axi_gmem0_BID(1'd0),
    .m_axi_gmem0_BUSER(1'd0),
    .in_buf_address0(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_address0),
    .in_buf_ce0(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_ce0),
    .in_buf_we0(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_we0),
    .in_buf_d0(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_d0),
    .in_r(in_r_read_reg_162),
    .mode(mode_read_reg_155),
    .zext_ln18(shl_ln_reg_173)
);

FFT_NTT_combine_stages_1 grp_combine_stages_1_fu_103(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_combine_stages_1_fu_103_ap_start),
    .ap_done(grp_combine_stages_1_fu_103_ap_done),
    .ap_idle(grp_combine_stages_1_fu_103_ap_idle),
    .ap_ready(grp_combine_stages_1_fu_103_ap_ready),
    .in_buf_address0(grp_combine_stages_1_fu_103_in_buf_address0),
    .in_buf_ce0(grp_combine_stages_1_fu_103_in_buf_ce0),
    .in_buf_q0(in_buf_q0),
    .in_buf_address1(grp_combine_stages_1_fu_103_in_buf_address1),
    .in_buf_ce1(grp_combine_stages_1_fu_103_in_buf_ce1),
    .in_buf_q1(in_buf_q1),
    .out_buf_address0(grp_combine_stages_1_fu_103_out_buf_address0),
    .out_buf_ce0(grp_combine_stages_1_fu_103_out_buf_ce0),
    .out_buf_we0(grp_combine_stages_1_fu_103_out_buf_we0),
    .out_buf_d0(grp_combine_stages_1_fu_103_out_buf_d0),
    .out_buf_address1(grp_combine_stages_1_fu_103_out_buf_address1),
    .out_buf_ce1(grp_combine_stages_1_fu_103_out_buf_ce1),
    .out_buf_we1(grp_combine_stages_1_fu_103_out_buf_we1),
    .out_buf_d1(grp_combine_stages_1_fu_103_out_buf_d1),
    .mode(mode_read_reg_155)
);

FFT_NTT_FFT_NTT_Pipeline_OUTMEMCPY grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start),
    .ap_done(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done),
    .ap_idle(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_idle),
    .ap_ready(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_ready),
    .m_axi_gmem0_AWVALID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(gmem0_WREADY),
    .m_axi_gmem0_WDATA(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(1'b0),
    .m_axi_gmem0_ARADDR(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(1'b0),
    .m_axi_gmem0_RREADY(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(64'd0),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(9'd0),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(gmem0_BVALID),
    .m_axi_gmem0_BREADY(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(2'd0),
    .m_axi_gmem0_BID(1'd0),
    .m_axi_gmem0_BUSER(1'd0),
    .in_r(in_r_read_reg_162),
    .out_buf_address0(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_address0),
    .out_buf_ce0(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_ce0),
    .out_buf_q0(out_buf_q0),
    .mode(mode_read_reg_155),
    .zext_ln18(shl_ln_reg_173),
    .shl_ln33(shl_ln33_reg_179)
);

FFT_NTT_control_s_axi #(
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
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

FFT_NTT_gmem0_m_axi #(
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
    .I_ARADDR(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARADDR),
    .I_ARLEN(grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARLEN),
    .I_RVALID(gmem0_RVALID),
    .I_RREADY(gmem0_RREADY),
    .I_RDATA(gmem0_RDATA),
    .I_RFIFONUM(gmem0_RFIFONUM),
    .I_AWVALID(gmem0_AWVALID),
    .I_AWREADY(gmem0_AWREADY),
    .I_AWADDR(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWADDR),
    .I_AWLEN(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWLEN),
    .I_WVALID(gmem0_WVALID),
    .I_WREADY(gmem0_WREADY),
    .I_WDATA(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WDATA),
    .I_WSTRB(grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WSTRB),
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
        grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg <= 1'b1;
        end else if ((grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_ready == 1'b1)) begin
            grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg <= 1'b1;
        end else if ((grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_ready == 1'b1)) begin
            grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_combine_stages_1_fu_103_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_combine_stages_1_fu_103_ap_start_reg <= 1'b1;
        end else if ((grp_combine_stages_1_fu_103_ap_ready == 1'b1)) begin
            grp_combine_stages_1_fu_103_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln18_reg_168 <= add_ln18_fu_131_p2;
        in_r_read_reg_162 <= in_r;
        mode_read_reg_155 <= mode;
        shl_ln_reg_173[5 : 3] <= shl_ln_fu_137_p3[5 : 3];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        shl_ln33_reg_179 <= shl_ln33_fu_149_p2;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_combine_stages_1_fu_103_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
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
    if (((grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state1))) begin
        gmem0_ARVALID = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_ARVALID;
    end else begin
        gmem0_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5))) begin
        gmem0_AWVALID = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_AWVALID;
    end else begin
        gmem0_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5))) begin
        gmem0_BREADY = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_BREADY;
    end else begin
        gmem0_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state1))) begin
        gmem0_RREADY = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_m_axi_gmem0_RREADY;
    end else begin
        gmem0_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5))) begin
        gmem0_WVALID = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_m_axi_gmem0_WVALID;
    end else begin
        gmem0_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        in_buf_address0 = grp_combine_stages_1_fu_103_in_buf_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        in_buf_address0 = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_address0;
    end else begin
        in_buf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        in_buf_ce0 = grp_combine_stages_1_fu_103_in_buf_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        in_buf_ce0 = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_ce0;
    end else begin
        in_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        in_buf_ce1 = grp_combine_stages_1_fu_103_in_buf_ce1;
    end else begin
        in_buf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        in_buf_we0 = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_in_buf_we0;
    end else begin
        in_buf_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_buf_address0 = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_buf_address0 = grp_combine_stages_1_fu_103_out_buf_address0;
    end else begin
        out_buf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        out_buf_ce0 = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_out_buf_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        out_buf_ce0 = grp_combine_stages_1_fu_103_out_buf_ce0;
    end else begin
        out_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out_buf_ce1 = grp_combine_stages_1_fu_103_out_buf_ce1;
    end else begin
        out_buf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out_buf_we0 = grp_combine_stages_1_fu_103_out_buf_we0;
    end else begin
        out_buf_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out_buf_we1 = grp_combine_stages_1_fu_103_out_buf_we1;
    end else begin
        out_buf_we1 = 1'b0;
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
            if (((1'b1 == ap_CS_fsm_state2) & (grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_combine_stages_1_fu_103_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln18_fu_131_p2 = ($signed(trunc_ln18_fu_127_p1) + $signed(3'd6));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start = grp_FFT_NTT_Pipeline_INMEMCPY_fu_90_ap_start_reg;

assign grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start = grp_FFT_NTT_Pipeline_OUTMEMCPY_fu_116_ap_start_reg;

assign grp_combine_stages_1_fu_103_ap_start = grp_combine_stages_1_fu_103_ap_start_reg;

assign shl_ln33_fu_149_p2 = 8'd3 << zext_ln33_fu_146_p1;

assign shl_ln_fu_137_p3 = {{add_ln18_fu_131_p2}, {3'd0}};

assign trunc_ln18_fu_127_p1 = in_r[2:0];

assign zext_ln33_fu_146_p1 = add_ln18_reg_168;

always @ (posedge ap_clk) begin
    shl_ln_reg_173[2:0] <= 3'b000;
end

endmodule //FFT_NTT
