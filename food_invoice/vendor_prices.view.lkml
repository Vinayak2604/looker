view: vendor_prices {
  derived_table: {
    sql: select
           vd.company_name ,
           vi.itemuuid ,
           ime.item_name,
           loc.label as city,
           (case when vi.locationwiserate = 0 then vi.vendoritemrate else lri.locationrate end) vendor_rate
          from
          stanza.erp_vendor_vendor_details_redshift vd
          left join
          stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems vi
          on
          vd.id = vi."__hevo_ref_id"
          left join stanza.erp_inventory_service_inventory_item_meta_entity ime
          on
          vi.itemuuid = ime.item_uuid
          left join stanza.erp_vendor_vendor_details_redshift_item_details_itemdetails_vendoritems_locationratelist lri
          on
          vd.id = lri."__hevo_ref_id"
          and vi."__hevo_array_index" = lri."__hevo_array_index"
          left join (
          select
             distinct value,
             label
          from
          stanza.erp_vendor_vendor_details_redshift_item_details_supplylocations_locations)
          loc
          on
          loc.value = lri.locationuuid
          where
             vi.costhead_label = 'OPEX'
            and lri.locationrate is not null
group by
  1,
  2,
  3,
  4,
  5 ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    primary_key: yes
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}.itemuuid ;;
  }

  dimension: vendor_item_rate {
    type: number
    sql: ${TABLE}.vendor_rate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  measure: item_count {
    type: count_distinct
    sql: ${TABLE}.itemuuid ;;
  }

}
