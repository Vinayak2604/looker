view: price_variance {
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

        m as (select 'Shree Alampata' as a,'Shree Alampata' as b,'Shree Alampata' as c union all
              select 'Ahmedabad Kitchen' as a,'SL - Portland' as b,'Portland Store' as c union all
              select 'Class One Boys & Girls Hostel' as a,'Class One Boys & Girls Hostel' as b,'Class One Boys & Girls Hostel' as c union all
              select 'Manipal Kitchen' as a,'SL - Brighton' as b,'Manipal' as c union all
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


b as (select a.*,m.b as clean_kitchen
      from a
      left join m on a.kitchen = m.a
      where a.flag = 0 and m.b is not null

      union

      select a.*,m.b as clean_kitchen
      from a
      left join m on a.kitchen = m.a
      where a.price_date = '2021-09-08' and m.b is not null)

select *, min(standard_quantity_cost) over (partition by price_date, ig_uuid) as min_price,
     (standard_quantity_cost - min_price) /nullif( min_price ,0)as deviation
from b;;
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

  dimension: kitchen {
    type: string
    sql: ${TABLE}.kitchen ;;
  }

  dimension: price_date {
    type: string
    sql: ${TABLE}.price_date ;;
  }

  dimension: flag {
    type: number
    sql: ${TABLE}.flag ;;
  }

  dimension: clean_kitchen {
    type: string
    sql: ${TABLE}.clean_kitchen ;;
  }

  dimension: item_cost {
    type: number
    sql: ${TABLE}.standard_quantity_cost ;;
  }

  dimension: min_price {
    type: number
    sql: ${TABLE}.min_price ;;
  }

  dimension: deviation {
    type: number
    sql: ${TABLE}.deviation ;;
  }

  }
