view: derived_social_media_complaints {
  sql_table_name: stanza.derived_social_media_complaints ;;

dimension: aging {
  type: string
  sql: ${TABLE}.aging ;;
}



dimension: av_tat {
  type: number
  sql: ${TABLE}.av_tat ;;
}

dimension: category {
  type: string
  sql: ${TABLE}.category ;;
}

dimension: city {
  type: string
  link: {label: "MM Wise"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.mm,derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints&f[derived_social_media_complaints.mm]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.mm&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.mm%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.city]={{ value }}&f[derived_social_media_complaints.sub_category]={{ derived_social_media_complaints.sub_category._value  }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  sql: ${TABLE}.city
    ;;
}

  dimension: city2 {
    type: string
    sql: ${TABLE}.city
      ;;
  }

  dimension: city3{
    type: string
    link: {
      label: "MM Level"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.mm3,derived_social_media_complaints.escalation_type,derived_social_media_complaints.count&pivots=derived_social_media_complaints.escalation_type&f[derived_social_media_complaints.escalation_type]=-NULL&sorts=derived_social_media_complaints.mm3,derived_social_media_complaints.escalation_type&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.escalation_type%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.city]={{ value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.city
      ;;
  }

  dimension: city4 {
    type: string
    link: {
      label: "MM Level Split"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Public_Complaints,derived_social_media_complaints.Private_Complaints,derived_social_media_complaints.Directly_Social,derived_social_media_complaints.FD_Social,derived_social_media_complaints.Justified_Complaints4,derived_social_media_complaints.Unjustified_Complaints4,derived_social_media_complaints.mm4&filter_expression=%24%7Bderived_social_media_complaints.city4%7D%21%3D%22%22%0AAND%0A%24%7Bderived_social_media_complaints.mm4%7D%21%3D%22%22&sorts=derived_social_media_complaints.Public_Complaints+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22color_application%22%3A%7B%22collection_id%22%3A%229d1da669-a6b4-4a4f-8519-3ea8723b79b5%22%2C%22palette_id%22%3A%220c5264fb-0681-4817-b9a5-d3c81002ce4c%22%7D%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_social_media_complaints.Public_Complaints%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_social_media_complaints.Public_Complaints%22%3A%7B%22bg_color%22%3A%22%2385c0de%22%7D%2C%22derived_social_media_complaints.Private_Complaints%22%3A%7B%22bg_color%22%3A%22%2385c0de%22%7D%2C%22derived_social_media_complaints.Directly_Social%22%3A%7B%22bg_color%22%3A%22%23ADAA8D%22%7D%2C%22derived_social_media_complaints.FD_Social%22%3A%7B%22bg_color%22%3A%22%23ADAA8D%22%7D%2C%22derived_social_media_complaints.Justified_Complaints4%22%3A%7B%22bg_color%22%3A%22%23F2E271%22%7D%2C%22derived_social_media_complaints.Unjustified_Complaints4%22%3A%7B%22bg_color%22%3A%22%23F2E271%22%7D%7D%2C%22header_background_color%22%3A%22%23AEC8C1%22%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_social_media_complaints.city]={{ value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.city
      ;;
  }





dimension: connect_not_connect_status {
  type: string
  sql: ${TABLE}.connect_not_connect_status ;;
}

dimension: cx_charter_violated {
  type: string
  sql: ${TABLE}.cx_charter_violated ;;
}

dimension_group: date {
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
  sql: ${TABLE}.date ;;
}

  dimension_group: date2 {
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
    sql: ${TABLE}.date ;;
  }


  dimension: date_line {
    type : string
    link: {
      label: "House Deep Dive"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.count,derived_social_media_complaints.date_date,derived_social_media_complaints.hostel2&pivots=derived_social_media_complaints.hostel2&fill_fields=derived_social_media_complaints.date_date&sorts=derived_social_media_complaints.count+desc+0,derived_social_media_complaints.hostel2&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_social_media_complaints.date_line]={{ derived_social_media_complaints.date_line._value }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }

    link: {
      label: "Subcategory Deep Dive"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.sub_category,derived_social_media_complaints.count,derived_social_media_complaints.date_line&pivots=derived_social_media_complaints.sub_category&f[derived_social_media_complaints.sub_category]=-NULL&sorts=derived_social_media_complaints.sub_category,derived_social_media_complaints.count+desc+0&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.sub_category%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.date_line]={{ derived_social_media_complaints.date_line._value }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.date ;;

  }

dimension_group: date_of_resolution {
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
  sql: ${TABLE}.date_of_resolution ;;
}

dimension: do_we_have_alredy_fresh_desk_ticket {
  type: string
  sql: ${TABLE}.do_we_have_alredy_fresh_desk_ticket ;;
}

dimension_group: escalation_closed_with_andy_sandeep_and_shaminn {
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
  sql: ${TABLE}.escalation_closed_with_andy_sandeep_and_shaminn ;;
}

dimension_group: escalation_email_shared_to_city_team {
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
  sql: ${TABLE}.escalation_email_shared_to_city_team ;;
}

dimension: escalation_type {
  type: string
  sql: ${TABLE}.escalation_type ;;
}



dimension_group: fd_ticket_created {
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
  sql: ${TABLE}.fd_ticket_created_date ;;
}

dimension: follow_up_count_on_mail {
  type: number
  sql: ${TABLE}.follow_up_count_on_mail ;;
}

dimension: hostel {
  type: string
  sql: ${TABLE}.hostel ;;
}

  dimension: hostel2 {
    type: string
    sql: ${TABLE}.hostel ;;
  }

dimension: justified_unjustified {
  type: string
  sql: ${TABLE}.justified_unjustified ;;
}

dimension: mm {
  type: string
  link: {
    label: "House Level View"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.hostel,derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints&f[derived_social_media_complaints.hostel]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.hostel%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.zone]={{derived_social_media_complaints.zone._value}}&f[derived_social_media_complaints.sub_category]={{derived_social_media_complaints.sub_category._value}}&f[derived_social_media_complaints.mm]={{value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  sql: ${TABLE}.mm ;;
}

  dimension: mm3 {
    type: string
    sql: ${TABLE}.mm ;;
  }

  dimension: mm4 {
    type: string
    link: {
      label: "House Level View"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Public_Complaints,derived_social_media_complaints.Private_Complaints,derived_social_media_complaints.Directly_Social,derived_social_media_complaints.FD_Social,derived_social_media_complaints.Justified_Complaints4,derived_social_media_complaints.Unjustified_Complaints4,derived_social_media_complaints.hostel&filter_expression=%24%7Bderived_social_media_complaints.city4%7D%21%3D%22%22%0AAND%0A%24%7Bderived_social_media_complaints.mm4%7D%21%3D%22%22&sorts=derived_social_media_complaints.Public_Complaints+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22color_application%22%3A%7B%22collection_id%22%3A%229d1da669-a6b4-4a4f-8519-3ea8723b79b5%22%2C%22palette_id%22%3A%220c5264fb-0681-4817-b9a5-d3c81002ce4c%22%7D%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_social_media_complaints.Public_Complaints%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_social_media_complaints.Public_Complaints%22%3A%7B%22bg_color%22%3A%22%2385c0de%22%7D%2C%22derived_social_media_complaints.Private_Complaints%22%3A%7B%22bg_color%22%3A%22%2385c0de%22%7D%2C%22derived_social_media_complaints.Directly_Social%22%3A%7B%22bg_color%22%3A%22%23ADAA8D%22%7D%2C%22derived_social_media_complaints.FD_Social%22%3A%7B%22bg_color%22%3A%22%23ADAA8D%22%7D%2C%22derived_social_media_complaints.Justified_Complaints4%22%3A%7B%22bg_color%22%3A%22%23F2E271%22%7D%2C%22derived_social_media_complaints.Unjustified_Complaints4%22%3A%7B%22bg_color%22%3A%22%23F2E271%22%7D%7D%2C%22header_background_color%22%3A%22%23AEC8C1%22%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_social_media_complaints.mm]={{value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.mm ;;
  }



dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

dimension: ownership {
  type: string
  sql: ${TABLE}.ownership ;;
}

dimension: platform {
  type: string
  sql: ${TABLE}.platform ;;
}

dimension: policy_violated_yes_no {
  type: string
  sql: ${TABLE}.policy_violated_yes_no ;;
}

dimension: reason_that_resident_escalate_on_sm {
  type: string
  sql: ${TABLE}.reason_that_resident_escalate_on_sm ;;
}

dimension:overall  {
  type: string
  link: {
    label: "Zone Wise"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Justified_Complaints2,derived_social_media_complaints.Unjustified_Complaints2,derived_social_media_complaints.zone2&f[derived_social_media_complaints.zone2]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints2+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints2%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.zone2%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  sql: 'overall' ;;
}

  dimension:overall2  {
    type: string
    link: {
      label: "Zone Wise"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.count,derived_social_media_complaints.zone3,derived_social_media_complaints.escalation_type&pivots=derived_social_media_complaints.escalation_type&f[derived_social_media_complaints.escalation_type]=-NULL&f[derived_social_media_complaints.zone3]=-NULL&sorts=derived_social_media_complaints.count+desc+0,derived_social_media_complaints.escalation_type&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22Public+-+derived_social_media_complaints.count%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.escalation_type%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.zone3%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
   sql: 'overall2' ;;
  }

dimension_group: resolution_provided_by_the_city_team {
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
  sql: ${TABLE}.resolution_provided_by_the_city_team ;;
}

dimension: satisfied_unsatisfied {
  type: string
  sql: ${TABLE}.satisfied_unsatisfied ;;
}

dimension: status {
  type: string
  sql: ${TABLE}.status ;;
}

dimension: sub_category {
  type: string
  sql: ${TABLE}.sub_category ;;
}

dimension: tat {
  type: string
  sql: ${TABLE}.tat ;;
}

dimension_group: the_actual_date_of_social_post {
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
  sql: ${TABLE}.the_actual_date_of_social_post ;;
}

dimension: ticket_id {
  type: number
  sql: ${TABLE}.ticket_id ;;
}

dimension: user_id {
  type: string
  sql: ${TABLE}.user_id ;;
}

dimension: zone {
  type: string
  link: {
    label: "City Level View"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.city,derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints&f[derived_social_media_complaints.justified_unjustified]=-NULL&f[derived_social_media_complaints.city]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.city%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.zone]={{derived_social_media_complaints.zone._value}}&f[derived_social_media_complaints.sub_category]={{derived_social_media_complaints.sub_category._value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  sql: ${TABLE}.zone ;;
}

  dimension: zone2 {
    type: string
    link: {
      label: "City Level View"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Justified_Complaints2,derived_social_media_complaints.Unjustified_Complaints2,derived_social_media_complaints.city2&f[derived_social_media_complaints.zone2]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.Unjustified_Complaints2+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints2%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.zone2%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.zone]={{derived_social_media_complaints.zone._value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.zone ;;
  }


  dimension: zone3 {
    type: string
    link: {
      label: "City Level View"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.count,derived_social_media_complaints.escalation_type,derived_social_media_complaints.city3&pivots=derived_social_media_complaints.escalation_type&f[derived_social_media_complaints.escalation_type]=-NULL&f[derived_social_media_complaints.zone3]=-NULL&sorts=derived_social_media_complaints.count+desc+0,derived_social_media_complaints.escalation_type&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22Public+-+derived_social_media_complaints.count%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%23000000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.escalation_type%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.zone3%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.zone]={{derived_social_media_complaints.zone._value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.zone ;;
  }

  dimension: zone_ {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: zone4 {
    type: string
    link: {
      label: "City LEvel Drill"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.city4,derived_social_media_complaints.Public_Complaints,derived_social_media_complaints.Private_Complaints,derived_social_media_complaints.Directly_Social,derived_social_media_complaints.FD_Social,derived_social_media_complaints.Justified_Complaints4,derived_social_media_complaints.Unjustified_Complaints4&filter_expression=%24%7Bderived_social_media_complaints.city4%7D%21%3D%22%22&sorts=derived_social_media_complaints.city4&limit=500&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_social_media_complaints.zone]={{derived_social_media_complaints.zone._value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    sql: ${TABLE}.zone ;;
  }
measure: count {
  type: count
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}



measure: count2 {
  type: count
  # drill_fields: [name]
  link: {
    label: "City Wise"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.city,derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints&f[derived_social_media_complaints.city]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Justified_Complaints%22%3A%22%2362bad4%22%2C%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.city%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.sub_category]={{ derived_social_media_complaints.sub_category._value}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }

  link: {
    label: "Zone Wise"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints,derived_social_media_complaints.zone&f[derived_social_media_complaints.city]=-NULL&f[derived_social_media_complaints.sub_category]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%2300000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.city%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.sub_category%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.sub_category]={{ derived_social_media_complaints.sub_category._value }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  link: {
    label: "Raw Details"
    url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.category,derived_social_media_complaints.date_date,derived_social_media_complaints.do_we_have_alredy_fresh_desk_ticket,derived_social_media_complaints.escalation_type,derived_social_media_complaints.city,derived_social_media_complaints.mm,derived_social_media_complaints.platform,derived_social_media_complaints.sub_category,derived_social_media_complaints.tat,derived_social_media_complaints.ticket_id,derived_social_media_complaints.zone,derived_social_media_complaints.satisfied_unsatisfied,derived_social_media_complaints.justified_unjustified,derived_social_media_complaints.identified,derived_social_media_complaints.escalation_closed_with_andy_sandeep_and_shaminn_date,derived_social_media_complaints.cx_charter_violated,derived_social_media_complaints.reason_that_resident_escalate_on_sm,derived_social_media_complaints.resolution_provided_by_the_city_team_date&f[derived_social_media_complaints.sub_category]=-NULL&f[derived_social_media_complaints.platform]=-NULL&sorts=derived_social_media_complaints.date_date+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22series_types%22%3A%7B%7D%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.sub_category%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.platform%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.sub_category]={{derived_social_media_complaints.sub_category._value}}&f[derived_social_media_complaints.justified_unjustified]={{derived_social_media_complaints.justified_unjustified}}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
  }
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}

  measure: count_line {
    type: count
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;
  }

# dimension: l30 {

#   sql: CASE
#       WHEN ${TABLE}.date > add_days(-30,date_trunc(now)) THEN 'Y'
#       ELSE 'N'
#       END ;;
# }

# dimension: l7 {

#   sql: CASE
#       WHEN ${TABLE}.date > add_days(-7,date_trunc(now())) THEN 'Y'
#       ELSE 'N'
#       END ;;
# }

# dimension: l1 {

#   sql: CASE
#       WHEN ${TABLE}.date > add_days(-1,date_trunc(now())) THEN 'Y'
#       ELSE 'N'
#       END ;;
# }

# dimension: aging_new {

#   sql:  IF(is_null(${ticket_id}),'',
#   IF(is_null(${date_of_resolution_date}),days_diff(date_trunc(now()),${fd_ticket_created_date}),
#   days_diff(${date_of_resolution_date},${fd_ticket_created_date})))

#   ;;

# }

dimension: identified {
  type: string
  sql: case when ${TABLE}.city is not null  and ${TABLE}.date is not null
        and ${TABLE}.hostel is not null and ${TABLE}.justified_unjustified is not null
        and ${TABLE}.sub_category is not null and ${TABLE}.user_id is not null
        then 'Identified' end  ;;
}


  # dimension: top_sub_cat_5 {
  #   type: string
  #   sql: case
  #       when ${TABLE}.subcategory IN (SELECT ${sub_category} , ${count} as cnt ORDER BY cnt DESC LIMIT 5)
  #       when ${TABLE}.subcategory IS NOT NULL then ${TABLE}.subcategory
  #       then 'other' else null

  #       end  ;;
  # }

measure: Justified_Complaints{
  type: count
  filters: [justified_unjustified: "Justified"]
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}

measure: Unjustified_Complaints{
  type: count
  filters: [justified_unjustified: "Unjustified"]
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}

measure: Justified_Complaints2{
  type: count
  filters: [justified_unjustified: "Justified"]
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}

  measure: Justified_Complaints3{
    type: count
    link: {
      label: "Sub Category Drill"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.sub_category,derived_social_media_complaints.Justified_Complaints3&filter_expression=%24%7Bderived_social_media_complaints.sub_category%7D%21%3D%22%22%0A&sorts=derived_social_media_complaints.Justified_Complaints3+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22truncate_column_names%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22along+a+scale...%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%2362bad4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-diverging-0%22%2C%22options%22%3A%7B%22constraints%22%3A%7B%22min%22%3A%7B%22type%22%3A%22minimum%22%7D%2C%22mid%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3A0%7D%2C%22max%22%3A%7B%22type%22%3A%22maximum%22%7D%7D%2C%22mirror%22%3Atrue%2C%22reverse%22%3Afalse%2C%22stepped%22%3Afalse%7D%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_social_media_complaints.Justified_Complaints3%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22type%22%3A%22table%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expandedd&f[derived_social_media_complaints.zone4]={{ derived_social_media_complaints.zone4._value }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    filters: [justified_unjustified: "Justified"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;

  }

  measure: Justified_Complaints4{
    type: count
    link: {
      label: "Sub Category Drill"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.sub_category,derived_social_media_complaints.Justified_Complaints3&filter_expression=%24%7Bderived_social_media_complaints.sub_category%7D%21%3D%22%22%0A&sorts=derived_social_media_complaints.Justified_Complaints3+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22truncate_column_names%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22along+a+scale...%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%2362bad4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-diverging-0%22%2C%22options%22%3A%7B%22constraints%22%3A%7B%22min%22%3A%7B%22type%22%3A%22minimum%22%7D%2C%22mid%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3A0%7D%2C%22max%22%3A%7B%22type%22%3A%22maximum%22%7D%7D%2C%22mirror%22%3Atrue%2C%22reverse%22%3Afalse%2C%22stepped%22%3Afalse%7D%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_social_media_complaints.Justified_Complaints3%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22type%22%3A%22table%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expandedd&f[derived_social_media_complaints.city4]={{ derived_social_media_complaints.city4._value }}&f[derived_social_media_complaints.identified]={{ _filters['derived_social_media_complaints.identified'] | url_encode }}&f[derived_social_media_complaints.date_date]={{ _filters['derived_social_media_complaints.date_date'] | url_encode}}"
    }
    filters: [justified_unjustified: "Justified"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;
  }

measure: Unjustified_Complaints2{
  type: count
  filters: [justified_unjustified: "Unjustified"]
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;
}

  measure: Unjustified_Complaints3{
    type: count
    filters: [justified_unjustified: "Unjustified"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;
  }


  measure: Unjustified_Complaints4{
    type: count
    filters: [justified_unjustified: "Unjustified"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;
  }

measure: Directly_Social {
  type: count
  filters: [do_we_have_alredy_fresh_desk_ticket: "No"]
  html: {% if value > 0 %}
  <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  {% else %}
  <p style="color:black"> - </p>

  {% endif %};;

}

  measure: FD_Social {
    type: count
    filters: [do_we_have_alredy_fresh_desk_ticket: "Yes"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;
  }

  measure: Public_Complaints{
    type: count
    filters: [escalation_type: "Public"]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;

  }

  measure: Private_Complaints {
    type: count
    filters: [escalation_type: "Private" ]
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color:black"> - </p>

    {% endif %};;

  }




}
