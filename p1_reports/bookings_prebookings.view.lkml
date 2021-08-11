view: bookings_prebookings {
  sql_table_name: derived_sales_summary ;;
  # derived_table: {
  #   sql:
  #   select *
  #   from derived_sales_summary
  #   where {% condition residence_category %} residence_category {% endcondition %};;
  # }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: bookings {
    type: sum
    sql: ${TABLE}.bookings ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_lat {
    type: string
    sql: ${TABLE}.city_lat ;;
  }

  dimension: city_long {
    type: string
    sql: ${TABLE}.city_long ;;
  }

  dimension: converted_prebookings {
    type: number
    sql: ${TABLE}.converted_prebookings ;;
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

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  measure: prebookings {
    type: sum
    sql: ${TABLE}.prebookings ;;
  }

  dimension: refunded_prebookings {
    type: number
    sql: ${TABLE}.refunded_prebookings ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
  }

  dimension: date_index {
    type: number
    sql: ${id}/${id} ;;
    # hidden: yes
  }

  measure: date_count {
    type: running_total
    sql: ${date_index} ;;
  }

  measure: running_total{
    type: running_total
    sql: ${bookings} + ${prebookings} ;;
  }

  # parameter: residence_category {
  #   type: "string"
  #   allowed_value: {
  #     label: "Scholar"
  #     value: "1"
  #   }
  #   allowed_value: {
  #     label: "Suits"
  #     value: "0"
  #   }
  #   allowed_value: {
  #     label: "Studio"
  #     value: "2"
  #   }
  # }

  # filter: residence_category {
  #   type: string
  #   suggestions: ["Scholar","Suits","Studio"]
  # }

  dimension: residence_category {
    type: string
    sql: ${TABLE}.residence_category ;;
  }

  # measure: moving_avg {
  #   type: number
  #   sql: ${running_total}/${date_count} ;;
  # }
}
