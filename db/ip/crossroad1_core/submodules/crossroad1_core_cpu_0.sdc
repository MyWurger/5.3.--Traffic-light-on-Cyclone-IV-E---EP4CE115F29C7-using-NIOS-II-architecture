# Legal Notice: (C)2023 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	crossroad1_core_cpu_0 	crossroad1_core_cpu_0:*
set 	crossroad1_core_cpu_0_oci 	crossroad1_core_cpu_0_nios2_oci:the_crossroad1_core_cpu_0_nios2_oci
set 	crossroad1_core_cpu_0_oci_break 	crossroad1_core_cpu_0_nios2_oci_break:the_crossroad1_core_cpu_0_nios2_oci_break
set 	crossroad1_core_cpu_0_ocimem 	crossroad1_core_cpu_0_nios2_ocimem:the_crossroad1_core_cpu_0_nios2_ocimem
set 	crossroad1_core_cpu_0_oci_debug 	crossroad1_core_cpu_0_nios2_oci_debug:the_crossroad1_core_cpu_0_nios2_oci_debug
set 	crossroad1_core_cpu_0_wrapper 	crossroad1_core_cpu_0_jtag_debug_module_wrapper:the_crossroad1_core_cpu_0_jtag_debug_module_wrapper
set 	crossroad1_core_cpu_0_jtag_tck 	crossroad1_core_cpu_0_jtag_debug_module_tck:the_crossroad1_core_cpu_0_jtag_debug_module_tck
set 	crossroad1_core_cpu_0_jtag_sysclk 	crossroad1_core_cpu_0_jtag_debug_module_sysclk:the_crossroad1_core_cpu_0_jtag_debug_module_sysclk
set 	crossroad1_core_cpu_0_oci_path 	 [format "%s|%s" $crossroad1_core_cpu_0 $crossroad1_core_cpu_0_oci]
set 	crossroad1_core_cpu_0_oci_break_path 	 [format "%s|%s" $crossroad1_core_cpu_0_oci_path $crossroad1_core_cpu_0_oci_break]
set 	crossroad1_core_cpu_0_ocimem_path 	 [format "%s|%s" $crossroad1_core_cpu_0_oci_path $crossroad1_core_cpu_0_ocimem]
set 	crossroad1_core_cpu_0_oci_debug_path 	 [format "%s|%s" $crossroad1_core_cpu_0_oci_path $crossroad1_core_cpu_0_oci_debug]
set 	crossroad1_core_cpu_0_jtag_tck_path 	 [format "%s|%s|%s" $crossroad1_core_cpu_0_oci_path $crossroad1_core_cpu_0_wrapper $crossroad1_core_cpu_0_jtag_tck]
set 	crossroad1_core_cpu_0_jtag_sysclk_path 	 [format "%s|%s|%s" $crossroad1_core_cpu_0_oci_path $crossroad1_core_cpu_0_wrapper $crossroad1_core_cpu_0_jtag_sysclk]
set 	crossroad1_core_cpu_0_jtag_sr 	 [format "%s|*sr" $crossroad1_core_cpu_0_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$crossroad1_core_cpu_0_oci_break_path|break_readreg*] -to [get_keepers *$crossroad1_core_cpu_0_jtag_sr*]
set_false_path -from [get_keepers *$crossroad1_core_cpu_0_oci_debug_path|*resetlatch]     -to [get_keepers *$crossroad1_core_cpu_0_jtag_sr[33]]
set_false_path -from [get_keepers *$crossroad1_core_cpu_0_oci_debug_path|monitor_ready]  -to [get_keepers *$crossroad1_core_cpu_0_jtag_sr[0]]
set_false_path -from [get_keepers *$crossroad1_core_cpu_0_oci_debug_path|monitor_error]  -to [get_keepers *$crossroad1_core_cpu_0_jtag_sr[34]]
set_false_path -from [get_keepers *$crossroad1_core_cpu_0_ocimem_path|*MonDReg*] -to [get_keepers *$crossroad1_core_cpu_0_jtag_sr*]
set_false_path -from *$crossroad1_core_cpu_0_jtag_sr*    -to *$crossroad1_core_cpu_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$crossroad1_core_cpu_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$crossroad1_core_cpu_0_oci_debug_path|monitor_go
