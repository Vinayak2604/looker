view: vendor_prices {
  derived_table: {
    sql: select
  vd.company_name ,
  vd.payment_currency ,
  vd.vendor_code ,
  vd.vendor_type ,
  vd.gen_credit_period ,
  vd.adv_credit_period ,
  vd.ret_credit_period ,
  vd.payment_terms ,
  vi.itemcode ,
  vi.itemuuid ,
  ime.item_name,
  ime.item_category_label,
  ime.item_sub_category_label,
  vi.vendoritemrate,
  loc.label as city
from
  stanza.erp_vendor_vendor_details_redshift vd
left join stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems vi
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
       loc on
  loc.value = lri.locationuuid
where
  vi.costhead_label = 'OPEX' ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    link: {
      url: "/explore/central_projects/vendor_prices?fields=vendor_prices.company_name,vendor_prices.item_subcategory&sorts=vendor_prices.company_name&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%7D&origin=share-expanded"
      label: "Item Subcategories"
    }
  }

  dimension: payment_currency {
    type: string
    sql: ${TABLE}.payment_currency ;;
  }

  dimension: vendor_code {
    type: string
    sql: ${TABLE}.vendor_code ;;
  }

  dimension: vendor_type {
    type: string
    sql: ${TABLE}.vendor_type ;;
  }

  dimension: general_credit_period {
    type: string
    sql: ${TABLE}.gen_credit_period ;;
  }

  dimension: advance_credit_period {
    type: string
    sql: ${TABLE}.adv_credit_period ;;
  }

  dimension: retention_credit_period {
    type: string
    sql: ${TABLE}.ret_credit_period ;;
  }

  dimension: payment_terms {
    type: string
    sql: ${TABLE}.payment_terms ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.itemcode ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.itemuuid ;;
  }

  measure: vendor_item_rate {
    type: sum
    sql: ${TABLE}.vendoritemrate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: item_category {
    type: string
    sql: ${TABLE}.item_category_label ;;
  }
  dimension: item_subcategory {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }
  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }
  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_category_label ;;
  }
 }
