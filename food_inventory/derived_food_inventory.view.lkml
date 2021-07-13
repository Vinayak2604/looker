view: derived_food_inventory {
  sql_table_name: stanza.derived_food_inventory ;;

  dimension: avail_stock_qty {
    type: number
    sql: ${TABLE}.avail_stock_qty ;;
  }

  dimension: avail_stock_value {
    type: number
    sql: ${TABLE}.avail_stock_value ;;
  }

  dimension: pm {
    sql: ${location_name} || ${item_code} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: blocked_stock_qty {
    type: number
    sql: ${TABLE}.blocked_stock_qty ;;
  }

  dimension: blocked_stock_value {
    type: number
    sql: ${TABLE}.blocked_stock_value ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: current_stock_qty {
    type: number
    sql: ${TABLE}.current_stock_qty ;;
  }

  dimension: current_stock_value {
    type: number
    sql: ${TABLE}.current_stock_value ;;
  }

  dimension: global_stock_qty {
    type: number
    sql: ${TABLE}.global_stock_qty ;;
  }

  dimension: global_stock_val {
    type: number
    sql: ${TABLE}.global_stock_val ;;
  }

  dimension: gst {
    type: string
    sql: ${TABLE}.gst ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
    link: {
      url: "/explore/central_projects/derived_food_inventory?fields=derived_food_inventory.total_available_value,inventory_days,derived_food_inventory.item_sub_category_label&f[derived_food_inventory.location_type]=STORE&f[derived_food_inventory.location_name]={{ value }}&f[derived_food_inventory.item_sub_category_label]={{ value }}&sorts=derived_food_inventory.total_available_value+desc&limit=500&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%221297ec12-86a5-4ae0-9dfc-82de70b3806a%22%2C%22palette_id%22%3A%2293f8aeb4-3f4a-4cd7-8fee-88c3417516a1%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_inventory.total_available_value%22%2C%22id%22%3A%22derived_food_inventory.total_available_value%22%2C%22name%22%3A%22Available+Value%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22inventory_days%22%2C%22id%22%3A%22inventory_days%22%2C%22name%22%3A%22Inventory+Days%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Atrue%2C%22tickDensity%22%3A%22default%22%2C%22type%22%3A%22linear%22%7D%5D%2C%22label_value_format%22%3A%22%23%2C%23%23%23%22%2C%22series_types%22%3A%7B%22sum_of_consumption_value%22%3A%22line%22%2C%22average_of_inv_days%22%3A%22line%22%2C%22inventory_days%22%3A%22line%22%7D%2C%22series_colors%22%3A%7B%22derived_food_inventory.total_available_value%22%3A%22%2310C871%22%2C%22inventory_days%22%3A%22%23FDEC85%22%7D%2C%22series_labels%22%3A%7B%22sum_of_consumption_value%22%3A%22Consumption%22%2C%22derived_food_inventory.total_available_value%22%3A%22Available+Value%22%2C%22average_of_inv_days%22%3A%22Inventory+Days%22%7D%2C%22series_point_styles%22%3A%7B%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22hidden_points_if_no%22%3A%5B%22new_calculation%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%22rank%22%5D%7D&filter_config=%7B%22derived_food_inventory.location_type%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22STORE%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_inventory.item_sub_category_label%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Dairy%2CFruits+and+Vegetables%2CGeneral+Supplies%2CGroceries%2CNon+Veg%2CWater%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22rank%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22rank%28%24%7Bderived_food_inventory.total_available_value%7D%2C%24%7Bderived_food_inventory.total_available_value%7D%29%22%2C%22label%22%3A%22Rank%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22new_calculation%22%2C%22_type_hint%22%3A%22yesno%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Brank%7D%3C11%22%2C%22label%22%3A%22New+Calculation%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22is_disabled%22%3Afalse%7D%2C%7B%22measure%22%3A%22sum_of_consumption_value%22%2C%22based_on%22%3A%22derived_food_inventory.consumption_value%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Consumption+Value%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22based_on%22%3A%22weighted_avg.inv_days%22%2C%22_kind_hint%22%3A%22measure%22%2C%22measure%22%3A%22inventory_days%22%2C%22type%22%3A%22average%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22measure%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Inventory+Days%22%7D%5D"
      label: "Item Level"
    }
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
    #drill_fields: [item_sub_category_label]
    link: {
      url: "/explore/central_projects/derived_food_inventory?fields=derived_food_inventory.total_available_value,inventory_days,derived_food_inventory.item_sub_category_label&f[derived_food_inventory.location_type]=STORE&f[derived_food_inventory.location_name]={{ value }}&f[derived_food_inventory.item_sub_category_label]=Dairy%2CFruits+and+Vegetables%2CGeneral+Supplies%2CGroceries%2CNon+Veg%2CWater&sorts=derived_food_inventory.total_available_value+desc&limit=500&column_limit=50&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22circle_outline%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%221297ec12-86a5-4ae0-9dfc-82de70b3806a%22%2C%22palette_id%22%3A%2293f8aeb4-3f4a-4cd7-8fee-88c3417516a1%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_inventory.total_available_value%22%2C%22id%22%3A%22derived_food_inventory.total_available_value%22%2C%22name%22%3A%22Available+Value%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%2C%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22right%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22inventory_days%22%2C%22id%22%3A%22inventory_days%22%2C%22name%22%3A%22Inventory+Days%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Atrue%2C%22tickDensity%22%3A%22default%22%2C%22type%22%3A%22linear%22%7D%5D%2C%22label_value_format%22%3A%22%23%2C%23%23%23%22%2C%22series_types%22%3A%7B%22sum_of_consumption_value%22%3A%22line%22%2C%22average_of_inv_days%22%3A%22line%22%2C%22inventory_days%22%3A%22line%22%7D%2C%22series_colors%22%3A%7B%22derived_food_inventory.total_available_value%22%3A%22%2310C871%22%2C%22inventory_days%22%3A%22%23FDEC85%22%7D%2C%22series_labels%22%3A%7B%22sum_of_consumption_value%22%3A%22Consumption%22%2C%22derived_food_inventory.total_available_value%22%3A%22Available+Value%22%2C%22average_of_inv_days%22%3A%22Inventory+Days%22%7D%2C%22series_point_styles%22%3A%7B%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22hidden_points_if_no%22%3A%5B%22new_calculation%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_fields%22%3A%5B%22rank%22%5D%7D&filter_config=%7B%22derived_food_inventory.location_type%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22STORE%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_inventory.item_sub_category_label%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Dairy%2CFruits+and+Vegetables%2CGeneral+Supplies%2CGroceries%2CNon+Veg%2CWater%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22rank%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22rank%28%24%7Bderived_food_inventory.total_available_value%7D%2C%24%7Bderived_food_inventory.total_available_value%7D%29%22%2C%22label%22%3A%22Rank%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22new_calculation%22%2C%22_type_hint%22%3A%22yesno%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Brank%7D%3C11%22%2C%22label%22%3A%22New+Calculation%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22is_disabled%22%3Afalse%7D%2C%7B%22measure%22%3A%22sum_of_consumption_value%22%2C%22based_on%22%3A%22derived_food_inventory.consumption_value%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Consumption+Value%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22based_on%22%3A%22weighted_avg.inv_days%22%2C%22_kind_hint%22%3A%22measure%22%2C%22measure%22%3A%22inventory_days%22%2C%22type%22%3A%22average%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22measure%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Inventory+Days%22%7D%5D"
      label: "Item Sub Category Level"
    }
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: map {
    type: number
    sql: ${TABLE}.map ;;
  }

  dimension: opening_stock {
    type: number
    sql: ${TABLE}.opening_stock ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: tx_in_last_closing {
    type: number
    sql: ${TABLE}.tx_in_last_closing ;;
  }

  dimension: tx_out_last_closing {
    type: number
    sql: ${TABLE}.tx_out_last_closing ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: total_blocked_qty {
    type: sum
    sql: ${blocked_stock_qty} ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_blocked_value {
    type: sum
    sql: ${blocked_stock_value}  ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_available_qty {
    type: sum
    sql: ${avail_stock_qty}  ;;
    # drill_fields: [item_name, city_name, location_name]
  }

  measure: total_available_value {
    type: sum
    sql: ${avail_stock_value}  ;;
  }

  dimension: avail_value {
    type: number
    sql: ${avail_stock_value}  ;;
  }

  measure: moving_average_price {
    type: max
    sql: ${map} ;;
  }

  measure: local_average {
    type: sum
    sql: ${avail_stock_value}/nullif(${avail_stock_qty},0) ;;

  }

  dimension: consumption_value {
    type: number
    sql: ${TABLE}.cons_value ;;
  }

  dimension: consumption_qty {
    type: number
    sql: ${TABLE}.cons_qty ;;
  }

  measure: inventory_days {
    type: sum
    sql: ${avail_stock_value}/nullif(${consumption_value},0) ;;
  }

  dimension: adjusted_qty {
    type: number
    sql: ${TABLE}.adjusted_qty ;;
  }

  dimension: adjusted_value {
    type: number
    sql: ${TABLE}.adjusted_price ;;
  }

  measure: adjusted_perc {
    type: number
    sql: (sum(${adjusted_value})/sum(nullif(${purchase_value},0)))*100 ;;
  }

  dimension: purchase_value {
    type: number
    sql: ${TABLE}.purchase_value ;;
  }

  dimension: purchase_qty {
    type: number
    sql: ${TABLE}.purchase_qty ;;
  }

  # dimension: weight {
  #   type: number
  #   sql: case when ${inventory_days}>0 then 1 else 0 end;;

  # # }

  # measure: weighted_price {
  #   type: number
  #   sql: ${inventory_days}*${avail_value} ;;
  # }

  # measure: weighted_inv_days{
  #   type: number
  #   sql: sum(${weighted_price})/sum(${avail_value}) ;;

  # }
}
