view: food_vas_orders {
 derived_table: {
   sql: select co.order_date,co.order_code,co.order_type,co.order_status,co.final_total_amount,
cs.slot_name,
r.residence_name,
cm.cafe_name,
m.micromarket_name ,
c.city_name,
t.resident_code,
s.email,
s.first_name
from stanza.core_food_service_cafe_order co
join stanza.core_food_service_cafe_slots cs
  on co.residence_id =cs.residence_id and co.cafe_id=cs.cafe_id and cs.uuid=co.slot_id
join stanza.erp_transformation_master_residences r
  on co.residence_id =r.uuid and lower(r.residence_name) not like '%test%'
join stanza.core_food_service_cafe_master cm on co.cafe_id = cm.uuid
left join stanza.erp_transformation_master_micromarket m on r.micromarket_id =m.uuid
left join stanza.erp_transformation_master_cities c on m.city_id =c.uuid
left join (select distinct user_id , resident_code
           from stanza.core_food_service_cafe_order_user_details) t on co.user_id = t.user_id
left join stanza.ims_inventory_student s on t.resident_code = s.student_id ;;
 }

dimension: order_date {
  type: date
  sql: ${TABLE}.order_date ;;
}

dimension: order_code {
  type: string
  sql: ${TABLE}.order_code ;;
}

dimension: order_type {
  type: string
  sql: ${TABLE}.order_type ;;
}

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: final_total_amount {
    type: number
    sql: ${TABLE}.final_total_amount ;;
  }

  dimension: slot_name {
    type: string
    sql: ${TABLE}.slot_name ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: cafe_name {
    type: string
    sql: ${TABLE}.cafe_name ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }


  dimension: resident_code {
    type: string
    sql: ${TABLE}.resident_code ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

}

view: dish_level_vas {
  derived_table: {
    sql:select co.order_date,co.order_code,vm.name as item_name
from stanza.core_food_service_cafe_order co
left join stanza.core_food_service_cafe_order_details cod on co.uuid =cod.order_id
left join stanza.core_food_service_vas_master vm on vm.uuid =cod.item_id ;;
  }

  dimension: order_date {
    type: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_code {
    type: string
    sql: ${TABLE}.order_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

}
