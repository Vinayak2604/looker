view: Invoice_details {
  derived_table: {
    sql: select
  ibd.invoice_code,
  case
    when pd.po_type = 'RENTAL'
    or pd.po_type = 'NON_RENTAL'
    or pd.po_type = 'SERVICE_PO' then pvd.vendor_name
  end as Vendor_name,
  DATE(ibd.invoice_date) as invoice_date,
  row_number() over (partition by pd.po_number order by invoice_date) number_of_invoice,
  case when number_of_invoice = 1 then DATE(ibd.invoice_date) end first_invoice_date,
  pd.po_number,
  pd.po_status,
  DATE(pd.po_start_date) as po_start_date,
  DATE(pd.completion_date) po_completion_date,
  DATE(ibd.created_at) as created_at,
  DATE(jj.L1_approval_at) as L1_approval_at,
  DATE(jj.L2_approval_at) as L2_approval_at,
  DATE(jj.L1_reject_at) as L1_reject_at,
  DATE(jj.L2_reject_at) as L2_reject_at,
  COUNT(L1_reject_at) over (partition by pd.po_number) no_of_L1_rejections,
  pd.po_type,
  coalesce((gg.item_base_amount - gg.item_gst),0) as base_amt,
  coalesce((gg.other_fee_base_amount-gg.other_fee_gst),0) as Other_charges,
  (base_amt + Other_charges) as total_amount
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
    cc.invoice_uuid = bb.invoice_uuid
    )as jj
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
        when round((po_fee_gst / po_fee_amount_wo_tax), 2) = 0.18 then 'EIGHTEEN'
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
  and DATE(pd.po_start_date) >= '2021-05-01'
  order by L2_approval_at ;;
  }

  dimension: invoice_code {
    type: string
    sql: ${TABLE}.invoice_code ;;
    primary_key: yes
  }

  dimension: Vendor_name {
    type: string
    sql: ${TABLE}.Vendor_name ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: po_type {
    type: string
    sql: ${TABLE}.po_type ;;
  }

  dimension_group: po_start_date {
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
    sql: ${TABLE}.po_start_date ;;
  }

  dimension_group: invoice_date {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: po_completion_at {
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

  dimension_group: first_invoice_date {
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
    sql: ${TABLE}.first_invoice_date ;;
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

  dimension: base_charges {
    type: number
    sql: ${TABLE}.base_charges ;;
    value_format: "#,##0"
  }

  dimension: other_charges {
    type: number
    sql: ${TABLE}.other_charges ;;
    value_format: "#,##0"
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format: "#,##0"
  }

  dimension: grn_to_first_invoice_date {
    type: number
    sql: case when ${TABLE}.first_invoice_date is not null and ${first_invoice_date_date}>=${po_completion_at_date} then datediff(day,${po_completion_at_date},${first_invoice_date_date}) end ;;
  }

  dimension: first_invoice_date_to_L2_approval {
    type: number
    sql: case when ${L2_approval_at_date} is null and ${L1_reject_at_date} is not null then datediff(day,${first_invoice_date_date},${L2_approval_at_date}) end ;;
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

  dimension: No_of_rejections {
    type: number
    sql: ${TABLE}.no_of_l1_rejections ;;
  }

  measure: weighted_avg_grn_to_first_invoice {
    type: average
    sql: case when ${TABLE}.first_invoice_date is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${grn_to_first_invoice_date})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_first_invoice_to_l2_approval {
    type: average
    sql: case when ${TABLE}.first_invoice_date is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${first_invoice_date_to_L2_approval})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_grn_to_l1_approval {
    type: average
    sql: case when ${grn_to_l1_approval} is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${grn_to_l1_approval})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_approval {
    type: average
    sql: case when ${l1_to_l2_approval} is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${l1_to_l2_approval})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_grn_to_l1_rejection {
    type: average
    sql: case when ${grn_to_l1_rejection} is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${grn_to_l1_rejection})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_rejection {
    type: average
    sql: case when ${l1_to_l2_rejection} is not null and ${TABLE}.total_amount!=0 then (${TABLE}.total_amount*${l1_to_l2_rejection})/(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

}
