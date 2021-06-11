view: derived_b2b_bookings {
  sql_table_name: looker_demo.derived_b2b_bookings ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: blended_mr {
    type: number
    sql: ${TABLE}.blended_mr ;;
  }

  dimension: blended_uw {
    type: number
    sql: ${TABLE}.blended_uw ;;
  }

  dimension: blocked_beds {
    type: number
    sql: ${TABLE}.blocked_beds ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: deal_name {
    type: string
    sql: ${TABLE}.deal_name ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}.deal_type ;;
  }

  dimension: final_beds {
    type: number
    sql: ${TABLE}.final_beds ;;
  }

  dimension_group: from {
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
    sql: ${TABLE}.from_date ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: net_upsell {
    type: number
    sql: ${TABLE}.net_upsell ;;
  }

  dimension: occupied_beds {
    type: number
    sql: ${TABLE}.occupied_beds ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension_group: to {
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
    sql: ${TABLE}.to_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, deal_name, residence_name]
  }

  measure: net_upsell_per_bed  {
    type: number
    sql: ${net_upsell}/${final_beds} ;;

  }
}
