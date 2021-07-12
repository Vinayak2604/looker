view: derived_user_engagement_mom_comparison {
  sql_table_name: stanza.derived_user_engagement_mom_comparison ;;

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

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: score1 {
    type: number
    sql: ${TABLE}.score1 ;;
  }

  dimension: score_valuation {
    type: string
    sql: ${TABLE}.score_valuation ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: students {
    type: count_distinct
    sql: ${student_id} ;;
  }


  measure: above_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Above' then ${student_id} end ;;
  }


  measure: same_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Same' then ${student_id} end ;;
  }



  measure: below_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Below' then ${student_id} end ;;
  }
}
