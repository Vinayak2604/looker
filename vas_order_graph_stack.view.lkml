view: vas_order_graph_stack {
  derived_table: {
    sql:select extract(year from vo.date) yr,extract(month from vo.date) mt, city, micromarket, ageing, count(distinct vo.id) as total_orders, sum(case when rating is not null then 1 else 0 end) as rated_orders,
      avg(vo.final_total_amount) as aov, sum(vo.final_total_amount) as total_amount, count(distinct vo.user_id) as order_users
      from looker_demo.derived_vas_orders vo
      where vo.date >= '2021-01-01 00:00:00'
      and vo.move_in_date >= '2021-01-01 00:00:00'
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


    dimension: total_order {
      type: number
      sql: ${TABLE}.total_orders ;;
    }

    dimension: order_user {
      type: number
      sql: ${TABLE}.order_users ;;
    }


    measure: total_orders {
      type: sum
      sql: ${total_order};;
    }

    measure: order_users {
      type: sum
      sql: ${order_user} ;;
    }

    measure: total_amount {
      type: sum
      sql: ${TABLE}.total_amount ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }

    measure: aov {
      type: number
      sql: ${total_amount} / ${total_orders} ;;
      value_format: "#,##0"
      html: <p> &#x20B9; {{rendered_value}} </p> ;;
    }


  }
