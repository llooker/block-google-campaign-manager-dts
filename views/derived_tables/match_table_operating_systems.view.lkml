view: match_table_operating_systems {
# De-Duping
  derived_table: {
    sql: SELECT
          CAST(Operating_System_ID AS INT64) AS Operating_System_ID_key,
          Operating_System
        FROM `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_operating_systems_@{CAMPAIGN_MANAGER_ID}`
        GROUP BY Operating_System_ID_key,Operating_System ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.Operating_System ;;
  }

  dimension: operating_system_id_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Operating_System_ID_key ;;
  }

}
