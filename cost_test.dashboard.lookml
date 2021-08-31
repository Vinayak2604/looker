- dashboard: cost_dashboard
  title: Cost Dashboard
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Delta
    name: Delta
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_total]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 5
    width: 2
    height: 4
  - name: MTD
    type: text
    title_text: MTD
    row: 0
    col: 3
    width: 4
    height: 2
  - title: Delta
    name: Delta (2)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_cogs]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 5
    width: 2
    height: 4
  - title: Delta
    name: Delta (3)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_util]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 5
    width: 2
    height: 4
  - title: Delta
    name: Delta (4)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_packaging]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 5
    width: 2
    height: 4
  - name: L7D
    type: text
    title_text: L7D
    row: 0
    col: 7
    width: 4
    height: 2
  - title: Delta
    name: Delta (5)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_total]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 9
    width: 2
    height: 4
  - title: Delta
    name: Delta (6)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 9
    width: 2
    height: 4
  - title: Delta
    name: Delta (7)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 9
    width: 2
    height: 4
  - title: Delta
    name: Delta (8)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 9
    width: 2
    height: 4
  - name: L8-14D
    type: text
    title_text: L8-14D
    row: 0
    col: 11
    width: 4
    height: 2
  - title: Delta
    name: Delta (9)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_total]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 13
    width: 2
    height: 4
  - title: Delta
    name: Delta (10)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 13
    width: 2
    height: 4
  - title: Delta
    name: Delta (11)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 13
    width: 2
    height: 4
  - title: Delta
    name: Delta (12)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 13
    width: 2
    height: 4
  - title: Delta
    name: Delta (13)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_total]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 17
    width: 2
    height: 4
  - name: L15-21D
    type: text
    title_text: L15-21D
    row: 0
    col: 15
    width: 4
    height: 2
  - title: Delta
    name: Delta (14)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 17
    width: 2
    height: 4
  - title: Delta
    name: Delta (15)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 17
    width: 2
    height: 4
  - title: Delta
    name: Delta (16)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 17
    width: 2
    height: 4
  - name: L22-28D
    type: text
    title_text: L22-28D
    row: 0
    col: 19
    width: 4
    height: 2
  - title: Delta
    name: Delta (17)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_total]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 21
    width: 2
    height: 4
  - title: Delta
    name: Delta (18)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 21
    width: 2
    height: 4
  - title: Delta
    name: Delta (19)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 21
    width: 2
    height: 4
  - title: Delta
    name: Delta (20)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [derived_food_cost.delta_ratio_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '"("0.##"x)"'
    conditional_formatting: [{type: greater than, value: 1, background_color: '',
        font_color: "#ff0a0d", color_application: {collection_id: test, palette_id: test-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 1, background_color: '', font_color: "#20c224", color_application: {
          collection_id: test, palette_id: test-sequential-0}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 21
    width: 2
    height: 4
  - name: Total
    type: text
    title_text: Total
    subtitle_text: ''
    body_text: |-
      - **Actuals - Delta**
      - **INR/B.O - Delta**
    row: 2
    col: 0
    width: 3
    height: 4
  - name: ''
    type: text
    title_text: "."
    row: 0
    col: 0
    width: 3
    height: 2
  - name: COGS
    type: text
    title_text: COGS
    body_text: |-
      - **Actuals - Delta**
      - **INR/B.O - Delta**
    row: 6
    col: 0
    width: 3
    height: 4
  - name: Utils
    type: text
    title_text: Utils
    body_text: |-
      - **Actuals - Delta**
      - **INR/B.O - Delta**
    row: 10
    col: 0
    width: 3
    height: 4
  - name: Packaging
    type: text
    title_text: Packaging
    body_text: |-
      - **Actuals - Delta**
      - **INR/B.O - Delta**
    row: 14
    col: 0
    width: 3
    height: 4
  - title: ''
    name: " (2)"
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_2]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_2, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: ''
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 3
    width: 2
    height: 2
  - title: ''
    name: " (3)"
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.MTD_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Total
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: ''
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 3
    width: 2
    height: 2
  - title: ''
    name: " (4)"
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 7
    width: 2
    height: 2
  - title: New Tile (copy)
    name: New Tile (copy)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Total
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 7
    width: 2
    height: 2
  - title: New Tile (copy 2)
    name: New Tile (copy 2)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_14d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Total
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 11
    width: 2
    height: 2
  - title: Actuals
    name: Actuals
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 11
    width: 2
    height: 2
  - title: New Tile (copy 3)
    name: New Tile (copy 3)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l14d_21d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Total
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 15
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (2)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 15
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (3)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 2
    col: 19
    width: 2
    height: 2
  - title: New Tile (copy 4)
    name: New Tile (copy 4)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l21d_28d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Total
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 19
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (4)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_cogs_2]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_2, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs_2, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 3
    width: 2
    height: 2
  - title: New Tile (copy 5)
    name: New Tile (copy 5)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.MTD_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: COGS
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 3
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (5)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 7
    width: 2
    height: 2
  - title: New Tile (copy 6)
    name: New Tile (copy 6)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: COGS
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 7
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (6)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 11
    width: 2
    height: 2
  - title: New Tile (copy 7)
    name: New Tile (copy 7)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_14d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: COGS
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 11
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (7)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 15
    width: 2
    height: 2
  - title: New Tile (copy 8)
    name: New Tile (copy 8)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l14d_21d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: COGS
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 15
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (8)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_cogs]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 6
    col: 19
    width: 2
    height: 2
  - title: New Tile
    name: New Tile
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l21d_28d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: COGS
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 19
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (9)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_util]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_2, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs_2, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 3
    width: 2
    height: 2
  - title: New Tile (copy 9)
    name: New Tile (copy 9)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.MTD_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Utility
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 3
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (10)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 7
    width: 2
    height: 2
  - title: New Tile (copy 10)
    name: New Tile (copy 10)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Utility
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 7
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (11)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 11
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (12)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 15 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_packaging, based_on: derived_food_cost.house_wise_actual_cost_packaging,
        expression: '', label: Sum of House Wise Actual Cost Packaging, type: sum,
        _kind_hint: measure, _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-7,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 11
    width: 2
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_14d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Packaging
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 16
    col: 11
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (13)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_packaging]
    filters:
      derived_food_cost.menu_month: 1 months
      derived_food_cost.vendor_name: "%SL -%"
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_2, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs_2, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_packaging, based_on: derived_food_cost.house_wise_actual_cost_packaging,
        expression: '', label: Sum of House Wise Actual Cost Packaging, type: sum,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 3
    width: 2
    height: 2
  - title: New Tile (copy 11)
    name: New Tile (copy 11)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_14d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Utility
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 11
    width: 2
    height: 2
  - title: New Tile (copy 12)
    name: New Tile (copy 12)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.MTD_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Packaging
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 16
    col: 3
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (14)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 8 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_packaging, based_on: derived_food_cost.house_wise_actual_cost_packaging,
        expression: '', label: Sum of House Wise Actual Cost Packaging, type: sum,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 7
    width: 2
    height: 2
  - title: New Tile (copy 13)
    name: New Tile (copy 13)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l7d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Packaging
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 16
    col: 7
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (15)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 15
    width: 2
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l14d_21d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Utility
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 15
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (16)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_util]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 10
    col: 19
    width: 2
    height: 2
  - title: New Tile
    name: New Tile (4)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l21d_28d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Utility
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 19
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (17)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 22 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_packaging, based_on: derived_food_cost.house_wise_actual_cost_packaging,
        expression: '', label: Sum of House Wise Actual Cost Packaging, type: sum,
        _kind_hint: measure, _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-15,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 15
    width: 2
    height: 2
  - title: New Tile (copy 14)
    name: New Tile (copy 14)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l14d_21d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Packaging
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 16
    col: 15
    width: 2
    height: 2
  - title: Actuals
    name: Actuals (18)
    model: central_projects
    explore: derived_food_cost
    type: single_value
    fields: [sum_of_house_wise_actual_cost_packaging]
    filters:
      derived_food_cost.vendor_name: "%SL -%"
      derived_food_cost.menu_date: 29 days
    limit: 500
    dynamic_fields: [{measure: sum_of_house_wise_actual_cost, based_on: derived_food_cost.house_wise_actual_cost,
        expression: '', label: Sum of House Wise Actual Cost, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_cogs, based_on: derived_food_cost.house_wise_actual_cost_cogs,
        expression: '', label: Sum of House Wise Actual Cost Cogs, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_util, based_on: derived_food_cost.house_wise_actual_cost_util,
        expression: '', label: Sum of House Wise Actual Cost Util, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_house_wise_actual_cost_packaging, based_on: derived_food_cost.house_wise_actual_cost_packaging,
        expression: '', label: Sum of House Wise Actual Cost Packaging, type: sum,
        _kind_hint: measure, _type_hint: number}]
    filter_expression: "${derived_food_cost.menu_date}<add_days(-21,now())"
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    value_format: '"₹" #," K"'
    conditional_formatting: []
    font_size_main: '12'
    orientation: auto
    style_derived_food_cost.delta_ratio_total: "#3A4245"
    show_title_derived_food_cost.delta_ratio_total: true
    title_placement_derived_food_cost.delta_ratio_total: above
    value_format_derived_food_cost.delta_ratio_total: 0.##
    style_derived_food_cost.delta_ratio_cogs: "#3A4245"
    show_title_derived_food_cost.delta_ratio_cogs: true
    title_placement_derived_food_cost.delta_ratio_cogs: above
    value_format_derived_food_cost.delta_ratio_cogs: 0.##
    show_comparison_derived_food_cost.delta_ratio_cogs: false
    style_derived_food_cost.delta_ratio_util: "#3A4245"
    show_title_derived_food_cost.delta_ratio_util: true
    title_placement_derived_food_cost.delta_ratio_util: above
    value_format_derived_food_cost.delta_ratio_util: 0.##
    show_comparison_derived_food_cost.delta_ratio_util: false
    style_derived_food_cost.delta_ratio_packaging: "#3A4245"
    show_title_derived_food_cost.delta_ratio_packaging: true
    title_placement_derived_food_cost.delta_ratio_packaging: above
    value_format_derived_food_cost.delta_ratio_packaging: 0.##
    show_comparison_derived_food_cost.delta_ratio_packaging: false
    comparison_style_derived_food_cost.delta_ratio_util: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_util: true
    pos_is_bad_derived_food_cost.delta_ratio_util: false
    comparison_label_placement_derived_food_cost.delta_ratio_util: above
    comparison_style_derived_food_cost.delta_ratio_cogs: percentage_change
    comparison_show_label_derived_food_cost.delta_ratio_cogs: true
    pos_is_bad_derived_food_cost.delta_ratio_cogs: false
    comparison_label_placement_derived_food_cost.delta_ratio_cogs: below
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      derived_food_cost.delta_ratio_total: Total
      derived_food_cost.delta_ratio_cogs: COGS
      derived_food_cost.delta_ratio_util: Utility
      derived_food_cost.delta_ratio_packaging: Packaging
    series_column_widths:
      derived_food_cost.delta_ratio_total: 75
      derived_food_cost.delta_ratio_cogs: 75
      derived_food_cost.delta_ratio_util: 75
      derived_food_cost.delta_ratio_packaging: 95
    series_cell_visualizations:
      derived_food_cost.delta_ratio_total:
        is_active: false
      derived_food_cost.delta_ratio_cogs:
        is_active: false
      derived_food_cost.delta_ratio_util:
        is_active: false
      derived_food_cost.delta_ratio_packaging:
        is_active: false
    series_text_format:
      derived_food_cost.delta_ratio_cogs:
        align: center
      derived_food_cost.delta_ratio_total:
        align: center
      derived_food_cost.delta_ratio_util:
        align: center
      derived_food_cost.delta_ratio_packaging:
        align: center
    table_theme: white
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      derived_food_cost.delta_ratio_total:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_cogs:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_util:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      derived_food_cost.delta_ratio_packaging:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
    comp_value_format_derived_food_cost.delta_ratio_util: ''
    comparison_style_derived_food_cost.delta_ratio_packaging: value
    comparison_show_label_derived_food_cost.delta_ratio_packaging: true
    comparison_label_placement_derived_food_cost.delta_ratio_packaging: left
    comp_value_format_derived_food_cost.delta_ratio_packaging: ''
    pos_is_bad_derived_food_cost.delta_ratio_packaging: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen: {}
    row: 14
    col: 19
    width: 2
    height: 2
  - title: New Tile (copy 15)
    name: New Tile (copy 15)
    model: central_projects
    explore: food_cost_new
    type: single_value
    fields: [food_cost_new.l21d_28d_avg]
    filters:
      food_cost_new.menu_date: before 1 days ago
      food_cost_new.parameter: Actual - INR/Blended Order
      food_cost_new.scope: Packaging
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    single_value_title: INR / B. O.
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: true
    headerFontSize: 14
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: true
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|food_cost_new.MTD: MTD
    heading|food_cost_new.MTD: ''
    style|food_cost_new.MTD: black_red
    reportIn|food_cost_new.MTD: '1'
    unit|food_cost_new.MTD: ''
    comparison|food_cost_new.MTD: no_variance
    switch|food_cost_new.MTD: false
    var_num|food_cost_new.MTD: true
    var_pct|food_cost_new.MTD: false
    label|food_cost_new.Last_Month: Last Month
    heading|food_cost_new.Last_Month: ''
    style|food_cost_new.Last_Month: black_red
    reportIn|food_cost_new.Last_Month: '1'
    unit|food_cost_new.Last_Month: ''
    comparison|food_cost_new.Last_Month: no_variance
    switch|food_cost_new.Last_Month: false
    var_num|food_cost_new.Last_Month: true
    var_pct|food_cost_new.Last_Month: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: Week Split
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    unit|food_cost_new.l7d: ''
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L8-14D
    heading|food_cost_new.l7d_14d: Week Split
    style|food_cost_new.l7d_14d: black_red
    reportIn|food_cost_new.l7d_14d: '1'
    unit|food_cost_new.l7d_14d: ''
    comparison|food_cost_new.l7d_14d: no_variance
    switch|food_cost_new.l7d_14d: false
    var_num|food_cost_new.l7d_14d: true
    var_pct|food_cost_new.l7d_14d: false
    label|food_cost_new.l14d_21d: L15-21D
    heading|food_cost_new.l14d_21d: Week Split
    style|food_cost_new.l14d_21d: black_red
    reportIn|food_cost_new.l14d_21d: '1'
    unit|food_cost_new.l14d_21d: ''
    comparison|food_cost_new.l14d_21d: no_variance
    switch|food_cost_new.l14d_21d: false
    var_num|food_cost_new.l14d_21d: true
    var_pct|food_cost_new.l14d_21d: false
    label|food_cost_new.l21d_28d: L22-28D
    heading|food_cost_new.l21d_28d: Week Split
    style|food_cost_new.l21d_28d: black_red
    reportIn|food_cost_new.l21d_28d: '1'
    unit|food_cost_new.l21d_28d: ''
    comparison|food_cost_new.l21d_28d: no_variance
    switch|food_cost_new.l21d_28d: false
    var_num|food_cost_new.l21d_28d: true
    var_pct|food_cost_new.l21d_28d: false
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 16
    col: 19
    width: 2
    height: 2
