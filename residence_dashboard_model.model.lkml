connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
include: "test123.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: new_dashboard_test {
  # sql_always_where: {% if new_dashboard_test.meal_type._is_filtered %};;
  # join: derived_user_preference_rating {
  #   relationship: many_to_many
  #   type: inner
  #   sql_on: ${derived_vas_orders.residence} = ${derived_user_preference_rating.residence} ;;
  #   sql_where: ${derived_vas_orders.dt} = ${derived_user_preference_rating.dt} ;;
  # }

  # join: moved_in_residents {
  #   relationship: many_to_many
  #   type: inner
  #   sql_on: ${derived_vas_orders.residence} = ${moved_in_residents.residence} ;;
  #   sql_where: ${derived_vas_orders.dt} = ${moved_in_residents.dt} ;;
  # }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
}
