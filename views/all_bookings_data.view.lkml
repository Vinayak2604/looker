view: all_bookings_data {
  derived_table: {
    sql:
    select rs.city, rs.micromarket,rs.residence, sum(b2c.beds) as occupied_beds,sum(case when DATE(b2c.booking_status) = 'ONBOARDING COMPLETED' then b2c.beds else 0 end) as onboarded_beds,
    sum(case when DATE(b2c.move_in_date) >= current_date() then b2c.beds else 0 end) as future_move_ins,
    (case when b2c.booking_type <= 2 then "Scholars" when b2c.booking_type >= 4 then "Suits" end) as resident_type,
    "B2C" as booking_type,sum(b2c.net_upsell_downsell) as net_upsell ,
    sum(b2c.bc_monthly_rental_net_of_discount)/sum(beds) as blended_price,
    sum(b2c.underwritten_price)/sum(b2c.beds) as underwritten from looker_demo.derived_residence_attributes rs
    left join looker_demo.derived_b2c_bookings b2c on rs.residence = b2c.residence group by 1,2,3,6

union (select city, micromarket, residence_name as residence, sum(final_beds) as occupied_beds,sum(final_beds) as onboarded_beds,
0 as future_move_ins,"B2B" as resident_type, "B2B" as booking_type,
sum(net_upsell) as net_upsell, sum(blended_mr*final_beds)/sum(final_beds) as blended_price,
sum(blended_uw*final_beds)/sum(final_beds) as underwritten
from looker_demo.derived_b2b_bookings group by 1,2,3);;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  measure: occupied_beds {
    type: number
    sql: ${TABLE}.occupied_beds ;;
  }

  measure: future_move_ins {
    type: number
    sql: ${TABLE}.future_move_ins ;;
  }

  measure: resident_type {
    type: string
    sql: ${TABLE}.resident_type ;;
  }

  measure: booking_type {
    type: string
    sql: ${TABLE}.booking_type ;;
  }

  measure: net_upsell {
    type: number
    sql: ${TABLE}.net_upsell ;;
  }

  measure: blended_price {
    type: number
    sql: ${TABLE}.blended_price ;;
  }

  measure: underwritten {
    type: number
    sql: ${TABLE}.underwritten ;;
  }

  measure: occupancy {
    type:  number
    sql: sum(${occupied_beds}) ;;
  }



}
