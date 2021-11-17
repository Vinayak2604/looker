view: moved_in_residents {
  # sql_table_name: looker_demo.derived_user_preference_rating ;;
  derived_table: {
    sql:
    select distinct  date, city, micromarket, residence, user_id as residents
    from looker_demo.derived_user_preference_rating ;;
  }

  # dimension: pm {
  #   primary_key: yes
  #   type: string
  #   sql: concat(${TABLE}.date,'||',${city},'||',${micromarket},'||'${residence};;
  #   hidden: yes
  # }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: dt {
    type: string
    sql:  ${TABLE}.date;;
    hidden: yes
  }

  dimension: city {
    # primary_key: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    # primary_key: yes
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    # primary_key: yes
    type: string
    sql: ${TABLE}.residence ;;
  }

  # parameter: filter_date {
  #   type: date
  #   convert_tz: no
  #   suggest_explore: derived_user_preference_rating
  #   suggest_dimension: derived_user_preference_rating.date
  #   full_suggestions: yes
  # }

  measure: moved_in_residents {
    type: count_distinct
    sql: ${TABLE}.residents ;;
  }
}
