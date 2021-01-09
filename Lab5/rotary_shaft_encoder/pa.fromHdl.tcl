
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name rotary_shaft_encoder -dir "/media/nikhilag/735F-494D/CS220/Lab5/rotary_shaft_encoder/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "rotary_shaft_encoder_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {rotor.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {led_ripple.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rotary_shaft_encoder_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top rotary_shaft_encoder_top $srcset
add_files [list {rotary_shaft_encoder_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
