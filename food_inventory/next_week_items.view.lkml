view: next_week_items {
  derived_table: {
    sql: select store,ingredient_name,sum(dummy_val) as times from
(select distinct
 rfm.menu_date,
  map.store,
  items.item_name as ingredient_name,
  1 as dummy_val
from stanza.core_food_service_residence_food_menu rfm
left join stanza.core_food_service_residence_food_menu_item rfmi
          on rfm.uuid = rfmi.residence_food_menu_id
left join (with base as (select
            fi.uuid as dish_uuid,
            fi.name as dish_name,
            fi.recipe_type ,
            fi.linked_ingredient_id ,
            fir.item_id as fir_item_id,
            fir.cook_quantity ,
            fir.standard_quantity ,
            firi.uuid as firi_uuid,
            firi.item_recipe_id,
            firi.ingredient_id as firi_ing_id,
            firi.quantity as ingredient_qty,
            firi.ingredient_id_bkp,
            t.name as item_tag
            from stanza.core_food_service_food_item fi
            left join stanza.core_food_service_food_item_recipe fir
              on fir.item_id = fi.uuid
            left join (select *
                  from (select *,
                        rank() over (partition by item_recipe_id,ingredient_id order by updated_at desc) as rnk
                        from stanza.core_food_service_food_item_recipe_ingredients
                        where "__hevo__marked_deleted" is false)
                  where rnk = 1) firi
              on firi.item_recipe_id = fir.uuid
            left join stanza.core_food_service_ingredient_tag t
              on t.uuid = firi.ingredient_id
            where
            fi."__hevo__marked_deleted" is false
            and fir."__hevo__marked_deleted" is false
            and t."__hevo__marked_deleted" is false
            and fi.status =1 and fir.status =1 and t.status =1 and recipe_exists =1)


          select dish_uuid,dish_name,recipe_type,item_name,sum(ingredient_amount) as qty_sum
          from(select a.dish_uuid,a.dish_name,a.recipe_type,
              nvl(b.item_tag,a.item_tag) as item_name,
              (nvl((b.ingredient_qty/b.cook_quantity)*a.ingredient_qty,a.ingredient_qty)/a.cook_quantity)*a.standard_quantity as ingredient_amount
            from (select *
                from base
                where recipe_type = 'FINISHED_DISH'
                ) a
            left join (select *
                  from base
                  where recipe_type = 'SEMI_PROCESSED'
                  ) b
            on a.ingredient_id_bkp = b.linked_ingredient_id)
          group by 1,2,3,4)
        items on items.dish_uuid = rfmi.item_id
left join stanza.core_food_service_food_vendor fv on
  fv.uuid=rfm.vendor_id
left join ( select 'Zagreb Kitchen' as kitchen,'Zagreb Store' as store union all
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
where (rfm.menu_date >=current_date and rfm.menu_date <= current_date+ 7)
and map.store is not null)
group by 1,2
 ;;
  }


  parameter: date {
    type: string
  }

  # dimension: menu_date {
  #   type: date
  #   sql: ${TABLE}.menu_date ;;
  # }

  dimension: location {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.ingredient_name ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.times ;;
  }
 }
