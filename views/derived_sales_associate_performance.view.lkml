view: derived_sales_associate_performance {
  sql_table_name: stanza.derived_sales_associate_performance ;;

  dimension: access_level_entity_uuids {
    type: string
    sql: ${TABLE}.access_level_entity_uuids ;;
  }

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }

  dimension: calls_completed {
    type: number
    sql: ${TABLE}.calls_completed ;;
  }

  dimension: calls_completed_in_tat {
    type: number
    sql: ${TABLE}.calls_completed_in_tat ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: drop {
    type: number
    sql: ${TABLE}.drop ;;
  }

  dimension: drop_after_visit {
    type: number
    sql: ${TABLE}.drop_after_visit ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: moved_up {
    type: number
    sql: ${TABLE}.moved_up ;;
  }

  dimension: number_of_agents {
    type: number
    sql: ${TABLE}.number_of_agents ;;
  }

  dimension: pre_booking {
    type: number
    sql: ${TABLE}.pre_booking ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: target_per_residence {
    type: number
    sql: ${TABLE}.target_per_residence ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: visits_completed {
    type: number
    sql: ${TABLE}.visits_completed ;;
  }

  dimension: visits_in_tat {
    type: number
    sql: ${TABLE}.visits_in_tat ;;
  }

  measure: total_booking {
    type: sum
    sql: ${bookings} ;;
  }

  measure: target {
    type: sum
    sql:  case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence} end;;
  }

  measure: Visits_Completed_in_TAT {
    type: max
    sql: ${visits_in_tat} ;;
  }

  measure: count {
    type: count
    drill_fields: [residence_name]
  }
}
