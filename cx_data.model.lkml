connection: "beta"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# view: test {
#   extends: [derived_meal_feedback]

#   dimension: student_id {
#     type: string
#     sql: ${user_id} ;;
#   }

#   dimension: avg_rating1 {
#     type: number
#     sql: ${avg_rating} ;;
#   }

#   dimension: city_1 {
#     type: string
#     sql: ${city} ;;
#   }

#   dimension: gender_1 {
#     type: string
#     sql: ${gender} ;;
#   }

#   dimension: hometown_1 {
#     type: string
#     sql: ${hometown} ;;
#   }

#   measure: promoter_flag {
#     type: number
#     sql: case when ${avg_rating} >= 4 and ${avg_rating} <= 5 then 1 else 0 end ;;
#   }

#   measure: detractor_flag {
#     type: number
#     sql: case when ${avg_rating} >= 1 and ${avg_rating} < 3 then 1 else 0 end ;;
#   }

#   measure: total_promoters {
#     type: sum
#     sql: case when ${avg_rating} >= 4 and ${avg_rating} <= 5 then 1 else 0 end ;;

#   }

#   measure: total_detractors {
#     type: sum
#     sql: case when ${avg_rating} >= 1 and ${avg_rating} < 3 then 1 else 0 end ;;

#   }

#   measure: feedback_users_1 {
#     type: sum
#     sql:  case when ${avg_rating} >= 0 and ${avg_rating} <= 5 then 1 else 0 end ;;

#   }


# }


explore: all_level {
    # sql_where:${derived_residence_attributes.date_date} = curdate()  ;;
  }

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
