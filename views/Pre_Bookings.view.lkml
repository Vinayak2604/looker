  view: pre_bookings {
    derived_table: {
      sql:
          SELECT  l.pre_booking_date as created_at, ct.NAME as city, mm.NAME as micromarket,
          l.pre_booking_residence as residence, count(l.id) as pre_bookings,
          sum(case when l.lead_tag like '%refund%'  then 1 else 0 end) as refunded,
          sum(case when bk.BOOKING_ID is not null then 1 else 0 end) as converted
          from stanza.ims_lead_service_lead_detail l
left join stanza.ims_inventory_RESIDENCE rs on l.pre_booking_residence= rs.NAME
left join stanza.ims_inventory_MICROMARKET mm on rs.MICROMARKET_ID = mm.micromarket_id
join stanza.ims_inventory_LEAD ld on l.phone = ld.PHONE
left join stanza.ims_inventory_BOOKING bk on l.PHONE = bk.PHONE

left join stanza.ims_inventory_CITY ct on mm.CITY_ID = ct.CITY_ID
where (l.lead_tag like '%hotLead%' or ld.lead_tag like '%hotLead%') and rs.NAME not ilike '%test%'
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


    measure: pre_bookings {
      type: number
      sql: sum(${TABLE}.pre_bookings) ;;
      value_format: "#,##0"
    }

    measure: refunded {
      type: number
      sql: sum(${TABLE}.refunded) ;;
      value_format: "#,##0"
    }

    measure: converted {
      type: number
      sql: sum(${TABLE}.converted) ;;
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
