view: derived_food_project {
  derived_table: {
    sql: with student as (SELECT student_id, 1.00*nullif((count(distinct case when meal_rating = 5 then meal_id end)+count(distinct case when meal_rating = 4 then meal_id end))
      -(count(distinct case when meal_rating = 1 then meal_id end)+count(distinct case when meal_rating = 2 then meal_id end)),0)
      / count(distinct case when meal_rating >= 1 then meal_id end) student_fps,
      count(distinct case when meal_rating >= 1 then meal_id end) student_rated_meal
      from stanza.derived_food_project
      where {% condition date_for_filter %} date {% endcondition %}
      group by 1),

      vendor as (SELECT vendor_name, 1.00*nullif((count(distinct case when meal_rating = 5 then meal_id end)+count(distinct case when meal_rating = 4 then meal_id end))
      -(count(distinct case when meal_rating = 1 then meal_id end)+count(distinct case when meal_rating = 2 then meal_id end)),0)
      / count(distinct case when meal_rating >= 1 then meal_id end) vendor_fps,
      count(distinct case when meal_rating >= 1 then meal_id end) vendor_rated_meal
      from stanza.derived_food_project
      where {% condition date_for_filter %} date {% endcondition %}
      group by 1),

      city as (SELECT city_name, 1.00*nullif((count(distinct case when meal_rating = 5 then meal_id end)+count(distinct case when meal_rating = 4 then meal_id end))
      -(count(distinct case when meal_rating = 1 then meal_id end)+count(distinct case when meal_rating = 2 then meal_id end)),0)
      / count(distinct case when meal_rating >= 1 then meal_id end) city_fps,
      count(distinct case when meal_rating >= 1 then meal_id end) city_rated_meal
      from stanza.derived_food_project
      where {% condition date_for_filter %} date {% endcondition %}
      group by 1),

      micromarket as (SELECT micromarket_name, 1.00*nullif((count(distinct case when meal_rating = 5 then meal_id end)+count(distinct case when meal_rating = 4 then meal_id end))
      -(count(distinct case when meal_rating = 1 then meal_id end)+count(distinct case when meal_rating = 2 then meal_id end)),0)
      / count(distinct case when meal_rating >= 1 then meal_id end) micromarket_fps,
      count(distinct case when meal_rating >= 1 then meal_id end) micromarket_rated_meal
      from stanza.derived_food_project
      where {% condition date_for_filter %} date {% endcondition %}
      group by 1)



    Select d2.*, student_fps, student_rated_meal, vendor_fps, vendor_rated_meal, city_fps, city_rated_meal, micromarket_fps, micromarket_rated_meal
          from stanza.derived_food_project d2
          left join student on d2.student_id=student.student_id
          left join vendor on d2.vendor_name=vendor.vendor_name
          left join city on d2.city_name=city.city_name
          left join micromarket on d2.micromarket_name = micromarket.micromarket_name
          where {% condition date_for_filter %} date {% endcondition %}
            ;;
  }

  parameter: date_for_filter {
    type: date
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
    hidden: yes
  }


  dimension: month_quartile {
    type: string
    sql: case when extract(day from ${date}) <= 8 then '1st Quartile' when extract(day from ${date}) <= 16 then '2nd Quartile' when extract(day from ${date}) <= 24 then '3rd Quartile' when extract(day from ${date}) > 24 then '4th Quartile' end;;
  }

  dimension: student_fps {
    type: string
    sql: case when ${TABLE}.student_fps >= -1 and ${TABLE}.student_fps < -0.60 then 'FPS: -100% to -60%'
              when ${TABLE}.student_fps >= -0.60 and ${TABLE}.student_fps < -0.20 then 'FPS: -60% to -20%'
              when ((${TABLE}.student_fps >= -0.20 and ${TABLE}.student_fps < 0.20) or (student_rated_meal <> 0 and student_fps is null))  then 'FPS: -20% to 20%'
              when ${TABLE}.student_fps >= 0.20 and ${TABLE}.student_fps < 0.60 then 'FPS: 20% to 60%'
              when ${TABLE}.student_fps >= 0.60 and ${TABLE}.student_fps <= 1 then 'FPS: 60% to 100%' end;;
  }

  dimension: vendor_fps {
    type: string
    sql: case when (${TABLE}.vendor_fps < 0.30 or (${TABLE}.vendor_rated_meal <> 0 and ${TABLE}.vendor_fps is null)) then 'FPS: <30%'
              when ${TABLE}.vendor_fps >= 0.30 and ${TABLE}.vendor_fps < 0.60 then 'FPS: <60%'
              when ${TABLE}.vendor_fps >= 0.60 and ${TABLE}.vendor_fps <= 1 then 'FPS: >= 60%' end;;
  }

  dimension: city_fps {
    type: string
    sql: case when (${TABLE}.city_fps < 0.30 or (${TABLE}.city_rated_meal <> 0 and ${TABLE}.city_fps is null))  then 'FPS: <30%'
              when ${TABLE}.city_fps >= 0.30 and ${TABLE}.city_fps < 0.60 then 'FPS: <60%'
              when ${TABLE}.city_fps >= 0.60 and ${TABLE}.city_fps <= 1 then 'FPS: >= 60%' end;;
  }

  dimension: micromarket_fps {
    type: string
    sql: case when (${TABLE}.micromarket_fps < 0.30 or (${TABLE}.micromarket_rated_meal <> 0 and ${TABLE}.micromarket_fps is null))  then 'FPS: <30%'
              when ${TABLE}.micromarket_fps >= 0.30 and ${TABLE}.micromarket_fps < 0.60 then 'FPS: <60%'
              when ${TABLE}.micromarket_fps >= 0.60 and ${TABLE}.micromarket_fps <= 1 then 'FPS: >= 60%' end;;
  }


  dimension: meal_bucket {
    type: string
    sql: case when ${TABLE}.student_rated_meal <5 then '1-5'
              when ${TABLE}.student_rated_meal <10 then '5-10'
              when ${TABLE}.student_rated_meal <15 then '10-15'
              when ${TABLE}.student_rated_meal <20 then '15-20'
              when ${TABLE}.student_rated_meal >=20 then '>=20' end;;
  }


  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: vendor_type {
    type: string
    sql: ${TABLE}.vendor_type ;;
  }

  dimension_group: move_in_date {
    type: time
    sql: ${TABLE}.move_in_date ;;
  }

  dimension: residence_name {
    type: string
    sql: ${TABLE}.residence_name ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: micromarket_name {
    type: string
    sql: ${TABLE}.micromarket_name ;;
  }

  dimension: meal_id {
    type: string
    sql: ${TABLE}.meal_id ;;
  }

  dimension: meal_type {
    type: string
    sql: ${TABLE}.meal_type ;;
  }

  dimension: meal_consumed {
    type: number
    sql: ${TABLE}.meal_consumed ;;
  }

  dimension: item_base_preference {
    type: number
    sql: ${TABLE}.item_base_preference ;;
  }

  dimension: meal_rating {
    type: number
    sql: ${TABLE}.meal_rating ;;
  }

  dimension: preference_available {
    type: number
    sql: ${TABLE}.preference_available ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: home_town {
    type: string
    sql: ${TABLE}.home_town ;;
  }

  dimension: option_chosen {
    type: string
    sql: ${TABLE}.option_chosen ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: ageing {
    type: number
    sql: ${TABLE}.ageing ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }

  measure: total_users {
    type: count_distinct
    sql: ${student_id} ;;
  }

  measure: total_rated_users {
    type: count_distinct
    sql: case when ${meal_rating} >= 1 then ${student_id} end;;
  }

  measure: rated_user_per {
    type: number
    sql: 1.00*coalesce(${total_rated_users},0) /  ${total_users}  ;;
    value_format: "0.0%"
  }

  measure: total_residence {
    type: count_distinct
    sql: ${residence_name} ;;
  }



  measure: total_meals {
    type: count_distinct
    sql: ${meal_id} ;;
  }

  measure: total_rated_meals {
    type: count_distinct
    sql: case when ${meal_rating} >= 1 then ${meal_id} end;;
  }

  measure: total_rating {
    type: count_distinct
    sql: case when ${meal_rating} >= 1 then ${meal_id} end;;
  }

  measure: total_rating_for_filter {
    type: count_distinct
    sql: case when ${meal_rating} >= 1 then ${meal_id} end;;
  }


  measure: 1s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 1 then ${student_id} end;;
  }

  measure: 2s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 2 then ${student_id} end;;
  }


  measure: 3s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 3 then ${student_id} end;;
  }

  measure: 4s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 4 then ${student_id} end ;;
  }

  measure: 5s_user {
    type: count_distinct
    sql: case when ${meal_rating} = 5 then ${student_id} end;;
  }

  measure: 1s {
    type: count_distinct
    sql: case when ${meal_rating} = 1 then ${meal_id} end;;
  }

  measure: 2s {
    type: count_distinct
    sql: case when ${meal_rating} = 2 then ${meal_id} end;;
  }


  measure: 3s {
    type: count_distinct
    sql: case when ${meal_rating} = 3 then ${meal_id} end;;
  }

  measure: 4s {
    type: count_distinct
    sql: case when ${meal_rating} = 4 then ${meal_id} end;;
  }

  measure: 5s {
    type: count_distinct
    sql: case when ${meal_rating} = 5 then ${meal_id} end  ;;
  }


  measure: 1s_per {
    type: number
    sql: 1.00*coalesce(${1s},0) / ${total_rating};;
    value_format: "0.0%"
  }

  measure: 2s_per {
    type: number
    sql: 1.00*coalesce(${2s},0) / ${total_rating};;
    value_format: "0.0%"
  }


  measure: 3s_per {
    type: number
    sql: 1.00*coalesce(${3s},0) / ${total_rating};;
    value_format: "0.0%"
  }

  measure: 4s_per {
    type: number
    sql: 1.00*coalesce(${4s},0) / ${total_rating};;
    value_format: "0.0%"
  }

  measure: 5s_per {
    type: number
    sql: 1.00*coalesce(${5s},0) / ${total_rating};;
    value_format: "0.0%"
  }

  measure: rating_per {
    type: number
    sql: 1.00*coalesce(${total_rating},0) / ${total_meals};;
    value_format: "0.0%"
  }

  measure: FPS {
    type: number
    sql: nullif(1.00*coalesce((${5s}+${4s}+${3s}) - (${1s}+${2s}+${3s}),0),0) / ${total_rating};;
    value_format: "0.0%"
  }

  measure: meals_with_preference {
    type: count_distinct
    sql: case when ${preference_available} = 1 then ${meal_id} end ;;
  }

  measure: preference_given {
    type: count_distinct
    sql: case when ${preference_available} = 1 and ${item_base_preference} = 1 then ${meal_id} end ;;
  }

  measure: preference_per {
    type: number
    sql: nullif(1.00*coalesce(${preference_given},0),0) / ${meals_with_preference};;
    value_format: "0.0%"
  }





}
