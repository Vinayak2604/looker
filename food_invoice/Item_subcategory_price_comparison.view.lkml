view: item_subcategory_price_comparison {
  derived_table: {
    sql: select
  a.*,
  b.buying_price,
  b.LP_vendor,
  b.LP_vendor_value
from
  (
  select
    a.*,
    b.LP_vendor_system,
    b.LP_vendor_rate_system
  from
    (
    select
      vd.company_name vendor_name,
      ime.item_sub_category_label,
      loc.label as city,
      ROUND(AVG(case
    when vi.locationwiserate = 0 then vi.vendoritemrate
    else lri.locationrate
  end), 2) vendor_rate
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
      3) as a
  join
  (
    select
      a.vendor_name,
      a.item_sub_category_label,
      a.city,
      vendor_rate,
      row_number() over (partition by a.item_sub_category_label,
      a.city
    order by
      a.vendor_rate) row_no,
      case
        when row_no = 1 then a.vendor_rate
      end LP_vendor_rate_system,
      case
        when row_no = 1 then a.vendor_name
      end LP_vendor_system
    from
      (
      select
        vd.company_name vendor_name,
        ime.item_sub_category_label,
        loc.label as city,
        ROUND(AVG(case
    when vi.locationwiserate = 0 then vi.vendoritemrate
    else lri.locationrate
  end), 2) vendor_rate
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
        3) as a) as b on
    a.city = b.city
    and a.item_sub_category_label = b.item_sub_category_label
  where
    b.LP_vendor_system is not null
  group by
    1,
    2,
    3,
    4,
    5,
    6) as a
left join
  (
  select
    a.*,
    b.LP_vendor,
    b.LP_vendor_value
  from
    (
    select
      pvd.vendor_name Vendor_name,
      yy.item_sub_category_label,
      DP.city_name,
      AVG(yy.buying_price) buying_price
    from
      stanza.erp_purchase_order_po_details pd
    left join (
      select
        distinct pid.po_to_uuid,
        pid.item_sub_category_label,
        AVG(pid.quantity * pid.unit_rate_rent_per_month)/ AVG(pid.quantity) buying_price
      from
        stanza.erp_purchase_order_po_to_item_details pid
      where
        pid.__hevo__marked_deleted is false
        and pid.quantity != 0
      group by
        1,
        2) as yy on
      yy.po_to_uuid = pd.uuid
    left join (
      select
        distinct dd.delivery_type,
        dd.city_name,
        dd.po_to_uuid
      from
        stanza.erp_purchase_order_delivery_details dd
      where
        (delivery_type = 'DESTINATION'
          or delivery_type is null)
        and dd.__hevo__marked_deleted is false ) as DP on
      pd.uuid = DP.po_to_uuid
    left join stanza.erp_purchase_order_po_to_vendor_details pvd on
      pd.uuid = pvd.po_to_uuid
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
      3) as a
  join (
    select
      a.Vendor_name,
      a.item_sub_category_label,
      a.city_name,
      a.buying_price,
      row_number() over (partition by a.item_sub_category_label,
      a.city_name
    order by
      a.buying_price) row_no,
      case
        when row_no = 1 then a.buying_price
      end LP_vendor_value,
      case
        when row_no = 1 then a.Vendor_name
      end LP_vendor
    from
      (
      select
        pvd.vendor_name Vendor_name,
        yy.item_sub_category_label,
        DP.city_name,
        AVG(yy.buying_price) buying_price
      from
        stanza.erp_purchase_order_po_details pd
      left join (
        select
          distinct pid.po_to_uuid,
          pid.item_sub_category_label,
          AVG(pid.quantity * pid.unit_rate_rent_per_month)/ AVG(pid.quantity) buying_price
        from
          stanza.erp_purchase_order_po_to_item_details pid
        where
          pid.__hevo__marked_deleted is false
          and pid.quantity != 0
        group by
          1,
          2) as yy on
        yy.po_to_uuid = pd.uuid
      left join (
        select
          distinct dd.delivery_type,
          dd.city_name,
          dd.po_to_uuid
        from
          stanza.erp_purchase_order_delivery_details dd
        where
          (delivery_type = 'DESTINATION'
            or delivery_type is null)
          and dd.__hevo__marked_deleted is false ) as DP on
        pd.uuid = DP.po_to_uuid
      left join stanza.erp_purchase_order_po_to_vendor_details pvd on
        pd.uuid = pvd.po_to_uuid
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
        3) as a) as b on
    a.item_sub_category_label = b.item_sub_category_label
    and a.city_name = b.city_name
  where
    b.LP_vendor is not null) as b on
  a.item_sub_category_label = b.item_sub_category_label
  and a.vendor_name = b.vendor_name
  and a.city = b.city_name
order by
  2,
  3,
  1 ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    primary_key: yes
  }

  dimension: item_subcategory_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
    link: {
      url: "/explore/central_projects/item_price_comparison?fields=item_price_comparison.item_name,item_price_comparison.LP_Vendor_system,item_price_comparison.buying_price,item_price_comparison.LP_vendor_price_purchase,item_price_comparison.LP_Vendor_purchase,item_price_comparison.vendor_system_rate,item_price_comparison.LP_vendor_rate_system&f[item_price_comparison.item_sub_category_label]={{ value }}&sorts=item_price_comparison.item_subcategory&limit=500&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22truncate_column_names%22%3Afalse%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22table_theme%22%3A%22editable%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22table%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22hidden_fields%22%3A%5B%5D%2C%22hidden_points_if_no%22%3A%5B%5D%2C%22series_labels%22%3A%7B%7D%7D&filter_config=%7B%7D&dynamic_fields=%5B%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%24%7Bitem_price_comparison.buying_price%7D%2F%24%7Bitem_price_comparison.LP_vendor_price_purchase%7D%2C2%29%22%2C%22label%22%3A%22Delta+Buying+Price%22%2C%22value_format%22%3A%220.00%5C%22x%5C%22%22%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22table_calculation%22%3A%22delta_buying_price%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%24%7Bitem_price_comparison.vendor_system_rate%7D%2F%24%7Bitem_price_comparison.LP_vendor_rate_system%7D%2C2%29%22%2C%22label%22%3A%22Delta+System+Price%22%2C%22value_format%22%3A%220.00%5C%22x%5C%22%22%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22table_calculation%22%3A%22delta_system_price%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
      label: "Item Name"
    }
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: LP_vendor_system {
    type: string
    sql: ${TABLE}.LP_vendor_system ;;
  }

  dimension: LP_vendor {
    type: string
    sql: ${TABLE}.LP_vendor ;;
  }

  dimension: Buying_price {
    type: number
    sql: ${TABLE}.buying_price ;;
    value_format: "0.00"
  }

  dimension: LP_vendor_price {
    type: number
    sql: ${TABLE}.LP_vendor_value ;;
    value_format: "0.00"
  }

  dimension: vendor_rate_system {
    type: number
    sql: ${TABLE}.vendor_rate ;;
    value_format: "0.00"
  }

  dimension: LP_vendor_rate_system {
    type: number
    sql: ${TABLE}.LP_vendor_rate_system ;;
    value_format: "0.00"
  }
}
