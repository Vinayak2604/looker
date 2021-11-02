view: derived_ga_traffic_campaign_weekly {
  derived_table: {
    sql: select *
      from stanza.derived_ga_traffic_campaign_weekly
       ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: branding_drill {
    type: string
    sql:case when lower(${campaign}) like '%branding%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${source} end ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
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

  measure: traffic {
    type: sum
    sql: case when lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end ;;
  }

  measure: branding {
    type: sum
    sql: case when lower(${campaign}) like '%branding%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;

  }

  measure: performance {
    type: sum
    sql:case when lower(${campaign}) not like '%branding%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end;;
  }
}
