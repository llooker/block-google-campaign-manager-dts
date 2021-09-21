include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_cities.view"

########### PRESENTATION LAYER ###########
view: match_table_cities {
  extends: [match_table_cities_config]
}

########### CORE LAYER ###########
view: match_table_cities_core {
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_cities_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;


  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: city_id {
    type: string
    sql: ${TABLE}.City_ID ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
