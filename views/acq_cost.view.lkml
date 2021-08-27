view: acq_cost {
  derived_table: {
    sql:  Select DATE(po.updated_at) as updated_at,DATE(po.po_date) as podate,
am.zone as Zone,am.city as City, am.micromarket as MM,am.category_name as Category,
am.sub_category_name as Subcategory, po.committed,po.actual,
lag(po."committed")over(partition by zone,city,micromarket order by podate)as comm_lag,
lag(po.actual)over(partition by zone,city,micromarket order by podate)as actual_lag,
b.budget_amount*10 as budget
from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on po.attribute_meta_uuid = am.uuid
left join stanza.erp_cac_service_budget b on am.uuid = b.attribue_meta_uuid
where po.committed >0 and am.category_name not like '%Discount'
;;
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
    sql: ${TABLE}.actual/10^5;;
    value_format: "#,##0.0"

  }

  measure: committed {
    type: sum
    sql: ${TABLE}.committed/10^5 ;;
    value_format: "#,##0.0"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%"></p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: budget {
    type: sum
    sql: distinct(${TABLE}.budget)/10^5 ;;
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
    sql: COALESCE((${TABLE}.committed-${TABLE}.comm_lag)/10^7,0) ;;
    value_format: "0.0"
    html: {% if value <= -0.01 or value >= 0.01 %}
      {% if value < 0 %}

        <p style="color: red; font-size:100%">{{ rendered_value | replace:'-','' | prepend:'(' | append:')' }}</p>
      {% else %}
        <p style="color: black; font-size:100%">{{ rendered_value }}</p>

      {% endif %}
    {% else %}
      <p style="color: red"> - </p>

    {% endif %}  ;;
  }

  measure: Actual_delta {
    type: sum
    sql: COALESCE((${TABLE}.actual-${TABLE}.actual_lag)/10^7,0) ;;
    value_format: "0.0"
    html: {% if value >= -0.01 or value <= 0.01 %}
      <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
      <p style="color: red"> - </p>

    {% endif %}  ;;
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
  measure: Actual_by_budgett {
    type: number
    sql:  COALESCE(${actual}/nullif(${budget},0),0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
      <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
      <p style="color: black"> - </p>

    {% endif %}  ;;
  }

  measure: Committed_by_budget {
    type: number
    sql: COALESCE(${committed}/nullif(${budget},0),0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
          <p style="color: black; font-size:100%">{{ rendered_value }}</p>

          {% else %}
          <p style="color: black"> - </p>

          {% endif %};;
  }
  measure: Actual_by_committed {
    type: number
    sql: COALESCE(${actual}/nullif(${committed},0),0) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
          <p style="color: black; font-size:100%">{{ rendered_value }}</p>

          {% else %}
          <p style="color:black"> - </p>

          {% endif %};;
  }


   dimension_group: updated_at {
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
    sql: ${TABLE}.updated_at;;
  }
  measure: ExperimentLookMl {
    type: number
    sql: if(${acq_cost.budget} = 0,"-",concat(round(${acq_cost.budget},1),"(",round(${acq_cost.Actual_by_budgett}*100,1),"%",")")) ;;
    value_format: "0.0%"
    html: {% if value > 0 %}
          <p style="color: black; font-size:100%">{{ rendered_value }}</p>

          {% else %}
          <p style="color:black"> - </p>

          {% endif %};;
  }


}
