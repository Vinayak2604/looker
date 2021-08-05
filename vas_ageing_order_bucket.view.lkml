view: vas_ageing_order_bucket {
  derived_table: {
    sql: with a as (select id,yr,mt, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
          order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
          gender, profession, ageing,move_in_date
          from looker_demo.derived_vas_orders
          where {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}

          )

          select ageing, case when orders =1 then 'a. 1' when orders <=7 then 'b. 2-7' when orders <=14 then 'c. 7-14' when orders <=25 then 'd. 14-25'
          when orders >25 then 'e. >25' end as order_bucket, count(distinct user_id) over(partition by ageing, order_bucket) users,
          avg(orders) over(partition by ageing) average_orders
          from (select user_id,ageing, count(distinct order_code) orders
          from a
          group by 1,2) m
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

  dimension: ageing {
    type: string
    sql: ${TABLE}.ageing ;;
  }

  dimension: order_bucket {
    type: string
    sql: ${TABLE}.order_bucket ;;
  }

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: a_1 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'a. 1' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
  }

  measure: b_2_7 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'b. 2-7' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
  }

  measure: c_7_14 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'c. 7-14' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
  }

  measure: d_14_25 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'd. 14-25' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
  }

  measure: e_25 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'e. >25' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
  }

  measure: average_orders {
    type: number
    sql: ${TABLE}.average_orders ;;
    value_format: "0.0"
  }


  }
