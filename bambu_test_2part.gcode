; HEADER_BLOCK_START
; BambuStudio 02.01.01.52
; model printing time: 5m 37s; total estimated time: 13m 59s
; total layer number: 15
; total filament length [mm] : 910.26
; total filament volume [cm^3] : 2189.42
; total filament weight [g] : 2.76
; model label id: 72,104
; filament_density: 1.26,1.32,1.04,1.32,1.26
; filament_diameter: 1.75,1.75,1.75,1.75,1.75
; max_z_height: 3.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,1,0,0
; additional_cooling_fan_speed = 70,70,0,70,70
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
; chamber_temperatures = 0,0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200,200
; close_fan_the_first_x_layers = 1,1,3,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70,70
; cool_plate_temp = 35,35,0,35,35
; cool_plate_temp_initial_layer = 35,35,0,35,35
; counter_coef_1 = 0,0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035,-0.035
; curr_bed_type = High Temp Plate
; default_acceleration = 10000
; default_filament_colour = ;;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,90,0,0
; eng_plate_temp_initial_layer = 0,0,90,0,0
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
; fan_cooling_layer_time = 100,100,30,100,100
; fan_max_speed = 100,100,60,100,100
; fan_min_speed = 100,100,10,100,100
; filament_adhesiveness_category = 100,100,200,100,100
; filament_change_length = 5,10,10,10,5
; filament_colour = #939393;#F99963;#000000;#BB3D43;#161616
; filament_cost = 24.99,24.99,24.99,24.99,24.99
; filament_density = 1.26,1.32,1.04,1.32,1.26
; filament_diameter = 1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.95,0.98,0.98
; filament_flush_temp = 0,0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0,0
; filament_ids = GFA00;GFA01;GFB00;GFA01;GFA00
; filament_is_support = 0,0,0,0,0
; filament_long_retractions_when_cut = 1,1,1,1,1
; filament_map = 1,1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21,22,16,22,21
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0,0
; filament_prime_volume = 30,45,45,45,30
; filament_printable = 3,3,3,3,3
; filament_ramming_travel_time = 0,0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1,-1
; filament_retraction_distances_when_cut = 18,18,18,18,18
; filament_scarf_gap = 0%,0%,0%,0%,0%
; filament_scarf_height = 10%,5%,10%,5%,10%
; filament_scarf_length = 10,10,10,10,10
; filament_scarf_seam_type = none,none,none,none,none
; filament_self_index = 1,2,3,4,5
; filament_settings_id = "Bambu PLA Basic @BBL X1C";"Bambu PLA Matte @BBL X1C";"Bambu ABS @BBL X1C";"Bambu PLA Matte @BBL X1C";"Bambu PLA Basic @BBL X1C"
; filament_shrink = 100%,100%,100%,100%,100%
; filament_soluble = 0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; Filament gcode\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;ABS;PLA;PLA
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,285,123,184,123,203,0,175,134,182,443,575,0,423,163,312,336,139,0,146,446,582,167,422,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55,90,55,55
; hot_plate_temp_initial_layer = 55,55,90,55,55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.8,6.6,7.4,6.6,13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
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
; long_retractions_when_ec = 0,0,0,0,0
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
; nozzle_temperature = 220,220,270,220,220
; nozzle_temperature_initial_layer = 220,220,260,220,220
; nozzle_temperature_range_high = 240,240,280,240,240
; nozzle_temperature_range_low = 190,190,240,190,190
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
; outer_wall_speed = 60
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,80,100,100
; overhang_fan_threshold = 50%,50%,25%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%,95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02,0.02
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
; print_settings_id = 0.20mm Strength @BBL X1C
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
; reduce_fan_stop_start_freq = 1,1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0,0
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
; skeleton_infill_density = 25%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 25%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1,1
; slow_down_layer_time = 4,4,12,4,4
; slow_down_min_speed = 20,20,20,20,20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 25%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,0,45,45
; supertack_plate_temp_initial_layer = 45,45,0,45,45
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
; temperature_vitrification = 45,45,100,45,45
; template_custom_gcode = 
; textured_plate_temp = 55,55,90,55,55
; textured_plate_temp_initial_layer = 55,55,90,55,55
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
; wall_loops = 6
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 216.972
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R13
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
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240

M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P4 R13
G1 E50 F200
M400
M104 S220
G92 E0
M73 P35 R9
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P37 R8
G1 E-0.5 F300

M73 P38 R8
G1 X70 F9000
M73 P39 R8
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
M73 P40 R8
G1 Z10
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
    G29 A X101.168 Y122.001 I53.5557 J27.4973
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
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
M73 P41 R8
G1 Z0.2
G0 E2 F300
G0 X240 E15 F1809.98
G0 Y11 E0.700 F452.496
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X231 E0.700 F1809.98
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

    G0 X48.0 E12.0 F1809.98
    G0 X48.0 Y14 E0.92 F1200.0
    G0 X35.0 Y6.0 E1.03 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E9.35441 F1809.98
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.040
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F452.496
    G1 X70.000 E0.31181 F452.496
    G1 X75.000 E0.31181 F1809.98
    G1 X80.000 E0.31181 F452.496
    G1 X85.000 E0.31181 F1809.98
    G1 X90.000 E0.31181 F452.496
M73 P42 R8
    G1 X95.000 E0.31181 F1809.98
    G1 X100.000 E0.31181 F452.496
    G1 X105.000 E0.31181 F1809.98
    G1 X110.000 E0.31181 F452.496
    G1 X115.000 E0.31181 F1809.98
    G1 X120.000 E0.31181 F452.496
    G1 X125.000 E0.31181 F1809.98
    G1 X130.000 E0.31181 F452.496
    G1 X135.000 E0.31181 F1809.98
    G1 X140.000 E0.31181 F452.496
M73 P43 R7
    G1 X145.000 E0.31181 F1809.98
    G1 X150.000 E0.31181 F452.496
    G1 X155.000 E0.31181 F1809.98
    G1 X160.000 E0.31181 F452.496
    G1 X165.000 E0.31181 F1809.98
    G1 X170.000 E0.31181 F452.496
    G1 X175.000 E0.31181 F1809.98
    G1 X180.000 E0.31181 F1809.98
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
    G1 X65.000 E1.24726 F452.496
    G1 X70.000 E0.31181 F452.496
    G1 X75.000 E0.31181 F1809.98
    G1 X80.000 E0.31181 F452.496
    G1 X85.000 E0.31181 F1809.98
    G1 X90.000 E0.31181 F452.496
    G1 X95.000 E0.31181 F1809.98
M73 P44 R7
    G1 X100.000 E0.31181 F452.496
    G1 X105.000 E0.31181 F1809.98
    G1 X110.000 E0.31181 F452.496
    G1 X115.000 E0.31181 F1809.98
    G1 X120.000 E0.31181 F452.496
    G1 X125.000 E0.31181 F1809.98
M73 P45 R7
    G1 X130.000 E0.31181 F452.496
    G1 X135.000 E0.31181 F1809.98
    G1 X140.000 E0.31181 F452.496
    G1 X145.000 E0.31181 F1809.98
    G1 X150.000 E0.31181 F452.496
    G1 X155.000 E0.31181 F1809.98
    G1 X160.000 E0.31181 F452.496
    G1 X165.000 E0.31181 F1809.98
    G1 X170.000 E0.31181 F452.496
    G1 X175.000 E0.31181 F1809.98
    G1 X180.000 E0.31181 F1809.98
M73 P46 R7
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.000
    G0 X45.000 F30000
    G0 Y12.000 F30000
M73 P47 R7
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F452.496
    G1 X70.000 E0.31181 F452.496
    G1 X75.000 E0.31181 F1809.98
    G1 X80.000 E0.31181 F452.496
    G1 X85.000 E0.31181 F1809.98
    G1 X90.000 E0.31181 F452.496
    G1 X95.000 E0.31181 F1809.98
    G1 X100.000 E0.31181 F452.496
    G1 X105.000 E0.31181 F1809.98
    G1 X110.000 E0.31181 F452.496
    G1 X115.000 E0.31181 F1809.98
    G1 X120.000 E0.31181 F452.496
    G1 X125.000 E0.31181 F1809.98
    G1 X130.000 E0.31181 F452.496
    G1 X135.000 E0.31181 F1809.98
    G1 X140.000 E0.31181 F452.496
M73 P48 R7
    G1 X145.000 E0.31181 F1809.98
    G1 X150.000 E0.31181 F452.496
    G1 X155.000 E0.31181 F1809.98
    G1 X160.000 E0.31181 F452.496
    G1 X165.000 E0.31181 F1809.98
    G1 X170.000 E0.31181 F452.496
    G1 X175.000 E0.31181 F1809.98
    G1 X180.000 E0.31181 F1809.98
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3

    G0 X45.000 F30000 ; move to start point

M623 ; end of "draw extrinsic para cali paint"


M1002 judge_flag extrude_cali_flag
M622 J0
    G0 X231 Y1.5 F30000
    G0 X18 E14.3 F1809.98
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
    M980.3 A70.000 B28.2332 C5.000 D112.933 E5.000 F175.000 H1.000 I0.000 J0.020 K0.040
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
    G1 X65.000 E1.24726 F452.496
    G1 X70.000 E0.31181 F452.496
    G1 X75.000 E0.31181 F1809.98
    G1 X80.000 E0.31181 F452.496
    G1 X85.000 E0.31181 F1809.98
    G1 X90.000 E0.31181 F452.496
M73 P49 R7
    G1 X95.000 E0.31181 F1809.98
    G1 X100.000 E0.31181 F452.496
    G1 X105.000 E0.31181 F1809.98
    G1 X110.000 E0.31181 F452.496
    G1 X115.000 E0.31181 F1809.98
    G1 X120.000 E0.31181 F452.496
    G1 X125.000 E0.31181 F1809.98
    G1 X130.000 E0.31181 F452.496
    G1 X135.000 E0.31181 F1809.98

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.02 M0.0376442
    M623

    G1 X140.000 E0.31181 F452.496
    G1 X145.000 E0.31181 F1809.98
    G1 X150.000 E0.31181 F452.496
    G1 X155.000 E0.31181 F1809.98
    G1 X160.000 E0.31181 F452.496
    G1 X165.000 E0.31181 F1809.98
    G1 X170.000 E0.31181 F452.496
    G1 X175.000 E0.31181 F1809.98
    G1 X180.000 E0.31181 F452.496
    G1 X185.000 E0.31181 F1809.98
