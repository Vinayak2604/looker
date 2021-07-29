view: derived_user_engagement_score_analysis_combined {
  sql_table_name: stanza.derived_user_engagement_score_analysis_combined ;;

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

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: less {
    type: count_distinct
    sql: case when ${score} < 0 then (${student_id}||${type}||${category}) end  ;;
  }

  measure: above {
    type: count_distinct
    sql: case when ${score} > 0 then (${student_id}||${type}||${category}) end  ;;
  }


}
