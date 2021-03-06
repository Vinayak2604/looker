view: vas_ageing_order_bucket {
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

          select ageing, case when orders =1 then 'a. 1' when orders <=7 then 'b. 2-7' when orders <=14 then 'c. 7-14' when orders <=25 then 'd. 14-25'
          when orders >25 then 'e. >25' end as order_bucket, count(distinct user_id) users, sum(orders) total_orders
          from (select user_id,ageing, count(distinct order_code) orders
          from a
          group by 1,2) m
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

  dimension: ageing {
    type: number
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

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  measure: a_1_html {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'a. 1' then ${TABLE}.users  end);;
   hidden: yes
  }

  measure: b_2_7_html {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'b. 2-7' then ${TABLE}.users  end) ;;
    hidden: yes
  }

  measure: c_7_14_html {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'c. 7-14' then ${TABLE}.users  end) ;;
    hidden: yes

  }

  measure: d_14_25_html {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'd. 14-25' then ${TABLE}.users  end) ;;
    hidden: yes
  }

  measure: e_25_html {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'e. >25' then ${TABLE}.users  end) ;;
    hidden: yes
  }



  measure: a_1 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'a. 1' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
    html: <p> {{vas_ageing_order_bucket.a_1_html._rendered_value}} </p>;;
  }

  measure: b_2_7 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'b. 2-7' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
    html: <p> {{vas_ageing_order_bucket.b_2_7_html._rendered_value}} </p>;;
  }

  measure: c_7_14 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'c. 7-14' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
    html: <p> {{vas_ageing_order_bucket.c_7_14_html._rendered_value}} </p>;;
  }

  measure: d_14_25 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'd. 14-25' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
    html: <p> {{vas_ageing_order_bucket.d_14_25_html._rendered_value}} </p>;;
  }

  measure: e_25 {
    type: number
    sql: max(case when ${TABLE}.order_bucket = 'e. >25' then ${TABLE}.users  end) / ${users};;
    value_format: "0.0%"
    html: <p> {{vas_ageing_order_bucket.e_25_html._rendered_value}} </p>;;
  }

  measure: average_orders {
    type: number
    sql: ${total_orders} / ${users}  ;;
    value_format: "0.0"
  }


  }
