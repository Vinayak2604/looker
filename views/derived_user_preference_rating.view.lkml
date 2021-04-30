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
    drill_fields: [phone]
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

  measure: uniqe_preference_users_L7D {
    type: count_distinct
    sql: case when ${item_base_preference} = true and ${TABLE}.date >=  date(CURDATE()-7) then ${user_id} end;;
  }
  measure: total_uniqe_users_L7D {
    type: count_distinct
    sql: case when ${TABLE}.date >=  date(CURDATE()-7) then ${user_id} end;;
  }
  measure: orders_with_preference {
    type: count_distinct
    sql: case when ${item_base_preference} = true then ${id} end;;
  }

}
