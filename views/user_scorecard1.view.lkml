view: user_scorecard1 {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    with upr as (select upr.city, upr.micromarket, upr.residence, upr.user_id, upr.name, upr.phone, upr.gender, upr.profession, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when meal_type = 'BREAKFAST' then upr.id end) as breakfast_consumed_meals,
count(distinct case when meal_type = 'LUNCH' then upr.id end) as lunch_consumed_meals,
count(distinct case when meal_type = 'DINNER' then upr.id end) as dinner_consumed_meals,
count(distinct case when meal_type = 'EVENING_SNACKS' then upr.id end) as evening_snacks_consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct case when meal_type = 'BREAKFAST' and upr.rating is not null then upr.id end) as breakfast_rated_meals,
count(distinct case when meal_type = 'LUNCH' and upr.rating is not null then upr.id end) as lunch_rated_meals,
count(distinct case when meal_type = 'DINNER' and upr.rating is not null then upr.id end) as dinner_rated_meals,
count(distinct case when meal_type = 'EVENING_SNACKS' and upr.rating is not null then upr.id end) as evening_snacks_rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when meal_type = 'BREAKFAST' then upr.user_id end) as breakfast_meal_users,
count(distinct case when meal_type = 'LUNCH' then upr.user_id end) as lunch_meal_users,
count(distinct case when meal_type = 'DINNER' then upr.user_id end) as dinner_meal_users,
count(distinct case when meal_type = 'EVENING_SNACKS' then upr.user_id end) as evening_snacks_meal_users,
count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'BREAKFAST' then user_id end) as breakfast_preference_users,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'LUNCH' then user_id end) as lunch_preference_users,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'DINNER' then user_id end) as dinner_preference_users,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'EVENING_SNACKS' then user_id end) as evening_snacks_preference_users,
count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
count(distinct case when preference_available = 1 and meal_type = 'BREAKFAST' then user_id end) as breakfast_preference_available_users,
count(distinct case when preference_available = 1 and meal_type = 'LUNCH' then user_id end) as lunch_preference_available_users,
count(distinct case when preference_available = 1 and meal_type = 'DINNER' then user_id end) as dinner_preference_available_users,
count(distinct case when preference_available = 1 and meal_type = 'EVENING_SNACKS' then user_id end) as evening_snacks_preference_available_users,
count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'BREAKFAST' then id end) as breakfast_preference_meals,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'LUNCH' then id end) as lunch_preference_meals,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'DINNER' then id end) as dinner_preference_meals,
count(distinct case when system_generated = 0 and preference_available = 1 and meal_type = 'EVENING_SNACKS' then id end) as evening_snacks_preference_meals,
count(distinct case when preference_available = 1 then id end) as preference_available_meals,
count(distinct case when preference_available = 1 and meal_type = 'BREAKFAST' then id end) as breakfast_preference_available_meals,
count(distinct case when preference_available = 1 and meal_type = 'LUNCH' then id end) as lunch_preference_available_meals,
count(distinct case when preference_available = 1 and meal_type = 'DINNER' then id end) as dinner_preference_available_meals,
count(distinct case when preference_available = 1 and meal_type = 'EVENING_SNACKS' then id end) as evening_snacks_preference_available_meals,
avg(rating) as avg_meal_rating, sum(rating) as meal_rating_sum
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
and {% condition meal_type %} meal_type {% endcondition %}
and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
and {% condition preference_availability_flag %} preference_available {% endcondition %}
group by 1,2,3,4,5,6,7,8),

vo as (select city, micromarket,residence, user_id, name, phone, gender, profession, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users,
avg(rating) as avg_order_rating, sum(rating) as order_rating_sum
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1,2,3,4,5,6,7,8)


