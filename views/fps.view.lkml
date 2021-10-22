view: fps {
  derived_table: {
    sql: with a as (select rff.user_id,rff.menu_date,rff.meal_type,rff.rating as meal_rating,rff.vendor_id,mfo.name as option_chosen

       from stanza.core_food_service_resident_food_feedback RFF
       left join stanza.core_food_service_resident_meal_feedback_options rmfo on rmfo.resident_food_feedback_uuid =rff.uuid
       left join stanza.core_food_service_meal_feedback_option mfo on mfo.uuid = rmfo.meal_feedback_option_uuid),

b as (Select distinct ds.menu_date, sh.user_id as USER_CODE, ds.residence_id as residence_id, ds.meal_type,date(sh.created_at) as date_filter

    from  stanza.core_food_service_qr_scan_history sh
    join  stanza.core_food_service_dispatch_summary ds ON sh.context_id = ds.residence_food_menu_id

    where sh.created_at >= '2021-01-01'
      and sh.qr_context_type not in ('DISPATCHSUMMARY' , 'VASTABLE')
      and sh.status = 1
      and sh."__hevo__marked_deleted" is false and ds."__hevo__marked_deleted" is false
      ),

c as (select a.*,b.residence_id,b.date_filter,fv.name as vendor_name,res.residence_name

    from a
    join b on a.menu_date = b.menu_date and a.user_id = b.user_code and a.meal_type = b.meal_type
    left join stanza.core_food_service_food_vendor fv on fv.uuid = a.vendor_id
    left join stanza.erp_transformation_master_residences res on res.uuid =b.residence_id
    )

select menu_date, vendor_name,residence_name, user_id,

MAX(case when meal_type ='BREAKFAST' then meal_rating end ) as breakfast_rating,
MAX(case when meal_type ='LUNCH' then meal_rating end) as lunch_rating,
MAX(case when meal_type ='EVENING_SNACKS' then meal_rating end) as es_rating,
MAX(case when meal_type ='DINNER' then meal_rating end) as dinner_rating,
avg(meal_Rating) as avg_rating,

sum(case when option_chosen = 'Menu option(s)' then 1 else 0 end) as menu_options,
sum(case when option_chosen = 'Presentation' then 1 else 0 end) as presentation,
sum(case when option_chosen = 'Meal served cold' then 1 else 0 end) as served_cold,
sum(case when option_chosen = 'Quantity/Portion' then 1 else 0 end) as qty_portion,
sum(case when option_chosen = 'Taste' then 1 else 0 end) as taste

from c
group by 1,2,3,4
order by 1,2,3,4
 ;;
  }

  dimension: menu_date  {
    type: date
    sql: ${TABLE}.menu_date ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: breakfast_rating {
    type: number
    sql: ${TABLE}.breakfast_rating ;;
  }

  dimension: lunch_rating {
    type: number
    sql: ${TABLE}.lunch_rating ;;
  }

  dimension: es_rating {
    type: number
    sql: ${TABLE}.es_rating ;;
  }

  dimension: dinner_rating {
    type: number
    sql: ${TABLE}.dinner_rating ;;
  }

  dimension: avg_rating {
    type: number
    sql: ${TABLE}.avg_rating ;;
  }

  dimension: menu_options {
    type: number
    sql: ${TABLE}.menu_options ;;
  }

  dimension: presentation {
    type: number
    sql: ${TABLE}.presentation ;;
  }

  dimension: served_cold {
    type: number
    sql: ${TABLE}.served_cold ;;
  }

  dimension: qty_portion {
    type: number
    sql: ${TABLE}.qty_portion ;;
  }

  dimension: taste {
    type: number
    sql: ${TABLE}.taste ;;
  }



  }
