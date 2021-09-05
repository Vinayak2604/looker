view: derived_sales_summary {
  derived_table: {
    sql:
    with a as (select distinct date, residence_id, residence, micromarket, city, zone, residence_category, max(live_beds) as live_beds,sum(upcoming_move_ins) as upcoming_move_ins,sum(live_bookings) as live_bookings,sum(live_occupancy) as live_occupancy,
    sum(onboarded_beds) as onboarded_beds,sum(forward_beds_sold) as forward_beds_sold,sum(forward_gross_occupancy) as forward_gross_occupancy,
    sum(forward_net_occupancy) as forward_net_occupancy,sum(beds_cs_nmi) as beds_cs_nmi,sum(adjusted_live_occupancy) as adjusted_live_occupancy,
    sum(net_monthly_rent) as net_monthly_rent,sum(live_monthly_rent) as live_monthly_rent,sum(bookings) as bookings,
    sum(prebookings) as prebookings,sum(refunded_prebookings) as refunded_prebookings,sum(converted_prebookings) as converted_prebookings,
    sum(prebookings_till_date) as prebookings_till_date,sum(refunded_prebookings_till_date) as refunded_prebookings_till_date,
    sum(converted_prebookings_till_date) as converted_prebookings_till_date,sum(current_revenue) as current_revenue,sum(forward_revenue) as forward_revenue,
    sum(forward_net_beds_sold) as forward_net_beds_sold,
    row_number() over (partition by residence_id order by date desc) as rn
from derived_sales_summary
where {% condition date %} date {% endcondition %}
and {% condition booking_type %} booking_type {% endcondition %}
group by 1,2,3,4,5,6,7),
b as (select residence_id,
sum(bookings) as filtered_period_bookings,
sum(case when rn = 1 then bookings else 0 end) as today_bookings,
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
select a.*, b.filtered_period_bookings, b.today_bookings, b.yesterday_bookings, b.l3d_bookings, b.l7d_bookings, b.l30d_bookings,
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

  # parameter: booking_type {
  #   type: string
  #   allowed_value: {
  #     label: "All"
  #     value: "1,0"
  #   }
  #   allowed_value: {
  #     label: "B2C"
  #     value: "0"
  #   }
  #   allowed_value: {
  #     label: "B2B"
  #     value: "1"
  #   }
  # }

  filter: booking_type {
    suggestions: ["B2C","B2B"]
  }

  measure: filtered_period_bookings {
    type: sum
    sql: ${TABLE}.filtered_period_bookings ;;
    html: {% if value > 0 %}
      <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
      <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: today_bookings {
    type: sum
    sql: ${TABLE}.today_bookings ;;
    html: {% if value > 0 %}
          <p style="color: black; font-size:100%">{{ rendered_value }}</p>

          {% else %}
          <p style="color: black"> - </p>

          {% endif %} ;;
  }

  measure: yesterday_bookings {
    type: sum
    sql: ${TABLE}.yesterday_bookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l3d_bookings {
    type: sum
    sql: ${TABLE}.l3d_bookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l7d_bookings {
    type: sum
    sql: ${TABLE}.l7d_bookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l30d_bookings {
    type: sum
    sql: ${TABLE}.l30d_bookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: filtered_period_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: yesterday_prebookings {
    type: sum
    sql: ${TABLE}.yesterday_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l3d_prebookings {
    type: sum
    sql: ${TABLE}.l3d_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l7d_prebookings {
    type: sum
    sql: ${TABLE}.l7d_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: l30d_prebookings {
    type: sum
    sql: ${TABLE}.l30d_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: filtered_period_refunded_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_refunded_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: filtered_period_converted_prebookings {
    type: sum
    sql: ${TABLE}.filtered_period_converted_prebookings ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  dimension: adjusted_live_occupancy {
    type: number
    sql: ${TABLE}.adjusted_live_occupancy ;;
  }

  measure: beds_cs_nmi {
    type: sum
    sql: ${TABLE}.beds_cs_nmi ;;
    value_format: "#,##0"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  # dimension: city_lat {
  #   type: string
  #   sql: ${TABLE}.city_lat ;;
  # }

  # dimension: city_long {
  #   type: string
  #   sql: ${TABLE}.city_long ;;
  # }

  dimension: forward_gross_occupancy {
    type: number
    sql: ${TABLE}.forward_gross_occupancy ;;
  }

  measure: forward_beds_sold {
    type: sum
    sql: ${TABLE}.forward_beds_sold ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: forward_net_beds_sold {
    type: sum
    sql: ${TABLE}.forward_net_beds_sold ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  dimension: forward_net_occupancy {
    type: number
    sql: ${TABLE}.forward_net_occupancy ;;
  }

  measure: live_beds {
    type: sum
    sql: ${TABLE}.live_beds ;;
    value_format: "#,##0"
  }

  measure: live_beds_t {
    type: sum
    sql: ${TABLE}.live_beds ;;
    value_format: "#,##0"
    html:
    <p style="color: black; font-size:100%"></p> ;;
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
    value_format: "#,##0"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
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
    value_format: "#,##0"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: unbooked_inventory {
    type: number
    sql: ${live_beds} - ${onboarded_beds} - ${upcoming_move_ins} - ${beds_cs_nmi} ;;
    value_format: "#,##0"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: pre_and_full_bookings {
    type: number
    sql: ${filtered_period_bookings} + ${filtered_period_prebookings} ;;
    label: "Pre & Full Bookings"
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: prebookings_till_date {
    type: sum
    sql: ${TABLE}.prebookings_till_date ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: converted_prebookings_till_date {
    type: sum
    sql: ${TABLE}.converted_prebookings_till_date ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: refunded_prebookings_till_date {
    type: sum
    sql: ${TABLE}.refunded_prebookings_till_date ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: current_revenue {
    type: sum
    sql: ${TABLE}.current_revenue ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
  }

  measure: forward_revenue {
    type: sum
    sql: ${TABLE}.forward_revenue ;;
    html: {% if value > 0 %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>

    {% else %}
    <p style="color: black"> - </p>

    {% endif %} ;;
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

  dimension: residence_category {
    type: string
    sql: ${TABLE}.residence_category ;;
  }

  # filter: residence_category {
  #   type: string
  #   suggestions: ["Scholar","Suits","Studio"]
  # }

}
