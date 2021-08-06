view: vas_ageing_aov_bucket {
  derived_table: {
    sql: with a as (select id,yr,mt, date,  residence,  micromarket,  city, cafe, mealtime, order_code, user_type,  order_type,
          order_status, final_total_amount, delivery_time,  expected_delivery_time, in_room service_mode, rating, feedback_for, feedback, user_id,  phone name, email,
          gender, profession, ageing,move_in_date
          from looker_demo.derived_vas_orders
          where {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}

          )

          select ageing, case when final_total_amount <=25 then 'a. 0-25' when final_total_amount <=50 then 'b. 25-50'
          when final_total_amount <=75 then 'c. 50-75' when final_total_amount <=100 then 'd. 75-100'
          when final_total_amount >100 then 'e. >100' end as amount_bucket,  count(distinct order_code) orders , sum(final_total_amount) total_amount
          from a
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

  dimension: amount_bucket {
    type: string
    sql: ${TABLE}.amount_bucket ;;
  }

  measure: orders {
    type: sum
    sql: ${TABLE}.orders ;;
  }

  measure: total_amount {
    type: sum
    sql: ${TABLE}.total_amount ;;
  }

  measure: aov {
    type: number
    sql: ${total_amount} / ${orders} ;;
    value_format: "0"
    html: <p> &#x20B9; {{rendered_value}} </p> ;;
  }

  measure: 0_25 {
    type: number
    sql: max(case when ${TABLE}.amount_bucket = 'a. 0-25' then ${TABLE}.orders end) / ${orders} ;;
    value_format: "0.0%"
  }

  measure: 25_50 {
    type: number
    sql: max(case when ${TABLE}.amount_bucket = 'b. 25-50' then ${TABLE}.orders end) / ${orders} ;;
    value_format: "0.0%"
  }

  measure: 50_75 {
    type: number
    sql: max(case when ${TABLE}.amount_bucket = 'c. 50-75' then ${TABLE}.orders end) / ${orders} ;;
    value_format: "0.0%"
  }

  measure: 75_100 {
    type: number
    sql: max(case when ${TABLE}.amount_bucket = 'd. 75-100' then ${TABLE}.orders end) / ${orders} ;;
    value_format: "0.0%"
  }

  measure: _100 {
    type: number
    sql: max(case when ${TABLE}.amount_bucket = 'e. >100' then ${TABLE}.orders end) / ${orders} ;;
    value_format: "0.0%"
  }





}
