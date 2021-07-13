view: weighted_avg {
  derived_table: {
    sql:select location_name,item_name,
        sum(avail_stock_value) as avail_stock,
        sum(cons_value) as consumption,
        sum(avail_stock_value) over (partition by item_name) as global_stock,
        sum(cons_value) over (partition by item_name) as global_cons,
        global_stock/global_cons as inv_days
        from stanza.derived_food_inventory
        where location_type = 'STORE'
        group by 1,2,avail_stock_value,cons_value ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location_name ;;

  }

  dimension: item{
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: inv_days {
    type: number
    sql: ${TABLE}.inv_days ;;
  }
  dimension: avail_stock_value {
    type: number
    sql: ${TABLE}.avail_stock;;
  }

  dimension: global_stock {
    type: number
    sql: ${TABLE}.global_stock ;;

  }

  dimension: weighted_price {
    type: number
    sql: ${inv_days}*${global_stock} ;;
  }

  measure: weighted_avg {
    type: number
    sql:sum(${weighted_price})/sum(case when ${inv_days}>0 then ${global_stock} else null end) ;;
  }

}
