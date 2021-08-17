view: invoice_details {
  derived_table: {
    sql: select
  pid.po_dept,
  ibd.invoice_code,
  case
    when pd.po_type = 'RENTAL'
    or pd.po_type = 'NON_RENTAL'
    or pd.po_type = 'SERVICE_PO' then pvd.vendor_name
  end as Vendor_name,
  DATE(ibd.invoice_date) as invoice_date,
  pd.po_number,
  row_number() over (partition by pd.po_number
order by
  jj.L1_approval_at) row_no,
  pd.po_status,
  DATE(pd.po_start_date) as po_start_date,
  DATE(pd.po_end_date) as po_end_date,
  DATE(ibd.invoice_date) as service_period,
  ibd.doc_url,
  DATE(ibd.created_at) as created_at,
  DATE(jj.L1_approval_at) as L1_approval_at,
  DATE(jj.L2_approval_at) as L2_approval_at,
  DATE(jj.L1_reject_at) as L1_reject_at,
  DATE(jj.L2_reject_at) as L2_reject_at,
  case
    when ibd.invoice_type = 'ADVANCE' then coalesce(ibd.invoice_amt, 0)
    when ibd.invoice_type = 'REGULAR' then coalesce((gg.item_base_amount - gg.item_gst), 0)
  end as base_amt,
  coalesce((gg.other_fee_base_amount-gg.other_fee_gst), 0) as Other_charges,
  (base_amt + Other_charges) as total_amount,
  ibd.invoice_type,
  pd.po_type,
  pd.download_url,
  pp.created_at as sort_by
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
    kk.gst_slab as item_gst_slab,
    dd.gst_slab as other_fee_gst_slab,
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
left join (
  select
    invoice_uuid,
    min(created_at) created_at
  from
    stanza.erp_erp_invoice_invoice_approvals iaa
  where
    new_status = 'PAYMENT_PENDING'
  group by
    invoice_uuid) as pp
on
  pp.invoice_uuid = ibd.uuid
where
  ibd.status = 1
  and po_dept = 'FOOD_OPS'
  and l1_approval_at is not null
  and DATE(pd.po_start_date) >= DATEADD(month,-3,CURRENT_DATE-1)
  --and ibd.invoice_code ='RG_FB_8612'
order by
  pp.created_at ;;
  }

  dimension: po_dept {
    type: string
    sql: ${TABLE}.po_dept ;;
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

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
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

  dimension_group: po_end_date {
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

  dimension_group: service_period {
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
    sql: ${TABLE}.service_period ;;
  }

  dimension: doc_url {
    type: string
    sql: ${TABLE}.doc_url ;;
  }

  dimension_group: created_at {
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

  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
  }

  dimension: po_type {
    type: string
    sql: ${TABLE}.po_type ;;
  }

  dimension_group: payment_pending {
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
    sql: ${TABLE}.sort_by ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: grn_to_l1_approval {
    type: number
    sql: case when ${L1_approval_at_date} is not null and ${L1_reject_at_date} is null then datediff(day,${created_at_date},${L1_approval_at_date}) end ;;
  }

  dimension: l1_to_l2_approval {
    type: number
    sql: case when ${L2_approval_at_date} is not null and ${L2_reject_at_date} is null then datediff(day,${L1_approval_at_date},${L2_approval_at_date}) end ;;
  }

  dimension: grn_to_l1_rejection {
    type: number
    sql: case when ${L2_approval_at_date} is null and ${L1_reject_at_date} is not null then datediff(day,${created_at_date},${L1_reject_at_date}) end ;;
  }

  dimension: l1_to_l2_rejection {
    type: number
    sql: case when ${L2_reject_at_date} is not null then datediff(day,${L1_approval_at_date},${L2_reject_at_date}) end ;;
  }

  measure: weighted_avg_grn_to_l1_approval {
    type: number
    sql: case when ${grn_to_l1_approval} is not null then SUM(${TABLE}.total_amount*${grn_to_l1_approval})/SUM(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_approval {
    type: number
    sql: case when ${l1_to_l2_approval} is not null then SUM(${TABLE}.total_amount*${l1_to_l2_approval})/SUM(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_grn_to_l1_rejection {
    type: number
    sql: case when ${grn_to_l1_rejection} is not null then SUM(${TABLE}.total_amount*${grn_to_l1_rejection})/SUM(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

  measure: weighted_avg_l1_to_l2_rejection {
    type: number
    sql: case when ${l1_to_l2_rejection} is not null then SUM(${TABLE}.total_amount*${l1_to_l2_rejection})/SUM(${TABLE}.total_amount) end ;;
    value_format: "0.00"
  }

}
