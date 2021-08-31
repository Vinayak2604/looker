view: kitchen_consumption {
  derived_table: {
    sql: select
  a.*,
  b.qty,
  b.value
from
  (select
    vendor_name,
    property,
    sum(unit_rate_rent_per_month * quantity) amount_purchased_from_vendor,
    sum(amount_purchased_from_vendor) over (partition by property) store_purchase
  from
    stanza.derived_food_invoice dfi
where
    vendor_name not like '%Store%'
    and dfi.gsri_done_flag = 1
    and {% condition date1 %} DATE(po_created_at) {% endcondition %}
  group by
    1,
    2) as a
left join
  (select
    m.location_name location_name,
    sum(t.effective_price * t.quantity) value,
    sum(t.quantity) qty
  from
    stanza.erp_inventory_service_inventory_item_meta_entity c
  left join stanza.erp_inventory_service_inventory_movement_tracker
      t on
    t.item_uuid = c.item_uuid
  left join stanza.erp_purchase_order_po_details
      p on
    p.uuid = t.po_to_uuid
  left join stanza.erp_transformation_master_address_book
      m on
    m.uuid = t.address_uuid
  where
    c.item_dept = 'FOOD_OPS'
    and c.item_name not like 'Meal%'
    and (t.event_type = 'OUT'
      and (location_name like '%Store%'
        or location_name like '%Manipal%'))
    and (p.food_cost_type = 'Normal B2C'
      or p.food_cost_type = 'Normal' )
    and c.item_sub_category_label in ('Fruits and Vegetables','Non Veg', 'Dairy','Groceries','LPG','Packaging')
    and c.__hevo__marked_deleted = false
    and t.__hevo__marked_deleted = false
    and m.__hevo__marked_deleted = false
    and p.__hevo__marked_deleted = false
    and DATE(t.updated_at)>='2021-03-01'
    and {% condition date1 %} DATE(t.updated_at) {% endcondition %}
  group by
    1) as b on
  a.property = b.location_name ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    primary_key: yes
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: amount_purchased {
    type: number
    sql: ${TABLE}.amount_purchased_from_vendor ;;
    value_format: "#,##0"
  }

  dimension: store_purchase {
    type: number
    sql: ${TABLE}.store_purchase ;;
    value_format: "#,##0"
  }

  parameter: date1 {
    type: date
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.qty ;;
    value_format: "0"
  }

  dimension: consumption_value {
    type: number
    sql: ${TABLE}.value ;;
    value_format: "#,##0"
  }

  measure: total_amount_purchased {
    type: number
    sql: ${TABLE}.amount_purchased_from_vendor ;;
    value_format: "#,##0"
  }
}
