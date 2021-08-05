view: derived_vas_orders {
  sql_table_name: looker_demo.derived_vas_orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cafe {
    type: string
    sql: ${TABLE}.cafe ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension: dt {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: delivery {
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
    sql: ${TABLE}.delivery_time ;;
  }

  dimension_group: expected_delivery {
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
    sql: ${TABLE}.expected_delivery_time ;;
  }

  dimension: feedback {
    type: string
    sql: ${TABLE}.feedback ;;
  }

  dimension: feedback_for {
    type: string
    sql: ${TABLE}.feedback_for ;;
  }

  dimension: final_total_amount {
    type: number
    sql: ${TABLE}.final_total_amount ;;
  }

  dimension: in_room {
    type: yesno
    sql: ${TABLE}.in_room ;;
  }

  dimension: mealtime {
    type: string
    sql: ${TABLE}.mealtime ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: order_code {
    type: string
    sql: ${TABLE}.order_code ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: service_mode {
    type: string
    sql: ${TABLE}.service_mode ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: profession {
    type: string
    sql: ${TABLE}.profession ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: ageing {
    type: number
    sql: ${TABLE}.ageing ;;
  }

  dimension: move_in_date {
    type: date
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: ov_bucket {
    type: tier
    tiers: [0,20,40,60,80,100,130]
    style: integer
    sql: ${final_total_amount} ;;
  }



  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: orders {
    type: count_distinct
    sql: ${order_code} ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: rated_orders {
    type: count_distinct
    sql: case when rating >= 1 then ${order_code} end ;;
  }

  measure: rated_orders_per {
    type: number
    sql: ${rated_orders}/${orders} ;;
    value_format: "0.00%"
  }

  measure: aov {
    type: average
    sql: ${final_total_amount} ;;
    value_format: "0.0"
    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.ov_bucket,derived_vas_orders.count&sorts=derived_vas_orders.ov_bucket&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%22undefined%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_vas_orders.count%22%2C%22id%22%3A%22derived_vas_orders.count%22%2C%22name%22%3A%22Orders%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3Anull%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22preto%22%2C%22id%22%3A%22preto%22%2C%22name%22%3A%22Orders+Preto%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22maxValue%22%3Anull%2C%22minValue%22%3Anull%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22log%22%7D%5D%2C%22hide_legend%22%3Afalse%2C%22font_size%22%3A%2212%22%2C%22label_value_format%22%3A%22%22%2C%22series_types%22%3A%7B%22preto%22%3A%22scatter%22%7D%2C%22series_colors%22%3A%7B%22preto%22%3A%22%23c42022%22%7D%2C%22series_labels%22%3A%7B%22derived_vas_orders.count%22%3A%22Orders%22%2C%22preto%22%3A%22Orders+Contribution%22%7D%2C%22series_point_styles%22%3A%7B%22preto%22%3A%22diamond%22%7D%2C%22column_spacing_ratio%22%3A0.5%2C%22show_dropoff%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22up_color%22%3A%22%2362bad4%22%2C%22down_color%22%3A%22%23a9c574%22%2C%22total_color%22%3A%22%23929292%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22orientation%22%3A%22automatic%22%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%2C%22hidden_fields%22%3Anull%7D&filter_config=%7B%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22preto%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_vas_orders.count%7D+%2F+sum%28%24%7Bderived_vas_orders.count%7D%29%22%2C%22label%22%3A%22Preto%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%7D%5D&origin=share-expanded&f[derived_vas_orders.date_date]={{_filters['derived_vas_orders.date_date'] | url_encode}}&f[derived_vas_orders.city]={{_filters['derived_vas_orders.city'] | url_encode}}&f[derived_vas_orders.micromarket]={{_filters['derived_vas_orders.micromarket'] | url_encode}}&f[derived_vas_orders.residence]={{_filters['derived_vas_orders.residence'] | url_encode}}&f[derived_vas_orders.mealtime]={{_filters['derived_vas_orders.mealtime'] | url_encode}}&f[derived_vas_orders.cafe]={{_filters['derived_vas_orders.cafe'] | url_encode}}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "AOV bucket wise orders"
    }
  }

  measure: total_amount {
    type: sum
    sql: ${final_total_amount} ;;
  }

}
