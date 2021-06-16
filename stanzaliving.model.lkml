connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: derived_residence_attributes {
  join: derived_b2c_bookings{
    relationship: one_to_many
    type: left_outer
    sql_on: ${derived_residence_attributes.residence_id} = ${derived_b2c_bookings.residence_id};;
    sql_where:${derived_residence_attributes.date_date} = curdate()  ;;


  }
}

explore: derived_b2b_bookings {
  join: derived_b2c_bookings {
    relationship: many_to_many
    type: left_outer
    sql_on: ${derived_b2b_bookings.residence_name}= ${derived_b2c_bookings.residence};;
  }
  }

explore: all_bookings_data {
  join: derived_residence_attributes {
    relationship: one_to_many
    type: left_outer
    sql_on: ${all_bookings_data.residence}= ${derived_residence_attributes.residence};;
    sql_where:${derived_residence_attributes.date_date} = curdate() and ${derived_residence_attributes.micromarket} not like '%GMIT%' and ${derived_residence_attributes.micromarket}  not like '%bits%' and ${derived_residence_attributes.residence}  not like '%disable%' ;;


  }
}
