view: derived_sales_summary {
  derived_table: {
    sql:
    with a as (select distinct *, row_number() over (partition by residence_id order by date desc) as rn
from derived_sales_summary
where {% condition date %} date {% endcondition %}),
b as (select residence_id,
sum(bookings) as filtered_period_bookings,
sum(case when rn > 1 and rn <= 2 then bookings else 0 end) as yesterday_bookings,
sum(case when rn > 1 and rn <= 4 then bookings else 0 end) as l3d_bookings,
sum(case when rn > 1 and rn <= 8 then bookings else 0 end) as l7d_bookings,
sum(case when rn > 1 and rn <= 31 then bookings else 0 end) as l30d_bookings,
sum(prebookings) as filtered_period_prebookings,
sum(case when rn > 1 and rn <= 2 then prebookings else 0 end) as yesterday_prebookings,
sum(case when rn > 1 and rn <= 4 then prebookings else 0 end) as l3d_prebookings,
sum(case when rn > 1 and rn <= 8 then prebookings else 0 end) as l7d_prebookings,
sum(case when rn > 1 and rn <= 31 then prebookings else 0 end) as l30d_prebookings,
sum(refunded_prebookings) as filtered_period_refunded_prebookings,
sum(converted_prebookings) as filtered_period_converted_prebookings
from a
group by 1)
select a.*, b.filtered_period_bookings, b.yesterday_bookings, b.l3d_bookings, b.l7d_bookings, b.l30d_bookings,
b.filtered_period_prebookings, b.yesterday_prebookings, b.l3d_prebookings, b.l7d_prebookings, b.l30d_prebookings, b.filtered_period_refunded_prebookings,
b.filtered_period_converted_prebookings
from a
left join b on a.residence_id = b.residence_id
where a.rn = 1;;
  }

  parameter: date {
    type: date
    convert_tz: no
  }

  measure: filtered_period_bookings {
    type: sum
    sql: ${TABLE}.filtered_period_bookings ;;
  }

  measure: yesterday_bookings {
    type: sum
    sql: ${TABLE}.yesterday_bookings ;;
  }

  measure: l3d_bookings {
    type: sum
    sql: ${TABLE}.l3d_bookings ;;
  }

  measure: l7d_bookings {
    type: sum
    sql: ${TABLE}.l7d_bookings ;;
  }

  measure: l30d_bookings {
    type: sum
    sql: ${TABLE}.l30d_bookings ;;
  }

  measure: filtered_period_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_prebookings ;;
  }

  measure: yesterday_prebookings {
    type: sum
    sql: ${TABLE}.yesterday_prebookings ;;
  }

  measure: l3d_prebookings {
    type: sum
    sql: ${TABLE}.l3d_prebookings ;;
  }

  measure: l7d_prebookings {
    type: sum
    sql: ${TABLE}.l7d_prebookings ;;
  }

  measure: l30d_prebookings {
    type: sum
    sql: ${TABLE}.l30d_prebookings ;;
  }

  measure: filtered_period_refunded_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_refunded_prebookings ;;
  }

  measure: filtered_period_converted_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_converted_prebookings ;;
  }

  dimension: adjusted_live_occupancy {
    type: number
    sql: ${TABLE}.adjusted_live_occupancy ;;
  }

  measure: beds_cs_nmi {
    type: sum
    sql: ${TABLE}.beds_cs_nmi ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_lat {
    type: string
    sql: ${TABLE}.city_lat ;;
  }

  dimension: city_long {
    type: string
    sql: ${TABLE}.city_long ;;
  }

  dimension: forward_gross_occupancy {
    type: number
    sql: ${TABLE}.forward_gross_occupancy ;;
  }

  measure: forward_beds_sold {
    type: sum
    sql: ${TABLE}.forward_beds_sold ;;
  }

  dimension: forward_net_occupancy {
    type: number
    sql: ${TABLE}.forward_net_occupancy ;;
  }

  measure: live_beds {
    type: sum
    sql: ${TABLE}.live_beds ;;
  }

  dimension: live_bookings {
    type: number
    sql: ${TABLE}.live_bookings ;;
  }

  dimension: live_monthly_rent {
    type: number
    sql: ${TABLE}.live_monthly_rent ;;
  }

  dimension: live_occupancy {
    type: number
    sql: ${TABLE}.live_occupancy ;;
  }

  dimension: micromarket {
    type: string
    sql: ${TABLE}.micromarket ;;
  }

  dimension: net_monthly_rent {
    type: number
    sql: ${TABLE}.net_monthly_rent ;;
  }

  measure: onboarded_beds {
    type: sum
    sql: ${TABLE}.onboarded_beds ;;
  }

  dimension: residence {
    type: string
    sql: ${TABLE}.residence ;;
  }

  dimension: residence_id {
    type: string
    sql: ${TABLE}.residence_id ;;
  }

  measure: upcoming_move_ins {
    type: sum
    sql: ${TABLE}.upcoming_move_ins ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: unbooked_inventory {
    type: number
    sql: ${live_beds} - ${onboarded_beds} - ${upcoming_move_ins} - ${beds_cs_nmi} ;;
  }

  measure: pre_and_full_bookings {
    type: number
    sql: ${filtered_period_bookings} + ${filtered_period_prebookings} ;;
    label: "Pre & Full Bookings"
  }

  dimension: test {
    type: string
    # view_label: " "
    sql: " " ;;
    label: " "
    html: {% if value == ' ' %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% endif %};;

  }
}