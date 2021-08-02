view: cac_lag {
  derived_table: {
    sql: select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Digital'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Commission'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Manpower'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Discount'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Incentive'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name Like 'Offline%'
union
select am.city,am.micromarket, lag(po."committed")over(partition by micromarket order by po_date) as comm_old
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on am.uuid = po.attribute_meta_uuid
where am.category_name = 'Others' ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: comm_old {
    type: number
    sql: ${TABLE}.comm_old ;;
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

# view: cac_lag {
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
