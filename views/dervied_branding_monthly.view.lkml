view: dervied_branding_monthly {
  derived_table: {
    sql: select *
      from stanza.dervied_branding_monthly
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

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: referralpath {
    type: string
    sql: ${TABLE}.referralpath ;;
  }

  dimension: landingpagepath {
    type: string
    sql: ${TABLE}.landingpagepath ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: traffic {
    type: sum
    sql: ${TABLE}.users ;;
  }



}
