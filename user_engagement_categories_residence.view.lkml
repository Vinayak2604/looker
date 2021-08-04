view: user_engagement_categories_residence {
  derived_table: {
    sql: with base as (select residence,retained_user,total_referrals,total_converted_referrals,on_time_payments_on_last_3_payments,
          sum(total_complaints) total_complaints,
          sum(case when complaint_status = 'CLOSED' then total_complaints end) closed_complaints,
          sum(case when complaint_status = 'RESOLVED' then total_complaints end) resolved_complaints,
          1.00*nullif(sum(case when complaint_status = 'CLOSED' then satisfied_feedback end),0) / sum(case when complaint_status = 'CLOSED' then total_complaints end) closed_satisfied_complaints,
          1.00*nullif(sum(case when complaint_status = 'RESOLVED' then satisfied_feedback end),0) / sum(case when complaint_status = 'RESOLVED' then total_complaints end) resolved_satisfied_complaints,
          sum(vas_orders) vas_orders, count(case when vas_rating >0 then vas_rating end) vas_rating,
          (coalesce(sum(meal_consumed_breakfast),0) + coalesce(sum(meal_consumed_lunch),0) +coalesce(sum(meal_consumed_evening_snacks),0) +coalesce(sum(meal_consumed_dinner),0) ) meal_consumed,
          (coalesce(count(meal_consumed_breakfast),0) + coalesce(count(meal_consumed_lunch),0) +coalesce(count(meal_consumed_evening_snacks),0) +coalesce(count(meal_consumed_dinner),0) ) available_meal,
          (coalesce(sum(case when preference_available_breakfast = 1 and item_base_preference_breakfast = 1 then item_base_preference_breakfast end),0) + coalesce(sum(case when preference_available_lunch = 1 and item_base_preference_lunch = 1 then item_base_preference_lunch end),0) + coalesce(sum(case when preference_available_evening_snacks = 1 and item_base_preference_evening_snacks = 1 then item_base_preference_evening_snacks end),0) + coalesce(sum(case when preference_available_dinner = 1 and item_base_preference_dinner = 1 then item_base_preference_dinner end),0) ) shared_preference,
          (coalesce(count(case when meal_rating_breakfast > 0 then meal_rating_breakfast end),0) + coalesce(count(case when meal_rating_lunch >0 then meal_rating_lunch end),0) +coalesce(count(case when meal_rating_evening_snacks > 0 then meal_rating_evening_snacks end),0) +coalesce(count(case when meal_rating_dinner >0 then meal_rating_dinner end),0) ) meal_rating,
          1.00*nullif((coalesce(sum(meal_rating_breakfast),0) + coalesce(sum(meal_rating_lunch),0) +coalesce(sum(meal_rating_evening_snacks),0) +coalesce(sum(meal_rating_dinner),0)),0) / (coalesce(count(case when meal_rating_breakfast > 0 then meal_rating_breakfast end),0) + coalesce(count(case when meal_rating_lunch >0 then meal_rating_lunch end),0) +coalesce(count(case when meal_rating_evening_snacks > 0 then meal_rating_evening_snacks end),0) +coalesce(count(case when meal_rating_dinner >0 then meal_rating_dinner end),0) ) as meal_fps,
          avg(case when vas_rating >0 then vas_rating end) vas_fps,
          avg(case when vas_ov > 0 then vas_ov end) vas_ov,
          sum(total_used_gb) total_used_internet

          from stanza.derived_user_engagement_metrics
          where {% condition date %} date {% endcondition %}
          and {% condition residence %} residence {% endcondition %}
          and {% condition city %} city {% endcondition %}
          and {% condition micromarket %} micromarket {% endcondition %}
          group by 1,2,3,4,5
          ),

          engagement as ( select residence, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
          case when (closed_satisfied_complaints >= 0.75 or coalesce(closed_complaints,0) = 0 )then 2 when closed_satisfied_complaints >= 0.50 then 0.75*2 when closed_satisfied_complaints >= 0.25 then 0.50*2 else 0 end as feedback_rating_on_tickets_closed,
          case when (resolved_satisfied_complaints >= 0.75 or coalesce(resolved_complaints,0) = 0 ) then 2 when resolved_satisfied_complaints >= 0.50 then 0.75*2 when resolved_satisfied_complaints >= 0.25 then 0.50*2 else 0 end as feedback_rating_on_tickets_resolved,
          case when (1.00*nullif(vas_rating,0) / vas_orders) >=0.70 then (1.00*nullif(vas_rating,0) / vas_orders)*2 else 0 end as feedback_vas_order_rating,
          case when (1.00*nullif(meal_rating,0)/meal_consumed) >= 0.30 then 2 when (1.00*nullif(meal_rating,0)/meal_consumed) >= 0.10 then 0.50*2 else 0 end as feedback_smr,
          case when meal_fps >= 4.5 then 2 when meal_fps >= 2 then 0.50*2 else 0 end as feedback_meal_fps,
          case when vas_fps >= 4.5 then 2 when vas_fps >= 2 then 0.50*2 else 0 end as feedback_vas_fps,
          case when retained_user = 1 then 2 else 0 end as Loyalty_repeat_customer,
          case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 else 0 end as loyalty_referred,
          case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 else 0 end as loyalty_earned,
          case when on_time_payments_on_last_3_payments >=3 then 0 when on_time_payments_on_last_3_payments = 2 then 0.66*0 when on_time_payments_on_last_3_payments = 1 then 0.33*0 else 0 end as transaction_pays_rent_within_due_date,
          case when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.50 then 3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.40 then 0.75*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.30 then 0.50*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
          case when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.70 then 1 when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.20 then (1.00*nullif(meal_consumed,0) / available_meal)*1 else 0 end as transaction_meals_consumed,
          case when vas_ov >= 100 then 3 when vas_ov >= 50 then 0.50*3 when vas_ov >=1 then 0.25*3 else 0 end as vas_aov,
          case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders,
          case when total_used_internet > 75 then 3 when total_used_internet >= 40 then 0.50*3 when total_used_internet >=1 then 0*3 end as vas_inernet_usage

          from base
          ),

          experience as ( select residence, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
          case when (closed_satisfied_complaints >= 0.75 or coalesce(closed_complaints,0) = 0) then 3 when closed_satisfied_complaints >= 0.50 then 0.75*3 when closed_satisfied_complaints >= 0.25 then 0.50*3 else 0 end as feedback_rating_on_tickets_closed,
          case when (resolved_satisfied_complaints >= 0.75 or coalesce(resolved_complaints,0) = 0) then 3 when resolved_satisfied_complaints >= 0.50 then 0.75*3 when resolved_satisfied_complaints >= 0.25 then 0.50*3 else 0 end as feedback_rating_on_tickets_resolved,
          case when (1.00*nullif(vas_rating,0) / vas_orders) >=0.70 then (1.00*nullif(vas_rating,0) / vas_orders)*3 else 0 end as feedback_vas_order_rating,
          case when (1.00*nullif(meal_rating,0)/meal_consumed) >= 0.30 then 3 when (1.00*nullif(meal_rating,0)/meal_consumed) >= 0.10 then 0.50*3 else 0 end as feedback_smr,
          case when meal_fps >= 4.5 then 3 when meal_fps >= 2 then 0.50*3 else 0 end as feedback_meal_fps,
          case when vas_fps >= 4.5 then 3 when vas_fps >= 2 then 0.50*3 else 0 end as feedback_vas_fps,
          case when retained_user = 1 then 3 else 0 end as Loyalty_repeat_customer,
          case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 else 0 end as loyalty_referred,
          case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 else 0 end as loyalty_earned,
          case when on_time_payments_on_last_3_payments >=3 then 3 when on_time_payments_on_last_3_payments = 2 then 0.66*3 when on_time_payments_on_last_3_payments = 1 then 0.33*3 else 0 end as transaction_pays_rent_within_due_date,
          case when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.50 then 3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.40 then 0.75*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.30 then 0.50*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
          case when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.70 then 3 when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.20 then (1.00*nullif(meal_consumed,0) / available_meal)*3 else 0 end as transaction_meals_consumed,
          case when vas_ov >= 100 then 2 when vas_ov >= 50 then 0.50*2 when vas_ov >=1 then 0.25*2 else 0 end as vas_aov,
          case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
          from base
          ),

          total as ( select residence, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
          case when (closed_satisfied_complaints >= 0.75 or coalesce(closed_complaints,0) =0) then 2.5 when closed_satisfied_complaints >= 0.50 then 0.75*2.5 when closed_satisfied_complaints >= 0.25 then 0.50*2.5 else 0 end as feedback_rating_on_tickets_closed,
          case when (resolved_satisfied_complaints >= 0.75 or coalesce(resolved_complaints,0)=0) then 2.5 when resolved_satisfied_complaints >= 0.50 then 0.75*2.5 when resolved_satisfied_complaints >= 0.25 then 0.50*2.5 else 0 end as feedback_rating_on_tickets_resolved,
          case when (1.00*nullif(vas_rating,0) / vas_orders) >=0.70 then (1.00*nullif(vas_rating,0) / vas_orders)*2.5 else 0 end as feedback_vas_order_rating,
          case when (1.00*nullif(meal_rating,0)/meal_consumed) >= 0.30 then 2.5 when (1.00*nullif(meal_rating,0) /meal_consumed) >= 0.10 then 0.50*2.5 else 0 end as feedback_smr,
          case when meal_fps >= 4.5 then 2.5 when meal_fps >= 2 then 0.50*2.5 else 0 end as feedback_meal_fps,
          case when vas_fps >= 4.5 then 2.5 when vas_fps >= 2 then 0.50*2.5 else 0 end as feedback_vas_fps,
          case when retained_user = 1 then 3 else 0 end as Loyalty_repeat_customer,
          case when total_referrals > 1 then 2 when total_referrals = 1 then 0.50*2 else 0 end as loyalty_referred,
          case when total_converted_referrals > 1 then 2 when total_converted_referrals = 1 then 0.50*2 else 0 end as loyalty_earned,
          case when on_time_payments_on_last_3_payments >=3 then 1.5 when on_time_payments_on_last_3_payments = 2 then 0.66*1.5 when on_time_payments_on_last_3_payments = 1 then 0.33*1.5 else 0 end as transaction_pays_rent_within_due_date,
          case when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.50 then 3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.40 then 0.75*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.30 then 0.50*3 when (1.00*nullif(shared_preference,0) / meal_consumed) >= 0.20 then 0.25*3 else 0 end as transaction_preference_shared,
          case when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.70 then 2 when (1.00*nullif(meal_consumed,0) / available_meal) >= 0.20 then (1.00*nullif(meal_consumed,0) / available_meal)*2 else 0 end as transaction_meals_consumed,
          case when vas_ov >= 100 then 2.5 when vas_ov >= 50 then 0.50*2.5 when vas_ov >=1 then 0.25*2.5 else 0 end as vas_aov,
          case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
          from base
          ),

          scores as (select base.residence,
          1.00*(coalesce(engagement.complaint_complaints_per_month,0)) / 3  as engagement_complaints,
          1.00*(coalesce(engagement.feedback_vas_order_rating,0)+coalesce(engagement.feedback_rating_on_tickets_closed,0)+coalesce(engagement.feedback_rating_on_tickets_resolved,0)+
           coalesce(engagement.feedback_smr,0)+coalesce(engagement.feedback_meal_fps,0)+coalesce(engagement.feedback_vas_fps,0)) / 12 as engagement_feedback,
          1.00*(coalesce(engagement.Loyalty_repeat_customer,0)+coalesce(engagement.loyalty_referred,0)+coalesce(engagement.loyalty_earned,0))/6 engagement_loyalty,
          1.00*(coalesce(engagement.transaction_pays_rent_within_due_date,0)+coalesce(engagement.transaction_preference_shared,0) +
          coalesce(engagement.transaction_meals_consumed,0))/ 4 as engagement_transaction,
          1.00*(coalesce(engagement.vas_aov,0)+coalesce(engagement.vas_no_of_orders,0)+coalesce(engagement.vas_inernet_usage,0) / 9 as  engagement_vas,

          1.00*(coalesce(experience.complaint_complaints_per_month,0)) / 3  as experience_complaints,
          1.00*(coalesce(experience.feedback_vas_order_rating,0)+coalesce(experience.feedback_rating_on_tickets_closed,0)+coalesce(experience.feedback_rating_on_tickets_resolved,0)+
          coalesce(experience.feedback_smr,0)+coalesce(experience.feedback_meal_fps,0)+coalesce(experience.feedback_vas_fps,0)) / 18 as experience_feedback,
          1.00*(coalesce(experience.Loyalty_repeat_customer,0)+coalesce(experience.loyalty_referred,0)+coalesce(experience.loyalty_earned,0))/ 7 as experience_loyalty,
          1.00*(coalesce(experience.transaction_pays_rent_within_due_date,0)+coalesce(experience.transaction_preference_shared,0) +
          coalesce(experience.transaction_meals_consumed,0)) / 9 as experience_transaction,
          1.00*(coalesce(experience.vas_aov,0)+coalesce(experience.vas_no_of_orders,0)) / 5 experience_vas,


          1.00*(coalesce(total.complaint_complaints_per_month,0)) / 3 as total_complaints,
          1.00*(coalesce(total.feedback_vas_order_rating,0)+coalesce(total.feedback_rating_on_tickets_closed,0)+coalesce(total.feedback_rating_on_tickets_resolved,0)+
          coalesce(total.feedback_smr,0)+coalesce(total.feedback_meal_fps,0)+coalesce(total.feedback_vas_fps,0))/ 15 as total_feedback,
          1.00*(coalesce(total.Loyalty_repeat_customer,0)+coalesce(total.loyalty_referred,0)+coalesce(total.loyalty_earned,0)) / 6.5 as total_loyalty,
          1.00*(coalesce(total.transaction_pays_rent_within_due_date,0)+coalesce(total.transaction_preference_shared,0) +
          coalesce(total.transaction_meals_consumed,0)) / 6.5 as total_transaction,
          1.00*(coalesce(total.vas_aov,0)+coalesce(total.vas_no_of_orders,0)) / 5.5 total_vas
          from base
          join engagement on engagement.residence=base.residence
          join experience on experience.residence=base.residence
          join total on total.residence=base.residence
          )



          select residence,type,category,score, avg(score) over(partition by type, category ) avg_score,
          PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Score) OVER (partition by type, category) as score_25_percentile,
          PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Score) OVER (partition by type, category) as score_50_percentile,
          PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Score) OVER (partition by type, category) as score_75_percentile
          from
          (
          (select scores.residence,  'engagement' as type,
          'complaint' as category, engagement_complaints as score
          from scores)
          union
          (select scores.residence,  'engagement' as type,
          'feedback' as category, engagement_feedback as score
          from scores)
          union
          (select scores.residence, 'engagement' as type,
          'loyalty' as category, engagement_loyalty as score
          from scores)
          union
          (select scores.residence, 'engagement' as type,
          'transaction' as category, engagement_transaction as score
          from scores)
          union
          (select scores.residence,  'engagement' as type,
          'vas' as category, engagement_vas as score
          from scores)
          union
          (select scores.residence,  'experience' as type,
          'complaint' as category, experience_complaints as score
          from scores)
          union
          (select scores.residence,  'experience' as type,
          'feedback' as category, experience_feedback as score
          from scores)
          union
          (select scores.residence, 'experience' as type,
          'loyalty' as category, experience_loyalty as score
          from scores)
          union
          (select scores.residence, 'experience' as type,
          'transaction' as category, experience_transaction as score
          from scores)
          union
          (select scores.residence, 'experience' as type,
          'vas' as category, experience_vas as score
          from scores)
          union
          (select scores.residence, 'total' as type,
          'complaint' as category, total_complaints as score
          from scores)
          union
          (select scores.residence, 'total' as type,
          'feedback' as category, total_feedback as score
          from scores)
          union
          (select scores.residence, 'total' as type,
          'loyalty' as category, total_loyalty as score
          from scores)
          union
          (select scores.residence, 'total' as type,
          'transaction' as category, total_transaction as score
          from scores)
          union
          (select scores.residence,  'total' as type,
          'vas' as category, total_vas as score
          from scores)
          )



