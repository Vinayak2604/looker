view: vas_order_graph_stack {
  derived_table: {
    sql:select extract(year from upr.date) yr,extract(month from upr.date) mt,upr.city, upr.micromarket,
    ageing, count(distinct upr.user_id) as moved_in_residents
      from looker_demo.derived_user_preference_rating upr
      where upr.date >= '2021-01-01 00:00:00'
      and upr.move_in_date >= '2021-01-01 00:00:00'
      and cafe_availability =1
      and {% condition profession_flag %} profession {% endcondition %}
      group by 1,2,3,4,5;;

    }

  filter: profession_flag {
    # sql: exists (select distinct meal_type from derived_user_preference_rating) ;;
    suggestions: ["Working Professional","College Student","Other Student"]
    type: string
  }

    dimension: yr {
      type: string
      sql: ${TABLE}.yr ;;
    }

    dimension: mt {
      type: number
      sql: ${TABLE}.mt ;;
    }


    dimension: city {
      type: string
      sql: ${TABLE}.city ;;
    }

    dimension: micromarket {
      type: string
      sql: ${TABLE}.micromarket ;;
    }

    dimension: ageing {
      type: string
      sql: ${TABLE}.ageing ;;
    }


    dimension: moved_in_residents {
      type: number
      sql: ${TABLE}.moved_in_residents ;;
    }


    measure: moved_in_residentss {
      type: sum
      sql: ${moved_in_residents};;
    }



  }
