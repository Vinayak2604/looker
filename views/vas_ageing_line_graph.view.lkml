view: vas_ageing_line_graph {
  derived_table: {
    sql: with a as (select id,yr,mt, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
          order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
          gender, profession, ageing,move_in_date
          from looker_demo.derived_vas_orders
          where {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}
          and move_in_date >= '2021-01-01 00:00:00'

          )

          select joining_month, ageing, avg(orders) orders, avg(amount) aov
          from (select extract(month from move_in_date) joining_month, user_id,ageing, count(distinct order_code) orders, sum(final_total_amount) amount
          from a
          group by 1,2,3) m
          group by 1,2 ;;
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

  dimension: joining_month {
    type: number
    sql: ${TABLE}.joining_month ;;
  }

  dimension: ageing {
    type: number
    sql: ${TABLE}.ageing ;;
  }

  dimension: orders {
    type: number
    sql: ${TABLE}.orders ;;
  }


  dimension: aov {
    type: number
    sql: ${TABLE}.aov ;;
  }

  measure: total_orders {
    type: running_total
    sql: ${orders} ;;
  }

  measure: total_aov {
    type: running_total
    sql: ${aov} ;;
  }


}
