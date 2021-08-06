view: food_cost_new {
  derived_table: {
    sql:select '1. Total' as scope,'1. Budget' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_rate as value
from stanza.derived_food_cost dfc

union

select '1. Total' as scope,'2. Actual' as parameter,menu_date,vendor_name, house_wise_actual_cost as value
from stanza.derived_food_cost dfc

union

select '1. Total' as scope,'3. Delta' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_rate - (house_wise_actual_cost) as value
from stanza.derived_food_cost dfc

union

select '2. COGS' as scope,'1. Budget' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_cost  as value
from stanza.derived_food_cost dfc

union

select '2. COGS' as scope,'2. Actual' as parameter,menu_date,vendor_name, house_wise_actual_cost_cogs as value
from stanza.derived_food_cost dfc

union

select '2. COGS' as scope,'3. Delta' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_cost - (house_wise_actual_cost_cogs) as value
from stanza.derived_food_cost dfc

union

select '3. Utility' as scope,'1. Budget' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*utility_cost  as value
from stanza.derived_food_cost dfc

union

select '3. Utility' as scope,'2. Actual' as parameter,menu_date,vendor_name, house_wise_actual_cost_util as value
from stanza.derived_food_cost dfc

union

select '3. Utility' as scope,'3. Delta' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*utility_cost - (house_wise_actual_cost_util) as value
from stanza.derived_food_cost dfc

union

select '4. Packaging' as scope,'1. Budget' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*packaging_cost  as value
from stanza.derived_food_cost dfc

union

select '4. Packaging' as scope,'2. Actual' as parameter,menu_date,vendor_name, house_wise_actual_cost_packaging as value
from stanza.derived_food_cost dfc

union

select '4. Packaging' as scope,'3. Delta' as parameter,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*packaging_cost - (house_wise_actual_cost_packaging) as value
from stanza.derived_food_cost dfc

;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: parameter {
    type: string
    sql: ${TABLE}.parameter ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: menu_date_lw {
    type: string
    sql: ${TABLE}.menu_date ;;
    html: {{ rendered_value | date: "%d-%b" }} ;;
  }


  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  measure: l7d {
    type: number
    sql: sum(case when ${menu_date}<current_date and ${menu_date}>=current_date-7 then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l7d_14d {
    type: number
    sql: sum(case when ${menu_date}<current_date-7 and ${menu_date}>=current_date-14 then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l14d_21d {
    type: number
    sql: sum(case when ${menu_date}<current_date-14 and ${menu_date}>=current_date-21 then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l21d_28d {
    type: number
    sql: sum(case when ${menu_date}<current_date-21 and ${menu_date}>=current_date-28 then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: value_sum {
    type: number
    sql: sum(${TABLE}.value) ;;
    value_format: "#,##0"
  }

}
