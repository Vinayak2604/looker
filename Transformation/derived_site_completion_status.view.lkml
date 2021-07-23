view: derived_site_completion_status {
  sql_table_name: stanza.derived_site_completion_status ;;

  dimension: acquisition_type {
    type: string
    sql: ${TABLE}.acquisition_type ;;
  }

  dimension: boq_value {
    type: number
    sql: ${TABLE}.boq_value ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: order_unit {
    type: string
    sql: ${TABLE}.order_unit ;;
  }

  dimension: particular {
    type: string
    sql: ${TABLE}.particular ;;
  }

  dimension: propery_name {
    type: string
    sql: ${TABLE}.propery_name ;;
  }

  dimension: total_boq {
    type: number
    sql: ${TABLE}.total_boq ;;
  }

  dimension: total_grn {
    type: number
    sql: ${TABLE}.total_grn ;;
  }

  dimension: total_grn_amount {
    type: number
    sql: ${TABLE}.total_grn_amount ;;
  }

  dimension: total_po {
    type: number
    sql: ${TABLE}.total_po ;;
  }

  dimension: total_po_amount {
    type: number
    sql: ${TABLE}.total_po_amount ;;
  }

  measure: count {
    type: count
    drill_fields: [category_name, propery_name, micromarket_name, city_name]
  }
}
