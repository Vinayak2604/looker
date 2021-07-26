view: seo_data_graph {
  sql_table_name: looker_demo.seo_data_graph ;;


  dimension: key {
    primary_key: yes
    type: string
    hidden: yes
    sql: concat(${TABLE}.keyword,' ', ${TABLE}.month) ;;

    }

  dimension: business_category {
    type: string
    sql: ${TABLE}.business_category ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: kw_category {
    type: string
    sql: ${TABLE}.kw_category ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  measure: count {
    type: count
    drill_fields: [city_name]
  }

  measure: total_Keyword_searched {
    type: sum
    sql: ${score} ;;
    value_format: "0"
  }
}
