view: derived_food_invoice {
  sql_table_name: stanza.derived_food_invoice ;;

  dimension: cancelled_flag {
    type: number
    sql: ${TABLE}.cancelled_flag ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: expired_po_flag {
    type: number
    sql: ${TABLE}.expired_po_flag ;;
  }

  dimension: gsri_done_flag {
    type: number
    sql: ${TABLE}.gsri_done_flag ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: item_category_label {
    type: string
    sql: ${TABLE}.item_category_label ;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
    link: {
      url: "/explore/central_projects/item_price_comparison?fields=item_price_comparison.item_name,item_price_comparison.city_name,item_price_comparison.Weighted_avg_unit_price,item_price_comparison.LP_Vendor,item_price_comparison.LP_unit_price&f[item_price_comparison.item_subcategory]={{ value }}&f[item_price_comparison.Vendor_name]={{ _filters['derived_food_invoice.vendor_name'] | url_encode }}&sorts=item_price_comparison.item_name&limit=500&vis=%7B%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22series_labels%22%3A%7B%7D%2C%22show_view_names%22%3Afalse%2C%22theme%22%3A%22contemporary%22%2C%22layout%22%3A%22fixed%22%2C%22minWidthForIndexColumns%22%3Atrue%2C%22headerFontSize%22%3A12%2C%22bodyFontSize%22%3A12%2C%22showTooltip%22%3Atrue%2C%22showHighlight%22%3Atrue%2C%22columnOrder%22%3A%7B%7D%2C%22rowSubtotals%22%3Afalse%2C%22colSubtotals%22%3Afalse%2C%22spanRows%22%3Atrue%2C%22spanCols%22%3Atrue%2C%22calculateOthers%22%3Atrue%2C%22sortColumnsBy%22%3A%22pivots%22%2C%22useViewName%22%3Afalse%2C%22useHeadings%22%3Afalse%2C%22useShortName%22%3Afalse%2C%22useUnit%22%3Afalse%2C%22groupVarianceColumns%22%3Afalse%2C%22genericLabelForSubtotals%22%3Afalse%2C%22indexColumn%22%3Afalse%2C%22transposeTable%22%3Afalse%2C%22type%22%3A%22marketplace_viz_report_table%3A%3Areport_table-marketplace%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A0%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expanded"
      label: "Item Comparison"
    }
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.item_uuid ;;
  }

  dimension: open_flag {
    type: number
    sql: ${TABLE}.open_flag ;;
  }

  dimension_group: po_completion {
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
    sql: ${TABLE}.po_completion_date ;;
  }

  dimension_group: po_created {
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
    sql: ${TABLE}.po_created_at ;;
  }

  dimension_group: po_end {
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
    sql: ${TABLE}.po_end_date ;;
  }

  dimension: po_expiry_days {
    type: number
    sql: ${TABLE}.po_expiry_days ;;
  }

  dimension: po_id {
    type: number
    sql: ${TABLE}.po_id ;;
    primary_key: yes
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: scope_of_work {
    type: string
    sql: ${TABLE}.scope_of_work ;;
  }

  dimension: subtotal_amount {
    type: number
    sql: ${TABLE}.subtotal_amount ;;
    value_format: "#,##0"
  }

  dimension: time_taken {
    type: number
    sql: case when po_completion_date is not null then datediff(day,po_created_at,po_completion_date) end ;;
  }

  dimension: unit_rate_rent_per_month {
    type: number
    sql: ${TABLE}.unit_rate_rent_per_month ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      url: "/explore/central_projects/derived_food_invoice?fields=derived_food_invoice.item_sub_category_label,derived_food_invoice.item_count,sum_of_subtotal_amount,max_of_total_consumption,derived_food_invoice.last_po_created_at&f[derived_food_invoice.gsri_done_flag]=1&f[derived_food_invoice.vendor_name]={{ value }}&sorts=derived_food_invoice.item_count+desc&limit=500&vis=%7B%22hidden_fields%22%3A%5B%22max_of_total_consumption%22%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22series_labels%22%3A%7B%7D%2C%22show_view_names%22%3Afalse%2C%22theme%22%3A%22contemporary%22%2C%22layout%22%3A%22fixed%22%2C%22minWidthForIndexColumns%22%3Atrue%2C%22headerFontSize%22%3A12%2C%22bodyFontSize%22%3A12%2C%22showTooltip%22%3Atrue%2C%22showHighlight%22%3Atrue%2C%22columnOrder%22%3A%7B%7D%2C%22rowSubtotals%22%3Afalse%2C%22colSubtotals%22%3Afalse%2C%22spanRows%22%3Atrue%2C%22spanCols%22%3Atrue%2C%22calculateOthers%22%3Atrue%2C%22sortColumnsBy%22%3A%22pivots%22%2C%22useViewName%22%3Afalse%2C%22useHeadings%22%3Afalse%2C%22useShortName%22%3Afalse%2C%22useUnit%22%3Afalse%2C%22groupVarianceColumns%22%3Afalse%2C%22genericLabelForSubtotals%22%3Afalse%2C%22indexColumn%22%3Afalse%2C%22transposeTable%22%3Afalse%2C%22type%22%3A%22marketplace_viz_report_table%3A%3Areport_table-marketplace%22%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22defaults_version%22%3A0%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_subtotal_amount%22%2C%22based_on%22%3A%22derived_food_invoice.subtotal_amount%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Subtotal+Amount%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22max_of_total_consumption%22%2C%22based_on%22%3A%22consumption_in_kitchen.total_consumption%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Max+of+Total+Consumption%22%2C%22type%22%3A%22max%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%28%24%7Bsum_of_subtotal_amount%7D%2F%24%7Bmax_of_total_consumption%7D%29%2A100%2C2%29%22%2C%22label%22%3A%22%25age+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22age_contribution%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
      label: "Item Subcategory"
    }
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
   }

  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }

  measure: city_count {
    type: count_distinct
    sql: ${TABLE}.city_name ;;
  }

  measure: distinct_po {
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }

  measure: weighted_avg_lead_time {
    type: average
    sql: case when ${time_taken} is not null and ${time_taken}!=0 then (${TABLE}.subtotal_amount*${time_taken})/(${TABLE}.subtotal_amount) else 0 end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_item_rate {
    type: average
    sql: (${TABLE}.unit_rate_rent_per_month*${TABLE}.quantity)/(${TABLE}.quantity) ;;
    value_format: "0.00"
  }

  measure: last_po_created_at {
    type: date
    sql: max(${TABLE}.po_created_at) ;;
  }
}
