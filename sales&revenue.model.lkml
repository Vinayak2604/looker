connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
  explore: cac_derived {

   }

  explore: pre_bookings {
    join: full_bookings{
    relationship: one_to_many
    type: left_outer
    sql_on: ${full_bookings.created_at_date}=${pre_bookings.created_at_date} and ${full_bookings.residence}=${pre_bookings.residence};;
      }
  }

#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
