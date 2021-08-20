view: vas_orders_per_day {
  derived_table: {
    sql: with a as (select id,yr,mt, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
          order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
          gender, profession, ageing,move_in_date
          from looker_demo.derived_vas_orders
          where {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}
          and {% condition date %} date {% endcondition %}
          and date >= '2021-01-01 00:00:00'

          )

          select extract(month from date) mt, user_id, count(distinct order_code) orders, (count(distinct order_code) / day(last_day(date))) order_frequency
          from a
          group by 1,2
           ;;
  }

  parameter: residence {
    type: string
  }

  parameter: city {
    type: string
  }

  parameter: micromarket {
    type: string
  }

  parameter: date {
    type: date
  }

  dimension: mt {
    type: number
    sql: ${TABLE}.mt ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: orders {
    type: number
    sql: ${TABLE}.orders ;;
  }


  dimension: order_frequency {
    type: number
    sql: ${TABLE}.order_frequency ;;
  }

  measure: total_orders {
    type: sum
    sql: ${orders} ;;
  }

  measure: average_orders_frequency {
    type: average
    sql: ${order_frequency} ;;
  }

  measure: median_orders_frequency {
    type: median
    sql: ${order_frequency} ;;
  }


}
