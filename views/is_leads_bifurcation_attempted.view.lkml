view: is_leads_bifurcation_attempted {
  sql_table_name: stanza.is_leads_bifurcation_attempted ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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

  dimension: v_sub_status {
    type: string
    sql: ${TABLE}.v_sub_status ;;
  }

  dimension: v_lead_source {
    type: string
    sql: ${TABLE}.v_lead_source ;;
  }

  dimension: inbound_source {
    type: string
    sql: ${TABLE}.inbound_source ;;
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

  dimension: v_gclid {
    type: string
    sql: ${TABLE}.v_gclid ;;
  }

  dimension: v_fbclid {
    type: string
    sql: ${TABLE}.v_fbclid ;;
  }

  dimension: v_booking_status {
    type: string
    sql: ${TABLE}.v_booking_status ;;
  }

  dimension: v_prebooking_status {
    type: string
    sql: ${TABLE}.v_prebooking_status ;;
  }

  dimension: v_micromarket {
    type: string
    sql: ${TABLE}.v_micromarket ;;
  }

  dimension: v_city {
    type: string
    sql: ${TABLE}.v_city ;;
  }

  dimension: zoho_owner {
    type: string
    sql: ${TABLE}.zoho_owner ;;
  }

  dimension: follow_up_time_date {
    type: date
    sql: ${TABLE}.follow_up_time_date ;;
  }

  dimension: call_start_time {
    type: date
    sql: ${TABLE}.call_start_time ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}.total_calls ;;
  }

  dimension: day_diff {
    type: number
    sql: ${TABLE}.day_diff ;;
  }

  dimension: date_range {
    type: string
    sql: ${TABLE}.date_range ;;
  }

  dimension: attempted_flag {
    type: string
    sql: ${TABLE}.attempted_flag ;;
  }

  dimension: attempted_bifurcation {
    type: string
    sql: ${TABLE}.attempted_bifurcation ;;
  }

  dimension_group: v_booking_date {
    type: time
    sql: ${TABLE}.v_booking_date ;;
  }

  dimension_group: v_prebooking_date {
    type: time
    sql: ${TABLE}.v_prebooking_date ;;
  }

  dimension: v_phone {
    type: string
    sql: ${TABLE}.v_phone ;;
  }

  set: detail {
    fields: [
      v_month,
      v_date,
      v_created_at_time,
      v_type,
      v_sub_status,
      v_lead_source,
      inbound_source,
      v_lead_revived,
      v_utm_campaign,
      utm_source,
      utm_medium,
      source_category,
      v_gclid,
      v_fbclid,
      v_booking_status,
      v_prebooking_status,
      v_micromarket,
      v_city,
      zoho_owner,
      follow_up_time_date,
      call_start_time,
      total_calls,
      day_diff,
      date_range,
      attempted_flag,
      attempted_bifurcation,
      v_booking_date_time,
      v_prebooking_date_time,
      v_phone
    ]
  }
}
