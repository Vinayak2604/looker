view: full_bookings {
  derived_table: {
    sql:
          SELECT  DATE(bk.created) as created_at, ct.NAME as city, mm.NAME as micromarket,
          rs.NAME as residence, count(bk.BOOKING_ID) as bookings from stanza.ims_inventory_BOOKING bk
left join stanza.ims_inventory_inventory inv on bk.inventory_id= inv.inventory_id
left join stanza.ims_inventory_RESIDENCE rs on inv.residence_id= rs.residence_id
left join stanza.ims_inventory_MICROMARKET mm on rs.MICROMARKET_ID = mm.micromarket_id
left join stanza.ims_inventory_CITY ct on mm.CITY_ID = ct.CITY_ID
where bk.BOOKING_STATUS not IN ('EXPIRED','IN PROGRESS','PAYMENT_PENDING','SHARED WITH RESIDENT')
and rs.NAME not ilike '%test%'
group by 1,2,3,4;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }


  measure: bookings {
    type: number
    sql: ${TABLE}.pre_bookings ;;
    value_format: "#,##0"
  }



  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }
}
