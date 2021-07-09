  view: cac_budget {
    derived_table: {
      sql:
          select am.zone as zone,am.city as city, am.micromarket as micromarket,am.category_name as Category,am.sub_category_name as Subcategory,  sum(b.budget_amount) as budget  from stanza.erp_cac_service_budget b
      left join stanza.erp_cac_service_attribute_meta am on b.attribue_meta_uuid = am.uuid
      where am.category_name not like '%Discount%'  group by 1,2,3,4,5;;
    }

    dimension: city {
      type: string
      sql: ${TABLE}.City ;;
    }

    dimension: micromarket {
      type: string
      sql: ${TABLE}.micromarket ;;
    }

    dimension: zone {
      type: string
      sql: ${TABLE}.zone ;;
    }

    dimension: Category {
      type: string
      sql: ${TABLE}.Category ;;
    }

    dimension: Subcategory {
      type: string
      sql: ${TABLE}.Subcategory ;;
    }

    measure: budget {
      type: number
      sql: sum(${TABLE}.budget)/10^5 ;;
      value_format: "#,##0.0"
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

# view: cac_budget {
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
