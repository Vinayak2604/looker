view: derived_user_engagement_category_student {
  sql_table_name: stanza.derived_user_engagement_category_student ;;

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
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

  dimension: score_25_percentile {
    type: number
    sql: ${TABLE}.score_25_percentile ;;
  }

  dimension: score_50_percentile {
    type: number
    sql: ${TABLE}.score_50_percentile ;;
  }

  dimension: score_75_percentile {
    type: number
    sql: ${TABLE}.score_75_percentile ;;
  }

  dimension: avg_score_student {
    type: number
    sql: ${TABLE}.avg_score_student ;;
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
    sql: ${score};;
    value_format: "0.0%"
  }

  measure: total_students {
    type: count_distinct
    sql: ${student_id};;
  }


  measure: a {
    type: number
    sql: '0.00%' ;;
  }


  measure: b {
    type: count_distinct
    sql: case when ${avg_score_student} <= ${score_25_percentile} then ${student_id} end ;;
  }

  measure: c {
    type: count_distinct
    sql: case when ${avg_score_student} < ${score_50_percentile} then ${student_id} end ;;
  }

  measure: d {
    type: count_distinct
    sql: case when  ${avg_score_student} <= ${score_75_percentile} then ${student_id} end ;;
  }

  measure: e {
    type: number
    sql:  '100%' ;;
  }



  measure: below_25_percentile {
    type: number
    sql: 1.00*nullif(${a},0) / ${total_students} ;;
    value_format: "0.0%"
  }

  measure: 25_50_percentile {
    type: number
    sql: 1.00*nullif(${b},0) / ${total_students} ;;
    value_format: "0.0%"
  }


  measure: 50_percentile {
    type: number
    sql: 1.00*nullif(${c},0) / ${total_students} ;;
    value_format: "0.0%"
  }


  measure: 50_75_percentile {
    type: number
    sql: 1.00*nullif(${d},0) / ${total_students} ;;
    value_format: "0.0%"
  }

  measure: above_75_percentile {
    type: number
    sql: 1.00*nullif(${e},0) / ${total_students} ;;
    value_format: "0.0%"
  }

}
