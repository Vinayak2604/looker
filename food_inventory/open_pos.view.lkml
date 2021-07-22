view: open_pos {
  derived_table: {
    sql: select property,item_code,item_name,sum(subtotal_amount) as open_amount,sum(quantity) as open_qty
from stanza.derived_food_invoice
where (open_flag =1 and expired_po_flag = 0)
and property like '%Store%' or property = 'Manipal'
group by 1,2,3 ;;
  }

  dimension: pk {
    type: string
    sql: concat(${TABLE}.property,${TABLE}.item_code) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
    # primary_key: yes
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
    # primary_key: yes
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: open_amount {
    type: number
    sql: ${TABLE}.open_amount ;;
  }

  dimension: open_qty {
    type: number
    sql: ${TABLE}.open_qty ;;
  }

  }
