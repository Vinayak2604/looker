view: food_cost_new {
  derived_table: {
    sql:select 1 as rank_scope,'Total' as scope,1 as rank_para,'Budget' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_rate as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 1 as rank_scope,'Total' as scope,2 as rank_para,'Actual' as parameter,'Sum' as value_field,menu_date,vendor_name, house_wise_actual_cost as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 1 as rank_scope,'Total' as scope,3 as rank_para,'Delta' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_rate - (house_wise_actual_cost) as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 1 as rank_scope,'Total' as scope,4 as rank_para,'Budget - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, menu_rate*(actual_blended_order+actual_sl_blended_order) as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 1 as rank_scope,'Total' as scope,5 as rank_para,'Actual - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, house_wise_actual_cost as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 2 as rank_scope,'COGS' as scope,1 as rank_para,'Budget' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_cost  as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 2 as rank_scope,'COGS' as scope,2 as rank_para,'Actual' as parameter,'Sum' as value_field,menu_date,vendor_name, house_wise_actual_cost_cogs as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 2 as rank_scope,'COGS' as scope,3 as rank_para,'Delta' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_cost - (house_wise_actual_cost_cogs) as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 2 as rank_scope,'COGS' as scope,4 as rank_para,'Budget - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*menu_cost as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 2 as rank_scope,'COGS' as scope,5 as rank_para,'Actual - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, house_wise_actual_cost_cogs as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 3 as rank_scope,'Utility' as scope,1 as rank_para,'Budget' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*utility_cost  as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 3 as rank_scope,'Utility' as scope,2 as rank_para,'Actual' as parameter,'Sum' as value_field,menu_date,vendor_name, house_wise_actual_cost_util as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 3 as rank_scope,'Utility' as scope,3 as rank_para,'Delta' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*utility_cost - (house_wise_actual_cost_util) as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 3 as rank_scope,'Utility' as scope,4 as rank_para,'Budget - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*utility_cost as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 3 as rank_scope,'Utility' as scope,5 as rank_para,'Actual - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, house_wise_actual_cost_util as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 4 as rank_scope,'Packaging' as scope,1 as rank_para,'Budget' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*packaging_cost  as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 4 as rank_scope,'Packaging' as scope,2 as rank_para,'Actual' as parameter,'Sum' as value_field,menu_date,vendor_name, house_wise_actual_cost_packaging as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 4 as rank_scope,'Packaging' as scope,3 as rank_para,'Delta' as parameter,'Sum' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*packaging_cost - (house_wise_actual_cost_packaging) as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 4 as rank_scope,'Packaging' as scope,4 as rank_para,'Budget - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, (actual_blended_order+actual_sl_blended_order)*packaging_cost as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

union

select 4 as rank_scope,'Packaging' as scope,5 as rank_para,'Actual - INR/Blended Order' as parameter,'Avg' as value_field,menu_date,vendor_name, house_wise_actual_cost_packaging as value,(actual_blended_order+actual_sl_blended_order) as bo
from stanza.derived_food_cost dfc

;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: rank_scope {
    type: string
    sql: ${TABLE}.rank_scope ;;
  }

  dimension: rank_para {
    type: string
    sql: ${TABLE}.rank_para ;;
  }

  dimension: parameter {
    type: string
    sql: ${TABLE}.parameter ;;
  }

  dimension: value_field {
    type: string
    sql: ${TABLE}.value_field ;;
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

  measure: l7d_sum {
    type: number
    sql:sum(case when ${menu_date}<current_date and ${menu_date}>=current_date-7 and ${value_field}='Sum' then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l7d_avg {
    type: number
    sql:sum(case when ${menu_date}<current_date and ${menu_date}>=current_date-7 and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when ${menu_date}<current_date and ${menu_date}>=current_date-7 and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0);;
    value_format: "#,##0"
  }


  measure: l7d_14d_sum {
    type: number
    sql: sum(case when ${menu_date}<current_date-7 and ${menu_date}>=current_date-14 and ${value_field}='Sum' then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l7d_14d_avg {
    type: number
    sql:sum(case when ${menu_date}<current_date-7 and ${menu_date}>=current_date-14 and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when ${menu_date}<current_date-7 and ${menu_date}>=current_date-14 and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0);;
    value_format: "#,##0"
  }


  # measure: l14d_21d {
  #   type: number
  #   sql: sum(case when ${menu_date}<current_date-14 and ${menu_date}>=current_date-21 then ${TABLE}.value else 0 end);;
  #   value_format: "#,##0"
  # }

  measure: l14d_21d_sum {
    type: number
    sql: sum(case when ${menu_date}<current_date-14 and ${menu_date}>=current_date-21 and ${value_field}='Sum' then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l14d_21d_avg {
    type: number
    sql: sum(case when ${menu_date}<current_date-14 and ${menu_date}>=current_date-21 and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when ${menu_date}<current_date-14 and ${menu_date}>=current_date-21 and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0);;
    value_format: "#,##0"
  }


  # measure: l21d_28d {
  #   type: number
  #   sql: sum(case when ${menu_date}<current_date-21 and ${menu_date}>=current_date-28 then ${TABLE}.value else 0 end);;
  #   value_format: "#,##0"
  # }

  measure: l21d_28d_sum {
    type: number
    sql: sum(case when ${menu_date}<current_date-21 and ${menu_date}>=current_date-28 and ${value_field}='Sum' then ${TABLE}.value else 0 end);;
    value_format: "#,##0"
  }

  measure: l21d_28d_avg {
    type: number
    sql: sum(case when ${menu_date}<current_date-21 and ${menu_date}>=current_date-28 and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when ${menu_date}<current_date-21 and ${menu_date}>=current_date-28 and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0);;
    value_format: "#,##0"
  }


  # measure: MTD {
  #   type: number
  #   sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date) and date_part(year,${menu_date})=date_part(year,current_date) then ${TABLE}.value else 0 end) ;;
  #   value_format: "#,##0"
  # }

  measure: MTD_sum {
    type: number
    sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date) and date_part(year,${menu_date})=date_part(year,current_date) and ${value_field}='Sum' then ${TABLE}.value else 0 end) ;;
    value_format: "#,##0"
  }

  measure: MTD_avg {
    type: number
    sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date) and date_part(year,${menu_date})=date_part(year,current_date) and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when date_part(mon,${menu_date})=date_part(mon,current_date) and date_part(year,${menu_date})=date_part(year,current_date) and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0) ;;
    value_format: "#,##0"
  }


  # measure: Last_Month {
  #   type: number
  #   sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date)-1 then ${TABLE}.value else 0 end) ;;
  #   value_format: "#,##0"
  # }

  measure: Last_Month_sum {
    type: number
    sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date)-1 and ${value_field}='Sum' then ${TABLE}.value else 0 end) ;;
    value_format: "#,##0"
  }

  measure: Last_Month_avg {
    type: number
    sql: sum(case when date_part(mon,${menu_date})=date_part(mon,current_date)-1 and ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when date_part(mon,${menu_date})=date_part(mon,current_date)-1 and ${value_field}='Avg' then ${TABLE}.bo else 0 end),0) ;;
    value_format: "#,##0"
  }




  # measure: YTD {
  #   type: number
  #   sql: sum(case when date_part(mon,${menu_date})>date_part(mon,date(1,9,date_part(year,current_Date))) then ${TABLE}.value else 0 end) ;;
  #   value_format: "#,##0"
  # }


  measure: value_sum {
    type: number
    sql: sum(case when ${value_field}='Sum' then ${TABLE}.value else 0 end) ;;
    value_format: "#,##0"
  }

  measure: value_avg {
    type: number
    sql: sum(case when ${value_field}='Avg' then ${TABLE}.value else 0 end)/nullif(sum(case when ${value_field}='Avg' then ${TABLE}.bo else 0 end),0);;
    value_format: "#,##0"
  }


}
