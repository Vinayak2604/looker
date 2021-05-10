view: user_scorecard {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    select distinct *
from
(select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users, avg_order_rating
from
(select upr.city, upr.micromarket, upr.residence, upr.user_id, upr.name, upr.phone, upr.gender, upr.profession, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
count(distinct case when preference_available = 1 then id end) as preference_available_meals,
avg(rating) as avg_meal_rating
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
and {% condition meal_type %} meal_type {% endcondition %}
and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
and {% condition preference_availability_flag %} preference_available {% endcondition %}
group by 1,2,3,4,5,6,7,8) upr
left join (select city, micromarket,residence, user_id, name, phone, gender, profession, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users,
avg(rating) as avg_order_rating
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1,2,3,4,5,6,7,8) vo on upr.residence = vo.residence


union


select vo.city, vo.micromarket, vo.residence, vo.user_id, vo.name, vo.phone, vo.gender, vo.profession, upr.moved_in_residents, upr.consumed_meals, upr.rated_meals, upr.meal_users, upr.preference_users, upr.preference_available_users, upr.preference_meals, upr.preference_available_meals, avg_meal_rating, vo.total_orders, vo.rated_orders, aov, total_amount, order_users, avg_order_rating
from
(select city, micromarket,residence, user_id, name, phone, gender, profession, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users,
avg(rating) as avg_order_rating
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1,2,3,4,5,6,7,8) vo
left join
(select upr.city, upr.micromarket, upr.residence, upr.user_id, name, phone, gender, profession, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
count(distinct case when upr.rating is not null then upr.id end) as rated_meals,
count(distinct user_id) as meal_users,
count(distinct case when system_generated = 0 and preference_available = 1 then user_id end) as preference_users,
count(distinct case when preference_available = 1 then user_id end) as preference_available_users,
count(distinct case when system_generated = 0 and preference_available = 1 then id end) as preference_meals,
count(distinct case when preference_available = 1 then id end) as preference_available_meals,
avg(rating) as avg_meal_rating
from looker_demo.derived_user_preference_rating upr
where {% condition date %} date {% endcondition %}
and {% condition meal_type %} meal_type {% endcondition %}
and {% condition cafe_availability_flag %} cafe_availability {% endcondition %}
and {% condition preference_availability_flag %} preference_available {% endcondition %}
group by 1,2,3,4,5,6,7,8) upr on vo.user_id = upr.user_id) x ;;
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

  dimension: moved_in_residents {
    type: number
    sql: ${TABLE}.moved_in_residents ;;
  }

  measure: moved_in_residents1 {
    type: sum
    sql: ${TABLE}.moved_in_residents ;;
  }

  dimension: consumed_meals {
    type: number
    sql: ${TABLE}.consumed_meals ;;
  }

  measure: consumed_meals1 {
    type: sum
    sql: ${TABLE}.consumed_meals ;;
  }

  dimension: rated_meals {
    type: number
    sql: ${TABLE}.rated_meals ;;
  }

  measure: rated_meals1 {
    type: sum
    sql: ${TABLE}.rated_meals ;;
  }

  dimension: rated_meals_per {
    type: number
    sql: ${rated_meals}/${consumed_meals} ;;
    value_format: "0.0%"
  }

  measure: rated_meals_per1 {
    type: number
    sql: ${rated_meals1}/${consumed_meals1} ;;
    value_format: "0.0%"
  }

  dimension: meal_users {
    type: number
    sql: ${TABLE}.meal_users ;;
  }

  measure: meal_users1 {
    type: sum
    sql: ${TABLE}.meal_users ;;
  }

  dimension: preference_users {
    type: number
    sql: ${TABLE}.preference_users ;;
  }

  measure: preference_users1 {
    type: sum
    sql: ${TABLE}.preference_users ;;
  }

  dimension: preference_available_users {
    type: number
    sql: ${TABLE}.preference_available_users ;;
  }

  measure: preference_available_users1 {
    type: sum
    sql: ${TABLE}.preference_available_users ;;
  }

  dimension: preference_users_per {
    type: number
    sql: ${preference_users}/${preference_available_users} ;;
    value_format: "0.0%"
  }

  measure: preference_users_per1 {
    type: number
    sql: ${preference_users1}/${preference_available_users1} ;;
    value_format: "0.0%"
  }

  dimension: preference_meals {
    type: number
    sql: ${TABLE}.preference_meals ;;
  }

  measure: preference_meals1 {
    type: sum
    sql: ${TABLE}.preference_meals ;;
  }

  dimension: preference_available_meals {
    type: number
    sql: ${TABLE}.preference_available_meals ;;
  }

  measure: preference_available_meals1 {
    type: sum
    sql: ${TABLE}.preference_available_meals ;;
  }

  dimension: preference_meals_per {
    type: number
    sql: ${preference_meals}/${preference_available_meals} ;;
    value_format: "0.0%"
  }

  measure: preference_meals_per1 {
    type: number
    sql: ${preference_meals1}/${preference_available_meals1} ;;
    value_format: "0.0%"
  }

  dimension: avg_meal_rating {
    type: number
    sql: ${TABLE}.avg_meal_rating ;;
    value_format: "00.0"
  }

  dimension: meal_fps_category {
    type: string
    sql: case when ${avg_meal_rating} >= 1 and ${avg_meal_rating} < 3 then "Detractor" when ${avg_meal_rating} >= 4 and ${avg_meal_rating} <= 5 then "Promoter" when ${avg_meal_rating} >= 3 and ${avg_meal_rating} < 4 then "Neutral" end;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  measure: total_orders1 {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  dimension: rated_orders {
    type: number
    sql: ${TABLE}.rated_orders ;;
  }

  measure: rated_orders1 {
    type: sum
    sql: ${TABLE}.rated_orders ;;
  }

  dimension: avg_order_rating {
    type: number
    sql: ${TABLE}.avg_order_rating ;;
    value_format: "00.0"
  }

  dimension: user_fps_category {
    type: string
    sql: case when ${avg_order_rating} >= 1 and ${avg_order_rating} < 3 then "Detractor" when ${avg_order_rating} >= 4 and ${avg_order_rating} <= 5 then "Promoter" when ${avg_order_rating} >= 3 and ${avg_order_rating} < 4 then "Neutral" end;;
  }

  dimension: aov {
    type: number
    sql: ${TABLE}.aov ;;
    value_format: "00"

    # link: {
    #   url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.aov&f[derived_vas_orders.aov]=%3C63&sorts=derived_vas_orders.aov&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.aov%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2263%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis"
    #   label: "AOV Below Threshold Users"
    # }
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  measure: total_amount1 {
    type: sum
    sql: ${TABLE}.total_amount ;;
  }

  dimension: order_users {
    type: number
    sql: ${TABLE}.order_users ;;
  }

  measure: order_users1 {
    type: sum
    sql: ${TABLE}.order_users ;;
  }

  dimension: order_users_per {
    type: number
    sql: ${order_users}/${moved_in_residents} ;;
    value_format: "0.0%"
  }

  measure: order_users_per1 {
    type: number
    sql: ${order_users1}/${moved_in_residents1} ;;
    value_format: "0.0%"
  }

  dimension: rated_orders_per {
    type: number
    sql: ${rated_orders}/${total_orders} ;;
    value_format: "0.0%"
  }

  measure: rated_orders_per1 {
    type: number
    sql: ${rated_orders1}/${total_orders1} ;;
    value_format: "0.0%"
  }

  measure: aov1 {
    type: number
    sql: ${total_amount1}/${total_orders1} ;;
    value_format: "00"
  }
}
