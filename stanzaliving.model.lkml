connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_residence_attributes {
  join: derived_b2c_bookings{
    relationship: one_to_many
    type: left_outer
    sql_on: ${derived_residence_attributes.residence_id} = ${derived_b2c_bookings.residence_id};;
    sql_where:${derived_residence_attributes.date_date} = curdate()  ;;
  }
#
  # join: users {
  #   relationship: many_to_one
  #   sql_on: ${users.id} = ${orders.user_id} ;;
  # }
}
