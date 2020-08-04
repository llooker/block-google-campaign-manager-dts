include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_browsers.view"

########### PRESENTATION LAYER ###########
view: match_table_browsers {
  extends: [match_table_browsers_config]
}

########### CORE LAYER ###########
view: match_table_browsers_core {
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_browsers_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: browser_platform {
    type: string
    sql: ${TABLE}.Browser_Platform ;;
  }

  dimension: browser_platform_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Browser_Platform_ID ;;
  }
}
