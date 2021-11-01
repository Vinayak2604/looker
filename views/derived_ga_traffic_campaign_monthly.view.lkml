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

  dimension: branding_drill {
    type: string
    sql:case when lower(${campaign}) like '%branding%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${source} end ;;
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

  measure: traffic {
    type: sum
    sql: case when lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end ;;
  }

  measure: S21 {
    type: sum
    sql:case when lower(${campaign}) like '%s21%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;
  }

  measure: branding {
    type: sum
    sql: case when lower(${campaign}) like '%branding%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;

  }

  measure: performance {
    type: sum
    sql:case when lower(${campaign}) like '%performance%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;
  }

  measure: performance_and_s21{
    type: sum
    sql:case when (lower(${campaign}) like '%s21%' or lower(${campaign}) like '%performance%') and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;
  }



}