view: derived_user_engagement_mom_comparison {
  sql_table_name: stanza.derived_user_engagement_mom_comparison ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    link: {
      url: "/explore/growth/derived_user_engagement_mom_comparison?fields=derived_user_engagement_mom_comparison.below_students,derived_user_engagement_mom_comparison.students,derived_user_engagement_mom_comparison.micromarket&f[derived_user_engagement_mom_comparison.city]=-%25Test%25&sorts=student+desc&limit=500&vis=%7B%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22type%22%3A%22looker_pie%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%22derived_user_engagement_mom_comparison.below_students%22%2C%22derived_user_engagement_mom_comparison.students%22%2C%22students%22%5D%7D&filter_config=%7B%22derived_user_engagement_mom_comparison.city%22%3A%5B%7B%22type%22%3A%22%21contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Test%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22students%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_user_engagement_mom_comparison.below_students%7D+%2F+%24%7Bderived_user_engagement_mom_comparison.students%7D%22%2C%22label%22%3A%22Students+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_1%22%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22student%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bstudents%7D+%2F+sum%28%24%7Bstudents%7D%29%22%2C%22label%22%3A%22Student+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%7D%5D&origin=share-expanded&f[derived_user_engagement_mom_comparison.city]={{value}}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Decreased: Micromarket "
    }

    link: {
      url: "/explore/growth/derived_user_engagement_mom_comparison?fields=derived_user_engagement_mom_comparison.students,derived_user_engagement_mom_comparison.above_students,derived_user_engagement_mom_comparison.micromarket&f[derived_user_engagement_mom_comparison.city]=-%25Test%25&sorts=student+desc&limit=500&vis=%7B%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22type%22%3A%22looker_pie%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%22derived_user_engagement_mom_comparison.students%22%2C%22students%22%2C%22derived_user_engagement_mom_comparison.above_students%22%5D%7D&filter_config=%7B%22derived_user_engagement_mom_comparison.city%22%3A%5B%7B%22type%22%3A%22%21contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Test%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22student%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bstudents%7D+%2F+sum%28%24%7Bstudents%7D%29%22%2C%22label%22%3A%22Student+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22students%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_user_engagement_mom_comparison.above_students%7D%2F+%24%7Bderived_user_engagement_mom_comparison.students%7D%22%2C%22label%22%3A%22Students+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_1%22%7D%5D&origin=share-expanded&f[derived_user_engagement_mom_comparison.city]={{value}}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Increased: Micromarket "
    }

  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;

    link: {
      url: "/explore/growth/derived_user_engagement_mom_comparison?fields=derived_user_engagement_mom_comparison.below_students,derived_user_engagement_mom_comparison.students,derived_user_engagement_mom_comparison.residence&f[derived_user_engagement_mom_comparison.city]=-%25Test%25&sorts=student+desc&limit=500&vis=%7B%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22type%22%3A%22looker_pie%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%22derived_user_engagement_mom_comparison.below_students%22%2C%22derived_user_engagement_mom_comparison.students%22%2C%22students%22%5D%7D&filter_config=%7B%22derived_user_engagement_mom_comparison.city%22%3A%5B%7B%22type%22%3A%22%21contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Test%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22students%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_user_engagement_mom_comparison.below_students%7D+%2F+%24%7Bderived_user_engagement_mom_comparison.students%7D%22%2C%22label%22%3A%22Students+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_1%22%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22student%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bstudents%7D+%2F+sum%28%24%7Bstudents%7D%29%22%2C%22label%22%3A%22Student+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%7D%5D&origin=share-expanded&f[derived_user_engagement_mom_comparison.micromarket]={{value}}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Decreased: Residence "
    }

    link: {
      url: "/explore/growth/derived_user_engagement_mom_comparison?fields=derived_user_engagement_mom_comparison.residence,derived_user_engagement_mom_comparison.students,derived_user_engagement_mom_comparison.above_students&f[derived_user_engagement_mom_comparison.city]=-%25Test%25&sorts=student+desc&limit=500&vis=%7B%22value_labels%22%3A%22legend%22%2C%22label_type%22%3A%22labPer%22%2C%22type%22%3A%22looker_pie%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%22derived_user_engagement_mom_comparison.students%22%2C%22students%22%2C%22derived_user_engagement_mom_comparison.above_students%22%5D%7D&filter_config=%7B%22derived_user_engagement_mom_comparison.city%22%3A%5B%7B%22type%22%3A%22%21contains%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Test%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22student%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bstudents%7D+%2F+sum%28%24%7Bstudents%7D%29%22%2C%22label%22%3A%22Student+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%7D%2C%7B%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22students%22%2C%22_type_hint%22%3A%22number%22%2C%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22%24%7Bderived_user_engagement_mom_comparison.above_students%7D%2F+%24%7Bderived_user_engagement_mom_comparison.students%7D%22%2C%22label%22%3A%22Students+%25%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_1%22%7D%5D&origin=share-expanded&f[derived_user_engagement_mom_comparison.micromarket]={{value}}&toggle=dat,pik,vis&toggle=dat,pik,vis"
      label: "Increased: Residence "
    }
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: score1 {
    type: number
    sql: ${TABLE}.score1 ;;
  }

  dimension: score_valuation {
    type: string
    sql: ${TABLE}.score_valuation ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: students {
    type: count_distinct
    sql: ${student_id} ;;
  }


  measure: above_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Above' then ${student_id} end ;;
  }


  measure: same_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Same' then ${student_id} end ;;
  }



  measure: below_students {
    type: count_distinct
    sql: case when ${score_valuation} = 'Below' then ${student_id} end ;;

  }

}
