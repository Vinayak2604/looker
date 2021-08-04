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
# <<<<<<< HEAD
    sql: ${TABLE}.actual/10^5;;
    value_format: "#,##0.0"
#     html: {% if value > 0.09 %}
#       <p style="color: black; font-size:100%; text-align:right">{{ rendered_value }}</p>
# # =======
#     sql: CASE WHEN ${TABLE}.actual/10^5 IS NOT NULL THEN ${TABLE}.actual/10^5 ELSE 0 END;;
#     value_format: "0.0"
#     # html:
# # >>>>>>> branch 'master' of git@github.com:llooker/stanzaliving.git

#     {% else %}
#       <p style="color: black"> - </p>

#     {% endif %};;

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

  # measure: Committed_delta {
  #   type: sum
  #   sql: (${TABLE}.committed-${TABLE}.comm_old)/10^5 ;;
  #   value_format: "0.0"
  #   html: {% if value < -0.01 && value > 0.1 %}
  #     <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  #   {% else %}
  #     <p style="color: black"> - </p>

  #   {% endif %}  ;;
  # }

  # measure: Actual_delta {
  #   type: sum
  #   sql: (${TABLE}.actual-${TABLE}.actual_old)/10^5 ;;
  #   value_format: "0.0"
  #   html: {% if value < -0.01 && value > 0.1 %}
  #     <p style="color: black; font-size:100%">{{ rendered_value }}</p>

  #   {% else %}
  #     <p style="color: black"> - </p>

  #   {% endif %}  ;;
  # }

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
  measure: Actual_by_budgett {
    type: number
    sql: COALESCE(${actual}/${budget},0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
      <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
      <p style="color: black"> - </p>

    {% endif %}  ;;
  }

  measure: Committed_by_budget {
    type: number
    sql: COALESCE(${committed}/${budget},0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %};;
  }

  measure: Actual_by_committed {
    type: number
    sql: COALESCE(${actual}/${committed},0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %};;
    }
}
