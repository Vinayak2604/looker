view: is_report {
  sql_table_name: looker_demo.is_report ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: call_duration {
    type: time
    timeframes: [time]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.call_duration ;;
  }

  dimension_group: call_start {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.call_start_time ;;
  }

  dimension: call_status {
    type: string
    sql: ${TABLE}.call_status ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension_group: created {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_time ;;
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }

  dimension_group: next_call_start {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.next_call_start_time ;;
  }

  dimension: outgoing_call_status {
    type: string
    sql: ${TABLE}.outgoing_call_status ;;
  }

  dimension: owner {
    type: number
    sql: ${TABLE}.owner ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  dimension: phone {
    type: number
    sql: ${TABLE}.phone ;;
  }

  dimension: pre_booking_amount {
    type: number
    sql: ${TABLE}.pre_booking_amount ;;
  }

  dimension: qualification {
    type: string
    sql: ${TABLE}.qualification ;;
  }

  dimension: qualified_by {
    type: string
    sql: ${TABLE}.qualified_by ;;
  }

  dimension_group: qualified_date {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.qualified_date ;;
  }

  dimension: referral_code {
    type: string
    sql: ${TABLE}.referral_code ;;
  }

  dimension: team_lead {
    type: string
    sql: ${TABLE}.team_lead ;;
  }

  dimension: visit_scheduled {
    type: string
    sql: ${TABLE}.visit_scheduled ;;
  }

  dimension: visit_scheduled_by {
    type: string
    sql: ${TABLE}.visit_scheduled_by ;;
  }

  dimension_group: visit_scheduled_marked {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.visit_scheduled_marked_date ;;
  }

  measure: total_calls {
    type: count_distinct
    sql:  ${id} ;;

    link: {
      url: "/explore/inside_sales/is_report?fields=is_report.total_calls,is_report.call_start_week&fill_fields=is_report.call_start_week&f[is_report.call_start_date]=30+days&sorts=is_report.call_start_week+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22series_types%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22single_value_title%22%3A%22Total+Calls+L30D%22%2C%22type%22%3A%22looker_line%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%7D&filter_config=%7B%22is_report.call_start_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2230%22%2C%22unit%22%3A%22day%22%2C%22date%22%3A%222021-06-01T06%3A30%3A37.222Z%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%2C%22variant%22%3A%22absolute%22%7D%5D%7D&origin=share-expandedd&toggle=dat,pik,vis&toggle=dat,pik,vid"
      label: "total calls WOW"
    }

    link: {
      url: "/explore/inside_sales/is_report?fields=is_report.total_calls,is_report.call_start_date&fill_fields=is_report.call_start_date&f[is_report.call_start_date]=30+days&sorts=is_report.call_start_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22series_types%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22single_value_title%22%3A%22Total+Calls+L30D%22%2C%22type%22%3A%22looker_line%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%7D&filter_config=%7B%22is_report.call_start_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2230%22%2C%22unit%22%3A%22day%22%2C%22date%22%3A%222021-06-01T06%3A30%3A37.222Z%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%2C%22variant%22%3A%22absolute%22%7D%5D%7D&origin=share-expanded&toggle=dat,pik,vis&toggle=dat,pik,vid"
      label: "total calls DOD"
    }
  }

  measure: total_leads {
    type: count_distinct
    sql:  ${lead_id};;
  }


  measure: connected_calls {
    type: count_distinct
    sql: case when ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
  }

  measure: connected_calls_per {
    type: number
    sql: ${connected_calls}/${total_calls} ;;
    value_format: "0.00%"

    link: {
      url: "/explore/inside_sales/is_report?fields=is_report.connected_calls_per,is_report.call_start_week&fill_fields=is_report.call_start_week&f[is_report.call_start_date]=30+days&sorts=is_report.call_start_week+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22series_types%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22single_value_title%22%3A%22Connected+Calls+L30D%22%2C%22type%22%3A%22looker_line%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%7D&filter_config=%7B%22is_report.call_start_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2230%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&toggle=dat,pik,vis&toggle=dat,pik,vid"
      label: "connected calls WOW"
    }

    link: {
      url: "/explore/inside_sales/is_report?fields=is_report.connected_calls_per,is_report.call_start_date&fill_fields=is_report.call_start_date&f[is_report.call_start_date]=30+days&sorts=is_report.call_start_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22series_types%22%3A%7B%7D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22single_value_title%22%3A%22Connected+Calls+L30D%22%2C%22type%22%3A%22looker_line%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%7D&filter_config=%7B%22is_report.call_start_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2230%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&toggle=dat,pik,vis&toggle=dat,pik,vid"
      label: "connected calls DOD"
    }
  }

  measure: leads_connected_calls {
    type: count_distinct
    sql: case when ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${lead_id} end ;;
  }

  measure: qualified_leads {
    type: count_distinct
    sql: case when ${qualification} = 'Y' then ${lead_id} end  ;;
  }

  measure: qualification_per {
    type: number
    sql: ${qualified_leads}/ ${leads_connected_calls};;
    value_format: "0.00%"
  }

  measure: disqualified_leads {
    type: count_distinct
    sql: case when ${qualification} = 'N' then ${lead_id} end  ;;
  }

  measure: disqualification_per {
    type: number
    sql: ${disqualified_leads}/ ${leads_connected_calls};;
    value_format: "0.00%"
  }

  measure: visit_scheduled_leads {
    type: count_distinct
    sql: case when ${visit_scheduled} = 'Y' then ${lead_id} end  ;;
  }

  measure: visit_scheduled_per {
    type: number
    sql: ${visit_scheduled}/${leads_connected_calls} ;;
    value_format: "0.00%"
  }

}
