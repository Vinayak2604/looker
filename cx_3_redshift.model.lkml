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

explore: derived_csat_metrics {

  join: complaint_ranking {
    type: inner
    sql_on: ${complaint_ranking.complaint} = ${derived_csat_metrics.complain_cat} ;;
    relationship: many_to_one
  }
}

view: complaint_ranking {
  derived_table: {
    sql:
          SELECT complain_cat, count(*) as count, RANK() OVER(ORDER BY COUNT(*) DESC) as rank
FROM stanza.derived_csat_metrics
where  created_time >= current_date -30
GROUP BY 1 ;;
}

  dimension: complaint {
    type: string
    primary_key: yes
    sql: ${TABLE}.complain_cat ;;
  }

  dimension: rank_raw {
    type: number
    sql: ${TABLE}.rank ;;
  }


  dimension: rank {
    type: string
    sql: CASE WHEN ${rank_raw} <= 5 THEN RIGHT('00' + CAST(${rank_raw} AS VARCHAR), 2) ELSE 'Other' END;;
  }

  dimension: rank_and_complaint {
    type: string
    sql: CASE WHEN ${rank} = 'Other' THEN 'Other' ELSE  ${complaint} END;;
  }
}
