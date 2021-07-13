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
