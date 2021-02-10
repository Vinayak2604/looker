view: derived_residence_attributes {
  sql_table_name: looker_demo.derived_residence_attributes ;;

  dimension: available_beds {
    type: number
    sql: ${TABLE}.available_beds ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: dead_beds {
    type: number
    sql: ${TABLE}.dead_beds ;;
  }

  dimension: early_exits {
    type: number
    sql: ${TABLE}.early_exits ;;
  }

  dimension: future_move_ins {
    type: number
    sql: ${TABLE}.future_move_ins ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: not_moved_in {
    type: number
    sql: ${TABLE}.not_moved_in ;;
  }

  dimension: onboarded_beds {
    type: number
    sql: ${TABLE}.onboarded_beds ;;
  }

  dimension: ops_residence_id {
    type: string
    sql: ${TABLE}.ops_residence_id ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: sold_beds {
    type: number
    sql: ${TABLE}.sold_beds ;;
  }

  dimension: underwritten_price {
    type: number
    sql: ${TABLE}.underwritten_price ;;
  }

  dimension: underwritten_pricing_incl_gst {
    type: number
    sql: ${TABLE}.underwritten_pricing_incl_gst ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
