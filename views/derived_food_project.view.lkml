view: derived_food_project {
  derived_table: {
    sql:  Select *, 1.00*nullif(((count(case when meal_rating = 5 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 4 then meal_rating end) over(partition by student_id))-(count(case when meal_rating = 1 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 2 then meal_rating end) over(partition by student_id))),0)
    / (count(case when meal_rating = 1 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 2 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 3 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 4 then meal_rating end) over(partition by student_id)+count(case when meal_rating = 5 then meal_rating end) over(partition by student_id)) as student_fps,
    count(meal_id) over(partition by student_id) student_meal
    from stanza.derived_food_project
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
              when ${TABLE}.student_fps >= -0.20 and ${TABLE}.student_fps < 0.20 then 'FPS: -20% to 20%'
              when ${TABLE}.student_fps >= 0.20 and ${TABLE}.student_fps < 0.60 then 'FPS: 20% to 60%'
              when ${TABLE}.student_fps >= 0.60 and ${TABLE}.student_fps <= 1 then 'FPS: 60% to 100%' end;;
  }

  dimension: meal_bucket {
    type: string
    sql: case when ${TABLE}.student_meal <5 then 'a. 1-5'
              when ${TABLE}.student_meal <10 then 'b. 5-10'
              when ${TABLE}.student_meal <15 then 'c. 10-15'
              when ${TABLE}.student_meal <20 then 'd. 15-20'
              when ${TABLE}.student_meal >=20 then 'e. >=20' end;;
  }


  dimension: student_id {
    type: string
    sql: ${TABLE}.student_id ;;
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



  measure: total_meals {
    type: count_distinct
    sql: ${meal_id} ;;
  }

  measure: total_rated_meals {
    type: count_distinct
    sql: case when ${meal_rating} >= 1 then ${meal_id} end;;
  }

  measure: total_rating {
    type: number
    sql: count(case when ${meal_rating} >= 1 then ${meal_rating} end);;
  }

  measure: total_rating_for_filter {
    type: number
    sql: count(${meal_rating}) ;;
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
    sql: case when ${meal_rating} = 4 then ${meal_id} end ;;
  }

  measure: 5s {
    type: count_distinct
    sql: case when ${meal_rating} = 5 then ${meal_id} end;;
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
    sql: nullif(1.00*coalesce((${5s}+${4s}) - (${1s}+${2s}),0),0) / ${total_rating};;
    value_format: "0.0%"
  }



}
