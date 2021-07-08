view: derived_food_inventory {
  sql_table_name: stanza.derived_food_inventory ;;

  dimension: avail_stock_qty {
    type: number
    sql: ${TABLE}.avail_stock_qty ;;
  }

  dimension: avail_stock_value {
    type: number
    sql: ${TABLE}.avail_stock_value ;;
  }

  dimension: pm {
    sql: ${location_name} || ${item_code} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: blocked_stock_qty {
    type: number
    sql: ${TABLE}.blocked_stock_qty ;;
  }

  dimension: blocked_stock_value {
    type: number
    sql: ${TABLE}.blocked_stock_value ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: current_stock_qty {
    type: number
    sql: ${TABLE}.current_stock_qty ;;
  }

  dimension: current_stock_value {
    type: number
    sql: ${TABLE}.current_stock_value ;;
  }

  dimension: global_stock_qty {
    type: number
    sql: ${TABLE}.global_stock_qty ;;
  }

  dimension: global_stock_val {
    type: number
    sql: ${TABLE}.global_stock_val ;;
  }

  dimension: gst {
    type: string
    sql: ${TABLE}.gst ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: map {
    type: number
    sql: ${TABLE}.map ;;
  }

  dimension: opening_stock {
    type: number
    sql: ${TABLE}.opening_stock ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: tx_in_last_closing {
    type: number
    sql: ${TABLE}.tx_in_last_closing ;;
  }

  dimension: tx_out_last_closing {
    type: number
    sql: ${TABLE}.tx_out_last_closing ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: total_blocked_qty {
    type: sum
    sql: ${blocked_stock_qty} ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_blocked_value {
    type: sum
    sql: ${blocked_stock_value}  ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_available_qty {
    type: sum
    sql: ${avail_stock_qty}  ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_available_value {
    type: sum
    sql: ${avail_stock_value}  ;;
    drill_fields: [item_sub_category_label,item_name]
  }

  dimension: avail_value {
    type: number
    sql: ${avail_stock_value}  ;;
  }

  measure: moving_average_price {
    type: max
    sql: ${map} ;;
  }

  measure: local_average {
    type: sum
    sql: ${avail_stock_value}/nullif(${avail_stock_qty},0) ;;

  }

  dimension: consumption_value {
    type: number
    sql: ${TABLE}.cons_value ;;
  }

  dimension: consumption_qty {
    type: number
    sql: ${TABLE}.cons_qty ;;
  }

  measure: inventory_days {
    type: sum
    sql: ${avail_stock_value}/nullif(${consumption_value},0) ;;
  }


  # dimension: weight {
  #   type: number
  #   sql: case when ${inventory_days}>0 then 1 else 0 end;;

  # # }

  # measure: weighted_price {
  #   type: number
  #   sql: ${inventory_days}*${avail_value} ;;
  # }

  # measure: weighted_inv_days{
  #   type: number
  #   sql: sum(${weighted_price})/sum(${avail_value}) ;;

  # }
}


view: top_brands {
    derived_table: {
      sql:select location_name,
case when location_type ='STORE' then RANK () over (partition by location_type order by sum(avail_stock_value) DESC,location_type DESC) end as rnk_store,
case when location_type ='KITCHEN' then RANK () over (partition by location_type order by location_type ,sum(avail_stock_value) DESC ,location_type DESC) end as rnk_kitchen
from stanza.derived_food_inventory
          group by location_type,1
          HAVING location_type <>'CAFE';;
    }

    dimension: property_name {
      type: string
      primary_key: yes
      sql: ${TABLE}.location_name ;;
    }

    measure: min_rank{
      type: min
      sql: ${TABLE}.rnk;;
      hidden: yes
    }


    dimension: yes_no_field_store{
      type: yesno
      sql: ${TABLE}.rnk_store<11 ;;
    }
    dimension: yes_no_field_kitchen{
      type: yesno
      sql: ${TABLE}.rnk_kitchen<11 ;;
    }

     dimension: top_10_store{
       type: string
       sql:  CASE WHEN ${yes_no_field_store} = 'Yes' then ${property_name} else null end;;
      # order_by_field: min_rank
    }

    dimension: top_10_kitchen{
      type: string
      sql:  CASE WHEN ${yes_no_field_kitchen} = 'Yes' then ${property_name} else null end;;
      # order_by_field: min_rank
    }


  }


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


view: weighted_avg {
  derived_table: {
    sql:select location_name,item_name,
        sum(avail_stock_value)/sum(cons_value) as inv_days,
        sum(avail_stock_value) as avail_stock_value
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
      sql: ${TABLE}.avail_stock_value ;;
    }

    dimension: weighted_price {
      type: number
      sql: ${inv_days}*${avail_stock_value} ;;
    }

    measure: weighted_avg {
      type: number
      sql:sum(${weighted_price})/sum(${avail_stock_value}) ;;
    }

  }
