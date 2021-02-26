view: test {
  # sql_table_name: looker_demo.derived_meal_feedback ;;
  derived_table: {
    sql:
    select case when {% parameter data_cut %} = 'residence' THEN residence
when {% parameter data_cut %} = 'kitchen' then vendor_name
when {% parameter data_cut %} = 'micromarket' then micromarket
when {% parameter data_cut %} = 'city' then city
when {% parameter data_cut %} = 'zone' then zone
when {% parameter data_cut %} = 'overall' then null
end as data_cut1,
case when {% parameter data_cut %} = 'residence' or {% parameter data_cut %} = 'kitchen' THEN micromarket
when {% parameter data_cut %} = 'micromarket' then city
when {% parameter data_cut %} = 'city' then zone
end as data_cut2,
case when {% parameter data_cut %} = 'residence' or {% parameter data_cut %} = 'kitchen' THEN city
when {% parameter data_cut %} = 'micromarket' then zone
end as data_cut3,
case when {% parameter data_cut %} = 'residence' or {% parameter data_cut %} = 'kitchen' THEN zone
end as data_cut4,
user_id,
avg(case when {% condition menu_date %} menu_date {% endcondition %} then rating end) as avg_specified_period,
avg(case when date(menu_date) = timestampadd(day,-1,curdate()) then rating end) as yesterday,
avg(case when date(menu_date) >= timestampadd(day,-7,curdate()) and date(menu_date) <= timestampadd(day,-1,curdate()) then rating end) as l7d,
avg(case when date(menu_date) >= timestampadd(day,-14,curdate()) and date(menu_date) <= timestampadd(day,-8,curdate()) then rating end) as l14d,
avg(case when month(menu_date) = month(timestampadd(month,-1,curdate())) then rating end) as last_month,
avg(case when month(menu_date) = month(curdate()) then rating end) as MTD
from looker_demo.derived_meal_feedback
where {% condition meal %} meal {% endcondition %}
group by 1,2,3,4,5 ;;
  }

    # dimension: id {
    #   primary_key: yes
    #   type: number
    #   sql: ${TABLE}.id ;;
    # }

    dimension: user_id {
      type: string
      sql: ${TABLE}.user_id ;;
      primary_key: yes
    }

    parameter: data_cut {
      type: "string"
      allowed_value: {
        label: "residence"
        value: "residence"
      }
      allowed_value: {
        label: "kitchen"
        value: "kitchen"
      }
      allowed_value: {
        label: "micromarket"
        value: "micromarket"
      }
      allowed_value: {
        label: "city"
        value: "city"
      }
      allowed_value: {
        label: "zone"
        value: "zone"
      }
      allowed_value: {
        label: "overall"
        value: "overall"
      }
    }

    dimension: data_cut1 {
      type: "string"
      sql: ${TABLE}.data_cut1 ;;
      # label: "{% parameter data_cut %}"
      link: {
        label: "City View"
        url: "/looks/2"
      }
    }

  parameter: meal {
    type: "string"
    allowed_value: {
      label: "BREAKFAST"
      value: "BREAKFAST"
    }
    allowed_value: {
      label: "LUNCH"
      value: "LUNCH"
    }
    allowed_value: {
      label: "DINNER"
      value: "DINNER"
    }
    allowed_value: {
      label: "EVENING_SNACKS"
      value: "EVENING_SNACKS"
    }
    allowed_value: {
      label: "LUNCH_TIFFIN"
      value: "LUNCH_TIFFIN"
    }
  }

  dimension: data_cut2 {
    type: string
    sql: ${TABLE}.data_cut2 ;;
  }

  dimension: data_cut3 {
    type: string
    sql: ${TABLE}.data_cut3 ;;
  }

  dimension: data_cut4 {
    type: string
    sql: ${TABLE}.data_cut4 ;;
  }

    # dimension: age {
    #   type: number
    #   sql: ${TABLE}.age ;;
    # }

    # dimension: b2b_booking_flag {
    #   type: number
    #   sql: ${TABLE}.b2b_booking_flag ;;
    # }

    # dimension: city {
    #   type: string
    #   sql: ${TABLE}.city ;;
    # }

    # dimension: company_name {
    #   type: string
    #   sql: ${TABLE}.company_name ;;
    # }

    # dimension: educational_institution {
    #   type: string
    #   sql: ${TABLE}.educational_institution ;;
    # }

    # dimension: food_category_region {
    #   type: string
    #   sql: ${TABLE}.food_category_region ;;
    # }

    # dimension: gender {
    #   type: string
    #   sql: ${TABLE}.gender ;;
    # }

    # dimension: hometown {
    #   type: string
    #   sql: ${TABLE}.hometown ;;
    # }

    # dimension: item_base_preference {
    #   type: string
    #   sql: ${TABLE}.item_base_preference ;;
    # }

    # dimension: item_list {
    #   type: string
    #   sql: ${TABLE}.item_list ;;
    # }

    # dimension: mc_name {
    #   type: string
    #   sql: ${TABLE}.mc_name ;;
    # }

    # dimension: meal {
    #   type: string
    #   sql: ${TABLE}.meal ;;
    # }

    # dimension_group: meal_dispatch {
    #   type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    #   sql: ${TABLE}.meal_dispatch_time ;;
    # }

    # dimension_group: meal_end {
    #   type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    #   sql: ${TABLE}.meal_end_time ;;
    # }

    # dimension_group: meal_receive {
    #   type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    #   sql: ${TABLE}.meal_receive_time ;;
    # }

    # dimension_group: meal_start {
    #   type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    #   sql: ${TABLE}.meal_start_time ;;
    # }

    # dimension: meals_dispatched {
    #   type: number
    #   sql: ${TABLE}.meals_dispatched ;;
    # }

    # dimension: meals_ordered {
    #   type: number
    #   sql: ${TABLE}.meals_ordered ;;
    # }

    # dimension: meals_received {
    #   type: number
    #   sql: ${TABLE}.meals_received ;;
    # }

    parameter: menu_date {
      type: date
      convert_tz: no
    }

    # dimension: micromarket {
    #   type: string
    #   sql: ${TABLE}.micromarket ;;
    # }

    # dimension: monthly_rent {
    #   type: number
    #   sql: ${TABLE}.monthly_rent ;;
    # }

    # dimension_group: move_in {
    #   type: time
    #   timeframes: [
    #     raw,
    #     time,
    #     date,
    #     week,
    #     month,
    #     quarter,
    #     year
    #   ]
    #   sql: ${TABLE}.move_in_date ;;
    # }

    # dimension: name {
    #   type: string
    #   sql: ${TABLE}.name ;;
    # }

    # dimension: phone {
    #   type: string
    #   sql: ${TABLE}.phone ;;
    # }

    # dimension: profession {
    #   type: string
    #   sql: ${TABLE}.profession ;;
    # }

    # dimension: rating {
    #   type: number
    #   sql: ${TABLE}.rating ;;
    # }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: kitchen {
    type: string
    sql: ${TABLE}.kitchen ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;

  }

  dimension: overall {
    type: string
  }

    # dimension: residence_id {
    #   type: string
    #   sql: ${TABLE}.residence_id ;;
    # }

  dimension: avg_specified_period {
    type: number
    sql: ${TABLE}.avg_specified_period  ;;
  }

  dimension: yesterday {
    type: number
    sql: ${TABLE}.yesterday  ;;
  }

  dimension: last_month {
    type: number
    sql: ${TABLE}.last_month  ;;
  }

  dimension: MTD {
    type: number
    sql: ${TABLE}.MTD  ;;
  }

  dimension: L7D {
    type: number
    sql: ${TABLE}.L7D  ;;
  }

  dimension: L14D {
    type: number
    sql: ${TABLE}.L14D  ;;
  }

  #   dimension: scanned_meal {
  #     type: string
  #     sql: ${TABLE}.scanned_meal ;;
  #   }

  #   dimension: vendor_name {
  #     type: string
  #     sql: ${TABLE}.vendor_name ;;
  #   }

  #   measure: count {
  #     type: count
  #   }

  #   measure: feedback_users {
  #     type: count_distinct
  #     sql: ${user_id} ;;
  #     filters: [rating: ">=0",rating: "<=5"]
  #   }

  # measure: rating_sum {
  #   type: sum
  #   sql: ${rating} ;;
  #   filters: [rating: ">=0",rating: "<=5"]

  # }

  # measure: total_ratings {
  #   type: count_distinct
  #   sql: ${id} ;;
  #   filters: [rating: ">=0",rating: "<=5"]

  # }

  measure: promoters_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 4 and ${avg_specified_period} <= 5 then 1 else 0 end;;
    drill_fields: [user_id]
  }

  measure: detractors_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 1 and ${avg_specified_period} < 3 then 1 else 0 end;;
    drill_fields: [user_id]
  }

  measure: feedback_users_specified_period {
    type: sum
    sql: case when ${avg_specified_period} >= 0 and ${avg_specified_period} <= 5 then 1 else 0 end;;
    drill_fields: [user_id]
    value_format: "#,##0"
  }

  measure: promoters_yesterday {
    type: sum
    sql: case when ${yesterday} >= 4 and ${yesterday} <= 5 then 1 else 0 end;;
  }

  measure: detractors_yesterday {
    type: sum
    sql: case when ${yesterday} >= 1 and ${yesterday} < 3 then 1 else 0 end;;
  }

  measure: feedback_yesterday {
    type: sum
    sql: case when ${yesterday} >= 0 and ${yesterday} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_last_month {
    type: sum
    sql: case when ${last_month} >= 4 and ${last_month} <= 5 then 1 else 0 end;;
  }

  measure: detractors_last_month {
    type: sum
    sql: case when ${last_month} >= 1 and ${last_month} < 3 then 1 else 0 end;;
  }

  measure: feedback_last_month {
    type: sum
    sql: case when ${last_month} >= 0 and ${last_month} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }


  measure: promoters_MTD {
    type: sum
    sql: case when ${MTD} >= 4 and ${MTD} <= 5 then 1 else 0 end;;
  }

  measure: detractors_MTD {
    type: sum
    sql: case when ${MTD} >= 1 and ${MTD} < 3 then 1 else 0 end;;
  }

  measure: feedback_MTD {
    type: sum
    sql: case when ${MTD} >= 0 and ${MTD} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_L7D {
    type: sum
    sql: case when ${L7D} >= 4 and ${L7D} <= 5 then 1 else 0 end;;
  }

  measure: detractors_L7D {
    type: sum
    sql: case when ${L7D} >= 1 and ${L7D} < 3 then 1 else 0 end;;
  }

  measure: feedback_L7D {
    type: sum
    sql: case when ${L7D} >= 0 and ${L7D} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: promoters_L14D {
    type: sum
    sql: case when ${L14D} >= 4 and ${L14D} <= 5 then 1 else 0 end;;
  }

  measure: detractors_L14D {
    type: sum
    sql: case when ${L14D} >= 1 and ${L14D} < 3 then 1 else 0 end;;
  }

  measure: feedback_L14D {
    type: sum
    sql: case when ${L14D} >= 0 and ${L14D} <= 5 then 1 else 0 end;;
    value_format: "#,##0"
  }

  measure: nps_specified_period {
    type: number
    sql: (${promoters_specified_period} -  ${detractors_specified_period})/${feedback_users_specified_period} ;;
    value_format: "0.0%"
  }

  measure: nps_yesterday {
    type: number
    sql: (${promoters_yesterday} -  ${detractors_yesterday})/${feedback_yesterday} ;;
    value_format: "0.0%"
  }

  measure: nps_last_month {
    type: number
    sql: (${promoters_last_month} -  ${detractors_last_month})/${feedback_last_month} ;;
    value_format: "0.0%"
  }

  measure: nps_mtd {
    type: number
    sql: (${promoters_MTD} -  ${detractors_MTD})/${feedback_MTD} ;;
    value_format: "0.0%"
  }

  measure: nps_L7D {
    type: number
    sql: (${promoters_L7D} -  ${detractors_L7D})/${feedback_L7D} ;;
    value_format: "0.0%"
  }

  measure: nps_L14D {
    type: number
    sql: (${promoters_L14D} -  ${detractors_L14D})/${feedback_L14D} ;;
    value_format: "0.0%"
  }


  }
