view: derived_csat_metrics {
  sql_table_name: stanza.derived_csat_metrics ;;

  dimension: city_name {
    type: string
    link: {label: "Category Wise"
      url: "/explore/cx_3_redshift/derived_csat_metrics?fields=derived_csat_metrics.count_total,derived_csat_metrics.feedback_given,derived_csat_metrics.feedback_postive,derived_csat_metrics.complain_cat&sorts=derived_csat_metrics.count_total+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22derived_csat_metrics.complain_cat%22%2C%22derived_csat_metrics.count_total%22%2C%22derived_csat_metrics.feedback_given%22%2C%22feedback_received%22%2C%22derived_csat_metrics.feedback_postive%22%2C%22positive_feedback_percent%22%5D%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_csat_metrics.count_total%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&dynamic_fields=%5B%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_csat_metrics.feedback_given%7D%2F%24%7Bderived_csat_metrics.count_total%7D%22%2C%22label%22%3A%22%25+Feedback+Received%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22feedback_received%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%28%24%7Bderived_csat_metrics.feedback_postive%7D%2F%24%7Bderived_csat_metrics.feedback_given%7D%29%22%2C%22label%22%3A%22Positive+Feedback+Percent%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22positive_feedback_percent%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded&f[derived_csat_metrics.city_name]={{derived_csat_metrics.city_name._value}}&f[derived_csat_metrics.created_time_date]={{ _filters['derived_csat_metrics.created_time_date'] | url_encode}}"
      }
    sql: ${TABLE}.city_name ;;

  }
  dimension: city_name2 {
    type: string
    link: { label: "MM Wise"
      url: "/explore/cx_3_redshift/derived_csat_metrics?fields=derived_csat_metrics.count_total,derived_csat_metrics.feedback_given,derived_csat_metrics.feedback_postive,derived_csat_metrics.micromarket_name&f[derived_csat_metrics.exclude_3_days]=&f[derived_csat_metrics.created_time_date]=2021-08&sorts=derived_csat_metrics.feedback_postive+desc&limit=1000&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22derived_csat_metrics.city_name%22%2C%22derived_csat_metrics.count_total%22%2C%22contribution%22%2C%22derived_csat_metrics.feedback_given%22%2C%22feedback_received%22%2C%22derived_csat_metrics.feedback_postive%22%2C%22positive_feedback_percent%22%5D%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_csat_metrics.feedback_given%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22positive_feedback_percent%22%3A%7B%7D%2C%22derived_csat_metrics.feedback_postive%22%3A%7B%22bg_color%22%3A%22%23cee0a0%22%7D%7D%2C%22header_background_color%22%3A%22%23c5c6a6%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A0.5%2C%22background_color%22%3A%22%23cee0a0%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22positive_feedback_percent%22%5D%7D%5D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%7D%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22label_color%22%3A%5B%22%230%22%5D%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22font_size_main%22%3A%22%22%2C%22orientation%22%3A%22auto%22%2C%22style_complaint_ranking.rank_and_complaint%22%3A%22%23869958%22%2C%22show_title_complaint_ranking.rank_and_complaint%22%3Afalse%2C%22style_negative_feedback_percent%22%3A%22%23ff5b4f%22%2C%22show_comparison_negative_feedback_percent%22%3Afalse%2C%22style_positive_feedback_percent%22%3A%22%23809456%22%2C%22show_comparison_positive_feedback_percent%22%3Afalse%2C%22comparison_style_positive_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_positive_feedback_percent%22%3Afalse%2C%22comparison_label_placement_positive_feedback_percent%22%3A%22below%22%2C%22comp_value_format_positive_feedback_percent%22%3A%22%22%2C%22comparison_style_negative_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_negative_feedback_percent%22%3Atrue%2C%22comparison_label_placement_negative_feedback_percent%22%3A%22below%22%2C%22comp_value_format_negative_feedback_percent%22%3A%22%22%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3Anull%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22light%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22derived_csat_metrics.exclude_3_days%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_csat_metrics.created_time_date%22%3A%5B%7B%22type%22%3A%22advanced%22%2C%22values%22%3A%5B%7B%22constant%22%3A%222021-08%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%28%24%7Bderived_csat_metrics.feedback_postive%7D%2F%24%7Bderived_csat_metrics.feedback_given%7D%29%22%2C%22label%22%3A%22Positive+Feedback+Percent%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22positive_feedback_percent%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Afalse%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_csat_metrics.feedback_given%7D%2F%24%7Bderived_csat_metrics.count_total%7D%22%2C%22label%22%3A%22Feedback+Received+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22feedback_received%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22label%22%3A%22%25+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22calculation_type%22%3A%22percent_of_column_sum%22%2C%22table_calculation%22%3A%22contribution%22%2C%22args%22%3A%5B%22derived_csat_metrics.count_total%22%5D%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded&f[derived_csat_metrics.city_name2]={{derived_csat_metrics.city_name2._value}} &f[derived_csat_metrics.complain_cat2]={{derived_csat_metrics.complain_cat2._value}}  "
    }
    sql: ${TABLE}.city_name ;;

  }

  dimension: complain_cat {
    type: string
    sql: ${TABLE}.complain_cat ;;
  }


  dimension: complain_cat2 {
    type: string
    link: {
      label: "City Wise"
      url: "/explore/cx_3_redshift/derived_csat_metrics?fields=derived_csat_metrics.count_total,derived_csat_metrics.feedback_given,derived_csat_metrics.feedback_postive,derived_csat_metrics.city_name2&f[derived_csat_metrics.exclude_3_days]=&f[derived_csat_metrics.created_time_date]=2021-08&sorts=derived_csat_metrics.feedback_postive+desc&limit=1000&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22derived_csat_metrics.city_name%22%2C%22derived_csat_metrics.count_total%22%2C%22contribution%22%2C%22derived_csat_metrics.feedback_given%22%2C%22feedback_received%22%2C%22derived_csat_metrics.feedback_postive%22%2C%22positive_feedback_percent%22%5D%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_csat_metrics.feedback_given%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22positive_feedback_percent%22%3A%7B%7D%2C%22derived_csat_metrics.feedback_postive%22%3A%7B%22bg_color%22%3A%22%23cee0a0%22%7D%7D%2C%22header_background_color%22%3A%22%23c5c6a6%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A0.5%2C%22background_color%22%3A%22%23cee0a0%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22positive_feedback_percent%22%5D%7D%5D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%7D%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22label_color%22%3A%5B%22%230%22%5D%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22font_size_main%22%3A%22%22%2C%22orientation%22%3A%22auto%22%2C%22style_complaint_ranking.rank_and_complaint%22%3A%22%23869958%22%2C%22show_title_complaint_ranking.rank_and_complaint%22%3Afalse%2C%22style_negative_feedback_percent%22%3A%22%23ff5b4f%22%2C%22show_comparison_negative_feedback_percent%22%3Afalse%2C%22style_positive_feedback_percent%22%3A%22%23809456%22%2C%22show_comparison_positive_feedback_percent%22%3Afalse%2C%22comparison_style_positive_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_positive_feedback_percent%22%3Afalse%2C%22comparison_label_placement_positive_feedback_percent%22%3A%22below%22%2C%22comp_value_format_positive_feedback_percent%22%3A%22%22%2C%22comparison_style_negative_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_negative_feedback_percent%22%3Atrue%2C%22comparison_label_placement_negative_feedback_percent%22%3A%22below%22%2C%22comp_value_format_negative_feedback_percent%22%3A%22%22%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3Anull%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22light%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22derived_csat_metrics.exclude_3_days%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_csat_metrics.created_time_date%22%3A%5B%7B%22type%22%3A%22advanced%22%2C%22values%22%3A%5B%7B%22constant%22%3A%222021-08%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%28%24%7Bderived_csat_metrics.feedback_postive%7D%2F%24%7Bderived_csat_metrics.feedback_given%7D%29%22%2C%22label%22%3A%22Positive+Feedback+Percent%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22positive_feedback_percent%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Afalse%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_csat_metrics.feedback_given%7D%2F%24%7Bderived_csat_metrics.count_total%7D%22%2C%22label%22%3A%22Feedback+Received+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22feedback_received%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22label%22%3A%22%25+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22calculation_type%22%3A%22percent_of_column_sum%22%2C%22table_calculation%22%3A%22contribution%22%2C%22args%22%3A%5B%22derived_csat_metrics.count_total%22%5D%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded&f[derived_csat_metrics.complain_cat2]={{derived_csat_metrics.complain_cat2._value}}   "
    }
    sql: ${TABLE}.complain_cat ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: created_month {
    type: string
    sql: ${TABLE}.created_month ;;
  }

  dimension_group: created_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_time ;;
  }


  dimension: feedback {
    type: number
    sql: ${TABLE}.feedback ;;
  }

  dimension_group: forfeiture {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.forfeiture_date ;;
  }

  dimension: internal {
    type: yesno
    sql: ${TABLE}.internal ;;
  }

  dimension: merged {
    type: yesno
    sql: ${TABLE}.merged ;;
  }

  dimension: micromarket_name {
    type: string
    link: {
      label: "House Wise"
      url: "/explore/cx_3_redshift/derived_csat_metrics?fields=derived_csat_metrics.count_total,derived_csat_metrics.feedback_given,derived_csat_metrics.feedback_postive,derived_csat_metrics.residence_name&f[derived_csat_metrics.exclude_3_days]=&f[derived_csat_metrics.created_time_date]=2021-08&sorts=derived_csat_metrics.feedback_postive+desc&limit=1000&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22column_order%22%3A%5B%22%24%24%24_row_numbers_%24%24%24%22%2C%22derived_csat_metrics.residence_name%22%2C%22derived_csat_metrics.count_total%22%2C%22derived_csat_metrics.feedback_given%22%2C%22feedback_received%22%2C%22derived_csat_metrics.feedback_postive%22%2C%22positive_feedback_percent%22%5D%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_csat_metrics.feedback_given%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22positive_feedback_percent%22%3A%7B%7D%2C%22derived_csat_metrics.feedback_postive%22%3A%7B%22bg_color%22%3A%22%23cee0a0%22%7D%7D%2C%22header_background_color%22%3A%22%23c5c6a6%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A0.5%2C%22background_color%22%3A%22%23cee0a0%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22positive_feedback_percent%22%5D%7D%5D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22series_types%22%3A%7B%7D%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22label_color%22%3A%5B%22%230%22%5D%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22font_size_main%22%3A%22%22%2C%22orientation%22%3A%22auto%22%2C%22style_complaint_ranking.rank_and_complaint%22%3A%22%23869958%22%2C%22show_title_complaint_ranking.rank_and_complaint%22%3Afalse%2C%22style_negative_feedback_percent%22%3A%22%23ff5b4f%22%2C%22show_comparison_negative_feedback_percent%22%3Afalse%2C%22style_positive_feedback_percent%22%3A%22%23809456%22%2C%22show_comparison_positive_feedback_percent%22%3Afalse%2C%22comparison_style_positive_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_positive_feedback_percent%22%3Afalse%2C%22comparison_label_placement_positive_feedback_percent%22%3A%22below%22%2C%22comp_value_format_positive_feedback_percent%22%3A%22%22%2C%22comparison_style_negative_feedback_percent%22%3A%22value%22%2C%22comparison_show_label_negative_feedback_percent%22%3Atrue%2C%22comparison_label_placement_negative_feedback_percent%22%3A%22below%22%2C%22comp_value_format_negative_feedback_percent%22%3A%22%22%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3Anull%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22light%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%7D&filter_config=%7B%22derived_csat_metrics.exclude_3_days%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_csat_metrics.created_time_date%22%3A%5B%7B%22type%22%3A%22advanced%22%2C%22values%22%3A%5B%7B%22constant%22%3A%222021-08%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%28%24%7Bderived_csat_metrics.feedback_postive%7D%2F%24%7Bderived_csat_metrics.feedback_given%7D%29%22%2C%22label%22%3A%22Positive+Feedback+Percent%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22positive_feedback_percent%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Afalse%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_csat_metrics.feedback_given%7D%2F%24%7Bderived_csat_metrics.count_total%7D%22%2C%22label%22%3A%22Feedback+Received+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22feedback_received%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22label%22%3A%22%25+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22calculation_type%22%3A%22percent_of_column_sum%22%2C%22table_calculation%22%3A%22contribution%22%2C%22args%22%3A%5B%22derived_csat_metrics.count_total%22%5D%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded&f[derived_csat_metrics.micromarket_name]={{derived_csat_metrics.micromarket_name._value}} &f[derived_csat_metrics.complain_cat2]={{derived_csat_metrics.complain_cat2._value }}  "
    }
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: ob_exit {
    type: string
    sql: ${TABLE}.ob_exit ;;
  }

  dimension_group: onboarding {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.onboarding_date ;;
  }

  dimension: ope_filter {
    type: string
    sql: ${TABLE}.ope_filter ;;
  }

  dimension: pre_movein {
    type: yesno
    sql: ${TABLE}.pre_movein ;;
  }

  dimension: reopened_ticket {
    type: yesno
    sql: ${TABLE}.reopened_ticket ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension_group: resolved {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.resolved_time ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: exclude_3_days {
    type: string
    sql: CASE
    WHEN ${TABLE}.onboarding_date IS NULL THEN NULL
    WHEN ${created_time_date} - ${onboarding_date}  >3 THEN 'Exclude 3'
    ELSE 'Only 3'
    END ;;
  }

  dimension: ope_rank {
    type: string
    sql: CASE
          WHEN ${TABLE}.ope_filter = 'Pre move-in'  THEN 1
          WHEN ${TABLE}.ope_filter = 'Onboarded'  THEN 2
          WHEN ${TABLE}.ope_filter = 'Exited'  THEN 3
          WHEN ${TABLE}.ope_filter = 'Resident not known'  THEN 4
          else 5
          END ;;
  }


  dimension: only_3_days {
    type: string
    sql: CASE
          WHEN ${TABLE}.onboarding_date IS NULL THEN NULL
          WHEN ${created_time_date} - ${onboarding_date}  >3 THEN '0'
          ELSE '3'
          END ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count {
    type: count
  }

  measure: count_total {
    type: count
    html: {{ rendered_value }} ({{ count_percent._rendered_value }});;
  }


  measure: feedback_postive  {
    type: count
    filters: [feedback: "1"]
  }

  measure: feedback_negative {
    type: count
    filters: [feedback: "0"]
  }

  measure: feedback_given {
    type: count
    filters: [feedback:"NOT NULL"]

  }

  dimension: zone {
    sql: case when ${TABLE}.city_name IN ('Dehradun','Delhi','Indore','Noida','New Delhi','Greater Noida','Gurgaon') then 'North'
              when ${TABLE}.city_name IN ('Bengaluru','Udipi','Bangalore','Davanagere','Manipal') then 'South-1'
              when ${TABLE}.city_name IN ('Chennai','Coimbatore','Hyderabad','Vijayawada','Vizag','Visakhapatnam') then 'South-2'
              when ${TABLE}.city_name IN ('Ahmedabad','Baroda','Vidya Nagar','Vadodara','Pune') then 'West'
    else 'Not Identified' end
    ;;

  }


  measure: count_percent {
    type: percent_of_total
    sql: ${count} ;;
  }
    }



  # dimension: TAT {
  #   type: number
  #   sql: DA ;;
  #   ;;
  # }

# dimension: zone_map {
#   map_layer_name:
# }


  # measure: count_total_mtd {
  #   type: count
  #   filters: [created_time_month: ]
  # }


  # measure: feedback_postive_mtd  {
  #   type: count
  #   filters: [feedback: "1"]
  # }

  # measure: feedback_negative_mtd {
  #   type: count
  #   filters: [feedback: "0"]
  # }

  # measure: feedback_given_mtd {
  #   type: count
  #   filters: [feedback:"NOT NULL"]
  # }
