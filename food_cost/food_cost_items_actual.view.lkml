view: food_cost_items_actual {
  derived_table: {
    sql: select
        date(t.updated_at) as menu_date,
        m.location_uuid uuid,
        m.location_name location_name,
        nvl(it.name,i.name) as item_name,
        t.effective_price,
        sum(t.quantity) as qty
      from stanza.erp_inventory_service_inventory_item_meta_entity c
      left join stanza.erp_inventory_service_inventory_movement_tracker t
        on t.item_uuid = c.item_uuid
      left join stanza.erp_purchase_order_po_details p
        on p.uuid = t.po_to_uuid
      left join stanza.erp_transformation_master_address_book m
        on m.uuid = t.address_uuid
      left join stanza.core_food_service_ingredients i on
        i.name =c.item_name
      left join stanza.core_food_service_ingredient_tag it on
        it.uuid = i.tag_id and it."__hevo__marked_deleted" is false
      where c.item_dept = 'FOOD_OPS'
          and c.item_name not like 'Meal%'
          and t.event_type = 'IN'
          and (p.food_cost_type = 'Normal B2C' or p.food_cost_type = 'Normal')
          and m.location_name like '%Kitchen%'
          and c.item_sub_category_label in ('Fruits and Vegetables' , 'Dairy', 'Non Veg' , 'Groceries' , 'Pulses: direct food expense','Flour: direct food expense','Cereals: direct food expense','Spices & Herbs: direct food expense','Bakery Items: direct food expense')
      group by 1,2,3,4,5 ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: location_uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.effective_price ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  }
