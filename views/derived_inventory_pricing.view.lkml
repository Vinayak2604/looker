view: derived_inventory_pricing {
  sql_table_name: stanza.derived_inventory_pricing ;;

  dimension: attributes_price {
    type: number
    sql: ${TABLE}.attributes_price ;;
  }

  dimension: base_price {
    type: number
    sql: ${TABLE}.base_price ;;
  }

  dimension: blocked {
    type: yesno
    sql: ${TABLE}.blocked ;;
  }

  dimension: buffer_price {
    type: number
    sql: ${TABLE}.buffer_price ;;
  }

  dimension: cgst {
    type: number
    sql: ${TABLE}.cgst ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: conversion_price {
    type: number
    sql: ${TABLE}.conversion_price ;;
  }

  dimension: dead {
    type: yesno
    sql: ${TABLE}.dead ;;
  }

  dimension: food_service_cgst {
    type: number
    sql: ${TABLE}.food_service_cgst ;;
  }

  dimension: food_service_price {
    type: number
    sql: ${TABLE}.food_service_price ;;
  }

  dimension: food_service_sgst {
    type: number
    sql: ${TABLE}.food_service_sgst ;;
  }

  dimension: house {
    type: string
    sql: ${TABLE}.house ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: mandatory_services_price {
    type: number
    sql: ${TABLE}.mandatory_services_price ;;
  }

  dimension: micro_market {
    type: string
    sql: ${TABLE}.micro_market ;;
  }

  dimension: number_of_beds {
    type: number
    sql: ${TABLE}.number_of_beds ;;
  }

  dimension: room_number {
    type: string
    sql: ${TABLE}.room_number ;;
  }

  dimension: sgst {
    type: number
    sql: ${TABLE}.sgst ;;
  }

  measure: No_of_beds {
    type: sum
    sql: ${number_of_beds} ;;
  }

  measure: Base_price {
    type: sum
    sql: ${base_price} ;;
  }

  # measure: Dead_bed_count {
  #   type: count
  #   sql: ${dead};;
  # }
}
