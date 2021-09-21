view: l1_rejected_pos {
  derived_table: {
    sql: WITH po_invoice AS (select
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
  ptid.item_sub_category_label item_sub_category_label,
  jj.id,
  jj.invoice_uuid,
  DATE(pd.created_at) po_start_date,
  DATE(pd.updated_at) po_completion_date,
  DATE(ibd.created_at) as created_at,
  DATE(jj.L1_approval_at) as L1_approval_at,
  DATE(jj.L2_approval_at) as L2_approval_at,
  DATE(jj.L1_reject_at) as L1_reject_at,
  DATE(jj.L2_reject_at) as L2_reject_at,
  case when po_status not in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') then datediff(day,po_start_date,po_completion_date)
       when po_status in ('GSRI_COMPLETED','APPROVED','SHORTCLOSED') and ibd.created_at is null then datediff(day,po_completion_date,current_date)
       when (ibd.created_at is not null and L1_approval_at is null) then datediff(day,ibd.created_at ,current_date)
       when L1_approval_at is not null and L1_reject_at is not null then datediff(day,ibd.created_at,L1_reject_at)
       when L1_approval_at is not null and L1_reject_at is null and L2_approval_at is null then datediff(day,L1_approval_at,current_date)
       when L2_approval_at is not null and L2_reject_at is not null then datediff(day,ibd.created_at,L2_reject_at)
       when L2_approval_at is not null and L2_reject_at is null then 0 end ageing
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
    cc.id,
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
      iaa.id,
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
where
  pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
  and (ptid.item_sub_category_label in ('Fruits and Vegetables','Dairy','Non Veg','Groceries','General Supplies','LPG','Packaging')
     or ptid.item_sub_category_label like '%direct food expense%')
order by
  po_number )
SELECT
*
FROM po_invoice
where id in (select id from (select po_number,MAX(new_status) status,max(iaa.id) id from stanza.erp_purchase_order_po_details as pd join stanza.erp_erp_invoice_invoice_basic_details ibd
on
  pd.uuid = ibd.po_uuid
join stanza.erp_erp_invoice_invoice_approvals iaa on ibd.uuid=iaa.invoice_uuid
  and pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
  group by 1)) and invoice_status = 'L1_REJECTED'
  and po_number not in (with invoice_created_after_rejection as (WITH po_invoice AS (select
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
  DATE(pd.created_at) po_start_date,
  DATE(pd.updated_at) po_completion_date,
  DATE(ibd.created_at) as created_at
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
(select
      distinct iaa.invoice_uuid,
      iaa.new_status
    from
      stanza.erp_erp_invoice_invoice_approvals iaa
    where
      iaa.__hevo__marked_deleted is false)as jj
on
  jj.invoice_uuid = ibd.uuid
where
  pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
  and (ptid.item_sub_category_label in ('Fruits and Vegetables','Dairy','Non Veg','Groceries','General Supplies','LPG','Packaging')
     or ptid.item_sub_category_label like '%direct food expense%')
order by
  po_number )
SELECT
    *
FROM po_invoice
WHERE ((( po_invoice.created_at  ) IS NOT NULL))
and po_number in (WITH l1_rejected_pos AS (WITH po_invoice AS (select
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
  jj.id,
  jj.invoice_uuid,
  DATE(pd.created_at) po_start_date,
  DATE(pd.updated_at) po_completion_date,
  DATE(ibd.created_at) as created_at
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
(select
      distinct iaa.invoice_uuid,
      iaa.id,
      iaa.new_status
    from
      stanza.erp_erp_invoice_invoice_approvals iaa
    where
      iaa.__hevo__marked_deleted is false)as jj
on
  jj.invoice_uuid = ibd.uuid
where
  pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
  and (ptid.item_sub_category_label in ('Fruits and Vegetables','Dairy','Non Veg','Groceries','General Supplies','LPG','Packaging')
     or ptid.item_sub_category_label like '%direct food expense%')
order by
  po_number )
SELECT
*
FROM po_invoice
where id in (select id from (select po_number,MAX(new_status) status,max(iaa.id) id from stanza.erp_purchase_order_po_details as pd join stanza.erp_erp_invoice_invoice_basic_details ibd
on
  pd.uuid = ibd.po_uuid
join stanza.erp_erp_invoice_invoice_approvals iaa on ibd.uuid=iaa.invoice_uuid
  and pd.status = 1
  and pd.mapped_department = 'FOOD_OPS'
  and DATE(pd.created_at) >= '2021-05-01'
  and pd.po_status!='IN_DRAFT'
  and po_number not like '%TOFB%'
  group by 1)) and invoice_status = 'L1_REJECTED' )
SELECT
    DISTINCT l1_rejected_pos.po_number
FROM l1_rejected_pos))
select distinct po_number from invoice_created_after_rejection where invoice_status is null) ;;
  }

  dimension: invoice_code {
    type: string
    sql: ${TABLE}.invoice_code ;;
  }

  dimension: Vendor_name_t {
    type: string
    sql: ${TABLE}.Vendor_name ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.Vendor_name ;;##filter
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}.po_number ;;
    primary_key: yes
  }

  dimension: po_status_t {
    type: string
    sql: ${TABLE}.po_status ;;
  }

  dimension: Po_status {
    type: string
    sql: ${TABLE}.po_status ;;##filter
  }

  dimension: invoice_status_t {
    type: string
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: Invoice_status {
    type: string
    sql: ${TABLE}.invoice_status ;;##filter
  }

  dimension: item_subcategory_t {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;
  }

  dimension: item_subcategory {
    type: string
    sql: ${TABLE}.item_sub_category_label ;;##filter
  }

  dimension: po_type {
    type: string
    sql: ${TABLE}.po_type ;;
  }

  dimension_group: po_start_date_t {
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

  dimension_group: po_date_range {
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
    sql: ${TABLE}.po_start_date ;;##filter
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
    sql: ${TABLE}.created_at ;;#filter
  }

  dimension_group: invoice_created_at_t {
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

  dimension: ageing_t {
    type: number
    sql: ${TABLE}.ageing ;;
  }

  dimension: Ageing {
    type: number
    sql: ${TABLE}.ageing ;;#filter
  }

  measure: distinct_po{
    type: count_distinct
    sql: ${TABLE}.po_number ;;
  }
}