select distinct *
from
(select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users, avg_order_rating, order_rating_sum
from upr
left join vo on upr.user_id = vo.user_id


union


select vo.city, vo.micromarket, vo.residence, vo.user_id, vo.name, vo.phone, vo.gender, vo.profession, upr.moved_in_residents, upr.consumed_meals, upr.breakfast_consumed_meals, upr.lunch_consumed_meals, upr.dinner_consumed_meals, upr.evening_snacks_consumed_meals, upr.rated_meals, upr.breakfast_rated_meals, upr.lunch_rated_meals, upr.dinner_rated_meals, upr.evening_snacks_rated_meals, upr.meal_users, upr.breakfast_meal_users, upr.lunch_meal_users, upr.dinner_meal_users, upr.evening_snacks_meal_users, upr.preference_users, upr.breakfast_preference_users, upr.lunch_preference_users, upr.dinner_preference_users, upr.evening_snacks_preference_users, upr.preference_available_users, upr.breakfast_preference_available_users, upr.lunch_preference_available_users, upr.dinner_preference_available_users, upr.evening_snacks_preference_available_users, upr.preference_meals, upr.breakfast_preference_meals, upr.lunch_preference_meals, upr.dinner_preference_meals, upr.evening_snacks_preference_meals, upr.preference_available_meals, upr.breakfast_preference_available_meals, upr.lunch_preference_available_meals, upr.dinner_preference_available_meals, upr.evening_snacks_preference_available_meals, avg_meal_rating, meal_rating_sum, vo.total_orders, vo.rated_orders, aov, total_amount, order_users, avg_order_rating, order_rating_sum
from vo
left join upr on vo.user_id = upr.user_id) x ;;
  }


  # dimension_group: date {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.date ;;
  # }

  parameter: date {
    type: date
    convert_tz: no
  }

  filter: meal_type {
    # sql: exists (select distinct meal_type from derived_user_preference_rating) ;;
    suggestions: ["BREAKFAST","LUNCH","DINNER","EVENING_SNACKS"]
    type: string
  }

  filter: cafe_availability_flag {
    # sql: exists (select distinct meal_type from derived_user_preference_rating) ;;
    suggestions: ["1","0"]
    type: string
  }

  filter: preference_availability_flag {
    # sql: exists (select distinct meal_type from derived_user_preference_rating) ;;
    suggestions: ["1","0"]
    type: string
  }




  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: phone{
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: profession {
    type: string
    sql: ${TABLE}.profession ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  measure: moved_in_residents {
    type: sum
    sql: ${TABLE}.moved_in_residents ;;
  }

  measure: consumed_meals {
    type: sum
    sql: ${TABLE}.consumed_meals ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_consumed_meals {
    type: sum
    sql: ${TABLE}.breakfast_consumed_meals ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_consumed_meals {
    type: sum
    sql: ${TABLE}.lunch_consumed_meals ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_consumed_meals {
    type: sum
    sql: ${TABLE}.dinner_consumed_meals ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_consumed_meals {
    type: sum
    sql: ${TABLE}.evening_snacks_consumed_meals ;;
    group_label: "Meal Metrics"
  }

  measure: rated_meals {
    type: sum
    sql: ${TABLE}.rated_meals ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_rated_meals {
    type: sum
    sql: ${TABLE}.breakfast_rated_meals ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_rated_meals {
    type: sum
    sql: ${TABLE}.lunch_rated_meals ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_rated_meals {
    type: sum
    sql: ${TABLE}.dinner_rated_meals ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_rated_meals {
    type: sum
    sql: ${TABLE}.evening_snacks_rated_meals ;;
    group_label: "Meal Metrics"
  }

  measure: rated_meals_per {
    type: number
    sql: ${rated_meals}/${consumed_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: breakfast_rated_meals_per {
    type: number
    sql: ${breakfast_rated_meals}/${breakfast_consumed_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: lunch_rated_meals_per {
    type: number
    sql: ${lunch_rated_meals}/${lunch_consumed_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: dinner_rated_meals_per {
    type: number
    sql: ${dinner_rated_meals}/${dinner_consumed_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_rated_meals_per {
    type: number
    sql: ${evening_snacks_rated_meals}/${evening_snacks_consumed_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: meal_users {
    type: sum
    sql: ${TABLE}.meal_users ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_meal_users {
    type: sum
    sql: ${TABLE}.breakfast_meal_users ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_meal_users {
    type: sum
    sql: ${TABLE}.lunch_meal_users ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_meal_users {
    type: sum
    sql: ${TABLE}.dinner_meal_users ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_meal_users {
    type: sum
    sql: ${TABLE}.evening_snacks_meal_users ;;
    group_label: "Meal Metrics"
  }

  measure: preference_users {
    type: sum
    sql: ${TABLE}.preference_users ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_users {
    type: sum
    sql: ${TABLE}.breakfast_preference_users ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_users {
    type: sum
    sql: ${TABLE}.lunch_preference_users ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_users {
    type: sum
    sql: ${TABLE}.dinner_preference_users ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_users {
    type: sum
    sql: ${TABLE}.evening_snacks_preference_users ;;
    group_label: "Meal Metrics"
  }

  measure: preference_available_users {
    type: sum
    sql: ${TABLE}.preference_available_users ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_available_users {
    type: sum
    sql: ${TABLE}.breakfast_preference_available_users ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_available_users {
    type: sum
    sql: ${TABLE}.lunch_preference_available_users ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_available_users {
    type: sum
    sql: ${TABLE}.dinner_preference_available_users ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_available_users {
    type: sum
    sql: ${TABLE}.evening_snacks_preference_available_users ;;
    group_label: "Meal Metrics"
  }

  measure: preference_users_per {
    type: number
    sql: ${preference_users}/${preference_available_users} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_users_per {
    type: number
    sql: ${breakfast_preference_users}/${breakfast_preference_available_users} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_users_per {
    type: number
    sql: ${lunch_preference_users}/${lunch_preference_available_users} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_users_per {
    type: number
    sql: ${dinner_preference_users}/${dinner_preference_available_users} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_users_per {
    type: number
    sql: ${evening_snacks_preference_users}/${evening_snacks_preference_available_users} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: preference_meals {
    type: sum
    sql: ${TABLE}.preference_meals ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_meals {
    type: sum
    sql: ${TABLE}.breakfast_preference_meals ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_meals {
    type: sum
    sql: ${TABLE}.lunch_preference_meals ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_meals {
    type: sum
    sql: ${TABLE}.dinner_preference_meals ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_meals {
    type: sum
    sql: ${TABLE}.evening_snacks_preference_meals ;;
    group_label: "Meal Metrics"
  }

  measure: preference_available_meals {
    type: sum
    sql: ${TABLE}.preference_available_meals ;;
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_available_meals {
    type: sum
    sql: ${TABLE}.breakfast_preference_available_meals ;;
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_available_meals {
    type: sum
    sql: ${TABLE}.lunch_preference_available_meals ;;
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_available_meals {
    type: sum
    sql: ${TABLE}.dinner_preference_available_meals ;;
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_available_meals {
    type: sum
    sql: ${TABLE}.evening_snacks_preference_available_meals ;;
    group_label: "Meal Metrics"
  }

  measure: preference_meals_per {
    type: number
    sql: ${preference_meals}/${preference_available_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: breakfast_preference_meals_per {
    type: number
    sql: ${breakfast_preference_meals}/${breakfast_preference_available_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: lunch_preference_meals_per {
    type: number
    sql: ${lunch_preference_meals}/${lunch_preference_available_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: dinner_preference_meals_per {
    type: number
    sql: ${dinner_preference_meals}/${dinner_preference_available_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  measure: evening_snacks_preference_meals_per {
    type: number
    sql: ${evening_snacks_preference_meals}/${evening_snacks_preference_available_meals} ;;
    value_format: "0.0%"
    group_label: "Meal Metrics"
  }

  dimension: avg_meal_rating {
    type: number
    sql: ${TABLE}.avg_meal_rating ;;
    value_format: "00.0"
    group_label: "Meal Metrics"
  }

  measure: avg_meal_rating1 {
    type: number
    sql: sum(${TABLE}.meal_rating_sum)/sum(${TABLE}.rated_meals) ;;
    group_label: "Meal Metrics"
  }

  dimension: meal_fps_category {
    type: string
    sql: case when ${avg_meal_rating} >= 1 and ${avg_meal_rating} < 3 then "Detractor" when ${avg_meal_rating} >= 4 and ${avg_meal_rating} <= 5 then "Promoter" when ${avg_meal_rating} >= 3 and ${avg_meal_rating} < 4 then "Neutral" end;;
    group_label: "Meal Metrics"
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
    group_label: "Order Metrics"
  }

  measure: rated_orders {
    type: sum
    sql: ${TABLE}.rated_orders ;;
    group_label: "Order Metrics"
  }

  dimension: avg_order_rating {
    type: number
    sql: ${TABLE}.avg_order_rating ;;
    value_format: "00.0"
    group_label: "Order Metrics"
  }

  measure: avg_order_rating1 {
    type: number
    sql: sum(${TABLE}.order_rating_sum)/sum(${TABLE}.rated_orders) ;;
    group_label: "Order Metrics"
  }

  dimension: order_fps_category {
    type: string
    sql: case when ${avg_order_rating} >= 1 and ${avg_order_rating} < 3 then "Detractor" when ${avg_order_rating} >= 4 and ${avg_order_rating} <= 5 then "Promoter" when ${avg_order_rating} >= 3 and ${avg_order_rating} < 4 then "Neutral" end;;
    group_label: "Order Metrics"
  }

  measure: total_amount {
    type: sum
    sql: ${TABLE}.total_amount ;;
    group_label: "Order Metrics"
  }

  measure: order_users {
    type: sum
    sql: ${TABLE}.order_users ;;
    group_label: "Order Metrics"
  }

  measure: order_users_per {
    type: number
    sql: ${order_users}/${moved_in_residents} ;;
    value_format: "0.0%"
    group_label: "Order Metrics"
  }

  measure: rated_orders_per {
    type: number
    sql: ${rated_orders}/${total_orders} ;;
    value_format: "0.0%"
    group_label: "Order Metrics"
  }

  measure: aov1 {
    type: number
    sql: ${total_amount}/${total_orders} ;;
    value_format: "00"
    group_label: "Order Metrics"
  }
}
