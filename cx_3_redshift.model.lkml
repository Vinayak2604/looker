connection: "redshift"

include: "/views/*.view.lkml"               # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: derived_social_media_complaints{}

# Place in `cx_3_redshift` model

# If necessary, uncomment the line below to include explore_source.

# include: "cx_3_redshift.model.lkml"

view: ranked_subcat {
  derived_table: {
    explore_source: derived_social_media_complaints {
      column: count {}
      column: sub_category {}
      column: zone4 {}
      expression_custom_filter: ${derived_social_media_complaints.sub_category}!="" AND
        ${derived_social_media_complaints.zone_}!="";;
    }
  }
  dimension: count {
    type: number
  }
  dimension: sub_category {}
  dimension: zone4 {}
}

explore: derived_csat_metrics {}
