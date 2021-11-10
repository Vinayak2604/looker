view: price_variance {
  derived_table: {
    sql:with a as (select distinct kp.item_id as ig_uuid, it.name as ingredient_name, kp.vendor_id as vendor_id,
                    case when v.name = 'SL - Noida' then 'Noida Kitchen' else v.name end as kitchen,
                    kp.standard_quantity_cost, date(kp.updated_at) as price_date,
                    kp."__hevo__marked_deleted" as flag

                    from stanza.core_food_service_food_item_kitchen_price kp
                    join stanza.core_food_service_ingredient_tag it on it.uuid = kp.item_id
                    join stanza.core_food_service_food_vendor v on v.vendor_master_uuid = kp.vendor_id

                    where v."__hevo__marked_deleted" is false
                    and it."__hevo__marked_deleted" is false),


dfi as (select * from stanza.derived_food_inventory where location_type = 'STORE'),

m as (select 'Shree Alampata' as a,'Shree Alampata' as b,'Shree Alampata' as c union all
              select 'Ahmedabad Kitchen' as a,'SL - Portland' as b,'Portland Store' as c union all
              select 'Class One Boys & Girls Hostel' as a,'Class One Boys & Girls Hostel' as b,'Class One Boys & Girls Hostel' as c union all
              select 'Manipal Kitchen' as a,'SL - Brighton' as b,'Manipal Store' as c union all
              select 'Koramangala Kitchen' as a,'SL - Hamburg' as b,'Hamburg Store' as c union all
              select 'FOODSWING ENTERPRISES' as a,'Foodswing Enterprises' as b,'Foodswing Enterprises' as c union all
              select 'Vidyanagar Kitchen' as a,'SL - Cumana' as b,'Cumana Store' as c union all
              select 'Corporate_Office_Noida' as a,'Corporate Office' as b,'Central Store' as c union all
              select 'Noida Kitchen' as a,'SL - Noida' as b,'Noida Store' as c union all
              select 'Pune Hadapsar Kitchen' as a,'SL - Hadapsar' as b,'Pune Store' as c union all
              select 'Amsterdam Kitchen' as a,'SL - EC 1' as b,'Amsterdam Store' as c union all
              select 'Soul Food' as a,'Soul Food' as b,'Soul Food' as c union all
              select 'Vaigai Kitchens' as a,'Vaigai Kitchens' as b,'Vaigai Kitchens' as c union all
              select 'Vadodara Kitchen' as a,'SL - Auckland' as b,'Vadodara Store' as c union all
              select 'Zagreb Kitchen' as a,'SL - Yelahanka' as b,'Zagreb Store' as c union all
              select 'SL - Noida' as a,'SL - Noida' as b,'Noida Store' as c union all
              select 'Model Town Kitchen' as a,'SL - Model Town' as b,'Model Town Store' as c union all
              select 'Hyderabad Kitchen' as a,'SL - Hyderabad' as b,'Hyderabad Store' as c union all
              select 'Indore Kitchen' as a,'SL - Indore' as b,'Indore Store' as c union all
              select 'GMIT Kitchen' as a,'SL - GMIT' as b,'GMIT Store' as c union all
              select 'SR Catering Food Service' as a,'SR Catering Food Service' as b,'SR Catering Food Service' as c union all
              select 'Coimbatore Kitchenn' as a,'SL - Coimbatore' as b,'Coimbatore Store' as c union all
              select 'Dehradun Kitchen' as a,'SL - Dehradun' as b,'Dehradun Store' as c union all
              select 'Kitchen - Chennai Zamin Pallavaram' as a,'SL - Chennai' as b,'Chennai Pallavaram Store' as c union all
              select 'Tiffins Etc' as a,'Tiffins Etc' as b,'Tiffins Etc' as c union all
              select 'Hitarth Patel' as a,'Hitarth Patel' as b,'Hitarth Patel' as c union all
              select 'Green Park Hospitality Pvt Ltd' as a,'Green Park Hospitality Pvt Ltd' as b,'Green Park Hospitality Pvt Ltd' as c union all
              select 'Green Park Hospitality Services Private Limited' as a,'Green Park Hospitality Pvt Ltd' as b,'Green Park Hospitality Pvt Ltd' as c),

inv as (select m.b as kitchen, dfi.ingredient_tag, sum(dfi.avail_stock_value) as total_value
      from dfi
      left join m on dfi.location_name = m.c
      where m.b is not null
      group by 1,2),

sc as (select distinct z.*,t.name
    from (select recipe_tag,item_sub_category_label,rank() over (partition by recipe_tag order by created_at desc) as rnk
          from stanza.erp_inventory_service_inventory_item_meta_entity
        ) z
    left join stanza.core_food_service_ingredient_tag t on t.uuid = z.recipe_tag
    where rnk=1),


b as (select a.*,m.b as clean_kitchen,m.c as store,sc.item_sub_category_label

      from a

      left join m on a.kitchen = m.a
      left join sc on sc.recipe_tag = a.ig_uuid
      where a.flag = 0 and m.b is not null

      union

      select a.*,m.b as clean_kitchen,m.c as store,sc.item_sub_category_label

      from a

      left join m on a.kitchen = m.a
      left join sc on sc.recipe_tag = a.ig_uuid
      where a.price_date = '2021-09-08' and m.b is not null),

c as (select b.*, min(standard_quantity_cost) over (partition by price_date, ig_uuid) as min_price,
     coalesce ((standard_quantity_cost - min_price) /nullif( min_price ,0),0) as deviation,
     coalesce (inv.total_value,0) as total_value

from b
left join inv on b.clean_kitchen = inv.kitchen and b.ingredient_name = inv.ingredient_tag)


select *, sum(total_value*deviation) over (partition by price_date, ig_uuid)/nullif(sum(total_value) over (partition by price_date, ig_uuid),0) as wt_deviation
from c
;;
  }

  dimension: ig_uuid {
    type: string
    sql: ${TABLE}.ig_uuid ;;
  }

  dimension: ingredient_name {
    type: string
    sql: ${TABLE}.ingredient_name ;;
    link: {
      label: "Store Wise Deviations"
      url: "/explore/central_projects/price_variance?fields=price_variance.clean_kitchen,price_variance.item_cost,price_variance.deviation&f[price_variance.flag]=0&f[price_variance.clean_kitchen]=-NULL&f[price_variance.deviation]=NOT+NULL&f[price_variance.store_name]=-Dummy+Store&f[price_variance.ingredient_name]={{ value }}&sorts=price_variance.clean_kitchen&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Afalse%2C%22table_theme%22%3A%22unstyled%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Atrue%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22price_variance.item_cost%22%3A%22MAP%22%2C%22price_variance.clean_kitchen%22%3A%22Kitchen%22%7D%2C%22series_cell_visualizations%22%3A%7B%22max_of_deviation%22%3A%7B%22is_active%22%3Atrue%7D%2C%22sum_of_total_value%22%3A%7B%22is_active%22%3Atrue%7D%7D%2C%22conditional_formatting%22%3A%5B%7B%22type%22%3A%22along+a+scale...%22%2C%22value%22%3Anull%2C%22background_color%22%3A%22%2362bad4%22%2C%22font_color%22%3Anull%2C%22color_application%22%3A%7B%22collection_id%22%3A%22test%22%2C%22custom%22%3A%7B%22id%22%3A%2222f40b85-a0eb-9740-6cf8-31dd63a1595f%22%2C%22label%22%3A%22Custom%22%2C%22type%22%3A%22continuous%22%2C%22stops%22%3A%5B%7B%22color%22%3A%22%23F36254%22%2C%22offset%22%3A0%7D%2C%7B%22color%22%3A%22%23FFFFFF%22%2C%22offset%22%3A50%7D%2C%7B%22color%22%3A%22%23ffffff%22%2C%22offset%22%3A100%7D%5D%7D%2C%22options%22%3A%7B%22steps%22%3A5%2C%22constraints%22%3A%7B%22min%22%3A%7B%22type%22%3A%22minimum%22%7D%2C%22mid%22%3A%7B%22type%22%3A%22number%22%2C%22value%22%3A0%7D%2C%22max%22%3A%7B%22type%22%3A%22maximum%22%7D%7D%2C%22mirror%22%3Afalse%2C%22reverse%22%3Atrue%2C%22stepped%22%3Afalse%7D%7D%2C%22bold%22%3Afalse%2C%22italic%22%3Afalse%2C%22strikethrough%22%3Afalse%2C%22fields%22%3A%5B%22price_variance.deviation%22%5D%7D%5D%2C%22series_value_format%22%3A%7B%22price_variance.deviation%22%3A%7B%22name%22%3A%22percent_0%22%2C%22decimals%22%3A%220%22%2C%22format_string%22%3A%22%23%2C%23%230%25%22%2C%22label%22%3A%22Percent+%280%29%22%2C%22label_prefix%22%3A%22Percent%22%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22price_variance.flag%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22price_variance.clean_kitchen%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22price_variance.deviation%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%2C%22price_variance.store_name%22%3A%5B%7B%22type%22%3A%22%21%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Dummy+Store%22%7D%2C%7B%7D%5D%2C%22id%22%3A59%2C%22error%22%3Afalse%7D%5D%2C%22price_variance.sub_category%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Dairy%2CFruits+and+Vegetables%2CGeneral+Supplies%2CGroceries%2CNon+Veg%2CWater%22%7D%2C%7B%7D%5D%2C%22id%22%3A60%2C%22error%22%3Afalse%7D%5D%2C%22price_variance.ingredient_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A61%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22category%22%3A%22measure%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Max+of+Deviation%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3A%22percent_0%22%2C%22based_on%22%3A%22price_variance.deviation%22%2C%22_kind_hint%22%3A%22measure%22%2C%22measure%22%3A%22max_of_deviation%22%2C%22type%22%3A%22max%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22measure%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Total+Value%22%2C%22value_format%22%3A%22%23%22%2C%22value_format_name%22%3Anull%2C%22based_on%22%3A%22price_variance.total_value%22%2C%22_kind_hint%22%3A%22measure%22%2C%22measure%22%3A%22sum_of_total_value%22%2C%22type%22%3A%22sum%22%2C%22_type_hint%22%3A%22number%22%7D%5D"
    }
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: kitchen {
    type: string
    sql: ${TABLE}.kitchen ;;
    }

  dimension: price_date {
    type: string
    sql: ${TABLE}.price_date ;;
  }

  dimension: flag {
    type: number
    sql: ${TABLE}.flag ;;
  }

  dimension: clean_kitchen {
    type: string
    sql: ${TABLE}.clean_kitchen ;;
    link: {
      label: "Ledger"
      url: "/explore/central_projects/inventory_ledger?fields=inventory_ledger.transfer_time,inventory_ledger.movement_type,inventory_ledger.location_name,inventory_ledger.po_number,inventory_ledger.transfer_entity,inventory_ledger.item_name,inventory_ledger.original_item,inventory_ledger.item_code,inventory_ledger.rate,inventory_ledger.qty,inventory_ledger.total_amount&f[inventory_ledger.transfer_time]=NOT+NULL&f[inventory_ledger.location_name]={{ price_variance.store_name._value }}&f[inventory_ledger.item_name]={{ price_variance.ingredient_name._value }}&sorts=inventory_ledger.transfer_time+desc&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%2C%22series_column_widths%22%3A%7B%22inventory_ledger.po_creation_date%22%3A108%2C%22inventory_ledger.transfer_time%22%3A197%7D%7D&filter_config=%7B%22inventory_ledger.transfer_time%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2260%22%2C%22unit%22%3A%22sec%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22inventory_ledger.location_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%2C%22inventory_ledger.item_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%5D%2C%22inventory_ledger.movement_type%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22IN%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D"
    }


  }

  dimension: item_cost {
    type: number
    sql: ${TABLE}.standard_quantity_cost ;;
  }

  dimension: min_price {
    type: number
    sql: ${TABLE}.min_price ;;
  }

  dimension: deviation {
    type: number
    sql: ${TABLE}.deviation ;;
  }

  dimension: wt_deviation {
    type: number
    sql: ${TABLE}.wt_deviation ;;
  }

  dimension: total_value {
    type: number
    sql: ${TABLE}.total_value ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.store ;;
  }

  }
