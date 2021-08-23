view: food_cost_items_dt {
  derived_table: {
    sql: select menu_date,vendor_id,vendor_master_id,vendor_name,ingredient_name,
       sum(total_qty) as budget_qty,
       sum(effective_price*qty)/sum(effective_price) as actual_qty,
       actual_qty/nullif(budget_qty,0) as delta_qty
    from stanza.derived_food_cost_items
    group by 1,2,3,4,5 ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_master_id {
    type: string
    sql: ${TABLE},vendor_master_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: budget_qty {
    type: number
    sql: ${TABLE}.budget_qty ;;
  }

  dimension: actual_qty {
    type: number
    sql: ${TABLE}.actual_qty ;;
  }

  dimension: delta_qty {
    type: number
    sql: ${TABLE}.delta_qty ;;
  }

  measure: blended_delta {
    type: number
    sql: sum(${actual_qty})/nullif(sum(case when ${delta_qty}>0 then ${budget_qty} else null end),0) ;;
    link: {
      label: "Kitchen Wise"
      url: "/explore/central_projects/food_cost_items_dt?fields=food_cost_items_dt.blended_delta,food_cost_items_dt.vendor_name&f[food_cost_items_dt.vendor_name]={{ derived_food_cost.vendor_name_cogs._value }}&f[food_cost_items_dt.menu_date]={{ derived_food_cost.menu_month._value }}&sorts=food_cost_items_dt.vendor_name&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Afalse%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22palette_id%22%3A%22test-categorical-0%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22food_cost_items_dt.blended_delta%22%2C%22id%22%3A%22food_cost_items_dt.blended_delta%22%2C%22name%22%3A%22Blended+Delta%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22maxValue%22%3A4%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22default%22%2C%22tickDensityCustom%22%3A5%2C%22type%22%3A%22linear%22%7D%5D%2C%22font_size%22%3A%2214%22%2C%22label_value_format%22%3A%220.00%22%2C%22series_types%22%3A%7B%7D%2C%22label_color%22%3A%5B%22Black%22%5D%2C%22custom_color_enabled%22%3Atrue%2C%22show_single_value_title%22%3Atrue%2C%22single_value_title%22%3A%22Price%22%2C%22value_format%22%3A%220.00%22%2C%22show_comparison%22%3Afalse%2C%22comparison_type%22%3A%22value%22%2C%22comparison_reverse_colors%22%3Afalse%2C%22show_comparison_label%22%3Atrue%2C%22enable_conditional_formatting%22%3Atrue%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22greater+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%23EA4335%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%227c56cc21-66e4-41c9-81ce-a60e1c3967b2%22%2C%22palette_id%22%3A%2256d0c358-10a0-4fd6-aa0b-b117bef527ab%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%2C%7B%22type%22%3A%22less+than%22%2C%22value%22%3A1%2C%22background_color%22%3A%22%22%2C%22font_color%22%3A%22%237CB342%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%227c56cc21-66e4-41c9-81ce-a60e1c3967b2%22%2C%22palette_id%22%3A%224a00499b-c0fe-4b15-a304-4083c07ff4c4%22%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3Anull%7D%5D%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22food_cost_items_dt.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22SL+-%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22food_cost_items_dt.menu_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%227%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%7D%5D%7D&origin=share-expanded"
    }

  }

  # parameter:  date {
  #   # type: unquoted
  #   # allowed_value: {
  #   #   label: "L7D"
  #   #   value: "menu_date >=(current_date-7) and menu_date <current_date"
  #   # }
  #   # allowed_value: {
  #   #   label: "L8-14D"
  #   #   value: "menu_date >=(current_date-14) and menu_date <current_date-7"
  #   # }
  #   # allowed_value: {
  #   #   label: "L15-21D"
  #   #   value: "menu_date >=(current_date-21) and menu_date <current_date-14"
  #   # }
  #   # allowed_value: {
  #   #   label: "L22-28D"
  #   #   value: "menu_date >=(current_date-28) and menu_date <current_date-21"
  #   # }
  #   type: date
  #   convert_tz: no

  # }




  }
