view: derived_dish_feedback {
  sql_table_name: looker_demo.derived_dish_feedback ;;

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: b2b_booking_flag {
    type: number
    sql: ${TABLE}.b2b_booking_flag ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: dish {
    type: string
    sql: ${TABLE}.dish ;;
  }

  dimension: educational_institution {
    type: string
    sql: ${TABLE}.educational_institution ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: home_city {
    type: string
    sql: ${TABLE}.home_city ;;
  }

  dimension: home_state {
    type: string
    sql: ${TABLE}.home_state ;;
  }

  dimension: home_region {
    type: string
    sql: ${TABLE}.home_region ;;
  }

  dimension: kitchen {
    type: string
    sql: ${TABLE}.kitchen ;;
  }

  dimension: meal {
    type: string
    sql: ${TABLE}.meal ;;
  }

  dimension_group: menu {
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
    sql: ${TABLE}.menu_date ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: monthly_rent {
    type: number
    sql: ${TABLE}.monthly_rent ;;
  }

  dimension_group: move_in {
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
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: profession {
    type: string
    sql: ${TABLE}.profession ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name, name]
  }

  measure: avg_rating {
    type: average
    sql: ${rating} ;;
  }

  measure: menu {
    type: string
    sql: group_concat(distinct ${dish} SEPARATOR' | ') ;;
  }

}