--          # select scores.residence, scores.residence,scores.city, scores.micromarket, engagement_complaints, engagement_feedback,
--          # engagement_loyalty, engagement_transaction,  engagement_vas,

--          # experience_complaints, experience_feedback,
--          # experience_loyalty, experience_transaction,  experience_vas,
--
--          # total_complaints,  total_feedback,
--          # total_loyalty, total_transaction,  total_vas

--          # from scores





          ;;

    }

    parameter: date {
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


    dimension: type {
      type: string
      sql: ${TABLE}.type ;;
    }

    dimension: category {
      type: string
      sql: ${TABLE}.category ;;
    }

    dimension: residence_name {
      type: string
      sql: ${TABLE}.residence ;;
    }


    dimension: score {
      type: number
      sql: ${TABLE}.score ;;
      value_format: "0.0%"
    }

    dimension: avg_score {
      type: number
      sql: ${TABLE}.avg_score ;;
      value_format: "0.0%"
    }

    dimension: score_25_percentile {
      type: number
      sql: ${TABLE}.score_25_percentile ;;
      value_format: "0.00%"
    }

    dimension: score_50_percentile {
      type: number
      sql: ${TABLE}.score_50_percentile ;;
      value_format: "0.00%"
    }

    dimension: score_75_percentile {
      type: number
      sql: ${TABLE}.score_75_percentile ;;
      value_format: "0.00%"
    }


    measure: total_residences {
      type: count_distinct
      sql: ${residence_name} ;;
    }


    measure: below_avg_residence {
      type: number
      sql: count(distinct case when ${score} < ${avg_score} then ${residence_name} end) ;;
    }

    measure: below_avg_residence_per {
      type: number
      sql: 1.00*nullif(${below_avg_residence},0) / ${total_residences}  ;;
      value_format: "0%"
    }
    measure: above_avg_residence_per {
      type: number
      sql: 1-nullif(${below_avg_residence_per},0)  ;;
      value_format: "0%"
    }


    measure: lowest_score {
      type: min
      sql: ${score}  ;;
      value_format: "0%"
    }

    # measure: score_25_percentile {
    #   type: percentile
    #   percentile: 25
    #   sql: ${score}  ;;
    #   value_format: "0%"
    # }

    measure: median_score {
      type: median
      sql: ${score}  ;;
      value_format: "0%"
    }


    # measure: score_75_percentile {
    #   type: percentile
    #   percentile: 75
    #   sql: ${score}  ;;
    #   value_format: "0%"
    # }

    measure: highest_score {
      type: max
      sql: ${score}  ;;
      value_format: "0%"
    }


    measure: total_residence_0_25 {
      type: count_distinct
      sql: case when ${score} < ${score_25_percentile} then ${residence_name} end;;
    }

    measure: total_residence_25_50 {
      type: count_distinct
      sql: case when ${score} >= ${score_25_percentile} and ${score} < ${score_50_percentile} then ${residence_name} end ;;
    }

    measure: total_residence_50_75 {
      type: count_distinct
      sql: case when ${score} >= ${score_50_percentile} and ${score} < ${score_75_percentile} then ${residence_name} end ;;
    }

    measure: total_residence_75_100 {
      type: count_distinct
      sql: case when ${score} >= ${score_75_percentile} then ${residence_name} end ;;
    }




  }
