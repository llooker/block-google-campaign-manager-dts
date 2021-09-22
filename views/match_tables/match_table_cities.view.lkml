view: match_table_cities {
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
