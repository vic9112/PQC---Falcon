############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_userdma.prj
set_top userdma
add_files userdma.h
add_files userdma.cpp
add_files -tb test_data.h -cflags "-Wno-unknown-pragmas" -csimflags "-DCSIM_MODE"
add_files -tb userdma_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-DCSIM_MODE"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./hls_userdma.prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
