connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_user_engagement_metrics  {
  cancel_grouping_fields: [derived_user_engagement_metrics.student_id,derived_user_engagement_metrics.total_complaints1_copy,derived_user_engagement_metrics.total_vas_orders_copy]
}
