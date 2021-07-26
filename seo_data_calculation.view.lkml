view: seo_data_calculation {
  derived_table: {
    sql: select keyword,  business_category,  kw_category,  city_name,  location, max(case when {% condition month1 %}month {% endcondition %}then score end) as search_month1,
    max(case when {% condition month2 %}month{% endcondition %} then score end) as search_month2
         from looker_demo.seo_data_graph
         where  ({% condition month1 %} month {% endcondition %}
          or {% condition month2 %} month {% endcondition %})
          group by 1,2,3,4,5
          ;;
  }



  parameter: month1 {
    type: string
  }


  parameter: month2 {
    type: string
  }



  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: business_category {
    type: string
    sql: ${TABLE}.business_category ;;
  }

  dimension: kw_category {
    type: string
    sql: ${TABLE}.kw_category ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: search_month1 {
    type: number
    sql: ${TABLE}.search_month1 ;;
    # hidden: yes
  }

  dimension: search_month2 {
    type: number
    sql: ${TABLE}.search_month2 ;;
    # hidden: yes
  }

  dimension: difference {
    type: number
    sql: ${search_month2} - ${search_month1} ;;
  }

  measure: total_keywords {
    type: count_distinct
    sql: case when search_month2 >0 then ${keyword} end;;
  }

  measure: total_increased_keywords {
    type: count_distinct
    sql: case when ${difference} >= 0 then ${keyword} end;;
  }

  measure: total_increased_nongenric_keywords {
    type: count_distinct
    sql: case when ${difference} >= 0 and ${kw_category} != 'Generic' then ${keyword} end;;
  }

  measure: total_increased_100_keywords {
    type: count_distinct
    sql: case when ${search_month2} >= 100 and ${difference} >= 0  and ${kw_category} != 'Generic' then ${keyword} end;;
  }

  measure: first_month_data {
    type: number
    sql: ${search_month1} ;;
  }

  measure: second_month_data {
    type: sum
    sql:  ${search_month2} ;;
  }

  measure: total_search_month2 {
    type: number
    sql:  nullif((${second_month_data} - ${first_month_data}),0) / ${first_month_data} end ;;
    value_format: "0%"
  }



  measure: total_increased_100_keywords_cities {
    type: count_distinct
    sql: case when ${search_month2} >= 100 and ${kw_category} != 'Generic' then ${city_name} end;;
  }

  measure: total_increased_100_keywords_cluster {
    type: count_distinct
    sql: case when ${search_month2} >= 100 and ${kw_category} != 'Generic' and  ${difference} >=0  then ${location} end;;
  }

}
