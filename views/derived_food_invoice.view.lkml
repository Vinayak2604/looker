view: derived_food_invoice {
  sql_table_name: stanza.derived_food_invoice ;;

  dimension: cancelled_flag {
    type: number
    sql: ${TABLE}.cancelled_flag ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: expired_po_flag {
    type: number
    sql: ${TABLE}.expired_po_flag ;;
  }

  dimension: gsri_done_flag {
    type: number
    sql: ${TABLE}.gsri_done_flag ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: item_category_label {
    type: string
    sql: ${TABLE}.item_category_label ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.item_uuid ;;
  }

  dimension: open_flag {
    type: number
    sql: ${TABLE}.open_flag ;;
  }

  dimension_group: po_completion {
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
    sql: ${TABLE}.po_completion_date ;;
  }

  dimension_group: po_created {
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
    sql: ${TABLE}.po_created_at ;;
  }

  dimension_group: po_end {
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
    sql: ${TABLE}.po_end_date ;;
  }

  dimension: po_expiry_days {
    type: number
    sql: ${TABLE}.po_expiry_days ;;
  }

  dimension: po_id {
    type: number
    sql: ${TABLE}.po_id ;;
    primary_key: yes
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: scope_of_work {
    type: string
    sql: ${TABLE}.scope_of_work ;;
  }

  dimension: subtotal_amount {
    type: number
    sql: ${TABLE}.subtotal_amount ;;
  }

  dimension: time_taken {
    type: number
    sql: case when po_completion_date is not null then datediff(day,po_created_at,po_completion_date) end ;;
  }

  dimension: unit_rate_rent_per_month {
    type: number
    sql: ${TABLE}.unit_rate_rent_per_month ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  # measure: count {
    # type: count
    # drill_fields: [item_name, vendor_name, city_name]
  # }

  measure: distinct_po {
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }

  measure: weighted_avg_lead_time {
    type: number
    sql: SUM(${TABLE}.subtotal_amount*${TABLE}.time_taken)/SUM(${TABLE}.subtotal_amount) ;;
  }
  measure: weighted_avg_price {
    type: number
    sql: SUM(${TABLE}.quantity*${TABLE}.unit_rate_rent_per_month)/SUM(${TABLE}.quantity) ;;
  }
}
