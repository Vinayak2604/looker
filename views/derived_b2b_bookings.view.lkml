view: derived_b2b_bookings {
  sql_table_name: looker_demo.derived_b2b_bookings ;;

  dimension: b2b_blended_commercials {
    type: number
    sql: ${TABLE}.b2b_blended_commercials ;;
  }

  dimension: b2b_deal_name {
    type: string
    sql: ${TABLE}.b2b_deal_name ;;
  }

  dimension: blocked_beds {
    type: number
    sql: ${TABLE}.blocked_beds ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: contract_uuid {
    type: string
    sql: ${TABLE}.contract_uuid ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: occupied_beds {
    type: number
    sql: ${TABLE}.occupied_beds ;;
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

  dimension: underwritten_price {
    type: number
    sql: ${TABLE}.underwritten_price ;;
  }

  dimension: underwritten_price_incl_gst {
    type: number
    sql: ${TABLE}.underwritten_price_incl_gst ;;
  }

  measure: count {
    type: count
    drill_fields: [b2b_deal_name]
  }
}
