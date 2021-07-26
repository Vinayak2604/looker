view: next_week_items {
  derived_table: {
    sql: select DISTINCT
  rfm.menu_date,
--  fv."name" as vendor_name,
  map.store,
  nvl(t.name,i1.name) as ingredient_name,
  1 as dummy_val
from stanza.core_food_service_residence_food_menu rfm
left join stanza.core_food_service_residence_food_menu_item rfmi on
  rfm.uuid = rfmi.residence_food_menu_id
left join stanza.core_food_service_food_item fi on
  fi.uuid =rfmi.item_id
left join stanza.core_food_service_food_item_recipe fir on
  fir.item_id = fi.uuid
left join (select *
    from(select *,
      rank() over (partition by item_recipe_id,ingredient_id order by updated_at DESC) as rnk
    from stanza.core_food_service_food_item_recipe_ingredients)
    where rnk = 1
    ) firi on
  firi.item_recipe_id = fir.uuid
left join stanza.core_food_service_ingredients i1 on
  firi.ingredient_id = i1.uuid
left join stanza.core_food_service_ingredients i2 on
  i2.tag_id = firi.ingredient_id
left join stanza.core_food_service_ingredient_tag t on
  t.uuid = i2.tag_id
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
where rfm.menu_date >=current_date
and (fi."__hevo__marked_deleted" is FALSE or fi."__hevo__marked_deleted" is null)
and (fir."__hevo__marked_deleted" is FALSE or fir."__hevo__marked_deleted" is null )
and (firi."__hevo__marked_deleted" is FALSE or firi."__hevo__marked_deleted" is null )
and (i1."__hevo__marked_deleted" is false or i1."__hevo__marked_deleted" is null)
and (i2."__hevo__marked_deleted" is false or i2."__hevo__marked_deleted" is null)
and map.store is not null ;;
  }

  dimension: menu_date {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

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
    sql: ${TABLE}.dummy_val ;;
  }
 }
