view: derived_b2c_bookings {
  sql_table_name: looker_demo.derived_b2c_bookings ;;

  dimension: admin_charges {
    type: number
    sql: ${TABLE}.admin_charges ;;
  }

  dimension: advance_rental_months {
    type: number
    sql: ${TABLE}.advance_rental_months ;;
  }

  dimension: bc_monthly_rental_net_of_discount {
    type: number
    sql: ${TABLE}.bc_monthly_rental_net_of_discount ;;
  }

  dimension: beds {
    type: number
    sql: ${TABLE}.beds ;;
  }

  measure: total_beds {
    type: sum
    sql: ${beds} ;;
  }

  measure: count_of_beds {
    type: number
    sql: COUNT(${beds}) ;;
  }

  dimension: booking_id {
    type: number
    sql: ${TABLE}.booking_id ;;
  }

  dimension: booking_status {
    type: string
    sql: ${TABLE}.booking_status ;;
  }

  dimension: booking_type {
    type: number
    sql: ${TABLE}.booking_type ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: college_name {
    type: string
    sql: ${TABLE}.college_name ;;
  }

  dimension_group: contract_start {
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
    sql: ${TABLE}.contract_start_date ;;
  }

  dimension: contract_tenure {
    type: number
    sql: ${TABLE}.contract_tenure ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: effective_contract_end {
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
    sql: ${TABLE}.effective_contract_end_date ;;
  }

  dimension: effective_contract_revenue {
    type: number
    sql: ${TABLE}.effective_contract_revenue ;;
  }

  dimension: food_service_price {
    type: number
    sql: ${TABLE}.food_service_price ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lock_in_months {
    type: number
    sql: ${TABLE}.lock_in_months ;;
  }

  dimension: locked_in_tenure_rental_revenue {
    type: number
    sql: ${TABLE}.locked_in_tenure_rental_revenue ;;
  }

  dimension: mandatory_service_price {
    type: number
    sql: ${TABLE}.mandatory_service_price ;;
  }

  dimension: mentainance_fee_selection_id {
    type: string
    sql: ${TABLE}.mentainance_fee_selection_id ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: monthly_amc_mentainance_fee {
    type: number
    sql: ${TABLE}.monthly_amc_mentainance_fee ;;
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

  dimension: net_upsell_downsell {
    type: number
    sql: ${TABLE}.net_upsell_downsell ;;
  }

  dimension: non_refundable_security {
    type: number
    sql: ${TABLE}.non_refundable_security ;;
  }

  dimension: ops_residence_id {
    type: string
    sql: ${TABLE}.ops_residence_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: property_category {
    type: string
    sql: ${TABLE}.property_category ;;
  }

  dimension: refundable_security {
    type: number
    sql: ${TABLE}.refundable_security ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: room_price {
    type: number
    sql: ${TABLE}.room_price ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: underwritten_price {
    type: number
    sql: ${TABLE}.underwritten_price ;;
  }

  dimension: value_applied {
    type: number
    sql: ${TABLE}.value_applied ;;
  }

  measure: count {
    type: count
    drill_fields: [college_name]
  }
}
