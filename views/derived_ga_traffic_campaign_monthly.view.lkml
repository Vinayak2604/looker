view: derived_ga_traffic_campaign_monthly {
  derived_table: {
    sql: select *
      from stanza.derived_ga_traffic_campaign_monthly
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

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: S21 {
    type: sum
    sql: case when lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end and lower(${campaign} like '%s21%')
    ;;
  }

  measure: branding {
    type: sum
    sql: case when lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end and lower(${campaign} like '%branding%')
      ;;
  }



}
