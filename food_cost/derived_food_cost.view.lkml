view: derived_food_cost {
  sql_table_name: stanza.derived_food_cost ;;

  dimension: actual_blended_order {
    type: number
    sql: ${TABLE}.actual_blended_order ;;
  }

  dimension: actual_nonsl_blended_order {
    type: number
    sql: ${TABLE}.actual_nonsl_blended_order ;;
  }

  dimension: actual_sl_blended_order {
    type: number
    sql: ${TABLE}.actual_sl_blended_order ;;
  }

  dimension: breakfast_cost {
    type: number
    sql: ${TABLE}.breakfast_cost ;;
  }

  dimension: breakfast_meal {
    type: number
    sql: ${TABLE}.breakfast_meal ;;
  }

  dimension: breakfast_nonsl_cost {
    type: number
    sql: ${TABLE}.breakfast_nonsl_cost ;;
  }

  dimension: breakfast_nonsl_orders {
    type: number
    sql: ${TABLE}.breakfast_nonsl_orders ;;
  }

  dimension: breakfast_nonsl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_nonsl_price_1 ;;
  }

  dimension: breakfast_orders {
    type: number
    sql: ${TABLE}.breakfast_orders ;;
  }

  dimension: breakfast_price {
    type: number
    sql: ${TABLE}.breakfast_price ;;
  }

  dimension: breakfast_price_1 {
    type: number
    sql: ${TABLE}.breakfast_price_1 ;;
  }

  dimension: breakfast_rate {
    type: number
    sql: ${TABLE}.breakfast_rate ;;
  }

  dimension: breakfast_sl_orders {
    type: number
    sql: ${TABLE}.breakfast_sl_orders ;;
  }

  dimension: breakfast_sl_price_1 {
    type: number
    sql: ${TABLE}.breakfast_sl_price_1 ;;
  }

  dimension: budget_blended_order {
    type: number
    sql: ${TABLE}.budget_blended_order ;;
  }

  dimension: budget_cost {
    type: number
    sql: ${TABLE}.budget_cost ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: dinner_cost {
    type: number
    sql: ${TABLE}.dinner_cost ;;
  }

  dimension: dinner_meal {
    type: number
    sql: ${TABLE}.dinner_meal ;;
  }

  dimension: dinner_nonsl_cost {
    type: number
    sql: ${TABLE}.dinner_nonsl_cost ;;
  }

  dimension: dinner_nonsl_orders {
    type: number
    sql: ${TABLE}.dinner_nonsl_orders ;;
  }

  dimension: dinner_nonsl_price_1 {
    type: number
    sql: ${TABLE}.dinner_nonsl_price_1 ;;
  }

  dimension: dinner_orders {
    type: number
    sql: ${TABLE}.dinner_orders ;;
  }

  dimension: dinner_price {
    type: number
    sql: ${TABLE}.dinner_price ;;
  }

  dimension: dinner_price_1 {
    type: number
    sql: ${TABLE}.dinner_price_1 ;;
  }

  dimension: dinner_rate {
    type: number
    sql: ${TABLE}.dinner_rate ;;
  }

  dimension: dinner_sl_orders {
    type: number
    sql: ${TABLE}.dinner_sl_orders ;;
  }

  dimension: dinner_sl_price_1 {
    type: number
    sql: ${TABLE}.dinner_sl_price_1 ;;
  }

  dimension: es_cost {
    type: number
    sql: ${TABLE}.es_cost ;;
  }

  dimension: es_meal {
    type: number
    sql: ${TABLE}.es_meal ;;
  }

  dimension: es_nonsl_cost {
    type: number
    sql: ${TABLE}.es_nonsl_cost ;;
  }

  dimension: es_nonsl_orders {
    type: number
    sql: ${TABLE}.es_nonsl_orders ;;
  }

  dimension: es_nonsl_price_1 {
    type: number
    sql: ${TABLE}.es_nonsl_price_1 ;;
  }

  dimension: es_orders {
    type: number
    sql: ${TABLE}.es_orders ;;
  }

  dimension: es_price {
    type: number
    sql: ${TABLE}.es_price ;;
  }

  dimension: es_price_1 {
    type: number
    sql: ${TABLE}.es_price_1 ;;
  }

  dimension: es_rate {
    type: number
    sql: ${TABLE}.es_rate ;;
  }

  dimension: es_sl_orders {
    type: number
    sql: ${TABLE}.es_sl_orders ;;
  }

  dimension: es_sl_price_1 {
    type: number
    sql: ${TABLE}.es_sl_price_1 ;;
  }

  dimension: food_margin {
    type: number
    sql: ${TABLE}.food_margin ;;
  }

  dimension: hostel_name {
    type: string
    sql: ${TABLE}.hostel_name ;;
  }

  dimension: house_wise_actual_cost {
    type: number
    sql: ${TABLE}.house_wise_actual_cost ;;
  }

  dimension: house_wise_actual_cost_cogs {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_cogs ;;
  }

  dimension: house_wise_actual_cost_packaging {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_packaging ;;
  }

  dimension: house_wise_actual_cost_util {
    type: number
    sql: ${TABLE}.house_wise_actual_cost_util ;;
  }

  dimension: lunch_cost {
    type: number
    sql: ${TABLE}.lunch_cost ;;
  }

  dimension: lunch_meal {
    type: number
    sql: ${TABLE}.lunch_meal ;;
  }

  dimension: lunch_nonsl_cost {
    type: number
    sql: ${TABLE}.lunch_nonsl_cost ;;
  }

  dimension: lunch_nonsl_orders {
    type: number
    sql: ${TABLE}.lunch_nonsl_orders ;;
  }

  dimension: lunch_nonsl_price_1 {
    type: number
    sql: ${TABLE}.lunch_nonsl_price_1 ;;
  }

  dimension: lunch_orders {
    type: number
    sql: ${TABLE}.lunch_orders ;;
  }

  dimension: lunch_price {
    type: number
    sql: ${TABLE}.lunch_price ;;
  }

  dimension: lunch_price_1 {
    type: number
    sql: ${TABLE}.lunch_price_1 ;;
  }

  dimension: lunch_rate {
    type: number
    sql: ${TABLE}.lunch_rate ;;
  }

  dimension: lunch_sl_orders {
    type: number
    sql: ${TABLE}.lunch_sl_orders ;;
  }

  dimension: lunch_sl_price_1 {
    type: number
    sql: ${TABLE}.lunch_sl_price_1 ;;
  }

  dimension: max_rn {
    type: number
    sql: ${TABLE}.max_rn ;;
  }

  dimension: mc_name {
    type: string
    sql: ${TABLE}.mc_name ;;
  }

  dimension: menu_cost {
    type: number
    sql: ${TABLE}.menu_cost ;;
  }

  dimension_group: menu {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: menu_nonsl_cost_1 {
    type: number
    sql: ${TABLE}.menu_nonsl_cost_1 ;;
  }

  dimension: menu_price {
    type: number
    sql: ${TABLE}.menu_price ;;
  }

  dimension: menu_price_1 {
    type: number
    sql: ${TABLE}.menu_price_1 ;;
  }

  dimension: menu_rate {
    type: number
    sql: ${TABLE}.menu_rate ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: non_sl_kitchen_orders {
    type: number
    sql: ${TABLE}.non_sl_kitchen_orders ;;
  }

  dimension: non_sl_kitchen_price {
    type: number
    sql: ${TABLE}.non_sl_kitchen_price ;;
  }

  dimension: nonsl_total_cost {
    type: number
    sql: ${TABLE}.nonsl_total_cost ;;
  }

  dimension: packaging_cost {
    type: number
    sql: ${TABLE}.packaging_cost ;;
  }

  dimension: res_and_sl_orders {
    type: number
    sql: ${TABLE}.res_and_sl_orders ;;
  }

  dimension: sl_kitchen_orders {
    type: number
    sql: ${TABLE}.sl_kitchen_orders ;;
  }

  dimension: sl_kitchen_price {
    type: number
    sql: ${TABLE}.sl_kitchen_price ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: total_meal {
    type: number
    sql: ${TABLE}.total_meal ;;
  }

  dimension: total_sl_cost {
    type: number
    sql: ${TABLE}.total_sl_cost ;;
  }

  dimension: utility_cost {
    type: number
    sql: ${TABLE}.utility_cost ;;
  }

  dimension: vendor_master_id {
    type: string
    sql: ${TABLE}.vendor_master_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: vendor_name_total {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      label: "House Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_total_kv,derived_food_cost.hostel_name&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ value }}&sorts=derived_food_cost.hostel_name&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }

  }

  dimension: vendor_name_cogs {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      label: "House Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_total_cogs,derived_food_cost.hostel_name&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ value }}&sorts=derived_food_cost.hostel_name&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }

  }

  dimension: vendor_name_util {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      label: "House Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_total_util,derived_food_cost.hostel_name&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ value }}&sorts=derived_food_cost.hostel_name&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
  }

  dimension: vendor_name_packaging {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      label: "House Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_total_packaging,derived_food_cost.hostel_name&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ value }}&sorts=derived_food_cost.hostel_name&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }

  }


  measure: count {
    type: count
    drill_fields: [micromarket_name, hostel_name, mc_name, vendor_name]
  }

  measure: delta_ratio_total {
    type: number
    sql: sum(${house_wise_actual_cost})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_rate}),0) ;;
    link: {
      label: "Kitchen Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_total_kv,derived_food_cost.vendor_name_total&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ _filters['derived_food_cost.vendor_name'] | url_encode }}&sorts=derived_food_cost.vendor_name_kv&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
  }


  measure: delta_ratio_total_kv {
    type: number
    sql: sum(${house_wise_actual_cost})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_rate}),0) ;;
    }


  measure: delta_ratio_cogs {
    type: number
    sql: sum(${house_wise_actual_cost_cogs})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_cost}),0) ;;
    link: {
      label: "Kitchen Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_cogs_kv,derived_food_cost.vendor_name_cogs&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ _filters['derived_food_cost.vendor_name'] | url_encode }}&sorts=derived_food_cost.vendor_name_kv&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
  }

  measure: delta_ratio_cogs_kv {
    type: number
    sql: sum(${house_wise_actual_cost_cogs})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${menu_cost}),0) ;;
  }

  measure: delta_ratio_util {
    type: number
    sql: sum(${house_wise_actual_cost_util})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${utility_cost}),0) ;;
    link: {
      label: "Kitchen Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_util_kv,derived_food_cost.vendor_name_cogs&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ _filters['derived_food_cost.vendor_name'] | url_encode }}&sorts=derived_food_cost.vendor_name_kv&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
  }

  measure: delta_ratio_util_kv {
    type: number
    sql: sum(${house_wise_actual_cost_util})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${utility_cost}),0) ;;
  }

  measure: delta_ratio_packaging {
    type: number
    sql: sum(${house_wise_actual_cost_packaging})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${packaging_cost}),0) ;;
    link: {
      label: "Kitchen Wise"
      url: "/explore/central_projects/derived_food_cost?fields=derived_food_cost.delta_ratio_packaging_kv,derived_food_cost.vendor_name_cogs&f[derived_food_cost.menu_month]={{ _filters['derived_food_cost.menu_month'] | url_encode }}&f[derived_food_cost.vendor_name]={{ _filters['derived_food_cost.vendor_name'] | url_encode }}&sorts=derived_food_cost.vendor_name_kv&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22id%22%3A%22derived_food_cost.delta_ratio_total%22%2C%22name%22%3A%22Total%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A3%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22limit_displayed_rows_values%22%3A%7B%22show_hide%22%3A%22hide%22%2C%22first_last%22%3A%22first%22%2C%22num_rows%22%3A0%7D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%22Total%22%2C%22derived_food_cost.delta_ratio_cogs%22%3A%22COGS%22%2C%22derived_food_cost.delta_ratio_util%22%3A%22Utility%22%2C%22derived_food_cost.delta_ratio_packaging%22%3A%22Packaging%22%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22show_dropoff%22%3Afalse%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22value_format%22%3A%220.%23%23%22%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23ff0a0d%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%2320c224%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-sequential-0%22%7D%2C%22bold%22%3Atrue%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22font_size_main%22%3A%2212%22%2C%22orientation%22%3A%22auto%22%2C%22style_derived_food_cost.delta_ratio_total%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_total%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_total%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_total%22%3A%220.%23%23%22%2C%22style_derived_food_cost.delta_ratio_cogs%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_cogs%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_cogs%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_util%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_util%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22style_derived_food_cost.delta_ratio_packaging%22%3A%22%233A4245%22%2C%22show_title_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22title_placement_derived_food_cost.delta_ratio_packaging%22%3A%22above%22%2C%22value_format_derived_food_cost.delta_ratio_packaging%22%3A%220.%23%23%22%2C%22show_comparison_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22comparison_style_derived_food_cost.delta_ratio_util%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_util%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_util%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_util%22%3A%22above%22%2C%22comparison_style_derived_food_cost.delta_ratio_cogs%22%3A%22percentage_change%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_cogs%22%3Atrue%2C%22pos_is_bad_derived_food_cost.delta_ratio_cogs%22%3Afalse%2C%22comparison_label_placement_derived_food_cost.delta_ratio_cogs%22%3A%22below%22%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22show_row_numbers%22%3Afalse%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22size_to_fit%22%3Afalse%2C%22series_column_widths%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A75%2C%22derived_food_cost.delta_ratio_cogs%22%3A75%2C%22derived_food_cost.delta_ratio_util%22%3A75%2C%22derived_food_cost.delta_ratio_packaging%22%3A95%7D%2C%22series_cell_visualizations%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22is_active%22%3Afalse%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_text_format%22%3A%7B%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_total%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22align%22%3A%22center%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22align%22%3A%22center%22%7D%7D%2C%22table_theme%22%3A%22white%22%2C%22header_text_alignment%22%3A%22center%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22series_value_format%22%3A%7B%22derived_food_cost.delta_ratio_total%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_cogs%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_util%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%2C%22derived_food_cost.delta_ratio_packaging%22%3A%7B%22name%22%3A%22decimal_2%22%2C%22decimals%22%3A%222%22%2C%22format_string%22%3A%22%23%2C%23%230.00%22%2C%22label%22%3A%22Decimals+%282%29%22%2C%22label_prefix%22%3A%22Decimals%22%7D%7D%2C%22comp_value_format_derived_food_cost.delta_ratio_util%22%3A%22%22%2C%22comparison_style_derived_food_cost.delta_ratio_packaging%22%3A%22value%22%2C%22comparison_show_label_derived_food_cost.delta_ratio_packaging%22%3Atrue%2C%22comparison_label_placement_derived_food_cost.delta_ratio_packaging%22%3A%22left%22%2C%22comp_value_format_derived_food_cost.delta_ratio_packaging%22%3A%22%22%2C%22pos_is_bad_derived_food_cost.delta_ratio_packaging%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22leftAxisLabelVisible%22%3Afalse%2C%22leftAxisLabel%22%3A%22%22%2C%22rightAxisLabelVisible%22%3Afalse%2C%22rightAxisLabel%22%3A%22%22%2C%22smoothedBars%22%3Afalse%2C%22labelPosition%22%3A%22left%22%2C%22percentType%22%3A%22total%22%2C%22percentPosition%22%3A%22inline%22%2C%22valuePosition%22%3A%22right%22%2C%22labelColorEnabled%22%3Afalse%2C%22labelColor%22%3A%22%23FFF%22%7D&filter_config=%7B%22derived_food_cost.menu_month%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A7%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_cost.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A8%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
    }
  }

  measure: delta_ratio_packaging_kv {
    type: number
    sql: sum(${house_wise_actual_cost_packaging})/nullif(sum((${actual_blended_order}+${actual_sl_blended_order})*${packaging_cost}),0) ;;
  }



}
