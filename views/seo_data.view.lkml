view: seo_data {
  sql_table_name: looker_demo.seo_data ;;

  dimension: apr_20 {
    type: number
    sql: ${TABLE}.apr_20 ;;
  }

  dimension: apr_21 {
    type: number
    sql: ${TABLE}.apr_21 ;;
  }

  dimension: aug_20 {
    type: number
    sql: ${TABLE}.aug_20 ;;
  }

  dimension: business_category {
    type: string
    sql: ${TABLE}.business_category ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: dec_20 {
    type: number
    sql: ${TABLE}.dec_20 ;;
  }

  dimension: feb_21 {
    type: number
    sql: ${TABLE}.feb_21 ;;
  }

  dimension: jan_21 {
    type: number
    sql: ${TABLE}.jan_21 ;;
  }

  dimension: jul_20 {
    type: number
    sql: ${TABLE}.jul_20 ;;
  }

  dimension: jun_20 {
    type: number
    sql: ${TABLE}.jun_20 ;;
  }

  dimension: june_21 {
    type: number
    sql: ${TABLE}.june_21 ;;
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

  dimension: mar_20 {
    type: number
    sql: ${TABLE}.mar_20 ;;
  }

  dimension: mar_21 {
    type: number
    sql: ${TABLE}.mar_21 ;;
  }

  dimension: may_20 {
    type: number
    sql: ${TABLE}.may_20 ;;
  }

  dimension: may_21 {
    type: number
    sql: ${TABLE}.may_21 ;;
  }

  dimension: nov_20 {
    type: number
    sql: ${TABLE}.nov_20 ;;
  }

  dimension: oct_20 {
    type: number
    sql: ${TABLE}.oct_20 ;;
  }

  dimension: sep_20 {
    type: number
    sql: ${TABLE}.sep_20 ;;
  }

  measure: count {
    type: count
    drill_fields: [city_name]
  }

  measure: mar_20_avg {
    type: average
    sql: ${mar_20} ;;
  }

  measure: mar_21_avg {
    type: average
    sql: ${mar_21} ;;
  }

  measure: may_20_avg {
    type: average
    sql: ${may_20} ;;
  }

  measure: may_21_avg {
    type: average
    sql: ${may_21} ;;
  }

  measure: nov_20_avg {
    type: average
    sql: ${nov_20} ;;
  }

  measure: oct_20_avg {
    type: average
    sql: ${oct_20} ;;
  }

  measure: sep_20_avg {
    type: average
    sql: ${sep_20} ;;
  }

  measure: dec_20_avg {
    type: average
    sql: ${dec_20} ;;
  }

  measure: feb_21_avg {
    type: average
    sql: ${feb_21} ;;
  }

  measure: jan_21_avg {
    type: average
    sql: ${jan_21} ;;
  }

  measure: jul_20_avg {
    type: average
    sql: ${jul_20} ;;
  }

  measure: jun_20_avg {
    type: average
    sql: ${jun_20} ;;
  }

  measure: june_21_avg {
    type: average
    sql: ${june_21} ;;
  }

  measure: apr_20_avg {
    type: average
    sql: ${apr_20} ;;
  }

  measure: apr_21_avg {
    type: average
    sql: ${apr_21} ;;
  }

  measure: aug_20_avg {
    type: average
    sql: ${aug_20} ;;
  }

}
