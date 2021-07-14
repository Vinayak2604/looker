view: derived_user_engagement_category_student {
  sql_table_name: stanza.derived_user_engagement_category_student ;;

  dimension: avg_score_category {
    type: number
    sql: ${TABLE}.avg_score_category ;;
  }

  dimension: avg_score_student {
    type: number
    sql: ${TABLE}.avg_score_student ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: month_number {
    type: number
    sql: ${TABLE}.month_number ;;
  }

  dimension: month_old {
    type: string
    sql: ${TABLE}.month_old ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  measure: scores {
    type: average
    sql: ${avg_score_category};;
  }
}
