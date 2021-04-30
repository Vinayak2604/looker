view: derived_vas_orders {
  sql_table_name: looker_demo.derived_vas_orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cafe {
    type: string
    sql: ${TABLE}.cafe ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: dt {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: delivery {
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
    sql: ${TABLE}.delivery_time ;;
  }

  dimension_group: expected_delivery {
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
    sql: ${TABLE}.expected_delivery_time ;;
  }

  dimension: feedback {
    type: string
    sql: ${TABLE}.feedback ;;
  }

  dimension: feedback_for {
    type: string
    sql: ${TABLE}.feedback_for ;;
  }

  dimension: final_total_amount {
    type: number
    sql: ${TABLE}.final_total_amount ;;
  }

  dimension: in_room {
    type: yesno
    sql: ${TABLE}.in_room ;;
  }

  dimension: mealtime {
    type: string
    sql: ${TABLE}.mealtime ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: order_code {
    type: string
    sql: ${TABLE}.order_code ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: service_mode {
    type: string
    sql: ${TABLE}.service_mode ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: orders {
    type: count_distinct
    sql: ${order_code} ;;
  }

  measure: aov {
    type: average
    sql: ${final_total_amount} ;;
    value_format: "0.0"
  }
}
