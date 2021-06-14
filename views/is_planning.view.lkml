view: is_planning {
  sql_table_name: looker_demo.is_planning ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: call_duration {
    type: number
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
    convert_tz: no
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
    convert_tz: no
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
    convert_tz: no
    sql: ${TABLE}.qualified_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_leads {
    type: count_distinct
    sql: ${lead_id};;
  }

  measure: qualified_leads {
    type: count_distinct
    sql: case when ${lead_status} not in ('Disqualified','RNR','New Lead','Called','Pre Qualification Follow Up') and and  ${call_duration} > 0  then ${lead_id} end ;;
  }

  measure: disqualified_leads {
    type: count_distinct
    sql: case when ${lead_status} in ('Disqualified') and ${call_duration} > 0 then ${lead_id} end ;;
  }

  measure: qualification_per {
    type: number
    sql: ${disqualified_leads} / (${disqualified_leads} + ${disqualified_leads}) ;;
    value_format: "0.00%"
  }

  measure: total_calls {
    type: count_distinct
    sql: ${call_id} ;;
  }

  measure: total_connected_calls {
    type: count_distinct
    sql: case when ${call_duration} > 0  then ${call_id} end ;;
  }

  measure: total_calls_before_qualification {
    type: count_distinct
    sql: case when ${call_start_time} <= ${qualified_time} and ${lead_status} not in ('Disqualified','RNR','New Lead','Called','Pre Qualification Follow Up') then ${call_id} end ;;
  }

  measure: total_connected_calls_before_qualification {
    type: count_distinct
    sql: case when ${call_start_time} <= ${qualified_time} and ${lead_status} not in ('Disqualified','RNR','New Lead','Called','Pre Qualification Follow Up') and  ${call_duration} > 0  then ${call_id} end ;;
  }

  measure: total_calls_before_disqualification {
    type: count_distinct
    sql: case when ${call_start_time} <= ${qualified_time} and ${lead_status} in ('Disqualified') then ${call_id} end ;;
  }

  measure: total_connected_calls_before_disqualification {
    type: count_distinct
    sql: case when ${call_start_time} <= ${qualified_time} and ${lead_status} in ('Disqualified') and ${call_duration} > 0  then ${call_id} end ;;
  }

  measure: AHT {
    type: average
    sql: case when  ${call_duration} > 0 then ${call_duration} end ;;
  }

}
