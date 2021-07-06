view: derived_food_cost {
  sql_table_name: stanza.derived_food_cost ;;

  measure: actual_blended_order {
    type: number
    sql: ${TABLE}.actual_blended_order ;;
    value_format: "0"
  }

  measure: actual_cost {
    type: sum
    sql: (${TABLE}.actual_cost) ;;
    value_format: "0"
  }

  measure: actual_nonsl_blended_order {
    type: number
    sql: ${TABLE}.actual_nonsl_blended_order ;;
  }

  measure: actual_sl_blended_order {
    type: number
    sql: ${TABLE}.actual_sl_blended_order ;;
  }

  measure: breakfast_cost {
    type: number
    sql: ${TABLE}.breakfast_cost ;;
  }

  measure: breakfast_meal {
    type: number
    sql: ${TABLE}.breakfast_meal ;;
  }

  measure: breakfast_nonsl_cost {
    type: number
    sql: ${TABLE}.breakfast_nonsl_cost ;;
  }

  measure: breakfast_nonsl_orders {
    type: number
    sql: ${TABLE}.breakfast_nonsl_orders ;;
  }

  measure: breakfast_nonsl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_nonsl_price_1 ;;
  }

  measure: breakfast_orders {
    type: number
    sql: ${TABLE}.breakfast_orders ;;
  }

  measure: breakfast_price {
    type: number
    sql: ${TABLE}.breakfast_price ;;
  }

  measure: breakfast_price_1 {
    type: number
    sql: ${TABLE}.breakfast_price_1 ;;
  }

  measure: breakfast_rate {
    type: number
    sql: ${TABLE}.breakfast_rate ;;
  }

  measure: breakfast_sl_orders {
    type: number
    sql: ${TABLE}.breakfast_sl_orders ;;
  }

  measure: breakfast_sl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_sl_price_1 ;;
  }

  dimension: budget_blended_order {
    type: number
    sql: ${TABLE}.budget_blended_order ;;
  }

  measure: budget_cost {
    type: sum
    sql: ${TABLE}.budget_cost ;;
    value_format: "0"
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  measure: daily_cost {
    type: average
    sql: ${TABLE}.daily_cost ;;
    value_format: "0"
  }

  measure: dinner_cost {
    type: number
    sql: ${TABLE}.dinner_cost ;;
  }

  measure: dinner_meal {
    type: number
    sql: ${TABLE}.dinner_meal ;;
  }

  measure: dinner_nonsl_cost {
    type: number
    sql: ${TABLE}.dinner_nonsl_cost ;;
  }

  measure: dinner_nonsl_orders {
    type: number
    sql: ${TABLE}.dinner_nonsl_orders ;;
  }

  measure: dinner_nonsl_price_1 {
    type: number
    sql: ${TABLE}.dinner_nonsl_price_1 ;;
  }

  measure: dinner_orders {
    type: number
    sql: ${TABLE}.dinner_orders ;;
  }

  measure: dinner_price {
    type: number
    sql: ${TABLE}.dinner_price ;;
  }

  measure: dinner_price_1 {
    type: number
    sql: ${TABLE}.dinner_price_1 ;;
  }

  measure: dinner_rate {
    type: number
    sql: ${TABLE}.dinner_rate ;;
  }

  measure: dinner_sl_orders {
    type: number
    sql: ${TABLE}.dinner_sl_orders ;;
  }

  measure: dinner_sl_price_1 {
    type: number
    sql: ${TABLE}.dinner_sl_price_1 ;;
  }

  measure: es_cost {
    type: number
    sql: ${TABLE}.es_cost ;;
  }

  measure: es_meal {
    type: number
    sql: ${TABLE}.es_meal ;;
  }

  measure: es_nonsl_cost {
    type: number
    sql: ${TABLE}.es_nonsl_cost ;;
  }

  measure: es_nonsl_orders {
    type: number
    sql: ${TABLE}.es_nonsl_orders ;;
  }

  measure: es_nonsl_price_1 {
    type: number
    sql: ${TABLE}.es_nonsl_price_1 ;;
  }

  measure: es_orders {
    type: number
    sql: ${TABLE}.es_orders ;;
  }

  measure: es_price {
    type: number
    sql: ${TABLE}.es_price ;;
  }

  measure: es_price_1 {
    type: number
    sql: ${TABLE}.es_price_1 ;;
  }

  measure: es_rate {
    type: number
    sql: ${TABLE}.es_rate ;;
  }

  measure: es_sl_orders {
    type: number
    sql: ${TABLE}.es_sl_orders ;;
  }

  measure: es_sl_price_1 {
    type: number
    sql: ${TABLE}.es_sl_price_1 ;;
  }

  measure: food_margin {
    type: number
    sql: ${TABLE}.food_margin ;;
  }

  dimension: hostel_name {
    type: string
    sql: ${TABLE}.hostel_name ;;
  }

  measure: house_wise_actual_cost {
    type: sum
    sql: ${TABLE}.house_wise_actual_cost ;;
    value_format: "0"
  }

  measure: lunch_cost {
    type: number
    sql: ${TABLE}.lunch_cost ;;
  }

  measure: lunch_meal {
    type: number
    sql: ${TABLE}.lunch_meal ;;
  }

  measure: lunch_nonsl_cost {
    type: number
    sql: ${TABLE}.lunch_nonsl_cost ;;
  }

  measure: lunch_nonsl_orders {
    type: number
    sql: ${TABLE}.lunch_nonsl_orders ;;
  }

  measure: lunch_nonsl_price_1 {
    type: number
    sql: ${TABLE}.lunch_nonsl_price_1 ;;
  }

  measure: lunch_orders {
    type: number
    sql: ${TABLE}.lunch_orders ;;
  }

  measure: lunch_price {
    type: number
    sql: ${TABLE}.lunch_price ;;
  }

  measure: lunch_price_1 {
    type: number
    sql: ${TABLE}.lunch_price_1 ;;
  }

  measure: lunch_rate {
    type: number
    sql: ${TABLE}.lunch_rate ;;
  }

  measure: lunch_sl_orders {
    type: number
    sql: ${TABLE}.lunch_sl_orders ;;
  }

  measure: lunch_sl_price_1 {
    type: number
    sql: ${TABLE}.lunch_sl_price_1 ;;
  }

  measure: max_exp_cost {
    type: number
    sql: ${TABLE}.max_exp_cost ;;
  }

  dimension: mc_name {
    type: string
    sql: ${TABLE}.mc_name ;;
  }

  measure: menu_cost {
    type: sum
    sql: ${TABLE}.menu_cost ;;
    value_format: "0.0"
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

  measure: menu_nonsl_cost_1 {
    type: number
    sql: ${TABLE}.menu_nonsl_cost_1 ;;
  }

  measure: menu_price {
    type: number
    sql: ${TABLE}.menu_price ;;
  }

  measure: menu_price_1 {
    type: number
    sql: ${TABLE}.menu_price_1 ;;
  }

  measure: menu_rate {
    type: number
    sql: ${TABLE}.menu_rate ;;
    value_format: "0"
  }

  dimension: menu_type {
    type: string
    sql: ${TABLE}.menu_type ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  measure: nonsl_total_cost {
    type: number
    sql: ${TABLE}.nonsl_total_cost ;;
  }

  measure: packaging_cost {
    type: sum
    sql: ${TABLE}.packaging_cost ;;
    value_format: "0.0"
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
    primary_key: yes
  }

  dimension: sum_budget_cost {
    type: number
    sql: ${TABLE}.sum_budget_cost ;;
  }

  measure: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  measure: total_meal {
    type: number
    sql: ${TABLE}.total_meal ;;
  }

  measure: total_sl_cost {
    type: number
    sql: ${TABLE}.total_sl_cost ;;
  }

  measure: utility_cost {
    type: sum
    sql: ${TABLE}.utility_cost ;;
    value_format: "0.0"
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_master_id {
    type: string
    sql: ${TABLE}.vendor_master_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  measure: count {
    type: count
    drill_fields: [micromarket_name, hostel_name, mc_name, vendor_name]
  }
  measure: total_blended_order  {
    type: number
    sql: sum(${TABLE}.actual_blended_order)+sum(${TABLE}.actual_sl_blended_order) ;;
    value_format: "0"
  }
  measure: sl_budget {
    type: sum
    sql: (${TABLE}.actual_sl_blended_order)*(${TABLE}.menu_rate) ;;
    value_format: "0"
  }
  measure: resident_budget {
    type: sum
    sql: (${TABLE}.actual_blended_order)*(${TABLE}.menu_rate) ;;
    value_format: "0"
  }
  measure: total_budget {
    type: number
    sql: (${resident_budget})+(${sl_budget}) ;;
    value_format: "0"
  }
  measure: delta {
    type: number
    sql: sum(${TABLE}.house_wise_actual_cost)/nullif((${total_budget}),0) ;;
    value_format: "0.00"
  }
}
