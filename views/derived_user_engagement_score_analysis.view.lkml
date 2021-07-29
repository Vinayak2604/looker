view: derived_user_engagement_score_analysis {
  sql_table_name: stanza.derived_user_engagement_score_analysis ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: m1_above {
    type: number
    sql: ${TABLE}.m1_above ;;
    hidden: yes
  }

  dimension: m1_less {
    type: number
    sql: ${TABLE}.m1_less ;;
    hidden: yes
  }

  dimension: m2_above {
    type: number
    sql: ${TABLE}.m2_above ;;
    hidden: yes
  }

  dimension: m2_less {
    type: number
    sql: ${TABLE}.m2_less ;;
    hidden: yes
  }

  dimension: m3_above {
    type: number
    sql: ${TABLE}.m3_above ;;
    hidden: yes
  }

  dimension: m3_less {
    type: number
    sql: ${TABLE}.m3_less ;;
    hidden: yes
  }

  dimension: m4_above {
    type: number
    sql: ${TABLE}.m4_above ;;
    hidden: yes
  }

  dimension: m4_less {
    type: number
    sql: ${TABLE}.m4_less ;;
    hidden: yes
  }

  dimension: m5_above {
    type: number
    sql: ${TABLE}.m5_above ;;
    hidden: yes
  }

  dimension: m5_less {
    type: number
    sql: ${TABLE}.m5_less ;;
    hidden: yes
  }

  dimension: m6_above {
    type: number
    sql: ${TABLE}.m6_above ;;
    hidden: yes
  }

  dimension: m6_less {
    type: number
    sql: ${TABLE}.m6_less ;;
    hidden: yes
  }

  dimension: m7_above {
    type: number
    sql: ${TABLE}.m7_above ;;
    hidden: yes
  }

  dimension: m7_less {
    type: number
    sql: ${TABLE}.m7_less ;;
    hidden: yes
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
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


  measure: above_m1 {
    type: count_distinct
    sql: case when ${m1_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m2 {
    type: count_distinct
    sql: case when ${m2_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m3 {
    type: count_distinct
    sql: case when ${m3_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m4 {
    type: count_distinct
    sql: case when ${m4_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m5 {
    type: count_distinct
    sql: case when ${m5_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m6 {
    type: count_distinct
    sql: case when ${m6_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: above_m7 {
    type: count_distinct
    sql: case when ${m7_above} > 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m1 {
    type: count_distinct
    sql: case when ${m1_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m2 {
    type: count_distinct
    sql: case when ${m2_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m3 {
    type: count_distinct
    sql: case when ${m3_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m4 {
    type: count_distinct
    sql: case when ${m4_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m5 {
    type: count_distinct
    sql: case when ${m5_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m6 {
    type: count_distinct
    sql: case when ${m6_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }

  measure: less_m7 {
    type: count_distinct
    sql: case when ${m7_less} < 0 then (${student_id}||${type}||${category}) end ;;
  }


}
