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
      url: "/explore/central_projects/derived_food_invoice?fields=derived_food_invoice.item_sub_category_label,derived_food_invoice.item_count&f[derived_food_invoice.vendor_name]={{ value }}&sorts=derived_food_invoice.item_count+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22y_axes%22%3A%5B%7B%22label%22%3A%22%22%2C%22orientation%22%3A%22left%22%2C%22series%22%3A%5B%7B%22axisId%22%3A%22derived_food_invoice.item_count%22%2C%22id%22%3A%22derived_food_invoice.item_count%22%2C%22name%22%3A%22Item+Count%22%7D%5D%2C%22showLabels%22%3Atrue%2C%22showValues%22%3Atrue%2C%22unpinAxis%22%3Afalse%2C%22tickDensity%22%3A%22custom%22%2C%22tickDensityCustom%22%3A53%2C%22type%22%3A%22linear%22%7D%5D%2C%22series_types%22%3A%7B%7D%2C%22series_labels%22%3A%7B%22max_of_total_consumption%22%3A%22Kitchen+Consumption%22%7D%2C%22theme%22%3A%22contemporary%22%2C%22layout%22%3A%22fixed%22%2C%22minWidthForIndexColumns%22%3Atrue%2C%22headerFontSize%22%3A12%2C%22bodyFontSize%22%3A12%2C%22showTooltip%22%3Atrue%2C%22showHighlight%22%3Atrue%2C%22columnOrder%22%3A%7B%7D%2C%22rowSubtotals%22%3Afalse%2C%22colSubtotals%22%3Afalse%2C%22spanRows%22%3Atrue%2C%22spanCols%22%3Atrue%2C%22calculateOthers%22%3Atrue%2C%22sortColumnsBy%22%3A%22pivots%22%2C%22useViewName%22%3Afalse%2C%22useHeadings%22%3Afalse%2C%22useShortName%22%3Afalse%2C%22useUnit%22%3Afalse%2C%22groupVarianceColumns%22%3Afalse%2C%22genericLabelForSubtotals%22%3Afalse%2C%22indexColumn%22%3Afalse%2C%22transposeTable%22%3Afalse%2C%22label%7Cderived_food_invoice.vendor_name%22%3A%22Vendor+Name%22%2C%22heading%7Cderived_food_invoice.vendor_name%22%3A%22%22%2C%22hide%7Cderived_food_invoice.vendor_name%22%3Afalse%2C%22label%7Cderived_food_invoice.city_name%22%3A%22City+Name%22%2C%22heading%7Cderived_food_invoice.city_name%22%3A%22%22%2C%22hide%7Cderived_food_invoice.city_name%22%3Afalse%2C%22subtotalDepth%22%3A%221%22%2C%22label%7Csum_of_subtotal_amount%22%3A%22Total+Amount%22%2C%22heading%7Csum_of_subtotal_amount%22%3A%22%22%2C%22style%7Csum_of_subtotal_amount%22%3A%22black_red%22%2C%22reportIn%7Csum_of_subtotal_amount%22%3A%221%22%2C%22unit%7Csum_of_subtotal_amount%22%3A%22%22%2C%22comparison%7Csum_of_subtotal_amount%22%3A%22no_variance%22%2C%22switch%7Csum_of_subtotal_amount%22%3Afalse%2C%22var_num%7Csum_of_subtotal_amount%22%3Atrue%2C%22var_pct%7Csum_of_subtotal_amount%22%3Afalse%2C%22label%7Cderived_food_invoice.item_count%22%3A%22Item+Count%22%2C%22heading%7Cderived_food_invoice.item_count%22%3A%22%22%2C%22style%7Cderived_food_invoice.item_count%22%3A%22normal%22%2C%22reportIn%7Cderived_food_invoice.item_count%22%3A%221%22%2C%22unit%7Cderived_food_invoice.item_count%22%3A%22%22%2C%22comparison%7Cderived_food_invoice.item_count%22%3A%22no_variance%22%2C%22switch%7Cderived_food_invoice.item_count%22%3Afalse%2C%22var_num%7Cderived_food_invoice.item_count%22%3Atrue%2C%22var_pct%7Cderived_food_invoice.item_count%22%3Afalse%2C%22label%7Cage_contribution%22%3A%22%25age+Contribution%22%2C%22heading%7Cage_contribution%22%3A%22%22%2C%22style%7Cage_contribution%22%3A%22normal%22%2C%22reportIn%7Cage_contribution%22%3A%221%22%2C%22unit%7Cage_contribution%22%3A%22%22%2C%22comparison%7Cage_contribution%22%3A%22no_variance%22%2C%22switch%7Cage_contribution%22%3Afalse%2C%22var_num%7Cage_contribution%22%3Atrue%2C%22var_pct%7Cage_contribution%22%3Afalse%2C%22hidden_fields%22%3A%5B%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22show_row_numbers%22%3Atrue%2C%22truncate_column_names%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22table_theme%22%3A%22editable%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%7D&filter_config=%7B%7D&dynamic_fields=%5B%5D&origin=share-expanded"
      label: "Items"
    }
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
   }

  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }

  measure: distinct_po {
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }

  measure: weighted_avg_lead_time {
    type: number
    sql: SUM(${TABLE}.subtotal_amount*${TABLE}.time_taken)/SUM(${TABLE}.subtotal_amount) ;;
  }
  measure: weighted_avg_price {
    type: number
    sql: SUM(${TABLE}.quantity*${TABLE}.unit_rate_rent_per_month)/SUM(${TABLE}.quantity) ;;
  }
}
