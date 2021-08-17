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
  dimension: Aug {
    type: number
    sql: ${TABLE}.aug ;;
  }
  dimension: paid_aug {
    type: number
    sql: ${TABLE}.paid_aug ;;
  }
  dimension: Sep {
    type: number
    sql: ${TABLE}.sep ;;
  }
  dimension: paid_sep {
    type: number
    sql: ${TABLE}.paid_sep ;;
  }
  dimension: Oct {
    type: number
    sql: ${TABLE}.oct ;;
  }
  dimension: paid_oct {
    type: number
    sql: ${TABLE}.paid_oct ;;
  }
  dimension: Nov {
    type: number
    sql: ${TABLE}.nov ;;
  }
  dimension: paid_nov {
    type: number
    sql: ${TABLE}.paid_nov ;;
  }
  dimension: Dec {
    type: number
    sql: ${TABLE}.dec ;;
  }
  dimension: paid_dec {
    type: number
    sql: ${TABLE}.paid_dec ;;
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

  measure: Jul_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${jul}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Jul_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_jul}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Jun_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${jun}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Jun_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_jun}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: May_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${may}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: May_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_may}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Apr_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${apr}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Apr_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_apr}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Mar_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${mar}/100000;;
    value_format: "0.00 \" L\""
  }
  measure: Mar_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_mar}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Feb_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${feb}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Feb_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_feb}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Aug_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Aug}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Aug_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_aug}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Sep_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Sep}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Sep_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_sep}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Oct_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Oct}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Oct_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_oct}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Nov_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Nov}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Nov_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_nov}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Dec_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${Dec}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Dec_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_dec}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Till_jan_Rent {
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${till_jan}/100000 ;;
    value_format: "0.00 \" L\""
  }
  measure: Till_Jan_Rent_Collected{
    type: sum
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: ${paid_till_jan}/100000 ;;
    value_format:  "0.00 \" L\""
  }
  measure: YTD_Rent {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql:( ${Jul_Rent} + ${Jun_Rent} + ${May_Rent} + ${Apr_Rent} + ${Mar_Rent} + ${Till_jan_Rent} + ${Feb_Rent}+${Aug_Rent}+${Sep_Rent}+${Oct_Rent}+${Nov_Rent}+${Dec_Rent})  ;;
    value_format: "0.00 \" L\""
  }
  measure: YTD_Rent_Collected{
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Jul_Rent_Collected} + ${Jun_Rent_Collected} + ${May_Rent_Collected} + ${Apr_Rent_Collected} + ${Mar_Rent_Collected} + ${Feb_Rent_Collected} + ${Till_Jan_Rent_Collected}+${Aug_Rent_Collected}+${Sep_Rent_Collected}+${Oct_Rent_Collected}+${Nov_Rent_Collected}+${Dec_Rent_Collected}) ;;
    value_format: "0.00 \" L\""
  }
   measure: YTD_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${YTD_Rent} - ${YTD_Rent_Collected});;
     value_format: "0.00 \" L\""
  }
   measure: Jul_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${Jul_Rent} - ${Jul_Rent_Collected}) ;;
     value_format: "0.00 \" L\""
  }
   measure: Jun_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${Jun_Rent} - ${Jun_Rent_Collected}) ;;
     value_format: "0.00 \" L\""
  }
   measure: May_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${May_Rent} - ${May_Rent_Collected}) ;;
     value_format: "0.00 \" L\""
  }
   measure: Apr_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Apr_Rent} - ${Apr_Rent_Collected}) ;;
   value_format: "0.00 \" L\""
   }
   measure: Mar_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${Mar_Rent} - ${Mar_Rent_Collected}) ;;
     value_format: "0.00 \" L\""
   }
   measure: Feb_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${Feb_Rent} - ${Feb_Rent_Collected});;
     value_format: "0.00 \" L\""
   }
  measure: Aug_pending {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Aug_Rent} - ${Aug_Rent_Collected});;
    value_format: "0.00 \" L\""
  }
  measure: Sep_pending {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Sep_Rent} - ${Sep_Rent_Collected});;
    value_format: "0.00 \" L\""
  }
  measure: Oct_pending {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Oct_Rent} - ${Oct_Rent_Collected});;
    value_format: "0.00 \" L\""
  }
  measure: Nov_pending {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Nov_Rent} - ${Nov_Rent_Collected});;
    value_format: "0.00 \" L\""
  }
  measure: Dec_pending {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: (${Dec_Rent} - ${Dec_Rent_Collected});;
    value_format: "0.00 \" L\""
  }
   measure: Till_Jan_pending {
     type: number
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: (${Till_jan_Rent} - ${Till_Jan_Rent_Collected}) ;;
    value_format: "0.00 \" L\""
   }
  parameter:  geographical_cuts {
    type: "string"
    allowed_value: {
      label: "residence"
      value: "residence"
    }
    allowed_value: {
      label: "micromarket"
      value: "micromarket"
    }
    allowed_value: {
      label: "city"
      value: "city"
    }
    allowed_value: {
      label: "zone"
      value: "Zone"
    }
  }

  dimension: goegraphy_selector {
    label_from_parameter: geographical_cuts
    sql:
            CASE
             WHEN {% parameter geographical_cuts %} = 'residence' THEN ${residence}
             WHEN {% parameter geographical_cuts %} = 'micromarket' THEN ${micromarket}
             WHEN {% parameter geographical_cuts %} = 'city' THEN ${city}
             WHEN {% parameter geographical_cuts %} = 'city' THEN ${zone}
             ELSE NULL
            END ;;
    drill_fields: [residence]
  }
     measure: YTD_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql:case when ((${till_jan}+${feb}+${mar}+${apr}+${may}+${jun}+${jul}+${Aug}+${Sep}+${Nov}+${Dec})
    - (${paid_till_jan}+${paid_feb}+${paid_mar}+${paid_apr}+${paid_jun}+${paid_jul}+${paid_may}+${paid_aug}+${paid_sep}+${paid_oct}+${paid_nov}+${paid_dec}))>0  then ${booking_id} else null end ;;
     value_format: "0"
 }
  measure: Aug_pending_res {
    type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when (${Aug} - ${paid_aug})>0 then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Sep_pending_res {
    type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when (${Sep} - ${paid_sep})>0 then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Oct_pending_res {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when (${Oct} - ${paid_oct})>0 then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Nov_pending_res {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when (${Nov} - ${paid_nov})>0 then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Dec_pending_res {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when (${Dec} - ${paid_dec})>0 then ${booking_id} else null end ;;
    value_format: "0"
  }
measure: Jul_pending_res {
type: count_distinct
#     # drill_fields: [payment_term_name, last_name, first_name]
sql: case when (${jul} - ${paid_jul})>0 then ${booking_id} else null end ;;
value_format: "0"
}
   measure: Jun_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${jun} - ${paid_jun})>0 then ${booking_id} else null end ;;
     value_format: "0"
 }
   measure: May_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${may} - ${paid_may})>0 then ${booking_id} else null end ;;
     value_format: "0"
   }
   measure: Apr_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${apr} - ${paid_apr})>0 then ${booking_id} else null end;;
     value_format: "0"
   }
   measure: Mar_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${mar} - ${paid_mar})>0 then ${booking_id} else null end ;;
     value_format: "0"
   }
   measure: Feb_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${feb} - ${paid_feb})>0 then ${booking_id} else null end;;
     value_format: "0"
   }
   measure: Till_Jan_pending_res {
     type: count_distinct
     # drill_fields: [payment_term_name, last_name, first_name]
     sql: case when (${till_jan} - ${paid_till_jan})>0 then ${booking_id} else null end ;;
     value_format: "0"
   }
  measure: Total_res {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql:${booking_id} ;;
    value_format: "0"
  }
  measure: Total_res_paid {
    type: number
    # drill_fields: [payment_term_name, last_name, first_name]
    sql:(${Total_res}-${YTD_pending_res}) ;;
    value_format: "0"
  }
}
