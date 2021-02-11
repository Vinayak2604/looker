view: derived_residence_attributes {
  sql_table_name: looker_demo.derived_residence_attributes ;;

  dimension: available_beds {
    type: number
    sql: ${TABLE}.available_beds ;;
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

  dimension: dead_beds {
    type: number
    sql: ${TABLE}.dead_beds ;;
  }

  dimension: early_exits {
    type: number
    sql: ${TABLE}.early_exits ;;
  }

  dimension: future_move_ins {
    type: number
    sql: ${TABLE}.future_move_ins ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: not_moved_in {
    type: number
    sql: ${TABLE}.not_moved_in ;;
  }

  dimension: onboarded_beds {
    type: number
    sql: ${TABLE}.onboarded_beds ;;
  }

  dimension: ops_residence_id {
    type: string
    sql: ${TABLE}.ops_residence_id ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: sold_beds {
    type: number
    sql: ${TABLE}.sold_beds ;;
  }

  dimension: underwritten_price {
    type: number
    sql: ${TABLE}.underwritten_price ;;
  }

  dimension: underwritten_pricing_incl_gst {
    type: number
    sql: ${TABLE}.underwritten_pricing_incl_gst ;;
  }

  dimension: prebookings {
    type: number
    sql: ${TABLE}.prebookings ;;
  }

  dimension: refunded_prebookings {
    type: number
    sql: ${TABLE}.refunded_prebookings ;;
  }

  dimension: converted_prebookings {
    type: number
    sql: ${TABLE}.converted_prebookings ;;
  }

  measure: count {
    type: count
  }

  measure: total_beds {
    type: sum
    sql: ${live_beds} ;;
    filters: [date_date: "today"]
  }

  measure: total_sold_beds {
    type: sum
    sql: ${sold_beds} ;;
    filters: [date_date: "today"]
  }

  measure: total_onboarded_beds {
    type: sum
    sql: ${onboarded_beds} ;;
    filters: [date_date: "today"]
  }

  measure: total_early_exits {
    type: sum
    sql: ${early_exits} ;;
    filters: [date_date: "today"]
  }

  measure: total_future_move_ins {
    type: sum
    sql: ${future_move_ins} ;;
    filters: [date_date: "today"]
  }

  measure: total_not_moved_ins {
    type: sum
    sql: ${not_moved_in} ;;
    filters: [date_date: "today"]
  }

  measure: total_available_beds {
    type: sum
    sql: ${available_beds} ;;
    filters: [date_date: "today"]
  }

  measure: total_underwritten {
    type: sum
    sql: ${underwritten_price} ;;
    filters: [date_date: "today"]
  }

  measure: total_prebookings {
    type: sum
    sql: ${prebookings} ;;
    filters: [date_date: "today"]
  }


  measure: total_refunded_prebookings {
    type: sum
    sql: ${prebookings} ;;
    filters: [date_date: "today"]
  }


  measure: total_converted_prebookings {
    type: sum
    sql: ${prebookings} ;;
    filters: [date_date: "today"]
  }

}
