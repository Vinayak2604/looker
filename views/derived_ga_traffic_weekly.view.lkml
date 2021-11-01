view: derived_ga_traffic_weekly {
  derived_table: {
    sql: select *
      from stanza.derived_ga_traffic_weekly
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

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
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

    sql: ${users} ;;
  }

  measure: direct_traffic {
    type: sum
    sql: case when lower(${medium}) = '(none)' then  ${users} end  ;;
  }

  measure: organic_traffic {
    type: sum
    sql: case when lower(${medium}) = 'organic' then  ${users} end  ;;
  }
  measure: paid_traffic {
    type: sum
    sql: case when lower(${medium}) in ('cpc', 'ppc', 'cpa', 'cpm', 'cpv', 'cpp') then  ${users} end  ;;
  }

  measure: referral_traffic {
    type: sum
    sql: case when lower(${medium}) in ('referral') then  ${users} end  ;;
  }



}
