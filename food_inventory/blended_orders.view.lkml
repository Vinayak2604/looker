view: blended_orders {
  derived_table: {
    sql:select vendor_name, avg(actual_blended_order) as blended_orders
        from stanza.derived_food_cost
        where menu_date >= DATEADD(day,-6,CURRENT_DATE-1)
        group by vendor_name;;
  }

  dimension: kitchen {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: blended {
    type: number
    sql: ${TABLE}.blended_orders ;;
  }

}
