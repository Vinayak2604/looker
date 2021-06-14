view: is_planning {
  sql_table_name: looker_demo.is_planning ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: call_duration {
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
    sql: ${TABLE}.call_duration ;;
  }

  dimension: call_id {
    type: string
    sql: ${TABLE}.call_id ;;
  }

  dimension_group: call_start {
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
    sql: ${TABLE}.call_start_time ;;
  }

  dimension: call_status {
    type: string
    sql: ${TABLE}.call_status ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension_group: lead_created {
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
    sql: ${TABLE}.lead_created_time ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}.lead_id ;;
  }

  dimension: lead_status {
    type: string
    sql: ${TABLE}.lead_status ;;
  }

  dimension: outgoing_call_status {
    type: string
    sql: ${TABLE}.outgoing_call_status ;;
  }

  dimension: phone {
    type: number
    sql: ${TABLE}.phone ;;
  }

  dimension_group: qualified {
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
    sql: ${TABLE}.qualified_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
