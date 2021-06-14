view: all_bookings_data {
  derived_table: {
    sql:
    select city, micromarket,residence, sum(beds) as occupied_beds,
    sum(case when DATE(move_in_date) >= current_date() then beds else 0 end) as future_move_ins,
    (case when booking_type <= 2 then "Scholars" when booking_type >= 4 then "Suits" end) as resident_type,
    "B2C" as booking_type,sum(net_upsell_downsell) as net_upsell ,
    sum(bc_monthly_rental_net_of_discount)/sum(beds) as blended_price,
    sum(underwritten_price)/sum(beds) as underwritten from looker_demo.derived_b2c_bookings group by 1,2,3,6

union (select city, micromarket, residence_name as residence, sum(final_beds) as occupied_beds,
0 as future_move_ins,"B2B" as resident_type, "B2B" as booking_type,
sum(net_upsell), sum(blended_mr*final_beds)/sum(final_beds) as blended_price,
sum(blended_uw*final_beds)/sum(final_beds) as underwritten
from looker_demo.derived_b2b_bookings group by 1,2,3);;
  }
}
