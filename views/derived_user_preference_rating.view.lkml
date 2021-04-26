view: derived_user_preference_rating {
  sql_table_name: looker_demo.derived_user_preference_rating ;;
  drill_fields: [id]

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
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: moved_in_residents {
    type: number
    sql: ${TABLE}.moved_in_residents ;;
  }

  dimension: rating {
    type: yesno
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

  measure: count {
    type: count
    drill_fields: [id]
  }
  measure: avg_rating {
    type: average
    sql: case when ${rating} >0 and ${rating} <= 5 then ${rating} end;;
  }
}
