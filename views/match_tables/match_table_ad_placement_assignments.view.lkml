include: "//@{CONFIG_PROJECT_NAME}/views/match_tables/match_table_ad_placement_assignments.view"

########### PRESENTATION LAYER ###########
view: match_table_ad_placement_assignments {
  extends: [match_table_ad_placement_assignments_config]
}

########### CORE LAYER ###########
view: match_table_ad_placement_assignments_core {
  extension: required
  sql_table_name: (select * from `@{PROJECT_NAME}.@{DATASET_NAME}.match_table_ad_placement_assignments_@{CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.Ad_ID ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.Placement_ID ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${ad_id},'-',${placement_id}) ;;
  }
}
