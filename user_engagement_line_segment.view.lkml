view: user_engagement_line_segment {
  derived_table: {
    sql: with base as (select student_id,residence,city, micromarket,retained_user,total_referrals,total_converted_referrals,on_time_payments_on_last_3_payments,
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
          avg(case when vas_ov > 0 then vas_ov end) vas_ov

          from stanza.derived_user_engagement_metrics
          where {% condition date %} date {% endcondition %}
          group by 1,2,3,4,5,6,7,8
          ),

          engagement as ( select student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
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
          case when vas_orders >= 5 then 3 when vas_orders>=3 then 0.50*3 when vas_orders>=1 then 0.25*3 else 0 end as vas_no_of_orders
          from base
          ),

          experience as ( select student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
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

          total as ( select student_id, case when total_complaints >= 2 then 0 when total_complaints = 1 then 0.50*3 else 3 end as complaint_complaints_per_month,
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

          scores as (select base.student_id,residence,city, micromarket,
          1.00*(coalesce(engagement.complaint_complaints_per_month,0)+coalesce(engagement.feedback_vas_order_rating,0)+
          coalesce(engagement.feedback_rating_on_tickets_closed,0)+coalesce(engagement.feedback_rating_on_tickets_resolved,0)+
          coalesce(engagement.feedback_smr,0)+coalesce(engagement.feedback_meal_fps,0)+coalesce(engagement.feedback_vas_fps,0)+
          coalesce(engagement.Loyalty_repeat_customer,0)+coalesce(engagement.loyalty_referred,0)+coalesce(engagement.loyalty_earned,0)+coalesce(engagement.transaction_pays_rent_within_due_date,0)+coalesce(engagement.transaction_preference_shared,0) +
          coalesce(engagement.transaction_meals_consumed,0)+coalesce(engagement.vas_aov,0)+coalesce(engagement.vas_no_of_orders,0)) / 31 engagement_score,

          1.00*(coalesce(experience.complaint_complaints_per_month,0)+coalesce(experience.feedback_vas_order_rating,0)+
          coalesce(experience.feedback_rating_on_tickets_closed,0)+coalesce(experience.feedback_rating_on_tickets_resolved,0)+
          coalesce(experience.feedback_smr,0)+coalesce(experience.feedback_meal_fps,0)+coalesce(experience.feedback_vas_fps,0)+
          coalesce(experience.Loyalty_repeat_customer,0)+coalesce(experience.loyalty_referred,0)+coalesce(experience.loyalty_earned,0)+coalesce(experience.transaction_pays_rent_within_due_date,0)+coalesce(experience.transaction_preference_shared,0) +
          coalesce(experience.transaction_meals_consumed,0)+coalesce(experience.vas_aov,0)+coalesce(experience.vas_no_of_orders,0)) / 42 experience_score,

          1.00*(coalesce(total.complaint_complaints_per_month,0)+coalesce(total.feedback_vas_order_rating,0)+
          coalesce(total.feedback_rating_on_tickets_closed,0)+coalesce(total.feedback_rating_on_tickets_resolved,0)+
          coalesce(total.feedback_smr,0)+coalesce(total.feedback_meal_fps,0)+coalesce(total.feedback_vas_fps,0)+
          coalesce(total.Loyalty_repeat_customer,0)+coalesce(total.loyalty_referred,0)+coalesce(total.loyalty_earned,0)+coalesce(total.transaction_pays_rent_within_due_date,0)+coalesce(total.transaction_preference_shared,0) +
          coalesce(total.transaction_meals_consumed,0)+coalesce(total.vas_aov,0)+coalesce(total.vas_no_of_orders,0)) / 36.5 total_score,

           (coalesce(engagement.complaint_complaints_per_month,0)+coalesce(engagement.feedback_vas_order_rating,0)+
          coalesce(engagement.feedback_rating_on_tickets_closed,0)+coalesce(engagement.feedback_rating_on_tickets_resolved,0)+
          coalesce(engagement.feedback_smr,0)+coalesce(engagement.feedback_meal_fps,0)+coalesce(engagement.feedback_vas_fps,0)+
          coalesce(engagement.Loyalty_repeat_customer,0)+coalesce(engagement.loyalty_referred,0)+coalesce(engagement.loyalty_earned,0)+coalesce(engagement.transaction_pays_rent_within_due_date,0)+coalesce(engagement.transaction_preference_shared,0) +
          coalesce(engagement.transaction_meals_consumed,0)+coalesce(engagement.vas_aov,0)+coalesce(engagement.vas_no_of_orders,0)) engagement,

          (coalesce(experience.complaint_complaints_per_month,0)+coalesce(experience.feedback_vas_order_rating,0)+
          coalesce(experience.feedback_rating_on_tickets_closed,0)+coalesce(experience.feedback_rating_on_tickets_resolved,0)+
          coalesce(experience.feedback_smr,0)+coalesce(experience.feedback_meal_fps,0)+coalesce(experience.feedback_vas_fps,0)+
          coalesce(experience.Loyalty_repeat_customer,0)+coalesce(experience.loyalty_referred,0)+coalesce(experience.loyalty_earned,0)+coalesce(experience.transaction_pays_rent_within_due_date,0)+coalesce(experience.transaction_preference_shared,0) +
          coalesce(experience.transaction_meals_consumed,0)+coalesce(experience.vas_aov,0)+coalesce(experience.vas_no_of_orders,0)) experience

          from base
          join engagement on engagement.student_id=base.student_id
          join experience on experience.student_id=base.student_id
          join total on total.student_id=base.student_id
          )

          select student_id,residence,city, micromarket, case when engagement_score < 0.10 then '-5' when engagement_score < 0.20 then '-4'
          when engagement_score < 0.30 then '-3' when engagement_score < 0.40 then '-2' when engagement_score < 0.50 then '-1' when engagement_score = 0.50 then '0'
          when engagement_score < 0.60 then '1' when engagement_score < 0.70 then '2'when engagement_score < 0.80 then '3' when engagement_score < 0.90 then '4'
          when engagement_score < 1 then '5'  end as engagement_score,
          (0.5 - (1-engagement_score)) as eng_score,
          engagement,
          experience,
          experience_score as experience_score1,
          engagement_score as engagement_score1,



          case when experience_score < 0.10 then '-5' when experience_score < 0.20 then '-4'
          when experience_score < 0.30 then '-3' when experience_score < 0.40 then '-2' when experience_score < 0.50 then '-1' when experience_score = 0.50 then '0'
          when experience_score < 0.60 then '1' when experience_score < 0.70 then '2'when experience_score < 0.80 then '3' when experience_score < 0.90 then '4'
          when experience_score < 1 then '5'  end as experience_score,
          (0.5 - (1-experience_score)) as exp_score,
          avg(engagement_score) over(partition by student_id) as avg_engagement,
          avg(experience_score) over(partition by student_id) as avg_experience,
          (avg(engagement_score) over(partition by micromarket)) as avg_engagement_mm,
          (avg(experience_score) over(partition by residence)) as avg_engagement_res,
          rank() over(order by residence)  residence_rank,
          rank() over(order by micromarket)  micromarket_rank

           from scores
          where lower(micromarket) not like '%test%'


          ;;

    }

    parameter: date {
      type: date
      convert_tz: no
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

    dimension: engagement_score {
      type: number
      sql: ${TABLE}.engagement_score ;;
    }

  dimension: experience_score {
    type: number
    sql: ${TABLE}.experience_score ;;
  }

  dimension: engagement {
    type: number
    sql: ${TABLE}.engagement_score1 ;;
    value_format: "0.0%"
  }

  dimension: experience {
    type: number
    sql: ${TABLE}.experience_score1 ;;
    value_format: "0.0%"
  }


  dimension: eng_score {
    type: number
    sql: ${TABLE}.eng_score ;;
  }

  dimension: avg_engagement {
    type: number
    sql: ${TABLE}.avg_engagement ;;
  }

  dimension: avg_experience {
    type: number
    sql: ${TABLE}.avg_experience ;;
  }

  dimension: residence_rank {
    type: number
    sql: ${TABLE}.residence_rank ;;
  }

  dimension: micromarket_rank {
    type: number
    sql: ${TABLE}.micromarket_rank ;;
  }


  dimension: avg_engagement_res {
    type: number
    sql: ${TABLE}.avg_engagement_res ;;
    value_format: "0.0%"
  }


  dimension: avg_engagement_residence {
    type: number
    sql: ${avg_engagement_res}+(0.0000000001*${residence_rank}) ;;
    value_format: "0.0%"
  }

  dimension: avg_engagement_mm {
    type: number
    sql: ${TABLE}.avg_engagement_mm ;;
    value_format: "0.0%"
  }

  dimension: avg_engagement_micromarket {
    type: number
    sql: ${avg_engagement_mm}+(0.0000000001*${micromarket_rank}) ;;
    value_format: "0.0%"
  }

  dimension: exp_score {
    type: number
    sql: ${TABLE}.exp_score ;;
  }


    measure: students {
      type: count_distinct
      sql: ${student_id} ;;
    }

    measure: residences {
      type: count_distinct
      sql: ${residence} ;;
    }

  measure: engagement_avg {
    type: average
    sql: ${engagement} ;;
    value_format: "0.0%"
  }

  measure: experience_avg {
    type: average
    sql: case when ${experience} is null then null else ${experience} end  ;;

    html: {% if user_engagement_line_segment.student_id._is_selected %}

    <font color=white>Student_id:{{ user_engagement_line_segment.student_id._rendered_value }}</font>, <font color=white>experience:{{ user_engagement_line_segment.experience_avg._rendered_value }}</font>

    {% else %}
    {% if user_engagement_line_segment.residence._is_selected %}
    <font color=white>residence:{{ user_engagement_line_segment.residence._rendered_value }}</font>, <font color=white>experience:{{ user_engagement_line_segment.experience_avg._rendered_value }}</font>
    {% else %}

    {% if user_engagement_line_segment.micromarket._is_selected %}
    <font color=white>micromarket:{{ user_engagement_line_segment.micromarket._rendered_value }}</font>, <font color=white>experience:{{ user_engagement_line_segment.experience_avg._rendered_value }}</font>
    {% else %}


    {% if user_engagement_line_segment.city._is_selected %}
    <font color=white>city:{{ user_engagement_line_segment.city._rendered_value }}</font>, <font color=white>experience:{{ user_engagement_line_segment.experience_avg._rendered_value }}</font>
    {% else %}


    {% endif %} {% endif %} {% endif %} {% endif %}  ;;
    value_format: "0.0%"

  }

  measure: residence_name {
    type: string
    sql: ${residence} ;;
  }

  measure:experience_scores {
    type: number
    sql: ${experience_score} ;;
  }



  }
