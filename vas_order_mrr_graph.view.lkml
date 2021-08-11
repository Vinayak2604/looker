view: vas_order_mrr_graph {
  derived_table: {
    sql:    with upr as (select extract(year from upr.date) yr,extract(month from upr.date) mt,upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
      count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
      count(distinct user_id) as meal_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
      count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
      count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
      count(distinct case when preference_available = 1 then id end) as preference_available_meals
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01'
      and cafe_availability = 1
      group by 1,2,3,4,5),


      upr1 as (select extract(year from upr.move_in_date) yr,extract(month from upr.move_in_date) mt,upr.city, upr.micromarket, upr.residence,
      count(distinct upr.user_id) as joined_residents
      from looker_demo.derived_user_preference_rating upr
      where date(move_in_date) >= '2021-01-01'
      group by 1,2,3,4,5),

      vo as (select extract(year from vo.date) yr,extract(month from vo.date) mt,vo.date, city, micromarket,residence,user_id, min(vo.date) over(partition by user_id order by date) first_order,
      order_code, move_in_date

      from looker_demo.derived_vas_orders vo
      where vo.date >= '2020-10-01'
        ),

   b  as (select distinct vo.yr, vo.mt, vo.date, vo.city, vo.micromarket, vo.residence, vo.user_id, vo.first_order,vo.order_code, vo.move_in_date, upr.moved_in_residents,
        lag(vo.yr) over(partition by vo.user_id order by vo.date) yr_l1,lag(vo.mt) over(partition by vo.user_id order by vo.date) mt_l1,
        lag(vo.yr,2) over(partition by vo.user_id order by vo.date) yr_l2,lag(vo.mt,2) over(partition by vo.user_id order by vo.date) mt_l2,
        upr1.joined_residents
        from vo
        join upr on vo.residence=upr.residence and vo.mt=upr.mt and vo.yr=upr.yr
        left join upr1 on vo.residence=upr1.residence and vo.mt=upr1.mt and vo.yr=upr1.yr)

    select distinct upr.yr, upr.mt, upr.city, upr.micromarket, upr.residence, upr.user_id,upr.user_id as ordered_user_id ,b.first_order,b.order_code, b.move_in_date, b.moved_in_residents,
        b.yr_l1, b.mt_l1, b.yr_l2, b.mt_l2,b.joined_residents
    from upr
    left join b on upr.residence=b.residence and upr.mt=b.mt and upr.yr=b.yr and upr.user_id=b.user_id
        ;;

    }

  dimension: yr {
    type: number
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
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: ordered_user_id {
    type: string
    sql: ${TABLE}.ordered_user_id ;;
  }

  dimension: first_order {
    type: date
    sql: ${TABLE}.first_order ;;
  }

  dimension: order_code {
    type: string
    sql: ${TABLE}.order_code ;;
  }

  dimension: move_in_date {
    type: date
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: moved_in_residents {
    type: number
    sql: ${TABLE}.moved_in_residents ;;
  }


  dimension: yr_l1 {
    type: number
    sql: ${TABLE}.yr_l1 ;;
  }


  dimension: mt_l1 {
    type: number
    sql: ${TABLE}.mt_l1 ;;
  }


  dimension: yr_l2 {
    type: number
    sql: ${TABLE}.yr_l2 ;;
  }


  dimension: mt_l2 {
    type: number
    sql: ${TABLE}.mt_l2 ;;
  }

  dimension: joined_residents {
    type: number
    sql: ${TABLE}.joined_residents ;;
  }

  measure: moved_in_residents1 {
    type: number
    sql: sum( distinct ${moved_in_residents}) ;;
  }

  measure: joined_residents1 {
    type: number
    sql: sum( distinct ${joined_residents}) ;;
  }

  measure: total_user {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: ordered_user {
    type: count_distinct
    sql: ${ordered_user_id} ;;
  }

  measure: joined_order_user {
    type: count_distinct
    sql: case when ${mt} = extract(month from ${move_in_date}) then ${ordered_user_id} end ;;
  }

  measure: new {
    type: count_distinct
    sql: case when ${yr} = extract(year from ${first_order}) and ${mt} = extract(month from ${first_order}) then ${ordered_user_id} end ;;
  }

  measure: retained {
    type: count_distinct
    sql: case when ( ${mt} = 1 and ${mt_l1} = 12 ) or ${mt_l1} = ${mt} -1  then ${ordered_user_id} end ;;
  }


  measure: resurrected {
    type: count_distinct
    sql: case when (( ${mt} = 1 and ${mt_l1} != 12) or (${mt_l1} != (${mt} - 1))) then ${ordered_user_id} end ;;
  }


  measure: churned_data {
    type: count_distinct
    sql: case when (${yr} > extract(year from ${first_order})) or (${yr} = extract(year from ${first_order}) and ${mt} > extract(month from ${first_order})) then ${ordered_user_id} end ;;
    hidden: yes
  }

  measure: churned {
    type: number
    sql: (0 - ${churned_data}) ;;
  }


  measure: non_vas_activated {
    type: number
    sql: (${total_user} - ${ordered_user_id})  ;;
  }


  measure: quick_ratio {
    type: number
    sql: ((${new}+${resurrected}) / ${churned_data}) ;;
    value_format: "0.0"

  }

  measure: total_data {
    type: number
    sql: (${new}+${retained}+${non_vas_activated}+${resurrected}+$(${churned_data});;
    hidden: yes
  }




  }
