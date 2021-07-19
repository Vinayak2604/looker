view: test_view_sanjana {
  sql_table_name: derived_site_completion_status ;;

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  measure: total_boq {
    type: count_distinct
    sql: ${TABLE}.total_boq ;;
  }


  }
