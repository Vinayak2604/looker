view: price_variance_custom_dates {
  derived_table: {
    sql: with a as (select distinct kp.item_id as ig_uuid, it.name as ingredient_name, kp.vendor_id as vendor_id,
                    case when v.name = 'SL - Noida' then 'Noida Kitchen' else v.name end as kitchen,
                    kp.standard_quantity_cost, date(kp.updated_at) as price_date,
                    kp."__hevo__marked_deleted" as flag

                    from stanza.core_food_service_food_item_kitchen_price kp
                    join stanza.core_food_service_ingredient_tag it on it.uuid = kp.item_id
                    join stanza.core_food_service_food_vendor v on v.vendor_master_uuid = kp.vendor_id

                    where v."__hevo__marked_deleted" is false
                    and it."__hevo__marked_deleted" is false),


          dfi as (select * from stanza.derived_food_inventory where location_type = 'STORE'),

          m as (select 'Shree Alampata' as a,'Shree Alampata' as b,'Shree Alampata' as c union all
                        select 'Ahmedabad Kitchen' as a,'SL - Portland' as b,'Portland Store' as c union all
                        select 'Class One Boys & Girls Hostel' as a,'Class One Boys & Girls Hostel' as b,'Class One Boys & Girls Hostel' as c union all
                        select 'Manipal Kitchen' as a,'SL - Brighton' as b,'Manipal Store' as c union all
                        select 'Koramangala Kitchen' as a,'SL - Hamburg' as b,'Hamburg Store' as c union all
                        select 'FOODSWING ENTERPRISES' as a,'Foodswing Enterprises' as b,'Foodswing Enterprises' as c union all
                        select 'Vidyanagar Kitchen' as a,'SL - Cumana' as b,'Cumana Store' as c union all
                        select 'Corporate_Office_Noida' as a,'Corporate Office' as b,'Central Store' as c union all
                        select 'Noida Kitchen' as a,'SL - Noida' as b,'Noida Store' as c union all
                        select 'Pune Hadapsar Kitchen' as a,'SL - Hadapsar' as b,'Pune Store' as c union all
                        select 'Amsterdam Kitchen' as a,'SL - EC 1' as b,'Amsterdam Store' as c union all
                        select 'Soul Food' as a,'Soul Food' as b,'Soul Food' as c union all
                        select 'Vaigai Kitchens' as a,'Vaigai Kitchens' as b,'Vaigai Kitchens' as c union all
                        select 'Vadodara Kitchen' as a,'SL - Auckland' as b,'Vadodara Store' as c union all
                        select 'Zagreb Kitchen' as a,'SL - Yelahanka' as b,'Zagreb Store' as c union all
                        select 'SL - Noida' as a,'SL - Noida' as b,'Noida Store' as c union all
                        select 'Model Town Kitchen' as a,'SL - Model Town' as b,'Model Town Store' as c union all
                        select 'Hyderabad Kitchen' as a,'SL - Hyderabad' as b,'Hyderabad Store' as c union all
                        select 'Indore Kitchen' as a,'SL - Indore' as b,'Indore Store' as c union all
                        select 'GMIT Kitchen' as a,'SL - GMIT' as b,'GMIT Store' as c union all
                        select 'SR Catering Food Service' as a,'SR Catering Food Service' as b,'SR Catering Food Service' as c union all
                        select 'Coimbatore Kitchenn' as a,'SL - Coimbatore' as b,'Coimbatore Store' as c union all
                        select 'Dehradun Kitchen' as a,'SL - Dehradun' as b,'Dehradun Store' as c union all
                        select 'Kitchen - Chennai Zamin Pallavaram' as a,'SL - Chennai' as b,'Chennai Pallavaram Store' as c union all
                        select 'Tiffins Etc' as a,'Tiffins Etc' as b,'Tiffins Etc' as c union all
                        select 'Hitarth Patel' as a,'Hitarth Patel' as b,'Hitarth Patel' as c union all
                        select 'Green Park Hospitality Pvt Ltd' as a,'Green Park Hospitality Pvt Ltd' as b,'Green Park Hospitality Pvt Ltd' as c union all
                        select 'Green Park Hospitality Services Private Limited' as a,'Green Park Hospitality Pvt Ltd' as b,'Green Park Hospitality Pvt Ltd' as c),

          inv as (select m.b as kitchen, dfi.ingredient_tag, sum(dfi.avail_stock_value) as total_value
                from dfi
                left join m on dfi.location_name = m.c
                where m.b is not null
                group by 1,2),

          sc as (select distinct z.*,t.name
              from (select recipe_tag,item_sub_category_label,rank() over (partition by recipe_tag order by created_at desc) as rnk
                    from stanza.erp_inventory_service_inventory_item_meta_entity) z
              join stanza.core_food_service_ingredient_tag t on t.uuid = z.recipe_tag
              where rnk=1),


          t1 as (select a.*
                from a
                WHERE ( coalesce( a.price_date = {% date_start date_filter %}, TRUE) )
                ),

          t2 as (select a.*
                from a
                WHERE ( coalesce( a.price_date = {% date_end date_filter %}, TRUE) )
                ),

          cons as (select fv.vendor_master_uuid as vendor_id,
                          it.uuid as recipe_tag_uuid,
                          SUM(t.effective_price*t.quantity) total_act
                  from stanza.erp_inventory_service_inventory_item_meta_entity c
                  left join stanza.erp_inventory_service_inventory_movement_tracker t on t.item_uuid = c.item_uuid
                  left join stanza.erp_purchase_order_po_details p on p.uuid = t.po_to_uuid
                  left join stanza.erp_transformation_master_address_book m on m.uuid = t.address_uuid
                  left join stanza.core_food_service_food_vendor fv on m.location_uuid = fv.vendor_master_uuid
                  join stanza.core_food_service_ingredient_tag it on it.uuid = c.recipe_tag

                  where c.item_dept = 'FOOD_OPS'
                  and c.item_name not like 'Meal%'
                  and t.event_type = 'IN'
                  and (p.food_cost_type = 'Normal B2C' or p.food_cost_type = 'Normal')
                  and m.location_name like '%Kitchen%'
                  and ( coalesce( date(t.updated_at) >= {% date_start date_filter %}, TRUE) )
                  and ( coalesce( date(t.updated_at) <= {% date_end date_filter %}, TRUE) )

              group by 1,2)

          select t1.*,t2.standard_quantity_cost as new_cost,t2.price_date as later_date,m.b as clean_kitchen,m.c as store,sc.item_sub_category_label,cons.total_act

          from t1
          join t2 on t1.ig_uuid = t2.ig_uuid and t1.vendor_id = t2.vendor_id
          left join m on t1.kitchen = m.a
          left join sc on sc.recipe_tag = t1.ig_uuid
          left join cons on cons.vendor_id = t1.vendor_id and cons.recipe_tag_uuid = t1.ig_uuid

          where m.b is not null
          order by t1.ingredient_name, t1.kitchen ;;
  }

  parameter: date_filter {
    type: date
  }


  dimension: ig_uuid {
    type: string
    sql: ${TABLE}.ig_uuid ;;
  }

  dimension: ingredient_name {
    type: string
    sql: ${TABLE}.ingredient_name ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: kitchen_old {
    type: string
    sql: ${TABLE}.kitchen ;;
  }

  dimension: kitchen_name {
    type: string
    sql: ${TABLE}.clean_kitchen ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: price_date {
    type: date
    sql: ${TABLE}.price_date ;;
  }

  dimension: later_date {
    type: date
    sql: ${TABLE}.later_date ;;
  }

  dimension: old_cost {
    type: number
    sql: ${TABLE}.standard_quantity_cost ;;
  }

  dimension: new_cost {
    type: number
    sql: ${TABLE}.new_cost ;;
  }

  dimension: consumption {
    type: number
    sql: ${TABLE}.total_act ;;
  }



  }
