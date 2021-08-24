view: derived_cac_budget {
  sql_table_name: stanza.derived_cac_budget ;;

  dimension: cac_scholars_per_bed {
    type: number
    sql: ${TABLE}.cac_scholars_per_bed ;;
  }

  dimension: cac_suits_per_bed {
    type: number
    sql: ${TABLE}.cac_suits_per_bed ;;
  }

  dimension: cluster {
    type: string
    sql: ${TABLE}.cluster ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: scholars_beds {
    type: number
    sql: ${TABLE}.scholars_beds ;;
  }

  dimension: scholars_budget {
    type: number
    sql: ${TABLE}.scholars_budget ;;
  }

  dimension: suits_beds {
    type: number
    sql: ${TABLE}.suits_beds ;;
  }

  dimension: suits_budget {
    type: number
    sql: ${TABLE}.suits_budget ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }
  dimension:primary_key {
    primary_key: yes
    sql: CONCAT(${micromarket},${cluster}) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
