connection: "redshift"

include: "/views/*.view.lkml"
include: "/food_inventory/*.view.lkml"
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
}
explore: derived_food_invoice {


}

explore: derived_food_cost {}
