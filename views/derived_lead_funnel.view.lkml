view: derived_lead_funnel {
  sql_table_name: stanza.derived_lead_funnel ;;


  dimension: v_month {
    type: number
    sql: ${TABLE}.v_month ;;
  }

  dimension: v_date {
    type: date
    sql: ${TABLE}.v_date ;;
  }

  dimension_group: v_created_at {
    type: time
    sql: ${TABLE}.v_created_at ;;
  }

  dimension: v_type {
    type: string
    sql: ${TABLE}.v_type ;;
  }

  dimension: lead_owner_type {
    type: string
    sql: ${TABLE}.lead_owner_type ;;
  }

  dimension: v_lead_status {
    type: string
    sql: ${TABLE}.v_lead_status ;;
  }

  dimension: v_sub_status {
    type: string
    sql: ${TABLE}.v_sub_status ;;
  }

  dimension: v_qualified_by {
    type: string
    sql: ${TABLE}.v_qualified_by ;;
  }

  dimension: v_lead_revived {
    type: string
    sql: ${TABLE}.v_lead_revived ;;
  }

  dimension: v_utm_campaign {
    type: string
    sql: ${TABLE}.v_utm_campaign ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: source_category {
    type: string
    sql: ${TABLE}.source_category ;;
  }

  dimension: group_category {
    type: string
    sql: ${TABLE}.group_category ;;
  }

  dimension: v_gclid {
    type: string
    sql: ${TABLE}.v_gclid ;;
  }

  dimension: v_booking_status {
    type: string
    sql: ${TABLE}.v_booking_status ;;
  }

  dimension_group: v_booking_date {
    type: time
    sql: ${TABLE}.v_booking_date ;;
  }

  dimension: v_prebooking_status {
    type: string
    sql: ${TABLE}.v_prebooking_status ;;
  }

  dimension_group: v_prebooking_date {
    type: time
    sql: ${TABLE}.v_prebooking_date ;;
  }

  dimension: v_micromarket {
    type: string
    sql: ${TABLE}.v_micromarket ;;
  }

  dimension: v_city {
    type: string
    sql: ${TABLE}.v_city ;;
  }

  dimension_group: follow_up_time_date {
    type: time
    sql: ${TABLE}.follow_up_time_date ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: v_qualified_by_timeline {
    type: string
    sql: ${TABLE}.v_qualified_by_timeline ;;
  }

  dimension_group: qualified_date {
    type: time
    sql: ${TABLE}.qualified_date ;;
  }

  dimension: refferal_code {
    type: string
    sql: ${TABLE}.refferal_code ;;
  }

  dimension_group: disqualification_date {
    type: time
    sql: ${TABLE}.disqualification_date ;;
  }

  dimension: status_on_pre_booking {
    type: string
    sql: ${TABLE}.status_on_pre_booking ;;
  }

  dimension: date_range_post_q {
    type: string
    sql: ${TABLE}.date_range_post_q ;;
  }

  dimension: v_phone {
    type: string
    sql: ${TABLE}.v_phone ;;
  }

  dimension: date_range_pre_q {
    type: string
    sql: ${TABLE}.date_range_pre_q ;;
  }

  dimension: v_fbclid {
    type: string
    sql: ${TABLE}.v_fbclid ;;
  }

  dimension: v_lead_source {
    type: string
    sql: ${TABLE}.v_lead_source ;;
  }

  dimension: inbound_source {
    type: string
    sql: ${TABLE}.inbound_source ;;
  }

  dimension: lead_owner_email {
    type: string
    sql: ${TABLE}.lead_owner_email ;;
  }

  dimension: disqualified_by {
    type: string
    sql: ${TABLE}.disqualified_by ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  measure: total_leads {
    type: count_distinct
    sql: ${v_phone} ;;
  }




}
