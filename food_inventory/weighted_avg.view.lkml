view: weighted_avg {
  derived_table: {
    sql:select location_name,item_name,
        sum(avail_stock_value) as avail_stock,
        sum(cons_value) as consumption,
        avail_stock/consumption as inv_days
        from stanza.derived_food_inventory
        group by 1,2 ;;
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

  dimension: weighted_price {
    type: number
    sql: ${inv_days}*${avail_stock_value} ;;
  }

  dimension: consumption {
    type: number
    sql: ${TABLE}.consumption ;;
  }

  measure: weighted_avg {
    type: number
    sql:sum(${weighted_price})/nullif(sum(${avail_stock_value}),0) ;;
  }

}
