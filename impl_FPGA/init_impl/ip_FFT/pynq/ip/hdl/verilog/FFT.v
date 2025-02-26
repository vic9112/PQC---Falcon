// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="FFT_FFT,hls_ip_2022_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=25.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=18.250000,HLS_SYN_LAT=100921,HLS_SYN_TPT=none,HLS_SYN_MEM=8,HLS_SYN_DSP=0,HLS_SYN_FF=4417,HLS_SYN_LUT=5687,HLS_VERSION=2022_1}" *)

module FFT (
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

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;
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
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [63:0] f;
wire   [31:0] logn;
wire   [10:0] fpr_gm_tab_address0;
reg    fpr_gm_tab_ce0;
wire   [63:0] fpr_gm_tab_q0;
wire   [10:0] fpr_gm_tab_address1;
reg    fpr_gm_tab_ce1;
wire   [63:0] fpr_gm_tab_q1;
reg   [31:0] logn_read_reg_402;
reg   [63:0] f_read_reg_407;
reg   [60:0] trunc_ln1_reg_412;
wire   [63:0] zext_ln956_fu_256_p1;
reg   [63:0] zext_ln956_reg_423;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln956_fu_248_p2;
wire   [62:0] zext_ln960_fu_270_p1;
reg   [62:0] zext_ln960_reg_429;
wire   [63:0] zext_ln958_fu_274_p1;
reg   [62:0] trunc_ln2_reg_439;
wire   [9:0] trunc_ln968_fu_288_p1;
reg   [9:0] trunc_ln968_reg_444;
reg   [60:0] trunc_ln4_reg_449;
wire   [62:0] i1_1_fu_307_p2;
reg   [62:0] i1_1_reg_457;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln962_fu_302_p2;
wire   [63:0] j1_fu_346_p2;
reg   [63:0] j1_reg_472;
wire   [63:0] add_ln962_fu_351_p2;
reg   [63:0] add_ln962_reg_477;
reg   [63:0] s_re_reg_482;
wire    ap_CS_fsm_state4;
reg   [63:0] s_im_reg_487;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_idle;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_ready;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWVALID;
wire   [63:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWADDR;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWID;
wire   [31:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWLEN;
wire   [2:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWBURST;
wire   [1:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWPROT;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWQOS;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWREGION;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWUSER;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WVALID;
wire   [63:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WDATA;
wire   [7:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WSTRB;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WLAST;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WID;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WUSER;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARVALID;
wire   [63:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARADDR;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARID;
wire   [31:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARLEN;
wire   [2:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARBURST;
wire   [1:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARPROT;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARQOS;
wire   [3:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARREGION;
wire   [0:0] grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARUSER;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_RREADY;
wire    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_BREADY;
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
reg   [63:0] indvars_iv_reg_147;
wire    ap_CS_fsm_state5;
reg   [63:0] j1_2_reg_157;
reg   [62:0] i1_reg_169;
reg    grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg;
wire   [63:0] zext_ln968_fu_330_p1;
wire   [63:0] zext_ln969_fu_341_p1;
reg   [63:0] m_fu_98;
wire   [63:0] m_1_fu_361_p2;
reg   [62:0] t_fu_102;
reg   [31:0] u_fu_106;
wire   [31:0] u_3_fu_356_p2;
wire   [63:0] zext_ln952_fu_200_p1;
wire   [63:0] n_fu_204_p2;
wire   [61:0] ht_fu_260_p4;
wire   [9:0] trunc_ln968_1_fu_313_p1;
wire   [9:0] add_ln968_fu_317_p2;
wire   [10:0] shl_ln_fu_322_p3;
wire   [10:0] or_ln969_fu_335_p2;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg = 1'b0;
end

FFT_fpr_gm_tab_ROM_AUTO_1R #(
    .DataWidth( 64 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
fpr_gm_tab_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(fpr_gm_tab_address0),
    .ce0(fpr_gm_tab_ce0),
    .q0(fpr_gm_tab_q0),
    .address1(fpr_gm_tab_address1),
    .ce1(fpr_gm_tab_ce1),
    .q1(fpr_gm_tab_q1)
);

FFT_FFT_Pipeline_VITIS_LOOP_972_3 grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start),
    .ap_done(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done),
    .ap_idle(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_idle),
    .ap_ready(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_ready),
    .m_axi_gmem0_AWVALID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(gmem0_WREADY),
    .m_axi_gmem0_WDATA(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(gmem0_ARREADY),
    .m_axi_gmem0_ARADDR(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(gmem0_RVALID),
    .m_axi_gmem0_RREADY(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(gmem0_RDATA),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(gmem0_RFIFONUM),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(gmem0_BVALID),
    .m_axi_gmem0_BREADY(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(2'd0),
    .m_axi_gmem0_BID(1'd0),
    .m_axi_gmem0_BUSER(1'd0),
    .j1_2(j1_2_reg_157),
    .indvars_iv(indvars_iv_reg_147),
    .f(f_read_reg_407),
    .trunc_ln1(trunc_ln1_reg_412),
    .trunc_ln4(trunc_ln4_reg_449),
    .s_re(s_re_reg_482),
    .s_im(s_im_reg_487)
);

FFT_control_s_axi #(
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
    .f(f),
    .logn(logn),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

FFT_gmem0_m_axi #(
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
    .I_ARADDR(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARADDR),
    .I_ARLEN(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARLEN),
    .I_RVALID(gmem0_RVALID),
    .I_RREADY(gmem0_RREADY),
    .I_RDATA(gmem0_RDATA),
    .I_RFIFONUM(gmem0_RFIFONUM),
    .I_AWVALID(gmem0_AWVALID),
    .I_AWREADY(gmem0_AWREADY),
    .I_AWADDR(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWADDR),
    .I_AWLEN(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWLEN),
    .I_WVALID(gmem0_WVALID),
    .I_WREADY(gmem0_WREADY),
    .I_WDATA(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WDATA),
    .I_WSTRB(grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WSTRB),
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
        grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg <= 1'b1;
        end else if ((grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_ready == 1'b1)) begin
            grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd1))) begin
        i1_reg_169 <= 63'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done == 1'b1))) begin
        i1_reg_169 <= i1_1_reg_457;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd1))) begin
        indvars_iv_reg_147 <= zext_ln958_fu_274_p1;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done == 1'b1))) begin
        indvars_iv_reg_147 <= add_ln962_reg_477;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd1))) begin
        j1_2_reg_157 <= 64'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done == 1'b1))) begin
        j1_2_reg_157 <= j1_reg_472;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                m_fu_98[1] <= 1'b1;
        m_fu_98[2] <= 1'b0;
        m_fu_98[3] <= 1'b0;
        m_fu_98[4] <= 1'b0;
        m_fu_98[5] <= 1'b0;
        m_fu_98[6] <= 1'b0;
        m_fu_98[7] <= 1'b0;
        m_fu_98[8] <= 1'b0;
        m_fu_98[9] <= 1'b0;
        m_fu_98[10] <= 1'b0;
        m_fu_98[11] <= 1'b0;
        m_fu_98[12] <= 1'b0;
        m_fu_98[13] <= 1'b0;
        m_fu_98[14] <= 1'b0;
        m_fu_98[15] <= 1'b0;
        m_fu_98[16] <= 1'b0;
        m_fu_98[17] <= 1'b0;
        m_fu_98[18] <= 1'b0;
        m_fu_98[19] <= 1'b0;
        m_fu_98[20] <= 1'b0;
        m_fu_98[21] <= 1'b0;
        m_fu_98[22] <= 1'b0;
        m_fu_98[23] <= 1'b0;
        m_fu_98[24] <= 1'b0;
        m_fu_98[25] <= 1'b0;
        m_fu_98[26] <= 1'b0;
        m_fu_98[27] <= 1'b0;
        m_fu_98[28] <= 1'b0;
        m_fu_98[29] <= 1'b0;
        m_fu_98[30] <= 1'b0;
        m_fu_98[31] <= 1'b0;
        m_fu_98[32] <= 1'b0;
        m_fu_98[33] <= 1'b0;
        m_fu_98[34] <= 1'b0;
        m_fu_98[35] <= 1'b0;
        m_fu_98[36] <= 1'b0;
        m_fu_98[37] <= 1'b0;
        m_fu_98[38] <= 1'b0;
        m_fu_98[39] <= 1'b0;
        m_fu_98[40] <= 1'b0;
        m_fu_98[41] <= 1'b0;
        m_fu_98[42] <= 1'b0;
        m_fu_98[43] <= 1'b0;
        m_fu_98[44] <= 1'b0;
        m_fu_98[45] <= 1'b0;
        m_fu_98[46] <= 1'b0;
        m_fu_98[47] <= 1'b0;
        m_fu_98[48] <= 1'b0;
        m_fu_98[49] <= 1'b0;
        m_fu_98[50] <= 1'b0;
        m_fu_98[51] <= 1'b0;
        m_fu_98[52] <= 1'b0;
        m_fu_98[53] <= 1'b0;
        m_fu_98[54] <= 1'b0;
        m_fu_98[55] <= 1'b0;
        m_fu_98[56] <= 1'b0;
        m_fu_98[57] <= 1'b0;
        m_fu_98[58] <= 1'b0;
        m_fu_98[59] <= 1'b0;
        m_fu_98[60] <= 1'b0;
        m_fu_98[61] <= 1'b0;
        m_fu_98[62] <= 1'b0;
        m_fu_98[63] <= 1'b0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln962_fu_302_p2 == 1'd1))) begin
                m_fu_98[63 : 1] <= m_1_fu_361_p2[63 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        t_fu_102 <= {{n_fu_204_p2[63:1]}};
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln962_fu_302_p2 == 1'd1))) begin
        t_fu_102 <= zext_ln960_reg_429;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        u_fu_106 <= 32'd1;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln962_fu_302_p2 == 1'd1))) begin
        u_fu_106 <= u_3_fu_356_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln962_fu_302_p2 == 1'd0))) begin
        add_ln962_reg_477 <= add_ln962_fu_351_p2;
        j1_reg_472 <= j1_fu_346_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        f_read_reg_407 <= f;
        logn_read_reg_402 <= logn;
        trunc_ln1_reg_412 <= {{n_fu_204_p2[61:1]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i1_1_reg_457 <= i1_1_fu_307_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        s_im_reg_487 <= fpr_gm_tab_q0;
        s_re_reg_482 <= fpr_gm_tab_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd1))) begin
        trunc_ln2_reg_439 <= {{m_fu_98[63:1]}};
        trunc_ln4_reg_449 <= {{t_fu_102[61:1]}};
        trunc_ln968_reg_444[9 : 1] <= trunc_ln968_fu_288_p1[9 : 1];
        zext_ln956_reg_423[62 : 0] <= zext_ln956_fu_256_p1[62 : 0];
        zext_ln960_reg_429[61 : 0] <= zext_ln960_fu_270_p1[61 : 0];
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

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd0))) begin
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
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fpr_gm_tab_ce0 = 1'b1;
    end else begin
        fpr_gm_tab_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fpr_gm_tab_ce1 = 1'b1;
    end else begin
        fpr_gm_tab_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        gmem0_ARVALID = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_ARVALID;
    end else begin
        gmem0_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        gmem0_AWVALID = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_AWVALID;
    end else begin
        gmem0_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        gmem0_BREADY = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_BREADY;
    end else begin
        gmem0_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        gmem0_RREADY = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_RREADY;
    end else begin
        gmem0_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        gmem0_WVALID = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_m_axi_gmem0_WVALID;
    end else begin
        gmem0_WVALID = 1'b0;
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
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln956_fu_248_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln962_fu_302_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln962_fu_351_p2 = (zext_ln956_reg_423 + indvars_iv_reg_147);

