view: vendor_price_comparison {
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
      2) as a
  join
  (
    select
      a.vendor_name,
      a.city,
      vendor_rate,
      row_number() over (partition by a.city
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
        2) as a) as b on
    a.city = b.city
  where
    b.LP_vendor_system is not null
  group by
    1,
    2,
    3,
    4,
    5) as a
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
      DP.city_name,
      AVG(yy.buying_price) buying_price
    from
      stanza.erp_purchase_order_po_details pd
    left join (
      select
        distinct pid.po_to_uuid,
        AVG(pid.quantity * pid.unit_rate_rent_per_month)/ AVG(pid.quantity) buying_price
      from
        stanza.erp_purchase_order_po_to_item_details pid
      where
        pid.__hevo__marked_deleted is false
        and pid.quantity != 0
      group by
        1) as yy on
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
      2) as a
  join (
    select
      a.Vendor_name,
      a.city_name,
      a.buying_price,
      row_number() over (partition by a.city_name
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
        DP.city_name,
        AVG(yy.buying_price) buying_price
      from
        stanza.erp_purchase_order_po_details pd
      left join (
        select
          distinct pid.po_to_uuid,
          AVG(pid.quantity * pid.unit_rate_rent_per_month)/ AVG(pid.quantity) buying_price
        from
          stanza.erp_purchase_order_po_to_item_details pid
        where
          pid.__hevo__marked_deleted is false
          and pid.quantity != 0
        group by
          1) as yy on
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
        2) as a) as b on
    a.city_name = b.city_name
  where
    b.LP_vendor is not null) as b on
   a.vendor_name = b.vendor_name
  and a.city = b.city_name
order by
  2,
  1 ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    primary_key: yes
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
