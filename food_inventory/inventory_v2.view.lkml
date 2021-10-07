view: inventory_v2 {
 derived_table: {
   sql: "select
  city_name,
  CASE
    WHEN location_name = 'Chennai Pallavaram Store' THEN 'SL - Chennai'
        WHEN location_name = 'Pune Store' THEN 'SL - Hadapsar'
        WHEN location_name = 'Manipal Store' THEN 'SL - Brighton'
        WHEN location_name = 'Indore Store' THEN 'SL - Indore'
        WHEN location_name = 'Amsterdam Store' THEN 'SL - EC 1'
        WHEN location_name = 'Hyderabad Store' THEN 'SL - Hyderabad'
        WHEN location_name = 'Zagreb Store' THEN 'SL - Yelahanka'
        WHEN location_name = 'GMIT Store' THEN 'SL - GMIT'
        WHEN location_name = 'Vadodara Store' THEN 'SL - Auckland'
        WHEN location_name = 'Coimbatore Store' THEN 'SL - Coimbatore'
        WHEN location_name = 'Cumana Store' THEN 'SL - Cumana'
        WHEN location_name = 'Dehradun Store' THEN 'SL - Dehradun'
        WHEN location_name = 'Portland Store' THEN 'SL - Portland'
        WHEN location_name = 'Model Town Store' THEN 'SL - Model Town'
        WHEN location_name = 'Cumana Kitchen' THEN 'SL - Cumana'
        WHEN location_name = 'Hamburg Store' THEN 'SL - Hamburg'
        WHEN location_name = 'Noida Store' THEN 'SL - Noida'
    ELSE location_name
  END,
  item_sub_category_label,
  item_name,
  avail_stock_value,
  avail_stock_qty,
  ROUND(coalesce(case
    when avail_stock_qty>0 then avail_stock_value / avail_stock_qty
  end,0),2) local_average,
  round(coalesce(map,0),2) map,
  round(coalesce(cons_value,0),2) cons_value,
  round(coalesce(case
    when cons_value>0 then avail_stock_value / cons_value
  end,0),2) inventory_days
from
  (
  select
    city.city_name ,
    m.location_name,
    c.item_sub_category_label,
    c.item_name,
    s.avail_stock_qty,
    s.avail_stock_value,
    sum(avail_stock_qty) over (partition by item_code) as global_stock_qty,
    sum(avail_stock_value) over (partition by item_code) as global_stock_val,
    global_stock_val / nullif(cast(global_stock_qty as numeric(10, 4)), 0) as map,
    cons.value as cons_value,
    cons.qty as cons_qty,
    adj.adjusted_qty,
    map * adj.adjusted_qty as adjusted_price,
    purchase.value as purchase_value,
    purchase.qty as purchase_qty
  from
    stanza.erp_inventory_service_inventory_item_meta_entity c
  left join stanza.erp_inventory_service_inventory_summary s
on
    c.item_uuid = s.item_uuid
  left join stanza.erp_transformation_master_address_book m on
    m.uuid = s.address_uuid
  left join stanza.erp_transformation_master_cities city on
    m.city_uuid = city.uuid
  left join (
    select
      m.location_uuid uuid,
      t.item_uuid,
      avg(t.effective_price * t.quantity) value,
      avg(t.quantity) qty
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
      and ((t.event_type = 'IN'
        and location_name like '%Kitchen%')
      or (t.event_type = 'OUT'
        and (location_name like '%Store%'
          or location_name like '%Manipal%')) )
      and (p.food_cost_type = 'Normal B2C'
        or p.food_cost_type = 'Normal' )
      and DATE(t.updated_at) >= DATEADD(month,
      -1,
      CURRENT_DATE-1)
        and c."__hevo__marked_deleted" = false
        and t."__hevo__marked_deleted" = false
        and m."__hevo__marked_deleted" = false
        and p."__hevo__marked_deleted" = false
      group by
        1,
        2)
      cons on
    cons.item_uuid = c.item_uuid
    and cons.uuid = m.location_uuid
  left join (
    select
      c.item_uuid,
      g.location_uuid,
      sum(c.adjust_close_qty) as adjusted_qty
    from
      stanza.erp_inventory_service_inventory_item_stock_closing_entity c
    join stanza.erp_inventory_service_inventory_adjust_closing_entity d on
      c.adjust_closing_id = d.adjust_closing_id
    join stanza.erp_inventory_service_inventory_item_meta_entity e on
      e.item_uuid = c.item_uuid
    join stanza.erp_transformation_master_address_book g on
      g.uuid = d.address_uuid
    where
      d.event_type = 'ADJUST'
      and d.location_type = 'STORE'
      and date(c.updated_at)>= DATEADD(month,
      -1,
      CURRENT_DATE-1)
        and e.item_dept = 'FOOD_OPS'
        and d.adjust_close_status = 'COMPLETED'
        and c."__hevo__marked_deleted" = false
        and d."__hevo__marked_deleted" = false
        and e."__hevo__marked_deleted" = false
        and g."__hevo__marked_deleted" = false
      group by
        1,
        2)
      adj on
    adj.item_uuid = c.item_uuid
    and adj.location_uuid = m.location_uuid
  left join (
    select
      m.location_uuid uuid,
      t.item_uuid,
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
      and (t.event_type = 'IN'
        and location_name like '%Store%')
      and p.po_status = 'GSRI_COMPLETED'
      and DATE(t.updated_at) >= DATEADD(month,
      -1,
      CURRENT_DATE-1)
        and c."__hevo__marked_deleted" = false
        and t."__hevo__marked_deleted" = false
        and m."__hevo__marked_deleted" = false
        and p."__hevo__marked_deleted" = false
      group by
        1,
        2)
      purchase on
    purchase.item_uuid = c.item_uuid
    and purchase.uuid = m.location_uuid
  left join stanza.core_food_service_ingredient_tag t on
    t.uuid = c.recipe_tag
    and t."__hevo__marked_deleted" is false
  where
    c.item_dept = 'FOOD_OPS'
    and m.location_name is not null
    and m.location_type = 'STORE'
    and (c.item_sub_category_label in ('Fruits and Vegetables', 'Non Veg', 'Dairy', 'Groceries', 'Cleaning Supplies', 'General Supplies','LPG','Packaging','Flour')
    or c.item_sub_category_label like '%direct food expense%')
    and m.location_name not in ('Dummy Store', 'Lisbon Store')
    and c."__hevo__marked_deleted" = false
    and s."__hevo__marked_deleted" = false
    and m."__hevo__marked_deleted" = false
    and city."__hevo__marked_deleted" = false)
order by inventory_days desc" ;;
 }

  dimension: city_name {
    sql: ${TABLE}.city_name ;;
    type: string
  }

  dimension: location_name {
    sql: ${TABLE}.location_name ;;
    type: string
  }

  dimension: item_sub_category_label {
    sql: ${TABLE}.item_sub_category_label ;;
    type: string
  }

  dimension: item_name {
    sql: ${TABLE}.item_name ;;
    type: string
  }

  dimension: avail_stock_value {
    sql: ${TABLE}.avail_stock_value ;;
    type: number
  }

  dimension: avail_stock_qty {
    sql: ${TABLE}.avail_stock_qty ;;
    type: number
  }

  dimension: local_average {
    sql: ${TABLE}.local_average ;;
    type: number
  }

  dimension: map {
    sql: ${TABLE}.map ;;
    type: number
  }

  dimension: cons_value {
    sql: ${TABLE}.cons_value ;;
    type: number
  }

  dimension: inventory_days {
    sql: ${TABLE}.inventory_days ;;
    type: number
  }


}
