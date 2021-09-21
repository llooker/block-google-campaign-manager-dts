include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_activity_types.view"


########### PRESENTATION LAYER ###########
view: match_table_activity_types {
  extends: [match_table_activity_types_config]
}


########### CORE LAYER ###########
view: match_table_activity_types_core {
  extension: required
  sql_table_name: (select * from `@{CONFIG_PROJECT_NAME}.@{DATASET_NAME}.match_table_activity_types_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: activity_group {
    type: string
    sql: ${TABLE}.Activity_Group ;;
  }

  dimension: activity_group_id {
    type: string
    sql: ${TABLE}.Activity_Group_ID ;;
  }

  dimension: activity_type {
    type: string
    sql: ${TABLE}.Activity_Type ;;
  }

  dimension: floodlight_configuration {
    type: string
    sql: ${TABLE}.Floodlight_Configuration ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }

}
