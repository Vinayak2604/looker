view: derived_food_project {
  sql_table_name: stanza.derived_food_project ;;

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }


  dimension: month_quartile {
    type: string
    sql: case when ${date} <= 8 then '1st Quartile' when ${date} <= 16 then '2nd Quartile' when ${date} <= 24 then '3rd Quartile' when ${date} > 24 then '4th Quartile' end;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension_group: move_in_date {
    type: time
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: meal_id {
    type: string
    sql: ${TABLE}.meal_id ;;
  }

  dimension: meal_type {
    type: string
    sql: ${TABLE}.meal_type ;;
  }

  dimension: meal_consumed {
    type: number
    sql: ${TABLE}.meal_consumed ;;
  }

  dimension: item_base_preference {
    type: number
    sql: ${TABLE}.item_base_preference ;;
  }

  dimension: meal_rating {
    type: number
    sql: ${TABLE}.meal_rating ;;
  }

  dimension: preference_available {
    type: number
    sql: ${TABLE}.preference_available ;;
  }

  dimension: home_town {
    type: string
    sql: ${TABLE}.home_town ;;
  }

  dimension: ageing {
    type: number
    sql: ${TABLE}.ageing ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }

  measure: total_users {
    type: count_distinct
    sql: ${student_id} ;;
  }

  measure: total_meals {
    type: count_distinct
    sql: ${meal_id} ;;

  }

  measure: total_rating {
    type: number
    sql: count(case when ${meal_rating} >= 1 then ${meal_rating} end);;
    html: <p>{{rendered_value}} (U: {{derived_food_project.total_users._rendered_value}})</p> ;;
  }

  measure: total_rating_for_filter {
    type: number
    sql: count(${meal_rating}) ;;
  }


  measure: 1s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 1 then ${student_id} end;;
  }

  measure: 2s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 2 then ${student_id} end;;
  }


  measure: 3s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 3 then ${student_id} end;;
  }

  measure: 4s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 4 then ${student_id} end ;;
  }

  measure: 5s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 5 then ${student_id} end;;
  }

  measure: 1s {
    type: number
    sql: count(case when ${meal_rating} = 1 then ${meal_rating} end);;
  }

  measure: 2s {
    type: number
    sql: count(case when ${meal_rating} = 2 then ${meal_rating} end);;
  }


  measure: 3s {
    type: number
    sql: count(case when ${meal_rating} = 3 then ${meal_rating} end);;
  }

  measure: 4s {
    type: number
    sql: count(case when ${meal_rating} = 4 then ${meal_rating} end) ;;
  }

  measure: 5s {
    type: number
    sql: count(case when ${meal_rating} = 5 then ${meal_rating} end);;
  }


  measure: 1s_per {
    type: number
    sql: 1.00*coalesce(${1s},0) / ${total_rating};;
    value_format: "0.0%"
    html: <p>{{rendered_value}} ({{derived_food_project.1s_user._rendered_value}})</p> ;;
  }

  measure: 2s_per {
    type: number
    sql: 1.00*coalesce(${2s},0) / ${total_rating};;
    value_format: "0.0%"
    html: <p>{{rendered_value}} ({{derived_food_project.2s_user._rendered_value}})</p> ;;
  }


  measure: 3s_per {
    type: number
    sql: 1.00*coalesce(${3s},0) / ${total_rating};;
    value_format: "0.0%"
    html: <p>{{rendered_value}} ({{derived_food_project.3s_user._rendered_value}})</p> ;;
  }

  measure: 4s_per {
    type: number
    sql: 1.00*coalesce(${4s},0) / ${total_rating};;
    value_format: "0.0%"
    html: <p>{{rendered_value}} ({{derived_food_project.4s_user._rendered_value}})</p> ;;
  }

  measure: 5s_per {
    type: number
    sql: 1.00*coalesce(${5s},0) / ${total_rating};;
    value_format: "0.0%"
    html: <p>{{rendered_value}} ({{derived_food_project.5s_user._rendered_value}})</p> ;;
  }

  measure: rating_per {
    type: number
    sql: 1.00*coalesce(${total_rating},0) / ${total_meals};;
    value_format: "0.0%"
  }


  measure: FPS {
    type: number
    sql: 1.00*coalesce((${5s}+${4s}) - (${1s}+${2s}),0) / ${total_rating};;
    value_format: "0.0%"
  }



}
