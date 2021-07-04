view: derived_b2c_bookings {
  sql_table_name: looker_demo.derived_b2c_bookings ;;

  dimension: admin_charges {
    type: number
    sql: ${TABLE}.admin_charges ;;
  }

  dimension: advance_rental_months {
    type: number
    sql: ${TABLE}.advance_rental_months ;;
  }

  dimension: bc_monthly_rental_net_of_discount {
    type: number
    sql: ${TABLE}.bc_monthly_rental_net_of_discount ;;
  }

  dimension: beds {
    type: number
    sql: ${TABLE}.beds ;;
  }

  # measure: total_beds {
  #   type: sum
  #   sql: ${beds} ;;
  #   drill_fields: [residence, gender, total_beds, count_of_beds]
  # }

  dimension: booking_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.booking_id ;;
  }

  dimension: booking_status {
    type: string
    sql: ${TABLE}.booking_status ;;
  }

  dimension: booking_type {
    type: number
    sql: ${TABLE}.booking_type ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [residence]
  }

  dimension: college_name {
    type: string
    sql: ${TABLE}.college_name ;;
  }

  dimension_group: contract_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.contract_start_date ;;
  }

  dimension: contract_tenure {
    type: number
    sql: ${TABLE}.contract_tenure ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: effective_contract_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.effective_contract_end_date ;;
  }

  dimension: effective_contract_revenue {
    type: number
    sql: ${TABLE}.effective_contract_revenue ;;
  }

  dimension: food_service_price {
    type: number
    sql: ${TABLE}.food_service_price ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lock_in_months {
    type: number
    sql: ${TABLE}.lock_in_months ;;
  }

  dimension: locked_in_tenure_rental_revenue {
    type: number
    sql: ${TABLE}.locked_in_tenure_rental_revenue ;;
  }

  dimension: mandatory_service_price {
    type: number
    sql: ${TABLE}.mandatory_service_price ;;
  }

  dimension: mentainance_fee_selection_id {
    type: string
    sql: ${TABLE}.mentainance_fee_selection_id ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
    drill_fields: [residence]
  }

  dimension: monthly_amc_mentainance_fee {
    type: number
    sql: ${TABLE}.monthly_amc_mentainance_fee ;;
  }

  dimension_group: move_in {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: net_upsell_downsell {
    type: number
    sql: ${TABLE}.net_upsell_downsell ;;
  }

  dimension: non_refundable_security {
    type: number
    sql: ${TABLE}.non_refundable_security ;;
  }

  dimension: ops_residence_id {
    type: string
    sql: ${TABLE}.ops_residence_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: property_category {
    type: string
    sql: ${TABLE}.property_category ;;
  }

  dimension: refundable_security {
    type: number
    sql: ${TABLE}.refundable_security ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  dimension: room_price {
    type: number
    sql: ${TABLE}.room_price ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: underwritten_price {
    type: number
    sql: ${TABLE}.underwritten_price ;;
  }

  dimension: value_applied {
    type: number
    sql: ${TABLE}.value_applied ;;
  }

  measure: booking_count {
    type: count_distinct
    sql: ${booking_id} ;;
    drill_fields: [created_month,booking_count]
    value_format: "#,##0"
  }

  measure: day_count {
    type: count_distinct
    sql: ${created_date} ;;
    value_format: "#,##0"
  }

  measure: b2c_booked_beds {
    type: sum
    sql: ${beds} ;;
    drill_fields: [created_date,residence]
    value_format: "#,##0"
  }

  measure: bookings_yesterday {
    type: count_distinct
    sql: ${booking_id} ;;
    filters: [created_date: "yesterday"]
    value_format: "#,##0"
  }

  measure: bookings_l3d {
    type: count_distinct
    sql: ${booking_id} ;;
    filters: [created_date: "3 days ago for 3 days"]
    value_format: "#,##0"
  }

  measure: bookings_l7d {
    type: count_distinct
    sql: ${booking_id} ;;
    filters: [created_date: "7 days ago for 7 days"]
    value_format: "#,##0"
  }

  measure: total_bookings_till_date {
    type: count_distinct
    sql: ${booking_id} ;;
    drill_fields: [created_date,total_bookings_till_date]
    link: {
      label: "Show as stacked line"
      url: "
      {% assign vis_config = '{
      \"stacking\" : \"normal\",
      \"legend_position\" : \"right\",
      \"x_axis_gridlines\" : false,
      \"y_axis_gridlines\" : true,
      \"show_view_names\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"show_x_axis_label\" : true,
      \"show_x_axis_ticks\" : true,
      \"show_null_points\" : false,
      \"interpolation\" : \"monotone\",
      \"type\" : \"looker_line\",
      \"colors\": [
      \"#5245ed\"
      ],
      \"x_axis_label\" : \"Month Number\"
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&sorts=derived_b2c_bookings.created_date&fields=derived_b2c_bookings.created_date,derived_b2c_bookings.total_bookings_till_date&pivot=derived_b2c_bookings.total_bookings_till_date&toggle=dat,pik,vis&limit=500&column_limit=5"
    }
    link: {
      label: "Cut by Month"
      url: "{{derived_b2c_bookings.total_bookings_till_month._link}}"
    }
    link: {
      label: "Cut by Year"
      url: "{{derived_b2c_bookings.total_bookings_till_year._link}}"
    }
  }

  measure: total_bookings_till_month {
    hidden: yes
    type: count_distinct
    sql: ${booking_id} ;;
    drill_fields: [created_month,total_bookings_till_date]
  }

  measure: total_bookings_till_year {
    hidden: yes
    type: count_distinct
    sql: ${booking_id} ;;
    drill_fields: [created_year,total_bookings_till_date]
  }

  measure: bookings_l30d {
    type: count_distinct
    sql: ${booking_id} ;;
    filters: [created_date: "30 days ago for 30 days"]
    value_format: "#,##0"
  }

  measure: expected_move_ins_n3d {
    type: sum
    sql: ${beds} ;;
    filters: [move_in_date: "today for 3 days"]
    value_format: "#,##0"
  }

  measure: expected_move_ins_n7d {
    type: sum
    sql: ${beds} ;;
    filters: [move_in_date: "today for 7 days"]
    value_format: "#,##0"
  }

  measure: expected_move_ins_n30d {
    type: sum
    sql: ${beds} ;;
    filters: [move_in_date: "today for 30 days"]
    value_format: "#,##0"
  }

  measure: net_revenue_last_month_b2c {
    type: sum
    sql: ${bc_monthly_rental_net_of_discount} ;;
    filters: [contract_start_month: "last month"]
    value_format: "#,##0"
  }

  measure: total_underwritten {
    type: sum
    sql: ${underwritten_price} ;;
    value_format: "#,##0"
  }

  measure: total_booking_commercial {
    type: sum
    sql: ${bc_monthly_rental_net_of_discount} ;;
    value_format: "#,##0"
  }

  measure: b2c_last_month_revenue {
    type: sum
    sql: ${bc_monthly_rental_net_of_discount} ;;
    filters: [contract_start_date: "last month"]
    value_format: "#,##0"
  }

  measure: sales_running_total {
    type: running_total
    sql: ${beds} ;;
    value_format: "#,##0"
  }

  dimension: downsold_flag {
    type: number
    sql: case when ${bc_monthly_rental_net_of_discount} < ${underwritten_price} then 1 else 0 end ;;
  }

  measure: total_downsold_bookings {
    type: sum
    sql: ${downsold_flag} ;;
  }

  dimension: upsold_flag {
    type: number
    sql: case when ${bc_monthly_rental_net_of_discount} > ${underwritten_price} then 1 else 0 end ;;
  }

  measure: total_upsold_bookings {
    type: sum
    sql: ${upsold_flag} ;;
  }

  measure: onboarded_beds {
    type: sum
    sql: ${beds} ;;
    filters: [booking_status: "ONBOARDING COMPLETED"]
    value_format: "#,##0"
  }

  measure: future_move_ins {
    type: sum
    sql: ${beds} ;;
    filters: [move_in_date: "after today"]
    value_format: "#,##0"
  }

  dimension: booking_type_defined {
    type: string
    sql:  case when ${booking_type}=0 then "New Closure" when ${booking_type}=1 then "Retention" when ${booking_type}=2 then "Retention" when ${booking_type}=4 then "Suits" end ;;

  }

  measure: beds_sold_today {
    type: sum
    sql: ${beds} ;;
    filters: [created_date: "today"]
    value_format: "#,##0"
  }

  measure: beds_sold_mtd {
    type: sum
    sql: ${beds} ;;
    filters: [created_date: "30 days ago for 30 days"]
    value_format: "#,##0"
  }

  measure: beds_sold_l7d {
    type: sum
    sql: ${beds} ;;
    filters: [created_date: "7 days ago for 7 days"]
    value_format: "#,##0"
  }

  measure: total_advance_rental {
    type: sum
    sql: ${advance_rental_months} ;;
  }


}

  # parameter: day_filter {
  #   type: number

  # }

  # dimension: is_within_range {
  #   type: yesno
  #   sql: ${created_date} >= timestampadd({%parameter day_filter%},day,now()) ;;
  # }

  # measure: dynamic_sold_beds_data {
  #   type: sum
  #   sql: ${beds} ;;
  #   filters: [is_within_range: "Yes"]
  # }
  # set: raw_data {
  #   fields: [booking_id,booking_type]
  # }
