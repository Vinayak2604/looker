view: vendor_prices {
  derived_table: {
    sql: select
  a.*,
  b.location_name
from
  (
  select
    vd.company_name vendor_name,
    ime.item_sub_category_label,
    ime.item_name,
    loc.label as city
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
  group by
    1,
    2,
    3,
    4) as a
left join
(
  select
    pvd.vendor_name Vendor_name,
    DP.location_name,
    yy.item_sub_category_label,
    yy.item_name,
    DP.city_name
  from
    stanza.erp_purchase_order_po_details pd
  left join (
    select
      distinct pid.po_to_uuid,
      pid.item_name,
      pid.item_sub_category_label
    from
      stanza.erp_purchase_order_po_to_item_details pid
    where
      pid.__hevo__marked_deleted is false
      and pid.quantity != 0
    group by
      1,
      2,
      3) as yy on
    yy.po_to_uuid = pd.uuid
  left join (
    select
      distinct dd.delivery_type,
      etmb.location_name,
      pde.po_type,
      dd.city_name,
      dd.micromarket_name,
      dd.po_to_uuid,
      pde.uuid,
      dd.address_uuid
    from
      stanza.erp_purchase_order_po_details pde
    left join stanza.erp_purchase_order_delivery_details dd on
      pde.uuid = dd.po_to_uuid
    left join stanza.erp_transformation_master_address_book etmb on
      dd.address_uuid = etmb.uuid
    where
      (delivery_type = 'DESTINATION'
        or delivery_type is null)
      and pde.__hevo__marked_deleted is false
      and dd.__hevo__marked_deleted is false
      and etmb.__hevo__marked_deleted is false ) as DP on
    pd.uuid = DP.po_to_uuid
  left join stanza.erp_purchase_order_po_to_vendor_details pvd on
    pd.uuid = pvd.po_to_uuid
  left join stanza.core_food_service_ingredients i on
    i.name = yy.item_name
  where
    pd.status = 1
    and pd.mapped_department = 'FOOD_OPS'
    and pd.__hevo__marked_deleted is false
    and (pvd.__hevo__marked_deleted is false
      or pvd.__hevo__marked_deleted is null)
    and pd.po_type in ('RENTAL', 'NON_RENTAL', 'SERVICE_PO')
  group by
    1,
    2,
    3,
    4,
    5) as b on
  a.vendor_name = b.vendor_name
where
  city not in ('Titan Test', 'Select All', 'Asgard Test')
  and location_name is not null
group by
  1,
  2,
  3,
  4,
  5 ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    primary_key: yes
    link: {
      url: "/explore/central_projects/item_price_comparison?fields=item_price_comparison.item_subcategory,item_price_comparison.weighted_delta_buying_price,item_price_comparison.weighted_delta_system_price&f[item_price_comparison.Vendor_name]={{ value }}&sorts=item_price_comparison.weighted_delta_buying_price&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22truncate_column_names%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22table_theme%22%3A%22unstyled%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22series_labels%22%3A%7B%7D%2C%22type%22%3A%22table%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%7D&filter_config=%7B%7D&origin=share-expanded"
      label: "Item Subcategory"
    }
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: item_subcategory {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }
  measure: city_count {
    type: count_distinct
    sql: ${TABLE}.city ;;
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
  }

}
