connection: "redshift"

include: "/views/*.view.lkml"
include: "/food_inventory/*.view.lkml"
include: "/food_cost/*.view.lkml"
include: "/food_invoice/*.view.lkml"
include: "food_test.dashboard.lookml"
include: "cost_test.dashboard.lookml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore:  derived_food_inventory {
join: top_brands{
  sql_on: ${derived_food_inventory.location_name} = ${top_brands.property_name} ;;
  relationship: many_to_many
}

join: blended_orders {
  sql_on: ${derived_food_inventory.location_name} = ${blended_orders.kitchen} ;;
  relationship: many_to_many
}

join: weighted_avg {
  sql_on: ${derived_food_inventory.location_name} = ${weighted_avg.location} and ${derived_food_inventory.item_name} = ${weighted_avg.item} ;;
  relationship: one_to_one
}

join: open_pos {
  sql_on: ${derived_food_inventory.pm}=${open_pos.pk};;
  relationship: one_to_one
  type: left_outer
}

join: next_week_items {
  sql_on: ${derived_food_inventory.location_name}=${next_week_items.location} and ${derived_food_inventory.item_name}=${next_week_items.item_name} ;;
  relationship: one_to_one
  type: left_outer

}
}
explore: derived_food_invoice {}

explore: derived_food_cost {}

explore: vas_orders {}

explore: inventory_ledger {}

explore: next_week_items {}

explore: vendor_prices {}

explore: po_invoice{}

explore: food_cost_new {}

explore: food_vas_orders {}

explore: dish_level_vas {}

explore: Invoice_details {}

explore: food_cost_items {}

explore: item_price_comparison {}

explore: food_cost_items_dt {}

explore: delta_combined {}

explore: kitchen_consumption {}

explore: item_subcategory_price_comparison {}

explore: l1_rejected_pos {}

explore: l2_rejected_pos {}

explore: inventory_v2 {}

explore: price_variance {}

explore: fps {}

explore: price_variance_custom_dates {}
