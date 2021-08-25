view: vendor_prices {
  derived_table: {
    sql: select
           vd.company_name ,
           vi.itemuuid ,
           ime.item_name,
           loc.label as city,
           (case when vi.locationwiserate = 0 then vi.vendoritemrate else lri.locationrate end) vendor_rate
          from
          stanza.erp_vendor_vendor_details_redshift vd
          left join
          stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems vi
          on
          vd.id = vi."__hevo_ref_id"
          left join stanza.erp_inventory_service_inventory_item_meta_entity ime
          on
          vi.itemuuid = ime.item_uuid
          left join stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems_locationratelist lri
          on
          vd.id = lri."__hevo_ref_id"
          and vi."__hevo_array_index" = lri."__hevo_array_index"
          left join (
          select
             distinct value,
             label
          from
          stanza.erp_vendor_vendor_details_redshift_item_details_supplylocations_locations)
          loc
          on
          loc.value = lri.locationuuid
          where
             vi.costhead_label = 'OPEX'
            and lri.locationrate is not null
group by
  1,
  2,
  3,
  4,
  5 ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    primary_key: yes
    link: {
      url: "/explore/central_projects/derived_food_invoice?fields=derived_food_invoice.item_sub_category_label,derived_food_invoice.item_count,sum_of_subtotal_amount,max_of_total_consumption,derived_food_invoice.last_po_created_at&f[derived_food_invoice.gsri_done_flag]=1&f[derived_food_invoice.vendor_name]={{ value }}&sorts=derived_food_invoice.item_count+desc&limit=500&vis=%7B%22hidden_fields%22%3A%5B%22max_of_total_consumption%22%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22series_labels%22%3A%7B%7D%2C%22show_view_names%22%3Afalse%2C%22theme%22%3A%22contemporary%22%2C%22layout%22%3A%22fixed%22%2C%22minWidthForIndexColumns%22%3Atrue%2C%22headerFontSize%22%3A12%2C%22bodyFontSize%22%3A12%2C%22showTooltip%22%3Atrue%2C%22showHighlight%22%3Atrue%2C%22columnOrder%22%3A%7B%7D%2C%22rowSubtotals%22%3Afalse%2C%22colSubtotals%22%3Afalse%2C%22spanRows%22%3Atrue%2C%22spanCols%22%3Atrue%2C%22calculateOthers%22%3Atrue%2C%22sortColumnsBy%22%3A%22pivots%22%2C%22useViewName%22%3Afalse%2C%22useHeadings%22%3Afalse%2C%22useShortName%22%3Afalse%2C%22useUnit%22%3Afalse%2C%22groupVarianceColumns%22%3Afalse%2C%22genericLabelForSubtotals%22%3Afalse%2C%22indexColumn%22%3Afalse%2C%22transposeTable%22%3Afalse%2C%22type%22%3A%22marketplace_viz_report_table%3A%3Areport_table-marketplace%22%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22defaults_version%22%3A0%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_subtotal_amount%22%2C%22based_on%22%3A%22derived_food_invoice.subtotal_amount%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Subtotal+Amount%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22max_of_total_consumption%22%2C%22based_on%22%3A%22consumption_in_kitchen.total_consumption%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Max+of+Total+Consumption%22%2C%22type%22%3A%22max%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%28%24%7Bsum_of_subtotal_amount%7D%2F%24%7Bmax_of_total_consumption%7D%29%2A100%2C2%29%22%2C%22label%22%3A%22%25age+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22age_contribution%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
      label: "Item Subcategory"
    }
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.itemuuid ;;
  }

  dimension: vendor_item_rate {
    type: number
    sql: ${TABLE}.vendor_rate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.itemuuid ;;
  }

}
