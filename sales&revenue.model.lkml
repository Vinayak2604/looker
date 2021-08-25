connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
  explore: cac_budget {
    join: cac_derived{
    relationship: one_to_many
    type: left_outer
    sql_on: ${cac_derived.Subcategory}=${cac_budget.Subcategory} and ${cac_derived.micromarket}=${cac_budget.micromarket};;
      }
}

  explore: pre_bookings {
    join: full_bookings{
    relationship: one_to_one
    type: left_outer
    sql_on: ${full_bookings.created_at_date}=${pre_bookings.created_at_date} and ${full_bookings.residence}=${pre_bookings.residence};;
      }
  }

  explore: acq_cost {
    join: derived_cac_budget{
      relationship: many_to_one
      type: full_outer
      sql_on: ${acq_cost.micromarket}=${derived_cac_budget.micromarket} ;;
    }}

  explore: derived_inventory_pricing {
    join: derived_sku_pricing {
      relationship: many_to_one
      type: left_outer
      sql_on: ${derived_sku_pricing.micromarket}=${derived_inventory_pricing.micro_market} ;;
    }
  }
  # explore: derived_sku_pricing {
  #   join: derived_inventory_pricing {
  #     relationship: one_to_many
  #     type: left_outer
  #     sql_on: ${derived_inventory_pricing.house}=${derived_sku_pricing.residence} ;;
  #   }
  # }


#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
