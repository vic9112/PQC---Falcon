-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity userdma_sendoutstream is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    outbuf_dout : IN STD_LOGIC_VECTOR (34 downto 0);
    outbuf_num_data_valid : IN STD_LOGIC_VECTOR (6 downto 0);
    outbuf_fifo_cap : IN STD_LOGIC_VECTOR (6 downto 0);
    outbuf_empty_n : IN STD_LOGIC;
    outbuf_read : OUT STD_LOGIC;
    outStreamTop_TREADY : IN STD_LOGIC;
    m2s_buf_sts : OUT STD_LOGIC_VECTOR (0 downto 0);
    m2s_buf_sts_ap_vld : OUT STD_LOGIC;
    outStreamTop_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    outStreamTop_TVALID : OUT STD_LOGIC;
    outStreamTop_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    outStreamTop_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    outStreamTop_TUSER : OUT STD_LOGIC_VECTOR (1 downto 0);
    outStreamTop_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of userdma_sendoutstream is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_21 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100001";
    constant ap_const_lv32_22 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100010";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal regslice_both_outStreamTop_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal tmp_last_V_fu_107_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal outbuf_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal outStreamTop_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_last_V_reg_126 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal m2s_buf_sts_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_loop_init : STD_LOGIC;
    signal outStreamTop_TDATA_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal outStreamTop_TVALID_int_regslice : STD_LOGIC;
    signal outStreamTop_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_outStreamTop_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_outStreamTop_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_outStreamTop_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_outStreamTop_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_outStreamTop_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_outStreamTop_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_outStreamTop_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_outStreamTop_V_user_V_U_apdone_blk : STD_LOGIC;
    signal outStreamTop_TUSER_int_regslice : STD_LOGIC_VECTOR (1 downto 0);
    signal regslice_both_outStreamTop_V_user_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_outStreamTop_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_outStreamTop_V_last_V_U_apdone_blk : STD_LOGIC;
    signal outStreamTop_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_outStreamTop_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_outStreamTop_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component userdma_flow_control_loop_pipe IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;


    component userdma_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_U : component userdma_flow_control_loop_pipe
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int,
        ap_continue => ap_continue);

    regslice_both_outStreamTop_V_data_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => outStreamTop_TDATA_int_regslice,
        vld_in => outStreamTop_TVALID_int_regslice,
        ack_in => outStreamTop_TREADY_int_regslice,
        data_out => outStreamTop_TDATA,
        vld_out => regslice_both_outStreamTop_V_data_V_U_vld_out,
        ack_out => outStreamTop_TREADY,
        apdone_blk => regslice_both_outStreamTop_V_data_V_U_apdone_blk);

    regslice_both_outStreamTop_V_keep_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv4_0,
        vld_in => outStreamTop_TVALID_int_regslice,
        ack_in => regslice_both_outStreamTop_V_keep_V_U_ack_in_dummy,
        data_out => outStreamTop_TKEEP,
        vld_out => regslice_both_outStreamTop_V_keep_V_U_vld_out,
        ack_out => outStreamTop_TREADY,
        apdone_blk => regslice_both_outStreamTop_V_keep_V_U_apdone_blk);

    regslice_both_outStreamTop_V_strb_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv4_0,
        vld_in => outStreamTop_TVALID_int_regslice,
        ack_in => regslice_both_outStreamTop_V_strb_V_U_ack_in_dummy,
        data_out => outStreamTop_TSTRB,
        vld_out => regslice_both_outStreamTop_V_strb_V_U_vld_out,
        ack_out => outStreamTop_TREADY,
        apdone_blk => regslice_both_outStreamTop_V_strb_V_U_apdone_blk);

    regslice_both_outStreamTop_V_user_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 2)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => outStreamTop_TUSER_int_regslice,
        vld_in => outStreamTop_TVALID_int_regslice,
        ack_in => regslice_both_outStreamTop_V_user_V_U_ack_in_dummy,
        data_out => outStreamTop_TUSER,
        vld_out => regslice_both_outStreamTop_V_user_V_U_vld_out,
        ack_out => outStreamTop_TREADY,
        apdone_blk => regslice_both_outStreamTop_V_user_V_U_apdone_blk);

    regslice_both_outStreamTop_V_last_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => outStreamTop_TLAST_int_regslice,
        vld_in => outStreamTop_TVALID_int_regslice,
        ack_in => regslice_both_outStreamTop_V_last_V_U_ack_in_dummy,
        data_out => outStreamTop_TLAST,
        vld_out => regslice_both_outStreamTop_V_last_V_U_vld_out,
        ack_out => outStreamTop_TREADY,
        apdone_blk => regslice_both_outStreamTop_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    m2s_buf_sts_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                m2s_buf_sts_preg <= ap_const_lv1_0;
            else
                if (((tmp_last_V_reg_126 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    m2s_buf_sts_preg <= ap_const_lv1_1;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter1_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready = ap_const_logic_0))) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_last_V_reg_126 <= outbuf_dout(34 downto 34);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, outbuf_empty_n, ap_done_reg, regslice_both_outStreamTop_V_data_V_U_apdone_blk, ap_loop_exit_ready_pp0_iter1_reg, ap_start_int, outStreamTop_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))) or ((ap_start_int = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (outbuf_empty_n = ap_const_logic_0) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, outbuf_empty_n, ap_done_reg, regslice_both_outStreamTop_V_data_V_U_apdone_blk, ap_loop_exit_ready_pp0_iter1_reg, ap_start_int, outStreamTop_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))) or ((ap_start_int = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (outbuf_empty_n = ap_const_logic_0) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, outbuf_empty_n, ap_done_reg, regslice_both_outStreamTop_V_data_V_U_apdone_blk, ap_loop_exit_ready_pp0_iter1_reg, ap_start_int, outStreamTop_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))) or ((ap_start_int = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (outbuf_empty_n = ap_const_logic_0) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(outbuf_empty_n, ap_done_reg, outStreamTop_TREADY_int_regslice)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or (outbuf_empty_n = ap_const_logic_0) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(regslice_both_outStreamTop_V_data_V_U_apdone_blk, outStreamTop_TREADY_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((regslice_both_outStreamTop_V_data_V_U_apdone_blk = ap_const_logic_1) or (outStreamTop_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, tmp_last_V_fu_107_p3, ap_start_int)
    begin
        if (((tmp_last_V_fu_107_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    m2s_buf_sts_assign_proc : process(ap_CS_fsm_pp0_stage0, tmp_last_V_reg_126, ap_block_pp0_stage0_01001, m2s_buf_sts_preg)
    begin
        if (((tmp_last_V_reg_126 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m2s_buf_sts <= ap_const_lv1_1;
        else 
            m2s_buf_sts <= m2s_buf_sts_preg;
        end if; 
    end process;


    m2s_buf_sts_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, tmp_last_V_reg_126)
    begin
        if (((tmp_last_V_reg_126 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m2s_buf_sts_ap_vld <= ap_const_logic_1;
        else 
            m2s_buf_sts_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    outStreamTop_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_done_reg, ap_block_pp0_stage0, ap_start_int, outStreamTop_TREADY_int_regslice)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            outStreamTop_TDATA_blk_n <= outStreamTop_TREADY_int_regslice;
        else 
            outStreamTop_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    outStreamTop_TDATA_int_regslice <= outbuf_dout(32 - 1 downto 0);
    outStreamTop_TLAST_int_regslice <= outbuf_dout(34 downto 34);
    outStreamTop_TUSER_int_regslice <= outbuf_dout(33 downto 32);
    outStreamTop_TVALID <= regslice_both_outStreamTop_V_data_V_U_vld_out;

    outStreamTop_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            outStreamTop_TVALID_int_regslice <= ap_const_logic_1;
        else 
            outStreamTop_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    outbuf_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, outbuf_empty_n, ap_done_reg, ap_block_pp0_stage0, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            outbuf_blk_n <= outbuf_empty_n;
        else 
            outbuf_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    outbuf_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_start_int)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            outbuf_read <= ap_const_logic_1;
        else 
            outbuf_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_last_V_fu_107_p3 <= outbuf_dout(34 downto 34);
end behav;
