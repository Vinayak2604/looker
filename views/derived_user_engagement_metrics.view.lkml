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

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: complaint_status {
    type: string
    sql: ${TABLE}.complaint_status ;;
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


  dimension: total_used_gb {
    type: number
    sql: ${TABLE}.total_used_gb ;;
  }

  dimension: menu_opened {
    type: number
    sql: ${TABLE}.menu_opened ;;
  }

  dimension: story {
    type: number
    sql: ${TABLE}.story ;;
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
    sql: 1.00*nullif(sum(COALESCE(${meal_rating_breakfast},0)+COALESCE(${meal_rating_lunch},0)+COALESCE(${meal_rating_evening_snacks},0)+COALESCE(${meal_rating_dinner},0)),0) / nullif(sum(COALESCE(case when ${meal_rating_breakfast} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_lunch} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_evening_snacks} > 0 then 1 end,0)+ COALESCE(case when ${meal_rating_dinner} > 0 then 1 end,0)),0) ;;
    value_format: "0.0"
  }

  measure: rated_meals {
    type: number
    sql: sum(COALESCE(case when ${meal_rating_breakfast} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_lunch} > 0 then 1 end,0) + COALESCE(case when ${meal_rating_evening_snacks} > 0 then 1 end,0)+ COALESCE(case when ${meal_rating_dinner} > 0 then 1 end,0)) ;;

  }

  measure: meal_rating {
    type: number
    sql: 1.00*nullif(coalesce(${rated_meals},0),0) / coalesce(${total_consumed_meals},0)  ;;
    value_format: "0.00%"
  }

  measure: consumed_meal_per {
    type: number
    sql: 1.00*nullif(coalesce(${total_consumed_meals},0),0) / coalesce(${total_available_meals},0)  ;;
    value_format: "0.00%"
  }

  measure: vas_rating1 {
    type: number
    sql: nullif(sum(${vas_rating}),0) / sum(${vas_orders}) ;;
    value_format: "0.00%"
  }

  measure: closed_satisfied_complaints {
    type: number
    sql: 1.00*nullif(sum(case when ${complaint_status} = 'CLOSED' then ${satisfied_feedback} end),0) /
      sum(case when ${complaint_status} = 'CLOSED' then ${total_feedback} end) ;;
    value_format: "0.00%"
  }

  measure: resolved_satisfied_complaints {
    type: number
    sql: 1.00*nullif(sum(case when ${complaint_status} = 'RESOLVED'  then ${satisfied_feedback} end),0) /
      sum(case when ${complaint_status} = 'RESOLVED' then  ${total_feedback} end) ;;
    value_format: "0.00%"
  }


  measure: closed_complaints {
    type: number
    sql: sum(case when ${complaint_status} = 'CLOSED' then ${total_complaints} end) ;;
  }

  measure: resolved_complaints {
    type: number
    sql: sum(case when ${complaint_status} = 'RESOLVED' then ${total_complaints} end) ;;
  }


  measure: retain_user {
    type: count_distinct
    sql: case when ${retained_user} = 1 then ${student_id} end   ;;
  }

  measure: total_referral {
    type: sum_distinct
    sql: ${total_referrals}   ;;
    sql_distinct_key: ${student_id} ;;
  }

  measure: total_converted_referral {
    type: sum_distinct
    sql: ${total_converted_referrals}   ;;
    sql_distinct_key: ${student_id} ;;
  }

  measure: on_time_payments_on_last_3_payment {
    type: sum_distinct
    sql: ${on_time_payments_on_last_3_payments}   ;;
    sql_distinct_key: ${student_id};;
  }

  measure: students {
    type: count_distinct
    sql: ${student_id} ;;
  }

  measure: total_used_internet {
    type: sum
    sql: ${total_used_gb} ;;
  }


  measure: total_menu_opened {
    type: count_distinct
    sql: case when ${menu_opened} >= 1 then ${TABLE}.date end ;;
  }

  measure: total_story {
    type: sum
    sql: ${story} ;;
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
    sql: case when ${vas_rating1} >= 0.70 then ${vas_rating1}*2
      else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_vas_order_rating {
    type: number
    sql: case when ${vas_rating1} >= 0.70 then ${vas_rating1}*3
      else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_vas_order_rating {
    type: number
    sql: case when ${vas_rating1} >= 0.70 then ${vas_rating1}*2.5
      else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_feedback_rating_on_tickets_closed {
    type: number
    sql: case when (${closed_satisfied_complaints} >= 0.75 OR coalesce(${closed_complaints},0) = 0) then 2
          when ${closed_satisfied_complaints} >= 0.50 then 0.75*2
          when ${closed_satisfied_complaints} >= 0.25 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_rating_on_tickets_closed {
    type: number
    sql: case when (${closed_satisfied_complaints} >= 0.75 OR coalesce(${closed_complaints},0) =  0) then 3
          when ${closed_satisfied_complaints} >= 0.50 then 0.75*3
          when ${closed_satisfied_complaints} >= 0.25 then 0.50*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_rating_on_tickets_closed {
    type: number
    sql: case when (${closed_satisfied_complaints} >= 0.75 OR coalesce(${closed_complaints},0) =  0) then 2.5
          when ${closed_satisfied_complaints} >= 0.50 then 0.75*2.5
          when ${closed_satisfied_complaints} >= 0.25 then 0.50*2.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_feedback_rating_on_tickets_resolved {
    type: number
    sql: case when (${resolved_satisfied_complaints} >= 0.75 OR coalesce(${resolved_complaints},0) =  0) then 2
          when ${resolved_satisfied_complaints} >= 0.50 then 0.75*2
          when ${resolved_satisfied_complaints} >= 0.25 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_rating_on_tickets_resolved {
    type: number
    sql: case when (${resolved_satisfied_complaints} >= 0.75 OR coalesce(${resolved_complaints},0) =  0) then 3
          when ${resolved_satisfied_complaints} >= 0.50 then 0.75*3
          when ${resolved_satisfied_complaints} >= 0.25 then 0.50*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_rating_on_tickets_resolved {
    type: number
    sql: case when (${resolved_satisfied_complaints} >= 0.75 OR coalesce(${resolved_complaints},0) =  0) then 2.5
          when ${resolved_satisfied_complaints} >= 0.50 then 0.75*2.5
          when ${resolved_satisfied_complaints} >= 0.25 then 0.50*2.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: engagement_feedback_smr {
    type: number
    sql: case when ${meal_rating} >= 0.30 then 2
          when ${meal_rating} >= 0.10 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_feedback_smr{
    type: number
    sql:case when ${meal_rating} >= 0.30 then 3
          when ${meal_rating} >= 0.10 then 0.50*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_feedback_smr {
    type: number
    sql:case when ${meal_rating} >= 0.30 then 2.5
          when ${meal_rating} >= 0.10 then 0.50*2.5
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
    sql: case when ${retain_user} = 1 then 2
      else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_loyalty_repeat_customer {
    type: number
    sql:case when ${retain_user} = 1 then 3
      else 0 end ;;
    value_format: "0.00"
  }

  measure: total_loyalty_repeat_customer {
    type: number
    sql:case when ${retain_user} = 1 then 2.5
      else 0 end ;;
    value_format: "0.00"
  }


  measure: all_loyalty_referred {
    type: number
    sql: case when ${total_referral} > 1 then 2
          when ${total_referral} = 1 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: all_loyalty_earned {
    type: number
    sql: case when ${total_converted_referral} > 1 then 2
          when ${total_converted_referral} = 1 then 0.50*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payment} = 3 then 0
          when ${on_time_payments_on_last_3_payment} = 2 then 0.66*0
          when ${on_time_payments_on_last_3_payment} = 1 then 0.33*0
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payment} = 3 then 3
          when ${on_time_payments_on_last_3_payment} = 2 then 0.66*3
          when ${on_time_payments_on_last_3_payment} = 1 then 0.33*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_transaction_pays_rent_within_due_date {
    type: number
    sql: case when ${on_time_payments_on_last_3_payment} = 3 then 1.5
          when ${on_time_payments_on_last_3_payment} = 2 then 0.66*1.5
          when ${on_time_payments_on_last_3_payment} = 1 then 0.33*1.5
            else 0 end ;;
    value_format: "0.00"
  }


  measure: all_transaction_preference_shared {
    type: number
    sql: case when (${shared_preference_per} >= 0.50 or ${total_preference_available} = 0) then 3
          when ${shared_preference_per} >= 0.40 then 0.75*3
          when ${shared_preference_per} >= 0.30 then 0.50*3
          when ${shared_preference_per} >= 0.20 then 0.25*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 0.70 then 1
          when ${consumed_meal_per} >= 0.20 then 1* ${consumed_meal_per}
            else 0 end ;;
    value_format: "0.00"
  }

  measure: experience_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 0.70 then 3
          when ${consumed_meal_per} >= 0.20 then 3*${consumed_meal_per}
            else 0 end ;;
    value_format: "0.00"
  }

  measure: total_transaction_meals_consumed {
    type: number
    sql: case when ${consumed_meal_per} >= 0.70 then 2
          when ${consumed_meal_per} >= 0.20 then 2*${consumed_meal_per}
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
    sql: case when ${total_vas_orders} >= 5 then 3
          when ${total_vas_orders} >= 3 then 0.50*3
          when ${total_vas_orders} >= 1 then 0.25*3
            else 0 end ;;
    value_format: "0.00"
  }



  measure: engagement_vas_inernet_usage {
    type: number
    sql: case when ${total_used_internet} > 75  then 3
          when ${total_used_internet} >= 40 then 0.50*3
          when ${total_used_internet} >= 1 then 0*3
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_vas_menu_opened {
    type: number
    sql: case when ${total_menu_opened} >= 12  then 2
          when ${total_menu_opened} >= 8 then 0.75*2
          when ${total_menu_opened} >= 4 then 0.50*2
          when ${total_menu_opened} >= 1 then 0.25*2
            else 0 end ;;
    value_format: "0.00"
  }

  measure: engagement_app_engagement_story {
    type: number
    sql: case when ${total_story} >= 1  then 2 else 0 end ;;
    value_format: "0.00"
  }



  measure: engagement_score_5 {
    type: number
    sql: 1.0*(coalesce(${engagement_feedback_smr},0)+coalesce(${all_transaction_preference_shared},0)+
    coalesce(${engagement_vas_inernet_usage},0)+coalesce(${engagement_vas_menu_opened},0)+coalesce(${engagement_app_engagement_story},0)
          ) / 12 ;;
    value_format: "0.00%"
  }


  measure: experience_score_31 {
    type: number
    sql: 1.0*(coalesce(${all_complaints_per_month},0)+coalesce(${experience_feedback_vas_order_rating},0)+
          coalesce(${experience_feedback_rating_on_tickets_closed},0)+coalesce(${experience_feedback_rating_on_tickets_resolved},0)+
          coalesce(${experience_feedback_meal_fps},0)+
          coalesce(${experience_feedback_vas_fps},0)+
          coalesce(${all_loyalty_referred},0)+
          coalesce(${experience_transaction_pays_rent_within_due_date},0)+
          coalesce(${experience_transaction_meals_consumed},0)+coalesce(${experience_vas_aov},0)+
          coalesce(${all_vas_orders},0)) / 31 ;;
    value_format: "0.00%"
  }

  measure: total_score_37 {
    type: number
    sql: 1.0*(coalesce(${all_complaints_per_month},0)+coalesce(${total_feedback_vas_order_rating},0)+
          coalesce(${total_feedback_rating_on_tickets_closed},0)+coalesce(${total_feedback_rating_on_tickets_resolved},0)+
          coalesce(${total_feedback_smr},0)+coalesce(${total_feedback_meal_fps},0)+
          coalesce(${total_feedback_vas_fps},0)+coalesce(${total_loyalty_repeat_customer},0)+
          coalesce(${all_loyalty_referred},0)+coalesce(${all_loyalty_earned},0)+
          coalesce(${total_transaction_pays_rent_within_due_date},0)+coalesce(${all_transaction_preference_shared},0)+
          coalesce(${total_transaction_meals_consumed},0)+coalesce(${total_vas_aov},0)+
          coalesce(${all_vas_orders},0)) / 36.5 ;;
    value_format: "0.00%"
  }


}
