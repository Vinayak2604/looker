view: derived_csat_metrics {
  sql_table_name: stanza.derived_csat_metrics ;;

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: complain_cat {
    type: string
    sql: ${TABLE}.complain_cat ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: created_month {
    type: string
    sql: ${TABLE}.created_month ;;
  }

  dimension_group: created_time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_time ;;
  }

  dimension: feedback {
    type: number
    sql: ${TABLE}.feedback ;;
  }

  dimension_group: forfeiture {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.forfeiture_date ;;
  }

  dimension: internal {
    type: yesno
    sql: ${TABLE}.internal ;;
  }

  dimension: merged {
    type: yesno
    sql: ${TABLE}.merged ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: ob_exit {
    type: string
    sql: ${TABLE}.ob_exit ;;
  }

  dimension_group: onboarding {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.onboarding_date ;;
  }

  dimension: ope_filter {
    type: string
    sql: ${TABLE}.ope_filter ;;
  }

  dimension: pre_movein {
    type: yesno
    sql: ${TABLE}.pre_movein ;;
  }

  dimension: reopened_ticket {
    type: yesno
    sql: ${TABLE}.reopened_ticket ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension_group: resolved {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.resolved_time ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: exclude_3_days {
    type: string
    sql: CASE
    WHEN ${TABLE}.onboarding_date IS NULL THEN NULL
    WHEN ${created_time_date} - ${onboarding_date}  >3 THEN 'Exclude 3'
    ELSE 'Only 3'
    END ;;
  }

  dimension: only_3_days {
    type: string
    sql: CASE
          WHEN ${TABLE}.onboarding_date IS NULL THEN NULL
          WHEN ${created_time_date} - ${onboarding_date}  >3 THEN '0'
          ELSE '3'
          END ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count {
    type: count
  }

  measure: count_total {
    type: count
  }


  measure: feedback_postive  {
    type: count
    filters: [feedback: "1"]
  }

  measure: feedback_negative {
    type: count
    filters: [feedback: "0"]
  }

  measure: feedback_given {
    type: count
    filters: [feedback:"NOT NULL"]

  }

  dimension: zone {
    sql: case when ${TABLE}.city_name IN ('Dehradun','Delhi') then 'North'
    else 'South' end;;

  }


  # measure: count_total_mtd {
  #   type: count
  #   filters: [created_time_month: ]
  # }


  # measure: feedback_postive_mtd  {
  #   type: count
  #   filters: [feedback: "1"]
  # }

  # measure: feedback_negative_mtd {
  #   type: count
  #   filters: [feedback: "0"]
  # }

  # measure: feedback_given_mtd {
  #   type: count
  #   filters: [feedback:"NOT NULL"]
  # }


}
