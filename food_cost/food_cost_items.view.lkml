view: food_cost_items {
  derived_table: {
    sql: select iq.menu_date,
          dfc.vendor_name,
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
               sum(case when meal_type = 'BREAKFAST' then item_qty end) as bf_qty,
               sum(case when meal_type = 'LUNCH' then item_qty end) as lunch_qty,
               sum(case when meal_type = 'EVENING_SNACKS' then item_qty end) as es_qty,
               sum(case when meal_type = 'DINNER' then item_qty end) as dinner_qty,
               sum(item_qty) as Total_qty
          from (select distinct
              rfm.menu_date,
              rfm.menu_category_id ,
              r.residence_name ,
              map.store,
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
              left join (select 'Zagreb Kitchen' as kitchen,'Zagreb Store' as store union all
                    select 'Dehradun Kitchen' as kitchen,'Dehradun Store' as store union all
                    select 'GMIT Kitchen' as kitchen,'GMIT Store' as store union all
                    select 'Coimbatore Kitchenn' as kitchen,'Coimbatore Store' as store union all
                    select 'Vadodara Kitchen' as kitchen,'Vadodara Store' as store union all
                    select 'SL - Noida' as kitchen,'Noida Store' as store union all
                    select 'Hyderabad Kitchen' as kitchen,'Hyderabad Store' as store union all
                    select 'Indore Kitchen' as kitchen,'Indore Store' as store union all
                    select 'Pune Hadapsar Kitchen' as kitchen,'Pune Store' as store union all
                    select 'Vidyanagar Kitchen' as kitchen,'Cumana Store' as store union all
                    select 'Stanza Delhi Kitchen' as kitchen,'Noida Store' as store union all
                    select 'Manipal Kitchen' as kitchen,'Manipal' as store union all
                    select 'Koramangala Kitchen' as kitchen,'Hamburg Store' as store union all
                    select 'Ahmedabad Kitchen' as kitchen,'Portland Store' as store union all
                    select 'Amsterdam Kitchen' as kitchen,'Amsterdam Store' as store union all
                    select 'Kitchen - Chennai Zamin Pallavaram ' as kitchen,'Chennai Pallavaram Store' as store)
                    map on map.kitchen =fv.name
              where (rfm.menu_date <current_date)
              and (fi."__hevo__marked_deleted" is FALSE or fi."__hevo__marked_deleted" is null)
              and (fir."__hevo__marked_deleted" is FALSE or fir."__hevo__marked_deleted" is null )
              and (firi."__hevo__marked_deleted" is FALSE or firi."__hevo__marked_deleted" is null )
              and (i1."__hevo__marked_deleted" is false or i1."__hevo__marked_deleted" is null)
              and (i2."__hevo__marked_deleted" is false or i2."__hevo__marked_deleted" is null)
              and map.store is not null)
          group by 1,2,3,4) iq
          left join (select *,
                (breakfast_orders + breakfast_sl_orders) * breakfast_cost as bf_res_sl_cost,
                (lunch_orders + lunch_sl_orders) * lunch_cost as lunch_res_sl_cost,
                (es_orders + es_sl_orders) * es_cost as es_res_sl_cost,
                (dinner_orders + dinner_sl_orders) * dinner_cost as dinner_res_sl_cost,
                bf_res_sl_cost + lunch_res_sl_cost + es_res_sl_cost + dinner_res_sl_cost as total_res_non_sl_cost,
                (sum(total_res_non_sl_cost) over (partition by vendor_master_id,menu_date))/(sum(total_res_non_sl_cost + sl_kitchen_price + non_sl_kitchen_price) over (partition by vendor_master_id,menu_date)) as app_component
                from stanza.derived_food_cost) dfc
                on iq.menu_date = dfc.menu_date and iq.vendor_id = dfc.vendor_id and iq.residence_name = dfc.hostel_name
          order by 1 desc,2,3 ;;
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

  dimension: hostel_name {
    type: string
    sql: ${TABLE}.hostel_name ;;
  }

  dimension: total_qty {
    type: number
    sql: ${TABLE}.total_a ;;
  }

  dimension: res_sl_qty {
    type: number
    sql: ${TABLE}.res_sl_total_qty ;;
  }

  dimension: non_sl_qty {
    type: number
    sql: ${TABLE}.non_sl_total_qty ;;
  }


}
