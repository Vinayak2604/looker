view: derived_user_engagement_metrics {
  sql_table_name: stanza.derived_user_engagement_metrics ;;

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
    type: number
    sql: ${TABLE}.item_base_preference_breakfast ;;
  }



  dimension: item_base_preference_dinner {
    type: number
    sql: ${TABLE}.item_base_preference_dinner ;;
  }

  dimension: item_base_preference_evening_snacks {
    type: number
    sql: ${TABLE}.item_base_preference_evening_snacks ;;
  }

  dimension: item_base_preference_lunch {
    type: number
    sql: ${TABLE}.item_base_preference_lunch ;;
  }

  dimension: meal_consumed_breakfast {
    type: number
    sql: ${TABLE}.meal_consumed_breakfast ;;
  }

  dimension: meal_consumed_dinner {
    type: number
    sql: ${TABLE}.meal_consumed_dinner ;;
  }

  dimension: meal_consumed_evening_snacks {
    type: number
    sql: ${TABLE}.meal_consumed_evening_snacks ;;
  }

  dimension: meal_consumed_lunch {
    type: number
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

  dimension: preference_available_breakfast {
    type: number
    sql: ${TABLE}.preference_available_breakfast ;;
  }

  dimension: preference_available_lunch {
    type: number
    sql: ${TABLE}.preference_available_lunch ;;
  }

  dimension: preference_available_evening_snacks {
    type: number
    sql: ${TABLE}.preference_available_evening_snacks ;;
  }

  dimension: preference_available_dinner {
    type: number
    sql: ${TABLE}.preference_available_dinner ;;
  }


  dimension: retained_user {
    type: number
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
    type: number
    sql: ${TABLE}.whatsapp_concent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_complaints1 {
    type: number
    sql:nullif(sum(${total_complaints}),0) ;;
  }

  measure: total_vas_orders {
    type: number
    sql:nullif(sum(${vas_orders}),0) ;;
  }

  measure: vas_aov {
    type: number
    sql:avg(case when ${vas_ov} >0 then ${vas_ov} end) ;;
  }

  measure: total_shared_preference {
    type: number
    sql:sum(COALESCE(${item_base_preference_breakfast},0) + COALESCE(${item_base_preference_lunch},0) + COALESCE(${item_base_preference_evening_snacks},0) + COALESCE(${item_base_preference_dinner},0)) ;;
  }

  measure: total_consumed_meals {
    type: number
    sql:(COALESCE(sum(${meal_consumed_breakfast}),0) + COALESCE(sum(${meal_consumed_lunch}),0) + COALESCE(sum(${meal_consumed_evening_snacks}),0) + COALESCE(sum(${meal_consumed_dinner}),0)) ;;
  }

  measure: total_available_meals {
    type: number
    sql:nullif(sum(COALESCE(case when ${meal_consumed_breakfast} >= 0 then 1 end,0) + COALESCE(case when ${meal_consumed_lunch} >= 0 then 1 end,0) + COALESCE(case when ${meal_consumed_evening_snacks} >= 0 then 1 end,0)+ COALESCE(case when ${meal_consumed_dinner} >= 0 then 1 end,0)),0) ;;
  }

  measure: total_preference_available {
    type: number
    sql:sum(COALESCE(${preference_available_breakfast},0) + COALESCE(${preference_available_lunch},0) + COALESCE(${preference_available_evening_snacks},0) + COALESCE(${preference_available_dinner},0)) ;;
  }

  measure: shared_preference_per {
    type: number
    sql: nullif(sum(COALESCE(${item_base_preference_breakfast},0) + COALESCE(${item_base_preference_lunch},0) + COALESCE(${item_base_preference_evening_snacks},0) + COALESCE(${item_base_preference_dinner},0)),0)/ nullif(sum(COALESCE(${preference_available_breakfast},0) + COALESCE(${preference_available_lunch},0) + COALESCE(${preference_available_evening_snacks},0) + COALESCE(${preference_available_dinner},0)),0) ;;
    value_format: "0.00%"
  }

  measure: vas_fps {
    type: number
    sql: avg(case when ${vas_rating} > 0 then ${vas_rating} end) ;;
    value_format: "0.0"
  }

  measure: meal_fps {
    type: number
    sql: nullif(sum(COALESCE(${meal_rating_breakfast},0)+COALESCE(${meal_rating_lunch},0)+COALESCE(${meal_rating_evening_snacks},0)+COALESCE(${meal_rating_dinner},0)),0) / nullif(sum(COALESCE(case when ${meal_rating_breakfast} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_lunch} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_evening_snacks} > 0 then 1 end,0)+ COALESCE(case when ${meal_rating_dinner} > 0 then 1 end,0)),0) ;;
    value_format: "0.0"
  }

  measure: rated_meals {
    type: number
    sql: sum(COALESCE(case when ${meal_rating_breakfast} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_lunch} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_evening_snacks} > 0 then 1 end,0)+ COALESCE(case when ${meal_rating_dinner} > 0 then 1 end,0)) ;;

  }

  measure: meal_rating {
    type: number
    sql: 1.0*nullif(coalesce(${rated_meals},0),0) / coalesce(${total_consumed_meals},0)  ;;
    value_format: "0.00%"
  }

  measure: consumed_meal_per {
    type: number
    sql: 1.0*nullif(coalesce(${total_consumed_meals},0),0) / coalesce(${total_available_meals},0)  ;;
    value_format: "0.00%"
  }

  measure: vas_rating1 {
    type: number
    sql: nullif(sum(${vas_rating}),0) / sum(${vas_orders}) ;;
    value_format: "0.00%"
  }






  measure: all_complaints_per_month {
    type: number
    sql: case when ${total_complaints1} >= 2 then 0
    when ${total_complaints1} = 1 then 0.50*3
    else 3 end ;;
    value_format: "0.00"
  }

  measure: engagement_feedback_vas_order_rating {
    type: number
    sql: case when ${vas_rating1} >= 70% then ${vas_rating1}*2
          else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_vas_order_rating {
    type: number
    sql: case when ${vas_rating1} >= 70% then ${vas_rating1}*3
          else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_vas_order_rating {
    type: number
    sql: case when ${vas_rating1} >= 70% then ${vas_rating1}*2.5
          else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_feedback_smr {
    type: number
    sql: case when ${meal_rating} >= 30% then 2
    when ${meal_rating} >= 10% then 0.50*2
      else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_smr{
    type: number
    sql:case when ${meal_rating} >= 30% then 3
    when ${meal_rating} >= 10% then 0.50*3
      else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_smr {
    type: number
    sql:case when ${meal_rating} >= 30% then 2.5
    when ${meal_rating} >= 10% then 0.50*2.5
      else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_feedback_meal_fps {
    type: number
    sql: case when ${meal_fps} >= 4.5 then 2
          when ${meal_fps} >= 2 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_meal_fps{
    type: number
    sql:case when ${meal_fps} >= 4.5 then 3
          when ${meal_fps} >= 2 then 0.50*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_meal_fps {
    type: number
    sql:case when ${meal_fps} >= 4.5 then 2.5
          when ${meal_fps} >= 2 then 0.50*2.5
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_feedback_vas_fps {
    type: number
    sql: case when ${vas_fps} >= 4.5 then 2
          when ${vas_fps} >= 2 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_vas_fps{
    type: number
    sql:case when ${vas_fps} >= 4.5 then 3
          when ${vas_fps} >= 2 then 0.50*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_vas_fps {
    type: number
    sql:case when ${vas_fps} >= 4.5 then 2.5
          when ${vas_fps} >= 2 then 0.50*2.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_loyalty_repeat_customer {
    type: number
    sql: case when ${retained_user} = 1 then 2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_loyalty_repeat_customer {
    type: number
    sql:case when ${retained_user} = 1 then 3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_loyalty_repeat_customer {
    type: number
    sql:case when ${retained_user} = 1 then 2.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: all_loyalty_referred {
    type: number
    sql: case when ${total_referrals} > 1 then 2
    when ${total_referrals} = 1 then 0.50*2
      else 0 end ;;
    value_format: "0.00"
  }

  measure: all_loyalty_earned {
    type: number
    sql: case when ${total_converted_referrals} > 1 then 2
          when ${total_converted_referrals} = 1 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  dimension: engagement_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payments} = 3 then 0
          when ${on_time_payments_on_last_3_payments} = 2 then 0.66*0
          when ${on_time_payments_on_last_3_payments} = 1 then 0.33*0
            else 0 end ;;
    value_format: "0.00"
  }

  dimension: experience_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payments} = 3 then 3
          when ${on_time_payments_on_last_3_payments} = 2 then 0.66*3
          when ${on_time_payments_on_last_3_payments} = 1 then 0.33*3
            else 0 end ;;
    value_format: "0.00"
  }

  dimension: total_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payments} = 3 then 1.5
          when ${on_time_payments_on_last_3_payments} = 2 then 0.66*1.5
          when ${on_time_payments_on_last_3_payments} = 1 then 0.33*1.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: all_transaction_preference_shared {
    type: number
    sql: case when ${shared_preference_per} >= 50% then 3
          when ${shared_preference_per} >= 40% then 0.75*3
          when ${shared_preference_per} >= 30% then 0.50*3
          when ${shared_preference_per} >= 20% then 0.25*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 70% then 1
          when ${consumed_meal_per} >= 20% then 1* ${consumed_meal_per}
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 70% then 3
          when ${consumed_meal_per} >= 20% then 3*${consumed_meal_per}
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 70% then 2
          when ${consumed_meal_per} >= 20% then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_vas_aov {
    type: number
    sql: case when ${vas_aov} >= 100 then 3
          when ${vas_aov} >= 50 then 0.50*3
          when ${vas_aov} >= 1 then 0.25*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_vas_aov {
    type: number
    sql: case when ${vas_aov} >= 100 then 2
          when ${vas_aov} >= 50 then 0.50*2
          when ${vas_aov} >= 1 then 0.25*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_vas_aov {
    type: number
    sql: case when ${vas_aov} >= 100 then 2.5
          when ${vas_aov} >= 50 then 0.50*2.5
          when ${vas_aov} >= 1 then 0.25*2.5
            else 0 end ;;
    value_format: "0.00"
  }

  measure: all_vas_orders {
    type: number
    sql: case when ${vas_aov} >= 5 then 3
          when ${vas_aov} >= 3 then 0.50*3
          when ${vas_aov} >= 1 then 0.25*3
            else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_score {
    type: number
    sql: 1.0*(coalesce(${all_complaints_per_month},0)+coalesce(${engagement_feedback_vas_order_rating},0)+
    coalesce(${engagement_feedback_smr},0)+coalesce(${engagement_feedback_meal_fps},0)+
    coalesce(${engagement_feedback_vas_fps},0)+coalesce(${engagement_loyalty_repeat_customer},0)+
    coalesce(${all_loyalty_referred},0)+coalesce(${all_loyalty_earned},0)+
    coalesce(${engagement_transaction_pays_rent_within_due_date},0)+coalesce(${all_transaction_preference_shared},0)+
    coalesce(${engagement_transaction_meals_consumed},0)+coalesce(${engagement_vas_aov},0)+
    coalesce(${all_vas_orders},0)) / 27 ;;
    value_format: "0.00%"
  }

  measure: experience_score {
    type: number
    sql: 1.0*(coalesce(${all_complaints_per_month},0)+coalesce(${experience_feedback_vas_order_rating},0)+
          coalesce(${experience_feedback_smr},0)+coalesce(${experience_feedback_meal_fps},0)+
          coalesce(${experience_feedback_vas_fps},0)+coalesce(${experience_loyalty_repeat_customer},0)+
          coalesce(${all_loyalty_referred},0)+coalesce(${all_loyalty_earned},0)+
          coalesce(${experience_transaction_pays_rent_within_due_date},0)+coalesce(${all_transaction_preference_shared},0)+
          coalesce(${experience_transaction_meals_consumed},0)+coalesce(${experience_vas_aov},0)+
          coalesce(${all_vas_orders},0)) / 36 ;;
    value_format: "0.00%"
  }

  measure: total_score {
    type: number
    sql: 1.0*(coalesce(${all_complaints_per_month},0)+coalesce(${total_feedback_vas_order_rating},0)+
          coalesce(${total_feedback_smr},0)+coalesce(${total_feedback_meal_fps},0)+
          coalesce(${total_feedback_vas_fps},0)+coalesce(${total_loyalty_repeat_customer},0)+
          coalesce(${all_loyalty_referred},0)+coalesce(${all_loyalty_earned},0)+
          coalesce(${total_transaction_pays_rent_within_due_date},0)+coalesce(${all_transaction_preference_shared},0)+
          coalesce(${total_transaction_meals_consumed},0)+coalesce(${total_vas_aov},0)+
          coalesce(${all_vas_orders},0)) / 31.5 ;;
    value_format: "0.00%"
  }



}
