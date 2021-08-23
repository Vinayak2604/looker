view: food_cost_items {
  derived_table: {
    sql: select a.menu_date,a.vendor_id,a.vendor_master_id,a.vendor_name,a.ingredient_name,
a.res_sl_qty,a.non_sl_qty,a.total_qty,b.effective_price,b.qty
from
(select menu_date,
     vendor_id,
     vendor_master_id,
     vendor_name,
     ingredient_name,
     sum(res_sl_total_qty) as res_sl_qty,
     sum(non_sl_total_qty) as non_sl_qty,
     sum(res_sl_total_qty+non_sl_total_qty) as total_qty
    from
    (select iq.menu_date,
--        extract(week from iq.menu_date) weeknum,
--        extract(year from iq.menu_date) yearnum,
        dfc.vendor_name,
        iq.vendor_id,
        dfc.vendor_master_id,
        iq.ingredient_name,
        iq.residence_name,
        dfc.hostel_name,
        iq.bf_qty,
        dfc.breakfast_orders,
        bf_qty*breakfast_orders as bf_total_qty,
        iq.lunch_qty,
        dfc.lunch_orders,
        lunch_qty*lunch_orders as lunch_total_qty,
        iq.es_qty,
        dfc.es_orders,
        es_qty*es_orders as es_total_qty,
        iq.dinner_qty,
        dfc.dinner_orders,
        dinner_qty*dinner_orders as dinner_total_qty,
        (coalesce(bf_total_qty,0)+coalesce(lunch_total_qty,0)+coalesce(es_total_qty,0)+coalesce(dinner_total_qty,0)) as total_a,
        total_a * dfc.app_component as res_sl_total_qty,
        total_a-res_sl_total_qty as non_sl_total_qty
        from
        (select menu_date,
             vendor_id,
             ingredient_name,
             residence_name,
             residence_id,
             sum(case when meal_type = 'BREAKFAST' then item_qty end) as bf_qty,
             sum(case when meal_type = 'LUNCH' then item_qty end) as lunch_qty,
             sum(case when meal_type = 'EVENING_SNACKS' then item_qty end) as es_qty,
             sum(case when meal_type = 'DINNER' then item_qty end) as dinner_qty,
             sum(item_qty) as Total_qty
        from (select distinct
            rfm.menu_date,
            rfm.menu_category_id ,
            r.residence_name ,
            rfm.residence_id as residence_id,
            rfm.vendor_id ,
            fi.name as dish_name,
            nvl(t.name,i1.name) as ingredient_name,
            firi.quantity,
            fir.cook_quantity,
            fir.standard_quantity,
            (firi.quantity/fir.cook_quantity)*fir.standard_quantity as item_qty,
            rfm.meal_type
            from stanza.core_food_service_residence_food_menu rfm
            left join stanza.core_food_service_residence_food_menu_item rfmi
                on rfm.uuid = rfmi.residence_food_menu_id
            left join stanza.core_food_service_food_item fi
                on fi.uuid =rfmi.item_id
            left join stanza.core_food_service_food_item_recipe fir
              on fir.item_id = fi.uuid
            left join (select *
                   from(select *,
                        rank() over (partition by item_recipe_id,ingredient_id order by updated_at DESC) as rnk
                      from stanza.core_food_service_food_item_recipe_ingredients)
                     where rnk = 1
                     ) firi
                on firi.item_recipe_id = fir.uuid
            left join stanza.core_food_service_ingredients i1
              on firi.ingredient_id = i1.uuid
            left join stanza.core_food_service_ingredients i2
              on i2.tag_id = firi.ingredient_id
            left join stanza.core_food_service_ingredient_tag t
              on t.uuid = i2.tag_id
            left join stanza.core_food_service_food_vendor fv
              on fv.uuid=rfm.vendor_id
            left join stanza.erp_transformation_master_residences r
              on r.uuid =rfm.residence_id
            where (rfm.menu_date <current_date)
            and (fi."__hevo__marked_deleted" is FALSE or fi."__hevo__marked_deleted" is null)
            and (fir."__hevo__marked_deleted" is FALSE or fir."__hevo__marked_deleted" is null )
            and (firi."__hevo__marked_deleted" is FALSE or firi."__hevo__marked_deleted" is null )
            and (i1."__hevo__marked_deleted" is false or i1."__hevo__marked_deleted" is null)
            and (i2."__hevo__marked_deleted" is false or i2."__hevo__marked_deleted" is null))
        group by 1,2,3,4,5) iq
        join stanza.derived_food_cost dfc
        on iq.menu_date = dfc.menu_date and iq.vendor_id = dfc.vendor_id and iq.residence_name = dfc.hostel_name)
    group by 1,2,3,4,5) a
left join (select
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
      group by 1,2,3,4,5) b
      on a.menu_date = b.menu_date and a.vendor_name = b.location_name and a.ingredient_name = b.item_name;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: ingredient_name {
    type: string
    sql: ${TABLE}.ingredient_name ;;
  }

  # dimension: hostel_name {
  #   type: string
  #   sql: ${TABLE}.hostel_name ;;
  # }

  dimension: Vendor_master_id {
    type: string
    sql: ${TABLE}.Vendor_master_id ;;
  }

  dimension: total_qty_budget {
    type: number
    sql: ${TABLE}.total_qty ;;
  }

  dimension: res_sl_qty_budget {
    type: number
    sql: ${TABLE}.res_sl_qty ;;
  }

  dimension: non_sl_qty_budget {
    type: number
    sql: ${TABLE}.non_sl_qty ;;
  }

  dimension: effective_price_actual {
    type: number
    sql: ${TABLE}.effective_price ;;
  }

  dimension: qty_actual {
    type: number
    sql: ${TABLE}.qty ;;
  }


  measure: weighted_qty {
    type:number
    sql: sum(${effective_price_actual}*${qty_actual})/nullif(sum(${effective_price_actual}),0) ;;
  }



  }
