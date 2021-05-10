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
    # drill_fields: [micromarket,residence,meal_type]
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
  url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.user_id,derived_user_preference_rating.name,derived_user_preference_rating.gender,derived_user_preference_rating.profession,derived_user_preference_rating.rated_meals_per,derived_user_preference_rating.total_orders&f[derived_user_preference_rating.rated_meals_per]=%3C0.3&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Meals%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.rated_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.3%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_user_preference_rating.meal_type]={{ value }}&f[derived_user_preference_rating.city]={{ _filters['derived_user_preference_rating.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['derived_user_preference_rating.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{ _filters['derived_user_preference_rating.residence'] | url_encode }}&f[derived_user_preference_rating.date_date]={{ _filters['derived_user_preference_rating.date_date'] | url_encode }}&toggle=dat,pik,vis"
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: profession {
    type: string
    sql: ${TABLE}.profession ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id]
  # }
  measure: total_orders {
    type: count_distinct
    sql:  ${id};;
  }

  measure: total_meals_breakfast {
    type: count_distinct
    sql: case when ${meal_type} = 'BREAKFAST' then ${id} end;;
  }

  measure: total_meals_lunch {
    type: count_distinct
    sql: case when ${meal_type} = 'LUNCH' then ${id} end;;
  }

  measure: total_meals_dinner {
    type: count_distinct
    sql: case when ${meal_type} = 'DINNER' then ${id} end;;
  }

  measure: total_meals_evening_snacks {
    type: count_distinct
    sql: case when ${meal_type} = 'EVENING_SNACKS' then ${id} end;;
  }

  measure: rated_meals {
    type: count_distinct
    sql: case when ${rating} >0 then ${id} end;;
    html: <b> {{value}} </b> <br> {{rated_meals._rendered_value}} ;;
  }

  measure: rated_meals_breakfast {
    type: count_distinct
    sql: case when ${meal_type} = 'BREAKFAST' and ${rating} >0 then ${id} end;;
  }

  measure: rated_meals_lunch {
    type: count_distinct
    sql: case when ${meal_type} = 'LUNCH' and ${rating} >0 then ${id} end;;
  }

  measure: rated_meals_dinner {
    type: count_distinct
    sql: case when ${meal_type} = 'DINNER' and ${rating} >0 then ${id} end;;
  }

  measure: rated_meals_evening_snacks {
    type: count_distinct
    sql: case when ${meal_type} = 'EVENING_SNACKS' and ${rating} >0 then ${id} end;;
  }

  measure: rated_meals_per {
    type: number
    sql: ${rated_meals}/${total_orders};;
    value_format: "0.0%"
  }

  measure: rated_meals_breakfast_per {
    type: number
    sql: ${rated_meals_breakfast}/${total_meals_breakfast};;
    value_format: "0.0%"
  }

  measure: rated_meals_lunch_per {
    type: number
    sql: ${rated_meals_lunch}/${total_meals_lunch};;
    value_format: "0.0%"
  }

  measure: rated_meals_dinner_per {
    type: number
    sql: ${rated_meals_dinner}/${total_meals_dinner};;
    value_format: "0.0%"
  }

  measure: rated_meals_evening_snacks_per {
    type: number
    sql: ${rated_meals_evening_snacks}/${total_meals_evening_snacks};;
    value_format: "0.0%"
  }

  measure: preference_users {
    type: count_distinct
    sql: case when ${system_generated} = false and ${preference_available} = true then ${user_id} end;;
  }

  measure: preference_available_users {
    type: count_distinct
    sql: case when ${preference_available} = true then ${user_id} end;;
  }

  measure: preference_users_per {
    type: number
    sql: ${preference_users}/${preference_available_users} ;;
    value_format: "00.0%"
  }

  measure: total_uniqe_users {
    type: count_distinct
    sql: ${user_id};;
  }

  measure: orders_with_preference {
    type: count_distinct
    sql: case when ${system_generated} = false and ${preference_available} = true then ${id} end;;
  }

  measure: preference_available_orders {
    type: count_distinct
    sql: case when ${preference_available} = true then ${id} end;;
  }

  measure: preference_meals_per {
    type: number
    sql: ${orders_with_preference}/${preference_available_orders};;
    value_format: "00.0%"
  }

}
