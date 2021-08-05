view: food_cost_new {
  derived_table: {
    sql: select 'Budget' as parameter,menu_date,vendor_name, (coalesce(actual_blended_order,0)+coalesce(actual_sl_blended_order,0))*coalesce(menu_rate,0) as value
      from stanza.derived_food_cost dfc

      union

      select 'Actual' as parameter,menu_date,vendor_name, (house_wise_actual_cost) as value
      from stanza.derived_food_cost dfc

      union

      select 'Delta' as parameter,menu_date,vendor_name, (coalesce(actual_blended_order,0)+coalesce(actual_sl_blended_order,0))*coalesce(menu_rate,0) - (house_wise_actual_cost) as value
      from stanza.derived_food_cost dfc
       ;;
  }

  dimension: parameter {
    type: string
    sql: ${TABLE}.parameter ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
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



}
