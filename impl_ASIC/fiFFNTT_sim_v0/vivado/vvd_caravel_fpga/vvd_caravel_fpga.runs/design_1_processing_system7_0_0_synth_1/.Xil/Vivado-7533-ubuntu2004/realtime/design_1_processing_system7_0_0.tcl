# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "./.Xil/Vivado-7533-ubuntu2004/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    rt::set_parameter datapathDensePacking false
    set rt::partid xc7z020clg400-1
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_verilog -sv {
      /tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv
      /tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv
      /tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv
    }
      rt::read_verilog {
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8fd3/hdl/verilog/processing_system7_v5_5_aw_atc.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8fd3/hdl/verilog/processing_system7_v5_5_b_atc.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8fd3/hdl/verilog/processing_system7_v5_5_w_atc.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8fd3/hdl/verilog/processing_system7_v5_5_atc.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ipshared/8fd3/hdl/verilog/processing_system7_v5_5_trace_buffer.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/hdl/verilog/processing_system7_v5_5_processing_system7.v
      /home/ubuntu/testfpga/impl_ASIC/fiFFNTT_sim/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/synth/design_1_processing_system7_0_0.v
    }
      rt::read_vhdl -lib xpm /tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList ./.Xil/Vivado-7533-ubuntu2004/realtime/design_1_processing_system7_0_0_synth.xdc
    rt::sdcChecksum
    set rt::top design_1_processing_system7_0_0
    rt::set_parameter enableIncremental true
    rt::set_parameter markDebugPreservationLevel "enable"
    set rt::ioInsertion false
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter dataflowBusHighlighting false
    rt::set_parameter generateDataflowBusNetlist false
    rt::set_parameter dataFlowViewInElab false
    rt::set_parameter busViewFixBrokenConnections false
    set_param edifin.funnel true
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: out_of_context
    rt::set_parameter webTalkPath {}
    rt::set_parameter synthDebugLog false
    rt::set_parameter printModuleName false
    rt::set_parameter enableSplitFlowPath "./.Xil/Vivado-7533-ubuntu2004/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
