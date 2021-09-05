connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "user_engagement_pareto.view.lkml"                 # include all views in this project
include: "user_engagement_categories.view.lkml"
include: "user_engagement_categories_residence.view.lkml"
include: "user_engagement_line_segment.view.lkml"
include: "engagement_zone_view.view.lkml"
# include: "derived_vas_bucket_table.view.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_user_engagement_metrics  {}
explore: derived_user_engagement_mom_comparison {}
explore: user_engagement_pareto {}
explore: derived_user_engagement_category_student {}
explore: user_engagement_categories {}
explore: user_engagement_categories_residence {}
explore: user_engagement_line_segment {}
explore: derived_user_engagement_score_analysis {}
explore: derived_user_engagement_score_analysis_combined {}
explore: engagement_zone_view {}
explore: is_leads_bifurcation_attempted {}
explore: derived_sales_associate_performance {}
# explore: derived_vas_bucket_table {}
explore: derived_food_project {}
