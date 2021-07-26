view: vendor_prices {
  derived_table: {
    sql: select vd.company_name ,vd.payment_currency ,vd.vendor_code ,vd.vendor_type ,vd.gen_credit_period ,vd.adv_credit_period ,vd.ret_credit_period ,
vd.payment_terms ,vi.itemcode ,vi.itemuuid ,vi.vendoritemrate,lri.locationrate ,loc.label as city
FROM stanza.erp_vendor_vendor_details_redshift vd
left join stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems vi
on vd.id =vi."__hevo_ref_id"
left join stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems_locationratelist lri
on vd.id = lri."__hevo_ref_id" and vi."__hevo_array_index" =lri."__hevo_array_index"
left join (select distinct value,label
       from stanza.erp_vendor_vendor_details_redshift_item_details_supplylocations_locations)
       loc on loc.value = lri.locationuuid
where vi.costhead_label ='OPEX' ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: payment_currency {
    type: string
    sql: ${TABLE}.payment_currency ;;
  }

  dimension: vendor_code {
    type: string
    sql: ${TABLE}.vendor_code ;;
  }

  dimension: vendor_type {
    type: string
    sql: ${TABLE}.vendor_type ;;
  }

  dimension: general_credit_period {
    type: string
    sql: ${TABLE}.gen_credit_period ;;
  }

  dimension: advance_credit_period {
    type: string
    sql: ${TABLE}.adv_credit_period ;;
  }

  dimension: retention_credit_period {
    type: string
    sql: ${TABLE}.ret_credit_period ;;
  }

  dimension: payment_terms {
    type: string
    sql: ${TABLE}.payment_terms ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.itemcode ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.itemuuid ;;
  }

  dimension: vendor_item_rate {
    type: number
    sql: ${TABLE}.vendoritemrate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

 }
