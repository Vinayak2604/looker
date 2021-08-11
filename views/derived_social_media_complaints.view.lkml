view: derived_social_media_complaints {
  sql_table_name: stanza.derived_social_media_complaints ;;

  dimension: aging {
    type: string
    sql: ${TABLE}.aging ;;
  }

  dimension: av_tat {
    type: number
    sql: ${TABLE}.av_tat ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: connect_not_connect_status {
    type: string
    sql: ${TABLE}.connect_not_connect_status ;;
  }

  dimension: cx_charter_violated {
    type: string
    sql: ${TABLE}.cx_charter_violated ;;
  }

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

  dimension_group: date_of_resolution {
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
    sql: ${TABLE}.date_of_resolution ;;
  }

  dimension: do_we_have_alredy_fresh_desk_ticket {
    type: string
    sql: ${TABLE}.do_we_have_alredy_fresh_desk_ticket ;;
  }

  dimension_group: escalation_closed_with_andy_sandeep_and_shaminn {
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
    sql: ${TABLE}.escalation_closed_with_andy_sandeep_and_shaminn ;;
  }

  dimension_group: escalation_email_shared_to_city_team {
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
    sql: ${TABLE}.escalation_email_shared_to_city_team ;;
  }

  dimension: escalation_type {
    type: string
    sql: ${TABLE}.escalation_type ;;
  }

  dimension_group: fd_ticket_created {
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
    sql: ${TABLE}.fd_ticket_created_date ;;
  }

  dimension: follow_up_count_on_mail {
    type: number
    sql: ${TABLE}.follow_up_count_on_mail ;;
  }

  dimension: hostel {
    type: string
    sql: ${TABLE}.hostel ;;
  }

  dimension: justified_unjustified {
    type: string
    sql: ${TABLE}.justified_unjustified ;;
  }

  dimension: mm {
    type: string
    sql: ${TABLE}.mm ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}.ownership ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: policy_violated_yes_no {
    type: string
    sql: ${TABLE}.policy_violated_yes_no ;;
  }

  dimension: reason_that_resident_escalate_on_sm {
    type: string
    sql: ${TABLE}.reason_that_resident_escalate_on_sm ;;
  }

  dimension_group: resolution_provided_by_the_city_team {
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
    sql: ${TABLE}.resolution_provided_by_the_city_team ;;
  }

  dimension: satisfied_unsatisfied {
    type: string
    sql: ${TABLE}.satisfied_unsatisfied ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  dimension: tat {
    type: string
    sql: ${TABLE}.tat ;;
  }

  dimension_group: the_actual_date_of_social_post {
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
    sql: ${TABLE}.the_actual_date_of_social_post ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    # drill_fields: [name]
    link: {
      label: "City Wise"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.city,derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints&f[derived_social_media_complaints.city]=-NULL&f[derived_social_media_complaints.justified_unjustified]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Justified_Complaints%22%3A%22%2362bad4%22%2C%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.city%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.justified_unjustified%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.sub_category]={{ derived_social_media_complaints.sub_category._value }}"
     }

    link: {
      label: "Micromarket Wise"
      url: "/explore/cx_3_redshift/derived_social_media_complaints?fields=derived_social_media_complaints.Justified_Complaints,derived_social_media_complaints.Unjustified_Complaints,derived_social_media_complaints.zone&f[derived_social_media_complaints.city]=-NULL&f[derived_social_media_complaints.sub_category]=-NULL&sorts=derived_social_media_complaints.Justified_Complaints+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Atrue%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22series_colors%22%3A%7B%22derived_social_media_complaints.Unjustified_Complaints%22%3A%22%23928%22%7D%2C%22label_color%22%3A%5B%22%2300000%22%5D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22derived_social_media_complaints.city%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_social_media_complaints.sub_category%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded&f[derived_social_media_complaints.sub_category]={{ derived_social_media_complaints.sub_category._value }}"
    }
  }

  dimension: l30 {

    sql: CASE
        WHEN ${TABLE}.date > add_days(-30,date_trunc(now)) THEN 'Y'
        ELSE 'N'
        END ;;
  }

  dimension: l7 {

    sql: CASE
        WHEN ${TABLE}.date > add_days(-7,date_trunc(now())) THEN 'Y'
        ELSE 'N'
        END ;;
  }

  dimension: l1 {

    sql: CASE
        WHEN ${TABLE}.date > add_days(-1,date_trunc(now())) THEN 'Y'
        ELSE 'N'
        END ;;
  }

  dimension: aging_new {

    sql:  IF(is_null(${ticket_id}),'',
    IF(is_null(${date_of_resolution_date}),days_diff(date_trunc(now()),${fd_ticket_created_date}),
    days_diff(${date_of_resolution_date},${fd_ticket_created_date})))

    ;;

  }



  measure: Justified_Complaints{
    type: count
    filters: [justified_unjustified: "Justified"]
  }

  measure: Unjustified_Complaints{
    type: count
    filters: [justified_unjustified: "Unjustified"]
  }

}
