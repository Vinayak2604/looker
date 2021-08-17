view: derived_sales_summary_1 {
  sql_table_name: stanza.derived_sales_summary ;;

  dimension: adjusted_live_occupancy {
    type: number
    sql: ${TABLE}.adjusted_live_occupancy ;;
  }

  dimension: beds_cs_nmi {
    type: number
    sql: ${TABLE}.beds_cs_nmi ;;
  }

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_lat {
    type: string
    sql: ${TABLE}.city_lat ;;
  }

  dimension: city_long {
    type: string
    sql: ${TABLE}.city_long ;;
  }

  dimension: converted_prebookings {
    type: number
    sql: ${TABLE}.converted_prebookings ;;
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

  dimension: forward_beds_sold {
    type: number
    sql: ${TABLE}.forward_beds_sold ;;
  }

  dimension: forward_gross_occupancy {
    type: number
    sql: ${TABLE}.forward_gross_occupancy ;;
  }

  dimension: forward_net_occupancy {
    type: number
    sql: ${TABLE}.forward_net_occupancy ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: live_bookings {
    type: number
    sql: ${TABLE}.live_bookings ;;
  }

  dimension: live_monthly_rent {
    type: number
    sql: ${TABLE}.live_monthly_rent ;;
  }

  dimension: live_occupancy {
    type: number
    sql: ${TABLE}.live_occupancy ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: net_monthly_rent {
    type: number
    sql: ${TABLE}.net_monthly_rent ;;
  }

  dimension: onboarded_beds {
    type: number
    sql: ${TABLE}.onboarded_beds ;;
  }

  dimension: prebookings {
    type: number
    sql: ${TABLE}.prebookings ;;
  }

  dimension: refunded_prebookings {
    type: number
    sql: ${TABLE}.refunded_prebookings ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: upcoming_move_ins {
    type: number
    sql: ${TABLE}.upcoming_move_ins ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
