view: ir_tes1 {
  sql_table_name: looker_demo.ir_tes1 ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
