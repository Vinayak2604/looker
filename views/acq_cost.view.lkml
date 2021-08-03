view: acq_cost {
  derived_table: {
    sql: Select DATE(po.updated_at) as updated_at,
      po.attribute_meta_uuid,
      DATE(po.po_date) as podate,
      am.zone as Zone,
      am.city as City,
      am.micromarket as MM,
      am.category_name as Category,
      am.sub_category_name as Subcategory,
      po.po_number,
      po.committed as committed,
      b.budget_amount*10 as budget,
      lag(po."committed")over(partition by micromarket,category order by po_date) as comm_old,
      lag(po.actual)over(partition by micromarket,category order by po_date) as actual_old,
      po.actual
      from stanza.erp_cac_service_purchase_order po
      left join stanza.erp_cac_service_attribute_meta am on po.attribute_meta_uuid = am.uuid
      left join stanza.erp_cac_service_budget b on po.attribute_meta_uuid = b.attribue_meta_uuid
      where am.category_name not like '%Discount%' and po_date >= '2021-04-01' and po.committed >0;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: micromarket {
    type: string
    sql: ${TABLE}.MM ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    html:{% if value == 'Manpower' %}

    <p style="color: black;font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% elsif value == 'Commission' %}

    <p style="color: black; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% else %}

    <p style="color: black; font-size:100%; text-align:center">{{ rendered_value }}</p>

    {% endif %} ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  measure: actual {
    type: sum
    sql: CASE WHEN ${TABLE}.actual/10^5 IS NOT NULL THEN ${TABLE}.actual/10^5 ELSE 0 END;;
    value_format: "#,##0.0"
    # html:


    # {% if {{ value }} == '0 %}

    # <div style="text-align:right;font-weight: bold">{{ '-' }}</div>

    # {% endif %};;

  }
  measure: committed {
    type: sum
    sql: ${TABLE}.committed/10^5 ;;
    value_format: "#,##0.0"
  }

  measure: budget {
    type: number
    sql: sum(distinct(${TABLE}.budget))/10^5 ;;
    value_format: "#,##0.0"
  }
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.MM, ${TABLE}.podate) ;;
  }

  # dimension: utilized_percent {
  #   type: number
  #   sql: ${committed}/${budget} ;;
  #   value_format: "#0.0%"
  # }

  dimension: Committed_lag {
    type: number
    sql: ${TABLE}.comm_old ;;
    value_format: "#,##0.0"
  }

  dimension: Actual_lag {
    type: number
    sql: ${TABLE}.actual_old ;;
    value_format: "#,##0.0"
  }

  # dimension: Committed_dim {
  #   type: number
  #   sql: ${committed} ;;
  #   value_format: "#,##0.0"
  # }

  measure: Committed_delta {
    type: sum
    sql: (${TABLE}.committed-${TABLE}.comm_old)/10^5 ;;
    value_format: "#,##0.0"
  }

  measure: Actual_delta {
    type: sum
    sql: (${TABLE}.actual-${TABLE}.actual_old)/10^5 ;;
    value_format: "#,##0.0"
  }

  dimension_group: podate {
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
    sql: ${TABLE}.podate ;;
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

  measure: actual2 {
    type: number
    sql: ${actual};;
    html:{% if rendered_value  > 0  %}
    {{ rendered_value }}
     {% else %}

    {{ "-" }}

    {% endif %} ;;
  }
}

# view: ac {
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
