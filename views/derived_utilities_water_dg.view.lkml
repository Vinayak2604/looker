view: derived_utilities_water_dg {
  sql_table_name: stanza.derived_utilities_water_dg ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.capacity ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: deisel_quantity {
    type: number
    sql: ${TABLE}.deisel_quantity ;;
  }

  dimension: dielsel_amount {
    type: number
    sql: ${TABLE}.dielsel_amount ;;
  }

  dimension: dielsel_capacity {
    type: number
    sql: ${TABLE}.dielsel_capacity ;;
  }

  dimension: dielsel_rate {
    type: number
    sql: ${TABLE}.dielsel_rate ;;
  }

  dimension_group: expense {
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
    sql: ${TABLE}.expense_time ;;
  }

  dimension: jar_amount {
    type: number
    sql: ${TABLE}.jar_amount ;;
  }

  dimension: jar_capacity {
    type: number
    sql: ${TABLE}.jar_capacity ;;
  }

  dimension: jar_quantity {
    type: number
    sql: ${TABLE}.jar_quantity ;;
  }

  dimension: jar_rate {
    type: number
    sql: ${TABLE}.jar_rate ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: tanker_amount {
    type: number
    sql: ${TABLE}.tanker_amount ;;
  }

  dimension: tanker_capacity {
    type: number
    sql: ${TABLE}.tanker_capacity ;;
  }

  dimension: tanker_quantity {
    type: number
    sql: ${TABLE}.tanker_quantity ;;
  }

  dimension: tanker_rate {
    type: number
    sql: ${TABLE}.tanker_rate ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }

  measure: count {
    type: count
    drill_fields: [zone_name, city_name, micromarket_name, residence_name]
  }
}
