view: derived_vas_aov_bucket {
  derived_table: {
    sql: with a as (select id, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
          order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
          gender, profession
          from looker_demo.derived_vas_orders
          where {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}

          ),

          m1 as ( select case when final_total_amount <=25 then 'a. 0-25' when final_total_amount <=50 then 'b. 25-50'
          when final_total_amount <=75 then 'c. 50-75' when final_total_amount <=100 then 'd. 75-100'
          when final_total_amount >100 then 'e. >100' end as amount_bucket,  count(distinct order_code) orders
          from a
          where {% condition date1 %} date {% endcondition %}
          group by 1),

          m2 as ( select case when final_total_amount <=25 then 'a. 0-25' when final_total_amount <=50 then 'b. 25-50'
          when final_total_amount <=75 then 'c. 50-75' when final_total_amount <=100 then 'd. 75-100'
          when final_total_amount >100 then 'e. >100' end as amount_bucket, count(distinct order_code) orders
          from a
          where {% condition date2 %} date {% endcondition %}
          group by 1),

          bucket as ( select distinct amount_bucket
          from
          ((select amount_bucket from m1)
          union
          (select amount_bucket from m2)) base )

          select ob.amount_bucket, m1.orders as m1_month_orders, m2.orders as m2_month_orders
          from bucket as ob
          left join m1 on ob.amount_bucket=m1.amount_bucket
          left join m2 on ob.amount_bucket=m2.amount_bucket
          ;;
  }



  parameter: date1 {
    type: date
  }


  parameter: date2 {
    type: date
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

  dimension: amount_bucket {
    type: string
    sql: ${TABLE}.amount_bucket ;;
  }

  measure: m2_month_orders {
    type: string
    sql: ${TABLE}.m2_month_orders ;;
  }


  measure: m1_month_orders {
    type: string
    sql: ${TABLE}.m1_month_orders ;;
  }


}
