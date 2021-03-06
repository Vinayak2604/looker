view: cac_derived {
  derived_table: {
    sql:
    Select DATE(po_date) as podate,am.zone as zone,am.city as city, am.micromarket as micromarket,am.category_name as Category,am.sub_category_name as Subcategory, sum(po.committed) as committed,sum(po.actual) as actual  from stanza.erp_cac_service_purchase_order po
left join stanza.erp_cac_service_attribute_meta am on po.attribute_meta_uuid = am.uuid
where am.category_name not like '%Discount%'
group by 1,2,3,4,5,6;;
  }

    dimension: city {
      type: string
      sql: ${TABLE}.City ;;
    }

    dimension: micromarket {
      type: string
      sql: ${TABLE}.micromarket ;;
    }

    dimension: zone {
      type: string
      sql: ${TABLE}.zone ;;
    }

    dimension: Category {
      type: string
      sql: ${TABLE}.Category ;;
    }

    dimension: Subcategory {
      type: string
      sql: ${TABLE}.Subcategory ;;
    }

    measure: committed {
      type: number
      sql: sum(${TABLE}.committed)/10^5 ;;
      value_format: "#,##0.0"
    }

    measure: actual {
      type: number
      sql: sum(${TABLE}.actual)/10^5 ;;
      value_format: "#,##0.0"
    }

    dimension_group: podate {
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
      sql: ${TABLE}.podate ;;
    }

  }
