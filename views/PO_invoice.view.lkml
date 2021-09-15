view: po_invoice {
  derived_table: {
    sql: select
  distinct pd.po_number po_number,
  ibd.invoice_code,
  case
    when pd.po_type = 'RENTAL'
    or pd.po_type = 'NON_RENTAL'
    or pd.po_type = 'SERVICE_PO' then pvd.vendor_name
  end as Vendor_name,
  DATE(ibd.invoice_date) as invoice_date,
  pd.po_status,
  jj.new_status invoice_status,
  pd.po_subtotal_amount,
  (ptid.unit_rate_rent_per_month*ptid.quantity) grn_amount,
  DATE(pd.created_at) po_start_date,
  DATE(pd.completion_date) po_completion_date,
  DATE(ibd.created_at) as created_at,
  case when DATE(ibd.created_at)>='2021-05-01' then 1 else 0 end invoice_done_flag,
  DATE(jj.L1_approval_at) as L1_approval_at,
  DATE(jj.L2_approval_at) as L2_approval_at,
  DATE(jj.L1_reject_at) as L1_reject_at,
  DATE(jj.L2_reject_at) as L2_reject_at,
  case when po_status not in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') then datediff(day,po_start_date,current_date)
       when po_status in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') and ibd.created_at is null then datediff(day,po_completion_date,current_date)
       when (ibd.created_at is not null and L1_approval_at is null) or (L1_reject_at is not null) or (L2_reject_at is not null) then datediff(day,ibd.created_at ,current_date)
       when L1_approval_at is not null and L1_reject_at is null and L2_approval_at is null then datediff(day,L1_approval_at,current_date)
       when L2_approval_at is not null and L2_reject_at is null then 0 end aging,
  coalesce((gg.item_base_amount - gg.item_gst),0) as base_amount,
  COALESCE((gg.other_fee_base_amount-gg.other_fee_gst),0) as Other_charges,
  (base_amount+Other_charges) invoice_amount
from
  stanza.erp_purchase_order_po_details pd
left join stanza.erp_erp_invoice_po_invoice_details pid
on
  pid.po_uuid = pd.uuid
left join stanza.erp_purchase_order_po_to_item_details as ptid
on pd.uuid=ptid.po_to_uuid
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
    cc.new_status,
    mm.L1_approval_at,
    nn.L2_approval_at,
    bb.L2_reject_at,
    dd.L1_reject_at
  from
    (
    select
      distinct iaa.invoice_uuid,
      iaa.new_status
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
  pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
order by
  po_number ;;
  }

  dimension: invoice_code {
    type: string
    sql: ${TABLE}.invoice_code ;;
  }

  dimension: Vendor_name {
    type: string
    sql: ${TABLE}.Vendor_name ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
    primary_key: yes
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: invoice_status {
    type: string
    sql: ${TABLE}.invoice_status ;;
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

  dimension: aging {
    type: number
    sql: ${TABLE}.aging ;;
  }

  dimension: base_amount {
    type: number
    sql: ${TABLE}.base_amount ;;
    value_format: "#,##0"
  }

  dimension: other_charges {
    type: number
    sql: ${TABLE}.other_charges ;;
    value_format: "#,##0"
  }

  dimension: invoice_amount {
    type: number
    sql: ${TABLE}.invoice_amount ;;
    value_format: "#,##0"
  }

  dimension: po_amount {
    type: number
    sql: ${TABLE}.po_subtotal_amount ;;
    value_format: "#,##0"
  }

  dimension: grn_amount {
    type: number
    sql: ${TABLE}.grn_amount ;;
    value_format: "#,##0"
  }

  dimension: invoice_done_flag {
    type: number
    sql: ${TABLE}.invoice_done_flag ;;
  }

  dimension: grn_to_first_invoice_date {
    type: number
    sql: case when ${TABLE}.first_invoice_date is not null and ${first_invoice_date_date}>=${po_completion_at_date} then datediff(day,${po_completion_at_date},${first_invoice_date_date}) end ;;
  }

  dimension: first_invoice_date_to_L2_approval {
    type: number
    sql: case when ${L2_approval_at_date} is not null and ${L2_reject_at_date} is null then datediff(day,${first_invoice_date_date},${L2_approval_at_date}) end ;;
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

  measure: distinct_po{
    type: count_distinct
    sql: case when ${L1_reject_at_date} is null and ${L2_reject_at_date} is null then ${TABLE}.po_number end ;;
  }

  measure: total_po_pending {
    type: number
    sql: ${distinct_po} - ${L1_to_L2_approved_invoice} ;;
  }

  measure: grn_pending {
    type:  count_distinct
    sql: case when ${po_status} not in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') then ${TABLE}.po_number end ;;
  }

  measure: grn_to_invoice_pending {
    type:  count_distinct
    sql: case when ${po_status} in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') and ${invoice_created_at_date} is null then ${TABLE}.po_number end ;;
  }

  measure: invoice_to_L1_pending {
    type:  count_distinct
    sql: case when ${invoice_created_at_date} is not null and ${L1_approval_at_date} is null then ${TABLE}.po_number end ;;
  }

  measure: L1_to_L2_pending {
    type:  count_distinct
    sql: case when ${L1_approval_at_date} is not null and ${L1_reject_at_date} is null and ${L2_approval_at_date} is null then ${TABLE}.po_number end ;;
  }

  measure: L1_to_L2_approved_invoice {
    type:  count_distinct
    sql: case when ${L2_reject_at_date} is null and ${L2_approval_at_date} is not null then ${TABLE}.po_number end ;;
  }
}
