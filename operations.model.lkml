connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# # include: "/**/*.view.lkml"                 # include all views in this project
# # include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # # Select the views that should be a part of this model,
# # # and define the joins that connect them together.

explore: derived_rent_collection {
  join: derived_payment_behaviour {
    relationship: one_to_one
    sql_on: ${derived_payment_behaviour.booking_id} = ${derived_rent_collection.booking_id} ;;
  }
}

explore: derived_utilities_water_dg
{
}
