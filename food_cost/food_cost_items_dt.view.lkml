view: food_cost_items_dt {
  derived_table: {
    sql: select menu_date,vendor_id,vendor_master_id,vendor_name,ingredient_name,
       sum(total_qty) as budget_qty,
       sum(effective_price*qty)/sum(effective_price) as actual_qty,
       actual_qty/nullif(budget_qty,0) as delta_qty
    from stanza.derived_food_cost_items
    group by 1,2,3,4,5 ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_master_id {
    type: string
    sql: ${TABLE},vendor_master_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: budget_qty {
    type: number
    sql: ${TABLE}.budget_qty ;;
  }

  dimension: actual_qty {
    type: number
    sql: ${TABLE}.actual_qty ;;
  }

  dimension: delta_qty {
    type: number
    sql: ${TABLE}.delta_qty ;;
  }

  measure: blended_delta {
    type: number
    sql: sum(${actual_qty})/nullif(sum(case when ${delta_qty}>0 then ${budget_qty} else null end),0) ;;
  }

  # parameter:  date {
  #   # type: unquoted
  #   # allowed_value: {
  #   #   label: "L7D"
  #   #   value: "menu_date >=(current_date-7) and menu_date <current_date"
  #   # }
  #   # allowed_value: {
  #   #   label: "L8-14D"
  #   #   value: "menu_date >=(current_date-14) and menu_date <current_date-7"
  #   # }
  #   # allowed_value: {
  #   #   label: "L15-21D"
  #   #   value: "menu_date >=(current_date-21) and menu_date <current_date-14"
  #   # }
  #   # allowed_value: {
  #   #   label: "L22-28D"
  #   #   value: "menu_date >=(current_date-28) and menu_date <current_date-21"
  #   # }
  #   type: date
  #   convert_tz: no

  # }




  }
