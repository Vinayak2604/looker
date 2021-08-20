view: food_cost_items_actual {
  derived_table: {
    sql: select
        date(t.updated_at) as menu_date,
        m.location_uuid uuid,
        nvl(map.b,m.location_name) location_name,
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
      left join (select 'Hyderabad Kitchen' as a,'SL - Hyderabad' as b union all
        select 'Vadodara Kitchen' as a,'SL - Auckland' as b union all
        select 'Hamburg Kitchen' as a,'SL - Hamburg' as b union all
        select 'Coimbatore Kitchen' as a,'SL - Coimbatore' as b union all
        select 'Manipal - Kitchen' as a,'SL - Brighton' as b union all
        select 'Cumana Kitchen' as a,'SL - Cumana' as b union all
        select 'Zagreb Kitchen' as a,'SL - Yelahanka' as b union all
        select 'GMIT Kitchen' as a,'SL - GMIT' as b union all
        select 'Pune Kitchen' as a,'SL - Hadapsar' as b union all
        select 'Dehradun Kitchen' as a,'SL - Dehradun' as b union all
        select 'Noida Kitchen' as a,'SL - Noida' as b union all
        select 'Portland Kitchen' as a,'SL - Portland' as b union all
        select 'Amsterdam Kitchen' as a,'SL - EC 1' as b union all
        select 'Zagreb Kitchen_DONOT USE' as a,'SL - Yelahanka' as b union all
        select 'Kitchen - Chennai Zamin Pallavaram' as a,'SL - Chennai' as b union all
        select 'Indore Kitchen' as a,'SL - Indore' as b)
        map on map.a = m.location_name
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

  measure: weighted_qty {
    type:number
    sql: sum(${price}*${qty})/nullif(sum(${price}),0) ;;
  }
  }
