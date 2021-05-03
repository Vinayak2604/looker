- dashboard: test123
  title: test123
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Residence Level
    name: Residence Level
    model: residence_dashboard_model
    explore: new_dashboard_test
    type: looker_grid
    fields: [new_dashboard_test.city, new_dashboard_test.micromarket, new_dashboard_test.residence,
      new_dashboard_test.consumed_meals, new_dashboard_test.rated_meals_per, new_dashboard_test.preference_users_per,
      new_dashboard_test.preference_meals_per, new_dashboard_test.order_users_per,
      new_dashboard_test.aov, new_dashboard_test.rated_orders_per]
    sorts: [new_dashboard_test.city]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      new_dashboard_test.rated_meals_per: Rated Meals
      new_dashboard_test.preference_users_per: Preference Users
      new_dashboard_test.preference_meals_per: Preference Meals
      new_dashboard_test.order_users_per: Order Users
      new_dashboard_test.aov: AOV
      new_dashboard_test.rated_orders_per: Rated Orders
    defaults_version: 1
    listen:
      Date: new_dashboard_test.date
      Meal Type: new_dashboard_test.meal_type
    row: 0
    col: 0
    width: 24
    height: 16
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Meal Type
    title: Meal Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: residence_dashboard_model
    explore: new_dashboard_test
    listens_to_filters: []
    field: new_dashboard_test.meal_type
