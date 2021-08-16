- dashboard: food_cost_performance
  title: Food Cost Performance
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: cost - daily
    name: cost - daily
    model: central_projects
    explore: food_cost_new
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [food_cost_new.scope, food_cost_new.parameter, food_cost_new.rank_scope,
      food_cost_new.rank_para, food_cost_new.value_sum, food_cost_new.value_avg, food_cost_new.menu_date_lw]
    pivots: [food_cost_new.menu_date_lw]
    filters:
      food_cost_new.menu_date: 8 days
      food_cost_new.vendor_name: "%SL -%,-SL - Hamburg"
    sorts: [food_cost_new.menu_date_lw desc, food_cost_new.rank_scope, food_cost_new.rank_para]
    limit: 5000
    dynamic_fields: [{category: table_calculation, expression: 'if(${food_cost_new.value_avg}>0,${food_cost_new.value_avg},${food_cost_new.value_sum})',
        label: Value, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: value, _type_hint: number}]
    filter_expression: "${food_cost_new.menu_date}< add_days(-1,now())\n"
    hidden_fields: [food_cost_new.value_sum, food_cost_new.value_avg, food_cost_new.rank_scope,
      food_cost_new.rank_para]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: fixed
    minWidthForIndexColumns: false
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
    useHeadings: false
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
    label|value: Last Week
    heading|value: Last Week
    style|value: black_red
    reportIn|value: '1'
    unit|value: ''
    comparison|value: no_variance
    switch|value: false
    var_num|value: true
    var_pct|value: false
    label|food_cost_new.value_sum: ''
    heading|food_cost_new.value_sum: Last Week
    style|food_cost_new.value_sum: black_red
    reportIn|food_cost_new.value_sum: '1'
    unit|food_cost_new.value_sum: ''
    comparison|food_cost_new.value_sum: no_variance
    switch|food_cost_new.value_sum: false
    var_num|food_cost_new.value_sum: false
    var_pct|food_cost_new.value_sum: false
    heading|food_cost_new.value_avg: Last Week
    style|food_cost_new.value_avg: black_red
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: ''
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L7 - L14D
    style|food_cost_new.l7d_14d: black_red
    label|food_cost_new.l14d_21d: L14 - L21D
    style|food_cost_new.l14d_21d: black_red
    label|food_cost_new.l21d_28d: L21 - L28D
    style|food_cost_new.l21d_28d: black_red
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
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen: {}
    row: 0
    col: 12
    width: 10
    height: 13
  - title: cost - month
    name: cost - month
    model: central_projects
    explore: food_cost_new
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [food_cost_new.scope, food_cost_new.parameter, food_cost_new.rank_scope,
      food_cost_new.rank_para, food_cost_new.l7d_avg, food_cost_new.l7d_sum, food_cost_new.l7d_14d_avg,
      food_cost_new.l7d_14d_sum, food_cost_new.l14d_21d_avg, food_cost_new.l14d_21d_sum,
      food_cost_new.l21d_28d_avg, food_cost_new.l21d_28d_sum, food_cost_new.Last_Month_avg,
      food_cost_new.Last_Month_sum, food_cost_new.MTD_avg, food_cost_new.MTD_sum]
    filters:
      food_cost_new.menu_date: before 0 minutes ago
      food_cost_new.vendor_name: "%SL -%,-SL - Hamburg"
    sorts: [food_cost_new.rank_scope, food_cost_new.rank_para]
    limit: 5000
    dynamic_fields: [{category: table_calculation, expression: 'if(${food_cost_new.MTD_avg}>0,${food_cost_new.MTD_avg},${food_cost_new.MTD_sum})',
        label: MTD, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: mtd, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.Last_Month_avg}>0,${food_cost_new.Last_Month_avg},${food_cost_new.Last_Month_sum})',
        label: Last Month, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: last_month, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l7d_avg}>0,${food_cost_new.l7d_avg},${food_cost_new.l7d_sum})',
        label: L7D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l7d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l7d_14d_avg}>0,${food_cost_new.l7d_14d_avg},${food_cost_new.l7d_14d_sum})',
        label: 'L8-L14D ', value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l8_l14d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l14d_21d_avg}>0,${food_cost_new.l14d_21d_avg},${food_cost_new.l14d_21d_sum})',
        label: L15-L21D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l15_l21d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l21d_28d_avg}>0,${food_cost_new.l21d_28d_avg},${food_cost_new.l21d_28d_sum})',
        label: L22-L28D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l22_l28d, _type_hint: number}]
    hidden_fields: [food_cost_new.l7d_avg, food_cost_new.l7d_sum, food_cost_new.l7d_14d_avg,
      food_cost_new.l7d_14d_sum, food_cost_new.l14d_21d_avg, food_cost_new.l14d_21d_sum,
      food_cost_new.l21d_28d_avg, food_cost_new.l21d_28d_sum, food_cost_new.Last_Month_avg,
      food_cost_new.Last_Month_sum, food_cost_new.MTD_avg, food_cost_new.MTD_sum,
      food_cost_new.rank_scope, food_cost_new.rank_para]
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
    style|mtd: black_red
    style|last_month: black_red
    label|l7d: ''
    heading|l7d: Week Split
    style|l7d: black_red
    heading|l8_l14d: Week Split
    style|l8_l14d: black_red
    heading|l15_l21d: Week Split
    style|l15_l21d: black_red
    heading|l22_l28d: Week Split
    style|l22_l28d: black_red
    style|l7d_copy: black_red
    style|food_cost_new.l14d_21d_avg: black_red
    style|food_cost_new.l14d_21d_sum: black_red
    style|food_cost_new.l21d_28d_avg: black_red
    style|food_cost_new.l21d_28d_sum: black_red
    style|food_cost_new.Last_Month_avg: black_red
    style|food_cost_new.Last_Month_sum: black_red
    style|food_cost_new.MTD_avg: black_red
    style|food_cost_new.MTD_sum: black_red
    style|l8_l14d_copy: black_red
    style|l15_l21d_1: black_red
    style|mtd_copy: black_red
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
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen: {}
    row: 0
    col: 2
    width: 10
    height: 13
  - title: cost - month - kitchen
    name: cost - month - kitchen
    model: central_projects
    explore: food_cost_new
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [food_cost_new.vendor_name, food_cost_new.scope, food_cost_new.parameter,
      food_cost_new.l7d_avg, food_cost_new.l7d_sum, food_cost_new.l7d_14d_avg, food_cost_new.l7d_14d_sum,
      food_cost_new.l14d_21d_avg, food_cost_new.l14d_21d_sum, food_cost_new.l21d_28d_avg,
      food_cost_new.l21d_28d_sum, food_cost_new.Last_Month_avg, food_cost_new.Last_Month_sum,
      food_cost_new.MTD_avg, food_cost_new.MTD_sum, food_cost_new.rank_scope, food_cost_new.rank_para]
    filters:
      food_cost_new.menu_date: before 0 minutes ago
      food_cost_new.vendor_name: "%SL -%,-SL - Hamburg"
    sorts: [food_cost_new.vendor_name, food_cost_new.rank_scope, food_cost_new.rank_para]
    limit: 5000
    dynamic_fields: [{category: table_calculation, expression: 'if(${food_cost_new.MTD_avg}>0,${food_cost_new.MTD_avg},${food_cost_new.MTD_sum})',
        label: MTD, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: mtd, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.Last_Month_avg}>0,${food_cost_new.Last_Month_avg},${food_cost_new.Last_Month_sum})',
        label: Last Month, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: last_month, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l7d_avg}>0,${food_cost_new.l7d_avg},${food_cost_new.l7d_sum})',
        label: L7D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l7d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l7d_14d_avg}>0,${food_cost_new.l7d_14d_avg},${food_cost_new.l7d_14d_sum})',
        label: 'L8-L14D ', value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l8_l14d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l14d_21d_avg}>0,${food_cost_new.l14d_21d_avg},${food_cost_new.l14d_21d_sum})',
        label: L15-L21D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l15_l21d, _type_hint: number}, {category: table_calculation,
        expression: 'if(${food_cost_new.l21d_28d_avg}>0,${food_cost_new.l21d_28d_avg},${food_cost_new.l21d_28d_sum})',
        label: L22-L28D, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: l22_l28d, _type_hint: number}]
    hidden_fields: [food_cost_new.l7d_avg, food_cost_new.l7d_sum, food_cost_new.l7d_14d_avg,
      food_cost_new.l7d_14d_sum, food_cost_new.l14d_21d_avg, food_cost_new.l14d_21d_sum,
      food_cost_new.l21d_28d_avg, food_cost_new.l21d_28d_sum, food_cost_new.Last_Month_avg,
      food_cost_new.Last_Month_sum, food_cost_new.MTD_avg, food_cost_new.MTD_sum,
      food_cost_new.rank_scope, food_cost_new.rank_para]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: false
    headerFontSize: 14
    bodyFontSize: 11
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
    label|food_cost_new.vendor_name: Vendor Name
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    label|food_cost_new.scope: Scope
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: Parameter
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|mtd: MTD
    heading|mtd: ''
    style|mtd: black_red
    reportIn|mtd: '1'
    unit|mtd: ''
    comparison|mtd: no_variance
    switch|mtd: false
    var_num|mtd: true
    var_pct|mtd: false
    label|last_month: Last Month
    heading|last_month: ''
    style|last_month: black_red
    reportIn|last_month: '1'
    unit|last_month: ''
    comparison|last_month: no_variance
    switch|last_month: false
    var_num|last_month: true
    var_pct|last_month: false
    label|l7d: ''
    heading|l7d: Week Split
    style|l7d: black_red
    reportIn|l7d: '1'
    unit|l7d: ''
    comparison|l7d: no_variance
    switch|l7d: false
    var_num|l7d: true
    var_pct|l7d: false
    label|l8_l14d: 'L8-L14D '
    heading|l8_l14d: Week Split
    style|l8_l14d: black_red
    reportIn|l8_l14d: '1'
    unit|l8_l14d: ''
    comparison|l8_l14d: no_variance
    switch|l8_l14d: false
    var_num|l8_l14d: true
    var_pct|l8_l14d: false
    label|l15_l21d: L15-L21D
    heading|l15_l21d: Week Split
    style|l15_l21d: black_red
    reportIn|l15_l21d: '1'
    unit|l15_l21d: ''
    comparison|l15_l21d: no_variance
    switch|l15_l21d: false
    var_num|l15_l21d: true
    var_pct|l15_l21d: false
    label|l22_l28d: L22-L28D
    heading|l22_l28d: Week Split
    style|l22_l28d: black_red
    reportIn|l22_l28d: '1'
    unit|l22_l28d: ''
    comparison|l22_l28d: no_variance
    switch|l22_l28d: false
    var_num|l22_l28d: true
    var_pct|l22_l28d: false
    style|l7d_copy: black_red
    style|food_cost_new.l14d_21d_avg: black_red
    style|food_cost_new.l14d_21d_sum: black_red
    style|food_cost_new.l21d_28d_avg: black_red
    style|food_cost_new.l21d_28d_sum: black_red
    style|food_cost_new.Last_Month_avg: black_red
    style|food_cost_new.Last_Month_sum: black_red
    style|food_cost_new.MTD_avg: black_red
    style|food_cost_new.MTD_sum: black_red
    style|l8_l14d_copy: black_red
    style|l15_l21d_1: black_red
    style|mtd_copy: black_red
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
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen: {}
    row: 13
    col: 2
    width: 10
    height: 161
  - title: cost - daily - kitchen
    name: cost - daily - kitchen
    model: central_projects
    explore: food_cost_new
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [food_cost_new.vendor_name, food_cost_new.scope, food_cost_new.parameter,
      food_cost_new.value_sum, food_cost_new.value_avg, food_cost_new.menu_date_lw,
      food_cost_new.rank_scope, food_cost_new.rank_para]
    pivots: [food_cost_new.menu_date_lw]
    filters:
      food_cost_new.menu_date: 8 days
      food_cost_new.vendor_name: "%SL -%,-SL - Hamburg"
    sorts: [food_cost_new.menu_date_lw desc, food_cost_new.vendor_name, food_cost_new.rank_scope,
      food_cost_new.rank_para]
    limit: 5000
    dynamic_fields: [{category: table_calculation, expression: 'if(${food_cost_new.value_avg}>0,${food_cost_new.value_avg},${food_cost_new.value_sum})',
        label: Value, value_format: "#,##0", value_format_name: !!null '', _kind_hint: measure,
        table_calculation: value, _type_hint: number}]
    filter_expression: "${food_cost_new.menu_date}< add_days(-1,now())\n"
    hidden_fields: [food_cost_new.value_sum, food_cost_new.value_avg, food_cost_new.rank_scope,
      food_cost_new.rank_para]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: false
    headerFontSize: 14
    bodyFontSize: 11
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
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|food_cost_new.vendor_name: "-"
    heading|food_cost_new.vendor_name: ''
    hide|food_cost_new.vendor_name: false
    label|food_cost_new.scope: "-"
    heading|food_cost_new.scope: ''
    hide|food_cost_new.scope: false
    label|food_cost_new.parameter: "-"
    heading|food_cost_new.parameter: ''
    hide|food_cost_new.parameter: false
    subtotalDepth: '1'
    label|value: Last Week
    heading|value: Last Week
    style|value: black_red
    reportIn|value: '1'
    unit|value: ''
    comparison|value: no_variance
    switch|value: false
    var_num|value: false
    var_pct|value: false
    label|food_cost_new.value_sum: ''
    heading|food_cost_new.value_sum: Last Week
    style|food_cost_new.value_sum: black_red
    reportIn|food_cost_new.value_sum: '1'
    unit|food_cost_new.value_sum: ''
    comparison|food_cost_new.value_sum: no_variance
    switch|food_cost_new.value_sum: false
    var_num|food_cost_new.value_sum: false
    var_pct|food_cost_new.value_sum: false
    heading|food_cost_new.value_avg: Last Week
    style|food_cost_new.value_avg: black_red
    label|food_cost_new.l7d: L7D
    heading|food_cost_new.l7d: ''
    style|food_cost_new.l7d: black_red
    reportIn|food_cost_new.l7d: '1'
    comparison|food_cost_new.l7d: no_variance
    switch|food_cost_new.l7d: false
    var_num|food_cost_new.l7d: false
    var_pct|food_cost_new.l7d: false
    label|food_cost_new.l7d_14d: L7 - L14D
    style|food_cost_new.l7d_14d: black_red
    label|food_cost_new.l14d_21d: L14 - L21D
    style|food_cost_new.l14d_21d: black_red
    label|food_cost_new.l21d_28d: L21 - L28D
    style|food_cost_new.l21d_28d: black_red
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
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen: {}
    row: 13
    col: 12
    width: 11
    height: 161
  - name: Stanza Living
    type: text
    title_text: Stanza
    subtitle_text: Level
    body_text: ''
    row: 0
    col: 0
    width: 3
    height: 13
  - name: Kitchen
    type: text
    title_text: Kitchen
    subtitle_text: Level
    row: 13
    col: 0
    width: 2
    height: 16
