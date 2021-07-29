connection: "beta"

include: "/p1_reports/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_sales_summary {
  # join: bookings_prebookings {
  #   relationship: one_to_many
  #   sql_on: ${derived_sales_summary.residence_id} = ${bookings_prebookings.residence_id} ;;
  # }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
}

explore: bookings_prebookings {}
