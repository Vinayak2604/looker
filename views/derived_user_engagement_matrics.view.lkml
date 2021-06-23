view: derived_user_engagement_matrics {
  sql_table_name: stanza.derived_user_engagement_matrics ;;

  dimension: key {
    primary_key: yes
    type: string
    hidden: yes
    sql: concat(${TABLE}.date,' ', ${TABLE}.student_id) ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: item_base_preference_breakfast {
    type: string
    sql: ${TABLE}.item_base_preference_breakfast ;;
  }



  dimension: item_base_preference_dinner {
    type: string
    sql: ${TABLE}.item_base_preference_dinner ;;
  }

  dimension: item_base_preference_evening_snacks {
    type: string
    sql: ${TABLE}.item_base_preference_evening_snacks ;;
  }

  dimension: item_base_preference_lunch {
    type: string
    sql: ${TABLE}.item_base_preference_lunch ;;
  }

  dimension: meal_consumed_breakfast {
    type: string
    sql: ${TABLE}.meal_consumed_breakfast ;;
  }

  dimension: meal_consumed_dinner {
    type: string
    sql: ${TABLE}.meal_consumed_dinner ;;
  }

  dimension: meal_consumed_evening_snacks {
    type: string
    sql: ${TABLE}.meal_consumed_evening_snacks ;;
  }

  dimension: meal_consumed_lunch {
    type: string
    sql: ${TABLE}.meal_consumed_lunch ;;
  }

  dimension: meal_rating_breakfast {
    type: number
    sql: ${TABLE}.meal_rating_breakfast ;;
  }

  dimension: meal_rating_dinner {
    type: number
    sql: ${TABLE}.meal_rating_dinner ;;
  }

  dimension: meal_rating_evening_snacks {
    type: number
    sql: ${TABLE}.meal_rating_evening_snacks ;;
  }

  dimension: meal_rating_lunch {
    type: number
    sql: ${TABLE}.meal_rating_lunch ;;
  }

  dimension: non_on_time_payments {
    type: number
    sql: ${TABLE}.non_on_time_payments ;;
  }

  dimension: on_time_payments {
    type: number
    sql: ${TABLE}.on_time_payments ;;
  }

  dimension: on_time_payments_on_last_3_payments {
    type: number
    sql: ${TABLE}.on_time_payments_on_last_3_payments ;;
  }

  dimension: retained_user {
    type: string
    sql: ${TABLE}.retained_user ;;
  }

  dimension: satisfied_feedback {
    type: number
    sql: ${TABLE}.satisfied_feedback ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: total_complaints {
    type: number
    sql: ${TABLE}.total_complaints ;;
  }

  dimension: total_converted_referrals {
    type: number
    sql: ${TABLE}.total_converted_referrals ;;
  }

  dimension: total_feedback {
    type: number
    sql: ${TABLE}.total_feedback ;;
  }

  dimension: total_referral_earning {
    type: number
    sql: ${TABLE}.total_referral_earning ;;
  }

  dimension: total_referrals {
    type: number
    sql: ${TABLE}.total_referrals ;;
  }

  dimension: vas_orders {
    type: number
    sql: ${TABLE}.vas_orders ;;
  }

  dimension: vas_ov {
    type: number
    sql: ${TABLE}.vas_ov ;;
  }

  dimension: vas_rating {
    type: number
    sql: ${TABLE}.vas_rating ;;
  }

  dimension: whatsapp_concent {
    type: string
    sql: ${TABLE}.whatsapp_concent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: 3_month_complaints {
    type: number
    sql:sum(case when date(${date_date}) >= date_add(current_date,INTERVAL -90 DAY) then ${total_complaints} end)  ;;
    }

  measure: vas_order_last_month {
    type: number
    sql:sum(case when date(${date_date}) >= date_add(current_date,INTERVAL -30 DAY) then ${vas_orders} end)  ;;
  }

  measure: vas_aov_last_month {
    type: number
    sql:avg(case when date(${date_date}) >= date_add(current_date,INTERVAL -30 DAY) then ${vas_ov} end)  ;;
  }


}
