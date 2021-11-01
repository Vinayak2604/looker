view: derived_ga_weekly_overall {
  derived_table: {
    sql: select *
      from stanza.derived_ga_traffic_monthly
       ;;
  }



  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: traffic {
    type: number
    sql: ${users} ;;
  }


}
