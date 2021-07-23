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

          m1 as ( select case when final_total_amount <=50 then 'a. 0-50' when final_total_amount <=100 then 'b. 50-100'
          when final_total_amount <=150 then 'c. 100-150' when final_total_amount <=200 then 'd. 150-200'
          when final_total_amount >200 then 'e. >200' end as aov_bucket,  count(distinct order_code) orders
          from a
          where {% condition date1 %} date {% endcondition %}
          group by 1),

          m2 as ( select case when final_total_amount <=50 then 'a. 0-50' when final_total_amount <=100 then 'b. 50-100'
          when final_total_amount <=150 then 'c. 100-150' when final_total_amount <=200 then 'd. 150-200'
          when final_total_amount >200 then 'e. >200' end as aov_bucket, count(distinct order_code) orders
          from a
          where {% condition date2 %} date {% endcondition %}
          group by 1),

          bucket as ( select distinct aov_bucket
          from
          ((select aov_bucket from m1)
          union
          (select aov_bucket from m2)) base )

          select ob.aov_bucket, m1.orders as m1_month_orders, m2.orders as m2_month_orders
          from bucket as ob
          left join m1 on ob.aov_bucket=m1.aov_bucket
          left join m2 on ob.aov_bucket=m2.aov_bucket
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

  dimension: aov_bucket {
    type: string
    sql: ${TABLE}.aov_bucket ;;
  }

  measure: m2_month_orders {
    type: string
    sql: ${TABLE}.m2_month_orders ;;
  }


  measure: m1_month_orders {
    type: string
    sql: ${TABLE}.m2_month_orders ;;
  }


}
