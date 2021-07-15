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

  measure: Jul_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${jul} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Jul_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_jul} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Jun_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${jun} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Jun_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_jun} ;;
    value_format: "0.0,,\" M\""
  }
  measure: May_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${may} ;;
    value_format: "0.0,,\" M\""
  }
  measure: May_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_may} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Apr_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${apr} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Apr_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_apr} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Mar_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${mar} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Mar_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_mar} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Feb_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${feb} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Feb_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_feb} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Till_jan_Invoices {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${till_jan} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Till_Jan_Paid{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_till_jan} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Total_Invoices {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Jul_Invoices} + ${Jun_Invoices} + ${May_Invoices} + ${Apr_Invoices} + ${Mar_Invoices} + ${Till_jan_Invoices} + ${Feb_Invoices} ;;
    value_format: "0.0,,\" M\""
  }
  measure: Total_Paid{
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Jul_Paid} + ${Jun_Paid} + ${May_Paid} + ${Apr_Paid} + ${Mar_Paid} + ${Feb_Paid} + ${Till_Jan_Paid} ;;
    value_format: "0.0,,\" M\""
  }
}
