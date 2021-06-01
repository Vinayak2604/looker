view: is_report {
  sql_table_name: looker_demo.is_report ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: call_duration {
    type: time
    timeframes: [time]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.call_duration ;;
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
    datatype: date
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

  dimension_group: created {
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
    datatype: date
    sql: ${TABLE}.created_time ;;
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.lead_id ;;
  }

  dimension_group: next_call_start {
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
    datatype: date
    sql: ${TABLE}.next_call_start_time ;;
  }

  dimension: outgoing_call_status {
    type: string
    sql: ${TABLE}.outgoing_call_status ;;
  }

  dimension: owner {
    type: number
    sql: ${TABLE}.owner ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  dimension: phone {
    type: number
    sql: ${TABLE}.phone ;;
  }

  dimension: pre_booking_amount {
    type: number
    sql: ${TABLE}.pre_booking_amount ;;
  }

  dimension: qualification {
    type: string
    sql: ${TABLE}.qualification ;;
  }

  dimension: qualified_by {
    type: string
    sql: ${TABLE}.qualified_by ;;
  }

  dimension_group: qualified_date {
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
    datatype: date
    sql: ${TABLE}.qualified_date ;;
  }

  dimension: referral_code {
    type: string
    sql: ${TABLE}.referral_code ;;
  }

  dimension: team_lead {
    type: string
    sql: ${TABLE}.team_lead ;;
  }

  dimension: visit_scheduled {
    type: string
    sql: ${TABLE}.visit_scheduled ;;
  }

  dimension: visit_scheduled_by {
    type: string
    sql: ${TABLE}.visit_scheduled_by ;;
  }

  dimension_group: visit_scheduled_marked {
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
    datatype: date
    sql: ${TABLE}.visit_scheduled_marked_date ;;
  }

  measure: total_calls {
    type: count_distinct
    sql:  ${id} ;;
  }

  measure: total_calls_yesterday {
    type: count_distinct
    sql:  case when date(${call_start_date}) = date_add(current_date,INTERVAL -1 DAY) then ${id} end  ;;
  }

  measure: total_calls_L7D {
    type: count_distinct
    sql:  case when date(${call_start_date}) >= date_add(current_date,INTERVAL -7 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) then ${id} end  ;;
  }

  measure: total_calls_L30D {
    type: count_distinct
    sql:  case when date(${call_start_date}) >= date_add(current_date,INTERVAL -30 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) then ${id} end  ;;
  }

  measure: total_leads {
    type: count_distinct
    sql:  ${lead_id};;
  }

  measure: total_leads_yesterday {
    type: count_distinct
    sql:  case when date(${call_start_date}) = date_add(current_date,INTERVAL -1 DAY) then ${lead_id} end;;
  }

  measure: total_leads_L7D {
    type: count_distinct
    sql:case when date(${call_start_date}) >= date_add(current_date,INTERVAL -7 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) then ${lead_id} end;;
  }

  measure: total_leads_L30D {
    type: count_distinct
    sql:case when date(${call_start_date}) >= date_add(current_date,INTERVAL -30 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) then ${lead_id} end  ;;
  }


  measure: connected_calls {
    type: count_distinct
    sql: case when ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
  }

  measure: connected_calls_yesterday {
    type: count_distinct
    sql: case when date(${call_start_date}) = date_add(current_date,INTERVAL -1 DAY) and ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
  }

  measure: connected_calls_L7D {
    type: count_distinct
    sql: case when date(${call_start_date}) >= date_add(current_date,INTERVAL -7 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) and ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
  }

  measure: connected_calls_L30D {
    type: count_distinct
    sql: case when date(${call_start_date}) >= date_add(current_date,INTERVAL -30 DAY) and date(${call_start_date}) <= date_add(current_date,INTERVAL -1 DAY) and ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${id} end  ;;
  }

  measure: connected_calls_per {
    type: number
    sql: ${connected_calls}/${total_calls} ;;
    value_format: "0.00%"
  }

  measure: leads_connected_calls {
    type: count_distinct
    sql: case when ${call_status} in ('Received','Attended Dialled','Scheduled Attended Delay') then ${lead_id} end ;;
  }

  measure: qualified_leads {
    type: count_distinct
    sql: case when ${qualification} = 'Y' then ${lead_id} end  ;;
  }

  measure: qualification_per {
    type: number
    sql: ${qualified_leads}/ ${leads_connected_calls};;
    value_format: "0.00%"
  }

  measure: disqualified_leads {
    type: count_distinct
    sql: case when ${qualification} = 'N' then ${lead_id} end  ;;
  }

  measure: disqualification_per {
    type: number
    sql: ${disqualified_leads}/ ${leads_connected_calls};;
    value_format: "0.00%"
  }

  measure: visit_scheduled_leads {
    type: count_distinct
    sql: case when ${visit_scheduled} = 'Y' then ${lead_id} end  ;;
  }

  measure: visit_scheduled_per {
    type: number
    sql: ${visit_scheduled}/${leads_connected_calls} ;;
    value_format: "0.00%"
  }

}
