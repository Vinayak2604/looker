view: item_subcategory_price_comparison {
  derived_table: {
    sql: WITH item_price_comparison AS (select
  a.vendor_name,
  a.city,
  a.item_sub_category_label,
  a.item_name,
  coalesce(SUM(b.quantity),0) qty,
  MAX(a.LP_system_vendor) LP_system_vendor,
  case when SUM(b.quantity)>0 then SUM(a.vendor_rate * b.quantity)/ SUM(b.quantity) else MAX(a.vendor_rate) end system_price,
  case when SUM(b.quantity)>0 then SUM(a.LP_vendor_rate_system * b.quantity)/ SUM(b.quantity) else MAX(a.LP_vendor_rate_system) end lowest_system_price,
  coalesce(MAX(b.lp_purchase_vendor),'-') lp_purchase_vendor,
  coalesce((SUM(b.unit_rate_rent_per_month * b.quantity)/ SUM(b.quantity)),0) purchase_amount,
  coalesce((SUM(b.lp_value * b.quantity)/ SUM(b.quantity)),0) lowest_purchase_amount
from
  (
  select
    a.*,
    b.LP_vendor_rate_system,
    b.LP_system_vendor
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
      end LP_system_vendor
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
    b.LP_system_vendor is not null) as a
left join
(
  select
    a.*,
    b.LP_purchase_vendor,
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
      end LP_purchase_vendor
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
      LP_purchase_vendor is not null
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
group by
  1,
  2,
  3,
  4
order by
  a.item_name,
  a.city )
select
    item_price_comparison.vendor_name,
    item_price_comparison.item_sub_category_label item_sub_category_label,
    item_price_comparison.qty quantity,
    item_price_comparison.system_price system_price,
    item_price_comparison.purchase_amount purchase_amount,
    CASE WHEN SUM(item_price_comparison.qty ) > 0 THEN SUM(CASE WHEN (item_price_comparison.lowest_purchase_amount ) > 0 THEN (item_price_comparison.purchase_amount ) / (item_price_comparison.lowest_purchase_amount ) ELSE 0 END * ((item_price_comparison.qty ) * (item_price_comparison.purchase_amount ))) / SUM((item_price_comparison.qty ) * (item_price_comparison.purchase_amount )) ELSE 0 END AS weighted_delta_buying_price,
    CASE WHEN SUM(item_price_comparison.qty ) > 0 THEN SUM((item_price_comparison.system_price ) / (item_price_comparison.lowest_system_price ) * ((item_price_comparison.qty ) * (item_price_comparison.system_price ))) / SUM((item_price_comparison.qty ) * (item_price_comparison.system_price )) ELSE 0 END AS weighted_delta_system_price
FROM item_price_comparison
GROUP BY
    1,2,3,4,5
ORDER BY
    6 DESC ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    primary_key: yes
  }

  dimension: item_subcategory_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
    value_format: "0.00"
  }

  dimension: purchase_amount {
    type: number
    sql: ${TABLE}.purchase_amount ;;
    value_format: "0.00"
  }

  dimension: system_price {
    type: number
    sql: ${TABLE}.system_price ;;
    value_format: "0.00"
  }
  dimension: weighted_delta_buying_price {
    type: number
    sql: ${TABLE}.weighted_delta_buying_price ;;
  }

  dimension: weighted_delta_system_price {
    type: number
    sql: ${TABLE}.weighted_delta_system_price ;;
  }

  measure: delta_buying_price {
    type: number
    sql: CASE WHEN SUM(${quantity} ) > 0 THEN SUM(${weighted_delta_buying_price} * (${quantity} ) * (${purchase_amount} )) / SUM((${quantity} ) * (${purchase_amount} )) ELSE 0 END ;;
    value_format: "0.00"
  }

  measure: delta_system_price {
    type: number
    sql: CASE WHEN SUM(${quantity} ) > 0 THEN SUM(${weighted_delta_system_price} * (${quantity} ) * (${system_price} )) / SUM((${quantity} ) * (${system_price} )) ELSE 0 END ;;
    value_format: "0.00"
  }
}
