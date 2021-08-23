view: item_price_comparison {
  derived_table: {
    sql: select
  a.*,
  b.LP_vendor,
  b.LP_unit_price
from
  (
  select
    pvd.vendor_name Vendor_name,
    yy.item_sub_category_label,
    yy.item_name,
    DP.city_name,
    yy.quantity,
    yy.weighted_avg_unit_price
  from
    stanza.erp_purchase_order_po_details pd
  left join (
    select
      distinct pid.po_to_uuid,
      pid.item_name,
      pid.unit_rate_rent_per_month,
      pid.quantity,
      pid.item_sub_category_label,
      avg(pid.quantity * pid.unit_rate_rent_per_month)/ avg(pid.quantity) as weighted_avg_unit_price
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
    and pd.po_type in ('RENTAL', 'NON_RENTAL', 'SERVICE_PO')
    and pd.created_at >= '2021-03-01'
  ) as a
join (
  select
    pvd.vendor_name Vendor_name,
    yy.item_name,
    item_sub_category_label,
    DP.city_name,
    yy.quantity,
    yy.weighted_avg_unit_price,
    row_number() over (partition by item_name,
    DP.city_name
  order by
    weighted_avg_unit_price) row_no,
    case
      when row_no = 1 then Vendor_name
    end LP_vendor,
    case
      when row_no = 1 then weighted_avg_unit_price
    end LP_unit_price
  from
    stanza.erp_purchase_order_po_details pd
  left join (
    select
      distinct pid.po_to_uuid,
      pid.item_name,
      pid.unit_rate_rent_per_month,
      pid.quantity,
      pid.item_sub_category_label,
      avg(pid.quantity * pid.unit_rate_rent_per_month)/ avg(pid.quantity) as weighted_avg_unit_price
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
    and pd.po_type in ('RENTAL', 'NON_RENTAL', 'SERVICE_PO')
      and pd.created_at >= '2021-03-01') as b on
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
  8
order by
  a.item_name ;;
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

  dimension: quantity {
    type: string
    sql: ${TABLE}.quantity ;;
  }

  dimension: Weighted_avg_unit_price {
    type: number
    sql: ${TABLE}.weighted_avg_unit_price ;;
    value_format: "0.00"
  }

  dimension: LP_Vendor {
    type: string
    sql: ${TABLE}.LP_vendor ;;
  }

  dimension: LP_unit_price {
    type: number
    sql: ${TABLE}.LP_unit_price ;;
    value_format: "0.00"
  }
 }
