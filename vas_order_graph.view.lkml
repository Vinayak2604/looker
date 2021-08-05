view: vas_order_graph {
  derived_table: {
    sql:    with upr as (select extract(year from upr.date) yr,extract(month from upr.date) mt,upr.date, upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
      count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
      count(distinct user_id) as meal_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
      count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
      count(distinct case when preference_available = 1 then id end) as preference_available_meals
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01'
      and {% condition meal_type %} meal_type {% endcondition %}
      and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
      and {% condition preference_availability_flag %} preference_available {% endcondition %}
      group by 1,2,3,4,5,6),

      vo as (select extract(year from vo.date) yr,extract(month from vo.date) mt,vo.date, city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
      avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
      from looker_demo.derived_vas_orders vo
      where vo.date >= '2021-01-01'
      group by 1,2,3,4,5,6)


      select distinct *
      from
      (select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
      from
      upr
      left join vo on upr.residence = vo.residence and upr.date = vo.date
      union


      select vo.yr, vo.mt,vo.date, vo.city, vo.micromarket, vo.residence, upr.moved_in_residents, upr.consumed_meals, upr.rated_meals, upr.meal_users, upr.preference_users, upr.preference_available_users, upr.preference_meals, upr.preference_available_meals, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
      from
      vo
      left join upr on vo.residence = upr.residence and vo.date = upr.date) x;;

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

  dimension: yr {
    type: string
    sql: ${TABLE}.yr ;;
  }

    dimension: mt {
      type: string
      sql: ${TABLE}.mt ;;
    }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
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


    measure: total_orders {
      type: sum
      sql: ${TABLE}.total_orders ;;
    }

    measure: order_users {
      type: sum
      sql: ${TABLE}.order_users ;;
    }

    measure: total_amount {
      type: sum
      sql: ${TABLE}.total_amount ;;
      value_format: "#,##0"
    }

    measure: aov {
      type: number
      sql: ${total_amount} / ${total_orders} ;;
      value_format: "#,##0.0"
    }

    measure: aov_user {
      type: number
      sql: ${total_amount} / ${order_users} ;;
      value_format: "#,##0.0"
    }

    measure: aov_user_mir {
      type: number
      sql: ${total_amount} / ${moved_in_residents} ;;
      value_format: "#,##0.0"
    }

    measure: order_users_per {
      type: number
      sql: ${order_users}/ ${moved_in_residents} ;;
      value_format: "0.0%"
    }





  }
