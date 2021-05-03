view: derived_user_preference_rating {
  sql_table_name: looker_demo.derived_user_preference_rating ;;
  drill_fields: [phone]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cafe_availability {
    type: string
    sql: ${TABLE}.cafe_availability ;;
  }

  dimension: preference_available {
    type: string
    sql: ${TABLE}.preference_available ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [micromarket,residence,meal_type]
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
    sql:  ${TABLE}.date;;
    hidden: yes
  }

  # parameter: date {
  #   type: date
  #   convert_tz: no
  # }

  dimension: food_preference {
    type: string
    sql: ${TABLE}.food_preference ;;
  }

  dimension: item_base_preference {
    type: string
    sql: ${TABLE}.item_base_preference ;;
  }

  dimension: meal_type {
    type: string
    sql: ${TABLE}.meal_type ;;
    # drill_fields: [phone]
link: {
  url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.rated_meals_per&f[derived_user_preference_rating.rated_meals_per]=%3C0.3&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22Rated+Meals%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.rated_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.3%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_user_preference_rating.meal_type]={{ value }}&f[derived_user_preference_rating.residence]={{ _filters['derived_user_preference_rating.residence'] | url_encode }}&f[derived_user_preference_rating.date_date]={{ _filters['derived_user_preference_rating.date_date'] | url_encode }}&toggle=dat,pik,vis"
      label: "SMR Below Threshold Users"
}
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  measure: moved_in_residents {
    type: max
    sql: ${TABLE}.moved_in_residents ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: system_generated {
    type: string
    sql: ${TABLE}.system_generated ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id]
  # }
  measure: total_orders {
    type: count_distinct
    sql:  ${id};;

  }
  measure: rated_meals {
    type: count_distinct
    sql: case when ${rating} >0 then ${id} end;;
  }

  measure: rated_meals_per {
    type: number
    sql: ${rated_meals}/${total_orders};;
    value_format: "0.0%"
  }

  measure: uniqe_preference_users {
    type: count_distinct
    sql: ${user_id};;
  }
  measure: total_uniqe_users {
    type: count_distinct
    sql: ${user_id};;
  }
  measure: orders_with_preference {
    type: count_distinct
    sql: case when ${item_base_preference} = true then ${id} end;;
  }

  measure: preference_meals_per {
    type: number
    sql: ${orders_with_preference}/${total_orders};;
    value_format: "00.0%"
  }

}
