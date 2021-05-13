view: new_dashboard_test {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    with upr as (select upr.city, upr.micromarket, upr.residence, max(upr.moved_in_residents) as moved_in_residents, count(distinct upr.id) as consumed_meals,
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

vo as (select city, micromarket,residence, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders, avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
from looker_demo.derived_vas_orders vo
where {% condition date %} date {% endcondition %}
group by 1,2,3)

    select distinct *
from
(select upr.*, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
upr
left join vo on upr.residence = vo.residence
union


select vo.city, vo.micromarket, vo.residence, upr.moved_in_residents, upr.consumed_meals, upr.rated_meals, upr.meal_users, upr.preference_users, upr.preference_available_users, upr.preference_meals, upr.preference_available_meals, vo.total_orders, vo.rated_orders, aov, total_amount, order_users
from
vo
left join upr on vo.residence = upr.residence) x ;;
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

  # parameter: meal_type {
  #   allowed_value: {
  #     label: "BREAKFAST"
  #     value: "BREAKFAST"
  #   }
  #   allowed_value: {
  #     label: "LUNCH"
  #     value: "LUNCH"
  #   }
  #   allowed_value: {
  #     label: "DINNER"
  #     value: "DINNER"
  #   }
  #   allowed_value: {
  #     label: "EVENING SNACKS"
  #     value: "EVENING SNACKS"
  #   }
  #   allowed_value: {
  #     label: "All Meals"
  #     value: "'BREAKFAST','LUNCH','DINNER','EVENING SNACKS'"
  #   }
  #   # type: unquoted
  #   suggestions: ["BREAKFAST","LUNCH"]
  #   full_suggestions: yes
  #   # suggest_explore: derived_user_preference_rating
  #   # suggest_dimension: derived_user_preference_rating.meal_type
  #   # bypass_suggest_restrictions: no

  # }

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

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.rated_meals_per,derived_user_preference_rating.date_date,derived_user_preference_rating.rated_meals_breakfast_per,derived_user_preference_rating.rated_meals_lunch_per,derived_user_preference_rating.rated_meals_dinner_per,derived_user_preference_rating.rated_meals_evening_snacks_per&fill_fields=derived_user_preference_rating.date_date&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&total=on&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22name%22%3A%22Rated+Meals%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22name%22%3A%22Rated+Meals+Breakfast+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22name%22%3A%22Rated+Meals+Lunch+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22name%22%3A%22Rated+Meals+Dinner+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22name%22%3A%22Rated+Meals+Evening+Snacks+Per%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%5D%2C%22x_axis_label%22%3A%22Date%22%2C%22hidden_series%22%3A%5B%5D%2C%22font_size%22%3A%22%22%2C%22series_types%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22area%22%7D%2C%22series_colors%22%3A%7B%7D%2C%22series_labels%22%3A%7B%7D%2C%22series_point_styles%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22square%22%7D%2C%22reference_lines%22%3A%5B%5D%2C%22trend_lines%22%3A%5B%5D%2C%22swap_axes%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22groupBars%22%3Atrue%2C%22labelSize%22%3A%2210pt%22%2C%22showLegend%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Wise DOD SMR"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.meal_type,derived_user_preference_rating.rated_meals_per&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22Rated+Meals%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Level SMR"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.user_id,derived_user_preference_rating.name,derived_user_preference_rating.gender,derived_user_preference_rating.profession,derived_user_preference_rating.rated_meals_per,derived_user_preference_rating.total_orders&f[derived_user_preference_rating.rated_meals_per]=%3C0.3&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Meals%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.rated_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.3%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "SMR Below Threshold Users"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.date_date,derived_user_preference_rating.preference_meals_per,derived_user_preference_rating.breakfast_preference_meals_per,derived_user_preference_rating.lunch_preference_meals_per,derived_user_preference_rating.dinner_preference_meals_per,derived_user_preference_rating.evening_snacks_preference_meals_per&fill_fields=derived_user_preference_rating.date_date&sorts=derived_user_preference_rating.date_date+desc&limit=500&total=on&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22name%22%3A%22Rated+Meals%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22name%22%3A%22Rated+Meals+Breakfast+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22name%22%3A%22Rated+Meals+Lunch+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22name%22%3A%22Rated+Meals+Dinner+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22name%22%3A%22Rated+Meals+Evening+Snacks+Per%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%5D%2C%22x_axis_label%22%3A%22Date%22%2C%22hidden_series%22%3A%5B%5D%2C%22font_size%22%3A%22%22%2C%22series_types%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22area%22%2C%22derived_user_preference_rating.preference_meals_per%22%3A%22area%22%7D%2C%22series_colors%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.preference_meals_per%22%3A%22Overall%22%2C%22derived_user_preference_rating.breakfast_preference_meals_per%22%3A%22Breakfast%22%2C%22derived_user_preference_rating.lunch_preference_meals_per%22%3A%22Lunch%22%2C%22derived_user_preference_rating.dinner_preference_meals_per%22%3A%22Dinner%22%2C%22derived_user_preference_rating.evening_snacks_preference_meals_per%22%3A%22Evening+Snacks%22%7D%2C%22series_point_styles%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22square%22%7D%2C%22reference_lines%22%3A%5B%5D%2C%22trend_lines%22%3A%5B%5D%2C%22swap_axes%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22groupBars%22%3Atrue%2C%22labelSize%22%3A%2210pt%22%2C%22showLegend%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Wise DOD Preference Penetration"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.meal_type,derived_user_preference_rating.preference_meals_per&sorts=derived_user_preference_rating.preference_meals_per+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"

      label: "Meal Level Preference Penetration"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.user_id,derived_user_preference_rating.name,derived_user_preference_rating.gender,derived_user_preference_rating.profession,derived_user_preference_rating.preference_meals_per,derived_user_preference_rating.preference_available_orders&f[derived_user_preference_rating.preference_meals_per]=%3C0.8&sorts=derived_user_preference_rating.preference_meals_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Meals%22%2C%22derived_user_preference_rating.preference_meals_per%22%3A%22Meal+Preference+Penetration%22%2C%22derived_user_preference_rating.preference_available_orders%22%3A%22Preference+Available+Meals%22%7D%2C%22series_column_widths%22%3A%7B%22derived_user_preference_rating.preference_meals_per%22%3A133%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.preference_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.8%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Preference Penetration Below Threshold Users"
    }

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.user_id,derived_vas_orders.name,derived_vas_orders.email,derived_vas_orders.gender,derived_vas_orders.profession,derived_vas_orders.aov,derived_vas_orders.orders&f[derived_vas_orders.aov]=%3C63&sorts=derived_vas_orders.aov+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.orders%22%3A%22Total+Orders%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.aov%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2263%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_vas_orders.residence]={{ value }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis"
      label: "AOV Below Threshold Users"
    }

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.user_id,derived_vas_orders.name,derived_vas_orders.email,derived_vas_orders.gender,derived_vas_orders.profession,derived_vas_orders.rated_orders_per,derived_vas_orders.orders&f[derived_vas_orders.rated_orders_per]=%3C0.013&sorts=derived_vas_orders.rated_orders_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.orders%22%3A%22Total+Orders%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.rated_orders_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.013%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_vas_orders.residence]={{ value }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis"
      label: "Rated Orders Below Threshold Users"
    }

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
    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.rated_meals_per,derived_user_preference_rating.date_date,derived_user_preference_rating.rated_meals_breakfast_per,derived_user_preference_rating.rated_meals_lunch_per,derived_user_preference_rating.rated_meals_dinner_per,derived_user_preference_rating.rated_meals_evening_snacks_per&fill_fields=derived_user_preference_rating.date_date&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&total=on&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22name%22%3A%22Rated+Meals%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22name%22%3A%22Rated+Meals+Breakfast+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22name%22%3A%22Rated+Meals+Lunch+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22name%22%3A%22Rated+Meals+Dinner+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22name%22%3A%22Rated+Meals+Evening+Snacks+Per%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%5D%2C%22x_axis_label%22%3A%22Date%22%2C%22hidden_series%22%3A%5B%5D%2C%22font_size%22%3A%22%22%2C%22series_types%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22area%22%7D%2C%22series_colors%22%3A%7B%7D%2C%22series_labels%22%3A%7B%7D%2C%22series_point_styles%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22square%22%7D%2C%22reference_lines%22%3A%5B%5D%2C%22trend_lines%22%3A%5B%5D%2C%22swap_axes%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22groupBars%22%3Atrue%2C%22labelSize%22%3A%2210pt%22%2C%22showLegend%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Meal Wise DOD SMR"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.meal_type,derived_user_preference_rating.rated_meals_per&sorts=derived_user_preference_rating.rated_meals_per+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Meal Wise SMR"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.user_id,derived_user_preference_rating.name,derived_user_preference_rating.gender,derived_user_preference_rating.profession,derived_user_preference_rating.residence,derived_user_preference_rating.micromarket,derived_user_preference_rating.city,derived_user_preference_rating.rated_meals_per,derived_user_preference_rating.total_orders&sorts=derived_user_preference_rating.rated_meals_per&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Consumed+Meals%22%7D%2C%22series_column_widths%22%3A%7B%22derived_user_preference_rating.total_orders%22%3A160%2C%22derived_user_preference_rating.gender%22%3A102%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%2C%22value_display%22%3Atrue%7D%7D%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22less+than%22%2C%22value%22%3A0.3%2C%22background_color%22%3A%22%23a80d0d%22%2C%22font_color%22%3A%22%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-diverging-0%22%2C%22options%22%3A%7B%22steps%22%3A5%2C%22constraints%22%3A%7B%22min%22%3A%7B%22type%22%3A%22minimum%22%7D%2C%22mid%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3Anull%7D%2C%22max%22%3A%7B%22type%22%3A%22maximum%22%7D%7D%2C%22mirror%22%3Atrue%2C%22reverse%22%3Afalse%2C%22stepped%22%3Afalse%7D%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22derived_user_preference_rating.rated_meals_per%22%5D%7D%2C%7B%22type%22%3A%22along+a+scale...%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%2362bad4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22custom%22%3A%7B%22id%22%3A%22f928c024-f462-a089-4dfa-3c81e0ef70b2%22%2C%22label%22%3A%22Custom%22%2C%22type%22%3A%22continuous%22%2C%22stops%22%3A%5B%7B%22color%22%3A%22%23f2574e%22%2C%22offset%22%3A0%7D%2C%7B%22color%22%3A%22%23FCF758%22%2C%22offset%22%3A50%7D%2C%7B%22color%22%3A%22%234FBC89%22%2C%22offset%22%3A100%7D%5D%7D%2C%22options%22%3A%7B%22steps%22%3A5%2C%22constraints%22%3A%7B%22min%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3A0.3%7D%2C%22mid%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3A0%7D%2C%22max%22%3A%7B%22type%22%3A%22maximum%22%7D%7D%2C%22mirror%22%3Afalse%2C%22reverse%22%3Afalse%2C%22stepped%22%3Atrue%7D%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22derived_user_preference_rating.rated_meals_per%22%5D%7D%5D%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "User Level SMR"
    }

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

    # link: {
    #   url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.preference_meals_per,derived_user_preference_rating.total_orders&f[derived_user_preference_rating.preference_meals_per]=%3C0.8&sorts=derived_user_preference_rating.preference_meals_per&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.preference_meals_per%22%3A%22Preference+Meals%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Meals%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.orders_with_preference%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22hidden_fields%22%3A%5B%5D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.preference_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.8%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22table_calculation%22%3A%22preference_meals%22%2C%22label%22%3A%22Preference+Meals%22%2C%22expression%22%3A%22%24%7Bderived_user_preference_rating.orders_with_preference%7D%2F%24%7Bderived_user_preference_rating.total_orders%7D%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_1%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
    #   label: "Preference Meals Below Threshold Users"
    # }

  }

  measure: preference_meals_per1 {
    type: number
    sql: ${preference_meals1}/${preference_available_meals1} ;;
    value_format: "0.0%"

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.date_date,derived_user_preference_rating.preference_meals_per,derived_user_preference_rating.breakfast_preference_meals_per,derived_user_preference_rating.lunch_preference_meals_per,derived_user_preference_rating.dinner_preference_meals_per,derived_user_preference_rating.evening_snacks_preference_meals_per&fill_fields=derived_user_preference_rating.date_date&sorts=derived_user_preference_rating.date_date+desc&limit=500&total=on&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%226c27c30e-5523-4080-82ae-272146e699d0%22%2C%22palette_id%22%3A%2287654122-8144-4720-8259-82ac9908d5f4%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_per%22%2C%22name%22%3A%22Rated+Meals%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_breakfast_per%22%2C%22name%22%3A%22Rated+Meals+Breakfast+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_lunch_per%22%2C%22name%22%3A%22Rated+Meals+Lunch+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_dinner_per%22%2C%22name%22%3A%22Rated+Meals+Dinner+Per%22%7D%2C%7B%22axisId%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22id%22%3A%22derived_user_preference_rating.rated_meals_evening_snacks_per%22%2C%22name%22%3A%22Rated+Meals+Evening+Snacks+Per%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A0%2C%22type%22%3A%22linear%22%7D%5D%2C%22x_axis_label%22%3A%22Date%22%2C%22hidden_series%22%3A%5B%5D%2C%22font_size%22%3A%22%22%2C%22series_types%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22area%22%2C%22derived_user_preference_rating.preference_meals_per%22%3A%22area%22%7D%2C%22series_colors%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.preference_meals_per%22%3A%22Overall%22%2C%22derived_user_preference_rating.breakfast_preference_meals_per%22%3A%22Breakfast%22%2C%22derived_user_preference_rating.lunch_preference_meals_per%22%3A%22Lunch%22%2C%22derived_user_preference_rating.dinner_preference_meals_per%22%3A%22Dinner%22%2C%22derived_user_preference_rating.evening_snacks_preference_meals_per%22%3A%22Evening+Snacks%22%7D%2C%22series_point_styles%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22square%22%7D%2C%22reference_lines%22%3A%5B%5D%2C%22trend_lines%22%3A%5B%5D%2C%22swap_axes%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%2C%22groupBars%22%3Atrue%2C%22labelSize%22%3A%2210pt%22%2C%22showLegend%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Meal Wise DOD Preference Penetration"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.meal_type,derived_user_preference_rating.preference_meals_per&sorts=derived_user_preference_rating.preference_meals_per+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_user_preference_rating.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_user_preference_rating.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_user_preference_rating.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"

      label: "Meal Level Preference Penetration"
    }

    link: {
      url: "/explore/food_user_preference/derived_user_preference_rating?fields=derived_user_preference_rating.phone,derived_user_preference_rating.user_id,derived_user_preference_rating.name,derived_user_preference_rating.gender,derived_user_preference_rating.profession,derived_user_preference_rating.preference_meals_per,derived_user_preference_rating.preference_available_orders&f[derived_user_preference_rating.preference_meals_per]=%3C0.8&sorts=derived_user_preference_rating.preference_meals_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%22SMR%22%2C%22derived_user_preference_rating.total_orders%22%3A%22Total+Meals%22%2C%22derived_user_preference_rating.preference_meals_per%22%3A%22Meal+Preference+Penetration%22%2C%22derived_user_preference_rating.preference_available_orders%22%3A%22Preference+Available+Meals%22%7D%2C%22series_column_widths%22%3A%7B%22derived_user_preference_rating.preference_meals_per%22%3A133%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_user_preference_rating.rated_meals_per%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_user_preference_rating.preference_meals_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.8%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_user_preference_rating.residence]={{ value }}&f[derived_user_preference_rating.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&f[derived_user_preference_rating.cafe_availability]={{ _filters['new_dashboard_test.cafe_availability_flag'] | url_encode }}&f[derived_user_preference_rating.preference_available]={{ _filters['new_dashboard_test.preference_availability_flag'] | url_encode }}&f[derived_user_preference_rating.meal_type]={{ _filters['new_dashboard_test.meal_type'] | url_encode }}&toggle=dat,pik,vis"
      label: "Meal Preference Penetration Below Threshold Users"
    }

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

    # link: {
    #   url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.rated_orders_per,derived_vas_orders.orders&f[derived_vas_orders.rated_orders_per]=%3C0.013&sorts=derived_vas_orders.rated_orders_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.rated_orders_per%22%3A%22Rated+Orders%22%2C%22derived_vas_orders.orders%22%3A%22Total+Orders%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.rated_orders_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.013%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis"
    #   label: "Rated Orders Below Threshold Users"
    # }
  }

  measure: rated_orders_per1 {
    type: number
    sql: ${rated_orders1}/${total_orders1} ;;
    value_format: "0.0%"

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.date_date,derived_vas_orders.rated_orders_per&fill_fields=derived_vas_orders.date_date&sorts=derived_vas_orders.date_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22x_axis_label%22%3A%22Date%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.rated_orders_per%22%3A%22Rated+Orders%22%7D%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_vas_orders.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_vas_orders.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_vas_orders.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "DOD Rated Orders"
    }

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.user_id,derived_vas_orders.name,derived_vas_orders.email,derived_vas_orders.gender,derived_vas_orders.profession,derived_vas_orders.rated_orders_per,derived_vas_orders.orders&f[derived_vas_orders.rated_orders_per]=%3C0.013&sorts=derived_vas_orders.rated_orders_per+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.orders%22%3A%22Total+Orders%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.rated_orders_per%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.013%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_vas_orders.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_vas_orders.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_vas_orders.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Rated Orders Below Threshold Users"
    }

    }

  measure: aov1 {
    type: number
    sql: ${total_amount1}/${total_orders1} ;;
    value_format: "00"

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.date_date,derived_vas_orders.aov&fill_fields=derived_vas_orders.date_date&sorts=derived_vas_orders.date_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22x_axis_label%22%3A%22Date%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%7D%2C%22type%22%3A%22looker_line%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[derived_vas_orders.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_vas_orders.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_vas_orders.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "DOD AOV"
    }

    link: {
      url: "/explore/vas_orders/derived_vas_orders?fields=derived_vas_orders.phone,derived_vas_orders.user_id,derived_vas_orders.name,derived_vas_orders.email,derived_vas_orders.gender,derived_vas_orders.profession,derived_vas_orders.aov,derived_vas_orders.orders&f[derived_vas_orders.aov]=%3C63&sorts=derived_vas_orders.aov+desc&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22derived_vas_orders.aov%22%3A%22AOV%22%2C%22derived_vas_orders.orders%22%3A%22Total+Orders%22%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_vas_orders.aov%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22derived_vas_orders.aov%22%3A%5B%7B%22type%22%3A%22%5Cu003c%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2263%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded&f[derived_vas_orders.city]={{ _filters['new_dashboard_test.city'] | url_encode }}&f[derived_vas_orders.micromarket]={{ _filters['new_dashboard_test.micromarket'] | url_encode }}&f[derived_vas_orders.residence]={{  _filters['new_dashboard_test.residence'] | url_encode  }}&f[derived_vas_orders.date_date]={{ _filters['new_dashboard_test.date'] | url_encode }}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "AOV Below Threshold Users"
    }

  }
}
