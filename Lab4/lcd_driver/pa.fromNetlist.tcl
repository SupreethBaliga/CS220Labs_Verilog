
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name lcd_driver -dir "/media/nikhilag/735F-494D/CS220/Lab4/lcd_driver/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/media/nikhilag/735F-494D/CS220/Lab4/lcd_driver/lcd_driver_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/media/nikhilag/735F-494D/CS220/Lab4/lcd_driver} }
set_property target_constrs_file "lcd_driver_top.ucf" [current_fileset -constrset]
add_files [list {lcd_driver_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
