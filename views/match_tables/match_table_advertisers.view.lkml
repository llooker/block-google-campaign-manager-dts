view: match_table_advertisers {
  sql_table_name: (select * from `db-platform-sol.Comcast8667.match_table_advertisers_8667` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.Advertiser ;;
  }

  dimension: advertiser_group {
    type: string
    sql: ${TABLE}.Advertiser_Group ;;
  }

  dimension: advertiser_group_id {
    type: string
    sql: ${TABLE}.Advertiser_Group_ID ;;
  }

  dimension: advertiser_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: floodlight_configuration {
    type: string
    sql: ${TABLE}.Floodlight_Configuration ;;
  }
}
