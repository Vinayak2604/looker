view: food_cost_items {
  sql_table_name: stanza.derived_food_cost_items;;

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: ingredient_name {
    type: string
    sql: ${TABLE}.ingredient_name ;;
  }

  # dimension: hostel_name {
  #   type: string
  #   sql: ${TABLE}.hostel_name ;;
  # }

  dimension: Vendor_master_id {
    type: string
    sql: ${TABLE}.Vendor_master_id ;;
  }

  dimension: total_qty_budget {
    type: number
    sql: ${TABLE}.total_qty ;;
  }

  dimension: res_sl_qty_budget {
    type: number
    sql: ${TABLE}.res_sl_qty ;;
  }

  dimension: non_sl_qty_budget {
    type: number
    sql: ${TABLE}.non_sl_qty ;;
  }

  dimension: effective_price_actual {
    type: number
    sql: ${TABLE}.effective_price ;;
  }

  dimension: qty_actual {
    type: number
    sql: ${TABLE}.qty ;;
  }


  measure: weighted_qty {
    type:number
    sql: sum(${effective_price_actual}*${qty_actual})/nullif(sum(${effective_price_actual}),0) ;;
  }



  }
