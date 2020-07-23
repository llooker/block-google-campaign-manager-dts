include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_advertisers.view"

########### PRESENTATION LAYER ###########
view: match_table_advertisers {
  extends: [match_table_advertisers_config]
}

########### CORE LAYER ###########
view: match_table_advertisers_core {
  extension: required
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_advertisers_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

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