M73 P50 R6
    G1 X190.000 E0.31181 F452.496
    G1 X195.000 E0.31181 F1809.98
    G1 X200.000 E0.31181 F452.496
    G1 X205.000 E0.31181 F1809.98
    G1 X210.000 E0.31181 F452.496
    G1 X215.000 E0.31181 F1809.98
    G1 X220.000 E0.31181 F452.496
    G1 X225.000 E0.31181 F1809.98
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
G0 X239 E15 F1809.98
G0 Y12 E0.7 F452.496
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
; object ids of layer 1 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer1 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X140.29 Y125.581
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X142.184 Y124.883 E.0752
G2 X142.186 Y127.118 I6.908 J1.114 E.08364
G1 X140.009 Y126.315 E.08644
G1 X115.991 Y126.315 E.89456
G1 X113.815 Y127.118 E.08638
M73 P51 R6
G2 X113.814 Y124.882 I-6.913 J-1.114 E.08366
G1 X115.991 Y125.685 E.08644
G1 X140.008 Y125.685 E.89455
G1 X140.234 Y125.602 E.00896
M204 S6000
G1 X140.151 Y125.146 F30000
G1 F3000
M204 S500
G1 X142.815 Y124.163 E.10576
G2 X142.815 Y127.838 I6.287 J1.837 E.13875
G1 X139.927 Y126.772 E.11467
G1 X116.073 Y126.772 E.88848
G1 X113.185 Y127.838 E.11467
G2 X113.185 Y124.162 I-6.289 J-1.838 E.13878
G1 X116.073 Y125.228 E.11467
G1 X139.927 Y125.228 E.88846
G1 X140.095 Y125.166 E.00667
M204 S6000
G1 X139.667 Y124.771 F30000
G1 F3000
M204 S500
G1 X139.845 Y124.771 E.00662
G1 X143.631 Y123.375 E.15028
G2 X143.631 Y128.627 I5.231 J2.625 E.20285
G1 X139.845 Y127.229 E.15031
G1 X116.155 Y127.229 E.88239
G1 X112.369 Y128.627 E.15031
G2 X112.369 Y123.373 I-5.231 J-2.626 E.2029
M73 P52 R6
G1 X116.155 Y124.771 E.15031
G1 X139.607 Y124.771 E.87353
M204 S6000
G1 X139.873 Y124.274 F30000
G1 F3000
M204 S500
G1 X144.464 Y122.58 E.18228
G1 X144.587 Y122.743 E.00759
M73 P53 R6
G2 X144.588 Y129.259 I4.17 J3.257 E.26145
G1 X144.465 Y129.422 E.00759
G1 X139.764 Y127.686 E.18668
G1 X116.236 Y127.686 E.87631
G1 X111.535 Y129.422 E.18668
G1 X111.412 Y129.259 E.00759
G2 X111.412 Y122.741 I-4.169 J-3.259 E.26154
G1 X111.535 Y122.578 E.00759
G1 X116.236 Y124.314 E.18667
G1 X139.763 Y124.314 E.8763
G1 X139.816 Y124.295 E.0021
; WIPE_START
M73 P54 R6
G1 X141.693 Y123.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.226 Y125.184 Z.6 F30000
M73 P56 R6
G1 X107.904 Y130.76 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X107.694 Y130.784 E.00789
G3 X107.065 Y121.197 I-.418 J-4.787 E.57001
G3 X107.482 Y121.197 I.21 J5.623 E.01551
G3 X108.142 Y130.724 I-.206 J4.801 E.52211
M73 P57 R6
G1 X107.963 Y130.751 E.00673
M204 S6000
G1 X107.502 Y130.335 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P57 R5
G1 X107.275 Y130.346 E.00846
G3 X107.085 Y121.654 I0 J-4.348 E.50169
G3 X107.463 Y121.654 I.19 J5.11 E.01408
G3 X107.844 Y130.309 I-.188 J4.344 E.48054
G1 X107.562 Y130.331 E.01053
; WIPE_START
G1 X107.275 Y130.346 E-.10911
G1 X106.709 Y130.313 E-.21562
G1 X106.334 Y130.247 E-.1447
G1 X105.967 Y130.149 E-.1442
G1 X105.61 Y130.019 E-.14428
G1 X105.605 Y130.017 E-.0021
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X113.08 Y128.472 Z.6 F30000
G1 X148.08 Y121.237 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P58 R5
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
M73 P59 R5
G1 X150.011 Y121.845 E-.13536
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.517 Y123.297 Z.6 F30000
G1 X139.627 Y123.857 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X139.682 Y123.857 E.00205
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
M73 P60 R5
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
G1 X139.91 Y125.939 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117299
G1 F3000
M204 S500
G1 X139.8 Y125.958 E.00068
; LINE_WIDTH: 0.152545
G1 X139.765 Y125.979 E.00037
; LINE_WIDTH: 0.180473
G1 X139.73 Y126 E.00046
G1 X139.8 Y126.042 E.00092
; LINE_WIDTH: 0.117427
G1 X139.911 Y126.061 E.00068
M204 S6000
G1 X139.73 Y126 F30000
; LINE_WIDTH: 0.21518
G1 F3000
M204 S500
G1 X116.27 Y126 E.3293
; LINE_WIDTH: 0.194335
G1 X116.235 Y125.979 E.00051
; LINE_WIDTH: 0.152645
G1 X116.199 Y125.958 E.00037
; LINE_WIDTH: 0.11736
G1 X116.089 Y125.939 E.00068
; WIPE_START
G1 X116.199 Y125.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.215 Y125.224 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56868
G1 F6300
M204 S500
G1 X115.188 Y126.197 E.05895
G1 X114.645 Y126.398 E.0248
G1 X114.087 Y125.84 E.0338
; WIPE_START
G1 X114.645 Y126.398 E-.29982
G1 X115.188 Y126.197 E-.21997
G1 X114.741 Y125.75 E-.2402
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.29 Y122.523 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.399495
G1 F3000
M204 S500
G1 X110.265 Y121.866 E.03537
M204 S6000
G1 X110.199 Y121.869 F30000
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
; WIPE_START
G1 X110.763 Y122.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.29 Y129.477 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.399494
G1 F3000
M204 S500
G1 X110.263 Y130.135 E.03545
M204 S6000
G1 X110.199 Y130.131 F30000
; LINE_WIDTH: 0.126006
G1 F3000
M204 S500
G1 X110.372 Y130.038 E.00133
; LINE_WIDTH: 0.167284
G1 X110.471 Y129.982 E.00115
; LINE_WIDTH: 0.203403
G1 X110.568 Y129.927 E.00145
; LINE_WIDTH: 0.242253
G1 X110.667 Y129.868 E.00188
; LINE_WIDTH: 0.283634
G1 X110.763 Y129.811 E.00219
; LINE_WIDTH: 0.305098
G1 X111.296 Y129.486 E.01335
; WIPE_START
G1 X110.763 Y129.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.343 Y128.919 Z.6 F30000
G1 X141.912 Y126.146 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56177
G1 F6300
M204 S500
M73 P61 R5
G1 X141.366 Y125.599 E.0327
G1 X140.83 Y125.796 E.02416
G1 X141.823 Y126.79 E.05939
; WIPE_START
G1 X140.83 Y125.796 E-.53379
G1 X141.366 Y125.599 E-.21711
G1 X141.383 Y125.616 E-.0091
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.71 Y129.477 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.399182
G1 F3000
M204 S500
G1 X145.735 Y130.134 E.03534
M204 S6000
G1 X145.801 Y130.131 F30000
; LINE_WIDTH: 0.126272
G1 F3000
M204 S500
G1 X145.626 Y130.037 E.00135
; LINE_WIDTH: 0.167665
G1 X145.529 Y129.982 E.00113
; LINE_WIDTH: 0.204086
G1 X145.429 Y129.925 E.00152
; LINE_WIDTH: 0.24306
G1 X145.333 Y129.868 E.00182
; LINE_WIDTH: 0.301994
G3 X144.703 Y129.486 I17.603 J-29.687 E.01554
; WIPE_START
G1 X145.333 Y129.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.709 Y122.525 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.397824
G1 F3000
M204 S500
G1 X145.737 Y121.867 E.0353
M204 S6000
G1 X145.796 Y121.873 F30000
; LINE_WIDTH: 0.125435
G1 F3000
M204 S500
G1 X145.626 Y121.964 E.00129
; LINE_WIDTH: 0.16599
G1 X145.53 Y122.019 E.00112
; LINE_WIDTH: 0.202407
G1 X145.429 Y122.075 E.0015
; LINE_WIDTH: 0.24139
G1 X145.333 Y122.133 E.00181
; LINE_WIDTH: 0.300393
G2 X144.702 Y122.516 I16.797 J28.347 E.01549
; OBJECT_ID: 104
; WIPE_START
G1 X145.333 Y122.133 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
M204 S6000
G1 X143.331 Y129.498 Z.6 F30000
G1 X140.182 Y141.081 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X142.076 Y140.382 E.0752
G2 X142.077 Y142.618 I6.908 J1.114 E.08364
G1 X139.9 Y141.814 E.08644
G1 X115.883 Y141.814 E.89456
G1 X113.707 Y142.617 E.08638
G2 X113.706 Y140.381 I-6.913 J-1.114 E.08366
G1 X115.883 Y141.185 E.08644
G1 X139.9 Y141.185 E.89455
G1 X140.125 Y141.102 E.00896
M204 S6000
G1 X140.043 Y140.645 F30000
G1 F3000
M204 S500
G1 X142.706 Y139.662 E.10576
G2 X142.707 Y143.338 I6.287 J1.837 E.13875
G1 X139.819 Y142.271 E.11467
G1 X115.964 Y142.271 E.88848
G1 X113.076 Y143.338 E.11467
G2 X113.076 Y139.662 I-6.289 J-1.838 E.13878
G1 X115.964 Y140.728 E.11467
G1 X139.818 Y140.728 E.88846
G1 X139.986 Y140.666 E.00667
M204 S6000
G1 X139.559 Y140.271 F30000
G1 F3000
M204 S500
G1 X139.737 Y140.271 E.00662
G1 X143.522 Y138.874 E.15028
G2 X143.523 Y144.126 I5.231 J2.625 E.20285
G1 X139.737 Y142.728 E.15031
G1 X116.046 Y142.728 E.88239
G1 X112.26 Y144.126 E.15031
G2 X112.26 Y138.873 I-5.231 J-2.626 E.2029
G1 X116.046 Y140.271 E.15031
G1 X139.499 Y140.271 E.87353
M204 S6000
G1 X139.764 Y139.773 F30000
G1 F3000
M204 S500
G1 X144.356 Y138.08 E.18228
G1 X144.478 Y138.242 E.00759
G2 X144.48 Y144.758 I4.17 J3.257 E.26145
G1 X144.357 Y144.921 E.00759
G1 X139.655 Y143.185 E.18668
G1 X116.128 Y143.185 E.87631
G1 X111.426 Y144.921 E.18668
G1 X111.303 Y144.758 E.00759
G2 X111.303 Y138.241 I-4.169 J-3.259 E.26154
G1 X111.426 Y138.078 E.00759
G1 X116.128 Y139.814 E.18667
G1 X139.655 Y139.814 E.8763
G1 X139.708 Y139.794 E.0021
; WIPE_START
G1 X141.584 Y139.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X134.118 Y140.684 Z.6 F30000
G1 X107.796 Y146.26 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X107.585 Y146.284 E.00789
G3 X106.957 Y136.697 I-.418 J-4.787 E.57001
G3 X107.373 Y136.697 I.21 J5.623 E.01551
G3 X108.033 Y146.223 I-.206 J4.801 E.52211
G1 X107.855 Y146.251 E.00673
M204 S6000
G1 X107.393 Y145.835 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X107.166 Y145.845 E.00846
G3 X106.977 Y137.154 I0 J-4.348 E.50169
G3 X107.355 Y137.153 I.19 J5.11 E.01408
G3 X107.735 Y145.808 I-.188 J4.344 E.48054
G1 X107.453 Y145.83 E.01053
; WIPE_START
G1 X107.166 Y145.845 E-.10911
G1 X106.6 Y145.813 E-.21562
G1 X106.225 Y145.747 E-.1447
G1 X105.858 Y145.648 E-.1442
G1 X105.502 Y145.518 E-.14428
G1 X105.497 Y145.516 E-.0021
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.971 Y143.971 Z.6 F30000
G1 X147.972 Y136.736 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X147.989 Y136.733 E.00066
G3 X148.407 Y136.697 I.628 J4.764 E.01563
G3 X148.823 Y136.697 I.21 J5.622 E.01551
M73 P62 R5
G3 X147.576 Y136.806 I-.206 J4.801 E1.07773
G1 X147.913 Y136.747 E.01273
M204 S6000
G1 X147.984 Y137.198 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X148.049 Y137.187 E.00246
G3 X148.427 Y137.154 I.568 J4.311 E.01414
G3 X148.805 Y137.153 I.19 J5.11 E.01408
G3 X147.675 Y137.253 I-.188 J4.344 E.97518
G1 X147.925 Y137.209 E.00944
; WIPE_START
G1 X148.049 Y137.187 E-.04785
G1 X148.427 Y137.154 E-.14422
G1 X148.805 Y137.153 E-.14365
G1 X149.184 Y137.187 E-.14473
G1 X149.558 Y137.253 E-.14419
G1 X149.902 Y137.345 E-.13536
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.409 Y138.797 Z.6 F30000
G1 X139.518 Y139.357 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X139.573 Y139.357 E.00205
G1 X146.983 Y136.623 E.29415
G3 X148.734 Y136.358 I1.684 J5.211 E.06628
G3 X146.755 Y146.294 I-.122 J5.141 E.6679
G1 X139.574 Y143.642 E.28514
G1 X116.209 Y143.642 E.87022
G1 X109.029 Y146.293 E.28509
G3 X109.028 Y136.705 I-1.861 J-4.794 E.74359
G1 X116.209 Y139.357 E.28514
G1 X139.458 Y139.357 E.86593
M204 S6000
G1 X139.515 Y138.891 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X146.835 Y136.19 E.29061
G3 X148.745 Y135.901 I1.836 J5.675 E.07226
G3 X146.599 Y146.723 I-.133 J5.598 E.72691
G1 X139.492 Y144.1 E.28217
G1 X116.291 Y144.1 E.86414
G1 X109.185 Y146.723 E.28214
G3 X109.184 Y136.276 I-2.017 J-5.224 E.80895
G1 X116.291 Y138.9 E.28217
G1 X139.457 Y138.9 E.86283
; WIPE_START
G1 X141.334 Y138.21 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X139.802 Y141.438 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.117299
G1 F3000
M204 S500
G1 X139.692 Y141.458 E.00068
; LINE_WIDTH: 0.152545
G1 X139.656 Y141.479 E.00037
; LINE_WIDTH: 0.180473
G1 X139.621 Y141.5 E.00046
G1 X139.692 Y141.541 E.00092
; LINE_WIDTH: 0.117427
G1 X139.802 Y141.561 E.00068
M204 S6000
G1 X139.621 Y141.5 F30000
; LINE_WIDTH: 0.21518
G1 F3000
M204 S500
G1 X116.162 Y141.5 E.3293
; LINE_WIDTH: 0.194335
G1 X116.126 Y141.479 E.00051
; LINE_WIDTH: 0.152645
G1 X116.091 Y141.458 E.00037
; LINE_WIDTH: 0.11736
G1 X115.98 Y141.438 E.00068
; WIPE_START
G1 X116.091 Y141.458 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X114.106 Y140.724 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56868
G1 F6300
M204 S500
G1 X115.079 Y141.697 E.05895
G1 X114.536 Y141.897 E.0248
G1 X113.978 Y141.339 E.0338
; WIPE_START
G1 X114.536 Y141.897 E-.29982
G1 X115.079 Y141.697 E-.21997
G1 X114.632 Y141.25 E-.2402
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.181 Y138.023 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.399495
G1 F3000
M204 S500
M73 P63 R5
G1 X110.156 Y137.365 E.03537
M204 S6000
G1 X110.091 Y137.369 F30000
; LINE_WIDTH: 0.12598
G1 F3000
M204 S500
G1 X110.263 Y137.461 E.00133
; LINE_WIDTH: 0.167261
G1 X110.362 Y137.517 E.00115
; LINE_WIDTH: 0.203419
G1 X110.459 Y137.572 E.00146
; LINE_WIDTH: 0.242271
G1 X110.559 Y137.631 E.00188
; LINE_WIDTH: 0.283649
G1 X110.655 Y137.688 E.00219
; LINE_WIDTH: 0.305114
G1 X111.188 Y138.014 E.01335
; WIPE_START
G1 X110.655 Y137.688 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.181 Y144.976 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.399494
G1 F3000
M204 S500
G1 X110.154 Y145.635 E.03545
M204 S6000
G1 X110.091 Y145.63 F30000
; LINE_WIDTH: 0.126006
G1 F3000
M204 S500
G1 X110.264 Y145.537 E.00133
; LINE_WIDTH: 0.167284
G1 X110.362 Y145.482 E.00115
; LINE_WIDTH: 0.203403
G1 X110.459 Y145.427 E.00145
; LINE_WIDTH: 0.242253
G1 X110.559 Y145.368 E.00188
; LINE_WIDTH: 0.283634
G1 X110.655 Y145.311 E.00219
; LINE_WIDTH: 0.305098
G1 X111.188 Y144.985 E.01335
; WIPE_START
G1 X110.655 Y145.311 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X118.235 Y144.419 Z.6 F30000
G1 X141.804 Y141.645 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.56177
G1 F6300
M204 S500
G1 X141.257 Y141.098 E.0327
G1 X140.721 Y141.296 E.02416
G1 X141.714 Y142.289 E.05939
; WIPE_START
G1 X140.721 Y141.296 E-.53379
G1 X141.257 Y141.098 E-.21711
G1 X141.274 Y141.115 E-.0091
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.602 Y144.976 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.399182
G1 F3000
M204 S500
G1 X145.627 Y145.634 E.03534
M204 S6000
G1 X145.692 Y145.63 F30000
; LINE_WIDTH: 0.126272
G1 F3000
M204 S500
G1 X145.517 Y145.536 E.00135
; LINE_WIDTH: 0.167665
G1 X145.421 Y145.482 E.00113
; LINE_WIDTH: 0.204086
G1 X145.32 Y145.425 E.00152
; LINE_WIDTH: 0.24306
G1 X145.224 Y145.368 E.00182
; LINE_WIDTH: 0.301994
G3 X144.595 Y144.985 I17.603 J-29.687 E.01554
; WIPE_START
G1 X145.224 Y145.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.6 Y138.024 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.397824
G1 F3000
M204 S500
G1 X145.628 Y137.366 E.0353
M204 S6000
G1 X145.687 Y137.372 F30000
; LINE_WIDTH: 0.125435
G1 F3000
M204 S500
G1 X145.518 Y137.463 E.00129
; LINE_WIDTH: 0.16599
G1 X145.421 Y137.518 E.00112
; LINE_WIDTH: 0.202407
G1 X145.321 Y137.575 E.0015
; LINE_WIDTH: 0.24139
G1 X145.225 Y137.632 E.00181
; LINE_WIDTH: 0.300393
G2 X144.594 Y138.016 I16.797 J28.347 E.01549
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X145.225 Y137.632 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
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
; object ids of layer 2 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer2 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X143.058 Y124.075
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.948 Y124.452 E.013
G2 X143.055 Y127.924 I5.888 J1.557 E.11687
G1 X139.927 Y126.77 E.11059
G1 X116.072 Y126.77 E.79131
G1 X112.942 Y127.925 E.1107
G2 X112.945 Y124.076 I-5.887 J-1.93 E.12985
G1 X116.072 Y125.23 E.11059
M73 P64 R5
G1 X139.927 Y125.23 E.7913
G1 X143.001 Y124.096 E.10869
; WIPE_START
G1 X142.948 Y124.452 E-.13664
G1 X142.835 Y124.961 E-.19806
G1 X142.768 Y125.464 E-.19312
G1 X142.754 Y126.075 E-.23218
; WIPE_END
G1 E-.04 F1800
G1 X139.636 Y124.823 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X139.855 Y124.823 E.00724
G1 X143.812 Y123.363 E.13994
G2 X143.813 Y128.638 I4.974 J2.637 E.18211
G1 X139.855 Y127.177 E.13996
G1 X116.145 Y127.177 E.78649
G1 X112.187 Y128.638 E.13996
G2 X112.187 Y123.362 I-4.974 J-2.638 E.18215
G1 X116.145 Y124.823 E.13996
G1 X139.576 Y124.823 E.77725
G1 X139.618 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00543
G1 X144.557 Y122.654 E.16885
G1 X144.667 Y122.799 E.00602
G2 X144.672 Y129.2 I4.062 J3.197 E.22896
G1 X144.563 Y129.349 E.00612
G1 X139.782 Y127.584 E.16907
G1 X116.218 Y127.584 E.78166
G1 X111.441 Y129.347 E.16891
G1 X111.332 Y129.202 E.00602
G2 X111.332 Y122.798 I-4.089 J-3.202 E.22893
G1 X111.441 Y122.653 E.00602
G1 X116.218 Y124.416 E.16891
G1 X139.558 Y124.416 E.77424
G1 X139.6 Y124.009 F30000
G1 F15476.087
G1 X139.709 Y124.009 E.00361
G1 X146.752 Y121.411 E.24903
G1 X146.841 Y121.63 E.00786
G2 X146.87 Y130.382 I1.89 J4.37 E.36824
G1 X146.781 Y130.602 E.00786
G1 X139.709 Y127.991 E.25005
G1 X116.291 Y127.991 E.77683
G1 X109.219 Y130.602 E.25007
G1 X109.13 Y130.382 E.00786
G2 X109.131 Y121.618 I-1.861 J-4.382 E.36928
G1 X109.219 Y121.398 E.00786
G1 X116.291 Y124.009 E.25005
G1 X139.54 Y124.009 E.77122
; WIPE_START
G1 X139.709 Y124.009 E-.0642
G1 X141.427 Y123.375 E-.6958
; WIPE_END
G1 E-.04 F1800
G1 X133.951 Y124.915 Z.8 F30000
G1 X107.631 Y130.336 Z.8
G1 Z.4
G1 E.8 F1800
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
G1 X113.101 Y128.187 Z.8 F30000
M73 P64 R4
G1 X148.177 Y121.684 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.61 Y121.65 E.01441
G3 X149.105 Y121.664 I.115 J4.679 E.01643
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
G1 X142.482 Y123.234 Z.8 F30000
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
G1 F3600
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
G1 X141.05 Y126 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.34892
G1 F15000
G1 X141.64 Y126.218 E.01568
G1 X141.65 Y125.779 E.01095
G1 X141.106 Y125.979 E.01445
G1 X139.964 Y126 F30000
; LINE_WIDTH: 0.420143
G1 F15000
G1 X140.16 Y126.035 E.00612
G1 X142.027 Y126.725 E.06118
G3 X142.017 Y125.279 I8.181 J-.781 E.04449
G1 X140.159 Y125.965 E.06085
G1 X140.023 Y125.989 E.00426
G1 X139.964 Y125.622 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.036 Y125.622 E.7352
G1 X113.51 Y124.702 E.08261
G3 X113.509 Y127.298 I-6.304 J1.296 E.08032
G1 X116.036 Y126.378 E.08264
G1 X139.964 Y126.378 E.73521
G1 X142.49 Y127.298 E.08261
G1 X142.359 Y126.29 E.03123
G1 X142.376 Y125.444 E.02599
G3 X142.491 Y124.702 I4.403 J.301 E.02309
G1 X140.023 Y125.612 E.08082
G1 X115.987 Y126 F30000
; LINE_WIDTH: 0.421045
G1 F15000
G1 X139.904 Y126 E.73695
G1 X115.987 Y126 F30000
; LINE_WIDTH: 0.420875
G1 F15000
G1 X115.84 Y125.966 E.00465
G2 X113.983 Y125.279 I-264.06 J710.566 E.06099
G3 X113.983 Y126.721 I-7.556 J.726 E.04449
G3 X115.928 Y126.014 I23.568 J61.752 E.06374
G1 X114.555 Y125.934 F30000
; LINE_WIDTH: 0.6492
G1 F10391.239
G2 X114.563 Y126.052 I-.035 J.061 E.015
G1 X110.315 Y129.98 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.335595
G1 F15000
G1 X111.224 Y129.397 E.02573
G1 X111.231 Y129.407 F30000
; LINE_WIDTH: 0.24328
G1 F15000
G1 X110.694 Y129.734 E.01027
; LINE_WIDTH: 0.222393
G1 X110.599 Y129.79 E.00161
; LINE_WIDTH: 0.181846
G1 X110.502 Y129.848 E.00128
; LINE_WIDTH: 0.145266
G1 X110.403 Y129.904 E.00095
; LINE_WIDTH: 0.11304
G1 X110.304 Y129.96 E.00065
G1 X108.989 Y130.576 F30000
; LINE_WIDTH: 0.681315
G1 F9868.511
G3 X108.988 Y121.426 I-1.7 J-4.575 E.97823
G1 X110.304 Y122.04 F30000
; LINE_WIDTH: 0.113023
G1 F15000
G1 X110.403 Y122.096 E.00065
; LINE_WIDTH: 0.145237
G1 X110.502 Y122.152 E.00095
; LINE_WIDTH: 0.181839
G1 X110.599 Y122.21 E.00128
; LINE_WIDTH: 0.222428
G1 X110.694 Y122.266 E.00161
; LINE_WIDTH: 0.243333
G1 X111.231 Y122.594 E.01027
G1 X111.224 Y122.602 F30000
; LINE_WIDTH: 0.335519
G1 F15000
G1 X110.315 Y122.021 E.02573
; WIPE_START
G1 X111.224 Y122.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.856 Y122.474 Z.8 F30000
G1 X145.681 Y122.024 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.333952
G1 F15000
G1 X144.775 Y122.604 E.02552
G1 X144.768 Y122.595 F30000
; LINE_WIDTH: 0.238659
G1 F15000
G3 X145.401 Y122.21 I17.618 J28.271 E.01182
; LINE_WIDTH: 0.180664
G1 X145.496 Y122.154 E.00124
; LINE_WIDTH: 0.144368
G1 X145.595 Y122.098 E.00094
; LINE_WIDTH: 0.112622
G1 X145.692 Y122.043 E.00063
G1 X147.104 Y121.736 F30000
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
G1 X145.696 Y129.96 F30000
; LINE_WIDTH: 0.112995
G1 F15000
G1 X145.597 Y129.904 E.00065
; LINE_WIDTH: 0.145528
G1 X145.496 Y129.847 E.00097
; LINE_WIDTH: 0.182198
G1 X145.401 Y129.79 E.00125
; LINE_WIDTH: 0.240123
G3 X144.772 Y129.409 I19.996 J-33.707 E.01182
G1 X144.779 Y129.399 F30000
; LINE_WIDTH: 0.335576
M73 P65 R4
G1 F15000
G1 X145.685 Y129.979 E.02565
; OBJECT_ID: 104
; WIPE_START
G1 X144.779 Y129.399 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X143.428 Y136.911 Z.8 F30000
G1 X142.949 Y139.575 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.839 Y139.951 E.013
G2 X142.946 Y143.424 I5.888 J1.557 E.11687
G1 X139.819 Y142.269 E.11059
G1 X115.964 Y142.269 E.79131
G1 X112.833 Y143.425 E.1107
G2 X112.837 Y139.575 I-5.887 J-1.93 E.12985
G1 X115.964 Y140.73 E.11059
G1 X139.819 Y140.73 E.7913
G1 X142.893 Y139.596 E.10869
; WIPE_START
G1 X142.839 Y139.951 E-.13664
G1 X142.727 Y140.46 E-.19806
G1 X142.659 Y140.964 E-.19312
G1 X142.645 Y141.575 E-.23218
; WIPE_END
G1 E-.04 F1800
G1 X139.528 Y140.323 Z.8 F30000
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X139.746 Y140.323 E.00724
G1 X143.704 Y138.863 E.13994
G2 X143.704 Y144.138 I4.974 J2.637 E.18211
G1 X139.746 Y142.676 E.13996
G1 X116.037 Y142.676 E.78649
G1 X112.079 Y144.138 E.13996
G2 X112.079 Y138.861 I-4.974 J-2.638 E.18215
G1 X116.037 Y140.323 E.13996
G1 X139.468 Y140.323 E.77725
G1 X139.51 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00543
G1 X144.449 Y138.154 E.16885
G1 X144.558 Y138.299 E.00602
G2 X144.564 Y144.7 I4.062 J3.197 E.22896
G1 X144.455 Y144.849 E.00612
G1 X139.673 Y143.083 E.16907
G1 X116.109 Y143.083 E.78166
G1 X111.333 Y144.847 E.16891
G1 X111.223 Y144.702 E.00602
G2 X111.223 Y138.297 I-4.089 J-3.202 E.22893
G1 X111.333 Y138.152 E.00602
G1 X116.109 Y139.916 E.16891
G1 X139.45 Y139.916 E.77424
G1 X139.492 Y139.509 F30000
G1 F15476.087
G1 X139.601 Y139.509 E.00361
G1 X146.644 Y136.91 E.24903
G1 X146.733 Y137.13 E.00786
G2 X146.761 Y145.882 I1.89 J4.37 E.36824
G1 X146.672 Y146.101 E.00786
G1 X139.601 Y143.49 E.25005
G1 X116.182 Y143.49 E.77683
G1 X109.11 Y146.101 E.25007
G1 X109.021 Y145.882 E.00786
G2 X109.022 Y137.117 I-1.861 J-4.382 E.36928
G1 X109.111 Y136.898 E.00786
G1 X116.182 Y139.509 E.25005
G1 X139.432 Y139.509 E.77122
; WIPE_START
G1 X139.601 Y139.509 E-.0642
G1 X141.318 Y138.875 E-.6958
; WIPE_END
G1 E-.04 F1800
G1 X133.843 Y140.415 Z.8 F30000
G1 X107.522 Y145.836 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X106.977 Y145.846 E.01809
G3 X107.051 Y137.15 I.198 J-4.347 E.44277
G3 X107.546 Y137.164 I.115 J4.679 E.01643
G3 X107.582 Y145.832 I-.371 J4.336 E.42765
G1 X107.37 Y145.448 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X106.994 Y145.455 E.01157
G3 X107.066 Y137.542 I.181 J-3.955 E.3733
G3 X107.512 Y137.555 I.101 J4.245 E.01371
G3 X107.512 Y145.444 I-.337 J3.945 E.36146
G1 X107.43 Y145.446 E.0025
; WIPE_START
M204 S10000
G1 X106.994 Y145.455 E-.16592
G1 X106.578 Y145.415 E-.15862
G1 X106.309 Y145.366 E-.10388
G1 X105.976 Y145.276 E-.13127
G1 X105.651 Y145.158 E-.1313
G1 X105.488 Y145.078 E-.069
; WIPE_END
G1 E-.04 F1800
G1 X112.993 Y143.686 Z.8 F30000
G1 X148.068 Y137.183 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.501 Y137.15 E.01441
G3 X148.996 Y137.164 I.115 J4.679 E.01643
G3 X148.009 Y137.192 I-.371 J4.336 E.87411
G1 X148.034 Y137.585 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X148.1 Y137.575 E.00204
G3 X148.516 Y137.542 I.525 J3.924 E.01283
G3 X148.962 Y137.555 I.101 J4.244 E.01371
G3 X147.76 Y137.636 I-.337 J3.945 E.72725
G1 X147.975 Y137.596 E.00672
; WIPE_START
M204 S10000
G1 X148.1 Y137.575 E-.04804
G1 X148.516 Y137.542 E-.15858
G1 X148.962 Y137.555 E-.16952
G1 X149.304 Y137.6 E-.13122
G1 X149.807 Y137.723 E-.19684
G1 X149.945 Y137.773 E-.05579
; WIPE_END
G1 E-.04 F1800
G1 X142.373 Y138.734 Z.8 F30000
G1 X139.474 Y139.102 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.528 Y139.102 E.0018
G1 X146.9 Y136.382 E.26067
G3 X148.724 Y136.103 I1.768 J5.465 E.06145
G3 X146.666 Y146.533 I-.111 J5.396 E.62478
G1 X139.528 Y143.897 E.2524
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.117 Y136.466 I-1.949 J-5.034 E.69479
G1 X116.255 Y139.102 E.25242
G1 X139.414 Y139.102 E.76821
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.011 E.23962
G3 X148.732 Y135.711 I1.898 J5.862 E.06114
G3 X146.533 Y146.902 I-.12 J5.788 E.62048
G1 X139.458 Y144.29 E.23173
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23173
G3 X109.251 Y136.098 I-2.083 J-5.402 E.68983
G1 X116.325 Y138.71 E.23172
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.941 Y141.5 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.34892
G1 F15000
G1 X141.531 Y141.717 E.01568
G1 X141.541 Y141.278 E.01095
G1 X140.998 Y141.479 E.01445
G1 X139.855 Y141.5 F30000
; LINE_WIDTH: 0.420143
G1 F15000
G1 X140.051 Y141.535 E.00612
G1 X141.918 Y142.224 E.06118
G3 X141.908 Y140.779 I8.181 J-.781 E.04449
G1 X140.051 Y141.464 E.06085
G1 X139.914 Y141.489 E.00426
G1 X139.855 Y141.122 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X115.928 Y141.122 E.7352
G1 X113.401 Y140.202 E.08261
G3 X113.401 Y142.798 I-6.304 J1.296 E.08032
G1 X115.928 Y141.877 E.08264
G1 X139.855 Y141.877 E.73521
G1 X142.382 Y142.797 E.08261
G1 X142.25 Y141.79 E.03123
G1 X142.268 Y140.944 E.02599
G3 X142.382 Y140.202 I4.403 J.301 E.02309
G1 X139.914 Y141.111 E.08082
G1 X115.878 Y141.5 F30000
; LINE_WIDTH: 0.421045
G1 F15000
G1 X139.795 Y141.5 E.73695
G1 X115.878 Y141.5 F30000
; LINE_WIDTH: 0.420875
G1 F15000
G1 X115.731 Y141.465 E.00465
G2 X113.874 Y140.778 I-264.06 J710.566 E.06099
G3 X113.875 Y142.221 I-7.556 J.726 E.04449
G3 X115.82 Y141.513 I23.568 J61.752 E.06374
G1 X114.446 Y141.434 F30000
; LINE_WIDTH: 0.6492
G1 F10391.239
G2 X114.454 Y141.551 I-.035 J.061 E.015
G1 X110.207 Y145.479 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.335595
G1 F15000
G1 X111.115 Y144.897 E.02573
G1 X111.122 Y144.906 F30000
; LINE_WIDTH: 0.24328
G1 F15000
G1 X110.585 Y145.234 E.01027
; LINE_WIDTH: 0.222393
G1 X110.491 Y145.29 E.00161
; LINE_WIDTH: 0.181846
G1 X110.394 Y145.347 E.00128
; LINE_WIDTH: 0.145266
G1 X110.295 Y145.403 E.00095
; LINE_WIDTH: 0.11304
G1 X110.196 Y145.46 E.00065
G1 X108.88 Y146.076 F30000
; LINE_WIDTH: 0.681315
G1 F9868.511
G3 X108.88 Y136.925 I-1.7 J-4.575 E.97823
G1 X110.196 Y137.54 F30000
; LINE_WIDTH: 0.113023
G1 F15000
G1 X110.295 Y137.596 E.00065
; LINE_WIDTH: 0.145237
G1 X110.394 Y137.652 E.00095
; LINE_WIDTH: 0.181839
G1 X110.491 Y137.709 E.00128
; LINE_WIDTH: 0.222428
G1 X110.585 Y137.766 E.00161
; LINE_WIDTH: 0.243333
G1 X111.122 Y138.093 E.01027
G1 X111.116 Y138.102 F30000
; LINE_WIDTH: 0.335519
G1 F15000
G1 X110.207 Y137.521 E.02573
; WIPE_START
G1 X111.116 Y138.102 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.747 Y137.974 Z.8 F30000
G1 X145.572 Y137.523 Z.8
M73 P66 R4
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.333952
G1 F15000
G1 X144.666 Y138.104 E.02552
G1 X144.659 Y138.095 F30000
; LINE_WIDTH: 0.238659
G1 F15000
G3 X145.293 Y137.71 I17.618 J28.271 E.01182
; LINE_WIDTH: 0.180664
G1 X145.388 Y137.653 E.00124
; LINE_WIDTH: 0.144368
G1 X145.486 Y137.597 E.00094
; LINE_WIDTH: 0.112622
G1 X145.583 Y137.543 E.00063
G1 X146.995 Y137.236 F30000
; LINE_WIDTH: 0.611073
G1 F11088.567
G1 X147.165 Y136.873 E.01855
; LINE_WIDTH: 0.642174
G1 F10513.075
G1 X147.172 Y136.857 E.00084
; LINE_WIDTH: 0.667792
G1 F10082.07
G1 X147.18 Y136.842 E.00088
; LINE_WIDTH: 0.681303
G1 F9868.682
G3 X146.903 Y146.074 I1.433 J4.663 E.96374
G1 X145.587 Y145.459 F30000
; LINE_WIDTH: 0.112995
G1 F15000
G1 X145.488 Y145.404 E.00065
; LINE_WIDTH: 0.145528
G1 X145.387 Y145.346 E.00097
; LINE_WIDTH: 0.182198
G1 X145.292 Y145.29 E.00125
; LINE_WIDTH: 0.240123
G3 X144.663 Y144.909 I19.996 J-33.707 E.01182
G1 X144.67 Y144.899 F30000
; LINE_WIDTH: 0.335576
G1 F15000
G1 X145.576 Y145.479 E.02565
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X144.67 Y144.899 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 3/15
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
; object ids of layer 3 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer3 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00905
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.525 J2.016 E.13656
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.525 J-2.017 E.1366
G1 X116.072 Y125.23 E.11948
G1 X139.595 Y125.23 E.78027
G1 X139.636 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00723
G1 X144.085 Y123.263 E.14957
G2 X144.085 Y128.739 I4.781 J2.737 E.19011
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.576 Y124.823 E.77726
G1 X139.618 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00542
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.558 Y124.416 E.77424
; WIPE_START
G1 X139.782 Y124.416 E-.0849
G1 X141.449 Y123.801 E-.6751
; WIPE_END
G1 E-.04 F1800
G1 X133.962 Y125.289 Z1 F30000
G1 X107.474 Y130.551 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.558 E.00659
G3 X107.076 Y121.445 I.001 J-4.559 E.46845
G1 X107.275 Y121.441 E.0066
G3 X107.672 Y130.541 I.001 J4.559 E.46192
G1 X107.534 Y130.548 E.00461
G1 X107.456 Y130.144 F30000
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
G1 X113.097 Y127.969 Z1 F30000
G1 X147.934 Y121.514 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.13 Y121.48 E.0066
G3 X148.526 Y121.445 I.596 J4.52 E.0132
G1 X148.725 Y121.441 E.0066
G3 X147.738 Y121.549 I.001 J4.559 E.91719
G1 X147.875 Y121.525 E.0046
G1 X148.005 Y121.915 F30000
G1 F15476.087
G1 X148.183 Y121.883 E.00601
G3 X148.544 Y121.852 I.542 J4.116 E.01202
G1 X148.725 Y121.848 E.00601
G3 X147.826 Y121.946 I0 J4.152 E.83527
G1 X147.946 Y121.925 E.00401
G1 X148.148 Y122.289 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
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
G1 X142.502 Y123.587 Z1 F30000
G1 X139.6 Y124.009 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00361
G1 X147.14 Y121.268 E.26274
G3 X148.806 Y121.011 I1.632 J5.049 E.05617
G3 X146.915 Y130.651 I-.085 J4.989 E.57848
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.2548
G3 X109.085 Y121.349 I-1.809 J-4.651 E.64289
G1 X116.291 Y124.009 E.25479
G1 X139.54 Y124.009 E.77123
G1 X139.582 Y123.602 F30000
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
G1 F3600
M204 S5000
G1 X146.883 Y120.511 E.23962
G3 X148.824 Y120.212 I1.897 J5.859 E.0606
M73 P67 R4
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
G1 X144.432 Y123.076 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109549
G1 F15000
G3 X144.576 Y122.885 I.31 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445842
G1 F15000
G1 X145.371 Y122.347 E.0084
; LINE_WIDTH: 0.414753
G1 X145.469 Y122.288 E.00347
; LINE_WIDTH: 0.374593
G1 X145.56 Y122.234 E.00286
; LINE_WIDTH: 0.337103
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302104
G1 X145.75 Y122.127 E.00223
; LINE_WIDTH: 0.269745
G1 X145.847 Y122.075 E.00203
; LINE_WIDTH: 0.239867
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224787
G1 X145.942 Y122.023 E.00006
; LINE_WIDTH: 0.19962
G1 X146.129 Y121.928 E.00268
; LINE_WIDTH: 0.154615
G1 X146.32 Y121.836 E.00192
; LINE_WIDTH: 0.113275
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.925 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.107541
G1 F15000
G2 X144.577 Y129.117 I.494 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446779
G1 F15000
G1 X145.37 Y129.654 E.00833
; LINE_WIDTH: 0.416335
G1 X145.469 Y129.712 E.00349
; LINE_WIDTH: 0.376191
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338724
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303749
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271417
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241568
G1 X145.938 Y129.976 E.00169
; LINE_WIDTH: 0.226498
G1 X145.942 Y129.977 E.00006
; LINE_WIDTH: 0.201345
G1 X146.129 Y130.073 E.00271
; LINE_WIDTH: 0.156396
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114053
G1 X146.606 Y130.293 E.00182
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.753 Y129.162 Z1 F30000
G1 X114.88 Y126 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3975
G1 F15000
G1 X114.181 Y125.742 E.02155
G1 X114.181 Y126.258 E.01493
G1 X114.824 Y126.021 E.01981
G1 X115.987 Y126 F30000
; LINE_WIDTH: 0.421045
G1 F15000
G1 X139.904 Y126 E.73695
G1 X115.987 Y126 F30000
; LINE_WIDTH: 0.42086
G1 F15000
G1 X115.84 Y125.966 E.00465
G2 X113.771 Y125.2 I-323.491 J871.059 E.06794
G1 X113.825 Y125.975 E.02392
G3 X113.771 Y126.8 I-5.005 J.086 E.02547
G3 X115.928 Y126.014 I28.684 J75.375 E.07072
G1 X139.964 Y125.622 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X116.036 Y125.622 E.7352
G1 X113.286 Y124.62 E.08994
G1 X113.424 Y125.453 E.02596
G3 X113.28 Y127.383 I-5.849 J.534 E.05973
G1 X116.036 Y126.378 E.09015
G1 X139.964 Y126.378 E.73521
G1 X142.714 Y127.38 E.08994
G1 X142.576 Y126.547 E.02596
G3 X142.72 Y124.618 I5.852 J-.534 E.0597
G1 X140.023 Y125.612 E.08833
G1 X139.964 Y126 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X140.16 Y126.035 E.00612
G1 X142.229 Y126.8 E.06781
G1 X142.175 Y126.025 E.02388
G3 X142.229 Y125.201 I5.005 J-.086 E.02541
G1 X140.159 Y125.965 E.06782
G1 X140.023 Y125.989 E.00426
G1 X141.12 Y126 F30000
; LINE_WIDTH: 0.39742
G1 F15000
G1 X141.819 Y126.258 E.02154
G1 X141.819 Y125.742 E.01492
G1 X141.176 Y125.979 E.01981
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109725
G1 F15000
G1 X111.478 Y122.925 E.00096
G1 X111.423 Y122.883 E.00038
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.44638
G1 F15000
G1 X110.622 Y122.341 E.00862
; LINE_WIDTH: 0.414641
G1 X110.531 Y122.287 E.0032
; LINE_WIDTH: 0.374846
G1 X110.434 Y122.23 E.00305
; LINE_WIDTH: 0.337568
G1 X110.342 Y122.178 E.00252
; LINE_WIDTH: 0.302932
G1 X110.246 Y122.124 E.00234
; LINE_WIDTH: 0.270689
G1 X110.154 Y122.074 E.00195
; LINE_WIDTH: 0.240944
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.201008
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155951
G1 X109.678 Y121.834 E.00195
; LINE_WIDTH: 0.113884
G1 X109.394 Y121.707 E.0018
; WIPE_START
G1 X109.678 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y128.924 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.109723
G1 F15000
G1 X111.478 Y129.075 E.00096
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446367
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414647
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374849
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.33758
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302937
G1 X110.246 Y129.876 E.00234
; LINE_WIDTH: 0.270694
G1 X110.154 Y129.926 E.00195
; LINE_WIDTH: 0.240942
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.201014
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155954
G1 X109.678 Y130.166 E.00195
; LINE_WIDTH: 0.113883
G1 X109.393 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.678 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X116.874 Y132.711 Z1 F30000
G1 X139.546 Y140.73 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00905
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.525 J2.016 E.13656
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.525 J-2.017 E.1366
G1 X115.964 Y140.73 E.11948
G1 X139.486 Y140.73 E.78027
G1 X139.528 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00723
G1 X143.976 Y138.762 E.14957
G2 X143.977 Y144.238 I4.781 J2.737 E.19011
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.468 Y140.323 E.77726
G1 X139.51 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00542
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.932 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.45 Y139.916 E.77424
; WIPE_START
G1 X139.673 Y139.916 E-.0849
G1 X141.34 Y139.301 E-.6751
; WIPE_END
G1 E-.04 F1800
G1 X133.854 Y140.788 Z1 F30000
G1 X107.365 Y146.05 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.058 E.00659
G3 X106.968 Y136.944 I.001 J-4.559 E.46845
G1 X107.166 Y136.94 E.0066
G3 X107.564 Y146.04 I.001 J4.559 E.46192
G1 X107.425 Y146.047 E.00461
G1 X107.347 Y145.644 F30000
G1 F15476.087
G1 X107.166 Y145.651 E.006
G3 X106.985 Y137.351 I0 J-4.152 E.42662
G1 X107.166 Y137.347 E.00601
G3 X107.528 Y145.635 I0 J4.152 E.42067
G1 X107.407 Y145.641 E.00402
G1 X107.361 Y145.253 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X107.33 Y145.252 E.00095
G3 X106.676 Y145.227 I-.175 J-4.003 E.02015
G1 F2160
G1 X106.514 Y145.202 E.00504
G1 F2040
G3 X104.184 Y143.789 I.66 J-3.714 E.08568
G1 F2160
G1 X104.086 Y143.656 E.00505
G1 F2040
G3 X103.535 Y142.473 I3.308 J-2.263 E.0403
G1 F2160
G1 X103.496 Y142.313 E.00505
G1 F2040
G3 X103.439 Y141.009 I3.923 J-.825 E.0403
G1 F2160
G1 X103.464 Y140.847 E.00504
G1 F2040
G3 X103.91 Y139.619 I3.94 J.739 E.04031
G1 F2160
G1 X103.995 Y139.479 E.00504
G1 F2040
G3 X107.003 Y137.743 I3.187 J2.048 E.11084
G1 F2160
G1 X107.166 Y137.739 E.00504
G1 F2040
G3 X110.338 Y139.479 I-.004 J3.767 E.11593
G1 F2160
G1 X110.423 Y139.619 E.00504
G1 F2040
G3 X110.798 Y140.526 I-3.693 J2.061 E.03022
G1 F2160
G1 X110.837 Y140.686 E.00505
G1 F2040
G3 X110.894 Y141.99 I-3.922 J.825 E.0403
G1 F2160
G1 X110.869 Y142.152 E.00504
G1 F2040
G3 X110.423 Y143.38 I-3.939 J-.739 E.04031
G1 F2160
G1 X110.338 Y143.52 E.00504
G1 F2040
G3 X108.14 Y145.131 I-3.179 J-2.031 E.08568
G1 F2160
G1 X107.98 Y145.17 E.00505
G1 F2040
G3 X107.657 Y145.225 I-.825 J-3.921 E.01008
G1 X107.421 Y145.247 E.00729
; WIPE_START
M204 S10000
G1 X107.33 Y145.252 E-.03451
G1 X107.003 Y145.256 E-.12454
G1 X106.676 Y145.227 E-.12469
G1 X106.514 Y145.202 E-.0623
G1 X106.193 Y145.131 E-.12473
G1 X105.88 Y145.033 E-.12457
G1 X105.578 Y144.907 E-.12462
G1 X105.484 Y144.859 E-.04003
; WIPE_END
G1 E-.04 F1800
G1 X112.989 Y143.468 Z1 F30000
G1 X147.826 Y137.014 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.021 Y136.979 E.0066
G3 X148.418 Y136.944 I.596 J4.52 E.0132
G1 X148.616 Y136.94 E.0066
G3 X147.63 Y137.048 I.001 J4.559 E.91719
G1 X147.766 Y137.024 E.0046
G1 X147.896 Y137.414 F30000
G1 F15476.087
G1 X148.075 Y137.383 E.00601
G3 X148.435 Y137.351 I.542 J4.116 E.01202
G1 X148.616 Y137.347 E.00601
G3 X147.718 Y137.446 I0 J4.152 E.83527
G1 X147.837 Y137.425 E.00401
G1 X148.04 Y137.788 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2040
M204 S5000
G1 X148.453 Y137.743 E.01277
G1 F2160
G1 X148.616 Y137.739 E.00504
G1 F2040
G3 X150.497 Y138.243 I-.028 J3.865 E.06046
G1 F2160
G1 X150.637 Y138.328 E.00504
G1 F2040
G3 X152.248 Y140.526 I-2.031 J3.179 E.08568
G1 F2160
G1 X152.287 Y140.686 E.00505
G1 F2040
G3 X152.344 Y141.99 I-3.921 J.825 E.0403
G1 F2160
M73 P68 R4
G1 X152.319 Y142.152 E.00504
G1 F2040
G3 X151.873 Y143.38 I-3.94 J-.739 E.04031
G1 F2160
G1 X151.788 Y143.52 E.00504
G1 F2040
G3 X150.773 Y144.58 I-3.206 J-2.053 E.04536
G1 F2160
G1 X150.637 Y144.671 E.00504
G1 F2040
G3 X149.59 Y145.131 I-2.052 J-3.243 E.03528
G1 F2160
G1 X149.43 Y145.17 E.00505
G1 F2040
G3 X148.126 Y145.227 I-.825 J-3.921 E.0403
G1 F2160
G1 X147.964 Y145.202 E.00504
G1 F2040
G3 X145.633 Y143.789 I.66 J-3.714 E.08568
G1 F2160
G1 X145.536 Y143.656 E.00505
G1 F2040
G3 X144.985 Y142.473 I3.308 J-2.263 E.0403
G1 F2160
G1 X144.946 Y142.313 E.00505
G1 F2040
G3 X144.889 Y141.009 I3.922 J-.825 E.0403
G1 F2160
G1 X144.914 Y140.847 E.00504
G1 F2040
G3 X145.36 Y139.619 I3.939 J.739 E.04031
G1 F2160
G1 X145.445 Y139.479 E.00504
G1 F2040
G3 X147.33 Y137.966 I3.182 J2.033 E.07561
G1 F2160
G1 X147.486 Y137.913 E.00504
G1 F2040
G3 X147.964 Y137.8 I1.212 J4.048 E.01511
G1 X147.98 Y137.798 E.0005
; WIPE_START
M204 S10000
G1 X148.453 Y137.743 E-.18065
G1 X148.616 Y137.739 E-.06232
G1 X149.107 Y137.772 E-.18692
G1 X149.59 Y137.868 E-.18695
G1 X149.947 Y137.989 E-.14317
; WIPE_END
G1 E-.04 F1800
G1 X142.394 Y139.087 Z1 F30000
G1 X139.492 Y139.509 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00361
G1 X147.032 Y136.767 E.26274
G3 X148.698 Y136.51 I1.632 J5.049 E.05617
G3 X146.806 Y146.151 I-.085 J4.989 E.57848
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.2548
G3 X108.977 Y136.848 I-1.809 J-4.651 E.64289
G1 X116.182 Y139.509 E.25479
G1 X139.432 Y139.509 E.77123
G1 X139.474 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.0018
G1 X146.9 Y136.382 E.26067
G3 X148.707 Y136.103 I1.767 J5.461 E.06089
G3 X146.666 Y146.533 I-.094 J5.396 E.62532
G1 X139.528 Y143.897 E.25242
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.117 Y136.466 I-1.949 J-5.034 E.6948
G1 X116.255 Y139.102 E.2524
G1 X139.414 Y139.102 E.76822
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.715 Y135.711 I1.897 J5.859 E.0606
G3 X146.533 Y146.902 I-.103 J5.788 E.62098
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X109.25 Y136.097 I-2.082 J-5.402 E.68981
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y138.575 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109549
G1 F15000
G3 X144.467 Y138.385 I.31 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445842
G1 F15000
G1 X145.263 Y137.846 E.0084
; LINE_WIDTH: 0.414753
G1 X145.361 Y137.788 E.00347
; LINE_WIDTH: 0.374593
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.337103
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302104
G1 X145.641 Y137.626 E.00223
; LINE_WIDTH: 0.269745
G1 X145.738 Y137.574 E.00203
; LINE_WIDTH: 0.239867
G1 X145.83 Y137.525 E.00168
; LINE_WIDTH: 0.224787
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.19962
G1 X146.021 Y137.427 E.00268
; LINE_WIDTH: 0.154615
G1 X146.211 Y137.336 E.00192
; LINE_WIDTH: 0.113275
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.424 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.107541
G1 F15000
G2 X144.468 Y144.616 I.494 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446779
G1 F15000
G1 X145.262 Y145.153 E.00833
; LINE_WIDTH: 0.416335
G1 X145.36 Y145.212 E.00349
; LINE_WIDTH: 0.376191
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338724
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303749
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271417
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241568
G1 X145.83 Y145.475 E.00169
; LINE_WIDTH: 0.226498
G1 X145.833 Y145.477 E.00006
; LINE_WIDTH: 0.201345
G1 X146.02 Y145.572 E.00271
; LINE_WIDTH: 0.156396
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114053
G1 X146.498 Y145.793 E.00182
; WIPE_START
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.644 Y144.662 Z1 F30000
G1 X114.772 Y141.5 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3975
G1 F15000
G1 X114.072 Y141.241 E.02155
G1 X114.072 Y141.758 E.01493
G1 X114.715 Y141.52 E.01981
G1 X115.878 Y141.5 F30000
; LINE_WIDTH: 0.421045
G1 F15000
G1 X139.795 Y141.5 E.73695
G1 X115.878 Y141.5 F30000
; LINE_WIDTH: 0.42086
G1 F15000
G1 X115.731 Y141.465 E.00465
G2 X113.662 Y140.7 I-323.491 J871.059 E.06794
G1 X113.716 Y141.475 E.02392
G3 X113.662 Y142.299 I-5.005 J.086 E.02547
G3 X115.82 Y141.513 I28.684 J75.375 E.07072
G1 X139.855 Y141.122 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X115.928 Y141.122 E.7352
G1 X113.178 Y140.119 E.08994
G1 X113.315 Y140.953 E.02596
G3 X113.171 Y142.882 I-5.849 J.534 E.05973
G1 X115.928 Y141.877 E.09015
G1 X139.855 Y141.877 E.73521
G1 X142.605 Y142.88 E.08994
G1 X142.468 Y142.046 E.02596
G3 X142.612 Y140.117 I5.852 J-.534 E.0597
G1 X139.914 Y141.111 E.08833
G1 X139.855 Y141.5 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X140.051 Y141.535 E.00612
G1 X142.121 Y142.299 E.06781
G1 X142.067 Y141.524 E.02388
G3 X142.121 Y140.7 I5.005 J-.086 E.02541
G1 X140.051 Y141.464 E.06782
G1 X139.914 Y141.489 E.00426
G1 X141.011 Y141.5 F30000
; LINE_WIDTH: 0.39742
G1 F15000
G1 X141.711 Y141.758 E.02154
G1 X141.711 Y141.241 E.01492
G1 X141.068 Y141.479 E.01981
G1 X111.46 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109725
G1 F15000
G1 X111.369 Y138.425 E.00096
G1 X111.315 Y138.383 E.00038
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.44638
G1 F15000
G1 X110.513 Y137.841 E.00862
; LINE_WIDTH: 0.414641
G1 X110.422 Y137.787 E.0032
; LINE_WIDTH: 0.374846
G1 X110.325 Y137.729 E.00305
; LINE_WIDTH: 0.337568
G1 X110.234 Y137.677 E.00252
; LINE_WIDTH: 0.302932
G1 X110.138 Y137.623 E.00234
; LINE_WIDTH: 0.270689
G1 X110.045 Y137.573 E.00195
; LINE_WIDTH: 0.240944
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.201008
G1 X109.76 Y137.426 E.00273
; LINE_WIDTH: 0.155951
G1 X109.57 Y137.334 E.00195
; LINE_WIDTH: 0.113884
G1 X109.285 Y137.206 E.0018
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.46 Y144.424 Z1 F30000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.109723
G1 F15000
G1 X111.369 Y144.574 E.00096
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446367
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414647
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374849
G1 X110.325 Y145.27 E.00305
; LINE_WIDTH: 0.33758
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302937
G1 X110.138 Y145.376 E.00234
; LINE_WIDTH: 0.270694
G1 X110.045 Y145.426 E.00195
; LINE_WIDTH: 0.240942
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.201014
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155954
G1 X109.57 Y145.665 E.00195
; LINE_WIDTH: 0.113883
G1 X109.285 Y145.793 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 4/15
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
; object ids of layer 4 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer4 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00904
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.525 J2.016 E.13656
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.525 J-2.017 E.1366
G1 X116.072 Y125.23 E.11948
G1 X139.595 Y125.23 E.78027
G1 X139.637 Y124.823 F30000
G1 F15476.087
G1 X139.854 Y124.823 E.00723
G1 X144.085 Y123.263 E.14956
G2 X144.085 Y128.739 I4.781 J2.737 E.1901
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.577 Y124.823 E.77726
G1 X139.619 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00541
G1 X144.93 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.559 Y124.416 E.77425
; WIPE_START
G1 X139.782 Y124.416 E-.08483
G1 X141.449 Y123.801 E-.67517
; WIPE_END
G1 E-.04 F1800
G1 X133.963 Y125.288 Z1.2 F30000
G1 X107.473 Y130.551 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.558 E.00658
G3 X107.076 Y121.445 I-.007 J-4.559 E.46894
G1 X107.261 Y121.441 E.00612
G3 X107.673 Y130.54 I.007 J4.559 E.46188
G1 X107.533 Y130.548 E.00463
G1 X107.432 Y130.148 F30000
G1 F15476.087
G1 X106.913 Y130.136 E.01721
G3 X107.094 Y121.852 I.355 J-4.136 E.41506
G1 X107.262 Y121.848 E.00556
G3 X107.491 Y130.145 I.007 J4.152 E.42548
G1 X107.476 Y129.753 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.439 Y129.755 E.00115
G3 X107.111 Y122.244 I-.17 J-3.756 E.36329
G1 X107.262 Y122.24 E.00465
G3 X107.766 Y129.726 I.007 J3.76 E.34782
G1 X107.536 Y129.748 E.00709
; WIPE_START
M204 S10000
G1 X107.439 Y129.755 E-.03699
G1 X106.947 Y129.746 E-.18688
G1 X106.622 Y129.703 E-.12457
G1 X106.302 Y129.632 E-.12457
G1 X105.989 Y129.533 E-.12476
G1 X105.598 Y129.361 E-.16224
; WIPE_END
G1 E-.04 F1800
G1 X113.103 Y127.97 Z1.2 F30000
G1 X147.935 Y121.514 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.13 Y121.479 E.00658
G3 X148.526 Y121.445 I.588 J4.521 E.0132
G1 X148.711 Y121.441 E.00612
G3 X147.738 Y121.548 I.007 J4.559 E.91762
G1 X147.876 Y121.524 E.00463
G1 X148.028 Y121.908 F30000
G1 F15476.087
G1 X148.544 Y121.852 E.0172
G1 X148.712 Y121.848 E.00556
G3 X147.969 Y121.916 I.007 J4.152 E.84054
G1 X148.128 Y122.291 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.561 Y122.244 E.01339
G1 X148.712 Y122.24 E.00465
G3 X148.068 Y122.297 I.007 J3.76 E.70594
; WIPE_START
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
G1 X142.485 Y123.586 Z1.2 F30000
G1 X139.6 Y124.009 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.0036
G1 X147.14 Y121.268 E.26274
G3 X148.79 Y121.011 I1.631 J5.047 E.05563
G3 X146.915 Y130.651 I-.069 J4.989 E.57898
G1 X139.709 Y127.991 E.25482
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.25481
G3 X109.085 Y121.349 I-1.809 J-4.651 E.64289
G1 X116.291 Y124.009 E.25479
M73 P69 R4
G1 X139.54 Y124.009 E.77124
G1 X139.582 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.456 Y126.421 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.99 Y126.421 E.01771
G1 X141.016 Y126.8 E.0363
G1 X142.659 Y125.157 E.07708
G2 X142.66 Y126.843 I8.666 J.84 E.05602
G1 X141.016 Y125.2 E.07711
G1 X139.989 Y125.579 E.03631
G1 X137.633 Y125.579 E.07818
G1 X136.79 Y126.421 E.03954
G1 X137.633 Y126.421 E.02796
G1 X136.79 Y125.579 E.03954
G1 X133.027 Y125.579 E.12482
G1 X132.184 Y126.421 E.03954
G1 X133.027 Y126.421 E.02796
G1 X132.184 Y125.579 E.03954
G1 X128.421 Y125.579 E.12482
G1 X127.579 Y126.421 E.03954
G1 X128.421 Y126.421 E.02796
G1 X127.579 Y125.579 E.03954
G1 X125.95 Y125.579 E.05401
G1 X116.544 Y125.579 F30000
G1 F15476.087
G1 X116.01 Y125.579 E.01771
G1 X114.984 Y125.2 E.0363
G1 X113.341 Y126.843 E.07708
G2 X113.34 Y125.157 I-8.729 J-.843 E.056
G1 X114.984 Y126.8 E.07709
G1 X116.01 Y126.421 E.0363
G1 X118.367 Y126.421 E.07819
G1 X119.21 Y125.579 E.03954
G1 X118.367 Y125.579 E.02796
G1 X119.21 Y126.421 E.03954
G1 X122.973 Y126.421 E.12482
G1 X123.816 Y125.579 E.03954
G1 X122.973 Y125.579 E.02796
G1 X123.816 Y126.421 E.03954
G1 X125.444 Y126.421 E.05401
G1 X111.568 Y128.925 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109687
G1 F15000
G1 X111.478 Y129.075 E.00095
G1 X111.423 Y129.117 E.00037
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446432
G1 F15000
G1 X110.622 Y129.658 E.00861
; LINE_WIDTH: 0.414718
G1 X110.531 Y129.713 E.00321
; LINE_WIDTH: 0.374856
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337559
G1 X110.342 Y129.822 E.00252
; LINE_WIDTH: 0.302967
G1 X110.246 Y129.876 E.00234
; LINE_WIDTH: 0.270719
G1 X110.154 Y129.926 E.00195
; LINE_WIDTH: 0.240911
G1 X110.057 Y129.978 E.00176
; LINE_WIDTH: 0.200926
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155956
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.11393
G1 X109.394 Y130.293 E.00181
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y123.075 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.109681
G1 F15000
G1 X111.478 Y122.925 E.00095
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446337
G1 F15000
G1 X110.622 Y122.341 E.00863
; LINE_WIDTH: 0.414599
G1 X110.531 Y122.287 E.0032
; LINE_WIDTH: 0.374888
G1 X110.434 Y122.23 E.00304
; LINE_WIDTH: 0.33764
G1 X110.343 Y122.178 E.00253
; LINE_WIDTH: 0.303
G1 X110.246 Y122.124 E.00234
; LINE_WIDTH: 0.270744
G1 X110.154 Y122.074 E.00195
; LINE_WIDTH: 0.240973
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.200959
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155924
G1 X109.679 Y121.834 E.00194
; LINE_WIDTH: 0.113905
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.306 Y122.107 Z1.2 F30000
G1 X144.432 Y123.076 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.109564
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445769
G1 F15000
G1 X145.371 Y122.347 E.00842
; LINE_WIDTH: 0.414611
G1 X145.47 Y122.288 E.00346
; LINE_WIDTH: 0.374489
G1 X145.56 Y122.234 E.00286
; LINE_WIDTH: 0.337082
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302152
G1 X145.75 Y122.127 E.00222
; LINE_WIDTH: 0.270789
G1 X145.84 Y122.078 E.00191
; LINE_WIDTH: 0.242846
G1 X145.926 Y122.032 E.00159
; LINE_WIDTH: 0.215511
G1 X146.028 Y121.98 E.00161
; LINE_WIDTH: 0.188632
G1 X146.127 Y121.929 E.00132
; LINE_WIDTH: 0.154846
G1 X146.32 Y121.836 E.00195
; LINE_WIDTH: 0.113283
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.431 Y128.922 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.107629
G1 F15000
G2 X144.577 Y129.117 I.473 J-.202 E.0013
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446647
G1 F15000
G1 X145.371 Y129.654 E.00835
; LINE_WIDTH: 0.416136
G1 X145.469 Y129.713 E.00347
; LINE_WIDTH: 0.376173
G1 X145.56 Y129.767 E.00286
; LINE_WIDTH: 0.338793
G1 X145.657 Y129.822 E.00271
; LINE_WIDTH: 0.303809
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271441
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241524
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226423
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201308
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156389
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114043
G1 X146.606 Y130.293 E.00182
; OBJECT_ID: 104
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X142.2 Y136.59 Z1.2 F30000
G1 X139.546 Y140.73 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00904
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.525 J2.016 E.13656
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.525 J-2.017 E.1366
G1 X115.964 Y140.73 E.11948
G1 X139.486 Y140.73 E.78027
G1 X139.528 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00723
G1 X143.976 Y138.762 E.14956
G2 X143.977 Y144.238 I4.781 J2.737 E.1901
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.468 Y140.323 E.77726
G1 X139.51 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00541
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.852 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.45 Y139.916 E.77425
; WIPE_START
G1 X139.673 Y139.916 E-.08483
G1 X141.34 Y139.301 E-.67517
; WIPE_END
G1 E-.04 F1800
G1 X133.854 Y140.788 Z1.2 F30000
G1 X107.365 Y146.05 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.058 E.00658
G3 X106.968 Y136.944 I-.007 J-4.559 E.46894
G1 X107.152 Y136.94 E.00612
G3 X107.564 Y146.04 I.007 J4.559 E.46188
G1 X107.424 Y146.047 E.00463
G1 X107.323 Y145.647 F30000
G1 F15476.087
G1 X106.804 Y145.636 E.01721
G3 X106.985 Y137.351 I.355 J-4.136 E.41506
G1 X107.153 Y137.348 E.00556
G3 X107.383 Y145.645 I.007 J4.152 E.42548
G1 X107.368 Y145.253 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.33 Y145.255 E.00115
G3 X107.003 Y137.743 I-.17 J-3.756 E.36329
G1 X107.154 Y137.74 E.00465
G3 X107.657 Y145.226 I.007 J3.76 E.34782
G1 X107.427 Y145.247 E.00709
; WIPE_START
M204 S10000
G1 X107.33 Y145.255 E-.03699
G1 X106.839 Y145.245 E-.18688
G1 X106.514 Y145.202 E-.12457
G1 X106.194 Y145.132 E-.12457
G1 X105.88 Y145.033 E-.12476
G1 X105.49 Y144.861 E-.16224
; WIPE_END
G1 E-.04 F1800
G1 X112.994 Y143.47 Z1.2 F30000
G1 X147.826 Y137.014 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.021 Y136.979 E.00658
G3 X148.418 Y136.944 I.588 J4.521 E.0132
G1 X148.602 Y136.94 E.00612
G3 X147.629 Y137.047 I.007 J4.559 E.91762
G1 X147.767 Y137.024 E.00463
G1 X147.92 Y137.408 F30000
G1 F15476.087
G1 X148.435 Y137.351 E.0172
G1 X148.603 Y137.348 E.00556
G3 X147.861 Y137.416 I.007 J4.152 E.84054
G1 X148.019 Y137.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.453 Y137.743 E.01339
G1 X148.604 Y137.74 E.00465
G3 X147.96 Y137.796 I.007 J3.76 E.70594
; WIPE_START
M204 S10000
G1 X148.453 Y137.743 E-.18838
G1 X148.604 Y137.74 E-.05748
G1 X148.944 Y137.754 E-.12952
G1 X149.269 Y137.797 E-.12458
G1 X149.59 Y137.868 E-.12468
G1 X149.902 Y137.966 E-.12463
G1 X149.928 Y137.978 E-.01074
; WIPE_END
G1 E-.04 F1800
G1 X142.377 Y139.085 Z1.2 F30000
G1 X139.492 Y139.509 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.0036
G1 X147.032 Y136.767 E.26274
M73 P70 R4
G3 X148.682 Y136.51 I1.631 J5.047 E.05563
G3 X146.807 Y146.151 I-.069 J4.989 E.57898
G1 X139.601 Y143.49 E.25482
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.25481
G3 X108.977 Y136.848 I-1.809 J-4.651 E.64289
G1 X116.182 Y139.509 E.25479
G1 X139.432 Y139.509 E.77124
G1 X139.474 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00179
G1 X146.901 Y136.382 E.26068
G3 X148.69 Y136.103 I1.766 J5.459 E.06033
G3 X146.667 Y146.533 I-.078 J5.396 E.62583
G1 X139.528 Y143.897 E.25245
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25244
G3 X109.117 Y136.466 I-1.948 J-5.034 E.69477
G1 X116.255 Y139.102 E.25242
G1 X139.414 Y139.102 E.76822
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.698 Y135.711 I1.897 J5.857 E.06008
G3 X146.533 Y146.902 I-.086 J5.788 E.62151
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X109.25 Y136.097 I-2.082 J-5.402 E.68981
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.347 Y141.921 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.881 Y141.921 E.01771
G1 X140.908 Y142.3 E.0363
G1 X142.551 Y140.657 E.07708
G2 X142.552 Y142.343 I8.666 J.84 E.05602
G1 X140.908 Y140.699 E.07711
G1 X139.881 Y141.078 E.03631
G1 X137.524 Y141.078 E.07818
G1 X136.681 Y141.921 E.03954
G1 X137.524 Y141.921 E.02796
G1 X136.681 Y141.078 E.03954
G1 X132.918 Y141.078 E.12482
G1 X132.076 Y141.921 E.03954
G1 X132.918 Y141.921 E.02796
G1 X132.076 Y141.078 E.03954
G1 X128.313 Y141.078 E.12482
G1 X127.47 Y141.921 E.03954
G1 X128.313 Y141.921 E.02796
G1 X127.47 Y141.078 E.03954
G1 X125.842 Y141.078 E.05401
G1 X116.436 Y141.078 F30000
G1 F15476.087
G1 X115.902 Y141.078 E.01771
G1 X114.875 Y140.699 E.0363
G1 X113.232 Y142.342 E.07708
G2 X113.232 Y140.657 I-8.729 J-.843 E.056
G1 X114.875 Y142.3 E.07709
G1 X115.902 Y141.921 E.0363
G1 X118.259 Y141.921 E.07819
G1 X119.102 Y141.078 E.03954
G1 X118.259 Y141.078 E.02796
G1 X119.102 Y141.921 E.03954
G1 X122.865 Y141.921 E.12482
G1 X123.707 Y141.078 E.03954
G1 X122.865 Y141.078 E.02796
G1 X123.707 Y141.921 E.03954
G1 X125.336 Y141.921 E.05401
G1 X111.459 Y144.424 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109687
G1 F15000
G1 X111.369 Y144.574 E.00095
G1 X111.315 Y144.616 E.00037
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446432
G1 F15000
G1 X110.513 Y145.158 E.00861
; LINE_WIDTH: 0.414718
G1 X110.422 Y145.212 E.00321
; LINE_WIDTH: 0.374856
G1 X110.325 Y145.27 E.00305
; LINE_WIDTH: 0.337559
G1 X110.234 Y145.322 E.00252
; LINE_WIDTH: 0.302967
G1 X110.138 Y145.376 E.00234
; LINE_WIDTH: 0.270719
G1 X110.045 Y145.426 E.00195
; LINE_WIDTH: 0.240911
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200926
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155956
G1 X109.571 Y145.665 E.00194
; LINE_WIDTH: 0.11393
G1 X109.285 Y145.793 E.00181
; WIPE_START
G1 X109.571 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y138.575 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.109681
G1 F15000
G1 X111.369 Y138.425 E.00095
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446337
G1 F15000
G1 X110.513 Y137.841 E.00863
; LINE_WIDTH: 0.414599
G1 X110.422 Y137.787 E.0032
; LINE_WIDTH: 0.374888
G1 X110.326 Y137.729 E.00304
; LINE_WIDTH: 0.33764
G1 X110.234 Y137.678 E.00253
; LINE_WIDTH: 0.303
G1 X110.138 Y137.623 E.00234
; LINE_WIDTH: 0.270744
G1 X110.045 Y137.573 E.00195
; LINE_WIDTH: 0.240973
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.200959
G1 X109.76 Y137.425 E.00273
; LINE_WIDTH: 0.155924
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113905
G1 X109.285 Y137.206 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.198 Y137.606 Z1.2 F30000
G1 X144.323 Y138.575 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.109564
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445769
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414611
G1 X145.361 Y137.787 E.00346
; LINE_WIDTH: 0.374489
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.337082
G1 X145.549 Y137.678 E.00269
; LINE_WIDTH: 0.302152
G1 X145.641 Y137.626 E.00222
; LINE_WIDTH: 0.270789
G1 X145.732 Y137.578 E.00191
; LINE_WIDTH: 0.242846
G1 X145.818 Y137.531 E.00159
; LINE_WIDTH: 0.215511
G1 X145.92 Y137.479 E.00161
; LINE_WIDTH: 0.188632
G1 X146.019 Y137.429 E.00132
; LINE_WIDTH: 0.154846
G1 X146.211 Y137.336 E.00195
; LINE_WIDTH: 0.113283
G1 X146.481 Y137.215 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.322 Y144.421 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.107629
G1 F15000
G2 X144.468 Y144.616 I.473 J-.202 E.0013
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446647
G1 F15000
G1 X145.263 Y145.154 E.00835
; LINE_WIDTH: 0.416136
G1 X145.361 Y145.212 E.00347
; LINE_WIDTH: 0.376173
G1 X145.451 Y145.266 E.00286
; LINE_WIDTH: 0.338793
G1 X145.549 Y145.321 E.00271
; LINE_WIDTH: 0.303809
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271441
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241524
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226423
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201308
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156389
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114043
G1 X146.498 Y145.793 E.00182
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 5/15
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
; object ids of layer 5 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer5 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00903
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.526 J2.016 E.13656
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.526 J-2.017 E.1366
G1 X116.072 Y125.23 E.11947
G1 X139.595 Y125.23 E.78028
; WIPE_START
G1 X139.927 Y125.23 E-.12629
G1 X141.492 Y124.653 E-.63371
; WIPE_END
G1 E-.04 F1800
G1 X144.102 Y123.256 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X143.945 Y123.546 E.01091
G2 X144.085 Y128.739 I4.873 J2.467 E.17958
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.855 Y124.823 E.78648
G1 X144.045 Y123.277 E.14817
; WIPE_START
G1 X143.945 Y123.546 E-.10892
G1 X143.675 Y124.162 E-.25568
G1 X143.473 Y124.866 E-.27844
G1 X143.427 Y125.171 E-.11696
; WIPE_END
G1 E-.04 F1800
G1 X139.619 Y124.416 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X139.782 Y124.416 E.00541
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.559 Y124.416 E.77425
; WIPE_START
G1 X139.782 Y124.416 E-.08476
G1 X141.449 Y123.801 E-.67524
; WIPE_END
G1 E-.04 F1800
G1 X133.962 Y125.283 Z1.4 F30000
G1 X107.308 Y130.558 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.555 E.0011
G3 X107.076 Y121.445 I.001 J-4.557 E.46827
G3 X107.471 Y121.445 I.2 J5.23 E.01308
G3 X107.672 Y130.538 I-.195 J4.553 E.45529
G1 X107.368 Y130.555 E.01012
G1 X107.259 Y130.151 F30000
G1 F15476.087
G1 X106.913 Y130.132 E.01148
G3 X107.094 Y121.852 I.362 J-4.134 E.41445
G3 X107.454 Y121.852 I.182 J4.771 E.01195
G3 X107.318 Y130.148 I-.179 J4.146 E.42515
G1 X107.486 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.275 Y129.756 E.00649
G3 X107.111 Y122.244 I0 J-3.758 E.35775
G3 X107.438 Y122.243 I.164 J4.337 E.01006
G3 X107.603 Y129.742 I-.163 J3.755 E.34771
M73 P71 R4
G1 X107.546 Y129.746 E.00175
; WIPE_START
M204 S10000
G1 X107.275 Y129.756 E-.10299
G1 X106.947 Y129.746 E-.12464
G1 X106.486 Y129.676 E-.17721
G1 X106.144 Y129.586 E-.13426
G1 X105.836 Y129.474 E-.12471
G1 X105.607 Y129.367 E-.09619
; WIPE_END
G1 E-.04 F1800
G1 X113.111 Y127.975 Z1.4 F30000
G1 X147.935 Y121.514 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.13 Y121.48 E.00658
G3 X148.526 Y121.445 I.596 J4.518 E.0132
G3 X148.921 Y121.445 I.2 J5.245 E.01308
G3 X147.738 Y121.549 I-.195 J4.553 E.91036
G1 X147.876 Y121.525 E.00463
G1 X148.028 Y121.908 F30000
G1 F15476.087
G1 X148.544 Y121.852 E.01721
G3 X148.904 Y121.852 I.181 J4.786 E.01195
G3 X147.969 Y121.917 I-.179 J4.146 E.83385
G1 X148.107 Y122.293 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.561 Y122.244 E.01405
G3 X148.888 Y122.243 I.164 J4.354 E.01006
G3 X148.047 Y122.302 I-.163 J3.755 E.69963
; WIPE_START
M204 S10000
G1 X148.561 Y122.244 E-.19651
G1 X148.888 Y122.243 E-.12436
G1 X149.216 Y122.272 E-.12492
G1 X149.539 Y122.329 E-.12465
G1 X150.01 Y122.466 E-.18661
G1 X150.017 Y122.469 E-.00295
; WIPE_END
G1 E-.04 F1800
G1 X142.467 Y123.585 Z1.4 F30000
G1 X139.601 Y124.009 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.0036
G1 X147.14 Y121.268 E.26273
G3 X148.791 Y121.011 I1.632 J5.048 E.05566
G3 X146.915 Y130.651 I-.067 J4.99 E.57924
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.25481
G3 X109.085 Y121.349 I-1.808 J-4.651 E.64286
G1 X116.291 Y124.009 E.25481
G1 X139.541 Y124.009 E.77124
G1 X139.583 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.154 Y122.482 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.445789
G1 F15000
G1 X145.371 Y122.347 E.00842
; LINE_WIDTH: 0.414632
G1 X145.47 Y122.288 E.00347
; LINE_WIDTH: 0.374498
G1 X145.561 Y122.234 E.00286
; LINE_WIDTH: 0.337074
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302142
G1 X145.75 Y122.127 E.00222
; LINE_WIDTH: 0.269787
G1 X145.847 Y122.075 E.00204
; LINE_WIDTH: 0.239842
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224722
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.199591
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.15466
G1 X146.32 Y121.836 E.00193
; LINE_WIDTH: 0.113296
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.925 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.10753
G1 F15000
G2 X144.577 Y129.117 I.494 J-.222 E.00127
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.44596
G1 F15000
G1 X145.374 Y129.656 E.00845
; LINE_WIDTH: 0.412523
G1 X145.484 Y129.721 E.00385
; LINE_WIDTH: 0.368417
G1 X145.586 Y129.781 E.00313
; LINE_WIDTH: 0.331608
G1 X145.67 Y129.829 E.00227
; LINE_WIDTH: 0.301464
G1 X145.749 Y129.874 E.00192
; LINE_WIDTH: 0.271426
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.24153
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226432
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201324
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156422
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114057
G1 X146.606 Y130.293 E.00182
G1 X121.345 Y125.579 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.973 Y125.579 E.05401
G1 X123.816 Y126.421 E.03954
G1 X122.973 Y126.421 E.02796
G1 X123.816 Y125.579 E.03954
G1 X127.579 Y125.579 E.12482
G1 X128.421 Y126.421 E.03954
G1 X127.579 Y126.421 E.02796
G1 X128.421 Y125.579 E.03954
G1 X132.184 Y125.579 E.12482
G1 X133.027 Y126.421 E.03954
G1 X132.184 Y126.421 E.02796
G1 X133.027 Y125.579 E.03954
G1 X136.79 Y125.579 E.12482
G1 X137.633 Y126.421 E.03954
G1 X136.79 Y126.421 E.02796
G1 X137.633 Y125.579 E.03954
G1 X139.989 Y125.579 E.07818
M73 P71 R3
G1 X141.016 Y125.2 E.03631
G1 X142.66 Y126.843 E.07708
G3 X142.659 Y125.157 I8.719 J-.843 E.056
G1 X141.016 Y126.8 E.07709
G1 X139.99 Y126.421 E.0363
G1 X139.456 Y126.421 E.01771
G1 X120.839 Y126.421 F30000
G1 F15476.087
G1 X119.21 Y126.421 E.05401
G1 X118.367 Y125.579 E.03954
G1 X119.21 Y125.579 E.02796
G1 X118.367 Y126.421 E.03954
G1 X116.01 Y126.421 E.07819
G1 X114.984 Y126.8 E.0363
G1 X113.34 Y125.157 E.07709
G3 X113.341 Y126.843 I-8.739 J.843 E.056
G1 X114.984 Y125.2 E.07708
G1 X116.01 Y125.579 E.0363
G1 X116.544 Y125.579 E.01771
G1 X111.567 Y123.075 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109664
G1 F15000
G1 X111.478 Y122.925 E.00095
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446332
G1 F15000
G1 X110.622 Y122.341 E.00863
; LINE_WIDTH: 0.414599
G1 X110.531 Y122.287 E.0032
; LINE_WIDTH: 0.374887
G1 X110.434 Y122.23 E.00304
; LINE_WIDTH: 0.337629
G1 X110.343 Y122.178 E.00253
; LINE_WIDTH: 0.302964
G1 X110.246 Y122.124 E.00234
; LINE_WIDTH: 0.270701
G1 X110.154 Y122.074 E.00195
; LINE_WIDTH: 0.240928
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.200959
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155936
G1 X109.679 Y121.834 E.00194
; LINE_WIDTH: 0.113913
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.567 Y128.925 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.109735
G1 F15000
G3 X111.423 Y129.117 I-.312 J-.085 E.00134
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446384
G1 F15000
G1 X110.622 Y129.658 E.00861
; LINE_WIDTH: 0.414684
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374911
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337614
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302939
G1 X110.246 Y129.876 E.00235
; LINE_WIDTH: 0.270675
G1 X110.154 Y129.926 E.00195
; LINE_WIDTH: 0.24092
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.200936
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155904
G1 X109.679 Y130.166 E.00194
; LINE_WIDTH: 0.113892
G1 X109.394 Y130.293 E.0018
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X116.874 Y132.711 Z1.4 F30000
G1 X139.546 Y140.73 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00903
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.526 J2.016 E.13656
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.526 J-2.017 E.1366
G1 X115.964 Y140.73 E.11947
G1 X139.486 Y140.73 E.78028
; WIPE_START
G1 X139.819 Y140.73 E-.12629
G1 X141.383 Y140.153 E-.63371
; WIPE_END
G1 E-.04 F1800
G1 X143.993 Y138.756 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X143.837 Y139.045 E.01091
G2 X143.977 Y144.238 I4.873 J2.467 E.17958
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.746 Y140.323 E.78648
G1 X143.937 Y138.777 E.14817
; WIPE_START
G1 X143.837 Y139.045 E-.10892
G1 X143.567 Y139.662 E-.25568
G1 X143.364 Y140.366 E-.27844
G1 X143.318 Y140.67 E-.11696
; WIPE_END
G1 E-.04 F1800
G1 X139.51 Y139.916 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X139.673 Y139.916 E.00541
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
M73 P72 R3
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.45 Y139.916 E.77425
; WIPE_START
G1 X139.673 Y139.916 E-.08476
G1 X141.34 Y139.301 E-.67524
; WIPE_END
G1 E-.04 F1800
G1 X133.853 Y140.782 Z1.4 F30000
G1 X107.199 Y146.057 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.055 E.0011
G3 X106.968 Y136.944 I.001 J-4.557 E.46827
G3 X107.362 Y136.944 I.2 J5.23 E.01308
G3 X107.564 Y146.037 I-.195 J4.553 E.45529
G1 X107.259 Y146.054 E.01012
G1 X107.15 Y145.651 F30000
G1 F15476.087
G1 X106.805 Y145.632 E.01148
G3 X106.985 Y137.351 I.362 J-4.134 E.41445
G3 X107.346 Y137.351 I.182 J4.771 E.01195
G3 X107.21 Y145.648 I-.179 J4.146 E.42515
G1 X107.377 Y145.25 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.256 E.00649
G3 X107.003 Y137.743 I0 J-3.758 E.35775
G3 X107.33 Y137.743 I.164 J4.337 E.01006
G3 X107.494 Y145.242 I-.163 J3.755 E.34771
G1 X107.437 Y145.246 E.00175
; WIPE_START
M204 S10000
G1 X107.166 Y145.256 E-.10299
G1 X106.839 Y145.245 E-.12464
G1 X106.378 Y145.175 E-.17721
G1 X106.036 Y145.086 E-.13426
G1 X105.727 Y144.973 E-.12471
G1 X105.498 Y144.866 E-.09619
; WIPE_END
G1 E-.04 F1800
G1 X113.002 Y143.474 Z1.4 F30000
G1 X147.826 Y137.014 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.022 Y136.979 E.00658
G3 X148.418 Y136.944 I.596 J4.518 E.0132
G3 X148.812 Y136.944 I.2 J5.245 E.01308
G3 X147.63 Y137.048 I-.195 J4.553 E.91036
G1 X147.767 Y137.024 E.00463
G1 X147.92 Y137.408 F30000
G1 F15476.087
G1 X148.436 Y137.351 E.01721
G3 X148.796 Y137.351 I.181 J4.786 E.01195
G3 X147.861 Y137.417 I-.179 J4.146 E.83385
G1 X147.998 Y137.793 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.453 Y137.743 E.01405
G3 X148.78 Y137.743 I.164 J4.354 E.01006
G3 X147.939 Y137.801 I-.163 J3.755 E.69963
; WIPE_START
M204 S10000
G1 X148.453 Y137.743 E-.19651
G1 X148.78 Y137.743 E-.12436
G1 X149.107 Y137.772 E-.12492
G1 X149.43 Y137.829 E-.12465
G1 X149.902 Y137.966 E-.18661
G1 X149.909 Y137.969 E-.00295
; WIPE_END
G1 E-.04 F1800
G1 X142.359 Y139.085 Z1.4 F30000
G1 X139.492 Y139.509 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.0036
G1 X147.031 Y136.767 E.26273
G3 X148.682 Y136.51 I1.632 J5.048 E.05566
G3 X146.806 Y146.151 I-.067 J4.99 E.57924
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.25481
G3 X108.976 Y136.848 I-1.808 J-4.651 E.64286
G1 X116.182 Y139.509 E.25481
G1 X139.432 Y139.509 E.77124
G1 X139.474 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00178
G1 X146.9 Y136.382 E.26067
G3 X148.683 Y136.103 I1.767 J5.46 E.06012
G3 X146.667 Y146.533 I-.068 J5.397 E.62634
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.116 Y136.466 I-1.949 J-5.034 E.69477
G1 X116.255 Y139.102 E.25243
G1 X139.414 Y139.102 E.76823
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.011 E.23962
G3 X148.684 Y135.711 I1.896 J5.856 E.05966
G3 X146.533 Y146.902 I-.069 J5.789 E.6222
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23173
G3 X109.25 Y136.097 I-2.083 J-5.402 E.68982
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.045 Y137.982 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.445789
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414632
G1 X145.361 Y137.787 E.00347
; LINE_WIDTH: 0.374498
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.337074
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302142
G1 X145.641 Y137.626 E.00222
; LINE_WIDTH: 0.269787
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.239842
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.224722
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.199591
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.15466
G1 X146.211 Y137.336 E.00193
; LINE_WIDTH: 0.113296
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.425 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.10753
G1 F15000
G2 X144.468 Y144.616 I.494 J-.222 E.00127
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.44596
G1 F15000
G1 X145.266 Y145.156 E.00845
; LINE_WIDTH: 0.412523
G1 X145.376 Y145.221 E.00385
; LINE_WIDTH: 0.368417
G1 X145.477 Y145.281 E.00313
; LINE_WIDTH: 0.331608
G1 X145.562 Y145.329 E.00227
; LINE_WIDTH: 0.301464
G1 X145.641 Y145.373 E.00192
; LINE_WIDTH: 0.271426
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.24153
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226432
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201324
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156422
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114057
G1 X146.498 Y145.793 E.00182
G1 X121.236 Y141.078 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.865 Y141.078 E.05401
G1 X123.707 Y141.921 E.03954
G1 X122.865 Y141.921 E.02796
G1 X123.707 Y141.078 E.03954
G1 X127.47 Y141.078 E.12482
G1 X128.313 Y141.921 E.03954
G1 X127.47 Y141.921 E.02796
G1 X128.313 Y141.078 E.03954
G1 X132.076 Y141.078 E.12482
G1 X132.918 Y141.921 E.03954
G1 X132.076 Y141.921 E.02796
G1 X132.918 Y141.078 E.03954
G1 X136.681 Y141.078 E.12482
G1 X137.524 Y141.921 E.03954
G1 X136.681 Y141.921 E.02796
G1 X137.524 Y141.078 E.03954
G1 X139.881 Y141.078 E.07818
G1 X140.908 Y140.699 E.03631
G1 X142.551 Y142.342 E.07708
G3 X142.551 Y140.657 I8.719 J-.843 E.056
G1 X140.908 Y142.3 E.07709
G1 X139.881 Y141.921 E.0363
G1 X139.347 Y141.921 E.01771
G1 X120.73 Y141.921 F30000
G1 F15476.087
G1 X119.102 Y141.921 E.05401
G1 X118.259 Y141.078 E.03954
G1 X119.102 Y141.078 E.02796
G1 X118.259 Y141.921 E.03954
G1 X115.902 Y141.921 E.07819
G1 X114.875 Y142.3 E.0363
G1 X113.232 Y140.657 E.07709
G3 X113.232 Y142.342 I-8.739 J.843 E.056
G1 X114.875 Y140.699 E.07708
G1 X115.902 Y141.078 E.0363
G1 X116.436 Y141.078 E.01771
G1 X111.459 Y138.574 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109664
G1 F15000
G1 X111.369 Y138.425 E.00095
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446332
G1 F15000
G1 X110.513 Y137.841 E.00863
; LINE_WIDTH: 0.414599
G1 X110.422 Y137.787 E.0032
; LINE_WIDTH: 0.374887
G1 X110.326 Y137.729 E.00304
; LINE_WIDTH: 0.337629
G1 X110.234 Y137.678 E.00253
; LINE_WIDTH: 0.302964
G1 X110.138 Y137.623 E.00234
; LINE_WIDTH: 0.270701
G1 X110.045 Y137.573 E.00195
; LINE_WIDTH: 0.240928
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.200959
G1 X109.76 Y137.426 E.00273
; LINE_WIDTH: 0.155936
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113913
G1 X109.285 Y137.206 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y144.425 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.109735
G1 F15000
G3 X111.315 Y144.616 I-.312 J-.085 E.00134
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446384
G1 F15000
G1 X110.513 Y145.158 E.00861
; LINE_WIDTH: 0.414684
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374911
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.337614
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302939
G1 X110.138 Y145.376 E.00235
; LINE_WIDTH: 0.270675
G1 X110.045 Y145.426 E.00195
; LINE_WIDTH: 0.24092
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200936
G1 X109.76 Y145.574 E.00273
; LINE_WIDTH: 0.155904
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113892
G1 X109.285 Y145.793 E.0018
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 6/15
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
; object ids of layer 6 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer6 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00903
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.525 J2.016 E.13656
G1 X139.927 Y126.77 E.11948
M73 P73 R3
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.525 J-2.017 E.1366
G1 X116.072 Y125.23 E.11948
G1 X139.595 Y125.23 E.78029
G1 X139.637 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00721
G1 X144.085 Y123.263 E.14957
G2 X144.085 Y128.739 I4.78 J2.737 E.19011
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.577 Y124.823 E.77727
G1 X139.619 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.0054
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.559 Y124.416 E.77426
; WIPE_START
G1 X139.782 Y124.416 E-.08469
G1 X141.449 Y123.801 E-.67531
; WIPE_END
G1 E-.04 F1800
G1 X133.962 Y125.283 Z1.6 F30000
G1 X107.308 Y130.558 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.555 E.0011
G3 X107.076 Y121.445 I.001 J-4.557 E.46827
G3 X107.47 Y121.445 I.2 J5.591 E.01305
G3 X107.672 Y130.538 I-.194 J4.553 E.45533
G1 X107.368 Y130.555 E.01012
G1 X107.259 Y130.151 F30000
G1 F15476.087
G1 X106.913 Y130.132 E.01148
G3 X107.094 Y121.852 I.362 J-4.134 E.41445
G3 X107.453 Y121.852 I.182 J5.116 E.01193
G3 X107.318 Y130.148 I-.178 J4.146 E.42518
G1 X107.492 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.275 Y129.756 E.00667
G3 X107.111 Y122.244 I0 J-3.758 E.35775
G3 X107.438 Y122.243 I.164 J4.651 E.01005
G3 X107.603 Y129.742 I-.163 J3.755 E.34771
G1 X107.552 Y129.746 E.00156
; WIPE_START
M204 S10000
G1 X107.275 Y129.756 E-.10528
G1 X106.947 Y129.746 E-.12464
G1 X106.461 Y129.671 E-.18683
G1 X106.145 Y129.586 E-.12431
G1 X105.836 Y129.474 E-.12505
G1 X105.612 Y129.369 E-.09389
; WIPE_END
G1 E-.04 F1800
G1 X113.116 Y127.976 Z1.6 F30000
G1 X147.982 Y121.505 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.526 Y121.445 E.01815
G3 X148.92 Y121.445 I.2 J5.591 E.01305
G3 X147.923 Y121.512 I-.194 J4.553 E.91664
G1 X148.028 Y121.908 F30000
G1 F15476.087
G1 X148.544 Y121.852 E.01721
G3 X148.903 Y121.852 I.182 J5.116 E.01193
G3 X147.969 Y121.917 I-.178 J4.146 E.83387
G1 X148.084 Y122.296 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.561 Y122.244 E.01474
G3 X148.888 Y122.243 I.164 J4.651 E.01005
G3 X148.025 Y122.306 I-.163 J3.755 E.69895
; WIPE_START
M204 S10000
G1 X148.561 Y122.244 E-.20501
G1 X148.888 Y122.243 E-.12425
G1 X149.216 Y122.272 E-.12501
G1 X149.539 Y122.329 E-.12462
G1 X149.855 Y122.414 E-.12432
G1 X149.994 Y122.468 E-.05679
; WIPE_END
G1 E-.04 F1800
G1 X142.444 Y123.587 Z1.6 F30000
G1 X139.601 Y124.009 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00359
G1 X147.14 Y121.268 E.26274
G3 X148.773 Y121.011 I1.632 J5.048 E.05507
G3 X146.915 Y130.651 I-.052 J4.989 E.57954
G1 X139.709 Y127.991 E.25482
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.2548
G3 X109.085 Y121.349 I-1.806 J-4.651 E.64261
G1 X116.291 Y124.009 E.25479
G1 X139.541 Y124.009 E.77125
G1 X139.583 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.456 Y126.421 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.99 Y126.421 E.01771
G1 X141.016 Y126.8 E.0363
G1 X142.659 Y125.157 E.07709
G2 X142.66 Y126.843 I8.722 J.843 E.056
G1 X141.016 Y125.2 E.07708
G1 X139.989 Y125.579 E.03631
G1 X137.633 Y125.579 E.07818
G1 X136.79 Y126.421 E.03954
G1 X137.633 Y126.421 E.02796
G1 X136.79 Y125.579 E.03954
G1 X133.027 Y125.579 E.12482
G1 X132.184 Y126.421 E.03954
G1 X133.027 Y126.421 E.02796
G1 X132.184 Y125.579 E.03954
G1 X128.421 Y125.579 E.12482
G1 X127.579 Y126.421 E.03954
G1 X128.421 Y126.421 E.02796
G1 X127.579 Y125.579 E.03954
G1 X123.816 Y125.579 E.12482
G1 X122.973 Y126.421 E.03954
G1 X123.816 Y126.421 E.02796
G1 X122.973 Y125.579 E.03954
G1 X121.345 Y125.579 E.05401
G1 X116.544 Y125.579 F30000
G1 F15476.087
G1 X116.01 Y125.579 E.01771
G1 X114.984 Y125.2 E.0363
G1 X113.34 Y126.843 E.07709
G2 X113.339 Y125.155 I-8.551 J-.834 E.05607
G1 X114.984 Y126.8 E.07718
G1 X116.01 Y126.421 E.0363
G1 X118.367 Y126.421 E.07819
G1 X119.21 Y125.579 E.03954
G1 X118.367 Y125.579 E.02796
G1 X119.21 Y126.421 E.03954
G1 X120.839 Y126.421 E.05401
G1 X111.568 Y128.924 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109716
G1 F15000
G1 X111.478 Y129.075 E.00096
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446367
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414646
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374896
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337602
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302897
G1 X110.246 Y129.877 E.00235
; LINE_WIDTH: 0.261519
G1 X110.096 Y129.957 E.00304
; LINE_WIDTH: 0.222878
G1 X109.986 Y130.014 E.00181
; LINE_WIDTH: 0.192488
G1 X109.874 Y130.072 E.00154
; LINE_WIDTH: 0.15648
G1 X109.679 Y130.166 E.002
; LINE_WIDTH: 0.113925
G1 X109.394 Y130.293 E.00181
; WIPE_START
G1 X109.679 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y123.075 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.109689
G1 F15000
G1 X111.478 Y122.925 E.00095
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.445173
G1 F15000
G1 X110.616 Y122.338 E.00882
; LINE_WIDTH: 0.409005
G1 X110.509 Y122.275 E.00371
; LINE_WIDTH: 0.363739
G1 X110.397 Y122.209 E.00339
; LINE_WIDTH: 0.327246
G1 X110.324 Y122.167 E.00194
; LINE_WIDTH: 0.299449
G1 X110.246 Y122.123 E.00187
; LINE_WIDTH: 0.270657
G1 X110.154 Y122.074 E.00194
; LINE_WIDTH: 0.240943
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.200966
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155929
G1 X109.679 Y121.834 E.00194
; LINE_WIDTH: 0.113903
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.306 Y122.107 Z1.6 F30000
G1 X144.432 Y123.075 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.109548
G1 F15000
G3 X144.576 Y122.885 I.31 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.4458
G1 F15000
G1 X145.371 Y122.347 E.00842
; LINE_WIDTH: 0.414652
G1 X145.47 Y122.288 E.00346
; LINE_WIDTH: 0.374524
G1 X145.561 Y122.234 E.00286
; LINE_WIDTH: 0.337083
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302153
G1 X145.75 Y122.127 E.00222
; LINE_WIDTH: 0.269792
G1 X145.847 Y122.075 E.00204
; LINE_WIDTH: 0.239842
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.205036
G1 X146.091 Y121.947 E.00226
; LINE_WIDTH: 0.160063
G1 X146.314 Y121.839 E.00237
; LINE_WIDTH: 0.113703
G1 X146.59 Y121.715 E.00174
; WIPE_START
G1 X146.314 Y121.839 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z1.6 F30000
M73 P74 R3
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.107567
G1 F15000
G2 X144.577 Y129.117 I.494 J-.221 E.00128
G1 X145.154 Y129.522 F30000
; LINE_WIDTH: 0.415811
G1 F15000
G2 X145.488 Y129.724 I11.422 J-18.515 E.01184
; LINE_WIDTH: 0.372265
G1 X145.56 Y129.767 E.00225
; LINE_WIDTH: 0.338782
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303756
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271372
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241479
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226397
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201311
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156432
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114064
G1 X146.606 Y130.293 E.00182
; OBJECT_ID: 104
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X142.2 Y136.59 Z1.6 F30000
G1 X139.547 Y140.73 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00903
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.525 J2.016 E.13656
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.525 J-2.017 E.1366
G1 X115.964 Y140.73 E.11948
G1 X139.487 Y140.73 E.78029
G1 X139.528 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00721
G1 X143.976 Y138.762 E.14957
G2 X143.977 Y144.238 I4.78 J2.737 E.19011
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.468 Y140.323 E.77727
G1 X139.51 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.0054
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.45 Y139.916 E.77426
; WIPE_START
G1 X139.673 Y139.916 E-.08469
G1 X141.341 Y139.301 E-.67531
; WIPE_END
G1 E-.04 F1800
G1 X133.853 Y140.782 Z1.6 F30000
G1 X107.199 Y146.057 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.055 E.0011
G3 X106.968 Y136.944 I.001 J-4.557 E.46827
G3 X107.361 Y136.944 I.2 J5.591 E.01305
G3 X107.564 Y146.037 I-.194 J4.553 E.45533
G1 X107.259 Y146.054 E.01012
G1 X107.15 Y145.651 F30000
G1 F15476.087
G1 X106.805 Y145.632 E.01148
G3 X106.986 Y137.351 I.362 J-4.134 E.41445
G3 X107.345 Y137.351 I.182 J5.116 E.01193
G3 X107.21 Y145.648 I-.178 J4.146 E.42518
G1 X107.384 Y145.25 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.256 E.00667
G3 X107.003 Y137.743 I0 J-3.758 E.35775
G3 X107.33 Y137.743 I.164 J4.651 E.01005
G3 X107.494 Y145.242 I-.163 J3.755 E.34771
G1 X107.443 Y145.246 E.00156
; WIPE_START
M204 S10000
G1 X107.166 Y145.256 E-.10528
G1 X106.839 Y145.245 E-.12464
G1 X106.353 Y145.17 E-.18683
G1 X106.037 Y145.086 E-.12431
G1 X105.727 Y144.973 E-.12505
G1 X105.504 Y144.869 E-.09389
; WIPE_END
G1 E-.04 F1800
G1 X113.008 Y143.476 Z1.6 F30000
G1 X147.874 Y137.004 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.418 Y136.944 E.01815
G3 X148.811 Y136.944 I.2 J5.591 E.01305
G3 X147.814 Y137.011 I-.194 J4.553 E.91664
G1 X147.92 Y137.408 F30000
G1 F15476.087
G1 X148.436 Y137.351 E.01721
G3 X148.795 Y137.351 I.182 J5.116 E.01193
G3 X147.86 Y137.417 I-.178 J4.146 E.83387
G1 X147.976 Y137.795 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.453 Y137.743 E.01474
G3 X148.78 Y137.743 I.164 J4.651 E.01005
G3 X147.917 Y137.805 I-.163 J3.755 E.69895
; WIPE_START
M204 S10000
G1 X148.453 Y137.743 E-.20501
G1 X148.78 Y137.743 E-.12425
G1 X149.107 Y137.772 E-.12501
G1 X149.43 Y137.829 E-.12462
G1 X149.746 Y137.913 E-.12432
G1 X149.886 Y137.967 E-.05679
; WIPE_END
G1 E-.04 F1800
G1 X142.336 Y139.087 Z1.6 F30000
G1 X139.492 Y139.509 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00359
G1 X147.032 Y136.767 E.26274
G3 X148.665 Y136.51 I1.632 J5.048 E.05507
G3 X146.807 Y146.151 I-.052 J4.989 E.57954
G1 X139.601 Y143.49 E.25482
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.2548
G3 X108.977 Y136.848 I-1.806 J-4.651 E.64261
G1 X116.182 Y139.509 E.25479
G1 X139.432 Y139.509 E.77125
G1 X139.474 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00178
G1 X146.901 Y136.382 E.26068
G3 X148.666 Y136.103 I1.767 J5.46 E.05953
G3 X146.667 Y146.533 I-.054 J5.396 E.62664
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.117 Y136.466 I-1.946 J-5.034 E.69448
G1 X116.255 Y139.102 E.25242
G1 X139.414 Y139.102 E.76824
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.667 Y135.711 I1.897 J5.858 E.05912
G3 X147.594 Y147.197 I-.051 J5.788 E.58881
G3 X146.533 Y146.902 I1.058 J-5.851 E.03391
G1 X139.458 Y144.29 E.23173
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X108.189 Y135.802 I-2.083 J-5.402 E.65587
G3 X109.25 Y136.097 I-1.058 J5.851 E.03391
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.347 Y141.921 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.881 Y141.921 E.01771
G1 X140.908 Y142.3 E.0363
G1 X142.551 Y140.657 E.07709
G2 X142.551 Y142.342 I8.722 J.843 E.056
G1 X140.908 Y140.699 E.07708
G1 X139.881 Y141.078 E.03631
G1 X137.524 Y141.078 E.07818
G1 X136.681 Y141.921 E.03954
G1 X137.524 Y141.921 E.02796
G1 X136.681 Y141.078 E.03954
G1 X132.918 Y141.078 E.12482
G1 X132.076 Y141.921 E.03954
G1 X132.918 Y141.921 E.02796
G1 X132.076 Y141.078 E.03954
G1 X128.313 Y141.078 E.12482
G1 X127.47 Y141.921 E.03954
G1 X128.313 Y141.921 E.02796
G1 X127.47 Y141.078 E.03954
G1 X123.707 Y141.078 E.12482
G1 X122.865 Y141.921 E.03954
G1 X123.707 Y141.921 E.02796
G1 X122.865 Y141.078 E.03954
G1 X121.236 Y141.078 E.05401
G1 X116.436 Y141.078 F30000
G1 F15476.087
G1 X115.902 Y141.078 E.01771
G1 X114.875 Y140.699 E.0363
G1 X113.232 Y142.342 E.07709
G2 X113.23 Y140.655 I-8.551 J-.834 E.05607
G1 X114.875 Y142.3 E.07718
G1 X115.902 Y141.921 E.0363
G1 X118.259 Y141.921 E.07819
G1 X119.102 Y141.078 E.03954
G1 X118.259 Y141.078 E.02796
G1 X119.102 Y141.921 E.03954
G1 X120.73 Y141.921 E.05401
G1 X111.46 Y144.424 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109716
G1 F15000
G1 X111.369 Y144.574 E.00096
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446367
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414646
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374896
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.337602
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302897
G1 X110.137 Y145.376 E.00235
; LINE_WIDTH: 0.261519
G1 X109.987 Y145.457 E.00304
; LINE_WIDTH: 0.222878
G1 X109.878 Y145.513 E.00181
; LINE_WIDTH: 0.192488
G1 X109.765 Y145.571 E.00154
; LINE_WIDTH: 0.15648
G1 X109.57 Y145.665 E.002
; LINE_WIDTH: 0.113925
G1 X109.285 Y145.793 E.00181
; WIPE_START
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y138.575 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.109689
G1 F15000
G1 X111.369 Y138.425 E.00095
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.445173
G1 F15000
G1 X110.507 Y137.837 E.00882
; LINE_WIDTH: 0.409005
G1 X110.4 Y137.774 E.00371
; LINE_WIDTH: 0.363739
G1 X110.288 Y137.708 E.00339
; LINE_WIDTH: 0.327246
G1 X110.215 Y137.667 E.00194
; LINE_WIDTH: 0.299449
G1 X110.137 Y137.623 E.00187
; LINE_WIDTH: 0.270657
G1 X110.045 Y137.573 E.00194
; LINE_WIDTH: 0.240943
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.200966
G1 X109.76 Y137.426 E.00273
; LINE_WIDTH: 0.155929
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113903
G1 X109.285 Y137.207 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.198 Y137.606 Z1.6 F30000
G1 X144.324 Y138.575 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.109548
G1 F15000
G3 X144.467 Y138.385 I.31 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.4458
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414652
G1 X145.361 Y137.787 E.00346
; LINE_WIDTH: 0.374524
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.337083
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302153
G1 X145.641 Y137.626 E.00222
; LINE_WIDTH: 0.269792
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.239842
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.205036
G1 X145.983 Y137.447 E.00226
; LINE_WIDTH: 0.160063
G1 X146.206 Y137.338 E.00237
; LINE_WIDTH: 0.113703
G1 X146.482 Y137.214 E.00174
; WIPE_START
G1 X146.206 Y137.338 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y144.424 Z1.6 F30000
M73 P75 R3
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.107567
G1 F15000
G2 X144.468 Y144.616 I.494 J-.221 E.00128
G1 X145.046 Y145.022 F30000
; LINE_WIDTH: 0.415811
G1 F15000
G2 X145.379 Y145.223 I11.422 J-18.515 E.01184
; LINE_WIDTH: 0.372265
G1 X145.451 Y145.266 E.00225
; LINE_WIDTH: 0.338782
G1 X145.549 Y145.321 E.00271
; LINE_WIDTH: 0.303756
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271372
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241479
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226397
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201311
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156432
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114064
G1 X146.498 Y145.793 E.00182
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 7/15
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
; object ids of layer 7 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer7 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00902
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.459 J2.016 E.13662
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.525 J-2.017 E.1366
G1 X116.072 Y125.23 E.11948
G1 X139.595 Y125.23 E.78029
G1 X139.637 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00721
G1 X144.085 Y123.263 E.14957
G2 X144.085 Y128.739 I4.752 J2.737 E.19019
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.577 Y124.823 E.77728
G1 X139.619 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.0054
G1 X144.93 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.689 J3.327 E.24192
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.687 J-3.329 E.24202
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.559 Y124.416 E.77427
; WIPE_START
G1 X139.782 Y124.416 E-.08461
G1 X141.449 Y123.801 E-.67539
; WIPE_END
G1 E-.04 F1800
G1 X133.962 Y125.28 Z1.8 F30000
G1 X107.242 Y130.558 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X106.878 Y130.54 E.01211
G3 X106.877 Y121.458 I.403 J-4.541 E.44828
G1 X107.087 Y121.444 E.00698
G3 X107.302 Y130.558 I.194 J4.555 E.48082
G1 X107.259 Y130.151 F30000
G1 F15476.087
G1 X106.913 Y130.135 E.01148
G3 X106.913 Y121.864 I.366 J-4.136 E.40836
G1 X107.101 Y121.851 E.00624
G3 X107.319 Y130.151 I.178 J4.148 E.43725
G1 X107.499 Y129.75 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.275 Y129.759 E.0069
G3 X106.947 Y122.254 I.002 J-3.76 E.35274
G1 X107.113 Y122.243 E.00512
G3 X107.603 Y129.745 I.163 J3.756 E.35791
G1 X107.559 Y129.747 E.00134
; WIPE_START
M204 S10000
G1 X107.275 Y129.759 E-.10808
G1 X106.947 Y129.746 E-.12467
G1 X106.622 Y129.703 E-.12459
G1 X106.144 Y129.586 E-.18686
G1 X105.836 Y129.474 E-.12473
G1 X105.621 Y129.368 E-.09106
; WIPE_END
G1 E-.04 F1800
G1 X113.125 Y127.975 Z1.8 F30000
G1 X147.885 Y121.522 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.933 Y121.51 E.00163
G3 X148.327 Y121.458 I.798 J4.489 E.01318
G1 X148.537 Y121.444 E.00698
G3 X147.355 Y121.653 I.194 J4.555 E.91026
G1 X147.827 Y121.536 E.01615
G1 X147.98 Y121.917 F30000
G1 F15476.087
G1 X148.004 Y121.911 E.00081
G3 X148.363 Y121.864 I.725 J4.088 E.01201
G1 X148.551 Y121.851 E.00624
G3 X147.477 Y122.041 I.178 J4.148 E.82907
G1 X147.922 Y121.931 E.01521
G1 X148.069 Y122.298 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.072 Y122.297 E.00009
G3 X148.397 Y122.254 I.654 J3.702 E.01008
G1 X148.563 Y122.243 E.00512
G3 X147.752 Y122.368 I.163 J3.756 E.70057
G1 X148.011 Y122.311 E.00814
; WIPE_START
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
G1 X142.433 Y123.586 Z1.8 F30000
G1 X139.601 Y124.009 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00358
G1 X147.14 Y121.268 E.26274
G3 X148.756 Y121.011 I1.632 J5.051 E.05449
G3 X146.915 Y130.651 I-.035 J4.989 E.58014
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.084 Y130.652 E.25484
G3 X109.085 Y121.349 I-1.805 J-4.652 E.64254
G1 X116.291 Y124.009 E.25481
G1 X139.541 Y124.009 E.77126
G1 X139.583 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.433 Y123.075 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109499
G1 F15000
G3 X144.576 Y122.885 I.309 J.084 E.00132
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445793
G1 F15000
G1 X145.371 Y122.346 E.00842
; LINE_WIDTH: 0.414643
G1 X145.47 Y122.288 E.00346
; LINE_WIDTH: 0.374549
G1 X145.56 Y122.234 E.00285
; LINE_WIDTH: 0.337111
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302133
G1 X145.75 Y122.127 E.00223
; LINE_WIDTH: 0.26974
G1 X145.847 Y122.075 E.00204
; LINE_WIDTH: 0.239787
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224671
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.199568
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154649
G1 X146.32 Y121.836 E.00192
; LINE_WIDTH: 0.113306
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.107558
G1 F15000
G2 X144.577 Y129.117 I.494 J-.221 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446798
G1 F15000
G1 X145.371 Y129.654 E.00833
; LINE_WIDTH: 0.416333
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.376205
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338755
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303797
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271424
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241491
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226389
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201311
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156438
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114064
G1 X146.606 Y130.293 E.00182
G1 X125.95 Y125.579 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.579 Y125.579 E.05401
G1 X128.421 Y126.421 E.03954
G1 X127.579 Y126.421 E.02796
G1 X128.421 Y125.579 E.03954
G1 X132.184 Y125.579 E.12482
G1 X133.027 Y126.421 E.03954
G1 X132.184 Y126.421 E.02796
G1 X133.027 Y125.579 E.03954
G1 X136.79 Y125.579 E.12482
G1 X137.633 Y126.421 E.03954
G1 X136.79 Y126.421 E.02796
G1 X137.633 Y125.579 E.03954
G1 X139.989 Y125.579 E.07818
G1 X141.016 Y125.2 E.03631
G1 X142.666 Y126.849 E.07739
G3 X142.659 Y125.157 I8.147 J-.878 E.05623
G1 X141.016 Y126.8 E.07708
G1 X139.99 Y126.421 E.0363
G1 X139.456 Y126.421 E.01771
G1 X125.444 Y126.421 F30000
G1 F15476.087
G1 X123.816 Y126.421 E.05401
G1 X122.973 Y125.579 E.03954
G1 X123.816 Y125.579 E.02796
G1 X122.973 Y126.421 E.03954
G1 X119.21 Y126.421 E.12482
G1 X118.367 Y125.579 E.03954
G1 X119.21 Y125.579 E.02796
G1 X118.367 Y126.421 E.03954
G1 X116.01 Y126.421 E.07819
G1 X114.984 Y126.8 E.0363
G1 X113.341 Y125.157 E.07708
G3 X113.341 Y126.843 I-8.738 J.843 E.056
G1 X114.984 Y125.2 E.07708
G1 X116.01 Y125.579 E.0363
G1 X116.544 Y125.579 E.01771
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109704
G1 F15000
G1 X111.478 Y122.925 E.00096
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446396
G1 F15000
G1 X110.622 Y122.342 E.00862
; LINE_WIDTH: 0.414693
G1 X110.531 Y122.287 E.0032
; LINE_WIDTH: 0.374913
G1 X110.434 Y122.23 E.00305
; LINE_WIDTH: 0.337604
G1 X110.342 Y122.178 E.00253
; LINE_WIDTH: 0.302895
G1 X110.246 Y122.123 E.00235
; LINE_WIDTH: 0.270661
G1 X110.154 Y122.074 E.00194
; LINE_WIDTH: 0.240979
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.200978
G1 X109.869 Y121.926 E.00274
; LINE_WIDTH: 0.155942
G1 X109.679 Y121.835 E.00194
; LINE_WIDTH: 0.113938
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.576 Y128.908 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.10964
M73 P76 R3
G1 F15000
G1 X111.477 Y129.075 E.00105
G1 X111.422 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446355
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414628
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374881
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337591
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302886
G1 X110.246 Y129.877 E.00235
; LINE_WIDTH: 0.270631
G1 X110.154 Y129.926 E.00194
; LINE_WIDTH: 0.240929
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.200977
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155943
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.113921
G1 X109.394 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X116.875 Y132.711 Z1.8 F30000
G1 X139.547 Y140.73 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00902
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.459 J2.016 E.13662
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.525 J-2.017 E.1366
G1 X115.964 Y140.73 E.11948
G1 X139.487 Y140.73 E.78029
G1 X139.529 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00721
G1 X143.976 Y138.762 E.14957
G2 X143.977 Y144.238 I4.752 J2.737 E.19019
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.469 Y140.323 E.77728
G1 X139.511 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.0054
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.689 J3.327 E.24192
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.687 J-3.329 E.24202
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.451 Y139.916 E.77427
; WIPE_START
G1 X139.673 Y139.916 E-.08461
G1 X141.341 Y139.301 E-.67539
; WIPE_END
G1 E-.04 F1800
G1 X133.853 Y140.78 Z1.8 F30000
G1 X107.134 Y146.057 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X106.769 Y146.04 E.01211
G3 X106.769 Y136.958 I.403 J-4.541 E.44828
G1 X106.979 Y136.944 E.00698
G3 X107.194 Y146.057 I.194 J4.555 E.48082
G1 X107.15 Y145.651 F30000
G1 F15476.087
G1 X106.805 Y145.634 E.01148
G3 X106.804 Y137.363 I.366 J-4.136 E.40836
G1 X106.992 Y137.351 E.00624
G3 X107.21 Y145.65 I.178 J4.148 E.43725
G1 X107.391 Y145.25 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.259 E.0069
G3 X106.839 Y137.754 I.002 J-3.76 E.35274
G1 X107.005 Y137.743 E.00512
G3 X107.494 Y145.244 I.163 J3.756 E.35791
G1 X107.451 Y145.247 E.00134
; WIPE_START
M204 S10000
G1 X107.166 Y145.259 E-.10808
G1 X106.839 Y145.245 E-.12467
G1 X106.514 Y145.202 E-.12459
G1 X106.036 Y145.086 E-.18686
G1 X105.727 Y144.973 E-.12473
G1 X105.513 Y144.867 E-.09106
; WIPE_END
G1 E-.04 F1800
G1 X113.017 Y143.474 Z1.8 F30000
G1 X147.777 Y137.021 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.825 Y137.01 E.00163
G3 X148.219 Y136.958 I.798 J4.489 E.01318
G1 X148.429 Y136.944 E.00698
G3 X147.246 Y137.152 I.194 J4.555 E.91026
G1 X147.719 Y137.036 E.01615
G1 X147.872 Y137.416 F30000
G1 F15476.087
G1 X147.895 Y137.411 E.00081
G3 X148.254 Y137.363 I.725 J4.088 E.01201
G1 X148.442 Y137.351 E.00624
G3 X147.368 Y137.54 I.178 J4.148 E.82907
G1 X147.814 Y137.431 E.01521
G1 X147.961 Y137.797 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.964 Y137.797 E.00009
G3 X148.289 Y137.754 I.654 J3.702 E.01008
G1 X148.455 Y137.743 E.00512
G3 X147.643 Y137.868 I.163 J3.756 E.70057
G1 X147.902 Y137.81 E.00814
; WIPE_START
M204 S10000
G1 X147.964 Y137.797 E-.02397
G1 X148.289 Y137.754 E-.1246
G1 X148.455 Y137.743 E-.06327
G1 X148.944 Y137.754 E-.18604
G1 X149.269 Y137.797 E-.12459
G1 X149.54 Y137.856 E-.10542
G1 X149.873 Y137.957 E-.13211
; WIPE_END
G1 E-.04 F1800
G1 X142.324 Y139.085 Z1.8 F30000
G1 X139.493 Y139.509 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00358
G1 X147.032 Y136.767 E.26274
G3 X148.647 Y136.51 I1.632 J5.051 E.05449
G3 X146.806 Y146.151 I-.035 J4.989 E.58014
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.975 Y146.151 E.25484
G3 X108.976 Y136.848 I-1.805 J-4.652 E.64254
G1 X116.182 Y139.509 E.25481
G1 X139.433 Y139.509 E.77126
G1 X139.474 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00177
G1 X146.9 Y136.382 E.26067
G3 X148.649 Y136.103 I1.768 J5.463 E.05896
G3 X146.667 Y146.533 I-.036 J5.396 E.62721
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25245
G3 X109.116 Y136.466 I-1.948 J-5.034 E.69475
G1 X116.255 Y139.102 E.25243
G1 X139.414 Y139.102 E.76824
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.65 Y135.711 I1.898 J5.861 E.05859
G3 X146.533 Y146.902 I-.037 J5.788 E.62299
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X108.137 Y147.206 I-2.113 J-5.538 E.0355
G3 X109.25 Y136.097 I-.967 J-5.707 E.65398
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y138.574 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109499
G1 F15000
G3 X144.467 Y138.385 I.309 J.084 E.00132
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445793
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414643
G1 X145.361 Y137.788 E.00346
; LINE_WIDTH: 0.374549
G1 X145.452 Y137.734 E.00285
; LINE_WIDTH: 0.337111
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302133
G1 X145.641 Y137.626 E.00223
; LINE_WIDTH: 0.26974
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.239787
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.224671
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.199568
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154649
G1 X146.211 Y137.336 E.00192
; LINE_WIDTH: 0.113306
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.424 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.107558
G1 F15000
G2 X144.468 Y144.616 I.494 J-.221 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446798
G1 F15000
G1 X145.262 Y145.153 E.00833
; LINE_WIDTH: 0.416333
G1 X145.36 Y145.212 E.00348
; LINE_WIDTH: 0.376205
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338755
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303797
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271424
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241491
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226389
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201311
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156438
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114064
G1 X146.498 Y145.793 E.00182
G1 X125.842 Y141.078 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.47 Y141.078 E.05401
G1 X128.313 Y141.921 E.03954
G1 X127.47 Y141.921 E.02796
G1 X128.313 Y141.078 E.03954
G1 X132.076 Y141.078 E.12482
G1 X132.918 Y141.921 E.03954
G1 X132.076 Y141.921 E.02796
G1 X132.918 Y141.078 E.03954
G1 X136.681 Y141.078 E.12482
G1 X137.524 Y141.921 E.03954
G1 X136.681 Y141.921 E.02796
G1 X137.524 Y141.078 E.03954
G1 X139.881 Y141.078 E.07818
G1 X140.908 Y140.699 E.03631
G1 X142.558 Y142.349 E.07739
G3 X142.551 Y140.657 I8.147 J-.878 E.05623
G1 X140.908 Y142.3 E.07708
G1 X139.881 Y141.921 E.0363
G1 X139.347 Y141.921 E.01771
G1 X125.336 Y141.921 F30000
G1 F15476.087
G1 X123.707 Y141.921 E.05401
G1 X122.865 Y141.078 E.03954
G1 X123.707 Y141.078 E.02796
G1 X122.865 Y141.921 E.03954
G1 X119.102 Y141.921 E.12482
G1 X118.259 Y141.078 E.03954
G1 X119.102 Y141.078 E.02796
G1 X118.259 Y141.921 E.03954
G1 X115.902 Y141.921 E.07819
G1 X114.875 Y142.3 E.0363
G1 X113.232 Y140.657 E.07708
G3 X113.232 Y142.342 I-8.738 J.843 E.056
G1 X114.875 Y140.699 E.07708
G1 X115.902 Y141.078 E.0363
G1 X116.436 Y141.078 E.01771
G1 X111.46 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109704
G1 F15000
G1 X111.369 Y138.425 E.00096
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446396
G1 F15000
G1 X110.513 Y137.841 E.00862
; LINE_WIDTH: 0.414693
G1 X110.422 Y137.787 E.0032
; LINE_WIDTH: 0.374913
G1 X110.326 Y137.729 E.00305
; LINE_WIDTH: 0.337604
G1 X110.234 Y137.677 E.00253
; LINE_WIDTH: 0.302895
G1 X110.137 Y137.623 E.00235
; LINE_WIDTH: 0.270661
G1 X110.045 Y137.573 E.00194
; LINE_WIDTH: 0.240979
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.200978
G1 X109.76 Y137.425 E.00274
; LINE_WIDTH: 0.155942
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113938
G1 X109.285 Y137.207 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P77 R3
G1 X111.468 Y144.407 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.10964
G1 F15000
G1 X111.369 Y144.574 E.00105
G1 X111.314 Y144.617 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446355
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414628
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374881
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.337591
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302886
G1 X110.137 Y145.376 E.00235
; LINE_WIDTH: 0.270631
G1 X110.045 Y145.426 E.00194
; LINE_WIDTH: 0.240929
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200977
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155943
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113921
G1 X109.285 Y145.793 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 8/15
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
; object ids of layer 8 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer8 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.655 Y125.23
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00901
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.526 J2.016 E.13656
G1 X139.927 Y126.77 E.11947
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.458 J-2.017 E.13666
G1 X116.072 Y125.23 E.11948
G1 X139.595 Y125.23 E.7803
G1 X139.637 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.0072
G1 X144.085 Y123.263 E.14956
G2 X144.085 Y128.739 I4.781 J2.737 E.1901
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.752 J-2.739 E.19025
G1 X116.145 Y124.823 E.1496
G1 X139.577 Y124.823 E.77729
G1 X139.619 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00539
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.687 J-3.329 E.24202
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.559 Y124.416 E.77428
; WIPE_START
G1 X139.782 Y124.416 E-.08453
G1 X141.449 Y123.801 E-.67547
; WIPE_END
G1 E-.04 F1800
G1 X133.963 Y125.288 Z2 F30000
G1 X107.473 Y130.551 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.558 E.00657
G3 X106.878 Y121.458 I.006 J-4.559 E.46149
G1 X107.087 Y121.444 E.00697
G3 X107.672 Y130.541 I.194 J4.555 E.46853
G1 X107.533 Y130.548 E.00463
G1 X107.456 Y130.144 F30000
G1 F15476.087
G1 X107.275 Y130.151 E.006
G3 X106.913 Y121.864 I.004 J-4.152 E.42038
G1 X107.101 Y121.851 E.00623
G3 X107.637 Y130.135 I.178 J4.148 E.42669
G1 X107.516 Y130.141 E.00403
G1 X107.505 Y129.751 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.439 Y129.756 E.00203
G3 X106.947 Y122.254 I-.162 J-3.756 E.35777
G1 X107.113 Y122.243 E.00512
G3 X107.766 Y129.727 I.163 J3.756 E.35288
G1 X107.564 Y129.745 E.00621
; WIPE_START
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
G1 X113.128 Y127.981 Z2 F30000
G1 X147.886 Y121.522 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.933 Y121.51 E.00163
G3 X148.328 Y121.458 I.798 J4.489 E.0132
G1 X148.537 Y121.444 E.00697
G3 X147.355 Y121.653 I.194 J4.555 E.91023
G1 X147.827 Y121.536 E.01615
G1 X147.98 Y121.917 F30000
G1 F15476.087
G1 X148.004 Y121.911 E.0008
G3 X148.363 Y121.864 I.725 J4.088 E.01202
G1 X148.551 Y121.851 E.00623
G3 X147.477 Y122.041 I.178 J4.148 E.82905
G1 X147.922 Y121.931 E.01522
G1 X148.045 Y122.304 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.072 Y122.297 E.00085
G3 X148.397 Y122.254 I.655 J3.702 E.01008
G1 X148.563 Y122.243 E.00512
G3 X147.595 Y122.414 I.163 J3.756 E.69553
G1 X147.987 Y122.318 E.01242
; WIPE_START
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
G1 X142.411 Y123.586 Z2 F30000
G1 X139.601 Y124.009 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00358
G1 X147.14 Y121.268 E.26273
G3 X148.739 Y121.011 I1.634 J5.057 E.05393
G3 X146.915 Y130.651 I-.014 J4.99 E.58095
G1 X139.709 Y127.991 E.25482
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.2548
G3 X109.085 Y121.349 I-1.806 J-4.651 E.64261
G1 X116.291 Y124.009 E.25479
G1 X139.541 Y124.009 E.77126
G1 X139.583 Y123.602 F30000
G1 F15476.087
G1 X139.636 Y123.602 E.00176
G1 X147.009 Y120.882 E.26067
G3 X148.74 Y120.604 I1.769 J5.469 E.05838
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.456 Y126.421 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.99 Y126.421 E.01771
G1 X141.016 Y126.8 E.0363
G1 X142.66 Y125.157 E.0771
G2 X142.666 Y126.849 I8.124 J.816 E.05624
G1 X141.016 Y125.2 E.07739
G1 X139.989 Y125.579 E.03631
G1 X137.633 Y125.579 E.07818
G1 X136.79 Y126.421 E.03954
G1 X137.633 Y126.421 E.02796
G1 X136.79 Y125.579 E.03954
G1 X133.027 Y125.579 E.12482
G1 X132.184 Y126.421 E.03954
G1 X133.027 Y126.421 E.02796
G1 X132.184 Y125.579 E.03954
G1 X128.421 Y125.579 E.12482
G1 X127.579 Y126.421 E.03954
G1 X128.421 Y126.421 E.02796
G1 X127.579 Y125.579 E.03954
G1 X125.95 Y125.579 E.05401
G1 X116.544 Y125.579 F30000
G1 F15476.087
G1 X116.01 Y125.579 E.01771
G1 X114.984 Y125.2 E.0363
G1 X113.34 Y126.843 E.0771
G2 X113.34 Y125.157 I-8.69 J-.844 E.05601
G1 X114.984 Y126.8 E.07709
G1 X116.01 Y126.421 E.0363
G1 X118.367 Y126.421 E.07819
G1 X119.21 Y125.579 E.03954
G1 X118.367 Y125.579 E.02796
G1 X119.21 Y126.421 E.03954
G1 X122.973 Y126.421 E.12482
G1 X123.816 Y125.579 E.03954
G1 X122.973 Y125.579 E.02796
G1 X123.816 Y126.421 E.03954
G1 X125.444 Y126.421 E.05401
G1 X111.568 Y128.924 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109717
G1 F15000
G1 X111.478 Y129.075 E.00096
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446366
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.413402
G1 X110.525 Y129.716 E.0034
; LINE_WIDTH: 0.370595
G1 X110.42 Y129.779 E.00328
; LINE_WIDTH: 0.328906
G1 X110.305 Y129.842 E.00306
; LINE_WIDTH: 0.2896
G1 X110.19 Y129.905 E.00264
; LINE_WIDTH: 0.249375
G1 X110.07 Y129.972 E.00231
; LINE_WIDTH: 0.215931
G1 X109.97 Y130.022 E.00157
; LINE_WIDTH: 0.189472
G1 X109.869 Y130.074 E.00136
; LINE_WIDTH: 0.155964
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.113925
G1 X109.394 Y130.293 E.00181
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y123.075 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.109689
G1 F15000
G1 X111.478 Y122.925 E.00095
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446399
G1 F15000
G1 X110.622 Y122.342 E.00861
; LINE_WIDTH: 0.414019
G1 X110.528 Y122.286 E.00331
; LINE_WIDTH: 0.372523
G1 X110.426 Y122.225 E.00318
; LINE_WIDTH: 0.330079
G1 X110.307 Y122.158 E.0032
; LINE_WIDTH: 0.287286
G1 X110.184 Y122.09 E.00279
; LINE_WIDTH: 0.245749
G1 X110.058 Y122.022 E.00237
; LINE_WIDTH: 0.200964
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155914
G1 X109.679 Y121.834 E.00194
; LINE_WIDTH: 0.113917
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.306 Y122.107 Z2 F30000
G1 X144.432 Y123.076 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.109563
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445765
G1 F15000
G1 X145.372 Y122.346 E.00842
; LINE_WIDTH: 0.414616
G1 X145.47 Y122.288 E.00346
; LINE_WIDTH: 0.374578
G1 X145.56 Y122.234 E.00285
; LINE_WIDTH: 0.337134
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302103
G1 X145.75 Y122.127 E.00223
; LINE_WIDTH: 0.269698
G1 X145.847 Y122.074 E.00204
; LINE_WIDTH: 0.239773
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224665
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.19957
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.15464
M73 P78 R3
G1 X146.32 Y121.836 E.00193
; LINE_WIDTH: 0.113285
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.107564
G1 F15000
G2 X144.577 Y129.117 I.494 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446759
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416286
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.376186
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338741
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303792
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271435
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241511
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226383
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201313
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156418
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114054
G1 X146.606 Y130.293 E.00182
; OBJECT_ID: 104
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X142.2 Y136.59 Z2 F30000
G1 X139.547 Y140.73 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00901
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.526 J2.016 E.13656
G1 X139.819 Y142.269 E.11947
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.458 J-2.017 E.13666
G1 X115.964 Y140.73 E.11948
G1 X139.487 Y140.73 E.7803
G1 X139.529 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.0072
G1 X143.976 Y138.762 E.14956
G2 X143.977 Y144.238 I4.781 J2.737 E.1901
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.752 J-2.739 E.19025
G1 X116.037 Y140.323 E.1496
G1 X139.469 Y140.323 E.77729
G1 X139.511 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00539
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.687 J-3.329 E.24202
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.451 Y139.916 E.77428
; WIPE_START
G1 X139.673 Y139.916 E-.08453
G1 X141.341 Y139.3 E-.67547
; WIPE_END
G1 E-.04 F1800
G1 X133.855 Y140.788 Z2 F30000
G1 X107.365 Y146.05 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.057 E.00657
G3 X106.769 Y136.958 I.006 J-4.559 E.46149
G1 X106.979 Y136.944 E.00697
G3 X107.564 Y146.041 I.194 J4.555 E.46853
G1 X107.424 Y146.047 E.00463
G1 X107.347 Y145.644 F30000
G1 F15476.087
G1 X107.166 Y145.65 E.006
G3 X106.805 Y137.363 I.004 J-4.152 E.42038
G1 X106.992 Y137.351 E.00623
G3 X107.528 Y145.635 I.178 J4.148 E.42669
G1 X107.407 Y145.641 E.00403
G1 X107.396 Y145.25 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.33 Y145.255 E.00203
G3 X106.839 Y137.754 I-.162 J-3.756 E.35777
G1 X107.005 Y137.743 E.00512
G3 X107.657 Y145.227 I.163 J3.756 E.35288
G1 X107.456 Y145.245 E.00621
; WIPE_START
M204 S10000
G1 X107.33 Y145.255 E-.04786
G1 X106.839 Y145.245 E-.18688
G1 X106.514 Y145.202 E-.1246
G1 X106.193 Y145.131 E-.12471
G1 X105.88 Y145.033 E-.12459
G1 X105.578 Y144.907 E-.12462
G1 X105.515 Y144.875 E-.02674
; WIPE_END
G1 E-.04 F1800
G1 X113.019 Y143.48 Z2 F30000
G1 X147.777 Y137.021 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.825 Y137.01 E.00163
G3 X148.219 Y136.958 I.798 J4.489 E.0132
G1 X148.429 Y136.944 E.00697
G3 X147.246 Y137.152 I.194 J4.555 E.91023
G1 X147.719 Y137.035 E.01615
G1 X147.872 Y137.416 F30000
G1 F15476.087
G1 X147.895 Y137.411 E.0008
G3 X148.255 Y137.363 I.725 J4.088 E.01202
G1 X148.442 Y137.351 E.00623
G3 X147.368 Y137.54 I.178 J4.148 E.82905
G1 X147.814 Y137.431 E.01522
G1 X147.937 Y137.803 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.964 Y137.797 E.00085
G3 X148.289 Y137.754 I.655 J3.702 E.01008
G1 X148.455 Y137.743 E.00512
G3 X147.486 Y137.914 I.163 J3.756 E.69553
G1 X147.879 Y137.817 E.01242
; WIPE_START
M204 S10000
G1 X147.964 Y137.797 E-.03327
G1 X148.289 Y137.754 E-.1246
G1 X148.455 Y137.743 E-.06327
G1 X148.944 Y137.754 E-.18604
G1 X149.269 Y137.797 E-.12461
G1 X149.528 Y137.853 E-.10062
G1 X149.849 Y137.95 E-.1276
; WIPE_END
G1 E-.04 F1800
G1 X142.302 Y139.086 Z2 F30000
G1 X139.493 Y139.509 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00358
G1 X147.031 Y136.767 E.26273
G3 X148.63 Y136.51 I1.634 J5.057 E.05393
G3 X146.807 Y146.151 I-.014 J4.99 E.58095
G1 X139.601 Y143.49 E.25482
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.2548
G3 X108.977 Y136.848 I-1.806 J-4.651 E.64261
G1 X116.182 Y139.509 E.25479
G1 X139.433 Y139.509 E.77126
G1 X139.475 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00176
G1 X146.9 Y136.382 E.26067
G3 X148.631 Y136.103 I1.769 J5.469 E.05838
G3 X146.667 Y146.533 I-.015 J5.397 E.62807
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.117 Y136.466 I-1.946 J-5.034 E.69448
G1 X116.255 Y139.102 E.25242
G1 X139.415 Y139.102 E.76825
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.632 Y135.711 I1.899 J5.867 E.05806
G3 X154.268 Y142.75 I-.024 J5.795 E.3175
G3 X146.533 Y146.902 I-5.659 J-1.263 E.30601
G1 X139.458 Y144.29 E.23173
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X109.25 Y136.097 I-2.082 J-5.402 E.68981
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.347 Y141.921 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P78 R2
G1 F15476.087
G1 X139.881 Y141.921 E.01771
G1 X140.908 Y142.3 E.0363
G1 X142.551 Y140.656 E.0771
G2 X142.558 Y142.349 I8.124 J.816 E.05624
G1 X140.908 Y140.699 E.07739
G1 X139.881 Y141.078 E.03631
G1 X137.524 Y141.078 E.07818
G1 X136.681 Y141.921 E.03954
G1 X137.524 Y141.921 E.02796
G1 X136.681 Y141.078 E.03954
G1 X132.918 Y141.078 E.12482
G1 X132.076 Y141.921 E.03954
G1 X132.918 Y141.921 E.02796
G1 X132.076 Y141.078 E.03954
G1 X128.313 Y141.078 E.12482
G1 X127.47 Y141.921 E.03954
G1 X128.313 Y141.921 E.02796
G1 X127.47 Y141.078 E.03954
G1 X125.842 Y141.078 E.05401
G1 X116.436 Y141.078 F30000
G1 F15476.087
G1 X115.902 Y141.078 E.01771
G1 X114.875 Y140.699 E.0363
G1 X113.232 Y142.343 E.0771
G2 X113.232 Y140.657 I-8.69 J-.844 E.05601
G1 X114.875 Y142.3 E.07709
G1 X115.902 Y141.921 E.0363
G1 X118.259 Y141.921 E.07819
G1 X119.102 Y141.078 E.03954
G1 X118.259 Y141.078 E.02796
G1 X119.102 Y141.921 E.03954
G1 X122.865 Y141.921 E.12482
G1 X123.707 Y141.078 E.03954
G1 X122.865 Y141.078 E.02796
G1 X123.707 Y141.921 E.03954
G1 X125.336 Y141.921 E.05401
G1 X111.46 Y144.424 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109717
G1 F15000
G1 X111.369 Y144.574 E.00096
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446366
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.413402
G1 X110.417 Y145.216 E.0034
; LINE_WIDTH: 0.370595
G1 X110.311 Y145.278 E.00328
; LINE_WIDTH: 0.328906
G1 X110.196 Y145.342 E.00306
; LINE_WIDTH: 0.2896
G1 X110.081 Y145.405 E.00264
; LINE_WIDTH: 0.249375
G1 X109.961 Y145.471 E.00231
; LINE_WIDTH: 0.215931
G1 X109.862 Y145.522 E.00157
; LINE_WIDTH: 0.189472
G1 X109.76 Y145.573 E.00136
; LINE_WIDTH: 0.155964
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113925
G1 X109.285 Y145.793 E.00181
; WIPE_START
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y138.575 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.109689
G1 F15000
G1 X111.369 Y138.425 E.00095
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446399
G1 F15000
G1 X110.513 Y137.841 E.00861
; LINE_WIDTH: 0.414019
G1 X110.419 Y137.785 E.00331
; LINE_WIDTH: 0.372523
G1 X110.317 Y137.725 E.00318
; LINE_WIDTH: 0.330079
G1 X110.198 Y137.658 E.0032
; LINE_WIDTH: 0.287286
G1 X110.076 Y137.59 E.00279
; LINE_WIDTH: 0.245749
G1 X109.949 Y137.522 E.00237
; LINE_WIDTH: 0.200964
G1 X109.76 Y137.425 E.00273
; LINE_WIDTH: 0.155914
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113917
G1 X109.285 Y137.206 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.198 Y137.606 Z2 F30000
G1 X144.323 Y138.575 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.109563
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445765
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414616
G1 X145.361 Y137.787 E.00346
; LINE_WIDTH: 0.374578
G1 X145.452 Y137.734 E.00285
; LINE_WIDTH: 0.337134
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302103
G1 X145.641 Y137.626 E.00223
; LINE_WIDTH: 0.269698
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.239773
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.224665
M73 P79 R2
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.19957
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.15464
G1 X146.211 Y137.336 E.00193
; LINE_WIDTH: 0.113285
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.424 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.107564
G1 F15000
G2 X144.468 Y144.616 I.494 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446759
G1 F15000
G1 X145.262 Y145.153 E.00834
; LINE_WIDTH: 0.416286
G1 X145.36 Y145.212 E.00348
; LINE_WIDTH: 0.376186
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338741
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303792
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271435
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241511
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226383
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201313
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156418
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114054
G1 X146.498 Y145.793 E.00182
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 9/15
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
; object ids of layer 9 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer9 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.656 Y125.23
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00901
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.529 J2.016 E.13656
G1 X139.927 Y126.77 E.11947
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11947
G2 X112.694 Y123.983 I-5.459 J-2.017 E.13666
G1 X116.072 Y125.23 E.11947
G1 X139.596 Y125.23 E.78031
G1 X139.638 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00719
G1 X144.085 Y123.263 E.14957
G2 X144.085 Y128.739 I4.782 J2.737 E.1901
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.752 J-2.739 E.19025
G1 X116.145 Y124.823 E.1496
G1 X139.578 Y124.823 E.77729
G1 X139.62 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00538
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.689 J3.327 E.24192
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.687 J-3.329 E.24202
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.56 Y124.416 E.77428
; WIPE_START
G1 X139.782 Y124.416 E-.08445
G1 X141.45 Y123.801 E-.67555
; WIPE_END
G1 E-.04 F1800
G1 X133.965 Y125.295 Z2.2 F30000
G1 X107.705 Y130.538 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X107.672 Y130.538 E.00109
G3 X106.885 Y121.457 I-.397 J-4.54 E.47518
G3 X107.467 Y121.445 I.399 J4.99 E.01931
G3 X108.066 Y130.486 I-.192 J4.553 E.44217
G1 X107.764 Y130.529 E.01011
G1 X107.653 Y130.134 F30000
G1 F15476.087
G1 X107.636 Y130.132 E.00055
G3 X106.918 Y121.863 I-.362 J-4.134 E.43266
G3 X107.452 Y121.851 I.367 J4.579 E.01774
G3 X107.995 Y130.085 I-.177 J4.147 E.4026
G1 X107.712 Y130.126 E.00949
G1 X107.514 Y129.75 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.275 Y129.756 E.00735
G3 X106.949 Y122.254 I0 J-3.758 E.35278
G3 X107.438 Y122.243 I.335 J4.186 E.01503
G3 X107.602 Y129.742 I-.163 J3.755 E.34772
G1 X107.574 Y129.745 E.00087
; WIPE_START
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
G1 X113.136 Y127.984 Z2.2 F30000
G1 X147.966 Y121.506 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.335 Y121.457 E.01235
G3 X148.917 Y121.445 I.399 J4.99 E.01931
G3 X147.907 Y121.514 I-.192 J4.553 E.91619
G1 X148.02 Y121.909 F30000
G1 F15476.087
G1 X148.368 Y121.863 E.01163
G3 X148.902 Y121.851 I.367 J4.579 E.01774
G3 X147.961 Y121.919 I-.177 J4.147 E.83366
G1 X148.019 Y122.309 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.072 Y122.297 E.00167
G3 X148.399 Y122.254 I.653 J3.701 E.01013
G3 X148.888 Y122.243 I.335 J4.186 E.01503
G3 X147.752 Y122.368 I-.163 J3.755 E.69034
G1 X147.961 Y122.322 E.00657
; WIPE_START
M204 S10000
G1 X148.072 Y122.297 E-.04342
G1 X148.399 Y122.254 E-.12528
G1 X148.888 Y122.243 E-.18574
G1 X149.216 Y122.272 E-.12518
G1 X149.622 Y122.349 E-.15695
G1 X149.93 Y122.45 E-.12343
; WIPE_END
G1 E-.04 F1800
G1 X142.383 Y123.589 Z2.2 F30000
G1 X139.601 Y124.009 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00357
G1 X147.14 Y121.268 E.26274
G3 X148.721 Y121.011 I1.636 J5.066 E.05334
G3 X146.915 Y130.651 I0 J4.99 E.58129
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.084 Y130.652 E.25484
G3 X109.085 Y121.349 I-1.805 J-4.652 E.64254
G1 X116.291 Y124.009 E.25481
G1 X139.541 Y124.009 E.77127
G1 X139.583 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.433 Y123.075 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109705
G1 F15000
G3 X144.576 Y122.885 I.309 J.084 E.00132
G1 X145.151 Y122.477 F30000
; LINE_WIDTH: 0.388015
G1 F15000
G3 X145.565 Y122.233 I8.562 J14.023 E.01353
; LINE_WIDTH: 0.339168
G1 X145.653 Y122.182 E.00244
; LINE_WIDTH: 0.30521
G1 X145.74 Y122.132 E.00216
; LINE_WIDTH: 0.271835
G1 X145.843 Y122.077 E.00217
; LINE_WIDTH: 0.24043
G1 X145.939 Y122.025 E.00176
; LINE_WIDTH: 0.224709
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.19957
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154598
G1 X146.32 Y121.836 E.00193
; LINE_WIDTH: 0.113269
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.107559
G1 F15000
G2 X144.577 Y129.117 I.495 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446761
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416287
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.376209
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338773
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303783
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271406
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241481
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226357
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201297
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156444
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114077
G1 X146.606 Y130.293 E.00182
G1 X121.345 Y125.579 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.973 Y125.579 E.05401
G1 X123.816 Y126.421 E.03954
G1 X122.973 Y126.421 E.02796
G1 X123.816 Y125.579 E.03954
G1 X127.579 Y125.579 E.12482
G1 X128.421 Y126.421 E.03954
G1 X127.579 Y126.421 E.02796
G1 X128.421 Y125.579 E.03954
G1 X132.184 Y125.579 E.12482
G1 X133.027 Y126.421 E.03954
G1 X132.184 Y126.421 E.02796
G1 X133.027 Y125.579 E.03954
G1 X136.79 Y125.579 E.12482
G1 X137.633 Y126.421 E.03954
G1 X136.79 Y126.421 E.02796
G1 X137.633 Y125.579 E.03954
G1 X139.989 Y125.579 E.07818
G1 X141.016 Y125.2 E.03631
G1 X142.657 Y126.84 E.07694
G3 X142.656 Y125.161 I11.45 J-.844 E.05575
G1 X141.016 Y126.8 E.07692
G1 X139.99 Y126.421 E.0363
G1 X139.456 Y126.421 E.01771
G1 X120.839 Y126.421 F30000
G1 F15476.087
G1 X119.21 Y126.421 E.05401
G1 X118.367 Y125.579 E.03954
G1 X119.21 Y125.579 E.02796
G1 X118.367 Y126.421 E.03954
G1 X116.01 Y126.421 E.07819
G1 X114.984 Y126.8 E.0363
G1 X113.341 Y125.157 E.07709
G3 X113.336 Y126.847 I-8.352 J.825 E.05614
G1 X114.984 Y125.2 E.07728
G1 X116.01 Y125.579 E.0363
G1 X116.544 Y125.579 E.01771
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109723
G1 F15000
G1 X111.478 Y122.925 E.00096
G1 X111.423 Y122.883 E.00038
G1 X110.846 Y122.477 F30000
; LINE_WIDTH: 0.431528
G1 F15000
G1 X110.612 Y122.335 E.00867
; LINE_WIDTH: 0.411605
G1 X110.524 Y122.284 E.00305
; LINE_WIDTH: 0.376067
G1 X110.437 Y122.233 E.00275
; LINE_WIDTH: 0.339097
G1 X110.342 Y122.178 E.00265
; LINE_WIDTH: 0.297453
M73 P80 R2
G1 X110.206 Y122.103 E.00321
; LINE_WIDTH: 0.251322
G1 X110.066 Y122.026 E.00272
; LINE_WIDTH: 0.215192
G1 X109.969 Y121.977 E.00153
; LINE_WIDTH: 0.189219
G1 X109.869 Y121.926 E.00134
; LINE_WIDTH: 0.155957
G1 X109.679 Y121.834 E.00194
; LINE_WIDTH: 0.113923
G1 X109.394 Y121.707 E.00181
; WIPE_START
G1 X109.679 Y121.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y128.924 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.109713
G1 F15000
G1 X111.478 Y129.075 E.00096
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.44639
G1 F15000
G1 X110.622 Y129.658 E.00861
; LINE_WIDTH: 0.414681
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374904
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337584
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.30288
G1 X110.246 Y129.877 E.00235
; LINE_WIDTH: 0.270639
G1 X110.154 Y129.926 E.00194
; LINE_WIDTH: 0.240931
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.200973
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155937
G1 X109.679 Y130.166 E.00194
; LINE_WIDTH: 0.113902
G1 X109.394 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X116.874 Y132.711 Z2.2 F30000
G1 X139.547 Y140.73 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00901
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.529 J2.016 E.13656
G1 X139.819 Y142.269 E.11947
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11947
G2 X112.585 Y139.482 I-5.459 J-2.017 E.13666
G1 X115.964 Y140.73 E.11947
G1 X139.487 Y140.73 E.78031
G1 X139.529 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00719
G1 X143.976 Y138.762 E.14957
G2 X143.977 Y144.238 I4.782 J2.737 E.1901
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.752 J-2.739 E.19025
G1 X116.037 Y140.323 E.1496
G1 X139.469 Y140.323 E.77729
G1 X139.511 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00538
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.689 J3.327 E.24192
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.687 J-3.329 E.24202
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.451 Y139.916 E.77428
; WIPE_START
G1 X139.673 Y139.916 E-.08445
G1 X141.341 Y139.3 E-.67555
; WIPE_END
G1 E-.04 F1800
G1 X133.856 Y140.795 Z2.2 F30000
G1 X107.596 Y146.037 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X107.563 Y146.037 E.00109
G3 X106.777 Y136.957 I-.397 J-4.54 E.47518
G3 X107.358 Y136.944 I.399 J4.99 E.01931
G3 X107.958 Y145.985 I-.192 J4.553 E.44217
G1 X107.656 Y146.029 E.01011
G1 X107.544 Y145.634 F30000
G1 F15476.087
G1 X107.528 Y145.632 E.00055
G3 X106.809 Y137.363 I-.362 J-4.134 E.43266
G3 X107.344 Y137.351 I.367 J4.579 E.01774
G3 X107.887 Y145.585 I-.177 J4.147 E.4026
G1 X107.604 Y145.625 E.00949
G1 X107.406 Y145.249 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.256 E.00735
G3 X106.84 Y137.754 I0 J-3.758 E.35278
G3 X107.329 Y137.743 I.335 J4.186 E.01503
G3 X107.494 Y145.242 I-.163 J3.755 E.34772
G1 X107.465 Y145.244 E.00087
; WIPE_START
M204 S10000
G1 X107.166 Y145.256 E-.1137
G1 X106.839 Y145.245 E-.12453
G1 X106.512 Y145.202 E-.12528
G1 X106.27 Y145.15 E-.09412
G1 X105.881 Y145.033 E-.15455
G1 X105.578 Y144.907 E-.12462
G1 X105.523 Y144.879 E-.02319
; WIPE_END
G1 E-.04 F1800
G1 X113.027 Y143.483 Z2.2 F30000
G1 X147.858 Y137.005 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.227 Y136.957 E.01235
G3 X148.808 Y136.944 I.399 J4.99 E.01931
G3 X147.798 Y137.014 I-.192 J4.553 E.91619
G1 X147.912 Y137.408 F30000
G1 F15476.087
G1 X148.259 Y137.363 E.01163
G3 X148.794 Y137.351 I.367 J4.579 E.01774
G3 X147.852 Y137.418 I-.177 J4.147 E.83366
G1 X147.911 Y137.808 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.964 Y137.797 E.00167
G3 X148.29 Y137.754 I.653 J3.701 E.01013
G3 X148.779 Y137.743 I.335 J4.186 E.01503
G3 X147.643 Y137.868 I-.163 J3.755 E.69034
G1 X147.852 Y137.821 E.00657
; WIPE_START
M204 S10000
G1 X147.964 Y137.797 E-.04342
G1 X148.29 Y137.754 E-.12528
G1 X148.779 Y137.743 E-.18574
G1 X149.107 Y137.772 E-.12518
G1 X149.513 Y137.849 E-.15695
G1 X149.822 Y137.95 E-.12343
; WIPE_END
G1 E-.04 F1800
G1 X142.275 Y139.089 Z2.2 F30000
G1 X139.493 Y139.509 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00357
G1 X147.032 Y136.767 E.26274
G3 X148.613 Y136.51 I1.636 J5.066 E.05334
G3 X146.806 Y146.151 I0 J4.99 E.58129
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.975 Y146.151 E.25484
G3 X108.976 Y136.848 I-1.805 J-4.652 E.64254
G1 X116.182 Y139.509 E.25481
G1 X139.433 Y139.509 E.77127
G1 X139.475 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00176
G1 X146.9 Y136.382 E.26067
G3 X148.614 Y136.103 I1.771 J5.478 E.0578
G3 X146.667 Y146.533 I-.001 J5.397 E.62836
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25245
G3 X109.116 Y136.466 I-1.945 J-5.034 E.69444
G1 X116.255 Y139.102 E.25243
G1 X139.415 Y139.102 E.76826
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.615 Y135.711 I1.901 J5.876 E.05752
G3 X147.646 Y147.206 I.002 J5.789 E.58881
G3 X146.533 Y146.902 I1.001 J-5.842 E.0355
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X108.137 Y135.793 I-2.083 J-5.402 E.65426
G3 X109.25 Y136.097 I-1.001 J5.842 E.03551
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y138.574 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109705
G1 F15000
G3 X144.467 Y138.385 I.309 J.084 E.00132
G1 X145.042 Y137.977 F30000
; LINE_WIDTH: 0.388015
G1 F15000
G3 X145.456 Y137.732 I8.562 J14.023 E.01353
; LINE_WIDTH: 0.339168
G1 X145.544 Y137.682 E.00244
; LINE_WIDTH: 0.30521
G1 X145.632 Y137.631 E.00216
; LINE_WIDTH: 0.271835
G1 X145.734 Y137.576 E.00217
; LINE_WIDTH: 0.24043
G1 X145.831 Y137.524 E.00176
; LINE_WIDTH: 0.224709
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.19957
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154598
G1 X146.211 Y137.336 E.00193
; LINE_WIDTH: 0.113269
G1 X146.481 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.424 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.107559
G1 F15000
G2 X144.468 Y144.616 I.495 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446761
G1 F15000
G1 X145.262 Y145.153 E.00834
; LINE_WIDTH: 0.416287
G1 X145.36 Y145.212 E.00348
; LINE_WIDTH: 0.376209
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338773
G1 X145.549 Y145.321 E.00271
; LINE_WIDTH: 0.303783
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271406
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241481
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226357
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201297
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156444
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114077
G1 X146.498 Y145.793 E.00182
G1 X121.236 Y141.078 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X122.865 Y141.078 E.05401
G1 X123.707 Y141.921 E.03954
G1 X122.865 Y141.921 E.02796
G1 X123.707 Y141.078 E.03954
G1 X127.47 Y141.078 E.12482
G1 X128.313 Y141.921 E.03954
G1 X127.47 Y141.921 E.02796
G1 X128.313 Y141.078 E.03954
G1 X132.076 Y141.078 E.12482
G1 X132.918 Y141.921 E.03954
G1 X132.076 Y141.921 E.02796
G1 X132.918 Y141.078 E.03954
G1 X136.681 Y141.078 E.12482
G1 X137.524 Y141.921 E.03954
G1 X136.681 Y141.921 E.02796
G1 X137.524 Y141.078 E.03954
G1 X139.881 Y141.078 E.07818
G1 X140.908 Y140.699 E.03631
G1 X142.548 Y142.339 E.07694
G3 X142.547 Y140.66 I11.45 J-.844 E.05575
G1 X140.908 Y142.3 E.07692
G1 X139.881 Y141.921 E.0363
G1 X139.347 Y141.921 E.01771
G1 X120.73 Y141.921 F30000
G1 F15476.087
G1 X119.102 Y141.921 E.05401
G1 X118.259 Y141.078 E.03954
G1 X119.102 Y141.078 E.02796
G1 X118.259 Y141.921 E.03954
G1 X115.902 Y141.921 E.07819
G1 X114.875 Y142.3 E.0363
G1 X113.232 Y140.657 E.07709
G3 X113.228 Y142.346 I-8.352 J.825 E.05614
G1 X114.875 Y140.699 E.07728
G1 X115.902 Y141.078 E.0363
G1 X116.436 Y141.078 E.01771
G1 X111.46 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109723
G1 F15000
G1 X111.369 Y138.425 E.00096
G1 X111.315 Y138.383 E.00038
G1 X110.738 Y137.977 F30000
; LINE_WIDTH: 0.431528
G1 F15000
M73 P81 R2
G1 X110.503 Y137.835 E.00867
; LINE_WIDTH: 0.411605
G1 X110.416 Y137.784 E.00305
; LINE_WIDTH: 0.376067
G1 X110.328 Y137.732 E.00275
; LINE_WIDTH: 0.339097
G1 X110.234 Y137.677 E.00265
; LINE_WIDTH: 0.297453
G1 X110.098 Y137.603 E.00321
; LINE_WIDTH: 0.251322
G1 X109.957 Y137.526 E.00272
; LINE_WIDTH: 0.215192
G1 X109.86 Y137.476 E.00153
; LINE_WIDTH: 0.189219
G1 X109.76 Y137.426 E.00134
; LINE_WIDTH: 0.155957
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113923
G1 X109.285 Y137.206 E.00181
; WIPE_START
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y144.424 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.109713
G1 F15000
G1 X111.369 Y144.574 E.00096
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.44639
G1 F15000
G1 X110.513 Y145.158 E.00861
; LINE_WIDTH: 0.414681
G1 X110.423 Y145.212 E.0032
; LINE_WIDTH: 0.374904
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.337584
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.30288
G1 X110.137 Y145.376 E.00235
; LINE_WIDTH: 0.270639
G1 X110.045 Y145.426 E.00194
; LINE_WIDTH: 0.240931
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200973
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155937
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113902
G1 X109.285 Y145.792 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 10/15
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
; object ids of layer 10 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer10 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.656 Y125.23
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.009
G1 X143.306 Y123.984 E.11946
G2 X143.306 Y128.017 I5.526 J2.016 E.13656
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.526 J-2.017 E.1366
G1 X116.072 Y125.23 E.11947
G1 X139.596 Y125.23 E.78031
G1 X139.638 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00719
G1 X144.085 Y123.263 E.14957
G2 X144.085 Y128.739 I4.781 J2.737 E.1901
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.578 Y124.823 E.7773
G1 X139.62 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00537
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.56 Y124.416 E.77429
; WIPE_START
G1 X139.782 Y124.416 E-.08437
G1 X141.45 Y123.801 E-.67563
; WIPE_END
G1 E-.04 F1800
G1 X133.965 Y125.295 Z2.4 F30000
G1 X107.721 Y130.535 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G1 X107.672 Y130.541 E.00162
G3 X106.884 Y121.457 I-.397 J-4.542 E.47532
G3 X107.466 Y121.444 I.4 J4.974 E.01931
G3 X108.261 Y130.45 I-.191 J4.555 E.43577
G1 X107.78 Y130.525 E.01616
G1 X107.621 Y130.137 F30000
G1 F15476.087
G1 X107.275 Y130.151 E.01148
G3 X106.917 Y121.863 I0 J-4.152 E.42079
G3 X107.452 Y121.851 I.367 J4.573 E.01774
G3 X107.68 Y130.131 I-.177 J4.148 E.41334
G1 X107.521 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.275 Y129.759 E.00756
G3 X106.949 Y122.254 I0 J-3.76 E.35289
G3 X107.438 Y122.243 I.336 J4.181 E.01503
G3 X107.602 Y129.745 I-.163 J3.756 E.34785
G1 X107.581 Y129.746 E.00067
; WIPE_START
M204 S10000
G1 X107.275 Y129.759 E-.11633
G1 X106.875 Y129.738 E-.15212
G1 X106.461 Y129.671 E-.15936
G1 X106.144 Y129.586 E-.12465
G1 X105.836 Y129.474 E-.12471
G1 X105.641 Y129.377 E-.08283
; WIPE_END
G1 E-.04 F1800
G1 X113.144 Y127.982 Z2.4 F30000
G1 X147.966 Y121.506 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.334 Y121.457 E.01233
G3 X148.916 Y121.444 I.4 J4.974 E.01931
G3 X147.907 Y121.514 I-.191 J4.555 E.91656
G1 X148.02 Y121.909 F30000
G1 F15476.087
G1 X148.367 Y121.863 E.01162
G3 X148.902 Y121.851 I.367 J4.574 E.01774
G3 X147.961 Y121.919 I-.177 J4.148 E.83398
G1 X147.995 Y122.314 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.072 Y122.297 E.00244
G3 X148.399 Y122.254 I.653 J3.703 E.01013
G3 X148.888 Y122.243 I.336 J4.182 E.01503
G3 X147.752 Y122.368 I-.163 J3.756 E.6906
G1 X147.936 Y122.327 E.0058
; WIPE_START
M204 S10000
G1 X148.072 Y122.297 E-.053
G1 X148.399 Y122.254 E-.12521
G1 X148.888 Y122.243 E-.18575
G1 X149.216 Y122.272 E-.12523
G1 X149.539 Y122.329 E-.12461
G1 X149.856 Y122.414 E-.12465
G1 X149.909 Y122.433 E-.02155
; WIPE_END
G1 E-.04 F1800
G1 X142.364 Y123.587 Z2.4 F30000
G1 X139.602 Y124.009 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00356
G1 X147.14 Y121.268 E.26274
G3 X148.704 Y121.01 I1.639 J5.078 E.05276
G3 X146.915 Y130.651 I.017 J4.99 E.58188
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.2548
G3 X109.085 Y121.349 I-1.806 J-4.651 E.64261
G1 X116.291 Y124.009 E.25479
G1 X139.542 Y124.009 E.77128
G1 X139.584 Y123.602 F30000
G1 F15476.087
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
G1 F3600
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
M204 S10000
G1 X141.385 Y122.523 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.456 Y126.421 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.99 Y126.421 E.01771
G1 X141.016 Y126.8 E.0363
G1 X142.66 Y125.157 E.07709
G2 X142.66 Y126.843 I8.679 J.843 E.05602
G1 X141.016 Y125.2 E.07709
G1 X139.989 Y125.579 E.03631
G1 X137.633 Y125.579 E.07818
G1 X136.79 Y126.421 E.03954
G1 X137.633 Y126.421 E.02796
G1 X136.79 Y125.579 E.03954
G1 X133.027 Y125.579 E.12482
G1 X132.184 Y126.421 E.03954
G1 X133.027 Y126.421 E.02796
G1 X132.184 Y125.579 E.03954
G1 X128.421 Y125.579 E.12482
G1 X127.579 Y126.421 E.03954
G1 X128.421 Y126.421 E.02796
G1 X127.579 Y125.579 E.03954
G1 X125.95 Y125.579 E.05401
G1 X116.544 Y125.579 F30000
G1 F15476.087
G1 X116.01 Y125.579 E.01771
G1 X114.984 Y125.2 E.0363
G1 X113.34 Y126.843 E.07709
G2 X113.34 Y125.157 I-8.688 J-.843 E.05601
G1 X114.984 Y126.8 E.0771
G1 X116.01 Y126.421 E.0363
G1 X118.367 Y126.421 E.07819
G1 X119.21 Y125.579 E.03954
G1 X118.367 Y125.579 E.02796
G1 X119.21 Y126.421 E.03954
G1 X122.973 Y126.421 E.12482
G1 X123.816 Y125.579 E.03954
G1 X122.973 Y125.579 E.02796
G1 X123.816 Y126.421 E.03954
G1 X125.444 Y126.421 E.05401
G1 X111.568 Y128.924 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109707
G1 F15000
G1 X111.478 Y129.075 E.00095
G1 X111.423 Y129.117 E.00037
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446404
G1 F15000
G1 X110.622 Y129.658 E.00861
; LINE_WIDTH: 0.414707
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374922
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337633
G1 X110.343 Y129.822 E.00253
; LINE_WIDTH: 0.302975
G1 X110.246 Y129.876 E.00234
; LINE_WIDTH: 0.270724
G1 X110.154 Y129.926 E.00195
; LINE_WIDTH: 0.240928
G1 X110.057 Y129.978 E.00176
; LINE_WIDTH: 0.20096
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155969
G1 X109.679 Y130.166 E.00194
; LINE_WIDTH: 0.113906
G1 X109.394 Y130.293 E.00181
; WIPE_START
G1 X109.679 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y123.076 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109721
G1 F15000
G1 X111.478 Y122.925 E.00096
G1 X111.423 Y122.883 E.00038
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446375
G1 F15000
G1 X110.622 Y122.341 E.00862
; LINE_WIDTH: 0.414645
G1 X110.531 Y122.287 E.0032
; LINE_WIDTH: 0.374884
G1 X110.434 Y122.23 E.00305
; LINE_WIDTH: 0.337583
G1 X110.342 Y122.178 E.00253
; LINE_WIDTH: 0.302886
G1 X110.246 Y122.123 E.00235
; LINE_WIDTH: 0.270645
G1 X110.154 Y122.074 E.00194
; LINE_WIDTH: 0.240937
G1 X110.058 Y122.022 E.00176
; LINE_WIDTH: 0.200963
G1 X109.869 Y121.926 E.00273
; LINE_WIDTH: 0.155982
M73 P82 R2
G1 X109.679 Y121.835 E.00194
; LINE_WIDTH: 0.113535
G1 X109.387 Y121.705 E.00184
; WIPE_START
G1 X109.679 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.307 Y122.107 Z2.4 F30000
G1 X144.432 Y123.076 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109577
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.153 Y122.481 F30000
; LINE_WIDTH: 0.432543
G1 F15000
G1 X145.351 Y122.36 E.00737
; LINE_WIDTH: 0.383709
G1 X145.55 Y122.24 E.00645
; LINE_WIDTH: 0.339802
G1 X145.654 Y122.181 E.00289
; LINE_WIDTH: 0.30288
G1 X145.75 Y122.127 E.00233
; LINE_WIDTH: 0.269756
G1 X145.847 Y122.075 E.00204
; LINE_WIDTH: 0.239841
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.22473
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.199599
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154658
G1 X146.32 Y121.836 E.00192
; LINE_WIDTH: 0.113295
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.107599
G1 F15000
G2 X144.577 Y129.117 I.495 J-.222 E.00128
G1 X145.154 Y129.523 F30000
; LINE_WIDTH: 0.425329
G1 F15000
G2 X145.481 Y129.719 I6.718 J-10.842 E.01187
; LINE_WIDTH: 0.373434
G1 X145.572 Y129.772 E.00285
; LINE_WIDTH: 0.336478
G1 X145.664 Y129.826 E.00253
; LINE_WIDTH: 0.295037
G1 X145.8 Y129.901 E.00321
; LINE_WIDTH: 0.250745
G1 X145.93 Y129.971 E.00251
; LINE_WIDTH: 0.215658
G1 X146.032 Y130.023 E.00161
; LINE_WIDTH: 0.189502
G1 X146.129 Y130.073 E.0013
; LINE_WIDTH: 0.156423
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114053
G1 X146.606 Y130.293 E.00182
; OBJECT_ID: 104
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X142.201 Y136.59 Z2.4 F30000
G1 X139.547 Y140.73 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.009
G1 X143.197 Y139.483 E.11946
G2 X143.198 Y143.517 I5.526 J2.016 E.13656
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.526 J-2.017 E.1366
G1 X115.964 Y140.73 E.11947
G1 X139.487 Y140.73 E.78031
G1 X139.529 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00719
G1 X143.976 Y138.762 E.14957
G2 X143.977 Y144.238 I4.781 J2.737 E.1901
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.469 Y140.323 E.7773
G1 X139.511 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00537
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.451 Y139.916 E.77429
; WIPE_START
G1 X139.673 Y139.916 E-.08437
G1 X141.341 Y139.3 E-.67563
; WIPE_END
G1 E-.04 F1800
G1 X133.857 Y140.795 Z2.4 F30000
G1 X107.612 Y146.034 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G1 X107.564 Y146.04 E.00162
G3 X106.776 Y136.957 I-.397 J-4.542 E.47532
G3 X107.358 Y136.944 I.4 J4.974 E.01931
G3 X108.153 Y145.95 I-.191 J4.555 E.43577
G1 X107.672 Y146.025 E.01616
G1 X107.512 Y145.637 F30000
G1 F15476.087
G1 X107.166 Y145.651 E.01148
G3 X106.809 Y137.363 I0 J-4.152 E.42079
G3 X107.343 Y137.351 I.367 J4.573 E.01774
G3 X107.572 Y145.631 I-.177 J4.148 E.41334
G1 X107.412 Y145.249 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.259 E.00756
G3 X106.84 Y137.754 I0 J-3.76 E.35289
G3 X107.329 Y137.743 I.336 J4.181 E.01503
G3 X107.494 Y145.244 I-.163 J3.756 E.34785
G1 X107.472 Y145.246 E.00067
; WIPE_START
M204 S10000
G1 X107.166 Y145.259 E-.11633
G1 X106.767 Y145.237 E-.15212
G1 X106.353 Y145.17 E-.15936
G1 X106.036 Y145.086 E-.12465
G1 X105.727 Y144.973 E-.12471
G1 X105.532 Y144.877 E-.08283
; WIPE_END
G1 E-.04 F1800
G1 X113.036 Y143.481 Z2.4 F30000
G1 X147.857 Y137.005 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.226 Y136.957 E.01233
G3 X148.808 Y136.944 I.4 J4.974 E.01931
G3 X147.798 Y137.014 I-.191 J4.555 E.91656
G1 X147.912 Y137.408 F30000
G1 F15476.087
G1 X148.259 Y137.363 E.01162
G3 X148.793 Y137.351 I.367 J4.574 E.01774
G3 X147.852 Y137.418 I-.177 J4.148 E.83398
G1 X147.886 Y137.814 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.964 Y137.797 E.00244
G3 X148.29 Y137.754 I.653 J3.703 E.01013
G3 X148.779 Y137.743 I.336 J4.182 E.01503
G3 X147.643 Y137.868 I-.163 J3.756 E.6906
G1 X147.827 Y137.827 E.0058
; WIPE_START
M204 S10000
G1 X147.964 Y137.797 E-.053
G1 X148.29 Y137.754 E-.12521
G1 X148.779 Y137.743 E-.18575
G1 X149.107 Y137.772 E-.12523
G1 X149.43 Y137.829 E-.12461
G1 X149.747 Y137.913 E-.12465
G1 X149.8 Y137.933 E-.02155
; WIPE_END
G1 E-.04 F1800
G1 X142.256 Y139.086 Z2.4 F30000
G1 X139.493 Y139.509 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00356
G1 X147.032 Y136.767 E.26274
G3 X148.595 Y136.51 I1.639 J5.078 E.05276
G3 X146.806 Y146.151 I.017 J4.99 E.58188
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.2548
G3 X108.977 Y136.848 I-1.806 J-4.651 E.64261
G1 X116.182 Y139.509 E.25479
G1 X139.433 Y139.509 E.77128
G1 X139.475 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00175
G1 X146.901 Y136.382 E.26068
G3 X148.596 Y136.103 I1.774 J5.49 E.05722
G3 X146.666 Y146.533 I.016 J5.397 E.62898
G1 X139.528 Y143.897 E.25242
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X109.116 Y136.466 I-1.946 J-5.034 E.69447
G1 X116.255 Y139.102 E.25243
G1 X139.415 Y139.102 E.76826
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23962
G3 X148.597 Y135.711 I1.904 J5.887 E.05698
G3 X146.533 Y146.902 I.015 J5.789 E.62459
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X109.25 Y136.097 I-2.079 J-5.402 E.6895
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70896
; WIPE_START
M204 S10000
G1 X141.276 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.347 Y141.921 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.881 Y141.921 E.01771
G1 X140.908 Y142.3 E.0363
G1 X142.551 Y140.657 E.07709
G2 X142.551 Y142.343 I8.679 J.843 E.05602
G1 X140.908 Y140.699 E.07709
G1 X139.881 Y141.078 E.03631
G1 X137.524 Y141.078 E.07818
G1 X136.681 Y141.921 E.03954
G1 X137.524 Y141.921 E.02796
G1 X136.681 Y141.078 E.03954
G1 X132.918 Y141.078 E.12482
G1 X132.076 Y141.921 E.03954
G1 X132.918 Y141.921 E.02796
G1 X132.076 Y141.078 E.03954
G1 X128.313 Y141.078 E.12482
G1 X127.47 Y141.921 E.03954
G1 X128.313 Y141.921 E.02796
G1 X127.47 Y141.078 E.03954
G1 X125.842 Y141.078 E.05401
G1 X116.436 Y141.078 F30000
G1 F15476.087
G1 X115.902 Y141.078 E.01771
G1 X114.875 Y140.699 E.0363
G1 X113.232 Y142.342 E.07709
G2 X113.232 Y140.657 I-8.688 J-.843 E.05601
G1 X114.875 Y142.3 E.0771
G1 X115.902 Y141.921 E.0363
G1 X118.259 Y141.921 E.07819
G1 X119.102 Y141.078 E.03954
G1 X118.259 Y141.078 E.02796
G1 X119.102 Y141.921 E.03954
G1 X122.865 Y141.921 E.12482
G1 X123.707 Y141.078 E.03954
G1 X122.865 Y141.078 E.02796
G1 X123.707 Y141.921 E.03954
G1 X125.336 Y141.921 E.05401
G1 X111.459 Y144.424 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109707
G1 F15000
G1 X111.369 Y144.574 E.00095
G1 X111.315 Y144.616 E.00037
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446404
G1 F15000
G1 X110.513 Y145.158 E.00861
; LINE_WIDTH: 0.414707
G1 X110.423 Y145.212 E.0032
; LINE_WIDTH: 0.374922
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.337633
G1 X110.234 Y145.321 E.00253
; LINE_WIDTH: 0.302975
G1 X110.138 Y145.376 E.00234
; LINE_WIDTH: 0.270724
G1 X110.045 Y145.426 E.00195
; LINE_WIDTH: 0.240928
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.20096
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155969
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113906
G1 X109.285 Y145.793 E.00181
; WIPE_START
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.46 Y138.575 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109721
G1 F15000
G1 X111.369 Y138.425 E.00096
G1 X111.315 Y138.383 E.00038
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446375
G1 F15000
G1 X110.513 Y137.841 E.00862
; LINE_WIDTH: 0.414645
G1 X110.422 Y137.787 E.0032
; LINE_WIDTH: 0.374884
M73 P83 R2
G1 X110.326 Y137.729 E.00305
; LINE_WIDTH: 0.337583
G1 X110.234 Y137.677 E.00253
; LINE_WIDTH: 0.302886
G1 X110.137 Y137.623 E.00235
; LINE_WIDTH: 0.270645
G1 X110.045 Y137.573 E.00194
; LINE_WIDTH: 0.240937
G1 X109.949 Y137.522 E.00176
; LINE_WIDTH: 0.200963
G1 X109.76 Y137.426 E.00273
; LINE_WIDTH: 0.155982
G1 X109.571 Y137.334 E.00194
; LINE_WIDTH: 0.113535
G1 X109.279 Y137.204 E.00184
; WIPE_START
G1 X109.571 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.198 Y137.607 Z2.4 F30000
G1 X144.323 Y138.575 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109577
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.044 Y137.98 F30000
; LINE_WIDTH: 0.432543
G1 F15000
G1 X145.243 Y137.86 E.00737
; LINE_WIDTH: 0.383709
G1 X145.441 Y137.739 E.00645
; LINE_WIDTH: 0.339802
G1 X145.545 Y137.68 E.00289
; LINE_WIDTH: 0.30288
G1 X145.641 Y137.626 E.00233
; LINE_WIDTH: 0.269756
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.239841
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.22473
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.199599
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154658
G1 X146.211 Y137.336 E.00192
; LINE_WIDTH: 0.113295
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y144.424 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.107599
G1 F15000
G2 X144.468 Y144.616 I.495 J-.222 E.00128
G1 X145.045 Y145.022 F30000
; LINE_WIDTH: 0.425329
G1 F15000
G2 X145.372 Y145.218 I6.718 J-10.842 E.01187
; LINE_WIDTH: 0.373434
G1 X145.464 Y145.272 E.00285
; LINE_WIDTH: 0.336478
G1 X145.555 Y145.325 E.00253
; LINE_WIDTH: 0.295037
G1 X145.692 Y145.4 E.00321
; LINE_WIDTH: 0.250745
G1 X145.822 Y145.471 E.00251
; LINE_WIDTH: 0.215658
G1 X145.923 Y145.523 E.00161
; LINE_WIDTH: 0.189502
G1 X146.02 Y145.572 E.0013
; LINE_WIDTH: 0.156423
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114053
G1 X146.498 Y145.793 E.00182
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 11/15
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
; object ids of layer 11 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer11 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X139.656 Y125.23
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.927 Y125.23 E.00899
G1 X143.306 Y123.984 E.11946
G2 X143.305 Y128.017 I5.535 J2.018 E.13653
G1 X139.927 Y126.77 E.11942
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.983 I-5.525 J-2.017 E.1366
G1 X116.072 Y125.23 E.11948
G1 X139.596 Y125.23 E.78032
G1 X139.638 Y124.823 F30000
G1 F15476.087
G1 X139.855 Y124.823 E.00718
G1 X144.085 Y123.263 E.14956
G2 X144.085 Y128.739 I4.781 J2.737 E.1901
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.261 I-4.78 J-2.739 E.19016
G1 X116.145 Y124.823 E.1496
G1 X139.578 Y124.823 E.77731
G1 X139.62 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00537
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.96 Y122.671 I-3.701 J-3.329 E.24191
G1 X111.068 Y122.515 E.0063
G1 X116.218 Y124.416 E.18212
G1 X139.56 Y124.416 E.7743
; WIPE_START
G1 X139.782 Y124.416 E-.0843
G1 X141.45 Y123.801 E-.6757
; WIPE_END
G1 E-.04 F1800
G1 X133.964 Y125.29 Z2.6 F30000
G1 X107.507 Y130.552 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G1 X107.474 Y130.554 E.00109
G3 X107.138 Y121.444 I-.191 J-4.555 E.47657
G3 X107.672 Y121.458 I.135 J4.924 E.01776
G3 X107.87 Y130.52 I-.389 J4.542 E.4426
G1 X107.566 Y130.547 E.01011
G1 X107.472 Y130.147 F30000
G1 F15476.087
G1 X107.456 Y130.148 E.00053
G3 X107.153 Y121.85 I-.174 J-4.148 E.4341
G3 X107.637 Y121.864 I.12 J4.483 E.01606
G3 X107.817 Y130.117 I-.354 J4.136 E.40309
G1 X107.532 Y130.142 E.00949
G1 X107.526 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X113.146 Y127.989 Z2.6 F30000
G1 X147.707 Y121.557 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.739 Y121.551 E.00109
G3 X148.588 Y121.444 I.994 J4.449 E.02842
G3 X149.122 Y121.458 I.135 J4.925 E.01776
G3 X147.355 Y121.655 I-.389 J4.542 E.89075
G1 X147.649 Y121.573 E.01011
G1 X147.811 Y121.95 F30000
G1 F15476.087
G1 X147.827 Y121.948 E.00054
G3 X148.603 Y121.85 I.906 J4.051 E.02599
G3 X149.087 Y121.864 I.12 J4.483 E.01606
G3 X147.477 Y122.043 I-.354 J4.136 E.8112
G1 X147.753 Y121.966 E.00949
G1 X147.97 Y122.319 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X142.342 Y123.587 Z2.6 F30000
G1 X139.602 Y124.009 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00356
G1 X147.14 Y121.268 E.26274
G3 X148.686 Y121.01 I1.643 J5.095 E.05218
G3 X146.915 Y130.651 I.037 J4.99 E.58263
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.084 Y130.652 E.25484
G3 X109.085 Y121.349 I-1.805 J-4.652 E.64256
G1 X116.291 Y124.009 E.25479
G1 X139.542 Y124.009 E.77128
G1 X139.584 Y123.602 F30000
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
G1 F3600
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
G1 X144.432 Y123.076 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109561
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445774
G1 F15000
G1 X145.371 Y122.347 E.00842
; LINE_WIDTH: 0.41397
G1 X145.473 Y122.286 E.00357
; LINE_WIDTH: 0.372558
G1 X145.567 Y122.23 E.00294
; LINE_WIDTH: 0.330397
G1 X145.691 Y122.161 E.00333
; LINE_WIDTH: 0.287679
G1 X145.807 Y122.096 E.00266
; LINE_WIDTH: 0.245511
G1 X145.943 Y122.023 E.00254
; LINE_WIDTH: 0.199571
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.15464
G1 X146.32 Y121.836 E.00192
; LINE_WIDTH: 0.113296
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.107565
G1 F15000
G2 X144.577 Y129.117 I.494 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446763
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416296
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.376206
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338759
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303766
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.265637
G1 X145.883 Y129.946 E.00275
; LINE_WIDTH: 0.227764
G1 X146.004 Y130.008 E.00205
; LINE_WIDTH: 0.194658
G1 X146.122 Y130.069 E.00164
; LINE_WIDTH: 0.157195
G1 X146.319 Y130.165 E.00204
; LINE_WIDTH: 0.114065
G1 X146.606 Y130.293 E.00182
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.745 Y129.222 Z2.6 F30000
G1 X115.971 Y126.389 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
G1 X139.964 Y126.378 E.73722
G1 X142.714 Y127.38 E.08994
G1 X142.576 Y126.546 E.02598
G3 X142.72 Y124.618 I5.85 J-.533 E.05968
G1 X139.964 Y125.622 E.09015
G1 X116.036 Y125.622 E.7352
G1 X113.286 Y124.62 E.08994
G1 X113.424 Y125.453 E.02597
G3 X113.28 Y127.383 I-5.85 J.533 E.05972
G1 X115.915 Y126.41 E.0863
M73 P84 R2
G1 X142.175 Y126.024 F30000
; LINE_WIDTH: 0.420147
G1 F12000
G3 X142.229 Y125.201 I4.977 J-.091 E.02539
G1 X140.159 Y125.965 E.0678
G1 X139.964 Y126 E.00611
G1 X140.16 Y126.035 E.00612
G1 X142.229 Y126.8 E.06781
G1 X142.179 Y126.084 E.02204
G1 X141.819 Y126.258 F30000
; Slow Down Start
; LINE_WIDTH: 0.39742
G1 F3000;_EXTRUDE_SET_SPEED
G1 X141.819 Y125.742 E.01492
G1 X141.12 Y126 E.02154
G1 X141.763 Y126.238 E.01981
; Slow Down End
G1 X139.964 Y126 F30000
; Slow Down Start
; LINE_WIDTH: 0.4232
G1 F3000;_EXTRUDE_SET_SPEED
G1 X116.047 Y126 E.74115
; Slow Down End
G1 X113.825 Y125.975 F30000
; LINE_WIDTH: 0.420902
G1 F12000
G3 X113.771 Y126.799 I-4.974 J.092 E.02547
G2 X115.84 Y126.034 I-323.405 J-877.174 E.06793
G1 X115.987 Y126 E.00465
G1 X115.84 Y125.966 E.00465
G2 X113.771 Y125.2 I-318.661 J858.005 E.06795
G1 X113.821 Y125.915 E.02207
G1 X114.181 Y126.258 F30000
; Slow Down Start
; LINE_WIDTH: 0.39751
G1 F3000;_EXTRUDE_SET_SPEED
G1 X114.181 Y125.742 E.01493
G1 X114.88 Y126 E.02155
G1 X114.237 Y126.238 E.01982
; Slow Down End
G1 X111.568 Y128.924 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109709
G1 F15000
G1 X111.478 Y129.075 E.00095
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446348
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.413984
G1 X110.528 Y129.714 E.0033
; LINE_WIDTH: 0.372643
G1 X110.427 Y129.775 E.00317
; LINE_WIDTH: 0.330738
G1 X110.31 Y129.84 E.00313
; LINE_WIDTH: 0.288842
G1 X110.19 Y129.906 E.00275
; LINE_WIDTH: 0.24672
G1 X110.058 Y129.978 E.0025
; LINE_WIDTH: 0.200947
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155951
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.11393
G1 X109.394 Y130.293 E.00181
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y123.076 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.109703
G1 F15000
G1 X111.478 Y122.925 E.00096
G1 X111.423 Y122.883 E.00037
G1 X110.844 Y122.48 F30000
; LINE_WIDTH: 0.446392
G1 F15000
G1 X110.622 Y122.342 E.00861
; LINE_WIDTH: 0.414715
G1 X110.531 Y122.288 E.0032
; LINE_WIDTH: 0.374976
G1 X110.434 Y122.23 E.00305
; LINE_WIDTH: 0.330314
G1 X110.303 Y122.155 E.00354
; LINE_WIDTH: 0.28677
G1 X110.185 Y122.092 E.00265
; LINE_WIDTH: 0.247406
G1 X110.064 Y122.025 E.00231
; LINE_WIDTH: 0.214801
G1 X109.968 Y121.976 E.00151
; LINE_WIDTH: 0.189063
G1 X109.869 Y121.926 E.00132
; LINE_WIDTH: 0.155942
G1 X109.679 Y121.835 E.00194
; LINE_WIDTH: 0.113928
G1 X109.394 Y121.707 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X116.129 Y125.915 Z2.6 F30000
G1 X139.548 Y140.73 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.819 Y140.73 E.00899
G1 X143.197 Y139.483 E.11946
G2 X143.196 Y143.516 I5.535 J2.018 E.13653
G1 X139.819 Y142.269 E.11942
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.482 I-5.525 J-2.017 E.1366
G1 X115.964 Y140.73 E.11948
G1 X139.488 Y140.73 E.78032
G1 X139.53 Y140.323 F30000
G1 F15476.087
G1 X139.746 Y140.323 E.00718
G1 X143.976 Y138.762 E.14956
G2 X143.977 Y144.238 I4.781 J2.737 E.1901
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.806 Y138.761 I-4.78 J-2.739 E.19016
G1 X116.037 Y140.323 E.1496
G1 X139.47 Y140.323 E.77731
G1 X139.511 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00537
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.851 Y138.171 I-3.701 J-3.329 E.24191
G1 X110.959 Y138.014 E.0063
G1 X116.109 Y139.916 E.18212
G1 X139.451 Y139.916 E.7743
; WIPE_START
G1 X139.673 Y139.916 E-.0843
G1 X141.342 Y139.3 E-.6757
; WIPE_END
G1 E-.04 F1800
G1 X133.856 Y140.789 Z2.6 F30000
G1 X107.398 Y146.052 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G1 X107.365 Y146.054 E.00109
G3 X107.029 Y136.943 I-.191 J-4.555 E.47657
G3 X107.564 Y136.957 I.135 J4.924 E.01776
G3 X107.762 Y146.02 I-.389 J4.542 E.4426
G1 X107.458 Y146.046 E.01011
G1 X107.364 Y145.646 F30000
G1 F15476.087
G1 X107.348 Y145.647 E.00053
G3 X107.045 Y137.35 I-.174 J-4.148 E.4341
G3 X107.528 Y137.363 I.12 J4.483 E.01606
G3 X107.708 Y145.616 I-.354 J4.136 E.40309
G1 X107.424 Y145.641 E.00949
G1 X107.418 Y145.248 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.331 Y145.256 E.00268
G3 X107.059 Y137.742 I-.157 J-3.756 E.36422
G3 X107.494 Y137.754 I.106 J4.047 E.01337
G3 X107.657 Y145.228 I-.321 J3.746 E.33813
G1 X107.477 Y145.243 E.00555
; WIPE_START
M204 S10000
G1 X107.331 Y145.256 E-.05596
G1 X107.002 Y145.256 E-.12476
G1 X106.514 Y145.202 E-.18682
G1 X106.193 Y145.131 E-.12469
G1 X105.88 Y145.033 E-.12464
G1 X105.577 Y144.907 E-.12463
G1 X105.534 Y144.885 E-.0185
; WIPE_END
G1 E-.04 F1800
G1 X113.038 Y143.488 Z2.6 F30000
G1 X147.598 Y137.057 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X147.63 Y137.051 E.00109
G3 X148.479 Y136.943 I.994 J4.449 E.02842
G3 X149.014 Y136.957 I.135 J4.925 E.01776
G3 X147.247 Y137.154 I-.389 J4.542 E.89075
G1 X147.54 Y137.073 E.01011
G1 X147.702 Y137.45 F30000
G1 F15476.087
G1 X147.718 Y137.448 E.00054
G3 X148.495 Y137.35 I.906 J4.051 E.02599
G3 X148.978 Y137.363 I.12 J4.483 E.01606
G3 X147.369 Y137.542 I-.354 J4.136 E.8112
G1 X147.644 Y137.466 E.00949
G1 X147.861 Y137.818 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.126 Y137.773 E.00825
G3 X148.509 Y137.742 I.498 J3.726 E.01183
G3 X148.944 Y137.754 I.106 J4.047 E.01337
G3 X147.803 Y137.831 I-.321 J3.746 E.69051
; WIPE_START
M204 S10000
G1 X148.126 Y137.773 E-.12476
G1 X148.509 Y137.742 E-.14624
G1 X148.944 Y137.754 E-.16522
G1 X149.269 Y137.797 E-.12467
G1 X149.747 Y137.913 E-.18687
G1 X149.777 Y137.924 E-.01223
; WIPE_END
G1 E-.04 F1800
G1 X142.234 Y139.087 Z2.6 F30000
G1 X139.493 Y139.509 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00356
G1 X147.032 Y136.767 E.26274
G3 X148.578 Y136.51 I1.643 J5.095 E.05218
G3 X146.806 Y146.151 I.037 J4.99 E.58263
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.975 Y146.151 E.25484
G3 X108.977 Y136.848 I-1.805 J-4.652 E.64256
G1 X116.182 Y139.509 E.25479
G1 X139.433 Y139.509 E.77128
G1 X139.475 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00174
G1 X146.901 Y136.382 E.26068
G3 X148.579 Y136.103 I1.777 J5.507 E.05664
G3 X146.666 Y146.533 I.037 J5.397 E.62983
G1 X139.528 Y143.897 E.25242
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25245
G3 X109.117 Y136.466 I-1.945 J-5.034 E.69445
G1 X116.255 Y139.102 E.25242
G1 X139.415 Y139.102 E.76827
G1 X139.458 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X139.458 Y138.71 E.00001
G1 X146.774 Y136.01 E.23962
G3 X148.58 Y135.711 I1.907 J5.902 E.05645
G3 X146.533 Y146.902 I.036 J5.789 E.62541
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X109.25 Y136.097 I-2.079 J-5.402 E.6895
G1 X116.325 Y138.71 E.23173
G1 X139.398 Y138.71 E.70895
; WIPE_START
M204 S10000
G1 X139.458 Y138.71 E-.02292
G1 X141.278 Y138.038 E-.73708
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y138.575 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109561
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445774
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.41397
G1 X145.364 Y137.786 E.00357
; LINE_WIDTH: 0.372558
G1 X145.458 Y137.73 E.00294
; LINE_WIDTH: 0.330397
G1 X145.582 Y137.66 E.00333
; LINE_WIDTH: 0.287679
G1 X145.699 Y137.595 E.00266
; LINE_WIDTH: 0.245511
G1 X145.834 Y137.523 E.00254
; LINE_WIDTH: 0.199571
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.15464
G1 X146.211 Y137.336 E.00192
; LINE_WIDTH: 0.113296
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P85 R2
G1 X144.324 Y144.424 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.107565
G1 F15000
G2 X144.468 Y144.616 I.494 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446763
G1 F15000
G1 X145.262 Y145.153 E.00834
; LINE_WIDTH: 0.416296
G1 X145.36 Y145.212 E.00348
; LINE_WIDTH: 0.376206
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338759
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303766
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.265637
G1 X145.774 Y145.445 E.00275
; LINE_WIDTH: 0.227764
G1 X145.895 Y145.508 E.00205
; LINE_WIDTH: 0.194658
G1 X146.013 Y145.569 E.00164
; LINE_WIDTH: 0.157195
G1 X146.211 Y145.664 E.00204
; LINE_WIDTH: 0.114065
G1 X146.498 Y145.793 E.00182
; WIPE_START
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.637 Y144.722 Z2.6 F30000
G1 X115.862 Y141.889 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F12000
G1 X139.855 Y141.877 E.73722
G1 X142.605 Y142.88 E.08994
G1 X142.468 Y142.046 E.02598
G3 X142.612 Y140.117 I5.85 J-.533 E.05968
G1 X139.855 Y141.122 E.09015
G1 X115.928 Y141.122 E.7352
G1 X113.178 Y140.119 E.08994
G1 X113.315 Y140.953 E.02597
G3 X113.171 Y142.882 I-5.85 J.533 E.05972
G1 X115.806 Y141.91 E.0863
G1 X142.067 Y141.524 F30000
; LINE_WIDTH: 0.420147
G1 F12000
G3 X142.12 Y140.701 I4.977 J-.091 E.02539
G1 X140.051 Y141.464 E.0678
G1 X139.855 Y141.5 E.00611
G1 X140.051 Y141.535 E.00612
G1 X142.121 Y142.299 E.06781
G1 X142.071 Y141.584 E.02204
G1 X141.711 Y141.758 F30000
; Slow Down Start
; LINE_WIDTH: 0.39742
G1 F3000;_EXTRUDE_SET_SPEED
G1 X141.711 Y141.241 E.01492
G1 X141.011 Y141.5 E.02154
G1 X141.655 Y141.737 E.01981
; Slow Down End
G1 X139.855 Y141.5 F30000
; Slow Down Start
; LINE_WIDTH: 0.4232
G1 F3000;_EXTRUDE_SET_SPEED
G1 X115.938 Y141.5 E.74115
; Slow Down End
G1 X113.716 Y141.475 F30000
; LINE_WIDTH: 0.420902
G1 F12000
G3 X113.663 Y142.299 I-4.974 J.092 E.02547
G2 X115.731 Y141.534 I-323.405 J-877.174 E.06793
G1 X115.878 Y141.5 E.00465
G1 X115.731 Y141.465 E.00465
G2 X113.662 Y140.7 I-318.661 J858.005 E.06795
G1 X113.712 Y141.415 E.02207
G1 X114.072 Y141.758 F30000
; Slow Down Start
; LINE_WIDTH: 0.39751
G1 F3000;_EXTRUDE_SET_SPEED
G1 X114.072 Y141.241 E.01493
G1 X114.772 Y141.5 E.02155
G1 X114.128 Y141.737 E.01982
; Slow Down End
G1 X111.459 Y144.424 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109709
G1 F15000
G1 X111.369 Y144.574 E.00095
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446348
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.413984
G1 X110.419 Y145.214 E.0033
; LINE_WIDTH: 0.372643
G1 X110.318 Y145.274 E.00317
; LINE_WIDTH: 0.330738
G1 X110.202 Y145.339 E.00313
; LINE_WIDTH: 0.288842
G1 X110.082 Y145.406 E.00275
; LINE_WIDTH: 0.24672
G1 X109.949 Y145.477 E.0025
; LINE_WIDTH: 0.200947
G1 X109.76 Y145.574 E.00273
; LINE_WIDTH: 0.155951
G1 X109.571 Y145.665 E.00194
; LINE_WIDTH: 0.11393
G1 X109.285 Y145.793 E.00181
; WIPE_START
G1 X109.571 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.46 Y138.575 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.109703
G1 F15000
G1 X111.369 Y138.425 E.00096
G1 X111.315 Y138.383 E.00037
G1 X110.736 Y137.98 F30000
; LINE_WIDTH: 0.446392
G1 F15000
G1 X110.513 Y137.841 E.00861
; LINE_WIDTH: 0.414715
G1 X110.423 Y137.787 E.0032
; LINE_WIDTH: 0.374976
G1 X110.326 Y137.73 E.00305
; LINE_WIDTH: 0.330314
G1 X110.194 Y137.655 E.00354
; LINE_WIDTH: 0.28677
G1 X110.077 Y137.591 E.00265
; LINE_WIDTH: 0.247406
G1 X109.955 Y137.525 E.00231
; LINE_WIDTH: 0.214801
G1 X109.859 Y137.476 E.00151
; LINE_WIDTH: 0.189063
G1 X109.76 Y137.425 E.00132
; LINE_WIDTH: 0.155942
G1 X109.57 Y137.334 E.00194
; LINE_WIDTH: 0.113928
G1 X109.285 Y137.206 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y137.334 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 12/15
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
; object ids of layer 12 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer12 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X143.306 Y123.984
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.212 Y124.262 E.00974
G2 X143.306 Y128.017 I5.549 J1.739 E.12688
G1 X139.927 Y126.77 E.11947
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.984 I-5.525 J-2.017 E.13656
G1 X116.073 Y125.23 E.11946
G1 X139.927 Y125.23 E.7913
G1 X143.25 Y124.005 E.11747
; WIPE_START
G1 X143.212 Y124.262 E-.09886
G1 X143.094 Y124.697 E-.17111
G1 X142.993 Y125.246 E-.21231
G1 X142.95 Y125.748 E-.19134
G1 X142.95 Y125.975 E-.08639
; WIPE_END
G1 E-.04 F1800
G1 X139.638 Y124.823 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X139.855 Y124.823 E.00717
G1 X144.085 Y123.263 E.14956
G2 X144.085 Y128.739 I4.78 J2.737 E.19011
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.263 I-4.78 J-2.739 E.1901
G1 X116.145 Y124.823 E.14956
G1 X139.578 Y124.823 E.77731
G1 X139.62 Y124.416 F30000
G1 F15476.087
G1 X139.782 Y124.416 E.00536
G1 X144.931 Y122.517 E.18204
G1 X145.038 Y122.673 E.0063
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.962 Y122.673 I-3.701 J-3.329 E.24181
G1 X111.069 Y122.517 E.0063
G1 X116.218 Y124.416 E.18204
G1 X139.56 Y124.416 E.7743
; WIPE_START
G1 X139.782 Y124.416 E-.08422
G1 X141.45 Y123.801 E-.67578
; WIPE_END
M73 P85 R1
G1 E-.04 F1800
G1 X133.965 Y125.293 Z2.8 F30000
G1 X107.64 Y130.543 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X107.275 Y130.559 E.0121
G3 X107.124 Y121.444 I.01 J-4.559 E.46942
G3 X107.474 Y121.445 I.162 J4.004 E.0116
G3 X107.699 Y130.54 I-.189 J4.555 E.45504
G1 X107.621 Y130.137 F30000
G1 F15476.087
G1 X107.275 Y130.148 E.01148
G3 X107.14 Y121.851 I.01 J-4.15 E.42738
G3 X107.456 Y121.852 I.146 J3.621 E.01049
G3 X107.68 Y130.129 I-.172 J4.146 E.41365
G1 X107.534 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X113.155 Y127.987 Z2.8 F30000
G1 X147.77 Y121.543 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.13 Y121.481 E.01211
G3 X148.574 Y121.444 I.605 J4.518 E.01479
G3 X148.924 Y121.445 I.162 J4.004 E.0116
G3 X147.712 Y121.557 I-.189 J4.555 E.90966
G1 X147.842 Y121.943 F30000
G1 F15476.087
G1 X148.183 Y121.885 E.01148
G3 X148.59 Y121.851 I.551 J4.113 E.01355
G3 X148.906 Y121.852 I.146 J3.621 E.01049
G3 X147.784 Y121.959 I-.172 J4.146 E.82746
G1 X147.947 Y122.323 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X142.321 Y123.588 Z2.8 F30000
G1 X139.602 Y124.009 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00355
G1 X147.14 Y121.268 E.26274
G3 X146.916 Y130.651 I1.581 J4.732 E.63464
G1 X139.709 Y127.991 E.25482
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.25482
G3 X107.587 Y121.019 I-1.805 J-4.652 E.59152
G3 X108.86 Y121.268 I-.412 J5.492 E.04313
G1 X116.291 Y124.009 E.26273
G1 X139.542 Y124.009 E.77128
G1 X139.584 Y123.602 F30000
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
G1 F3600
M204 S5000
G1 X139.566 Y123.21 E.00003
G1 X146.883 Y120.511 E.23962
G3 X146.642 Y131.402 I1.838 J5.489 E.68162
G1 X139.566 Y128.79 E.23174
G1 X116.434 Y128.79 E.71081
G1 X109.358 Y131.402 E.23174
M73 P86 R1
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
G1 X144.432 Y123.076 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109564
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445746
G1 F15000
G1 X145.372 Y122.346 E.00842
; LINE_WIDTH: 0.414064
G1 X145.472 Y122.286 E.00354
; LINE_WIDTH: 0.372976
G1 X145.565 Y122.231 E.00291
; LINE_WIDTH: 0.331818
G1 X145.684 Y122.165 E.0032
; LINE_WIDTH: 0.290711
G1 X145.795 Y122.102 E.00257
; LINE_WIDTH: 0.247421
G1 X145.943 Y122.023 E.00279
; LINE_WIDTH: 0.199553
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154639
G1 X146.32 Y121.836 E.00192
; LINE_WIDTH: 0.1133
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.433 Y128.925 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107515
G1 F15000
G2 X144.577 Y129.117 I.493 J-.221 E.00127
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446742
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416243
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.37617
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.33873
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303729
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271378
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241508
G1 X145.939 Y129.976 E.00169
; LINE_WIDTH: 0.226435
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201343
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156441
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114065
G1 X146.606 Y130.293 E.00182
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.753 Y129.162 Z2.8 F30000
G1 X114.88 Y126 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39742
G1 F15000
G1 X114.181 Y125.742 E.02154
G1 X114.181 Y126.258 E.01492
G1 X114.824 Y126.021 E.01981
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.84 Y125.965 E.00612
G1 X113.762 Y125.198 E.0681
G1 X113.825 Y125.975 E.02398
G3 X113.769 Y126.8 I-4.716 J.098 E.02544
G1 X115.841 Y126.035 E.06787
G1 X115.977 Y126.011 E.00426
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.904 Y126 E.73541
G1 X116.036 Y126.378 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.964 Y126.378 E.7352
G1 X142.709 Y127.379 E.08979
G3 X142.729 Y124.615 I5.732 J-1.342 E.08573
G1 X139.964 Y125.622 E.09043
G1 X116.036 Y125.622 E.7352
G1 X113.276 Y124.617 E.09026
G1 X113.422 Y125.445 E.02586
G3 X113.281 Y127.382 I-5.851 J.547 E.05994
G1 X115.977 Y126.388 E.0883
G1 X139.964 Y126 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.16 Y126.035 E.00612
G1 X142.225 Y126.798 E.06768
G3 X142.225 Y125.202 I7.089 J-.798 E.04915
G1 X140.159 Y125.965 E.06769
G1 X140.023 Y125.989 E.00426
G1 X141.122 Y126 F30000
; LINE_WIDTH: 0.39889
G1 F15000
G1 X141.814 Y126.256 E.0214
G1 X141.814 Y125.745 E.01482
G1 X141.178 Y125.979 E.01966
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10957
G1 F15000
G2 X111.424 Y122.885 I-.311 J.085 E.00133
G1 X110.846 Y122.482 F30000
; LINE_WIDTH: 0.445403
G1 F15000
G1 X110.621 Y122.342 E.00869
; LINE_WIDTH: 0.413076
G1 X110.53 Y122.288 E.00318
; LINE_WIDTH: 0.373328
G1 X110.434 Y122.231 E.00303
; LINE_WIDTH: 0.336031
G1 X110.342 Y122.179 E.00252
; LINE_WIDTH: 0.30134
G1 X110.246 Y122.124 E.00233
; LINE_WIDTH: 0.260912
G1 X110.102 Y122.047 E.0029
; LINE_WIDTH: 0.222705
G1 X109.989 Y121.989 E.00186
; LINE_WIDTH: 0.19129
G1 X109.873 Y121.929 E.00157
; LINE_WIDTH: 0.154711
G1 X109.678 Y121.835 E.00197
; LINE_WIDTH: 0.11315
G1 X109.41 Y121.715 E.00169
; WIPE_START
G1 X109.678 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y128.924 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107776
G1 F15000
G1 X111.53 Y128.99 E.0004
G3 X111.421 Y129.117 I-.214 J-.073 E.00091
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446368
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414645
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374886
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.33759
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302882
G1 X110.246 Y129.877 E.00235
; LINE_WIDTH: 0.27063
G1 X110.154 Y129.926 E.00194
; LINE_WIDTH: 0.240928
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.200977
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155948
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.113925
G1 X109.394 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X117.033 Y132.21 Z2.8 F30000
G1 X143.198 Y139.483 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.103 Y139.761 E.00974
G2 X143.198 Y143.517 I5.549 J1.739 E.12688
G1 X139.819 Y142.269 E.11947
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.585 Y139.483 I-5.525 J-2.017 E.13656
G1 X115.964 Y140.73 E.11946
G1 X139.819 Y140.73 E.7913
G1 X143.141 Y139.504 E.11747
; WIPE_START
G1 X143.103 Y139.761 E-.09886
G1 X142.985 Y140.196 E-.17111
G1 X142.885 Y140.746 E-.21231
G1 X142.841 Y141.247 E-.19134
G1 X142.841 Y141.475 E-.08639
; WIPE_END
G1 E-.04 F1800
G1 X139.53 Y140.323 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X139.746 Y140.323 E.00717
G1 X143.976 Y138.762 E.14956
G2 X143.977 Y144.238 I4.78 J2.737 E.19011
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.807 Y138.762 I-4.78 J-2.739 E.1901
G1 X116.037 Y140.323 E.14956
G1 X139.47 Y140.323 E.77731
G1 X139.512 Y139.916 F30000
G1 F15476.087
G1 X139.673 Y139.916 E.00536
G1 X144.822 Y138.016 E.18204
G1 X144.93 Y138.173 E.0063
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.853 Y138.173 I-3.701 J-3.329 E.24181
G1 X110.961 Y138.016 E.0063
G1 X116.11 Y139.916 E.18204
G1 X139.452 Y139.916 E.7743
; WIPE_START
G1 X139.673 Y139.916 E-.08422
G1 X141.342 Y139.3 E-.67578
; WIPE_END
G1 E-.04 F1800
G1 X133.857 Y140.793 Z2.8 F30000
G1 X107.531 Y146.043 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X107.166 Y146.058 E.0121
G3 X107.016 Y136.943 I.01 J-4.559 E.46942
G3 X107.365 Y136.944 I.162 J4.004 E.0116
G3 X107.591 Y146.039 I-.189 J4.555 E.45504
G1 X107.512 Y145.637 F30000
G1 F15476.087
G1 X107.166 Y145.648 E.01148
G3 X107.032 Y137.35 I.01 J-4.15 E.42738
G3 X107.348 Y137.351 I.146 J3.621 E.01049
G3 X107.572 Y145.629 I-.172 J4.146 E.41365
G1 X107.425 Y145.248 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.256 E.00795
G3 X107.047 Y137.742 I.009 J-3.758 E.35853
G3 X107.331 Y137.743 I.131 J3.243 E.00872
G3 X107.494 Y145.242 I-.155 J3.755 E.34822
G1 X107.485 Y145.243 E.00028
; WIPE_START
M204 S10000
G1 X107.166 Y145.256 E-.12107
G1 X106.675 Y145.227 E-.18719
G1 X106.353 Y145.17 E-.12433
G1 X106.036 Y145.086 E-.12459
G1 X105.687 Y144.955 E-.14148
G1 X105.543 Y144.883 E-.06134
; WIPE_END
G1 E-.04 F1800
G1 X113.046 Y143.487 Z2.8 F30000
G1 X147.662 Y137.043 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X148.022 Y136.981 E.01211
G3 X148.466 Y136.943 I.605 J4.518 E.01479
G3 X148.815 Y136.944 I.162 J4.004 E.0116
G3 X147.604 Y137.057 I-.189 J4.555 E.90966
G1 X147.734 Y137.443 F30000
G1 F15476.087
G1 X148.075 Y137.384 E.01148
G3 X148.482 Y137.35 I.551 J4.113 E.01355
G3 X148.798 Y137.351 I.146 J3.621 E.01049
G3 X147.676 Y137.458 I-.172 J4.146 E.82746
G1 X147.839 Y137.822 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.126 Y137.773 E.00894
G3 X148.497 Y137.742 I.5 J3.725 E.01144
G3 X148.781 Y137.743 I.131 J3.243 E.00872
G3 X147.781 Y137.836 I-.155 J3.755 E.69459
; WIPE_START
M204 S10000
G1 X148.126 Y137.773 E-.13337
G1 X148.497 Y137.742 E-.14145
G1 X148.781 Y137.743 E-.10785
G1 X149.269 Y137.797 E-.18684
G1 X149.59 Y137.868 E-.12471
G1 X149.755 Y137.92 E-.06578
; WIPE_END
G1 E-.04 F1800
G1 X142.212 Y139.088 Z2.8 F30000
G1 X139.494 Y139.509 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00355
G1 X147.032 Y136.767 E.26274
G3 X146.807 Y146.151 I1.581 J4.732 E.63464
G1 X139.601 Y143.49 E.25482
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.25482
G3 X107.478 Y136.519 I-1.805 J-4.652 E.59152
G3 X108.752 Y136.767 I-.412 J5.492 E.04313
G1 X116.182 Y139.509 E.26273
M73 P87 R1
G1 X139.434 Y139.509 E.77128
G1 X139.475 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00174
G1 X146.9 Y136.382 E.26067
G3 X146.667 Y146.533 I1.712 J5.118 E.68621
G1 X139.528 Y143.897 E.25244
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25246
G3 X107.504 Y136.112 I-1.945 J-5.034 E.63949
G3 X108.883 Y136.382 I-.447 J5.947 E.0467
G1 X116.255 Y139.102 E.26067
G1 X139.415 Y139.102 E.76827
G1 X139.457 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X139.458 Y138.71 E.00003
G1 X146.774 Y136.011 E.23962
G3 X146.533 Y146.902 I1.838 J5.489 E.68162
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X107.529 Y135.721 I-2.079 J-5.403 E.63516
G3 X109.009 Y136.01 I-.481 J6.385 E.04645
G1 X116.325 Y138.71 E.23962
G1 X139.397 Y138.71 E.70893
; WIPE_START
M204 S10000
G1 X139.458 Y138.71 E-.02321
G1 X141.277 Y138.038 E-.73679
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y138.575 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109564
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445746
G1 F15000
G1 X145.263 Y137.846 E.00842
; LINE_WIDTH: 0.414064
G1 X145.364 Y137.786 E.00354
; LINE_WIDTH: 0.372976
G1 X145.457 Y137.731 E.00291
; LINE_WIDTH: 0.331818
G1 X145.575 Y137.664 E.0032
; LINE_WIDTH: 0.290711
G1 X145.687 Y137.602 E.00257
; LINE_WIDTH: 0.247421
G1 X145.834 Y137.523 E.00279
; LINE_WIDTH: 0.199553
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154639
G1 X146.211 Y137.336 E.00192
; LINE_WIDTH: 0.1133
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.425 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107515
G1 F15000
G2 X144.468 Y144.616 I.493 J-.221 E.00127
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446742
G1 F15000
G1 X145.262 Y145.154 E.00834
; LINE_WIDTH: 0.416243
G1 X145.361 Y145.212 E.00348
; LINE_WIDTH: 0.37617
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.33873
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303729
G1 X145.641 Y145.374 E.00224
; LINE_WIDTH: 0.271378
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241508
G1 X145.83 Y145.475 E.00169
; LINE_WIDTH: 0.226435
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201343
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156441
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114065
G1 X146.498 Y145.793 E.00182
; WIPE_START
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.644 Y144.662 Z2.8 F30000
G1 X114.772 Y141.5 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39742
G1 F15000
G1 X114.072 Y141.241 E.02154
G1 X114.072 Y141.758 E.01492
G1 X114.715 Y141.52 E.01981
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.732 Y141.464 E.00612
G1 X113.653 Y140.697 E.0681
G1 X113.716 Y141.475 E.02398
G3 X113.661 Y142.3 I-4.716 J.098 E.02544
G1 X115.732 Y141.535 E.06787
G1 X115.869 Y141.51 E.00426
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.795 Y141.5 E.73541
G1 X115.928 Y141.877 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.855 Y141.877 E.7352
G1 X142.601 Y142.878 E.08979
G3 X142.62 Y140.114 I5.732 J-1.342 E.08573
G1 X139.855 Y141.122 E.09043
G1 X115.928 Y141.122 E.7352
G1 X113.168 Y140.116 E.09026
G1 X113.314 Y140.945 E.02586
G3 X113.173 Y142.882 I-5.851 J.547 E.05994
G1 X115.869 Y141.888 E.0883
G1 X139.855 Y141.5 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.051 Y141.535 E.00612
G1 X142.117 Y142.298 E.06768
G3 X142.117 Y140.702 I7.089 J-.798 E.04915
G1 X140.051 Y141.464 E.06769
G1 X139.914 Y141.489 E.00426
G1 X141.013 Y141.5 F30000
; LINE_WIDTH: 0.39889
G1 F15000
G1 X141.705 Y141.755 E.0214
G1 X141.705 Y141.244 E.01482
G1 X141.07 Y141.479 E.01966
G1 X111.46 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10957
G1 F15000
G2 X111.316 Y138.385 I-.311 J.085 E.00133
G1 X110.738 Y137.982 F30000
; LINE_WIDTH: 0.445403
G1 F15000
G1 X110.513 Y137.842 E.00869
; LINE_WIDTH: 0.413076
G1 X110.422 Y137.788 E.00318
; LINE_WIDTH: 0.373328
G1 X110.325 Y137.73 E.00303
; LINE_WIDTH: 0.336031
G1 X110.234 Y137.678 E.00252
; LINE_WIDTH: 0.30134
G1 X110.137 Y137.624 E.00233
; LINE_WIDTH: 0.260912
G1 X109.993 Y137.546 E.0029
; LINE_WIDTH: 0.222705
G1 X109.881 Y137.488 E.00186
; LINE_WIDTH: 0.19129
G1 X109.765 Y137.429 E.00157
; LINE_WIDTH: 0.154711
G1 X109.57 Y137.335 E.00197
; LINE_WIDTH: 0.11315
G1 X109.301 Y137.214 E.00169
; WIPE_START
G1 X109.57 Y137.335 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.46 Y144.424 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107776
G1 F15000
G1 X111.422 Y144.489 E.0004
G3 X111.313 Y144.617 I-.214 J-.073 E.00091
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446368
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414645
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374886
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.33759
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302882
G1 X110.137 Y145.376 E.00235
; LINE_WIDTH: 0.27063
G1 X110.045 Y145.426 E.00194
; LINE_WIDTH: 0.240928
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200977
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155948
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113925
G1 X109.285 Y145.793 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 13/15
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
; object ids of layer 13 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer13 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X143.306 Y123.984
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.212 Y124.262 E.00974
G2 X143.306 Y128.017 I5.549 J1.739 E.12689
G1 X139.927 Y126.77 E.11947
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.984 I-5.524 J-2.017 E.13656
G1 X116.073 Y125.23 E.11946
G1 X139.927 Y125.23 E.7913
G1 X143.25 Y124.005 E.11747
; WIPE_START
G1 X143.212 Y124.262 E-.09879
G1 X143.081 Y124.749 E-.19165
G1 X142.999 Y125.208 E-.17705
G1 X142.95 Y125.748 E-.20611
G1 X142.95 Y125.975 E-.08639
; WIPE_END
G1 E-.04 F1800
G1 X144.085 Y123.263 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X143.855 Y123.729 E.01725
G2 X144.085 Y128.739 I4.955 J2.282 E.17285
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.263 I-4.78 J-2.739 E.1901
G1 X116.145 Y124.823 E.14956
G1 X139.855 Y124.823 E.78647
G1 X144.028 Y123.283 E.14758
; WIPE_START
G1 X143.855 Y123.729 E-.18177
G1 X143.6 Y124.384 E-.26704
G1 X143.433 Y125.066 E-.26687
G1 X143.418 Y125.182 E-.04432
; WIPE_END
G1 E-.04 F1800
G1 X145.038 Y122.673 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.962 Y122.673 I-3.701 J-3.329 E.24181
G1 X111.069 Y122.517 E.0063
G1 X116.218 Y124.416 E.18204
G1 X139.782 Y124.416 E.78165
G1 X144.931 Y122.517 E.18204
G1 X145.004 Y122.624 E.00431
; WIPE_START
G1 X144.657 Y123.151 E-.24002
G1 X144.424 Y123.516 E-.16449
G1 X144.224 Y123.901 E-.16489
G1 X144.058 Y124.302 E-.16466
G1 X144.037 Y124.367 E-.02595
; WIPE_END
G1 E-.04 F1800
G1 X147.77 Y121.543 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X148.13 Y121.481 E.01212
G3 X148.561 Y121.444 I.602 J4.517 E.01433
G3 X148.924 Y121.445 I.173 J4.151 E.01206
G3 X147.712 Y121.557 I-.191 J4.552 E.90919
G1 X147.811 Y121.95 F30000
G1 F15476.087
G1 X147.827 Y121.948 E.00053
G3 X148.577 Y121.851 I.905 J4.05 E.02513
G3 X148.906 Y121.852 I.156 J3.764 E.01093
G3 X147.477 Y122.042 I-.174 J4.146 E.8168
G1 X147.753 Y121.966 E.0095
G1 X147.927 Y122.326 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.234 Y122.273 E.00959
G3 X148.593 Y122.243 I.498 J3.725 E.01106
G3 X148.889 Y122.244 I.14 J3.385 E.00911
G3 X147.868 Y122.341 I-.157 J3.754 E.69386
; WIPE_START
M204 S10000
G1 X148.234 Y122.273 E-.14139
M73 P88 R1
G1 X148.593 Y122.243 E-.13667
G1 X148.889 Y122.244 E-.11265
G1 X149.378 Y122.297 E-.18681
G1 X149.698 Y122.368 E-.12472
G1 X149.843 Y122.414 E-.05776
; WIPE_END
G1 E-.04 F1800
G1 X142.349 Y123.857 Z3 F30000
G1 X107.64 Y130.543 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.272 Y130.554 E.01221
G3 X107.111 Y121.444 I.011 J-4.556 E.46877
G3 X107.474 Y121.445 I.173 J4.151 E.01206
G3 X107.699 Y130.535 I-.191 J4.552 E.45467
G1 X107.621 Y130.137 F30000
G1 F15476.087
G1 X107.273 Y130.147 E.01154
G3 X107.127 Y121.851 I.009 J-4.15 E.42697
G3 X107.456 Y121.852 I.156 J3.765 E.01093
G3 X107.68 Y130.128 I-.174 J4.146 E.41346
G1 X107.539 Y129.749 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X113.194 Y128.192 Z3 F30000
G1 X139.602 Y124.009 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00354
G1 X147.14 Y121.268 E.26274
G3 X146.915 Y130.651 I1.581 J4.732 E.63467
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.085 Y130.651 E.2548
G3 X107.587 Y121.019 I-1.806 J-4.652 E.59154
G3 X108.86 Y121.268 I-.432 J5.591 E.04312
G1 X116.291 Y124.009 E.26273
G1 X139.542 Y124.009 E.77129
G1 X139.584 Y123.602 F30000
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
G1 F3600
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
G1 X144.432 Y123.075 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109542
G1 F15000
G3 X144.576 Y122.885 I.31 J.085 E.00132
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445857
G1 F15000
G1 X145.371 Y122.347 E.00841
; LINE_WIDTH: 0.414725
G1 X145.47 Y122.288 E.00347
; LINE_WIDTH: 0.374491
G1 X145.561 Y122.234 E.00286
; LINE_WIDTH: 0.336998
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302076
G1 X145.75 Y122.127 E.00222
; LINE_WIDTH: 0.269751
G1 X145.847 Y122.075 E.00203
; LINE_WIDTH: 0.23985
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224752
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.199613
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154622
G1 X146.32 Y121.836 E.00193
; LINE_WIDTH: 0.113268
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.1076
G1 F15000
G2 X144.577 Y129.117 I.495 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.446734
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416237
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.37616
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.33871
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303736
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.27139
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241505
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226426
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201335
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156458
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114078
G1 X146.606 Y130.293 E.00182
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.753 Y129.162 Z3 F30000
G1 X114.88 Y126 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39742
G1 F15000
G1 X114.181 Y125.742 E.02154
G1 X114.181 Y126.258 E.01492
G1 X114.824 Y126.021 E.01981
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.84 Y125.965 E.00612
G1 X113.771 Y125.201 E.06779
G1 X113.825 Y125.975 E.02385
G3 X113.771 Y126.799 I-4.98 J.09 E.02542
G1 X115.841 Y126.035 E.06781
G1 X115.977 Y126.011 E.00426
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.904 Y126 E.73541
G1 X116.036 Y126.378 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.964 Y126.378 E.7352
G1 X142.709 Y127.379 E.08979
G3 X142.728 Y124.615 I5.871 J-1.342 E.08569
G1 X139.964 Y125.622 E.09041
G1 X116.036 Y125.622 E.7352
G1 X113.286 Y124.62 E.08994
G1 X113.424 Y125.454 E.02595
G3 X113.28 Y127.383 I-5.852 J.533 E.05971
G1 X115.977 Y126.388 E.08835
G1 X139.964 Y126 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.16 Y126.035 E.00612
G1 X142.225 Y126.798 E.06768
G3 X142.228 Y125.202 I6.914 J-.789 E.04919
G1 X140.159 Y125.965 E.06776
G1 X140.023 Y125.989 E.00426
G1 X141.122 Y126 F30000
; LINE_WIDTH: 0.39888
G1 F15000
G1 X141.814 Y126.256 E.0214
G1 X141.814 Y125.745 E.01482
G1 X141.178 Y125.979 E.01966
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109578
G1 F15000
G2 X111.424 Y122.885 I-.311 J.085 E.00133
G1 X110.846 Y122.482 F30000
; LINE_WIDTH: 0.445447
G1 F15000
G1 X110.621 Y122.342 E.00869
; LINE_WIDTH: 0.41311
G1 X110.53 Y122.288 E.00319
; LINE_WIDTH: 0.373263
G1 X110.433 Y122.23 E.00304
; LINE_WIDTH: 0.335965
G1 X110.342 Y122.179 E.00251
; LINE_WIDTH: 0.301312
G1 X110.246 Y122.124 E.00233
; LINE_WIDTH: 0.26906
G1 X110.153 Y122.075 E.00193
; LINE_WIDTH: 0.2393
G1 X110.057 Y122.023 E.00174
; LINE_WIDTH: 0.199274
G1 X109.868 Y121.927 E.0027
; LINE_WIDTH: 0.1542
G1 X109.678 Y121.835 E.00191
; LINE_WIDTH: 0.113166
G1 X109.41 Y121.715 E.00169
; WIPE_START
G1 X109.678 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y128.924 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.109704
G1 F15000
G1 X111.478 Y129.075 E.00095
G1 X111.423 Y129.117 E.00037
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446373
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414663
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374913
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.33763
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302924
G1 X110.246 Y129.876 E.00235
; LINE_WIDTH: 0.270661
G1 X110.154 Y129.926 E.00195
; LINE_WIDTH: 0.240939
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.200979
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155955
G1 X109.679 Y130.166 E.00194
; LINE_WIDTH: 0.113907
G1 X109.394 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.166 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X117.032 Y132.21 Z3 F30000
G1 X143.197 Y139.483 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.103 Y139.761 E.00974
G2 X143.198 Y143.517 I5.549 J1.739 E.12689
G1 X139.819 Y142.269 E.11947
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.586 Y139.483 I-5.524 J-2.017 E.13656
G1 X115.964 Y140.73 E.11946
G1 X139.819 Y140.73 E.7913
G1 X143.141 Y139.504 E.11747
; WIPE_START
G1 X143.103 Y139.761 E-.09879
G1 X142.973 Y140.249 E-.19165
G1 X142.891 Y140.707 E-.17705
G1 X142.841 Y141.247 E-.20611
G1 X142.841 Y141.475 E-.08639
; WIPE_END
G1 E-.04 F1800
G1 X143.976 Y138.762 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X143.746 Y139.229 E.01725
G2 X143.977 Y144.238 I4.955 J2.282 E.17285
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.807 Y138.762 I-4.78 J-2.739 E.1901
G1 X116.037 Y140.323 E.14956
G1 X139.746 Y140.323 E.78647
G1 X143.92 Y138.783 E.14758
; WIPE_START
G1 X143.746 Y139.229 E-.18177
G1 X143.491 Y139.884 E-.26704
G1 X143.325 Y140.566 E-.26687
G1 X143.309 Y140.681 E-.04432
; WIPE_END
G1 E-.04 F1800
G1 X144.93 Y138.173 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
M73 P89 R1
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.853 Y138.173 I-3.701 J-3.329 E.24181
G1 X110.961 Y138.016 E.0063
G1 X116.11 Y139.916 E.18204
G1 X139.673 Y139.916 E.78165
G1 X144.822 Y138.016 E.18204
G1 X144.896 Y138.123 E.00431
; WIPE_START
G1 X144.548 Y138.651 E-.24002
G1 X144.316 Y139.016 E-.16449
G1 X144.115 Y139.401 E-.16489
G1 X143.949 Y139.801 E-.16466
G1 X143.929 Y139.866 E-.02595
; WIPE_END
G1 E-.04 F1800
G1 X147.662 Y137.043 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X148.022 Y136.98 E.01212
G3 X148.452 Y136.944 I.602 J4.517 E.01433
G3 X148.815 Y136.944 I.173 J4.151 E.01206
G3 X147.603 Y137.056 I-.191 J4.552 E.90919
G1 X147.702 Y137.45 F30000
G1 F15476.087
G1 X147.718 Y137.448 E.00053
G3 X148.468 Y137.351 I.905 J4.05 E.02513
G3 X148.798 Y137.351 I.156 J3.764 E.01093
G3 X147.369 Y137.542 I-.174 J4.146 E.8168
G1 X147.645 Y137.466 E.0095
G1 X147.818 Y137.826 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X148.126 Y137.773 E.00959
G3 X148.484 Y137.742 I.498 J3.725 E.01106
G3 X148.781 Y137.743 I.14 J3.385 E.00911
G3 X147.76 Y137.84 I-.157 J3.754 E.69386
; WIPE_START
M204 S10000
G1 X148.126 Y137.773 E-.14139
G1 X148.484 Y137.742 E-.13667
G1 X148.781 Y137.743 E-.11265
G1 X149.269 Y137.797 E-.18681
G1 X149.59 Y137.868 E-.12472
G1 X149.735 Y137.913 E-.05776
; WIPE_END
G1 E-.04 F1800
G1 X142.24 Y139.357 Z3 F30000
G1 X107.531 Y146.043 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.163 Y146.053 E.01221
G3 X107.002 Y136.944 I.011 J-4.556 E.46877
G3 X107.365 Y136.944 I.173 J4.151 E.01206
G3 X107.59 Y146.034 I-.191 J4.552 E.45467
G1 X107.512 Y145.637 F30000
G1 F15476.087
G1 X107.164 Y145.647 E.01154
G3 X107.018 Y137.351 I.009 J-4.15 E.42697
G3 X107.348 Y137.351 I.156 J3.765 E.01093
G3 X107.571 Y145.628 I-.174 J4.146 E.41346
G1 X107.43 Y145.248 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.255 E.00814
G3 X107.034 Y137.742 I.008 J-3.758 E.35822
G3 X107.331 Y137.743 I.14 J3.385 E.00911
G3 X107.494 Y145.241 I-.157 J3.754 E.34805
G1 X107.49 Y145.242 E.00011
; WIPE_START
M204 S10000
G1 X107.166 Y145.255 E-.12338
G1 X106.676 Y145.227 E-.18651
G1 X106.353 Y145.17 E-.12463
G1 X106.036 Y145.086 E-.12463
G1 X105.699 Y144.961 E-.13672
G1 X105.547 Y144.885 E-.06412
; WIPE_END
G1 E-.04 F1800
G1 X113.086 Y143.691 Z3 F30000
G1 X139.494 Y139.509 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00354
G1 X147.032 Y136.767 E.26274
G3 X146.806 Y146.151 I1.581 J4.732 E.63467
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.976 Y146.151 E.2548
G3 X107.479 Y136.519 I-1.806 J-4.652 E.59154
G3 X108.751 Y136.767 I-.432 J5.591 E.04312
G1 X116.182 Y139.509 E.26273
G1 X139.434 Y139.509 E.77129
G1 X139.476 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00173
G1 X146.901 Y136.382 E.26068
G3 X146.667 Y146.533 I1.712 J5.118 E.68622
G1 X139.528 Y143.897 E.25243
G1 X116.255 Y143.897 E.77201
G1 X109.116 Y146.533 E.25243
G3 X107.504 Y136.112 I-1.946 J-5.034 E.63952
G3 X108.883 Y136.382 I-.467 J6.048 E.0467
G1 X116.255 Y139.102 E.26067
G1 X139.416 Y139.102 E.76828
G1 X139.46 Y138.709 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X146.774 Y136.01 E.23957
G3 X146.533 Y146.902 I1.838 J5.489 E.68161
G1 X139.458 Y144.29 E.23174
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23174
G3 X107.529 Y135.721 I-2.079 J-5.403 E.63516
G3 X109.009 Y136.011 I-.501 J6.489 E.04645
G1 X116.325 Y138.71 E.23962
G1 X139.4 Y138.71 E.70901
; WIPE_START
M204 S10000
G1 X141.278 Y138.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y138.575 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109542
G1 F15000
G3 X144.467 Y138.385 I.31 J.085 E.00132
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445857
G1 F15000
G1 X145.263 Y137.846 E.00841
; LINE_WIDTH: 0.414725
G1 X145.361 Y137.787 E.00347
; LINE_WIDTH: 0.374491
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.336998
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302076
G1 X145.641 Y137.626 E.00222
; LINE_WIDTH: 0.269751
G1 X145.738 Y137.574 E.00203
; LINE_WIDTH: 0.23985
G1 X145.83 Y137.525 E.00168
; LINE_WIDTH: 0.224752
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.199613
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154622
G1 X146.211 Y137.336 E.00193
; LINE_WIDTH: 0.113268
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y144.423 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.1076
G1 F15000
G2 X144.468 Y144.616 I.495 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.446734
G1 F15000
G1 X145.262 Y145.154 E.00834
; LINE_WIDTH: 0.416237
G1 X145.361 Y145.212 E.00348
; LINE_WIDTH: 0.37616
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.33871
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303736
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.27139
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241505
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226426
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201335
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156458
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114078
G1 X146.498 Y145.793 E.00182
; WIPE_START
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.644 Y144.662 Z3 F30000
G1 X114.772 Y141.5 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39742
G1 F15000
G1 X114.072 Y141.241 E.02154
G1 X114.072 Y141.758 E.01492
G1 X114.715 Y141.52 E.01981
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.732 Y141.464 E.00612
G1 X113.663 Y140.701 E.06779
G1 X113.716 Y141.475 E.02385
G3 X113.663 Y142.299 I-4.98 J.09 E.02542
G1 X115.732 Y141.535 E.06781
G1 X115.869 Y141.51 E.00426
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.795 Y141.5 E.73541
G1 X115.928 Y141.877 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.855 Y141.877 E.7352
G1 X142.601 Y142.878 E.08979
G3 X142.619 Y140.115 I5.871 J-1.342 E.08569
G1 X139.855 Y141.122 E.09041
G1 X115.928 Y141.122 E.7352
G1 X113.178 Y140.12 E.08994
G1 X113.315 Y140.953 E.02595
G3 X113.171 Y142.882 I-5.852 J.533 E.05971
G1 X115.869 Y141.888 E.08835
G1 X139.855 Y141.5 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.051 Y141.535 E.00612
G1 X142.117 Y142.298 E.06768
G3 X142.119 Y140.701 I6.914 J-.789 E.04919
G1 X140.051 Y141.464 E.06776
G1 X139.914 Y141.489 E.00426
G1 X141.013 Y141.5 F30000
; LINE_WIDTH: 0.39888
G1 F15000
G1 X141.705 Y141.755 E.0214
G1 X141.705 Y141.244 E.01482
G1 X141.07 Y141.479 E.01966
G1 X111.46 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109578
G1 F15000
G2 X111.316 Y138.385 I-.311 J.085 E.00133
G1 X110.738 Y137.982 F30000
; LINE_WIDTH: 0.445447
G1 F15000
G1 X110.513 Y137.842 E.00869
; LINE_WIDTH: 0.41311
G1 X110.422 Y137.788 E.00319
; LINE_WIDTH: 0.373263
G1 X110.325 Y137.73 E.00304
; LINE_WIDTH: 0.335965
G1 X110.233 Y137.678 E.00251
; LINE_WIDTH: 0.301312
G1 X110.137 Y137.624 E.00233
; LINE_WIDTH: 0.26906
G1 X110.045 Y137.574 E.00193
; LINE_WIDTH: 0.2393
G1 X109.949 Y137.523 E.00174
; LINE_WIDTH: 0.199274
G1 X109.76 Y137.426 E.0027
; LINE_WIDTH: 0.1542
G1 X109.57 Y137.335 E.00191
; LINE_WIDTH: 0.113166
G1 X109.301 Y137.214 E.00169
; WIPE_START
G1 X109.57 Y137.335 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.459 Y144.424 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.109704
M73 P90 R1
G1 F15000
G1 X111.369 Y144.574 E.00095
G1 X111.315 Y144.616 E.00037
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446373
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414663
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374913
G1 X110.326 Y145.27 E.00305
; LINE_WIDTH: 0.33763
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302924
G1 X110.138 Y145.376 E.00235
; LINE_WIDTH: 0.270661
G1 X110.045 Y145.426 E.00195
; LINE_WIDTH: 0.240939
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.200979
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155955
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113907
G1 X109.285 Y145.793 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 14/15
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
; object ids of layer 14 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer14 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X143.306 Y123.984
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.212 Y124.262 E.00973
G2 X143.306 Y128.017 I5.548 J1.739 E.12689
G1 X139.927 Y126.77 E.11948
G1 X116.072 Y126.77 E.79131
G1 X112.694 Y128.017 E.11948
G2 X112.694 Y123.984 I-5.538 J-2.017 E.13655
G1 X116.073 Y125.23 E.11946
G1 X139.927 Y125.23 E.7913
G1 X143.25 Y124.005 E.11747
; WIPE_START
G1 X143.212 Y124.262 E-.09876
G1 X143.081 Y124.749 E-.1916
G1 X142.997 Y125.222 E-.18272
G1 X142.95 Y125.748 E-.20055
G1 X142.95 Y125.975 E-.08637
; WIPE_END
G1 E-.04 F1800
G1 X139.639 Y124.823 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X139.855 Y124.823 E.00716
G1 X144.085 Y123.263 E.14956
G2 X144.085 Y128.739 I4.781 J2.737 E.19011
G1 X139.855 Y127.177 E.1496
G1 X116.145 Y127.177 E.78649
G1 X111.915 Y128.739 E.1496
G2 X111.915 Y123.263 I-4.786 J-2.739 E.19009
G1 X116.145 Y124.823 E.14957
G1 X139.579 Y124.823 E.77732
; WIPE_START
G1 X139.855 Y124.823 E-.10486
G1 X141.472 Y124.227 E-.65514
; WIPE_END
G1 E-.04 F1800
G1 X145.038 Y122.673 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G2 X145.04 Y129.329 I3.703 J3.327 E.24181
G1 X144.932 Y129.485 E.0063
G1 X139.782 Y127.584 E.18212
G1 X116.218 Y127.584 E.78166
G1 X111.068 Y129.485 E.18212
G1 X110.96 Y129.329 E.0063
G2 X110.962 Y122.673 I-3.704 J-3.329 E.24179
G1 X111.069 Y122.517 E.0063
G1 X116.218 Y124.416 E.18204
G1 X139.782 Y124.416 E.78165
G1 X144.931 Y122.517 E.18204
G1 X145.004 Y122.624 E.00431
; WIPE_START
G1 X144.657 Y123.151 E-.24007
G1 X144.424 Y123.517 E-.16459
G1 X144.224 Y123.901 E-.16474
G1 X144.058 Y124.301 E-.16442
G1 X144.037 Y124.367 E-.02618
; WIPE_END
G1 E-.04 F1800
G1 X147.707 Y121.557 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X147.739 Y121.551 E.00109
G3 X148.547 Y121.444 I.996 J4.449 E.02707
G1 X148.725 Y121.441 E.00591
G3 X147.355 Y121.655 I.01 J4.559 E.90397
G1 X147.649 Y121.573 E.01012
G1 X147.811 Y121.95 F30000
G1 F15476.087
G1 X147.827 Y121.948 E.00053
G3 X148.564 Y121.851 I.908 J4.051 E.02469
G1 X148.725 Y121.848 E.00535
G3 X147.477 Y122.043 I.01 J4.152 E.82325
G1 X147.753 Y121.966 E.00949
G1 X147.903 Y122.331 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X142.326 Y123.851 Z3.2 F30000
G1 X107.64 Y130.543 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.273 Y130.558 E.01217
G3 X107.097 Y121.444 I.012 J-4.559 E.46844
G1 X107.275 Y121.441 E.0059
G3 X107.699 Y130.539 I.01 J4.559 E.46164
G1 X107.621 Y130.137 F30000
G1 F15476.087
G1 X107.274 Y130.151 E.01152
G3 X107.114 Y121.851 I.011 J-4.152 E.42663
G1 X107.275 Y121.848 E.00535
G3 X107.681 Y130.132 I.01 J4.152 E.41981
G1 X107.544 Y129.748 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 X113.198 Y128.196 Z3.2 F30000
G1 X139.602 Y124.009 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.709 Y124.009 E.00354
G1 X147.14 Y121.268 E.26273
G3 X146.915 Y130.651 I1.581 J4.732 E.63468
G1 X139.709 Y127.991 E.25479
G1 X116.291 Y127.991 E.77683
G1 X109.086 Y130.651 E.25477
G3 X107.585 Y121.019 I-1.807 J-4.651 E.59151
G3 X108.86 Y121.268 I-.429 J5.589 E.04318
G1 X116.291 Y124.009 E.26273
G1 X139.542 Y124.009 E.7713
G1 X139.584 Y123.602 F30000
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
G1 F3600
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
G1 X144.432 Y123.076 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109565
G1 F15000
G3 X144.576 Y122.885 I.311 J.085 E.00133
G1 X145.154 Y122.482 F30000
; LINE_WIDTH: 0.445825
G1 F15000
G1 X145.371 Y122.347 E.00841
; LINE_WIDTH: 0.414686
G1 X145.47 Y122.288 E.00347
; LINE_WIDTH: 0.374526
G1 X145.561 Y122.234 E.00286
; LINE_WIDTH: 0.337085
G1 X145.658 Y122.179 E.00269
; LINE_WIDTH: 0.302172
G1 X145.75 Y122.127 E.00222
; LINE_WIDTH: 0.269808
G1 X145.847 Y122.075 E.00204
; LINE_WIDTH: 0.23984
G1 X145.939 Y122.025 E.00168
; LINE_WIDTH: 0.224709
G1 X145.943 Y122.023 E.00006
; LINE_WIDTH: 0.199592
G1 X146.129 Y121.928 E.00267
; LINE_WIDTH: 0.154639
G1 X146.32 Y121.836 E.00193
; LINE_WIDTH: 0.113291
G1 X146.59 Y121.715 E.0017
; WIPE_START
G1 X146.32 Y121.836 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.432 Y128.924 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.107557
G1 F15000
G2 X144.577 Y129.117 I.494 J-.222 E.00128
G1 X145.156 Y129.52 F30000
; LINE_WIDTH: 0.44675
G1 F15000
G1 X145.371 Y129.654 E.00834
; LINE_WIDTH: 0.416264
G1 X145.469 Y129.713 E.00348
; LINE_WIDTH: 0.376212
G1 X145.56 Y129.767 E.00287
; LINE_WIDTH: 0.338781
G1 X145.658 Y129.822 E.00271
; LINE_WIDTH: 0.303779
G1 X145.749 Y129.874 E.00224
; LINE_WIDTH: 0.271411
G1 X145.846 Y129.926 E.00205
; LINE_WIDTH: 0.241489
G1 X145.939 Y129.976 E.0017
; LINE_WIDTH: 0.226394
G1 X145.942 Y129.978 E.00006
; LINE_WIDTH: 0.201317
G1 X146.129 Y130.073 E.0027
; LINE_WIDTH: 0.156435
G1 X146.319 Y130.165 E.00196
; LINE_WIDTH: 0.114055
G1 X146.606 Y130.293 E.00182
; WIPE_START
G1 X146.319 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.753 Y129.162 Z3.2 F30000
G1 X114.88 Y126 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3974
G1 F15000
G1 X114.181 Y125.742 E.02154
G1 X114.181 Y126.258 E.01492
G1 X114.824 Y126.021 E.01981
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.84 Y125.965 E.00612
G1 X113.771 Y125.201 E.0678
G1 X113.825 Y125.98 E.02401
G3 X113.771 Y126.8 I-5.012 J.081 E.02527
G1 X115.841 Y126.035 E.06783
G1 X115.977 Y126.011 E.00426
G1 X116.036 Y126 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.904 Y126 E.73541
G1 X116.036 Y126.378 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.964 Y126.378 E.7352
G1 X142.709 Y127.379 E.0898
G3 X142.728 Y124.615 I5.863 J-1.342 E.08569
G1 X139.964 Y125.622 E.09042
G1 X116.036 Y125.622 E.7352
G1 X113.279 Y124.618 E.09017
G1 X113.424 Y125.454 E.02607
G3 X113.28 Y127.383 I-5.846 J.533 E.05971
G1 X115.977 Y126.388 E.08835
G1 X139.964 Y126 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.16 Y126.035 E.00612
G1 X142.225 Y126.798 E.06768
G3 X142.227 Y125.202 I6.977 J-.792 E.04917
G1 X140.159 Y125.965 E.06774
G1 X140.023 Y125.989 E.00426
G1 X141.122 Y126 F30000
; LINE_WIDTH: 0.39888
G1 F15000
G1 X141.814 Y126.256 E.0214
G1 X141.814 Y125.745 E.01482
G1 X141.178 Y125.979 E.01966
G1 X111.568 Y123.076 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109556
G1 F15000
G2 X111.424 Y122.885 I-.31 J.085 E.00133
G1 X110.846 Y122.482 F30000
; LINE_WIDTH: 0.445415
G1 F15000
G1 X110.621 Y122.342 E.00869
; LINE_WIDTH: 0.413115
G1 X110.531 Y122.288 E.00318
; LINE_WIDTH: 0.373416
G1 X110.434 Y122.231 E.00303
; LINE_WIDTH: 0.336097
G1 X110.342 Y122.179 E.00252
; LINE_WIDTH: 0.301314
G1 X110.246 Y122.124 E.00233
; LINE_WIDTH: 0.269008
G1 X110.153 Y122.075 E.00193
; LINE_WIDTH: 0.239264
G1 X110.057 Y122.023 E.00174
; LINE_WIDTH: 0.199235
G1 X109.868 Y121.927 E.0027
; LINE_WIDTH: 0.154174
M73 P91 R1
G1 X109.679 Y121.835 E.00191
; LINE_WIDTH: 0.113165
G1 X109.41 Y121.715 E.00169
; WIPE_START
G1 X109.679 Y121.835 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.568 Y128.924 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.109727
G1 F15000
G1 X111.478 Y129.075 E.00096
G1 X111.423 Y129.117 E.00038
G1 X110.844 Y129.52 F30000
; LINE_WIDTH: 0.446344
G1 F15000
G1 X110.622 Y129.659 E.00862
; LINE_WIDTH: 0.414614
G1 X110.531 Y129.713 E.0032
; LINE_WIDTH: 0.374831
G1 X110.434 Y129.77 E.00305
; LINE_WIDTH: 0.337541
G1 X110.342 Y129.822 E.00253
; LINE_WIDTH: 0.302839
G1 X110.246 Y129.877 E.00235
; LINE_WIDTH: 0.270609
G1 X110.154 Y129.926 E.00194
; LINE_WIDTH: 0.240919
G1 X110.058 Y129.978 E.00176
; LINE_WIDTH: 0.20096
G1 X109.869 Y130.074 E.00273
; LINE_WIDTH: 0.155955
G1 X109.679 Y130.165 E.00194
; LINE_WIDTH: 0.113918
G1 X109.394 Y130.293 E.00181
; OBJECT_ID: 104
; WIPE_START
G1 X109.679 Y130.165 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X117.033 Y132.21 Z3.2 F30000
G1 X143.197 Y139.483 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.103 Y139.761 E.00973
G2 X143.198 Y143.517 I5.548 J1.739 E.12689
G1 X139.819 Y142.269 E.11948
G1 X115.964 Y142.269 E.79131
G1 X112.585 Y143.517 E.11948
G2 X112.586 Y139.483 I-5.538 J-2.017 E.13655
G1 X115.964 Y140.73 E.11946
G1 X139.819 Y140.73 E.7913
G1 X143.141 Y139.504 E.11747
; WIPE_START
G1 X143.103 Y139.761 E-.09876
G1 X142.973 Y140.248 E-.1916
G1 X142.889 Y140.722 E-.18272
G1 X142.841 Y141.247 E-.20055
G1 X142.841 Y141.475 E-.08637
; WIPE_END
G1 E-.04 F1800
G1 X139.53 Y140.323 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X139.746 Y140.323 E.00716
G1 X143.976 Y138.762 E.14956
G2 X143.977 Y144.238 I4.781 J2.737 E.19011
G1 X139.746 Y142.676 E.1496
G1 X116.037 Y142.676 E.78649
G1 X111.806 Y144.238 E.1496
G2 X111.807 Y138.762 I-4.786 J-2.739 E.19009
G1 X116.037 Y140.323 E.14957
G1 X139.47 Y140.323 E.77732
; WIPE_START
G1 X139.746 Y140.323 E-.10486
G1 X141.363 Y139.726 E-.65514
; WIPE_END
G1 E-.04 F1800
G1 X144.93 Y138.173 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G2 X144.931 Y144.828 I3.703 J3.327 E.24181
G1 X144.824 Y144.985 E.0063
G1 X139.673 Y143.083 E.18212
G1 X116.109 Y143.083 E.78166
G1 X110.959 Y144.985 E.18212
G1 X110.851 Y144.828 E.0063
G2 X110.853 Y138.173 I-3.704 J-3.329 E.24179
G1 X110.961 Y138.016 E.0063
G1 X116.11 Y139.916 E.18204
G1 X139.673 Y139.916 E.78165
G1 X144.822 Y138.016 E.18204
G1 X144.896 Y138.123 E.00431
; WIPE_START
G1 X144.548 Y138.651 E-.24007
G1 X144.315 Y139.016 E-.16459
G1 X144.115 Y139.401 E-.16474
G1 X143.95 Y139.801 E-.16442
G1 X143.929 Y139.866 E-.02618
; WIPE_END
G1 E-.04 F1800
G1 X147.598 Y137.057 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X147.63 Y137.05 E.00109
G3 X148.438 Y136.944 I.996 J4.449 E.02707
G1 X148.616 Y136.94 E.00591
G3 X147.246 Y137.154 I.01 J4.559 E.90397
G1 X147.54 Y137.073 E.01012
G1 X147.702 Y137.45 F30000
G1 F15476.087
G1 X147.718 Y137.448 E.00053
G3 X148.455 Y137.351 I.908 J4.051 E.02469
G1 X148.616 Y137.347 E.00535
G3 X147.369 Y137.542 I.01 J4.152 E.82325
G1 X147.645 Y137.466 E.00949
G1 X147.794 Y137.831 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.803 Y137.831 E.00027
G3 X148.472 Y137.743 I.823 J3.668 E.02074
G1 X148.616 Y137.739 E.00445
G3 X147.487 Y137.916 I.009 J3.759 E.69056
G1 X147.737 Y137.847 E.00796
; WIPE_START
M204 S10000
G1 X147.803 Y137.831 E-.02604
G1 X148.126 Y137.772 E-.12462
G1 X148.472 Y137.743 E-.13187
G1 X148.616 Y137.739 E-.05509
G1 X148.944 Y137.754 E-.1246
G1 X149.43 Y137.829 E-.18692
G1 X149.712 Y137.904 E-.11086
; WIPE_END
G1 E-.04 F1800
G1 X142.218 Y139.35 Z3.2 F30000
G1 X107.531 Y146.043 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.164 Y146.058 E.01217
G3 X106.989 Y136.944 I.012 J-4.559 E.46844
G1 X107.166 Y136.94 E.0059
G3 X107.591 Y146.039 I.01 J4.559 E.46164
G1 X107.512 Y145.637 F30000
G1 F15476.087
G1 X107.165 Y145.651 E.01152
G3 X107.005 Y137.351 I.011 J-4.152 E.42663
G1 X107.166 Y137.347 E.00535
G3 X107.572 Y145.632 I.01 J4.152 E.41981
G1 X107.436 Y145.248 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X107.166 Y145.258 E.0083
G3 X107.022 Y137.743 I.01 J-3.759 E.35788
G1 X107.166 Y137.739 E.00445
G3 X107.496 Y145.245 I.009 J3.759 E.35335
; WIPE_START
M204 S10000
G1 X107.166 Y145.258 E-.12542
G1 X106.676 Y145.227 E-.1867
G1 X106.353 Y145.17 E-.1247
G1 X106.036 Y145.086 E-.12454
G1 X105.728 Y144.973 E-.12473
G1 X105.551 Y144.891 E-.07391
; WIPE_END
G1 E-.04 F1800
G1 X113.089 Y143.696 Z3.2 F30000
G1 X139.494 Y139.509 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.601 Y139.509 E.00354
G1 X147.031 Y136.767 E.26273
G3 X146.806 Y146.151 I1.581 J4.732 E.63468
G1 X139.601 Y143.49 E.25479
G1 X116.182 Y143.49 E.77683
G1 X108.977 Y146.151 E.25477
G3 X107.477 Y136.519 I-1.807 J-4.651 E.59151
G3 X108.751 Y136.767 I-.429 J5.589 E.04318
G1 X116.182 Y139.509 E.26273
G1 X139.434 Y139.509 E.7713
G1 X139.476 Y139.102 F30000
G1 F15476.087
G1 X139.528 Y139.102 E.00173
G1 X146.9 Y136.382 E.26067
G3 X146.666 Y146.533 I1.712 J5.118 E.68624
G1 X139.528 Y143.897 E.25242
G1 X116.255 Y143.897 E.77201
G1 X109.117 Y146.533 E.25242
G3 X107.503 Y136.112 I-1.946 J-5.034 E.6395
G3 X108.883 Y136.382 I-.465 J6.047 E.04673
G1 X116.255 Y139.102 E.26067
G1 X139.416 Y139.102 E.76828
G1 X139.455 Y138.71 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X139.458 Y138.71 E.00008
G1 X146.774 Y136.011 E.23962
G3 X146.533 Y146.902 I1.838 J5.489 E.68163
G1 X139.458 Y144.29 E.23173
G1 X116.325 Y144.29 E.71081
G1 X109.251 Y146.901 E.23172
G3 X107.528 Y135.721 I-2.08 J-5.403 E.63518
G3 X109.009 Y136.011 I-.501 J6.489 E.04646
G1 X116.325 Y138.71 E.23962
G1 X139.395 Y138.71 E.70888
; WIPE_START
M204 S10000
G1 X139.458 Y138.71 E-.02374
G1 X141.276 Y138.039 E-.73626
; WIPE_END
G1 E-.04 F1800
G1 X144.323 Y138.575 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109565
G1 F15000
G3 X144.467 Y138.385 I.311 J.085 E.00133
G1 X145.045 Y137.982 F30000
; LINE_WIDTH: 0.445825
G1 F15000
G1 X145.263 Y137.846 E.00841
; LINE_WIDTH: 0.414686
G1 X145.361 Y137.787 E.00347
; LINE_WIDTH: 0.374526
G1 X145.452 Y137.733 E.00286
; LINE_WIDTH: 0.337085
G1 X145.55 Y137.678 E.00269
; LINE_WIDTH: 0.302172
G1 X145.641 Y137.626 E.00222
; LINE_WIDTH: 0.269808
G1 X145.738 Y137.574 E.00204
; LINE_WIDTH: 0.23984
G1 X145.831 Y137.524 E.00168
; LINE_WIDTH: 0.224709
G1 X145.834 Y137.523 E.00006
; LINE_WIDTH: 0.199592
G1 X146.021 Y137.428 E.00267
; LINE_WIDTH: 0.154639
G1 X146.211 Y137.336 E.00193
; LINE_WIDTH: 0.113291
G1 X146.482 Y137.214 E.0017
; WIPE_START
G1 X146.211 Y137.336 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.324 Y144.424 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.107557
G1 F15000
G2 X144.468 Y144.616 I.494 J-.222 E.00128
G1 X145.047 Y145.019 F30000
; LINE_WIDTH: 0.44675
G1 F15000
G1 X145.262 Y145.154 E.00834
; LINE_WIDTH: 0.416264
G1 X145.361 Y145.212 E.00348
; LINE_WIDTH: 0.376212
G1 X145.451 Y145.266 E.00287
; LINE_WIDTH: 0.338781
G1 X145.549 Y145.322 E.00271
; LINE_WIDTH: 0.303779
G1 X145.641 Y145.373 E.00224
; LINE_WIDTH: 0.271411
G1 X145.738 Y145.426 E.00205
; LINE_WIDTH: 0.241489
G1 X145.83 Y145.475 E.0017
; LINE_WIDTH: 0.226394
G1 X145.834 Y145.477 E.00006
; LINE_WIDTH: 0.201317
G1 X146.02 Y145.572 E.0027
; LINE_WIDTH: 0.156435
G1 X146.211 Y145.664 E.00196
; LINE_WIDTH: 0.114055
G1 X146.498 Y145.793 E.00182
; WIPE_START
G1 X146.211 Y145.664 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.644 Y144.662 Z3.2 F30000
G1 X114.772 Y141.5 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3974
G1 F15000
G1 X114.072 Y141.241 E.02154
G1 X114.072 Y141.758 E.01492
G1 X114.715 Y141.52 E.01981
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.420139
G1 F15000
G1 X115.732 Y141.464 E.00612
G1 X113.662 Y140.7 E.0678
G1 X113.716 Y141.48 E.02401
G3 X113.662 Y142.299 I-5.012 J.081 E.02527
G1 X115.732 Y141.535 E.06783
G1 X115.869 Y141.51 E.00426
G1 X115.928 Y141.5 F30000
; LINE_WIDTH: 0.42104
G1 F15000
G1 X139.795 Y141.5 E.73541
G1 X115.928 Y141.877 F30000
; LINE_WIDTH: 0.41999
G1 F15000
G1 X139.855 Y141.877 E.7352
G1 X142.601 Y142.878 E.0898
G3 X142.62 Y140.114 I5.863 J-1.342 E.08569
G1 X139.855 Y141.122 E.09042
G1 X115.928 Y141.122 E.7352
G1 X113.171 Y140.117 E.09017
G1 X113.315 Y140.953 E.02607
G3 X113.171 Y142.882 I-5.846 J.533 E.05971
G1 X115.869 Y141.888 E.08835
G1 X139.855 Y141.5 F30000
; LINE_WIDTH: 0.42014
G1 F15000
G1 X140.051 Y141.535 E.00612
G1 X142.117 Y142.298 E.06768
G3 X142.118 Y140.701 I6.977 J-.792 E.04917
G1 X140.051 Y141.464 E.06774
G1 X139.914 Y141.489 E.00426
G1 X141.013 Y141.5 F30000
; LINE_WIDTH: 0.39888
G1 F15000
G1 X141.705 Y141.755 E.0214
G1 X141.705 Y141.244 E.01482
G1 X141.07 Y141.479 E.01966
G1 X111.459 Y138.575 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109556
G1 F15000
G2 X111.316 Y138.385 I-.31 J.085 E.00133
G1 X110.738 Y137.982 F30000
; LINE_WIDTH: 0.445415
G1 F15000
G1 X110.513 Y137.842 E.00869
; LINE_WIDTH: 0.413115
G1 X110.422 Y137.788 E.00318
; LINE_WIDTH: 0.373416
G1 X110.325 Y137.73 E.00303
; LINE_WIDTH: 0.336097
G1 X110.234 Y137.678 E.00252
; LINE_WIDTH: 0.301314
M73 P92 R1
G1 X110.137 Y137.624 E.00233
; LINE_WIDTH: 0.269008
G1 X110.045 Y137.574 E.00193
; LINE_WIDTH: 0.239264
G1 X109.949 Y137.523 E.00174
; LINE_WIDTH: 0.199235
G1 X109.76 Y137.426 E.0027
; LINE_WIDTH: 0.154174
G1 X109.57 Y137.335 E.00191
; LINE_WIDTH: 0.113165
G1 X109.301 Y137.214 E.00169
; WIPE_START
G1 X109.57 Y137.335 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.46 Y144.424 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.109727
G1 F15000
G1 X111.369 Y144.574 E.00096
G1 X111.315 Y144.616 E.00038
G1 X110.736 Y145.019 F30000
; LINE_WIDTH: 0.446344
G1 F15000
G1 X110.513 Y145.158 E.00862
; LINE_WIDTH: 0.414614
G1 X110.422 Y145.212 E.0032
; LINE_WIDTH: 0.374831
G1 X110.325 Y145.27 E.00305
; LINE_WIDTH: 0.337541
G1 X110.234 Y145.322 E.00253
; LINE_WIDTH: 0.302839
G1 X110.137 Y145.376 E.00235
; LINE_WIDTH: 0.270609
G1 X110.045 Y145.426 E.00194
; LINE_WIDTH: 0.240919
G1 X109.949 Y145.477 E.00176
; LINE_WIDTH: 0.20096
G1 X109.76 Y145.573 E.00273
; LINE_WIDTH: 0.155955
G1 X109.57 Y145.665 E.00194
; LINE_WIDTH: 0.113918
G1 X109.285 Y145.793 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X109.57 Y145.665 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; layer num/total_layer_count: 15/15
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
; object ids of layer 15 start: 72,104
M624 AwAAAAAAAAA=
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

