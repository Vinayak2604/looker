view: derived_vas_bucket_table {
  derived_table: {
    sql: with a as (select id, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
    order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
    gender, profession
    from looker_demo.derived_vas_orders
    where date >= '2021-01-01'
    ),

    m1 as ( select case when orders <=3 then '1-3' when orders <=5 then '3-5' when orders <=7 then '5-7' when orders <=10 then '7-10'
    when orders <=15 then '10-15' when orders >15 then '>15' end as order_bucket, count(distinct user_id) users
    from (select user_id, count(distinct order_code) orders
    from a
    where month(date) = (month(current_date) -1)
    group by 1)
    group by 1),

    m2 as ( select case when orders <=3 then '1-3' when orders <=5 then '3-5' when orders <=7 then '5-7' when orders <=10 then '7-10'
    when orders <=15 then '10-15' when orders >15 then '>15' end as order_bucket, count(distinct user_id) users
    from (select user_id, count(distinct order_code) orders
    from a
    where month(date) = (month(current_date) -2)
    group by 1)
    group by 1),

    bucket as ( select distinct order_bucket
    (select order_bucket from m1)
    union
    (select order_bucket from m2)),

    select ob.order_bucket, m2.users as m2_month_users, m1.users as m1_month_users
    from bucket as ob
    left join m1 on ob.order_bucket=m1.order_bucket
    left join m2 on ob.order_bucket=m2.order_bucket
    ;;
  }

  dimension: order_bucket {
    type: string
    sql: ${TABLE}.order_bucket ;;
  }

  dimension: m2_month_users {
    type: string
    sql: ${TABLE}.m2_month_users ;;
  }


  dimension: m1_month_users {
    type: string
    sql: ${TABLE}.m1_month_users ;;
  }


}
