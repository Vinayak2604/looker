view: new_dashboard_test {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    select distinct *
from
(select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
(select upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when item_base_preference = 1 then user_id end) as preference_users,
count(distinct case when item_base_preference = 1 then id end) as preference_meals
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
group by 1,2,3) upr
left join (select residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1) vo on upr.residence = vo.residence


union


select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
(select upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when item_base_preference = 1 then user_id end) as preference_users,
count(distinct case when item_base_preference = 1 then id end) as preference_meals
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
group by 1,2,3) upr
right join (select residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1) vo on upr.residence = vo.residence) x ;;
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
    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.meal_type,derived_user_preference_rating.rated_meals_per&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22Rated+Meals%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Level Rated Per"
    }
  }

  dimension: moved_in_residents {
    type: number
    sql: ${TABLE}.moved_in_residents ;;
  }

  dimension: consumed_meals {
    type: number
    sql: ${TABLE}.consumed_meals ;;
  }

  dimension: rated_meals {
    type: number
    sql: ${TABLE}.rated_meals ;;
  }

  dimension: rated_meals_per {
    type: number
    sql: ${rated_meals}/${consumed_meals} ;;
    value_format: "0.0%"
  }

  dimension: meal_users {
    type: number
    sql: ${TABLE}.meal_users ;;
  }

  dimension: preference_users {
    type: number
    sql: ${TABLE}.preference_users ;;
  }

  dimension: preference_users_per {
    type: number
    sql: ${preference_users}/${meal_users} ;;
    value_format: "0.0%"
  }

  dimension: preference_meals {
    type: number
    sql: ${TABLE}.preference_meals ;;
  }

  dimension: preference_meals_per {
    type: number
    sql: ${preference_meals}/${consumed_meals} ;;
    value_format: "0.0%"
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension: rated_orders {
    type: number
    sql: ${TABLE}.rated_orders ;;
  }

  dimension: aov {
    type: number
    sql: ${TABLE}.aov ;;
    # value_format: "0.0"
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: order_users {
    type: number
    sql: ${TABLE}.order_users ;;
  }

  dimension: order_users_per {
    type: number
    sql: ${order_users}/${moved_in_residents} ;;
    value_format: "0.0%"
  }

  dimension: rated_orders_per {
    type: number
    sql: ${rated_orders}/${total_orders} ;;
    value_format: "0.0%"
  }

  measure: aov1 {
    sql: sum(${total_amount})/sum(${total_orders} ;;
    value_format: "0.0"
  }
}
