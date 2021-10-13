view: inventory_ledger {
  derived_table: {
    sql: select * from
        (select property as Store, 'IN' as movement_type ,po_number,po_created_at,vendor_name as transfer_entity,item_category_label ,scope_of_work ,item_code ,item_name ,
        unit_rate_rent_per_month , quantity , subtotal_amount ,po_completion_date,ingredient_tag
        from stanza.derived_food_invoice
        where gsri_done_flag =1
        and property like '%Store%' or property = 'Manipal')
        UNION
        (select vendor_name as Store, 'OUT' as movement_type ,po_number,po_created_at,property as transfer_entity,item_category_label ,scope_of_work ,item_code ,item_name ,
        unit_rate_rent_per_month , quantity , subtotal_amount ,po_completion_date,ingredient_tag
        from stanza.derived_food_invoice
        where gsri_done_flag =1
        and vendor_name like '%Store%' or vendor_name = 'Manipal')
         ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: movement_type {
    type: string
    sql: ${TABLE}.movement_type ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension_group: po_creation_date {
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
    sql: ${TABLE}.po_created_at ;;
  }

  dimension: transfer_entity {
    type: string
    sql: ${TABLE}.transfer_entity ;;
  }

  dimension:item_code  {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension:item_name  {
    type: string
    sql: nvl(${TABLE}.ingredient_tag,${TABLE}.item_name) ;;
  }

  dimension:original_item  {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.unit_rate_rent_per_month ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.subtotal_amount ;;
  }

  dimension_group: po_completion_date {
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
    datatype: datetime
    sql: ${TABLE}.po_completion_date ;;
  }

  dimension: transfer_time {
    type: date_time
    sql: ${TABLE}.po_completion_date ;;
  }

  dimension: weeknum {
    type: number
    sql: extract(week from ${po_completion_date_date}) ;;
  }

  dimension: yearnum {
    type: number
    sql: extract(year from ${po_completion_date_date}) ;;
  }


  }
