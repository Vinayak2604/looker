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
  }

  measure: connected_calls {
    type: count_distinct
    sql: case when ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
    # link: {
    #   url: "/explore/inside_sales/is_report?fields=is_report.call_start_date,is_report.total_calls,is_report.connected_calls&fill_fields=is_report.call_start_date&f[is_report.call_start_date]=after+5+years+ago&sorts=is_report.call_start_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22x_axis_label%22%3A%22Call+Date%22%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22series_types%22%3A%7B%7D%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22up_color%22%3A%22%2362bad4%22%2C%22down_color%22%3A%22%23a9c574%22%2C%22total_color%22%3A%22%23929292%22%2C%22groupBars%22%3Atrue%2C%22labelSize%22%3A%2210pt%22%2C%22showLegend%22%3Atrue%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22orientation%22%3A%22automatic%22%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22is_report.call_start_date%22%3A%5B%7B%22type%22%3A%22after%22%2C%22values%22%3A%5B%7B%22date%22%3A%222021-05-31T12%3A24%3A34.757Z%22%2C%22constant%22%3A%225%22%2C%22unit%22%3A%22yr%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%2C%22variant%22%3A%22relative%22%7D%5D%7D&origin=share-expanded&f[is_report.date_date]={{ _filters['is_report.date_date'] | url_encode }}&toggle=dat,pik,vd"
    #   label: "DOD Calls Data"
    # }
  }

  measure: connected_calls_per {
    type: number
    sql: ${connected_calls}/${total_calls} ;;
    value_format: "0.00%"
  }

  measure: qualified_leads {
    type: count_distinct
    sql: case when ${qualification} = 'Y' then ${id} end  ;;
  }

  measure: qualification_per {
    type: number
    sql: ${qualified_leads}/${total_calls} ;;
    value_format: "0.00%"
  }

  measure: visit_scheduled_leads {
    type: count_distinct
    sql: case when ${visit_scheduled} = 'Y' then ${id} end  ;;
  }

  measure: visit_scheduled_per {
    type: number
    sql: ${visit_scheduled}/${total_calls} ;;
    value_format: "0.00%"
  }

}
