view: Vendor_details {
  derived_table: {
    sql: select
  a.*,
  b.invoice_code,
  b.invoice_created_at,
  b.L1_approval_at,
  b.L2_approval_at,
  b.L1_reject_at,
  b.L2_reject_at
from
  (
  select
    a.*,
    b.gsri_date,
    b.consumption_value
  from
    (
    select
      *,
      lead(po_created_at) over (
    order by
      po_created_at) as next_po_date
    from
      stanza.derived_food_invoice dfi
    where gsri_done_flag = 1) as a
  left join
(
    select
      m.location_uuid uuid,
      m.location_name location_name,
      c.item_sub_category_label,
      DATE(t.updated_at) gsri_date,
      sum(t.effective_price * t.quantity) consumption_value,
      sum(t.quantity) qty
    from
      stanza.erp_inventory_service_inventory_item_meta_entity c
    left join stanza.erp_inventory_service_inventory_movement_tracker
      t on
      t.item_uuid = c.item_uuid
    left join stanza.erp_purchase_order_po_details
      p on
      p.uuid = t.po_to_uuid
    left join stanza.erp_transformation_master_address_book
      m on
      m.uuid = t.address_uuid
    where
      c.item_dept = 'FOOD_OPS'
      and c.item_name not like 'Meal%'
      and (t.event_type = 'OUT'
        and (location_name like '%Store%'
          or location_name like '%Manipal%'))
      and (p.food_cost_type = 'Normal B2C'
        or p.food_cost_type = 'Normal' )
      and c.__hevo__marked_deleted = false
      and t.__hevo__marked_deleted = false
      and m.__hevo__marked_deleted = false
      and p.__hevo__marked_deleted = false
    group by
      1,
      2,
      3,
      4) as b
  on
    DATE(a.po_created_at)<= b.gsri_date
    and DATE(a.next_po_date)>b.gsri_date
    and a.property = b.location_name
    and a.item_sub_category_label = b.item_sub_category_label) as a
left join
(
  select
    ibd.invoice_code,
    case
      when pd.po_type = 'RENTAL'
        or pd.po_type = 'NON_RENTAL'
        or pd.po_type = 'SERVICE_PO' then pvd.vendor_name
      end as Vendor_name,
      DATE(ibd.invoice_date) as invoice_date,
      pd.po_number,
      pd.po_status,
      DATE(pd.po_start_date) as po_start_date,
      DATE(ibd.created_at) as invoice_created_at,
      DATE(jj.L1_approval_at) as L1_approval_at,
      DATE(jj.L2_approval_at) as L2_approval_at,
      DATE(jj.L1_reject_at) as L1_reject_at,
      DATE(jj.L2_reject_at) as L2_reject_at,
      case
        when ibd.invoice_type = 'REGULAR' then coalesce((gg.item_base_amount - gg.item_gst), 0)
      end as base_amt,
      coalesce((gg.other_fee_base_amount-gg.other_fee_gst), 0) as Other_charges,
      (base_amt + Other_charges) as total_amount,
      pd.po_type
    from
      stanza.erp_erp_invoice_po_invoice_details pid
    left join stanza.erp_purchase_order_po_details pd
on
      pid.po_uuid = pd.uuid
    left join stanza.erp_erp_invoice_invoice_basic_details ibd
on
      pd.uuid = ibd.po_uuid
    left join stanza.erp_purchase_order_po_to_vendor_details pvd
on
      pd.uuid = pvd.po_to_uuid
    left join
(
      select
        cc.invoice_uuid,
        mm.L1_approval_at,
        nn.L2_approval_at,
        bb.L2_reject_at,
        dd.L1_reject_at
      from
        (
        select
          distinct iaa.invoice_uuid
        from
          stanza.erp_erp_invoice_invoice_approvals iaa
        where
          iaa.__hevo__marked_deleted is false) as cc
      left join
(
        select
          distinct iaa.invoice_uuid,
          iaa.created_at as L1_approval_at
        from
          stanza.erp_erp_invoice_invoice_approvals iaa
        where
          approval_level = 1
          and iaa.__hevo__marked_deleted is false
)as mm
on
        cc.invoice_uuid = mm.invoice_uuid
      left join
(
        select
          distinct iaa.invoice_uuid,
          iaa.created_at as L2_approval_at
        from
          stanza.erp_erp_invoice_invoice_approvals iaa
        where
          approval_level = 2
          and iaa.__hevo__marked_deleted is false
        order by
          iaa.invoice_uuid)as nn
on
        cc.invoice_uuid = nn.invoice_uuid
      left join
(
        select
          distinct iaa.invoice_uuid,
          iaa.created_at as L1_reject_at
        from
          stanza.erp_erp_invoice_invoice_approvals iaa
        where
          approval_level = 1
          and iaa.is_reject = 1
          and iaa.__hevo__marked_deleted is false
)as dd
on
        cc.invoice_uuid = dd.invoice_uuid
      left join
(
        select
          distinct iaa.invoice_uuid,
          iaa.created_at as L2_reject_at
        from
          stanza.erp_erp_invoice_invoice_approvals iaa
        where
          approval_level = 2
          and iaa.is_reject = 1
          and iaa.__hevo__marked_deleted is false
        order by
          iaa.invoice_uuid)as bb
on
        cc.invoice_uuid = bb.invoice_uuid)as jj
on
      jj.invoice_uuid = ibd.uuid
    left join(
      select
        kk.invoice_uuid,
        kk.item_gst,
        dd.other_fee_gst,
        kk.item_base_amount,
        dd.other_fee_base_amount
      from
        (
        select
          invoice_uuid,
          gst_slab,
          round(Sum(item_total-(item_total /(1 +(coalesce(gst_pct, 0)/ 100)))), 2) as item_gst,
          sum(item_total) as item_base_amount
        from
          stanza.erp_erp_invoice_invoice_item_details ed
        where
          ed.__hevo__marked_deleted is false
        group by
          invoice_uuid,
          gst_slab)as kk
      left join
(
        select
          invoice_uuid,
          case
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0 then 'ZERO'
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0.05 then 'FIVE'
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0.12 then 'TWELVE'
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0.14 then 'FOURTEEN'
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) between 0.17 and 0.19 then 'EIGHTEEN'
            when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0.28 then 'TWENTY_EIGHT'
            else 'NA'
          end as gst_slab,
          round(Sum(invoiced_other_fee-(invoiced_other_fee /(1 +(coalesce((po_fee_gst / po_fee_amount_wo_tax), 0))))), 2) as other_fee_gst,
          sum(invoiced_other_fee) as other_fee_base_amount
        from
          stanza.erp_erp_invoice_invoice_fee_details ed
        where
          ed.__hevo__marked_deleted is false
        group by
          invoice_uuid,
          gst_slab)as dd
on
        kk.invoice_uuid = dd.invoice_uuid
        and kk.gst_slab = dd.gst_slab) as gg
on
      gg.invoice_uuid = ibd.uuid
    left join stanza.erp_transformation_master_states tm
on
      tm.uuid = pvd.gst_state
    where
      ibd.status = 1
      and po_dept = 'FOOD_OPS'
      and l1_approval_at is not null
      --and ibd.invoice_code ='RG_FB_8612'
    order by
      L2_reject_at) as b on
  a.po_number = b.po_number ;;
  }

  dimension: cancelled_flag {
    type: number
    sql: ${TABLE}.cancelled_flag ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: expired_po_flag {
    type: number
    sql: ${TABLE}.expired_po_flag ;;
  }

  dimension: gsri_done_flag {
    type: number
    sql: ${TABLE}.gsri_done_flag ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: item_category_label {
    type: string
    sql: ${TABLE}.item_category_label ;;
  }

  dimension: item_sub_category_label {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.item_uuid ;;
  }

  dimension: open_flag {
    type: number
    sql: ${TABLE}.open_flag ;;
  }

  dimension: GSRI_value {
    type: number
    sql: ${TABLE}.consumption_value ;;
  }

  dimension_group: GSRI_date {
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
    sql: ${TABLE}.gsri_date ;;
  }

  dimension_group: po_completion {
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
    sql: ${TABLE}.po_completion_date ;;
  }

  dimension_group: po_created {
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
    sql: ${TABLE}.po_created_at ;;
  }

  dimension_group: po_end {
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
    sql: ${TABLE}.po_end_date ;;
  }

  dimension: po_expiry_days {
    type: number
    sql: ${TABLE}.po_expiry_days ;;
  }

  dimension: po_id {
    type: number
    sql: ${TABLE}.po_id ;;
    primary_key: yes
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: scope_of_work {
    type: string
    sql: ${TABLE}.scope_of_work ;;
  }

  dimension: subtotal_amount {
    type: number
    sql: ${TABLE}.subtotal_amount ;;
    value_format: "#,##0"
  }

  dimension: time_taken {
    type: number
    sql: case when po_completion_date is not null then datediff(day,po_created_at,po_completion_date) end ;;
  }

  dimension: unit_rate_rent_per_month {
    type: number
    sql: ${TABLE}.unit_rate_rent_per_month ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
    link: {
      url: "/explore/central_projects/derived_food_invoice?fields=derived_food_invoice.item_count,derived_food_invoice.item_sub_category_label&f[derived_food_invoice.vendor_name]={{ value }}&f[derived_food_invoice.gsri_done_flag]=1&f[derived_food_invoice.po_created_date]=3+months&sorts=derived_food_invoice.item_count+desc&limit=500&vis=%7B%7D&filter_config=%7B%22derived_food_invoice.gsri_done_flag%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22derived_food_invoice.po_created_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%223%22%2C%22unit%22%3A%22mo%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_subtotal_amount%22%2C%22based_on%22%3A%22derived_food_invoice.subtotal_amount%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Subtotal+Amount%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22max_of_total_consumption%22%2C%22based_on%22%3A%22consumption_in_kitchen.total_consumption%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Max+of+Total+Consumption%22%2C%22type%22%3A%22max%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22category%22%3A%22table_calculation%22%2C%22expression%22%3A%22round%28%28%24%7Bsum_of_subtotal_amount%7D%2F%24%7Bmax_of_total_consumption%7D%29%2A100%2C2%29%22%2C%22label%22%3A%22%25age+Contribution%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22measure%22%2C%22table_calculation%22%3A%22age_contribution%22%2C%22_type_hint%22%3A%22number%22%2C%22is_disabled%22%3Atrue%7D%5D&origin=share-expanded"
      label: "Items"
    }
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.item_name ;;
  }

  measure: item_subcategory_count {
    type: count_distinct
    sql: ${TABLE}.item_sub_category_label ;;
  }

  measure: city_count {
    type: count_distinct
    sql: ${TABLE}.city_name ;;
  }

  measure: distinct_po {
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }

  measure: weighted_avg_po_to_grn_time {
    type: average
    sql: case when ${time_taken} is not null then (${TABLE}.subtotal_amount*${time_taken})/(${TABLE}.subtotal_amount) end ;;
    value_format: "0.00"
  }

  dimension: weighted_avg_item_rate {
    type: number
    sql: (${TABLE}.unit_rate_rent_per_month*${TABLE}.quantity)/(${TABLE}.quantity) ;;
    value_format: "0.00"
  }

  dimension_group: invoice_created_at {
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
    sql: ${TABLE}.invoice_created_at ;;
  }

  dimension_group: L1_approval_at {
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
    sql: ${TABLE}.L1_approval_at ;;
  }

  dimension_group: L2_approval_at {
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
    sql: ${TABLE}.L2_approval_at ;;
  }

  dimension_group: L1_reject_at {
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
    sql: ${TABLE}.L1_reject_at ;;
  }

  dimension_group: L2_reject_at {
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
    sql: ${TABLE}.L2_reject_at ;;
  }

  dimension: grn_to_l1_approval {
    type: number
    sql: case when ${L1_approval_at_date} is not null and ${L1_reject_at_date} is null then datediff(day,${invoice_created_at_date},${L1_approval_at_date}) end ;;
  }

  dimension: l1_to_l2_approval {
    type: number
    sql: case when ${L2_approval_at_date} is not null and ${L2_reject_at_date} is null then datediff(day,${L1_approval_at_date},${L2_approval_at_date}) end ;;
  }

  dimension: grn_to_l1_rejection {
    type: number
    sql: case when ${L2_approval_at_date} is null and ${L1_reject_at_date} is not null then datediff(day,${invoice_created_at_date},${L1_reject_at_date}) end ;;
  }

  dimension: l1_to_l2_rejection {
    type: number
    sql: case when ${L2_reject_at_date} is not null then datediff(day,${L1_approval_at_date},${L2_reject_at_date}) end ;;
  }

  measure: weighted_avg_grn_to_l1_approval {
    type: average
    sql: case when ${grn_to_l1_approval} is not null then (${TABLE}.total_amount*${grn_to_l1_approval})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_approval {
    type: average
    sql: case when ${l1_to_l2_approval} is not null then (${TABLE}.total_amount*${l1_to_l2_approval})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_grn_to_l1_rejection {
    type: average
    sql: case when ${grn_to_l1_rejection} is not null then (${TABLE}.total_amount*${grn_to_l1_rejection})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_rejection {
    type: average
    sql: case when ${l1_to_l2_rejection} is not null then (${TABLE}.total_amount*${l1_to_l2_rejection})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

}
