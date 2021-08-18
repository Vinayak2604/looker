view: consumption_in_kitchen {
  derived_table: {
    sql: select
  m.location_uuid uuid,
  m.location_name location_name,
  c.item_sub_category_label,
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
    and (location_name like '%Store%' or location_name like '%Manipal%'))
  and (p.food_cost_type = 'Normal B2C'
    or p.food_cost_type = 'Normal' )
  and c.__hevo__marked_deleted = false
  and t.__hevo__marked_deleted = false
  and m.__hevo__marked_deleted = false
  and p.__hevo__marked_deleted = false
group by
  1,
  2,
  3;;
  }

  dimension: location_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.location_uuid;;
  }

  dimension: Property {
    type: string
    sql: ${TABLE}.location_name;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: total_consumption {
    type: number
    sql: ${TABLE}.value;;
    value_format: "0"
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.qty;;
  }
}
