view: status_tracker {
  derived_table: {
    sql: select * From stanza.erp_stanzaestate_status_tracker
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_at {
    type: time
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

  dimension: context_name {
    type: string
    sql: ${TABLE}.context_name ;;
  }

  dimension: context_uuid {
    type: string
    sql: ${TABLE}.context_uuid ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.status_name ;;
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
    type: string
    sql: ${TABLE}.__hevo__marked_deleted ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: ${context_uuid};;
  }

  set: detail {
    fields: [
      id,
      created_at_time,
      created_by,
      status,
      updated_at_time,
      updated_by,
      uuid,
      context_name,
      context_uuid,
      status_name,
      __hevo__ingested_at,
      __hevo__loaded_at,
      __hevo__marked_deleted
    ]
  }
}
