view: vas_orders {
  derived_table: {
    sql: select
  co.residence_id residence_id,
  mr.residence_name residence_name,
  fv.name as vendor,
  co.uuid order_id,
  co.order_date order_date,
  co.user_id user_id,
  vm.uuid as item_id,
  vm.name as dish_name,
  cod.final_total_amount final_total_amount
from
  stanza.core_food_service_cafe_order co
join stanza.core_food_service_cafe_order_details cod on
  cod.order_id = co.uuid
join stanza.core_food_service_vas_master vm on
  vm.uuid = cod.item_id
join stanza.core_food_service_cafe_kitchen_mapping ckm on
  co.cafe_id = ckm.cafe_id
join stanza.core_food_service_food_vendor fv on
  ckm.kitchen_id = fv.uuid
join stanza.erp_transformation_master_residences mr on
      co.residence_id = mr.uuid
where
  order_status not in ('CANCELLED', 'CREATED')
  and fv.name not like '%Asgard%'
group by
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9 ;;
  }
  dimension: residence_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.residence_id ;;
  }
  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor ;;
    link: {
      url: "/explore/central_projects/vas_orders?fields=vas_orders.dish_name,vas_orders.item_count&f[vas_orders.vendor_name]={{ value }}&sorts=vas_orders.item_count+desc&limit=500&total=on&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22vas_orders.final_total_amount%22%2C%22id%22%3A%22vas_orders.final_total_amount%22%2C%22name%22%3A%22Final+Total+Amount%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22custom%22%2C%22tickDensityCustom%22%3A29%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22hidden_points_if_no%22%3A%5B%22yes_no_field%22%5D%2C%22hidden_fields%22%3A%5B%22item_count_rank%22%5D%7D&filter_config=%7B%22vas_orders.vendor_name%22%3A%5B%7B%22type%22%3A%22contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Amsterdam%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22item_count_rank%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22rank%28%24%7Bvas_orders.item_count%7D%2C%24%7Bvas_orders.item_count%7D%29%22%2C%22label%22%3A%22Item+count+Rank%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22yes_no_field%22%2C%22_type_hint%22%3A%22yesno%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bitem_count_rank%7D%3C11%22%2C%22label%22%3A%22Yes_no+field%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%7D%5D&origin=share-expanded"
      label: "top 10 items"
      }
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension_group: order {
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
    sql: ${TABLE}.order_date;;
  }
  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }
  dimension: dish_name {
    type: string
    sql: ${TABLE}.dish_name ;;
  }
  measure: total_amount {
    type: sum
    sql: ${TABLE}.final_total_amount ;;
  }
  measure: item_count {
    type: count
    drill_fields: [item_id]
  }
  measure: orders {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }
  measure: aov {
    type: number
    sql: sum(${TABLE}.final_total_amount)/(${orders}) ;;
    value_format: "0"
  }
  }
