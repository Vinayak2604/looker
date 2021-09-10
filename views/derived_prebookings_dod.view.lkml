view: derived_prebookings_dod {
  derived_table: {
    sql: select *
      from stanza.derived_prebookings_dod
      where date = current_date
       ;;
  }

  parameter: date {
    type: date
    convert_tz: no
  }

  dimension: residence_id {
    type: number
    sql: ${TABLE}.residence_id ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
    drill_fields: [residence]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [micromarket,residence]
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
    drill_fields: [city,micromarket,residence]
  }

  dimension: residence_category {
    type: string
    sql: ${TABLE}.residence_category ;;
  }

  measure: live_beds {
    type: sum
    sql: ${TABLE}.live_beds ;;
    value_format: "#,##0"
    label: "Total Beds"
  }

  measure: forward_beds_sold {
    type: sum
    sql: ${TABLE}.forward_beds_sold ;;
    label: "Total Bookings"
  }

  measure: yesterday_bookings {
    type: sum
    sql: ${TABLE}.yesterday_bookings ;;
  }

  measure: l3d_bookings {
    type: sum
    sql: ${TABLE}.l3d_bookings ;;
  }

  measure: l7d_bookings {
    type: sum
    sql: ${TABLE}.l7d_bookings ;;
  }

  measure: l30d_bookings {
    type: sum
    sql: ${TABLE}.l30d_bookings ;;
  }

  measure: prebookings {
    type: sum
    sql: ${TABLE}.prebookings ;;
  }

  measure: refunded_prebookings {
    type: sum
    sql: ${TABLE}.refunded_prebookings ;;
  }

  measure: converted_prebookings {
    type: sum
    sql: ${TABLE}.converted_prebookings ;;
  }

  measure: yesterday_prebookings {
    type: sum
    sql: ${TABLE}.yesterday_prebookings ;;
  }

  measure: l3d_prebookings {
    type: sum
    sql: ${TABLE}.l3d_prebookings ;;
  }

  measure: l7d_prebookings {
    type: sum
    sql: ${TABLE}.l7d_prebookings ;;
  }

  measure: l30d_prebookings {
    type: sum
    sql: ${TABLE}.l30d_prebookings ;;
  }

  measure: effective_prebookings {
    type: number
    sql: ${prebookings} - ${refunded_prebookings} - ${converted_prebookings} ;;
    label: "Prebookings"
  }

  measure: projected_bookings {
    type: number
    sql: ${forward_beds_sold} + 0.5*${effective_prebookings} ;;
    value_format: "#,##0"
  }

  measure: projected_bookings_per {
    type: number
    sql: (${forward_beds_sold} + 0.5*${effective_prebookings})/nullif(${live_beds},0) ;;
    value_format: "0.0%"
  }

  measure: bookings_prebookings_per {
    type: number
    sql: (${forward_beds_sold} + ${effective_prebookings})/nullif(${live_beds},0) ;;
    value_format: "0.0%"
  }

  measure: unbooked_inventory {
    type: number
    sql: ${live_beds} - ${forward_beds_sold} ;;
    value_format: "#,##0"
  }

  measure: bookings_per {
    type: number
    sql: ${forward_beds_sold}/nullif(${live_beds},0) ;;
    value_format: "0.0%"
  }

  measure: prebookings_per {
    type: number
    sql: ${effective_prebookings}/nullif(${live_beds},0) ;;
    value_format: "0.0%"
  }

}
