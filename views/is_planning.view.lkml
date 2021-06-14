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
    timeframes: [time]
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

  measure: leads {
    type: count_distinct
    drill_fields: [lead_id]
  }

  measure: qualified_leads {
    type: count_distinct
    sql: case when ${lead_status} not in ('Disqualified','RNR','New Lead','Called','Pre Qualification Follow Up') then ${lead_id} end ;;
  }

  measure: disqualified_leads {
    type: count_distinct
    sql: case when ${lead_status} in ('Disqualified') then ${lead_id} end ;;
  }

  measure: qualification_per {
    type: count_distinct
    sql: ${disqualified_leads} / (${disqualified_leads} + ${disqualified_leads}) ;;
    value_format: "0.00%"
  }

  measure: total_calls {
    type: count_distinct
    sql: case when ${call_duration_time} >= 0:00  then ${call_id} end ;;
  }

}
