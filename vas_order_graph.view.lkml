view: vas_order_graph {
  derived_table: {
    sql:    with upr as (select upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
count(distinct case when preference_available = 1 then id end) as preference_available_meals
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
and {% condition meal_type %} meal_type {% endcondition %}
and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
and {% condition preference_availability_flag %} preference_available {% endcondition %}
group by 1,2,3),

vo as (select city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1,2,3),


a as (select distinct *
from
(select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
upr
left join vo on upr.residence = vo.residence
union


select vo.city, vo.micromarket, vo.residence, upr.moved_in_residents, upr.consumed_meals, upr.rated_meals, upr.meal_users, upr.preference_users, upr.preference_available_users, upr.preference_meals, upr.preference_available_meals, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
vo
left join upr on vo.residence = upr.residence) x),

upr1 as (select upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
count(distinct case when preference_available = 1 then id end) as preference_available_meals
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
and {% condition meal_type %} meal_type {% endcondition %}
and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
and {% condition preference_availability_flag %} preference_available {% endcondition %}
group by 1,2,3),

vo1 as (select city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
from looker_demo.derived_vas_orders vo
where {% condition date1 %} date {% endcondition %}
group by 1,2,3),

b as (select distinct *
from
(select upr1.*, vo1.total_orders, vo1.rated_orders, aov, total_amount, order_users
from
upr1
left join vo1 on upr1.residence = vo1.residence
union


select vo1.city, vo1.micromarket, vo1.residence, upr1.moved_in_residents, upr1.consumed_meals, upr1.rated_meals, upr1.meal_users,
upr1.preference_users, upr1.preference_available_users, upr1.preference_meals, upr1.preference_available_meals, vo1.total_orders,
vo1.rated_orders, aov, total_amount, order_users
from
vo1
left join upr1 on vo1.residence = upr1.residence) x)

select distinct *
from
((select a.city, a.micromarket, a.residence, a.moved_in_residents, a.consumed_meals, a.rated_meals, a.meal_users,
a.preference_users, a.preference_available_users, a.preference_meals, a.preference_available_meals, a.total_orders,
a.rated_orders, a.aov, a.total_amount, a.order_users,
b.moved_in_residents as moved_in_residents1, b.consumed_meals as consumed_meals1, b.rated_meals as rated_meals1, b.meal_users as meal_users1,
b.preference_users as preference_users1, b.preference_available_users as preference_available_users1, b.preference_meals as preference_meals1,
b.preference_available_meals as preference_available_meals1, b.total_orders as total_orders1,
b.rated_orders as rated_orders1, b.aov as aov1, b.total_amount as total_amount1, b.order_users as order_users1
from a
left join b on a.residence=b.residence) t
union
(select b.city, b.micromarket, b.residence, a.moved_in_residents, a.consumed_meals, a.rated_meals, a.meal_users,
a.preference_users, a.preference_available_users, a.preference_meals, a.preference_available_meals, a.total_orders,
a.rated_orders, a.aov, a.total_amount, a.order_users,
b.moved_in_residents as moved_in_residents1, b.consumed_meals as consumed_meals1, b.rated_meals as rated_meals1, b.meal_users as meal_users1,
b.preference_users as preference_users1, b.preference_available_users as preference_available_users1, b.preference_meals as preference_meals1,
b.preference_available_meals as preference_available_meals1, b.total_orders as total_orders1,
b.rated_orders as rated_orders1, b.aov as aov1, b.total_amount as total_amount1, b.order_users as order_users1
from b
left join a on b.residence=a.residence) e) b;;

  }

  parameter: date {
    type: date
    convert_tz: no
  }

  parameter: date1 {
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

  measure: moved_in_residents1 {
    type: sum
    sql: ${TABLE}.moved_in_residents1 ;;
  }


  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  measure: total_orders1 {
    type: sum
    sql: ${TABLE}.total_orders1 ;;
  }

  measure: order_users {
    type: sum
    sql: ${TABLE}.order_users ;;
  }

  measure: order_users1 {
    type: sum
    sql: ${TABLE}.order_users1 ;;
  }

  measure: total_amount {
    type: sum
    sql: ${TABLE}.total_amount ;;
  }

  measure: total_amount1 {
    type: sum
    sql: ${TABLE}.total_amount1 ;;
  }


  measure: aov {
    type: number
    sql: ${total_amount} / ${total_orders} ;;
  }

  measure: aov1 {
    type: number
    sql: ${total_amount1} / ${total_orders1} ;;
  }

  measure: aov_user {
    type: number
    sql: ${total_amount} / ${order_users} ;;
  }

  measure: aov1_user1 {
    type: number
    sql: ${total_amount1} / ${order_users1} ;;
  }

  measure: aov_user_min {
    type: number
    sql: ${total_amount} / ${moved_in_residents} ;;
  }

  measure: aov1_user1_mir {
    type: number
    sql: ${total_amount1} / ${moved_in_residents1} ;;
  }


  measure: order_users_per {
    type: number
    sql: ${order_users}/ ${moved_in_residents} ;;
    }

  measure: order_users_per1 {
    type: number
    sql: ${order_users1}/ ${moved_in_residents1} ;;
  }






}
