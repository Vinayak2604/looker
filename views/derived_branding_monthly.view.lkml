view: derived_branding_monthly {
  derived_table: {
    sql: select *
      from stanza.derived_branding_monthly
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

  dimension: branding_source {
    type: string
    sql: case when lower(${source}) like '%facebook%' then 'Facebook'
    when lower(${source}) like '%youtube%' then 'Youtube'
    when (lower(${source}) like '%instagram%' or lower(${source}) like '%ig story%') then 'Instagram'
    when lower(${source}) like '%linkedin%' then 'LinkedIn'
    when lower(${source}) like '%social%' then 'Social' end;;
  }

  measure: traffic {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: branding {
    type: sum
    sql: case when (lower(${source}) like '%facebook%' or lower(${source}) in ('youtube','instagram','ig story','linkedin','social')) and lower(${landingpagepath}) like '%bestplacetostay%' then  ${users} end;;

  }

  measure: performance {
    type: sum
    sql:case when lower(${campaign}) not like '%brand%' and lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') and lower(${landingpagepath}) not like '%bestplacetostay%' then  ${users} end;;
  }




}