assign add_ln968_fu_317_p2 = (trunc_ln968_1_fu_313_p1 + trunc_ln968_reg_444);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign fpr_gm_tab_address0 = zext_ln969_fu_341_p1;

assign fpr_gm_tab_address1 = zext_ln968_fu_330_p1;

assign grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start = grp_FFT_Pipeline_VITIS_LOOP_972_3_fu_180_ap_start_reg;

assign ht_fu_260_p4 = {{t_fu_102[62:1]}};

assign i1_1_fu_307_p2 = (i1_reg_169 + 63'd1);

assign icmp_ln956_fu_248_p2 = ((u_fu_106 < logn_read_reg_402) ? 1'b1 : 1'b0);

assign icmp_ln962_fu_302_p2 = ((i1_reg_169 == trunc_ln2_reg_439) ? 1'b1 : 1'b0);

assign j1_fu_346_p2 = (zext_ln956_reg_423 + j1_2_reg_157);

assign m_1_fu_361_p2 = m_fu_98 << 64'd1;

assign n_fu_204_p2 = 64'd1 << zext_ln952_fu_200_p1;

assign or_ln969_fu_335_p2 = (shl_ln_fu_322_p3 | 11'd1);

assign shl_ln_fu_322_p3 = {{add_ln968_fu_317_p2}, {1'd0}};

assign trunc_ln968_1_fu_313_p1 = i1_reg_169[9:0];

assign trunc_ln968_fu_288_p1 = m_fu_98[9:0];

assign u_3_fu_356_p2 = (u_fu_106 + 32'd1);

assign zext_ln952_fu_200_p1 = logn;

assign zext_ln956_fu_256_p1 = t_fu_102;

assign zext_ln958_fu_274_p1 = ht_fu_260_p4;

assign zext_ln960_fu_270_p1 = ht_fu_260_p4;

assign zext_ln968_fu_330_p1 = shl_ln_fu_322_p3;

assign zext_ln969_fu_341_p1 = or_ln969_fu_335_p2;

always @ (posedge ap_clk) begin
    zext_ln956_reg_423[63] <= 1'b0;
    zext_ln960_reg_429[62] <= 1'b0;
    trunc_ln968_reg_444[0] <= 1'b0;
    m_fu_98[0] <= 1'b0;
end

endmodule //FFT
