view: item_price_comparison {
  derived_table: {
    sql: select
  a.*,
  b.quantity,
  b.unit_rate_rent_per_month,
  b.lp_vendor,
  b.lp_value
from
  (
  select
    a.*,
    b.LP_vendor_rate_system,
    b.LP_vendor_system
  from
    (
    select
      vd.company_name vendor_name,
      vi.itemuuid,
      ime.item_sub_category_label,
      ime.item_name,
      loc.label as city,
      (case
        when vi.locationwiserate = 0 then vi.vendoritemrate
        else lri.locationrate
      end) vendor_rate
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
      5,
      6) as a
  join
  (
    select
      vd.company_name vendor_name,
      vi.itemuuid,
      ime.item_sub_category_label,
      ime.item_name,
      loc.label as city,
      (case
        when vi.locationwiserate = 0 then vi.vendoritemrate
        else lri.locationrate
      end) vendor_rate,
      row_number() over (partition by ime.item_name,
      loc.label
    order by
      vendor_rate) row_no,
      case
        when row_no = 1 then vendor_rate
      end LP_vendor_rate_system,
      case
        when row_no = 1 then vendor_name
      end LP_vendor_system
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
      5,
      6) as b on
    a.city = b.city
    and a.item_name = b.item_name
  where
    b.LP_vendor_system is not null) as a
left join
(
  select
    a.*,
    b.LP_vendor,
    b.LP_value
  from
    (
    select
      pvd.vendor_name Vendor_name,
      yy.po_to_uuid,
      yy.item_sub_category_label,
      yy.item_name,
      DP.city_name,
      yy.quantity,
      yy.unit_rate_rent_per_month
    from
      stanza.erp_purchase_order_po_details pd
    left join (
      select
        distinct pid.po_to_uuid,
        pid.item_name,
        pid.unit_rate_rent_per_month,
        pid.quantity,
        pid.item_sub_category_label
      from
        stanza.erp_purchase_order_po_to_item_details pid
      where
        pid.__hevo__marked_deleted is false
        and pid.quantity != 0
      group by
        1,
        2,
        3,
        4,
        5) as yy on
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
    left join stanza.core_food_service_ingredients i on
      i.name = yy.item_name
    where
      pd.status = 1
      and pd.mapped_department = 'FOOD_OPS'
      and pd.__hevo__marked_deleted is false
      and (pvd.__hevo__marked_deleted is false
        or pvd.__hevo__marked_deleted is null)
      and pd.po_type in ('RENTAL', 'NON_RENTAL', 'SERVICE_PO')) as a
  join (
    select
      pvd.vendor_name Vendor_name,
      yy.item_sub_category_label,
      yy.item_name,
      DP.city_name,
      yy.quantity,
      yy.unit_rate_rent_per_month,
      row_number() over (partition by yy.item_name,
      DP.city_name
    order by
      yy.unit_rate_rent_per_month) row_no,
      case
        when row_no = 1 then yy.unit_rate_rent_per_month
      end LP_value,
      case
        when row_no = 1 then pvd.vendor_name
      end LP_vendor
    from
      stanza.erp_purchase_order_po_details pd
    left join (
      select
        distinct pid.po_to_uuid,
        pid.item_name,
        pid.unit_rate_rent_per_month,
        pid.quantity,
        pid.item_sub_category_label
      from
        stanza.erp_purchase_order_po_to_item_details pid
      where
        pid.__hevo__marked_deleted is false
        and pid.quantity != 0
      group by
        1,
        2,
        3,
        4,
        5) as yy on
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
    left join stanza.core_food_service_ingredients i on
      i.name = yy.item_name
    where
      pd.status = 1
      and pd.mapped_department = 'FOOD_OPS'
      and pd.__hevo__marked_deleted is false
      and (pvd.__hevo__marked_deleted is false
        or pvd.__hevo__marked_deleted is null)
      and pd.po_type in ('RENTAL', 'NON_RENTAL', 'SERVICE_PO')) as b on
    a.item_name = b.item_name
      and a.city_name = b.city_name
    where
      LP_vendor is not null
    group by
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9) as b on
  a.vendor_name = b.vendor_name
  and a.item_name = b.item_name
  and a.city = b.city_name
  order by item_name,city ;;
  }

  dimension: Vendor_name {
    type: string
    sql: ${TABLE}.Vendor_name ;;
    primary_key: yes
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: item_subcategory {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.itemuuid ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: buying_price {
    type: number
    sql: ${TABLE}.unit_rate_rent_per_month ;;
  }

  dimension: vendor_system_rate {
    type: number
    sql: ${TABLE}.vendor_rate ;;
  }

  dimension: LP_Vendor_purchase {
    type: string
    sql: ${TABLE}.lp_vendor ;;
  }

  dimension: LP_vendor_price_purchase {
    type: number
    sql: ${TABLE}.lp_value ;;
    value_format: "0.00"
  }

  dimension: LP_Vendor_system {
    type: string
    sql: ${TABLE}.LP_vendor_system ;;
  }

  dimension: LP_vendor_rate_system {
    type: number
    sql: ${TABLE}.LP_vendor_rate_system ;;
    value_format: "0.00"
  }
 }
