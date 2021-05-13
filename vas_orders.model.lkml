connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_vas_orders {

  join: moved_in_residents {
    relationship: one_to_many
    type: inner
    sql_on: ${derived_vas_orders.residence} = ${moved_in_residents.residence};;
    sql_where: ${derived_vas_orders.dt} = ${moved_in_residents.dt} ;;
  }
}
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
