view: liveblended_gsheet {
  derived_table: {
    sql: select distinct ct.NAME as city, mm.NAME as mm, rs.NAME as house,
Sum(invp.NUMBER_OF_BEDS) AS Available_beds,
SUM(CASE WHEN rm.DEAD = '0' THEN invp.NUMBER_OF_BEDS END) AS Live_beds,
ROUND(SUM(CASE WHEN rm.DEAD = '0' AND invp.NUMBER_OF_BEDS <> '0' THEN ((invp.BASE_PRICE+invp.ATTRIBUTES_PRICE+invp.MANDATORY_SERVICES_PRICE+invp.FOOD_SERVICE_PRICE+invp.CGST+invp.SGST+invp.FOOD_SERVICE_CGST+invp.FOOD_SERVICE_SGST)*invp.NUMBER_OF_BEDS) END)/ SUM(CASE WHEN rm.DEAD = '0' THEN invp.NUMBER_OF_BEDS END),2) AS Blended_price,
ROUND(SUM(CASE WHEN rm.DEAD = '0' AND invp.NUMBER_OF_BEDS <> '0' THEN invp.BUFFER_PRICE END)/ SUM(CASE WHEN rm.DEAD = '0' THEN invp.NUMBER_OF_BEDS END),2) AS Buffer_price,
ROUND(CASE WHEN invp.CONVERSION_PRICE = '0' THEN invp.CGST + invp.SGST + invp.FOOD_SERVICE_CGST + invp.FOOD_SERVICE_SGST
      ELSE (invp.CGST + invp.SGST + invp.FOOD_SERVICE_CGST + invp.FOOD_SERVICE_SGST)*invp.NUMBER_OF_BEDS END,2) AS Buffer_GST
FROM INVENTORY_PRICING invp
left join RESIDENCE rs on invp.RESIDENCE_ID = rs.RESIDENCE_ID
left join MICROMARKET mm on rs.MICROMARKET_ID = mm.MICROMARKET_ID
left join CITY ct on mm.CITY_ID = ct.CITY_ID
left join ROOM r on invp.ROOM_ID = r.ROOM_ID
left join ROOM_METADATA rm on invp.ROOM_ID = rm.ROOM_ID
where DATE(invp.START_DATE)<= current_date() AND DATE(invp.END_DATE)>=current_date() and DATE(rm.START_DATE) <= current_date() and
 DATE(rm.END_DATE) >= current_date() and rs.NAME not like '%test%' ANd rs.is_test_house = '0' AND rs.Enabled = '1' AND rs.NAME NOT LIKE '%Studio 21%' AND mm.name NOT LIKE '%GMIT%' and mm.name NOT LIKE '%BITS%' AND
 rs.NAME NOT LIKE '%COEP%' and rs.NAME NOT LIKE '%COEd%'
 GROUP BY house
 ORDER BY house;
 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.mm ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: ${TABLE}.mm ;;
  }

  dimension: house {
    type: string
    sql: ${TABLE}.house ;;
  }
  measure: Available_beds {
    type: sum
    sql: ${TABLE}.Available_bed;;
  }

  measure: Live_beds {
    type: sum
    sql: ${TABLE}.Live_bed;;
  }

  measure: Blended_price {
    type: sum
    sql: ${TABLE}.Blended_price;;
  }





























  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: liveblended_gsheet {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
