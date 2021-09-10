view: estate_view {
  derived_table: {
    sql: select * from stanza.derived_estate_view
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_at {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: property_name {
    type: string
    sql: ${TABLE}.property_name ;;
  }

  dimension: stanza_property_name {
    type: string
    sql: ${TABLE}.stanza_property_name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: estate_status {
    type: string
    sql: ${TABLE}.estate_status ;;
  }

  dimension: type_of_brand {
    type: string
    sql: ${TABLE}.type_of_brand ;;
  }

  dimension: expected_bed_count {
    type: number
    sql: ${TABLE}.expected_bed_count ;;
  }

  dimension: effective_bed_count {
    type: number
    sql: ${TABLE}.effective_bed_count ;;
  }

  dimension: bed_count {
    type: number
    sql: ${TABLE}.bed_count ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: cluster_map {
    type: string
    sql: ${TABLE}.cluster_map ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.target ;;
  }

  dimension: funnel_consideration {
    type: string
    sql: ${TABLE}.funnel_consideration ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: ${uuid} ;;
  }

  set: detail {
    fields: [
      created_at,
      property_name,
      stanza_property_name,
      city,
      micromarket,
      zone,
      created_by,
      estate_status,
      type_of_brand,
      expected_bed_count,
      effective_bed_count,
      bed_count,
      updated_at_time,
      uuid,
      report_status,
      stage_name,
      cluster_map,
      target,
      funnel_consideration
    ]
  }
}
