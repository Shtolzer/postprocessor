{# ============================================================================
# ОБЪЕДИНЕННЫЙ ПОСТПРОЦЕССОР (АВТОМАТИЧЕСКОЕ СЛИЯНИЕ)
# Создано: 2025-08-05 15:26:04
# ============================================================================

# ИНИЦИАЛИЗАЦИЯ ГЛОБАЛЬНЫХ ПЕРЕМЕННЫХ
global CURRENT_HEAD DEG2RAD Feed_INV Feed_IPM Feed_IPR Feed_MMPM Feed_MMPR PI RAD2DEG cam_post_dir clamp_rotary_fifth_status clamp_rotary_fourth_status com_feed_rate combine_mode count_paths_used csys_mode current_head_name cycle_R_pos cycle_hole_counter cycle_init_flag cycle_name delay_time env feed feed_mode feed_rate_mode first_linear_move first_tool_change gPB group_level initial_cycle_pos is_from last_oper_machine_mode lower_tcode mom_RTCP mom_alt_pos mom_alt_prev_pos mom_arc_angle mom_arc_direction mom_arc_radius mom_attr_OPER_TRANSFER mom_attr_PROGRAMVIEW_PROGRAM_1 mom_attr_PROGRAMVIEW_PROGRAM_2 mom_clamp_status mom_coolant_status mom_coordinate_output_mode mom_csys_matrix mom_current_motion mom_cutcom_adjust_register mom_cutcom_plane mom_cutcom_status mom_cutting_time mom_cycle_clearance_plane_change mom_cycle_clearance_to_pos mom_cycle_feed_rate mom_cycle_feed_rate_mode mom_cycle_feed_rate_per_rev mom_cycle_feed_to mom_cycle_feed_to_pos mom_cycle_option mom_cycle_rapid_to mom_cycle_rapid_to_pos mom_cycle_retract_to mom_cycle_retract_to_pos mom_cycle_spindle_axis mom_cycle_status mom_cycle_tool_axis_change mom_date mom_delay_mode mom_delay_revs mom_delay_value mom_event_error mom_event_handler_file_name mom_event_number mom_feed_approach_value mom_feed_cut_value mom_feed_engage_value mom_feed_rate mom_feed_rate_number mom_feed_rate_output_mode mom_feed_rate_per_rev mom_feed_retract_value mom_flush_register mom_from_pos mom_from_ref_pos mom_gohome_pos mom_gohome_ref_pos mom_group_name mom_head_name mom_head_spindle_axis mom_init_pos mom_kin_4th_axis_ang_offset mom_kin_4th_axis_center_offset mom_kin_4th_axis_direction mom_kin_4th_axis_incr_switch mom_kin_4th_axis_leader mom_kin_4th_axis_limit_action mom_kin_4th_axis_max_limit mom_kin_4th_axis_min_limit mom_kin_4th_axis_plane mom_kin_4th_axis_point mom_kin_4th_axis_rotation mom_kin_4th_axis_type mom_kin_4th_axis_vector mom_kin_5th_axis_ang_offset mom_kin_5th_axis_center_offset mom_kin_5th_axis_direction mom_kin_5th_axis_leader mom_kin_5th_axis_max_limit mom_kin_5th_axis_min_limit mom_kin_5th_axis_plane mom_kin_5th_axis_point mom_kin_5th_axis_rotation mom_kin_5th_axis_type mom_kin_5th_axis_vector mom_kin_arc_output_mode mom_kin_arc_valid_plane mom_kin_caxis_rotary_pos mom_kin_coordinate_system_type mom_kin_iks_usage mom_kin_independent_head mom_kin_linearization_flag mom_kin_linearization_tol mom_kin_machine_resolution mom_kin_machine_type mom_kin_max_fpm mom_kin_max_frn mom_kin_output_unit mom_kin_rapid_feed_rate mom_kin_read_ahead_next_motion mom_kin_reengage_distance mom_kin_retract_distance mom_kin_retract_plane mom_kin_retract_type mom_kin_rotary_axis_method mom_kin_rotary_reengage_feedrate mom_kin_spindle_axis mom_last_pos mom_lathe_spindle_axis mom_lathe_thread_advance_type mom_lathe_thread_increment mom_lathe_thread_lead_i mom_lathe_thread_lead_k mom_lathe_thread_type mom_lathe_thread_value mom_length_comp_register mom_lintol mom_lintol_status mom_load_event_handler mom_lock_axis mom_lock_axis_plane mom_lock_axis_value mom_lock_axis_value_defined mom_logname mom_machine_mode mom_machine_time mom_manual_tool_change mom_mcs_goto mom_motion_distance mom_motion_event mom_motion_type mom_move_type mom_move_type_name mom_new_iks_exists mom_next_tool_number mom_o_buffer mom_oper_tool mom_operation_name mom_operation_type mom_origin mom_out_angle_pos mom_output_mode mom_output_unit mom_path_name mom_polar_status mom_pos mom_pos_arc_center mom_pos_arc_plane mom_prev_alt_pos mom_prev_lock_angle mom_prev_machine_mode mom_prev_mcs_goto mom_prev_out_angle_pos mom_prev_pos mom_prev_ref_pos mom_prev_rot_ang_4th mom_prev_rot_ang_5th mom_prev_rotary_dir_4th mom_prev_rotary_dir_5th mom_prev_tool_axis mom_program_aborted mom_programmed_feed_rate mom_ref_pos mom_ref_pos_arc_center mom_rotary_direction_4th mom_rotary_direction_5th mom_rotate_axis_type mom_rotation_angle mom_rotation_direction mom_rotation_mode mom_rotation_reference_mode mom_run_number mom_saved_arc_output_mod mom_sequence_frequency mom_sequence_increment mom_sequence_number mom_spindle_axis mom_spindle_maximum_rpm mom_spindle_mode mom_spindle_speed mom_spindle_status mom_sync_code mom_sync_incr mom_sync_index mom_sync_max mom_sync_start mom_sys_4th_axis_cclw_code mom_sys_4th_axis_clw_code mom_sys_4th_axis_cur_dir mom_sys_4th_axis_dir_mode mom_sys_4th_axis_index mom_sys_5th_axis_cclw_code mom_sys_5th_axis_clw_code mom_sys_5th_axis_cur_dir mom_sys_5th_axis_dir_mode mom_sys_5th_axis_index mom_sys_abort_next_event mom_sys_add_cutting_time mom_sys_add_non_cutting_time mom_sys_alt_unit_post_name mom_sys_auto_clamp mom_sys_cartesian_arc_output_mode mom_sys_change_mach_operation_name mom_sys_coordinate_calculation_method mom_sys_coordinate_output_mode mom_sys_current_head mom_sys_cycle_after_initial mom_sys_cycle_bore_back_code mom_sys_cycle_bore_code mom_sys_cycle_bore_drag_code mom_sys_cycle_bore_dwell_code mom_sys_cycle_bore_manual_code mom_sys_cycle_bore_manual_dwell_code mom_sys_cycle_bore_no_drag_code mom_sys_cycle_drill_break_chip_code mom_sys_cycle_drill_code mom_sys_cycle_drill_deep_code mom_sys_cycle_drill_dwell_code mom_sys_cycle_feed_mode mom_sys_cycle_tap_code mom_sys_delay_param mom_sys_enable_ball_center_output mom_sys_feed_param mom_sys_first_linear_move mom_sys_first_tool_handled mom_sys_frn_factor mom_sys_group_output mom_sys_head_change_init_program mom_sys_home_pos mom_sys_in_operation mom_sys_init_mill_start mom_sys_init_turn_start mom_sys_lathe_i_double mom_sys_lathe_i_factor mom_sys_lathe_j_double mom_sys_lathe_j_factor mom_sys_lathe_k_factor mom_sys_lathe_postname mom_sys_lathe_x_double mom_sys_lathe_x_factor mom_sys_lathe_y_double mom_sys_lathe_y_factor mom_sys_lathe_z_factor mom_sys_leader mom_sys_linear_axis_index_1 mom_sys_linear_axis_index_2 mom_sys_list_output mom_sys_lock_arc_save mom_sys_lock_axis mom_sys_lock_plane mom_sys_lock_status mom_sys_lock_value mom_sys_machine_time mom_sys_mill_postname mom_sys_mill_turn_mode mom_sys_mill_turn_type mom_sys_millturn_yaxis mom_sys_output_mode mom_sys_polar_arc_output_mode mom_sys_polar_off_code mom_sys_polar_on_code mom_sys_post_initialized mom_sys_processor_archit mom_sys_ptp_output mom_sys_radius_output_mode mom_sys_retract_feed_mode mom_sys_rotary_axis_index mom_sys_rotary_error mom_sys_skip_move mom_sys_spindle_axis mom_sys_thread_mode mom_sys_tool_change_pos mom_sys_tool_number_max mom_sys_tool_number_min mom_sys_unlock_plane mom_sys_unlocked_axis mom_sys_work_plane_change mom_tool_adjust_register mom_tool_axis mom_tool_change_status mom_tool_change_type mom_tool_corner1_radius mom_tool_diameter mom_tool_head mom_tool_length_adjust_register mom_tool_name mom_tool_number mom_tool_offset mom_tool_preselect_number mom_tool_x_offset mom_tool_y_offset mom_tool_z_offset mom_translate mom_use_b_axis mom_user_prev_cutcom_status mom_user_spindle_first mom_user_work_plane_change mom_warning_info mom_wire_cutcom_adjust_register mom_wire_cutcom_status need_tool_change new_mom_head_name_ucased part_transfer_start pb_start_of_program_flag prev_head_name program_header_output ptp_file_name rapid_spindle_inhibit rapid_traverse_inhibit reset_process_trigger saved_lock_yaxis_setting saved_seq_num set skip_tool_name_output_transfer_mode skip_tool_number_output_transfer_mode spindle_first spindle_is_out super_feed_mode tape_bytes tcl_platform thread_increment thread_type transfer_gohome_used traverse_axis1 traverse_axis2 turret_current unlocked_pos unlocked_prev_pos work_plane

# ======================================================================
# НЕКОНФЛИКТНЫЕ ПРОЦЕДУРЫ
# ======================================================================
# Процедура из MILL.tcl
proc PB_init_new_iks { }

# Процедура из MILL.tcl
proc PB_machine_mode { }

# Процедура из MILL.tcl
proc MOM_bore_back { }

# Процедура из MILL.tcl
proc MOM_bore_back_move { }

# Процедура из MILL.tcl
proc MOM_bore_drag { }

# Процедура из MILL.tcl
proc MOM_bore_drag_move { }

# Процедура из MILL.tcl
proc MOM_bore_dwell { }

# Процедура из MILL.tcl
proc MOM_bore_dwell_move { }

# Процедура из MILL.tcl
proc MOM_bore_manual { }

# Процедура из MILL.tcl
proc MOM_bore_manual_move { }

# Процедура из MILL.tcl
proc MOM_bore_manual_dwell { }

# Процедура из MILL.tcl
proc MOM_bore_manual_dwell_move { }

# Процедура из MILL.tcl
proc MOM_bore_no_drag { }

# Процедура из MILL.tcl
proc MOM_bore_no_drag_move { }

# Процедура из MILL.tcl
proc MOM_drill_text { }

# Процедура из MILL.tcl
proc MOM_drill_text_move { }

# Процедура из MILL.tcl
proc PB_user_defined_axis_limit_action { }

# Процедура из MILL.tcl
proc PB_user_def_axis_limit_action { args }

# Процедура из MILL.tcl
proc USER_DEF_AXIS_LIMIT_ACTION { args }

# Процедура из MILL.tcl
proc PB_CMD_FEEDRATE_NUMBER { }

# Процедура из MILL.tcl
proc PB_CMD__catch_warning { }

# Процедура из MILL.tcl
proc PB_CMD__choose_preferred_solution { }

# Процедура из MILL.tcl
proc PB_CMD__convert_point { }

# Процедура из MILL.tcl
proc PB_CMD_circular_plane_ijk_outputs { }

# Процедура из MILL.tcl
proc PB_CMD_clamp_fifth_axis { }

# Процедура из MILL.tcl
proc PB_CMD_clamp_fourth_axis { }

# Процедура из MILL.tcl
proc PB_CMD_combine_rotary_output { }

# Процедура из MILL.tcl
proc PB_CMD_cycle_hole_counter_reset { }

# Процедура из MILL.tcl
proc PB_CMD_cycle_plane_xzc_lower_turret { }

# Процедура из MILL.tcl
proc PB_CMD_disable_linearization { }

# Процедура из MILL.tcl
proc PB_CMD_enable_ball_center_output { }

# Процедура из MILL.tcl
proc PB_CMD_center_of_ball_output { }

# Процедура из MILL.tcl
proc MOM_ball_center_output { }

# Процедура из MILL.tcl
proc PB_CMD_fifth_axis_rotate_move { }

# Процедура из MILL.tcl
proc PB_CMD_fix_RAPID_SET { }

# Процедура из MILL.tcl
proc RAPID_SET { }

# Процедура из MILL.tcl
proc PB_CMD_fourth_axis_rotate_move { }

# Процедура из MILL.tcl
proc PB_CMD_home_initial_moves { }

# Процедура из MILL.tcl
proc PB_CMD_init_cartesian_mode { }

# Процедура из MILL.tcl
proc PB_CMD_init_polar_mode { }

# Процедура из MILL.tcl
proc PB_CMD_init_rotary { }

# Процедура из MILL.tcl
proc PB_CMD_kin__MOM_lintol { }

# Процедура из MILL.tcl
proc PB_CMD_kin__MOM_rotate { }

# Процедура из MILL.tcl
proc PB_CMD_kin_before_motion { }

# Процедура из MILL.tcl
proc PB_CMD_kin_init_mill_turn { }

# Процедура из MILL.tcl
proc PB_CMD_kin_init_mill_xzc { }

# Процедура из MILL.tcl
proc MOM_rotate { }

# Процедура из MILL.tcl
proc PB_catch_warning { }

# Процедура из MILL.tcl
proc MOM_lintol { }

# Процедура из MILL.tcl
proc MOM_set_polar { }

# Процедура из MILL.tcl
proc MODES_SET { }

# Процедура из MILL.tcl
proc PB_CMD_kin_linearize_motion { }

# Процедура из MILL.tcl
proc PB_CMD_kin_mill_turn_initialize { }

# Процедура из MILL.tcl
proc PB_CMD_kin_mill_xzc_init { }

# Процедура из MILL.tcl
proc PB_CMD_linear_move { }

# Процедура из MILL.tcl
proc PB_CMD_mill_start { }

# Процедура из MILL.tcl
proc PB_CMD_negate_R_value { }

# Процедура из MILL.tcl
proc PB_CMD_reload_iks_parameters { }

# Процедура из MILL.tcl
proc PB_CMD_reposition_move { }

# Процедура из MILL.tcl
proc PB_CMD_reset_xzc_fourth_caxis_to_zero { }

# Процедура из MILL.tcl
proc PB_CMD_restore_work_plane_change { }

# Процедура из MILL.tcl
proc PB_CMD_retract_move { }

# Процедура из MILL.tcl
proc PB_CMD_reverse_rotation_vector { }

# Процедура из MILL.tcl
proc PB_CMD_revise_new_iks { }

# Процедура из MILL.tcl
proc PB_CMD_rigid_tap_option_detect { }

# Процедура из MILL.tcl
proc PB_CMD_set_cycle_plane { }

# Процедура из MILL.tcl
proc PB_CMD_set_intial_cycle_pos { }

# Процедура из MILL.tcl
proc PB_CMD_set_polar_mode { }

# Процедура из MILL.tcl
proc PB_CMD_set_principal_axis { }

# Процедура из MILL.tcl
proc PB_CMD_spindle_axis_test_main { }

# Процедура из MILL.tcl
proc PB_CMD_start_of_operation_force_addresses { }

# Процедура из MILL.tcl
proc PB_CMD_suppress_G_plane_output_G112_polar { }

# Процедура из MILL.tcl
proc PB_CMD_suppress_linear_block_plane_code { }

# Процедура из MILL.tcl
proc PB_CMD_tool_change_force_addresses { }

# Процедура из MILL.tcl
proc PB_CMD_umclamp_C_axis { }

# Процедура из MILL.tcl
proc PB_CMD_unclamp_fifth_axis { }

# Процедура из MILL.tcl
proc PB_CMD_unclamp_fourth_axis { }

# Процедура из MILL.tcl
proc PB_CMD_update_mill_xzc { }

# Процедура из MILL.tcl
proc LINEARIZE_MOTION { }

# Процедура из MILL.tcl
proc PB_CMD_set_G112_mode { }

# Процедура из MILL.tcl
proc PB_CMD_set_G113_mode { }

# Процедура из MILL.tcl
proc PB_CMD_work_plane_output { }

# Процедура из MILL.tcl
proc ANGLE_CHECK { a axis }

# Процедура из MILL.tcl
proc AUTO_CLAMP { }

# Процедура из MILL.tcl
proc AUTO_CLAMP_1 { out }

# Процедура из MILL.tcl
proc AUTO_CLAMP_2 { out }

# Процедура из MILL.tcl
proc AXIS_SET { axis }

# Процедура из MILL.tcl
proc CALC_CYLINDRICAL_RETRACT_POINT { refpt axis dist ret_pt }

# Процедура из MILL.tcl
proc CALC_SPHERICAL_RETRACT_POINT { refpt axis cen_sphere rad_sphere int_pts }

# Процедура из MILL.tcl
proc CONVERT_BACK { input_point tool_axis converted_point }

# Процедура из MILL.tcl
proc CONVERT_POINT { input_point tool_axis prev_pos conversion_method converted_point }

# Процедура из MILL.tcl
proc DELAY_TIME_SET { }

# Процедура из MILL.tcl
proc GET_SPINDLE_AXIS { input_tool_axis }

# Процедура из MILL.tcl
proc LINEARIZE_LOCK_MOTION { }

# Процедура из MILL.tcl
proc LINEARIZE_LOCK_OUTPUT { }

# Процедура из MILL.tcl
proc LINEARIZE_OUTPUT { }

# Процедура из MILL.tcl
proc LOCK_AXIS { input_point output_point output_rotary }

# Процедура из MILL.tcl
proc LOCK_AXIS_INITIALIZE { }

# Процедура из MILL.tcl
proc LOCK_AXIS_MOTION { }

# Процедура из MILL.tcl
proc LOCK_AXIS_SUB { axis }

# Процедура из MILL.tcl
proc MILL_TURN { }

# Процедура из MILL.tcl
proc REPOSITION_ERROR_CHECK { warn }

# Процедура из MILL.tcl
proc RETRACT_POINT_CHECK { refpt axis retpt }

# Процедура из MILL.tcl
proc ROTARY_AXIS_RETRACT { }

# Процедура из MILL.tcl
proc ROTATE_VECTOR { plane angle input_vector output_vector }

# Процедура из MILL.tcl
proc ROTSET { angle prev_angle dir kin_leader sys_leader min max {tol_flag 0} }

# Процедура из MILL.tcl
proc SET_FEEDRATE_NUMBER { dist feed }

# Процедура из MILL.tcl
proc SET_LOCK { axis plane value }

# Процедура из MILL.tcl
proc SOLVE_QUADRATIC { coeff rcomp icomp status degree }

# Процедура из MILL.tcl
proc UNLOCK_AXIS { locked_point unlocked_point }

# Процедура из LATHE.tcl
proc PB_TURRET_HEAD_SET { }

# Процедура из LATHE.tcl
proc PB_LATHE_THREAD_SET { }

# Процедура из LATHE.tcl
proc MOM_lathe_thread { }

# Процедура из LATHE.tcl
proc MOM_lathe_thread_move { }

# Процедура из LATHE.tcl
proc MOM_spindle_css { }

# Процедура из LATHE.tcl
proc PB_CMD_G0_Y0_lathe { }

# Процедура из LATHE.tcl
proc PB_CMD_UDE_UPLEVEL_POLAR_xzc { }

# Процедура из LATHE.tcl
proc MOM_set_polar_xzc { }

# Процедура из LATHE.tcl
proc PB_CMD_alignment_block { }

# Процедура из LATHE.tcl
proc PB_CMD_alignment_block_1 { }

# Процедура из LATHE.tcl
proc PB_CMD_alignment_block_2 { }

# Процедура из LATHE.tcl
proc PB_CMD_combine_rotary_init { }

# Процедура из LATHE.tcl
proc PB_CMD_config_cycle_start { }

# Процедура из LATHE.tcl
proc PB_CMD_date_time_stamp { }

# Процедура из LATHE.tcl
proc PB_CMD_head_name_end_operation { }

# Процедура из LATHE.tcl
proc PB_CMD_init_set_polar { }

# Процедура из LATHE.tcl
proc CONVERT_POINT_POLAR { input_point tool_axis prev_pos conversion_method converted_point }

# Процедура из LATHE.tcl
proc PB_CMD_init_thread { }

# Процедура из LATHE.tcl
proc MOM_start_of_thread {}

# Процедура из LATHE.tcl
proc MOM_end_of_thread {}

# Процедура из LATHE.tcl
proc PB_CMD_machine_mode_switching_reload { }

# Процедура из LATHE.tcl
proc PB_CMD_output_spindle { }

# Процедура из LATHE.tcl
proc PB_CMD_part_transfer_gohome_detector { }

# Процедура из LATHE.tcl
proc PB_CMD_part_transfer_unset_variables { }

# Процедура из LATHE.tcl
proc PB_CMD_program_header { }

# Процедура из LATHE.tcl
proc PB_CMD_reset_lathe_post { }

# Процедура из LATHE.tcl
proc PB_CMD_set_lathe_arc_plane { }

# Процедура из LATHE.tcl
proc PB_CMD_spindle_sfm_prestart { }

# Процедура из LATHE.tcl
proc PB_CMD_spindle_turning { }

# Процедура из LATHE.tcl
proc PB_CMD_start_of_program_initial_codes { }

# Процедура из LATHE.tcl
proc PB_CMD_thread_check { }

# Процедура из LATHE.tcl
proc PB_CMD_thread_output { }

# Процедура из LATHE.tcl
proc PB_CMD_thread_set_up { }

# Процедура из LATHE.tcl
proc PB_CMD_tool_change { }

# Процедура из LATHE.tcl
proc PB_CMD_turn_start { }

# Процедура из LATHE.tcl
proc PB_CMD_unclamp_C_axis { }

# Процедура из LATHE.tcl
proc PB_CMD_xzc_spindle_axis { }

# Процедура из LATHE.tcl
proc MOM_head_change { }

# Процедура из LATHE.tcl
proc MOM_first_head { }

# ======================================================================
# РАЗРЕШЕНИЕ КОНФЛИКТОВ ПРОЦЕДУР
# ======================================================================
# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD___log_revisions
proc PB_CMD___log_revisions { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD___log_revisions_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD___log_revisions_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD___log_revisions_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD___log_revisions_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_before_each_add_var
proc MOM_before_each_add_var { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_before_each_add_var_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_before_each_add_var_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_before_each_add_var_mill {}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_before_each_add_var_turn {}

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_before_each_event
proc MOM_before_each_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_before_each_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_before_each_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_before_each_event_mill   {}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_before_each_event_turn   {}

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_before_load_address
proc MOM_before_load_address { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_before_load_address_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_before_load_address_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_before_load_address_mill {}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_before_load_address_turn {}

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_end_debug
proc MOM_end_debug { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_end_debug_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_end_debug_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_end_debug_mill {}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_end_debug_turn {}

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM__util_print
proc MOM__util_print { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM__util_print_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM__util_print_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM__util_print_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM__util_print_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_before_output
proc MOM_before_output { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_before_output_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_before_output_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_before_output_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_before_output_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_do_template
proc MOM_do_template { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_do_template_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_do_template_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_do_template_mill { block args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_do_template_turn { block args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_start_of_program
proc MOM_start_of_program { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_start_of_program_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_start_of_program_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_start_of_program_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_start_of_program_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_sync
proc MOM_sync { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_sync_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_sync_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_sync_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_sync_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_set_csys
proc MOM_set_csys { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_set_csys_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_set_csys_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_set_csys_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_set_csys_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_msys
proc MOM_msys { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_msys_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_msys_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_msys_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_msys_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_end_of_program
proc MOM_end_of_program { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_end_of_program_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_end_of_program_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_end_of_program_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_end_of_program_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_DELAY_TIME_SET
proc PB_DELAY_TIME_SET { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_DELAY_TIME_SET_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_DELAY_TIME_SET_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_DELAY_TIME_SET_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_DELAY_TIME_SET_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_before_motion
proc MOM_before_motion { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_before_motion_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_before_motion_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_before_motion_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_before_motion_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_start_of_group
proc MOM_start_of_group { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_start_of_group_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_start_of_group_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_start_of_group_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_start_of_group_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_machine_mode
proc MOM_machine_mode { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_machine_mode_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_machine_mode_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_machine_mode_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_machine_mode_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_FORCE
proc PB_FORCE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_FORCE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_FORCE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_FORCE_mill { option args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_FORCE_turn { option args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_SET_RAPID_MOD
proc PB_SET_RAPID_MOD { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_SET_RAPID_MOD_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_SET_RAPID_MOD_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_SET_RAPID_MOD_mill { mod_list blk_list ADDR NEW_MOD_LIST }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_SET_RAPID_MOD_turn { mod_list blk_list ADDR NEW_MOD_LIST }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: ugpost_FEEDRATE_SET
proc ugpost_FEEDRATE_SET { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::ugpost_FEEDRATE_SET_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::ugpost_FEEDRATE_SET_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc ugpost_FEEDRATE_SET_mill {}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc ugpost_FEEDRATE_SET_turn {}

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: FEEDRATE_SET
proc FEEDRATE_SET { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::FEEDRATE_SET_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::FEEDRATE_SET_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc FEEDRATE_SET_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc FEEDRATE_SET_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_auxfun
proc MOM_auxfun { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_auxfun_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_auxfun_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_auxfun_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_auxfun_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_bore
proc MOM_bore { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_bore_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_bore_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_bore_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_bore_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_bore_move
proc MOM_bore_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_bore_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_bore_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_bore_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_bore_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_circular_move
proc MOM_circular_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_circular_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_circular_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_circular_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_circular_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_coolant_off
proc MOM_coolant_off { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_coolant_off_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_coolant_off_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_coolant_off_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_coolant_off_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_coolant_on
proc MOM_coolant_on { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_coolant_on_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_coolant_on_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_coolant_on_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_coolant_on_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_cutcom_off
proc MOM_cutcom_off { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_cutcom_off_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_cutcom_off_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_cutcom_off_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_cutcom_off_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_cutcom_on
proc MOM_cutcom_on { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_cutcom_on_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_cutcom_on_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_cutcom_on_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_cutcom_on_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_cycle_off
proc MOM_cycle_off { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_cycle_off_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_cycle_off_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_cycle_off_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_cycle_off_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_cycle_plane_change
proc MOM_cycle_plane_change { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_cycle_plane_change_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_cycle_plane_change_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_cycle_plane_change_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_cycle_plane_change_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_delay
proc MOM_delay { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_delay_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_delay_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_delay_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_delay_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill
proc MOM_drill { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_move
proc MOM_drill_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_break_chip
proc MOM_drill_break_chip { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_break_chip_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_break_chip_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_break_chip_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_break_chip_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_break_chip_move
proc MOM_drill_break_chip_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_break_chip_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_break_chip_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_break_chip_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_break_chip_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_deep
proc MOM_drill_deep { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_deep_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_deep_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_deep_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_deep_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_deep_move
proc MOM_drill_deep_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_deep_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_deep_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_deep_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_deep_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_dwell
proc MOM_drill_dwell { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_dwell_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_dwell_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_dwell_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_dwell_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_drill_dwell_move
proc MOM_drill_dwell_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_drill_dwell_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_drill_dwell_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_drill_dwell_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_drill_dwell_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_end_of_path
proc MOM_end_of_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_end_of_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_end_of_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_end_of_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_end_of_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_end_of_subop_path
proc MOM_end_of_subop_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_end_of_subop_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_end_of_subop_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_end_of_subop_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_end_of_subop_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_first_move
proc MOM_first_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_first_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_first_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_first_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_first_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_first_tool
proc MOM_first_tool { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_first_tool_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_first_tool_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_first_tool_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_first_tool_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_from_move
proc MOM_from_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_from_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_from_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_from_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_from_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_gohome_move
proc MOM_gohome_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_gohome_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_gohome_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_gohome_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_gohome_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_initial_move
proc MOM_initial_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_initial_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_initial_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_initial_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_initial_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_length_compensation
proc MOM_length_compensation { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_length_compensation_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_length_compensation_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_length_compensation_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_length_compensation_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_linear_move
proc MOM_linear_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_linear_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_linear_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_linear_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_linear_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_load_tool
proc MOM_load_tool { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_load_tool_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_load_tool_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_load_tool_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_load_tool_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_opstop
proc MOM_opstop { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_opstop_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_opstop_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_opstop_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_opstop_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_prefun
proc MOM_prefun { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_prefun_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_prefun_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_prefun_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_prefun_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_rapid_move
proc MOM_rapid_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_rapid_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_rapid_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_rapid_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_rapid_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_sequence_number
proc MOM_sequence_number { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_sequence_number_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_sequence_number_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_sequence_number_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_sequence_number_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_set_modes
proc MOM_set_modes { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_set_modes_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_set_modes_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_set_modes_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_set_modes_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_spindle_off
proc MOM_spindle_off { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_spindle_off_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_spindle_off_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_spindle_off_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_spindle_off_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_spindle_rpm
proc MOM_spindle_rpm { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_spindle_rpm_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_spindle_rpm_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_spindle_rpm_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_spindle_rpm_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_start_of_path
proc MOM_start_of_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_start_of_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_start_of_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_start_of_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_start_of_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_start_of_subop_path
proc MOM_start_of_subop_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_start_of_subop_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_start_of_subop_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_start_of_subop_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_start_of_subop_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_stop
proc MOM_stop { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_stop_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_stop_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_stop_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_stop_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_tap
proc MOM_tap { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_tap_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_tap_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_tap_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_tap_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_tap_move
proc MOM_tap_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_tap_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_tap_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_tap_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_tap_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_tool_change
proc MOM_tool_change { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_tool_change_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_tool_change_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_tool_change_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_tool_change_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MOM_tool_preselect
proc MOM_tool_preselect { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MOM_tool_preselect_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MOM_tool_preselect_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MOM_tool_preselect_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MOM_tool_preselect_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_approach_move
proc PB_approach_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_approach_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_approach_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_approach_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_approach_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_auto_tool_change
proc PB_auto_tool_change { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_auto_tool_change_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_auto_tool_change_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_auto_tool_change_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_auto_tool_change_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_engage_move
proc PB_engage_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_engage_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_engage_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_engage_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_engage_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_first_cut
proc PB_first_cut { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_first_cut_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_first_cut_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_first_cut_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_first_cut_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_first_linear_move
proc PB_first_linear_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_first_linear_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_first_linear_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_first_linear_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_first_linear_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_manual_tool_change
proc PB_manual_tool_change { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_manual_tool_change_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_manual_tool_change_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_manual_tool_change_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_manual_tool_change_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_retract_move
proc PB_retract_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_retract_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_retract_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_retract_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_retract_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_return_move
proc PB_return_move { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_return_move_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_return_move_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_return_move_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_return_move_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_start_of_program
proc PB_start_of_program { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_start_of_program_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_start_of_program_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_start_of_program_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_start_of_program_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__config_post_options
proc PB_CMD__config_post_options { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__config_post_options_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__config_post_options_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__config_post_options_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__config_post_options_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__handle_end_of_subop_path
proc PB_CMD__handle_end_of_subop_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__handle_end_of_subop_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__handle_end_of_subop_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__handle_end_of_subop_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__handle_end_of_subop_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__handle_start_of_subop_path
proc PB_CMD__handle_start_of_subop_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__handle_start_of_subop_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__handle_start_of_subop_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__handle_start_of_subop_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__handle_start_of_subop_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__interop_init_vars
proc PB_CMD__interop_init_vars { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__interop_init_vars_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__interop_init_vars_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__interop_init_vars_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__interop_init_vars_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__interop_is_transition_path
proc PB_CMD__interop_is_transition_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__interop_is_transition_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__interop_is_transition_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__interop_is_transition_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__interop_is_transition_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__manage_part_attributes
proc PB_CMD__manage_part_attributes { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__manage_part_attributes_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__manage_part_attributes_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__manage_part_attributes_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__manage_part_attributes_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD__suppress_probe_bore_clearance_retract
proc PB_CMD__suppress_probe_bore_clearance_retract { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD__suppress_probe_bore_clearance_retract_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD__suppress_probe_bore_clearance_retract_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD__suppress_probe_bore_clearance_retract_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD__suppress_probe_bore_clearance_retract_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_abort_event
proc PB_CMD_abort_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_abort_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_abort_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_abort_event_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_abort_event_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_ask_machine_type
proc PB_CMD_ask_machine_type { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_ask_machine_type_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_ask_machine_type_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_ask_machine_type_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_ask_machine_type_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_before_motion
proc PB_CMD_before_motion { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_before_motion_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_before_motion_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_before_motion_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_before_motion_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_cancel_suppress_force_once_per_event
proc PB_CMD_cancel_suppress_force_once_per_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_cancel_suppress_force_once_per_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_cancel_suppress_force_once_per_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_cancel_suppress_force_once_per_event_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_cancel_suppress_force_once_per_event_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_end_of_alignment_character
proc PB_CMD_end_of_alignment_character { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_end_of_alignment_character_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_end_of_alignment_character_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_end_of_alignment_character_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_end_of_alignment_character_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_end_of_operation
proc PB_CMD_end_of_operation { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_end_of_operation_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_end_of_operation_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_end_of_operation_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_end_of_operation_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_handle_sync_event
proc PB_CMD_handle_sync_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_handle_sync_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_handle_sync_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_handle_sync_event_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_handle_sync_event_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_head_post_detect_start_operation
proc PB_CMD_head_post_detect_start_operation { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_head_post_detect_start_operation_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_head_post_detect_start_operation_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_head_post_detect_start_operation_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_head_post_detect_start_operation_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_abort_event
proc PB_CMD_kin_abort_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_abort_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_abort_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_abort_event_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_abort_event_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_before_output
proc PB_CMD_kin_before_output { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_before_output_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_before_output_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_before_output_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_before_output_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_end_of_path
proc PB_CMD_kin_end_of_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_end_of_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_end_of_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_end_of_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_end_of_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_feedrate_set
proc PB_CMD_kin_feedrate_set { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_feedrate_set_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_feedrate_set_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_feedrate_set_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_feedrate_set_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_handle_sync_event
proc PB_CMD_kin_handle_sync_event { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_handle_sync_event_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_handle_sync_event_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_handle_sync_event_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_handle_sync_event_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_init_new_iks
proc PB_CMD_kin_init_new_iks { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_init_new_iks_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_init_new_iks_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_init_new_iks_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_init_new_iks_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_init_probing_cycles
proc PB_CMD_kin_init_probing_cycles { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_init_probing_cycles_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_init_probing_cycles_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_init_probing_cycles_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_init_probing_cycles_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_set_csys
proc PB_CMD_kin_set_csys { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_set_csys_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_set_csys_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_set_csys_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_set_csys_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_start_of_path
proc PB_CMD_kin_start_of_path { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_start_of_path_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_start_of_path_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_start_of_path_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_start_of_path_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_kin_start_of_program
proc PB_CMD_kin_start_of_program { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_kin_start_of_program_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_kin_start_of_program_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_kin_start_of_program_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_kin_start_of_program_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_lower_turret_tcode
proc PB_CMD_lower_turret_tcode { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_lower_turret_tcode_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_lower_turret_tcode_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc is used for:
#
#     simulated cycles feed moves
#     mill/turn mill linearization
#     four and five axis retract and re-engage
#

   MOM_do_template linear_move
}


#=============================================================
proc PB_CMD_lower_turret_tcode_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_lower_turret_tcode_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_output_path_name
proc PB_CMD_output_path_name { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_output_path_name_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_output_path_name_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_output_path_name_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_output_path_name_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_pause
proc PB_CMD_pause { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_pause_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_pause_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_pause_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_pause_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_reset_all_motion_variables_to_zero
proc PB_CMD_reset_all_motion_variables_to_zero { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_reset_all_motion_variables_to_zero_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_reset_all_motion_variables_to_zero_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_reset_all_motion_variables_to_zero_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_reset_all_motion_variables_to_zero_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_run_postprocess
proc PB_CMD_run_postprocess { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_run_postprocess_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_run_postprocess_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_run_postprocess_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_run_postprocess_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_set_csys
proc PB_CMD_set_csys { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_set_csys_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_set_csys_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_set_csys_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_set_csys_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_start_of_alignment_character
proc PB_CMD_start_of_alignment_character { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_start_of_alignment_character_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_start_of_alignment_character_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_start_of_alignment_character_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_start_of_alignment_character_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_CMD_tool_name
proc PB_CMD_tool_name { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_CMD_tool_name_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_CMD_tool_name_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_CMD_tool_name_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_CMD_tool_name_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: ABORT_EVENT_CHECK
proc ABORT_EVENT_CHECK { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::ABORT_EVENT_CHECK_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::ABORT_EVENT_CHECK_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc ABORT_EVENT_CHECK_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc ABORT_EVENT_CHECK_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: ARCTAN
proc ARCTAN { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::ARCTAN_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::ARCTAN_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc ARCTAN_mill { y x }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc ARCTAN_turn { y x }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: ARR_sort_array_to_list
proc ARR_sort_array_to_list { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::ARR_sort_array_to_list_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::ARR_sort_array_to_list_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc ARR_sort_array_to_list_mill { ARR {by_value 0} {by_decr 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc ARR_sort_array_to_list_turn { ARR {by_value 0} {by_decr 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: CALLED_BY
proc CALLED_BY { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::CALLED_BY_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::CALLED_BY_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc CALLED_BY_mill { caller {out_warn 0} args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc CALLED_BY_turn { caller {out_warn 0} args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: CATCH_WARNING
proc CATCH_WARNING { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::CATCH_WARNING_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::CATCH_WARNING_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc CATCH_WARNING_mill { msg {output 1} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc CATCH_WARNING_turn { msg {output 1} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: CMD_EXIST
proc CMD_EXIST { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::CMD_EXIST_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::CMD_EXIST_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc CMD_EXIST_mill { cmd {out_warn 0} args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc CMD_EXIST_turn { cmd {out_warn 0} args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: COMPARE_NX_VERSION
proc COMPARE_NX_VERSION { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::COMPARE_NX_VERSION_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::COMPARE_NX_VERSION_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc COMPARE_NX_VERSION_mill { this_ver target_ver }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc COMPARE_NX_VERSION_turn { this_ver target_ver }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: DO_BLOCK
proc DO_BLOCK { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::DO_BLOCK_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::DO_BLOCK_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc DO_BLOCK_mill { block args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc DO_BLOCK_turn { block args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: EXEC
proc EXEC { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::EXEC_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::EXEC_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc EXEC_mill { command_string {__wait 1} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc EXEC_turn { command_string {__wait 1} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: GET_SUBOP_MOVE_NAME
proc GET_SUBOP_MOVE_NAME { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::GET_SUBOP_MOVE_NAME_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::GET_SUBOP_MOVE_NAME_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc GET_SUBOP_MOVE_NAME_mill { move_type }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc GET_SUBOP_MOVE_NAME_turn { move_type }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: HANDLE_FIRST_LINEAR_MOVE
proc HANDLE_FIRST_LINEAR_MOVE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::HANDLE_FIRST_LINEAR_MOVE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::HANDLE_FIRST_LINEAR_MOVE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc HANDLE_FIRST_LINEAR_MOVE_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc HANDLE_FIRST_LINEAR_MOVE_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: INFO
proc INFO { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::INFO_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::INFO_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc INFO_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc INFO_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: INIT_VAR
proc INIT_VAR { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::INIT_VAR_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::INIT_VAR_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc INIT_VAR_mill { VAR {_val 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc INIT_VAR_turn { VAR {_val 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: LIMIT_ANGLE
proc LIMIT_ANGLE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::LIMIT_ANGLE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::LIMIT_ANGLE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc LIMIT_ANGLE_mill { a }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc LIMIT_ANGLE_turn { a }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: MAXMIN_ANGLE
proc MAXMIN_ANGLE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::MAXMIN_ANGLE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::MAXMIN_ANGLE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc MAXMIN_ANGLE_mill { a max min {tol_flag 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc MAXMIN_ANGLE_turn { a max min {tol_flag 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: OPERATOR_MSG
proc OPERATOR_MSG { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::OPERATOR_MSG_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::OPERATOR_MSG_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc OPERATOR_MSG_mill { msg {seq_no 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc OPERATOR_MSG_turn { msg {seq_no 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: OUTPUT_MACRO
proc OUTPUT_MACRO { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::OUTPUT_MACRO_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::OUTPUT_MACRO_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc OUTPUT_MACRO_mill { macro_string suppress_seqno }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc OUTPUT_MACRO_turn { macro_string suppress_seqno }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PAUSE
proc PAUSE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PAUSE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PAUSE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PAUSE_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PAUSE_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PAUSE_win64
proc PAUSE_win64 { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PAUSE_win64_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PAUSE_win64_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PAUSE_win64_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PAUSE_win64_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PAUSE_x
proc PAUSE_x { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PAUSE_x_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PAUSE_x_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PAUSE_x_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PAUSE_x_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: STR_MATCH
proc STR_MATCH { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::STR_MATCH_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::STR_MATCH_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc STR_MATCH_mill { VAR str {out_warn 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc STR_MATCH_turn { VAR str {out_warn 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: TRACE
proc TRACE { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::TRACE_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::TRACE_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc TRACE_mill { {up_level 0} }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc TRACE_turn { {up_level 0} }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: UNSET_VARS
proc UNSET_VARS { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::UNSET_VARS_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::UNSET_VARS_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc UNSET_VARS_mill { args }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc UNSET_VARS_turn { args }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: VMOV
proc VMOV { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::VMOV_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::VMOV_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc VMOV_mill { n p1 p2 }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc VMOV_turn { n p1 p2 }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: WORKPLANE_SET
proc WORKPLANE_SET { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::WORKPLANE_SET_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::WORKPLANE_SET_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc WORKPLANE_SET_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc WORKPLANE_SET_turn { }

# ⚠️ КОНФЛИКТ ПРОЦЕДУРЫ: PB_load_alternate_unit_settings
proc PB_load_alternate_unit_settings { args } {
  global mom_operation_type
  if {[info exists mom_operation_type]} {
    if {$mom_operation_type == "Turning"} {
      # Токарная версия из LATHE.tcl
      return [::PB_load_alternate_unit_settings_turn] $args
    }
  }
  
  # По умолчанию используем фрезерную версию
  return [::PB_load_alternate_unit_settings_mill] $args
}

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ MILL.tcl
proc PB_load_alternate_unit_settings_mill { }

# ОРИГИНАЛЬНАЯ ПРОЦЕДУРА ИЗ LATHE.tcl
proc PB_load_alternate_unit_settings_turn { }
