view: derived_sales_associate_performance {
  sql_table_name: stanza.derived_sales_associate_performance ;;

  dimension: access_level_entity_uuids {
    type: string
    sql: ${TABLE}.access_level_entity_uuids ;;
  }

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }

  dimension: calls_completed {
    type: number
    sql: ${TABLE}.calls_completed ;;
  }

  dimension: calls_completed_in_tat {
    type: number
    sql: ${TABLE}.calls_completed_in_tat ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created ;;
  }

  dimension: drop {
    type: number
    sql: ${TABLE}.drop ;;
  }

  dimension: drop_after_visit {
    type: number
    sql: ${TABLE}.drop_after_visit ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: moved_up {
    type: number
    sql: ${TABLE}.moved_up ;;
  }

  dimension: number_of_agents {
    type: number
    sql: ${TABLE}.number_of_agents ;;
  }

  dimension: pre_booking {
    type: number
    sql: ${TABLE}.pre_booking ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: target_per_residence {
    type: number
    sql: ${TABLE}.target_per_residence ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: visits_completed {
    type: number
    sql: COALESCE(${TABLE}.visits_completed,0) ;;
  }

  dimension: visits_in_tat {
    type: number
    sql: ${TABLE}.visits_in_tat ;;
  }

  dimension: final_selling_price {
    type: number
    sql: ${TABLE}.final_selling_price ;;
  }

  dimension: blended_price {
    type: number
    sql: ${TABLE}.blended_price ;;
  }

  dimension: blended_price_target {
    type: number
    sql: ${TABLE}.blended_price_target ;;
  }
  dimension: under_written_price {
    type: number
    sql: ${TABLE}.under_written_price ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }


  dimension: residence_type {
    type: string
    sql: ${TABLE}.residence_type ;;
  }

  dimension: L3D_Pre_bookings {
    type: number
    sql: ${TABLE}.L3D_Pre_bookings ;;
  }

  dimension: L7D_Pre_bookings {
    type: number
    sql: ${TABLE}.L7D_Pre_bookings ;;
  }

  dimension: L14D_Pre_bookings {
    type: number
    sql: ${TABLE}.L14D_Pre_bookings ;;
  }

  dimension: L21D_Pre_bookings {
    type: number
    sql: ${TABLE}.L21D_Pre_bookings ;;
  }

  dimension: L30D_Pre_bookings {
    type: number
    sql: ${TABLE}.L30D_Pre_bookings ;;
  }

  dimension: L3D_Calls_Completed {
    type: number
    sql: ${TABLE}.L3D_Calls_Completed ;;
  }

  dimension: L7D_Calls_Completed {
    type: number
    sql: ${TABLE}.L7D_Calls_Completed ;;
  }

  dimension: L14D_Calls_Completed {
    type: number
    sql: ${TABLE}.L14D_Calls_Completed ;;
  }

  dimension: L21D_Calls_Completed {
    type: number
    sql: ${TABLE}.L21D_Calls_Completed ;;
  }

  dimension: L30D_Calls_Completed {
    type: number
    sql: ${TABLE}.L30D_Calls_Completed ;;
  }

  dimension: L3D_Visits_Completed {
    type: number
    sql: ${TABLE}.L3D_Visits_Completed ;;
  }

  dimension: L7D_Visits_Completed {
    type: number
    sql: ${TABLE}.L7D_Visits_Completed ;;
  }

  dimension: L14D_Visits_Completed {
    type: number
    sql: ${TABLE}.L14D_Visits_Completed ;;
  }

  dimension: L21D_Visits_Completed {
    type: number
    sql: ${TABLE}.L21D_Visits_Completed ;;
  }

  dimension: L30D_Visits_Completed {
    type: number
    sql: ${TABLE}.L30D_Visits_Completed ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: beds_achieved {
    type: sum
    sql: ${bookings}/(case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence} end) ;;
    value_format: "0%"
    }

  measure: target_achieved {
    type: sum
    sql: ${blended_price} ;;
    value_format: "0"
  }

  measure: under_written_revenue {
    type: sum
    sql: ${under_written_price} ;;
    value_format: "0"
  }

  measure: Total_Revenue {
    type: sum
    sql: ${final_selling_price} ;;
    value_format: "0"
  }

  measure: number_of_days {
    type: number
    sql: current_date - min(${created_date}) ;;
  }

  measure: running_total_booking {
    type: running_total
    sql: ${bookings} ;;
  }
  measure: full_booking {
        type: sum
        sql: ${bookings} ;;
      }
  measure: count_residence {
    type: count_distinct
    sql: ${residence_name} ;;
  }


  measure: L3D_full_booking {
    type: sum
    sql: case when date(${created_date}) >= date(date_add('day',-3,current_date)) and date(${created_date}) <= date(date_add('day',-1,current_date)) then ${bookings} end;;
  }
  measure: pre_bookings {
    type: max
    sql: COALESCE(${pre_booking},0) ;;
  }
    measure: target {
        type: sum
        sql:  case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence} end;;
        value_format: "0"
     }

  measure: target_revenue {
    type: sum
    sql:  (case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence}*${blended_price_target} end)/100000;;
    value_format: "0"
 }

#  measure: Visits_Completed_in_TAT {
#    type: number
#    sql: avg(${visits_in_tat})/avg(${visits_completed}) ;;
#  }

#  measure: Visits_Completed_in_TAT_perc {
#    type: max
#    sql: ${Visits_Completed_in_TAT} ;;
#  }

    measure: Visits_in_TAT {
        type: max
        sql: COALESCE(${visits_in_tat},0) ;;
      }

    measure: Visits_Completed {
        type: max
        sql: COALESCE(${visits_completed},0) ;;
      }

    measure: dropped_after_visit {
        type: max
        sql: COALESCE(${drop_after_visit},0) ;;
      }

    measure: Calls_Completed_in_TAT {
        type: max
        sql: COALESCE(${calls_completed_in_tat},0) ;;
      }

    measure: Calls_Completed {
        type: max
        sql: COALESCE(${calls_completed},0) ;;
      }

  measure: Moved_Up {
    type: max
    sql: COALESCE(${moved_up},0) ;;
  }

    measure: dropped {
        type: max
        sql: COALESCE(${drop},0) ;;
      }

    measure: L3D_Pre_booking {
        type: max
         sql: COALESCE(${L3D_Pre_bookings},0) ;;
      html: {% if value > 0 %}
      <p style="color: black; font-size:100%">{{ rendered_value }}</p>

      {% else %}
      <p style="color: black"> - </p>

      {% endif %} ;;
  }

  measure:L7D_Pre_booking {
    type: max
    sql: COALESCE(${L7D_Pre_bookings},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L14D_Pre_booking {
    type: max
    sql: COALESCE(${L14D_Pre_bookings},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L21D_Pre_booking {
    type: max
    sql: COALESCE(${L21D_Pre_bookings},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L30D_Pre_booking {
    type: max
    sql: COALESCE(${L30D_Pre_bookings},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L3D_CallsCompleted {
    type: max
    sql: COALESCE(${L3D_Calls_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure:L7D_CallsCompleted {
    type: max
    sql: COALESCE(${L7D_Calls_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L14D_CallsCompleted {
    type: max
    sql: COALESCE(${L14D_Calls_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L21D_CallsCompleted {
    type: max
    sql: COALESCE(${L21D_Calls_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L30D_CallsCompleted {
    type: max
    sql: COALESCE(${L30D_Calls_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L3D_VisitsCompleted {
    type: max
    sql: COALESCE(${L3D_Visits_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure:L7D_VisitsCompleted {
    type: max
    sql: COALESCE(${L7D_Visits_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L14D_VisitsCompleted {
    type: max
    sql: COALESCE(${L14D_Visits_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L21D_VisitsCompleted {
    type: max
    sql: COALESCE(${L21D_Visits_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: L30D_VisitsCompleted {
    type: max
    sql: COALESCE(${L30D_Visits_Completed},0) ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }


  measure: count {
    type: count
    drill_fields: [residence_name]
  }
}
