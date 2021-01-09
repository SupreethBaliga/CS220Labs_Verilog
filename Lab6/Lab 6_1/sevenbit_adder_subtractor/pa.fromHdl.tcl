
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name sevenbit_adder_subtractor -dir "/media/nikhilag/735F-494D/CS220/Lab6/Lab 6_1/sevenbit_adder_subtractor/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "seven_bit_adder_subtractor_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {one_bit_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {seven_bit_adder_subtractor.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rotor.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {seven_bit_adder_subtractor_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top seven_bit_adder_subtractor_top $srcset
add_files [list {seven_bit_adder_subtractor_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
