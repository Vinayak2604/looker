view: is_cheat_sheet {
  sql_table_name: looker_demo.is_cheat_sheet ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: ac_acquisition {
    type: string
    sql: ${TABLE}.ac_acquisition ;;
  }

  measure: ac_enabled {
    type: yesno
    sql: ${TABLE}.ac_enabled ;;
  }

  measure: ac_items {
    type: number
    sql: ${TABLE}.ac_items ;;
  }

  measure: ac_payment_mode {
    type: string
    sql: ${TABLE}.ac_payment_mode ;;
  }

  measure: ac_rent {
    type: number
    sql: ${TABLE}.ac_rent ;;
  }

  measure: ac_timing {
    type: string
    sql: ${TABLE}.ac_timing ;;
  }

  measure: ancillary_services {
    type: string
    sql: ${TABLE}.ancillary_services ;;
  }

  measure: attributes {
    type: string
    sql: ${TABLE}.attributes ;;
  }

  measure: bio_metric_enabled {
    type: yesno
    sql: ${TABLE}.bio_metric_enabled ;;
  }

  measure: blanket_approval {
    type: yesno
    sql: ${TABLE}.blanket_approval ;;
  }

  measure: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  measure: breakfast_price {
    type: number
    sql: ${TABLE}.breakfast_price ;;
  }

  measure: cafetaria_enabled {
    type: yesno
    sql: ${TABLE}.cafetaria_enabled ;;
  }

  measure: cafetaria_timing {
    type: string
    sql: ${TABLE}.cafetaria_timing ;;
  }

  measure: card_access_enabled {
    type: yesno
    sql: ${TABLE}.card_access_enabled ;;
  }

  measure: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  measure: chicken {
    type: number
    sql: ${TABLE}.chicken ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  measure: coffee {
    type: number
    sql: ${TABLE}.coffee ;;
  }

  measure: common_area_days {
    type: number
    sql: ${TABLE}.common_area_days ;;
  }

  measure: common_area_dth {
    type: yesno
    sql: ${TABLE}.common_area_dth ;;
  }

  measure: common_area_enabled {
    type: yesno
    sql: ${TABLE}.common_area_enabled ;;
  }

  measure: common_area_enabled_hk {
    type: yesno
    sql: ${TABLE}.common_area_enabled_hk ;;
  }

  measure: common_area_payment_mode {
    type: string
    sql: ${TABLE}.common_area_payment_mode ;;
  }

  measure: common_bathroom_days {
    type: number
    sql: ${TABLE}.common_bathroom_days ;;
  }

  measure: common_bathroom_enabled {
    type: yesno
    sql: ${TABLE}.common_bathroom_enabled ;;
  }

  measure: common_geyser_acquisition {
    type: string
    sql: ${TABLE}.common_geyser_acquisition ;;
  }

  measure: common_geyser_enabled {
    type: yesno
    sql: ${TABLE}.common_geyser_enabled ;;
  }

  measure: common_geyser_items {
    type: number
    sql: ${TABLE}.common_geyser_items ;;
  }

  measure: common_geyser_payment_mode {
    type: string
    sql: ${TABLE}.common_geyser_payment_mode ;;
  }

  measure: common_geyser_rent {
    type: number
    sql: ${TABLE}.common_geyser_rent ;;
  }

  dimension_group: common_geyser_timing {
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
    sql: ${TABLE}.common_geyser_timing ;;
  }

  measure: consumables {
    type: string
    sql: ${TABLE}.consumables ;;
  }

  measure: contract_emi_months {
    type: number
    sql: ${TABLE}.contract_emi_months ;;
  }

  measure: contract_is_active {
    type: yesno
    sql: ${TABLE}.contract_is_active ;;
  }

  measure: contract_months {
    type: number
    sql: ${TABLE}.contract_months ;;
  }

  measure: contract_type {
    type: yesno
    sql: ${TABLE}.contract_type ;;
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

  measure: dessert {
    type: number
    sql: ${TABLE}.dessert ;;
  }

  measure: dinner_price {
    type: number
    sql: ${TABLE}.dinner_price ;;
  }

  measure: double_door_fridge {
    type: yesno
    sql: ${TABLE}.double_door_fridge ;;
  }

  measure: double_door_fridge_acquisition {
    type: number
    sql: ${TABLE}.double_door_fridge_acquisition ;;
  }

  measure: double_door_fridge_items {
    type: yesno
    sql: ${TABLE}.double_door_fridge_items ;;
  }

  measure: double_door_fridge_rent {
    type: number
    sql: ${TABLE}.double_door_fridge_rent ;;
  }

  measure: egg {
    type: number
    sql: ${TABLE}.egg ;;
  }

  measure: electricity_enabled {
    type: yesno
    sql: ${TABLE}.electricity_enabled ;;
  }

  measure: fitness_zone___location {
    type: string
    sql: ${TABLE}.fitness_zone___location ;;
  }

  measure: fitness_zone_enabled {
    type: yesno
    sql: ${TABLE}.fitness_zone_enabled ;;
  }

  measure: fitness_zone_package_enabled {
    type: yesno
    sql: ${TABLE}.fitness_zone_package_enabled ;;
  }

  measure: fitness_zone_timing {
    type: string
    sql: ${TABLE}.fitness_zone_timing ;;
  }

  measure: fomo_tag_website {
    type: string
    sql: ${TABLE}.fomo_tag_website ;;
  }

  measure: food_menu_category_cat {
    type: string
    sql: ${TABLE}.food_menu_category_cat ;;
  }

  measure: food_menu_enabled {
    type: yesno
    sql: ${TABLE}.food_menu_enabled ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  measure: google_map_link_website {
    type: string
    sql: ${TABLE}.google_map_link_website ;;
  }

  measure: house_keeping_enabled {
    type: yesno
    sql: ${TABLE}.house_keeping_enabled ;;
  }

  measure: in_suite_bathroom_days {
    type: number
    sql: ${TABLE}.in_suite_bathroom_days ;;
  }

  measure: in_suite_bathroom_enabled {
    type: yesno
    sql: ${TABLE}.in_suite_bathroom_enabled ;;
  }

  measure: included_till_x_km_ {
    type: number
    sql: ${TABLE}.included_till_x_km_ ;;
  }

  measure: internet_devices {
    type: number
    sql: ${TABLE}.internet_devices ;;
  }

  measure: internet_enabled {
    type: yesno
    sql: ${TABLE}.internet_enabled ;;
  }

  measure: internet_offering {
    type: string
    sql: ${TABLE}.internet_offering ;;
  }

  measure: internet_package_enabled {
    type: yesno
    sql: ${TABLE}.internet_package_enabled ;;
  }

  measure: internet_vendor {
    type: string
    sql: ${TABLE}.internet_vendor ;;
  }

  measure: landmarks_website {
    type: string
    sql: ${TABLE}.landmarks_website ;;
  }

  measure: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  measure: laundry_enabled {
    type: yesno
    sql: ${TABLE}.laundry_enabled ;;
  }

  measure: linen_change_days {
    type: number
    sql: ${TABLE}.linen_change_days ;;
  }

  measure: linen_change_enabled {
    type: yesno
    sql: ${TABLE}.linen_change_enabled ;;
  }

  measure: location_website {
    type: string
    sql: ${TABLE}.location_website ;;
  }

  measure: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  measure: lunch_price {
    type: number
    sql: ${TABLE}.lunch_price ;;
  }

  measure: meal_serve_days {
    type: string
    sql: ${TABLE}.meal_serve_days ;;
  }

  measure: menu_category_name {
    type: string
    sql: ${TABLE}.menu_category_name ;;
  }

  measure: menu_price {
    type: number
    sql: ${TABLE}.menu_price ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  measure: microwave {
    type: yesno
    sql: ${TABLE}.microwave ;;
  }

  measure: microwave_acquisition {
    type: string
    sql: ${TABLE}.microwave_acquisition ;;
  }

  measure: microwave_items {
    type: number
    sql: ${TABLE}.microwave_items ;;
  }

  measure: microwave_rent {
    type: number
    sql: ${TABLE}.microwave_rent ;;
  }

  measure: milk {
    type: number
    sql: ${TABLE}.milk ;;
  }

  measure: night_curfew_enabled {
    type: yesno
    sql: ${TABLE}.night_curfew_enabled ;;
  }

  dimension_group: night_curfew_timing {
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
    sql: ${TABLE}.night_curfew_timing ;;
  }

  measure: occ_stp {
    type: string
    sql: ${TABLE}.occ_stp ;;
  }

  measure: occupancy {
    type: number
    sql: ${TABLE}.occupancy ;;
  }

  measure: occupancy_pricing {
    type: string
    sql: ${TABLE}.occupancy_pricing ;;
  }

  measure: other_waterdispenser_acquisition {
    type: string
    sql: ${TABLE}.other_waterdispenser_acquisition ;;
  }

  measure: others_services_enabled {
    type: yesno
    sql: ${TABLE}.others_services_enabled ;;
  }

  measure: paneer {
    type: number
    sql: ${TABLE}.paneer ;;
  }

  measure: payment_terms {
    type: string
    sql: ${TABLE}.payment_terms ;;
  }

  measure: power_backup_acquisition {
    type: string
    sql: ${TABLE}.power_backup_acquisition ;;
  }

  measure: power_backup_enabled {
    type: yesno
    sql: ${TABLE}.power_backup_enabled ;;
  }

  measure: power_backup_items {
    type: number
    sql: ${TABLE}.power_backup_items ;;
  }

  measure: power_backup_rent {
    type: number
    sql: ${TABLE}.power_backup_rent ;;
  }

  measure: power_backup_type {
    type: string
    sql: ${TABLE}.power_backup_type ;;
  }

  measure: pre_booking_amount {
    type: number
    sql: ${TABLE}.pre_booking_amount ;;
  }

  measure: provided_for {
    type: string
    sql: ${TABLE}.provided_for ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  measure: room_days {
    type: number
    sql: ${TABLE}.room_days ;;
  }

  measure: room_dth_acquisition {
    type: string
    sql: ${TABLE}.room_dth_acquisition ;;
  }

  measure: room_dth_items {
    type: number
    sql: ${TABLE}.room_dth_items ;;
  }

  measure: room_dth_rent {
    type: number
    sql: ${TABLE}.room_dth_rent ;;
  }

  measure: room_enabled {
    type: yesno
    sql: ${TABLE}.room_enabled ;;
  }

  measure: room_enabled_hk {
    type: yesno
    sql: ${TABLE}.room_enabled_hk ;;
  }

  measure: room_geyser_acquisition {
    type: string
    sql: ${TABLE}.room_geyser_acquisition ;;
  }

  measure: room_geyser_enabled {
    type: yesno
    sql: ${TABLE}.room_geyser_enabled ;;
  }

  measure: room_geyser_items {
    type: number
    sql: ${TABLE}.room_geyser_items ;;
  }

  measure: room_geyser_payment_mode {
    type: string
    sql: ${TABLE}.room_geyser_payment_mode ;;
  }

  measure: room_geyser_rent {
    type: number
    sql: ${TABLE}.room_geyser_rent ;;
  }

  measure: room_geyser_timing {
    type: string
    sql: ${TABLE}.room_geyser_timing ;;
  }

  measure: room_payment_mode {
    type: string
    sql: ${TABLE}.room_payment_mode ;;
  }

  measure: room_unit_rate {
    type: number
    sql: ${TABLE}.room_unit_rate ;;
  }

  dimension_group: sec_dep_start {
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
    sql: ${TABLE}.sec_dep_start_date ;;
  }

  measure: security_enabled {
    type: yesno
    sql: ${TABLE}.security_enabled ;;
  }

  measure: single_door_fridge {
    type: yesno
    sql: ${TABLE}.single_door_fridge ;;
  }

  measure: single_door_fridge_acquisition {
    type: number
    sql: ${TABLE}.single_door_fridge_acquisition ;;
  }

  measure: single_door_fridge_items {
    type: number
    sql: ${TABLE}.single_door_fridge_items ;;
  }

  measure: single_door_fridge_rent {
    type: yesno
    sql: ${TABLE}.single_door_fridge_rent ;;
  }

  measure: snacks_price {
    type: number
    sql: ${TABLE}.snacks_price ;;
  }

  measure: starting_pric_db {
    type: number
    sql: ${TABLE}.starting_pric_db ;;
  }

  measure: starting_price_website {
    type: number
    sql: ${TABLE}.starting_price_website ;;
  }

  measure: student_non_refundable_security_deposit {
    type: number
    sql: ${TABLE}.student_non_refundable_security_deposit ;;
  }

  measure: student_refundable_security_deposit {
    type: number
    sql: ${TABLE}.student_refundable_security_deposit ;;
  }

  measure: supplies_enabled {
    type: string
    sql: ${TABLE}.supplies_enabled ;;
  }

  measure: tea {
    type: number
    sql: ${TABLE}.tea ;;
  }

  measure: transport_availability {
    type: string
    sql: ${TABLE}.transport_availability ;;
  }

  measure: transport_enabled {
    type: yesno
    sql: ${TABLE}.transport_enabled ;;
  }

  measure: transport_package_enabled {
    type: yesno
    sql: ${TABLE}.transport_package_enabled ;;
  }

  measure: transport_schedule {
    type: string
    sql: ${TABLE}.transport_schedule ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: version_from {
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
    sql: ${TABLE}.version_from_date ;;
  }

  measure: wash_iron_days {
    type: number
    sql: ${TABLE}.wash_iron_days ;;
  }

  measure: wash_iron_enabled {
    type: yesno
    sql: ${TABLE}.wash_iron_enabled ;;
  }

  measure: wash_iron_limit {
    type: string
    sql: ${TABLE}.wash_iron_limit ;;
  }

  measure: washing_machine {
    type: yesno
    sql: ${TABLE}.washing_machine ;;
  }

  measure: washing_machine_acquisition {
    type: string
    sql: ${TABLE}.washing_machine_acquisition ;;
  }

  measure: washing_machine_items {
    type: number
    sql: ${TABLE}.washing_machine_items ;;
  }

  measure: washing_machine_rent {
    type: number
    sql: ${TABLE}.washing_machine_rent ;;
  }

  measure: water_dispenser {
    type: yesno
    sql: ${TABLE}.water_dispenser ;;
  }

  measure: water_dispenser_items {
    type: number
    sql: ${TABLE}.water_dispenser_items ;;
  }

  measure: water_dispenser_rent {
    type: number
    sql: ${TABLE}.water_dispenser_rent ;;
  }

  measure: nm {
    type: number
    sql: 1 ;;
    hidden: yes
  }


  measure: count {
    type: count
    drill_fields: [id, residence_name, menu_category_name]
  }

  measure: list_occ_stp {
    type: string
    sql: group_concat(distinct(is_cheat_sheet.occ_stp) SEPARATOR  ',\n') ;;
  }



  measure: list_occ_stp_temp {
    type: string
    sql: ${list_occ_stp};;
    html: {% assign words = value | split: ', ' %}
     <ul>
     {% for word in words %}
     <li>{{ word }}</li>
     {% endfor %} ;;
  }

  measure: list_payment_option {
    type: string
    sql: group_concat(distinct(is_cheat_sheet.payment_terms)) ;;
  }


  measure: list_tenure_option {
    type: string
    sql: group_concat(distinct(is_cheat_sheet.contract_months)) ;;
  }

  measure: list_landmarks_website {
    type: string
    sql: group_concat(distinct(is_cheat_sheet.landmarks_website)) ;;
  }

  measure: night_curfew_timing_mesure {
    type: time
    sql: ${TABLE}.night_curfew_timing ;;
  }

  measure: common_geyser_timing_mesure {
    type: string
    sql: ${TABLE}.common_geyser_timing ;;
  }


}
