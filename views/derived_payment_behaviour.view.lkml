view: derived_payment_behaviour {
  sql_table_name: stanza.derived_payment_behaviour ;;

  dimension_group: apr_paid {
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
    sql: ${TABLE}.apr_paid_date ;;
  }

  dimension_group: aug_paid {
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
    sql: ${TABLE}.aug_paid_date ;;
  }

  dimension: booking_id {
    type: number
    sql: ${TABLE}.booking_id ;;
  }

  dimension_group: dec_paid {
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
    sql: ${TABLE}.dec_paid_date ;;
  }

  dimension_group: feb_paid {
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
    sql: ${TABLE}.feb_paid_date ;;
  }

  dimension_group: jan_paid {
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
    sql: ${TABLE}.jan_paid_date ;;
  }

  dimension_group: jul_paid {
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
    sql: ${TABLE}.jul_paid_date ;;
  }

  dimension_group: jun_paid {
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
    sql: ${TABLE}.jun_paid_date ;;
  }

  dimension_group: mar_paid {
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
    sql: ${TABLE}.mar_paid_date ;;
  }

  dimension_group: may_paid {
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
    sql: ${TABLE}.may_paid_date ;;
  }

  dimension_group: nov_paid {
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
    sql: ${TABLE}.nov_paid_date ;;
  }

  dimension_group: oct_paid {
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
    sql: ${TABLE}.oct_paid_date ;;
  }

  dimension_group: sep_paid {
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
    sql: ${TABLE}.sep_paid_date ;;
  }

  measure: Feb_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${feb_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Mar_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${mar_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Apr_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${apr_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: May_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${may_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Jun_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${jun_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Jul_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${jul_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
  measure: Aug_Rent_Defualter {
    type: count_distinct
    # drill_fields: [payment_term_name, last_name, first_name]
    sql: case when ${aug_paid_date} IS NULL  then ${booking_id} else null end ;;
    value_format: "0"
  }
}
