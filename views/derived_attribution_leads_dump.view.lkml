view: derived_attribution_leads_dump {
  derived_table: {
    sql: select *
    from stanza.derived_attributed_leads_dump
      ;;
  }

  dimension: v_date {
    type: date
    sql: ${TABLE}.v_date ;;
  }

  dimension_group: v_created_at {
    type: time
    sql: ${TABLE}.v_created_at ;;
  }

  dimension: v_phone {
    type: string
    sql: ${TABLE}.v_phone ;;
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

  dimension: v_type {
    type: string
    sql: ${TABLE}.v_type ;;
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

  dimension: owner_email {
    type: string
    sql: ${TABLE}.owner_email ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: v_qualified_by_timeline {
    type: string
    sql: ${TABLE}.v_qualified_by_timeline ;;
  }

  dimension_group: v_qualified_date {
    type: time
    sql: ${TABLE}.v_qualified_date ;;
  }

  dimension: referral_code {
    type: string
    sql: ${TABLE}.referral_code ;;
  }

  dimension: status_on_pre_booking {
    type: string
    sql: ${TABLE}.status_on_pre_booking ;;
  }

  dimension_group: visit_scheduled_date {
    type: time
    sql: ${TABLE}.visit_scheduled_date ;;
  }

  dimension_group: v_visit_scheduled_date {
    type: time
    sql: ${TABLE}.v_visit_scheduled_date ;;
  }

  dimension: source_category {
    type: string
    sql: ${TABLE}.source_category ;;
  }

  dimension: group_category {
    type: string
    sql: ${TABLE}.group_category ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
  }

  dimension_group: click_time {
    type: time
    sql: ${TABLE}.click_time ;;
  }

  dimension: v_month {
    type: number
    sql: ${TABLE}.v_month ;;
  }

  measure: total_leads
  {
    type: count_distinct
    sql: ${v_phone} ;;

  }


  measure: total_leads_as_attribution
  {
    type: count_distinct
    sql: case when ${classification} = 'Paid' then ${v_phone} end ;;

  }

}
