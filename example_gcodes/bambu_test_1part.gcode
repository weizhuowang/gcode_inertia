; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 2m 32s; total estimated time: 9m 53s
; total layer number: 15
; total filament length [mm] : 443.81
; total filament volume [cm^3] : 1067.49
; total filament weight [g] : 1.35
; filament_density: 1.26,1.2,1.32,1.24
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 3.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,30
; cool_plate_temp_initial_layer = 35,35,35,30
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = High Temp Plate
; default_acceleration = 10000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; different_settings_to_system = ;;nozzle_temperature_range_high;nozzle_temperature_range_low;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,30
; eng_plate_temp_initial_layer = 0,0,0,30
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 100,100,100,100
; fan_max_speed = 100,100,100,100
; fan_min_speed = 100,100,100,100
; filament_adhesiveness_category = 100,100,100,600
; filament_change_length = 5,10,10,10
; filament_colour = #FF6A13;#FFFFFF;#BB3D43;#000000
; filament_cost = 24.99,24.15,24.99,20
; filament_density = 1.26,1.2,1.32,1.24
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,1
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFA00;GFL04;GFA01;GFU99
; filament_is_support = 0,0,0,0
; filament_long_retractions_when_cut = 1,nil,1,nil
; filament_map = 1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21,15,22,3.2
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0
; filament_prime_volume = 30,45,45,45
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_retraction_distances_when_cut = 18,nil,18,nil
; filament_retraction_length = nil,nil,nil,0.4
; filament_scarf_gap = 0%,15%,0%,0%
; filament_scarf_height = 10%,10%,5%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Bambu PLA Basic @BBL X1C";"Overture PLA @BBL X1C(main_frame_ass - lower_int_90.3mf)";"Bambu PLA Matte @BBL X1C";"Generic TPU"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >30)||(bed_temperature_initial_layer[current_extruder] >30)}M106 P3 S180\n{endif} \n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;TPU
; filament_vendor = "Bambu Lab";Overture;"Bambu Lab";Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,526,189,168,339,0,251,187,304,526,0,139,617,667,467,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55,55,35
; hot_plate_temp_initial_layer = 55,55,55,35
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8,10,6.6,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;"Overture PLA @BBL X1C";;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20240528 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos\nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N100\nM1006 A49 B20 L100 C44 D20 M100 E41 F20 N100\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM960 S5 P0 ; turn off logo lamp\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: X1 ====================\n;===== date: 20240919 ==================\n;===== start printer sound ================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A46 B10 L100 C43 D10 M70 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A43 B10 L100 C0 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A41 B10 L100 C0 D10 M100 E41 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E44 F10 N100\nM1006 A49 B10 L100 C0 D10 M100 E49 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A48 B10 L100 C44 D10 M60 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M90 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N100\nM1006 A46 B10 L100 C43 D10 M60 E39 F10 N100\nM1006 W\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n{if scan_first_layer}\n;=========register first layer scan=====\nM977 S1 P60\n{endif}\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_no_support_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_no_support_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X128 Y128\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n;===== check scanner clarity ===========================\nG1 X128 Y128 F24000\nG28 Z P0\nM972 S5 P0\nG1 X230 Y15 F24000\n;===== check scanner clarity end =======================\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== mech mode fast check============================\n\n{if scan_first_layer}\n;start heatbed  scan====================================\nM976 S2 P1\nG90\nG1 X128 Y128 F20000\nM976 S3 P2  ;register void printing detection\n{endif}\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature[initial_no_support_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X231 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n\n;===== draw extrinsic para cali paint =================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M1002 gcode_claim_action : 8\n\n    T1000\n\n    G0 F1200.0 X231 Y15   Z0.2 E0.741\n    G0 F1200.0 X226 Y15   Z0.2 E0.275\n    G0 F1200.0 X226 Y8    Z0.2 E0.384\n    G0 F1200.0 X216 Y8    Z0.2 E0.549\n    G0 F1200.0 X216 Y1.5  Z0.2 E0.357\n\n    G0 X48.0 E12.0 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X48.0 Y14 E0.92 F1200.0\n    G0 X35.0 Y6.0 E1.03 F1200.0\n\n    ;=========== extruder cali extrusion ==================\n    T1000\n    M83\n    {if default_acceleration > 0}\n        {if outer_wall_acceleration > 0}\n            M204 S[outer_wall_acceleration]\n        {else}\n            M204 S[default_acceleration]\n        {endif}\n    {endif}\n    G0 X35.000 Y6.000 Z0.300 F30000 E0\n    G1 F1500.000 E0.800\n    M106 S0 ; turn off fan\n    G0 X185.000 E9.35441 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G0 X187 Z0\n    G1 F1500.000 E-0.800\n    G0 Z1\n    G0 X180 Z0.3 F18000\n\n    M900 L1000.0 M1.0\n    M900 K0.040\n    G0 X45.000 F30000\n    G0 Y8.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.020\n    G0 X45.000 F30000\n    G0 Y10.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.000\n    G0 X45.000 F30000\n    G0 Y12.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n\n    G0 X45.000 F30000 ; move to start point\n\nM623 ; end of "draw extrinsic para cali paint"\n\n\nM1002 judge_flag extrude_cali_flag\nM622 J0\n    G0 X231 Y1.5 F30000\n    G0 X18 E14.3 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM623\n\nM104 S140\n\n\n;=========== laser and rgb calibration ===========\nM400\nM18 E\nM500 R\n\nM973 S3 P14\n\nG1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nT1100\nG1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nM400 P100\nM960 S1 P1\nM400 P100\nM973 S6 P0; use auto exposure for horizontal laser by xcam\nM960 S0 P0\n\nG1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos\nM960 S2 P1\nM400 P100\nM973 S6 P1; use auto exposure for vertical laser by xcam\nM960 S0 P0\n\n;=========== handeye calibration ======================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M973 S3 P1 ; camera start stream\n    M400 P500\n    M973 S1\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G1 Z3 F3000\n\n    M400\n    M500 ; save cali data\n\n    M104 S{nozzle_temperature[initial_no_support_extruder]} ; rise nozzle temp now ,to reduce temp waiting time.\n\n    T1100\n    M400 P400\n    M960 S0 P0\n    G0 F30000.000 Y10.000 X65.000 Z0.000\n    M400 P400\n    M960 S1 P1\n    M400 P50\n\n    M969 S1 N3 A2000\n    G0 F360.000 X181.000 Z0.000\n    M980.3 A70.000 B{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60/4} C5.000 D{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60} E5.000 F175.000 H1.000 I0.000 J0.020 K0.040\n    M400 P100\n    G0 F20000\n    G0 Z1 ; rise nozzle up\n    T1000 ; change to nozzle space\n    G0 X45.000 Y4.000 F30000 ; move to test line pos\n    M969 S0 ; turn off scanning\n    M960 S0 P0\n\n\n    G1 Z2 F20000\n    T1000\n    G0 X45.000 Y4.000 F30000 E0\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n    G0 Z0.3\n    G1 F1500.000 E3.600\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n\n    ; see if extrude cali success, if not ,use default value\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M400\n        M900 K0.02 M{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*0.02}\n    M623\n\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X185.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X190.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X195.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X200.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X205.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X210.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X215.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X220.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X225.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    M973 S4\n\nM623\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM973 S4 ; turn off scanner\nM400 ; wait all motion done before implement the emprical L parameters\n;M900 L500.0 ; Empirical parameters\nM109 S[nozzle_temperature_initial_layer]\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n;===== purge line to wipe the nozzle ============================\nG1 E{-retraction_length[initial_no_support_extruder]} F1800\nG1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position\nG1 E{retraction_length[initial_no_support_extruder]} F1800\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG1 Z0.2\nG0 X239 E15 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\nG0 Y12 E0.7 F{outer_wall_volumetric_speed/(0.3*0.5)/4* 60}\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.2
; nozzle_temperature = 220,220,220,240
; nozzle_temperature_initial_layer = 220,220,220,240
; nozzle_temperature_range_high = 240,250,240,250
; nozzle_temperature_range_low = 190,220,190,200
; nozzle_type = hardened_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,95%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab X1 Carbon
; printer_notes = 
; printer_settings_id = Bambu Lab X1 Carbon 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 1
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 4,6,4,8
; slow_down_min_speed = 20,20,20,10
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,0
; supertack_plate_temp_initial_layer = 45,45,45,0
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,30
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,35
; textured_plate_temp_initial_layer = 55,55,55,35
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165,165
; wipe_tower_y = 216.972,216.972
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R9
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: X1 ====================
;===== date: 20240919 ==================
;===== start printer sound ================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A46 B10 L100 C43 D10 M70 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A43 B10 L100 C0 D10 M60 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A41 B10 L100 C0 D10 M100 E41 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E44 F10 N100
M1006 A49 B10 L100 C0 D10 M100 E49 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A48 B10 L100 C44 D10 M60 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M90 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N100
M1006 A46 B10 L100 C43 D10 M60 E39 F10 N100
M1006 W
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp


;=========register first layer scan=====
M977 S1 P60


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
M73 P1 R9
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240

M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P5 R9
G1 E50 F200
M400
M104 S220
G92 E0
M73 P49 R4
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P50 R4
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P52 R4
G1 E-0.5 F300

M73 P55 R4
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
M73 P56 R4
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P57 R4
G1 F30000
G1 X128 Y128
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================

;===== check scanner clarity ===========================
G1 X128 Y128 F24000
G28 Z P0
M972 S5 P0
G1 X230 Y15 F24000
;===== check scanner clarity end =======================

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X101.276 Y122.001 I53.4472 J11.9978
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression

;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== mech mode fast check============================


;start heatbed  scan====================================
M976 S2 P1
G90
G1 X128 Y128 F20000
M976 S3 P2  ;register void printing detection


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
M73 P58 R4
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X231 E0.700 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=High Temp Plate


;===== draw extrinsic para cali paint =================
M1002 judge_flag extrude_cali_flag
M622 J1

    M1002 gcode_claim_action : 8

    T1000

    G0 F1200.0 X231 Y15   Z0.2 E0.741
    G0 F1200.0 X226 Y15   Z0.2 E0.275
    G0 F1200.0 X226 Y8    Z0.2 E0.384
    G0 F1200.0 X216 Y8    Z0.2 E0.549
    G0 F1200.0 X216 Y1.5  Z0.2 E0.357

    G0 X48.0 E12.0 F6033.27
    G0 X48.0 Y14 E0.92 F1200.0
    G0 X35.0 Y6.0 E1.03 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E9.35441 F6033.27
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.040
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
M73 P59 R4
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
M73 P59 R3
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
M73 P60 R3
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
M73 P61 R3
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.020
    G0 X45.000 F30000
    G0 Y10.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
M73 P62 R3
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
M73 P63 R3
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
M73 P64 R3
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.000
    G0 X45.000 F30000
    G0 Y12.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
M73 P65 R3
    G1 Z0.3

    G0 X45.000 F30000 ; move to start point

M623 ; end of "draw extrinsic para cali paint"


M1002 judge_flag extrude_cali_flag
M622 J0
    G0 X231 Y1.5 F30000
    G0 X18 E14.3 F6033.27
M623

M104 S140


;=========== laser and rgb calibration ===========
M400
M18 E
M500 R

M973 S3 P14

G1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
T1100
G1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
M400 P100
M960 S1 P1
M400 P100
M973 S6 P0; use auto exposure for horizontal laser by xcam
M960 S0 P0

G1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos
M960 S2 P1
M400 P100
M973 S6 P1; use auto exposure for vertical laser by xcam
M960 S0 P0

;=========== handeye calibration ======================
M1002 judge_flag extrude_cali_flag
M622 J1

    M973 S3 P1 ; camera start stream
    M400 P500
    M973 S1
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G1 Z3 F3000

    M400
    M500 ; save cali data

    M104 S220 ; rise nozzle temp now ,to reduce temp waiting time.

    T1100
    M400 P400
    M960 S0 P0
    G0 F30000.000 Y10.000 X65.000 Z0.000
    M400 P400
    M960 S1 P1
    M400 P50

    M969 S1 N3 A2000
    G0 F360.000 X181.000 Z0.000
    M980.3 A70.000 B94.1106 C5.000 D376.442 E5.000 F175.000 H1.000 I0.000 J0.020 K0.040
    M400 P100
    G0 F20000
    G0 Z1 ; rise nozzle up
    T1000 ; change to nozzle space
    G0 X45.000 Y4.000 F30000 ; move to test line pos
    M969 S0 ; turn off scanning
    M960 S0 P0


    G1 Z2 F20000
    T1000
    G0 X45.000 Y4.000 F30000 E0
    M109 S220
    G0 Z0.3
    G1 F1500.000 E3.600
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.02 M0.125481
    M623

    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F1508.32
    G1 X185.000 E0.31181 F6033.27
    G1 X190.000 E0.31181 F1508.32
    G1 X195.000 E0.31181 F6033.27
    G1 X200.000 E0.31181 F1508.32
    G1 X205.000 E0.31181 F6033.27
    G1 X210.000 E0.31181 F1508.32
    G1 X215.000 E0.31181 F6033.27
    G1 X220.000 E0.31181 F1508.32
    G1 X225.000 E0.31181 F6033.27
    M973 S4

M623

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M973 S4 ; turn off scanner
M400 ; wait all motion done before implement the emprical L parameters
;M900 L500.0 ; Empirical parameters
M109 S220
M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000
;===== purge line to wipe the nozzle ============================
G1 E-0.8 F1800
G1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position
G1 E0.8 F1800
M109 S220
G1 Z0.2
G0 X239 E15 F6033.27
G0 Y12 E0.7 F1508.32
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150

M142 P1 R35 S40
;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/15
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.08 Y121.237
M73 P66 R3
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X148.098 Y121.234 E.00066
G3 X148.515 Y121.197 I.628 J4.764 E.01563
G3 X148.932 Y121.197 I.21 J5.622 E.01551
G3 X147.685 Y121.307 I-.206 J4.801 E1.07773
G1 X148.021 Y121.247 E.01273
M204 S6000
G1 X148.092 Y121.699 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X148.157 Y121.687 E.00246
G3 X148.535 Y121.654 I.568 J4.311 E.01414
G3 X148.913 Y121.654 I.19 J5.11 E.01408
G3 X147.784 Y121.753 I-.188 J4.344 E.97518
G1 X148.033 Y121.709 E.00944
; WIPE_START
G1 X148.157 Y121.687 E-.04785
G1 X148.535 Y121.654 E-.14422
G1 X148.913 Y121.654 E-.14365
G1 X149.293 Y121.687 E-.14473
G1 X149.666 Y121.753 E-.14419
G1 X150.011 Y121.845 E-.13536
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.544 Y123.426 Z.6 F30000
G1 X107.904 Y130.76 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X107.694 Y130.784 E.00789
G3 X107.065 Y121.197 I-.418 J-4.787 E.57001
G3 X107.482 Y121.197 I.21 J5.623 E.01551
G3 X108.142 Y130.724 I-.206 J4.801 E.52211
G1 X107.963 Y130.751 E.00673
M204 S6000
M73 P67 R3
G1 X107.502 Y130.335 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X107.275 Y130.346 E.00846
G3 X107.085 Y121.654 I0 J-4.348 E.50169
G3 X107.463 Y121.654 I.19 J5.11 E.01408
G3 X107.844 Y130.309 I-.188 J4.344 E.48054
G1 X107.562 Y130.331 E.01053
; WIPE_START
G1 X107.275 Y130.346 E-.10911
M73 P68 R3
G1 X106.709 Y130.313 E-.21562
G1 X106.334 Y130.247 E-.1447
G1 X105.967 Y130.149 E-.1442
G1 X105.61 Y130.019 E-.14428
G1 X105.605 Y130.017 E-.0021
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.116 Y128.657 Z.6 F30000
G1 X139.627 Y123.857 Z.6
G1 Z.2
M73 P69 R3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X139.682 Y123.857 E.00205
M73 P72 R2
G1 X147.091 Y121.124 E.29415
G3 X148.843 Y120.859 I1.684 J5.211 E.06628
G3 X146.864 Y130.794 I-.122 J5.141 E.6679
G1 X139.682 Y128.143 E.28514
G1 X116.318 Y128.143 E.87022
G1 X109.138 Y130.794 E.28509
G3 X109.136 Y121.206 I-1.861 J-4.794 E.74359
G1 X116.318 Y123.857 E.28514
G1 X139.567 Y123.857 E.86593
M204 S6000
G1 X139.624 Y123.391 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P73 R2
G1 X146.944 Y120.691 E.29061
G3 X148.854 Y120.402 I1.836 J5.675 E.07226
G3 X146.707 Y131.224 I-.133 J5.598 E.72691
G1 X139.6 Y128.6 E.28217
G1 X116.4 Y128.6 E.86414
G1 X109.294 Y131.224 E.28214
G3 X109.293 Y120.776 I-2.017 J-5.224 E.80895
G1 X116.4 Y123.4 E.28217
G1 X139.565 Y123.4 E.86283
; WIPE_START
G1 X141.443 Y122.711 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X143.681 Y122.577 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50088
G1 F6300
M204 S500
G1 X144.335 Y123.23 E.03448
G2 X144.1 Y123.643 I2.243 J1.549 E.01775
G1 X143.368 Y122.911 E.0386
G1 X142.895 Y123.086 E.01882
G1 X143.898 Y124.089 E.05292
G2 X143.732 Y124.571 I2.676 J1.187 E.01905
G1 X142.422 Y123.26 E.06916
G1 X141.949 Y123.435 E.01882
G1 X143.608 Y125.095 E.08759
G1 X143.544 Y125.678 E.02189
G1 X141.476 Y123.609 E.10915
G1 X141.003 Y123.784 E.01882
G1 X143.542 Y126.324 E.13404
G2 X143.653 Y127.082 I3.509 J-.125 E.02866
G1 X140.529 Y123.958 E.16485
G1 X140.056 Y124.133 E.01882
G1 X143.942 Y128.019 E.20509
G1 X144.019 Y128.203 E.00741
G1 X144.34 Y128.789 E.02494
M73 P74 R2
G1 X144.523 Y129.049 E.01189
G1 X144.446 Y129.17 E.00534
G1 X139.521 Y124.246 E.25989
G1 X138.874 Y124.246 E.02417
G1 X143.922 Y129.294 E.26645
G1 X142.896 Y128.915 E.04084
G1 X138.226 Y124.246 E.24645
G1 X137.578 Y124.246 E.02417
G1 X141.869 Y128.536 E.22644
G1 X140.842 Y128.157 E.04084
G1 X136.931 Y124.246 E.20644
G1 X136.283 Y124.246 E.02417
G1 X139.815 Y127.778 E.18643
G1 X139.751 Y127.754 E.00255
G1 X139.144 Y127.754 E.02266
G1 X135.635 Y124.246 E.18518
G1 X134.988 Y124.246 E.02417
G1 X138.497 Y127.754 E.18518
G1 X137.849 Y127.754 E.02417
G1 X134.34 Y124.246 E.18518
G1 X133.692 Y124.246 E.02417
G1 X137.201 Y127.754 E.18518
G1 X136.554 Y127.754 E.02417
G1 X133.045 Y124.246 E.18518
G1 X132.397 Y124.246 E.02417
G1 X135.906 Y127.754 E.18518
G1 X135.258 Y127.754 E.02417
G1 X131.749 Y124.246 E.18518
G1 X131.102 Y124.246 E.02417
G1 X134.611 Y127.754 E.18518
G1 X133.963 Y127.754 E.02417
G1 X130.454 Y124.246 E.18518
G1 X129.806 Y124.246 E.02417
G1 X133.315 Y127.754 E.18518
G1 X132.668 Y127.754 E.02417
G1 X129.159 Y124.246 E.18518
G1 X128.511 Y124.246 E.02417
G1 X132.02 Y127.754 E.18518
G1 X131.372 Y127.754 E.02417
G1 X127.863 Y124.246 E.18518
G1 X127.216 Y124.246 E.02417
G1 X130.725 Y127.754 E.18518
G1 X130.077 Y127.754 E.02417
G1 X126.568 Y124.246 E.18518
G1 X125.921 Y124.246 E.02417
G1 X129.429 Y127.754 E.18518
G1 X128.782 Y127.754 E.02417
G1 X125.273 Y124.246 E.18518
G1 X124.625 Y124.246 E.02417
G1 X128.134 Y127.754 E.18518
G1 X127.486 Y127.754 E.02417
G1 X123.978 Y124.246 E.18518
G1 X123.33 Y124.246 E.02417
G1 X126.839 Y127.754 E.18518
G1 X126.191 Y127.754 E.02417
G1 X122.682 Y124.246 E.18518
G1 X122.035 Y124.246 E.02417
G1 X125.543 Y127.754 E.18518
G1 X124.896 Y127.754 E.02417
G1 X121.387 Y124.246 E.18518
G1 X120.739 Y124.246 E.02417
M73 P75 R2
G1 X124.248 Y127.754 E.18518
G1 X123.6 Y127.754 E.02417
G1 X120.092 Y124.246 E.18518
G1 X119.444 Y124.246 E.02417
G1 X122.953 Y127.754 E.18518
G1 X122.305 Y127.754 E.02417
G1 X118.796 Y124.246 E.18518
G1 X118.149 Y124.246 E.02417
G1 X121.658 Y127.754 E.18518
G1 X121.01 Y127.754 E.02417
G1 X117.501 Y124.246 E.18518
G1 X116.853 Y124.246 E.02417
G1 X120.362 Y127.754 E.18518
G1 X119.715 Y127.754 E.02417
G1 X116.181 Y124.22 E.18651
G1 X115.154 Y123.841 E.04084
G1 X119.067 Y127.754 E.20651
G1 X118.419 Y127.754 E.02417
G1 X114.127 Y123.462 E.22652
G1 X113.1 Y123.083 E.04084
G1 X117.772 Y127.754 E.24652
G1 X117.124 Y127.754 E.02417
G1 X112.074 Y122.704 E.26653
G1 X111.719 Y122.573 E.0141
G1 X111.553 Y122.832 E.01145
G1 X116.476 Y127.754 E.25981
G1 X116.249 Y127.754 E.0085
G1 X115.942 Y127.868 E.0122
G1 X112.059 Y123.985 E.20491
G3 X112.348 Y124.921 I-4.303 J1.838 E.03661
G1 X115.469 Y128.042 E.16473
G1 X114.996 Y128.217 E.01882
G1 X112.458 Y125.679 E.13394
G1 X112.455 Y126.323 E.02405
G1 X114.523 Y128.392 E.10915
G1 X114.05 Y128.566 E.01882
G1 X112.391 Y126.907 E.08754
G3 X112.267 Y127.431 I-3.06 J-.449 E.0201
G1 X113.577 Y128.741 E.06913
G1 X113.104 Y128.915 E.01882
G1 X112.101 Y127.913 E.0529
G3 X111.9 Y128.359 I-2.653 J-.933 E.01828
G1 X112.631 Y129.09 E.03859
G1 X112.158 Y129.265 E.01882
G1 X111.513 Y128.62 E.03401
; WIPE_START
M73 P76 R2
G1 X112.158 Y129.265 E-.34632
G1 X112.631 Y129.09 E-.19161
G1 X112.218 Y128.677 E-.22208
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X110.263 Y130.135 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.399494
G1 F3000
M204 S500
G1 X111.29 Y129.477 E.03545
M204 S6000
G1 X111.296 Y129.486 F30000
; LINE_WIDTH: 0.305098
G1 F3000
M204 S500
G1 X110.763 Y129.811 E.01335
; LINE_WIDTH: 0.283634
G1 X110.667 Y129.868 E.00219
; LINE_WIDTH: 0.242253
G1 X110.568 Y129.927 E.00188
; LINE_WIDTH: 0.203403
G1 X110.471 Y129.982 E.00145
; LINE_WIDTH: 0.167284
G1 X110.372 Y130.038 E.00115
; LINE_WIDTH: 0.126006
G1 X110.199 Y130.131 E.00133
; WIPE_START
G1 X110.372 Y130.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X110.211 Y122.407 Z.6 F30000
G1 X110.199 Y121.869 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.12598
G1 F3000
M204 S500
G1 X110.372 Y121.962 E.00133
; LINE_WIDTH: 0.167261
G1 X110.471 Y122.018 E.00115
; LINE_WIDTH: 0.203419
G1 X110.568 Y122.073 E.00146
; LINE_WIDTH: 0.242271
G1 X110.667 Y122.132 E.00188
; LINE_WIDTH: 0.283649
G1 X110.763 Y122.189 E.00219
; LINE_WIDTH: 0.305114
G1 X111.297 Y122.514 E.01335
M204 S6000
G1 X111.29 Y122.523 F30000
; LINE_WIDTH: 0.399495
G1 F3000
M204 S500
G1 X110.265 Y121.866 E.03537
; WIPE_START
G1 X111.29 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.921 Y122.378 Z.6 F30000
G1 X145.737 Y121.867 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.397824
G1 F3000
M204 S500
G1 X144.709 Y122.525 E.0353
M204 S6000
G1 X144.702 Y122.516 F30000
; LINE_WIDTH: 0.300393
G1 F3000
M204 S500
G3 X145.333 Y122.132 I17.428 J27.964 E.01549
; LINE_WIDTH: 0.24139
G1 X145.429 Y122.075 E.00181
; LINE_WIDTH: 0.202407
G1 X145.53 Y122.019 E.0015
; LINE_WIDTH: 0.16599
G1 X145.626 Y121.964 E.00112
; LINE_WIDTH: 0.125435
G1 X145.796 Y121.873 E.00129
; WIPE_START
G1 X145.626 Y121.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X145.789 Y129.594 Z.6 F30000
G1 X145.801 Y130.131 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126272
G1 F3000
M204 S500
G1 X145.626 Y130.037 E.00135
; LINE_WIDTH: 0.167665
G1 X145.529 Y129.982 E.00113
; LINE_WIDTH: 0.204086
M73 P77 R2
G1 X145.429 Y129.925 E.00152
; LINE_WIDTH: 0.24306
G1 X145.333 Y129.868 E.00182
; LINE_WIDTH: 0.301994
G3 X144.703 Y129.486 I17.603 J-29.687 E.01554
M204 S6000
G1 X144.71 Y129.477 F30000
; LINE_WIDTH: 0.399182
G1 F3000
M204 S500
G1 X145.735 Y130.134 E.03534
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X144.71 Y129.477 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M976 S1 P1 ; scan model before printing 2nd layer
M400 P100
G1 E.8
G1 E-.8
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.177 Y121.683
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.61 Y121.65 E.01441
G3 X149.104 Y121.664 I.115 J4.679 E.01643
G3 X148.117 Y121.692 I-.371 J4.336 E.87411
G1 X148.143 Y122.085 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X148.208 Y122.076 E.00204
G3 X148.624 Y122.042 I.525 J3.924 E.01283
G3 X149.07 Y122.055 I.101 J4.244 E.01371
G3 X147.868 Y122.136 I-.337 J3.945 E.72725
G1 X148.084 Y122.096 E.00672
; WIPE_START
M204 S10000
G1 X148.208 Y122.076 E-.04804
G1 X148.624 Y122.042 E-.15858
G1 X149.07 Y122.055 E-.16952
G1 X149.413 Y122.1 E-.13122
G1 X149.916 Y122.223 E-.19684
G1 X150.054 Y122.273 E-.05579
; WIPE_END
G1 E-.04 F1800
G1 X142.555 Y123.698 Z.8 F30000
G1 X107.631 Y130.336 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.085 Y130.347 E.01809
G3 X107.16 Y121.65 I.198 J-4.347 E.44277
G3 X107.655 Y121.664 I.115 J4.679 E.01643
G3 X107.69 Y130.332 I-.371 J4.336 E.42765
G1 X107.479 Y129.948 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X107.102 Y129.955 E.01157
G3 X107.174 Y122.042 I.181 J-3.955 E.3733
G3 X107.62 Y122.055 I.101 J4.245 E.01371
G3 X107.62 Y129.945 I-.337 J3.945 E.36146
G1 X107.539 Y129.947 E.0025
; WIPE_START
M204 S10000
G1 X107.102 Y129.955 E-.16592
G1 X106.687 Y129.915 E-.15862
G1 X106.418 Y129.866 E-.10388
G1 X106.084 Y129.777 E-.13127
G1 X105.76 Y129.659 E-.1313
G1 X105.597 Y129.578 E-.069
; WIPE_END
G1 E-.04 F1800
G1 X113.114 Y128.256 Z.8 F30000
G1 X139.582 Y123.602 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.0018
G1 X147.009 Y120.882 E.26067
G3 X148.832 Y120.604 I1.768 J5.465 E.06145
G3 X146.774 Y131.033 I-.111 J5.396 E.62478
G1 X139.636 Y128.398 E.2524
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.225 Y120.967 I-1.949 J-5.034 E.69479
G1 X116.364 Y123.602 E.25242
G1 X139.522 Y123.602 E.76821
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.841 Y120.212 I1.898 J5.862 E.06114
G3 X146.641 Y131.402 I-.12 J5.788 E.62048
G1 X139.566 Y128.79 E.23173
G1 X116.434 Y128.79 E.71081
G1 X109.359 Y131.402 E.23173
G3 X109.359 Y120.598 I-2.083 J-5.402 E.68983
G1 X116.434 Y123.21 E.23172
G1 X139.506 Y123.21 E.70896
; WIPE_START
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.104 Y121.736 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.611073
G1 F11088.567
G1 X147.273 Y121.373 E.01855
; LINE_WIDTH: 0.642174
G1 F10513.075
G1 X147.281 Y121.358 E.00084
; LINE_WIDTH: 0.667792
G1 F10082.07
G1 X147.288 Y121.342 E.00088
; LINE_WIDTH: 0.681303
G1 F9868.682
G3 X147.012 Y130.574 I1.433 J4.663 E.96374
; WIPE_START
G1 X147.663 Y130.757 E-.2573
G1 X148.208 Y130.847 E-.20989
G1 X148.718 Y130.874 E-.19391
G1 X148.978 Y130.86 E-.0989
; WIPE_END
G1 E-.04 F1800
G1 X141.423 Y129.775 Z.8 F30000
G1 X115.123 Y126 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46903
G1 F14784.914
G1 X114.287 Y125.691 E.03095
G1 X114.278 Y126.312 E.02155
G1 X115.067 Y126.021 E.0292
G1 X139.673 Y123.994 F30000
; LINE_WIDTH: 0.418477
G1 F15000
G1 X116.327 Y123.994 E.71445
G1 X110.366 Y121.806 E.19433
G3 X109.38 Y121.422 I326.074 J-839.451 E.03238
G1 X109.286 Y121.733 E.00994
G3 X110.151 Y122.227 I-1.461 J3.561 E.03058
G1 X110.761 Y122.783 E.02525
G1 X111.309 Y123.506 E.02776
G1 X111.569 Y123.984 E.01666
G1 X111.872 Y124.834 E.02764
G1 X112.013 Y125.774 E.02908
G1 X111.968 Y126.682 E.02783
G1 X111.739 Y127.604 E.02908
G1 X111.35 Y128.427 E.02784
G1 X110.785 Y129.191 E.02908
G1 X110.174 Y129.755 E.02545
G1 X109.654 Y130.093 E.01898
M73 P78 R2
G1 X109.287 Y130.267 E.01242
G1 X109.379 Y130.578 E.00995
G1 X110.366 Y130.194 E.03242
G1 X116.327 Y128.006 E.19433
G1 X139.673 Y128.006 E.71445
G1 X145.833 Y130.268 E.20084
G2 X146.621 Y130.581 I6.987 J-16.464 E.02595
G1 X146.716 Y130.267 E.01003
G1 X146.014 Y129.893 E.02433
G3 X144.624 Y128.384 I3.058 J-4.211 E.06321
G1 X144.348 Y127.829 E.01898
G1 X144.126 Y127.159 E.02159
G3 X144.14 Y124.782 I4.647 J-1.162 E.07352
G3 X146.443 Y121.844 I4.577 J1.216 E.11743
G1 X146.372 Y121.745 E.00372
G1 X146.432 Y121.513 E.00734
G1 X139.732 Y123.984 E.21853
G1 X139.673 Y124.371 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y124.371 E.71733
G1 X116.131 Y124.336 E.00611
G1 X110.911 Y122.409 E.17098
G1 X111.086 Y122.582 E.00755
G1 X111.61 Y123.279 E.02681
G1 X111.901 Y123.805 E.01845
G1 X112.228 Y124.709 E.02954
G1 X112.386 Y125.72 E.03144
G1 X112.345 Y126.702 E.03022
G1 X112.105 Y127.697 E.03143
G1 X111.69 Y128.589 E.03024
G1 X111.087 Y129.416 E.03144
G1 X110.911 Y129.591 E.00763
G1 X116.131 Y127.664 E.17098
G1 X116.327 Y127.629 E.00611
G1 X139.673 Y127.629 E.71733
G1 X139.869 Y127.664 E.00611
G1 X145.084 Y129.589 E.17083
G1 X144.77 Y129.251 E.01419
G1 X144.315 Y128.6 E.02441
G1 X144.009 Y127.996 E.02081
G1 X143.768 Y127.277 E.02331
G3 X143.656 Y125.283 I5.489 J-1.307 E.06169
G3 X145.082 Y122.413 I4.991 J.691 E.1002
G1 X139.868 Y124.336 E.17075
G1 X139.732 Y124.361 E.00427
G1 X139.673 Y124.748 F30000
G1 F15000
G1 X116.327 Y124.748 E.71733
G1 X116.001 Y124.69 E.01019
G1 X112.013 Y123.218 E.13062
G1 X112.292 Y123.759 E.01873
G1 X112.583 Y124.583 E.02685
G1 X112.759 Y125.665 E.03368
G1 X112.721 Y126.723 E.03251
G1 X112.47 Y127.789 E.03367
G1 X112.012 Y128.783 E.03362
G1 X116.001 Y127.31 E.13065
G1 X116.327 Y127.252 E.01019
G1 X139.673 Y127.252 E.71733
G1 X139.999 Y127.31 E.01019
G1 X143.985 Y128.782 E.13055
G1 X143.671 Y128.162 E.02133
G1 X143.409 Y127.394 E.02494
G3 X143.28 Y125.254 I5.877 J-1.428 E.06623
G3 X143.993 Y123.217 I5.239 J.689 E.0668
G1 X139.999 Y124.69 E.13081
G1 X139.732 Y124.738 E.00834
G1 X139.673 Y125.125 F30000
G1 F15000
G1 X116.327 Y125.125 E.71733
G1 X115.87 Y125.044 E.01427
G1 X112.737 Y123.887 E.10261
G1 X112.939 Y124.458 E.0186
G1 X113.132 Y125.611 E.03592
G1 X113.098 Y126.743 E.0348
G1 X112.836 Y127.882 E.03591
G1 X112.754 Y128.107 E.00735
G1 X115.87 Y126.956 E.10205
G1 X116.327 Y126.875 E.01427
G1 X139.673 Y126.875 E.71733
G1 X140.13 Y126.956 E.01427
G1 X143.246 Y128.107 E.10207
G3 X142.852 Y126.089 I6.081 J-2.235 E.06346
G1 X142.904 Y125.226 E.02657
G3 X143.245 Y123.895 I5.459 J.687 E.04232
G1 X140.129 Y125.044 E.10203
G1 X139.732 Y125.115 E.01241
G1 X139.673 Y125.502 F30000
G1 F15000
G1 X116.327 Y125.502 E.71733
G1 X116.019 Y125.474 E.0095
G3 X113.339 Y124.511 I22.662 J-67.275 E.08752
G1 X113.506 Y125.556 E.03252
G1 X113.475 Y126.763 E.03708
G1 X113.322 Y127.495 E.02298
G1 X115.739 Y126.603 E.07917
G1 X116.179 Y126.504 E.01385
G1 X116.327 Y126.498 E.00455
G1 X139.673 Y126.498 E.71733
G1 X139.981 Y126.526 E.0095
G3 X142.656 Y127.487 I-22.415 J66.587 E.08735
G1 X142.541 Y126.914 E.01796
G1 X142.476 Y126.113 E.02469
G1 X142.528 Y125.197 E.0282
G1 X142.655 Y124.514 E.02134
G1 X140.26 Y125.398 E.07844
G3 X139.732 Y125.497 I-.542 J-1.428 E.01658
G1 X139.673 Y125.845 F30000
; LINE_WIDTH: 0.352297
G1 F15000
G1 X116.327 Y125.845 E.58855
G1 X115.953 Y125.831 E.00943
; LINE_WIDTH: 0.419166
G1 X115.609 Y125.751 E.01084
G1 X113.819 Y125.09 E.05851
G1 X113.898 Y125.912 E.02531
G1 X113.833 Y126.905 E.03051
G1 X115.609 Y126.249 E.05805
; LINE_WIDTH: 0.405083
G1 X115.879 Y126.203 E.00808
; LINE_WIDTH: 0.35228
G3 X116.327 Y126.155 I.39 J1.496 E.01141
G1 X139.673 Y126.155 E.58852
; LINE_WIDTH: 0.368983
G1 X139.861 Y126.155 E.005
; LINE_WIDTH: 0.419497
G1 X140.049 Y126.155 E.00577
G3 X142.16 Y126.902 I-14.847 J45.313 E.06874
G1 X142.099 Y126.138 E.02353
G1 X142.162 Y125.098 E.03198
G1 X140.39 Y125.751 E.05795
G1 X140.049 Y125.845 E.01087
; LINE_WIDTH: 0.402988
G1 X139.891 Y125.845 E.00464
; LINE_WIDTH: 0.368983
G1 X139.733 Y125.845 E.0042
G1 X140.872 Y126 F30000
; LINE_WIDTH: 0.46607
G1 F14888.338
G1 X141.71 Y126.309 E.03078
G1 X141.711 Y125.69 E.02134
G1 X140.929 Y125.979 E.02877
; WIPE_START
G1 X141.711 Y125.69 E-.31709
G1 X141.71 Y126.309 E-.23513
G1 X141.197 Y126.12 E-.20778
; WIPE_END
G1 E-.04 F1800
G1 X133.644 Y125.019 Z.8 F30000
G1 X108.988 Y121.426 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.681315
G1 F9868.511
G2 X108.989 Y130.576 I-1.699 J4.575 E.97823
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9868.511
G1 X108.337 Y130.757 E-.2572
G1 X107.815 Y130.844 E-.20092
G1 X107.156 Y130.873 E-.25072
G1 X107.022 Y130.861 E-.05117
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/15
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.005 Y121.915
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.183 Y121.883 E.00601
G3 X148.544 Y121.852 I.542 J4.116 E.01202
G1 X148.725 Y121.848 E.00601
G3 X147.826 Y121.946 I0 J4.152 E.83527
G1 X147.946 Y121.925 E.00401
G1 X148.148 Y122.289 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P79 R2
G1 F2040
M204 S5000
G1 X148.561 Y122.244 E.01277
G1 F2160
G1 X148.725 Y122.24 E.00504
G1 F2040
G3 X150.605 Y122.744 I-.028 J3.865 E.06046
G1 F2160
G1 X150.745 Y122.829 E.00504
G1 F2040
G3 X152.357 Y125.027 I-2.031 J3.179 E.08568
G1 F2160
G1 X152.396 Y125.186 E.00505
G1 F2040
G3 X152.453 Y126.491 I-3.921 J.825 E.0403
G1 F2160
G1 X152.428 Y126.653 E.00504
G1 F2040
G3 X151.981 Y127.88 I-3.94 J-.739 E.04031
G1 F2160
G1 X151.896 Y128.02 E.00504
G1 F2040
G3 X150.882 Y129.08 I-3.206 J-2.053 E.04536
G1 F2160
G1 X150.745 Y129.171 E.00504
G1 F2040
G3 X149.698 Y129.632 I-2.052 J-3.243 E.03528
G1 F2160
G1 X149.539 Y129.671 E.00505
G1 F2040
G3 X148.234 Y129.728 I-.825 J-3.921 E.0403
G1 F2160
G1 X148.072 Y129.703 E.00504
G1 F2040
G3 X145.742 Y128.289 I.66 J-3.714 E.08568
G1 F2160
G1 X145.645 Y128.157 E.00505
G1 F2040
G3 X145.093 Y126.973 I3.308 J-2.263 E.0403
G1 F2160
G1 X145.054 Y126.814 E.00505
G1 F2040
G3 X144.997 Y125.509 I3.922 J-.825 E.0403
G1 F2160
G1 X145.022 Y125.347 E.00504
G1 F2040
G3 X145.469 Y124.12 I3.939 J.739 E.04031
G1 F2160
G1 X145.554 Y123.98 E.00504
G1 F2040
G3 X147.439 Y122.467 I3.182 J2.033 E.07561
G1 F2160
G1 X147.594 Y122.414 E.00504
G1 F2040
G3 X148.073 Y122.301 I1.212 J4.048 E.01511
G1 X148.089 Y122.298 E.0005
; WIPE_START
M204 S10000
G1 X148.561 Y122.244 E-.18065
G1 X148.725 Y122.24 E-.06232
G1 X149.216 Y122.272 E-.18692
G1 X149.698 Y122.368 E-.18695
G1 X150.055 Y122.489 E-.14317
; WIPE_END
G1 E-.04 F1800
G1 X142.543 Y123.839 Z1 F30000
G1 X107.456 Y130.144 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.275 Y130.151 E.006
G3 X107.094 Y121.852 I0 J-4.152 E.42662
G1 X107.275 Y121.848 E.00601
G3 X107.637 Y130.135 I0 J4.152 E.42067
G1 X107.516 Y130.141 E.00402
G1 X107.47 Y129.754 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X107.439 Y129.753 E.00095
G3 X106.784 Y129.728 I-.175 J-4.003 E.02015
G1 F2160
G1 X106.622 Y129.703 E.00504
G1 F2040
G3 X104.292 Y128.289 I.66 J-3.714 E.08568
G1 F2160
G1 X104.195 Y128.157 E.00505
G1 F2040
G3 X103.643 Y126.973 I3.308 J-2.263 E.0403
G1 F2160
G1 X103.604 Y126.814 E.00505
G1 F2040
G3 X103.547 Y125.509 I3.923 J-.825 E.0403
G1 F2160
G1 X103.572 Y125.347 E.00504
G1 F2040
G3 X104.019 Y124.12 I3.94 J.739 E.04031
G1 F2160
G1 X104.104 Y123.98 E.00504
G1 F2040
G3 X107.111 Y122.244 I3.187 J2.048 E.11084
G1 F2160
G1 X107.275 Y122.24 E.00504
G1 F2040
G3 X110.446 Y123.98 I-.004 J3.767 E.11593
G1 F2160
G1 X110.531 Y124.12 E.00504
G1 F2040
G3 X110.907 Y125.027 I-3.693 J2.061 E.03022
G1 F2160
G1 X110.946 Y125.186 E.00505
G1 F2040
G3 X111.003 Y126.491 I-3.922 J.825 E.0403
G1 F2160
G1 X110.978 Y126.653 E.00504
G1 F2040
G3 X110.531 Y127.88 I-3.939 J-.739 E.04031
G1 F2160
G1 X110.446 Y128.02 E.00504
G1 F2040
G3 X108.248 Y129.632 I-3.179 J-2.031 E.08568
G1 F2160
G1 X108.089 Y129.671 E.00505
G1 F2040
G3 X107.765 Y129.725 I-.825 J-3.921 E.01008
G1 X107.529 Y129.748 E.00729
; WIPE_START
M204 S10000
G1 X107.439 Y129.753 E-.03451
G1 X107.111 Y129.756 E-.12454
G1 X106.784 Y129.728 E-.12469
G1 X106.622 Y129.703 E-.0623
G1 X106.302 Y129.632 E-.12473
G1 X105.989 Y129.533 E-.12457
G1 X105.686 Y129.408 E-.12462
G1 X105.593 Y129.359 E-.04003
; WIPE_END
G1 E-.04 F1800
G1 X113.118 Y128.085 Z1 F30000
G1 X139.582 Y123.602 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.0018
G1 X147.009 Y120.882 E.26067
G3 X148.815 Y120.604 I1.767 J5.461 E.06089
G3 X146.775 Y131.033 I-.094 J5.396 E.62532
G1 X139.636 Y128.398 E.25242
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.226 Y120.967 I-1.949 J-5.034 E.6948
G1 X116.364 Y123.602 E.2524
G1 X139.522 Y123.602 E.76822
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.824 Y120.212 I1.897 J5.859 E.0606
G3 X146.642 Y131.402 I-.103 J5.788 E.62098
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X109.359 Y120.598 I-2.082 J-5.402 E.68981
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.808 Y123.442 Z1 F30000
G1 X111.812 Y126.111 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X111.714 Y126.969 E.02654
G1 X111.401 Y127.902 E.03021
G1 X111.005 Y128.595 E.02452
G1 X110.635 Y129.059 E.01826
G1 X110.052 Y129.596 E.02434
; LINE_WIDTH: 0.433263
G1 X109.639 Y129.864 E.01568
; LINE_WIDTH: 0.460551
G1 X109.225 Y130.133 E.01678
G3 X104.974 Y129.937 I-1.934 J-4.251 E.1504
G1 X104.211 Y129.377 E.0322
G1 X103.667 Y128.789 E.02727
G1 X103.149 Y127.946 E.03365
G1 X102.928 Y127.387 E.02046
G1 X102.754 Y126.613 E.02699
G1 X102.716 Y125.819 E.02706
G3 X103.28 Y123.8 I4.997 J.307 E.07187
G1 X103.731 Y123.148 E.02699
G3 X106.272 Y121.549 I3.581 J2.873 E.10408
G1 X107.06 Y121.442 E.02706
G1 X108.045 Y121.502 E.03359
G1 X108.818 Y121.707 E.02721
G1 X109.55 Y122.024 E.02715
; LINE_WIDTH: 0.475588
G1 F14560.836
G1 X109.941 Y122.331 E.01751
; LINE_WIDTH: 0.422117
G1 F15000
G1 X110.331 Y122.638 E.01535
G1 X110.985 Y123.377 E.0305
G1 X111.387 Y124.067 E.02466
G1 X111.604 Y124.62 E.01836
G1 X111.778 Y125.391 E.02441
G1 X111.809 Y126.051 E.02043
G1 X115.05 Y126 F30000
; LINE_WIDTH: 0.52015
G1 F13201.182
G1 X114.107 Y125.652 E.03909
G1 X114.114 Y126.345 E.02698
G1 X114.993 Y126.021 E.03646
G1 X139.673 Y123.994 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y123.994 E.71733
G1 X110.71 Y121.933 E.18384
; LINE_WIDTH: 0.43436
G1 X110.26 Y121.782 E.01514
; LINE_WIDTH: 0.464238
G1 F14953.104
G3 X109.099 Y121.363 I4.992 J-15.641 E.04239
G1 X108.208 Y121.107 E.03185
G2 X105.613 Y121.311 I-.911 J5.014 E.09035
G1 X104.877 Y121.633 E.02761
G2 X103.4 Y122.876 I2.905 J4.951 E.06659
G1 X102.998 Y123.461 E.02435
G1 X102.633 Y124.191 E.02803
G1 X102.423 Y124.895 E.02521
G1 X102.305 Y125.656 E.02646
G1 X102.322 Y126.523 E.02977
G1 X102.488 Y127.376 E.02983
G1 X102.707 Y127.988 E.02233
G1 X103.124 Y128.746 E.02967
G1 X103.661 Y129.425 E.02974
G1 X104.311 Y129.997 E.02972
G2 X106.702 Y130.946 I3.078 J-4.271 E.08922
G1 X107.57 Y130.97 E.02982
G1 X108.215 Y130.89 E.02232
G2 X109.342 Y130.546 I-2.191 J-9.204 E.04047
; LINE_WIDTH: 0.420675
G1 F15000
G1 X110.31 Y130.215 E.0315
G1 X116.327 Y128.006 E.1973
G1 X139.673 Y128.006 E.71863
G1 X145.289 Y130.067 E.18417
; LINE_WIDTH: 0.434365
G1 X145.739 Y130.218 E.01514
; LINE_WIDTH: 0.463512
G1 F14978.892
G3 X146.901 Y130.637 I-4.991 J15.638 E.04233
G1 X147.792 Y130.893 E.03179
G2 X150.799 Y130.527 I.913 J-5.029 E.10539
G1 X151.481 Y130.145 E.0268
G1 X152.188 Y129.576 E.03109
G1 X152.736 Y128.954 E.02842
G1 X153.084 Y128.407 E.02223
G1 X153.448 Y127.574 E.03113
G2 X153.651 Y125.262 I-5.279 J-1.629 E.08017
G1 X153.448 Y124.417 E.02978
G2 X152.108 Y122.359 I-4.661 J1.57 E.08508
G1 X151.832 Y122.111 E.01269
G1 X151.266 Y121.723 E.02354
G1 X150.555 Y121.367 E.02722
G1 X149.844 Y121.152 E.02547
G1 X148.991 Y121.034 E.02952
M73 P79 R1
G1 X148.125 Y121.06 E.0297
G1 X147.275 Y121.24 E.02978
G1 X146.658 Y121.455 E.02238
; LINE_WIDTH: 0.423337
G1 F15000
G1 X145.691 Y121.787 E.03171
G1 X139.732 Y123.984 E.19687
G1 X139.673 Y124.371 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y124.371 E.71733
G1 X116.131 Y124.336 E.00611
G1 X110.398 Y122.22 E.18777
M73 P80 R1
G1 X110.645 Y122.417 E.00971
G1 X111.269 Y123.129 E.02908
G1 X111.714 Y123.878 E.02678
G1 X111.956 Y124.483 E.02002
G1 X112.146 Y125.309 E.02604
G1 X112.189 Y126.095 E.02418
G1 X112.088 Y127.019 E.02856
G1 X111.758 Y128.023 E.03248
G1 X111.332 Y128.783 E.02678
G1 X110.929 Y129.295 E.02002
G1 X110.417 Y129.774 E.02153
G1 X116.131 Y127.664 E.18716
G1 X116.327 Y127.629 E.00611
G1 X139.673 Y127.629 E.71733
G1 X139.869 Y127.664 E.00611
G1 X145.602 Y129.78 E.18778
G1 X145.355 Y129.583 E.00972
G1 X144.731 Y128.871 E.02907
G1 X144.286 Y128.122 E.02678
G1 X143.937 Y127.124 E.03247
G1 X143.812 Y126.261 E.02679
G1 X143.871 Y125.206 E.03247
G1 X144.086 Y124.362 E.02678
G1 X144.544 Y123.409 E.03247
G1 X145.065 Y122.713 E.02672
G1 X145.58 Y122.229 E.02171
G1 X139.868 Y124.336 E.18705
G1 X139.732 Y124.361 E.00427
G1 X139.673 Y124.748 F30000
G1 F15000
G1 X116.327 Y124.748 E.71733
G1 X116.001 Y124.69 E.01019
G1 X111.701 Y123.103 E.14082
G1 X112.04 Y123.69 E.02083
G1 X112.307 Y124.346 E.02178
G1 X112.514 Y125.227 E.0278
G1 X112.565 Y126.078 E.02619
G1 X112.462 Y127.068 E.03057
G1 X112.115 Y128.144 E.03475
G1 X111.701 Y128.897 E.02641
G1 X116.001 Y127.31 E.14082
G1 X116.327 Y127.252 E.01019
G1 X139.673 Y127.252 E.71733
G1 X139.999 Y127.31 E.01019
G1 X144.299 Y128.897 E.14082
G1 X143.96 Y128.31 E.02084
G1 X143.58 Y127.245 E.03474
G1 X143.438 Y126.311 E.02905
G1 X143.495 Y125.181 E.03473
G1 X143.722 Y124.264 E.02904
G1 X144.206 Y123.242 E.03474
G1 X144.29 Y123.107 E.00489
G1 X139.999 Y124.69 E.14054
G1 X139.732 Y124.738 E.00834
G1 X139.673 Y125.125 F30000
G1 F15000
G1 X116.327 Y125.125 E.71733
G1 X115.87 Y125.044 E.01427
G1 X112.499 Y123.799 E.11041
G1 X112.717 Y124.402 E.01971
G1 X112.882 Y125.146 E.0234
G1 X112.942 Y126.062 E.02821
G1 X112.836 Y127.117 E.03259
G1 X112.494 Y128.203 E.03498
G1 X115.87 Y126.956 E.11059
G1 X116.327 Y126.875 E.01427
G1 X139.673 Y126.875 E.71733
G1 X140.13 Y126.956 E.01427
G1 X143.506 Y128.203 E.11058
G1 X143.222 Y127.366 E.02713
G1 X143.065 Y126.36 E.03131
G1 X143.118 Y125.157 E.037
G1 X143.358 Y124.166 E.0313
G1 X143.512 Y123.796 E.01233
G1 X140.129 Y125.044 E.11079
G1 X139.732 Y125.115 E.01241
G1 X139.673 Y125.502 F30000
G1 F15000
G1 X116.327 Y125.502 E.71733
G3 X115.739 Y125.397 I0 J-1.696 E.01844
G1 X113.109 Y124.426 E.08617
G1 X113.25 Y125.064 E.02008
G1 X113.319 Y126.045 E.03023
G1 X113.309 Y126.411 E.01125
G1 X113.21 Y127.166 E.0234
G1 X113.105 Y127.575 E.01296
G1 X115.739 Y126.603 E.08628
G1 X116.179 Y126.504 E.01385
G1 X116.327 Y126.498 E.00455
G1 X139.673 Y126.498 E.71733
G3 X140.261 Y126.603 I0 J1.697 E.01844
G1 X142.895 Y127.575 E.08629
G1 X142.79 Y127.164 E.01305
G1 X142.691 Y126.409 E.0234
G1 X142.742 Y125.132 E.03927
G1 X142.898 Y124.424 E.02226
G1 X140.26 Y125.398 E.0864
G3 X139.732 Y125.497 I-.542 J-1.428 E.01658
G1 X139.673 Y125.845 F30000
; LINE_WIDTH: 0.352297
G1 F15000
G1 X116.327 Y125.845 E.58855
G1 X115.953 Y125.831 E.00943
; LINE_WIDTH: 0.419241
G1 X115.609 Y125.751 E.01084
G1 X113.623 Y125.018 E.06491
G1 X113.696 Y126.029 E.03108
G3 X113.614 Y126.985 I-4.735 J.077 E.02949
G1 X115.609 Y126.249 E.06522
; LINE_WIDTH: 0.405083
G1 X115.879 Y126.203 E.00808
; LINE_WIDTH: 0.35228
G3 X116.327 Y126.155 I.39 J1.496 E.01141
G1 X139.673 Y126.155 E.58852
; LINE_WIDTH: 0.368983
G1 X139.861 Y126.155 E.005
; LINE_WIDTH: 0.419541
G1 X140.049 Y126.155 E.00577
G1 X140.391 Y126.249 E.01089
G1 X142.386 Y126.985 E.06527
G3 X142.304 Y126.044 I4.651 J-.88 E.02905
G1 X142.381 Y125.017 E.0316
G1 X140.39 Y125.751 E.0651
G1 X140.049 Y125.845 E.01087
; LINE_WIDTH: 0.402988
G1 X139.891 Y125.845 E.00464
; LINE_WIDTH: 0.368983
G1 X139.733 Y125.845 E.0042
G1 X140.95 Y126 F30000
; LINE_WIDTH: 0.5202
G1 F13199.798
G1 X141.888 Y126.346 E.03886
G1 X141.902 Y125.649 E.02712
G1 X141.007 Y125.979 E.03711
G1 X144.186 Y126.212 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X144.247 Y125.231 E.03021
G1 X144.45 Y124.459 E.02452
G1 X144.882 Y123.576 E.03021
G1 X145.364 Y122.942 E.02446
G1 X145.948 Y122.404 E.02441
; LINE_WIDTH: 0.432603
G1 X146.361 Y122.136 E.01565
; LINE_WIDTH: 0.460854
G1 X146.775 Y121.868 E.01678
G1 X147.271 Y121.676 E.01812
G1 X148.059 Y121.487 E.0276
G1 X148.811 Y121.442 E.02566
G1 X149.64 Y121.531 E.0284
G1 X150.27 Y121.707 E.02227
G1 X150.936 Y122.011 E.02493
G1 X151.586 Y122.462 E.02693
G1 X152.165 Y123.003 E.02699
G1 X152.639 Y123.657 E.02749
G1 X153.007 Y124.422 E.02893
G1 X153.215 Y125.192 E.02716
G3 X152.865 Y127.911 I-4.742 J.771 E.09467
G1 X152.472 Y128.604 E.02714
G1 X152.098 Y129.07 E.02034
G1 X151.513 Y129.608 E.02707
G1 X150.671 Y130.126 E.03367
G1 X149.735 Y130.45 E.03376
G1 X148.94 Y130.558 E.02731
G1 X147.955 Y130.498 E.03361
G1 X147.182 Y130.293 E.02724
G1 X146.45 Y129.976 E.02717
; LINE_WIDTH: 0.47561
G1 F14560.077
G1 X146.059 Y129.669 E.01751
; LINE_WIDTH: 0.422291
G1 F15000
G1 X145.669 Y129.362 E.01535
G1 X145.015 Y128.623 E.03051
G1 X144.613 Y127.933 E.02467
G1 X144.294 Y127.003 E.03039
G1 X144.194 Y126.272 E.02282
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X144.294 Y127.003 E-.28054
G1 X144.613 Y127.933 E-.3736
G1 X144.753 Y128.174 E-.10586
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.028 Y121.908
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8682
G1 X148.544 Y121.852 E.0172
G1 X148.712 Y121.848 E.00556
G3 X147.969 Y121.916 I.007 J4.152 E.84054
G1 X148.128 Y122.291 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8682
M204 S5000
G1 X148.561 Y122.244 E.01339
G1 X148.712 Y122.24 E.00465
G3 X148.068 Y122.297 I.007 J3.76 E.70594
; WIPE_START
G1 F12000
M204 S10000
G1 X148.561 Y122.244 E-.18838
G1 X148.712 Y122.24 E-.05748
G1 X149.053 Y122.254 E-.12952
G1 X149.378 Y122.297 E-.12458
G1 X149.698 Y122.368 E-.12468
G1 X150.011 Y122.467 E-.12463
G1 X150.037 Y122.478 E-.01074
; WIPE_END
G1 E-.04 F1800
G1 X142.525 Y123.83 Z1.2 F30000
G1 X107.432 Y130.148 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8682
G1 X106.913 Y130.136 E.01721
G3 X107.094 Y121.852 I.355 J-4.136 E.41506
G1 X107.262 Y121.848 E.00556
G3 X107.491 Y130.145 I.007 J4.152 E.42548
G1 X107.476 Y129.753 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8682
M204 S5000
G1 X107.439 Y129.755 E.00115
G3 X107.111 Y122.244 I-.17 J-3.756 E.36329
G1 X107.262 Y122.24 E.00465
G3 X107.766 Y129.726 I.007 J3.76 E.34782
G1 X107.536 Y129.748 E.00709
; WIPE_START
G1 F12000
M204 S10000
G1 X107.439 Y129.755 E-.03699
G1 X106.947 Y129.746 E-.18688
G1 X106.622 Y129.703 E-.12457
G1 X106.302 Y129.632 E-.12457
G1 X105.989 Y129.533 E-.12476
G1 X105.598 Y129.361 E-.16224
; WIPE_END
G1 E-.04 F1800
G1 X113.123 Y128.086 Z1.2 F30000
G1 X139.582 Y123.602 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8682
G1 X139.636 Y123.602 E.00179
G1 X147.009 Y120.882 E.26068
G3 X148.799 Y120.604 I1.766 J5.459 E.06033
G3 X146.776 Y131.034 I-.078 J5.396 E.62583
G1 X139.636 Y128.398 E.25245
G1 X116.364 Y128.398 E.77201
G1 X109.224 Y131.034 E.25244
G3 X109.225 Y120.967 I-1.948 J-5.034 E.69477
G1 X116.364 Y123.602 E.25242
G1 X139.522 Y123.602 E.76822
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8682
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.807 Y120.212 I1.897 J5.857 E.06008
G3 X146.642 Y131.402 I-.086 J5.788 E.62151
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X109.359 Y120.598 I-2.082 J-5.402 E.68981
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.809 Y121.618 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.462589
G1 F8682
G1 X147.039 Y121.759 E.00925
G1 X147.659 Y121.573 E.02215
G1 X148.45 Y121.446 E.02738
G1 X149.248 Y121.469 E.02732
G1 X149.891 Y121.589 E.02236
G3 X152.078 Y122.906 I-1.351 J4.719 E.08833
G3 X152.686 Y123.733 I-8.479 J6.871 E.0351
G1 X153.007 Y124.425 E.02609
G1 X153.171 Y124.984 E.01993
G1 X153.28 Y125.783 E.02757
G1 X153.248 Y126.579 E.02727
G1 X153.05 Y127.434 E.02999
G1 X152.722 Y128.196 E.02838
G3 X152.089 Y129.08 I-7.151 J-4.452 E.03718
G3 X151.257 Y129.784 I-3.022 J-2.724 E.0374
G1 X150.563 Y130.166 E.02708
G1 X149.808 Y130.432 E.02736
G1 X149.23 Y130.525 E.02004
G1 X148.428 Y130.552 E.02744
G3 X147.093 Y130.249 I.65 J-5.955 E.04691
G1 X146.969 Y130.661 E.01472
G1 X147.47 Y130.809 E.01787
G1 X148.249 Y130.955 E.02708
G2 X150.756 Y130.545 I.424 J-5.285 E.08773
G2 X153.604 Y126.986 I-2.121 J-4.616 E.16167
G1 X153.702 Y126.127 E.02957
G1 X153.648 Y125.263 E.02962
G1 X153.449 Y124.418 E.02967
G1 X153.103 Y123.624 E.02962
G2 X151.863 Y122.132 I-4.827 J2.749 E.0667
G1 X151.141 Y121.648 E.0297
G2 X149.417 Y121.072 I-2.519 J4.671 E.06247
G1 X148.556 Y121.027 E.02949
G2 X146.895 Y121.366 I.283 J5.632 E.05821
G1 X146.828 Y121.561 E.00705
; WIPE_START
G1 F15000
G1 X146.895 Y121.366 E-.07832
G1 X147.539 Y121.164 E-.25641
G1 X147.896 Y121.1 E-.1379
G1 X148.556 Y121.027 E-.25248
G1 X148.648 Y121.032 E-.0349
; WIPE_END
G1 E-.04 F1800
G1 X141.087 Y122.079 Z1.2 F30000
G1 X127.579 Y123.95 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8682
G1 X125.95 Y123.95 E.05401
G1 X130.05 Y128.05 E.19231
G1 X133.626 Y128.05 E.11864
G1 X137.726 Y123.95 E.19231
G1 X139.699 Y123.95 E.06545
G1 X140.87 Y123.518 E.04142
G1 X144.332 Y126.98 E.16242
G3 X144.342 Y125.01 I5.092 J-.959 E.06578
G1 X140.87 Y128.482 E.1629
G1 X139.699 Y128.05 E.04141
G1 X137.726 Y128.05 E.06545
G1 X133.626 Y123.95 E.19231
M73 P81 R1
G1 X130.05 Y123.95 E.11864
G1 X125.95 Y128.05 E.19231
G1 X122.374 Y128.05 E.11864
G1 X118.274 Y123.95 E.19231
G1 X116.301 Y123.95 E.06545
G1 X115.13 Y123.518 E.04141
G1 X111.662 Y126.986 E.16269
G2 X111.667 Y125.019 I-4.683 J-.995 E.06572
G1 X115.13 Y128.482 E.16247
G1 X116.301 Y128.05 E.04141
G1 X118.274 Y128.05 E.06545
G1 X122.374 Y123.95 E.19231
G1 X120.745 Y123.95 E.05401
; WIPE_START
G1 F15476.087
G1 X122.374 Y123.95 E-.61876
G1 X122.111 Y124.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X114.656 Y122.575 Z1.2 F30000
G1 X109.031 Y121.339 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.462197
G1 F8682
G1 X108.531 Y121.191 E.01782
G1 X107.751 Y121.045 E.02709
G2 X105.201 Y121.474 I-.425 J5.271 E.08924
G1 X104.516 Y121.853 E.02676
G1 X103.999 Y122.25 E.02228
G2 X103.055 Y123.355 I4.037 J4.403 E.04975
G2 X102.455 Y127.228 I4.263 J2.645 E.13759
G1 X102.745 Y128.058 E.03002
G1 X103.173 Y128.815 E.02973
G2 X105.545 Y130.666 I4.21 J-2.952 E.10432
G1 X106.372 Y130.887 E.02923
G1 X106.739 Y130.948 E.01272
G2 X109.029 Y130.661 I.524 J-5.092 E.07953
G1 X108.911 Y130.259 E.0143
G1 X108.292 Y130.448 E.02211
G1 X107.552 Y130.553 E.02551
G3 X106.465 Y130.488 I-.078 J-7.835 E.03724
G1 X105.729 Y130.293 E.02601
G3 X104.734 Y129.779 I1.398 J-3.929 E.03838
G1 X104.118 Y129.281 E.02706
G1 X103.587 Y128.686 E.02725
G1 X103.177 Y128.001 E.02727
G1 X102.892 Y127.261 E.02711
G3 X102.718 Y126.181 I7.611 J-1.777 E.03739
G1 X102.748 Y125.42 E.02601
G3 X102.998 Y124.417 I8.689 J1.637 E.03534
G1 X103.381 Y123.629 E.02995
G1 X103.722 Y123.153 E.02
G1 X104.273 Y122.576 E.02724
G1 X104.736 Y122.214 E.02011
G1 X105.395 Y121.853 E.02566
G1 X105.788 Y121.688 E.01457
G1 X106.467 Y121.51 E.02399
G3 X108.907 Y121.751 I.781 J4.556 E.08476
G1 X109.014 Y121.396 E.01265
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X108.907 Y121.751 E-.14074
G1 X108.7 Y121.677 E-.08337
G1 X108.151 Y121.532 E-.21585
G1 X107.572 Y121.448 E-.22234
G1 X107.315 Y121.446 E-.0977
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/15
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.028 Y121.908
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8486
G1 X148.544 Y121.852 E.01721
G3 X148.904 Y121.852 I.181 J4.786 E.01195
G3 X147.969 Y121.917 I-.179 J4.146 E.83385
G1 X148.107 Y122.293 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8486
M204 S5000
G1 X148.561 Y122.244 E.01405
G3 X148.888 Y122.243 I.164 J4.354 E.01006
G3 X148.047 Y122.302 I-.163 J3.755 E.69963
; WIPE_START
G1 F12000
M204 S10000
G1 X148.561 Y122.244 E-.19651
G1 X148.888 Y122.243 E-.12436
G1 X149.216 Y122.272 E-.12492
G1 X149.539 Y122.329 E-.12465
G1 X150.01 Y122.466 E-.18661
G1 X150.017 Y122.469 E-.00295
; WIPE_END
G1 E-.04 F1800
G1 X142.505 Y123.819 Z1.4 F30000
G1 X107.259 Y130.151 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8486
G1 X106.913 Y130.132 E.01148
G3 X107.094 Y121.852 I.362 J-4.134 E.41445
G3 X107.454 Y121.852 I.182 J4.771 E.01195
G3 X107.318 Y130.148 I-.179 J4.146 E.42515
G1 X107.486 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8486
M204 S5000
G1 X107.275 Y129.756 E.00649
G3 X107.111 Y122.244 I0 J-3.758 E.35775
G3 X107.438 Y122.243 I.164 J4.337 E.01006
G3 X107.602 Y129.742 I-.163 J3.755 E.34771
G1 X107.546 Y129.746 E.00175
; WIPE_START
G1 F12000
M204 S10000
G1 X107.275 Y129.756 E-.10299
G1 X106.947 Y129.746 E-.12464
G1 X106.486 Y129.676 E-.17721
G1 X106.144 Y129.586 E-.13426
G1 X105.836 Y129.474 E-.12471
G1 X105.607 Y129.367 E-.09619
; WIPE_END
G1 E-.04 F1800
G1 X113.131 Y128.09 Z1.4 F30000
G1 X139.583 Y123.602 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8486
G1 X139.636 Y123.602 E.00178
G1 X147.009 Y120.882 E.26067
G3 X148.792 Y120.604 I1.767 J5.46 E.06012
G3 X146.776 Y131.034 I-.068 J5.397 E.62634
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.225 Y120.966 I-1.949 J-5.034 E.69477
G1 X116.364 Y123.602 E.25243
G1 X139.523 Y123.602 E.76823
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8486
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.793 Y120.212 I1.896 J5.856 E.05966
G3 X146.642 Y131.402 I-.069 J5.789 E.6222
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.359 Y131.402 E.23173
G3 X109.359 Y120.598 I-2.083 J-5.402 E.68982
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.255 Y123.95 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8486
G1 X133.626 Y123.95 E.05401
G1 X137.726 Y128.05 E.19231
G1 X139.699 Y128.05 E.06545
G1 X140.87 Y128.482 E.04141
G1 X144.342 Y125.01 E.1629
G2 X144.338 Y126.986 I4.316 J.998 E.06612
G1 X140.87 Y123.518 E.16268
G1 X139.699 Y123.95 E.04142
G1 X137.726 Y123.95 E.06545
G1 X133.626 Y128.05 E.19231
G1 X130.05 Y128.05 E.11864
G1 X125.95 Y123.95 E.19231
G1 X122.374 Y123.95 E.11864
G1 X118.274 Y128.05 E.19231
G1 X116.301 Y128.05 E.06545
G1 X115.13 Y128.482 E.04141
G1 X111.666 Y125.018 E.16251
G3 X111.668 Y126.98 I-5.242 J.986 E.06547
G1 X115.13 Y123.518 E.16243
G1 X116.301 Y123.95 E.04141
G1 X118.274 Y123.95 E.06545
G1 X122.374 Y128.05 E.19231
G1 X125.95 Y128.05 E.11864
G1 X130.05 Y123.95 E.19231
G1 X128.421 Y123.95 E.05401
; WIPE_START
G1 F15476.087
G1 X130.05 Y123.95 E-.61876
G1 X129.787 Y124.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X137.34 Y123.117 Z1.4 F30000
G1 X144.95 Y122.013 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8486
G1 X146.477 Y121.45 E.05401
G1 X146.912 Y121.884 E.02038
G3 X147.739 Y121.613 I1.841 J4.22 E.02892
G1 X148.389 Y120.963 E.0305
G3 X153.249 Y123.779 I.252 J5.166 E.19695
G1 X152.841 Y124.187 E.01912
G3 X152.841 Y127.813 I-4.129 J1.813 E.12379
G1 X153.256 Y128.228 E.01945
G3 X148.388 Y131.036 I-4.541 J-2.247 E.1976
G1 X147.739 Y130.387 E.03045
G3 X146.912 Y130.116 I1.018 J-4.502 E.02892
G1 X146.476 Y130.552 E.02045
G1 X144.948 Y129.988 E.05401
; WIPE_START
G1 F15476.087
G1 X146.476 Y130.552 E-.61876
G1 X146.739 Y130.289 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X139.107 Y130.225 Z1.4 F30000
G1 X111.052 Y129.988 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8486
G1 X109.524 Y130.552 E.05401
G1 X109.087 Y130.115 E.02049
G3 X108.261 Y130.387 I-1.811 J-4.108 E.0289
G1 X107.611 Y131.037 E.03049
G3 X102.744 Y128.228 I-.324 J-5.06 E.19757
G1 X103.16 Y127.812 E.01951
G3 X103.159 Y124.187 I4.12 J-1.814 E.12377
G1 X102.748 Y123.775 E.0193
G3 X107.612 Y120.964 I4.577 J2.306 E.19725
G1 X108.266 Y121.617 E.03066
G3 X109.088 Y121.884 I-.873 J4.095 E.02873
G1 X109.524 Y121.448 E.02045
G1 X111.052 Y122.012 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X109.524 Y121.448 E-.61876
G1 X109.261 Y121.711 E-.14124
; WIPE_END
M73 P82 R1
G1 E-.04 F1800
; layer num/total_layer_count: 6/15
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.028 Y121.908
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8439
G1 X148.544 Y121.852 E.01721
G3 X148.903 Y121.852 I.182 J5.116 E.01193
G3 X147.969 Y121.917 I-.178 J4.146 E.83387
G1 X148.084 Y122.296 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8439
M204 S5000
G1 X148.561 Y122.244 E.01474
G3 X148.888 Y122.243 I.164 J4.651 E.01005
G3 X148.025 Y122.306 I-.163 J3.755 E.69895
; WIPE_START
G1 F12000
M204 S10000
G1 X148.561 Y122.244 E-.20501
G1 X148.888 Y122.243 E-.12425
G1 X149.216 Y122.272 E-.12501
G1 X149.539 Y122.329 E-.12462
G1 X149.855 Y122.414 E-.12432
G1 X149.994 Y122.468 E-.05679
; WIPE_END
G1 E-.04 F1800
G1 X142.482 Y123.818 Z1.6 F30000
G1 X107.259 Y130.151 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8439
G1 X106.913 Y130.132 E.01148
G3 X107.094 Y121.852 I.362 J-4.134 E.41445
G3 X107.453 Y121.852 I.182 J5.116 E.01193
G3 X107.318 Y130.148 I-.178 J4.146 E.42518
G1 X107.492 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8439
M204 S5000
G1 X107.275 Y129.756 E.00667
G3 X107.111 Y122.244 I0 J-3.758 E.35775
G3 X107.438 Y122.243 I.164 J4.651 E.01005
G3 X107.602 Y129.742 I-.163 J3.755 E.34771
G1 X107.552 Y129.746 E.00156
; WIPE_START
G1 F12000
M204 S10000
G1 X107.275 Y129.756 E-.10528
G1 X106.947 Y129.746 E-.12464
G1 X106.461 Y129.671 E-.18683
G1 X106.145 Y129.586 E-.12431
G1 X105.836 Y129.474 E-.12505
G1 X105.612 Y129.369 E-.09389
; WIPE_END
G1 E-.04 F1800
G1 X113.137 Y128.092 Z1.6 F30000
G1 X139.583 Y123.602 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8439
G1 X139.636 Y123.602 E.00178
G1 X147.009 Y120.882 E.26068
G3 X148.774 Y120.604 I1.767 J5.46 E.05953
G3 X146.776 Y131.034 I-.054 J5.396 E.62664
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.225 Y120.967 I-1.946 J-5.034 E.69448
G1 X116.364 Y123.602 E.25242
G1 X139.523 Y123.602 E.76824
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8439
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.776 Y120.212 I1.897 J5.858 E.05912
G3 X147.703 Y131.698 I-.051 J5.788 E.58881
G3 X146.641 Y131.402 I1.058 J-5.851 E.03391
G1 X139.566 Y128.79 E.23173
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X108.297 Y120.302 I-2.083 J-5.402 E.65587
G3 X109.359 Y120.598 I-1.058 J5.851 E.03391
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.673 Y129.411 Z1.6 F30000
G1 X144.948 Y129.988 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8439
G1 X146.476 Y130.552 E.05401
G1 X146.912 Y130.116 E.02045
G2 X147.736 Y130.384 I1.827 J-4.213 E.0288
G1 X148.388 Y131.036 E.03058
G2 X153.249 Y128.221 I.29 J-5.102 E.19727
G1 X152.836 Y127.809 E.01934
G2 X152.841 Y124.187 I-4.089 J-1.816 E.12368
G1 X153.255 Y123.77 E.01949
G2 X148.389 Y120.963 I-4.621 J2.388 E.19686
G1 X147.739 Y121.613 E.0305
G2 X146.912 Y121.884 I1.014 J4.491 E.02892
G1 X146.477 Y121.45 E.02038
G1 X144.95 Y122.013 E.05401
; WIPE_START
G1 F15476.087
G1 X146.477 Y121.45 E-.61877
G1 X146.74 Y121.712 E-.14123
; WIPE_END
G1 E-.04 F1800
G1 X139.164 Y122.638 Z1.6 F30000
G1 X128.421 Y123.95 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8439
G1 X130.05 Y123.95 E.05401
G1 X125.95 Y128.05 E.19231
G1 X122.374 Y128.05 E.11864
G1 X118.274 Y123.95 E.19231
G1 X116.301 Y123.95 E.06545
G1 X115.13 Y123.518 E.04141
G1 X111.659 Y126.989 E.16283
G2 X111.658 Y125.01 I-4.274 J-.986 E.06623
G1 X115.13 Y128.482 E.1629
G1 X116.301 Y128.05 E.04141
G1 X118.274 Y128.05 E.06545
G1 X122.374 Y123.95 E.19231
G1 X125.95 Y123.95 E.11864
G1 X130.05 Y128.05 E.19231
G1 X133.626 Y128.05 E.11864
G1 X137.726 Y123.95 E.19231
G1 X139.699 Y123.95 E.06545
G1 X140.87 Y123.518 E.04142
G1 X144.342 Y126.991 E.1629
G3 X144.342 Y125.01 I4.249 J-.991 E.06629
G1 X140.87 Y128.482 E.1629
G1 X139.699 Y128.05 E.04141
G1 X137.726 Y128.05 E.06545
G1 X133.626 Y123.95 E.19231
G1 X135.255 Y123.95 E.05401
; WIPE_START
G1 F15476.087
G1 X133.626 Y123.95 E-.61876
G1 X133.889 Y124.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X126.292 Y123.481 Z1.6 F30000
G1 X111.052 Y122.012 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8439
G1 X109.524 Y121.448 E.05401
G1 X109.088 Y121.884 E.02045
G2 X108.264 Y121.616 I-1.827 J4.213 E.0288
G1 X107.612 Y120.964 E.03058
G2 X102.744 Y123.772 I-.327 J5.056 E.1976
G1 X103.163 Y124.191 E.01964
G2 X103.159 Y127.813 I4.095 J1.816 E.1237
G1 X102.748 Y128.225 E.0193
G2 X107.612 Y131.036 I4.534 J-2.231 E.19762
G1 X108.256 Y130.392 E.0302
G2 X109.087 Y130.115 I-.851 J-3.931 E.02912
G1 X109.524 Y130.552 E.02051
G1 X111.052 Y129.988 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X109.524 Y130.552 E-.61876
G1 X109.261 Y130.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/15
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.98 Y121.917
G1 Z1.4
M73 P83 R1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8398
G1 X148.004 Y121.911 E.00081
G3 X148.363 Y121.864 I.725 J4.088 E.01201
G1 X148.551 Y121.851 E.00624
G3 X147.477 Y122.041 I.178 J4.148 E.82907
G1 X147.922 Y121.931 E.01521
G1 X148.069 Y122.298 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8398
M204 S5000
G1 X148.072 Y122.297 E.00009
G3 X148.397 Y122.254 I.654 J3.702 E.01008
G1 X148.563 Y122.243 E.00512
G3 X147.752 Y122.368 I.163 J3.756 E.70057
G1 X148.011 Y122.311 E.00814
; WIPE_START
G1 F12000
M204 S10000
G1 X148.072 Y122.297 E-.02397
G1 X148.397 Y122.254 E-.1246
G1 X148.563 Y122.243 E-.06327
G1 X149.053 Y122.254 E-.18604
G1 X149.378 Y122.297 E-.12459
G1 X149.649 Y122.356 E-.10542
G1 X149.981 Y122.458 E-.13211
; WIPE_END
G1 E-.04 F1800
G1 X142.47 Y123.81 Z1.8 F30000
G1 X107.259 Y130.151 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8398
G1 X106.913 Y130.135 E.01148
G3 X106.913 Y121.864 I.366 J-4.136 E.40836
G1 X107.101 Y121.851 E.00624
G3 X107.319 Y130.151 I.178 J4.148 E.43725
G1 X107.499 Y129.75 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8398
M204 S5000
G1 X107.275 Y129.759 E.0069
G3 X106.947 Y122.254 I.002 J-3.76 E.35274
G1 X107.113 Y122.243 E.00512
G3 X107.603 Y129.745 I.163 J3.756 E.35791
G1 X107.559 Y129.747 E.00134
; WIPE_START
G1 F12000
M204 S10000
G1 X107.275 Y129.759 E-.10808
G1 X106.947 Y129.746 E-.12467
G1 X106.622 Y129.703 E-.12459
G1 X106.144 Y129.586 E-.18686
G1 X105.836 Y129.474 E-.12473
G1 X105.621 Y129.368 E-.09106
; WIPE_END
G1 E-.04 F1800
G1 X113.146 Y128.09 Z1.8 F30000
G1 X139.583 Y123.602 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8398
G1 X139.636 Y123.602 E.00177
G1 X147.009 Y120.882 E.26067
G3 X148.757 Y120.604 I1.768 J5.463 E.05896
G3 X146.776 Y131.034 I-.036 J5.396 E.62721
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.224 Y131.034 E.25245
G3 X109.225 Y120.966 I-1.948 J-5.034 E.69475
G1 X116.364 Y123.602 E.25243
G1 X139.523 Y123.602 E.76824
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8398
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.758 Y120.211 I1.898 J5.861 E.05859
G3 X146.642 Y131.402 I-.037 J5.788 E.62299
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X108.246 Y131.707 I-2.113 J-5.538 E.0355
G3 X109.359 Y120.598 I-.967 J-5.707 E.65398
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.95 Y122.013 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8398
G1 X146.477 Y121.45 E.05401
G1 X146.912 Y121.884 E.02038
G3 X147.733 Y121.619 I1.732 J3.955 E.02868
G1 X148.389 Y120.963 E.03076
G3 X153.256 Y123.772 I.324 J5.06 E.19757
G1 X152.841 Y124.187 E.01947
G3 X152.841 Y127.813 I-4.286 J1.813 E.12356
G1 X153.252 Y128.225 E.0193
G3 X148.389 Y131.037 I-4.58 J-2.308 E.19722
G1 X147.744 Y130.392 E.03025
G3 X146.912 Y130.116 I1.163 J-4.893 E.02913
G1 X146.476 Y130.552 E.02045
G1 X144.948 Y129.988 E.05401
; WIPE_START
G1 F15476.087
G1 X146.476 Y130.552 E-.61877
G1 X146.739 Y130.289 E-.14123
; WIPE_END
G1 E-.04 F1800
G1 X139.163 Y129.363 Z1.8 F30000
G1 X128.421 Y128.05 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8398
G1 X130.05 Y128.05 E.05401
G1 X125.95 Y123.95 E.19231
G1 X122.374 Y123.95 E.11864
G1 X118.274 Y128.05 E.19231
G1 X116.301 Y128.05 E.06545
G1 X115.13 Y128.482 E.04141
G1 X111.656 Y125.008 E.16296
G3 X111.657 Y126.992 I-4.762 J.992 E.06625
G1 X115.13 Y123.518 E.16295
G1 X116.301 Y123.95 E.04141
G1 X118.274 Y123.95 E.06545
G1 X122.374 Y128.05 E.19231
G1 X125.95 Y128.05 E.11864
G1 X130.05 Y123.95 E.19231
G1 X133.626 Y123.95 E.11864
G1 X137.726 Y128.05 E.19231
G1 X139.699 Y128.05 E.06545
G1 X140.87 Y128.482 E.04141
G1 X144.337 Y125.015 E.16265
G2 X144.333 Y126.981 I5.122 J.994 E.06561
G1 X140.87 Y123.518 E.16245
G1 X139.699 Y123.95 E.04142
G1 X137.726 Y123.95 E.06545
G1 X133.626 Y128.05 E.19231
G1 X135.255 Y128.05 E.05401
; WIPE_START
G1 F15476.087
G1 X133.626 Y128.05 E-.61876
G1 X133.889 Y127.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X126.292 Y128.519 Z1.8 F30000
G1 X111.052 Y129.988 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F8398
G1 X109.524 Y130.552 E.05401
G1 X109.088 Y130.116 E.02045
G3 X108.261 Y130.387 I-2.316 J-5.666 E.0289
G1 X107.611 Y131.037 E.03047
G3 X102.744 Y128.228 I-.306 J-5.092 E.19742
G1 X103.159 Y127.813 E.01947
G3 X103.159 Y124.187 I4.287 J-1.813 E.12355
G1 X102.748 Y123.775 E.0193
G3 X107.611 Y120.963 I4.58 J2.308 E.19722
G1 X108.267 Y121.618 E.03076
G3 X109.088 Y121.884 I-.915 J4.233 E.02869
G1 X109.524 Y121.448 E.02045
G1 X111.052 Y122.012 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X109.524 Y121.448 E-.61876
G1 X109.261 Y121.711 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/15
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.98 Y121.917
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8455
G1 X148.004 Y121.911 E.0008
G3 X148.363 Y121.864 I.725 J4.088 E.01202
G1 X148.551 Y121.851 E.00623
M73 P84 R1
G3 X147.477 Y122.041 I.178 J4.148 E.82905
G1 X147.922 Y121.931 E.01522
G1 X148.045 Y122.304 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8455
M204 S5000
G1 X148.072 Y122.297 E.00085
G3 X148.397 Y122.254 I.655 J3.702 E.01008
G1 X148.563 Y122.243 E.00512
G3 X147.595 Y122.414 I.163 J3.756 E.69553
G1 X147.987 Y122.318 E.01242
; WIPE_START
G1 F12000
M204 S10000
G1 X148.072 Y122.297 E-.03327
G1 X148.397 Y122.254 E-.1246
G1 X148.563 Y122.243 E-.06327
G1 X149.053 Y122.254 E-.18604
G1 X149.378 Y122.297 E-.12461
G1 X149.637 Y122.353 E-.10062
G1 X149.958 Y122.451 E-.1276
; WIPE_END
G1 E-.04 F1800
G1 X142.448 Y123.81 Z2 F30000
G1 X107.456 Y130.144 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8455
G1 X107.275 Y130.151 E.006
G3 X106.913 Y121.864 I.004 J-4.152 E.42038
G1 X107.101 Y121.851 E.00623
G3 X107.637 Y130.135 I.178 J4.148 E.42669
G1 X107.516 Y130.141 E.00403
G1 X107.505 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8455
M204 S5000
G1 X107.439 Y129.756 E.00203
G3 X106.947 Y122.254 I-.162 J-3.756 E.35777
G1 X107.113 Y122.243 E.00512
G3 X107.766 Y129.727 I.163 J3.756 E.35288
G1 X107.564 Y129.745 E.00621
; WIPE_START
G1 F12000
M204 S10000
G1 X107.439 Y129.756 E-.04786
G1 X106.947 Y129.746 E-.18688
G1 X106.622 Y129.703 E-.1246
G1 X106.302 Y129.632 E-.12471
G1 X105.989 Y129.533 E-.12459
G1 X105.686 Y129.408 E-.12462
G1 X105.624 Y129.375 E-.02674
; WIPE_END
G1 E-.04 F1800
G1 X113.148 Y128.096 Z2 F30000
G1 X139.583 Y123.602 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8455
G1 X139.636 Y123.602 E.00176
G1 X147.009 Y120.882 E.26067
G3 X148.74 Y120.603 I1.769 J5.469 E.05838
G3 X146.776 Y131.034 I-.015 J5.397 E.62807
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.225 Y120.967 I-1.946 J-5.034 E.69448
G1 X116.364 Y123.602 E.25242
G1 X139.523 Y123.602 E.76825
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8455
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.741 Y120.211 I1.899 J5.867 E.05806
G3 X154.377 Y127.251 I-.024 J5.795 E.3175
G3 X146.641 Y131.402 I-5.659 J-1.263 E.30601
G1 X139.566 Y128.79 E.23173
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X109.359 Y120.598 I-2.082 J-5.402 E.68981
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.716 Y127.634 Z2 F30000
G1 X135.255 Y128.05 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8455
G1 X133.626 Y128.05 E.05401
G1 X137.726 Y123.95 E.19231
G1 X139.699 Y123.95 E.06545
G1 X140.87 Y123.518 E.04142
G1 X144.333 Y126.981 E.16245
G3 X144.343 Y125.009 I4.994 J-.96 E.06584
G1 X140.87 Y128.482 E.16293
G1 X139.699 Y128.05 E.04141
G1 X137.726 Y128.05 E.06545
G1 X133.626 Y123.95 E.19231
G1 X130.05 Y123.95 E.11864
G1 X125.95 Y128.05 E.19231
G1 X122.374 Y128.05 E.11864
G1 X118.274 Y123.95 E.19231
G1 X116.301 Y123.95 E.06545
G1 X115.13 Y123.518 E.04141
G1 X111.657 Y126.991 E.16293
G2 X111.657 Y125.009 I-4.775 J-.991 E.06622
G1 X115.13 Y128.482 E.16294
G1 X116.301 Y128.05 E.04141
G1 X118.274 Y128.05 E.06545
G1 X122.374 Y123.95 E.19231
G1 X125.95 Y123.95 E.11864
G1 X130.05 Y128.05 E.19231
G1 X128.421 Y128.05 E.05401
; WIPE_START
G1 F15476.087
G1 X130.05 Y128.05 E-.61876
G1 X129.787 Y127.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X137.34 Y128.883 Z2 F30000
G1 X144.948 Y129.988 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8455
G1 X146.476 Y130.552 E.05401
G1 X146.912 Y130.116 E.02045
G2 X147.734 Y130.382 I1.743 J-3.982 E.02871
G1 X148.389 Y131.037 E.03074
G2 X153.252 Y128.225 I.283 J-5.121 E.19722
G1 X152.84 Y127.812 E.01937
G2 X152.841 Y124.187 I-4.273 J-1.814 E.12353
G1 X153.255 Y123.77 E.01949
G2 X148.389 Y120.963 I-4.621 J2.388 E.19686
G1 X147.733 Y121.619 E.03076
G2 X146.912 Y121.884 I.91 J4.219 E.02868
G1 X146.477 Y121.45 E.02038
G1 X144.95 Y122.013 E.05401
; WIPE_START
G1 F15476.087
G1 X146.477 Y121.45 E-.61876
G1 X146.74 Y121.712 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X139.108 Y121.776 Z2 F30000
G1 X111.052 Y122.012 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8455
G1 X109.524 Y121.448 E.05401
G1 X109.088 Y121.884 E.02045
G2 X108.266 Y121.618 I-1.737 J3.969 E.02869
G1 X107.612 Y120.964 E.03071
G2 X102.748 Y123.775 I-.287 J5.118 E.19725
G1 X103.16 Y124.188 E.01936
G2 X103.159 Y127.813 I4.275 J1.814 E.12353
G1 X102.745 Y128.23 E.01949
G2 X107.611 Y131.037 I4.587 J-2.329 E.19713
G1 X108.266 Y130.382 E.03075
G2 X109.088 Y130.116 I-.916 J-4.233 E.0287
G1 X109.524 Y130.552 E.02045
G1 X111.052 Y129.988 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X109.524 Y130.552 E-.61876
G1 X109.261 Y130.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/15
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.02 Y121.909
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8463
G1 X148.368 Y121.863 E.01163
G3 X148.902 Y121.851 I.367 J4.579 E.01774
G3 X147.961 Y121.919 I-.177 J4.147 E.83366
G1 X148.019 Y122.309 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8463
M204 S5000
G1 X148.072 Y122.297 E.00167
G3 X148.399 Y122.254 I.653 J3.701 E.01013
G3 X148.888 Y122.243 I.335 J4.186 E.01503
G3 X147.752 Y122.368 I-.163 J3.755 E.69034
M73 P85 R1
G1 X147.961 Y122.322 E.00657
; WIPE_START
G1 F12000
M204 S10000
G1 X148.072 Y122.297 E-.04342
G1 X148.399 Y122.254 E-.12528
G1 X148.888 Y122.243 E-.18574
G1 X149.216 Y122.272 E-.12518
G1 X149.622 Y122.349 E-.15695
G1 X149.93 Y122.45 E-.12343
; WIPE_END
G1 E-.04 F1800
G1 X142.421 Y123.815 Z2.2 F30000
G1 X107.653 Y130.134 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8463
G1 X107.636 Y130.132 E.00055
G3 X106.918 Y121.863 I-.362 J-4.134 E.43266
G3 X107.452 Y121.851 I.367 J4.579 E.01774
G3 X107.995 Y130.085 I-.177 J4.147 E.4026
G1 X107.712 Y130.126 E.00949
G1 X107.514 Y129.75 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8463
M204 S5000
G1 X107.275 Y129.756 E.00735
G3 X106.949 Y122.254 I0 J-3.758 E.35278
G3 X107.438 Y122.243 I.335 J4.186 E.01503
G3 X107.602 Y129.742 I-.163 J3.755 E.34772
G1 X107.574 Y129.745 E.00087
; WIPE_START
G1 F12000
M204 S10000
G1 X107.275 Y129.756 E-.1137
G1 X106.947 Y129.746 E-.12453
G1 X106.621 Y129.703 E-.12528
G1 X106.378 Y129.651 E-.09412
G1 X105.989 Y129.533 E-.15455
G1 X105.686 Y129.408 E-.12462
G1 X105.632 Y129.38 E-.02319
; WIPE_END
G1 E-.04 F1800
G1 X113.156 Y128.099 Z2.2 F30000
G1 X139.583 Y123.602 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8463
G1 X139.636 Y123.602 E.00176
G1 X147.009 Y120.882 E.26067
G3 X148.722 Y120.603 I1.771 J5.478 E.0578
G3 X146.776 Y131.034 I-.001 J5.397 E.62836
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.224 Y131.034 E.25245
G3 X109.225 Y120.966 I-1.945 J-5.034 E.69444
G1 X116.364 Y123.602 E.25243
G1 X139.523 Y123.602 E.76826
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8463
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.723 Y120.211 I1.901 J5.876 E.05752
G3 X147.754 Y131.707 I.002 J5.789 E.58881
G3 X146.642 Y131.402 I1.001 J-5.842 E.0355
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X108.246 Y120.293 I-2.083 J-5.402 E.65426
G3 X109.359 Y120.598 I-1.001 J5.842 E.03551
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.255 Y123.95 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8463
G1 X133.626 Y123.95 E.05401
G1 X137.726 Y128.05 E.19231
G1 X139.699 Y128.05 E.06545
G1 X140.87 Y128.482 E.04141
G1 X144.333 Y125.019 E.16245
G2 X144.333 Y126.981 I5.522 J.981 E.06541
G1 X140.87 Y123.518 E.16244
G1 X139.699 Y123.95 E.04142
G1 X137.726 Y123.95 E.06545
G1 X133.626 Y128.05 E.19231
G1 X130.05 Y128.05 E.11864
G1 X125.95 Y123.95 E.19231
G1 X122.374 Y123.95 E.11864
G1 X118.274 Y128.05 E.19231
G1 X116.301 Y128.05 E.06545
G1 X115.13 Y128.482 E.04141
G1 X111.662 Y125.014 E.16269
G3 X111.661 Y126.987 I-4.967 J.984 E.06587
G1 X115.13 Y123.518 E.16274
G1 X116.301 Y123.95 E.04141
G1 X118.274 Y123.95 E.06545
G1 X122.374 Y128.05 E.19231
G1 X125.95 Y128.05 E.11864
G1 X130.05 Y123.95 E.19231
G1 X128.421 Y123.95 E.05401
; WIPE_START
G1 F15476.087
G1 X130.05 Y123.95 E-.61876
G1 X129.787 Y124.213 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X137.34 Y123.117 Z2.2 F30000
G1 X144.95 Y122.013 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8463
G1 X146.477 Y121.45 E.05401
G1 X146.916 Y121.889 E.0206
G3 X147.739 Y121.613 I1.698 J3.701 E.02883
G1 X148.389 Y120.963 E.0305
G3 X153.256 Y123.772 I.324 J5.06 E.19757
G1 X152.836 Y124.191 E.01968
G3 X152.841 Y127.813 I-4.244 J1.816 E.12345
G1 X153.252 Y128.225 E.0193
G3 X148.389 Y131.037 I-4.579 J-2.307 E.19724
G1 X147.734 Y130.382 E.03071
G3 X146.912 Y130.116 I.924 J-4.256 E.02871
G1 X146.476 Y130.552 E.02045
G1 X144.948 Y129.988 E.05401
; WIPE_START
G1 F15476.087
G1 X146.476 Y130.552 E-.61876
G1 X146.739 Y130.289 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X139.107 Y130.225 Z2.2 F30000
G1 X111.052 Y129.988 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8463
G1 X109.524 Y130.552 E.05401
G1 X109.084 Y130.111 E.02066
G3 X108.261 Y130.387 I-1.697 J-3.699 E.02883
G1 X107.611 Y131.037 E.0305
G3 X102.744 Y128.228 I-.324 J-5.06 E.19757
G1 X103.16 Y127.812 E.01952
G3 X103.16 Y124.188 I4.332 J-1.812 E.12343
G1 X102.745 Y123.77 E.01953
G3 X107.611 Y120.963 I4.542 J2.251 E.19753
G1 X108.266 Y121.618 E.03071
G3 X109.088 Y121.884 I-.924 J4.258 E.02871
G1 X109.524 Y121.448 E.02045
G1 X111.052 Y122.012 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15476.087
G1 X109.524 Y121.448 E-.61876
G1 X109.261 Y121.711 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/15
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X148.02 Y121.909
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10433
G1 X148.367 Y121.863 E.01162
G3 X148.902 Y121.851 I.367 J4.574 E.01774
G3 X147.961 Y121.919 I-.177 J4.148 E.83398
G1 X147.995 Y122.314 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10433
M204 S5000
G1 X148.072 Y122.297 E.00244
G3 X148.399 Y122.254 I.653 J3.703 E.01013
G3 X148.888 Y122.243 I.336 J4.182 E.01503
G3 X147.752 Y122.368 I-.163 J3.756 E.6906
G1 X147.936 Y122.327 E.0058
; WIPE_START
G1 F12000
M204 S10000
G1 X148.072 Y122.297 E-.053
G1 X148.399 Y122.254 E-.12521
M73 P86 R1
G1 X148.888 Y122.243 E-.18575
G1 X149.216 Y122.272 E-.12523
G1 X149.539 Y122.329 E-.12461
G1 X149.856 Y122.414 E-.12465
G1 X149.909 Y122.433 E-.02155
; WIPE_END
G1 E-.04 F1800
G1 X142.4 Y123.801 Z2.4 F30000
G1 X107.621 Y130.137 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10433
G1 X107.275 Y130.151 E.01148
G3 X106.917 Y121.863 I0 J-4.152 E.42079
G3 X107.452 Y121.851 I.367 J4.573 E.01774
G3 X107.68 Y130.131 I-.177 J4.148 E.41334
G1 X107.521 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10433
M204 S5000
G1 X107.275 Y129.759 E.00756
G3 X106.949 Y122.254 I0 J-3.76 E.35289
G3 X107.438 Y122.243 I.336 J4.181 E.01503
G3 X107.602 Y129.745 I-.163 J3.756 E.34785
G1 X107.581 Y129.746 E.00067
; WIPE_START
G1 F12000
M204 S10000
G1 X107.275 Y129.759 E-.11633
G1 X106.875 Y129.738 E-.15212
G1 X106.461 Y129.671 E-.15936
G1 X106.144 Y129.586 E-.12465
G1 X105.836 Y129.474 E-.12471
G1 X105.641 Y129.377 E-.08283
; WIPE_END
G1 E-.04 F1800
G1 X113.165 Y128.097 Z2.4 F30000
G1 X139.584 Y123.602 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10433
G1 X139.636 Y123.602 E.00175
G1 X147.009 Y120.882 E.26068
G3 X148.705 Y120.603 I1.774 J5.49 E.05722
G3 X146.775 Y131.033 I.016 J5.397 E.62898
G1 X139.636 Y128.398 E.25242
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X109.225 Y120.966 I-1.946 J-5.034 E.69447
G1 X116.364 Y123.602 E.25243
G1 X139.524 Y123.602 E.76826
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10433
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.706 Y120.211 I1.904 J5.887 E.05698
G3 X146.642 Y131.402 I.015 J5.789 E.62459
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X109.359 Y120.598 I-2.079 J-5.402 E.6895
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70896
; WIPE_START
G1 F12000
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.871 Y123.867 Z2.4 F30000
G1 X131.301 Y124.327 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10433
G1 X129.672 Y124.327 E.05401
G1 X126.327 Y127.672 E.15692
G1 X129.672 Y127.672 E.11096
G1 X126.327 Y124.327 E.15692
G1 X121.997 Y124.327 E.14366
G1 X118.652 Y127.672 E.15692
G1 X121.997 Y127.672 E.11096
G1 X118.652 Y124.327 E.15692
G1 X116.234 Y124.327 E.0802
G1 X114.836 Y123.812 E.04941
G1 X112.118 Y126.53 E.12751
G2 X112.114 Y125.466 I-4.362 J-.516 E.03536
G1 X114.837 Y128.188 E.1277
G1 X113.309 Y128.752 E.05401
G1 X108.528 Y130.86 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10433
G1 X109.107 Y130.689 E.01674
G1 X116.327 Y128.035 E.21311
G1 X139.673 Y128.035 E.64681
G1 X144.867 Y129.942 E.15329
G1 X145.541 Y129.858 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10433
G1 X145.286 Y130.113 E.01194
G1 X146.476 Y130.552 E.04207
G1 X146.912 Y130.116 E.02045
G2 X147.734 Y130.382 I1.746 J-3.991 E.02871
G1 X148.389 Y131.037 E.03074
G2 X153.252 Y128.225 I.283 J-5.121 E.19722
G1 X152.841 Y127.813 E.0193
G2 X152.841 Y124.187 I-4.286 J-1.813 E.12356
G1 X153.249 Y123.779 E.01913
G2 X148.389 Y120.963 I-4.608 J2.35 E.19695
G1 X147.739 Y121.613 E.0305
G3 X149.357 Y121.545 I1.01 J4.788 E.05395
; WIPE_START
G1 F15476.087
G1 X148.341 Y121.515 E-.3862
G1 X147.739 Y121.613 E-.23164
G1 X148.004 Y121.348 E-.14215
; WIPE_END
G1 E-.04 F1800
G1 X145.807 Y128.658 Z2.4 F30000
G1 X145.623 Y129.269 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383128
G1 F10433
G1 X145.034 Y128.598 E.02475
G3 X144.526 Y127.635 I3.51 J-2.465 E.03028
G1 X144.286 Y126.8 E.02407
G1 X144.216 Y126.097 E.0196
G1 X144.254 Y125.443 E.01817
G1 X144.399 Y124.718 E.0205
G1 X144.599 Y124.189 E.01566
G1 X145.025 Y123.435 E.02402
G3 X146.258 Y122.234 I3.744 J2.61 E.04801
G1 X146.339 Y122.184 E.00262
G1 X132.375 Y127.672 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10433
G1 X134.003 Y127.672 E.05401
G1 X137.348 Y124.327 E.15692
G1 X134.003 Y124.327 E.11096
G1 X137.348 Y127.672 E.15692
G1 X139.766 Y127.672 E.0802
G1 X141.163 Y128.188 E.04941
G1 X143.882 Y125.47 E.12751
G2 X143.879 Y126.527 I4.812 J.541 E.03511
G1 X141.164 Y123.812 E.12736
G1 X142.691 Y123.248 E.05401
; WIPE_START
G1 F15476.087
G1 X141.164 Y123.812 E-.61876
G1 X141.427 Y124.075 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X133.812 Y123.558 Z2.4 F30000
G1 X111.005 Y122.01 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10433
G1 X116.327 Y123.965 E.1571
G1 X139.673 Y123.965 E.6468
G1 X146.805 Y121.344 E.21053
; WIPE_START
G1 F12000
G1 X144.928 Y122.034 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.295 Y122.062 Z2.4 F30000
G1 X110.368 Y122.162 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10433
G1 X110.641 Y121.861 E.01349
G1 X109.524 Y121.448 E.03951
G1 X109.09 Y121.883 E.02038
G2 X108.256 Y121.608 I-2.475 J6.104 E.02915
G1 X107.611 Y120.963 E.03025
G2 X102.748 Y123.775 I-.283 J5.121 E.19722
G1 X103.159 Y124.187 E.0193
G2 X103.159 Y127.813 I4.285 J1.813 E.12356
G1 X102.745 Y128.23 E.01949
G2 X107.612 Y131.036 I4.584 J-2.326 E.19716
G1 X108.267 Y130.381 E.03073
G3 X106.651 Y130.451 I-.991 J-4.202 E.05397
; WIPE_START
G1 F15476.087
G1 X107.273 Y130.501 E-.23721
G1 X108.267 Y130.381 E-.38028
G1 X108.001 Y130.647 E-.1425
; WIPE_END
G1 E-.04 F1800
G1 X110.141 Y123.32 Z2.4 F30000
G1 X110.328 Y122.683 Z2.4
G1 Z2
M73 P87 R1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10433
G3 X111.54 Y127.443 I-3.054 J3.313 E.14395
G3 X110.255 Y129.379 I-4.345 J-1.49 E.06508
G3 X108.968 Y130.172 I-3.151 J-3.676 E.04204
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X109.369 Y129.995 E-.16626
G1 X109.862 Y129.691 E-.22027
G1 X110.255 Y129.379 E-.19058
G1 X110.593 Y129.037 E-.18289
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/15
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.811 Y121.95
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.827 Y121.948 E.00054
G3 X148.603 Y121.85 I.906 J4.051 E.02599
G3 X149.087 Y121.864 I.12 J4.483 E.01606
G3 X147.477 Y122.043 I-.354 J4.136 E.8112
G1 X147.753 Y121.966 E.00949
G1 X147.97 Y122.319 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X148.234 Y122.274 E.00825
G3 X148.618 Y122.242 I.498 J3.726 E.01183
G3 X149.053 Y122.254 I.106 J4.047 E.01337
G3 X147.911 Y122.331 I-.321 J3.746 E.69051
; WIPE_START
M204 S10000
G1 X148.234 Y122.274 E-.12476
G1 X148.618 Y122.242 E-.14624
G1 X149.053 Y122.254 E-.16522
G1 X149.378 Y122.297 E-.12467
G1 X149.856 Y122.414 E-.18687
G1 X149.886 Y122.425 E-.01223
; WIPE_END
G1 E-.04 F1800
G1 X142.377 Y123.792 Z2.6 F30000
G1 X107.472 Y130.147 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.456 Y130.148 E.00053
G3 X107.153 Y121.85 I-.174 J-4.148 E.4341
G3 X107.637 Y121.864 I.12 J4.483 E.01606
G3 X107.817 Y130.117 I-.354 J4.136 E.40309
G1 X107.532 Y130.142 E.00949
G1 X107.526 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X107.439 Y129.756 E.00268
G3 X107.168 Y122.242 I-.157 J-3.756 E.36422
G3 X107.603 Y122.254 I.106 J4.047 E.01337
G3 X107.766 Y129.728 I-.321 J3.746 E.33813
G1 X107.586 Y129.744 E.00555
; WIPE_START
M204 S10000
G1 X107.439 Y129.756 E-.05596
G1 X107.111 Y129.756 E-.12476
G1 X106.622 Y129.703 E-.18682
G1 X106.302 Y129.632 E-.12469
G1 X105.989 Y129.533 E-.12464
G1 X105.686 Y129.408 E-.12463
G1 X105.643 Y129.385 E-.0185
; WIPE_END
G1 E-.04 F1800
G1 X113.167 Y128.103 Z2.6 F30000
G1 X139.584 Y123.602 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.00174
G1 X147.009 Y120.882 E.26068
G3 X148.687 Y120.603 I1.777 J5.507 E.05664
G3 X146.775 Y131.033 I.037 J5.397 E.62983
G1 X139.636 Y128.398 E.25242
G1 X116.364 Y128.398 E.77201
G1 X109.224 Y131.034 E.25245
G3 X109.225 Y120.967 I-1.945 J-5.034 E.69445
G1 X116.364 Y123.602 E.25242
G1 X139.524 Y123.602 E.76827
G1 X139.566 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X139.566 Y123.21 E.00001
G1 X146.883 Y120.511 E.23962
G3 X148.688 Y120.211 I1.907 J5.902 E.05645
G3 X146.642 Y131.402 I.036 J5.789 E.62541
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X109.359 Y120.598 I-2.079 J-5.402 E.6895
G1 X116.434 Y123.21 E.23173
G1 X139.506 Y123.21 E.70895
; WIPE_START
M204 S10000
G1 X139.566 Y123.21 E-.02292
G1 X141.386 Y122.539 E-.73708
; WIPE_END
G1 E-.04 F1800
G1 X144.454 Y129.527 Z2.6 F30000
G1 X144.701 Y130.089 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40341
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X145.565 Y129.225 E.06365
G3 X145.252 Y128.896 I1.348 J-1.593 E.02367
G1 X144.39 Y129.759 E.06353
G1 X143.922 Y129.586 E.026
G1 X144.979 Y128.529 E.07787
G3 X144.739 Y128.127 I2.173 J-1.572 E.02438
G1 X143.453 Y129.413 E.09469
G1 X142.985 Y129.24 E.026
G1 X144.535 Y127.69 E.11415
G3 X144.376 Y127.208 I2.116 J-.964 E.0265
G1 X142.517 Y129.067 E.13694
G1 X142.048 Y128.894 E.026
G1 X144.258 Y126.685 E.16274
G3 X144.207 Y126.094 I5.019 J-.731 E.03087
G1 X141.58 Y128.721 E.19347
G1 X141.112 Y128.548 E.026
G1 X144.244 Y125.416 E.23071
G1 X144.251 Y125.345 E.00372
G3 X144.434 Y124.585 I3.737 J.497 E.04076
G1 X140.643 Y128.376 E.27916
G1 X140.175 Y128.203 E.026
G1 X146.427 Y121.951 E.46045
G1 X146.76 Y121.368 E.03492
G1 X146.139 Y121.597 E.03444
G1 X139.707 Y128.03 E.47374
G1 X139.067 Y128.028 E.03331
G1 X145.123 Y121.972 E.44602
G1 X144.107 Y122.347 E.0564
G1 X138.426 Y128.028 E.41842
G1 X137.785 Y128.028 E.03339
G1 X143.091 Y122.722 E.39081
G1 X142.075 Y123.096 E.0564
G1 X137.143 Y128.028 E.36321
G1 X136.502 Y128.028 E.03339
G1 X141.059 Y123.471 E.33561
G1 X140.043 Y123.846 E.0564
G1 X135.861 Y128.028 E.308
G1 X135.22 Y128.028 E.03339
G1 X139.276 Y123.972 E.29875
G1 X138.635 Y123.972 E.03339
G1 X134.579 Y128.028 E.29875
G1 X133.937 Y128.028 E.03339
G1 X137.994 Y123.972 E.29875
G1 X137.353 Y123.972 E.03339
G1 X133.296 Y128.028 E.29874
G1 X132.655 Y128.028 E.03339
G1 X136.711 Y123.972 E.29874
G1 X136.07 Y123.972 E.03339
G1 X132.014 Y128.028 E.29874
G1 X131.372 Y128.028 E.03339
G1 X135.429 Y123.972 E.29875
G1 X134.788 Y123.972 E.03339
G1 X130.731 Y128.028 E.29875
G1 X130.09 Y128.028 E.03339
G1 X134.146 Y123.972 E.29875
G1 X133.505 Y123.972 E.03339
G1 X129.449 Y128.028 E.29875
G1 X128.808 Y128.028 E.03339
G1 X132.864 Y123.972 E.29874
G1 X132.223 Y123.972 E.03339
G1 X128.166 Y128.028 E.29874
G1 X127.525 Y128.028 E.03339
G1 X131.582 Y123.972 E.29874
G1 X130.94 Y123.972 E.03339
G1 X126.884 Y128.028 E.29875
G1 X126.243 Y128.028 E.03339
G1 X130.299 Y123.972 E.29875
G1 X129.658 Y123.972 E.03339
G1 X125.602 Y128.028 E.29875
G1 X124.96 Y128.028 E.03339
G1 X129.017 Y123.972 E.29875
G1 X128.375 Y123.972 E.03339
G1 X124.319 Y128.028 E.29874
G1 X123.678 Y128.028 E.03339
G1 X127.734 Y123.972 E.29875
G1 X127.093 Y123.972 E.03339
G1 X123.037 Y128.028 E.29875
G1 X122.395 Y128.028 E.03339
G1 X126.452 Y123.972 E.29875
G1 X125.811 Y123.972 E.03339
G1 X121.754 Y128.028 E.29874
G1 X121.113 Y128.028 E.03339
G1 X125.169 Y123.972 E.29874
G1 X124.528 Y123.972 E.03339
G1 X120.472 Y128.028 E.29874
G1 X119.831 Y128.028 E.03339
G1 X123.887 Y123.972 E.29874
G1 X123.246 Y123.972 E.03339
G1 X119.189 Y128.028 E.29874
G1 X118.548 Y128.028 E.03339
G1 X122.605 Y123.972 E.29874
G1 X121.963 Y123.972 E.03339
G1 X117.907 Y128.028 E.29874
G1 X117.266 Y128.028 E.03339
G1 X121.322 Y123.972 E.29874
G1 X120.681 Y123.972 E.03339
G1 X116.624 Y128.028 E.29874
G1 X116.297 Y128.028 E.01703
G1 X115.799 Y128.212 E.02765
G1 X120.04 Y123.972 E.31229
G1 X119.398 Y123.972 E.03339
G1 X114.783 Y128.587 E.33993
G1 X113.766 Y128.963 E.05643
G1 X118.757 Y123.972 E.36757
G1 X118.116 Y123.972 E.03339
M73 P88 R1
G1 X112.75 Y129.338 E.39521
G1 X111.733 Y129.713 E.05643
G1 X117.475 Y123.972 E.42285
G1 X116.834 Y123.972 E.03339
G1 X110.717 Y130.089 E.45049
G1 X109.7 Y130.464 E.05643
G1 X116.221 Y123.943 E.48022
G1 X115.752 Y123.771 E.026
G1 X108.341 Y131.181 E.5458
G1 X111.284 Y127.597 F30000
G1 F3000
G1 X115.284 Y123.598 E.29456
G1 X114.816 Y123.425 E.026
G1 X111.766 Y126.474 E.22458
G2 X111.793 Y125.806 I-3.44 J-.472 E.03486
G1 X114.347 Y123.252 E.18813
G1 X113.879 Y123.079 E.026
G1 X111.73 Y125.228 E.15825
G2 X111.606 Y124.711 I-6.81 J1.369 E.02768
G1 X113.411 Y122.906 E.13293
G1 X112.942 Y122.733 E.026
G1 X111.436 Y124.24 E.11095
G2 X111.227 Y123.807 I-2.576 J.979 E.02503
G1 X112.474 Y122.56 E.09185
G1 X112.006 Y122.387 E.026
G1 X110.978 Y123.415 E.0757
G2 X110.699 Y123.053 I-1.852 J1.14 E.02385
G1 X111.538 Y122.214 E.06178
G1 X111.069 Y122.041 E.026
G1 X110.244 Y122.866 E.06075
G1 X108.034 Y121.079 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.461045
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X107.172 Y121.019 E.02943
G1 X106.307 Y121.114 E.02964
G2 X103.627 Y122.611 I1.027 J4.986 E.10626
G1 X103.141 Y123.222 E.0266
G1 X102.784 Y123.859 E.02487
G1 X102.495 Y124.595 E.02695
G1 X102.351 Y125.236 E.02239
G2 X102.8 Y128.182 I5.22 J.711 E.10293
G1 X103.249 Y128.925 E.02959
G1 X103.567 Y129.321 E.01729
G1 X104.308 Y130.002 E.0343
G1 X105.047 Y130.455 E.02953
G1 X105.853 Y130.773 E.02953
G1 X106.521 Y130.916 E.02327
G1 X107.441 Y130.973 E.03141
G2 X108.084 Y130.908 I-.441 J-7.62 E.02202
G1 X108.369 Y130.414 E.01943
G3 X106.108 Y130.411 I-1.123 J-4.463 E.07784
G1 X105.363 Y130.142 E.02696
G1 X104.62 Y129.71 E.02929
G1 X103.963 Y129.135 E.02976
G3 X103.316 Y128.265 I6.445 J-5.46 E.03697
G1 X102.994 Y127.571 E.02607
G3 X102.718 Y126.179 I5.369 J-1.786 E.04846
G1 X102.757 Y125.358 E.028
G1 X102.863 Y124.832 E.01829
G1 X103.104 Y124.156 E.02445
G1 X103.418 Y123.562 E.02291
G1 X103.901 Y122.929 E.0271
G1 X104.64 Y122.275 E.03361
G1 X105.336 Y121.87 E.02744
G1 X106.266 Y121.55 E.0335
G1 X107.122 Y121.44 E.02943
G1 X107.658 Y121.455 E.01828
G1 X108.439 Y121.588 E.02696
G1 X108.942 Y121.762 E.01815
; LINE_WIDTH: 0.491805
G1 X109.728 Y122.119 E.03157
; LINE_WIDTH: 0.537284
G1 X110.077 Y122.357 E.01703
G1 X110.509 Y121.926 E.0246
G1 X109.984 Y121.718 E.02274
; LINE_WIDTH: 0.49634
G1 X109.398 Y121.476 E.02341
; LINE_WIDTH: 0.467498
G1 X108.669 Y121.217 E.02678
G1 X108.092 Y121.092 E.02041
; WIPE_START
G1 X108.669 Y121.217 E-.32876
G1 X109.398 Y121.476 E-.43124
; WIPE_END
G1 E-.04 F1800
G1 X117.022 Y121.838 Z2.6 F30000
G1 X153.058 Y123.549 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.462668
G1 F12000
G1 X152.757 Y123.072 E.01927
G1 X152.188 Y122.42 E.02964
G1 X151.512 Y121.872 E.02974
G2 X149.603 Y121.108 I-2.787 J4.196 E.07085
G1 X148.702 Y121.019 E.03097
G1 X147.999 Y121.075 E.02411
G2 X147.345 Y121.221 I6.872 J32.285 E.02291
G1 X147.025 Y121.782 E.02211
G3 X149.535 Y121.512 I1.738 J4.353 E.08742
G1 X150.27 Y121.709 E.02604
M73 P89 R1
G3 X151.192 Y122.161 I-4.16 J9.656 E.03514
G1 X151.794 Y122.624 E.02598
G1 X152.373 Y123.26 E.0294
G3 X152.895 Y124.171 I-3.011 J2.331 E.03606
G1 X153.149 Y124.924 E.02717
G1 X153.221 Y125.236 E.01094
G1 X153.282 Y126.179 E.03233
G3 X152.859 Y127.925 I-5.729 J-.46 E.06171
G3 X151.575 Y129.555 I-4.08 J-1.896 E.0716
G1 X151.018 Y129.944 E.02324
G1 X150.302 Y130.281 E.02707
G1 X149.532 Y130.488 E.02727
G3 X148.429 Y130.541 I-.736 J-3.835 E.03792
G1 X148.043 Y130.512 E.01323
G3 X146.451 Y129.976 I1.165 J-6.092 E.05765
; LINE_WIDTH: 0.510605
G1 X146.162 Y129.79 E.0131
; LINE_WIDTH: 0.554342
G1 X145.873 Y129.603 E.01433
G1 X145.432 Y130.045 E.02604
; LINE_WIDTH: 0.545625
G1 X145.814 Y130.202 E.01694
; LINE_WIDTH: 0.516455
G1 X146.197 Y130.358 E.01596
; LINE_WIDTH: 0.463474
G2 X147.947 Y130.921 I3.326 J-7.353 E.06314
G2 X151.196 Y130.322 I.731 J-5.149 E.11521
G1 X151.668 Y130.008 E.01942
G1 X152.323 Y129.446 E.0296
G2 X153.606 Y126.977 I-3.872 J-3.58 E.0965
G2 X153.628 Y125.192 I-5.422 J-.959 E.06145
G2 X153.4 Y124.313 I-3.463 J.429 E.03119
G1 X153.082 Y123.604 E.02664
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12000
G1 X153.4 Y124.313 E-.29538
G1 X153.557 Y124.801 E-.1946
G1 X153.628 Y125.192 E-.151
G1 X153.667 Y125.502 E-.11902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/15
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.842 Y121.943
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.183 Y121.885 E.01148
G3 X148.59 Y121.851 I.551 J4.113 E.01355
G3 X148.906 Y121.852 I.146 J3.621 E.01049
G3 X147.784 Y121.958 I-.172 J4.146 E.82746
G1 X147.947 Y122.323 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X148.234 Y122.274 E.00894
G3 X148.605 Y122.243 I.5 J3.725 E.01144
G3 X148.889 Y122.244 I.131 J3.243 E.00872
G3 X147.889 Y122.337 I-.155 J3.755 E.69459
; WIPE_START
M204 S10000
G1 X148.234 Y122.274 E-.13337
G1 X148.605 Y122.243 E-.14145
G1 X148.889 Y122.244 E-.10785
G1 X149.378 Y122.297 E-.18684
G1 X149.698 Y122.368 E-.12471
G1 X149.863 Y122.42 E-.06578
; WIPE_END
G1 E-.04 F1800
G1 X142.355 Y123.792 Z2.8 F30000
G1 X107.621 Y130.137 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.275 Y130.148 E.01148
G3 X107.14 Y121.851 I.01 J-4.15 E.42738
G3 X107.456 Y121.852 I.146 J3.621 E.01049
G3 X107.68 Y130.129 I-.172 J4.146 E.41365
G1 X107.534 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X107.275 Y129.756 E.00795
G3 X107.155 Y122.243 I.009 J-3.758 E.35853
G3 X107.439 Y122.244 I.131 J3.243 E.00872
G3 X107.602 Y129.743 I-.155 J3.755 E.34822
G1 X107.593 Y129.744 E.00028
; WIPE_START
M204 S10000
G1 X107.275 Y129.756 E-.12107
G1 X106.783 Y129.728 E-.18719
G1 X106.461 Y129.671 E-.12433
G1 X106.144 Y129.586 E-.12459
G1 X105.795 Y129.456 E-.14148
G1 X105.651 Y129.384 E-.06134
; WIPE_END
G1 E-.04 F1800
G1 X113.175 Y128.102 Z2.8 F30000
G1 X139.584 Y123.602 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.00174
G1 X147.009 Y120.882 E.26067
G3 X146.776 Y131.034 I1.712 J5.118 E.68621
G1 X139.636 Y128.398 E.25244
G1 X116.364 Y128.398 E.77201
G1 X109.224 Y131.034 E.25246
G3 X107.613 Y120.613 I-1.945 J-5.034 E.63949
G3 X108.991 Y120.882 I-.447 J5.947 E.0467
G1 X116.364 Y123.602 E.26067
G1 X139.524 Y123.602 E.76827
G1 X139.565 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X139.566 Y123.21 E.00003
G1 X146.883 Y120.511 E.23962
G3 X146.642 Y131.402 I1.838 J5.489 E.68162
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X107.637 Y120.221 I-2.079 J-5.403 E.63516
G3 X109.117 Y120.511 I-.481 J6.385 E.04645
G1 X116.434 Y123.21 E.23962
G1 X139.505 Y123.21 E.70893
; WIPE_START
M204 S10000
G1 X139.566 Y123.21 E-.02321
G1 X141.385 Y122.539 E-.73679
; WIPE_END
G1 E-.04 F1800
G1 X133.799 Y123.373 Z2.8 F30000
G1 X111.814 Y125.788 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X111.782 Y126.582 E.0244
G1 X111.668 Y127.162 E.01818
G1 X111.4 Y127.905 E.02427
G1 X111.004 Y128.597 E.0245
G1 X110.358 Y129.337 E.03019
; LINE_WIDTH: 0.43684
G1 X109.971 Y129.645 E.01585
; LINE_WIDTH: 0.462087
G1 X109.584 Y129.952 E.01687
G1 X108.926 Y130.251 E.02471
G1 X108.08 Y130.491 E.03004
G1 X107.49 Y130.555 E.02029
G1 X106.693 Y130.523 E.02725
G1 X105.731 Y130.293 E.03378
G1 X104.884 Y129.884 E.03212
G1 X104.417 Y129.545 E.0197
G1 X103.847 Y128.994 E.02709
G1 X103.363 Y128.348 E.02757
G1 X102.992 Y127.575 E.02927
G1 X102.763 Y126.665 E.03207
G1 X102.716 Y125.819 E.02894
G3 X103.133 Y124.087 I5.903 J.508 E.0611
G1 X103.42 Y123.563 E.0204
G1 X103.9 Y122.929 E.02716
G1 X104.64 Y122.275 E.03371
G1 X105.335 Y121.87 E.02749
G1 X106.265 Y121.55 E.0336
G1 X107.112 Y121.44 E.02914
G3 X108.728 Y121.684 I.069 J5.017 E.0561
G1 X109.224 Y121.867 E.01806
; LINE_WIDTH: 0.458765
G1 X109.567 Y122.083 E.01371
; LINE_WIDTH: 0.421164
G3 X110.747 Y123.068 I-2.547 J4.25 E.04756
G1 X111.202 Y123.714 E.02436
G1 X111.539 Y124.43 E.02441
G1 X111.755 Y125.245 E.02597
G1 X111.808 Y125.729 E.01499
G1 X115.05 Y126 F30000
; LINE_WIDTH: 0.52009
G1 F13202.842
G1 X114.117 Y125.656 E.03864
G1 X114.106 Y126.348 E.02692
G1 X114.993 Y126.021 E.03676
G1 X139.673 Y123.994 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y123.994 E.71732
G1 X110.175 Y121.737 E.20137
; LINE_WIDTH: 0.432915
G1 X109.791 Y121.609 E.01286
; LINE_WIDTH: 0.466297
G1 F14880.352
G3 X108.875 Y121.284 I4.331 J-13.644 E.03354
G2 X107.171 Y121.018 I-1.723 J5.449 E.05972
G1 X106.307 Y121.114 E.03
G2 X103.266 Y123.047 I1.023 J4.967 E.12711
G1 X102.814 Y123.784 E.02983
G1 X102.499 Y124.596 E.03005
G2 X102.353 Y126.765 I4.844 J1.416 E.0756
G1 X102.556 Y127.599 E.02962
G2 X103.906 Y129.655 I4.893 J-1.742 E.08565
G1 X104.562 Y130.174 E.02885
G1 X105.443 Y130.631 E.03425
G1 X106.274 Y130.876 E.0299
G1 X107.135 Y130.977 E.02988
G1 X108.003 Y130.928 E.02999
G1 X108.646 Y130.787 E.02273
G1 X109.722 Y130.393 E.03953
; LINE_WIDTH: 0.47549
G1 F14564.117
G1 X110.214 Y130.231 E.01826
; LINE_WIDTH: 0.420258
G1 F15000
G1 X110.706 Y130.069 E.01593
G1 X116.327 Y128.006 E.18412
G1 X139.673 Y128.006 E.71783
G1 X145.278 Y130.063 E.18358
; LINE_WIDTH: 0.43774
G1 X145.641 Y130.178 E.01226
; LINE_WIDTH: 0.465081
G1 F14923.215
G3 X146.911 Y130.641 I-3.274 J10.954 E.04653
G2 X147.911 Y130.913 I1.985 J-5.326 E.03569
G1 X148.829 Y130.98 E.03166
G1 X149.544 Y130.907 E.02474
G1 X150.38 Y130.691 E.02969
G1 X151.17 Y130.333 E.02984
G1 X151.887 Y129.843 E.02988
G1 X152.316 Y129.453 E.01995
G1 X152.856 Y128.776 E.02979
G1 X153.277 Y128.016 E.02989
G1 X153.507 Y127.397 E.02271
G1 X153.673 Y126.557 E.02949
G2 X153.677 Y125.477 I-5.082 J-.556 E.0372
G1 X153.51 Y124.625 E.02988
G1 X153.29 Y124.013 E.02237
G2 X152.338 Y122.576 I-5.82 J2.823 E.05947
G1 X151.69 Y121.996 E.02991
G2 X150.061 Y121.207 I-3.043 J4.206 E.06258
M73 P89 R0
G1 X149.296 Y121.052 E.02686
G1 X148.6 Y121.028 E.02395
M73 P90 R0
G1 X147.775 Y121.11 E.02854
G2 X146.682 Y121.455 I1.153 J5.549 E.0395
; LINE_WIDTH: 0.479858
G1 F14418.538
G1 X146.29 Y121.617 E.01509
; LINE_WIDTH: 0.514173
G1 F13368.629
G1 X145.899 Y121.779 E.01628
; LINE_WIDTH: 0.512774
G1 F13408.44
G1 X145.565 Y121.882 E.01337
; LINE_WIDTH: 0.47566
G1 F14558.394
G1 X145.231 Y121.985 E.01231
; LINE_WIDTH: 0.421097
G1 F15000
G1 X144.898 Y122.088 E.01076
G1 X139.732 Y123.984 E.16958
G1 X139.673 Y124.371 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y124.371 E.71732
G1 X116.131 Y124.336 E.00613
G1 X110.431 Y122.233 E.18666
G1 X111.019 Y122.807 E.02523
G1 X111.511 Y123.498 E.02605
G1 X111.881 Y124.271 E.02635
G1 X112.12 Y125.15 E.02798
G1 X112.189 Y125.749 E.01853
G1 X112.158 Y126.598 E.02612
G1 X112.038 Y127.236 E.01994
G1 X111.754 Y128.034 E.02602
G1 X111.33 Y128.786 E.02652
G1 X110.641 Y129.586 E.03245
G1 X110.4 Y129.78 E.00951
G1 X116.131 Y127.664 E.18774
G1 X116.327 Y127.629 E.00611
G1 X139.673 Y127.629 E.71733
G1 X139.869 Y127.664 E.00611
G1 X145.588 Y129.775 E.18733
G1 X145.372 Y129.601 E.00853
G1 X144.981 Y129.193 E.01737
G1 X144.489 Y128.502 E.02604
G1 X144.118 Y127.727 E.02643
G1 X143.857 Y126.703 E.03247
G1 X143.811 Y125.906 E.02451
G1 X143.924 Y124.932 E.03015
G1 X144.242 Y123.975 E.03099
G1 X144.668 Y123.217 E.02671
G1 X145.072 Y122.703 E.02008
G1 X145.595 Y122.233 E.0216
G1 X139.868 Y124.337 E.18748
G1 X139.732 Y124.361 E.00424
G1 X139.673 Y124.748 F30000
G1 F15000
G1 X116.327 Y124.748 E.71732
G1 X116 Y124.69 E.0102
G1 X111.693 Y123.101 E.14106
G1 X111.902 Y123.424 E.01181
G1 X112.223 Y124.112 E.02333
G1 X112.485 Y125.055 E.03007
G1 X112.564 Y125.709 E.02026
G1 X112.535 Y126.615 E.02784
G1 X112.408 Y127.31 E.02171
G1 X112.109 Y128.163 E.02778
G1 X111.701 Y128.898 E.02581
G1 X116.001 Y127.31 E.14084
G1 X116.327 Y127.252 E.01019
G1 X139.673 Y127.252 E.71733
G1 X139.999 Y127.31 E.01019
G1 X144.308 Y128.901 E.14113
G1 X144.098 Y128.576 E.01188
G1 X143.776 Y127.886 E.0234
G1 X143.491 Y126.792 E.03474
G1 X143.435 Y125.923 E.02677
G1 X143.55 Y124.88 E.03224
G1 X143.886 Y123.852 E.03323
G1 X144.293 Y123.113 E.0259
G1 X139.998 Y124.69 E.14059
G1 X139.732 Y124.738 E.0083
G1 X139.673 Y125.125 F30000
G1 F15000
G1 X116.327 Y125.125 E.71732
G1 X115.87 Y125.044 E.01428
G1 X112.492 Y123.797 E.11062
G1 X112.645 Y124.177 E.01257
G1 X112.849 Y124.959 E.02485
G1 X112.939 Y125.67 E.022
G1 X112.912 Y126.631 E.02956
G1 X112.777 Y127.383 E.02348
G1 X112.496 Y128.202 E.0266
G1 X115.87 Y126.956 E.11053
G1 X116.327 Y126.875 E.01426
G1 X139.673 Y126.875 E.71733
G1 X140.13 Y126.956 E.01427
G1 X143.509 Y128.204 E.11066
G1 X143.349 Y127.801 E.01332
G1 X143.124 Y126.882 E.02907
G1 X143.058 Y125.939 E.02903
G1 X143.066 Y125.629 E.00953
G1 X143.177 Y124.828 E.02484
G1 X143.503 Y123.805 E.03301
G1 X140.128 Y125.044 E.1105
G1 X139.732 Y125.115 E.01235
G1 X139.673 Y125.502 F30000
G1 F15000
G1 X116.327 Y125.502 E.71732
G3 X115.739 Y125.397 I0 J-1.697 E.01845
G1 X113.099 Y124.423 E.08646
G1 X113.26 Y125.115 E.02181
G1 X113.314 Y125.63 E.01592
G1 X113.288 Y126.648 E.03128
G1 X113.115 Y127.571 E.02887
G1 X115.74 Y126.602 E.08597
G3 X116.327 Y126.498 I.587 J1.592 E.01843
G1 X139.673 Y126.498 E.71733
G3 X140.261 Y126.603 I0 J1.697 E.01844
G1 X142.907 Y127.58 E.08667
G1 X142.758 Y126.971 E.01924
G1 X142.681 Y125.956 E.0313
G1 X142.692 Y125.577 E.01162
G1 X142.803 Y124.777 E.02484
G1 X142.888 Y124.432 E.01089
G1 X140.257 Y125.398 E.0861
G3 X139.732 Y125.497 I-.54 J-1.427 E.0165
G1 X139.673 Y125.845 F30000
; LINE_WIDTH: 0.35198
G1 F15000
G1 X116.327 Y125.845 E.58794
; LINE_WIDTH: 0.368983
G1 X116.139 Y125.845 E.005
; LINE_WIDTH: 0.419539
G1 X115.951 Y125.845 E.00577
G1 X115.609 Y125.751 E.01089
G1 X113.625 Y125.019 E.0649
G1 X113.689 Y125.591 E.01765
G1 X113.665 Y126.664 E.03296
G1 X113.628 Y126.979 E.00972
G2 X115.609 Y126.249 I-359.841 J-979.194 E.06481
G1 X115.951 Y126.155 E.01087
; LINE_WIDTH: 0.402988
G1 X116.139 Y126.155 E.00552
; LINE_WIDTH: 0.352116
G1 X139.673 Y126.155 E.59294
; LINE_WIDTH: 0.368983
G1 X139.86 Y126.155 E.00497
; LINE_WIDTH: 0.419544
G1 X140.047 Y126.155 E.00575
G1 X140.391 Y126.249 E.01094
G1 X142.381 Y126.983 E.06509
G1 X142.304 Y125.972 E.03113
G3 X142.389 Y125.017 I4.569 J-.075 E.02947
G1 X140.387 Y125.752 E.06544
G1 X140.047 Y125.845 E.01083
; LINE_WIDTH: 0.402988
G1 X139.89 Y125.845 E.00462
; LINE_WIDTH: 0.368983
G1 X139.733 Y125.845 E.00418
G1 X140.95 Y126 F30000
; LINE_WIDTH: 0.51948
G1 F13219.742
G1 X141.894 Y126.349 E.03905
G1 X141.887 Y125.656 E.02689
G1 X141.007 Y125.98 E.03643
G1 X144.188 Y125.89 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X144.297 Y124.983 E.02806
G1 X144.599 Y124.098 E.02874
G1 X144.995 Y123.405 E.02451
G1 X145.366 Y122.939 E.01832
; LINE_WIDTH: 0.441008
G1 X145.72 Y122.599 E.01594
; LINE_WIDTH: 0.468323
G1 F14809.502
G1 X146.075 Y122.258 E.01703
G1 X146.783 Y121.867 E.02806
G3 X147.828 Y121.529 I2.891 J7.154 E.0381
G3 X149.108 Y121.454 I.927 J4.856 E.04457
G1 X149.831 Y121.575 E.0254
G1 X150.592 Y121.837 E.0279
G1 X151.369 Y122.281 E.03104
; LINE_WIDTH: 0.460926
G1 F15000
G1 X151.795 Y122.628 E.01871
G1 X152.363 Y123.25 E.02868
G3 X153.251 Y126.493 I-3.724 J2.763 E.1172
G3 X153.017 Y127.547 I-3.794 J-.288 E.03687
G1 X152.682 Y128.267 E.02705
G1 X152.102 Y129.067 E.03367
G1 X151.698 Y129.462 E.01926
G1 X151.087 Y129.901 E.02561
G1 X150.375 Y130.251 E.02705
G1 X149.612 Y130.473 E.02704
G1 X148.94 Y130.558 E.02308
G1 X148.143 Y130.524 E.02718
G3 X147.078 Y130.252 I1.254 J-7.133 E.03745
; LINE_WIDTH: 0.478426
G1 F14465.942
G1 X146.281 Y129.884 E.03118
G1 X145.666 Y129.36 E.02869
; LINE_WIDTH: 0.41999
G1 F15000
G1 X145.253 Y128.932 E.01825
G1 X144.798 Y128.286 E.02428
G1 X144.46 Y127.567 E.02441
G1 X144.223 Y126.613 E.03021
G1 X144.191 Y125.95 E.02041
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X144.223 Y126.613 E-.25242
G1 X144.46 Y127.567 E-.37356
G1 X144.61 Y127.886 E-.13403
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/15
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.811 Y121.95
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.827 Y121.948 E.00053
G3 X148.577 Y121.851 I.905 J4.05 E.02513
G3 X148.906 Y121.852 I.156 J3.764 E.01093
G3 X147.477 Y122.042 I-.174 J4.146 E.8168
G1 X147.753 Y121.966 E.0095
G1 X147.927 Y122.326 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X148.234 Y122.273 E.00959
G3 X148.593 Y122.243 I.498 J3.725 E.01106
G3 X148.889 Y122.244 I.14 J3.385 E.00911
G3 X147.868 Y122.341 I-.157 J3.754 E.69386
; WIPE_START
M204 S10000
G1 X148.234 Y122.273 E-.14139
G1 X148.593 Y122.243 E-.13667
G1 X148.889 Y122.244 E-.11265
G1 X149.378 Y122.297 E-.18681
G1 X149.698 Y122.368 E-.12472
G1 X149.843 Y122.414 E-.05776
; WIPE_END
G1 E-.04 F1800
G1 X142.335 Y123.787 Z3 F30000
G1 X107.621 Y130.137 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.273 Y130.147 E.01154
G3 X107.127 Y121.851 I.009 J-4.15 E.42697
G3 X107.456 Y121.852 I.156 J3.765 E.01093
G3 X107.68 Y130.128 I-.174 J4.146 E.41346
G1 X107.539 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X107.274 Y129.755 E.00814
G3 X107.143 Y122.243 I.008 J-3.758 E.35822
G3 X107.439 Y122.244 I.14 J3.385 E.00911
G3 X107.602 Y129.742 I-.157 J3.754 E.34805
G1 X107.599 Y129.742 E.00011
; WIPE_START
M204 S10000
G1 X107.274 Y129.755 E-.12338
G1 X106.784 Y129.728 E-.18651
G1 X106.461 Y129.671 E-.12463
G1 X106.144 Y129.586 E-.12463
G1 X105.807 Y129.461 E-.13672
G1 X105.656 Y129.386 E-.06412
; WIPE_END
G1 E-.04 F1800
G1 X113.18 Y128.103 Z3 F30000
G1 X139.584 Y123.602 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.00173
G1 X147.009 Y120.882 E.26068
G3 X146.775 Y131.034 I1.712 J5.118 E.68622
G1 X139.636 Y128.398 E.25243
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.034 E.25243
G3 X107.613 Y120.613 I-1.946 J-5.034 E.63952
G3 X108.991 Y120.882 I-.467 J6.048 E.0467
G1 X116.364 Y123.602 E.26067
G1 X139.524 Y123.602 E.76828
G1 X139.568 Y123.209 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X146.883 Y120.511 E.23957
G3 X146.642 Y131.402 I1.838 J5.489 E.68161
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
G3 X107.637 Y120.221 I-2.079 J-5.403 E.63516
G3 X109.117 Y120.511 I-.501 J6.489 E.04645
G1 X116.434 Y123.21 E.23962
G1 X139.508 Y123.21 E.70901
; WIPE_START
M204 S10000
G1 X141.386 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.8 Y123.361 Z3 F30000
G1 X111.814 Y125.789 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X111.753 Y126.769 E.03015
G1 X111.549 Y127.543 E.0246
G1 X111.118 Y128.424 E.03014
G1 X110.635 Y129.059 E.02453
G1 X110.207 Y129.472 E.01825
; LINE_WIDTH: 0.437315
G1 X109.894 Y129.713 E.01271
; LINE_WIDTH: 0.460584
G1 X109.581 Y129.955 E.01346
G1 X108.927 Y130.251 E.02444
G1 X108.081 Y130.491 E.02993
G3 X106.497 Y130.496 I-.805 J-5.041 E.05411
G1 X105.788 Y130.312 E.02493
G1 X105.182 Y130.054 E.02242
G1 X104.512 Y129.63 E.02698
G1 X103.898 Y129.068 E.02833
G1 X103.545 Y128.63 E.01916
G1 X103.148 Y127.944 E.02696
G3 X102.718 Y126.221 I5.437 J-2.27 E.06068
G1 X102.754 Y125.386 E.02845
G1 X102.863 Y124.833 E.01916
G1 X103.133 Y124.088 E.02696
G1 X103.529 Y123.396 E.02714
G3 X104.746 Y122.218 I3.79 J2.697 E.05797
G1 X105.011 Y122.041 E.01086
G1 X105.732 Y121.705 E.02708
G1 X106.273 Y121.548 E.01916
G1 X107.095 Y121.441 E.02822
G1 X108.046 Y121.503 E.03243
G1 X108.748 Y121.684 E.02467
; LINE_WIDTH: 0.478722
G1 F14456.105
G1 X109.719 Y122.116 E.03776
G1 X110.335 Y122.641 E.02871
; LINE_WIDTH: 0.41999
G1 F15000
G1 X110.747 Y123.068 E.01824
G1 X111.202 Y123.714 E.02428
G1 X111.539 Y124.43 E.02434
G1 X111.748 Y125.199 E.02447
G1 X111.808 Y125.73 E.01641
G1 X115.049 Y126 F30000
; LINE_WIDTH: 0.52023
G1 F13198.969
G1 X114.116 Y125.656 E.03871
G1 X114.098 Y126.351 E.02707
G1 X114.993 Y126.021 E.03712
G1 X139.673 Y123.994 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y123.994 E.71732
G1 X110.722 Y121.939 E.18345
; LINE_WIDTH: 0.437588
G1 X110.358 Y121.823 E.01226
; LINE_WIDTH: 0.465384
G1 F14912.538
G3 X109.027 Y121.336 I3.4 J-11.347 E.04882
G1 X108.245 Y121.113 E.028
G2 X103.264 Y123.044 I-.945 J4.953 E.1938
G1 X102.814 Y123.784 E.02984
G1 X102.497 Y124.593 E.02991
G1 X102.353 Y125.227 E.02239
M73 P91 R0
G1 X102.295 Y126.09 E.02978
G1 X102.389 Y126.954 E.02991
G2 X103.122 Y128.75 I5.303 J-1.116 E.06713
G1 X103.514 Y129.268 E.02238
G1 X104.137 Y129.868 E.02977
G1 X104.855 Y130.353 E.02984
G1 X105.53 Y130.66 E.02553
G1 X106.278 Y130.88 E.02682
G1 X106.98 Y130.966 E.02434
G2 X108.646 Y130.787 I.253 J-5.507 E.05791
G1 X109.722 Y130.393 E.03945
; LINE_WIDTH: 0.475498
G1 F14563.865
G1 X110.122 Y130.264 E.01483
; LINE_WIDTH: 0.420207
G1 F15000
G1 X110.523 Y130.136 E.01294
G1 X116.327 Y128.006 E.19008
G1 X139.673 Y128.006 E.71774
G1 X145.278 Y130.063 E.18355
; LINE_WIDTH: 0.437748
G1 X145.641 Y130.178 E.01226
; LINE_WIDTH: 0.462957
G1 F14998.696
G3 X146.911 Y130.641 I-3.267 J10.933 E.04628
G1 X147.819 Y130.894 E.03227
G2 X149.562 Y130.9 I.889 J-5.236 E.05995
G1 X150.111 Y130.782 E.01922
G1 X150.918 Y130.467 E.02964
G2 X152.074 Y129.673 I-2.41 J-4.748 E.04815
G1 X152.646 Y129.066 E.02856
G1 X153.116 Y128.339 E.02962
G2 X153.641 Y126.745 I-4.554 J-2.384 E.05769
G1 X153.706 Y125.907 E.02878
G1 X153.634 Y125.181 E.02497
G1 X153.417 Y124.346 E.02952
G1 X153.058 Y123.555 E.02972
G1 X152.616 Y122.894 E.02723
G2 X151.145 Y121.646 I-4.183 J3.441 E.06638
G1 X150.467 Y121.339 E.02545
G1 X149.724 Y121.12 E.02652
G1 X148.856 Y121.023 E.02989
G2 X147.341 Y121.218 I-.047 J5.631 E.05245
G1 X146.679 Y121.456 E.02409
; LINE_WIDTH: 0.479993
G1 F14414.084
G1 X146.288 Y121.618 E.01504
; LINE_WIDTH: 0.514238
G1 F13366.785
G1 X145.898 Y121.78 E.01622
; LINE_WIDTH: 0.512799
G1 F13407.727
G1 X145.565 Y121.882 E.01336
; LINE_WIDTH: 0.475675
G1 F14557.891
G1 X145.231 Y121.985 E.01231
; LINE_WIDTH: 0.421097
G1 F15000
G1 X144.898 Y122.088 E.01075
G1 X139.732 Y123.984 E.16958
G1 X139.673 Y124.371 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y124.371 E.71732
G1 X116.131 Y124.336 E.00613
G1 X110.416 Y122.228 E.18716
G1 X110.628 Y122.399 E.00838
G1 X111.019 Y122.807 E.01736
G1 X111.511 Y123.498 E.02604
G1 X111.881 Y124.271 E.02635
G1 X112.112 Y125.102 E.02649
G1 X112.189 Y125.749 E.02002
G1 X112.129 Y126.794 E.03216
G1 X111.913 Y127.641 E.02686
G1 X111.456 Y128.591 E.0324
G1 X110.934 Y129.289 E.02679
G1 X110.444 Y129.764 E.02095
G1 X116.131 Y127.664 E.18628
G1 X116.327 Y127.629 E.00611
G1 X139.673 Y127.629 E.71733
G1 X139.869 Y127.664 E.00611
G1 X145.588 Y129.775 E.18733
G1 X145.355 Y129.583 E.00929
G1 X144.731 Y128.871 E.02907
G1 X144.287 Y128.123 E.02672
G1 X143.976 Y127.283 E.02753
G1 X143.814 Y126.274 E.0314
G1 X143.847 Y125.369 E.02785
G1 X143.963 Y124.762 E.01896
G1 X144.246 Y123.966 E.02597
G1 X144.668 Y123.217 E.02643
G1 X145.072 Y122.703 E.02009
G1 X145.595 Y122.233 E.02159
G1 X139.868 Y124.337 E.18748
G1 X139.732 Y124.361 E.00424
G1 X139.673 Y124.748 F30000
G1 F15000
G1 X116.327 Y124.748 E.71732
G1 X116 Y124.69 E.0102
G1 X111.693 Y123.101 E.14106
G1 X111.902 Y123.424 E.01181
G1 X112.223 Y124.112 E.02333
G1 X112.476 Y125.004 E.02851
G1 X112.564 Y125.708 E.02178
G1 X112.505 Y126.818 E.03418
G1 X112.277 Y127.738 E.02913
G1 X111.794 Y128.758 E.03467
G1 X111.709 Y128.895 E.00495
G1 X116.001 Y127.31 E.14058
G1 X116.327 Y127.252 E.01019
G1 X139.673 Y127.252 E.71733
G1 X139.999 Y127.31 E.01019
G1 X144.299 Y128.897 E.14082
G1 X143.961 Y128.312 E.02077
G1 X143.621 Y127.41 E.0296
G1 X143.441 Y126.33 E.03365
G1 X143.47 Y125.35 E.03012
G1 X143.593 Y124.688 E.0207
G1 X143.891 Y123.837 E.0277
G1 X144.293 Y123.113 E.02543
G1 X139.998 Y124.69 E.14059
G1 X139.732 Y124.738 E.0083
G1 X139.673 Y125.125 F30000
G1 F15000
G1 X116.327 Y125.125 E.71732
G1 X115.87 Y125.044 E.01428
G1 X112.492 Y123.797 E.11062
G1 X112.643 Y124.169 E.01232
G1 X112.841 Y124.907 E.02347
G1 X112.939 Y125.667 E.02355
G1 X112.882 Y126.843 E.03619
G1 X112.641 Y127.836 E.03139
G1 X112.488 Y128.205 E.01229
G1 X115.87 Y126.956 E.1108
G1 X116.327 Y126.875 E.01426
G1 X139.673 Y126.875 E.71733
G1 X140.13 Y126.956 E.01427
G1 X143.505 Y128.202 E.11054
G1 X143.266 Y127.538 E.0217
G1 X143.068 Y126.386 E.0359
G1 X143.093 Y125.332 E.0324
G1 X143.223 Y124.613 E.02245
G1 X143.501 Y123.805 E.02625
G1 X140.128 Y125.044 E.11044
G1 X139.732 Y125.115 E.01235
G1 X139.673 Y125.502 F30000
G1 F15000
G1 X116.327 Y125.502 E.71732
G3 X115.739 Y125.397 I0 J-1.697 E.01845
G1 X113.102 Y124.424 E.08638
G3 X113.314 Y125.626 I-4.766 J1.46 E.03758
G1 X113.258 Y126.868 E.0382
G1 X113.102 Y127.577 E.0223
G1 X115.74 Y126.602 E.08642
G3 X116.327 Y126.498 I.587 J1.592 E.01843
G1 X139.673 Y126.498 E.71733
G3 X140.261 Y126.603 I0 J1.697 E.01844
G1 X142.888 Y127.573 E.08607
G1 X142.695 Y126.442 E.03524
G1 X142.717 Y125.314 E.03468
G1 X142.883 Y124.434 E.0275
G1 X140.257 Y125.398 E.08594
G3 X139.732 Y125.497 I-.54 J-1.427 E.0165
G1 X139.673 Y125.845 F30000
; LINE_WIDTH: 0.35198
G1 F15000
G1 X116.327 Y125.845 E.58794
; LINE_WIDTH: 0.368983
G1 X116.139 Y125.845 E.005
; LINE_WIDTH: 0.41954
G1 X115.951 Y125.845 E.00577
G1 X115.609 Y125.751 E.01089
G2 X113.629 Y125.023 I-112.028 J301.449 E.06474
G1 X113.689 Y125.585 E.01735
G1 X113.619 Y126.983 E.04298
G1 X115.609 Y126.249 E.06511
G1 X115.951 Y126.155 E.01087
; LINE_WIDTH: 0.402988
G1 X116.139 Y126.155 E.00552
; LINE_WIDTH: 0.352116
G1 X139.673 Y126.155 E.59294
; LINE_WIDTH: 0.368983
G1 X139.86 Y126.155 E.00497
; LINE_WIDTH: 0.419544
G1 X140.047 Y126.155 E.00575
G1 X140.391 Y126.249 E.01094
G1 X142.396 Y126.989 E.06559
G1 X142.302 Y126.09 E.02775
G3 X142.374 Y125.023 I7.101 J-.054 E.03286
G1 X140.387 Y125.752 E.06495
G1 X140.047 Y125.845 E.01083
; LINE_WIDTH: 0.402988
G1 X139.89 Y125.845 E.00462
; LINE_WIDTH: 0.368983
G1 X139.733 Y125.845 E.00418
G1 X140.95 Y126 F30000
; LINE_WIDTH: 0.51954
G1 F13218.077
G1 X141.889 Y126.347 E.03888
G1 X141.896 Y125.653 E.02695
G1 X141.007 Y125.98 E.03678
G1 X144.187 Y126.218 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X144.223 Y125.387 E.02557
G1 X144.332 Y124.837 E.01722
G1 X144.6 Y124.095 E.02424
G1 X144.995 Y123.405 E.02441
G1 X145.366 Y122.939 E.01832
; LINE_WIDTH: 0.44102
G1 X145.72 Y122.599 E.01593
; LINE_WIDTH: 0.465636
G1 F14903.648
G1 X146.075 Y122.258 E.01692
G1 X146.78 Y121.868 E.02778
G3 X147.828 Y121.529 I2.908 J7.19 E.03797
G1 X148.458 Y121.448 E.02188
G1 X149.496 Y121.504 E.03578
G1 X150.211 Y121.688 E.02545
G1 X150.818 Y121.946 E.0227
G1 X151.488 Y122.37 E.02731
G1 X152.039 Y122.865 E.02552
G1 X152.634 Y123.652 E.03399
G1 X152.982 Y124.362 E.02723
G1 X153.21 Y125.163 E.02871
G1 X153.283 Y125.785 E.02157
G1 X153.255 Y126.505 E.0248
G1 X153.081 Y127.317 E.02861
G1 X152.814 Y128.022 E.02597
G1 X152.397 Y128.705 E.02759
G1 X152.017 Y129.145 E.02001
G1 X151.42 Y129.67 E.02738
; LINE_WIDTH: 0.456319
G1 F15000
G1 X151.154 Y129.859 E.01099
G1 X150.305 Y130.277 E.03188
G1 X149.53 Y130.489 E.02707
G3 X147.926 Y130.493 I-.815 J-4.973 E.05426
G1 X147.177 Y130.293 E.02613
; LINE_WIDTH: 0.473545
G1 F14629.898
G1 X146.729 Y130.089 E.01729
; LINE_WIDTH: 0.499595
G1 F13795.369
G1 X146.28 Y129.884 E.01833
; LINE_WIDTH: 0.489463
G1 F14108.399
G1 X145.973 Y129.622 E.01471
; LINE_WIDTH: 0.42239
G1 F15000
G1 X145.666 Y129.36 E.0125
G1 X145.015 Y128.623 E.0304
G1 X144.614 Y127.935 E.02462
G1 X144.331 Y127.156 E.02563
G1 X144.196 Y126.277 E.02748
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X144.331 Y127.156 E-.33769
G1 X144.614 Y127.935 E-.31492
G1 X144.756 Y128.179 E-.10739
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/15
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.811 Y121.95
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.827 Y121.948 E.00053
G3 X148.564 Y121.851 I.908 J4.051 E.02469
G1 X148.725 Y121.848 E.00535
G3 X147.477 Y122.043 I.01 J4.152 E.82325
G1 X147.753 Y121.966 E.00949
G1 X147.903 Y122.331 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.912 Y122.331 E.00027
G3 X148.58 Y122.243 I.823 J3.668 E.02074
G1 X148.725 Y122.24 E.00445
G3 X147.595 Y122.417 I.009 J3.759 E.69056
G1 X147.845 Y122.347 E.00796
; WIPE_START
M204 S10000
G1 X147.912 Y122.331 E-.02604
G1 X148.234 Y122.272 E-.12462
G1 X148.58 Y122.243 E-.13187
G1 X148.725 Y122.24 E-.05509
G1 X149.053 Y122.254 E-.1246
G1 X149.539 Y122.329 E-.18692
G1 X149.821 Y122.405 E-.11086
; WIPE_END
G1 E-.04 F1800
G1 X142.313 Y123.78 Z3.2 F30000
G1 X107.621 Y130.137 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.274 Y130.151 E.01152
G3 X107.114 Y121.851 I.011 J-4.152 E.42663
G1 X107.275 Y121.848 E.00535
G3 X107.681 Y130.132 I.01 J4.152 E.41981
G1 X107.544 Y129.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P92 R0
G1 F12000
M204 S5000
G1 X107.275 Y129.759 E.0083
G3 X107.13 Y122.243 I.01 J-3.759 E.35788
G1 X107.275 Y122.24 E.00445
G3 X107.604 Y129.745 I.009 J3.759 E.35335
; WIPE_START
M204 S10000
G1 X107.275 Y129.759 E-.12542
G1 X106.784 Y129.728 E-.1867
G1 X106.461 Y129.671 E-.1247
G1 X106.144 Y129.586 E-.12454
G1 X105.836 Y129.474 E-.12473
G1 X105.66 Y129.392 E-.07391
; WIPE_END
G1 E-.04 F1800
G1 X113.183 Y128.108 Z3.2 F30000
G1 X139.584 Y123.602 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.636 Y123.602 E.00173
G1 X147.009 Y120.882 E.26067
G3 X146.775 Y131.033 I1.712 J5.118 E.68624
G1 X139.636 Y128.398 E.25242
G1 X116.364 Y128.398 E.77201
G1 X109.225 Y131.033 E.25242
G3 X107.611 Y120.613 I-1.946 J-5.034 E.6395
G3 X108.991 Y120.882 I-.465 J6.047 E.04673
G1 X116.364 Y123.602 E.26067
G1 X139.524 Y123.602 E.76828
G1 X139.564 Y123.21 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X139.566 Y123.21 E.00008
G1 X146.883 Y120.511 E.23962
G3 X146.641 Y131.402 I1.838 J5.489 E.68163
G1 X139.566 Y128.79 E.23173
G1 X116.434 Y128.79 E.71081
G1 X109.359 Y131.402 E.23172
G3 X107.637 Y120.221 I-2.08 J-5.403 E.63518
G3 X109.117 Y120.511 I-.501 J6.489 E.04646
G1 X116.434 Y123.21 E.23962
G1 X139.504 Y123.21 E.70888
; WIPE_START
M204 S10000
G1 X139.566 Y123.21 E-.02374
G1 X141.384 Y122.539 E-.73626
; WIPE_END
G1 E-.04 F1800
G1 X133.807 Y123.453 Z3.2 F30000
G1 X111.81 Y126.104 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F15000
G1 X111.753 Y126.775 E.0207
G1 X111.55 Y127.541 E.02434
G1 X111.118 Y128.424 E.0302
G1 X110.635 Y129.059 E.02453
; LINE_WIDTH: 0.442015
G1 X110.281 Y129.401 E.016
; LINE_WIDTH: 0.474054
G1 F14612.652
G1 X109.927 Y129.743 E.01729
G1 X109.223 Y130.134 E.02827
G3 X108.451 Y130.409 I-4.591 J-11.647 E.0288
G1 X107.949 Y130.512 E.01801
G1 X107.15 Y130.558 E.02812
; LINE_WIDTH: 0.460934
G1 F15000
G1 X106.498 Y130.496 E.02231
G1 X105.788 Y130.312 E.02496
G1 X105.182 Y130.054 E.02243
G1 X104.512 Y129.63 E.02701
G1 X103.924 Y129.095 E.02709
G3 X103.278 Y128.191 I4.265 J-3.729 E.0379
G1 X102.96 Y127.455 E.02733
G3 X102.719 Y126.221 I5.299 J-1.677 E.0429
G1 X102.752 Y125.399 E.02802
G1 X102.863 Y124.834 E.01964
G1 X103.142 Y124.069 E.02771
G1 X103.529 Y123.396 E.02646
G3 X104.978 Y122.057 I4.08 J2.963 E.06762
G1 X105.7 Y121.718 E.02718
G1 X106.273 Y121.551 E.02032
G1 X106.994 Y121.449 E.02482
G3 X108.728 Y121.684 I.194 J5.081 E.0599
G1 X109.223 Y121.867 E.01797
; LINE_WIDTH: 0.487695
G1 F14164.466
G1 X109.561 Y122.043 E.01381
; LINE_WIDTH: 0.520185
G1 F13200.214
G1 X109.899 Y122.219 E.01482
; LINE_WIDTH: 0.517024
G1 F13288.243
G1 X110.137 Y122.452 E.01286
; LINE_WIDTH: 0.47821
G1 F14473.111
G1 X110.375 Y122.684 E.0118
; LINE_WIDTH: 0.421707
G1 F15000
G3 X111.386 Y124.065 I-3.441 J3.582 E.05309
G1 X111.665 Y124.831 E.02516
G1 X111.778 Y125.393 E.0177
G1 X111.807 Y126.044 E.02012
G1 X115.049 Y126 F30000
; LINE_WIDTH: 0.52058
G1 F13189.298
G1 X114.106 Y125.652 E.03913
G1 X114.116 Y126.344 E.02695
G1 X114.993 Y126.021 E.03636
G1 X139.673 Y123.994 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y123.994 E.71732
G1 X111.11 Y122.082 E.17074
; LINE_WIDTH: 0.441885
G1 X110.657 Y121.938 E.01544
; LINE_WIDTH: 0.4677
G1 F14831.232
G3 X109.404 Y121.48 I2.779 J-9.542 E.04621
G2 X106.523 Y121.077 I-2.156 J4.915 E.10197
G1 X105.681 Y121.28 E.02999
G1 X104.884 Y121.63 E.03014
G1 X104.337 Y121.98 E.02244
G1 X103.683 Y122.548 E.03001
G1 X103.263 Y123.046 E.02252
G1 X102.814 Y123.784 E.02992
G1 X102.496 Y124.594 E.03012
G1 X102.353 Y125.227 E.02248
G1 X102.295 Y126.09 E.02994
G1 X102.39 Y126.954 E.03007
G1 X102.554 Y127.583 E.02249
; LINE_WIDTH: 0.460844
G1 F15000
G2 X103.513 Y129.266 I5.399 J-1.961 E.06631
G1 X104.137 Y129.868 E.02952
G1 X104.855 Y130.353 E.02952
G1 X105.532 Y130.661 E.02532
G1 X106.277 Y130.88 E.02644
G1 X106.994 Y130.967 E.02458
G1 X107.875 Y130.939 E.03004
G2 X109.083 Y130.641 I-.591 J-4.986 E.04247
; LINE_WIDTH: 0.486973
G1 F14187.511
G1 X109.594 Y130.434 E.01996
; LINE_WIDTH: 0.520338
G1 F13195.997
G1 X110.106 Y130.228 E.02146
; LINE_WIDTH: 0.517515
G1 F13274.476
G1 X110.439 Y130.126 E.01348
; LINE_WIDTH: 0.478505
G1 F14463.308
G1 X110.772 Y130.023 E.01237
; LINE_WIDTH: 0.420183
G1 F15000
G1 X111.106 Y129.921 E.01072
G1 X116.327 Y128.006 E.17098
G1 X139.673 Y128.006 E.71769
G1 X145.28 Y130.063 E.18361
; LINE_WIDTH: 0.437745
G1 X145.642 Y130.178 E.01223
; LINE_WIDTH: 0.464601
G1 F14940.206
G3 X146.91 Y130.641 I-3.259 J10.911 E.04641
G1 X147.819 Y130.894 E.03241
G1 X148.396 Y130.972 E.02002
G1 X149.263 Y130.952 E.02979
G1 X149.951 Y130.821 E.02407
G1 X150.784 Y130.529 E.03033
G2 X152.736 Y128.954 I-2.279 J-4.823 E.08699
G1 X153.186 Y128.216 E.02971
G1 X153.503 Y127.409 E.0298
G1 X153.671 Y126.557 E.02982
G1 X153.703 Y125.907 E.02236
G2 X153.373 Y124.216 I-6.628 J.418 E.05939
G1 X152.992 Y123.435 E.02986
G1 X152.621 Y122.902 E.02231
G1 X152.131 Y122.374 E.02474
G1 X151.506 Y121.866 E.02768
G2 X149.724 Y121.12 I-3.233 J5.218 E.06665
G1 X148.856 Y121.024 E.03001
G2 X147.051 Y121.316 I-.071 J5.285 E.06316
G1 X146.282 Y121.615 E.02834
; LINE_WIDTH: 0.470983
G1 F14717.477
G1 X145.882 Y121.744 E.01466
; LINE_WIDTH: 0.421081
G1 F15000
G1 X145.482 Y121.873 E.01295
G1 X139.732 Y123.984 E.18877
G1 X139.673 Y124.371 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.327 Y124.371 E.71732
G1 X116.131 Y124.336 E.00613
G1 X110.386 Y122.217 E.18813
G1 X110.861 Y122.634 E.01941
G1 X111.283 Y123.146 E.02039
G1 X111.713 Y123.876 E.02604
G1 X112.02 Y124.703 E.0271
G1 X112.148 Y125.32 E.01937
G1 X112.186 Y126.089 E.02365
G1 X112.127 Y126.817 E.02245
G1 X111.914 Y127.639 E.02608
G1 X111.456 Y128.591 E.03247
G1 X110.934 Y129.289 E.02679
G1 X110.383 Y129.786 E.0228
G1 X116.131 Y127.664 E.18828
G1 X116.327 Y127.629 E.00611
G1 X139.673 Y127.629 E.71733
G1 X139.869 Y127.664 E.00611
G1 X145.588 Y129.775 E.18732
G1 X145.365 Y129.593 E.00884
G1 X144.851 Y129.032 E.02339
G1 X144.294 Y128.134 E.03247
G1 X143.98 Y127.297 E.02746
G1 X143.814 Y126.275 E.03182
G1 X143.845 Y125.383 E.02744
G1 X143.962 Y124.763 E.01937
G1 X144.246 Y123.966 E.026
G1 X144.668 Y123.217 E.02642
G3 X145.532 Y122.256 I4.007 J2.734 E.0398
G1 X139.868 Y124.337 E.1854
G1 X139.732 Y124.361 E.00424
G1 X139.673 Y124.748 F30000
G1 F15000
G1 X116.327 Y124.748 E.71732
G1 X116 Y124.69 E.0102
G1 X111.702 Y123.104 E.14077
G1 X112.039 Y123.688 E.02071
G1 X112.375 Y124.575 E.02915
G1 X112.518 Y125.247 E.02112
G1 X112.563 Y126.073 E.02543
G1 X112.502 Y126.859 E.0242
G1 X112.278 Y127.736 E.02783
G1 X111.794 Y128.758 E.03473
G1 X111.709 Y128.895 E.00495
G1 X116.001 Y127.31 E.14058
G1 X116.327 Y127.252 E.01019
G1 X139.673 Y127.252 E.71733
G1 X139.999 Y127.31 E.01019
G1 X144.32 Y128.905 E.14152
G1 X143.971 Y128.33 E.02069
G1 X143.625 Y127.425 E.02976
G1 X143.441 Y126.331 E.03408
G1 X143.468 Y125.365 E.02971
G1 X143.593 Y124.689 E.02112
G1 X143.891 Y123.837 E.02774
G1 X144.293 Y123.113 E.02542
G1 X139.998 Y124.69 E.14059
G1 X139.732 Y124.738 E.0083
G1 X139.673 Y125.125 F30000
G1 F15000
G1 X116.327 Y125.125 E.71732
G1 X115.87 Y125.044 E.01428
G1 X112.496 Y123.799 E.1105
G1 X112.73 Y124.447 E.02117
G1 X112.888 Y125.174 E.02287
G1 X112.94 Y126.058 E.0272
G1 X112.877 Y126.9 E.02595
G1 X112.642 Y127.834 E.02958
G1 X112.487 Y128.205 E.01237
G1 X115.87 Y126.956 E.11081
G1 X116.327 Y126.875 E.01426
G1 X139.673 Y126.875 E.71733
G1 X140.13 Y126.956 E.01427
G1 X143.505 Y128.202 E.11053
G1 X143.27 Y127.553 E.02121
G1 X143.068 Y126.388 E.03633
G1 X143.091 Y125.347 E.03198
G1 X143.223 Y124.615 E.02287
G1 X143.501 Y123.805 E.0263
G1 X140.128 Y125.044 E.11044
G1 X139.732 Y125.115 E.01235
G1 X139.673 Y125.502 F30000
G1 F15000
G1 X116.327 Y125.502 E.71732
G3 X115.739 Y125.397 I0 J-1.697 E.01845
G1 X113.115 Y124.429 E.08596
G1 X113.258 Y125.101 E.02112
G1 X113.317 Y126.043 E.02898
G1 X113.252 Y126.942 E.02771
G1 X113.102 Y127.577 E.02003
G1 X115.74 Y126.602 E.08642
G3 X116.327 Y126.498 I.587 J1.592 E.01843
G1 X139.673 Y126.498 E.71733
G3 X140.261 Y126.603 I0 J1.697 E.01844
G1 X142.888 Y127.573 E.08607
G1 X142.696 Y126.444 E.03517
G1 X142.715 Y125.33 E.03425
G1 X142.883 Y124.434 E.028
G1 X140.257 Y125.398 E.08594
G3 X139.732 Y125.497 I-.54 J-1.427 E.0165
G1 X139.673 Y125.845 F30000
; LINE_WIDTH: 0.35198
G1 F15000
G1 X116.327 Y125.845 E.58794
; LINE_WIDTH: 0.368983
G1 X116.139 Y125.845 E.005
; LINE_WIDTH: 0.419538
G1 X115.951 Y125.845 E.00577
G1 X115.609 Y125.751 E.01089
G2 X113.633 Y125.027 I-25.73 J67.192 E.06458
G1 X113.693 Y126.027 E.03074
G1 X113.627 Y126.981 E.02933
G1 X115.609 Y126.249 E.06487
G1 X115.951 Y126.155 E.01087
; LINE_WIDTH: 0.402988
G1 X116.139 Y126.155 E.00552
; LINE_WIDTH: 0.352116
G1 X139.673 Y126.155 E.59294
; LINE_WIDTH: 0.368983
G1 X139.86 Y126.155 E.00497
; LINE_WIDTH: 0.419544
G1 X140.047 Y126.155 E.00575
G1 X140.391 Y126.249 E.01094
G1 X142.397 Y126.989 E.06561
G1 X142.302 Y126.094 E.02765
G3 X142.374 Y125.023 I7.092 J-.061 E.03296
G1 X140.387 Y125.752 E.06493
G1 X140.047 Y125.845 E.01083
; LINE_WIDTH: 0.402988
G1 X139.89 Y125.845 E.00462
; LINE_WIDTH: 0.368983
G1 X139.733 Y125.845 E.00418
G1 X140.95 Y126 F30000
; LINE_WIDTH: 0.51952
G1 F13218.633
G1 X141.889 Y126.347 E.03888
G1 X141.895 Y125.654 E.02693
G1 X141.007 Y125.98 E.03674
G1 X144.187 Y126.218 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X144.221 Y125.4 E.02516
G1 X144.332 Y124.837 E.01762
G1 X144.6 Y124.095 E.02426
G1 X144.995 Y123.405 E.0244
G3 X145.793 Y122.528 I5.062 J3.805 E.0365
; LINE_WIDTH: 0.43593
G1 X146.107 Y122.288 E.01266
; LINE_WIDTH: 0.462141
G1 X146.421 Y122.047 E.01351
G1 X147.15 Y121.719 E.02733
G1 X147.722 Y121.547 E.02038
G1 X148.459 Y121.447 E.02543
M73 P93 R0
G1 X149.495 Y121.504 E.03545
G1 X150.211 Y121.688 E.02525
G3 X151.249 Y122.201 I-2.546 J6.453 E.03957
G1 X151.746 Y122.583 E.02143
G1 X152.284 Y123.166 E.02709
G3 X153.131 Y124.825 I-3.746 J2.957 E.06406
G3 X153.137 Y127.159 I-4.871 J1.18 E.08047
G1 X152.867 Y127.912 E.0273
G1 X152.471 Y128.604 E.02724
G3 X151.189 Y129.838 I-4.307 J-3.191 E.06109
G1 X150.743 Y130.091 E.01751
G1 X149.998 Y130.377 E.02724
G1 X149.336 Y130.522 E.02318
G1 X148.521 Y130.558 E.02786
G3 X147.077 Y130.252 I.393 J-5.413 E.05056
; LINE_WIDTH: 0.478447
G1 F14465.245
G1 X146.281 Y129.884 E.03114
G1 X145.667 Y129.361 E.02862
; LINE_WIDTH: 0.41999
G1 F15000
G1 X145.129 Y128.777 E.0244
G1 X144.616 Y127.939 E.0302
G1 X144.335 Y127.169 E.02517
G1 X144.196 Y126.278 E.02772
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X144.335 Y127.169 E-.34287
G1 X144.616 Y127.939 E-.3113
G1 X144.761 Y128.176 E-.10583
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/15
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END

; OBJECT_ID: 123
G1 X147.885 Y122.336
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X147.911 Y122.33 E.00084
G3 X148.567 Y122.243 I.817 J3.67 E.02036
G1 X148.725 Y122.24 E.00484
G3 X147.595 Y122.415 I.003 J3.76 E.69056
G1 X147.827 Y122.352 E.0074
; WIPE_START
M204 S10000
G1 X147.911 Y122.33 E-.03318
G1 X148.234 Y122.272 E-.12462
G1 X148.567 Y122.243 E-.12705
G1 X148.725 Y122.24 E-.05991
G1 X149.053 Y122.254 E-.12462
G1 X149.378 Y122.297 E-.12466
G1 X149.802 Y122.401 E-.16596
; WIPE_END
G1 E-.04 F1800
G1 X142.282 Y123.708 Z3.4 F30000
G1 X107.549 Y129.748 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X107.275 Y129.759 E.00842
G3 X107.117 Y122.243 I.003 J-3.76 E.35789
G1 X107.275 Y122.24 E.00484
G3 X107.609 Y129.744 I.003 J3.76 E.35284
; WIPE_START
M204 S10000
G1 X107.275 Y129.759 E-.12692
G1 X106.947 Y129.746 E-.12456
G1 X106.622 Y129.703 E-.12465
G1 X106.144 Y129.586 E-.18691
G1 X105.836 Y129.474 E-.12465
G1 X105.664 Y129.393 E-.07231
; WIPE_END
G1 E-.04 F1800
G1 X113.172 Y128.024 Z3.4 F30000
G1 X139.563 Y123.21 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X139.566 Y123.21 E.00009
G1 X146.883 Y120.511 E.23962
G3 X146.641 Y131.402 I1.838 J5.489 E.68163
G1 X139.566 Y128.79 E.23173
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23175
G3 X107.637 Y120.221 I-2.079 J-5.403 E.63516
G3 X109.117 Y120.511 I-.498 J6.474 E.04644
G1 X116.434 Y123.21 E.23962
G1 X139.503 Y123.21 E.70887
; WIPE_START
M204 S10000
G1 X139.566 Y123.21 E-.02397
G1 X141.384 Y122.54 E-.73603
; WIPE_END
G1 E-.04 F1800
G1 X148.897 Y121.197 Z3.4 F30000
G1 X150.845 Y120.849 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X153.876 Y123.88 E.13172
G1 X154.15 Y124.688
G1 X150.038 Y120.575 E.1787
G1 X149.392 Y120.463
G1 X154.262 Y125.333 E.21163
G1 X154.295 Y125.899
G1 X148.826 Y120.43 E.23765
G1 X148.3 Y120.437
G1 X150.172 Y122.309 E.08135
G1 X149.425 Y122.095
G1 X147.825 Y120.495 E.06953
G1 X147.387 Y120.591
G1 X148.838 Y122.042 E.06307
G1 X148.32 Y122.057
G1 X146.966 Y120.702 E.05885
G1 X146.575 Y120.845
G1 X147.858 Y122.129 E.05576
G1 X147.446 Y122.249
G1 X146.186 Y120.989 E.05476
G1 X145.796 Y121.133
G1 X147.062 Y122.398 E.055
G1 X146.712 Y122.582
G1 X145.407 Y121.277 E.05674
G1 X145.017 Y121.42
G1 X146.392 Y122.795 E.05976
G1 X146.096 Y123.033
G1 X144.628 Y121.564 E.06383
G1 X144.238 Y121.708
G1 X145.825 Y123.294 E.06895
G1 X145.579 Y123.582
G1 X143.848 Y121.851 E.07521
G1 X143.459 Y121.995
G1 X145.362 Y123.898 E.08268
G1 X145.173 Y124.242
G1 X143.069 Y122.139 E.0914
G1 X142.68 Y122.282
G1 X145.01 Y124.612 E.10125
G1 X144.883 Y125.019
G1 X142.29 Y122.426 E.11267
G1 X141.901 Y122.57
G1 X144.794 Y125.464 E.12575
G1 X144.761 Y125.964
G1 X141.511 Y122.714 E.14123
G1 X141.122 Y122.857
G1 X144.793 Y126.529 E.15955
G1 X144.955 Y127.224
G1 X140.732 Y123.001 E.18349
G1 X140.342 Y123.145
G1 X145.503 Y128.306 E.22427
; WIPE_START
M204 S10000
G1 X144.089 Y126.891 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.437 Y124.828 Z3.4 F30000
G1 X152.416 Y124.553 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X154.289 Y126.426 E.08137
G1 X154.232 Y126.902
G1 X152.63 Y125.3 E.06961
G1 X152.689 Y125.892
G1 X154.142 Y127.345 E.06314
G1 X154.022 Y127.759
G1 X152.669 Y126.405 E.0588
G1 X152.597 Y126.867
G1 X153.875 Y128.145 E.05554
G1 X153.706 Y128.509
G1 X152.476 Y127.28 E.05344
G1 X152.327 Y127.663
G1 X153.514 Y128.85 E.05158
G1 X153.306 Y129.176
G1 X152.142 Y128.012 E.05058
G1 X151.929 Y128.332
G1 X153.08 Y129.483 E.05004
G1 X152.835 Y129.771
G1 X151.693 Y128.629 E.04962
G1 X151.426 Y128.896
G1 X152.573 Y130.043 E.04985
G1 X152.289 Y130.292
G1 X151.14 Y129.143 E.04994
G1 X150.826 Y129.362
G1 X151.987 Y130.524 E.05049
G1 X151.665 Y130.734
G1 X150.484 Y129.553 E.05132
G1 X150.113 Y129.716
G1 X151.327 Y130.93 E.05277
G1 X150.97 Y131.105
G1 X149.706 Y129.842 E.05491
G1 X149.261 Y129.93
G1 X150.588 Y131.257 E.05766
G1 X150.182 Y131.385
G1 X148.761 Y129.964 E.06174
G1 X148.196 Y129.932
G1 X149.749 Y131.485 E.06748
G1 X149.281 Y131.55
G1 X147.501 Y129.77 E.07735
G1 X146.419 Y129.221
G1 X148.772 Y131.574 E.10226
G1 X148.221 Y131.556
G1 X139.953 Y123.288 E.35928
G1 X139.549 Y123.417
G1 X147.596 Y131.465 E.3497
G1 X146.852 Y131.254
G1 X139.015 Y123.417 E.34055
G1 X138.482 Y123.417
G1 X146.014 Y130.95 E.32731
G1 X145.169 Y130.637
G1 X137.949 Y123.417 E.31375
G1 X137.416 Y123.417
G1 X144.324 Y130.325 E.30018
G1 X143.478 Y130.013
G1 X136.882 Y123.417 E.28662
G1 X136.349 Y123.417
G1 X142.633 Y129.701 E.27306
G1 X141.787 Y129.389
G1 X135.816 Y123.417 E.25949
G1 X135.283 Y123.417
G1 X140.942 Y129.077 E.24593
G1 X140.097 Y128.765
G1 X134.749 Y123.417 E.23237
G1 X134.216 Y123.417
G1 X139.381 Y128.583 E.22446
G1 X138.848 Y128.583
G1 X133.683 Y123.417 E.22446
G1 X133.15 Y123.417
G1 X138.315 Y128.583 E.22446
G1 X137.782 Y128.583
G1 X132.616 Y123.417 E.22446
G1 X132.083 Y123.417
G1 X137.248 Y128.583 E.22446
G1 X136.715 Y128.583
G1 X131.55 Y123.417 E.22446
G1 X131.017 Y123.417
G1 X136.182 Y128.583 E.22446
G1 X135.648 Y128.583
G1 X130.483 Y123.417 E.22446
G1 X129.95 Y123.417
G1 X135.115 Y128.583 E.22446
G1 X134.582 Y128.583
M73 P94 R0
G1 X129.417 Y123.417 E.22446
G1 X128.883 Y123.417
G1 X134.049 Y128.583 E.22446
G1 X133.515 Y128.583
G1 X128.35 Y123.417 E.22446
G1 X127.817 Y123.417
G1 X132.982 Y128.583 E.22446
G1 X132.449 Y128.583
G1 X127.284 Y123.417 E.22446
G1 X126.75 Y123.417
G1 X131.916 Y128.583 E.22446
G1 X131.382 Y128.583
G1 X126.217 Y123.417 E.22446
G1 X125.684 Y123.417
G1 X130.849 Y128.583 E.22446
G1 X130.316 Y128.583
G1 X125.151 Y123.417 E.22446
G1 X124.617 Y123.417
G1 X129.783 Y128.583 E.22446
G1 X129.249 Y128.583
G1 X124.084 Y123.417 E.22446
G1 X123.551 Y123.417
G1 X128.716 Y128.583 E.22446
G1 X128.183 Y128.583
G1 X123.018 Y123.417 E.22446
G1 X122.484 Y123.417
G1 X127.65 Y128.583 E.22446
G1 X127.116 Y128.583
G1 X121.951 Y123.417 E.22446
G1 X121.418 Y123.417
G1 X126.583 Y128.583 E.22446
G1 X126.05 Y128.583
G1 X120.885 Y123.417 E.22446
G1 X120.351 Y123.417
G1 X125.517 Y128.583 E.22446
G1 X124.983 Y128.583
G1 X119.818 Y123.417 E.22446
G1 X119.285 Y123.417
G1 X124.45 Y128.583 E.22446
G1 X123.917 Y128.583
G1 X118.752 Y123.417 E.22446
G1 X118.218 Y123.417
G1 X123.384 Y128.583 E.22446
G1 X122.85 Y128.583
G1 X117.685 Y123.417 E.22446
G1 X117.152 Y123.417
G1 X122.317 Y128.583 E.22446
G1 X121.784 Y128.583
G1 X116.619 Y123.417 E.22446
G1 X115.903 Y123.235
G1 X121.251 Y128.583 E.23236
G1 X120.717 Y128.583
G1 X115.058 Y122.924 E.24591
G1 X114.213 Y122.612
G1 X120.184 Y128.583 E.25945
G1 X119.651 Y128.583
G1 X113.368 Y122.3 E.273
G1 X112.523 Y121.989
G1 X119.118 Y128.583 E.28654
G1 X118.584 Y128.583
G1 X111.679 Y121.677 E.30009
G1 X110.834 Y121.365
G1 X118.051 Y128.583 E.31363
G1 X117.518 Y128.583
G1 X109.989 Y121.053 E.32718
G1 X109.144 Y120.742
G1 X116.984 Y128.583 E.34072
G1 X116.451 Y128.583
G1 X108.406 Y120.537 E.34961
G1 X107.785 Y120.449
G1 X116.047 Y128.712 E.35903
G1 X115.658 Y128.855
G1 X110.522 Y123.719 E.22318
G1 X111.045 Y124.777
G1 X115.268 Y128.999 E.18349
G1 X114.879 Y129.143
G1 X111.207 Y125.471 E.15956
G1 X111.239 Y126.037
G1 X114.489 Y129.287 E.14124
G1 X114.1 Y129.431
G1 X111.205 Y126.536 E.12578
G1 X111.117 Y126.981
G1 X113.71 Y129.574 E.1127
G1 X113.321 Y129.718
G1 X110.991 Y127.388 E.10126
G1 X110.828 Y127.759
G1 X112.931 Y129.862 E.09139
G1 X112.542 Y130.006
G1 X110.635 Y128.099 E.08288
G1 X110.421 Y128.418
G1 X112.152 Y130.15 E.07525
G1 X111.763 Y130.293
G1 X110.175 Y128.706 E.069
G1 X109.904 Y128.968
G1 X111.373 Y130.437 E.06384
G1 X110.984 Y130.581
G1 X109.607 Y129.204 E.05984
G1 X109.287 Y129.417
G1 X110.595 Y130.725 E.05681
G1 X110.205 Y130.869
G1 X108.938 Y129.602 E.05506
G1 X108.556 Y129.752
G1 X109.816 Y131.012 E.05475
G1 X109.426 Y131.156
G1 X108.136 Y129.866 E.05607
G1 X107.68 Y129.944
G1 X109.03 Y131.294 E.05867
G1 X108.613 Y131.409
G1 X107.167 Y129.964 E.06283
G1 X106.566 Y129.896
M73 P95 R0
G1 X108.175 Y131.505 E.06992
G1 X107.7 Y131.563
G1 X105.828 Y129.691 E.08136
; WIPE_START
M204 S10000
G1 X107.242 Y131.105 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.295 Y123.754 Z3.4 F30000
G1 X109.57 Y122.768 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X107.223 Y120.421 E.10201
G1 X106.726 Y120.457
G1 X108.498 Y122.23 E.07704
G1 X107.808 Y122.072
G1 X106.252 Y120.517 E.06758
G1 X105.818 Y120.615
G1 X107.241 Y122.039 E.06185
G1 X106.739 Y122.07
G1 X105.41 Y120.741 E.05774
G1 X105.027 Y120.891
G1 X106.295 Y122.159 E.0551
G1 X105.892 Y122.29
G1 X104.669 Y121.067 E.05313
G1 X104.332 Y121.262
G1 X105.516 Y122.447 E.05146
G1 X105.176 Y122.64
G1 X104.012 Y121.476 E.05058
G1 X103.71 Y121.708
G1 X104.857 Y122.855 E.04984
G1 X104.569 Y123.1
G1 X103.427 Y121.957 E.04965
G1 X103.165 Y122.229
G1 X104.307 Y123.371 E.04963
G1 X104.07 Y123.667
G1 X102.92 Y122.517 E.04998
G1 X102.694 Y122.824
G1 X103.861 Y123.991 E.05073
G1 X103.673 Y124.337
G1 X102.486 Y123.15 E.05159
G1 X102.294 Y123.491
G1 X103.524 Y124.721 E.05343
G1 X103.403 Y125.133
G1 X102.125 Y123.855 E.05555
G1 X101.978 Y124.242
G1 X103.331 Y125.595 E.0588
G1 X103.311 Y126.108
G1 X101.858 Y124.655 E.06314
G1 X101.776 Y125.106
G1 X103.379 Y126.709 E.06964
G1 X103.584 Y127.447
G1 X101.714 Y125.577 E.08127
G1 X101.699 Y126.095
G1 X107.184 Y131.58 E.23834
G1 X106.603 Y131.532
G1 X101.746 Y126.675 E.21106
G1 X101.856 Y127.319
G1 X105.962 Y131.425 E.17841
G1 X105.172 Y131.168
G1 X102.108 Y128.104 E.13316
; WIPE_START
M204 S10000
G1 X103.522 Y129.518 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.792 Y127.894 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105248
G1 F15000
G1 X103.719 Y127.795 E.00063
; LINE_WIDTH: 0.140129
G1 X103.643 Y127.691 E.00102
; LINE_WIDTH: 0.171261
G1 X103.582 Y127.6 E.00114
; LINE_WIDTH: 0.197228
G1 X103.522 Y127.509 E.00137
; WIPE_START
G1 X103.582 Y127.6 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.243 Y126.306 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.113225
G1 F15000
G1 X103.326 Y126.092 E.00132
; WIPE_START
G1 X103.243 Y126.306 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.679 Y122.343 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0902999
G1 F15000
G1 X105.573 Y122.417 E.0005
; WIPE_START
G1 X105.679 Y122.343 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.888 Y122.378 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105018
G1 F15000
G1 X108.81 Y122.326 E.00048
; LINE_WIDTH: 0.138716
G1 X108.732 Y122.274 E.00073
; LINE_WIDTH: 0.185174
G1 X108.562 Y122.166 E.00233
; WIPE_START
G1 X108.732 Y122.274 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P96 R0
G1 X116.235 Y123.671 Z3.4 F30000
G1 X146.358 Y129.281 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.209352
G1 F15000
G1 X146.004 Y128.965 E.00644
G1 X145.443 Y128.366 E.01113
G1 X145.103 Y127.613 F30000
; LINE_WIDTH: 0.105037
G1 F15000
G1 X145.051 Y127.535 E.00048
; LINE_WIDTH: 0.138761
G1 X144.999 Y127.457 E.00073
; LINE_WIDTH: 0.185217
G1 X144.891 Y127.287 E.00233
; WIPE_START
G1 X144.999 Y127.457 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.688 Y126.037 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105283
G1 F15000
G1 X144.784 Y126.253 E.0012
; WIPE_START
G1 X144.688 Y126.037 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.095 Y122.054 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0922442
G1 F15000
G2 X148.912 Y121.969 I-1.761 J3.54 E.00081
; WIPE_START
G1 X149.095 Y122.054 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.631 Y122.529 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104942
G1 F15000
G1 X150.527 Y122.451 E.00066
; LINE_WIDTH: 0.149812
G2 X150.238 Y122.242 I-4.015 J5.244 E.0031
; WIPE_START
G1 X150.527 Y122.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.622 Y123.331 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104628
G1 F15000
G1 X153.545 Y123.229 E.00064
; LINE_WIDTH: 0.137535
G1 X153.469 Y123.127 E.00098
; LINE_WIDTH: 0.177792
G1 X153.316 Y122.941 E.00266
; LINE_WIDTH: 0.225392
G1 X153.162 Y122.754 E.00359
; LINE_WIDTH: 0.262273
G1 X153.004 Y122.577 E.00424
; LINE_WIDTH: 0.298646
G2 X152.336 Y121.89 I-6.637 J5.783 E.01998
; LINE_WIDTH: 0.28973
G1 X152.159 Y121.731 E.00478
; LINE_WIDTH: 0.264218
G1 X151.983 Y121.572 E.00428
; LINE_WIDTH: 0.227993
G1 X151.796 Y121.419 E.00364
; LINE_WIDTH: 0.181059
G1 X151.609 Y121.266 E.00272
; LINE_WIDTH: 0.140231
G1 X151.502 Y121.185 E.00107
; LINE_WIDTH: 0.105522
G1 X151.394 Y121.104 E.00069
G1 X150.782 Y120.911 F30000
; LINE_WIDTH: 0.188296
G1 F15000
G1 X150.652 Y120.824 E.00186
; LINE_WIDTH: 0.144019
G1 X150.522 Y120.737 E.00129
; LINE_WIDTH: 0.103255
G1 X150.444 Y120.69 E.00045
; WIPE_START
G1 X150.522 Y120.737 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.91 Y121.294 Z3.4 F30000
G1 X110.582 Y123.659 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.210417
G1 F15000
G2 X109.631 Y122.708 I-5.89 J4.936 E.01838
; WIPE_START
G1 X110.241 Y123.28 E-.47232
G1 X110.582 Y123.659 E-.28768
; WIPE_END
G1 E-.04 F1800
G1 X105.849 Y129.647 Z3.4 F30000
G1 X105.762 Y129.757 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157382
G1 F15000
G1 X105.58 Y129.629 E.00208
; LINE_WIDTH: 0.13943
G1 X105.48 Y129.556 E.00097
; LINE_WIDTH: 0.105255
G1 X105.381 Y129.483 E.00063
; WIPE_START
G1 X105.48 Y129.556 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.606 Y130.896 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10551
G1 F15000
G1 X104.498 Y130.815 E.00069
; LINE_WIDTH: 0.140197
G1 X104.39 Y130.734 E.00107
; LINE_WIDTH: 0.180979
G1 X104.204 Y130.581 E.00272
; LINE_WIDTH: 0.227898
G1 X104.018 Y130.428 E.00364
; LINE_WIDTH: 0.264113
M73 P97 R0
G1 X103.841 Y130.269 E.00428
; LINE_WIDTH: 0.298863
G3 X103.154 Y129.6 I5.791 J-6.627 E.02
; LINE_WIDTH: 0.288338
G1 X102.996 Y129.423 E.00475
; LINE_WIDTH: 0.26218
G1 X102.838 Y129.246 E.00424
; LINE_WIDTH: 0.225308
G1 X102.684 Y129.059 E.00359
; LINE_WIDTH: 0.177718
G1 X102.531 Y128.873 E.00265
; LINE_WIDTH: 0.137481
G1 X102.455 Y128.771 E.00098
; LINE_WIDTH: 0.104611
G1 X102.379 Y128.669 E.00064
; WIPE_START
G1 X102.455 Y128.771 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.087 Y128.735 Z3.4 F30000
G1 X139.636 Y128.596 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0943603
G1 F15000
G2 X139.462 Y128.502 I-.602 J.91 E.00083
; WIPE_START
G1 X139.636 Y128.596 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147 Y130.603 Z3.4 F30000
G1 X149.933 Y131.402 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0995653
G1 F15000
G1 X149.771 Y131.484 E.00084
; WIPE_START
G1 X149.933 Y131.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.482 Y124.488 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157378
G1 F15000
G1 X152.354 Y124.305 E.00208
; LINE_WIDTH: 0.139423
G1 X152.281 Y124.205 E.00097
; LINE_WIDTH: 0.105248
G1 X152.208 Y124.106 E.00063
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X152.281 Y124.205 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20240528 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z3.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z103 F600
    G1 Z101

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0
;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N100
M1006 A49 B20 L100 C44 D20 M100 E41 F20 N100
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M960 S5 P0 ; turn off logo lamp
M73 P100 R0
; EXECUTABLE_BLOCK_END

