view: delta_combined {
  derived_table: {
    sql: select a.vendor_name,a.delta_cogs,blended_delta_qty,blended_delta_price
from (select vendor_name,
           sum(dfc.house_wise_actual_cost_cogs)/nullif(sum((actual_blended_order + actual_sl_blended_order)*menu_cost),0) as delta_cogs
    from stanza.derived_food_cost dfc
    where menu_date> current_date - 7 and menu_date<current_date
    group by 1) a

left join (select vendor_name,
          sum(actual_qty)/nullif(sum(case when delta_qty>0 then budget_qty else null end),0) as blended_delta_qty,
          sum(price_actual)/nullif(sum(case when price_delta>0 then price_budget else null end),0) as blended_delta_price
       from (select menu_date,vendor_id,vendor_master_id,vendor_name,ingredient_name,
              sum(total_qty) as budget_qty,
              sum(effective_price*qty)/sum(effective_price) as actual_qty,
              actual_qty/nullif(budget_qty,0) as delta_qty,
              avg(budget_price) as price_budget,
              avg(actual_price) as price_actual,
              avg(actual_price)/nullif(avg(budget_price),0) as price_delta
         from (select a.*,b.actual_price,b.budget_price
               from stanza.derived_food_cost_items a
             left join (select ap.address_name as store_name,list.a as kitchen_name, ap.recipe_tag, ap.final_price as actual_price, bp.map_tagwise as budget_price
                      from (with a as (select iss.address_name, c.city_name ,b."name" as recipe_tag,iss.avail_stock_value,iss.avail_stock_qty
                                 from stanza.erp_inventory_service_inventory_summary iss
                                 left join stanza.erp_inventory_service_inventory_item_meta_entity imt
                                    on iss.item_uuid=imt.item_uuid
                                 left join stanza.core_food_service_ingredient_tag b
                                      on imt.recipe_tag =b.uuid
                                 left join stanza.erp_transformation_master_address_book ab
                                    on ab.uuid =iss.address_uuid
                                 left join stanza.erp_transformation_master_cities c
                                    on c.uuid =ab.city_uuid
                                 where iss.item_dept='FOOD_OPS'
                                   and iss.location_type ='STORE'
                                   and iss.__hevo__marked_deleted is false
                                   and imt.__hevo__marked_deleted  is false
                                   and b."__hevo__marked_deleted" is false
                                   and iss.address_name <>'Dummy Store'),
                            b as (select vendor_name as Store,po_completion_date,property as transfer_entity,ingredient_tag,unit_rate_rent_per_month,
                                         rank() over (partition by ingredient_tag,vendor_name order by po_completion_date DESC) as rn
                                  from stanza.derived_food_invoice
                                  where gsri_done_flag =1
                                    and (vendor_name like '%Store%' or vendor_name = 'Manipal')
                                    and property like '%Kitchen%')
                            select a.address_name,a.city_name,a.recipe_tag,
                                   sum(a.avail_stock_value)/nullif(sum(cast(a.avail_stock_qty as numeric(10,0))),0) as map,
                                   max(b.unit_rate_rent_per_month) as last_price,
                                   nvl(map,last_price) as final_price
                            from a
                            left join b
                                on a.address_name = b.store
                                 and a.recipe_tag = b.ingredient_tag
                            where b.rn = 1
                            group by 1,2,3) ap
                  left join stanza.derived_food_procurement_rates bp
                       on ap.address_name = bp.store_name and ap.recipe_tag = bp.recipe_tag
                  left join (select 'SL - Chennai' as a,'Chennai Pallavaram Store' as b union all
                           select 'SL - Coimbatore' as a,'Coimbatore Store' as b union all
                           select 'SL - Dehradun' as a,'Dehradun Store' as b union all
                           select 'Aniruddh Sheikh' as a,'Vendor' as b union all
                           select 'SL - Hadapsar' as a,'Pune Store' as b union all
                           select 'SL - Brighton' as a,'Manipal Store' as b union all
                           select 'Hitarth Patel' as a,'Vendor' as b union all
                           select 'SL - Hamburg' as a,'Hamburg Store' as b union all
                           select 'SL - Indore' as a,'Indore Store' as b union all
                           select 'SL - Cumana' as a,'Cumana Store' as b union all
                           select 'SL - GMIT' as a,'GMIT Store' as b union all
                           select 'Vaigai Kitchens' as a,'Vendor' as b union all
                           select 'SR Catering Food Service' as a,'Vendor' as b union all
                           select 'Class One Boys & Girls Hostel' as a,'Vendor' as b union all
                           select 'SL - Hyderabad' as a,'Hyderabad Store' as b union all
                           select 'Shree Alampata' as a,'Vendor' as b union all
                           select 'SL - Portland' as a,'Portland Store' as b union all
                           select 'Foodswing Enterprises' as a,'Vendor' as b union all
                           select 'SL - Noida' as a,'Noida Store' as b union all
                           select 'SL - EC 1' as a,'Amsterdam Store' as b union all
                           select 'SL - Yelahanka' as a,'Zagreb Store' as b union all
                           select 'SL - Auckland' as a,'Vadodara Store' as b union all
                           select 'Soul Food' as a,'Vendor' as b union all
                           select 'Green Park Hospitality Pvt Ltd' as a,'Vendor' as b union all
                           select 'Stanza Delhi Kitchen' as a,'Model Town Store' as b) list
                       on list.b = ap.address_name) b
              on a.vendor_name = b.kitchen_name and a.ingredient_name = b.recipe_tag)
      group by 1,2,3,4,5)
      where menu_date> current_date - 7 and menu_date<current_date
      group by 1) b
  on a.vendor_name = b.vendor_name ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: delta_cogs {
    type: number
    sql: ${TABLE}.delta_cogs ;;
  }

  dimension: blended_delta_qty {
    type: number
    sql: ${TABLE}.blended_delta_qty ;;
  }

  dimension: blended_delta_price {
    type: number
    sql: ${TABLE}.blended_delta_price ;;
  }



}
