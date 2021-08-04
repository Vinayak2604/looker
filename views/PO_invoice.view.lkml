view: po_invoice {
  derived_table: {
    sql: select
    m.location_name,
  c.item_name,
  pvd.vendor_name,
  p.po_number,
  (t.effective_price*t.quantity) invoice
from
  stanza.erp_inventory_service_inventory_item_meta_entity c
left join stanza.erp_inventory_service_inventory_movement_tracker t on
  t.item_uuid = c.item_uuid
left join stanza.erp_purchase_order_po_details p on
  p.uuid = t.po_to_uuid
left join stanza.erp_purchase_order_po_to_vendor_details pvd on
  pvd.po_to_uuid = p.uuid
left join stanza.erp_transformation_master_address_book m on
  m.uuid = t.address_uuid
where
  c.item_dept = 'FOOD_OPS'
  and t.event_type = 'IN'
  and (m.location_name like '%Store%'
    or m.location_name = 'Manipal')
  and c.item_name like '%Meal%'
order by
  t.updated_at desc ;;
  }
  dimension: po_number {
    type: string
    primary_key: yes
    sql: ${TABLE}.po_number ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      url: "/explore/central_projects/po_invoice?fields=po_invoice.po_number,po_invoice.invoice&f[po_invoice.vendor_name]={{ value }}&sorts=po_invoice.invoice+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_column%22%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%7D&origin=share-expanded"
      label: "PO Wise Invoice"
      }
  }
  measure: invoice {
    type: sum
    sql: ${TABLE}.invoice ;;
  }
}
