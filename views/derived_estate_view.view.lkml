view: sql_runner_query {
  derived_table: {
    sql: SELECT
        derived_meal_feedback.user_id  AS `derived_meal_feedback.user_id`,
        AVG(CASE WHEN (derived_meal_feedback.rating  >= 0) THEN derived_meal_feedback.rating  ELSE NULL END) AS `derived_meal_feedback.avg_rating`
      FROM looker_demo.derived_meal_feedback  AS derived_meal_feedback
      where derived_meal_feedback.rating  >= 0

      GROUP BY 1
      ORDER BY AVG(CASE WHEN (derived_meal_feedback.rating  >= 0) THEN derived_meal_feedback.rating  ELSE NULL END)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: derived_meal_feedback_user_id {
    type: string
    sql: ${TABLE}.`derived_meal_feedback.user_id` ;;
    primary_key: yes
  }

  dimension: derived_meal_feedback_avg_rating {
    type: number
    sql: ${TABLE}.`derived_meal_feedback.avg_rating` ;;
  }

  dimension: promoter_flag {
    type: number
    sql: case when ${derived_meal_feedback_avg_rating} >= 4 then 1 else 0 end ;;
  }

  dimension: detractor_flag {
    type: number
    sql: case when ${derived_meal_feedback_avg_rating} >= 1 and ${derived_meal_feedback_avg_rating} < 3 then 1 else 0 end ;;
  }

  measure: total_promoters {
    type: sum
    sql: ${promoter_flag} ;;
  }

  measure: total_detractors {
    type: sum
    sql: ${detractor_flag} ;;
  }

  set: detail {
    fields: [derived_meal_feedback_user_id, derived_meal_feedback_avg_rating]
  }
}
