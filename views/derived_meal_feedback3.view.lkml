view: daily_cx_metrics {
  # sql_table_name: looker_demo.derived_meal_feedback ;;
  derived_table: {
    sql:
    select zone, city, kitchen, micromarket, residence, meal, menu, meals_ordered, meals_dispatched, meals_received,
    meal_start_time, meal_receive_time, sum(case when home_region = 'North' then 1 else 0 end) as north_residents,
    sum(case when home_region = 'East' then 1 else 0 end) as east_residents, sum(case when home_region = 'West' then 1 else 0 end) as west_residents,
    sum(case when home_region = 'Rajasthani' then 1 else 0 end) as rajasthani_residents, sum(case when home_region = 'Andhra' then 1 else 0 end) as andhra_residents,
    sum(case when home_region = 'Other' then 1 else 0 end) as other_residents, sum(case when home_region = 'Gujarati' then 1 else 0 end) as gujarati_residents,
    sum(case when home_region = 'South' then 1 else 0 end) as south_residents, sum(case when home_region = 'Central' then 1 else 0 end) as central_residents,
    sum(sp)/sum(cnt_rating) as avg_rating,
    (sum(case when avg_rating >= 4 and avg_rating <= 5 then 1 else 0 end) - sum(case when avg_rating >= 1 and avg_rating < 3 then 1 else 0 end))/sum(case when avg_rating >= 0 and avg_rating <= 5 then 1 else 0 end) as FPS
    from
    (select zone, city, vendor_name as kitchen, micromarket, residence, meal, item_list as menu, home_region,
    meals_ordered, meals_dispatched, meals_received,
    meal_start_time, meal_receive_time, user_id, avg(case when rating is null then rating else null end) as avg_rating,
    count(case when rating is null then rating else null end) as cnt_rating,
    avg(case when rating is null then rating else null end) * count(case when rating is null then rating else null end) as sp
from looker_demo.derived_meal_feedback
where {% condition menu_date %} menu_date {% endcondition %}
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14) x
group by 1,2,3,4,5,6,7,8,9,10,11,12;;
  }

  # dimension: id {
  #   primary_key: yes
  #   type: number
  #   sql: ${TABLE}.id ;;
  # }

  set: city_level {
    fields: [city,nps_last_month]
  }

  filter: menu_date {
    type: date
    convert_tz: no

  }

  parameter: meal {
    type: "string"
    allowed_value: {
      label: "BREAKFAST"
      value: "BREAKFAST"
    }
    allowed_value: {
      label: "LUNCH"
      value: "LUNCH"
    }
    allowed_value: {
      label: "DINNER"
      value: "DINNER"
    }
    allowed_value: {
      label: "EVENING_SNACKS"
      value: "EVENING_SNACKS"
    }
    allowed_value: {
      label: "LUNCH_TIFFIN"
      value: "LUNCH_TIFFIN"
    }

  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    primary_key: yes
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
    link: {
      label: "Residence Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.micromarket,all_level.residence,all_level.residence_nps_mtd,all_level.residence_nps_last_month,all_level.residence_nps_L7D,all_level.residence_nps_L14D,all_level.residence_nps_specified_period,all_level.micromarket_agg_specified_period_nps&sorts=all_level.residence_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.micromarket_nps_mtd%22%2C%22id%22%3A%22all_level.micromarket_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.micromarket_nps_last_month%22%2C%22id%22%3A%22all_level.micromarket_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.micromarket_nps_L7D%22%2C%22id%22%3A%22all_level.micromarket_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.micromarket_nps_L14D%22%2C%22id%22%3A%22all_level.micromarket_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.micromarket_nps_specified_period%22%2C%22id%22%3A%22all_level.micromarket_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.micromarket_nps_mtd%22%3A%22MTD%22%2C%22all_level.micromarket_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.micromarket_nps_L7D%22%3A%22L7D%22%2C%22all_level.micromarket_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.micromarket_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.residence_nps_mtd%22%3A%22MTD%22%2C%22all_level.residence_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.residence_nps_L7D%22%3A%22L7D%22%2C%22all_level.residence_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.residence_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.micromarket_agg_specified_period_nps%22%3A%22micromarket+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.micromarket_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.micromarket]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
  }

  dimension: kitchen {
    type: string
    sql: ${TABLE}.kitchen ;;
    link: {
      label: "Micromarket Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.kitchen,all_level.micromarket,all_level.micromarket_nps_mtd,all_level.micromarket_nps_last_month,all_level.micromarket_nps_L7D,all_level.micromarket_nps_L14D,all_level.micromarket_nps_specified_period,all_level.kitchen_agg_specified_period_nps&sorts=all_level.micromarket_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.kitchen_nps_mtd%22%2C%22id%22%3A%22all_level.kitchen_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_last_month%22%2C%22id%22%3A%22all_level.kitchen_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_L7D%22%2C%22id%22%3A%22all_level.kitchen_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_L14D%22%2C%22id%22%3A%22all_level.kitchen_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_specified_period%22%2C%22id%22%3A%22all_level.kitchen_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.kitchen_nps_mtd%22%3A%22MTD%22%2C%22all_level.kitchen_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.kitchen_nps_L7D%22%3A%22L7D%22%2C%22all_level.kitchen_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.kitchen_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.micromarket_nps_mtd%22%3A%22MTD%22%2C%22all_level.micromarket_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.micromarket_nps_L7D%22%3A%22L7D%22%2C%22all_level.micromarket_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.micromarket_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.kitchen_agg_specified_period_nps%22%3A%22kitchen+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.kitchen_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.kitchen]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Residence Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.kitchen,all_level.residence,all_level.residence_nps_mtd,all_level.residence_nps_last_month,all_level.residence_nps_L7D,all_level.residence_nps_L14D,all_level.residence_nps_specified_period,all_level.kitchen_agg_specified_period_nps&sorts=all_level.residence_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.kitchen_nps_mtd%22%2C%22id%22%3A%22all_level.kitchen_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_last_month%22%2C%22id%22%3A%22all_level.kitchen_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_L7D%22%2C%22id%22%3A%22all_level.kitchen_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_L14D%22%2C%22id%22%3A%22all_level.kitchen_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.kitchen_nps_specified_period%22%2C%22id%22%3A%22all_level.kitchen_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.kitchen_nps_mtd%22%3A%22MTD%22%2C%22all_level.kitchen_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.kitchen_nps_L7D%22%3A%22L7D%22%2C%22all_level.kitchen_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.kitchen_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.residence_nps_mtd%22%3A%22MTD%22%2C%22all_level.residence_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.residence_nps_L7D%22%3A%22L7D%22%2C%22all_level.residence_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.residence_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.kitchen_agg_specified_period_nps%22%3A%22kitchen+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.kitchen_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.kitchen]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    link: {
      label: "Kitchen Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.city,all_level.kitchen,all_level.kitchen_nps_mtd,all_level.kitchen_nps_last_month,all_level.kitchen_nps_L7D,all_level.kitchen_nps_L14D,all_level.kitchen_nps_specified_period,all_level.city_agg_specified_period_nps&sorts=all_level.kitchen_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.city_nps_mtd%22%2C%22id%22%3A%22all_level.city_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_last_month%22%2C%22id%22%3A%22all_level.city_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L7D%22%2C%22id%22%3A%22all_level.city_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L14D%22%2C%22id%22%3A%22all_level.city_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_specified_period%22%2C%22id%22%3A%22all_level.city_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.city_nps_mtd%22%3A%22MTD%22%2C%22all_level.city_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.city_nps_L7D%22%3A%22L7D%22%2C%22all_level.city_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.city_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.kitchen_nps_mtd%22%3A%22MTD%22%2C%22all_level.kitchen_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.kitchen_nps_L7D%22%3A%22L7D%22%2C%22all_level.kitchen_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.kitchen_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.city_agg_specified_period_nps%22%3A%22city+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.city_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.city]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Micromarket Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.city,all_level.micromarket,all_level.micromarket_nps_mtd,all_level.micromarket_nps_last_month,all_level.micromarket_nps_L7D,all_level.micromarket_nps_L14D,all_level.micromarket_nps_specified_period,all_level.city_agg_specified_period_nps&sorts=all_level.micromarket_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.city_nps_mtd%22%2C%22id%22%3A%22all_level.city_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_last_month%22%2C%22id%22%3A%22all_level.city_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L7D%22%2C%22id%22%3A%22all_level.city_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L14D%22%2C%22id%22%3A%22all_level.city_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_specified_period%22%2C%22id%22%3A%22all_level.city_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.city_nps_mtd%22%3A%22MTD%22%2C%22all_level.city_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.city_nps_L7D%22%3A%22L7D%22%2C%22all_level.city_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.city_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.micromarket_nps_mtd%22%3A%22MTD%22%2C%22all_level.micromarket_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.micromarket_nps_L7D%22%3A%22L7D%22%2C%22all_level.micromarket_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.micromarket_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.city_agg_specified_period_nps%22%3A%22city+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.city_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.city]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Residence Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.city,all_level.residence,all_level.residence_nps_mtd,all_level.residence_nps_last_month,all_level.residence_nps_L7D,all_level.residence_nps_L14D,all_level.residence_nps_specified_period,all_level.city_agg_specified_period_nps&sorts=all_level.residence_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.city_nps_mtd%22%2C%22id%22%3A%22all_level.city_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_last_month%22%2C%22id%22%3A%22all_level.city_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L7D%22%2C%22id%22%3A%22all_level.city_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_L14D%22%2C%22id%22%3A%22all_level.city_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.city_nps_specified_period%22%2C%22id%22%3A%22all_level.city_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.city_nps_mtd%22%3A%22MTD%22%2C%22all_level.city_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.city_nps_L7D%22%3A%22L7D%22%2C%22all_level.city_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.city_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.residence_nps_mtd%22%3A%22MTD%22%2C%22all_level.residence_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.residence_nps_L7D%22%3A%22L7D%22%2C%22all_level.residence_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.residence_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.city_agg_specified_period_nps%22%3A%22city+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.city_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.city]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
    link: {
      label: "City Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.zone,all_level.city,all_level.city_nps_mtd,all_level.city_nps_last_month,all_level.city_nps_L7D,all_level.city_nps_L14D,all_level.city_nps_specified_period,all_level.zone_agg_specified_period_nps&sorts=all_level.city_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.zone_nps_mtd%22%2C%22id%22%3A%22all_level.zone_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_last_month%22%2C%22id%22%3A%22all_level.zone_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L7D%22%2C%22id%22%3A%22all_level.zone_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L14D%22%2C%22id%22%3A%22all_level.zone_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_specified_period%22%2C%22id%22%3A%22all_level.zone_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.zone_nps_mtd%22%3A%22MTD%22%2C%22all_level.zone_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.zone_nps_L7D%22%3A%22L7D%22%2C%22all_level.zone_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.zone_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.city_nps_mtd%22%3A%22MTD%22%2C%22all_level.city_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.city_nps_L7D%22%3A%22L7D%22%2C%22all_level.city_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.city_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.zone_agg_specified_period_nps%22%3A%22Zone+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.zone_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.zone]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Kitchen Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.zone,all_level.kitchen,all_level.kitchen_nps_mtd,all_level.kitchen_nps_last_month,all_level.kitchen_nps_L7D,all_level.kitchen_nps_L14D,all_level.kitchen_nps_specified_period,all_level.zone_agg_specified_period_nps&sorts=all_level.kitchen_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.zone_nps_mtd%22%2C%22id%22%3A%22all_level.zone_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_last_month%22%2C%22id%22%3A%22all_level.zone_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L7D%22%2C%22id%22%3A%22all_level.zone_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L14D%22%2C%22id%22%3A%22all_level.zone_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_specified_period%22%2C%22id%22%3A%22all_level.zone_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.zone_nps_mtd%22%3A%22MTD%22%2C%22all_level.zone_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.zone_nps_L7D%22%3A%22L7D%22%2C%22all_level.zone_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.zone_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.kitchen_nps_mtd%22%3A%22MTD%22%2C%22all_level.kitchen_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.kitchen_nps_L7D%22%3A%22L7D%22%2C%22all_level.kitchen_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.kitchen_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.zone_agg_specified_period_nps%22%3A%22Zone+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.zone_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.zone]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Micromarket Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.zone,all_level.micromarket,all_level.micromarket_nps_mtd,all_level.micromarket_nps_last_month,all_level.micromarket_nps_L7D,all_level.micromarket_nps_L14D,all_level.micromarket_nps_specified_period,all_level.zone_agg_specified_period_nps&sorts=all_level.micromarket_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.zone_nps_mtd%22%2C%22id%22%3A%22all_level.zone_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_last_month%22%2C%22id%22%3A%22all_level.zone_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L7D%22%2C%22id%22%3A%22all_level.zone_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L14D%22%2C%22id%22%3A%22all_level.zone_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_specified_period%22%2C%22id%22%3A%22all_level.zone_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.zone_nps_mtd%22%3A%22MTD%22%2C%22all_level.zone_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.zone_nps_L7D%22%3A%22L7D%22%2C%22all_level.zone_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.zone_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.micromarket_nps_mtd%22%3A%22MTD%22%2C%22all_level.micromarket_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.micromarket_nps_L7D%22%3A%22L7D%22%2C%22all_level.micromarket_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.micromarket_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.zone_agg_specified_period_nps%22%3A%22Zone+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.zone_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.zone]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Residence Wise View"
      url: "/explore/cx_data/all_level?fields=all_level.zone,all_level.residence,all_level.residence_nps_mtd,all_level.residence_nps_last_month,all_level.residence_nps_L7D,all_level.residence_nps_L14D,all_level.residence_nps_specified_period,all_level.zone_agg_specified_period_nps&sorts=all_level.residence_nps_mtd+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22all_level.zone_nps_mtd%22%2C%22id%22%3A%22all_level.zone_nps_mtd%22%2C%22name%22%3A%22MTD%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_last_month%22%2C%22id%22%3A%22all_level.zone_nps_last_month%22%2C%22name%22%3A%22Last+Month%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L7D%22%2C%22id%22%3A%22all_level.zone_nps_L7D%22%2C%22name%22%3A%22L7D%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_L14D%22%2C%22id%22%3A%22all_level.zone_nps_L14D%22%2C%22name%22%3A%22L8-L14%22%7D%2C%7B%22axisId%22%3A%22all_level.zone_nps_specified_period%22%2C%22id%22%3A%22all_level.zone_nps_specified_period%22%2C%22name%22%3A%22Filtered+Period%22%7D%5D%2C%22showLabels%22%3Afalse%2C%22showValues%22%3Afalse%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22all_level.zone_nps_mtd%22%3A%22MTD%22%2C%22all_level.zone_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.zone_nps_L7D%22%3A%22L7D%22%2C%22all_level.zone_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.zone_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.residence_nps_mtd%22%3A%22MTD%22%2C%22all_level.residence_nps_last_month%22%3A%22Last+Month%22%2C%22all_level.residence_nps_L7D%22%3A%22L7D%22%2C%22all_level.residence_nps_L14D%22%3A%22L8-L14%22%2C%22all_level.residence_nps_specified_period%22%3A%22Filtered+Period%22%2C%22all_level.zone_agg_specified_period_nps%22%3A%22Zone+FPS+FIltered+Period%22%7D%2C%22column_spacing_ratio%22%3A0.2%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22all_level.zone_promoters_MTD%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded&f[all_level.zone]={{ value }}&f[all_level.menu_date]={{ _filters['all_level.menu_date'] | url_encode }}&toggle=dat,pik,vis"
    }
    # drill_fields: [city]
    # html: <a href="/explore/cx_data/all_level?fields=all_level.city,all_level.nps_last_month&sorts=all_level.nps_last_month+desc&limit=500"> </a> ;;z
    # link: {
    #   label: "City Level Performance"
    #   url: "
    # {% assign table_calc = '[
    # { \"table_calculation\": \"percent_of_total\",
    # \"label\": \"Percent of Total\",
    # \"expression\": \"${all_level.nps_last_month:row_total} / sum(${all_level.nps_last_month:row_total})\",
    # \"value_format\": null,
    # \"value_format_name\": \"percent_2\",
    # \"_kind_hint\": \"supermeasure\",
    # \"_type_hint\": \"number\"
    # }]' %}
    # {% assign vis_config = '{
    # \"type\": \"table\",
    # \"show_view_names\": false,
    # \"show_row_numbers\": false,
    # \"truncate_column_names\": false,
    # \"table_theme\": \"gray\",
    # \"enable_conditional_formatting\": true,
    # \"conditional_formatting\": [
    # {
    # \"type\": \"low to high\",
    # \"value\": null,
    # \"background_color\": null,
    # \"font_color\": null,
    # \"palette\": {
    # \"name\": \"Custom\",
    # \"colors\": [
    # \"#FFFFFF\",
    # \"#6e00ff\"
    # ]},
    # \"bold\": false,
    # \"italic\": false,
    # \"strikethrough\": false,
    # \"fields\": [
    # \"growth_rate\"
    # ]},{
    # \"type\": \"low to high\",
    # \"value\": null,
    # \"background_color\": null,
    # \"font_color\": null,
    # \"palette\": {
    # \"name\": \"Custom\",
    # \"colors\": [
    # \"#FFFFFF\",
    # \"#88ff78\"
    # ]},
    # \"bold\": false,
    # \"italic\": false,
    # \"strikethrough\": false,
    # \"fields\": [
    # \"percent_of_total\"
    # ]}]}' %}
    # {{link}}&total=on&row_total=right&dynamic_fields={{ table_calc | replace: ' ', '' | encode_uri }}&vis_config={{ vis_config | replace: ' ', '' | encode_uri }}"
    # }
  }

  # dimension: residence_id {
  #   type: string
  #   sql: ${TABLE}.residence_id ;;
  # }

  dimension: avg_specified_period {
    type: number
    sql: ${TABLE}.avg_specified_period  ;;
  }

  dimension: yesterday {
    type: number
    sql: ${TABLE}.yesterday  ;;
  }

  dimension: last_month {
    type: number
    sql: ${TABLE}.last_month  ;;
  }

  dimension: MTD {
    type: number
    sql: ${TABLE}.MTD  ;;
  }

  dimension: L7D {
    type: number
    sql: ${TABLE}.L7D  ;;
  }

  dimension: L14D {
    type: number
    sql: ${TABLE}.L14D  ;;
  }



  #zone_dimensions


  dimension: zone_avg_specified_period {
    type: number
    sql: ${TABLE}.zone_avg_specified_period  ;;
  }

  dimension: zone_yesterday {
    type: number
    sql: ${TABLE}.zone_yesterday  ;;
  }

  dimension: zone_last_month {
    type: number
    sql: ${TABLE}.zone_last_month  ;;
  }

  dimension: zone_MTD {
    type: number
    sql: ${TABLE}.zone_MTD  ;;
  }

  dimension: zone_L7D {
    type: number
    sql: ${TABLE}.zone_L7D  ;;
  }

  dimension: zone_L14D {
    type: number
    sql: ${TABLE}.zone_L14D  ;;
  }





#city_dimensions


  dimension: city_avg_specified_period {
    type: number
    sql: ${TABLE}.city_avg_specified_period  ;;
  }

  dimension: city_yesterday {
    type: number
    sql: ${TABLE}.city_yesterday  ;;
  }

  dimension: city_last_month {
    type: number
    sql: ${TABLE}.city_last_month  ;;
  }

  dimension: city_MTD {
    type: number
    sql: ${TABLE}.city_MTD  ;;
  }

  dimension: city_L7D {
    type: number
    sql: ${TABLE}.city_L7D  ;;
  }

  dimension: city_L14D {
    type: number
    sql: ${TABLE}.city_L14D  ;;
  }










#kitchen_dimensions


  dimension: kitchen_avg_specified_period {
    type: number
    sql: ${TABLE}.kitchen_avg_specified_period  ;;
  }

  dimension: kitchen_yesterday {
    type: number
    sql: ${TABLE}.kitchen_yesterday  ;;
  }

  dimension: kitchen_last_month {
    type: number
    sql: ${TABLE}.kitchen_last_month  ;;
  }

  dimension: kitchen_MTD {
    type: number
    sql: ${TABLE}.kitchen_MTD  ;;
  }

  dimension: kitchen_L7D {
    type: number
    sql: ${TABLE}.kitchen_L7D  ;;
  }

  dimension: kitchen_L14D {
    type: number
    sql: ${TABLE}.kitchen_L14D  ;;
  }









#micromarket_dimensions


  dimension: micromarket_avg_specified_period {
    type: number
    sql: ${TABLE}.micromarket_avg_specified_period  ;;
  }

  dimension: micromarket_yesterday {
    type: number
    sql: ${TABLE}.micromarket_yesterday  ;;
  }

  dimension: micromarket_last_month {
    type: number
    sql: ${TABLE}.micromarket_last_month  ;;
  }

  dimension: micromarket_MTD {
    type: number
    sql: ${TABLE}.micromarket_MTD  ;;
  }

  dimension: micromarket_L7D {
    type: number
    sql: ${TABLE}.micromarket_L7D  ;;
  }

  dimension: micromarket_L14D {
    type: number
    sql: ${TABLE}.micromarket_L14D  ;;
  }







#residence_dimensions


  dimension: residence_avg_specified_period {
    type: number
    sql: ${TABLE}.residence_avg_specified_period  ;;
  }

  dimension: residence_yesterday {
    type: number
    sql: ${TABLE}.residence_yesterday  ;;
  }

  dimension: residence_last_month {
    type: number
    sql: ${TABLE}.residence_last_month  ;;
  }

  dimension: residence_MTD {
    type: number
    sql: ${TABLE}.residence_MTD  ;;
  }

  dimension: residence_L7D {
    type: number
    sql: ${TABLE}.residence_L7D  ;;
  }

  dimension: residence_L14D {
    type: number
    sql: ${TABLE}.residence_L14D  ;;
  }








  # aggregated_measures

  measure: zone_agg_specified_period_nps {
    type: max
    sql: ${TABLE}.zone_agg_specified_period_nps ;;
    value_format: "0%"
  }

  measure: city_agg_specified_period_nps {
    type: max
    sql: ${TABLE}.city_agg_specified_period_nps ;;
    value_format: "0%"
  }

  measure: kitchen_agg_specified_period_nps {
    type: max
    sql: ${TABLE}.kitchen_agg_specified_period_nps ;;
    value_format: "0%"
  }

  measure: micromarket_agg_specified_period_nps {
    type: max
    sql: ${TABLE}.micromarket_agg_specified_period_nps ;;
    value_format: "0%"
  }





  #   dimension: scanned_meal {
  #     type: string
  #     sql: ${TABLE}.scanned_meal ;;
  #   }

  #   dimension: vendor_name {
  #     type: string
  #     sql: ${TABLE}.vendor_name ;;
  #   }

  #   measure: count {
  #     type: count
  #   }

  #   measure: feedback_users {
  #     type: count_distinct
  #     sql: ${user_id} ;;
  #     filters: [rating: ">=0",rating: "<=5"]
  #   }

  # measure: rating_sum {
  #   type: sum
  #   sql: ${rating} ;;
  #   filters: [rating: ">=0",rating: "<=5"]

  # }

  # measure: total_ratings {
  #   type: count_distinct
  #   sql: ${id} ;;
  #   filters: [rating: ">=0",rating: "<=5"]

  # }

  measure: promoters_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 4 and ${avg_specified_period} <= 5 then 1 else 0 end;;
  }

  measure: detractors_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 1 and ${avg_specified_period} < 3 then 1 else 0 end;;
  }

  measure: feedback_users_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 0 and ${avg_specified_period} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_yesterday {
    type: sum
    sql: case when ${yesterday} >= 4 and ${yesterday} <= 5 then 1 else 0 end;;
  }

  measure: detractors_yesterday {
    type: sum
    sql: case when ${yesterday} >= 1 and ${yesterday} < 3 then 1 else 0 end;;
  }

  measure: feedback_yesterday {
    type: sum
    sql: case when ${yesterday} >= 0 and ${yesterday} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_last_month {
    type: sum
    sql: case when ${last_month} >= 4 and ${last_month} <= 5 then 1 else 0 end;;
  }

  measure: detractors_last_month {
    type: sum
    sql: case when ${last_month} >= 1 and ${last_month} < 3 then 1 else 0 end;;
  }

  measure: feedback_last_month {
    type: sum
    sql: case when ${last_month} >= 0 and ${last_month} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }


  measure: promoters_MTD {
    type: sum
    sql: case when ${MTD} >= 4 and ${MTD} <= 5 then 1 else 0 end;;
  }

  measure: detractors_MTD {
    type: sum
    sql: case when ${MTD} >= 1 and ${MTD} < 3 then 1 else 0 end;;
  }

  measure: feedback_MTD {
    type: sum
    sql: case when ${MTD} >= 0 and ${MTD} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_L7D {
    type: sum
    sql: case when ${L7D} >= 4 and ${L7D} <= 5 then 1 else 0 end;;
  }

  measure: detractors_L7D {
    type: sum
    sql: case when ${L7D} >= 1 and ${L7D} < 3 then 1 else 0 end;;
  }

  measure: feedback_L7D {
    type: sum
    sql: case when ${L7D} >= 0 and ${L7D} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_L14D {
    type: sum
    sql: case when ${L14D} >= 4 and ${L14D} <= 5 then 1 else 0 end;;
  }

  measure: detractors_L14D {
    type: sum
    sql: case when ${L14D} >= 1 and ${L14D} < 3 then 1 else 0 end;;
  }

  measure: feedback_L14D {
    type: sum
    sql: case when ${L14D} >= 0 and ${L14D} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: nps_specified_period {
    type: number
    sql: (${promoters_specified_period} -  ${detractors_specified_period})/${feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: nps_yesterday {
    type: number
    sql: (${promoters_yesterday} -  ${detractors_yesterday})/${feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: nps_last_month {
    type: number
    sql: (${promoters_last_month} -  ${detractors_last_month})/${feedback_last_month} ;;
    value_format: "0%"
  }

  measure: nps_mtd {
    type: number
    sql: (${promoters_MTD} -  ${detractors_MTD})/${feedback_MTD} ;;
    value_format: "0%"
  }

  measure: nps_L7D {
    type: number
    sql: (${promoters_L7D} -  ${detractors_L7D})/${feedback_L7D} ;;
    value_format: "0%"
  }

  measure: nps_L14D {
    type: number
    sql: (${promoters_L14D} -  ${detractors_L14D})/${feedback_L14D} ;;
    value_format: "0%"
  }








# zone_metrics



  measure: zone_promoters_specified_period {
    type: count_distinct
    sql: case when ${zone_avg_specified_period} >= 4 and ${zone_avg_specified_period} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_specified_period {
    type: count_distinct
    sql: case when ${zone_avg_specified_period} >= 1 and ${zone_avg_specified_period} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_users_specified_period {
    type: count_distinct
    sql: case when ${zone_avg_specified_period} >= 0 and ${zone_avg_specified_period} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: zone_promoters_yesterday {
    type: count_distinct
    sql: case when ${zone_yesterday} >= 4 and ${zone_yesterday} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_yesterday {
    type: count_distinct
    sql: case when ${zone_yesterday} >= 1 and ${zone_yesterday} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_yesterday {
    type: count_distinct
    sql: case when ${zone_yesterday} >= 0 and ${zone_yesterday} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: zone_promoters_last_month {
    type: count_distinct
    sql: case when ${zone_last_month} >= 4 and ${zone_last_month} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_last_month {
    type: count_distinct
    sql: case when ${zone_last_month} >= 1 and ${zone_last_month} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_last_month {
    type: count_distinct
    sql: case when ${zone_last_month} >= 0 and ${zone_last_month} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }


  measure: zone_promoters_MTD {
    type: count_distinct
    sql: case when ${zone_MTD} >= 4 and ${zone_MTD} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_MTD {
    type: count_distinct
    sql: case when ${zone_MTD} >= 1 and ${zone_MTD} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_MTD {
    type: count_distinct
    sql: case when ${zone_MTD} >= 0 and ${zone_MTD} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: zone_promoters_L7D {
    type: count_distinct
    sql: case when ${zone_L7D} >= 4 and ${zone_L7D} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_L7D {
    type: count_distinct
    sql: case when ${zone_L7D} >= 1 and ${zone_L7D} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_L7D {
    type: count_distinct
    sql: case when ${zone_L7D} >= 0 and ${zone_L7D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: zone_promoters_L14D {
    type: count_distinct
    sql: case when ${zone_L14D} >= 4 and ${zone_L14D} <= 5 then ${user_id} end;;
  }

  measure: zone_detractors_L14D {
    type: count_distinct
    sql: case when ${zone_L14D} >= 1 and ${zone_L14D} < 3 then ${user_id} end;;
  }

  measure: zone_feedback_L14D {
    type: count_distinct
    sql: case when ${zone_L14D} >= 0 and ${zone_L14D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: zone_nps_specified_period {
    type: number
    sql: (${zone_promoters_specified_period} -  ${zone_detractors_specified_period})/${zone_feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: zone_nps_yesterday {
    type: number
    sql: (${zone_promoters_yesterday} -  ${zone_detractors_yesterday})/${zone_feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: zone_nps_last_month {
    type: number
    sql: (${zone_promoters_last_month} -  ${zone_detractors_last_month})/${zone_feedback_last_month} ;;
    value_format: "0%"
  }

  measure: zone_nps_mtd {
    type: number
    sql: (${zone_promoters_MTD} -  ${zone_detractors_MTD})/${zone_feedback_MTD} ;;
    value_format: "0%"
  }

  measure: zone_nps_L7D {
    type: number
    sql: (${zone_promoters_L7D} -  ${zone_detractors_L7D})/${zone_feedback_L7D} ;;
    value_format: "0%"
  }

  measure: zone_nps_L14D {
    type: number
    sql: (${zone_promoters_L14D} -  ${zone_detractors_L14D})/${zone_feedback_L14D} ;;
    value_format: "0%"
  }




# city_level



  measure: city_promoters_specified_period {
    type: count_distinct
    sql: case when ${city_avg_specified_period} >= 4 and ${city_avg_specified_period} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_specified_period {
    type: count_distinct
    sql: case when ${city_avg_specified_period} >= 1 and ${city_avg_specified_period} < 3 then ${user_id} end;;
  }

  measure: city_feedback_users_specified_period {
    type: count_distinct
    sql: case when ${city_avg_specified_period} >= 0 and ${city_avg_specified_period} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: city_promoters_yesterday {
    type: count_distinct
    sql: case when ${city_yesterday} >= 4 and ${city_yesterday} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_yesterday {
    type: count_distinct
    sql: case when ${city_yesterday} >= 1 and ${city_yesterday} < 3 then ${user_id} end;;
  }

  measure: city_feedback_yesterday {
    type: count_distinct
    sql: case when ${city_yesterday} >= 0 and ${city_yesterday} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: city_promoters_last_month {
    type: count_distinct
    sql: case when ${city_last_month} >= 4 and ${city_last_month} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_last_month {
    type: count_distinct
    sql: case when ${city_last_month} >= 1 and ${city_last_month} < 3 then ${user_id} end;;
  }

  measure: city_feedback_last_month {
    type: count_distinct
    sql: case when ${city_last_month} >= 0 and ${city_last_month} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }


  measure: city_promoters_MTD {
    type: count_distinct
    sql: case when ${city_MTD} >= 4 and ${city_MTD} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_MTD {
    type: count_distinct
    sql: case when ${city_MTD} >= 1 and ${city_MTD} < 3 then ${user_id} end;;
  }

  measure: city_feedback_MTD {
    type: count_distinct
    sql: case when ${city_MTD} >= 0 and ${city_MTD} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: city_promoters_L7D {
    type: count_distinct
    sql: case when ${city_L7D} >= 4 and ${city_L7D} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_L7D {
    type: count_distinct
    sql: case when ${city_L7D} >= 1 and ${city_L7D} < 3 then ${user_id} end;;
  }

  measure: city_feedback_L7D {
    type: count_distinct
    sql: case when ${city_L7D} >= 0 and ${city_L7D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: city_promoters_L14D {
    type: count_distinct
    sql: case when ${city_L14D} >= 4 and ${city_L14D} <= 5 then ${user_id} end;;
  }

  measure: city_detractors_L14D {
    type: count_distinct
    sql: case when ${city_L14D} >= 1 and ${city_L14D} < 3 then ${user_id} end;;
  }

  measure: city_feedback_L14D {
    type: count_distinct
    sql: case when ${city_L14D} >= 0 and ${city_L14D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: city_nps_specified_period {
    type: number
    sql: (${city_promoters_specified_period} -  ${city_detractors_specified_period})/${city_feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: city_nps_yesterday {
    type: number
    sql: (${city_promoters_yesterday} -  ${city_detractors_yesterday})/${city_feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: city_nps_last_month {
    type: number
    sql: (${city_promoters_last_month} -  ${city_detractors_last_month})/${city_feedback_last_month} ;;
    value_format: "0%"
  }

  measure: city_nps_mtd {
    type: number
    sql: (${city_promoters_MTD} -  ${city_detractors_MTD})/${city_feedback_MTD} ;;
    value_format: "0%"
  }

  measure: city_nps_L7D {
    type: number
    sql: (${city_promoters_L7D} -  ${city_detractors_L7D})/${city_feedback_L7D} ;;
    value_format: "0%"
  }

  measure: city_nps_L14D {
    type: number
    sql: (${city_promoters_L14D} -  ${city_detractors_L14D})/${city_feedback_L14D} ;;
    value_format: "0%"
  }









# kitchen_level



  measure: kitchen_promoters_specified_period {
    type: count_distinct
    sql: case when ${kitchen_avg_specified_period} >= 4 and ${kitchen_avg_specified_period} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_specified_period {
    type: count_distinct
    sql: case when ${kitchen_avg_specified_period} >= 1 and ${kitchen_avg_specified_period} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_users_specified_period {
    type: count_distinct
    sql: case when ${kitchen_avg_specified_period} >= 0 and ${kitchen_avg_specified_period} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: kitchen_promoters_yesterday {
    type: count_distinct
    sql: case when ${kitchen_yesterday} >= 4 and ${kitchen_yesterday} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_yesterday {
    type: count_distinct
    sql: case when ${kitchen_yesterday} >= 1 and ${kitchen_yesterday} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_yesterday {
    type: count_distinct
    sql: case when ${kitchen_yesterday} >= 0 and ${kitchen_yesterday} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: kitchen_promoters_last_month {
    type: count_distinct
    sql: case when ${kitchen_last_month} >= 4 and ${kitchen_last_month} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_last_month {
    type: count_distinct
    sql: case when ${kitchen_last_month} >= 1 and ${kitchen_last_month} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_last_month {
    type: count_distinct
    sql: case when ${kitchen_last_month} >= 0 and ${kitchen_last_month} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }


  measure: kitchen_promoters_MTD {
    type: count_distinct
    sql: case when ${kitchen_MTD} >= 4 and ${kitchen_MTD} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_MTD {
    type: count_distinct
    sql: case when ${kitchen_MTD} >= 1 and ${kitchen_MTD} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_MTD {
    type: count_distinct
    sql: case when ${kitchen_MTD} >= 0 and ${kitchen_MTD} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: kitchen_promoters_L7D {
    type: count_distinct
    sql: case when ${kitchen_L7D} >= 4 and ${kitchen_L7D} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_L7D {
    type: count_distinct
    sql: case when ${kitchen_L7D} >= 1 and ${kitchen_L7D} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_L7D {
    type: count_distinct
    sql: case when ${kitchen_L7D} >= 0 and ${kitchen_L7D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: kitchen_promoters_L14D {
    type: count_distinct
    sql: case when ${kitchen_L14D} >= 4 and ${kitchen_L14D} <= 5 then ${user_id} end;;
  }

  measure: kitchen_detractors_L14D {
    type: count_distinct
    sql: case when ${kitchen_L14D} >= 1 and ${kitchen_L14D} < 3 then ${user_id} end;;
  }

  measure: kitchen_feedback_L14D {
    type: count_distinct
    sql: case when ${kitchen_L14D} >= 0 and ${kitchen_L14D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: kitchen_nps_specified_period {
    type: number
    sql: (${kitchen_promoters_specified_period} -  ${kitchen_detractors_specified_period})/${kitchen_feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: kitchen_nps_yesterday {
    type: number
    sql: (${kitchen_promoters_yesterday} -  ${kitchen_detractors_yesterday})/${kitchen_feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: kitchen_nps_last_month {
    type: number
    sql: (${kitchen_promoters_last_month} -  ${kitchen_detractors_last_month})/${kitchen_feedback_last_month} ;;
    value_format: "0%"
  }

  measure: kitchen_nps_mtd {
    type: number
    sql: (${kitchen_promoters_MTD} -  ${kitchen_detractors_MTD})/${kitchen_feedback_MTD} ;;
    value_format: "0%"
  }

  measure: kitchen_nps_L7D {
    type: number
    sql: (${kitchen_promoters_L7D} -  ${kitchen_detractors_L7D})/${kitchen_feedback_L7D} ;;
    value_format: "0%"
  }

  measure: kitchen_nps_L14D {
    type: number
    sql: (${kitchen_promoters_L14D} -  ${kitchen_detractors_L14D})/${kitchen_feedback_L14D} ;;
    value_format: "0%"
  }










# micromarket_level




  measure: micromarket_promoters_specified_period {
    type: count_distinct
    sql: case when ${micromarket_avg_specified_period} >= 4 and ${micromarket_avg_specified_period} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_specified_period {
    type: count_distinct
    sql: case when ${micromarket_avg_specified_period} >= 1 and ${micromarket_avg_specified_period} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_users_specified_period {
    type: count_distinct
    sql: case when ${micromarket_avg_specified_period} >= 0 and ${micromarket_avg_specified_period} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: micromarket_promoters_yesterday {
    type: count_distinct
    sql: case when ${micromarket_yesterday} >= 4 and ${micromarket_yesterday} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_yesterday {
    type: count_distinct
    sql: case when ${micromarket_yesterday} >= 1 and ${micromarket_yesterday} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_yesterday {
    type: count_distinct
    sql: case when ${micromarket_yesterday} >= 0 and ${micromarket_yesterday} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: micromarket_promoters_last_month {
    type: count_distinct
    sql: case when ${micromarket_last_month} >= 4 and ${micromarket_last_month} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_last_month {
    type: count_distinct
    sql: case when ${micromarket_last_month} >= 1 and ${micromarket_last_month} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_last_month {
    type: count_distinct
    sql: case when ${micromarket_last_month} >= 0 and ${micromarket_last_month} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }


  measure: micromarket_promoters_MTD {
    type: count_distinct
    sql: case when ${micromarket_MTD} >= 4 and ${micromarket_MTD} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_MTD {
    type: count_distinct
    sql: case when ${micromarket_MTD} >= 1 and ${micromarket_MTD} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_MTD {
    type: count_distinct
    sql: case when ${micromarket_MTD} >= 0 and ${micromarket_MTD} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: micromarket_promoters_L7D {
    type: count_distinct
    sql: case when ${micromarket_L7D} >= 4 and ${micromarket_L7D} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_L7D {
    type: count_distinct
    sql: case when ${micromarket_L7D} >= 1 and ${micromarket_L7D} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_L7D {
    type: count_distinct
    sql: case when ${micromarket_L7D} >= 0 and ${micromarket_L7D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: micromarket_promoters_L14D {
    type: count_distinct
    sql: case when ${micromarket_L14D} >= 4 and ${micromarket_L14D} <= 5 then ${user_id} end;;
  }

  measure: micromarket_detractors_L14D {
    type: count_distinct
    sql: case when ${micromarket_L14D} >= 1 and ${micromarket_L14D} < 3 then ${user_id} end;;
  }

  measure: micromarket_feedback_L14D {
    type: count_distinct
    sql: case when ${micromarket_L14D} >= 0 and ${micromarket_L14D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: micromarket_nps_specified_period {
    type: number
    sql: (${micromarket_promoters_specified_period} -  ${micromarket_detractors_specified_period})/${micromarket_feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: micromarket_nps_yesterday {
    type: number
    sql: (${micromarket_promoters_yesterday} -  ${micromarket_detractors_yesterday})/${micromarket_feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: micromarket_nps_last_month {
    type: number
    sql: (${micromarket_promoters_last_month} -  ${micromarket_detractors_last_month})/${micromarket_feedback_last_month} ;;
    value_format: "0%"
  }

  measure: micromarket_nps_mtd {
    type: number
    sql: (${micromarket_promoters_MTD} -  ${micromarket_detractors_MTD})/${micromarket_feedback_MTD} ;;
    value_format: "0%"
  }

  measure: micromarket_nps_L7D {
    type: number
    sql: (${micromarket_promoters_L7D} -  ${micromarket_detractors_L7D})/${micromarket_feedback_L7D} ;;
    value_format: "0%"
  }

  measure: micromarket_nps_L14D {
    type: number
    sql: (${micromarket_promoters_L14D} -  ${micromarket_detractors_L14D})/${micromarket_feedback_L14D} ;;
    value_format: "0%"
  }













# residence_level




  measure: residence_promoters_specified_period {
    type: count_distinct
    sql: case when ${residence_avg_specified_period} >= 4 and ${residence_avg_specified_period} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_specified_period {
    type: count_distinct
    sql: case when ${residence_avg_specified_period} >= 1 and ${residence_avg_specified_period} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_users_specified_period {
    type: count_distinct
    sql: case when ${residence_avg_specified_period} >= 0 and ${residence_avg_specified_period} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: residence_promoters_yesterday {
    type: count_distinct
    sql: case when ${residence_yesterday} >= 4 and ${residence_yesterday} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_yesterday {
    type: count_distinct
    sql: case when ${residence_yesterday} >= 1 and ${residence_yesterday} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_yesterday {
    type: count_distinct
    sql: case when ${residence_yesterday} >= 0 and ${residence_yesterday} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: residence_promoters_last_month {
    type: count_distinct
    sql: case when ${residence_last_month} >= 4 and ${residence_last_month} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_last_month {
    type: count_distinct
    sql: case when ${residence_last_month} >= 1 and ${residence_last_month} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_last_month {
    type: count_distinct
    sql: case when ${residence_last_month} >= 0 and ${residence_last_month} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }


  measure: residence_promoters_MTD {
    type: count_distinct
    sql: case when ${residence_MTD} >= 4 and ${residence_MTD} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_MTD {
    type: count_distinct
    sql: case when ${residence_MTD} >= 1 and ${residence_MTD} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_MTD {
    type: count_distinct
    sql: case when ${residence_MTD} >= 0 and ${residence_MTD} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: residence_promoters_L7D {
    type: count_distinct
    sql: case when ${residence_L7D} >= 4 and ${residence_L7D} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_L7D {
    type: count_distinct
    sql: case when ${residence_L7D} >= 1 and ${residence_L7D} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_L7D {
    type: count_distinct
    sql: case when ${residence_L7D} >= 0 and ${residence_L7D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: residence_promoters_L14D {
    type: count_distinct
    sql: case when ${residence_L14D} >= 4 and ${residence_L14D} <= 5 then ${user_id} end;;
  }

  measure: residence_detractors_L14D {
    type: count_distinct
    sql: case when ${residence_L14D} >= 1 and ${residence_L14D} < 3 then ${user_id} end;;
  }

  measure: residence_feedback_L14D {
    type: count_distinct
    sql: case when ${residence_L14D} >= 0 and ${residence_L14D} <= 5 then ${user_id} end;;
    value_format: "#,##0"
  }

  measure: residence_nps_specified_period {
    type: number
    sql: (${residence_promoters_specified_period} -  ${residence_detractors_specified_period})/${residence_feedback_users_specified_period} ;;
    value_format: "0%"
  }

  measure: residence_nps_yesterday {
    type: number
    sql: (${residence_promoters_yesterday} -  ${residence_detractors_yesterday})/${residence_feedback_yesterday} ;;
    value_format: "0%"
  }

  measure: residence_nps_last_month {
    type: number
    sql: (${residence_promoters_last_month} -  ${residence_detractors_last_month})/${residence_feedback_last_month} ;;
    value_format: "0%"
  }

  measure: residence_nps_mtd {
    type: number
    sql: (${residence_promoters_MTD} -  ${residence_detractors_MTD})/${residence_feedback_MTD} ;;
    value_format: "0%"
  }

  measure: residence_nps_L7D {
    type: number
    sql: (${residence_promoters_L7D} -  ${residence_detractors_L7D})/${residence_feedback_L7D} ;;
    value_format: "0%"
  }

  measure: residence_nps_L14D {
    type: number
    sql: (${residence_promoters_L14D} -  ${residence_detractors_L14D})/${residence_feedback_L14D} ;;
    value_format: "0%"
  }














}
