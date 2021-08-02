view: erp_cac_service_attribute_meta {
  sql_table_name: stanza.erp_cac_service_attribute_meta ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: __hevo__ingested_at {
    type: number
    sql: ${TABLE}.__hevo__ingested_at ;;
  }

  dimension: __hevo__loaded_at {
    type: number
    sql: ${TABLE}.__hevo__loaded_at ;;
  }

  dimension: __hevo__marked_deleted {
    type: yesno
    sql: ${TABLE}.__hevo__marked_deleted ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: category_uuid {
    type: string
    sql: ${TABLE}.category_uuid ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_uuid {
    type: string
    sql: ${TABLE}.city_uuid ;;
  }

  dimension: cost_head {
    type: string
    sql: ${TABLE}.cost_head ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: micromarket_uuid {
    type: string
    sql: ${TABLE}.micromarket_uuid ;;
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: sub_category_category_uuid {
    type: string
    sql: ${TABLE}.sub_category_category_uuid ;;
  }

  dimension: sub_category_name {
    type: string
    sql: ${TABLE}.sub_category_name ;;
  }

  dimension: sub_category_uuid {
    type: string
    sql: ${TABLE}.sub_category_uuid ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  dimension: zone_uuid {
    type: string
    sql: ${TABLE}.zone_uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, sub_category_name, category_name]
  }
}
