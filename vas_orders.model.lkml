connection: "beta"


include: "/views/*.view.lkml"
include: "derived_vas_bucket_table.view.lkml" # include all views in the views/ folder in this project
include: "derived_vas_aov_bucket.view.lkml"
include: "seo_data_calculation.view.lkml"
include: "vas_order_graph.view.lkml"
include: "vas_ageing_order_bucket.view.lkml"
include: "vas_ageing_aov_bucket.view.lkml"
include: "vas_ageing_order_bucket_cm.view.lkml"
include: "vas_ageing_aov_bucket_cm.view.lkml"
include: "vas_order_mrr_graph.view.lkml"
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

explore: derived_vas_bucket_table {}
explore: derived_vas_aov_bucket {}
explore: seo_data {}
explore: seo_data_graph {}
explore: seo_data_calculation {}
explore: vas_order_graph {}
explore: vas_ageing_order_bucket {}
explore: vas_ageing_aov_bucket {}
explore: vas_ageing_aov_bucket_cm {}
explore: vas_ageing_order_bucket_cm {}
explore: vas_order_mrr_graph {}
explore: vas_ageing_line_graph {}
explore: vas_orders_per_day {}
