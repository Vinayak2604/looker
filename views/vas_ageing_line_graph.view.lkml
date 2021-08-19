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

  measure: january_orders {
    type: sum
    sql:case when ${joining_month} = 1 then ${orders} end ;;
  }

  measure: february_orders {
    type: sum
    sql:case when ${joining_month} = 2 then ${orders} end ;;
  }

  measure: march_orders {
    type: sum
    sql:case when ${joining_month} = 3 then ${orders} end ;;
  }

  measure: april_orders {
    type: sum
    sql:case when ${joining_month} = 4 then ${orders} end ;;
  }

  measure: may_orders {
    type: sum
    sql:case when ${joining_month} = 5 then ${orders} end ;;
  }

  measure: june_orders {
    type: sum
    sql:case when ${joining_month} = 6 then ${orders} end ;;
  }

  measure: july_orders {
    type: sum
    sql:case when ${joining_month} = 7 then ${orders} end ;;
  }

  measure: august_orders {
    type: sum
    sql:case when ${joining_month} = 8 then ${orders} end ;;
  }

  measure: september_orders {
    type: sum
    sql:case when ${joining_month} = 9 then ${orders} end ;;
  }

  measure: october_orders {
    type: sum
    sql:case when ${joining_month} = 10 then ${orders} end ;;
  }

  measure: november_orders {
    type: sum
    sql:case when ${joining_month} = 11 then ${orders} end ;;
  }

  measure: december_orders {
    type: sum
    sql:case when ${joining_month} = 12 then ${orders} end ;;
  }

  measure: total_aov {
    type: sum
    sql: ${aov} ;;
  }


  measure: january_aov {
    type: sum
    sql:case when ${joining_month} = 1 then ${aov} end ;;
  }

  measure: february_aov {
    type: sum
    sql:case when ${joining_month} = 2 then ${aov} end ;;
  }

  measure: march_aov {
    type: sum
    sql:case when ${joining_month} = 3 then ${aov} end ;;
  }

  measure: april_aov {
    type: sum
    sql:case when ${joining_month} = 4 then ${aov} end ;;
  }

  measure: may_aov {
    type: sum
    sql:case when ${joining_month} = 5 then ${aov} end ;;
  }

  measure: june_aov {
    type: sum
    sql:case when ${joining_month} = 6 then ${aov} end ;;
  }

  measure: july_aov {
    type: sum
    sql:case when ${joining_month} = 7 then ${aov} end ;;
  }

  measure: august_aov {
    type: sum
    sql:case when ${joining_month} = 8 then ${aov} end ;;
  }

  measure: september_aov {
    type: sum
    sql:case when ${joining_month} = 9 then ${aov} end ;;
  }

  measure: october_aov {
    type: sum
    sql:case when ${joining_month} = 10 then ${aov} end ;;
  }

  measure: november_aov {
    type: sum
    sql:case when ${joining_month} = 11 then ${aov} end ;;
  }

  measure: december_aov {
    type: sum
    sql:case when ${joining_month} = 12 then ${aov} end ;;
  }


}