; object ids of this layer15 end: 72,104
M625
; OBJECT_ID: 72
; start printing object, unique label id: 72
M624 AQAAAAAAAAA=
G1 X147.885 Y122.336
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
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
G1 F3600
M204 S5000
G1 X107.275 Y129.759 E.00842
G3 X107.117 Y122.243 I.003 J-3.76 E.35789
G1 X107.275 Y122.24 E.00484
G3 X107.609 Y129.745 I.003 J3.76 E.35284
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
G1 F3600
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
G1 X147.062 Y122.399 E.055
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
M73 P92 R0
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
M73 P93 R0
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
G1 X135.649 Y128.583
G1 X130.483 Y123.417 E.22446
G1 X129.95 Y123.417
G1 X135.115 Y128.583 E.22446
G1 X134.582 Y128.583
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
G1 X104.332 Y121.263
M73 P94 R0
G1 X105.516 Y122.447 E.05146
G1 X105.176 Y122.64
G1 X104.012 Y121.476 E.05058
G1 X103.711 Y121.708
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
G1 X152.281 Y124.206 E.00097
; LINE_WIDTH: 0.105248
G1 X152.208 Y124.106 E.00063
; OBJECT_ID: 104
; WIPE_START
G1 X152.281 Y124.206 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 72
M625
; start printing object, unique label id: 104
M624 AgAAAAAAAAA=
G1 X149.886 Y131.452 Z3.4 F30000
G1 X147.776 Y137.836 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X147.803 Y137.829 E.00084
G3 X148.459 Y137.743 I.817 J3.67 E.02036
G1 X148.616 Y137.739 E.00484
G3 X147.486 Y137.914 I.003 J3.76 E.69056
G1 X147.718 Y137.851 E.0074
; WIPE_START
M204 S10000
G1 X147.803 Y137.829 E-.03318
G1 X148.126 Y137.772 E-.12462
G1 X148.459 Y137.743 E-.12705
G1 X148.616 Y137.739 E-.05991
G1 X148.944 Y137.754 E-.12462
G1 X149.269 Y137.797 E-.12466
G1 X149.694 Y137.9 E-.16596
; WIPE_END
G1 E-.04 F1800
G1 X142.174 Y139.208 Z3.4 F30000
G1 X107.44 Y145.248 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X107.166 Y145.259 E.00842
G3 X107.009 Y137.743 I.003 J-3.76 E.35789
G1 X107.166 Y137.739 E.00484
G3 X107.5 Y145.244 I.003 J3.76 E.35284
; WIPE_START
M204 S10000
G1 X107.166 Y145.259 E-.12692
G1 X106.839 Y145.245 E-.12456
G1 X106.514 Y145.202 E-.12465
G1 X106.036 Y145.086 E-.18691
G1 X105.728 Y144.973 E-.12465
G1 X105.555 Y144.893 E-.07231
; WIPE_END
G1 E-.04 F1800
G1 X113.064 Y143.523 Z3.4 F30000
G1 X139.455 Y138.71 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3600
M204 S5000
G1 X139.458 Y138.71 E.00009
M73 P95 R0
G1 X146.774 Y136.011 E.23962
G3 X146.533 Y146.902 I1.838 J5.489 E.68163
G1 X139.458 Y144.29 E.23173
G1 X116.325 Y144.29 E.71081
G1 X109.25 Y146.902 E.23175
G3 X107.529 Y135.721 I-2.079 J-5.403 E.63516
G3 X109.009 Y136.01 I-.498 J6.474 E.04644
G1 X116.325 Y138.71 E.23962
G1 X139.395 Y138.71 E.70887
; WIPE_START
M204 S10000
G1 X139.458 Y138.71 E-.02397
G1 X141.275 Y138.039 E-.73603
; WIPE_END
G1 E-.04 F1800
G1 X148.788 Y136.696 Z3.4 F30000
G1 X150.736 Y136.348 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X153.768 Y139.38 E.13172
G1 X154.042 Y140.187
G1 X149.93 Y136.075 E.1787
G1 X149.284 Y135.962
G1 X154.154 Y140.832 E.21163
G1 X154.187 Y141.399
G1 X148.718 Y135.93 E.23765
G1 X148.191 Y135.936
G1 X150.063 Y137.808 E.08135
G1 X149.316 Y137.595
G1 X147.716 Y135.995 E.06953
G1 X147.279 Y136.09
G1 X148.73 Y137.542 E.06307
G1 X148.211 Y137.556
G1 X146.857 Y136.202 E.05885
G1 X146.467 Y136.345
G1 X147.75 Y137.628 E.05576
G1 X147.337 Y137.749
G1 X146.077 Y136.489 E.05476
G1 X145.688 Y136.632
G1 X146.953 Y137.898 E.055
G1 X146.604 Y138.082
G1 X145.298 Y136.776 E.05674
G1 X144.909 Y136.92
G1 X146.284 Y138.295 E.05976
G1 X145.988 Y138.532
G1 X144.519 Y137.063 E.06383
G1 X144.129 Y137.207
G1 X145.716 Y138.794 E.06895
G1 X145.471 Y139.082
G1 X143.74 Y137.351 E.07521
G1 X143.35 Y137.495
G1 X145.253 Y139.397 E.08268
G1 X145.064 Y139.742
G1 X142.961 Y137.638 E.0914
G1 X142.571 Y137.782
G1 X144.901 Y140.112 E.10125
G1 X144.775 Y140.519
G1 X142.182 Y137.926 E.11267
G1 X141.792 Y138.069
G1 X144.686 Y140.963 E.12575
G1 X144.653 Y141.463
G1 X141.403 Y138.213 E.14123
G1 X141.013 Y138.357
G1 X144.685 Y142.028 E.15955
G1 X144.846 Y142.723
G1 X140.624 Y138.501 E.18349
G1 X140.234 Y138.644
G1 X145.395 Y143.805 E.22427
; WIPE_START
M204 S10000
G1 X143.981 Y142.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.329 Y140.328 Z3.4 F30000
G1 X152.308 Y140.053 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X154.18 Y141.925 E.08137
G1 X154.123 Y142.402
G1 X152.521 Y140.8 E.06961
G1 X152.58 Y141.392
G1 X154.033 Y142.845 E.06314
G1 X153.913 Y143.258
G1 X152.56 Y141.905 E.0588
G1 X152.488 Y142.366
G1 X153.766 Y143.645 E.05554
G1 X153.597 Y144.009
G1 X152.368 Y142.779 E.05344
G1 X152.218 Y143.163
G1 X153.405 Y144.35 E.05158
G1 X153.198 Y144.676
G1 X152.034 Y143.512 E.05058
G1 X151.82 Y143.831
G1 X152.972 Y144.983 E.05004
G1 X152.727 Y145.271
G1 X151.585 Y144.129 E.04962
G1 X151.317 Y144.395
G1 X152.465 Y145.542 E.04985
G1 X152.181 Y145.792
G1 X151.032 Y144.643 E.04994
G1 X150.717 Y144.861
G1 X151.879 Y146.023 E.05049
G1 X151.556 Y146.234
G1 X150.375 Y145.053 E.05132
G1 X150.004 Y145.215
G1 X151.219 Y146.429 E.05277
G1 X150.861 Y146.605
G1 X149.597 Y145.341 E.05491
G1 X149.153 Y145.43
G1 X150.479 Y146.757 E.05766
G1 X150.074 Y146.884
G1 X148.653 Y145.463 E.06174
G1 X148.088 Y145.431
G1 X149.64 Y146.984 E.06748
G1 X149.173 Y147.05
G1 X147.393 Y145.27 E.07735
G1 X146.31 Y144.72
G1 X148.663 Y147.074 E.10226
G1 X148.112 Y147.056
G1 X139.844 Y138.788 E.35928
G1 X139.44 Y138.917
G1 X147.487 Y146.964 E.3497
G1 X146.744 Y146.754
G1 X138.907 Y138.917 E.34055
G1 X138.374 Y138.917
G1 X145.906 Y146.449 E.32731
G1 X145.06 Y146.137
G1 X137.84 Y138.917 E.31375
G1 X137.307 Y138.917
G1 X144.215 Y145.825 E.30018
G1 X143.37 Y145.513
G1 X136.774 Y138.917 E.28662
G1 X136.241 Y138.917
G1 X142.524 Y145.201 E.27306
G1 X141.679 Y144.888
G1 X135.707 Y138.917 E.25949
G1 X135.174 Y138.917
G1 X140.834 Y144.576 E.24593
G1 X139.988 Y144.264
G1 X134.641 Y138.917 E.23237
G1 X134.108 Y138.917
G1 X139.273 Y144.082 E.22446
G1 X138.74 Y144.082
G1 X133.574 Y138.917 E.22446
G1 X133.041 Y138.917
G1 X138.206 Y144.082 E.22446
G1 X137.673 Y144.082
G1 X132.508 Y138.917 E.22446
G1 X131.975 Y138.917
G1 X137.14 Y144.082 E.22446
G1 X136.607 Y144.082
G1 X131.441 Y138.917 E.22446
G1 X130.908 Y138.917
G1 X136.073 Y144.082 E.22446
G1 X135.54 Y144.082
G1 X130.375 Y138.917 E.22446
G1 X129.841 Y138.917
G1 X135.007 Y144.082 E.22446
G1 X134.473 Y144.082
G1 X129.308 Y138.917 E.22446
G1 X128.775 Y138.917
G1 X133.94 Y144.082 E.22446
G1 X133.407 Y144.082
G1 X128.242 Y138.917 E.22446
G1 X127.708 Y138.917
G1 X132.874 Y144.082 E.22446
G1 X132.34 Y144.082
G1 X127.175 Y138.917 E.22446
G1 X126.642 Y138.917
G1 X131.807 Y144.082 E.22446
G1 X131.274 Y144.082
G1 X126.109 Y138.917 E.22446
G1 X125.575 Y138.917
G1 X130.741 Y144.082 E.22446
G1 X130.207 Y144.082
G1 X125.042 Y138.917 E.22446
G1 X124.509 Y138.917
G1 X129.674 Y144.082 E.22446
G1 X129.141 Y144.082
G1 X123.976 Y138.917 E.22446
G1 X123.442 Y138.917
G1 X128.608 Y144.082 E.22446
G1 X128.074 Y144.082
G1 X122.909 Y138.917 E.22446
G1 X122.376 Y138.917
G1 X127.541 Y144.082 E.22446
G1 X127.008 Y144.082
G1 X121.843 Y138.917 E.22446
G1 X121.309 Y138.917
G1 X126.475 Y144.082 E.22446
G1 X125.941 Y144.082
G1 X120.776 Y138.917 E.22446
G1 X120.243 Y138.917
G1 X125.408 Y144.082 E.22446
G1 X124.875 Y144.082
G1 X119.71 Y138.917 E.22446
G1 X119.176 Y138.917
G1 X124.342 Y144.082 E.22446
G1 X123.808 Y144.082
G1 X118.643 Y138.917 E.22446
G1 X118.11 Y138.917
G1 X123.275 Y144.082 E.22446
G1 X122.742 Y144.082
G1 X117.577 Y138.917 E.22446
G1 X117.043 Y138.917
G1 X122.209 Y144.082 E.22446
G1 X121.675 Y144.082
M73 P96 R0
G1 X116.51 Y138.917 E.22446
G1 X115.795 Y138.735
G1 X121.142 Y144.082 E.23236
G1 X120.609 Y144.082
G1 X114.95 Y138.423 E.24591
G1 X114.105 Y138.112
G1 X120.076 Y144.082 E.25945
G1 X119.542 Y144.082
G1 X113.26 Y137.8 E.273
G1 X112.415 Y137.488
G1 X119.009 Y144.082 E.28654
G1 X118.476 Y144.082
G1 X111.57 Y137.176 E.30009
G1 X110.725 Y136.865
G1 X117.942 Y144.082 E.31363
G1 X117.409 Y144.082
G1 X109.88 Y136.553 E.32718
G1 X109.035 Y136.241
G1 X116.876 Y144.082 E.34072
G1 X116.343 Y144.082
G1 X108.297 Y136.037 E.34961
G1 X107.676 Y135.949
G1 X115.939 Y144.211 E.35903
G1 X115.549 Y144.355
G1 X110.413 Y139.219 E.22318
G1 X110.937 Y140.276
G1 X115.16 Y144.499 E.18349
G1 X114.77 Y144.643
G1 X111.098 Y140.971 E.15956
G1 X111.13 Y141.536
G1 X114.381 Y144.786 E.14124
G1 X113.991 Y144.93
G1 X111.097 Y142.036 E.12578
G1 X111.008 Y142.481
G1 X113.602 Y145.074 E.1127
G1 X113.212 Y145.218
G1 X110.882 Y142.887 E.10126
G1 X110.72 Y143.258
G1 X112.823 Y145.362 E.09139
G1 X112.433 Y145.505
G1 X110.526 Y143.598 E.08288
G1 X110.312 Y143.917
G1 X112.044 Y145.649 E.07525
G1 X111.654 Y145.793
G1 X110.067 Y144.205 E.069
G1 X109.796 Y144.468
G1 X111.265 Y145.937 E.06384
G1 X110.875 Y146.08
G1 X109.498 Y144.704 E.05984
G1 X109.179 Y144.917
G1 X110.486 Y146.224 E.05681
G1 X110.097 Y146.368
G1 X108.83 Y145.101 E.05506
G1 X108.447 Y145.252
G1 X109.707 Y146.512 E.05475
G1 X109.318 Y146.656
G1 X108.027 Y145.365 E.05607
G1 X107.572 Y145.443
G1 X108.922 Y146.793 E.05867
G1 X108.504 Y146.909
G1 X107.058 Y145.463 E.06283
G1 X106.458 Y145.395
G1 X108.067 Y147.004 E.06992
G1 X107.592 Y147.063
G1 X105.719 Y145.191 E.08136
; WIPE_START
M204 S10000
G1 X107.134 Y146.605 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.187 Y139.254 Z3.4 F30000
G1 X109.462 Y138.268 Z3.4
G1 Z3
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X107.114 Y135.92 E.10201
G1 X106.617 Y135.956
G1 X108.39 Y137.729 E.07704
G1 X107.699 Y137.572
G1 X106.144 Y136.016 E.06758
G1 X105.709 Y136.115
G1 X107.133 Y137.538 E.06185
G1 X106.63 Y137.569
G1 X105.301 Y136.24 E.05774
G1 X104.918 Y136.39
G1 X106.186 Y137.658 E.0551
G1 X105.784 Y137.789
G1 X104.561 Y136.566 E.05313
G1 X104.223 Y136.762
G1 X105.408 Y137.946 E.05146
G1 X105.068 Y138.14
G1 X103.904 Y136.976 E.05058
G1 X103.602 Y137.207
G1 X104.749 Y138.354 E.04984
G1 X104.461 Y138.599
G1 X103.318 Y137.457 E.04965
G1 X103.056 Y137.728
G1 X104.198 Y138.87 E.04963
G1 X103.961 Y139.166
G1 X102.811 Y138.016 E.04998
G1 X102.585 Y138.323
G1 X103.752 Y139.491 E.05073
G1 X103.565 Y139.836
G1 X102.378 Y138.649 E.05159
G1 X102.186 Y138.991
G1 X103.415 Y140.22 E.05343
G1 X103.295 Y140.633
G1 X102.017 Y139.355 E.05555
G1 X101.87 Y139.741
G1 X103.223 Y141.094 E.0588
G1 X103.203 Y141.607
G1 X101.75 Y140.154 E.06314
G1 X101.668 Y140.606
G1 X103.271 Y142.208 E.06964
G1 X103.475 Y142.946
G1 X101.605 Y141.076 E.08127
G1 X101.59 Y141.594
G1 X107.075 Y147.079 E.23834
G1 X106.494 Y147.032
G1 X101.637 Y142.175 E.21106
G1 X101.748 Y142.818
G1 X105.853 Y146.924 E.17841
G1 X105.064 Y146.668
G1 X101.999 Y143.603 E.13316
; WIPE_START
M204 S10000
G1 X103.413 Y145.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.684 Y143.394 Z3.4 F30000
M73 P97 R0
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105248
G1 F15000
G1 X103.61 Y143.294 E.00063
; LINE_WIDTH: 0.140129
G1 X103.534 Y143.19 E.00102
; LINE_WIDTH: 0.171261
G1 X103.474 Y143.1 E.00114
; LINE_WIDTH: 0.197228
G1 X103.413 Y143.009 E.00137
; WIPE_START
G1 X103.474 Y143.1 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.135 Y141.806 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.113225
G1 F15000
G1 X103.218 Y141.592 E.00132
; WIPE_START
G1 X103.135 Y141.806 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.57 Y137.842 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0902999
G1 F15000
G1 X105.465 Y137.916 E.0005
; WIPE_START
G1 X105.57 Y137.842 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.779 Y137.878 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105018
G1 F15000
G1 X108.701 Y137.826 E.00048
; LINE_WIDTH: 0.138716
G1 X108.623 Y137.773 E.00073
; LINE_WIDTH: 0.185174
G1 X108.453 Y137.665 E.00233
; WIPE_START
G1 X108.623 Y137.773 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.127 Y139.171 Z3.4 F30000
G1 X146.25 Y144.781 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.209352
G1 F15000
G1 X145.895 Y144.465 E.00644
G1 X145.334 Y143.866 E.01113
G1 X144.995 Y143.113 F30000
; LINE_WIDTH: 0.105037
G1 F15000
G1 X144.943 Y143.034 E.00048
; LINE_WIDTH: 0.138761
G1 X144.89 Y142.956 E.00073
; LINE_WIDTH: 0.185217
G1 X144.782 Y142.787 E.00233
; WIPE_START
G1 X144.89 Y142.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.58 Y141.536 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105283
G1 F15000
G1 X144.675 Y141.752 E.0012
; WIPE_START
G1 X144.58 Y141.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.987 Y137.554 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0922442
G1 F15000
G2 X148.803 Y137.468 I-1.761 J3.54 E.00081
; WIPE_START
G1 X148.987 Y137.554 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.522 Y138.028 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104942
G1 F15000
G1 X150.418 Y137.95 E.00066
; LINE_WIDTH: 0.149812
G2 X150.13 Y137.742 I-4.015 J5.244 E.0031
; WIPE_START
G1 X150.418 Y137.95 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.513 Y138.831 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.104628
G1 F15000
G1 X153.437 Y138.729 E.00064
; LINE_WIDTH: 0.137535
G1 X153.36 Y138.627 E.00098
; LINE_WIDTH: 0.177792
G1 X153.207 Y138.44 E.00266
; LINE_WIDTH: 0.225392
G1 X153.054 Y138.253 E.00359
; LINE_WIDTH: 0.262273
G1 X152.895 Y138.076 E.00424
; LINE_WIDTH: 0.298646
G2 X152.227 Y137.389 I-6.637 J5.783 E.01998
; LINE_WIDTH: 0.28973
G1 X152.051 Y137.231 E.00478
; LINE_WIDTH: 0.264218
G1 X151.874 Y137.072 E.00428
; LINE_WIDTH: 0.227993
G1 X151.687 Y136.918 E.00364
; LINE_WIDTH: 0.181059
G1 X151.501 Y136.765 E.00272
; LINE_WIDTH: 0.140231
G1 X151.393 Y136.684 E.00107
; LINE_WIDTH: 0.105522
G1 X151.285 Y136.603 E.00069
G1 X150.674 Y136.411 F30000
; LINE_WIDTH: 0.188296
G1 F15000
G1 X150.544 Y136.323 E.00186
; LINE_WIDTH: 0.144019
G1 X150.413 Y136.236 E.00129
; LINE_WIDTH: 0.103255
G1 X150.335 Y136.19 E.00045
; WIPE_START
G1 X150.413 Y136.236 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.801 Y136.793 Z3.4 F30000
G1 X110.473 Y139.159 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.210417
G1 F15000
G2 X109.522 Y138.207 I-5.89 J4.936 E.01838
; WIPE_START
G1 X110.133 Y138.78 E-.47232
G1 X110.473 Y139.159 E-.28768
; WIPE_END
G1 E-.04 F1800
G1 X105.74 Y145.147 Z3.4 F30000
G1 X105.654 Y145.256 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157382
G1 F15000
G1 X105.471 Y145.129 E.00208
; LINE_WIDTH: 0.13943
G1 X105.372 Y145.056 E.00097
; LINE_WIDTH: 0.105255
G1 X105.272 Y144.982 E.00063
; WIPE_START
G1 X105.372 Y145.056 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.497 Y146.396 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10551
G1 F15000
G1 X104.39 Y146.315 E.00069
; LINE_WIDTH: 0.140197
G1 X104.282 Y146.234 E.00107
; LINE_WIDTH: 0.180979
G1 X104.095 Y146.081 E.00272
; LINE_WIDTH: 0.227898
G1 X103.909 Y145.927 E.00364
; LINE_WIDTH: 0.264113
G1 X103.732 Y145.769 E.00428
; LINE_WIDTH: 0.298863
G3 X103.046 Y145.099 I5.791 J-6.627 E.02
; LINE_WIDTH: 0.288338
G1 X102.887 Y144.923 E.00475
; LINE_WIDTH: 0.26218
G1 X102.729 Y144.746 E.00424
; LINE_WIDTH: 0.225308
G1 X102.576 Y144.559 E.00359
; LINE_WIDTH: 0.177718
G1 X102.423 Y144.372 E.00265
; LINE_WIDTH: 0.137481
G1 X102.346 Y144.27 E.00098
; LINE_WIDTH: 0.104611
G1 X102.27 Y144.168 E.00064
; WIPE_START
G1 X102.346 Y144.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.979 Y144.234 Z3.4 F30000
G1 X139.527 Y144.095 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0943603
G1 F15000
G2 X139.353 Y144.002 I-.602 J.91 E.00083
; WIPE_START
G1 X139.527 Y144.095 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.891 Y146.102 Z3.4 F30000
G1 X149.825 Y146.902 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0995653
G1 F15000
G1 X149.663 Y146.984 E.00084
; WIPE_START
G1 X149.825 Y146.902 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.373 Y139.987 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157378
G1 F15000
G1 X152.246 Y139.805 E.00208
; LINE_WIDTH: 0.139423
G1 X152.173 Y139.705 E.00097
; LINE_WIDTH: 0.105248
G1 X152.1 Y139.605 E.00063
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X152.173 Y139.705 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
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
M73 P98 R0
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

