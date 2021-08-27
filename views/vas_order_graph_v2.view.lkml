view: vas_order_graph_v2 {
  derived_table: {
    sql:    with upr as (select extract(year from upr.date) yr,extract(month from upr.date) mt,upr.city, upr.micromarket,residence, count(distinct user_id) as moved_in_residents, count(distinct upr.id) as consumed_meals,
      count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
      count(distinct user_id) as meal_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
      count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
      count(distinct case when preference_available = 1 then id end) as preference_available_meals
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01 00:00:00'
      and cafe_availability = true
      group by 1,2,3,4,5),

      vo as (select extract(year from vo.date) yr,extract(month from vo.date) mt, city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
      avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
      from looker_demo.derived_vas_orders vo
      where vo.date >= '2021-01-01 00:00:00'
      group by 1,2,3,4,5)


      select distinct *
      from
      (select yr, mt, city, micromarket, residence, user_id, id as order_code, "" as final_total_amount, 'meal' as type
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01 00:00:00'
      and cafe_availability = true
      union
      select yr, mt, city, micromarket, residence, user_id, order_code, final_total_amount, 'order' as type
      from looker_demo.derived_vas_orders vo
      where vo.date >= '2021-01-01 00:00:00'
      ) x;;

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


    dimension: user_id {
      type: number
      sql: ${TABLE}.user_id ;;
    }


    dimension: order_code {
      type: number
      sql: ${TABLE}.order_code ;;
    }

    dimension: final_total_amount {
      type: number
      sql: ${TABLE}.final_total_amount ;;
    }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

    measure: moved_in_residents {
      type: count_distinct
      sql: ${user_id} ;;
    }


    measure: total_orders {
      type: count_distinct
      sql: case when  ${type} = 'order' then ${order_code} end  ;;
    }

    measure: order_users {
      type: count_distinct
      sql: case when  ${type} = 'order' then ${user_id} end ;;
    }

    measure: total_amount {
      type: sum
      sql: ${TABLE}.final_total_amount ;;
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
