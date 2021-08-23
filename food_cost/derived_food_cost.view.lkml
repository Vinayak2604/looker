view: derived_food_cost {
  sql_table_name: stanza.derived_food_cost ;;

  dimension: actual_blended_order {
    type: number
    sql: ${TABLE}.actual_blended_order ;;
  }

  dimension: actual_nonsl_blended_order {
    type: number
    sql: ${TABLE}.actual_nonsl_blended_order ;;
  }

  dimension: actual_sl_blended_order {
    type: number
    sql: ${TABLE}.actual_sl_blended_order ;;
  }

  dimension: breakfast_cost {
    type: number
    sql: ${TABLE}.breakfast_cost ;;
  }

  dimension: breakfast_meal {
    type: number
    sql: ${TABLE}.breakfast_meal ;;
  }

  dimension: breakfast_nonsl_cost {
    type: number
    sql: ${TABLE}.breakfast_nonsl_cost ;;
  }

  dimension: breakfast_nonsl_orders {
    type: number
    sql: ${TABLE}.breakfast_nonsl_orders ;;
  }

  dimension: breakfast_nonsl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_nonsl_price_1 ;;
  }

  dimension: breakfast_orders {
    type: number
    sql: ${TABLE}.breakfast_orders ;;
  }

  dimension: breakfast_price {
    type: number
    sql: ${TABLE}.breakfast_price ;;
  }

  dimension: breakfast_price_1 {
    type: number
    sql: ${TABLE}.breakfast_price_1 ;;
  }

  dimension: breakfast_rate {
    type: number
    sql: ${TABLE}.breakfast_rate ;;
  }

  dimension: breakfast_sl_orders {
    type: number
    sql: ${TABLE}.breakfast_sl_orders ;;
  }

  dimension: breakfast_sl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_sl_price_1 ;;
  }

  dimension: budget_blended_order {
    type: number
    sql: ${TABLE}.budget_blended_order ;;
  }

  dimension: budget_cost {
    type: number
    sql: ${TABLE}.budget_cost ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: dinner_cost {
    type: number
    sql: ${TABLE}.dinner_cost ;;
  }

  dimension: dinner_meal {
    type: number
    sql: ${TABLE}.dinner_meal ;;
  }

  dimension: dinner_nonsl_cost {
    type: number
    sql: ${TABLE}.dinner_nonsl_cost ;;
  }

  dimension: dinner_nonsl_orders {
    type: number
    sql: ${TABLE}.dinner_nonsl_orders ;;
  }

  dimension: dinner_nonsl_price_1 {
    type: number
    sql: ${TABLE}.dinner_nonsl_price_1 ;;
  }

  dimension: dinner_orders {
    type: number
    sql: ${TABLE}.dinner_orders ;;
  }

  dimension: dinner_price {
    type: number
    sql: ${TABLE}.dinner_price ;;
  }

  dimension: dinner_price_1 {
    type: number
    sql: ${TABLE}.dinner_price_1 ;;
  }

  dimension: dinner_rate {
    type: number
    sql: ${TABLE}.dinner_rate ;;
  }

  dimension: dinner_sl_orders {
    type: number
    sql: ${TABLE}.dinner_sl_orders ;;
  }

  dimension: dinner_sl_price_1 {
    type: number
    sql: ${TABLE}.dinner_sl_price_1 ;;
  }

  dimension: es_cost {
    type: number
    sql: ${TABLE}.es_cost ;;
  }

  dimension: es_meal {
    type: number
    sql: ${TABLE}.es_meal ;;
  }

  dimension: es_nonsl_cost {
    type: number
    sql: ${TABLE}.es_nonsl_cost ;;
  }

  dimension: es_nonsl_orders {
    type: number
    sql: ${TABLE}.es_nonsl_orders ;;
  }

  dimension: es_nonsl_price_1 {
    type: number
    sql: ${TABLE}.es_nonsl_price_1 ;;
  }

  dimension: es_orders {
    type: number
    sql: ${TABLE}.es_orders ;;
  }

  dimension: es_price {
    type: number
    sql: ${TABLE}.es_price ;;
  }

  dimension: es_price_1 {
    type: number
    sql: ${TABLE}.es_price_1 ;;
  }

  dimension: es_rate {
    type: number
    sql: ${TABLE}.es_rate ;;
  }

  dimension: es_sl_orders {
    type: number
    sql: ${TABLE}.es_sl_orders ;;
  }

  dimension: es_sl_price_1 {
    type: number
    sql: ${TABLE}.es_sl_price_1 ;;
  }

  dimension: food_margin {
    type: number
    sql: ${TABLE}.food_margin ;;
  }

  dimension: hostel_name {
    type: string
    sql: ${TABLE}.hostel_name ;;
  }

  dimension: house_wise_actual_cost {
    type: number
    sql: ${TABLE}.house_wise_actual_cost ;;
  }

  dimension: house_wise_actual_cost_cogs {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_cogs ;;
  }

  dimension: house_wise_actual_cost_packaging {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_packaging ;;
  }

  dimension: house_wise_actual_cost_util {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_util ;;
  }

  dimension: lunch_cost {
    type: number
    sql: ${TABLE}.lunch_cost ;;
  }

  dimension: lunch_meal {
    type: number
    sql: ${TABLE}.lunch_meal ;;
  }

  dimension: lunch_nonsl_cost {
    type: number
    sql: ${TABLE}.lunch_nonsl_cost ;;
  }

  dimension: lunch_nonsl_orders {
    type: number
    sql: ${TABLE}.lunch_nonsl_orders ;;
  }

  dimension: lunch_nonsl_price_1 {
    type: number
    sql: ${TABLE}.lunch_nonsl_price_1 ;;
  }

  dimension: lunch_orders {
    type: number
    sql: ${TABLE}.lunch_orders ;;
  }

  dimension: lunch_price {
    type: number
    sql: ${TABLE}.lunch_price ;;
  }

  dimension: lunch_price_1 {
    type: number
    sql: ${TABLE}.lunch_price_1 ;;
  }

  dimension: lunch_rate {
    type: number
    sql: ${TABLE}.lunch_rate ;;
  }

  dimension: lunch_sl_orders {
    type: number
    sql: ${TABLE}.lunch_sl_orders ;;
  }

  dimension: lunch_sl_price_1 {
    type: number
    sql: ${TABLE}.lunch_sl_price_1 ;;
  }

  dimension: max_rn {
    type: number
    sql: ${TABLE}.max_rn ;;
  }

  dimension: mc_name {
    type: string
    sql: ${TABLE}.mc_name ;;
  }

  dimension: menu_cost {
    type: number
    sql: ${TABLE}.menu_cost ;;
  }

  dimension_group: menu {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: menu_nonsl_cost_1 {
    type: number
    sql: ${TABLE}.menu_nonsl_cost_1 ;;
  }

  dimension: menu_price {
    type: number
    sql: ${TABLE}.menu_price ;;
  }

  dimension: menu_price_1 {
    type: number
    sql: ${TABLE}.menu_price_1 ;;
  }

  dimension: menu_rate {
    type: number
    sql: ${TABLE}.menu_rate ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: non_sl_kitchen_orders {
    type: number
    sql: ${TABLE}.non_sl_kitchen_orders ;;
  }

  dimension: non_sl_kitchen_price {
    type: number
    sql: ${TABLE}.non_sl_kitchen_price ;;
  }

  dimension: nonsl_total_cost {
    type: number
    sql: ${TABLE}.nonsl_total_cost ;;
  }

  dimension: packaging_cost {
    type: number
    sql: ${TABLE}.packaging_cost ;;
  }

  dimension: res_and_sl_orders {
    type: number
    sql: ${TABLE}.res_and_sl_orders ;;
  }

  dimension: sl_kitchen_orders {
    type: number
    sql: ${TABLE}.sl_kitchen_orders ;;
  }

  dimension: sl_kitchen_price {
    type: number
    sql: ${TABLE}.sl_kitchen_price ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: total_meal {
    type: number
    sql: ${TABLE}.total_meal ;;
  }

  dimension: total_sl_cost {
    type: number
    sql: ${TABLE}.total_sl_cost ;;
  }

  dimension: utility_cost {
    type: number
    sql: ${TABLE}.utility_cost ;;
  }

  dimension: vendor_master_id {
    type: string
    sql: ${TABLE}.vendor_master_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: vendor_name_kv {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }


  measure: count {
    type: count
    drill_fields: [micromarket_name, hostel_name, mc_name, vendor_name]
  }

  measure: delta_ratio_total {
    type: number
    sql: sum(${house_wise_actual_cost})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_rate}),0) ;;
  }

  measure: delta_ratio_cogs {
    type: number
    sql: sum(${house_wise_actual_cost_cogs})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_cost}),0) ;;
  }

  measure: delta_ratio_util {
    type: number
    sql: sum(${house_wise_actual_cost_util})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${utility_cost}),0) ;;
  }

  measure: delta_ratio_packaging {
    type: number
    sql: sum(${house_wise_actual_cost_packaging})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${packaging_cost}),0) ;;
  }



}
