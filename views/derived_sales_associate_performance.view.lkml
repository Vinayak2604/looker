view: derived_sales_associate_performance {
  sql_table_name: stanza.derived_sales_associate_performance ;;

  dimension: access_level_entity_uuids {
    type: string
    sql: ${TABLE}.access_level_entity_uuids ;;
  }

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }

  dimension: calls_completed {
    type: number
    sql: ${TABLE}.calls_completed ;;
  }

  dimension: calls_completed_in_tat {
    type: number
    sql: ${TABLE}.calls_completed_in_tat ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: drop {
    type: number
    sql: ${TABLE}.drop ;;
  }

  dimension: drop_after_visit {
    type: number
    sql: ${TABLE}.drop_after_visit ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: live_beds {
    type: number
    sql: ${TABLE}.live_beds ;;
  }

  dimension: moved_up {
    type: number
    sql: ${TABLE}.moved_up ;;
  }

  dimension: number_of_agents {
    type: number
    sql: ${TABLE}.number_of_agents ;;
  }

  dimension: pre_booking {
    type: number
    sql: ${TABLE}.pre_booking ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: target_per_residence {
    type: number
    sql: ${TABLE}.target_per_residence ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: visits_completed {
    type: number
    sql: COALESCE(${TABLE}.visits_completed,0) ;;
  }

  dimension: visits_in_tat {
    type: number
    sql: ${TABLE}.visits_in_tat ;;
  }

  dimension: final_selling_price {
    type: number
    sql: ${TABLE}.final_selling_price ;;
  }

  dimension: blended_price {
    type: number
    sql: ${TABLE}.blended_price ;;
  }

  dimension: under_written_price {
    type: number
    sql: ${TABLE}.under_written_price ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: Name {
    type: string
    sql: replace(substring(${email},1,char_length(${email})-17),'.',' ') ;;
  }
  measure: beds_achieved {
    type: sum
    sql: ${bookings}/(case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence} end) ;;
    value_format: "0%"
    }

  measure: target_achieved {
    type: sum
    sql: ${bookings}*${blended_price} ;;
    value_format: "0"
  }

  measure: under_written_revenue {
    type: sum
    sql: ${bookings}*${under_written_price} ;;
    value_format: "0"
  }

  measure: Total_Revenue {
    type: sum
    sql: ${final_selling_price} ;;
    value_format: "0"
  }

  measure: number_of_days {
    type: number
    sql: current_date - min(${created_date}) ;;
  }

  measure: running_total_booking {
    type: running_total
    sql: ${bookings} ;;
  }

  measure: full_booking {
        type: sum
        sql: ${bookings} ;;
      }

  measure: pre_bookings {
    type: sum
    sql: ${pre_booking} ;;
  }
    measure: target {
        type: sum
        sql:  case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence} end;;
        value_format: "0"
     }

  measure: target_revenue {
    type: sum
    sql:  case when date(${created_date}) = date_add('day',-1,current_date) then ${target_per_residence}*${blended_price} end;;
    value_format: "0"
 }

#  measure: Visits_Completed_in_TAT {
#    type: number
#    sql: avg(${visits_in_tat})/avg(${visits_completed}) ;;
#  }

#  measure: Visits_Completed_in_TAT_perc {
#    type: max
#    sql: ${Visits_Completed_in_TAT} ;;
#  }

    measure: Visits_in_TAT {
        type: max
        sql: ${visits_in_tat} ;;
      }

    measure: Visits_Completed {
        type: max
        sql: ${visits_completed} ;;
      }

    measure: dropped_after_visit {
        type: max
        sql: ${drop_after_visit} ;;
      }

    measure: Calls_Completed_in_TAT {
        type: max
        sql: ${calls_completed_in_tat} ;;
      }

    measure: Calls_Completed {
        type: max
        sql: ${calls_completed} ;;
      }

  measure: Moved_Up {
    type: max
    sql: ${moved_up} ;;
  }

    measure: dropped {
        type: max
        sql: ${drop} ;;
      }
  measure: count {
    type: count
    drill_fields: [residence_name]
  }
}
