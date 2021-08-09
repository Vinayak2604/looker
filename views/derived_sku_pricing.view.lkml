view: derived_sku_pricing {
  sql_table_name: stanza.derived_sku_pricing ;;

  dimension: beds {
    type: number
    sql: ${TABLE}.beds ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: food {
    type: number
    sql: ${TABLE}.food ;;
  }

  dimension: food_gst {
    type: number
    sql: ${TABLE}.food_gst ;;
  }

  dimension: gst {
    type: number
    sql: ${TABLE}.gst ;;
  }

  dimension: laundry {
    type: number
    sql: ${TABLE}.laundry ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: occ {
    type: number
    sql: ${TABLE}.occ ;;
  }

  dimension: price_with_gst {
    type: number
    sql: ${TABLE}.price_with_gst ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_category {
    type: string
    sql: ${TABLE}.residence_category ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: primary_key {
    primary_key: yes
    sql:  ${micromarket} ;;
  }

  measure: total_beds {
    type: sum
    sql: ${beds} ;;
  }

}
