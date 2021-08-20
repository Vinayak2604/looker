view: food_cost_items_budget {
  derived_table: {
    sql: select menu_date,
     vendor_id,
     vendor_master_id,
     vendor_name,
     ingredient_name,
     hostel_name,
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
    group by 1,2,3,4,5,6;;
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

  dimension: Vendor_master_id {
    type: string
    sql: ${TABLE}.Vendor_master_id ;;
  }

  dimension: total_qty {
    type: number
    sql: ${TABLE}.total_qty ;;
  }

  dimension: res_sl_qty {
    type: number
    sql: ${TABLE}.res_sl_qty ;;
  }

  dimension: non_sl_qty {
    type: number
    sql: ${TABLE}.non_sl_qty ;;
  }

  dimension: weeknum {
    type: number
    sql: extract(week from ${menu_date}) ;;
  }

  dimension: yearnum {
    type: number
    sql: extract(year from ${menu_date}) ;;
  }



}
