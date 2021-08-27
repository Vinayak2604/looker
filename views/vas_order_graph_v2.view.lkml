view: vas_order_graph_v2 {
  derived_table: {
    sql:    with upr as (select extract(year from upr.date) yr,extract(month from upr.date) mt,upr.city, upr.micromarket,residence, max(moved_in_residence) as moved_in_residents, count(distinct upr.id) as consumed_meals,
      count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
      count(distinct user_id) as meal_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
      count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
      count(distinct case when preference_available = 1 then id end) as preference_available_meals
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01 00:00:00'
      and {% condition meal_type %} meal_type {% endcondition %}
      and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
      and {% condition preference_availability_flag %} preference_available {% endcondition %}
      group by 1,2,3,4,5),

      vo as (select extract(year from vo.date) yr,extract(month from vo.date) mt, city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
      avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
      from looker_demo.derived_vas_orders vo
      where vo.date >= '2021-01-01 00:00:00'
      group by 1,2,3,4,5)


      select distinct *
      from
      (select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
      from
      upr
      join vo on upr.micromarket = vo.micromarket and upr.city = vo.city and upr.mt = vo.mt and upr.residence = vo.residence
      union


      select vo.yr, vo.mt, vo.city, vo.micromarket,vo.residence, upr.moved_in_residents, upr.consumed_meals, upr.rated_meals, upr.meal_users, upr.preference_users, upr.preference_available_users, upr.preference_meals, upr.preference_available_meals, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
      from
      vo
      join upr on vo.micromarket = upr.micromarket and vo.city = upr.city and vo.mt = upr.mt and vo.residence = upr.residence ) x;;

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
      type: number
      sql: ${TABLE}.mt ;;
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


    dimension: moved_in_resident {
      type: number
      sql: ${TABLE}.moved_in_residents ;;
    }


    dimension: total_order {
      type: number
      sql: ${TABLE}.total_orders ;;
    }

    dimension: order_user {
      type: number
      sql: ${TABLE}.order_users ;;
    }


    measure: moved_in_residents {
      type: sum
      sql: ${moved_in_resident} ;;
    }


    measure: total_orders {
      type: sum
      sql: ${total_order};;
    }

    measure: order_users {
      type: sum
      sql: ${order_user} ;;
    }

    measure: total_amount {
      type: sum
      sql: ${TABLE}.total_amount ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }

    measure: aov {
      type: number
      sql: ${total_amount} / ${total_orders} ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }

    measure: aov_user {
      type: number
      sql: ${total_amount} / ${moved_in_residents} ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }

    measure: aov_user_mir {
      type: number
      sql: ${total_amount} / ${moved_in_residents} ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }

    measure: order_users_per {
      type: number
      sql: ${order_users}/ ${moved_in_residents} ;;
      value_format: "0.0%"
    }





  }
