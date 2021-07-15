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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: month_number {
    type: number
    sql: ${TABLE}.month_number ;;
  }

  dimension: lowest_score {
    type: number
    sql: ${TABLE}.lowest_score ;;
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

  dimension: highest_score {
    type: number
    sql: ${TABLE}.highest_score ;;
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
    type: count_distinct
    sql: case when ${avg_score_student} <= ${lowest_score} then ${student_id} end ;;
    hidden: yes
  }

  measure: b {
    type: count_distinct
    sql: case when ${avg_score_student} < ${score_25_percentile} then ${student_id} end ;;
    hidden: yes
  }

  measure: c {
    type: count_distinct
    sql: case when ${avg_score_student} <= ${score_50_percentile} then ${student_id} end ;;
    hidden: yes
  }

  measure: d {
    type: count_distinct
    sql: case when  ${avg_score_student} <= ${score_75_percentile} then ${student_id} end ;;
    hidden: yes
  }

  measure: e {
    type: count_distinct
    sql: case when  ${avg_score_student} <= ${highest_score} then ${student_id} end ;;
    hidden: yes
  }

  measure: b_c {
    type: number
    sql: 1.00*(${c} - ${b}) / ${total_students}  ;;
    value_format: "0.0%"
    hidden: yes
  }



  measure: lowest {
    type: number
    sql: ${a}  ;;

  }

  measure: 25th_percentile {
    type: number
    sql: ${b} ;;

  }


  measure: median {
    type: number
    sql: ${c} ;;
  }


  measure: 75th_percemtile {
    type: number
    sql: ${d} ;;
  }

  measure: highest {
    type: number
    sql: ${e} ;;
  }

  measure: 0_25 {
    type: count_distinct
    sql: case when ${avg_score_student} <= ${score_25_percentile} then ${student_id} end ;;
  }

  measure: 25_50 {
    type: count_distinct
    sql: case when ${avg_score_student} > ${score_25_percentile} and ${avg_score_student} <= ${score_50_percentile} then ${student_id} end ;;
  }

  measure: 50_75 {
    type: count_distinct
    sql: case when ${avg_score_student} > ${score_50_percentile} and ${avg_score_student} <= ${score_75_percentile} then ${student_id} end ;;
  }

  measure: 75_100 {
    type: count_distinct
    sql: case when ${avg_score_student} > ${score_75_percentile} then ${student_id} end ;;
  }


  # measure: lowest {
  #   type: number
  #   sql: 1.00*${a} / ${total_students} ;;
  #   value_format: "0.0%"
  # }

  # measure: 25th_percentile {
  #   type: number
  #   sql: 1.00*${b} / ${total_students} ;;
  #   value_format: "0.0%"

  # }


  # measure: median {
  #   type: number
  #   sql: 1.00*${c} / ${total_students} ;;
  #   value_format: "0.0%"
  # }


  # measure: 75th_percemtile {
  #   type: number
  #   sql: 1.00*${d} / ${total_students} ;;
  #   value_format: "0.0%"
  # }

  # measure: highest {
  #   type: number
  #   sql: 1.00*${e} / ${total_students} ;;
  #   value_format: "0.0%"
  # }

}
