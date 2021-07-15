view: derived_rent_collection {
  sql_table_name: stanza.derived_rent_collection ;;

  dimension_group: actual_contract_end {
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
    sql: ${TABLE}.actual_contract_end_date ;;
  }

  dimension: admin_charges {
    type: number
    sql: ${TABLE}.admin_charges ;;
  }

  dimension: advance_rental {
    type: number
    sql: ${TABLE}.advance_rental ;;
  }

  dimension: advance_rental_months {
    type: number
    sql: ${TABLE}.advance_rental_months ;;
  }

  dimension: apr {
    type: number
    sql: ${TABLE}.apr ;;
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

  dimension: cgst {
    type: number
    sql: ${TABLE}.cgst ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: contract_end {
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
    sql: ${TABLE}.contract_end_date ;;
  }

  dimension: contract_months {
    type: number
    sql: ${TABLE}.contract_months ;;
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

  dimension: feb {
    type: number
    sql: ${TABLE}.feb ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: food_service_gst {
    type: number
    sql: ${TABLE}.food_service_gst ;;
  }

  dimension: food_service_price {
    type: number
    sql: ${TABLE}.food_service_price ;;
  }

  dimension: jul {
    type: number
    sql: ${TABLE}.jul ;;
  }

  dimension: jun {
    type: number
    sql: ${TABLE}.jun ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: mandatory_service_price {
    type: number
    sql: ${TABLE}.mandatory_service_price ;;
  }

  dimension: mar {
    type: number
    sql: ${TABLE}.mar ;;
  }

  dimension: may {
    type: number
    sql: ${TABLE}.may ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: non_refundable_security {
    type: number
    sql: ${TABLE}.non_refundable_security ;;
  }

  dimension: optional_service_price {
    type: number
    sql: ${TABLE}.optional_service_price ;;
  }

  dimension: paid_apr {
    type: number
    sql: ${TABLE}.paid_apr ;;
  }

  dimension: paid_feb {
    type: number
    sql: ${TABLE}.paid_feb ;;
  }

  dimension: paid_jul {
    type: number
    sql: ${TABLE}.paid_jul ;;
  }

  dimension: paid_jun {
    type: number
    sql: ${TABLE}.paid_jun ;;
  }

  dimension: paid_mar {
    type: number
    sql: ${TABLE}.paid_mar ;;
  }

  dimension: paid_may {
    type: number
    sql: ${TABLE}.paid_may ;;
  }

  dimension: paid_till_jan {
    type: number
    sql: ${TABLE}.paid_till_jan ;;
  }

  dimension: payment_term_name {
    type: string
    sql: ${TABLE}.payment_term_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: room_price {
    type: number
    sql: ${TABLE}.room_price ;;
  }

  dimension: security_deposit {
    type: number
    sql: ${TABLE}.security_deposit ;;
  }

  dimension: sgst {
    type: number
    sql: ${TABLE}.sgst ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: till_jan {
    type: number
    sql: ${TABLE}.till_jan ;;
  }

  dimension: total_payment {
    type: number
    sql: ${TABLE}.total_payment ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: [payment_term_name, last_name, first_name]
  }

  measure: count_of_students {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${total_payment} ;;
  }
}
