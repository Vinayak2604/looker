view: moved_in_residents {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    select city, micromarket, residence, max(moved_in_residents) as residents
    from looker_demo.derived_user_preference_rating
    where {% condition date %} date {% endcondition %}
    group by 1,2,3 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    primary_key: yes
    type: string
    sql: ${TABLE}.residence ;;
  }

  parameter: date {
    type: date
    convert_tz: no
  }

  measure: moved_in_residents {
    type: sum
    sql: ${TABLE}.residents ;;
  }
}
