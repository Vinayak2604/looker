connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: moved_in_residents {
  join: derived_user_preference_rating {
    relationship: many_to_many
    type: inner
    sql_on: ${moved_in_residents.residence} = ${derived_user_preference_rating.residence};;
  }
  }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
