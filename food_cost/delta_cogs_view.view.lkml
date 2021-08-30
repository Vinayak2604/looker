view: delta_cogs_view {
derived_table: {
  explore_source: derived_food_cost {
    column: delta_ratio_cogs {}
    column: vendor_name {}
    column: menu_date {}
    # expression_custom_filter: ${derived_food_cost.menu_date}<add_days(-7,now());;
  }
}
dimension: delta_ratio_cogs {
  type: number
}
dimension: vendor_name {}
dimension: menu_date {
  type: date
}
}
