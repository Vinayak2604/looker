view: vas_orders {
  derived_table: {
    sql: select
  co.residence_id residence_id,
  mr.residence_name residence_name,
  fv.name as vendor,
  co.uuid order_id,
  co.order_date order_date,
  co.user_id user_id,
  vm.uuid item_id,
  vm.name as dish_name,
  cod.final_total_amount final_total_amount
from
  stanza.core_food_service_cafe_order co
join stanza.core_food_service_cafe_order_details cod on
  cod.order_id = co.uuid
join stanza.core_food_service_vas_master vm on
  vm.uuid = cod.item_id
join stanza.core_food_service_cafe_kitchen_mapping ckm on
  co.cafe_id = ckm.cafe_id
join stanza.core_food_service_food_vendor fv on
  ckm.kitchen_id = fv.uuid
join stanza.erp_transformation_master_residences mr on
      co.residence_id = mr.uuid
where
  order_status not in ('CANCELLED', 'CREATED')
  and fv.name not like '%Asgard%'
group by
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9 ;;
  }
  dimension: residence_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.residence_id ;;
  }
  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date;;
  }
  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }
  dimension: dish_name {
    type: string
    sql: ${TABLE}.dish_name ;;
  }
  measure: final_total_amount {
    type: sum
    sql: ${TABLE}.final_total_amount ;;
  }
  # measure: top_selling_items {
  # type: count
  # sql: ${TABLE}.item_id ;;
  # }
  measure: orders {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }
  measure: aov {
    type: number
    sql: (${TABLE}.final_total_amount)/(${orders}) ;;
  }
  }
