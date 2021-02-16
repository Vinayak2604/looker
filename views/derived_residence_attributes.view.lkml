view: derived_residence_attributes {
  sql_table_name: looker_demo.derived_residence_attributes ;;
  drill_fields: [residence_level*,total_beds]

  set: residence_level {
    fields: [
      residence
    ]
  }

  dimension: available_beds {
    type: number
    sql: ${TABLE}.available_beds ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  # dimension: date_residence {
  #   type: string
  #   primary_key: yes
  #   # hidden: yes
  #   sql: concat(str(${date_date}),'||',str(${residence_id})) ;;
  # }

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
    drill_fields: [residence_level*]
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
    primary_key: yes
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

  dimension: prebookings {
    type: number
    sql: ${TABLE}.prebookings ;;
  }

  dimension: refunded_prebookings {
    type: number
    sql: ${TABLE}.refunded_prebookings ;;
  }

  dimension: converted_prebookings {
    type: number
    sql: ${TABLE}.converted_prebookings ;;
  }

  measure: total_beds {
    type: sum
    sql: ${live_beds} ;;
    value_format: "#,##0"
    drill_fields: [date_date, total_beds]
    link: {
      label: "micromarket_cut"
      url: "{{derived_residence_attributes.total_beds_mm._link}}"
    }
  }

  measure: total_beds_mm {
    type:  sum
    sql: ${live_beds} ;;
    value_format: "#,##0"
    hidden: yes
    drill_fields: [residence,total_beds]
  }

  measure: total_sold_beds {
    type: sum
    sql: ${sold_beds} ;;
    value_format: "#,##0"
  }

  measure: total_onboarded_beds {
    type: sum
    sql: ${onboarded_beds} ;;
    value_format: "#,##0"
  }

  measure: total_early_exits {
    type: sum
    sql: ${early_exits} ;;
    value_format: "#,##0"
  }

  measure: total_future_move_ins {
    type: sum
    sql: ${future_move_ins} ;;
    value_format: "#,##0"
  }

  measure: total_not_moved_ins {
    type: sum
    sql: ${not_moved_in} ;;
    value_format: "#,##0"
  }

  measure: total_available_beds {
    type: sum
    sql: ${available_beds} ;;
    value_format: "#,##0"
  }

  measure: total_underwritten {
    type: sum
    sql: ${underwritten_price} ;;
    value_format: "#,##0"
  }

  measure: total_prebookings {
    type: sum
    sql: ${prebookings} ;;
    value_format: "#,##0"
  }


  measure: total_refunded_prebookings {
    type: sum
    sql: ${refunded_prebookings} ;;
    value_format: "#,##0"
  }


  measure: total_converted_prebookings {
    type: sum
    sql: ${converted_prebookings} ;;
    value_format: "#,##0"
  }

  parameter:  geographical_cuts {
    type: "string"
    allowed_value: {
      label: "residence"
      value: "residence"
    }
    allowed_value: {
      label: "micromarket"
      value: "micromarket"
    }
    allowed_value: {
      label: "city"
      value: "city"
    }
  }

  dimension: goegraphy_selector {
    label_from_parameter: geographical_cuts
    sql:
            CASE
             WHEN {% parameter geographical_cuts %} = 'residence' THEN ${residence}
             WHEN {% parameter geographical_cuts %} = 'micromarket' THEN ${micromarket}
             WHEN {% parameter geographical_cuts %} = 'city' THEN ${city}
             ELSE NULL
            END ;;
  }


}
