connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: user_scorecard1 {
  join: derived_user_engagement_metrics {
    relationship: one_to_one
    type: left_outer
    sql_on: ${user_scorecard1.user_id} = ${derived_user_engagement_metrics.student_id} AND ${user_scorecard1.date} = ${user_scorecard1.date} ;;
    # sql_where:  ;;
  }
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
}
