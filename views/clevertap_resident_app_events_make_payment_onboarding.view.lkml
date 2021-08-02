view: clevertap_resident_app_events_make_payment_onboarding {
  sql_table_name: stanza.clevertap_resident_app_events_make_payment_onboarding ;;

  dimension: __hevo__ingested_at {
    type: number
    sql: ${TABLE}.__hevo__ingested_at ;;
  }

  dimension: __hevo__loaded_at {
    type: number
    sql: ${TABLE}.__hevo__loaded_at ;;
  }

  dimension: __hevo_id {
    type: string
    sql: ${TABLE}.__hevo_id ;;
  }

  dimension: event_props_ct_app_version {
    type: string
    sql: ${TABLE}.event_props_ct_app_version ;;
  }

  dimension: event_props_ct_source {
    type: string
    sql: ${TABLE}.event_props_ct_source ;;
  }

  dimension: event_props_eventtime {
    type: string
    sql: ${TABLE}.event_props_eventtime ;;
  }

  dimension: event_props_screenname {
    type: string
    sql: ${TABLE}.event_props_screenname ;;
  }

  dimension: profile_app_version {
    type: string
    sql: ${TABLE}.profile_app_version ;;
  }

  dimension: profile_df_0 {
    type: number
    sql: ${TABLE}.profile_df_0 ;;
  }

  dimension: profile_df_1 {
    type: number
    sql: ${TABLE}.profile_df_1 ;;
  }

  dimension: profile_df_2 {
    type: number
    sql: ${TABLE}.profile_df_2 ;;
  }

  dimension: profile_email {
    type: string
    sql: ${TABLE}.profile_email ;;
  }

  dimension: profile_events_add_vas_count {
    type: number
    sql: ${TABLE}.profile_events_add_vas_count ;;
  }

  dimension: profile_events_add_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_add_vas_first_seen ;;
  }

  dimension: profile_events_add_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_add_vas_last_seen ;;
  }

  dimension: profile_events_address_details_count {
    type: number
    sql: ${TABLE}.profile_events_address_details_count ;;
  }

  dimension: profile_events_address_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_address_details_first_seen ;;
  }

  dimension: profile_events_address_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_address_details_last_seen ;;
  }

  dimension: profile_events_allow_edit_raise_issue_count {
    type: number
    sql: ${TABLE}.profile_events_allow_edit_raise_issue_count ;;
  }

  dimension: profile_events_allow_edit_raise_issue_first_seen {
    type: number
    sql: ${TABLE}.profile_events_allow_edit_raise_issue_first_seen ;;
  }

  dimension: profile_events_allow_edit_raise_issue_last_seen {
    type: number
    sql: ${TABLE}.profile_events_allow_edit_raise_issue_last_seen ;;
  }

  dimension: profile_events_amenities_hamburger_menu_count {
    type: number
    sql: ${TABLE}.profile_events_amenities_hamburger_menu_count ;;
  }

  dimension: profile_events_amenities_hamburger_menu_first_seen {
    type: number
    sql: ${TABLE}.profile_events_amenities_hamburger_menu_first_seen ;;
  }

  dimension: profile_events_amenities_hamburger_menu_last_seen {
    type: number
    sql: ${TABLE}.profile_events_amenities_hamburger_menu_last_seen ;;
  }

  dimension: profile_events_app_installed_count {
    type: number
    sql: ${TABLE}.profile_events_app_installed_count ;;
  }

  dimension: profile_events_app_installed_first_seen {
    type: number
    sql: ${TABLE}.profile_events_app_installed_first_seen ;;
  }

  dimension: profile_events_app_installed_last_seen {
    type: number
    sql: ${TABLE}.profile_events_app_installed_last_seen ;;
  }

  dimension: profile_events_app_launched_count {
    type: number
    sql: ${TABLE}.profile_events_app_launched_count ;;
  }

  dimension: profile_events_app_launched_first_seen {
    type: number
    sql: ${TABLE}.profile_events_app_launched_first_seen ;;
  }

  dimension: profile_events_app_launched_last_seen {
    type: number
    sql: ${TABLE}.profile_events_app_launched_last_seen ;;
  }

  dimension: profile_events_app_uninstalled_count {
    type: number
    sql: ${TABLE}.profile_events_app_uninstalled_count ;;
  }

  dimension: profile_events_app_uninstalled_first_seen {
    type: number
    sql: ${TABLE}.profile_events_app_uninstalled_first_seen ;;
  }

  dimension: profile_events_app_uninstalled_last_seen {
    type: number
    sql: ${TABLE}.profile_events_app_uninstalled_last_seen ;;
  }

  dimension: profile_events_app_version_changed_count {
    type: number
    sql: ${TABLE}.profile_events_app_version_changed_count ;;
  }

  dimension: profile_events_app_version_changed_first_seen {
    type: number
    sql: ${TABLE}.profile_events_app_version_changed_first_seen ;;
  }

  dimension: profile_events_app_version_changed_last_seen {
    type: number
    sql: ${TABLE}.profile_events_app_version_changed_last_seen ;;
  }

  dimension: profile_events_available_payment_options_count {
    type: number
    sql: ${TABLE}.profile_events_available_payment_options_count ;;
  }

  dimension: profile_events_available_payment_options_first_seen {
    type: number
    sql: ${TABLE}.profile_events_available_payment_options_first_seen ;;
  }

  dimension: profile_events_available_payment_options_last_seen {
    type: number
    sql: ${TABLE}.profile_events_available_payment_options_last_seen ;;
  }

  dimension: profile_events_back_to_home_no_notification_count {
    type: number
    sql: ${TABLE}.profile_events_back_to_home_no_notification_count ;;
  }

  dimension: profile_events_back_to_home_no_notification_first_seen {
    type: number
    sql: ${TABLE}.profile_events_back_to_home_no_notification_first_seen ;;
  }

  dimension: profile_events_back_to_home_no_notification_last_seen {
    type: number
    sql: ${TABLE}.profile_events_back_to_home_no_notification_last_seen ;;
  }

  dimension: profile_events_back_to_support_count {
    type: number
    sql: ${TABLE}.profile_events_back_to_support_count ;;
  }

  dimension: profile_events_back_to_support_first_seen {
    type: number
    sql: ${TABLE}.profile_events_back_to_support_first_seen ;;
  }

  dimension: profile_events_back_to_support_last_seen {
    type: number
    sql: ${TABLE}.profile_events_back_to_support_last_seen ;;
  }

  dimension: profile_events_bank_details_count {
    type: number
    sql: ${TABLE}.profile_events_bank_details_count ;;
  }

  dimension: profile_events_bank_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_bank_details_first_seen ;;
  }

  dimension: profile_events_bank_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_bank_details_last_seen ;;
  }

  dimension: profile_events_booking_card_count {
    type: number
    sql: ${TABLE}.profile_events_booking_card_count ;;
  }

  dimension: profile_events_booking_card_first_seen {
    type: number
    sql: ${TABLE}.profile_events_booking_card_first_seen ;;
  }

  dimension: profile_events_booking_card_last_seen {
    type: number
    sql: ${TABLE}.profile_events_booking_card_last_seen ;;
  }

  dimension: profile_events_bottom_navigation_count {
    type: number
    sql: ${TABLE}.profile_events_bottom_navigation_count ;;
  }

  dimension: profile_events_bottom_navigation_first_seen {
    type: number
    sql: ${TABLE}.profile_events_bottom_navigation_first_seen ;;
  }

  dimension: profile_events_bottom_navigation_last_seen {
    type: number
    sql: ${TABLE}.profile_events_bottom_navigation_last_seen ;;
  }

  dimension: profile_events_call_staff_count {
    type: number
    sql: ${TABLE}.profile_events_call_staff_count ;;
  }

  dimension: profile_events_call_staff_first_seen {
    type: number
    sql: ${TABLE}.profile_events_call_staff_first_seen ;;
  }

  dimension: profile_events_call_staff_last_seen {
    type: number
    sql: ${TABLE}.profile_events_call_staff_last_seen ;;
  }

  dimension: profile_events_capture_selfie_count {
    type: number
    sql: ${TABLE}.profile_events_capture_selfie_count ;;
  }

  dimension: profile_events_capture_selfie_first_seen {
    type: number
    sql: ${TABLE}.profile_events_capture_selfie_first_seen ;;
  }

  dimension: profile_events_capture_selfie_last_seen {
    type: number
    sql: ${TABLE}.profile_events_capture_selfie_last_seen ;;
  }

  dimension: profile_events_change_payment_mode_count {
    type: number
    sql: ${TABLE}.profile_events_change_payment_mode_count ;;
  }

  dimension: profile_events_change_payment_mode_first_seen {
    type: number
    sql: ${TABLE}.profile_events_change_payment_mode_first_seen ;;
  }

  dimension: profile_events_change_payment_mode_last_seen {
    type: number
    sql: ${TABLE}.profile_events_change_payment_mode_last_seen ;;
  }

  dimension: profile_events_college_details_count {
    type: number
    sql: ${TABLE}.profile_events_college_details_count ;;
  }

  dimension: profile_events_college_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_college_details_first_seen ;;
  }

  dimension: profile_events_college_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_college_details_last_seen ;;
  }

  dimension: profile_events_complaint_category_click_count {
    type: number
    sql: ${TABLE}.profile_events_complaint_category_click_count ;;
  }

  dimension: profile_events_complaint_category_click_first_seen {
    type: number
    sql: ${TABLE}.profile_events_complaint_category_click_first_seen ;;
  }

  dimension: profile_events_complaint_category_click_last_seen {
    type: number
    sql: ${TABLE}.profile_events_complaint_category_click_last_seen ;;
  }

  dimension: profile_events_complete_kyc_count {
    type: number
    sql: ${TABLE}.profile_events_complete_kyc_count ;;
  }

  dimension: profile_events_complete_kyc_first_seen {
    type: number
    sql: ${TABLE}.profile_events_complete_kyc_first_seen ;;
  }

  dimension: profile_events_complete_kyc_last_seen {
    type: number
    sql: ${TABLE}.profile_events_complete_kyc_last_seen ;;
  }

  dimension: profile_events_contact_us_count {
    type: number
    sql: ${TABLE}.profile_events_contact_us_count ;;
  }

  dimension: profile_events_contact_us_first_seen {
    type: number
    sql: ${TABLE}.profile_events_contact_us_first_seen ;;
  }

  dimension: profile_events_contact_us_last_seen {
    type: number
    sql: ${TABLE}.profile_events_contact_us_last_seen ;;
  }

  dimension: profile_events_continue_onboarding_count {
    type: number
    sql: ${TABLE}.profile_events_continue_onboarding_count ;;
  }

  dimension: profile_events_continue_onboarding_first_seen {
    type: number
    sql: ${TABLE}.profile_events_continue_onboarding_first_seen ;;
  }

  dimension: profile_events_continue_onboarding_last_seen {
    type: number
    sql: ${TABLE}.profile_events_continue_onboarding_last_seen ;;
  }

  dimension: profile_events_continue_vas_count {
    type: number
    sql: ${TABLE}.profile_events_continue_vas_count ;;
  }

  dimension: profile_events_continue_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_continue_vas_first_seen ;;
  }

  dimension: profile_events_continue_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_continue_vas_last_seen ;;
  }

  dimension: profile_events_contract_ends_on_count {
    type: number
    sql: ${TABLE}.profile_events_contract_ends_on_count ;;
  }

  dimension: profile_events_contract_ends_on_first_seen {
    type: number
    sql: ${TABLE}.profile_events_contract_ends_on_first_seen ;;
  }

  dimension: profile_events_contract_ends_on_last_seen {
    type: number
    sql: ${TABLE}.profile_events_contract_ends_on_last_seen ;;
  }

  dimension: profile_events_coupon_cta_count {
    type: number
    sql: ${TABLE}.profile_events_coupon_cta_count ;;
  }

  dimension: profile_events_coupon_cta_first_seen {
    type: number
    sql: ${TABLE}.profile_events_coupon_cta_first_seen ;;
  }

  dimension: profile_events_coupon_cta_last_seen {
    type: number
    sql: ${TABLE}.profile_events_coupon_cta_last_seen ;;
  }

  dimension: profile_events_directions_count {
    type: number
    sql: ${TABLE}.profile_events_directions_count ;;
  }

  dimension: profile_events_directions_first_seen {
    type: number
    sql: ${TABLE}.profile_events_directions_first_seen ;;
  }

  dimension: profile_events_directions_last_seen {
    type: number
    sql: ${TABLE}.profile_events_directions_last_seen ;;
  }

  dimension: profile_events_download_sample_count {
    type: number
    sql: ${TABLE}.profile_events_download_sample_count ;;
  }

  dimension: profile_events_download_sample_first_seen {
    type: number
    sql: ${TABLE}.profile_events_download_sample_first_seen ;;
  }

  dimension: profile_events_download_sample_last_seen {
    type: number
    sql: ${TABLE}.profile_events_download_sample_last_seen ;;
  }

  dimension: profile_events_edit_address_details_count {
    type: number
    sql: ${TABLE}.profile_events_edit_address_details_count ;;
  }

  dimension: profile_events_edit_address_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_address_details_first_seen ;;
  }

  dimension: profile_events_edit_address_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_address_details_last_seen ;;
  }

  dimension: profile_events_edit_contract_period_count {
    type: number
    sql: ${TABLE}.profile_events_edit_contract_period_count ;;
  }

  dimension: profile_events_edit_contract_period_first_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_contract_period_first_seen ;;
  }

  dimension: profile_events_edit_contract_period_last_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_contract_period_last_seen ;;
  }

  dimension: profile_events_edit_emergency_details_count {
    type: number
    sql: ${TABLE}.profile_events_edit_emergency_details_count ;;
  }

  dimension: profile_events_edit_emergency_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_emergency_details_first_seen ;;
  }

  dimension: profile_events_edit_emergency_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_emergency_details_last_seen ;;
  }

  dimension: profile_events_edit_vas_count {
    type: number
    sql: ${TABLE}.profile_events_edit_vas_count ;;
  }

  dimension: profile_events_edit_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_vas_first_seen ;;
  }

  dimension: profile_events_edit_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_vas_last_seen ;;
  }

  dimension: profile_events_edit_work_college_coaching_details_count {
    type: number
    sql: ${TABLE}.profile_events_edit_work_college_coaching_details_count ;;
  }

  dimension: profile_events_edit_work_college_coaching_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_work_college_coaching_details_first_seen ;;
  }

  dimension: profile_events_edit_work_college_coaching_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_edit_work_college_coaching_details_last_seen ;;
  }

  dimension: profile_events_emergency_details_count {
    type: number
    sql: ${TABLE}.profile_events_emergency_details_count ;;
  }

  dimension: profile_events_emergency_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_emergency_details_first_seen ;;
  }

  dimension: profile_events_emergency_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_emergency_details_last_seen ;;
  }

  dimension: profile_events_explore_stanza_living_count {
    type: number
    sql: ${TABLE}.profile_events_explore_stanza_living_count ;;
  }

  dimension: profile_events_explore_stanza_living_first_seen {
    type: number
    sql: ${TABLE}.profile_events_explore_stanza_living_first_seen ;;
  }

  dimension: profile_events_explore_stanza_living_last_seen {
    type: number
    sql: ${TABLE}.profile_events_explore_stanza_living_last_seen ;;
  }

  dimension: profile_events_fab_button_count {
    type: number
    sql: ${TABLE}.profile_events_fab_button_count ;;
  }

  dimension: profile_events_fab_button_first_seen {
    type: number
    sql: ${TABLE}.profile_events_fab_button_first_seen ;;
  }

  dimension: profile_events_fab_button_last_seen {
    type: number
    sql: ${TABLE}.profile_events_fab_button_last_seen ;;
  }

  dimension: profile_events_fees_overdue_quick_pay_count {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_quick_pay_count ;;
  }

  dimension: profile_events_fees_overdue_quick_pay_first_seen {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_quick_pay_first_seen ;;
  }

  dimension: profile_events_fees_overdue_quick_pay_last_seen {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_quick_pay_last_seen ;;
  }

  dimension: profile_events_fees_overdue_view_details_count {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_view_details_count ;;
  }

  dimension: profile_events_fees_overdue_view_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_view_details_first_seen ;;
  }

  dimension: profile_events_fees_overdue_view_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_fees_overdue_view_details_last_seen ;;
  }

  dimension: profile_events_fill_details_bank_count {
    type: number
    sql: ${TABLE}.profile_events_fill_details_bank_count ;;
  }

  dimension: profile_events_fill_details_bank_first_seen {
    type: number
    sql: ${TABLE}.profile_events_fill_details_bank_first_seen ;;
  }

  dimension: profile_events_fill_details_bank_last_seen {
    type: number
    sql: ${TABLE}.profile_events_fill_details_bank_last_seen ;;
  }

  dimension: profile_events_finish_onboarding_count {
    type: number
    sql: ${TABLE}.profile_events_finish_onboarding_count ;;
  }

  dimension: profile_events_finish_onboarding_first_seen {
    type: number
    sql: ${TABLE}.profile_events_finish_onboarding_first_seen ;;
  }

  dimension: profile_events_finish_onboarding_last_seen {
    type: number
    sql: ${TABLE}.profile_events_finish_onboarding_last_seen ;;
  }

  dimension: profile_events_food_feedback_count {
    type: number
    sql: ${TABLE}.profile_events_food_feedback_count ;;
  }

  dimension: profile_events_food_feedback_first_seen {
    type: number
    sql: ${TABLE}.profile_events_food_feedback_first_seen ;;
  }

  dimension: profile_events_food_feedback_last_seen {
    type: number
    sql: ${TABLE}.profile_events_food_feedback_last_seen ;;
  }

  dimension: profile_events_food_information_count {
    type: number
    sql: ${TABLE}.profile_events_food_information_count ;;
  }

  dimension: profile_events_food_information_first_seen {
    type: number
    sql: ${TABLE}.profile_events_food_information_first_seen ;;
  }

  dimension: profile_events_food_information_last_seen {
    type: number
    sql: ${TABLE}.profile_events_food_information_last_seen ;;
  }

  dimension: profile_events_home_icon_count {
    type: number
    sql: ${TABLE}.profile_events_home_icon_count ;;
  }

  dimension: profile_events_home_icon_first_seen {
    type: number
    sql: ${TABLE}.profile_events_home_icon_first_seen ;;
  }

  dimension: profile_events_home_icon_last_seen {
    type: number
    sql: ${TABLE}.profile_events_home_icon_last_seen ;;
  }

  dimension: profile_events_house_rules_count {
    type: number
    sql: ${TABLE}.profile_events_house_rules_count ;;
  }

  dimension: profile_events_house_rules_first_seen {
    type: number
    sql: ${TABLE}.profile_events_house_rules_first_seen ;;
  }

  dimension: profile_events_house_rules_last_seen {
    type: number
    sql: ${TABLE}.profile_events_house_rules_last_seen ;;
  }

  dimension: profile_events_identity_error_count {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_error_count ;;
  }

  dimension: profile_events_identity_error_first_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_error_first_seen ;;
  }

  dimension: profile_events_identity_error_last_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_error_last_seen ;;
  }

  dimension: profile_events_identity_reset_count {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_reset_count ;;
  }

  dimension: profile_events_identity_reset_first_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_reset_first_seen ;;
  }

  dimension: profile_events_identity_reset_last_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_reset_last_seen ;;
  }

  dimension: profile_events_identity_set_count {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_set_count ;;
  }

  dimension: profile_events_identity_set_first_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_set_first_seen ;;
  }

  dimension: profile_events_identity_set_last_seen {
    type: number
    value_format_name: id
    sql: ${TABLE}.profile_events_identity_set_last_seen ;;
  }

  dimension: profile_events_instalments_count {
    type: number
    sql: ${TABLE}.profile_events_instalments_count ;;
  }

  dimension: profile_events_instalments_first_seen {
    type: number
    sql: ${TABLE}.profile_events_instalments_first_seen ;;
  }

  dimension: profile_events_instalments_last_seen {
    type: number
    sql: ${TABLE}.profile_events_instalments_last_seen ;;
  }

  dimension: profile_events_invoice_ledger_count {
    type: number
    sql: ${TABLE}.profile_events_invoice_ledger_count ;;
  }

  dimension: profile_events_invoice_ledger_first_seen {
    type: number
    sql: ${TABLE}.profile_events_invoice_ledger_first_seen ;;
  }

  dimension: profile_events_invoice_ledger_last_seen {
    type: number
    sql: ${TABLE}.profile_events_invoice_ledger_last_seen ;;
  }

  dimension: profile_events_knowledge_center_count {
    type: number
    sql: ${TABLE}.profile_events_knowledge_center_count ;;
  }

  dimension: profile_events_knowledge_center_first_seen {
    type: number
    sql: ${TABLE}.profile_events_knowledge_center_first_seen ;;
  }

  dimension: profile_events_knowledge_center_last_seen {
    type: number
    sql: ${TABLE}.profile_events_knowledge_center_last_seen ;;
  }

  dimension: profile_events_ledger_details_count {
    type: number
    sql: ${TABLE}.profile_events_ledger_details_count ;;
  }

  dimension: profile_events_ledger_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_ledger_details_first_seen ;;
  }

  dimension: profile_events_ledger_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_ledger_details_last_seen ;;
  }

  dimension: profile_events_make_payment_onboarding_count {
    type: number
    sql: ${TABLE}.profile_events_make_payment_onboarding_count ;;
  }

  dimension: profile_events_make_payment_onboarding_first_seen {
    type: number
    sql: ${TABLE}.profile_events_make_payment_onboarding_first_seen ;;
  }

  dimension: profile_events_make_payment_onboarding_last_seen {
    type: number
    sql: ${TABLE}.profile_events_make_payment_onboarding_last_seen ;;
  }

  dimension: profile_events_meal_card_click_count {
    type: number
    sql: ${TABLE}.profile_events_meal_card_click_count ;;
  }

  dimension: profile_events_meal_card_click_first_seen {
    type: number
    sql: ${TABLE}.profile_events_meal_card_click_first_seen ;;
  }

  dimension: profile_events_meal_card_click_last_seen {
    type: number
    sql: ${TABLE}.profile_events_meal_card_click_last_seen ;;
  }

  dimension: profile_events_meal_rating_count {
    type: number
    sql: ${TABLE}.profile_events_meal_rating_count ;;
  }

  dimension: profile_events_meal_rating_first_seen {
    type: number
    sql: ${TABLE}.profile_events_meal_rating_first_seen ;;
  }

  dimension: profile_events_meal_rating_last_seen {
    type: number
    sql: ${TABLE}.profile_events_meal_rating_last_seen ;;
  }

  dimension: profile_events_menu_date_and_day_count {
    type: number
    sql: ${TABLE}.profile_events_menu_date_and_day_count ;;
  }

  dimension: profile_events_menu_date_and_day_first_seen {
    type: number
    sql: ${TABLE}.profile_events_menu_date_and_day_first_seen ;;
  }

  dimension: profile_events_menu_date_and_day_last_seen {
    type: number
    sql: ${TABLE}.profile_events_menu_date_and_day_last_seen ;;
  }

  dimension: profile_events_menu_vas_count {
    type: number
    sql: ${TABLE}.profile_events_menu_vas_count ;;
  }

  dimension: profile_events_menu_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_menu_vas_first_seen ;;
  }

  dimension: profile_events_menu_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_menu_vas_last_seen ;;
  }

  dimension: profile_events_my_commercials_card_count {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_card_count ;;
  }

  dimension: profile_events_my_commercials_card_first_seen {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_card_first_seen ;;
  }

  dimension: profile_events_my_commercials_card_last_seen {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_card_last_seen ;;
  }

  dimension: profile_events_my_commercials_quick_pay_count {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_quick_pay_count ;;
  }

  dimension: profile_events_my_commercials_quick_pay_first_seen {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_quick_pay_first_seen ;;
  }

  dimension: profile_events_my_commercials_quick_pay_last_seen {
    type: number
    sql: ${TABLE}.profile_events_my_commercials_quick_pay_last_seen ;;
  }

  dimension: profile_events_my_tickets_count {
    type: number
    sql: ${TABLE}.profile_events_my_tickets_count ;;
  }

  dimension: profile_events_my_tickets_first_seen {
    type: number
    sql: ${TABLE}.profile_events_my_tickets_first_seen ;;
  }

  dimension: profile_events_my_tickets_last_seen {
    type: number
    sql: ${TABLE}.profile_events_my_tickets_last_seen ;;
  }

  dimension: profile_events_non_veg_only_toggle_vas_count {
    type: number
    sql: ${TABLE}.profile_events_non_veg_only_toggle_vas_count ;;
  }

  dimension: profile_events_non_veg_only_toggle_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_non_veg_only_toggle_vas_first_seen ;;
  }

  dimension: profile_events_non_veg_only_toggle_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_non_veg_only_toggle_vas_last_seen ;;
  }

  dimension: profile_events_notification_bell_icon_count {
    type: number
    sql: ${TABLE}.profile_events_notification_bell_icon_count ;;
  }

  dimension: profile_events_notification_bell_icon_first_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_bell_icon_first_seen ;;
  }

  dimension: profile_events_notification_bell_icon_last_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_bell_icon_last_seen ;;
  }

  dimension: profile_events_notification_clicked_count {
    type: number
    sql: ${TABLE}.profile_events_notification_clicked_count ;;
  }

  dimension: profile_events_notification_clicked_first_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_clicked_first_seen ;;
  }

  dimension: profile_events_notification_clicked_last_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_clicked_last_seen ;;
  }

  dimension: profile_events_notification_viewed_count {
    type: number
    sql: ${TABLE}.profile_events_notification_viewed_count ;;
  }

  dimension: profile_events_notification_viewed_first_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_viewed_first_seen ;;
  }

  dimension: profile_events_notification_viewed_last_seen {
    type: number
    sql: ${TABLE}.profile_events_notification_viewed_last_seen ;;
  }

  dimension: profile_events_open_order_count {
    type: number
    sql: ${TABLE}.profile_events_open_order_count ;;
  }

  dimension: profile_events_open_order_first_seen {
    type: number
    sql: ${TABLE}.profile_events_open_order_first_seen ;;
  }

  dimension: profile_events_open_order_last_seen {
    type: number
    sql: ${TABLE}.profile_events_open_order_last_seen ;;
  }

  dimension: profile_events_order_food_online_count {
    type: number
    sql: ${TABLE}.profile_events_order_food_online_count ;;
  }

  dimension: profile_events_order_food_online_first_seen {
    type: number
    sql: ${TABLE}.profile_events_order_food_online_first_seen ;;
  }

  dimension: profile_events_order_food_online_last_seen {
    type: number
    sql: ${TABLE}.profile_events_order_food_online_last_seen ;;
  }

  dimension: profile_events_order_history_count {
    type: number
    sql: ${TABLE}.profile_events_order_history_count ;;
  }

  dimension: profile_events_order_history_first_seen {
    type: number
    sql: ${TABLE}.profile_events_order_history_first_seen ;;
  }

  dimension: profile_events_order_history_last_seen {
    type: number
    sql: ${TABLE}.profile_events_order_history_last_seen ;;
  }

  dimension: profile_events_packaged_services_count {
    type: number
    sql: ${TABLE}.profile_events_packaged_services_count ;;
  }

  dimension: profile_events_packaged_services_first_seen {
    type: number
    sql: ${TABLE}.profile_events_packaged_services_first_seen ;;
  }

  dimension: profile_events_packaged_services_last_seen {
    type: number
    sql: ${TABLE}.profile_events_packaged_services_last_seen ;;
  }

  dimension: profile_events_past_orders_count {
    type: number
    sql: ${TABLE}.profile_events_past_orders_count ;;
  }

  dimension: profile_events_past_orders_first_seen {
    type: number
    sql: ${TABLE}.profile_events_past_orders_first_seen ;;
  }

  dimension: profile_events_past_orders_last_seen {
    type: number
    sql: ${TABLE}.profile_events_past_orders_last_seen ;;
  }

  dimension: profile_events_payable_per_month_count {
    type: number
    sql: ${TABLE}.profile_events_payable_per_month_count ;;
  }

  dimension: profile_events_payable_per_month_first_seen {
    type: number
    sql: ${TABLE}.profile_events_payable_per_month_first_seen ;;
  }

  dimension: profile_events_payable_per_month_last_seen {
    type: number
    sql: ${TABLE}.profile_events_payable_per_month_last_seen ;;
  }

  dimension: profile_events_payment_history_count {
    type: number
    sql: ${TABLE}.profile_events_payment_history_count ;;
  }

  dimension: profile_events_payment_history_first_seen {
    type: number
    sql: ${TABLE}.profile_events_payment_history_first_seen ;;
  }

  dimension: profile_events_payment_history_last_seen {
    type: number
    sql: ${TABLE}.profile_events_payment_history_last_seen ;;
  }

  dimension: profile_events_payment_plan_count {
    type: number
    sql: ${TABLE}.profile_events_payment_plan_count ;;
  }

  dimension: profile_events_payment_plan_first_seen {
    type: number
    sql: ${TABLE}.profile_events_payment_plan_first_seen ;;
  }

  dimension: profile_events_payment_plan_last_seen {
    type: number
    sql: ${TABLE}.profile_events_payment_plan_last_seen ;;
  }

  dimension: profile_events_personal_details_count {
    type: number
    sql: ${TABLE}.profile_events_personal_details_count ;;
  }

  dimension: profile_events_personal_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_personal_details_first_seen ;;
  }

  dimension: profile_events_personal_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_personal_details_last_seen ;;
  }

  dimension: profile_events_privacy_policy_count {
    type: number
    sql: ${TABLE}.profile_events_privacy_policy_count ;;
  }

  dimension: profile_events_privacy_policy_first_seen {
    type: number
    sql: ${TABLE}.profile_events_privacy_policy_first_seen ;;
  }

  dimension: profile_events_privacy_policy_last_seen {
    type: number
    sql: ${TABLE}.profile_events_privacy_policy_last_seen ;;
  }

  dimension: profile_events_proceed_to_pay_vas_count {
    type: number
    sql: ${TABLE}.profile_events_proceed_to_pay_vas_count ;;
  }

  dimension: profile_events_proceed_to_pay_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_proceed_to_pay_vas_first_seen ;;
  }

  dimension: profile_events_proceed_to_pay_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_proceed_to_pay_vas_last_seen ;;
  }

  dimension: profile_events_profile_documents_count {
    type: number
    sql: ${TABLE}.profile_events_profile_documents_count ;;
  }

  dimension: profile_events_profile_documents_first_seen {
    type: number
    sql: ${TABLE}.profile_events_profile_documents_first_seen ;;
  }

  dimension: profile_events_profile_documents_last_seen {
    type: number
    sql: ${TABLE}.profile_events_profile_documents_last_seen ;;
  }

  dimension: profile_events_raise_complaint_add_images_count {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_add_images_count ;;
  }

  dimension: profile_events_raise_complaint_add_images_first_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_add_images_first_seen ;;
  }

  dimension: profile_events_raise_complaint_add_images_last_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_add_images_last_seen ;;
  }

  dimension: profile_events_raise_complaint_choose_category_count {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_category_count ;;
  }

  dimension: profile_events_raise_complaint_choose_category_first_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_category_first_seen ;;
  }

  dimension: profile_events_raise_complaint_choose_category_last_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_category_last_seen ;;
  }

  dimension: profile_events_raise_complaint_choose_subcategory_count {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_subcategory_count ;;
  }

  dimension: profile_events_raise_complaint_choose_subcategory_first_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_subcategory_first_seen ;;
  }

  dimension: profile_events_raise_complaint_choose_subcategory_last_seen {
    type: number
    sql: ${TABLE}.profile_events_raise_complaint_choose_subcategory_last_seen ;;
  }

  dimension: profile_events_rate_now_count {
    type: number
    sql: ${TABLE}.profile_events_rate_now_count ;;
  }

  dimension: profile_events_rate_now_first_seen {
    type: number
    sql: ${TABLE}.profile_events_rate_now_first_seen ;;
  }

  dimension: profile_events_rate_now_last_seen {
    type: number
    sql: ${TABLE}.profile_events_rate_now_last_seen ;;
  }

  dimension: profile_events_rate_us_count {
    type: number
    sql: ${TABLE}.profile_events_rate_us_count ;;
  }

  dimension: profile_events_rate_us_first_seen {
    type: number
    sql: ${TABLE}.profile_events_rate_us_first_seen ;;
  }

  dimension: profile_events_rate_us_last_seen {
    type: number
    sql: ${TABLE}.profile_events_rate_us_last_seen ;;
  }

  dimension: profile_events_reachable_by_count {
    type: number
    sql: ${TABLE}.profile_events_reachable_by_count ;;
  }

  dimension: profile_events_reachable_by_first_seen {
    type: number
    sql: ${TABLE}.profile_events_reachable_by_first_seen ;;
  }

  dimension: profile_events_reachable_by_last_seen {
    type: number
    sql: ${TABLE}.profile_events_reachable_by_last_seen ;;
  }

  dimension: profile_events_receipt_payment_history_count {
    type: number
    sql: ${TABLE}.profile_events_receipt_payment_history_count ;;
  }

  dimension: profile_events_receipt_payment_history_first_seen {
    type: number
    sql: ${TABLE}.profile_events_receipt_payment_history_first_seen ;;
  }

  dimension: profile_events_receipt_payment_history_last_seen {
    type: number
    sql: ${TABLE}.profile_events_receipt_payment_history_last_seen ;;
  }

  dimension: profile_events_recent_tickets_card_click_count {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_card_click_count ;;
  }

  dimension: profile_events_recent_tickets_card_click_first_seen {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_card_click_first_seen ;;
  }

  dimension: profile_events_recent_tickets_card_click_last_seen {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_card_click_last_seen ;;
  }

  dimension: profile_events_recent_tickets_view_all_count {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_view_all_count ;;
  }

  dimension: profile_events_recent_tickets_view_all_first_seen {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_view_all_first_seen ;;
  }

  dimension: profile_events_recent_tickets_view_all_last_seen {
    type: number
    sql: ${TABLE}.profile_events_recent_tickets_view_all_last_seen ;;
  }

  dimension: profile_events_refer_earn_banner_click_count {
    type: number
    sql: ${TABLE}.profile_events_refer_earn_banner_click_count ;;
  }

  dimension: profile_events_refer_earn_banner_click_first_seen {
    type: number
    sql: ${TABLE}.profile_events_refer_earn_banner_click_first_seen ;;
  }

  dimension: profile_events_refer_earn_banner_click_last_seen {
    type: number
    sql: ${TABLE}.profile_events_refer_earn_banner_click_last_seen ;;
  }

  dimension: profile_events_resend_otp_count {
    type: number
    sql: ${TABLE}.profile_events_resend_otp_count ;;
  }

  dimension: profile_events_resend_otp_first_seen {
    type: number
    sql: ${TABLE}.profile_events_resend_otp_first_seen ;;
  }

  dimension: profile_events_resend_otp_last_seen {
    type: number
    sql: ${TABLE}.profile_events_resend_otp_last_seen ;;
  }

  dimension: profile_events_save_address_details_count {
    type: number
    sql: ${TABLE}.profile_events_save_address_details_count ;;
  }

  dimension: profile_events_save_address_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_save_address_details_first_seen ;;
  }

  dimension: profile_events_save_address_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_save_address_details_last_seen ;;
  }

  dimension: profile_events_save_details_bank_count {
    type: number
    sql: ${TABLE}.profile_events_save_details_bank_count ;;
  }

  dimension: profile_events_save_details_bank_first_seen {
    type: number
    sql: ${TABLE}.profile_events_save_details_bank_first_seen ;;
  }

  dimension: profile_events_save_details_bank_last_seen {
    type: number
    sql: ${TABLE}.profile_events_save_details_bank_last_seen ;;
  }

  dimension: profile_events_save_emergency_details_count {
    type: number
    sql: ${TABLE}.profile_events_save_emergency_details_count ;;
  }

  dimension: profile_events_save_emergency_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_save_emergency_details_first_seen ;;
  }

  dimension: profile_events_save_emergency_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_save_emergency_details_last_seen ;;
  }

  dimension: profile_events_save_work_college_coaching_details_count {
    type: number
    sql: ${TABLE}.profile_events_save_work_college_coaching_details_count ;;
  }

  dimension: profile_events_save_work_college_coaching_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_save_work_college_coaching_details_first_seen ;;
  }

  dimension: profile_events_save_work_college_coaching_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_save_work_college_coaching_details_last_seen ;;
  }

  dimension: profile_events_scan_qr_count {
    type: number
    sql: ${TABLE}.profile_events_scan_qr_count ;;
  }

  dimension: profile_events_scan_qr_first_seen {
    type: number
    sql: ${TABLE}.profile_events_scan_qr_first_seen ;;
  }

  dimension: profile_events_scan_qr_last_seen {
    type: number
    sql: ${TABLE}.profile_events_scan_qr_last_seen ;;
  }

  dimension: profile_events_see_all_packaged_services_count {
    type: number
    sql: ${TABLE}.profile_events_see_all_packaged_services_count ;;
  }

  dimension: profile_events_see_all_packaged_services_first_seen {
    type: number
    sql: ${TABLE}.profile_events_see_all_packaged_services_first_seen ;;
  }

  dimension: profile_events_see_all_packaged_services_last_seen {
    type: number
    sql: ${TABLE}.profile_events_see_all_packaged_services_last_seen ;;
  }

  dimension: profile_events_send_otp_count {
    type: number
    sql: ${TABLE}.profile_events_send_otp_count ;;
  }

  dimension: profile_events_send_otp_first_seen {
    type: number
    sql: ${TABLE}.profile_events_send_otp_first_seen ;;
  }

  dimension: profile_events_send_otp_last_seen {
    type: number
    sql: ${TABLE}.profile_events_send_otp_last_seen ;;
  }

  dimension: profile_events_settings_count {
    type: number
    sql: ${TABLE}.profile_events_settings_count ;;
  }

  dimension: profile_events_settings_first_seen {
    type: number
    sql: ${TABLE}.profile_events_settings_first_seen ;;
  }

  dimension: profile_events_settings_last_seen {
    type: number
    sql: ${TABLE}.profile_events_settings_last_seen ;;
  }

  dimension: profile_events_sign_agreement_count {
    type: number
    sql: ${TABLE}.profile_events_sign_agreement_count ;;
  }

  dimension: profile_events_sign_agreement_first_seen {
    type: number
    sql: ${TABLE}.profile_events_sign_agreement_first_seen ;;
  }

  dimension: profile_events_sign_agreement_last_seen {
    type: number
    sql: ${TABLE}.profile_events_sign_agreement_last_seen ;;
  }

  dimension: profile_events_skip_to_home_count {
    type: number
    sql: ${TABLE}.profile_events_skip_to_home_count ;;
  }

  dimension: profile_events_skip_to_home_first_seen {
    type: number
    sql: ${TABLE}.profile_events_skip_to_home_first_seen ;;
  }

  dimension: profile_events_skip_to_home_last_seen {
    type: number
    sql: ${TABLE}.profile_events_skip_to_home_last_seen ;;
  }

  dimension: profile_events_staff_details_count {
    type: number
    sql: ${TABLE}.profile_events_staff_details_count ;;
  }

  dimension: profile_events_staff_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_staff_details_first_seen ;;
  }

  dimension: profile_events_staff_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_staff_details_last_seen ;;
  }

  dimension: profile_events_story_icon_click_count {
    type: number
    sql: ${TABLE}.profile_events_story_icon_click_count ;;
  }

  dimension: profile_events_story_icon_click_first_seen {
    type: number
    sql: ${TABLE}.profile_events_story_icon_click_first_seen ;;
  }

  dimension: profile_events_story_icon_click_last_seen {
    type: number
    sql: ${TABLE}.profile_events_story_icon_click_last_seen ;;
  }

  dimension: profile_events_submit_complaint_count {
    type: number
    sql: ${TABLE}.profile_events_submit_complaint_count ;;
  }

  dimension: profile_events_submit_complaint_first_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_complaint_first_seen ;;
  }

  dimension: profile_events_submit_complaint_last_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_complaint_last_seen ;;
  }

  dimension: profile_events_submit_kyc_count {
    type: number
    sql: ${TABLE}.profile_events_submit_kyc_count ;;
  }

  dimension: profile_events_submit_kyc_first_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_kyc_first_seen ;;
  }

  dimension: profile_events_submit_kyc_last_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_kyc_last_seen ;;
  }

  dimension: profile_events_submit_otp_count {
    type: number
    sql: ${TABLE}.profile_events_submit_otp_count ;;
  }

  dimension: profile_events_submit_otp_first_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_otp_first_seen ;;
  }

  dimension: profile_events_submit_otp_last_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_otp_last_seen ;;
  }

  dimension: profile_events_submit_personal_details_count {
    type: number
    sql: ${TABLE}.profile_events_submit_personal_details_count ;;
  }

  dimension: profile_events_submit_personal_details_first_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_personal_details_first_seen ;;
  }

  dimension: profile_events_submit_personal_details_last_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_personal_details_last_seen ;;
  }

  dimension: profile_events_submit_preferences_count {
    type: number
    sql: ${TABLE}.profile_events_submit_preferences_count ;;
  }

  dimension: profile_events_submit_preferences_first_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_preferences_first_seen ;;
  }

  dimension: profile_events_submit_preferences_last_seen {
    type: number
    sql: ${TABLE}.profile_events_submit_preferences_last_seen ;;
  }

  dimension: profile_events_support_faqs_count {
    type: number
    sql: ${TABLE}.profile_events_support_faqs_count ;;
  }

  dimension: profile_events_support_faqs_first_seen {
    type: number
    sql: ${TABLE}.profile_events_support_faqs_first_seen ;;
  }

  dimension: profile_events_support_faqs_last_seen {
    type: number
    sql: ${TABLE}.profile_events_support_faqs_last_seen ;;
  }

  dimension: profile_events_terms_and_conditions_count {
    type: number
    sql: ${TABLE}.profile_events_terms_and_conditions_count ;;
  }

  dimension: profile_events_terms_and_conditions_first_seen {
    type: number
    sql: ${TABLE}.profile_events_terms_and_conditions_first_seen ;;
  }

  dimension: profile_events_terms_and_conditions_last_seen {
    type: number
    sql: ${TABLE}.profile_events_terms_and_conditions_last_seen ;;
  }

  dimension: profile_events_terms_of_service_count {
    type: number
    sql: ${TABLE}.profile_events_terms_of_service_count ;;
  }

  dimension: profile_events_terms_of_service_first_seen {
    type: number
    sql: ${TABLE}.profile_events_terms_of_service_first_seen ;;
  }

  dimension: profile_events_terms_of_service_last_seen {
    type: number
    sql: ${TABLE}.profile_events_terms_of_service_last_seen ;;
  }

  dimension: profile_events_upload_document_retake_document_count {
    type: number
    sql: ${TABLE}.profile_events_upload_document_retake_document_count ;;
  }

  dimension: profile_events_upload_document_retake_document_first_seen {
    type: number
    sql: ${TABLE}.profile_events_upload_document_retake_document_first_seen ;;
  }

  dimension: profile_events_upload_document_retake_document_last_seen {
    type: number
    sql: ${TABLE}.profile_events_upload_document_retake_document_last_seen ;;
  }

  dimension: profile_events_utm_visited_count {
    type: number
    sql: ${TABLE}.profile_events_utm_visited_count ;;
  }

  dimension: profile_events_utm_visited_first_seen {
    type: number
    sql: ${TABLE}.profile_events_utm_visited_first_seen ;;
  }

  dimension: profile_events_utm_visited_last_seen {
    type: number
    sql: ${TABLE}.profile_events_utm_visited_last_seen ;;
  }

  dimension: profile_events_veg_only_toggle_vas_count {
    type: number
    sql: ${TABLE}.profile_events_veg_only_toggle_vas_count ;;
  }

  dimension: profile_events_veg_only_toggle_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_veg_only_toggle_vas_first_seen ;;
  }

  dimension: profile_events_veg_only_toggle_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_veg_only_toggle_vas_last_seen ;;
  }

  dimension: profile_events_view_agreement_count {
    type: number
    sql: ${TABLE}.profile_events_view_agreement_count ;;
  }

  dimension: profile_events_view_agreement_first_seen {
    type: number
    sql: ${TABLE}.profile_events_view_agreement_first_seen ;;
  }

  dimension: profile_events_view_agreement_last_seen {
    type: number
    sql: ${TABLE}.profile_events_view_agreement_last_seen ;;
  }

  dimension: profile_events_view_breakup_monthly_fee_count {
    type: number
    sql: ${TABLE}.profile_events_view_breakup_monthly_fee_count ;;
  }

  dimension: profile_events_view_breakup_monthly_fee_first_seen {
    type: number
    sql: ${TABLE}.profile_events_view_breakup_monthly_fee_first_seen ;;
  }

  dimension: profile_events_view_breakup_monthly_fee_last_seen {
    type: number
    sql: ${TABLE}.profile_events_view_breakup_monthly_fee_last_seen ;;
  }

  dimension: profile_events_view_next_slots_vas_count {
    type: number
    sql: ${TABLE}.profile_events_view_next_slots_vas_count ;;
  }

  dimension: profile_events_view_next_slots_vas_first_seen {
    type: number
    sql: ${TABLE}.profile_events_view_next_slots_vas_first_seen ;;
  }

  dimension: profile_events_view_next_slots_vas_last_seen {
    type: number
    sql: ${TABLE}.profile_events_view_next_slots_vas_last_seen ;;
  }

  dimension: profile_events_weekly_food_menu_card_count {
    type: number
    sql: ${TABLE}.profile_events_weekly_food_menu_card_count ;;
  }

  dimension: profile_events_weekly_food_menu_card_first_seen {
    type: number
    sql: ${TABLE}.profile_events_weekly_food_menu_card_first_seen ;;
  }

  dimension: profile_events_weekly_food_menu_card_last_seen {
    type: number
    sql: ${TABLE}.profile_events_weekly_food_menu_card_last_seen ;;
  }

  dimension: profile_events_whatsapp_notification_toggle_count {
    type: number
    sql: ${TABLE}.profile_events_whatsapp_notification_toggle_count ;;
  }

  dimension: profile_events_whatsapp_notification_toggle_first_seen {
    type: number
    sql: ${TABLE}.profile_events_whatsapp_notification_toggle_first_seen ;;
  }

  dimension: profile_events_whatsapp_notification_toggle_last_seen {
    type: number
    sql: ${TABLE}.profile_events_whatsapp_notification_toggle_last_seen ;;
  }

  dimension: profile_identity {
    type: string
    sql: ${TABLE}.profile_identity ;;
  }

  dimension: profile_make {
    type: string
    sql: ${TABLE}.profile_make ;;
  }

  dimension: profile_model {
    type: string
    sql: ${TABLE}.profile_model ;;
  }

  dimension: profile_name {
    type: string
    sql: ${TABLE}.profile_name ;;
  }

  dimension: profile_objectid {
    type: string
    sql: ${TABLE}.profile_objectid ;;
  }

  dimension: profile_os_version {
    type: string
    sql: ${TABLE}.profile_os_version ;;
  }

  dimension: profile_platform {
    type: string
    sql: ${TABLE}.profile_platform ;;
  }

  dimension: profile_profiledata_appversion {
    type: string
    sql: ${TABLE}.profile_profiledata_appversion ;;
  }

  dimension: profile_profiledata_city {
    type: string
    sql: ${TABLE}.profile_profiledata_city ;;
  }

  dimension: profile_profiledata_custom1 {
    type: number
    sql: ${TABLE}.profile_profiledata_custom1 ;;
  }

  dimension: profile_profiledata_micromarket {
    type: string
    sql: ${TABLE}.profile_profiledata_micromarket ;;
  }

  dimension: profile_profiledata_mobile {
    type: string
    sql: ${TABLE}.profile_profiledata_mobile ;;
  }

  dimension: profile_profiledata_residencename {
    type: string
    sql: ${TABLE}.profile_profiledata_residencename ;;
  }

  dimension: profile_profiledata_userid {
    type: string
    sql: ${TABLE}.profile_profiledata_userid ;;
  }

  dimension: profile_profiledata_useruuid {
    type: string
    sql: ${TABLE}.profile_profiledata_useruuid ;;
  }

  dimension: profile_push_token {
    type: string
    sql: ${TABLE}.profile_push_token ;;
  }

  dimension: session_props_session_source {
    type: string
    sql: ${TABLE}.session_props_session_source ;;
  }

  dimension: ts {
    type: number
    sql: ${TABLE}.ts ;;
  }

  measure: count {
    type: count
    drill_fields: [event_props_screenname, profile_profiledata_residencename, profile_name]
  }
}
