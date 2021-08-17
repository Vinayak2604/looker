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

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
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
    value_format: "#,##0"
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
    link: {
      url: "/explore/central_projects/derived_food_invoice?fields=derived_food_invoice.item_count,derived_food_invoice.item_sub_category_label&f[derived_food_invoice.vendor_name]={{ value }}&f[derived_food_invoice.gsri_done_flag]=1&f[derived_food_invoice.po_created_date]=3+months&sorts=derived_food_invoice.item_count+desc&limit=500&vis=%7B%7D&filter_config=%7B%22derived_food_invoice.gsri_done_flag%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_invoice.po_created_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%223%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_subtotal_amount%22%2C%22based_on%22%3A%22derived_food_invoice.subtotal_amount%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Subtotal+Amount%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22max_of_total_consumption%22%2C%22based_on%22%3A%22consumption_in_kitchen.total_consumption%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Max+of+Total+Consumption%22%2C%22type%22%3A%22max%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%28%24%7Bsum_of_subtotal_amount%7D%2F%24%7Bmax_of_total_consumption%7D%29%2A100%2C2%29%22%2C%22label%22%3A%22%25age+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22age_contribution%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded"
      label: "Items"
    }
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      url: "/dashboards-next/39?Vendor%20Name= {{ value }}"
      label: "Vendor Details"
    }
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
   }

  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }

  measure: city_count {
    type: count_distinct
    sql: ${TABLE}.city_name ;;
  }

  measure: distinct_po {
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }

  measure: weighted_avg_lead_time {
    type: number
    sql: SUM(${TABLE}.subtotal_amount*${TABLE}.time_taken)/SUM(${TABLE}.subtotal_amount) ;;
    value_format: "0.00"
  }
}
