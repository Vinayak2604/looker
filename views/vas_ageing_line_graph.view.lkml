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

          ),

          upr as (select extract(month from move_in_date) joining_month,ageing
          count(distinct upr.user_id) as moved_in_residents
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01 00:00:00'
      and cafe_availability = 1
      and {% condition residence %} residence {% endcondition %}
      and {% condition city %} city {% endcondition %}
      and {% condition micromarket %} micromarket {% endcondition %}
      group by 1,2),


          select m.joining_month, m.ageing,upr.moved_in_residents, avg(orders) orders, avg(amount) aov, count(distinct m.user_id) order_user
          from (select extract(month from move_in_date) joining_month, user_id,ageing,
          count(distinct order_code) orders, sum(final_total_amount) amount
          from a
          group by 1,2,3) m
          left join upr on m.joining_month=upr.joining_month and m.ageing=upr.ageing
          group by 1,2,3 ;;
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

  dimension: moved_in_residents {
    type: number
    sql: ${TABLE}.moved_in_residents ;;
  }

  dimension: order_user {
    type: number
    sql: ${TABLE}.order_user ;;
  }


  dimension: aov {
    type: number
    sql: ${TABLE}.aov ;;
  }

  measure: january_orders {
    type: sum
    sql:case when ${joining_month} = 1 then ${orders} end ;;
    value_format: "0"
  }

  measure: february_orders {
    type: sum
    sql:case when ${joining_month} = 2 then ${orders} end ;;
    value_format: "0"
  }

  measure: march_orders {
    type: sum
    sql:case when ${joining_month} = 3 then ${orders} end ;;
    value_format: "0"
  }

  measure: april_orders {
    type: sum
    sql:case when ${joining_month} = 4 then ${orders} end ;;
    value_format: "0"
  }

  measure: may_orders {
    type: sum
    sql:case when ${joining_month} = 5 then ${orders} end ;;
    value_format: "0"
  }

  measure: june_orders {
    type: sum
    sql:case when ${joining_month} = 6 then ${orders} end ;;
    value_format: "0"
  }

  measure: july_orders {
    type: sum
    sql:case when ${joining_month} = 7 then ${orders} end ;;
    value_format: "0"
  }

  measure: august_orders {
    type: sum
    sql:case when ${joining_month} = 8 then ${orders} end ;;
    value_format: "0"
  }

  measure: september_orders {
    type: sum
    sql:case when ${joining_month} = 9 then ${orders} end ;;
    value_format: "0"
  }

  measure: october_orders {
    type: sum
    sql:case when ${joining_month} = 10 then ${orders} end ;;
    value_format: "0"
  }

  measure: november_orders {
    type: sum
    sql:case when ${joining_month} = 11 then ${orders} end ;;
    value_format: "0"
  }

  measure: december_orders {
    type: sum
    sql:case when ${joining_month} = 12 then ${orders} end ;;
    value_format: "0"
  }

  measure: total_aov {
    type: sum
    sql: ${aov} ;;
  }


  measure: january_aov {
    type: sum
    sql:case when ${joining_month} = 1 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: february_aov {
    type: sum
    sql:case when ${joining_month} = 2 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: march_aov {
    type: sum
    sql:case when ${joining_month} = 3 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: april_aov {
    type: sum
    sql:case when ${joining_month} = 4 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: may_aov {
    type: sum
    sql:case when ${joining_month} = 5 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: june_aov {
    type: sum
    sql:case when ${joining_month} = 6 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: july_aov {
    type: sum
    sql:case when ${joining_month} = 7 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: august_aov {
    type: sum
    sql:case when ${joining_month} = 8 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: september_aov {
    type: sum
    sql:case when ${joining_month} = 9 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: october_aov {
    type: sum
    sql:case when ${joining_month} = 10 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: november_aov {
    type: sum
    sql:case when ${joining_month} = 11 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: december_aov {
    type: sum
    sql:case when ${joining_month} = 12 then ${aov} end ;;
    value_format: "0.0"
  }

  measure: order_user_per {
    type: number
    sql: ${order_user}/ ${moved_in_residents} ;;
    value_format: "0.0%"
  }



}
