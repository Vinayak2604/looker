view: user_engagement_preto {
  derived_table: {
    sql: with base as (select student_id,retained_user,total_referrals,total_converted_referrals,on_time_payments_on_last_3_payments,
    sum(total_complaints) total_complaints,
    sum(vas_orders) vas_orders, count(case when vas_rating >0 then vas_rating end) vas_rating,
    (coalesce(sum(meal_consumed_breakfast),0) + coalesce(sum(meal_consumed_lunch),0) +coalesce(sum(meal_consumed_evening_snacks),0) +coalesce(sum(meal_consumed_dinner),0) ) meal_consumed,
    (coalesce(count(meal_consumed_breakfast),0) + coalesce(count(meal_consumed_lunch),0) +coalesce(count(meal_consumed_evening_snacks),0) +coalesce(count(meal_consumed_dinner),0) ) available_meal,
    (coalesce(sum(case when preference_available_breakfast = 1 and item_base_preference_breakfast = 1 then item_base_preference_breakfast end),0) + coalesce(sum(case when preference_available_lunch = 1 and item_base_preference_lunch = 1 then item_base_preference_lunch end),0) + coalesce(sum(case when preference_available_evening_snacks = 1 and item_base_preference_evening_snacks = 1 then item_base_preference_evening_snacks end),0) + coalesce(sum(case when preference_available_dinner = 1 and item_base_preference_dinner = 1 then item_base_preference_dinner end),0) ) shared_preference,
    (coalesce(count(case when meal_rating_breakfast > 0 then meal_rating_breakfast end),0) + coalesce(count(case when meal_rating_lunch >0 then meal_rating_lunch end),0) +coalesce(count(case when meal_rating_evening_snacks > 0 then meal_rating_evening_snacks end),0) +coalesce(count(case when meal_rating_dinner >0 then meal_rating_dinner end),0) ) meal_rating,
    1.00*nullif((coalesce(sum(meal_rating_breakfast),0) + coalesce(sum(meal_rating_lunch),0) +coalesce(sum(meal_rating_evening_snacks),0) +coalesce(sum(meal_rating_dinner),0)),0) / (coalesce(count(case when meal_rating_breakfast > 0 then meal_rating_breakfast end),0) + coalesce(count(case when meal_rating_lunch >0 then meal_rating_lunch end),0) +coalesce(count(case when meal_rating_evening_snacks > 0 then meal_rating_evening_snacks end),0) +coalesce(count(case when meal_rating_dinner >0 then meal_rating_dinner end),0) ) as meal_fps,
    avg(case when vas_rating >0 then vas_rating end) vas_fps,
    avg(case when vas_ov > 0 then vas_ov end) vas_ov

    from stanza.derived_user_engagement_metrics
    group by 1,2,3,4,5
    ),

    engagement as ( select_student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
    case when (1.00*vas_rating / vas_orders) >=0.70 then (1.00*vas_rating / vas_orders)*2 else 0 end as feedback_vas_order_rating,
    case when (1.00*meal_rating/meal_consumed) >= 0.30 then 2 when (1.00*meal_rating/meal_consumed) >= 0.10 then 0.50*2 else 0 end as feedback_smr,
    case when meal_fps >= 4.5 then 2 when meal_fps >= 2 then 0.50*2 else 0 end as feedback_meal_fps,
    case when vas_fps >= 4.5 then 2 when vas_fps >= 2 then 0.50*2 else 0 end as feedback_vas_fps,
    case when retained_user = 1 then 2 else 0 end as Loyalty_repeat_customer,
    case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 then 0 end as loyalty_referred,
    case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 then 0 end as loyalty_earned,
    case when on_time_payments_on_last_3_payments >=3 then 0 when on_time_payments_on_last_3_payments = 2 then 0.66*0 when on_time_payments_on_last_3_payments = 1 then 0.33*0 else 0 end as transaction_pays_rent_within_due_date,
    case when (1.00*shared_preference / meal_consumed) >= 0.50 then 3 when (1.00*shared_preference / meal_consumed) >= 0.40 then 0.75*3 when (1.00*shared_preference / meal_consumed) >= 0.30 then 0.50*3 when (1.00*shared_preference / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
    case when (1.00*meal_consumed / available_meal) >= 0.70 then 1 when (1.00*meal_consumed / available_meal) >= 0.20 then (1.00*meal_consumed / available_meal)*1 else 0 end as transaction_meals_consumed,
    case when vas_ov >= 100 then 3 when vas_ov >= 50 then 0.50*3 when vas_ov >=1 then 0.25*3 else 0 end as vas_aov,
    case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
    from base
    ),

    experience as ( select_student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
    case when (1.00*vas_rating / vas_orders) >=0.70 then (1.00*vas_rating / vas_orders)*3 else 0 end as feedback_vas_order_rating,
    case when (1.00*meal_rating/meal_consumed) >= 0.30 then 3 when (1.00*meal_rating/meal_consumed) >= 0.10 then 0.50*3 else 0 end as feedback_smr,
    case when meal_fps >= 4.5 then 3 when meal_fps >= 2 then 0.50*3 else 0 end as feedback_meal_fps,
    case when vas_fps >= 4.5 then 3 when vas_fps >= 2 then 0.50*3 else 0 end as feedback_vas_fps,
    case when retained_user = 1 then 3 else 0 end as Loyalty_repeat_customer,
    case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 then 0 end as loyalty_referred,
    case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 then 0 end as loyalty_earned,
    case when on_time_payments_on_last_3_payments >=3 then 3 when on_time_payments_on_last_3_payments = 2 then 0.66*3 when on_time_payments_on_last_3_payments = 1 then 0.33*3 else 0 end as transaction_pays_rent_within_due_date,
    case when (1.00*shared_preference / meal_consumed) >= 0.50 then 3 when (1.00*shared_preference / meal_consumed) >= 0.40 then 0.75*3 when (1.00*shared_preference / meal_consumed) >= 0.30 then 0.50*3 when (1.00*shared_preference / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
    case when (1.00*meal_consumed / available_meal) >= 0.70 then 3 when (1.00*meal_consumed / available_meal) >= 0.20 then (1.00*meal_consumed / available_meal)*3 else 0 end as transaction_meals_consumed,
    case when vas_ov >= 100 then 2 when vas_ov >= 50 then 0.50*2 when vas_ov >=1 then 0.25*2 else 0 end as vas_aov,
    case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
    from base
    ),

    total as ( select_student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
    case when (1.00*vas_rating / vas_orders) >=0.70 then (1.00*vas_rating / vas_orders)*2.5 else 0 end as feedback_vas_order_rating,
    case when (1.00*meal_rating/meal_consumed) >= 0.30 then 2.5 when (1.00*meal_rating/meal_consumed) >= 0.10 then 0.50*2.5 else 0 end as feedback_smr,
    case when meal_fps >= 4.5 then 2.5 when meal_fps >= 2 then 0.50*2.5 else 0 end as feedback_meal_fps,
    case when vas_fps >= 4.5 then 2.5 when vas_fps >= 2 then 0.50*2.5 else 0 end as feedback_vas_fps,
    case when retained_user = 1 then 3 else 0 end as Loyalty_repeat_customer,
    case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 then 0 end as loyalty_referred,
    case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 then 0 end as loyalty_earned,
    case when on_time_payments_on_last_3_payments >=3 then 1.5 when on_time_payments_on_last_3_payments = 2 then 0.66*1.5 when on_time_payments_on_last_3_payments = 1 then 0.33*1.5 else 0 end as transaction_pays_rent_within_due_date,
    case when (1.00*shared_preference / meal_consumed) >= 0.50 then 3 when (1.00*shared_preference / meal_consumed) >= 0.40 then 0.75*3 when (1.00*shared_preference / meal_consumed) >= 0.30 then 0.50*3 when (1.00*shared_preference / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
    case when (1.00*meal_consumed / available_meal) >= 0.70 then 2 when (1.00*meal_consumed / available_meal) >= 0.20 then (1.00*meal_consumed / available_meal)*2 else 0 end as transaction_meals_consumed,
    case when vas_ov >= 100 then 2.5 when vas_ov >= 50 then 0.50*2.5 when vas_ov >=1 then 0.25*2.5 else 0 end as vas_aov,
    case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
    from base
    ),

    scores as (select base.student_id,
    1.00*(coalesce(engagement.complaint_complaints_per_month,0)+coalesce(engagement.feedback_vas_order_rating,0)+coalesce(engagement.feedback_smr,0)+coalesce(engagement.feedback_meal_fps,0)+coalesce(engagement.feedback_vas_fps,0)+
    coalesce(engagement.Loyalty_repeat_customer,0)+coalesce(engagement.loyalty_referred,0)+coalesce(engagement.loyalty_earned,0)+coalesce(engagement.transaction_pays_rent_within_due_date,0)+coalesce(engagement.transaction_preference_shared,0) +
    coalesce(engagement.transaction_meals_consumed,0)+coalesce(engagement.vas_aov,0)+coalesce(engagement.vas_no_of_orders,0)) / 27 engagement_score,

    1.00*(coalesce(experience.complaint_complaints_per_month,0)+coalesce(experience.feedback_vas_order_rating,0)+coalesce(experience.feedback_smr,0)+coalesce(experience.feedback_meal_fps,0)+coalesce(experience.feedback_vas_fps,0)+
    coalesce(experience.Loyalty_repeat_customer,0)+coalesce(experience.loyalty_referred,0)+coalesce(experience.loyalty_earned,0)+coalesce(experience.transaction_pays_rent_within_due_date,0)+coalesce(experience.transaction_preference_shared,0) +
    coalesce(experience.transaction_meals_consumed,0)+coalesce(experience.vas_aov,0)+coalesce(experience.vas_no_of_orders,0)) / 36 experience_score,

    1.00*(coalesce(total.complaint_complaints_per_month,0)+coalesce(total.feedback_vas_order_rating,0)+coalesce(total.feedback_smr,0)+coalesce(total.feedback_meal_fps,0)+coalesce(total.feedback_vas_fps,0)+
    coalesce(total.Loyalty_repeat_customer,0)+coalesce(total.loyalty_referred,0)+coalesce(total.loyalty_earned,0)+coalesce(total.transaction_pays_rent_within_due_date,0)+coalesce(total.transaction_preference_shared,0) +
    coalesce(total.transaction_meals_consumed,0)+coalesce(total.vas_aov,0)+coalesce(total.vas_no_of_orders,0)) / 31.5 total_score
    from base
    join engagement on engagement.student_id=base.student_id
    join experience on experience.student_id=base.student_id
    join total on total.student_id=base.student_id
    )

    select student_id, case when engagement_score < 0.20 then "0-20" when engagement_score < 0.40 then "20-40"
    when engagement_score < 0.60 then "40-60" when engagement_score < 0.80 then "60-80" when engagement_score >= 0.80 then ">=80" ens as score
    from scores


    ;;

  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: score {
    type: string
    sql: ${TABLE}.score ;;
  }

  measure: students {
    type: count_distinct
    sql: ${student_id} ;;
  }

}
