view: is_cheat_sheet {
  sql_table_name: looker_demo.is_cheat_sheet ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ac_acquisition {
    type: string
    sql: ${TABLE}.ac_acquisition ;;
  }

  dimension: ac_enabled {
    type: yesno
    sql: ${TABLE}.ac_enabled ;;
  }

  dimension: ac_items {
    type: number
    sql: ${TABLE}.ac_items ;;
  }

  dimension: ac_payment_mode {
    type: string
    sql: ${TABLE}.ac_payment_mode ;;
  }

  dimension: ac_rent {
    type: number
    sql: ${TABLE}.ac_rent ;;
  }

  dimension: ac_timing {
    type: string
    sql: ${TABLE}.ac_timing ;;
  }

  dimension: ancillary_services {
    type: string
    sql: ${TABLE}.ancillary_services ;;
  }

  dimension: attributes {
    type: string
    sql: ${TABLE}.attributes ;;
  }

  dimension: bio_metric_enabled {
    type: yesno
    sql: ${TABLE}.bio_metric_enabled ;;
  }

  dimension: blanket_approval {
    type: yesno
    sql: ${TABLE}.blanket_approval ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: breakfast_price {
    type: number
    sql: ${TABLE}.breakfast_price ;;
  }

  dimension: cafetaria_enabled {
    type: yesno
    sql: ${TABLE}.cafetaria_enabled ;;
  }

  dimension: cafetaria_timing {
    type: string
    sql: ${TABLE}.cafetaria_timing ;;
  }

  dimension: card_access_enabled {
    type: yesno
    sql: ${TABLE}.card_access_enabled ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: chicken {
    type: number
    sql: ${TABLE}.chicken ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: coffee {
    type: number
    sql: ${TABLE}.coffee ;;
  }

  dimension: common_area_days {
    type: number
    sql: ${TABLE}.common_area_days ;;
  }

  dimension: common_area_dth {
    type: yesno
    sql: ${TABLE}.common_area_dth ;;
  }

  dimension: common_area_enabled {
    type: yesno
    sql: ${TABLE}.common_area_enabled ;;
  }

  dimension: common_area_enabled_hk {
    type: yesno
    sql: ${TABLE}.common_area_enabled_hk ;;
  }

  dimension: common_area_payment_mode {
    type: string
    sql: ${TABLE}.common_area_payment_mode ;;
  }

  dimension: common_bathroom_days {
    type: number
    sql: ${TABLE}.common_bathroom_days ;;
  }

  dimension: common_bathroom_enabled {
    type: yesno
    sql: ${TABLE}.common_bathroom_enabled ;;
  }

  dimension: common_geyser_acquisition {
    type: string
    sql: ${TABLE}.common_geyser_acquisition ;;
  }

  dimension: common_geyser_enabled {
    type: yesno
    sql: ${TABLE}.common_geyser_enabled ;;
  }

  dimension: common_geyser_items {
    type: number
    sql: ${TABLE}.common_geyser_items ;;
  }

  dimension: common_geyser_payment_mode {
    type: string
    sql: ${TABLE}.common_geyser_payment_mode ;;
  }

  dimension: common_geyser_rent {
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

  dimension: consumables {
    type: string
    sql: ${TABLE}.consumables ;;
  }

  dimension: contract_emi_months {
    type: number
    sql: ${TABLE}.contract_emi_months ;;
  }

  dimension: contract_is_active {
    type: yesno
    sql: ${TABLE}.contract_is_active ;;
  }

  dimension: contract_months {
    type: number
    sql: ${TABLE}.contract_months ;;
  }

  dimension: contract_type {
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

  dimension: dessert {
    type: number
    sql: ${TABLE}.dessert ;;
  }

  dimension: dinner_price {
    type: number
    sql: ${TABLE}.dinner_price ;;
  }

  dimension: double_door_fridge {
    type: yesno
    sql: ${TABLE}.double_door_fridge ;;
  }

  dimension: double_door_fridge_acquisition {
    type: number
    sql: ${TABLE}.double_door_fridge_acquisition ;;
  }

  dimension: double_door_fridge_items {
    type: yesno
    sql: ${TABLE}.double_door_fridge_items ;;
  }

  dimension: double_door_fridge_rent {
    type: number
    sql: ${TABLE}.double_door_fridge_rent ;;
  }

  dimension: egg {
    type: number
    sql: ${TABLE}.egg ;;
  }

  dimension: electricity_enabled {
    type: yesno
    sql: ${TABLE}.electricity_enabled ;;
  }

  dimension: fitness_zone___location {
    type: string
    sql: ${TABLE}.fitness_zone___location ;;
  }

  dimension: fitness_zone_enabled {
    type: yesno
    sql: ${TABLE}.fitness_zone_enabled ;;
  }

  dimension: fitness_zone_package_enabled {
    type: yesno
    sql: ${TABLE}.fitness_zone_package_enabled ;;
  }

  dimension: fitness_zone_timing {
    type: string
    sql: ${TABLE}.fitness_zone_timing ;;
  }

  dimension: fomo_tag_website {
    type: string
    sql: ${TABLE}.fomo_tag_website ;;
  }

  dimension: food_menu_category_cat {
    type: string
    sql: ${TABLE}.food_menu_category_cat ;;
  }

  dimension: food_menu_enabled {
    type: yesno
    sql: ${TABLE}.food_menu_enabled ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: google_map_link_website {
    type: string
    sql: ${TABLE}.google_map_link_website ;;
  }

  dimension: house_keeping_enabled {
    type: yesno
    sql: ${TABLE}.house_keeping_enabled ;;
  }

  dimension: in_suite_bathroom_days {
    type: number
    sql: ${TABLE}.in_suite_bathroom_days ;;
  }

  dimension: in_suite_bathroom_enabled {
    type: yesno
    sql: ${TABLE}.in_suite_bathroom_enabled ;;
  }

  dimension: included_till_x_km_ {
    type: number
    sql: ${TABLE}.included_till_x_km_ ;;
  }

  dimension: internet_devices {
    type: number
    sql: ${TABLE}.internet_devices ;;
  }

  dimension: internet_enabled {
    type: yesno
    sql: ${TABLE}.internet_enabled ;;
  }

  dimension: internet_offering {
    type: string
    sql: ${TABLE}.internet_offering ;;
  }

  dimension: internet_package_enabled {
    type: yesno
    sql: ${TABLE}.internet_package_enabled ;;
  }

  dimension: internet_vendor {
    type: string
    sql: ${TABLE}.internet_vendor ;;
  }

  dimension: landmarks_website {
    type: string
    sql: ${TABLE}.landmarks_website ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: laundry_enabled {
    type: yesno
    sql: ${TABLE}.laundry_enabled ;;
  }

  dimension: linen_change_days {
    type: number
    sql: ${TABLE}.linen_change_days ;;
  }

  dimension: linen_change_enabled {
    type: yesno
    sql: ${TABLE}.linen_change_enabled ;;
  }

  dimension: location_website {
    type: string
    sql: ${TABLE}.location_website ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: lunch_price {
    type: number
    sql: ${TABLE}.lunch_price ;;
  }

  dimension: meal_serve_days {
    type: string
    sql: ${TABLE}.meal_serve_days ;;
  }

  dimension: menu_category_name {
    type: string
    sql: ${TABLE}.menu_category_name ;;
  }

  dimension: menu_price {
    type: number
    sql: ${TABLE}.menu_price ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: microwave {
    type: yesno
    sql: ${TABLE}.microwave ;;
  }

  dimension: microwave_acquisition {
    type: string
    sql: ${TABLE}.microwave_acquisition ;;
  }

  dimension: microwave_items {
    type: number
    sql: ${TABLE}.microwave_items ;;
  }

  dimension: microwave_rent {
    type: number
    sql: ${TABLE}.microwave_rent ;;
  }

  dimension: milk {
    type: number
    sql: ${TABLE}.milk ;;
  }

  dimension: night_curfew_enabled {
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

  dimension: occ_stp {
    type: string
    sql: ${TABLE}.occ_stp ;;
  }

  dimension: occupancy {
    type: number
    sql: ${TABLE}.occupancy ;;
  }

  dimension: occupancy_pricing {
    type: string
    sql: ${TABLE}.occupancy_pricing ;;
  }

  dimension: other_waterdispenser_acquisition {
    type: string
    sql: ${TABLE}.other_waterdispenser_acquisition ;;
  }

  dimension: others_services_enabled {
    type: yesno
    sql: ${TABLE}.others_services_enabled ;;
  }

  dimension: paneer {
    type: number
    sql: ${TABLE}.paneer ;;
  }

  dimension: payment_terms {
    type: string
    sql: ${TABLE}.payment_terms ;;
  }

  dimension: power_backup_acquisition {
    type: string
    sql: ${TABLE}.power_backup_acquisition ;;
  }

  dimension: power_backup_enabled {
    type: yesno
    sql: ${TABLE}.power_backup_enabled ;;
  }

  dimension: power_backup_items {
    type: number
    sql: ${TABLE}.power_backup_items ;;
  }

  dimension: power_backup_rent {
    type: number
    sql: ${TABLE}.power_backup_rent ;;
  }

  dimension: power_backup_type {
    type: string
    sql: ${TABLE}.power_backup_type ;;
  }

  dimension: pre_booking_amount {
    type: number
    sql: ${TABLE}.pre_booking_amount ;;
  }

  dimension: provided_for {
    type: string
    sql: ${TABLE}.provided_for ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: room_days {
    type: number
    sql: ${TABLE}.room_days ;;
  }

  dimension: room_dth_acquisition {
    type: string
    sql: ${TABLE}.room_dth_acquisition ;;
  }

  dimension: room_dth_items {
    type: number
    sql: ${TABLE}.room_dth_items ;;
  }

  dimension: room_dth_rent {
    type: number
    sql: ${TABLE}.room_dth_rent ;;
  }

  dimension: room_enabled {
    type: yesno
    sql: ${TABLE}.room_enabled ;;
  }

  dimension: room_enabled_hk {
    type: yesno
    sql: ${TABLE}.room_enabled_hk ;;
  }

  dimension: room_geyser_acquisition {
    type: string
    sql: ${TABLE}.room_geyser_acquisition ;;
  }

  dimension: room_geyser_enabled {
    type: yesno
    sql: ${TABLE}.room_geyser_enabled ;;
  }

  dimension: room_geyser_items {
    type: number
    sql: ${TABLE}.room_geyser_items ;;
  }

  dimension: room_geyser_payment_mode {
    type: string
    sql: ${TABLE}.room_geyser_payment_mode ;;
  }

  dimension: room_geyser_rent {
    type: number
    sql: ${TABLE}.room_geyser_rent ;;
  }

  dimension: room_geyser_timing {
    type: string
    sql: ${TABLE}.room_geyser_timing ;;
  }

  dimension: room_payment_mode {
    type: string
    sql: ${TABLE}.room_payment_mode ;;
  }

  dimension: room_unit_rate {
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

  dimension: security_enabled {
    type: yesno
    sql: ${TABLE}.security_enabled ;;
  }

  dimension: single_door_fridge {
    type: yesno
    sql: ${TABLE}.single_door_fridge ;;
  }

  dimension: single_door_fridge_acquisition {
    type: number
    sql: ${TABLE}.single_door_fridge_acquisition ;;
  }

  dimension: single_door_fridge_items {
    type: number
    sql: ${TABLE}.single_door_fridge_items ;;
  }

  dimension: single_door_fridge_rent {
    type: yesno
    sql: ${TABLE}.single_door_fridge_rent ;;
  }

  dimension: snacks_price {
    type: number
    sql: ${TABLE}.snacks_price ;;
  }

  dimension: starting_pric_db {
    type: number
    sql: ${TABLE}.starting_pric_db ;;
  }

  dimension: starting_price_website {
    type: number
    sql: ${TABLE}.starting_price_website ;;
  }

  dimension: student_non_refundable_security_deposit {
    type: number
    sql: ${TABLE}.student_non_refundable_security_deposit ;;
  }

  dimension: student_refundable_security_deposit {
    type: number
    sql: ${TABLE}.student_refundable_security_deposit ;;
  }

  dimension: supplies_enabled {
    type: string
    sql: ${TABLE}.supplies_enabled ;;
  }

  dimension: tea {
    type: number
    sql: ${TABLE}.tea ;;
  }

  dimension: transport_availability {
    type: string
    sql: ${TABLE}.transport_availability ;;
  }

  dimension: transport_enabled {
    type: yesno
    sql: ${TABLE}.transport_enabled ;;
  }

  dimension: transport_package_enabled {
    type: yesno
    sql: ${TABLE}.transport_package_enabled ;;
  }

  dimension: transport_schedule {
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

  dimension: wash_iron_days {
    type: number
    sql: ${TABLE}.wash_iron_days ;;
  }

  dimension: wash_iron_enabled {
    type: yesno
    sql: ${TABLE}.wash_iron_enabled ;;
  }

  dimension: wash_iron_limit {
    type: string
    sql: ${TABLE}.wash_iron_limit ;;
  }

  dimension: washing_machine {
    type: yesno
    sql: ${TABLE}.washing_machine ;;
  }

  dimension: washing_machine_acquisition {
    type: string
    sql: ${TABLE}.washing_machine_acquisition ;;
  }

  dimension: washing_machine_items {
    type: number
    sql: ${TABLE}.washing_machine_items ;;
  }

  dimension: washing_machine_rent {
    type: number
    sql: ${TABLE}.washing_machine_rent ;;
  }

  dimension: water_dispenser {
    type: yesno
    sql: ${TABLE}.water_dispenser ;;
  }

  dimension: water_dispenser_items {
    type: number
    sql: ${TABLE}.water_dispenser_items ;;
  }

  dimension: water_dispenser_rent {
    type: number
    sql: ${TABLE}.water_dispenser_rent ;;
  }

  dimension: nm {
    type: number
    sql: 1 ;;
    hidden: yes
  }

  measure: nmt {
    type: sum
    sql: ${nm} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, residence_name, menu_category_name]
  }

  measure: list_occ_stp {
    type: string
    sql: group_concat(${occ_stp}, ', ') ;;
  }

}
